unit URControleSojaRRSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRControleSojaRRSintetico = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel10: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    GroupFooterBand2: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    GroupHeaderBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRControleSojaRRSintetico: TFRControleSojaRRSintetico;

implementation

uses URomaneioRel_cl;

{$R *.DFM}

end.
