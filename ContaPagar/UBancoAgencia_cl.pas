unit UBancoAgencia_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Mask, OracleData, OraTeste, Oracle, MaskUtils;

type
  TDMBancoAgencia = class(TDataModule)
    DSBancoAgenciaCons: TDataSource;
    DSBancoAgencia: TDataSource;
    DSContaCorrenteCons: TDataSource;
    DSContaCorrente: TDataSource;
    QExcluiConcilia: TOracleDataSet1;
    QBancoConciliaCons: TOracleDataSet1;
    QBancoConciliaConsCOD_BCO_CONCILIA: TIntegerField;
    QBancoConciliaConsCOD_HISTORICO: TIntegerField;
    QBancoConciliaConsCOD_CONTA_CORRENTE: TIntegerField;
    QBancoConciliaConsNUM_CHEQUE: TIntegerField;
    QBancoConciliaConsDT_MOVIMENTO: TDateTimeField;
    QBancoConciliaConsDT_SISTEMA: TDateTimeField;
    QBancoConciliaConsVAL_MOVIMENTO: TFloatField;
    QBancoConciliaConsDESC_OBSERVACAO: TStringField;
    QBancoConciliaConsDESC_COMPLEMENTO1: TStringField;
    QBancoConciliaConsDESC_COMPLEMENTO2: TStringField;
    QBancoConciliaConsDESC_BANCO_AGENCIA: TStringField;
    QBancoConciliaCad: TOracleDataSet1;
    QBancoConciliaCadCOD_BCO_CONCILIA: TIntegerField;
    QBancoConciliaCadCOD_HISTORICO: TIntegerField;
    QBancoConciliaCadCOD_CONTA_CORRENTE: TIntegerField;
    QBancoConciliaCadNUM_CHEQUE: TIntegerField;
    QBancoConciliaCadDT_MOVIMENTO: TDateTimeField;
    QBancoConciliaCadDT_SISTEMA: TDateTimeField;
    QBancoConciliaCadVAL_MOVIMENTO: TFloatField;
    QBancoConciliaCadDESC_OBSERVACAO: TStringField;
    QBancoConciliaCadDESC_COMPLEMENTO1: TStringField;
    QBancoConciliaCadDESC_COMPLEMENTO2: TStringField;
    QBancoConciliaCadCOD_BCO_MOVIMENTO: TIntegerField;
    QBancoConciliaCaddesc_historico: TStringField;
    QBancoConciliaCaddesc_conta_corrente: TStringField;
    QBancoMovCons: TOracleDataSet1;
    QAtualizaNrCheque: TOracleDataSet1;
    QContaCorrenteCons: TOracleDataSet1;
    QContaCorrenteConsDESC_BANCO_AGENCIA: TStringField;
    QContaCorrenteConsCOD_BANCO_AGENCIA: TIntegerField;
    QContaCorrenteConsDESC_CIDADE: TStringField;
    QContaCorrenteConsNUM_CHEQUE: TIntegerField;
    QContaCorrenteConsCOD_CONTA_CORRENTE: TIntegerField;
    QContaCorrenteConsIND_FLUXO_CAIXA: TStringField;
    QContaCorrenteConsDESC_CONTA_CORRENTE: TStringField;
    QBancoAgenciaCons: TOracleDataSet1;
    QBancoAgenciaConsCOD_BANCO_AGENCIA: TIntegerField;
    QBancoAgenciaConsCOD_ESTADO: TStringField;
    QBancoAgenciaConsDESC_BANCO_AGENCIA: TStringField;
    QBancoAgenciaConsDESC_SIGLA: TStringField;
    QBancoAgenciaConsCOD_BANCO: TIntegerField;
    QBancoAgenciaConsCOD_AGENCIA: TIntegerField;
    QBancoAgencia: TOracleDataSet1;
    QBancoAgenciaCOD_BANCO_AGENCIA: TIntegerField;
    QBancoAgenciaCOD_ESTADO: TStringField;
    QBancoAgenciaDESC_BANCO_AGENCIA: TStringField;
    QBancoAgenciaDESC_CIDADE: TStringField;
    QBancoAgenciaDESC_SIGLA: TStringField;
    QBancoAgenciaDESC_INSTRUCAO_BLOQUETO: TStringField;
    QBancoAgenciaIND_TIPO_JURO: TStringField;
    QBancoAgenciaPERC_JURO_BLOQUETO: TFloatField;
    QBancoAgenciaNUM_LIN_VALOR: TIntegerField;
    QBancoAgenciaNUM_COL_VALOR: TIntegerField;
    QBancoAgenciaNUM_LIN_VAL_EXTENSO: TIntegerField;
    QBancoAgenciaNUM_COL_VAL_EXTENSO: TIntegerField;
    QBancoAgenciaNUM_TAM_VAL_EXTENSO: TIntegerField;
    QBancoAgenciaNUM_LIN_NOMINAL: TIntegerField;
    QBancoAgenciaNUM_COL_NOMINAL: TIntegerField;
    QBancoAgenciaNUM_TAM_NOMINAL: TIntegerField;
    QBancoAgenciaNUM_LIN_CIDADE: TIntegerField;
    QBancoAgenciaNUM_COL_CIDADE: TIntegerField;
    QBancoAgenciaNUM_TAM_CIDADE: TIntegerField;
    QBancoAgenciaNUM_LIN_DIA: TIntegerField;
    QBancoAgenciaNUM_COL_DIA: TIntegerField;
    QBancoAgenciaNUM_LIN_FINAL: TIntegerField;
    QBancoAgenciaNUM_COL_MES: TIntegerField;
    QBancoAgenciaNUM_COL_ANO: TIntegerField;
    QBancoAgenciaDESC_ANO_FORMATO: TStringField;
    QBancoAgenciaCOD_BANCO: TIntegerField;
    QBancoAgenciaCOD_AGENCIA: TIntegerField;
    QBancoAgenciaCOD_CONTABIL_VL_DESC_BCO_CRED: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_JURO_BCO_DEB: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_PRIN_BCO_DEB: TStringField;
    QBancoAgenciaCOD_CONTABIL_VALOR_FILIAL: TStringField;
    QBancoAgenciaNUM_INSCR_CEDENTE: TFloatField;
    QBancoAgenciaPREFIXO_AGENCIA: TIntegerField;
    QBancoAgenciaCODIGO_CEDENTE: TIntegerField;
    QBancoAgenciaDIGITO_VERIFICADOR_CEDENTE: TStringField;
    QBancoAgenciaNOSSO_NUMERO: TFloatField;
    QBancoAgenciaDIGITO_VERIFICADOR_N_NR: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_PRIN_BCO_CRED: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_JURO_BCO_CRED: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_DESC_BCO_DEB: TStringField;
    QBancoAgenciadesc_contabil_juro_deb: TStringField;
    QBancoAgenciadesc_contabil_prin_deb: TStringField;
    QBancoAgenciadesc_contabil_desc_cred: TStringField;
    QBancoAgenciadesc_contabil_prin_cred: TStringField;
    QBancoAgenciadesc_contabil_juro_cred: TStringField;
    QBancoAgenciadesc_contabil_desc_deb: TStringField;
    QBancoAgenciadesc_contabil_valor_filial: TStringField;
    QContaCorrente: TOracleDataSet1;
    QContaCorrenteCOD_CONTA_CORRENTE: TIntegerField;
    QContaCorrenteCOD_BANCO_AGENCIA: TIntegerField;
    QContaCorrenteVAL_LIMITE: TFloatField;
    QContaCorrenteDT_VENC_LIMITE: TDateTimeField;
    QContaCorrenteNUM_CHEQUE: TIntegerField;
    QContaCorrenteDESC_CONTA_CORRENTE: TStringField;
    QContaCorrenteNOME_RESPONSAVEL: TStringField;
    QContaCorrenteCOD_FILIAL: TIntegerField;
    QContaCorrenteIND_FLUXO_CAIXA: TStringField;
    QContaCorrenteIND_CHEQUE_PRE_DATADO: TStringField;
    QContaCorrenteVARIACAO: TIntegerField;
    QContaCorrenteCOMANDO: TIntegerField;
    QContaCorrentedesc_filial: TStringField;
    QBancoMovimento: TOracleDataSet1;
    QBancoMovimentoCOD_BCO_MOVIMENTO: TIntegerField;
    QBancoMovimentoCOD_USUARIO: TIntegerField;
    QBancoMovimentoCOD_HISTORICO: TIntegerField;
    QBancoMovimentoCOD_CONTA_CORRENTE: TIntegerField;
    QBancoMovimentoNUM_CHEQUE: TIntegerField;
    QBancoMovimentoDT_MOVIMENTO: TDateTimeField;
    QBancoMovimentoVAL_MOVIMENTO: TFloatField;
    QBancoMovimentoCOD_NOTA_CAB: TIntegerField;
    QBancoMovimentoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QBancoMovimentoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QBancoMovimentoDT_USUARIO: TDateTimeField;
    QBancoMovimentoNUM_NOTA: TIntegerField;
    QBancoMovimentoCOD_SERIE: TStringField;
    QBancoMovimentoCOD_CADASTRO: TIntegerField;
    QBancoMovimentoNUM_CARGA: TIntegerField;
    QBancoMovimentoIND_BAIXA_CHEQUE: TStringField;
    QBancoMovimentoCOD_DEPARTAMENTO: TIntegerField;
    QBancoMovimentodesc_cadastro: TStringField;
    QBancoMovimentodesc_historico: TStringField;
    QBancoMovimentodesc_ccorrente: TStringField;
    QBancoMovimentodesc_departamento: TStringField;
    QBancoMovimentoind_operacao: TStringField;
    QBancoMovimentocod_banco_agencia: TFloatField;
    QBancoMovConsCOD_BCO_MOVIMENTO: TIntegerField;
    QBancoMovConsCOD_USUARIO: TIntegerField;
    QBancoMovConsCOD_HISTORICO: TIntegerField;
    QBancoMovConsCOD_CONTA_CORRENTE: TIntegerField;
    QBancoMovConsNUM_CHEQUE: TIntegerField;
    QBancoMovConsDT_MOVIMENTO: TDateTimeField;
    QBancoMovConsVAL_MOVIMENTO: TFloatField;
    QBancoMovConsDESC_OBSERVACAO: TStringField;
    QBancoMovConsDESC_COMPLEMENTO1: TStringField;
    QBancoMovConsDESC_COMPLEMENTO2: TStringField;
    QBancoMovConsCOD_NOTA_CAB: TIntegerField;
    QBancoMovConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QBancoMovConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QBancoMovConsDT_USUARIO: TDateTimeField;
    QBancoMovConsNUM_NOTA: TIntegerField;
    QBancoMovConsCOD_SERIE: TStringField;
    QBancoMovConsCOD_CADASTRO: TIntegerField;
    QBancoMovConsNUM_CARGA: TIntegerField;
    QBancoMovConsDESC_BANCO_AGENCIA: TStringField;
    QBancoMovConsIND_BAIXA_CHEQUE: TStringField;
    QBancoAgenciaCOD_CONTABIL_CONTRAPARTIDA: TStringField;
    QBancoAgenciadesc_contabil_contrapartida: TStringField;
    QBaixaCheque: TOracleDataSet1;
    QBaixaChequeCOD_BCO_MOVIMENTO: TIntegerField;
    QBaixaChequeDESC_COMPLEMENTO2: TStringField;
    QBaixaChequeIND_BAIXA_CHEQUE: TStringField;
    QBaixaChequeDT_BAIXA_CHEQUE: TDateTimeField;
    QBancoMovimentoDESC_TARJA_MAGNETICA: TStringField;
    QBancoMovimentoDESC_AGENCIA: TIntegerField;
    QBancoMovimentoDESC_BANCO: TIntegerField;
    QExportaCheque: TOracleDataSet1;
    QExportaChequeDESC_BANCO: TIntegerField;
    QExportaChequeDESC_AGENCIA: TIntegerField;
    QExportaChequeDESC_FILIAL: TStringField;
    QExportaChequeDESC_BANCO_AGENCIA: TStringField;
    QExportaChequeDESC_CONTA: TIntegerField;
    QBancoMovimentoDESC_CONTA: TIntegerField;
    QExportaChequeNUM_CGC: TStringField;
    QExportaChequeDESC_TARJA_MAGNETICA: TStringField;
    QExportaChequeNUM_CHEQUE: TIntegerField;
    QBancoMovimentoNUM_CGC_CPF_EMITENTE: TStringField;
    QBancoMovimentoDT_BAIXA_CHEQUE: TDateTimeField;
    QBancoMovimentoDT_BOM_PARA: TDateTimeField;
    QExportaChequeVAL_MOVIMENTO: TFloatField;
    QExportaChequeDT_BOM_PARA: TDateTimeField;
    QExportaChequeDV_AGENCIA: TStringField;
    QBancoAgenciaCOD_CONVENIO_CUSTODIA: TFloatField;
    QBancoAgenciaCOD_CONVENIO_DESCONTO: TFloatField;
    QExportaChequeCOD_CONVENIO_CUSTODIA: TFloatField;
    QContaCorrenteNUM_CONTA_CORRENTE: TStringField;
    QExportaChequeNUM_CGC_CPF_EMITENTE: TStringField;
    QBancoMovimentoIND_TIPO_CHEQUE: TStringField;
    QBancoMovimentoDT_ENVIA_BANCO: TDateTimeField;
    QContaCorrenteCARTEIRA: TIntegerField;
    QContaCorrentePRIMEIRA_INSTR_COD: TStringField;
    QContaCorrenteNR_DIAS_PROTESTO: TIntegerField;
    QBancoAgenciaVAL_LIMITE_CHEQUE: TFloatField;
    QBancoMovimentoIND_PGTO_TAXA: TStringField;
    QBancoMovimentoVAL_DESCONTO_TAXA: TFloatField;
    QBancoAgenciaPERC_TAXA_LIMITE: TFloatField;
    QBancoMovimentoVAL_MULTA_JUROS: TFloatField;
    QBancoAgenciaCOD_CONTABIL_VL_TAXA_CRED: TStringField;
    QBancoAgenciaCOD_CONTABIL_VL_TAXA_DEB: TStringField;
    QBancoAgenciaCOD_HISTORICO_CAIXA_TAXA: TIntegerField;
    QBancoAgenciadesc_contabil_taxa_cred: TStringField;
    QBancoAgenciadesc_contabil_taxa_deb: TStringField;
    QBancoAgenciadesc_historico_caixa_taxa: TStringField;
    QContaCorrenteCOD_CEDENTE: TIntegerField;
    QContaCorrenteDIG_VERIFICADOR_CEDENTE: TStringField;
    QBancoMovimentodesc_vendedor: TStringField;
    QBancoMovimentoDESC_OBSERVACAO2: TStringField;
    QContaCorrenteConsNUM_CONTA_CORRENTE: TStringField;
    QBancoMovimentoCOD_BANCO_DESTINO: TIntegerField;
    QBancoMovimentoIND_DEPOSITO_PENDENTE: TStringField;
    QBancoMovConsIND_DEPOSITO_PENDENTE: TStringField;
    QBancoMovimentoDT_BAIXA_DEP_PENDENTE: TDateTimeField;
    QBancoMovimentoCOD_VENDEDOR: TIntegerField;
    QBancoMovimentoIND_CHEQUE_DEVOLVIDO: TStringField;
    QFluxoCaixa: TOracleDataSet1;
    QFluxoCaixaCOD_FLUXO_CAIXA: TIntegerField;
    QFluxoCaixaCOD_FILIAL: TIntegerField;
    QFluxoCaixaCOD_DEPARTAMENTO: TIntegerField;
    QFluxoCaixaDT_FLUXO_CAIXA: TDateTimeField;
    QFluxoCaixaVAL_FLUXO_CAIXA: TFloatField;
    QFluxoCaixaVAL_PAGAR: TFloatField;
    QFluxoCaixaDESC_OBSERVACAO: TStringField;
    QFluxoCaixaCOD_BCO_MOVIMENTO: TIntegerField;
    QBcoMovimentoMov: TOracleDataSet1;
    QBcoMovimentoMovCOD_BCO_MOVIMENTO_MOV: TIntegerField;
    QBcoMovimentoMovCOD_BCO_MOVIMENTO: TIntegerField;
    QBcoMovimentoMovCOD_USUARIO: TIntegerField;
    QBcoMovimentoMovDT_USUARIO: TDateTimeField;
    QBcoMovimentoMovDT_MOVIMENTO: TDateTimeField;
    QBcoMovimentoMovVAL_MOVIMENTO: TFloatField;
    QBancoMovConsVAL_BAIXADO: TFloatField;
    QBancoMovimentoDT_BAIXA_CHEQUE_DEVOLVIDO: TDateTimeField;
    QBancoMovimentoVAL_BAIXADO: TFloatField;
    QBcoMovimentoMovIND_MOVIMENTO: TStringField;
    QBancoMovConsCOD_DEPARTAMENTO: TIntegerField;
    QBancoMovConsCOD_VENDEDOR: TIntegerField;
    OPContabilidade: TOraclePackage;
    QBcoMovimentoMovCOD_BCO_MOVIMENTO_BAIXA: TIntegerField;
    QBcoMovimentoMovCOD_CAIXA_MOV_BAIXA: TIntegerField;
    QContaCorrenteDIG_VERIFICADOR_AGENCIA_CONTA: TStringField;
    QContaCorrenteCOD_FORMA_CADAST_BANCO: TStringField;
    QContaCorrenteCOD_TIPO_DOCUMENTO: TStringField;
    QContaCorrenteCOD_IDENTIF_EMISSAO_BLOQUETO: TStringField;
    QContaCorrenteCOD_IDENTIF_DISTRIBUICAO: TStringField;
    QContaCorrenteCOD_IDENTIF_ACEITO: TStringField;
    QContaCorrenteCOD_PROTESTO: TStringField;
    QContaCorrenteIND_SITUACAO: TStringField;
    QBancoMovConsIND_TIPO_CHEQUE: TStringField;
    QBancoMovimentoCOD_CONTRATO_MOV: TIntegerField;
    QContaCorrenteConsCOD_FILIAL: TIntegerField;
    OPBanco: TOraclePackage;
    QBancoConciliaConsCOD_BCO_MOVIMENTO: TIntegerField;
    QBancoMovimentoDT_COMPENSACAO: TDateTimeField;
    QContaCorrenteNUM_CONVENIO: TIntegerField;
    QContaCorrenteCOD_CONVENENTE_LIDER: TIntegerField;
    QContaCorrenteDESC_TIPO_COBRANCA: TStringField;
    QBancoMovimentoCOD_DEPARTAMENTO_CAIXA: TIntegerField;
    QBancoMovimentoCOD_HISTORICO_CAIXA: TIntegerField;
    QBancoMovimentoCOD_BORDERO: TIntegerField;
    QContaCorrenteIND_CONTA_CREDITO_CLIENTE: TStringField;
    QBancoAgenciaDESC_LOCAL_PGTO_BLOQ: TStringField;
    QBancoAgenciaDIGITO_VERIFICADOR_AGENCIA: TStringField;
    QBancoMovimentoCOD_ADIANTAMENTO: TIntegerField;
    QContaCorrenteVAL_MULTA: TFloatField;
    QBancoAgenciaNUM_COD_EMPRESA: TFloatField;
    QBancoAgenciaCOD_COBRANCA: TIntegerField;
    QBancoAgenciaNUM_CONVENIO: TIntegerField;
    QBancoAgenciaCOD_CONVENENTE_LIDER: TIntegerField;
    QBancoMovimentoCOD_TITULAR_CHEQUE: TIntegerField;
    QBancoMovimentoDESC_OBSERVACAO: TStringField;
    QBancoMovimentoDESC_COMPLEMENTO1: TStringField;
    QBancoMovimentoDESC_COMPLEMENTO2: TStringField;
    QBcoMovimentoMovDESC_COMPLEMENTO: TStringField;
    QContaCorrenteCOD_IDENTIF_TIPO_BOLETO: TStringField;
    QTaxaCartao: TOracleDataSet1;
    QTaxaCartaoCOD_CARTAO: TIntegerField;
    QTaxaCartaoCOD_BANCO_AGENCIA: TIntegerField;
    QTaxaCartaoDESC_PARCELAMENTO: TStringField;
    QTaxaCartaoNUM_PARCELAS: TIntegerField;
    QTaxaCartaoPERC_TAXA: TFloatField;
    QBancoAgenciaIND_BANCO_PADRAO: TStringField;
    QTaxaCartaoCOD_BANDEIRA_CARTAO: TIntegerField;
    QTaxaCartaodesc_bandeira_cartao: TStringField;
    QBancoAgenciaCOD_USUARIO: TIntegerField;
    QContaCorrenteCOD_USUARIO: TIntegerField;
    QTaxaCartaoCOD_USUARIO: TIntegerField;
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
    QContaPixCons: TOracleDataSet1;
    QContaPixCOD_PSP_BANCO: TIntegerField;
    QContaPixConsCOD_BANCO_AGENCIA_PIX: TIntegerField;
    QContaPixConsDESC_CLIENT_ID: TStringField;
    QContaPixConsDESC_CLIENT_SECRET: TStringField;
    QContaPixConsDESC_CONSUMER_KEY: TStringField;
    QContaPixConsDESC_CONSUMER_SECRET: TStringField;
    QContaPixConsDESC_DEVELOPER_APPLICATION_KEY: TStringField;
    QContaPixConsDESC_ACCOUNT_ID: TStringField;
    QContaPixConsDESC_ARQUIVO_CHAVE_PRIVADA: TStringField;
    QContaPixConsDESC_ARQUIVO_CERTIFICADO: TStringField;
    QContaPixConsDESC_ARQUIVO_ROOT_CERTIFICADO: TStringField;
    QContaPixConsDESC_SECRET_KEY: TStringField;
    QContaPixConsDESC_ACCESS_KEY: TStringField;
    QContaPixConsDESC_ARQUIVO_PFX: TStringField;
    QContaPixConsDESC_SENHA_PFX: TStringField;
    QContaPixConsDESC_ACCESS_TOKEN: TStringField;
    QContaPixConsDESC_TOKEN: TStringField;
    QContaPixConsDESC_TOKEN_SANDBOX: TStringField;
    QContaPixConsDESC_MEDIATOR_FEE: TFloatField;
    QContaPixConsCOD_API_VERSION: TFloatField;
    QContaPixConsCOD_TIPO_AMBIENTE: TIntegerField;
    QContaPixConsIND_PIX_PADRAO: TStringField;
    QContaPixConsCOD_USUARIO: TIntegerField;
    QContaPixConsCOD_PSP_BANCO: TIntegerField;
    QAtualizaPixPadrao: TOracleDataSet1;
    QContaPixIND_AMBIENTE_PSP: TIntegerField;
    QContaPixDESC_CHAVE_PIX: TStringField;
    QContaPixConsDESC_CHAVE_PIX: TStringField;
    QRBandeiraTaxa: TOracleDataSet;
    QRBandeiraTaxaCOD_CARTAO: TIntegerField;
    QRBandeiraTaxaCOD_BANCO_AGENCIA: TIntegerField;
    QRBandeiraTaxaCOD_BANDEIRA_CARTAO: TIntegerField;
    QRBandeiraTaxaDESC_BANDEIRA_CARTAO: TStringField;
    QRBandeiraTaxaDESC_PARCELAMENTO: TStringField;
    QRBandeiraTaxaNUM_PARCELAS: TIntegerField;
    QRBandeiraTaxaPERC_TAXA: TFloatField;
    QContaCorrenteDESC_CHAVE_API_BOLETO: TStringField;
    QContaCorrenteIND_API_BOLETO: TStringField;
    QContaCorrenteConsIND_API_BOLETO: TStringField;
    QContaCorrenteDESC_KEY_USER_HOM: TStringField;
    QContaCorrenteDESC_KEY_USER_PROD: TStringField;
    procedure QContaCorrenteAfterInsert(DataSet: TDataSet);
    procedure QBancoAgenciaBeforeEdit(DataSet: TDataSet);
    procedure QBancoAgenciaBeforeInsert(DataSet: TDataSet);
    procedure QContaCorrenteBeforeInsert(DataSet: TDataSet);
    procedure QContaCorrenteBeforeEdit(DataSet: TDataSet);
    procedure QContaCorrenteAfterPost(DataSet: TDataSet);
    procedure QBancoMovimentoAfterInsert(DataSet: TDataSet);
    procedure QBancoAgenciaBeforeCancel(DataSet: TDataSet);
    procedure QBancoAgenciaBeforePost(DataSet: TDataSet);
    procedure QBancoAgenciaAfterInsert(DataSet: TDataSet);
    procedure QBancoMovimentoCalcFields(DataSet: TDataSet);
    procedure QBancoMovimentoBeforeInsert(DataSet: TDataSet);
    procedure QBancoMovimentoBeforeEdit(DataSet: TDataSet);
    procedure QBancoConciliaCadAfterInsert(DataSet: TDataSet);
    procedure QBancoConciliaCadCalcFields(DataSet: TDataSet);
    procedure QContaCorrenteCalcFields(DataSet: TDataSet);
    procedure QBancoMovimentoBeforePost(DataSet: TDataSet);
    procedure QBancoMovimentoBeforeDelete(DataSet: TDataSet);
    procedure QBancoAgenciaCalcFields(DataSet: TDataSet);
    procedure QBancoMovimentoCOD_CADASTROValidate(Sender: TField);
    procedure QBancoConciliaCadBeforeInsert(DataSet: TDataSet);
    procedure QBancoMovimentoIND_TIPO_CHEQUEChange(Sender: TField);
    procedure QBancoMovimentoAfterPost(DataSet: TDataSet);
    procedure QBcoMovimentoMovAfterRefreshRecord(Sender: TOracleDataSet);
    procedure QBcoMovimentoMovAfterInsert(DataSet: TDataSet);
    procedure QBcoMovimentoMovBeforeOpen(DataSet: TDataSet);
    procedure QBcoMovimentoMovBeforeDelete(DataSet: TDataSet);
    procedure QTaxaCartaoAfterInsert(DataSet: TDataSet);
    procedure QTaxaCartaoCalcFields(DataSet: TDataSet);
    procedure QContaCorrenteBeforePost(DataSet: TDataSet);
    procedure QTaxaCartaoBeforePost(DataSet: TDataSet);
  private
