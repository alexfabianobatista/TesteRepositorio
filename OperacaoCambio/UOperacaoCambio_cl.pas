unit UOperacaoCambio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, Oracle;

type
  TDMOperacaoCambio = class(TDataModule)
    QOperacaoCambioACC: TOracleDataSet1;
    QOperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QOperacaoCambioACCNUM_CONTRATO: TStringField;
    QOperacaoCambioACCDT_OPERACAO: TDateTimeField;
    QOperacaoCambioACCDT_CREDITO: TDateTimeField;
    QOperacaoCambioACCDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioACCNUM_PERIODO_OPERACAO: TIntegerField;
    QOperacaoCambioACCDT_LIMITE: TDateTimeField;
    QOperacaoCambioACCVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioACCVAL_TX_CAMBIO: TFloatField;
    QOperacaoCambioACCPERC_DESAGIO: TFloatField;
    QOperacaoCambioACCCOD_DEPARTAMENTO: TIntegerField;
    QOperacaoCambioACCCons: TOracleDataSet1;
    QOperacaoCambioACCConsCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QOperacaoCambioACCConsNUM_CONTRATO: TStringField;
    QOperacaoCambioACCConsDT_OPERACAO: TDateTimeField;
    QOperacaoCambioACCConsDT_CREDITO: TDateTimeField;
    QOperacaoCambioACCConsDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioACCConsDT_LIMITE: TDateTimeField;
    QOperacaoCambioACCConsVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioACCConsVAL_TX_CAMBIO: TFloatField;
    QOperacaoCambioACCConsPERC_DESAGIO: TFloatField;
    QOperacaoCambioACCLiq: TOracleDataSet1;
    QOperacaoCambioACCLiqCOD_OPERACAO_CAMBIO_ACC_LIQ: TIntegerField;
    QOperacaoCambioACCLiqCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QOperacaoCambioACCLiqCOD_NOTA_CAB: TIntegerField;
    QOperacaoCambioACCLiqDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioACCLiqVAL_JUROS: TFloatField;
    QOperacaoCambioACCLiqVAL_TX_PTAX: TFloatField;
    QOperacaoCambioACCLiqCOD_CONTRATO_VEND: TIntegerField;
    QOperacaoCambioACCLiqDESC_NAVIO: TStringField;
    QOperacaoCambioACCLiqval_total_juros: TFloatField;
    QOperacaoCambioACCLiqVAL_LIQUIDACAO: TFloatField;
    QOperacaoCambioACCVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QOperacaoCambioACCCOD_FILIAL: TIntegerField;
    QOperacaoCambioACCCOD_HISTORICO: TIntegerField;
    QOperacaoCambioPRT: TOracleDataSet1;
    QOperacaoCambioPRTval_total_real: TFloatField;
    QOperacaoCambioPRTCons: TOracleDataSet1;
    QOperacaoCambioPRTConsCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QOperacaoCambioPRTConsNUM_CONTRATO: TStringField;
    QOperacaoCambioPRTConsDT_OPERACAO: TDateTimeField;
    QOperacaoCambioPRTConsDT_CREDITO: TDateTimeField;
    QOperacaoCambioPRTConsVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioPRTConsVAL_TX_CAMBIO: TFloatField;
    QOperacaoCambioACCCOD_CONTA_CORRENTE: TIntegerField;
    QOperacaoCambioACCCOD_USUARIO: TIntegerField;
    QOperacaoCambioTRV: TOracleDataSet1;
    QOperacaoCambioTRVCOD_DEPARTAMENTO: TIntegerField;
    QOperacaoCambioTRVCOD_CONTA_CORRENTE: TIntegerField;
    QOperacaoCambioTRVNUM_CONTRATO: TStringField;
    QOperacaoCambioTRVDT_OPERACAO: TDateTimeField;
    QOperacaoCambioTRVVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioTRVVAL_TX_ATUAL: TFloatField;
    QOperacaoCambioTRVVAL_TX_SWAP: TFloatField;
    QOperacaoCambioTRVVAL_TX_FINAL: TFloatField;
    QOperacaoCambioTRVNUM_PERIODO_OPERACAO: TIntegerField;
    QOperacaoCambioTRVDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioTRVCOD_FILIAL: TIntegerField;
    QOperacaoCambioTRVCOD_HISTORICO: TIntegerField;
    QOperacaoCambioTRVCOD_USUARIO: TIntegerField;
    QOperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    QOperacaoCambioTRVCons: TOracleDataSet1;
    QOperacaoCambioTRVConsCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    QOperacaoCambioTRVConsNUM_CONTRATO: TStringField;
    QOperacaoCambioTRVConsDT_OPERACAO: TDateTimeField;
    QOperacaoCambioTRVConsDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioTRVConsVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioTRVConsVAL_TX_ATUAL: TFloatField;
    QOperacaoCambioTRVConsVAL_TX_SWAP: TFloatField;
    QOperacaoCambioTRVConsVAL_TX_FINAL: TFloatField;
    QOperacaoCambioTRVLiq: TOracleDataSet1;
    QOperacaoCambioTRVLiqCOD_OPERACAO_CAMBIO_TRV_LIQ: TIntegerField;
    QOperacaoCambioTRVLiqCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    QOperacaoCambioTRVLiqCOD_NOTA_CAB: TIntegerField;
    QOperacaoCambioTRVLiqDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioTRVLiqVAL_TX_APLICADA: TFloatField;
    QOperacaoCambioTRVLiqVAL_LIQUIDACAO: TFloatField;
    QOperacaoCambioTRVLiqVAL_PREMIO: TFloatField;
    QOperacaoCambioTRVLiqCOD_CONTRATO_VEND: TIntegerField;
    QOperacaoCambioTRVLiqDESC_NAVIO: TStringField;
    QOperacaoCambioTRVLiqCOD_USUARIO: TIntegerField;
    QROperacaoCambioACC: TOracleDataSet1;
    QROperacaoCambioACCNUM_CONTRATO: TStringField;
    QROperacaoCambioACCDT_OPERACAO: TDateTimeField;
    QROperacaoCambioACCDT_CREDITO: TDateTimeField;
    QROperacaoCambioACCDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioACCDT_LIMITE: TDateTimeField;
    QROperacaoCambioACCVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioACCVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioACCPERC_DESAGIO: TFloatField;
    QROperacaoCambioACCVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperacaoCambioACCDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioACCDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioACCLiq: TOracleDataSet1;
    QROperacaoCambioACCLiqCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QROperacaoCambioACCLiqNUM_CONTRATO: TStringField;
    QROperacaoCambioACCLiqDT_OPERACAO: TDateTimeField;
    QROperacaoCambioACCLiqDT_CREDITO: TDateTimeField;
    QROperacaoCambioACCLiqDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioACCLiqNUM_PERIODO_OPERACAO: TIntegerField;
    QROperacaoCambioACCLiqDT_LIMITE: TDateTimeField;
    QROperacaoCambioACCLiqVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioACCLiqVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioACCLiqPERC_DESAGIO: TFloatField;
    QROperacaoCambioACCLiqCOD_DEPARTAMENTO: TIntegerField;
    QROperacaoCambioACCLiqVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperacaoCambioACCLiqCOD_FILIAL: TIntegerField;
    QROperacaoCambioACCLiqDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioACCLiqDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioACCLiqDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioACCLiqVAL_JUROS: TFloatField;
    QROperacaoCambioACCLiqVAL_TX_PTAX: TFloatField;
    QROperacaoCambioACCLiqCOD_CONTRATO_VEND: TIntegerField;
    QROperacaoCambioACCLiqDESC_NAVIO: TStringField;
    QROperacaoCambioACCLiqVAL_LIQUIDACAO: TFloatField;
    QROperacaoCambioPRT: TOracleDataSet1;
    QROperacaoCambioPRTDT_OPERACAO: TDateTimeField;
    QROperacaoCambioPRTDT_CREDITO: TDateTimeField;
    QROperacaoCambioPRTVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioPRTVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioPRTNUM_CONTRATO: TStringField;
    QROperacaoCambioPRTDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioPRTDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioPRTVAL_OPERACAO_REAL: TFloatField;
    QROperacaoCambioTRV: TOracleDataSet1;
    QROperacaoCambioTRVNUM_CONTRATO: TStringField;
    QROperacaoCambioTRVDT_OPERACAO: TDateTimeField;
    QROperacaoCambioTRVVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioTRVVAL_TX_ATUAL: TFloatField;
    QROperacaoCambioTRVVAL_TX_SWAP: TFloatField;
    QROperacaoCambioTRVVAL_TX_FINAL: TFloatField;
    QROperacaoCambioTRVDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioTRVDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioTRVDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioTRVLiq: TOracleDataSet1;
    QROperacaoCambioTRVLiqCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    QROperacaoCambioTRVLiqNUM_CONTRATO: TStringField;
    QROperacaoCambioTRVLiqDT_OPERACAO: TDateTimeField;
    QROperacaoCambioTRVLiqVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioTRVLiqVAL_TX_ATUAL: TFloatField;
    QROperacaoCambioTRVLiqVAL_TX_SWAP: TFloatField;
    QROperacaoCambioTRVLiqVAL_TX_FINAL: TFloatField;
    QROperacaoCambioTRVLiqDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioTRVLiqCOD_FILIAL: TIntegerField;
    QROperacaoCambioTRVLiqDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioTRVLiqDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioTRVLiqDT_LIQUIDACAO_LIQ: TDateTimeField;
    QROperacaoCambioTRVLiqVAL_TX_APLICADA: TFloatField;
    QROperacaoCambioTRVLiqVAL_LIQUIDACAO: TFloatField;
    QROperacaoCambioTRVLiqVAL_PREMIO: TFloatField;
    QROperacaoCambioACCLiqNUM_RE: TStringField;
    QROperacaoCambioACCLiqNUM_DESPACHO: TStringField;
    QOperacaoCambioACCLiqNUM_RE: TStringField;
    QOperacaoCambioACCLiqNUM_DESPACHO: TStringField;
    QOperacaoCambioTRVLiqNUM_RE: TStringField;
    QOperacaoCambioTRVLiqNUM_DESPACHO: TStringField;
    QROperacaoCambioACCVAL_OPERACAO_REAL: TFloatField;
    QOperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QOperacaoCambioPRTCOD_CONTA_CORRENTE: TIntegerField;
    QOperacaoCambioPRTCOD_DEPARTAMENTO: TIntegerField;
    QOperacaoCambioPRTCOD_FILIAL: TIntegerField;
    QOperacaoCambioPRTDT_OPERACAO: TDateTimeField;
    QOperacaoCambioPRTDT_CREDITO: TDateTimeField;
    QOperacaoCambioPRTVAL_OPERACAO_DOLAR: TFloatField;
    QOperacaoCambioPRTVAL_TX_CAMBIO: TFloatField;
    QOperacaoCambioPRTCOD_USUARIO: TIntegerField;
    QOperacaoCambioPRTLiq: TOracleDataSet1;
    QOperacaoCambioPRTLiqCOD_OPERACAO_CAMBIO_PRT_LIQ: TIntegerField;
    QOperacaoCambioPRTLiqCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QOperacaoCambioPRTLiqCOD_NOTA_CAB: TIntegerField;
    QOperacaoCambioPRTLiqDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioPRTLiqVAL_JUROS: TFloatField;
    QOperacaoCambioPRTLiqVAL_TX_PTAX: TFloatField;
    QOperacaoCambioPRTLiqCOD_CONTRATO_VEND: TIntegerField;
    QOperacaoCambioPRTLiqDESC_NAVIO: TStringField;
    QOperacaoCambioPRTLiqNUM_RE: TStringField;
    QOperacaoCambioPRTLiqNUM_DESPACHO: TStringField;
    QOperacaoCambioPRTLiqVAL_LIQUIDACAO: TFloatField;
    QOperacaoCambioPRTNUM_CONTRATO: TStringField;
    QOperacaoCambioPRTLiqval_total_juros: TFloatField;
    QOperacaoCambioPRTVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QOperacaoCambioPRTCOD_HISTORICO: TIntegerField;
    QROperacaoCambioPRTLiq: TOracleDataSet1;
    QROperacaoCambioPRTLiqCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QROperacaoCambioPRTLiqNUM_CONTRATO: TStringField;
    QROperacaoCambioPRTLiqDT_OPERACAO: TDateTimeField;
    QROperacaoCambioPRTLiqDT_CREDITO: TDateTimeField;
    QROperacaoCambioPRTLiqVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioPRTLiqVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioPRTLiqCOD_DEPARTAMENTO: TIntegerField;
    QROperacaoCambioPRTLiqVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperacaoCambioPRTLiqCOD_FILIAL: TIntegerField;
    QROperacaoCambioPRTLiqDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioPRTLiqDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioPRTLiqDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioPRTLiqVAL_JUROS: TFloatField;
    QROperacaoCambioPRTLiqVAL_TX_PTAX: TFloatField;
    QROperacaoCambioPRTLiqCOD_CONTRATO_VEND: TIntegerField;
    QROperacaoCambioPRTLiqDESC_NAVIO: TStringField;
    QROperacaoCambioPRTLiqNUM_RE: TStringField;
    QROperacaoCambioPRTLiqNUM_DESPACHO: TStringField;
    QROperacaoCambioPRTLiqVAL_LIQUIDACAO: TFloatField;
    QOperCambioACCContrato: TOracleDataSet1;
    QOperCambioACCContratoCOD_OPER_CAMBIO_ACC_CONTRATO: TIntegerField;
    QOperCambioACCContratoCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QOperCambioACCContratoCOD_CONTRATO_VEND: TIntegerField;
    QOperCambioACCContratoVAL_APLICADO: TFloatField;
    QOperCambioACCContratoDT_APLICADO: TDateTimeField;
    QOperCambioPRTContrato: TOracleDataSet1;
    QOperCambioPRTContratoCOD_OPER_CAMBIO_PRT_CONTRATO: TIntegerField;
    QOperCambioPRTContratoCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QOperCambioPRTContratoCOD_CONTRATO_VEND: TIntegerField;
    QOperCambioPRTContratoVAL_APLICADO: TFloatField;
    QOperCambioPRTContratoDT_APLICADO: TDateTimeField;
    QOperCambioTRVContrato: TOracleDataSet1;
    QOperCambioTRVContratoCOD_OPER_CAMBIO_TRV_CONTRATO: TIntegerField;
    QOperCambioTRVContratoCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    QOperCambioTRVContratoCOD_CONTRATO_VEND: TIntegerField;
    QOperCambioTRVContratoVAL_APLICADO: TFloatField;
    QOperCambioTRVContratoDT_APLICADO: TDateTimeField;
    QROperACCAplicadoContratoVenda: TOracleDataSet1;
    QROperACCAplicadoContratoVendaNUM_CONTRATO: TStringField;
    QROperACCAplicadoContratoVendaDT_OPERACAO: TDateTimeField;
    QROperACCAplicadoContratoVendaVAL_OPERACAO_DOLAR: TFloatField;
    QROperACCAplicadoContratoVendaVAL_TX_CAMBIO: TFloatField;
    QROperACCAplicadoContratoVendaVAL_APLICADO: TFloatField;
    QROperACCAplicadoContratoVendaVAL_OPERACAO_REAL: TFloatField;
    QROperACCAplicadoContratoVendaCOD_CONTRATO_VEND: TIntegerField;
    QROperPRTAplicadoContratoVenda: TOracleDataSet1;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    QROperTRVAplicadoContratoVenda: TOracleDataSet1;
    StringField2: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    IntegerField2: TIntegerField;
    QROperTRVAplicadoContratoVendaVAL_TX_ATUAL: TFloatField;
    QROperACCAplicarContratoVenda: TOracleDataSet1;
    QROperACCAplicarContratoVendaNUM_CONTRATO: TStringField;
    QROperACCAplicarContratoVendaDT_OPERACAO: TDateTimeField;
    QROperACCAplicarContratoVendaVAL_OPERACAO_DOLAR: TFloatField;
    QROperACCAplicarContratoVendaVAL_TX_CAMBIO: TFloatField;
    QROperACCAplicarContratoVendaVAL_OPERACAO_REAL: TFloatField;
    QROperACCAplicarContratoVendaVAL_SALDO: TFloatField;
    QROperPRTAplicarContratoVenda: TOracleDataSet1;
    StringField3: TStringField;
    DateTimeField3: TDateTimeField;
    FloatField5: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    QROperTRVAplicarContratoVenda: TOracleDataSet1;
    StringField4: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField12: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    QROperTRVAplicarContratoVendaVAL_TX_ATUAL: TFloatField;
    QVariacaoCambioOperacaoCambialACC: TOracleDataSet1;
    QVariacaoCambioOperacaoCambialACCVAL_TX_CAMBIO: TFloatField;
    QVariacaoCambioOperacaoCambialACCVAL_TX_PTAX: TFloatField;
    QVariacaoCambioOperacaoCambialACCVAL_LIQUIDACAO: TFloatField;
    QVariacaoCambioOperacaoCambialACCVAL_VARIACAO_CAMBIAL: TFloatField;
    QOperCambioACCContratoval_aplicado_dolar: TFloatField;
    QROperACCAplicadoContratoVendaVAL_APLICADO_DOLAR: TFloatField;
    QOperCambioPRTContratoval_aplicado_dolar: TFloatField;
    QOperCambioTRVContratoval_aplicado_dolar: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_APLICADO_DOLAR: TFloatField;
    QROperTRVAplicadoContratoVendaVAL_APLICADO_DOLAR: TFloatField;
    QROperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC: TFloatField;
    QROperacaoCambioACCNUM_PERIODO_OPERACAO: TFloatField;
    QROperacaoCambioACCCOD_DEPARTAMENTO: TFloatField;
    QROperacaoCambioACCCOD_FILIAL: TFloatField;
    QROperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT: TFloatField;
    QROperacaoCambioPRTCOD_FILIAL: TFloatField;
    QROperacaoCambioPRTVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV: TFloatField;
    QROperacaoCambioTRVCOD_FILIAL: TFloatField;
    QROperacaoCambioTRVVAL_OPERACAO_REAL: TFloatField;
    QROperacaoCambioTRVVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperACCAplicadoContratoVendaCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QROperACCAplicadoContratoVendaDT_CREDITO: TDateTimeField;
    QROperACCAplicadoContratoVendaDT_VENCIMENTO: TDateTimeField;
    QROperACCAplicadoContratoVendaNUM_PERIODO_OPERACAO: TIntegerField;
    QROperACCAplicadoContratoVendaDT_LIMITE: TDateTimeField;
    QROperACCAplicadoContratoVendaPERC_DESAGIO: TFloatField;
    QROperACCAplicadoContratoVendaCOD_FILIAL: TIntegerField;
    QROperACCAplicadoContratoVendaDESC_DEPARTAMENTO: TStringField;
    QROperACCAplicadoContratoVendaDESC_CONTA_CORRENTE: TStringField;
    QROperPRTAplicadoContratoVendaCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QROperPRTAplicadoContratoVendaDT_CREDITO: TDateTimeField;
    QROperPRTAplicadoContratoVendaCOD_DEPARTAMENTO: TIntegerField;
    QROperPRTAplicadoContratoVendaVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperPRTAplicadoContratoVendaCOD_FILIAL: TIntegerField;
    QROperPRTAplicadoContratoVendaDESC_DEPARTAMENTO: TStringField;
    QROperPRTAplicadoContratoVendaDESC_CONTA_CORRENTE: TStringField;
    QROperPRTAplicadoContratoVendaVAL_OPERACAO_DOLAR: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_APLICADO: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_OPERACAO_REAL: TFloatField;
    QROperACCAplicarContratoVendaVAL_SALDO_DOLAR: TFloatField;
    QROperTRVAplicarContratoVendaVAL_SALDO_DOLAR: TFloatField;
    QOperCambioACCContratonum_contrato: TIntegerField;
    OPOperacaoCambio: TOraclePackage;
    QContabilizacaoVariacaoCambialACC: TOracleDataSet1;
    QContabilizacaoVariacaoCambialACCDT_VARIACAO_CAMBIAL_ACC: TDateTimeField;
    QContabilizacaoVariacaoCambialACCVAL_DIF_DOLAR: TFloatField;
    QContabilizacaoVariacaoCambialACCVAL_VARIACAO_CAMBIAL_ACC: TFloatField;
    QContabilizacaoVariacaoCambialACCDT_VARIACAO_CAMBIAL_ACC_INICIO: TDateTimeField;
    QRVariacaoCambialACC: TOracleDataSet1;
    QRVariacaoCambialACCNUM_CONTRATO: TStringField;
    QRVariacaoCambialACCDT_VARIACAO_CAMBIAL_ACC_INICIO: TDateTimeField;
    QRVariacaoCambialACCDT_VARIACAO_CAMBIAL_ACC: TDateTimeField;
    QRVariacaoCambialACCVLR_COTACAO_INICIO: TFloatField;
    QRVariacaoCambialACCVLR_COTACAO_FIM: TFloatField;
    QRVariacaoCambialACCVAL_DIF_DOLAR: TFloatField;
    QRVariacaoCambialACCVAL_VARIACAO_CAMBIAL_ACC: TFloatField;
    QOperacaoCambioACCLiqCOD_HISTORICO: TIntegerField;
    QOperacaoCambioACCLiqCONTA_CREDITO_VC_ACC: TStringField;
    QOperacaoCambioACCLiqCONTA_DEBITO_VC_ACC: TStringField;
    QOperacaoCambioACCIND_GARANTIA: TStringField;
    QOperacaoCambioACCQT_QUILOS_PENHOR: TIntegerField;
    QOperacaoCambioACCCOD_FILIAL_PENHOR: TIntegerField;
    QOperacaoCambioACCCOD_PRODUTO_PENHOR: TIntegerField;
    QOperacaoCambioACCVAL_SEGURO_PENHOR: TFloatField;
    QOperacaoCambioACCVAL_REGISTRO_PENHOR: TFloatField;
    QOperacaoCambioACCVAL_CUSTO_PENHOR: TFloatField;
    QOperacaoCambioACCVAL_CUSTO_BAIXA_PENHOR: TFloatField;
    QOperacaoCambioACCDT_BAIXA_PENHOR: TDateTimeField;
    QOperacaoCambioSWP: TOracleDataSet1;
    QOperacaoCambioSWPLiq: TOracleDataSet1;
    QOperacaoCambioSWPCons: TOracleDataSet1;
    QROperacaoCambioSWP: TOracleDataSet1;
    QOperacaoCambioEPT: TOracleDataSet1;
    QOperacaoCambioEPTCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QOperacaoCambioEPTIND_MOEDA_EMPRESTIMO: TStringField;
    QOperacaoCambioEPTNUM_CONTRATO: TStringField;
    QOperacaoCambioEPTCOD_CONTA_CORRENTE: TIntegerField;
    QOperacaoCambioEPTCOD_HISTORICO: TIntegerField;
    QOperacaoCambioEPTDT_OPERACAO: TDateTimeField;
    QOperacaoCambioEPTDT_CREDITO: TDateTimeField;
    QOperacaoCambioEPTVAL_OPERACAO: TFloatField;
    QOperacaoCambioEPTVAL_TX_CAMBIO: TFloatField;
    QOperacaoCambioEPTNUM_PERIODO_OPERACAO: TIntegerField;
    QOperacaoCambioEPTDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioEPTVAL_TX_JUROS: TFloatField;
    QOperacaoCambioEPTVAL_TX_FINAL_TRAVADA: TFloatField;
    QOperacaoCambioEPTCOD_FILIAL: TIntegerField;
    QOperacaoCambioEPTCOD_DEPARTAMENTO: TIntegerField;
    QOperacaoCambioEPTCOD_CONTA_CRED: TIntegerField;
    QOperacaoCambioEPTCOD_CONTA_DEB: TIntegerField;
    QOperacaoCambioEPTIND_GARANTIA: TStringField;
    QOperacaoCambioEPTCOD_FILIAL_PENHOR: TIntegerField;
    QOperacaoCambioEPTCOD_PRODUTO_PENHOR: TIntegerField;
    QOperacaoCambioEPTVAL_SEGURO_PENHOR: TFloatField;
    QOperacaoCambioEPTVAL_REGISTRO_PENHOR: TFloatField;
    QOperacaoCambioEPTVAL_CUSTO_BAIXA_PENHOR: TFloatField;
    QOperacaoCambioEPTDT_BAIXA_PENHOR: TDateTimeField;
    QOperacaoCambioEPTCOD_BCO_MOVIMENTO: TIntegerField;
    QOperacaoCambioEPTval_operacao_reais: TFloatField;
    QOperacaoCambioEPTIND_TIPO_TX_JUROS: TStringField;
    QOperacaoCambioEPTCons: TOracleDataSet1;
    QOperacaoCambioEPTConsCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QOperacaoCambioEPTConsNUM_CONTRATO: TStringField;
    QOperacaoCambioEPTConsDT_OPERACAO: TDateTimeField;
    QOperacaoCambioEPTConsDT_CREDITO: TDateTimeField;
    QOperacaoCambioEPTConsDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioEPTConsVAL_OPERACAO: TFloatField;
    QOperacaoCambioEPTConsVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioEPT: TOracleDataSet1;
    QContabilizacaoVariacaoCambialSWP: TOracleDataSet1;
    QContabilizacaoVariacaoCambialSWPDT_VARIACAO_CAMBIAL_SWP_INICIO: TDateTimeField;
    QContabilizacaoVariacaoCambialSWPDT_VARIACAO_CAMBIAL_SWP: TDateTimeField;
    QContabilizacaoVariacaoCambialSWPVAL_DIF_DOLAR: TFloatField;
    QContabilizacaoVariacaoCambialSWPVAL_VARIACAO_CAMBIAL_SWP: TFloatField;
    QContabilizacaoVariacaoCambialEPT: TOracleDataSet1;
    QContabilizacaoVariacaoCambialEPTDT_VARIACAO_CAMBIAL_EPT_INICIO: TDateTimeField;
    QContabilizacaoVariacaoCambialEPTDT_VARIACAO_CAMBIAL_EPT: TDateTimeField;
    QContabilizacaoVariacaoCambialEPTVAL_DIF_DOLAR: TFloatField;
    QContabilizacaoVariacaoCambialEPTVAL_VARIACAO_CAMBIAL_EPT: TFloatField;
    QOperacaoCambioEPTLiq: TOracleDataSet1;
    QOperacaoCambioEPTLiqCOD_OPERACAO_CAMBIO_EPT_LIQ: TIntegerField;
    QOperacaoCambioEPTLiqCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QOperacaoCambioEPTLiqDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioEPTLiqVAL_LIQUIDACAO: TFloatField;
    QOperacaoCambioEPTLiqVAL_JURO: TFloatField;
    QOperacaoCambioEPTLiqCOD_USUARIO: TIntegerField;
    QOperacaoCambioEPTLiqCOD_BCO_MOVIMENTO: TIntegerField;
    QOperacaoCambioEPTLiqCOD_HISTORICO: TIntegerField;
    QOperacaoCambioEPTVAL_ATUAL_TITULO: TFloatField;
    QROperacaoCambioEPTCOD_OPERACAO_CAMBIO_EPT: TFloatField;
    QROperacaoCambioEPTNUM_CONTRATO: TStringField;
    QROperacaoCambioEPTDT_OPERACAO: TDateTimeField;
    QROperacaoCambioEPTDT_CREDITO: TDateTimeField;
    QROperacaoCambioEPTDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioEPTNUM_PERIODO_OPERACAO: TFloatField;
    QROperacaoCambioEPTVAL_OPERACAO: TFloatField;
    QROperacaoCambioEPTVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioEPTVAL_TX_JUROS: TFloatField;
    QROperacaoCambioEPTCOD_DEPARTAMENTO: TFloatField;
    QROperacaoCambioEPTVAL_ATUAL_TITULO: TFloatField;
    QROperacaoCambioEPTCOD_FILIAL: TFloatField;
    QROperacaoCambioEPTDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioEPTDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioEPTVAL_OPERACAO_REAL: TFloatField;
    QOperacaoCambioEPTLiqVAL_TAXA_LIQ: TFloatField;
    QOperacaoCambioEPTLiqVAL_LIQUIDACAO_REAIS: TFloatField;
    QOperacaoCambioEPTLiqVAL_JUROS_REAIS: TFloatField;
    QROperacaoCambioEPTLiq: TOracleDataSet1;
    QROperacaoCambioEPTLiqCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QROperacaoCambioEPTLiqNUM_CONTRATO: TStringField;
    QROperacaoCambioEPTLiqDT_OPERACAO: TDateTimeField;
    QROperacaoCambioEPTLiqDT_CREDITO: TDateTimeField;
    QROperacaoCambioEPTLiqDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioEPTLiqNUM_PERIODO_OPERACAO: TIntegerField;
    QROperacaoCambioEPTLiqVAL_OPERACAO: TFloatField;
    QROperacaoCambioEPTLiqVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioEPTLiqCOD_DEPARTAMENTO: TIntegerField;
    QROperacaoCambioEPTLiqVAL_ATUAL_TITULO: TFloatField;
    QROperacaoCambioEPTLiqCOD_FILIAL: TIntegerField;
    QROperacaoCambioEPTLiqDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioEPTLiqDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioEPTLiqDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioEPTLiqVAL_JURO: TFloatField;
    QROperacaoCambioEPTLiqVAL_LIQUIDACAO: TFloatField;
    QROperacaoCambioEPTLiqVAL_TAXA_LIQ: TFloatField;
    QROperacaoCambioEPTLiqVAL_LIQUIDACAO_REAIS: TFloatField;
    QRVariacaoCambialEPT: TOracleDataSet1;
    QRVariacaoCambialEPTNUM_CONTRATO: TStringField;
    QRVariacaoCambialEPTDT_VARIACAO_CAMBIAL_EPT_INICIO: TDateTimeField;
    QRVariacaoCambialEPTDT_VARIACAO_CAMBIAL_EPT: TDateTimeField;
    QRVariacaoCambialEPTVLR_COTACAO_INICIO: TFloatField;
    QRVariacaoCambialEPTVLR_COTACAO_FIM: TFloatField;
    QRVariacaoCambialEPTVAL_DIF_DOLAR: TFloatField;
    QRVariacaoCambialEPTVAL_VARIACAO_CAMBIAL_EPT: TFloatField;
    QROperacaoCambioSWPLiq: TOracleDataSet1;
    QROperacaoCambioSWPLiqCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QROperacaoCambioSWPLiqNUM_CONTRATO: TStringField;
    QROperacaoCambioSWPLiqDT_OPERACAO: TDateTimeField;
    QROperacaoCambioSWPLiqDT_CREDITO: TDateTimeField;
    QROperacaoCambioSWPLiqDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioSWPLiqNUM_PERIODO_OPERACAO: TIntegerField;
    QROperacaoCambioSWPLiqVAL_OPERACAO_DOLAR: TFloatField;
    QROperacaoCambioSWPLiqVAL_TX_CAMBIO: TFloatField;
    QROperacaoCambioSWPLiqVAL_TX_JUROS: TFloatField;
    QROperacaoCambioSWPLiqCOD_DEPARTAMENTO: TIntegerField;
    QROperacaoCambioSWPLiqVAL_ATUAL_TITULO_DOLAR: TFloatField;
    QROperacaoCambioSWPLiqCOD_FILIAL: TIntegerField;
    QROperacaoCambioSWPLiqDESC_DEPARTAMENTO: TStringField;
    QROperacaoCambioSWPLiqDESC_CONTA_CORRENTE: TStringField;
    QROperacaoCambioSWPLiqDT_LIQUIDACAO: TDateTimeField;
    QROperacaoCambioSWPLiqVAL_LIQUIDACAO: TFloatField;
    QROperacaoCambioSWPLiqVAL_JURO_DOLAR: TFloatField;
    QROperacaoCambioSWPLiqVAL_TX_JURO: TFloatField;
    QROperacaoCambioSWPLiqVAL_TX_CAMBIO_LIQ: TFloatField;
    QROperacaoCambioSWPLiqVAL_TXT_CAMBIO_LIQUIDADO: TFloatField;
    QOperacaoCambioEPTCOD_USUARIO: TIntegerField;
    QOperacaoCambioEPTQT_QUILOS_PENHOR: TFloatField;
    QOperCambioACCContratoVAL_TAXA_CAMBIO: TFloatField;
    QOperCambioACCContratoval_aplicado_reais: TFloatField;
    QROperACCAplicadoContratoVendaCOD_DEPARTAMENTO: TIntegerField;
    QROperACCAplicadoContratoVendaVAL_APLICADO_REAL: TFloatField;
    QROperACCAplicadoContratoVendaVAL_TAXA_CAMBIO_APLICADO: TFloatField;
    QROperACCAplicadoContratoVendaVAL_APLICADO_REAL_TX_ORIG: TFloatField;
    QROperACCAplicadoContratoVendaVAL_APLICADO_REAL_DIF: TFloatField;
    QOperCambioPRTContratoVAL_TAXA_CAMBIO: TFloatField;
    QOperCambioTRVContratoVAL_TAXA_CAMBIO: TFloatField;
    QOperCambioPRTContratoval_aplicado_reais: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_TAXA_CAMBIO: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_APLICADO_REAL: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_APLICADO_REAL_TX_ORIG: TFloatField;
    QROperPRTAplicadoContratoVendaVAL_APLICADO_REAL_DIF: TFloatField;
    QROperTRVAplicadoContratoVendaVAL_TAXA_CAMBIO: TFloatField;
    QOperacaoCambioACCCOD_CADASTRO: TIntegerField;
    QROperacaoCambioACCNOME: TStringField;
    QROperacaoCambioACCval_atual_titulo_dolar_moinho: TFloatField;
    QROperacaoCambioACCval_operacao_real_moinho: TFloatField;
    QROperacaoCambioACCval_atual_titulo_dolar_outros: TFloatField;
    QROperacaoCambioACCval_operacao_real_outros: TFloatField;
    QROperACCAplicadoContratoVendaNUM_CONTRATO_VENDA_CV: TIntegerField;
    QROperPRTAplicadoContratoVendaNUM_CONTRATO_VENDA_CV: TIntegerField;
    QROperTRVAplicadoContratoVendaNUM_CONTRATO_VENDA_CV: TIntegerField;
    QOperacaoCambioSWPCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QOperacaoCambioSWPNUM_CONTRATO: TStringField;
    QOperacaoCambioSWPIND_TIPO_OPERACAO: TStringField;
    QOperacaoCambioSWPCOD_DEPARTAMENTO: TIntegerField;
    QOperacaoCambioSWPCOD_FILIAL: TIntegerField;
    QOperacaoCambioSWPDT_OPERACAO: TDateTimeField;
    QOperacaoCambioSWPNUM_PERIODO_OPERACAO: TIntegerField;
    QOperacaoCambioSWPDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioSWPVAL_OPERACAO: TFloatField;
    QOperacaoCambioSWPVAL_TX_SPOT: TFloatField;
    QOperacaoCambioSWPVAL_TX_CAMBIO_FUTURO: TFloatField;
    QOperacaoCambioSWPIND_GARANTIA: TStringField;
    QOperacaoCambioSWPCOD_FILIAL_PENHOR: TIntegerField;
    QOperacaoCambioSWPCOD_PRODUTO_PENHOR: TIntegerField;
    QOperacaoCambioSWPQT_QUILOS_PENHOR: TFloatField;
    QOperacaoCambioSWPVAL_SEGURO_PENHOR: TFloatField;
    QOperacaoCambioSWPVAL_REGISTRO_PENHOR: TFloatField;
    QOperacaoCambioSWPVAL_CUSTO_BAIXA_PENHOR: TFloatField;
    QOperacaoCambioSWPDT_BAIXA_PENHOR: TDateTimeField;
    QOperacaoCambioSWPCOD_USUARIO: TIntegerField;
    QOperacaoCambioSWPLiqCOD_OPERACAO_CAMBIO_SWP_LIQ: TIntegerField;
    QOperacaoCambioSWPLiqCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QOperacaoCambioSWPLiqDT_LIQUIDACAO: TDateTimeField;
    QOperacaoCambioSWPLiqVAL_TX_LIQUIDACAO: TFloatField;
    QOperacaoCambioSWPLiqVAL_IR: TFloatField;
    QOperacaoCambioSWPLiqVAL_AJUSTE_BRUTO: TFloatField;
    QOperacaoCambioSWPLiqCOD_HISTORICO: TIntegerField;
    QOperacaoCambioSWPVAL_ATUAL: TFloatField;
    QOperacaoCambioSWPConsCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QOperacaoCambioSWPConsNUM_CONTRATO: TStringField;
    QOperacaoCambioSWPConsDT_OPERACAO: TDateTimeField;
    QOperacaoCambioSWPConsDT_VENCIMENTO: TDateTimeField;
    QOperacaoCambioSWPConsVAL_OPERACAO: TFloatField;
    QOperacaoCambioSWPConsVAL_TX_SPOT: TFloatField;
    QOperacaoCambioSWPConsVAL_TX_CAMBIO_FUTURO: TFloatField;
    QOperacaoCambioSWPLiqval_ajuste_liquido: TFloatField;
    QOperacaoCambioSWPLiqVAL_LIQUIDACAO: TFloatField;
    QOperacaoCambioSWPLiqCOD_USUARIO: TIntegerField;
    QOperacaoCambioSWPLiqCOD_CONTA_CRED: TIntegerField;
    QOperacaoCambioSWPLiqCOD_CONTA_DEB: TIntegerField;
    QOperacaoCambioSWPLiqCOD_BCO_MOVIMENTO: TIntegerField;
    QROperacaoCambioSWPCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QROperacaoCambioSWPNUM_CONTRATO: TStringField;
    QROperacaoCambioSWPDT_OPERACAO: TDateTimeField;
    QROperacaoCambioSWPDT_VENCIMENTO: TDateTimeField;
    QROperacaoCambioSWPNUM_PERIODO_OPERACAO: TIntegerField;
    QROperacaoCambioSWPVAL_OPERACAO: TFloatField;
    QROperacaoCambioSWPVAL_TX_SPOT: TFloatField;
    QROperacaoCambioSWPVAL_TX_CAMBIO_FUTURO: TFloatField;
    QROperacaoCambioSWPCOD_DEPARTAMENTO: TIntegerField;
    QROperacaoCambioSWPVAL_ATUAL: TFloatField;
    QROperacaoCambioSWPCOD_FILIAL: TIntegerField;
    QROperacaoCambioSWPDESC_DEPARTAMENTO: TStringField;
    QOperacaoCambioEpt_Ren: TOracleDataSet1;
    QOperacaoCambioEpt_RenCOD_OPERACAO_CAMBIO_EPT_REN: TIntegerField;
    QOperacaoCambioEpt_RenCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QOperacaoCambioEpt_RenDT_LANCAMENTO: TDateTimeField;
    QOperacaoCambioEpt_RenCOD_HISTORICO: TIntegerField;
    QOperacaoCambioEpt_RenVAL_JUROS: TFloatField;
    QOperacaoCambioEpt_RenVAL_VARIACAO: TFloatField;
    QOperacaoCambioEpt_RenCOD_USUARIO: TIntegerField;
    QOperacaoCambioACCCOD_CONTA_CORRENTE_CREDITO: TIntegerField;
    QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP: TFloatField;
    QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP_REAIS: TFloatField;
    QOperacaoCambioEPTLiqCOD_HISTORICO_SWAP: TIntegerField;
    QOperacaoCambioEPTLiqCOD_BCO_MOVIMENTO_JURO: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_CRED: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_DEB: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_CRED_JURO: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_DEB_JURO: TIntegerField;
    QOperacaoCambioEPTLiqCONTA_CREDITO_VC_EPT: TStringField;
    QOperacaoCambioEPTLiqCONTA_DEBITO_VC_EPT: TStringField;
    QOperacaoCambioEPTLiqCOD_VARIACAO_CAMBIAL_EPT: TIntegerField;
    QOperacaoCambioEPTLiqCOD_BCO_MOVIMENTO_SWAP: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_DEB_SWAP: TIntegerField;
    QOperacaoCambioEPTLiqCOD_CONTA_CRED_SWAP: TIntegerField;
    QOperacaoCambioSWPDESC_OBSERVACAO: TStringField;
    QOperacaoCambioSWPCOD_CONTA_CORRENTE: TIntegerField;
    QROperacaoCambioSWPDESC_OBSERVACAO: TStringField;
    QOperacaoCambioSWPLiqCOD_HISTORICO_IR: TIntegerField;
    QOperacaoCambioSWPLiqCOD_CONTA_CRED_IR: TIntegerField;
    QOperacaoCambioSWPLiqCOD_CONTA_DEB_IR: TIntegerField;
    QROperPRTAplicarContratoVendaCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QROperACCAplicarContratoVendaCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QROperTRVAplicarContratoVendaCOD_OPERACAO_CAMBIO_TRV: TIntegerField;
    procedure QOperacaoCambioACCLiqCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioACCAfterPost(DataSet: TDataSet);
    procedure QOperacaoCambioPRTCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioACCAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioPRTAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioTRVAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioTRVLiqAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioPRTLiqCalcFields(DataSet: TDataSet);
    procedure QOperCambioACCContratoBeforePost(DataSet: TDataSet);
    procedure QOperCambioACCContratoAfterInsert(DataSet: TDataSet);
    procedure QOperCambioPRTContratoAfterInsert(DataSet: TDataSet);
    procedure QOperCambioPRTContratoBeforePost(DataSet: TDataSet);
    procedure QOperCambioTRVContratoAfterInsert(DataSet: TDataSet);
    procedure QOperCambioTRVContratoBeforePost(DataSet: TDataSet);
    procedure QOperCambioACCContratoCalcFields(DataSet: TDataSet);
    procedure QOperCambioPRTContratoCalcFields(DataSet: TDataSet);
    procedure QOperCambioTRVContratoCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioSWPLiqCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioSWPAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioEPTAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioEPTCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioEPTLiqAfterInsert(DataSet: TDataSet);
    procedure QROperacaoCambioACCCalcFields(DataSet: TDataSet);
    procedure QOperacaoCambioSWPAfterPost(DataSet: TDataSet);
    procedure QOperacaoCambioSWPLiqAfterInsert(DataSet: TDataSet);
    procedure QOperacaoCambioSWPLiqAfterPost(DataSet: TDataSet);
    procedure QOperacaoCambioSWPLiqAfterDelete(DataSet: TDataSet);
    procedure QOperacaoCambioEpt_RenBeforePost(DataSet: TDataSet);
    procedure QOperacaoCambioEpt_RenAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOperacaoCambio: TDMOperacaoCambio;

