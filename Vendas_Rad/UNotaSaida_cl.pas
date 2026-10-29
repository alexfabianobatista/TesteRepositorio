unit UNotaSaida_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste,CustomDialog,StrUtils, Oracle;

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
    QNotaSaidaOBS: TStringField;
    QNotaSaidaOBS_COMPLEMENTO: TStringField;
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
    QNotaSaidaNR_DIAS_CHEQUE1: TIntegerField;
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
    QItemNFVAL_DESPESAS: TFloatField;
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
    QItemNFval_inss: TFloatField;
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
    QNFE_EmiteOBS_COMPLEMENTO: TStringField;
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
    QNFE_Emitedesc_mensagem: TStringField;
    QNFE_Emitedesc_complemento: TStringField;
    QNFE_Emitenome_vendedor: TStringField;
    QNFE_Emitetotal_produtos: TFloatField;
    QNFE_Emitenome_transp: TStringField;
    QNFE_Emiteend_transp: TStringField;
    QNFE_Emiteinsc_transp: TStringField;
    QNFE_Emitecgc_transp: TStringField;
    QNFE_Emiteuf_transp: TStringField;
    QNFE_EmiteIt: TOracleDataSet1;
    QNFE_EmiteItCOD_NOTA_CAB: TIntegerField;
    QNFE_EmiteItCOD_PRODUTO: TFloatField;
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
    QNotaSaidaConsNUM_NOTA: TIntegerField;
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
    QNotaNome: TOracleDataSet1;
    QNotaNomeCOD_NOTA_CAB: TIntegerField;
    QNotaNomeNOME: TStringField;
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
    QBaixaAuxQT_QUANTIDADE: TFloatField;
    QSomaContaCorrenteSQT_QUANTIDADE: TFloatField;
    QSomaContaCorrentePERC_IPI: TFloatField;
    QSomaContaCorrenteCOD_CADASTRO: TIntegerField;
    QSomaContaCorrenteCOD_PRODUTO: TFloatField;
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
    QNFE_Emitedesc_complemento1: TStringField;
    QNFE_Emitedesc_complemento2: TStringField;
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
    QNotaSaidaDESC_OBS_CORPO_NOTA: TStringField;
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
    QItemNFVAL_PIS: TFloatField;
    QItemNFVAL_CONFINS: TFloatField;
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
    QNotaSaidaCOD_PRAZO_VENCIMENTO: TIntegerField;
    QNotaSaidaNUM_DIAS_CARENCIA: TIntegerField;
    QSomaItemNotaSVAL_DESPESAS: TFloatField;
    QSomaContaCorrenteDESC_PRODUTO: TStringField;
    QNFE_EmiteItDESC_PRODUTO: TStringField;
    QNFE_EmiteItDESC_VALIDADE: TStringField;
    QItemNFNUM_FABRICANTE: TStringField;
    OPVenda: TOraclePackage;
    QNFE_EmiteItNUM_PESO_BRUTO: TFloatField;
    QNFE_EmiteItNUM_PESO_LIQUIDO: TFloatField;
    QNFE_EmiteItNUM_METROS_CUBICOS: TFloatField;
    QNFE_Emitedesc_serie: TStringField;
    QNFE_EmiteItNUM_VOLUMES_NOTA: TIntegerField;
    QNFE_EmiteDESC_CELULAR: TStringField;
    QNotaSaidaCOD_SERIE_MODELO: TStringField;
    QContaPagarNUM_TITULO: TFloatField;
    QContaReceberNUM_TITULO: TFloatField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    procedure QNotaSaidaAfterEdit(DataSet: TDataSet);
    procedure QNotaSaidaAfterCancel(DataSet: TDataSet);
    procedure QNotaSaidaAfterInsert(DataSet: TDataSet);
    procedure QNotaSaidaAfterPost(DataSet: TDataSet);
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
    procedure QNotaSaidaCOD_SERIE_MODELOValidate(Sender: TField);
  Private
    { Private declarations }
    fDigitou_Manual : Boolean;  // serve para calculo do icms quando true foi digitado manual o valor do icms na tela senao calcula
    fConfirmando : Boolean;
    fNotaNome : Boolean;
    fApagando : Boolean;
    fGravando :Boolean;
    fCC :Boolean;
    fCV :Boolean;
    fTR :Boolean;
    fCF :Boolean;
    fTRF :Boolean;
    fTRF2 :Boolean;
    fCadastro : Integer;
    fVoltaConfirmacao : Boolean;  // significa se esta voltando confirmação de notas true=sim false=nao
    fTrazPedido : Boolean;  // significa se esta Trazendo pedidos true=sim false=nao
    Function  TipoAtzNotaAux(wEntradaSaida:String):String;
    Procedure RecalculaItens;
    Procedure CalculaISS;
    Procedure Checar_preco;
  Public
    { Public declarations }
    Procedure CalculaICM;
    Procedure CalculaItem; // IPI e Val_Total
    Procedure GeraContaPagar(wListaParcela:TStrings; wFinalidade,wDepartamento:Integer);
    Procedure GeraContaReceber(wListaParcela:TStrings; wFinalidade:Integer; wBancoAgencia, wDepartamento :String);
    Procedure VoltaConfirmacao;
    procedure AtualizaEstoque(wTipoAtualizacao:Integer);
    Procedure RateiaFrete;
    Procedure Contabiliza;
    Procedure IncluiNotaAux;
    Procedure VoltaCancelamento;
    Procedure DesdobramentoClaspar;
    Procedure Conhecimento_Frete(wCod_Nota_Cab,wNum_Conhecimento_Frete,wCod_Filial,
               wCod_Transportador,wCod_Operacao_Cf,wTrib_Frete:Integer; wVal_Pedagio,wVal_Icm_Frete,wVal_Frete_Ton,wVal_Frete:Real;
               wDesc_Placa,wDesc_Transportadora,wCod_Contrato_Vend:String; wDt_Emissao_Cf:TDateTime);
    Procedure AtuCaixa(wVal_Movimento : Real);
    Function ItemTr :Real;
    Procedure ValidaContaPagar(wListaParcela:TStrings; wFinalidade:Integer);
    Procedure AtuPedido(wTipoAtu:Integer);
    Procedure SetaEmissao(wCodNota : Integer);
    Procedure ChecaNota;  // ClasPar
    Procedure ExcluiNota;
    Procedure TestaCadastro(wCod_Cadastro : Integer);  //server para testar se o cadastro bloqueado na estrututa tb_cadastro_bloqueado
    Procedure AtuCPFunrural(wTipo:Integer);
    Procedure MostraMsg(wCadastro:Integer);
    function GeraInfAdicionalItem(DataSetItem: TOracleDataset1): string;
    function VerificaNotaDigitada(TipoNota: String): Boolean;
    Property pConfirmando : Boolean Read fConfirmando Write fConfirmando Default False;
    Property pNotaNome : Boolean Read fNotaNome Write fNotaNome Default False;
    Property pApagando : Boolean Read fApagando Write fApagando Default False;
    Property pGravando : Boolean Read fGravando Write fGravando Default False;
    Property pCC : Boolean Read fCC Write fCC Default False;
    Property pCV : Boolean Read fCV Write fCV Default False;
    Procedure AtualizaComissao(pDtInicial : TDateTime);
    Property pTRF : Boolean Read fTRF Write fTRF Default False;     // nota fiscal de transferencia
    Property pTRF2 : Boolean Read fTRF2 Write fTRF2 Default False;  // nota fiscal de transferencia
    Property pTR : Boolean Read fTR Write fTR Default False;
    Property pCF : Boolean Read fCF Write fCF Default False;
    Property pCadastro : Integer Read fCadastro Write fCadastro;
    Property pVoltaConfirmacao : Boolean Read fVoltaConfirmacao Write fVoltaConfirmacao Default False;
    Property pTrazPedido : Boolean Read fTrazPedido Write fTrazPedido Default False;
    Property pDigitou_Manual : Boolean Read fDigitou_Manual Write fDigitou_Manual Default False;  
end;

var
  DMNotaSaida: TDMNotaSaida;
  wTransportador,wPlaca,wTipo_Carta_Correcao : String;
  wCod_Transportador : Integer;

const
  SIT_NOTA_DIGITADA: string = '1';
  SIT_NOTA_CONFIRMADA: string = '2';
  SIT_NOTA_CANCELADA: string = '3';
  SIT_NOTA_DENEGADA: string = '4';

implementation

uses UOracle_cl, UUsuario_cl, UFinalidade_cl, UPlanilha_cl, UEstoque_cl,
  UTributacao_cl, UOperacao_cl, UBiblioteca, UPedido_cl, UCadastro_cl,
  UNotaEntrada_cl, UContasPagar_cl, UParamSistema_cl, USequencia_cl,
  UFilial_cl, UConhecimentoFrete_cl, USenha, UNotaSaidaCad, UTipoLote_cl;

{$R *.DFM}

procedure TDMNotaSaida.DSItemNFUpdateData(Sender: TObject);
begin
   QItemNF.AutoCalcFields:=False;
end;

procedure TDMNotaSaida.QNotaSaidaAfterEdit(DataSet: TDataSet);
begin
  QNotaSaida.AutoCalcFields := False;
  QNotaSaidaCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QNotaSaidaDt_Usuario.Value := DMOracle.DataHoraServ;
end;

procedure TDMNotaSaida.QNotaSaidaAfterCancel(DataSet: TDataSet);
begin
  if not(pTR) and not(pTRF) then
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
  QNotaSaidaDt_Movimento.Value := DMOracle.DataHoraServ;
  QNotaSaidaInd_Situacao.Value := '1';
  QNotaSaidaDt_Emissao.Value := DMOracle.DataServ;
  QNotaSaidaDt_Recebimento.Value := DMOracle.DataServ;
  QNotaSaidaNum_Nota.Value := 0;
  QNotaSaidaCod_Transporte.Value := 1;
  QNotaSaidaInd_Condicao_Pagto.Value := '1';
  QNotaSaidaCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QNotaSaidaIND_TIPO_FRETE.Value := 'CIF';
  QNotaSaidaVal_Despesas.Value := 0;
  QNotaSaidaVal_Frete.Value := 0;
  QNotaSaidaVal_Pedagio.Value := 0;
  QNotaSaidaVal_FunRural.Value := 0;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS')     Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
  Begin
    QNotaSaidaDesc_Transportadora.Value := wTransportador;
    QNotaSaidaDesc_Placa.Value := wPlaca;
    If wCod_Transportador > 0 Then
      QNotaSaidaCod_Transportador.Value := wCod_Transportador;
  End;
  If DMUsuario.CodVendedorPadrao > 0 Then
    QNotaSaidaCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
  If DMUsuario.CodDepartamentoUsuario > 0 Then
    QNotaSaidaCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;
  If DMUsuario.CodOperacaoPadrao > 0 Then
    QNotaSaidaCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
  If DMUsuario.CodClientePadrao > 0 Then
    QNotaSaidaCod_Cadastro.Value := DMUsuario.CodClientePadrao;
  If DMUsuario.CodSeriePadrao <> '' Then
    QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
  if DMUsuario.CodSerieModeloPadrao <> '' then
    QNotaSaidaCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;
  QNotaSaida.AutoCalcFields := True;
end;

procedure TDMNotaSaida.QNotaSaidaAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QNotaSaidaCod_Nota_Cab.Value;
  QNotaSaida.Close;
  QNotaSaida.SetVariable('PK',wCodigo);
  QNotaSaida.Open;
  QNotaSaida.AutoCalcFields := True;
  If (DMParamSistema.CodEmpresa <> 'GONZATTI') Then
  Begin
    wTransportador := QNotaSaidaDesc_Transportadora.Value;
    wPlaca := QNotaSaidaDesc_Placa.Value;
    wCod_Transportador := QNotaSaidaCod_Transportador.Value;
  End;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeInsert(DataSet: TDataSet);
