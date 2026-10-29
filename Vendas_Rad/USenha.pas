unit USenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFSenha = class(TForm)
    Label1: TLabel;
    EdSenha: TEdit;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSenha: TFSenha;

implementation

{$R *.DFM}

procedure TFSenha.FormActivate(Sender: TObject);
begin
  EdSenha.Text := '';   
end;

end.
