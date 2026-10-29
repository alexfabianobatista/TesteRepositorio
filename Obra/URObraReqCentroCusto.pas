unit URObraReqCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, QRExport, Qrctrls, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRObraReqCentroCusto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRGroup4: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRObraReqCentroCusto: TFRObraReqCentroCusto;

implementation

uses UObra_cl, UObra_Rel_cl;

{$R *.DFM}

end.
