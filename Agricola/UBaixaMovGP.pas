unit UBaixaMovGP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, Db;

type
  TFBaixaMovGP = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    MEBaixa: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit2: TDBEdit;
    DSTotalContratoGP: TDataSource;
    DSContrato_VendCons: TDataSource;
    DSContratoMovGP_Aberto: TDataSource;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BtConsProduto: TBitBtn;
    EdProduto: TEdit;
    BitBtn3: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeProdutoExit(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaMovGP: TFBaixaMovGP;

implementation

uses Ucontrato_cl, UOracle_cl, UProdutoCons, UProduto_cl, UUsuario_cl;

{$R *.DFM}

procedure TFBaixaMovGP.SpeedButton1Click(Sender: TObject);
var
  Qtde, QtdeBaixar, Embalagem, ValorTot :Real;
begin
  DMContrato.QContrato_VendMov.Close;
  DMContrato.QContrato_VendMov.Open;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoMovGP_AbertoCOD_FILIAL.Text),'AGRICOLA');
  if Trim(MEBaixa.Text)<>'' then
    begin
      Qtde:=StrToFloat(MEBaixa.text);
      if (Qtde <= DMContrato.QContratoMovGP_AbertoQTDE_SALDO.Value) and (DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value>0) then
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
//          ShowMessage( DMContrato.QContrato_VendMov.Sql.TExt);
            DMContrato.QContrato_Vend.Close;  // acessa o contrato de venda apenas para permitir incluir na query QContrato_Vend_Mov devido ao master e usa no final desta rotina
            DMContrato.QContrato_Vend.SetVariable('Pk',DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value);
            DMContrato.QContrato_Vend.Open;
            DMContrato.QContrato_VendMov.Insert;
            DMContrato.QContrato_VendMovCOD_CONTRATO_VEND.Value:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
            DMContrato.QContrato_VendMovDATA.Value:=DMOracle.DataServ;
            DMContrato.QContrato_VendMovQT_QUANTIDADE.Value:= QtdeBaixar;

            Embalagem:=StrToFloat(DMOracle.Buscanome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+DmContrato.QContratoMovGP_AbertoCod_produto.text));
            ValorTot:=DMContrato.QContratoMovGP_AbertoQT_Quantidade.Value*DMContrato.QContratoMovGP_AbertoPreco.Value/Embalagem;
            DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:= DMContrato.QContrato_VendMovQT_QUANTIDADE.Value*ValorTot/DMContrato.QContratoMovGP_AbertoQT_QUANTIDADE.Value;

            DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pelo Contrato de G. de Preço Nr.'+DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_GP','COD_CONTRATO_GP = '+DMCOntrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.text);
            DMContrato.QContrato_VendMovCOD_CONTRATO_GP_MOV.Value:=DMCOntrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value;
            DMContrato.QContrato_VendMov.Post;

            DMContrato.QContrato_Vend.Edit;
            DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value - QtdeBaixar;
            DMContrato.QContrato_Vend.Post;

            MEBaixa.Clear;
            DMContrato.QContrato_GP.Close;
            DMContrato.QContrato_GP.SetVariable('PK',DMCOntrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value);
            DMContrato.QContrato_GP.Open;
            DMContrato.QContrato_GP.edit;
            DMContrato.QContrato_GPQTDE_SALDO.Value:=DMContrato.QContrato_GPQTDE_SALDO.Value - QtdeBaixar;
            DMContrato.QContrato_GP.Post;
            DMContrato.QContratoMovGP_Aberto.Close;
            DMContrato.QContratoMovGP_Aberto.Open;
            DMContrato.QContrato_VendCons.Close;
            DMContrato.QContrato_VendCons.Open;
          except
            DMContrato.QContrato_VendMov.Cancel;
            DMContrato.QContrato_Vend.Cancel;
            DMContrato.QContrato_GP.Cancel;
            Raise Exception.Create('Erro ao tentar incluir Movimento no contrato de venda');
          end;
        end
      else
        ShowMessage('Erro! A Qtde. da Baixa é superior ao valor do Contrato.'+#13+
                    'ou não existem Contratos de Venda disponíveis a serem baixados.');
    end;
end;

procedure TFBaixaMovGP.BitBtn1Click(Sender: TObject);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TFBaixaMovGP.BitBtn2Click(Sender: TObject);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TFBaixaMovGP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  With DMContrato do
  Begin
    QContratoMovGP_Aberto.Close;
    QContrato_VendCons.Close;
  End;
end;

procedure TFBaixaMovGP.MeProdutoExit(Sender: TObject);
begin
  If MeProduto.Text <> '' Then
     EdProduto.Text := DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MeProduto.Text))
  Else
     EdProduto.Text := 'Text';
end;

procedure TFBaixaMovGP.BtConsProdutoClick(Sender: TObject);
begin
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
   Begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     EdProduto.Text := DMProduto.QProdutoConsDesc_Produto.Text;
   End;

end;

procedure TFBaixaMovGP.BitBtn3Click(Sender: TObject);
var
  wCodProduto : Real;
  wClasse,wSubClasse,wCodClasse : Integer;
begin
  DMContrato.QContratoMovGP_Aberto.Close;
  DMContrato.QContratoMovGP_Aberto.SetVariable('COD_PRODUTO',StrToInt(Trim(MeProduto.Text)));
  DMContrato.QContratoMovGP_Aberto.Open;
  if DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value>0 then
    begin
      wCodProduto:=StrToFloat(DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_CONTRATO_GP','COD_CONTRATO_GP = '+FloatToStr(DMContrato.QContratoMovGP_AbertoCOD_CONTRATO_GP.Value)));
      wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(wCodProduto)));
      wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
      wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
    end;
  With DMContrato do
  Begin
    MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',2);
  End;
end;

End.
