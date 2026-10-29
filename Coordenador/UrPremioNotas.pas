unit UrPremioNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFrPremioNotas = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel17: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel18: TQRLabel;
    QRExpr9: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPremioNotas: TFrPremioNotas;

implementation

uses UGrupoProduto_cl;

{$R *.dfm}

end.
