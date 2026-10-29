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
    QRMapaVendaResDESC_FILIAL: TStringField;
    QRMapaVendaResSQT_QUANTIDADE: TFloatField;
    QRMapaVendaResSVAL_TOTAL: TFloatField;
    QRMapaVendaResSVAL_CUSTO: TFloatField;
    QRVendedorCMedio2: TOracleDataSet1;
    QRVendedorCMedio2COD_PRODUTO: TFloatField;
    QRVendedorCMedio2COD_CLASSE: TFloatField;
    QRVendedorCMedio2DESC_CLASSE: TStringField;
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
    QRMapaVenda: TOracleDataSet1;
    QRMapaVendaDIA: TStringField;
    QRMapaVendaDESC_FILIAL: TStringField;
    QRMapaVendaSQT_QUANTIDADE: TFloatField;
    QRMapaVendaSVAL_TOTAL: TFloatField;
    QRMapaVendaSVAL_CUSTO: TFloatField;
    QrSeguroCarga: TOracleDataSet1;
    QrSeguroCargaCOD_FILIAL: TIntegerField;
    QrSeguroCargaCOD_ESTADO: TStringField;
    QrSeguroCargaCOD_CADASTRO: TIntegerField;
    QrSeguroCargaNUM_NOTA: TIntegerField;
    QrSeguroCargaCOD_SERIE: TStringField;
    QrSeguroCargaDT_EMISSAO: TDateTimeField;
    QrSeguroCargaNOME: TStringField;
    QrSeguroCargaPERC_FRETE: TFloatField;
    QrSeguroCargaSVAL_TOTAL: TFloatField;
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
    QRQuotaVendCOD_FILIAL: TFloatField;
    QRQuotaVendDESC_FILIAL: TStringField;
    QRQuotaVendCOD_VENDEDOR: TFloatField;
    QRQuotaVendNOME: TStringField;
    QRQuotaVendANO: TStringField;
    QRQuotaVendSREAL_JANEIRO: TFloatField;
    QRQuotaVendSREAL_FEVEREIRO: TFloatField;
    QRQuotaVendSREAL_MARCO: TFloatField;
    QRQuotaVendSREAL_ABRIL: TFloatField;
    QRQuotaVendSREAL_MAIO: TFloatField;
    QRQuotaVendSREAL_JUNHO: TFloatField;
    QRQuotaVendSREAL_JULHO: TFloatField;
    QRQuotaVendSREAL_AGOSTO: TFloatField;
    QRQuotaVendSREAL_SETEMBRO: TFloatField;
    QRQuotaVendSREAL_OUTUBRO: TFloatField;
    QRQuotaVendSREAL_NOVEMBRO: TFloatField;
    QRQuotaVendSREAL_DEZEMBRO: TFloatField;
    QRQuotaVendSVAL_JANEIRO: TFloatField;
    QRQuotaVendSVAL_FEVEREIRO: TFloatField;
    QRQuotaVendSVAL_MARCO: TFloatField;
    QRQuotaVendSVAL_ABRIL: TFloatField;
    QRQuotaVendSVAL_MAIO: TFloatField;
    QRQuotaVendSVAL_JUNHO: TFloatField;
    QRQuotaVendSVAL_JULHO: TFloatField;
    QRQuotaVendSVAL_AGOSTO: TFloatField;
    QRQuotaVendSVAL_SETEMBRO: TFloatField;
    QRQuotaVendSVAL_OUTUBRO: TFloatField;
    QRQuotaVendSVAL_NOVEMBRO: TFloatField;
    QRQuotaVendSVAL_DEZEMBRO: TFloatField;
    QRVendaVendClasse: TOracleDataSet1;
    QRVendaVendClasseCOD_PRODUTO: TFloatField;
    QRVendaVendClasseCOD_CADASTRO: TIntegerField;
    QRVendaVendClasseCOD_CLASSE: TIntegerField;
    QRVendaVendClasseDESC_CLASSE: TStringField;
    QRVendaVendClasseCOD_VENDEDOR: TIntegerField;
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
    QRClassePgtoVendCOD_FILIAL: TFloatField;
    QRClassePgtoVendDESC_FILIAL: TStringField;
    QRClassePgtoVendDESC_CLASSE: TStringField;
    QRClassePgtoVendCOD_VENDEDOR: TFloatField;
    QRClassePgtoVendNOME_VENDEDOR: TStringField;
    QRClassePgtoVendSVAL_VISTA: TFloatField;
    QRClassePgtoVendSVAL_PRAZO: TFloatField;
    QRClassePgtoVendSVAL_OUTROS: TFloatField;
    QRClassePgtoVendSVAL_TOTAL: TFloatField;
    QRClassePgto: TOracleDataSet1;
    QRClassePgtoCOD_FILIAL: TFloatField;
    QRClassePgtoDESC_FILIAL: TStringField;
    QRClassePgtoDESC_CLASSE: TStringField;
    QRClassePgtoSVAL_VISTA: TFloatField;
    QRClassePgtoSVAL_PRAZO: TFloatField;
    QRClassePgtoSVAL_OUTROS: TFloatField;
    QRClassePgtoSVAL_TOTAL: TFloatField;
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
    QRContaCorrente2SVAL_TOTAL: TFloatField;
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
    QRFutura_ClienteNOME: TStringField;
    QRFutura_ClienteCOD_CADASTRO: TIntegerField;
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
    QRFuturaNOME: TStringField;
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
    QRFutura_ClienteSVAL_TOTAL: TFloatField;
    QRFutura_Clienteval_total: TFloatField;
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
    QRFuturaVAL_UNITARIO: TFloatField;
    QRFuturasval_total: TFloatField;
    QRComissaoClientePERC_COMISSAO_NOTA: TFloatField;
    QRComissaoClientePERC_COMISSAO_ITEM: TFloatField;
    QRReciboComissaoSVAL_TOTAL: TFloatField;
    QRComissaoClienteval_comissao: TFloatField;
    QRReciboComissaoCOD_VENDEDOR: TIntegerField;
    QRReciboComissaoCOD_FILIAL: TIntegerField;
    QrSeguroCargaDESC_ESTADO: TStringField;
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
    QRVendaClasseNUM_CLASSE: TIntegerField;
    QRVendaClasseNUM_SUBCLASSE: TIntegerField;
    QRVendaClasseCOD_PRODUTO: TFloatField;
    QRVendaClasseDESC_CLASSE: TStringField;
    QRVendaClasseSVAL_TABELA: TFloatField;
    QRVendaClasseSQT_QUANTIDADE: TFloatField;
    QRVendaClasseSVAL_TOTAL: TFloatField;
    QrSeguroCargaIND_ENTRADA_SAIDA: TStringField;
    QrResumoClienteFONECADASTRO: TStringField;
    QRContaCorrenteVAL_AVISTA: TFloatField;
    QRReciboComissaoCOD_SERIE: TStringField;
    QrSeguroCargaDESC_CIDADE: TStringField;
    QRSeguroCarga1: TOracleDataSet1;
    QRVendaVendedorCliente: TOracleDataSet1;
    QRVendaVendedorClienteCOD_PRODUTO: TFloatField;
    QRVendaVendedorClienteCOD_CADASTRO: TFloatField;
    QRVendaVendedorClienteNOME_CLIENTE: TStringField;
    QRVendaVendedorClienteCOD_VENDEDOR: TFloatField;
    QRVendaVendedorClienteNOME_VENDEDOR: TStringField;
    QRVendaVendedorClienteSQT_QUANTIDADE: TFloatField;
    QRVendaVendedorClienteSVAL_TOTAL: TFloatField;
    QRMovEstoqueVAL_CUSTO: TFloatField;
    QRVendClasseSQT_BONIFICACAO: TFloatField;
    QRSeguroCarga1DESC_ESTADO: TStringField;
    QRSeguroCarga1PERC_FRETE: TFloatField;
    QRSeguroCarga1SVAL_TOTAL: TFloatField;
    QRSeguroCarga1COD_ESTADO: TStringField;
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
    QRVendaClasseCOD_VENDEDOR: TIntegerField;
    QRVendaClasseNOME: TStringField;
    QRVendaClasseCOD_CLASSE: TIntegerField;
    StringField1: TStringField;
    QRVendaClasseQT_QUANTIDADE: TFloatField;
    QRVendaClasseVAL_TOTAL: TFloatField;
    QRVendaClasseVAL_ICMS: TFloatField;
    QRVendaClasseVAL_COMISSAO: TFloatField;
    QRVendaClasseVAL_FRETE: TFloatField;
    QRVendaClasseVAL_CUSTO: TFloatField;
    QRVendaClasseTRIB_FED: TFloatField;
    QRelacaoCOD_NOTA_CAB: TIntegerField;
    QRelacaoNUM_NOTA: TIntegerField;
    QRelacaoCOD_FILIAL: TIntegerField;
    QRelacaoCOD_SERIE: TStringField;
    QRelacaoDT_RECEBIMENTO: TDateTimeField;
    QRelacaoCOD_ESTADO: TStringField;
    QRelacaoIND_SITUACAO: TStringField;
    QRelacaoDT_EMISSAO: TDateTimeField;
    QRelacaoCOD_OPERACAO: TIntegerField;
    QRelacaoNUM_VOLUMES: TIntegerField;
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
    QRVendedorCMedioSVAL_DESCONTO: TFloatField;
    QRVendedorCMedioSVAL_DESPESAS: TFloatField;
    QRVendedorCMedio2SVAL_TOTAL: TFloatField;
    QRVendedorCMedio2SVAL_DESCONTO: TFloatField;
    QRVendedorCMedio2SVAL_DESPESAS: TFloatField;
    QRVendedorCMedio2SVAL_DEVOLUCAO: TFloatField;
    QRVendedorCMedioSVAL_DEVOLUCAO: TFloatField;
    QRComissaoNUM_NOTA: TIntegerField;
    QRComissaoDT_EMISSAO: TDateTimeField;
    QRComissaoCOD_VENDEDOR: TIntegerField;
    QRComissaoNOME_VENDEDOR: TStringField;
    QRComissaoSQT_QUANTIDADE: TFloatField;
    QRComissaoSVAL_TOTAL: TFloatField;
    QRComissaoSVAL_DESCONTO: TFloatField;
    QRComissaoperc_desconto: TFloatField;
    QRComissaoperc_comissao: TFloatField;
    QRComissaoSVAL_COMISSAO: TFloatField;
    QRComissaoval_comissao: TFloatField;
    QRComissaoIND_VENDAS: TStringField;
    QConfItemDESC_PRODUTO: TStringField;
    QRCustoCompraDESC_PRODUTO: TStringField;
    QRFuturaDESC_PRODUTO: TStringField;
    QRFutura_ClienteDESC_PRODUTO: TStringField;
    QRMovEstoqueDESC_PRODUTO: TStringField;
    QRSecretariaDESC_PRODUTO: TStringField;
    QRMapaVendaResDESC_PRODUTO: TStringField;
    QRMapaVendaDESC_PRODUTO: TStringField;
    QRVendedorDESC_PRODUTO: TStringField;
    QrLotesClasparDESC_PRODUTO: TStringField;
    QRMovEntradaSaidaDESC_PRODUTO: TStringField;
    QRClasparDESC_PRODUTO: TStringField;
    QRVendProdPeriodoDESC_PRODUTO: TStringField;
    QRVendasVndRegiaoDESC_PRODUTO: TStringField;
    QRMovMercadoriaDESC_PRODUTO: TStringField;
    QRVendaVendedorClienteDESC_PRODUTO: TStringField;
    QRVendedorCMedio2DESC_PRODUTO: TStringField;
    QRVendedorCMedioDESC_PRODUTO: TStringField;
    QRVendaVendClasseDESC_PRODUTO: TStringField;
    QrResumoClienteDESC_PRODUTO: TStringField;
    QRVendaClasseDESC_PRODUTO: TStringField;
    QREtiq_ItemsNFDESC_PRODUTO: TStringField;
    QRTipoDocumentoDESC_PRODUTO: TStringField;
    QRTotalVenda: TOracleDataSet1;
    QRTotalVendaVAL_TOTAL: TFloatField;
    QRTotalVendaVAL_DESCONTO: TFloatField;
    QRTotalVendaDEVOLUCOES: TFloatField;
    QRTotalVendaTOTAL: TFloatField;
    QRTotalVendaVAL_ACRESCIMO: TFloatField;
    QRTotalVendaTOTAL_LIQUIDO: TFloatField;
    QRTotalVendaDESC_CLASSE: TStringField;
    QRTotalVendaNUM_CLASSE: TIntegerField;
    QRTotalVendaNUM_SUBCLASSE: TIntegerField;
    QRMapaVendaCOD_FILIAL: TFloatField;
    QRMapaVendaCOD_PRODUTO: TFloatField;
    QRMapaVendaResCOD_FILIAL: TFloatField;
    QRMapaVendaResCOD_PRODUTO: TFloatField;
    QRMovEntradaSaidaqt_estoque: TFloatField;
    QRBloquetoNUM_TITULO: TFloatField;
    QRComissaoSTOTAL_LIQ: TFloatField;
    QRelacaoQT_QUANTIDADE: TFloatField;
    QRelacaoSVAL_DESCONTO: TFloatField;
    QRelacaonum_pecas: TIntegerField;
    QConfItemVAL_ICMS_SUBST: TFloatField;
    procedure QRBloquetoCalcFields(DataSet: TDataSet);
    procedure QRReciboComissaoCalcFields(DataSet: TDataSet);
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
    procedure QRComissaoClienteCalcFields(DataSet: TDataSet);
    procedure QRVendaVendedorClienteCalcFields(DataSet: TDataSet);
    procedure QRClienteSemCompraCalcFields(DataSet: TDataSet);
    procedure QRVendaClasseCalcFields(DataSet: TDataSet);
    procedure QRAcompanhaMetaCalcFields(DataSet: TDataSet);
    procedure QRMovEntradaSaidaCalcFields(DataSet: TDataSet);
    procedure QRComissaoCalcFields(DataSet: TDataSet);
                    
  private
    { Private declarations }
    fTipoPagto : Integer;
    fFilial : Integer;
    FpMeta: Real;
    procedure SetpMeta(const Value: Real);  // utilizado para o relatorio de conta corrente para tratar valor a vista

  public
    { Public declarations }
    Property pTipoPagto : Integer Read fTipoPagto Write fTipoPagto;
    Property pMeta: Real read FpMeta write SetpMeta;
    Property pFilial: Integer read fFilial write fFilial;
  end;

