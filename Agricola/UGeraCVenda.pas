unit UGeraCVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Mask, Grids, DBGrids;

type
  TFGeraMovCVenda = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    LQuantidade: TLabel;
    LValor: TLabel;
    MEBaixa: TMaskEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BTCancela: TBitBtn;
    Label5: TLabel;
    DSVendCons: TDataSource;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTCancelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FValor : Real;
    FQtde: Real;
    FDocumento :String;
    FOrigem :String;
  public
    { Public declarations }
    Property pValor : Real read FValor write Fvalor;
    Property pQtde : Real read FQtde write FQtde;
    Property pDocumento : String read FDocumento write FDocumento;
    Property pOrigem :String read FOrigem write FOrigem;
  end;

var
  FGeraMovCVenda: TFGeraMovCVenda;

implementation

uses Ucontrato_cl, UOracle_cl, UNotaEntrada_cl, UContrato_Vend_Cl;

{$R *.DFM}

procedure TFGeraMovCVenda.SpeedButton1Click(Sender: TObject);
var
 Qtde, QtdeBaixar, SaldoAplicar, Valor, SaldoAplicar2 :Real;
begin
  SaldoAplicar := 0;
  Valor := 0;
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend.SetVariable('PK',DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value);
  DMContrato.QContrato_Vend.Open;
  DMContrato.QContrato_VendMov.Open;
  if DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value = 'A' THEN
  Begin
    If Trim(MEBaixa.Text) <> '' then
      begin
        Qtde:=StrToFloat(MEBaixa.text);
        If Qtde <= pQtde then
          begin
            If Qtde >= DMContrato.QContrato_VendConsVAL_SALDO.Value then
               QtdeBaixar := DMContrato.QContrato_VendConsVAL_SALDO.Value
            else
               QtdeBaixar := Qtde;
            Try
              DMContrato.QContrato_VendMov.Insert;
              DMContrato.QContrato_VendMovCOD_CONTRATO_VEND.Value:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
              DMContrato.QContrato_VendMovDATA.Value:=DMOracle.DataServ;
              DMContrato.QContrato_VendMovQT_QUANTIDADE.Value:= QtdeBaixar;
              If pQtde <> 0 Then
                 DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:= DMContrato.QContrato_VendMovQT_QUANTIDADE.Value*pValor/pQtde
              Else
                 DMContrato.QContrato_VendMovVAL_MOVIMENTO.Value:= pValor;
              if (pDocumento = 'CC') or (pDocumento = 'CC1') then
                begin
                  DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pelo Contrato de compra Nr.'+DMCOntrato.QContratoNUM_CONTRATO.text;
                  DMContrato.QContrato_VendMovCOD_CONTRATO_MOV.Value:=DMContrato.QContratoCOD_CONTRATO.Value;
                end;
              if (pDocumento = 'CGP') Or (pDocumento = 'CGP1') then
                begin
                  DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pelo Contrato de G. de Preco Nr.'+DMCOntrato.QContrato_GPNUM_CONTRATO.text;
                  DMContrato.QContrato_VendMovCOD_CONTRATO_GP_MOV.Value:=DMContrato.QContrato_GPCOD_CONTRATO_GP.Value;
                  DMContrato.QContrato_VendMovCOD_CONTRATO_GP.Value:=DMContrato.QContratoGP_MOVCOD_CONTRATO_GP_MOV.Value;  // ESTA REALMENTE INVERTIDO PORQUE FOI IMPLANTADO ESTE CAMPO DEPOIS
                end;                                                         // FOI ACRESCENTADO ESTE CAMPO PARA FAZER A EXCLUSAO DO LANCAMENTO - PARA PERMITIR LANCAR NOVAMENTE NOS CONTRATOS
              if pDocumento = 'NFA' then
                begin
                  DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pela Nota de Fixação Nr.'+DMNotaEntrada.QNotaEntradaNUM_Nota.text;
                  DMContrato.QContrato_VendMovCOD_NOTA_ITEM.Value:=DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value;
                end;
              if pDocumento = 'CUS' then
                begin
                  DMContrato.QContrato_VendMovDESC_OBSERVACAO.Value:='Gerado pelo contrato custos Nr.'+DMContrato_Vend.QContrato_Vend_CustosNUM_Nota.text;
                  DMContrato.QContrato_VendMovCOD_CONTRATO_VEND_CUSTOS.Value:=DMContrato_Vend.QContrato_Vend_CustosCOD_CONTRATO_VEND_CUSTOS.Value;
                end;
              DMContrato.QContrato_VendMov.Post;
              DMContrato.QContrato_Vend.Close;
              DMContrato.QContrato_Vend.SetVariable('PK',DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.value);
              DMContrato.QContrato_Vend.Open;
              DMContrato.QContrato_Vend.Edit;
              DMContrato.QContrato_VendVAL_SALDO.Value:=DMContrato.QContrato_VendVAL_SALDO.Value - QtdeBaixar;
              DMContrato.QContrato_Vend.Post;
              if pDocumento = 'CGP' then
                begin
                  SaldoAplicar2:=pQtde;
                  DMContrato.QContrato_GP.Edit;
                  DMContrato.QContrato_GPQTDE_SALDO.Value:=DMContrato.QContrato_GPQTDE_SALDO.Value-QtdeBaixar;
                  DMContrato.QContrato_GP.Post;
                  SaldoAplicar:=DMContrato.QContrato_GPQTDE_SALDO.Value;
                  SaldoAplicar:=Trunc(SaldoAplicar*100)/100;
                  Valor := SaldoAplicar*pValor/SaldoAplicar2;
                end;
              if pDocumento = 'CGP1' then  // quantidade de ajuste de contrato ja aplicado no contrato de venda
                begin
                  DMContrato.QContratoGP_Mov.Edit;
                  DMContrato.QContratoGP_MovInd_Aplicado_Ajuste.Value := 'SIM';
                  DMContrato.QContratoGP_Mov.Post;
                end;
              if pDocumento = 'CC' then
                begin
                  SaldoAplicar2:=pQtde;
                  DMContrato.QContrato.Edit;
                  DMContrato.QContratoQTDE_SALDO.Value:=DMContrato.QContratoQTDE_SALDO.Value-QtdeBaixar;
                  DMContrato.QContrato.Post;
                  SaldoAplicar:=DMContrato.QContratoQTDE_SALDO.Value;
                  SaldoAplicar:=Trunc(SaldoAplicar*100)/100;
                  Valor := SaldoAplicar*pValor/SaldoAplicar2;
                end;
              if pDocumento = 'NFA' then
                begin
                  DMNotaEntrada.QContratoMovVend_Mov_NFItem.Close;
                  DMNotaEntrada.QContratoMovVend_Mov_NFItem.Open;
                  SaldoAplicar:=DMNotaEntrada.QItemNFQT_QUANTIDADE.Value - DMNotaEntrada.QContratoMovVend_Mov_NFItemTotal_Quantidade.Value;
                  SaldoAplicar:=Trunc(SaldoAplicar*100)/100;
                  Valor := SaldoAplicar*DMNotaEntrada.QItemNFVAL_TOTAL.Value/DMNotaEntrada.QItemNFQT_QUANTIDADE.Value;
                end;
              If pDocumento = 'CUS' then
                begin
                  SaldoAplicar2:=pQtde;
                  DMContrato_Vend.QContrato_Vend_Custos.Edit;
                  DMContrato_Vend.QContrato_Vend_CustosCOD_CONTRATO_VEND.Value:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
                  DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value:=DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value-QtdeBaixar;
                  DMContrato_Vend.QContrato_Vend_Custos.Post;
                  SaldoAplicar:=DMContrato_Vend.QContrato_Vend_CustosQTDE_SALDO.Value;
                  SaldoAplicar:=Trunc(SaldoAplicar*100)/100;
                  If SaldoAplicar2 <> 0 Then
                     Valor := SaldoAplicar*pValor/SaldoAplicar2
                  Else
                     Valor := 0;
                end;
              DMContrato.QContrato_VendCons.Close;
              DMContrato.QContrato_VendCons.Open;
              LQuantidade.caption:=FormatFloat('#,##0',SaldoAplicar);
              LValor.caption:=FormatFloat('#,##0.00',Valor);
              pValor:=Valor;
              pQtde:=SaldoAplicar;
              MEBaixa.Clear;
              if pDocumento = 'NFA' then
                begin
                  if pQtde = 0 then
                    begin
                      DMContrato.QMudaStatusItemNF.Close;
                      DMContrato.QMudaStatusItemNF.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value);
                      DMContrato.QMudaStatusItemNF.SetVariable('STATUS','S');
                      DMContrato.QMudaStatusItemNF.ExecSQL;
                    end;
                end;
              DMContrato.QContrato_Vend.Close;
              DMContrato.QContrato_Vend.Open;
            except
              DMContrato.QContrato_VendMov.Cancel;
              DMContrato.QContrato_Vend.Cancel;
              Raise Exception.Create('Erro ao  tentar incluir Movimento no contrato de venda');
            end;
          end
        else
          ShowMessage('Erro! A Qtde. da Baixa é superior ao valor do Contrato.');
      end;
    end
    else
      ShowMessage('Este Contrato está com os Custos Fechado!');
end;

procedure TFGeraMovCVenda.BitBtn1Click(Sender: TObject);
begin
  if pOrigem = 'Vend' then
    DMOracle.DBCemapa.Commit;
  if pDocumento = 'CC' then
    begin
      DMContrato.QContrato.Close;
      DMContrato.QContrato.Open;
    end;
end;

procedure TFGeraMovCVenda.BTCancelaClick(Sender: TObject);
begin
  if pOrigem = 'Vend' then
    DMOracle.DBCemapa.Rollback;
  if pDocumento = 'CC' then
    begin
      DMContrato.QContrato.Close;
      DMContrato.QContrato.Open;
    end;
end;

procedure TFGeraMovCVenda.FormActivate(Sender: TObject);
begin
  if (pOrigem = 'BaixaProd') or (pOrigem ='BaixaValor') then
    BtCancela.Visible:=False
  else
    BtCancela.Visible:=True;
end;

end.
