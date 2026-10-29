unit UCapturaFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, tscap32_rt;

type
  TFCapturaFoto = class(TForm)
    tsCapWebCam: TtsCap32;
    btnCapturar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCapturaFoto: TFCapturaFoto;

implementation

{$R *.dfm}

end.