Begin
  PDigitou_Manual := False;  // digitacao manual de valores de icms
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNotaSaida.QItemNFAfterInsert(DataSet: TDataSet);
begin
  QItemNF.AutoCalcFields:=False;
  QItemNFCod_Nota_Cab.Value := QNotaSaidaCod_Nota_Cab.Value;
  QItemNFPerc_IPI.Value := 0;
  QItemNFPerc_Desconto.Value := 0;
  QItemNFVal_Despesas.Value := 0;
  QItemNFVal_Frete.Value := 0;
  QItemNFPerc_Comissao.Value := 0;
  QItemNF.AutoCalcFields:=True;
end;

procedure TDMNotaSaida.QItemNFAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  QItemNF.AutoCalcFields:=False;
  wCodigo := QItemNFCod_Nota_Item.Value;
  if pGravando = False then
    begin
      QItemNF.DisableControls;
      QItemNF.Locate('COD_NOTA_ITEM',wCodigo,[]);
      QSomaItemNota.Close;
      QSomaItemNota.Open;
      QItemNF.EnableControls;
    end;
//  QItemNF.AutoCalcFields:=True;
end;

procedure TDMNotaSaida.QItemNFBeforeDelete(DataSet: TDataSet);
Var wComando : String;
begin
  If not pApagando then
  Begin
    If QNotaSaida.State <> dsEdit then
      Raise Exception.Create('Nota não está no modo de alteração!');
    If QItemNF.State in [dsEdit,dsInsert] then
      QItemNF.Cancel;
    If QNotaSaidaCod_Nota_Conta_Corrente.Value > 0 then
      Raise Exception.Create('Não é permitido excluir items de Nota de Conta Corrente!');
    // *** Calculo do FUNRURAL
    {QNotaSaidaVal_Funrural.Value := QNotaSaidaVal_Funrural.Value
                                   + DMNotaEntrada.CalculaFunrural(-1, QItemNFCod_Produto.Value,
                                    QNotaSaidaCod_Operacao.Value,
                                    QNotaSaidaCod_Cadastro.Value);
    }
  End;
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_BAIXA_PEDIDO';
      wComando := wComando + ' WHERE COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    End;
end;

procedure TDMNotaSaida.QItemNFBeforeEdit(DataSet: TDataSet);
begin
  QItemNF.AutoCalcFields:=False;
  If QNotaSaida.State = dsInsert then
  Begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  End;
  If QNotaSaida.State <> dsEdit then
    Raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QItemNFBeforeInsert(DataSet: TDataSet);
begin
  If QNotaSaida.State = dsInsert then
  Begin
    QNotaSaida.Post;
    QNotaSaida.Edit;
  End;
  If QNotaSaida.State <> dsEdit then
    Raise Exception.Create('Nota não está no modo de alteração!');
end;

procedure TDMNotaSaida.QItemNFBeforePost(DataSet: TDataSet);
var
  wOperacao : string;
  wProduto :Integer;
  wValor :Real;
begin
  // ********* CALCULO DO DESCONTO *************
  QItemNF.AutoCalcFields:=False;
  If pConfirmando = False then
  begin
    CalculaItem;
    // **** Calculo do ICM ****
  end
  Else
  begin
    If QSomaItemNotaSVal_Total.Value <> 0 Then
    Begin
      If (QNotaSaidaVal_Desconto.Value <> 0) And Not(pDigitou_Manual) Then
         QItemNFVal_ICM_Base.Value := 0;
      QItemNFVal_Desconto.Value := 0;
      QItemNFPerc_Desconto.Value := 0;
      QItemNFVal_Despesas.Value := 0;
      QItemNFVal_Desconto.Value := QItemNFVal_Total.Value*(QNotaSaidaVal_Desconto.Value/QSomaItemNotaSVal_Total.Value);
      QItemNFVal_Despesas.Value := QItemNFVal_Total.Value*(QNotaSaidaVal_Despesas.Value/QSomaItemNotaSVal_Total.Value);
      CalculaICM;
      CalculaISS;
    End;
  end;
  If QItemNFPerc_Comissao.Value = 0 Then
     QItemNFPerc_Comissao.Value := QNotaSaidaPerc_Comissao.Value;
//  QItemNF.AutoCalcFields:=True;
  wProduto :=  Trunc(QItemNFCOD_PRODUTO.Value);
  wValor := StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO =' + IntToStr(wProduto)));
  wOperacao := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO =' + QNotaSaidaCOD_OPERACAO.Text);
  //if ((StrToFloat(FNotaSaidaCad.dbedit1.Text) < wValor) and (wOperacao = 'V')) then
  if (QItemNFVAL_UNITARIO.Value < wValor) and (wOperacao = 'V') then
  Begin
    FNotaSaidaCad.Dbedit1.SetFocus;
    FNotaSaidaCad.Dbedit1.Text := '';
    Raise Exception.Create('O Preço informado é inferior ao preço de Venda!');
  end;
end;

Procedure TDMNotaSaida.GeraContaPagar(wListaParcela:TStrings; wFinalidade,wDepartamento:Integer);
Var  wTotalParcelas : Real;
     wCont : Integer;
     wAux : String;
Begin
  // Contas a Pagar do Frete
  wTotalParcelas := 0;
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    wAux := Copy(wListaParcela[wCont],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  End;
  QSomaItemNota.Close;
//  QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
  QSomaItemNota.Open;
  If wTotalParcelas <> QNotaSaidaVal_Frete.Value then
    Raise Exception.Create('Soma das parcelas diferente do valor do Frete!');

  QContaPagar.Open;
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    Try
      QContaPagar.Insert;
      QContaPagarCOD_CONTA_PAGAR_CAB.Value := DMOracle.Sequencia('CONTA_PAGAR');
      QContaPagarCOD_FINALIDADE.Value := wFinalidade;
      QContaPagarCOD_CADASTRO.Value := QNotaSaidaCod_Transportador.Value;
      QContaPagarCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
      QContaPagarCOD_DEPARTAMENTO.Value := wDepartamento;
      QContaPagarNUM_TITULO.Value := QNotaSaidaNum_Nota.Value;
      QContaPagarNUM_PARCELA.Value := wCont+1;
      QContaPagarDESC_TIPO_DOCUMENTO.Value := 'NF';
      QContaPagarDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
      QContaPagarDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont],1,10) );
      QContaPagarDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
      If DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
         QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
      Else
         QContaPagarDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;
      wAux := Copy(wListaParcela[wCont],11,15);
      wAux := Bib.LimpaString(wAux,'.');
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
      QContaPagarMovVal_Movimento.Value :=  QContaPagarVal_Titulo.Value;
      QContaPagarMov.Post;
    Except
      If QContaPagarMov.State in [dsEdit,dsInsert] then
        QContaPagarMov.Cancel;
      If QContaPagar.State in [dsEdit,dsInsert] then
        QContaPagar.Cancel;
      Raise;
    End;
  End;
  QContaPagarMov.Close;
  QContaPagar.Close;
End;

Procedure TDMNotaSaida.GeraContaReceber(wListaParcela:TStrings; wFinalidade:Integer; wBancoAgencia, wDepartamento:String);
Var  wTotalParcelas,wDifer : Real;
     wCont : Integer;
     wAux : String;
Begin
  wTotalParcelas := 0;
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    wAux := Copy(wListaParcela[wCont],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  End;
  wDifer := (wTotalParcelas - (QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVal_AVista.Value)); // - QNotaSaidaVal_Desconto.Value));
  If Abs(wDifer) <= 0.08 Then
     wTotalParcelas := wTotalParcelas + (wDifer * -1);
  If Abs(wTotalParcelas - (QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVal_AVista.Value))  > 0.01 then // - QNotaSaidaVal_Desconto.Value)) > 0.01 then
    Raise Exception.Create('Soma das parcelas diferente do valor total da Nota!');
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    QContaReceber.Open;
    Try
      QContaReceber.Insert;
      QContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
      QContaReceberCOD_FINALIDADE.Value := wFinalidade;
      If Trim(wBancoAgencia) <> '' Then
        QContaReceberCOD_BANCO_AGENCIA.Value := StrToInt(Trim(wBancoAgencia));
      If PCadastro <> 0 Then
         QContaReceberCOD_CADASTRO.Value := PCadastro  // codigo da operadora cartão de crédito
      Else
         QContaReceberCOD_CADASTRO.Value := QNotaSaidaCod_Cadastro.Value;
      QContaReceberCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
      QContaReceberCOD_DEPARTAMENTO.Text := wDepartamento;
      QContaReceberNUM_TITULO.Value := QNotaSaidaNum_Nota.Value;
      QContaReceberNUM_PARCELA.Value := wCont+1;
      QContaReceberDESC_TIPO_DOCUMENTO.Value := QNotaSaidaCod_Serie.Value;
      QContaReceberDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
      // QContaReceberDT_BAIXA.Value : TDateTimeField;
      QContaReceberDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont],1,10));
      QContaReceberDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
      QContaReceberDT_CAPITALIZACAO_MOEDA.Value := QNotaSaidaDt_Emissao.Value;
      With DMFinalidade do
      Begin
        QFinalidade.Close;
        QFinalidade.SetVariable('PK',wFinalidade);
        QFinalidade.Open;
        If QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
           QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_EMISSAO.Value
        Else
           QContaReceberDT_CAPITALIZACAO.Value := QContaReceberDT_VENCIMENTO.Value;
      End;
      wAux := Copy(wListaParcela[wCont],11,15);
      wAux := Bib.LimpaString(wAux,'.');
      If (wCont = 0) And (wDifer <> 0) Then
         wAux := FloatToStr(StrToFloat(wAux) + wDifer);
      QContaReceberVAL_TITULO.Value := StrToFloat( wAux );
      QContaReceberCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
      //QContaReceberDESC_OBSERVACAO.Value : TStringField;
      QContaReceberIND_ACEITE.Value := 'NAO';
      QContaReceberIND_SITUACAO.Value := 'ABERTO';
      QContaReceberVAL_ORIGINAL.Value := QContaReceberVal_Titulo.Value;
      QContaReceberPERC_COMISSAO.Value := QNotaSaidaPerc_Comissao.Value;
      QContaReceberCOD_VENDEDOR.Value := QNotaSaidaCod_Vendedor.Value;
      If QNotaSaidaCod_Contrato_Vend.Text <> '' Then
         QContaReceberCOD_CONTRATO_VEND.Value := QNotaSaidaCod_Contrato_Vend.Value;
      QContaReceber.Post;
      QContaReceberMov.Open;
      QContaReceberMov.Insert;
      QContaReceberMovCod_Conta_Receber_Cab.Value := QContaReceberCod_Conta_Receber_Cab.Value;
      QContaReceberMovCod_Conta_Receber_Mov.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
      QContaReceberMovDt_Movimento.Value := DMOracle.DataServ;
      QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
      QContaReceberMovDT_Usuario.Value := DMOracle.DataHoraServ;
      QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      QContaReceberMovVal_Movimento.Value :=  QContaReceberVal_Titulo.Value;
      QContaReceberMov.Post;
    Except
      If QContaReceberMov.State in [dsEdit,dsInsert] then
        QContaReceberMov.Cancel;
      If QContaReceber.State in [dsEdit,dsInsert] then
        QContaReceber.Cancel;
      Raise;
    End;
  End;
  QContaReceberMov.Close;
  QContaReceber.Close;
End;

