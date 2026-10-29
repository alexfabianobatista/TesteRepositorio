unit UContasReceber_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Math, OracleData, OraTeste, Oracle, DBClient, Provider;

type
  TDMContasReceber = class(TDataModule)
    DSContasReceber: TDataSource;
    DSContasReceber_Mov: TDataSource;
    DSContasReceberBaixa: TDataSource;
    DSContasReceberBaixaMov: TDataSource;
    DSLiberaBaixa: TDataSource;
    QRemessa: TOracleDataSet1;
    QRemessaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRemessaNUM_TITULO: TIntegerField;
    QRemessaNUM_PARCELA: TIntegerField;
    QRemessaDESC_TIPO_DOCUMENTO: TStringField;
    QRemessaDT_MOVIMENTO: TDateTimeField;
    QRemessaDT_BAIXA: TDateTimeField;
    QRemessaDT_VENCIMENTO: TDateTimeField;
    QRemessaDT_EMISSAO: TDateTimeField;
    QRemessaDT_CAPITALIZACAO: TDateTimeField;
    QRemessaVAL_TITULO: TFloatField;
    QRemessaVAL_NEGOCIO: TFloatField;
    QRemessaIND_ACEITE: TStringField;
    QRemessaVAL_ORIGINAL: TFloatField;
    QRemessaCOD_NOSSO_NUMERO: TStringField;
    QRemessaVAL_JUROS: TFloatField;
    QRemessaDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRemessaCOD_CONTA_CORRENTE: TIntegerField;
    QRemessaDESC_CONTA_CORRENTE: TStringField;
    QRemessaVARIACAO: TIntegerField;
    QRemessaCOMANDO: TIntegerField;
    QRemessaCOD_CADASTRO: TIntegerField;
    QRemessaNOME: TStringField;
    QRemessaNUM_CGC_CPF: TStringField;
    QRemessaDESC_TELEFONE: TStringField;
    QRemessaDESC_CELULAR: TStringField;
    QRemessaDESC_BAIRRO: TStringField;
    QRemessaDESC_FANTASIA: TStringField;
    QRemessaDESC_CIDADE_COBRANCA: TStringField;
    QRemessaDESC_ENDERECO_COBRANCA: TStringField;
    QRemessaDESC_ESTADO_COBRANCA: TStringField;
    QRemessaDESC_CEP_COBRANCA: TStringField;
    QRemessaDESC_TELEFONE_COMERCIAL: TStringField;
    QRemessaCOD_BANCO_AGENCIA: TIntegerField;
    QRemessaDESC_BANCO_AGENCIA: TStringField;
    QRemessaDESC_SIGLA: TStringField;
    QRemessaDESC_LOCAL_PGTO_BLOQ: TStringField;
    QRemessaDESC_INSTRUCAO_BLOQUETO: TStringField;
    QRemessaIND_TIPO_JURO: TStringField;
    QRemessaPERC_JURO_BLOQUETO: TFloatField;
    QRemessaCOD_BANCO: TIntegerField;
    QRemessaCOD_AGENCIA: TIntegerField;
    QRemessaCOD_CONTABIL_VALOR_FILIAL: TStringField;
    QRemessaNUM_INSCR_CEDENTE: TFloatField;
    QRemessaPREFIXO_AGENCIA: TIntegerField;
    QRemessaDIGITO_VERIFICADOR_AGENCIA: TStringField;
    QRemessaDIGITO_VERIFICADOR_CEDENTE: TStringField;
    QRemessaNOSSO_NUMERO: TFloatField;
    QRemessaDIGITO_VERIFICADOR_N_NR: TStringField;
    QRemessaDESC_FILIAL: TStringField;
    QRemessaCOD_FILIAL: TIntegerField;
    QRemessaNUM_CGC: TStringField;
    QRemessaPRIMEIRA_INSTR_COD: TStringField;
    QRComissao: TOracleDataSet1;
    QRComissaoNUM_TITULO: TFloatField;
    QRComissaoDATA: TDateTimeField;
    QRComissaoNOME_VENDEDOR: TStringField;
    QRComissaoSVAL_TOTAL: TFloatField;
    QContasReceberBaixa: TOracleDataSet1;
    QContasReceberBaixaNOME: TStringField;
    QContasReceberBaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceberBaixaCOD_FINALIDADE: TIntegerField;
    QContasReceberBaixaCOD_BANCO_AGENCIA: TIntegerField;
    QContasReceberBaixaCOD_CADASTRO: TIntegerField;
    QContasReceberBaixaCOD_FILIAL: TIntegerField;
    QContasReceberBaixaCOD_DEPARTAMENTO: TIntegerField;
    QContasReceberBaixaNUM_TITULO: TIntegerField;
    QContasReceberBaixaNUM_PARCELA: TIntegerField;
    QContasReceberBaixaDESC_TIPO_DOCUMENTO: TStringField;
    QContasReceberBaixaDT_MOVIMENTO: TDateTimeField;
    QContasReceberBaixaDT_BAIXA: TDateTimeField;
    QContasReceberBaixaDT_VENCIMENTO: TDateTimeField;
    QContasReceberBaixaDT_EMISSAO: TDateTimeField;
    QContasReceberBaixaDT_CAPITALIZACAO: TDateTimeField;
    QContasReceberBaixaDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContasReceberBaixaVAL_TITULO: TFloatField;
    QContasReceberBaixaCOD_NOTA_CAB: TIntegerField;
    QContasReceberBaixaDESC_OBSERVACAO: TStringField;
    QContasReceberBaixaIND_ACEITE: TStringField;
    QContasReceberBaixaIND_SITUACAO: TStringField;
    QContasReceberBaixaVAL_ORIGINAL: TFloatField;
    QContasReceberBaixaVAL_JUROS: TFloatField;
    QRContasReceber_Recebidos: TOracleDataSet1;
    QRContasReceber_RecebidosNUM_TITULO: TFloatField;
    QRContasReceber_RecebidosNUM_PARCELA: TFloatField;
    QRContasReceber_RecebidosDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_RecebidosVAL_TITULO: TFloatField;
    QRContasReceber_RecebidosCOD_CADASTRO: TFloatField;
    QRContasReceber_RecebidosDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_RecebidosNOME: TStringField;
    QRContasReceber_RecebidosVAL_PRINCIPAL: TFloatField;
    QRContasReceber_RecebidosVAL_DESCONTO: TFloatField;
    QRContasReceber_RecebidosVAL_JUROS: TFloatField;
    QCadastroSCI: TOracleDataSet1;
    QCadastroSCICOD_CADASTRO: TIntegerField;
    QCadastroSCICOD_MOTIVO: TIntegerField;
    QCadastroSCICOD_TIPO_CADASTRO: TIntegerField;
    QCadastroSCICOD_REGIAO: TIntegerField;
    QCadastroSCICOD_PAIS: TIntegerField;
    QCadastroSCICOD_ESTADO_CIVIL: TIntegerField;
    QCadastroSCICOD_RAMO: TIntegerField;
    QCadastroSCICOD_ESTADO: TStringField;
    QCadastroSCINOME: TStringField;
    QCadastroSCIDESC_ENDERECO: TStringField;
    QCadastroSCIDESC_CIDADE: TStringField;
    QCadastroSCIDESC_CEP: TStringField;
    QCadastroSCINUM_CGC_CPF: TStringField;
    QCadastroSCIDT_CADASTRO: TDateTimeField;
    QCadastroSCIIND_SEXO_CATEGORIA: TStringField;
    QCadastroSCINUM_CAIXA_POSTAL: TIntegerField;
    QCadastroSCIDT_CANCELAMENTO: TDateTimeField;
    QCadastroSCIDESC_TELEFONE: TStringField;
    QCadastroSCIDESC_CELULAR: TStringField;
    QCadastroSCINOME_CONTATO: TStringField;
    QCadastroSCIDT_NASCIMENTO: TDateTimeField;
    QCadastroSCIDESC_BAIRRO: TStringField;
    QCadastroSCIPERC_FUNRURAL: TFloatField;
    QCadastroSCIVAL_LIMITE: TFloatField;
    QCadastroSCIDESC_FANTASIA: TStringField;
    QCadastroSCIDESC_CIDADE_COBRANCA: TStringField;
    QCadastroSCIDESC_ENDERECO_COBRANCA: TStringField;
    QCadastroSCIDESC_ESTADO_COBRANCA: TStringField;
    QCadastroSCIDESC_CEP_COBRANCA: TStringField;
    QCadastroSCIDESC_TELEFONE_COMERCIAL: TStringField;
    QCadastroSCINUM_JUNTA: TIntegerField;
    QCadastroSCIDT_FUNDACAO: TDateTimeField;
    QCadastroSCIDT_JUNTA: TDateTimeField;
    QCadastroSCIDESC_FAX: TStringField;
    QCadastroSCINOME_MAE: TStringField;
    QCadastroSCINOME_PAI: TStringField;
    QCadastroSCIDESC_NATURALIDADE: TStringField;
    QCadastroSCIDESC_ESTADO_NATURAL: TStringField;
    QCadastroSCIDT_EXPEDICAO_IDENTIDADE: TDateTimeField;
    QCadastroSCIDESC_E_MAIL: TStringField;
    QCadastroSCIDESC_FAX_COBRANCA: TStringField;
    QCadastroSCIIND_SEPROC_SIMNAO: TStringField;
    QCadastroSCIDESC_INSCRICAO_MUNICIPAL: TStringField;
    QCadastroSCINOME_CONJUGE: TStringField;
    QCadastroSCIDESC_CPF_CONJUGE: TStringField;
    QCadastroSCIDESC_IDENTIDADE_CONJUGE: TStringField;
    QCadastroSCICOD_CLASS_CADASTRO: TIntegerField;
    QCadastroSCICOD_BANCO_AGENCIA: TIntegerField;
    QCadastroSCICOD_OPERACAO_CC: TIntegerField;
    QCadastroSCIDT_NASCIMENTO_CONTATO: TDateTimeField;
    QCadastroSCINOME_CONTATO2: TStringField;
    QCadastroSCIDT_NASCIMENTO2: TDateTimeField;
    QCadastroSCICOD_VENDEDOR: TIntegerField;
    QCadastroSCICOD_CONTA_RECEBER_CAB: TIntegerField;
    QCadastroSCICOD_FINALIDADE: TIntegerField;
    QCadastroSCICOD_BANCO_AGENCIA_1: TIntegerField;
    QCadastroSCICOD_FILIAL: TIntegerField;
    QCadastroSCINUM_TITULO: TIntegerField;
    QCadastroSCINUM_PARCELA: TIntegerField;
    QCadastroSCIDESC_TIPO_DOCUMENTO: TStringField;
    QCadastroSCIDT_MOVIMENTO: TDateTimeField;
    QCadastroSCIDT_BAIXA: TDateTimeField;
    QCadastroSCIDT_VENCIMENTO: TDateTimeField;
    QCadastroSCIDT_EMISSAO: TDateTimeField;
    QCadastroSCIDT_CAPITALIZACAO: TDateTimeField;
    QCadastroSCIVAL_TITULO: TFloatField;
    QCadastroSCIVAL_NEGOCIO: TFloatField;
    QCadastroSCIIND_ACEITE: TStringField;
    QCadastroSCIIND_SITUACAO: TStringField;
    QCadastroSCIDESC_OBSERVACAO: TStringField;
    QCadastroSCICOD_NOTA_CAB: TIntegerField;
    QCadastroSCIVAL_ORIGINAL: TFloatField;
    QCadastroSCICOD_NOSSO_NUMERO: TStringField;
    QCadastroSCIVAL_JUROS: TFloatField;
    QCadastroSCICOD_DEPARTAMENTO: TIntegerField;
    QRContasReceber_Receb_Bco: TOracleDataSet1;
    QRContasReceber_Receb_BcoNUM_TITULO: TFloatField;
    QRContasReceber_Receb_BcoNUM_PARCELA: TFloatField;
    QRContasReceber_Receb_BcoDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_Receb_BcoVAL_TITULO: TFloatField;
    QRContasReceber_Receb_BcoCOD_CADASTRO: TFloatField;
    QRContasReceber_Receb_BcoDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_Receb_BcoNOME: TStringField;
    QRContasReceber_Receb_BcoVAL_PRINCIPAL: TFloatField;
    QRContasReceber_Receb_BcoVAL_DESCONTO: TFloatField;
    QRContasReceber_Receb_BcoVAL_JUROS: TFloatField;
    QRRecibos: TOracleDataSet1;
    QRRecibosCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRRecibosCOD_FILIAL: TIntegerField;
    QRRecibosCOD_FINALIDADE: TIntegerField;
    QRRecibosCOD_BANCO_AGENCIA: TIntegerField;
    QRRecibosCOD_CADASTRO: TIntegerField;
    QRRecibosNUM_TITULO: TIntegerField;
    QRRecibosNUM_PARCELA: TIntegerField;
    QRRecibosDESC_TIPO_DOCUMENTO: TStringField;
    QRRecibosDT_MOVIMENTO: TDateTimeField;
    QRRecibosDT_BAIXA: TDateTimeField;
    QRRecibosDT_VENCIMENTO: TDateTimeField;
    QRRecibosDT_EMISSAO: TDateTimeField;
    QRRecibosDT_CAPITALIZACAO: TDateTimeField;
    QRRecibosDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRRecibosVAL_TITULO: TFloatField;
    QRRecibosVAL_JUROS: TFloatField;
    QRRecibosCOD_NOTA_CAB: TIntegerField;
    QRRecibosDESC_OBSERVACAO: TStringField;
    QRRecibosIND_ACEITE: TStringField;
    QRRecibosIND_SITUACAO: TStringField;
    QRRecibosVAL_ORIGINAL: TFloatField;
    QRRecibosDESC_FILIAL: TStringField;
    QRRecibosVal_Juros_calc: TFloatField;
    QRContasReceber_TitVenc: TOracleDataSet1;
    QRContasReceber_TitVencCOD_CADASTRO: TIntegerField;
    QAtuBloq: TOracleDataSet1;
    QRCReceber_mov: TOracleDataSet1;
    QRCReceber_movCOD_CADASTRO: TIntegerField;
    QRCReceber_movCOD_FILIAL: TIntegerField;
    QRCReceber_movNUM_TITULO: TIntegerField;
    QRCReceber_movNUM_PARCELA: TIntegerField;
    QRCReceber_movDT_MOVIMENTO: TDateTimeField;
    QRCReceber_movCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRCReceber_movCOD_CONTA_RECEBER_MOV: TIntegerField;
    QRCReceber_movVAL_MOVIMENTO: TFloatField;
    QRCReceber_movDESC_OBSERVACAO: TStringField;
    QRCReceber_movIND_TIPO_MOVIMENTO: TStringField;
    QRCReceber_movDT_USUARIO: TDateTimeField;
    QRCReceber_movCOD_USUARIO: TIntegerField;
    QRCReceber_movNOME: TStringField;
    QRCReceber_movDESC_FILIAL: TStringField;
    QNotaSaidaCons: TOracleDataSet1;
    QNotaSaidaConsCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaConsNOME: TStringField;
    QNotaSaidaConsDT_RECEBIMENTO: TDateTimeField;
    QNotaSaidaConsNUM_NOTA: TIntegerField;
    QNotaSaidaConsCOD_SERIE: TStringField;
    QRContasReceber_TitulosBaixados: TOracleDataSet1;
    QRContasReceber_TitulosBaixadosNOME: TStringField;
    QRContasReceber_TitulosBaixadosCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_TitulosBaixadosCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_TitulosBaixadosCOD_FINALIDADE: TIntegerField;
    QRContasReceber_TitulosBaixadosCOD_BANCO_AGENCIA: TIntegerField;
    QRContasReceber_TitulosBaixadosCOD_FILIAL: TIntegerField;
    QRContasReceber_TitulosBaixadosCOD_CADASTRO: TIntegerField;
    QRContasReceber_TitulosBaixadosNUM_TITULO: TIntegerField;
    QRContasReceber_TitulosBaixadosNUM_PARCELA: TIntegerField;
    QRContasReceber_TitulosBaixadosDESC_TIPO_DOCUMENTO: TStringField;
    QRContasReceber_TitulosBaixadosDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_TitulosBaixadosDT_BAIXA: TDateTimeField;
    QRContasReceber_TitulosBaixadosDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_TitulosBaixadosDT_CAPITALIZACAO: TDateTimeField;
    QRContasReceber_TitulosBaixadosDT_EMISSAO: TDateTimeField;
    QRContasReceber_TitulosBaixadosVAL_ORIGINAL: TFloatField;
    QRContasReceber_TitulosBaixadosVAL_TITULO: TFloatField;
    QRContasReceber_TitulosBaixadosDESC_FILIAL: TStringField;
    QRContasReceber_TitulosBaixadosValorPago: TFloatField;
    QRContasReceber_Tit_Abertos_vend: TOracleDataSet1;
    QRContasReceber_Saldos: TOracleDataSet1;
    QRContasReceber_SaldosTOT_VENCIDO_30: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_30: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_60: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_60: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_90: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_90: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_120: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_120: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_150: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_150: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_180: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_180: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_210: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_210: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_240: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_240: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_270: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_270: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_300: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_300: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_330: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_330: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO_360: TFloatField;
    QRContasReceber_SaldosTOT_VENCER_360: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDOACIMA_360: TFloatField;
    QRContasReceber_SaldosTOT_VENCERACIMA_360: TFloatField;
    QRContasReceber_SaldosTOT_VENCIDO: TFloatField;
    QRContasReceber_SaldosTOT_VENCER: TFloatField;
    QContasReceber_Cab: TOracleDataSet1;
    QContasReceber_CabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceber_CabCOD_FINALIDADE: TIntegerField;
    QContasReceber_CabCOD_BANCO_AGENCIA: TIntegerField;
    QContasReceber_CabCOD_FILIAL: TIntegerField;
    QContasReceber_CabNUM_TITULO: TIntegerField;
    QContasReceber_CabNUM_PARCELA: TIntegerField;
    QContasReceber_CabDESC_TIPO_DOCUMENTO: TStringField;
    QContasReceber_CabDT_MOVIMENTO: TDateTimeField;
    QContasReceber_CabDT_BAIXA: TDateTimeField;
    QContasReceber_CabDT_VENCIMENTO: TDateTimeField;
    QContasReceber_CabDT_EMISSAO: TDateTimeField;
    QContasReceber_CabDT_CAPITALIZACAO: TDateTimeField;
    QContasReceber_CabDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContasReceber_CabVAL_TITULO: TFloatField;
    QContasReceber_CabVAL_NEGOCIO: TFloatField;
    QContasReceber_CabIND_ACEITE: TStringField;
    QContasReceber_CabIND_SITUACAO: TStringField;
    QContasReceber_CabDESC_OBSERVACAO: TStringField;
    QContasReceber_CabCOD_NOTA_CAB: TIntegerField;
    QContasReceber_CabCOD_CADASTRO: TIntegerField;
    QContasReceber_CabVAL_ORIGINAL: TFloatField;
    QContasReceber_CabVAL_PROMISSORIA: TFloatField;
    QContasReceber_CabVAL_JUROS: TFloatField;
    QContasReceber_CabCOD_DEPARTAMENTO: TIntegerField;
    QContasReceber_CabCOD_CONTRATO_VEND: TIntegerField;
    QContasReceber_CabDESC_AVALISTA1: TStringField;
    QContasReceber_CabDESC_AVALISTA2: TStringField;
    QContasReceber_CabCOD_VENDEDOR: TIntegerField;
    QContasReceber_CabPERC_COMISSAO: TFloatField;
    QContasReceber_CabCOD_NOSSO_NUMERO: TStringField;
    QRContasReceber_Cab: TOracleDataSet1;
    QRContasReceber_CabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_CabCOD_FINALIDADE: TIntegerField;
    QRContasReceber_CabCOD_BANCO_AGENCIA: TIntegerField;
    QRContasReceber_CabCOD_FILIAL: TIntegerField;
    QRContasReceber_CabNUM_TITULO: TIntegerField;
    QRContasReceber_CabNUM_PARCELA: TIntegerField;
    QRContasReceber_CabDESC_TIPO_DOCUMENTO: TStringField;
    QRContasReceber_CabDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_CabDT_BAIXA: TDateTimeField;
    QRContasReceber_CabDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_CabDT_EMISSAO: TDateTimeField;
    QRContasReceber_CabDT_CAPITALIZACAO: TDateTimeField;
    QRContasReceber_CabDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRContasReceber_CabVAL_TITULO: TFloatField;
    QRContasReceber_CabCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_CabDESC_OBSERVACAO: TStringField;
    QRContasReceber_CabIND_ACEITE: TStringField;
    QRContasReceber_CabIND_SITUACAO: TStringField;
    QRContasReceber_CabVAL_ORIGINAL: TFloatField;
    QRContasReceber_CabVAL_JUROS: TFloatField;
    QRContasReceber_CabNOME: TStringField;
    QRContasReceber_CabNUM_CGC_CPF: TStringField;
    QRContasReceber_CabCOD_CADASTRO: TIntegerField;
    QRContasReceber_CabDESC_CLASSIFICACAO: TStringField;
    QRContasReceber_CabPERC_TAXA: TFloatField;
    QRContasReceber_CabCOD_MOEDA: TIntegerField;
    QRContasReceber_CabNUM_TIPO_JURO: TStringField;
    QContasReceber_Cabdesc_finalidade: TStringField;
    QContasReceber_Cabdesc_agencia: TStringField;
    QContasReceber_Cabdesc_cliente: TStringField;
    QContasReceber_Cabdesc_filial: TStringField;
    QContasReceber_Cabdesc_departamento: TStringField;
    QContasReceber_Cabdesc_Vendedor: TStringField;
    QRContasReceber_CabsVal_Juros: TFloatField;
    QRContasReceber_Duplicatas: TOracleDataSet1;
    QRContasReceber_Duplicatasnum_nota: TFloatField;
    QRContasReceber_Duplicatasval_nota: TFloatField;
    QRContasReceber_Duplicatasvendedor: TStringField;
    QRContasReceber_Duplicatasextenso: TStringField;
    QRCReceber_MovTot: TOracleDataSet1;
    QRCReceber_MovTotTOTAL: TFloatField;
    QRCReceber_MovTotIND_TIPO_MOVIMENTO: TStringField;
    QContasReceber_Mov: TOracleDataSet1;
    QContasReceber_MovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContasReceber_MovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceber_MovDT_MOVIMENTO: TDateTimeField;
    QContasReceber_MovVAL_MOVIMENTO: TFloatField;
    QContasReceber_MovDESC_OBSERVACAO: TStringField;
    QContasReceber_MovCOD_USUARIO: TIntegerField;
    QContasReceber_MovDT_USUARIO: TDateTimeField;
    QContasReceber_MovIND_TIPO_MOVIMENTO: TStringField;
    QContasReceber_MovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasReceber_MovCOD_CAIXA_MOV: TIntegerField;
    QContasReceber_Movdesc_caixa_banco: TStringField;
    QRContasReceber_Produtos: TOracleDataSet1;
    QRContasReceber_ProdutosCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_ProdutosQT_QUANTIDADE: TFloatField;
    QRContasReceber_ProdutosVAL_TOTAL: TFloatField;
    QRContasReceber_ProdutosCOD_PRODUTO: TFloatField;
    QRBloqueto: TOracleDataSet1;
    QRBloquetoinstrucao_juro: TStringField;
    QRBloquetonome_vendedor: TStringField;
    QExcluiMov: TOracleDataSet1;
    QExcluiMovCaixa: TOracleDataSet1;
    QLiberaBaixa: TOracleDataSet1;
    QLiberaBaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QLiberaBaixaCOD_FINALIDADE: TIntegerField;
    QLiberaBaixaCOD_BANCO_AGENCIA: TIntegerField;
    QLiberaBaixaCOD_FILIAL: TIntegerField;
    QLiberaBaixaNUM_TITULO: TIntegerField;
    QLiberaBaixaNUM_PARCELA: TIntegerField;
    QLiberaBaixaDESC_TIPO_DOCUMENTO: TStringField;
    QLiberaBaixaDT_MOVIMENTO: TDateTimeField;
    QLiberaBaixaDT_BAIXA: TDateTimeField;
    QLiberaBaixaDT_VENCIMENTO: TDateTimeField;
    QLiberaBaixaDT_EMISSAO: TDateTimeField;
    QLiberaBaixaDT_CAPITALIZACAO: TDateTimeField;
    QLiberaBaixaVAL_TITULO: TFloatField;
    QLiberaBaixaVAL_NEGOCIO: TFloatField;
    QLiberaBaixaIND_ACEITE: TStringField;
    QLiberaBaixaIND_SITUACAO: TStringField;
    QLiberaBaixaDESC_OBSERVACAO: TStringField;
    QLiberaBaixaCOD_NOTA_CAB: TIntegerField;
    QLiberaBaixaCOD_CADASTRO: TIntegerField;
    QLiberaBaixaVAL_ORIGINAL: TFloatField;
    QLiberaBaixadesc_cliente: TStringField;
    QExcluiMovBanco: TOracleDataSet1;
    QRContasReceber_Vencimentos: TOracleDataSet1;
    QRContasReceber_VencimentosNUM_TITULO: TFloatField;
    QRContasReceber_VencimentosDESC_SIGLA: TStringField;
    QRContasReceber_VencimentosCOD_CONTA_RECEBER_CAB: TFloatField;
    QRContasReceber_VencimentosNUM_PARCELA: TFloatField;
    QRContasReceber_VencimentosDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_VencimentosDT_EMISSAO: TDateTimeField;
    QRContasReceber_VencimentosIND_SITUACAO: TStringField;
    QRContasReceber_VencimentosNOME: TStringField;
    QRContasReceber_VencimentosCOD_CADASTRO: TFloatField;
    QRContasReceber_VencimentosVALOR: TFloatField;
    QRContasReceber_Vencimentosval_titulo: TFloatField;
    QContasReceberBaixaMov: TOracleDataSet1;
    QContasReceberBaixaMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContasReceberBaixaMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceberBaixaMovIND_TIPO_MOVIMENTO: TStringField;
    QContasReceberBaixaMovDT_MOVIMENTO: TDateTimeField;
    QContasReceberBaixaMovVAL_MOVIMENTO: TFloatField;
    QContasReceberBaixaMovDESC_OBSERVACAO: TStringField;
    QContasReceberBaixaMovCOD_USUARIO: TIntegerField;
    QContasReceberBaixaMovDT_USUARIO: TDateTimeField;
    QContasReceberBaixaMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasReceberBaixaMovCOD_CAIXA_MOV: TIntegerField;
    QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QRContasReceber_Mov: TOracleDataSet1;
    QRContasReceber_MovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QRContasReceber_MovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_MovDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_MovVAL_MOVIMENTO: TFloatField;
    QRContasReceber_MovDESC_OBSERVACAO: TStringField;
    QRContasReceber_MovIND_TIPO_MOVIMENTO: TStringField;
    QRContasReceber_MovDT_USUARIO: TDateTimeField;
    QRContasReceber_MovCOD_USUARIO: TIntegerField;
    QRContasReceber_TitulosAberto: TOracleDataSet1;
    QRContasReceber_TitulosAbertoNOME: TStringField;
    QRContasReceber_TitulosAbertoDESC_TELEFONE: TStringField;
    QRContasReceber_TitulosAbertoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_TitulosAbertoCOD_FILIAL: TIntegerField;
    QRContasReceber_TitulosAbertoCOD_FINALIDADE: TIntegerField;
    QRContasReceber_TitulosAbertoCOD_BANCO_AGENCIA: TIntegerField;
    QRContasReceber_TitulosAbertoCOD_CADASTRO: TIntegerField;
    QRContasReceber_TitulosAbertoNUM_TITULO: TIntegerField;
    QRContasReceber_TitulosAbertoNUM_PARCELA: TIntegerField;
    QRContasReceber_TitulosAbertoDESC_TIPO_DOCUMENTO: TStringField;
    QRContasReceber_TitulosAbertoDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_TitulosAbertoDT_BAIXA: TDateTimeField;
    QRContasReceber_TitulosAbertoDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_TitulosAbertoDT_EMISSAO: TDateTimeField;
    QRContasReceber_TitulosAbertoDT_CAPITALIZACAO: TDateTimeField;
    QRContasReceber_TitulosAbertoDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRContasReceber_TitulosAbertoVALT_TITULO: TFloatField;
    QRContasReceber_TitulosAbertoCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_TitulosAbertoDESC_OBSERVACAO: TStringField;
    QRContasReceber_TitulosAbertoIND_ACEITE: TStringField;
    QRContasReceber_TitulosAbertoIND_SITUACAO: TStringField;
    QRContasReceber_TitulosAbertoVAL_JUROS: TFloatField;
    QRContasReceber_TitulosAbertoVAL_ORIGINAL: TFloatField;
    QRContasReceber_TitulosAbertoDESC_FILIAL: TStringField;
    QRContasReceber_TitulosAbertoPERC_TAXA: TFloatField;
    QRContasReceber_TitulosAbertoCOD_MOEDA: TIntegerField;
    QRContasReceber_TitulosAbertoNUM_TIPO_JURO: TStringField;
    QRContasReceber_TitulosAbertoDESC_CLASSIFICACAO: TStringField;
    QRContasReceber_TitulosAbertovalorpago: TFloatField;
    QRContasReceber_TitulosAbertosVal_Juros: TFloatField;
    QRContasReceber_TitulosAbertoval_titulo: TFloatField;
    QContasReceber_CabCons: TOracleDataSet1;
    QContasReceber_CabConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceber_CabConsCOD_FINALIDADE: TIntegerField;
    QContasReceber_CabConsCOD_BANCO_AGENCIA: TIntegerField;
    QContasReceber_CabConsCOD_FILIAL: TIntegerField;
    QContasReceber_CabConsNUM_TITULO: TIntegerField;
    QContasReceber_CabConsNUM_PARCELA: TIntegerField;
    QContasReceber_CabConsDESC_TIPO_DOCUMENTO: TStringField;
    QContasReceber_CabConsDT_MOVIMENTO: TDateTimeField;
    QContasReceber_CabConsDT_BAIXA: TDateTimeField;
    QContasReceber_CabConsDT_VENCIMENTO: TDateTimeField;
    QContasReceber_CabConsDT_EMISSAO: TDateTimeField;
    QContasReceber_CabConsDT_CAPITALIZACAO: TDateTimeField;
    QContasReceber_CabConsVAL_TITULO: TFloatField;
    QContasReceber_CabConsVAL_NEGOCIO: TFloatField;
    QContasReceber_CabConsIND_ACEITE: TStringField;
    QContasReceber_CabConsIND_SITUACAO: TStringField;
    QContasReceber_CabConsDESC_OBSERVACAO: TStringField;
    QContasReceber_CabConsCOD_NOTA_CAB: TIntegerField;
    QContasReceber_CabConsCOD_CADASTRO: TIntegerField;
    QContasReceber_CabConsVAL_ORIGINAL: TFloatField;
    QContasReceber_CabConsCOD_NOSSO_NUMERO: TStringField;
    QContasReceber_CabConsNOME: TStringField;
    QContasReceber_CabConsNUM_CGC_CPF: TStringField;
    QContasReceber_CabConsDESC_FANTASIA: TStringField;
    QCapitalizacao: TOracleDataSet1;
    QCapitalizacaoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCapitalizacaoCOD_FINALIDADE: TIntegerField;
    QCapitalizacaoCOD_BANCO_AGENCIA: TIntegerField;
    QCapitalizacaoCOD_FILIAL: TIntegerField;
    QCapitalizacaoNUM_TITULO: TIntegerField;
    QCapitalizacaoNUM_PARCELA: TIntegerField;
    QCapitalizacaoDESC_TIPO_DOCUMENTO: TStringField;
    QCapitalizacaoDT_MOVIMENTO: TDateTimeField;
    QCapitalizacaoDT_BAIXA: TDateTimeField;
    QCapitalizacaoDT_VENCIMENTO: TDateTimeField;
    QCapitalizacaoDT_EMISSAO: TDateTimeField;
    QCapitalizacaoDT_CAPITALIZACAO: TDateTimeField;
    QCapitalizacaoDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QCapitalizacaoVAL_TITULO: TFloatField;
    QCapitalizacaoVAL_NEGOCIO: TFloatField;
    QCapitalizacaoIND_ACEITE: TStringField;
    QCapitalizacaoIND_SITUACAO: TStringField;
    QCapitalizacaoDESC_OBSERVACAO: TStringField;
    QCapitalizacaoCOD_NOTA_CAB: TIntegerField;
    QCapitalizacaoCOD_CADASTRO: TIntegerField;
    QCapitalizacaoVAL_ORIGINAL: TFloatField;
    QCapitalizacaoVAL_JUROS: TFloatField;
    QCapitalizacaoind_tipo_juro: TStringField;
    QCapitalizacaocod_moeda: TIntegerField;
    QCapitalizacaotaxa_juro: TFloatField;
    QCapitalizacaocod_historico_juro: TIntegerField;
    QCapitalizacaoMov: TOracleDataSet1;
    QCapitalizacaoMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QCapitalizacaoMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCapitalizacaoMovIND_TIPO_MOVIMENTO: TStringField;
    QCapitalizacaoMovDT_MOVIMENTO: TDateTimeField;
    QCapitalizacaoMovVAL_MOVIMENTO: TFloatField;
    QCapitalizacaoMovDESC_OBSERVACAO: TStringField;
    QCapitalizacaoMovCOD_USUARIO: TIntegerField;
    QCapitalizacaoMovDT_USUARIO: TDateTimeField;
    QRContasReceber_TitulosAbertodesc_sigla_banco: TStringField;
    QRContasReceberResumo: TOracleDataSet1;
    QRContasReceberResumoDESC_SIGLA: TStringField;
    QRContasReceberResumoDESC_BANCO_AGENCIA: TStringField;
    QRContasReceberResumoVALOR: TFloatField;
    QRCReceber_movDT_VENCIMENTO: TDateTimeField;
    QRemessaIND_FISICA_JURIDICA: TStringField;
    QRContasReceber_TitulosAbertoDESC_CELULAR: TStringField;
    QRCReceber_movCOD_NOSSO_NUMERO: TStringField;
    QContasReceber_CabIND_ENVIADO_BANCO: TStringField;
    QEnviadoBanco: TOracleDataSet1;
    QRBloquetonosso_numero_seq: TIntegerField;
    QTitulosEnviadosMudaStatus: TOracleDataSet1;
    QEnviadoBancoVolta: TOracleDataSet1;
    QContasReceber_MovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasReceber_MovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QRContaReceberTotalDia: TOracleDataSet1;
    QRContaReceberTotalDiaDT_VENCIMENTO: TDateTimeField;
    QRContaReceberTotalDiaT_RECEBER: TFloatField;
    QRComissaoval_comissao: TFloatField;
    QRComissaoCOD_NOTA_CAB: TFloatField;
    QNotaItem: TOracleDataSet1;
    QNotaItemPERC_COMISSAO: TFloatField;
    QNotaItemVAL_TOTAL: TFloatField;
    QNotaItemVAL_DESCONTO: TFloatField;
    QNotaItemVAL_DESPESAS: TFloatField;
    QRContasReceber_TitVencVAL_TITULO: TFloatField;
    QRContasReceber_TitVencVAL_ORIGINAL: TFloatField;
    QRemessaNUM_CONTA_CORRENTE: TStringField;
    QContasReceberPosicao: TOracleDataSet1;
    QContasReceberPosicaoCOD_CADASTRO: TFloatField;
    QContasReceberPosicaoVAL_TITULO_VENCIDO: TFloatField;
    QContasReceberPosicaoVAL_TITULO_AVENCER: TFloatField;
    QLiberaBaixaIND_ENVIADO_BANCO: TStringField;
    QRContasReceber_TitulosBaixadosCOD_NOSSO_NUMERO: TStringField;
    QContasReceber_CabCOD_CONTA_CORRENTE: TIntegerField;
    QContasReceber_Cabdesc_conta_corrente: TStringField;
    QRemessaDESC_AVALISTA1: TStringField;
    QRemessaCARTEIRA: TIntegerField;
    QRemessaNR_DIAS_PROTESTO: TIntegerField;
    QRCartaCobranca: TOracleDataSet1;
    QRCartaCobrancaVAL_INICIAL: TFloatField;
    QRCartaCobrancaCOD_CADASTRO: TIntegerField;
    QRCartaCobrancaNOME: TStringField;
    QRCartaCobrancaDESC_ENDERECO_COBRANCA: TStringField;
    QRCartaCobrancaDESC_CIDADE_COBRANCA: TStringField;
    QRCartaCobrancaDESC_ESTADO_COBRANCA: TStringField;
    QRCartaCobrancaDESC_TELEFONE: TStringField;
    QRCartaCobrancaDESC_CEP_COBRANCA: TStringField;
    QRCartaCobrancaDT_VENCIMENTO: TDateTimeField;
    QRCartaCobrancaDESC_FILIAL: TStringField;
    QRCartaCobrancaDESC_ENDERECO: TStringField;
    QRCartaCobrancaFONE_FILIAL: TStringField;
    QRCartaCobrancaBAIRRO_FILIAL: TStringField;
    QRCartaCobrancaNUM_CGC: TStringField;
    QRCartaCobrancaCIDADE_FILIAL: TStringField;
    QRCartaCobrancaEMAIL_FILIAL: TStringField;
    QRCartaCobrancaCEP_FILIAL: TStringField;
    QRCartaCobrancaESTADO_FILIAL: TStringField;
    QContasReceber_CabCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QContasReceber_MovCOD_NOTA_CAB: TIntegerField;
    QContasReceberBaixaMovCOD_NOTA_CAB: TIntegerField;
    QNotaEntradaCons: TOracleDataSet1;
    QNotaEntradaConsNUM_NOTA: TIntegerField;
    QNotaEntradaConsDT_EMISSAO: TDateTimeField;
    QContasReceberBaixaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QNotaEntradaConsCOD_NOTA_CAB: TIntegerField;
    QRCartaCobrancaVAL_TITULO: TFloatField;
    QRCartaCobrancaDT_CAPITALIZACAO: TDateTimeField;
    QRCartaCobrancaCOD_FINALIDADE: TIntegerField;
    QRCartaCobrancaval_atualizado: TFloatField;
    QRCartaCobrancaDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRComissaoNUM_PEDIDO: TFloatField;
    QRComissaonr_pedido: TFloatField;
    QRemessanum_cgc_filial_conta: TStringField;
    QRemessaCC_COD_FILIAL: TIntegerField;
    QRemessainstrucao_juro: TFloatField;
    QRContasReceber_Finalidade: TOracleDataSet1;
    QRContasReceber_FinalidadeCOD_FINALIDADE: TIntegerField;
    QRContasReceber_FinalidadeDESC_FINALIDADE: TStringField;
    QRContasReceber_FinalidadeVALT_TITULO: TFloatField;
    QRContasReceber_Finalidadevalorpago: TFloatField;
    QRContasReceber_Finalidadeval_titulo: TFloatField;
    QRContasReceber_FinalidadeIND_SITUACAO: TStringField;
    QRContasReceber_FinalidadeCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRComissaoPC_COMISSAO: TFloatField;
    QRComissaoperc_comissao: TFloatField;
    QTitulosEnviadosMudaStatusCOD_CONTA_RECEBER_CAB: TIntegerField;
    QTitulosEnviadosMudaStatusNUM_TITULO: TIntegerField;
    QTitulosEnviadosMudaStatusDESC_TIPO_DOCUMENTO: TStringField;
    QTitulosEnviadosMudaStatusDT_MOVIMENTO: TDateTimeField;
    QTitulosEnviadosMudaStatusDT_VENCIMENTO: TDateTimeField;
    QTitulosEnviadosMudaStatusDT_EMISSAO: TDateTimeField;
    QTitulosEnviadosMudaStatusVAL_TITULO: TFloatField;
    QTitulosEnviadosMudaStatusCOD_NOSSO_NUMERO: TStringField;
    QTitulosEnviadosMudaStatusVAL_JUROS: TFloatField;
    QTitulosEnviadosMudaStatusCOD_CADASTRO: TIntegerField;
    QTitulosEnviadosMudaStatusNOME: TStringField;
    QRContasReceber_TitulosAbertoNOME_VENDEDOR: TStringField;
    QRemessaCODIGO_CEDENTE: TFloatField;
    QRemessaNUM_CONVENIO: TFloatField;
    QRemessaCOD_CONVENENTE_LIDER: TFloatField;
    QRTituloEmissao: TOracleDataSet1;
    QRTituloEmissaoNUM_TITULO: TIntegerField;
    QRTituloEmissaoCOD_CADASTRO: TIntegerField;
    QRTituloEmissaoNOME: TStringField;
    QRTituloEmissaoVAL_TITULO: TFloatField;
    QRTituloEmissaoDT_EMISSAO: TDateTimeField;
    QRTituloEmissaoDT_VENCIMENTO: TDateTimeField;
    QRTituloEmissaoNUM_PARCELA: TIntegerField;
    QRTituloEmissaoCOD_FILIAL: TIntegerField;
    QRTituloEmissaoDESC_FILIAL: TStringField;
    QContasReceber_CabConsNOME_CONTATO2: TStringField;
    QRCartaCobrancaDESC_BAIRRO: TStringField;
    QRRecibosDESC_ENDERECO: TStringField;
    QRComissaoNOME_CADASTRO: TStringField;
    QRComissaoDESC_OBSERVACAO: TStringField;
    QRComissaoCOD_VENDEDOR: TFloatField;
    QRRecibosNOME: TStringField;
    QRComissaoPERC_IRRF: TFloatField;
    QRComissaoCOD_CADASTRO: TFloatField;
    QContasReceber_MovIND_DEVOLUCAO: TStringField;
    QContasReceberBaixaMovIND_DEVOLUCAO: TStringField;
    QEmissaoCarne: TOracleDataSet1;
    QEmissaoCarneCOD_CADASTRO: TIntegerField;
    QEmissaoCarneNOME: TStringField;
    QEmissaoCarneCOD_FILIAL: TIntegerField;
    QEmissaoCarneDESC_FILIAL: TStringField;
    QEmissaoCarneNUM_TITULO: TIntegerField;
    QEmissaoCarneDT_VENCIMENTO: TDateTimeField;
    QEmissaoCarneNUM_PARCELA: TIntegerField;
    QEmissaoCarneVAL_ORIGINAL: TFloatField;
    QEmissaoCarneDT_EMISSAO: TDateTimeField;
    QEmissaoCarneCOD_NOTA_CAB: TIntegerField;
    QRemessaCOD_CONVENIO_CUSTODIA: TFloatField;
    QContasReceber_MovIND_FORMA_PAGAMENTO: TStringField;
    QContasReceberBaixaMovIND_FORMA_PAGAMENTO: TStringField;
    QNotaItemVAL_ICMS_SUBST: TFloatField;
    QRContasReceber_ProdutosDESC_PRODUTO: TStringField;
    QRemessaDESC_CIDADE: TStringField;
    QRCartaCobrancadesc_local_data: TStringField;
    QRCartaCobrancaNUM_TITULO: TIntegerField;
    QRCartaCobrancaNUM_CAIXA_POSTAL: TIntegerField;
    QContasReceber_CabConsval_atualizado: TFloatField;
    QContasReceber_CabConsVAL_JUROS: TFloatField;
    QContasReceber_CabConsDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRTituloEmissaoNOME_VENDEDOR: TStringField;
    QRTituloEmissaoVAL_ORIGINAL: TFloatField;
    QRCartaCobrancaCONTATO_FILIAL: TStringField;
    QRCartaCobrancaNUM_CGC_CPF: TStringField;
    QContasReceber_CabCOD_OBRA_CONTRATO: TIntegerField;
    QRComissaoCOD_FILIAL: TFloatField;
    QRemessaDIG_VERIFICADOR_AGENCIA_CONTA: TStringField;
    QRemessaCOD_FORMA_CADAST_BANCO: TStringField;
    QRemessaCOD_TIPO_DOCUMENTO: TStringField;
    QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO: TStringField;
    QRemessaCOD_IDENTIF_DISTRIBUICAO: TStringField;
    QRemessaCOD_IDENTIF_ACEITO: TStringField;
    QRemessaCOD_PROTESTO: TStringField;
    QRBloquetoval_acrescimo: TFloatField;
    QRemessaPERC_TAXA: TFloatField;
    QRContasReceber_TitulosAbertoDESC_ENDERECO: TStringField;
    QRContasReceber_TitulosAbertoDESC_CIDADE: TStringField;
    QRContasReceber_TitulosAbertoDESC_CEP: TStringField;
    QRContasReceber_TitulosAbertoCOD_ESTADO: TStringField;
    QRContasReceber_TitulosAbertoNUM_CGC_CPF: TStringField;
    QContasReceber_CabIND_EMITIDO_CARNE: TStringField;
    QEmissaoCarneCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContasReceber_CabCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QRHistoricoContrato: TOracleDataSet1;
    QRHistoricoContratoNUM_TITULO: TFloatField;
    QRHistoricoContratoNUM_PARCELA: TFloatField;
    QRHistoricoContratoDT_VENCIMENTO: TDateTimeField;
    QRHistoricoContratoVAL_TITULO: TFloatField;
    QRHistoricoContratoCOD_CADASTRO: TFloatField;
    QRHistoricoContratoDT_MOVIMENTO: TDateTimeField;
    QRHistoricoContratoNOME: TStringField;
    QRHistoricoContratoVAL_PRINCIPAL: TFloatField;
    QRHistoricoContratoVAL_DESCONTO: TFloatField;
    QRHistoricoContratoVAL_JUROS: TFloatField;
    QRHistoricoContratoCOD_OBRA_CONTRATO: TFloatField;
    QRHistoricoContratoVAL_ORIGINAL: TFloatField;
    QRHistoricoContratoCOD_CONTA_RECEBER_CAB: TFloatField;
    QRHistoricoContratoDT_INICIO: TDateTimeField;
    QContasReceber_CabNUM_OS: TIntegerField;
    QEmissaoCarnePERC_TAXA: TFloatField;
    QContasReceber_CabCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRContasReceber_TitulosAbertoDESC_AVALISTA1: TStringField;
    QContasReceberBaixaDESC_CLASSIFICACAO: TStringField;
    QContasReceberBaixaNUM_TIPO_JURO: TStringField;
    QContasReceberBaixaPERC_TAXA: TFloatField;
    QContasReceberBaixaCOD_MOEDA: TIntegerField;
    QContasReceberBaixaCOD_HISTORICO_DESC: TIntegerField;
    QContasReceberBaixaDESC_FINALIDADE: TStringField;
    QContasReceberBaixaval_juros_calculado: TFloatField;
    QRemessaperc_juro_dia: TFloatField;
    QContasReceberBaixaDESC_FILIAL: TStringField;
    QRResumoMovCReceber: TOracleDataSet1;
    QRResumoMovCReceberDT_MOVIMENTO: TDateTimeField;
    QRResumoMovCReceberVAL_PRINCIPAL: TFloatField;
    QRResumoMovCReceberVAL_RECEBTO_PRINCIPAL: TFloatField;
    QRResumoMovCReceberVAL_DES_CONCEDIDO: TFloatField;
    QRResumoMovCReceberVAL_RECEBTO_JUROS: TFloatField;
    QRContasReceber_TitulosAbertoDESC_FONE_EMPRESA: TStringField;
    QRContasReceber_ProdutosVAL_UNITARIO: TFloatField;
    QContasReceberBaixaPERC_JURO_MORA: TFloatField;
    QRContasReceber_TitulosAbertoPERC_JURO_MORA: TFloatField;
    QContasReceber_CabConsNUM_TIPO_JURO: TStringField;
    QContasReceber_CabConsPERC_TAXA: TFloatField;
    QContasReceber_CabConsPERC_JURO_MORA: TFloatField;
    QContasReceber_CabConsCOD_MOEDA: TIntegerField;
    QCapitalizacaoperc_juro_mora: TFloatField;
    QRRecibosPERC_TAXA: TFloatField;
    QRRecibosPERC_JURO_MORA: TFloatField;
    QRRecibosNUM_DIAS_CARENCIA: TIntegerField;
    QRRecibosCOD_MOEDA: TIntegerField;
    QRRecibosIND_TIPO_JURO: TStringField;
    QRContasReceber_CabPERC_JURO_MORA: TFloatField;
    QRCartaCobrancaIND_TIPO_JURO: TStringField;
    QRCartaCobrancaPERC_TAXA: TFloatField;
    QRCartaCobrancaCOD_MOEDA: TIntegerField;
    QRCartaCobrancaPERC_JURO_MORA: TFloatField;
    QRCartaCobrancaIND_SITUACAO: TStringField;
    QRContasReceber_DuplicatasCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_DuplicatasDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_DuplicatasVAL_TITULO: TFloatField;
    QRContasReceber_DuplicatasDT_EMISSAO: TDateTimeField;
    QRContasReceber_DuplicatasNUM_TITULO: TIntegerField;
    QRContasReceber_DuplicatasNUM_PARCELA: TIntegerField;
    QRContasReceber_DuplicatasDESC_TIPO_DOCUMENTO: TStringField;
    QRContasReceber_DuplicatasCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_DuplicatasNOME: TStringField;
    QRContasReceber_DuplicatasCOD_CADASTRO: TIntegerField;
    QRContasReceber_DuplicatasDESC_ENDERECO: TStringField;
    QRContasReceber_DuplicatasDESC_CIDADE: TStringField;
    QRContasReceber_DuplicatasNUM_CGC_CPF: TStringField;
    QRContasReceber_DuplicatasDESC_CEP: TStringField;
    QRContasReceber_DuplicatasNUM_INSCRICAO: TStringField;
    QRContasReceber_DuplicatasCOD_ESTADO: TStringField;
    QRContasReceber_DuplicatasCOD_VENDEDOR: TIntegerField;
    QRContasReceber_DuplicatasDESC_CIDADE_FILIAL: TStringField;
    QRContasReceber_DuplicatasDESC_CEP_FILIAL: TStringField;
    QRContasReceber_DuplicatasDESC_ENDERECO_FILIAL: TStringField;
    QRContasReceber_DuplicatasDESC_INSCRICAO_FILIAL: TStringField;
    QRContasReceber_DuplicatasNUM_CGC_FILIAL: TStringField;
    QRContasReceber_DuplicatasCOD_ESTADO_FILIAL: TStringField;
    QRContasReceber_DuplicatasDESC_FILIAL: TStringField;
    QContasReceber_CabDESC_OBS: TStringField;
    QRCReceber_movCOD_VENDEDOR: TIntegerField;
    QRCReceber_movVENDEDOR: TStringField;
    QRContasReceber_Tit_Abertos_vendCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_Tit_Abertos_vendCOD_FINALIDADE: TIntegerField;
    QRContasReceber_Tit_Abertos_vendCOD_BANCO_AGENCIA: TIntegerField;
    QRContasReceber_Tit_Abertos_vendCOD_FILIAL: TIntegerField;
    QRContasReceber_Tit_Abertos_vendNUM_TITULO: TIntegerField;
    QRContasReceber_Tit_Abertos_vendNUM_PARCELA: TIntegerField;
    QRContasReceber_Tit_Abertos_vendDESC_TIPO_DOCUMENTO: TStringField;
    QRContasReceber_Tit_Abertos_vendDT_MOVIMENTO: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendDT_BAIXA: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendDT_VENCIMENTO: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendDT_EMISSAO: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendDT_CAPITALIZACAO: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendVAL_NEGOCIO: TFloatField;
    QRContasReceber_Tit_Abertos_vendIND_ACEITE: TStringField;
    QRContasReceber_Tit_Abertos_vendIND_SITUACAO: TStringField;
    QRContasReceber_Tit_Abertos_vendDESC_OBSERVACAO: TStringField;
    QRContasReceber_Tit_Abertos_vendCOD_NOTA_CAB: TIntegerField;
    QRContasReceber_Tit_Abertos_vendCOD_CADASTRO: TIntegerField;
    QRContasReceber_Tit_Abertos_vendVAL_ORIGINAL: TFloatField;
    QRContasReceber_Tit_Abertos_vendCOD_NOSSO_NUMERO: TStringField;
    QRContasReceber_Tit_Abertos_vendVAL_JUROS: TFloatField;
    QRContasReceber_Tit_Abertos_vendCOD_DEPARTAMENTO: TIntegerField;
    QRContasReceber_Tit_Abertos_vendDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QRContasReceber_Tit_Abertos_vendDESC_FILIAL: TStringField;
    QRContasReceber_Tit_Abertos_vendDESC_ENDERECO: TStringField;
    QRContasReceber_Tit_Abertos_vendDESC_CIDADE: TStringField;
    QRContasReceber_Tit_Abertos_vendDESC_TELEFONE: TStringField;
    QRContasReceber_Tit_Abertos_vendCOD_VENDEDOR: TIntegerField;
    QRContasReceber_Tit_Abertos_vendDESC_DEPARTAMENTO: TStringField;
    QRContasReceber_Tit_Abertos_vendNUM_TIPO_JURO: TStringField;
    QRContasReceber_Tit_Abertos_vendPERC_TAXA: TFloatField;
    QRContasReceber_Tit_Abertos_vendCOD_MOEDA: TIntegerField;
    QRContasReceber_Tit_Abertos_vendPERC_JURO_MORA: TFloatField;
    QRContasReceber_Tit_Abertos_vendDESC_CLASSIFICACAO: TStringField;
    QRContasReceber_Tit_Abertos_vendsval_juros: TFloatField;
    QRContasReceber_Tit_Abertos_vendVAL_TITULO: TFloatField;
    QRContasReceber_Tit_Abertos_vendNOME: TStringField;
    QRContasReceber_Tit_Abertos_vendNOME_VENDEDOR: TStringField;
    QRContasReceber_Tit_Abertos_vendVAL_PAGO: TFloatField;
    QVerificaPraca: TOracleDataSet1;
    QVerificaPracaCOD_CEP_SAFRA: TIntegerField;
    QVerificaPracaDESC_AGENCIA: TStringField;
    QVerificaPracaNUM_CEP_AGENCIA: TIntegerField;
    QVerificaPracaNUM_CEP_INICIAL: TIntegerField;
    QVerificaPracaNUM_CEP_FINAL: TIntegerField;
    QVerificaPracaCOD_UF: TStringField;
    QVerificaPracaCOD_AGENCIA: TIntegerField;
    QContasReceberBaixaNUM_DIAS_CARENCIA: TFloatField;
    QContasReceber_CabConsNUM_DIAS_CARENCIA: TFloatField;
    QRContasReceber_TitVencNOME: TStringField;
    QAchaTitulo: TOracleDataSet1;
    QAchaTituloCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRContasReceber_TitVencNUMERO: TStringField;
    QRContasReceber_TitVencDT_VENCIMENTO: TDateTimeField;
    QContasReceber_MovIND_TROCA: TStringField;
    QContasReceberBaixaMovIND_TROCA: TStringField;
    QRBloquetoCODIGO_CEDENTE: TFloatField;
    QRBloquetoDIGITO_VERIFICADOR_CEDENTE: TStringField;
    QRBloquetoNUM_CONVENIO: TFloatField;
    QRBloquetoDESC_LOCAL_PGTO_BLOQ: TStringField;
    QRBloquetoDESC_INSTRUCAO_BLOQUETO: TStringField;
    QRBloquetoIND_TIPO_JURO: TStringField;
    QRBloquetoPERC_JURO_BLOQUETO: TFloatField;
    QRBloquetoCOD_BANCO: TIntegerField;
    QRBloquetoCOD_AGENCIA: TIntegerField;
    QRBloquetoDIGITO_VERIFICADOR_AGENCIA: TStringField;
    QRBloquetoVAL_TITULO: TFloatField;
    QRBloquetoDT_VENCIMENTO: TDateTimeField;
    QRBloquetoCOD_FILIAL: TIntegerField;
    QRBloquetoDT_EMISSAO: TDateTimeField;
    QRBloquetoDESC_TIPO_DOCUMENTO: TStringField;
    QRBloquetoIND_ACEITE: TStringField;
    QRBloquetoNOME_SACADO: TStringField;
    QRBloquetoDESC_ENDERECO_COBRANCA: TStringField;
    QRBloquetoCOD_CADASTRO: TIntegerField;
    QRBloquetoDESC_TELEFONE: TStringField;
    QRBloquetoDESC_CIDADE_COBRANCA: TStringField;
    QRBloquetoDESC_ESTADO_COBRANCA: TStringField;
    QRBloquetoDESC_ENDERECO: TStringField;
    QRBloquetoDESC_CIDADE: TStringField;
    QRBloquetoDESC_CEP_COBRANCA: TStringField;
    QRBloquetoNUM_CGC_CPF: TStringField;
    QRBloquetoCOD_ESTADO: TStringField;
    QRBloquetoDESC_BAIRRO: TStringField;
    QRBloquetoVARIACAO: TIntegerField;
    QRBloquetoNUM_CONTA_CORRENTE: TStringField;
    QRBloquetoCOD_CONVENIO_CUSTODIA: TFloatField;
    QRBloquetoDIG_VERIFICADOR_AGENCIA_CONTA: TStringField;
    QRBloquetoDESC_FILIAL: TStringField;
    QRBloquetoCARTEIRA: TIntegerField;
    QRContasReceber_TitulosBaixadosVAL_BAIXA: TFloatField;
    QRContasReceber_CabNUM_DIAS_CARENCIA: TIntegerField;
    QRBloquetoNOSSO_NUMERO: TStringField;
    QContasReceberBaixaval_recebido: TFloatField;
    QRContasReceber_TitulosAbertoNUM_DIAS_CARENCIA: TIntegerField;
    QRContasReceber_SaldosQTOT_VENCIDO_30: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_30: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_60: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_60: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_90: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_90: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_120: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_120: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_150: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_150: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_180: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_180: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_210: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_210: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_240: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_240: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_270: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_270: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_300: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_300: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_330: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_330: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO_360: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER_360: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDOACIMA_360: TFloatField;
    QRContasReceber_SaldosQTOT_VENCERACIMA_360: TFloatField;
    QRContasReceber_SaldosQTOT_VENCIDO: TFloatField;
    QRContasReceber_SaldosQTOT_VENCER: TFloatField;
    QRContasReceber_CabDESC_ENDERECO: TStringField;
    QRContasReceber_RecebidosCOD_VENDEDOR: TFloatField;
    QRContasReceber_RecebidosVENDEDOR: TStringField;
    QRContasReceber_Receb_BcoCOD_VENDEDOR: TFloatField;
    QRContasReceber_Receb_BcoVENDEDOR: TStringField;
    QRContasReceber_CabDESC_TELEFONE: TStringField;
    QRContasReceber_CabDESC_BAIRRO: TStringField;
    QRContasReceber_RecebidosDESC_OBSERVACAO: TStringField;
    QRContasReceber_Receb_BcoDESC_OBSERVACAO: TStringField;
    QRContasReceber_TitVencDESC_CELULAR: TStringField;
    OPBanco: TOraclePackage;
    QContasReceber_CabCOD_VENDEDOR1: TIntegerField;
    QContasReceber_CabPERC_COMISSAO1: TFloatField;
    QRComissaoPublicar: TOracleDataSet1;
    QRComissaoPublicarVENDEDOR: TStringField;
    QRComissaoPublicarCOD_NOTA_CAB: TFloatField;
    QRComissaoPublicarCOD_FILIAL: TFloatField;
    QRComissaoPublicarCOD_CADASTRO: TFloatField;
    QRComissaoPublicarDATA: TDateTimeField;
    QRComissaoPublicarNUM_PEDIDO: TFloatField;
    QRComissaoPublicarCOD_VENDEDOR: TFloatField;
    QRComissaoPublicarPC_COMISSAO: TFloatField;
    QRComissaoPublicarPERC_IRRF: TFloatField;
    QRComissaoPublicarNOME_CADASTRO: TStringField;
    QRComissaoPublicarNOME_VENDEDOR: TStringField;
    QRComissaoPublicarDESC_OBSERVACAO: TStringField;
    QRComissaoPublicarSVAL_TOTAL: TFloatField;
    QRComissaoPublicarperc_comissao: TFloatField;
    QRComissaoPublicarval_comissao: TFloatField;
    QRComissaoPublicarnr_pedido: TFloatField;
    QRComissaoPublicarNUM_TITULO: TFloatField;
    QRContasReceber_DuplicatasDESC_FONE_FILIAL: TStringField;
    QRBloquetoPeriodo: TOracleDataSet1;
    QRBloquetoPeriodoCOD_CADASTRO: TIntegerField;
    QRBloquetoPeriodoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRBloquetoCOD_NOTA_CAB: TFloatField;
    QRBloquetoNUM_TITULO: TFloatField;
    QRBloquetoCOD_CONTA_RECEBER_CAB: TFloatField;
    QRBloquetoCOD_VENDEDOR: TFloatField;
    QRBloquetoNUM_PARCELA: TFloatField;
    QContasReceberBaixaMovCOD_ADIANTAMENTO: TIntegerField;
    cdContasReceberBaixaLote: TClientDataSet;
    dspContasReceberBaixaLote: TDataSetProvider;
    cdContasReceberBaixaLoteNOME: TStringField;
    cdContasReceberBaixaLoteCOD_CONTA_RECEBER_CAB: TIntegerField;
    cdContasReceberBaixaLoteCOD_FINALIDADE: TIntegerField;
    cdContasReceberBaixaLoteCOD_CADASTRO: TIntegerField;
    cdContasReceberBaixaLoteCOD_FILIAL: TIntegerField;
    cdContasReceberBaixaLoteCOD_BANCO_AGENCIA: TIntegerField;
    cdContasReceberBaixaLoteCOD_DEPARTAMENTO: TIntegerField;
    cdContasReceberBaixaLoteNUM_TITULO: TIntegerField;
    cdContasReceberBaixaLoteNUM_PARCELA: TIntegerField;
    cdContasReceberBaixaLoteDESC_TIPO_DOCUMENTO: TStringField;
    cdContasReceberBaixaLoteDT_MOVIMENTO: TDateTimeField;
    cdContasReceberBaixaLoteDT_BAIXA: TDateTimeField;
    cdContasReceberBaixaLoteDT_VENCIMENTO: TDateTimeField;
    cdContasReceberBaixaLoteDT_EMISSAO: TDateTimeField;
    cdContasReceberBaixaLoteDT_CAPITALIZACAO: TDateTimeField;
    cdContasReceberBaixaLoteDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    cdContasReceberBaixaLoteVAL_TITULO: TFloatField;
    cdContasReceberBaixaLoteCOD_NOTA_CAB: TIntegerField;
    cdContasReceberBaixaLoteDESC_OBSERVACAO: TStringField;
    cdContasReceberBaixaLoteIND_ACEITE: TStringField;
    cdContasReceberBaixaLoteIND_SITUACAO: TStringField;
    cdContasReceberBaixaLoteVAL_ORIGINAL: TFloatField;
    cdContasReceberBaixaLoteVAL_JUROS: TFloatField;
    cdContasReceberBaixaLoteCOD_ORDEM_COMPRA_CAB: TIntegerField;
    cdContasReceberBaixaLoteDESC_CLASSIFICACAO: TStringField;
    cdContasReceberBaixaLoteNUM_TIPO_JURO: TStringField;
    cdContasReceberBaixaLotePERC_TAXA: TFloatField;
    cdContasReceberBaixaLoteCOD_MOEDA: TIntegerField;
    cdContasReceberBaixaLoteCOD_HISTORICO_DESC: TIntegerField;
    cdContasReceberBaixaLoteDESC_FINALIDADE: TStringField;
    cdContasReceberBaixaLoteval_juros_calculado: TFloatField;
    cdContasReceberBaixaLoteDESC_FILIAL: TStringField;
    cdContasReceberBaixaLotePERC_JURO_MORA: TFloatField;
    cdContasReceberBaixaLoteNUM_DIAS_CARENCIA: TFloatField;
    cdContasReceberBaixaLoteval_recebido: TFloatField;
    procedure QContasReceber_CabCalcFields(DataSet: TDataSet);
    procedure QContasReceber_CabAfterInsert(DataSet: TDataSet);
    procedure QContasReceber_CabBeforeEdit(DataSet: TDataSet);
    procedure QContasReceber_CabBeforeInsert(DataSet: TDataSet);
    procedure QContasReceber_CabAfterPost(DataSet: TDataSet);
    procedure QContasReceber_CabBeforePost(DataSet: TDataSet);
    procedure QContasReceber_MovAfterInsert(DataSet: TDataSet);
    procedure QContasReceber_MovAfterPost(DataSet: TDataSet);
    procedure QContasReceber_MovBeforeEdit(DataSet: TDataSet);
    procedure QContasReceber_MovBeforeInsert(DataSet: TDataSet);
    procedure QContasReceber_MovBeforePost(DataSet: TDataSet);
    procedure QContasReceberBaixaCalcFields(DataSet: TDataSet);
    procedure QContasReceberBaixaMovBeforePost(DataSet: TDataSet);
    procedure QLiberaBaixaCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_TitulosAbertoCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_TitulosBaixadosCalcFields(DataSet: TDataSet);
    procedure QRBloquetoCalcFields(DataSet: TDataSet);
    procedure QRRecibosCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_DuplicatasCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_Tit_Abertos_vendCalcFields(
      DataSet: TDataSet);
    procedure QRContasReceber_CabCalcFields(DataSet: TDataSet);
    procedure QContasReceber_MovCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_VencimentosCalcFields(DataSet: TDataSet);
    procedure QContasReceber_CabCOD_CADASTROValidate(Sender: TField);
    procedure QCapitalizacaoCalcFields(DataSet: TDataSet);
    procedure QCapitalizacaoMovAfterInsert(DataSet: TDataSet);
    procedure QRComissaoCalcFields(DataSet: TDataSet);
    procedure QContasReceber_CabDT_VENCIMENTOValidate(Sender: TField);
    procedure QContasReceber_CabCOD_CONTA_CORRENTEChange(Sender: TField);
    procedure QRCartaCobrancaCalcFields(DataSet: TDataSet);
    procedure QRemessaCalcFields(DataSet: TDataSet);
    procedure QRContasReceber_FinalidadeCalcFields(DataSet: TDataSet);
    procedure QContasReceber_CabConsCalcFields(DataSet: TDataSet);
    procedure QContasReceber_CabCOD_OBRA_CONTRATO_MOVChange(
      Sender: TField);
    procedure QRComissaoPublicarCalcFields(DataSet: TDataSet);
  private
    fBaixaMagenetico,fVencimentoBloqueto : String;
    fDataBase : TdateTime;
    fCalculaJuros : Boolean;
    fDataReferencia : TdateTime;
    fDataInicial : TdateTime;
    fDataFinal : TdateTime;
    fCodMensagem : integer;
    { Private declarations }
  public
    { Public declarations }
    Property pCodMensagem: Integer read fCodMensagem Write fCodMensagem default 0;
    Property pDataBase : TDateTime Read fDataBase Write fDataBase;
    Property PCalculaJuros : Boolean Read fCalculaJuros Write fCalculaJuros;
    Property pDataReferencia : TDateTime Read fDataReferencia Write fDataReferencia;
    Property pDataInicial : TDateTime Read fDataInicial Write fDataInicial;
    Property pDataFinal : TDateTime Read fDataFinal Write fDataFinal;
    Property pBaixaMagenetico : String Read fBaixaMagenetico Write fBaixaMagenetico;
    Property pVencimentoBloqueto : String Read fVencimentoBloqueto Write fVencimentoBloqueto;
    procedure ExcluiMovimentos(wCodigo:Integer);
    function CalculaJuros(wValor,wTaxaJuro,wMulta,wMoeda:Real;
                          wDataCapitalizacao,wDataAtual,wDt_Capitalizacao_Moeda:TDateTime;
                          wTipoJuro,wDiasCarencia,wModulo:String):Real;
    procedure IncluiCR(wCodDocOrigem: Integer;
                                    wNumTitulo, wParcela: Integer;
                                    wFinalidade,wDepartamento,wBancoAgencia,
                                    wCadastro,wFilial: Integer;
                                    wValTitulo : Real;
                                    wTipoDocumento : String;
                                    wDtVencimento, wEmissao : TDateTime );
    procedure Monta_Sql_Bloqueto;
    procedure Monta_Sql_Bloqueto_Copia;
    procedure Chama_Emissao_Bloqueto;
    Procedure Monta_Sql_Bloqueto_Safra;

  end;

