unit UImpressoraFiscal_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, DBTables,
  CustomDialog, StrUtils,Oracle, Provider,Dialogs,Controls;

type
  TDMImpressoraFiscal = class(TDataModule)
    QRTabProd: TOracleDataSet1;
    QRTabProdNUM_CGC: TStringField;
    QRTabProdCOD_PRODUTO: TFloatField;
    QRTabProdDESC_PRODUTO: TStringField;
    QRTabProdDESC_UNIDADE: TStringField;
    QRTabProdIND_ARREDONDAMENTO_TRUNCAMENTO: TStringField;
    QRTabProdIND_PROD_PROPRIA_TERCEIRO: TStringField;
    QRTabProdCOD_TRIB_IMP_FISCAL: TStringField;
    QRTabProdALIQUOTA: TFloatField;
    QRTabProdVAL_VAREJO: TFloatField;
    QRIdentificEmpresa: TOracleDataSet1;
    QRIdentificEmpresaNUM_CGC: TStringField;
    QRIdentificEmpresaDESC_INSCRICAO: TStringField;
    QRIdentificEmpresaDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRIdentificEmpresaDESC_FILIAL: TStringField;
    QRIdentificEmpresaE1: TOracleDataSet1;
    QREstoqueE2: TOracleDataSet1;
    QREstoqueE2NUM_CGC: TStringField;
    QREstoqueE2COD_PRODUTO: TIntegerField;
    QREstoqueE2DESC_PRODUTO: TStringField;
    QREstoqueE2DESC_UNIDADE: TStringField;
    QREstoqueE2MENSURACAO: TStringField;
    QREstoqueE2QT_QUANTIDADE: TFloatField;
    QRIdentificEmpresaE1NUM_CGC: TStringField;
    QRIdentificEmpresaE1DESC_INSCRICAO: TStringField;
    QRIdentificEmpresaE1DESC_INSCRICAO_MUNICIPAL: TStringField;
    QRIdentificEmpresaE1DESC_FILIAL: TStringField;
    QRIdentificEmpresaE1NUM_FABRICACAO_ECF: TStringField;
    QRIdentificEmpresaE1IND_MF_ADICIONAL: TStringField;
    QRIdentificEmpresaE1DESC_TIPO_ECF: TStringField;
    QRIdentificEmpresaE1DESC_MARCA_ECF: TStringField;
    QRIdentificEmpresaE1DESC_MODELO_ECF: TStringField;
    QRIdentificEmpresaE1DT_ESTOQUE: TStringField;
    QRIdentificEmpresaE1HORA_ESTOQUE: TStringField;
    cdsParametrosEstoque: TClientDataSet;
    cdsParametrosEstoquecod_produto: TIntegerField;
    cdsParametrosEstoquedesc_produto: TStringField;
    dsParametrosEstoque: TDataSource;
    QR01: TOracleDataSet1;
    QECF: TOracleDataSet1;
    QECFNUM_SERIE: TStringField;
    QECFDESC_MARCA: TStringField;
    QECFDESC_MODELO: TStringField;
    QECFDESC_TIPO: TStringField;
    QECFNUM_VERSAO_SB: TStringField;
    QECFDT_HORA_INSTALACAO_SB: TDateTimeField;
    QECFNUM_SEQ_ECF: TIntegerField;
    QECFIND_MF_ADICIONAL: TStringField;
    QR01DESC_MARCA: TStringField;
    QR01DESC_MODELO: TStringField;
    QR01DESC_TIPO: TStringField;
    QR01DT_INSTALACAO_SB: TStringField;
    QR01HORA_INSTALACAO_SB: TStringField;
    QR01IND_MF_ADICIONAL: TStringField;
    QR01NUM_SEQ_ECF: TIntegerField;
    QR01NUM_SERIE: TStringField;
    QR01NUM_VERSAO_SB: TStringField;
    QR01NUM_CGC: TStringField;
    QR01DESC_INSCRICAO: TStringField;
    QReg60M: TOracleDataSet1;
    QReg60MCOD_REGISTRO_MESTRE: TIntegerField;
    QReg60MDT_EMISSAO: TDateTimeField;
    QReg60MDESC_SERIE: TStringField;
    QReg60MNUM_SEQUENCIAL: TIntegerField;
    QReg60MDESC_MODELO: TStringField;
    QReg60MNUM_COO_INI: TIntegerField;
    QReg60MNUM_COO_FIN: TIntegerField;
    QReg60MNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QReg60MNUM_REINICIO_OPRERACAO: TIntegerField;
    QReg60MVAL_VENDA_BRUTA: TFloatField;
    QReg60MVAL_TOTAL_GERAL: TFloatField;
    QReg60MDT_HORA_EMISSAO_RZ: TDateTimeField;
    QReg60MNUM_USUARIO: TIntegerField;
    QReg60A: TOracleDataSet1;
    QReg60R: TOracleDataSet1;
    QReg60ACOD_REGISTRO_ANALITICO: TIntegerField;
    QReg60ADT_EMISSAO: TDateTimeField;
    QReg60ADESC_SERIE: TStringField;
    QReg60AIND_SITUACAO_TRIBUTARIA: TStringField;
    QReg60AVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QReg60ACOD_REGISTRO_MESTRE: TIntegerField;
    QReg60RCOD_REGISTRO_RESUMO: TIntegerField;
    QReg60RNUM_MES: TIntegerField;
    QReg60RNUM_ANO: TIntegerField;
    QReg60RCOD_PRODUTO: TStringField;
    QReg60RQT_QUANTIDADE: TFloatField;
    QReg60RVAL_PRODUTO: TFloatField;
    QReg60RVAL_BASE_ICMS: TFloatField;
    QReg60RIND_SITUACAO_TRIBUTARIA: TStringField;
    QReg60RPERC_ALIQUOTA: TFloatField;
    QReg60MNUM_COO_RZ: TIntegerField;
    QReg60MIND_DESCONTO_ISSQN: TStringField;
    QR02: TOracleDataSet1;
    QR02NUM_SERIE: TStringField;
    QR02IND_MF_ADICIONAL: TStringField;
    QR02DESC_MODELO: TStringField;
    QR02NUM_USUARIO: TIntegerField;
    QR02NUM_CONTADOR_REDUCAOZ: TIntegerField;
    QR02NUM_COO_RZ: TIntegerField;
    QR02NUM_REINICIO_OPRERACAO: TIntegerField;
    QR02DT_MOVIMENTO: TStringField;
    QR02DT_EMISSAO: TStringField;
    QR02HORA_EMISSAO: TStringField;
    QR02VAL_VENDA_BRUTA: TFloatField;
    QR02IND_DESCONTO_ISSQN: TStringField;
    QR03: TOracleDataSet1;
    QCupomFiscalCab: TOracleDataSet1;
    QCupomFiscalCabCOD_NOTA_CAB: TIntegerField;
    QCupomFiscalCabCOD_USUARIO: TIntegerField;
    QCupomFiscalCabCOD_FILIAL: TIntegerField;
    QCupomFiscalCabCOD_OPERACAO: TIntegerField;
    QCupomFiscalCabCOD_ESTADO: TStringField;
    QCupomFiscalCabCOD_VENDEDOR: TIntegerField;
    QCupomFiscalCabCOD_CADASTRO: TIntegerField;
    QCupomFiscalCabCOD_SERIE: TStringField;
    QCupomFiscalCabIND_SITUACAO: TStringField;
    QCupomFiscalCabIND_CONDICAO_PAGTO: TStringField;
    QCupomFiscalCabDT_EMISSAO: TDateTimeField;
    QCupomFiscalCabDT_MOVIMENTO: TDateTimeField;
    QCupomFiscalCabVAL_DESPESAS: TFloatField;
    QCupomFiscalCabIND_ENTRADA_SAIDA: TStringField;
    QCupomFiscalCabVAL_FRETE: TFloatField;
    QCupomFiscalCabVAL_DESCONTO: TFloatField;
    QCupomFiscalCabOBS_COMPLEMENTO: TStringField;
    QCupomFiscalCabDT_USUARIO: TDateTimeField;
    QCupomFiscalCabVAL_ICM_FRETE: TFloatField;
    QCupomFiscalCabVAL_ICM_BASE_FRETE: TFloatField;
    QCupomFiscalCabVAL_FUNRURAL: TFloatField;
    QCupomFiscalCabDESC_PLACA: TStringField;
    QCupomFiscalCabNUM_KM: TIntegerField;
    QCupomFiscalCabCOD_SERIE_MODELO: TStringField;
    QCupomFiscalItem: TOracleDataSet1;
    QCupomFiscalItemCOD_NOTA_ITEM: TIntegerField;
    QCupomFiscalItemCOD_NOTA_CAB: TIntegerField;
    QCupomFiscalItemCOD_TRIBUTACAO: TIntegerField;
    QCupomFiscalItemQT_QUANTIDADE: TFloatField;
    QCupomFiscalItemVAL_TOTAL: TFloatField;
    QCupomFiscalItemPERC_IPI: TFloatField;
    QCupomFiscalItemPERC_COMISSAO: TFloatField;
    QCupomFiscalItemCOD_PRODUTO: TFloatField;
    QCupomFiscalItemCOD_LOTE_TIPO: TIntegerField;
    QCupomFiscalItemVAL_DESCONTO: TFloatField;
    QCupomFiscalItemVAL_DESPESAS: TFloatField;
    QCupomFiscalItemVAL_FRETE: TFloatField;
    QCupomFiscalItemPERC_DESCONTO: TFloatField;
    QCupomFiscalItemVAL_IPI: TFloatField;
    QCupomFiscalItemVAL_UNITARIO: TFloatField;
    QCupomFiscalItemVAL_ICM_BASE: TFloatField;
    QCupomFiscalItemVAL_ICM: TFloatField;
    QCupomFiscalItemIND_CLASS_IPI: TStringField;
    QCupomFiscalItemVAL_CUSTO: TFloatField;
    QCupomFiscalItemVAL_ISS: TFloatField;
    QCupomFiscalItemdesc_unidade: TStringField;
    QCupomFiscalItemdesc_produto: TStringField;
    QCupomFiscalCabdesc_situacao: TStringField;
    QCupomFiscalItemNUM_ITEM_CF: TIntegerField;
    QCupomFiscalItemIND_CANC_ITEM_CF: TStringField;
    QCupomFiscalItemval_desconto_total_item: TFloatField;
    QCupomFiscalCabDT_RECEBIMENTO: TDateTimeField;
    QPagamento: TOracleDataSet1;
    QPagamentoCOD_PAGAMENTO: TIntegerField;
    QPagamentoCOD_NOTA_CAB: TIntegerField;
    QPagamentoDESC_PAGAMENTO: TStringField;
    QPagamentoVAL_PAGAMENTO: TFloatField;
    QCupomFiscalItemVAL_DESCONTO_RATEIO: TFloatField;
    QSomaCupom: TOracleDataSet1;
    DSSomaCupom: TDataSource;
    QSomaCupomVAL_TOTAL: TFloatField;
    QSomaCupomVAL_PAGO: TFloatField;
    QContaReceberMov: TOracleDataSet1;
    QContaReceber: TOracleDataSet1;
    QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCOD_FINALIDADE: TIntegerField;
    QContaReceberCOD_BANCO_AGENCIA: TIntegerField;
    QContaReceberCOD_FILIAL: TIntegerField;
    QContaReceberNUM_TITULO: TFloatField;
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
    QContaReceberIND_ENVIADO_BANCO: TStringField;
    QContaReceberCOD_CONTA_CORRENTE: TIntegerField;
    QContaReceberCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QContaReceberCOD_OBRA_CONTRATO: TIntegerField;
    QContaReceberIND_EMITIDO_CARNE: TStringField;
    QContaReceberCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QContaReceberNUM_OS: TIntegerField;
    QContaReceberCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QContaReceberDESC_OBS: TStringField;
    QContaReceberCOD_VENDEDOR1: TIntegerField;
    QContaReceberPERC_COMISSAO1: TFloatField;
    QContaReceberCOD_OFICINA_CAB: TIntegerField;
    QContaReceberCOD_BORDERO: TIntegerField;
    QContaReceberCOD_OBRA: TIntegerField;
    QContaReceberCOD_CONTRATO_LOCADOR: TIntegerField;
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
    QContaReceberMovCOD_NOTA_CAB: TIntegerField;
    QContaReceberMovIND_DEVOLUCAO: TStringField;
    QContaReceberMovIND_FORMA_PAGAMENTO: TStringField;
    QContaReceberMovIND_TROCA: TStringField;
    QContaReceberMovCOD_ADIANTAMENTO: TIntegerField;
    QCupomFiscalCabIND_CUPOM_TOTALIZADO: TStringField;
    QCupomFiscalItemdesc_cancelado: TStringField;
    QCupomFiscalCabNUM_SERIE_ECF: TStringField;
    QCupomFiscalCabNUM_COO: TIntegerField;
    QRUltimaRZ: TOracleDataSet1;
    QRUltimaRZDT_EMISSAO: TDateTimeField;
    QRUltimaRZNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QRUltimaRZNUM_REINICIO_OPRERACAO: TIntegerField;
    QRUltimaRZVAL_VENDA_BRUTA: TFloatField;
    QCupomFiscalItemval_total_com_desconto: TFloatField;
    QR04: TOracleDataSet1;
    QR04IND_MF_ADICIONAL: TStringField;
    QR04DESC_MODELO: TStringField;
    QR04NUM_USUARIO: TIntegerField;
    QR04NUM_NOTA: TIntegerField;
    QR04NUM_COO: TIntegerField;
    QR04DESCONTO_SUBTOTAL: TFloatField;
    QR04TP_DESCONTO: TStringField;
    QR04TP_ACRESCIMO: TStringField;
    QR04ACRESCIMO_SUBTOTAL: TFloatField;
    QR04CANCELAMENTO_ACRESCIMO: TFloatField;
    QR04SUBTOTAL: TFloatField;
    QR04TOTAL_LIQ: TFloatField;
    QR04IND_CANCELADO: TStringField;
    QR04ORDEM_DESCONTO_ACRESCIMO: TStringField;
    QR04NOME: TStringField;
    QR04NUM_CGC_CPF: TStringField;
    QR04NUM_SERIE: TStringField;
    QR04IND_CUPOM_TOTALIZADO: TStringField;
    QR05: TOracleDataSet1;
    QR05IND_MF_ADICIONAL: TStringField;
    QR05DESC_MODELO: TStringField;
    QR05NUM_USUARIO: TIntegerField;
    QR05NUM_SERIE: TStringField;
    QR05NUM_NOTA: TIntegerField;
    QR05NUM_COO: TIntegerField;
    QR05NUM_ITEM_CF: TIntegerField;
    QR05COD_PRODUTO: TFloatField;
    QR05DESC_PRODUTO: TStringField;
    QR05QT_QUANTIDADE: TFloatField;
    QR05DESC_UNIDADE: TStringField;
    QR05VAL_UNITARIO: TFloatField;
    QR05VAL_DESCONTO: TFloatField;
    QR05ACRESCIMO: TFloatField;
    QR05TOTAL_LIQ: TFloatField;
    QR05TOTALIZADOR_PARCIAL: TStringField;
    QR05QT_CANCELADO: TFloatField;
    QR05VAL_CANCELADO: TFloatField;
    QR05CANCELAMENTO_ACRESCIMO: TFloatField;
    QR05IND_ARREDONDAMENTO_TRUNCAMENTO: TStringField;
    QR05IND_PROD_PROPRIA_TERCEIRO: TStringField;
    QR05IND_CASAS_DEC_QT: TFloatField;
    QR05IND_CASAS_DEC_UNIT: TFloatField;
    QR05SUBTOTAL: TFloatField;
    QR05DESCONTO_SUBTOTAL: TFloatField;
    QR05DT_INICIO: TStringField;
    QR05TP_DESCONTO: TStringField;
    QR05TP_ACRESCIMO: TStringField;
    QR05ACRESCIMO_SUBTOTAL: TFloatField;
    QR05CANCELAMENTO_ACRESCIMO_1: TFloatField;
    QR06: TOracleDataSet1;
    QR06NUM_SERIE: TStringField;
    QR06IND_MF_ADICIONAL: TStringField;
    QR06DESC_MODELO: TStringField;
    QR06NUM_USUARIO: TIntegerField;
    QR06NUM_COO: TIntegerField;
    QR06NUM_GNF: TIntegerField;
    QR06NUM_CDC: TIntegerField;
    QR06DESC_DENOMINACAO: TStringField;
    QR06HR_FINAL_EMISSAO: TStringField;
    QR07: TOracleDataSet1;
    QR04DT_INICIO: TStringField;
    QECFCons: TOracleDataSet1;
    DSECFCons: TDataSource;
    QECFConsNUM_SERIE: TStringField;
    QECFConsDESC_MARCA: TStringField;
    QECFConsDESC_MODELO: TStringField;
    QECFConsDESC_TIPO: TStringField;
    QECFConsNUM_VERSAO_SB: TStringField;
    QECFConsDT_HORA_INSTALACAO_SB: TDateTimeField;
    QECFConsNUM_SEQ_ECF: TIntegerField;
    QECFConsIND_MF_ADICIONAL: TStringField;
    QECFConsNUM_USUARIO: TIntegerField;
    QR06DT_FINAL_EMISSAO: TStringField;
    QECFCOD_FILIAL: TIntegerField;
    QRMeiosPagto: TOracleDataSet1;
    QRMeiosPagtoDT_RECEBIMENTO: TDateTimeField;
    QRMeiosPagtoDESC_PAGAMENTO: TStringField;
    QPagamentoVAL_VALOR: TFloatField;
    QRMeiosPagtoVAL_TOTAL: TFloatField;
    QReducaoRepositorio: TOracleDataSet1;
    QCupomFiscalItemdesc_sit_tributaria: TStringField;
    QCupomFiscalItemdesc_cod_barra: TStringField;
    QCupomFiscalRel: TOracleDataSet1;
    QCupomFiscalRelCOD_NOTA_CAB: TIntegerField;
    QCupomFiscalRelNUM_NOTA: TIntegerField;
    QCupomFiscalRelDT_EMISSAO: TDateTimeField;
    QCupomFiscalRelNUM_SERIE_ECF: TStringField;
    QCupomFiscalRelOBS: TStringField;
    QCupomFiscalRelVAL_DESCONTO_CUPOM: TFloatField;
    QCupomFiscalRelVAL_DESPESAS_CUPOM: TFloatField;
    QCupomFiscalRelNUM_ITEM_CF: TIntegerField;
    QCupomFiscalRelQT_QUANTIDADE: TFloatField;
    QCupomFiscalRelDESC_UNIDADE: TStringField;
    QCupomFiscalRelDESC_COD_BARRA: TStringField;
    QCupomFiscalRelCOD_PRODUTO: TFloatField;
    QCupomFiscalRelDESC_PRODUTO: TStringField;
    QCupomFiscalRelCOD_TRIB_IMP_FISCAL: TStringField;
    QCupomFiscalRelVAL_UNITARIO: TFloatField;
    QCupomFiscalRelVAL_SUBTOTAL: TFloatField;
    QCupomFiscalRelVAL_DESCONTO_ITEM: TFloatField;
    QCupomFiscalRelVAL_DESPESAS_ITEM: TFloatField;
    QCupomFiscalRelCOD_CADASTRO: TIntegerField;
    QCupomFiscalRelNOME: TStringField;
    QRIdentificEmpresaE1COD_FILIAL: TIntegerField;
    QRIdentificEmpresaE1DESC_HASH_MD5: TStringField;
    QREstoqueE2DESC_HASH_MD5: TStringField;
    QRTabProdDESC_HASH_MD5: TStringField;
    QRTabProdCOD_TRIBUTACAO: TIntegerField;
    QRTabProdDESC_HASH_MD5_TRIB: TStringField;
    QRTabProdCOD_TRIB_IMP_FISCAL_1: TStringField;
    QRTabProdDESC_SITUACAO_TRIB: TStringField;
    QRTabProdDESC_CSOSN: TStringField;
    QRTabProdPERC_ALIQUOTA: TFloatField;
    QECFDESC_HASH_MD5: TStringField;
    QR01DESC_HASH_MD5: TStringField;
    QR01DESC_HASH_MD5_FILIAL: TStringField;
    QReg60MDESC_HASH_MD5: TStringField;
    QR02DESC_HASH_MD5: TStringField;
    QR02DT_HORA_EMISSAO_RZ: TDateTimeField;
    QR02NUM_COO_INI: TIntegerField;
    QR02NUM_COO_FIN: TIntegerField;
    QR02DT_EMISSAO_SEM_MASCARA: TDateTimeField;
    QReg60ADESC_HASH_MD5: TStringField;
    QCupomFiscalCabDESC_HASH_MD5: TStringField;
    QR04DESC_HASH_MD5: TStringField;
    QR04IND_SITUACAO: TStringField;
    QCupomFiscalItemDESC_HASH_MD5: TStringField;
    QR05DESCONTO_UNITARIO: TFloatField;
    QR05COD_TRIB_IMP_FISCAL: TStringField;
    QR05DESC_HASH_MD5: TStringField;
    QR05IND_SITUACAO: TStringField;
    QR06DT_HR_FINAL_EMISSAO: TDateTimeField;
    QR06DESC_HASH_MD5: TStringField;
    QRU1: TOracleDataSet1;
    QRE3: TOracleDataSet1;
    QRE3NUM_SERIE: TStringField;
    QRE3IND_MF_ADICIONAL: TStringField;
    QRE3DESC_TIPO: TStringField;
    QRE3DESC_MARCA: TStringField;
    QRE3DESC_MODELO: TStringField;
    QRE3DT_ESTOQUE: TStringField;
    QRE3HORA_ESTOQUE: TStringField;
    QRU1TIPO: TStringField;
    QRU1NUM_CGC: TStringField;
    QRU1DESC_INSCRICAO: TStringField;
    QRU1DESC_INSCRICAO_MUNICIPAL: TStringField;
    QRU1DESC_FILIAL: TStringField;
    QChecaMD5ECF: TOracleDataSet1;
    QChecaMD5ECFNUM_SERIE: TStringField;
    QChecaMD5Filial: TOracleDataSet1;
    QChecaMD5FilialCOD_FILIAL: TIntegerField;
    QChecaMD5NotaCab: TOracleDataSet1;
    QChecaMD5NotaItem: TOracleDataSet1;
    QChecaMD5DemaisDoc: TOracleDataSet1;
    QChecaMD5NotaItemCOD_NOTA_ITEM: TIntegerField;
    QChecaMD5DemaisDocCOD_DEMAIS_DOCUMENTOS_ECF: TIntegerField;
    QChecaMD5Reg60M: TOracleDataSet1;
    QChecaMD5Reg60A: TOracleDataSet1;
    QChecaMD5Reg60MCOD_REGISTRO_MESTRE: TIntegerField;
    QChecaMD5Reg60ACOD_REGISTRO_ANALITICO: TIntegerField;
    QR02COD_REGISTRO_MESTRE: TIntegerField;
    QR04COD_NOTA_CAB: TIntegerField;
    QR05COD_NOTA_ITEM: TIntegerField;
    QR06COD_DEMAIS_DOCUMENTOS_ECF: TIntegerField;
    QChecaMD5Pagamento: TOracleDataSet1;
    QChecaMD5PagamentoCOD_PAGAMENTO: TIntegerField;
    QR05COD_NOTA_CAB: TIntegerField;
    QR05NUM_SERIE_1: TStringField;
    QR05COD_TRIBUTACAO: TIntegerField;
    QChecaMD5Produto: TOracleDataSet1;
    QChecaMD5ProdutoCOD_PRODUTO: TFloatField;
    QChecaMD5Tributacao: TOracleDataSet1;
    QChecaMD5TributacaoCOD_TRIBUTACAO: TIntegerField;
    QREstoqueE2COD_ESTOQUE_DIARIO_ITEM: TIntegerField;
    QREstoqueE2COD_ESTOQUE_DIARIO_CAB: TIntegerField;
    QREstoqueE2COD_TRIBUTACAO: TIntegerField;
    QChecaMD5EstoqueDiarioCab: TOracleDataSet1;
    QChecaMD5EstoqueDiarioItem: TOracleDataSet1;
    QChecaMD5EstoqueDiarioCabCOD_ESTOQUE_DIARIO_CAB: TIntegerField;
    QChecaMD5EstoqueDiarioItemCOD_ESTOQUE_DIARIO_ITEM: TIntegerField;
    QBuscaEstoqueDiarioItem: TOracleDataSet1;
    QBuscaEstoqueDiarioItemCOD_ESTOQUE_DIARIO_ITEM: TIntegerField;
    QREstoqueE2COD_FILIAL: TIntegerField;
    QBuscaPagamentos: TOracleDataSet1;
    QBuscaPagamentosCOD_PAGAMENTO: TIntegerField;
    QCupomFiscalCabNUM_NOTA: TFloatField;
    QChecaMD5NotaCabCOD_NOTA_CAB: TIntegerField;
    QBuscaPagamentosDESC_PAGAMENTO: TStringField;
    QSomaCupomVAL_TOTAL_TRIB: TFloatField;
    QR06NUM_GRG: TFloatField;
    QRMeiosPagtoCOD_SERIE_MODELO: TStringField;
    QRE3COD_ESTOQUE_DIARIO_CAB: TIntegerField;
    QNotaItemIteracao: TOracleDataSet1;
    QNotaItemIteracaoCOD_NOTA_ITEM: TIntegerField;
    QNotaItemIteracaoCOD_PRODUTO: TFloatField;
    QNotaItemIteracaoCOD_TRIBUTACAO: TIntegerField;
    QDemaisDocIteracao: TOracleDataSet1;
    QDemaisDocIteracaoCOD_DEMAIS_DOCUMENTOS_ECF: TIntegerField;
    QDemaisDocIteracaoCOD_NOTA_CAB: TIntegerField;
    QRTabProdDESC_COD_BARRA: TStringField;
    QNotaManualCab: TOracleDataSet1;
    QNotaManualItem: TOracleDataSet1;
    QNotaManualCabCOD_NOTA_CAB: TIntegerField;
    QNotaManualCabCOD_USUARIO: TIntegerField;
    QNotaManualCabCOD_FILIAL: TIntegerField;
    QNotaManualCabCOD_OPERACAO: TIntegerField;
    QNotaManualCabCOD_ESTADO: TStringField;
    QNotaManualCabCOD_VENDEDOR: TIntegerField;
    QNotaManualCabCOD_CADASTRO: TIntegerField;
    QNotaManualCabNUM_NOTA: TFloatField;
    QNotaManualCabCOD_SERIE: TStringField;
    QNotaManualCabIND_SITUACAO: TStringField;
    QNotaManualCabIND_CONDICAO_PAGTO: TStringField;
    QNotaManualCabDT_EMISSAO: TDateTimeField;
    QNotaManualCabDT_MOVIMENTO: TDateTimeField;
    QNotaManualCabDT_RECEBIMENTO: TDateTimeField;
    QNotaManualCabVAL_DESPESAS: TFloatField;
    QNotaManualCabIND_ENTRADA_SAIDA: TStringField;
    QNotaManualCabVAL_FRETE: TFloatField;
    QNotaManualCabVAL_DESCONTO: TFloatField;
    QNotaManualCabOBS_COMPLEMENTO: TStringField;
    QNotaManualCabDT_USUARIO: TDateTimeField;
    QNotaManualCabVAL_ICM_FRETE: TFloatField;
    QNotaManualCabVAL_ICM_BASE_FRETE: TFloatField;
    QNotaManualCabVAL_FUNRURAL: TFloatField;
    QNotaManualCabDESC_PLACA: TStringField;
    QNotaManualCabNUM_KM: TIntegerField;
    QNotaManualCabCOD_SERIE_MODELO: TStringField;
    QNotaManualCabIND_CUPOM_TOTALIZADO: TStringField;
    QNotaManualCabNUM_SERIE_ECF: TStringField;
    QNotaManualCabNUM_COO: TIntegerField;
    QNotaManualCabDESC_HASH_MD5: TStringField;
    QNotaManualItemCOD_NOTA_ITEM: TIntegerField;
    QNotaManualItemCOD_NOTA_CAB: TIntegerField;
    QNotaManualItemCOD_TRIBUTACAO: TIntegerField;
    QNotaManualItemQT_QUANTIDADE: TFloatField;
    QNotaManualItemVAL_TOTAL: TFloatField;
    QNotaManualItemPERC_IPI: TFloatField;
    QNotaManualItemPERC_COMISSAO: TFloatField;
    QNotaManualItemCOD_PRODUTO: TFloatField;
    QNotaManualItemCOD_LOTE_TIPO: TIntegerField;
    QNotaManualItemVAL_DESCONTO: TFloatField;
    QNotaManualItemVAL_DESPESAS: TFloatField;
    QNotaManualItemVAL_FRETE: TFloatField;
    QNotaManualItemPERC_DESCONTO: TFloatField;
    QNotaManualItemVAL_IPI: TFloatField;
    QNotaManualItemVAL_UNITARIO: TFloatField;
    QNotaManualItemVAL_ICM_BASE: TFloatField;
    QNotaManualItemVAL_ICM: TFloatField;
    QNotaManualItemIND_CLASS_IPI: TStringField;
    QNotaManualItemVAL_CUSTO: TFloatField;
    QNotaManualItemVAL_ISS: TFloatField;
    QNotaManualItemNUM_ITEM_CF: TIntegerField;
    QNotaManualItemIND_CANC_ITEM_CF: TStringField;
    QNotaManualItemVAL_DESCONTO_RATEIO: TFloatField;
    QNotaManualItemDESC_HASH_MD5: TStringField;
    QR03Nova: TOracleDataSet1;
    QR03NovaNUM_SERIE: TStringField;
    QR03NovaDT_REDUCAO: TDateTimeField;
    QR03NovaDESC_DADOS_REDUCAO: TMemoField;
    QR03NovaDESC_MODELO: TStringField;
    QR03NovaNUM_USUARIO: TIntegerField;
    QR03NovaIND_MF_ADICIONAL: TStringField;
    QR05IND_CANC_ITEM_CF: TStringField;
    QR03NovaNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QPagamentoCOD_PAGAMENTO_ESTORNADO: TIntegerField;
    QPagamentoIND_ESTORNO: TStringField;
    QChecaMD5RepositorioReducao: TOracleDataSet1;
    QR03NovaCOD_REGISTRO_MESTRE: TIntegerField;
    QR03NUM_SERIE: TStringField;
    QR03IND_MF_ADICIONAL: TStringField;
    QR03DESC_MODELO: TStringField;
    QR03NUM_USUARIO: TIntegerField;
    QR03NUM_CONTADOR_REDUCAOZ: TIntegerField;
    QR03COD_REGISTRO_MESTRE: TIntegerField;
    QR03DT_EMISSAO: TDateTimeField;
    QR03IND_SITUACAO_TRIBUTARIA: TStringField;
    QR03VLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QR03COD_REGISTRO_ANALITICO: TFloatField;
    QR03DESC_HASH_MD5: TStringField;
    QR03MD5Helper: TOracleDataSet1;
    QR03MD5HelperCOD_REGISTRO_ANALITICO: TIntegerField;
    QDemaisDocMD5Helper: TOracleDataSet1;
    QDemaisDocMD5HelperCOD_DEMAIS_DOCUMENTOS_ECF: TIntegerField;
    QFilialIteracao: TOracleDataSet1;
    QFilialIteracaoCOD_FILIAL: TIntegerField;
    QR03MD5HelperVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QR07NUM_SERIE: TStringField;
    QR07IND_MF_ADICIONAL: TStringField;
    QR07DESC_MODELO: TStringField;
    QR07NUM_USUARIO: TIntegerField;
    QR07COD_NOTA_CAB: TIntegerField;
    QR07NUM_COO: TIntegerField;
    QR07CCF: TIntegerField;
    QR07DESCONTO_SUBTOTAL: TFloatField;
    QR07ACRESCIMO_SUBTOTAL: TFloatField;
    QR07IND_SITUACAO: TStringField;
    QR07DESC_HASH_MD5: TStringField;
    QR07NUM_GNF: TFloatField;
    QR07COD_PAGAMENTO: TFloatField;
    QR07DESC_PAGAMENTO: TStringField;
    QR07VAL_PAGAMENTO: TFloatField;
    QR07IND_ESTORNO: TStringField;
    QR07VAL_ESTORNO: TFloatField;
    QR05DESC_COD_BARRA: TStringField;
    QReg60D: TOracleDataSet1;
    QReg60DCOD_REGISTRO_DIARIO: TIntegerField;
    QReg60DDESC_SUBTIPO: TStringField;
    QReg60DDT_EMISSAO: TDateTimeField;
    QReg60DNUM_SERIE: TStringField;
    QReg60DDESC_COD_BARRA: TStringField;
    QReg60DQT_QUANTIDADE: TFloatField;
    QReg60DVAL_TOTAL: TFloatField;
    QReg60DVAL_BASE_ICMS: TFloatField;
    QReg60DDESC_ST: TStringField;
    QReg60DVAL_ICMS: TFloatField;
    QReg60DCons: TOracleDataSet1;
    QReg60DConsDT_EMISSAO: TDateTimeField;
    QReg60DConsNUM_SERIE: TStringField;
    QReg60DConsDESC_COD_BARRA: TStringField;
    QReg60DConsQT_QUANTIDADE: TFloatField;
    QReg60DConsDESC_ST: TStringField;
    QReg60DConsVAL_BASE_ICMS: TFloatField;
    QReg60DConsVAL_ICMS: TFloatField;
    QReg60DConsVAL_TOTAL: TFloatField;
    QReg60DConsCOD_REGISTRO_DIARIO: TIntegerField;
    procedure QCupomFiscalCabAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QCupomFiscalItemAfterInsert(DataSet: TDataSet);
    procedure QCupomFiscalItemCalcFields(DataSet: TDataSet);
    procedure QCupomFiscalItemBeforePost(DataSet: TDataSet);
    procedure QCupomFiscalCabCalcFields(DataSet: TDataSet);
    procedure QPagamentoAfterInsert(DataSet: TDataSet);
    procedure QCupomFiscalCabAfterOpen(DataSet: TDataSet);
    function VerificaNotaDigitada: Boolean;
    procedure QCupomFiscalCabPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QCupomFiscalItemAfterPost(DataSet: TDataSet);
    procedure QPagamentoAfterPost(DataSet: TDataSet);
    procedure QNotaManualItemAfterPost(DataSet: TDataSet);
    procedure QReg60MBeforePost(DataSet: TDataSet);
    procedure QReg60ABeforePost(DataSet: TDataSet);
    procedure QReg60AAfterPost(DataSet: TDataSet);
    procedure QReg60MAfterPost(DataSet: TDataSet);
    procedure QPagamentoBeforePost(DataSet: TDataSet);
    procedure QCupomFiscalCabBeforePost(DataSet: TDataSet);
    procedure QCupomFiscalCabAfterPost(DataSet: TDataSet);
    procedure QECFBeforeDelete(DataSet: TDataSet);
    procedure QECFAfterDelete(DataSet: TDataSet);
    procedure QECFAfterPost(DataSet: TDataSet);
    procedure QPagamentoBeforeDelete(DataSet: TDataSet);
    procedure QPagamentoAfterDelete(DataSet: TDataSet);
    procedure QReg60MBeforeDelete(DataSet: TDataSet);
    procedure QReg60MAfterDelete(DataSet: TDataSet);
    procedure QReg60ABeforeDelete(DataSet: TDataSet);
    procedure QReg60AAfterDelete(DataSet: TDataSet);
    procedure QCupomFiscalCabBeforeDelete(DataSet: TDataSet);
    procedure QCupomFiscalCabAfterDelete(DataSet: TDataSet);
    procedure QCupomFiscalItemBeforeDelete(DataSet: TDataSet);
    procedure QCupomFiscalItemAfterDelete(DataSet: TDataSet);
    procedure QNotaManualCabBeforeDelete(DataSet: TDataSet);
    procedure QNotaManualCabAfterPost(DataSet: TDataSet);
    procedure QNotaManualCabAfterDelete(DataSet: TDataSet);
    procedure QNotaManualItemBeforeDelete(DataSet: TDataSet);
    procedure QNotaManualItemAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure AtualizaEstoque(wTipoAtualizacao: Integer);
    procedure GeraContaReceber(wListaParcela: TStrings; wFinalidade, wDepartamento, wContaCorrente: Integer);
    function ContasAReceberBaixados: Boolean;
    procedure VoltaEstoqueEPagamentos;
    procedure AtuCaixa(wVal_Movimento: Real; wOperacao, wFilial,
      wNumNota, wCadastro, wNotaCab, wTipo: string; wDataMov: TDateTime);
    function getDataHoraImpressora(var pData,
      pHora: String): Boolean;
  end;