//    function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
{   procedure GeraConciliacao(wCod_Historico,
                              wCod_Conta_Corrente,
                              wNum_Cheque: Integer;
                              wDt_Movimento: TDateTime;
                              wVal_Movimento: Real;
                              wDesc_Observacao,
                              wDesc_Complemento1,
                              wDesc_Complemento2,
                              wInd_Operacao: String;
                              wCod_Bco_Movimento:Integer);  }
    { Private declarations }
  public
    { Public declarations }
    procedure IncluiBanco(wHistorico,
      wConta_Corrente,
      wNum_Cheque,
      wCadastro,
      wDepartamento: Integer;
      wDt_Movimento: TDateTime;
      wVal_Movimento: Real;
      wObservacao,
      wComplemento,
      wCod_Conta_Pagar_Cab, wCod_Conta_Receber_Cab, wPgto_Taxa_Cheque, wContrato_Mov: string;
      wCod_Bordero :Integer = 0);
    procedure EmiteCheque(wCod_Banco, wValor: Real; wData: TDateTime; wNominal, wCidade: string; Filial: Integer = 0);
    procedure EmiteChequeChronos(wFavorecido, wLocalidade, wCodBanco: string; wValor: Real; wData: TDate);
    procedure GeraMovBancario(wLBCheques: TStrings; wCod_Nota_Cab, wNota, wCadastro, wVendedor: Integer; wSerie: string);
  end;


