unit UNotaEntrada_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, OracleData, OraTeste, Variants, DBClient,
  Provider, UBiblioteca, UBibliotecaDB;

type
  TDMNotaEntrada = class(TDataModule)
    DSNotaEntrada: TDataSource;
    DSItemNF: TDataSource;
    DSNotaEntradaCons: TDataSource;
    DSAtuBaixaOC: TDataSource;
    DSBaixasOC: TDataSource;
    DSNFAuxAberto: TDataSource;
    DSBaixaAux: TDataSource;
    DSContaPagar: TDataSource;
    DSSaldoFixado: TDataSource;
    DSNotaFixar: TDataSource;
    QContrato_VendMovDeleta_NFItem: TOracleDataSet1;
    QImposto: TOracleDataSet1;
    QImpostoPERC_ALIQUOTA: TFloatField;
    QImpostoNUM_CLASSIFICACAO: TStringField;
    QImpostoSVAL_ICM_BASE: TFloatField;
    QImpostoSVAL_ICM: TFloatField;
    QImpostoSVAL_IPI: TFloatField;
    QImpostoSVAL_BASE_ISENTA: TFloatField;
    QAtzItemOC: TOracleDataSet1;
    QAtzNota: TOracleDataSet1;
    QAtzNotaIND_SITUACAO: TStringField;
    QAtzNotaCOD_MOTIVO_CANC: TIntegerField;
    QNFAuxAberto: TOracleDataSet1;
    QNFAuxAbertoCOD_NOTA_AUX: TIntegerField;
    QNFAuxAbertoQT_SALDO: TFloatField;
    QNFAuxAbertoCOD_NOTA_CAB: TIntegerField;
    QNFAuxAbertoNUM_NOTA: TIntegerField;
    QNFAuxAbertoDT_EMISSAO: TDateTimeField;
    QNFAuxAbertoCOD_SERIE: TStringField;
    QNFAuxAbertoCOD_FILIAL: TIntegerField;
    QNFAuxAbertoCOD_CADASTRO: TIntegerField;
    QNFAuxAbertoCOD_PRODUTO: TFloatField;
    QNFAuxAbertoCOD_LOTE_TIPO: TIntegerField;
    QVoltaSaldoFixado: TOracleDataSet1;
    QConhecimentoCons: TOracleDataSet1;
    QConhecimentoConsCOD_NOTA_CAB: TIntegerField;
    QConhecimentoConsNOME: TStringField;
    QConhecimentoConsDT_RECEBIMENTO: TDateTimeField;
    QConhecimentoConsNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaEntrada: TOracleDataSet1;
    QNotaEntradaCOD_NOTA_CAB: TIntegerField;
    QNotaEntradaCOD_USUARIO: TIntegerField;
    QNotaEntradaCOD_FILIAL: TIntegerField;
    QNotaEntradaCOD_MENSAGEM: TIntegerField;
    QNotaEntradaCOD_TRANSPORTE: TIntegerField;
    QNotaEntradaCOD_OPERACAO: TIntegerField;
    QNotaEntradaCOD_ESTADO: TStringField;
    QNotaEntradaCOD_VENDEDOR: TIntegerField;
    QNotaEntradaCOD_CADASTRO: TIntegerField;
    QNotaEntradaNUM_NOTA: TIntegerField;
    QNotaEntradaCOD_SERIE: TStringField;
    QNotaEntradaIND_SITUACAO: TStringField;
    QNotaEntradaIND_CONDICAO_PAGTO: TStringField;
    QNotaEntradaDT_EMISSAO: TDateTimeField;
    QNotaEntradaDT_MOVIMENTO: TDateTimeField;
    QNotaEntradaDT_RECEBIMENTO: TDateTimeField;
    QNotaEntradaCOD_MOTIVO_CANC: TIntegerField;
    QNotaEntradaVAL_DESPESAS: TFloatField;
    QNotaEntradaIND_ENTRADA_SAIDA: TStringField;
    QNotaEntradaVAL_FRETE: TFloatField;
    QNotaEntradaVAL_DESCONTO: TFloatField;
    QNotaEntradaCOD_TRANSPORTADOR: TIntegerField;
    QNotaEntradaNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaEntradaVAL_AVISTA: TFloatField;
    QNotaEntradaIND_TIPO_FRETE: TStringField;
    QNotaEntradaNUM_VOLUMES: TIntegerField;
    QNotaEntradaOBS: TStringField;
    QNotaEntradaOBS_COMPLEMENTO: TStringField;
    QNotaEntradaDT_USUARIO: TDateTimeField;
    QNotaEntradaCOD_TRIBUTACAO_FRETE: TIntegerField;
    QNotaEntradaVAL_TOTAL_IPI: TFloatField;
    QNotaEntradaVAL_ICM_FRETE: TFloatField;
    QNotaEntradaVAL_ICM_BASE_FRETE: TFloatField;
    QNotaEntradaVAL_FUNRURAL: TFloatField;
    QNotaEntradaDESC_PLACA: TStringField;
    QNotaEntradaDESC_TRANSPORTADORA: TStringField;
    QNotaEntradaCOD_NOTA_CONTA_CORRENTE: TIntegerField;
    QNotaEntradaDT_EMISSAO_CF: TDateTimeField;
    QNotaEntradaCOD_OPERACAO_CF: TIntegerField;
    QNotaEntradaNR_DIAS_CHEQUE: TIntegerField;
    QNotaEntradaCOD_CONTRATO_MOV: TIntegerField;
    QNotaEntradaCOD_CONTRATO_GP_MOV: TIntegerField;
    QNotaEntradaNR_DIAS_CHEQUE1: TIntegerField;
    QNotaEntradaNR_DIAS_CHEQUE2: TIntegerField;
    QNotaEntradaIND_NOTA_SEGURO: TStringField;
    QNotaEntradaCOD_CONTRATO_VEND: TIntegerField;
    QNotaEntradaNR_ROTA: TIntegerField;
    QNotaEntradaPERC_COMISSAO: TFloatField;
    QNotaEntradaIND_MILHAGEM: TStringField;
    QNotaEntradanome_usuario: TStringField;
    QItemNF: TOracleDataSet1;
    QItemNFCOD_NOTA_ITEM: TIntegerField;
    QItemNFCOD_NOTA_CAB: TIntegerField;
    QItemNFCOD_TRIBUTACAO: TIntegerField;
    QItemNFVAL_TOTAL: TFloatField;
    QItemNFPERC_IPI: TFloatField;
    QItemNFPERC_COMISSAO: TFloatField;
    QItemNFCOD_PRODUTO: TFloatField;
    QItemNFCOD_LOTE_TIPO: TIntegerField;
    QItemNFVAL_DESCONTO: TFloatField;
    QItemNFVAL_FRETE: TFloatField;
    QItemNFPERC_DESCONTO: TFloatField;
    QItemNFVAL_IPI: TFloatField;
    QItemNFVAL_ICM_BASE: TFloatField;
    QItemNFVAL_ICM: TFloatField;
    QItemNFIND_CLASS_IPI: TStringField;
    QItemNFVAL_CUSTO: TFloatField;
    QItemNFVAL_ISS: TFloatField;
    QItemNFPERC_INSS: TFloatField;
    QItemNFPERC_BENEFICIADO: TFloatField;
    QItemNFIND_BX_CONTR_VEND: TStringField;
    QItemNFNUM_NOTA_PRODUTOR: TIntegerField;
    QNotaEntradaCons: TOracleDataSet1;
    QNotaEntradaConsCOD_NOTA_CAB: TIntegerField;
    QNotaEntradaConsNOME: TStringField;
    QNotaEntradaConsDT_RECEBIMENTO: TDateTimeField;
    QNotaEntradaConsNUM_NOTA: TIntegerField;
    QNotaEntradaConsCOD_SERIE: TStringField;
    QNotaFixar: TOracleDataSet1;
    QNotaFixarSQTDE_FIXAR: TFloatField;
    QNotaFixarSQTDE_FIXADO: TFloatField;
    QNotaFixarSVAL_TOTAL: TFloatField;
    QSaldoFixado: TOracleDataSet1;
    QContrato_VendMovDeleta_NFItemCOD_CONTRATO_VEND_MOV: TIntegerField;
    QContrato_VendMovDeleta_NFItemCOD_CONTRATO_VEND: TIntegerField;
    QContrato_VendMovDeleta_NFItemDATA: TDateTimeField;
    QContrato_VendMovDeleta_NFItemQT_QUANTIDADE: TFloatField;
    QContrato_VendMovDeleta_NFItemVAL_MOVIMENTO: TFloatField;
    QContrato_VendMovDeleta_NFItemDESC_OBSERVACAO: TStringField;
    QContrato_VendMovDeleta_NFItemCOD_CONTRATO_GP_MOV: TIntegerField;
    QContrato_VendMovDeleta_NFItemCOD_CONTRATO_MOV: TIntegerField;
    QContratoMovVend_Mov_NFItem: TOracleDataSet1;
    QContratoMovVend_Mov_NFItemTOTAL_QUANTIDADE: TFloatField;
    QContaPagar: TOracleDataSet1;
    QContaPagarMov: TOracleDataSet1;
    QContaPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarCOD_FINALIDADE: TIntegerField;
    QContaPagarCOD_BANCO_AGENCIA: TIntegerField;
    QContaPagarCOD_CADASTRO: TIntegerField;
    QContaPagarCOD_FILIAL: TIntegerField;
    QContaPagarNUM_PARCELA: TIntegerField;
    QContaPagarDESC_TIPO_DOCUMENTO: TStringField;
    QContaPagarDT_MOVIMENTO: TDateTimeField;
    QContaPagarDT_BAIXA: TDateTimeField;
    QContaPagarDT_VENCIMENTO: TDateTimeField;
    QContaPagarDT_EMISSAO: TDateTimeField;
    QContaPagarDT_CAPITALIZACAO: TDateTimeField;
    QContaPagarVAL_TITULO: TFloatField;
    QContaPagarCOD_NOTA_CAB: TIntegerField;
    QContaPagarIND_ACEITE: TStringField;
    QContaPagarIND_SITUACAO: TStringField;
    QContaPagarVAL_ORIGINAL: TFloatField;
    QContaPagarVAL_INDEXADO: TFloatField;
    QContaPagarCOD_DEPARTAMENTO: TIntegerField;
    QContaPagarCOD_CONTRATO: TIntegerField;
    QContaPagarCOD_CONTRATO_GP: TIntegerField;
    QContaPagarCOD_CONTRATO_VEND: TIntegerField;
    QContaPagarCOD_CONTRATO_ARROZ: TIntegerField;
    QContaPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContaPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarMovDT_MOVIMENTO: TDateTimeField;
    QContaPagarMovVAL_MOVIMENTO: TFloatField;
    QContaPagarMovDESC_OBSERVACAO: TStringField;
    QContaPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QContaPagarMovDT_USUARIO: TDateTimeField;
    QContaPagarMovCOD_USUARIO: TIntegerField;
    QBaixasOC: TOracleDataSet1;
    QAtuBaixaOC: TOracleDataSet1;
    QBaixaAux: TOracleDataSet1;
    QNotaAux: TOracleDataSet1;
    QNotaAuxItNF: TOracleDataSet1;
    QSomaItemNota: TOracleDataSet1;
    QSomaItemNotaSVAL_TOTAL: TFloatField;
    QSomaItemNotaSVAL_DESCONTO: TFloatField;
    QSomaItemNotaSVAL_FRETE: TFloatField;
    QSomaItemNotaSVAL_IPI: TFloatField;
    QSomaItemNotaSVAL_ICM_BASE: TFloatField;
    QSomaItemNotaSVAL_ICM_BASE_ISENTO: TFloatField;
    QSomaItemNotaSVAL_ICM: TFloatField;
    QSomaItemNotasval_total_nota: TFloatField;
    QNotaAuxItNFCOD_NOTA_AUX: TIntegerField;
    QNotaAuxItNFCOD_NOTA_ITEM: TIntegerField;
    QNotaAuxItNFCOD_PRODUTO: TFloatField;
    QNotaAuxItNFDT_ATENDIDO: TDateTimeField;
    QNotaAuxItNFQT_ATENDIDO: TFloatField;
    QNotaAuxItNFQT_CANCELADO: TFloatField;
    QNotaAuxItNFQT_DEVOLVIDO: TFloatField;
    QNotaAuxItNFQT_NOTA_ITEM: TFloatField;
    QNotaAuxItNFIND_TIPO: TStringField;
    QNotaAuxCOD_NOTA_AUX: TIntegerField;
    QNotaAuxCOD_NOTA_ITEM: TIntegerField;
    QNotaAuxCOD_PRODUTO: TFloatField;
    QNotaAuxDT_ATENDIDO: TDateTimeField;
    QNotaAuxQT_ATENDIDO: TFloatField;
    QNotaAuxQT_CANCELADO: TFloatField;
    QNotaAuxQT_DEVOLVIDO: TFloatField;
    QNotaAuxQT_NOTA_ITEM: TFloatField;
    QNotaAuxIND_TIPO: TStringField;
    QBaixaAuxCOD_NOTA_ITEM: TIntegerField;
    QBaixaAuxCOD_NOTA_AUX: TIntegerField;
    QBaixaAuxQT_QUANTIDADE: TFloatField;
    QAtuBaixaOCCOD_ORDEM_COMPRA_ITEM: TIntegerField;
    QAtuBaixaOCCOD_NOTA_ITEM: TIntegerField;
    QAtuBaixaOCQT_BAIXA: TFloatField;
    QSaldoFixadoQT_FIXADO: TFloatField;
    QBaixasOCNUM_ORDEM_COMPRA: TIntegerField;
    QBaixasOCDT_EMISSAO: TDateTimeField;
    QBaixasOCCOD_ORDEM_COMPRA_ITEM: TIntegerField;
    QBaixasOCQT_PEDIDO: TFloatField;
    QBaixasOCQT_ATENDIDO: TFloatField;
    QBaixasOCVAL_UNITARIO: TFloatField;
    QBaixasOCQT_BAIXA: TFloatField;
    QRFunRural: TOracleDataSet1;
    QRRelatorioFixacao: TOracleDataSet1;
    QRRelatorioFixacaoNUM_NOTA: TIntegerField;
    QRRelatorioFixacaoCOD_SERIE: TStringField;
    QRRelatorioFixacaoDT_EMISSAO: TDateTimeField;
    QRRelatorioFixacaoCOD_PRODUTO: TFloatField;
    QRRelatorioFixacaoQT_QUANTIDADE: TFloatField;
    QRRelatorioFixacaoVAL_TOTAL: TFloatField;
    QRRelatorioFixacaoNOME: TStringField;
    QRFechamentoCereais: TOracleDataSet1;
    QRFechamentoCereaisNOME: TStringField;
    QRFechamentoCereaisCOD_CADASTRO: TIntegerField;
    QRFechamentoCereaisCOD_PRODUTO: TFloatField;
    QRFechamentoCereaisNUM_EMBALAGEM: TFloatField;
    QRFechamentoCereaisDT_EMISSAO: TDateTimeField;
    QRFechamentoCereaisVAL_FUNRURAL: TFloatField;
    QRFechamentoCereaisNUM_NOTA: TIntegerField;
    QRFechamentoCereaisQT_QUANTIDADE: TFloatField;
    QRFechamentoCereaisVAL_TOTAL: TFloatField;
    QRResumoFechaCereais: TOracleDataSet1;
    QRResumoFechaCereaisCOD_PRODUTO: TFloatField;
    QRResumoFechaCereaisDT_EMISSAO: TDateTimeField;
    QRResumoFechaCereaisNUM_EMBALAGEM: TFloatField;
    QRResumoFechaCereaisTOTAL_FUNRURAL: TFloatField;
    QRResumoFechaCereaisQT_TOTAL: TFloatField;
    QRResumoFechaCereaisVALOR_TOTAL: TFloatField;
    QCaixa: TOracleDataSet1;
    QCaixaCOD_CAIXA_MOV: TIntegerField;
    QCaixaCOD_USUARIO: TIntegerField;
    QCaixaCOD_FILIAL: TIntegerField;
    QCaixaCOD_DEPARTAMENTO: TIntegerField;
    QCaixaCOD_HISTORICO: TIntegerField;
    QCaixaDT_MOVIMENTO: TDateTimeField;
    QCaixaVAL_MOVIMENTO: TFloatField;
    QCaixaDESC_HORARIO: TStringField;
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaCOD_NOTA_CAB: TIntegerField;
    QCaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QRFechamentoCereaisCOD_OPERACAO: TIntegerField;
    QRResumoFechaCereaisCOD_OPERACAO: TIntegerField;
    QRResumoFechaCereaisDESC_OPERACAO: TStringField;
    QNotaEntradaConsCOD_FILIAL: TIntegerField;
    QAtzNotaVAL_DESCONTO: TFloatField;
    QNotaEntradaCOD_DEPARTAMENTO: TIntegerField;
    QItemNFnum_fabricante: TStringField;
    QContaPagarCOD_CONHECIMENTO_FRETE: TIntegerField;
    QContaPagarDESC_OBSERVACAO: TStringField;
    QSaldoFixadoCOD_NF_ITEM_FIXAR: TIntegerField;
    QSaldoFixadoCOD_NF_ITEM_FIXADO: TIntegerField;
    QItemNFIND_TIPO_CONSUMO: TStringField;
    QRFechamentoCereaisdt_vencimento: TDateField;
    QRFechamentoCereaisCOD_NOTA_CAB: TIntegerField;
    QNotaEntradaConsCOD_TRANSPORTADOR: TIntegerField;
    QNotaEntradaDESC_OBS_CORPO_NOTA: TStringField;
    QNotaEntradaConsCOD_CADASTRO: TIntegerField;
    QSomaItemNotaSQT_QUANTIDADE: TFloatField;
    QNotaEntradaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QNotaEntradaCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNFAuxAbertoVAL_TOTAL: TFloatField;
    QNotaEntradaConsIND_SITUACAO: TStringField;
    QItemNFQT_CHEGADA: TFloatField;
    QNotaEntradaVAL_PEDAGIO: TFloatField;
    QNotaEntradaVAL_FRETE_TON: TFloatField;
    QNotaEntradaCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNotaEntradaConsCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QBaixasOCDESC_PENEIRA_TIPO: TStringField;
    QRFechamentoCereais1: TOracleDataSet1;
    QRFechamentoCereais1NOME: TStringField;
    QRFechamentoCereais1COD_CADASTRO: TIntegerField;
    QRFechamentoCereais1NUM_CGC_CPF: TStringField;
    QRFechamentoCereais1COD_ESTADO: TStringField;
    QRFechamentoCereais1COD_PRODUTO: TFloatField;
    QRFechamentoCereais1NUM_EMBALAGEM: TFloatField;
    QRFechamentoCereais1DT_EMISSAO: TDateTimeField;
    QRFechamentoCereais1NUM_NOTA: TIntegerField;
    QRFechamentoCereais1COD_NOTA_CAB: TIntegerField;
    QRFechamentoCereais1QT_QUANTIDADE: TFloatField;
    QRFechamentoCereais1VAL_TOTAL: TFloatField;
    QNotaEntradaConsDT_EMISSAO: TDateTimeField;
    QSomaItemNotaSVAL_PIS: TFloatField;
    QSomaItemNotaSVAL_COFINS: TFloatField;
    QNotaEntradaDESC_OBS_DEVOLUCAO: TStringField;
    QRRelatorioFixacaoDESC_PRODUTO: TStringField;
    QRFechamentoCereaisDESC_PRODUTO: TStringField;
    QRFechamentoCereais1DESC_PRODUTO: TStringField;
    QRResumoFechaCereaisDESC_PRODUTO: TStringField;
    QNotaEntradaCOD_MOTORISTA: TIntegerField;
    QNotaEntradaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QNotaEntradaCOD_CADASTRO_CLASSIFICACAO: TIntegerField;
    QNotaEntradaIND_IMPRIME_FRETE: TStringField;
    QNotaEntradaNUM_OS: TIntegerField;
    QNotaEntradaCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QNotaEntradaNR_DIAS_CHEQUE3: TIntegerField;
    QNotaEntradaNUM_PEDIDO: TIntegerField;
    QNotaEntradaNR_DIAS_CHEQUE4: TIntegerField;
    QNotaEntradaCOD_PRAZO_VENCIMENTO: TIntegerField;
    QNotaEntradaNUM_DIAS_CARENCIA: TIntegerField;
    QNotaEntradaCOD_CULTURA: TIntegerField;
    QItemNFCOD_CULTURA: TIntegerField;
    QNotaImpostoServico: TOracleDataSet1;
    QNotaImpostoServicoCOD_NOTA_IMPOSTO_SERVICO: TIntegerField;
    QNotaImpostoServicoCOD_NOTA_CAB: TIntegerField;
    QNotaImpostoServicoCOD_IMPOSTO: TIntegerField;
    QNotaImpostoServicoDT_VENCIMENTO: TDateTimeField;
    QNotaImpostoServicodesc_imposto: TStringField;
    QItemNFVAL_DPI_TRANSGENICOS: TFloatField;
    QSomaItemNotaSVAL_DPI_TRANSGENICOS: TFloatField;
    QItemNFQT_CREDITO_TRANSGENICOS: TFloatField;
    QRFechamentoCereaisVAL_DPI_TRANSGENICOS: TFloatField;
    QRResumoFechaCereaisTOTAL_DPI: TFloatField;
    QNotaEntradaIND_IMPRIME_CAB: TStringField;
    QNotaEntradaVAL_IMPOSTO: TFloatField;
    QNotaEntradaNUM_DESPACHO_EXPORTACAO: TFloatField;
    QNotaEntradaDESC_MEMORANDO_EXPORTACAO: TStringField;
    QNotaEntradaVAL_DESCONTO_FITAS: TFloatField;
    QNotaFixarCOD_NOTA_ITEM: TFloatField;
    QNotaEntradaNUM_DCO: TStringField;
    QItemNFVAL_FACS: TFloatField;
    QItemNFVAL_FETHAB: TFloatField;
    QSomaItemNotaSVAL_FACS: TFloatField;
    QSomaItemNotaSVAL_FETHAB: TFloatField;
    QSomaItemNotaIND_FUNRURAL: TStringField;
    QContaPagarPERC_DESC_ANTECIPACAO: TFloatField;
    QContaPagarPERC_DESC_PONTUALIDADE: TFloatField;
    QItemNFIND_CUSTO: TIntegerField;
    QRNotaServico: TOracleDataSet1;
    QROrdemPagamento: TOracleDataSet1;
    QROrdemPagamentoItem: TOracleDataSet1;
    QROrdemPagamentoNUM_NOTA: TIntegerField;
    QROrdemPagamentoDT_EMISSAO: TDateTimeField;
    QROrdemPagamentoDESC_FILIAL: TStringField;
    QROrdemPagamentoCIDADE_FILIAL: TStringField;
    QROrdemPagamentoESTADO_FILIAL: TStringField;
    QROrdemPagamentoENDERECO_FILIAL: TStringField;
    QROrdemPagamentoCEP_FILIAL: TStringField;
    QROrdemPagamentoCGC_FILIAL: TStringField;
    QROrdemPagamentoINSCRICAO_FILIAL: TStringField;
    QROrdemPagamentoTELEFONE_FILIAL: TStringField;
    QROrdemPagamentoDESC_OPERACAO: TStringField;
    QROrdemPagamentoCOD_CADASTRO: TIntegerField;
    QROrdemPagamentoNOME_CADASTRO: TStringField;
    QROrdemPagamentoENDERECO_CADASTRO: TStringField;
    QROrdemPagamentoCIDADE_CADASTRO: TStringField;
    QROrdemPagamentoTELEFONE_CADASTRO: TStringField;
    QROrdemPagamentoESTADO_CADASTRO: TStringField;
    QROrdemPagamentoItemQUANTIDADE_ITEM: TFloatField;
    QROrdemPagamentoItemVAL_UNITARIO_ITEM: TFloatField;
    QROrdemPagamentoItemTOTAL_ITEM: TFloatField;
    QROrdemPagamentoItemDESC_PRODUTO: TStringField;
    QROrdemPagamentoItemNUM_EMBALAGEM: TFloatField;
    QROrdemPagamentoItemDESC_UNIDADE: TStringField;
    QROrdemPagamentoCOD_NOTA_CAB: TIntegerField;
    QROrdemPagamentoDT_RECEBIMENTO: TDateTimeField;
    QROrdemPagamentoDT_VENCIMENTO: TDateTimeField;
    QROrdemPagamentoDESC_BANCO_AGENCIA: TStringField;
    QROrdemPagamentoDESC_COMPLEMENTO: TStringField;
    QROrdemPagamentoDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QROrdemPagamentoNUM_ORDEM_COMPRA: TIntegerField;
    QROrdemPagamentoDESC_CONTA_CORRENTE: TStringField;
    QROrdemPagamentoDESC_AGENCIA: TStringField;
    QItemNFPERC_DESC: TFloatField;
    QItemNFVAL_BASE_SUBST: TFloatField;
    QItemNFVAL_ICMS_SUBST: TFloatField;
    QItemNFVAL_UNITARIO_TABELA: TFloatField;
    QItemNFCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QItemNFDESC_RENDA: TStringField;
    QItemNfCons: TOracleDataSet1;
    QItemNfConsCOD_NOTA_ITEM: TIntegerField;
    QItemNfConsCOD_NOTA_CAB: TIntegerField;
    QItemNfConsCOD_TRIBUTACAO: TIntegerField;
    QItemNfConsQT_QUANTIDADE: TFloatField;
    QItemNfConsVAL_TOTAL: TFloatField;
    QItemNfConsPERC_IPI: TFloatField;
    QItemNfConsPERC_COMISSAO: TFloatField;
    QItemNfConsCOD_PRODUTO: TFloatField;
    QItemNfConsCOD_LOTE_TIPO: TIntegerField;
    QItemNfConsVAL_DESCONTO: TFloatField;
    QItemNfConsVAL_DESPESAS: TFloatField;
    QItemNfConsVAL_FRETE: TFloatField;
    QItemNfConsPERC_DESCONTO: TFloatField;
    QItemNfConsVAL_IPI: TFloatField;
    QItemNfConsVAL_UNITARIO: TFloatField;
    QItemNfConsVAL_ICM_BASE: TFloatField;
    QItemNfConsVAL_ICM: TFloatField;
    QItemNfConsIND_CLASS_IPI: TStringField;
    QItemNfConsVAL_CUSTO: TFloatField;
    QItemNfConsVAL_ISS: TFloatField;
    QItemNfConsPERC_INSS: TFloatField;
    QItemNfConsPERC_BENEFICIADO: TFloatField;
    QItemNfConsIND_BX_CONTR_VEND: TStringField;
    QItemNfConsNUM_NOTA_PRODUTOR: TIntegerField;
    QItemNfConsCOD_CULTURA: TIntegerField;
    QItemNfConsDESC_PRODUTO: TStringField;
    QNotaEntradaCOD_NOTA_CAB_TRANS_ENT: TIntegerField;
    QItemNFNUM_VOLUMES: TIntegerField;
    QItemNFNUM_CABECAS: TIntegerField;
    QItemNFCOD_CFOP: TIntegerField;
    QContaPagarDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QContaPagarCOD_RPA: TIntegerField;
    QContaPagarCOD_OBRA_REQ_CAB: TIntegerField;
    QContaPagarCOD_ESTADIA: TIntegerField;
    QContaPagarDT_ACEITE: TDateTimeField;
    QContaPagarCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContaPagarCOD_CONTA_CORRENTE: TIntegerField;
    QContaPagarCOD_USUARIO_ACEITE: TIntegerField;
    QContaPagarCOD_BANCO_PGTO: TIntegerField;
    QContaPagarCOD_AGENCIA: TStringField;
    QContaPagarCOD_CONTA_CORRENTE_PGTO: TStringField;
    QContaPagarDESC_CNPJ_CPF_PGTO: TStringField;
    QContaPagarDESC_NOME_TITULAR_CONTA: TStringField;
    QNotaEntradaConsIND_ENTRADA_SAIDA: TStringField;
    QNotaEntradaConsCOD_ESTADO: TStringField;
    QNotaEntradaConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaEntradaConsDESC_PLACA: TStringField;
    QContaPagarIND_FORMA_PAGAMENTO: TStringField;
    QContaPagarDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QRFunRuralCOD_CADASTRO: TIntegerField;
    QRFunRuralNUM_NOTA: TIntegerField;
    QRFunRuralCOD_SERIE: TStringField;
    QRFunRuralDT_EMISSAO: TDateTimeField;
    QRFunRuralCOD_FILIAL: TIntegerField;
    QRFunRuralIND_ENTRADA_SAIDA: TStringField;
    QRFunRuralVAL_FUNRURAL: TFloatField;
    QRFunRuralNOME: TStringField;
    QRFunRuralDESC_FILIAL: TStringField;
    QNotaEntradaIND_BAIXA_CONTRATO_CF: TStringField;
    QItemNFqt_beneficiado: TFloatField;
    QSomaItemNotaSVAL_ICMS_SUBST: TFloatField;
    QRRelatorioFixacaoCOD_CADASTRO: TIntegerField;
    QNotaEntradaVAL_SUBST_TRIBUT: TFloatField;
    QItemNFCOD_NOTA_ITEM_ORIGEM: TIntegerField;
    QNotaEntradaDESC_CHAVE_ACESSO: TStringField;
    QNotaEntradaIND_TIPO_NOTA: TStringField;
    QRFunRuralCOD_PRODUTO: TFloatField;
    QRFunRuralDESC_PRODUTO: TStringField;
    QRFunRuralVAL_TOTAL: TFloatField;
    QRNotaServicoImposto: TOracleDataSet1;
    QRNotaServicoNUM_NOTA: TIntegerField;
    QRNotaServicoDT_EMISSAO: TDateTimeField;
    QRNotaServicoDT_RECEBIMENTO: TDateTimeField;
    QRNotaServicoCOD_CADASTRO: TIntegerField;
    QRNotaServicoCOD_NOTA_CAB: TIntegerField;
    QRNotaServicoNOME: TStringField;
    QRNotaServicoNUM_CGC_CPF: TStringField;
    QRNotaServicoImpostoDESC_IMPOSTO: TStringField;
    QRNotaServicoImpostoTOTAL_IMPOSTO: TFloatField;
    QRNotaServicosval_total: TFloatField;
    QRNotaServicoDESC_IMPOSTO: TStringField;
    QRNotaServicoVAL_IMPOSTO: TFloatField;
    QRRelatorioFixacaoVAL_DPI_TRANSGENICOS: TFloatField;
    QSomaItemNotasval_total_nfe: TFloatField;
    QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR: TIntegerField;
    QSomaItemNotaCOD_NOTA_CAB: TIntegerField;
    QSomaItemNotaSVAL_BASE_SUBST: TFloatField;
    QNotaEntradaCOD_ARMAZEM_ALFANDEGADO: TIntegerField;
    QItemNFDESC_COMPLEMENTO: TStringField;
    QNotaEntradaCOD_NOTA_CAB_REF: TIntegerField;
    QNotaEntradaind_complemento: TBooleanField;
    QNotaEntradaBIN_XML_NFE: TMemoField;
    QNotaEntradaVAL_SENAR: TFloatField;
    QNotaEntradaDESC_MARCA: TStringField;
    QNotaEntradaDESC_ESPECIE: TStringField;
    QItemNFDESC_INF_ADICIONAL: TStringField;
    QNotaEntradadesc_situacao: TStringField;
    QNotaEntradadesc_situacao_sefaz: TStringField;
    QFichaCredito: TOracleDataSet1;
    QFichaCreditoCOD_NOTA_CAB: TIntegerField;
    QFichaCreditoCOD_NOTA_ITEM: TIntegerField;
    QFichaCreditoCOD_FILIAL: TIntegerField;
    QFichaCreditoNUM_CGC_FILIAL: TStringField;
    QFichaCreditoDESC_TIPO: TStringField;
    QFichaCreditoNUM_NOTA: TIntegerField;
    QFichaCreditoCOD_SERIE: TStringField;
    QFichaCreditoDT_EMISSAO: TDateTimeField;
    QFichaCreditoDT_RECEBIMENTO: TDateTimeField;
    QFichaCreditoNUM_ANO_EMISSAO: TFloatField;
    QFichaCreditoNUM_CGC_CPF_CADASTRO: TStringField;
    QFichaCreditoIND_FISICA_JURIDICA_CADASTRO: TStringField;
    QFichaCreditoNOME_CADASTRO: TStringField;
    QFichaCreditoDESC_PAIS_CADASTRO: TStringField;
    QFichaCreditoNUM_CFOP: TFloatField;
    QFichaCreditoNUM_GENERO_NCM: TStringField;
    QFichaCreditoDESC_PRODUTO: TStringField;
    QFichaCreditoVAL_CONTABIL: TFloatField;
    QFichaCreditoVAL_IPI: TFloatField;
    QNotaEntradaCOD_OBRA_REQ_CAB: TIntegerField;
    QNotaEntradaCOD_OBRA: TIntegerField;
    QNotaEntradadesc_modelo_serie: TStringField;
    QNotaEntradadesc_servidor_nfe: TStringField;
    QNotaEntradacod_uf_ibge_filial: TIntegerField;
    QNotaEntradaIND_CONTINGENCIA: TStringField;
    QNotaEntradaIND_AMBIENTE_NFE: TIntegerField;
    QCstIpiCons: TOracleDataSet1;
    QItemNFCOD_CST_IPI: TStringField;
    QCstIpiConsCOD_CST_IPI: TStringField;
    QCstIpiConsDESC_CST_IPI: TStringField;
    QCstIpiConsDESC_COMPLETA: TStringField;
    QNotaEntradaCOD_SERIE_CF: TStringField;
    QREtiquetaNota: TOracleDataSet1;
    QREtiquetaNotaCOD_PRODUTO: TFloatField;
    QREtiquetaNotaCOD_LOTE_TIPO: TIntegerField;
    QREtiquetaNotaDESC_PRODUTO: TStringField;
    QREtiquetaNotaDESC_LOTE: TStringField;
    QREtiquetaNotaDT_EMISSAO: TDateTimeField;
    QNotaEntradaIND_ST: TStringField;
    QNfeimportAdiCons: TOracleDataSet1;
    cdsNfeImportAdi: TClientDataSet;
    cdsNfeImportAdiNUM_ADICAO: TIntegerField;
    cdsNfeImportAdiNUM_SEQ_ADIC: TIntegerField;
    cdsNfeImportAdiCOD_FABRICANTE: TStringField;
    cdsNfeImportAdiVAL_DESCONTO: TFloatField;
    cdsNfeImportAdiCOD_NFE_IMPORT_ADI: TIntegerField;
    QNfeimportAdiConsCOD_NFE_IMPORT_ADI: TIntegerField;
    QNfeimportAdiConsCOD_NOTA_ITEM: TIntegerField;
    QNfeimportAdiConsNUM_ADICAO: TIntegerField;
    QNfeimportAdiConsNUM_SEQ_ADIC: TIntegerField;
    QNfeimportAdiConsCOD_FABRICANTE: TStringField;
    QNfeimportAdiConsVAL_DESCONTO: TFloatField;
    QItemNFDT_DI: TDateTimeField;
    QItemNFDESC_LOCAL_DESEMB_DI: TStringField;
    QItemNFCOD_UF_DESEMB_DI: TStringField;
    QItemNFDT_DESEMB_DI: TDateTimeField;
    QItemNFCOD_EXPORTADOR: TStringField;
    QNfeImportAdi: TOracleDataSet1;
    QNfeImportAdiCOD_NFE_IMPORT_ADI: TIntegerField;
    QNfeImportAdiCOD_NOTA_ITEM: TIntegerField;
    QNfeImportAdiNUM_ADICAO: TIntegerField;
    QNfeImportAdiNUM_SEQ_ADIC: TIntegerField;
    QNfeImportAdiCOD_FABRICANTE: TStringField;
    QNfeImportAdiVAL_DESCONTO: TFloatField;
    DSNfeImportAdi: TDataSource;
    QItemNFVAL_BC_II: TFloatField;
    QItemNFVAL_DESPADU_II: TFloatField;
    QItemNFVAL_II: TFloatField;
    QItemNFVAL_IOF_II: TFloatField;
    CdsNotaRateioObra1: TClientDataSet;
    CdsNotaRateioObra1cod_obra: TIntegerField;
    CdsNotaRateioObra1cod_produto: TIntegerField;
    CdsNotaRateioObra1qt_quantidade: TFloatField;
    CdsNotaRateioObra1vl_unitario: TFloatField;
    QNotaEntrada_Exp: TOracleDataSet;
    QNotaEntrada_ExpDT_RECEBIMENTO: TDateTimeField;
    QNotaEntrada_ExpCOD_NOTA_CAB: TIntegerField;
    QNotaEntrada_ExpDT_EMISSAO: TDateTimeField;
    QNotaEntrada_ExpCOD_SERIE: TStringField;
    QNotaEntrada_ExpCFOP: TFloatField;
    QNotaEntrada_ExpNUM_CGC_CPF: TStringField;
    QNotaEntrada_ExpVAL_TOTAL: TFloatField;
    QNotaEntrada_ExpIND_CONDICAO_PAGTO: TStringField;
    QNotaEntrada_ExpDT_MOVIMENTO: TDateTimeField;
    QNotaEntrada_ExpNOME: TStringField;
    QNotaEntrada_ExpDESC_FANTASIA: TStringField;
    QNotaEntrada_ExpCOD_ESTADO: TStringField;
    QNotaEntrada_ExpNUM_INSCRICAO: TStringField;
    QNotaEntrada_ExpDESC_ENDERECO: TStringField;
    QNotaEntrada_ExpDESC_BAIRRO: TStringField;
    QNotaEntrada_ExpDESC_CIDADE: TStringField;
    QNotaEntrada_ExpDESC_CEP: TStringField;
    QNotaEntrada_ExpCOD_CIDADE: TIntegerField;
    QNotaEntrada_ExpDESC_TELEFONE: TStringField;
    QNotaEntrada_ExpPERC_FUNRURAL: TFloatField;
    QNotaEntrada_ExpDESC_SUFRAMA: TStringField;
    QNotaEntrada_ExpIND_FISICA_JURIDICA: TStringField;
    QNotaEntrada_ExpCOD_CIDADE_IBGE: TStringField;
    QNotaEntrada_ExpCOD_UF_IBGE: TIntegerField;
    QNotaEntrada_ExpCOD_PAIS_IBGE: TIntegerField;
    QNotaEntrada_ExpNUM_CGC_CPF_1: TStringField;
    QNotaEntrada_ExpVAL_ICM_BASE: TFloatField;
    QNotaEntrada_ExpPERC_ALIQUOTA: TFloatField;
    QNotaEntrada_ExpVAL_ICM: TFloatField;
    QNotaEntrada_ExpVAL_CONFINS: TFloatField;
    QNotaEntrada_ExpVAL_PIS: TFloatField;
    QNotaEntrada_ExpDESC_RESUMO: TStringField;
    QNotaEntrada_ExpCOD_PRODUTO: TFloatField;
    QNotaEntrada_ExpQT_QUANTIDADE: TFloatField;
    QNotaEntrada_ExpVAL_DESCONTO: TFloatField;
    QNotaEntrada_ExpVAL_IPI: TFloatField;
    QNotaEntrada_ExpNUM_FABRICANTE: TStringField;
    QNotaEntrada_ExpCOD_CST_IPI: TStringField;
    QNotaEntrada_ExpPERC_IPI: TFloatField;
    QNotaEntrada_ExpCOD_CST_PIS: TStringField;
    QNotaEntrada_ExpVAL_PIS_1: TFloatField;
    QNotaEntrada_ExpSVAL_PIS: TFloatField;
    QNotaEntrada_ExpCOD_CST_COFINS: TStringField;
    QNotaEntrada_ExpVAL_ICMS_SUBST: TFloatField;
    QNotaEntrada_ExpSVAL_ICMS_SUBT: TFloatField;
    QNotaEntrada_ExpDESC_UNIDADE: TStringField;
    QNotaEntrada_ExpVAL_BASE_SUBST: TFloatField;
    QNotaEntrada_ExpDESC_SITUACAO_TRIB: TStringField;
    QNotaEntrada_ExpSVAL_TOTAL: TFloatField;
    QNotaEntrada_ExpSVAL_DESCONTO: TFloatField;
    QNotaEntrada_ExpVAL_FRETE: TFloatField;
    QNotaEntrada_ExpSVAL_FRETE: TFloatField;
    QNotaEntrada_ExpSVAL_DESPESAS: TFloatField;
    QNotaEntrada_ExpCOD_TRANSPORTE: TIntegerField;
    QNotaEntrada_ExpDESC_PLACA: TStringField;
    QNotaEntrada_ExpNUM_VOLUMES: TIntegerField;
    QNotaEntrada_ExpDESC_ESPECIE: TStringField;
    QNotaEntrada_ExpDESC_CHAVE_ACESSO: TStringField;
    QNotaEntrada_ExpNUM_PESO_BRUTO: TFloatField;
    QNotaEntrada_ExpNUM_PESO_LIQUIDO: TFloatField;
    QNotaEntrada_ExpSVAL_ICM_BASE_ISENTO: TFloatField;
    QCstPisCons: TOracleDataSet1;
    DSCstPisCons: TDataSource;
    QCstCofinsCons: TOracleDataSet1;
    DSCstCofinsCons: TDataSource;
    QCstCofinsConsCOD_CST_COFINS: TStringField;
    QCstCofinsConsDESC_CST_COFINS: TStringField;
    QCstCofinsConsDESC_COMPLETA: TStringField;
    QCstPisConsCOD_CST_PIS: TStringField;
    QCstPisConsDESC_CST_PIS: TStringField;
    QCstPisConsDESC_COMPLETA: TStringField;
    QItemNFCOD_CST_PIS: TStringField;
    QItemNFCOD_CST_COFINS: TStringField;
    QItemNFQT_QUANTIDADE: TFloatField;
    QNotaEntrada_ExpNUM_CGC: TStringField;
    QNotaEntradaCOD_SERIE_MODELO: TStringField;
    QNotaEntrada_ExpCOD_SERIE_MODELO: TStringField;
    QItemNFVAL_UNITARIO: TFloatField;
    QNotaEntradaCOD_SERIE_MODELO_CF: TStringField;
    QImpostoSVAL_ICM_SUBST: TFloatField;
    QImpostoSVAL_BASE_ICM_SUBST: TFloatField;
    QItemNFVAL_BC_DI: TFloatField;
    QItemNFVAL_DESCONTO_RATEIO: TFloatField;
    QItemNFVAL_PIS: TFloatField;
    QItemNFVAL_CONFINS: TFloatField;
    QNotaEntradaDESC_CHAVE_ACESSO_CTE: TStringField;
    QItemNFind_subst_trib: TStringField;
    QNotaEntradaVAL_PIS_FRETE: TFloatField;
    QNotaEntradaVAL_COFINS_FRETE: TFloatField;
    QContaPagarNUM_TITULO: TFloatField;
    QPrecoNotaItem: TOracleDataSet1;
    QPrecoNotaItemCOD_PRODUTO: TFloatField;
    QPrecoNotaItemDESC_PRODUTO: TStringField;
    QPrecoNotaItemVAL_CUSTO: TFloatField;
    QPrecoNotaItemVAL_VAREJO: TFloatField;
    QPrecoNotaItemVAL_UNITARIO_TABELA: TFloatField;
    DSPAlteraPreco: TDataSetProvider;
    CDSAlteraPreco: TClientDataSet;
    CDSAlteraPrecoCOD_PRODUTO: TFloatField;
    CDSAlteraPrecoDESC_PRODUTO: TStringField;
    CDSAlteraPrecoVAL_CUSTO: TFloatField;
    CDSAlteraPrecoVAL_VAREJO: TFloatField;
    CDSAlteraPrecoVAL_UNITARIO_TABELA: TFloatField;
    QPrecoNotaItemPERC_MARGEM_VAREJO: TFloatField;
    CDSAlteraPrecoPERC_MARGEM_VAREJO: TFloatField;
    QNotaEntradaCOD_UF_VEICULO: TStringField;
    QRComissaoFreteEntrada: TOracleDataSet1;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    QNotaEntradaDESC_HASH_MD5: TStringField;
    QNotaEntradaDESC_MD5_CUPOM_FISCAL: TStringField;
    QItemNFVAL_DESPESAS: TFloatField;
    QSomaItemNotaSVAL_DESPESAS: TFloatField;
    QItemNFIND_CONSIDERA_IPI_BC_ICMS: TStringField;
    QNotaEntradaConsDESC_CHAVE_ACESSO: TStringField;
    QItemNFIND_TIPO_VIA_TRANSP_DI: TIntegerField;
    QItemNFVAL_AFRMM_DI: TFloatField;
    QItemNFIND_TIPO_INTERMEDIO_DI: TIntegerField;
    QItemNFDESC_CNPJ_ENCOMENDANTE_DI: TStringField;
    QItemNFDESC_UF_ENCOMENDANTE_DI: TStringField;
    QNotaReferenciada: TOracleDataSet;
    QNotaReferenciadaCOD_NOTA_REFERENCIADA: TIntegerField;
    QNotaReferenciadaCOD_NOTA_CAB: TIntegerField;
    QNotaEntradaIND_FINALIDADE_NFE: TIntegerField;
    cdsNfeImportAdiCOD_NOTA_ITEM: TIntegerField;
    QNFAuxAbertoDESC_CHAVE_ACESSO: TStringField;
    QNfeimportAdiConsDESC_NUM_DRAW: TStringField;
    QNfeImportAdiDESC_NUM_DRAW: TStringField;
    cdsNfeImportAdiDESC_NUM_DRAW: TStringField;
    QNotaEntradaConsCOD_SERIE_MODELO: TStringField;
    QNotaImpostoServicoVAL_IMPOSTO: TFloatField;
    QNotaReferenciadaCOD_NOTA_CAB_REF: TIntegerField;
    QNotaReferenciadaDESC_CHAVE_ACESSO: TStringField;
    QNotaReferenciadaCOD_SERIE: TStringField;
    QNotaReferenciadaCOD_SERIE_MODELO: TStringField;
    QNotaReferenciadaCOD_CADASTRO: TIntegerField;
    QNotaReferenciadaDT_EMISSAO: TDateTimeField;
    QNotaReferenciadaNUM_NOTA: TIntegerField;
    QNFAuxAbertoCOD_SERIE_MODELO: TStringField;
    QNotaEntradaConsCOD_OPERACAO: TIntegerField;
    QNotaReferenciadaInsert: TOracleDataSet1;
    QItemNFIND_DESCONTA_ICMS_ST_PISCOFINS: TStringField;
    QContaPagarCOD_OBRA: TIntegerField;
    CdsNotaRateioObra: TClientDataSet;
    CdsNotaRateioObracod_obra: TIntegerField;
    CdsNotaRateioObracod_produto: TFloatField;
    CdsNotaRateioObraqt_quantidade: TFloatField;
    CdsNotaRateioObravl_unitario: TFloatField;
    QNotaEntradaDESC_OBS_AJUSTE_FISCAL: TStringField;
    QNotaEntradaNUM_PESO_BRUTO: TFloatField;
    QNotaEntradaNUM_PESO_LIQUIDO: TFloatField;
    QPrecoNotaItemNUM_FABRICANTE: TStringField;
    CDSAlteraPreconum_fabricante: TStringField;
    QPagamento: TOracleDataSet1;
    QPagamentoCOD_PAGAMENTO: TIntegerField;
    QPagamentoCOD_NOTA_CAB: TIntegerField;
    QPagamentoVAL_PAGAMENTO: TFloatField;
    QPagamentoVAL_VALOR: TFloatField;
    QPagamentoCOD_PAGAMENTO_ESTORNADO: TIntegerField;
    QPagamentoIND_ESTORNO: TStringField;
    QPagamentoDESC_PAGAMENTO: TStringField;
    QPagamentoCOD_TEF_PGTO: TIntegerField;
    QPagamentoIND_CONFIRMADO: TStringField;
    QPagamentoPAGAMENTO: TStringField;
    QPagamentoVAL_TROCO: TFloatField;
    QSomaPagamentos: TOracleDataSet1;
    QSomaPagamentosVAL_PAGO: TFloatField;
    QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS: TFloatField;
    QSomaPagamentosVAL_AVISTA: TFloatField;
    QSomaPagamentosVAL_TEF_NAO_PROCESSADO: TFloatField;
    QSomaPagamentosVAL_TEF: TFloatField;
    QSomaPagamentosVAL_TEF_PROCESSADO: TFloatField;
    QSomaPagamentosVAL_TEF_EFETUADO: TFloatField;
    DsPagamento: TDataSource;
    DSSomaPagamentos: TDataSource;
    QPrecoNotaItemDESC_COD_BARRA: TStringField;
    CDSAlteraPrecodesc_cod_barra: TStringField;
    QFCCIA: TOracleDataSet1;
    QFCCIACOD_FCCIA: TIntegerField;
    QFCCIANUM_ORDEM_FCCIA: TIntegerField;
    QFCCIACOD_NOTA_CAB: TIntegerField;
    QFCCIADESC_RAZAO_SOCIAL_ORIGEM_CRED: TStringField;
    QFCCIACOD_ESTADO_ORIGEM_CRED: TStringField;
    QFCCIANUM_NOTA_ORIGEM_CRED: TIntegerField;
    QFCCIADT_EMISSAO_ORIGEM_CRED: TDateTimeField;
    QFCCIAVAL_ICMS_ORIGEM_CRED: TFloatField;
    QFCCIACOD_SERIE_ORIGEM_CRED: TStringField;
    QFCCIACOD_SERIE_MODELO_ORIGEM_CRED: TStringField;
    QItemNFnum_ncm: TStringField;
    QPrecoNotaItemVAL_ATACADO: TFloatField;
    CDSAlteraPrecoVAL_ATACADO: TFloatField;
    QPrecoNotaItemNOVO_VAL_ATACADO: TFloatField;
    CDSAlteraPrecoNOVO_VAL_ATACADO: TFloatField;
    QFCCIAParcelaCredito: TOracleDataSet1;
    QFCCIAParcelaCreditoCOD_FCCIA_PARCELA_CREDITO: TIntegerField;
    QFCCIAParcelaCreditoCOD_FCCIA: TIntegerField;
    QFCCIAParcelaCreditoANO_MES_SEQUENCIA: TIntegerField;
    QFCCIAParcelaCreditoVAL_PARCELA: TFloatField;
    QPrecoNotaItemPERC_REAJUSTE: TFloatField;
    CDSAlteraPrecoPERC_REAJUSTE: TFloatField;
    QSomaItemNotaSVAL_DESCONTO_TOTAL: TFloatField;
    QPrecoNotaItemLUCRO: TFloatField;
    CDSAlteraPrecoLUCRO: TFloatField;
    QNotaEntradaCOD_CONTRATO_CPR: TIntegerField;
    QIcmsSubstEspecial: TOracleDataSet1;
    QIcmsSubstEspecialCOD_SUBST_ESPECIAL: TIntegerField;
    QIcmsSubstEspecialCOD_NOTA_CAB: TIntegerField;
    QIcmsSubstEspecialCOD_PRODUTO: TIntegerField;
    QIcmsSubstEspecialDT_LANCAMENTO: TDateTimeField;
    QIcmsSubstEspecialVAL_SUBST_ESPECIAL: TFloatField;
    QIcmsSubstEspecialVAL_BASE_SUBST_ESPECIAL: TFloatField;
    QIcmsSubstEspecialDESC_CHAVE_ACESSO: TStringField;
    QRFunRuralsVal_Total_Aux: TFloatField;
    QRFunRuralCOD_NOTA_ITEM: TIntegerField;
    QRFunRuralCOD_NOTA_CAB: TIntegerField;
    QInsertContabiliza: TOracleDataSet;
    QInsertContabilizaCOD_NOTA_CAB: TIntegerField;
    QItemNFVAL_BASE_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNFVAL_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNfConsVAL_BASE_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNfConsVAL_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNfConsVAL_BASE_SUBST: TFloatField;
    QItemNfConsVAL_ICMS_SUBST: TFloatField;
    QItemNFPERC_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNfConsPERC_ST_ANTERIOR_RETIDO: TFloatField;
    QNotaEntradaIND_INTERMEDIADOR: TStringField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    QNotaEntradaConsdesc_pagamento: TStringField;
    QNotaEntradaConsIND_CONDICAO_PAGTO: TStringField;
    CDSAlteraPrecoPERC_MARGEM_ATACADO: TFloatField;
    CDSAlteraPrecoPERC_REAJUSTE_ATACADO: TFloatField;
    QPrecoNotaItemPERC_REAJUSTE_ATACADO: TFloatField;
    QPrecoNotaItemPERC_MARGEM_ATACADO: TFloatField;
    QContaPagarCOD_USUARIO: TIntegerField;
    QContaPagarDT_USUARIO: TDateTimeField;
    QItemNFCOD_USUARIO: TIntegerField;
    QCstIpiConsORDEM: TFloatField;
    QRRelatorioFixacaoVAL_LIQUIDO: TFloatField;
    QItemNFVAL_INSS: TFloatField;
    QItemNFVAL_CSLL: TFloatField;
    QItemNFVAL_IR: TFloatField;
    QItemNFPERC_IR: TFloatField;
    QItemNFPERC_CSLL: TFloatField;
    QItemNF_CalcFields: TOracleDataSet1;
    QItemNF_CalcFieldsDESC_PRODUTO: TStringField;
    QItemNF_CalcFieldsIND_SUBST_TRIB: TStringField;
    QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO: TIntegerField;
    QItemNF_CalcFieldsIND_FISICA_JURIDICA: TStringField;
    QItemNF_CalcFieldsNUM_INSCRICAO: TStringField;
    QItemNF_CalcFieldsCOD_NOTA_ITEM: TIntegerField;
    QItemNF_CalcFieldsCOD_PRODUTO: TFloatField;
    QItemNF_CalcFieldsVL_CUSTO_MEDIO: TFloatField;
    QItemNF_CalcFieldsIND_CONTRIBUINTE: TStringField;
    QItemNF_CalcFieldsCOD_TRIBUTACAO: TIntegerField;
    QItemNF_CalcFieldsDESC_SITUACAO_TRIB_NC: TStringField;
    QItemNF_CalcFieldsDESC_SITUACAO_TRIB: TStringField;
    QItemNF_CalcFieldsDESC_CSOSN: TStringField;
    QItemNF_CalcFieldsDESC_CSOSN_NC: TStringField;
    QItemNF_CalcFieldsCOD_OPERACAO: TIntegerField;
    QItemNF_CalcFieldsESTADO_FILIAL: TStringField;
    QItemNF_CalcFieldsCOD_CFOP_ST: TIntegerField;
    QItemNF_CalcFieldsCOD_CFOP_INT_ST: TIntegerField;
    QItemNF_CalcFieldsPERC_ALIQUOTA: TFloatField;
    QItemNF_CalcFieldsPERC_TRIBUTADO: TFloatField;
    QItemNF_CalcFieldsPERC_DIFERIMENTO: TFloatField;
    QItemNF_CalcFieldsIND_CONSIDERA_DESC_BC: TStringField;
    QItemNF_CalcFieldsIND_CONSIDERA_IPI_BC_ICMS: TStringField;
    QItemNF_CalcFieldsIND_TRANSFERENCIA: TStringField;
    QItemNF_CalcFieldsIND_SUBSTITUICAO: TStringField;
    QItemNF_CalcFieldsIND_CONSIDERA_IPI_BC_SUBST: TStringField;
    QItemNF_CalcFieldsIND_CONSIDERA_RED_BASE_SUBST: TStringField;
    QItemNF_CalcFieldsVAL_PAUTA: TFloatField;
    QItemNF_CalcFieldsIND_CONSUMIDOR_FINAL: TStringField;
    QItemNF_CalcFieldsDESC_FORMA_COMPRA: TStringField;
    QItemNF_CalcFieldsCOD_HISTORICO_CAIXA_CHEQUE: TIntegerField;
    QItemNF_CalcFieldsIND_APLICA_DEDUCAO_BC_ISS: TStringField;
    QItemNF_CalcFieldsIND_TIPO_PRODUTO: TStringField;
    QItemNF_CalcFieldsPERC_BC_NFSE: TFloatField;
    QItemNF_CalcFieldsPERC_ISS: TFloatField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_FILIAL: TFloatField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_CADASTRO: TFloatField;
    QItemNF_CalcFieldsCFOP_ESTADUAL: TIntegerField;
    QItemNF_CalcFieldsCFOP_INTERESTADUAL: TIntegerField;
    QItemNF_CalcFieldsIND_EMITE: TStringField;
    QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO: TStringField;
    QItemNF_CalcFieldsIND_CALCULA_ISS_CIDADE: TStringField;
    QItemNF_CalcFieldsPERC_ISS_CIDADE: TFloatField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE: TFloatField;
    QItemNF_CalcFieldsIND_ISS_RETIDO: TIntegerField;
    QItemNF_CalcFieldsIND_CONSIDERA_FRETE_BC_ICMS: TStringField;
    QSomaItemNotaSVAL_INSS: TFloatField;
    QSomaItemNotaSVAL_CSLL: TFloatField;
    QSomaItemNotaSVAL_IR: TFloatField;
    QConsNotaEstoque: TOracleDataSet;
    QConsNotaEstoqueCOD_FILIAL: TIntegerField;
    QConsNotaEstoqueCOD_PRODUTO: TFloatField;
    QConsNotaEstoqueDESC_PRODUTO: TStringField;
    QConsNotaEstoqueQT_QUANTIDADE: TFloatField;
    QItemNFNUM_DI: TStringField;
    QRExtratoNotaAgricola: TOracleDataSet1;
    QRExtratoNotaAgricolaNUM_NOTA: TIntegerField;
    QRExtratoNotaAgricolaNOME_CADASTRO: TStringField;
    QRExtratoNotaAgricolaQT_QUANTIDADE: TFloatField;
    QRExtratoNotaAgricolaSVAL_TOTAL: TFloatField;
    QRExtratoNotaAgricolaVAL_DESC_FUNRURAL: TFloatField;
    QRExtratoNotaAgricolaVAL_TOTAL_NOTA: TFloatField;
    QRExtratoNotaAgricolaDT_EMISSAO: TDateTimeField;
    QRExtratoNotaAgricolaTRUNCVAL_UNITARIO4: TFloatField;
    QRExtratoNotaAgricolaVAL_DESC_SENAR: TFloatField;
    QRExtratoNotaAgricolaDT_VENCIMENTO: TStringField;
    QRExtratoNotaAgricolaIND_SITUACAO: TStringField;
    QItemNFNUM_CLASS_TRIB_IBS_CBS: TStringField;
    QItemNFNUM_CST_IBS_CBS: TStringField;
    QItemNFVAL_BC_IBS_CBS: TFloatField;
    QItemNFVAL_IBS_MUN: TFloatField;
    QItemNFVAL_IBS_EST: TFloatField;
    QItemNFVAL_CBS: TFloatField;
    QItemNFVAL_IS: TFloatField;
    QItemNF_CalcFieldsPERC_CBS: TFloatField;
    QItemNF_CalcFieldsPERC_IBS_MUN: TFloatField;
    QItemNF_CalcFieldsPERC_IBS_UF: TFloatField;
    QItemNF_CalcFieldsPERC_REDUCAO_IBS: TIntegerField;
    QItemNF_CalcFieldsPERC_REDUCAO_CBS: TIntegerField;
    QClassTribIbsCbs: TOracleDataSet1;
    QClassTribIbsCbsCOD_CLASS_TRIB: TIntegerField;
    QClassTribIbsCbsNUM_CLASS_TRIB: TStringField;
    QClassTribIbsCbsCOD_CST_IBS_CBS: TIntegerField;
    QClassTribIbsCbsNOME_CLASS_TRIB: TStringField;
    QClassTribIbsCbsDESCRICAO: TStringField;
    DSClassTribIbsCbs: TDataSource;
    procedure QNotaEntradaAfterInsert(DataSet: TDataSet);
    procedure QNotaEntradaAfterEdit(DataSet: TDataSet);
    procedure QNotaEntradaBeforeInsert(DataSet: TDataSet);
    procedure QNotaEntradaBeforeEdit(DataSet: TDataSet);
    procedure QNotaEntradaAfterCancel(DataSet: TDataSet);
    procedure QItemNFAfterInsert(DataSet: TDataSet);
    procedure QItemNFBeforeEdit(DataSet: TDataSet);
    procedure QItemNFBeforeInsert(DataSet: TDataSet);
    procedure QItemNFBeforeDelete(DataSet: TDataSet);
    procedure QNotaEntradaBeforeCancel(DataSet: TDataSet);
    procedure QNotaEntradaBeforePost(DataSet: TDataSet);
    procedure QItemNFCalcFields(DataSet: TDataSet);
    procedure QItemNFAfterPost(DataSet: TDataSet);
    procedure QAtuBaixaOCBeforeDelete(DataSet: TDataSet);
    procedure QAtuBaixaOCAfterPost(DataSet: TDataSet);
    procedure QContaPagarBeforeDelete(DataSet: TDataSet);
    procedure QNotaEntradaAfterPost(DataSet: TDataSet);
    procedure QNotaEntradaCOD_VENDEDORValidate(Sender: TField);
    procedure QBaixaAuxBeforeDelete(DataSet: TDataSet);
    procedure QBaixaAuxAfterPost(DataSet: TDataSet);
    procedure QBaixaAuxBeforeEdit(DataSet: TDataSet);
    procedure QItemNFPERC_DESCONTOValidate(Sender: TField);
    procedure QNotaEntradaCOD_CADASTROValidate(Sender: TField);
    procedure QNotaEntradaCOD_OPERACAOValidate(Sender: TField);
    procedure QItemNFBeforePost(DataSet: TDataSet);
    procedure QItemNFVAL_TOTALValidate(Sender: TField);
    procedure QItemNFAfterDelete(DataSet: TDataSet);
    procedure QItemNFVAL_IPIValidate(Sender: TField);
    procedure QNotaEntradaVAL_FRETEValidate(Sender: TField);
    procedure QNotaEntradaCOD_TRANSPORTADORValidate(Sender: TField);
    procedure QNotaEntradaBeforeDelete(DataSet: TDataSet);
    procedure QNotaEntradaAfterDelete(DataSet: TDataSet);
    procedure QNotaEntradaDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QItemNFBeforeCancel(DataSet: TDataSet);
    procedure QNotaEntradaVAL_DESPESASValidate(Sender: TField);
    procedure QNotaEntradaVAL_DESCONTOValidate(Sender: TField);
    procedure QNotaEntradaVAL_ICM_FRETEValidate(Sender: TField);
    procedure QNotaEntradaVAL_ICM_BASE_FRETEValidate(Sender: TField);
    procedure QItemNFCOD_TRIBUTACAOValidate(Sender: TField);
    procedure QItemNFCOD_PRODUTOValidate(Sender: TField);
    procedure QNotaEntradaAfterOpen(DataSet: TDataSet);
    procedure QSomaItemNotaCalcFields(DataSet: TDataSet);
    procedure QItemNFQT_QUANTIDADEValidate(Sender: TField);
    procedure QRFechamentoCereaisCalcFields(DataSet: TDataSet);
    procedure QNotaEntradaVAL_FRETE_TONChange(Sender: TField);
    procedure QNotaImpostoServicoBeforeDelete(DataSet: TDataSet);
    procedure QNotaImpostoServicoBeforeEdit(DataSet: TDataSet);
    procedure QNotaImpostoServicoBeforeInsert(DataSet: TDataSet);
    procedure QNotaImpostoServicoCalcFields(DataSet: TDataSet);
    procedure QRNotaServicoCalcFields(DataSet: TDataSet);
    procedure QItemNFCOD_PRODUTOChange(Sender: TField);
    procedure QItemNFQT_QUANTIDADEChange(Sender: TField);
    procedure QNotaEntradaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QNotaEntradaBeforeClose(DataSet: TDataSet);
    procedure QNotaEntradaDESC_CHAVE_ACESSO_CTEValidate(Sender: TField);
    procedure QNotaEntradaCOD_OPERACAOChange(Sender: TField);
    procedure QPagamentoAfterInsert(DataSet: TDataSet);
    procedure QFCCIABeforePost(DataSet: TDataSet);
    procedure QFCCIAAfterOpen(DataSet: TDataSet);
    procedure CDSAlteraPrecoPERC_REAJUSTEChange(Sender: TField);
    procedure QRFunRuralCalcFields(DataSet: TDataSet);
    procedure QSomaItemNotaAfterOpen(DataSet: TDataSet);
    procedure QNotaEntradaNUM_CONHECIMENTO_FRETEChange(Sender: TField);
    procedure QNotaEntradaConsCalcFields(DataSet: TDataSet);
    procedure CDSAlteraPrecoPERC_REAJUSTE_ATACADOChange(Sender: TField);


  private
    { Private declarations }
    fTipoNota, fContabiliza_Extra: string;
    fTipo_Lote: Integer;
    FValDescontoOriginal: Extended;  //Armazena o desconto original para comparar com o novo valor informado. Junior 21/09/2026
    fOperacaoInterna: Integer;
    fPendenciaInterna: Integer;
    fContratoAgricola: Boolean;
    FTr: Boolean;
    fCF: Boolean;
    fVoltaConfirmacao: Boolean; // significa se esta voltando confirmação de notas true=sim false=nao
    fNumeroOrdemFCCIA: TVariantMap;
    function TipoAtzNotaAux(wEntradaSaida: string): string;
    procedure ChecaPendenciaInterna;
    procedure VlrItemNFMarca;
    procedure PopulaCalcFields;
    function NumeroOrdemFCCIA: integer;
    procedure VlrItemNFDevolucaoPaulinho; //puxar vlr un. do produto da devolução para empresa Paulinho
  public
    { Public declarations }
    property pCF: Boolean read fCF write fCF default False;
    procedure AcertaValoresNota;
    procedure AtualizaEstoque(wCod_Nota: Integer; wTipoAtualizacao: Integer);
    procedure GeraContaPagar(wCod_Nota: Integer; wListaParcela: TStrings; wFinalidade, wFormaPagto: Integer; wTipoCP, wDepartamento: string; wCodSerie: string; wNumParcela, wCodObra: integer; wPontualidade, wAntecipacao, wSintegra: string);
    procedure IncluiNotaAux;
    procedure VoltaCancelamento(wCod_Nota: Integer);
    procedure VoltaConfirmacao(wCod_Nota: Integer; wIndTrans: string; wIndSituacao: string);
    procedure Contabiliza(wCod_Nota: Integer);
    procedure ValidaContaPagar(wCod_Nota: Integer; wListaParcela: TStrings; wFinalidade: Real; wTipoCP: string);
    procedure AtuOrdemCompra(wTipoAtu: Integer);
    procedure ChecaSaldoFixar;
    procedure CalculaDesconto(wCadastro, wFilial, wOperacao, wNota_Item: Integer; wProduto, wQuantidade: Real; wTipo, wCadastroParceiro: string);
    procedure Atualiza_Conhecimento;
    function CalculaFunrural(wProduto, wOperacao, wCadastro, wValor: Real): Real;
    function CalculaSenar(wProduto, wOperacao, wCadastro, wValor: Real): Real;
    procedure ExcluiNota;
    procedure InserePagamentoNFCe(Valor: Real; Descricao: String);
    procedure ConfirmaPagamentoNFCe();
    property pTipo_Lote: Integer read fTipo_Lote write fTipo_Lote;
    property pTipoNota: string read fTipoNota write fTipoNota;
    property pContabiliza_Extra: string read fContabiliza_Extra write fContabiliza_Extra;
    (*Esta propriedade é utilizada na rotina extra de contabilização de compras e vendas
      é utilizado para não realizar os eventos da query QNotaEntrada e QNotaSaida .. rotina criada pelo César *)
    property pPendenciaInterna: Integer read fPendenciaInterna write fPendenciaInterna default 0;
    (*  ** Esta propriedade atua em conjunto com a propriedade fOperacaoInterna.
        ** Ela indica quando uma pOperacaoInterna deve ser executada antes de se gravar a Nota.
    *)
    property pOperacaoInterna: Integer read fOperacaoInterna write fOperacaoInterna default 0;
    (* ** Esta propriedade é utilizada para evitar que algumas regras de negócios
       ** Implementados nos eventos do Itens da Nota sejam executadas durante a
       ** Execução de alguns procedimentos internos. Ex: O item da Nota não pode ser
       ** excluído no estado dsBrowse da Nota, a não ser que se esteja executando uma
       ** deleção da Nota Corrente (pOperacaoInterna = 1);
    *)
    // pOperacaoInterna := 0; // Normal - Nenhuma operação especial sendo executada
    // pOperacaoInterna := 1; // Exclusão de NF - A Nota Fiscal Corrente está sendo Excluida
    // pOperacaoInterna := 2; // Rateio do Cabeçalho
    property pContratoAgricola: Boolean read FContratoAgricola write FContratoAgricola default False;
    property pTR: Boolean read fTR write fTR default False;
    property pVoltaConfirmacao: Boolean read fVoltaConfirmacao write fVoltaConfirmacao default False;
    procedure SetaPendenciaInterna(wPendencia: Integer);
    procedure RateiaCabecalho;
    procedure ValidaFornecedor(CodFornecedor: String);
    procedure ValidaOperacao(CodOperacao: String);
  end;