implementation

uses UOracle_cl, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMOperacaoCambio.QOperacaoCambioACCLiqCalcFields(
  DataSet: TDataSet);
begin
  DMOperacaoCambio.QOperacaoCambioACCLiqval_total_juros.Value :=
    DMOperacaoCambio.QOperacaoCambioACCLiqVAL_JUROS.Value *
      DMOperacaoCambio.QOperacaoCambioACCLiqVAL_TX_PTAX.Value;
end;

procedure TDMOperacaoCambio.QOperacaoCambioACCAfterPost(DataSet: TDataSet);
begin
  QOperacaoCambioACC.RefreshRecord;
end;

procedure TDMOperacaoCambio.QOperacaoCambioPRTCalcFields(
  DataSet: TDataSet);
begin
  QOperacaoCambioPRTval_total_real.Value :=
    QOperacaoCambioPRTVAL_OPERACAO_DOLAR.Value *
      QOperacaoCambioPRTVAL_TX_CAMBIO.Value;
end;

procedure TDMOperacaoCambio.QOperacaoCambioACCAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioACCCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOperacaoCambio.QOperacaoCambioPRTAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioPRTCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOperacaoCambio.QOperacaoCambioTRVAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioTRVCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOperacaoCambio.QOperacaoCambioTRVLiqAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioTRVLiqCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOperacaoCambio.QOperacaoCambioPRTLiqCalcFields(
  DataSet: TDataSet);