const //constantes utilizadas para imprimir na chronos
  LEN_BUFFER = 100; //Tamanho dos Buffers de dados.
  BIT0 = 1;
  BIT1 = 2;
  BIT2 = 4;
  BIT3 = 8;
  BIT4 = 16;
  BIT5 = 32;
  BIT6 = 64;
  BIT7 = 128;

var
  DMBancoAgencia: TDMBancoAgencia;
  wHist_Ant, wCarga_Ant, wDep_Ant, wConta_Ant, wBanco_Destino_Ant: Integer;
  wSerie_Ant, wTipo_Cheque_Ant: string;


  //variaveis utilizadas pela impressora de cheques chronos
  hCom: THANDLE; //Handle da Porta Serial (API).
  dcb: TDCB; //Estrutura DCB (API).
  CommTimeouts: TCOMMTIMEOUTS; //Estrutura TCOMMTIMEOUTS(API).
  BytesEscritos: DWORD;
  BytesLidos: DWORD;
  BufferRecebe: array[0..LEN_BUFFER] of char; //Define o duffer.
  //fim - variaveis utilizadas pela impressora de cheques chronos

implementation

uses UOracle_cl, UBiblioteca, UUsuario_cl, UPlanilha_cl, UParamSistema_cl;

{$R *.DFM}

