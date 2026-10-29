unit UNotaClassificacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;

type
  TDMNotaClassificacao = class(TDataModule)
    QNotaClassificacao: TOracleDataSet1;
    QNotaClassificacaoCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QNotaClassificacaoCOD_CADASTRO: TIntegerField;
    QNotaClassificacaoCOD_PRODUTO: TIntegerField;
    QNotaClassificacaoNUM_GUIA_RECOLHIMENTO: TIntegerField;
    QNotaClassificacaoVAL_UNITARIO: TFloatField;
    QNotaClassificacaoDT_PERIODO_INICIO: TDateTimeField;
    QNotaClassificacaoDT_PERIODO_FIM: TDateTimeField;
    QNotaClassificacaoQT_DIFERENCA: TIntegerField;
    QNotaClassificacaoItem: TOracleDataSet1;
    QNotaClassificacaoItemCOD_NOTA_CLASSIFICACAO_ITEM: TIntegerField;
    QNotaClassificacaoItemCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QNotaClassificacaoItemCOD_NOTA_CAB: TIntegerField;
    QNotaClassificacaoItemGrid: TOracleDataSet1;
    QNotaClassificacaoItemGridCOD_NOTA_CLASSIFICACAO_ITEM: TIntegerField;
    QNotaClassificacaoItemGridCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QNotaClassificacaoItemGridCOD_NOTA_CAB: TIntegerField;
    QNotaClassificacaoItemGridNUM_NOTA: TIntegerField;
    QNotaClassificacaoItemGridDESC_PLACA: TStringField;
    QNotaClassificacaoItemGridDT_EMISSAO: TDateTimeField;
    QNotaClassificacaoCons: TOracleDataSet1;
    QNotaClassificacaoCOD_CADASTRO_DESTINO: TIntegerField;
    QNotaClassificacaoDT_EMISSAO: TDateTimeField;
    QNotaClassificacaoConsCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QNotaClassificacaoConsCOD_CADASTRO: TIntegerField;
    QNotaClassificacaoConsCOD_PRODUTO: TIntegerField;
    QNotaClassificacaoConsNUM_GUIA_RECOLHIMENTO: TIntegerField;
    QNotaClassificacaoConsVAL_UNITARIO: TFloatField;
    QNotaClassificacaoConsDT_PERIODO_INICIO: TDateTimeField;
    QNotaClassificacaoConsDT_PERIODO_FIM: TDateTimeField;
    QNotaClassificacaoConsDT_EMISSAO: TDateTimeField;
    QNotaClassificacaoConsQT_DIFERENCA: TIntegerField;
    QNotaClassificacaoConsNOME_CLASSIFICADORA: TStringField;
    QNotaClassificacaoConsNOME_DESTINO: TStringField;
    QNotaClassificacaoConsDESC_PRODUTO: TStringField;
    QNotaClassificacaoItemGridQT_QUANTIDADE: TFloatField;
    QNotaClassificacaoCOD_CONTA_PAGAR: TIntegerField;
    QNotaClassificacaoCOD_FILIAL: TIntegerField;
    QRNotaClassificacaoAberto: TOracleDataSet1;
    QRNotaClassificacaoAbertoDESC_PRODUTO: TStringField;
    QRNotaClassificacaoAbertoCOD_PRODUTO: TFloatField;
    QRNotaClassificacaoAbertoCOD_FILIAL: TIntegerField;
    QRNotaClassificacaoAbertoNOME: TStringField;
    QRNotaClassificacaoAbertoNUM_NOTA: TIntegerField;
    QRNotaClassificacaoAbertoDT_EMISSAO: TDateTimeField;
    QRNotaClassificacaoAbertoDESC_PLACA: TStringField;
    QRNotaClassificacaoAbertoQT_QUANTIDADE: TFloatField;
    QRNotaClassificacaoAbertoCOD_CADASTRO: TIntegerField;
    QRNotaClassificacaoBaixado: TOracleDataSet1;
    QRNotaClassificacaoBaixadoNUM_GUIA_RECOLHIMENTO: TIntegerField;
    QRNotaClassificacaoBaixadoVAL_UNITARIO: TFloatField;
    QRNotaClassificacaoBaixadoDT_PERIODO_INICIO: TDateTimeField;
    QRNotaClassificacaoBaixadoDT_PERIODO_FIM: TDateTimeField;
    QRNotaClassificacaoBaixadoQT_DIFERENCA: TIntegerField;
    QRNotaClassificacaoBaixadoDT_EMISSAO_FATURA: TDateTimeField;
    QRNotaClassificacaoBaixadoDESC_PRODUTO: TStringField;
    QRNotaClassificacaoBaixadoCOD_FILIAL: TIntegerField;
    QRNotaClassificacaoBaixadoNOME_CLASSIFICADORA: TStringField;
    QRNotaClassificacaoBaixadoNOME_DESTINO: TStringField;
    QRNotaClassificacaoBaixadoCOD_CADASTRO: TIntegerField;
    QRNotaClassificacaoBaixadoNUM_NOTA: TIntegerField;
    QRNotaClassificacaoBaixadoDT_EMISSAO_NOTA_CAB: TDateTimeField;
    QRNotaClassificacaoBaixadoDESC_PLACA: TStringField;
    QRNotaClassificacaoBaixadoQT_QUANTIDADE: TFloatField;
    QRNotaClassificacaoBaixadoCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QNotaCabClassificacaoCons: TOracleDataSet1;
    QNotaCabClassificacaoConsDESC_PRODUTO: TStringField;
    QNotaCabClassificacaoConsCOD_PRODUTO: TFloatField;
    QNotaCabClassificacaoConsCOD_FILIAL: TIntegerField;
    QNotaCabClassificacaoConsNOME: TStringField;
    QNotaCabClassificacaoConsCOD_CADASTRO: TIntegerField;
    QNotaCabClassificacaoConsNUM_NOTA: TIntegerField;
    QNotaCabClassificacaoConsDT_EMISSAO: TDateTimeField;
    QNotaCabClassificacaoConsDESC_PLACA: TStringField;
    QNotaCabClassificacaoConsQT_QUANTIDADE: TFloatField;
    QNotaCabClassificacaoConsCOD_NOTA_CAB: TIntegerField;
    QRNotaClassificacaoBaixadoCOD_CADASTRO_DESTINO: TIntegerField;
    QRNotaClassificacaoPorFatura: TOracleDataSet1;
    QRNotaClassificacaoPorFaturaNUM_GUIA_RECOLHIMENTO: TIntegerField;
    QRNotaClassificacaoPorFaturaVAL_UNITARIO: TFloatField;
    QRNotaClassificacaoPorFaturaDT_PERIODO_INICIO: TDateTimeField;
    QRNotaClassificacaoPorFaturaDT_PERIODO_FIM: TDateTimeField;
    QRNotaClassificacaoPorFaturaQT_DIFERENCA: TIntegerField;
    QRNotaClassificacaoPorFaturaDT_EMISSAO_FATURA: TDateTimeField;
    QRNotaClassificacaoPorFaturaDESC_PRODUTO: TStringField;
    QRNotaClassificacaoPorFaturaCOD_FILIAL: TIntegerField;
    QRNotaClassificacaoPorFaturaNOME_CLASSIFICADORA: TStringField;
    QRNotaClassificacaoPorFaturaNOME_DESTINO: TStringField;
    QRNotaClassificacaoPorFaturaCOD_CADASTRO: TIntegerField;
    QRNotaClassificacaoPorFaturaNUM_NOTA: TIntegerField;
    QRNotaClassificacaoPorFaturaDT_EMISSAO_NOTA_CAB: TDateTimeField;
    QRNotaClassificacaoPorFaturaDESC_PLACA: TStringField;
    QRNotaClassificacaoPorFaturaQT_QUANTIDADE: TFloatField;
    QRNotaClassificacaoPorFaturaCOD_NOTA_CLASSIFICACAO: TIntegerField;
    QRNotaClassificacaoPorFaturaCOD_CADASTRO_DESTINO: TIntegerField;
    QNotaClassificacaoVAL_DIFERENCA: TFloatField;
    procedure QNotaClassificacaoItemAfterPost(DataSet: TDataSet);
    procedure QNotaClassificacaoItemAfterDelete(DataSet: TDataSet);
    procedure QNotaClassificacaoItemAfterScroll(DataSet: TDataSet);
    procedure QNotaClassificacaoItemGridAfterScroll(DataSet: TDataSet);
    procedure QNotaClassificacaoItemBeforePost(DataSet: TDataSet);
    procedure QNotaClassificacaoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotaClassificacao: TDMNotaClassificacao;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMNotaClassificacao.QNotaClassificacaoItemAfterPost(
  DataSet: TDataSet);
