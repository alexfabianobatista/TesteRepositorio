unit UBancoAgenciaRel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient, Provider;

type
  TDMBancoAgenciaRel = class(TDataModule)
    QRBaixaDep_Pendente: TOracleDataSet1;
    QRBaixaDep_PendenteDT_BAIXA_DEP_PENDENTE: TDateTimeField;
    QRBaixaDep_PendenteVAL_MOVIMENTO: TFloatField;
    QRBaixaDep_PendenteNUM_CONTA_CORRENTE: TStringField;
    QRBaixaDep_PendenteDESC_CONTA_CORRENTE: TStringField;
    QRBaixaDep_PendenteDESC_OBSERVACAO: TStringField;
    QRDeposito_Pendente: TOracleDataSet1;
    QRDeposito_PendenteDT_MOVIMENTO: TDateTimeField;
    QRDeposito_PendenteVAL_MOVIMENTO: TFloatField;
    QRDeposito_PendenteNUM_CONTA_CORRENTE: TStringField;
    QRDeposito_PendenteDESC_CONTA_CORRENTE: TStringField;
    QRDeposito_PendenteDESC_OBSERVACAO: TStringField;
    QRSaldoDiarioCC: TOracleDataSet1;
    QRSaldoDiarioCCDESC_CONTA_CORRENTE: TStringField;
    QRSaldoDiarioCCNUM_CONTA_CORRENTE: TStringField;
    QRSaldoDiarioCCDT_MOVIMENTO: TDateTimeField;
    QRSaldoDiarioCCSALDO: TFloatField;
    QRMov_Historico: TOracleDataSet1;
    QRMov_HistoricoCOD_HISTORICO: TIntegerField;
    QRMov_HistoricoDESC_HISTORICO: TStringField;
    QRMov_HistoricoDESC_CONTA_CORRENTE: TStringField;
    QRMov_HistoricoCREDITO: TFloatField;
    QRMov_HistoricoDEBITO: TFloatField;
    QRBancoMov_CopCheque: TOracleDataSet1;
    QRBancoMov_CopChequeCOD_BCO_MOVIMENTO: TIntegerField;
    QRBancoMov_CopChequeCOD_USUARIO: TIntegerField;
    QRBancoMov_CopChequeCOD_HISTORICO: TIntegerField;
    QRBancoMov_CopChequeCOD_CONTA_CORRENTE: TIntegerField;
    QRBancoMov_CopChequeNUM_CHEQUE: TIntegerField;
    QRBancoMov_CopChequeDT_MOVIMENTO: TDateTimeField;
    QRBancoMov_CopChequeVAL_MOVIMENTO: TFloatField;
    QRBancoMov_CopChequeDESC_OBSERVACAO: TStringField;
    QRBancoMov_CopChequeDESC_COMPLEMENTO1: TStringField;
    QRBancoMov_CopChequeDESC_COMPLEMENTO2: TStringField;
    QRBancoMov_CopChequeDT_USUARIO: TDateTimeField;
    QRBancoMov_CopChequeNUM_NOTA: TIntegerField;
    QRBancoMov_CopChequeCOD_SERIE: TStringField;
    QRBancoMov_CopChequeCOD_CADASTRO: TIntegerField;
    QRBancoMov_CopChequeNUM_CARGA: TIntegerField;
    QRBancoMov_CopChequeDESC_CIDADE: TStringField;
    QRBancoMov_CopChequeDESC_FILIAL: TStringField;
    QRBancoMov_CopChequeDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_CopChequeCOD_CONTA_CORRENTE_1: TIntegerField;
    QRBancoMov_CopChequeCOD_BANCO_AGENCIA: TIntegerField;
    QRBancoMov_CopChequeDESC_CONTA_CORRENTE: TStringField;
    QRBancoMov_CopChequeIND_EMITE_CHEQUE: TStringField;
    QRBancoMov_CopChequeDESC_HISTORICO: TStringField;
    QRBancosNrCheques: TOracleDataSet1;
    QRBancosNrChequesDESC_CONTA_CORRENTE: TStringField;
    QRBancosNrChequesNR_CHEQUES: TFloatField;
    QRBancosNrChequesNUM_CONTA_CORRENTE: TStringField;
    QRCheques_Baixados: TOracleDataSet1;
    QRCheques_BaixadosCOD_HISTORICO: TIntegerField;
    QRCheques_BaixadosNUM_CHEQUE: TIntegerField;
    QRCheques_BaixadosVAL_MOVIMENTO: TFloatField;
    QRCheques_BaixadosDESC_BANCO_AGENCIA: TStringField;
    QRCheques_BaixadosDESC_COMPLEMENTO2: TStringField;
    QRCheques_BaixadosCOD_CONTA_CORRENTE: TIntegerField;
    QRCheques_BaixadosDT_BAIXA_CHEQUE: TDateTimeField;
    QRBancoMov_Lanc: TOracleDataSet1;
    QRBancoMov_LancCOD_HISTORICO: TIntegerField;
    QRBancoMov_LancDESC_HISTORICO: TStringField;
    QRBancoMov_LancDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_LancCOD_BANCO_AGENCIA: TIntegerField;
    QRBancoMov_LancDESC_CONTA_CORRENTE: TStringField;
    QRBancoMov_LancCOD_CONTA_CORRENTE: TIntegerField;
    QRBancoMov_LancTCREDITO: TFloatField;
    QRBancoMov_LancTDEBITO: TFloatField;
    QRBcoComissaoVend: TOracleDataSet1;
    QRBcoComissaoVendNUM_CHEQUE: TIntegerField;
    QRBcoComissaoVendVAL_CHEQUE: TFloatField;
    QRBcoComissaoVendNUM_NOTA: TIntegerField;
    QRBcoComissaoVendCOD_CADASTRO: TIntegerField;
    QRBcoComissaoVendDT_MOVIMENTO: TDateTimeField;
    QRBcoComissaoVendNOME: TStringField;
    QRBcoComissaoVendCOD_VENDEDOR: TIntegerField;
    QRBcoComissaoVendVENDEDOR: TStringField;
    QRBcoComissaoVendVAL_COMISSAO: TFloatField;
    QRBcoComissaoVendPERC_COMISSAO: TFloatField;
    QRBancoMov_Cheques_PD: TOracleDataSet1;
    QRBancoMov_Cheques_PDCOD_BCO_MOVIMENTO: TIntegerField;
    QRBancoMov_Cheques_PDCOD_HISTORICO: TIntegerField;
    QRBancoMov_Cheques_PDNUM_CHEQUE: TIntegerField;
    QRBancoMov_Cheques_PDDT_MOVIMENTO: TDateTimeField;
    QRBancoMov_Cheques_PDVAL_MOVIMENTO: TFloatField;
    QRBancoMov_Cheques_PDDESC_HISTORICO: TStringField;
    QRBancoMov_Cheques_PDCOD_BANCO_AGENCIA: TIntegerField;
    QRBancoMov_Cheques_PDDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_Cheques_PDNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_Cheques_PDDESC_OBSERVACAO: TStringField;
    QRBancoMov_Cheques_PDNUM_NOTA: TIntegerField;
    QRBanco_Mov_Historico: TOracleDataSet1;
    QRBanco_Mov_HistoricoTCREDITO: TFloatField;
    QRBanco_Mov_HistoricoTDEBITO: TFloatField;
    QRBanco_Mov_HistoricoCOD_HISTORICO: TIntegerField;
    QRBanco_Mov_HistoricoDESC_HISTORICO: TStringField;
    QRChequePDatadoPendente: TOracleDataSet1;
    QRChequePDatadoPendenteCOD_BCO_MOVIMENTO: TIntegerField;
    QRChequePDatadoPendenteCOD_HISTORICO: TIntegerField;
    QRChequePDatadoPendenteNUM_CHEQUE: TIntegerField;
    QRChequePDatadoPendenteDT_MOVIMENTO: TDateTimeField;
    QRChequePDatadoPendenteVAL_MOVIMENTO: TFloatField;
    QRChequePDatadoPendenteDESC_OBSERVACAO: TStringField;
    QRChequePDatadoPendenteDESC_COMPLEMENTO1: TStringField;
    QRChequePDatadoPendenteDESC_COMPLEMENTO2: TStringField;
    QRChequePDatadoPendenteCOD_CADASTRO: TIntegerField;
    QRChequePDatadoPendenteDESC_HISTORICO: TStringField;
    QRChequePDatadoPendenteIND_OPERACAO: TStringField;
    QRChequePDatadoPendenteDESC_BANCO_AGENCIA: TStringField;
    QRChequePDatadoPendenteDESC_CONTA_CORRENTE: TStringField;
    QRChequePDatadoPendenteCOD_CONTA_CORRENTE: TIntegerField;
    QRChequePDatadoPendenteNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_SaldosBanco: TOracleDataSet1;
    QRBancoMov_SaldosBancoSALDO: TFloatField;
    QRBancoMov_SaldosBancoSALDO_CONCILIACAO: TFloatField;
    QRBancoMov_SaldosBancoSALDO_LIQUIDO: TFloatField;
    QRBancoMov_SaldosBancoCOD_CONTA_CORRENTE: TFloatField;
    QRBancoMov_SaldosBancoDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_SaldosBancoNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_MovSaldos: TOracleDataSet1;
    QRBancoMov_MovSaldosCOD_BCO_MOVIMENTO: TFloatField;
    QRBancoMov_MovSaldosDT_MOVIMENTO: TDateTimeField;
    QRBancoMov_MovSaldosCOD_HISTORICO: TFloatField;
    QRBancoMov_MovSaldosDESC_COMPLEMENTO1: TStringField;
    QRBancoMov_MovSaldosCOD_BANCO_AGENCIA: TFloatField;
    QRBancoMov_MovSaldosDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_MovSaldosCOD_CONTA_CORRENTE: TFloatField;
    QRBancoMov_MovSaldosNUM_CHEQUE: TFloatField;
    QRBancoMov_MovSaldosVAL_MOVIMENTO: TFloatField;
    QRBancoMov_MovSaldosDESC_HISTORICO: TStringField;
    QRBancoMov_MovSaldosDESC_CONCILIA: TStringField;
    QRBancoMov_MovSaldosCOD_CADASTRO: TFloatField;
    QRBancoMov_MovSaldosdesc_complemento: TStringField;
    QRBancoMov_MovSaldosDESC_OBSERVACAO: TStringField;
    QRBancoMov_MovSaldosNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_MovSaldosCOD_DEPARTAMENTO: TFloatField;
    QRBanco: TOracleDataSet1;
    QRBancoDESC_SIGLA_ESTADO: TStringField;
    QRBancoDESC_BANCO_AGENCIA: TStringField;
    QRBancoDESC_CIDADE: TStringField;
    QRBancoDESC_SIGLA: TStringField;
    QRBancoCOD_BANCO_AGENCIA: TIntegerField;
    QRCCorrente: TOracleDataSet1;
    QRCCorrenteVAL_LIMITE: TFloatField;
    QRCCorrenteDT_VENC_LIMITE: TDateTimeField;
    QRCCorrenteNUM_CHEQUE: TIntegerField;
    QRCCorrenteDESC_CONTA_CORRENTE: TStringField;
    QRCCorrenteNOME_RESPONSAVEL: TStringField;
    QRCCorrenteNUM_CONTA_CORRENTE: TStringField;
    DSRBanco: TDataSource;
    QRBancoMov_Cheques_Data: TOracleDataSet1;
    QRBancoMov_Cheques_DataCOD_BCO_MOVIMENTO: TIntegerField;
    QRBancoMov_Cheques_DataCOD_HISTORICO: TIntegerField;
    QRBancoMov_Cheques_DataCOD_CONTA_CORRENTE: TIntegerField;
    QRBancoMov_Cheques_DataNUM_CHEQUE: TIntegerField;
    QRBancoMov_Cheques_DataDT_MOVIMENTO: TDateTimeField;
    QRBancoMov_Cheques_DataVAL_MOVIMENTO: TFloatField;
    QRBancoMov_Cheques_DataDESC_OBSERVACAO: TStringField;
    QRBancoMov_Cheques_DataDESC_COMPLEMENTO1: TStringField;
    QRBancoMov_Cheques_DataDESC_COMPLEMENTO2: TStringField;
    QRBancoMov_Cheques_DataDESC_HISTORICO: TStringField;
    QRBancoMov_Cheques_DataIND_OPERACAO: TStringField;
    QRBancoMov_Cheques_DataDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_Cheques_DataDESC_CONTA_CORRENTE: TStringField;
    QRBancoMov_Cheques_DataCOD_CADASTRO: TIntegerField;
    QRBancoMov_Cheques_Datadesc_nominal: TStringField;
    QRBancoMov_Cheques_DataNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_Cheques_DataNUM_NOTA: TIntegerField;
    QRBancoMov_Cheques_CC: TOracleDataSet1;
    QRBancoMov_Cheques_CCCOD_BCO_MOVIMENTO: TIntegerField;
    QRBancoMov_Cheques_CCCOD_HISTORICO: TIntegerField;
    QRBancoMov_Cheques_CCCOD_CONTA_CORRENTE: TIntegerField;
    QRBancoMov_Cheques_CCNUM_CHEQUE: TIntegerField;
    QRBancoMov_Cheques_CCDT_MOVIMENTO: TDateTimeField;
    QRBancoMov_Cheques_CCVAL_MOVIMENTO: TFloatField;
    QRBancoMov_Cheques_CCDESC_OBSERVACAO: TStringField;
    QRBancoMov_Cheques_CCDESC_COMPLEMENTO1: TStringField;
    QRBancoMov_Cheques_CCDESC_COMPLEMENTO2: TStringField;
    QRBancoMov_Cheques_CCCOD_CADASTRO: TIntegerField;
    QRBancoMov_Cheques_CCDESC_HISTORICO: TStringField;
    QRBancoMov_Cheques_CCIND_OPERACAO: TStringField;
    QRBancoMov_Cheques_CCDESC_BANCO_AGENCIA: TStringField;
    QRBancoMov_Cheques_CCDESC_CONTA_CORRENTE: TStringField;
    QRBancoMov_Cheques_CCnome: TStringField;
    QRBancoMov_Cheques_CCNUM_CONTA_CORRENTE: TStringField;
    QRBancoMov_Cheques_CCNUM_NOTA: TIntegerField;
    QRBancoConcilia_Cheques: TOracleDataSet1;
    QRBancoConcilia_ChequesCOD_BCO_CONCILIA: TIntegerField;
    QRBancoConcilia_ChequesCOD_HISTORICO: TIntegerField;
    QRBancoConcilia_ChequesCOD_CONTA_CORRENTE: TIntegerField;
    QRBancoConcilia_ChequesNUM_CHEQUE: TIntegerField;
    QRBancoConcilia_ChequesDT_MOVIMENTO: TDateTimeField;
    QRBancoConcilia_ChequesDT_SISTEMA: TDateTimeField;
    QRBancoConcilia_ChequesVAL_MOVIMENTO: TFloatField;
    QRBancoConcilia_ChequesDESC_OBSERVACAO: TStringField;
    QRBancoConcilia_ChequesDESC_COMPLEMENTO1: TStringField;
    QRBancoConcilia_ChequesDESC_COMPLEMENTO2: TStringField;
    QRBancoConcilia_ChequesDESC_HISTORICO: TStringField;
    QRBancoConcilia_ChequesDESC_BANCO_AGENCIA: TStringField;
    QRBancoConcilia_ChequesDESC_CONTA_CORRENTE: TStringField;
    QRBancoConcilia_Chequesdesc_nominal: TStringField;
    QRBancoCC: TOracleDataSet1;
    QRBancoCCCOD_BANCO: TIntegerField;
    QRBancoCCCOD_AGENCIA: TIntegerField;
    QRBancoCCDESC_CIDADE: TStringField;
    QRBancoCCDESC_SIGLA: TStringField;
    QRBancoCCDESC_BANCO_AGENCIA: TStringField;
    QRBancoCCNUM_CONTA_CORRENTE: TStringField;
    QRChequeDevolvido: TOracleDataSet1;
    QRChequeDevolvidoDT_MOVIMENTO: TDateTimeField;
    QRChequeDevolvidoVAL_MOVIMENTO: TFloatField;
    QRChequeDevolvidoDESC_CONTA_CORRENTE: TStringField;
    QRChequeDevolvidoDESC_OBSERVACAO: TStringField;
    QRChequeDevolvidoDESC_COMPLEMENTO1: TStringField;
    QRChequeDevolvidoNOME_CADASTRO: TStringField;
    QRBaixaChequeDevolvido: TOracleDataSet1;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    QRBaixaChequeDevolvidoDT_BAIXA_CHEQUE_DEVOLVIDO: TDateTimeField;
    QRSaldoMedioPeriodo: TOracleDataSet1;
    QRSaldoMedioPeriodoCOD_BCO_MOVIMENTO: TIntegerField;
    QRSaldoMedioPeriodoDT_MOVIMENTO: TDateTimeField;
    QRSaldoMedioPeriodoDESC_HISTORICO: TStringField;
    QRSaldoMedioPeriodoSALDO: TFloatField;
    QRCheques_BaixadosVAL_MOVIMENTO_BAIXA: TFloatField;
    QRCheques_BaixadosDT_MOVIMENTO: TDateTimeField;
    QRCheques_BaixadosCOD_BCO_MOVIMENTO: TIntegerField;
    QRChequeDevolvidoVAL_BAIXADO: TFloatField;
    QRDeposito_PendenteVAL_BAIXADO: TFloatField;
    QRBaixaDep_PendenteVAL_BAIXADO: TFloatField;
    QRBaixaChequeDevolvidoVAL_BAIXADO: TFloatField;
    QRBaixaDep_PendenteVAL_BAIXA: TFloatField;
    QRBaixaDep_PendenteDT_BAIXA: TDateTimeField;
    QRBaixaDep_PendenteCOD_BCO_MOVIMENTO: TIntegerField;
    QRBaixaChequeDevolvidoVAL_BAIXA: TFloatField;
    QRBaixaChequeDevolvidoDT_BAIXA: TDateTimeField;
    QRBaixaChequeDevolvidoCOD_BCO_MOVIMENTO: TIntegerField;
    QRChequeDevolvidoNUM_CHEQUE: TFloatField;
    QRChequeDevolvidoNOME_VENDEDOR: TStringField;
    QRChequeDevolvidoCOD_VENDEDOR: TFloatField;
    QRChequeDevolvidoVAL_SALDO: TFloatField;
    QRDeposito_PendenteVAL_SALDO: TFloatField;
    QRChequeDevolvidoCOD_CADASTRO: TFloatField;
    QRBaixaChequeDevolvidoNUM_CHEQUE: TIntegerField;
    QRSaldoMedioPeriodoCC: TOracleDataSet1;
    QRBancoMov_Cheques_PDNOME: TStringField;
    QRSaldoMedioPeriodoCCDESC_BANCO_AGENCIA: TStringField;
    QRSaldoMedioPeriodoCCVAL_MEDIA: TFloatField;
    QRSaldoMedioPeriodoCCCOD_BANCO_AGENCIA: TFloatField;
    QRSaldoMedioPeriodoCCNUM_CONTA_CORRENTE: TStringField;
    QRSaldoMedioPeriodoCCDESC_CONTA_CORRENTE: TStringField;
    QRSaldoDiarioCCCOD_CONTA_CORRENTE: TFloatField;
    QRDeposito_PendenteNUM_CHEQUE: TFloatField;
    QRCheques_BaixadosDT_MOVIMENTO_PRINCIPAL: TDateTimeField;
    QRBloquetosEmitidosBanco: TOracleDataSet1;
    QRBloquetosEmitidosBancoDESC_BANCO_AGENCIA: TStringField;
    QRBloquetosEmitidosBancoNUM_BLOQUETOS: TFloatField;
    QRBancoMov_Cheques_PDDESC_COMPLEMENTO1: TStringField;
    QRBancoMov_Cheques_PDDESC_OBSERVACAO2: TStringField;
    QRChequeDevolvidoDESC_CLASSIFICACAO: TStringField;
    QRBanco_Mov_HistoricoCOD_DEPARTAMENTO: TIntegerField;
    QRBanco_Mov_HistoricoDESC_DEPARTAMENTO: TStringField;
    QRChequeEmitidoCP: TOracleDataSet1;
    QRChequeEmitidoCPDT_MOVIMENTO: TDateTimeField;
    QRChequeEmitidoCPVAL_MOVIMENTO: TFloatField;
    QRChequeEmitidoCPNUM_CONTA_CORRENTE: TStringField;
    QRChequeEmitidoCPDESC_CONTA_CORRENTE: TStringField;
    QRChequeEmitidoCPDESC_OBSERVACAO: TStringField;
    QRChequeEmitidoCPCOD_CADASTRO: TIntegerField;
    QRChequeEmitidoCPNOME: TStringField;
    QRChequeEmitidoCPNUM_TITULO: TIntegerField;
    QRChequeEmitidoCPNUM_PARCELA: TIntegerField;
    QRBancoMov_MovSaldosDESC_CADASTRO: TStringField;
    QRExtrato: TOracleDataSet1;
    DspRExtrato: TDataSetProvider;
    CdRExtrato: TClientDataSet;
    QRExtratoIND_TIPO_REGISTRO: TFloatField;
    QRExtratoCOD_BCO_MOVIMENTO: TFloatField;
    QRExtratoDT_MOVIMENTO: TDateTimeField;
    QRExtratoCOD_HISTORICO: TFloatField;
    QRExtratoDESC_OBSERVACAO: TStringField;
    QRExtratoCOD_DEPARTAMENTO: TFloatField;
    QRExtratoCOD_CADASTRO: TFloatField;
    QRExtratoNUM_CHEQUE: TFloatField;
    QRExtratoNOME: TStringField;
    QRExtratoCOD_CONTA_CORRENTE: TFloatField;
    QRExtratoDESC_HISTORICO: TStringField;
    QRExtratoVAL_MOVIMENTO: TFloatField;
    QRExtratoNUM_CONTA_CORRENTE: TStringField;
    QRExtratoCOD_BANCO_AGENCIA: TIntegerField;
    QRExtratoDESC_BANCO_AGENCIA: TStringField;
    CdRExtratoIND_TIPO_REGISTRO: TFloatField;
    CdRExtratoCOD_BCO_MOVIMENTO: TFloatField;
    CdRExtratoDT_MOVIMENTO: TDateTimeField;
    CdRExtratoCOD_HISTORICO: TFloatField;
    CdRExtratoDESC_OBSERVACAO: TStringField;
    CdRExtratoCOD_DEPARTAMENTO: TFloatField;
    CdRExtratoCOD_CADASTRO: TFloatField;
    CdRExtratoNUM_CHEQUE: TFloatField;
    CdRExtratoNOME: TStringField;
    CdRExtratoCOD_CONTA_CORRENTE: TFloatField;
    CdRExtratoDESC_HISTORICO: TStringField;
    CdRExtratoVAL_MOVIMENTO: TFloatField;
    CdRExtratoNUM_CONTA_CORRENTE: TStringField;
    CdRExtratoCOD_BANCO_AGENCIA: TIntegerField;
    CdRExtratoDESC_BANCO_AGENCIA: TStringField;
    QRExtratoVAL_DEBITO: TFloatField;
    QRExtratoVAL_CREDITO: TFloatField;
    CdRExtratoVAL_DEBITO: TFloatField;
    CdRExtratoVAL_CREDITO: TFloatField;
    QRExtratoVAL_SALDO: TFloatField;
    CdRExtratoVAL_SALDO: TFloatField;
    QRBancoMov_MovSaldosIND_DATA_RELATORIO_BANCOS: TStringField;
    QRExtratoNUM_NOTA: TFloatField;
    CdRExtratoNUM_NOTA: TFloatField;
    QRExtratoNUM_PARCELA: TFloatField;
    CdRExtratoNUM_PARCELA: TFloatField;
    QRControleLancamentoCartao: TOracleDataSet1;
    QRControleLancamentoCartaoCOD_NOTA_CAB: TIntegerField;
    QRControleLancamentoCartaoDT_EMISSAO: TDateTimeField;
    QRControleLancamentoCartaoDT_RECEBIMENTO: TDateTimeField;
    QRControleLancamentoCartaoDESC_BANDEIRA: TStringField;
    QRControleLancamentoCartaoNUM_PARCELA: TIntegerField;
    QRControleLancamentoCartaoVAL_ORIGINAL: TFloatField;
    QRControleLancamentoCartaoCOD_BANCO_AGENCIA: TIntegerField;
    QRControleLancamentoCartaoNUM_PARCELAS: TIntegerField;
    QRControleLancamentoCartaoPERC_TAXA: TFloatField;
    QRControleLancamentoCartaoDESC_OPERACAO: TStringField;
    QRControleLancamentoCartaoVAL_RECEBIDO: TFloatField;
    QRControleLancamentoCartaoVAL_DIFERENCA: TFloatField;
    QRControleLancamentoCartaoNUM_NOTA: TIntegerField;
    QRBloquetosEmitidosBancoVALOR_TOTAL_TITULOS: TFloatField;
    QRControleLancamentoCartaoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRBancoMov_Cheques_CCCOD_DEPARTAMENTO: TIntegerField;
    QRBancoMov_Cheques_CCDESC_DEPARTAMENTO: TStringField;
    procedure QRBancoMov_MovSaldosCalcFields(DataSet: TDataSet);
    procedure QRBancoMov_Cheques_DataCalcFields(DataSet: TDataSet);
    procedure QRBancoMov_Cheques_CCCalcFields(DataSet: TDataSet);
    procedure QRBancoConcilia_ChequesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBancoAgenciaRel: TDMBancoAgenciaRel;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMBancoAgenciaRel.QRBancoMov_MovSaldosCalcFields(
  DataSet: TDataSet);
