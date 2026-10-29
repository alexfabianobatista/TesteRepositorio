unit UBoletim_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Math;

type
  TDMBoletim = class(TDataModule)
    DSBoletim: TDataSource;
    DSBoletimItem: TDataSource;
    DSBoletimE: TDataSource;
    DSBoletimItemE: TDataSource;
    DSBoletimS: TDataSource;
    DSBoletimItemS: TDataSource;
    QBoletimS: TOracleDataSet1;
    QBoletimSCOD_BOLETIM: TIntegerField;
    QBoletimSCOD_FILIAL: TIntegerField;
    QBoletimSDT_BOLETIM: TDateTimeField;
    QBoletimSDESC_OBS: TStringField;
    QBoletimSVAL_CUSTO: TFloatField;
    QBoletimSCOD_FORMULA: TIntegerField;
    QBoletimSQT_FABRICADO: TFloatField;
    QBoletimSCOD_TURNO_CONTROLE: TIntegerField;
    QBoletimSPERC_MASSA: TFloatField;
    QBoletimSIND_TIPO_BOLETIM: TStringField;
    QBoletimSNUM_CONTROLE: TIntegerField;
    QBoletimItemS: TOracleDataSet1;
    QBoletimItemSCOD_BOLETIM: TIntegerField;
    QBoletimItemSCOD_BOLETIM_ITEM: TIntegerField;
    QBoletimItemSCOD_PRODUTO: TIntegerField;
    QBoletimItemSCOD_LOTE_TIPO: TIntegerField;
    QBoletimItemSQT_USADA: TFloatField;
    QBoletimItemSVAL_CUSTO: TFloatField;
    QBoletimE: TOracleDataSet1;
    QBoletimECOD_BOLETIM: TIntegerField;
    QBoletimECOD_FILIAL: TIntegerField;
    QBoletimEDT_BOLETIM: TDateTimeField;
    QBoletimEDESC_OBS: TStringField;
    QBoletimEVAL_CUSTO: TFloatField;
    QBoletimECOD_FORMULA: TIntegerField;
    QBoletimEQT_FABRICADO: TFloatField;
    QBoletimECOD_TURNO_CONTROLE: TIntegerField;
    QBoletimEPERC_MASSA: TFloatField;
    QBoletimEIND_TIPO_BOLETIM: TStringField;
    QBoletimENUM_CONTROLE: TIntegerField;
    QBoletimEnome_filial: TStringField;
    QBoletimEnome_formula: TStringField;
    QBoletimEturno: TStringField;
    QBoletimItemE: TOracleDataSet1;
    QBoletimItemECOD_BOLETIM: TIntegerField;
    QBoletimItemECOD_BOLETIM_ITEM: TIntegerField;
    QBoletimItemECOD_PRODUTO: TIntegerField;
    QBoletimItemECOD_LOTE_TIPO: TIntegerField;
    QBoletimItemEQT_USADA: TFloatField;
    QBoletimItemEVAL_CUSTO: TFloatField;
    QBoletimItemEnome_produto: TStringField;
    QBoletimItemEnome_lote: TStringField;
    QRPerdas: TOracleDataSet1;
    QRPerdasCOD_PRODUTO: TFloatField;
    QRPerdasSQT_FABRICADO_MASSA: TFloatField;
    QRPerdasSQT_FABRICADO_ACABADO: TFloatField;
    QRPerdasSCUSTO: TFloatField;
    QRRelacao: TOracleDataSet1;
    QRRelacaoCOD_BOLETIM: TIntegerField;
    QRRelacaoQT_FABRICADO: TFloatField;
    QRRelacaoDT_BOLETIM: TDateTimeField;
    QRRelacaoNUM_CONTROLE: TIntegerField;
    QRRelacaoCOD_TURNO: TIntegerField;
    QRRelacaoCOD_PRODUTO: TFloatField;
    QRRelacaoNUM_EMBALAGEM: TFloatField;
    QRRelacaosqt_fabricado: TFloatField;
    QRRelacaosqt_kilos: TFloatField;
    QRProducao: TOracleDataSet1;
    QRProducaoDIA: TStringField;
    QRProducaoCOD_PRODUTO: TFloatField;
    QRProducaoSQT_FABRICADO: TFloatField;
    QRProducaoSQT_KILOS: TFloatField;
    QRProducao2: TOracleDataSet1;
    QRProducaoS: TOracleDataSet1;
    QRProducao2COD_PRODUTO: TFloatField;
    QRProducao2SQT_FABRICADO: TFloatField;
    QRProducao2SQT_KILOS: TFloatField;
    QRProducaoSCOD_PRODUTO: TIntegerField;
    QRProducaoSDT_LANCAMENTO: TDateTimeField;
    QRProducaoSCOD_TURNO: TIntegerField;
    QRProducaoSDESC_TURNO: TStringField;
    QRProducaoSQT_REPROCESSO: TFloatField;
    QRProducaoSQT_VARREDURA: TFloatField;
    QRProducaoSQT_REFUGO_EMBALAGENS: TFloatField;
    QRProducaoA: TOracleDataSet1;
    QRProducaoACOD_PRODUTO: TIntegerField;
    QRProducaoACOD_TURNO: TIntegerField;
    QRProducaoADT_LANCAMENTO: TDateTimeField;
    QRProducaoADESC_TURNO: TStringField;
    QRProducaoAQT_REPROCESSO: TFloatField;
    QRProducaoAQT_VARREDURA: TFloatField;
    QRProducaoAQT_REFUGO_EMBALAGENS: TFloatField;
    QRConsMatPrima2: TOracleDataSet1;
    QRConsMatPrima2COD_PRODUTO: TIntegerField;
    QRConsMatPrima2SQT_USADA: TFloatField;
    QRConsMatPrima: TOracleDataSet1;
    QRConsMatPrimaCOD_PRODUTO: TIntegerField;
    QBoletimCons: TOracleDataSet1;
    QBoletimConsCOD_BOLETIM: TIntegerField;
    QBoletimConsCOD_TURNO: TIntegerField;
    QBoletimConsCOD_FILIAL: TIntegerField;
    QBoletimConsDT_BOLETIM: TDateTimeField;
    QBoletimConsCOD_FORMULA: TIntegerField;
    QBoletimConsQT_FABRICADO: TFloatField;
    QBoletimConsVAL_CUSTO: TFloatField;
    QBoletimConsDESC_OBS: TStringField;
    QBoletimConsNUM_CONTROLE: TIntegerField;
    QRResumo_Prod_Turno: TOracleDataSet1;
    QRResumo_Prod_TurnoQT_HORA_PARADO: TFloatField;
    QRResumo_Prod_TurnoQT_HORA_TRABALHADA: TFloatField;
    QRResumo_Prod_TurnoQT_FABRICADO: TFloatField;
    QRResumo_Prod_TurnoSQT_KILOS: TFloatField;
    QRResumo_Prod_TurnoDESC_TURNO: TStringField;
    QRResumo_Prod_TurnoCOD_TURNO: TIntegerField;
    QRResumo_Prod_TurnoCOD_PRODUTO: TFloatField;
    QProducaoCons: TOracleDataSet1;
    QProducaoConsCOD_PRODUCAO: TIntegerField;
    QProducaoConsCOD_FILIAL: TIntegerField;
    QProducaoConsCOD_PRODUTO: TIntegerField;
    QProducaoConsDT_LANCAMENTO: TDateTimeField;
    QProducaoConsDESC_TURNO: TStringField;
    QProducao: TOracleDataSet1;
    QProducaoCOD_PRODUCAO: TIntegerField;
    QProducaoCOD_FILIAL: TIntegerField;
    QProducaoCOD_TURNO: TIntegerField;
    QProducaoCOD_PRODUTO: TIntegerField;
    QProducaoDT_LANCAMENTO: TDateTimeField;
    QProducaoQT_REPROCESSO: TFloatField;
    QProducaoQT_VARREDURA: TFloatField;
    QProducaoQT_REFUGO_EMBALAGENS: TFloatField;
    QProducaodesc_produto: TStringField;
    QProducaodesc_filial: TStringField;
    QProducaodesc_turno: TStringField;
    QBoletim: TOracleDataSet1;
    QBoletimCOD_BOLETIM: TIntegerField;
    QBoletimCOD_FILIAL: TIntegerField;
    QBoletimDT_BOLETIM: TDateTimeField;
    QBoletimDESC_OBS: TStringField;
    QBoletimVAL_CUSTO: TFloatField;
    QBoletimCOD_FORMULA: TIntegerField;
    QBoletimQT_FABRICADO: TFloatField;
    QBoletimCOD_TURNO_CONTROLE: TIntegerField;
    QBoletimPERC_MASSA: TFloatField;
    QBoletimIND_TIPO_BOLETIM: TStringField;
    QBoletimNUM_CONTROLE: TIntegerField;
    QBoletimItem: TOracleDataSet1;
    QBoletimItemCOD_BOLETIM: TIntegerField;
    QBoletimItemCOD_BOLETIM_ITEM: TIntegerField;
    QBoletimItemCOD_PRODUTO: TIntegerField;
    QBoletimItemCOD_LOTE_TIPO: TIntegerField;
    QBoletimItemQT_USADA: TFloatField;
    QBoletimItemVAL_CUSTO: TFloatField;
    QBoletimItemnome_produto: TStringField;
    QBoletimItemnome_lote: TStringField;
    QBoletimnome_filial: TStringField;
    QBoletimnome_formula: TStringField;
    QBoletimturno: TStringField;
    QBoletimSnome_filial: TStringField;
    QBoletimSnome_formula: TStringField;
    QBoletimSturno: TStringField;
    QBoletimItemSnome_produto: TStringField;
    QBoletimItemSnome_lote: TStringField;
    QRProducaoEstabelecida: TOracleDataSet1;
    QRProducaoEstabelecidaCOD_PRODUTO: TFloatField;
    QRProducaoEstabelecidaCOD_CLASSE: TIntegerField;
    QRProducaoEstabelecidaDESC_CLASSE: TStringField;
    QRProducaoEstabelecidaCOD_FILIAL: TIntegerField;
    QRProducaoEstabelecidaCOD_LOTE_TIPO: TIntegerField;
    QRProducaoEstabelecidaDESC_LOTE: TStringField;
    QRProducaoEstabelecidaQT_QUANTIDADE: TFloatField;
    QRProducaoEstabelecidaQTDE_KILO: TFloatField;
    QRProducaoEstabelecidaDESC_PRODUTO: TStringField;
    QRProducao2DESC_PRODUTO: TStringField;
    QRRelacaoDESC_PRODUTO: TStringField;
    QRPerdasDESC_PRODUTO: TStringField;
    QRProducaoADESC_PRODUTO: TStringField;
    QRConsMatPrima2DESC_PRODUTO: TStringField;
    QRConsMatPrimaDESC_PRODUTO: TStringField;
    QRProducaoSDESC_PRODUTO: TStringField;
    QProducaoConsDESC_PRODUTO: TStringField;
    QRResumo_Prod_TurnoDESC_PRODUTO: TStringField;
    QRProducaoDESC_PRODUTO: TStringField;
    QBoletimNUM_LINHA: TIntegerField;
    QBoletimENUM_LINHA: TIntegerField;
    QRConsMatPrimaCOD_FILIAL: TIntegerField;
    QRConsMatPrima2COD_FILIAL: TIntegerField;
    QBoletimCOD_DEPARTAMENTO: TIntegerField;
    QRCustoBoletim: TOracleDataSet1;
    QRCustoBoletimCOD_FORMULA_CUSTO: TIntegerField;
    QRCustoBoletimCOD_FORMULA: TIntegerField;
    QRCustoBoletimDESC_FORMULA_CUSTO: TStringField;
    QRCustoBoletimQT_QUANTIDADE: TFloatField;
    QRCustoBoletimVAL_CUSTO: TFloatField;
    QRBoletim_Custo: TOracleDataSet1;
    QRBoletim_CustoCOD_BOLETIM: TIntegerField;
    QRBoletim_CustoCOD_PRODUTO_BOLETIM: TIntegerField;
    QRBoletim_CustoQT_PRODUZIDA: TFloatField;
    QRBoletim_CustoCOD_PRODUTO_ITEM: TIntegerField;
    QRBoletim_CustoQT_USADA: TFloatField;
    QRBoletim_CustoVL_CUSTO_UNITARIO_ITEM: TFloatField;
    QRBoletim_CustoVAL_CUSTO_ITEM: TFloatField;
    QRBoletim_CustoDESC_PRODUTO: TStringField;
    QRBoletim_Custodesc_produto_acabado: TStringField;
    QRBoletim_CustoCOD_FORMULA: TIntegerField;
    QRBoletim_CustoQT_FABRICADO: TFloatField;
    QRBoletim_CustoVAL_CUSTO_OPERACIONAL: TFloatField;
    QRBoletim_CustoDT_BOLETIM: TDateTimeField;
    QBoletimqt_fabricacao: TFloatField;
    QBoletimQT_FABRICADO_VARIACAO: TFloatField;
    QBoletimperc_variacao: TFloatField;
    QRConsMatPrimaCOD_LOTE_TIPO: TIntegerField;
    QRConsMatPrimaSVAL_CUSTO: TFloatField;
    QRConsMatPrima2SVAL_CUSTO: TFloatField;
    QRComposicaoEstoque: TOracleDataSet1;
    QRComposicaoEstoqueCOD_FILIAL: TIntegerField;
    QRComposicaoEstoqueCOD_PRODUTO: TFloatField;
    QRComposicaoEstoqueDESC_PRODUTO: TStringField;
    QRComposicaoEstoqueDESC_LOTE: TStringField;
    QRComposicaoEstoqueCOD_LOTE_TIPO: TIntegerField;
    QRComposicaoEstoqueNUM_EMBALAGEM: TFloatField;
    QRComposicaoEstoqueSQT_ENTRADA: TFloatField;
    QRComposicaoEstoqueSQT_SAIDA: TFloatField;
    QRComposicaoEstoqueSQT_USADA: TFloatField;
    QRComposicaoEstoqueSQT_FABRICADO: TFloatField;
    QRComposicaoEstoqueSQT_INICIAL: TFloatField;
    QBoletimProducao: TOracleDataSet1;
    QBoletimProducaonome_formula: TStringField;
    QBoletimProducaoturno: TStringField;
    QBoletimProducaoqt_fabricacao: TFloatField;
    QBoletimProducaoperc_variacao: TFloatField;
    DsBoletimProducao: TDataSource;
    QBoletimProducaoItem: TOracleDataSet1;
    QBoletimProducaoItemnome_produto: TStringField;
    QBoletimProducaoItemnome_lote: TStringField;
    DsBoletimProducaoItem: TDataSource;
    QBoletimProducaoCOD_BOLETIM: TIntegerField;
    QBoletimProducaoCOD_FILIAL: TIntegerField;
    QBoletimProducaoDT_BOLETIM: TDateTimeField;
    QBoletimProducaoDESC_OBS: TStringField;
    QBoletimProducaoVAL_CUSTO: TFloatField;
    QBoletimProducaoCOD_FORMULA: TIntegerField;
    QBoletimProducaoQT_FABRICADO: TFloatField;
    QBoletimProducaoCOD_TURNO_CONTROLE: TIntegerField;
    QBoletimProducaoPERC_MASSA: TFloatField;
    QBoletimProducaoIND_TIPO_BOLETIM: TStringField;
    QBoletimProducaoNUM_CONTROLE: TIntegerField;
    QBoletimProducaoCOD_DEPARTAMENTO: TIntegerField;
    QBoletimProducaoQT_FABRICADO_VARIACAO: TFloatField;
    QBoletimProducaoIND_SITUACAO: TStringField;
    QBoletimProducaoNUM_LINHA: TIntegerField;
    QBoletimProducaoItemCOD_BOLETIM: TIntegerField;
    QBoletimProducaoItemCOD_BOLETIM_ITEM: TIntegerField;
    QBoletimProducaoItemCOD_PRODUTO: TIntegerField;
    QBoletimProducaoItemCOD_LOTE_TIPO: TIntegerField;
    QBoletimProducaoItemQT_USADA: TFloatField;
    QBoletimProducaoItemVAL_CUSTO: TFloatField;
    QBoletimProducaodesc_situacao: TStringField;
    QRBoletimOrdemProducao: TOracleDataSet1;
    QRBoletimOrdemProducaoCOD_ORDEM_PRODUCAO: TIntegerField;
    QRBoletimOrdemProducaoCOD_FILIAL: TIntegerField;
    QRBoletimOrdemProducaoCOD_FORMULA: TIntegerField;
    QRBoletimOrdemProducaoQT_FABRICADO: TFloatField;
    QRBoletimOrdemProducaoDT_BOLETIM: TDateTimeField;
    QRBoletimOrdemProducaoDESC_OBS: TStringField;
    QRBoletimOrdemProducaoIND_NOME_FANTASIA_DANFE: TStringField;
    QRBoletimOrdemProducaoDESC_ENDERECO: TStringField;
    QRBoletimOrdemProducaoDESC_TELEFONE: TStringField;
    QRBoletimOrdemProducaoDESC_INSCRICAO: TStringField;
    QRBoletimOrdemProducaoDESC_CIDADE: TStringField;
    QRBoletimOrdemProducaoNUM_CGC: TStringField;
    QRBoletimOrdemProducaoDESC_FILIAL: TStringField;
    QRBoletimOrdemProducaoQT_USADA: TFloatField;
    QRBoletimOrdemProducaoDESC_PRODUTO_ITEM: TStringField;
    QRBoletimOrdemProducaoDESC_UNIDADE_ITEM: TStringField;
    QRBoletimOrdemProducaoDESC_PRODUTO_FORMULA: TStringField;
    QBoletimProducaoCOD_LOTE_TIPO: TIntegerField;
    QRQtdProducao: TOracleDataSet;
    QRQtdProducaoDIA: TStringField;
    QRQtdProducaoCOD_PRODUTO: TFloatField;
    QRQtdProducaoDESC_PRODUTO: TStringField;
    QRQtdProducaoSQT_FABRICADO: TFloatField;
    QRQtdProducaoSQT_KILOS: TFloatField;
    QRQtdProducao2: TOracleDataSet;
    QRQtdProducao2COD_PRODUTO: TFloatField;
    QRQtdProducao2DESC_PRODUTO: TStringField;
    QRQtdProducao2SQT_FABRICADO: TFloatField;
    QRQtdProducao2SQT_KILOS: TFloatField;
    QRBoletimOrdemProducaoCOD_LOTE_TIPO_PRODUCAO: TIntegerField;
    QRBoletimOrdemProducaoDESC_LOTE_ORDEM_PRODUCAO: TStringField;
    QBoletimConsCOD_PRODUTO: TIntegerField;
    QBoletimConsDESC_PRODUTO: TStringField;
    QRBoletimOrdemProducaoCOD_CADASTRO_ENG_RESPONSAVEL: TFloatField;
    QRBoletimOrdemProducaoNOME: TStringField;
    QRBoletimOrdemProducaoDT_REVISAO_ENG_RESPONSAVEL: TDateTimeField;
    QBoletimProducaoQT_BAIXADO: TFloatField;
    QRRelacaoDESC_LOTE: TStringField;
    QBoletimCOD_LOTE_TIPO: TIntegerField;
    QBoletimProducaoCOD_CADASTRO_CQ: TIntegerField;
    QBoletimProducaoCOD_CADASTRO_ENVASADOR: TIntegerField;
    QBoletimCOD_CADASTRO_CQ: TIntegerField;
    QBoletimCOD_CADASTRO_ENVASADOR: TIntegerField;
    QRBoletimOrdemProducaoDESC_MODO_PREPARO: TMemoField;
    QBoletimProducaoVAL_MAO_OBRA: TFloatField;
    QBoletimSVAL_MAO_OBRA: TFloatField;
    QBoletimProducaoCusto: TOracleDataSet1;
    DsBoletimProducaoCusto: TDataSource;
    QBoletimProducaoCustoCOD_BOLETIM: TIntegerField;
    QBoletimProducaoCustoCOD_BOLETIM_CUSTO: TIntegerField;
    QBoletimProducaoCustoDESC_BOLETIM_CUSTO: TStringField;
    QBoletimProducaoCustoQT_USADA: TFloatField;
    QBoletimProducaoCustoVAL_CUSTO: TFloatField;
    QRBoletimOrdemProducaoCOD_LOTE_TIPO: TIntegerField;
    QRBoletimOrdemProducaodesc_lote_item: TStringField;
    QRRelacaoQT_PRODUZIDO: TFloatField;
    QRMtFaturada: TOracleDataSet;
    QRMtFaturadaCOD_PROD_MAT_PRIMA: TFloatField;
    QRMtFaturadaDESC_PROD_MAT_PRIMA: TStringField;
    QRMtFaturadaSQT_TOTALVENDA: TFloatField;
    QRMtFaturadaVL_CUSTO_MEDIO: TFloatField;
    QRMtFaturadaSCUSTO_TOTAL: TFloatField;
    QRMtFaturadavl_custo_unitario: TFloatField;
    QRMtFaturadaCOD_FILIAL: TIntegerField;
    QRMtFaturadawCod_Lote_tipoF: TIntegerField;
    QBoletimProducaoVAL_CUSTO_CONTABIL: TFloatField;
    QBoletimProducaoCOD_CADASTRO_ROTULADOR: TIntegerField;
    QBoletimProducaoComissao: TOracleDataSet1;
    QBoletimProducaoComissaoCOD_BOLETIM_COMISSAO: TFloatField;
    QBoletimProducaoComissaoCOD_BOLETIM: TFloatField;
    QBoletimProducaoComissaoPERC_COMISSAO: TFloatField;
    DsBoletimProducaoComissao: TDataSource;
    QBoletimProducaoComissaoCOD_PRODUTO: TFloatField;
    QBoletimProducaoComissaoval_comissao: TFloatField;
    QBoletimProducaoComissaoQT_QUANTIDADE: TFloatField;
    QBoletimProducaocomissao_total: TFloatField;
    QBoletimProducaoComissaoproduto_nome: TStringField;
    QBoletimProducaoSomaComissao: TOracleDataSet1;
    QBoletimProducaoSomaComissaoSTOTAL: TFloatField;
    DSBoletimProducaoSomaComissao: TDataSource;
    QRComissoesProducao: TOracleDataSet1;
    QRComissoesProducaoCOD_ENVASADOR: TIntegerField;
    QRComissoesProducaoCOD_BOLETIM: TIntegerField;
    QRComissoesProducaoSPERC_COMISSAO: TFloatField;
    QRComissoesProducaoSQT_QUANTIDADE: TFloatField;
    QRComissoesProducaoSVAL_COMISSAO: TFloatField;
    QRComissoesProducaoNOME_ENVASADOR: TStringField;
    QRBoletimProducaoEmAberto: TOracleDataSet1;
    QRBoletimProducaoEmAbertoCOD_BOLETIM: TIntegerField;
    QRBoletimProducaoEmAbertoCOD_PEDIDO_CAB: TIntegerField;
    QRBoletimProducaoEmAbertoDESC_PRODUTO: TStringField;
    QRBoletimProducaoEmAbertoNUM_PEDIDO: TIntegerField;
    QRBoletimProducaoEmAbertoCOD_PEDIDO_ITEM: TIntegerField;
    QRBoletimProducaoEmAbertoCOD_FILIAL: TIntegerField;
    QRBoletimProducaoEmAbertoQT_ABERTO: TFloatField;
    QRBoletimProducaoEmAbertoCOD_CADASTRO: TIntegerField;
    QRBoletimProducaoEmAbertoNOME: TStringField;
    QBoletimProducaoDT_INICIO_PESAGEM: TDateTimeField;
    QBoletimProducaoDT_FIM_PESAGEM: TDateTimeField;
    QBoletimProducaoDT_INICIO_PRODUCAO: TDateTimeField;
    QBoletimProducaoDT_FIM_PRODUCAO: TDateTimeField;
    QRBoletimOrdemProducaoDT_INICIO_PRODUCAO: TDateTimeField;
    QRBoletimOrdemProducaoDT_FIM_PRODUCAO: TDateTimeField;
    QRBoletimOrdemProducaoDT_INICIO_PESAGEM: TDateTimeField;
    QRBoletimOrdemProducaoDT_FIM_PESAGEM: TDateTimeField;
    QRConsMatPrimaCOD_CLASSE: TIntegerField;
    QRConsMatPrimaNUM_CLASSE: TIntegerField;
    QRConsMatPrimaDESC_CLASSE: TStringField;
    QRConsMatPrimaNUM_SUBCLASSE: TIntegerField;
    QRConsMatPrimaDT_BOLETIM: TDateTimeField;
    QRConsMatPrimaSQT_BAIXADO: TFloatField;
    QPercaProducao: TOracleDataSet;
    QPercaProducaoCOD_PERCA_PRODUCAO_CAB: TIntegerField;
    QPercaProducaoCOD_BOLETIM: TIntegerField;
    QPercaProducaoCOD_PRODUTO: TIntegerField;
    QPercaProducaoQT_PERCA_PRODUCAO: TFloatField;
    QPercaProducaoCOD_LOTE_TIPO: TIntegerField;
    QPercaProducaoCOD_USUARIO: TIntegerField;
    DSPercaProducao: TDataSource;
    QPercaProducaoCons: TOracleDataSet;
    QPercaProducaoConsCOD_BOLETIM: TIntegerField;
    QPercaProducaoConsCOD_PRODUTO: TIntegerField;
    QPercaProducaoConsDESC_PRODUTO: TStringField;
    QPercaProducaoConsQT_PERCA_PRODUCAO: TFloatField;
    QPercaProducaoConsCOD_LOTE_TIPO: TIntegerField;
    QPercaProducaoConsDESC_LOTE: TStringField;
    QPercaProducaodesc_produto: TStringField;
    QBoletimCOD_USUARIO: TIntegerField;
    QBoletimItemCOD_USUARIO: TIntegerField;
    QBoletimProducaoComissaoCOD_USUARIO: TIntegerField;
    QBoletimProducaoCOD_USUARIO: TIntegerField;
    QBoletimProducaoItemCOD_USUARIO: TIntegerField;
    QPercaProducaoVAL_CUSTO: TFloatField;
    QPercaProducaoConsVAL_CUSTO: TFloatField;
    QRBoletim_Custoval_custo_perca: TFloatField;
    QRBoletim_Custoqt_perca_producao: TFloatField;
    QPercaProducaoIND_PRODUTO_ACABADO: TStringField;
    QPercaProducaoConsIND_PRODUTO_ACABADO: TStringField;
    QRBoletim_Custoqt_perca_acabado: TFloatField;
    QRBoletim_Custoval_custo_acabado: TFloatField;
    procedure QBoletimAfterInsert(DataSet: TDataSet);
    procedure QBoletimCalcFields(DataSet: TDataSet);
    procedure QBoletimBeforeEdit(DataSet: TDataSet);
    procedure QBoletimItemAfterInsert(DataSet: TDataSet);
    procedure QBoletimItemBeforeEdit(DataSet: TDataSet);
    procedure QBoletimBeforePost(DataSet: TDataSet);
    procedure QBoletimBeforeDelete(DataSet: TDataSet);
    procedure QBoletimItemCalcFields(DataSet: TDataSet);
    procedure QBoletimAfterDelete(DataSet: TDataSet);
    procedure QBoletimDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QBoletimBeforeInsert(DataSet: TDataSet);
    procedure QBoletimAfterCancel(DataSet: TDataSet);
    procedure QBoletimItemBeforeInsert(DataSet: TDataSet);
    procedure QBoletimAfterPost(DataSet: TDataSet);
    procedure QBoletimItemBeforePost(DataSet: TDataSet);
    procedure QBoletimItemBeforeDelete(DataSet: TDataSet);
    procedure QBoletimEAfterInsert(DataSet: TDataSet);
    procedure QBoletimEBeforePost(DataSet: TDataSet);
    procedure QBoletimItemEAfterInsert(DataSet: TDataSet);
    procedure QBoletimItemEBeforeDelete(DataSet: TDataSet);
    procedure QBoletimItemEBeforeEdit(DataSet: TDataSet);
    procedure QBoletimItemEBeforeInsert(DataSet: TDataSet);
    procedure QBoletimItemEBeforePost(DataSet: TDataSet);
    procedure QBoletimItemECalcFields(DataSet: TDataSet);
    procedure QBoletimEAfterCancel(DataSet: TDataSet);
    procedure QBoletimEAfterDelete(DataSet: TDataSet);
    procedure QBoletimEAfterPost(DataSet: TDataSet);
    procedure QBoletimEBeforeDelete(DataSet: TDataSet);
    procedure QBoletimEBeforeEdit(DataSet: TDataSet);
    procedure QBoletimEBeforeInsert(DataSet: TDataSet);
    procedure QBoletimECalcFields(DataSet: TDataSet);
    procedure QBoletimEDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QBoletimSAfterCancel(DataSet: TDataSet);
    procedure QBoletimSAfterDelete(DataSet: TDataSet);
    procedure QBoletimSAfterInsert(DataSet: TDataSet);
    procedure QBoletimSAfterPost(DataSet: TDataSet);
    procedure QBoletimSBeforeDelete(DataSet: TDataSet);
    procedure QBoletimSBeforeEdit(DataSet: TDataSet);
    procedure QBoletimSBeforeInsert(DataSet: TDataSet);
    procedure QBoletimSBeforePost(DataSet: TDataSet);
    procedure QBoletimSCalcFields(DataSet: TDataSet);
    procedure QBoletimSDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QBoletimItemSAfterInsert(DataSet: TDataSet);
    procedure QBoletimItemSBeforeEdit(DataSet: TDataSet);
    procedure QBoletimItemSBeforeInsert(DataSet: TDataSet);
    procedure QBoletimItemSCalcFields(DataSet: TDataSet);
    procedure QRRelacaoCalcFields(DataSet: TDataSet);
    procedure QProducaoCalcFields(DataSet: TDataSet);
    procedure QProducaoAfterInsert(DataSet: TDataSet);
    procedure QRConsMatPrimaCalcFields(DataSet: TDataSet);
    procedure QRConsMatPrima2CalcFields(DataSet: TDataSet);
    procedure QRBoletim_CustoCalcFields(DataSet: TDataSet);
    procedure QBoletimProducaoAfterCancel(DataSet: TDataSet);
    procedure QBoletimProducaoAfterDelete(DataSet: TDataSet);
    procedure QBoletimProducaoAfterInsert(DataSet: TDataSet);
    procedure QBoletimProducaoAfterPost(DataSet: TDataSet);
    procedure QBoletimProducaoBeforeDelete(DataSet: TDataSet);
    procedure QBoletimProducaoBeforeEdit(DataSet: TDataSet);
    procedure QBoletimProducaoBeforeInsert(DataSet: TDataSet);
    procedure QBoletimProducaoBeforePost(DataSet: TDataSet);
    procedure QBoletimProducaoCalcFields(DataSet: TDataSet);
    procedure QBoletimProducaoDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QBoletimProducaoItemAfterInsert(DataSet: TDataSet);
    procedure QBoletimProducaoItemBeforeDelete(DataSet: TDataSet);
    procedure QBoletimProducaoItemBeforeEdit(DataSet: TDataSet);
    procedure QBoletimProducaoItemBeforeInsert(DataSet: TDataSet);
    procedure QBoletimProducaoItemBeforePost(DataSet: TDataSet);
    procedure QBoletimProducaoItemCalcFields(DataSet: TDataSet);
    procedure QBoletimProducaoAfterOpen(DataSet: TDataSet);
    procedure QRBoletimOrdemProducaoCalcFields(DataSet: TDataSet);
    procedure QRMtFaturadaCalcFields(DataSet: TDataSet);
    procedure QBoletimProducaoComissaoCalcFields(DataSet: TDataSet);
    procedure QPercaProducaoAfterCancel(DataSet: TDataSet);
    procedure QPercaProducaoAfterPost(DataSet: TDataSet);
    procedure QPercaProducaoCalcFields(DataSet: TDataSet);
    procedure QBoletimProducaoComissaoBeforeInsert(DataSet: TDataSet);
    procedure QBoletimProducaoComissaoBeforeEdit(DataSet: TDataSet);
    procedure QBoletimProducaoComissaoBeforePost(DataSet: TDataSet);
    procedure QPercaProducaoBeforePost(DataSet: TDataSet);
    procedure QPercaProducaoBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    fGerando : Boolean;
    fProducao : Boolean;
  public
    { Public declarations }
    Property pGerando : Boolean Read fGerando Write fGerando Default  False;
    Property pProducao : Boolean Read fProducao Write fProducao Default  False;
    procedure PopulaCalcFields;
  end;