var
  DMContasReceber: TDMContasReceber;
  wDescontoBloqueto :string;
implementation

uses UOracle_cl, UParamSistema_cl, UUsuario_cl, UPlanilha_cl, UMoeda_cl,
  UFinalidade_cl, USequencia_cl, UBiblioteca, UBloqueto, URBoletaBB,
  URBloqueto_Bradesco, URBloqueto_HSBC, URBloqueto_Rural, UFRBloqueto_Itau,
  URBloqueto_Sicredi, URBloqueto_Santander, URBloqueto_Unibanco,
  URBloquetoSafra, URBloqueto_Sudameris, URBloqueto_CEF;

{$R *.DFM}

Function TDMContasReceber.CalculaJuros(wValor,wTaxaJuro,wMulta,wMoeda:Real;wDataCapitalizacao,wDataAtual,wDt_Capitalizacao_Moeda:TDateTime;wTipoJuro,wDiasCarencia,wModulo:String):Real;
var
  Nr_Dias,wVl_Juro,wVl_Titulo,wIndice,wVlMulta :Real;
  Nr_Dias_Mes,wMesMoeda : Integer;
  wDtRef,wDt_Final_Mes : tDateTime;
  wDD,wMM,wMM_Atual,wYY_Atual,WYY,wContinua : String;
