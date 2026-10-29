unit URServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRServico = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRServico: TFRServico;

implementation

uses UOficina_cl;

{$R *.DFM}

end.