var
  DMBoletim: TDMBoletim;
  wDt_Boletim : String;
  wFilial,wCod_Formula : Integer;
  wComissaoTotal : Double;

const
  SIT_BOLETIM_DIGITADA:   string = '1';
  SIT_BOLETIM_CONFIRMADA: string = '2';
  SIT_BOLETIM_PARCIAL:    string = '3';

implementation

uses UOracle_cl, UUsuario_cl, UTurno_cl, UFormula_cl, UEstoque_cl
  , UParamsistema_cl;

{$R *.DFM}

procedure TDMBoletim.QBoletimAfterInsert(DataSet: TDataSet);
begin
//  QBoletimCod_Boletim.Value := DMOracle.Sequencia('BOLETIM');
  QBoletimCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QBoletimDt_Boletim.Value := DMOracle.DataServ;
  QBoletimCod_Turno_Controle.Value := DMTurno.TurnoControleAberto;
end;

procedure TDMBoletim.QBoletimCalcFields(DataSet: TDataSet);
begin
  QBoletimnome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                               'COD_FILIAL =' + FloatToStr(QBoletimCod_Filial.Value));
 // QBoletimnome_formula.Value := DMOracle.BuscaNome(
 //                            'SELECT DESC_PRODUTO || '+Chr(39)+ ' |   '+Chr(39)+' || DESC_LOTE FROM TB_PRODUTO,TB_FORMULA,TB_LOTE_TIPO',
 //                            'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
 //                           +' AND TB_LOTE_TIPO.COD_LOTE_TIPO = TB_FORMULA.COD_LOTE_TIPO'
 //                           +' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimCod_Formula.Value) );
  QBoletimnome_formula.Value := DMOracle.BuscaNome(
                             'SELECT DESC_PRODUTO  FROM TB_PRODUTO,TB_FORMULA,TB_LOTE_TIPO',
                             'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
                            +' AND TB_LOTE_TIPO.COD_LOTE_TIPO = TB_FORMULA.COD_LOTE_TIPO'
                            +' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimCod_Formula.Value) );
  QBoletimturno.Value := DMOracle.BuscaNome('SELECT TB_TURNO.DESC_TURNO FROM TB_TURNO, TB_TURNO_CONTROLE',
                         'TB_TURNO_CONTROLE.COD_TURNO = TB_TURNO.COD_TURNO'
                         +' AND TB_TURNO_CONTROLE.COD_TURNO_CONTROLE = '+FloatToStr(QBoletimCod_Turno_Controle.Value));
  with DMFormula do
  begin
    if QBoletimQT_FABRICADO.Value > 0 then
    begin
      if QBoletimCOD_FORMULA.Value <> QFormulaCOD_FORMULA.Value then
      begin
        QFormula.Close;
        QFormula.SetVariable('PK',QBoletimCod_Formula.Value);
        QFormula.Open;
      end;
      QBoletimqt_fabricacao.Value :=
        QBoletimQT_FABRICADO.Value*QFormulaQt_Producao.Value;
      if QBoletimQT_FABRICADO_VARIACAO.Value > 0 then
      begin
        QBoletimperc_variacao.Value
          := - (1 - (QBoletimQT_FABRICADO_VARIACAO.Value
            / QBoletimqt_fabricacao.Value));
      end;
    end;
  end;
end;

procedure TDMBoletim.QBoletimBeforeEdit(DataSet: TDataSet);
begin
  If pGerando = False Then
    Raise Exception.Create('Não é permitido alterar Boletim!');
end;

procedure TDMBoletim.QBoletimItemAfterInsert(DataSet: TDataSet);
begin
  QBoletimItemCod_Boletim.Value := QBoletimCod_Boletim.Value;
  QBoletimItemCod_Boletim_Item.Value := DMOracle.Sequencia('BOLETIM_ITEM');
end;

procedure TDMBoletim.QBoletimItemBeforeEdit(DataSet: TDataSet);
begin
  Raise Exception.Create('Não é permitido alterar item de Boletim!');
end;

procedure TDMBoletim.QBoletimBeforePost(DataSet: TDataSet);
Var wCustoTotal, wCustosAdicionais : Real;
    wAux, wAux2  : String;
begin
  // *** Calculo do Consumo das matérias primas ****
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK',QBoletimCod_Formula.Value);
  DMFormula.QFormula.Open;
  if not DMFormula.QFormula.Eof Then
   Begin
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+DMFormula.QFormulaCod_Produto.Text) <> 'ATIVO' Then
        Raise exception.Create('Produto acabado da formula não esta ativo');
     DMFormula.QFormulaItem.Open;
     While not DMFormula.QFormulaItem.Eof Do
     Begin
       If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '
        + DMFormula.QFormulaItemCod_Produto.Text) <> 'ATIVO' Then
          Raise exception.Create('Materia prima da formula não esta ativo')
      else
        DMFormula.QFormulaItem.Next;
     End;
     DMFormula.QFormulaItem.Close;
     DMFormula.QFormula.Close;
   End;
  wCustosAdicionais := 0;
  If QBoletim.State = dsEdit then
  With DMFormula do
  Begin
    Try
      QFormula.Close;
      QFormula.SetVariable('PK',QBoletimCod_Formula.Value);
      QFormula.Open;
      While not QBoletimItem.Eof do
        QBoletimItem.Delete;
      QFormulaItem.Open;
      QFormulaItem.First;
      If not QFormulaCusto.Eof then
        wCustosAdicionais := StrToFloat(DMOracle.FastSelect('SUM(QT_QUANTIDADE*VAL_CUSTO)', 'TB_FORMULA_CUSTO', 'COD_FORMULA = ' + QBoletimCod_Formula.Text));
      wCustoTotal := (wCustosAdicionais + QFormulaVal_Custo_Operacional.Value)*QBoletimQt_Fabricado.Value;

      While not QFormulaItem.Eof do
      Begin
        QBoletimItem.Insert;
        QBoletimItemCod_Produto.Value := QFormulaItemCod_Produto.Value;
        QBoletimItemCod_Lote_Tipo.Value := QFormulaItemCod_Lote_Tipo.Value;
        QBoletimItemQt_Usada.Value := QFormulaItemQt_Item.Value * QBoletimQt_Fabricado.Value;
        wAux := DMOracle.BuscaNome('SELECT DECODE(VL_CUSTO_MEDIO,0,VL_ULTIMO_CUSTO,VL_CUSTO_MEDIO) FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimItemCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimItemCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + FloatToStr(QBoletimCod_Filial.Value));
        If Trim(wAux) <> '' then
          QBoletimItemVal_Custo.Value := StrtoFloat(wAux)*QBoletimItemQt_Usada.Value;
        wCustoTotal := wCustoTotal + QBoletimItemVal_Custo.Value;
        QBoletimItem.Post;
        QFormulaItem.Next;
      End;
      QBoletimVal_Custo.Value := wCustoTotal;
      wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',
                       'COD_FORMULA = '+FloatToStr(QBoletimCod_Formula.Value));
      wAux2 := DMOracle.BuscaNome('SELECT COD_LOTE_TIPO FROM TB_FORMULA',
                         'COD_FORMULA = '+FloatToStr(QBoletimCod_Formula.Value));
                         
      // *** Produto Acabado
      DMEstoque.AtualizaEstoque(-1,
                              Trunc(QBoletimCOD_FILIAL.Value),
                              StrToFloat(wAux),
                              StrToInt(wAux2),
                              ifthen(QBoletimQT_FABRICADO_VARIACAO.Value > 0
                                , QBoletimQT_FABRICADO_VARIACAO.Value
                                , (QBoletimQT_FABRICADO.Value
                                  *QFormulaQt_Producao.Value)),
                              wCustoTotal,0,0 );
    Except
      If DMBoletim.QBoletimItem.State in [dsEdit,dsInsert] Then
        DMBoletim.QBoletimItem.Cancel;
      Raise;
    End;
  End;
