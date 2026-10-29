unit UVeiculoFabricanteCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFVeiculoFabricanteCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoFabricanteCons: TFVeiculoFabricanteCons;

implementation

uses UVeiculoFabricante_cl;

{$R *.DFM}

procedure TFVeiculoFabricanteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMVeiculoFabricante do
  begin
    QVeiculoFabricanteCons.Close;
    QVeiculoFabricanteCons.SetVariable('DESC_FABRICANTE',Trim(METexto.Text));
    QVeiculoFabricanteCons.Open;
  end;
end;

end.
