unit URelatorioVenda_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMRelatorio_Venda = class(TDataModule)
    QRSecretaria: TOracleDataSet1;
    QRVendedor: TOracleDataSet1;
    QRVendedorCOD_VENDEDOR: TFloatField;
    QRVendedorNOME_VENDEDOR: TStringField;
    QRVendedorCOD_FILIAL: TFloatField;
    QRVendedorDESC_FILIAL: TStringField;
    QRVendedorCOD_PRODUTO: TFloatField;
    QRVendedorSQT_QUANTIDADE: TFloatField;
    QRVendedorSVAL_TOTAL: TFloatField;
    QRMapaVendaRes: TOracleDataSet1;
    QRMapaVendaResCOD_FILIAL: TFloatField;
    QRMapaVendaResDESC_FILIAL: TStringField;
    QRMapaVendaResCOD_PRODUTO: TFloatField;
    QRMapaVendaResSQT_QUANTIDADE: TFloatField;
    QRMapaVendaResSVAL_TOTAL: TFloatField;
    QRVendedorCMedio2: TOracleDataSet1;
    QRVendedorCMedio2COD_PRODUTO: TFloatField;
    QRVendedorCMedio2COD_CLASSE: TFloatField;
    QRVendedorCMedio2DESC_CLASSE: TStringField;
    QRVendedorCMedio2SVAL_TOTAL: TFloatField;
    QRVendedorCMedio2SQT_QUANTIDADE: TFloatField;
    QRVendedorCMedio2SQT_KILOS: TFloatField;
    QRVendedorCMedio2SQT_KILOS_BONIFICACAO: TFloatField;
    QRVendedorCMedio2sPreco_Medio_KG: TFloatField;
    QRVendedorCMedio2sPreco_Medio: TFloatField;
    QrVendaHistorico: TOracleDataSet1;
    QrVendaHistoricoCOD_CADASTRO: TIntegerField;
    QrVendaHistoricoNUM_NOTA: TIntegerField;
    QrVendaHistoricoCOD_SERIE: TStringField;
    QrVendaHistoricoIND_CONDICAO_PAGTO: TStringField;
    QrVendaHistoricoCOD_NOTA_CAB: TIntegerField;
    QrVendaHistoricoDT_EMISSAO: TDateTimeField;
    QrVendaHistoricoNOME: TStringField;
    QrVendaHistoricoVAL_TOTAL: TFloatField;
    QrVendaHistoricodt_vencimento: TDateField;
    QrVendaHistoricocond_pagamento: TStringField;
    QRComissao: TOracleDataSet1;
    QRComissaoNOME_VENDEDOR: TStringField;
    QRComissaoDESC_FILIAL: TStringField;
    QRComissaoSQT_QUANTIDADE: TFloatField;
    QRComissaoSVAL_TOTAL: TFloatField;
    QRComissaoCliente: TOracleDataSet1;
    QRComissaoClienteNOME_VENDEDOR: TStringField;
    QRComissaoClienteNOME_CADASTRO: TStringField;
    QRComissaoClienteCOD_SERIE: TStringField;
    QRComissaoClienteDT_EMISSAO: TDateTimeField;
    QRComissaoClienteSQT_QUANTIDADE: TFloatField;
    QRComissaoClienteSVAL_TOTAL: TFloatField;
    QrReceberHistorico: TOracleDataSet1;
    QrReceberHistoricoDT_VENCIMENTO: TDateTimeField;
    QrReceberHistoricoCOD_NOTA_CAB: TIntegerField;
    QrReceberHistoricoDT_MOVIMENTO: TDateTimeField;
    QrReceberHistoricoVAL_MOVIMENTO: TFloatField;
    QrReceberHistoricoIND_TIPO_MOVIMENTO: TStringField;
    QrReceberHistoricoDESC_OBSERVACAO: TStringField;
    QRVendedorCMedio: TOracleDataSet1;
    QRVendedorCMedioCOD_VENDEDOR: TFloatField;
    QRVendedorCMedioNOME_VENDEDOR: TStringField;
    QRVendedorCMedioCOD_PRODUTO: TFloatField;
    QRVendedorCMedioCOD_CLASSE: TFloatField;
    QRVendedorCMedioDESC_CLASSE: TStringField;
    QRVendedorCMedioSVAL_TOTAL: TFloatField;
    QRVendedorCMedioSQT_QUANTIDADE: TFloatField;
    QRVendedorCMedioSQT_KILOS: TFloatField;
    QRVendedorCMedioSQT_KILOS_BONIFICACAO: TFloatField;
    QRVendedorCMediosPreco_Medio: TFloatField;
    QRVendedorCMediosPreco_Medio_KG: TFloatField;
    QRMapaVenda: TOracleDataSet1;
    QRMapaVendaDIA: TStringField;
    QRMapaVendaSQT_QUANTIDADE: TFloatField;
    QRMapaVendaSVAL_TOTAL: TFloatField;
    QrSeguroCarga: TOracleDataSet1;
    QrResumoCliente: TOracleDataSet1;
    QrResumoClienteSTIPO: TStringField;
    QrResumoClienteCOD_PRODUTO: TFloatField;
    QrResumoClienteCOD_CADASTRO: TFloatField;
    QrResumoClienteNOMECADASTRO: TStringField;
    QrResumoClienteCOD_VENDEDOR: TFloatField;
    QrResumoClienteNUM_NOTA: TFloatField;
    QrResumoClienteDT_EMISSAO: TDateTimeField;
    QrResumoClienteDT_MES: TFloatField;
    QrResumoClienteSQT_QUANTIDADE: TFloatField;
    QrResumoClienteSVAL_TOTAL: TFloatField;
    QRMaioresClientesVend: TOracleDataSet1;
    QRMaioresClientesVendCOD_CADASTRO: TIntegerField;
    QRMaioresClientesVendNOME: TStringField;
    QRMaioresClientesVendCOD_VENDEDOR: TIntegerField;
    QRMaioresClientesVendNOME_VENDEDOR: TStringField;
    QRMaioresClientesVendSQT_QUANTIDADE: TFloatField;
    QRMaioresClientesVendSVAL_TOTAL: TFloatField;
    QRQuotaVend2: TOracleDataSet1;
    QRQuotaVend2SQT_QUOTA: TFloatField;
    QRMilhagem: TOracleDataSet1;
    QRMilhagemDT_EMISSAO: TDateTimeField;
    QRMilhagemNUM_NOTA: TIntegerField;
    QRMilhagemCOD_OPERACAO: TIntegerField;
    QRMilhagemCOD_SERIE: TStringField;
    QRMilhagemIND_CONDICAO_PAGTO: TStringField;
    QRMilhagemIND_MILHAGEM: TStringField;
    QRMilhagemVAL_TOTAL: TFloatField;
    QRMilhagemTotalAberto: TFloatField;
    QRMilhagemTotalPago: TFloatField;
    QRMilhagemCondPGTO: TStringField;
    QRContaCorrente: TOracleDataSet1;
    QRContaCorrenteCOD_NOTA_CAB: TIntegerField;
    QRContaCorrenteDT_EMISSAO: TDateTimeField;
    QRContaCorrenteNUM_NOTA: TIntegerField;
    QRContaCorrenteCOD_SERIE: TStringField;
    QRContaCorrenteCOD_CADASTRO: TIntegerField;
    QRContaCorrenteNOME_CADASTRO: TStringField;
    QRVendClasse: TOracleDataSet1;
    QRVendClasseCOD_VENDEDOR: TFloatField;
    QRVendClasseNOME: TStringField;
    QRVendClasseDESC_CLASSE: TStringField;
    QRVendClasseSVAL_TOTAL_CX: TFloatField;
    QRVendClasseSVAL_TOTAL_CR: TFloatField;
    QRVendClasseSVAL_TOTAL_CC: TFloatField;
    QRContaCorrenteVal_Total: TFloatField;
    QRQuotaVend3: TOracleDataSet1;
    QRQuotaVend3COD_VENDEDOR: TFloatField;
    QRQuotaVend3NOME: TStringField;
    QRQuotaVend3SQT_VENDA: TFloatField;
    QRQuotaVend3SQT_QUOTA: TFloatField;
    QRQuotaVend3SVAL_VENDA: TFloatField;
    QRQuotaVend: TOracleDataSet1;
    QRVendaVendClasse: TOracleDataSet1;
    QRVendaVendClasseCOD_PRODUTO: TFloatField;
    QRVendaVendClasseCOD_CADASTRO: TIntegerField;
    QRVendaVendClasseCOD_CLASSE: TIntegerField;
    QRVendaVendClasseDESC_CLASSE: TStringField;
    QRVendaVendClasseNOME: TStringField;
    QRVendaVendClasseSQT_QUANTIDADE: TFloatField;
    QRVendaVendClasseSVAL_TOTAL: TFloatField;
    QRVendaVendClassenome_fornecedor: TStringField;
    QrReceber_Titulos: TOracleDataSet1;
    QrReceber_TitulosCOD_FINALIDADE: TIntegerField;
    QrReceber_TitulosCOD_FILIAL: TIntegerField;
    QrReceber_TitulosNUM_TITULO: TIntegerField;
    QrReceber_TitulosNUM_PARCELA: TIntegerField;
    QrReceber_TitulosDESC_TIPO_DOCUMENTO: TStringField;
    QrReceber_TitulosDT_VENCIMENTO: TDateTimeField;
    QrReceber_TitulosDT_EMISSAO: TDateTimeField;
    QrReceber_TitulosVAL_TITULO: TFloatField;
    QrReceber_TitulosIND_SITUACAO: TStringField;
    QrReceber_TitulosCOD_CADASTRO: TIntegerField;
    QrReceber_TitulosNOME: TStringField;
    QRNota_ComCheque: TOracleDataSet1;
    QRNota_ComChequeNOME: TStringField;
    QRNota_ComChequeSVAL_PRAZO1: TFloatField;
    QRNota_ComChequeSVAL_PRAZO2: TFloatField;
    QRNota_ComChequeSVAL_PRAZO3: TFloatField;
    QRNota_ComChequeSVAL_PRAZO4: TFloatField;
    QRNota_ComChequeSVAL_LONGO_PRAZO: TFloatField;
    QRNota_ComChequeSVAL_TOTAL: TFloatField;
    QRClaspar: TOracleDataSet1;
    QRClasparNUM_CERTIFICADO: TFloatField;
    QRClasparCL_COD_SERIE: TStringField;
    QRClasparCL_COD_ESTADO: TStringField;
    QRClasparCL_DT_EMISSAO: TDateTimeField;
    QRClasparDT_VALIDADE: TDateTimeField;
    QRClasparCOD_REG_MAARA: TStringField;
    QRClasparPERC_UMIDADE: TFloatField;
    QRClasparDESC_SAFRA: TStringField;
    QRClasparQT_CLASSIFICADO: TFloatField;
    QRClasparDESC_RENDA: TStringField;
    QRClasparPERC_INTEIRO: TFloatField;
    QRClasparPERC_QUEBRADOS: TFloatField;
    QRClasparDESC_MARCA: TStringField;
    QRClasparDESC_GRUPO: TStringField;
    QRClasparDESC_CLASSE: TStringField;
    QRClasparDESC_TIPO: TStringField;
    QRClasparDESC_REGIONAL: TStringField;
    QRClasparDESC_POSTO: TStringField;
    QRClasparNF_EMISSAO: TDateTimeField;
    QRClasparNUM_NOTA: TIntegerField;
    QRClasparQT_QUANTIDADE: TFloatField;
    QRClasparNOME_CADASTRO: TStringField;
    QRClasparDESC_CIDADE: TStringField;
    QRClasparDESC_FILIAL: TStringField;
    QRClasparDESC_LOTE: TStringField;
    QRClasparNUM_DESDOBRAMENTO: TIntegerField;
    QRClasparIND_SITUACAO: TStringField;
    QRVendProdPeriodo: TOracleDataSet1;
    QRVendProdPeriodoVal_Custo_Medio: TFloatField;
    QRMaioresClientes: TOracleDataSet1;
    QRMaioresClientesCOD_CADASTRO: TIntegerField;
    QRMaioresClientesNOME: TStringField;
    QRMaioresClientesSQT_QUANTIDADE: TFloatField;
    QRMaioresClientesSVAL_TOTAL: TFloatField;
    QRVendasVndRegiao: TOracleDataSet1;
    QRVendasVndRegiaoDESC_REGIAO: TStringField;
    QRVendasVndRegiaoNOME: TStringField;
    QRVendasVndRegiaoSQT_QUANTIDADE: TFloatField;
    QRVendasVndRegiaoSVAL_TOTAL: TFloatField;
    QRVendasporVendedor: TOracleDataSet1;
    QRVendasporVendedorNOME: TStringField;
    QRVendasporVendedorCOD_VENDEDOR: TFloatField;
    QRVendasporVendedorCOD_ESTADO: TStringField;
    QRVendasporVendedorQT_QUANTIDADE: TFloatField;
    QRMovMercadoria: TOracleDataSet1;
    QRMovMercadoriaCOD_CADASTRO: TIntegerField;
    QRMovMercadoriaNOME_CADASTRO: TStringField;
    QRMovMercadoriaCOD_NOTA_CAB: TIntegerField;
    QRMovMercadoriaCOD_SERIE: TStringField;
    QRMovMercadoriaNUM_NOTA: TIntegerField;
    QRMovMercadoriaDT_EMISSAO: TDateTimeField;
    QRMovMercadoriaCOD_OPERACAO: TIntegerField;
    QRMovMercadoriaDESC_OPERACAO: TStringField;
    QRInadimplencia: TOracleDataSet1;
    QRInadimplenciaNOME_VENDEDOR: TStringField;
    QRInadimplenciaSVAL_VENDA: TFloatField;
    QRInadimplenciaSVAL_RECEBER: TFloatField;
    QRClassePgtoVend: TOracleDataSet1;
    QRClassePgto: TOracleDataSet1;
    QRMovEntradaSaida: TOracleDataSet1;
    QRMovEntradaSaidaCOD_PRODUTO: TFloatField;
    QRMovEntradaSaidaDESC_LOTE: TStringField;
    QRMovEntradaSaidaSQT_ENTRADA: TFloatField;
    QRMovEntradaSaidaSVAL_UNIT_ENTRADA: TFloatField;
    QRMovEntradaSaidaSVAL_TOTAL_ENTRADA: TFloatField;
    QRMovEntradaSaidaSQT_EMB_ENTRADA: TFloatField;
    QRMovEntradaSaidaSQT_SAIDA: TFloatField;
    QRMovEntradaSaidaSVAL_UNIT_SAIDA: TFloatField;
    QRMovEntradaSaidaSVAL_TOTAL_SAIDA: TFloatField;
    QRMovEntradaSaidaSQT_EMB_SAIDA: TFloatField;
    QRReciboComissao: TOracleDataSet1;
    QRReciboComissaoNOME_VENDEDOR: TStringField;
    QRReciboComissaoDESC_FILIAL: TStringField;
    QRReciboComissaoDESC_CIDADE: TStringField;
    QRReciboComissaoDESC_CEP: TStringField;
    QRReciboComissaoDESC_ENDERECO: TStringField;
    QRReciboComissaoDESC_TELEFONE: TStringField;
    QRReciboComissaoCOD_ESTADO: TStringField;
    QRReciboComissaoval_extenso: TStringField;
    QRContaCorrente2: TOracleDataSet1;
    QRContaCorrente2COD_CADASTRO: TIntegerField;
    QRContaCorrente2COD_FILIAL: TIntegerField;
    QRContaCorrente2DESC_FILIAL: TStringField;
    QRContaCorrente2NOME: TStringField;
    QRPrazoVenda: TOracleDataSet1;
    QRPrazoVendaCOD_FILIAL: TFloatField;
    QRPrazoVendaDESC_FILIAL: TStringField;
    QRPrazoVendaCOD_VENDEDOR: TFloatField;
    QRPrazoVendaNOME_VENDEDOR: TStringField;
    QRPrazoVendaSVAL_AVISTA: TFloatField;
    QRPrazoVendaSVAL_PRAZO1: TFloatField;
    QRPrazoVendaSVAL_PRAZO2: TFloatField;
    QRPrazoVendaSVAL_PRAZO3: TFloatField;
    QRPrazoVendaSVAL_PRAZO4: TFloatField;
    QRPrazoVendaSVAL_LONGO_PRAZO: TFloatField;
    QRPrazoVendaSVAL_TOTAL: TFloatField;
    QRVendaClasse: TOracleDataSet1;
    QrLotesClaspar: TOracleDataSet1;
    QrLotesClasparNUM_NOTA: TIntegerField;
    QrLotesClasparDT_EMISSAO_NOTA: TDateTimeField;
    QrLotesClasparDESC_PLACA: TStringField;
    QrLotesClasparNOME: TStringField;
    QrLotesClasparCOD_ESTADO_CADASTRO: TStringField;
    QrLotesClasparQT_QUANTIDADE: TFloatField;
    QrLotesClasparCOD_NOTA_ITEM: TIntegerField;
    QrLotesClasparNUM_EMBALAGEM: TFloatField;
    QrLotesClasparCOD_LOTE_TIPO: TIntegerField;
    QrLotesClasparNUM_CERTIFICADO: TFloatField;
    QrLotesClasparCOD_SERIE: TStringField;
    QrLotesClasparCOD_ESTADO_CLASPAR: TStringField;
    QrLotesClasparDT_EMISSAO_CLASPAR: TDateTimeField;
    QrLotesClasparDT_VALIDADE: TDateTimeField;
    QrLotesClasparCOD_REG_MAARA: TStringField;
    QrLotesClasparPERC_UMIDADE: TFloatField;
    QrLotesClasparDESC_SAFRA: TStringField;
    QrLotesClasparQT_CLASSIFICADO: TFloatField;
    QrLotesClasparDESC_RENDA: TStringField;
    QrLotesClasparPERC_INTEIRO: TFloatField;
    QrLotesClasparPERC_QUEBRADOS: TFloatField;
    QrLotesClasparDESC_MARCA: TStringField;
    QrLotesClasparDESC_GRUPO: TStringField;
    QrLotesClasparDESC_CLASSE: TStringField;
    QrLotesClasparDESC_TIPO: TStringField;
    QrLotesClasparDESC_REGIONAL: TStringField;
    QrLotesClasparDESC_POSTO: TStringField;
    QrLotesClasparDESC_FILIAL: TStringField;
    QrLotesClasparCOD_ESTADO_FILIAL: TStringField;
    QrLotesClasparDESC_OBSERVACAO: TStringField;
    QRVendedorPgto: TOracleDataSet1;
    QRVendedorPgtoNOME_VENDEDOR: TStringField;
    QRVendedorPgtoCOD_FILIAL: TFloatField;
    QRVendedorPgtoDESC_FILIAL: TStringField;
    QRVendedorPgtoSVAL_PRAZO: TFloatField;
    QRVendedorPgtoSVAL_CUSTO_PRAZO: TFloatField;
    QRVendedorPgtoSVAL_VISTA: TFloatField;
    QRVendedorPgtoSVAL_CUSTO_VISTA: TFloatField;
    QRVendaOperacao: TOracleDataSet1;
    QRClienteSemCompra: TOracleDataSet1;
    QRClienteSemCompraCOD_CADASTRO: TIntegerField;
    QRClienteSemCompraNOME: TStringField;
    QRClienteSemCompraDESC_ENDERECO: TStringField;
    QRClienteSemCompraCOD_ESTADO: TStringField;
    QRClienteSemCompraDESC_TELEFONE: TStringField;
    QRTipoDocumento: TOracleDataSet1;
    QRTipoDocumentoCOD_FILIAL: TFloatField;
    QRTipoDocumentoDESC_FILIAL: TStringField;
    QRTipoDocumentoCOD_SERIE: TStringField;
    QRTipoDocumentoCOD_PRODUTO: TFloatField;
    QRTipoDocumentoSQT_SAIDA: TFloatField;
    QRTipoDocumentoSVAL_TOTAL_SAIDA: TFloatField;
    QRTipoDocumentoSQT_ENTRADA: TFloatField;
    QRTipoDocumentoSVAL_TOTAL_ENTRADA: TFloatField;
    QRBloqueto: TOracleDataSet1;
    QRBloquetoDESC_LOCAL_PGTO_BLOQ: TStringField;
    QRBloquetoDESC_INSTRUCAO_BLOQUETO: TStringField;
    QRBloquetoIND_TIPO_JURO: TStringField;
    QRBloquetoPERC_JURO_BLOQUETO: TFloatField;
    QRBloquetoDT_VENCIMENTO: TDateTimeField;
    QRBloquetoVAL_TITULO: TFloatField;
    QRBloquetoDT_EMISSAO: TDateTimeField;
    QRBloquetoNUM_TITULO: TIntegerField;
    QRBloquetoNUM_PARCELA: TIntegerField;
    QRBloquetoDESC_TIPO_DOCUMENTO: TStringField;
    QRBloquetoNOME_SACADO: TStringField;
    QRBloquetoDESC_ENDERECO: TStringField;
    QRBloquetoDESC_CIDADE: TStringField;
    QRBloquetoCOD_ESTADO: TStringField;
    QRBloquetoinstrucao_juro: TStringField;
    QRFutura_Cliente: TOracleDataSet1;
    QRFutura_ClienteQT_ATENDIDO: TFloatField;
    QRFutura_ClienteQT_CANCELADO: TFloatField;
    QRFutura_ClienteQT_DEVOLVIDO: TFloatField;
    QRFutura_ClienteQT_NOTA_ITEM: TFloatField;
    QRFutura_ClienteIND_TIPO: TStringField;
    QRFutura_ClienteCOD_PRODUTO: TFloatField;
    QRFutura_ClienteNUM_NOTA: TIntegerField;
    QRFutura_ClienteCOD_SERIE: TStringField;
    QRFutura_ClienteDESC_LOTE: TStringField;
    QRFutura_ClienteDT_EMISSAO: TDateTimeField;
    QRFutura_ClienteCOD_LOTE_TIPO: TIntegerField;
    QRFutura_ClienteVAL_UNITARIO: TFloatField;
    QRMovEstoque: TOracleDataSet1;
    QRFutura: TOracleDataSet1;
    QRFuturaQT_ATENDIDO: TFloatField;
    QRFuturaQT_CANCELADO: TFloatField;
    QRFuturaQT_DEVOLVIDO: TFloatField;
    QRFuturaQT_NOTA_ITEM: TFloatField;
    QRFuturaIND_TIPO: TStringField;
    QRFuturaNUM_NOTA: TIntegerField;
    QRFuturaCOD_SERIE: TStringField;
    QRFunRural: TOracleDataSet1;
    QRFunRuralCOD_NOTA_CAB: TIntegerField;
    QRFunRuralCOD_USUARIO: TIntegerField;
    QRFunRuralCOD_FILIAL: TIntegerField;
    QRFunRuralCOD_MENSAGEM: TIntegerField;
    QRFunRuralCOD_TRANSPORTE: TIntegerField;
    QRFunRuralCOD_OPERACAO: TIntegerField;
    QRFunRuralCOD_ESTADO: TStringField;
    QRFunRuralCOD_VENDEDOR: TIntegerField;
    QRFunRuralCOD_CADASTRO: TIntegerField;
    QRFunRuralNUM_NOTA: TIntegerField;
    QRFunRuralCOD_SERIE: TStringField;
    QRFunRuralIND_SITUACAO: TStringField;
    QRFunRuralIND_CONDICAO_PAGTO: TStringField;
    QRFunRuralDT_EMISSAO: TDateTimeField;
    QRFunRuralDT_MOVIMENTO: TDateTimeField;
    QRFunRuralDT_RECEBIMENTO: TDateTimeField;
    QRFunRuralCOD_MOTIVO_CANC: TIntegerField;
    QRFunRuralVAL_DESPESAS: TFloatField;
    QRFunRuralIND_ENTRADA_SAIDA: TStringField;
    QRFunRuralVAL_FRETE: TFloatField;
    QRFunRuralVAL_DESCONTO: TFloatField;
    QRFunRuralCOD_TRANSPORTADOR: TIntegerField;
    QRFunRuralNUM_CONHECIMENTO_FRETE: TIntegerField;
    QRFunRuralVAL_AVISTA: TFloatField;
    QRFunRuralIND_TIPO_FRETE: TStringField;
    QRFunRuralNUM_VOLUMES: TIntegerField;
    QRFunRuralOBS: TStringField;
    QRFunRuralOBS_COMPLEMENTO: TStringField;
    QRFunRuralDT_USUARIO: TDateTimeField;
    QRFunRuralCOD_TRIBUTACAO_FRETE: TIntegerField;
    QRFunRuralVAL_TOTAL_IPI: TFloatField;
    QRFunRuralVAL_ICM_FRETE: TFloatField;
    QRFunRuralVAL_ICM_BASE_FRETE: TFloatField;
    QRFunRuralVAL_FUNRURAL: TFloatField;
    QRFunRuralDESC_PLACA: TStringField;
    QRFunRuralDESC_TRANSPORTADORA: TStringField;
    QRFunRuralCOD_NOTA_CONTA_CORRENTE: TIntegerField;
    QRFunRuralDT_EMISSAO_CF: TDateTimeField;
    QRFunRuralCOD_OPERACAO_CF: TIntegerField;
    QRFunRuralNR_DIAS_CHEQUE: TIntegerField;
    QRFunRuralCOD_CONTRATO_MOV: TIntegerField;
    QRFunRuralCOD_CONTRATO_GP_MOV: TIntegerField;
    QRFunRuralNR_DIAS_CHEQUE1: TIntegerField;
    QRFunRuralNR_DIAS_CHEQUE2: TIntegerField;
    QRFunRuralIND_NOTA_SEGURO: TStringField;
    QRFunRuralCOD_CONTRATO_VEND: TIntegerField;
    QRFunRuralNR_ROTA: TIntegerField;
    QRFunRuralNOME: TStringField;
    QRFunRuralDESC_FILIAL: TStringField;
    QRCustoCompra: TOracleDataSet1;
    QRCustoCompraCOD_CADASTRO: TIntegerField;
    QRCustoCompraNOME: TStringField;
    QRCustoCompraNUM_NOTA: TIntegerField;
    QRCustoCompraCOD_SERIE: TStringField;
    QRCustoCompraDT_RECEBIMENTO: TDateTimeField;
    QRCustoCompraCOD_PRODUTO: TFloatField;
    QRCustoCompraQT_QUANTIDADE: TFloatField;
    QRCustoCompraVAL_CUSTO: TFloatField;
    QRCustoCompraVAL_VAREJO: TFloatField;
    QRCustoCompraPerc_Diferenca: TFloatField;
    QRelacao: TOracleDataSet1;
    QConferencia: TOracleDataSet1;
    QConferenciaDESC_FILIAL: TStringField;
    QConferenciaCOD_CADASTRO: TIntegerField;
    QConferenciaNOME_FORNECEDOR: TStringField;
    QConferenciaCOD_OPERACAO: TIntegerField;
    QConferenciaDESC_OPERACAO: TStringField;
    QConferenciaCOD_NOTA_CAB: TIntegerField;
    QConferenciaNUM_NOTA: TIntegerField;
    QConferenciaCOD_SERIE: TStringField;
    QConferenciaCOD_FILIAL: TIntegerField;
    QConferenciaCOD_TRANSPORTADOR: TIntegerField;
    QConferenciaDT_EMISSAO: TDateTimeField;
    QConferenciaIND_TIPO_FRETE: TStringField;
    QConferenciaNUM_CONHECIMENTO_FRETE: TIntegerField;
    QConferenciaVAL_DESCONTO: TFloatField;
    QConferenciaVAL_DESPESAS: TFloatField;
    QConferenciaDT_RECEBIMENTO: TDateTimeField;
    QConferenciaVAL_FRETE: TFloatField;
    QConferenciaDESC_TRANSPORTADORA: TStringField;
    QConferenciaSVAL_TOTAL: TFloatField;
    QConfItem: TOracleDataSet1;
    QConfItemCOD_NOTA_ITEM: TIntegerField;
    QConfItemCOD_NOTA_CAB: TIntegerField;
    QConfItemCOD_TRIBUTACAO: TIntegerField;
    QConfItemQT_QUANTIDADE: TFloatField;
    QConfItemVAL_TOTAL: TFloatField;
    QConfItemPERC_IPI: TFloatField;
    QConfItemPERC_COMISSAO: TFloatField;
    QConfItemCOD_PRODUTO: TFloatField;
    QConfItemCOD_LOTE_TIPO: TIntegerField;
    QConfItemVAL_DESCONTO: TFloatField;
    QConfItemVAL_DESPESAS: TFloatField;
    QConfItemVAL_FRETE: TFloatField;
    QConfItemPERC_DESCONTO: TFloatField;
    QConfItemVAL_IPI: TFloatField;
    QConfItemVAL_UNITARIO: TFloatField;
    QConfItemVAL_ICM_BASE: TFloatField;
    QConfItemVAL_ICM: TFloatField;
    QConfItemIND_CLASS_IPI: TStringField;
    QConfItemVAL_CUSTO: TFloatField;
    QConfItemVAL_ISS: TFloatField;
    QConfItemPERC_INSS: TFloatField;
    QConfItemPERC_BENEFICIADO: TFloatField;
    QConfItemIND_BX_CONTR_VEND: TStringField;
    QConfItemNUM_NOTA_PRODUTOR: TIntegerField;
    QConfItemDESC_LOTE: TStringField;
    QConfContaPagar: TOracleDataSet1;
    QConfContaPagarDT_VENCIMENTO: TDateTimeField;
    QConfContaPagarDESC_FINALIDADE: TStringField;
    QConfContaPagarCOD_NOTA_CAB: TIntegerField;
    QConfContaPagarCOD_FINALIDADE: TIntegerField;
    QConfContaPagarNUM_TITULO: TIntegerField;
    QConfContaPagarVAL_TITULO: TFloatField;
    QConfContaPagarNUM_PARCELA: TIntegerField;
    QConferencianome_transportador: TStringField;
    QRVendaOperacaonome_vendedor: TStringField;
    QRMovMercadoriaQT_QUANTIDADE: TFloatField;
    QRMovMercadoriaVAL_TOTAL: TFloatField;
    QRMovMercadoriaPERC_IPI: TFloatField;
    QRMovMercadoriaCOD_PRODUTO: TFloatField;
    QRMovMercadoriaVAL_UNITARIO: TFloatField;
    QRMovMercadoriaVAL_IPI: TFloatField;
    QRMovMercadoriaQT_KILOS: TFloatField;
    QRFuturaCOD_LOTE_TIPO: TIntegerField;
    QRSecretariaDESC_UNIDADE: TStringField;
    QRSecretariaIND_CLASSE_TOX: TStringField;
    QRSecretariaDESC_CLASSE: TStringField;
    QRSecretariaQT_QUANTIDADE_PRI: TFloatField;
    QRSecretariaQT_QUANTIDADE_SEG: TFloatField;
    QRSecretariaQT_QUANTIDADE_TER: TFloatField;
    QRSecretariaQT_QUANTIDADE_QUA: TFloatField;
    QRSecretariaCOD_PRODUTO: TFloatField;
    QRClienteComCompra: TOracleDataSet1;
    QRClienteComCompraCOD_CADASTRO: TIntegerField;
    QRClienteComCompraNOME: TStringField;
    QRClienteComCompraDESC_ENDERECO: TStringField;
    QRClienteComCompraDESC_CIDADE: TStringField;
    QRClienteComCompraCOD_ESTADO: TStringField;
    QRClienteComCompraDESC_TELEFONE: TStringField;
    QRVendaOperacaoCOD_FILIAL: TIntegerField;
    QRVendaOperacaoDESC_FILIAL: TStringField;
    QRVendaOperacaoCOD_VENDEDOR: TIntegerField;
    QRVendaOperacaoCOD_OPERACAO: TIntegerField;
    QRVendaOperacaoDESC_OPERACAO: TStringField;
    QRVendaOperacaoSVAL_TOTAL: TFloatField;
    QRVendaOperacaoSQT_QUANTIDADE: TFloatField;
    QREtiq_ItemsNF: TOracleDataSet1;
    QREtiq_ItemsNFCOD_CADASTRO: TIntegerField;
    QREtiq_ItemsNFCOD_PRODUTO: TFloatField;
    QREtiq_ItemsNFNUM_NOTA: TIntegerField;
    QREtiq_ItemsNFnome: TStringField;
    QREtiq_ItemsNFQT_QUANTIDADE: TFloatField;
    QRFutura_ClienteIND_TIPO_PRODUTO: TStringField;
    QRFutura_ClienteNUM_EMBALAGEM: TFloatField;
    QRFuturaIND_TIPO_PRODUTO: TStringField;
    QRFuturaNUM_EMBALAGEM: TFloatField;
    QRNotaContaCorrente: TOracleDataSet1;
    QRNotaContaCorrenteNUM_NOTA: TIntegerField;
    QRNotaContaCorrenteDT_EMISSAO: TDateTimeField;
    QRNotaContaCorrenteNOME: TStringField;
    QRNotaContaCorrenteTOTAL_NOTA: TFloatField;
    QRMaioresClientesDESC_CIDADE: TStringField;
    QRMaioresClientesVendDESC_CIDADE: TStringField;
    QRMovMercadoriaDESC_ENDERECO: TStringField;
    QRMovEstoqueNUM_NOTA: TIntegerField;
    QRMovEstoqueCOD_SERIE: TStringField;
    QRMovEstoqueDT_RECEBIMENTO: TDateTimeField;
    QRMovEstoqueCOD_OPERACAO: TIntegerField;
    QRMovEstoqueDESC_LOTE: TStringField;
    QRMovEstoqueQT_QUANTIDADE: TFloatField;
    QRMovEstoqueVAL_TOTAL: TFloatField;
    QRMovEstoqueCOD_PRODUTO: TFloatField;
    QRMovEstoqueIND_ESTOQUE: TStringField;
    QRMovEstoqueNOME: TStringField;
    QRComissaoClienteCOD_VENDEDOR: TIntegerField;
    QRComissaoClienteCOD_CADASTRO: TIntegerField;
    QRComissaoClienteCOD_NOTA_CAB: TIntegerField;
    QRComissaoClienteNUM_NOTA: TIntegerField;
    QRComissaoCOD_VENDEDOR: TIntegerField;
    QRComissaoCOD_FILIAL: TIntegerField;
    QRComissaoCOD_PRODUTO: TFloatField;
    QRFuturaVAL_UNITARIO: TFloatField;
    QRFuturasval_total: TFloatField;
    QRComissaoPERC_COMISSAO_ITEM: TFloatField;
    QRComissaoPERC_COMISSAO_NOTA: TFloatField;
    QRComissaoval_comissao: TFloatField;
    QRComissaoClientePERC_COMISSAO_NOTA: TFloatField;
    QRComissaoClientePERC_COMISSAO_ITEM: TFloatField;
    QRReciboComissaoSVAL_TOTAL: TFloatField;
    QRComissaoClienteval_comissao: TFloatField;
    QRReciboComissaoCOD_VENDEDOR: TIntegerField;
    QRReciboComissaoCOD_FILIAL: TIntegerField;
    QRReciboComissaoPERC_IRRF: TFloatField;
    QRReciboComissaoval_irrf: TFloatField;
    QRReciboComissaoval_liquido: TFloatField;
    QRReciboComissaoSVAL_COMISSAO: TFloatField;
    QRVendClasseQT_QUANTIDADE: TFloatField;
    QRVendClasseQT_QUANT_KG: TFloatField;
    QRReciboComissaoNUM_CGC: TStringField;
    QRInadimplenciaCOD_VENDEDOR: TFloatField;
    QRVendasVndRegiaoCOD_VENDEDOR: TIntegerField;
    QRVendasVndRegiaoCOD_PRODUTO: TFloatField;
    QRVendasVndRegiaoCOD_REGIAO: TIntegerField;
    QRComissaoPERC_IRRF: TFloatField;
    QRComissaosval_irrf: TFloatField;
    QRVendaClasseNUM_CLASSE: TIntegerField;
    QRVendaClasseNUM_SUBCLASSE: TIntegerField;
    QRVendaClasseCOD_PRODUTO: TFloatField;
    QRVendaClasseDESC_CLASSE: TStringField;
    QRVendaClasseSVAL_TABELA: TFloatField;
    QRVendaClasseSQT_QUANTIDADE: TFloatField;
    QRVendaClasseSVAL_TOTAL: TFloatField;
    QrResumoClienteFONECADASTRO: TStringField;
    QRContaCorrenteVAL_AVISTA: TFloatField;
    QRReciboComissaoCOD_SERIE: TStringField;
    QRSeguroCarga1: TOracleDataSet1;
    QRVendaVendedorCliente: TOracleDataSet1;
    QRVendaVendedorClienteCOD_PRODUTO: TFloatField;
    QRVendaVendedorClienteCOD_CADASTRO: TFloatField;
    QRVendaVendedorClienteNOME_CLIENTE: TStringField;
    QRVendaVendedorClienteCOD_VENDEDOR: TFloatField;
    QRVendaVendedorClienteNOME_VENDEDOR: TStringField;
    QRVendaVendedorClienteSQT_QUANTIDADE: TFloatField;
    QRVendaVendedorClienteSVAL_TOTAL: TFloatField;
    QRVendClasseSQT_BONIFICACAO: TFloatField;
    QRContaCorrenteNOME_VENDEDOR: TStringField;
    QRMovEstoqueQT_CHEGADA: TFloatField;
    QRVendaVendedorClienteTELEFONE: TStringField;
    QRVendaVendedorClienteCLASSIFICACAO: TStringField;
    QRVendaVendedorClientedt_ultima_compra: TDateField;
    QRMaioresClientesNUM_CGC_CPF: TStringField;
    QRMaioresClientesVendNUM_CGC_CPF: TStringField;
    QRClienteSemCompraNUM_CGC_CPF: TStringField;
    QRClienteSemCompraval_venda: TFloatField;
    QRComissaoClientePERC_IRRF: TFloatField;
    QRVendaClassesval_custo: TFloatField;
    QRVendaClasseSVAL_CUSTO1: TFloatField;
    QRVendaVendedorClasse: TOracleDataSet1;
    QRelacaoCOD_NOTA_CAB: TIntegerField;
    QRelacaoNUM_NOTA: TIntegerField;
    QRelacaoCOD_FILIAL: TIntegerField;
    QRelacaoCOD_SERIE: TStringField;
    QRelacaoDT_RECEBIMENTO: TDateTimeField;
    QRelacaoCOD_ESTADO: TStringField;
    QRelacaoIND_SITUACAO: TStringField;
    QRelacaoDT_EMISSAO: TDateTimeField;
    QRelacaoCOD_OPERACAO: TIntegerField;
    QRelacaoCOD_CADASTRO: TIntegerField;
    QRelacaoNOME: TStringField;
    QRelacaoSVAL_TOTAL: TFloatField;
    QRelacaoSVAL_CUSTO: TFloatField;
    QRClienteSemCompraCOD_CIDADE: TIntegerField;
    QRClienteSemCompraDESC_CIDADE: TStringField;
    QRAcompanhaMeta: TOracleDataSet1;
    QRAcompanhaMetaDT_EMISSAO: TDateTimeField;
    QRAcompanhaMetaQUANTIDADE: TFloatField;
    QRAcompanhaMetaKG: TFloatField;
    QRAcompanhaMetasaldo: TFloatField;
    QRAcompanhaMetameta: TFloatField;
    QRAcompanhaMetaVAL_TOTAL: TFloatField;
    QRVendProdPeriodoCOD_CLASSE: TIntegerField;
    QRVendProdPeriodoCOD_PRODUTO: TFloatField;
    QRVendProdPeriodoDESC_CLASSE: TStringField;
    QRVendProdPeriodoQT_QUANTIDADE: TFloatField;
    QRVendProdPeriodoVAL_TOTAL: TFloatField;
    QRVendProdPeriodoVAL_CUSTO_TOTAL: TFloatField;
    QRPrazoVendaSVAL_PRAZO5: TFloatField;
    QRPrazoVendaSVAL_PRAZO6: TFloatField;
    QRMovMercadoriaCOD_USUARIO: TIntegerField;
    QRMovEntradaSaidacusto: TFloatField;
    QRMovEntradaSaidaCOD_LOTE_TIPO: TIntegerField;
    QRMovMercadoriaCOD_ESTADO: TStringField;
    QRelacaoNotasRio: TOracleDataSet1;
    QRelacaoNotasRioNUM_NOTA: TIntegerField;
    QRelacaoNotasRioDT_EMISSAO: TDateTimeField;
    QRelacaoNotasRioNOME: TStringField;
    QRelacaoNotasRioVAL_PRODUTOS: TFloatField;
    QRelacaoNotasRioVAL_SUBSTITUICAO: TFloatField;
    QRelacaoNotasRioVAL_TOTAL: TFloatField;
    QRVendedorCMedioNUM_CLASSE: TFloatField;
    QRelacaoNotasRioNUM_NATUREZA_EST_NOVO: TIntegerField;
    QRelacaoNotasRioNUM_NATUREZA_INT_NOVO: TIntegerField;
    QRelacaoNotasRioCOD_OPERACAO: TIntegerField;
    QRTipoDocumentoDESC_PRODUTO: TStringField;
    QREtiq_ItemsNFDESC_PRODUTO: TStringField;
    QRVendaClasseDESC_PRODUTO: TStringField;
    QrResumoClienteDESC_PRODUTO: TStringField;
    QRVendaVendClasseDESC_PRODUTO: TStringField;
    QRVendedorCMedioDESC_PRODUTO: TStringField;
    QRVendedorCMedio2DESC_PRODUTO: TStringField;
    QRVendaVendedorClienteDESC_PRODUTO: TStringField;
    QRMovMercadoriaDESC_PRODUTO: TStringField;
    QRVendasVndRegiaoDESC_PRODUTO: TStringField;
    QRVendProdPeriodoDESC_PRODUTO: TStringField;
    QRClasparDESC_PRODUTO: TStringField;
    QRMovEntradaSaidaDESC_PRODUTO: TStringField;
    QrLotesClasparDESC_PRODUTO: TStringField;
    QRVendedorDESC_PRODUTO: TStringField;
    QRMapaVendaCOD_PRODUTO: TFloatField;
    QRMapaVendaResDESC_PRODUTO: TStringField;
    QRSecretariaDESC_PRODUTO: TStringField;
    QRMovEstoqueDESC_PRODUTO: TStringField;
    QRFutura_ClienteDESC_PRODUTO: TStringField;
    QRFuturaDESC_PRODUTO: TStringField;
    QRCustoCompraDESC_PRODUTO: TStringField;
    QConfItemDESC_PRODUTO: TStringField;
    QRComissaoDESC_PRODUTO: TStringField;
    QRAcompanhaVenda: TOracleDataSet1;
    QRAcompanhaVendaIND_TIPO: TStringField;
    QRAcompanhaVendaVAL_JANEIRO: TFloatField;
    QRAcompanhaVendaVAL_FEVEREIRO: TFloatField;
    QRAcompanhaVendaVAL_MARCO: TFloatField;
    QRAcompanhaVendaVAL_ABRIL: TFloatField;
    QRAcompanhaVendaVAL_MAIO: TFloatField;
    QRAcompanhaVendaVAL_JUNHO: TFloatField;
    QRAcompanhaVendaVAL_JULHO: TFloatField;
    QRAcompanhaVendaVAL_AGOSTO: TFloatField;
    QRAcompanhaVendaVAL_SETEMBRO: TFloatField;
    QRAcompanhaVendaVAL_OUTUBRO: TFloatField;
    QRAcompanhaVendaVAL_NOVEMBRO: TFloatField;
    QRAcompanhaVendaVAL_DEZEMBRO: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_JAN: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_FEV: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_MAR: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_ABR: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_MAI: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_JUN: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_JUL: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_AGO: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_SET: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_OUT: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_NOV: TFloatField;
    QRAcompanhaVendaQT_CAIXAS_DEZ: TFloatField;
    QRAcompanhaVendaQT_KG_JAN: TFloatField;
    QRAcompanhaVendaQT_KG_FEV: TFloatField;
    QRAcompanhaVendaQT_KG_MAR: TFloatField;
    QRAcompanhaVendaQT_KG_ABR: TFloatField;
    QRAcompanhaVendaQT_KG_MAI: TFloatField;
    QRAcompanhaVendaQT_KG_JUN: TFloatField;
    QRAcompanhaVendaQT_KG_JUL: TFloatField;
    QRAcompanhaVendaQT_KG_AGO: TFloatField;
    QRAcompanhaVendaQT_KG_SET: TFloatField;
    QRAcompanhaVendaQT_KG_OUT: TFloatField;
    QRAcompanhaVendaQT_KG_NOV: TFloatField;
    QRAcompanhaVendaQT_KG_DEZ: TFloatField;
    QRAcompanhaVendaSVAL_TOTAL: TFloatField;
    QRAcompanhaVendaSQT_QUANTIDADE: TFloatField;
    QRAcompanhaVendaSQT_KILOS: TFloatField;
    QRAcompanhaVendaQUOTA_JAN: TFloatField;
    QRAcompanhaVendaQUOTA_FEV: TFloatField;
    QRAcompanhaVendaQUOTA_MAR: TFloatField;
    QRAcompanhaVendaQUOTA_ABR: TFloatField;
    QRAcompanhaVendaQUOTA_MAI: TFloatField;
    QRAcompanhaVendaQUOTA_JUN: TFloatField;
    QRAcompanhaVendaQUOTA_JUL: TFloatField;
    QRAcompanhaVendaQUOTA_AGO: TFloatField;
    QRAcompanhaVendaQUOTA_SET: TFloatField;
    QRAcompanhaVendaQUOTA_OUT: TFloatField;
    QRAcompanhaVendaQUOTA_NOV: TFloatField;
    QRAcompanhaVendaQUOTA_DEZ: TFloatField;
    QRVendaVendedorClasseNOME: TStringField;
    QRVendaVendedorClasseDESC_CLASSE: TStringField;
    QRVendaVendedorClasseQT_QUANTIDADE: TFloatField;
    QRVendaVendedorClasseVAL_TOTAL: TFloatField;
    QRVendaVendedorClasseVAL_ICMS: TFloatField;
    QRVendaVendedorClasseVAL_COMISSAO: TFloatField;
    QRVendaVendedorClasseVAL_FRETE: TFloatField;
    QRVendaVendedorClasseVAL_CUSTO: TFloatField;
    QRVendaVendedorClasseTRIB_FED: TFloatField;
    QRVendaVendedorClasseVAL_BONIFICACAO: TFloatField;
    QRAcompanhaVendaQUOTA_KG_JAN: TFloatField;
    QRAcompanhaVendaQUOTA_KG_FEV: TFloatField;
    QRAcompanhaVendaQUOTA_KG_MAR: TFloatField;
    QRAcompanhaVendaQUOTA_KG_ABR: TFloatField;
    QRAcompanhaVendaQUOTA_KG_MAI: TFloatField;
    QRAcompanhaVendaQUOTA_KG_JUN: TFloatField;
    QRAcompanhaVendaQUOTA_KG_JUL: TFloatField;
    QRAcompanhaVendaQUOTA_KG_AGO: TFloatField;
    QRAcompanhaVendaQUOTA_KG_SET: TFloatField;
    QRAcompanhaVendaQUOTA_KG_OUT: TFloatField;
    QRAcompanhaVendaQUOTA_KG_NOV: TFloatField;
    QRAcompanhaVendaQUOTA_KG_DEZ: TFloatField;
    QRVendasRamoCliente: TOracleDataSet1;
    QRVendasRamoClienteCOD_CADASTRO: TIntegerField;
    QRVendasRamoClienteNOME: TStringField;
    QRVendasRamoClienteNOME_CONTATO: TStringField;
    QRVendasRamoClienteDESC_TELEFONE: TStringField;
    QRVendasRamoClienteVAL_JANEIRO: TFloatField;
    QRVendasRamoClienteVAL_FEVEREIRO: TFloatField;
    QRVendasRamoClienteVAL_MARCO: TFloatField;
    QRVendasRamoClienteVAL_ABRIL: TFloatField;
    QRVendasRamoClienteVAL_MAIO: TFloatField;
    QRVendasRamoClienteVAL_JUNHO: TFloatField;
    QRVendasRamoClienteVAL_JULHO: TFloatField;
    QRVendasRamoClienteVAL_AGOSTO: TFloatField;
    QRVendasRamoClienteVAL_SETEMBRO: TFloatField;
    QRVendasRamoClienteVAL_OUTUBRO: TFloatField;
    QRVendasRamoClienteVAL_NOVEMBRO: TFloatField;
    QRVendasRamoClienteVAL_DEZEMBRO: TFloatField;
    QRMapaVendaDESC_PRODUTO: TStringField;
    QRVendVendedorResumo: TOracleDataSet1;
    QRVendVendedorResumoCOD_VENDEDOR: TFloatField;
    QRVendVendedorResumoNOME: TStringField;
    QRVendVendedorResumoQT_QUANTIDADE: TFloatField;
    QRVendVendedorResumoVAL_TOTAL: TFloatField;
    QRVendVendedorResumoVAL_ICMS: TFloatField;
    QRVendVendedorResumoVAL_COMISSAO: TFloatField;
    QRVendVendedorResumoVAL_FRETE: TFloatField;
    QRVendVendedorResumoVAL_CUSTO: TFloatField;
    QRVendVendedorResumoTRIB_FED: TFloatField;
    QRVendVendedorResumoVAL_BONIFICACAO: TFloatField;
    QRelacaoNUM_VOLUMES: TFloatField;
    QRNotasCultura: TOracleDataSet1;
    QrMovMercadoria_CR: TOracleDataSet1;
    QrMovMercadoria_CRDT_EMISSAO: TDateTimeField;
    QrMovMercadoria_CRDT_VENCIMENTO: TDateTimeField;
    QrMovMercadoria_CRVAL_ORIGINAL: TFloatField;
    QrMovMercadoria_CRNUM_PARCELA: TIntegerField;
    QRVendaOperacaoSVAL_CUSTO: TFloatField;
    QRelacaoPERC_LUCRATIVIDADE: TFloatField;
    QRFutura_ClienteVAL_DESCONTO: TFloatField;
    QrVendaComDesconto: TOracleDataSet1;
    QrVendaComDescontoNOME: TStringField;
    QrVendaComDescontoNUM_NOTA: TIntegerField;
    QrVendaComDescontoCOD_PRODUTO: TFloatField;
    QrVendaComDescontoVAL_VAREJO: TFloatField;
    QrVendaComDescontoVAL_DESCONTO: TFloatField;
    QrVendaComDescontoPERC_DESCONTO: TFloatField;
    QrVendaComDescontoVAL_CUSTO: TFloatField;
    QrVendaComDescontoDT_EMISSAO: TDateTimeField;
    QrVendaComDescontoDESC_PRODUTO: TStringField;
    QrVendaComDescontoVAL_UNITARIO: TFloatField;
    QRVendVendedorResumopreco_medio: TFloatField;
    QRNotasCulturaDIA: TStringField;
    QRNotasCulturaCOD_CADASTRO: TIntegerField;
    QRNotasCulturaNOME: TStringField;
    QRNotasCulturaCOD_CULTURA: TIntegerField;
    QRNotasCulturaDESC_CULTURA: TStringField;
    QRNotasCulturaCOD_FILIAL: TIntegerField;
    QRNotasCulturaDESC_FILIAL: TStringField;
    QRNotasCulturaCOD_PRODUTO: TFloatField;
    QRNotasCulturaDESC_PRODUTO: TStringField;
    QRNotasCulturaSQT_QUANTIDADE: TFloatField;
    QRNotasCulturaSVAL_TOTAL: TFloatField;
    QRNotasCulturaSVAL_CUSTO: TFloatField;
    QRMapaVendaVAL_CUSTO: TFloatField;
    QRMapaVendasval_custo: TFloatField;
    QRMapaVendaResVAL_CUSTO: TFloatField;
    QRMapaVendaRessval_custo: TFloatField;
    QRVendedorResumoVenda: TOracleDataSet1;
    QRVendedorCMedioMes: TOracleDataSet1;
    QRVendedorCMedioMesCOD_VENDEDOR: TFloatField;
    QRVendedorCMedioMesNOME_VENDEDOR: TStringField;
    QRVendedorCMedioMesCOD_PRODUTO: TFloatField;
    QRVendedorCMedioMesDESC_PRODUTO: TStringField;
    QRVendedorCMedioMesCOD_CLASSE: TFloatField;
    QRVendedorCMedioMesDESC_CLASSE: TStringField;
    QRVendedorCMedioMesNUM_CLASSE: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_JAN: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_FEV: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_MAR: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_ABR: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_MAI: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_JUN: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_JUL: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_AGO: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_SET: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_OUT: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_NOV: TFloatField;
    QRVendedorCMedioMesSVAL_TOTAL_DEZ: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_JAN: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_FEV: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_MAR: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_ABR: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_MAI: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_JUN: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_JUL: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_AGO: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_SET: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_OUT: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_NOV: TFloatField;
    QRVendedorCMedioMesSQT_QUANTIDADE_DEZ: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_JAN: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_FEV: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_MAR: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_ABR: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_MAI: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_JUN: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_JUL: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_AGO: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_SET: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_OUT: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_NOV: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_DEZ: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JAN: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_FEV: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAR: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_ABR: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAI: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUN: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUL: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_AGO: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_SET: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_OUT: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_NOV: TFloatField;
    QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_DEZ: TFloatField;
    QRVendedorCMedioMessPreco_Medio_jan: TFloatField;
    QRVendedorCMedioMessPreco_Medio_fev: TFloatField;
    QRVendedorCMedioMessPreco_Medio_mar: TFloatField;
    QRVendedorCMedioMessPreco_Medio_abr: TFloatField;
    QRVendedorCMedioMessPreco_Medio_mai: TFloatField;
    QRVendedorCMedioMessPreco_Medio_jun: TFloatField;
    QRVendedorCMedioMessPreco_Medio_jul: TFloatField;
    QRVendedorCMedioMessPreco_Medio_ago: TFloatField;
    QRVendedorCMedioMessPreco_Medio_set: TFloatField;
    QRVendedorCMedioMessPreco_Medio_out: TFloatField;
    QRVendedorCMedioMessPreco_Medio_nov: TFloatField;
    QRVendedorCMedioMessPreco_Medio_dez: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_jan: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_fev: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_mar: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_abr: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_mai: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_jun: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_jul: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_ago: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_set: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_out: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_nov: TFloatField;
    QRVendedorCMedioMessPreco_Medio_KG_dez: TFloatField;
    QRContaCorrente2VAL_TOTAL: TFloatField;
    QRContaCorrente2VAL_AVISTA: TFloatField;
    QRContaCorrente2sval_total: TFloatField;
    QRMovEstoqueDESC_PLACA: TStringField;
    QRAcompanhaMetaQT_KG_BONIFICACAO: TFloatField;
    QRVendasporVendedorVAL_TOTAL: TFloatField;
    QRVendedorResumoVendaCOD_VENDEDOR: TFloatField;
    QRVendedorResumoVendaNOME: TStringField;
    QRVendedorResumoVendaTOTAL: TFloatField;
    QRComissaoDT_EMISSAO: TDateTimeField;
    QRComissaoNUM_NOTA: TIntegerField;
    QRSeguroCarga1COD_ESTADO: TStringField;
    QRSeguroCarga1DESC_ESTADO: TStringField;
    QRSeguroCarga1PERC_FRETE: TFloatField;
    QRSeguroCarga1SVAL_TOTAL: TFloatField;
    QrSeguroCargaCOD_FILIAL: TFloatField;
    QrSeguroCargaCOD_ESTADO: TStringField;
    QrSeguroCargaCOD_CADASTRO: TFloatField;
    QrSeguroCargaNUM_NOTA: TFloatField;
    QrSeguroCargaCOD_SERIE: TStringField;
    QrSeguroCargaDT_EMISSAO: TDateTimeField;
    QrSeguroCargaIND_ENTRADA_SAIDA: TStringField;
    QrSeguroCargaCOD_CIDADE: TFloatField;
    QrSeguroCargaNOME: TStringField;
    QrSeguroCargaDESC_CIDADE: TStringField;
    QrSeguroCargaPERC_FRETE: TFloatField;
    QrSeguroCargaDESC_ESTADO: TStringField;
    QrSeguroCargaSVAL_TOTAL: TFloatField;
    QRMovEstoqueVAL_TOTAL_NOTA: TFloatField;
    QRMapaVenda2: TOracleDataSet1;
    QRMapaVenda2DIA: TStringField;
    QRMapaVenda2COD_FILIAL: TFloatField;
    QRMapaVenda2DESC_FILIAL: TStringField;
    QRMapaVenda2SQT_QUANTIDADE: TFloatField;
    QRMapaVenda2SVAL_TOTAL: TFloatField;
    QRMapaVenda2VAL_CUSTO: TFloatField;
    QRMapaVenda2sval_custo: TFloatField;
    QRMapaVendaRes2: TOracleDataSet1;
    QRMapaVendaRes2COD_FILIAL: TFloatField;
    QRMapaVendaRes2DESC_FILIAL: TStringField;
    QRMapaVendaRes2SQT_QUANTIDADE: TFloatField;
    QRMapaVendaRes2SVAL_TOTAL: TFloatField;
    QRMapaVendaRes2VAL_CUSTO: TFloatField;
    QRMapaVendaRes2sval_custo: TFloatField;
    QRMapaVendaRes2DESC_CLASSE: TStringField;
    QRMapaVenda2DESC_CLASSE: TStringField;
    QRFuturaVAL_FUNRURAL: TFloatField;
    QRFutura_ClienteVAL_FUNRURAL: TFloatField;
    QRProdutoCultura: TOracleDataSet1;
    QRProdutoCulturaCOD_CULTURA: TFloatField;
    QRProdutoCulturaDESC_CULTURA: TStringField;
    QRProdutoCulturaCOD_PRODUTO: TFloatField;
    QRProdutoCulturaDESC_PRODUTO: TStringField;
    QRProdutoCulturaDESC_CLASSE: TStringField;
    QRProdutoCulturaQUANTIDADE: TFloatField;
    QRProdutoCulturaVAL_TOTAL: TFloatField;
    QRProdutoCulturaCOD_CADASTRO: TFloatField;
    QRProdutoCulturaNOME: TStringField;
    QRQuotaVendCOD_VENDEDOR: TFloatField;
    QRQuotaVendNOME: TStringField;
    QRQuotaVendVAL_JANEIRO: TFloatField;
    QRQuotaVendVAL_FEVEREIRO: TFloatField;
    QRQuotaVendVAL_MARCO: TFloatField;
    QRQuotaVendVAL_ABRIL: TFloatField;
    QRQuotaVendVAL_MAIO: TFloatField;
    QRQuotaVendVAL_JUNHO: TFloatField;
    QRQuotaVendVAL_JULHO: TFloatField;
    QRQuotaVendVAL_AGOSTO: TFloatField;
    QRQuotaVendVAL_SETEMBRO: TFloatField;
    QRQuotaVendVAL_OUTUBRO: TFloatField;
    QRQuotaVendVAL_NOVEMBRO: TFloatField;
    QRQuotaVendVAL_DEZEMBRO: TFloatField;
    QRQuotaVendQT_JANEIRO: TFloatField;
    QRQuotaVendQT_FEVEREIRO: TFloatField;
    QRQuotaVendQT_MARCO: TFloatField;
    QRQuotaVendQT_ABRIL: TFloatField;
    QRQuotaVendQT_MAIO: TFloatField;
    QRQuotaVendQT_JUNHO: TFloatField;
    QRQuotaVendQT_JULHO: TFloatField;
    QRQuotaVendQT_AGOSTO: TFloatField;
    QRQuotaVendQT_SETEMBRO: TFloatField;
    QRQuotaVendQT_OUTUBRO: TFloatField;
    QRQuotaVendQT_NOVEMBRO: TFloatField;
    QRQuotaVendQT_DEZEMBRO: TFloatField;
    QRQuotaVendSVAL_TOTAL: TFloatField;
    QRQuotaVendSQT_QUANTIDADE: TFloatField;
    QRQuotaVendQUOTA_JAN: TFloatField;
    QRQuotaVendQUOTA_FEV: TFloatField;
    QRQuotaVendQUOTA_MAR: TFloatField;
    QRQuotaVendQUOTA_ABR: TFloatField;
    QRQuotaVendQUOTA_MAI: TFloatField;
    QRQuotaVendQUOTA_JUN: TFloatField;
    QRQuotaVendQUOTA_JUL: TFloatField;
    QRQuotaVendQUOTA_AGO: TFloatField;
    QRQuotaVendQUOTA_SET: TFloatField;
    QRQuotaVendQUOTA_OUT: TFloatField;
    QRQuotaVendQUOTA_NOV: TFloatField;
    QRQuotaVendQUOTA_DEZ: TFloatField;
    QRQuotaVendQUOTA_KG_JAN: TFloatField;
    QRQuotaVendQUOTA_KG_FEV: TFloatField;
    QRQuotaVendQUOTA_KG_MAR: TFloatField;
    QRQuotaVendQUOTA_KG_ABR: TFloatField;
    QRQuotaVendQUOTA_KG_MAI: TFloatField;
    QRQuotaVendQUOTA_KG_JUN: TFloatField;
    QRQuotaVendQUOTA_KG_JUL: TFloatField;
    QRQuotaVendQUOTA_KG_AGO: TFloatField;
    QRQuotaVendQUOTA_KG_SET: TFloatField;
    QRQuotaVendQUOTA_KG_OUT: TFloatField;
    QRQuotaVendQUOTA_KG_NOV: TFloatField;
    QRQuotaVendQUOTA_KG_DEZ: TFloatField;
    QRVendClasseVAL_CUSTO: TFloatField;
    QRVendClasseVAL_MARGEM: TFloatField;
    QRMovEstoqueVAL_CUSTO_SQL: TFloatField;
    QRMovEstoqueval_custo: TFloatField;
    QRInadimplenciaCOD_SUPERVISOR: TFloatField;
    QRInadimplencianome_supervisor: TStringField;
    QRVendaVendedorClasseCOD_VENDEDOR: TFloatField;
    QRVendaVendedorClasseCOD_CLASSE: TFloatField;
    QRMovMercadoria_Sintetico: TOracleDataSet1;
    QRMovMercadoria_SinteticoCOD_CADASTRO: TIntegerField;
    QRMovMercadoria_SinteticoNOME: TStringField;
    QRMovMercadoria_SinteticoDESC_PRODUTO: TStringField;
    QRMovMercadoria_SinteticoCOD_PRODUTO: TFloatField;
    QRMovMercadoria_SinteticoCOD_OPERACAO: TIntegerField;
    QRMovMercadoria_SinteticoDESC_OPERACAO: TStringField;
    QRMovMercadoria_SinteticoQT_QUANTIDADE: TFloatField;
    QRMovMercadoria_SinteticoVAL_TOTAL: TFloatField;
    QRMovMercadoria_SinteticoVAL_UNITARIO: TFloatField;
    QRVendaVendClasseCOD_VENDEDOR: TFloatField;
    QRVendaVendClasseSVAL_CUSTO: TFloatField;
    QRVendaOperacaoDESC_CLASSE: TStringField;
    QRVendaOperacaoCOD_CLASSE: TIntegerField;
    QRVendaOperacaoNUM_CLASSE: TIntegerField;
    QRVendaOperacaoNUM_SUBCLASSE: TIntegerField;
    QRMapaVendaCOD_FILIAL: TFloatField;
    QRMapaVendaDESC_FILIAL: TStringField;
    QRMapaVendaCOD_LOTE_TIPO: TFloatField;
    QRMapaVendaResCOD_LOTE_TIPO: TFloatField;
    QRVendedorResumoVendaQUANTIDADE: TFloatField;
    QRContaCorrenteVAL_TOTAL_ITENS: TFloatField;
    QrResumoClienteNUM_EMBALAGEM: TFloatField;
    QRExtratoAgricola: TOracleDataSet1;
    QRExtratoAgricolaCOD_NOTA_CAB: TIntegerField;
    QRExtratoAgricolaNUM_NOTA: TIntegerField;
    QRExtratoAgricolaDT_EMISSAO: TDateTimeField;
    QRExtratoAgricolaVAL_TOTAL_COM_ICMS: TFloatField;
    QRExtratoAgricolaVAL_TOTAL_SEM_ICMS: TFloatField;
    QRExtratoAgricolaQUANTIDADE: TFloatField;
    QRExtratoAgricolaEMBALAGENS: TFloatField;
    QRExtratoAgricolaVAL_UNITARIO_COM_ICMS: TFloatField;
    QRExtratoAgricolaVAL_UNITARIO_SEM_ICMS: TFloatField;
    QRExtratoAgricolaNOME: TStringField;
    QRelacaoQT_QUANTIDADE: TFloatField;
    QRQuotaVendCOD_CLASSE: TFloatField;
    QRQuotaVendDESC_CLASSE: TStringField;
    QRVendaClasseData: TOracleDataSet1;
    QRVendaClasseDataNUM_CLASSE: TIntegerField;
    QRVendaClasseDataNUM_SUBCLASSE: TIntegerField;
    QRVendaClasseDataDESC_CLASSE: TStringField;
    QRVendaClasseDataDT_EMISSAO: TDateTimeField;
    QRVendaClasseDataSQT_QUANTIDADE: TFloatField;
    QRVendaClasseDataSVAL_TOTAL: TFloatField;
    QRVendaClasseDataResumo: TOracleDataSet1;
    QRVendaClasseDataResumoDT_EMISSAO: TDateTimeField;
    QRVendaClasseDataResumoSQT_QUANTIDADE: TFloatField;
    QRVendaClasseDataResumoSVAL_TOTAL: TFloatField;
    QRHistoricoVendas: TOracleDataSet1;
    QRHistoricoVendasCOD_NOTA_CAB: TIntegerField;
    QRHistoricoVendasCOD_PRODUTO: TFloatField;
    QRHistoricoVendasNUM_CGC: TStringField;
    QRHistoricoVendasDT_EMISSAO: TDateTimeField;
    QRHistoricoVendasDESC_CIDADE: TStringField;
    QRHistoricoVendasQT_QUANTIDADE: TFloatField;
    QRHistoricoVendasPRECO_UNITARIO: TFloatField;
    QRHistoricoVendasMARGEM_UNITARIA: TFloatField;
    QRHistoricoVendasIND_VENDAS: TStringField;
    QRFutura_ClienteNOME_VENDEDOR: TStringField;
    QConfItemDESC_CLASSE: TStringField;
    QConfItemFABRICANTE: TStringField;
    QRFutura_Atendido: TOracleDataSet1;
    QRFutura_Atendidonome: TStringField;
    QRFutura_AtendidoQT_ATENDIDO: TFloatField;
    QRFutura_AtendidoQT_CANCELADO: TFloatField;
    QRFutura_AtendidoQT_DEVOLVIDO: TFloatField;
    QRFutura_AtendidoQT_NOTA_ITEM: TFloatField;
    QRFutura_AtendidoIND_TIPO: TStringField;
    QRFutura_AtendidoDESC_PRODUTO: TStringField;
    QRFutura_AtendidoIND_TIPO_PRODUTO: TStringField;
    QRFutura_AtendidoNUM_EMBALAGEM: TFloatField;
    QRFutura_AtendidoNUM_NOTA: TIntegerField;
    QRFutura_AtendidoCOD_SERIE: TStringField;
    QRFutura_AtendidoVAL_FUNRURAL: TFloatField;
    QRFutura_AtendidoCOD_CADASTRO: TFloatField;
    QRFutura_AtendidoCOD_LOTE_TIPO: TIntegerField;
    QRFutura_AtendidoVAL_UNITARIO: TFloatField;
    QRFutura_AtendidoQT_QUANTIDADE: TFloatField;
    QRFutura_AtendidoCOD_NOTA_AUX: TIntegerField;
    QRFutura_AtendidoCOD_PRODUTO: TFloatField;
    QRFutura_AtendidoVAL_DESCONTO: TFloatField;
    QRFutura_AtendidoDT_EMISSAO: TDateTimeField;
    QRFutura_AtendidoDT_BAIXA: TDateTimeField;
    QRFutura_AtendidoNF_BAIXA: TIntegerField;
    QRFutura_AtendidoNF_SERIE: TStringField;
    QRFuturanome: TStringField;
    QRFutura_Clientenome: TStringField;
    QRFuturaCOD_CADASTRO: TFloatField;
    QRFutura_ClienteCOD_CADASTRO: TFloatField;
    QRelacaoNUM_PEDIDO: TIntegerField;
    QRelacaonum_pecas: TIntegerField;
    QRelacaoSVal_Desconto: TFloatField;
    QConfItemVAL_ICMS_SUBST: TFloatField;
    QRClassePgtoCOD_FILIAL: TIntegerField;
    QRClassePgtoDESC_FILIAL: TStringField;
    QRClassePgtoDESC_CLASSE: TStringField;
    QRClassePgtoSVAL_VISTA: TFloatField;
    QRClassePgtoSVAL_PRAZO: TFloatField;
    QRClassePgtoSVAL_OUTROS: TFloatField;
    QRClassePgtoSVAL_TOTAL: TFloatField;
    QRClassePgtoVendCOD_FILIAL: TIntegerField;
    QRClassePgtoVendDESC_FILIAL: TStringField;
    QRClassePgtoVendDESC_CLASSE: TStringField;
    QRClassePgtoVendCOD_VENDEDOR: TIntegerField;
    QRClassePgtoVendNOME_VENDEDOR: TStringField;
    QRClassePgtoVendSVAL_VISTA: TFloatField;
    QRClassePgtoVendSVAL_PRAZO: TFloatField;
    QRClassePgtoVendSVAL_OUTROS: TFloatField;
    QRClassePgtoVendSVAL_TOTAL: TFloatField;
    QRelacaoItens: TOracleDataSet1;
    QRelacaoItensCOD_PRODUTO: TFloatField;
    QRelacaoItensQT_QUANTIDADE: TFloatField;
    QRelacaoItensVAL_UNITARIO: TFloatField;
    QRelacaoItensDESC_PRODUTO: TStringField;
    QRelacaoItensVAL_TOTAL: TFloatField;
    QRelacaoItensDESC_LOTE: TStringField;
    procedure QRBloquetoCalcFields(DataSet: TDataSet);
    procedure QRReciboComissaoCalcFields(DataSet: TDataSet);
    procedure QRVendedorCMedioCalcFields(DataSet: TDataSet);
    procedure QRVendedorCMedio2CalcFields(DataSet: TDataSet);
    procedure QRContaCorrenteCalcFields(DataSet: TDataSet);
    procedure QrVendaHistoricoCalcFields(DataSet: TDataSet);
    procedure QRVendProdPeriodoCalcFields(DataSet: TDataSet);
    procedure QRMilhagemCalcFields(DataSet: TDataSet);
    procedure QRCustoCompraCalcFields(DataSet: TDataSet);
    procedure QConferenciaCalcFields(DataSet: TDataSet);
    procedure QRVendaOperacaoCalcFields(DataSet: TDataSet);
    procedure QRMovMercadItemCalcFields(DataSet: TDataSet);
    procedure QREtiq_ItemsNFCalcFields(DataSet: TDataSet);
    procedure QRFutura_ClienteCalcFields(DataSet: TDataSet);
    procedure QRFuturaCalcFields(DataSet: TDataSet);
    procedure QRComissaoCalcFields(DataSet: TDataSet);
    procedure QRComissaoClienteCalcFields(DataSet: TDataSet);
    procedure QRVendaVendedorClienteCalcFields(DataSet: TDataSet);
    procedure QRClienteSemCompraCalcFields(DataSet: TDataSet);
    procedure QRVendaClasseCalcFields(DataSet: TDataSet);
    procedure QRAcompanhaMetaCalcFields(DataSet: TDataSet);
    procedure QRMovEntradaSaidaCalcFields(DataSet: TDataSet);
    procedure QRelacaoCalcFields(DataSet: TDataSet);
    procedure QRVendVendedorResumoCalcFields(DataSet: TDataSet);
    procedure QRMapaVendaCalcFields(DataSet: TDataSet);
    procedure QRMapaVendaResCalcFields(DataSet: TDataSet);
    procedure QRVendedorCMedioMesCalcFields(DataSet: TDataSet);
    procedure QRContaCorrente2CalcFields(DataSet: TDataSet);
    procedure QRMovEstoqueCalcFields(DataSet: TDataSet);
    procedure QRInadimplenciaCalcFields(DataSet: TDataSet);
    procedure QRVendaVendClasseCalcFields(DataSet: TDataSet);
                    
  private
    { Private declarations }
    fTipoPagto : Integer;
    FpMeta: Real;
    procedure SetpMeta(const Value: Real);  // utilizado para o relatorio de conta corrente para tratar valor a vista

  public
    { Public declarations }
    Property pTipoPagto : Integer Read fTipoPagto Write fTipoPagto;
    Property pMeta: Real read FpMeta write SetpMeta;
  end;