var
  DMImpressoraFiscal: TDMImpressoraFiscal;
    wCodPafInclusaoExclusao: String = '';
  function Bematech_FI_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';

implementation

uses UUsuario_cl, UOracle_cl, UEstoque_cl, UBiblioteca, UFinalidade_cl,
  UNotaSaida_cl, Math, UMensagem_cl, UOperacao_cl;

{$R *.dfm}

function TDMImpressoraFiscal.getDataHoraImpressora(var pData,
  pHora: String): Boolean;
  var  iRetorno: Integer;
begin
  SetLength(pData, 7);
  SetLength(pHora, 7);
  iRetorno := Bematech_FI_DataHoraImpressora(pData, pHora);
  pData := trim(pData);
  pHora := trim(pHora);
  pData := copy(pData,1,2)+'/'+copy(pData,3,2)+'/20'+copy(pData,5,2);
  pHora := copy(pHora,1,2)+':'+copy(pHora,3,2)+':'+copy(pHora,5,2);
  if iRetorno = 1 then
    result := true
  else
    result := false;
end;


procedure TDMImpressoraFiscal.QCupomFiscalCabAfterInsert(
  DataSet: TDataSet);
begin
  QCupomFiscalCabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QCupomFiscalCabCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
  QCupomFiscalCabCOD_VENDEDOR.Value := DMUsuario.CodVendedorPadrao;
  QCupomFiscalCabIND_SITUACAO.Value := '1';
  QCupomFiscalCabIND_CONDICAO_PAGTO.Value := '1';
  QCupomFiscalCabVAL_DESPESAS.Value := 0.00;
  QCupomFiscalCabIND_ENTRADA_SAIDA.Value := 'S';
  QCupomFiscalCabVAL_FRETE.Value := 0.00;
  QCupomFiscalCabVAL_DESCONTO.Value := 0.00;
  QCupomFiscalCabDT_USUARIO.Value := DMOracle.DataHoraServ;
  QCupomFiscalCabDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
  QCupomFiscalCabVAL_ICM_FRETE.Value := 0.00;
  QCupomFiscalCabVAL_ICM_BASE_FRETE.Value := 0.00;
  QCupomFiscalCabVAL_FUNRURAL.Value := 0.00;
  QCupomFiscalCabCOD_SERIE.Value := DMUsuario.CodSeriePadrao;
  QCupomFiscalCabCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;
  QCupomFiscalCabCOD_OPERACAO.Value := DMUsuario.CodOperacaoPadrao;
  QCupomFiscalCabNUM_NOTA.Value := 0;
  QCupomFiscalCabIND_CUPOM_TOTALIZADO.Value := 'N';
  //Pega mensagem cadastrada na operação para mensagem promocional
  with DMMensagem,DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',QCupomFiscalCabCOD_OPERACAO.Value);
    QOperacao.Open;
    if QOperacao.RecordCount > 0 then
    begin
      QMensagem.Close;
      QMensagem.SetVariable('PK',QOperacaoCOD_MENSAGEM.Value);
      QMensagem.Open;
      if QMensagem.RecordCount > 0 then
      begin
        QCupomFiscalCabOBS_COMPLEMENTO.Value :=
          QMensagemDESC_MENSAGEM.Value + ' ' +
          QMensagemDESC_COMPLEMENTO.Value + ' ' +
          QMensagemDESC_COMPLEMENTO1.Value + ' ' +
          QMensagemDESC_COMPLEMENTO2.Value + ' ' +
          QMensagemDESC_COMPLEMENTO3.Value + ' ' +
          QMensagemDESC_COMPLEMENTO4.Value + ' ' +
          QMensagemDESC_COMPLEMENTO5.Value + ' ' +
          QMensagemDESC_COMPLEMENTO6.Value + ' ' +
          QMensagemDESC_COMPLEMENTO7.Value;
      end;
    end;
  end;
