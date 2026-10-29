unit URGerenciaRPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRGerenciaRPA = class(TFTRelSimples)
    QRLbPeriodo: TQRLabel;
    QRLbFrete: TQRLabel;
    QRLbProduto: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLbFilial: TQRLabel;
    QRShape6: TQRShape;
    QRShape15: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRDBText17: TQRDBText;
    QRShape31: TQRShape;
    QRShape34: TQRShape;
    QRShape37: TQRShape;
    QRShape3: TQRShape;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRShape27: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape30: TQRShape;
    QRShape33: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRShape41: TQRShape;
    QRBdFooter: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRShape11: TQRShape;
    QRShape16: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape29: TQRShape;
    QRExpr8: TQRExpr;
    QRShape32: TQRShape;
    QRShape35: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape13: TQRShape;
    QRLabel27: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape10: TQRShape;
    QRLabel16: TQRLabel;
    QRShape14: TQRShape;
    QRDBText6: TQRDBText;
    QRShape17: TQRShape;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGerenciaRPA: TFRGerenciaRPA;

implementation

uses URPA_cl;

{$R *.DFM}

end.
