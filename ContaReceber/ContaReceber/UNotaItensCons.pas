unit UNotaItensCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNotaItensCons = class(TFTConsulta)
    Label2: TLabel;
    MeVendedor: TMaskEdit;
    Label3: TLabel;
    MePagto: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaItensCons: TFNotaItensCons;

implementation

uses UNotaSaida_cl;

{$R *.dfm}

end.
