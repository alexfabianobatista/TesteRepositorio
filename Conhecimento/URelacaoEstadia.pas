unit URelacaoEstadia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRelacaoEstadia = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLRPA: TQRLabel;
    QRDBTRPA: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBTCNH: TQRDBText;
    QRBand3: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr1: TQRExpr;
    QRLCNH: TQRLabel;
    procedure QRLabel3Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelacaoEstadia: TFRelacaoEstadia;

implementation

uses UConhecimento_cl;

{$R *.DFM}

procedure TFRelacaoEstadia.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if (DMConhecimento.QREstadiaNUM_RPA.Value = 0) or (Trim(DMConhecimento.QREstadiaNUM_RPA.Text) = '') then
  begin
    QRLRPA.Enabled:=False;
    QRLCNH.Enabled:=True;
    QRDBTRPA.Enabled:=False;
    QRDBTCNH.Enabled:=True;
  end
  else
  begin
    QRLCNH.Enabled:=False;
    QRLRPA.Enabled:=True;
    QRDBTCNH.Enabled:=False;
    QRDBTRPA.Enabled:=True;
  end;
end;

end.
