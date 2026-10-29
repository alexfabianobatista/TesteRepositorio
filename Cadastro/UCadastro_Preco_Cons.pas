unit UCadastro_Preco_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFCadastro_Preco_Cons = class(TFTConsulta)
    Label2: TLabel;
    MeProduto: TMaskEdit;
    BtConsCadastro: TBitBtn;
    BtConsProduto: TBitBtn;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastro_Preco_Cons: TFCadastro_Preco_Cons;

implementation

uses UCadastro_Preco_cl, UCadastroCons, UProdutoCons, UCadastro_cl,
  UProduto_cl;

{$R *.dfm}

procedure TFCadastro_Preco_Cons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MeTexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFCadastro_Preco_Cons.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFCadastro_Preco_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMCadastro_Preco.QCadastro_Preco_Cons.Close;
  If Trim(MeTexto.Text) <> '' Then
     DMCadastro_Preco.QCadastro_Preco_Cons.SetVariable('Cod_Cadastro',Trim(MeTexto.Text))
  Else
     DMCadastro_Preco.QCadastro_Preco_Cons.SetVariable('Cod_Cadastro',Null);
  If Trim(MeProduto.Text) <> '' Then
     DMCadastro_Preco.QCadastro_Preco_Cons.SetVariable('Cod_Produto',Trim(MeProduto.Text))
  Else
     DMCadastro_Preco.QCadastro_Preco_Cons.SetVariable('Cod_Produto',Null);
  DMCadastro_Preco.QCadastro_Preco_Cons.Open;   
end;

end.
