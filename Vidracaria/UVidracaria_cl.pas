unit UVidracaria_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, Provider;

type
  TDmVidracaria = class(TDataModule)
    QForno: TOracleDataSet1;
    QFornoCOD_PEDIDO_CAB: TIntegerField;
    QFornoCOD_PECA: TStringField;
    QFornoNOME_CADASTRO: TStringField;
    QCorte: TOracleDataSet1;
    QMarcacao: TOracleDataSet1;
    QUsinagem: TOracleDataSet1;
    QUsinagemCOD_PEDIDO_CAB: TIntegerField;
    QUsinagemCOD_PECA: TStringField;
    QUsinagemNOME_CADASTRO: TStringField;
    QMarcacaoCOD_PEDIDO_CAB: TIntegerField;
    QMarcacaoCOD_PECA: TStringField;
    QMarcacaoNOME_CADASTRO: TStringField;
    QCorteCOD_PEDIDO_CAB: TIntegerField;
    QCorteCOD_PECA: TStringField;
    QCorteNOME_CADASTRO: TStringField;
    QAcompanhamento: TOracleDataSet1;
    QExportaPedido: TOracleDataSet1;
    DspExportaPedido: TDataSetProvider;
    CdExportaPedido: TClientDataSet;
    QExportarItem: TOracleDataSet1;
    QExportaPedidoCOD_PEDIDO_CAB: TIntegerField;
    QExportaPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QExportaPedidoNOME: TStringField;
    QExportaPedidoDESC_PRODUTO: TStringField;
    QExportaPedidoIND_EXPORTADO: TStringField;
    CdExportaPedidoCOD_PEDIDO_CAB: TIntegerField;
    CdExportaPedidoDESC_COMPLEMENTO_OBS: TStringField;
    CdExportaPedidoNOME: TStringField;
    CdExportaPedidoDESC_PRODUTO: TStringField;
    CdExportaPedidoIND_EXPORTADO: TStringField;
    QExportaReposicao: TOracleDataSet1;
    QExportaReposicaoCOD_PEDIDO_CAB: TIntegerField;
    QExportaReposicaoNOME: TStringField;
    QExportaReposicaoDESC_PRODUTO: TStringField;
    QExportaReposicaoIND_EXPORTADO: TStringField;
    QExportaReposicaoCOD_PECA: TStringField;
    DspExportaReposicao: TDataSetProvider;
    CdExportaReposicao: TClientDataSet;
    CdExportaReposicaoCOD_PEDIDO_CAB: TIntegerField;
    CdExportaReposicaoNOME: TStringField;
    CdExportaReposicaoDESC_PRODUTO: TStringField;
    CdExportaReposicaoIND_EXPORTADO: TStringField;
    CdExportaReposicaoCOD_PECA: TStringField;
    QExportaReposicaoCOD_PEDIDO_ITEM: TIntegerField;
    CdExportaReposicaoCOD_PEDIDO_ITEM: TIntegerField;
    QSerie: TOracleDataSet1;
    QQuebra: TOracleDataSet1;
    QQuebraSetor: TOracleDataSet1;
    QSerieNUM_SERIE: TIntegerField;
    QQuebraCOD_MATERIAL_QUEBRA: TFloatField;
    QQuebraDT_QUEBRA: TDateTimeField;
    QQuebraCOD_MATERIAL: TFloatField;
    QQuebraDT_REPOSICAO: TDateTimeField;
    QQuebraDESC_TIPO: TStringField;
    QQuebraQT_TOTAL_QUEBRAS: TFloatField;
    QQuebraSetorCOD_PEDIDO_CAB: TIntegerField;
    QQuebraSetorCOD_PECA: TStringField;
    QQuebraSetorNOME_CADASTRO: TStringField;
    QAcompanhamentoCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QAcompanhamentoIND_CALCULO: TStringField;
    QAcompanhamentoIND_CORTE: TStringField;
    QAcompanhamentoIND_USINAGEM: TStringField;
    QAcompanhamentoIND_MARCACAO: TStringField;
    QAcompanhamentoIND_FORNO: TStringField;
    QAcompanhamentoIND_EMBARQUE: TStringField;
    QAcompanhamentoDT_EMBARQUE: TDateTimeField;
    QAcompanhamentoDT_CORTE: TDateTimeField;
    QAcompanhamentoDT_USINAGEM: TDateTimeField;
    QAcompanhamentoDT_MARCACAO: TDateTimeField;
    QAcompanhamentoDT_FORNO: TDateTimeField;
    QAcompanhamentoCOD_PECA: TStringField;
    QAcompanhamentoVAL_LARGURA: TFloatField;
    QAcompanhamentoVAL_ALTURA: TFloatField;
    QAcompanhamentoNOME_CADASTRO: TStringField;
    QAcompanhamentoIND_QUEBRA: TStringField;
    QAcompanhamentoNUM_LINHA: TFloatField;
    QExportarItemDESC_COMPLEMENTO_OBS: TStringField;
    QExportarItemDESC_CLASSE: TStringField;
    QExportarItemNOME: TStringField;
    QExportarItemDESC_FANTASIA: TStringField;
    QExportarItemDESC_PRODUTO: TStringField;
    QExportarItemDESC_COMPLEMENTO: TStringField;
    QExportarItemIND_QUEBRA: TStringField;
    QExportarItemCOD_PEDIDO_CAB: TIntegerField;
    QExportarItemVAL_LARGURA: TFloatField;
    QExportarItemVAL_ALTURA: TFloatField;
    QExportarItemVAL_AMOLADURA: TIntegerField;
    QExportarItemIND_TIPO: TStringField;
    QExportarItemCOD_PECA: TStringField;
    QExportarItemCOD_PEDIDO_ITEM: TIntegerField;
    QAcompanhamentoDESC_QUEBRAS: TStringField;
    QAcompanhamentoDT_BAIXA_VIDRACARIA: TDateTimeField;
    QRProducao: TOracleDataSet1;
    QRProducaoCOD_PRODUTO: TFloatField;
    QRProducaoDESC_PRODUTO: TStringField;
    QRProducaoQT_PECAS: TFloatField;
    QRProducaoQT_AREA: TFloatField;
    QRProducaoDESC_TIPO: TStringField;
    QRProducaoqt_pecas_quebra: TFloatField;
    QRProducaoqt_area_quebra: TFloatField;
    QRProducaoDATA_INI: TStringField;
    QRProducaoDATA_FIN: TStringField;
    QAcompanhamentoDESC_SERVICO: TStringField;
    QRPedidoMaterial: TOracleDataSet1;
    QRPedidoMaterialCOD_PECA: TStringField;
    QRPedidoMaterialVAL_LARGURA: TFloatField;
    QRPedidoMaterialVAL_ALTURA: TFloatField;
    QRPedidoMaterialIND_TIPO: TStringField;
    QRPedidoMaterialQT_ACABAMENTO: TFloatField;
    QRPedidoMaterialQT_CANTO: TIntegerField;
    QRPedidoMaterialDESC_SERVICO: TStringField;
    QRPedidoMaterialDESC_ACABAMENTO: TStringField;
    QRPedidoMaterialDESC_FORMA: TStringField;
    QRPedidoMaterialDESC_CANTO: TStringField;
    QRPedidoMaterialDESC_ESPECIFICACAO: TStringField;
    QRPedidoMaterialIND_REPOSICAO: TStringField;
    QRPedidoMaterialDESC_REPOSICAO: TStringField;
    QRPedidoMaterialCOD_CADASTRO: TIntegerField;
    QRPedidoMaterialDESC_FANTASIA: TStringField;
    QRPedidoMaterialCOD_PRODUTO: TFloatField;
    QRPedidoMaterialDESC_PRODUTO: TStringField;
    QRPedidoMaterialDT_EMISSAO: TDateTimeField;
    QRPedidoMaterialDT_ENTREGA: TDateTimeField;
    QRPedidoMaterialDESC_COMPLEMENTO_OBS: TStringField;
    QRPedidoMaterialVAL_UNITARIO: TFloatField;
    QRPedidoMaterialCOD_TRIBUTACAO: TIntegerField;
    QRPedidoMaterialCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoMaterialDESC_OBSERVACAO: TStringField;
    QRPedidoMaterialDESC_COMPLEMENTO_OBS2: TStringField;
    QRPedidoMaterialDESC_PRAZO_VENCIMENTO: TStringField;
    QRPedidoMaterialQT_PEDIDO: TFloatField;
    QRPedidoMaterialQT_VOLUME: TFloatField;
    QRPedidoMaterialNUM_LINHA: TFloatField;
    QRPedidoMaterialVAL_TOTAL: TFloatField;
    QRPedidoMaterialQT_ACABAMENTO_M2: TFloatField;
    QPedidoMaterialParam: TOracleDataSet1;
    QPedidoMaterialParamCOD_PEDIDO_CAB: TIntegerField;
    QPedidoMaterialParamDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoMaterialParamNOME: TStringField;
    QPedidoMaterialParamIND_SELECIONADO: TStringField;
    DspPedidoMaterialParam: TDataSetProvider;
    CdPedidoMaterialParam: TClientDataSet;
    CdPedidoMaterialParamCOD_PEDIDO_CAB: TIntegerField;
    CdPedidoMaterialParamDESC_COMPLEMENTO_OBS: TStringField;
    CdPedidoMaterialParamNOME: TStringField;
    CdPedidoMaterialParamIND_SELECIONADO: TStringField;
    QEmbarquePedidoParam: TOracleDataSet1;
    DspEmbarquePedidoParam: TDataSetProvider;
    CdEmbarquePedidoParam: TClientDataSet;
    QEmbarquePedidoParamCOD_PEDIDO_CAB: TIntegerField;
    QEmbarquePedidoParamDESC_COMPLEMENTO_OBS: TStringField;
    QEmbarquePedidoParamNOME: TStringField;
    QEmbarquePedidoParamIND_SELECIONADO: TStringField;
    QREmbarquePedido: TOracleDataSet1;
    QREmbarquePedidoCOD_PEDIDO_CAB: TIntegerField;
    QREmbarquePedidoCOD_CADASTRO: TIntegerField;
    QREmbarquePedidoDESC_COMPLEMENTO_OBS: TStringField;
    QREmbarquePedidoCOD_PRODUTO: TFloatField;
    QREmbarquePedidoQT_PEDIDO: TFloatField;
    QREmbarquePedidoDESC_PRODUTO: TStringField;
    QREmbarquePedidoNOME: TStringField;
    QREmbarquePedidoDESC_FANTASIA: TStringField;
    QREmbarquePedidoCOD_PECA: TStringField;
    QREmbarquePedidoVAL_LARGURA: TFloatField;
    QREmbarquePedidoVAL_ALTURA: TFloatField;
    QREmbarquePedidoIND_TIPO: TStringField;
    QREmbarquePedidoQT_PESO: TFloatField;
    CdEmbarquePedidoParamCOD_PEDIDO_CAB: TIntegerField;
    CdEmbarquePedidoParamDESC_COMPLEMENTO_OBS: TStringField;
    CdEmbarquePedidoParamNOME: TStringField;
    CdEmbarquePedidoParamIND_SELECIONADO: TStringField;
    QControle_ES: TOracleDataSet1;
    QControle_ESCOD_CONTROLE_ES: TIntegerField;
    QControle_ESIND_ENTRADA: TStringField;
    QControle_ESIND_SAIDA: TStringField;
    QControle_ESCOD_PEDIDO_ITEM: TIntegerField;
    QRControle_ES: TOracleDataSet1;
    DSControle_ES: TDataSource;
    QRControle_ESCOD_PEDIDO_CAB: TIntegerField;
    QRControle_ESCOD_PECA: TStringField;
    QRControle_ESVAL_LARGURA: TFloatField;
    QRControle_ESVAL_ALTURA: TFloatField;
    QRControle_ESIND_TIPO: TStringField;
    QRControle_ESNOME: TStringField;
    QRControle_ESIND_ENTRADA: TStringField;
    QRControle_ESIND_SAIDA: TStringField;
    QEmbarque: TOracleDataSet1;
    QEmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QEmbarqueCOD_PECA: TStringField;
    QEmbarqueNOME_CADASTRO: TStringField;
    QControleBaixa: TOracleDataSet1;
    QControleBaixaCOD_PRODUTO: TFloatField;
    QControleBaixaDESC_PRODUTO: TStringField;
    QControleBaixaQT_QUANTIDADE: TFloatField;
    QControleBaixaCOD_LOTE_TIPO: TIntegerField;
    QControleBaixaDESC_LOTE: TStringField;
    QRRastreamento: TOracleDataSet1;
    QRRastreamentoCOD_PEDIDO: TIntegerField;
    QRRastreamentoCOD_PECA: TStringField;
    QRRastreamentoDESC_LOTE: TStringField;
    QRRastreamentoNOME: TStringField;
    QRRastreamentoCOD_LOTE_RASTREADO: TIntegerField;
    QRRastreamentoCOD_CADASTRO: TIntegerField;
    QLaminado: TOracleDataSet1;
    QLaminadoCOD_PEDIDO_CAB: TIntegerField;
    QLaminadoCOD_PECA: TStringField;
    QLaminadoNOME_CADASTRO: TStringField;
    QREmbarquePedidoCOD_PEDIDO_ITEM: TIntegerField;
    QREmbarquePedidoDESC_COMPLEMENTO: TStringField;
    QREmbarquePedidoVAL_TOTAL: TFloatField;
    QREmbarquePedidoVAL_UNITARIO: TFloatField;
    QExportarItemDESC_OBSERVACAO: TStringField;
    QREmbarquePedidoQTD_ITEM: TFloatField;
    QConferencia: TOracleDataSet1;
    QConferenciaCOD_PEDIDO_CAB: TIntegerField;
    QConferenciaCOD_PECA: TStringField;
    QConferenciaNOME_CADASTRO: TStringField;
    QAcompanhamentoIND_CONFERENCIA: TStringField;
    QAcompanhamentoDT_CONFERENCIA: TDateTimeField;
    QRQuebra: TOracleDataSet1;
    QRQuebraDESC_TIPO: TStringField;
    QRQuebraDESC_PRODUTO: TStringField;
    QRQuebraQT_QUEBRA: TFloatField;
    QFuracao: TOracleDataSet1;
    QFuracaoCOD_PEDIDO_CAB: TIntegerField;
    QFuracaoCOD_PECA: TStringField;
    QFuracaoNOME_CADASTRO: TStringField;
    QLapidacao: TOracleDataSet1;
    QLapidacaoCOD_PEDIDO_CAB: TIntegerField;
    QLapidacaoCOD_PECA: TStringField;
    QLapidacaoNOME_CADASTRO: TStringField;
    Qlavacao: TOracleDataSet1;
    QlavacaoCOD_PEDIDO_CAB: TIntegerField;
    QlavacaoCOD_PECA: TStringField;
    QlavacaoNOME_CADASTRO: TStringField;
    QAcompanhamentoIND_LAVACAO: TStringField;
    QAcompanhamentoIND_LAPIDACAO: TStringField;
    QAcompanhamentoIND_FURACAO: TStringField;
    QAcompanhamentoDT_LAVACAO: TDateTimeField;
    QAcompanhamentoDT_LAPIDACAO: TDateTimeField;
    QAcompanhamentoDT_FURACAO: TDateTimeField;
    QRastreamento: TOracleDataSet1;
    QRastreamentoCOD_RASTREAMENTO: TIntegerField;
    QRastreamentoCOD_CHAPA: TIntegerField;
    QRastreamentoCOD_LOTE: TIntegerField;
    QRastreamentoCOD_PECA: TStringField;
    QRastreamentoDESC_CALCULO: TStringField;
    QRastreamentoDT_BAIXA: TDateTimeField;
    QDesenhoExportacao: TOracleDataSet1;
    QDesenhoExportacaoCOD_PEDIDO_CAB: TIntegerField;
    QDesenhoExportacaoCOD_MATERIAL: TFloatField;
    QDesenhoExportacaoCOD_PRODUTO: TFloatField;
    QDesenhoExportacaoDESC_PRODUTO: TStringField;
    QDesenhoExportacaoSEQ: TFloatField;
    QDesenhoExportacaoCOD_DESENHO_EXPORTACAO: TStringField;
    dspDesenhoExportacao: TDataSetProvider;
    cdsDesenhoExportacao: TClientDataSet;
    cdsDesenhoExportacaoCOD_PEDIDO_CAB: TIntegerField;
    cdsDesenhoExportacaoCOD_MATERIAL: TFloatField;
    cdsDesenhoExportacaoCOD_PRODUTO: TFloatField;
    cdsDesenhoExportacaoDESC_PRODUTO: TStringField;
    cdsDesenhoExportacaoSEQ: TFloatField;
    cdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO: TStringField;
    QExportarItemCOD_DESENHO_EXPORTACAO: TStringField;
    QREmbarquePedidoResumo: TOracleDataSet1;
    QREmbarquePedidoResumoQTD_ITEM: TFloatField;
    QREmbarquePedidoResumoMETRAGEM: TFloatField;
    QREmbarquePedidoResumoQT_PESO: TFloatField;
    QREmbarquePedidoResumoCOD_PRODUTO: TFloatField;
    QREmbarquePedidoResumoDESC_PRODUTO: TStringField;
    QREmbarquePedidoResumoDESC_COMPLEMENTO: TStringField;
    QRel_Rastreamento: TOracleDataSet1;
    QRel_RastreamentoCOD_RASTREAMENTO: TIntegerField;
    QRel_RastreamentoCOD_CHAPA: TIntegerField;
    QRel_RastreamentoCOD_LOTE: TIntegerField;
    QRel_RastreamentoCOD_PECA: TStringField;
    QRel_RastreamentoDT_BAIXA: TDateTimeField;
    QRel_RastreamentoDESC_PRODUTO: TStringField;
    QRel_RastreamentoDESC_LOTE: TStringField;
    QVinculaPecasPedido: TOracleDataSet1;
    QVinculaPecasPedidoCOD_PEDIDO_ITEM: TIntegerField;
    QVinculaPecasPedidoQT_PEDIDO: TFloatField;
    QVinculaPecasPedidoNUM_FABRICANTE: TStringField;
    QVinculaPecasPedidoval_largura: TIntegerField;
    QVinculaPecasPedidoval_altura: TIntegerField;
    QVinculaPecasPedidoind_tipo: TStringField;
    QREmbarquePedidoind_marcacao: TStringField;
    QREmbarquePedidoind_corte: TStringField;
    QREmbarquePedidoind_conferencia: TStringField;
    QREmbarquePedidoind_forno: TStringField;
    QAcompanhamentoIND_TIPO: TStringField;
    QMaterialCons: TOracleDataSet1;
    QMaterialConsCOD_PECA: TStringField;
    QMaterialConsCOD_PEDIDO: TIntegerField;
    QMaterialConsIND_REPOSICAO: TStringField;
    QMaterialConsCOD_PEDIDO_ITEM: TIntegerField;
    QMaterialConsNUM_SERIE: TIntegerField;
    QMaterialConsCOD_MATERIAL: TFloatField;
    QAcompanhamentoCons: TOracleDataSet1;
    QAcompanhamentoConsCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QAcompanhamentoConsIND_CALCULO: TStringField;
    QAcompanhamentoConsIND_CORTE: TStringField;
    QAcompanhamentoConsIND_USINAGEM: TStringField;
    QAcompanhamentoConsIND_MARCACAO: TStringField;
    QAcompanhamentoConsIND_FORNO: TStringField;
    QAcompanhamentoConsIND_EMBARQUE: TStringField;
    QAcompanhamentoConsIND_LAMINADO: TStringField;
    QAcompanhamentoConsIND_FURACAO: TStringField;
    QAcompanhamentoConsIND_LAPIDACAO: TStringField;
    QAcompanhamentoConsIND_LAVACAO: TStringField;
    QAcompanhamentoConsIND_CONFERENCIA: TStringField;
    QRMaterial: TOracleDataSet1;
    QRMaterialCOD_PECA: TStringField;
    QRMaterialCOD_PEDIDO: TIntegerField;
    QRMaterialIND_REPOSICAO: TStringField;
    QRMaterialCOD_PEDIDO_ITEM: TIntegerField;
    QRMaterialNUM_SERIE: TIntegerField;
    QRMaterialCOD_MATERIAL: TFloatField;
    procedure QRProducaoCalcFields(DataSet: TDataSet);
    procedure QVinculaPecasPedidoCalcFields(DataSet: TDataSet);
    procedure QREmbarquePedidoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVidracaria: TDmVidracaria;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.dfm}