begin
  Result := 0;
  wIndice := 0;
//  wVlMulta := 0;
  If (wDataAtual-(wDataCapitalizacao + StrToInt(wDiasCarencia))) > 0 then
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
      nr_dias := wDataAtual-(wDataCapitalizacao + StrToInt(wDiasCarencia))
    Else
      nr_dias := wDataAtual-wDataCapitalizacao
  else
   Begin
    nr_dias :=0;
    Result := 0;
    exit;  // para retornar a rotina que chamou
   End;

  If wTipoJuro='SEM JUROS' then
     Result:=0;

  wVl_Titulo := wValor;  // para ter o valor inicial do titulo antes do calculo de juros

  If wTipoJuro='MOEDA' then
     Result:=wValor*(DMMoeda.MaiorCotacao(wMoeda,wDataAtual)/DMMoeda.MaiorCotacao(wMoeda,wDt_Capitalizacao_Moeda)-1);

  If wTipoJuro='MOEDA+SIMPLES' then
  begin
    wValor:=wValor + (wValor*(DMMoeda.MaiorCotacao(wMoeda,wDataAtual)/DMMoeda.MaiorCotacao(wMoeda,wDt_Capitalizacao_Moeda)-1));
    wTipoJuro := 'SIMPLES';  // Para calcular o juro simples sobre o titulo
  end;

  If wTipoJuro='MOEDA+COMPOSTO' then
  begin
    wValor:=wValor + (wValor*(DMMoeda.MaiorCotacao(wMoeda,wDataAtual)/DMMoeda.MaiorCotacao(wMoeda,wDt_Capitalizacao_Moeda)-1));
    wTipoJuro := 'COMPOSTO';  // Para calcular o juro composto sobre o titulo
  end;
  If wTipoJuro = 'SIMPLES' then
  begin
    wDD        := copy(DateToStr(wDataCapitalizacao + StrToInt(wDiasCarencia)),1,2);
    wMM        := Copy(DateToStr(wDataCapitalizacao + StrToInt(wDiasCarencia)),4,2);
    wYY        := Copy(DateToStr(wDataCapitalizacao + StrToInt(wDiasCarencia)),7,4);
    Nr_Dias_Mes:= DMOracle.DiasNoMes(wDataCapitalizacao+StrToInt(wDiasCarencia));
    wDtRef     := StrToDate((FloatToStr(Nr_Dias_mes)+'/'+wMM+'/'+wYY));
    wMM_Atual  := Copy(DateToStr(wDataAtual),4,2);