begin
  DMOperacaoCambio.QOperacaoCambioPRTLiqval_total_juros.Value :=
    DMOperacaoCambio.QOperacaoCambioPRTLiqVAL_JUROS.Value *
      DMOperacaoCambio.QOperacaoCambioPRTLiqVAL_TX_PTAX.Value;
end;

procedure TDMOperacaoCambio.QOperCambioACCContratoBeforePost(
  DataSet: TDataSet);
var wVal : string;
begin
  if DataSet.State = dsInsert then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_ACC_CONTRATO','COD_OPERACAO_CAMBIO_ACC = ' + QOperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC.Text);
    if (StrToFloat(wVal) + strtofloat(floattostr(QOperCambioACCContratoVAL_APLICADO.Value))) >
       (QOperacaoCambioACCVAL_OPERACAO_DOLAR.Value {* QOperacaoCambioACCVAL_TX_CAMBIO.Value--->foi removido, pois agora o valor informado na baixa é o valor em dolares 11/11/05}) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if DataSet.State = dsEdit then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_ACC_CONTRATO','COD_OPERACAO_CAMBIO_ACC = ' + QOperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC.Text);
    if (StrToFloat(wVal) + QOperCambioACCContratoVAL_APLICADO.Value - QOperCambioACCContratoVAL_APLICADO.OldValue) >
       (QOperacaoCambioACCVAL_OPERACAO_DOLAR.Value * QOperacaoCambioACCVAL_TX_CAMBIO.Value) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if QOperCambioACCContratoVAL_APLICADO.Value <= 0 then
    raise Exception.Create('O valor a aplicar deve ser maior que zero.');
