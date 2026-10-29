unit URProducaoA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProducaoA = class(TFTRelSimples)
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLFilial: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProducaoA: TFRProducaoA;

implementation

uses UOracle_cl, UBoletim_cl;

{$R *.DFM}

end.
