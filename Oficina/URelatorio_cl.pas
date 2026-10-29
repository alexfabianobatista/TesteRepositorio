unit URelatorio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOficina_Relatorio = class(TDataModule)
    QROSPendente: TOracleDataSet1;
    QRRequisicao_custo: TOracleDataSet1;
    QRRequisicao_custocod_cadastro: TIntegerField;
    QRRequisicao_custonome_cadastro: TStringField;
    QRProdutoCustoZero: TOracleDataSet1;
    QRProdutoCustoZeroCOD_PRODUTO: TFloatField;
    QRProdutoCustoZeroNUM_FABRICANTE: TStringField;
    QRProdutoCustoZeroCOD_FILIAL: TIntegerField;
    QRProdutoCustoZeroVL_ULTIMO_CUSTO: TFloatField;
    QRProdutoCustoZeroVL_CUSTO_MEDIO: TFloatField;
    QROSPendenteNUM_OS: TIntegerField;
    QROSPendenteDT_EMISSAO: TDateTimeField;
    QROSPendenteNOME: TStringField;
    QROSPendenteDESC_OS_TIPO: TStringField;
    QROSPendenteTOTALPECAS: TFloatField;
    QROrcamento_Oficina: TOracleDataSet1;
    QROrcamento_OficinaNUM_FABRICANTE: TStringField;
    QROrcamento_OficinaQT_QUANTIDADE: TIntegerField;
    QROrcamento_OficinaVAL_UNITARIO: TFloatField;
    QRMapaVendaOficina: TOracleDataSet1;
    QRMapaVendaOficinaVAL_NF_MAO_DE_OBRA: TFloatField;
    QRMapaVendaOficinaVAL_NF_SERVICO_TERCEIRO: TFloatField;
    QRMapaVendaOficinaVAL_NF_PECAS: TFloatField;
    QRMapaVendaOficinaVAL_NF_PECAS_ISENTAS: TFloatField;
    QRVendasLiquidas_Oficina: TOracleDataSet1;
    QRVendasLiquidas_OficinaCOD_VENDEDOR: TIntegerField;
    QRVendasLiquidas_OficinaTOTAL_PECAS_OS: TFloatField;
    QRVendasLiquidas_Balcao: TOracleDataSet1;
    QRVendasLiquidas_BalcaoCOD_VENDEDOR: TIntegerField;
    QRVendasLiquidas_BalcaoTOTAL_VENDA_BALCAO: TFloatField;
    QRVendasLiquidas_Custo_O: TOracleDataSet1;
    QRVendasLiquidas_Custo_B: TOracleDataSet1;
    QRVendasLiquidas_Custo_BCOD_VENDEDOR: TIntegerField;
    QRVendasLiquidas_Custo_BTOTAL_VENDA_BALCAO: TFloatField;
    QVendedorCons_Oficina: TOracleDataSet1;
    QVendedorCons_OficinaCOD_VENDEDOR: TIntegerField;
    QVendedorCons_OficinaNOME: TStringField;
    QRMapaVendaOficinaDT_SAIDA: TDateTimeField;
    QRRequisicao_custoNUM_OS: TIntegerField;
    QRRequisicao_custoDT_EMISSAO: TDateTimeField;
    QRRequisicao_custoQT_QUANTIDADE: TFloatField;
    QRRequisicao_custoVAL_UNITARIO: TFloatField;
    QRRequisicao_custoVAL_CUSTO: TFloatField;
    QRRequisicao_custoTOTAL_PRODUTO: TFloatField;
    QRRequisicao_custoTOTAL_CUSTO: TFloatField;
    QREtiquetaCodBarraNF: TOracleDataSet1;
    QEtiquetaCodigoBarra: TOracleDataSet1;
    QREtiquetaCodBarraNFCOD_PRODUTO: TFloatField;
    QREtiquetaCodBarraNFQT_QUANTIDADE: TFloatField;
    QREtiquetaCodBarraNFNUM_FABRICANTE: TStringField;
    QRVendasLiquidas_Custo_OCOD_VENDEDOR: TIntegerField;
    QRVendasLiquidas_Custo_OT_CUSTO_OS: TFloatField;
    QEtiquetaCodigoBarraETIQUETA1: TStringField;
    QEtiquetaCodigoBarraETIQUETA2: TStringField;
    QEtiquetaCodigoBarraETIQUETA3: TStringField;
    QEtiquetaCodigoBarraETIQUETA4: TStringField;
    QRVendaAvistaBalcao: TOracleDataSet1;
    QRVendaAvistaBalcaoCOD_FILIAL: TIntegerField;
    QRVendaAvistaBalcaoCOD_CADASTRO: TIntegerField;
    QRVendaAvistaBalcaoNUM_NOTA: TIntegerField;
    QRVendaAvistaBalcaoDT_EMISSAO: TDateTimeField;
    QRVendaAvistaBalcaoDT_MOVIMENTO: TDateTimeField;
    QRVendaAvistaBalcaoCOD_VENDEDOR: TIntegerField;
    QRVendaAvistaBalcaoNOME: TStringField;
    QRVendaAvistaBalcaoDESC_FILIAL: TStringField;
    QRVendaAvistaBalcaoTOTAL_NOTA: TFloatField;
    QRMapaVendaOficinaVAL_NF_SERVICO_CHAPEACAO: TFloatField;
    QRContagemPecas: TOracleDataSet1;
    QROSVeiculo: TOracleDataSet1;
    QROSVeiculoNUM_CHASSI: TStringField;
    QROSVeiculoDESC_MODELO: TStringField;
    QROSVeiculoDESC_CARACTERISTICA: TStringField;
    QROSVeiculoDESC_COR: TStringField;
    QROSVeiculoNUM_PLACA: TStringField;
    QROSVeiculoNUM_ANO: TIntegerField;
    QROSVeiculoNUM_OS: TIntegerField;
    QROSVeiculoDT_ENTRADA: TDateTimeField;
    QROSVeiculoDT_SAIDA: TDateTimeField;
    QRPecasEstoque: TOracleDataSet1;
    QRPecasEstoqueNUM_FABRICANTE: TStringField;
    QRPecasEstoqueVAL_CUSTO_MEDIO_FILIAL_1: TFloatField;
    QRPecasEstoqueVAL_ULTIMO_CUSTO_FILIAL_1: TFloatField;
    QRPecasEstoqueVAL_CUSTO_MEDIO_FILIAL_2: TFloatField;
    QRPecasEstoqueVAL_ULTIMO_CUSTO_FILIAL_2: TFloatField;
    QRPecasEstoqueQT_FILIAL_1: TFloatField;
    QRPecasEstoqueQT_FILIAL_2: TFloatField;
    QRPecasOEMEstoque: TOracleDataSet1;
    QRPecasOEMEstoqueNUM_FABRICANTE: TStringField;
    QRPecasOEMEstoqueVAL_CUSTO_MEDIO_FILIAL_1: TFloatField;
    QRPecasOEMEstoqueVAL_ULTIMO_CUSTO_FILIAL_1: TFloatField;
    QRPecasOEMEstoqueVAL_CUSTO_MEDIO_FILIAL_2: TFloatField;
    QRPecasOEMEstoqueVAL_ULTIMO_CUSTO_FILIAL_2: TFloatField;
    QRPecasOEMEstoqueQT_FILIAL_1: TFloatField;
    QRPecasOEMEstoqueQT_FILIAL_2: TFloatField;
    QRContagemPecasOEM: TOracleDataSet1;
    QRContagemPecasNUM_FABRICANTE: TStringField;
    QRContagemPecasCLASSE: TStringField;
    QRContagemPecasID_PECA: TStringField;
    QRContagemPecasOEMNUM_FABRICANTE: TStringField;
    QRPecasEstoqueCLASSE: TStringField;
    QRPecasEstoqueID_PECA: TStringField;
    QROSVeiculoDESC_SERVICO: TStringField;
    QROrcamento_OficinaDESC_OBS1: TStringField;
    QROrcamento_OficinaDESC_OBS2: TStringField;
    QROrcamento_Oficinanome: TStringField;
    QROrcamento_OficinaCOD_CADASTRO: TIntegerField;
    QROrcamento_Oficinaempresa: TStringField;
    QROrcamento_OficinaDESC_OBS_PAGTO: TStringField;
    QRProdutividadeServEletrico: TOracleDataSet1;
    QRProdutividadeServEletricoCOD_MECANICO: TIntegerField;
    QRProdutividadeServEletricoNUM_OS: TIntegerField;
    QRProdutividadeServEletricoDT_SAIDA: TDateTimeField;
    QRProdutividadeServEletricoNOME: TStringField;
    QRProdutividadeServEletricoTOTAL_HORAS: TFloatField;
    QRProdutividadeServEletricoVAL_MAO_OBRA: TFloatField;
    QRContagemPecasOEMDESC_PRODUTO: TStringField;
    QRContagemPecasDESC_PRODUTO: TStringField;
    QRPecasOEMEstoqueDESC_PRODUTO: TStringField;
    QRPecasEstoqueDESC_PRODUTO: TStringField;
    QRProdutoCustoZeroDESC_PRODUTO: TStringField;
    QROrcamento_OficinaDESC_PRODUTO: TStringField;
    QRRequisicao_custoDESC_PRODUTO: TStringField;
    QRMapaVendaOficinaVAL_NF_SERVICO_ELETRICO: TFloatField;
    QRControleEstoque: TOracleDataSet1;
    QRControleEstoqueCOD_CONTROLE_ESTOQUE: TIntegerField;
    QRControleEstoqueCOD_FILIAL: TIntegerField;
    QRControleEstoqueCOD_PRODUTO: TIntegerField;
    QRControleEstoqueQT_QUANTIDADE: TFloatField;
    QRControleEstoqueDT_ALTERACAO: TDateTimeField;
    QRControleEstoqueCOD_USUARIO: TIntegerField;
    QRControleEstoqueVAL_CUSTO: TFloatField;
    QRControleEstoqueNOME: TStringField;
    QRControleEstoqueDESC_PRODUTO: TStringField;
    QRComissao: TOracleDataSet1;
    QROficinaOrcamento: TOracleDataSet1;
    QROficina: TOracleDataSet1;
    QROficinaOrcamentoCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QROficinaOrcamentoDESC_SERVICO: TStringField;
    QROficinaOrcamentoDT_ORCAMENTO: TDateTimeField;
    QROficinaOrcamentoNUM_PLACA: TStringField;
    QROficinaOrcamentoNOME: TStringField;
    QROficinaOrcamentoDESC_FILIAL: TStringField;
    QROficinaOrcamentoDESC_MARCA: TStringField;
    QROficinaOrcamentoDESC_PRODUTO: TStringField;
    QROficinaOrcamentoDESC_COMPLEMENTO: TStringField;
    QROficinaOrcamentoPERC_DESCONTO: TFloatField;
    QROficinaOrcamentoQT_QUANTIDADE: TFloatField;
    QROficinaOrcamentoVAL_TOTAL: TFloatField;
    QROficinaOrcamentoVAL_UNITARIO: TFloatField;
    QROficinaOrcamentoCOD_PRODUTO: TIntegerField;
    QROficinaOrcamentoCOD_FILIAL: TIntegerField;
    QROficinaOrcamentoCOD_MARCA: TIntegerField;
    QROficinaOrcamentoCOD_CADASTRO: TIntegerField;
    QROficinaOrcamentoSintetico: TOracleDataSet1;
    QROficinaOrcamentoSinteticoCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QROficinaOrcamentoSinteticoCOD_FILIAL: TIntegerField;
    QROficinaOrcamentoSinteticoCOD_MARCA: TIntegerField;
    QROficinaOrcamentoSinteticoCOD_CADASTRO: TIntegerField;
    QROficinaOrcamentoSinteticoDESC_SERVICO: TStringField;
    QROficinaOrcamentoSinteticoDT_ORCAMENTO: TDateTimeField;
    QROficinaOrcamentoSinteticoNUM_PLACA: TStringField;
    QROficinaOrcamentoSinteticoNOME: TStringField;
    QROficinaOrcamentoSinteticoDESC_FILIAL: TStringField;
    QROficinaOrcamentoSinteticoDESC_MARCA: TStringField;
    QROficinaOrcamentoSinteticoVAL_TOTAL: TFloatField;
    QROficinaSintetico: TOracleDataSet1;
    QROficinaCOD_OFICINA_CAB: TIntegerField;
    QROficinaCOD_CADASTRO: TIntegerField;
    QROficinaCOD_FILIAL: TIntegerField;
    QROficinaCOD_MARCA: TIntegerField;
    QROficinaCOD_OPERACAO: TIntegerField;
    QROficinaCOD_VENDEDOR: TIntegerField;
    QROficinaCOD_VEICULO: TIntegerField;
    QROficinaDT_ENTRADA: TDateTimeField;
    QROficinaDT_FECHAMENTO: TDateTimeField;
    QROficinaDT_SAIDA: TDateTimeField;
    QROficinaIND_CONDICAO_PAGTO: TIntegerField;
    QROficinaIND_PARCIAL_TOTAL: TStringField;
    QROficinaIND_SITUACAO: TStringField;
    QROficinaNUM_OFICINA_CAB: TIntegerField;
    QROficinaPERC_COMISSAO: TFloatField;
    QROficinaVAL_DESCONTO_PECAS: TFloatField;
    QROficinaVAL_DESCONTO_SERVICOS: TFloatField;
    QROficinaCLIENTE: TStringField;
    QROficinaDESC_FILIAL: TStringField;
    QROficinaDESC_MARCA: TStringField;
    QROficinaDESC_OPERACAO: TStringField;
    QROficinaVENDEDOR: TStringField;
    QROficinaNUM_PLACA: TStringField;
    QROficinaDESC_COMPLEMENTO: TStringField;
    QROficinaQT_QUANTIDADE: TFloatField;
    QROficinaVAL_UNITARIO: TFloatField;
    QROficinaVAL_TOTAL: TFloatField;
    QROficinaDESC_PRODUTO: TStringField;
    QROficinaDESC_UNIDADE: TStringField;
    QROficinaSinteticoCOD_OFICINA_CAB: TIntegerField;
    QROficinaSinteticoCOD_CADASTRO: TIntegerField;
    QROficinaSinteticoCOD_FILIAL: TIntegerField;
    QROficinaSinteticoCOD_MARCA: TIntegerField;
    QROficinaSinteticoCOD_OPERACAO: TIntegerField;
    QROficinaSinteticoCOD_VENDEDOR: TIntegerField;
    QROficinaSinteticoCOD_VEICULO: TIntegerField;
    QROficinaSinteticoDT_ENTRADA: TDateTimeField;
    QROficinaSinteticoDT_FECHAMENTO: TDateTimeField;
    QROficinaSinteticoDT_SAIDA: TDateTimeField;
    QROficinaSinteticoIND_CONDICAO_PAGTO: TIntegerField;
    QROficinaSinteticoIND_PARCIAL_TOTAL: TStringField;
    QROficinaSinteticoIND_SITUACAO: TStringField;
    QROficinaSinteticoNUM_OFICINA_CAB: TIntegerField;
    QROficinaSinteticoVAL_DESCONTO_PECAS: TFloatField;
    QROficinaSinteticoVAL_DESCONTO_SERVICOS: TFloatField;
    QROficinaSinteticoCLIENTE: TStringField;
    QROficinaSinteticoDESC_FILIAL: TStringField;
    QROficinaSinteticoDESC_MARCA: TStringField;
    QROficinaSinteticoDESC_OPERACAO: TStringField;
    QROficinaSinteticoVENDEDOR: TStringField;
    QROficinaSinteticoNUM_PLACA: TStringField;
    QROficinadesc_pagamento: TStringField;
    QROficinadesc_situacao: TStringField;
    QROficinadesc_servico: TStringField;
    QROficinaCOD_PRODUTO: TFloatField;
    QROficinaval_liquido: TFloatField;
    QSomaItemOficina: TOracleDataSet1;
    QSomaItemOficinaCOD_OFICINA_CAB: TIntegerField;
    QSomaItemOficinaSVAL_TOTAL: TFloatField;
    QSomaItemOficinaSVAL_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_MEC_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_MEC_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_DESC_VENDA: TFloatField;
    QSomaItemOficinaSVAL_DESC_CLIENTE: TFloatField;
    QSomaItemOficinaSVAL_DESC_MECANICO: TFloatField;
    QSomaItemOficinaSVAL_S_DESCONTO: TFloatField;
    QSomaItemOficinaSVAL_DESCONTOS: TFloatField;
    QSomaItemOficinaSVAL_ITENS: TFloatField;
    QSomaItemOficinaSVAL_SERVICO_BRUTO: TFloatField;
    QSomaItemOficinaSVAL_PRODUTO_BRUTO: TFloatField;
    QSomaItemOficinasval_desc_mec: TFloatField;
    QSomaItemOficinasval_desc_produto: TFloatField;
    QSomaItemOficinasval_desc_servico: TFloatField;
    QSomaItemOficinaVAL_DESCONTO_PECAS: TFloatField;
    QSomaItemOficinaVAL_DESCONTO_SERVICOS: TFloatField;
    QSomaItemOficinaSVAL_VEN_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_VEN_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_CLI_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_CLI_PRODUTO: TFloatField;
    QSomaItemOficinadesc_mec_produto: TStringField;
    QSomaItemOficinadesc_mec_servico: TStringField;
    QSomaItemOficinadesc_cli_produto: TStringField;
    QSomaItemOficinadesc_cli_servico: TStringField;
    QSomaItemOficinadesc_ven_produto: TStringField;
    QSomaItemOficinadesc_ven_servico: TStringField;
    QSomaItemOficinadesc_mec: TStringField;
    QSomaItemOficinadesc_cli: TStringField;
    QSomaItemOficinadesc_ven: TStringField;
    QROficinaSinteticoval_liquido: TFloatField;
    QROficinaSinteticodesc_pagto: TStringField;
    QROficinaSinteticodesc_parcial_total: TStringField;
    QRComissaoCOD_VENDEDOR: TIntegerField;
    QRComissaoCOD_OFICINA_CAB: TIntegerField;
    QRComissaoDT_FECHAMENTO: TDateTimeField;
    QRComissaoCLIENTE: TStringField;
    QRComissaoVENDEDOR: TStringField;
    QRComissaoVAL_OFICINA: TFloatField;
    QRComissaoVAL_COMISSAO: TFloatField;
    QRComissaoSintetico: TOracleDataSet1;
    QRComissaoSinteticoVENDEDOR: TStringField;
    QRComissaoSinteticoSVAL_TOTAL: TFloatField;
    QRComissaoSinteticoSVAL_COMISSAO: TFloatField;
    QRVendasLiquidasPeriodo: TOracleDataSet1;
    QRVendasLiquidasPeriodovendedor: TStringField;
    QRVendasLiquidasPeriodoval_bruto: TFloatField;
    QRComissaoMecanico: TOracleDataSet1;
    QRComissaoMecanicoCOD_MECANICO: TIntegerField;
    QRComissaoMecanicoQT_HORAS: TFloatField;
    QRComissaoMecanicoQT_TOTAL: TFloatField;
    QRComissaoMecanicoVAL_COMISSAO: TFloatField;
    QRComissaoMecanicoNOME: TStringField;
    QRComissaoMecanicoCOD_COMISSAO: TIntegerField;
    QRComissaoMecanicoDESC_COMISSAO: TStringField;
    QRComissaoMecanicoPERC_COMISSAO: TFloatField;
    QRComissaoMecanicoVAL_TOTAL: TFloatField;
    QRComissaoProdutoVendedor: TOracleDataSet1;
    QRComissaoProdutoVendedorVENDEDOR: TStringField;
    QRComissaoProdutoVendedorVAL_TOTAL: TFloatField;
    QRComissaoProdutoVendedorVAL_COMISSAO: TFloatField;
    QRComissaoProdutoVendedorPERC_COMISSAO: TFloatField;
    QRVendasLiquidasPeriodoCOD_VENDEDOR: TIntegerField;
    QRVendasLiquidasPeriodoNOME: TStringField;
    QRVendasLiquidasPeriodoVAL_LIQUIDO_VENDEDOR: TFloatField;
    QRVendasLiquidasPeriodoVAL_CUSTO_VENDEDOR: TFloatField;
    QRControleEstoqueIND_CUSTO: TStringField;
    QRControleEstoqueIND_ESTOQUE: TStringField;
    QRControleEstoquedesc_custo: TStringField;
    QRControleEstoquedesc_estoque: TStringField;
    QRControleEstoqueQT_QUANTIDADE_ANTERIOR: TFloatField;
    QRCustoFornecedor: TOracleDataSet1;
    QRCustoFornecedorNUM_OS: TIntegerField;
    QRCustoFornecedorNUM_ORCAMENTO: TIntegerField;
    QRCustoFornecedorNUM_FABRICANTE: TStringField;
    QRCustoFornecedorDESC_PRODUTO: TStringField;
    QRCustoFornecedorCOD_PRODUTO: TFloatField;
    QRCustoFornecedorCOD_ULTIMO_FORNECEDOR: TIntegerField;
    QRCustoFornecedorDT_COMPRA: TDateTimeField;
    QRCustoFornecedorVL_ULTIMO_CUSTO: TFloatField;
    QRCustoFornecedorCOD_LOTE_TIPO: TIntegerField;
    QRCustoFornecedorCOD_FILIAL: TIntegerField;
    QRCustoFornecedorFORNECEDOR: TStringField;
    QRQtdePecasOSAbertas: TOracleDataSet1;
    QRQtdePecasOSAbertasCOD_PRODUTO: TFloatField;
    QRQtdePecasOSAbertasNUM_FABRICANTE: TStringField;
    QRQtdePecasOSAbertasDESC_PRODUTO: TStringField;
    QRQtdePecasOSAbertasQT_QUANTIDADE: TFloatField;
    QRQtdePecasOSAbertasNUM_OS: TIntegerField;
    QRQtdePecasOSAbertasDT_OS: TDateTimeField;
    QRQtdePecasOSAbertasDT_REQ: TDateTimeField;
    QROSVeiculoNUM_KM: TIntegerField;
    QRControleEstoqueNUM_FABRICANTE: TStringField;
    QRRequisicao_custoNUM_FABRICANTE: TStringField;
    QROrcamento_OficinaNUM_PLACA: TStringField;
    procedure QRRequisicao_custoCalcFields(DataSet: TDataSet);
    procedure QROrcamento_OficinaCalcFields(DataSet: TDataSet);
    procedure QROficinaCalcFields(DataSet: TDataSet);
    procedure QROficinaSinteticoCalcFields(DataSet: TDataSet);
    procedure QRVendasLiquidasPeriodoCalcFields(DataSet: TDataSet);
    procedure QRControleEstoqueCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOficina_Relatorio: TDMOficina_Relatorio;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMOficina_Relatorio.QRRequisicao_custoCalcFields(
  DataSet: TDataSet);