//  Calcular o juro do mes de capitalização emissão do titulo
    wContinua := 'S';
    wVl_Juro := 0;
    if (wDtRef-(wDataCapitalizacao + StrToInt(wDiasCarencia)))>0 then
    begin
      if wMM = wMM_Atual Then
       begin
        nr_dias := (wDataAtual-(wDataCapitalizacao + StrToInt(wDiasCarencia)));
        wContinua := 'N';
       end
      else
       begin
        nr_dias := (wDtRef-(wDataCapitalizacao + StrToInt(wDiasCarencia)));
        wContinua := 'S';
       end;
      If wModulo = 'CP' Then // para contas a pagar considerar numero de dias do mes sempre 30 solicitacao grasiela
        Nr_Dias_Mes := 30;
      wVl_Juro := (wTaxaJuro/100)/Nr_Dias_Mes*nr_dias*wValor;
    end;
    wValor := wValor + wVl_Juro;
    while wContinua = 'S' do
    begin
      // wVl_Juro := 0;
      wDD      := '01';
      wMM      := Copy(DateToStr(wDtRef),4,2);
      wYY      := Copy(DateToStr(wDtRef),7,4);
      wMM      := FloatToStr(StrToFloat(WMM) + 1);
      if StrToFloat(WMM) > 12 Then
      begin
        wMM := '1';
        wYY := FloatToStr(StrToFloat(wYY) + 1);
      end;
      wDt_Final_Mes := StrToDate((wDD+'/'+wMM+'/'+wYY));  // só para montar uma data paga pegar nr dias do mes
      Nr_Dias_Mes   := DMOracle.DiasNoMes(wDt_Final_Mes);
      wDt_Final_Mes := StrToDate((FloatToStr(Nr_Dias_mes)+'/'+wMM+'/'+wYY));
      if wDt_Final_Mes > wDataAtual Then
      begin
        wContinua := 'N';
        nr_dias := (wDataAtual-wDtRef);
      end
      else
         nr_dias := wDt_Final_Mes - WdtRef;
      If wModulo = 'CP' Then // para contas a pagar considerar numero de dias do mes sempre 30 solicitacao grasiela
        Nr_Dias_Mes := 30;
      wVl_Juro:= (wTaxaJuro/100)/Nr_Dias_Mes*nr_dias*wValor;
      wValor  := wValor + wVL_Juro;
      wDtRef  := wDt_Final_mes;
    end;
    Result:=(wValor - wVl_Titulo);
  end;
  If wTipoJuro='COMPOSTO' then
  begin
    if nr_dias<>0 then
    begin
      wDD        := copy(DateToStr(wDataCapitalizacao),1,2);
      wMM        := Copy(DateToStr(wDataCapitalizacao),4,2);
      wYY        := Copy(DateToStr(wDataCapitalizacao),7,4);
      Nr_Dias_Mes:= DMOracle.DiasNoMes(wDataCapitalizacao+StrToInt(wDiasCarencia));
      wDtRef     := StrToDate((FloatToStr(Nr_Dias_mes)+'/'+wMM+'/'+wYY));
      wMM_Atual  := Copy(DateToStr(wDataAtual),4,2);
      wYY_Atual  := Copy(DateToStr(wDataAtual),7,4);
 //   Calcular o juro do mes de capitalização emissão do titulo
      wContinua  := 'S';
      wVl_Juro   := 0;
      if (wDtRef-(wDataCapitalizacao+StrToInt(wDiasCarencia)))>0 then
      begin
        if ((wMM = wMM_Atual) and (wYY = wYY_Atual)) Then
        begin
          nr_dias := (wDataAtual-(wDataCapitalizacao+StrToInt(wDiasCarencia)));
          wContinua := 'N';
        end
        else
        begin
          nr_dias := (wDtRef-(wDataCapitalizacao+StrToInt(wDiasCarencia)));
          wContinua := 'S';
        end;
        If wModulo = 'CP' Then // para contas a pagar considerar numero de dias do mes sempre 30 solicitacao grasiela
          Nr_Dias_Mes := 30;
        wVl_Juro := (wValor*(Power((1+(wTaxaJuro/100/Nr_Dias_Mes)),nr_dias))) - wValor;
      end;
      wValor := wValor + wVl_Juro;
      while wContinua = 'S' do
      begin
        // wVl_Juro := 0;
        wDD      := '01';
        wMM      := Copy(DateToStr(wDtRef),4,2);
        wYY      := Copy(DateToStr(wDtRef),7,4);
        wMM      := FloatToStr(StrToFloat(WMM) + 1);
        if StrToFloat(WMM) > 12 Then
        begin
          wMM := '1';
          wYY := FloatToStr(StrToFloat(wYY) + 1);
        end;
        wDt_Final_Mes := StrToDate((wDD+'/'+wMM+'/'+wYY));  // só para montar uma data paga pegar nr dias do mes
        Nr_Dias_Mes   :=DMOracle.DiasNoMes(wDt_Final_Mes);
        wDt_Final_Mes := StrToDate((FloatToStr(Nr_Dias_mes)+'/'+wMM+'/'+wYY));
        if wDt_Final_Mes > wDataAtual Then
        begin
          wContinua := 'N';
          nr_dias := (wDataAtual-wDtRef);
        end
        else
           nr_dias := wDt_Final_Mes - WdtRef;

        If wModulo = 'CP' Then // para contas a pagar considerar numero de dias do mes sempre 30 solicitacao grasiela
          Nr_Dias_Mes := 30;
        wVl_Juro := (wValor*(Power((1+(wTaxaJuro/100/Nr_Dias_Mes)),nr_dias))) - wValor;
        wValor   := wValor + wVL_Juro;
        wDtRef   := wDt_Final_mes;
      end;
    end;
    Result:=(wValor - wVl_Titulo);
  end;
  If wTipoJuro = 'INPC' Then
  Begin
    wVl_Juro := 0;
    wMM := FormatDateTime('MM',wDataCapitalizacao);
    DMMoeda.QCotacao.Close;
    DMMoeda.QCotacao.SetVariable('Cod_Moeda',wMoeda);
    DMMoeda.QCotacao.SetVariable('Data_I',StrToDate('01'+'/'+FormatDateTime('MM',wDataCapitalizacao)+'/'+FormatDateTime('YYYY',wDataCapitalizacao)));
    DMMoeda.QCotacao.Open;
    While Not(DMMoeda.QCotacao.Eof) do
    Begin
      wMesMoeda := StrToInt(FormatDateTime('MM',DMMoeda.QCotacaoDt_Cotacao.Value));
      If wMesMoeda <> StrToInt(wMM) Then
       Begin
         DMMoeda.QCotacao.Next;           // esta rotina serve para calcular o valor do juro do mes da capitalizacao
         Continue;                        // caso o dia da capitalizacao seja dia 15 somente pode calcular ate o final do mes
       End;
       nr_dias := DMOracle.DiasNoMes(StrToDate('01/'+IntToStr(wMesMoeda)+'/2000'));  // somente para saber quantos dias tem no mes
       wdd := FormatDateTime('DD',wDataCapitalizacao);
       wVl_Juro := (DMMoeda.QCotacaoVLR_Cotacao.Value / nr_dias) * (nr_dias - StrToInt(wdd)) * wValor / 100 ;
       wIndice := wIndice + wTaxaJuro / nr_dias * (nr_dias - StrToInt(wdd));
       DMMoeda.QCotacao.Next;  // para o proximo mes
       Break;
    End;
    wMM := FormatDateTime('MM',wDataAtual);
    While Not(DMMoeda.QCotacao.Eof) do   //agora vai calcular o juro ate o mes atual
    Begin
      wMesMoeda := StrToInt(FormatDateTime('MM',DMMoeda.QCotacaoDt_Cotacao.Value));
      If wMesMoeda = StrToInt(wMM) Then
         Break;
      wVl_Juro := wVl_Juro + DMMoeda.QCotacaoVLR_Cotacao.Value * (wValor + wVl_Juro)  / 100 ;
      wIndice := wIndice + wTaxaJuro; // calcula o indice para aplicar no final
      DMMoeda.QCotacao.Next;
    End;
    If Not(DMMoeda.QCotacao.Eof) Then  // agora vai calcular o juro do ultimo mes ate o dia atual somente
     Begin
       nr_dias := DMOracle.DiasNoMes(StrToDate('01/'+wMM+'/2000'));   // somente para saber quantos dias tem no mes
       wdd := FormatDateTime('DD',wDataAtual);
       wVl_Juro := wVl_Juro +(DMMoeda.QCotacaoVLR_Cotacao.Value / nr_dias) * StrToInt(wdd) * (wValor + wVl_Juro) / 100 ;
       wIndice := wIndice + wTaxaJuro / nr_dias * (nr_dias - StrToInt(wdd));
     End;
     If wTaxaJuro <> 0 Then
        wVl_Juro := wVl_Juro + wVl_Titulo * wIndice / 100;
     Result := wVl_Juro;
  End;
  If wMulta > 0 Then
     wMulta := wVl_Titulo * wMulta / 100;
  Result := Trunc( ((Result + wMulta)*100)) / 100 ;