var
  DMRelatorio_Venda: TDMRelatorio_Venda;

implementation

uses UOracle_cl, UBiblioteca, UParamSistema_cl;

{$R *.DFM}
procedure TDMRelatorio_Venda.QRBloquetoCalcFields(DataSet: TDataSet);
Var wValorJuro : Real;
begin
  If QRBloquetoInd_Tipo_Juro.Value = 'PERCENTUAL' Then
    QRBloquetoInstrucao_Juro.Value := 'APÓS O VENCIMENTO COBRAR JUROS DE '
                                     +FormatFloat('#0.##%',QRBloquetoPerc_Juro_Bloqueto.Value)
                                     + ' AO MES'
  Else
  Begin
    wValorJuro := (QRBloquetoVal_Titulo.Value*QRBloquetoPerc_Juro_Bloqueto.Value/100)/30;
    QRBloquetoInstrucao_Juro.Value := 'APÓS O VENCIMENTO COBRAR JUROS DE '
                                     +FormatFloat('###,###,##0.00',wValorJuro)
                                     + ' AO DIA';
  End;
end;

procedure TDMRelatorio_Venda.QRReciboComissaoCalcFields(DataSet: TDataSet);
begin
  QRReciboComissaoVal_Irrf.Value := 0;
  If Trim(QRReciboComissaoCod_Serie.Value) <> 'PE' Then
  Begin
    If QRReciboComissaoPerc_Irrf.Value <> 0 Then
       QRReciboComissaoVal_Irrf.Value := QRReciboComissaosVal_Comissao.Value * QRReciboComissaoPerc_Irrf.Value / 100;
    If QRReciboComissaoVal_Irrf.Value <= 10 Then
       QRReciboComissaoVal_Irrf.Value := 0;
  end;
  QRReciboComissaoVal_Liquido.Value := QRReciboComissaosVal_Comissao.Value - QRReciboComissaoVal_Irrf.Value;
  QRReciboComissaoval_extenso.Value := Bib.extenso(QRReciboComissaoVAL_LIQUIDO.Value,'REAL');
