unit URSaldoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRSaldoContabil = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLSaldoAnterior: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLSaldo: TQRLabel;
    QRDBText1: TQRDBText;
    QRLFilial: TQRLabel;
    QRLConta: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLSaldoAnterior1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLSaldoAtual: TQRLabel;
    QRLabel11: TQRLabel;
    QRLEntradas: TQRLabel;
    QRLabel14: TQRLabel;
    QRLSaidas: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    wSaldoMesAnterior : Real;
    { Public declarations }
  end;

var
  FRSaldoContabil: TFRSaldoContabil;
  wSaldoLinha,wSaldoAnterior,wEntradas,wSaidas : real;

implementation

uses URelContabil_cl;

{$R *.DFM}

procedure TFRSaldoContabil.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha := wSaldoLinha + wSaldoMesAnterior;
  QRLSaldoAnterior.Caption:=FormatFloat('#,##0.00',(wSaldoLinha));
  wSaldoMesAnterior := 0;
  wEntradas := 0;
  wSaidas := 0;
end;

procedure TFRSaldoContabil.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha := wSaldoLinha + DMRelContabil.QRSaldoContabilVal_Calculo.Value;
  QRLSaldo.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
  If DMRelContabil.QRSaldoContabilIND_OPERACAO.Value = 'D' Then
    wEntradas := wEntradas + DMRelContabil.QRSaldoContabilVal_Calculo.Value;
  If DMRelContabil.QRSaldoContabilIND_OPERACAO.Value = 'C' Then
    wSaidas := wSaidas + DMRelContabil.QRSaldoContabilVal_Calculo.Value;

end;

procedure TFRSaldoContabil.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wSaldoAnterior := wSaldoLinha;
end;

procedure TFRSaldoContabil.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoAnterior1.Caption:=FormatFloat('#,##0.00',wSaldoAnterior);
  QRLSaldoAtual.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
  QRLEntradas.Caption:=FormatFloat('#,##0.00',wEntradas);
  QRLSaidas.Caption:=FormatFloat('#,##0.00',wSaidas);

end;

procedure TFRSaldoContabil.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wSaldoLinha := 0;

end;

end.
