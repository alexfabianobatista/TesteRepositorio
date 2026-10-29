unit UAcompanhamentoReposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, UFmProduto;

type
  TFAcompanhamentoReposicao = class(TForm)
    FmProduto1: TFmProduto;
    DBGrid1: TDBGrid;
    DsAcompanhamento: TDataSource;
    procedure FmProduto1MeProdutoExit(Sender: TObject);
    procedure FmProduto1BtProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcompanhamentoReposicao: TFAcompanhamentoReposicao;

implementation

uses UPedido_cl;

{$R *.dfm}

procedure TFAcompanhamentoReposicao.FmProduto1MeProdutoExit(Sender: TObject);
begin
  FmProduto1.MeProdutoExit(Sender);

  DMPedido.QAcompanhamentoReposicao.Close;
  if Trim(FmProduto1.MeProduto.Text) = '' then
    DMPedido.QAcompanhamentoReposicao.SetVariable('COD_PRODUTO', null)
  else
    DMPedido.QAcompanhamentoReposicao.SetVariable('COD_PRODUTO', Trim(FmProduto1.MeProduto.Text));
  DMPedido.QAcompanhamentoReposicao.Open;
end;

procedure TFAcompanhamentoReposicao.FmProduto1BtProdutoClick(
  Sender: TObject);
begin
  FmProduto1.BtProdutoClick(Sender);
  FmProduto1.MeProduto.SetFocus;

end;

procedure TFAcompanhamentoReposicao.FormActivate(Sender: TObject);
begin
  FmProduto1MeProdutoExit(Self);
end;

end.