begin
  QRBancoMov_MovSaldosDesc_Complemento.Value := QRBancoMov_MovSaldosDesc_Complemento1.Value;
  If QRBancoMov_MovSaldosDesc_Complemento1.Value = '' Then
     If (QRBancoMov_MovSaldosDesc_Concilia.Value = 'M') And (QRBancoMov_MovSaldosCod_Cadastro.Value > 0) Then
        QRBancoMov_MovSaldosDesc_Complemento.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRBancoMov_MovSaldosCod_Cadastro.Text,True);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
   Begin
     QRBancoMov_MovSaldosDesc_Complemento.Value := QRBancoMov_MovSaldosDESC_OBSERVACAO.Value;
     If QRBancoMov_MovSaldosCod_Cadastro.Text <> '' Then
        QRBancoMov_MovSaldosDesc_Complemento.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRBancoMov_MovSaldosCod_Cadastro.Text,True);
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     QRBancoMov_MovSaldosDesc_Complemento.Value := QRBancoMov_MovSaldosDESC_OBSERVACAO.Value;

end;

procedure TDMBancoAgenciaRel.QRBancoMov_Cheques_DataCalcFields(
  DataSet: TDataSet);
begin
   If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ZADIMEL' Then
   Begin
    QRBancoMov_Cheques_DataDesc_Nominal.Value := QRBancoMov_Cheques_DataCod_Cadastro.Text+'-'+ QRBancoMov_Cheques_DataDesc_Observacao.Value;
    If QRBancoMov_Cheques_DataDesc_Observacao.Value = '' Then
       If QRBancoMov_Cheques_DataCod_Cadastro.Value > 0 Then
          QRBancoMov_Cheques_DataDesc_Nominal.Value := QRBancoMov_Cheques_DataCod_Cadastro.Text+'-'+ DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRBancoMov_Cheques_DataCod_Cadastro.Text,True);
   End
  Else
   If QRBancoMov_Cheques_DataCod_Cadastro.Value > 0 Then
      QRBancoMov_Cheques_DataDesc_Nominal.Value := QRBancoMov_Cheques_DataCod_Cadastro.Text+'-' + DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRBancoMov_Cheques_DataCod_Cadastro.Text,True);
end;

procedure TDMBancoAgenciaRel.QRBancoMov_Cheques_CCCalcFields(
  DataSet: TDataSet);
begin
    if QRBancoMov_Cheques_CCCod_Cadastro.Text <> '' Then
     QRBancoMov_Cheques_CCNome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRBancoMov_Cheques_CCCod_Cadastro.Text,True)
  Else
     QRBancoMov_Cheques_CCNome.Value := QRBancoMov_Cheques_CCDESC_OBSERVACAO.Value;

end;

procedure TDMBancoAgenciaRel.QRBancoConcilia_ChequesCalcFields(
  DataSet: TDataSet);
begin
    QRBancoConcilia_ChequesDesc_Nominal.Value := Trim(QRBancoConcilia_ChequesDesc_Historico.Value) +
                                       ' - ' + Trim(QRBancoConcilia_ChequesDesc_Observacao.Value) +
                                       ' - ' + Trim(QRBancoConcilia_ChequesDesc_Complemento1.Value) +
                                       ' - ' + Trim(QRBancoConcilia_ChequesDesc_Complemento2.Value);

end;



end.