var
  DMNotaEntrada: TDMNotaEntrada;
  wCont1: integer;
  BibliotecaDB : TBibliotecaDB; /// utilizado para os CalcFields que foram movidos.

const
  EMPRESA_GERA_TRANSF_CONFIRMADA = 'OTICA';


implementation

uses UOracle_cl, UUsuario_cl, UEstoque_cl, UTributacao_cl, UOperacao_cl,
  UPlanilha_cl, UFinalidade_cl, UParamSistema_cl,
  URomaneioAgricola_cl, UContasPagar_cl, UNotaSaida_cl, UProduto_cl,
  UCaixaLanc_Cont, UHistorico_cl, UNfe_cl, UObra_cl, USpedValidacao, Math,
  UDevolucaoTroca_cl, USequencia_cl, UCadastro_cl, UEstado_cl, UCidade_cl,
  uCalculoIBSCBS, UFilial_cl;

{$R *.DFM}

procedure TDMNotaEntrada.QNotaEntradaAfterInsert(DataSet: TDataSet);
begin
  QNotaEntradaInd_Entrada_Saida.Value := 'E';
  QNotaEntradaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaEntradaDt_Usuario.Value := DMOracle.DataHoraServ;
  QNotaEntradaDt_Movimento.Value := DMOracle.DataHoraServ;
  QNotaEntradaInd_Situacao.Value := '1'; // Digitada
  QNotaEntradaCod_Transporte.Value := 1; // Terrestre
  QNotaEntradaCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QNotaEntradaCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;
  if DMUsuario.CodSeriePadrao <> '' then
    QNotaEntradaCod_Serie.Value := DMUsuario.CodSeriePadrao;
  if DMUsuario.CodSerieModeloPadrao <> '' then
    QNotaEntradaCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;
  QNotaEntradaCod_Cadastro_Parceiro.Text := DMUsuario.pCodParceria;
  QNotaEntradaInd_Condicao_Pagto.Value := '2';
  QNotaEntradaVal_Despesas.Value := 0;
  QNotaEntradaVal_Frete.Value := 0;
  QNotaEntradaVal_AVista.Value := 0;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    QNotaEntradaInd_Tipo_Frete.Value := 'FOB'
  else
    QNotaEntradaInd_Tipo_Frete.Value := 'CIF';
  QNotaEntradaNum_Volumes.Value := 0;
  QNotaEntradaVal_Icm_Frete.Value := 0;
  QNotaEntradaVal_Icm_Base_Frete.Value := 0;
  QNotaEntradaDt_Recebimento.Value := DMOracle.DataServ;
  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'KREUZ' Then
     QNotaEntradaDt_Emissao.Value := DMOracle.DataServ;
  if pTipoNota = 'AGRICOLA' then
    QNotaEntradaNum_Nota.Value := 0;
  QSomaItemNota.Close;
  QSomaItemNota.Open;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  if DMParamSistema.QParamSistemaDESC_MD5_ARQ_CONFIG.Value <> '' then
    QNotaEntradaDESC_MD5_CUPOM_FISCAL.Value :=
      DMParamSistema.QParamSistemaDESC_MD5_ARQ_CONFIG.Value;