end;

procedure TDMBoletim.QBoletimBeforeDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  While not QBoletimItem.Eof do
    QBoletimItem.Delete;
  With DMFormula do
  Begin
    QFormula.Close;
    QFormula.SetVariable('PK',QBoletimCod_Formula.Value);
    QFormula.Open;
  End;

  DMEstoque.AtualizaEstoque(-1,
                         Trunc(QBoletimCOD_FILIAL.Value),
                         DMFormula.QFormulaCod_Produto.Value,
                         Trunc(DMFormula.QFormulaCod_Lote_Tipo.Value),
                         QBoletimQT_FABRICADO.Value*DMFormula.QFormulaQt_Producao.Value*-1,
                         QBoletimVal_Custo.Value*-1,0,0 );

end;

procedure TDMBoletim.QBoletimItemCalcFields(DataSet: TDataSet);
begin
  QBoletimItemnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QBoletimItemCod_Produto.Value));
  QBoletimItemnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QBoletimItemCod_Lote_Tipo.Value));
end;

procedure TDMBoletim.QBoletimAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMBoletim.QBoletimDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var wCodigo : Integer;
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
  wCodigo := QBoletimCod_Boletim.Value;
  QBoletim.Close;
  QBoletim.SetVariable('PK',wCodigo);
  QBoletim.Open;
