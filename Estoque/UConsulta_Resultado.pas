unit UConsulta_Resultado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db;

type
  TFConsulta_Resultado = class(TForm)
    DS_Consulta: TDataSource;
    DBG_Consulta: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsulta_Resultado: TFConsulta_Resultado;

implementation

{$R *.DFM}

end.
