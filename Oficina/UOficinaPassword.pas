unit UOficinaPassword;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TFOficinaPassword = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaPassword: TFOficinaPassword;

implementation

{$R *.DFM}

procedure TFOficinaPassword.FormShow(Sender: TObject);
begin
  Password.Clear;
  Password.SetFocus;
end;

end.
 
