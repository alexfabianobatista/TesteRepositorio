unit UNotaCabClassificacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFNotaCabClassificacaoCons = class(TFTConsulta)
    Label2: TLabel;
    MEProduto: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EDProduto: TEdit;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    EDFilial: TEdit;
    Label4: TLabel;
    MECadastro: TMaskEdit;
    SpeedButton3: TSpeedButton;
    EDCadastro: TEdit;
    Label6: TLabel;
    EDCadastroClassificacao: TEdit;
    SpeedButton4: TSpeedButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    MEDtInicio: TMaskEdit;
    MEDtFim: TMaskEdit;
    MECadastroClassificacao: TMaskEdit;
    RGPorBaixa: TRadioGroup;
    Label8: TLabel;
    MENumNota: TMaskEdit;
    procedure MEProdutoExit(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure MECadastroClassificacaoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaCabClassificacaoCons: TFNotaCabClassificacaoCons;

implementation

uses UNotaClassificacao_cl, UOracle_cl, UProdutoCons, UProduto_cl,
  UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFNotaCabClassificacaoCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
    EDProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(MEProduto.Text))
  else
    EDProduto.Text := 'Todos';
end;

procedure TFNotaCabClassificacaoCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial.Text) <> '' then
    EDFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text))
  else
    EDFilial.Text := 'Todas';
end;

procedure TFNotaCabClassificacaoCons.MECadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MECadastro.Text) <> '' then
    EDCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(MECadastro.Text))
  else
    EDCadastro.Text := 'Todos';
end;

procedure TFNotaCabClassificacaoCons.MECadastroClassificacaoExit(
  Sender: TObject);
begin
  inherited;
  if Trim(MECadastroClassificacao.Text) <> '' then
    EDCadastroClassificacao.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(MECadastroClassificacao.Text))
  else
    EDCadastroClassificacao.Text := 'Todos';
end;

procedure TFNotaCabClassificacaoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFprodutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
  begin
    MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    MEProdutoExit(sender);
  end;
end;

procedure TFNotaCabClassificacaoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    MEFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    MEFilialExit(Sender);
  end;
end;

procedure TFNotaCabClassificacaoCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    MECadastro.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    MECadastroExit(Sender);
  end;
end;

procedure TFNotaCabClassificacaoCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    MECadastroClassificacao.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    MECadastroClassificacaoExit(Sender);
  end;
end;

procedure TFNotaCabClassificacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMNotaClassificacao.QNotaCabClassificacaoCons.close;

  if trim(MENumNota.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('NUM_NOTA',StrToInt(Trim(MENumNota.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('NUM_NOTA',null);

  if Trim(MEDtInicio.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('DT_EMISSAO_INI',StrToDate(Trim(MEDtInicio.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('DT_EMISSAO_INI',null);

  if Trim(MEDtFim.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('DT_EMISSAO_FIM',StrToDate(Trim(MEDtFim.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('DT_EMISSAO_FIM',null);

  if Trim(MEProduto.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_PRODUTO',StrToInt(Trim(MEProduto.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_PRODUTO',null);

  if Trim(MECadastro.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_CADASTRO',StrToInt(Trim(MECadastro.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_CADASTRO',null);

  if Trim(MECadastroClassificacao.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_CADASTRO_CLASSIFICACAO',StrToInt(Trim(MECadastroClassificacao.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_CADASTRO_CLASSIFICACAO',null);

  if Trim(MEFilial.Text) <> '' then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_FILIAL',StrToInt(Trim(MEFilial.Text)))
  else
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('COD_FILIAL',null);

  if RGPorBaixa.ItemIndex = 0 then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('IND_BAIXADA',null);
  if RGPorBaixa.ItemIndex = 1 then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('IND_BAIXADA','ABERTAS');
  if RGPorBaixa.ItemIndex = 2 then
    DMNotaClassificacao.QNotaCabClassificacaoCons.SetVariable('IND_BAIXADA','BAIXADAS');

  DMNotaClassificacao.QNotaCabClassificacaoCons.open;
end;

end.