end;


procedure TDMNotaEntrada.PopulaCalcFields;
var
  Buscador : TBuscador;
begin
  if (pOperacaoInterna <> 3) And
     (QNotaEntradanome_usuario.Value = Null) then
    QNotaEntradanome_usuario.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + FloatToStr(QNotaEntradaCod_Usuario.Value), True);

  QNotaEntradaind_complemento.Value := False; //Armazena boolean que indica se a nota é de complemento
  if (not QNotaEntradaCOD_OPERACAO.IsNull) then
    QNotaEntradaind_complemento.Value := (DMOracle.FastSelect('IND_FINALIDADE_NFE', 'TB_OPERACAO',
      'COD_OPERACAO = ' + QNotaEntradaCOD_OPERACAO.Text) = '2');


  QNotaEntradadesc_situacao.Value := '';
  if (QNotaEntradaIND_SITUACAO.Value = SIT_NOTA_DIGITADA) then
    QNotaEntradadesc_situacao.Value := 'DIGITADA'
  else if (QNotaEntradaIND_SITUACAO.Value = SIT_NOTA_CONFIRMADA) then
    QNotaEntradadesc_situacao.Value := 'CONFIRMADA'
  else if (QNotaEntradaIND_SITUACAO.Value = SIT_NOTA_CANCELADA) then
    QNotaEntradadesc_situacao.Value := 'CANCELADA'
  else if (QNotaEntradaIND_SITUACAO.Value = SIT_NOTA_DENEGADA) then
    QNotaEntradadesc_situacao.Value := 'DENEGADA';
  if (not QNotaEntradaCOD_FILIAL.IsNull)          And
     (not QNotaEntradaCOD_SERIE.IsNull) then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL',
        'COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text);
    Buscador.Adiciona('COD_UF_IBGE', 'TB_ESTADO', 'COD_ESTADO = (' +
        MontaSelect('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' +
        QNotaEntradaCOD_FILIAL.Text) + ')');

    Buscador.Buscar;
    QNotaEntradadesc_servidor_nfe.Value := Buscador.Proximo;
    QNotaEntradacod_uf_ibge_filial.Value := StrToInt('0' + Buscador.Proximo);
    
  end;

  QNotaEntradadesc_situacao_sefaz.Value := '';
  if not QNotaEntradaDESC_CHAVE_ACESSO.IsNull then
    with DMNfe do
    begin
      SetaNfe(Bib.LimpaNumero(QNotaEntradaDESC_CHAVE_ACESSO.Value), True);
      if not QNfe.Eof then
      begin
        if QNfeind_cancelado.Value then
          QNotaEntradadesc_situacao_sefaz.Value := QNfeSIT_CANC.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_CANC.Value))
        else
          QNotaEntradadesc_situacao_sefaz.Value := QNfeSIT_NFE.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_NFE.Value));
      end;
    end;
end;


procedure TDMNotaEntrada.QNotaEntradaAfterEdit(DataSet: TDataSet);
begin
  QNotaEntradaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaEntradaDt_Usuario.Value := DMOracle.DataHoraServ;
end;

