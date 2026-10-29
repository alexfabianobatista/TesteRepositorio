unit URContaPagarTotalDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContaPagarTotalDia = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContaPagarTotalDia: TFRContaPagarTotalDia;

implementation

uses UContasPagar_cl;

{$R *.DFM}

end.
