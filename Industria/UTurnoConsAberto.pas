unit UTurnoConsAberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTurnoConsAberto = class(TFTConsulta)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoConsAberto: TFTurnoConsAberto;

implementation

uses UTurno_cl;

{$R *.DFM}

end.
