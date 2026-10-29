unit UDesdobramento_ClasparCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFDesdobramento_ClasparCons = class(TFTConsulta)
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesdobramento_ClasparCons: TFDesdobramento_ClasparCons;

implementation

uses UNotaSaida_cl;

{$R *.DFM}

end.