procedure TDMNotaEntrada.QNotaEntradaBeforeInsert(DataSet: TDataSet);
begin
  if not (DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNotaEntrada.ValidaFornecedor(CodFornecedor: String);
begin
  if Trim(CodFornecedor) = '' then
    raise Exception.Create('Fornecedor não informado!');
  if DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CADASTRO', 'COD_CADASTRO = ' + CodFornecedor) = '0' then
    raise Exception.Create('Código de Fornecedor inválido ou inexistente!');
end;

procedure TDMNotaEntrada.ValidaOperacao(CodOperacao: String);
begin
  if Trim(CodOperacao) = '' then
    raise Exception.Create('Operação não informada!');
  if DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_OPERACAO', 'COD_OPERACAO = ' + CodOperacao) = '0' then
    raise Exception.Create('Código de Operação inválido ou inexistente!');
end;

procedure TDMNotaEntrada.QNotaEntradaBeforeEdit(DataSet: TDataSet);
begin
  FValDescontoOriginal := QNotaEntradaVAL_DESCONTO.Value; //Armazena o desconto original para verificar se houve alteração. Junior 21/09/2026
  if PContabiliza_Extra = 'N' then // Propriedade Setada na Rotina FContabilidadeParam
  begin
    if QNotaEntradaInd_Situacao.Value <> '1' then
      raise Exception.Create('Esta nota já esta confirmada ou cancelada!');
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
  end;
end;

procedure TDMNotaEntrada.QNotaEntradaAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QNotaEntrada.Close;
  QNotaEntrada.Open;
  QItemNF.Close;
  QItemNF.Open;
  QSomaItemNota.Close;
  QSomaItemNota.Open;
end;

procedure TDMNotaEntrada.QItemNFAfterInsert(DataSet: TDataSet);
begin
  QItemNFCod_Nota_Cab.Value := QNotaEntradaCod_Nota_Cab.Value;
//  QItemNFCod_Nota_Item.Value := DMOracle.Sequencia('NOTA_ITEM');
  //QItemNFCod_Tributacao.Value := 0;
  QItemNFPerc_IPI.Value := 0;
  QItemNFCod_Lote_Tipo.Value := 1;
  QItemNFPerc_Desconto.Value := 0;
  QItemNFVal_Despesas.Value := 0;
  QItemNFVal_Desconto.Value := 0;
  QItemNFVal_Frete.Value := 0;
  QItemNFVal_Unitario.Value := 0;
  QItemNFVal_Total.Value := 0;
  QItemNFVal_ICM_Base.Value := 0;
  QItemNFVal_ICM.Value := 0;
  QItemNFPerc_Comissao.Value := 0;
  QItemNFInd_Class_IPI.Value := '5'; // Sem Crédito de IPI
  QItemNFVal_Ipi.Value := 0;
end;

procedure TDMNotaEntrada.QItemNFBeforeEdit(DataSet: TDataSet);
begin
  QItemNFCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if QNotaEntrada.State = dsInsert then
  begin
    QNotaEntrada.Post;
    QNotaEntrada.Edit;
  end;
  if QNotaEntrada.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');  
end;

procedure TDMNotaEntrada.QItemNFBeforeInsert(DataSet: TDataSet);
begin
  QItemNFCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if QNotaEntrada.State = dsInsert then
  begin
    QNotaEntrada.Post;
    QNotaEntrada.Edit;
  end;
  if QNotaEntrada.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaEntrada.QItemNFBeforeDelete(DataSet: TDataSet);
begin
  if pOperacaoInterna <> 1 then
  begin
    if QNotaEntrada.State <> dsEdit then
      raise Exception.Create('Nota não está no modo de alteração!');
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Cancel;
    {
    QNotaEntradaVal_Funrural.Value := QNotaEntradaVal_Funrural.Value
                                    + CalculaFunrural(-1, QItemNFCod_Produto.Value,
                                                          QNotaEntradaCod_Operacao.Value,
                                                          QNotaEntradaCod_Cadastro.Value);
    }
  end;
  QAtuBaixaOC.Open;
  while not QAtuBaixaOC.Eof do
    QAtuBaixaOC.Delete;
  QAtuBaixaOC.Close;

  QVoltaSaldoFixado.Close;
  QVoltaSaldoFixado.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
  QVoltaSaldoFixado.ExecSQL;

end;

procedure TDMNotaEntrada.QNotaEntradaBeforeCancel(DataSet: TDataSet);
begin
  if QItemNF.State in [dsEdit, dsInsert] then
    QItemNF.Cancel;
  SetaPendenciaInterna(0);
end;

procedure TDMNotaEntrada.QNotaEntradaBeforePost(DataSet: TDataSet);
var
  spedValidacao: TSpedValidacao;
  wVal_Fixo_Subst: Real;
  wSituacaoDpto: string;

begin
  // Verifica se o desconto do cabeçalho foi alterado.
  // Quando alterado, zera o VAL_DESCONTO_RATEIO dos itens para que a
  // TRG_RATEIA_DESCONTO realize um novo rateio conforme o novo desconto.
  // Quando não houver alteração, mantém o rateio existente, evitando que
  // os descontos dos itens importados do XML sejam recalculados indevidamente. Junior 21/09/2026
  if FValDescontoOriginal <> QNotaEntradaVAL_DESCONTO.Value then
  begin
    QItemNF.First;
    while not QItemNF.Eof do
    begin
      QItemNF.Edit;
      QItemNFVAL_DESCONTO_RATEIO.Value := 0;
      QItemNF.Post;
      QItemNF.Next;
    end;
  end; // Se alterado o valor de desconto...recalcular o desconto_rateio //Junior 21/09/2026

  DMOracle.ValidaFilial(QNotaEntradaCOD_FILIAL.Text);
  //Faz validação dos códigos CST de pis e cofins para filiais que entregam sped
  if DMOracle.FastSelect('IND_SPED_PISCOFINS','TB_FILIAL','COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text) = 'S' then
  begin
    try
      spedValidacao := TSpedValidacao.Create;
      spedValidacao.Valida(QNotaEntrada, QItemNF);
    Except
      Abort;
    end;
  end;

  if QNotaEntradaCOD_SERIE_MODELO.Value = '55' then
  begin //Para NF-e, deve-se limpar caracteres não aceitos.
    QNotaEntradaOBS.Value := DMNfe.LimpaStrXML(QNotaEntradaOBS.Value);
    QNotaEntradaOBS_COMPLEMENTO.Value := DMNfe.LimpaStrXML(
      QNotaEntradaOBS_COMPLEMENTO.Value);
    QNotaEntradaDESC_OBS_CORPO_NOTA.Value := StringReplace(QNotaEntradaDESC_OBS_CORPO_NOTA.Value,' \n ' + chr(13)+chr(10),chr(13)+chr(10),[rfReplaceAll]);
    QNotaEntradaDESC_OBS_CORPO_NOTA.Value := StringReplace(QNotaEntradaDESC_OBS_CORPO_NOTA.Value,chr(13)+chr(10),' \n ' + chr(13)+chr(10),[rfReplaceAll]);
    QNotaEntradaDESC_OBS_CORPO_NOTA.Value := DMNfe.LimpaStrXML(QNotaEntradaDESC_OBS_CORPO_NOTA.Value,chr(13)+chr(10));
  end;

  if (not QNotaEntradaCOD_OPERACAO.IsNull) then
    QNotaEntradaind_complemento.Value := (DMOracle.FastSelect('IND_FINALIDADE_NFE', 'TB_OPERACAO',
      'COD_OPERACAO = ' + QNotaEntradaCOD_OPERACAO.Text) = '2');

  if (not QNotaEntradaCOD_FILIAL.IsNull)          And
     (QNotaEntradadesc_servidor_nfe.Value = Null) then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL',
        'COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text);
    Buscador.Adiciona('COD_UF_IBGE', 'TB_ESTADO', 'COD_ESTADO = (' +
        MontaSelect('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' +
        QNotaEntradaCOD_FILIAL.Text) + ')');
    //if not QNotaEntradaCOD_SERIE.IsNull then
    //  Buscador.Adiciona('DESC_MODELO', 'TB_SERIE',
    //    'COD_SERIE = ' + QuotedStr(QNotaEntradaCOD_SERIE.Value) +
    //    ' AND COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text);
    Buscador.Buscar;
    QNotaEntradadesc_servidor_nfe.Value := Buscador.Proximo;
    QNotaEntradacod_uf_ibge_filial.Value := StrToInt('0' + Buscador.Proximo);
    //QNotaEntradadesc_modelo_serie.Value := Buscador.Proximo;
  end;

  QNotaEntradadesc_situacao_sefaz.Value := '';
  if not QNotaEntradaDESC_CHAVE_ACESSO.IsNull then
    with DMNfe do
    begin
      SetaNfe(Bib.LimpaNumero(QNotaEntradaDESC_CHAVE_ACESSO.Value), True);
      if not QNfe.Eof then
      begin
        if QNfeind_cancelado.Value then
          QNotaEntradadesc_situacao_sefaz.Value := QNfeSIT_CANC.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_CANC.Value))
        else
          QNotaEntradadesc_situacao_sefaz.Value := QNfeSIT_NFE.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_NFE.Value));
      end;
    end;
  if QNotaEntradaNUM_NOTA.IsNull then
    QNotaEntradaNUM_NOTA.Value := 0;
  if (pOperacaoInterna <> 3) and (PContabiliza_Extra = 'N') then // Propriedade Setada na Rotina FContabilidadeParam
  begin // pOperacaoInterna é quando confirma nota
    ChecaPendenciaInterna;
    if QNotaEntradaDt_Emissao.Value > QNotaEntradaDt_Recebimento.Value then
      raise Exception.Create('A data de recebimento não pode ser menor que data de Emissão!');
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Post;
    try
      QItemNF.DisableControls;
      QNotaEntradaVal_Funrural.Value := 0;
      QNotaEntradaVal_Senar.Value := 0;
      //Calcula Pis e Cofins do Frete
      with DMOperacao do
      begin
        if QNotaEntradaCOD_OPERACAO_CF.Text <> '' then
        begin
          QOperacao.Close;
          QOperacao.SetVariable('PK', QNotaEntradaCOD_OPERACAO_CF.Text);
          QOperacao.Open;
          if QOperacaoPERC_BASE_PIS.Value > 0 then
            QNotaEntradaVAL_PIS_FRETE.Value :=
              (((QNotaEntradaVAL_FRETE.Value * QOperacaoPerc_Base_Pis.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_PIS.Value) / 100;
          if QOperacaoPERC_BASE_COFINS.Value > 0 then
            QNotaEntradaVAL_COFINS_FRETE.Value :=
              (((QNotaEntradaVAL_FRETE.Value * QOperacaoPerc_Base_Cofins.Value) / 100) *
              DMParamSistema.QParamSistemaPERC_COFINS.Value) / 100;
        end;
      end;

      QItemNF.First;
      while not QItemNF.Eof do
      begin
        if QItemNFCod_Lote_Tipo.Value = 0 then
          raise exception.Create('Item da Nota sem tipo de Lote!');
        if QItemNFCod_Tributacao.Value = 0 then
          raise exception.Create('Item da Nota sem Código de Tributação!');
        QNotaEntradaVal_Funrural.Value := QNotaEntradaVal_Funrural.Value
          + CalculaFunrural(QItemNFCod_Produto.Value,
          QNotaEntradaCod_Operacao.Value,
          QNotaEntradaCod_Cadastro.Value,
          QItemNFVal_Total.Value);

        QNotaEntradaVal_Senar.Value := QNotaEntradaVal_Senar.Value
          + CalculaSenar(QItemNFCod_Produto.Value,
          QNotaEntradaCod_Operacao.Value,
          QNotaEntradaCod_Cadastro.Value,
          QItemNFVal_Total.Value);
        //Aqui vai verificar se o item possui DI, vai para o sped e não possui base de cálculo
        with DMOracle do
        begin
          if (BuscaNome('SELECT PERC_BASE_PIS FROM TB_OPERACAO',
            'COD_OPERACAO = ' + QNotaEntradaCOD_OPERACAO.Text)) <> '' then
            if (QItemNFVAL_BC_DI.Value = 0) and (Trim(QItemNFNUM_DI.Text) <> '') then
            begin
              MessageDlg('O item ' + QItemNFCOD_NOTA_ITEM.Text +
                ' não possui informação sobre base de cálculo na DI', mtError,
                [mbOk],0);
              Abort;
            end;
        end;
        QItemNF.Next;
      end;
      QItemNF.EnableControls;
    except
      QItemNF.EnableControls;
      raise;
    end;
    QSomaItemNota.Close;
    QSomaItemNota.Open;
  end; // Se não está Confirmando

  if QNotaEntradaCOD_SERIE_MODELO.Value = '' then
  begin
    MessageDlg('O modelo da série deve ser informado', mtError, [mbOk], 0);
    Abort;
  end;
  if not QFCCIA.Eof then
  begin
    if Pos('FCCIA: ', QNotaEntradaOBS.Value) = 0 then
    begin
      if QNotaEntradaOBS.IsNull then
        QNotaEntradaOBS.Value := 'FCCIA: ' + QFCCIANUM_ORDEM_FCCIA.Text
      else
        QNotaEntradaOBS.Value := QNotaEntradaOBS.Value + ' \n '
          + 'FCCIA: ' + QFCCIANUM_ORDEM_FCCIA.Text;
    end;
  end;

  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ') and
     (DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_SUBST_ESPECIAL','COD_NOTA_CAB ='+QNotaEntradaCOD_NOTA_CAB.Text)= '')) then
  Begin
    QItemNF.Close;
    QItemNF.SetVariable('COD_NOTA_CAB',QNotaEntradaCOD_NOTA_CAB.Value);
    QItemNF.Open;
    QItemNF.First;
    while not QItemNF.Eof do
    Begin
      try
        wVal_Fixo_Subst := ((((((QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value) * 184.35)/100)*18)/100) - (((QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value)*12)/100));
        QIcmsSubstEspecial.Close;
        QIcmsSubstEspecial.open;
        QIcmsSubstEspecial.Insert; 
        QIcmsSubstEspecialCOD_NOTA_CAB.Value := QNotaEntradaCOD_NOTA_CAB.Value;
        QIcmsSubstEspecialCOD_PRODUTO.Value := QItemNFCOD_PRODUTO.AsInteger;
        QIcmsSubstEspecialDT_LANCAMENTO.Value := Date;
        QIcmsSubstEspecialVAL_SUBST_ESPECIAL.Value := wVal_Fixo_Subst;
        QIcmsSubstEspecialVAL_BASE_SUBST_ESPECIAL.Value := (((QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value) * 184.35)/100);
        QIcmsSubstEspecialDESC_CHAVE_ACESSO.Value := QNotaEntradaDESC_CHAVE_ACESSO.Value;
        QItemNF.next;
        QIcmsSubstEspecial.Post; 
      except
        QIcmsSubstEspecial.Cancel;
      end;
    end;
  End;

  wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + QNotaEntradaCOD_DEPARTAMENTO.Text);
  if wSituacaoDpto <> 'A' then
    raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');

  PopulaCalcFields;
end;

procedure TDMNotaEntrada.QItemNFCalcFields(DataSet: TDataSet);
Var wEmbalagem : String;
begin
 {if pOperacaoInterna<>3 then
    begin
      QItemNFdesc_tributacao.Value := DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCod_Tributacao.Value));
      QItemNFnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
      QItemNFnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QItemNFCod_Lote_Tipo.Value));
    end;
 MUDEI O CALCFIELDS PELO COMPONENTE DBDIRCEU }
// if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DAMBONI' Then
//    exit;

 if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'NIR')  Then
  begin
    QItemNFnum_fabricante.Value := DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value),True);
    QItemNFnum_ncm.Value := DMOracle.FastSelect('NUM_GENERO_NCM', 'TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value),true);
  end;
  if QItemNFPERC_BENEFICIADO.Value > 0 then
    QItemNFQt_Beneficiado.Value := QItemNFQt_Quantidade.Value * QItemNFPERC_BENEFICIADO.Value / 100
  else
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' Then
     Begin
       wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value), True);
       if Trim(wEmbalagem) = '' then
         wEmbalagem := '1'
       else
       QItemNFQt_Beneficiado.Value := QItemNFQt_Quantidade.Value * StrToFloat(wEmbalagem);
     End
    Else
       QItemNFQt_Beneficiado.Value := QItemNFQt_Quantidade.Value;
  if (QItemNFCOD_PRODUTO.Value > 0) and (Trim(QItemNFind_subst_trib.Value) = '') then
  begin
    if DMOracle.FastSelect('IND_SUBST_TRIB', 'TB_PRODUTO','COD_PRODUTO = ' +
      QItemNFCOD_PRODUTO.Text) = 'SIM' then
      QItemNFind_subst_trib.Value :=
        '* Produto com substituição tributária'
      else
        QItemNFind_subst_trib.Clear;
  end;
  //movido para UbibliotecaDB em MyLib com chamada no before post do QItemNF

end;

procedure TDMNotaEntrada.QItemNFAfterPost(DataSet: TDataSet);
//Var wCodigo : Real;
begin
//wCodigo := QItemNFCod_Nota_Item.Value;
//QItemNF.DisableControls;
//QItemNF.Close;
//QItemNF.Open;
//QItemNF.Locate('COD_NOTA_ITEM',wCodigo,[]);
  QItemNF_CalcFields.Close;
  QItemNF_CalcFields.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
  QItemNF_CalcFields.Open;
  
  QSomaItemNota.Close;
  QSomaItemNota.Open;



//QItemNF.EnableControls;
  // ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QAtuBaixaOCBeforeDelete(DataSet: TDataSet);
begin
(*  QAtzItemOC.Close;
  QAtzItemOC.ParamByName('COD_ORDEM_COMPRA_ITEM').AsFloat := QAtuBaixaOCCod_Ordem_Compra_item.Value;
  QAtzItemOC.ParamByName('QT_ACRESCENTAR').AsFloat := -QAtuBaixaOCQt_Baixa.Value;
  QAtzItemOC.ExecSQL;
*)
end;

procedure TDMNotaEntrada.QAtuBaixaOCAfterPost(DataSet: TDataSet);
begin
(*  QAtzItemOC.Close;
  QAtzItemOC.ParamByName('COD_ORDEM_COMPRA_ITEM').AsFloat := QAtuBaixaOCCod_Ordem_Compra_item.Value;
  QAtzItemOC.ParamByName('QT_ACRESCENTAR').AsFloat := QAtuBaixaOCQt_Baixa.Value;
  QAtzItemOC.ExecSQL;
*)
end;

procedure TDMNotaEntrada.AtualizaEstoque(wCod_Nota: Integer; wTipoAtualizacao: Integer);
var
  wCustoItem, wBaixa, wPis, wCofins, wVal_Desconto, wTotalNota: Real;
  wCod_Lote_Aux, wFilial_Estoque: Integer;
  wCreditoICMS, wContribuinteIPI: string;
  wPisIsento, wCofinsIsento: Boolean;
  wDespesaSped: double;
begin
  wTotalNota := 0;
  QitemNF.Open;
  QitemNF.First;
  wPisIsento := false;
  wCofinsIsento := false;
  while not QItemNF.Eof do
  begin
    wTotalNota := QItemNFVAL_TOTAL.Value + wTotalNota;
    QItemNF.Next;
  end;
  if wTotalNota = 0 then
    wTotalNota := 1; // para o caso e notas com valor zerado dava erro na divisao do custo
  //wVal_Desconto := 0;
  if QNotaEntradaCod_Nota_Cab.Value <> wCod_Nota then
  begin
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCod_Nota);
    QNotaEntrada.Open;
    QItemNf.Open;
  end;
  wCreditoICMS := DMOracle.BuscaNome('SELECT IND_CREDITO_ICMS FROM TB_FILIAL', 'COD_FILIAL =' + QNotaEntradaCOD_FILIAL.Text);
  wContribuinteIPI := DMOracle.BuscaNome('SELECT IND_IPI FROM TB_FILIAL','COD_FILIAL = ' + QNotaEntradaCOD_FILIAL.Text);
  // Verificar Estoque

  // Despesas estão sendo calculadas desta forma no sped
  wDespesaSped := 0;
  wDespesaSped := StrToFloat(DMOracle.FastSelect('NVL(VAL_DESPESAS,0)', 'TB_NOTA_CAB'
    , 'COD_NOTA_CAB = ' + QItemNFCOD_NOTA_CAB.Text));
  wDespesaSped := (wDespesaSped/QItemNF.RecordCount);
  QItemNF.First;
  while not QItemNF.Eof do
  begin
    wPis := 0;
    wCofins := 0;
   // Valor do Frete no Item já está sem ICM do Frete
   // if QSomaItemNotaSVAL_TOTAL.Value <> 0 then
   //   wVal_Desconto := QNotaEntradaVal_Desconto.Value / QSomaItemNotaSVAL_TOTAL.Value * QItemNFVal_Total.Value;

    //Se o CST for de isenção o valor de pis e cofins deve sair zerado
    if QItemNFCOD_CST_PIS.Value <> '' then
      wPisIsento := (StrToInt(QItemNFCOD_CST_PIS.Value) in [61,65,70,71,72,73,74])
    else
      wPisIsento := true;
    if QItemNFCOD_CST_COFINS.Value <> '' then
      wCofinsIsento := (StrToInt(QItemNFCOD_CST_COFINS.Value) in [61,65,70,71,72,73,74])
    else
      wCofinsIsento := true;
    if DMOperacao.QOperacaoIND_SERVICO.Value = 'S' then //Para nota entrada de serviço precisa ficar o valor de pis/confins informado manualmente. Junior 20/03/2025 - Odirlei Moinho São Miguel.
    begin
      wPis    := QItemNFVAL_PIS.Value;
      wCofins := QItemNFVAL_CONFINS.Value;
    end;
    if DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 then
    begin
      if QItemNFVAL_BC_DI.Value > 0 then
        wPis := (QItemNFVAL_BC_DI.Value * DMParamSistema.QParamSistemaPerc_Pis.Value) / 100
      else
        if wPisIsento then
          wPis := 0
        else
        begin
{Alterado para o codEmpresa Moinho SMI para que o valor do Icms não entre no calculo do Pis e Cofins Valido para empresa do Lucro Real.
Solicitado por Odirlei. Alex 11/05/2024.
Adicionado CodEmpresa BRFERRO, solicitado por Odirlei. 19/02/2026}
          if (DMParamSistema.CodEmpresa <> 'SM') and (DMParamSistema.CodEmpresa <> 'BRFERRO') then
          begin
            if QItemNFIND_DESCONTA_ICMS_ST_PISCOFINS.Value = 'SIM' then
              wPis := ((QItemNFVal_Total.Value - QItemNFVAL_DESCONTO_RATEIO.Value - QItemNFVAL_ICMS_SUBST.Value) *
                  (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) * DMParamSistema.QParamSistemaPerc_Pis.Value) / 100
            else
              wPis := ((QItemNFVal_Total.Value + wDespesaSped - QItemNFVAL_DESCONTO_RATEIO.Value) *
                  (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) * DMParamSistema.QParamSistemaPerc_Pis.Value) / 100;
          end
          else
            wPis := ((QItemNFVal_Total.Value + wDespesaSped - QItemNFVAL_DESCONTO_RATEIO.Value - QItemNFVAL_ICM.Value) *
                  (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) * DMParamSistema.QParamSistemaPerc_Pis.Value) / 100
        end;

    end;
    if DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 then
    begin
      if QItemNFVAL_BC_DI.Value > 0 then
        wCofins := (QItemNFVAL_BC_DI.Value * DMParamSistema.QParamSistemaPerc_Cofins.Value) / 100
      else
        if wCofinsIsento then
          wCofins := 0
        else
        begin
          if (DMParamSistema.CodEmpresa <> 'SM') and (DMParamSistema.CodEmpresa <> 'BRFERRO') then
          begin
            if QItemNFIND_DESCONTA_ICMS_ST_PISCOFINS.Value = 'SIM' then
              wCofins := ((QItemNFVal_Total.Value - QItemNFVAL_DESCONTO_RATEIO.Value - QItemNFVAL_ICMS_SUBST.Value) *
                  (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) * DMParamSistema.QParamSistemaPerc_Cofins.Value) / 100
            else
              wCofins := ((QItemNFVal_Total.Value - QItemNFVAL_DESCONTO_RATEIO.Value) *
                  (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) * DMParamSistema.QParamSistemaPerc_Cofins.Value) / 100;
          end
          else
            wCofins := ((QItemNFVal_Total.Value + wDespesaSped - QItemNFVAL_DESCONTO_RATEIO.Value - QItemNFVAL_ICM.Value) *
                (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) * DMParamSistema.QParamSistemaPerc_Cofins.Value) / 100
        end;
    end;
    // Para notas de importação o cálculo de pis e cofins deve ser diferente
    if (copy(DMOperacao.QOperacaoNUM_NATUREZA_INT_NOVO.Text,1,1) = '3') or
      (copy(Trim(QItemNFCOD_CFOP.Text),1,1) = '3') then
    begin
      wPis := (((QItemNFVAL_BC_DI.Value * DMOperacao.QOperacaoPerc_Base_Pis.Value) / 100) *
        DMParamSistema.QParamSistemaPERC_PIS.Value) / 100;
      wCofins := (((QItemNFVAL_BC_DI.Value * DMOperacao.QOperacaoPerc_Base_Cofins.Value) / 100) *
        DMParamSistema.QParamSistemaPERC_COFINS.Value) / 100;
    end;
    // fim de cálculo de pis e cofins importação-----------------------------

    if (QItemNFVal_Custo.Value <> 0) and (DMOperacao.QOperacaoInd_Vendas.Value = 'D') then
   // quando o val_custo estiver preenchido significa que veio de uma nota de devolucao pegou o custo da nota fiscal de venda
   //     If Not(PVoltaConfirmacao) Then
   //        wCustoItem := QItemNFVal_Custo.Value * QItemNFQt_Quantidade.Value
   //     Else
    begin
       //quando é feita a confirmação da nota, deve ser multiplicado o valor do custo
       //pela quantidade. e na hora da volta da confirmação deve dividir o custo pela quantidade
       //para nao ter problema na próxima confirmação, multiplicar novamente o custo e
       //gerar um valor de custo errado.
      if not (PVoltaConfirmacao) then
        wCustoItem := QItemNFVal_Custo.Value * QItemNFQt_Quantidade.Value
      else
      begin
         //TEVE QUE USAR COMANDO SQL DIRETAMENTE, POIS DAVA PROBLEMA AO DAR O POST NO QitemNF
        if QItemNFQt_Quantidade.Value <> 0 then
        begin
          DMOracle.QExecSQL.close;
          DMOracle.QExecSQL.SQL;
          DMOracle.QExecSQL.sql.Clear;
          DMOracle.QExecSQL.sql.Add('UPDATE TB_NOTA_ITEM SET VAL_CUSTO = ' +
            Bib.TrocaVirgulaPorPonto(FloatToStr(QItemNFVal_Custo.Value / QItemNFQt_Quantidade.Value)) +
            ' WHERE COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text);
          DMOracle.QExecSQL.ExecSQL;

          wCustoItem := QItemNFVal_Custo.Value / QItemNFQt_Quantidade.Value;
        end;
      end;
    end
    else
    Begin
      if wCreditoICMS = 'NAO' then
       begin
         wCustoItem := (QItemNFVal_Total.Value
            - QItemNFVAL_DESCONTO_RATEIO.Value
            + QItemNFVal_Despesas.Value
            + QItemNFVal_Ipi.Value
            + QItemNFVal_Frete.Value);
       end;
      if wCreditoICMS = 'SIM' then
       begin
         wCustoItem := (QItemNFVal_Total.Value
            - QItemNFVAL_DESCONTO_RATEIO.Value
            + QItemNFVal_Despesas.Value
            + QItemNFVal_Ipi.Value
            - QItemNFVal_ICM.Value
            + QItemNFVal_Frete.Value);
  //          + ((((QItemNFVAL_TOTAL.Value * 100) / wTotalNota) * QNotaEntradaVAL_SUBST_TRIBUT.Value) / 100));
        end;
      //tirar o IPI do custo somente para contribuintes de IPI. Solicitado Marcos/César. Junior - 12/06/2019.  
      if wContribuinteIPI = 'S' then
      begin
        If (QItemNFCOD_CST_IPI.Value = '00') Or (QItemNFCOD_CST_IPI.Value = '01') Then
          wCustoItem := wCustoItem - QItemNFVal_Ipi.Value; // esta retirando o IPI do custo para as empresas que tem credito - lucro real
      end;
      If DMParamSistema.QParamSistemaIND_PIS_COFINS_CUSTO.Value = 'S' Then
         wCustoItem := wCustoItem - wPis - wCofins;

      If QItemNFVAL_ICMS_SUBST.Value > 0 Then
      begin
        with DMCadastro, DMTributacao do
        begin
          QCadastro.Close;
          QCadastro.SetVariable('PK', QNotaEntradaCOD_CADASTRO.Value);
          QCadastro.Open;
          QTributacao.Close;
          QTributacao.SetVariable('PK', QItemNFCOD_TRIBUTACAO.Value);
          QTributacao.Open;
          // Se possui CST de substituição tributária anterior, não deve alterar o valor da nota
          if ( (DMParamSistema.CodEmpresa <> 'FERRAGMED')  and (DMParamSistema.CodEmpresa <> 'KREUZ')    and (DMParamSistema.CodEmpresa <> 'DINIZ') and
                (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and (DMParamSistema.CodEmpresa <> 'GGIRARDI') and (DMParamSistema.CodEmpresa <> 'LISTELL') AND
                 (DMParamSistema.CodEmpresa <> 'ARZ')      and (DMParamSistema.CodEmpresa <> 'CASATINTAS')) and
             ( (Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
                or (QTributacaoDESC_CSOSN.Value = '500')
            and
            (
              (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
              and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
            )
          ) then
            wCustoItem := wCustoItem    //não deve considerar ST
          else
            wCustoItem := wCustoItem + QItemNFVAL_ICMS_SUBST.Value
        end;
      end
      Else
         wCustoItem := wCustoItem + ((((QItemNFVAL_TOTAL.Value * 100) / wTotalNota) * QNotaEntradaVAL_SUBST_TRIBUT.Value) / 100);
    End;     
    if QItemNFPERC_BENEFICIADO.Value <> 0 then
      wBaixa := QItemNFQt_Quantidade.Value * QItemNFPERC_BENEFICIADO.Value / 100
    else
      wBaixa := QItemNFQt_Quantidade.Value;
    if PTipo_lote <> 0 then // para resolver problema atualização de estoque
      wCod_lote_Aux := PTipo_lote //de trigo varios lotes  para atualizar lote 1
    else
      wCod_lote_Aux := Trunc(QItemNFCod_Lote_Tipo.Value);
    DMEstoque.AtualizaEstoque(Trunc(QNotaEntradaCod_Operacao.Value),
      QNotaEntradaCod_Filial.Value,
      Trunc(QItemNFCod_Produto.Value),
      wCod_lote_Aux,
      wBaixa * wTipoAtualizacao,
      wCustoItem * wTipoAtualizacao,
      QNotaEntradaDt_Recebimento.Value,
      0,
      QNotaEntradaCod_Cadastro.Text);
    // esta rotina serve para duplicar o custo da mercadoria para filial do Diniz - quando entrada se der na filial
    // com quantidade zeros para filial   - quando volta confirmação campo wTipoAtualizacao esta -1 (neste caso nao atualiza custo)
    If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') And   // césar 24/08/2023
       (wTipoAtualizacao > 0) Then // somente para inclusao de notas na volta confirmação nao executa
     Begin
       If QNotaEntradaCod_Filial.Value = 1 Then
          wFilial_Estoque := 2
       Else
          wFilial_Estoque := 1;
       DMEstoque.Atualiza_Estoque(-3,
         wFilial_Estoque,
         Trunc(QItemNFCod_Produto.Value),
         wCod_lote_Aux,
         0 * wTipoAtualizacao,
         wCustoItem / wBaixa * wTipoAtualizacao,
         QNotaEntradaDt_Recebimento.Value,
         0,
         QNotaEntradaCod_Cadastro.Text);
     End;
    if not (PVoltaConfirmacao) then
    begin
      if not (QNotaEntrada.State in [DsInsert, DsEdit]) then
        QNotaEntrada.Edit;
      QItemNF.Edit;
      QItemNFVal_Custo.Value := wCustoItem;
      QItemNFVal_Pis.Value := RoundTo(wPis, -2);
      QItemNFVal_Confins.Value := RoundTo(wCofins, -2);
      QItemNF.Post;
    end;
    QItemNF.Next;
  end;
end;


procedure TDMNotaEntrada.QContaPagarBeforeDelete(DataSet: TDataSet);
begin
//  if QContaPagarDt_baixa.Value > 0 then   - Comentado por Djeison A. Selzlein - Considerar Situação do Título
    if QContaPagarIND_SITUACAO.Value <> 'ABERTO' then
    raise Exception.Create('Conta Pagar já baixado!'
      + Chr(13) + 'Exclusão Não Permitida!');
end;

procedure TDMNotaEntrada.QNotaEntradaAfterPost(DataSet: TDataSet);
var
  wCodigo: Integer;
begin
  if PContabiliza_Extra = 'N' then // Propriedade Setada na Rotina FContabilidadeParam
  begin
    wCodigo := QNotaEntradaCod_Nota_Cab.Value;
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCodigo);
    QNotaEntrada.Open;
    SetaPendenciaInterna(0);
  end;
end;


procedure TDMNotaEntrada.QNotaEntradaCOD_VENDEDORValidate(Sender: TField);
// Var wTipoComissao : Integer;
begin
{
  wTipoComissao := StrtoInt(DMOracle.BuscaNome('SELECT IND_TIPO_COMISSAO FROM TB_PARAM_SISTEMA','COD_FILIAL > 0 '));
  If wTipocomissao in [ 1,6] then // Vendedor ou Media Vendedor
  Try
    QItemNF.DisableControls;
    QItemNF.First;
    While not QItemNF.EOF do
    Begin
      QItemNF.Edit; // Força Recalcula da Comissão
      QItemNF.Post;
      QItemNF.Next;
    End;
  Except
  End;
  QItemNF.EnableControls;
}
end;

procedure TDMNotaEntrada.ValidaContaPagar(wCod_Nota: Integer; wListaParcela: TStrings; wFinalidade: Real; wTipoCP: string);
var
  wTotalParcelas: Real;
  wCont: Integer;
  wAux: string;
  wTotalImposto: Real;
  wTotal: Real;
begin
  wAux := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO', 'COD_NOTA_CAB = ' + inttostr(wCod_Nota));
  wTotalImposto := strtofloat(wAux);
  if QNotaEntradaCod_Nota_Cab.Value <> wCod_Nota then
  begin
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCod_Nota);
    QNotaEntrada.Open;
  end;
  wTotalParcelas := 0;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    wAux := Copy(wListaParcela[wCont], 13, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;
  QSomaItemNota.Close;
  QSomaItemNota.Open;
  if wTipoCP = 'NOTA' then
  begin
    if QNotaEntradaCOD_CONTRATO_GP_MOV.Text = '' then // nota agricola gerada no contrato de garantia de preco
    begin
      wTotal := QSomaItemNotasVal_total_nota.Value - QSomaItemNotaSVAL_DPI_TRANSGENICOS.Value - QNotaEntradaVal_AVista.Value - wTotalImposto - QSomaItemNotaSVal_Facs.Value - QSomaItemNotaSVal_Fethab.Value;
      if not Bib.ComparaNumero(wTotalParcelas, wTotal, 2) then
        raise Exception.Create('Soma das parcelas diferente do valor total da Nota!' + #1310 + 'Total da Nota: ' + FormatFloat('#,##0.00', wTotal));
    end
    else
    begin
      wTotal := QSomaItemNotasval_total_nota.Value - QSomaItemNotaSVAL_DPI_TRANSGENICOS.Value - QNotaEntradaVal_AVista.Value + QNotaEntradaVal_Desconto.Value - wTotalImposto - QSomaItemNotaSVal_Facs.Value - QSomaItemNotaSVal_Fethab.Value;
      if not Bib.ComparaNumero(wTotalParcelas, wTotal, 2) then
        raise Exception.Create('Soma das parcelas diferente do valor total da Nota!' + #1310 + 'Total da Nota: ' + FormatFloat('#,##0.00', wTotal));
    end;
  end
  else if wTipoCP = 'NOTA_AGRICOLA' then
  begin
    wTotal := QSomaItemNotasval_total_nota.Value - QSomaItemNotaSVAL_DPI_TRANSGENICOS.Value - QNotaEntradaVal_AVista.Value + QNotaEntradaVal_Desconto.Value - wTotalImposto - DMNotaEntrada.QNotaEntradaVal_Desconto_Fitas.Value - QSomaItemNotaSVal_Facs.Value - QSomaItemNotaSVal_Fethab.Value;
    if not Bib.ComparaNumero(wTotalParcelas, wTotal, 2) then
      raise Exception.Create('Soma das parcelas diferente do valor total da Nota!' + #1310 + 'Total da Nota: ' + FormatFloat('#,##0.00', wTotal));
  end
  else
  begin
    wTotal := QNotaEntradaVal_Frete.Value - wTotalImposto;
    if not Bib.ComparaNumero(wTotalParcelas, wTotal, 2) then
      raise Exception.Create('Soma das parcelas diferente do valor do Frete!' + #1310 + 'Total da Nota: ' + FormatFloat('#,##0.00', wTotal));
  end;
end;


procedure TDMNotaEntrada.GeraContaPagar(wCod_Nota: Integer; wListaParcela: TStrings; wFinalidade, wFormaPagto: Integer; wTipoCP, wDepartamento: string; wCodSerie: string; wNumParcela, wCodObra: integer; wPontualidade, wAntecipacao, wSintegra: string);
var
  wCont, wParcela: Integer;
  wAux, wNumTitulo, wObservacao: string;
  wTotalItens: Real;
begin
  if QNotaEntradaCod_Nota_Cab.Value <> wCod_Nota then
  begin
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCod_Nota);
    QNotaEntrada.Open;
    QItemNf.Open;
  end;
  if QNotaEntrada.State <> dsEdit then
    QNotaEntrada.Edit;
  wParcela := wListaParcela.Count;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    QContaPagar.Open;
    try
      QContaPagar.Insert;
      QContaPagarCOD_OBRA.Value := QNotaEntradaCOD_OBRA.Value;
      QContaPagarCOD_CONTA_PAGAR_CAB.Value := DMOracle.Sequencia('CONTA_PAGAR');
      QContaPagarCOD_FINALIDADE.Value := wFinalidade;
      if wTipoCP = 'NOTA' then
      begin
        QContaPagarCOD_CADASTRO.Value := QNotaEntradaCod_Cadastro.Value;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then // foi o joao da contabilidade que pediu
          QContaPagarDT_EMISSAO.Value := QNotaEntradaDt_Recebimento.Value
        else
          QContaPagarDT_EMISSAO.Value := QNotaEntradaDt_Emissao.Value;
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont1 = 1) and
          (DMNotaEntrada.QItemNFIND_CUSTO.Value <> 1)) then
        begin
          wNumTitulo := '8' + copy(IntToStr(QNotaEntradaNum_Nota.Value), 2, 5);
          QContaPagarNUM_TITULO.Value := StrToInt(wNumTitulo);
        end
        else
          QContaPagarNUM_TITULO.Value := QNotaEntradaNum_Nota.Value;
      end
      else
      begin
        if QNotaEntradaCOD_OPERACAO_CF.Text <> '' then // FOI O JEFFERSON QUE PEDIU
          QContaPagarCOD_CADASTRO.Value := QNotaEntradaCod_Transportador.Value
        else
          QContaPagarCOD_CADASTRO.Value := QNotaEntradaCod_Cadastro.Value;
        QContaPagarDT_EMISSAO.Value := QNotaEntradaDt_Emissao_Cf.Value;
        QContaPagarNUM_TITULO.Value := QNotaEntradaNum_Conhecimento_Frete.Value;
      end;
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and (Trim(QNotaEntradaCod_Serie.Value) = 'PE') then
         QContaPagarCOD_FILIAL.Value := 99
      else
         QContaPagarCOD_FILIAL.Value := QNotaEntradaCod_Filial.Value;
      QContaPagarCOD_DEPARTAMENTO.Text := Trim(wDepartamento);
      QContaPagarNUM_PARCELA.Value := wCont + 1 + wNumParcela; //wnumParcela geralmente será passado como 0
      if Trim(wCodSerie) = '' then
         QContaPagarDESC_TIPO_DOCUMENTO.Value := QNotaEntradaCOD_SERIE.Value
      else
         QContaPagarDESC_TIPO_DOCUMENTO.Value := Trim(wCodSerie);
      QContaPagarDT_MOVIMENTO.Value := QNotaEntradaDt_Recebimento.Value;
      QContaPagarDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont], 1, 10));
      if DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' then
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
           QContaPagarDT_CAPITALIZACAO.Value := QNotaEntradaDt_Recebimento.Value
        else
           QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
      else
        QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;

      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont1 = 1) and
         (DMNotaEntrada.QItemNFIND_CUSTO.Value <> 1)) then
      begin
        wTotalItens := QSomaItemNotaSVal_Total.Value;
        wAux := FloatToStr(wTotalItens);
        wAux := FloatToStr((StrToFloat(wAux)) / wParcela);
        //wAux := FloatToStr(StrToFloat(QSomaItemNotaSVAL_TOTAL.Text) / wParcela);

        QContaPagarVAL_TITULO.Value := StrToFloat(wAux);
      end
      else
      begin
        wAux := CopY(wListaParcela[wCont], 11, 15);
        wAux := Bib.LimpaString(wAux, '.');
        QContaPagarVAL_TITULO.Value := StrToFloat(wAux);
      end;
      wAux := Copy(wListaParcela[wCont], 26, 15);
      wAux := Bib.LimpaString(wAux, '.');
      if Trim(wAux) <> '' then
        QContaPagarVal_Indexado.Value := StrToFloat(wAux);
      QContaPagarCOD_NOTA_CAB.Value := QNotaEntradaCod_Nota_Cab.Value;
      QContaPagarIND_ACEITE.Value := 'NAO';
      QContaPagarIND_SITUACAO.Value := 'ABERTO';
      QContaPagarVAL_ORIGINAL.Value := QContaPagarVal_Titulo.Value;
      if Trim(wPontualidade) <> '' then
        QContaPagarPerc_Desc_Pontualidade.Value := StrToFloat(Trim(wPontualidade));
      if Trim(wAntecipacao) <> '' then
        QContaPagarPerc_Desc_Antecipacao.Value := StrToFloat(Trim(wAntecipacao));

      wAux := Copy(wListaParcela[wCont], 42, 4);
      if Trim(wAux) <> '' then
        QContaPagarCod_Banco_Pgto.Value := StrToInt(Trim(wAux));
      wAux := Copy(wListaParcela[wCont], 47, 6);
      if Trim(wAux) <> '' then
        QContaPagarCod_Agencia.Value := Trim(wAux);
      wAux := Copy(wListaParcela[wCont], 54, 10);
      if Trim(wAux) <> '' then
        QContaPagarCod_Conta_Corrente_Pgto.Value := Trim(wAux);
      wAux := Copy(wListaParcela[wCont], 65, 18);
      if Trim(wAux) <> '' then
        QContaPagarDesc_Cnpj_Cpf_Pgto.Value := Trim(wAux);
      wAux := Copy(wListaParcela[wCont], 84, 30);
      if Trim(wAux) <> '' then
        QContaPagarDesc_Nome_Titular_Conta.Value := Trim(wAux);
      QContaPagarDesc_Observacao.Value := QNotaEntradaDESC_OBS_CORPO_NOTA.Value;
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL') and
        ((wFinalidade = 17) or (wFinalidade = 23)) then // somente para as fixacoes
        if QItemNfCod_Produto.Text <> '' then
        begin
          wObservacao := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value), True);
          QContaPagarDesc_Observacao.Value := 'Fixação de: ' + IntToStr(Trunc(QItemNFQt_Quantidade.Value)) + ' Kgs De ' + Trim(wObservacao) + ' a ' + QItemNFVal_Unitario.Text + ' Por Kg';
        end;
      case wFormaPagto of
        0: QContaPagarInd_Forma_Pagamento.Value := 'Bloqueto';
        1: QContaPagarInd_Forma_Pagamento.Value := 'Deposito';
        2: QContaPagarInd_Forma_Pagamento.Value := 'Cheque';
        3: QContaPagarInd_Forma_Pagamento.Value := 'Dinheiro';
        4: QContaPagarInd_Forma_Pagamento.Value := 'Debito Automatico';
        5: QContaPagarInd_Forma_Pagamento.Value := 'Adiantamento';
        6: QContaPagarInd_Forma_Pagamento.Value := 'Devolução';
        7: QContaPagarInd_Forma_Pagamento.Value := 'Sem Pagamento';
      end;

      if wSintegra <> '' then
        QContaPagarDESC_COMPLEMENTO_SINTEGRA.Value := wSintegra;
      QContaPagarDT_Usuario.Value := DMOracle.DataHoraServ;
      QContaPagarCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      QContaPagar.Post;
      QContaPagarMov.Open;
      QContaPagarMov.Insert;
      QContaPagarMovCod_Conta_Pagar_Cab.Value := QContaPagarCod_Conta_Pagar_Cab.Value;
      QContaPagarMovCod_Conta_Pagar_Mov.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
      QContaPagarMovDt_Movimento.Value := QNotaEntradaDt_Recebimento.Value;
      QContaPagarMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
      QContaPagarMovDT_Usuario.Value := DMOracle.DataHoraServ;
      QContaPagarMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      QContaPagarMovVal_Movimento.Value := QContaPagarVal_Titulo.Value;
      QContaPagarMov.Post;
    except
      if QContaPagarMov.State in [dsEdit, dsInsert] then
        QContaPagarMov.Cancel;
      if QContaPagar.State in [dsEdit, dsInsert] then
        QContaPagar.Cancel;
      raise;
    end;
  end;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont1 = 0) and
      (DMNotaEntrada.QItemNFIND_CUSTO.Value <> 1)) then
  begin
    inc(wCont1);
    DMNotaEntrada.GeraContaPagar(wCod_Nota, wListaParcela, wFinalidade, 1, wTipoCP, '2', wCodSerie, wNumParcela, wCodObra, wPontualidade, wAntecipacao, '');
  end;
  QContaPagarMov.Close;
  QContaPagar.Close;
  wCont1 := 0;