end;

procedure TDMRelatorio_Venda.QRVendedorCMedioCalcFields(DataSet: TDataSet);
begin
  If QRVendedorCMediosQt_Kilos.Value <> 0 Then
     QRVendedorCMediosPreco_Medio.Value := QRVendedorCMediosVal_Total.Value / QRVendedorCMediosQt_Kilos.Value;
  If (QRVendedorCMediosQt_Kilos.Value + QRVendedorCMediosQt_Kilos_Bonificacao.Value) <> 0 Then
     QRVendedorCMediosPreco_Medio_KG.Value := QRVendedorCMediosVal_Total.Value / (QRVendedorCMediosQt_Kilos.Value + QRVendedorCMediosQt_Kilos_Bonificacao.Value);
end;

procedure TDMRelatorio_Venda.QRVendedorCMedio2CalcFields(DataSet: TDataSet);
begin
  If QRVendedorCMedio2sQt_Kilos.Value <> 0 Then
     QRVendedorCMedio2sPreco_Medio.Value := QRVendedorCMedio2sVal_Total.Value / QRVendedorCMedio2sQt_Kilos.Value;
  If (QRVendedorCMedio2sQt_Kilos.Value + QRVendedorCMedio2sQt_Kilos_Bonificacao.Value) <> 0 Then
     QRVendedorCMedio2sPreco_Medio_KG.Value := QRVendedorCMedio2sVal_Total.Value / (QRVendedorCMedio2sQt_Kilos.Value + QRVendedorCMedio2sQt_Kilos_Bonificacao.Value);
