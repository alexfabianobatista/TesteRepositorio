unit UPrecoPrazoVendedorCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmProduto, UFmVendedor, UFmEstado;

type
  TFPrecoPrazoVendedorCons = class(TFTConsulta)
    FmProduto1: TFmProduto;
    FmEstado1: TFmEstado;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPrazoVendedorCons: TFPrecoPrazoVendedorCons;

implementation

uses UPrecoPrazoVendedor_cl;

{$R *.dfm}

procedure TFPrecoPrazoVendedorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrecoPrazoVendedor do
  Begin
    QPrecoPrazoVendedorCons.Close;
    if (Trim(FmProduto1.MeProduto.Text) <> '') then
      QPrecoPrazoVendedorCons.SetVariable('PRODUTO',Trim(FmProduto1.MeProduto.Text))
    else
      QPrecoPrazoVendedorCons.SetVariable('PRODUTO', Null);
    if (Trim(FmEstado1.MeEstado.Text) <> '') then
      QPrecoPrazoVendedorCons.SetVariable('ESTADO',Trim(FmEstado1.MeEstado.Text))
    else
      QPrecoPrazoVendedorCons.SetVariable('ESTADO', Null);
    QPrecoPrazoVendedorCons.Open;
  End;
end;

end.
 