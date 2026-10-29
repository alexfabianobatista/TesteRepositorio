unit UEstadoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, ActnList,
  ComCtrls;

type
  TFEstadoCons = class(TFTConsulta)
    StatusBar1: TStatusBar;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure proc_consulta_estado;
    procedure METextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadoCons: TFEstadoCons;

implementation

uses UEstado_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFEstadoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_estado;
end;

procedure TFEstadoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFEstadoCons.proc_consulta_estado;
begin
   With DMEstado do
  Begin
    QEstadoCons.Close;
    QEstadoCons.SetVariable('NOME_ESTADO',METexto.Text);
    QEstadoCons.Open;
  End;
end;

procedure TFEstadoCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_estado;
end;

end.
