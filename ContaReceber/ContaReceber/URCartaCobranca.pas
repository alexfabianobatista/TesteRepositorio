unit URCartaCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCartaCobranca = class(TForm)
    QRepCartaCobranca: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRRichText4: TQRRichText;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLDescFilial: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRLDadosEnd: TQRLabel;
    QRLCNPJ: TQRLabel;
    QRLCompEnd: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRTextFilter1: TQRTextFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCartaCobranca: TFRCartaCobranca;

implementation

uses UContasReceber_cl, UParamSistema_cl, UOracle_cl;

{$R *.DFM}

procedure TFRCartaCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FRCartaCobranca := nil;
end;

procedure TFRCartaCobranca.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wS : String;
begin
  wS := '';
  If DMContasReceber.QRCartaCobrancaDESC_CIDADE_COBRANCA.Text <> '' Then
    wS := DMContasReceber.QRCartaCobrancaDESC_CIDADE_COBRANCA.Text;
  If DMContasReceber.QRCartaCobrancaDESC_ESTADO_COBRANCA.Text <> '' Then
    wS := wS + '-' + DMContasReceber.QRCartaCobrancaDESC_ESTADO_COBRANCA.Text;
  If DMContasReceber.QRCartaCobrancaDESC_BAIRRO.Text <> '' Then
    wS := wS + '-' + DMContasReceber.QRCartaCobrancaDESC_BAIRRO.Text;
  QRLabel13.Caption := wS;
  If DMContasReceber.QRCartaCobrancaDESC_TELEFONE.Text <> '' Then
    QRLabel4.Caption:= 'FONE: ' + DMContasReceber.QRCartaCobrancaDESC_TELEFONE.Text;
  If DMContasReceber.QRCartaCobrancaDESC_CEP_COBRANCA.Text <> '' Then
    QRLabel10.Caption:= 'CEP: ' + DMContasReceber.QRCartaCobrancaDESC_CEP_COBRANCA.Text;
end;

procedure TFRCartaCobranca.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wS : String;
begin
  wS := '      Solicitamos seu comparecimento, no prazo de 5 dias a partir da data de recebimento desta, na ';
  wS := wS + DMContasReceber.QRCartaCobrancaDESC_ENDERECO.Text;
  wS := wS + ', para liquidar seu débito, devidamente atualizado, com juros de mora e multa. O não comparecimento acarretará maiores despesas e a execução judicial da dívida em sua totalidade.';
  QRMemo2.Lines.Clear;
  QRMemo2.Lines.Add(wS);
  wS := '      Caso  o  débito  já  tenha  sido  liquidado,  solicitamos  desconsiderar  esta  notificação   e   enviar   cópia  do comprovante de pagamento através do fone/fax: ';
  wS := wS + DMContasReceber.QRCartaCobrancaFONE_FILIAL.Text;
  wS := wS + ', para que possamos regularizar sua situação.';
  QRMemo3.Lines.Clear;
  QRMemo3.Lines.Add(wS);
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL') OR
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') then
      FRCartaCobranca.QRLabel11.caption:=''+'Informamos que os valores foram corrigidos pelo INPC + 1%, até a data de'+DateToStr(DMOracle.DataServ)
    else
      FRCartaCobranca.QRLabel11.Font.Color:=clwhite;
end;

procedure TFRCartaCobranca.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMContasReceber do
  Begin
    QRLDescFilial.Caption := QRCartaCobrancaDESC_FILIAL.Text;
    QRLDadosEnd.Caption := QRCartaCobrancaDESC_ENDERECO.Text + ' - ' + QRCartaCobrancaBAIRRO_FILIAL.Text + ' - ' + 'PABX: ' + QRCartaCobrancaFONE_FILIAL.Text;
    QRLCNPJ.Caption := 'CNPJ ' + QRCartaCobrancaNUM_CGC.Text;
    QRLCompEnd.Caption := 'CEP: ' + QRCartaCobrancaCEP_FILIAL.Text + ' - ' + QRCartaCobrancaCIDADE_FILIAL.Text + '-' + QRCartaCobrancaESTADO_FILIAL.Text + ' - Email: ' + QRCartaCobrancaEMAIL_FILIAL.Text;

  End;
end;

end.
