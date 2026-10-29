unit UrPosicaoCompradaVendidaMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrPosicaoCompradaVendidaMes = class(TFTRelSimples)
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup3: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLClasse: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPosicaoCompradaVendidaMes: TFrPosicaoCompradaVendidaMes;

implementation

uses URomaneioRel_cl;

{$R *.dfm}

end.
