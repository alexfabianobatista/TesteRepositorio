unit UMensagemSMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UFmCadastro;

type
  TFMensagemSMS = class(TForm)
    FmCadastroSMS: TFmCadastro;
    mMensagem: TMemo;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemSMS: TFMensagemSMS;

implementation

{$R *.dfm}

end.
