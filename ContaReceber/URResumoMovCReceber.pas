unit URResumoMovCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRResumoMovCReceber = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    qrlPeriodo: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoMovCReceber: TFRResumoMovCReceber;

implementation

uses UContasReceber_Rel_cl, UContasReceber_cl;

{$R *.DFM}

end.