{function TDMBancoAgencia.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

  while Length(S) < Zeros do
      S := '0' + S;
  Result := S;
end; }

procedure TDMBancoAgencia.IncluiBanco(wHistorico,
  wConta_Corrente,
  wNum_Cheque,
  wCadastro,
  wDepartamento: Integer;
  wDt_Movimento: TDateTime;
  wVal_Movimento: Real;
  wObservacao,
  wComplemento,
  wCod_Conta_Pagar_Cab, wCod_Conta_Receber_Cab, wPgto_Taxa_Cheque, wContrato_Mov: string;
  wCod_Bordero :Integer = 0);
var
  wDesconto: real;
begin
  DMOracle.DBCemapa.StartTransaction;
  with DMBancoAgencia do
  begin
    QBancoMovimento.Close;
    QBancoMovimento.Open;
    QBancoMovimento.Insert;
    QBancoMovimentoCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
    QBancoMovimentoCod_Historico.Value := wHistorico;
    QBancoMovimentoCod_Conta_Corrente.Value := wConta_Corrente;
    QBancoMovimentoNum_Cheque.Value := wNum_Cheque;
    QBancoMovimentoDT_Movimento.Value := wDt_Movimento;
    QBancoMovimentoDT_Usuario.Value := Trunc(DMOracle.DataHoraServ);
    if wCadastro <> 0 then
      QBancoMovimentoCod_Cadastro.Value := wCadastro;
    QBancoMovimentoDesc_Observacao.Value := wObservacao;
    QBancoMovimentoDesc_Complemento1.Value := wComplemento;
    if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
      QBancoMovimentoCod_Departamento.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + FloatToStr(DMUsuario.CodUsuarioCorrente), True))
    else
      QBancoMovimentoCod_Departamento.Value := wDepartamento;
    if wCod_Conta_Pagar_Cab <> '' then
      QBancoMovimentoCod_Conta_Pagar_Cab.Value := StrToInt(wCod_Conta_Pagar_Cab);
    if wCod_Conta_Receber_Cab <> '' then
      QBancoMovimentoCod_Conta_Receber_Cab.Value := StrToInt(wCod_Conta_Receber_Cab);
    if wContrato_Mov <> '' then
      QBancoMovimentoCod_Contrato_Mov.Value := StrToInt(wContrato_Mov);
    //alterado por Fabio 16/12/2002
    if wPgto_Taxa_Cheque = 'S' then
    begin
      wDesconto := (wVal_Movimento * StrToFloat(DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.PERC_TAXA_LIMITE FROM TB_CONTA_CORRENTE,TB_BANCO_AGENCIA',
        ' TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA' +
        ' AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + IntToStr(wConta_Corrente)))) / 100;
      QBancoMovimentoVal_Movimento.Value := wVal_Movimento - wDesconto;
      QBancoMovimentoVal_Desconto_Taxa.Value := wDesconto;
      QBancoMovimentoInd_Pgto_Taxa.Value := 'SIM';
    end
    else
    begin
      QBancoMovimentoVal_Desconto_Taxa.Value := 0;
      QBancoMovimentoVal_Movimento.Value := wVal_Movimento;
      QBancoMovimentoInd_Pgto_Taxa.Value := 'NAO';
    end;
    if wCod_Bordero > 0 then
      QBancoMovimentoCOD_BORDERO.Value :=
        wCod_Bordero;
    //------------------------------------------------------------------------------------------------------------------
    QBancoMovimento.Post;
  end;
  try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na inclusão de movimento bancário', mtError, [mbOk],0);
    Abort;
  end;
end;

{Procedure TDMBancoAgencia.GeraConciliacao(wCod_Historico,
                                         wCod_Conta_Corrente,
                                         wNum_Cheque :Integer;
                                         wDt_Movimento:TDateTime;
                                         wVal_Movimento:Real;
                                         wDesc_Observacao,
                                         wDesc_Complemento1,
                                         wDesc_Complemento2,
                                         wInd_Operacao:String;
                                         wCod_Bco_Movimento:Integer);
begin
  with DMBancoAgencia do
    begin
      QBancoConciliaCad.Open;
      QBancoConciliaCad.Insert;
      QBancoConciliaCadCod_Historico.Value:=wCod_Historico;
      QBancoConciliaCadCod_Conta_Corrente.Value:=wCod_Conta_Corrente;
      QBancoConciliaCadNum_Cheque.Value:=wNum_Cheque;
      QBancoConciliaCadDt_Movimento.Value:=wDt_Movimento;
      QBancoConciliaCadDt_Sistema.Value:=DMOracle.DataHoraServ;
      if wInd_Operacao='-' then
        QBancoConciliaCadVal_Movimento.Value:=wVal_Movimento
      else
        QBancoConciliaCadVal_Movimento.Value:=wVal_Movimento*(-1);
      QBancoConciliaCadDesc_Observacao.Value:=wDesc_Observacao;
      QBancoConciliaCadDesc_Complemento1.Value:=wDesc_Complemento1;
      QBancoConciliaCadDesc_Complemento2.Value:=wDesc_Complemento2;
      QBancoConciliaCadCod_Bco_Movimento.Value:=wCod_Bco_Movimento;
      QBancoConciliaCad.Post;
      QBancoConciliaCad.Close;
    end;
end;      }



//Abre a porta serial especificada

function AbrirPorta(NomePorta: string): boolean;
begin
  hCom := CreateFile(
    PChar(NomePorta),
    GENERIC_READ or GENERIC_WRITE,
    0, //Dispositivos COM abertos com acesso exclusivo.
    nil, //Sem atributos de segurança.
    OPEN_EXISTING, //deve usar OPEN_EXISTING
    0, //Entrada e saída sem ovelap.
    0 //Deve ser NULL para COM.
    );
  if (hCom = INVALID_HANDLE_VALUE) then //Se houve algum erro ao abrir a porta.
    result := false
  else
    result := true;
end;

//DEFINE TIMEOUTs

function ConfiguraTimeOuts: boolean;
begin
  if not GetCommTimeouts(hCom, CommTimeouts) then
    result := false;

  CommTimeouts.ReadIntervalTimeout := 2;
  CommTimeouts.ReadTotalTimeoutMultiplier := 0;
  CommTimeouts.ReadTotalTimeoutConstant := 2;
  CommTimeouts.WriteTotalTimeoutMultiplier := 5;
  CommTimeouts.WriteTotalTimeoutConstant := 5;

  if not SetCommTimeouts(hCom, CommTimeouts) then
    result := false
  else
    result := true;
end;

//CONFIGURA PORTA SERIAL.

function ConfiguraControle: boolean;
begin
  if not GetCommState(hCom, dcb) then
    result := false;

  dcb.BaudRate := CBR_9600; //define velocidade em bps.
  dcb.ByteSize := 8; //define bits de dados.
  dcb.Parity := NOPARITY; //define paridade
  dcb.StopBits := ONESTOPBIT; //define stop bit.

  if not SetCommState(hCom, dcb) then
    result := false
  else
    result := true;
end;

procedure TDMBancoAgencia.EmiteChequeChronos(wFavorecido, wLocalidade, wCodBanco: string; wValor: Real; wData: TDate);
var
  wPorta, wComando: string;
begin
  inherited;
  wPorta := DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_PORTA_CHRONOS FROM TB_FILIAL, TB_CONTA_CORRENTE', 'TB_FILIAL.COD_FILIAL = TB_CONTA_CORRENTE.COD_FILIAL AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text, True);

  if AbrirPorta(wPorta) then //Abre a porta serial.  //funcao definida acima
  begin
    if ConfiguraControle() and ConfiguraTimeOuts() then //funcoes definida acima
    begin
      //FAVORECIDO
      wComando := chr(27) + chr(160) + wFavorecido + chr(13);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      //LOCALIDADE
      wComando := chr(27) + chr(161) + wLocalidade + chr(13);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      //BANCO
      wComando := chr(27) + chr(162) + wCodBanco + chr(13);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      //VALOR
      wComando := chr(27) + chr(163) + FormatFloat('0.00', wValor) + chr(13);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      //DATA
      wComando := chr(27) + chr(164) + FormatDateTime('dd/mm/yy', wData) + chr(13);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      //FIM - MANDA IMPRIMIR
      wComando := chr(27) + chr(176);
      WriteFile(hCom, PChar(wComando)^, length(wComando), BytesEscritos, nil);

      CloseHandle(hCom); //Fecha a porta Serial.
    end
    else
    begin
      CloseHandle(hCom); //Fecha a porta Serial.
      raise Exception.Create('A porta utilizada pela impressora está sendo usada no momento.');
    end
  end
  else
    raise Exception.Create('A porta utilizada pela impressora está sendo usada no momento.');
end;

procedure TDMBancoAgencia.EmiteCheque(wCod_Banco, wValor: Real; wData: TDateTime; wNominal, wCidade: string; Filial: Integer = 0);
var
  ContadorX, ContadorY, i, aux: integer;
  Extenso1, Extenso2, Mascara, wPorta: string;
  Ano, Mes: string;
  MyFile: TextFile;
begin
  with DMBancoAgencia do
  begin
    ContadorX := 1;
    wPorta := 'LPT1';
    if Filial > 0 then
      wPorta := DMOracle.FastSelect('DESC_LPT_CHEQUE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));
    AssignFile(MyFile, '\' + wPorta);
{$I-}
    Reset(MyFile);
{$I+}
    if IOResult <> 0 then
      ShowMessage('Erro ! Impressora não localizada na porta ' + wPorta)
    else
    begin
      Rewrite(MyFile);
      QBancoAgencia.Close;
      QBancoAgencia.SetVariable('PK', wCod_Banco);
      QBancoAgencia.Open;
      Extenso1 := '';
      Extenso2 := '';
      Write(MyFile, #27#71);
      for i := 1 to Trunc(QBancoAgenciaNum_Lin_Valor.Value) do
      begin
//              Writeln(MyFile,#27#15+' ');
        Writeln(MyFile, ' ');
        ContadorX := ContadorX + 1;
              // ContadorY:=1;
      end;
      for i := 1 to Trunc(QBancoAgenciaNum_Col_Valor.Value) do
      begin
//              Write(MyFile,#27#15+' ');
        Write(MyFile, ' ');
              // ContadorY:=ContadorY+1;
      end;
      Write(MyFile, FormatFloat('#,##0.00', wValor));
      ContadorY := 1;
      aux := ContadorX;
      for i := aux to Trunc(QBancoAgenciaNum_Lin_Val_Extenso.Value) do
      begin
        Writeln(MyFile);
        ContadorX := ContadorX + 1;
        ContadorY := 1;
      end;
      aux := ContadorY;
      for i := aux to Trunc(QBancoAgenciaNum_Col_Val_Extenso.Value) do
      begin
        Write(MyFile, ' ');
        ContadorY := ContadorY + 1;
      end;
      Extenso1 := Bib.Extenso(wValor, 'REAL');
      Extenso1 := Extenso1 + ' *.*.*. *.*.* *.*.*. *.*.*. *.*.*. *.*';
      if Length(Extenso1) > Int(QBancoAgenciaNum_Tam_Val_Extenso.Value) then
      begin
        i := Trunc(QBancoAgenciaNum_Tam_Val_Extenso.Value);
        while Extenso1[i] <> ' ' do
          Dec(i);
        Extenso2 := Copy(Extenso1, i, Length(Extenso1) - i);
        Extenso1 := Copy(UpperCase(Extenso1), 1, i);
      end;
      Write(MyFile, Extenso1);
      if Extenso2 <> '' then
      begin
        Writeln(MyFile);
        ContadorX := ContadorX + 1;
        ContadorY := 1;
        aux := ContadorY;
        for i := aux to Trunc(QBancoAgenciaNum_Col_Val_Extenso.Value) do
        begin
          Write(MyFile, ' ');
          ContadorY := ContadorY + 1;
        end;
        Write(MyFile, UpperCase(Extenso2));
      end;
      aux := ContadorX;
      for i := aux to Trunc(QBancoAgenciaNum_Lin_Nominal.Value) do
      begin
        Writeln(MyFile);
        ContadorY := 1;
        ContadorX := ContadorX + 1;
      end;
      aux := ContadorY;
      for i := aux to Trunc(QBancoAgenciaNum_Col_Nominal.Value) do
      begin
        Write(MyFile, ' ');
        ContadorY := ContadorY + 1;
      end;
      if Length(wNominal) > Int(QBancoAgenciaNum_Tam_Nominal.Value) then
        wNominal := Copy(wNominal, 1, trunc(QBancoAgenciaNum_Tam_Nominal.Value));
      Write(MyFile, wNominal);
      aux := ContadorX;
      if DMParamSistema.CodEmpresa <> 'TOFECO' then
        Write(MyFile, #27#15);
      for i := aux to Trunc(QBancoAgenciaNum_Lin_Cidade.Value) do
      begin
        Writeln(MyFile);
        ContadorY := 1;
        ContadorX := ContadorX + 1;
      end;
      aux := ContadorY;
      for i := aux to trunc(QBancoAgenciaNum_Col_Cidade.Value) do
      begin
        Write(MyFile, ' ');
        ContadorY := ContadorY + 1;
      end;
      Mascara := '';
      for i := 1 to trunc(QBancoAgenciaNum_Tam_Cidade.Value) do
        Mascara := Mascara + 'c';
      if Length(wCidade) > trunc(QBancoAgenciaNum_Tam_Cidade.Value) then
        wCidade := Copy(wCidade, 1, Trunc(QBancoAgenciaNum_Tam_Cidade.Value));
      Write(MyFile, FormatMaskText(Mascara, wCidade + ','));
      ContadorY := ContadorY + Trunc(QBancoAgenciaNum_Tam_Cidade.Value);
      aux := ContadorY;
      for i := aux to Trunc(QBancoAgenciaNum_Col_Dia.Value) do
      begin
        Write(MyFile, ' ');
        ContadorY := ContadorY + 1;
      end;
      aux := ContadorY;
      for i := aux to Trunc(QBancoAgenciaNum_Col_Mes.Value) do
      begin
        Mes := Mes + ' ';
        ContadorY := ContadorY + 1;
      end;
      aux := ContadorY + length(FormatDateTime('mmmm', wData));
      for i := aux to Trunc(QBancoAgenciaNum_Col_Ano.Value) do
      begin
        Ano := Ano + ' ';
              // ContadorY:=ContadorY+1;
      end;
      if Length(Trim(QBancoAgenciaDesc_Ano_Formato.Value)) = 1 then
      begin
        Write(myFile, FormatDateTime('dd' + Mes + 'mmmm' + Ano + Copy(FormatDateTime('yy', wData), 2, 1), wData));
      end
      else
        Write(myFile, FormatDateTime('dd' + Mes + 'mmmm' + Ano + QBancoAgenciaDesc_Ano_Formato.Value, wData));
      aux := ContadorX;
      for i := aux to Trunc(QBancoAgenciaNum_Lin_Final.Value) do
        Writeln(MyFile, ' ');
      if DMParamSistema.CodEmpresa <> 'TOFECO' then
        Write(MyFile, #27#18);
      CloseFile(MyFile);
    end;
  end;
  DMBancoAgencia.QBancoAgencia.Close;
end;

procedure TDMBancoAgencia.QContaCorrenteAfterInsert(DataSet: TDataSet);
begin
//  QContaCorrenteCod_Conta_Corrente.Value:=DMOracle.Sequencia('CONTA_CORRENTE');
  QContaCorrenteCod_Banco_Agencia.Value := QBancoAgenciaCod_Banco_Agencia.Value;
  QContaCorrentePRIMEIRA_INSTR_COD.Value := '00';
end;

procedure TDMBancoAgencia.QBancoAgenciaBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o Banco Agencia não estiver com a Transação em Aberto
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBancoAgencia.QBancoAgenciaBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o Banco Agencia não estiver com a Transação em Aberto
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBancoAgencia.QContaCorrenteBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o Banco Agencia não estiver com a Transação em Aberto
  begin
    raise Exception.Create('Não é Possível alterar ou incluir valores nesta conta. Edite antes o Banco ');
  end;
  if QBancoAgenciaCod_Banco_Agencia.Value <= 0 then
  begin
    raise Exception.Create('Não é possível incluir uma conta corrente sem um banco estar selecionado.');
  end;

  if QBancoAgencia.State = dsInsert then
  begin
    QBancoAgencia.post;
    QBancoAgencia.edit;
  end;
end;

procedure TDMBancoAgencia.QContaCorrenteBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o Banco Agencia não estiver com a Transação em Aberto
  begin
    raise Exception.Create('Não é Possível alterar ou incluir valores nesta conta. Edite antes o Banco ');
  end;
  if QBancoAgenciaCod_Banco_Agencia.Value <= 0 then
  begin
    raise Exception.Create('Não é possível incluir uma conta corrente sem um banco estar selecionado.');
  end;
  if QBancoAgencia.State = dsInsert then
  begin
    QBancoAgencia.post;
    QBancoAgencia.edit;
  end;
end;

procedure TDMBancoAgencia.QContaCorrenteAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QContaCorrenteCod_Conta_Corrente.Value;
  QContaCorrente.DisableControls;
  QContaCorrente.Close;
  QContaCorrente.Open;
  QContaCorrente.Locate('COD_CONTA_CORRENTE', wCodigo, []);
  QContaCorrente.EnableControls;
end;

procedure TDMBancoAgencia.QBancoMovimentoAfterInsert(DataSet: TDataSet);
begin
  QBancoMovimentoInd_deposito_Pendente.Value := 'NAO';
  QBancoMovimentoInd_Cheque_Devolvido.Value := 'NAO';
  QBancoMovimentoCod_usuario.Value := DMUsuario.CodUsuarioCorrente;
  QBancoMovimentoDt_Movimento.Value := DMOracle.DataServ;
  QBancoMovimentoDt_Usuario.Value := DMOracle.DataServ;
  QBancoMovimentoInd_Pgto_Taxa.Value := 'NAO';
  if wHist_Ant <> 0 then
     QBancoMovimentoCod_Historico.Value := wHist_Ant;
  if wCarga_Ant <> 0 then
     QBancoMovimentoNum_Carga.Value := wCarga_Ant;
  if wDep_Ant <> 0 then
     QBancoMovimentoCod_Departamento.Value := wDep_Ant;
  if wConta_Ant <> 0 then
     QBancoMovimentoCOD_CONTA_CORRENTE.Value := wConta_Ant;
  if wSerie_Ant <> '' then
     QBancoMovimentoCOD_SERIE.Value := wSerie_Ant;
  if wTipo_Cheque_Ant <> '' then
     QBancoMovimentoInd_Tipo_Cheque.Value := wTipo_Cheque_Ant;
  if wBanco_Destino_Ant <> 0 then
     QBancoMovimentoCod_Banco_Destino.Value := wBanco_Destino_Ant;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL' then
     QBancoMovimentoIND_DEPOSITO_PENDENTE.Value := 'SIM';
end;

procedure TDMBancoAgencia.QBancoAgenciaBeforeCancel(DataSet: TDataSet);
begin
  if QContaCorrente.State in [dsInsert, DSEdit] then
    QContaCorrente.Cancel;
end;

procedure TDMBancoAgencia.QBancoAgenciaBeforePost(DataSet: TDataSet);
begin
  if QContaCorrente.State in [dsInsert, DSEdit] then
    QContaCorrente.Post;
  QContaCorrenteDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + CHR(39) + QContaCorrenteCod_filial.Text + CHR(39), True);
  QBancoAgenciaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;  
end;

procedure TDMBancoAgencia.QBancoAgenciaAfterInsert(DataSet: TDataSet);
begin
  DataSet['IND_TIPO_JURO'] := 'VALOR';
//  DataSet['COD_BANCO_AGENCIA']:=DMOracle.Sequencia('BANCO_AGENCIA');
end;

procedure TDMBancoAgencia.QBancoMovimentoCalcFields(DataSet: TDataSet);
var
  wTesta_Nulo: string;
begin
{  If QBancoMovimentocod_historico.Text <> '' Then
     QBancoMovimentodesc_historico.Value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QBancoMovimentocod_historico.Value));
  If QBancoMovimentocod_conta_corrente.Text <> '' Then
     QBancoMovimentodesc_ccorrente.Value:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+FloatToStr(QBancoMovimentocod_conta_corrente.Value));
  If QBancoMovimentocod_departamento.Text <> '' Then
     QBancoMovimentodesc_departamento.Value:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+FloatToStr(QBancoMovimentocod_departamento.Value));
 }if QBancoMovimentocod_conta_corrente.Text <> '' then
    wTesta_Nulo := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QBancoMovimentocod_conta_corrente.Value), True);
  if wtesta_nulo <> '' then
    QBancoMovimentocod_banco_agencia.Value := StrToFloat(wTesta_Nulo);

  if Trim(QBancoMovimentoCod_Cadastro.text) <> '' then
    QBancoMovimentodesc_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QBancoMovimentocod_cadastro.Value), True);
{
  If Trim(QBancoMovimentoCod_Vendedor.text) <> ''  then
    QBancoMovimentodesc_vendedor.Value:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QBancoMovimentocod_vendedor.Value))
  else
    QBancoMovimentodesc_vendedor.Value:='';  }

  if QBancoMovimentocod_historico.Text <> '' then
    QBancoMovimentoind_operacao.Value := DMOracle.BuscaNome('SELECT IND_OPERACAO FROM TB_HISTORICO', 'COD_HISTORICO = ' + FloatToStr(QBancoMovimentocod_historico.Value), True);
