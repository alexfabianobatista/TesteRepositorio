unit URPatrimonioNaoConfirmado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRPatrimonioNaoConfirmado = class(TFTRelSimples)
    QRBand3: TQRBand;
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
  FRPatrimonioNaoConfirmado: TFRPatrimonioNaoConfirmado;

implementation

uses UPatrimonio_cl;

{$R *.dfm}

end.
