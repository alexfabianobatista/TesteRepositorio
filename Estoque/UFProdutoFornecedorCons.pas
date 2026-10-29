unit UFProdutoFornecedorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons, variants, Menus;

type
  TFProdutoFornecedorCons = class(TFTConsulta)
    Label2: TLabel;
    EdCodProduto: TEdit;
    SBCadastroCons: TSpeedButton;
    SBProdutoCons: TSpeedButton;
    MEProdutoDesc: TMaskEdit;
    MECadastroNome: TMaskEdit;
    EdCodCadastro: TEdit;
    Label3: TLabel;
    procedure EdCodCadastroChange(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure EdCodProdutoChange(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoFornecedorCons: TFProdutoFornecedorCons;

implementation

uses UProduto_cl, UOracle_cl, UCadastroCons, UCadastro_cl, UProdutoCons;

{$R *.DFM}

procedure TFProdutoFornecedorCons.EdCodCadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCodCadastro.Text) <> '' then
     MECadastroNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+EdCodCadastro.Text)
  else
     MECadastroNome.Clear;
end;

procedure TFProdutoFornecedorCons.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro do
    begin
      EdCodCadastro.Text := QCadastroConsCOD_CADASTRO.Text;
      MECadastroNome.Text := QCadastroConsNOME.Value;
    end;
  end
  else
  begin
    EdCodCadastro.Text := '';
    MECadastroNome.Text := '';
  end;
end;

procedure TFProdutoFornecedorCons.EdCodProdutoChange(Sender: TObject);
begin
  inherited;
 if Trim(EdCodProduto.Text) <> '' then
    MEProdutoDesc.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+EdCodProduto.Text)
  else
    MEProdutoDesc.Clear;
end;

procedure TFProdutoFornecedorCons.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    with DMProduto do
    begin
      EdCodProduto.Text := QProdutoConsCOD_PRODUTO.Text;
      MEProdutoDesc.Text := QProdutoConsDESC_PRODUTO.Value;
    end;
  end
  else
  begin
    EdCodProduto.Text := '';
    MEProdutoDesc.Text := '';
  end;
end;

procedure TFProdutoFornecedorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QProdFornConsLcto.Close;
    if Trim(METexto.Text) = '' then
       QProdFornConsLcto.SetVariable('COD_PRODUTO_FORNECEDOR',Null)
    else
       QProdFornConsLcto.SetVariable('COD_PRODUTO_FORNECEDOR',METexto.Text);

    if Trim(EdCodCadastro.Text) = '' then
       QProdFornConsLcto.SetVariable('COD_CADASTRO',Null)
    else
       QProdFornConsLcto.SetVariable('COD_CADASTRO',EdCodCadastro.Text);

    if Trim(EdCodProduto.Text) = '' then
       QProdFornConsLcto.SetVariable('COD_PRODUTO',Null)
    else
       QProdFornConsLcto.SetVariable('COD_PRODUTO',EdCodProduto.Text);

    QProdFornConsLcto.Open;

  end;
end;

end.
