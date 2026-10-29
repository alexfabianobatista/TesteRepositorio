unit URVendasVendClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrVendasVendClasse = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRBand3: TQRBand;
    QRLFilial: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrVendasVendClasse: TFrVendasVendClasse;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