end;

procedure TDMRelatorio_Venda.QRContaCorrenteCalcFields(DataSet: TDataSet);
begin
  QRContaCorrenteVal_Total.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL+Tb_nota_item.VAL_IPI-Tb_nota_item.VAL_DESCONTO) FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+FloatToStr(QrContaCorrenteCod_Nota_Cab.Value)));
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES' Then  // para aristides nao separa a entrada do valor a prazo
    If QRContaCorrenteVal_AVista.Value > 0 Then
      If pTipoPagto = 0 Then
        QRContaCorrenteVal_Total.Value := QRContaCorrenteVal_AVista.Value
      Else
        QRContaCorrenteVal_Total.Value := QRContaCorrenteVal_Total.Value - QRContaCorrenteVal_AVista.Value;
end;

procedure TDMRelatorio_Venda.QrVendaHistoricoCalcFields(DataSet: TDataSet);
Var wData : String;
begin
   If QRVendaHistoricoInd_condicao_pagto.Value = '1'
   Then
     QRVendaHistoricoCond_Pagamento.Value  := 'A Vista';
   If QRVendaHistoricoInd_condicao_pagto.Value = '2' Then
   Begin
      QRVendaHistoricoCond_Pagamento.Value  := 'A Prazo';
      wData := DMOracle.BuscaNome('SELECT dt_vencimento FROM TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = '+FloatToStr(QRVendaHistoricoCod_Nota_Cab.Value));
      If Trim(wData) <> '' Then
         QRVendaHistoricoDt_vencimento.Value := StrToDate(wData);
   End;
   If QRVendaHistoricoInd_condicao_pagto.Value = '3'
   Then
      QRVendaHistoricoCond_Pagamento.Value  := 'Cheque';
