unit UPedidoItensCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids;

type
  TFPedidoItensCons = class(TForm)
    DsPedidoItensCons: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoItensCons: TFPedidoItensCons;

implementation

uses UPedido_cl;

{$R *.DFM}

end.