end;

procedure TDMBancoAgencia.QBancoMovimentoBeforeInsert(DataSet: TDataSet);
begin
  if not (DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBancoAgencia.QBancoMovimentoBeforeEdit(DataSet: TDataSet);
begin
  if not (DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBancoAgencia.QBancoConciliaCadAfterInsert(DataSet: TDataSet);
begin
//  QBancoConciliaCadCod_Bco_Concilia.Value:=DMOracle.Sequencia('BANCO_CONCILIA');
  QBancoConciliaCadDt_Movimento.Value := DMOracle.DataServ;
  QBancoConciliaCadDt_Sistema.Value := DMOracle.DataHoraServ;
end;

procedure TDMBancoAgencia.QBancoConciliaCadCalcFields(DataSet: TDataSet);
begin
  QBancoConciliaCaddesc_historico.Value := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO', 'COD_HISTORICO = ' + FloatToStr(QBancoConciliaCadcod_historico.Value), True);
  QBancoConciliaCaddesc_conta_corrente.Value := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QBancoConciliaCadcod_conta_corrente.Value), True);
end;

procedure TDMBancoAgencia.QContaCorrenteCalcFields(DataSet: TDataSet);
begin
  QContaCorrenteDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(QContaCorrenteCod_filial.Value), True);
