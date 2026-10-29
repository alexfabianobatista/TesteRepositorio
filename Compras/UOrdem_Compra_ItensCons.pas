unit UOrdem_Compra_ItensCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, Grids, DBGrids;

type
  TFOrdem_Compra_ItensCons = class(TForm)
    DBGrid1: TDBGrid;
    DSCconsultaItens: TDataSource;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdem_Compra_ItensCons: TFOrdem_Compra_ItensCons;

implementation

uses UOrdemCompra_cl;

{$R *.DFM}

end.
