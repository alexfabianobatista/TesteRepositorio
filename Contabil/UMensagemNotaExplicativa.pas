unit UMensagemNotaExplicativa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFMensagemNotaExplicativa = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemNotaExplicativa: TFMensagemNotaExplicativa;

implementation

{$R *.dfm}

end.
