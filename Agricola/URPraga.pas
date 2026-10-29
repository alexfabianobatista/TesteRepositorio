unit URPraga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, StdCtrls, Mask, DBCtrls, QuickRpt, ExtCtrls;

type
  TFRPraga = class(TFTRelSimples)
    QRBand4: TQRBand;
    DBEdit1: TDBEdit;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPraga: TFRPraga;

implementation

uses UPraga_cl;

{$R *.DFM}

end.
