unit UDRECons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFDRECons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDRECons: TFDRECons;

implementation

uses UDRE_cl, UFilialCons, UFilial_cl, UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TFDRECons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMDRE do
  begin
    QGrupoDreCons.Close;
    QGrupoDreCons.SetVariable('DESC_GRUPO_DRE', METexto.Text);
    QGrupoDreCons.Open;
  end;
end;

end.
