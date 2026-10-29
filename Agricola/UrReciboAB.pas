unit UrReciboAB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRReciboAB = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRTexto: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboAB: TFRReciboAB;

implementation

{$R *.DFM}

end.
