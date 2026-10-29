unit UMensagemUsuarioCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFMensagemUsuarioCons = class(TFTConsulta)
    Label14: TLabel;
    SpeedButton8: TSpeedButton;
    MeCodUsuario: TMaskEdit;
    MeUsuario: TMaskEdit;
    procedure SpeedButton8Click(Sender: TObject);
    procedure MeCodUsuarioExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemUsuarioCons: TFMensagemUsuarioCons;

implementation

uses UMensagemUsuario_cl, UUsuario_cl, UUsuarioCons, UOracle_cl;

{$R *.dfm}

procedure TFMensagemUsuarioCons.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FUsuarioCons = Nil then
     FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.Showmodal = mrOk then
  Begin
    MeUsuario.Text := FloatToStr(DMUsuario.QUsuarioConsCOD_USUARIO.Value);
    MeCodUsuarioExit(Self);
  End;
end;

procedure TFMensagemUsuarioCons.MeCodUsuarioExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodUsuario.Text) <> '' then
    MeUsuario.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = ' + MeCodUsuario.Text, True)
  else
    MeUsuario.Text := 'Todos';
end;

procedure TFMensagemUsuarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmMensagemUsuario.QMensagemUsuarioCons.Close;
  if MeCodUsuario.Text = '' then
    DmMensagemUsuario.QMensagemUsuarioCons.SetVariable('COD_USUARIO_ORIGEM', Trim(MeCodUsuario.Text));
  DmMensagemUsuario.QMensagemUsuarioCons.Open;
end;

end.