begin
  QNotaClassificacaoItemGrid.Refresh;
end;

procedure TDMNotaClassificacao.QNotaClassificacaoItemAfterDelete(
  DataSet: TDataSet);
begin
  QNotaClassificacaoItemGrid.Refresh;
end;

procedure TDMNotaClassificacao.QNotaClassificacaoItemAfterScroll(
  DataSet: TDataSet);
begin
  //--------usado para sincronizar os dados da query editavel com os dados da query do grid-----------
  if QNotaClassificacaoItemGrid.Active then
    if QNotaClassificacaoItemGridCOD_NOTA_CLASSIFICACAO_ITEM.Value <> QNotaClassificacaoItemCOD_NOTA_CLASSIFICACAO_ITEM.Value then
      QNotaClassificacaoItemGrid.Locate('COD_NOTA_CLASSIFICACAO_ITEM',QNotaClassificacaoItemCOD_NOTA_CLASSIFICACAO_ITEM.Value,[]);
  //--------------------------------------------------------------------------------------------------
end;

procedure TDMNotaClassificacao.QNotaClassificacaoItemGridAfterScroll(
  DataSet: TDataSet);
begin
  //--------usado para sincronizar os dados da query editavel com os dados da query do grid-----------
  if QNotaClassificacaoItem.Active then
    if QNotaClassificacaoItemGridCOD_NOTA_CLASSIFICACAO_ITEM.Value <> QNotaClassificacaoItemCOD_NOTA_CLASSIFICACAO_ITEM.Value then
      QNotaClassificacaoItem.Locate('COD_NOTA_CLASSIFICACAO_ITEM',QNotaClassificacaoItemGridCOD_NOTA_CLASSIFICACAO_ITEM.Value,[]);
  //--------------------------------------------------------------------------------------------------
