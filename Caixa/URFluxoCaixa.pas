unit URFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFrFluxoCaixa = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLAnterior: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLSaldo: TQRLabel;
    QRBand4: TQRBand;
    QRLObservacao: TQRLabel;
    QRLMensagem1: TQRLabel;
    QRLMensagem2: TQRLabel;
    QRLMensagem3: TQRLabel;
    QRLMensagem4: TQRLabel;
    QRLMensagem5: TQRLabel;
    QRLMensagem6: TQRLabel;
    QRLMensagem7: TQRLabel;
    QRLMensagem8: TQRLabel;
    QRLMensagem9: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrFluxoCaixa: TFrFluxoCaixa;

implementation

uses UFluxoCaixa_cl;

{$R *.DFM}

procedure TFrFluxoCaixa.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wValor : String;
    I : Integer;
begin
  inherited;
  wValor := '';
  For i:= 1 to Length(QRLAnterior.Caption) do
    if QRLAnterior.Caption[I] in ['0','1','2','3','4','5','6','7','8','9',',','-'] Then
       wValor := wValor + QRLAnterior.Caption[I];
  QRLSaldo.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor) + DMFLuxoCaixa.QrFluxoCaixaSVAL_RECEBER.Value - DMFLuxoCaixa.QrFluxoCaixaSVAL_PAGAR.Value);
  If (StrToFloat(wValor) + DMFLuxoCaixa.QrFluxoCaixaSVAL_RECEBER.Value - DMFLuxoCaixa.QrFluxoCaixaSVAL_PAGAR.Value) < 0 Then
     QRLSaldo.Font.Color := ClRed
  Else
     QRLSaldo.Font.Color := clWindowText;
end;

procedure TFrFluxoCaixa.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRLAnterior.Caption := QRLSaldo.Caption;
end;

procedure TFrFluxoCaixa.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QRLAnterior.Caption := FormatFloat('##,###,##0.00',DMFluxoCaixa.pSaldoAnterior);
end;

end.
