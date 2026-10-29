unit URPrecoAgricola;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPrecoAgricola = class(TFTRelSimples)
    QRGroup1: TQRGroup;
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
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLFilial: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPrecoAgricola: TFRPrecoAgricola;

implementation

uses UPrecoAgricola_cl;

{$R *.DFM}

end.
