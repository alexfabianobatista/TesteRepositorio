unit UrNotaPrecoMedio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrNotaPrecoMedio = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrNotaPrecoMedio: TFrNotaPrecoMedio;

implementation

uses URomaneioRel_cl;

{$R *.dfm}

end.
