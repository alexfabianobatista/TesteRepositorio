unit UGrupoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFGrupoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0Grupo: TMaskEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    ed0Grupo: TEdit;
    RG0Tipo: TRadioGroup;
    procedure ME0GrupoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SB0UsuarioClick(Sender: TObject);
    procedure ME0UsuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoParam: TFGrupoParam;

implementation

uses UOracle_cl, UGrupoCons, UGrupo_cl, UUsuarioCons, UUsuario_cl;

{$R *.DFM}

procedure TFGrupoParam.ME0GrupoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Grupo.Text) <> '' Then
    ED0Grupo.Text := DMOracle.BuscaNome('SELECT TB_GRUPOS.DESC_GRUPOS FROM TB_GRUPOS','COD_GRUPO = '+Trim(ME0Grupo.Text))
  Else
    ED0Grupo.Text := 'Todos';
end;

procedure TFGrupoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FGrupoCons = nil then
     FGrupoCons := TFGrupoCons.Create(Application);
  if FGrupoCons.ShowModal = mrOk then
  begin
    ME0Grupo.Text := DMGrupo.QGrupoConsCOD_Grupo.Text;
    ME0GrupoExit(Self);
  end;
end;

procedure TFGrupoParam.SB0UsuarioClick(Sender: TObject);
begin
  inherited;
  if FUsuarioCons = nil then
     FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.ShowModal = mrOk then
  begin
    //ME0Usuario.Text := DMUsuario.QUsuarioConsCOD_USUARIO.Text;
    //ME0UsuarioExit(Self);
  end;
end;

procedure TFGrupoParam.ME0UsuarioExit(Sender: TObject);
begin
  inherited;
  //If Trim(ME0Usuario.Text) <> '' Then
  //  ED0Usuario.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+Trim(ME0Usuario.Text))
  //Else
  // ED0Usuario.Text := 'Todos';
end;

end.
