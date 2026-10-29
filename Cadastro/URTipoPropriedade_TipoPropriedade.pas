unit URTipoPropriedade_TipoPropriedade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls;

type
  TFRTipoPropriedade_TipoPropriedade = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTipoPropriedade_TipoPropriedade: TFRTipoPropriedade_TipoPropriedade;

implementation

uses UTipoPropriedade_cl;

{$R *.DFM}

end.
