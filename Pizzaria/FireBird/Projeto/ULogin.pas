unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses USelecionaBanco;

{$R *.dfm}

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFLogin.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;
end;

end.
