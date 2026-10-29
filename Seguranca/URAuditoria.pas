unit URAuditoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRAuditoria = class(TFTRelSimples)
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAuditoria: TFRAuditoria;

implementation

uses UAditoria_cl;

{$R *.DFM}

end.