Procedure TDMNotaSaida.VoltaConfirmacao;
Var wComando,wSituacao : String;
begin
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '2' Then
     raise Exception.Create('Esta nota não foi confirmada!');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  If (wSituacao <> '') And (wSituacao <> '1') Then 
     raise Exception.Create('Esta nota Possui RPA Emitido - Não Foi possível voltar confirmação');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO_FRETE','COD_NOTA_CAB =' +FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  If (wSituacao <> '') and (wSituacao <> '1') then
     raise Exception.Create('Conhecimento de Frete já confirmado - Não Foi possível voltar confirmação da nota');
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_CONHECIMENTO','COD_NOTA_CAB =' +FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
  If (wSituacao <> '') and (wSituacao <> '1') then
     raise Exception.Create('Conhecimento de Frete já confirmado - Não Foi possível voltar confirmação da nota');
  try
    pVoltaConfirmacao := True;
    if not(pCV) then
      DMOracle.DBCemapa.StartTransaction;
    // 1.Atualizar Nota Fiscal
    QAtzNota.Close;
    QAtzNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
    QAtzNota.Open;
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('PK',QNotaSaidaCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    QAtzNota.Edit;
    QAtzNotaInd_Situacao.Value := '1'; // Digitada

    // 3.Voltar Conta Pagar
    Try
      QContaPagar.Close;
      QContaPagar.Open;
      QContaPagarMov.Close;
      QContaPagarMov.Open;
      While not QContaPagar.Eof do
      Begin
        If QContaPagarMovInd_Tipo_Movimento.Value <> '' Then
        Begin
          If (QContaPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
            Raise Exception.Create('Conta a Pagar com baixas!')
          Else
            QContaPagarMov.Delete;
        End;
        QContaPagar.Delete;
      End;
//      AtuCPFunrural(-1);
    except
      MessageDlg('Não foi possivel voltar Contas a Pagar!',mtWarning,[mbOk],0);
      raise;
    end;
    QContaPagar.Close;
    QContaPagarMov.Close;

    // 4.Voltar Conta Receber
    Try
      QContaReceber.Close;
      QContaReceber.Open;
      QContaReceberMov.Close;
      QContaReceberMov.Open;
      While not QContaReceber.Eof do
      Begin
        If QContaReceberMovInd_Tipo_Movimento.Value <> '' Then
        Begin
          If (QContaReceberMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
            Raise Exception.Create('Conta a Receber com baixas!')
          Else
            QContaReceberMov.Delete;
        End;
        QContaReceber.Delete;
      End;
    except
      MessageDlg('Não foi possivel voltar Contas a Receber!',mtWarning,[mbOk],0);
      raise;
    end;
    QAtzNota.Post;
    QContaReceber.Close;
    QContaReceberMov.Close;

    // 7.Voltar Futura
    QItemNF.First;
    While not QItemNF.Eof do
    Begin
      QBaixaAux.Close;
      QBaixaAux.Open;
      QNotaAuxItNF.Close;
      QNotaAuxItNF.Open;
      While not QBaixaAux.Eof do
        QBaixaAux.Delete;
      While Not QNotaAuxItNF.Eof do
      Begin
        If (  QNotaAuxItNFQt_Atendido.Value
             +QNotaAuxItNFQt_Cancelado.Value
             +QNotaAuxItNFQt_Devolvido.Value ) > 0 then
          Raise Exception.Create('Nota Global com entregas já efetuadas!'
                                 +Chr(13)+'Cancele as Notas de Remessa primeiro!');
        QNotaAuxItNF.Delete;
      End;

      DMNotaEntrada.QVoltaSaldoFixado.Close;
      DMNotaEntrada.QVoltaSaldoFixado.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNFCod_Nota_Item.Value);
      DMNotaEntrada.QVoltaSaldoFixado.ExecSQL;

      QVoltaReceita.Close;
      QVoltaReceita.Open;
      If Not QVoltaReceita.Eof Then
         QVoltaReceita.Delete;
      QVoltaReceita.Close;
      QItemNF.Next;
      QBaixaAux.Close;
      QNotaAuxItNF.Close;
    End;
    // 8.Descontabilizar
    DMPlanilha.DesContabiliza(QNotaSaidaCod_Nota_Cab.Value,'NFS');

    // 9. Voltar Pedidos
    AtuPedido(-1);

    // 9. Voltar Caixa
    QCaixa.Close;
    QCaixa.Open;
    While not QCaixa.Eof do
      QCaixa.Delete;
    QCaixa.Close;

    // 2.Atualizar Estoque
    QNotaSaida.Close;
    QNotaSaida.Open;
//    QNotaSaida.Edit;
    DMNotaSaida.AtualizaEstoque(1);
//    QNotaSaida.Post;

    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CONHECIMENTO_FRETE';
      wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      If DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Text <> '' then
       Begin
         QExecSQL.Close;
         QExecSQL.SQL.Clear;
         wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' +Chr(39) + 'A' + Chr(39);
         wComando := wComando + ' WHERE COD_ORDEM_CARREGAMENTO_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Value);
         QExecSQL.SQL.Add(wComando);
         QExecSQL.ExecSQL;
       End;
    End;
    if not(pCV) then
      DMOracle.DBCemapa.Commit;

    pVoltaConfirmacao := False;
  Except
    pVoltaConfirmacao := False;
    If not(pCV) then
      DMOracle.DBCemapa.RollBack;
    Raise;
  End;
End;

procedure TDMNotaSaida.AtualizaEstoque(wTipoAtualizacao:Integer);
Var wFilial_Estoque : Integer;
    wCustoItem,wRateioNota,wPercRatear,wCustoGrupo,wBaixa : Real;
    wTipoCusto,wAux,wqtd_estoque : String;
begin
  // Verificar Estoque      // RETIRADO PELO CÉSAR DIA 21/01/2000
  wPercRatear := 0;
  wRateioNota := (QNotaSaidaVal_Despesas.Value
                 -QNotaSaidaval_Desconto.Value);
//  If QSomaItemNotaSVal_Total.Value = 0 Then
//     Raise Exception.Create ('Valor Total da Nota Não Pode Ser Zero');
  If QSomaItemNotaSVal_Total.Value <> 0 Then
     wPercRatear := wRateioNota/QSomaItemNotaSVal_Total.Value;
  wTipoCusto := DMOracle.BuscaNome('SELECT IND_CUSTO_NOTA FROM TB_OPERACAO',
                   'COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value));
  QItemNF.First;
  While not QItemNF.Eof do
  Begin
   // Valor do Frete no Item já está sem ICM do Frete
    If Trim(wTipoCusto) = 'E' Then // Nota Fiscal;
    Begin
      wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
                  'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)
                  +' AND COD_LOTE_TIPO = '+FloatToStr(QItemNFCod_Lote_Tipo.Value)
                  +' AND COD_FILIAL = '+FloatToStr(QNotaSaidaCod_Filial.Value));
      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NIR' Then
      Begin
         wCustoGrupo := 0;
         QEstoqueBaixa.Close;
         QEstoqueBaixa.SetVariable('COD_PRODUTO',QItemNFCod_Produto.Value);
         QEstoqueBaixa.Open;
         While Not QEstoqueBaixa.Eof do
         Begin
            wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
                    'COD_PRODUTO = '+FloatToStr(QEstoqueBaixaCod_Produto_Baixa.Value)
                   +' AND COD_LOTE_TIPO = '+FloatToStr(QEstoqueBaixaCod_Lote_Tipo_Baixa.Value)
                   +' AND COD_FILIAL = '+FloatToStr(QNotaSaidaCod_Filial.Value));

            if Trim(wAux) <> '' Then
              wCustoGrupo := wCustoGrupo + StrToFloat(wAux) * QEstoqueBaixaQt_Baixa.Value;
            QEstoqueBaixa.Next;
         End;
         If wCustoGrupo <> 0 Then
            wAux := FloatToStr(wCustoGrupo);
      End;
      If Trim(wAux) <> '' Then
        wCustoItem := StrToFloat(wAux)
      Else
        wCustoItem := 0;
    End
    Else  // Custo pelo Estoque
      wCustoItem := (QItemNFVal_Total.Value
                    +QItemNFVal_Total.Value*wPercRatear // Rateio do Custo das Despesas + Descontos do Corpo da Nota
                    +QItemNFVal_Frete.Value
                    +QItemNFval_Ipi.Value
                    -QItemNFval_ICM.Value);

    wFilial_Estoque := QNotaSaidaCod_Filial.Value;
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
    if QItemNFPERC_BENEFICIADO.Value<> 0 then
       wBaixa := QItemNFQt_Quantidade.Value*QItemNFPERC_BENEFICIADO.Value/100
    else
       wBaixa := QItemNFQt_Quantidade.Value;
    if not(pTR) then
      DMEstoque.AtualizaEstoque(QNotaSaidaCod_Operacao.Value,
                                wFilial_Estoque,
                                QItemNFCod_Produto.Value,
                                QItemNFCod_Lote_Tipo.Value,
                                wBaixa*wTipoAtualizacao,
                                wCustoItem*wTipoAtualizacao,
                                0,QNotaSaidaDt_Emissao.Value );
    If Not(PVoltaConfirmacao) Then  // quando esta voltando confirmação de nota não precisa atualizar custo
     Begin                          // true esta voltando confirmacao de notas
       QItemNF.Edit;                // false não esta voltando confirmação de notas
       QItemNFVal_Custo.Value := wCustoItem;
       QItemNF.Post;
     End;
    QItemNF.Next;
  End;
end;

Procedure TDMNotaSaida.RateiaFrete;
Var wICMFrete : Real;
Begin
  if QNotaSaidaVal_Frete.Value > 0 Then
  Begin
    QSomaItemNota.Close;
    QSomaItemNota.Open;
    // wICMFrete := 0;
    With DMTributacao do
    Begin
      QTributacao.Close;
      QTributacao.SetVariable('PK',QNotaSaidaCod_Tributacao_Frete.Value);
      QTributacao.Open;
      wICMFrete := (QNotaSaidaVal_Frete.Value*QTributacaoPerc_Tributado.Value/100)
                   *QTributacaoPerc_Aliquota.Value/100;
    End;
    QItemNF.First;
    While Not QItemNF.Eof do
    Begin
      QItemNF.Edit;
      QItemNFVal_Frete.Value := (QNotaSaidaVal_Frete.Value-wICMFrete)
                                *QItemNFVal_Total.Value
                                /QSomaItemNotaSVal_Total.Value;
      QItemNF.Post;
      QItemNF.Next;
    End;
  End;
End;

Procedure TDMNotaSaida.Contabiliza;
Var wContra,wNome,wConta_Cred : String;
Begin
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',QNotaSaidaCod_Operacao.Value);
    QOperacao.Open;
    // Valor da Nota
    If QNotaSaidaInd_Condicao_Pagto.Value = '1'
    Then
      Begin
        wContra := QOperacaoCod_Contabil_Val_Nota_Deb.Value;
        wConta_Cred := QOperacaoCod_Cont_Val_Nota_Cred_Avista.Value;
      End
    Else
      Begin
        wContra := QOperacaoCod_Contabil_Val_Nota_APrazo.Value;
        wConta_Cred := QOperacaoCod_Contabil_Val_Nota_Cred.Value;
      End;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value))
    else
       wNome := '';
    DMPlanilha.GravaLanc('NFS',
                         QNotaSaidaCod_Nota_Cab.Value,
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
                         QNotaSaidaCod_Filial.Value,
                         wConta_Cred,
                         'CREDITO',
                         QNotaSaidaCod_Cadastro.Value,
                         DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                         QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaSaidaVal_Desconto.Value,
                         QNotaSaidaDt_Emissao.Value,
                         wContra);
    If QNotaSaidaInd_Condicao_Pagto.Value = '1'
    Then
      DMPlanilha.GravaLanc('NFS',
                           QNotaSaidaCod_Nota_Cab.Value,
                           FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
                           QNotaSaidaCod_Filial.Value,
                           QOperacaoCod_Contabil_Val_Nota_Deb.Value,
                           'DEBITO',
                           QNotaSaidaCod_Cadastro.Value,
                           DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                           QSomaItemNotaSVal_Total.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaSaidaVal_Desconto.Value,
                           QNotaSaidaDt_Emissao.Value,
                           wConta_Cred)
    Else
      Begin
        DMPlanilha.GravaLanc('NFS',
                             QNotaSaidaCod_Nota_Cab.Value,
                             FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
                             QNotaSaidaCod_Filial.Value,
                             QOperacaoCod_Contabil_Val_Nota_APrazo.Value,
                             'DEBITO',
                             QNotaSaidaCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             QSomaItemNotaSVal_Total.Value - QNotaSaidaVal_AVista.Value + QNotaSaidaVal_Despesas.Value + QSomaItemNotaSVal_IPI.Value - QNotaSaidaVal_Desconto.Value,
                             QNotaSaidaDt_Emissao.Value,
                             wConta_Cred);
        If QNotaSaidaVal_AVista.Value > 0
        Then
          DMPlanilha.GravaLanc('NFS',
                               QNotaSaidaCod_Nota_Cab.Value,
                               FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
                               QNotaSaidaCod_Filial.Value,
                               QOperacaoCod_Contabil_Val_Nota_Deb.Value,
                               'DEBITO',
                               QNotaSaidaCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               QNotaSaidaVal_AVista.Value,
                               QNotaSaidaDt_Emissao.Value,
                               wConta_Cred);
      End;

    // ICMS da Nota
    DMPlanilha.GravaLanc('NFE',
                         QNotaSaidaCod_Nota_Cab.Value,
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
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
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
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
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
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
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
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
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
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
                         FloatToStr(QNotaSaidaNum_Nota.Value)+'-'+QNotaSaidaCod_Serie.Value+'-'+wNome,
                         QNotaSaidaCod_Filial.Value,
                         QOperacaoCod_Contabil_Cofins_Cred.Value,
                         'CREDITO',
                         QNotaSaidaCod_Cadastro.Value,
                         DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value,
                         QSomaItemNotaSVal_Cofins.Value,
                         QNotaSaidaDt_Emissao.Value,
                         QOperacaoCod_Contabil_Cofins_Deb.Value);

  End;
