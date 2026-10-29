unit UGeneroProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls;

type
  TFGeneroProdutoCons = class(TFTConsulta)
    RGOrdem: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeneroProdutoCons: TFGeneroProdutoCons;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFGeneroProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMProduto do
  Begin
    QGeneroProdutoCons.Close;
    QGeneroProdutoCons.SQL[QGeneroProdutoCons.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case RGOrdem.ItemIndex of
      0: QGeneroProdutoCons.SQL.Add('ORDER BY TB_GENERO_PRODUTO.DESC_GENERO_PRODUTO');
      1: QGeneroProdutoCons.SQL.Add('ORDER BY TB_GENERO_PRODUTO.COD_GENERO_PRODUTO');
    End;
    QGeneroProdutoCons.SetVariable('DESC_GENERO_PRODUTO',Trim(METexto.Text));
    QGeneroProdutoCons.Open;
  End;
end;

end.