end;

procedure TDMNotaEntrada.VoltaConfirmacao(wCod_Nota: Integer; wIndTrans: string; wIndSituacao: string);
var
  wComando, wSituacao, wAux, wCodLoteTipoVei, wQtdeVei: string;
begin
  PVoltaConfirmacao := True;
  QNotaEntrada.Close;
  QNotaEntrada.SetVariable('PK', wCod_Nota);
  QNotaEntrada.Open;
  if DMNotaEntrada.QNotaEntradaInd_Situacao.Value <> '2' then
    raise Exception.Create('Esta nota não foi confirmada!');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(wCod_Nota));
  if (wSituacao <> '') and (wSituacao <> '1') then
    raise Exception.Create('Esta nota Possui RPA Emitido - Não Foi possível voltar confirmação');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO_FRETE', 'COD_NOTA_CAB =' + FloatToStr(wCod_Nota));
  if (wSituacao <> '') and (wSituacao <> '1') then
    raise Exception.Create('Conhecimento de Frete Já Confirmado - Não Foi possível voltar confirmação da Nota');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO', 'COD_NOTA_CAB =' + FloatToStr(wCod_Nota));
  if (wSituacao <> '') and (wSituacao <> '1') then
    raise Exception.Create('Conhecimento de Frete Já Confirmado - Não Foi possível voltar confirmação da Nota');
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK', QNotaEntradaCod_Operacao.Value);
  DMOperacao.QOperacao.Open;
  with DMNotaEntrada do
  begin
    try
      if wIndTrans = 'S' then
        DMOracle.DBCemapa.StartTransaction;
      // 1.Atualizar Nota Fiscal
      QAtzNota.Close;
      QAtzNota.SetVariable('COD_NOTA_CAB', wCod_Nota);
      QAtzNota.Open;
      QAtzNota.Edit;

      QAtzNotaInd_Situacao.Value := wIndSituacao; // Digitada
      //QAtzNotaInd_Situacao.Value := '1'; // Digitada

      {---------------------------------------------------------------------------
       Na volta da confirmação da nota de entrada, o valor de desconto sai do itens e do cabeçalho. Por este motivo foi
                                                             comentado a linha de baixo. - Junior - 03/03/2014}
     // QAtzNotaVAL_DESCONTO.Value := 0;
      {--------------------------------------------------------------------------}
      
      QAtzNota.Post;

      // 2.Atualizar Estoque
      DMNotaEntrada.AtualizaEstoque(QNotaEntradaCod_Nota_Cab.Value, -1);
      // 3.Voltar Conta Pagar
      try
        QContaPagar.Close;
        QContaPagar.Open;
        
        while not QContaPagar.Eof do
        begin
          QContaPagarMov.Close;     
          QContaPagarMov.Open;
          while not QContaPagarMov.Eof do
          begin
            if (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
              raise Exception.Create('Conta a Pagar com baixas!')
            else
              QContaPagarMov.Delete;
          end;
          QContaPagar.Delete;
        end;
      except
        ShowMessage('Não foi possivel voltar Contas a Pagar!');
        raise;
      end;

      wAux := '';
      // 6.Voltar Futura
      QItemNF.First;
      while not QItemNF.Eof do
      begin
        if (QItemNFInd_Bx_Contr_Vend.Value = 'S') and (QNotaEntradaCod_Contrato_Gp_Mov.Text = '')
          and (QNotaEntradaCod_Contrato_Mov.Text = '') then
          raise Exception.Create('Nota Com Lançamento em Contrato de Venda!'
            + Chr(13) + 'Cancele a Nota do Contrato Primeiro!');
        QBaixaAux.Close;
        QBaixaAux.SetVariable('COD_NOTA_ITEM', QItemNfCOD_NOTA_ITEM.Value);
        QBaixaAux.Open;
        QNotaAuxItNF.Close;
        QNotaAuxItNF.Open;
        while not QBaixaAux.Eof do
          QBaixaAux.Delete;
        while not QNotaAuxItNF.Eof do
        begin
          if (QNotaAuxItNFQt_Atendido.Value
            + QNotaAuxItNFQt_Cancelado.Value
            + QNotaAuxItNFQt_Devolvido.Value) > 0 then
            raise Exception.Create('Nota Global com entregas já efetuadas!'
              + Chr(13) + 'Cancele as Notas de Remessa primeiro!');
          QNotaAuxItNF.Delete;
        end;
        // *** Saldo agricola fixado ****
        QVoltaSaldoFixado.Close;
        QVoltaSaldoFixado.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
        QVoltaSaldoFixado.ExecSQL;

        //Para voltar Custo Veiculo
        wAux := wAux + QItemNFCOD_NOTA_ITEM.Text + ', ';
        if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then //Voltar Estoque
        begin
          wCodLoteTipoVei := DMOracle.FastSelect('COD_LOTE_TIPO','TB_CUSTO_VEICULO_MOV','COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text);
          wQtdeVei := DMOracle.FastSelect('QT_QUANTIDADE','TB_CUSTO_VEICULO_MOV','COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text);
          if wCodLoteTipoVei <> '' then
            DMEstoque.AtualizaEstoque(-2,1,QItemNFCOD_PRODUTO.Value,StrToInt(wCodLoteTipoVei),StrToInt(wQtdeVei),0,0,0,'');
        end;
        QItemNF.Next;
      end;
      //Custo Veiculo
      wAux := Copy(wAux, 1, Length(wAux) - 2);
      if wAux <> '' then
        DMOracle.ExecutaSql('DELETE FROM TB_CUSTO_VEICULO_MOV WHERE COD_NOTA_ITEM IN (' + wAux + ')', False);

      QBaixaAux.Close;
      QNotaAuxItNF.Close;

      // Descontabilizar
      DMPlanilha.DesContabiliza(Trunc(QNotaEntradaCod_Nota_Cab.Value), 'NFE');

      // volta caixa
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_CAIXA_MOV';
        wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(wCod_Nota);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;

      // Nota conhecimento de frete
      with DMOracle do
      begin
        DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO.Value), True);
        if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_PAGAMENTO SET IND_CONFIRMADO = '+QuotedStr('N');
          wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaEntradaCod_Nota_Cab.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        end
        else
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'DELETE FROM TB_PAGAMENTO';
          wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaEntradaCod_Nota_Cab.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        end;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_CONHECIMENTO_FRETE';
        wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(wCod_Nota);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        if QNotaEntradaCod_Ordem_Carregamento_Cab.Text <> '' then
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' + Chr(39) + 'A' + Chr(39);
          wComando := wComando + ' WHERE COD_ORDEM_CARREGAMENTO_CAB = ' + QNotaEntradaCod_Ordem_Carregamento_Cab.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        end;
        if QNotaEntradaVal_Desconto_Fitas.Value > 0 then
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_FITAS SET IND_BAIXADO = ' + Chr(39) + 'NAO' + Chr(39) + ' WHERE COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text);
          QExecSQL.ExecSQL;
        end;
      end;
      // Voltar Ordem de Compra
      AtuOrdemCompra(-1);
      DMObra.QObra_Req_Cab.Close;
      DMObra.QObra_Req_Item.Close;
      DMObra.QObra_Req_Cab.SetVariable('Pk',QNotaEntradaCod_Obra_Req_Cab.Value);
      DMObra.QObra_Req_Cab.Open;
      If Not(DMObra.QObra_Req_Cab.Eof) Then
       Begin
         DMObra.QObra_Req_Item.Open;
         While Not (DMObra.QObra_Req_Item.Eof) Do
            DMObra.QObra_Req_Item.Delete;
         DMObra.QObra_Req_Cab.Delete;
       End;
      DMObra.QObra_Req_Cab.Close;
      DMObra.QObra_Req_Item.Close;
//      QNotaEntrada.Post;
      if wIndTrans = 'S' then
        DMOracle.DBCemapa.Commit;

      QNotaEntrada.Close;
      QNotaEntrada.Open;
      PVoltaConfirmacao := False;

    except
      if wIndTrans = 'S' then
        DMOracle.DBCemapa.RollBack;
      QNotaEntrada.Close;
      QNotaEntrada.Open;
      PVoltaConfirmacao := False;
      raise;
    end;
  end;
end;

procedure TDMNotaEntrada.VoltaCancelamento(WCod_Nota: Integer);
begin
  if QNotaEntradaCod_Nota_Cab.Value <> wCod_Nota then
  begin
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCod_Nota);
    QNotaEntrada.Open;
  end;
  if DMNotaEntrada.QNotaEntradaInd_Situacao.Value <> '3' then
    raise Exception.Create('Esta nota não foi cancelada!');
  with DMNotaEntrada do
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      QAtzNota.Close;
      QAtzNota.SetVariable('COD_NOTA_CAB', WCod_Nota);
      QAtzNota.Open;
      QAtzNota.Edit;
      QAtzNotaInd_Situacao.Value := '1';
      QAtzNotaCod_Motivo_Canc.Clear;
      QAtzNota.Post;

      (*
      QAtuBaixaOC.Open;
      QItemNF.First;
      While not QItemNF.Eof do
      Begin
        QAtzItemOC.Close;
        QAtzItemOC.ParamByName('COD_ORDEM_COMPRA_ITEM').AsFloat := QAtuBaixaOCCod_Ordem_Compra_item.Value;
        QAtzItemOC.ParamByName('QT_ACRESCENTAR').AsFloat := QAtuBaixaOCQt_Baixa.Value;
        QAtzItemOC.ExecSQL;
        QItemNF.Next;
      End;
      *)

      DMOracle.DBCemapa.Commit;
      QNotaEntrada.Close;
      QNotaEntrada.Open;
    except
      if QAtzNota.State <> dsBrowse then
        QAtzNota.Cancel;
      raise Exception.Create('Não é possível voltar cancelamento desta nota!');
    end;
  end;
end;

procedure TDMNotaEntrada.IncluiNotaAux;
var
  wTipoFutura: string;
  wQtAux: Real;
begin
  wTipoFutura := '';
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK', QNotaEntradaCod_Operacao.Value);
    QOperacao.Open;
    if QOperacaoInd_Futura_Fornecedor.Value = 'C' then // Operacao de Compra Futura
      wTipoFutura := wTipoFutura + 'COM_FUT';
    if QOperacaoInd_Consignacao_Fornecedor.Value = 'E' then // Entrada em Consignação
      wTipoFutura := wTipoFutura + 'CON_FOR';
    if QOperacaoInd_Emprestimo_Fornecedor.Value = 'E' then // Entrada por Empréstimo
      wTipoFutura := wTipoFutura + 'EMP_FOR';

    if QOperacaoInd_Deposito_Empresa.Value = 'E' then // Entrada para depósito
      wTipoFutura := wTipoFutura + 'DEP_EMP';

    if wTipoFutura <> '' then // Operacao Futura
    begin
      if Length(wTipoFutura) > 7 then
        raise Exception.Create('Operacao inválida. Mais do que uma operacao Futura!');
      QItemNF.First;
      while not QItemNF.EOF do
      begin
        wQtAux := QItemNFQt_Quantidade.Value;
        if QItemNFPerc_Beneficiado.Value > 0 then
          wQtAux := wQtAux * QItemNFPerc_Beneficiado.Value / 100;
        QNotaAux.Open;
        QNotaAux.Insert;
        QNotaAuxCod_Nota_Aux.Value := DMOracle.Sequencia('NOTA_AUX');
        QNotaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
        QNotaAuxCod_Produto.Value := QItemNFCod_Produto.Value;
        QNotaAuxQt_Devolvido.Value := 0;
        QNotaAuxQt_Atendido.Value := 0;
        QNotaAuxQt_Cancelado.Value := 0;
        QNotaAuxQt_Nota_Item.Value := wQtAux;
        QNotaAuxInd_Tipo.Value := wTipoFutura;
        QNotaAux.Post;
        QItemNF.Next;
      end;
    end;
  end;
end;

procedure TDMNotaEntrada.QBaixaAuxBeforeDelete(DataSet: TDataSet);
var
  wTipoAtu: string;
begin
  wTipoAtu := DMNotaEntrada.TipoAtzNotaAux('E');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX', QBaixaAuxCod_nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  if wTipoAtu = 'ATENDIMENTO' then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value - QBaixaAuxQt_Quantidade.Value;
  if wTipoAtu = 'DEVOLUCAO' then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value - QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
  QNotaAux.Close;
end;

procedure TDMNotaEntrada.QBaixaAuxBeforeEdit(DataSet: TDataSet);
begin
  raise Exception.Create('Alteracao não suportada!');
end;

procedure TDMNotaEntrada.QBaixaAuxAfterPost(DataSet: TDataSet);
var
  wTipoAtu: string;
begin
  wTipoAtu := DMNotaEntrada.TipoAtzNotaAux('E');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX', QBaixaAuxCod_Nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  if wTipoAtu = 'ATENDIMENTO' then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value + QBaixaAuxQt_Quantidade.Value;
  if wTipoAtu = 'DEVOLUCAO' then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value + QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
  QNotaAux.Close;
end;

function TDMNotaEntrada.TipoAtzNotaAux(wEntradaSaida: string): string;
begin
  with DMOperacao do
  begin
    if wEntradaSaida = 'E' then
    begin
      if QOperacaoInd_Futura_Cliente.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Futura_Fornecedor.Value = 'S' then
        Result := 'ATENDIMENTO';
      if QOperacaoInd_Consignacao_Cliente.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Emprestimo_Cliente.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Deposito_Empresa.Value = 'S' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Deposito_Outras.Value = 'E' then
        Result := 'DEVOLUCAO';
    end;
  end;
end;

procedure TDMNotaEntrada.RateiaCabecalho;
var
  wICMFrete, wVal_Desconto, wVal_Despesas: Extended;
