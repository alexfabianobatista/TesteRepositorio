unit UContasPagar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle, DBClient, Provider;
          
type
  TDMContasPagar = class(TDataModule)
    DSContasPagar_CabCons: TDataSource;
    DSContasPagar_Mov: TDataSource;
    DSContasPagar_Cab: TDataSource;
    DSContasPagarBaixa: TDataSource;
    DSContasPgarBaixaMov: TDataSource;
    DSRContasPagar_Mov: TDataSource;
    DSRContasPagar_Cab: TDataSource;
    DSLiberarBaixa: TDataSource;
    QLiberarBaixa: TOracleDataSet1;
    QLiberarBaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLiberarBaixaCOD_FINALIDADE: TIntegerField;
    QLiberarBaixaCOD_BANCO_AGENCIA: TIntegerField;
    QLiberarBaixaCOD_CADASTRO: TIntegerField;
    QLiberarBaixaCOD_FILIAL: TIntegerField;
    QLiberarBaixaNUM_PARCELA: TIntegerField;
    QLiberarBaixaDESC_TIPO_DOCUMENTO: TStringField;
    QLiberarBaixaDT_MOVIMENTO: TDateTimeField;
    QLiberarBaixaDT_BAIXA: TDateTimeField;
    QLiberarBaixaDT_VENCIMENTO: TDateTimeField;
    QLiberarBaixaDT_EMISSAO: TDateTimeField;
    QLiberarBaixaDT_CAPITALIZACAO: TDateTimeField;
    QLiberarBaixaVAL_TITULO: TFloatField;
    QLiberarBaixaCOD_NOTA_CAB: TIntegerField;
    QLiberarBaixaIND_ACEITE: TStringField;
    QLiberarBaixaIND_SITUACAO: TStringField;
    QLiberarBaixaVAL_ORIGINAL: TFloatField;
    QLiberarBaixadesc_fornecedor: TStringField;
    QRCPagar_Mov: TOracleDataSet1;
    QRCPagar_MovCOD_CADASTRO: TIntegerField;
    QRCPagar_MovCOD_FILIAL: TIntegerField;
    QRCPagar_MovNUM_TITULO: TIntegerField;
    QRCPagar_MovNUM_PARCELA: TIntegerField;
    QRCPagar_MovDT_VENCIMENTO: TDateTimeField;
    QRCPagar_MovDT_MOVIMENTO: TDateTimeField;
    QRCPagar_MovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRCPagar_MovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QRCPagar_MovVAL_MOVIMENTO: TFloatField;
    QRCPagar_MovIND_TIPO_MOVIMENTO: TStringField;
    QRCPagar_MovDT_USUARIO: TDateTimeField;
    QRCPagar_MovCOD_USUARIO: TIntegerField;
    QRCPagar_MovNOME: TStringField;
    QRCPagar_MovDESC_FILIAL: TStringField;
    QVoltaMovCaixa: TOracleDataSet1;
    QVoltaMovBanco: TOracleDataSet1;
    QRContasPagar_TitulosAberto: TOracleDataSet1;
    QRCPagar_MovTot: TOracleDataSet1;
    QRCPagar_MovTotTOTAL: TFloatField;
    QRCPagar_MovTotIND_TIPO_MOVIMENTO: TStringField;
    QExcluiMovCaixa: TOracleDataSet1;
    QRContasPagar_TitulosBaixados: TOracleDataSet1;
    QRContasPagar_TitulosBaixadosNOME: TStringField;
    QRContasPagar_TitulosBaixadosCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_TitulosBaixadosCOD_FILIAL: TIntegerField;
    QRContasPagar_TitulosBaixadosCOD_FINALIDADE: TIntegerField;
    QRContasPagar_TitulosBaixadosCOD_BANCO_AGENCIA: TIntegerField;
    QRContasPagar_TitulosBaixadosCOD_CADASTRO: TIntegerField;
    QRContasPagar_TitulosBaixadosNUM_PARCELA: TIntegerField;
    QRContasPagar_TitulosBaixadosDESC_TIPO_DOCUMENTO: TStringField;
    QRContasPagar_TitulosBaixadosDT_MOVIMENTO: TDateTimeField;
    QRContasPagar_TitulosBaixadosDT_BAIXA: TDateTimeField;
    QRContasPagar_TitulosBaixadosDT_VENCIMENTO: TDateTimeField;
    QRContasPagar_TitulosBaixadosDT_EMISSAO: TDateTimeField;
    QRContasPagar_TitulosBaixadosDT_CAPITALIZACAO: TDateTimeField;
    QRContasPagar_TitulosBaixadosVAL_TITULO: TFloatField;
    QRContasPagar_TitulosBaixadosCOD_NOTA_CAB: TIntegerField;
    QRContasPagar_TitulosBaixadosIND_ACEITE: TStringField;
    QRContasPagar_TitulosBaixadosIND_SITUACAO: TStringField;
    QRContasPagar_TitulosBaixadosVAL_ORIGINAL: TFloatField;
    QRContasPagar_TitulosBaixadosDESC_FILIAL: TStringField;
    QExcluiMovBanco: TOracleDataSet1;
    QExcluiMov: TOracleDataSet1;
    QRContasPagar_Vencimentos: TOracleDataSet1;
    QRContasPagar_VencimentosDESC_SIGLA: TStringField;
    QRContasPagar_VencimentosDT_VENCIMENTO: TDateTimeField;
    QRContasPagar_VencimentosDT_EMISSAO: TDateTimeField;
    QRContasPagar_VencimentosVAL_ORIGINAL: TFloatField;
    QRContasPagar_VencimentosNOME: TStringField;
    QRContasPagar_Vencimentosval_titulo: TFloatField;
    QContasPagar_Cab: TOracleDataSet1;
    QContasPagar_CabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabCOD_FINALIDADE: TIntegerField;
    QContasPagar_CabCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagar_CabCOD_CADASTRO: TIntegerField;
    QContasPagar_CabCOD_FILIAL: TIntegerField;
    QContasPagar_CabNUM_PARCELA: TIntegerField;
    QContasPagar_CabDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagar_CabDT_MOVIMENTO: TDateTimeField;
    QContasPagar_CabDT_BAIXA: TDateTimeField;
    QContasPagar_CabDT_VENCIMENTO: TDateTimeField;
    QContasPagar_CabDT_EMISSAO: TDateTimeField;
    QContasPagar_CabDT_CAPITALIZACAO: TDateTimeField;
    QContasPagar_CabVAL_TITULO: TFloatField;
    QContasPagar_CabCOD_NOTA_CAB: TIntegerField;
    QContasPagar_CabIND_ACEITE: TStringField;
    QContasPagar_CabIND_SITUACAO: TStringField;
    QContasPagar_CabVAL_ORIGINAL: TFloatField;
    QContasPagar_CabVAL_INDEXADO: TFloatField;
    QContasPagar_CabCOD_DEPARTAMENTO: TIntegerField;
    QContasPagar_CabCOD_CONTRATO: TIntegerField;
    QContasPagar_CabCOD_CONTRATO_GP: TIntegerField;
    QContasPagar_CabCOD_CONTRATO_VEND: TIntegerField;
    QContasPagar_Mov: TOracleDataSet1;
    QContasPagar_MovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagar_MovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_MovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagar_MovDT_MOVIMENTO: TDateTimeField;
    QContasPagar_MovVAL_MOVIMENTO: TFloatField;
    QContasPagar_MovDESC_OBSERVACAO: TStringField;
    QContasPagar_MovCOD_USUARIO: TIntegerField;
    QContasPagar_MovDT_USUARIO: TDateTimeField;
    QContasPagar_CabCons: TOracleDataSet1;
    QContasPagarBaixa: TOracleDataSet1;
    QContasPagarBaixaNOME: TStringField;
    QContasPagarBaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarBaixaCOD_FINALIDADE: TIntegerField;
    QContasPagarBaixaCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagarBaixaCOD_CADASTRO: TIntegerField;
    QContasPagarBaixaCOD_DEPARTAMENTO: TIntegerField;
    QContasPagarBaixaCOD_FILIAL: TIntegerField;
    QContasPagarBaixaNUM_PARCELA: TIntegerField;
    QContasPagarBaixaDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagarBaixaDT_MOVIMENTO: TDateTimeField;
    QContasPagarBaixaDT_BAIXA: TDateTimeField;
    QContasPagarBaixaDT_VENCIMENTO: TDateTimeField;
    QContasPagarBaixaDT_EMISSAO: TDateTimeField;
    QContasPagarBaixaDT_CAPITALIZACAO: TDateTimeField;
    QContasPagarBaixaVAL_TITULO: TFloatField;
    QContasPagarBaixaCOD_NOTA_CAB: TIntegerField;
    QContasPagarBaixaIND_ACEITE: TStringField;
    QContasPagarBaixaIND_SITUACAO: TStringField;
    QContasPagarBaixaVAL_ORIGINAL: TFloatField;
    QContasPagarBaixaVAL_INDEXADO: TFloatField;
    QContasPagarBaixaMov: TOracleDataSet1;
    QRContasPagar_Cab: TOracleDataSet1;
    QRContasPagar_Mov: TOracleDataSet1;
    QRContasPagar_Produtos: TOracleDataSet1;
    QRContasPagar_CabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_CabCOD_FINALIDADE: TIntegerField;
    QRContasPagar_CabCOD_BANCO_AGENCIA: TIntegerField;
    QRContasPagar_CabCOD_FILIAL: TIntegerField;
    QRContasPagar_CabNUM_PARCELA: TIntegerField;
    QRContasPagar_CabDESC_TIPO_DOCUMENTO: TStringField;
    QRContasPagar_CabDT_MOVIMENTO: TDateTimeField;
    QRContasPagar_CabDT_BAIXA: TDateTimeField;
    QRContasPagar_CabDT_VENCIMENTO: TDateTimeField;
    QRContasPagar_CabDT_EMISSAO: TDateTimeField;
    QRContasPagar_CabDT_CAPITALIZACAO: TDateTimeField;
    QRContasPagar_CabVAL_TITULO: TFloatField;
    QRContasPagar_CabCOD_NOTA_CAB: TIntegerField;
    QRContasPagar_CabIND_ACEITE: TStringField;
    QRContasPagar_CabIND_SITUACAO: TStringField;
    QRContasPagar_CabVAL_ORIGINAL: TFloatField;
    QRContasPagar_CabCOD_CADASTRO: TIntegerField;
    QRContasPagar_CabNOME: TStringField;
    QRContasPagar_MovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QRContasPagar_MovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_MovDT_MOVIMENTO: TDateTimeField;
    QRContasPagar_MovVAL_MOVIMENTO: TFloatField;
    QRContasPagar_MovDESC_OBSERVACAO: TStringField;
    QRContasPagar_MovIND_TIPO_MOVIMENTO: TStringField;
    QRContasPagar_MovDT_USUARIO: TDateTimeField;
    QRContasPagar_MovCOD_USUARIO: TIntegerField;
    QRContasPagar_ProdutosCOD_NOTA_CAB: TIntegerField;
    QRContasPagar_ProdutosQT_QUANTIDADE: TFloatField;
    QRContasPagar_ProdutosVAL_TOTAL: TFloatField;
    QRContasPagar_ProdutosCOD_PRODUTO: TFloatField;
    QContasPagarBaixaMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarBaixaMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarBaixaMovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarBaixaMovDT_MOVIMENTO: TDateTimeField;
    QContasPagarBaixaMovVAL_MOVIMENTO: TFloatField;
    QContasPagarBaixaMovDESC_OBSERVACAO: TStringField;
    QContasPagarBaixaMovCOD_USUARIO: TIntegerField;
    QContasPagarBaixaMovDT_USUARIO: TDateTimeField;
    QContasPagarBaixaMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarBaixaMovCOD_CAIXA_MOV: TIntegerField;
    QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasPagar_CabCOD_CONHECIMENTO_FRETE: TIntegerField;
    QRPgto_Dpto_Finalidade: TOracleDataSet1;
    QRPgto_Dpto_FinalidadeDT_EMISSAO: TDateTimeField;
    QRPgto_Dpto_FinalidadeCOD_DEPARTAMENTO: TIntegerField;
    QRPgto_Dpto_FinalidadeCOD_FINALIDADE: TIntegerField;
    QRPgto_Dpto_FinalidadeNUM_TITULO: TIntegerField;
    QRPgto_Dpto_FinalidadeCOD_CADASTRO: TIntegerField;
    QRPgto_Dpto_FinalidadeVAL_MOVIMENTO: TFloatField;
    QRPgto_Dpto_FinalidadeIND_SITUACAO: TStringField;
    QContasPagar_CabDESC_OBSERVACAO: TStringField;
    QRContasPagar_CabDESC_OBSERVACAO: TStringField;
    QRCPagar_MovDESC_OBSERVACAO: TStringField;
    QLiberarBaixaDESC_OBSERVACAO: TStringField;
    QRContasPagar_TitulosBaixadosDESC_OBSERVACAO: TStringField;
    QContasPagarBaixaDESC_OBSERVACAO: TStringField;
    QRPgto_Dpto_FinalidadeCOD_FILIAL: TIntegerField;
    QContasPagar_MovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasPagar_MovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagar_CabDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QRContasPagar_CabDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QRContaPagarTotalDia: TOracleDataSet1;
    QRContaPagarTotalDiaDT_VENCIMENTO: TDateTimeField;
    QRContaPagarTotalDiaT_PAGAR: TFloatField;
    QVoltaConciliacao: TOracleDataSet1;
    QContasPagar_MovIND_FORMA_PAGAMENTO: TStringField;
    QContasPagarBaixaMovIND_FORMA_PAGAMENTO: TStringField;
    QContasPagar_CabCOD_RPA: TIntegerField;
    QEmiteCheque: TOracleDataSet1;
    QContasPagar_CabCOD_OBRA_REQ_CAB: TIntegerField;
    QContasPagar_MovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagar_Movdesc_banco: TStringField;
    QContasPagar_CabCOD_ESTADIA: TIntegerField;
    QRTitulosNotaE: TOracleDataSet1;
    QRTitulosNotaECOD_NOTA_CAB: TIntegerField;
    QRTitulosNotaECOD_FORNECEDOR: TIntegerField;
    QRTitulosNotaEDESC_FORNECEDOR: TStringField;
    QRTitulosNotaENUM_NOTA: TIntegerField;
    QRTitulosNotaECOD_SERIE: TStringField;
    QRTitulosNotaEDT_EMISSAO: TDateTimeField;
    QRTitulosNotaEDT_MOVIMENTO: TDateTimeField;
    QRTitulosNotaECOD_FILIAL: TIntegerField;
    QRTitulosNotaEDESC_FILIAL: TStringField;
    QRTitulosNotaECOD_VENDEDOR: TIntegerField;
    QRTitulosNotaEDESC_VENDEDOR: TStringField;
    QRTitulosNotaECOD_CONTA_PAGAR_CAB: TIntegerField;
    QRTitulosNotaENUM_TITULO: TIntegerField;
    QRTitulosNotaENUM_PARCELA: TIntegerField;
    QRTitulosNotaEDT_EMISSAO_CONTA_PAGAR: TDateTimeField;
    QRTitulosNotaEDT_VENCIMENTO: TDateTimeField;
    QRTitulosNotaEVAL_TITULO: TFloatField;
    QRTitulosNotaEIND_SITUACAO: TStringField;
    QContasPagar_CabDT_ACEITE: TDateTimeField;
    QLiberarBaixaDT_ACEITE: TDateTimeField;
    QContasPagarBaixaDT_ACEITE: TDateTimeField;
    QRContasPagar_ProdutosDESC_PRODUTO: TStringField;
    QContasPagar_MovIND_DEVOLUCAO: TStringField;
    QContasPagarBaixaMovIND_DEVOLUCAO: TStringField;
    QRContasPagar_VencimentosDT_MOVIMENTO: TDateTimeField;
    QRContasPagar_Cabnum_ordem_compra: TIntegerField;
    QContasPagar_CabCOD_CONTRATO_PJURIDICA: TIntegerField;
    QContasPagarBaixaMovCOD_ADIANTAMENTO: TIntegerField;
    QContasPagarBaixaCOD_HISTORICO_DESC: TIntegerField;
    QRContasPagar_VencimentosIND_SITUACAO: TStringField;
    QRContasPagar_TitulosBaixadosVALORPAGO: TFloatField;
    QContasPagar_CabPERC_DESC_ANTECIPACAO: TFloatField;
    QContasPagar_CabPERC_DESC_PONTUALIDADE: TFloatField;
    QContasPagarBaixaPERC_DESC_PONTUALIDADE: TFloatField;
    QContasPagarBaixaPERC_DESC_ANTECIPACAO: TFloatField;
    QContasPagarBaixaNUM_TIPO_JURO: TStringField;
    QContasPagarBaixaPERC_TAXA: TFloatField;
    QContasPagarBaixaCOD_MOEDA: TIntegerField;
    QContasPagarBaixaPERC_JURO_MORA: TFloatField;
    QContasPagarBaixaNUM_DIAS_CARENCIA: TFloatField;
    QChecaContasPagar: TOracleDataSet1;
    QChecaContasPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QChecaContasPagarDT_EMISSAO: TDateTimeField;
    QChecaContasPagarDT_VENCIMENTO: TDateTimeField;
    QContasPagar_CabCOD_CONTRATO_ARROZ: TIntegerField;
    QContasPagar_CabCOD_CONTA_CORRENTE: TIntegerField;
    OPBanco: TOraclePackage;
    QLiberarBaixaCOD_USUARIO_ACEITE: TIntegerField;
    QContasPagar_CabCOD_USUARIO_ACEITE: TIntegerField;
    QContasPagar_CabCOD_BANCO_PGTO: TIntegerField;
    QContasPagar_CabCOD_AGENCIA: TStringField;
    QContasPagar_CabCOD_CONTA_CORRENTE_PGTO: TStringField;
    QContasPagar_CabDESC_CNPJ_CPF_PGTO: TStringField;
    QContasPagar_CabDESC_NOME_TITULAR_CONTA: TStringField;
    QContasPagar_CabIND_FORMA_PAGAMENTO: TStringField;
    QContasPagar_CabDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QRContasPagar_VencimentosNUM_TITULO: TFloatField;
    QRContasPagar_VencimentosCOD_FILIAL: TFloatField;
    QRContasPagar_VencimentosNUM_PARCELA: TFloatField;
    QRContasPagar_VencimentosCOD_CONTA_PAGAR_CAB: TFloatField;
    QRContasPagar_VencimentosCOD_CADASTRO: TFloatField;
    QRPgto_Dpto_FinalidadeNOME_CADASTRO: TStringField;
    QRPgto_Dpto_FinalidadeDESC_FINALIDADE: TStringField;
    QRPgto_Dpto_FinalidadeDESC_DEPARTAMENTO: TStringField;
    QRPgto_Dpto_FinalidadeDESC_FILIAL: TStringField;
    QRPgto_Dpto_FinalidadeIND_TIPO_MOVIMENTO: TStringField;
    QRPgto_Dpto_Finalidadeval_pagto_principal: TFloatField;
    QRPgto_Dpto_Finalidadeval_pagto_juros: TFloatField;
    QRPgto_Dpto_Finalidadeval_desconto: TFloatField;
    QContasPagar_CabCOD_CONTRATO_CPR: TIntegerField;
    QContasPagarBaixaCOD_CONTRATO_GP: TIntegerField;
    QRTitulosAbertos_OutrasMoedas: TOracleDataSet1;
    QRTitulosAbertos_OutrasMoedasNUM_TITULO: TIntegerField;
    QRTitulosAbertos_OutrasMoedasNOME: TStringField;
    QRTitulosAbertos_OutrasMoedasNUM_PARCELA: TIntegerField;
    QRTitulosAbertos_OutrasMoedasDT_EMISSAO: TDateTimeField;
    QRTitulosAbertos_OutrasMoedasDT_VENCIMENTO: TDateTimeField;
    QRTitulosAbertos_OutrasMoedasVAL_TITULO: TFloatField;
    QRTitulosAbertos_OutrasMoedasVAL_MOEDA_EMISSAO: TFloatField;
    QRTitulosAbertos_OutrasMoedasVAL_MOEDA_BASE: TFloatField;
    QRContasPagar_TitulosAbertoNOME: TStringField;
    QRContasPagar_TitulosAbertoPERC_JURO_MORA: TFloatField;
    QRContasPagar_TitulosAbertoDT_CALCULO_JUROS: TDateTimeField;
    QRContasPagar_TitulosAbertoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_TitulosAbertoCOD_FILIAL: TIntegerField;
    QRContasPagar_TitulosAbertoCOD_FINALIDADE: TIntegerField;
    QRContasPagar_TitulosAbertoCOD_BANCO_AGENCIA: TIntegerField;
    QRContasPagar_TitulosAbertoCOD_CADASTRO: TIntegerField;
    QRContasPagar_TitulosAbertoCOD_DEPARTAMENTO: TIntegerField;
    QRContasPagar_TitulosAbertoNUM_PARCELA: TIntegerField;
    QRContasPagar_TitulosAbertoDESC_TIPO_DOCUMENTO: TStringField;
    QRContasPagar_TitulosAbertoDT_MOVIMENTO: TDateTimeField;
    QRContasPagar_TitulosAbertoDT_BAIXA: TDateTimeField;
    QRContasPagar_TitulosAbertoDT_VENCIMENTO: TDateTimeField;
    QRContasPagar_TitulosAbertoDT_EMISSAO: TDateTimeField;
    QRContasPagar_TitulosAbertoDT_CAPITALIZACAO: TDateTimeField;
    QRContasPagar_TitulosAbertoDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QRContasPagar_TitulosAbertoCOD_NOTA_CAB: TIntegerField;
    QRContasPagar_TitulosAbertoDESC_OBSERVACAO: TStringField;
    QRContasPagar_TitulosAbertoIND_ACEITE: TStringField;
    QRContasPagar_TitulosAbertoIND_SITUACAO: TStringField;
    QRContasPagar_TitulosAbertoVAL_ORIGINAL: TFloatField;
    QRContasPagar_TitulosAbertoVAL_TITULO: TFloatField;
    QRContasPagar_TitulosAbertoVAL_TIT: TFloatField;
    QRContasPagar_TitulosAbertoDESC_DEPARTAMENTO: TStringField;
    QRContasPagar_TitulosAbertoDESC_FILIAL: TStringField;
    QRContasPagar_TitulosAbertoVALORPAGO: TFloatField;
    QRContasPagar_TitulosAbertoNUM_TIPO_JURO: TStringField;
    QRContasPagar_TitulosAbertoPERC_TAXA: TFloatField;
    QRContasPagar_TitulosAbertoCOD_MOEDA: TIntegerField;
    QRContasPagar_TitulosAbertoNUM_DIAS_CARENCIA: TFloatField;
    QRContasPagar_TitulosAbertoval_juros: TFloatField;
    QContasPagar_CabConsNOME: TStringField;
    QContasPagar_CabConsDESC_FANTASIA: TStringField;
    QContasPagar_CabConsNUM_CGC_CPF: TStringField;
    QContasPagar_CabConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabConsCOD_FINALIDADE: TIntegerField;
    QContasPagar_CabConsCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagar_CabConsCOD_CADASTRO: TIntegerField;
    QContasPagar_CabConsCOD_FILIAL: TIntegerField;
    QContasPagar_CabConsNUM_PARCELA: TIntegerField;
    QContasPagar_CabConsDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagar_CabConsDT_VENCIMENTO: TDateTimeField;
    QContasPagar_CabConsDT_EMISSAO: TDateTimeField;
    QContasPagar_CabConsVAL_TITULO: TFloatField;
    QContasPagar_CabConsVAL_ORIGINAL: TFloatField;
    QContasPagar_CabConsDT_BAIXA: TDateTimeField;
    QContasPagar_CabConsIND_SITUACAO: TStringField;
    QContasPagar_CabConsIND_ACEITE: TStringField;
    QContasPagar_CabConsDESC_FINALIDADE: TStringField;
    QContasPagar_CabConsDESC_BANCO_AGENCIA: TStringField;
    QContasPagar_CabConsDESC_FILIAL: TStringField;
    QContasPagarBaixaDESC_FINALIDADE: TStringField;
    QRCPagar_MovCOD_FINALIDADE: TIntegerField;
    QRCPagar_MovDESC_FINALIDADE: TStringField;
    QContasPagarPrazoMedio: TOracleDataSet1;
    QContasPagarPrazoMedioPRAZO_MEDIO: TFloatField;
    QContaPagarExclusao: TOracleDataSet1;
    DspContaPagarExclusao: TDataSetProvider;
    CdContaPagarExclusao: TClientDataSet;
    QContaPagarExclusaoCOD_FILIAL: TIntegerField;
    QContaPagarExclusaoCOD_CADASTRO_FORNECEDOR: TIntegerField;
    QContaPagarExclusaoNOME_FORNECEDOR: TStringField;
    QContaPagarExclusaoNUM_PARCELA: TIntegerField;
    QContaPagarExclusaoDT_VENCIMENTO: TDateTimeField;
    QContaPagarExclusaoDT_EMISSAO: TDateTimeField;
    QContaPagarExclusaoVAL_TITULO: TFloatField;
    QContaPagarExclusaoIND_EXCLUIR: TStringField;
    CdContaPagarExclusaoCOD_FILIAL: TIntegerField;
    CdContaPagarExclusaoCOD_CADASTRO_FORNECEDOR: TIntegerField;
    CdContaPagarExclusaoNOME_FORNECEDOR: TStringField;
    CdContaPagarExclusaoNUM_PARCELA: TIntegerField;
    CdContaPagarExclusaoDT_VENCIMENTO: TDateTimeField;
    CdContaPagarExclusaoDT_EMISSAO: TDateTimeField;
    CdContaPagarExclusaoVAL_TITULO: TFloatField;
    CdContaPagarExclusaoIND_EXCLUIR: TStringField;
    QContaPagarExclusaoCOD_CONTA_PAGAR_CAB: TIntegerField;
    CdContaPagarExclusaoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabConsDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QContasPagarBaixaDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QContaPagarExclusaoNUM_TITULO: TFloatField;
    CdContaPagarExclusaoNUM_TITULO: TFloatField;
    QContasPagarBaixaNUM_TITULO: TFloatField;
    QContasPagarBaixaDESC_OBRA: TStringField;
    QContasPagar_CabConsDESC_OBRA: TStringField;
    QContasPagar_CabCOD_OBRA: TIntegerField;
    QRContasPagar_VencimentosIND_ACEITE: TStringField;
    QContasPagar_CabCOD_CONTRATO_LOCATARIO: TIntegerField;
    QContasPagar_CabNUM_TITULO: TFloatField;
    QRContasPagar_CabNUM_TITULO: TFloatField;
    QRContasPagar_Finalidade: TOracleDataSet1;
    QRContasPagar_FinalidadeCOD_FINALIDADE: TIntegerField;
    QRContasPagar_FinalidadeDESC_FINALIDADE: TStringField;
    QRContasPagar_Finalidadevalorpago: TFloatField;
    QRContasPagar_FinalidadeIND_SITUACAO: TStringField;
    QRContasPagar_FinalidadeAnalitico: TOracleDataSet1;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    QRContasPagar_FinalidadeAnaliticoCOD_CADASTRO: TIntegerField;
    QRContasPagar_FinalidadeAnaliticoNOME: TStringField;
    QRContasPagar_FinalidadeAnaliticoDT_VENCIMENTO: TDateTimeField;
    QRContasPagar_FinalidadeAnaliticoDT_EMISSAO: TDateTimeField;
    QRContasPagar_FinalidadeAnaliticoVAL_TITULO: TFloatField;
    QRContasPagar_FinalidadeCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRContasPagar_FinalidadeVAL_TITULO: TFloatField;
    QRContasPagar_FinalidadeAnaliticoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabConsNUM_TITULO: TFloatField;
    QRContasPagar_TitulosBaixadosNUM_TITULO: TFloatField;
    QRContasPagar_CabCADASTRO_CLIENTE: TIntegerField;
    QRContasPagar_CabNOME_CLIENTE: TStringField;
    QContasPagar_CabConsCOD_NOTA_CAB: TIntegerField;
    QContasPagar_CabCOD_USUARIO: TIntegerField;
    QContasPagar_CabDT_USUARIO: TDateTimeField;
    QContasPagar_CabDESC_OBS: TStringField;
    QRContasPagar_TitulosAbertoNUM_TITULO: TFloatField;
    QContasPagar_MovCOD_ADIANTAMENTO: TIntegerField;
    QContasPagarBaixaDESC_FILIAL: TStringField;
    QContasPagarBaixaDESC_ENDERECO: TStringField;
    QContasPagarBaixaDESC_CIDADE: TStringField;
    QRContasPagar_VencimentosNUM_CGC_CPF_TITULAR_CONTA: TStringField;
    QRContasPagar_VencimentosNOME_TITULAR: TStringField;
    QRContasPagar_VencimentosCOD_BANCO_AGENCIA: TIntegerField;
    QRContasPagar_VencimentosDESC_AGENCIA: TStringField;
    QRContasPagar_VencimentosDESC_CONTA_CORRENTE: TStringField;
    QEmiteChequeCOD_CONTA_CORRENTE: TIntegerField;
    QEmiteChequeNUM_CHEQUE: TIntegerField;
    QEmiteChequeDT_MOVIMENTO: TDateTimeField;
    QEmiteChequeDESC_OBSERVACAO: TStringField;
    QEmiteChequeDESC_COMPLEMENTO1: TStringField;
    QEmiteChequeDESC_COMPLEMENTO2: TStringField;
    QEmiteChequeCOD_CADASTRO: TIntegerField;
    QEmiteChequeVAL_DESCONTO_TAXA: TFloatField;
    QEmiteChequeCOD_FILIAL: TIntegerField;
    QEmiteChequeVAL_MOVIMENTO: TFloatField;
    QLiberarBaixaNUM_TITULO: TFloatField;
    CdsContasPagarReparcelamento: TClientDataSet;
    CdsContasPagarReparcelamentoNOME: TStringField;
    CdsContasPagarReparcelamentoCHECADO: TStringField;
    CdsContasPagarReparcelamentoCOD_DEPARTAMENTO: TIntegerField;
    CdsContasPagarReparcelamentoVAL_TITULO: TFloatField;
    CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB: TIntegerField;
    CdsContasPagarReparcelamentoCOD_FINALIDADE: TIntegerField;
    CdsContasPagarReparcelamentoCOD_FILIAL: TIntegerField;
    CdsContasPagarReparcelamentoNUM_TITULO: TFloatField;
    CdsContasPagarReparcelamentoNUM_PARCELA: TIntegerField;
    CdsContasPagarReparcelamentoDT_VENCIMENTO: TDateTimeField;
    CdsContasPagarReparcelamentoDT_EMISSAO: TDateTimeField;
    QReparcelamentoCP: TOracleDataSet1;
    DSReparcelamentoCP: TDataSource;
    QReparcelamentoCPCons: TOracleDataSet1;
    QReparcelamentoCPConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QReparcelamentoCPConsNUM_TITULO: TFloatField;
    QReparcelamentoCPConsCOD_NOTA_CAB: TIntegerField;
    QReparcelamentoCPConsDT_EMISSAO: TDateTimeField;
    CdsContasPagarReparcelamentoDESC_TIPO_DOCUMENTO: TStringField;
    CdsContasPagarReparcelamentoCOD_NOTA_CAB: TIntegerField;
    QReparcelamentoCPCOD_REPARCELAMENTO_CP: TIntegerField;
    QReparcelamentoCPNUM_TITULO: TIntegerField;
    QReparcelamentoCPCOD_NOTA_CAB: TIntegerField;
    QReparcelamentoCPNUM_TITULO_ANT: TFloatField;
    QReparcelamentoCPDT_EMISSAO_ANT: TDateTimeField;
    QReparcelamentoCPNUM_PARCELA_ANT: TIntegerField;
    QTitulosAnteioresRep: TOracleDataSet1;
    QTitulosNovosRep: TOracleDataSet1;
    DSTitulosAnterioresRep: TDataSource;
    DsTitulosNovosRep: TDataSource;
    QTitulosAnteioresRepCOD_CONTA_PAGAR_CAB: TIntegerField;
    QTitulosAnteioresRepNUM_TITULO: TFloatField;
    QTitulosAnteioresRepNUM_PARCELA: TIntegerField;
    QTitulosAnteioresRepDT_EMISSAO: TDateTimeField;
    QTitulosAnteioresRepDT_VENCIMENTO: TDateTimeField;
    QTitulosAnteioresRepVAL_ORIGINAL: TFloatField;
    QTitulosNovosRepCOD_CONTA_PAGAR_CAB: TIntegerField;
    QTitulosNovosRepNUM_TITULO: TFloatField;
    QTitulosNovosRepNUM_PARCELA: TIntegerField;
    QTitulosNovosRepDT_EMISSAO: TDateTimeField;
    QTitulosNovosRepDT_VENCIMENTO: TDateTimeField;
    QTitulosNovosRepVAL_ORIGINAL: TFloatField;
    QRContasPagar_TitulosBaixadosdesc_conta_corrente: TStringField;
    QRContasPagar_TitulosBaixadosIND_FORMA_PAGAMENTO: TStringField;
    QRContasPagar_FinalidadeVAL_ORIGINAL: TFloatField;
    QRContasPagar_FinalidadeAnaliticoVAL_ORIGINAL: TFloatField;
    QRContasPagar_TitulosAbertoTOTAL_PARCELAS: TFloatField;
    QRContasPagar_TitulosBaixadosTOTAL_PARCELAS: TFloatField;
    QContaPagarDocumento: TOracleDataSet;
    QContaPagarDocumentoCOD_CONTA_PAGAR_DOCUMENTO: TIntegerField;
    QContaPagarDocumentoNOME_ARQUIVO: TStringField;
    QContaPagarDocumentoDT_INCLUSAO: TDateTimeField;
    QContaPagarDocumentoDESCRICAO: TStringField;
    QContaPagarDocumentoARQUIVO: TBlobField;
    QContaPagarDocumentoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabIND_DEVOLUCAO: TStringField;
    procedure QContasPagar_CabCalcFields(DataSet: TDataSet);
    procedure QContasPagar_CabAfterInsert(DataSet: TDataSet);
    procedure QContasPagar_CabBeforePost(DataSet: TDataSet);
    procedure QContasPagar_MovBeforeEdit(DataSet: TDataSet);
    procedure QContasPagar_MovBeforeInsert(DataSet: TDataSet);
    procedure QContasPagar_MovBeforeDelete(DataSet: TDataSet);
    procedure QContasPagar_MovAfterInsert(DataSet: TDataSet);
    procedure QContasPagar_MovAfterPost(DataSet: TDataSet);
    procedure QContasPagar_CabBeforeInsert(DataSet: TDataSet);
    procedure QContasPagar_CabBeforeEdit(DataSet: TDataSet);
    procedure QContasPagar_CabAfterPost(DataSet: TDataSet);
    procedure QLiberarBaixaCalcFields(DataSet: TDataSet);
    procedure QRContasPagar_TitulosAbertoCalcFields(DataSet: TDataSet);
    procedure QRContasPagar_TitulosBaixadosCalcFields(DataSet: TDataSet);
    procedure QRContasPagar_VencimentosCalcFields(DataSet: TDataSet);
    procedure QContasPagar_CabCOD_CADASTROValidate(Sender: TField);
    procedure QContasPagarBaixaMovAfterInsert(DataSet: TDataSet);
    procedure QRPgto_Dpto_FinalidadeCalcFields(DataSet: TDataSet);
    procedure QContasPagar_CabDT_VENCIMENTOValidate(Sender: TField);
    procedure QContasPagar_MovCalcFields(DataSet: TDataSet);
    procedure QRContasPagar_CabCalcFields(DataSet: TDataSet);
    procedure QContasPagar_CabCOD_CONTA_CORRENTEChange(Sender: TField);
    procedure QContasPagar_CabAfterOpen(DataSet: TDataSet);
    procedure QContasPagar_CabAfterEdit(DataSet: TDataSet);
    procedure CdsContasPagarReparcelamentoCHECADOChange(Sender: TField);
    procedure QContasPagar_MovBeforePost(DataSet: TDataSet);
  private
    fDataBase : TdateTime;
    fTotalReparcelamento : Double;
    { Private declarations }

  public
    { Public declarations }
    Property pDataBase : TDateTime Read fDataBase Write fDataBase;
    Property pTotalReparcelamento : Double Read fTotalReparcelamento Write fTotalReparcelamento;
    procedure ExcluiMovimentos(wCodigo:Integer);
    function Calcula_Variacao_cambial(wSaldo_indexado,wSaldo_Atual:Real;
                                       wdata:TDateTime;
                                       wcod_moeda:Real):Real;

    Procedure GeraContaPagar(pCadastro, pFinalidade, pNum_Nota, pCod_Filial, pCod_Nota_Cab:Integer; pVl_Titulo:Real;
                             pDepartamento, pCod_Serie, pObservacao, pContaCorrente:String; pDt_Vencimento, pDt_Recebimento : TDateTime;
                             pCod_Contrato_Locatario : String = '');

  End;