begin
  QRRequisicao_custocod_cadastro.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS','NUM_OS = '+QRRequisicao_custoNUM_OS.Text));
  QRRequisicao_custonome_cadastro.Value:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRRequisicao_custocod_cadastro.Text);
end;

procedure TDMOficina_Relatorio.QROrcamento_OficinaCalcFields(
  DataSet: TDataSet);
begin
   QROrcamento_Oficinanome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QROrcamento_OficinaCOD_CADASTRO.Value));
   QROrcamento_Oficinaempresa.Value := DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA ','COD_FILIAL >= 0');
end;

procedure TDMOficina_Relatorio.QROficinaCalcFields(DataSet: TDataSet);
begin
  if QROficinaIND_SITUACAO.Value = 'F' then
    QROficinadesc_situacao.Value := 'Fechado'
  else if QROficinaIND_SITUACAO.Value = 'C' then
    QROficinadesc_situacao.Value := 'Cancelado'
  else
    QROficinadesc_situacao.Value := 'Aberto';
  if QROficinaIND_CONDICAO_PAGTO.Value = 1 then
    QROficinadesc_pagamento.Value := 'à vista'
  else
    QROficinadesc_pagamento.Value := 'à prazo';
  if QROficinaIND_PARCIAL_TOTAL.Value = 'PARCIAL' then
    QROficinadesc_servico.Value := 'Parcial'
  else
    QROficinadesc_servico.Value := 'Total';

  if (QROficinaval_liquido.IsNull) then
  begin
    QSomaItemOficina.Close;
    QSomaItemOficina.SetVariable('COD_OFICINA_CAB', QROficinaCOD_OFICINA_CAB.Value);
    QSomaItemOficina.open;

    QROficinaval_liquido.Value := QSomaItemOficinaSVAL_TOTAL.Value;
  end;
