unit UVeiculoModeloCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFVeiculoModeloCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoModeloCons: TFVeiculoModeloCons;

implementation

uses UOficina_cl;

{$R *.DFM}

procedure TFVeiculoModeloCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QVeiculoModeloCons.Close;
    if Trim(METexto.Text) = '' then
       QVeiculoModeloCons.SetVariable('DESC_MODELO',Null)
    else
       QVeiculoModeloCons.SetVariable('DESC_MODELO','%'+METexto.Text+'%');
    QVeiculoModeloCons.Open;
  end;
end;

end.
