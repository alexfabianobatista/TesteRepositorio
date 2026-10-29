unit URSaldoFixarSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRSaldoFixarSintetico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSaldoFixarSintetico: TFRSaldoFixarSintetico;

implementation

uses UContratoArroz_cl;

{$R *.dfm}

end.