procedure TDmVidracaria.QRProducaoCalcFields(DataSet: TDataSet);
var wAux: String;
begin
  wAux := DMOracle.BuscaNome(
    ' SELECT COUNT(*) FROM TB_MATERIAL_QUEBRA' +
    ' INNER JOIN TB_MATERIAL ON TB_MATERIAL.COD_MATERIAL = TB_MATERIAL_QUEBRA.COD_MATERIAL' +
    ' INNER JOIN TB_PEDIDO_ITEM ON TB_PEDIDO_ITEM.COD_PEDIDO_ITEM = TB_MATERIAL.COD_PEDIDO_ITEM'
    ,' TB_PEDIDO_ITEM.COD_PRODUTO = ' + QRProducaoCOD_PRODUTO.Text +
    ' AND TB_MATERIAL_QUEBRA.DESC_TIPO = ' + QuotedStr(QRProducaoDESC_TIPO.Text) +
    ' AND CAST(TB_MATERIAL_QUEBRA.DT_QUEBRA AS TIMESTAMP) BETWEEN CAST(' + QuotedStr(QRProducaoDATA_INI.Text) + ' AS TIMESTAMP) AND CAST(' + QuotedStr(QRProducaoDATA_FIN.Text) + ' AS TIMESTAMP)');
  QRProducaoqt_pecas_quebra.Value := StrToInt(wAux);

  wAux := DMOracle.BuscaNome(
    ' SELECT SUM(TB_PEDIDO_ITEM.QT_PEDIDO) FROM TB_MATERIAL_QUEBRA' +
    ' INNER JOIN TB_MATERIAL ON TB_MATERIAL.COD_MATERIAL = TB_MATERIAL_QUEBRA.COD_MATERIAL' +
    ' INNER JOIN TB_PEDIDO_ITEM ON TB_PEDIDO_ITEM.COD_PEDIDO_ITEM = TB_MATERIAL.COD_PEDIDO_ITEM'
    ,' TB_PEDIDO_ITEM.COD_PRODUTO = ' + QRProducaoCOD_PRODUTO.Text +
    ' AND TB_MATERIAL_QUEBRA.DESC_TIPO = ' + QuotedStr(QRProducaoDESC_TIPO.Text) +
    ' AND CAST(TB_MATERIAL_QUEBRA.DT_QUEBRA AS TIMESTAMP) BETWEEN CAST(' + QuotedStr(QRProducaoDATA_INI.Text) + ' AS TIMESTAMP) AND CAST(' + QuotedStr(QRProducaoDATA_FIN.Text) + ' AS TIMESTAMP)');
  if wAux = '' then
    QRProducaoqt_area_quebra.Value := 0
  else
    QRProducaoqt_area_quebra.Value := StrToFloat(wAux);
