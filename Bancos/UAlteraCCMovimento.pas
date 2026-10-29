unit UAlteraCCMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, UFmContaCorrente;

type
  TFAlteraCCMovimento = class(TForm)
    BtOk: TBitBtn;
    BtCancel: TBitBtn;
    FmContaCorrente1: TFmContaCorrente;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlteraCCMovimento: TFAlteraCCMovimento;

implementation

{$R *.dfm}

end.
