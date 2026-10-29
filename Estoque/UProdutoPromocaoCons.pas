unit UProdutoPromocaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFProdutoPromocaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoPromocaoCons: TFProdutoPromocaoCons;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFProdutoPromocaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMProduto.QProdutoPromCons.Close;
  If METexto.Text <> '' then
    DMProduto.QProdutoPromCons.SetVariable('DESC_PROM',METexto.Text)
  Else
    DMProduto.QProdutoPromCons.SetVariable('DESC_PROM',Null);
  DMProduto.QProdutoPromCons.Open;
end;

end.