end;

procedure TDMBancoAgencia.QBancoMovimentoBeforePost(DataSet: TDataSet);
begin
  DMBancoAgencia.QBancoMovimentoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  DMBancoAgencia.QBancoMovimentoDT_USUARIO.Value := DMOracle.Dataserv;

  // Gera Conciliação
{  If Trim(QBancoMovimentoCod_Cadastro.text) <> ''  then
    QBancoMovimentoCOD_VENDEDOR.Text:=DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QBancoMovimentocod_cadastro.Value));

  If QBancoMovimentoVal_Movimento.Value <> 0 Then
    if DMOracle.BuscaNome('SELECT IND_CONCILIA FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Historico.Value))='S' then
      begin
        with DMBancoAgencia do
          begin
            GeraConciliacao(QBancoMovimentoCod_Historico.Value,
                            QBancoMovimentoCod_Conta_Corrente.Value,
                            QBancoMovimentoNum_Cheque.Value,
                            QBancoMovimentoDt_Movimento.Value,
                            QBancoMovimentoVal_Movimento.Value,
                            QBancoMovimentoDesc_Observacao.Value,
                            Trim(QBancoMovimentoDesc_Complemento1.Value)+Trim(QBancoMovimentoDesc_Cadastro.Value),
                            QBancoMovimentoDesc_Complemento2.Value,
                            QBancoMovimentoind_operacao.Value,
                            QBancoMovimentoCod_Bco_Movimento.Value);
          end;
      end;  }