End;

Procedure TDMNotaSaida.IncluiNotaAux;
Var wTipoFutura : String;
Begin
  wTipoFutura := '';
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',QNotaSaidaCod_Operacao.Value);
    QOperacao.Open;
    If QOperacaoInd_Futura_Cliente.Value = 'V' then  // Operacao de Compra Futura
      wTipoFutura := wTipoFutura + 'VEN_FUT';
    If QOperacaoInd_Consignacao_Cliente.Value = 'S' then  // Entrada em Consignação
      wTipoFutura := wTipoFutura + 'CON_CLI';
    If QOperacaoInd_Emprestimo_Cliente.Value = 'S' then  // Entrada por Empréstimo
      wTipoFutura := wTipoFutura+'EMP_CLI';
    If QOperacaoInd_Deposito_OUTRAS.Value = 'S' then  // Saída para depósito
      wTipoFutura := wTipoFutura+'DEP_OUT';

    If wTipoFutura <> '' then  // Operacao Futura
    Begin
      If Length(wTipoFutura) > 7 then
        Raise Exception.Create('Operação inválida. Mais do que uma operação Futura!');
      QItemNF.First;
      While not QItemNF.EOF do
      Begin
        QNotaAux.Close;
        QNotaAux.Open;
        QNotaAux.Insert;
        QNotaAuxCod_Nota_Aux.Value := DMOracle.Sequencia('NOTA_AUX');
        QNotaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
        QNotaAuxCod_Produto.Value := QItemNFCod_Produto.Value;
        QNotaAuxQt_Devolvido.Value := 0;
        QNotaAuxQt_Atendido.Value := 0;
        QNotaAuxQt_Cancelado.Value := 0;
        QNotaAuxQt_Nota_Item.Value := QItemNFQt_Quantidade.Value;
        QNotaAuxInd_Tipo.Value := wTipoFutura;
        QNotaAux.Post;
        QItemNF.Next;
      End;
      QNotaAux.Close;
    End;
  End;
End;

Procedure TDMNotaSaida.VoltaCancelamento;
Begin
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value <> '3' Then
    Raise Exception.Create('Esta nota não foi cancelada!');
  Try
    DMOracle.DBCemapa.StartTransaction;
    QAtzNota.Close;
    QAtzNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCod_Nota_Cab.Value);
    QAtzNota.Open;
    QAtzNota.Edit;
    QAtzNotaInd_Situacao.Value := '1';
    QAtzNotaCod_Motivo_Canc.Clear;
    QAtzNota.Post;
    QAtzNota.Close;
    DMOracle.DBCemapa.Commit;
    QNotaSaida.Close;
    QNotaSaida.Open;
  Except
    If QAtzNota.State <> dsBrowse then
      QAtzNota.Cancel;
    Raise Exception.Create('Não é possível voltar cancelamento desta nota!');
  End;
End;

procedure TDMNotaSaida.QBaixaAuxAfterPost(DataSet: TDataSet);
Var wTipoAtu : String;
begin
  wTipoAtu := DMNotaSaida.TipoAtzNotaAux('S');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX',QBaixaAuxCod_Nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  If wTipoAtu = 'ATENDIMENTO' Then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value + QBaixaAuxQt_Quantidade.Value;
  If wTipoAtu = 'DEVOLUCAO' Then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value + QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
end;

procedure TDMNotaSaida.QBaixaAuxBeforeDelete(DataSet: TDataSet);
Var wTipoAtu : String;
begin
  wTipoAtu := DMNotaSaida.TipoAtzNotaAux('S');
  QNotaAux.Close;
  QNotaAux.SetVariable('COD_NOTA_AUX',QBaixaAuxCod_Nota_Aux.Value);
  QNotaAux.Open;
  QNotaAux.Edit;
  If wTipoAtu = 'ATENDIMENTO' Then
    QNotaAuxQt_Atendido.Value := QNotaAuxQt_Atendido.Value - QBaixaAuxQt_Quantidade.Value;
  If wTipoAtu = 'DEVOLUCAO' Then
    QNotaAuxQt_Devolvido.Value := QNotaAuxQt_Devolvido.Value - QBaixaAuxQt_Quantidade.Value;
  QNotaAux.Post;
end;

procedure TDMNotaSaida.QBaixaAuxBeforeEdit(DataSet: TDataSet);
begin
  Raise Exception.Create('Alteracao não suportada!');
end;

Function TDMNotaSaida.TipoAtzNotaAux(wEntradaSaida:String):String;
Begin
  With DMOperacao do
  Begin
    If wEntradaSaida = 'S' Then
    Begin
      If QOperacaoInd_Futura_Fornecedor.Value = 'D' Then
        Result := 'DEVOLUCAO';
      If QOperacaoInd_Futura_Cliente.Value = 'S' Then
        Result := 'ATENDIMENTO';
      If QOperacaoInd_Consignacao_Fornecedor.Value = 'D' Then
        Result := 'DEVOLUCAO';
      If QOperacaoInd_Emprestimo_Fornecedor.Value = 'D' Then
        Result := 'DEVOLUCAO';
      If QOperacaoInd_Deposito_Empresa.Value = 'S' Then
        Result := 'DEVOLUCAO';
      If QOperacaoInd_Deposito_Outras.Value = 'S' Then
        Result := 'DEVOLUCAO';
    End;
  End;
End;

procedure TDMNotaSaida.QNFE_EmiteCalcFields(DataSet: TDataSet);
begin
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     QNFE_Emiteqt_beneficiado.Text := DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE * TB_NOTA_ITEM.PERC_BENEFICIADO / 100) FROM TB_PRODUTO,TB_NOTA_ITEM,TB_NOTA_CAB',
                                     'TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
                                    +' AND TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB'
                                    +' AND TB_PRODUTO.IND_TIPO_PRODUTO = ' + CHR(39)+ 'ARROZ' +CHR(39)
                                    +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+QNFE_EmiteCod_Nota_Cab.Text);
  // busca nome do vendedor
  QNFE_Emitenome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QNFE_EmiteCod_Vendedor.Value));
  If QNFE_EmiteCod_Transportador.Text <> '' then
  Begin
    With DMCadastro do
    Begin
      If QNFE_EmiteCod_Transportador.Value <> 0 Then
      Begin
        QCadastro.Close;
        QCadastro.SetVariable('PK',QNFE_EmiteCod_Transportador.Value);
        QCadastro.Open;
        QNFE_Emitenome_transp.Value := QCadastroNOME.Value;
        QNFE_Emiteend_transp.Value := QCadastroDesc_Endereco.Value;
        QNFE_Emitecidade_transp.Value :=  QCadastroDESC_CIDADE.Value;
        QNFE_Emiteinsc_transp.Value :=  QCadastroNUM_INSCRICAO.Value;
        QNFE_Emitecgc_transp.Value :=  QCadastroNUM_CGC_CPF.Value;
        QNFE_Emiteuf_transp.Value :=  QCadastroCOD_ESTADO.Value;
      End;
    End;
  End;
  if QNFE_EmiteCod_Mensagem.Value > 0 then
  Begin
     QNFE_EmiteDesc_Mensagem.Value := DMOracle.BuscaNome('Select Desc_Mensagem From Tb_Mensagem','Cod_Mensagem='+FloatToStr(QNFE_EmiteCod_Mensagem.Value));
     QNFE_EmiteDesc_Complemento.Value := DMOracle.BuscaNome('Select Desc_Complemento From Tb_Mensagem','Cod_Mensagem='+FloatToStr(QNFE_EmiteCod_Mensagem.Value));
     QNFE_EmiteDesc_Complemento1.Value := DMOracle.BuscaNome('Select Desc_Complemento1 From Tb_Mensagem','Cod_Mensagem='+FloatToStr(QNFE_EmiteCod_Mensagem.Value));
     QNFE_EmiteDesc_Complemento2.Value := DMOracle.BuscaNome('Select Desc_Complemento2 From Tb_Mensagem','Cod_Mensagem='+FloatToStr(QNFE_EmiteCod_Mensagem.Value));
  End
  else
  Begin
     QNFE_EmiteDesc_Mensagem.Value := '';
     QNFE_EmiteDesc_Complemento.Value := '';
     QNFE_EmiteDesc_Complemento1.Value := '';
     QNFE_EmiteDesc_Complemento2.Value := '';
  end;
  If (QNFE_EmiteUF_Filial.Value <> QNFE_EmiteUF_Nota.Value)then  //ALTERADO SERGIO 13/12/2002
  Begin
    If(DATE >= StrToDate('01/01/2003'))Then
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_INTERESTADUAL_NOVO.Text
    Else
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_INTERESTADUAL.Text;
  End
  Else
  Begin
    If(DATE >= StrToDate('01/01/2003'))Then
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNAT_ESTADUAL_NOVO.Text
    Else
      QNFE_Emitenum_cfop.Text := QNFE_EmiteNat_Estadual.Text;
  End;
end;

Procedure TDMNotaSaida.AtuCaixa(wVal_Movimento : Real);
Var wNome,wHistorico : String;
Begin
  Try
    wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa FROM TB_OPERACAO','COD_OPERACAO = '+QNotaSaidaCod_Operacao.Text);
    If wHistorico <> '' Then
    Begin
