unit UPadraoDescontoProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPadraoDescontoProdutoCons = class(TFTConsulta)
    BtPadraoProduto: TBitBtn;
    Label2: TLabel;
    MeProduto: TMaskEdit;
    BtProduto: TBitBtn;
    procedure BtPadraoProdutoClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoDescontoProdutoCons: TFPadraoDescontoProdutoCons;

implementation

uses UPadraoProduto_cl, UPadraoProdutoCons, UProdutoCons, UProduto_cl;

{$R *.dfm}

procedure TFPadraoDescontoProdutoCons.BtPadraoProdutoClick(
  Sender: TObject);
begin
  inherited;
  if FPadraoProdutoCons = Nil then
    FPadraoProdutoCons := TFPadraoProdutoCons.Create(Application);
  if FPadraoProdutoCons.ShowModal = MrOk then
  begin
    MeTexto.Text := DmPadraoProduto.QPadraoProdutoConsCOD_PADRAO_PRODUTO.Text;
  end;
end;

procedure TFPadraoDescontoProdutoCons.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    MeProduto.Text := DmProduto.QProdutoConsCOD_PRODUTO.Text;
  end;
end;

procedure TFPadraoDescontoProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPadraoProduto do
  begin
    QPadraoDescProdCons.Close;
    if MeTexto.Text <> '' then
      QPadraoDescProdCons.SetVariable('PADRAO_PRODUTO', MeTexto.Text)
    else
      QPadraoDescProdCons.SetVariable('PADRAO_PRODUTO', Null);
    if MeProduto.Text <> '' then
      QPadraoDescProdCons.SetVariable('PRODUTO', MeProduto.Text)
    else
      QPadraoDescProdCons.SetVariable('PRODUTO', Null);
    QPadraoDescProdCons.Open;
  end;
end;

end.