end;

procedure TDMBancoAgencia.QBancoMovimentoBeforeDelete(DataSet: TDataSet);
begin
  QExcluiConcilia.Close;
  QExcluiConcilia.SetVariable('COD_BCO_MOVIMENTO', QBancoMovimentoCod_Bco_Movimento.Value);
  QExcluiConcilia.ExecSQL;
end;

procedure TDMBancoAgencia.QBancoAgenciaCalcFields(DataSet: TDataSet);
begin
  QBancoAgenciaDesc_contabil_Desc_cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Juro_deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Juro_Bco_deb.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Prin_deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Prin_Bco_deb.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Desc_deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Desc_Bco_deb.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Juro_cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Juro_Bco_cred.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Prin_cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Prin_Bco_cred.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_valor_filial.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Valor_Filial.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Contrapartida.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Contrapartida.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Taxa_Cred.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Taxa_Cred.Value + chr(39), True);
  QBancoAgenciaDesc_contabil_Taxa_Deb.value := DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + chr(39) + QBancoAgenciaCod_Contabil_Vl_Taxa_Deb.Value + chr(39), True);
  if QBancoAgenciaCod_Historico_Caixa_Taxa.Text <> '' then
    QBancoAgenciaDesc_historico_caixa_taxa.value := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO', 'COD_HISTORICO = ' + QBancoAgenciaCod_Historico_Caixa_Taxa.Text, True);