begin
  if QItemNFCod_Produto.Text = '' then // foi colocado porque estava dando problema - césar 17/09/2010
    Exit;
  with DMTributacao do
  begin
    QTributacao.Close;
    QTributacao.SetVariable('PK', QNotaEntradaCod_Tributacao_Frete.Value);
    QTributacao.Open;
    wICMFrete := (QNotaEntradaVal_Frete.Value * QTributacaoPerc_Tributado.Value / 100)
      * QTributacaoPerc_Aliquota.Value / 100;
  end;

  if (QNotaEntradaVal_Frete.Value > 0) or
    (QNotaEntradaVal_Desconto.Value > 0) or
    (QNotaEntradaVal_Despesas.Value > 0) then
  begin
    try
      QItemNF.DisableControls;
      QItemNF.First;
      wVal_Desconto := 0;
      wVal_Despesas := 0;
      if QSomaItemNota.Eof then
        QSomaItemNota.Open;
      while not QItemNF.Eof do
      begin
        QItemNF.Edit;
        QItemNFVal_Frete.Value := (QNotaEntradaVal_Frete.Value - wICMFrete)
          * QItemNFVal_Total.Value / QSomaItemNotaSVal_Total.Value;
   //     QItemNFVal_Desconto.Value := QNotaEntradaVal_Desconto.Value / QSomaItemNotaSVal_Total.Value * QItemNFVal_Total.Value;
   //     wVal_Desconto := wVal_Desconto + StrToFloat(FormatFloat('#0.00', QItemNFVal_Desconto.Value));
        QItemNFVal_Despesas.Value := QNotaEntradaVal_Despesas.Value / QSomaItemNotaSVal_Total.Value * QItemNFVal_Total.Value;
        wVal_Despesas := wVal_Despesas + StrToFloat(FormatFloat('#0.00', QItemNFVal_Despesas.Value));
        if (DMParamSistema.CodEmpresa <> 'KREUZ')     and (DMParamSistema.CodEmpresa <> 'CONKRETA') and
           (DMParamSistema.CodEmpresa <> 'DINIZ')     and (DMParamSistema.CodEmpresa <> 'RETIFOZ2') and
           (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and (DMParamSistema.CodEmpresa <> 'GGIRARDI') and
           (DMParamSistema.CodEmpresa <> 'LISTELL')   and (DMParamSistema.CodEmpresa <> 'CASATINTAS') then //Permanecer o valor de ICMS da importação do xml - 25/02/2022
//Adicionado cod_empresa DINIZ. Saiu do simples e estava recalculando ICMS na nota de entrada. Alex 22/02/2023
          QItemNFVal_ICM_Base.Value := 0 // Força recalcular o Imposto Before Post;
        else // para Kreuz zerar BASE somente para devolução.
          if QNotaEntradaIND_FINALIDADE_NFE.Value = 4 then
            QItemNFVAL_ICM_BASE.Value := 0;

        QItemNF.Post;
        QItemNF.Next;
      end;
      QItemNF.First;
      QItemNF.Edit;
//      if wVal_Desconto <> QNotaEntradaVal_Desconto.Value then
//        QItemNFVal_Desconto.Value := QItemNFVal_Desconto.Value + (QNotaEntradaVal_Desconto.Value - wVal_Desconto);
      if wVal_Despesas <> QNotaEntradaVal_Despesas.Value then
        QItemNFVal_Despesas.Value := QItemNFVal_Despesas.Value + (QNotaEntradaVal_Despesas.Value - wVal_Despesas);
      QItemNF.Post;
    except
      raise;
    end;
    QItemNF.EnableControls;
    // pOperacaoInterna := 0; // Nenhuma Operação em Execução;
  end
  else
  begin
    try
      QItemNF.DisableControls;
      QItemNF.First;
      if QSomaItemNota.Eof then
        QSomaItemNota.Open;
      while not QItemNF.Eof do
      begin
        QItemNF.Edit;
        if QNotaEntradaVAL_DESPESAS.Value = 0 then
          QItemNFVal_Despesas.Value := 0;
        if QNotaEntradaVAL_FRETE.Value = 0 then
          QItemNFVAL_FRETE.Value := 0;
        if (DMParamSistema.CodEmpresa <> 'KREUZ')    and (DMParamSistema.CodEmpresa <> 'CONKRETA')  and
           (DMParamSistema.CodEmpresa <> 'RETIFOZ2') and (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and
           (DMParamSistema.CodEmpresa <> 'GGIRARDI') and (DMParamSistema.CodEmpresa <> 'LISTELL') then //Permanecer o valor de ICMS da importação do xml - 25/02/2022
          QItemNFVal_ICM_Base.Value := 0 // Força recalcular o Imposto Before Post;
        else if QNotaEntradaIND_FINALIDADE_NFE.Value = 4 then //KREUZ zerar base de icms para devolução
          QItemNFVAL_ICM_BASE.Value := 0;
        QItemNF.Post;
        QItemNF.Next;
      end;
    except
      raise;
    end;
    QItemNF.EnableControls;
  end;
end;

procedure TDMNotaEntrada.QItemNFPERC_DESCONTOValidate(Sender: TField);
begin
  //QItemNFVal_Desconto.Value := QItemNFVal_Total.Value*QItemNFPerc_desconto.Value/100;
end;

procedure TDMNotaEntrada.Contabiliza(wCod_Nota: Integer);
var
  wContaDeb, wContaCred, wNome: string;
  wTotalNota: double;
  dia, mes, ano: word;
  wData: TDateTime;
begin
  if QNotaEntradaCod_Nota_Cab.Value <> wCod_Nota then
  begin
    QNotaEntrada.Close;
    QNotaEntrada.SetVariable('PK', wCod_Nota);
    QNotaEntrada.Open;
  end;
  if QNotaEntrada.State <> dsEdit then
    QNotaEntrada.Edit;
  wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaEntradaCod_Cadastro.Value), True);
  with DMOperacao do
  begin
    // Valor da Nota
    if QNotaEntradaCod_Operacao.Value <> QOperacaoCod_Operacao.Value then
    begin
      QOperacao.Close;
      QOperacao.SetVariable('PK', QNotaEntradaCod_Operacao.Value);
      QOperacao.Open;
    end;
    if QNotaEntradaCOD_CADASTRO.Value <> DMCadastro.QCadastroCOD_CADASTRO.Value then
    begin
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK', QNotaEntradaCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
    end;
    if QItemNFCOD_TRIBUTACAO.Value <> DMTributacao.QTributacaoCOD_TRIBUTACAO.Value then
    begin
      DMTributacao.QTributacao.Close;
      DMTributacao.QTributacao.SetVariable('PK', QItemNFCOD_TRIBUTACAO.Value);
      DMTributacao.QTributacao.Open;
    end;
    if DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2' then
      wContaCred := QOperacaoCod_Contabil_Val_Nota_Cred.Value
    else
    begin
      wContaCred := QOperacaoCod_Cont_Val_Nota_Cred_aVista.Value;
      wContaDeb := QOperacaoCod_Contabil_Val_Nota_Deb.Value;
    end;
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then // solicitacao do Joao
      if (DMNotaEntrada.QNotaEntradaIND_CONDICAO_PAGTO.Value = '1') and
        (DMOperacao.QOperacaoCod_Historico_Caixa.Value = 999999) then //contabiliza pelas contas do historico de caixa
      begin
        wContaCred := DMHistorico.QHistoricoConsCod_Contabil_Cred.Value;
        wContaDeb := DMHistorico.QHistoricoConsCod_Contabil_Deb.Value;
      end;

    if DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '1' then
    begin
      if (wContaDeb = '') and (wContaCred <> '') then
      begin
        if FCaixa_Lanc_Cont = nil then
          FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
        if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
          FCaixa_Lanc_Cont.pFilial := 1
        else
          FCaixa_Lanc_Cont.pFilial := QNotaEntradaCod_Filial.Value; ;
        FCaixa_Lanc_Cont.SpeedButton1.Visible := False;
        FCaixa_Lanc_Cont.LbHistorico.Visible := False;
        FCaixa_Lanc_Cont.MeDescContaCredito.Visible := False;
        FCaixa_Lanc_Cont.MeHistorico.Visible := False;
        FCaixa_Lanc_Cont.Label3.Visible := False;
        FCaixa_Lanc_Cont.Label4.Visible := False;
        FCaixa_Lanc_Cont.Label1.Visible := False;
        FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
        FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
        FCaixa_Lanc_Cont.MeCodReduzidoCredito.Visible := False;
        FCaixa_Lanc_Cont.MeContaCredito.Visible := False;
        FCaixa_Lanc_Cont.ShowModal;
        wContaDeb := Trim(FCaixa_Lanc_Cont.MeContaDebito.Text);
      end;

      //Calcula o valor total da nota
      with DMTributacao, DMCadastro do
      begin
        if ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
            or (QTributacaoDESC_CSOSN.Value = '500')
            and
            (
              (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
              and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
            )
          ) then  // Sem ICMS ST
            wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value
          else // Com ICMS ST
            wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value + QSomaItemNotaSVal_Icms_Subst.Value;
      end;
      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        wContaDeb,
        'DEBITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        wTotalNota,
        QNotaEntradaDt_Recebimento.Value,
        wContaCred)
    end
    else
    begin
      wContaDeb := QOperacaoCod_Contabil_Val_Nota_APrazo.Value;
      if (wContaDeb = '') and (wContaCred <> '') then
      begin
        if FCaixa_Lanc_Cont = nil then
          FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
        if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
          FCaixa_Lanc_Cont.pFilial := 1
        else
          FCaixa_Lanc_Cont.pFilial := QNotaEntradaCod_Filial.Value; ;
        FCaixa_Lanc_Cont.SpeedButton1.Visible := False;
        FCaixa_Lanc_Cont.LbHistorico.Visible := False;
        FCaixa_Lanc_Cont.MeDescContaCredito.Visible := False;
        FCaixa_Lanc_Cont.MeHistorico.Visible := False;
        FCaixa_Lanc_Cont.Label3.Visible := False;
        FCaixa_Lanc_Cont.Label4.Visible := False;
        FCaixa_Lanc_Cont.Label1.Visible := False;
        FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
        FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
        FCaixa_Lanc_Cont.MeCodReduzidoCredito.Visible := False;
        FCaixa_Lanc_Cont.MeContaCredito.Visible := False;
        FCaixa_Lanc_Cont.ShowModal;
        wContaDeb := Trim(FCaixa_Lanc_Cont.MeContaDebito.Text);
      end;

      //Calcula o valor total da nota
      with DMTributacao, DMCadastro do
      begin
        if ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
          or (QTributacaoDESC_CSOSN.Value = '500')
          and
          (
            (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
            and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
          )
        ) then  // Sem ICMS ST
          wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value
        else // Com ICMS ST
          wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value + QSomaItemNotaSVal_Icms_Subst.Value
      end;
      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        wContaDeb,
        'DEBITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        wTotalNota,
        QNotaEntradaDt_Recebimento.Value,
        wContaCred);
    end;

    //Calcula o valor total da nota
    with DMTributacao, DMCadastro do
    begin
      if ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
        or (QTributacaoDESC_CSOSN.Value = '500')
        and
        (
          (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
          and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
        )
      ) then  // Sem ICMS ST
        wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value
      else // Com ICMS ST
        wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value + QSomaItemNotaSVal_Icms_Subst.Value
    end;
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      wContaCred,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      wTotalNota,
      QNotaEntradaDt_Recebimento.Value,
      wContaDeb);

    if QNotaEntradaVal_AVista.Value > 0 then
    begin
      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        QOperacaoCod_Cont_Val_Nota_Cred_aVista.Value,
        'CREDITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaEntradaVal_AVista.Value,
        QNotaEntradaDt_Recebimento.Value,
        QOperacaoCod_Contabil_Val_Nota_Deb.Value);
      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        QOperacaoCod_Contabil_Val_Nota_Deb.Value,
        'DEBITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaEntradaVal_AVista.Value,
        QNotaEntradaDt_Recebimento.Value,
        QOperacaoCod_Cont_Val_Nota_Cred_aVista.Value);

    end;
 // 22/08/2008 INICIO  (duplica lancamentos na contabilidade - Questao de devolucao de emprestimo de produto agricola - baixa do emprestimo e saldo a fixar contabil


    //Calcula o valor total da nota
    with DMTributacao, DMCadastro do
    begin
      if ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
        or (QTributacaoDESC_CSOSN.Value = '500')
        and
        (
          (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
          and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
        )
      ) then  // Sem ICMS ST
        wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value
      else // Com ICMS ST
        wTotalNota := QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value + QSomaItemNotaSVal_Icms_Subst.Value
    end;
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value - QNotaEntradaVal_Desconto.Value + QNotaEntradaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaEntradaVal_AVista.Value - QSomaItemNotaSVal_Dpi_Transgenicos.Value - QNotaEntradaVal_Desconto_Fitas.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.Value);

 // 16/12/1999 INICIO  (DESCONTO E FUNRURAL)

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_VAL_FUNRURAL_CRED.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_FunRural.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_VAL_FUNRURAL_DEB.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_VAL_FUNRURAL_DEB.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_FunRural.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_VAL_FUNRURAL_CRED.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_DESC_AFIXAR_CRED.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Desconto.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_DESC_AFIXAR_DEB.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_DESC_AFIXAR_DEB.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Desconto.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCOD_CONTABIL_DESC_AFIXAR_CRED.Value);
// 16/12/1999 FIM

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Val_ICMS_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICM.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Val_ICMS_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Val_ICMS_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICM.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Val_ICMS_Deb.Value);

    // Valor do Frete
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Conhecimento_Frete.Value),
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Frete_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Frete.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Frete_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Conhecimento_Frete.Value),
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Frete_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Frete.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Frete_Cred.Value);

    // ICMS do Frete
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Conhecimento_Frete.Value),
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_ICM_Frete.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Conhecimento_Frete.Value),
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_ICM_Frete.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.Value);
    // BAIXA DE CONTRATOS POR PRODUTO NO AGRICOLA
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Contrato_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Contrato_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Contrato_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value - QNotaEntradaVal_Funrural.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Contrato_Cred.Value);
    // contabilizacao do pis
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Pis_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
      QSomaItemNotaSVal_Pis.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Pis_Cred.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Pis_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
      QSomaItemNotaSVal_Pis.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Pis_Deb.Value);
    // contabilizacao do COFINS
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Cofins_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Cofins.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Cofins_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Cofins_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Cofins.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Cofins_Deb.Value);
    // contabilizacao do valor DPI Transgenicos
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Transgenico_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Dpi_Transgenicos.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Transgenico_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Transgenico_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Dpi_Transgenicos.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Transgenico_Deb.Value);
    // contabilizacao do valor Fitas teste transgenicos
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Fitas_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Desconto_Fitas.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Fitas_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Fitas_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaEntradaVal_Desconto_Fitas.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Fitas_Deb.Value);
    // contabilizacao do valor Facs - agricola imposto MT
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Facs_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Facs.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Facs_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Facs_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Facs.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Facs_Deb.Value);
    // contabilizacao do valor Fethab - agricola imposto MT
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Fethab_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Fethab.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Fethab_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Fethab_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Fethab.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Fethab_Deb.Value);

    // contabilizacao do valor IPI
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_IPI_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_IPI.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_IPI_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_IPI_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_IPI.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_IPI_Deb.Value);

    // contabilizacao do valor ICMS Substituição
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Subst_Deb.Value,
      'DEBITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICMS_SUBST.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Subst_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaEntradaCod_Nota_Cab.Value,
      FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
      QNotaEntradaCod_Filial.Value,
      QOperacaoCod_Contabil_Subst_Cred.Value,
      'CREDITO',
      QNotaEntradaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICMS_SUBST.Value,
      QNotaEntradaDt_Recebimento.Value,
      QOperacaoCod_Contabil_Subst_Deb.Value);

    //Contabiliza o valor das parcelas de ICMS da FCCIA
    if not QFCCIA.IsEmpty then
    begin
      QFCCIA.DisableControls;
      QFCCIA.First;
      DecodeDate(QNotaEntradaDT_EMISSAO.Value, ano, mes, dia);
      while not QFCCIA.Eof do
      begin
        QFCCIAParcelaCredito.Close;
        QFCCIAParcelaCredito.Open;
        while not QFCCIAParcelaCredito.Eof do
        begin
          wData := StrToDate(IntToStr(dia) + '/' + Copy(QFCCIAParcelaCreditoANO_MES_SEQUENCIA.Text, 6, 2) + '/' + Copy(QFCCIAParcelaCreditoANO_MES_SEQUENCIA.Text, 0, 4));
          // Busca o último dia do mês para fazer o lançamento na contabilidade
          wData := StrToDate(DMOracle.FastSelect('LAST_DAY(TO_DATE('+ QuotedStr(DateToStr(wData)) +'))', 'DUAL', '1 = 1'));
          DMPlanilha.GravaLanc('NFE',
            QNotaEntradaCod_Nota_Cab.Value,
            FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
            QNotaEntradaCod_Filial.Value,
            QOperacaoCOD_CONTABIL_FCCIA_DEB.Value,
            'DEBITO',
            QNotaEntradaCod_Cadastro.Value,
            DMOperacao.QOperacaoCod_Historico_Contabil.Value,
            QFCCIAParcelaCreditoVAL_PARCELA.Value,
            wData,
            QOperacaoCOD_CONTABIL_FCCIA_CRED.Value);
          DMPlanilha.GravaLanc('NFE',
            QNotaEntradaCod_Nota_Cab.Value,
            FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
            QNotaEntradaCod_Filial.Value,
            QOperacaoCOD_CONTABIL_FCCIA_CRED.Value,
            'CREDITO',
            QNotaEntradaCod_Cadastro.Value,
            DMOperacao.QOperacaoCod_Historico_Contabil.Value,
            QFCCIAParcelaCreditoVAL_PARCELA.Value,
            wData,
            QOperacaoCOD_CONTABIL_FCCIA_DEB.Value);
          QFCCIAParcelaCredito.Next;
        end;

        QFCCIA.Next;
      end;
      QFCCIA.EnableControls;
    end;

    //contabiliza o valor dos ipostos dos serviços lançados - 01/08/2005 - Fabiano.
    QNotaImpostoServico.close;
    QNotaImpostoServico.open;
    while not QNotaImpostoServico.Eof do
    begin
      wContaCred := DMOracle.BuscaNome('SELECT CONTA_CREDITO FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text, True);
      wContaDeb := DMOracle.BuscaNome('SELECT CONTA_DEBITO  FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text, True);

      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        wContaCred,
        'CREDITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaImpostoServicoVAL_IMPOSTO.Value,
        QNotaEntradaDt_Recebimento.Value,
        wContaDeb);

      DMPlanilha.GravaLanc('NFE',
        QNotaEntradaCod_Nota_Cab.Value,
        FloatToStr(QNotaEntradaNum_Nota.Value) + '-' + QNotaEntradaCod_Serie.Value + '-' + wNome,
        QNotaEntradaCod_Filial.Value,
        wContaDeb,
        'DEBITO',
        QNotaEntradaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaImpostoServicoVAL_IMPOSTO.Value,
        QNotaEntradaDt_Recebimento.Value,
        wContaCred);

      QNotaImpostoServico.Next;
    end;
  end;
end;

procedure TDMNotaEntrada.QNotaEntradaCOD_CADASTROValidate(Sender: TField);
begin
  QNotaEntradaCod_Estado.Value := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaEntradaCod_Cadastro.Value), True);
  If QNotaEntradaCOD_VENDEDOR.IsNull Then
  begin
    if DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaEntradaCod_Cadastro.Value), True) <> '' then
      QNotaEntradaCod_Vendedor.Text := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaEntradaCod_Cadastro.Value), True)
    else
      QNotaEntradaCod_Vendedor.Text := DMOracle.BuscaNome('SELECT COD_VENDEDOR_PADRAO FROM TB_USUARIO', 'COD_USUARIO = ' + FloatToStr(DMUsuario.CodUsuarioCorrente), True);
  end;

end;

procedure TDMNotaEntrada.QNotaEntradaCOD_OPERACAOValidate(Sender: TField);
begin
  if 'N' = DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_OPERACAO',
    'COD_OPERACAO = ' + FloatToStr(QNotaEntradaCod_Operacao.Value), True) then
    raise Exception.Create('Esta Operação não está liberada para uso!');
  // QNotaInd_Entrada_Saida.Value := DMOracle.Buscanome('Select Ind_Tipo_Operacao From Tb_Operacao', 'Cod_Operacao=' + FloatToStr(QNotaCod_Operacao.Value));
end;

procedure TDMNotaEntrada.AtuOrdemCompra(wTipoAtu: Integer);
Var wCod_Obra_Req_Cab : Integer;
begin
  DMNotaEntrada.QItemNF.DisableControls;
  DMNotaEntrada.QItemNF.First;
  If (QNotaEntradaCod_Obra.Text <> '') And
     (wTipoAtu = 1)                    Then  // somente para inclusao
   Begin
     DMObra.QObra_Req_Cab.Open;
     DMObra.QObra_Req_Item.Open;
     wCod_Obra_Req_Cab := DMObra.Func_IncluiObra_Cab(QNotaEntradaDt_Emissao.Value,QNotaEntradaNum_Nota.Value,QNotaEntradaCod_Obra.Value,QNotaEntradaCod_Cadastro.Value,
                                QNotaEntradaCod_Filial.Value,QNotaEntradaCod_Operacao.Value,QNotaEntradaInd_Condicao_Pagto.Value);
     QNotaEntradaCod_Obra_Req_Cab.Value := wCod_Obra_Req_Cab;
     DMObra.QObra_Req_Cab.Edit;
   End;
  while not DMNotaEntrada.QItemNF.Eof do
  begin
    DMNotaEntrada.QAtuBaixaOC.Close;
    DMNotaEntrada.QAtuBaixaOC.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
    DMNotaEntrada.QAtuBaixaOC.Open;
    DMNotaEntrada.QAtzItemOC.Close;
    DMNotaEntrada.QAtzItemOC.SetVariable('COD_ORDEM_COMPRA_ITEM', QAtuBaixaOCCod_Ordem_Compra_item.Value);
    DMNotaEntrada.QAtzItemOC.SetVariable('QT_ACRESCENTAR', (wTipoAtu * QAtuBaixaOCQt_Baixa.Value));
    DMNotaEntrada.QAtzItemOC.ExecSQL;
    If (QNotaEntradaCod_Obra.Text <> '') And
       (wTipoAtu = 1)                    Then  // somente para inclusao
       DMObra.Proc_IncluiObra_Item(QNotaEntradaCod_Obra.Value, Trunc(QItemNFCod_Produto.Value), wCod_Obra_Req_Cab, QItemNFQt_Quantidade.Value, ((QItemNFVal_Total.Value - QItemNFVal_Desconto_Rateio.Value)/ QItemNFQt_Quantidade.Value), QNotaEntradaOBS_COMPLEMENTO.Value, QItemNFCOD_LOTE_TIPO.Value);

    DMNotaEntrada.QItemNF.Next;
  end;
  If (QNotaEntradaCod_Obra.Text <> '') And
     (wTipoAtu = 1)                    Then  // somente para inclusao
   Begin
     DMObra.QObra_Req_CabIND_SITUACAO.Value := '2';
     DMObra.QObra_Req_Cab.Post;
   End;
  DMNotaEntrada.QItemNF.EnableControls;
  DMObra.QObra_Req_Cab.Close;
  DMObra.QObra_Req_Item.Close;
  DMNotaEntrada.QAtuBaixaOC.Close;
end;

procedure TDMNotaEntrada.QItemNFBeforePost(DataSet: TDataSet);
var
  wPercBase, wPercICM, wDesconto, qtAnterior, vlAnterior, wMargem, wNovoValor, wPerc_Diferimento,rBaseCBSIBS: Real;
  wTipoProduto: string;
  x, y: array of string;
  wCSTIBSCBS: string;
  rCalculaImposto: TImpostosCalculados;
  wValDescontoRateio: Real;