//      QSomaItemNota.Close;
//      QSomaItemNota.Open;
      QCaixa.Open;
      QCaixa.Insert;
      QCaixaCOD_CAIXA_MOV.Value := DMOracle.Sequencia('CAIXA_MOV');
      QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL')
      Then
        QCaixaCOD_FILIAL.Value := 1
      Else
        QCaixaCOD_FILIAL.Value := QNotaSaidaCod_Filial.Value;
      If QNotaSaidaCod_Departamento.Text = '' Then
         QCaixaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario
      Else
         QCaixaCOD_DEPARTAMENTO.Value := QNotaSaidaCod_Departamento.Value;
      QCaixaCOD_HISTORICO.Value := StrToInt(wHistorico);
      QCaixaDT_MOVIMENTO.Value := QNotaSaidaDt_Recebimento.Value;
      QCaixaVAL_MOVIMENTO.Value := wVal_Movimento;    // QSomaItemNotaSVal_Total_Nota.Value;
      QCaixaNUM_DOCUMENTO.Value := QNotaSaidaNum_Nota.Value;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') Then
       Begin
         wNome := DMOracle.BuscaNome('Select Nome From Tb_Cadastro','Cod_Cadastro='+FloatToStr(QNotaSaidaCod_Cadastro.Value));
         QCaixaDESC_COMPLEMENTO.Value := wNome+' - '+QNotaSaidaNum_Nota.Text;
       End
      Else
         QCaixaDESC_COMPLEMENTO.Value := 'Venda a Vista Cfe Nf Nr:'+QNotaSaidaNum_Nota.Text;
      QCaixaNUM_DOCUMENTO.Value := QNotaSaidaNum_Nota.Value;
      QCaixaCOD_CADASTRO.Value := QNotaSaidaCod_Cadastro.Value;
      QCaixaCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
      QCaixaDT_USUARIO.Value := DMOracle.DataServ;
      QCaixa.Post;
    End;
  Except
    If QCaixa.State = dsInsert then
      QCaixa.Cancel;
    Raise;
  End;
  QCaixa.Close;
End;

Procedure TDMNotaSaida.ValidaContaPagar(wListaParcela:TStrings; wFinalidade:Integer);
Var  wTotalParcelas : Real;
     wCont : Integer;
     wAux : String;
Begin
  wTotalParcelas := 0;
  For wCont := 0 to wListaParcela.Count - 1 do
  Begin
    wAux := Copy(wListaParcela[wCont],11,15);
    wAux := Bib.LimpaString(wAux,'.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  End;
  If wTotalParcelas <> (QNotaSaidaVal_Frete.Value) then
    Raise Exception.Create('Soma das parcelas diferente do valor do Frete!');
End;

Procedure TDMNotaSaida.CalculaItem;
Var wTipoProduto, wUnidade : String;
Begin
  If QItemNFQt_Quantidade.Value = 0 Then
    QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
  Else
  Begin
    If pGravando = False Then // serve para nao recalcular o valor total apos gravado o item problema com numero de casas decimais
     Begin
       wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
       If wTipoProduto <> 'AGRICOLA' Then
        Begin
          QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value //
        End
       Else
        Begin
          wUnidade := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
          If Trim(wUnidade) <> '' then
            QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value*QItemNFVal_Unitario.Value/StrToFloat(wUnidade)
          else
            Raise Exception.Create('Produto Agricola sem Embalagem Cadastrada!'
                                  +Chr(13)+'Não é possivel calcular o preço total!');

        End;
     End;
  End;
  QItemNFval_ipi.Value := QItemNFVal_Total.Value*QItemNFPerc_IPI.Value/100;
  If DMOperacao.QOperacaoPerc_Base_Pis.Value > 0 Then
     QItemNFVal_Pis.Value := (QItemNFVal_Total.Value *
                             DMParamSistema.QParamSistemaPerc_Pis.Value *
                             (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100)) /100;
  If DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 Then
     QItemNFVal_Confins.Value := (QItemNFVal_Total.Value *
                             DMParamSistema.QParamSistemaPerc_Cofins.Value *
                             (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100)) /100;
End;

procedure TDMNotaSaida.QItemNFQT_QUANTIDADEValidate(Sender: TField);
Var wQtPedido : Real;
begin
  If pTrazPedido = False Then
  Begin
    CalculaItem;
    DMNotaSaida.QAtuBaixaPed.Close;
    DMNotaSaida.QAtuBaixaPed.SetVariable('COD_NOTA_ITEM',QItemNFCod_Nota_Item.Value);
    DMNotaSaida.QAtuBaixaPed.Open;
    if QAtuBaixaPedCOD_PEDIDO_ITEM.Value <> 0 then
     Begin
       wQtPedido := StrToFloat(DMOracle.BuscaNome('SELECT QT_PEDIDO-QT_ATENDIDO-QT_CANCELADO FROM TB_PEDIDO_ITEM','COD_PEDIDO_ITEM='+QAtuBaixaPedCOD_PEDIDO_ITEM.Text));
       If wQtPedido > QItemNFQT_QUANTIDADE.Value Then    // serve para quando estiver atendendo na nf mais que
          wQtPedido := QItemNFQT_QUANTIDADE.Value;       // a quantidade do pedido
       QAtuBaixaPed.Edit;
       QAtuBaixaPedQt_Baixa.Value := wQtPedido;
       QAtuBaixaPed.Post;
     End;
    QAtuBaixaPed.Close;
    QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
  End;
end;

procedure TDMNotaSaida.QItemNFCOD_PRODUTOValidate(Sender: TField);
Var wPercIPI, wPrecoUnitario,wTipoPreco,wSituacao : String;
begin
  If QItemNF.State in [dsEdit, dsInsert] then
   Begin
    wSituacao:= DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO='+FloatToStr(QItemNFCod_Produto.Value));
    If (wSituacao <> 'ATIVO') And (wSituacao <> '') then
        Raise Exception.Create('Produto sem permissão para venda - Situação Produto!');
    wPercIPI := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO','COD_PRODUTO='+FloatToStr(QItemNFCod_Produto.Value));
    If wPercIPI <> '' Then
       QItemNFPerc_Ipi.Value := StrToFloat(wPercIPI);
   End;
  If pTrazPedido = False Then
   Begin
     wTipoPreco := DMOracle.BuscaNome('SELECT IND_PRECO FROM TB_OPERACAO',
                                      'COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value));
     If wTipoPreco = 'P' Then
      Begin
        wPrecoUnitario := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO FROM TB_PRODUTO',
                                     '(COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)+
                                     ') AND (DT_PRECO_PRO_INI <= TRUNC(SYSDATE)) AND (DT_PRECO_PRO_FIN >= TRUNC(SYSDATE))' );

        if (wPrecoUnitario='') or (wPrecoUnitario='0')then
            wPrecoUnitario := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO',
                                                 'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
      End
     Else
       If wTipoPreco = 'C' Then
          wPrecoUnitario := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
                                               'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value) +
                                               ' AND COD_FILIAL = '+FloatToStr(QNotaSaidaCod_Filial.Value) +
                                               ' AND COD_LOTE_TIPO = '+FloatToStr(QItemNFCod_Lote_Tipo.Value));
     If Trim(wPrecoUnitario) <> '' then
        QItemNFVal_Unitario.Value := StrToFloat(wPrecoUnitario);
     if DMOperacao.QOperacaoCod_Tributacao.Text <> '' Then
        QItemNFCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
     Else
       If QNotaSaidaCod_Estado.Value <> DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL','COD_FILIAL = '+QNotaSaidaCod_Filial.Text) Then
          QItemNFCod_Tributacao.Text := DMOracle.BuscaNome('SELECT Trunc(PERC_TRIBUTACAO) FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+QNotaSaidaCod_Estado.Value+CHR(39))
       Else
          QItemNFCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value) );
     If pTRF2 then
      begin
        QItemNFVal_Unitario.Value:=ItemTR;
        QItemNFCod_Tributacao.text := DMOracle.BuscaNome('SELECT NUM_TRIB_TRANSFERENCIA FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
      end;
     DMNotaSaida.QAtuBaixaPed.Open;
     if Not DMNotaSaida.QAtuBaixaPed.Eof Then
      begin
        QAtuBaixaPed.Edit;
        QAtuBaixaPedQt_Baixa.Value := QItemNFQT_QUANTIDADE.value;
        QAtuBaixaPed.Post;
      end;
     DMNotaSaida.QAtuBaixaPed.Close;
   End;
end;

procedure TDMNotaSaida.QItemNFCalcFields(DataSet: TDataSet);
begin
  QItemNFnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
end;

procedure TDMNotaSaida.QNotaSaidaBeforePost(DataSet: TDataSet);
begin
  If pNotaNome = False then  // somente utilizado para nota saida consumidor reemissão caixa encopel
  Begin                      // quando for reemissão caixa da encopel esta true este campo
    QNotaSaida.AutoCalcFields := False;
    If QItemNF.State in [dsEdit,dsInsert] then
      QItemNF.Post;
  End;
end;

procedure TDMNotaSaida.QSomaItemNotaCalcFields(DataSet: TDataSet);
begin
  QSomaItemNotaSVal_Total_Nota.Value := QSomaItemNotaSVal_Total.Value
                                       +QSomaItemNotaSVal_Ipi.Value
                                       -QSomaItemNotaSVal_INSS.Value
                                       +QSomaItemNotasVal_Icms_Subst.Value
                                       +QNotaSaidaVal_Despesas.Value
                                       -QNotaSaidaVal_Desconto.Value
                                       +QNotaSaidaVal_FunRural.Value;
end;

Procedure TDMNotaSaida.CalculaICM;
Var wPercICM,wPercAliqSubs,wBaseAliqSubs  : Real;
    wPercDesc : Real;
     wAuxBase, wTotal : Real;
begin
  wPercDesc := 0;
  If QItemNFVal_ICM_Base.Value = 0 Then
  Begin
    Try
      If QSomaItemNotaSVal_Total.Value > 0 then
        wTotal := QSomaItemNotaSVal_Total.Value
      Else
        wTotal := QItemNFVal_Total.Value;
      If wTotal <> 0 Then
        wPercDesc := 1+(QNotaSaidaVal_Despesas.Value-QNotaSaidaVal_Desconto.Value)/wTotal;
      If Trim(QItemNFCod_Tributacao.Text) <> '' then
      Begin
        wPercICM := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCod_Tributacao.Value)));
        wAuxBase := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCod_Tributacao.Value)));
        If (DMOperacao.QOperacaoInd_Vendas.Value = 'V') And
           (DMOperacao.QOperacaoInd_Emite.Value = 'F')  Then
        Begin
          wPercAliqSubs := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQ_SUBST FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+QNotaSaidaCod_Estado.Value+Chr(39)));
          wBaseAliqSubs := StrToFloat(DMOracle.BuscaNome('SELECT PERC_BASE_SUBST FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+QNotaSaidaCod_Estado.Value+Chr(39)));
        End;
        QItemNFVal_ICM_Base.Value := QItemNFVal_Total.Value * wAuxBase / 100 * wPercDesc;
        QItemNFVal_ICM.Value := QItemNFVal_ICM_Base.Value * wPercICM / 100;
        If (DMOperacao.QOperacaoInd_Vendas.Value = 'V') And
           (DMOperacao.QOperacaoInd_Emite.Value = 'F')  Then
        Begin
          QItemNFVal_Base_Subst.Value := QItemNFVal_Total.Value * wBaseAliqSubs / 100 * wPercDesc;
          QItemNFVal_Icms_Subst.Value := QItemNFVal_Base_Subst.Value * wPercAliqSubs / 100;
          If QItemNFVal_Icms_Subst.Value <> 0 Then
             QItemNFVal_Icms_Subst.Value := QItemNFVal_Icms_Subst.Value - QItemNFVal_ICM.Value;
        End;     
      End;
    Except
      Raise Exception.Create ('Erro no Calculo de Icms');
    End;
  End;
End;

Procedure TDMNotaSaida.AtuPedido(wTipoAtu:Integer);
Begin
  DMNotaSaida.QItemNF.First;
  While not DMNotaSaida.QItemNF.Eof do
  Begin
    DMNotaSaida.QAtuBaixaPed.Close;
    DMNotaSaida.QAtuBaixaPed.SetVariable('COD_NOTA_ITEM',QItemNFCod_Nota_Item.Value);
    DMNotaSaida.QAtuBaixaPed.Open;
    If QAtuBaixaPedCod_Pedido_item.Value > 0 then
    Begin
      DMNotaSaida.QAtzItemPedido.Close;
      DMNotaSaida.QAtzItemPedido.SetVariable('COD_PEDIDO_ITEM',QAtuBaixaPedCod_Pedido_item.Value);
      DMNotaSaida.QAtzItemPedido.SetVariable('QT_ACRESCENTAR',(wTipoAtu*QAtuBaixaPedQt_Baixa.Value));
      DMNotaSaida.QAtzItemPedido.ExecSQL;
    End;
    DMNotaSaida.QItemNF.Next;
  End;
  DMNotaSaida.QAtuBaixaPed.Close;
End;

procedure TDMNotaSaida.QNotaSaidaCOD_CADASTROValidate(Sender: TField);
var
  Nulo :String;
begin
  QNotaSaidaCod_Estado.Value := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value));
  Nulo := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value));
  if Nulo<>'' then
     QNotaSaidaCod_Vendedor.Value:=StrToInt(Nulo);
  Nulo := DMOracle.BuscaNome('SELECT COD_VENDEDOR_PREPOSTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value));
  if Nulo<>'' then
     QNotaSaidaCod_Vendedor_Preposto.Value:=StrToInt(Nulo);
  QNotaSaida.AutoCalcFields := False;
  if Trim(QNotaSaidaCOD_CADASTRO.Text) <> '' then
    if Trim(DMOracle.BuscaNome('SELECT COD_MOTIVO FROM TB_CADASTRO',' COD_CADASTRO = '+QNotaSaidaCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
end;

procedure TDMNotaSaida.QNotaSaidaVAL_DESPESASValidate(Sender: TField);
begin
  RecalculaItens;
end;

Procedure TDMNotaSaida.RecalculaItens;
Begin
  if not(pCC) then
   begin
     try
      QNotaSaida.AutoCalcFields:=False;
      QItemNF.DisableControls;
      QItemNF.First;
      While not QItemNF.Eof do
       Begin
        QItemNF.Edit;
        QItemNF.Post;
        QItemNF.Next;
      End;
     Finally
      QItemNF.EnableControls;
     End;
   End;
End;

procedure TDMNotaSaida.QItemNFAfterDelete(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
//  QSomaItemNota.SetVariable('COD_NOTA_CAB',QNFE_EmiteCod_Nota_Cab.Value);
  QSomaItemNota.Open;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeEdit(DataSet: TDataSet);
begin
  If pNotaNome = False then   // notas reemissão caixa encopel nota ao consumidor este campo com true
    If QNotaSaidaInd_Situacao.Value <> '1' then
      Raise Exception.Create('Esta nota já esta confirmada ou cancelada!');
  If not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNotaSaida.QNotaSaidaVAL_FRETEValidate(Sender: TField);
Var wPBase, wPICM : String;
begin
  QNotaSaida.AutoCalcFields:=False;
  wPICM := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QNotaSaidaCod_Tributacao_Frete.Value) );
  wPBase := DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QNotaSaidaCod_Tributacao_Frete.Value) );
  If (wPBase <> '') and (wPICM <> '') then
  Begin
    QNotaSaidaVal_ICM_Base_Frete.Value := (QNotaSaidaVal_Frete.Value)
                                            *StrToFloat(wPBase)/100;
    QNotaSaidaval_icm_Frete.Value := (QNotaSaidaVal_ICM_Base_Frete.Value*StrToFloat(wPBase)/100)*StrToFloat(wPICM)/100;
  End
  Else
  Begin
    QNotaSaidaVal_ICM_Base_Frete.Value := 0;
    QNotaSaidaVal_ICM_Frete.Value := 0;
  End;
