unit UDocAnteriorParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFDocAnteriorParam = class(TForm)
    RGDocumentos: TRadioGroup;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDocAnteriorParam: TFDocAnteriorParam;

implementation

{$R *.dfm}

end.
