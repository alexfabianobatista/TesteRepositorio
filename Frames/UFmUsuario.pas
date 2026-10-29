unit UFmUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmUsuario = class(TFrame)
    MeUsuario: TMaskEdit;
    BtUsuario: TBitBtn;
    EdUsuario: TEdit;
    Label1: TLabel;
    procedure BtUsuarioClick(Sender: TObject);
    procedure MeUsuarioExit(Sender: TObject);
    procedure MeUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UUsuario_cl, UUsuarioCons, UFmFilial, DB;

{$R *.dfm}

procedure TFmUsuario.BtUsuarioClick(Sender: TObject);
begin
  if FUsuarioCons = nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.ShowModal = MrOk then
  begin
    MeUsuario.Text := DMUsuario.QUsuarioConsCOD_USUARIO.Text;
    MeUsuarioExit(Self);
  end;
end;

procedure TFmUsuario.MeUsuarioExit(Sender: TObject);
begin
  if Trim(MeUsuario.Text) <> '' then
    EdUsuario.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + MeUsuario.Text, true)
  else
    EdUsuario.Text := 'Todos';
end;

procedure TFmUsuario.MeUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtUsuario.Click;
end;

end.

