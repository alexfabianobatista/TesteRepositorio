Unit URRegEntradaIPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type                        
  TFRRegEntradaIPI = class(TFTRelSimples)
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
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
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRSysData3: TQRSysData;
    QRLabel25: TQRLabel;
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
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRegEntradaIPI: TFRRegEntradaIPI;

implementation

uses URegEntrada_cl;

{$R *.dfm}

end.
