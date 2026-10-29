unit UItensProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TFItensProducaoCons = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FItensProducaoCons: TFItensProducaoCons;

implementation

uses UPedido_cl;

{$R *.dfm}

end.
