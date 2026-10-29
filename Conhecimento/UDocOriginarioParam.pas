unit UDocOriginarioParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFDocOriginarioParam = class(TForm)
    RGNotaFiscal: TRadioGroup;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDocOriginarioParam: TFDocOriginarioParam;

implementation

{$R *.dfm}

end.