end;

procedure TDMContasReceber.ExcluiMovimentos(wCodigo:Integer);
Var wCodigo_Caixa : String;
begin
// Exclui os lançamentos contábeis e os movimentos
  QContasReceber_Mov.First;
  While not QContasReceber_Mov.Eof Do
  Begin
     If QContasReceber_MovCod_Lancto_Contabil_Cred.Value > 0 Then
        DMPlanilha.Descontabiliza(QContasReceber_MovCod_Lancto_Contabil_Cred.Value,'CR_CP_MOV');
     If QContasReceber_MovCod_Lancto_Contabil_Deb.Value > 0 Then
        DMPlanilha.Descontabiliza(QContasReceber_MovCod_Lancto_Contabil_Deb.Value,'CR_CP_MOV');
     QContasReceber_Mov.Delete;
//     QContasReceber_Mov.Next;
  End;
//  QExcluiMov.SetVariable('COD_CONTA_RECEBER',wCodigo);
//  QExcluiMov.ExecSQL;
  QExcluiMovBanco.SetVariable('COD_CONTA_RECEBER',wCodigo);
  QExcluiMovBanco.ExecSQL;
  wCodigo_Caixa:=DMOracle.BuscaNome('SELECT COD_CAIXA_MOV FROM TB_CAIXA_MOV','COD_CONTA_RECEBER_CAB ='+FloatToStr(wCodigo),True);
  If Trim(wCodigo_Caixa) <> '' Then
     DMPlanilha.Descontabiliza(StrToInt(wCodigo_Caixa),'CX');
  QExcluiMovCaixa.SetVariable('COD_CONTA_RECEBER',wCodigo);
  QExcluiMovCaixa.ExecSQL;
End;

procedure TDMContasReceber.QContasReceber_CabCalcFields(DataSet: TDataSet);
var x, y: array of string;
begin
  setLength(x, 7); //7 sql diferentes
  setLength(y, 7);

  x[0] := 'SELECT DESC_FINALIDADE FROM TB_FINALIDADE WHERE COD_FINALIDADE ='+IntToStr(QContasReceber_CabCod_Finalidade.Value);
  x[1] := 'SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA WHERE COD_BANCO_AGENCIA ='+FloatToStr(QContasReceber_CabCod_Banco_Agencia.Value);
  x[2] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO ='+FloatToStr(QContasReceber_CabCod_Cadastro.Value);
  x[3] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL ='+FloatToStr(QContasReceber_CabCod_Filial.Value);
  x[4] := 'SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO WHERE COD_DEPARTAMENTO ='+FloatToStr(QContasReceber_CabCod_Departamento.Value);
  x[5] := 'SELECT NOME FROM TB_VENDEDOR WHERE COD_VENDEDOR ='+FloatToStr(QContasReceber_CabCod_Vendedor.Value);
  x[6] := 'SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE WHERE COD_CONTA_CORRENTE ='+FloatToStr(QContasReceber_CabCod_Conta_Corrente.Value);
  DMOracle.BuscaNomes(x, y);

  QContasReceber_Cabdesc_finalidade.value:= Y[0];
  QContasReceber_Cabdesc_agencia.value:= Y[1];
  QContasReceber_Cabdesc_cliente.value:= Y[2];
  QContasReceber_Cabdesc_filial.value:= Y[3];
  QContasReceber_Cabdesc_departamento.value:= Y[4];
  QContasReceber_Cabdesc_Vendedor.value:= Y[5];
  QContasReceber_Cabdesc_conta_corrente.value:= Y[6];