end;

procedure TDMImpressoraFiscal.DataModuleCreate(Sender: TObject);
begin
  QCupomFiscalCab.Open;
  QCupomFiscalItem.Open;
  QPagamento.Open;
end;

procedure TDMImpressoraFiscal.QCupomFiscalItemAfterInsert(
  DataSet: TDataSet);
begin
  QCupomFiscalItemCOD_NOTA_CAB.Value := QCupomFiscalCabCOD_NOTA_CAB.Value;
  QCupomFiscalItemPERC_IPI.Value := 0.00;
  QCupomFiscalItemPERC_COMISSAO.Value := 0.00;
  QCupomFiscalItemVAL_DESCONTO.Value := 0.00;
  QCupomFiscalItemVAL_DESPESAS.Value := 0.00;
  QCupomFiscalItemVAL_FRETE.Value := 0.00;
  QCupomFiscalItemPERC_DESCONTO.Value := 0.00;
  QCupomFiscalItemVAL_IPI.Value := 0.00;
  QCupomFiscalItemVAL_ICM_BASE.Value := 0.00;
  QCupomFiscalItemVAL_ICM.Value := 0.00;
  QCupomFiscalItemIND_CLASS_IPI.Value := '0';
  QCupomFiscalItemVAL_CUSTO.Value := 0.00;
  QCupomFiscalItemVAL_ISS.Value := 0.00;
  QCupomFiscalItemCOD_LOTE_TIPO.Value := 1;
  QCupomFiscalItemIND_CANC_ITEM_CF.Value := 'N';