end;

procedure TDMNotaClassificacao.QNotaClassificacaoItemBeforePost(
  DataSet: TDataSet);
var wVal : string;
begin
  if not QNotaClassificacaoCOD_CONTA_PAGAR.IsNull then
  begin
    QNotaClassificacaoItem.cancel;
    raise Exception.Create('Essa nota de Classificação já gerou contas a pagar. Nenhum item pode ser incluído.');
  end;

  //------verifica se a nota possui o campo COD_CADASTRO_CLASSIFICACAO <> null-----
  if QNotaClassificacaoItemCOD_NOTA_CAB.Text <> '' then
  begin
    wVal := DMOracle.BuscaNome('SELECT COD_CADASTRO_CLASSIFICACAO FROM TB_NOTA_CAB','COD_NOTA_CAB = ' + QNotaClassificacaoItemCOD_NOTA_CAB.Text);
    if wVal = '' then
    begin
      QNotaClassificacaoItem.cancel;
      raise Exception.Create('Essa nota não possui empresa de classificação informada.');
    end;
  end;
  //-------------------------------------------------------------------------------

  //----verifica se a nota_cab ja foi utilizada por outra nota de classificacao----
  if QNotaClassificacaoItemCOD_NOTA_CAB.Text <> '' then
  begin
    wVal := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CLASSIFICACAO_ITEM','COD_NOTA_CAB = ' + QNotaClassificacaoItemCOD_NOTA_CAB.Text);
    if wVal <> '' then
    begin
      QNotaClassificacaoItem.cancel;
      raise Exception.Create('Essa nota já foi utilizada.');
    end;
  end;
  //-------------------------------------------------------------------------------
end;

procedure TDMNotaClassificacao.QNotaClassificacaoBeforePost(
  DataSet: TDataSet);
begin
  if not QNotaClassificacaoCOD_CONTA_PAGAR.IsNull then
    if QNotaClassificacaoCOD_CONTA_PAGAR.OldValue <> null then //se o valor anterior era null, significa que o contas a pagar foi gerado agora
      raise Exception.Create('Essa nota de Classificação já gerou contas a pagar. Não pode ser alterada.');
end;

end.
