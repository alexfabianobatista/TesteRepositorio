unit UPrecoPocket_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPrecoPocket_Cons = class(TFTConsulta)
    MeProduto: TMaskEdit;
    SBClasse: TSpeedButton;
    Label2: TLabel;
    SbVendedor: TSpeedButton;
    MeVendedor: TMaskEdit;
    procedure SBClasseClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SbVendedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPocket_Cons: TFPrecoPocket_Cons;

implementation

uses UPrecoPocket_cl, UClasseCons, UOracle_cl, UClasse_cl, UProdutoCons,
  UProduto_cl, UVendedorCons, UVendedor_cl;

{$R *.DFM}

procedure TFPrecoPocket_Cons.SBClasseClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MeProduto.Text:= DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFPrecoPocket_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPrecoPocket do
  begin
    QPrecoPocketCons.Close;
    if Trim(MeProduto.Text)<>'' then
       QPrecoPocketCons.SetVariable('PRODUTO',MeProduto.Text)
     ELSE
       QPrecoPocketCons.SetVariable('PRODUTO',NULL);
    if Trim(MeVendedor.Text)<>'' then
       QPrecoPocketCons.SetVariable('VENDEDOR',MeVendedor.Text)
     ELSE
       QPrecoPocketCons.SetVariable('VENDEDOR',NULL);

    QPrecoPocketCons.Open;
 end;
end;

procedure TFPrecoPocket_Cons.SbVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
     MeVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

end.