var
  DMContasPagar: TDMContasPagar;

implementation

uses UOracle_cl, UUsuario_cl, UPlanilha_cl, UParamSistema_cl,UMoeda_cl,
  USequencia_cl, UContasReceber_cl, UFinalidade_cl, Variants;

{$R *.DFM}

procedure TDMContasPagar.ExcluiMovimentos(wCodigo:Integer);
Var wCodigo_Caixa : String;
begin
// Exclui os lançamentos contábeis e os movimentos
  QContasPagar_Mov.Close;
  QContasPagar_Mov.Open;
  While not QContasPagar_Mov.Eof Do
  Begin
     DMPlanilha.Descontabiliza(QContasPagar_MovCod_Lancto_Contabil_Cred.Value,'CR_CP_MOV');
     DMPlanilha.Descontabiliza(QContasPagar_MovCod_Lancto_Contabil_Deb.Value,'CR_CP_MOV');
     QContasPagar_Mov.Delete;
//     QContasPagar_Mov.Next;  retirado pelo Cesar quando deleta nao precisa usar o next isso é automatico
  End;
//  DMPlanilha.Descontabiliza(wCodigo,'CP');
//  QExcluiMov.SetVariable('COD_CONTA_PAGAR',wCodigo);
//  QExcluiMov.ExecSQL;
  QExcluiMovBanco.SetVariable('COD_CONTA_PAGAR',wCodigo);
  QExcluiMovBanco.ExecSQL;
  wCodigo_Caixa:=DMOracle.BuscaNome('SELECT COD_CAIXA_MOV FROM TB_CAIXA_MOV','COD_CONTA_PAGAR_CAB ='+FloatToStr(wCodigo));
  If Trim(wCodigo_Caixa) <> '' Then
     DMPlanilha.Descontabiliza(StrToInt(wCodigo_Caixa),'CX');
  QExcluiMovCaixa.SetVariable('COD_CONTA_PAGAR',wCodigo);
  QExcluiMovCaixa.ExecSQL;