end;

procedure TDMBoletim.QBoletimBeforeInsert(DataSet: TDataSet);
begin
  If DMTurno.TurnoControleAberto = 0 Then
    Raise Exception.Create('Não tem nenhum turno aberto!');
//  QBoletimCod_Turno_Controle.Value := DMTurno.TurnoControleAberto;   ALTERADO SERGIO 30/11/02
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBoletim.QBoletimAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QBoletim.Close;
  QBoletim.Open;
end;

procedure TDMBoletim.QBoletimItemBeforeInsert(DataSet: TDataSet);
begin
  If QBoletim.State = dsInsert then
  Begin
    QBoletim.Post;
    QBoletim.Edit;
  End;
end;

procedure TDMBoletim.QBoletimAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QBoletimCod_Boletim.Value;
  DMBoletim.pGerando := False;
  QBoletim.Close;
  QBoletim.SetVariable('PK',wCodigo);
  QBoletim.Open;
end;

procedure TDMBoletim.QBoletimItemBeforePost(DataSet: TDataSet);
begin
  QBoletimItemCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
  DMEstoque.AtualizaEstoque(-2,  //-2 significa que não deve atualizar o custo no estoque
                            Trunc(QBoletimCOD_FILIAL.Value),
                            QBoletimItemCOD_PRODUTO.Value,
                            Trunc(QBoletimItemCOD_LOTE_TIPO.Value),
                            QBoletimItemQT_USADA.Value*-1,
                            0,0,0 );
end;

procedure TDMBoletim.QBoletimItemBeforeDelete(DataSet: TDataSet);
begin
  If QBoletimItem.State = dsBrowse then
     DMEstoque.AtualizaEstoque(-2,  //-2 significa que não deve atualizar o custo no estoque
                              Trunc(QBoletimCOD_FILIAL.Value),
                              QBoletimItemCOD_PRODUTO.Value,
                              Trunc(QBoletimItemCOD_LOTE_TIPO.Value),
                              QBoletimItemQT_USADA.Value,
                              0,0,0 );
end;

procedure TDMBoletim.QBoletimEAfterInsert(DataSet: TDataSet);
begin
  If wDt_Boletim = '' Then
  Begin
    QBoletimECod_Filial.Value := DMUsuario.CodFilialUsuario;
    QBoletimEDt_Boletim.Value := DMOracle.DataServ;
  End
  Else
  Begin
    QBoletimECod_Filial.Value := wFilial;
    QBoletimEDt_Boletim.Value := StrToDate(wDt_Boletim);
  End;
  QBoletimEQt_Fabricado.Value := 1;
  QBoletimECod_Formula.Value := wCod_Formula;

end;

procedure TDMBoletim.QBoletimEBeforePost(DataSet: TDataSet);
var wAux:String;
begin
  // esta rotina serve para verificar se esta trabalhando com produto desativado
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK',QBoletimECod_Formula.Value);
  DMFormula.QFormula.Open;
  if not DMFormula.QFormula.Eof Then
   Begin
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+DMFormula.QFormulaCod_Produto.Text) <> 'ATIVO' Then
        Raise exception.Create('Produto acabado da formula não esta ativo');
     DMFormula.QFormulaItem.Open;
     While not DMFormula.QFormulaItem.Eof Do
     Begin
       If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '
        + DMFormula.QFormulaItemCod_Produto.Text) <> 'ATIVO' Then
          Raise exception.Create('Materia prima da formula não esta ativo')
      else
        DMFormula.QFormulaItem.Next;
     End;
     DMFormula.QFormulaItem.Close;
     DMFormula.QFormula.Close;
   End;
  // ate aqui verifica se esta usando produto desativado na formula
  If QBoletimE.State = dsEdit then
  With DMFormula do
  Begin
    Try
      QFormula.Close;
      QFormula.SetVariable('PK',QBoletimECod_Formula.Value);
      QFormula.Open;
      While not QBoletimItemE.Eof do
        QBoletimItemE.Delete;
      QFormulaItem.Open;
      QFormulaItem.First;
      While not QFormulaItem.Eof do
      Begin
        QBoletimItemE.Insert;
        QBoletimItemECod_Produto.Value := QFormulaItemCod_Produto.Value;
        QBoletimItemECod_Lote_Tipo.Value := QFormulaItemCod_Lote_Tipo.Value;
        If QFormulaItemInd_Reaproveitamento.Value = 'SIM' Then  // reaproveitamento de massa SIM ou NÃO
           QBoletimItemEQt_Usada.Value := QFormulaItemQt_Item.Value*(1-(QBoletimEPerc_Massa.Value/100))* QBoletimEQt_Fabricado.Value
        Else
           QBoletimItemEQt_Usada.Value := QFormulaItemQt_Item.Value * QBoletimEQt_Fabricado.Value;
        wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimItemECod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimItemECod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + FloatToStr(QBoletimECod_Filial.Value));
        If Trim(wAux) <> '' then
          QBoletimItemEVal_Custo.Value := StrtoFloat(wAux)*QBoletimItemEQt_Usada.Value;
        QBoletimItemE.Post;
        QFormulaItem.Next;
      End;
//      QBoletimEQT_FABRICADO.Value:=-1;
    Except
      If DMBoletim.QBoletimItemE.State in [dsEdit,dsInsert] Then
         DMBoletim.QBoletimItemE.Cancel;
      Raise;
    End;
  End;
end;

procedure TDMBoletim.QBoletimItemEAfterInsert(DataSet: TDataSet);
begin
  QBoletimItemECod_Boletim.Value := QBoletimECod_Boletim.Value;
  QBoletimItemECod_Boletim_Item.Value := DMOracle.Sequencia('BOLETIM_ITEM');
