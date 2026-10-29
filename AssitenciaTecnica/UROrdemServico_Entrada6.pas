unit UROrdemServico_Entrada6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFROrdemServico_Entrada6 = class(TFTRelSimples)
    QRILogo: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand4: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand5: TQRBand;
    QRLabel22: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText12: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel25: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada6: TFROrdemServico_Entrada6;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFROrdemServico_Entrada6.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
    if DMOrdemServico.QREntradaCOD_PRODUTO.AsString ='' then
  begin
    QRBand4.Enabled := False;
    QRBand5.Enabled := False;
  end
  else
  begin
    QRBand4.Enabled := True;
    QRBand5.Enabled := True;
  end;

end;

procedure TFROrdemServico_Entrada6.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (DMOrdemServico.QREntradaDESC_COMPLEMENTO.Value <> '') then
  begin
    QRDBText12.Enabled := true;
    QRBand4.Height := 44;
  end
  else
    QRBand4.Height :=  23;
end;

end.
