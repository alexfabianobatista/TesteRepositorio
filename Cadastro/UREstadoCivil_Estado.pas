unit UREstadoCivil_Estado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls;

type
  TFREstadoCivil_Estado = class(TFTRelSimples)
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
  FREstadoCivil_Estado: TFREstadoCivil_Estado;

implementation

uses UEstadoCivil_cl;

{$R *.DFM}

end.
