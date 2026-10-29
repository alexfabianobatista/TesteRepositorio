unit URIndiceDesempenho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls, StdCtrls;

type
  TFRIndiceDesempenho = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLMes: TQRLabel;
    QRLAno: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRIndiceDesempenho: TFRIndiceDesempenho;

implementation

uses UIndiceDesempenho_cl;

{$R *.DFM}

end.
