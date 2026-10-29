unit UNotaSaida_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, variants, CustomDialog, StrUtils, Oracle,
  Provider, DBClient, UBiblioteca, uCalculoIBSCBS;
  // ACBr
 { ACBrBase, ACBrBoleto, ACBrUtil, ACBrMail, ACBrUtil.FilesIO,
  ACBrBoletoConversao, ACBrBoletoRetorno, ACBrBoletoFCFortesFr;}

type
  TDMNotaSaida = class(TDataModule)
    DSNotaSaida: TDataSource;
    DSItemNF: TDataSource;
    DSBaixasPed: TDataSource;
    DSContaPagar: TDataSource;
    DSContaReceber: TDataSource;
    DSNFAuxAberto: TDataSource;
    DSBaixaAux: TDataSource;
    DSSomaItemNota: TDataSource;
    DSSomaContaCorrente: TDataSource;
    QVoltaContaCorrente: TOracleDataSet1;
    QAtzNFContaCorrente: TOracleDataSet1;
    QNotaAux: TOracleDataSet1;
    QNotaAuxItNF: TOracleDataSet1;
    QNotaAuxItNFCOD_NOTA_AUX: TIntegerField;
    QNotaAuxItNFCOD_NOTA_ITEM: TIntegerField;
    QNotaAuxItNFCOD_PRODUTO: TFloatField;
    QNotaAuxItNFDT_ATENDIDO: TDateTimeField;
    QNotaAuxItNFIND_TIPO: TStringField;
    QNotaAuxCOD_NOTA_AUX: TIntegerField;
    QNotaAuxCOD_NOTA_ITEM: TIntegerField;
    QNotaAuxCOD_PRODUTO: TFloatField;
    QNotaAuxDT_ATENDIDO: TDateTimeField;
    QNotaAuxIND_TIPO: TStringField;
    QNotaSaida: TOracleDataSet1;
    QNotaSaidaCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaCOD_USUARIO: TIntegerField;
    QNotaSaidaCOD_FILIAL: TIntegerField;
    QNotaSaidaCOD_MENSAGEM: TIntegerField;
    QNotaSaidaCOD_TRANSPORTE: TIntegerField;
    QNotaSaidaCOD_OPERACAO: TIntegerField;
    QNotaSaidaCOD_ESTADO: TStringField;
    QNotaSaidaCOD_VENDEDOR: TIntegerField;
    QNotaSaidaCOD_CADASTRO: TIntegerField;
    QNotaSaidaNUM_NOTA: TIntegerField;
    QNotaSaidaCOD_SERIE: TStringField;
    QNotaSaidaIND_SITUACAO: TStringField;
    QNotaSaidaIND_CONDICAO_PAGTO: TStringField;
    QNotaSaidaDT_EMISSAO: TDateTimeField;
    QNotaSaidaDT_MOVIMENTO: TDateTimeField;
    QNotaSaidaDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaCOD_MOTIVO_CANC: TIntegerField;
    QNotaSaidaVAL_DESPESAS: TFloatField;
    QNotaSaidaIND_ENTRADA_SAIDA: TStringField;
    QNotaSaidaVAL_FRETE: TFloatField;
    QNotaSaidaVAL_DESCONTO: TFloatField;
    QNotaSaidaCOD_TRANSPORTADOR: TIntegerField;
    QNotaSaidaNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaSaidaVAL_AVISTA: TFloatField;
    QNotaSaidaIND_TIPO_FRETE: TStringField;
    QNotaSaidaNUM_VOLUMES: TIntegerField;
    QNotaSaidaDT_USUARIO: TDateTimeField;
    QNotaSaidaCOD_TRIBUTACAO_FRETE: TIntegerField;
    QNotaSaidaVAL_TOTAL_IPI: TFloatField;
    QNotaSaidaVAL_ICM_FRETE: TFloatField;
    QNotaSaidaVAL_ICM_BASE_FRETE: TFloatField;
    QNotaSaidaVAL_FUNRURAL: TFloatField;
    QNotaSaidaDESC_PLACA: TStringField;
    QNotaSaidaDESC_TRANSPORTADORA: TStringField;
    QNotaSaidaCOD_NOTA_CONTA_CORRENTE: TIntegerField;
    QNotaSaidaDT_EMISSAO_CF: TDateTimeField;
    QNotaSaidaCOD_OPERACAO_CF: TIntegerField;
    QNotaSaidaNR_DIAS_CHEQUE: TIntegerField;
    QNotaSaidaCOD_CONTRATO_MOV: TIntegerField;
    QNotaSaidaCOD_CONTRATO_GP_MOV: TIntegerField;
    QNotaSaidaNR_DIAS_CHEQUE2: TIntegerField;
    QNotaSaidaIND_NOTA_SEGURO: TStringField;
    QNotaSaidaCOD_CONTRATO_VEND: TIntegerField;
    QNotaSaidaNR_ROTA: TIntegerField;
    QNotaSaidaPERC_COMISSAO: TFloatField;
    QNotaSaidaIND_MILHAGEM: TStringField;
    QItemNF: TOracleDataSet1;
    QItemNFCOD_NOTA_ITEM: TIntegerField;
    QItemNFCOD_NOTA_CAB: TIntegerField;
    QItemNFCOD_TRIBUTACAO: TIntegerField;
    QItemNFQT_QUANTIDADE: TFloatField;
    QItemNFVAL_TOTAL: TFloatField;
    QItemNFPERC_IPI: TFloatField;
    QItemNFPERC_COMISSAO: TFloatField;
    QItemNFCOD_PRODUTO: TFloatField;
    QItemNFCOD_LOTE_TIPO: TIntegerField;
    QItemNFVAL_DESCONTO: TFloatField;
    QItemNFVAL_FRETE: TFloatField;
    QItemNFPERC_DESCONTO: TFloatField;
    QItemNFVAL_IPI: TFloatField;
    QItemNFVAL_UNITARIO: TFloatField;
    QItemNFVAL_ICM_BASE: TFloatField;
    QItemNFVAL_ICM: TFloatField;
    QItemNFIND_CLASS_IPI: TStringField;
    QItemNFVAL_CUSTO: TFloatField;
    QItemNFVAL_ISS: TFloatField;
    QItemNFPERC_INSS: TFloatField;
    QItemNFPERC_BENEFICIADO: TFloatField;
    QItemNFIND_BX_CONTR_VEND: TStringField;
    QItemNFNUM_NOTA_PRODUTOR: TIntegerField;
    QItemNFnome_produto: TStringField;
    QContaPagar: TOracleDataSet1;
    QContaPagarMov: TOracleDataSet1;
    QNFE_Emite: TOracleDataSet1;
    QNFE_EmiteCOD_OPERACAO: TIntegerField;
    QNFE_EmiteNAT_OPERACAO: TStringField;
    QNFE_EmiteNAT_INTERESTADUAL: TIntegerField;
    QNFE_EmiteNAT_ESTADUAL: TIntegerField;
    QNFE_EmiteIND_VENDAS: TStringField;
    QNFE_EmiteIND_FIXAR_EMPRESA: TStringField;
    QNFE_EmiteCOD_FILIAL: TIntegerField;
    QNFE_EmiteNOME_FILIAL: TStringField;
    QNFE_EmiteEND_FILIAL: TStringField;
    QNFE_EmiteCIDADE_FILIAL: TStringField;
    QNFE_EmiteTELEFONE_FILIAL: TStringField;
    QNFE_EmiteCEP_FILIAL: TStringField;
    QNFE_EmiteUF_FILIAL: TStringField;
    QNFE_EmiteCGC_FILIAL: TStringField;
    QNFE_EmiteINSCRICAO_FILIAL: TStringField;
    QNFE_EmiteCXPOSTAL_FILIAL: TIntegerField;
    QNFE_EmiteDESC_FAX: TStringField;
    QNFE_EmiteDESC_E_MAIL: TStringField;
    QNFE_EmiteCOD_NOTA_CAB: TIntegerField;
    QNFE_EmiteCOD_CADASTRO: TIntegerField;
    QNFE_EmiteCOD_VENDEDOR: TIntegerField;
    QNFE_EmiteVAL_FRETE: TFloatField;
    QNFE_EmiteVAL_DESCONTO: TFloatField;
    QNFE_EmiteVAL_FUNRURAL: TFloatField;
    QNFE_EmiteIND_TIPO_FRETE: TStringField;
    QNFE_EmiteIND_ENTRADA_SAIDA: TStringField;
    QNFE_EmiteIND_SITUACAO: TStringField;
    QNFE_EmiteIND_CONDICAO_PAGTO: TStringField;
    QNFE_EmiteNUM_NOTA: TIntegerField;
    QNFE_EmiteDT_EMISSAO: TDateTimeField;
    QNFE_EmiteDT_RECEBIMENTO: TDateTimeField;
    QNFE_EmiteUF_NOTA: TStringField;
    QNFE_EmiteVAL_DESPESAS: TFloatField;
    QNFE_EmiteCOD_TRANSPORTADOR: TIntegerField;
    QNFE_EmiteCOD_MENSAGEM: TIntegerField;
    QNFE_EmiteDESC_PLACA: TStringField;
    QNFE_EmiteNUM_VOLUMES: TIntegerField;
    QNFE_EmiteOBS: TStringField;
    QNFE_EmiteDESC_TRANSPORTADORA: TStringField;
    QNFE_EmiteNR_DIAS_CHEQUE: TIntegerField;
    QNFE_EmiteNR_DIAS_CHEQUE1: TIntegerField;
    QNFE_EmiteNR_DIAS_CHEQUE2: TIntegerField;
    QNFE_EmiteNOME: TStringField;
    QNFE_EmiteDESC_ENDERECO: TStringField;
    QNFE_EmiteNUM_INSCRICAO: TStringField;
    QNFE_EmiteDESC_BAIRRO: TStringField;
    QNFE_EmiteCOD_ESTADO: TStringField;
    QNFE_EmiteNUM_CGC_CPF: TStringField;
    QNFE_EmiteDESC_CIDADE: TStringField;
    QNFE_EmiteDESC_TELEFONE: TStringField;
    QNFE_EmiteDESC_FANTASIA: TStringField;
    QNFE_EmiteDESC_CEP: TStringField;
    QNFE_Emiteqt_beneficiado: TFloatField;
    QNFE_Emitetotal_produtos: TFloatField;
    QNFE_Emitenome_transp: TStringField;
    QNFE_Emiteend_transp: TStringField;
    QNFE_Emiteinsc_transp: TStringField;
    QNFE_Emitecgc_transp: TStringField;
    QNFE_Emiteuf_transp: TStringField;
    QNFE_EmiteIt: TOracleDataSet1;
    QNFE_EmiteItCOD_NOTA_CAB: TIntegerField;
    QNFE_EmiteItDESC_UNIDADE: TStringField;
    QNFE_EmiteItIND_TIPO_PRODUTO: TStringField;
    QNFE_EmiteItNUM_EMBALAGEM: TFloatField;
    QNFE_EmiteItPERC_ISS: TFloatField;
    QNFE_EmiteItDESC_CLASS_FISCAL: TStringField;
    QNFE_EmiteItQT_QUANTIDADE: TFloatField;
    QNFE_EmiteItNUM_NOTA_PRODUTOR: TIntegerField;
    QNFE_EmiteItVAL_UNITARIO: TFloatField;
    QNFE_EmiteItVAL_TOTAL: TFloatField;
    QNFE_EmiteItVAL_IPI: TFloatField;
    QNFE_EmiteItVAL_ISS: TFloatField;
    QNFE_EmiteItVAL_INSS: TFloatField;
    QNFE_EmiteItPERC_ALIQUOTA: TFloatField;
    QNFE_EmiteItNUM_CLASSIFICACAO: TStringField;
    QNFE_EmiteItDESC_SITUACAO_TRIB: TStringField;
    QNFE_EmiteItDESC_OBSERVACAO_TR: TStringField;
    QNFE_EmiteItCOD_LOTE_TIPO: TIntegerField;
    QNFE_EmiteItDESC_LOTE: TStringField;
    QNFE_EmiteItDESC_GERMINACAO: TStringField;
    QNFE_EmiteItDESC_PUREZA: TStringField;
    QNFE_EmiteItDESC_ATESTADO: TStringField;
    QNFE_EmiteItDESC_VALIDADE: TStringField;
    QNFE_EmiteItDESC_PENEIRA: TStringField;
    QNFE_EmiteItDESC_OBSERVACAO: TStringField;
    QNFE_EmiteItIND_IMPRIME_NF: TStringField;
    QBaixasPed: TOracleDataSet1;
    QBaixasPedNUM_PEDIDO: TIntegerField;
    QBaixasPedDT_EMISSAO: TDateTimeField;
    QBaixasPedCOD_PEDIDO_ITEM: TIntegerField;
    QBaixasPedQT_PEDIDO: TFloatField;
    QBaixasPedQT_ATENDIDO: TFloatField;
    QBaixasPedVAL_UNITARIO: TFloatField;
    QBaixasPedQT_BAIXA: TFloatField;
    QCaixa: TOracleDataSet1;
    QNotaSaidaCons: TOracleDataSet1;
    QNotaSaidaConsCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaConsNOME: TStringField;
    QNotaSaidaConsDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaConsCOD_SERIE: TStringField;
    QAtzNota: TOracleDataSet1;
    QAtzNotaIND_SITUACAO: TStringField;
    QAtzNotaCOD_MOTIVO_CANC: TIntegerField;
    QAtzNotaCOD_CONTRATO_VEND: TIntegerField;
    QContaReceber: TOracleDataSet1;
    QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCOD_FINALIDADE: TIntegerField;
    QContaReceberCOD_BANCO_AGENCIA: TIntegerField;
    QContaReceberCOD_FILIAL: TIntegerField;
    QContaReceberNUM_PARCELA: TIntegerField;
    QContaReceberDESC_TIPO_DOCUMENTO: TStringField;
    QContaReceberDT_MOVIMENTO: TDateTimeField;
    QContaReceberDT_BAIXA: TDateTimeField;
    QContaReceberDT_VENCIMENTO: TDateTimeField;
    QContaReceberDT_EMISSAO: TDateTimeField;
    QContaReceberDT_CAPITALIZACAO: TDateTimeField;
    QContaReceberVAL_TITULO: TFloatField;
    QContaReceberVAL_NEGOCIO: TFloatField;
    QContaReceberIND_ACEITE: TStringField;
    QContaReceberIND_SITUACAO: TStringField;
    QContaReceberDESC_OBSERVACAO: TStringField;
    QContaReceberCOD_NOTA_CAB: TIntegerField;
    QContaReceberCOD_CADASTRO: TIntegerField;
    QContaReceberVAL_ORIGINAL: TFloatField;
    QContaReceberCOD_NOSSO_NUMERO: TStringField;
    QContaReceberVAL_JUROS: TFloatField;
    QContaReceberCOD_DEPARTAMENTO: TIntegerField;
    QContaReceberCOD_CONTRATO_VEND: TIntegerField;
    QContaReceberDESC_AVALISTA1: TStringField;
    QContaReceberDESC_AVALISTA2: TStringField;
    QContaReceberCOD_VENDEDOR: TIntegerField;
    QContaReceberPERC_COMISSAO: TFloatField;
    QContaReceberDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContaReceberVAL_PROMISSORIA: TFloatField;
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
    QNotaNome: TOracleDataSet1;
    QNotaNomeCOD_NOTA_CAB: TIntegerField;
    QNotaNomeDESC_ENDERECO: TStringField;
    QNotaNomeDESC_CGC_CPF: TStringField;
    QNotaNomeDESC_INSCRICAO: TStringField;
    QAtuComissao: TOracleDataSet1;
    QAtuComissaoCOD_VENDEDOR: TIntegerField;
    QAtuComissaoIND_ENTRADA_SAIDA: TStringField;
    QAtuComissaoIND_CONDICAO_PAGTO: TStringField;
    QAtuComissaoCOD_NOTA_ITEM: TIntegerField;
    QAtuComissaoPERC_COMISSAO: TFloatField;
    QAtuComissaoVAL_TOTAL: TFloatField;
    QAtuComissaoCOD_PRODUTO: TFloatField;
    QAtuComissaoIND_VENDAS: TStringField;
    QLiberaSeguro: TOracleDataSet1;
    QLiberaSeguroNOME: TStringField;
    QLiberaSeguroCOD_ESTADO: TStringField;
    QLiberaSeguroNUM_NOTA: TIntegerField;
    QLiberaSeguroCOD_NOTA_CAB: TIntegerField;
    QLiberaSeguroCOD_CADASTRO: TIntegerField;
    QLiberaSeguroDT_EMISSAO: TDateTimeField;
    QLiberaSeguroIND_NOTA_SEGURO: TStringField;
    QDesdobramento_ClasparCons: TOracleDataSet1;
    QDesdobramento_ClasparConsCOD_DESDOBRAMENTO_CLASPAR: TIntegerField;
    QDesdobramento_ClasparConsCOD_NOTA_ITEM: TIntegerField;
    QDesdobramento_ClasparConsNUM_DESDOBRAMENTO: TIntegerField;
    QDesdobramento_ClasparConsIND_SITUACAO: TStringField;
    QDesdobramento_ClasparConsDT_DESDOBRAMENTO: TDateTimeField;
    QDesdobramento_ClasparConsNUM_NOTA: TIntegerField;
    QDesdobramento_ClasparConsCOD_CADASTRO: TIntegerField;
    QDesdobramento_ClasparConsCOD_PRODUTO: TFloatField;
    QDesdobramento_ClasparConsCOD_LOTE_TIPO: TIntegerField;
    QDesdobramento_Claspar: TOracleDataSet1;
    QDesdobramento_ClasparCOD_DESDOBRAMENTO_CLASPAR: TIntegerField;
    QDesdobramento_ClasparCOD_NOTA_ITEM: TIntegerField;
    QDesdobramento_ClasparNUM_DESDOBRAMENTO: TIntegerField;
    QDesdobramento_ClasparDT_DESDOBRAMENTO: TDateTimeField;
    QDesdobramento_ClasparIND_SITUACAO: TStringField;
    QSomaItemNota: TOracleDataSet1;
    QSomaItemNotaCOD_NOTA_CAB: TIntegerField;
    QSomaItemNotaSVAL_IPI: TFloatField;
    QSomaItemNotaSVAL_TOTAL: TFloatField;
    QSomaItemNotaSVAL_DESCONTO: TFloatField;
    QSomaItemNotaSVAL_FRETE: TFloatField;
    QSomaItemNotaSVAL_ICM_BASE: TFloatField;
    QSomaItemNotaSVAL_ICM_BASE_ISENTO: TFloatField;
    QSomaItemNotaSVAL_ICM: TFloatField;
    QSomaItemNotaSVAL_INSS: TFloatField;
    QSomaItemNotasval_total_nota: TFloatField;
    QBancoMov: TOracleDataSet1;
    QBancoMovCOD_BCO_MOVIMENTO: TIntegerField;
    QBancoMovCOD_USUARIO: TIntegerField;
    QBancoMovCOD_HISTORICO: TIntegerField;
    QBancoMovCOD_CONTA_CORRENTE: TIntegerField;
    QBancoMovNUM_CHEQUE: TIntegerField;
    QBancoMovDT_MOVIMENTO: TDateTimeField;
    QBancoMovVAL_MOVIMENTO: TFloatField;
    QBancoMovDESC_OBSERVACAO: TStringField;
    QBancoMovDESC_COMPLEMENTO1: TStringField;
    QBancoMovDESC_COMPLEMENTO2: TStringField;
    QBancoMovCOD_NOTA_CAB: TIntegerField;
    QBancoMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QBancoMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QBancoMovDT_USUARIO: TDateTimeField;
    QAtuBaixaPed: TOracleDataSet1;
    QAtuBaixaPedCOD_PEDIDO_ITEM: TIntegerField;
    QAtuBaixaPedCOD_NOTA_ITEM: TIntegerField;
    QAtuBaixaPedQT_BAIXA: TFloatField;
    QAtzItemPedido: TOracleDataSet1;
    QContaReceberMov: TOracleDataSet1;
    QBaixaAux: TOracleDataSet1;
    QSomaContaCorrente: TOracleDataSet1;
    QBaixaAuxCOD_NOTA_ITEM: TIntegerField;
    QBaixaAuxCOD_NOTA_AUX: TIntegerField;
    QSomaContaCorrenteSQT_QUANTIDADE: TFloatField;
    QSomaContaCorrentePERC_IPI: TFloatField;
    QSomaContaCorrenteCOD_CADASTRO: TIntegerField;
    QSomaContaCorrenteCOD_PRODUTO: TFloatField;
    QNFAuxAberto: TOracleDataSet1;
    QNFAuxAbertoCOD_NOTA_AUX: TIntegerField;
    QNFAuxAbertoCOD_NOTA_CAB: TIntegerField;
    QNFAuxAbertoNUM_NOTA: TIntegerField;
    QNFAuxAbertoDT_EMISSAO: TDateTimeField;
    QNFAuxAbertoCOD_SERIE: TStringField;
    QNFAuxAbertoCOD_FILIAL: TIntegerField;
    QNFAuxAbertoCOD_CADASTRO: TIntegerField;
    QNFAuxAbertoCOD_PRODUTO: TFloatField;
    QNFAuxAbertoCOD_LOTE_TIPO: TIntegerField;
    QSomaClaspar: TOracleDataSet1;
    QSomaClasparSQT_SAIDA: TFloatField;
    QVoltaReceita: TOracleDataSet1;
    QEstoqueBaixa: TOracleDataSet1;
    QGuiaAplicacao: TOracleDataSet1;
    QGuiaAplicacaoCOD_CADASTRO: TIntegerField;
    QGuiaAplicacaoCOD_PRODUTO: TFloatField;
    QGuiaAplicacaoCOD_FILIAL: TIntegerField;
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
    QContaPagarMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaPagarMovCOD_CAIXA_MOV: TIntegerField;
    QContaPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberMovDT_MOVIMENTO: TDateTimeField;
    QContaReceberMovVAL_MOVIMENTO: TFloatField;
    QContaReceberMovDESC_OBSERVACAO: TStringField;
    QContaReceberMovCOD_USUARIO: TIntegerField;
    QContaReceberMovDT_USUARIO: TDateTimeField;
    QContaReceberMovIND_TIPO_MOVIMENTO: TStringField;
    QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QEstoqueBaixaCOD_LOTE_TIPO: TIntegerField;
    QEstoqueBaixaCOD_PRODUTO: TFloatField;
    QEstoqueBaixaCOD_PRODUTO_BAIXA: TIntegerField;
    QEstoqueBaixaQT_BAIXA: TFloatField;
    QEstoqueBaixaCOD_LOTE_TIPO_BAIXA: TIntegerField;
    QNFE_Emitecidade_transp: TStringField;
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
    QrAchaNrPedido: TOracleDataSet1;
    QrAchaNrPedidoNUM_PEDIDO: TIntegerField;
    QNotaSaidaConsCOD_FILIAL: TIntegerField;
    QNotaSaidaNUM_OS: TIntegerField;
    QCancelaDesdobramento: TOracleDataSet1;
    QVoltaReceitaCOD_AGRONOMO: TIntegerField;
    QVoltaReceitaCOD_CULTURA: TIntegerField;
    QVoltaReceitaQT_PRODUTO: TFloatField;
    QVoltaReceitaCOD_NOTA_ITEM: TIntegerField;
    QVoltaReceitaNUM_RECEITA: TIntegerField;
    QVoltaReceitaDT_EMISSAO: TDateTimeField;
    QVoltaReceitaDESC_LOCAL_APLICACAO: TStringField;
    QVoltaReceitaCOD_PRAGA_PRODUTO: TIntegerField;
    QNotaSaidaCOD_DEPARTAMENTO: TIntegerField;
    QContaPagarDESC_OBSERVACAO: TStringField;
    QContaPagarCOD_CONHECIMENTO_FRETE: TIntegerField;
    QNotaSaidaVAL_PEDAGIO: TFloatField;
    QNotaSaidaCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QNFE_EmiteItIND_TIPO_CONSUMO: TStringField;
    QNotaSaidaNR_DIAS_CHEQUE3: TIntegerField;
    QNFE_EmiteNR_DIAS_CHEQUE3: TIntegerField;
    QNotaSaidaVAL_FRETE_TON: TFloatField;
    QNFE_EmiteBAIRRO_FILIAL: TStringField;
    QAtuDtFatura_Ped: TOracleDataSet1;
    QAtuDtFatura_PedDT_FATURAMENTO: TDateTimeField;
    QNFE_EmiteDESC_OBS_CORPO_NOTA: TStringField;
    QNotaSaidaConsCOD_TRANSPORTADOR: TIntegerField;
    QNFE_EmiteItIND_TIPO_EMBALAGEM: TStringField;
    QNFE_EmiteItNUM_VOLUMES: TFloatField;
    QNotaSaidaConsCOD_CADASTRO: TIntegerField;
    QNotaSaidaCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNFE_EmiteIND_FUTURA_CLIENTE: TStringField;
    QSomaContaCorrenteCOD_TRIBUTACAO: TIntegerField;
    QNFE_EmiteDESC_DESTRITO: TStringField;
    QNotaSaidaNUM_PEDIDO: TIntegerField;
    QLiberaSeguroIND_ENTRADA_SAIDA: TStringField;
    QNFE_EmiteNAT_INTERESTADUAL_NOVO: TIntegerField;
    QNFE_EmiteNAT_ESTADUAL_NOVO: TIntegerField;
    QNFE_Emitenum_cfop: TIntegerField;
    QNotaSaidaConsIND_SITUACAO: TStringField;
    QItemNFQT_CHEGADA: TFloatField;
    QNFE_EmiteVAL_AVISTA: TFloatField;
    QNotaSaidaCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNotaSaidaConsCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
    QNFE_EmiteDESC_ENDERECO_ENTREGA: TStringField;
    QNFE_EmiteDESC_CIDADE_ENTREGA: TStringField;
    QNFE_EmiteItPERC_IPI: TFloatField;
    QNFE_EmiteIND_OBS_FRETE_SEGURO: TStringField;
    QNFE_EmiteItVAL_PRECO_FRETE: TFloatField;
    QNFE_EmiteItNUM_FABRICANTE: TStringField;
    QNFE_EmiteDESC_RESUMO: TStringField;
    QNFE_EmiteItDESC_COMPLEMENTO: TStringField;
    QSomaContaCorrenteCOD_NOTA_CAB: TIntegerField;
    QSomaItemNotaSVAL_PIS: TFloatField;
    QSomaItemNotaSVAL_COFINS: TFloatField;
    QItemNFPERC_DESC: TFloatField;
    QNFE_EmiteItPERC_DESC: TFloatField;
    QNotaSaidaNR_DIAS_CHEQUE4: TIntegerField;
    QNFE_EmiteNR_DIAS_CHEQUE4: TIntegerField;
    QSomaContaCorrenteVAL_AVISTA: TFloatField;
    QSomaContaCorrenteSVAL_TOTAL: TFloatField;
    QNFE_EmiteIND_REGIME_ESPECIAL: TStringField;
    QItemNFVAL_BASE_SUBST: TFloatField;
    QItemNFVAL_ICMS_SUBST: TFloatField;
    QSomaItemNotaSVAL_BASE_SUBST: TFloatField;
    QSomaItemNotaSVAL_ICMS_SUBST: TFloatField;
    QNFE_EmiteDESC_INSCRICAO_SUBST: TStringField;
    QSomaItemNotaSQT_TOTAL: TFloatField;
    QNFE_EmiteItDT_VENCTO_LOTE: TDateTimeField;
    QNFE_EmiteItCOD_PRODUTO: TFloatField;
    QNFE_EmiteItDESC_PRODUTO: TStringField;
    QNotaSaidaCOD_MOTORISTA: TIntegerField;
    QNFE_EmiteCOD_MOTORISTA: TIntegerField;
    QSomaContaCorrenteDESC_PRODUTO: TStringField;
    QContaReceberCOD_CONTA_CORRENTE: TIntegerField;
    QNFE_EmiteItVAL_DESCONTO: TFloatField;
    QNFE_EmiteIND_IMPRIME_FRETE: TStringField;
    QNFE_EmiteIND_TROCA: TStringField;
    QNFE_EmiteIND_BRINDE: TStringField;
    QNFE_EmiteIND_BONIFICACAO: TStringField;
    QImagemProduto: TOracleDataSet1;
    QImagemProdutoIMG_IMAGEM: TBlobField;
    QNotaSaidaConsVAL_DESCONTO: TFloatField;
    QNotaSaidaCOD_PRAZO_VENCIMENTO: TIntegerField;
    QItemNFVAL_UNITARIO_TABELA: TFloatField;
    QLiberaSeguroPERC_FRETE: TFloatField;
    QLiberaSeguroT1VAL_TOTALTB_ESTADOPERC_F: TFloatField;
    QNotaProduto: TOracleDataSet1;
    QNotaProdutoCOD_NOTA_ITEM: TIntegerField;
    QNotaProdutoDESC_PRODUTO: TStringField;
    QNFE_EmiteItCOD_NOTA_ITEM: TIntegerField;
    QItemNFCOD_CULTURA: TIntegerField;
    QItemNfConsCOD_CULTURA: TIntegerField;
    QNFE_EmiteItDESC_TIPO_SEMENTE: TStringField;
    QNFE_EmiteItDESC_FORMULACAO: TStringField;
    QNFE_EmiteItDESC_GRUPO_QUIMICO: TStringField;
    QNotaSaidaIND_IMPRIME_CAB: TStringField;
    QNFE_EmiteIND_IMPRIME_CAB: TStringField;
    QNotaSaidaVAL_IMPOSTO: TFloatField;
    QNFE_EmiteVAL_IMPOSTO: TFloatField;
    QNotaImpostoServico: TOracleDataSet1;
    QNotaImpostoServicoCOD_NOTA_IMPOSTO_SERVICO: TIntegerField;
    QNotaImpostoServicoCOD_NOTA_CAB: TIntegerField;
    QNotaImpostoServicoCOD_IMPOSTO: TIntegerField;
    QNotaImpostoServicoDT_VENCIMENTO: TDateTimeField;
    QNotaImpostoServicodesc_imposto: TStringField;
    QNotaNomeDESC_CIDADE: TStringField;
    QNotaNomeDESC_ESTADO: TStringField;
    QNotaNomeDESC_CEP: TStringField;
    QNFE_EmiteItVAL_DPI_TRANSGENICOS: TFloatField;
    QNFE_EmiteItIND_CESTA_BASICA: TStringField;
    QNFE_EmiteItNUM_ROMANEIO: TIntegerField;
    QNFE_EmiteItPERC_PH: TFloatField;
    QNFE_EmiteItNUM_NOTA_PRODUTOR_ROM: TIntegerField;
    QNotaSaidaNUM_DESPACHO_EXPORTACAO: TFloatField;
    QNotaSaidaDESC_MEMORANDO_EXPORTACAO: TStringField;
    QNFE_EmiteVAL_DESCONTO_FITAS: TFloatField;
    QNFE_EmiteItCOD_MENSAGEM: TIntegerField;
    QNFE_EmiteItCOD_NBM_SH: TStringField;
    QNotaSaidaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QNotaSaidaDESC_OBS_DEVOLUCAO: TStringField;
    QNotaSaidaNUM_DIAS_CARENCIA: TIntegerField;
    QNotaSaidaCOD_CULTURA: TIntegerField;
    QNotaSaidaCOD_CONTRATO_PJURIDICA: TIntegerField;
    QNotaSaidaIND_IMPRIME_FRETE: TStringField;
    QNotaSaidaVAL_DESCONTO_FITAS: TFloatField;
    QNotaSaidaNUM_DCO: TStringField;
    QNFE_EmiteItVAL_FACS: TFloatField;
    QNFE_EmiteItVAL_FETHAB: TFloatField;
    QNotaSaidaCOD_CADASTRO_CLASSIFICACAO: TIntegerField;
    QNFE_Emite_Cfop: TOracleDataSet1;
    QNFE_Emite_CfopCFOP: TFloatField;
    QNFE_EmiteIND_FUNRURAL: TStringField;
    QNFE_EmitePERC_FUNRURAL: TFloatField;
    QCopiaNota: TOracleDataSet1;
    QCopiaNotaCOD_NOTA_CAB: TIntegerField;
    QCopiaNotaNUM_NOTA: TIntegerField;
    QNFE_EmiteNOME_VENDEDOR: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO1: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO2: TStringField;
    QNFE_EmiteCELULAR_VENDEDOR: TStringField;
    QAtzNotaVAL_DESCONTO: TFloatField;
    QItemNfConsDESC_PRODUTO: TStringField;
    QNFE_EmiteItNUM_METROS_CUBICOS: TFloatField;
    QNotaSaidaCOD_NOTA_CAB_TRANS_ENT: TIntegerField;
    QNFE_EmiteItPERC_TRIBUTADO_NOTA: TFloatField;
    QItemNFIND_TIPO_CONSUMO: TStringField;
    QItemNFVAL_DPI_TRANSGENICOS: TFloatField;
    QItemNFQT_CREDITO_TRANSGENICOS: TFloatField;
    QItemNFCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QItemNFVAL_FACS: TFloatField;
    QItemNFVAL_FETHAB: TFloatField;
    QItemNFIND_CUSTO: TIntegerField;
    QItemNFDESC_RENDA: TStringField;
    QItemNFNUM_VOLUMES: TIntegerField;
    QItemNFNUM_CABECAS: TIntegerField;
    QNFE_EmiteItNUM_VOLUMES_NOTA: TIntegerField;
    QNFE_EmiteItNUM_CABECAS: TIntegerField;
    QNotaSaidaConsCOD_ESTADO: TStringField;
    QNotaSaidaConsIND_ENTRADA_SAIDA: TStringField;
    QNotaSaidaConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNotaSaidaConsDESC_PLACA: TStringField;
    QItemNfConsIND_TIPO_CONSUMO: TStringField;
    QItemNfConsQT_CHEGADA: TFloatField;
    QItemNfConsVAL_PIS: TFloatField;
    QItemNfConsVAL_CONFINS: TFloatField;
    QItemNfConsPERC_DESC: TFloatField;
    QItemNfConsVAL_BASE_SUBST: TFloatField;
    QItemNfConsVAL_ICMS_SUBST: TFloatField;
    QItemNfConsVAL_UNITARIO_TABELA: TFloatField;
    QItemNfConsVAL_DPI_TRANSGENICOS: TFloatField;
    QItemNfConsQT_CREDITO_TRANSGENICOS: TFloatField;
    QItemNfConsCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QItemNfConsIND_TIPO_PRODUTO: TStringField;
    QNFE_EmiteNUM_PEDIDO: TIntegerField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QNotaSaidaConsIND_VENDAS: TStringField;
    QNotaSaidaConsDT_EMISSAO: TDateTimeField;
    QNFE_EmiteCOD_CADASTRO_PARCEIRO: TIntegerField;
    QNFE_EmiteCOD_CADASTRO_FILIAL: TIntegerField;
    QNFE_EmiteDESC_CELULAR: TStringField;
    QNotaSaidaCOD_FLUXO_TREM: TIntegerField;
    QNFE_EmiteDESC_INSCRICAO_MUNICIPAL: TStringField;
    QNFE_EmiteCOD_UF_IBGE: TIntegerField;
    QNFE_EmiteCOD_SERIE: TStringField;
    QNFE_EmiteNUM_ENDERECO_FILIAL: TIntegerField;
    QNFE_EmiteCOMPLEMENTO_FILIAL: TStringField;
    QNFE_EmiteItVAL_ICM_BASE: TFloatField;
    QNFE_EmiteItVAL_ICM: TFloatField;
    QNFE_EmiteIND_FISICA_JURIDICA: TStringField;
    QLoteProduto: TOracleDataSet1;
    QLoteProdutoCOD_CADASTRO: TIntegerField;
    QLoteProdutoNOME: TStringField;
    QLoteProdutoNUM_CGC_CPF: TStringField;
    QLoteProdutoDESC_ENDERECO: TStringField;
    QLoteProdutoDESC_CIDADE: TStringField;
    QLoteProdutoNUM_CAIXA_POSTAL: TIntegerField;
    QLoteProdutoDESC_SIGLA_ESTADO: TStringField;
    QNotaSaidaDESC_MARCA: TStringField;
    QNotaSaidaDESC_ESPECIE: TStringField;
    QNFE_EmiteDESC_MARCA: TStringField;
    QNFE_EmiteDESC_ESPECIE: TStringField;
    QNFE_EmiteItVAL_FRETE: TFloatField;
    QNFE_EmiteItPERC_COFINS: TFloatField;
    QNFE_EmiteItVAL_CONFINS: TFloatField;
    QNFE_EmiteItPERC_PIS: TFloatField;
    QNFE_EmiteItVAL_PIS: TFloatField;
    QNFE_EmiteIND_FINALIDADE_NFE: TIntegerField;
    QNFE_EmiteDESC_PAIS: TStringField;
    QSomaItemNotaSVAL_TOTAL_SERVICOS: TFloatField;
    QSomaItemNotaSVAL_ISS: TFloatField;
    QLoteProdutoDESC_RENASEN: TStringField;
    QNFE_EmiteCOD_UF_IBGE_FILIAL: TIntegerField;
    QNFE_EmiteCOD_CIDADE_IBGE_FILIAL: TStringField;
    QNFE_EmiteCOD_CIDADE_IBGE: TStringField;
    QNFE_EmiteCOD_PAIS_IBGE: TIntegerField;
    QItemNFCOD_NOTA_ITEM_ORIGEM: TIntegerField;
    QNFE_EmiteDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaIND_TIPO_NOTA: TStringField;
    QNFE_EmiteItCOD_LISTA_SERVICO: TIntegerField;
    QRPedidoEspelho: TOracleDataSet1;
    QRPedidoEspelhoCOD_OPERACAO: TIntegerField;
    QRPedidoEspelhoNAT_OPERACAO: TStringField;
    QRPedidoEspelhoDESC_RESUMO: TStringField;
    QRPedidoEspelhoNAT_INTERESTADUAL: TIntegerField;
    QRPedidoEspelhoNAT_ESTADUAL: TIntegerField;
    QRPedidoEspelhoNAT_INTERESTADUAL_NOVO: TIntegerField;
    QRPedidoEspelhoNAT_ESTADUAL_NOVO: TIntegerField;
    QRPedidoEspelhoIND_VENDAS: TStringField;
    QRPedidoEspelhoIND_FUTURA_CLIENTE: TStringField;
    QRPedidoEspelhoIND_OBS_FRETE_SEGURO: TStringField;
    QRPedidoEspelhoIND_FIXAR_EMPRESA: TStringField;
    QRPedidoEspelhoIND_TROCA: TStringField;
    QRPedidoEspelhoIND_BRINDE: TStringField;
    QRPedidoEspelhoIND_FUNRURAL: TStringField;
    QRPedidoEspelhoIND_BONIFICACAO: TStringField;
    QRPedidoEspelhoIND_FINALIDADE_NFE: TIntegerField;
    QRPedidoEspelhoCOD_FILIAL: TIntegerField;
    QRPedidoEspelhoNOME_FILIAL: TStringField;
    QRPedidoEspelhoEND_FILIAL: TStringField;
    QRPedidoEspelhoCIDADE_FILIAL: TStringField;
    QRPedidoEspelhoTELEFONE_FILIAL: TStringField;
    QRPedidoEspelhoCEP_FILIAL: TStringField;
    QRPedidoEspelhoUF_FILIAL: TStringField;
    QRPedidoEspelhoCGC_FILIAL: TStringField;
    QRPedidoEspelhoINSCRICAO_FILIAL: TStringField;
    QRPedidoEspelhoCXPOSTAL_FILIAL: TIntegerField;
    QRPedidoEspelhoBAIRRO_FILIAL: TStringField;
    QRPedidoEspelhoDESC_FAX: TStringField;
    QRPedidoEspelhoDESC_E_MAIL: TStringField;
    QRPedidoEspelhoCOD_CADASTRO_FILIAL: TIntegerField;
    QRPedidoEspelhoNUM_ENDERECO_FILIAL: TIntegerField;
    QRPedidoEspelhoCOMPLEMENTO_FILIAL: TStringField;
    QRPedidoEspelhoDESC_INSCRICAO_SUBST: TStringField;
    QRPedidoEspelhoCOD_NOTA_CAB: TIntegerField;
    QRPedidoEspelhoCOD_CADASTRO: TIntegerField;
    QRPedidoEspelhoCOD_VENDEDOR: TIntegerField;
    QRPedidoEspelhoVAL_FRETE: TFloatField;
    QRPedidoEspelhoVAL_DESCONTO: TFloatField;
    QRPedidoEspelhoVAL_FUNRURAL: TFloatField;
    QRPedidoEspelhoIND_TIPO_FRETE: TStringField;
    QRPedidoEspelhoIND_ENTRADA_SAIDA: TStringField;
    QRPedidoEspelhoIND_SITUACAO: TStringField;
    QRPedidoEspelhoIND_CONDICAO_PAGTO: TStringField;
    QRPedidoEspelhoNUM_NOTA: TIntegerField;
    QRPedidoEspelhoDT_EMISSAO: TDateTimeField;
    QRPedidoEspelhoDT_RECEBIMENTO: TDateTimeField;
    QRPedidoEspelhoUF_NOTA: TStringField;
    QRPedidoEspelhoVAL_DESPESAS: TFloatField;
    QRPedidoEspelhoCOD_TRANSPORTADOR: TIntegerField;
    QRPedidoEspelhoCOD_MENSAGEM: TIntegerField;
    QRPedidoEspelhoDESC_PLACA: TStringField;
    QRPedidoEspelhoNUM_VOLUMES: TIntegerField;
    QRPedidoEspelhoOBS: TStringField;
    QRPedidoEspelhoOBS_COMPLEMENTO: TStringField;
    QRPedidoEspelhoDESC_TRANSPORTADORA: TStringField;
    QRPedidoEspelhoNR_DIAS_CHEQUE: TIntegerField;
    QRPedidoEspelhoNR_DIAS_CHEQUE1: TIntegerField;
    QRPedidoEspelhoNR_DIAS_CHEQUE2: TIntegerField;
    QRPedidoEspelhoNR_DIAS_CHEQUE3: TIntegerField;
    QRPedidoEspelhoNR_DIAS_CHEQUE4: TIntegerField;
    QRPedidoEspelhoDESC_OBS_CORPO_NOTA: TStringField;
    QRPedidoEspelhoVAL_AVISTA: TFloatField;
    QRPedidoEspelhoCOD_MOTORISTA: TIntegerField;
    QRPedidoEspelhoIND_IMPRIME_FRETE: TStringField;
    QRPedidoEspelhoVAL_IMPOSTO: TFloatField;
    QRPedidoEspelhoVAL_DESCONTO_FITAS: TFloatField;
    QRPedidoEspelhoNUM_PEDIDO: TIntegerField;
    QRPedidoEspelhoIND_IMPRIME_CAB: TStringField;
    QRPedidoEspelhoCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRPedidoEspelhoCOD_SERIE: TStringField;
    QRPedidoEspelhoDESC_MARCA: TStringField;
    QRPedidoEspelhoDESC_ESPECIE: TStringField;
    QRPedidoEspelhoDESC_CHAVE_ACESSO: TStringField;
    QRPedidoEspelhoNOME: TStringField;
    QRPedidoEspelhoDESC_ENDERECO: TStringField;
    QRPedidoEspelhoNUM_INSCRICAO: TStringField;
    QRPedidoEspelhoDESC_BAIRRO: TStringField;
    QRPedidoEspelhoCOD_ESTADO: TStringField;
    QRPedidoEspelhoNUM_CGC_CPF: TStringField;
    QRPedidoEspelhoDESC_CIDADE: TStringField;
    QRPedidoEspelhoDESC_DESTRITO: TStringField;
    QRPedidoEspelhoDESC_TELEFONE: TStringField;
    QRPedidoEspelhoDESC_CELULAR: TStringField;
    QRPedidoEspelhoDESC_FANTASIA: TStringField;
    QRPedidoEspelhoIND_FISICA_JURIDICA: TStringField;
    QRPedidoEspelhoDESC_CEP: TStringField;
    QRPedidoEspelhoDESC_ENDERECO_ENTREGA: TStringField;
    QRPedidoEspelhoDESC_CIDADE_ENTREGA: TStringField;
    QRPedidoEspelhoIND_REGIME_ESPECIAL: TStringField;
    QRPedidoEspelhoPERC_FUNRURAL: TFloatField;
    QRPedidoEspelhoDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRPedidoEspelhoNOME_VENDEDOR: TStringField;
    QRPedidoEspelhoCELULAR_VENDEDOR: TStringField;
    QRPedidoEspelhoDESC_MENSAGEM: TStringField;
    QRPedidoEspelhoDESC_COMPLEMENTO: TStringField;
    QRPedidoEspelhoDESC_COMPLEMENTO1: TStringField;
    QRPedidoEspelhoDESC_COMPLEMENTO2: TStringField;
    QRPedidoEspelhoCOD_UF_IBGE_FILIAL: TIntegerField;
    QRPedidoEspelhoCOD_UF_IBGE: TIntegerField;
    QRPedidoEspelhoCOD_CIDADE_IBGE_FILIAL: TStringField;
    QRPedidoEspelhoCOD_CIDADE_IBGE: TStringField;
    QRPedidoEspelhoDESC_PAIS: TStringField;
    QRPedidoEspelhoCOD_PAIS_IBGE: TIntegerField;
    QRPedidoEspelhoCOD_PRODUTO: TFloatField;
    QRPedidoEspelhoQT_QUANTIDADE: TFloatField;
    QRPedidoEspelhoVAL_UNITARIO: TFloatField;
    QRPedidoEspelhoVAL_TOTAL: TFloatField;
    QRPedidoEspelhoCOD_LOTE_TIPO: TIntegerField;
    QRPedidoEspelhoPERC_DESC: TFloatField;
    QRPedidoEspelhoDESC_PRODUTO: TStringField;
    QRPedidoEspelhoDESC_UNIDADE: TStringField;
    QNotaGNRE: TOracleDataSet1;
    QNFE_EmiteIND_CONTINGENCIA: TStringField;
    QNotaGNRECOD_NOTA_GNRE: TIntegerField;
    QNotaGNRECOD_NOTA_CAB: TIntegerField;
    QNotaGNREIND_DOCUMENTO_ARRECADACAO: TStringField;
    QNotaGNRECOD_UF: TStringField;
    QNotaGNRENUM_DOCUMENTO_ARRECADACAO: TStringField;
    QNotaGNRECOD_AUTENTICACAO: TStringField;
    QNotaGNREVAL_DOCUMENTO_ARRECADACAO: TFloatField;
    QNotaGNREDT_VCTO: TDateTimeField;
    QNotaGNREDT_PGTO: TDateTimeField;
    QNotaGNREdesc_sigla_estado: TStringField;
    QNotaSaidaIND_CONTINGENCIA: TStringField;
    QNFE_EmiteItCOD_GENERO_PRODUTO: TIntegerField;
    QNFE_EmiteItCOD_EX_TIPI: TStringField;
    QNFE_EmiteItNUM_GENERO_NCM: TStringField;
    QNFE_EmiteCOD_NOTA_CAB_DEV_FIXAR: TIntegerField;
    QNFE_EmiteItCOD_TRIBUTACAO: TIntegerField;
    QCopiaNotaIND_ENTRADA_SAIDA: TStringField;
    QNFE_EmiteNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaSaidaIND_TIPO_CONHECIMENTO: TStringField;
    QNotaExpTipoDoc: TOracleDataSet1;
    QNotaExpTipoDocCOD_NOTA_CAB_EXPORTACAO_TP_DOC: TIntegerField;
    QNotaExpTipoDocCOD_NOTA_CAB: TIntegerField;
    QNotaExpTipoDocIND_TIPO_DOCUMENTO: TStringField;
    QNotaExpTipoDocNUM_DECLARACAO: TStringField;
    QNotaExpTipoDocDT_DECLARACAO: TDateTimeField;
    QNotaExpTipoDocDT_AVERBACAO: TDateTimeField;
    QNotaExpConhecimento: TOracleDataSet1;
    QNotaExpConhecimentoCOD_NOTA_CAB_EXPORTACAO_CONHEC: TIntegerField;
    QNotaExpConhecimentoCOD_NOTA_CAB: TIntegerField;
    QNotaExpConhecimentoDT_CONHECIMENTO: TDateTimeField;
    QNotaExpRE: TOracleDataSet1;
    QNotaExpRECOD_NOTA_CAB_EXPORTACAO_RE: TIntegerField;
    QNotaExpRECOD_NOTA_CAB: TIntegerField;
    QNotaExpRENUMERO_RE: TStringField;
    QNotaExpREDT_EMISSAO: TDateTimeField;
    QCaixaCOD_OFICINA_CAB: TIntegerField;
    QContaReceberCOD_OFICINA_CAB: TIntegerField;
    QNFE_EmiteItVAL_BASE_SUBST: TFloatField;
    QNFE_EmiteItVAL_ICMS_SUBST: TFloatField;
    QNotaSaidaCOD_ARMAZEM_ALFANDEGADO: TIntegerField;
    QNFE_EmiteItCOD_CFOP: TIntegerField;
    QItemNFCOD_CFOP: TIntegerField;
    QNFE_EmiteItDESC_COMPL_ITEM: TStringField;
    QItemNFDESC_COMPLEMENTO: TStringField;
    QItemNfConsDESC_COMPLEMENTO: TStringField;
    QSomaItemNotaVAL_BRUTO_SERVICO: TFloatField;
    QSomaItemNotaVAL_BRUTO_PRODUTO: TFloatField;
    QNFE_EmiteItDESC_RENDA: TStringField;
    QNFE_EmiteItNUM_FABRICANTE_ITEM: TStringField;
    QNFE_EmiteDESC_ORGAO_EMISSOR: TStringField;
    QNotaExpConhecimentoNUM_CONHECIMENTO: TStringField;
    QPosVenda: TOracleDataSet1;
    QPosVendaCOD_NOTA_CAB: TIntegerField;
    QPosVendaDT_POS_VENDA: TDateTimeField;
    QPosVendaDESC_NOME: TStringField;
    QPosVendaDESC_POS_VENDA: TStringField;
    QTipoConhecimentoCons: TOracleDataSet1;
    QTipoConhecimentoConsCOD_TIPO_CONHECIMENTO: TIntegerField;
    QTipoConhecimentoConsNUM_TIPO_CONHECIMENTO: TStringField;
    QTipoConhecimentoConsDESC_TIPO_CONHECIMENTO: TStringField;
    QNotaExpConhecimentoCOD_TIPO_CONHECIMENTO: TIntegerField;
    QNFE_EmiteIND_IMPRIME_PEDIDO: TStringField;
    QRPedidoEspelhoVAL_TOTAL_DESC: TFloatField;
    QBaixaAuxQT_QUANTIDADE: TFloatField;
    QNFAuxAbertoQT_SALDO: TFloatField;
    QNotaAuxQT_ATENDIDO: TFloatField;
    QNotaAuxQT_CANCELADO: TFloatField;
    QNotaAuxQT_DEVOLVIDO: TFloatField;
    QNotaAuxQT_NOTA_ITEM: TFloatField;
    QNotaAuxItNFQT_ATENDIDO: TFloatField;
    QNotaAuxItNFQT_CANCELADO: TFloatField;
    QNotaAuxItNFQT_DEVOLVIDO: TFloatField;
    QNotaAuxItNFQT_NOTA_ITEM: TFloatField;
    QNFE_EmiteItCOD_CADASTRO: TIntegerField;
    QNFE_EmiteItDESC_LOCALIZACAO: TStringField;
    QNFE_EmiteItDESC_CLASSE: TStringField;
    QRPedidoEspelhoDESC_COMPLEMENTO_PRODUTO: TStringField;
    QRPedidoEspelhodesc_serie_it: TStringField;
    QRPedidoEspelhodesc_dot_it: TStringField;
    QRPedidoEspelhodesc_servico_it: TStringField;
    QNFE_EmiteItNUM_CERTIFICADO: TFloatField;
    QNFE_EmiteCOD_NOTA_CAB_REF: TIntegerField;
    QNotaSaidaCOD_NOTA_CAB_REF: TIntegerField;
    QNFE_EmiteItIND_RETORNAVEL: TStringField;
    QNFE_Emiteind_estadual: TBooleanField;
    QNFE_EmiteCOD_MOTIVO_CANC: TIntegerField;
    QNFE_EmiteDESC_REPOSITORIO_NFE: TStringField;
    QNFE_EmiteNUM_VIAS_DANFE: TIntegerField;
    QNFE_EmiteIND_VIAS_DANFE: TStringField;
    QNFE_EmiteOBS_COMPLEMENTO: TStringField;
    QTotalNota: TOracleDataSet1;
    QTotalNotaVAL_TOTAL_NOTA: TFloatField;
    QTotalNotaVAL_TOTAL_PRODUTOS: TFloatField;
    QNFE_EmiteVAL_SENAR: TFloatField;
    OPVenda: TOraclePackage;
    QNFE_EmiteDESC_CERTIFICADO: TStringField;
    QNFE_EmiteItNUM_PESO_BRUTO: TFloatField;
    QNFE_EmiteItNUM_PESO_LIQUIDO: TFloatField;
    QNFE_EmiteDESC_LOGOTIPO_DANFE: TStringField;
    QItemNFDESC_INF_ADICIONAL: TStringField;
    QNFE_EmiteItDESC_INF_ADICIONAL: TStringField;
    QNotaSaidadesc_situacao: TStringField;
    QNotaSaidadesc_modelo_serie: TStringField;
    QNotaSaidadesc_situacao_sefaz: TStringField;
    QNFE_EmiteItDESC_MARCA: TStringField;
    QNFE_EmiteDT_USUARIO: TDateTimeField;
    QNotaSaidaCOD_OBRA_REQ_CAB: TIntegerField;
    QNotaSaidaCOD_OBRA: TIntegerField;
    QNotaSaidadesc_servidor_nfe: TStringField;
    QNotaSaidacod_uf_ibge_filial: TIntegerField;
    QNotaSaidaIND_AMBIENTE_NFE: TIntegerField;
    QInfoCadastroPedido: TOracleDataSet1;
    QInfoCadastroPedidoCOD_PEDIDO_CAB: TIntegerField;
    QInfoCadastroPedidoDESC_NOME: TStringField;
    QInfoCadastroPedidoNUM_CGC_CPF: TStringField;
    QInfoCadastroPedidoDESC_FANTASIA: TStringField;
    QInfoCadastroPedidoIND_FISICA_JURIDICA: TStringField;
    QInfoCadastroPedidoNUM_INSCRICAO: TStringField;
    QInfoCadastroPedidoDESC_INTEGRACAO: TStringField;
    QInfoCadastroPedidoDESC_ENDERECO: TStringField;
    QInfoCadastroPedidoDESC_BAIRRO: TStringField;
    QInfoCadastroPedidoCOD_CIDADE: TIntegerField;
    QInfoCadastroPedidoDESC_CEP: TStringField;
    QInfoCadastroPedidoDESC_TELEFONE: TStringField;
    QInfoCadastroPedidoDESC_CELULAR: TStringField;
    QInfoCadastroPedidoDESC_E_MAIL: TStringField;
    QInfoCadastroPedidoIND_SEXO_CATEGORIA: TStringField;
    QInfoCadastroPedidoDESC_BANCO: TStringField;
    QInfoCadastroPedidoDESC_AGENCIA: TStringField;
    QInfoCadastroPedidoDESC_AGENCIA_TELEFONE: TStringField;
    QInfoCadastroPedidoDESC_CIDADE: TStringField;
    QInfoCadastroPedidoCOD_ESTADO: TStringField;
    QInfoCadastroPedidoDT_NASCIMENTO: TDateTimeField;
    QInfoCadastroPedidodesc_fisica_juridica: TStringField;
    QInfoCadastroPedidodesc_sexo: TStringField;
    QInfoCadastroPedidocampo_cpf_cnpj: TStringField;
    QInfoCadastroPedidocampo_inscricao: TStringField;
    QInfoCadastro: TOracleDataSet1;
    QInfoCadastroCOD_CADASTRO: TIntegerField;
    QInfoCadastroNOME: TStringField;
    QInfoCadastroNUM_CGC_CPF: TStringField;
    QInfoCadastroDESC_FANTASIA: TStringField;
    QInfoCadastroIND_FISICA_JURIDICA: TStringField;
    QInfoCadastroNUM_INSCRICAO: TStringField;
    QInfoCadastroDESC_INTEGRACAO: TStringField;
    QInfoCadastroDESC_ENDERECO: TStringField;
    QInfoCadastroDESC_BAIRRO: TStringField;
    QInfoCadastroCOD_CIDADE: TIntegerField;
    QInfoCadastroDESC_CEP: TStringField;
    QInfoCadastroDESC_TELEFONE: TStringField;
    QInfoCadastroDESC_CELULAR: TStringField;
    QInfoCadastroDESC_E_MAIL: TStringField;
    QInfoCadastroIND_SEXO_CATEGORIA: TStringField;
    QInfoCadastroDESC_BANCO: TStringField;
    QInfoCadastroDESC_AGENCIA: TStringField;
    QInfoCadastroDESC_AGENCIA_TELEFONE: TStringField;
    QInfoCadastroDESC_CIDADE: TStringField;
    QInfoCadastroCOD_ESTADO: TStringField;
    QInfoCadastrodesc_fisica_juridica: TStringField;
    QInfoCadastrodesc_sexo: TStringField;
    QInfoCadastrocampo_cpf_cnpj: TStringField;
    QInfoCadastrocampo_inscricao: TStringField;
    QPedidoNota: TOracleDataSet1;
    QComposicao: TOracleDataSet1;
    QComposicaoCOD_PRODUTO: TFloatField;
    QComposicaoCOD_PRODUTO_COMPONENTE: TFloatField;
    QComposicaoQT_QUANTIDADE: TFloatField;
    QComposicaoCOD_LOTE_TIPO: TIntegerField;
    QPedidoNotaBaixar: TOracleDataSet1;
    QPedidoNotaItem: TOracleDataSet1;
    QPedidoNotaItemCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoNotaItemCOD_PRODUTO_ITEM: TFloatField;
    QPedidoNotaItemDESC_PRODUTO_ITEM: TStringField;
    QPedidoNotaItemDESC_UNIDADE_ITEM: TStringField;
    QPedidoNotaItemQT_PEDIDO_ITEM: TFloatField;
    QPedidoNotaItemVAL_UNITARIO_ITEM: TFloatField;
    QPedidoNotaItemVAL_TOTAL_ITEM: TFloatField;
    QPedidoNotaItemCOD_LOTE_TIPO_ITEM: TIntegerField;
    QPedidoNotaItemCOD_TRIBUTACAO_ITEM: TIntegerField;
    QPedidoNotaCOD_PEDIDO_CAB: TIntegerField;
    QPedidoNotaCOD_CADASTRO: TIntegerField;
    QPedidoNotaCOD_APLICACAO: TIntegerField;
    QPedidoNotaDT_EMISSAO: TDateTimeField;
    QPedidoNotaDT_PREVISAO_ENTREGA: TDateTimeField;
    QPedidoNotaQT_QUANTIDADE: TFloatField;
    QPedidoNotaCOD_USUARIO_VENDEDOR: TIntegerField;
    QPedidoNotaCOD_VENDEDOR: TIntegerField;
    QPedidoNotaCOD_FILIAL: TIntegerField;
    QPedidoNotaIND_TIPO_PEDIDO: TStringField;
    QPedidoNotaCOD_PRECO_TAB: TFloatField;
    QPedidoNotaCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoNotaVAL_ITENS: TFloatField;
    QPedidoNotaVAL_JURO: TFloatField;
    QPedidoNotaVAL_TOTAL: TFloatField;
    QPedidoNotaDESC_OBSERVACAO: TStringField;
    QPedidoNotaIND_ACEITO_VENDEDOR: TStringField;
    QPedidoNotaIND_ACEITO_FUNCIONARIO: TStringField;
    QPedidoNotaNUM_PEDIDO: TIntegerField;
    QPedidoNotaDT_ACEITO_VENDEDOR: TDateTimeField;
    QPedidoNotaDT_ACEITO_FUNCIONARIO: TDateTimeField;
    QPedidoNotaDT_CONFIRMACAO: TDateTimeField;
    QPedidoNotaIND_NOVO: TStringField;
    QPedidoNotaDT_CANCELAMENTO: TDateTimeField;
    QPedidoNotaDESC_ETAPA_ATUAL: TStringField;
    QPedidoNotaVAL_ALTURA_BARRACAO: TFloatField;
    QPedidoNotaVAL_LARGURA_BARRACAO: TFloatField;
    QPedidoNotaVAL_ALTURA_FORRACAO: TFloatField;
    QPedidoNotaDT_ENVIO_PRODUCAO: TDateTimeField;
    QPedidoNotaDT_GERACAO_NOTA: TDateTimeField;
    QPedidoNotaIND_SITUACAO: TStringField;
    QPedidoNotaPERC_DESCONTO: TFloatField;
    QPedidoNotaPERC_COMISSAO: TFloatField;
    QPedidoNotaVAL_DESCONTO: TFloatField;
    QPedidoNotaVAL_COMISSAO: TFloatField;
    QPedidoNotaItemIND_PRINCIPAL: TStringField;
    QPedidoNotaBaixarCOD_PEDIDO_CAB: TIntegerField;
    QPedidoNotaBaixarCOD_CADASTRO: TIntegerField;
    QPedidoNotaBaixarCOD_APLICACAO: TIntegerField;
    QPedidoNotaBaixarDT_EMISSAO: TDateTimeField;
    QPedidoNotaBaixarDT_PREVISAO_ENTREGA: TDateTimeField;
    QPedidoNotaBaixarQT_QUANTIDADE: TFloatField;
    QPedidoNotaBaixarCOD_USUARIO_VENDEDOR: TIntegerField;
    QPedidoNotaBaixarCOD_VENDEDOR: TIntegerField;
    QPedidoNotaBaixarCOD_FILIAL: TIntegerField;
    QPedidoNotaBaixarIND_TIPO_PEDIDO: TStringField;
    QPedidoNotaBaixarCOD_PRECO_TAB: TFloatField;
    QPedidoNotaBaixarCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoNotaBaixarVAL_ITENS: TFloatField;
    QPedidoNotaBaixarVAL_JURO: TFloatField;
    QPedidoNotaBaixarVAL_TOTAL: TFloatField;
    QPedidoNotaBaixarDESC_OBSERVACAO: TStringField;
    QPedidoNotaBaixarIND_ACEITO_VENDEDOR: TStringField;
    QPedidoNotaBaixarIND_ACEITO_FUNCIONARIO: TStringField;
    QPedidoNotaBaixarNUM_PEDIDO: TIntegerField;
    QPedidoNotaBaixarDT_ACEITO_VENDEDOR: TDateTimeField;
    QPedidoNotaBaixarDT_ACEITO_FUNCIONARIO: TDateTimeField;
    QPedidoNotaBaixarDT_CONFIRMACAO: TDateTimeField;
    QPedidoNotaBaixarIND_NOVO: TStringField;
    QPedidoNotaBaixarDT_CANCELAMENTO: TDateTimeField;
    QPedidoNotaBaixarDESC_ETAPA_ATUAL: TStringField;
    QPedidoNotaBaixarVAL_ALTURA_BARRACAO: TFloatField;
    QPedidoNotaBaixarVAL_LARGURA_BARRACAO: TFloatField;
    QPedidoNotaBaixarVAL_ALTURA_FORRACAO: TFloatField;
    QPedidoNotaBaixarDT_ENVIO_PRODUCAO: TDateTimeField;
    QPedidoNotaBaixarDT_GERACAO_NOTA: TDateTimeField;
    QPedidoNotaBaixarIND_SITUACAO: TStringField;
    QPedidoNotaBaixarPERC_DESCONTO: TFloatField;
    QPedidoNotaBaixarPERC_COMISSAO: TFloatField;
    QPedidoNotaBaixarVAL_DESCONTO: TFloatField;
    QPedidoNotaBaixarVAL_COMISSAO: TFloatField;
    QPedidoNotaBaixarCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoNotaBaixarCOD_PRODUTO_ITEM: TFloatField;
    QPedidoNotaBaixarDESC_PRODUTO_ITEM: TStringField;
    QPedidoNotaBaixarDESC_UNIDADE_ITEM: TStringField;
    QPedidoNotaBaixarQT_PEDIDO_ITEM: TFloatField;
    QPedidoNotaBaixarVAL_UNITARIO_ITEM: TFloatField;
    QPedidoNotaBaixarVAL_TOTAL_ITEM: TFloatField;
    QPedidoNotaBaixarCOD_LOTE_TIPO_ITEM: TIntegerField;
    QPedidoNotaBaixarCOD_TRIBUTACAO_ITEM: TIntegerField;
    QInsComissao: TOracleDataSet1;
    QContaReceberNUM_TITULO: TFloatField;
    QNotaSaidaNUM_KM: TIntegerField;
    QNotaSaidaVAL_COMISSAO: TFloatField;
    QNFE_EmiteDESC_EMPRESA: TStringField;
    QNFE_EmiteIND_OCULTA_FONE_DANFE: TStringField;
    QNFE_EmiteCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QContaPagarNUM_TITULO: TFloatField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    QNotaSaidaConsSVAL_TOTAL: TFloatField;
    QCstIpiCons: TOracleDataSet1;
    QCstIpiConsCOD_CST_IPI: TStringField;
    QCstIpiConsDESC_CST_IPI: TStringField;
    QItemNFCOD_CST_IPI: TStringField;
    QCstIpiConsDESC_COMPLETA: TStringField;
    QNotaSaidaConsNOME_VENDEDOR: TStringField;
    QUltimasVendas: TOracleDataSet1;
    QUltimasVendasDT_EMISSAO: TDateTimeField;
    QUltimasVendasCOD_OPERACAO: TIntegerField;
    QUltimasVendasVAL_UNITARIO: TFloatField;
    QUltimasVendasQT_QUANTIDADE: TFloatField;
    QUltimasVendasVAL_DESCONTO: TFloatField;
    QUltimasVendasDESC_OPERACAO: TStringField;
    CdVendaSimplesItem: TClientDataSet;
    QVendaSimplesItem: TOracleDataSet1;
    DspVendaSimplesItem: TDataSetProvider;
    CdVendaSimples: TClientDataSet;
    CdVendaSimplesCOD_CADASTRO: TIntegerField;
    CdVendaSimplesCOD_PRAZO_VENCIMENTO: TIntegerField;
    QVendaSimplesItemCOD_PRODUTO: TFloatField;
    QVendaSimplesItemDESC_PRODUTO: TStringField;
    QVendaSimplesItemVAL_UNITARIO: TFloatField;
    QVendaSimplesItemQT_QUANTIDADE: TFloatField;
    CdVendaSimplesItemCOD_PRODUTO: TFloatField;
    CdVendaSimplesItemDESC_PRODUTO: TStringField;
    CdVendaSimplesItemVAL_UNITARIO: TFloatField;
    CdVendaSimplesItemQT_QUANTIDADE: TFloatField;
    QNFE_EmiteItVAL_UNITARIO_TABELA: TFloatField;
    QNotaSaidaIND_ST: TStringField;
    QNotaSaidaCOD_RECEITA_OBRIGACAO_ICMS: TStringField;
    QNotaSaidaDT_VENCIMENTO_OBRIGACAO_ICMS: TDateTimeField;
    QNotaSaidaCOD_OBRIGACAO_ICMS: TStringField;
    QNotaSaidaNUM_PROCESSO_OBRIGACAO_ICMS: TStringField;
    QNotaSaidaIND_PROCESSO_OBRIGACAO_ICMS: TIntegerField;
    QNotaSaidaDESC_PROCESSO_OBRIGACAO_ICMS: TStringField;
    QNotaSaidaDESC_COMPL_OBRIGACAO_ICMS: TStringField;
    QNotaSaidaCOD_ESTADO_EMBARQUE: TStringField;
    QNotaSaidaDESC_LOCAL_EMBARQUE: TStringField;
    QNotaSaidaCOD_UF_VEICULO: TStringField;
    QSomaItemNotaSVAL_CUSTO: TFloatField;
    QNotaSaidaConsIND_CONDICIONAL: TStringField;
    QItensDevolucao: TOracleDataSet1;
    QItensDevolucaoIND_MARCADO: TStringField;
    QItensDevolucaoCOD_NOTA_ITEM: TIntegerField;
    QItensDevolucaoCOD_NOTA_CAB: TIntegerField;
    QItensDevolucaoCOD_TRIBUTACAO: TIntegerField;
    QItensDevolucaoQT_QUANTIDADE: TFloatField;
    QItensDevolucaoVAL_TOTAL: TFloatField;
    QItensDevolucaoPERC_IPI: TFloatField;
    QItensDevolucaoPERC_COMISSAO: TFloatField;
    QItensDevolucaoCOD_PRODUTO: TFloatField;
    QItensDevolucaoCOD_LOTE_TIPO: TIntegerField;
    QItensDevolucaoVAL_DESCONTO: TFloatField;
    QItensDevolucaoVAL_DESPESAS: TFloatField;
    QItensDevolucaoVAL_FRETE: TFloatField;
    QItensDevolucaoPERC_DESCONTO: TFloatField;
    QItensDevolucaoVAL_IPI: TFloatField;
    QItensDevolucaoVAL_UNITARIO: TFloatField;
    QItensDevolucaoVAL_ICM_BASE: TFloatField;
    QItensDevolucaoVAL_ICM: TFloatField;
    QItensDevolucaoIND_CLASS_IPI: TStringField;
    QItensDevolucaoVAL_CUSTO: TFloatField;
    QItensDevolucaoVAL_ISS: TFloatField;
    QItensDevolucaoPERC_INSS: TFloatField;
    QItensDevolucaoPERC_BENEFICIADO: TFloatField;
    QItensDevolucaoIND_BX_CONTR_VEND: TStringField;
    QItensDevolucaoNUM_NOTA_PRODUTOR: TIntegerField;
    QItensDevolucaoCOD_CULTURA: TIntegerField;
    QItensDevolucaoDESC_PRODUTO: TStringField;
    QItensDevolucaoIND_TIPO_CONSUMO: TStringField;
    QItensDevolucaoQT_CHEGADA: TFloatField;
    QItensDevolucaoVAL_PIS: TFloatField;
    QItensDevolucaoVAL_CONFINS: TFloatField;
    QItensDevolucaoPERC_DESC: TFloatField;
    QItensDevolucaoVAL_BASE_SUBST: TFloatField;
    QItensDevolucaoVAL_ICMS_SUBST: TFloatField;
    QItensDevolucaoVAL_UNITARIO_TABELA: TFloatField;
    QItensDevolucaoVAL_DPI_TRANSGENICOS: TFloatField;
    QItensDevolucaoQT_CREDITO_TRANSGENICOS: TFloatField;
    QItensDevolucaoCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QItensDevolucaoIND_TIPO_PRODUTO: TStringField;
    QItensDevolucaoDESC_COMPLEMENTO: TStringField;
    QCstPisCons: TOracleDataSet1;
    QCstCofinsCons: TOracleDataSet1;
    DSCstPisCons: TDataSource;
    DSCstCofinsCons: TDataSource;
    QItemNFCOD_CST_PIS: TStringField;
    QItemNFCOD_CST_COFINS: TStringField;
    QNFE_EmiteNUM_KM: TIntegerField;
    QCstPisConsCOD_CST_PIS: TStringField;
    QCstPisConsDESC_CST_PIS: TStringField;
    QCstPisConsDESC_COMPLETA: TStringField;
    QCstCofinsConsCOD_CST_COFINS: TStringField;
    QCstCofinsConsDESC_CST_COFINS: TStringField;
    QCstCofinsConsDESC_COMPLETA: TStringField;
    QRPedidoEspelhoDESC_LOTE: TStringField;
    QItemNFCOD_NATUREZA_RECEITA: TIntegerField;
    QNotaSaidaExp: TOracleDataSet;
    QNotaSaidaExpNUM_CGC_CPF: TStringField;
    QNotaSaidaExpNOME: TStringField;
    QNotaSaidaExpDESC_FANTASIA: TStringField;
    QNotaSaidaExpCOD_ESTADO: TStringField;
    QNotaSaidaExpNUM_INSCRICAO: TStringField;
    QNotaSaidaExpDESC_ENDERECO: TStringField;
    QNotaSaidaExpDESC_BAIRRO: TStringField;
    QNotaSaidaExpDESC_CIDADE: TStringField;
    QNotaSaidaExpDESC_CEP: TStringField;
    QNotaSaidaExpCOD_CIDADE: TIntegerField;
    QNotaSaidaExpDESC_TELEFONE: TStringField;
    QNotaSaidaExpPERC_FUNRURAL: TFloatField;
    QNotaSaidaExpDESC_SUFRAMA: TStringField;
    QNotaSaidaExpIND_FISICA_JURIDICA: TStringField;
    QNotaSaidaExpCOD_CIDADE_IBGE: TStringField;
    QNotaSaidaExpCOD_UF_IBGE: TIntegerField;
    QNotaSaidaExpCOD_PAIS_IBGE: TIntegerField;
    QNotaSaidaExpDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaExpCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaExpDT_EMISSAO: TDateTimeField;
    QNotaSaidaExpCOD_SERIE: TStringField;
    QNotaSaidaExpCFOP: TFloatField;
    QNotaSaidaExpNUM_CGC_CPF_1: TStringField;
    QNotaSaidaExpVAL_TOTAL: TFloatField;
    QNotaSaidaExpIND_CONDICAO_PAGTO: TStringField;
    QNotaSaidaExpDT_MOVIMENTO: TDateTimeField;
    QNotaSaidaExpVAL_ICM_BASE: TFloatField;
    QNotaSaidaExpPERC_ALIQUOTA: TFloatField;
    QNotaSaidaExpVAL_ICM: TFloatField;
    QNotaSaidaExpVAL_CONFINS: TFloatField;
    QNotaSaidaExpVAL_PIS: TFloatField;
    QNotaSaidaExpDESC_RESUMO: TStringField;
    QNotaSaidaExpCOD_PRODUTO: TFloatField;
    QNotaSaidaExpQT_QUANTIDADE: TFloatField;
    QNotaSaidaExpVAL_DESCONTO: TFloatField;
    QNotaSaidaExpVAL_IPI: TFloatField;
    QNotaSaidaExpNUM_FABRICANTE: TStringField;
    QNotaSaidaExpCOD_CST_IPI: TStringField;
    QNotaSaidaExpPERC_IPI: TFloatField;
    QNotaSaidaExpDESC_SITUACAO_TRIB: TStringField;
    QNotaSaidaExpCOD_CST_PIS: TStringField;
    QNotaSaidaExpVAL_PIS_1: TFloatField;
    QNotaSaidaExpSVAL_PIS: TFloatField;
    QNotaSaidaExpCOD_CST_COFINS: TStringField;
    QNotaSaidaExpVAL_BASE_SUBST: TFloatField;
    QNotaSaidaExpVAL_ICMS_SUBST: TFloatField;
    QNotaSaidaExpSVAL_ICMS_SUBT: TFloatField;
    QNotaSaidaExpDESC_UNIDADE: TStringField;
    QNotaSaidaExpSVAL_TOTAL: TFloatField;
    QNotaSaidaExpSVAL_DESCONTO: TFloatField;
    QNotaSaidaExpVAL_FRETE: TFloatField;
    QNotaSaidaExpSVAL_FRETE: TFloatField;
    QNotaSaidaExpSVAL_DESPESAS: TFloatField;
    QNotaSaidaExpCOD_TRANSPORTE: TIntegerField;
    QNotaSaidaExpNUM_PESO_BRUTO: TFloatField;
    QNotaSaidaExpNUM_PESO_LIQUIDO: TFloatField;
    QNotaSaidaExpDESC_PLACA: TStringField;
    QNotaSaidaExpNUM_VOLUMES: TIntegerField;
    QNotaSaidaExpDESC_ESPECIE: TStringField;
    QNotaSaidaExpDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaExpSVAL_ICM_BASE_ISENTO: TFloatField;
    QNotaSaidaExpNUM_CGC: TStringField;
    QNotaSaidaExpIND_TIPO_FRETE: TStringField;
    QNotaSaidaExpNUM_CONHECIMENTO_FRETE: TIntegerField;
    QNotaSaidaCOD_SERIE_MODELO: TStringField;
    QNotaSaidaExpCOD_SERIE_MODELO: TStringField;
    QNFE_EmiteCOD_SERIE_MODELO: TStringField;
    QNFE_Emitedesc_serie: TStringField;
    QRPedidoEspelhoVAL_DESCONTO_ITEM: TFloatField;
    QItemNFVAL_DESCONTO_RATEIO: TFloatField;
    QSomaItemNotaSVAL_DESCONTO_ITEM: TFloatField;
    QItemNfConsNUM_FABRICANTE: TStringField;
    QItemNfConsVAL_DESCONTO_RATEIO: TFloatField;
    QNotaSaidaNUM_NFSE: TStringField;
    QItensDevolucaoVAL_DESCONTO_RATEIO: TFloatField;
    QItemNFVAL_PIS: TFloatField;
    QItemNFVAL_CONFINS: TFloatField;
    QNotaSaidaCOD_SERIE_MODELO_CF: TStringField;
    QNotaSaidaDESC_CHAVE_ACESSO_CTE: TStringField;
    QVendaFuturaAberto: TOracleDataSet1;
    QVendaFuturaAbertoQT_SALDO: TFloatField;
    QItemNFind_subst_trib: TStringField;
    QNotaSaidaVAL_PIS_FRETE: TFloatField;
    QNotaSaidaVAL_COFINS_FRETE: TFloatField;
    QItensDevolucaoNUM_FABRICANTE: TStringField;
    QNFE_EmiteIND_CONSIGNACAO_CLIENTE: TStringField;
    QNotaSaidaCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QNotaSaidaNR_DIAS_CHEQUE1: TIntegerField;
    QNotaSaidaIND_CONSUMIDOR_FINAL: TStringField;
    QNotaSaidaNUM_COO: TIntegerField;
    QRPedidoEspelhoDESC_PRAZO_VENCIMENTO: TStringField;
    QContaReceberIND_ENVIADO_BANCO: TStringField;
    QNotaSaidaDESC_MD5_CUPOM_FISCAL: TStringField;
    QSomaItemNotaVAL_TOTAL_TRIB: TFloatField;
    QRPedidoEspelhoDESC_COMPLEMENTO_PROD: TStringField;
    QRPedidoEspelhoCOD_NOTA_ITEM: TIntegerField;
    QNotaSaidaConsIND_CONDICAO_PAGTO: TStringField;
    QNotaSaidaConsdesc_pagamento: TStringField;
    QItemNFVAL_ICMS_SUBST_ANT: TFloatField;
    QNotaSaidaIND_TIPO_PAGAMENTO: TStringField;
    QRPedidoEspelhoNUM_FABRICANTE: TStringField;
    QNotaSaidaIND_TEF: TStringField;
    QItemNFPERC_COMISSAO_PREPOSTO: TFloatField;
    QNotaSaidaConsDESC_CHAVE_ACESSO: TStringField;
    QItemNfConsVAL_DESPESAS: TFloatField;
    QItemNFVAL_DESPESAS: TFloatField;
    QSomaItemNotaSVAL_DESPESAS: TFloatField;
    QItemNFIND_CONSIDERA_IPI_BC_ICMS: TStringField;
    QNotaSaidaConsNUM_NOTA: TFloatField;
    QNotaSaidadesc_finalidade_nfe: TStringField;
    QNotaReferenciada: TOracleDataSet;
    QNotaReferenciadaCOD_NOTA_REFERENCIADA: TIntegerField;
    QNotaReferenciadaCOD_NOTA_CAB: TIntegerField;
    QRPedidoEspelhoDESC_MARCA_1: TStringField;
    QNotaSaidaIND_FINALIDADE_NFE: TIntegerField;
    QNfeExport: TOracleDataSet;
    QNfeExportCOD_NFE_EXPORT: TIntegerField;
    QNfeExportCOD_NOTA_ITEM: TIntegerField;
    QNfeExportDESC_NUM_DRAW: TStringField;
    QNfeExportDESC_NUM_RE: TStringField;
    QNfeExportDESC_CHAVE_ACESSO: TStringField;
    QNfeExportQT_QUANTIDADE_EXPORTADA: TFloatField;
    QNotaSaidaDESC_LOCAL_DESPACHO: TStringField;
    QNFAuxAbertoDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaConsCOD_SERIE_MODELO: TStringField;
    QPagamento: TOracleDataSet1;
    QPagamentoCOD_PAGAMENTO: TIntegerField;
    QPagamentoCOD_NOTA_CAB: TIntegerField;
    QPagamentoVAL_PAGAMENTO: TFloatField;
    QPagamentoVAL_VALOR: TFloatField;
    QPagamentoCOD_PAGAMENTO_ESTORNADO: TIntegerField;
    QPagamentoIND_ESTORNO: TStringField;
    QSomaPagamentos: TOracleDataSet1;
    QSomaPagamentosVAL_PAGO: TFloatField;
    DSSomaPagamentos: TDataSource;
    QNotaImpostoServicoVAL_IMPOSTO: TFloatField;
    QNFE_EmiteCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPagamentoCOD_TEF_PGTO: TIntegerField;
    DsPagamento: TDataSource;
    QNotaSaidaConsCOD_OBRA: TIntegerField;
    QNotaSaidaConsDESC_OBRA: TStringField;
    QPagamentoIND_CONFIRMADO: TStringField;
    QPosVendaNUM_NOTA: TIntegerField;
    QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS: TFloatField;
    QNotaNomeCons: TOracleDataSet1;
    QNotaNomeConsDESC_CGC_CPF: TStringField;
    QSomaPagamentosVAL_AVISTA: TFloatField;
    QItemNfConsCOD_CST_PIS: TStringField;
    QItemNfConsCOD_CST_COFINS: TStringField;
    QItemNfConsCOD_CST_IPI: TStringField;
    QItemNfConsCOD_CFOP: TStringField;
    QAtzNotaIND_CONDICAO_PAGTO: TStringField;
    QNotaNomeNOME: TStringField;
    QPagamentoPAGAMENTO: TStringField;
    QNFE_EmiteItVAL_DESCONTO_TOTAL: TFloatField;
    QNotaSaidaConsNUM_PESO_BRUTO: TFloatField;
    QNotaReferenciadaDESC_CHAVE_ACESSO: TStringField;
    QNotaReferenciadaCOD_NOTA_CAB_REF: TIntegerField;
    QSomaPagamentosVAL_TEF_NAO_PROCESSADO: TFloatField;
    QSomaPagamentosVAL_TEF: TFloatField;
    QSomaPagamentosVAL_TEF_PROCESSADO: TFloatField;
    QSomaPagamentosVAL_TEF_EFETUADO: TFloatField;
    QNFAuxAbertoCOD_SERIE_MODELO: TStringField;
    QNotaReferenciadaCOD_SERIE: TStringField;
    QNotaReferenciadaCOD_SERIE_MODELO: TStringField;
    QNotaReferenciadaCOD_CADASTRO: TIntegerField;
    QNotaReferenciadaDT_EMISSAO: TDateTimeField;
    QNotaReferenciadaNUM_NOTA: TIntegerField;
    QNotaSaidaConsCOD_OPERACAO: TIntegerField;
    QItemNFVAL_ICMS_DIFERENCIAL: TFloatField;
    QItemNFPERC_ALIQ_ICMS_DIFERENCIAL: TFloatField;
    QContaReceberCOD_USUARIO: TIntegerField;
    QContaReceberDT_USUARIO: TDateTimeField;
    QItemNFcst_icms: TStringField;
    QItemNF_CalcFields: TOracleDataSet1;
    QItemNF_CalcFieldsDESC_PRODUTO: TStringField;
    QItemNF_CalcFieldsIND_SUBST_TRIB: TStringField;
    QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO: TIntegerField;
    QItemNF_CalcFieldsIND_FISICA_JURIDICA: TStringField;
    QItemNF_CalcFieldsNUM_INSCRICAO: TStringField;
    QItemNF_CalcFieldsCOD_NOTA_ITEM: TIntegerField;
    QItemNF_CalcFieldsCOD_PRODUTO: TFloatField;
    QSomaItemNotaSVAL_BC_PIS: TFloatField;
    QSomaItemNotaSVAL_BC_COFINS: TFloatField;
    QItemNFwMostraCusto: TFloatField;
    QItemNF_CalcFieldsVL_CUSTO_MEDIO: TFloatField;
    QValeProdutoTroca: TOracleDataSet;
    QItemNfConsOBS: TStringField;
    QSomaVales: TOracleDataSet1;
    QSomaValesSVAL_VALE_COMPRAS: TFloatField;
    QSomaValesSVAL_VALE_PRESENTE: TFloatField;
    QValeProdutoTrocaCOD_NOTA_CAB: TIntegerField;
    QValeProdutoTrocaCOD_NOTA_CAB_DEV: TIntegerField;
    QValeProdutoTrocaCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoTrocaVAL_VALE_PRODUTO: TFloatField;
    QValeProdutoTrocaVAL_VALOR_BAIXADO: TFloatField;
    QValeProdutoTrocaDT_EMISSAO: TDateTimeField;
    QValeProdutoTrocaCOD_NOTA_CAB_TROCA: TIntegerField;
    QValeProdutoTrocaCOD_NOTA_CAB_ANTERIOR: TIntegerField;
    QValeProdutoTrocaIND_VALIDO: TStringField;
    QValeProdutoTrocaIND_CANCELADO: TStringField;
    QValeProdutoTrocaIND_UTILIZADO: TStringField;
    QItemNFCOD_TABELA_PRECO_CAB: TIntegerField;
    QItemNfConsPERC_COMISSAO_PREPOSTO: TFloatField;
    QItemNfConsCOD_TABELA_PRECO_CAB: TIntegerField;
    QNotaSaidaNUM_PESO_BRUTO: TFloatField;
    QNotaSaidaNUM_PESO_LIQUIDO: TFloatField;
    QItemNF_CalcFieldsIND_CONTRIBUINTE: TStringField;
    QItemNF_CalcFieldsCOD_TRIBUTACAO: TIntegerField;
    QItemNF_CalcFieldsDESC_SITUACAO_TRIB_NC: TStringField;
    QItemNF_CalcFieldsDESC_SITUACAO_TRIB: TStringField;
    QItemNF_CalcFieldsDESC_CSOSN: TStringField;
    QItemNF_CalcFieldsDESC_CSOSN_NC: TStringField;
    QItemNFCOD_ORDEM_SERVICO_ITEM: TIntegerField;
    QNFE_EmiteNUM_PLACA: TStringField;
    QNFE_EmiteDESC_MODELO: TStringField;
    QRPedidoEspelhoDESC_INF_ADICIONAL: TStringField;
    QItemNfConsDESC_INF_ADICIONAL: TStringField;
    QNotaSaidaIND_MODALIDADE_CARTAO: TStringField;
    QNotaSaidadesc_msg_devolucao: TStringField;
    QNotaReferenciadaCons: TOracleDataSet;
    QNotaReferenciadaConsCOD_NOTA_CAB: TIntegerField;
    QNotaReferenciadaConsNUM_NOTA: TIntegerField;
    QNotaReferenciadaConsDT_EMISSAO: TDateTimeField;
    QNotaReferenciadaConsDESC_RETORNO_PROCESSAMENTO: TStringField;
    QNotaReferenciadaConsDESC_RETORNO_CANCELAMENTO: TStringField;
    QNotaReferenciadaConsCOD_SERIE_MODELO: TStringField;
    QAtzNotaCOD_USUARIO: TIntegerField;
    QAtzNotaDT_USUARIO: TDateTimeField;
    QItemNFNUM_GENERO_NCM: TStringField;
    QRPedidoEspelhoVAL_TOTAL_SEM_DESCONTO: TFloatField;
    QNotaSaidaIND_PRESENCA: TIntegerField;
    QSomaItemNotasval_a_pagar: TFloatField;
    OpBaixaPedido: TOraclePackage;
    QNFE_EmiteDESC_MENSAGEM: TStringField;
    QNotaSaidaOBS: TStringField;
    QRPedidoEspelhoDESC_COD_BARRA: TStringField;
    QRPedidoEspelhoIND_CONDICIONAL: TStringField;
    QNotaSaidaConsCOD_ESTADO_FILIAL: TStringField;
    QNotaSaidaConsCOD_CIDADE_FILIAL: TIntegerField;
    QNFE_EmiteIND_CONDICIONAL: TStringField;
    QValeProdutoTrocaDESC_TIPO_VALE: TStringField;
    QNFE_EmiteDESC_E_MAIL_CLIENTE: TStringField;
    QNotaSaidaVAL_TROCO: TFloatField;
    QPagamentoVAL_TROCO: TFloatField;
    QRPedidoEspelhoVAL_TROCO: TFloatField;
    QNFE_EmiteVAL_TROCO: TFloatField;
    QRPedidoEspelhoSVAL_TOTAL_VALES: TFloatField;
    QNotaSaidaOBS_COMPLEMENTO: TStringField;
    QSomaValessval_novo_vale_compras: TFloatField;
    QSomaValessval_novo_vale_presente: TFloatField;
    QNotaSaidaCOD_GUIA_PAGAMENTO: TStringField;
    QNotaSaidaConsCOD_GUIA_PAGAMENTO: TStringField;
    QSomaValessval_vale_compras_menos_novo: TFloatField;
    QSomaValessval_vale_presente_menos_novo: TFloatField;
    QReceituarioOticoCons: TOracleDataSet1;
    QReceituarioOticoConsItens: TOracleDataSet1;
    QReceituarioOticoConsCOD_RECEITUARIO_OPTICO: TIntegerField;
    QReceituarioOticoConsDESC_MEDICO: TStringField;
    QReceituarioOticoConsDT_CONSULTA: TDateTimeField;
    QReceituarioOticoConsItensCOD_PRODUTO: TFloatField;
    QReceituarioOticoConsItensDESC_PRODUTO: TStringField;
    QReceituarioOticoConsItensQT_QUANTIDADE: TFloatField;
    QReceituarioOticoConsItensNOTA: TStringField;
    QReceituarioOticoConsItensVAL_TOTAL: TFloatField;
    QReceituarioOticoConsItensVAL_UNITARIO: TFloatField;
    QReceituarioOticoConsItensVAL_DESCONTO: TFloatField;
    QReceituarioOticoConsItensPERC_DESCONTO: TFloatField;
    QNotaSaidaCOD_RECEITUARIO_OPTICO: TIntegerField;
    QSomaItemNotaIND_ISS_RETIDO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OD_ESFERICO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OD_CILINDRICO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OD_EIXO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OD_DP: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OD_ALTURA: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OE_ESFERICO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OE_CILINDRICO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OE_EIXO: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OE_DP: TFloatField;
    QReceituarioOticoConsVAL_LONGE_OE_ALTURA: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OD_ESFERICO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OD_CILINDRICO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OD_EIXO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OD_DP: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OD_ALTURA: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OE_ESFERICO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OE_CILINDRICO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OE_EIXO: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OE_DP: TFloatField;
    QReceituarioOticoConsVAL_PERTO_OE_ALTURA: TFloatField;
    QReceituarioOticoConsDESC_OBS: TMemoField;
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
    QNFE_EmiteIND_VENDA: TStringField;
    QNFE_EmiteCOD_SERIE_OPERACAO: TStringField;
    QNFE_EmiteDT_CANCELAMENTO: TDateTimeField;
    QNFE_EmiteIND_BLOQUEIO_VENDA_VCTO: TStringField;
    QNotaReferenciadaItem: TOracleDataSet1;
    QNotaReferenciadaItemCOD_NOTA_ITEM: TIntegerField;
    QNotaReferenciadaItemCOD_PRODUTO: TFloatField;
    QNotaReferenciadaItemVAL_IPI: TFloatField;
    QNotaReferenciadaItemCOD_LOTE_TIPO: TIntegerField;
    QItemNfConsNUM_NATUREZA_EST_NOVO: TIntegerField;
    QItemNfConsNUM_NATUREZA_INT_NOVO: TIntegerField;
    QSomaPagamentosVAL_CARTAO_CREDITO: TFloatField;
    QSomaPagamentosVAL_CARTAO_DEBITO: TFloatField;
    QSomaPagamentosVAL_A_PRAZO: TFloatField;
    QNotaSaidaConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QItemNfConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QItemNF_CalcFieldsDESC_FORMA_COMPRA: TStringField;
    QRPedidoEspelhoCOD_OBRA: TIntegerField;
    QRPedidoEspelhoVAL_TOTAL_COM_DESCONTO: TFloatField;
    QItemNFPERC_BASE_SUBST: TFloatField;
    QNotaSaidaConsNUM_PEDIDO: TIntegerField;
    QNotasIntegracaoMax: TOracleDataSet1;
    QNotasIntegracaoMaxCOD_NOTA_CAB: TIntegerField;
    QNotasIntegracaoMaxNOME: TStringField;
    QNotasIntegracaoMaxDT_EMISSAO: TDateTimeField;
    QNotasIntegracaoMaxDT_RECEBIMENTO: TDateTimeField;
    QNotasIntegracaoMaxNUM_NOTA: TFloatField;
    QNotasIntegracaoMaxCOD_FILIAL: TIntegerField;
    QNotasIntegracaoMaxCOD_CADASTRO: TIntegerField;
    QNotasIntegracaoMaxNOME_VENDEDOR: TStringField;
    QNotasIntegracaoMaxIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QNotasIntegracaoMaxNUM_PEDIDO: TIntegerField;
    QNotasIntegracaoMaxSVAL_TOTAL: TFloatField;
    QNotasIntegracaoMaxDESC_CIDADE: TStringField;
    QNotasIntegracaoMaxIND_SELECIONADO: TStringField;
    QNotasIntegracaoMaxCOD_EMBARQUE: TFloatField;
    QNotasIntegracaoMaxNUM_SEQUENCIAL: TFloatField;
    QNotasIntegracaoMaxDT_PREV_RETORNO: TDateTimeField;
    QNotasIntegracaoMaxNUM_EMBARQUE: TFloatField;
    QNotasIntegracaoMaxDESC_CHAVE_ACESSO: TStringField;
    QNotaSaidaConsCOD_CIDADE: TIntegerField;
    QItensDevolucaoIND_MODIFICADO: TStringField;
    QItemNF_CalcFieldsCOD_HISTORICO_CAIXA_CHEQUE: TIntegerField;
    QSomaItemNotaSVAL_CHEQUE_CAIXA: TFloatField;
    QRPedidoEspelhoDESC_EMPRESA: TStringField;
    QItemNFval_total_com_desconto: TFloatField;
    QItemNFVAL_UNITARIO_COM_DESCONTO: TFloatField;
    QRPedidoEspelhoVAL_TOTAL_ITEM_DESC: TFloatField;
    QRPedidoEspelhoDT_USUARIO: TDateTimeField;
    QItemNotasIntegraMax: TOracleDataSet1;
    QItemNotasIntegraMaxCOD_PRODUTO: TFloatField;
    QItemNotasIntegraMaxQT_QUANTIDADE: TFloatField;
    QItemNotasIntegraMaxCOD_NOTA_ITEM: TFloatField;
    QItemNotasIntegraMaxVAL_UNITARIO: TFloatField;
    QItemNotasIntegraMaxIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QRPedidoEspelhoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QNotaSaidaIND_PROMOCAO: TStringField;
    QNotaSaidaCOD_CIDADE_PRESTACAO: TIntegerField;
    QItemNF_CalcFieldsIND_APLICA_DEDUCAO_BC_ISS: TStringField;
    QItemNF_CalcFieldsIND_TIPO_PRODUTO: TStringField;
    QItemNF_CalcFieldsPERC_BC_NFSE: TFloatField;
    QItemNF_CalcFieldsPERC_ISS: TFloatField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_FILIAL: TFloatField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_CADASTRO: TFloatField;
    QItemNF_CalcFieldsCFOP_ESTADUAL: TIntegerField;
    QItemNF_CalcFieldsCFOP_INTERESTADUAL: TIntegerField;
    QItemNFNUM_PEDIDO_COMPRA: TStringField;
    QItemNFNUM_PEDIDO_COMPRA_ITEM: TIntegerField;
    QPrecoPromocao: TOracleDataSet1;
    QPrecoPromocaoPRECO_PROMOCAO: TFloatField;
    QItemNFVAL_INSS: TFloatField;
    QItemNFVAL_CSLL: TFloatField;
    QSomaItemNotaSVAL_CSLL: TFloatField;
    QSubstEspecialCons: TOracleDataSet1;
    QSubstEspecialConsCOD_SUBST_ESPECIAL: TIntegerField;
    QSubstEspecialConsCOD_NOTA_CAB: TIntegerField;
    QSubstEspecialConsCOD_PRODUTO: TIntegerField;
    QSubstEspecialConsDT_LANCAMENTO: TDateTimeField;
    QSubstEspecialConsVAL_SUBST_ESPECIAL: TFloatField;
    QSubstEspecialConsVAL_BASE_SUBST_ESPECIAL: TFloatField;
    QItemNF_CalcFieldsIND_EMITE: TStringField;
    QNotaSaidaConsCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QNotaSaidaConsSVAL_TOTAL_NOTA: TFloatField;
    QInsertContabiliza: TOracleDataSet;
    QInsertContabilizaCOD_NOTA_CAB: TIntegerField;
    QItemNFVAL_IR: TFloatField;
    QItemNFPERC_CSLL: TFloatField;
    QItemNFPERC_IR: TFloatField;
    QSomaItemNotaSVAL_IR: TFloatField;
    QItemNFVAL_BASE_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNFVAL_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNFPERC_ST_ANTERIOR_RETIDO: TFloatField;
    QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO: TStringField;
    QExpexcel: TOracleDataSet1;
    QExpexcelCOD_NOTA_CAB: TIntegerField;
    QExpexcelDT_EMISSAO: TDateTimeField;
    QExpexcelCOD_CADASTRO: TIntegerField;
    QExpexcelNOME: TStringField;
    QExpexcelDESC_E_MAIL: TStringField;
    QExpexcelDESC_TELEFONE: TStringField;
    QExpexcelDESC_CELULAR: TStringField;
    QExpexcelNUM_CGC_CPF: TStringField;
    QExpexcelDESC_CIDADE: TStringField;
    QExpexcelCOD_ESTADO: TStringField;
    QExpexcelQT_QUANTIDADE: TFloatField;
    QExpexcelCOD_PRODUTO: TFloatField;
    QExpexcelDESC_PRODUTO: TStringField;
    QExpexcelVAL_UNITARIO: TFloatField;
    QExpexcelVAL_ICMS_SUBST: TFloatField;
    QExpexcelVAL_IPI: TFloatField;
    QExpexcelVAL_TOTAL: TFloatField;
    QExpexcelNUM_PEDIDO: TIntegerField;
    QExpexcelNOME_VENDEDOR: TStringField;
    QExpexcelOBS: TStringField;
    QExpexcelDESC_ENDERECO_FILIAL: TStringField;
    QExpexcelNUM_ENDERECO_FILIAL: TIntegerField;
    QExpexcelDESC_CIDADE_FILIAL: TStringField;
    QExpexcelCOD_ESTADO_FILIAL: TStringField;
    QExpexcelDESC_TELEFONE_FILIAL: TStringField;
    QExpexcelDESC_FAX_FILIAL: TStringField;
    QExpexcelVAL_DESCONTO: TFloatField;
    QExpexcelIND_TIPO_FRETE: TStringField;
    QExpexcelIND_CESTA_BASICA: TStringField;
    QExpexcelNUM_FABRICANTE: TStringField;
    QExpexcelNUM_NOTA: TIntegerField;
    QNotaSaidaIND_INTERMEDIADOR: TStringField;
    QItemNF_CalcFieldsIND_CALCULA_ISS_CIDADE: TStringField;
    QItemNF_CalcFieldsPERC_ISS_CIDADE: TFloatField;
    QItemNFNUM_FABRICANTE: TStringField;
    QItemNF_CalcFieldsPERC_DEDUCAO_NFSE: TFloatField;
    QNFE_EmiteIND_SISTEMA_NFE: TIntegerField;
    QNFE_EmiteDESC_COMPLEMENTO3: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO4: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO5: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO6: TStringField;
    QNFE_EmiteDESC_COMPLEMENTO7: TStringField;
    QLancamentoCartao: TOracleDataSet1;
    QLancamentoCartaoCOD_LANCAMENTO_CARTAO: TIntegerField;
    QLancamentoCartaoCOD_NOTA_CAB: TIntegerField;
    QLancamentoCartaoDT_EMISSAO: TDateTimeField;
    QLancamentoCartaoDT_RECEBIMENTO: TDateTimeField;
    QLancamentoCartaoDESC_BANDEIRA: TStringField;
    QLancamentoCartaoNUM_PARCELA: TIntegerField;
    QLancamentoCartaoVAL_ORIGINAL: TFloatField;
    QLancamentoCartaoCOD_BANCO_AGENCIA: TIntegerField;
    QNotaSaidaCOD_TECNICO: TIntegerField;
    QLancamentoCartaoNUM_PARCELAS: TIntegerField;
    QLancamentoCartaoPERC_TAXA: TFloatField;
    QNotaSaidaConsDT_USUARIO: TDateTimeField;
    QItemNFCOD_FORMULA: TIntegerField;
    QSomaPagamentosVAL_PIX: TFloatField;
    QExpFornecedor: TOracleDataSet;
    QExpFornecedorFORN_TIPO: TStringField;
    QExpFornecedorFORN_CPF_CNPJ: TStringField;
    QExpFornecedorFORN_IE: TStringField;
    QExpFornecedorFORN_NOME_RAZAO: TStringField;
    QExpFornecedorFORN_NOME_FANTASIA: TStringField;
    QExpFornecedorFORN_DATA_NASCIMENTO_ABERTURA: TDateTimeField;
    QExpFornecedorFORN_EMAIL: TStringField;
    QExpFornecedorFORN_FONE: TStringField;
    QExpFornecedorFORN_FONE_EXTRA: TStringField;
    QExpFornecedorFORN_CONTATO: TStringField;
    QExpFornecedorFORN_ENDERECO: TStringField;
    QExpFornecedorFORN_NUMERO: TStringField;
    QExpFornecedorFORN_COMPLEMENTO: TStringField;
    QExpFornecedorFORN_CEP: TStringField;
    QExpFornecedorFORN_BAIRRO: TStringField;
    QExpFornecedorPAIS_COD: TFloatField;
    QExpFornecedorUF: TStringField;
    QExpFornecedorCID_NOME: TStringField;
    QExpFornecedorFORN_PRODUTO_SERVICO: TStringField;
    QExpFornecedorFORN_OBSERVACAO: TStringField;
    QExpFornecedorFORN_CRITICO: TFloatField;
    QExpFornecedorFORN_INTERNACIONAL: TFloatField;
    QExpFornecedorFORN_COD_EXTERNO: TStringField;
    QExpFornecedorFORN_DATA_CADASTRO: TDateTimeField;
    QExpFornecedorFORN_ATIVO: TFloatField;
    QExpFornecedorTIPO_NOME: TStringField;
    QExpFornecedorTIPO_OQUE_FORNECE: TStringField;
    QExpFornecedorTIPO_EXIGE_QUALIFICACAO: TFloatField;
    QExpCliente: TOracleDataSet;
    QExpClienteCLI_TIPO: TStringField;
    QExpClienteCLI_CPF_CNPJ: TStringField;
    QExpClienteCLI_RG_IE: TStringField;
    QExpClienteCLI_NOME_RAZAO: TStringField;
    QExpClienteCLI_NOME_FANTASIA: TStringField;
    QExpClienteCLI_DATA_NASCIMENTO_ABERTURA: TDateTimeField;
    QExpClienteCLI_NOME_REPRESENTANTE: TStringField;
    QExpClienteCLI_CPF_REPRESENTANTE: TStringField;
    QExpClienteCLI_ENDERECO: TStringField;
    QExpClienteCLI_NUMERO: TStringField;
    QExpClienteCLI_COMPLEMENTO: TStringField;
    QExpClienteCLI_CEP: TStringField;
    QExpClienteCLI_BAIRRO: TStringField;
    QExpClientePAIS_COD: TFloatField;
    QExpClienteUF: TStringField;
    QExpClienteCID_NOME: TStringField;
    QExpClienteCLI_TELEFONE: TStringField;
    QExpClienteCLI_TELEFONE_EXTRA: TStringField;
    QExpClienteCLI_CONTATO: TStringField;
    QExpClienteCLI_EMAIL: TStringField;
    QExpClienteCLI_OBSERVACAO: TStringField;
    QExpClienteCLI_ATIVO: TFloatField;
    QExpUsuario: TOracleDataSet;
    QExpUsuarioADM_CPF: TStringField;
    QExpUsuarioADM_CHAVE_INTEGRACAO: TStringField;
    QExpUsuarioADM_NOME: TStringField;
    QExpUsuarioADM_EMAIL: TStringField;
    QExpUsuarioNIVEL_COD: TFloatField;
    QExpUsuarioADM_MATRICULA: TIntegerField;
    QExpUsuarioADM_LOGIN: TStringField;
    QExpUsuarioADM_SENHA: TStringField;
    QExpUsuarioADM_DATA_ADMISSAO: TStringField;
    QExpUsuarioADM_DATA_DESLIGAMENTO: TStringField;
    QExpUsuarioTURNO_COD: TFloatField;
    QExpUsuarioADM_CARGA_HORARIO: TStringField;
    QExpUsuarioADM_SEXO: TStringField;
    QExpUsuarioADM_RG: TStringField;
    QExpUsuarioADM_DATA_NASCIMENTO: TStringField;
    QExpUsuarioADM_CTPS: TStringField;
    QExpUsuarioADM_PIS: TStringField;
    QExpUsuarioADM_CBO: TStringField;
    QExpUsuarioADM_TITULO_ELEITOR: TStringField;
    QExpUsuarioADM_TEM_PLANO_SAUDE: TFloatField;
    QExpUsuarioADM_PLANO_SAUDE: TStringField;
    QExpUsuarioADM_CEP: TStringField;
    QExpUsuarioADM_ENDERECO: TStringField;
    QExpUsuarioPAIS_COD: TFloatField;
    QExpUsuarioUF: TStringField;
    QExpUsuarioCID_NOME: TStringField;
    QExpUsuarioADM_FONE_RESIDENCIAL: TStringField;
    QExpUsuarioADM_FONE_CELULAR: TStringField;
    QExpUsuarioADM_FONE_EMERGENCIAL: TStringField;
    QExpUsuarioADM_BRIGADA: TStringField;
    QExpUsuarioADM_CIPA: TStringField;
    QExpUsuarioADM_INSPETOR: TStringField;
    QExpUsuarioADM_AUDITOR: TStringField;
    QExpUsuarioADM_SIT: TFloatField;
    QSomaContaCorrenteSVAL_ICM_BASE: TFloatField;
    QSomaContaCorrenteSVAL_ICMS: TFloatField;
    QSomaContaCorrenteSVAL_DESPESAS: TFloatField;
    QSomaContaCorrenteSVAL_DESCONTO: TFloatField;
    QSomaContaCorrentePERC_DESCONTO: TFloatField;
    QConferenciaNFCodBarras: TOracleDataSet;
    QConferenciaNFCodBarrasQT_EMBARCADO: TIntegerField;
    QConferenciaNFCodBarrasQT_QUANTIDADE: TFloatField;
    QConferenciaNFCodBarrasCOD_PRODUTO: TFloatField;
    QConferenciaNFCodBarrasDESC_PRODUTO: TStringField;
    QConferenciaNFCodBarrasNOME: TStringField;
    QConferenciaNFCodBarrasCOD_NOTA_CAB: TIntegerField;
    QConferenciaNFCodBarrasCOD_ESTOQUE_EMBARCADO: TIntegerField;
    QConferenciaNFCodBarrasDESC_COD_BARRA: TStringField;
    QItemNfConsDESC_COD_BARRA: TStringField;
    QItemNFCOD_USUARIO: TIntegerField;
    QAtuDtFatura_PedCOD_USUARIO: TIntegerField;
    QAtuBaixaPedCOD_USUARIO: TIntegerField;
    QItemNF_CalcFieldsIND_ISS_RETIDO: TIntegerField;
    QCaixaDESC_COMPLEMENTO1: TStringField;
    QConferenciaNFCodBarrasCOD_LOTE_TIPO: TIntegerField;
    QNotaSaidaConsCOD_TECNICO: TIntegerField;
    QContaPix: TOracleDataSet1;
    QContaPixCOD_BANCO_AGENCIA_PIX: TIntegerField;
    QContaPixDESC_CLIENT_ID: TStringField;
    QContaPixDESC_CLIENT_SECRET: TStringField;
    QContaPixDESC_CONSUMER_KEY: TStringField;
    QContaPixDESC_CONSUMER_SECRET: TStringField;
    QContaPixDESC_DEVELOPER_APPLICATION_KEY: TStringField;
    QContaPixDESC_ACCOUNT_ID: TStringField;
    QContaPixDESC_ARQUIVO_CHAVE_PRIVADA: TStringField;
    QContaPixDESC_ARQUIVO_CERTIFICADO: TStringField;
    QContaPixDESC_ARQUIVO_ROOT_CERTIFICADO: TStringField;
    QContaPixDESC_SECRET_KEY: TStringField;
    QContaPixDESC_ACCESS_KEY: TStringField;
    QContaPixDESC_ARQUIVO_PFX: TStringField;
    QContaPixDESC_SENHA_PFX: TStringField;
    QContaPixDESC_ACCESS_TOKEN: TStringField;
    QContaPixDESC_TOKEN: TStringField;
    QContaPixDESC_TOKEN_SANDBOX: TStringField;
    QContaPixDESC_MEDIATOR_FEE: TFloatField;
    QContaPixCOD_API_VERSION: TFloatField;
    QContaPixCOD_TIPO_AMBIENTE: TIntegerField;
    QContaPixIND_PIX_PADRAO: TStringField;
    QContaPixCOD_USUARIO: TIntegerField;
    QContaPixCOD_PSP_BANCO: TIntegerField;
    QContaPixIND_AMBIENTE_PSP: TIntegerField;
    QContaPixDESC_CHAVE_PIX: TStringField;
    QLancamentoCartaoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QImagemProdutoCOD_IMAGEM_PRODUTO: TIntegerField;
    QLancamentoCartaoCons: TOracleDataSet1;
    QLancamentoCartaoConsCOD_LANCAMENTO_CARTAO: TIntegerField;
    QLancamentoCartaoConsCOD_BANCO_AGENCIA: TIntegerField;
    QLancamentoCartaoConsCOD_NOTA_CAB: TIntegerField;
    QLancamentoCartaoConsDT_EMISSAO: TDateTimeField;
    QLancamentoCartaoConsDT_RECEBIMENTO: TDateTimeField;
    QLancamentoCartaoConsDESC_BANDEIRA: TStringField;
    QLancamentoCartaoConsNUM_PARCELA: TIntegerField;
    QLancamentoCartaoConsVAL_ORIGINAL: TFloatField;
    QLancamentoCartaoConsNUM_PARCELAS: TIntegerField;
    QLancamentoCartaoConsPERC_TAXA: TFloatField;
    QLancamentoCartaoConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QImagemProdutoCOD_PRODUTO: TFloatField;
    QNotaSaidaDESC_TXID: TStringField;
    QNotaSaidaConsNOME_NOTA: TStringField;
    QNotaSaidaDESC_OBS_CORPO_NOTA: TStringField;
    QItemNF_CalcFieldsIND_CONSIDERA_FRETE_BC_ICMS: TStringField;
    QRPedidoEspelhoCLI_E_MAIL: TStringField;
    QRPedidoEspelhoDESC_ESTADO: TStringField;
    QNotaSaidaCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QBoletoAPI: TOracleDataSet1;
    QBoletoAPINota: TOracleDataSet1;
    QBoletoAPINotaCOD_BANCO_AGENCIA: TIntegerField;
    QBoletoAPINotaCOD_BANCO: TIntegerField;
    QBoletoAPINotaCOD_CONTA_CORRENTE: TIntegerField;
    QBoletoAPINotaCOD_AGENCIA: TIntegerField;
    QBoletoAPINotaCODIGO_CEDENTE: TIntegerField;
    QBoletoAPINotaNUM_CONVENIO: TIntegerField;
    QBoletoAPINotaIND_API_BOLETO: TStringField;
    QBoletoAPINotaNOME_SEQUENCIA: TStringField;
    QBoletoAPINotaNUM_CONTA_CORRENTE: TStringField;
    QBoletoAPINotaCOD_NOSSO_NUMERO: TStringField;
    QBoletoAPINotaIND_AMBIENTE_API_BOLETO: TStringField;
    QContaReceberIND_WEB_API: TStringField;
    QBoletoAPICOD_CONTA_RECEBER_CAB: TIntegerField;
    QBoletoAPINUM_TITULO: TFloatField;
    QBoletoAPINUM_PARCELA: TIntegerField;
    QBoletoAPIDESC_TIPO_DOCUMENTO: TStringField;
    QBoletoAPIDT_MOVIMENTO: TDateTimeField;
    QBoletoAPIDT_BAIXA: TDateTimeField;
    QBoletoAPIDT_VENCIMENTO: TDateTimeField;
    QBoletoAPIDT_EMISSAO: TDateTimeField;
    QBoletoAPIDT_CAPITALIZACAO: TDateTimeField;
    QBoletoAPIVAL_TITULO: TFloatField;
    QBoletoAPIVAL_NEGOCIO: TFloatField;
    QBoletoAPIIND_ACEITE: TStringField;
    QBoletoAPIVAL_ORIGINAL: TFloatField;
    QBoletoAPICOD_NOSSO_NUMERO: TStringField;
    QBoletoAPIVAL_JUROS: TFloatField;
    QBoletoAPIDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QBoletoAPIDESC_AVALISTA1: TStringField;
    QBoletoAPICOD_CONTA_CORRENTE: TIntegerField;
    QBoletoAPINUM_CONTA_CORRENTE: TStringField;
    QBoletoAPIDESC_CONTA_CORRENTE: TStringField;
    QBoletoAPIVARIACAO: TIntegerField;
    QBoletoAPICARTEIRA: TIntegerField;
    QBoletoAPICOMANDO: TIntegerField;
    QBoletoAPINR_DIAS_PROTESTO: TIntegerField;
    QBoletoAPIPRIMEIRA_INSTR_COD: TStringField;
    QBoletoAPICC_COD_FILIAL: TIntegerField;
    QBoletoAPIDESC_TIPO_COBRANCA: TStringField;
    QBoletoAPICOD_CADASTRO: TIntegerField;
    QBoletoAPINOME: TStringField;
    QBoletoAPIIND_FISICA_JURIDICA: TStringField;
    QBoletoAPINUM_CGC_CPF: TStringField;
    QBoletoAPIDESC_TELEFONE: TStringField;
    QBoletoAPIDESC_CELULAR: TStringField;
    QBoletoAPIDESC_BAIRRO: TStringField;
    QBoletoAPIDESC_FANTASIA: TStringField;
    QBoletoAPIPERC_DESCONTO_FINANCEIRO: TFloatField;
    QBoletoAPIDESC_CIDADE_COBRANCA: TStringField;
    QBoletoAPIDESC_ENDERECO_COBRANCA: TStringField;
    QBoletoAPIDESC_ESTADO_COBRANCA: TStringField;
    QBoletoAPIDESC_BAIRRO_COBRANCA: TStringField;
    QBoletoAPIDESC_CEP_COBRANCA: TStringField;
    QBoletoAPIDESC_TELEFONE_COMERCIAL: TStringField;
    QBoletoAPICOD_BANCO_AGENCIA: TIntegerField;
    QBoletoAPIDESC_BANCO_AGENCIA: TStringField;
    QBoletoAPIDESC_CIDADE: TStringField;
    QBoletoAPIDESC_SIGLA: TStringField;
    QBoletoAPIDESC_LOCAL_PGTO_BLOQ: TStringField;
    QBoletoAPIDESC_INSTRUCAO_BLOQUETO: TStringField;
    QBoletoAPIIND_TIPO_JURO: TStringField;
    QBoletoAPIPERC_JURO_BLOQUETO: TFloatField;
    QBoletoAPICOD_BANCO: TIntegerField;
    QBoletoAPICOD_AGENCIA: TIntegerField;
    QBoletoAPICOD_CONTABIL_VALOR_FILIAL: TStringField;
    QBoletoAPINUM_INSCR_CEDENTE: TFloatField;
    QBoletoAPIPREFIXO_AGENCIA: TIntegerField;
    QBoletoAPIDIGITO_VERIFICADOR_AGENCIA: TStringField;
    QBoletoAPINUM_COD_EMPRESA: TFloatField;
    QBoletoAPICOD_COBRANCA: TIntegerField;
    QBoletoAPICODIGO_CEDENTE: TFloatField;
    QBoletoAPIDIGITO_VERIFICADOR_CEDENTE: TStringField;
    QBoletoAPINUM_CONVENIO: TFloatField;
    QBoletoAPICOD_CONVENENTE_LIDER: TFloatField;
    QBoletoAPINOSSO_NUMERO: TFloatField;
    QBoletoAPIDIGITO_VERIFICADOR_N_NR: TStringField;
    QBoletoAPIDIG_VERIFICADOR_AGENCIA_CONTA: TStringField;
    QBoletoAPIDESC_FILIAL: TStringField;
    QBoletoAPICOD_FILIAL: TIntegerField;
    QBoletoAPINUM_CGC: TStringField;
    QBoletoAPICOD_CONVENIO_CUSTODIA: TFloatField;
    QBoletoAPICOD_FORMA_CADAST_BANCO: TStringField;
    QBoletoAPICOD_TIPO_DOCUMENTO: TStringField;
    QBoletoAPICOD_IDENTIF_EMISSAO_BLOQUETO: TStringField;
    QBoletoAPICOD_IDENTIF_DISTRIBUICAO: TStringField;
    QBoletoAPICOD_IDENTIF_ACEITO: TStringField;
    QBoletoAPICOD_PROTESTO: TStringField;
    QBoletoAPIVAL_MULTA: TFloatField;
    QBoletoAPICOD_IDENTIF_TIPO_BOLETO: TStringField;
    QBoletoAPIPERC_TAXA: TFloatField;
    QBoletoAPIPERC_JURO_MORA: TFloatField;
    QBoletoAPIDESC_CHAVE_ACESSO: TStringField;
    QBoletoAPIDESC_CHAVE_API_BOLETO: TStringField;
    QBoletoAPIIND_API_BOLETO: TStringField;
    QBoletoAPIDESC_LINHA_DIGITAVEL: TStringField;
    QBoletoAPIDESC_COPIA_COLA: TStringField;
    QBoletoAPIIND_WEB_API: TStringField;
    QBoletoAPIDESC_CODIGO_BARRAS: TStringField;
    QBoletoAPICOD_NOTA_CAB: TIntegerField;
    QBoletoAPIDESC_KEY_USER_HOM: TStringField;
    QBoletoAPIDESC_KEY_USER_PROD: TStringField;
    QBoletoAPIDESC_TXID: TStringField;
    QItemNFVAL_IBS_MUN: TFloatField;
    QItemNFVAL_IBS_EST: TFloatField;
    QItemNFVAL_CBS: TFloatField;
    QItemNFVAL_IS: TFloatField;
    QNotaSaidaVAL_IBS_TOTAL: TFloatField;
    QNotaSaidaVAL_CBS_TOTAL: TFloatField;
    QNotaSaidaVAL_IS_TOTAL: TFloatField;
    QSomaItemNotaSVAL_IBS_MUN: TFloatField;
    QSomaItemNotaSVAL_IBS_EST: TFloatField;
    QSomaItemNotaSVAL_CBS: TFloatField;
    QSomaItemNotaSVAL_BC_IBS_CBS: TFloatField;
    QItemNFVAL_BC_IBS_CBS: TFloatField;
    QNotaSaidaNUM_ART: TStringField;
    QContaReceberPERC_DESC_ADIANTAMENTO: TFloatField;
    QSomaPagamentosVAL_CONV: TFloatField;
    QPagamentoDESC_PAGAMENTO: TStringField;
    QTituloFaturamento: TOracleDataSet1;
    QTituloFaturamentoCOD_NOTA_CAB: TIntegerField;
    QTituloFaturamentoCOD_FILIAL: TIntegerField;
    QTituloFaturamentoCOD_CADASTRO: TIntegerField;
    QTituloFaturamentoNUM_NOTA: TIntegerField;
    QTituloFaturamentoDT_EMISSAO: TDateTimeField;
    QTituloFaturamentoCOD_SERIE: TStringField;
    QTituloFaturamentoIND_CONDICAO_PAGTO: TStringField;
    QTituloFaturamentoVL_TOTAL: TFloatField;
    QTituloFaturamentoX: TStringField;
    QTituloFaturamentoItens: TOracleDataSet1;
    QTituloFaturamentoItensCOD_NOTA_ITEM: TIntegerField;
    QTituloFaturamentoItensDESC_PRODUTO: TStringField;
    QTituloFaturamentoItensQT_QUANTIDADE: TFloatField;
    QTituloFaturamentoItensVAL_UNITARIO: TFloatField;
    QTituloFaturamentoItensVAL_TOTAL: TFloatField;
    QTituloFaturamentoQTD_ITENS: TFloatField;
    QTituloFaturamentoItensROWNUM: TFloatField;
    QTituloFaturamentoItensCOD_PRODUTO: TFloatField;
    QBoletoAPIDESC_E_MAIL1: TStringField;
    QItemNFNUM_CLASS_TRIB_IBS_CBS: TStringField;
    QItemNFNUM_CST_IBS_CBS: TStringField;
    QItemNF_CalcFieldsPERC_CBS: TFloatField;
    QItemNF_CalcFieldsPERC_IBS_MUN: TFloatField;
    QItemNF_CalcFieldsPERC_IBS_UF: TFloatField;
    QItemNF_CalcFieldsPERC_REDUCAO_IBS: TIntegerField;
    QItemNF_CalcFieldsPERC_REDUCAO_CBS: TIntegerField;
    QClassTribIbsCbs: TOracleDataSet1;
    DSClassTribIbsCbs: TDataSource;
    QClassTribIbsCbsCOD_CLASS_TRIB: TIntegerField;
    QClassTribIbsCbsNUM_CLASS_TRIB: TStringField;
    QClassTribIbsCbsCOD_CST_IBS_CBS: TIntegerField;
    QClassTribIbsCbsNOME_CLASS_TRIB: TStringField;
    QClassTribIbsCbsDESCRICAO: TStringField;
    QItemNF_CalcFieldsIND_GRUPO_TRIB_REGULAR: TStringField;
    QItemNFNUM_CLASS_TRIB_IBS_CBS_REGULAR: TStringField;
    QItemNFNUM_CST_IBS_CBS_REGULAR: TStringField;
    QItemNFVAL_IBS_MUN_REGULAR: TFloatField;
    QItemNFVAL_IBS_EST_REGULAR: TFloatField;
    QItemNFVAL_CBS_REGULAR: TFloatField;
{    QLancamentoCartaoCons: TOracleDataSet;
    QLancamentoCartaoConsCOD_LANCAMENTO_CARTAO: TIntegerField;
    QLancamentoCartaoConsCOD_BANCO_AGENCIA: TIntegerField;
    QLancamentoCartaoConsCOD_NOTA_CAB: TIntegerField;
    QLancamentoCartaoConsDT_EMISSAO: TDateTimeField;
    QLancamentoCartaoConsDT_RECEBIMENTO: TDateTimeField;
    QLancamentoCartaoConsDESC_BANDEIRA: TStringField;
    QLancamentoCartaoConsNUM_PARCELA: TIntegerField;
    QLancamentoCartaoConsVAL_ORIGINAL: TFloatField;
    QLancamentoCartaoConsNUM_PARCELAS: TIntegerField;
    QLancamentoCartaoConsPERC_TAXA: TFloatField;
    QLancamentoCartaoConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    DSLancamentoCartaoCons: TDataSource;}
    procedure QNotaSaidaAfterEdit(DataSet: TDataSet);
    procedure QNotaSaidaAfterCancel(DataSet: TDataSet);
    procedure QNotaSaidaAfterInsert(DataSet: TDataSet);
    procedure QNotaSaidaAfterPost(DataSet: TDataSet);
    procedure BloqueiaVenda(Sender: TObject);
    procedure QNotaSaidaBeforeInsert(DataSet: TDataSet);
    procedure QItemNFAfterInsert(DataSet: TDataSet);
    procedure QItemNFAfterPost(DataSet: TDataSet);
    procedure QItemNFBeforeDelete(DataSet: TDataSet);
    procedure QItemNFBeforeEdit(DataSet: TDataSet);
    procedure QItemNFBeforeInsert(DataSet: TDataSet);
    procedure QItemNFBeforePost(DataSet: TDataSet);
    procedure QBaixaAuxAfterPost(DataSet: TDataSet);
    procedure QBaixaAuxBeforeDelete(DataSet: TDataSet);
    procedure QBaixaAuxBeforeEdit(DataSet: TDataSet);
    procedure QNFE_EmiteCalcFields(DataSet: TDataSet);
    procedure QItemNFQT_QUANTIDADEValidate(Sender: TField);
    procedure QItemNFCOD_PRODUTOValidate(Sender: TField);
    procedure QItemNFCalcFields(DataSet: TDataSet);
    procedure QNotaSaidaBeforePost(DataSet: TDataSet);
    procedure QSomaItemNotaCalcFields(DataSet: TDataSet);
    procedure QNotaSaidaCOD_CADASTROValidate(Sender: TField);
    procedure QNotaSaidaVAL_DESPESASValidate(Sender: TField);
    procedure QItemNFAfterDelete(DataSet: TDataSet);
    procedure QNotaSaidaBeforeEdit(DataSet: TDataSet);
    procedure QNotaSaidaVAL_FRETEValidate(Sender: TField);
    procedure QItemNFPERC_DESCONTOValidate(Sender: TField);
    procedure QItemNFVAL_DESCONTOValidate(Sender: TField);
    procedure QItemNFVAL_DESPESASValidate(Sender: TField);
    procedure QNotaSaidaCOD_TRANSPORTADORValidate(Sender: TField);
    procedure QNotaSaidaAfterOpen(DataSet: TDataSet);
    procedure QNotaSaidaBeforeDelete(DataSet: TDataSet);
    procedure QNotaSaidaAfterDelete(DataSet: TDataSet);
    procedure QNotaSaidaDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QDesdobramento_ClasparAfterInsert(DataSet: TDataSet);
    procedure QItemNFCOD_LOTE_TIPOValidate(Sender: TField);
    procedure DSItemNFUpdateData(Sender: TObject);
    procedure QItemNFVAL_UNITARIOValidate(Sender: TField);
    procedure QItemNFCOD_TRIBUTACAOChange(Sender: TField);
    procedure QNotaSaidaCOD_OPERACAOValidate(Sender: TField);
    procedure QNotaSaidaVAL_FRETE_TONChange(Sender: TField);
    procedure QNotaImpostoServicoBeforeDelete(DataSet: TDataSet);
    procedure QNotaImpostoServicoBeforeEdit(DataSet: TDataSet);
    procedure QNotaImpostoServicoBeforeInsert(DataSet: TDataSet);
    procedure QNotaImpostoServicoCalcFields(DataSet: TDataSet);
    procedure QNotaGNREBeforeDelete(DataSet: TDataSet);
    procedure QNotaGNREBeforeEdit(DataSet: TDataSet);
    procedure QNotaGNREBeforeInsert(DataSet: TDataSet);
    procedure QNotaGNRECalcFields(DataSet: TDataSet);
    procedure QNotaGNREAfterInsert(DataSet: TDataSet);
    procedure QNotaExpTipoDocAfterInsert(DataSet: TDataSet);
    procedure QNotaExpTipoDocBeforeDelete(DataSet: TDataSet);
    procedure QNotaExpTipoDocBeforeEdit(DataSet: TDataSet);
    procedure QNotaExpTipoDocBeforeInsert(DataSet: TDataSet);
    procedure QItemNFNUM_FABRICANTEChange(Sender: TField);
    procedure QItemNFCOD_PRODUTOChange(Sender: TField);
    procedure QRPedidoEspelhoCalcFields(DataSet: TDataSet);
    procedure QNotaSaidaCOD_NOTA_CAB_REFChange(Sender: TField);
    procedure U(Sender: TObject);
    procedure QNotaSaidaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QInfoCadastroCalcFields(DataSet: TDataSet);
    procedure QInfoCadastroPedidoCalcFields(DataSet: TDataSet);
    procedure QPedidoNotaAfterOpen(DataSet: TDataSet);
    procedure QNotaSaidaBeforeClose(DataSet: TDataSet);
    procedure QNotaSaidaCOD_FILIALValidate(Sender: TField);
    procedure QItemNFVAL_UNITARIOChange(Sender: TField);
    procedure QNotaSaidaConsCalcFields(DataSet: TDataSet);
    procedure QNotaSaidaCOD_OPERACAOChange(Sender: TField);
    procedure QNfeExportBeforeInsert(DataSet: TDataSet);
    procedure QPagamentoAfterInsert(DataSet: TDataSet);
    procedure QItemNFCOD_LOTE_TIPOChange(Sender: TField);
    procedure QNotaReferenciadaBeforeInsert(DataSet: TDataSet);
    procedure QItemNFAfterOpen(DataSet: TDataSet);
    procedure QNfeExportAfterInsert(DataSet: TDataSet);
    procedure QItemNFCOD_TABELA_PRECO_CABChange(Sender: TField);
    procedure QSomaValesCalcFields(DataSet: TDataSet);
    procedure QReceituarioOticoConsAfterScroll(DataSet: TDataSet);
    procedure QNotaSaidaCOD_VENDEDORValidate(Sender: TField);
    procedure QItemNFVAL_UNITARIO_COM_DESCONTOValidate(Sender: TField);
    procedure QItemNFVAL_UNITARIO_COM_DESCONTOChange(Sender: TField);
    procedure ErroValorVarejoAtacado(wValVarejo, wValAtacado: string; mensagem: boolean);
    procedure DescontoItemFrenteCaixa(wValVarejo: string; mensagem: boolean);
    procedure QItemNFDESC_PRODUTOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QItemNFnome_produtoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
//    procedure ValidaPrecoTabela(Sender: TObject);

  private
    { Private declarations }
    fFormularioUsado: String;
    fDigitou_Manual: Boolean; // serve para calculo do icms quando true foi digitado manual o valor do icms na tela senao calcula
    fConfirmando: Boolean;
    fNotaNome: Boolean;
    fApagando: Boolean;
    fGravando: Boolean;
    fCC: Boolean;
    fCV: Boolean;
    fTR: Boolean;
    fCF: Boolean;
    fTRF: Boolean;
    fTRF2: Boolean;
    fDigitou_Desconto: Boolean;
    fCadastro: Integer;
    fVoltaConfirmacao: Boolean; // significa se esta voltando confirmação de notas true=sim false=nao
    fTrazPedido: Boolean; // significa se esta Trazendo pedidos true=sim false=nao
    fDiretoParaImpressora: Char; // imprime direto para a impressora
    CodFilial: integer;
    fRateouDesconto: boolean;
    fRecalculaItens: boolean;
    fValorNovoValeCompras: Double;
    fValorValeCompras: Double;
    fValorNovoValePresente: Double;
    fValorValePresente: Double;
    //fValesProdutos: TStringList;
    fLiberaPrecoNutripet: boolean;
    Finalidades: TVariantMap;
    fCodListaPreco: integer;
    fUtilizaListaPrecoTodosItens: boolean;
    fUtilizaListaPreco1Item: boolean;
    fMudancaOperacaoManual: boolean;
    wPedidoIt: TStringList;
    function TipoAtzNotaAux(wEntradaSaida: string): string;
    procedure RecalculaItens;
    procedure CalculaISS;
    //procedure Checar_preco;
    procedure AtualizaEstoqueComposicao(produto: Double; lote: string; tipo, operacao, filial: Integer; dataVenda: TDate; qtdAcumulada: Extended);
    procedure PopulaCalcFields;
    procedure UtilizaListaPrecoTodosItens;
  public
    { Public declarations }
    wLancCartaoIndividual : boolean;
    procedure CalculaICM;
    procedure Checar_preco;
    procedure CalculaItem; // IPI e Val_Total
    procedure GeraContaPagar(wListaParcela: TStrings; wFinalidade, wDepartamento: Integer);
    procedure GeraContaReceber(wListaParcela: TStrings; wFinalidade: Integer; wBancoAgencia, wDepartamento, wContaCorrente: string; wPercAntecip: Double = 0.00);
    procedure VoltaConfirmacao;
    procedure AtualizaEstoque(wTipoAtualizacao: Integer);
    procedure RateiaFrete;
    procedure AcertaValoresNota;
    procedure Contabiliza;
    procedure IncluiNotaAux;
    procedure VoltaCancelamento;
    procedure DesdobramentoClaspar;
    procedure DeletaItem;
    procedure Conhecimento_Frete(wCod_Nota_Cab, wNum_Conhecimento_Frete, wCod_Filial,
      wCod_Transportador, wCod_Operacao_Cf, wTrib_Frete: Integer; wVal_Pedagio, wVal_Icm_Frete, wVal_Frete_Ton, wVal_Frete: Real;
      wDesc_Placa, wDesc_Transportadora, wCod_Contrato_Vend: string; wDt_Emissao_Cf: TDateTime);
    procedure AtuCaixa(wVal_Movimento: Real; wTipo: string; wOperacao, wFilial, wDepartamento,
      wNumNota, wCadastro, wNotaCab, wOficinaCab: string; wDataMov: TDateTime);
    function ItemTr: Real;
    function VerificaNotaDigitada(TipoNota: string): Boolean;
    procedure ValidaContaPagar(wListaParcela: TStrings; wFinalidade: Integer);
    procedure AtuPedido(wTipoAtu: Integer);
    procedure SetaEmissao(wCodNota: Integer);
    procedure ChecaNota; // ClasPar
    procedure ExcluiNota;
    procedure AtuCPFunrural(wTipo: Integer);
    procedure MostraMsg(wCadastro: Integer);
    function GeraInfAdicionalItem(DataSetItem: TOracleDataset1): string;
    procedure InserePagamentoNFCe(Valor: Real; Descricao: String);
    procedure ConfirmaPagamentoNFCe();
    property pConfirmando: Boolean read fConfirmando write fConfirmando default False;
    property pNotaNome: Boolean read fNotaNome write fNotaNome default False;
    property pApagando: Boolean read fApagando write fApagando default False;
    property pGravando: Boolean read fGravando write fGravando default False;
    property pCC: Boolean read fCC write fCC default False;
    property pCV: Boolean read fCV write fCV default False;
    procedure AtualizaComissao(pDtInicial: TDateTime);
    property pTRF: Boolean read fTRF write fTRF default False; // nota fiscal de transferencia
    property pTRF2: Boolean read fTRF2 write fTRF2 default False; // nota fiscal de transferencia
    property pTR: Boolean read fTR write fTR default False;
    property pCF: Boolean read fCF write fCF default False;
    property pCadastro: Integer read fCadastro write fCadastro;
    property pVoltaConfirmacao: Boolean read fVoltaConfirmacao write fVoltaConfirmacao default False;
    property pTrazPedido: Boolean read fTrazPedido write fTrazPedido default False;
    property pDigitou_Desconto: Boolean read fDigitou_Desconto write fDigitou_Desconto default False;
    property pDigitou_Manual: Boolean read fDigitou_Manual write fDigitou_Manual default False;
    property pDiretoParaImpressora: Char read fDiretoParaImpressora write fDiretoParaImpressora default 'N';
    property pCodFilial: Integer read CodFilial write CodFilial;
    property pRateouDesconto: boolean read fRateouDesconto write fRateouDesconto default False;
    property pRecalculaItens: boolean read fRecalculaItens write fRecalculaItens default False;
    property pValorNovoValeCompras: Double read fValorNovoValeCompras write fValorNovoValeCompras;
    property pValorValeCompras: Double read fValorValeCompras write fValorValeCompras;
    property pValorNovoValePresente: Double read fValorNovoValePresente write fValorNovoValePresente;
    property pValorValePresente: Double read fValorValePresente write fValorValePresente;
    //property pValesProdutos: TStringList read fValesProdutos write fValesProdutos;
    procedure AcertaDesconto;
    procedure precoPorLote;
    function getMD5ArqConfig: String;
    function SituacaoTributaria(pTipo: string): string;
    function Contribuinte: boolean;
    property pCodListaPreco: integer read fCodListaPreco write fCodListaPreco;
    property pUtilizaListaPrecoTodosItens: boolean read fUtilizaListaPrecoTodosItens write fUtilizaListaPrecoTodosItens;
    property pUtilizaListaPreco1Item: boolean read fUtilizaListaPreco1Item write fUtilizaListaPreco1Item;
    procedure PrecoTabela;
    procedure GerenciaItensPorLote;
    property pLiberaPrecoNutripet: boolean read fLiberaPrecoNutripet write fLiberaprecoNutripet;
    property pMudancaOperacaoManual: boolean read fMudancaOperacaoManual write fMudancaOperacaoManual;
    function ValidaPrecoDonaBenta:String;
    procedure LancaCartao(wCodLancamento, wCodBancoAgencia, wCodNotaCab, wNumParcela, wNumParcelas : Integer; wDtEmissao, wDtRecebimento : TDate;
                          wDescBandeira : string;  wValOriginal, wPercTaxa : real);
    procedure LancaPagtoBancoPIX (wContaCorrente : string );
    property sFormularioUsado: String read fFormularioUsado write fFormularioUsado;
    // procedure GeraBoletoApi;
    // procedure ImprimeBoletoApi;

  end;

var
  DMNotaSaida: TDMNotaSaida;
  wTransportador, wPlaca, wTipo_Carta_Correcao, wObservacao: string;
  wCod_Transportador: Integer;
  wCont1: integer;
  wData: TDateTime;
  wCodPafInclusaoExclusao: String = '';

const
  SIT_NOTA_DIGITADA: string = '1';
  SIT_NOTA_CONFIRMADA: string = '2';
  SIT_NOTA_CANCELADA: string = '3';
  SIT_NOTA_DENEGADA: string = '4';

implementation

uses UOracle_cl, UUsuario_cl, UFinalidade_cl, UPlanilha_cl, UEstoque_cl,
  UTributacao_cl, UOperacao_cl, UPedido_cl, UCadastro_cl,
  UNotaEntrada_cl, UContasPagar_cl, UParamSistema_cl, USequencia_cl,
  UFilial_cl, UConhecimentoFrete_cl, USenha, UProduto_cl, UEstado_cl,
  USerie_cl, Ucontrato_cl, UMoeda_cl, UTipoLote_cl, UNfe_cl, UObra_cl,
  USpedValidacao, UImpressoraFiscal_cl, UImpressoraFiscal, Math, UBibVenda,
  UDevolucaoTroca_cl, DateUtils, UTMenuPrincipal, UTabelaPreco_cl, UBancoAgencia_cl,
  UCidade_cl;//,BoletoAPI;

{$R *.DFM}

procedure TDMNotaSaida.DSItemNFUpdateData(Sender: TObject);
begin
  QItemNF.AutoCalcFields := False;
end;

procedure TDMNotaSaida.QNotaSaidaAfterEdit(DataSet: TDataSet);
begin
  QNotaSaida.AutoCalcFields := False;
  QNotaSaidaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaSaidaDt_Usuario.Value := DMOracle.DataHoraServ;
end;

procedure TDMNotaSaida.QNotaSaidaAfterCancel(DataSet: TDataSet);
begin
  if not (pTR) and not (pTRF) then
    DMOracle.DBCemapa.RollBack;
  QNotaSaida.Close;
  QNotaSaida.Open;
end;

procedure TDMNotaSaida.QNotaSaidaAfterInsert(DataSet: TDataSet);
begin
  QNotaSaida.AutoCalcFields := False;
  QNotaSaidaInd_Entrada_Saida.Value := 'S';
  QNotaSaidaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaSaidaDt_Usuario.Value := DMOracle.DataHoraServ;
  QNotaSaidaDt_Movimento.Value := DMOracle.DataServ;
  QNotaSaidaInd_Situacao.Value := '1';
  QNotaSaidaDt_Emissao.Value := DMOracle.DataServ;
  QNotaSaidaDt_Recebimento.Value := DMOracle.DataServ;
  QNotaSaidaNum_Nota.Value := 0;
  QNotaSaidaCod_Transporte.Value := 1;
  if DMParamSistema.CodEmpresa = 'WERNER' then
    QNotaSaidaInd_Condicao_Pagto.Value := '2' //Werner precisa sempre a prazo. Flavio/Gellian. suporte(13582)
  else
    QNotaSaidaInd_Condicao_Pagto.Value := '1';
  QNotaSaidaCod_Filial.Value := DMUsuario.CodFilialUsuario;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') Then
   Begin
     QNotaSaidaIND_TIPO_FRETE.Value := 'FOB';
     QNotaSaidaInd_Condicao_Pagto.Value := '2';
   end
  else
    if (DMParamSistema.CodEmpresa = 'CONSTRUIR') Then
       QNotaSaidaIND_TIPO_FRETE.Value := 'FOB'
    Else
       QNotaSaidaIND_TIPO_FRETE.Value := 'SEM';

  QNotaSaidaVal_Despesas.Value := 0;
  QNotaSaidaVal_Frete.Value := 0;
  QNotaSaidaVal_Pedagio.Value := 0;
  QNotaSaidaVal_FunRural.Value := 0;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
  begin
    QNotaSaidaDesc_Transportadora.Value := wTransportador;
    QNotaSaidaDesc_Placa.Value := wPlaca;
    if wCod_Transportador > 0 then
       QNotaSaidaCod_Transportador.Value := wCod_Transportador;
  end;
  if DMUsuario.CodVendedorPadrao > 0 then
     QNotaSaidaCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
  if DMUsuario.CodDepartamentoUsuario > 0 then
     QNotaSaidaCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;
  if DMUsuario.CodOperacaoPadrao > 0 then
     QNotaSaidaCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
  if DMUsuario.CodClientePadrao > 0 then
     QNotaSaidaCod_Cadastro.Value := DMUsuario.CodClientePadrao;
  if DMUsuario.CodSeriePadrao <> '' then
     QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
  if DMUsuario.CodSerieModeloPadrao <> '' then
     QNotaSaidaCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MINIMART' then
     QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value,
      QNotaSaidaCOD_SERIE_MODELO.Value);
//  Pegar comissão do Cadastro do Vendedor - Forma Padrão - Djeison A. Selzlein 06/11/2013
//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
//    QNotaSaidaPerc_Comissao.Value := 3.5;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') Then
  begin
    if QNotaSaidaCOD_FILIAL.Value = 1 then
    begin
      QNotaSaidaOBS.Text := 'Substituicao Tributaria Conforme';
      QNotaSaidaOBS_COMPLEMENTO.Text := 'Art.536/I Decreto 1980 de 2007';
    end;
  end;
  QNotaSaida.AutoCalcFields := True;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
     QNotaSaidaCOD_SERIE.Value := '1';
  if DMParamSistema.CodEmpresa = 'TEMPER' then
     QNotaSaidaNUM_VOLUMES.Value := 0;
  {//--Condicao de pagamento ´a prazo´ para a Kreuz - Vanessa 09/10/2013
  if DMParamSistema.CodEmpresa = 'KREUZ' then
    QNotaSaidaInd_Condicao_Pagto.Value := '2';
  //--}
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
     if DMParamSistema.QParamSistemaDESC_MD5_ARQ_CONFIG.Value <> '' then
        QNotaSaidaDESC_MD5_CUPOM_FISCAL.Value :=
        DMParamSistema.QParamSistemaDESC_MD5_ARQ_CONFIG.Value;

  DMNotaSaida.pCodListaPreco := 0;
  pLiberaPrecoNutripet := false;
end;

procedure TDMNotaSaida.BloqueiaVenda(Sender: TObject);
var
  wLibera, wIndLibera : string;
begin
  inherited;

  if DMParamSistema.CodEmpresa = 'JASOL' then
  begin
    wIndLibera  := DMOracle.FastSelect('COD_CLASS_CADASTRO', 'TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    wLibera     := DMOracle.FastSelect('IND_VENDA', 'TB_CLASS_CADASTRO', 'COD_CLASS_CADASTRO = ' + wIndLibera);
    //wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(DmnotaSaida.QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));

    if (wLibera = 'N') then
      raise exception.Create('Classificação de Cliente sem permissão para Venda!');
  end;

end;

procedure TDMNotaSaida.QNotaSaidaAfterPost(DataSet: TDataSet);
var wCodigo: Real;
  wMensagem: string;
begin
  DMOracle.ValidaFilial(QNotaSaidaCOD_FILIAL.Text);
  wCodigo := QNotaSaidaCod_Nota_Cab.Value;
  QNotaSaida.Close;
  QNotaSaida.SetVariable('PK', wCodigo);
  QNotaSaida.Open;
  QNotaSaida.AutoCalcFields := True;
  wTransportador := QNotaSaidaDesc_Transportadora.Value;
  wPlaca := QNotaSaidaDesc_Placa.Value;
  wCod_Transportador := QNotaSaidaCod_Transportador.Value;
{Solicitado por João da Jasol (Kalce) para que não seja possível lançar notas para quem tem titulos em aberto, bloqueio total. Alex 05/01/2024}  
  if (DMParamSistema.CodEmpresa = 'JASOL') then
    DMNotaSaida.BloqueiaVenda(Self);
//  with DMParamSistema,DMOperacao do
//  begin
//    if QParamSistemaIND_PAF_ECF.Value = 'S' then
//    begin
//      QOperacao.Close;
//      QOperacao.SetVariable('PK',QNotaSaidaCOD_OPERACAO.Value);
//      QOperacao.Open;
//      if (QOperacaoIND_EMITE.Value = 'F') or
//        (QOperacaoIND_CUPOM_FISCAL.Value = 'S') then
//      begin
//        with DMImpressoraFiscal do
//        begin
//          QChecaMD5NotaCab.Close;
//          QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',
//            QNotaSaidaCOD_NOTA_CAB.Value);
//          QChecaMD5NotaCab.Open;
//          bib.GeraMD5Query(QChecaMD5NotaCab,'TB_NOTA_CAB',false);
//          bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//            False);
//        end;
//      end;
//    end;
//  end;

//  wMensagem := '';
 if (QNotaSaidaCOD_MENSAGEM.Text <> '') then
   QNotaSaidaCOD_MENSAGEM.Text := DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text)
 else
   DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Clear;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeInsert(DataSet: TDataSet);
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;
  pDigitou_Manual := False; // digitacao manual de valores de icms
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  pUtilizaListaPrecoTodosItens := false; // Inicializa propriedade com um valor
  pUtilizaListaPreco1Item := false; // Inicializa propriedade com um valor
end;

procedure TDMNotaSaida.QItemNFAfterInsert(DataSet: TDataSet);
var wCodTabelaPreco: integer;
  wValidadeTabelaPreco: string;
begin
  QItemNF.AutoCalcFields := False;
  QItemNFCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
  QItemNFPERC_IPI.Value := 0;
  QItemNFPERC_DESCONTO.Value := 0;
  QItemNFVAL_DESPESAS.Value := 0;
  QItemNFVAL_FRETE.Value := 0;
  QItemNFPERC_COMISSAO.Value := 0;
  QItemNF.AutoCalcFields := True;
  pDigitou_Desconto := False;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR') then
     QItemNFCOD_TRIBUTACAO.Value := 1;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRIPAR') then
    QItemNFCOD_CULTURA.Value := 1; // para abatedouro significa embalagem caixa para guia transito

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MERCADO' then
     QItemNFQT_QUANTIDADE.Clear;

  if pCodListaPreco > 0 then
    QItemNFCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;

  if pUtilizaListaPreco1Item then
  begin
    QItemNFCOD_TABELA_PRECO_CAB.Clear;
    pUtilizaListaPreco1Item := false;
  end;

  // No primeiro registro, deve inserir lista de preço do cadastro caso existir.
  if QItemNF.RecordCount = 0 then
  begin
    wCodTabelaPreco := StrToInt(DMOracle.FastSelect('NVL(COD_TABELA_PRECO_CAB, -1)', 'TB_CADASTRO'
      , 'COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text));
    if wCodTabelaPreco > 0 then
      QItemNFCOD_TABELA_PRECO_CAB.Value := wCodTabelaPreco;
  end;

  // Lista deve respeitar data de validade
  wValidadeTabelaPreco := '';
  wValidadeTabelaPreco := DMOracle.FastSelect('NVL(TO_CHAR(DT_VENCIMENTO_TABELA_PRECO),'+quotedStr('')+')',
    'TB_CADASTRO', 'COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text);
  if (trim(wValidadeTabelaPreco) <> '') and (strToDate(wValidadeTabelaPreco) < DMOracle.DataServ)
    and (not pUtilizaListaPrecoTodosItens) then
    QItemNFCOD_TABELA_PRECO_CAB.Clear;
end;

procedure TDMNotaSaida.QItemNFAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  QItemNF.AutoCalcFields := False;
  wCodigo := QItemNFCod_Nota_Item.Value;
  if pGravando = False then
  begin
    QItemNF.DisableControls;
    if (not pConfirmando) and (not pRecalculaItens) and (QItemNF.RecordCount < 2)then
    begin
     QNotaSaida.Post;
     QNotaSaida.Edit;
    end;
    QItemNF.Locate('COD_NOTA_ITEM', wCodigo, []);
    QSomaItemNota.Close;
    QSomaItemNota.Open;
    QItemNF.EnableControls;
//    with DMImpressoraFiscal do
//    begin
//      QChecaMD5NotaItem.Close;
//      QChecaMD5NotaItem.SetVariable('COD_NOTA_ITEM',QItemNFCOD_NOTA_ITEM.Value);
//      QChecaMD5NotaItem.Open;
//      bib.GeraMD5Query(QChecaMD5NotaItem,'TB_NOTA_ITEM',false);
//      bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//        False);
//    end;
  end;
//  QItemNF.AutoCalcFields:=True; 
  UtilizaListaPrecoTodosItens;
  pLiberaPrecoNutripet := false;
end;

procedure TDMNotaSaida.QItemNFBeforeDelete(DataSet: TDataSet);
var wComando: string;
wHrAtual : Real;
wVeiculo : integer;
begin
  if not pApagando then
  begin
    if QNotaSaida.State <> dsEdit then
      raise Exception.Create('Nota não está no modo de alteração!');
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Cancel;
    if QNotaSaidaCod_Nota_Conta_Corrente.Value > 0 then
      raise Exception.Create('Não é permitido excluir items de Nota de Conta Corrente!');
    // *** Calculo do FUNRURAL
    {QNotaSaidaVal_Funrural.Value := QNotaSaidaVal_Funrural.Value
                                   + DMNotaEntrada.CalculaFunrural(-1, QItemNFCod_Produto.Value,
                                    QNotaSaidaCod_Operacao.Value,
                                    QNotaSaidaCod_Cadastro.Value);
    }
  end;
  with DMOracle do
  begin
    
    if wPedidoIt = nil then
      wPedidoIt := TStringList.Create;
    wPedidoIt.Add(
      FastSelect('NVL(COD_PEDIDO_ITEM, 0)', 'TB_BAIXA_PEDIDO', 'COD_NOTA_ITEM = '
        + QItemNFCOD_NOTA_ITEM.Text)
    );

    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    wComando := 'DELETE FROM TB_BAIXA_PEDIDO';
    wComando := wComando + ' WHERE COD_NOTA_ITEM = ' + FloatToStr(QItemNFCod_Nota_Item.Value);
    QExecSQL.SQL.Add(wComando);
    QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    QItemNF.RefreshRecord;
  end;
  if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
        (DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO','COD_PRODUTO= '+DMNotaSaida.QItemNFCOD_PRODUTO.Text) = 'S')) then
  Begin
    wVeiculo := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_VEICULO FROM TB_DESPESA_RECUP','COD_NOTA_ITEM ='+QItemNFCOD_NOTA_ITEM.Text));
    if wVeiculo <> 0 then
    Begin
      DMOracle.ExecutaSql('DELETE FROM TB_DESPESA_RECUP WHERE COD_NOTA_ITEM = '+QItemNFCOD_NOTA_ITEM.Text);
      wHrAtual := StrToFLoat(DMOracle.BuscaNome('SELECT MAX(NUM_HORA_FIM) FROM TB_DESPESA_RECUP','COD_VEICULO ='+ IntToStr(wVeiculo)));
      DMOracle.ExecutaSql('UPDATE TB_VEICULO SET HR_ATUAL = '+FloatToStr(wHrAtual)+ 'WHERE COD_VEICULO = '+IntTOStr(wVeiculo));
    end;
  end;
  if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
        (DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C')) then
    Begin
      wVeiculo := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_VEICULO FROM TB_CUSTO_VEICULO_MOV','COD_NOTA_ITEM ='+QItemNFCOD_NOTA_ITEM.Text));
      if wVeiculo <> 0 then
        DMOracle.ExecutaSql('DELETE FROM TB_CUSTO_VEICULO_MOV WHERE COD_NOTA_ITEM = '+QItemNFCOD_NOTA_ITEM.Text);
    end;
end;

procedure TDMNotaSaida.QItemNFBeforeEdit(DataSet: TDataSet);
begin
  QItemNF.AutoCalcFields := False;
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');

  // *** Calculo do FUNRURAL
  {QNotaSaidaVal_Funrural.Value := QNotaSaidaVal_Funrural.Value
                                    + DMNotaEntrada.CalculaFunrural(-1, QItemNFCod_Produto.Value,
                                                      QNotaSaidaCod_Operacao.Value,
                                                      QNotaSaidaCod_Cadastro.Value);
  }
end;

function TDMNotaSaida.ValidaPrecoDonaBenta: String;
var
  wPreco, wDtInicioProm, wDtFimProm: string;
  wPrecoVar: Double;
begin
//solicitado por Dona Benta para que nao seja possível informar um preço menor do que o preço que esta cadastrado no produto.
//foi criado desta forma para que seja possível utilizar os preços de promoção que estão validos.
// Alex e Junior. 20/12/2021
  wPreco := '';
  wDtInicioProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_INI FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
  wDtFimProm    := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_FIN FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
  if wDtInicioProm <> '' then
  begin
    if (Date >= StrToDate(wDtInicioProm)) and (Date <= StrToDate(wDtFimProm)) then
      wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
  end;
  if (wPreco = '') or (wPreco = '0') then //indica que nao tem nenhuma promocao vigente da forma acima tabela
  begin
    wDtFimProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_FIN FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
    if wDtFimProm <> '' then
    begin
      if (Date <= StrToDate(wDtFimProm)) then
        wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO1 FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
    end;
  end;
  if Trim(wPreco) = '' then
  begin
     wPrecoVar := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCOD_PRODUTO.Value),True));
//Para operação de remessa não validar o preço de venda. Ficar igual ao da nota de compra. Alex 09/08/2023     
     if (DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO = ' + FloatToStr(DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value), True) = 'V') then
     begin
       if (QItemNFVAL_UNITARIO.Value < wPrecoVar) and (DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr
           (DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value), True) <> 'D') then
//if (QItemNFVAL_UNITARIO.Value < wPrecoVar) and  (QNotaSaidaIND_FINALIDADE_NFE.Text <> '4') then // Quando for Devolução de Mercadoria deve ser o preço de custo;
       begin
         DMNotaSaida.QItemNFVAL_UNITARIO.Value := wPrecoVar;
         raise Exception.Create('O valor unitário está abaixo do valor do produto!');
       end;
     end;
  end;
end;

procedure TDMNotaSaida.QItemNFBeforeInsert(DataSet: TDataSet);
Var wNrItens : Integer;
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
  wNrItens := DMParamSistema.QParamSistemaNum_Maximo_Itens_Nota.Value;
{  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') And  //PARA CREUZ SOMENTE CONSIDERAR PARA NOTA FISCAL FORMULARIO CONTINUO
     (QNotaSaidaCod_Serie.Value <> 'M1')  then
     wNrItens := 200;
  if wNrItens <> 0 then
    if (QItemNF.RecordCount + 1) > wNrItens then
      raise Exception.Create('Quantidade máxima de produtos por nota atingida');} // Junior e César. Não vimos serventia para esse código. 23/02/2022
{Jr Multipeças passou para o regime normal e precisa quando o cliente for consumidor final no PR que a tributação seja código 30. Alex 10/01/2025}
{  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') and (DMParamSistema.QParamSistemaDESC_EMPRESA.Value <> 'LZ MULTIPECAS') then
  begin
    with DMCadastro do
    begin
      if (QCadastroIND_CONSUMIDOR_FINAL.Value = 'S') and (QCadastroCOD_ESTADO.Value = 'PR') then
      begin
        QItemNFCOD_TRIBUTACAO.Value := 30;
        QItemNFCOD_CFOP.Value := 5405;
      end;
    end;
  end;}
end;

procedure TDMNotaSaida.QItemNFBeforePost(DataSet: TDataSet);
var
  wPisIsento,wCofinsIsento, wSt: Boolean;
  wSaldo, wCst, wCsosn, wTipoProduto, wListaServico : String;
  wNumParcelas, wQtdAtacado : integer;
  wValAtacado, wValVarejo, wPrecoPromocao, wSenhaAntiga, wPrivilegio, wClasseProduto : string;
  wPercDescMaximo : Double;
  wPedeDesconto : Boolean;
  wPercComissao, wPercComissaoTecnico, wValBasPisCofins : Double;
  vBC, vIBS, vCBS, vTotalOperacao: Currency;
  rBaseCBSIBS: Real;
  rCalculaImposto: TImpostosCalculados;
begin
  rBaseCBSIBS := 0;
  wPisIsento := false;
  wCofinsIsento := false;
  // ********* CALCULO DO DESCONTO *************
 // If (QItemNfQt_Quantidade.Value = 0) And
 //    (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') And
 //    (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GRASEL') And
 //   (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
 //    Raise Exception.Create ('Não é permitido Quantidade Zeros');
  QItemNF_CalcFields.Close;
  QItemNF_CalcFields.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
  QItemNF_CalcFields.Open;
  QItemNF.AutoCalcFields := False;

  if QItemNFCOD_PRODUTO.Text = '' then //permitia salvar o item apenas com as inf. adicionais do item. Junior 10/12/2021.
    raise Exception.Create('Obrigatório informar o produto.');

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GOLDEN' then //A pedido do Cesar. Vanessa 18/02/2016
     QitemNFPERC_COMISSAO.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR','COD_VENDEDOR='+QNotaSaidaCOD_VENDEDOR.Text);

  {if (DMParamSistema.CodEmpresa = 'KREUZ') then
     Checar_preco;}

  //DMTributacao.QTributacao.Close;
//  DMTributacao.QTributacao.SetVariable('Pk', QItemNFCod_Tributacao.Value);
//  DMTributacao.QTributacao.Open;

  {if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') and (QNotaSaidaCod_Estado.Value = 'PR') and
     (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then // foi separado no estoque produtos com e sem substituicao pelo lote // foi separado no estoque produtos com e sem substituicao pelo lote
  begin //Alterado o código pois a autopeças Diniz esta realizando vendas fora do estado através do mercado Livre
        // e neste caso é necessário alterar a tributação. - Alex - 15/07/2021
        //Autorizado por Cesar.
    if QItemNFCod_Lote_Tipo.Value = 1 then
      QItemNFCod_Tributacao.Value := 2
    else
      QItemNFCod_Tributacao.Value := 3;
  end;} // DINIZ SAIU DO SIMPLES E ESSA REGRA NÃO É APLICADA. JUNIOR 07/02/2023
  if ((QItemNFVAL_UNITARIO.Value = 0) or
      (QItemNFQT_QUANTIDADE.Value = 0)) and
     (QNotaSaidaIND_FINALIDADE_NFE.Value <> 2) and
     ((QNotaSaidaCOD_SERIE_MODELO.Value = '55') or
      (QNotaSaidaCOD_SERIE_MODELO.Value = '65') or
      ((QNotaSaidaCOD_SERIE.Value = 'PE') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'RACOESIGUA'))) then
    raise Exception.Create('Preencha o valor unitário e a quantidade do item: ' +
      DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text)+'.');

  //esta rotina é apenas para quando informado uma obra na nota
  // vai checar se a quantidade informada na nota foi liberado no contrato da obra
  //César 07/03/2017 - para SR
  If QNotaSaidaCOD_OBRA.Text <> '' Then
   Begin
     If (QItemNFQT_QUANTIDADE.Value > 0) Then
      Begin
        wSaldo :=DMOracle.Buscanome('SELECT qt_quantidade - qt_movimento from tb_obra_contrato_produto,tb_obra_contrato',
             'tb_obra_contrato_produto.cod_obra_contrato=tb_obra_contrato.cod_obra_contrato and Cod_Obra = '+QNotaSaidaCOD_OBRA.Text +
             ' and cod_produto='+QItemNFCod_Produto.Text);
        If wSaldo = ''  Then
           ShowMessage('Produto não liberado para esta obra')
        Else
           If QItemNFQT_QUANTIDADE.Value > StrToFloat(wSaldo) Then
              ShowMessage('Quantidade esta maior que saldo de contrato');
      End;
   End;
   // Calculo do INSS Adriel 20/09/2021
  QItemNFVAL_INSS.Value := ((QItemNFVal_Total.Value * QItemNF_CalcFieldsPERC_BC_NFSE.Value / 100) - ((QItemNFVal_Total.Value * QItemNF_CalcFieldsPERC_BC_NFSE.Value / 100) * QItemNF_CalcFieldsPERC_DEDUCAO_NFSE.Value / 100)) * QItemNFPERC_INSS.Value / 100;
  if (QNotaSaidaCOD_SERIE_MODELO.Value = '98') then
  begin
    wTipoProduto := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
    if (wTipoProduto = 'SERVIÇO') and
       (QItemNFPERC_IR.Value = 0) and
       (QItemNF_CalcFieldsIND_ISS_RETIDO.Value = 1) and
       (QItemNF_CalcFieldsIND_FISICA_JURIDICA.Value = 'J') then
    begin
      with DMFILIAL do
      begin
        if QFilial.Eof then
        begin
          QFilial.Close;
          QFilial.SetVariable('PK', QNotaSaidaCOD_FILIAL.Value);
          QFilial.Open;
        end;
        QItemNFPERC_IR.Value := QFilialPERC_IR_NFSE.Value;
        QItemNFPERC_CSLL.Value := QFilialPERC_CSLL_NFSE.Value;
      end;
    end;
{Criado para validar se o código da obra foi informado quando a lista de serviço exigir. Alex 28/08/2026}
    wListaServico := DMOracle.FastSelect('COD_LISTA_SERVICO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
    wListaServico := Trim(wListaServico);
    wListaServico := FormatFloat('000000', StrToIntDef(wListaServico, 0));
    if Pos(',' + wListaServico + ',',',070201,070202,070401,070501,070502,070601,070602,' +
                 '070701,070801,071701,071901,141403,141404,') > 0 then
    begin
      if Trim(QNotaSaidaNUM_DCO.Text) = '' then
      begin
        ShowMessage('Para esta lista de serviço informada, a PREFEITURA exige o preenchimento dos dados da obra.' + #13#10 +
                  'Informe o código ou o número do cadastro da obra no cabeçalho da nota no campo DCO e tente novamente.' + #13#10 +
                  'Caso tenha dúvida sobre o código/número da obra, entre em contato com o seu Contador.');
        abort;
      end;
    end;

  end;
  QItemNFVAL_IR.Value := QItemNFVAL_TOTAL.Value * QItemNFPERC_IR.Value /100;
  QItemNFVAL_CSLL.Value := QItemNFVAL_TOTAL.Value * QItemNFPERC_CSLL.Value /100;
  if (pConfirmando = False) then
  begin
    CalculaItem
    // **** Calculo do ICM ****
  end
  else
  begin
    if QSomaItemNota.Eof then
    begin
      QSomaItemNota.Close;
      QSomaItemNota.Open;
    end;
    if QSomaItemNotaSVal_Total.Value <> 0 then
    begin
      if (QNotaSaidaVAL_DESCONTO.Value <> 0) and not (pDigitou_Manual) then
        QItemNFVal_ICM_Base.Value := 0;

      CalculaICM;
      CalculaISS;

      // Se CST for de isenção não deve calcular pis e cofins
      wPisIsento := (QItemNFCOD_CST_PIS.Value = '') or
                      (StrToInt(QItemNFCOD_CST_PIS.Value) in [4,6,7,8,9,49]);
      wCofinsIsento := (QItemNFCOD_CST_COFINS.Value = '') or
                         (StrToInt(QItemNFCOD_CST_COFINS.Value) in [4,6,7,8,9,49]);

      // Se for informado PIS ou COFINS na aba Impostos Serviços não deve calcular pis e cofins
      if not QNotaImpostoServico.eof then
      begin
        QNotaImpostoServico.First;
        while not QNotaImpostoServico.Eof do
        begin
          if pos('PIS', QNotaImpostoServicodesc_imposto.Value) > 0 then
          begin
            wPisIsento := true;
            break;
          end;
          QNotaImpostoServico.Next;
        end;
        QNotaImpostoServico.First;
        while not QNotaImpostoServico.Eof do
        begin
          if pos('COFINS', QNotaImpostoServicodesc_imposto.Value) > 0 then
          begin
            wCofinsIsento := true;
            break;
          end;
          QNotaImpostoServico.Next;
        end;
        QNotaImpostoServico.First;
      end;

      // Variável para gravar o valor do frete na base de cálculo do PIS/COFINS
      wValBasPisCofins := 0;

      if ((QNotaSaidaIND_TIPO_FRETE.Value = 'CIF') OR (QNotaSaidaIND_TIPO_FRETE.Value = 'REM')) then
      begin                                                                    
        wValBasPisCofins := QItemNFVAL_FRETE.Value;
      end;

      if DMOperacao.QOperacaoPERC_BASE_PIS.Value > 0 then
      begin
        QItemNFVal_Pis.Value := RoundTo((RoundTo(wValBasPisCofins + QItemNFVal_Total.Value - QItemNFVal_Icm.Value -
            (QItemNFVal_Desconto.Value * QItemNFQT_QUANTIDADE.Value) -
            QItemNFVAL_DESCONTO_RATEIO.Value,-2) *
            DMParamSistema.QParamSistemaPerc_Pis.Value *
            (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) / 100,-2);
        if DMOracle.BuscaNome('SELECT COD_INC_TRIB FROM TB_FILIAL','COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) =
          '2' then
        begin
          QItemNFVal_Pis.Value := RoundTo(
            //(RoundTo(QItemNFVAL_TOTAL.Value - QItemNFVAL_IPI.Value - QItemNFVAL_ICMS_SUBST.Value,-2) *
            ((RoundTo(wValBasPisCofins + QItemNFVAL_TOTAL.Value,-2)  - QItemNFVal_Icm.Value -
            (QItemNFVal_Desconto.Value * QItemNFQT_QUANTIDADE.Value) -
            QItemNFVAL_DESCONTO_RATEIO.Value) *
            DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) *
            DMParamSistema.QParamSistemaPerc_Pis.Value
             / 100, -2);
        end;

        //QItemNFVAL_PIS.Value :=
//          BibVenda.PersonalizaBCPisCofins(
//            DMParamSistema.QParamSistemaCOD_EMPRESA.Value
//            , QItemNFVAL_TOTAL.Value, QItemNFVAL_IPI.Value
//            , QItemNFVAL_ICMS_SUBST.Value
//            , DMOperacao.QOperacaoPERC_BASE_PIS.Value
//            , DMParamSistema.QParamSistemaPERC_PIS.Value
//            , QItemNFVAL_PIS.Value);

        if wPisIsento then
          QItemNFVAL_PIS.Value := 0;
      end
      else
        QItemNFVal_Pis.Value := 0;
      if DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 then
      begin
        QItemNFVal_Confins.Value := RoundTo((RoundTo(wValBasPisCofins + QItemNFVal_Total.Value  - QItemNFVal_Icm.Value - (QItemNFVal_Desconto.Value * QItemNFQT_QUANTIDADE.Value) -
            QItemNFVAL_DESCONTO_RATEIO.Value,-2) *
            DMParamSistema.QParamSistemaPerc_Cofins.Value *
            (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) / 100,-2);
        if DMOracle.BuscaNome('SELECT COD_INC_TRIB FROM TB_FILIAL','COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) =
          '2' then
        begin
          QItemNFVAL_CONFINS.Value := RoundTo(
            //(RoundTo(QItemNFVAL_TOTAL.Value - QItemNFVAL_IPI.Value - QItemNFVAL_ICMS_SUBST.Value,-2) *
            ((RoundTo(wValBasPisCofins + QItemNFVAL_TOTAL.Value,-2)  - QItemNFVal_Icm.Value -
            (QItemNFVal_Desconto.Value * QItemNFQT_QUANTIDADE.Value) -
            QItemNFVAL_DESCONTO_RATEIO.Value) *
            DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) *
            DMParamSistema.QParamSistemaPerc_Cofins.Value
             / 100,-2);
        end;

        //QItemNFVAL_CONFINS.Value :=
//          BibVenda.PersonalizaBCPisCofins(
//            DMParamSistema.QParamSistemaCOD_EMPRESA.Value
//            , QItemNFVAL_TOTAL.Value, QItemNFVAL_IPI.Value
//            , QItemNFVAL_ICMS_SUBST.Value
//            , DMOperacao.QOperacaoPERC_BASE_COFINS.Value
//            , DMParamSistema.QParamSistemaPERC_COFINS.Value
//            , QItemNFVAL_CONFINS.Value);

        if wCofinsIsento then
          QItemNFVAL_CONFINS.Value := 0;
      end
      else
        QItemNFVal_Confins.Value := 0;
    End;
  End;
  { * * * * * * * * * * * * * * * * * * ** * * * * * * * * * * * * * * * * *
      REALIZAÇÃO DO CÁLCULO DO IBS E CBS PARA 2026 - FASE DE TESTES CALCULANDO AS INFORMAÇÕES.
      NA NOTA PARA VALIDAÇÃO DURANTE O ANO E AJUSTANDO AS INFORMAÇÕES NO PERÍODO
      Adicionado ind_finalidade_nfe para quando for nota de devolução. Alex 14/09/2026
      Mudei para cá, nesse bloco tem o valor do PIS/CONFIS para retirar da base de cálculo do IBS Junior 20/10/2026
      * * * * * * * * * * * * * * * * * * ** * * * * * * * * * * * * * * * * * *
  }
  if ((QNotaSaidaIND_FINALIDADE_NFE.Value = 4) or
      not (QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value in [1, 2])) and
          (QItemNFNUM_CST_IBS_CBS.Value <> '410') and (QItemNFNUM_CST_IBS_CBS.Value <> '620') then
  begin
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK', QNotaSaidaCOD_CADASTRO.Value);
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



    rBaseCBSIBS := (QItemNFQT_QUANTIDADE.Value * QItemNFVAL_UNITARIO.Value) - QItemNFVAL_ICM.Value - QItemNFVAL_ICMS_SUBST.Value -  QItemNFVAL_ICMS_DIFERENCIAL.Value - QItemNFVAL_PIS.Value - QItemNFVAL_CONFINS.Value;
    rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                     QItemNF_CalcFieldsPERC_IBS_UF.Value, // aliquota estadual IBS
                                                     QItemNF_CalcFieldsPERC_IBS_MUN.Value, // aliquota municipal IBS
                                                     QItemNF_CalcFieldsPERC_CBS.Value, // aliquota CBS
                                                     0,    // imposto seletivo
                                                     QItemNFVAL_FRETE.Value,
                                                     0,  // seguro
                                                     QItemNFVAL_DESPESAS.Value,
                                                     QItemNFVAL_DESCONTO.Value);

    QItemNFVAL_IBS_MUN.Value := rCalculaImposto.vIBS_Mun;
    QItemNFVAL_IBS_EST.Value := rCalculaImposto.vIBS_Est;
    QItemNFVAL_CBS.Value := rCalculaImposto.vCBS;
    QItemNFVAL_BC_IBS_CBS.Value := rCalculaImposto.vBC;
    if QItemNF_CalcFieldsIND_GRUPO_TRIB_REGULAR.Value = '1' then
    begin
      QItemNFNUM_CST_IBS_CBS_REGULAR.Value := '000';
      QItemNFNUM_CLASS_TRIB_IBS_CBS_REGULAR.Value := '000001';
      rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                     0.1, // aliquota estadual IBS
                                                     0, // aliquota municipal IBS
                                                     0.9, // aliquota CBS
                                                     0,    // imposto seletivo
                                                     QItemNFVAL_FRETE.Value,
                                                     0,  // seguro
                                                     QItemNFVAL_DESPESAS.Value,
                                                     QItemNFVAL_DESCONTO.Value);
      QItemNFVAL_IBS_MUN_REGULAR.Value := rCalculaImposto.vIBS_Mun;
      QItemNFVAL_IBS_EST_REGULAR.Value := rCalculaImposto.vIBS_Est;
      QItemNFVAL_CBS_REGULAR.Value := rCalculaImposto.vCBS;
    end;
  end
  else
  begin
    QItemNFVAL_IBS_MUN.Value := 0;
    QItemNFVAL_IBS_EST.Value := 0;
    QItemNFVAL_CBS.Value := 0;
    QItemNFVAL_BC_IBS_CBS.Value := 0;
  end;

  if (DMParamSistema.CodEmpresa = 'DINIZ') and
               ( (Trim(QItemNFNUM_GENERO_NCM.Value) = '27101259') or (Trim(QItemNFNUM_GENERO_NCM.Value) = '22071090') or
                 (Trim(QItemNFNUM_GENERO_NCM.Value) = '27101921') or (Trim(QItemNFNUM_GENERO_NCM.Value) = '27101932') ) then //CFOP De lubrificantes precisa sair na CFOP 5656/6656
  begin
    if QNotaSaidaCOD_ESTADO.Value = 'PR' then //CFOP De lubrificantes precisa sair na CFOP 5656/6656
      if QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S' then
        QItemNFCOD_CFOP.Value := 5656
      else
        QItemNFCOD_CFOP.Value := 5655
    else
      if QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S' then
        QItemNFCOD_CFOP.Value := 6656
      else
        QItemNFCOD_CFOP.Value := 6655
  end;
  If (DMParamSistema.CodEmpresa = 'KREUZ') Then
   Begin
     If DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'V' Then
        If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 5922
        Else
           QItemNFCOD_CFOP.Value := 6922
     Else
       If (DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
          (DMNotaSAida.QNotaSaidaCOD_OPERACAO.Value = 41) or
          (DMNotaSAida.QNotaSaidaCOD_OPERACAO.Value = 82)  Then
       begin

        wClasseProduto := DMOracle.FastSelect('COD_CLASSE', 'TB_PRODUTO', 'COD_PRODUTO = '
          + QItemNFCOD_PRODUTO.Text);
        if (wClasseProduto = '147') or (wClasseProduto = '180') or (wClasseProduto = '181')
          or (wClasseProduto = '183') or (wClasseProduto = '191') or (wClasseProduto = '587')
          or (wClasseProduto = '605') or (wClasseProduto = '52') or (wClasseProduto = '55')
          or (wClasseProduto = '137') or (wClasseProduto = '146') or (wClasseProduto = '176')
          or (wClasseProduto = '402') or (wClasseProduto = '178') then
          QItemNFCOD_TRIBUTACAO.Value := 9;

        If QItemNFCod_Tributacao.Value = 20 Then  //isento. era 3 mudei para 20(Reg. Normal) - Junior 23/02/2022
          If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
             QItemNFCOD_CFOP.Value := 5102
          Else
             QItemNFCOD_CFOP.Value := 6102
        Else
          If QItemNFCod_Tributacao.Value = 9 Then  //substituicao
             If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
                QItemNFCOD_CFOP.Value := 5405
             Else
                QItemNFCOD_CFOP.Value := 6403;
       end;
//          Else                                                    // Alterado por Adriel e Vanessa em 24/08/2018
//             If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then  // Essas cfops 5656 e 6656 são para combustíveis.
//                QItemNFCOD_CFOP.Value := 5656
//             Else
//                QItemNFCOD_CFOP.Value := 6656;
     If DMOperacao.QOperacaoInd_Compras.Value = 'D' Then
      If QItemNFCod_Tributacao.Value = 20 Then  //isento era 3 mudei para 20(Reg. Normal) - Junior 23/02/2022
        If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 5202
        Else
           QItemNFCOD_CFOP.Value := 6202
      Else
        If QItemNFCod_Tributacao.Value = 9 Then  //substituicao
           If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
              QItemNFCOD_CFOP.Value := 5411
           Else
              QItemNFCOD_CFOP.Value := 6411;
   End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'BORGES')
    and (QItemNFCOD_CFOP.Text = '') Then
   Begin
     If DMOperacao.QOperacaoInd_Vendas.Value = 'V' Then
      If QItemNFCod_Tributacao.Value = 2 Then  //isento
        If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 5102
        Else
           QItemNFCOD_CFOP.Value := 6102
      Else
        If QItemNFCod_Tributacao.Value = 1 Then  //substituicao
           If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
              QItemNFCOD_CFOP.Value := 5405
           Else
              QItemNFCOD_CFOP.Value := 6403;
   End;
  {If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR')
      and (UpperCase(DMOperacao.QOperacaoDesc_Resumo.Text) <> 'LICENCA') Then  // PARA LICENÇA DE SOFTWARE MICROSOFT - CESAR
   Begin
     If DMOperacao.QOperacaoInd_Vendas.Value = 'V' Then
      If QItemNFCod_Tributacao.Value = 2 Then  //isento
        If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
           QItemNFCOD_CFOP.Value := 5102
        Else
           QItemNFCOD_CFOP.Value := 6102
      Else
        If QItemNFCod_Tributacao.Value = 9 Then  //substituicao
           If DMCadastro.QCadastroCOD_ESTADO.Value = 'PR' Then
              QItemNFCOD_CFOP.Value := 5405
           Else
              QItemNFCOD_CFOP.Value := 6403;
   End;}//Marcos solicitou para pegar a CFOP da operação Junior 29/04/2024
//   End; Marlise pediu para retirar dia 20/01/2015 - Vanessa 20/01/2015
   {Jr Multipeças passou para o regime normal e precisa quando o cliente for consumidor final no PR que a tributação seja código 30. Alex 10/01/2025 }
   {if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') and (DMParamSistema.QParamSistemaDESC_EMPRESA.Value <> 'LZ MULTIPECAS') then
   Begin
     If DMOperacao.QOperacaoInd_Vendas.Value = 'V' Then
     begin
       If (QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S') and (QNotaSaidaCOD_ESTADO.Value = 'PR') and
                   (DMOracle.BuscaNome('SELECT IND_SUBST_TRIB FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)) = 'SIM') Then
       begin
         QItemNFCOD_TRIBUTACAO.Value := 30;
         QItemNFCOD_CFOP.Value := 5405;
       end
       else if (QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S') and (QNotaSaidaCOD_ESTADO.Value <> 'PR') and
                   (DMOracle.BuscaNome('SELECT IND_SUBST_TRIB FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)) = 'SIM') then
          QItemNFCOD_CFOP.Value := 6404;
     end;
   End;}
//A Center Frio trabalha com 2 tipos de comissão, sobre peças e sobre serviço. foi separado para quando de peças buscar do perc_comissao1 do cadastro do vendedor
//e quando for serviço buscar do perc_comissao2.  Alex - 08/02/2022
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    wTipoProduto := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
     if (wTipoProduto = 'COMERCIAL') then
     begin
       wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_VENDEDOR.Text)));
       QItemNFPERC_COMISSAO.Value := wPercComissao;
     end
     else
     begin
       if (QNotaSaidaCOD_TECNICO.Text = '') then
         raise Exception.Create('Informar o Técnico para nota de Serviço')
       else
       begin
         wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO2 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_TECNICO.Text)));
         QItemNFPERC_COMISSAO.Value := wPercComissao;
       end;
     end;
  end;
{
  if (DMParamSistema.CodEmpresa = 'REFRISM') then
  begin
       wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO3 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_VENDEDOR.Text)));
       QItemNFPERC_COMISSAO.Value := wPercComissao;
  end;
 }

  if (DMParamSistema.CodEmpresa = 'REFRISM') then
  begin
       wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_VENDEDOR.Text)));
       QItemNFPERC_COMISSAO.Value := wPercComissao;
       if (QNotaSaidaCOD_TECNICO.Value > 0) then
       begin
         wPercComissaoTecnico :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_TECNICO.Text)));
         QItemNFPERC_COMISSAO.Value := wPercComissaoTecnico;
       end;
  end;

  if (DMParamSistema.CodEmpresa = 'INJEPAR') then //comissão diferente de peça e serviço
  begin
    wTipoProduto := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
    if (wTipoProduto <> 'SERVIÇO') then
    begin
      wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_VENDEDOR.Text)));
      QItemNFPERC_COMISSAO.Value := wPercComissao;
    end
    else
    begin
      wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO2 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QNotaSaidaCOD_VENDEDOR.Text)));
      QItemNFPERC_COMISSAO.Value := wPercComissao;
    end;
  end;

  if QItemNFPerc_Comissao.Value = 0 then
     QItemNFPerc_Comissao.Value := QNotaSaidaPerc_Comissao.Value;

  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and (QNotaSaidaCod_Departamento.Value <> 12) and (QNotaSaidaCod_Filial.Value < 90) then
    if ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') or (DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'S')) and (QNotaSaidaCod_Contrato_Vend.Text = '') then
    begin
      if (QItemNFPerc_Comissao.Text = '') or (QItemNFPerc_Comissao.Value = 0) then
        raise Exception.Create('Informar Percentual de Comissão do Vendedor');

      if (QItemNFCod_Cultura.Text = '') or (QItemNFCod_Cultura.Value = 0) then
        raise Exception.Create('Informar Cultura');
    end;

//  QItemNF.AutoCalcFields:=True;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
//    if (DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)) <> 'SERVIÇO') then
//      QItemNFCOD_CFOP.Value := 5405
//    else
//      QItemNFCOD_CFOP.Value := 5933;
    if (DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)) = 'SERVIÇO') then
      if QNotaSaidaCOD_ESTADO.Value = DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL', 'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text, True) then
        QItemNFCOD_CFOP.Value := 5933
      else
        QItemNFCOD_CFOP.Value := 6933;
    {QItemNFVAL_TOTAL.Value := (QItemNFQT_QUANTIDADE.Value) * (QItemNFVAL_UNITARIO.Value);
    if (QItemNFPERC_DESCONTO.Value > 0) then
    begin
      QItemNFVAL_DESCONTO.Value := QItemNFVAL_TOTAL.Value * QItemNFPERC_DESCONTO.Value / 100;  //linha adicionada por Adriel em 22/05/2012 para guardar o valor do desconto para Injepar
      QItemNFVAL_TOTAL.Value := QItemNFVAL_TOTAL.Value - QItemNFVAL_DESCONTO.Value;
    end;}
    //if (QItemNFVAL_DESCONTO.Value > 0) then
    //  QItemNFVAL_TOTAL.Value := QItemNFVAL_TOTAL.Value - QItemNFVAL_DESCONTO.Value;
  end;

  //QItemNFNUM_FABRICANTE.Value := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value), True);
  // Esta atribuição ao NUM_FABRICANTE foi colocada no evento validate do campo na query - QItemNFCodProduto
  // buncando melhorar a performance do sistema.
  if QItemNFDESC_INF_ADICIONAL.IsNull then
     QItemNFDESC_INF_ADICIONAL.Value := GeraInfAdicionalItem(QItemNF);

  if QNotaSaidaCOD_SERIE_MODELO.Value = '55' then //Para NF-e, deve-se limpar caracteres não aceitos.
  begin
    QItemNFDESC_INF_ADICIONAL.Value := StringReplace(QItemNFDESC_INF_ADICIONAL.Value,' \n ' + chr(13)+chr(10),chr(13)+chr(10),[rfReplaceAll]);
    QItemNFDESC_INF_ADICIONAL.Value := StringReplace(QItemNFDESC_INF_ADICIONAL.Value,chr(13)+chr(10),' \n ' + chr(13)+chr(10),[rfReplaceAll]);
    QItemNFDESC_INF_ADICIONAL.Value := DMNfe.LimpaStrXML(QItemNFDESC_INF_ADICIONAL.Value,chr(13)+chr(10));
  end;


  if (DMParamSistema.CodEmpresa = 'DONABENTA') then
    ValidaPrecoDonaBenta;


  //---------------------------------------------------------------------------------------
  //  Gian - 20/12/2018 à pedido da Dani da ferragens Medianeira, somente pra eles.
  //  Verificar o desconto concedido pelo usuario. Não deve ser menor que o preço de atacado.
  //  Autorizado por Marcos no dia 19/12/2018

  //---------------------------------------------------------------------------------------
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') and (not pConfirmando) then
  begin
    wPedeDesconto := True;
    //QItemNF.First;
    //while not QItemNF.EoF do
    //begin
      if wPedeDesconto then
      begin
        wValAtacado := DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        wValVarejo := DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        if wValAtacado <> '' then
        begin
          wPercDescMaximo := 100 - ((StrToFloat(wValAtacado)*100)/QItemNFVAL_UNITARIO.Value);
          if (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value)) or
            (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value - QItemNFVAL_DESCONTO.Value)) then
          begin
            if (DMUsuario.pTipoFuncionario <> 'GERENTE') then //Solic. Dani. Junior 03/02/2022. Não aparecer senha para usuarios Gerente. Suporte(4481)
            begin
              if FSenha = nil then
                FSenha := TFSenha.Create(Application);
              FSenha.BtConsProduto.Visible := True;
              FSenha.MeUsuario.Visible := True;
              FSenha.Label2.Visible := True;
              FSenha.CBOpcao.Visible := True;
              FSenha.CBOpcao.Caption := 'Autorizar quaisquer outros produtos.';
              FSenha.Caption := 'Conceder desconto: ' + QItemNFnome_produto.Text;
              FSenha.ShowModal;
              if FSenha.ModalResult = mrOk then
              begin
                wSenhaAntiga := Bib.Encode(UpperCase(FSenha.EdSenha.Text+Copy(wBranco,1,10-Length(FSenha.EdSenha.Text)))); //Criptografia da Cemapa para senha de usuario
                wPrivilegio := DMOracle.FastSelect('IND_PRIVILEGIO','TB_USUARIO',
                                              'COD_USUARIO = '+ QuotedStr(Trim(FSenha.MeUsuario.Text)) +
                                              ' AND DESC_SENHA = ' + QuotedStr(wSenhaAntiga));
                if ('P' <> wPrivilegio) then
                Begin
                  //para validar erro de valores entre varejo e atacado  - Cleber 14/10/2020
                  ErroValorVarejoAtacado(wValVarejo, wValAtacado, true);
                end
                else
                begin
                  if (wValAtacado > wValVarejo) then
                  begin
                    QItemNF.Delete;
                    ShowMessage('Valor de varejo menor que atacado! Procure a gerência! Varejo: ' +
                                 FormatFloat('R$ ###,###,##0.00', StrToFloat(wValVarejo)) +
                                 ' / Atacado: ' +
                                 FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));
                  end;
                end;
                if FSenha.CBOpcao.Checked = True then
                  wPedeDesconto := False;
              end
              else
              begin
              //para validar erro de valores entre varejo e atacado  - Cleber 14/10/2020
                ErroValorVarejoAtacado(wValVarejo, wValAtacado, false);
              end;
              FSenha.Release;
              FSenha := nil;
            end
            else   //else Não privilegiado e diferente de "GERENTE" Solic. Dani. Junior 03/02/2022
            begin
             if (wValAtacado > wValVarejo) then
             begin
               QItemNF.Delete;
               ShowMessage('Valor de varejo menor que atacado! Procure a gerência! Varejo: ' +
                           FormatFloat('R$ ###,###,##0.00', StrToFloat(wValVarejo)) +
                           ' / Atacado: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));
             end;
            end;
          end;
      end;
    end;
      //QItemNF.Next;
    //end;
  end;
 {
  if (DMParamSistema.CodEmpresa = 'DONABENTA') and not pConfirmando then
  begin
    wPedeDesconto := True;
      if wPedeDesconto then
      begin
        wValAtacado := DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        wValVarejo := DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        if wValAtacado <> '' then
        begin
          wPercDescMaximo := 100 - ((StrToFloat(wValAtacado)*100)/QItemNFVAL_UNITARIO.Value);
          if (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value)) or
            (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value - QItemNFVAL_DESCONTO.Value)) then
          begin
            if 'P' <> wPrivilegio then
            Begin
              //para validar erro de valores entre varejo e atacado  - Cleber 14/10/2020
              ErroValorVarejoAtacado(wValVarejo, wValAtacado, true);
            end
            else
            begin
              if (wValAtacado > wValVarejo) then
              begin
                QItemNF.Delete;
                ShowMessage('Valor de varejo menor que atacado! Procure a gerência! Varejo: ' +
                             FormatFloat('R$ ###,###,##0.00', StrToFloat(wValVarejo)) +
                             ' / Atacado: ' +
                             FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));
              end;
            end;
          if FSenha.CBOpcao.Checked = True then
             wPedeDesconto := False;
          end
          else
          begin
          //para validar erro de valores entre varejo e atacado  - Cleber 14/10/2020
            ErroValorVarejoAtacado(wValVarejo, wValAtacado, false);
          end;
            FSenha.Release;
            FSenha := nil;
      end;
    end;
  end;
  }
//  Cleber - 16/10/2019 por solicitação do João da Borges. Autorizado pelo Marcos.
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BORGES') and not pConfirmando then
  begin
    wPedeDesconto := True;
    //QItemNF.First;
    //while not QItemNF.EoF do
    //begin
      if wPedeDesconto then
      begin
        wValAtacado := DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        wValVarejo := DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        wPrecoPromocao :=  DMOracle.FastSelect('PRECO_PROMOCAO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);

        if (wValAtacado <> '') then
        begin
          if (wPrecoPromocao <> '0') then
            wPercDescMaximo := 100 - ((StrToFloat(wPrecoPromocao)*100)/QItemNFVAL_UNITARIO.Value)
          else
            wPercDescMaximo := 100 - ((StrToFloat(wValAtacado)*100)/QItemNFVAL_UNITARIO.Value);

          if (StrToFloat(wValAtacado) > QItemNFVAL_UNITARIO.Value) or
            (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value - QItemNFVAL_DESCONTO.Value)) then
          begin
            {
            if FSenha = nil then
              FSenha := TFSenha.Create(Application);
            FSenha.BtConsProduto.Visible := True;
            FSenha.MeUsuario.Visible := True;
            FSenha.Label2.Visible := True;
            FSenha.CBOpcao.Visible := True;
            FSenha.CBOpcao.Caption := 'Autorizar quaisquer outros produtos.';
            FSenha.Caption := 'Conceder desconto: ' + QItemNFnome_produto.Text;
            FSenha.ShowModal;
            wSenhaAntiga := Bib.Encode(UpperCase(FSenha.EdSenha.Text+Copy(wBranco,1,10-Length(FSenha.EdSenha.Text)))); //Criptografia da Cemapa para senha de usuario
            wPrivilegio := DMOracle.FastSelect('IND_PRIVILEGIO','TB_USUARIO',
                                          'COD_USUARIO = '+ QuotedStr(Trim(FSenha.MeUsuario.Text)) +
                                          ' AND DESC_SENHA = ' + QuotedStr(wSenhaAntiga));
            if ('P' <> wPrivilegio) and (wPrecoPromocao > '0') then}
            if (StrToFloat(wPrecoPromocao) > QItemNFVAL_UNITARIO.Value) then
            Begin
              QItemNFVAL_UNITARIO.Value := StrToFloat(wPrecoPromocao);
              QItemNFVAL_DESCONTO.Value := 0;
              QItemNFPERC_DESCONTO.Value := 0;
              ShowMessage('Sem permissão para salvar. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
                                    '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wPrecoPromocao)))
            end
            {else if ('P' <> wPrivilegio) then
            begin
              QItemNFVAL_UNITARIO.Value := StrToFloat(wValAtacado);
              QItemNFVAL_DESCONTO.Value := 0;
              QItemNFPERC_DESCONTO.Value := 0;

              ShowMessage('Item sem preço promocional. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
                                    '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));

            end
            else if (StrToFloat(wPrecoPromocao) > QItemNFVAL_UNITARIO.Value) then
            begin
              QItemNFVAL_UNITARIO.Value := StrToFloat(wValAtacado);
              QItemNFVAL_DESCONTO.Value := 0;
              QItemNFPERC_DESCONTO.Value := 0;
            if (wPrecoPromocao <> '0') then
              ShowMessage('Sem premissão para salvar. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
                                    '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wPrecoPromocao)))
            else
              ShowMessage('Sem premissão para salvar. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
                                    '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)))

            end;

            if FSenha.CBOpcao.Checked = True then
              wPedeDesconto := False;

              }
        end;
      end;
    end;
      //QItemNF.Next;
    //end;
  end;
{  wQtdAtacado := StrToInt('0'+DMOracle.FastSelect('QT_MIN_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
  if (wQtdAtacado > 0) and (QItemNFQT_QUANTIDADE.Value >= wQtdAtacado) then
    QItemNFVAL_UNITARIO.Value := StrToFloat (DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
}
  // busca o cfop para itens que possuem ST e que não tenham sido informados manualmente
  if (QItemNFCOD_CFOP.IsNull) and (not QItemNFCOD_TRIBUTACAO.IsNull) then
  begin

  //para itens provenientes do assitência técnica, QItemNF_CalcFields não é preenchido. Essas validações suprem temporariamente - CLEBER 11/01/2021
    wCst := IfThen(QItemNF_CalcFieldsDESC_SITUACAO_TRIB.Value <> '', QItemNF_CalcFieldsDESC_SITUACAO_TRIB.Value,
                           DMOracle.FastSelect('DESC_SITUACAO_TRIB', 'TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + QuotedStr(QItemNFCOD_TRIBUTACAO.Text)));

//para itens provenientes do assitência técnica, QItemNF_CalcFields não é preenchido. Essas validações suprem temporariamente - CLEBER 11/01/2021
    wCsosn := IfThen(QItemNF_CalcFieldsDESC_CSOSN.Value <> '', QItemNF_CalcFieldsDESC_CSOSN.Value,
                           DMOracle.FastSelect('DESC_CSOSN', 'TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + QuotedStr(QItemNFCOD_TRIBUTACAO.Text)));
    wSt := ((wCst = '010') or (wCst = '030') or (wCst = '070') or
      (wCsosn = '201') or (wCsosn = '202') or (wCsosn = '203'));
    if ((wSt) and (QNotaSaidaIND_CONSUMIDOR_FINAL.Value <> 'S')) or ((wCst = '060') or (wCsosn = '500')) then
    begin
      if ((QNotaSaidaCOD_ESTADO.Value = QItemNF_CalcFieldsESTADO_FILIAL.Value) or (QNotaSaidaCOD_ESTADO.Value = DMOracle.FastSelect('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text))) or
         (QNotaSaidaCOD_SERIE_MODELO.Value = '65') then
        //para itens provenientes do assitência técnica, QItemNF_CalcFields não é preenchido. Essas validações suprem temporariamente - CLEBER 11/01/2021
        QItemNFCOD_CFOP.Text := IfThen(QItemNF_CalcFieldsCOD_CFOP_ST.Text <> '', QItemNF_CalcFieldsCOD_CFOP_ST.Text,
                                             DMOracle.FastSelect('COD_CFOP_ST', 'TB_OPERACAO', 'COD_OPERACAO = ' + QuotedStr(QNotaSaidaCOD_OPERACAO.Text)))

      else
        //para itens provenientes do assitência técnica, QItemNF_CalcFields não é preenchido. Essas validações suprem temporariamente - CLEBER 11/01/2021
        QItemNFCOD_CFOP.Text := IfThen(QItemNF_CalcFieldsCOD_CFOP_INT_ST.Text <> '', QItemNF_CalcFieldsCOD_CFOP_INT_ST.Text,
                                             DMOracle.FastSelect('COD_CFOP_INT_ST', 'TB_OPERACAO', 'COD_OPERACAO = ' + QuotedStr(QNotaSaidaCOD_OPERACAO.Text)));

    end
    else
    begin
{Solicitado por Cleber, pois quando o produto não tem ST estava gravando vazio na tb_nota_item, gerando erro no Sped quando a nota possui produtos com St e
produtos sem St. Alex 14/04/2025}
      if ((QNotaSaidaCOD_ESTADO.Value = QItemNF_CalcFieldsESTADO_FILIAL.Value) or
          (QNotaSaidaCOD_ESTADO.Value = DMOracle.FastSelect('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text))) then
      begin
        QItemNFCOD_CFOP.Text := DMOracle.FastSelect('NUM_NATUREZA_EST_NOVO', 'TB_OPERACAO', 'COD_OPERACAO = ' + QuotedStr(QNotaSaidaCOD_OPERACAO.Text));
      end
      else
      begin
        QItemNFCOD_CFOP.Text := DMOracle.FastSelect('NUM_NATUREZA_INT_NOVO', 'TB_OPERACAO', 'COD_OPERACAO = ' + QuotedStr(QNotaSaidaCOD_OPERACAO.Text));
      end;
    end;
  end;
  pCodListaPreco := QItemNFCOD_TABELA_PRECO_CAB.Value;

  if QItemNFCOD_CST_PIS.Text = '' then
     QItemNFCOD_CST_PIS.Text := DMOracle.FastSelect('COD_CST_PIS_SAIDA', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(QItemNFCOD_PRODUTO.Text));

  if QItemNFCOD_CST_COFINS.Text = '' then
     QItemNFCOD_CST_COFINS.Text := DMOracle.FastSelect('COD_CST_COFINS_SAIDA', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(QItemNFCOD_PRODUTO.Text));


  //DEFINE O LOTE - DO PRODUTO CASO SEJA NOTA FISCAL = 1, SE PE = 2 - CLEBER 11/01/2021      - SOLICITAÇÃO MARCOS
 { if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ') then
  begin
    if ((QItemNF_CalcFieldsIND_EMITE.Value = 'F') or (DMOracle.FastSelect('IND_EMITE', 'TB_OPERACAO', 'COD_OPERACAO = ' + QuotedStr(IntToStr(QNotaSaidaCOD_OPERACAO.Value))) = 'F')) then
      QItemNFCOD_LOTE_TIPO.Value := 1
    else
    begin
      QItemNFCOD_LOTE_TIPO.Value := 2;
      QItemNFVAL_ICM_BASE.Value := 0;
      QItemNFVAL_ICM.Value := 0;
    end;
  end;   }
//A empresa Luci Luci tem duas filiais, cada uma terá um lote para separar os estoques, pois um estoque é em Medianeira (2) e outro em Foz (1). Alex 26/10/2023
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUCILUCI') then
  begin
    if (QNotaSaidaCOD_FILIAL.Value = 1) then
      QItemNFCOD_LOTE_TIPO.Value := 1
    else
      QItemNFCOD_LOTE_TIPO.Value := 2;
  end;

  QItemNFCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;

  // LOCAL PARA AJUSTE DOS CÁLCULOS CONSIDERANDO INCICIO DA NOVA LEGISLAÇÃO TRIBUTÁRIA
  // QUE ENTRA EM VALIDADE A PARTIR DE 01/01/2026
  // Reforma Tributária
  QItemNFNUM_CST_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CST_IBS_CBS FROM TB_CST_IBS_CBS', 'COD_CST_IBS_CBS = ' +
                                             '(SELECT COD_CST_IBS_CBS FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QItemNFCOD_TRIBUTACAO.Text + ')');
end;
//para validar erro de valores entre varejo e atacado  - Cleber 14/10/2020
procedure TDMNotaSaida.ErroValorVarejoAtacado(wValVarejo, wValAtacado: string; mensagem: boolean);
begin
  if (wValAtacado > wValVarejo)then
    QItemNF.Delete
  else
  begin
    QItemNFVAL_UNITARIO.Value := StrToFloat(wValVarejo);
    QItemNFVAL_DESCONTO.Value := 0;
    QItemNFPERC_DESCONTO.Value := 0;
    QItemNFval_total_com_desconto.Value := QItemNFVAL_UNITARIO.Value;
  end;
  if mensagem then
	  ShowMessage('Sem permissão para salvar. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
      '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));
end;

procedure TDMNotaSaida.DescontoItemFrenteCaixa(wValVarejo: string; mensagem: boolean);
var
  wValAtacado, wPrecoPromocao, wSenhaAntiga, wPrivilegio, wClasseProduto : string;
  wPercDescMaximo : Double;
  wPedeDesconto : Boolean;
begin
  if (not pConfirmando) then
  begin
    //wPedeDesconto := True;
    if wPedeDesconto then
    begin
      wValVarejo := DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
      if (QItemNFVAL_DESCONTO.Value <> 0) or (QItemNFPERC_DESCONTO.Value <> 0) then
      begin
      wPercDescMaximo := 100 - ((StrToFloat(wValVarejo)*100)/QItemNFVAL_UNITARIO.Value);
      if (DMUsuario.pTipoFuncionario <> 'GERENTE') then
      begin
       if FSenha = nil then
        FSenha := TFSenha.Create(Application);
      if FSenha.ShowModal = MrOk then
      begin
        if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        begin
          QItemNFVAL_DESCONTO.Value := 0;
          QItemNFPERC_DESCONTO.Value := 0;
          raise Exception.Create('Senha Incorreta.');
        end
        else
          Abort;
        end;
        FSenha.Release;
        FSenha := nil;
       end;
      end;
    end;
  end;
end;


procedure TDMNotaSaida.GeraContaPagar(wListaParcela: TStrings; wFinalidade, wDepartamento: Integer);
var wTotalParcelas: Currency; //era Real, dava pau na comparação
  wCont: Integer;
  wAux: string;
begin
  // Contas a Pagar do Frete
  wTotalParcelas := 0;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    wAux := Copy(wListaParcela[wCont], 11, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;
  QSomaItemNota.Close;
//  QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
  QSomaItemNota.Open;
  if wTotalParcelas <> QNotaSaidaVAL_FRETE.AsCurrency then
    raise Exception.Create('Soma das parcelas diferente do valor do Frete!');

  QContaPagar.Open;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    try
      QContaPagar.Insert;
      QContaPagarCOD_CONTA_PAGAR_CAB.Value := DMOracle.Sequencia('CONTA_PAGAR');
      QContaPagarCOD_FINALIDADE.Value := wFinalidade;
      QContaPagarCOD_CADASTRO.Value := QNotaSaidaCod_Transportador.Value;
      QContaPagarCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
      QContaPagarCOD_DEPARTAMENTO.Value := wDepartamento;
      QContaPagarNUM_TITULO.Value := QNotaSaidaNum_Nota.Value;
      QContaPagarNUM_PARCELA.Value := wCont + 1;
      QContaPagarDESC_TIPO_DOCUMENTO.Value := 'NF';
      QContaPagarDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
      QContaPagarDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont], 1, 10));
      QContaPagarDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
      if DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' then
        QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
      else
        QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;
      wAux := Copy(wListaParcela[wCont], 11, 15);
      wAux := Bib.LimpaString(wAux, '.');
      QContaPagarVAL_TITULO.Value := StrToFloat(wAux);
      QContaPagarCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
      QContaPagarIND_ACEITE.Value := 'NAO';
      QContaPagarIND_SITUACAO.Value := 'ABERTO';
      QContaPagarVAL_ORIGINAL.Value := QContaPagarVal_Titulo.Value;
      QContaPagar.Post;
      QContaPagarMov.Open;
      QContaPagarMov.Insert;
      QContaPagarMovCod_Conta_Pagar_Cab.Value := QContaPagarCod_Conta_Pagar_Cab.Value;
      QContaPagarMovCod_Conta_Pagar_Mov.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
      QContaPagarMovDt_Movimento.Value := DMOracle.DataServ;
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
  QContaPagarMov.Close;
  QContaPagar.Close;
end;

procedure TDMNotaSaida.GeraContaReceber(wListaParcela: TStrings; wFinalidade: Integer; wBancoAgencia, wDepartamento, wContaCorrente: string; wPercAntecip: Double = 0.00);
var wTotalParcelas, wDifer, wTotalNota: Real;
  wCont: Integer;
  wAux, wVal, wNumTitulo, wPed, wDescFunrural, wDescCadastro: string;
  wValImposto, wValISS: Real;
begin

  wTotalParcelas := 0;
  wValISS := 0;

  //Para publicar, descontar o valor de iss na primeira parcela do contas a receber se for regime especial de imposto - Marlon (06/2008)
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR') Then
     If  (DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO',
         'COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text) = 'SIM') then
     begin
       QItemNF.First;
       while not QItemNF.Eof do
       begin
         wValISS := wValISS + QItemNFVAL_ISS.Value;
         QItemNF.Next;
       end;
     end;

  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    wAux := Copy(wListaParcela[wCont], 11, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;

  //--------------------calcula o valor da soma dos impostos-------------
  wVal := '';
  wVal := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO', 'COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB.Text);
  wValImposto := StrToFloat(wVal);
  wVal := '';
  //------------------------------------

  {
    * Código comentado pois estava descontando o valor de imposto cadastrado na TB_NOTA_IMPOSTO_SERVICO
    * Desta forma estava gerando o contas a receber com valor abaixo do valor da nota
    * Se por algum motivo precisar gerar o contas a receber desta forma,
    * fale comigo (Marlon), antes de alterar.
    *(Notas com PIS e COFINS diferenciados estavam gerando valores errados)
  }
  //---------------------------------------------------------------------------------------------------
  wTotalNota := (QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVal_AVista.Value - fValorValeCompras - fValorValePresente);
  if (DMParamSistema.CodEmpresa = 'TOMATESMI') or (DMParamSistema.CodEmpresa = 'STEIN') or (DMParamSistema.CodEmpresa = 'VIDAVERDE') or
     (DMParamSistema.CodEmpresa = 'SCALA') then //Suporte: 8021. Junior 05/10/2023
  begin
    wDescFunrural := FormatFloat('0.00', wTotalNota * StrToFloat('0'+DMOracle.FastSelect('PERC_FUNRURAL','TB_CADASTRO','COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text))/100);
    wDescCadastro := FormatFloat('0.00', (wTotalNota  - StrToFloat(wDescFunrural)) * (StrToFloat('0'+DMOracle.FastSelect('PERC_DESCONTO','TB_CADASTRO','COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text))/100));
    wTotalNota :=   wTotalNota - StrToFloat(wDescFunrural) - StrToFloat(wDescCadastro);
  end;
  if wValImposto > 0 then
    if MessageDlg('Deseja que o valor total dos impostos seja descontado do valor total da nota?', mtConfirmation,
      [mbYes, mbNo],0) = mrYes then
      wTotalNota := (QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVal_AVista.Value - wValImposto - fValorValeCompras - fValorValePresente);

  wDifer := wTotalNota - wTotalParcelas; // - QNotaSaidaVal_Desconto.Value));
  if Abs(wDifer) <= 0.02 then
    wTotalParcelas := wTotalParcelas + wDifer;

  if (Abs(wTotalParcelas - wTotalNota) > 0.01) and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then // - QNotaSaidaVal_Desconto.Value)) > 0.01 then
    raise Exception.Create('Soma das parcelas diferente do valor total da Nota! (Parcelas: ' +
      FormatFloat('#,##0.00', wTotalParcelas) + ' Total: ' + FormatFloat('#,##0.00',
        wTotalNota) + ')');

  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    QContaReceber.Open;
    try
      QContaReceber.Insert;
      if wPercAntecip > 0 then
        QContaReceberPERC_DESC_ADIANTAMENTO.Value := wPercAntecip;  
      QContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
      QContaReceberCOD_FINALIDADE.Value := wFinalidade;
      if Trim(wBancoAgencia) <> '' then
        QContaReceberCOD_BANCO_AGENCIA.Value := StrToInt(Trim(wBancoAgencia));
      if PCadastro <> 0 then
        QContaReceberCOD_CADASTRO.Value := PCadastro // codigo da operadora cartão de crédito
      else
        QContaReceberCOD_CADASTRO.Value := QNotaSaidaCod_Cadastro.Value;
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
        (Trim(QNotaSaidaCod_Serie.Value) = 'PE') and
        (QNotaSaidaCod_Filial.Value < 90) then // quando lanca na filial 98 e 99 fica na propria filial
        if QNotaSaidaCod_Filial.Value = 9 then
          QContaReceberCOD_FILIAL.Value := 97
        else
          QContaReceberCOD_FILIAL.Value := 99
      else
        QContaReceberCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
      QContaReceberCOD_DEPARTAMENTO.Text := wDepartamento;

      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and ((wCont1 = 1) or (wCont1 = 2)) and
        (DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1')) then
      begin
        wNumTitulo := '8' + IntToStr(QNotaSaidaNum_Nota.Value);
        QContaReceberNUM_TITULO.Value := StrToInt(wNumTitulo);
      end
      else
        QContaReceberNUM_TITULO.Value := QNotaSaidaNum_Nota.Value;
      QContaReceberNUM_PARCELA.Value := wCont + 1;
      QContaReceberDESC_TIPO_DOCUMENTO.Value := QNotaSaidaCod_Serie.Value;
      QContaReceberDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
      // QContaReceberDT_BAIXA.Value : TDateTimeField;
      QContaReceberDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont], 1, 10));
      QContaReceberDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
      QContaReceberDT_CAPITALIZACAO_MOEDA.Value := QNotaSaidaDt_Emissao.Value;

      //Adicionar a o primeiro campo de OBS da Nota ao Titulo. A pedido da Vetro. Vanessa 29/09/2014
      if (DMParamSistema.CodEmpresa = 'VETRO') or (DMParamSistema.CodEmpresa= 'DINGLIS') or
         (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'REFRISM') then
        QContaReceberDESC_OBSERVACAO.Value := QNotaSaidaOBS.Value + QNotaSaidaOBS_COMPLEMENTO.Value;
      //

      with DMFinalidade do
      begin
        QFinalidade.Close;
        QFinalidade.SetVariable('PK', wFinalidade);
        QFinalidade.Open;
        if QFinalidadeInd_Encargo.Value = 'EMISSAO' then
          QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_EMISSAO.Value
        else
          QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_VENCIMENTO.Value;
      end;
      wAux := Copy(wListaParcela[wCont], 11, 15);
      wAux := Bib.LimpaString(wAux, '.');
      if (wCont = 0) and (wDifer <> 0) and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') and  ////Suporte: 8021. Junior 05/10/2023. add. <> TOMATESMI
                  ((DMParamSistema.CodEmpresa <> 'TOMATESMI') and (DMParamSistema.CodEmpresa <> 'STEIN') and (DMParamSistema.CodEmpresa <> 'VIDAVERDE') ) then  //para deixar lançar títulos
        wAux := FloatToStr(StrToFloat(wAux) + wDifer);                                      //com valor inferior ao da nota
                                                                                            //para NFC-e.
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont1 = 1) and
        (DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1')) then
      begin
        inc(wCont1);
        QContaReceberVAL_TITULO.Value := StrToFloat(wAux) - QSomaItemNotaSVAL_IPI.Value;
      end
      else
      begin
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR') and (wCont = 0) then //se for publicar e for 1 parcela, desconta wValISS
          QContaReceberVAL_TITULO.Value := strToFloat(wAux) - wValISS
        else
          QContaReceberVAL_TITULO.Value := StrToFloat(wAux);
      end;
      QContaReceberCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
      //QContaReceberDESC_OBSERVACAO.Value : TStringField;
      QContaReceberIND_ACEITE.Value := 'NAO';
      QContaReceberIND_SITUACAO.Value := 'ABERTO';
      QContaReceberVAL_ORIGINAL.Value := QContaReceberVal_Titulo.Value;
      QContaReceberPERC_COMISSAO.Value := QNotaSaidaPerc_Comissao.Value;
      QContaReceberCOD_VENDEDOR.Value := QNotaSaidaCod_Vendedor.Value;
      if QNotaSaidaCod_Contrato_Vend.Text <> '' then
         QContaReceberCOD_CONTRATO_VEND.Value := QNotaSaidaCod_Contrato_Vend.Value;
      if wContaCorrente <> '' then
         QContaReceberCod_Conta_Corrente.Value := StrToInt(Trim(wContaCorrente));
      QContaReceberCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QContaReceberDT_Usuario.Value := DMOracle.DataHoraServ;
      QContaReceber.Post;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
      begin
        if QContaReceberPERC_COMISSAO.Value > 0 then
        begin
          wPed := DMOracle.FastSelect('NUM_PEDIDO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QContaReceberCOD_NOTA_CAB.Text);

          QInsComissao.Close;
          QInsComissao.SetVariable('COD_CONTA_RECEBER_CAB', QContaReceberCOD_CONTA_RECEBER_CAB.Value);
//            if wPed <> '' then
//              QInsComissao.SetVariable('VAL_COMISSAO', StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + wPed + ' AND COD_FILIAL = ' + QContaReceberCOD_FILIAL.Text)))
          QInsComissao.SetVariable('VAL_COMISSAO', QContaReceberVal_Titulo.Value * QContaReceberPERC_COMISSAO.Value / 100);
          QInsComissao.SetVariable('DT_BAIXA', Null);
//            QInsComissao.SetVariable('COD_VENDEDOR', StrToInt(DMOracle.FastSelect('COD_VENDEDOR', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QContaReceberCOD_NOTA_CAB.Text)));
          QInsComissao.SetVariable('COD_VENDEDOR', QNotaSaidaCOD_VENDEDOR.Value);
          QInsComissao.ExecSQL;

        end;
      end;
//      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
//      begin
//        if QContaReceberNUM_PARCELA.Value = 1 then
//        begin
//          wPed := DMOracle.FastSelect('NUM_PEDIDO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QContaReceberCOD_NOTA_CAB.Text);
//          if wPed <> '' then
//          begin
//            QInsComissao.Close;
//            QInsComissao.SetVariable('COD_CONTA_RECEBER_CAB', QContaReceberCOD_CONTA_RECEBER_CAB.Value);
//            QInsComissao.SetVariable('VAL_COMISSAO', StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + wPed + ' AND COD_FILIAL = ' + QContaReceberCOD_FILIAL.Text)));
//            QInsComissao.SetVariable('DT_BAIXA', Null);
//            QInsComissao.SetVariable('COD_VENDEDOR', StrToInt(DMOracle.FastSelect('COD_VENDEDOR', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QContaReceberCOD_NOTA_CAB.Text)));
//            QInsComissao.ExecSQL;
//          end;
//        end;
//      end;
      QContaReceberMov.Open;
      QContaReceberMov.Insert;
      QContaReceberMovCod_Conta_Receber_Cab.Value := QContaReceberCod_Conta_Receber_Cab.Value;
      QContaReceberMovCod_Conta_Receber_Mov.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
      QContaReceberMovDt_Movimento.Value := QNotaSaidaDt_Emissao.Value;
      QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
      QContaReceberMovDT_Usuario.Value := DMOracle.DataHoraServ;
      QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      QContaReceberMovVal_Movimento.Value := QContaReceberVal_Titulo.Value;
      QContaReceberMov.Post;
    except
      if QContaReceberMov.State in [dsEdit, dsInsert] then
        QContaReceberMov.Cancel;
      if QContaReceber.State in [dsEdit, dsInsert] then
        QContaReceber.Cancel;
      raise;
    end;
  end;
  QContaReceberMov.Close;
  QContaReceber.Close;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont1 = 0) and
    (DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'B1')) then
  begin
    inc(wCont1);
    DMNotaSaida.GeraContaReceber(wListaParcela, 78, '3991421', '1', '26');
  end;
  wCont1 := 0;
end;

procedure TDMNotaSaida.VoltaConfirmacao;
var
  wComando, wSituacao, wCodTefCab: string;
  exec: TExecutador;
begin
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '2' then
    raise Exception.Create('Esta nota não foi confirmada!');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  if (wSituacao <> '') and (wSituacao <> '1') then
    raise Exception.Create('Esta nota Possui RPA Emitido - Não Foi possível voltar confirmação');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO_FRETE', 'COD_NOTA_CAB =' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  if (wSituacao <> '') and (wSituacao <> '1') then
    raise Exception.Create('Conhecimento de Frete já confirmado - Não Foi possível voltar confirmação da nota');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO', 'COD_NOTA_CAB =' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  if (wSituacao <> '') and (wSituacao <> '1')  and (wSituacao <> '3') then
    raise Exception.Create('Conhecimento de Frete já confirmado - Não Foi possível voltar confirmação da nota');

  // Volta a confirmação da nota de entrada para notas de transferência entre filiais
  // Que geram a nota de entrada confirmada. Ex: OTICA
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OTICA') and (QNotaSaidaCod_Nota_Cab_Trans_Ent.Text <> '') then
  begin
    exec := TExecutador.Create;
    exec.Adiciona('UPDATE TB_NOTA_CAB SET IND_SITUACAO = 1 WHERE COD_NOTA_CAB = '
      + QNotaSaidaCOD_NOTA_CAB_TRANS_ENT.Text);
    exec.Executar();
    exec.Fecha;
    exec.Free;
    exec := Nil;
    DMNotaEntrada.QNotaEntrada.Close;
    DMNotaEntrada.QNotaEntrada.SetVariable('PK', QNotaSaidaCOD_NOTA_CAB_TRANS_ENT.Value);
    DMNotaEntrada.QNotaEntrada.Open;
  end;

  if QNotaSaidaCod_Nota_Cab_Trans_Ent.Text <> '' then
  begin
    wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_NOTA_CAB ', 'COD_NOTA_CAB =' + FloatToStr(QNotaSaidaCod_Nota_Cab_Trans_Ent.Value));
    if (wSituacao <> '1') and (wSituacao <> '') then
      raise Exception.Create('Nota de entrada está confirmada ou cancelada');
  end;
  try
    pVoltaConfirmacao := True;
    if not (pCV) then
      DMOracle.DBCemapa.StartTransaction;
    // 1.Atualizar Nota Fiscal
    QAtzNota.Close;
    QAtzNota.SetVariable('COD_NOTA_CAB', QNotaSaidaCod_Nota_Cab.Value);
    QAtzNota.Open;
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('PK', QNotaSaidaCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    QAtzNota.Edit;
    QAtzNotaInd_Situacao.Value := '1'; // Digitada
    if (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '65') and (DMParamSistema.CodEmpresa <> 'ARISTIDES') then
      QAtzNotaIND_CONDICAO_PAGTO.Value := '3';
    if DMParamSistema.CodEmpresa = 'ARISTIDES' then
      QAtzNotaVal_Desconto.Value := 0;

    // 3.Voltar Conta Pagar
    try
      QContaPagar.Close;
      QContaPagar.Open;
      QContaPagarMov.Close;
      QContaPagarMov.Open;
      while not QContaPagar.Eof do
      begin
        if QContaPagarMovInd_Tipo_Movimento.Value <> '' then
        begin
          if (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
            raise Exception.Create('Conta a Pagar com baixas!')
          else
            QContaPagarMov.Delete;
        end;
        QContaPagar.Delete;
      end;
//      AtuCPFunrural(-1);
    except
      MessageDlg('Não foi possivel voltar Contas a Pagar!', mtWarning, [mbOk], 0);
      raise;
    end;
    QContaPagar.Close;
    QContaPagarMov.Close;

    // 4.Voltar Conta Receber
    try
      QContaReceber.Close;
      QContaReceber.Open;
      QContaReceberMov.Close;
      QContaReceberMov.Open;
      while not QContaReceber.Eof do
      begin
        if (TRIM(QContaReceberCOD_NOSSO_NUMERO.Text) <> '')then
        begin
          if MessageDlg('NOTA COM BOLETOS EMITIDOS!' + chr(13) +
            'Se voltar a confirmação desta nota os boletos serão excluídos do Sistema.' +
            Chr(13)+ 'Deseja realmente voltar a confirmação?', mtConfirmation , [mbyes,mbno],0) = mrno then
          exit;
        end;

        if (QContaReceberIND_ENVIADO_BANCO.Text = 'SIM')then
          raise Exception.Create('Boleto já enviado a banco!');
        if QContaReceberMovInd_Tipo_Movimento.Value <> '' then
        begin
          if (QContaReceberMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
            raise Exception.Create('Conta a Receber com baixas!')
          else
            QContaReceberMov.Delete;
        end;
        QContaReceber.Delete;
      end;
    except
      MessageDlg('Não foi possivel voltar Contas a Receber!', mtWarning, [mbOk], 0);
      raise;
    end;
    QAtzNota.Post;
    QContaReceber.Close;
    QContaReceberMov.Close;

    // 7.Voltar Futura
    QItemNF.First;
    while not QItemNF.Eof do
    begin
      QBaixaAux.Close;
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

      DMNotaEntrada.QVoltaSaldoFixado.Close;
      DMNotaEntrada.QVoltaSaldoFixado.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
      DMNotaEntrada.QVoltaSaldoFixado.ExecSQL;

      QVoltaReceita.Close;
      QVoltaReceita.Open;
      if not QVoltaReceita.Eof then
        QVoltaReceita.Delete;
      QVoltaReceita.Close;
      QItemNF.Next;
      QBaixaAux.Close;
      QNotaAuxItNF.Close;
    end;
    // 8.Descontabilizar
    DMPlanilha.DesContabiliza(QNotaSaidaCod_Nota_Cab.Value, 'NFS');

    // 9. Voltar Pedidos
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
      AtuPedido(-1);

    // 9. Voltar Caixa
    QCaixa.Close;
    QCaixa.Open;
    while not QCaixa.Eof do
      QCaixa.Delete;
    QCaixa.Close;

    // 2.Atualizar Estoque
    QNotaSaida.Close;
    QNotaSaida.Open;
//    QNotaSaida.Edit;
    DMNotaSaida.AtualizaEstoque(1);
//    QNotaSaida.Post;

    DMObra.QObra_Req_Cab.Close;
    DMObra.QObra_Req_Item.Close;
    DMObra.QObra_Req_Cab.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Obra_Req_Cab.Value);
    DMObra.QObra_Req_Cab.Open;
    if not (DMObra.QObra_Req_Cab.Eof) then
    begin
      DMObra.QObra_Req_Item.Open;
      while not (DMObra.QObra_Req_Item.Eof) do
        DMObra.QObra_Req_Item.Delete;
      DMObra.QObra_Req_Cab.Delete;
    end;
    DMObra.QObra_Req_Cab.Close;
    DMObra.QObra_Req_Item.Close;

    with DMOracle do
    begin
      DMNotaSaida.QNotaSaida.RefreshRecord;
      DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value), True);
      if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_PAGAMENTO SET IND_CONFIRMADO = '+QuotedStr('N');
        wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end
      else
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_PAGAMENTO WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;

        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_NOME_NOTA WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;

      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CONHECIMENTO_FRETE';
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      if DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Text <> '' then
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' + Chr(39) + 'A' + Chr(39);
        wComando := wComando + ' WHERE COD_ORDEM_CARREGAMENTO_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_BAIXA_FIDELIDADE';
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      // exclui cheques pre-datados lançados na nota fiscal
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_BCO_MOVIMENTO';
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
      begin // FOI COLOCADO ESTE ZERAMENTO DE VALOR DE DESCONTO PORQUE NO ARISTIDES O DESCONTO É CALCULADO PELA CONDICAO DE PAGAMENTO
        QExecSQL.SQL.Clear; // E ESTAVA DUPLICANDO O VALOR DO DESCONTO QUANDO VOLTAVA A CONFIRMACAO DE UMA NOTA E CONFIRMAVA NOVAMENTE
        wComando := 'UPDATE TB_NOTA_ITEM SET VAL_DESCONTO = 0 ';
        wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
    end;
    if not (pCV) then
      DMOracle.DBCemapa.Commit;
    pVoltaConfirmacao := False;
  except
    pVoltaConfirmacao := False;
    if not (pCV) then
      DMOracle.DBCemapa.RollBack;
    raise;
  end;
  //Para PAF-ECF
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  begin
    DMOracle.ExecutaSql('DELETE FROM TB_PAGAMENTO WHERE COD_NOTA_CAB = '+
        QNotaSaidaCOD_NOTA_CAB.Text,false);
      bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
      False);
  end;
end;

procedure TDMNotaSaida.AtualizaEstoque(wTipoAtualizacao: Integer);
var //wFilial_Estoque: Integer;
  wCustoItem, wRateioNota, wPercRatear, wCustoGrupo, wBaixa: Real;
  wTipoCusto, wAux, wVenda: string;
  wFilial, wFormula : Integer;
begin
  //Bib.Log('AtualizaEstoque - Inicio: ' + FormatDateTime('hh:nn:ss', now));
  //Deion controla estoque e custo pela filial 1. Junior 03/08/2018. Aut. Marcos.
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
    wFilial := 1
  else
    wFilial := QNotaSaidaCOD_FILIAL.Value;

  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA') and (not QNotaSaidaNUM_PEDIDO.IsNull) and (DMOracle.FastSelect('IND_TIPO_PEDIDO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) = 'M')) then // DEBONA (Pedido Composto / Produto Composto) - Diego Stiehl (20/12/2010)
  begin
    QPedidoNotaBaixar.Close;
    QPedidoNotaBaixar.SetVariable('COD_PEDIDO_CAB', DMOracle.FastSelect('COD_PEDIDO_CAB', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text));
    QPedidoNotaBaixar.Open;

    QPedidoNotaBaixar.First;
    while not QPedidoNotaBaixar.Eof do
    begin
      AtualizaEstoqueComposicao(QPedidoNotaBaixarCOD_PRODUTO_ITEM.Value,
        QPedidoNotaBaixarCOD_LOTE_TIPO_ITEM.Text,
        wTipoAtualizacao,
        QNotaSaidaCOD_OPERACAO.Value,
        wFilial, //QNotaSaidaCOD_FILIAL.Value,
        QNotaSaidaDT_EMISSAO.Value,
        QPedidoNotaBaixarQT_QUANTIDADE.Value);
      QPedidoNotaBaixar.Next;
    end;
  end
  else
  begin
  // Verificar Estoque      // RETIRADO PELO CÉSAR DIA 21/01/2000
    wPercRatear := 0;
    wRateioNota := (QNotaSaidaVal_Despesas.Value
      - QNotaSaidaval_Desconto.Value);
//  If QSomaItemNotaSVal_Total.Value = 0 Then
//     Raise Exception.Create ('Valor Total da Nota Não Pode Ser Zero');
    if QSomaItemNotaSVal_Total.Value <> 0 then
      wPercRatear := wRateioNota / QSomaItemNotaSVal_Total.Value;
    wTipoCusto := DMOracle.BuscaNome('SELECT IND_CUSTO_NOTA FROM TB_OPERACAO',
      'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), true);
    QItemNF.First;
    while not QItemNF.Eof do
    begin
   // Valor do Frete no Item já está sem ICM do Frete
      if Trim(wTipoCusto) = 'E' then // Nota Fiscal;
      begin
     //Atualiza custo do produto para a Divino. Alex 04/08/2022
        if (DMParamSistema.CodEmpresa = 'DIVINO') and (QItemNFCOD_FORMULA.Text <> '') then
        begin
          wFormula :=0;
          wFormula := strtoint(DMOracle.FastSelect('COD_FORMULA','TB_FORMULA','COD_FORMULA =' + QItemNFCOD_FORMULA.Text));
          wAux := '0';
          with DMPedido do
          begin
            QFormulaItem.close;
            QFormulaItem.SetVariable('COD_FORMULA',wFormula);
            QFormulaItem.Open;
            QFormulaItem.First;
            while not QFormulaItem.Eof do
            begin
              if DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO' then
                wAux := FloatToStr(StrToFloat(wAux) + (QItemNFQT_QUANTIDADE.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_ULTIMO_CUSTO.Value)
              else
                wAux := FloatToStr(StrToFloat(wAux) + (QItemNFQT_QUANTIDADE.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_CUSTO_MEDIO.Value);
              QFormulaItem.Next;
            end;
          end;
        end
//Solicitado por Dionatam para que calcule o custo. Alex 18/01/2023
        else if (DMParamSistema.CodEmpresa = 'RACOESIGUA') then
        begin
          if (DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO') then
            wAux := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
             'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)
             + ' AND COD_LOTE_TIPO = ' + FloatToStr(QItemNFCod_Lote_Tipo.Value)
             + ' AND COD_FILIAL = ' + FloatToStr(wFilial))
          else
            wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
             'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)
             + ' AND COD_LOTE_TIPO = ' + FloatToStr(QItemNFCod_Lote_Tipo.Value)
             + ' AND COD_FILIAL = ' + FloatToStr(wFilial));
        end
        else
        Begin
          wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
            'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)
            + ' AND COD_LOTE_TIPO = ' + FloatToStr(QItemNFCod_Lote_Tipo.Value)
            + ' AND COD_FILIAL = ' + FloatToStr(wFilial));//FloatToStr(QNotaSaidaCod_Filial.Value));
        end;

        if (DMParamSistema.CodEmpresa = 'NIR') then
        begin
          wCustoGrupo := 0;
          QEstoqueBaixa.Close;
          QEstoqueBaixa.SetVariable('COD_PRODUTO', QItemNFCod_Produto.Value);
          QEstoqueBaixa.Open;
          while not QEstoqueBaixa.Eof do
          begin
            wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
              'COD_PRODUTO = ' + FloatToStr(QEstoqueBaixaCod_Produto_Baixa.Value)
              + ' AND COD_LOTE_TIPO = ' + FloatToStr(QEstoqueBaixaCod_Lote_Tipo_Baixa.Value)
              + ' AND COD_FILIAL = ' + FloatToStr(wFilial));//FloatToStr(QNotaSaidaCod_Filial.Value));

            if Trim(wAux) <> '' then
              wCustoGrupo := wCustoGrupo + StrToFloat(wAux) * QEstoqueBaixaQt_Baixa.Value;
            QEstoqueBaixa.Next;
          end;
          if wCustoGrupo <> 0 then
            wAux := FloatToStr(wCustoGrupo);
        end;
        if Trim(wAux) <> '' then
          wCustoItem := StrToFloat(wAux)
        else
          wCustoItem := 0;
      end
      else // Custo pelo Estoque
        wCustoItem := (QItemNFVal_Total.Value
          + QItemNFVal_Total.Value * wPercRatear // Rateio do Custo das Despesas + Descontos do Corpo da Nota
          + QItemNFVal_Frete.Value
          + QItemNFval_Ipi.Value
          - QItemNFval_ICM.Value);
//      wFilial_Estoque := QNotaSaidaCod_Filial.Value; //Está jogando a filial para a variável no início da procedure. Junior 03/08/2018


    {if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MEDIBENS') and
       (DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 2) And
       (wTipoAtualizacao < 0) then
    begin
       wqtd_estoque:=DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE',
                                       'COD_FILIAL = ' + FloatToStr(wFilial_Estoque)+
                                       ' AND COD_PRODUTO = ' + QItemNFCod_Produto.Text +
                                       ' AND COD_LOTE_TIPO = ' + QItemNFCod_Lote_Tipo.Text);

       If wQtd_Estoque = '' Then  // caso nao exista o produto em estoque na filial
          wQtd_Estoque := '0';
       If StrToFloat(wQtd_Estoque) < QItemNFQt_Quantidade.Value Then
          wFilial_Estoque := 1;
    end;
    }
      if QItemNFPERC_BENEFICIADO.Value <> 0 then
        wBaixa := QItemNFQt_Quantidade.Value * QItemNFPERC_BENEFICIADO.Value / 100
      else
        wBaixa := QItemNFQt_Quantidade.Value;
      if not (pTR) then
        DMEstoque.AtualizaEstoque(QNotaSaidaCod_Operacao.Value,
          wFilial,//wFilial_Estoque,
          QItemNFCod_Produto.Value,
          QItemNFCod_Lote_Tipo.Value,
          wBaixa * wTipoAtualizacao,
          wCustoItem * wTipoAtualizacao,
          0, QNotaSaidaDt_Emissao.Value);
      if not (PVoltaConfirmacao) then // quando esta voltando confirmação de nota não precisa atualizar custo
      begin // true esta voltando confirmacao de notas
        QItemNF.Edit; // false não esta voltando confirmação de notas
        QItemNFVal_Custo.Value := wCustoItem;
        QItemNF.Post;
      end;
      wVenda := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO',
        'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), true);
      if wVenda = 'V' then
      begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE SET COD_USUARIO = ' +
          IntToStr(DMUsuario.CodUsuarioCorrente) + ', VL_ULTIMA_VENDA = ' +
          Bib.TrocaVirgulaPorPonto(FloatToStr(DMNotaSaida.QItemNFVAL_UNITARIO.Value)) +
          ' WHERE COD_PRODUTO=' + DMNotaSaida.QItemNFCOD_PRODUTO.Text
          + ' AND COD_LOTE_TIPO = ' + FloatToStr(QItemNFCod_Lote_Tipo.Value)
          + ' AND COD_FILIAL = ' + FloatToStr(wFilial));//FloatToStr(QNotaSaidaCod_Filial.Value));
        DMOracle.QExecSQL.ExecSQL;
      end;
      QItemNF.Next;
    end;
  end;
  //Bib.Log('AtualizaEstoque - Fim: ' + FormatDateTime('hh:nn:ss', now));
end;

procedure TDMNotaSaida.RateiaFrete;
var wICMFrete: Real;
begin
  if QNotaSaidaVal_Frete.Value > 0 then
  begin
    QSomaItemNota.Close;
    QSomaItemNota.Open;
    // wICMFrete := 0;
    with DMTributacao do
    begin
      QTributacao.Close;
      QTributacao.SetVariable('PK', QNotaSaidaCod_Tributacao_Frete.Value);
      QTributacao.Open;
      wICMFrete := (QNotaSaidaVal_Frete.Value * QTributacaoPerc_Tributado.Value / 100)
        * QTributacaoPerc_Aliquota.Value / 100;
    end;
    QItemNF.First;
    while not QItemNF.Eof do
    begin
      QItemNF.Edit;
      QItemNFVal_Frete.Value := (QNotaSaidaVal_Frete.Value - wICMFrete)
        * QItemNFVal_Total.Value
        / QSomaItemNotaSVal_Total.Value;
      QItemNF.Post;
      QItemNF.Next;
    end;
  end;
end;

procedure TDMNotaSaida.Contabiliza;
var wContra, wNome, wConta_Cred: string;
  wContaDeb, wContaCred, wDD, wMM, WYY: string;
  wDtAnterior: tDateTime;
  wVariacao, wVlMoeda: Real;
begin
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK', QNotaSaidaCod_Operacao.Value);
    QOperacao.Open;
    // Valor da Nota
    if QNotaSaidaInd_Condicao_Pagto.Value = '1'
      then
    begin
      wContra := QOperacaoCod_Contabil_Val_Nota_Deb.Value;
      wConta_Cred := QOperacaoCod_Cont_Val_Nota_Cred_Avista.Value;
    end
    else
    begin
      wContra := QOperacaoCod_Contabil_Val_Nota_APrazo.Value;
      wConta_Cred := QOperacaoCod_Contabil_Val_Nota_Cred.Value;
    end;
    // este nome serve para aparecer no historico contabil do lancamento contabil
    wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaSaidaCod_Cadastro.Value), True);
    DMPlanilha.GravaLanc('NFS',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      wConta_Cred,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVAL_DESCONTO.Value+QSomaItemNotaSVAL_ICMS_SUBST.Value,
      QNotaSaidaDt_Emissao.Value,
      wContra);
    if QNotaSaidaInd_Condicao_Pagto.Value = '1'
      then
      DMPlanilha.GravaLanc('NFS',
        QNotaSaidaCod_Nota_Cab.Value,
        FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
        QNotaSaidaCod_Filial.Value,
        QOperacaoCod_Contabil_Val_Nota_Deb.Value,
        'DEBITO',
        QNotaSaidaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVAL_DESCONTO.Value+QSomaItemNotaSVAL_ICMS_SUBST.Value,
        QNotaSaidaDt_Emissao.Value,
        wConta_Cred)
    else
    begin
      DMPlanilha.GravaLanc('NFS',
        QNotaSaidaCod_Nota_Cab.Value,
        FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
        QNotaSaidaCod_Filial.Value,
        QOperacaoCod_Contabil_Val_Nota_APrazo.Value,
        'DEBITO',
        QNotaSaidaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QSomaItemNotaSVal_Total.Value - QNotaSaidaVal_AVista.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVAL_DESCONTO.Value+QSomaItemNotaSVAL_ICMS_SUBST.Value,
        QNotaSaidaDt_Emissao.Value,
        wConta_Cred);
      if QNotaSaidaVal_AVista.Value > 0
        then
        DMPlanilha.GravaLanc('NFS',
          QNotaSaidaCod_Nota_Cab.Value,
          FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
          QNotaSaidaCod_Filial.Value,
          QOperacaoCod_Contabil_Val_Nota_Deb.Value,
          'DEBITO',
          QNotaSaidaCod_Cadastro.Value,
          DMOperacao.QOperacaoCod_Historico_Contabil.Value,
          QNotaSaidaVal_AVista.Value,
          QNotaSaidaDt_Emissao.Value,
          wConta_Cred);
    end;

    // Duplica lancamentos contabeis para atualizar na contabilidade as devolucoes de emprestimo de produto agricola - baixa saldo do cliente e emprestimo
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVAL_DESCONTO.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QSomaItemNotaSVAL_DESCONTO.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.Value);

    // ICMS da Nota
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Val_ICMS_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICM.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Val_ICMS_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Val_ICMS_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_ICM.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Val_ICMS_Cred.Value);

    // Valor do Frete
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Conhecimento_Frete.Value),
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Frete_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaSaidaVal_Frete.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Frete_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Conhecimento_Frete.Value),
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Frete_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaSaidaVal_Frete.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Frete_Cred.Value);

    // ICMS do Frete
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Conhecimento_Frete.Value),
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaSaidaVal_ICM_Frete.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Conhecimento_Frete.Value),
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QNotaSaidaVal_ICM_Frete.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.Value);
    // contabilizacao do pis
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Pis_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
      QSomaItemNotaSVal_Pis.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Pis_Cred.Value);

    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Pis_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value,
      QSomaItemNotaSVal_Pis.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Pis_Deb.Value);
    // contabilizacao do COFINS
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Cofins_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Cofins.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Cofins_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Cofins_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Cofins.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Cofins_Deb.Value);
    // contabilizacao do IPI
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Ipi_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_IPI.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Ipi_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Ipi_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Ipi.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Ipi_Deb.Value);
    // contabilizacao do CUSTO - Para industrializacao - contabilizar o custo da materia prima
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Custo_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Custo.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Custo_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Custo_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
      QSomaItemNotaSVal_Custo.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Custo_Deb.Value);

    // contabilizacao do ISSSQN -
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Issqn_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Iss.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Issqn_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Issqn_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Iss.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Issqn_Deb.Value);

    // contabilizacao do INSS
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Inss_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Inss.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Inss_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Inss_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Inss.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Inss_Deb.Value);
    // contabilizacao do Valor Icms Substituição
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Subst_Deb.Value,
      'DEBITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Icms_Subst.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Subst_Cred.Value);
    DMPlanilha.GravaLanc('NFE',
      QNotaSaidaCod_Nota_Cab.Value,
      FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
      QNotaSaidaCod_Filial.Value,
      QOperacaoCod_Contabil_Subst_Cred.Value,
      'CREDITO',
      QNotaSaidaCod_Cadastro.Value,
      DMOperacao.QOperacaoCod_Historico_Contabil.Value,
      QSomaItemNotaSVal_Icms_Subst.Value,
      QNotaSaidaDt_Emissao.Value,
      QOperacaoCod_Contabil_Subst_Deb.Value);


    // rotina para grava os lancamentos contabeis da variacao cambial dos contratos de venda
    if QNotaSaidaCod_Contrato_Vend.Text <> '' then
    begin
      DMContrato.QContrato_Vend.Close;
      DMContrato.QContrato_Vend.SetVariable('Pk', QNotaSaidaCod_Contrato_Vend.Value);
      DMContrato.QContrato_Vend.Open;
      if not (DMContrato.QContrato_Vend.Eof) then
      begin
        if DMContrato.QContrato_VendIND_MOEDA_PRECO.Value = 'DOLAR' then
        begin
          wDD := '01';
          wMM := Copy(DateToStr(DMOracle.DataServ), 4, 2);
          wYY := Copy(DateToStr(DMOracle.DataServ), 7, 4);
          wDtAnterior := StrToDate(wDD + '/' + wMM + '/' + wYY) - 1; // pega ultimo dia do mes anterior
          if DMContrato.QContrato_VendDt_Contrato.Value > wDtAnterior then
            wDtAnterior := DMContrato.QContrato_VendDt_Contrato.Value;
          DMMoeda.QCotacaoDia.Close;
          DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
          DMMoeda.QCotacaoDia.SetVariable('Data', wDtAnterior);
          DMMoeda.QCotacaoDia.Open;
          wVlMoeda := DMMoeda.QCotacaoDiaVlr_Cotacao.Value;
          DMMoeda.QCotacaoDia.Close;
          DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
          DMMoeda.QCotacaoDia.SetVariable('Data', DMOracle.DataServ);
          DMMoeda.QCotacaoDia.Open;
          wVariacao := DMMoeda.QCotacaoDiaVlr_Cotacao.Value - wVlMoeda;
          wVariacao := wVariacao * (DMContrato.QContrato_VendVAL_DOLAR.Value / DMContrato.QContrato_VendQT_QUANTIDADE.Value * QItemNFQt_Quantidade.Value);
          DMContrato.QContrato_Vend_Variacao.Close;
          DMContrato.QContrato_Vend_Variacao.Open;
          DMContrato.QContrato_Vend_Variacao.Insert;
          DMContrato.QContrato_Vend_VariacaoCod_Contrato_Vend.Value := QNotaSaidaCod_Contrato_Vend.Value;
          DMContrato.QContrato_Vend_VariacaoDt_Variacao.Value := DMOracle.DataServ;
          DMContrato.QContrato_Vend_VariacaoVl_Variacao.Value := wVariacao;
          DMContrato.QContrato_Vend_Variacao.Post;
          if wVariacao > 0 then
          begin
            wContaCred := QOperacaoCOD_CONT_VAR_CAMBIAL_POS_CRED.Value;
            wContaDeb := QOperacaoCOD_CONT_VAR_CAMBIAL_POS_DEB.Value;
          end
          else
          begin
            wContaCred := QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_CRED.Value;
            wContaDeb := QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_DEB.Value;
            wVariacao := wVariacao * -1; // PARA FICAR POSITIVO O VALOR
          end;
          DMPlanilha.GravaLanc('NFE',
            QNotaSaidaCod_Nota_Cab.Value,
            FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
            QNotaSaidaCod_Filial.Value,
            wContaDeb,
            'DEBITO',
            QNotaSaidaCod_Cadastro.Value,
            DMOperacao.QOperacaoCod_Historico_Contabil.Value,
            wVariacao,
            QNotaSaidaDt_Emissao.Value,
            wContaCred);
          DMPlanilha.GravaLanc('NFE',
            QNotaSaidaCod_Nota_Cab.Value,
            FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
            QNotaSaidaCod_Filial.Value,
            wContaCred,
            'CREDITO',
            QNotaSaidaCod_Cadastro.Value,
            DMOperacao.QOperacaoCod_Historico_Contabil.Value,
            wVariacao,
            QNotaSaidaDt_Emissao.Value,
            wContaDeb);
        end;
      end;
    end;

    //contabiliza o valor dos impostos dos serviços lançados - 03/10/2005 - Fabiano.

    QNotaImpostoServico.close;
    QNotaImpostoServico.open;
    while not QNotaImpostoServico.Eof do
    begin
      wContaCred := DMOracle.BuscaNome('SELECT CONTA_CREDITO FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text, True);
      wContaDeb := DMOracle.BuscaNome('SELECT CONTA_DEBITO  FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text, True);
      //fabiano 05/01/2006.
      {na cavalca nao é informado as contas crédito e débitos no cadastro do imposto
      e sim no cadastro da operacao. para saber qual imposto está sendo contabilizado
      e qual campo deve ser buscado da operacao foi feito um if para cada imposto
      cadastrado}
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CAVALCA') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') then
      begin
        if (trim(wContaCred) = '') or (trim(wContaCred) = '') then
        begin
          //permite fazer a contabilidade apenas para os impostos definidos
          //caso tenha sido criado um novo imposto, deve-se criar os campos
          //para esse imposto na operacao e fazer o if da mesma forma com os
          //impostos abaixo.
          if not QNotaImpostoServicoCOD_IMPOSTO.Value in [1, 2, 3, 4, 5, 6] then
            raise Exception.create('O Impostodo cadastrado não possui conta contábil associada na operação');
          if QNotaImpostoServicoCOD_IMPOSTO.Value = 1 then //1 IRRF a compensar
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_IRRF_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_IRRF_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;

          if QNotaImpostoServicoCOD_IMPOSTO.Value = 2 then //2 CSLL retida na Fonte
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CSLL_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_CSLL_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;

          if QNotaImpostoServicoCOD_IMPOSTO.Value = 3 then //3 Pis retido na Fonte
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_PIS_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_PIS_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;

          if QNotaImpostoServicoCOD_IMPOSTO.Value = 4 then //4 Cofins retido na Fonte
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_COFINS_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_COFINS_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;

          if QNotaImpostoServicoCOD_IMPOSTO.Value = 5 then //5 ISSQN retido na fonte
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_ISSQN_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_ISSQN_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;

          if QNotaImpostoServicoCOD_IMPOSTO.Value = 6 then //6 INSS retido a compensar
          begin
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_INSS_CRED FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
            wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_INSS_DEB FROM  TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text, True);
          end;
        end;
      end;

      DMPlanilha.GravaLanc('NFE',
        QNotaSaidaCOD_NOTA_CAB.Value,
        FloatToStr(QNotaSaidaNUM_NOTA.Value) + '-' + QNotaSaidaCOD_SERIE.Value + '-' + wNome,
        QNotaSaidaCod_Filial.Value,
        wContaCred,
        'CREDITO',
        QNotaSaidaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaImpostoServicoVAL_IMPOSTO.Value,
        QNotaSaidaDt_Recebimento.Value,
        wContaDeb);

      DMPlanilha.GravaLanc('NFE',
        QNotaSaidaCod_Nota_Cab.Value,
        FloatToStr(QNotaSaidaNum_Nota.Value) + '-' + QNotaSaidaCod_Serie.Value + '-' + wNome,
        QNotaSaidaCod_Filial.Value,
        wContaDeb,
        'DEBITO',
        QNotaSaidaCod_Cadastro.Value,
        DMOperacao.QOperacaoCod_Historico_Contabil.Value,
        QNotaImpostoServicoVAL_IMPOSTO.Value,
        QNotaSaidaDt_Recebimento.Value,
        wContaCred);

      QNotaImpostoServico.Next;
    end;
  end;
end;

procedure TDMNotaSaida.IncluiNotaAux;
var wTipoFutura: string;
begin
  wTipoFutura := '';
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK', QNotaSaidaCod_Operacao.Value);
    QOperacao.Open;
    if QOperacaoInd_Futura_Cliente.Value = 'V' then // Operacao de Compra Futura
       wTipoFutura := wTipoFutura + 'VEN_FUT';
    if QOperacaoInd_Consignacao_Cliente.Value = 'S' then // Entrada em Consignação
       wTipoFutura := wTipoFutura + 'CON_CLI';
    if QOperacaoInd_Emprestimo_Cliente.Value = 'S' then // Entrada por Empréstimo
       wTipoFutura := wTipoFutura + 'EMP_CLI';
    if QOperacaoInd_Deposito_OUTRAS.Value = 'S' then // Saída para depósito
       wTipoFutura := wTipoFutura + 'DEP_OUT';

    if wTipoFutura <> '' then // Operacao Futura
    begin
      if Length(wTipoFutura) > 7 then
        raise Exception.Create('Operação inválida. Mais do que uma operação Futura!');
      QItemNF.First;
      while not QItemNF.EOF do
      begin
        QNotaAux.Close;
        QNotaAux.Open;
        QNotaAux.Insert;
        QNotaAuxCod_Nota_Aux.Value := DMOracle.Sequencia('NOTA_AUX');
        QNotaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
        QNotaAuxCod_Produto.Value := QItemNFCod_Produto.Value;
        QNotaAuxQt_Devolvido.Value := 0;
        QNotaAuxQt_Atendido.Value := 0;
        QNotaAuxQt_Cancelado.Value := 0;
        if QItemNFPERC_BENEFICIADO.Value > 0 then
          QNotaAuxQt_Nota_Item.Value := QItemNFQt_Quantidade.Value * QItemNFPERC_BENEFICIADO.Value / 100
        else
          QNotaAuxQt_Nota_Item.Value := QItemNFQt_Quantidade.Value;
        QNotaAuxInd_Tipo.Value := wTipoFutura;
        QNotaAux.Post;
        QItemNF.Next;
      end;
      QNotaAux.Close;
    end;
  end;
end;

procedure TDMNotaSaida.VoltaCancelamento;
begin
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '3' then
    raise Exception.Create('Esta nota não foi cancelada!');
  try
    DMOracle.DBCemapa.StartTransaction;
    QAtzNota.Close;
    QAtzNota.SetVariable('COD_NOTA_CAB', QNotaSaidaCod_Nota_Cab.Value);
    QAtzNota.Open;
    QAtzNota.Edit;
    QAtzNotaInd_Situacao.Value := '1';
    QAtzNotaCod_Motivo_Canc.Clear;
    QAtzNota.Post;
    QAtzNota.Close;
    DMOracle.DBCemapa.Commit;
    QNotaSaida.Close;
    QNotaSaida.Open;
  except
    if QAtzNota.State <> dsBrowse then
      QAtzNota.Cancel;
    raise Exception.Create('Não é possível voltar cancelamento desta nota!');
  end;
end;

procedure TDMNotaSaida.QBaixaAuxAfterPost(DataSet: TDataSet);
var wTipoAtu: string;
begin
  wTipoAtu := DMNotaSaida.TipoAtzNotaAux('S');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX', QBaixaAuxCod_Nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  if wTipoAtu = 'ATENDIMENTO' then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value + QBaixaAuxQt_Quantidade.Value;
  if wTipoAtu = 'DEVOLUCAO' then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value + QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
end;

procedure TDMNotaSaida.QBaixaAuxBeforeDelete(DataSet: TDataSet);
var wTipoAtu: string;
begin
  wTipoAtu := DMNotaSaida.TipoAtzNotaAux('S');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX', QBaixaAuxCod_Nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  if wTipoAtu = 'ATENDIMENTO' then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value - QBaixaAuxQt_Quantidade.Value;
  if wTipoAtu = 'DEVOLUCAO' then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value - QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
end;

procedure TDMNotaSaida.QBaixaAuxBeforeEdit(DataSet: TDataSet);
begin
  raise Exception.Create('Alteracao não suportada!');
end;

function TDMNotaSaida.TipoAtzNotaAux(wEntradaSaida: string): string;
begin
  with DMOperacao do
  begin
    if wEntradaSaida = 'S' then
    begin
      if QOperacaoInd_Futura_Fornecedor.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Futura_Cliente.Value = 'S' then
        Result := 'ATENDIMENTO';
      if QOperacaoInd_Consignacao_Fornecedor.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Emprestimo_Fornecedor.Value = 'D' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Deposito_Empresa.Value = 'S' then
        Result := 'DEVOLUCAO';
      if QOperacaoInd_Deposito_Outras.Value = 'S' then
        Result := 'DEVOLUCAO';
    end;
  end;
end;

procedure TDMNotaSaida.QNFE_EmiteCalcFields(DataSet: TDataSet);
begin
  QNFE_Emiteind_estadual.Value := (QNFE_EmiteUF_FILIAL.Value = QNFE_EmiteUF_NOTA.Value);
  if DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    QNFE_Emiteqt_beneficiado.Text := DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE * TB_NOTA_ITEM.PERC_BENEFICIADO / 100) FROM TB_PRODUTO,TB_NOTA_ITEM,TB_NOTA_CAB',
      'TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      + ' AND TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
      + ' AND TB_PRODUTO.IND_TIPO_PRODUTO = ' + CHR(39) + 'ARROZ' + CHR(39)
      + ' AND TB_NOTA_CAB.COD_NOTA_CAB = ' + QNFE_EmiteCOD_NOTA_CAB.Text);
  if QNFE_EmiteCOD_TRANSPORTADOR.Text <> '' then
  begin
    with DMCadastro do
    begin
      if QNFE_EmiteCOD_TRANSPORTADOR.Value <> 0 then
      begin
        QCadastro.Close;
        QCadastro.SetVariable('PK', QNFE_EmiteCOD_TRANSPORTADOR.Value);
        QCadastro.Open;
        QNFE_Emitenome_transp.Value := QCadastroNOME.Value;
        QNFE_Emiteend_transp.Value := QCadastroDESC_ENDERECO.Value;
        QNFE_Emitecidade_transp.Value := QCadastroDESC_CIDADE.Value;
        QNFE_Emiteinsc_transp.Value := QCadastroNUM_INSCRICAO.Value;
        QNFE_Emitecgc_transp.Value := QCadastroNUM_CGC_CPF.Value;
        QNFE_Emiteuf_transp.Value := QCadastroCOD_ESTADO.Value;
      end;
    end;
  end;
  if (QNFE_EmiteUF_FILIAL.Value <> QNFE_EmiteUF_NOTA.Value) then //ALTERADO SERGIO 13/12/2002
  begin
    if (DATE >= StrToDate('01/01/2003')) then
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_INTERESTADUAL_NOVO.Text
    else
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_INTERESTADUAL.Text;
  end
  else
  begin
    if (DATE >= StrToDate('01/01/2003')) then
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_ESTADUAL_NOVO.Text
    else
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_ESTADUAL.Text;
  end;
end;

procedure TDMNotaSaida.AtuCaixa(wVal_Movimento: Real; wTipo: string; wOperacao, wFilial, wDepartamento,
  wNumNota, wCadastro, wNotaCab, wOficinaCab: string; wDataMov: TDateTime);
var wHistorico, wNome: string;
begin
  try
    if (wTipo = 'VALE-PRESENTE') and (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') then
      wHistorico := '10'
    else if (wTipo = 'ENTRADA') and (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') then
      wHistorico := '9'
    else
    begin
      if wTipo = 'CARTAO CREDITO' then
        wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa_Credito FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True)
      else if wTipo = 'CARTAO DEBITO' then
        wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa_Debito FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True)
      else if wTipo = 'CHEQUE' then
        wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa_CHEQUE FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True)
      else if wTipo = 'PIX' then
        wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa_PIX FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True)
      else
        wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True);
    end;
    if wHistorico <> '' then
    begin
      if wOficinaCab <> '' then //apenas para lancamento de caixa feito pelo oficina
      begin
        QCaixa.MasterFields := '';
        QCaixa.DetailFields := '';
        QCaixa.Master := nil;
      end;
      wNome := '';
      if wNotaCab <> '' then
         wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_NOME_NOTA', 'COD_NOTA_CAB = ' + wNotaCab, True);
      QCaixa.Open;
      QCaixa.Insert;
      QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QCaixaCOD_FILIAL.Value := StrToInt(wFilial);
      if wDepartamento = '' then
        QCaixaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario
      else
        QCaixaCOD_DEPARTAMENTO.Value := StrToInt(wDepartamento);
      QCaixaCOD_HISTORICO.Value := StrToInt(wHistorico);
      QCaixaDT_MOVIMENTO.Value := wDataMov;
      QCaixaVAL_MOVIMENTO.Value := wVal_Movimento;
      if wNumNota <> '' then
        QCaixaNUM_DOCUMENTO.Value := StrToInt(wNumNota);
      if (wNumNota <> '') and (wNotaCab <> '') then
      begin
        if (DMParamSistema.CodEmpresa <> 'HOSPITAL') then //Solicitação Diego - Junior 07/02/2019
          QCaixaDESC_COMPLEMENTO.Value := 'Venda a Vista Cfe Nf Nr:' + wNumNota + ' ' + wNome;
        if (DMParamSistema.CodEmpresa = 'FRIGOPIES') then //PRECISA DA OBS NO COMPLEMENTO DO CAIXA. Junior 01/08/2019 suporte(12746)
        begin
          QCaixaDESC_COMPLEMENTO.Value :=  DMOracle.FastSelect('OBS','TB_NOTA_CAB','COD_NOTA_CAB = '+ wNotaCab);
        end;
        if (DMParamSistema.CodEmpresa = 'PRAIASMI') then
          QCaixaDESC_COMPLEMENTO1.Value :=  DMOracle.FastSelect('OBS','TB_NOTA_CAB','COD_NOTA_CAB = '+ wNotaCab);
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI') and
          (wTipo <> 'ENTRADA') and (wTipo <> 'A VISTA') then
          QCaixaDESC_COMPLEMENTO.Value := wTipo;
        //PARA NUTRIVET(SIMONI), APARECER A DESCRICAO DA VENDA POR CARTAO DE CREDITO. JUNIOR - 04/07/2013
        //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NUTRIVET') and (wTipo = 'A CARTAO') then
        //  QCaixaDESC_COMPLEMENTO.Value := 'Venda a Cartão Nf Nr: ' + wNumNota + ' ' + wNome;
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS') then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda a Vista Cfe Nf Nr:' + wNumNota + ' ' + wNome + '- Num. OS: ' + dmnotasaida.QNotaSaidaNUM_OS.Text; //Vanessa 17/04/2015
        if wTipo = 'CARTAO CREDITO' then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda com Cartao de Credito Nf Nr: ' + wNumNota + ' ' + wNome;
        if wTipo = 'CARTAO DEBITO' then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda com Cartao de Debito Nf Nr: ' + wNumNota + ' ' + wNome;
        if wTipo = 'CHEQUE' then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda com Cheque Nf Nr: ' + wNumNota + ' ' + wNome;
        if wTipo = 'PIX' then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda com PIX Nf Nr: ' + wNumNota + ' ' + wNome;
        if wTipo = 'CONVENIO' then
          QCaixaDESC_COMPLEMENTO.Value := 'Venda Convenio Nf Nr: ' + wNumNota + ' ' + wNome;
      end;
      QCaixaCOD_CADASTRO.Value := StrToInt(wCadastro);
      if wNotaCab <> '' then
        QCaixaCOD_NOTA_CAB.Value := StrToInt(wNotaCab);
      if wOficinaCab <> '' then
        QCaixaCOD_OFICINA_CAB.Value := StrToInt(wOficinaCab);
      QCaixaDT_USUARIO.Value := DMOracle.DataServ;
      QCaixa.Post;
      QCaixa.Close;
      if wOficinaCab <> '' then //apenas para lancamento de caixa feito pelo oficina
      begin
        QCaixa.Master := QNotaSaida;
        QCaixa.MasterFields := 'COD_NOTA_CAB';
        QCaixa.DetailFields := 'COD_NOTA_CAB';
      end;
    end;
  except
    if QCaixa.State = dsInsert then
      QCaixa.Cancel;
    raise;
  end;
end;

procedure TDMNotaSaida.ValidaContaPagar(wListaParcela: TStrings; wFinalidade: Integer);
var wTotalParcelas: Real;
  wCont: Integer;
  wAux: string;
begin
  wTotalParcelas := 0;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    wAux := Copy(wListaParcela[wCont], 11, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(Trim(wAux));
  end;
  if FormatFloat('#,##0.00', wTotalParcelas) <> FormatFloat('#,##0.00', QNotaSaidaVal_Frete.Value) then
    raise Exception.Create('Soma das parcelas diferente do valor do Frete!');
end;

procedure TDMNotaSaida.CalculaItem;
var wTipoProduto, wUnidade: string;
  wTotal, wPercDesc: Real;
begin
  if (QItemNFQt_Quantidade.Value = 0) and
     (QNotaSaidaCOD_SERIE_MODELO.Value <> '55') then
    QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
  else
  begin
    if pGravando = False then // serve para nao recalcular o valor total apos gravado o item problema com numero de casas decimais
    begin
{      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
      begin
        wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
        if wTipoProduto <> 'PEÇA' then //Medida provisória para nao dividir por 1000 o valor de um produto que nao é vendido por tonelada e dar errado o total.
        begin
          wUnidade := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
          QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value * StrToFloat(wUnidade) / 1000;
        end
        else
          QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value;
      end
      else  }
//      if QNotaSaidaIND_FINALIDADE_NFE.Value <> 2 then  // comentado pelo cesar 09/03/2022 e colocar um if para testar quantidade zeros
//      begin
        begin
          wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
          If wTipoProduto <> 'AGRICOLA' then
            If QItemNFQt_Quantidade.Value <> 0 then
               QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value //
            Else
               QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
          else
            If ((wTipoProduto = 'AGRICOLA') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRIPAR')) then
              QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value
            else
            begin
              wUnidade := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
              If Trim(wUnidade) <> '' then
                If QItemNFQt_Quantidade.Value <> 0 then
                   QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value / StrToFloat(wUnidade)
                Else
                  QItemNFVal_Total.Value := QItemNFVal_Unitario.Value / StrToFloat(wUnidade)
              else
                raise Exception.Create('Produto Agricola sem Embalagem Cadastrada!'
                  + Chr(13) + 'Não é possivel calcular o preço total!');
            end;
        end;
    //  end;
    end;
  end;
  //if QSomaItemNotaSVal_Total.Value > 0 then
//    wTotal := QSomaItemNotaSVal_Total.Value
//  else
//    wTotal := QItemNFVal_Total.Value;
//  if (wTotal <> 0) then
//    wPercDesc := 1 + (QNotaSaidaVal_Despesas.Value - QSomaItemNotaSVAL_DESCONTO.Value) / wTotal
//  else
//    wPercDesc := 1;
  if(DMOracle.FastSelect('IND_IPI', 'TB_FILIAL', 'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) <> 'S') and
    ((DMOperacao.QOperacaoIND_VENDAS.Value = 'V') or
    (DMOperacao.QOperacaoIND_COMPRAS.Value = 'C')) then
    QItemNFPerc_IPI.Value := 0;
  //QItemNFVal_Ipi.Value := QItemNFVal_Total.Value * wPercDesc * QItemNFPerc_IPI.Value / 100;
end;

procedure TDMNotaSaida.QItemNFQT_QUANTIDADEValidate(Sender: TField);
var wQtPedido: Real;
    wControla_estoque, wEstoque_negativo :string ;
    wQtde_estoque : double;
    wQtdAtacado: integer;
    wPrecoAtacado: double;
begin
  //Verifica se o produto irá ficar negativo. Solicitacao - Rogério/Diego (JR MULTIPECAS) e Autorizado pelo César. Junior 09/04/2015
 { wControla_estoque := DMOracle.FastSelect('IND_ESTOQUE','TB_FILIAL','COD_FILIAL = ' + IntToStr(QNotaSaidaCOD_FILIAL.Value));
  wEstoque_negativo := DMOracle.FastSelect('IND_ESTOQUE_NEGATIVO','TB_FILIAL','COD_FILIAL = ' + IntToStr(QNotaSaidaCOD_FILIAL.Value));
  wQtde_estoque     := StrToFloat('0' + DMOracle.FastSelect('QT_QUANTIDADE','TB_ESTOQUE','COD_FILIAL = ' + IntToStr(QNotaSaidaCOD_FILIAL.Value)
                                                     +' AND COD_PRODUTO = ' + (QItemNFCOD_PRODUTO.Text)));
  if (wControla_estoque = 'S') and (wEstoque_negativo = 'NAO') then
  begin
    if(wQtde_estoque < QItemNFQT_QUANTIDADE.Value) then
      raise Exception.Create('Erro! O Estoque não pode ficar negativo!'+#13+'Produto: '+ QItemNFCOD_PRODUTO.Text +'  Estoque= '+ FloatToStr(wQtde_estoque) );
  end;}

  if pTrazPedido = False then
  begin
    CalculaItem;
    DMNotaSaida.QAtuBaixaPed.Close;
    DMNotaSaida.QAtuBaixaPed.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
    DMNotaSaida.QAtuBaixaPed.Open;
    if QAtuBaixaPedCOD_PEDIDO_ITEM.Value <> 0 then
    begin
      wQtPedido := StrToFloat(DMOracle.BuscaNome('SELECT QT_PEDIDO-FUNC_QT_ATENDIDA_PEDIDO(COD_PEDIDO_ITEM)-QT_CANCELADO FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_ITEM=' + QAtuBaixaPedCOD_PEDIDO_ITEM.Text));
      if wQtPedido > QItemNFQT_QUANTIDADE.Value then // serve para quando estiver atendendo na nf mais que
        wQtPedido := QItemNFQT_QUANTIDADE.Value; // a quantidade do pedido
      QAtuBaixaPed.Edit;
      QAtuBaixaPedQt_Baixa.Value := wQtPedido;
      QAtuBaixaPed.Post;
    end;
    QAtuBaixaPed.Close;
    QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
  end;
  //Pegar o preço de atacado para quantidades igual ou superior ao cadastro do produto. Junior 19/04/2021.
  //Solic. Marcos(Utilizado pela Ferragem Med. (ATAC).
  if QItemNFCOD_PRODUTO.Text <> '' then
  begin
    wQtdAtacado := StrToInt('0'+DMOracle.FastSelect('QT_MIN_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
    if (wQtdAtacado > 0) and (QItemNFQT_QUANTIDADE.Value >= wQtdAtacado) then
    begin
      wPrecoAtacado := StrToFloat(DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text));
      if wPrecoAtacado > 0 then
        QItemNFVAL_UNITARIO.Value := StrToFloat (DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text))
      else
      begin
        ShowMessage('PREÇO DE ATACADO NÃO CADASTRADO. O PREÇO SERÁ DE VAREJO.');
        QItemNFCOD_PRODUTOValidate(Sender);
      end;
    end
    else
       QItemNFCOD_PRODUTOValidate(Sender);
  end;
end;

procedure TDMNotaSaida.QItemNFCOD_PRODUTOValidate(Sender: TField);
var wPrecoUnitario, wTipoPreco, wSituacao, wDtTabela, wCodTributacao, wCst, wCsosn: string;
  x, y: array of string;
  wValorPersonalizado: double;
  wSt: Boolean;
begin
  if DMNotaSaida.QItemNFCOD_PRODUTO.Value = 0 then
    exit;
  if QItemNF.State in [dsEdit, dsInsert] then
  begin
    QItemNF.AutoCalcFields := False;
    if length(QItemNFCOD_PRODUTO.Text) >= 1 then //a pedido da brasil paper que tem os produtos com codigo 3 e 9 que nao sao para venda
    begin
      setLength(x, 3); //3 sql diferentes
      setLength(y, 3);

      x[0] := 'SELECT IND_SITUACAO FROM TB_PRODUTO WHERE COD_PRODUTO=' + FloatToStr(QItemNFCod_Produto.Value);
      x[1] := 'SELECT PERC_IPI FROM TB_PRODUTO WHERE COD_PRODUTO=' + FloatToStr(QItemNFCod_Produto.Value);
      x[2] := 'SELECT NUM_GENERO_NCM FROM TB_PRODUTO WHERE COD_PRODUTO=' + QItemNFCod_Produto.Text;

      DMOracle.BuscaNomes(x, y);
      QItemNFNUM_GENERO_NCM.Value := y[2];
    
      wSituacao := Y[0];

      QItemNFNUM_FABRICANTE.Value := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value), True);
      QItemNF.AutoCalcFields := True;

      if (wSituacao <> 'ATIVO') and (wSituacao <> '') then
        raise Exception.Create('Produto '+QItemNFCOD_PRODUTO.AsString+' sem permissão para venda - Ver situação do produto!');
      if Y[1] <> '' then
        QItemNFPerc_Ipi.Value := StrToFloat(Y[1]);

      // Reforma Tributária
      if DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Value > 0 then
        QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' + DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Text)
      else
        QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' +
                                             '(SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text + ')');
    end
  end;
  if pTrazPedido = False then
  begin
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
    begin
      setLength(x, 2); //2 sql diferentes
      setLength(y, 2);
      

      x[0] := 'SELECT PERC_COMISSAO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value);
      x[1] := 'SELECT DT_VENCTO_PRECO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value);

      DMOracle.BuscaNomes(x, y);

      QItemNFPerc_Comissao.Text := Y[0];
      wDtTabela := Y[1];
      if wDtTabela <> '' then
        if StrToDate(wDtTabela) < DMOracle.DataServ then
          raise Exception.Create('Produto com preço expirado');
    end;
    if pTRF2 then
    begin
      QItemNFVAL_UNITARIO.Value := ItemTR;
      if DMParamSistema.codEmpresa = 'KREUZ' then  //Kreuz. Muda a qtde do produto, a tributação fica em branco. Junior 17/01/2022
      begin
        if DMOperacao.QOperacaoCod_Tributacao.Value > 0 then
          QItemNFCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
        else
          QItemNFCOD_TRIBUTACAO.text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True)
      end
      else
        QItemNFCOD_TRIBUTACAO.text := DMOracle.BuscaNome('SELECT NUM_TRIB_TRANSFERENCIA FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True)
    end
    else
    begin
      wTipoPreco := DMOracle.BuscaNome('SELECT IND_PRECO FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value));
      if wTipoPreco = 'P' then
      begin
        // Na nota ao consumidor, estava "acess violation" quando inseria novos itens em notas já digitadas, para evitar foi necessario fechar e abrir a query. Junior - 18/03/2014
        DMCadastro.QCadastro.Close;
        DMCadastro.QCadastro.SetVariable('PK',DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
        DMCadastro.QCadastro.Open;
        DMCadastro.QCadastro.RefreshRecord;
        if (DMParamSistema.CodEmpresa = 'MALAGGI') or (DMParamSistema.CodEmpresa = 'BEGNINI') then
          wPrecoUnitario := FloatToStr(DMProduto.PrecoVenda(QItemNFCOD_PRODUTO.Value,
            QNotaSaidaCOD_CADASTRO.Text, Bib.ift(
            DMCadastro.QCadastroIND_ATACADO_VAREJO.Value = 'V', 'F', 'J')))
        else
          wPrecoUnitario := FloatToStr(DMProduto.PrecoVenda(QItemNFCod_Produto.Value, QNotaSaidaCod_Cadastro.Text,'F',QItemNFCod_Lote_Tipo.Value));
      end
      else
        if wTipoPreco = 'C' then
          wPrecoUnitario := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
            'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value) +
            ' AND COD_FILIAL = ' + FloatToStr(QNotaSaidaCOD_FILIAL.Value) +
            ' AND COD_LOTE_TIPO = ' + FloatToStr(QItemNFCOD_LOTE_TIPO.Value));

//      if Trim(wPrecoUnitario) <> '' then
//          QItemNFVal_Unitario.Value := StrToFloat(wPrecoUnitario)  //esse linha IF. para empresas <> de MAVENIDA.
      if (DMParamSistema.CodEmpresa = 'MAVENIDA')   or (DMParamSistema.CodEmpresa = 'NFCE-DOCES') or (DMParamSistema.CodEmpresa = 'VILCAR') or
          (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'MEUPET')     or (DMParamSistema.CodEmpresa = 'KAISER') or
          (DMParamSistema.CodEmpresa = 'EMBGARCIA') or (DMParamSistema.CodEmpresa = 'EMBVAL') or  (DMParamSistema.CodEmpresa = 'EMBFOZ') or
          (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') or (DMParamSistema.CodEmpresa = 'FRACTA') then  //Possui o produto diversos com valor 0. Ao mudar o preço UN. antes da QTDE o valor UN. Volta a fizar 0.
      begin                                           //Achei necessário adicionar esse IF. Junior 03/05/2021.
        if (QItemNFVAL_UNITARIO.Value = 0) and (Trim(wPrecoUnitario) <> '') then
          QItemNFVal_Unitario.Value := StrToFloat(wPrecoUnitario);
      end
      else
      begin
        if Trim(wPrecoUnitario) <> '' then
          If (DMParamSistema.CodEmpresa <> 'ARZ') and (DMParamSistema.CodEmpresa <> 'GRASEL') and (DMParamSistema.CodEmpresa <> 'PERTUTTI')  Then
             QItemNFVal_Unitario.Value := StrToFloat(wPrecoUnitario)
          else
             If QItemNFVal_Unitario.Value = 0 Then  // a pedido da Alice dia 06/07/2021 - César estava alterando o preço quando voltava um pedido para alterar quantidade
                QItemNFVal_Unitario.Value := StrToFloat(wPrecoUnitario);   // tambem solicitou para não zerar o percentual de desconto
      end;

      if (QItemNF.State <> dsEdit) and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INJEPAR') then
      begin
        QItemNFCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO_SUBST_TRIB',
              'COD_ESTADO = ' + CHR(39) + QNotaSaidaCod_Estado.Value + CHR(39) +
              ' AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text +
              ' AND COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        if(QItemNFCod_Tributacao.Text = '') then
        begin
          if DMOperacao.QOperacaoCod_Tributacao.Value > 0 then
          begin
            QItemNFCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
          end
          else
          begin
            if (QNotaSaidaCod_Estado.Value <>
                DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL', 'COD_FILIAL = ' +
                QNotaSaidaCod_Filial.Text, True)) and
                (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
              QItemNFCod_Tributacao.Text := DMOracle.BuscaNome('SELECT TRUNC(PERC_TRIBUTACAO) FROM TB_ESTADO',
                'COD_ESTADO = ' + CHR(39) + QNotaSaidaCod_Estado.Value + CHR(39));
            if QItemNFCod_Tributacao.Text = '' then
              QItemNFCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO',
                'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value));
          end;
        end;
      end;
    end;
    QItemNFVAL_UNITARIO_TABELA.Value := QItemNFVal_Unitario.Value;
    DMNotaSaida.QAtuBaixaPed.Open;
    if not DMNotaSaida.QAtuBaixaPed.Eof then
    begin
      QAtuBaixaPed.Edit;
      QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.value;
      QAtuBaixaPed.Post;
    end;
    DMNotaSaida.QAtuBaixaPed.Close;

    // Chama função na BibVendas para alterações de preço por COD_EMPRESA
    wValorPersonalizado := BibVenda.PersonalizaPreco(
      DMParamSistema.QParamSistemaCOD_EMPRESA.Value
      , QItemNFVAL_UNITARIO.Value
      , QItemNFCOD_PRODUTO.Text
    );
    if QItemNFVAL_UNITARIO.Value <> wValorPersonalizado then
      QItemNFVAL_UNITARIO.Value := wValorPersonalizado;
  end;
  
  PrecoTabela; //Verifica se o produto está cadastrado em tabela de preço
end;

procedure TDMNotaSaida.UtilizaListaPrecoTodosItens;
var wRecNo: integer;
  wEventoAfter: TDataSetNotifyEvent;
  wEventoBefore: TDataSetNotifyEvent;
begin
  if (pUtilizaListaPrecoTodosItens)
    and (pCodListaPreco > 0) then
  begin
    wRecNo := QItemNF.RecNo;
    QItemNF.First;

    //Deve retirar o evento que chama esta procedure para não criar um laço infinito ao fazer post
    wEventoAfter := QItemNF.AfterPost;
    wEventoBefore := QItemNF.BeforePost;
    QItemNF.AfterPost := nil;
    QItemNF.BeforePost := nil;
    try
      while not QItemNF.Eof do
      begin
        QItemNF.Edit;
        if pCodListaPreco > 0 then
          QItemNFCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;
        QItemNFCOD_PRODUTOValidate(nil);
        QItemNF.Post;
        QItemNF.Next;
      end;
    finally
      // Devolve o evento para a query
      QItemNF.AfterPost := wEventoAfter;
      QItemNF.BeforePost := wEventoBefore;
      QItemNF.RecNo := wRecNo;
    end;

    //pUtilizaListaPrecoTodosItens := false;
  end;
end;

procedure TDMNotaSaida.PrecoTabela;
begin

  // Se a operação for de remessa de venda futura, não deve alterar preço
  with DMOperacao do
  begin
    if QOperacaoCOD_OPERACAO.Value <> QNotaSaidaCOD_OPERACAO.Value then
    begin
      QOperacao.Close;
      QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Value);
      QOperacao.Open;
    end;
    if (QOperacaoIND_FUTURA_CLIENTE.Value = 'S')
      or (QOperacaoIND_FUTURA_CLIENTE.Value = 'D') then
      exit;
  end;

  // Se for importação de pedido não deve alterar preço de venda
  if pTrazPedido then
    exit;
  
  // Verifica se o produto está cadastrado em tabela de preço
  // Se estiver, sobrescreve o valor do produto com o valor que está na tabela
  if (QItemNFCOD_TABELA_PRECO_CAB.Value > 0) and (DMParamSistema.CodEmpresa <> 'FERRAGMED') then
  begin
    with DMTabelaPreco do
    begin
      QTabelaPrecoProduto.Close;
      QTabelaPrecoProduto.SetVariable('COD_PRODUTO', QItemNFCOD_PRODUTO.Value);
      QTabelaPrecoProduto.SetVariable('COD_TABELA_PRECO', QItemNFCOD_TABELA_PRECO_CAB.Value);
      QTabelaPrecoProduto.Open;
      if QTabelaPrecoProduto.RecordCount > 0 then
      begin
        QItemNFVAL_UNITARIO.Value := QTabelaPrecoProdutoVAL_PRECO.Value;
        if QTabelaPrecoProdutoIND_BLOQUEIA_DESCONTO.Value = 'SIM' then
        begin
          QItemNFVAL_DESCONTO.Value := 0;
          QItemNFPERC_DESCONTO.Value := 0;
          QItemNFVAL_DESCONTO.ReadOnly := true;
          QItemNFPERC_DESCONTO.ReadOnly := true;
        end
        else
        begin
          QItemNFVAL_DESCONTO.ReadOnly := false;
          QItemNFPERC_DESCONTO.ReadOnly := false;
        end;
      end
      else
      begin
        QItemNFVAL_DESCONTO.ReadOnly := false;
        QItemNFPERC_DESCONTO.ReadOnly := false;
      end;

    end;
  end;
end;

procedure TDMNotaSaida.QItemNFCalcFields(DataSet: TDataSet);
begin

  if (DMParamSistema.CodEmpresa = 'MAVENIDA') or (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
    exit;

  If (QItemNFCOD_NOTA_ITEM.Text <> '') and (QItemNF.State = DSCalcFields) then
  begin
    // Utiliza a query QItemNF_CalcFields para agilizar o processo
    if (QItemNF_CalcFields.Eof) Then  // foi colocado este IF porque estava dando um erro na emissao do receituario agronomico - Cesar 09/03/2016
    begin
      QItemNF_CalcFields.Close;
      QItemNF_CalcFields.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
      QItemNF_CalcFields.Open;
    end;

    if (QItemNF_CalcFields.RecordCount = 0)
      or (QItemNF_CalcFieldsCOD_NOTA_ITEM.Value <> QItemNFCOD_NOTA_ITEM.Value)
      or (QItemNF_CalcFieldsCOD_PRODUTO.Value <> QItemNFCOD_PRODUTO.Value)
      or (QItemNF_CalcFieldsCOD_TRIBUTACAO.Value <> QItemNFCOD_TRIBUTACAO.Value) then
    begin
      QItemNF_CalcFields.Close;
      QItemNF_CalcFields.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
      QItemNF_CalcFields.Open;
    end;

    if QItemNF_CalcFields.RecordCount = 0 then
      Exit;

    if (QItemNFDESC_COMPLEMENTO.IsNull) then
      QItemNFnome_produto.Value := QItemNF_CalcFieldsDESC_PRODUTO.Value
    else
      QItemNFnome_produto.Value := QItemNFDESC_COMPLEMENTO.Value;

    // Busca informação de substituição tributária do produto
    if Trim(QItemNFind_subst_trib.Value) = '' then
    begin
      if QItemNF_CalcFieldsIND_SUBST_TRIB.Value = 'SIM' then
        QItemNFind_subst_trib.Value :=
          '* Produto com substituição tributária'
        else
          QItemNFind_subst_trib.Clear;
    end;

    QItemNFwMostraCusto.Value := QItemNF_CalcFieldsVL_CUSTO_MEDIO.Value;
    // Busca informação do CST do ICMS
    if QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 1 then
      QItemNFcst_icms.Value := SituacaoTributaria('CSOSN')
    else
      QItemNFcst_icms.Value := SituacaoTributaria('CST');
  end;
  QItemNFval_total_com_desconto.Value := QItemNFVAL_TOTAL.Value -
      (QItemNFVAL_DESCONTO.Value * QItemNFQT_QUANTIDADE.Value);

end;

procedure TDMNotaSaida.QNotaSaidaBeforePost(DataSet: TDataSet);
var
  Produtos: array of Variant;
  Str: string;
  I: Integer;
  wBuscador: TBuscador;
  wFlagRetornavel : Boolean;
  wProdutos :String;
  wDesconto, wDiferenca: Double;
  wValAtacado, wSenhaAntiga, wPrivilegio : string;
  wPercDescMaximo, wPrecoTabela : Double;
  wPedeDesconto : Boolean;
begin
  // serve para deixar gravado quem foi o ultimo usuario que alterou nota fiscal - César a pedido da SR
  QNotaSaidaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaSaidaDt_Usuario.Value := DMOracle.DataHoraServ;

  DMOracle.ValidaFilial(QNotaSaidaCOD_FILIAL.Text);

  SetLength(Produtos, 0);
  if not pNotaNome then // somente utilizado para nota saida consumidor reemissão caixa encopel
  begin // quando for reemissão caixa da encopel esta true este campo
    QNotaSaida.AutoCalcFields := False;
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Post;

    // ** FunRural **
    QNotaSaidaVal_Funrural.Value := 0;
    if (pConfirmando = True) and ((DMOperacao.QOperacaoIND_FUNRURAL.Value = 'S')
      or (QNotaSaidaDESC_OBS_CORPO_NOTA.IsNull)) then
    begin
      QItemNF.First;
      while not QItemNF.Eof do
      begin
        if (pConfirmando = True) and (DMOperacao.QOperacaoIND_FUNRURAL.Value = 'S') then
          QNotaSaidaVAL_FUNRURAL.Value := QNotaSaidaVAL_FUNRURAL.Value +
            DMNotaEntrada.CalculaFunrural(QItemNFCOD_PRODUTO.Value,
            QNotaSaidaCOD_OPERACAO.Value,
            QNotaSaidaCOD_CADASTRO.Value,
            QItemNFVAL_TOTAL.Value);
        if not Bib.ArrayContem(Produtos, QItemNFCOD_PRODUTO.Text) then
        begin
          I := Length(Produtos);
          SetLength(Produtos, I + 1);
          Produtos[I] := QItemNFCOD_PRODUTO.Text;
        end;
        QItemNF.Next;
      end;
    end;
  end;

  wBuscador := TBuscador.Create;
  wBuscador.Limpa;
  //wBuscador.Adiciona('DESC_MODELO', 'TB_SERIE', 'COD_SERIE = ' +
  //  QuotedStr(QNotaSaidaCOD_SERIE.Value) + ' AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text);
  for I := 0 to Length(Produtos) - 1 do
    if Produtos[i] <> '' then
    begin
      Str := MontaSelect('COD_CLASSE', 'TB_PRODUTO', 'COD_PRODUTO = ' + Produtos[i]);
      Str := MontaSelect('COD_MENSAGEM', 'TB_CLASSE', 'COD_CLASSE = (' + Str + ')');
      wBuscador.Adiciona('TRIM(DESC_MENSAGEM || ' + QuotedStr(' ') + ' || DESC_COMPLEMENTO || ' +
        QuotedStr(' ') + ' || DESC_COMPLEMENTO1 || ' + QuotedStr(' ') +
        ' || DESC_COMPLEMENTO2 || ' + QuotedStr(' ') + ' || DESC_COMPLEMENTO3 || ' +
        QuotedStr(' ') + ' || DESC_COMPLEMENTO4 || ' + QuotedStr(' ') +
        ' || DESC_COMPLEMENTO5 || ' + QuotedStr(' ') + ' || DESC_COMPLEMENTO6 || ' +
        QuotedStr(' ') + ' || DESC_COMPLEMENTO7)', 'TB_MENSAGEM',
        'COD_MENSAGEM = (' + Str + ')');
    end;
  wBuscador.Buscar;
  //Str := wBuscador.Proximo;
  while wBuscador.TemProximo do
    QNotaSaidaDESC_OBS_CORPO_NOTA.Value := Trim(QNotaSaidaDESC_OBS_CORPO_NOTA.Value +
      ' ' + wBuscador.Proximo);
  if QNotaSaidaCOD_SERIE_MODELO.Value = '55' then
  begin //Para NF-e, deve-se limpar caracteres não aceitos.
    QNotaSaidaOBS.Value := DMNfe.LimpaStrXML(QNotaSaidaOBS.Value);
    QNotaSaidaOBS_COMPLEMENTO.Value := DMNfe.LimpaStrXML(
      QNotaSaidaOBS_COMPLEMENTO.Value);
    QNotaSaidaDESC_OBS_CORPO_NOTA.Value := StringReplace(QNotaSaidaDESC_OBS_CORPO_NOTA.Value,' \n ' + chr(13)+chr(10),chr(13)+chr(10),[rfReplaceAll]);
    QNotaSaidaDESC_OBS_CORPO_NOTA.Value := StringReplace(QNotaSaidaDESC_OBS_CORPO_NOTA.Value,chr(13)+chr(10),' \n ' + chr(13)+chr(10),[rfReplaceAll]);
    QNotaSaidaDESC_OBS_CORPO_NOTA.Value := DMNfe.LimpaStrXML(QNotaSaidaDESC_OBS_CORPO_NOTA.Value,chr(13)+chr(10));
  end;
  //Calcula Pis e Cofins do Frete
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Text);
    QOperacao.Open;
    if QOperacaoPERC_BASE_PIS.Value > 0 then
      QNotaSaidaVAL_PIS_FRETE.Value :=
        (((QNotaSaidaVAL_FRETE.Value * QOperacaoPerc_Base_Pis.Value) / 100) *
        DMParamSistema.QParamSistemaPERC_PIS.Value) / 100;
    if QOperacaoPERC_BASE_COFINS.Value > 0 then
      QNotaSaidaVAL_COFINS_FRETE.Value :=
        (((QNotaSaidaVAL_FRETE.Value * QOperacaoPerc_Base_Cofins.Value) / 100) *
        DMParamSistema.QParamSistemaPERC_COFINS.Value) / 100;
  end;
  QNotaSaidaVAL_COMISSAO.Value := Bib.Arredondar((DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                fValorValeCompras) * DMNotaSaida.QNotaSaidaPERC_COMISSAO.Value / 100, 2);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  begin
    if QNotaSaidaCOD_SERIE_MODELO.Value = '2D' then
    begin
      MessageDlg('Cupom fiscal não permitido nesta tela. Para emitir cupom fiscal utilize o PAF-ECF',
        mtError, [mbOk],0);
      Abort;
    end;
  end;
  if QNotaSaidaIND_FINALIDADE_NFE.Value = 4 then //Rejeição para emissor do MT. Em devolução não deve informar o IND_INTERMEDIADOR - Regra para todos...
    QNotaSaidaIND_INTERMEDIADOR.Value := ''      //mas somente para emissor do MT (Demag filial 2) estava ocorrendo a rejeição. Junior 03/06/2026
  else
    QNotaSaidaIND_INTERMEDIADOR.Value := '0';
    //Bib.ift(((QNotaSaidaIND_PRESENCA.Value < 2) or (QNotaSaidaIND_PRESENCA.Value = 5))
//       and (QNotaSaidaIND_ENTRADA_SAIDA.Value = 'S'), '', Bib.ift(QNotaSaidaIND_INTERMEDIADOR.Value = '', '0', QNotaSaidaIND_INTERMEDIADOR.Value));

  //---------------------------------------------------------------------------------------
  //  Gian - 20/12/2018 à pedido da Dani da ferragens Medianeira, somente pra eles.
  //  Verificar o desconto concedido pelo usuario. Não deve ser menor que o preço de atacado.
  //  Autorizado por Marcos no dia 19/12/2018
  //---------------------------------------------------------------------------------------
 { if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') then
  begin
    wPedeDesconto := True;
    QItemNF.First;
    while not QItemNF.EoF do
    begin
      if wPedeDesconto then
      begin
        wValAtacado := DMOracle.FastSelect('VAL_ATACADO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
        if wValAtacado <> '' then
        begin
          wPercDescMaximo := 100 - ((StrToFloat(wValAtacado)*100)/QItemNFVAL_UNITARIO.Value);
          if (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value)) or
            (StrToFloat(wValAtacado) > (QItemNFVAL_UNITARIO.Value - QItemNFVAL_DESCONTO.Value)) then
          begin
            if FSenha = nil then
              FSenha := TFSenha.Create(Application);
            FSenha.BtConsProduto.Visible := True;
            FSenha.MeUsuario.Visible := True;
            FSenha.Label2.Visible := True;
            FSenha.CBOpcao.Visible := True;
            FSenha.CBOpcao.Caption := 'Autorizar quaisquer outros produtos.';
            FSenha.Caption := 'Conceder desconto: ' + QItemNFnome_produto.Text;
            FSenha.ShowModal;
            wSenhaAntiga := Bib.Encode(UpperCase(FSenha.EdSenha.Text+Copy(wBranco,1,10-Length(FSenha.EdSenha.Text)))); //Criptografia da Cemapa para senha de usuario
            wPrivilegio := DMOracle.FastSelect('IND_PRIVILEGIO','TB_USUARIO',
                                          'COD_USUARIO = '+ QuotedStr(Trim(FSenha.MeUsuario.Text)) +
                                          ' AND DESC_SENHA = ' + QuotedStr(wSenhaAntiga));
            if 'P' <> wPrivilegio then
              raise Exception.Create('Sem premissão para salvar. Valor unitário inferior ao permitido para ' + QItemNFnome_produto.Text +
                                    '. Valor mínimo: ' + FormatFloat('R$ ###,###,##0.00', StrToFloat(wValAtacado)));
            if FSenha.CBOpcao.Checked = True then
              wPedeDesconto := False;
          end;
        end;
      end;
      QItemNF.Next;
    end;
  end; }
{Ferragem irá trabalhar com tabela de preço, desta forma a validação do valor será realizada aqui. Alex 19/01/2024}
{  if (DMParamSistema.CodEmpresa = 'FERRAGMED') and (DMNotaSaida.QItemNFCOD_PRODUTO.Text <> '') then
  begin
    ValidaPrecoTabela(Self);
  end;}
{  begin
    wPrecoTabela := StrToFloat (DMOracle.fastselect ('VAL_PRECO','TB_TABELA_PRECO_ITEM','COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text +
                    ' AND COD_TABELA_PRECO_CAB = ' + DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text) );
    if ( (DMNotaSaida.QItemNFVAL_UNITARIO.Value - DMNotaSaida.QItemNFVAL_DESCONTO.Value) < wPrecoTabela) then
    begin
      MessageDlg ('Preço do produto esta abaixo do valor da tabela, favor verificar!', mtError, [mbOk],0);
       abort;
      DMNotaSaida.QItemNFPERC_DESCONTO.Value := 0;
      DMNotaSaida.QItemNFVAL_DESCONTO.Value := 0;
    end;
  end;}

  PopulaCalcFields;

  if sFormularioUsado = 'FNotaFrenteCaixa' then
  begin
    if (QNotaSaidaCOD_MENSAGEM.Text <> '') then
      QNotaSaidaCOD_MENSAGEM.Text := DMOracle.FastSelect('COD_MENSAGEM','TB_OPERACAO','COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text)
    else
      DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Clear;
  end;
end;

{procedure TDMNotaSaida.ValidaPrecoTabela(Sender: TObject);
var
 wPrecoTabela: Double;
begin
  if (DMNotaSaida.QItemNFCOD_PRODUTO.Text <> '') and (DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text <> '') then
  begin
    wPrecoTabela := StrToFloat (DMOracle.fastselect ('VAL_PRECO','TB_TABELA_PRECO_ITEM','COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text +
                    ' AND COD_TABELA_PRECO_CAB = ' + DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text) );
    if ( (DMNotaSaida.QItemNFVAL_UNITARIO.Value - DMNotaSaida.QItemNFVAL_DESCONTO.Value) < wPrecoTabela) then
    begin
      ShowMessage('Preço do produto esta abaixo do valor da tabela, favor verificar!');
      DMNotaSaida.QItemNFPERC_DESCONTO.Value := 0;
      DMNotaSaida.QItemNFVAL_DESCONTO.Value := 0;
      DMNotaSaida.QItemNFVAL_UNITARIO_COM_DESCONTO.Value := 0;
      DMNotaSaida.QItemNFVAL_UNITARIO.Value := StrToFloat (DMOracle.fastselect ('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text) );
    end;
  end;
end; }

//foi colocado aqui para não precisar referenciar o form FImpressoraFiscal
function TDMNotaSaida.getMD5ArqConfig: String;
var
  arqConfig: TextFile;
  wLinha: String;
begin
  if FileExists((Application.ExeName)+'ARQUIVOS_ECF\' +'config.txt') then
  begin
    AssignFile(arqConfig,
      ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\' +'config.txt');
    Reset(arqConfig);
    while not Eof(arqConfig) do
    begin
      Readln(arqConfig, wLinha);
      if Trim(wLinha) = '[MD5]' then
      begin
        Readln(arqConfig, wLinha);
        Break;
      end;
    end;
    if (Trim(wLinha) <> '') and (Trim(wLinha) <> '[/MD5]') then
      Result := bib.Decode(wLinha)
    else
      Result := '';
    CloseFile(arqConfig);
  end
  else
    Result := '';
end;

procedure TDMNotaSaida.AcertaDesconto;
 var wDiferenca:Double;
begin
{    if (pConfirmando) and (pRateouDesconto) and (QNotaSaidaVAL_DESCONTO.Value <> QSomaItemNotaSVAL_DESCONTO.Value) then
    begin
      wDiferenca := QNotaSaidaVAL_DESCONTO.Value - QSomaItemNotaSVAL_DESCONTO.Value;
      pAcertoDesconto := true;
      pConfirmando := false;
      QItemNF.First;

      if (wDiferenca > 0) then
      begin
        QItemNF.Edit;
        QItemNFVAL_DESCONTO.value := QItemNFVAL_DESCONTO.value + wDiferenca;
        QItemNF.Post;
      end
      else
        while(wDiferenca < 0) do
        begin
          if (QItemNFVAL_DESCONTO.value >= (wDiferenca * -1)) then
          begin
            QItemNF.Edit;
            QItemNFVAL_DESCONTO.value := QItemNFVAL_DESCONTO.value + wDiferenca;
            QItemNF.Post;
            wDiferenca := 0;
          end
          else
          begin
            wDiferenca := wDiferenca + QItemNFVAL_DESCONTO.Value;
            QItemNF.Edit;
            QItemNFVAL_DESCONTO.value := 0;
            QItemNF.Post;
            QItemNF.Next;
          end;
        end;
      pAcertoDesconto := false;
      pRateouDesconto := false;
      pConfirmando := true;
    end;}
end;

procedure TDMNotaSaida.QSomaItemNotaCalcFields(DataSet: TDataSet);
var wTipoCliente: string;
begin
  QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
    + QSomaItemNotaSVal_Ipi.Value
    + QSomaItemNotasVal_Icms_Subst.Value
    + QSomaItemNotaSVAL_DESPESAS.Value
    - QSomaItemNotaSVAL_DESCONTO.Value
    - Bib.ift(QNotaSaidaCOD_SERIE_MODELO.Value <> '98', 0,
        Bib.ift((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 3) and
          (QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO.Value = 'SIM'), QSomaItemNotaSVAL_PIS.Value +
        QSomaItemNotaSVAL_COFINS.Value, 0) +
        QSomaItemNotaSVAL_CSLL.Value +
        QSomaItemNotaSVAL_INSS.Value +
        QSomaItemNotaSVAL_IR.Value)
    //- QNotaSaidaVal_Desconto.Value
    + QNotaSaidaVal_FunRural.Value
    + Bib.ift((QNotaSaidaNUM_CONHECIMENTO_FRETE.Value = 0) and (QNotaSaidaIND_TIPO_FRETE.Value = 'FOB'),
      QSomaItemNotaSVAL_FRETE.Value,0);  //Alterado por Adriel
                                         //para somar o valor do frete
                                         //na NF-e (27/09/2013)
                                         //Soma somente se o nº do
                                         //conhecimento for nulo;
  // COMENTADO POR GERAR ERRO DE TROCO NA EMISSÃO DA NFE - CLEBER 29/03/2021
  //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ENERMED' then // Colocado 09/02/2021 - César - nao desconta estes impostos no total da nota
  //   QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total_Nota.Value +
  //      QSomaItemNotaSVAL_PIS.Value + QSomaItemNotaSVAL_COFINS.Value + QSomaItemNotaSVAL_CSLL.Value;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAZENDA') then
    QSomaItemNotaSVal_Total_Nota.Value := Bib.NumToTextoArredondamento(QSomaItemNotaSVal_Total.Value
      + QSomaItemNotaSVal_Ipi.Value
      - QSomaItemNotaSVal_INSS.Value
      + QSomaItemNotasVal_Icms_Subst.Value
      + QSomaItemNotaSVAL_DESPESAS.Value
      - (QSomaItemNotaSVal_Total.Value * QNotaSaidaVal_Desconto.Value) / 100
      + QNotaSaidaVal_FunRural.Value, 2)
      + Bib.ift((QNotaSaidaNUM_CONHECIMENTO_FRETE.Value = 0) and (QNotaSaidaIND_TIPO_FRETE.Value = 'FOB'),
          QSomaItemNotaSVAL_FRETE.Value,0);

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
  begin
    if QNotaSaidaIND_TIPO_FRETE.Value = 'FOB' then
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
        + QSomaItemNotaSVal_Ipi.Value
        - QSomaItemNotaSVal_INSS.Value
        + QSomaItemNotasVal_Icms_Subst.Value
        + QSomaItemNotaSVAL_DESPESAS.Value
        - QSomaItemNotaSVAL_DESCONTO.Value
        + QNotaSaidaVal_FunRural.Value
        + QNotaSaidaVAL_FRETE.Value //foi colocado frete para Medipeças
    else
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
        + QSomaItemNotaSVal_Ipi.Value
        - QSomaItemNotaSVal_INSS.Value
        + QSomaItemNotasVal_Icms_Subst.Value
        + QSomaItemNotaSVAL_DESPESAS.Value
        - QSomaItemNotaSVAL_DESCONTO.Value
        + QNotaSaidaVal_FunRural.Value
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
     (DMParamSistema.QParamSistemaCod_Empresa.Text = 'DISPART') then
  begin
    wTipoCliente := DMOracle.BuscaNome('SELECT COD_TIPO_CADASTRO FROM TB_CADASTRO', 'COD_CADASTRO=' + QNotaSaidaCOD_CADASTRO.Text);
    if (QNotaSaidaCOD_ESTADO.Value = 'PR') then
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
        + QSomaItemNotaSVal_Ipi.Value
        - QSomaItemNotaSVal_INSS.Value
        + QSomaItemNotasVal_Icms_Subst.Value // Descomentado por Djeison 22/01/2013
      + QSomaItemNotaSVAL_DESPESAS.Value
        - QSomaItemNotaSVAL_DESCONTO.Value
        + QNotaSaidaVal_FunRural.Value
        + Bib.ift((QNotaSaidaNUM_CONHECIMENTO_FRETE.Value = 0) and (QNotaSaidaIND_TIPO_FRETE.Value = 'FOB'),
          QSomaItemNotaSVAL_FRETE.Value,0)
    else
      if wTipoCliente = '7' then
        QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
          + QSomaItemNotaSVal_Ipi.Value
          - QSomaItemNotaSVal_INSS.Value
          + QSomaItemNotasVal_Icms_Subst.Value // Descomentado por Djeison 22/01/2013
        + QSomaItemNotaSVAL_DESPESAS.Value
          - QSomaItemNotaSVAL_DESCONTO.Value
          + QNotaSaidaVal_FunRural.Value
          + Bib.ift((QNotaSaidaNUM_CONHECIMENTO_FRETE.Value = 0) and (QNotaSaidaIND_TIPO_FRETE.Value = 'FOB'),
            QSomaItemNotaSVAL_FRETE.Value,0);
  end;
 // Comentado pois o Diniz saiu do simples e ao emitir uma nota com aliquota de ICMS estava descontando do valor final da nota. Alex 01/03/2023
 //Diniz voltou para Simples. Descomentado o código Junior 15/01/2024.
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') and (QSomaItemNotasVal_Icms_Subst.Value = 0)) then
  begin
    CalculaICM;
    QSomaItemNotasVal_Icms_Subst.Value := QSomaItemNotasVal_Icms_Subst.Value + QItemNFVAL_ICMS_SUBST.Value;
    QSomaItemNotaSVAL_BASE_SUBST.Value := QSomaItemNotaSVAL_BASE_SUBST.Value + QItemNFVAL_BASE_SUBST.Value;
//    if ((QNotaSaidaCOD_ESTADO.Value = 'RS') or (QNotaSaidaCOD_ESTADO.Value = 'SC') or
//        (QNotaSaidaCOD_ESTADO.Value = 'ES')) then  retirado pelo César depois de conversar com o Diniz 12/12/2011
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
        + QSomaItemNotaSVal_Ipi.Value
        - QSomaItemNotaSVal_INSS.Value
        + QSomaItemNotasVal_Icms_Subst.Value
        - QSomaItemNotaSVAL_ICM.Value
        + QSomaItemNotaSVAL_DESPESAS.Value
        - QSomaItemNotaSVAL_DESCONTO.Value
        + QNotaSaidaVal_FunRural.Value
        + Bib.ift((QNotaSaidaNUM_CONHECIMENTO_FRETE.Value = 0) and (QNotaSaidaIND_TIPO_FRETE.Value = 'FOB'),
            QSomaItemNotaSVAL_FRETE.Value,0);

  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ' then //MARCOS 07/01/21 ADICIONAR O VALOR DO FRETE NO TOTAL DA NOTA
  begin
    if QNotaSaidaIND_TIPO_FRETE.Value = 'CIF' then
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
        + QSomaItemNotaSVal_Ipi.Value
        - QSomaItemNotaSVal_INSS.Value
        + QSomaItemNotasVal_Icms_Subst.Value
        + QSomaItemNotaSVAL_DESPESAS.Value
        - QSomaItemNotaSVAL_DESCONTO.Value
        + QNotaSaidaVal_FunRural.Value
        + QNotaSaidaVAL_FRETE.Value;
  end;
  if DMParamSistema.CodEmpresa = 'DEBONA' then //Junior 13/08/2024 ADICIONAR O VALOR DO FRETE NO TOTAL DA NOTA. SOLIC. LEONIR.
  begin
    QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
    + QSomaItemNotaSVal_Ipi.Value
    + QSomaItemNotasVal_Icms_Subst.Value
    + QSomaItemNotaSVAL_DESPESAS.Value
    - QSomaItemNotaSVAL_DESCONTO.Value
    - Bib.ift(QNotaSaidaCOD_SERIE_MODELO.Value <> '98', 0,
        Bib.ift((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 3) and
          (QItemNF_CalcFieldsIND_PIS_COFINS_RETIDO.Value = 'SIM'), QSomaItemNotaSVAL_PIS.Value +
        QSomaItemNotaSVAL_COFINS.Value, 0) +
        QSomaItemNotaSVAL_CSLL.Value +
        QSomaItemNotaSVAL_INSS.Value +
        QSomaItemNotaSVAL_IR.Value)
    //- QNotaSaidaVal_Desconto.Value
    + QNotaSaidaVal_FunRural.Value
    + QSomaItemNotaSVAL_FRETE.Value;
  end;
  if QSomaItemNotaIND_ISS_RETIDO.Value = 1 then
      QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total_Nota.Value - QSomaItemNotaSVAL_ISS.Value;
  QSomaItemNotasval_a_pagar.Value := QSomaItemNotaSVAL_TOTAL.Value
      - QSomaValesSVAL_VALE_COMPRAS.Value
      - QSomaValesSVAL_VALE_PRESENTE.Value
      - QSomaItemNotaSVAL_DESCONTO.Value
      + QSomaItemNotaSVAL_DESPESAS.Value;

end;

function TDMNotaSaida.Contribuinte: boolean;
var wFJ, wIE, wIndContribuinte: string;
begin

  wFJ := '';
  wIE := '';
  wIndContribuinte := '';

  wFJ := QItemNF_CalcFieldsIND_FISICA_JURIDICA.Value;
  wIE := QItemNF_CalcFieldsNUM_INSCRICAO.Value;
  wIndContribuinte := QItemNF_CalcFieldsIND_CONTRIBUINTE.Value;

  if wFJ = 'F' then
    result := false
  else
    if ((wFJ = 'J') and (((trim(wIE) = 'ISENTO') and (wIndContribuinte = 'NAO'))
        OR (trim(wIE) = ''))) then
      result := false
    else
      result := true;
end;

function TDMNotaSaida.SituacaoTributaria(pTipo: string): string;
var wFJ, wIE, wIndContribuinte: string;
begin
  wFJ := '';
  wIE := '';
  wIndContribuinte := '';

  wFJ := QItemNF_CalcFieldsIND_FISICA_JURIDICA.Value;
  wIE := QItemNF_CalcFieldsNUM_INSCRICAO.Value;
  wIndContribuinte := QItemNF_CalcFieldsIND_CONTRIBUINTE.Value;

  if pTipo = 'CST' then
  begin
    if wFJ = 'F' then
      result := QItemNF_CalcFieldsDESC_SITUACAO_TRIB_NC.Value
    else
      if ((wFJ = 'J') and (((trim(wIE) = 'ISENTO') and (wIndContribuinte = 'NAO'))
        OR (trim(wIE) = ''))) then
        result := QItemNF_CalcFieldsDESC_SITUACAO_TRIB_NC.Value
      else
        result := QItemNF_CalcFieldsDESC_SITUACAO_TRIB.Value;
  end
  else
  begin
    if wFJ = 'F' then
      result := QItemNF_CalcFieldsDESC_CSOSN_NC.Value
    else
      if ((wFJ = 'J') and (((trim(wIE) = 'ISENTO') and (wIndContribuinte = 'NAO'))
        OR (trim(wIE) = ''))) then
        result := QItemNF_CalcFieldsDESC_CSOSN_NC.Value
      else
        result := QItemNF_CalcFieldsDESC_CSOSN.Value
  end;
end;

procedure TDMNotaSaida.CalculaICM;
  procedure GetBaseEAliquotaSubs(var wPercAliqSubs:Real; var wBaseAliqSubs:Real
    ;var wAliqDiferencial: Real);
  begin
    {if (DMEstado.QEstado.Eof) Or (DMEstado.QEstadoCod_Estado.Value <> QNotaSaidaCod_Estado.Value) Then
     Begin }                   // Retirado temporáriamente para não causar inconsistência no cálculo de icms diferencial
       DMEstado.QEstado.Close;
       DMEstado.QEstado.SetVariable('COD_ESTADO', QNotaSaidaCod_Estado.Value);
       DMEstado.QEstado.Open;
     //End;
    If (DMCadastro.QCadastro.Eof) or (DMCadastro.QCadastroCod_Cadastro.Value <> QNotaSaidaCOD_CADASTRO.Value) Then
     Begin
       DMCadastro.QCadastro.Close;
       DMCadastro.QCadastro.SetVariable('PK',QNotaSaidaCOD_CADASTRO.Value);
       DMCadastro.QCadastro.Open;
     End;

    wPercAliqSubs := DMEstado.QEstadoPERC_ALIQ_SUBST.Value;
    wAliqDiferencial := DMEstado.QEstadoPERC_ALIQUOTA_DIFERENCIAL.Value;

    if (QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value = 3) or
       (((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 3) and
         (DMCadastro.QCadastroIND_REGIME_TRIBUTARIO.Value = 3)) or
        ((QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 3) and
         (DMEstado.QEstadoPERC_TRIBUTADO_SN.Value = 0))) then
      wBaseAliqSubs := DMEstado.QEstadoPERC_BASE_SUBST.Value
    else
      wBaseAliqSubs := DMEstado.QEstadoPERC_TRIBUTADO_SN.Value;

    DmTributacao.QProdutoSubstTribCons.Close; // esta trabalhando com esta tabela para o caso de produtos com substituicao diferente dentro do mesmo estado  - Cesar - 04/02/2010
    DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Produto', QItemNFCod_Produto.Value);
    DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Estado', QNotaSaidaCod_Estado.Value);
    DMTributacao.QProdutoSubstTribCons.SetVariable('COD_FILIAL', QNotaSaidaCOD_FILIAL.Value);
    DmTributacao.QProdutoSubstTribCons.Open;

    if not (DmTributacao.QProdutoSubstTribCons.Eof) then
    begin
      wPercAliqSubs := DmTributacao.QProdutoSubstTribConsPERC_ALIQUOTA.Value;

      if (DMCadastro.QCadastroIND_REGIME_TRIBUTARIO.Value = 3) or
         (DmTributacao.QProdutoSubstTribConsPERC_TRIBUTADO_SN.Value = 0) then
        wBaseAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Tributado.Value
      else
        wBaseAliqSubs := DmTributacao.QProdutoSubstTribConsPERC_TRIBUTADO_SN.Value;

      // Para diferencial de alíquotas por produto
      {if DMTributacao.QProdutoSubstTribConsPERC_ALIQUOTA_DIFERENCIAL.Value > 0 then
        wAliqDiferencial
          := DMTributacao.QProdutoSubstTribConsPERC_ALIQUOTA_DIFERENCIAL.Value;}
    end;
    DmTributacao.QProdutoSubstTribCons.Close;
    if DMCadastro.QCadastroPERC_BASE_SUBSTITUICAO.Value > 0 Then  // alguns clientes tem liminar para aliquota de substituição no estado
    begin                                                         // este campo raramente estara preenchido - cesar 27/06/2014
      wBaseAliqSubs := DMCadastro.QCadastroPERC_BASE_SUBSTITUICAO.Value;
      wPercAliqSubs := DMCadastro.QCadastroPERC_ALIQ_SUBSTITUICAO.Value;
    end;
  end;

  function CalculaIcmsDiferencial: Boolean;
  begin
    result := false;
    if (QNotaSaidaCOD_ESTADO.Value <> QItemNF_CalcFieldsESTADO_FILIAL.Value)
      {
       and
      (not TriburacaoEOperacaoTemSubstituicao) and
      (DMTributacao.QTributacaoPERC_ALIQUOTA.Value <> 4) // Produtos importados
      }
      and (QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S') then
        result := true;
  end;

  function SituacaoTributariaIsencao(pCST, pCSOSN: string): Boolean;
  begin
    Result := false;
    if QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 1 then
      pCSOSN := ''
    else
      pCST := '';
    if(Copy(pCST, 2, 2) = '40') or // Isenta
      (Copy(pCST, 2, 2) = '30') or // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
      (Copy(pCST, 2, 2) = '41') or // Não Tributada
      (Copy(pCST, 2, 2) = '50') or // Suspensão

      (pCSOSN = '101') or
      (pCSOSN = '102') or
      (pCSOSN = '103') or
      (pCSOSN = '201') or
      (pCSOSN = '202') or
      (pCSOSN = '203') or
      (pCSOSN = '300') or
      (pCSOSN = '400') or
      (pCSOSN = '500') then
        result := True;
  end;

  function TriburacaoEOperacaoTemSubstituicao(pCST, pCSOSN: string): Boolean;
  begin
    result := False;

    // Não deve calcular ST para consumidor final
    if QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S' then
      exit;

    if QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 1 then
      pCSOSN := ''
    else
      pCST := '';

    if ((DMOperacao.QOperacaoInd_Vendas.Value      = 'V')  or
      (DMOperacao.QOperacaoInd_Transferencia.Value = 'S')  or
      (DMOperacao.QOperacaoInd_Compras.Value       = 'D')  or
      (DMOperacao.QOperacaoInd_Bonificacao.Value   = 'S')) and
      (DMOperacao.QOperacaoInd_Emite.Value         = 'F')  then
        if(Copy(pCST, 2, 2) = '10') or // Tributada e com cobranca de icms por substituicao tributaria
          (Copy(pCST, 2, 2) = '30') or // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
    //    (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
          (Copy(pCST, 2, 2) = '70') or
          (Copy(pCST, 2, 2) = '90') or
          (pCSOSN ='201') or //
          (pCSOSN ='202') or
          (pCSOSN ='203') or
          (pCSOSN ='900') then
            result := True;
  end;

  function CalculaICMSParaDescontar(pCST, pCSOSN: string): Boolean;
  begin
    result := False;
    if QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 1 then
      pCSOSN := ''
    else
      pCST := '';
    if((Copy(pCST, 2, 2) = '30') or // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
      (pCSOSN ='201') or
      (pCSOSN ='202') or
      (pCSOSN ='203')) then
      result := True;
  end;
  function TemDiferimento(pCST, pCSOSN: string): Boolean;
  begin
    Result := False;
    if QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value <> 1 then
      pCSOSN := ''
    else
      pCST := '';
    if ((Copy(pCST, 2, 2) = '51') or
        (Copy(pCST, 2, 2) = '10') or
        (Copy(pCST, 2, 2) = '90') or
        (pCSOSN = '201') or
        (pCSOSN = '202') or
        (pCSOSN = '203') or
        (pCSOSN = '900')) and
       (QItemNF_CalcFieldsPERC_DIFERIMENTO.Value > 0) then
      Result := True;
  end;

  function ConsideraReducaoIcmsNaBaseSubstituicao: Boolean;
  begin
    result := true;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
      result := false; //ARZ nao quer que considere
  end;

  function GetAliquotaICMSProprio: Double;
  begin
    if QNotaSaidaCOD_ESTADO.Value = QItemNF_CalcFieldsESTADO_FILIAL.Value then
      Result := DMEstado.QEstadoPERC_ALIQUOTA_DIFERENCIAL.Value
    else if (pos(QNotaSaidaCOD_ESTADO.Value,',AC,AL,AM,AP,BA,CE,DF,ES,GO,MA,MT,MS,'+
        'PA,PB,PE,PI,RN,RO,RR,SE,TO,') > 0) and
       (pos(QItemNF_CalcFieldsESTADO_FILIAL.Value,',MG,PR,RS,RJ,SC,SP,') > 0) then
      Result := 7
    else
      Result := 12;
  end;

  function BaseCalculoICMS(wAuxBase: double; wDesconto: double;
    wPercDesc: double): double;
  var valorIpi: double;
  begin
    valorIpi := 0;

    if //(QItemNF_CalcFieldsIND_CONSIDERA_IPI_BC_ICMS.Value = 'S') and
      (DMParamSistema.IndCalculoICMS <> 'NOTA')
      and (QItemNF_CalcFieldsIND_TRANSFERENCIA.Value <> 'S')
      and (QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S') then
    begin
      valorIpi := QItemNFVAL_IPI.Value;
      // Operação de simples remessa
      if DMOracle.FastSelect('IND_FUTURA_CLIENTE', 'TB_OPERACAO',
        'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text) = 'S' then
      begin
        // Nota de Venda futura referenciada
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
          valorIpi := 0
        else
        begin
          if QNotaReferenciada.Eof then
          begin
            if QNotaReferenciadaCOD_NOTA_CAB.Value <> QNotaSaidaCOD_NOTA_CAB.Value then
            begin
              QNotaReferenciada.Close;
              QNotaReferenciada.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
              QNotaReferenciada.Open;
            end;
          end;
          if not QNotaReferenciada.Eof then
          begin
            QNotaReferenciadaItem.Close;
            QNotaReferenciadaItem.SetVariable('COD_NOTA_CAB', QNotaReferenciadaCOD_NOTA_CAB_REF.Value);
            QNotaReferenciadaItem.Open;
            if QNotaReferenciadaItem.Locate('COD_PRODUTO;COD_LOTE_TIPO'
              , varArrayOf([QItemNFCOD_PRODUTO.Text, QItemNFCOD_LOTE_TIPO.Text]), []) then
            begin
              valorIpi := QNotaReferenciadaItemVAL_IPI.Value;
            end;
          end;
        end;
      end;
      //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
//        result :=
//          ((((QItemNFVal_Total.Value - wDesconto) * wPercDesc) + valorIpi) * wAuxBase / 100)
//      else
      result :=
        ((((QItemNFVal_Total.Value + valorIpi - wDesconto) * wPercDesc)* wAuxBase / 100));
      QItemNFIND_CONSIDERA_IPI_BC_ICMS.Value := 'S';
    end
    else
    begin
      if DMOracle.FastSelect('IND_CONSIDERA_FRETE_BC_ICMS','TB_FILIAL','COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.AsString) = 'S' then
        Result :=
            ((((QItemNFVal_Total.Value + QItemNFVAL_FRETE.Value + valorIpi - wDesconto) * wPercDesc)* wAuxBase / 100))
      else
        result := ((QItemNFVal_Total.Value - wDesconto) * wPercDesc) * wAuxBase / 100 ;
    end;
  end;
  function CfopRetorno: Boolean;
  var cfop: String;
  begin
    result := false;
    if(QNotaSaidaCOD_ESTADO.Value = QItemNF_CalcFieldsESTADO_FILIAL.Value) then
      cfop := DMOperacao.QOperacaoNUM_NATUREZA_EST_NOVO.Text
    else
      cfop := DMOperacao.QOperacaoNUM_NATUREZA_INT_NOVO.Text;
    if(pos(cfop,'1415,1904,241529041554,2554,1906,1907,'+
           '2906,2907,1909,1913,1914,1916,2909,2913,'+
           '2914,2916,1925,2925,2949,1949,5909,6909,'+
           '5913,5914,5915,5916,6913,6916,5949,6949') > 0) then
      result := true;
  end;

var wPercICM, wPercAliqSubs, wBaseAliqSubs, wIcm, wPercDif: Real;
  wPercDesc, wAuxBase, wTotal, wicmsSimples, wDesconto, wPrecoPauta,
  rBaseCBSIBS: Real;
  wTipoCalculo, wTipoCliente: string;
//    wClasse : Integer;
  wConsumidorFinal, wConsideraDescontoBaseICMS,
  wConsideraIPIBaseSubst, wConsideraReducaoBaseSubst: Boolean;
  wAliqDiferencial, wBCIcmsDiferencial, wPercICMSInterPart: Real;
  wCst, wCsosn: string;
  rCalculaImposto: TImpostosCalculados;
begin
  wPercAliqSubs := 0;
  wBaseAliqSubs := 0;
  wPercDesc := 0;
  wIcm := 0;
  wDesconto := 0;
  wAliqDiferencial := 0;
  wBCIcmsDiferencial := 0;
  wPercICMSInterPart := 0;
  rBaseCBSIBS := 0;

  //PARA RETIFOZ SÓ CALCULA CASO SEJA FORA DO PARANÁ - CLEBER 19/08/2020 - SOLICITAÇÃO MARCOS
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ') and (QNotaSaidaCOD_ESTADO.Value = 'PR') then
    exit;

  if ((QNotaSaidaIND_FINALIDADE_NFE.Value = 1) and not CfopRetorno)
      or ((QItemNFVAL_ICM_BASE.Value = 0) and (QItemNFVAL_ICMS_SUBST.Value = 0) and
        (CfopRetorno or (QNotaSaidaIND_FINALIDADE_NFE.Value =4) or ((QNotaSaidaIND_FINALIDADE_NFE.Value = 2) and (QItemNFVAL_BASE_SUBST.Value = 0) and (QItemNFVAL_ICMS_SUBST.Value = 0) ))) then
  begin
    try
      if Trim(QItemNFCod_Tributacao.Text) <> '' then
      begin
        // Retirado para evitar problemas de atualização de preenchimento de CST e CSOSN para não contribuintes.
        {if (DMTributacao.QTributacaoCod_Tributacao.Value <> QItemNFCod_Tributacao.Value) Or
           (DMTributacao.QTributacao.Eof) then
        begin}
        //DMTributacao.QTributacao.Close;
//        DMTributacao.QTributacao.SetVariable('Pk', QItemNFCod_Tributacao.Value);
//        DMTributacao.QTributacao.Open;
        //end;

        wPercICM := QItemNF_CalcFieldsPERC_ALIQUOTA.Value;
        wAuxBase := QItemNF_CalcFieldsPERC_TRIBUTADO.Value;
        wPercDif := QItemNF_CalcFieldsPERC_DIFERIMENTO.Value;

        if QSomaItemNotaSVal_Total.Value > 0 then
          wTotal := QSomaItemNotaSVal_Total.Value
        else
          wTotal := QItemNFVal_Total.Value;

        wCst := SituacaoTributaria('CST');
        wCsosn := SituacaoTributaria('CSOSN');
        if wTotal <> 0 then
        begin
          if(DMParamSistema.IndCalculoICMS = 'NOTA') then                 //se a base de calculo deve ser o valor total da nota, ou o valor total dos produtos.
            wPercDesc := 1 + (QItemNFVAL_DESPESAS.Value - (QItemNFVAL_DESCONTO.Value * QItemNFQT_QUANTIDADE.Value)
              - QItemNFVAL_DESCONTO_RATEIO.Value +
              Bib.ift(not Contribuinte or (QNotaSaidaIND_CONSUMIDOR_FINAL.Value = 'S'), QItemNFVAL_IPI.Value, 0))/ QItemNFVAL_TOTAL.Value
            //wPercDesc := 1 + (QNotaSaidaVal_Despesas.Value - QSomaItemNotaSVAL_DESCONTO.Value) / wTotal
          else
          begin
            wPercDesc := 1;
            // Soma os descontos dos itens da nota para subtraí-los do total dos produtos se o parâmetro for igual a 'S'
            wConsideraDescontoBaseICMS := QItemNF_CalcFieldsIND_CONSIDERA_DESC_BC.Value = 'S';
            if wConsideraDescontoBaseICMS then
              wDesconto := (QItemNFVAL_DESCONTO.Value * QItemNFQT_QUANTIDADE.Value) + QItemNFVAL_DESCONTO_RATEIO.Value;
          end;
        end;

        if wAuxBase > 0 then
        begin
          QItemNFVal_ICM_Base.Value := RoundTo(BaseCalculoICMS(wAuxBase, wDesconto, wPercDesc), -2);
          if TemDiferimento(wCst, wCsosn) then
          begin
            if wCst = '051' then
              QItemNFVal_ICM.Value := RoundTo((QItemNFVal_ICM_Base.Value * wPercICM / 100) - ((QItemNFVal_ICM_Base.Value * wPercICM / 100) * wPercDif /100), -2)
            else
              QItemNFVal_ICM.Value := RoundTo(QItemNFVal_ICM_Base.Value * (RoundTo(wPercICM - (wPercICM * wPercDif /100),-2))  / 100,-2);
          end
          else
            QItemNFVal_ICM.Value := QItemNFVal_ICM_Base.Value * wPercICM / 100;
        end
        else
        begin
          QItemNFVal_ICM_Base.Value := 0;
          QItemNFVAL_ICM.Value := 0;
        end;

        if TriburacaoEOperacaoTemSubstituicao(wCst, wCsosn) then
        begin
          GetBaseEAliquotaSubs(wPercAliqSubs, wBaseAliqSubs, wAliqDiferencial); //pega os valores da base de calculo e aliquota do icms por substituição tributaria.
          QItemNFPERC_BASE_SUBST.Value := wBaseAliqSubs;
          if (DMCadastro.QCadastroIND_REGIME_TRIBUTARIO.Value <> 3) and  //implementado por Adriel em 09/05/2014 para Provina
             (DMEstado.QEstadoPERC_REDUCAO_ICMS_SUBST.Value > 0) and     //modificado por Adriel em 07/06/2017 adequação para
             (wBaseAliqSubs > 100) then                                  //ficar em conformidade com o art. 12-D do decreto Nº 10835 DE 23/04/2014
            wBaseAliqSubs := wBaseAliqSubs - ((wBaseAliqSubs - 100) *
              (100 - DMEstado.QEstadoPERC_REDUCAO_ICMS_SUBST.Value) / 100);

          // Rotina para verificar se tem preco pauta para calculo de icms
          wTipoCalculo := QItemNF_CalcFieldsIND_SUBSTITUICAO.Value;
          wPrecoPauta := QItemNF_CalcFieldsVAL_PAUTA.Value;
          //wConsideraIPIBaseSubst := QItemNF_CalcFieldsIND_CONSIDERA_IPI_BC_SUBST.Value = 'S';
          wConsideraReducaoBaseSubst:= QItemNF_CalcFieldsIND_CONSIDERA_RED_BASE_SUBST.Value = 'S';
          if (wPrecoPauta > 0) and (wTipoCalculo = 'P') then // calculo por pauta cfe tabela de filial
          begin
            QItemNFVal_Base_Subst.Value := wPrecoPauta * QItemNFQt_Quantidade.Value;
          end   //ALTERADO POR ADRIEL EM 29/09/2014 PARA CONSIDERAR AQUI SOMENTE O PARÂMETRO DE SUBSTITUIÇÃO TRIBUTÁRIA
          else //if wConsideraIPIBaseSubst then
          begin
            if ((CalculaICMSParaDescontar(wCst, wCsosn)) and (wAuxBase = 0)) then
               wAuxBase := 100;
            if not wConsideraReducaoBaseSubst then
              wAuxBase := 100;
            QItemNFVal_Base_Subst.Value := RoundTo((((QItemNFVal_Total.Value - wDesconto + QItemNFVAL_IPI.Value) * wPercDesc) * wAuxBase / 100) * wBaseAliqSubs / 100,-2);
          end;
          //else
//          begin
//            if CalculaICMSParaDescontar(wCst, wCsosn) then
//              QItemNFVal_Base_Subst.Value := RoundTo(((QItemNFVal_Total.Value - wDesconto)* wPercDesc) * wBaseAliqSubs / 100,-2)
//            else
//            begin
//              if not wConsideraReducaoBaseSubst then
//                wAuxBase := 100;
//              QItemNFVal_Base_Subst.Value := RoundTo((((QItemNFVal_Total.Value - wDesconto) * wPercDesc) * wAuxBase / 100)  * wBaseAliqSubs / 100,-2);
//            end;
//          end;

          // Regra implementada para empresas com filiais enquadradas em regimes tributários diferentes
          // Se cliente for não contribuinte, não deve calcular ST
          if not Contribuinte then
            QItemNFVAL_BASE_SUBST.Value := 0;

          QItemNFVal_Icms_Subst.Value := RoundTo(QItemNFVal_Base_Subst.Value * wPercAliqSubs / 100,-2);

          if (CalculaICMSParaDescontar(wCst, wCsosn)) then // calcula icms do parana para descontar da substituicao mas nao deve sair na nota fiscal o ICMS do Parana - César
          begin
            if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
               (DMParamSistema.QParamSistemaCod_Empresa.Text = 'DISPART') Then
              wIcm := QItemNFVal_Total.Value * GetAliquotaICMSProprio /100
            else
            begin
              //Modificado por Adriel Inácio Dias em 04/11/2016
              //Para calcular o icms próprio de maneira mais eficiente para (CSOSN 201, 202, 203) e CST 30
              wicmsSimples := GetAliquotaICMSProprio;
              wIcm := 0;
              if wIcmsSimples > 0 then
                wIcm :=  ((QItemNFVal_Total.Value - wDesconto) * wPercDesc) * ((wicmsSimples - (wicmsSimples * wPercDif / 100))/100)
            end;
          end;

          If DMCadastro.QCadastroPERC_BASE_SUBSTITUICAO.Value > 0 Then  // quando for substituicao por cliente nao desconto o ICMS do Paraná
           Begin
             QItemNFDESC_INF_ADICIONAL.Value := DMCadastro.QCadastroDESC_LEI_SUBSTITUICAO.Value;
             wIcm := 0;
           End;

          wConsumidorFinal := QItemNF_CalcFieldsIND_CONSUMIDOR_FINAL.Value = 'SIM';
          if ( (QItemNF_CalcFieldsIND_FISICA_JURIDICA.Value = 'F') and (DMCadastro.QCadastroIND_CONTRIBUINTE.Value = 'NAO') ) or
             ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') and wConsumidorFinal) then  // PARA PESSOA FISICA NAO CALCULA SUBSTITUICAO TRIBUTARIA
          begin
            QItemNFVal_Icms_Subst.Value := 0;
            QItemNFVal_Base_Subst.Value := 0;
          end
          else
          begin
            if QItemNFVal_Icms_Subst.Value <> 0 then
            begin
              if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE') then
              begin
                if (QNotaSaidaCod_Estado.Value <> 'RO') and (QNotaSaidaCod_Estado.Value <> 'MG') and (QNotaSaidaCod_Estado.Value <> 'SP') then
                  QItemNFVal_Icms_Subst.Value := RoundTo(QItemNFVal_Icms_Subst.Value - QItemNFVal_ICM.Value - wIcm,-2); // variavle wIcm somente tem valor nas nf o Diniz
              end
              else
                If DMCadastro.QCadastroPERC_BASE_SUBSTITUICAO.Value = 0 Then  // quando for substituicao por cliente nao desconto o ICMS do Paraná
                   QItemNFVal_Icms_Subst.Value := RoundTo(QItemNFVal_Icms_Subst.Value - QItemNFVal_ICM.Value - wIcm,-2);
              if QItemNFVal_Icms_Subst.Value = 0 then
                QItemNFVal_Base_Subst.Value := 0;
            end;
          end;
        end
        else
        begin
          if (RightStr(wCst, 2) <> '60') and
             (wCsosn <> '500') then
          begin
            QItemNFVal_Base_Subst.Value := 0;
            QItemNFVAL_ICMS_SUBST.Value := 0;
          end;
        end;

        QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value := 0;
        QItemNFVAL_ICMS_DIFERENCIAL.Value := 0;
        if (CalculaIcmsDiferencial) then
        begin
          // Cálculo de icms com diferencial de alíquota
          // Só faz o cálculo se tiver alíquota diferencial cadastrada
          GetBaseEAliquotaSubs(wPercAliqSubs, wBaseAliqSubs, wAliqDiferencial);
          if (wAliqDiferencial > 0) and (wAliqDiferencial <> wPercICM) then
          begin
            if DMOracle.FastSelect('IND_CALCULO_ICMS_DIFERENCIAL', 'TB_PARAM_SISTEMA'
              , '1 = 1') = 'NORMAL' then
            begin

              wAliqDiferencial := ABS(wPercICM - wAliqDiferencial);
              wBCIcmsDiferencial :=  QItemNFVal_ICM_Base.Value;
              if strToFloat(dmoracle.FastSelect('ARREDONDAMENTO('
                + quotedStr(floatToStr(wAliqDiferencial))
                + ', 2)', 'DUAL', '1=1')) > 0 then
                  QItemNFVAL_ICMS_DIFERENCIAL.Value := wBCIcmsDiferencial
                    * wAliqDiferencial / 100;
              QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value := wAliqDiferencial;

            end
            else
            begin
              // Cálculo por dentro
              {wBCIcmsDiferencial :=
                (QItemNFVAL_ICM_BASE.Value / (1 - wAliqDiferencial / 100));
              QItemNFVAL_ICMS_DIFERENCIAL.Value :=
                wBCIcmsDiferencial * wPercICM / 100;
              QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value := wAliqDiferencial; // Cálculo errado. Cleber 23/05/26}
              wBCIcmsDiferencial := QItemNFVal_ICM_Base.Value;
              if wBCIcmsDiferencial > 0 then
              begin
                QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value := ABS(QItemNFVAL_ICM.Value / QItemNFVal_ICM_Base.Value) * 100;
                QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value := QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value - wAliqDiferencial;
                QItemNFVAL_ICMS_DIFERENCIAL.Value :=  Abs((QItemNFPERC_ALIQ_ICMS_DIFERENCIAL.Value / 100) * QItemNFVal_ICM_Base.Value);
              end;
            end;
          end;
        end; // Fim do cálculo de icms com diferencial

      end;
    except
      raise; //aqui
      //Raise Exception.Create ('Erro no Calculo de Icms');
    end;
  end;

  // REALIZAÇÃO DO CÁLCULO DO IBS E CBS PARA 2026 - FASE DE TESTES CALCULANDO AS INFORMAÇÕES
  // NA NOTA PARA VALIDAÇÃO DURANTE O ANO E AJUSTANDO AS INFORMAÇÕES NO PERÍODO
  {Adicionado ind_finalidade_nfe para quando for nota de devolução. Alex 14/09/2026}
  //Removido para QItemNFBeforPost (Ness bloco estava sem valor de PIS/COFINS para remover da base de cálculo. Junior 20/10/2026
{  if ((QNotaSaidaIND_FINALIDADE_NFE.Value = 4) or
      not (QItemNF_CalcFieldsIND_REGIME_TRIBUTARIO.Value in [1, 2])) and
          (QItemNFNUM_CST_IBS_CBS.Value <> '410') and (QItemNFNUM_CST_IBS_CBS.Value <> '620') then
  begin
    rBaseCBSIBS := (QItemNFQT_QUANTIDADE.Value * QItemNFVAL_UNITARIO.Value) - QItemNFVAL_ICM.Value - QItemNFVAL_ICMS_SUBST.Value -  QItemNFVAL_ICMS_DIFERENCIAL.Value - QItemNFVAL_PIS.Value - QItemNFVAL_CONFINS.Value;
    rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                     QItemNF_CalcFieldsPERC_IBS_UF.Value, // aliquota estadual IBS
                                                     QItemNF_CalcFieldsPERC_IBS_MUN.Value, // aliquota municipal IBS
                                                     QItemNF_CalcFieldsPERC_CBS.Value, // aliquota CBS
                                                     0,    // imposto seletivo
                                                     QItemNFVAL_FRETE.Value,
                                                     0,  // seguro
                                                     QItemNFVAL_DESPESAS.Value,
                                                     QItemNFVAL_DESCONTO.Value);

    QItemNFVAL_IBS_MUN.Value := rCalculaImposto.vIBS_Mun;
    QItemNFVAL_IBS_EST.Value := rCalculaImposto.vIBS_Est;
    QItemNFVAL_CBS.Value := rCalculaImposto.vCBS;
    QItemNFVAL_BC_IBS_CBS.Value := rCalculaImposto.vBC;
    if QItemNF_CalcFieldsIND_GRUPO_TRIB_REGULAR.Value = '1' then
    begin
      QItemNFNUM_CST_IBS_CBS_REGULAR.Value := '000';
      QItemNFNUM_CLASS_TRIB_IBS_CBS_REGULAR.Value := '000001';
      rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                     0.1, // aliquota estadual IBS
                                                     0, // aliquota municipal IBS
                                                     0.9, // aliquota CBS
                                                     0,    // imposto seletivo
                                                     QItemNFVAL_FRETE.Value,
                                                     0,  // seguro
                                                     QItemNFVAL_DESPESAS.Value,
                                                     QItemNFVAL_DESCONTO.Value);
      QItemNFVAL_IBS_MUN_REGULAR.Value := rCalculaImposto.vIBS_Mun;
      QItemNFVAL_IBS_EST_REGULAR.Value := rCalculaImposto.vIBS_Est;
      QItemNFVAL_CBS_REGULAR.Value := rCalculaImposto.vCBS;
    end; 
  end
  else
  begin
    QItemNFVAL_IBS_MUN.Value := 0;
    QItemNFVAL_IBS_EST.Value := 0;
    QItemNFVAL_CBS.Value := 0;
    QItemNFVAL_BC_IBS_CBS.Value := 0;
  end;}
end;


procedure TDMNotaSaida.AtuPedido(wTipoAtu: Integer);
var wPedido: string;
  wCod_Obra_Req_Cab, wCountBaixaPedido: Integer;
  executador: TExecutador;
  wCodPedidoCab: string;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
    Exit;
  if (QNotaSaidaCod_Obra.Text <> '') and
    (wTipoAtu = 1) then // somente para inclusao
  begin
    DMObra.QObra_Req_Cab.Open;
    DMObra.QObra_Req_Item.Open;
    wCod_Obra_Req_Cab := DMObra.Func_IncluiObra_Cab(QNotaSaidaDt_Emissao.Value, QNotaSaidaNum_Nota.Value, QNotaSaidaCod_Obra.Value, QNotaSaidaCod_Cadastro.Value,
      QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Operacao.Value, QNotaSaidaInd_Condicao_Pagto.Value);
    QNotaSaidaCod_Obra_Req_Cab.Value := wCod_Obra_Req_Cab;
    DMObra.QObra_Req_Cab.Edit;
  end;
  wCountBaixaPedido := 0;
  QItemNF.First;
  while not QItemNF.Eof do
  begin
    QAtuBaixaPed.Close;
    QAtuBaixaPed.SetVariable('COD_NOTA_ITEM', QItemNFCod_Nota_Item.Value);
    QAtuBaixaPed.Open;

    if not QAtuBaixaPed.Eof then
    begin
      wCountBaixaPedido := wCountBaixaPedido + 1;
//      QAtzItemPedido.Close;
//      QAtzItemPedido.SetVariable('COD_PEDIDO_ITEM', QAtuBaixaPedCod_Pedido_item.Value);
//      QAtzItemPedido.SetVariable('QT_ACRESCENTAR', (wTipoAtu * QAtuBaixaPedQt_Baixa.Value));
//      QAtzItemPedido.ExecSQL;

      executador := TExecutador.Create();
      executador.Adiciona('UPDATE TB_PEDIDO_ITEM SET QT_ATENDIDO = '
        + 'TO_NUMBER((SELECT NVL(SUM(BP.QT_BAIXA),0) FROM TB_BAIXA_PEDIDO BP '
        + 'INNER JOIN TB_NOTA_ITEM NI ON NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM '
        + 'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = NI.COD_NOTA_CAB '
        + 'WHERE BP.COD_PEDIDO_ITEM = ' +QAtuBaixaPedCOD_PEDIDO_ITEM.Text + ' AND N.IND_SITUACAO = ''2'')) + '
        + Bib.ift(wTipoAtu = -1,'0', 'TO_NUMBER((SELECT NVL(SUM(BP.QT_BAIXA),0) FROM TB_BAIXA_PEDIDO BP '
        + 'INNER JOIN TB_NOTA_ITEM NI ON NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM '
        + 'INNER JOIN TB_NOTA_CAB N ON N.COD_NOTA_CAB = NI.COD_NOTA_CAB '
        + 'WHERE BP.COD_PEDIDO_ITEM = ' +QAtuBaixaPedCOD_PEDIDO_ITEM.Text
        + ' AND N.COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB.Text + '))')

        + ' WHERE COD_PEDIDO_ITEM = ' + QAtuBaixaPedCOD_PEDIDO_ITEM.Text);

//Codigo para gravar o usuario que importa o pedido
      wPedido := DMOracle.FastSelect('COD_PEDIDO_CAB','TB_PEDIDO_ITEM','COD_PEDIDO_ITEM = ' + QAtuBaixaPedCOD_PEDIDO_ITEM.Text);
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET COD_USUARIO = ' + chr(39) + IntToStr(DMUsuario.CodUsuarioCorrente) + chr(39));
      DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_CAB = ' + chr(39) + wPedido + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
//fim
      executador.Executar;
      executador.Free;
      executador := nil;
{Para atualizar o usuario que fez a importação do pedido. Ao importar não trocava o usuario que fez o processo, salvava como se fosse finalizado pelo usuario
que criou o pedido. Alex 17/11/2023}

      if pVoltaConfirmacao = True then //foi colocado para limpar dt_faturamento dos pedidos quando é feito a volta da confirmaçao da nota
      begin
        //wPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_ITEM =' + QAtuBaixaPedCod_Pedido_item.Text, True);
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET DT_FATURAMENTO = '''' WHERE COD_PEDIDO_CAB =' + wPedido);
        DMOracle.QExecSQL.ExecSQL;
      end;
    end;
    if (QNotaSaidaCod_Obra.Text <> '') and
       (wTipoAtu = 1) then // somente para inclusao
      DMObra.Proc_IncluiObra_Item(QNotaSaidaCod_Obra.Value, Trunc(QItemNFCod_Produto.Value), wCod_Obra_Req_Cab, QItemNFQt_Quantidade.Value, QItemNFVal_Unitario.Value, QNotaSaidaOBS_COMPLEMENTO.Value, QItemNFCOD_LOTE_TIPO.Value);
    QItemNF.Next;
  end;
  if (QNotaSaidaCod_Obra.Text <> '') and
    (wTipoAtu = 1) then // somente para inclusao
  begin
    DMObra.QObra_Req_CabIND_SITUACAO.Value := '2';
    DMObra.QObra_Req_Cab.Post;
  end;
  QAtuBaixaPed.Close;
  DMObra.QObra_Req_Cab.Close;
  DMObra.QObra_Req_Item.Close;

  //SQL PARA MODIFICAR A SITUAÇÃO DO PEDIDO PARA '4' - FATURADO - OU '1' - ABERTO
  if wCountBaixaPedido > 0 then
  begin
{Para atualizar o usuario que fez a importação do pedido. Ao importar não trocava o usuario que fez o processo, salvava como se fosse finalizado pelo usuario
que criou o pedido. Alex 17/11/2023}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET COD_USUARIO = ' + chr(39) + IntToStr(DMUsuario.CodUsuarioCorrente) + chr(39));
    DMOracle.QExecSQL.SQL.Add ('WHERE COD_PEDIDO_CAB =' + chr(39) + wPedido + chr(39));
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
      
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET IND_SITUACAO = ' +
      Bib.ift(wTipoAtu = 1,QuotedStr('4'), 'DECODE(IND_EMBARQUE,'+ QuotedStr('N') + ','+
      QuotedStr('1')+','+QuotedStr('3')+')') +
      ', STEP_PEDIDO_WEB = ' + Bib.ift(wTipoAtu = 1,'4','DECODE(IND_EMBARQUE,'+ QuotedStr('N') + ',2,3)') +
      ', LOCAL_ULTIMA_ALTERACAO = ' + QuotedStr('CEMAPA') +
      ' WHERE COD_PEDIDO_CAB IN '+
        '(SELECT PI.COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM PI '+
      'INNER JOIN TB_BAIXA_PEDIDO BP ON BP.COD_PEDIDO_ITEM = PI.COD_PEDIDO_ITEM '+
      'INNER JOIN TB_NOTA_ITEM NI ON NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM '+
      'INNER JOIN TB_PEDIDO_CAB P ON P.COD_PEDIDO_CAB = PI.COD_PEDIDO_CAB '+
      'WHERE NI.COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text +
      ' GROUP BY PI.COD_PEDIDO_CAB)', false);
  end;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_CADASTROValidate(Sender: TField);
begin
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK', DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
  DMCadastro.QCadastro.Open;
  if DMCadastro.QCadastroCOD_FILIAL.Value > 0 then
    QNotaSaidaCOD_FILIAL.Value := DMCadastro.QCadastroCOD_FILIAL.Value;
  
  QNotaSaidaCod_Estado.Value := DMCadastro.QCadastroCOD_ESTADO.Value;
  if (DMParamSistema.CodEmpresa <> 'INSIDE') and (DMParamSistema.CodEmpresa <> 'DISPART') and  (DMParamSistema.CodEmpresa <> 'FERRAGMED') and
     (DMParamSistema.CodEmpresa <> 'MEDSYSTEM') and (DMParamSistema.CodEmpresa <> 'RRPECAS') and (DMParamSistema.CodEmpresa <> 'RSMECANICA') then
    if (DMCadastro.QCadastroCOD_VENDEDOR.Text <> '') then // preenche o codigo do vendedor no after insert pelo codigo do usuario
      QNotaSaidaCod_Vendedor.Value := DMCadastro.QCadastroCOD_VENDEDOR.Value;
  if DMCadastro.QCadastroCOD_VENDEDOR_PREPOSTO.Text <> '' then
    QNotaSaidaCod_Vendedor_Preposto.Value := DMCadastro.QCadastroCOD_VENDEDOR_PREPOSTO.Value;
  if DMCadastro.QCadastroCOD_MOTIVO.Text <> '' then
    raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    if (DMCadastro.QCadastroCOD_RAMO.Value = 1) and
      (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') and
      (DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Text = '') then
      raise Exception.Create('Cadastro de produtor sem CADPRO');
  if not pTrazPedido then
    QNotaSaidaIND_CONSUMIDOR_FINAL.Value := DMCadastro.QCadastroIND_CONSUMIDOR_FINAL.Value;
end;

procedure TDMNotaSaida.QNotaSaidaVAL_DESPESASValidate(Sender: TField);
begin
  RecalculaItens;
end;

procedure TDMNotaSaida.RecalculaItens;
begin
  if not (pCC) then
  begin
    try
      QNotaSaida.AutoCalcFields := False;
      QItemNF.DisableControls;
      QItemNF.First;
      pRecalculaItens := true;
      while not QItemNF.Eof do
      begin
        QItemNF.Edit;
        if QNotaSaidaVAL_DESPESAS.Value = 0 then //uma vez informado despesas jogava para nota item e mesmo zerando a despesa não mudava o valor da nota. Junior 20/12/2019.
          QItemNFVAL_DESPESAS.Value := 0;
        QItemNF.Post;
        QItemNF.Next;
      end;
      pRecalculaItens := false;
    finally
      QItemNF.EnableControls;
    end;
  end;
end;

procedure TDMNotaSaida.QItemNFAfterDelete(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
//  QSomaItemNota.SetVariable('COD_NOTA_CAB',QNFE_EmiteCod_Nota_Cab.Value);
  QSomaItemNota.Open;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeEdit(DataSet: TDataSet);
begin
  if pNotaNome = False then // notas reemissão caixa encopel nota ao consumidor este campo com true
    if QNotaSaidaInd_Situacao.Value <> '1' then
      raise Exception.Create('Esta nota já esta confirmada ou cancelada!');
{Adicionado para que não seja possivel editar notas que já foram autorizadas pela Receita. Houveram reclamações da contabilidade por divergencia em valores quando
é importado o xml para o fechamento do mês. Alex 07/04/2025}
  {if (DMNfe.QNfeSIT_NFE.Value = '100') and (DMUsuario.CodUsuarioCorrente <> 1) and
     (DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value <> '') then
    raise Exception.Create('Não é permitido editar uma NOTA que já está autorizada pela Receita.');}
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNotaSaida.QNotaSaidaVAL_FRETEValidate(Sender: TField);
var wPBase, wPICM: string;
begin
  QNotaSaida.AutoCalcFields := False;
  wPICM := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + FloatToStr(QNotaSaidaCod_Tributacao_Frete.Value), True);
  wPBase := DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + FloatToStr(QNotaSaidaCod_Tributacao_Frete.Value), True);
  if (wPBase <> '') and (wPICM <> '') then
  begin
    QNotaSaidaVal_ICM_Base_Frete.Value := (QNotaSaidaVal_Frete.Value)
      * StrToFloat(wPBase) / 100;
    QNotaSaidaval_icm_Frete.Value := (QNotaSaidaVal_ICM_Base_Frete.Value * StrToFloat(wPBase) / 100) * StrToFloat(wPICM) / 100;
  end
  else
  begin
    QNotaSaidaVal_ICM_Base_Frete.Value := 0;
    QNotaSaidaVal_ICM_Frete.Value := 0;
  end;
end;

procedure TDMNotaSaida.SetaEmissao(wCodNota: Integer);
begin
  QNFE_Emite.Close;
  QNFE_Emite.SetVariable('COD_NOTA_CAB', wCodNota);
  QNFE_Emite.Open;
  QNFE_EmiteIt.Close;
  //Adicionado codEmpresa = 'CEIFAGRIL' para ordenação dos itens na impressão dos pedidso. 10-Abril-2013.
  //Sugestão: DIEGO - J.R MULTIPECAS
  if (DMParamSistema.CodEmpresa = 'INJEPAR') or (DMParamSistema.CodEmpresa = 'ORSO') or
     (DMParamSistema.CodEmpresa = 'KREUZ')   or (DMParamSistema.CodEmpresa = 'CEIFAGRIL')then
  begin
    QNFE_EmiteIt.SQL[QNFE_EmiteIt.SQL.Count - 1] := '';
    QNFE_EmiteIt.SQL.Add('ORDER BY COD_NOTA_ITEM)');
  end;
  if DMParamSistema.CodEmpresa = 'MEDIPECAS' then
  begin
    QNFE_EmiteIt.SQL[QNFE_EmiteIt.SQL.Count - 1] := '';
    QNFE_EmiteIt.SQL.Add('ORDER BY IND_TIPO_PRODUTO, COD_PRODUTO)');
  end;
  if ( (DMParamSistema.CodEmpresa = 'COZER') or (DMParamSistema.CodEmpresa = 'PIXIXE') or
       (DMParamSistema.CodEmpresa = 'PROPE') ) then
  begin
    QNFE_EmiteIt.SQL[QNFE_EmiteIt.SQL.Count-1]:='';  // elimina a última Linha da SQL
    QNFE_EmiteIt.SQL.Add('ORDER BY TB_NOTA_ITEM.COD_PRODUTO)');
  end;
  QNFE_EmiteIt.Open;
end;

procedure TDMNotaSaida.QItemNFPERC_DESCONTOValidate(Sender: TField);
begin
  if (pConfirmando = False) then
    if QItemNFPERC_DESCONTO.Value <> 0 then
    begin
      pDigitou_Desconto := True;
      QItemNFPerc_Desc.Value := QItemNFPerc_Desconto.Value; // SERVE PARA FICAR O % DE DESCONTO FORNECIDO NA NOTA
     // if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INJEPAR' then
     // begin
        if not DMUsuario.Privilegiado and (DMParamSistema.QParamSistemaIND_DESCONTO_MAXIMO.Value <> 'P') then
          if (DMUsuario.pPerc_Desconto_Maximo >= 0) and
            (QItemNFPERC_DESCONTO.Value > DMUsuario.pPerc_Desconto_Maximo) then
          begin
            MessageDlg('Desconto acima do permitido. Desconto máximo de ' + FloatToStr(DMUsuario.pPerc_Desconto_Maximo) +
              '%', mtError, [mbOk], 0);
            Abort;
          end;
        QItemNFVAL_DESCONTO.Value := (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100);
        if (QItemNFVAL_UNITARIO_COM_DESCONTO.IsNull) and (QItemNFVAL_UNITARIO.Value > 0) and (QItemNFPERC_DESCONTO.Value > 0) then
        begin
          QItemNFVAL_UNITARIO_COM_DESCONTO.Value := QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100);
        end;
      //end;
      QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
    end
    else
      QItemNFPerc_Desc.Value := 0;

    if QItemNFPERC_DESCONTO.Value = 0 then
      QItemNFVAL_DESCONTO.Value := 0;
end;

procedure TDMNotaSaida.QItemNFVAL_DESCONTOValidate(Sender: TField);
begin
// foi colocado esta rotina no on exit do campo val_desconto
  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') {and
    (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'INJEPAR')} then
  begin
    if(QItemNFVAL_DESCONTO.value > QItemNFVAL_UNITARIO.Value) then
      raise Exception.Create('Valor de desconto maior que o valor do produto');
    if (pConfirmando = False) and
      (QItemNFVal_Desconto.Value > 0) then
    begin
      pDigitou_Desconto := True;
      //QItemNFVal_Unitario.Value := (QItemNFVal_Unitario.Value * QItemNFQt_Quantidade.Value - QItemNFVal_Desconto.Value) / QItemNFQt_Quantidade.Value;
      QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
    end;
  end;
  QItemNFval_total_com_desconto.Value := QItemNFVAL_TOTAL.Value -
      (QItemNFVAL_DESCONTO.Value * QItemNFQT_QUANTIDADE.Value);
  //Adicionado por Djeison 16/03/2013
  if (DMParamSistema.CodEmpresa <> 'FERRAGMED') and (DMParamSistema.CodEmpresa <> 'KREUZ') AND (QItemNFVAL_DESCONTO.value > 0) then
    Checar_preco;
end;

procedure TDMNotaSaida.QItemNFVAL_DESPESASValidate(Sender: TField);
begin
  if (pConfirmando = False) and
    (QItemNFVal_Despesas.Value > 0) then
  begin
    //QItemNFVal_Unitario.Value := (QItemNFVal_Total.Value + QItemNFVal_Despesas.Value) / QItemNFQt_Quantidade.Value;
    QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
  end;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_TRANSPORTADORValidate(Sender: TField);
begin
  QNotaSaidaDesc_transportadora.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QNotaSaidaCod_Transportador.Value), True);
end;

procedure TDMNotaSaida.ChecaNota;
var wPesoClasPar, wDtVencto, wSerie, wEmbalagem, wLibera, wAux: string;
  wQtSaldo_Claspar, wValor_cc: Real;
begin
  //// *** Tipo de Cadastro ***
  //  wAux := DMOracle.BuscaNome('SELECT IND_VENDA FROM TB_CLASS_CADASTRO, TB_CADASTRO',
  //    'TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO'
  //    + ' AND TB_CADASTRO.COD_CADASTRO = ' + FloatToStr(QNotaSaidaCod_Cadastro.Value));
  //wTpOper := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True);

  if (Trim(QNFE_EmiteIND_VENDA.Value) <> 'S') and (QNFE_EmiteIND_VENDAS.Value = 'V') and
     (QNotaSaidaIND_CONDICAO_PAGTO.Value <> '1') then
    raise Exception.Create('Classificação de Cliente sem permissão para Venda!');
  // *** consistência Série com Operação  ***
  //wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value));
  if (QNFE_EmiteCOD_SERIE_OPERACAO.Value <> '') AND
     (QNFE_EmiteCOD_SERIE_OPERACAO.Value <> QNotaSaidaCod_Serie.Value)then
    raise Exception.Create('Série Nota Fiscal Não Liberada Para Esta Operação!');

  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') and
    (QNFE_EmiteIND_VENDAS.Value = 'V') and (QNotaSaidaInd_Condicao_Pagto.Value = '1') then
    raise Exception.Create('Operação de Venda Somente Condição Pagamento a Prazo');

  wValor_cc := 0;
{*  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') And
     (QNotaSaidaInd_Condicao_Pagto.Value <> '1') Then
   Begin
      wNada := DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL - tb_nota_item.VAL_DESCONTO) FROM TB_NOTA_CAB,TB_NOTA_ITEM ',
         'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB And COD_CADASTRO = '+ QNotaSaidaCod_Cadastro.Text +
         ' AND TB_NOTA_CAB.IND_SITUACAO = '+ Chr(39) +  '2' + Chr(39) +
         ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = '+ Chr(39) +  'S' + Chr(39) +
         ' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = '+ Chr(39) +  '3' + Chr(39) +
         ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ' +
         ' AND TB_NOTA_CAB.COD_FILIAL = ' + QNotaSaidaCod_Filial.Text);
      If wNada <> '' Then
         wValor_cc := StrToFloat(wNada);
   End;  *}

 // if (dmroma

  if QNotaSaidaIND_CONDICAO_PAGTO.Value = '2' then
  begin // esta rotina verifica se o fornecedor tem algum adiantamento no c.p. para poder descontar
    wAux := DMOracle.BuscaNome('SELECT SUM(T1.VAL_TITULO) FROM TB_CONTA_PAGAR_CAB T1,TB_FINALIDADE T2', 'T1.COD_FINALIDADE=T2.COD_FINALIDADE AND ' +
      'T2.IND_TIPO=' + Chr(39) + 'ADIANTAMENTOS' + Chr(39) + ' AND T1.IND_SITUACAO<>' + Chr(39) + 'BAIXA TOTAL' + Chr(39) +
      ' AND COD_CADASTRO = ' + QNotaSaidaCod_Cadastro.Text);
    if wAux <> '' then
      ShowMessage('Cliente Possui Adiantamentos no Contas Pagar R$ ' + wAux);
  end;
  if (QNotaSaidaInd_Condicao_Pagto.Value = '2') and (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') then
    DMCadastro.ValidaCredito(QNotaSaidaCod_Cadastro.Value, QSomaItemNotaSVal_Total_Nota.Value -
                  QNotaSaidaVal_AVista.Value + wValor_cc - fValorValeCompras - fValorValePresente);
  // *** Validar Cadastro Encerrado
  if QNFE_EmiteDT_CANCELAMENTO.Text <> '' then
    raise Exception.Create('Cliente com Cadastro Encerrado!');
  if QNFE_EmiteIND_BLOQUEIO_VENDA_VCTO.Value = 'SIM' then
  begin
    if (QNotaSaidaInd_Condicao_Pagto.Value <> '1') and
       (QNotaSaidaInd_Condicao_Pagto.Value <> '4') and
       (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
    begin
      wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
      wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'TB_CADASTRO.COD_CADASTRO = ' +
        FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
      if wDtvencto <> '' then
        if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) then
          if wLibera = 'NAO' then
            raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
    end;
  end;
  // *** Checar Lotes da Claspar
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
  begin
    QItemNF.First;
    while not QItemNF.Eof do
    begin
      wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
      wPesoClaspar := DMOracle.BuscaNome('SELECT QT_CLASSIFICADO FROM TB_LOTE_CLASPAR', 'COD_LOTE_TIPO = ' + FloatToStr(QItemNFCod_Lote_Tipo.Value));
      if Trim(wPesoClaspar) <> '' then
      begin
        QSomaClaspar.Close;
        QSomaClaspar.SetVariable('LOTE', QItemNFCod_Lote_Tipo.Value);
        QSomaClaspar.Open;
        wQtSaldo_Claspar := StrToFloat(wPesoClaspar) - QSomaClasparSQt_Saida.Value;
        if (QSomaClasparSQt_Saida.Value + (QItemNFQt_Quantidade.Value * StrToFloat(wEmbalagem))) > StrToFloat(wPesoClaspar) then
          raise Exception.Create('Quantidade do item da Nota ultrapassa a quantidade do Certificado da Claspar!' + chr(13) + 'Saldo =' + FloatToStr(wQtSaldo_Claspar));
      end;
      QItemNF.Next;
    end;
  end;
end;

procedure TDMNotaSaida.CalculaISS;
var wPercDeducaoBaseISS, wPercISS: Real;
rCalculaImposto: TImpostosCalculados;
begin
  with DMNotaSaida do
  begin
    if ((QNotaSaidaCOD_SERIE_MODELO.Value = '98') or
       (QNotaSaidaCOD_SERIE_MODELO.Value = '55')) and
       (QItemNF_CalcFieldsIND_TIPO_PRODUTO.Value = 'SERVIÇO') then
    begin
      wPercDeducaoBaseISS := 0;
      if QItemNF_CalcFieldsIND_APLICA_DEDUCAO_BC_ISS.Value =  'S' then
      begin
        wPercDeducaoBaseISS := Bib.ift(QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_CADASTRO.Value = 0,
          QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_FILIAL.Value,
          QItemNF_CalcFieldsPERC_DEDUCAO_NFSE_CADASTRO.Value);
      end;
{ Removido validação por regime tributário pois não estava calculando o ISS por Cidade para a Empresa Macro. Alex 21/09/2026}
      if (QItemNF_CalcFieldsIND_CALCULA_ISS_CIDADE.Value = 'SIM') then
        wPercISS := QItemNF_CalcFieldsPERC_ISS_CIDADE.Value
      else
        wPercISS := QItemNF_CalcFieldsPERC_ISS.Value;
      if (QItemNF_CalcFieldsCFOP_ESTADUAL.Value < 3) then
        QItemNFVal_ISS.Value := ((QItemNFVal_Total.Value * (QItemNF_CalcFieldsPERC_BC_NFSE.Value -
          wPercDeducaoBaseISS) / 100)  * wPercISS) / 100
      else
        QItemNFVAL_ISS.Value := 0;
    end;
//    else
//    begin
//      wPercISS := DMOracle.BuscaNome('SELECT PERC_ISS FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
//      if Trim(wPercISS) <> '' then
//      begin
//        if DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO', 'COD_CADASTRO = ' +
//                              FloatToStr(QNotaSaidaCod_Cadastro.Value)) <> 'SIM' then
//          QItemNFVal_ISS.Value := (QItemNFVal_Total.Value - (QItemNFQT_QUANTIDADE.Value * QItemNFVAL_DESCONTO.Value) -
//                                   QItemNFVAL_DESCONTO_RATEIO.Value + QItemNFVAL_DESPESAS.Value) *
//                                   StrToFloat(wPercISS) / 100;
//        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' then
//          QItemNFVal_ISS.Value := QItemNFVal_Total.Value * StrToFloat(wPercISS) / 100;
//      end;
//    end;
  end;

end;

procedure TDMNotaSaida.QNotaSaidaAfterOpen(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
  QSomaItemNota.Open;
  QCstIpiCons.Close;
  QCstIpiCons.SetVariable('IND_TIPO', 'S');
  QCstIpiCons.Open;
  QCstPisCons.Close;
  QCstPisCons.SetVariable('IND_TIPO','E');
  QCstPisCons.Open;
  QClassTribIbsCbs.Open;
  QCstCofinsCons.Close;
  QCstCofinsCons.SetVariable('IND_TIPO','E');
  QCstCofinsCons.Open;
  QSomaPagamentos.Close;
  QSomaPagamentos.Open;
  QSomaVales.Close;
  QSomaVales.Open;
  QPagamento.Close;
  QPagamento.Open;
  PopulaCalcFields;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeDelete(DataSet: TDataSet);
begin
//  If QNotaSaidaInd_Situacao.Value <> '1' Then
//    Raise Exception.Create('Somente notas digitadas podem ser excluidas!');
  if not (pCV) then
    DMOracle.DBCemapa.StartTransaction;
  if QNotaSaidaCod_Nota_Conta_Corrente.Value > 0 then
  begin
    QVoltaContaCorrente.Close;
    QVoltaContaCorrente.SetVariable('COD_NOTA', QNotaSaidaCod_Nota_Cab.Value);
    QVoltaContaCorrente.ExecSQL;
  end;
end;

procedure TDMNotaSaida.QNotaSaidaAfterDelete(DataSet: TDataSet);
var i: integer;
begin
  if not (pCV) then
    DMOracle.DBCemapa.Commit;
    
//  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
//    bib.AtualizaExclusaoInclusaoMD5(wData,wData,True);
end;

procedure TDMNotaSaida.QNotaSaidaDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMNotaSaida.ExcluiNota;
var wComando: string;
begin
  try
    if DMParamSistema.QParamSistemaIND_SENHA_EXCLUSAO_NOTA.Value = 'SIM' then  //Exigência de senha ao excluir notas
    begin                                                                      //Criado por Adriel em 10/10/2018
      if FSenha = nil then
        FSenha := TFSenha.Create(Application);
      if FSenha.ShowModal = MrOk then
      begin
        if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
          raise Exception.Create('Senha Incorreta.');
      end
      else
        Abort;
    end;
    if QNotaSaidaInd_Situacao.Value <> '1' then
      raise Exception.Create('Somente notas digitadas podem ser excluidas!');
    if DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value)) <> '' then
      raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
    if QNotaSaidaCod_Nota_Cab_Trans_Ent.Text <> '' then
      if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_NOTA_CAB ', 'COD_NOTA_CAB =' + FloatToStr(QNotaSaidaCod_Nota_Cab_Trans_Ent.Value)) <> '' then
        raise Exception.Create('Para excluir a nota de saida deve-se primeiro excluir a nota de entrada');
    pApagando := True;

    // Colocado apenas para evitar o erro de dataset fechado
    QNotaReferenciada.Open;

    QNotaReferenciada.First;
    while not QNotaReferenciada.Eof do
      QNotaReferenciada.Delete;

    // Colocado apenas para evitar o erro de dataset fechado
    QValeProdutoTroca.Open;

    QValeProdutoTroca.First;
    while not QValeProdutoTroca.Eof do
    begin
      QValeProdutoTroca.Edit;
      QValeProdutoTrocaCOD_NOTA_CAB_TROCA.AsVariant := null;
      QValeProdutoTroca.Post;
      QValeProdutoTroca.Next;
    end;

    with DMDevolucaoTroca do
    begin
      QValeProduto.Close;
      QValeProduto.ClearVariables;
      QValeProduto.SetVariable('COD_NOTA_CAB_ANTERIOR', QNotaSaidaCOD_NOTA_CAB.Value);
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
      
    QItemNF.First;
    while not QItemNF.Eof do
    begin
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_DESDOBRAMENTO_CLASPAR';
        wComando := wComando + ' WHERE COD_NOTA_ITEM = ' + FloatToStr(QItemNFCod_Nota_Item.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
      QItemNF.Delete;
    end;
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_NOME_NOTA';
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;

      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_PAGAMENTO';
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
    begin
      if not QNotaSaidaNUM_PEDIDO.IsNull then
      begin
        if (MessageDlg('Deseja EXCLUIR o PEDIDO referente a esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          DMOracle.ExecutaSql('DELETE FROM TB_PEDIDO_CAB WHERE NUM_PEDIDO = ' + QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text)
        else
          DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET ' +
            'IND_SITUACAO = DECODE(DT_ENVIO_PRODUCAO, NULL, ' + QuotedStr('4') + ', ' + QuotedStr('5') + '), ' +
            'DT_GERACAO_NOTA = NULL ' +
            'WHERE NUM_PEDIDO = ' + QNotaSaidaNUM_PEDIDO.Text + ' ' +
            'AND COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text
            );
      end;
    end;
    wData := QNotaSaidaDT_RECEBIMENTO.Value;
    QNotaSaida.Delete;
    pApagando := False;
  except
    pApagando := False;
    raise;
  end;
end;

procedure TDMNotaSaida.AtuCPFunrural(wTipo: Integer);
var wCodContaPagar: string;
  wAno, wMes, wDia: Word;
  wAnoVenc, wMesVenc: Word;
begin
  // ** Gera Contas a Pagar do Funrural
  if QNotaSaidaVal_Funrural.Value > 0 then
  try
    DecodeDate(QNotaSaidaDt_Emissao.Value, wAno, wMes, wDia);
    if wMes = 12 then
    begin
      wMesVenc := 1;
      wAnoVenc := wAno + 1;
    end
    else
    begin
      wMesVenc := wMes + 1;
      wAnoVenc := wAno;
    end;
    wCodContaPagar := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
      'COD_FILIAL = ' + FloatToStr(QNotaSaidaCod_Filial.Value)
      + ' AND NUM_TITULO = ' + FloatToStr(wAno)
      + ' AND NUM_PARCELA = ' + FloatToStr(wMes)
      + ' AND IND_SITUACAO = ' + #39 + 'ABERTO' + #39);
    if DMFinalidade.QFinalidadeCod_Finalidade.Value <> DMParamSistema.QParamSistemaCod_Finalidade_Cp_Funrural.Value then
      with DMFinalidade do
      begin
        QFinalidade.Close;
        QFinalidade.SetVariable('PK', DMParamSistema.QParamSistemaCod_Finalidade_Cp_Funrural.Value);
        QFinalidade.Open;
      end;
    with DMContasPagar do
    begin
      QContasPagar_Cab.Close;
      if Trim(wCodContaPagar) <> '' then
      begin
        QContasPagar_Cab.SetVariable('PK', StrToInt(wCodContaPagar));
        QContasPagar_Cab.Open;
        QContasPagar_Mov.Open;
        QContasPagar_Cab.Edit; // Se não existe inclui;
        QContasPagar_CabCOD_FINALIDADE.Value := DMParamSistema.QParamSistemaCod_Finalidade_cp_Funrural.Value;
        QContasPagar_CabCOD_CADASTRO.Value := DMParamSistema.QParamSistemaCod_Cadastro_Funrural.Value;
        QContasPagar_CabCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
        QContasPagar_CabNUM_TITULO.Value := wAno;
        QContasPagar_CabNUM_PARCELA.Value := wMes;
        QContasPagar_CabDESC_TIPO_DOCUMENTO.Value := 'NF';
        QContasPagar_CabDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
        QContasPagar_CabDT_VENCIMENTO.Value := StrToDate(
          '05/' + FormatFloat('00', wMesVenc)
          + '/' + FormatFloat('0000', wAnoVenc)
          );
        QContasPagar_CabDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
        if DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' then
          QContasPagar_CabDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
        else
          QContasPagar_CabDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;
        QContasPagar_CabVAL_TITULO.Value := QContasPagar_CabVAL_TITULO.Value + QNotaSaidaVal_Funrural.Value * wTipo;
        // QContasPagar_CabCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
        //QContaPagarDESC_OBSERVACAO.Value : TStringField;
        QContasPagar_CabIND_ACEITE.Value := 'NAO';
        QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
        QContasPagar_CabVAL_ORIGINAL.Value := QContasPagar_CabVAL_ORIGINAL.Value + QNotaSaidaVal_Funrural.Value * wTipo;

        if QContasPagar_Cab.State = dsInsert then
        begin
          // Em QContasPagar_Cab BeforePost inclui o Movimento principal
          QContasPagar_Cab.Post;
        end
        else
        begin
          QContasPagar_Mov.Locate('IND_TIPO_MOVIMENTO', 'PRINCIPAL', []);
          QContasPagar_Mov.Edit;
          QContasPagar_MovDt_Movimento.Value := DMOracle.DataServ;
          QContasPagar_MovInd_Tipo_Movimento.Value := 'PRINCIPAL';
          QContasPagar_MovDT_Usuario.Value := DMOracle.DataHoraServ;
          QContasPagar_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
          QContasPagar_MovVal_Movimento.Value := QContasPagar_MovVal_Movimento.Value + QNotaSaidaVal_Funrural.Value * wTipo;
          QContasPagar_Mov.Post;
          QContasPagar_Cab.Post;
        end;
        QContasPagar_Mov.Close;
        QContasPagar_Cab.Close;
      end;
    end;
  except
    if DMContasPagar.QContasPagar_Mov.State in [dsEdit, dsInsert] then
      DMContasPagar.QContasPagar_Mov.Cancel;
    if DMContasPagar.QContasPagar_Cab.State in [dsEdit, dsInsert] then
      DMContasPagar.QContasPagar_Cab.Cancel;
    ShowMessage('Não foi possível atualizar Contas a Pagar de Funrural!');
    raise;
  end;
end;

procedure TDMNotaSaida.AtualizaComissao(pDtInicial: TDateTime);
var
  I: Integer;
  wComissaoCalculada, wDescSQL, wDescCriterio, wAux, wSql: string;
  wPercComissao1, wPercComissao2, wPreco1, wPreco2, wValUnitario: Real;
  wTipoComissao: Char;
begin
  QAtuComissao.Close;
  QAtuComissao.SetVariable('DT_INICIAL', pDtInicial);
  QAtuComissao.Open;
  wValUnitario := 0; // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wTipoComissao := DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value[1];
  if wTipoComissao = '7' then
    Exit;
  QAtuComissao.First;
  Executador.Limpa; //Limpando cache de SQLs de execucoes.
  while not QAtuComissao.Eof do
  begin
    if (QAtuComissaoIND_ENTRADA_SAIDA.Value = 'S')
      or
      (QAtuComissaoIND_VENDAS.Value = 'D') then
    begin
      case wTipoComissao of
        '1': begin // Por Vendedor
            wComissaoCalculada := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(QAtuComissaoCod_Vendedor.Value));
          end;
        '2': begin // Por Produto
            wComissaoCalculada := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value));
          end;
        '3': begin // Por Classe
            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T4.PERC_COMISSAO1 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_NOTA_ITEM T1, ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T2, ';
            WDescSQL := wDescSQL + 'TB_CLASSE T3, ';
            WDescSQL := wDescSQL + 'TB_CLASSE T4 ';
            wDescCriterio := 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
            wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
            wDescCriterio := wDescCriterio + 'T3.NUM_CLASSE = T4.NUM_CLASSE AND ';
            wDescCriterio := wDescCriterio + 'T4.NUM_SUBCLASSE = 0 AND ';
            wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wComissaoCalculada := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
          end;

        '4': begin // Por Sub-Classe
            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T3.PERC_COMISSAO1 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_NOTA_ITEM T1, ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T2, ';
            WDescSQL := wDescSQL + 'TB_CLASSE T3 ';
            wDescCriterio := 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
            wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
            wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wComissaoCalculada := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
          end;

        '5': begin // Por Media da Sub-Classe
            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T3.PERC_COMISSAO1 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_NOTA_ITEM T1, ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T2, ';
            WDescSQL := wDescSQL + 'TB_CLASSE T3 ';
            wDescCriterio := 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
            wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
            wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPercComissao1 := StrToFloat(wAux)
            else
              wPercComissao1 := 0;

            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T3.PERC_COMISSAO2 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_NOTA_ITEM T1, ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T2, ';
            WDescSQL := wDescSQL + 'TB_CLASSE T3 ';
            wDescCriterio := 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
            wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
            wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPercComissao2 := StrToFloat(wAux)
            else
              wPercComissao2 := 0;

            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.VAL_ATACADO ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T1 ';
            wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPreco1 := StrToFloat(wAux)
            else
              wPreco1 := 0;

            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.VAL_VAREJO ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T1 ';
            wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPreco2 := StrToFloat(wAux)
            else
              wPreco2 := 0;

            if wValUnitario <= wPreco1 then
              wComissaoCalculada := FloatToStr(wPercComissao1)
            else
              if wValUnitario >= wPreco2 then
                wComissaoCalculada := FloatToStr(wPercComissao2)
              else
              begin // Preco Medio
                wComissaoCalculada := FloatToStr(wPercComissao1
                  + (wPercComissao2 - wPercComissao1)
                  * (wValUnitario - wPreco1)
                  / (wPreco2 - wPreco1));
              end;
          end;
        '6': begin // Media por Vendedor
            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.PERC_COMISSAO1 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_VENDEDOR T1 ';
            wDescCriterio := 'T1.COD_VENDEDOR = ' + FloatToStr(QAtuComissaoCod_Vendedor.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPercComissao1 := StrToFloat(wAux)
            else
              wPercComissao1 := 0;

            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.PERC_COMISSAO2 ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_VENDEDOR T1 ';
            wDescCriterio := 'T1.COD_VENDEDOR = ' + FloatToStr(QAtuComissaoCod_Vendedor.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPercComissao2 := StrToFloat(wAux)
            else
              wPercComissao2 := 0;

            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.VAL_ATACADO ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T1 ';
            wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPreco1 := StrToFloat(wAux)
            else
              wPreco1 := 0;
            wDescSQL := 'SELECT ';
            WDescSQL := wDescSQL + 'T1.VAL_VAREJO ';
            WDescSQL := wDescSQL + 'FROM ';
            WDescSQL := wDescSQL + 'TB_PRODUTO T1 ';
            wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
            wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
            if Trim(wAux) <> '' then
              wPreco2 := StrToFloat(wAux)
            else
              wPreco2 := 0;
            if wValUnitario <= wPreco1 then
              wComissaoCalculada := FloatToStr(wPercComissao1)
            else
              if wValUnitario >= wPreco2 then
                wComissaoCalculada := FloatToStr(wPercComissao2)
              else
              begin // Preco Medio
                wComissaoCalculada := FloatToStr(wPercComissao1
                  + (wPercComissao2 - wPercComissao1)
                  * (wValUnitario - wPreco1)
                  / (wPreco2 - wPreco1));
              end;

          end;
        '7': begin // Comissão Informada - Não Calcula Comissão
            wComissaoCalculada := QAtuComissaoPerc_Comissao.Text;
          end;

        '8': begin // Por Prazo de Venda - Só Calcula a Vista
            if QAtuComissaoInd_Condicao_Pagto.Value = '1' then // A Vista
            begin
              wAux := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_COMISSAO_PRAZO',
                'NUM_DIAS = 0');
              wComissaoCalculada := Trim(wAux);
            end
            else
              wComissaoCalculada := '';
          end;

      end; // Case
    end;
    for I := 1 to LENGTH(wComissaoCalculada) do
      if wComissaoCalculada[i] = ',' then
        wComissaoCalculada[i] := '.';
    //O codigo abaixo foi comentado e substituido pela execuçao em lote
    //porque o tempo de geracao do relatorio de comissoes era muito alto. Diego A. S. 21/06/2010
//    With DMOracle do
//    Begin
//      QExecSQL.Close;
//      QExecSQL.SQL.Clear;
//      QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM');
//      If Trim(wComissaoCalculada) <> '' Then
//        QExecSQL.SQL.Add('SET PERC_COMISSAO = '+wComissaoCalculada)
//      Else
//        QExecSQL.SQL.Add('SET PERC_COMISSAO = 0');
//      QExecSQL.SQL.Add('WHERE COD_NOTA_ITEM = '+QAtuComissaoCod_Nota_Item.Text);
//      QExecSQL.ExecSQL;
//    End;
    wSql := 'UPDATE TB_NOTA_ITEM';
    if Trim(wComissaoCalculada) <> '' then
      wSql := wSql + ' SET PERC_COMISSAO = ' + wComissaoCalculada
    else
      wSql := wSql + ' SET PERC_COMISSAO = 0';
    wSql := wSql + ' WHERE COD_NOTA_ITEM = ' + QAtuComissaoCod_Nota_Item.Text;
    Executador.Adiciona(wSql); //Adicionando SQL para ser executada em lote.
    QAtuComissao.Next;
  end;
  Executador.Executar(True, False); //Executando as SQLs todas de uma vez
end;


procedure TDMNotaSaida.QDesdobramento_ClasparAfterInsert(
  DataSet: TDataSet);
begin
  QDesdobramento_ClasparDt_Desdobramento.Value := DMOracle.DataHoraServ;
end;

function TDMNotaSaida.ItemTr: Real;
var wRes: string;
begin
  if DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCod_produto.text) = 'AGRICOLA' then
    wRes := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCod_produto.text)
  else
    if (QItemNFCod_produto.value > 0) and (QNotaSaidaCod_filial.value > 0) and (QItemNFCod_lote_tipo.value > 0) then
      wRes := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE', 'COD_PRODUTO = ' + QItemNFCod_produto.text
        + ' AND COD_FILIAL = ' + QNotaSaidaCod_filial.text + ' AND COD_LOTE_TIPO =' + QItemNFCod_lote_tipo.text);
  if wRes <> '' then
    Result := StrToFloat(wRes)
  else
    Result := 0;
end;

procedure TDMNotaSaida.QItemNFCOD_LOTE_TIPOValidate(Sender: TField);
begin
  if pTRF2 then
    QItemNFVal_Unitario.Value := ItemTR;
end;

procedure TDMNotaSaida.QItemNFVAL_UNITARIOValidate(Sender: TField);
begin
//  Comentado por Djeison A. 16/03/2013
  //Checar_Preco;
  if pTrazPedido = False then
    CalculaItem;
end;

procedure TDMNotaSaida.DesdobramentoClaspar;
var wTipo_Produto, wDesdobramento: string;
begin
  if DMOracle.BuscaNome('SELECT IND_TRANSFERENCIA FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCod_Operacao.Text, True) <> 'S' then
  begin
    QItemNf.First;
    QDesdobramento_Claspar.Open;
    while not (QItemNf.EOF) do
    begin
      if QItemNFCod_Lote_Tipo.Value <> 1 then
      begin
        wTipo_Produto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value), True);
        if wTipo_Produto = 'COM. ARROZ' then
        begin
          wDesdobramento := DMOracle.BuscaNome('SELECT COD_DESDOBRAMENTO_CLASPAR FROM TB_DESDOBRAMENTO_CLASPAR', 'COD_NOTA_ITEM = ' + FloatToStr(QItemNFCod_Nota_Item.Value));
          if wDesdobramento = '' then // quando já existe o desdobramento significa que foi voltado confirmação da nota
          begin //e confirmado novamente não sendo necessario gerar novo desdobramento
            QDesdobramento_Claspar.Insert;
            QDesdobramento_ClasparCod_Nota_Item.Value := QItemNfCod_Nota_Item.Value;
            QDesdobramento_ClasparNum_Desdobramento.Value := QNotaSaidaNum_Nota.Value;
            QDesdobramento_Claspar.Post;
          end;
        end;
      end;
      QItemNf.Next;
    end;
    QDesdobramento_Claspar.Close;
  end;
end;

procedure TDMNotaSaida.QItemNFCOD_TRIBUTACAOChange(Sender: TField);
begin
  QItemNFVal_ICM_Base.Value := 0;
end;

procedure TDMNotaSaida.Conhecimento_Frete(wCod_Nota_Cab, wNum_Conhecimento_Frete, wCod_Filial,
  wCod_Transportador, wCod_Operacao_Cf, wTrib_Frete: Integer; wVal_Pedagio, wVal_Icm_Frete, wVal_Frete_Ton, wVal_Frete: Real;
  wDesc_Placa, wDesc_Transportadora, wCod_Contrato_Vend: string; wDt_Emissao_Cf: TDateTime);
begin
  with DMConhecimentoFrete do
  begin
    QConhecimentoFrete.Open;
    QConhecimentoFrete.Insert;
    QConhecimentoFreteCod_Nota_Cab.Value := wCod_Nota_Cab;
    QConhecimentoFreteCod_Contrato_Vend.Text := wCod_Contrato_Vend;
    QConhecimentoFreteNum_Frete.Value := wNum_Conhecimento_Frete;
    QConhecimentoFreteVal_Pedagio.Value := wVal_Pedagio;
    QConhecimentoFreteDesc_Placa.Value := wDesc_Placa;
    QConhecimentoFreteDt_Emissao_Conhecimento.Value := wDt_Emissao_Cf;
    QConhecimentoFreteCod_Filial.Value := wCod_Filial;
    QConhecimentoFreteCod_Cadastro.Value := wCod_Transportador;
    QConhecimentoFreteVal_Icms.Value := wVal_Icm_Frete;
    QConhecimentoFreteDesc_Motorista.Value := wDesc_Transportadora;
    QConhecimentoFreteValor_Frete_Ton.Value := wVal_Frete_Ton;
    QConhecimentoFreteCod_Operacao.Value := wCod_Operacao_Cf;
    QConhecimentoFreteVal_Frete.Value := wVal_Frete;
    QConhecimentoFreteCod_Tributacao.Value := wTrib_Frete;
    QConhecimentoFrete.Post;
    QConhecimentoFrete.Close;
  end;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_OPERACAOValidate(Sender: TField);
begin
  if DMNotaSaida.QNotaSaidaCod_Operacao.Text <> '' then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    if DMOperacao.QOperacao.Eof then
      raise Exception.Create('Operação Não Cadastrada');
    if DMOperacao.QOperacaoIND_LIBERADO.Value = 'N' then
      raise Exception.Create('Esta Operação não está liberada para uso!');
    if QNotaSaidaCod_Contrato_Vend.Text = '' then // para nao lancar na nf a mensagem quando for nf emitida por contrato de venda pedido do Valmir
      DMNotaSaida.QNotaSaidaCod_Mensagem.Text := DMOperacao.QOperacaoCOD_MENSAGEM.Text;
    if (QNotaSaidaCOD_SERIE_MODELO.Value <> '65')
      and (Pos(DMParamSistema.QParamSistemaCOD_EMPRESA.Value, 'INSIDE,DISPART,NUTRI,ARISTIDES') = 0)  then // Empresas tem configurações adicionais de pagamento
    begin
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'V' then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'P' then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'O' then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
    end;
  end;
end;

procedure TDMNotaSaida.QNotaSaidaVAL_FRETE_TONChange(Sender: TField);
var wPeso: Real;
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
  if wPeso <> 0 then
    QNotaSaidaVal_Frete.Value := wPeso * QNotaSaidaVal_Frete_Ton.Value;
  if (Trim(wUnidade) <> 'T') and (QNotaSaidaVal_Frete.Value > 0) then
    QNotaSaidaVal_Frete.Value := QNotaSaidaVal_Frete.Value / 1000;
end;


procedure TDMNotaSaida.Checar_preco;
var wPreco, wDesconto: string;
  wPrecoMinimo, wDiferenca, wPrecoAntigo: Real;
  wPreco_Max: string;
  wDescTipoFuncionario, wsenhaCrypt, wsenha : String;
  wItemLiberado:  boolean;
begin
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Value);
  DMOperacao.QOperacao.open;

  QPrecoPromocao.Close;
  QPrecoPromocao.SetVariable('COD_PRODUTO', QItemNFCOD_PRODUTO.Value);
  QPrecoPromocao.SetVariable('DT_INICIO', QNotaSaidaDT_EMISSAO.Value);
  QPrecoPromocao.SetVariable('DT_FIM', QNotaSaidaDT_EMISSAO.Value);
  QPrecoPromocao.Open;

  if QPrecoPromocao.Eof then
  Begin
  //  if (pTrazPedido = False) and (pDigitou_Desconto = false) and (QItemNFCod_Produto.Value > 0) and
     If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FERRAGENS') then
     Begin
        if (pTrazPedido = False) and (QItemNFCod_Produto.Value > 0) Then
        begin
          wPrecoMinimo := 0;
         {if (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') then
            wPreco := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value))
          Else
            wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value));           //alterado pela linha abaixo para pegar o mesmo valor que no valor unitário. Em alguns casos o valor não é o val_varejo da tb_produto. Por Alessandro. 16/08/12.}

          wPrecoMinimo := DMProduto.PrecoVenda(QItemNFCod_Produto.Value, QNotaSaidaCod_Cadastro.Text,'F',QItemNFCod_Lote_Tipo.Value);
          wPrecoAntigo := DMProduto.PrecoVenda(QItemNFCod_Produto.Value, QNotaSaidaCod_Cadastro.Text,'F',QItemNFCod_Lote_Tipo.Value);

         //** Verifica qual o tipo de desconto máximo(produto ou usuário) permitido na venda P(PRODUTO) - U(USUARIO). - junior 20/08/2013.
         if DMParamSistema.QParamSistemaIND_DESCONTO_MAXIMO.Value = 'P' then
          wDesconto := DMOracle.BuscaNome('SELECT PERC_DESCONTO_MAXIMO FROM TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value))
         else
          wDesconto := DMOracle.BuscaNome('SELECT PERC_DESCONTO_MAXIMO FROM TB_USUARIO',
                                          'COD_USUARIO = ' + IntToStr(DmUsuario.CodUsuarioCorrente));
                    //** FIM DA ALTERAÇÃO - 20/08/2013 - JUNIOR.


          //if Trim(wPreco) <> '' then                //conversão não é mais necessaria depois da alteração acima, que busca o preço de venda com a function DMProduto.PrecoVenda. Por Alessandro. 16/08/12.
          //  wPrecoMinimo := StrToFloat(wPreco);
          if Trim(wDesconto) <> '' then
            wPrecoMinimo := wPrecoMinimo * (1 - StrToFloat(wDesconto) / 100);
        //  else // Adicionado por Djeison - 12/03/2013 - Se não tiver limitação de desconto máximo, liberar desconto
        //    wPrecoMinimo := StrToFloat(wPreco);
          if not (pCC) and not (PTRF2) then
            if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') and
               (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ') and
               (DMParamSistema.QParamSistemaDESC_EMPRESA.Value <> 'J. R. MULTIPECAS LTDA') then    //retirado pois toda vez que fazia a nota e o desconto era diferente pedia senha ao faturar a os Aurelio pediu para retirar    Rafael 25/06/2014
              if (not DmUsuario.Privilegiado) and (DMOperacao.QOperacaoInd_Vendas.Value = 'V') then // propriedade definida na dmusuario
              begin
              // Adicionado valor do Desconto na comparação para verificar se o Desconto é maior que
              // o permitido ao usuário Não Privilegiado - Djeison A. 14/03/2013
              // Foi criado o wDiferença devido a problemas no IF com as variáveis Float.
                wDiferenca := wPrecoMinimo - (QItemNFVal_Unitario.Value - QItemNFVAL_DESCONTO.Value);
                if (  wDiferenca > 0.00009) then // Adicionado por Djeison A. 12/03/2013
                begin
                  // Para empresas diferentes de Nutrivet, continua pegando a DESC_SENHA_OFICINA.
                    // Se lista de preços for informada, não deve dar erro ao utilizar o valor da lista
                  wItemLiberado := false;
                  with DMTabelaPreco do
                  begin
                    QTabelaPrecoCab.Close;
                    QTabelaPrecoCab.SetVariable('PK', QItemNFCOD_TABELA_PRECO_CAB.Value);
                    QTabelaPrecoCab.Open;
                    QTabelaPrecoItem.Close;
                    QTabelaPrecoItem.Open;
                    // Se não foi utilizado tabela de preço na nota
                    // Libera a alteração do preço
                    {if (QTabelaPrecoItem.RecordCount = 0) then
                      wItemLiberado := true;}    // retirado pelo César 25/03/2026 - nao faz sentido este ifem
                    while not QTabelaPrecoItem.Eof do
                    begin
                      if QTabelaPrecoItemCOD_PRODUTO.Value = QItemNFCOD_PRODUTO.Value then
                       begin
                         wItemLiberado :=
                          (FloatToStr(QTabelaPrecoItemVAL_PRECO.AsFloat) = FloatToStr(QItemNFVAL_UNITARIO.AsFloat));
                         break;
                       end;
                      QTabelaPrecoItem.Next;
                    end;
                    if not wItemLiberado then
                    begin
                      if Fsenha = nil then
                         FSenha := TFSenha.Create(Application);
                      if FSenha.ShowModal = MrOK then
                       begin
                         if UpperCase(Trim(FSenha.EdSenha.Text)) <>
                            UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
                          begin
                            QItemNFVAL_UNITARIO.Value := wPrecoAntigo;//wPrecoMinimo;
                            raise Exception.Create('Preço unitário abaixo do preço mínimo ou Desconto maior que o Desconto Máximo!');
                          end;
                       end
                      else
                       begin
                         QItemNFVAL_UNITARIO.Value := wPrecoAntigo;//wPrecoMinimo;
                         Abort;
                       end;
                    end;
                  end;
                end;  
              end;
             QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
        end;
     End;
  end
  else
  if ((QPrecoPromocaoPRECO_PROMOCAO.Value > (QItemNFVal_Unitario.Value - QItemNFVAL_DESCONTO.Value)) and
      (DMOperacao.QOperacaoIND_VENDAS.Value = 'V')) then
  Begin
    QItemNFVAL_UNITARIO.Value := DMProduto.PrecoVenda(QItemNFCod_Produto.Value, QNotaSaidaCod_Cadastro.Text,'F',QItemNFCod_Lote_Tipo.Value);
    Raise Exception.Create('Preço Promocional abaixo do Mínimo R$' + QPrecoPromocaoPRECO_PROMOCAO.Text);
  end;
end;

procedure TDMNotaSaida.MostraMsg(wCadastro: Integer);
begin
  if (DMCadastro.QCadastro.Eof) or (wCadastro <> DMCadastro.QCadastroCod_Cadastro.Value) then
  begin
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK', wCadastro);
    DMCadastro.QCadastro.Open;
  end;
  if DMCadastro.QCadastroDesc_Obs.Value <> '' then
    MessageDlg(DMCadastro.QCadastroDesc_Obs.Text + Chr(13) +
      DMCadastro.QCadastroDesc_Obs1.Text + Chr(13) +
      DMCadastro.QCadastroDesc_Obs2.Text, mtInformation, [mbOk], 0);
end;

procedure TDMNotaSaida.QNotaImpostoServicoBeforeDelete(DataSet: TDataSet);
begin
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaImpostoServicoBeforeEdit(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaImpostoServicoBeforeInsert(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaImpostoServicoCalcFields(DataSet: TDataSet);
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
      wVal := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServicoCOD_IMPOSTO.Text);
      if wval <> '' then
        QNotaImpostoServicoVAL_IMPOSTO.Value := strtofloat(formatFloat('0.00', StrToFloat(wVal) * (QSomaItemNotaSVAL_TOTAL.Value - QSomaItemNotaSVAL_DESCONTO.Value) / 100));

        // Para impostos de PIS e COFINS o sistema deve utilizar o campo SVAL_BC_PIS ou
        // SVAL_BC_COFINS pois estes consideram o CST de PIS e COFINS
        if Pos('PIS', QNotaImpostoServicodesc_imposto.Value) > 0 then
          QNotaImpostoServicoVAL_IMPOSTO.Value :=
            strtofloat(formatFloat('0.00', StrToFloat(wVal)
              * (QSomaItemNotaSVAL_BC_PIS.Value - QSomaItemNotaSVAL_DESCONTO.Value) / 100));
        if Pos('COFINS', QNotaImpostoServicodesc_imposto.Value) > 0 then
          QNotaImpostoServicoVAL_IMPOSTO.Value :=
            strtofloat(formatFloat('0.00', StrToFloat(wVal)
              * (QSomaItemNotaSVAL_BC_COFINS.Value - QSomaItemNotaSVAL_DESCONTO.Value) / 100)); 
    finally
      QNotaImpostoServico.AutoCalcFields := wEstado;
    end;
  end;
end;

procedure TDMNotaSaida.QNotaGNREBeforeDelete(DataSet: TDataSet);
begin
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaGNREBeforeEdit(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaGNREBeforeInsert(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaGNRECalcFields(DataSet: TDataSet);
begin
  QNotaGNREdesc_sigla_estado.Value := DMOracle.BuscaNome('SELECT DESC_SIGLA_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + QuotedStr(QNotaGNRECOD_UF.Text));
end;

procedure TDMNotaSaida.QNotaGNREAfterInsert(DataSet: TDataSet);
begin
  QNotaGNREIND_DOCUMENTO_ARRECADACAO.Value := '1';
end;

procedure TDMNotaSaida.QNotaExpTipoDocAfterInsert(DataSet: TDataSet);
begin
  QNotaExpTipoDocIND_TIPO_DOCUMENTO.Value := 'C';
end;

procedure TDMNotaSaida.QNotaExpTipoDocBeforeDelete(DataSet: TDataSet);
begin
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaExpTipoDocBeforeEdit(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QNotaExpTipoDocBeforeInsert(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
  if QNotaSaida.State <> dsEdit then
    raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QItemNFNUM_FABRICANTEChange(Sender: TField);
var
  wAux: string;
begin
  if (((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR')) and
    (QItemNFCOD_PRODUTO.Text = '')) then
  begin
    if QItemNFNUM_FABRICANTE.Value <> '' then
    begin
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
        QItemNF.AutoCalcFields := False;
      wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
        'NUM_FABRICANTE LIKE ' + QuotedStr(QItemNFNUM_FABRICANTE.Value + '%'));
      if wAux <> QItemNFCOD_PRODUTO.Text then
        QItemNFCOD_PRODUTO.Value := StrToInt('0' + wAux);
      QItemNF.AutoCalcFields := True;
    end;
  end;
end;

procedure TDMNotaSaida.QItemNFCOD_PRODUTOChange(Sender: TField);
begin
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR') then
  begin
    if QItemNFCOD_PRODUTO.Value > 0 then
    begin
      QItemNF.AutoCalcFields := False;
      QItemNFDESC_COMPLEMENTO.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
      QItemNF.AutoCalcFields := True;
    end;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then // para pegar o lote do produto que tem estoque
  begin
    DMEstoque.QEstoqueACons.Close;
    DMEstoque.QEstoqueACons.SetVariable('Filial', QNotaSaidaCod_Filial.Value);
    DMEstoque.QEstoqueACons.SetVariable('Produto', QItemNFCOD_PRODUTO.Value);
    DMEstoque.QEstoqueACons.SetVariable('Lote', Null);
    DMEstoque.QEstoqueACons.SetVariable('Classe', Null);
    DMEstoque.QEstoqueACons.SetVariable('SubClasse', Null);
    DMEstoque.QEstoqueACons.Open;
    while not (DMEstoque.QEstoqueACons.Eof) do
    begin
      if DMEstoque.QEstoqueAConsQt_Quantidade.Value > 0 then
      begin
        QItemNFCOD_LOTE_TIPO.Value := DMEstoque.QEstoqueAConsCod_Lote_Tipo.Value;
        Break;
      end;
      DMEstoque.QEstoqueACons.Next;
    end;
    DMEstoque.QEstoqueACons.Close;
  end;
  precoPorLote;
end;

procedure TDMNotaSaida.QRPedidoEspelhoCalcFields(DataSet: TDataSet);
var
  wCompl, wServico, wSerie, wDot: string;
  iServico, iSerie, iDot: Integer;
const
  SERVICO = 'SERVICO:';
  SERIE = 'SERIE:';
  DOT = 'DOT.:';
  DOT2 = 'DOT:';
  function menorValido(val1, val2, valNenhum, valMin: Integer): Integer;
  begin
    if (val1 > valMin) and (val2 > valMin) then
    begin
      if (val1 > val2) then
        Result := val2
      else
        Result := val1;
    end
    else if (val1 > valMin) then
      Result := val1
    else if (val2 > valMin) then
      Result := val2
    else
      Result := valNenhum;
  end;
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'JJPNEUS') and //jogar marca, serie e dot nos campos calculados.
    (QRPedidoEspelhoDESC_COMPLEMENTO_PRODUTO.Value <> '') then
  begin
    wServico := '';
    wSerie := '';
    wDot := '';
    wCompl := QRPedidoEspelhoDESC_COMPLEMENTO_PRODUTO.Value;

    iServico := Bib.ProcuraStr(SERVICO, StringReplace(UpperCase(wCompl), 'Ç', 'C', [rfReplaceAll]));
    iSerie := Bib.ProcuraStr(SERIE, StringReplace(UpperCase(wCompl), 'É', 'E', [rfReplaceAll]));
    iDot := Bib.ProcuraStr(DOT, UpperCase(wCompl));
    if iDot < 0 then
      iDot := Bib.ProcuraStr(DOT2, UpperCase(wCompl));
    if (iServico > -1) then
    begin
      iServico := iServico + Length(SERVICO) + 1;
      wServico := Copy(wCompl, iServico, menorValido(iSerie, iDot, Length(wCompl), iServico) - iServico + 1);
//      wServico := Copy(wCompl, iServico, Integer(Bib.ift(iDot > iServico, iDot, Length(wCompl))) - iServico + 1);
    end;
    if (iSerie > -1) then
    begin
      iSerie := iSerie + Length(SERIE) + 1;
      wSerie := Copy(wCompl, iSerie, menorValido(iServico, iDot, Length(wCompl), iSerie) - iSerie + 1);
//      wSerie := Copy(wCompl, iSerie, Integer(Bib.ift(iDot > iSerie, iDot, Length(wCompl))) - iSerie + 1);
    end;
    if (iDot > -1) then
    begin
      iDot := iDot + Length(DOT) + 1;
      wDot := Copy(wCompl, iDot, menorValido(iSerie, iServico, Length(wCompl), iDot) - iDot + 1);
//      wDot := Copy(wCompl, iDot, Integer(Bib.ift(iSerie > iDot, iSerie, Length(wCompl))) - iDot + 1);
    end;

    QRPedidoEspelhodesc_servico_it.Value := Trim(wServico);
    QRPedidoEspelhodesc_serie_it.Value := Trim(wSerie);
    QRPedidoEspelhodesc_dot_it.Value := Trim(wDot);
  end;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_NOTA_CAB_REFChange(Sender: TField);
var
  wFin: string;
begin
  if QNotaSaidaCOD_NOTA_CAB_REF.Value > 0 then
  begin
    wFin := DMOracle.FastSelect('IND_FINALIDADE_NFE', 'TB_NOTA_CAB',
      'COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB_REF.Text);
    if (wFin <> '') and (wFin <> '1') then
      MessageDlg('Atenção!' + #13 + #10 + 'As únicas NF''s que podem ser complementadas ' +
        'são aquelas com emissão normal,' + #13 + #10 + 'não sendo possível complementar ' +
        'NF''s de complemento ou de ajuste.' + #13 + #10 + 'A NF de referência que você ' +
        'informou parece não ser uma NF normal e isso' + #13 + #10 + 'impede que esta NF-e ' +
        'seja aceita pela SEFAZ.', mtWarning, [mbOK], 0);
  end
  else
    QNotaSaidaIND_FINALIDADE_NFE.Value := 1;
end;

procedure TDMNotaSaida.U(Sender: TObject);
begin
  //Gian 30/07/2020
  //Notei essa procedure no dia 30/07/2020
  //O nome dela é U, procurei nos logs quem fez essa alteração mas não consegui encontrar.
  //Descobri por que a variável wPedidoIt é instânciada aqui e estava dando erro em outra parte
  //em que ela é usada.
  //Muito estranho...

  QItemNF.AutoCalcFields := False;
  Finalidades := TVariantMap.Create;

  Finalidades.addValue(1, 'NF-e Normal');
  Finalidades.addValue(2, 'Complemento de NF-e');
  Finalidades.addValue(3, 'NF-e de Ajuste');
  Finalidades.addValue(4, 'Devolução de Mercadoria');

  wPedidoIt := TStringList.Create;
  fMudancaOperacaoManual := true;
end;


(*
 * Função que verifica se existe nota com número 0. No TipoNota deverá ser passado
 * 'E' ou 'S', para Entrada ou Saída, respectivamente. Caso seja nota de entrada,
 * a verificação será feita em cima da QNotaEntrada, caso contrário, na QNotaSaida.
 * Se for encontrada alguma nota digitada, será perguntado o que fazer com a mesma.
 *)

function TDMNotaSaida.VerificaNotaDigitada(TipoNota: string): Boolean;
  (*
   * Função separada para que seja possível chamar apenas a exibição das opções
   * de forma recursiva. Se a opção escolhida não puder ser executada, é
   * interessante chamar novamente a exibição das opções para permitir que o
   * usuário escolha outra resolução para a nota digitada.
   *)
  procedure ofereceOpcoes(Nota, Situacao, Tipo, Msg: string);
  begin
    case MessageDlgCustom(Msg, mtConfirmation,
      [mbYes, mbNo, mbCancel],
      ['&Excluir outra nota (recomendado)',
      'Visualizar &nota ' + Nota,
        '&Continuar mesmo assim'],
        nil)
      of
      mrYes:
        begin
          if Situacao <> '1' then
          begin
            MessageDlg('Impossível excluir, a nota está confirmada ou cancelada.', mtError, [mbOK], 0);
            ofereceOpcoes(Nota, Situacao, Tipo, Msg); //Não foi possível excluir, pedir novamente o que fazer.
            Exit;
          end;
          Executador.Limpa;
          Executador.Adiciona('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + Nota);
          Executador.Adiciona('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + Nota);
          Executador.Executar(True, True);
        end;
      mrNo:
        begin
          if Tipo <> TipoNota then
            if TipoNota = 'S' then
            begin
              MessageDlg('Nota ' + Nota + ' não é de Venda, é preciso abrí-la no sistema de compras.', mtError, [mbOK], 0);
              Exit;
            end
            else
            begin
              MessageDlg('Nota ' + Nota + ' não é de Compra, é preciso abrí-la no sistema de vendas.', mtError, [mbOK], 0);
              Exit;
            end;
          if Tipo = 'S' then
          begin
            if QItemNF.State in [dsEdit, dsInsert] then
              QItemNF.Cancel;
            QNotaSaida.Cancel;
            QItemNF.Close;
            QNotaSaida.Close;
            QNotaSaida.SetVariable('PK', Nota);
            QNotaSaida.Open;
            QItemNF.Open;
          end
          else
            with DMNotaEntrada do
            begin
              if QItemNF.State in [dsEdit, dsInsert] then
                QItemNF.Cancel;
              QNotaEntrada.Cancel;
              QItemNF.Close;
              QNotaEntrada.Close;
              QNotaEntrada.SetVariable('PK', Nota);
              QNotaEntrada.Open;
              QItemNF.Open;
            end;
        end;
      mrCancel:
        begin
        //não faz nada.
        end;
    end;
  end;
var
  wNota, wSituacao, wTipo, wMsg: string;
  DataS: TOracleDataSet1;
  wBuscador: TBuscador;
begin
  Result := False;

  if TipoNota = 'S' then
    DataS := QNotaSaida
  else
    DataS := DMNotaEntrada.QNotaEntrada;

  if ((DataS.State in [DsEdit, DsInsert]) and (not DataS.FieldByName('COD_CADASTRO').IsNull)) then
  begin
    wNota := DMOracle.FastSelect('COD_NOTA_CAB', 'TB_NOTA_CAB',
      'NUM_NOTA = 0 AND COD_CADASTRO = ' + DataS.FieldByName('COD_CADASTRO').Text +
      ' AND COD_NOTA_CAB <> ' + DataS.FieldByName('COD_NOTA_CAB').Text);
    if wNota <> '' then
    begin
      Result := True;
      wBuscador := TBuscador.Create;
      wBuscador.Limpa;
      wBuscador.Adiciona('DT_EMISSAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      wBuscador.Adiciona('IND_SITUACAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      wBuscador.Adiciona('IND_ENTRADA_SAIDA', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      wBuscador.Adiciona('COD_SERIE', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      wBuscador.Buscar;
      wMsg := 'Cliente já possui nota em aberto.' + #13 + #10 +
        'Código: ' + wNota + '. Data: ' + wBuscador.Proximo;
      wSituacao := wBuscador.Proximo;
      wMsg := wMsg + '. Situação: ' + IfThen(wSituacao = '1', 'DIGITADA',
        IfThen(wSituacao = '2', 'CONFIRMADA', 'CANCELADA'));
      wTipo := wBuscador.Proximo;
      wMsg := wMsg + '. Tipo: ' + IfThen(wTipo = 'E', 'ENTRADA', 'SAÍDA');
      wMsg := wMsg + '. Série: ' + wBuscador.Proximo;
      wMsg := wMsg + #13 + #10 + 'Por favor, exclua ou confirme essa nota.';
      wMsg := wMsg + #13 + #10 + 'Se você escolher "Visualizar nota", esta inclusão será cancelada.';
      wMsg := wMsg + #13 + #10 + 'Se você escolher "Continuar mesmo assim", terá de informar ' + #13 + #10 +
        'outro cliente, outra série ou outra filial.';
      ofereceOpcoes(wNota, wSituacao, wTipo, wMsg);
    end;
  end;
end;

procedure TDMNotaSaida.QNotaSaidaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if VerificaNotaDigitada('S') then //Se der erro no Post, verificar se existe nota digitada (evitar violação da UK_NOTA_CAB)
    Action := daAbort;
end;

procedure TDMNotaSaida.AcertaValoresNota;
begin
  //Chamando funcao de acerto de valores no banco
  if not QNotaSaidaCOD_NOTA_CAB.IsNull then
    OPVenda.CallStringFunction('ACERTA_VALOR_NOTA', ['NOTA', QNotaSaidaCOD_NOTA_CAB.Value]);
end;

function TDMNotaSaida.GeraInfAdicionalItem(DataSetItem: TOracleDataset1): string;
(*
 * Esse procedimento gera informações adicionais para o item. Estas informações são
 * geradas de acordo com os dados do item em questão.
 *)
  procedure Insere(var Onde: string; OQue: string; Separador: string = '.');
  begin
    Onde := Onde + IfThen((Onde <> '') and (OQue <> ''), Separador + ' ') + OQue;
  end;
var
  wInfAd, wUN, wEmb: string;
  Prod: string;
  Buscador: TBuscador;
  wAgricola: boolean;
begin
  wUN := '';
  wEmb := '';
  wInfAd := '';
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Prod := DataSetItem.FieldByName('COD_PRODUTO').Text;
  Buscador.Adiciona('DESC_UNIDADE','TB_PRODUTO', 'COD_PRODUTO = ' + Prod);
  Buscador.Adiciona('NUM_EMBALAGEM','TB_PRODUTO','COD_PRODUTO = ' + Prod);
  Buscador.Adiciona('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + Prod);
  Buscador.Buscar();
  wUN := buscador.Proximo;
  wEmb := buscador.Proximo;
  wAgricola := (buscador.Proximo = 'AGRICOLA');
  if (wUN <> '') and (wEmb <> '') and (StrToFloat(wEmb) > 1) then
    if ((trim(wUN) = 'KG') and (wAgricola)) then
      Insere(wInfAd, 'Preco em sacas de ' + wEmb + ' KG.');

  if DMParamSistema.CodEmpresa = 'TOFECO' then
    Insere(wInfAd, 'Preco em tonelada');
  if DMParamSistema.CodEmpresa = 'CASATINTAS' then
  begin
    if(Prod <> '') then
    begin
      Insere(wInfAd, wUN +' '+ wEmb);
    end;
  end;

  if not DataSetItem.FieldByName('COD_LOTE_TIPO').IsNull then
    with DMTipoLote do
    begin
      QTipoLote.Close;
      QTipoLote.SetVariable('PK', DataSetItem.FieldByName('COD_LOTE_TIPO').Value);
      QTipoLote.Open;
      if UpperCase(Trim(QTipoLoteIND_IMPRIME_NF.Value)) = 'S' then
      begin
        if QTipoLoteDESC_LOTE.Text <> '' then
          Insere(wInfAd, 'Lote: ' + QTipoLoteDESC_LOTE.Text + ' - ');
        if QTipoLoteDESC_RENASEN.Text <> '' then
          Insere(wInfAd, 'Renasen: ' + QTipoLoteDESC_RENASEN.Text + ' - ');
        if QTipoLoteDESC_PUREZA.Text <> '' then
          Insere(wInfAd, 'Pureza: ' + QTipoLoteDESC_PUREZA.Text + '%' + ' - ');
        if QTipoLoteDESC_GERMINACAO.Text <> '' then
          Insere(wInfAd, 'Germ.: ' + QTipoLoteDESC_GERMINACAO.Text + '%' + ' - ');
        if QTipoLoteDT_VENCIMENTO.Text <> '' then
          Insere(wInfAd, 'Validade: ' + QTipoLoteDT_VENCIMENTO.Text + ' - ');
        if QTipoLoteDESC_ATESTADO.Text <> '' then
          Insere(wInfAd, 'Atestado: ' + QTipoLoteDESC_ATESTADO.Text + ' - ');
        if QTipoLoteDESC_PENEIRA.Text <> '' then
          Insere(wInfAd, 'Peneira: ' + QTipoLoteDESC_PENEIRA.Text + ' - ');
        if QTipoLoteDESC_TIPO_SEMENTE.Text <> '' then
          Insere(wInfAd, 'Categoria: ' + QTipoLoteDESC_TIPO_SEMENTE.Text + ' - ');
        if QTipoLoteNUM_PESO.Value > 0 then
          Insere(wInfAd, 'Peso: ' + QTipoLoteNUM_PESO.Text + ' KG - ');
        wInfAd := LeftStr(wInfAd,Length(wInfAd) - 2) + '\n';
        if QTipoLoteDESC_OBSERVACAO.Text <> '' then
          Insere(wInfAd, 'Obs: ' + QTipoLoteDESC_OBSERVACAO.Text + ' \n');

        //Adicionado a Categoria da semente e o peso da TB_LOTE_TIPO. Solicitacao Renan Plantiagro. Junior - 29/06/2015  

      end;
    end;
  if not DataSetItem.FieldByName('NUM_NOTA_PRODUTOR').IsNull then
    Insere(wInfAd, 'Nota do Produtor: ' + DataSetItem.FieldByName('NUM_NOTA_PRODUTOR').Text);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ' Then
    if Prod <> '' then
    begin
      Buscador.Limpa;
      if DMParamSistema.CodEmpresa = 'LEURIA' then //Leuria usa o cadastro prod. Aristites e utiliza o campo DESC_OBSERVACAO - Junior 17/01/2019
        Buscador.Adiciona('DESC_OBSERVACAO', 'TB_PRODUTO', 'COD_PRODUTO = ' + Prod)
      else
        Buscador.Adiciona('DESC_COMPLEMENTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + Prod);
      Buscador.Adiciona('DESC_COMPLEMENTO_2', 'TB_PRODUTO', 'COD_PRODUTO = ' + Prod);
      Buscador.Adiciona('DESC_FORMULACAO', 'TB_PRODUTO', 'COD_PRODUTO = ' + Prod);
      Buscador.Buscar;
      Insere(wInfAd, Buscador.Proximo);
      Insere(wInfAd, Buscador.Proximo);
      if DMParamSistema.CodEmpresa = 'GONZATTI' then
        Insere(wInfAd, Buscador.Proximo);
      Buscador.Fecha;
    end;
  Result := wInfAd;
end;

procedure TDMNotaSaida.PopulaCalcFields;
var
  wBuscador: TBuscador;
begin
  QNotaSaidadesc_situacao.Value := '';
  if QNotaSaidaIND_SITUACAO.Value = SIT_NOTA_DIGITADA then
    QNotaSaidadesc_situacao.Value := 'DIGITADA'
  else if QNotaSaidaIND_SITUACAO.Value = SIT_NOTA_CONFIRMADA then
    QNotaSaidadesc_situacao.Value := 'CONFIRMADA'
  else if QNotaSaidaIND_SITUACAO.Value = SIT_NOTA_CANCELADA then
    QNotaSaidadesc_situacao.Value := 'CANCELADA'
  else if QNotaSaidaIND_SITUACAO.Value = SIT_NOTA_DENEGADA then
    QNotaSaidadesc_situacao.Value := 'DENEGADA';

  if not QNotaSaidaCOD_FILIAL.IsNull then
  begin
    wBuscador := TBuscador.Create;
    wBuscador.Limpa;
    wBuscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL',
      'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text);
    wBuscador.Adiciona('COD_UF_IBGE', 'TB_ESTADO', 'COD_ESTADO = (' +
      MontaSelect('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' +
      QNotaSaidaCOD_FILIAL.Text) + ')');

    wBuscador.Buscar;
    QNotaSaidadesc_servidor_nfe.Value := wBuscador.Proximo;
    QNotaSaidacod_uf_ibge_filial.Value := StrToInt('0' + wBuscador.Proximo);
  end;

  QNotaSaidadesc_situacao_sefaz.Value := '';
  if not QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
    with DMNfe do
    try
      SetaNfe(Bib.LimpaNumero(QNotaSaidaDESC_CHAVE_ACESSO.Value), True);
      if not QNfe.Eof then
      begin
        if QNfeind_cancelado.Value then
          QNotaSaidadesc_situacao_sefaz.Value := QNfeSIT_CANC.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_CANC.Value))
        else
          QNotaSaidadesc_situacao_sefaz.Value := QNfeSIT_NFE.Value + ' - ' +
            getWSMessage(StrToInt('0' + QNfeSIT_NFE.Value));
      end;
    except
      QNotaSaidadesc_situacao_sefaz.Value := '';
    end;
  QNotaReferenciadaCons.Close;
  QNotaReferenciadaCons.Open;
  if QNotaSaidaCOD_OPERACAO.Text <> '' then //A mensagem TEM DEVOLUÇÃO aparecia para simples remessa. Ajustado conforme a operação.
  begin                                     //Solicitado por Marcos(Cemapa). Junior 24/01/2019.
    if DMOracle.FastSelect('IND_VENDAS','TB_OPERACAO','COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text) = 'D' then
      QNotaSaidadesc_msg_devolucao.Value := Bib.ift(QNotaReferenciadaCons.Eof, '', 'TEM DEVOLUÇÃO');
    if DMOracle.FastSelect('IND_FUTURA_CLIENTE','TB_OPERACAO','COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text) = 'V' then
       QNotaSaidadesc_msg_devolucao.Value := Bib.ift(QNotaReferenciadaCons.Eof, '', 'TEM REMESSA DE VENDA');
  end;
  while not QNotaReferenciadaCons.Eof do
  begin
    if (pos(QNotaReferenciadaConsCOD_SERIE_MODELO.Value,'55,65,01,04,2B,2C,2D') > 0) then
    begin
      if (QNotaReferenciadaConsDESC_RETORNO_PROCESSAMENTO.Value = '100') and
         (QNotaReferenciadaConsDESC_RETORNO_CANCELAMENTO.Value <> '101') then
        QNotaSaidadesc_msg_devolucao.Value := QNotaSaidadesc_msg_devolucao.Value +
            ' | '+QNotaReferenciadaConsNUM_NOTA.Text+
            ' - '+ QNotaReferenciadaConsDT_EMISSAO.Text;
    end
    else
      QNotaSaidadesc_msg_devolucao.Value := QNotaSaidadesc_msg_devolucao.Value +
          ' | '+QNotaReferenciadaConsNUM_NOTA.Text+
          ' - '+ QNotaReferenciadaConsDT_EMISSAO.Text;
    QNotaReferenciadaCons.Next;
  end;
end;

procedure TDMNotaSaida.QInfoCadastroCalcFields(DataSet: TDataSet);
begin
  if QInfoCadastroIND_FISICA_JURIDICA.Value = 'F' then
  begin
    if QInfoCadastroIND_SEXO_CATEGORIA.Value = 'M' then
      QInfoCadastrodesc_sexo.Value := 'Masculino'
    else
      QInfoCadastrodesc_sexo.Value := 'Feminino';
    QInfoCadastrodesc_fisica_juridica.Value := 'Física';
    QInfoCadastrocampo_cpf_cnpj.Value := 'CPF: ';
    QInfoCadastrocampo_inscricao.Value := 'CAD/PRO: ';
  end
  else
  begin
    QInfoCadastrodesc_sexo.Value := '--------';
    QInfoCadastrodesc_fisica_juridica.Value := 'Jurídica';
    QInfoCadastrocampo_cpf_cnpj.Value := 'CNPJ: ';
    QInfoCadastrocampo_inscricao.Value := 'Inscrição Estadual: ';
  end;
end;

procedure TDMNotaSaida.QInfoCadastroPedidoCalcFields(DataSet: TDataSet);
begin
  if QInfoCadastroPedidoIND_FISICA_JURIDICA.Value = 'F' then
  begin
    if QInfoCadastroPedidoIND_SEXO_CATEGORIA.Value = 'M' then
      QInfoCadastroPedidodesc_sexo.Value := 'Masculino'
    else
      QInfoCadastroPedidodesc_sexo.Value := 'Feminino';
    QInfoCadastroPedidodesc_fisica_juridica.Value := 'Física';
    QInfoCadastroPedidocampo_cpf_cnpj.Value := 'CPF: ';
    QInfoCadastroPedidocampo_inscricao.Value := 'CAD/PRO: ';
  end
  else
  begin
    QInfoCadastroPedidodesc_sexo.Value := '--------';
    QInfoCadastroPedidodesc_fisica_juridica.Value := 'Jurídica';
    QInfoCadastroPedidocampo_cpf_cnpj.Value := 'CNPJ: ';
    QInfoCadastroPedidocampo_inscricao.Value := 'Inscrição Estadual: ';
  end;
end;

procedure TDMNotaSaida.AtualizaEstoqueComposicao(produto: Double; lote: string; tipo, operacao, filial: Integer; dataVenda: TDate; qtdAcumulada: Extended);
var query: TOracleDataSet1;
  wLote: string;
begin
  query := Bib.executaQuery(QComposicao);
  query.SetVariable('COD_PRODUTO', produto);
  query.Open;

  if query.IsEmpty then
  begin
    if lote = '' then
      wLote := DMOracle.FastSelect('COD_LOTE_TIPO', 'TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(produto))
    else
      wLote := lote;
    if wLote = '' then
      wLote := '1';

    DMEstoque.AtualizaEstoque(operacao, filial, produto, StrToInt(wLote),
      qtdAcumulada * tipo,
      0,
      0, dataVenda);
  end
  else
  begin
    query.First;
    while not query.Eof do
    begin
      wLote := DMOracle.FastSelect('COD_LOTE_TIPO', 'TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(produto));
      if wlote = '' then
        wLote := '1';

      AtualizaEstoqueComposicao(
        query.FieldByName('COD_PRODUTO_COMPONENTE').AsFloat,
        wLote,
        tipo,
        operacao,
        filial,
        dataVenda,
        qtdAcumulada * query.FieldByName('QT_QUANTIDADE').AsFloat);
      query.Next;
    end;
  end;
end;

procedure TDMNotaSaida.QPedidoNotaAfterOpen(DataSet: TDataSet);
begin
  QPedidoNotaItem.Close;
  QPedidoNotaItem.Open;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeClose(DataSet: TDataSet);
begin
  QCstIpiCons.Close;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_FILIALValidate(Sender: TField);
  var wIpiAnterior, wIpiAtual, wFilialCadastro: string;
  wUsuarioBloqueado: Boolean;
  wFilialUsuario: integer;
begin
  if (QNotaSaidaCOD_FILIAL.Text <> '') and (CodFilial <> 0) and (CodFilial <> QNotaSaidaCOD_FILIAL.Value)
    and (DMNotaSaida.QItemNF.RecordCount > 0) then
  begin
    wIpiAnterior := DMOracle.FastSelect('IND_IPI', 'TB_FILIAL', 'COD_FILIAL = ' + inttostr(CodFilial));
    wIpiAtual := DMOracle.FastSelect('IND_IPI', 'TB_FILIAL', 'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text);
    if(wIpiAnterior = 'N') and (wIpiAtual = 'S') then
      raise Exception.Create('Não é possível alterar a filial, pois a filial informada destaca IPI. Para alterá-la exclua os itens da nota primeiro.');
  end;
  if DMOracle.FastSelect('COD_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(QNotaSaidaCOD_FILIAL.value)) <> '' then
    CodFilial := QNotaSaidaCOD_FILIAL.Value;


  if QNotaSaidaCOD_FILIAL.Value > 0 then
  begin
    wUsuarioBloqueado := true;
    with DMUsuario do
    begin
      if QNotaSaidaCOD_CADASTRO.Value > 0 then
      begin
        wFilialCadastro := DMOracle.FastSelect('COD_FILIAL', 'TB_CADASTRO', 'COD_CADASTRO = ' + QNotaSaidaCOD_CADASTRO.Text);
        if (wFilialCadastro <> '') and (wFilialCadastro <> QNotaSaidaCOD_FILIAL.Text) then
          raise Exception.Create('Para este cliente, são permitidas somente notas da filial '+ wFilialCadastro + '.');
      end;
      QUsuarioFilialCons.Close;
      QUsuarioFilialCons.SetVariable('MODULO',
        DMOracle.FastSelect('COD_MODULO', 'TB_MODULO',
          'NOME_MODULO = ' + quotedStr('VENDA')));
      QUsuarioFilialCons.SetVariable('USUARIO', CodUsuarioCorrente);
      QUsuarioFilialCons.Open;

      if QUsuarioFilialCons.RecordCount = 0 then
        wUsuarioBloqueado := false;

      while not QUsuarioFilialCons.Eof do
      begin
        if QNotaSaidaCOD_FILIAL.Value = QUsuarioFilialConsCOD_FILIAL.Value then
        begin
          wUsuarioBloqueado := (wUsuarioBloqueado and false); // Desbloqueia
          wFilialUsuario := QUsuarioFilialConsCOD_FILIAL.Value;
        end;
        QUsuarioFilialCons.Next;
      end;

      if wUsuarioBloqueado then
        Raise exception.Create('Filial não liberada para este usuário.'
          + #13#10 +
          'Verifique a configuração de Usuário/Filial no módulo de segurança');
    end;
  end;
end;

procedure TDMNotaSaida.QItemNFVAL_UNITARIOChange(Sender: TField);
var
  wPrecoVar: string;
begin
  // Utilizado para fazer importação de itens de pedido gerenciando lotes automaticamente
  // Quando alterar o valor unitário do item não deve zerar o desconto
  if (QItemNF.Tag = 10) or (DMParamSistema.CodEmpresa = 'RETIFOZ') then
    exit;
  if DMParamSistema.CodEmpresa <> 'DONABENTA' then // Adicionado devido a erro de calculo quando o produto tem preço promocional cadastrado. 09/09/2021- Junior/Alex
  begin
    QItemNFPERC_DESCONTO.Value := 0;
    QItemNFVAL_DESCONTO.Value := 0;
  end; {
//Solicitado pela Dona Benta para que não seja possível alterar o preço do produto para menor do que o preço que esta no cadastro do mesmo.
//Alex 13/12/2021 cod_suporte: 3881
  if (DMParamSistema.CodEmpresa = 'DONABENTA') and (DMUsuario.QUsuarioIND_PRIVILEGIO.Value <> 'P') then
  begin
     wPrecoVar := '0' + DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCOD_PRODUTO.Value),True);
     if (QItemNFVAL_UNITARIO.Value <  StrToFloat(wPrecoVar)) then
     begin
       FNotaFrenteCaixa.DBGrid1.Columns[5].Field.Value := StrToFloat(wPrecoVar);
       raise Exception.Create('O valor unitário está abaixo do valor do produto!');
     end;
  end;}
end;

procedure TDMNotaSaida.QNotaSaidaConsCalcFields(DataSet: TDataSet);
begin
  //NUTRIVET SOLICITOU O CAMPO FORMA DE PAGAMENTO NO GRID DA TELA FNOTASAIDACONS. Junior 25/02/2014
  if DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '1' then
    QNotaSaidaConsdesc_pagamento.Text := 'A VISTA';
  if DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '2' then
    QNotaSaidaConsdesc_pagamento.Text := 'A PRAZO';
  if (DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '3') then
    QNotaSaidaConsdesc_pagamento.Text := 'OUTROS';
  if (DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '4') then
    QNotaSaidaConsdesc_pagamento.Text := 'CARTÃO CRÉDITO';
  if (DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '5') THEN
    QNotaSaidaConsdesc_pagamento.Text := 'CARTÃO DÉBITO';
  if (DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '6') then
    QNotaSaidaConsdesc_pagamento.Text := 'PIX';
  if (DMNotaSaida.QNotaSaidaConsIND_CONDICAO_PAGTO.Value = '7') then
    QNotaSaidaConsdesc_pagamento.Text := 'CONV.';
end;

procedure TDMNotaSaida.QNotaSaidaCOD_OPERACAOChange(Sender: TField);
begin
  if QNotaSaidaCOD_OPERACAO.Value > 0 then
  begin
    with DMOperacao do
    begin
      if QNotaSaidaCOD_OPERACAO.Value = QOperacaoCOD_OPERACAO.Value then
        QOperacao.RefreshRecord
      else
      begin
        QOperacao.Close;
        QOperacao.SetVariable('Pk', QNotaSaidaCod_Operacao.Value);
        QOperacao.Open;
      end;

      if (Pos(','+QOperacaoNUM_NATUREZA_EST_NOVO.Text+',',CFOPS_DEVOLUCAO) > 0) or
         (Pos(','+QOperacaoNUM_NATUREZA_INT_NOVO.Text+',',CFOPS_DEVOLUCAO) > 0) then
        QNotaSaidaIND_FINALIDADE_NFE.Value := 4 //Devolução de Mercadoria;
      else
        if QNotaSaidaIND_FINALIDADE_NFE.Value = 4 then
          QNotaSaidaIND_FINALIDADE_NFE.Value := 1;
      if (QItemNF.RecordCount  > 0) and not pCC and fMudancaOperacaoManual then
        MessageDlg('Após alterar a operação é recomendado verificar' +
          ' o cfop de cada item na aba Itens', mtInformation,[mbOk],0);
      fMudancaOperacaoManual := true;
    end;
  end;
end;

procedure TDMNotaSaida.QNfeExportBeforeInsert(DataSet: TDataSet);
begin
  if QItemNF.State = dsInsert then
  begin
    QItemNF.Post;
    QItemNF.Edit;
  end;
end;

procedure TDMNotaSaida.QPagamentoAfterInsert(DataSet: TDataSet);
begin
  QPagamentoCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
end;

procedure TDMNotaSaida.InserePagamentoNFCe(Valor: Real; Descricao: String);
begin
  QPagamento.Insert;
  QPagamentoVAL_PAGAMENTO.Value := Valor;
  QPagamentoVAL_VALOR.Value := Valor;
  QPagamentoDESC_PAGAMENTO.Value := Descricao;
  QPagamentoIND_CONFIRMADO.Value := 'S';
  QPagamento.Post;
end;

procedure TDMNotaSaida.ConfirmaPagamentoNFCe;
begin
  QPagamento.Edit;
  QPagamentoIND_CONFIRMADO.Value := 'S';
  QPagamento.Post;
  QPagamento.Next;
end;

procedure TDMNotaSaida.precoPorLote;
var wValor: string;
begin

  // Se a operação for de remessa de venda futura, não deve alterar preço
  with DMOperacao do
  begin
    if QOperacaoCOD_OPERACAO.Value <> QNotaSaidaCOD_OPERACAO.Value then
    begin
      QOperacao.Close;
      QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Value);
      QOperacao.Open;
    end;
    if (QOperacaoIND_FUTURA_CLIENTE.Value = 'S')
      or (QOperacaoIND_FUTURA_CLIENTE.Value = 'D') then
      exit;
  end;

  // Se existir preço de produto por lote cadastrado, deve buscar
  // o valor por lote
  if (QItemNFCOD_PRODUTO.Value > 0) and (QItemNFCOD_LOTE_TIPO.Value > 0) then
  with DMOracle do
  begin
    wValor
      := FastSelect('NVL(VAL_VAREJO, '
        + quotedStr('0') + ')', 'TB_PRECO_LOTE'
        , 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text
        + ' AND COD_LOTE_TIPO = ' + QItemNFCOD_LOTE_TIPO.Text
        + ' AND ROWNUM = 1'); // Evita que traga mais de 1 registro
    if (wValor <> '0') and (trim(wValor) <> '') then
      QItemNFVAL_UNITARIO.Text := wValor;
  end;
end;

procedure TDMNotaSaida.QItemNFCOD_LOTE_TIPOChange(Sender: TField);
begin
  precoPorLote;
end;

procedure TDMNotaSaida.QNotaReferenciadaBeforeInsert(DataSet: TDataSet);
begin
  if QNotaSaida.State = dsInsert then
  begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  end;
end;
procedure TDMNotaSaida.QItemNFAfterOpen(DataSet: TDataSet);
begin
  QItemNF_CalcFields.Open;
end;

procedure TDMNotaSaida.QNfeExportAfterInsert(DataSet: TDataSet);
begin
  QNfeExportDESC_CHAVE_ACESSO.Value := QNotaReferenciadaDESC_CHAVE_ACESSO.Value;
  QNfeExportQT_QUANTIDADE_EXPORTADA.Value := QItemNFQT_QUANTIDADE.Value;
end;

procedure TDMNotaSaida.GerenciaItensPorLote;
var wQuantidade: double;
  wItemOriginal: boolean;
  wFilial, wCodPedidoItem: integer;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
    wFilial := 1
  else
    wFilial := QNotaSaidaCOD_FILIAL.Value;

  if DMParamSistema.QParamSistemaIND_GERENCIA_LOTE_ESTOQUE.Value = 'NAO' then
    Exit;
  DMNotaSaida.QBaixasPed.Close;
  QItemNF.First;
  QItemNF.Tag := 10;
  with DMEstoque do
  begin

    // Utiliza esta query para iterar os itens da nota
    // Não pode utilizar a QItemNF pois vai fazer post enquanto está iterando
    QItemNfCons.Close;
    QItemNFCons.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QItemNfCons.Open;
    while not QItemNfCons.Eof do
    begin
      QItemNF.Locate('COD_NOTA_ITEM', QItemNfConsCOD_NOTA_ITEM.Value, []);
      BuscaLotesEstoque(wFilial, QItemNfConsCOD_PRODUTO.AsInteger);
      if QBuscaLoteEstoque.RecordCount = 0 then
      begin
        QItemNFCons.Next;
        continue;
      end;
      wItemOriginal := true;
      wQuantidade := QItemNFConsQT_QUANTIDADE.Value;
      while not QBuscaLoteEstoque.Eof do
      begin
        // Último registro de lote
        // Deve conter a quantidade total mesmo extrapolando a quantidade do lote
        if QBuscaLoteEstoque.RecNo = QBuscaLoteEstoque.RecordCount then
        begin
          if wQuantidade <= 0 then // Foi adicionado toda a quantidade do pedido
            break;
          if wItemOriginal then
          begin
            QItemNF.Edit;
            QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
            wItemOriginal := false;
            QItemNF.Post;
          end
          else
          begin
            //QItemNF.Locate('COD_NOTA_ITEM', QItemNfConsCOD_NOTA_ITEM.Value, []);
            QItemNF.Insert;
            QItemNFQT_QUANTIDADE.Value := wQuantidade;
            QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
            QItemNFVAL_TOTAL.Value := QItemNfConsVAL_UNITARIO.Value * wQuantidade;
            QItemNFVAL_UNITARIO.Value := QItemNfConsVAL_UNITARIO.Value;
            QItemNFCOD_TRIBUTACAO.Value := QItemNfConsCOD_TRIBUTACAO.Value;
            QItemNFCOD_CFOP.Text := QItemNfConsCOD_CFOP.Value;
            QItemNFPERC_DESCONTO.Value := QItemNfConsPERC_DESCONTO.Value;
            QItemNFPERC_COMISSAO.Value := QItemNfConsPERC_COMISSAO.Value;
            QItemNFPERC_COMISSAO_PREPOSTO.Value := QItemNfConsPERC_COMISSAO_PREPOSTO.Value;
            QItemNFPERC_IPI.Value := QItemNfConsPERC_IPI.Value;
            QItemNFCOD_CST_PIS.Value := QItemNfConsCOD_CST_PIS.Value;
            QItemNFCOD_CST_COFINS.Value := QItemNfConsCOD_CST_COFINS.Value;
            QItemNFCOD_CST_IPI.Value := QItemNfConsCOD_CST_IPI.Value;
            if not QItemNfConsCOD_TABELA_PRECO_CAB.IsNull then
              QItemNFCOD_TABELA_PRECO_CAB.Value := QItemNfConsCOD_TABELA_PRECO_CAB.Value;
            QItemNFCOD_PRODUTO.Value := QItemNfConsCOD_PRODUTO.Value;
            QItemNF.Post;

            QAtuBaixaPed.Open;
            QAtuBaixaPed.Insert;
            QAtuBaixaPedCod_Nota_Item.Value := QItemNFCOD_NOTA_ITEM.Value;
            QAtuBaixaPedCod_Pedido_Item.Value := wCodPedidoItem;
            QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
            QAtuBaixaPed.Post;
            QAtuBaixaPed.Close;
          end;
        end
        else // Não é o último registro de lote
        begin
          if wQuantidade > QBuscaLoteEstoqueQT_QUANTIDADE.Value then
          begin
            if wItemOriginal then
            begin
              QItemNF.Edit;
              QItemNFQT_QUANTIDADE.Value := QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
              QItemNFVAL_TOTAL.Value := QItemNfConsVAL_UNITARIO.Value * QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              QItemNF.Post;

              QAtuBaixaPed.Open;
              QAtuBaixaPed.Edit;
              wCodPedidoItem := QAtuBaixaPedCod_Pedido_Item.Value;
              QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
              QAtuBaixaPed.Post;
              QAtuBaixaPed.Close;

              wQuantidade := wQuantidade - QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              wItemOriginal := false;
            end
            else
            begin
              //QItemNF.Locate('COD_NOTA_ITEM', QItemNfConsCOD_NOTA_ITEM.Value, []);
              QItemNF.Insert;
              QItemNFQT_QUANTIDADE.Value := QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
              QItemNFVAL_TOTAL.Value := QItemNfConsVAL_UNITARIO.Value * QBuscaLoteEstoqueQT_QUANTIDADE.Value;
              QItemNFVAL_UNITARIO.Value := QItemNfConsVAL_UNITARIO.Value;
              QItemNFCOD_TRIBUTACAO.Value := QItemNfConsCOD_TRIBUTACAO.Value;
              QItemNFCOD_CFOP.Text := QItemNfConsCOD_CFOP.Value;
              QItemNFPERC_DESCONTO.Value := QItemNfConsPERC_DESCONTO.Value;
              QItemNFPERC_COMISSAO.Value := QItemNfConsPERC_COMISSAO.Value;
              QItemNFPERC_COMISSAO_PREPOSTO.Value := QItemNfConsPERC_COMISSAO_PREPOSTO.Value;
              QItemNFPERC_IPI.Value := QItemNfConsPERC_IPI.Value;
              QItemNFCOD_CST_PIS.Value := QItemNfConsCOD_CST_PIS.Value;
              QItemNFCOD_CST_COFINS.Value := QItemNfConsCOD_CST_COFINS.Value;
              QItemNFCOD_CST_IPI.Value := QItemNfConsCOD_CST_IPI.Value;
              if not QItemNfConsCOD_TABELA_PRECO_CAB.IsNull then
                QItemNFCOD_TABELA_PRECO_CAB.Value := QItemNfConsCOD_TABELA_PRECO_CAB.Value;
              QItemNFCOD_PRODUTO.Value := QItemNfConsCOD_PRODUTO.Value;
              QItemNF.Post;

              QAtuBaixaPed.Open;
              QAtuBaixaPed.Insert;
              QAtuBaixaPedCod_Nota_Item.Value := QItemNFCOD_NOTA_ITEM.Value;
              QAtuBaixaPedCod_Pedido_Item.Value := wCodPedidoItem;
              QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
              QAtuBaixaPed.Post;
              QAtuBaixaPed.Close;

              wQuantidade := wQuantidade - QBuscaLoteEstoqueQT_QUANTIDADE.Value;
            end;
          end
          else // Quantidade é menor ou igual a quantidade existente no lote
          begin
            if wItemOriginal then
            begin
              QItemNF.Edit;
              QItemNFQT_QUANTIDADE.Value := wQuantidade;
              QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
              QItemNFVAL_TOTAL.Value := QItemNfConsVAL_UNITARIO.Value * wQuantidade;
              wItemOriginal := false;
              QItemNF.Post;
              
              QAtuBaixaPed.Open;
              QAtuBaixaPed.Edit;
              wCodPedidoItem := QAtuBaixaPedCod_Pedido_Item.Value;
              QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
              QAtuBaixaPed.Post;
              QAtuBaixaPed.Close;
            end
            else
            begin
              //QItemNF.Locate('COD_NOTA_ITEM', QItemNfConsCOD_NOTA_ITEM.Value, []);
              QItemNF.Insert;
              QItemNFQT_QUANTIDADE.Value := wQuantidade;
              QItemNFCOD_LOTE_TIPO.Value := QBuscaLoteEstoqueCOD_LOTE_TIPO.Value;
              QItemNFVAL_TOTAL.Value := QItemNfConsVAL_UNITARIO.Value * wQuantidade;
              QItemNFVAL_UNITARIO.Value := QItemNfConsVAL_UNITARIO.Value;
              QItemNFCOD_TRIBUTACAO.Value := QItemNfConsCOD_TRIBUTACAO.Value;
              QItemNFCOD_CFOP.Text := QItemNfConsCOD_CFOP.Value;
              QItemNFPERC_DESCONTO.Value := QItemNfConsPERC_DESCONTO.Value;
              QItemNFPERC_COMISSAO.Value := QItemNfConsPERC_COMISSAO.Value;
              QItemNFPERC_COMISSAO_PREPOSTO.Value := QItemNfConsPERC_COMISSAO_PREPOSTO.Value;
              QItemNFPERC_IPI.Value := QItemNfConsPERC_IPI.Value;
              QItemNFCOD_CST_PIS.Value := QItemNfConsCOD_CST_PIS.Value;
              QItemNFCOD_CST_COFINS.Value := QItemNfConsCOD_CST_COFINS.Value;
              QItemNFCOD_CST_IPI.Value := QItemNfConsCOD_CST_IPI.Value;
              if not QItemNfConsCOD_TABELA_PRECO_CAB.IsNull then
                QItemNFCOD_TABELA_PRECO_CAB.Value := QItemNfConsCOD_TABELA_PRECO_CAB.Value;
              QItemNFCOD_PRODUTO.Value := QItemNfConsCOD_PRODUTO.Value;
              QItemNF.Post;

              QAtuBaixaPed.Open;
              QAtuBaixaPed.Insert;
              QAtuBaixaPedCod_Nota_Item.Value := QItemNFCOD_NOTA_ITEM.Value;
              QAtuBaixaPedCod_Pedido_Item.Value := wCodPedidoItem;
              QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.Value;
              QAtuBaixaPed.Post;
              QAtuBaixaPed.Close;
            end;
            break;
          end;
        end;
        QBuscaLoteEstoque.Next;
      end;
      QItemNfCons.Next;
    end;
  end;
  DMNotaSaida.QBaixasPed.Open;
  QItemNF.Tag := 0;
end;

procedure TDMNotaSaida.QItemNFCOD_TABELA_PRECO_CABChange(Sender: TField);
begin
//  if QItemNFCOD_TABELA_PRECO_CAB.Value = 0 then
//    exit;
//  if DMOracle.FastSelect('IND_BLOQUEIA_DESCONTO', 'TB_TABELA_PRECO_CAB'
//    , 'COD_TABELA_PRECO_CAB = ' + QItemNFCOD_TABELA_PRECO_CAB.Text) = 'SIM' then
//  begin
//    QItemNFVAL_DESCONTO.Value := 0;
//    QItemNFPERC_DESCONTO.Value := 0;
//    QItemNFVAL_DESCONTO.ReadOnly := true;
//    QItemNFPERC_DESCONTO.ReadOnly := true;
//  end
//  else
//  begin
//    QItemNFVAL_DESCONTO.ReadOnly := false;
//    QItemNFPERC_DESCONTO.ReadOnly := false;
//  end;
end;

procedure TDMNotaSaida.QSomaValesCalcFields(DataSet: TDataSet);
var
  diferenca: double;
begin
  if (QSomaItemNotasval_total_nota.Value > 0) then
  begin
    diferenca := QSomaItemNotasval_total_nota.Value - QNotaSaidaVAL_AVISTA.Value -
      QSomaValesSVAL_VALE_COMPRAS.Value;
    QSomaValessval_novo_vale_compras.Value := Bib.ift(diferenca >= 0, 0, Abs(diferenca));
    QSomaValessval_vale_compras_menos_novo.Value := QSomaValesSVAL_VALE_COMPRAS.Value -
      QSomaValessval_novo_vale_compras.Value;

    if diferenca < 0 then
      QSomaValessval_novo_vale_presente.Value := QSomaValesSVAL_VALE_PRESENTE.Value
    else
    begin
      diferenca := diferenca - QSomaValesSVAL_VALE_PRESENTE.Value;
      QSomaValessval_novo_vale_presente.Value := Bib.ift(diferenca >= 0, 0, Abs(diferenca));
    end;
    QSomaValessval_vale_presente_menos_novo.Value := QSomaValesSVAL_VALE_PRESENTE.Value -
      QSomaValessval_novo_vale_presente.Value;
  end;
end;

procedure TDMNotaSaida.QReceituarioOticoConsAfterScroll(DataSet: TDataSet);
begin
  QReceituarioOticoConsItens.DisableControls;
  QReceituarioOticoConsItens.Close;
  QReceituarioOticoConsItens.SetVariable('COD_RECEITUARIO_OPTICO',
    QReceituarioOticoConsCOD_RECEITUARIO_OPTICO.Value);
  QReceituarioOticoConsItens.Open;
  QReceituarioOticoConsItens.EnableControls;
end;

procedure TDMNotaSaida.QNotaSaidaCOD_VENDEDORValidate(Sender: TField);
var indSituacao: String;
begin
  indSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+ QNotaSaidaCOD_VENDEDOR.Text);
  if indSituacao = '' then
    raise Exception.Create('Vendedor inexistente. Para ter sucesso, insira um vendedor válido.')
  else if indSituacao = 'INATIVO' then
    raise Exception.Create('Vendedor inativo. Para ter sucesso, insira um vendedor ativo.');
  if (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '1') And // comissao por vendedor  - César 11/11/2021
     (DMOperacao.QOperacaoIND_VENDAS.Value = 'V') And
     (QNotaSaidaPerc_Comissao.Text = '')  Then // colocado pelo Cesar 30/06/2022 - devido a comissão informada no pedido e importado para nota fiscal
     QNotaSaidaPerc_Comissao.Text := DMOracle.FastSelect('PERC_COMISSAO1','TB_VENDEDOR','COD_VENDEDOR =' + QNotaSaidaCOD_VENDEDOR.Text)
end;

procedure TDMNotaSaida.QItemNFVAL_UNITARIO_COM_DESCONTOValidate(
  Sender: TField);
begin
  if (QItemNFVAL_UNITARIO.Value > 0) and (Sender.AsFloat > 0) then
  begin
    QItemNFPERC_DESCONTO.Value := 100 - (Sender.AsFloat * 100 / QItemNFVAL_UNITARIO.Value);
  end;
end;

procedure TDMNotaSaida.QItemNFVAL_UNITARIO_COM_DESCONTOChange(
  Sender: TField);
begin
  if (QItemNFVAL_UNITARIO.IsNull) and (Sender.AsFloat > 0) then
    QItemNFVAL_UNITARIO_COM_DESCONTO.Clear;
end;

procedure TDMNotaSaida.QItemNFDESC_PRODUTOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if QItemNFCOD_PRODUTO.Text <> '' then
    text := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);

end;

procedure TDMNotaSaida.QItemNFnome_produtoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if QItemNFCOD_PRODUTO.Text <> '' then
    Text := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
end;

procedure TDMNotaSaida.LancaCartao(wCodLancamento, wCodBancoAgencia, wCodNotaCab, wNumParcela, wNumParcelas : Integer; wDtEmissao, wDtRecebimento : TDate;
                                   wDescBandeira : string;  wValOriginal, wPercTaxa : real);
begin
  try
    DMOracle.DBCemapa.StartTransaction;
    QLancamentoCartao.Close;
    QLancamentoCartao.Open;
    QLancamentoCartao.Insert;
    QLancamentoCartaoCOD_LANCAMENTO_CARTAO.Value :=  wCodLancamento;
    QLancamentoCartaoCOD_BANCO_AGENCIA.Value := wCodBancoAgencia;
    QLancamentoCartaoCOD_NOTA_CAB.Value := wCodNotaCab;
    QLancamentoCartaoNUM_PARCELA.Value  := wNumParcela;
    QLancamentoCartaoNUM_PARCELAS.Value := wNumParcelas;
    QLancamentoCartaoDT_EMISSAO.Value := Trunc(wDtEmissao);
    QLancamentoCartaoDT_RECEBIMENTO.Value := Trunc(wDtRecebimento);
    QLancamentoCartaoDESC_BANDEIRA.Value := wDescBandeira;
    QLancamentoCartaoVAL_ORIGINAL.Value := wValOriginal;//StrToFloat(FormatFloat('0.00#,##',wValor));
    QLancamentoCartaoPERC_TAXA.Value := wPercTaxa;
    QLancamentoCartao.Post;
    DmOracle.DBCemapa.Commit;
    except
      DmOracle.DBCemapa.Rollback;
      QLancamentoCartao.Cancel;
      raise;
    end;
end;

procedure TDMNotaSaida.LancaPagtoBancoPIX(wContaCorrente: string);
var
  wHistoricoPIX, wFinalidade, wIndBancoPadrao, wBanco: String;
begin
    with DMOperacao do
    begin
      QOperacao.Close;
      QOperacao.SetVariable('Pk', StrToInt('0'+Trim(DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text)));
      QOperacao.Open;
      if DMOperacao.QOperacaoCOD_FINALIDADE.Text <> '' then
        wFinalidade := DMOperacao.QOperacaoCOD_FINALIDADE.Text
      else
        wFinalidade := IntToStr(DMUsuario.CodFinalidadeUsuario);
    end;
    wHistoricoPIX :=  DMOracle.FastSelect('COD_HISTORICO_PIX','TB_FINALIDADE','COD_FINALIDADE = ' + wFinalidade);
    //wBanco :=  DMOracle.FastSelect('COD_BANCO_AGENCIA','TB_BANCO_AGENCIA','IND_BANCO_PADRAO = ' + quotedstr(wIndBancoPadrao));
    with DMBancoAgencia do
    begin
      QSomaItemNota.Close;
      QSomaItemNota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
      QSomaItemNota.Open;
      QBancoMovimento.Close;
      QBancoMovimento.Open;
      QBancoMovimento.Insert;
      QBancoMovimentoCOD_USUARIO.Value := DMNotaSaida.QNotaSaidaCOD_USUARIO.Value;
      QBancoMovimentoCOD_DEPARTAMENTO.Value := DMNotaSaida.QNotaSaidaCOD_DEPARTAMENTO.Value;
      QBancoMovimentoDT_MOVIMENTO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
      QBancoMovimentoCOD_CADASTRO.Value := DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value;
      QBancoMovimentoCOD_HISTORICO.Value := StrToInt (wHistoricoPIX);
      QBancoMovimentoCOD_CONTA_CORRENTE.Value := strtoint(wContaCorrente);
      if (DMNotaSaida.QSomaPagamentosVAL_PIX.Value > 0) then
        QBancoMovimentoVAL_MOVIMENTO.Value := DMNotaSaida.QSomaPagamentosVAL_PIX.Value
      else
        QBancoMovimentoVAL_MOVIMENTO.Value := DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value;
      QBancoMovimentoNUM_CHEQUE.Value := DMNotaSaida.QNotaSaidaNUM_NOTA.Value;
      QBancoMovimentoCOD_NOTA_CAB.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
      QBancoMovimentoCOD_VENDEDOR.Value := DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Value;
 // Adicionado um IF para selecionar o código da condicao de pagamento,  PIX ou cartão debito.
 // Solicitado pagamento Débito por Odirlei ACOESTE. Guilherme 13/11/2023
      if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '6') or (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '3') then
      begin
        QBancoMovimento.Edit; // Prepara o registro para edição
        QBancoMovimentoDESC_OBSERVACAO.Value := 'Venda PIX referente a NF: ' + DMNotaSaida.QNotaSaidaNUM_NOTA.Text;
        QBancoMovimento.Post; // Confirma as alterações no registro
      end
      else if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') then
      begin
        QBancoMovimento.Edit; // Prepara o registro para edição
        QBancoMovimentoDESC_OBSERVACAO.Value := 'Venda no débito referente a NF: ' + DMNotaSaida.QNotaSaidaNUM_NOTA.Text;
        QBancoMovimento.Post; // Confirma as alterações no registro
      end
     // if (QBancoMovimento.Ind_Condicao_Pagto.Value :=DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value
      //QBancoMovimentoDESC_OBSERVACAO.Value := 'Venda PIX referente a NF: ' + DMNotaSaida.QNotaSaidaNUM_NOTA.text;
     // QBancoMovimento.Post;
    end;
    QSomaItemNota.Close;
end;

procedure TDMNotaSaida.DeletaItem;
begin
//Solicita senha ao excluir item da nota no frente de caixa. Alex 27/03/2023
    if FSenha = nil then
       FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        raise Exception.Create('Senha Incorreta.');
    end
    else
      Abort;
    DMNotaSaida.QItemNF.Cancel;
end;

end.

