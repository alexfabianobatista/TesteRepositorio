unit URTermo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRTermo = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLOrgao: TQRLabel;
    z: TQRBand;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel10: TQRLabel;
    QRLNumInscricao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTermo: TFRTermo;

implementation

uses UEmissaoTermo_cl;

{$R *.dfm}

end.
