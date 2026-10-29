unit UrPremioCoordenador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFrPremioCoordenador = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPremioCoordenador: TFrPremioCoordenador;

implementation

uses UGrupoProduto_cl;

{$R *.dfm}

end.
