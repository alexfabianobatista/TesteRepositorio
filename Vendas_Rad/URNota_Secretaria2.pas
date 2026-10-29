unit URNota_Secretaria2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRNota_Secretaria2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLFilial: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Secretaria2: TFRNota_Secretaria2;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