end;

procedure TDMBoletim.QBoletimItemEBeforeDelete(DataSet: TDataSet);
var
  wEstoque,wSQL,wSQL_Criterio:String;
begin
  If QBoletimItemE.State = dsBrowse then
  begin
    wSQL:='SELECT '+
            'TB_FORMULA_ITEM.IND_BAIXA_ESTOQUE '+
          'FROM '+
            'TB_FORMULA, '+
            'TB_FORMULA_ITEM, '+
            'TB_BOLETIM, '+
            'TB_BOLETIM_ITEM ';
    wSQL_Criterio:=
            'TB_FORMULA.COD_FORMULA = TB_FORMULA_ITEM.COD_FORMULA '+
            'AND '+
            'TB_FORMULA.COD_FORMULA = TB_BOLETIM.COD_FORMULA '+
            'AND '+
            'TB_BOLETIM.COD_BOLETIM = TB_BOLETIM_ITEM.COD_BOLETIM '+
            'AND '+
            'TB_BOLETIM_ITEM.COD_PRODUTO = TB_FORMULA_ITEM.COD_PRODUTO '+
            'AND '+
            'TB_BOLETIM_ITEM.COD_BOLETIM_ITEM = '+QBoletimItemECod_Boletim_item.Text;

    wEstoque:=DMOracle.BuscaNome(wSQL,wSQL_Criterio);
    //----somente baixa estoque dos produtos que ind_baixa_estoque = SIM
    //--- cadastrado ind_baixa_estoque na tb_formula_item para nao baixar embalagens
    if wEstoque <> 'NAO' then
      DMEstoque.AtualizaEstoque(-2,
                              Trunc(QBoletimECOD_FILIAL.Value),
                              QBoletimItemECOD_PRODUTO.Value,
                              Trunc(QBoletimItemECOD_LOTE_TIPO.Value),
                              QBoletimItemEQT_USADA.Value,
                              0,0,0 );
  end;
end;

procedure TDMBoletim.QBoletimItemEBeforeEdit(DataSet: TDataSet);
begin
  Raise Exception.Create('Não é permitido alterar item de Boletim!');
end;

procedure TDMBoletim.QBoletimItemEBeforeInsert(DataSet: TDataSet);
begin
  If QBoletimE.State = dsInsert then
  Begin
    QBoletimE.Post;
    QBoletimE.Edit;
  End;
end;

procedure TDMBoletim.QBoletimItemEBeforePost(DataSet: TDataSet);
var
  wEstoque,wSQL,wSQL_Criterio:String;
begin
    wSQL:=
      'SELECT '+
        'TB_FORMULA_ITEM.IND_BAIXA_ESTOQUE '+
      'FROM '+
        'TB_FORMULA_ITEM ';

    wSQL_Criterio:=
        'TB_FORMULA_ITEM.COD_PRODUTO =  '+QBoletimItemECOD_PRODUTO.Text+' '+
        'AND '+
        'TB_FORMULA_ITEM.COD_FORMULA ='+QBoletimECOD_FORMULA.Text;

    wEstoque:=DMOracle.BuscaNome(wSQL,wSQL_Criterio);
    //----somente baixa estoque dos produtos que ind_baixa_estoque = SIM
    //--- cadastrado ind_baixa_estoque na tb_formula_item para nao baixar embalagens
    if wEstoque <> 'NAO' then
       DMEstoque.AtualizaEstoque(-2,
                            Trunc(QBoletimECOD_FILIAL.Value),
                            QBoletimItemECOD_PRODUTO.Value,
                            Trunc(QBoletimItemECOD_LOTE_TIPO.Value),
                            QBoletimItemEQT_USADA.Value*-1,
                            0,0,0 );
end;

procedure TDMBoletim.QBoletimItemECalcFields(DataSet: TDataSet);
begin
  QBoletimItemEnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QBoletimItemECod_Produto.Value));
  QBoletimItemEnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QBoletimItemECod_Lote_Tipo.Value));
end;

procedure TDMBoletim.QBoletimEAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QBoletimE.Close;
  QBoletimE.Open;
end;

procedure TDMBoletim.QBoletimEAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMBoletim.QBoletimEAfterPost(DataSet: TDataSet);
var wCodigo : Integer;
begin
  wCodigo := QBoletimECod_Boletim.Value;
  DMBoletim.pGerando := False;
  QBoletimE.Close;
  QBoletimE.SetVariable('PK',wCodigo);
  QBoletimE.Open;
  wFilial := QBoletimECod_Filial.Value;
  wCod_Formula := QBoletimECod_Formula.Value;
  wDt_Boletim := QBoletimEDt_Boletim.Text;
end;

procedure TDMBoletim.QBoletimEBeforeDelete(DataSet: TDataSet);
begin
  if not (QBoletimEInd_Tipo_Boletim.Value = 'P') then
    begin
      DMOracle.DBCemapa.StartTransaction;
      While not QBoletimItemE.Eof do
        QBoletimItemE.Delete;
    end
  else
    raise Exception.Create('Não é possível Excluir um boletim de Entrada de Produto Acabado');
end;

procedure TDMBoletim.QBoletimEBeforeEdit(DataSet: TDataSet);
begin
  If pGerando = False Then
    Raise Exception.Create('Não é permitido alterar Boletim!');
end;

procedure TDMBoletim.QBoletimEBeforeInsert(DataSet: TDataSet);
begin
  If DMTurno.TurnoControleAberto = 0 Then
    Raise Exception.Create('Não foi encontrado nenhum turno aberto!');
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBoletim.QBoletimECalcFields(DataSet: TDataSet);
begin
  QBoletimEnome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                               'COD_FILIAL =' + FloatToStr(QBoletimECod_Filial.Value));
  QBoletimEnome_formula.Value := DMOracle.BuscaNome(
                             'SELECT DESC_PRODUTO || '+Chr(39)+ ' |   '+Chr(39)+' || DESC_LOTE FROM TB_PRODUTO,TB_FORMULA,TB_LOTE_TIPO',
                             'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
                            +' AND TB_LOTE_TIPO.COD_LOTE_TIPO = TB_FORMULA.COD_LOTE_TIPO'
                            +' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimECod_Formula.Value) );
  QBoletimEturno.Value := DMOracle.BuscaNome('SELECT T1.DESC_TURNO FROM TB_TURNO T1,TB_TURNO_CONTROLE T2','T1.COD_TURNO=T2.COD_TURNO AND T2.COD_TURNO_CONTROLE = '+FloatToStr(QBoletimECod_Turno_Controle.Value));
end;

procedure TDMBoletim.QBoletimEDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var wCodigo : Integer;
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
  wCodigo := QBoletimECod_Boletim.Value;
  QBoletimE.Close;
  QBoletimE.SetVariable('PK',wCodigo);
  QBoletimE.Open;
end;


procedure TDMBoletim.QBoletimSAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QBoletimS.Close;
  QBoletimS.Open;
end;

procedure TDMBoletim.QBoletimSAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMBoletim.QBoletimSAfterInsert(DataSet: TDataSet);
begin
//  QBoletimSCod_Boletim.Value:=DmOracle.Sequencia('BOLETIM');
  QBoletimSCod_Turno_Controle.Value := DMTurno.TurnoControleAberto;
  If wDt_Boletim = '' Then
  Begin
//    QBoletimSCod_Filial.Value := DMUsuario.CodFilialUsuario;
    QBoletimSDt_Boletim.Value := DMOracle.DataServ;
  End
  Else
  Begin
//    QBoletimSCod_Filial.Value := wFilial;
    QBoletimSDt_Boletim.Value := StrToDate(wDt_Boletim);
  End;
//  QBoletimSCod_Formula.Value := wCod_Formula; }

end;

procedure TDMBoletim.QBoletimSAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QBoletimSCod_Boletim.Value;
  DMBoletim.pGerando := False;
  QBoletimS.Close;
  QBoletimS.SetVariable('PK',wCodigo);
  QBoletimS.Open;
  wFilial := QBoletimSCod_Filial.Value;
  wCod_Formula := QBoletimSCod_Formula.Value;
  wDt_Boletim := QBoletimSDt_Boletim.Text;
end;

procedure TDMBoletim.QBoletimSBeforeDelete(DataSet: TDataSet);
begin
  if not(QBoletimSQT_FABRICADO.value<0) then
    begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not QBoletimItemS.Eof do
      Begin
//        DMEstoque.AtualizaEstoque(-1,
//                                  QBoletimSCOD_FILIAL.Value,
//                                  QBoletimItemSCod_Produto.Value,
//                                  QBoletimItemSCod_Lote_Tipo.Value,
//                                  QBoletimItemSQt_Usada.Value*-1,
//                                  QBoletimItemSVal_Custo.Value*-1,0,0 );
        QBoletimItemS.Delete;
      End;
      DMFormula.QFormula.Close;
      DMFormula.QFormula.SetVariable('PK',QBoletimSCod_Formula.Value);
      DMFormula.QFormula.Open;
      //----comentado por Fabio 05/02/2004 na Faville para não atualizar estoque
     { DMEstoque.AtualizaEstoque(-1,
                                Trunc(QBoletimSCOD_FILIAL.Value),
                                DMFormula.QFormulaCod_Produto.Value,
                                Trunc(DMFormula.QFormulaCod_Lote_Tipo.Value),
                                QBoletimSQt_Fabricado.Value*-1,
                                0,0,0 );
     }
    Except
      DMOracle.DBCemapa.RollBack;
      QBoletimItemS.Close;
      QBoletimItemS.Open;
      Raise;
    end;
    end
  else
    raise Exception.Create('Não se pode excluir um Boletim de Baixa de Matéria Prima.');
end;

procedure TDMBoletim.QBoletimSBeforeEdit(DataSet: TDataSet);
begin
  If pGerando = False Then
    Raise Exception.Create('Não é permitido alterar Boletim!');
end;

procedure TDMBoletim.QBoletimSBeforeInsert(DataSet: TDataSet);
begin
  If DMTurno.TurnoControleAberto = 0 Then
    Raise Exception.Create('Não tem nenhum turno aberto!');
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBoletim.QBoletimSBeforePost(DataSet: TDataSet);
var wCustoTotal : Real;
    wAux  : String;
begin
  // esta rotina serve para verificar se esta trabalhando com produto desativado
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK',QBoletimSCod_Formula.Value);
  DMFormula.QFormula.Open;
  if not DMFormula.QFormula.Eof Then
   Begin
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+DMFormula.QFormulaCod_Produto.Text) <> 'ATIVO' Then
        Raise exception.Create('Produto acabado da formula não esta ativo');
     DMFormula.QFormulaItem.Open;
     While not DMFormula.QFormulaItem.Eof Do
     Begin
       If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '
        + DMFormula.QFormulaItemCod_Produto.Text) <> 'ATIVO' Then
          Raise exception.Create('Materia prima da formula não esta ativo')
       else
        DMFormula.QFormulaItem.Next;
     End;
     DMFormula.QFormulaItem.Close;
     DMFormula.QFormula.Close;
   End;
  // ate aqui verifica se esta usando produto desativado na formula

  // *** Calculo do Consumo das matérias primas ****
  if QBoletimS.State = dsEdit then
  with DMFormula do
  begin
    Try
      QFormula.Close;
      QFormula.SetVariable('PK',QBoletimSCod_Formula.Value);
      QFormula.Open;
      While not QBoletimItemS.Eof do
        QBoletimItemS.Delete;
      QFormulaItem.Open;
      QFormulaItem.First;
      wCustoTotal := QFormulaVal_Custo_Operacional.Value/QFormulaQt_Producao.Value*QBoletimSQt_Fabricado.Value;
      While not QFormulaItem.Eof do
      Begin
        QBoletimItemS.Insert;
        QBoletimItemSCod_Produto.Value := QFormulaItemCod_Produto.Value;
        QBoletimItemSCod_Lote_Tipo.Value := QFormulaItemCod_Lote_Tipo.Value;
        QBoletimItemSQt_Usada.Value := QFormulaItemQt_Item.Value / QFormulaQt_Producao.Value * QBoletimSQt_Fabricado.Value;
        wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimItemSCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimItemSCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + FloatToStr(QBoletimSCod_Filial.Value));
        If Trim(wAux) <> '' then
          QBoletimItemSVal_Custo.Value := StrtoFloat(wAux)*QBoletimItemSQt_Usada.Value;
        wCustoTotal := wCustoTotal + QBoletimItemSVal_Custo.Value;
        QBoletimItemS.Post;
        QFormulaItem.Next;
      End;
      QBoletimSVal_Custo.Value := wCustoTotal;
    // *** Produto Acabado                   Comentado por Fabio 05/02 na Faville para não atualizar estoque
   {   DMEstoque.AtualizaEstoque(-1,
                              Trunc(QBoletimSCOD_FILIAL.Value),
                              QFormulaCod_Produto.Value,
                              Trunc(QFormulaCod_Lote_Tipo.Value),
//                              StrToFloat(wAux),
//                              StrToFloat(wAux2),
                              QBoletimSQT_FABRICADO.Value,
                              wCustoTotal,0,0 );
    }
    Except
      If DMBoletim.QBoletimItemS.State in [dsEdit,dsInsert] Then
        DMBoletim.QBoletimItemS.Cancel;
      Raise;
    End;
  end;
