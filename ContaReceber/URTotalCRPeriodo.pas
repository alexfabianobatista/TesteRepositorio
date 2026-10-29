unit URTotalCRPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRTotalCRPeriodo = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTotalCRPeriodo: TFRTotalCRPeriodo;

implementation

uses UContasReceber_Rel_cl;

{$R *.DFM}

end.
