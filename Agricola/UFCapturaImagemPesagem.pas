unit UFCapturaImagemPesagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, tscap32_rt;

type
  TFcapturaImagemPesagem = class(TForm)
    tsCapWebCam: TtsCap32;
    btnCapturar: TBitBtn;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcapturaImagemPesagem: TFcapturaImagemPesagem;

implementation

{$R *.dfm}

end.