end;

procedure TDMBoletim.QBoletimSCalcFields(DataSet: TDataSet);
begin
  QBoletimSnome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                               'COD_FILIAL =' + FloatToStr(QBoletimSCod_Filial.Value));
  QBoletimSnome_formula.Value := DMOracle.BuscaNome(
                             'SELECT DESC_PRODUTO || '+Chr(39)+ ' |   '+Chr(39)+' || DESC_LOTE FROM TB_PRODUTO,TB_FORMULA,TB_LOTE_TIPO',
                             'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
                            +' AND TB_LOTE_TIPO.COD_LOTE_TIPO = TB_FORMULA.COD_LOTE_TIPO'
                            +' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimSCod_Formula.Value) );
  QBoletimSturno.Value := DMOracle.BuscaNome('SELECT TB_TURNO.DESC_TURNO FROM TB_TURNO, TB_TURNO_CONTROLE',
                         'TB_TURNO_CONTROLE.COD_TURNO = TB_TURNO.COD_TURNO'
                         +' AND TB_TURNO_CONTROLE.COD_TURNO_CONTROLE = '+FloatToStr(QBoletimSCod_Turno_Controle.Value));
                      
end;

procedure TDMBoletim.QBoletimSDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var wCodigo : Integer;
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
  wCodigo := QBoletimSCod_Boletim.Value;
  QBoletimS.Close;
  QBoletimS.SetVariable('PK',wCodigo);
  QBoletimS.Open;
end;

procedure TDMBoletim.QBoletimItemSAfterInsert(DataSet: TDataSet);
begin
  QBoletimItemSCod_Boletim.Value := QBoletimSCod_Boletim.Value;
//  QBoletimItemSCod_Boletim_Item.Value := DMOracle.Sequencia('BOLETIM_ITEM');
end;

procedure TDMBoletim.QBoletimItemSBeforeEdit(DataSet: TDataSet);
begin
  Raise Exception.Create('Não é permitido alterar item de Boletim!');
end;

procedure TDMBoletim.QBoletimItemSBeforeInsert(DataSet: TDataSet);
begin
  If QBoletimS.State = dsInsert then
  Begin
    QBoletimS.Post;
    QBoletimS.Edit;
  End;

end;

procedure TDMBoletim.QBoletimItemSCalcFields(DataSet: TDataSet);
begin
  QBoletimItemSnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QBoletimItemSCod_Produto.Value));
  QBoletimItemSnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QBoletimItemSCod_Lote_Tipo.Value));
end;

procedure TDMBoletim.QRRelacaoCalcFields(DataSet: TDataSet);
begin
  QrRelacaosqt_fabricado.value := QRRelacaoqt_fabricado.Value;
  QrRelacaoSQT_KILOS.Value := QRRelacaoNUM_EMBALAGEM.Value*QRRelacaoQT_FABRICADO.Value;

//  if QRRelacaosqt_fabricado.Value < 0 then
//  begin
//     QRRelacaosqt_fabricado.Value := QRRelacaosqt_fabricado.Value *-1;
//     QRRelacaosqt_kilos.Value := QRRelacaosqt_kilos.value *-1
//  end;
end;

procedure TDMBoletim.QProducaoCalcFields(DataSet: TDataSet);
begin
  QProducaodesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                               'COD_FILIAL =' + FloatToStr(QProducaoCod_Filial.Value));
  QProducaodesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                               'COD_PRODUTO =' + FloatToStr(QProducaoCod_produto.Value));
  QProducaodesc_turno.Value := DMOracle.BuscaNome('SELECT DESC_TURNO FROM TB_TURNO',
                               'COD_TURNO =' + FloatToStr(QProducaoCod_turno.Value));
end;

procedure TDMBoletim.QProducaoAfterInsert(DataSet: TDataSet);
begin
//  QProducaoCod_Producao.Value := DMOracle.Sequencia('PRODUCAO');
  QProducaoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QProducaoDt_Lancamento.Value := DMOracle.DataServ;

end;

procedure TDMBoletim.QRConsMatPrimaCalcFields(DataSet: TDataSet);
Var wCusto,wAux : String;
begin
  //comentado marcos 02/02/2016
 { wCusto := DMOracle.BuscaNome('SELECT avg((Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE) / qt_quantidade) FROM tb_nota_cab,Tb_nota_item,TB_OPERACAO',
       'Tb_nota_cab.cod_nota_cab=tb_nota_item.cod_nota_cab and tb_nota_cab.cod_operacao = tb_operacao.cod_operacao '+
       ' and tb_nota_cab.ind_entrada_saida=' + Chr(39) + 'E' + Chr(39) + ' and tb_nota_cab.ind_situacao=' + Chr(39) + '2' + Chr(39) +
       ' and tb_operacao.ind_compras=' + Chr(39) + 'C' + Chr(39) + ' and tb_nota_cab.cod_filial= ' + QRConsMatPrimaCod_Filial.Text +
       ' and tb_nota_item.cod_produto= ' + QRConsMatPrimaCod_Produto.Text + ' and tb_nota_cab.dt_recebimento>=' + Chr(39) + DateToStr(Date - 30) + Chr(39));
  If wCusto <> '' Then
     QRConsMatPrimasVal_Custo.Value := StrToFloat(wCusto)
  Else
   Begin
     wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
             'COD_PRODUTO = '+QRConsMatPrimaCod_Produto.Text +
             ' AND COD_FILIAL = ' + QRConsMatPrimaCod_Filial.Text);
     If wAux <> '' Then
       QRConsMatPrimasVal_Custo.Value := StrToFloat(wAux)
     Else
       QRConsMatPrimasVal_Custo.Value := 0;
   End; }
end;

procedure TDMBoletim.QRConsMatPrima2CalcFields(DataSet: TDataSet);
Var wCusto,wAux : String;
begin
  //COMENTADO MARCOS 02/02/2016
{  wCusto := DMOracle.BuscaNome('SELECT avg((Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_IPI + Tb_nota_item.VAL_FRETE) / qt_quantidade) FROM tb_nota_cab,Tb_nota_item,TB_OPERACAO',
       'Tb_nota_cab.cod_nota_cab=tb_nota_item.cod_nota_cab and tb_nota_cab.cod_operacao = tb_operacao.cod_operacao '+
       ' and tb_nota_cab.ind_entrada_saida=' + Chr(39) + 'E' + Chr(39) + ' and tb_nota_cab.ind_situacao=' + Chr(39) + '2' + Chr(39) +
       ' and tb_operacao.ind_compras=' + Chr(39) + 'C' + Chr(39) + ' and tb_nota_cab.cod_filial= ' + QRConsMatPrima2Cod_Filial.Text +
       ' and tb_nota_item.cod_produto= ' + QRConsMatPrima2Cod_Produto.Text + ' and tb_nota_cab.dt_recebimento>=' + Chr(39) + DateToStr(Date - 30) + Chr(39));
  If wCusto <> '' Then
     QRConsMatPrima2sVal_Custo.Value := StrToFloat(wCusto)
  Else
   Begin
     wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
             'COD_PRODUTO = '+QRConsMatPrima2Cod_Produto.Text +
             ' AND COD_FILIAL = ' + QRConsMatPrima2Cod_Filial.Text);
     If wAux <> '' Then
       QRConsMatPrima2sVal_Custo.Value := StrToFloat(wAux)
     Else
       QRConsMatPrima2sVal_Custo.Value := 0;
   End; }

end;

procedure TDMBoletim.QRBoletim_CustoCalcFields(DataSet: TDataSet);
var
  wNumclasse : integer;
  wTotal: double;
  wCodPerca, wCodPercaAcabado: string;
begin
  if not (QRBoletim_CustoCOD_PRODUTO_BOLETIM.IsNull) then
    QRBoletim_Custodesc_produto_acabado.Value := DMOracle.FastSelect('DESC_PRODUTO',
      'TB_PRODUTO','COD_PRODUTO = ' + QRBoletim_CustoCOD_PRODUTO_BOLETIM.Text);

  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') then
  begin
    wCodPerca := DMOracle.FastSelect('COD_PERCA_PRODUCAO_CAB','TB_PERCA_PRODUCAO','COD_BOLETIM = ' + QRBoletim_CustoCOD_BOLETIM.Text +
    				     ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'NAO' + chr(39) );
    wCodPercaAcabado := DMOracle.FastSelect('COD_PRODUTO','TB_PERCA_PRODUCAO','COD_BOLETIM = ' + QRBoletim_CustoCOD_BOLETIM.Text +
    					    ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'SIM' + chr(39) );
    if (wCodPerca <> '') then
    begin
      QRBoletim_Custoval_custo_perca.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_CUSTO) FROM TB_PERCA_PRODUCAO','COD_BOLETIM = '
      							  + QRBoletim_CustoCOD_BOLETIM.Text + ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'NAO' + chr(39)));
      QRBoletim_Custoqt_perca_producao.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_PERCA_PRODUCAO) FROM TB_PERCA_PRODUCAO','COD_BOLETIM = '
      							  + QRBoletim_CustoCOD_BOLETIM.Text + ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'NAO' + chr(39)));
    end;
    if (wCodPercaAcabado <> '') then
    begin
      QRBoletim_Custoqt_perca_acabado.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_PERCA_PRODUCAO) FROM TB_PERCA_PRODUCAO','COD_BOLETIM = '
      							   + QRBoletim_CustoCOD_BOLETIM.Text + ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'SIM' + chr(39)));
      QRBoletim_Custoval_custo_acabado.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_CUSTO) FROM TB_PERCA_PRODUCAO','COD_BOLETIM = '
      							   + QRBoletim_CustoCOD_BOLETIM.Text + ' AND IND_PRODUTO_ACABADO = ' + chr(39) + 'SIM' + chr(39)));
    end;
  end
  else
  begin
    QRBoletim_Custoval_custo_perca.Value := 0;
    QRBoletim_Custoqt_perca_producao.Value := 0;
    QRBoletim_Custoqt_perca_acabado.Value := 0;
    QRBoletim_Custoval_custo_acabado.Value := 0;
  end;
end;

procedure TDMBoletim.QBoletimProducaoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QBoletimProducao.Close;
  QBoletimProducao.Open;
end;

procedure TDMBoletim.QBoletimProducaoAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMBoletim.QBoletimProducaoAfterInsert(DataSet: TDataSet);
begin
  //  QBoletimCod_Boletim.Value := DMOracle.Sequencia('BOLETIM');
  QBoletimProducaoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QBoletimProducaoCOD_DEPARTAMENTO.Value :=DMUsuario.CodDepartamentoUsuario;
  QBoletimProducaoDt_Boletim.Value := DMOracle.DataServ;
  QBoletimProducaoCod_Turno_Controle.Value := DMTurno.TurnoControleAberto;