end;

procedure TDMRelatorio_Venda.QRVendProdPeriodoCalcFields(DataSet: TDataSet);
begin
  If QRVendProdPeriodoQt_Quantidade.Value <> 0 Then
     QRVendProdPeriodoVal_Custo_Medio.Value := QRVendProdPeriodoVal_Custo_Total.Value / QRVendProdPeriodoQt_Quantidade.Value
  Else
     QRVendProdPeriodoVal_Custo_Medio.Value := 0;
end;

procedure TDMRelatorio_Venda.QRMilhagemCalcFields(DataSet: TDataSet);
begin
  // Calcula valor de comissão

  if DMRelatorio_Venda.QRMilhagemIND_MILHAGEM.Value = 'NAO' Then
     DMRelatorio_Venda.QRMilhagemTotalAberto.Value := DMRelatorio_Venda.QRMilhagemVAL_TOTAL.Value;

  if DMRelatorio_Venda.QRMilhagemIND_MILHAGEM.Value = 'SIM' Then
     DMRelatorio_Venda.QRMilhagemTotalPago.Value := DMRelatorio_Venda.QRMilhagemVAL_TOTAL.Value;

  if DMRelatorio_Venda.QRMilhagemIND_CONDICAO_PAGTO.Value = '1' Then
     DMRelatorio_Venda.QRMilhagemCondPGTO.Value := 'A vista   '
  else if DMRelatorio_Venda.QRMilhagemIND_CONDICAO_PAGTO.Value = '2' Then
          DMRelatorio_Venda.QRMilhagemCondPGTO.Value := 'A prazo   '
  else if DMRelatorio_Venda.QRMilhagemIND_CONDICAO_PAGTO.Value = '3' Then
          DMRelatorio_Venda.QRMilhagemCondPGTO.Value := 'C.Corrente'