end;

procedure TDmVidracaria.QVinculaPecasPedidoCalcFields(DataSet: TDataSet);
begin
  QVinculaPecasPedidoval_largura.Text := DMOracle.BuscaNome('SELECT VAL_LARGURA FROM TB_MATERIAL',
                                         'COD_PEDIDO_ITEM='+QVinculaPecasPedidoCOD_PEDIDO_ITEM.Text);
  QVinculaPecasPedidoval_altura.Text := DMOracle.BuscaNome('SELECT VAL_ALTURA FROM TB_MATERIAL',
                                         'COD_PEDIDO_ITEM='+QVinculaPecasPedidoCOD_PEDIDO_ITEM.Text);
  QVinculaPecasPedidoind_tipo.Text := DMOracle.BuscaNome('SELECT IND_TIPO FROM TB_MATERIAL',
                                      'COD_PEDIDO_ITEM = '+QVinculaPecasPedidoCOD_PEDIDO_ITEM.Text);
end;

procedure TDmVidracaria.QREmbarquePedidoCalcFields(DataSet: TDataSet);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
  Begin
    QREmbarquePedidoind_marcacao.Value := DMOracle.BuscaNome('SELECT IND_MARCACAO FROM TB_ACOMPANHAMENTO_PEDIDO',
                                          'COD_PEDIDO_ITEM ='+ QREmbarquePedidoCOD_PEDIDO_ITEM.Text);
    QREmbarquePedidoind_FORNO.Value := DMOracle.BuscaNome('SELECT IND_FORNO FROM TB_ACOMPANHAMENTO_PEDIDO',
                                          'COD_PEDIDO_ITEM ='+ QREmbarquePedidoCOD_PEDIDO_ITEM.Text);
    QREmbarquePedidoind_CORTE.Value := DMOracle.BuscaNome('SELECT IND_CORTE FROM TB_ACOMPANHAMENTO_PEDIDO',
                                          'COD_PEDIDO_ITEM ='+ QREmbarquePedidoCOD_PEDIDO_ITEM.Text);
    QREmbarquePedidoind_CONFERENCIA.Value := DMOracle.BuscaNome('SELECT IND_CONFERENCIA FROM TB_ACOMPANHAMENTO_PEDIDO',
                                          'COD_PEDIDO_ITEM ='+ QREmbarquePedidoCOD_PEDIDO_ITEM.Text);
  end;
end;

end.