var
  DMRelatorio_Venda: TDMRelatorio_Venda;

implementation

uses UOracle_cl, UBiblioteca;

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

procedure TDMRelatorio_Venda.QRContaCorrenteCalcFields(DataSet: TDataSet);
begin
  QRContaCorrenteVal_Total.Value := StrToFloat(DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL+Tb_nota_item.VAL_IPI-Tb_nota_item.VAL_DESCONTO) FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+FloatToStr(QrContaCorrenteCod_Nota_Cab.Value)));
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
  If QRFutura_ClienteInd_Tipo_Produto.Value = 'AGRICOLA' Then
     QRFutura_ClienteVal_Total.Value := QRFuturasVal_Total.Value / QRFutura_ClienteNum_Embalagem.Value
  Else
     QRFutura_ClienteVal_Total.Value := QRFuturasVal_Total.Value;

end;

procedure TDMRelatorio_Venda.QRFuturaCalcFields(DataSet: TDataSet);
begin
  QRFuturasVal_Total.Value := (QRFuturaQt_Nota_Item.Value - QRFuturaQt_Devolvido.Value -
                               QRFuturaQt_Atendido.Value - QRFuturaQt_Cancelado.Value) *
                               QRFuturaVal_Unitario.Value;
  If QRFuturaInd_Tipo_Produto.Value = 'AGRICOLA' Then
     QRFuturasVal_Total.Value := QRFuturasVal_Total.Value / QRFuturaNum_Embalagem.Value;
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
Var
  wstrSql, wstrData : String;
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
begin
  If QRVendaClasseSQt_Quantidade.Value <> 0 Then
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
  If fFilial = 0 Then
   Begin
     QRMovEntradaSaidaCusto.Text:=DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE','COD_PRODUTO = '+QRMovEntradaSaidaCod_Produto.Text + ' And Cod_Lote_Tipo= '+QRMovEntradaSaidaCod_Lote_Tipo.Text);
     QRMovEntradaSaidaQt_estoque.Text:=DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE','COD_PRODUTO = '+QRMovEntradaSaidaCod_Produto.Text + ' And Cod_Lote_Tipo= '+QRMovEntradaSaidaCod_Lote_Tipo.Text);
   End
  Else
   Begin
     QRMovEntradaSaidaCusto.Text:=DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+QRMovEntradaSaidaCod_Produto.Text +
                          ' And Cod_Lote_Tipo= '+QRMovEntradaSaidaCod_Lote_Tipo.Text+ ' And Cod_Filial= '+IntToStr(fFilial));
     QRMovEntradaSaidaQt_estoque.Text:=DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO = '+QRMovEntradaSaidaCod_Produto.Text +
                          ' And Cod_Lote_Tipo= '+QRMovEntradaSaidaCod_Lote_Tipo.Text+ ' And Cod_Filial= '+IntToStr(fFilial));
   End