end;

procedure TDMRelatorio_Venda.QRCustoCompraCalcFields(DataSet: TDataSet);
begin
  if QRCustoCompraVAL_VAREJO.Value > 0 Then
    QRCustoCompraPerc_Diferenca.Value := (100-QRCustoCompraVAL_CUSTO.Value*100/QRCustoCompraVAL_VAREJO.Value)
  else
    QRCustoCompraPerc_Diferenca.Value := 0;
end;

procedure TDMRelatorio_Venda.QConferenciaCalcFields(DataSet: TDataSet);
begin
  QConferencianome_transportador.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QConferenciaCod_Transportador.Value));
  if QConferencianome_transportador.Value = '' Then
     QConferencianome_transportador.Value := QConferenciaDesc_Transportadora.Value;
end;

procedure TDMRelatorio_Venda.QRVendaOperacaoCalcFields(DataSet: TDataSet);
begin
  QRVendaOperacaoNome_Vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QRVendaOperacaoCod_Vendedor.Value));
end;

procedure TDMRelatorio_Venda.QRMovMercadItemCalcFields(DataSet: TDataSet);
begin
{  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' then
     QRMovMercadItemVAL_AUXILIAR.Value := QRMovMercadItemQT_KILOS.Value
  Else
     QRMovMercadItemVAL_AUXILIAR.Value := QRMovMercadItemVAL_TOTAL.Value; }