end;

procedure TDMOperacaoCambio.QOperCambioACCContratoAfterInsert(
  DataSet: TDataSet);
var wVal : string;
begin
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_ACC_CONTRATO','COD_OPERACAO_CAMBIO_ACC = ' + QOperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC.Text);
  QOperCambioACCContratoVAL_APLICADO.Value := QOperacaoCambioACCVAL_OPERACAO_DOLAR.Value - StrToFloat(wval);
  QOperCambioACCContratoDT_APLICADO.Value := date;

  if QOperCambioACCContratoVAL_APLICADO.Value = 0 then
  begin
    QOperCambioACCContrato.cancel;
    raise Exception.Create('Operação de Câmbio sem saldo para aplicar.');
  end;
end;

procedure TDMOperacaoCambio.QOperCambioPRTContratoAfterInsert(
  DataSet: TDataSet);
var wVal : string;
begin
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_PRT_CONTRATO','COD_OPERACAO_CAMBIO_PRT = ' + QOperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT.Text);
  QOperCambioPRTContratoVAL_APLICADO.Value := QOperacaoCambioPRTVAL_OPERACAO_DOLAR.Value - StrToFloat(wval);
  QOperCambioPRTContratoDT_APLICADO.Value := date;

  if QOperCambioPRTContratoVAL_APLICADO.Value = 0 then
  begin
    QOperCambioPRTContrato.cancel;
    raise Exception.Create('Operação de Câmbio sem saldo para aplicar.');
  end;
