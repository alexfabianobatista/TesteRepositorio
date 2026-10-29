unit UValorEfeitoSeguroCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFValorEfeitoSeguroCons = class(TFTConsulta)
    EdProduto: TEdit;
    SBProduto: TSpeedButton;
    MEProduto: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FValorEfeitoSeguroCons: TFValorEfeitoSeguroCons;

implementation

uses UValorEfeitoSeguro_cl, UOracle_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFValorEfeitoSeguroCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMValorEfeitoSeguro do
  Begin
    QValorEfeitoSeguroCons.Close;
    if Trim(MEProduto.Text) <> '' then
      QValorEfeitoSeguroCons.SetVariable('COD_PRODUTO',Trim(MEProduto.Text))
    else
      QValorEfeitoSeguroCons.SetVariable('COD_PRODUTO',null);

    QValorEfeitoSeguroCons.Open;
  End;
end;

procedure TFValorEfeitoSeguroCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + MeProduto.Text)
  else
    EdProduto.Text := 'Todos';
end;

procedure TFValorEfeitoSeguroCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MEProdutoExit(sender);
  end;
end;

end.
