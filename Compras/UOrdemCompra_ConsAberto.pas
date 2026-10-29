unit UOrdemCompra_ConsAberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants;

type
  TFOrdemCompra_ConsAberto = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    Label3: TLabel;
    MEProduto: TMaskEdit;
    BtConsProduto: TBitBtn;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCompra_ConsAberto: TFOrdemCompra_ConsAberto;

implementation

uses UOrdemCompra_cl, UCadastroCons, UFilialCons, UProdutoCons,
  UCadastro_cl, UFilial_cl, UProduto_cl;

{$R *.DFM}


procedure TFOrdemCompra_ConsAberto.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;


procedure TFOrdemCompra_ConsAberto.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;


procedure TFOrdemCompra_ConsAberto.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFOrdemCompra_ConsAberto.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrdemCompra do
  Begin
    QOCAberto.Close;
    If Trim(METexto.Text) = '' then
      QOCAberto.SetVariable('CADASTRO',Null)
    Else
      QOCAberto.SetVariable('CADASTRO',METexto.Text);
    If Trim(MEFilial.Text) = '' then
      QOCAberto.SetVariable('FILIAL',Null)
    Else
      QOCAberto.SetVariable('FILIAL',MEFilial.Text);
    If Trim(MEProduto.Text) = '' then
      QOCAberto.SetVariable('PRODUTO',Null)
    Else
      QOCAberto.SetVariable('PRODUTO',MEProduto.Text);
      
    QOCAberto.Open;
  end;
end;

end.