end;

procedure TDMImpressoraFiscal.QCupomFiscalItemCalcFields(
  DataSet: TDataSet);
var
  wAuxValDesconto: Integer;
  wAuxValDesconto2, wAuxValDesconto3: Real;
  wCodTributacao: String;
  wAliquota: String;
begin

  wCodTributacao := '';
  wAliquota := '';

  if not QCupomFiscalItemCOD_PRODUTO.IsNull then
  begin
    QCupomFiscalItemdesc_unidade.Value := Trim(dmoracle.FastSelect('DESC_UNIDADE', 'TB_PRODUTO',
      'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.AsString));
    QCupomFiscalItemdesc_produto.Value := Trim(dmoracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO',
      'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.AsString));

    wCodTributacao :=
    DMOracle.FastSelect('COD_TRIBUTACAO','TB_PRODUTO',
          'COD_PRODUTO = '+QCupomFiscalItemCOD_PRODUTO.AsString);
    wAliquota :=
    DMOracle.FastSelect('PERC_ALIQUOTA','TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + wCodTributacao);
    if StrToInt(wAliquota) > 0 then
      wAliquota := wAliquota + '%'
    else
      wAliquota := '';

    QCupomFiscalItemdesc_sit_tributaria.Value :=
      DMOracle.FastSelect('COD_TRIB_IMP_FISCAL','TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + wCodTributacao) + wAliquota;

    QCupomFiscalItemdesc_cod_barra.Value :=
      DMOracle.FastSelect('DESC_COD_BARRA','TB_PRODUTO',
        'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.AsString);
  end;

  wAuxValDesconto2 := QCupomFiscalItemVAL_DESCONTO.Value*100;
  wAuxValDesconto3 := QCupomFiscalItemQT_QUANTIDADE.Value * wAuxValDesconto2;
  wAuxValDesconto := trunc(wAuxValDesconto3);

  QCupomFiscalItemval_desconto_total_item.Value := wAuxValDesconto/100;
  QCupomFiscalItemval_total_com_desconto.Value := QCupomFiscalItemVAL_TOTAL.Value
    - QCupomFiscalItemval_desconto_total_item.Value;

  if QCupomFiscalItemIND_CANC_ITEM_CF.Value <> 'S' then
    QCupomFiscalItemdesc_cancelado.Value := ''
  else
    QCupomFiscalItemdesc_cancelado.Value := 'CANCELADO';

end;

procedure TDMImpressoraFiscal.QCupomFiscalItemBeforePost(
  DataSet: TDataSet);
var
  wAuxValTotal, wAuxValUnitario, wAuxQuantidade: Integer;
  wValTotal, wValUnitario, wQtde: Extended;
begin
  //É multiplicado por 100, feito o truncamento e dividido por 100 para utilizar apenas 2 casas decimais, e não divergir do valor registrado no ECF. Alessandro 05/03/13
  wValUnitario := QCupomFiscalItemVAL_UNITARIO.Value;
  wQtde := QCupomFiscalItemQT_QUANTIDADE.Value;
  wValTotal := wValUnitario * wQtde * 100;
  wValTotal := RoundTo(wValTotal, -2); //o roundTo é utilizado para casos como o seguinte exemplo, um valor 255 após passar pelo trunc torna-se 254. A explicação encontrada foi que o valor que a variavel realmente armazena não é 255 e sim 254,9999999999999999.... o que é comum acontecer com variaveis float. Portanto arredondando o valor em 2 casas decimais, casas estas que serão desconsideradas depois, ele fica certo. Alessandro 30/04/13 
  wAuxValTotal := trunc(wValTotal);
  QCupomFiscalItemVAL_TOTAL.Value := wAuxValTotal/100;
  //PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_NOTA_ITEM');
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabCalcFields(DataSet: TDataSet);
begin
  if not QCupomFiscalCabIND_SITUACAO.IsNull then
  begin
    case QCupomFiscalCabIND_SITUACAO.AsInteger of
      1: QCupomFiscalCabdesc_situacao.Value := 'DIGITADO';
      2: QCupomFiscalCabdesc_situacao.Value := 'CONFIRMADO';
      3: QCupomFiscalCabdesc_situacao.Value := 'CANCELADO';
    end;
  end
  else
    QCupomFiscalCabdesc_situacao.Value := '';
end;

procedure TDMImpressoraFiscal.QPagamentoAfterInsert(DataSet: TDataSet);
begin
  QPagamentoCOD_NOTA_CAB.Value := QCupomFiscalCabCOD_NOTA_CAB.Value;
end;

procedure TDMImpressoraFiscal.AtualizaEstoque(wTipoAtualizacao: Integer);
var wFilial_Estoque: Integer;
  wCustoItem, wRateioNota, wPercRatear, wBaixa: Real;
  wTipoCusto, wAux, wVenda: string;
  wHashMD5: String;
begin
  QCupomFiscalItem.Refresh;
  QCupomFiscalItem.First;
  while not QCupomFiscalItem.Eof do
  begin
  wAux := DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
    'COD_PRODUTO = ' + FloatToStr(QCupomFiscalItemCod_Produto.Value)
    + ' AND COD_LOTE_TIPO = ' + FloatToStr(QCupomFiscalItemCod_Lote_Tipo.Value)
    + ' AND COD_FILIAL = ' + FloatToStr(QCupomFiscalCabCod_Filial.Value));
  if Trim(wAux) <> '' then
    wCustoItem := StrToFloat(wAux)
  else
    wCustoItem := 0;
  wFilial_Estoque := QCupomFiscalCabCod_Filial.Value;
  wBaixa := QCupomFiscalItemQt_Quantidade.Value;
  DMEstoque.AtualizaEstoque(QCupomFiscalCabCod_Operacao.Value,
    wFilial_Estoque,
    QCupomFiscalItemCod_Produto.Value,
    QCupomFiscalItemCod_Lote_Tipo.Value,
    wBaixa * wTipoAtualizacao,
    wCustoItem * wTipoAtualizacao,
    0, QCupomFiscalCabDt_Emissao.Value);
  if wTipoAtualizacao = -1 then
  begin
    QCupomFiscalItem.Edit;
    QCupomFiscalItemVal_Custo.Value := wCustoItem;
    QCupomFiscalItem.Post;
  end;
  wHashMD5 := bib.GetHashStringMD5(FloatToStr(wBaixa * wTipoAtualizacao));
  DMOracle.ExecutaSql('UPDATE TB_ESTOQUE SET VL_ULTIMA_VENDA = ' +
    Bib.TrocaVirgulaPorPonto(FloatToStr(QCupomFiscalItemVAL_UNITARIO.Value - QCupomFiscalItemVAL_DESCONTO.Value
    - (QCupomFiscalItemVAL_DESCONTO_RATEIO.Value/QCupomFiscalItemQT_QUANTIDADE.Value))) +
    ', DESC_HASH_MD5 = ' + QuotedStr(wHashMD5) +
    ' WHERE COD_PRODUTO=' + QCupomFiscalItemCOD_PRODUTO.Text
    + ' AND COD_LOTE_TIPO = ' + FloatToStr(QCupomFiscalItemCod_Lote_Tipo.Value)
    + ' AND COD_FILIAL = ' + FloatToStr(QCupomFiscalCabCod_Filial.Value));
  QCupomFiscalItem.Next;
  end;
end;

procedure TDMImpressoraFiscal.GeraContaReceber(wListaParcela: TStrings;
  wFinalidade, wDepartamento, wContaCorrente: Integer);
var
  wCont: Integer;
  wAux: String;
begin
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    QContaReceber.Open;
    QContaReceber.Insert;
    QContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
    QContaReceberCOD_FINALIDADE.Value := wFinalidade;
    if wContaCorrente <> 0 then
    begin
      QContaReceberCod_Conta_Corrente.Value := wContaCorrente;
      QContaReceberCOD_BANCO_AGENCIA.Value := StrToInt(DMOracle.FastSelect('COD_BANCO_AGENCIA',
        'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + IntToStr(wContaCorrente)));
    end;
    QContaReceberCOD_CADASTRO.Value := QcupomFiscalCabCod_Cadastro.Value;
    QContaReceberCOD_FILIAL.Value := QcupomFiscalCabCod_Filial.Value;
    QContaReceberCOD_DEPARTAMENTO.Value := wDepartamento;
    QContaReceberNUM_TITULO.Value := QcupomFiscalCabNum_Nota.Value;
    QContaReceberNUM_PARCELA.Value := wCont + 1;
    QContaReceberDESC_TIPO_DOCUMENTO.Value := QcupomFiscalCabCod_Serie.Value;
    QContaReceberDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
    QContaReceberDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont], 1, 10));
    QContaReceberDT_EMISSAO.Value :=
      StrToDate(FormatDateTime('DD/MM/YYYY',QcupomFiscalCabDt_Emissao.Value));
    QContaReceberDT_CAPITALIZACAO_MOEDA.Value := QcupomFiscalCabDt_Emissao.Value;
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
    QContaReceberVAL_TITULO.Value := StrToFloat(wAux);
    QContaReceberCOD_NOTA_CAB.Value := QcupomFiscalCabCOD_NOTA_CAB.Value;
    QContaReceberIND_ACEITE.Value := 'NAO';
    QContaReceberIND_SITUACAO.Value := 'ABERTO';
    QContaReceberVAL_ORIGINAL.Value := QContaReceberVal_Titulo.Value;
    //QContaReceberPERC_COMISSAO.Value := QcupomFiscalCabPerc_Comissao.Value;
    QContaReceberCOD_VENDEDOR.Value := QcupomFiscalCabCod_Vendedor.Value;
    QContaReceber.Post;
    QContaReceberMov.Open;
    QContaReceberMov.Insert;
    QContaReceberMovCod_Conta_Receber_Cab.Value := QContaReceberCod_Conta_Receber_Cab.Value;
    QContaReceberMovCod_Conta_Receber_Mov.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
    QContaReceberMovDt_Movimento.Value := QcupomFiscalCabDt_Emissao.Value;
    QContaReceberMovInd_Tipo_Movimento.Value := 'PRINCIPAL';
    QContaReceberMovDT_Usuario.Value := DMOracle.DataHoraServ;
    QContaReceberMovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
    QContaReceberMovVal_Movimento.Value := QContaReceberVal_Titulo.Value;
    QContaReceberMov.Post;
  end;
  QContaReceberMov.Close;
  QContaReceber.Close;
end;

function TDMImpressoraFiscal.ContasAReceberBaixados: Boolean;
begin
  QContaReceber.Close;
  QContaReceber.SetVariable('NOTA_CAB', QCupomFiscalCabCOD_NOTA_CAB.Value);
  QContaReceber.Open;
  QContaReceberMov.Open;
  QContaReceber.First;
  Result := false;
  while not QContaReceber.Eof do
  begin
    QContaReceberMov.First;
    while not QContaReceberMov.Eof do
    begin
      if QContaReceberMovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL' then
        Result := True;
      QContaReceberMov.Next;
    end;
    QContaReceber.Next;
  end;
end;

procedure TDMImpressoraFiscal.VoltaEstoqueEPagamentos;
begin
//volta contas a receber
  DMOracle.DBCemapa.StartTransaction;
  QContaReceber.Close;
  QContaReceber.SetVariable('NOTA_CAB', QCupomFiscalCabCOD_NOTA_CAB.Value);
  QContaReceber.Open;
  QContaReceber.First;
  while not QContaReceber.Eof do
  begin
    QContaReceberMov.Delete;
    QContaReceber.Delete;
  end;
  with DMNotaSaida do
  begin
    QCaixa.MasterFields := '';
    QCaixa.DetailFields := '';
    QCaixa.Master := nil;
    QCaixa.Close;
    QCaixa.SetVariable('COD_NOTA_CAB', QCupomFiscalCabCOD_NOTA_CAB.Value);
    QCaixa.Open;
    QCaixa.First;
    while not QCaixa.Eof do
      QCaixa.Delete;
    QCaixa.Master := QNotaSaida;
    QCaixa.MasterFields := 'COD_NOTA_CAB';
    QCaixa.DetailFields := 'COD_NOTA_CAB';
  end;


  DMOracle.DBCemapa.Commit;

  //Volta o estoque
  AtualizaEstoque(1);
end;

procedure TDMImpressoraFiscal.AtuCaixa(wVal_Movimento: Real; wOperacao,
  wFilial, wNumNota, wCadastro, wNotaCab, wTipo: string;
  wDataMov: TDateTime);
var
  wHistorico: string;
begin
  wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True);
  if wHistorico <> '' then
  begin
    with DMNotaSaida do
    begin
      QCaixa.MasterFields := '';
      QCaixa.DetailFields := '';
      QCaixa.Master := nil;
      QCaixa.Open;
      QCaixa.Insert;
      QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QCaixaCOD_FILIAL.Value := StrToInt(wFilial);
      QCaixaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario;
      QCaixaCOD_HISTORICO.Value := StrToInt(wHistorico);
      QCaixaDT_MOVIMENTO.Value := wDataMov;
      QCaixaVAL_MOVIMENTO.Value := wVal_Movimento;
      QCaixaNUM_DOCUMENTO.Value := StrToInt(wNumNota);
      QCaixaCOD_NOTA_CAB.Value := StrToInt(wNotaCab);
      QCaixaDESC_COMPLEMENTO.Value := wTipo;
      QCaixaCOD_CADASTRO.Value := StrToInt(wCadastro);
      QCaixaDT_USUARIO.Value := DMOracle.DataServ;
      QCaixa.Post;
      QCaixa.Close;
      QCaixa.Master := QNotaSaida;
      QCaixa.MasterFields := 'COD_NOTA_CAB';
      QCaixa.DetailFields := 'COD_NOTA_CAB';
    end;
  end;
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabAfterOpen(DataSet: TDataSet);
begin
  QSomaCupom.Open;
end;

function TDMImpressoraFiscal.VerificaNotaDigitada: Boolean;
  (*
   * Função separada para que seja possível chamar apenas a exibição das opções
   * de forma recursiva. Se a opção escolhida não puder ser executada, é
   * interessante chamar novamente a exibição das opções para permitir que o
   * usuário escolha outra resolução para a nota digitada.
   *)
  procedure ofereceOpcoes(Nota, Situacao, Msg: string);
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
            ofereceOpcoes(Nota, Situacao, Msg); //Não foi possível excluir, pedir novamente o que fazer.
            Exit;
          end;
          Executador.Limpa;
          Executador.Adiciona('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + Nota);
          Executador.Adiciona('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + Nota);
          Executador.Executar(True, True);
        end;
      mrNo:
        begin
            if QCupomFiscalItem.State in [dsEdit, dsInsert] then
              QCupomFiscalItem.Cancel;
            QCupomFiscalCab.Cancel;
            QCupomFiscalItem.Close;
            QCupomFiscalCab.Close;
            QCupomFiscalCab.SetVariable('PK', Nota);
            QCupomFiscalCab.Open;
            QCupomFiscalItem.Open;                
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
  DataS := QCupomFiscalCab;

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
      ofereceOpcoes(wNota, wSituacao, wMsg);
    end;
  end;
end; 

procedure TDMImpressoraFiscal.QCupomFiscalCabPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  VerificaNotaDigitada;
end;

procedure TDMImpressoraFiscal.QCupomFiscalItemAfterPost(DataSet: TDataSet);
begin
  QChecaMD5NotaItem.Close;
  QChecaMD5NotaItem.SetVariable('COD_NOTA_ITEM',
    QCupomFiscalItemCOD_NOTA_ITEM.Value);
  QChecaMD5NotaItem.Open;
  bib.GeraMD5Query(QChecaMD5NotaItem,'TB_NOTA_ITEM');
//  bib.AtualizaExclusaoInclusaoMD5(QCupomFiscalCabDT_EMISSAO.Value,
//    QCupomFiscalCabDT_EMISSAO.Value,True);
  QCupomFiscalItem.RefreshRecord;  
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QCupomFiscalItemCOD_NOTA_ITEM.Text+'TB_NOTA_ITEM'),true);
  end;
end;

procedure TDMImpressoraFiscal.QPagamentoAfterPost(DataSet: TDataSet);
begin
  QChecaMD5Pagamento.Close;
  QChecaMD5Pagamento.SetVariable('COD_PAGAMENTO',QPagamentoCOD_PAGAMENTO.Value);
  QChecaMD5Pagamento.Open;
  bib.GeraMD5Query(QChecaMD5Pagamento,'TB_PAGAMENTO');
//  bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//    True);
  QPagamento.RefreshRecord;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QPagamentoCOD_PAGAMENTO.Text+'TB_PAGAMENTO'),true);
  end
end;

procedure TDMImpressoraFiscal.QNotaManualItemAfterPost(DataSet: TDataSet);
begin
  QChecaMD5NotaItem.Close;
  QChecaMD5NotaItem.SetVariable('COD_NOTA_ITEM',
    QNotaManualItemCOD_NOTA_ITEM.Value);
  QChecaMD5NotaItem.Open;
  bib.GeraMD5Query(QChecaMD5NotaItem,'TB_NOTA_ITEM');
  QNotaManualItem.RefreshRecord;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QNotaManualItemCOD_NOTA_ITEM.Text+'TB_NOTA_ITEM'),true);
  end;
