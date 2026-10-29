unit UResFinanceiroContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, StdCtrls,
  QRWebFilt, QRPDFFilt;

type
  TFResFinanceiroContrato = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    LbData_I: TQRLabel;
    QRLabel4: TQRLabel;
    LbData_F: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText6: TQRDBText;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResFinanceiroContrato: TFResFinanceiroContrato;

implementation

uses UContratoArroz_cl;

{$R *.dfm}

end.