end;

procedure TDMOficina_Relatorio.QROficinaSinteticoCalcFields(
  DataSet: TDataSet);
begin
  if QROficinaSinteticoIND_PARCIAL_TOTAL.Value = 'P' then
    QROficinaSinteticodesc_parcial_total.Value := 'PARCIAL'
  else
    QROficinaSinteticodesc_parcial_total.Value := 'TOTAL';
  if QROficinaSinteticoIND_CONDICAO_PAGTO.Value = 1 then
    QROficinaSinteticodesc_pagto.Value := 'VISTA'
  else
    QROficinaSinteticodesc_pagto.Value := 'PRAZO';

  if (QROficinaSinteticoval_liquido.IsNull) then
  begin
    QSomaItemOficina.Close;
    QSomaItemOficina.SetVariable('COD_OFICINA_CAB', QROficinaSinteticoCOD_OFICINA_CAB.Value);
    QSomaItemOficina.open;

    QROficinaSinteticoval_liquido.Value := QSomaItemOficinaSVAL_TOTAL.Value;
  end;
end;

procedure TDMOficina_Relatorio.QRVendasLiquidasPeriodoCalcFields(
  DataSet: TDataSet);
begin
  QRVendasLiquidasPeriodovendedor.Value := QRVendasLiquidasPeriodoCOD_VENDEDOR.Text + ': ' + QRVendasLiquidasPeriodoNOME.Value;
  QRVendasLiquidasPeriodoval_bruto.Value := QRVendasLiquidasPeriodoVAL_LIQUIDO_VENDEDOR.Value -
      ((QRVendasLiquidasPeriodoVAL_LIQUIDO_VENDEDOR.Value * 0.17) +
      (QRVendasLiquidasPeriodoVAL_LIQUIDO_VENDEDOR.Value * 0.058 ) +
      (QRVendasLiquidasPeriodoVAL_CUSTO_VENDEDOR.Value));
end;

procedure TDMOficina_Relatorio.QRControleEstoqueCalcFields(
  DataSet: TDataSet);
begin
  QRControleEstoquedesc_custo.Value := 'NÃO';
  QRControleEstoquedesc_estoque.Value := 'NÃO';
  if QRControleEstoqueIND_CUSTO.Value = 'S' then
    QRControleEstoquedesc_custo.Value := 'SIM';
  if QRControleEstoqueIND_ESTOQUE.Value = 'S' then
    QRControleEstoquedesc_estoque.Value := 'SIM';
end;

end.