begin
  wValDescontoRateio := QItemNFVAL_DESCONTO_RATEIO.Value;
  QItemNF_CalcFields.Close;
  QItemNF_CalcFields.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
  QItemNF_CalcFields.Open;
  
  if QItemNFCod_Produto.Text = '' then // colocado pelo césar 16/09/2010
    Exit;

  setLength(x, 14); //13 sql diferentes
  setLength(y, 14);

  x[0] := 'SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QItemNFCod_Produto.Text;
  x[1] := 'SELECT NUM_EMBALAGEM FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QItemNFCod_Produto.Text;
  x[2] := 'SELECT IND_CONTRATO_ARROZ FROM TB_OPERACAO WHERE COD_OPERACAO = ' + QNotaEntradaCod_Operacao.Text;
  x[3] := 'SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCod_Tributacao.Text;
  x[4] := 'SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCod_Tributacao.Text;
  x[5] := 'SELECT VAL_VAREJO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QItemNFCod_Produto.Text;
  x[6] := 'SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO WHERE COD_CADASTRO = ' + QNotaEntradaCod_Cadastro.Text;
  x[7] := 'SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO = ' + QItemNFCod_Produto.Text;
  x[8] := 'SELECT IND_COMPRAS FROM TB_OPERACAO WHERE COD_OPERACAO = ' + QNotaEntradaCod_Operacao.Text;
  x[9] := 'SELECT IND_SOJICULTOR_PARTICIPANTE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + QNotaEntradaCod_Cadastro.Text;
  x[10] := 'SELECT DESC_SITUACAO_TRIB FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCod_Tributacao.Text;
  x[11] := 'SELECT IND_COMPRAS FROM TB_OPERACAO WHERE COD_OPERACAO = ' + QNotaEntradaCod_Operacao.Text;
  x[12] := 'SELECT IND_VENDAS FROM TB_OPERACAO WHERE COD_OPERACAO = ' + QNotaEntradaCod_Operacao.Text;
  x[13] := 'SELECT PERC_DIFERIMENTO FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCod_Tributacao.Text;

  DMOracle.BuscaNomes(x, y);

  if (pOperacaoInterna = 0) or
    (pOperacaoInterna = 3) then
  begin
    if QNotaEntradaind_complemento.Value then
    begin
      qtAnterior := QItemNFQT_QUANTIDADE.Value;
      vlAnterior := QItemNFVAL_TOTAL.Value;
      if (qtAnterior > 0) and (vlAnterior = 0) then
      begin //Complemento de quantidade, pega o valor unitario da nota complementada
        vlAnterior := StrToFloat('0' + DMOracle.FastSelect('NVL(VAL_UNITARIO)',
          'TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB_REF.Text +
          ' AND COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
        QItemNFVAL_TOTAL.Value := vlAnterior * QItemNFQT_QUANTIDADE.Value;
      end
      else if (qtAnterior = 0) and (vlAnterior > 0) then
      begin //Complemento de valor, pega quantidade da nota complementada
        qtAnterior := StrToFloat('0' + DMOracle.FastSelect('SUM(QT_QUANTIDADE)',
          'TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB_REF.Text +
          ' AND COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
      end;
      if qtAnterior > 0 then
        QItemNFVAL_UNITARIO.Value := QItemNFVAL_TOTAL.Value / qtAnterior;
    end;

    wTipoProduto := Y[0];
    if DMNotaEntrada.pTipoNota = 'NORMAL' then // NORMAL ou AGRICOLA
    begin
      if QItemNFQT_QUANTIDADE.Value > 0 then
      begin
        if not QNotaEntradaind_complemento.Value then
        begin
          QItemNFVAL_UNITARIO.Value := QItemNFVAL_TOTAL.Value / QItemNFQT_QUANTIDADE.Value;
          if (wTipoProduto = 'ARROZ') or (wTipoProduto = 'AGRICOLA') then
            QItemNFVAL_UNITARIO.Value := QItemNFVAL_UNITARIO.Value * StrToFloat(y[1]); // EMBALAGEM
          if wTipoProduto = 'ARROZ' then // aqui serve para calcular o desconto das notas de fixação de arroz Fernando 31/05/2007
          begin
            if (QNotaEntradaCOD_OPERACAO.Value = 196) or
              (QNotaEntradaCOD_OPERACAO.Value = 197) or
              (QNotaEntradaCOD_OPERACAO.Value = 198) or
              (QNotaEntradaCOD_OPERACAO.Value = 199) then // foi solicitacao do Joao Fernando dia 05/06/2007
            begin
              wDesconto := QItemNFQT_QUANTIDADE.Value * StrToFloat(Y[5]) / StrToFloat(y[1]);
              QNotaEntradaVAL_DESCONTO.Value := wDesconto;
            end;
          end;
        end;
      end
      else if not QNotaEntradaind_complemento.Value then
        QItemNFVAL_UNITARIO.Value := 0;
    end
    else
    begin // AGRICOLA
      if not QNotaEntradaind_complemento.Value then
      begin
        if QItemNFQT_QUANTIDADE.Value > 0 then
          QItemNFVAL_TOTAL.Value := QItemNFVAL_UNITARIO.Value * QItemNFQT_QUANTIDADE.Value
        else
          QItemNFVAL_TOTAL.Value := 0;
        if (wTipoProduto = 'AGRICOLA') or (wTipoProduto = 'ARROZ') or (wTipoProduto = 'COM. ARROZ') then
          QItemNFVAL_TOTAL.Value := QItemNFVAL_TOTAL.Value / StrToFloat(Y[1]);
      end;
    end;
  end;
  // *** Calculo dos Impostos **********
  if QItemNFVAL_ICM_Base.Value = 0 then
  begin

      //adicionado devido aos valores de contas de base mínima do estado do Mato Grosso para Grasel - Cleber 23/06/2021
    if ((DMParamSistema.CodEmpresa = 'GRASEL') and (QNotaEntradaCOD_ESTADO.Value <> 'MT')) or (DMParamSistema.CodEmpresa <> 'GRASEL') then
    begin

      wPercICM := StrToFloat(Y[3]);
      wPercBase := StrToFloat(Y[4]);
      if(DMOracle.FastSelect('IND_CALCULO_ICMS','TB_PARAM_SISTEMA') = 'NOTA') then      //Para calcular o valor do icms pelo valor da nota, ou seja, considerando descontos e despesas, ou pelo valor dos produtos, desconsiderando despesas e descontos.
        QItemNFVAL_ICM_Base.Value := (QItemNFVal_Total.Value - QItemNFVAL_DESCONTO_RATEIO.Value + QItemNFVal_Despesas.Value)
          * wPercBase / 100
      else
        QItemNFVAL_ICM_Base.Value := (QItemNFVal_Total.Value +
          Bib.ift(QItemNFIND_CONSIDERA_IPI_BC_ICMS.Value = 'S', QItemNFVAL_IPI.Value, 0)) * wPercBase / 100;

      wPerc_Diferimento := StrToFloat('0' + Y[13]);
      If wPerc_Diferimento = 100 Then // percentual de diferimento
         QItemNFVAL_ICM.Value := 0
      Else
         QItemNFVAL_ICM.Value := (QItemNFVal_ICM_Base.Value) * (wPercICM - (wPercICM * wPerc_Diferimento / 100)) / 100;
    end;
  end;

  if (QItemNFVAL_DPI_TRANSGENICOS.Value = 0) and (QItemNFQt_Quantidade.Value > QItemNFQT_CREDITO_TRANSGENICOS.Value) then
  begin // calcula dpi transgenicos na fixacao // E NAO É SOJICULTOR PARTICIPANTE
    QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
    if (y[8] = 'C') and (Y[6] = 'J') and (Y[7] <> '') and (Y[9] <> 'PAR') then // identifica que é uma compra de pessoa juridica e tem percentual de DPI transgenico
      QItemNFVAL_DPI_TRANSGENICOS.Value := (Trunc(QItemNFVal_Total.Value * StrToFloat(Y[7]) / 100) * 100) / 100;
  end;
  if QItemNFDESC_INF_ADICIONAL.IsNull then
    QItemNFDESC_INF_ADICIONAL.Value := DMNotaSaida.GeraInfAdicionalItem(QItemNF);
  if QNotaEntradaCOD_SERIE_MODELO.Value = '55' then //Para NF-e, deve-se limpar caracteres não aceitos.
  begin
    QItemNFDESC_INF_ADICIONAL.Value := StringReplace(QItemNFDESC_INF_ADICIONAL.Value,' \n ' + chr(13)+chr(10),chr(13)+chr(10),[rfReplaceAll]);
    QItemNFDESC_INF_ADICIONAL.Value := StringReplace(QItemNFDESC_INF_ADICIONAL.Value,chr(13)+chr(10),' \n ' + chr(13)+chr(10),[rfReplaceAll]);
    QItemNFDESC_INF_ADICIONAL.Value := DMNfe.LimpaStrXML(QItemNFDESC_INF_ADICIONAL.Value,chr(13)+chr(10));
  end;

  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'KREUZ') And
     (QItemNFCOD_CFOP.Text = '') And
     (Pos('kreuz', AnsiLowerCase(DMParamSistema.QParamSistemaDESC_EMPRESA.Text)) > 0)
     and (not pCF) Then
   Begin
     If Y[11] = 'C' Then
      If QItemNFCOD_TRIBUTACAO.Value = 3 Then  //isento mudei de 3 para 20(mudaram para o reg. normal e a 20 calcula icms). Junior 23/02/2022 - Volaram para SIMPLES 11/03/2026
        If QNotaEntradaCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 1102
        Else
           QItemNFCOD_CFOP.Value := 2102
      Else
        If QItemNFCOD_TRIBUTACAO.Value = 9 Then  //substituicao
          If QNotaEntradaCOD_ESTADO.Value = 'PR' Then
             QItemNFCOD_CFOP.Value := 1403
          Else
             QItemNFCOD_CFOP.Value := 2403
        Else
          If QNotaEntradaCOD_ESTADO.Value = 'PR' Then
             QItemNFCOD_CFOP.Value := 1652
          Else
             QItemNFCOD_CFOP.Value := 2652;
     If Y[12] = 'D' Then   //DEVOLUCAO DE VENDAS
      If QItemNFCOD_TRIBUTACAO.Value = 20 Then  //isento mudei de 3 para 20(mudaram para o reg. normal e a 20 calcula icms). Junior 23/02/2022
        If QNotaEntradaCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 1202
        Else
           QItemNFCOD_CFOP.Value := 2202
      Else
        If QItemNFCOD_TRIBUTACAO.Value = 9 Then  //substituicao
          If QNotaEntradaCOD_ESTADO.Value = 'PR' Then
             QItemNFCOD_CFOP.Value := 1411
          Else
             QItemNFCOD_CFOP.Value := 2411;
   End;
    if QItemNFCOD_CST_PIS.IsNull then
      QItemNFCOD_CST_PIS.Value := DMOracle.FastSelect('COD_CST_PIS',
        'TB_PRODUTO','COD_PRODUTO = ' +QItemNFCOD_PRODUTO.Text);
    if QItemNFCOD_CST_COFINS.IsNull then
      QItemNFCOD_CST_COFINS.Value := DMOracle.FastSelect('COD_CST_COFINS',
        'TB_PRODUTO','COD_PRODUTO =' + QItemNFCOD_PRODUTO.Text);


  If ( (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') )
      and (QItemNFDESC_COMPLEMENTO.Value <> '') Then
  Begin

    wMargem := (((StrToFloat(QItemNFDESC_COMPLEMENTO.Text)) - (QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value))*100)/
                 (QItemNFVAL_TOTAL.Value/QItemNFQT_QUANTIDADE.Value);
    wNovoValor := StrToFloat(QItemNFDESC_COMPLEMENTO.Value);
    DMOracle.ExecutaSql('UPDATE TB_PRODUTO SET VAL_VAREJO = '+ Bib.TrocaVirgulaPorPonto(FloatToStr(wNovoValor)) +
                        ' WHERE COD_PRODUTO= '+QItemNFCOD_PRODUTO.Text);
    DMOracle.ExecutaSql('UPDATE TB_PRODUTO SET PERC_MARGEM_VAREJO ='+ Bib.TrocaVirgulaPorPonto(FloatToStr(wMargem))+
                        ' WHERE COD_PRODUTO= '+QItemNFCOD_PRODUTO.Text);

  end;

  QItemNFCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;

  // Reforma Tributária
  // LOCAL PARA AJUSTE DOS CÁLCULOS CONSIDERANDO INCICIO DA NOVA LEGISLAÇÃO TRIBUTÁRIA
  // QUE ENTRA EM VALIDADE A PARTIR DE 01/01/2026
  if QItemNFCOD_PRODUTO.Text <> '' then
      QItemNFNUM_CST_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CST_IBS_CBS FROM TB_CST_IBS_CBS', 'COD_CST_IBS_CBS = ' +
                                                '(SELECT COD_CST_IBS_CBS FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCOD_TRIBUTACAO.Text + ')');
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', QNotaEntradaCOD_FILIAL.Value);
  DMFilial.QFilial.Open;
  if not (DMFilial.QFilialIND_REGIME_TRIBUTARIO.Value in [1,2]) and (DMOperacao.QOperacaoIND_EMITE.Value = 'F') and
                              (QItemNFNUM_CST_IBS_CBS.Value <> '410')  then
  begin

    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK', QNotaEntradaCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;

    DMEstado.QEstado.Close;
    DMEstado.QEstado.SetVariable('COD_ESTADO', DMCadastro.QCadastroCOD_ESTADO.Value);
    DMEstado.QEstado.Open;

    DMCidade.QCidade.Close;
    DMCidade.QCidade.SetVariable('PK', DMCadastro.QCadastroCOD_CIDADE.Value);
    DMCidade.QCidade.Open;

    DMTributacao.QTributacao.Close;
    DMTributacao.QTributacao.SetVariable('PK', QItemNFCOD_TRIBUTACAO.Value);
    DMTributacao.QTributacao.Open;

    rBaseCBSIBS := (QItemNFQT_QUANTIDADE.Value * QItemNFVAL_UNITARIO.Value) - QItemNFVAL_ICM.Value - QItemNFVAL_ICMS_SUBST.Value - QItemNFVAL_PIS.Value - QItemNFVAL_CONFINS.Value;
    rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                       DMEstado.QEstadoPERC_IBS_UF.Value, // aliquota estadual IBS
                                                       DMCidade.QCidadePERC_IBS_MUN.Value, // aliquota municipal IBS
                                                       DMTributacao.QTributacaoPERC_CBS.Value, // aliquota CBS
                                                       0,    // imposto seletivo
                                                       QItemNFVAL_FRETE.Value,
                                                       0,  // seguro
                                                       QItemNFVAL_DESPESAS.Value,
                                                       QItemNFVAL_DESCONTO.Value);

    QItemNFVAL_IBS_MUN.Value := rCalculaImposto.vIBS_Mun;
    QItemNFVAL_IBS_EST.Value := rCalculaImposto.vIBS_Est;
    QItemNFVAL_CBS.Value := rCalculaImposto.vCBS;
    QItemNFVAL_BC_IBS_CBS.Value := rCalculaImposto.vBC;
  end
  else
  begin
    QItemNFVAL_IBS_MUN.Value := 0;
    QItemNFVAL_IBS_EST.Value := 0;
    QItemNFVAL_CBS.Value := 0;
    QItemNFVAL_BC_IBS_CBS.Value := 0;
  end;



  //Movido do calcfields para cá para tentar melhorar o desempenho. - Cleber - 05/05/2021
  if BibliotecaDB = nil then
    BibliotecaDB := TBibliotecaDB.Create;

  BibliotecaDB.NotaEntradaQItemNFCalcFields(DataSet);
// Mantém o desconto individual importado do XML. Alex 01/09/2026
  if (wValDescontoRateio > 0) and (not QNotaEntradaBIN_XML_NFE.IsNull) then
    QItemNFVAL_DESCONTO_RATEIO.Value := wValDescontoRateio;
end;

procedure TDMNotaEntrada.QItemNFVAL_TOTALValidate(Sender: TField);
begin
  if QNotaEntradaIND_FINALIDADE_NFE.Value <> 4 then // if adicionado para não zerar os campos do icms na devolução de venda.
  begin
    if (DMParamSistema.CodEmpresa <> 'KREUZ') and (DMParamSistema.CodEmpresa <> 'CONKRETA') then //Não zerar o Base/Val_ICMS para Kreuz ao mudar a qtde. Junior 06/06/2022. Solic. Rubens SUPORTE(5061).
    begin
      if (DMParamSistema.CodEmpresa <> 'GRASEL') AND (QNotaEntradaCOD_ESTADO.Value <> 'MT') then
        QItemNFVal_ICM_Base.Value := 0;
      QItemNFVal_ICM.Value := 0;
    end
    else if QNotaEntradaIND_FINALIDADE_NFE.Value = 4 then //kreuz zerar base de icms na devolução
        QItemNFVal_ICM_Base.Value := 0;

  end;
  SetaPendenciaInterna(2);
end;

procedure TDMNotaEntrada.QItemNFAfterDelete(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
  QSomaItemNota.Open;
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QItemNFVAL_IPIValidate(Sender: TField);
begin
  if (QItemNFVal_Ipi.Value > 0) and
    (QItemNFVal_Total.Value > 0) then
    QItemNFPerc_Ipi.Value := QItemNFVal_Ipi.Value / QItemNFVal_Total.Value * 100
  else
    QItemNFPerc_Ipi.Value := 0;
end;

procedure TDMNotaEntrada.QNotaEntradaVAL_FRETEValidate(Sender: TField);
var
  wPBase, wPICM: string;
begin
  wPICM := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + FloatToStr(QNotaEntradaCod_Tributacao_Frete.Value), True);
  wPBase := DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + FloatToStr(QNotaEntradaCod_Tributacao_Frete.Value), True);
  if (wPBase <> '') and (wPICM <> '') then
  begin
    QNotaEntradaVal_ICM_Base_Frete.Value := (QNotaEntradaVal_Frete.Value)
      * StrToFloat(wPBase) / 100;
    QNotaEntradaval_icm_Frete.Value := (QNotaEntradaVal_ICM_Base_Frete.Value) * StrToFloat(wPICM) / 100;
  end
  else
  begin
    QNotaEntradaVal_ICM_Base_Frete.Value := 0;
    QNotaEntradaVal_ICM_Frete.Value := 0;
  end;
  SetaPendenciaInterna(2);
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QNotaEntradaCOD_TRANSPORTADORValidate(
  Sender: TField);
begin
  QNotaEntradaDesc_transportadora.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaEntradaCod_Transportador.Value), True);
end;

procedure TDMNotaEntrada.ChecaSaldoFixar;
var
  wTipoProduto: string;
begin
  wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCod_Produto.Text);
  if (wTipoProduto <> 'COM. ARROZ') and (wTipoProduto <> 'ARROZ') then
  begin

    with DmRomaneioAgricola do
    begin
      QRomConsFixar.Close;
      QRomConsFixar.SetVariable('CADASTRO', QNotaEntradaCod_Cadastro.Value);
      QRomConsFixar.SetVariable('FILIAL', QNotaEntradaCod_Filial.Value);
//      QRomConsFixar.SetVariable('DATAI',StrToDate('01/12/1999'));
//      QRomConsFixar.SetVariable('DATAF',DMOracle.DataServ);
      if QNotaEntradaCod_Cadastro_Parceiro.Text <> '' then
        QRomConsFixar.SetVariable('COD_PARCEIRO', QNotaEntradaCod_Cadastro_Parceiro.Value)
      else
        QRomConsFixar.SetVariable('COD_PARCEIRO', 0);
      with DMOPeracao do
      begin
        QOperacao.Close;
        QOperacao.SetVariable('PK', QNotaEntradaCod_Operacao.Value);
        QOperacao.Open;
        // vai consistir se não está utilizando uma OPERAÇÃO invalida (que não é de fixação)
        if (QOperacaoInd_Fixar_Empresa.Value <> 'F') and
          (QOperacaoInd_Fixar_Empresa.Value <> 'D') and
          (QOperacaoInd_Fixar_Outras_Emp.Value <> 'F') and
          (QOperacaoInd_Fixar_Consumo.Value <> 'D') and
          (QOperacaoInd_Compras.Value <> 'C') then
          raise exception.Create('Operação deve ser Fixação ou Devolução de Consumo');

        if (QOperacaoInd_Fixar_Empresa.Value = 'F') or
          (QOperacaoInd_Fixar_Empresa.Value = 'D') or
          (QOperacaoInd_Compras.Value = 'C') then
          QRomConsFixar.SetVariable('TIPO_FIXAR', 'EMPRESA')
        else
          QRomConsFixar.SetVariable('TIPO_FIXAR', 'OUTRAS_EMPRESAS');
      end;
      QItemNf.First;
      while not QItemNf.EOF do
      begin
        QRomConsFixar.Close;
        QRomConsFixar.SetVariable('PRODUTO', QItemNFCod_Produto.Value);
        QRomConsFixar.SetVariable('LOTE_TIPO', QItemNFCod_Lote_Tipo.Value);
        QRomConsFixar.Open;
        with DMOperacao do
        begin
          if (QOperacaoInd_Fixar_Empresa.Value = 'F') or (QOperacaoInd_Fixar_Empresa.Value = 'D') or (QOperacaoInd_Fixar_Outras_Emp.Value = 'F') then
            if QItemNFQt_Quantidade.Value > (QRomConsFixarSQuantidade_Fixar.Value - QRomConsFixarSQuantidade_Fixado.Value) then
              raise exception.create('Quantidade Fixado na Nota Maior que Saldo');
          if QOperacaoInd_Fixar_Consumo.Value = 'D' then
            if QItemNFQt_Quantidade.Value > (QRomConsFixarsQuant_Consumo.Value - QRomConsFixarsQuant_Dev_Consumo.Value) then
              raise exception.create('Quantidade Devolução na Nota Maior que Saldo');
        end;
        QItemNf.Next;
      end;
    end;
  end;
end;

function TDMNotaEntrada.CalculaFunrural(wProduto, wOperacao, wCadastro, wValor: Real): Real;
var
  wPerc_Funrural, wAux: string;
begin
  Result := 0;
  wAux := DMOracle.BuscaNome('SELECT IND_FUNRURAL FROM  TB_PRODUTO_AGRICOLA', 'COD_PRODUTO = ' + FloatToStr(wProduto), True);
  if wAux = 'S' then
  begin
    wAux := DMOracle.BuscaNome('SELECT IND_FUNRURAL FROM TB_OPERACAO', 'COD_OPERACAO=' + FloatToStr(wOperacao), True);
    if wAux <> 'N' then
    begin
      wPerc_Funrural := DMOracle.BuscaNome('Select Perc_Funrural from Tb_Cadastro', 'Cod_Cadastro=' + FloatToStr(wCadastro));
      if Trim(wPerc_Funrural) <> '' then
        Result := Trunc((Round(wValor * 100) / 100) * StrToFloat(wPerc_Funrural)) / 100;
    end;
  end;
end;

function TDMNotaEntrada.CalculaSenar(wProduto, wOperacao, wCadastro, wValor: Real): Real;
var
  wPerc_Senar, wAux: string;
begin
  Result := 0;
  wAux := DMOracle.BuscaNome('SELECT IND_SENAR FROM  TB_PRODUTO_AGRICOLA', 'COD_PRODUTO = ' + FloatToStr(wProduto), True);
  if wAux = 'S' then
  begin
    wAux := DMOracle.BuscaNome('SELECT IND_SENAR FROM TB_OPERACAO', 'COD_OPERACAO=' + FloatToStr(wOperacao), True);
    if wAux <> 'N' then
    begin
      wPerc_Senar := DMOracle.BuscaNome('Select Perc_Senar from Tb_Cadastro', 'Cod_Cadastro=' + FloatToStr(wCadastro));
      if Trim(wPerc_Senar) <> '' then
        Result := Trunc((Round(wValor * 100) / 100) * StrToFloat(wPerc_Senar)) / 100;
    end;
  end;
end;

procedure TDMNotaEntrada.CalculaDesconto(wCadastro, wFilial, wOperacao, wNota_Item: Integer; wProduto, wQuantidade: Real; wTipo, wCadastroParceiro: string);
var
  wQtde_Fixado, wQtde_Fixar, wDesconto: Real; // tipo quer dizer se é nota de entrada ou saida
  wObs, wAux, wNumNotaRef, wCodNotaCabRef, wChaveAcesso: string;
begin
  // **** Calculo do Desconto Agricola *********
  QNotaFixar.Close;
  QNotaFixar.SetVariable('CADASTRO', wCadastro);
  QNotaFixar.SetVariable('FILIAL', wFilial);
  QNotaFixar.SetVariable('DATAI', Null);
  QNotaFixar.SetVariable('DATAF', DMOracle.DataServ);
  if wCadastroParceiro <> '' then
    QNotaFixar.SetVariable('COD_PARCEIRO', wCadastroParceiro)
  else
    QNotaFixar.SetVariable('COD_PARCEIRO', 0); // para baixar somente que nao tem parceiro esta como null no banco de dados
  with DMOPeracao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK', wOperacao);
    QOperacao.Open;
    // vai consistir se não está utilizando uma OPERAÇÃO invalida (que não é de fixação)
    if (QOperacaoInd_Fixar_Empresa.Value = 'F') or
       (QOperacaoInd_Fixar_Empresa.Value = 'D') or
       (QOperacaoInd_Compras.Value = 'C') then
      QNotaFixar.SetVariable('TIPO_FIXAR', 'EMPRESA')
    else
      QNotaFixar.SetVariable('TIPO_FIXAR', 'OUTRAS_EMPRESAS');
  end;
  wDesconto := 0;
//  QItemNf.First;
  QSaldoFixado.Close;
  QSaldoFixado.SetVariable('COD_NOTA_ITEM', wNota_Item);
  QSaldoFixado.Open;
//  While not QItemNf.EOF do  retirado pelo César porque a nota de fixacao somente tem um item
//  Begin
  wQtde_Fixado := 0;
  QNotaFixar.Close;
  QNotaFixar.SetVariable('CADASTRO', wCadastro);
  QNotaFixar.SetVariable('PRODUTO', wProduto);
  QNotaFixar.Open;
  while (wQtde_Fixado < wQuantidade) and
    not (QNotaFixar.Eof) do
  begin
    wQtde_Fixar := QNotaFixarSQtde_Fixar.Value - QNotaFixarSQtde_Fixado.Value;
    if wQtde_Fixar > (wQuantidade - wQtde_Fixado) then
      wQtde_Fixar := wQuantidade - wQtde_Fixado;
    if wQtde_Fixar > 0 then
    begin
      wDesconto := wDesconto + QNotaFixarSVal_Total.Value / QNotaFixarSQtde_Fixar.Value * wQtde_Fixar;
      if (DMOPeracao.QOperacaoInd_Fixar_Empresa.Value = 'F') or
         (DMOPeracao.QOperacaoInd_Fixar_Empresa.Value = 'D') then
      begin
        QSaldoFixado.Insert;
        QSaldoFixadoCod_NF_Item_Fixar.Value := Trunc(QNotaFixarCod_Nota_Item.Value);
        QSaldoFixadoCod_NF_Item_Fixado.Value := wNota_Item;
        QSaldoFixadoQt_Fixado.Value := wQtde_Fixar;
        QSaldoFixado.Post;
      end;

      wAux := DMOracle.BuscaNome('Select NUM_NOTA from Tb_Nota_Cab A,Tb_Nota_Item B',
        'A.Cod_Nota_Cab=B.Cod_Nota_Cab And Cod_Nota_Item=' + QNotaFixarCod_Nota_Item.Text);
      if (DMOPeracao.QOperacaoInd_Fixar_Empresa.Value = 'D') then
      begin
        wCodNotaCabRef := DMOracle.BuscaNome('Select COD_NOTA_CAB from Tb_Nota_item',
        'Cod_Nota_Item=' + QNotaFixarCod_Nota_Item.Text);
        wChaveAcesso := DMOracle.BuscaNome('Select DESC_CHAVE_ACESSO from TB_NOTA_CAB',
        'COD_NOTA_CAB=' + wCodNotaCabRef);
        if QNotaEntradaCOD_NOTA_CAB.Value > 0 then
        begin
          try
            QNotaReferenciada.Close;
            QNotaReferenciada.Open;
            QNotaReferenciada.Insert;
            QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaEntradaCOD_NOTA_CAB.Value;
            QNotaReferenciadaCOD_NOTA_CAB_REF.Text := wCodNotaCabRef;
            QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(wChaveAcesso);
            QNotaReferenciadaNUM_NOTA.Value := StrToInt('0'+DMOracle.BuscaNome('Select NUM_NOTA from TB_NOTA_CAB',
              'COD_NOTA_CAB=' + wCodNotaCabRef));
            QNotaReferenciadaCOD_SERIE.Value := DMOracle.BuscaNome('Select COD_SERIE from TB_NOTA_CAB',
              'COD_NOTA_CAB=' + wCodNotaCabRef);
            QNotaReferenciadaCOD_SERIE_MODELO.Value := DMOracle.BuscaNome('Select COD_SERIE_MODELO from TB_NOTA_CAB',
              'COD_NOTA_CAB=' + wCodNotaCabRef);
            QNotaReferenciadaDT_EMISSAO.Text := DMOracle.BuscaNome('Select DT_EMISSAO from TB_NOTA_CAB',
              'COD_NOTA_CAB=' + wCodNotaCabRef);
            QNotaReferenciada.Post;
          except
            QNotaReferenciada.Cancel;
          end;
        end
        else
        begin
          with DMNotaSaida do
          begin
            try
              QNotaReferenciada.Close;
              QNotaReferenciada.Open;
              QNotaReferenciada.Insert;
              QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
              QNotaReferenciadaCOD_NOTA_CAB_REF.Text := wCodNotaCabRef;
              QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(wChaveAcesso);
              QNotaReferenciadaNUM_NOTA.Value := StrToInt('0'+DMOracle.BuscaNome('Select NUM_NOTA from TB_NOTA_CAB',
                'COD_NOTA_CAB=' + wCodNotaCabRef));
              QNotaReferenciadaCOD_SERIE.Value := DMOracle.BuscaNome('Select COD_SERIE from TB_NOTA_CAB',
                'COD_NOTA_CAB=' + wCodNotaCabRef);
              QNotaReferenciadaCOD_SERIE_MODELO.Value := DMOracle.BuscaNome('Select COD_SERIE_MODELO from TB_NOTA_CAB',
                'COD_NOTA_CAB=' + wCodNotaCabRef);
              QNotaReferenciadaDT_EMISSAO.Text := DMOracle.BuscaNome('Select DT_EMISSAO from TB_NOTA_CAB',
                'COD_NOTA_CAB=' + wCodNotaCabRef);
              QNotaReferenciada.Post;
            except
              QNotaReferenciada.Cancel;
            end;
          end;
        end;
      end;
      if wAux <> '' then
        wObs := wObs + ', ' + wAux;
      wQtde_Fixado := wQtde_Fixado + wQtde_Fixar;
    end;
    QNotaFixar.Next;
  end;
//    QItemNf.Next;
//  end;
  if (DMOPeracao.QOperacaoInd_Fixar_Empresa.Value = 'F') and // notas de devolucao nao tem desconto
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CITY')   And // PARA VIEIRA GERA NOTA DE DEVOLUCAO DE DEPOSITO SEM DESCONTO
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') then // PARA MOINHO GERA NOTA DE DEVOLUCAO DE DEPOSITO SEM DESCONTO
    QNotaEntradaVal_Desconto.Value := QNotaEntradaVal_Desconto.Value + wDesconto;

  if wTipo = 'E' then
  begin
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') Or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CITY')   then
      QNotaEntradaObs_Complemento.Value := ' Ref Nf. Deposito Nr. ' + wObs
    else if wObs <> '' then
      QNotaEntradaObs_Complemento.Value := 'Nf. a Fixar Nr. ' + wObs;
  end
  else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') Or
          (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CITY')   then
          DMNotaSaida.QNotaSaidaObs_Complemento.Value := ' Ref Nf. Deposito Nr. ' + wObs
  else if wObs <> '' then
    DMNotaSaida.QNotaSaidaObs_Complemento.Value := 'Nf. a Fixar Nr. ' + wObs;
  QSaldoFixado.Close;
end;

procedure TDMNotaEntrada.ExcluiNota;
begin
  try
    if QNotaEntradaInd_Situacao.Value <> '1' then
      raise Exception.Create('Somente notas digitadas podem ser excluidas!');
    if DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(QNotaEntradaCod_Nota_Cab.Value), True) <> '' then
      raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
    pOperacaoInterna := 1; // Apagando Nota
    DMOracle.DBCemapa.StartTransaction;

    if not QNotaReferenciada.Eof then
    begin
      QNotaReferenciada.First;
      while not QNotaReferenciada.Eof do
        QNotaReferenciada.Delete;
    end;
    
    with DMDevolucaoTroca do
    begin
      QValeProduto.Close;
      QValeProduto.ClearVariables;
      QValeProduto.SetVariable('COD_NOTA_CAB_DEV', QNotaEntradaCOD_NOTA_CAB.Value);
      QValeProduto.Open;

      if QValeProduto.RecordCount > 0 then
      begin
        DMOracle.QExecSQL.close;
        DMOracle.QExecSQL.SQL;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_VALE_PRODUTO_ITEM WHERE COD_VALE_PRODUTO = ' + QValeProdutoCOD_VALE_PRODUTO.Text);
        DMOracle.QExecSQL.ExecSQL;
        QValeProduto.Delete;
      end;
    end;
    
    while not QItemNF.Eof do
      QItemNF.Delete;

    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_PAGAMENTO_FIXACAO WHERE COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text);
    DMOracle.QExecSQL.ExecSQL;

    //PARA EXCLUIR OS DADOS DE PERCENTUAIS DA RETIFOZ - 12/01/2021 - CLEBER
    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_SUBST_ESPECIAL WHERE COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text);
    DMOracle.QExecSQL.ExecSQL;

    QNotaEntrada.Delete;
    pOperacaoInterna := 0; // Normal
  except
    pOperacaoInterna := 0; // Normal
    raise;
  end;