end;

procedure TDMContasReceber.QContasReceber_CabAfterInsert(
  DataSet: TDataSet);
begin
  // QContasReceber_CabCod_conta_receber_cab.value:=DMOracle.Sequencia('CONTA_RECEBER');
  QContasReceber_CabInd_situacao.value:='ABERTO';
  QContasReceber_CabInd_Aceite.Value:='NAO';
  QContasReceber_CabDt_Emissao.Value:=DMOracle.DataServ;
  QContasReceber_CabVal_Juros.Value:=0;
  QContasReceber_CabCod_filial.Value:=DMUsuario.CodFilialUsuario;
  QContasReceber_CabCod_Departamento.Value:=1;
end;

procedure TDMContasReceber.QContasReceber_CabBeforeEdit(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContasReceber.QContasReceber_CabBeforeInsert(
  DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContasReceber.QContasReceber_CabAfterPost(DataSet: TDataSet);
begin
  if QContasReceber_MovCod_Conta_Receber_Mov.Value=0 then // Verificar se existe algum Registro
    begin
      QContasReceber_Mov.Insert; // inserção do Movimento
      QContasReceber_MovVal_Movimento.Value:=QContasReceber_CabVal_Titulo.Value;
      QContasReceber_MovInd_Tipo_Movimento.Value:='PRINCIPAL';
      QContasReceber_Mov.Post;
    end;
end;

procedure TDMContasReceber.QContasReceber_CabBeforePost(DataSet: TDataSet);
Var wDtCapitalizacao,wVlMovimento : String;
begin
  If QContasReceber_Cab.State = dsInsert then
    Begin
     If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >=  QContasReceber_CabDt_Emissao.Value Then
        Raise Exception.Create('Não é Permitido Incluir Este Título - Fechamento Contabil');

     QContasReceber_CabDt_Movimento.Value:=DMOracle.DataHoraServ;
     if QContasReceber_CabNum_Titulo.Value=0 then
       QContasReceber_CabNum_Titulo.Value:=DMSequencia.Sequencia(Trunc(QContasReceber_CabCod_Filial.Value),'Num_Titulo_CR');
     If QContasReceber_CabVal_Original.isNull then   // No caso da Inclusão
       QContasReceber_CabVal_Original.value:=QContasReceber_CabVal_Titulo.Value;
     QContasReceber_CabDt_Capitalizacao_Moeda.value:=QContasReceber_CabDt_Emissao.Value;
    End;
//     if QContasReceber_Cab.State <> dsEdit then
  If ((QContasReceber_CabVal_Original.value = QContasReceber_CabVal_Titulo.Value) And
     (QContasReceber_CabVal_Juros.value = 0) And (QContasReceber_CabInd_Situacao.Value = 'ABERTO')) OR
     (QContasReceber_CabDt_Capitalizacao.Text = '') Then
   begin
     wVlMovimento := DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB  = '+QContasReceber_CabCod_Conta_Receber_Cab.Text + ' And IND_TIPO_MOVIMENTO <> '+Chr(39)+'PRINCIPAL'+Chr(39));
     if wVlMovimento = '' Then
       If DMOracle.BuscaNome('SELECT IND_ENCARGO FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(QContasReceber_CabCod_Finalidade.Value),True) = 'EMISSAO' Then
         QContasReceber_CabDt_Capitalizacao.Value:=QContasReceber_CabDt_Emissao.Value //Data de Capitalizacao é a Data de Emissão
       Else
         QContasReceber_CabDt_Capitalizacao.Value:=QContasReceber_CabDt_Vencimento.Value; //Data de Capitalizacao é a Data de Vencimento
   End
  Else
   Begin
     If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' Then
     Begin
       wDtCapitalizacao := DMOracle.BuscaNome('SELECT MAX(DT_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','COD_CONTA_RECEBER_CAB  = '+QContasReceber_CabCod_Conta_Receber_Cab.Text + ' And IND_TIPO_MOVIMENTO In ('+Chr(39)+'RECEBTO. PRINCIPAL'+Chr(39)+','+Chr(39)+'RECEBTO. JUROS'+Chr(39)+')');
       If wDtCapitalizacao <> '' Then
          If StrToDate(wDtCapitalizacao) > QContasReceber_CabDt_Capitalizacao.Value Then
             QContasReceber_CabDt_Capitalizacao.Value:=StrToDate(wDtCapitalizacao);
     End;     
   End;
   if QContasReceber_CabDT_VENCIMENTO.Text = '' then
     Raise Exception.Create('Contas a receber sem data de vencimento');
end;

procedure TDMContasReceber.QContasReceber_MovAfterInsert(DataSet: TDataSet);
begin
  QContasReceber_MovCod_Conta_Receber_Cab.Value:=QContasReceber_CabCod_Conta_Receber_Cab.Value;
  //QContasReceber_MovCod_Conta_Receber_Mov.Value:=DMOracle.Sequencia('CONTA_RECEBER_MOV');
  QContasReceber_MovDT_Movimento.Value:=QContasReceber_CabDt_Emissao.Value; // para conseguir realizar os relatorios com data base
end;                                          // porque se colocar a data do servidor a data de emissao pode ficar diferente desta data ai da problema

procedure TDMContasReceber.QContasReceber_MovAfterPost(DataSet: TDataSet);
var wCodigo:Real;
begin
  wCodigo:=QContasReceber_MovCod_Conta_Receber_Mov.Value;
  QContasReceber_Mov.DisableControls;
  QContasReceber_Mov.Close;
  QContasReceber_Mov.Open;
  QContasReceber_Mov.Locate('COD_CONTA_RECEBER_MOV',wCodigo,[]);
  QContasReceber_Mov.EnableControls;
end;

procedure TDMContasReceber.QContasReceber_MovBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
     Raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Receber.');
  If QContasReceber_Cab.State=dsInsert then
    Begin
      QContasReceber_Cab.post;
      QContasReceber_Cab.edit;
    End;
end;

procedure TDMContasReceber.QContasReceber_MovBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then //Se o contas a Receber "Cabeçário" não estiver com a Transação em Aberto
    Begin
      Raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Receber.');
    End;
  If QContasReceber_Cab.State=dsInsert then
    Begin
      QContasReceber_Cab.post;
      QContasReceber_Cab.edit;
    End;
end;

procedure TDMContasReceber.QContasReceber_MovBeforePost(DataSet: TDataSet);
begin
  QContasReceber_MovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QContasReceber_MovDT_Usuario.Value:=DMOracle.DataHoraServ;
end;

procedure TDMContasReceber.QContasReceberBaixaCalcFields(
  DataSet: TDataSet);
var wDataCapitalizacao,wTipoJuro,wDiasCarencia:String;
    wTaxa,wMoeda,wValor_Capitalizacao,wPerc_Juro_Mora: Real;
begin
//  QContasReceberBaixaDesc_Finalidade.value:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QContasReceberBaixaCod_Finalidade.Value));
  wValor_Capitalizacao:=0;
  wDataCapitalizacao:=DateToStr(DMContasReceber.QContasReceberBaixaDt_Capitalizacao.Value);
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') Then
   Begin
    wTipoJuro:=QContasReceberBaixaNUM_TIPO_JURO.Text;
    If QContasReceberBaixaInd_Situacao.Value = 'ABERTO' Then // Carencia somente na primeira baixa do titulo
       wDiasCarencia:=QContasReceberBaixaNUM_DIAS_CARENCIA.Text;
    If wDiasCarencia = '' Then
       wDiasCarencia := '0';
    wTaxa := 0;
    if QContasReceberBaixaPerc_Taxa.Text <> '' Then
       wTaxa  := QContasReceberBaixaPerc_Taxa.value;
    wPerc_Juro_Mora := 0;
    if (QContasReceberBaixaPerc_Juro_Mora.Text <> '') And (QContasReceberBaixaInd_Situacao.Value = 'ABERTO' )Then
       wPerc_Juro_Mora  := QContasReceberBaixaPerc_Juro_Mora.value;
    wMoeda:=QContasReceberBaixaCOD_MOEDA.Value;
    QContasReceberBaixaval_juros_calculado.Value:=QContasReceberBaixaVal_Titulo.Value + QContasReceberBaixaVal_Juros.Value;
    If (wTipoJuro <> 'SEM JUROS') And (PCalculaJuros = True) then
      Begin
        wValor_Capitalizacao:=CalculaJuros(QContasReceberBaixaVal_Titulo.Value+QContasReceberBaixaVal_Juros.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
             StrToDate(wDataCapitalizacao),pDataBase,QContasReceberBaixaDt_Capitalizacao_Moeda.Value,wTipoJuro,wDiasCarencia,'CR');
        wValor_Capitalizacao:=(Trunc(wValor_Capitalizacao*100)/100);
        if wValor_Capitalizacao > 0.001 then
           QContasReceberBaixaval_juros_calculado.Value:=wValor_Capitalizacao + QContasReceberBaixaVal_Titulo.Value + QContasReceberBaixaVal_Juros.Value;
      End; //if sem juro
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
   If QContasReceberBaixaInd_Situacao.Value <> 'ABERTO' Then
     QContasReceberBaixaVal_Recebido.Text := DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV ','COD_CONTA_RECEBER_CAB = '+QContasReceberBaixaCod_Conta_Receber_Cab.Text+
                  ' AND IND_TIPO_MOVIMENTO <> '+chr(39)+'PRINCIPAL'+Chr(39)+' AND IND_TIPO_MOVIMENTO <> '+Chr(39)+'JUROS'+Chr(39));
end;

procedure TDMContasReceber.QContasReceberBaixaMovBeforePost(
  DataSet: TDataSet);
begin
  If pBaixaMagenetico <> 'S' Then
    QContasReceberBaixaMovCod_Conta_Receber_Cab.Value:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
  QContasReceberBaixaMovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QContasReceberBaixaMovDT_Usuario.Value:=DMOracle.DataHoraServ;
end;

procedure TDMContasReceber.QLiberaBaixaCalcFields(DataSet: TDataSet);
begin
  QLiberaBaixadesc_cliente.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO ='+FloatToStr(QLiberaBaixaCod_Cadastro.Value),True);
end;

procedure TDMContasReceber.QRContasReceber_TitulosAbertoCalcFields(
  DataSet: TDataSet);
var
  ValorPago,wDataCapitalizacao:String;
  wValor_Juros,wRecebto,wPerc_Juro_Mora:Real;
begin
  wRecebto := 0;   // Variavel inicializada.
  QRContasReceber_TitulosAbertoValorPago.Value:=0;
  If (QRContasReceber_TitulosAbertoInd_Situacao.Value <> 'ABERTO') And (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') Then
  Begin    // o que muda da consulta anterior é somente a data de movimento para data do usuario
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_TitulosAbertoCod_Conta_Receber_Cab.Value)+
     ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'JUROS'+CHR(39)+
     ') AND (DT_MOVIMENTO <='+chr(39)+DateToStr(pDataBase)+chr(39)+')');
     If Trim(ValorPago)<>'' then
       QRContasReceber_TitulosAbertoValorPago.Value:=StrToFloat(Trim(ValorPago));
     wRecebto := 0;  // esta rotina serve para calcular o valor recebido apos a data emissão de referencia
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_TitulosAbertoCod_Conta_Receber_Cab.Value)+
     ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. PRINCIPAL'+CHR(39)+
     ') OR   (IND_TIPO_MOVIMENTO='+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+')) AND (DT_MOVIMENTO >'+chr(39)+DateToStr(pDataBase)+chr(39)+')');
    If Trim(ValorPago)<>'' then
      wRecebto:=StrToFloat(Trim(ValorPago));
  End;
  // wValor_Juros:=0;
  wDataCapitalizacao:=DateToStr(QRContasReceber_TitulosAbertoDt_Capitalizacao.Value);
  QRContasReceber_TitulosAbertoVal_Titulo.Value:=QRContasReceber_TitulosAbertoValT_Titulo.Value + wRecebto;
  If QRContasReceber_TitulosAbertoNum_tipo_juro.value <> 'SEM JURO' then
  Begin
    wPerc_Juro_Mora := 0;
    if (QRContasReceber_TitulosAbertoPerc_Juro_Mora.Text <> '') And (QRContasReceber_TitulosAbertoInd_Situacao.Value = 'ABERTO' )Then
       wPerc_Juro_Mora  := QRContasReceber_TitulosAbertoPerc_Juro_Mora.value;
    wValor_Juros:=CalculaJuros(QRContasReceber_TitulosAbertoVal_Titulo.Value + QRContasReceber_TitulosAbertoVal_Juros.Value,QRContasReceber_TitulosAbertoPerc_Taxa.Value,wPerc_Juro_Mora,QRContasReceber_TitulosAbertoCod_Moeda.Value,
                 StrToDate(wDataCapitalizacao),pDataReferencia,QRContasReceber_TitulosAbertoDt_Capitalizacao_Moeda.Value,QRContasReceber_TitulosAbertoNum_Tipo_Juro.Value,QRContasReceber_TitulosAbertoNum_Dias_Carencia.Text,'CR');
    wValor_Juros:=(Round(wValor_Juros*100)/100);
    if wValor_Juros>0.001 then
       QRContasReceber_TitulosAbertosVal_Juros.Text:=FloatToStr(QRContasReceber_TitulosAbertosVal_Juros.Value + wValor_Juros);
  End; //if sem juro
  QRContasReceber_TitulosAbertosVal_Juros.Text:=FloatToStr(QRContasReceber_TitulosAbertosVal_Juros.Value + QRContasReceber_TitulosAbertoVal_Juros.Value);
  If QRContasReceber_TitulosAbertoCod_Banco_Agencia.Text <> '' Then
     QRContasReceber_TitulosAbertoDesc_Sigla_Banco.value:=DMOracle.BuscaNome('SELECT DESC_SIGLA FROM TB_BANCO_AGENCIA ','COD_BANCO_AGENCIA = '+FloatToStr(QRContasReceber_TitulosAbertoCod_Banco_Agencia.Value),True);
end;

procedure TDMContasReceber.QRContasReceber_TitulosBaixadosCalcFields(
  DataSet: TDataSet);
var
  ValorPago:String;
begin
//  ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_TitulosBaixadosCod_Conta_Receber_Cab.Value)+
//  ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. PRINCIPAL'+CHR(39)+
//  ') OR (IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. JUROS'+CHR(39)+
//  ')) AND (DT_MOVIMENTO >= To_Date('+chr(39) +DateToStr(pDataInicial)+chr(39)+','+chr(39)+'dd/mm/yy'+chr(39) +
//  ')) AND (DT_MOVIMENTO <=  To_Date('+chr(39)+DateToStr(pDataFinal)+chr(39)+','+chr(39)+'dd/mm/yy'+chr(39)+'))');
//  If Trim(ValorPago)<>'' then
//    QRContasReceber_TitulosBaixadosValorPago.Value:=StrToFloat(ValorPago)
//  Else
//    QRContasReceber_TitulosBaixadosValorPago.Value:=0;
end;

procedure TDMContasReceber.IncluiCR(wCodDocOrigem: Integer;
                                    wNumTitulo, wParcela: Integer;
                                    wFinalidade,wDepartamento,wBancoAgencia,
                                    wCadastro,wFilial: Integer;
                                    wValTitulo : Real;
                                    wTipoDocumento : String;
                                    wDtVencimento, wEmissao : TDateTime );
