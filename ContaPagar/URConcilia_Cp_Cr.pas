unit URConcilia_Cp_Cr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRConcilia_Cp_Cr = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConcilia_Cp_Cr: TFRConcilia_Cp_Cr;

implementation

uses URelContasPagar_cl;


{$R *.DFM}

end.