end;


procedure TDMOperacaoCambio.QOperCambioPRTContratoBeforePost(
  DataSet: TDataSet);
var wVal : string;
begin
  if DataSet.State = dsInsert then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_PRT_CONTRATO','COD_OPERACAO_CAMBIO_PRT = ' + QOperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT.Text);
    if (StrToFloat(wVal) + QOperCambioPRTContratoVAL_APLICADO.Value) >
       (QOperacaoCambioPRTVAL_OPERACAO_DOLAR.Value * QOperacaoCambioPRTVAL_TX_CAMBIO.Value) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if DataSet.State = dsEdit then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_PRT_CONTRATO','COD_OPERACAO_CAMBIO_PRT = ' + QOperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT.Text);
    if (StrToFloat(wVal) + QOperCambioPRTContratoVAL_APLICADO.Value - QOperCambioPRTContratoVAL_APLICADO.OldValue) >
       (QOperacaoCambioPRTVAL_OPERACAO_DOLAR.Value * QOperacaoCambioPRTVAL_TX_CAMBIO.Value) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if QOperCambioPRTContratoVAL_APLICADO.Value <= 0 then
    raise Exception.Create('O valor a aplicar deve ser maior que zero.');
end;

procedure TDMOperacaoCambio.QOperCambioTRVContratoAfterInsert(
  DataSet: TDataSet);
