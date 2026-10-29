unit UNotaClassificacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFNotaClassificacaoCons = class(TFTConsulta)
    MEClassificadora: TMaskEdit;
    SpeedButton8: TSpeedButton;
    EDClassificadora: TEdit;
    Label2: TLabel;
    MEDestino: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EDDestino: TEdit;
    Label3: TLabel;
    MEProduto: TMaskEdit;
    SpeedButton2: TSpeedButton;
    EDProduto: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    MEDtInicio: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MEDtFim: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    MEFilial: TMaskEdit;
    EDFilial: TEdit;
    procedure MEClassificadoraExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure MEDestinoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaClassificacaoCons: TFNotaClassificacaoCons;

implementation

uses UOracle_cl, UCadastroCons, UCadastro_cl, UProdutoCons, UProduto_cl,
  UNotaClassificacao_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFNotaClassificacaoCons.MEClassificadoraExit(Sender: TObject);
begin
  inherited;
  if Trim(MEClassificadora.Text) <> '' then
    EDClassificadora.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Trim(MEClassificadora.Text))
  else
    EDClassificadora.Text := 'Todas';
end;

procedure TFNotaClassificacaoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    MEDestino.Text := DMCadastro.QCadastroConsCOD_cadastro.text;
    MEDestinoExit(Sender);
  end;
end;

procedure TFNotaClassificacaoCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
    EDProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(MEProduto.Text))
  else
    EDProduto.Text := 'Todos';
end;

procedure TFNotaClassificacaoCons.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
  begin
    MEClassificadora.Text := DMCadastro.QCadastroConsCOD_cadastro.text;
    MEClassificadoraExit(Sender);
  end;
end;

procedure TFNotaClassificacaoCons.MEDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEDestino.Text) <> '' then
    EDDestino.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + Trim(MEDestino.Text))
  else
    EDDestino.Text := 'Todos';
end;

procedure TFNotaClassificacaoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
  begin
    MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.text;
    MEProdutoExit(Sender);
  end;
end;

procedure TFNotaClassificacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMNotaClassificacao.QNotaClassificacaoCons.close;

  if Trim(MEClassificadora.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_CADASTRO_CLASSIFICADORA',strtoint(MEClassificadora.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_CADASTRO_CLASSIFICADORA',null);

  if Trim(MEDestino.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_CADASTRO_DESTINO',strtoint(MEDestino.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_CADASTRO_DESTINO',null);

  if Trim(MEProduto.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_PRODUTO',strtoint(MEProduto.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_PRODUTO',null);

  if Trim(MEFilial.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_FILIAL',strtoint(MEFilial.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('COD_FILIAL',null);

  if Trim(MEDtInicio.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('DT_EMISSAO_INI',strtoDate(MEDtInicio.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('DT_EMISSAO_INI',null);

  if Trim(MEDtFim.Text) <> '' then
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('DT_EMISSAO_FIM',strtoDate(MEDtFim.Text))
  else
    DMNotaClassificacao.QNotaClassificacaoCons.SetVariable('DT_EMISSAO_FIM',null);

  DMNotaClassificacao.QNotaClassificacaoCons.open;
end;

procedure TFNotaClassificacaoCons.MEFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial.Text) <> '' then
    EDFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(MEFilial.Text))
  else
    EDFilial.Text := 'Todas';
end;

procedure TFNotaClassificacaoCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    MEFilial.Text := DMFilial.QFilialConsCOD_Filial.text;
    MEFilialExit(Sender);
  end;
end;

end.
