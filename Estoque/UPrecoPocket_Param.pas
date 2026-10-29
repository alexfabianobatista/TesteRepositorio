unit UPrecoPocket_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFPrecoPocket_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    SB0Produto: TSpeedButton;
    Label101: TLabel;
    Me0Produto: TMaskEdit;
    Ed0Produto: TEdit;
    Sb0Vendedor: TSpeedButton;
    Label1: TLabel;
    Me0Vendedor: TMaskEdit;
    Ed0Vendedor: TEdit;
    procedure SB0ProdutoClick(Sender: TObject);
    procedure Me0ProdutoExit(Sender: TObject);
    procedure Me0VendedorExit(Sender: TObject);
    procedure Sb0VendedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPocket_Param: TFPrecoPocket_Param;

implementation

uses UProdutoCons, UProduto_cl, UOracle_cl, UVendedorCons, UVendedor_cl;

{$R *.DFM}

procedure TFPrecoPocket_Param.SB0ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    Me0Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me0ProdutoExit(Self);
  End;

end;

procedure TFPrecoPocket_Param.Me0ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Produto.Text) <> '' Then
    Ed0Produto.Text:=DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                          'COD_PRODUTO='+Trim(Me0Produto.Text))
  Else
    Ed0Produto.Text := 'Todos';

end;

procedure TFPrecoPocket_Param.Me0VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Vendedor.Text) <> '' Then
    Ed0Vendedor.Text:=DmOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                          'COD_VENDEDOR='+Trim(Me0Vendedor.Text))
  Else
    Ed0Vendedor.Text := 'Todos';

end;

procedure TFPrecoPocket_Param.Sb0VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    Me0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me0VendedorExit(Self);
  End;

end;

end.
