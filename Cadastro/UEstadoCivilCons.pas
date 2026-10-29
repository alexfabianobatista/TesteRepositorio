unit UEstadoCivilCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus;

type
  TFEstadoCivilCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadoCivilCons: TFEstadoCivilCons;

implementation

uses UEstadoCivil_cl;

{$R *.DFM}

procedure TFEstadoCivilCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEstadoCivil do
  Begin
    QEstadoCivilCons.Close;
    QEstadoCivilCons.SetVariable('DESC_ESTADO_CIVIL', METexto.Text);
    QEstadoCivilCons.Open;
  End;
end;

end.
