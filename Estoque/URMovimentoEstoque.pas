unit URMovimentoEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMovimentoEstoque = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLote: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel20: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovimentoEstoque: TFRMovimentoEstoque;

implementation

uses UEstoque_cl, URMovimentoEstoque1;

{$R *.DFM}

end.
