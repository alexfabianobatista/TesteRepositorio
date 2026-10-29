unit UROSPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, StdCtrls;

type
  TFROSPatrimonio = class(TFTRelSimples)
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText16: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROSPatrimonio: TFROSPatrimonio;

implementation

uses UOSPatrimonio_cl;

{$R *.DFM}

procedure TFROSPatrimonio.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  DetailBand1.Enabled:= True;
  with DMOSPatrimonio do
  begin
    if ((trim(QROSPatrimonioDesc_Observacao.text)) = '') and
       ((trim(QROSPatrimonioDesc_Complemento1.text)) = '') and
       ((trim(QROSPatrimonioDesc_Complemento2.text)) = '') then
       DetailBand1.Enabled := false
     else
       DetailBand1.Enabled:= True;
   end;
end;

end.
