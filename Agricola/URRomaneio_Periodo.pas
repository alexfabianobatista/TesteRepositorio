unit URRomaneio_Periodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, QRExport, QRWebFilt,
  QRPDFFilt;

type
  TFrRomaneio_Periodo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    Nome: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel4: TQRLabel;
    QRLDataI: TQRLabel;
    QRLDataF: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRLRateio: TQRLabel;
    QRLDesconto: TQRLabel;
    QRLLiquido: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel24: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText22: TQRDBText;
    QRLSacas: TQRLabel;
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrRomaneio_Periodo: TFrRomaneio_Periodo;
  wRateio,wDesconto,wLiquido : Real;
implementation

uses URomaneioAgricola_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFrRomaneio_Periodo.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wRateio := wRateio + DMRomaneioAgricola.QrRateioQT_Rateio.Value;
  wDesconto := wDesconto + DMRomaneioAgricola.QrRateioDesconto.Value;
  wLiquido := wLiquido + DMRomaneioAgricola.QrRateioLiquido.Value;
End;

procedure TFrRomaneio_Periodo.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLRateio.Caption := FormatFloat('###,###',wRateio);
  QRLDesconto.Caption := FormatFloat('###,###',wDesconto);
  QRLLiquido.Caption := FormatFloat('###,###',wLiquido);
  QRLSacas.Caption := 'Sacas: ' + FormatFloat('###,###',wLiquido/60) + ' Scs';
  if DMParamSistema.CodEmpresa = 'ESPIGAO' then
  begin
    QRLSacas.Font.Name := 'Arial';
    QRLSacas.Font.Size := 9;
  end;
  wRateio := 0;
  wDesconto := 0;
  wLiquido := 0;

end;

procedure TFrRomaneio_Periodo.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wRateio := 0;
  wDesconto := 0;
  wLiquido := 0;
end;

procedure TFrRomaneio_Periodo.FormCreate(Sender: TObject);
begin
  inherited;
  wRateio := 0;
  wDesconto := 0;
  wLiquido := 0;

end;

procedure TFrRomaneio_Periodo.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  {if DMParamSistema.CodEmpresa = 'ALIANCA' then
  begin
    QRLabel25.Visible := False;
    QRDBText16.Visible := False;
    QRLabel19.Visible := False;
    QRExpr1.Visible := False;
    QRLabel20.Visible := False;
    QRDBText17.Visible := False;
    QRLabel21.Visible := False;
    QRDBText18.Visible := False;
    QRLabel22.Visible := False;
    QRDBText19.Visible := False;
    QRLabel23.Visible := False;
    QRDBText20.Visible := False;
  end;}
end;

procedure TFrRomaneio_Periodo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'ALIANCA' then
  begin
    QRLabel25.Enabled  := False;
    QRDBText16.Enabled := False;
    QRLabel19.Enabled  := False;
    QRExpr1.Enabled    := False;
    QRLabel20.Enabled  := False;
    QRDBText17.Enabled := False;
    QRLabel21.Enabled  := False;
    QRDBText18.Enabled := False;
    QRLabel22.Enabled  := False;
    QRDBText19.Enabled := False;
    QRLabel23.Enabled  := False;
    QRDBText20.Enabled := False;
  end;
end;

End.