end;

procedure TDMBancoAgencia.QBancoMovimentoCOD_CADASTROValidate(
  Sender: TField);
begin
  if Trim(QBancoMovimentoCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO', ' COD_CADASTRO = ' + QBancoMovimentoCOD_CADASTRO.Text, True)) <> '' then
      raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
  end;
end;

procedure TDMBancoAgencia.QBancoConciliaCadBeforeInsert(DataSet: TDataSet);
begin
  if not (DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMBancoAgencia.QBancoMovimentoIND_TIPO_CHEQUEChange(
  Sender: TField);
begin
  QBancoMovimentoDt_Envia_Banco.Value := DMOracle.DataServ;
end;

procedure TDMBancoAgencia.QBancoMovimentoAfterPost(DataSet: TDataSet);
begin
  wHist_Ant := QBancoMovimentoCod_Historico.Value;
  wCarga_Ant := QBancoMovimentoNum_Carga.Value;
  wDep_Ant := QBancoMovimentoCod_Departamento.Value;
  wConta_Ant := QBancoMovimentoCOD_CONTA_CORRENTE.Value;
  wSerie_Ant := QBancoMovimentoCOD_SERIE.Value;
  wTipo_Cheque_Ant := QBancoMovimentoInd_Tipo_Cheque.Value;
  wBanco_Destino_Ant := QBancoMovimentoCod_Banco_Destino.Value;
end;

procedure TDMBancoAgencia.QBcoMovimentoMovAfterRefreshRecord(
  Sender: TOracleDataSet);
begin
//  QBancoMovCons.RefreshRecord;
end;

procedure TDMBancoAgencia.QBcoMovimentoMovAfterInsert(DataSet: TDataSet);
begin
  DMBancoAgencia.QBcoMovimentoMovCOD_BCO_MOVIMENTO.value := DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Value;
end;

procedure TDMBancoAgencia.QBcoMovimentoMovBeforeOpen(DataSet: TDataSet);
begin
  DMBancoAgencia.QBcoMovimentoMov.SetVariable('COD_BCO_MOVIMENTO', DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Value);
end;

procedure TDMBancoAgencia.QBcoMovimentoMovBeforeDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  if QBcoMovimentoMovCOD_BCO_MOVIMENTO_BAIXA.Value <> 0 then
  begin
    OPContabilidade.CallProcedure('DESCONTABILIZA', [QBcoMovimentoMovCOD_BCO_MOVIMENTO_BAIXA.Value, 'BC']);

    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BCO_MOVIMENTO WHERE COD_BCO_MOVIMENTO = ' +
      inttostr(QBcoMovimentoMovCOD_BCO_MOVIMENTO_BAIXA.Value));
    DMOracle.QExecSQL.ExecSQL;
  end;

  if QBcoMovimentoMovCOD_CAIXA_MOV_BAIXA.Value <> 0 then
  begin
    OPContabilidade.CallProcedure('DESCONTABILIZA', [QBcoMovimentoMovCOD_CAIXA_MOV_BAIXA.Value, 'CX']);

    DMOracle.QExecSQL.close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CAIXA_MOV WHERE COD_CAIXA_MOV = ' +
      inttostr(QBcoMovimentoMovCOD_CAIXA_MOV_BAIXA.Value));
    DMOracle.QExecSQL.ExecSQL;
  end;
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMBancoAgencia.GeraMovBancario(wLBCheques: TStrings; wCod_Nota_Cab, wNota, wCadastro, wVendedor: Integer; wSerie: string);
var
  wAux: string;
  wCont: Integer;
begin
  QBancoMovimento.Close;
  QBancoMovimento.Open;
  for wCont := 0 to wLBCheques.Count - 1 do
  begin
    QBancoMovimento.Insert;
    wAux := Copy(wLBCheques[wCont], 37, 13);
    wAux := Bib.LimpaString(wAux, '.');
    QBancoMovimentoCOD_HISTORICO.Value := StrToInt(Trim(Copy(wLBCheques[wCont], 19, 6)));
    QBancoMovimentoCOD_CONTA_CORRENTE.Value := StrToInt(Trim(Copy(wLBCheques[wCont], 1, 6)));
    QBancoMovimentoNUM_CHEQUE.Value := StrToInt(Trim(Copy(wLBCheques[wCont], 28, 6)));
    QBancoMovimentoDT_MOVIMENTO.Value := StrToDate(Trim(Copy(wLBCheques[wCont], 52, 10)));
    QBancoMovimentoVAL_MOVIMENTO.Value := StrToFloat(wAux);
    QBancoMovimentoDESC_OBSERVACAO.Value := Trim(Copy(wLBCheques[wCont], 65, 40));
    QBancoMovimentoDESC_COMPLEMENTO1.Value := Trim(Copy(wLBCheques[wCont], 108, 40));
    QBancoMovimentoCOD_NOTA_CAB.Value := wCod_Nota_Cab;
    QBancoMovimentoNUM_NOTA.Value := wNota;
    QBancoMovimentoCOD_SERIE.Value := wSerie;
    QBancoMovimentoCOD_CADASTRO.Value := wCadastro;
    QBancoMovimentoCOD_DEPARTAMENTO.Value := StrToInt(Trim(Copy(wLBCheques[wCont], 10, 6)));
    QBancoMovimentoCOD_VENDEDOR.Value := wVendedor;
    QBancoMovimento.Post;
  end;



end;

procedure TDMBancoAgencia.QTaxaCartaoAfterInsert(DataSet: TDataSet);
begin
  QTaxaCartaoCod_Banco_Agencia.Value := QBancoAgenciaCod_Banco_Agencia.Value;
end;

procedure TDMBancoAgencia.QTaxaCartaoCalcFields(DataSet: TDataSet);
begin
  if QTaxaCartaoCOD_BANDEIRA_CARTAO.Text <> '' then
    QTaxaCartaodesc_bandeira_cartao.Text := DMOracle.FastSelect('DESC_BANDEIRA_CARTAO','TB_BANDEIRA_CARTAO','COD_BANDEIRA_CARTAO = ' + QTaxaCartaoCOD_BANDEIRA_CARTAO.Text)
end;

procedure TDMBancoAgencia.QContaCorrenteBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContaCorrenteCOD_FILIAL.Text);
  QContaCorrenteCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMBancoAgencia.QTaxaCartaoBeforePost(DataSet: TDataSet);
begin
  QTaxaCartaoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.