end;

procedure TDMBoletim.QBoletimProducaoAfterPost(DataSet: TDataSet);
var wCodigo : integer;
begin
  wCodigo := QBoletimProducaoCod_Boletim.Value;
  DMBoletim.pGerando := False;
  QBoletimProducao.Close;
  QBoletimProducao.SetVariable('PK',wCodigo);
  QBoletimProducao.Open;
end;

procedure TDMBoletim.QBoletimProducaoBeforeDelete(DataSet: TDataSet);
begin
  if QBoletimProducaoIND_SITUACAO.Value = '1' then
  begin
    DMOracle.DBCemapa.StartTransaction;
    While not QBoletimProducaoItem.Eof do
      QBoletimProducaoItem.Delete;
    while not QBoletimProducaoComissao.Eof do //Ao excluir a ordem de produção não excluia o lcto do QBoletimProducaoComissao (DEION) - Junior 26/06/2023
      QBoletimProducaoComissao.Delete;
    With DMFormula do
    Begin
      QFormula.Close;
      QFormula.SetVariable('PK',QBoletimProducaoCod_Formula.Value);
      QFormula.Open;
    end;
  end
  else
    Raise Exception.Create('Não é permitido excluir Boletim de Produção Confirmada ou Parcial');
     { DMEstoque.AtualizaEstoque(-1, Trunc(QBoletimCOD_FILIAL.Value), DMFormula.QFormulaCod_Produto.Value,
                                 Trunc(DMFormula.QFormulaCod_Lote_Tipo.Value),
                                 QBoletimQT_FABRICADO.Value*DMFormula.QFormulaQt_Producao.Value*-1,
                                 QBoletimVal_Custo.Value*-1,0,0 );}
end;

procedure TDMBoletim.QBoletimProducaoBeforeEdit(DataSet: TDataSet);
begin
  If QBoletimProducaoIND_SITUACAO.Value = '2' Then
    Raise Exception.Create('Não é permitido alterar um boletim confirmado');
end;

procedure TDMBoletim.QBoletimProducaoBeforeInsert(DataSet: TDataSet);
begin
  If DMTurno.TurnoControleAberto = 0 Then
    Raise Exception.Create('Não tem nenhum turno aberto!');
  DMOracle.DBCemapa.StartTransaction;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    QBoletimProducaoCOD_LOTE_TIPO.Value := 1;
end;

procedure TDMBoletim.QBoletimProducaoBeforePost(DataSet: TDataSet);
Var wCustoTotal, wCustosAdicionais, wCustoPerca : Real;
    wAux, wAux2, wProd, wCodPerca  : String;
    wQt_estoque : Double;
    wFilial : integer;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' Then
    wFilial := 1
  else
    wFilial := DMBoletim.QBoletimProducaoCOD_FILIAL.Value;

  QBoletimProducaoCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;

    // *** Calculo do Consumo das matérias primas ****
  DMFormula.QFormula.Close;
  DMFormula.QFormula.SetVariable('PK',QBoletimCod_Formula.Value);
  DMFormula.QFormula.Open;
  if not DMFormula.QFormula.Eof Then
   Begin
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+DMFormula.QFormulaCod_Produto.Text) <> 'ATIVO' Then
        Raise exception.Create('Produto acabado da formula não esta ativo');
     DMFormula.QFormulaItem.Open;
     While not DMFormula.QFormulaItem.Eof Do
     Begin
       If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '
        + DMFormula.QFormulaItemCod_Produto.Text) <> 'ATIVO' Then
          Raise exception.Create('Materia prima da formula não esta ativo')
      else
        DMFormula.QFormulaItem.Next;
     End;
     DMFormula.QFormulaItem.Close;
     DMFormula.QFormula.Close;
   End;
  wCustosAdicionais := 0;
  If QBoletimProducao.State = dsEdit then
  With DMFormula do
  Begin
    Try
      QFormula.Close;
      QFormula.SetVariable('PK',QBoletimProducaoCod_Formula.Value);
      QFormula.Open;
      While not QBoletimProducaoItem.Eof do
        QBoletimProducaoItem.Delete;
      QFormulaItem.Open;
      QFormulaItem.First;
      If not QFormulaCusto.Eof then
        wCustosAdicionais := StrToFloat(DMOracle.FastSelect('SUM(QT_QUANTIDADE*VAL_CUSTO)', 'TB_FORMULA_CUSTO', 'COD_FORMULA = ' + QBoletimProducaoCod_Formula.Text));
      wCustoTotal := (wCustosAdicionais + QFormulaVal_Custo_Operacional.Value)*QBoletimProducaoQt_Fabricado.Value;

      While not QFormulaItem.Eof do
      Begin
        QBoletimProducaoItem.Insert;
        QBoletimProducaoItemCod_Produto.Value := QFormulaItemCod_Produto.Value;
        //Não permitir confirmar o boletim em caso de estoque insuficiente. - Solicitado por Marcos. Junior 24/04/2017
        if DMOracle.BuscaNome('SELECT min(COD_LOTE_TIPO) FROM TB_ESTOQUE', 'COD_PRODUTO ='+ QFormulaItemCod_Produto.Text +
                                        ' AND QT_QUANTIDADE > 0 AND COD_FILIAL = ' + IntTostr(wFilial))  <> '' then
          QBoletimProducaoItemCod_Lote_Tipo.Value := StrToInt(DMOracle.BuscaNome('SELECT min(COD_LOTE_TIPO) FROM TB_ESTOQUE',
              'COD_PRODUTO ='+ QFormulaItemCod_Produto.Text + ' AND QT_QUANTIDADE > 0 AND COD_FILIAL = ' + IntTostr(wFilial)))
        else
          raise Exception.Create('Estoque Insuficiente. Produto: ' + QBoletimProducaoItemCOD_PRODUTO.Text+'-'+QBoletimProducaoItemnome_produto.Text);

        QBoletimProducaoItemQt_Usada.Value := QFormulaItemQt_Item.Value * QBoletimProducaoQt_Fabricado.Value;
        //wAux := DMOracle.BuscaNome('SELECT DECODE(VL_CUSTO_MEDIO,0,VL_ULTIMO_CUSTO,VL_CUSTO_MEDIO) FROM TB_ESTOQUE',
        //ALTERADO MARCOS 10/04/2019 PEGAR SEMPRE ULTIMO CUSTO
        wAux := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
                                   'COD_PRODUTO = '+FloatToStr(QBoletimProducaoItemCod_Produto.Value)
                                   +' AND COD_LOTE_TIPO = '+FloatToStr(QBoletimProducaoItemCod_Lote_Tipo.Value)
                                   +' AND COD_FILIAL = ' + IntTostr(wFilial));
        //**Não permitir confirmar o boletim em caso de estoque insuficiente. - Solicitado por Marcos. Junior 24/04/2017**//
        wQt_estoque :=  StrToFloat(DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE','COD_PRODUTO=' + QFormulaItemCOD_PRODUTO.Text +
                              ' AND COD_FILIAL = ' + IntTostr(wFilial)));
        if wQt_estoque < QBoletimProducaoItemQT_USADA.Value then
          raise Exception.Create('Estoque Insuficiente. Produto: '+ QBoletimProducaoItemCOD_PRODUTO.Text+'-'+QBoletimProducaoItemnome_produto.Text);
        //******//
        If Trim(wAux) <> '' then
          QBoletimProducaoItemVal_Custo.Value := StrtoFloat(wAux)*QBoletimProducaoItemQt_Usada.Value;
        wCustoTotal := wCustoTotal + QBoletimProducaoItemVal_Custo.Value;
        QBoletimProducaoItem.Post;
        QFormulaItem.Next;
      End;
      wCodPerca := DMOracle.FastSelect('COD_PERCA_PRODUCAO_CAB','TB_PERCA_PRODUCAO','COD_BOLETIM = ' + QBoletimProducaoItemCOD_BOLETIM.Text);
      if (wCodPerca <> '') then
      begin
        wCustoPerca := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_CUSTO) FROM TB_PERCA_PRODUCAO','COD_BOLETIM = ' + QBoletimProducaoItemCOD_BOLETIM.Text));
        wCustoTotal := wCustoTotal + wCustoPerca;
      end;
      QBoletimProducaoVal_Custo.Value := wCustoTotal;
      wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_FORMULA',
                       'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
      wAux2 := DMOracle.BuscaNome('SELECT COD_LOTE_TIPO FROM TB_FORMULA',
                         'COD_FORMULA = '+FloatToStr(QBoletimProducaoCod_Formula.Value));
                         
      {// *** Produto Acabado
      DMEstoque.AtualizaEstoque(-1,
                              Trunc(QBoletimCOD_FILIAL.Value),
                              StrToFloat(wAux),
                              StrToInt(wAux2),
                              ifthen(QBoletimQT_FABRICADO_VARIACAO.Value > 0
                                , QBoletimQT_FABRICADO_VARIACAO.Value
                                , (QBoletimQT_FABRICADO.Value
                                  *QFormulaQt_Producao.Value)),
                              wCustoTotal,0,0 );}
    Except
      If DMBoletim.QBoletimProducaoItem.State in [dsEdit,dsInsert] Then
        DMBoletim.QBoletimProducaoItem.Cancel;
      Raise;
    End;
  End;

  //Gera a aba custo de mão de obra com base na formula

  DMFormula.QFormulaCusto.Close;
  DMFormula.QFormulaCusto.SetVariable('COD_FORMULA',QBoletimCod_Formula.Value);
  DMFormula.QFormulaCusto.Open;

  wCustoTotal := 0;

  While not QBoletimProducaoCusto.Eof do
    QBoletimProducaoCusto.Delete;
  DMFOrmula.QFormulaCusto.Open;
  DMFOrmula.QFormulaCusto.First;

  While not DMFormula.QFormulaCusto.Eof do
  Begin
    QBoletimProducaoCusto.Insert;
    QBoletimProducaoCustoDESC_BOLETIM_CUSTO.Value := DMFormula.QFormulaCustoDESC_FORMULA_CUSTO.Value;
    QBoletimProducaoCustoQT_USADA.Value := DMFOrmula.QFormulaCustoQT_QUANTIDADE.Value * QBoletimProducaoQT_FABRICADO.Value;
    QBoletimProducaoCustoVAL_CUSTO.Value := QBoletimProducaoCustoQT_USADA.Value * DMFormula.QFormulaCustoVAL_CUSTO.Value;
    wCustoTotal := wCustoTotal + QBoletimProducaoCustoVAL_CUSTO.Value;
    QBoletimProducaoCusto.Post;
    DMFormula.QFormulaCusto.Next;
  End;

  QBoletimProducaoVAL_MAO_OBRA.Value := wCustoTotal;

  //----------------------------------------------------------------------------
  //  Gian 02/04/2019, solicitado por João Paulo da Deion
  //  Aba comissões de produção.
  //----------------------------------------------------------------------------
  if QBoletimProducaoComissao.RecordCount = 0 then
  begin
    QBoletimProducaoComissao.Open;
    QBoletimProducaoComissao.First;

    while not QBoletimProducaoComissao.Eof do
    begin
      QBoletimProducaoComissao.Delete;
    end;

    QBoletimProducaoItem.First;
    while not QBoletimProducaoItem.Eof do
    begin
      wProd := DMOracle.FastSelect('PERC_COMISSAO_PRODUCAO','TB_PRODUTO','COD_PRODUTO = ' + QBoletimProducaoItemCOD_PRODUTO.Text);
      QBoletimProducaoComissao.Append;
      QBoletimProducaoComissaoCOD_BOLETIM.Value := QBoletimProducaoCOD_BOLETIM.Value;
      if wProd <> '' then
        QBoletimProducaoComissaoPERC_COMISSAO.Value := StrToFloat(wProd)
      else
        QBoletimProducaoComissaoPERC_COMISSAO.Value := 0;
      QBoletimProducaoComissaoCOD_PRODUTO.Value := QBoletimProducaoItemCOD_PRODUTO.Value;
      QBoletimProducaoComissaoQT_QUANTIDADE.Value := QBoletimProducaoItemQT_USADA.Value;
      QBoletimProducaoItem.Next;
    end;
    QBoletimProducaoComissao.Post;
  end;
  if QPercaProducaoCOD_PERCA_PRODUCAO_CAB.text <> '' then
  begin
    QPercaProducao.Edit;
    QPercaProducao.Post;
  end;

