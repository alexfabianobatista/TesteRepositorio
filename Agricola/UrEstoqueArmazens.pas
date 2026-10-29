unit UrEstoqueArmazens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls;

type
  TFrEstoqueArmazens = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel11: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEstoqueArmazens: TFrEstoqueArmazens;

implementation

uses UEstoque_cl;

{$R *.DFM}

end.
