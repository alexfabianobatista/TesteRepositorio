unit URContasReceber_TitVenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_TitVenc = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_TitVenc: TFRContasReceber_TitVenc;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