var wVal : string;
begin
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_TRV_CONTRATO','COD_OPERACAO_CAMBIO_TRV = ' + QOperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV.Text);
  QOperCambioTRVContratoVAL_APLICADO.Value := QOperacaoCambioTRVVAL_OPERACAO_DOLAR.Value - StrToFloat(wval);
  QOperCambioTRVContratoDT_APLICADO.Value := date;

  if QOperCambioTRVContratoVAL_APLICADO.Value = 0 then
  begin
    QOperCambioTRVContrato.cancel;
    raise Exception.Create('Operação de Câmbio sem saldo para aplicar.');
  end;
end;

procedure TDMOperacaoCambio.QOperCambioTRVContratoBeforePost(
  DataSet: TDataSet);
var wVal : string;
begin
  if DataSet.State = dsInsert then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_TRV_CONTRATO','COD_OPERACAO_CAMBIO_TRV = ' + QOperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV.Text);
    if (StrToFloat(wVal) + QOperCambioTRVContratoVAL_APLICADO.Value) >
       (QOperacaoCambioTRVVAL_OPERACAO_DOLAR.Value * QOperacaoCambioTRVVAL_TX_ATUAL.Value) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if DataSet.State = dsEdit then
  begin
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_TRV_CONTRATO','COD_OPERACAO_CAMBIO_TRV = ' + QOperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV.Text);
    if (StrToFloat(wVal) + QOperCambioTRVContratoVAL_APLICADO.Value - QOperCambioTRVContratoVAL_APLICADO.OldValue) >
       (QOperacaoCambioTRVVAL_OPERACAO_DOLAR.Value * QOperacaoCambioTRVVAL_TX_ATUAL.Value) then
      raise Exception.Create('O valor informado é maior que o saldo.');
  end;

  if QOperCambioTRVContratoVAL_APLICADO.Value <= 0 then
    raise Exception.Create('O valor a aplicar deve ser maior que zero.');
