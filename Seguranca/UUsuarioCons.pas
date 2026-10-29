unit UUsuarioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, ExtCtrls,
  Variants;

type
  TFUsuarioCons = class(TFTConsulta)
    RGTipoUsuario: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure proc_consulta_usuario;
    procedure METextoChange(Sender: TObject);
    procedure RGTipoUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarioCons: TFUsuarioCons;

implementation

uses UUsuario_cl;

{$R *.DFM}

procedure TFUsuarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_usuario;
end;

procedure TFUsuarioCons.proc_consulta_usuario;
begin
   With DMUsuario do
  Begin
    QUsuarioCons.Close;
    QUsuarioCons.SetVariable('NOME', UpperCase('%' + METexto.Text + '%'));
    case RGTipoUsuario.ItemIndex of
      0 : QUsuarioCons.SetVariable('IND_PRIVILEGIO', null);
      1 : QUsuarioCons.SetVariable('IND_PRIVILEGIO', 'P');
      2 : QUsuarioCons.SetVariable('IND_PRIVILEGIO', 'N');
      3 : QUsuarioCons.SetVariable('IND_PRIVILEGIO', 'I');
    end;
    QUsuarioCons.Open;
  End;
end;

procedure TFUsuarioCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_usuario;
end;

procedure TFUsuarioCons.RGTipoUsuarioClick(Sender: TObject);
begin
  inherited;
  proc_consulta_usuario;
end;

end.