end;

procedure TDMImpressoraFiscal.QReg60MBeforePost(DataSet: TDataSet);
begin
//  PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_REGISTRO_TIPO60_MESTRE');
end;

procedure TDMImpressoraFiscal.QReg60ABeforePost(DataSet: TDataSet);
begin
  //PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_REGISTRO_TIPO60_ANALITICO');
end;

procedure TDMImpressoraFiscal.QReg60AAfterPost(DataSet: TDataSet);
begin
  QChecaMD5Reg60A.Close;
  QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
    QReg60ACOD_REGISTRO_ANALITICO.Value);
  QChecaMD5Reg60A.Open;
  Bib.GeraMD5Query(QChecaMD5Reg60A,'TB_REGISTRO_TIPO60_ANALITICO');
//  bib.AtualizaExclusaoInclusaoMD5(QReg60MDT_EMISSAO.Value,QReg60MDT_EMISSAO.Value,
//  True);
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QReg60ACOD_REGISTRO_ANALITICO.Text+'TB_REGISTRO_TIPO60_ANALITICO'),true);
  end
end;

procedure TDMImpressoraFiscal.QReg60MAfterPost(DataSet: TDataSet);
begin
  QChecaMD5Reg60M.Close;
  QChecaMD5Reg60M.SetVariable('COD_REGISTRO_MESTRE',
    QReg60MCOD_REGISTRO_MESTRE.Value);
  QChecaMD5Reg60M.Open;
  Bib.GeraMD5Query(QChecaMD5Reg60M,'TB_REGISTRO_TIPO60_MESTRE');