end;

procedure TDMNotaEntrada.QNotaEntradaBeforeDelete(DataSet: TDataSet);
begin
  if QNotaEntradaInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente notas digitadas podem ser excluidas!');
  QFCCIA.Open;
  QFCCIA.First;
  while not QFCCIA.Eof do
    QFCCIA.Delete;

  if not (DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNotaEntrada.QNotaEntradaAfterDelete(DataSet: TDataSet);
begin
  if not (pContratoAgricola) then
    DMOracle.DBCemapa.Commit;
end;

procedure TDMNotaEntrada.QNotaEntradaDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMNotaEntrada.ChecaPendenciaInterna;
begin
  // ** Checa se existe alguma pendencia interna para ser executada
  if pOperacaoInterna = 0 then
  begin
    pOperacaoInterna := pPendenciaInterna;
    pPendenciaInterna := 0;
    case pOperacaoInterna of
      0: ; // Nenhuma pendencia
      1: ; // Excluir a Nota
      2: RateiaCabecalho;
    end; // Case
    pOperacaoInterna := 0;
  end;
end;

procedure TDMNotaEntrada.SetaPendenciaInterna(wPendencia: Integer);
begin
  if pOperacaoInterna = 0 then
    pPendenciaInterna := wPendencia;
end;

procedure TDMNotaEntrada.QItemNFBeforeCancel(DataSet: TDataSet);
begin
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
end;

procedure TDMNotaEntrada.QNotaEntradaVAL_DESPESASValidate(Sender: TField);
begin
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QNotaEntradaVAL_DESCONTOValidate(Sender: TField);
begin
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QNotaEntradaVAL_ICM_FRETEValidate(Sender: TField);
begin
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QNotaEntradaVAL_ICM_BASE_FRETEValidate(
  Sender: TField);
begin
  SetaPendenciaInterna(2); // Rateio do Cabeçalho
  //ChecaPendenciaInterna;
end;

procedure TDMNotaEntrada.QItemNFCOD_TRIBUTACAOValidate(Sender: TField);
begin //Adicionado cod_empresa DINIZ, pois passou para o Normal e estava recalculando o ICMS nas notas de entradas. Alex 22/02/2023
  if ( (DMParamSistema.CodEmpresa <> 'GRASEL')   and (DMParamSistema.CodEmpresa <> 'KREUZ')     and (DMParamSistema.CodEmpresa <> 'DINIZ')    and
       (DMParamSistema.CodEmpresa <> 'RETIFOZ2') and (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and (DMParamSistema.CodEmpresa <> 'GGIRARDI') and
       (DMParamSistema.CodEmpresa <> 'LISTELL')  and (DMParamSistema.CodEmpresa <> 'CASATINTAS') ) AND
     (QNotaEntradaCOD_ESTADO.Value <> 'MT') then //Permanecer o valor de ICMS da importação do xml - 25/02/2022                                
    QItemNFVal_ICM_Base.Value := 0; // Força o Recalculo no Before Post;
end;

procedure TDMNotaEntrada.QItemNFCOD_PRODUTOValidate(Sender: TField);
var
  wUnitario: string;
  wTributacao: string;
  wPrecoUnitario: string;
begin   //Paulinho solicitou que puxe o valor do produto na devolução que for lançado o produto manual. Junior 19/12/2019.
  if (DMParamSistema.CodEmpresa = 'PAULINHO') and (DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO = ' + FloatToStr(QNotaEntradaCOD_OPERACAO.Value)) = 'D') then
  begin
    VlrItemNFDevolucaoPaulinho;
  end;
  //*** REGRAS ESPECÍFICAS PARA NOTA AGRICOLA ***
  if pTipoNota = 'AGRICOLA' then
  begin
    wUnitario := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + FloatToStr(QItemNFCod_produto.Value), True);
    if Trim(wUnitario) <> '' then
      QItemNFVal_Unitario.Value := StrToFloat(wUnitario)
    else
      ShowMessage('Produto sem Preço cadastrado!');
  end;
  if QItemNFCod_Produto.Value <> 0 then
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO', 'COD_PRODUTO=' + FloatToStr(QItemNFCod_Produto.Value), True) <> 'ATIVO' then
      raise Exception.Create('Produto '+QItemNFCOD_PRODUTO.AsString+' sem permissão para venda - Ver situação do produto!');

  if DMOperacao.QOperacaoCod_Tributacao.Value > 0 then //Puxar Trib. da operação. Solic. Rafa Autos e Pickups. Junior 11/05/26
  begin
    QItemNFCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
  end
  else
  begin
    wTributacao := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
    if Trim(wTributacao) <> '' then
      QItemNFCod_Tributacao.Text := Trim(wTributacao);
  end;

  // Reforma Tributária
  if DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Value > 0 then
    QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' + DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Text)
  else
    QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' +
                                             '(SELECT COD_CLASS_TRIB_IBS_CBS_CMP FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text + ')');
end;

procedure TDMNotaEntrada.QNotaEntradaAfterOpen(DataSet: TDataSet);
begin

  QSomaItemNota.Close;
  QSomaItemNota.Open;
  QCstIpiCons.Close;
  QCstIpiCons.SetVariable('IND_TIPO', 'E');
  QCstIpiCons.Open;
  QCstPisCons.Close;
  QCstPisCons.SetVariable('IND_TIPO','S');
  QCstPisCons.Open;
  QCstCofinsCons.Close;
  QCstCofinsCons.SetVariable('IND_TIPO','S');
  QCstCofinsCons.Open;
  QSomaItemNota.Close;
  QSomaItemNota.Open;
  PopulaCalcFields;

end;

procedure TDMNotaEntrada.QSomaItemNotaCalcFields(DataSet: TDataSet);
begin

  with DMCadastro, DMTributacao do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', QNotaEntradaCOD_CADASTRO.Value);
    QCadastro.Open;
    QTributacao.Close;
    QTributacao.SetVariable('PK', QItemNFCOD_TRIBUTACAO.Value);
    QTributacao.Open;
    // Se possui CST de substituição tributária anterior, não deve alterar o valor da nota
    if ((DMParamSistema.CodEmpresa <> 'FERRAGMED')  and (DMParamSistema.CodEmpresa <> 'KREUZ')    and (DMParamSistema.CodEmpresa <> 'DINIZ')   and
         (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and (DMParamSistema.CodEmpresa <> 'GGIRARDI') and (DMParamSistema.CodEmpresa <> 'LISTELL') and
         (DMParamSistema.CodEmpresa <> 'ARZ')       and (DMParamSistema.CodEmpresa <> 'CASATINTAS') ) and
       ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
          or (QTributacaoDESC_CSOSN.Value = '500')
      and
      (
        (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
        and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
      ))
      then  // Sem ICMS ST
      QSomaItemNotasval_total_nota.Value := QSomaItemNotaSVAL_TOTAL.Value
      + QSomaItemNotaSVAL_IPI.Value
      + QNotaEntradaVAL_DESPESAS.Value
      - QNotaEntradaVAL_DESCONTO.Value
      - Bib.ift(QNotaEntradaCOD_SERIE_MODELO.Value <> '98', 0,
        Bib.ift((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 3) and
          (QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO.Value = 'SIM'), QSomaItemNotaSVAL_PIS.Value +
        QSomaItemNotaSVAL_COFINS.Value, 0) +
        QSomaItemNotaSVAL_CSLL.Value +
        QSomaItemNotaSVAL_INSS.Value +
        QSomaItemNotaSVAL_IR.Value)
      + Bib.ift( QNotaEntradaNUM_CONHECIMENTO_FRETE.IsNull,QSomaItemNotaSVAL_FRETE.Value,0) //REINCLUIDO POR PROBLEMAS NA GRASEL - CLEBER 15/03/2021 -
                                                                                           //    Alterado por Adriel
                                                                                           //para somar o valor do frete
                                                                                           //na NF-e (09/07/2013)
                                                                                           //Soma somente se o nº do
                                                                                           //conhecimento for nulo
    else //INCLUIDO NOVAMENTE POR PROBLEMAS NA GRASEL Com ICMS ST //RETIRADO - IF ERRADO (NÃO ESTAVA CALCULANDO ST NO CUSTO DO PRODUTO QUANDO INFORMADO CST (CSOSN FUNCIONAVA POQUE O IF ESTAVA ERRADO NÃO FECHADO APOS A VERIFICAÇÃO DO CSON 500). Junior 10/02/2021. FERRAGEM MEDIANEIRA.
      QSomaItemNotasval_total_nota.Value := QSomaItemNotaSVAL_TOTAL.Value
        + QSomaItemNotaSVAL_IPI.Value
        + QNotaEntradaVAL_DESPESAS.Value
        - QNotaEntradaVAL_DESCONTO.Value
        + QSomaItemNotaSVAL_ICMS_SUBST.Value
        + QNotaEntradaVAL_SUBST_TRIBUT.Value
        - Bib.ift(QNotaEntradaCOD_SERIE_MODELO.Value <> '98', 0,
          Bib.ift((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 3) and
            (QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO.Value = 'SIM'), QSomaItemNotaSVAL_PIS.Value +
          QSomaItemNotaSVAL_COFINS.Value, 0) +
          QSomaItemNotaSVAL_CSLL.Value +
          QSomaItemNotaSVAL_INSS.Value +
          QSomaItemNotaSVAL_IR.Value)
        + Bib.ift( QNotaEntradaNUM_CONHECIMENTO_FRETE.IsNull,QSomaItemNotaSVAL_FRETE.Value,0); //Alterado por Adriel
                                                                                       //para somar o valor do frete
                                                                                       //na NF-e (09/07/2013)
                                                                                       //Soma somente se o nº do
                                                                                       //conhecimento for nulo
    end;


    //para nf-e, nao deve descontar funrural no valor total da nota
    //o valor total da nota na tela pode aparecer descontado o valor funrural,
    //mas no xml da nf-e o valor total vai ficar sem o desconto
  QSomaItemNotasval_total_nfe.Value := QSomaItemNotasval_total_nota.Value;

  if QSomaItemNotaIND_FUNRURAL.Value = 'S' then // porque tem opcao de calcular e nao descontar do total
     QSomaItemNotasval_total_nota.Value := QSomaItemNotasval_total_nota.Value - QNotaEntradaVAL_FUNRURAL.Value;
  QSomaItemNotasval_total_nota.Value := QSomaItemNotasval_total_nota.Value - QNotaEntradaVAL_SENAR.Value;

end;

procedure TDMNotaEntrada.QItemNFQT_QUANTIDADEValidate(Sender: TField);
begin
  with DMNotaEntrada do
  begin
    if QItemNF.State = DsEdit then
    begin
      QAtuBaixaOC.Close;
      QAtuBaixaOC.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
      QAtuBaixaOC.Open;
      if QAtuBaixaOCCOD_ORDEM_COMPRA_ITEM.Value <> 0 then
      begin
        QAtuBaixaOC.Edit;
        QAtuBaixaOCQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
        QAtuBaixaOC.Post;
      end;
      QAtuBaixaOC.Close;
    end;
  end;
end;

procedure TDMNotaEntrada.QRFechamentoCereaisCalcFields(DataSet: TDataSet);
var
  wDtVencto: string;
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB' then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT DT_VENCIMENTO FROM TB_CONTA_PAGAR_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRFechamentoCereaisCod_Nota_Cab.Value));
    if wDtVencto <> '' then
      QRFechamentoCereaisdt_vencimento.Value := StrToDate(wDtVencto);
  end
  else
    QRFechamentoCereaisdt_vencimento.Value := QRFechamentoCereaisDt_Emissao.Value;
end;


procedure TDMNotaEntrada.QNotaEntradaVAL_FRETE_TONChange(Sender: TField);
var
  wPeso: Real;
  wEmbalagem, wUnidade, wTipoProduto: string;
begin
  wPeso := 0;
  QItemNF.First;
  while not QItemNF.Eof do
  begin
    wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
    wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
    if wTipoProduto <> 'AGRICOLA' then
      wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
    if wEmbalagem <> '' then
      wPeso := wPeso + QItemNFQT_Quantidade.Value * StrToFloat(wEmbalagem)
    else
      wPeso := wPeso + QItemNFQT_Quantidade.Value;
    QItemNF.Next;
  end;
  if QNotaEntradaVal_Frete_Ton.Value > 0 then
  begin
    if wPeso <> 0 then
      QNotaEntradaVal_Frete.Value := wPeso * QNotaEntradaVal_Frete_Ton.Value;
    if (Trim(wUnidade) <> 'T') and (QNotaEntradaVal_Frete.Value > 0) then
      QNotaEntradaVal_Frete.Value := QNotaEntradaVal_Frete.Value / 1000;
  end;
end;

procedure TDMNotaEntrada.Atualiza_Conhecimento;
begin
  DMNotaSaida.Conhecimento_Frete(QNotaEntradaCod_Nota_Cab.Value, QNotaEntradaNum_Conhecimento_Frete.Value, QNotaEntradaCod_Filial.Value, QNotaEntradaCod_Transportador.Value,
    QNotaEntradaCod_Operacao_Cf.Value, QNotaEntradaCod_Tributacao_Frete.Value, QNotaEntradaVal_Pedagio.Value, QNotaEntradaVal_Icm_Frete.Value, QNotaEntradaVal_Frete_Ton.Value,
    QNotaEntradaVal_Frete.Value, QNotaEntradaDesc_Placa.Value, QNotaEntradaDesc_Transportadora.Value, QNotaEntradaCod_Contrato_Vend.Text,
    QNotaEntradaDt_Emissao_Cf.Value);

end;

procedure TDMNotaEntrada.QNotaImpostoServicoBeforeDelete(
  DataSet: TDataSet);
begin
  if QNotaEntrada.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaEntrada.QNotaImpostoServicoBeforeEdit(DataSet: TDataSet);
begin
  if QNotaEntrada.State = dsInsert then
  begin
    QNotaEntrada.Post;
    QNotaEntrada.Edit;
  end;
  if QNotaEntrada.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaEntrada.QNotaImpostoServicoBeforeInsert(
  DataSet: TDataSet);
begin
  if QNotaEntrada.State = dsInsert then
  begin
    QNotaEntrada.Post;
    QNotaEntrada.Edit;
  end;
  if QNotaEntrada.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaEntrada.QNotaImpostoServicoCalcFields(DataSet: TDataSet);
var
  wEstado: boolean;
  wVal: string;
begin

  if QNotaImpostoServicoCOD_IMPOSTO.AsString <> '' then
    QNotaImpostoServicodesc_imposto.Value := DMOracle.BuscaNome('SELECT DESC_IMPOSTO FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.AsString, True);

  if (QNotaImpostoServico.State in [dsinsert, dsEdit]) and (QNotaImpostoServicoCOD_IMPOSTO.Text <> '') and
    (QNotaImpostoServicoVAL_IMPOSTO.Text = '') then
  begin
    wEstado := QNotaImpostoServico.AutoCalcFields;
    QNotaImpostoServico.AutoCalcFields := false;
    try
      wVal := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text, True);
      if wval <> '' then
        QNotaImpostoServicoVAL_IMPOSTO.Value := StrToFloat(wVal) * (QSomaItemNotaSVAL_TOTAL.Value - QSomaItemNotaSVAL_DESCONTO.Value) / 100;
    finally
      QNotaImpostoServico.AutoCalcFields := wEstado;
    end;
  end;
 

end;

procedure TDMNotaEntrada.QRNotaServicoCalcFields(DataSet: TDataSet);
begin
  QRNotaServicoSval_total.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL) FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + QRNotaServicoCOD_NOTA_cab.Text));
end;

procedure TDMNotaEntrada.QItemNFCOD_PRODUTOChange(Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FGLASS' then
    VlrItemNFMarca;
end;

//procedure q calcula o valor total do item de acordo com a marca.

procedure TDMNotaEntrada.VlrItemNFMarca;
var
  wMarca: string;
begin
  if (QItemNF.State in [DsEdit, DsInsert]) and (QItemNFCOD_PRODUTO.Value > 0) then
  begin
    wMarca := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QNotaEntradaCOD_CADASTRO.Text, True);
    wMarca := DMOracle.BuscaNome('SELECT COD_MARCA FROM TB_MARCA', 'DESC_MARCA = ' + QuotedStr(wMarca), True);
    if (wMarca <> '') then
      QItemNFVAL_TOTAL.Value := QItemNFQT_QUANTIDADE.Value * StrToFloat('0' +
        DMOracle.BuscaNome('SELECT VAL_CUSTO FROM TB_PRODUTO_MARCA', 'COD_MARCA = ' +
        wMarca + ' AND COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text, True));
  end;
end;

//procedure q calcula o valor total do item na devolução. Solicitado por Paulinho. Junior 19/12/2019
procedure TDMNotaEntrada.VlrItemNFDevolucaoPaulinho;
var
  wVlrUnitario: string;
begin
  if (QItemNF.State in [DsEdit, DsInsert]) and (QItemNFCOD_PRODUTO.Value > 0) then
  begin
    wVlrUnitario := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text, True);
    if (wVlrUnitario <> '') then
      QItemNFVAL_TOTAL.Value := QItemNFQT_QUANTIDADE.Value * StrToFloat(wVlrunitario);
  end;
end;

procedure TDMNotaEntrada.QItemNFQT_QUANTIDADEChange(Sender: TField);
var wPrecoUnitario,wVlrUnitario : String;
begin  //Paulinho solicitou que puxe o valor do produto na devolução que for lançado o produto manual. Junior 19/12/2019.
  if (DMParamSistema.CodEmpresa = 'PAULINHO') and (DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO = ' + FloatToStr(QNotaEntradaCOD_OPERACAO.Value)) = 'D') then
    VlrItemNFDevolucaoPaulinho;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FGLASS' then
    VlrItemNFMarca;
end;

procedure TDMNotaEntrada.QNotaEntradaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMNotaSaida.VerificaNotaDigitada('E') then //Se der erro no Post, verificar se existe nota digitada (evitar violação da UK_NOTA_CAB)
    Action := daAbort;
end;

procedure TDMNotaEntrada.AcertaValoresNota;
begin
  //Chamando funcao de acerto de valores no banco
  if not QNotaEntradaCOD_NOTA_CAB.IsNull then
    DMNotaSaida.OPVenda.CallStringFunction('ACERTA_VALOR_NOTA', ['NOTA', QNotaEntradaCOD_NOTA_CAB.Value]);
end;

procedure TDMNotaEntrada.QNotaEntradaBeforeClose(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
end;

procedure TDMNotaEntrada.QNotaEntradaDESC_CHAVE_ACESSO_CTEValidate(
  Sender: TField);
begin
  if QNotaEntradaDESC_CHAVE_ACESSO_CTE.Value <> '' then
  begin
    if UpperCase(Copy(QNotaEntradaDESC_CHAVE_ACESSO_CTE.Value,
      0,3)) <> 'CTE' then
      QNotaEntradaDESC_CHAVE_ACESSO_CTE.Value :=
        'CTe' + QNotaEntradaDESC_CHAVE_ACESSO_CTE.Value;
    if Length(QNotaEntradaDESC_CHAVE_ACESSO_CTE.Value) <> 47 then
    begin
      MessageDlg('Chave de acesso deve ter 47 caracteres', mtError, [mbOk],0);
      Abort;
    end;
  end;  
end;

procedure TDMNotaEntrada.QNotaEntradaCOD_OPERACAOChange(Sender: TField);
begin
  if QNotaEntradaCOD_OPERACAO.Value > 0 then
  begin
    with DMOperacao do
    begin
      QOperacao.Close;
      QOperacao.SetVariable('Pk', QNotaEntradaCod_Operacao.Value);
      QOperacao.Open;
      if (Pos(QOperacaoNUM_NATUREZA_EST_NOVO.Text,CFOPS_DEVOLUCAO) > 0) or
         (Pos(QOperacaoNUM_NATUREZA_INT_NOVO.Text,CFOPS_DEVOLUCAO) > 0) then
        QNotaEntradaIND_FINALIDADE_NFE.Value := 4 //Devolução de Mercadoria;
      else
        if QNotaEntradaIND_FINALIDADE_NFE.Value = 4 then
          QNotaEntradaIND_FINALIDADE_NFE.Value := 1;

      if QItemNF.RecordCount  > 0 then
        MessageDlg('Após alterar a operação é recomendado verificar' +
          ' a cfop de cada item na aba Itens', mtInformation,[mbOk],0);
    end;
  end;
end;

procedure TDMNotaEntrada.ConfirmaPagamentoNFCe;
begin
  QPagamento.Edit;
  QPagamentoIND_CONFIRMADO.Value := 'S';
  QPagamento.Post;
  QPagamento.Next;
end;

procedure TDMNotaEntrada.InserePagamentoNFCe(Valor: Real;
  Descricao: String);
begin
  QPagamento.Insert;
  QPagamentoVAL_PAGAMENTO.Value := Valor;
  QPagamentoVAL_VALOR.Value := Valor;
  QPagamentoDESC_PAGAMENTO.Value := Descricao;
  QPagamentoIND_CONFIRMADO.Value := 'S';
  QPagamento.Post;
end;

procedure TDMNotaEntrada.QPagamentoAfterInsert(DataSet: TDataSet);
begin
  QPagamentoCOD_NOTA_CAB.Value := QNotaEntradaCOD_NOTA_CAB.Value;
end;

procedure TDMNotaEntrada.QFCCIABeforePost(DataSet: TDataSet);
begin
    QFCCIANUM_ORDEM_FCCIA.Value := NumeroOrdemFCCIA;
end;

function TDMNotaEntrada.NumeroOrdemFCCIA: integer;
begin
  if fNumeroOrdemFCCIA = Nil then
    fNumeroOrdemFCCIA := TVariantMap.Create;
  if fNumeroOrdemFCCIA.contem(QNotaEntradaCOD_NOTA_CAB.Value) then
    result := fNumeroOrdemFCCIA.getValue(QNotaEntradaCOD_NOTA_CAB.Value)
  else
  begin
    fNumeroOrdemFCCIA.addValue(QNotaEntradaCOD_NOTA_CAB.Value, DMSequencia.Sequencia(QNotaEntradaCOD_FILIAL.Value, 'FCCIA'));
    result := fNumeroOrdemFCCIA.getValue(QNotaEntradaCOD_NOTA_CAB.Value);
  end;                                                                   
end;

procedure TDMNotaEntrada.QFCCIAAfterOpen(DataSet: TDataSet);
begin
  if fNumeroOrdemFCCIA = Nil then
    fNumeroOrdemFCCIA := TVariantMap.Create;
  if not QFCCIA.Eof then
    fNumeroOrdemFCCIA.addValue(QNotaEntradaCOD_NOTA_CAB.Value, QFCCIANUM_ORDEM_FCCIA.Value);
  QFCCIAParcelaCredito.Open;
end;

procedure TDMNotaEntrada.CDSAlteraPrecoPERC_REAJUSTEChange(Sender: TField);
begin
  //CDSAlteraPreco.Edit;
  CdsAlteraPrecoVal_Unitario_Tabela.Value := CdsAlteraPrecoVal_Custo.Value + (CdsAlteraPrecoVal_Custo.Value *
      (Bib.ift(CDSAlteraPrecoPERC_REAJUSTE.Value / 100 = 0, 1,CDSAlteraPrecoPERC_REAJUSTE.Value/100)));
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' Then
    CdsAlteraPrecoVal_Unitario_Tabela.Value := Trunc(CdsAlteraPrecoVal_Unitario_Tabela.Value);
  //CDSAlteraPreco.DisableControls;
  //CDSAlteraPreco.AutoCalcFields := false;
  //CDSAlteraPreco.Post;
  //CDSAlteraPreco.EnableControls;
  //CDSAlteraPreco.AutoCalcFields := true;
end;

procedure TDMNotaEntrada.QRFunRuralCalcFields(DataSet: TDataSet);
begin
  QrFunruralSVal_Total_Aux.VAlue := StrToFloat(DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL) FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + QRFunruralCOD_NOTA_cab.Text));
end;

procedure TDMNotaEntrada.QSomaItemNotaAfterOpen(DataSet: TDataSet);
begin

    if BibliotecaDB = nil then
      BibliotecaDB := TBibliotecaDB.Create;

    BibliotecaDB.NotaEntradaQSomaItemNotaCalcFields(DataSet);

end;

procedure TDMNotaEntrada.QNotaEntradaNUM_CONHECIMENTO_FRETEChange(
  Sender: TField);
begin
  if (DMParamSistema.CodEmpresa = 'KREUZ') then  //Solicitação Rubens. Junior 22/12/2021
  begin
    if Trim(QNotaEntradaNUM_CONHECIMENTO_FRETE.Text) <> '' then
    begin
      QNotaEntradaCOD_SERIE_MODELO_CF.Value := '57';
      QNotaEntradaCOD_OPERACAO_CF.Value := 9;
      QNotaEntradaCOD_TRIBUTACAO_FRETE.Value := 3;
      QNotaEntradaIND_TIPO_FRETE.Value := 'FOB';
    end;
  end;
end;

procedure TDMNotaEntrada.QNotaEntradaConsCalcFields(DataSet: TDataSet);
begin
//NUTRIVET SOLICITOU O CAMPO FORMA DE PAGAMENTO NO GRID DA TELA FNOTASAIDACONS. Junior 25/02/2014
  if QNotaEntradaConsIND_CONDICAO_PAGTO.Value = '1' then
    QNotaEntradaConsdesc_pagamento.Text := 'A VISTA';
  if QNotaEntradaConsIND_CONDICAO_PAGTO.Value = '2' then
    QNotaEntradaConsdesc_pagamento.Text := 'A PRAZO';
  if QNotaEntradaConsIND_CONDICAO_PAGTO.Value = '3' then
    QNotaEntradaConsdesc_pagamento.Text := 'OUTROS';
end;

procedure TDMNotaEntrada.CDSAlteraPrecoPERC_REAJUSTE_ATACADOChange(
  Sender: TField);
begin
  CDSAlteraPrecoNOVO_VAL_ATACADO.Value := CdsAlteraPrecoVal_Custo.Value + (CdsAlteraPrecoVal_Custo.Value *
      (Bib.ift(CDSAlteraPrecoPERC_REAJUSTE_ATACADO.Value / 100 = 0, 1,CDSAlteraPrecoPERC_REAJUSTE_ATACADO.Value/100)));
end;

end.

