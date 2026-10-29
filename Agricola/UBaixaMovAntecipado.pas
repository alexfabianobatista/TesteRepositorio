unit UBaixaMovAntecipado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, Grids, DBGrids, Buttons, DBCtrls;

type
  TFBaixaMovAntecipado = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    MEBaixa: TMaskEdit;
    Label1: TLabel;
    DSContratoMovAnt_Aberto: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DSContratoVendCons: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DSContratoMovVend_Mov_Ant: TDataSource;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BtConsProduto: TBitBtn;
    EdProduto: TEdit;
    BitBtn3: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure GravaMovVend(pContrVend:Integer; pCodProd,Qtde:Real);
    procedure AjustaSaldoCV(pContrVend:Integer; pValor:Real);
    procedure AjustaSaldoCC(pContrato:Integer; pValor:Real);
  public
    { Public declarations }
  end;

var
  FBaixaMovAntecipado: TFBaixaMovAntecipado;

implementation

uses Ucontrato_cl, UOracle_cl, UProdutoCons, UProduto_cl, UUsuario_cl;

{$R *.DFM}

procedure TFBaixaMovAntecipado.SpeedButton1Click(Sender: TObject);
var
 Qtde, QtdeBaixar:Real;
begin
  DMContrato.QContrato_VendMov.Close;
  DMContrato.QContrato_VendMov.Open;
  if Trim(MEBaixa.Text)<>'' then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoMovAnt_AbertoCOD_FILIAL.Text),'AGRICOLA');
      Qtde:=StrToFloat(MEBaixa.text);
      if (Qtde <= DMContrato.QContratoMovAnt_AbertoQTDE_SALDO.Value) and (DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value>0) then
        begin
          if Qtde >= DMContrato.QContrato_VendConsVAL_SALDO.Value then
            begin
              QtdeBaixar := DMContrato.QContrato_VendConsVAL_SALDO.Value;
            end
          else
            begin
               QtdeBaixar := Qtde;
            end;
          Try
            GravaMovVend(DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value,
                         DmContrato.QContratoMovAnt_AbertoCod_produto.Value,QtdeBaixar);
            AjustaSaldoCV(DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value,QtdeBaixar);
            AjustaSaldoCC(DMCOntrato.QContratoMovAnt_AbertoCOD_CONTRATO.Value,QtdeBaixar);
            DMContrato.QContratoMovAnt_Aberto.Close;
            DMContrato.QContratoMovAnt_Aberto.Open;
            DMContrato.QContrato_VendCons.Close;
            DMContrato.QContrato_VendCons.Open;
          except
            DMContrato.QContrato_VendMov.Cancel;
            DMContrato.QContrato_Vend.Cancel;
            Raise Exception.Create('Erro ao  tentar incluir Movimento no contrato de venda');
          end;
        end
      else
        ShowMessage('Erro! A Qtde. da Baixa é superior ao valor do Contrato.'+#13+
                    'ou não existem Contratos de Venda disponíveis a serem baixados.');
    end;
end;

procedure TFBaixaMovAntecipado.BitBtn1Click(Sender: TObject);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TFBaixaMovAntecipado.BitBtn2Click(Sender: TObject);
begin
  DMOracle.DBCemapa.RollBack;
end;

procedure TFBaixaMovAntecipado.GravaMovVend(pContrVend:Integer; pCodProd,Qtde: Real);
var
   Embalagem, ValorTot:Real;
begin
  with DMContrato do
    begin
      DMContrato.QContrato_Vend.Close;
      DMContrato.QContrato_Vend.SetVariable('PK',pContrVend);
      DMContrato.QContrato_Vend.Open;
      QContrato_VendMov.Insert;
      QContrato_VendMovCOD_CONTRATO_VEND.Value:=pContrVend;
      QContrato_VendMovDATA.Value:=DMOracle.DataServ;
      QContrato_VendMovQT_QUANTIDADE.Value:= Qtde;
      Embalagem:=StrToFloat(DMOracle.Buscanome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(pCodProd)));
      ValorTot:=QContratoMovAnt_AbertoQT_Quantidade.Value*QContratoMovAnt_AbertoPreco.Value/Embalagem;
      QContrato_VendMovVAL_MOVIMENTO.Value:= QContrato_VendMovQT_QUANTIDADE.Value*ValorTot/DMContrato.QContratoMovAnt_AbertoQT_QUANTIDADE.Value;
      QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pelo Contrato de compra Nr.'+QContratoMovAnt_AbertoNum_Contrato.text;
      QContrato_VendMovCOD_CONTRATO_MOV.Value:=QContratoMovAnt_AbertoCOD_CONTRATO.Value;
      QContrato_VendMov.Post;
    end;
end;

procedure TFBaixaMovAntecipado.AjustaSaldoCV(pContrVend:Integer; pValor:Real);
begin
  If DMContrato.QContrato_VendCod_Contrato_Vend.Value <> pContrVend Then
  Begin
    DMContrato.QContrato_Vend.Close;
    DMContrato.QContrato_Vend.SetVariable('PK',pContrVend);
    DMContrato.QContrato_Vend.Open;
  End;  
  DMContrato.QContrato_Vend.Edit;
  DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value - pValor;
  DMContrato.QContrato_Vend.Post;
  MEBaixa.Clear;
end;

procedure TFBaixaMovAntecipado.AjustaSaldoCC(pContrato:Integer; pValor: Real);
begin
 DMContrato.QContrato.Close;
 DMContrato.QContrato.SetVariable('PK',pContrato);
 DMContrato.QContrato.Open;
 DMContrato.QContrato.edit;
 DMContrato.QContratoQtde_Saldo.Value:=DMContrato.QContratoQtde_Saldo.Value - pValor;
 DMContrato.QContrato.Post;
end;

procedure TFBaixaMovAntecipado.BtConsProdutoClick(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
   Begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     EdProduto.Text := DMProduto.QProdutoConsDesc_Produto.Text;
   End;
end;

procedure TFBaixaMovAntecipado.MeProdutoExit(Sender: TObject);
begin
  If MeProduto.Text <> '' Then
     EdProduto.Text := DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.Text))
  Else
     EdProduto.Text := 'Text';   
end;

procedure TFBaixaMovAntecipado.BitBtn3Click(Sender: TObject);
var
  wCodProduto : Real;
  wClasse,wSubClasse,wCodClasse : Integer;
begin
  DMContrato.QContratoMovAnt_Aberto.Close;
  DMContrato.QContratoMovAnt_Aberto.SetVariable('COD_PRODUTO',StrToInt(Trim(MeProduto.Text)));
  DMContrato.QContratoMovAnt_Aberto.Open;
  if DMContrato.QContratoMovAnt_AbertoCOD_CONTRATO.Value>0 then
    begin
      wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_CONTRATO','COD_CONTRATO = '+FloatToStr(DMContrato.QContratoMovAnt_AbertoCOD_CONTRATO.Value)));
      wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
      wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
    end;
  With DMContrato do
  Begin
    MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',2);
  End;
end;

end.