//  bib.AtualizaExclusaoInclusaoMD5(QReg60MDT_EMISSAO.Value,QReg60MDT_EMISSAO.Value,
//      True);
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QReg60MCOD_REGISTRO_MESTRE.Text+'TB_REGISTRO_TIPO60_MESTRE'),true);
  end
end;

procedure TDMImpressoraFiscal.QPagamentoBeforePost(DataSet: TDataSet);
begin
//  PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_PAGAMENTO');
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabBeforePost(DataSet: TDataSet);
begin
//  PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_NOTA_CAB');
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabAfterPost(DataSet: TDataSet);
begin
  QChecaMD5NotaCab.Close;
  QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QCupomFiscalCabCOD_NOTA_CAB.Value);
  QChecaMD5NotaCab.Open;
  bib.GeraMD5Query(QChecaMD5NotaCab,'TB_NOTA_CAB');
//  bib.AtualizaExclusaoInclusaoMD5(QCupomFiscalCabDT_EMISSAO.Value,
//    QCupomFiscalCabDT_EMISSAO.Value,True);
  QCupomFiscalCab.RefreshRecord;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QCupomFiscalCabCOD_NOTA_CAB.Text+'TB_NOTA_CAB'),true);
  end
end;

procedure TDMImpressoraFiscal.QECFBeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QECFNUM_SERIE.Text+'TB_ECF';
end;

