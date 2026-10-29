unit UGuiaAplicacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFGuiaAplicacaoCons = class(TFTConsulta)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaAplicacaoCons: TFGuiaAplicacaoCons;

implementation

uses UGuiaAplicacao_cl;

{$R *.DFM}

end.