begin
  // Gera Contas a Receber;
  Try
    QContasReceber_Cab.Open;
    QContasReceber_Mov.Open;
    QContasReceber_Cab.Insert;
    If ((wTipoDocumento = 'NF') or (wTipoDocumento = 'OS')) and (wCodDocOrigem > 0 ) Then
      QContasReceber_cabCOD_NOTA_CAB.Value := wCodDocOrigem;

    QContasReceber_cabCOD_FINALIDADE.Value := wFinalidade;
    If wBancoAgencia > 0 Then
      QContasReceber_cabCOD_BANCO_AGENCIA.Value := wBancoAgencia;
    QContasReceber_cabCOD_CADASTRO.Value := wCadastro;
    QContasReceber_cabCOD_FILIAL.Value := wFilial;
    QContasReceber_cabCOD_DEPARTAMENTO.Value := wDepartamento;
    QContasReceber_cabNUM_TITULO.Value := wNumTitulo;
    QContasReceber_cabNUM_PARCELA.Value := wParcela;
    QContasReceber_cabDESC_TIPO_DOCUMENTO.Value := wTipoDocumento;
    QContasReceber_cabDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
    QContasReceber_cabDT_VENCIMENTO.Value := wDtVencimento;
    QContasReceber_cabDT_EMISSAO.Value := wEmissao;
    With DMFinalidade do
    Begin
      QFinalidade.Close;
      QFinalidade.SetVariable('PK',wFinalidade);
      QFinalidade.Open;
      If QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
         QContasReceber_cabDT_CAPITALIZACAO.Value := QContasReceber_cabDT_EMISSAO.Value
      Else
         QContasReceber_cabDT_CAPITALIZACAO.Value := QContasReceber_cabDT_VENCIMENTO.Value;
    End;
    QContasReceber_cabVAL_TITULO.Value := wValTitulo;
    QContasReceber_cabVAL_ORIGINAL.Value := wValTitulo;
    QContasReceber_cab.Post;
  Except
    If QContasReceber_Cab.State in [dsEdit,dsInsert] Then
      QContasReceber_Cab.Cancel;
    Raise;
  End;
end;

procedure TDMContasReceber.QRBloquetoCalcFields(DataSet: TDataSet);
begin
  If QRBloquetoPERC_JURO_BLOQUETO.value <> 0 Then
  Begin
    if QRBloquetoind_tipo_juro.Value='VALOR' then
      QRBloquetoinstrucao_juro.Value:='Juro diario de R$ '+FormatFloat('#,##0.00',((QRBloquetoPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRBloquetoDT_VENCIMENTO.Value))*(QRBloquetoVal_Titulo.Value/100)))+' por atraso de Pgto.'
    else
      QRBloquetoinstrucao_juro.Value:='Juro de '+FormatFloat('#,##0.0000',(QRBloquetoPERC_JURO_BLOQUETO.value)/DMoracle.DiasNoMes(QRBloquetoDT_VENCIMENTO.Value))+'% por dia por atraso de Pgto.';
  End;
  if QRBloquetoCod_Vendedor.Text <> '' then
     QRBloquetoNome_Vendedor.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ QRBloquetoCod_Vendedor.Text,True);
  QRBloquetoVal_Acrescimo.Value := 0;
end;

procedure TDMContasReceber.QRRecibosCalcFields(DataSet: TDataSet);
var
  wDataCapitalizacao:String;
  wValor_juro,wPerc_Juro_Mora:Real;
begin
  If QRRecibosInd_tipo_juro.value <> 'SEM JURO' then
    Begin
      wPerc_Juro_Mora := 0;
      if (QRRecibosPerc_Juro_Mora.Text <> '') And (QRRecibosInd_Situacao.Value = 'ABERTO' )Then
         wPerc_Juro_Mora  := QRRecibosPerc_Juro_Mora.value;
      wDataCapitalizacao:=DateToStr(DMContasReceber.QRRecibosDt_Capitalizacao.Value);
      wValor_Juro:=CalculaJuros(QRRecibosVal_Titulo.Value+QRRecibosVal_Juros.Value,QRRecibosPerc_Taxa.Value,wPerc_Juro_Mora,QRReciboscod_moeda.Value,
                   StrToDate(wDataCapitalizacao),DMOracle.DataServ,QRRecibosDt_Capitalizacao_Moeda.Value,QRRecibosind_tipo_juro.Value,'0','CR');
      if wValor_Juro>0.009 then
         QRRecibosVal_Juros_calc.Value:=QRRecibosVal_Juros.Value+wValor_Juro;
    end;
end;

procedure TDMContasReceber.QRContasReceber_DuplicatasCalcFields(
  DataSet: TDataSet);
begin
  if QRContasReceber_Duplicatascod_nota_cab.Value > 0 then
  begin
    QRContasReceber_Duplicatasnum_nota.value:=StrToFloat(DMoracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+QRContasReceber_DuplicatasCOD_NOTA_CAB.Text,True));
    QRContasReceber_Duplicatasval_nota.value:=StrToFloat(DMoracle.BuscaNome('SELECT SUM(VAL_TOTAL+VAL_IPI) FROM TB_NOTA_ITEM','COD_NOTA_CAB = '+QRContasReceber_DuplicatasCOD_NOTA_CAB.Text));
  end;
  if QRContasReceber_DuplicatasCOD_VENDEDOR.value > 0 then
     QRContasReceber_Duplicatasvendedor.value:=(DMoracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+QRContasReceber_DuplicatasCOD_VENDEDOR.text,True));

  QRContasReceber_DuplicatasEXTENSO.Value:=Bib.extenso(QRContasReceber_DuplicatasVAL_TITULO.Value,'REAL');

end;

procedure TDMContasReceber.QRContasReceber_Tit_Abertos_vendCalcFields(
  DataSet: TDataSet);
Var wValor_Juros,wPerc_Juro_Mora:Real;
    wDataCapitalizacao:String;
begin
  // wValor_Juros:=0;
  wDataCapitalizacao:=DateToStr(QRContasReceber_Tit_Abertos_vendDt_Capitalizacao.Value);
  QRContasReceber_Tit_Abertos_vendsVal_Juros.Text:=FloatToStr(QRContasReceber_Tit_Abertos_vendVal_Titulo.Value + QRContasReceber_Tit_Abertos_vendVal_Juros.Value);
  If QRContasReceber_Tit_Abertos_vendNum_tipo_juro.value <> 'SEM JURO' then
  Begin
    wPerc_Juro_Mora := 0;
    if (QRContasReceber_Tit_Abertos_vendPerc_Juro_Mora.Text <> '') And (QRContasReceber_Tit_Abertos_vendInd_Situacao.Value = 'ABERTO' )Then
       wPerc_Juro_Mora  := QRContasReceber_Tit_Abertos_vendPerc_Juro_Mora.value;
    wValor_Juros:=CalculaJuros(QRContasReceber_Tit_Abertos_vendVal_Titulo.Value+QRContasReceber_Tit_Abertos_vendVal_Juros.Value,QRContasReceber_Tit_Abertos_vendPerc_taxa.Value,wPerc_Juro_Mora,QRContasReceber_Tit_Abertos_vendcod_moeda.Value,
                 StrToDate(wDataCapitalizacao),pDaTaReferencia,QRContasReceber_Tit_Abertos_vendDt_Capitalizacao_Moeda.Value,QRContasReceber_Tit_Abertos_vendNum_tipo_juro.Value,'0','CR');
    wValor_Juros:=(Round(wValor_Juros*100)/100);
    if wValor_Juros>0.001 then
       QRContasReceber_Tit_Abertos_vendsVal_Juros.Text:=FloatToStr(wValor_Juros + QRContasReceber_Tit_Abertos_vendVal_Titulo.Value + QRContasReceber_Tit_Abertos_vendVal_Juros.Value);
  End; //if sem juro

end;

procedure TDMContasReceber.QRContasReceber_CabCalcFields(
  DataSet: TDataSet);
var wValor_Juros,wPerc_Juro_Mora:Real;
    wDataCapitalizacao:String;
begin
  // wValor_Juros:=0;
  wDataCapitalizacao :=DateToStr(DMContasReceber.QRContasReceber_CabDt_Capitalizacao.Value);
  QRContasReceber_CabsVal_Juros.Text:=FloatToStr(QRContasReceber_CabVal_Titulo.Value+QRContasReceber_CabVal_Juros.Value);

  if QRContasReceber_CabNum_tipo_juro.value <> 'SEM JURO' then
  begin
    wPerc_Juro_Mora := 0;
    if (QRContasReceber_CabPerc_Juro_Mora.Text <> '') And (QRContasReceber_CabInd_Situacao.Value = 'ABERTO' )Then
       wPerc_Juro_Mora  := QRContasReceber_CabPerc_Juro_Mora.value;
    wValor_Juros:=CalculaJuros(QRContasReceber_CabVal_Titulo.Value+
                               QRContasReceber_CabVal_Juros.Value,
                               QRContasReceber_CabPerc_Taxa.Value,wPerc_Juro_Mora,
                               QRContasReceber_CabCod_Moeda.Value,
                               StrToDate(wDataCapitalizacao),pDataReferencia,
                               QRContasReceber_CabDt_Capitalizacao_Moeda.Value,
                               QRContasReceber_CabNum_Tipo_Juro.Value,
                               QRContasReceber_CabNum_Dias_Carencia.text,'CR');

    wValor_Juros:=(round(wValor_Juros*100)/100);

    if wValor_Juros>0.001 then
       QRContasReceber_CabsVal_Juros.Text:=FloatToStr(wValor_Juros + QRContasReceber_CabVal_Juros.Value)
    else
       QRContasReceber_CabsVal_Juros.Text:=FloatToStr(QRContasReceber_CabVal_Juros.Value);
    end //if sem juro

  else
     QRContasReceber_CabsVal_Juros.Text:=FloatToStr(QRContasReceber_CabVal_Juros.Value);

end;

procedure TDMContasReceber.QContasReceber_MovCalcFields(DataSet: TDataSet);
Var wConta : String;
begin
  if (QContasReceber_MovInd_Tipo_Movimento.Text <> 'PRINCIPAL') And
     (QContasReceber_MovInd_Tipo_Movimento.Text <> 'JUROS') Then
  begin
    if QContasReceber_MovCod_Bco_Movimento.Text <> '' Then
    begin
      wConta := DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO ='+FloatToStr(QContasReceber_MovCod_Bco_Movimento.Value),True);
      If wconta <> '' Then
         QContasReceber_Movdesc_Caixa_Banco.value:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE ='+wConta,True);
    end
    else
      if QContasReceber_MovCod_Caixa_Mov.Text <> '' Then
         QContasReceber_Movdesc_Caixa_Banco.value:= 'Caixa'
      Else
         QContasReceber_Movdesc_Caixa_Banco.value:= 'Contabil';
  end;
end;

procedure TDMContasReceber.QRContasReceber_VencimentosCalcFields(
  DataSet: TDataSet);
Var wRecebto : Real;
    ValorPago : STring;
begin
  wRecebto := 0;  // esta rotina serve para calcular o valor recebido apos a data emissão de referencia
  If QRContasReceber_VencimentosInd_Situacao.Value <> 'ABERTO' Then
  Begin
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_VencimentosCod_Conta_Receber_Cab.Value)+
       ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. PRINCIPAL'+CHR(39)+
       ') OR   (IND_TIPO_MOVIMENTO='+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+')) AND (Trunc(DT_USUARIO) >'+chr(39)+DateToStr(pDataBase)+chr(39)+')')
    Else
       ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_VencimentosCod_Conta_Receber_Cab.Value)+
       ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. PRINCIPAL'+CHR(39)+
       ') OR   (IND_TIPO_MOVIMENTO='+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+')) AND (DT_MOVIMENTO >'+chr(39)+DateToStr(pDataBase)+chr(39)+')');
    If Trim(ValorPago)<>'' then
      wRecebto:=StrToFloat(ValorPago);
  End;
  QRContasReceber_VencimentosVal_Titulo.Value := QRContasReceber_VencimentosValor.Value + wRecebto;
end;

procedure TDMContasReceber.QContasReceber_CabCOD_CADASTROValidate(
  Sender: TField);
Var wVendedor : String;
begin
  if Trim(QContasReceber_CabCOD_CADASTRO.Text) <> '' then
  begin
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContasReceber_CabCOD_CADASTRO.Text,True)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
    wVendedor:=DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO',' COD_CADASTRO = '+QContasReceber_CabCOD_CADASTRO.Text,True);
    If wVendedor <> '' Then
       QContasReceber_CabCod_Vendedor.Value := StrToInt(wVendedor);
  end;
end;

procedure TDMContasReceber.QCapitalizacaoCalcFields(DataSet: TDataSet);
var wTesta_Nulo:String;
begin
  QCapitalizacaoInd_Tipo_juro.Value:=DMOracle.BuscaNome('SELECT NUM_TIPO_JURO FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);
  wTesta_Nulo:=DMOracle.BuscaNome('SELECT COD_MOEDA FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);
  If wTesta_Nulo<>'' then
    QCapitalizacaocod_moeda.value:=StrToInt(Trim(wTesta_Nulo));

  wTesta_Nulo:=DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);
  If wTesta_Nulo<>'' then
    QCapitalizacaotaxa_juro.value:=StrToFloat(wTesta_Nulo);

  wTesta_Nulo:=DMOracle.BuscaNome('SELECT COD_HISTORICO_JURO FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);
  If wTesta_Nulo<>'' then
    QCapitalizacaocod_historico_Juro.value:=StrToInt(Trim(wTesta_Nulo));

  wTesta_Nulo:=DMOracle.BuscaNome('SELECT PERC_JURO_MORA FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);
  If wTesta_Nulo<>'' then
    QCapitalizacaoPerc_juro_mora.value:=StrToInt(Trim(wTesta_Nulo));


  QCapitalizacaoInd_Tipo_juro.Value:=DMOracle.BuscaNome('SELECT NUM_TIPO_JURO FROM TB_FINALIDADE ','COD_FINALIDADE = '+FloatToStr(QCapitalizacaoCod_Finalidade.Value),True);

end;

procedure TDMContasReceber.QCapitalizacaoMovAfterInsert(DataSet: TDataSet);
begin
  QCapitalizacaoMovCod_Conta_Receber_Mov.Value:=DMOracle.Sequencia('CONTA_RECEBER_MOV');
  QCapitalizacaoMovCod_Conta_Receber_Cab.Value:=QCapitalizacaoCod_Conta_Receber_Cab.Value;
  QCapitalizacaoMovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QCapitalizacaoMovDT_Usuario.Value:=DMOracle.DataHoraServ;
End;

procedure TDMContasReceber.QRComissaoCalcFields(DataSet: TDataSet);
Var wTotalNota, wPedido : String;
    wIndice, wComissao, wTotComissao : Real;
begin
  QRComissaoNr_Pedido.Value := QRComissaoNum_Pedido.Value;
  QRComissaoPerc_Comissao.Value := QRComissaoPc_Comissao.Value;
  If (QRComissaoCod_Nota_Cab.Value = 0) then // or (QRComissaoCod_Filial.Value = 99) Then retirado pelo César
   Begin
     If QRComissaoPerc_Comissao.Value <> 0 Then
        QRComissaoVal_Comissao.Value := QRComissaosVal_Total.Value * QRComissaoPc_Comissao.Value / 100
     else
        QRComissaoVal_Comissao.Value := 0;
   End
  Else
    Begin
      wPedido:=DMOracle.BuscaNome('SELECT NUM_PEDIDO FROM TB_NOTA_CAB','COD_NOTA_CAB = ' + QRComissaoCod_Nota_Cab.Text,True);
      If wPedido <> '' then
         QRComissaoNr_Pedido.Value := StrToInt(wPedido);
      wTotalNota := DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL-Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS + Tb_nota_item.VAL_ICMS_SUBST) FROM TB_NOTA_ITEM',
                    'COD_NOTA_CAB ='+FloatToStr(QRComissaoCod_Nota_Cab.Value));
      If (Trim(wTotalNota) <> '') And (Trim(wTotalNota) <> '0')Then
         wIndice := QRComissaoSVal_Total.Value / StrToFloat(wTotalNota)
      Else
         wIndice := 1;
      QNotaItem.Close;
      QNotaItem.SetVariable('COD_NOTA_CAB',QRComissaoCod_Nota_Cab.Value);
      QNotaItem.open;
      wTotComissao := 0;
      While Not QNotaItem.Eof Do
      Begin
        wComissao := (QNotaItemVal_Total.Value + QNotaItemVal_Despesas.Value -
                      QNotaItemVal_Desconto.Value) * wIndice;
        If QNotaItemPerc_Comissao.Value <> 0 Then
           wTotComissao := wTotComissao + wComissao * QNotaItemPerc_Comissao.Value / 100
        Else
           wTotComissao := wTotComissao + wComissao * QRComissaoPerc_Comissao.Value / 100;
        QNotaItem.Next;
      End;
      QNotaItem.Close;
      QRComissaoVal_Comissao.Value := wTotComissao;
    End;
//     If (QRComissaoPerc_Comissao.Value = 0) And (QRComissaosVal_Total.Value <> 0) Then
    If QRComissaoSVal_Total.Value > 0 Then
       QRComissaoPerc_Comissao.Value := QRComissaoVal_Comissao.Value / QRComissaosVal_Total.Value * 100
    Else
       QRComissaoPerc_Comissao.Value := 0;
end;

procedure TDMContasReceber.QContasReceber_CabDT_VENCIMENTOValidate(
  Sender: TField);
begin
  If DMContasReceber.QContasReceber_CabDt_Emissao.Value >  DMContasReceber.QContasReceber_CabDt_Vencimento.Value Then
     Raise Exception.Create('Data de Emissão Maior que Data de Vencimento');
end;

procedure TDMContasReceber.QContasReceber_CabCOD_CONTA_CORRENTEChange(
  Sender: TField);
begin
  If QContasReceber_CabCod_Conta_Corrente.Text <> '' Then
     QContasReceber_CabCod_Banco_Agencia.Value:=StrToInt(DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE',
                           'COD_CONTA_CORRENTE = '+FloatToStr(QContasReceber_CabCod_Conta_Corrente.Value),True));