end;

Procedure TDMNotaSaida.SetaEmissao(wCodNota : Integer);
Begin
  QNFE_Emite.Close;
  QNFE_Emite.SetVariable('COD_NOTA_CAB',wCodNota);
  QNFE_Emite.Open;
  QNFE_EmiteIt.Close;
  QNFE_EmiteIt.Open;
End;

procedure TDMNotaSaida.QItemNFPERC_DESCONTOValidate(Sender: TField);
begin
  If (pConfirmando = False)  And
     (QItemNFPerc_desconto.Value <> 0) then
  Begin
    QItemNFPerc_Desc.Value := QItemNFPerc_Desconto.Value;  // SERVE PARA FICAR O % DE DESCONTO FORNECIDO NA NOTA
    QItemNFVal_Unitario.Value := Round(QItemNFVal_Unitario.Value*(1-QItemNFPerc_Desconto.Value/100) * 100) / 100;
    QItemNFPerc_Desconto.Value := 0;
    QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
  End;
end;

procedure TDMNotaSaida.QItemNFVAL_DESCONTOValidate(Sender: TField);
begin
  if (pConfirmando = False) And
     (QItemNFVal_Desconto.Value > 0 ) Then
  begin
    QItemNFVal_Unitario.Value := (QItemNFVal_Total.Value-QItemNFVal_Desconto.Value) / QItemNFQt_Quantidade.Value;
    QItemNFVal_Desconto.Value := 0;
    QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
  end;
end;

procedure TDMNotaSaida.QItemNFVAL_DESPESASValidate(Sender: TField);
begin
  If (pConfirmando = False) And
     (QItemNFVal_Despesas.Value > 0 ) then
   Begin
    QItemNFVal_Unitario.Value := (QItemNFVal_Total.Value+QItemNFVal_Despesas.Value) / QItemNFQt_Quantidade.Value;
    QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
   End;
end;

Procedure TDMNotaSaida.QNotaSaidaCOD_TRANSPORTADORValidate(Sender: TField);
begin
  QNotaSaidaDesc_transportadora.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Transportador.Value));
end;

Procedure TDMNotaSaida.ChecaNota;
Var wPesoClasPar,wDtVencto,wAux,wSerie,wEmbalagem,wLibera,WTpOper,wNada : String;
    wQtSaldo_Claspar,wValor_cc : Real;
begin
  // *** Tipo de Cadastro ***
  wAux := DMOracle.BuscaNome('SELECT IND_VENDA FROM TB_CLASS_CADASTRO, TB_CADASTRO',
          'TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO'
         +' AND TB_CADASTRO.COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value));
  wTpOper := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value));
  If (Trim(wAux) <> 'S') And (wTpOper = 'V') Then
    Raise Exception.Create('Classificação de Cliente sem permissão para Venda!');
  // *** consistência Série com Operação  ***
  wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value));
  if wSerie <> '' Then
    if wSerie <> QNotaSaidaCod_Serie.Value Then
       Raise Exception.Create('Série Nota Fiscal Não Liberada Para Esta Operação!');
  wValor_cc := 0;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') And
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
   End;
   If QNotaSaidaInd_Condicao_Pagto.Value <> '1' Then
    DMCadastro.ValidaCredito(QNotaSaidaCod_Cadastro.Value,QSomaItemNotaSVal_Total_Nota.Value+wValor_cc);
  // *** Validar Cadastro Encerrado
  if (DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',
          'TB_CADASTRO.COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value))) <> '' Then
     raise Exception.Create('Cliente com Cadastro Encerrado!');
  If (DMOracle.BuscaNome('SELECT IND_BLOQUEIO_VENDA_VCTO FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Filial.Value)) = 'SIM') Then
  Begin
    If QNotaSaidaInd_Condicao_Pagto.Value <> '1' then
    Begin
      wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
      wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO = '+
                                    FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
      if wDtvencto <> '' then
         if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) Then
            If wLibera = 'NAO' Then
               raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
    End;
  End;
  // *** Checar Lotes da Claspar
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
  Begin
    QItemNF.First;
    While not QItemNF.Eof do
    Begin
      wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
      wPesoClaspar := DMOracle.BuscaNome('SELECT QT_CLASSIFICADO FROM TB_LOTE_CLASPAR','COD_LOTE_TIPO = '+FloatToStr(QItemNFCod_Lote_Tipo.Value));
      If Trim(wPesoClaspar) <> '' then
      begin
        QSomaClaspar.Close;
        QSomaClaspar.SetVariable('LOTE',QItemNFCod_Lote_Tipo.Value);
        QSomaClaspar.Open;
        wQtSaldo_Claspar := StrToFloat(wPesoClaspar) - QSomaClasparSQt_Saida.Value;
        If (QSomaClasparSQt_Saida.Value+(QItemNFQt_Quantidade.Value*StrToFloat(wEmbalagem))) > StrToFloat(wPesoClaspar) then
          Raise Exception.Create('Quantidade do item da Nota ultrapassa a quantidade do Certificado da Claspar!' + chr(13) +'Saldo =' + FloatToStr(wQtSaldo_Claspar));
      end;
      QItemNF.Next;
    End;
  End;
end;

procedure TDMNotaSaida.CalculaISS;
Var wPercISS : String;
begin
  wPercISS := DMOracle.BuscaNome('SELECT PERC_ISS FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
  If Trim(wPercISS) <> '' then
    If DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)) <> 'SIM' Then
       QItemNFVal_ISS.Value := QItemNFVal_Total.Value * StrToFloat(wPercISS)/100;
end;

procedure TDMNotaSaida.QNotaSaidaAfterOpen(DataSet: TDataSet);
begin
  QSomaItemNota.Close;
  QSomaItemNota.Open;
end;

procedure TDMNotaSaida.QNotaSaidaBeforeDelete(DataSet: TDataSet);
begin
//  If QNotaSaidaInd_Situacao.Value <> '1' Then
//    Raise Exception.Create('Somente notas digitadas podem ser excluidas!');
  if not(pCV) then
    DMOracle.DBCemapa.StartTransaction;
  If QNotaSaidaCod_Nota_Conta_Corrente.Value > 0 then
  Begin
    QVoltaContaCorrente.Close;
    QVoltaContaCorrente.SetVariable('COD_NOTA',QNotaSaidaCod_Nota_Cab.Value);
    QVoltaContaCorrente.ExecSQL;
  End;
end;

procedure TDMNotaSaida.QNotaSaidaAfterDelete(DataSet: TDataSet);
begin
  if not(pCV) then
    DMOracle.DBCemapa.Commit;
end;

procedure TDMNotaSaida.QNotaSaidaDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

Procedure TDMNotaSaida.ExcluiNota;
begin
  try
    if QNotaSaidaInd_Situacao.Value <> '1' Then
       raise Exception.Create('Somente notas digitadas podem ser excluidas!');
    If DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)) <> '' Then
       raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
    pApagando := True;
    QItemNF.First;
    while not QItemNF.Eof do
      QItemNF.Delete;
    QNotaSaida.Delete;
    pApagando := False;
  except
    pApagando := False;
    raise;
  end;
end;

procedure TDMNotaSaida.AtuCPFunrural(wTipo:Integer) ;
Var wCodContaPagar : String;
    wAno,wMes,wDia : Word;
    wAnoVenc,wMesVenc : Word;
