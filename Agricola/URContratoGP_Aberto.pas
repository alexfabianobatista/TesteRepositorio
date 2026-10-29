unit URContratoGP_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContratoGP_Aberto = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContratoGP_Aberto: TFRContratoGP_Aberto;

implementation

uses Ucontrato_cl;

{$R *.DFM}

end.
