unit UPadraoDescontoProdutoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFPadraoDescontoProdutoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME1PadraoProduto: TMaskEdit;
    Bt1PadraoProduto: TBitBtn;
    Label2: TLabel;
    Me1Produto: TMaskEdit;
    Bt1Produto: TBitBtn;
    Ed1PadraoProduto: TEdit;
    Ed1Produto: TEdit;
    procedure Bt1PadraoProdutoClick(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure ME1PadraoProdutoExit(Sender: TObject);
    procedure Me1ProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoDescontoProdutoParam: TFPadraoDescontoProdutoParam;

implementation

uses UPadraoProdutoCons, UPadraoProduto_cl, UProdutoCons, UProduto_cl,
  UOracle_cl;

{$R *.dfm}

procedure TFPadraoDescontoProdutoParam.Bt1PadraoProdutoClick(
  Sender: TObject);
begin
  inherited;
   if FPadraoProdutoCons = Nil then
    FPadraoProdutoCons := TFPadraoProdutoCons.Create(Application);
  if FPadraoProdutoCons.ShowModal = MrOk then
  begin
    Me1PadraoProduto.Text := DmPadraoProduto.QPadraoProdutoConsCOD_PADRAO_PRODUTO.Text;
    Me1PadraoProdutoExit(Self);
  end;
end;

procedure TFPadraoDescontoProdutoParam.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    Me1Produto.Text := DmProduto.QProdutoConsCOD_PRODUTO.Text;
    Me1ProdutoExit(Self);
  end;
end;

procedure TFPadraoDescontoProdutoParam.ME1PadraoProdutoExit(
  Sender: TObject);
begin
  inherited;
  if Me1PadraoProduto.Text <> '' then
    Ed1PadraoProduto.Text := DMOracle.BuscaNome('SELECT DESCRICAO FROM TB_PADRAO_PRODUTO','COD_PADRAO_PRODUTO = ' + Me1PadraoProduto.Text)
  else
    Ed1PadraoProduto.Text := 'Todos';
end;

procedure TFPadraoDescontoProdutoParam.Me1ProdutoExit(Sender: TObject);
begin
  inherited;
  if Me1Produto.Text <> '' then
    Ed1Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Me1Produto.Text)
  else
    Ed1Produto.Text := 'Todos';
end;

end.