end;

procedure TDMRelatorio_Venda.QREtiq_ItemsNFCalcFields(DataSet: TDataSet);
begin
  QREtiq_ItemsNFnome.Value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QREtiq_ItemsNFCOD_CADASTRO.Value));
end;

procedure TDMRelatorio_Venda.QRFutura_ClienteCalcFields(DataSet: TDataSet);
begin
{  If QRFutura_ClienteInd_Tipo_Produto.Value = 'AGRICOLA' Then
     QRFutura_ClienteVal_Total.Value := QRFuturasVal_Total.Value / QRFutura_ClienteNum_Embalagem.Value
  Else
     QRFutura_ClienteVal_Total.Value := QRFuturasVal_Total.Value;
 }
 if QRFutura_ClienteCOD_CADASTRO.Text <> '' then
  QRFutura_Clientenome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ QRFutura_ClienteCOD_CADASTRO.Text);
end;

procedure TDMRelatorio_Venda.QRFuturaCalcFields(DataSet: TDataSet);
Var wQuant : Real;
begin
  wQuant := QRFuturaQt_Nota_Item.Value - QRFuturaQt_Devolvido.Value - QRFuturaQt_Atendido.Value - QRFuturaQt_Cancelado.Value;
  QRFuturasVal_Total.Value := wQuant * QRFuturaVal_Unitario.Value;
  If QRFuturaInd_Tipo_Produto.Value = 'AGRICOLA' Then
     QRFuturasVal_Total.Value := QRFuturasVal_Total.Value / QRFuturaNum_Embalagem.Value;
  QRFuturasVal_Total.Value := QRFuturasVal_Total.Value - (QRFuturaVal_Funrural.Value / QRFuturaQt_Nota_Item.Value * wQuant);
  If QRFuturaCOD_CADASTRO.Text <> '' then
    QRFuturanome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRFuturaCOD_CADASTRO.Text);
end;

procedure TDMRelatorio_Venda.QRComissaoCalcFields(DataSet: TDataSet);
begin
  If QRComissaoPerc_Comissao_Item.Value <> 0 Then
     QRComissaoVal_Comissao.Value := QRComissaosVal_Total.Value * QRComissaoPerc_Comissao_Item.Value / 100
  Else
     QRComissaoVal_Comissao.Value := QRComissaosVal_Total.Value * QRComissaoPerc_Comissao_Nota.Value / 100;
  QRComissaoSVal_Irrf.Value := QRComissaoVal_Comissao.Value * QRComissaoPerc_Irrf.Value / 100;
end;

procedure TDMRelatorio_Venda.QRComissaoClienteCalcFields(
  DataSet: TDataSet);
begin
  If QRComissaoClientePerc_Comissao_Item.Value <> 0 Then
     QRComissaoClienteVal_Comissao.Value := QRComissaoClientesVal_Total.Value *
                                QRComissaoClientePerc_Comissao_Item.Value / 100
  Else
     QRComissaoClienteVal_Comissao.Value := QRComissaoClientesVal_Total.Value *
                                QRComissaoClientePerc_Comissao_Nota.Value / 100;
end;

procedure TDMRelatorio_Venda.QRVendaVendedorClienteCalcFields(
  DataSet: TDataSet);
Var wstrSql, wstrData : String;
begin
  If(NOT QRVendaVendedorClienteCOD_CADASTRO.IsNull)Then
  Begin
    wstrSql := 'TB_NOTA_CAB.COD_CADASTRO = ' + QRVendaVendedorClienteCOD_CADASTRO.Text +
               ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = '+CHR(39)+'S'+CHR(39)+
               ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';

    wstrData := DMOracle.BuscaNome( 'SELECT MAX(DT_RECEBIMENTO) FROM TB_NOTA_CAB',wstrSql);
    If Trim(wstrData) <> '' Then
      QRVendaVendedorClientedt_ultima_compra.Value := StrToDate(wstrData);
  End;

end;

procedure TDMRelatorio_Venda.QRClienteSemCompraCalcFields(
  DataSet: TDataSet);