end;

procedure TDMOperacaoCambio.QOperCambioACCContratoCalcFields(
  DataSet: TDataSet);
begin
//  QOperCambioACCContratoval_aplicado_dolar.Value :=
  //  QOperCambioACCContratoval_aplicado.Value / QOperacaoCambioACCVAL_TX_CAMBIO.Value;

  QOperCambioACCContratoval_aplicado_reais.Value := QOperCambioACCContratoVAL_APLICADO.Value * QOperCambioACCContratoVAL_TAXA_CAMBIO.Value; 

  if not QOperCambioACCContratoCOD_CONTRATO_VEND.IsNull then
    QOperCambioACCContratonum_contrato.Text :=
      DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = ' +
        QOperCambioACCContratoCOD_CONTRATO_VEND.Text)
  else
    QOperCambioACCContratonum_contrato.text := '';
end;

procedure TDMOperacaoCambio.QOperCambioPRTContratoCalcFields(
  DataSet: TDataSet);
begin
//  QOperCambioPRTContratoval_aplicado_dolar.Value :=
//    QOperCambioPRTContratoval_aplicado.Value / QOperacaoCambioPRTVAL_TX_CAMBIO.Value;

  QOperCambioPRTContratoval_aplicado_reais.Value := QOperCambioPRTContratoVAL_APLICADO.Value * QOperCambioPRTContratoVAL_TAXA_CAMBIO.Value;
