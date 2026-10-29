unit UNotaClassificacaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFNotaClassificacaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0Produto: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ED0Produto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ME0Filial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ED0Filial: TEdit;
    Label3: TLabel;
    ME0Cadastro: TMaskEdit;
    SpeedButton3: TSpeedButton;
    ED0Cadastro: TEdit;
    GroupBox1: TGroupBox;
    ME0DtInicio: TMaskEdit;
    ME0DtFim: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ME0CadastroClassificacao: TMaskEdit;
    SpeedButton4: TSpeedButton;
    ED0CadastroClassificacao: TEdit;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    ME1Produto: TMaskEdit;
    SpeedButton5: TSpeedButton;
    ED1Produto: TEdit;
    Label8: TLabel;
    ME1Filial: TMaskEdit;
    SpeedButton6: TSpeedButton;
    ED1Filial: TEdit;
    Label9: TLabel;
    ME1Cadastro: TMaskEdit;
    SpeedButton7: TSpeedButton;
    ED1Cadastro: TEdit;
    Label10: TLabel;
    ME1CadastroClassificacao: TMaskEdit;
    SpeedButton8: TSpeedButton;
    ED1CadastroClassificacao: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    ME1DtInicio: TMaskEdit;
    ME1DtFim: TMaskEdit;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    ME2Produto: TMaskEdit;
    SpeedButton9: TSpeedButton;
    ED2Produto: TEdit;
    Label14: TLabel;
    ME2Filial: TMaskEdit;
    SpeedButton10: TSpeedButton;
    ED2Filial: TEdit;
    Label15: TLabel;
    ME2Cadastro: TMaskEdit;
    SpeedButton11: TSpeedButton;
    ED2Cadastro: TEdit;
    Label16: TLabel;
    ME2CadastroClassificacao: TMaskEdit;
    SpeedButton12: TSpeedButton;
    ED2CadastroClassificacao: TEdit;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME2DtInicio: TMaskEdit;
    ME2DtFim: TMaskEdit;
    procedure ME0ProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ME0CadastroClassificacaoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure ME1CadastroClassificacaoExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaClassificacaoParam: TFNotaClassificacaoParam;

implementation

uses UOracle_cl, UProdutoCons, UProduto_cl, UFilial_cl, UFilialCons,
  UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFNotaClassificacaoParam.ME0ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Produto.Text) <> '' then
    ED0Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(ME0Produto.Text))
  else
    ED0Produto.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFprodutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
  begin
    ME0Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME0ProdutoExit(sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Filial.Text) <> '' then
    ED0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME0Filial.Text))
  else
    ED0Filial.Text := 'Todas';
end;

procedure TFNotaClassificacaoParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME0Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    ME0FilialExit(Sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Cadastro.Text) <> '' then
    ED0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(ME0Cadastro.Text))
  else
    ED0Cadastro.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    ME0CadastroExit(Sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME0CadastroClassificacaoExit(
  Sender: TObject);
begin
  inherited;
  if Trim(ME0CadastroClassificacao.Text) <> '' then
    ED0CadastroClassificacao.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(ME0CadastroClassificacao.Text))
  else
    ED0CadastroClassificacao.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    ME0CadastroClassificacao.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    ME0CadastroClassificacaoExit(Sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Produto.Text) <> '' then
    ED1Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(ME1Produto.Text))
  else
    ED1Produto.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFprodutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
  begin
    ME1Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME1ProdutoExit(sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.Text) <> '' then
    ED1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME1Filial.Text))
  else
    ED1Filial.Text := 'Todas';
end;

procedure TFNotaClassificacaoParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME1Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    ME1FilialExit(Sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Cadastro.Text) <> '' then
    ED1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(ME1Cadastro.Text))
  else
    ED1Cadastro.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    ME1CadastroExit(Sender);
  end;
end;

procedure TFNotaClassificacaoParam.ME1CadastroClassificacaoExit(
  Sender: TObject);
begin
  inherited;
  if Trim(ME1CadastroClassificacao.Text) <> '' then
    ED1CadastroClassificacao.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(ME1CadastroClassificacao.Text))
  else
    ED1CadastroClassificacao.Text := 'Todos';
end;

procedure TFNotaClassificacaoParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    ME1CadastroClassificacao.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    ME1CadastroClassificacaoExit(Sender);
  end;
end;

end.
