unit UROSCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROSCapa = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel25: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure QRDBText20Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROSCapa: TFROSCapa;

implementation

uses UOficina_cl;

{$R *.DFM}

procedure TFROSCapa.QRDBText20Print(sender: TObject; var Value: String);
begin
  inherited;
  Value:= Copy(DMOficina.QROSCapaDT_LIMITEHORAS.Value,1,2);
  if StrToFloat(Copy(DMOficina.QROSCapaDT_LIMITEHORAS.Value,4,2)) = 0 then
     Value:= Value+':'+'00'
  else
     Value:= Value+':'+Copy(DMOficina.QROSCapaDT_LIMITEHORAS.Value,4,2);
end;

end.
