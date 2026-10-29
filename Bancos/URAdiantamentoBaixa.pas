unit URAdiantamentoBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRAdiantamentoBaixa = class(TFTRelSimples)
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel3: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAdiantamentoBaixa: TFRAdiantamentoBaixa;

implementation

uses UAdiantamento_cl;

{$R *.DFM}

end.
