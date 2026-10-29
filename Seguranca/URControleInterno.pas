unit URControleInterno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRControleInterno = class(TFTRelSimples)
    QRGroup2: TQRGroup;
    QRLPeriodo: TQRLabel;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRControleInterno: TFRControleInterno;

implementation

uses UControleInterno_cl;

{$R *.DFM}

end.