begin
  // ** Gera Contas a Pagar do Funrural
  If QNotaSaidaVal_Funrural.Value > 0 Then
  Try
    DecodeDate(QNotaSaidaDt_Emissao.Value,wAno,wMes,wDia);
    If wMes = 12 Then
     Begin
      wMesVenc := 1;
      wAnoVenc := wAno+1;
     End
    Else
     Begin
      wMesVenc := wMes + 1;
      wAnoVenc := wAno;
     End;
    wCodContaPagar := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                        'COD_FILIAL = '+FloatToStr(QNotaSaidaCod_Filial.Value)
                        +' AND NUM_TITULO = '+FloatToStr(wAno)
                        +' AND NUM_PARCELA = '+FloatToStr(wMes)
                        +' AND IND_SITUACAO = '+#39+'ABERTO'+#39 );
    If DMFinalidade.QFinalidadeCod_Finalidade.Value <> DMParamSistema.QParamSistemaCod_Finalidade_Cp_Funrural.Value Then
    With DMFinalidade do
     Begin
      QFinalidade.Close;
      QFinalidade.SetVariable('PK',DMParamSistema.QParamSistemaCod_Finalidade_Cp_Funrural.Value);
      QFinalidade.Open;
     End;
    With DMContasPagar do
     Begin
      QContasPagar_Cab.Close;
      If Trim(wCodContaPagar) <> '' Then
      Begin
        QContasPagar_Cab.SetVariable('PK',StrToInt(wCodContaPagar));
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
                                             '05/'+FormatFloat('00',wMesVenc)
                                             +'/' +FormatFloat('0000',wAnoVenc)
                                               );
        QContasPagar_CabDT_EMISSAO.Value := QNotaSaidaDt_Emissao.Value;
        If DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
            QContasPagar_CabDT_CAPITALIZACAO.Value := QContaPagarDT_EMISSAO.Value
        Else
           QContasPagar_CabDT_CAPITALIZACAO.Value := QContaPagarDT_VENCIMENTO.Value;
        QContasPagar_CabVAL_TITULO.Value := QContasPagar_CabVAL_TITULO.Value+QNotaSaidaVal_Funrural.Value*wTipo;
        // QContasPagar_CabCOD_NOTA_CAB.Value := QNotaSaidaCod_Nota_Cab.Value;
        //QContaPagarDESC_OBSERVACAO.Value : TStringField;
        QContasPagar_CabIND_ACEITE.Value := 'NAO';
        QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
        QContasPagar_CabVAL_ORIGINAL.Value := QContasPagar_CabVAL_ORIGINAL.Value+QNotaSaidaVal_Funrural.Value*wTipo;

        If QContasPagar_Cab.State = dsInsert Then
        Begin
          // Em QContasPagar_Cab BeforePost inclui o Movimento principal
          QContasPagar_Cab.Post;
        End
        Else
        Begin
          QContasPagar_Mov.Locate('IND_TIPO_MOVIMENTO','PRINCIPAL',[]);
          QContasPagar_Mov.Edit;
          QContasPagar_MovDt_Movimento.Value := DMOracle.DataServ;
          QContasPagar_MovInd_Tipo_Movimento.Value := 'PRINCIPAL';
          QContasPagar_MovDT_Usuario.Value := DMOracle.DataHoraServ;
          QContasPagar_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
          QContasPagar_MovVal_Movimento.Value :=  QContasPagar_MovVal_Movimento.Value+QNotaSaidaVal_Funrural.Value*wTipo;
          QContasPagar_Mov.Post;
          QContasPagar_Cab.Post;
        End;
        QContasPagar_Mov.Close;
        QContasPagar_Cab.Close;
      End;
     End;
  Except
    If DMContasPagar.QContasPagar_Mov.State in [dsEdit,dsInsert] Then
      DMContasPagar.QContasPagar_Mov.Cancel;
    If DMContasPagar.QContasPagar_Cab.State in [dsEdit,dsInsert] Then
      DMContasPagar.QContasPagar_Cab.Cancel;
    ShowMessage('Não foi possível atualizar Contas a Pagar de Funrural!');
    Raise;
  End;
end;

procedure TDMNotaSaida.AtualizaComissao(pDtInicial: TDateTime);
Var
  I : Integer;
  wTipoComissao,wComissaoCalculada,wDescSQL, wDescCriterio,wAux : String;
  wPercComissao1, wPercComissao2,wPreco1,wPreco2, wValUnitario : Real;
begin
  QAtuComissao.Close;
  QAtuComissao.SetVariable('DT_INICIAL',pDtInicial);
  QAtuComissao.Open;
  wValUnitario := 0;   // INICIALIZA VALOR DA VARIAVEL - Robson 26/06/2000
  wTipoComissao := DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value;
  if wTipoComissao = '7' Then
     Exit;
  QAtuComissao.First;
  While not QAtuComissao.Eof do
  Begin
    If (QAtuComissaoIND_ENTRADA_SAIDA.Value = 'S')
       or
       (QAtuComissaoIND_VENDAS.Value = 'D') Then
    Begin
      Case StrToInt(wTipoComissao) of
        1: Begin // Por Vendedor
             wComissaoCalculada := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QAtuComissaoCod_Vendedor.Value));
           End;
        2: Begin // Por Produto
             wComissaoCalculada := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QAtuComissaoCod_Produto.Value));
           End;
        3: Begin // Por Classe
             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T4.PERC_COMISSAO1 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_NOTA_ITEM T1, ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T2, ';
             WDescSQL := wDescSQL +   'TB_CLASSE T3, ';
             WDescSQL := wDescSQL +   'TB_CLASSE T4 ';
             wDescCriterio :=                 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
             wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
             wDescCriterio := wDescCriterio + 'T3.NUM_CLASSE = T4.NUM_CLASSE AND ';
             wDescCriterio := wDescCriterio + 'T4.NUM_SUBCLASSE = 0 AND ';
             wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wComissaoCalculada := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
           End;

        4: Begin // Por Sub-Classe
             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T3.PERC_COMISSAO1 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_NOTA_ITEM T1, ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T2, ';
             WDescSQL := wDescSQL +   'TB_CLASSE T3 ';
             wDescCriterio :=                 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
             wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
             wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wComissaoCalculada := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
           End;

        5: Begin // Por Media da Sub-Classe
             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T3.PERC_COMISSAO1 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_NOTA_ITEM T1, ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T2, ';
             WDescSQL := wDescSQL +   'TB_CLASSE T3 ';
             wDescCriterio :=                 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
             wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
             wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
             If Trim(wAux) <> '' then
               wPercComissao1 := StrToFloat(wAux)
             Else
               wPercComissao1 := 0;

             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T3.PERC_COMISSAO2 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_NOTA_ITEM T1, ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T2, ';
             WDescSQL := wDescSQL +   'TB_CLASSE T3 ';
             wDescCriterio :=                 'T1.COD_PRODUTO = T2.COD_PRODUTO AND ';
             wDescCriterio := wDescCriterio + 'T2.COD_CLASSE = T3.COD_CLASSE AND ';
             wDescCriterio := wDescCriterio + 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
             If Trim(wAux) <> '' then
               wPercComissao2 := StrToFloat(wAux)
             Else
               wPercComissao2 := 0;

             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T1.VAL_ATACADO ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T1 ';
             wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
             If Trim(wAux) <> '' then
               wPreco1 := StrToFloat(wAux)
             Else
               wPreco1 := 0;

             wDescSQL :=  'SELECT ';
             WDescSQL := wDescSQL +   'T1.VAL_VAREJO ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T1 ';
             wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
             If Trim(wAux) <> '' then
               wPreco2 := StrToFloat(wAux)
             else
               wPreco2 := 0;

             If wValUnitario <= wPreco1 then
               wComissaoCalculada := FloatToStr(wPercComissao1)
             Else
               If wValUnitario >= wPreco2 Then
                 wComissaoCalculada := FloatToStr(wPercComissao2)
               Else
               Begin // Preco Medio
                 wComissaoCalculada := FloatToStr( wPercComissao1
                                       + (wPercComissao2-wPercComissao1)
                                       * ( wValUnitario-wPreco1)
                                       / (wPreco2-wPreco1)  );
               End;
           End;
        6: Begin // Media por Vendedor
             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T1.PERC_COMISSAO1 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_VENDEDOR T1 ';
             wDescCriterio := 'T1.COD_VENDEDOR = ' + FloatToStr(QAtuComissaoCod_Vendedor.Value);
             wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
             If Trim(wAux) <> '' then
               wPercComissao1 := StrToFloat(wAux)
             Else
               wPercComissao1 := 0;

             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T1.PERC_COMISSAO2 ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_VENDEDOR T1 ';
             wDescCriterio := 'T1.COD_VENDEDOR = ' + FloatToStr(QAtuComissaoCod_Vendedor.Value);
             wAux := DMOracle.BuscaNome(WDescSQL, wDescCriterio);
             If Trim(wAux) <> '' then
               wPercComissao2 := StrToFloat(wAux)
             Else
               wPercComissao2 := 0;

             wDescSQL :=            'SELECT ';
             WDescSQL := wDescSQL +   'T1.VAL_ATACADO ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T1 ';
             wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
             If Trim(wAux) <> '' then
               wPreco1 := StrToFloat(wAux)
             Else
               wPreco1 := 0;
             wDescSQL :=  'SELECT ';
             WDescSQL := wDescSQL +   'T1.VAL_VAREJO ';
             WDescSQL := wDescSQL + 'FROM ';
             WDescSQL := wDescSQL +   'TB_PRODUTO T1 ';
             wDescCriterio := 'T1.COD_PRODUTO = ' + FloatToStr(QAtuComissaoCod_Produto.Value);
             wAux := DMOracle.BuscaNome(WDescSQL,wDescCriterio);
             If Trim(wAux) <> '' then
               wPreco2 := StrToFloat(wAux)
             else
               wPreco2 := 0;
             If wValUnitario <= wPreco1 then
               wComissaoCalculada := FloatToStr(wPercComissao1)
             Else
               If wValUnitario >= wPreco2 Then
                 wComissaoCalculada := FloatToStr(wPercComissao2)
               Else
               Begin // Preco Medio
                 wComissaoCalculada := FloatToStr( wPercComissao1
                                + (wPercComissao2-wPercComissao1)
                                * ( wValUnitario-wPreco1)
                                / (wPreco2-wPreco1)   );
               End;

          End;
        7: Begin // Comissão Informada - Não Calcula Comissão
             wComissaoCalculada := QAtuComissaoPerc_Comissao.Text;
           End;

        8: Begin // Por Prazo de Venda - Só Calcula a Vista
             If QAtuComissaoInd_Condicao_Pagto.Value = '1' Then // A Vista
             Begin
                wAux := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_COMISSAO_PRAZO',
                        'NUM_DIAS = 0');
                wComissaoCalculada := Trim(wAux);
             End
             Else
               wComissaoCalculada := '';
           End;

      End; // Case
    End;
    FOR I:= 1 TO LENGTH(wComissaoCalculada) do
      If wComissaoCalculada[i] = ',' then
         wComissaoCalculada[i] := '.';
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM');
      If Trim(wComissaoCalculada) <> '' Then
        QExecSQL.SQL.Add('SET PERC_COMISSAO = '+wComissaoCalculada)
      Else
        QExecSQL.SQL.Add('SET PERC_COMISSAO = 0');
      QExecSQL.SQL.Add('WHERE COD_NOTA_ITEM = '+QAtuComissaoCod_Nota_Item.Text);
      QExecSQL.ExecSQL;
    End;
    QAtuComissao.Next;
  End;
end;


procedure TDMNotaSaida.QDesdobramento_ClasparAfterInsert(
  DataSet: TDataSet);
begin
  QDesdobramento_ClasparDt_Desdobramento.Value := DMOracle.DataHoraServ;
end;

function TDMNotaSaida.ItemTr: Real;
var
  Res : String;
begin
  if (QItemNFCod_produto.value > 0) and (QNotaSaidaCod_filial.value>0) and (QItemNFCod_lote_tipo.value>0) then
    begin
      Res:=DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO = '+QItemNFCod_produto.text
            +' AND COD_FILIAL = '+QNotaSaidaCod_filial.text+' AND COD_LOTE_TIPO ='+QItemNFCod_lote_tipo.text);
    end;
  if Res<>'' then
    Result:=StrToFloat(res)
  else
    Result:=0;