end;

procedure TDMRelatorio_Venda.QRComissaoCalcFields(DataSet: TDataSet);
Var wValor_Total : Real;  // para fazer os calculos devido as notas fiscais de devolucao
Begin
  wValor_Total := QRComissaoSVal_Total.Value;     // utilizado somente para os calculos devido as notas de devolucao
  If QRComissaoInd_Vendas.Value = 'D' Then
     wValor_Total := wValor_Total * -1;

  QRComissaoPerc_Comissao.Value := QRComissaoSVal_Comissao.Value / (wValor_Total - QRComissaoSVal_Desconto.Value) * 100;

  If ((QRComissaoPerc_Comissao.Value < 1) and (QRComissaoInd_Vendas.Value <> 'D')) Then
   Begin
     QRComissaoPerc_Comissao.Value := 1;
     QRComissaoVal_Comissao.Value := (wValor_Total - QRComissaoSVal_Desconto.Value) * 0.01;
   End
  Else
  If ((QRComissaoPerc_Comissao.Value < 1) and (QRComissaoInd_Vendas.Value = 'D')) Then
   Begin
     QRComissaoPerc_Comissao.Value := 1;
     QRComissaoVal_Comissao.Value := (wValor_Total + QRComissaoSVal_Desconto.Value) * 0.01;
   End
  Else
   QRComissaoVal_Comissao.Value := QRComissaoSVal_Comissao.Value;
  If QRComissaoInd_Vendas.Value = 'D' Then
     QRComissaoVal_Comissao.Value := QRComissaoVal_Comissao.Value * -1;    
  QRComissaoPerc_Desconto.Value := (QRComissaoSVal_Desconto.Value / wValor_Total) * 100;
End;

end.






