unit URGerenciaConhecimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRGerenciaConhecimento = class(TFTRelSimples)
    QRLbFrete: TQRLabel;
    QRLbProduto: TQRLabel;
    QRLbFilial: TQRLabel;
    QRLbPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape12: TQRShape;
    QRShape17: TQRShape;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRShape27: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape30: TQRShape;
    QRShape41: TQRShape;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape6: TQRShape;
    QRShape15: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape28: TQRShape;
    QRDBText17: TQRDBText;
    QRShape31: TQRShape;
    QRShape42: TQRShape;
    QRShape44: TQRShape;
    QRBdFooter: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRShape16: TQRShape;
    QRShape20: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape29: TQRShape;
    QRExpr8: TQRExpr;
    QRShape32: TQRShape;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGerenciaConhecimento: TFRGerenciaConhecimento;

implementation

uses UConhecimentoFrete_cl;

{$R *.DFM}

end.
