unit UConsultaAuditoriaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmDatas,
  Mask;

type
  TFConsultaAuditoriaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    FmDatas1: TFmDatas;
    MeUsuario: TMaskEdit;
    Label3: TLabel;
    BtUsuario: TBitBtn;
    EdUsuario: TEdit;
    procedure BtUsuarioClick(Sender: TObject);
    procedure MeUsuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultaAuditoriaParam: TFConsultaAuditoriaParam;

implementation

uses UUsuarioCons, UUsuario_cl;

{$R *.dfm}

procedure TFConsultaAuditoriaParam.BtUsuarioClick(Sender: TObject);
begin
  inherited;
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
  With DMUsuario do
  Begin
    QUsuario.Close;
    QUsuario.SetVariable('PK',QUsuarioConsCOD_USUARIO.Value);
    QUsuario.Open;
    MeUsuario.Text := QUsuarioCOD_USUARIO.Text;
    EdUsuario.Text := QUsuarioNOME.Value;
  end;
end;

procedure TFConsultaAuditoriaParam.MeUsuarioExit(Sender: TObject);
begin
  inherited;
  With DMUsuario do
  Begin
    if Trim(MeUsuario.Text) <> '' then
    begin
      QUsuario.Close;
      QUsuario.SetVariable('PK',trim(MeUsuario.Text));
      QUsuario.Open;
      MeUsuario.Text := QUsuarioCOD_USUARIO.Text;
      EdUsuario.Text := QUsuarioNOME.Value;
    end;
  end;
end;

end.
