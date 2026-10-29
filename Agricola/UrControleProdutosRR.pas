unit UrControleProdutosRR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrControleProdutosRR = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDetail: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrControleProdutosRR: TFrControleProdutosRR;

implementation

uses URomaneioRel_cl;

{$R *.dfm}

end.