Var wValor : String;
begin
  wValor := DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL-Tb_nota_item.VAL_DESCONTO) FROM TB_NOTA_CAB,TB_NOTA_ITEM','TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB AND COD_CADASTRO = '+QRClienteSemCompraCOD_CADASTRO.Text);
  If wValor <> '' Then
     QRClienteSemCompraVal_Venda.Value := StrToFloat(wValor);
end;

procedure TDMRelatorio_Venda.QRVendaClasseCalcFields(DataSet: TDataSet);
Var wCusto : String;
begin
  If QRVendaClasseSQt_Quantidade.Value <> 0 Then
   If QRVendaClassesVal_Custo1.Value = 0 Then
    Begin
      wCusto := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+QRVendaClasseCod_Produto.Text + ' And Cod_Filial=1');
      If wCusto <> '' Then
         QRVendaClassesVal_Custo.Value := StrToFloat(wCusto);
    End
   Else
     QRVendaClassesVal_Custo.Value := QRVendaClassesVal_Custo1.Value;
end;

procedure TDMRelatorio_Venda.QRAcompanhaMetaCalcFields(DataSet: TDataSet);
begin
  QRAcompanhaMetasaldo.Value := DMRelatorio_Venda.QRAcompanhaMetaVal_Total.Value - pMeta;
  QRAcompanhaMetameta.Value := pMeta;
end;

procedure TDMRelatorio_Venda.SetpMeta(const Value: Real);
begin
  FpMeta := Value;
end;

procedure TDMRelatorio_Venda.QRMovEntradaSaidaCalcFields(
  DataSet: TDataSet);
begin
  QRMovEntradaSaidaCusto.Text:=DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE','COD_PRODUTO = '+QRMovEntradaSaidaCod_Produto.Text + ' And Cod_Lote_Tipo= '+QRMovEntradaSaidaCod_Lote_Tipo.Text);

end;

procedure TDMRelatorio_Venda.QRelacaoCalcFields(DataSet: TDataSet);
var
wObs : string;
begin
  If QRelacaosVal_Custo.Value > 0 Then
     QRelacaoPerc_Lucratividade.Value := (QRelacaosVal_Total.Value / QRelacaosVal_Custo.Value - 1) * 100
  else
     QRelacaoPerc_Lucratividade.Value := 0;
     
  if Trim(QRelacaoNUM_PEDIDO.Text) <> '' then // Adicionado por Djeison S. 04/09/2012
  begin
    wObs := DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_OBS FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB='+QRelacaoNUM_PEDIDO.Text) + '';
    QRelacaoNOME.Text := QRelacaoNOME.Text + '-'+wObs;
  end;
  QRelacaonum_pecas.Text := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+QRelacaoCOD_NOTA_CAB.Text);
end;

procedure TDMRelatorio_Venda.QRVendVendedorResumoCalcFields(
  DataSet: TDataSet);
begin
  If QRVendVendedorResumoQt_Quantidade.Value <> 0 Then
     QRVendVendedorResumoPreco_Medio.Value := QRVendVendedorResumoVal_Total.Value / QRVendVendedorResumoQt_Quantidade.Value;

end;

procedure TDMRelatorio_Venda.QRMapaVendaCalcFields(DataSet: TDataSet);
Var wCusto : String;
begin
  If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') Or (DmParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') Or (DmParamSistema.QParamSistemaCod_Empresa.Value = 'LUNASA') Then
   Begin
     wCusto := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = ' +QRMapaVendaCod_Produto.Text + ' And COD_FILIAL='+QRMapaVendaCod_Filial.Text + ' And COD_LOTE_TIPO ='+QRMapaVendaCod_Lote_Tipo.Text);
     If wCusto <> '' Then
        QRMapaVendasVal_Custo.Value := StrToFloat(wCusto) * QRMapaVendasQt_Quantidade.Value;
   End
  Else
    QRMapaVendasVal_Custo.Value := QRMapaVendaVal_Custo.Value;
end;

procedure TDMRelatorio_Venda.QRMapaVendaResCalcFields(DataSet: TDataSet);
Var wCusto : String;
begin
  If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') Or (DmParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') Or (DmParamSistema.QParamSistemaCod_Empresa.Value = 'LUNASA') Then
   Begin
     wCusto := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = ' +QRMapaVendaResCod_Produto.Text + ' And COD_FILIAL='+QRMapaVendaResCod_Filial.Text + ' And COD_LOTE_TIPO = '+QRMapaVendaResCod_Lote_Tipo.Text);
     If wCusto <> '' Then
        QRMapaVendaRessVal_Custo.Value := StrToFloat(wCusto) * QRMapaVendaRessQt_Quantidade.Value;
   End
  Else
    QRMapaVendaRessVal_Custo.Value := QRMapaVendaResVal_Custo.Value;
end;

procedure TDMRelatorio_Venda.QRVendedorCMedioMesCalcFields(
  DataSet: TDataSet);
begin
  If QRVendedorCMedioMesSQT_KILOS_JAN.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_jan.Value := QRVendedorCMedioMesSVAL_TOTAL_JAN.Value / QRVendedorCMedioMesSQT_KILOS_JAN.Value;
  If QRVendedorCMedioMesSQT_KILOS_FEV.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_fev.Value := QRVendedorCMedioMesSVAL_TOTAL_FEV.Value / QRVendedorCMedioMesSQT_KILOS_FEV.Value;
  If QRVendedorCMedioMesSQT_KILOS_MAR.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_mar.Value := QRVendedorCMedioMesSVAL_TOTAL_MAR.Value / QRVendedorCMedioMesSQT_KILOS_MAR.Value;
  If QRVendedorCMedioMesSQT_KILOS_ABR.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_abr.Value := QRVendedorCMedioMesSVAL_TOTAL_ABR.Value / QRVendedorCMedioMesSQT_KILOS_ABR.Value;
  If QRVendedorCMedioMesSQT_KILOS_MAI.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_mai.Value := QRVendedorCMedioMesSVAL_TOTAL_MAI.Value / QRVendedorCMedioMesSQT_KILOS_MAI.Value;
  If QRVendedorCMedioMesSQT_KILOS_JUN.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_jun.Value := QRVendedorCMedioMesSVAL_TOTAL_JUN.Value / QRVendedorCMedioMesSQT_KILOS_JUN.Value;
  If QRVendedorCMedioMesSQT_KILOS_JUL.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_jul.Value := QRVendedorCMedioMesSVAL_TOTAL_JUL.Value / QRVendedorCMedioMesSQT_KILOS_JUL.Value;
  If QRVendedorCMedioMesSQT_KILOS_AGO.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_ago.Value := QRVendedorCMedioMesSVAL_TOTAL_AGO.Value / QRVendedorCMedioMesSQT_KILOS_AGO.Value;
  If QRVendedorCMedioMesSQT_KILOS_SET.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_set.Value := QRVendedorCMedioMesSVAL_TOTAL_SET.Value / QRVendedorCMedioMesSQT_KILOS_SET.Value;
  If QRVendedorCMedioMesSQT_KILOS_OUT.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_out.Value := QRVendedorCMedioMesSVAL_TOTAL_OUT.Value / QRVendedorCMedioMesSQT_KILOS_OUT.Value;
  If QRVendedorCMedioMesSQT_KILOS_NOV.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_nov.Value := QRVendedorCMedioMesSVAL_TOTAL_NOV.Value / QRVendedorCMedioMesSQT_KILOS_NOV.Value;
  If QRVendedorCMedioMesSQT_KILOS_DEZ.Value <> 0 Then
     QRVendedorCMedioMessPreco_Medio_dez.Value := QRVendedorCMedioMesSVAL_TOTAL_DEZ.Value / QRVendedorCMedioMesSQT_KILOS_DEZ.Value;



  If (QRVendedorCMedioMesSQT_KILOS_JAN.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JAN.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_jan.Value := QRVendedorCMedioMesSVAL_TOTAL_JAN.Value / (QRVendedorCMedioMesSQT_KILOS_JAN.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JAN.Value);
  If (QRVendedorCMedioMesSQT_KILOS_FEV.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_FEV.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_fev.Value := QRVendedorCMedioMesSVAL_TOTAL_FEV.Value / (QRVendedorCMedioMesSQT_KILOS_FEV.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_FEV.Value);
  If (QRVendedorCMedioMesSQT_KILOS_MAR.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAR.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_mar.Value := QRVendedorCMedioMesSVAL_TOTAL_MAR.Value / (QRVendedorCMedioMesSQT_KILOS_MAR.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAR.Value);
  If (QRVendedorCMedioMesSQT_KILOS_ABR.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_ABR.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_abr.Value := QRVendedorCMedioMesSVAL_TOTAL_ABR.Value / (QRVendedorCMedioMesSQT_KILOS_ABR.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_ABR.Value);
  If (QRVendedorCMedioMesSQT_KILOS_MAI.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAI.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_mai.Value := QRVendedorCMedioMesSVAL_TOTAL_MAI.Value / (QRVendedorCMedioMesSQT_KILOS_MAI.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_MAI.Value);
  If (QRVendedorCMedioMesSQT_KILOS_JUN.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUN.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_jun.Value := QRVendedorCMedioMesSVAL_TOTAL_JUN.Value / (QRVendedorCMedioMesSQT_KILOS_JUN.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUN.Value);
  If (QRVendedorCMedioMesSQT_KILOS_JUL.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUL.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_jul.Value := QRVendedorCMedioMesSVAL_TOTAL_JUL.Value / (QRVendedorCMedioMesSQT_KILOS_JUL.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_JUL.Value);
  If (QRVendedorCMedioMesSQT_KILOS_AGO.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_AGO.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_ago.Value := QRVendedorCMedioMesSVAL_TOTAL_AGO.Value / (QRVendedorCMedioMesSQT_KILOS_AGO.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_AGO.Value);
  If (QRVendedorCMedioMesSQT_KILOS_SET.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_SET.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_set.Value := QRVendedorCMedioMesSVAL_TOTAL_SET.Value / (QRVendedorCMedioMesSQT_KILOS_SET.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_SET.Value);
  If (QRVendedorCMedioMesSQT_KILOS_OUT.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_OUT.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_out.Value := QRVendedorCMedioMesSVAL_TOTAL_OUT.Value / (QRVendedorCMedioMesSQT_KILOS_OUT.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_OUT.Value);
  If (QRVendedorCMedioMesSQT_KILOS_NOV.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_NOV.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_nov.Value := QRVendedorCMedioMesSVAL_TOTAL_NOV.Value / (QRVendedorCMedioMesSQT_KILOS_NOV.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_NOV.Value);
  If (QRVendedorCMedioMesSQT_KILOS_DEZ.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_DEZ.Value) <> 0 Then
     QRVendedorCMedioMessPreco_Medio_KG_dez.Value := QRVendedorCMedioMesSVAL_TOTAL_DEZ.Value / (QRVendedorCMedioMesSQT_KILOS_DEZ.Value + QRVendedorCMedioMesSQT_KILOS_BONIFICACAO_DEZ.Value);
end;

procedure TDMRelatorio_Venda.QRContaCorrente2CalcFields(DataSet: TDataSet);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
     QRContaCorrente2sVal_Total.Value := QRContaCorrente2Val_Total.Value - QRContaCorrente2Val_AVista.Value
  Else
     QRContaCorrente2sVal_Total.Value := QRContaCorrente2Val_Total.Value;
end;

procedure TDMRelatorio_Venda.QRMovEstoqueCalcFields(DataSet: TDataSet);
begin
  If ((DmParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or (DmParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL')) And (QRMovEstoqueQt_Quantidade.Value > 0) Then
     QRMovEstoqueVal_Custo.Value := QRMovEstoqueVal_Total.Value / QRMovEstoqueQt_Quantidade.Value
  Else
     QRMovEstoqueVal_Custo.Value := QRMovEstoqueVal_Custo_Sql.Value;
end;

procedure TDMRelatorio_Venda.QRInadimplenciaCalcFields(DataSet: TDataSet);
begin
  If QRInadimplenciaCod_Supervisor.Text <> '' Then
     QRInadimplenciaNome_Supervisor.Value:= DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = ' +QRInadimplenciaCod_Supervisor.Text);
end;

procedure TDMRelatorio_Venda.QRVendaVendClasseCalcFields(
  DataSet: TDataSet);
begin
  If QRVendaVendClasseCod_Cadastro.Text <> '' Then
     QRVendaVendClasseNome_Fornecedor.Value:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' +QRVendaVendClasseCod_Cadastro.Text);

end;

end.






