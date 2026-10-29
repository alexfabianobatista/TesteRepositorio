unit URControleTrem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRControleTrem = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand5: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText24: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRLRemetente: TQRLabel;
    QRLDestinatario: TQRLabel;
    QRLabel14: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel15: TQRLabel;
    QRLData_F: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRControleTrem: TFRControleTrem;

implementation

uses UControleTrem_cl;

{$R *.dfm}

end.