End;

procedure TDMContasPagar.QContasPagar_CabCalcFields(DataSet: TDataSet);
begin
{  QContasPagar_Cabdesc_finalidade.value:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasPagar_CabCod_Finalidade.Value));
  QContasPagar_Cabdesc_agencia.value:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA ='+FloatToStr(QContasPagar_CabCod_Banco_Agencia.Value));
  QContasPagar_Cabdesc_fornecedor.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO ='+FloatToStr(QContasPagar_CabCod_Cadastro.Value));
  QContasPagar_Cabdesc_filial.value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+FloatToStr(QContasPagar_CabCod_Filial.Value));
  QContasPagar_Cabdesc_departamento.value:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO ='+FloatToStr(QContasPagar_CabCod_Departamento.Value));
  QContasPagar_Cabcod_moeda_finalidade.value:=StrToFloat(DMOracle.BuscaNome('SELECT COD_MOEDA FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasPagar_CabCod_FINALIDADE.Value)));
}
end;

procedure TDMContasPagar.QContasPagar_CabAfterInsert(DataSet: TDataSet);
begin
//  QContasPagar_CabCod_Conta_Pagar_Cab.Value:=DMOracle.Sequencia('CONTA_PAGAR');
    QContasPagar_CabInd_Aceite.Value:='NAO';
    QContasPagar_CabInd_Situacao.Value:='ABERTO';
    QContasPagar_CabCod_filial.Value:=DMUsuario.CodFilialUsuario;
    QContasPagar_CabNUm_Parcela.Value:=1;
    QContasPagar_CabDesc_Tipo_Documento.Value:='DP';

    if (DMUsuario.CodDepartamentoUsuario <> 0 ) then
      QContasPagar_CabCod_Departamento.Value:= DMUsuario.CodDepartamentoUsuario
    else
      QContasPagar_CabCod_Departamento.Value:=1;
    if (DMUsuario.CodFinalidadePagarUsuario <> 0 ) then
      QContasPagar_CabCod_Finalidade.Value:= DMUsuario.CodFinalidadePagarUsuario;

    QContasPagar_CabDt_Emissao.Value:=DMOracle.DataServ;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' Then
      QContasPagar_CabIND_FORMA_PAGAMENTO.Value := 'Boleto/Guia/Fatura';

    QContasPagar_CabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QContasPagar_CabDT_USUARIO.Value := DMOracle.DataHoraServ;
end;

procedure TDMContasPagar.QContasPagar_CabBeforePost(DataSet: TDataSet);
var
  wSituacaoDpto: string;
begin
  DMOracle.ValidaFilial(QContasPagar_CabCOD_FILIAL.Text);
  If QContasPagar_Cab.State = dsInsert then
   Begin
     If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >=  QContasPagar_CabDt_Emissao.Value Then
        Raise Exception.Create('Não é Permitido Incluir Este Título - Fechamento Contabil');
     if QContasPagar_CabNum_Titulo.Value=0 then
       QContasPagar_CabNum_Titulo.Value:=DMSequencia.Sequencia(QContasPagar_CabCod_Filial.Value,'Num_Titulo_CP');
     If QContasPagar_CabDt_Movimento.Text = '' Then
        QContasPagar_CabDt_Movimento.Value := QContasPagar_CabDt_Emissao.Value; // trocado pelo césar a pedido do moinho(joao)  DMOracle.DataServ;
     If QContasPagar_CabVal_Original.isNull then   // No caso da Inclusão
       QContasPagar_CabVal_Original.value:=QContasPagar_CabVal_Titulo.Value;
//Adicionado para salvar o valor original do titulo quando o mesmo é duplicado. Alex 28/12/2022- Somente para a Espindola
     if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
       QContasPagar_CabVal_Original.value:=QContasPagar_CabVal_Titulo.Value;
     If DMOracle.BuscaNome('SELECT IND_ENCARGO FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(QContasPagar_CabCod_Finalidade.Value)) = 'VENCIMENTO' Then
        QContasPagar_CabDt_Capitalizacao.value:=QContasPagar_CabDt_Vencimento.Value //Data de Capitalizacao é a Data de Vencimento
     Else
        QContasPagar_CabDt_Capitalizacao.value:=QContasPagar_CabDt_Emissao.Value; //Data de Capitalizacao é a Data de Emissão
   End;
   if (QContasPagar_Cab.State = dsEdit)  and (DMParamSistema.CodEmpresa = 'SCALA') then
   begin
     QContasPagar_CabVAL_ORIGINAL.Value := QContasPagar_CabVAL_TITULO.Value;
   end;

   if QContasPagar_CabIND_FORMA_PAGAMENTO.Value = 'Boleto/Guia/Fatura' then
     QContasPagar_CabIND_FORMA_PAGAMENTO.Value := 'Bloqueto';
   QContasPagar_CabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
   if QContasPagar_CabCOD_DEPARTAMENTO.Text <> '' then
   begin
     wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + QContasPagar_CabCOD_DEPARTAMENTO.Text);
     if wSituacaoDpto <> 'A' then
       raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');
   end;
end;

procedure TDMContasPagar.QContasPagar_MovBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
     Raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Pagar.');
  If QContasPagar_Cab.State = dsInsert then
    Begin
      QContasPagar_Cab.post;
      QContasPagar_Cab.edit;
    End;
end;

procedure TDMContasPagar.QContasPagar_MovBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then //Se o contas a Pagar "Cabeçário" não estiver com a Transação em Aberto
     Raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Pagar.');
  If QContasPagar_Cab.State = dsInsert then
    Begin
      QContasPagar_Cab.post;
      QContasPagar_Cab.edit;
    End;
end;

procedure TDMContasPagar.QContasPagar_MovBeforeDelete(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
     Raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Pagar.');
end;

procedure TDMContasPagar.QContasPagar_MovAfterInsert(DataSet: TDataSet);
begin
  QContasPagar_MovCod_Conta_Pagar_Cab.Value:=QContasPagar_CabCod_Conta_Pagar_Cab.Value;
//  QContasPagar_MovDT_Movimento.Value:=DMOracle.DataServ;
  QContasPagar_MovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QContasPagar_MovDT_Usuario.Value:=DMOracle.DataHoraServ;
end;

procedure TDMContasPagar.QContasPagar_MovAfterPost(DataSet: TDataSet);
var
  wCodigo:Real;
begin
  wCodigo:=QContasPagar_MovCod_Conta_Pagar_Mov.Value;
  QContasPagar_Mov.DisableControls;
  QContasPagar_Mov.Close;
  QContasPagar_Mov.Open;
  QContasPagar_Mov.Locate('COD_CONTA_PAGAR_MOV',wCodigo,[]);
  QContasPagar_Mov.EnableControls;
 {QContasPagar_CabDT_Movimento.Value:=QContasPagar_MovDT_Movimento.Value;}
end;

procedure TDMContasPagar.QContasPagar_CabBeforeInsert(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
     DMOracle.DBCemapa.StartTransaction;  
end;

procedure TDMContasPagar.QContasPagar_CabBeforeEdit(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContasPagar.QContasPagar_CabAfterPost(DataSet: TDataSet);
begin
  If QContasPagar_MovCod_Conta_Pagar_Mov.Value=0 then // Verificar se existe algum Registro
  Begin
    QContasPagar_Mov.Insert; // inserção do Movimento
    QContasPagar_MovVal_Movimento.Value:=QContasPagar_CabVal_Titulo.Value;
    QContasPagar_MovInd_Tipo_Movimento.Value:='PRINCIPAL';
    QContasPagar_MovDT_Movimento.Value:=QContasPagar_CabDt_Movimento.Value;
    QContasPagar_MovVAL_MOVIMENTO.Value:=QContasPagar_CabVAL_TITULO.Value;
    QContasPagar_Mov.Post;
  End
  else if (DMParamSistema.CodEmpresa = 'SCALA') then
  begin
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    //DMOracle.QExecSQL.SQL.Add('UPDATE TB_CONTA_PAGAR_MOV SET VAL_MOVIMENTO = ' + FloatToStr(QContasPagar_CabVAL_TITULO.Value));   //Bib.TrocaVirgulaPorPonto(FloatToStr(wVlOriginal))) ;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_CONTA_PAGAR_MOV SET VAL_MOVIMENTO = ' + StringReplace(FloatToStr(QContasPagar_CabVAL_TITULO.Value), ',', '.', [rfReplaceAll]));
    DMOracle.QExecSQL.SQL.Add(' WHERE Cod_Conta_Pagar_Cab = ' + DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
    DMOracle.QExecSQL.SQL.Add(' And Ind_Tipo_Movimento = ' + QuotedStr('PRINCIPAL'));
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
  end;
end;

procedure TDMContasPagar.QLiberarBaixaCalcFields(DataSet: TDataSet);
begin
  //Gian 16/10/2017
  //Linha abaixo estava comentada, não informando o cliente para liberar baixa.
  
  QLiberarBaixadesc_fornecedor.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QLiberarBaixaCod_Cadastro.Value),True);
end;

procedure TDMContasPagar.QRContasPagar_TitulosAbertoCalcFields(
  DataSet: TDataSet);
Var wValor_Capitalizacao,wTaxa,wPerc_Juro_Mora : Real;
    wMoeda : Integer;
    wDiasCarencia,wTipoJuro,wDataCapitalizacao:String;
begin
//  ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_TitulosAbertoCod_Conta_Pagar_Cab.Value)+
//  ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PGTO. JUROS'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESCONTO'+CHR(39)+
//  ') AND (DT_MOVIMENTO <='+chr(39)+DateToStr(pDataBase)+chr(39)+')');
//  If Trim(ValorPago)<> '' then
//    QRContasPagar_TitulosAbertoValorPago.Value:=StrToFloat(ValorPago)
//  Else
//    QRContasPagar_TitulosAbertoValorPago.Value:=0;
//  QRContasPagar_TitulosAbertoVal_Titulo.Value:=QRContasPagar_TitulosAbertoVal_Original.Value - QRContasPagar_TitulosAbertoValorPago.Value;
//  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
//     If QRContasPagar_TitulosAbertoVal_Tit.Value > QRContasPagar_TitulosAbertoVal_Original.Value Then
//        QRContasPagar_TitulosAbertoVal_Titulo.Value:=QRContasPagar_TitulosAbertoVal_Titulo.Value +
//                                                     QRContasPagar_TitulosAbertoVal_Tit.Value -
//                                                     QRContasPagar_TitulosAbertoVal_Original.Value;
    If QRContasPagar_TitulosAbertoNUM_TIPO_JURO.Text <> 'SEM JURO' then
    Begin
       wValor_Capitalizacao:=0;
       wDataCapitalizacao:=DateToStr(QRContasPagar_TitulosAbertoDt_Capitalizacao.Value);
       wTipoJuro:=QRContasPagar_TitulosAbertoNUM_TIPO_JURO.Text;
       wDiasCarencia:=QRContasPagar_TitulosAbertoNUM_DIAS_CARENCIA.Text;
       wTaxa := 0;
       if QRContasPagar_TitulosAbertoPerc_Taxa.Text <> '' Then
          wTaxa  := QRContasPagar_TitulosAbertoPerc_Taxa.value;
       wPerc_Juro_Mora := 0;
       if (QRContasPagar_TitulosAbertoPerc_Juro_Mora.Text <> '') And (QRContasPagar_TitulosAbertoInd_Situacao.Value = 'ABERTO' )Then
          wPerc_Juro_Mora  := QRContasPagar_TitulosAbertoPerc_Juro_Mora.value;
       wMoeda:=QRContasPagar_TitulosAbertoCOD_MOEDA.Value;
       wValor_Capitalizacao:=DMContasReceber.CalculaJuros(QRContasPagar_TitulosAbertoVal_Titulo.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
            StrToDate(wDataCapitalizacao),QRContasPagar_TitulosAbertoDt_Calculo_Juros.Value,QRContasPagar_TitulosAbertoDt_Capitalizacao.Value,wTipoJuro,wDiasCarencia,'CP');
       wValor_Capitalizacao:=(Trunc(wValor_Capitalizacao*100)/100);
       if wValor_Capitalizacao > 0.001 then
          QRContasPagar_TitulosAbertoVal_Juros.Value:=wValor_Capitalizacao; // + QContasReceberBaixaVal_Titulo.Value;
     End; //if sem juro
end;

Function TDMContasPagar.Calcula_Variacao_cambial(wSaldo_indexado,
                                                 wSaldo_Atual: Real;
                                                 wdata: TDateTime;
                                                 wcod_moeda: Real): Real;
Begin
  Result := wSaldo_indexado*(DMMoeda.MaiorCotacao(wCod_Moeda,wdata))-wSaldo_Atual;
End;

procedure TDMContasPagar.QRContasPagar_TitulosBaixadosCalcFields(
  DataSet: TDataSet);
var
//ValorPago:String;
  wCodContaCorrente, wDescContaCorrente: string;
begin

//  QRContasPagar_TitulosBaixadosValorPago.Value:=0;
//  ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_TitulosBaixadosCod_Conta_Pagar_Cab.Value)+
//  ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESCONTO'+CHR(39)+')');
//  If Trim(ValorPago)<>'' then
//    QRContasPagar_TitulosBaixadosValorPago.Value:=StrToFloat(ValorPago);

//  ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_TitulosBaixadosCod_Conta_Pagar_Cab.Value)+
//  ') AND (IND_TIPO_MOVIMENTO='+CHR(39)+'DESCONTO'+CHR(39)+')');
//  If Trim(ValorPago)<>'' then
//    QRContasPagar_TitulosBaixadosValorPago.Value:=QRContasPagar_TitulosBaixadosValorPago.Value - StrToFloat(ValorPago);
//Para exibir a descrição da conta corrente quando o pagamento for realizado via banco. Alex 09/11/2022
    if (QRContasPagar_TitulosBaixadosIND_FORMA_PAGAMENTO.Value = 'Banco') then
    begin
      wCodContaCorrente := DMOracle.FastSelect('COD_CONTA_CORRENTE','TB_BCO_MOVIMENTO','COD_CONTA_PAGAR_CAB = ' + QRContasPagar_TitulosBaixadosCOD_CONTA_PAGAR_CAB.Text);
      wDescContaCorrente := DMOracle.FastSelect('DESC_CONTA_CORRENTE','TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + wCodContaCorrente);
      if (wCodContaCorrente <> '') then
        QRContasPagar_TitulosBaixadosdesc_conta_corrente.Value := wDescContaCorrente;
    end;
end;

procedure TDMContasPagar.QRContasPagar_VencimentosCalcFields(
  DataSet: TDataSet);
Var
  ValorPago:String;
begin
  ValorPago:=DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTA_PAGAR_MOV','(COD_CONTA_PAGAR_CAB = '+FloatToStr(QRContasPagar_VencimentosCod_Conta_Pagar_Cab.Value)+
  ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PRINCIPAL'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'PGTO. JUROS'+CHR(39)+') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'DESCONTO'+CHR(39)+
  ') AND (IND_TIPO_MOVIMENTO<>'+CHR(39)+'IMPOSTO RENDA'+CHR(39)+') AND (DT_MOVIMENTO <='+chr(39)+DateToStr(pDataBase)+chr(39)+')');
  If Trim(ValorPago)<>'' then
     QRContasPagar_VencimentosVal_Titulo.Value:=QRContasPagar_VencimentosVal_Original.Value - StrToFloat(ValorPago)
   Else
     QRContasPagar_VencimentosVal_Titulo.Value:=QRContasPagar_VencimentosVal_Original.Value;
end;

procedure TDMContasPagar.QContasPagar_CabCOD_CADASTROValidate(
  Sender: TField);
begin
  if Trim(QContasPagar_CabCOD_CADASTRO.Text) <> '' then
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QContasPagar_CabCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!')
end;

procedure TDMContasPagar.QContasPagarBaixaMovAfterInsert(
  DataSet: TDataSet);
begin
  QContasPagarBaixaMovCod_Conta_Pagar_Cab.Value:=QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
  QContasPagarBaixaMovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
  QContasPagarBaixaMovDT_Usuario.Value:=DMOracle.DataHoraServ;
end;

procedure TDMContasPagar.QRPgto_Dpto_FinalidadeCalcFields(
  DataSet: TDataSet);
begin
  If QRPgto_Dpto_FinalidadeInd_tipo_movimento.Value = 'PGTO. PRINCIPAL' Then
     QRPgto_Dpto_FinalidadeVal_Pagto_Principal.Value := QRPgto_Dpto_FinalidadeVal_Pagto_Principal.Value + QRPgto_Dpto_FinalidadeVal_Movimento.Value;
  If QRPgto_Dpto_FinalidadeInd_tipo_movimento.Value =  'PGTO. JUROS' Then
     QRPgto_Dpto_FinalidadeVal_Pagto_Juros.Value := QRPgto_Dpto_FinalidadeVal_Pagto_Juros.Value + QRPgto_Dpto_FinalidadeVal_Movimento.Value;
  If QRPgto_Dpto_FinalidadeInd_tipo_movimento.Value =  'DESCONTO' Then
     QRPgto_Dpto_FinalidadeVal_Desconto.Value := QRPgto_Dpto_FinalidadeVal_Desconto.Value + QRPgto_Dpto_FinalidadeVal_Movimento.Value;
end;

procedure TDMContasPagar.QContasPagar_CabDT_VENCIMENTOValidate(
  Sender: TField);
begin
  if (DMParamSistema.CodEmpresa <> 'ESPINDOLA') and (DMParamSistema.CodEmpresa <> 'MATRANSP') then
  begin
    If QContasPagar_CabDt_Vencimento.Value < QContasPagar_CabDt_Emissao.Value Then
      Raise Exception.Create ('Data de Vencimento deve ser Maior que a Emissão');
  end;
end;

procedure TDMContasPagar.QContasPagar_MovCalcFields(DataSet: TDataSet);
Var wContaCorrente : String;
begin
  If QContasPagar_MovCod_Bco_Movimento.Text <> '' Then
   Begin
     wContaCorrente := DMOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_BCO_MOVIMENTO','COD_BCO_MOVIMENTO = '+QContasPagar_MovCod_Bco_Movimento.Text,True);
     IF wContaCorrente <> '' Then
        QContasPagar_MovDesc_Banco.Value := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+wContaCorrente,True);
   End;
end;

procedure TDMContasPagar.QRContasPagar_CabCalcFields(DataSet: TDataSet);
var
  aux : string;
begin

  aux := DMOracle.BuscaNome('SELECT NUM_ORDEM_COMPRA '+
                            'FROM TB_NOTA_CAB, TB_ORDEM_COMPRA_CAB',
                            'TB_NOTA_CAB.COD_ORDEM_COMPRA_CAB = TB_ORDEM_COMPRA_CAB.COD_ORDEM_COMPRA_CAB ' +
                            'AND TB_NOTA_CAB.COD_NOTA_CAB = ' + inttostr(QRContasPagar_CabCOD_NOTA_CAB.Value));

  if trim(aux) <> '' then
     QRContasPagar_Cabnum_ordem_compra.Value := strtoint(aux);
end;

procedure TDMContasPagar.QContasPagar_CabCOD_CONTA_CORRENTEChange(
  Sender: TField);
begin
  If QContasPagar_CabCOD_CONTA_CORRENTE.Text <> '' Then
     QContasPagar_CabCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+QContasPagar_CabCOD_CONTA_CORRENTE.Text,True);
end;

procedure TDMContasPagar.QContasPagar_CabAfterOpen(DataSet: TDataSet);
begin
  if QContasPagar_CabIND_FORMA_PAGAMENTO.Value = 'Bloqueto' then
     QContasPagar_CabIND_FORMA_PAGAMENTO.Value := 'Boleto/Guia/Fatura';

   //para abrir informações de reparcelamento em tela
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    QTitulosAnteioresRep.Close;
    if QContasPagar_CabDESC_TIPO_DOCUMENTO.Text = 'REP' then
    begin
      QTitulosAnteioresRep.SetVariable('NUM_TITULO', QContasPagar_CabNUM_TITULO.Value);
      QTitulosAnteioresRep.Open;
    end;

    QTitulosNovosRep.Close;
    if QContasPagar_CabIND_SITUACAO.Text = 'REPARCELAR' then
    begin
      QTitulosNovosRep.SetVariable('NUM_TITULO_ANT', QContasPagar_CabNUM_TITULO.Value);
      QTitulosNovosRep.SetVariable('NUM_PARCELA', QContasPagar_CabNUM_PARCELA.Value);
      QTitulosNovosRep.Open;
    end;
  end;

end;

Procedure TDMContasPagar.GeraContaPagar(pCadastro,pFinalidade, pNum_Nota, pCod_Filial, pCod_Nota_Cab:Integer; pVl_Titulo:Real;
          pDepartamento,pCod_Serie,pObservacao, pContaCorrente:String; pDt_Vencimento,pDt_Recebimento : TDateTime; pCod_Contrato_Locatario : String = '');
Begin
  With DMContasPagar Do
  Begin
    QContasPagar_Cab.Close;
    QContasPagar_Cab.Open;
    QContasPagar_Mov.Close;
    QContasPagar_Mov.Open;
    QContasPagar_Cab.Insert;
    QContasPagar_CabCOD_FINALIDADE.Value := pFinalidade;
    QContasPagar_CabCOD_CADASTRO.Value := pCadastro;
    QContasPagar_CabDT_EMISSAO.Value := pDt_Recebimento;
    QContasPagar_CabNUM_TITULO.Value := pNum_Nota;
    QContasPagar_CabCOD_FILIAL.Value := pCod_Filial;
    QContasPagar_CabCOD_DEPARTAMENTO.Text := Trim(pDepartamento);
    QContasPagar_CabNUM_PARCELA.Value := 1;
    QContasPagar_CabDESC_TIPO_DOCUMENTO.Value := pCod_Serie;
    QContasPagar_CabDT_MOVIMENTO.Value := pDt_Recebimento;
    QContasPagar_CabDT_VENCIMENTO.Value := pDt_Vencimento;
    If DMFinalidade.QFinalidadeInd_Encargo.Value = 'EMISSAO' Then
       QContasPagar_CabDT_CAPITALIZACAO.Value := pDt_Recebimento
    Else
       QContasPagar_CabDT_CAPITALIZACAO.Value := QContasPagar_CabDT_VENCIMENTO.Value;
    QContasPagar_CabVAL_TITULO.Value := pVl_Titulo;
    QContasPagar_CabVal_Indexado.Value := 0;
    If pCod_Nota_Cab > 0 Then
       QContasPagar_CabCOD_NOTA_CAB.Value := pCod_Nota_Cab;
    QContasPagar_CabIND_ACEITE.Value := 'NAO';
    QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
    QContasPagar_CabVAL_ORIGINAL.Value := QContasPagar_CabVal_Titulo.Value;
    QContasPagar_CabPerc_Desc_Pontualidade.Value := 0;
    QContasPagar_CabPerc_Desc_Antecipacao.Value := 0;
    If Trim(pContaCorrente) <> '' Then
       QContasPagar_CabCod_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(pContaCorrente),True);
    QContasPagar_CabCod_Conta_Corrente.Text := Trim(pContaCorrente);
    QContasPagar_CabDesc_Observacao.Value := pObservacao;
    If pCod_Contrato_Locatario <> '' Then
       QContasPagar_CabCod_Contrato_Locatario.Value := StrToInt(pCod_Contrato_Locatario);
    QContasPagar_Cab.Post;
    QContasPagar_Mov.Open;
{    QContasPagar_Mov.Insert;
    QContasPagar_MovCod_Conta_Pagar_Cab.Value := QContasPagar_CabCod_Conta_Pagar_Cab.Value;
    QContasPagar_MovDt_Movimento.Value := DMNotaEntrada.QNotaEntradaDt_Recebimento.Value;
    QContasPagar_MovInd_Tipo_Movimento.Value := 'PRINCIPAL';
    QContasPagar_MovDT_Usuario.Value := DMOracle.DataHoraServ;
    QContasPagar_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
    QContasPagar_MovVal_Movimento.Value :=  QContasPagar_CabVal_Titulo.Value;
    QContasPagar_Mov.Post;
}    QContasPagar_Mov.Close;
    QContasPagar_Cab.Close;
  End;
End;



procedure TDMContasPagar.QContasPagar_CabAfterEdit(DataSet: TDataSet);
begin
    QContasPagar_CabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QContasPagar_CabDT_USUARIO.Value := DMOracle.DataHoraServ;
end;

procedure TDMContasPagar.CdsContasPagarReparcelamentoCHECADOChange(
  Sender: TField);
begin
  if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
    pTotalReparcelamento := pTotalReparcelamento + CdsContasPagarReparcelamentoVAL_TITULO.Value
  else 
    pTotalReparcelamento := pTotalReparcelamento - CdsContasPagarReparcelamentoVAL_TITULO.Value;

  if pTotalReparcelamento < 0 then
    pTotalReparcelamento := 0;
end;

procedure TDMContasPagar.QContasPagar_MovBeforePost(DataSet: TDataSet);
begin
  QContasPagar_MovCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.


