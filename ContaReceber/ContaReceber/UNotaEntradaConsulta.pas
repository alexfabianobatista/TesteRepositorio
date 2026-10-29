unit UNotaEntradaConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNotaEntradaConsulta = class(TFTConsulta)
    Label2: TLabel;
    EdOrdemCompra: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaEntradaConsulta: TFNotaEntradaConsulta;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