end;

procedure TDMContasReceber.QRCartaCobrancaCalcFields(DataSet: TDataSet);
Var
  wDataCapitalizacao,wTipoJuro,wTaxa_Aux:String;
  wTaxa,wMoeda,wValor_Capitalizacao,wPerc_Juro_Mora : Real;
  wAno, wMes, wDia : Word;
const
  wMeses : array[1..12] of string = ('JANEIRO', 'FEVEREIRO', 'MARÇO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
  Begin
    DecodeDate(date,wAno,wMes,wDia);
    QRCartaCobrancadesc_local_data.Value :=
      QRCartaCobrancaCIDADE_FILIAL.Value + ', ' + inttostr(wDia) + ' DE ' + wMeses[wMes] + ' DE ' + inttostr(wAno) + '.';

    wDataCapitalizacao:=DateToStr(QRCartaCobrancaDt_Capitalizacao.Value);
    with DMContasReceber do
      begin
        wTipoJuro:=QRCartaCobrancaIND_TIPO_JURO.Text;
        wTaxa_Aux:=QRCartaCobrancaPERC_TAXA.Text;
        wTaxa := 0;
        if wTaxa_Aux <> '' Then
          wTaxa  := StrTofloat(wTaxa_Aux);
        wMoeda:=QRCartaCobrancaCOD_MOEDA.Value;
        QRCartaCobrancaVal_Atualizado.Value := QRCartaCobrancaVal_Titulo.Value;
        If wTipoJuro<>'SEM JURO' then
          Begin
            wPerc_Juro_Mora := 0;
            if (QRCartaCobrancaPerc_Juro_Mora.Text <> '') And (QRCartaCobrancaInd_Situacao.Value = 'ABERTO' )Then
               wPerc_Juro_Mora  := QRCartaCobrancaPerc_Juro_Mora.value;
            wValor_Capitalizacao:=CalculaJuros(QRCartaCobrancaVal_Titulo.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
                         StrToDate(wDataCapitalizacao),DMOracle.DataServ,QRCartaCobrancaDt_Capitalizacao_Moeda.Value,wTipoJuro,'0','CR');
            wValor_Capitalizacao:=(Round(wValor_Capitalizacao*100)/100);
            if wValor_Capitalizacao>0.001 then
               QRCartaCobrancaVal_Atualizado.Value:=QRCartaCobrancaVal_Atualizado.Value + wValor_Capitalizacao;
          End; //if sem juro
        End;
  End;
end;

procedure TDMContasReceber.QRemessaCalcFields(DataSet: TDataSet);
begin
  If QRemessaCOD_CONTA_CORRENTE.Text <> '' Then
  Begin
    QRemessanum_cgc_filial_conta.Value := DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'TB_FILIAL.COD_FILIAL =' + QRemessaCC_COD_FILIAL.Text,True );
  End;

  If QRemessaPERC_JURO_BLOQUETO.value <> 0 Then
  Begin
//    if QRemessaind_tipo_juro.Value='VALOR' then
//      QRemessainstrucao_juro.Value := QRemessaPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)
//    else
//      QRemessainstrucao_juro.Value := QRemessaPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value);

//--- comentado por Fabio 26/11/2004 -- calculo de valor de juro por dia errado pq nao era multiplicado pelo valor do titulo
    QRemessainstrucao_juro.Value := ((QRemessaPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value))*(QRemessaVal_Titulo.Value/100));
    QRemessaPerc_juro_dia.Value := QRemessaPERC_JURO_BLOQUETO.Value/DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value);

  End;
end;

procedure TDMContasReceber.QRContasReceber_FinalidadeCalcFields(
  DataSet: TDataSet);
var
  ValorPago : String;
  wRecebto : Real;
begin
  wRecebto := 0;   // Variavel inicializada.
  QRContasReceber_FinalidadeValorPago.Value:=0;
  If QRContasReceber_FinalidadeInd_Situacao.Value <> 'ABERTO' Then
  Begin    // o que muda da consulta anterior é somente a data de movimento para data do usuario
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_FinalidadeCod_Conta_Receber_Cab.Value)+
     ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'JUROS'+CHR(39)+
     ') AND (DT_MOVIMENTO <='+chr(39)+DateToStr(pDataBase)+chr(39)+')');
     If Trim(ValorPago)<>'' then
       QRContasReceber_FinalidadeValorPago.Value:=StrToFloat(ValorPago);
     wRecebto := 0;  // esta rotina serve para calcular o valor recebido apos a data emissão de referencia
     ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_RECEBER_MOV','(COD_CONTA_RECEBER_CAB = '+FloatToStr(QRContasReceber_FinalidadeCod_Conta_Receber_Cab.Value)+
     ') AND ((IND_TIPO_MOVIMENTO='+CHR(39)+'RECEBTO. PRINCIPAL'+CHR(39)+
     ') OR   (IND_TIPO_MOVIMENTO='+CHR(39)+'DESC. CONCEDIDO'+CHR(39)+')) AND (DT_MOVIMENTO >'+chr(39)+DateToStr(pDataBase)+chr(39)+')');
    If Trim(ValorPago)<>'' then
      wRecebto:=StrToFloat(ValorPago);
  End;
  QRContasReceber_FinalidadeVal_Titulo.Value := QRContasReceber_FinalidadeValT_Titulo.Value + wRecebto;
end;

procedure TDMContasReceber.QContasReceber_CabConsCalcFields(
  DataSet: TDataSet);
Var wDataCapitalizacao,wTipoJuro,wTaxa_Aux:String;
    wTaxa,wMoeda, wValor_Capitalizacao,wPerc_Juro_Mora: Real;
    wTitulo : String;
begin

  wValor_Capitalizacao:=0;
  wDataCapitalizacao:=DateToStr(QContasReceber_CabConsDt_Capitalizacao.Value);
//  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB' Then
//   Begin
     wTipoJuro:=QContasReceber_CabConsNUM_TIPO_JURO.Value;
     wTaxa_Aux:=QContasReceber_CabConsPERC_TAXA.Text;
     wTaxa := 0;
     if wTaxa_Aux <> '' Then
        wTaxa  := StrToFloat(wTaxa_Aux);
     wMoeda:=QContasReceber_CabConsCOD_MOEDA.Value;
     If wTipoJuro <> 'SEM JURO' then
      Begin
        wPerc_Juro_Mora := 0;
        wTitulo := IntToStr(QContasReceber_CabConsCOD_CONTA_RECEBER_CAB.Value);
        if (QContasReceber_CabConsPerc_Juro_Mora.Text <> '') And (QContasReceber_CabConsInd_Situacao.Value = 'ABERTO' )Then
           wPerc_Juro_Mora  := QContasReceber_CabConsPerc_Juro_Mora.value;
        wValor_Capitalizacao:=CalculaJuros(QContasReceber_CabConsVal_Titulo.Value+QContasReceber_CabConsVal_Juros.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
                     StrToDate(wDataCapitalizacao),DMOracle.DataServ,QContasReceber_CabConsDt_Capitalizacao_Moeda.Value,wTipoJuro,QContasReceber_CabConsNUM_DIAS_CARENCIA.Text,'CR');
        wValor_Capitalizacao:=(Round(wValor_Capitalizacao*100)/100);
      End;
     if wValor_Capitalizacao > 0.001 then
        QContasReceber_CabConsVal_Atualizado.Value:=QContasReceber_CabConsVal_Titulo.Value+wValor_Capitalizacao+
                         QContasReceber_CabConsVal_Juros.Value
     else
        QContasReceber_CabConsVal_Atualizado.Value:=QContasReceber_CabConsVal_Titulo.Value+QContasReceber_CabConsVal_Juros.Value;
//   End;
End;

procedure TDMContasReceber.Monta_Sql_Bloqueto;
Begin
  QRBloqueto.Close;
  QRBloqueto.Sql.Clear;
  QRBloqueto.Sql.Add('SELECT ');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
  QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
  QRBloqueto.Sql.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) AS NOSSO_NUMERO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
  QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB + 0.00 AS COD_NOTA_CAB,Tb_conta_receber_cab.COD_FILIAL,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO + 0.00 AS NUM_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA + 0.00 AS NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.IND_ACEITE,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_VENDEDOR + 0.00 AS COD_VENDEDOR,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB + 0.00 AS COD_CONTA_RECEBER_CAB,TB_CADASTRO.NOME AS NOME_SACADO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.CARTEIRA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_BAIRRO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA '); //--- adicionado por Fabio na Faville 16/07/2004
  QRBloqueto.Sql.Add('FROM ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL ');
  QRBloqueto.Sql.Add('WHERE ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE');
  QRBloqueto.Sql.Add('AND Tb_conta_receber_cab.COD_BANCO_AGENCIA = Tb_banco_agencia.COD_BANCO_AGENCIA ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO is NULL'); //Sergio alterado 01/08/2003}
{      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO <> ' + CHR(39) + 'SIM' + CHR(39)); //Sergio alterado 01/08/2003}
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39));

  DmContasReceber.pVencimentoBloqueto := 'S'

End;

procedure TDMContasReceber.Monta_Sql_Bloqueto_Copia;
Begin
  QRBloqueto.Close;
  QRBloqueto.Sql.Clear;
  QRBloqueto.Sql.Add('SELECT ');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
  QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
  QRBloqueto.Sql.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) AS NOSSO_NUMERO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
  QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_FILIAL,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.IND_ACEITE,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_VENDEDOR,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,TB_CADASTRO.NOME AS NOME_SACADO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.CARTEIRA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_BAIRRO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA '); //--- adicionado por Fabio na Faville 16/07/2004
  QRBloqueto.Sql.Add('FROM ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL ');
  QRBloqueto.Sql.Add('WHERE ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE');
  QRBloqueto.Sql.Add('AND Tb_conta_receber_cab.COD_BANCO_AGENCIA = Tb_banco_agencia.COD_BANCO_AGENCIA ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO is not NULL'); //Sergio alterado 01/08/2003}
{      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO <> ' + CHR(39) + 'SIM' + CHR(39)); //Sergio alterado 01/08/2003}
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39));

  DmContasReceber.pVencimentoBloqueto := 'S'

End;

procedure TDMContasReceber.Chama_Emissao_Bloqueto;
Begin
  QRBloqueto.Open;
  // Banco do Brasil
  if QRBloquetoCod_Banco.Value = 001 then
  begin
    If FRBoletaBB = nil then
       FRBoletaBB := TFRBoletaBB.Create(Application);
    FRBoletaBB.QRPrimario.Print;
  end;
  // Banco Bradesco
  If QRBloquetoCod_Banco.Value = 237 then
  Begin
    If(FRBloqueto_Bradesco = nil)Then
      FRBloqueto_Bradesco := TFRBloqueto_Bradesco.Create(Application);
    FRBloqueto_Bradesco.QRPrimario.Print;
  End;
  // Banco HSBC
  if QRBloquetoCod_Banco.Value = 399 then
  begin
    If FRBloqueto_HSBC = nil then
       FRBloqueto_HSBC := TFRBloqueto_HSBC.Create(Application);
    FRBloqueto_HSBC.QRPrimario.Print;
  end;
  // Banco Rural
  if QRBloquetoCod_Banco.Value = 453 then
  begin
    if FRBloqueto_Rural = nil then
      FRBloqueto_Rural := TFRBloqueto_Rural.Create(Application);
    FRBloqueto_Rural.QRPrimario.Print;
  //   Bloqueto.EmiteBloqueto(3,'T');
  end;
  // Caixa Economica   COMENTADO MARCOS 02/05/07
  //if QRBloquetoCod_Banco.Value = 104 then
  //   Bloqueto.EmiteBloqueto(5,'T');
  // Meridional
  if QRBloquetoCod_Banco.Value = 008 then
     Bloqueto.EmiteBloqueto(6,'T');
  // Banco Banestado
  if QRBloquetoCod_Banco.Value = 038 then
     Bloqueto.EmiteBloqueto(7,'T');
  // Banco Itau   **************** verificar
  if QRBloquetoCod_Banco.Value = 341 then
  begin
    If FRBloqueto_Itau = Nil then
       FRBloqueto_Itau := TFRBloqueto_Itau.Create(Application);
    FRBloqueto_Itau.QRPrimario.Print;
  end;
  // Banco Sicredi
  if QRBloquetoCod_Banco.Value = 748 then
  begin
    If FRBloqueto_Sicredi = nil then
       FRBloqueto_Sicredi := TFRBloqueto_Sicredi.Create(Application);
    FRBloqueto_Sicredi.QRPrimario.Print;
  end;
    // Banco Santander
  If QRBloquetoCod_Banco.Value = 353 then
  Begin
    If(FRBloqueto_Santander = nil)Then
      FRBloqueto_Santander := TFRBloqueto_Santander.Create(Application);
    FRBloqueto_Santander.QRPrimario.Print;
  End;
      // Banco UNIBANCO
  If QRBloquetoCod_Banco.Value = 409 then
  Begin
    If(FRBloqueto_UNIBANCO = nil)Then
      FRBloqueto_UNIBANCO := TFRBloqueto_UNIBANCO.Create(Application);
    FRBloqueto_UNIBANCO.QRPrimario.Print;
  End;
        // Banco SAFRA
  If QRBloquetoCod_Banco.Value = 422 then
  Begin
    If FRBloqueto_SAFRA = nil Then
      FRBloqueto_SAFRA := TFRBloqueto_SAFRA.Create(Application);
    FRBloqueto_SAFRA.QRPrimario.Print;
  End;
  If QRBloquetoCod_Banco.Value = 347 then
  Begin
    If FRBloqueto_SUDAMERIS = nil Then
      FRBloqueto_SUDAMERIS := TFRBloqueto_SUDAMERIS.Create(Application);
    FRBloqueto_SUDAMERIS.QRPrimario.Print;
  End;
  If QRBloquetoCod_Banco.Value = 104 then
  Begin
    If FRBloqueto_CEF = nil Then
      FRBloqueto_CEF := TFRBloqueto_CEF.Create(Application);
    FRBloqueto_CEF.QRPrimario.Print;
  End;

  QRBloqueto.Close;
End;

procedure TDMContasReceber.QContasReceber_CabCOD_OBRA_CONTRATO_MOVChange(
  Sender: TField);
begin
  QContasReceber_CabCOD_OBRA_CONTRATO.Text := DMOracle.BuscaNome('SELECT COD_OBRA_CONTRATO FROM TB_OBRA_CONTRATO_MOV','COD_OBRA_CONTRATO_MOV = '+QContasReceber_CabCOD_OBRA_CONTRATO_MOV.text,True);
end;

procedure TDMContasReceber.Monta_Sql_Bloqueto_Safra;
Begin
  QRBloqueto.Close;
  QRBloqueto.Sql.Clear;
  QRBloqueto.Sql.Add('SELECT ');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
  QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
  QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
  QRBloqueto.Sql.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) AS NOSSO_NUMERO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
  QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_FILIAL,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.IND_ACEITE,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_VENDEDOR,');
  QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,TB_CADASTRO.NOME AS NOME_SACADO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.CARTEIRA,');
  QRBloqueto.Sql.Add('TB_CADASTRO.DESC_BAIRRO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
  QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA '); //--- adicionado por Fabio na Faville 16/07/2004
  QRBloqueto.Sql.Add('FROM ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL,TB_CEP_SAFRA ');
  QRBloqueto.Sql.Add('WHERE ');
  QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE');
  QRBloqueto.Sql.Add('AND Tb_conta_receber_cab.COD_BANCO_AGENCIA = Tb_banco_agencia.COD_BANCO_AGENCIA ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO is NULL');
  QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39));
  QRBLoqueto.Sql.Add('AND REPLACE(TB_CADASTRO.DESC_CEP_COBRANCA,'+ CHR(39) + '-' + CHR(39) + ','''') BETWEEN TB_CEP_SAFRA.NUM_CEP_INICIAL AND TB_CEP_SAFRA.NUM_CEP_FINAL');

End;
procedure TDMContasReceber.QRComissaoPublicarCalcFields(DataSet: TDataSet);
Var wTotalNota, wPedido : String;
    wIndice, wComissao, wTotComissao : Real;
begin
  QRComissaoPublicarNr_Pedido.Value := QRComissaoPublicarNum_Pedido.Value;
  QRComissaoPublicarPerc_Comissao.Value := QRComissaoPublicarPC_Comissao.Value;
  If QRComissaoPublicarPerc_Comissao.Value <> 0 Then
        QRComissaoPublicarVal_Comissao.Value := QRComissaoPublicarsVal_Total.Value * QRComissaoPublicarPc_Comissao.Value / 100
     else
        QRComissaoPublicarVal_Comissao.Value := 0;
end;


End.
