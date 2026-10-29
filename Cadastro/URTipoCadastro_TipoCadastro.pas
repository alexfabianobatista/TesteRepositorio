unit URTipoCadastro_TipoCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls;

type
  TFRTipoCadastro_TipoCadastro = class(TFTRelSimples)
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
  FRTipoCadastro_TipoCadastro: TFRTipoCadastro_TipoCadastro;

implementation

uses UTipoCadastro_cl;

{$R *.DFM}

end.