procedure TDMImpressoraFiscal.QECFAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QECFAfterPost(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QECFNUM_SERIE.Text+'TB_ECF'),true);
  end;
end;

procedure TDMImpressoraFiscal.QPagamentoBeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QPagamentoCOD_PAGAMENTO.Text+'TB_PAGAMENTO';
end;

procedure TDMImpressoraFiscal.QPagamentoAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QReg60MBeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QReg60MCOD_REGISTRO_MESTRE.Text+'TB_REGISTRO_TIPO60_MESTRE';
end;

procedure TDMImpressoraFiscal.QReg60MAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QReg60ABeforeDelete(DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QReg60ACOD_REGISTRO_ANALITICO.Text+'TB_REGISTRO_TIPO60_ANALITICO';
end;

procedure TDMImpressoraFiscal.QReg60AAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabBeforeDelete(
  DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QCupomFiscalCabCOD_NOTA_CAB.Text+'TB_NOTA_CAB';
end;

procedure TDMImpressoraFiscal.QCupomFiscalCabAfterDelete(
  DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QCupomFiscalItemBeforeDelete(
  DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QCupomFiscalItemCOD_NOTA_ITEM.Text+'TB_NOTA_ITEM';
end;

procedure TDMImpressoraFiscal.QCupomFiscalItemAfterDelete(
  DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMImpressoraFiscal.QNotaManualCabBeforeDelete(
  DataSet: TDataSet);
begin
    wCodPafInclusaoExclusao := QNotaManualCabCOD_NOTA_CAB.Text+'TB_NOTA_CAB';
end;

procedure TDMImpressoraFiscal.QNotaManualCabAfterPost(DataSet: TDataSet);
begin
  QChecaMD5NotaCab.Close;
  QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QNotaManualCabCOD_NOTA_CAB.Value);
  QChecaMD5NotaCab.Open;
  bib.GeraMD5Query(QChecaMD5NotaCab,'TB_NOTA_CAB');
//  bib.AtualizaExclusaoInclusaoMD5(QCupomFiscalCabDT_EMISSAO.Value,
//    QCupomFiscalCabDT_EMISSAO.Value,True);
  QNotaManualCab.RefreshRecord;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QNotaManualCabCOD_NOTA_CAB.Text+'TB_NOTA_CAB'),true);
  end
end;

procedure TDMImpressoraFiscal.QNotaManualCabAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;

end;

procedure TDMImpressoraFiscal.QNotaManualItemBeforeDelete(
  DataSet: TDataSet);
begin
  wCodPafInclusaoExclusao := QNotaManualItemCOD_NOTA_ITEM.Text+'TB_NOTA_ITEM';
end;

procedure TDMImpressoraFiscal.QNotaManualItemAfterDelete(
  DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

end.
