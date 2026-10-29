unit URVersoReceituario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRVersoReceituario = class(TForm)
    QRPrimario: TQuickRep;
    QR: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRMemo3: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVersoReceituario: TFRVersoReceituario;

implementation

{$R *.dfm}

end.