end;

procedure TDMOperacaoCambio.QOperCambioTRVContratoCalcFields(
  DataSet: TDataSet);
begin
  QOperCambioTRVContratoval_aplicado_dolar.Value :=
    QOperCambioTRVContratoVAL_APLICADO.Value / QOperacaoCambioTRVVAL_TX_ATUAL.Value;
end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPLiqCalcFields(
  DataSet: TDataSet);
begin
//  QOperacaoCambioSWPLiqval_juro_reais.Value :=
//    QOperacaoCambioSWPLiqVAL_JURO_DOLAR.Value * QOperacaoCambioSWPLiqVAL_TX_CAMBIO.Value;

  if (QOperacaoCambioSWPLiqVAL_AJUSTE_BRUTO.Text <> '') and (QOperacaoCambioSWPLiqVAL_IR.Text <> '') then
    QOperacaoCambioSWPLiqval_ajuste_liquido.Value := QOperacaoCambioSWPLiqVAL_AJUSTE_BRUTO.Value - QOperacaoCambioSWPLiqVAL_IR.Value
  else
    QOperacaoCambioSWPLiqval_ajuste_liquido.Text := '';

end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioSWPCOD_FILIAL.Value := 1;  
end;

procedure TDMOperacaoCambio.QOperacaoCambioEPTAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioEPTCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QOperacaoCambioEPTCOD_FILIAL.Value := 1;
  QOperacaoCambioEPTIND_MOEDA_EMPRESTIMO.Value := 'R';
  QOperacaoCambioEPTIND_TIPO_TX_JUROS.Value := 'AA';
end;

procedure TDMOperacaoCambio.QOperacaoCambioEPTCalcFields(
  DataSet: TDataSet);
begin
  QOperacaoCambioEPTval_operacao_reais.Value := QOperacaoCambioEPTVAL_OPERACAO.Value * QOperacaoCambioEPTVAL_TX_CAMBIO.Value;
end;

procedure TDMOperacaoCambio.QOperacaoCambioEPTLiqAfterInsert(
  DataSet: TDataSet);
var wVal : string;
begin
  QOperacaoCambioEPTLiqCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QOperacaoCambioEPTLiqDT_LIQUIDACAO.Value := date;

  wVal := DMOracle.BuscaNome('SELECT VAL_ATUAL_TITULO FROM TB_OPERACAO_CAMBIO_EPT','COD_OPERACAO_CAMBIO_EPT = ' + QOperacaoCambioEPTLiqCOD_OPERACAO_CAMBIO_EPT.Text);

  QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value := StrToFloat(wVal);

  if StrToFloat(wVal) <= 0 then
  begin
    QOperacaoCambioEPTLiq.cancel;
    raise Exception.create('Não é possível fazer novar liquidações. Titulo baixado.');
  end;

  if QOperacaoCambioEPTIND_MOEDA_EMPRESTIMO.Value = 'R' then
    QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Value := 1;

end;

procedure TDMOperacaoCambio.QROperacaoCambioACCCalcFields(
  DataSet: TDataSet);
begin
  if QROperacaoCambioACCNOMe.Value = '' then
  begin
    QROperacaoCambioACCval_operacao_real_moinho.value := QROperacaoCambioACCval_operacao_real_moinho.value + QROperacaoCambioACCVAL_OPERACAO_REAL.value;                
    QROperacaoCambioACCval_atual_titulo_dolar_moinho.value := QROperacaoCambioACCval_atual_titulo_dolar_moinho.value + QROperacaoCambioACCVAL_ATUAL_TITULO_DOLAR.value;
  end
  else
  begin
    QROperacaoCambioACCval_operacao_real_outros.value := QROperacaoCambioACCval_operacao_real_outros.value + QROperacaoCambioACCVAL_OPERACAO_REAL.value;
    QROperacaoCambioACCval_atual_titulo_dolar_outros.value := QROperacaoCambioACCval_atual_titulo_dolar_outros.value + QROperacaoCambioACCVAL_ATUAL_TITULO_DOLAR.value;
  end;
end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPAfterPost(DataSet: TDataSet);
begin
  QOperacaoCambioSWP.RefreshRecord; //usado para puxar o valor atual na tela, pois o valor atual é calculado numa trigger
end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPLiqAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioSWPLiqVAL_LIQUIDACAO.Value := QOperacaoCambioSWPVAL_ATUAL.Value;
  QOperacaoCambioSWPLiqCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPLiqAfterPost(
  DataSet: TDataSet);
begin
  QOperacaoCambioSWP.RefreshRecord;
end;

procedure TDMOperacaoCambio.QOperacaoCambioSWPLiqAfterDelete(
  DataSet: TDataSet);
begin
  QOperacaoCambioSWP.RefreshRecord;
end;

procedure TDMOperacaoCambio.QOperacaoCambioEpt_RenBeforePost(
  DataSet: TDataSet);
begin
  If (QOperacaoCambioEpt_RenVal_Juros.Value > 0) And
     (QOperacaoCambioEpt_RenVal_Variacao.Value > 0) Then
     Raise Exception.Create('Preencher apenas Juros ou Variação');
  If (QOperacaoCambioEpt_RenVal_Juros.Value = 0) And
     (QOperacaoCambioEpt_RenVal_Variacao.Value = 0) Then
     Raise Exception.Create('Preencher Juros ou Variação');
end;

procedure TDMOperacaoCambio.QOperacaoCambioEpt_RenAfterInsert(
  DataSet: TDataSet);
begin
  QOperacaoCambioEpt_RenCod_Operacao_Cambio_Ept.Value := QOperacaoCambioEptCod_Operacao_Cambio_Ept.Value;
  QOperacaoCambioEpt_RenCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
