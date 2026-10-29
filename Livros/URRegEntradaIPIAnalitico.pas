unit URRegEntradaIPIAnalitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls, DBCtrls;

type
  TFRRegEntradaIPIAnalitico = class(TFTRelSimples)
    QRLabel25: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape22: TQRShape;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape27: TQRShape;
    QRExpr5: TQRExpr;
    QRDBText10: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    Shape1: TShape;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRegEntradaIPIAnalitico: TFRRegEntradaIPIAnalitico;

implementation

uses URegEntrada_cl;

{$R *.dfm}

end.