end;

procedure TDMBoletim.QBoletimProducaoCalcFields(DataSet: TDataSet);
begin
//  QBoletimProducaonome_formula.Value := DMOracle.BuscaNome(
//                             'SELECT DESC_PRODUTO || '+Chr(39)+ ' |   '+Chr(39)+' || DESC_LOTE FROM TB_PRODUTO,TB_FORMULA,TB_LOTE_TIPO',
//                             'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO'
//                            +' AND TB_LOTE_TIPO.COD_LOTE_TIPO = TB_FORMULA.COD_LOTE_TIPO'
//                            +' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimProducaoCod_Formula.Value) );
  QBoletimProducaonome_formula.Value := DMOracle.BuscaNome(
                             'SELECT DESC_PRODUTO FROM TB_PRODUTO,TB_FORMULA',
                             'TB_PRODUTO.COD_PRODUTO = TB_FORMULA.COD_PRODUTO' +
                             ' AND TB_FORMULA.COD_FORMULA = '+ FloatToStr(QBoletimProducaoCod_Formula.Value) );

  QBoletimProducaoturno.Value := DMOracle.BuscaNome('SELECT TB_TURNO.DESC_TURNO FROM TB_TURNO, TB_TURNO_CONTROLE',
                         'TB_TURNO_CONTROLE.COD_TURNO = TB_TURNO.COD_TURNO'
                         +' AND TB_TURNO_CONTROLE.COD_TURNO_CONTROLE = '+FloatToStr(QBoletimProducaoCod_Turno_Controle.Value));
  with DMFormula do
  begin
    if QBoletimProducaoQT_FABRICADO.Value > 0 then
    begin
      if QBoletimProducaoCOD_FORMULA.Value <> QFormulaCOD_FORMULA.Value then
      begin
        QFormula.Close;
        QFormula.SetVariable('PK',QBoletimProducaoCod_Formula.Value);
        QFormula.Open;
      end;
      QBoletimProducaoqt_fabricacao.Value :=
        QBoletimProducaoQT_FABRICADO.Value*QFormulaQt_Producao.Value;
      if QBoletimProducaoQT_FABRICADO_VARIACAO.Value > 0 then
      begin
        QBoletimProducaoperc_variacao.Value
          := - (1 - (QBoletimProducaoQT_FABRICADO_VARIACAO.Value
            / QBoletimProducaoqt_fabricacao.Value));
      end;
    end;
  end;
end;

procedure TDMBoletim.QBoletimProducaoDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var wCodigo : Integer;
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
  wCodigo := QBoletimProducaoCod_Boletim.Value;
  QBoletimProducao.Close;
  QBoletimProducao.SetVariable('PK',wCodigo);
  QBoletimProducao.Open;
end;

procedure TDMBoletim.QBoletimProducaoItemAfterInsert(DataSet: TDataSet);
begin
  QBoletimProducaoItemCod_Boletim.Value := QBoletimProducaoCod_Boletim.Value;
  QBoletimProducaoItemCod_Boletim_Item.Value := DMOracle.Sequencia('BOLETIM_ITEM');

end;

procedure TDMBoletim.QBoletimProducaoItemBeforeDelete(DataSet: TDataSet);
begin
  QBoletimProducaoItemCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
  {If QBoletimItem.State = dsBrowse then
    DMEstoque.AtualizaEstoque(-1,
                              Trunc(QBoletimCOD_FILIAL.Value),
                              QBoletimItemCOD_PRODUTO.Value,
                              Trunc(QBoletimItemCOD_LOTE_TIPO.Value),
                              QBoletimItemQT_USADA.Value,
                              0,0,0 );}
end;

procedure TDMBoletim.QBoletimProducaoItemBeforeEdit(DataSet: TDataSet);
begin
  Raise Exception.Create('Não é permitido alterar item de Boletim!');
end;

procedure TDMBoletim.QBoletimProducaoItemBeforeInsert(DataSet: TDataSet);
begin
  If QBoletimProducao.State = dsInsert then
  Begin
    QBoletimProducao.Post;
    QBoletimProducao.Edit;
  End;
end;

procedure TDMBoletim.QBoletimProducaoItemBeforePost(DataSet: TDataSet);
begin
  QBoletimProducaoItemCOD_USUARIO.Value := DmUsuario.CodUsuarioCorrente;
  {DMEstoque.AtualizaEstoque(-1,
                            Trunc(QBoletimCOD_FILIAL.Value),
                            QBoletimItemCOD_PRODUTO.Value,
                            Trunc(QBoletimItemCOD_LOTE_TIPO.Value),
                            QBoletimItemQT_USADA.Value*-1,
                            0,0,0 );}
end;

procedure TDMBoletim.QBoletimProducaoItemCalcFields(DataSet: TDataSet);
begin
  QBoletimProducaoItemnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QBoletimProducaoItemCod_Produto.Value));
  QBoletimProducaoItemnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QBoletimProducaoItemCod_Lote_Tipo.Value));
end;

procedure TDMBoletim.PopulaCalcFields;
var
  Buscador : TBuscador;
begin
  QBoletimProducaodesc_situacao.Value := '';
  if (QBoletimProducaoIND_SITUACAO.Value = SIT_BOLETIM_DIGITADA) then
    QBoletimProducaodesc_situacao.Value := 'DIGITADA'
  else if (QBoletimProducaoIND_SITUACAO.Value = SIT_BOLETIM_CONFIRMADA) then
    QBoletimProducaodesc_situacao.Value := 'CONFIRMADA'
  else
    QBoletimProducaodesc_situacao.Value := 'PARCIAL';

end;


procedure TDMBoletim.QBoletimProducaoAfterOpen(DataSet: TDataSet);
begin
  PopulaCalcFields;
  QBoletimProducaoComissao.Open;
  //QBoletimProducaoSomaComissao.Close;
  //QBoletimProducaoSomaComissao.SetVariable('COD_BOLETIM',wCodigo);
  QBoletimProducaoSomaComissao.Open;
end;

procedure TDMBoletim.QRBoletimOrdemProducaoCalcFields(DataSet: TDataSet);
begin
  QRBoletimOrdemProducaodesc_lote_item.Value := '-' + DMOracle.FastSelect('DESC_LOTE','TB_LOTE_TIPO','COD_LOTE_TIPO = ' +
                         QRBoletimOrdemProducaoCOD_LOTE_TIPO.Text);
end;

procedure TDMBoletim.QRMtFaturadaCalcFields(DataSet: TDataSet);
var wCodLoteTipo : integer;
    wGerenciaLote : String;
begin
  wGerenciaLote := DMOracle.FastSelect('IND_GERENCIA_LOTE_ESTOQUE','TB_PARAM_SISTEMA','1=1');
  if wGerenciaLote = 'SIM' then
  begin
    wCodLoteTipo := StrToInt(DMOracle.BuscaNome('SELECT MAX(COD_LOTE_TIPO) FROM TB_ESTOQUE ','COD_PRODUTO = '+
                    DMBoletim.QRMtFaturadaCOD_PROD_MAT_PRIMA.Text + ' AND COD_FILIAL = ' + DMBoletim.QRMtFaturadaCOD_FILIAL.Text));
    DMBoletim.QRMtFaturadavl_custo_unitario.Value :=
         StrToFloat(DMOracle.BuscaNome('SELECT DECODE(VL_CUSTO_MEDIO,0,VL_ULTIMO_CUSTO,VL_CUSTO_MEDIO) FROM TB_ESTOQUE',
                  'COD_PRODUTO = ' + DMBoletim.QRMtFaturadaCOD_PROD_MAT_PRIMA.Text + 'AND COD_FILIAL = ' + DMBoletim.QRMtFaturadaCOD_FILIAL.Text +
                  ' AND COD_LOTE_TIPO = ' + IntToStr(wCodLoteTipo) ));
  end
  else
  begin
    DMBoletim.QRMtFaturadavl_custo_unitario.Value := DMBoletim.QRMtFaturadaVL_CUSTO_MEDIO.Value;
  end;
end;

procedure TDMBoletim.QBoletimProducaoComissaoCalcFields(DataSet: TDataSet);
begin
  QBoletimProducaoComissaoval_comissao.Value := QBoletimProducaoComissaoQT_QUANTIDADE.Value * QBoletimProducaoComissaoPERC_COMISSAO.Value;
  QBoletimProducaoComissaoproduto_nome.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QBoletimProducaoComissaoCod_Produto.Value));
end;

procedure TDMBoletim.QPercaProducaoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QPercaProducao.Close;
  QPercaProducao.Open;
end;

procedure TDMBoletim.QPercaProducaoAfterPost(DataSet: TDataSet);
begin
  QPercaProducao.Close;
  QPercaProducao.Open;
end;

procedure TDMBoletim.QPercaProducaoCalcFields(DataSet: TDataSet);
begin
  if (QPercaProducaoCOD_PRODUTO.Text <> '') then
    QPercaProducaodesc_produto.Value := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QPercaProducaoCOD_PRODUTO.Text);
end;

procedure TDMBoletim.QBoletimProducaoComissaoBeforeInsert(
  DataSet: TDataSet);
begin
  QBoletimProducaoComissaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMBoletim.QBoletimProducaoComissaoBeforeEdit(DataSet: TDataSet);
begin
  QBoletimProducaoComissaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMBoletim.QBoletimProducaoComissaoBeforePost(DataSet: TDataSet);
begin
  QBoletimProducaoComissaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMBoletim.QPercaProducaoBeforePost(DataSet: TDataSet);
var
  wCusto : double;
  wTipoCusto, wProduto: string;
begin
  QPercaProducaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'SIM') then
  begin
    wProduto := DMOracle.FastSelect('COD_PRODUTO','TB_ESTOQUE','COD_PRODUTO = ' + QPercaProducaoCOD_PRODUTO.Text);
    if (wProduto = '') then
    if (QPercaProducaoCOD_PRODUTO.Text <> '') then
    begin
      	showMessage('O produto: ' + QPercaProducaoCOD_PRODUTO.Text + ', esta sem custo cadastrado. Favor verificar!');
        QPercaProducao.Cancel;
    end;
    begin
      wTipoCusto := DMOracle.FastSelect('IND_CUSTO','TB_PARAM_SISTEMA');
      if (wTipoCusto = 'ULTIMO') then
      	wCusto := 0+ StrToFloat(DMOracle.FastSelect('VL_ULTIMO_CUSTO','TB_ESTOQUE','COD_PRODUTO = ' + QPercaProducaoCOD_PRODUTO.Text))
      else
        wCusto := 0+ StrToFloat(DMOracle.FastSelect('VL_CUSTO_MEDIO','TB_ESTOQUE','COD_PRODUTO = ' + QPercaProducaoCOD_PRODUTO.Text));
      if wCusto < 0.000001 then
      begin
      	showMessage('O produto: ' + QPercaProducaoCOD_PRODUTO.Text + ', esta sem custo cadastrado. Favor verificar!');
        QPercaProducao.Cancel;
      end
      else
        QPercaProducaoVAL_CUSTO.Value := wCusto * QPercaProducaoQT_PERCA_PRODUCAO.Value;
    end;
  end
end;

procedure TDMBoletim.QPercaProducaoBeforeInsert(DataSet: TDataSet);
begin
  QPercaProducaoCOD_BOLETIM.Value := QBoletimProducaoCOD_BOLETIM.Value;
  QPercaProducaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.


