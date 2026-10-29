unit URAutonomosINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRAutonomosINSS = class(TFTRelSimples)
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLCompetencia: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr9: TQRExpr;
    QRDBText6: TQRDBText;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAutonomosINSS: TFRAutonomosINSS;

implementation

uses URPA_cl;

{$R *.DFM}

end.
