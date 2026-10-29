unit UServicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFServicoCons = class(TFTConsulta)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicoCons: TFServicoCons;

implementation

uses UOficina_cl;

{$R *.DFM}

end.