end;

procedure TDMNotaSaida.QItemNFCOD_LOTE_TIPOValidate(Sender: TField);
begin
  if pTRF2 then
    QItemNFVal_Unitario.Value:=ItemTR;
end;

procedure TDMNotaSaida.QItemNFVAL_UNITARIOValidate(Sender: TField);
begin
  Checar_Preco;
end;

Procedure TDMNotaSaida.DesdobramentoClaspar;
Var wTipo_Produto,wDesdobramento : String;
Begin
  QItemNf.First;
  QDesdobramento_Claspar.Open;
  while not(QItemNf.EOF) do
  Begin
    If QItemNFCod_Lote_Tipo.Value <> 1 Then
    Begin
      wTipo_Produto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
      If wTipo_Produto = 'COM. ARROZ' Then
      Begin
        wDesdobramento := DMOracle.BuscaNome('SELECT COD_DESDOBRAMENTO_CLASPAR FROM TB_DESDOBRAMENTO_CLASPAR','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value));
        If wDesdobramento = '' Then  // quando já existe o desdobramento significa que foi voltado confirmação da nota
        Begin                        //e confirmado novamente não sendo necessario gerar novo desdobramento
          QDesdobramento_Claspar.Insert;
          QDesdobramento_ClasparCod_Nota_Item.Value := QItemNfCod_Nota_Item.Value;
          QDesdobramento_ClasparNum_Desdobramento.Value := QNotaSaidaNum_Nota.Value;
          QDesdobramento_Claspar.Post;
        End;
      End;
    End;
    QItemNf.Next;
  End;
  QDesdobramento_Claspar.Close;
End;

procedure TDMNotaSaida.QItemNFCOD_TRIBUTACAOChange(Sender: TField);
begin
  QItemNFVal_ICM_Base.Value := 0;
end;

Procedure TDMNotaSaida.Conhecimento_Frete(wCod_Nota_Cab,wNum_Conhecimento_Frete,wCod_Filial,
               wCod_Transportador,wCod_Operacao_Cf,wTrib_Frete:Integer; wVal_Pedagio,wVal_Icm_Frete,wVal_Frete_Ton,wVal_Frete:Real;
               wDesc_Placa,wDesc_Transportadora,wCod_Contrato_Vend:String; wDt_Emissao_Cf:TDateTime);
Begin
  With DMConhecimentoFrete do
  Begin
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
  End;
End;

Procedure TDMNotaSaida.TestaCadastro(wCod_Cadastro : Integer);
Var wCgc,wCgc1 : String;
    I : Integer;
Begin
 wCgc := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
 If wCgc <> '' Then
  Begin
   wCgc1 := '';
   For i := 1 to 18 do
      if wCgc[I] in ['0','1','2','3','4','5','6','7','8','9'] then
         wCgc1 := wCgc1 + wCgc[I];
   If wCgc1 <> '' Then
      If (DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO_BLOQUEADO','NUM_CGC_CPF = '+Chr(39)+wCgc1+chr(39))) <> '' Then
         Raise Exception.Create ('Cadastro Bloqueado Por Atraso Pagamento');
  End;
End;

procedure TDMNotaSaida.QNotaSaidaCOD_OPERACAOValidate(Sender: TField);
begin
  If DMNotaSaida.QNotaSaidaCod_Operacao.Text <> '' Then
  Begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk',DMNotaSaida.QNotaSaidaCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    If DMOperacao.QOperacao.Eof Then
       Raise Exception.Create('Operação Não Cadastrada');
    If 'N' = DMOperacao.QOperacaoIND_LIBERADO.Value Then
      Raise Exception.Create('Esta Operação não está liberada para uso!');
    DMNotaSaida.QNotaSaidaCod_Mensagem.Text :=  DMOperacao.QOperacaoCOD_MENSAGEM.Text;
  End;
End;

procedure TDMNotaSaida.QNotaSaidaVAL_FRETE_TONChange(Sender: TField);
Var wPeso : Real;
   wEmbalagem,wUnidade,wTipoProduto : String;
begin
  wPeso := 0;
  QItemNF.First;
  While Not QItemNF.Eof do
  Begin
    wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
    wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
    If wTipoProduto <> 'AGRICOLA' Then
       wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value));
    If wEmbalagem <> '' Then
      wPeso := wPeso + QItemNFQT_Quantidade.Value * StrToFloat(wEmbalagem)
    Else
      wPeso := wPeso + QItemNFQT_Quantidade.Value;
    QItemNF.Next;
  End;
  If wPeso <> 0 Then
     QNotaSaidaVal_Frete.Value := wPeso * QNotaSaidaVal_Frete_Ton.Value;
  If (Trim(wUnidade) <> 'T') And (QNotaSaidaVal_Frete.Value > 0) Then
     QNotaSaidaVal_Frete.Value := QNotaSaidaVal_Frete.Value  / 1000;
end;


Procedure TDMNotaSaida.Checar_preco;
Var wPreco,wDesconto : String;
    wPrecoMinimo : Real;
Begin
  If pTrazPedido = False Then
  Begin
    wPrecoMinimo := 0;
    wPreco := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO',
                                 'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value) );
    wDesconto := DMOracle.BuscaNome('SELECT PERC_DESCONTO_MAXIMO FROM TB_PRODUTO',
                                    'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value) );
    If Trim(wPreco) <> '' then
      wPrecoMinimo := StrToFloat(wPreco);
    If Trim(wDesconto) <> '' Then
      wPrecoMinimo := wPrecoMinimo*(1-StrToFloat(wDesconto)/100 );
    If not(pCC) And not(PTRF2) then
      If (not DmUsuario.Privilegiado) And
         (DMOperacao.QOperacaoInd_Vendas.Value = 'V') Then  // propriedade definida na dmusuario
         If wPrecoMinimo > QItemNFVal_Unitario.Value then
          Begin
            If Fsenha = Nil Then
               FSenha := TFSenha.Create(Application);
            Fsenha.ShowModal;
            If UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) Then
                Raise Exception.Create('Preço unitário abaixo do preço minimo ou Desconto maior que o Desconto Máximo!');
          End;
    QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
  End;
End;
Procedure TDMNotaSaida.MostraMsg(wCadastro:Integer);
Begin
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',wCadastro);
  DMCadastro.QCadastro.Open;
  If DMCadastro.QCadastroDesc_Obs.Value <> '' Then
     MessageDlg(DMCadastro.QCadastroDesc_Obs.Text + Chr(13)  +
                DMCadastro.QCadastroDesc_Obs1.Text + Chr(13) +
                DMCadastro.QCadastroDesc_Obs2.Text, mtInformation,[mbOk], 0);
End;

function TDMNotaSaida.VerificaNotaDigitada(TipoNota: String): Boolean;
  procedure ofereceOpcoes(Nota, Situacao, Tipo, Msg: String);
  begin
    case MessageDlgCustom(Msg,mtConfirmation,
      [mbYes,mbNo,mbCancel],
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
          ofereceOpcoes(Nota, Situacao, Tipo, Msg);
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
  wNota, wSituacao, wTipo, wMsg: String;
  DataS: TOracleDataSet1;
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
      Buscador.Limpa;
      Buscador.Adiciona('DT_EMISSAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      Buscador.Adiciona('IND_SITUACAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      Buscador.Adiciona('IND_ENTRADA_SAIDA', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      Buscador.Adiciona('COD_SERIE', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNota);
      Buscador.Buscar;
      wMsg := 'Cliente já possui nota em aberto.' + #13 + #10 +
        'Código: ' + wNota + '. Data: ' + Buscador.Proximo;
      wSituacao := Buscador.Proximo;
      wMsg := wMsg + '. Situação: ' + IfThen(wSituacao = '1', 'DIGITADA',
        IfThen(wSituacao = '2', 'CONFIRMADA', 'CANCELADA'));
      wTipo := Buscador.Proximo;
      wMsg := wMsg + '. Tipo: ' + IfThen(wTipo = 'E', 'ENTRADA', 'SAÍDA');
      wMsg := wMsg + '. Série: ' + Buscador.Proximo;
      wMsg := wMsg + #13 + #10 + 'Por favor, exclua ou confirme essa nota.';
      wMsg := wMsg + #13 + #10 + 'Se você escolher "Visualizar nota", esta inclusão será cancelada.';
      wMsg := wMsg + #13 + #10 + 'Se você escolher "Continuar mesmo assim", terá de informar ' + #13 + #10 +
        'outro cliente, outra série ou outra filial.';
      ofereceOpcoes(wNota, wSituacao, wTipo, wMsg);
    end;
  end;
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
  wInfAd: string;
  Prod: string;
  Buscador: TBuscador;
begin
  wInfAd := '';
  if DMParamSistema.CodEmpresa = 'TOFECO' then
    Insere(wInfAd, 'Preco em tonelada');
  if not DataSetItem.FieldByName('COD_LOTE_TIPO').IsNull then
    with DMTipoLote do
    begin
      QTipoLote.Close;
      QTipoLote.SetVariable('PK', DataSetItem.FieldByName('COD_LOTE_TIPO').Value);
      QTipoLote.Open;
      if UpperCase(Trim(QTipoLoteIND_IMPRIME_NF.Value)) = 'S' then
      begin
        if QTipoLoteDESC_LOTE.Text <> '' then
          Insere(wInfAd, 'Lote Nr. ' + QTipoLoteDESC_LOTE.Text);
        if QTipoLoteDESC_PUREZA.Text <> '' then
          Insere(wInfAd, 'Pureza ' + QTipoLoteDESC_PUREZA.Text);
        if QTipoLoteDESC_GERMINACAO.Text <> '' then
          Insere(wInfAd, 'Germ. ' + QTipoLoteDESC_GERMINACAO.Text);
        if QTipoLoteDT_VENCIMENTO.Text <> '' then
          Insere(wInfAd, 'Validade ' + QTipoLoteDT_VENCIMENTO.Text);
      end;
    end;
  if not DataSetItem.FieldByName('NUM_NOTA_PRODUTOR').IsNull then
    Insere(wInfAd, 'Nota do Produtor: ' + DataSetItem.FieldByName('NUM_NOTA_PRODUTOR').Text);
  Prod := DataSetItem.FieldByName('COD_PRODUTO').Text;
  if Prod <> '' then
  begin
    Buscador := TBuscador.Create;
    Buscador.Limpa;
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
  Result := UpperCase(wInfAd);
end;



procedure TDMNotaSaida.QNotaSaidaCOD_SERIE_MODELOValidate(Sender: TField);
var
  contingencia: string;
  tipoNota: string;
  isValid: Boolean;
 // msg: String;
begin
  if (not DMNotaSaida.QNotaSaidaCOD_FILIAL.IsNull) and (not DMNotaSaida.QNotaSaidaCOD_OPERACAO.IsNull) then
  begin
    Buscador.Limpa;
    Buscador.Adiciona('IND_CONTINGENCIA', 'TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
    Buscador.Adiciona('IND_EMITE', 'TB_OPERACAO', 'COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
    Buscador.Buscar();
    contingencia := Buscador.Proximo;
    tipoNota := Buscador.Proximo;
    isValid := (tipoNota <> 'F') or (contingencia <> '3') or ((DMNotaSaida.QNotaSaidaCOD_SERIE.Value >= '900')
                                                           and (DMNotaSaida.QNotaSaidaCOD_SERIE.Value <= '999'));
    if not isValid then
      raise Exception.Create('Filial em ambiente Scan, por favor utilize uma série entre 900 e 999');
     // Msg := 'Filial em ambiente Scan, por favor utilize uma série entre 900 e 999';
  end;
end;

end.
