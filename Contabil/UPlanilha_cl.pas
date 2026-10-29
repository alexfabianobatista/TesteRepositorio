unit UPlanilha_cl;

interface                

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, variants;

type
  TDMPlanilha = class(TDataModule)
    DSLanctoContabilCad: TDataSource;
    DSSomaGrid: TDataSource;
    QRegPlanoConta: TOracleDataSet1;
    QRegPlanoContaCOD_FILIAL: TIntegerField;
    QRegPlanoContaCOD_REDUZIDO: TIntegerField;
    QRegPlanoContaCOD_PLANO_CONTA: TIntegerField;
    QRegPlanoContaNUM_PLANO_CONTA: TStringField;
    QRegPlanoContaDESC_PLANO_CONTA: TStringField;
    QRegPlanoContaNUM_GRAU: TIntegerField;
    QLcto1: TOracleDataSet1;
    QLcto1COD_LANCTO_CONTABIL: TIntegerField;
    QLcto1COD_NOTA_CAB: TIntegerField;
    QLcto1COD_CONTAS_RECEBER_CAB: TIntegerField;
    QLcto1COD_CONTA_PAGAR_CAB: TIntegerField;
    QLcto1COD_BCO_MOVIMENTO: TIntegerField;
    QLcto1COD_CAIXA_MOV: TIntegerField;
    QLcto1COD_FILIAL: TIntegerField;
    QLcto1COD_GENERICO: TIntegerField;
    QLcto1COD_HISTORICO_CONTABIL: TIntegerField;
    QLcto1COD_PLANO_CONTA: TIntegerField;
    QLcto1DT_LANCAMENTO: TDateTimeField;
    QLcto1NUM_LANCAMENTO: TIntegerField;
    QLcto1DESC_COMPLEMENTO: TStringField;
    QLcto1VAL_LANCAMENTO: TFloatField;
    QLcto1IND_OPERACAO: TStringField;
    QLcto1COD_PLANILHA: TIntegerField;
    QLcto1NUM_CONTRAPARTIDA: TStringField;
    QLcto1IND_ATUALIZA_SALDO: TStringField;
    QLcto1COD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QLcto: TOracleDataSet1;
    QLctoCOD_LANCTO_CONTABIL: TIntegerField;
    QLctoCOD_NOTA_CAB: TIntegerField;
    QLctoCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QLctoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLctoCOD_BCO_MOVIMENTO: TIntegerField;
    QLctoCOD_CAIXA_MOV: TIntegerField;
    QLctoCOD_FILIAL: TIntegerField;
    QLctoCOD_HISTORICO_CONTABIL: TIntegerField;
    QLctoCOD_PLANO_CONTA: TIntegerField;
    QLctoDT_LANCAMENTO: TDateTimeField;
    QLctoNUM_LANCAMENTO: TIntegerField;
    QLctoDESC_COMPLEMENTO: TStringField;
    QLctoVAL_LANCAMENTO: TFloatField;
    QLctoIND_OPERACAO: TStringField;
    QLctoCOD_PLANILHA: TIntegerField;
    QLctoNUM_CONTRAPARTIDA: TStringField;
    QLctoIND_ATUALIZA_SALDO: TStringField;
    QLctoCOD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QLctoCOD_GENERICO: TIntegerField;
    QApagaLcto: TOracleDataSet1;
    QSaldoContabil: TOracleDataSet1;
    QSaldoContabilCOD_FILIAL: TIntegerField;
    QSaldoContabilCOD_PLANO_CONTA: TIntegerField;
    QSaldoContabilDT_ANO_MES: TIntegerField;
    QSaldoContabilVAL_ANTERIOR: TFloatField;
    QSaldoContabilVAL_ATUAL: TFloatField;
    QSaldoContabilVAL_CREDITO: TFloatField;
    QSaldoContabilVAL_DEBITO: TFloatField;
    QSaldoContabilVAL_SALDO_DRE: TFloatField;
    QAtzSaldo_dt: TOracleDataSet1;
    QRBalancoPatrimonial: TOracleDataSet1;
    QAtzMensal: TOracleDataSet1;
    QRBalancoPatrimonialCOD_PLANO_CONTA: TIntegerField;
    QRBalancoPatrimonialDT_ANO_MES: TIntegerField;
    QRBalancoPatrimonialVAL_ANTERIOR: TFloatField;
    QRBalancoPatrimonialVAL_ATUAL: TFloatField;
    QRBalancoPatrimonialVAL_CREDITO: TFloatField;
    QRBalancoPatrimonialVAL_DEBITO: TFloatField;
    QRBalancoPatrimonialVAL_SALDO_DRE: TFloatField;
    QRBalancoPatrimonialNUM_PLANO_CONTA: TStringField;
    QRBalancoPatrimonialDESC_PLANO_CONTA: TStringField;
    QRBalancoPatrimonialNUM_GRAU: TIntegerField;
    QViradaMes: TOracleDataSet1;
    QViradaMesCOD_FILIAL: TIntegerField;
    QViradaMesCOD_PLANO_CONTA: TIntegerField;
    QViradaMesDT_ANO_MES: TIntegerField;
    QViradaMesVAL_ANTERIOR: TFloatField;
    QViradaMesVAL_ATUAL: TFloatField;
    QViradaMesVAL_CREDITO: TFloatField;
    QViradaMesVAL_DEBITO: TFloatField;
    QSaldoVirada: TOracleDataSet1;
    QSaldoViradaCOD_PLANO_CONTA: TIntegerField;
    QSaldoViradaCOD_FILIAL: TIntegerField;
    QSaldoViradaSVAL_DEBITO: TFloatField;
    QSaldoViradaSVAL_CREDITO: TFloatField;
    QSaldoViradaSVAL_SALDO: TFloatField;
    QRContabil_Diario: TOracleDataSet1;
    QSomaZeraExercicio: TOracleDataSet1;
    QVerificaZeramento: TOracleDataSet1;
    QVerificaZeramentoNUM: TFloatField;
    QRemSaldo: TOracleDataSet1;
    QRSomaContasAcum: TOracleDataSet1;
    QImpSaldo_dt: TOracleDataSet1;
    QImpSaldo_dtCOD_PLANO_CONTA: TIntegerField;
    QRSomaContas: TOracleDataSet1;
    QRLanctoMov: TOracleDataSet1;
    QRLanctoMovCOD_REDUZIDO: TIntegerField;
    QRLanctoMovNUM_PLANO_CONTA: TStringField;
    QRLanctoMovCOD_LANCTO_CONTABIL: TIntegerField;
    QRLanctoMovCOD_FILIAL: TIntegerField;
    QRLanctoMovCOD_HISTORICO_CONTABIL: TIntegerField;
    QRLanctoMovDT_LANCAMENTO: TDateTimeField;
    QRLanctoMovNUM_LANCAMENTO: TIntegerField;
    QRLanctoMovDESC_COMPLEMENTO: TStringField;
    QRLanctoMovVAL_LANCAMENTO: TFloatField;
    QRLanctoMovIND_OPERACAO: TStringField;
    QRLanctoMovCOD_PLANILHA: TIntegerField;
    QRLanctoMovNUM_CONTRAPARTIDA: TStringField;
    QRBalanceteAnalitico: TOracleDataSet1;
    QRBalanceteAnaliticoVAL_ANTERIOR: TFloatField;
    QRBalanceteAnaliticoVAL_ATUAL: TFloatField;
    QRBalanceteAnaliticoVAL_CREDITO: TFloatField;
    QRBalanceteAnaliticoVAL_DEBITO: TFloatField;
    QRBalanceteAnaliticoCOD_REDUZIDO: TIntegerField;
    QRBalanceteAnaliticoDESC_PLANO_CONTA: TStringField;
    QRBalanceteAnaliticoNUM_GRAU: TIntegerField;
    QRBalanceteAnaliticoNUM_PLANO_CONTA: TStringField;
    QRBalanceteAnaliticoAcum: TOracleDataSet1;
    QRBalanceteAnaliticoAcumVAL_CREDITO: TFloatField;
    QRBalanceteAnaliticoAcumVAL_DEBITO: TFloatField;
    QRBalanceteAnaliticoAcumVAL_ANTERIOR: TFloatField;
    QRBalanceteAnaliticoAcumVAL_ATUAL: TFloatField;
    QRBalanceteAnaliticoAcumNUM_PLANO_CONTA: TStringField;
    QRBalanceteAnaliticoAcumCOD_REDUZIDO: TFloatField;
    QRBalanceteAnaliticoAcumDESC_PLANO_CONTA: TStringField;
    QRBalanceteAnaliticoAcumNUM_GRAU: TFloatField;
    QRSomaRazao: TOracleDataSet1;
    QRSomaRazaoSVAL_SALDO: TFloatField;
    QZeraVirada: TOracleDataSet1;
    QAtualizaSaldoZera: TOracleDataSet1;
    QRRazaoAnalitico: TOracleDataSet1;
    QRRazaoAnaliticoDT_ANO_MES: TIntegerField;
    QRRazaoAnaliticoVAL_INICIAL: TFloatField;
    QRRazaoAnaliticoVAL_ATUAL: TFloatField;
    QRRazaoAnaliticoCOD_PLANO_CONTA: TIntegerField;
    QRRazaoAnaliticoNUM_CONTRAPARTIDA: TStringField;
    QRRazaoAnaliticoCOD_FILIAL: TIntegerField;
    QRRazaoAnaliticoCOD_LANCTO_CONTABIL: TIntegerField;
    QRRazaoAnaliticoCOD_NOTA_CAB: TIntegerField;
    QRRazaoAnaliticoCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QRRazaoAnaliticoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRRazaoAnaliticoCOD_BCO_MOVIMENTO: TIntegerField;
    QRRazaoAnaliticoCOD_CAIXA_MOV: TIntegerField;
    QRRazaoAnaliticoCOD_HISTORICO_CONTABIL: TIntegerField;
    QRRazaoAnaliticoDT_LANCAMENTO: TFloatField;
    QRRazaoAnaliticoNUM_LANCAMENTO: TIntegerField;
    QRRazaoAnaliticoDESC_COMPLEMENTO: TStringField;
    QRRazaoAnaliticoVAL_LANCAMENTO: TFloatField;
    QRRazaoAnaliticoIND_OPERACAO: TStringField;
    QRRazaoAnaliticoCOD_PLANILHA: TIntegerField;
    QRRazaoAnaliticoDESC_PLANO_CONTA: TStringField;
    QRRazaoAnaliticoNUM_PLANO_CONTA: TStringField;
    QRRazaoAnaliticoCOD_REDUZIDO: TIntegerField;
    QRRazaoAnaliticoDESC_HISTORICO_CONTABIL: TStringField;
    QRRazaoAnaliticoval_anterior: TFloatField;
    QLanctoCont: TOracleDataSet1;
    QLanctoContCOD_LANCTO_CONTABIL: TIntegerField;
    QLanctoContCOD_NOTA_CAB: TIntegerField;
    QLanctoContCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QLanctoContCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLanctoContCOD_BCO_MOVIMENTO: TIntegerField;
    QLanctoContCOD_CAIXA_MOV: TIntegerField;
    QLanctoContCOD_FILIAL: TIntegerField;
    QLanctoContCOD_HISTORICO_CONTABIL: TIntegerField;
    QLanctoContCOD_PLANO_CONTA: TIntegerField;
    QLanctoContDT_LANCAMENTO: TDateTimeField;
    QLanctoContNUM_LANCAMENTO: TIntegerField;
    QLanctoContDESC_COMPLEMENTO: TStringField;
    QLanctoContVAL_LANCAMENTO: TFloatField;
    QLanctoContIND_OPERACAO: TStringField;
    QLanctoContCOD_PLANILHA: TIntegerField;
    QZeraExercicio: TOracleDataSet1;
    QLanctoContabilCons: TOracleDataSet1;
    QLanctoContabilConsCOD_LANCTO_CONTABIL: TIntegerField;
    QLanctoContabilConsCOD_NOTA_CAB: TIntegerField;
    QLanctoContabilConsCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QLanctoContabilConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLanctoContabilConsCOD_BCO_MOVIMENTO: TIntegerField;
    QLanctoContabilConsCOD_CAIXA_MOV: TIntegerField;
    QLanctoContabilConsCOD_FILIAL: TIntegerField;
    QLanctoContabilConsCOD_HISTORICO_CONTABIL: TIntegerField;
    QLanctoContabilConsCOD_PLANO_CONTA: TIntegerField;
    QLanctoContabilConsDT_LANCAMENTO: TDateTimeField;
    QLanctoContabilConsNUM_LANCAMENTO: TIntegerField;
    QLanctoContabilConsDESC_COMPLEMENTO: TStringField;
    QLanctoContabilConsVAL_LANCAMENTO: TFloatField;
    QLanctoContabilConsIND_OPERACAO: TStringField;
    QLanctoContabilConsCOD_PLANILHA: TIntegerField;
    QLanctoContabilConsDESC_FILIAL: TStringField;
    QLanctoContabilConsDESC_HISTORICO_CONTABIL: TStringField;
    QLanctoContabilConsDESC_PLANO_CONTA: TStringField;
    QVoltaZera: TOracleDataSet1;
    QVoltaZeraCOD_LANCTO_CONTABIL: TIntegerField;
    QVoltaZeraCOD_NOTA_CAB: TIntegerField;
    QVoltaZeraCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QVoltaZeraCOD_CONTA_PAGAR_CAB: TIntegerField;
    QVoltaZeraCOD_BCO_MOVIMENTO: TIntegerField;
    QVoltaZeraCOD_CAIXA_MOV: TIntegerField;
    QVoltaZeraCOD_FILIAL: TIntegerField;
    QVoltaZeraCOD_HISTORICO_CONTABIL: TIntegerField;
    QVoltaZeraCOD_PLANO_CONTA: TIntegerField;
    QVoltaZeraDT_LANCAMENTO: TDateTimeField;
    QVoltaZeraNUM_LANCAMENTO: TIntegerField;
    QVoltaZeraDESC_COMPLEMENTO: TStringField;
    QVoltaZeraVAL_LANCAMENTO: TFloatField;
    QVoltaZeraIND_OPERACAO: TStringField;
    QVoltaZeraCOD_PLANILHA: TIntegerField;
    QVoltaZeraNUM_CONTRAPARTIDA: TStringField;
    QVoltaZeraIND_ATUALIZA_SALDO: TStringField;
    QVoltaZeraCOD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QVoltaZeraCOD_GENERICO: TIntegerField;
    QAtzSaldoPost2: TOracleDataSet1;
    QAtzSaldoPost: TOracleDataSet1;
    QLanctoContabilCad: TOracleDataSet1;
    QSomaGrid: TOracleDataSet1;
    QSomaGridCREDITO: TFloatField;
    QSomaGridDEBITO: TFloatField;
    QSomaGridSALDO: TFloatField;
    QLanctoContabilCad1: TOracleDataSet1;
    QLanctoContabilCad1COD_LANCTO_CONTABIL: TIntegerField;
    QLanctoContabilCad1COD_NOTA_CAB: TIntegerField;
    QLanctoContabilCad1COD_CONTAS_RECEBER_CAB: TIntegerField;
    QLanctoContabilCad1COD_CONTA_PAGAR_CAB: TIntegerField;
    QLanctoContabilCad1COD_BCO_MOVIMENTO: TIntegerField;
    QLanctoContabilCad1COD_CAIXA_MOV: TIntegerField;
    QLanctoContabilCad1COD_FILIAL: TIntegerField;
    QLanctoContabilCad1COD_HISTORICO_CONTABIL: TIntegerField;
    QLanctoContabilCad1COD_PLANO_CONTA: TIntegerField;
    QLanctoContabilCad1DT_LANCAMENTO: TDateTimeField;
    QLanctoContabilCad1NUM_LANCAMENTO: TIntegerField;
    QLanctoContabilCad1DESC_COMPLEMENTO: TStringField;
    QLanctoContabilCad1VAL_LANCAMENTO: TFloatField;
    QLanctoContabilCad1IND_OPERACAO: TStringField;
    QLanctoContabilCad1COD_PLANILHA: TIntegerField;
    QLanctoContabilCad1NUM_CONTRAPARTIDA: TStringField;
    QLanctoContabilCad1COD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QLanctoContabilCad1IND_ATUALIZA_SALDO: TStringField;
    QSaldoContabilCons: TOracleDataSet1;
    QSaldoContabilConsCOD_FILIAL: TIntegerField;
    QSaldoContabilConsCOD_PLANO_CONTA: TIntegerField;
    QSaldoContabilConsDT_ANO_MES: TIntegerField;
    QSaldoContabilConsVAL_ANTERIOR: TFloatField;
    QSaldoContabilConsVAL_ATUAL: TFloatField;
    QSaldoContabilConsVAL_CREDITO: TFloatField;
    QSaldoContabilConsVAL_DEBITO: TFloatField;
    QSaldoContabilConsDESC_FILIAL: TStringField;
    QSaldoContabilConsDESC_PLANO_CONTA: TStringField;
    QLanctoContabilCadCOD_LANCTO_CONTABIL: TIntegerField;
    QLanctoContabilCadCOD_NOTA_CAB: TIntegerField;
    QLanctoContabilCadCOD_CONTAS_RECEBER_CAB: TIntegerField;
    QLanctoContabilCadCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLanctoContabilCadCOD_BCO_MOVIMENTO: TIntegerField;
    QLanctoContabilCadCOD_CAIXA_MOV: TIntegerField;
    QLanctoContabilCadCOD_FILIAL: TIntegerField;
    QLanctoContabilCadCOD_HISTORICO_CONTABIL: TIntegerField;
    QLanctoContabilCadCOD_PLANO_CONTA: TIntegerField;
    QLanctoContabilCadDT_LANCAMENTO: TDateTimeField;
    QLanctoContabilCadNUM_LANCAMENTO: TIntegerField;
    QLanctoContabilCadDESC_COMPLEMENTO: TStringField;
    QLanctoContabilCadVAL_LANCAMENTO: TFloatField;
    QLanctoContabilCadIND_OPERACAO: TStringField;
    QLanctoContabilCadCOD_PLANILHA: TIntegerField;
    QLanctoContabilCadNUM_CONTRAPARTIDA: TStringField;
    QLanctoContabilCadCOD_FILIAL_CONTRAPARTIDA: TIntegerField;
    QLanctoContabilCadIND_ATUALIZA_SALDO: TStringField;
    QRSomaContasAcumVAL_CREDITO: TFloatField;
    QRSomaContasAcumVAL_DEBITO: TFloatField;
    QRSomaContasVAL_CREDITO: TFloatField;
    QRSomaContasVAL_DEBITO: TFloatField;
    QRContabil_DiarioDT_LANCAMENTO: TDateTimeField;
    QRContabil_DiarioVAL_DEBITO: TFloatField;
    QRContabil_DiarioVAL_CREDITO: TFloatField;
    QRContabil_DiarioIND_OPERACAO: TStringField;
    QLcto1NUM_RPA: TIntegerField;
    QLctoNUM_RPA: TIntegerField;
    QLanctoContabilCadNUM_RPA: TIntegerField;
    QLanctoContabilConsNUM_RPA: TIntegerField;
    QRContabil_DiarioVAL_LANCTO: TFloatField;
    QRContabil_DiarioCOD_HISTORICO_CONTABIL: TFloatField;
    QRContabil_DiarioCOD_LANCTO_CONTABIL: TFloatField;
    QRContabil_DiarioCOD_NOTA_CAB: TFloatField;
    QRContabil_DiarioCOD_CONTAS_RECEBER_CAB: TFloatField;
    QRContabil_DiarioCOD_CONTA_PAGAR_CAB: TFloatField;
    QRContabil_DiarioCOD_BCO_MOVIMENTO: TFloatField;
    QRContabil_DiarioCOD_CAIXA_MOV: TFloatField;
    QRContabil_DiarioCOD_FILIAL: TFloatField;
    QRContabil_DiarioCOD_PLANO_CONTA: TFloatField;
    QRContabil_DiarioNUM_LANCAMENTO: TFloatField;
    QRContabil_DiarioCOD_PLANILHA: TFloatField;
    QRContabil_DiarioNUM_CONTRAPARTIDA: TStringField;
    QRContabil_DiarioNUM_PLANO_CONTA: TStringField;
    QRDiarioTot: TOracleDataSet1;
    QRDiarioTotDT_LANCAMENTO: TDateTimeField;
    QRDiarioTotVAL_DEBITO: TFloatField;
    QRDiarioTotVAL_CREDITO: TFloatField;
    QLcto1COD_CONHECIMENTO_FRETE: TIntegerField;
    QLctoCOD_CONHECIMENTO_FRETE: TIntegerField;
    QLanctoContabilConsCOD_CONHECIMENTO_FRETE: TIntegerField;
    QLctoCOD_ESTADIA: TIntegerField;
    QLcto1COD_ESTADIA: TIntegerField;
    QLanctoContabilConsCOD_ESTADIA: TIntegerField;
    QRResumoAnual: TOracleDataSet1;
    QLctoCOD_OBRA: TIntegerField;
    QLcto1COD_OBRA: TIntegerField;
    QLanctoContabilConsCOD_OBRA: TIntegerField;
    QRResumoAnualDESC_PLANO_CONTA: TStringField;
    QRResumoAnualNUM_PLANO_CONTA: TStringField;
    QRResumoAnualJANEIRO: TFloatField;
    QRResumoAnualFEVEREIRO: TFloatField;
    QRResumoAnualMARCO: TFloatField;
    QRResumoAnualABRIL: TFloatField;
    QRResumoAnualMAIO: TFloatField;
    QRResumoAnualJUNHO: TFloatField;
    QRResumoAnualJULHO: TFloatField;
    QRResumoAnualAGOSTO: TFloatField;
    QRResumoAnualSETEMBRO: TFloatField;
    QRResumoAnualOUTUBRO: TFloatField;
    QRResumoAnualNOVEMBRO: TFloatField;
    QRResumoAnualDEZEMBRO: TFloatField;
    QLcto1COD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QLcto1COD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QLcto1COD_CONTROLE_CREDITO_ICMS_DIF: TIntegerField;
    QLcto1COD_PATRIMONIO_INCORPORACAO: TIntegerField;
    QLcto1COD_PATRIMONIO_BAIXA: TIntegerField;
    QLcto1COD_PATRIMONIO_BAIXA_DEP_ACUM: TIntegerField;
    QLctoCOD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QLctoCOD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QLctoCOD_CONTROLE_CREDITO_ICMS_DIF: TIntegerField;
    QLctoCOD_PATRIMONIO_INCORPORACAO: TIntegerField;
    QLctoCOD_PATRIMONIO_BAIXA: TIntegerField;
    QLctoCOD_PATRIMONIO_BAIXA_DEP_ACUM: TIntegerField;
    QLcto1COD_PATRIMONIO_ICMS: TIntegerField;
    QLctoCOD_PATRIMONIO_ICMS: TIntegerField;
    QRRazaoAnaliticoCOD_FILIAL_CONTRAPARTIDA: TFloatField;
    QLcto1COD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QLanctoContabilConsCOD_DEPRECIACAO_PATRIMONIO: TIntegerField;
    QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS_DIF: TIntegerField;
    QLanctoContabilConsCOD_PATRIMONIO_INCORPORACAO: TIntegerField;
    QLanctoContabilConsCOD_PATRIMONIO_BAIXA: TIntegerField;
    QLanctoContabilConsCOD_PATRIMONIO_BAIXA_DEP_ACUM: TIntegerField;
    QLanctoContabilConsCOD_PATRIMONIO_ICMS: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QLcto1COD_EGF: TIntegerField;
    QLctoCOD_OPERACAO_CAMBIO_ACC: TIntegerField;
    QLctoCOD_OPERACAO_CAMBIO_PRT: TIntegerField;
    QLctoCOD_EGF: TIntegerField;
    QLctoCOD_EGF_LIQ: TIntegerField;
    QLctoCOD_EGF_LIQ_JURO: TIntegerField;
    QLcto1COD_EGF_LIQ: TIntegerField;
    QLcto1COD_EGF_LIQ_JURO: TIntegerField;
    QLanctoContabilConsCOD_EGF: TIntegerField;
    QLanctoContabilConsCOD_EGF_LIQ: TIntegerField;
    QLanctoContabilConsCOD_EGF_LIQ_JURO: TIntegerField;
    QLcto1COD_VARIACAO_CAMBIAL_ACC: TIntegerField;
    QLctoCOD_VARIACAO_CAMBIAL_ACC: TIntegerField;
    QLanctoContabilConsCOD_VARIACAO_CAMBIAL_ACC: TIntegerField;
    QLcto1COD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_SWP: TIntegerField;
    QLcto1COD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QLcto1COD_VARIACAO_CAMBIAL_SWP: TIntegerField;
    QLcto1COD_VARIACAO_CAMBIAL_EPT: TIntegerField;
    QLcto1COD_OPERACAO_CAMBIO_EPT_LIQ: TIntegerField;
    QLcto1COD_OPERACAO_CAMBIO_EPT_LIQ_J: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT: TIntegerField;
    QLanctoContabilConsCOD_VARIACAO_CAMBIAL_SWP: TIntegerField;
    QLanctoContabilConsCOD_VARIACAO_CAMBIAL_EPT: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_J: TIntegerField;
    QLctoCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QLcto1COD_CAIXA_TRANSF_CAB: TIntegerField;
    QLanctoContabilConsCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QSomaZeraExercicioCOD_FILIAL: TFloatField;
    QSomaZeraExercicioSOMA_DEBITO: TFloatField;
    QSomaZeraExercicioSOMA_CREDITO: TFloatField;
    QZeraExercicioCOD_FILIAL: TIntegerField;
    QZeraExercicioCOD_PLANO_CONTA: TIntegerField;
    QZeraExercicioDT_ANO_MES: TIntegerField;
    QZeraExercicioVAL_ANTERIOR: TFloatField;
    QZeraExercicioVAL_ATUAL: TFloatField;
    QZeraExercicioVAL_CREDITO: TFloatField;
    QZeraExercicioVAL_DEBITO: TFloatField;
    QZeraExercicioNUM_GRAU: TIntegerField;
    QZeraExercicioNUM_PLANO_CONTA: TStringField;
    QSomaZeraExercicioDT_ANO_MES: TFloatField;
    QLcto1COD_APLICACAO_FINANCEIRA_MOV: TIntegerField;
    QLanctoContabilConsCOD_PREMIO_EXPORTACAO: TIntegerField;
    QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_S: TIntegerField;
    QLanctoContabilConsCOD_APLICACAO_FINANCEIRA_MOV: TIntegerField;
    QRContabil_DiarioDESC_HISTORICO_CONTABIL: TStringField;
    QLcto1COD_CONTRATO: TIntegerField;
    QLanctoContabilConsCOD_CONTRATO: TIntegerField;
    QLctoCOD_CONTRATO: TIntegerField;
    QLcto1COD_CONTRATO_GP: TIntegerField;
    QLctoCOD_CONTRATO_GP: TIntegerField;
    QLanctoContabilConsCOD_CONTRATO_GP: TIntegerField;
    QLctoCOD_CONTRATO_VEND: TIntegerField;
    QLcto1COD_CONTRATO_VEND: TIntegerField;
    QLanctoContabilConsCOD_CONTRATO_VEND: TIntegerField;
    QLctoCOD_CONTRATO_ARROZ: TIntegerField;
    QLcto1COD_CONTRATO_ARROZ: TIntegerField;
    QLanctoContabilConsCOD_CONTRATO_ARROZ: TIntegerField;
    QSaldoContabilEnc: TOracleDataSet1;
    QInsSaldoContabilEnc: TOracleDataSet1;
    QSaldoContabilEncCOD_FILIAL: TIntegerField;
    QSaldoContabilEncCOD_PLANO_CONTA: TIntegerField;
    QSaldoContabilEncDT_ANO_MES: TIntegerField;
    QSaldoContabilEncVAL_ANTERIOR: TFloatField;
    QSaldoContabilEncVAL_ATUAL: TFloatField;
    QSaldoContabilEncVAL_CREDITO: TFloatField;
    QSaldoContabilEncVAL_DEBITO: TFloatField;
    QSaldoContabilEncVAL_SALDO_DRE: TFloatField;
    QSaldoContabilEncerramento: TOracleDataSet1;
    QSaldoContabilEncerramentoCOD_FILIAL: TIntegerField;
    QSaldoContabilEncerramentoCOD_PLANO_CONTA: TIntegerField;
    QSaldoContabilEncerramentoDT_ANO_MES: TIntegerField;
    QSaldoContabilEncerramentoVAL_ANTERIOR: TFloatField;
    QSaldoContabilEncerramentoVAL_ATUAL: TFloatField;
    QSaldoContabilEncerramentoVAL_CREDITO: TFloatField;
    QSaldoContabilEncerramentoVAL_DEBITO: TFloatField;
    QSaldoContabilEncerramentoVAL_SALDO_DRE: TFloatField;
    QAtualizaGrasel: TOracleDataSet1;
    QAtualizaGraselCOD_PLANO_CONTA: TIntegerField;
    QAtualizaGraselVAL_ANTERIOR: TFloatField;
    QAtualizaGraselNUM_PLANO_CONTA: TStringField;
    QAtualizaGraselNUM_GRAU: TIntegerField;
    QRBalancoPatrimonialVAL_ANO_ANTERIOR: TFloatField;
    QNotaExplicativa: TOracleDataSet1;
    QNotaExplicativaCOD_NOTA_EXPLICATIVA: TIntegerField;
    QNotaExplicativaCOD_FILIAL: TIntegerField;
    QNotaExplicativaNUM_ANO: TIntegerField;
    QNotaExplicativaDESC_NOTA_EXPLICATIVA: TBlobField;
    QNotaExplicativaCons: TOracleDataSet1;
    QNotaExplicativaConsCOD_FILIAL: TIntegerField;
    QNotaExplicativaConsNUM_ANO: TIntegerField;
    QNotaExplicativaConsDESC_NOTA_EXPLICATIVA: TMemoField;
    QNotaExplicativaConsCOD_NOTA_EXPLICATIVA: TIntegerField;
    QRNotaExplicativa: TOracleDataSet1;
    QRNotaExplicativaCOD_NOTA_EXPLICATIVA: TIntegerField;
    QRNotaExplicativaCOD_FILIAL: TIntegerField;
    QRNotaExplicativaNUM_ANO: TIntegerField;
    QRNotaExplicativaDESC_NOTA_EXPLICATIVA: TMemoField;
    QLctoCOD_BOLETIM_INDUSTRIA: TIntegerField;
    QLcto1COD_BOLETIM_INDUSTRIA: TIntegerField;
    QLanctoContabilConsCOD_BOLETIM_INDUSTRIA: TIntegerField;
    QImportaSaldo: TOracleDataSet1;
    QImportaSaldoCOD_FILIAL: TIntegerField;
    QImportaSaldoCOD_PLANO_CONTA: TIntegerField;
    QImportaSaldoDT_ANO_MES: TIntegerField;
    QImportaSaldoVAL_ANTERIOR: TFloatField;
    QImportaSaldoVAL_ATUAL: TFloatField;
    QImportaSaldoVAL_CREDITO: TFloatField;
    QImportaSaldoVAL_DEBITO: TFloatField;
    QImportaSaldoVAL_SALDO_DRE: TFloatField;
    QLanctoContabilConsCOD_REDUZIDO: TIntegerField;
    QLanctoContabilConsNUM_CGC: TStringField;
    QExportaLancamentos: TOracleDataSet1;
    QExportaLancamentosCOD_FILIAL: TIntegerField;
    QExportaLancamentosCOD_HISTORICO_CONTABIL: TIntegerField;
    QExportaLancamentosCOD_PLANO_CONTA: TIntegerField;
    QExportaLancamentosDT_LANCAMENTO: TDateTimeField;
    QExportaLancamentosVAL_LANCAMENTO: TFloatField;
    QExportaLancamentosIND_OPERACAO: TStringField;
    QExportaLancamentosDESC_HISTORICO_CONTABIL: TStringField;
    QExportaLancamentosDESC_PLANO_CONTA: TStringField;
    QExportaLancamentosCOD_REDUZIDO: TIntegerField;
    QExportaLancamentosNUM_CGC: TStringField;
    QExportaLancamentosCOD_REDUZIDO_CONTRAPARTIDA: TIntegerField;
    procedure QLanctoContabilCadAfterInsert(DataSet: TDataSet);
    procedure QLanctoContabilCadBeforeInsert(DataSet: TDataSet);
    procedure QLanctoContabilCadBeforePost(DataSet: TDataSet);
    procedure QLanctoContabilCadAfterPost(DataSet: TDataSet);
    procedure QLanctoContabilCadBeforeDelete(DataSet: TDataSet);
    procedure QLanctoContabilCadAfterEdit(DataSet: TDataSet);
    procedure QLanctoContabilCadBeforeEdit(DataSet: TDataSet);
    procedure QSaldoContabilAfterInsert(DataSet: TDataSet);
    procedure QVoltaZeraBeforeDelete(DataSet: TDataSet);
    procedure QLcto1BeforeDelete(DataSet: TDataSet);
    procedure QRRazaoAnaliticoCalcFields(DataSet: TDataSet);
    procedure QLanctoContabilCad1AfterInsert(DataSet: TDataSet);
    procedure QLanctoContabilCad1AfterPost(DataSet: TDataSet);
    procedure QLanctoContabilCad1BeforeDelete(DataSet: TDataSet);
    procedure QLanctoContabilCad1BeforePost(DataSet: TDataSet);
    procedure QLanctoContabilCad1AfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    fDataFinal : TdateTime;
    fFilial_Inicial : Integer;
    fFilial_Final : Integer;

  public
    { Public declarations }
    Property pDataFinal : TDateTime Read fDataFinal Write fDataFinal;  // utilizado para calculo saldo inicial no razão calcfields qsomarazao
    Property pFilial_Inicial : Integer Read fFilial_Inicial Write fFilial_Inicial;  // utilizado para calculo saldo inicial no razão calcfields qsomarazao
    Property pFilial_Final : Integer Read fFilial_Final Write fFilial_Final;  // utilizado para calculo saldo inicial no razão calcfields qsomarazao
    procedure ImplantaSaldo(wOperacao :string; wFilial: Integer; wNumPlano: String;
      SaldoAnterior, SaldoAtual, wDataLanc: Real);
    Function ExisteZeramento(wFilial:Real;wData:TDateTime):Boolean;
    Procedure SalvaSaldoContabil(wFilial,wCodPlano:Real;wDataLanc:TDateTime);
    Procedure AtzSaldoContabilCZ(wOperacao:String;wFilial,wCodPlano,wValor : Real; wDataLanc:TDateTime);
    Function  NivelSuperior(wConta:String):String;
    Procedure AtzSaldoContabil(wOperacao:String;wFilial,wCodPlano,wValor : Real; wDataLanc:TDateTime);
    Function  CodConta(wFilial:Integer;wContaCred:String) : Integer;
    Procedure Descontabiliza(wNumDoc : Integer; wTipoDoc :String);
    Procedure GravaLanc2(wTipoDoc : String;
                               wCodDoc  : Real;
                               WNumDoc  : String;
                               wFilial  : Integer;
                               wContaCred,
                               wContaDeb : String;
                               wCodCompl ,
                               wCodHistorico,
                               wVlrLcto  : Real;
                               wDtLcto   : TDateTime );
    Procedure GravaLanc(wTipoDoc : String;
                               wCodDoc  : Real;
                               WNumDoc  : String;
                               wFilial  : Integer;
                               wConta,
                               wOperacao : String;
                               wCodCompl ,
                               wCodHistorico,
                               wVlrLcto  : Real;
                               wDtLcto   : TDateTime;
                               wContrapartida  : String );

   Procedure ZeraExSaldoContabil(wOperacao: String;
                                 wFilial, wCodPlano,wValor: Real;
                                 wDataLanc: TDateTime);

  end;

var
  DMPlanilha: TDMPlanilha;
  wPlanilha : Integer;
  wLocalLancto1,wLocalLancto2,wHist_lancto,wPlano_lancto1,wPlano_lancto2 : Integer;
  wComplemento,wDt_Lancto1,wDt_Lancto2 : String;
implementation

uses UOracle_cl, UParamSistema_cl, UPlanoConta_cl, USequencia_cl,
  UUsuario_cl;

{$R *.DFM}

Function TDMPlanilha.CodConta(wFilial:Integer;wContaCred:String) : Integer;
Begin
  QRegPlanoConta.Close;
  If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
    QRegPlanoConta.SetVariable('FILIAL',wFilial)
  Else
    QRegPlanoConta.SetVariable('FILIAL',1);
  QRegPlanoConta.SetVariable('CONTA',wContaCred);
  QRegPlanoConta.Open;

  If QRegPlanoContaCod_Plano_Conta.Value > 0 then
    Result := QRegPlanoContaCod_Plano_Conta.Value
  Else
    Result := 0;
  If Result = 0 then
    Raise Exception.Create('Conta não encontrada: '+ wContaCred);
End;

Procedure TDMPlanilha.GravaLanc2(wTipoDoc : String;
                                 wCodDoc  : Real;
                                 WNumDoc  : String;
                                 wFilial  : Integer;
                                 wContaCred,
                                 wContaDeb : String;
                                 wCodCompl ,
                                 wCodHistorico,
                                 wVlrLcto  : Real;
                                 wDtLcto   : TDateTime );
Var vCont : Integer;
    vCtDeb, vCtCred : String;
Begin
  If wFilial > 90 Then
     Exit;
  If wVlrLcto > 0 then
  Try
    If Trim(wContaCred) <> '' Then
    Begin
      If Length( wContaCred )in [9,7] Then // 9 = nivel Seis, 13 = nível Cinco
      Begin
        vCtCred := wContaCred + FormatFloat('000000',wCodCompl);
      End
      Else
      Begin
        If Length(wContaCred) in [15,13] then
          vCtCred := wContaCred
        Else
          Raise Exception.Create('Conta para Crédito inválida: '+ wContaCred );
      End;

      QRegPlanoConta.Close;
      QRegPlanoConta.SetVariable('CONTA',vCtCred);
      If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
        QRegPlanoConta.SetVariable('FILIAL',wFilial)
      Else
        QRegPlanoConta.SetVariable('FILIAL',1); // Matriz
      QRegPlanoConta.Open;
      If QRegPlanoContaCod_Reduzido.Value = 0 then
      Begin
        Try
          QRegPlanoConta.Open;
          QRegPlanoConta.Insert;
//          QRegPlanoContaCod_Plano_Conta.Value := DMOracle.Sequencia('PLANO_CONTA');
          QRegPlanoContaNum_Plano_Conta.Value := vCtCred;
          QRegPlanoContaNum_Grau.Value := DMParamSistema.QParamSistemaNum_Graus_Contabil.Value;
          If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(wFilial,'COD_REDUZIDO');
            QRegPlanoContaCod_Filial.Value := wFilial
           End
          Else
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(1,'COD_REDUZIDO');
            QRegPlanoContaCod_Filial.Value := 1;
           End;
          QRegPlanoContaDesc_Plano_Conta.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(wCodCompl));
          QRegPlanoConta.Post;
        Except
          If QRegPlanoConta.State = dsInsert then
            QRegPlanoConta.Cancel;
          ShowMessage('Não foi possível incluir nova conta de Crédito!');
          Raise;
        End;
      End;
    End; // wContaCred <> ''

    If Trim(wContaDeb) <> '' Then
    Begin
      // Verifica tamanho da Conta de Conta-Partida, se necessário complementa com wCodCompl
      If Length( wContaDeb )in [9,7] Then // 9 = nivel Seis, 13 = nível Cinco
      Begin
        vCtDeb := wContaDeb + FormatFloat('000000',wCodCompl);
      End
      Else
      Begin
        If Length(wContaDeb) in [15,13] then
          vCtDeb := wContaDeb
        Else
          Raise Exception.Create('Conta para Débito inválida: '+ wContaDeb );
      End;

      // Verificar se a Conta de Débito existe, se não cadastra
      QRegPlanoConta.Close;
      QRegPlanoConta.SetVariable('CONTA',vCtDeb);
      If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
        QRegPlanoConta.SetVariable('FILIAL',wFilial)
      Else
        QRegPlanoConta.SetVariable('FILIAL',1); // Matriz
      QRegPlanoConta.Open;
      If QRegPlanoContaCod_Reduzido.Value = 0 then
      Begin
        Try
          QRegPlanoConta.Open;
          QRegPlanoConta.Insert;
//          QRegPlanoContaCod_Plano_Conta.Value := DMOracle.Sequencia('PLANO_CONTA');
          QRegPlanoContaNum_Plano_Conta.Value := vCtDeb;
          QRegPlanoContaNum_Grau.Value := DMParamSistema.QParamSistemaNum_Graus_Contabil.Value;
          If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(wFilial,'COD_REDUZIDO');
            QRegPlanoContaCod_Filial.Value := wFilial;
           End
          Else
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(1,'COD_REDUZIDO');
            QRegPlanoContaCod_Filial.Value := 1;
           End;
          QRegPlanoContaDesc_Plano_Conta.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(wCodCompl));
          QRegPlanoConta.Post;
        Except
          If QRegPlanoConta.State = dsInsert then
            QRegPlanoConta.Cancel;
          ShowMessage('Não foi possível incluir nova conta de Crédito!');
          Raise;
        End;
      End;
      // Gravar Lancamento e Contra-Partida
    End; // wContaDeb <> ''

    QLcto1.Close;
    QLcto1.SetVariable('COD_LANCTO_CONTABIL',0);
    QLcto1.Open;
    For vCont := 1 to 2 do
    Begin
      If (vCont = 1) and ( Trim(wContaCred) <> '' )
          or
         (vCont = 2) and ( Trim(wContaDeb) <> '' ) Then
      Begin
        QLcto1.Insert;
        QLcto1Cod_Lancto_Contabil.Value := DMOracle.Sequencia('LANCTO_CONTABIL');
        QLcto1Cod_Filial.Value := Trunc(wFilial);
        If (wTipoDoc = 'NFE') OR (wTipoDoc = 'NFS') Then
          QLcto1Cod_Nota_Cab.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CP' Then
          QLcto1Cod_Conta_Pagar_Cab.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CR' Then
          QLcto1Cod_Contas_Receber_Cab.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CX' Then
          QLcto1Cod_Caixa_Mov.Value := Trunc(wCodDoc);
        If wTipoDoc = 'BC' Then
          QLcto1Cod_Bco_Movimento.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CNH' Then
          QLcto1Cod_Conhecimento_Frete.Value := Trunc(wCodDoc);
        If wTipoDoc = 'RPA' Then
          QLcto1Num_Rpa.Value := Trunc(wCodDoc);
        If wTipoDoc = 'EST' Then
          QLcto1Cod_Estadia.Value := Trunc(wCodDoc);
        If wTipoDoc = 'OBRA' Then
          QLcto1Cod_Obra.Value := Trunc(wCodDoc);
        //ALTERADO FABIANO: 06/08/2004
        If wTipoDoc = 'DEP' Then
          QLcto1COD_DEPRECIACAO_PATRIMONIO.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CIAP' Then
          QLcto1COD_CONTROLE_CREDITO_ICMS.Value := Trunc(wCodDoc);
        If wTipoDoc = 'DIF_CIAP' Then
          QLcto1COD_CONTROLE_CREDITO_ICMS_DIF.Value := Trunc(wCodDoc);
        If wTipoDoc = 'DEP_INC' Then
          QLcto1COD_PATRIMONIO_INCORPORACAO.Value := Trunc(wCodDoc);
        If wTipoDoc = 'BAIXA_P' Then
          QLcto1COD_PATRIMONIO_BAIXA.Value := Trunc(wCodDoc);
        If wTipoDoc = 'BAIXA_DEP_ACUM' Then
          QLcto1COD_PATRIMONIO_BAIXA_DEP_ACUM.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CCFUTURA' Then
          QLcto1COD_CONTRATO.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CGPRECO' Then
          QLcto1COD_CONTRATO_GP.Value := Trunc(wCodDoc);
        If wTipoDoc = 'CVENDA' Then
          QLcto1COD_CONTRATO_VEND.Value := Trunc(wCodDoc);
        If wTipoDoc = 'ARROZ' Then
          QLcto1COD_CONTRATO_ARROZ.Value := Trunc(wCodDoc);
        //--FIM FABIANO

        QLcto1Cod_Generico.Value := Trunc(wCodDoc);

        If vCont = 1 then
        Begin
          QLcto1Ind_Operacao.Value := 'C';
          QLcto1Val_Lancamento.Value := -wVlrLcto;
          QLcto1Cod_Plano_Conta.Value := DMPlanilha.CodConta(Trunc(wFilial),vCtCred);
        End
        Else
        Begin
          QLcto1Ind_Operacao.Value := 'D';
          QLcto1Val_Lancamento.Value := wVlrLcto;
          QLcto1Cod_Plano_Conta.Value := DMPlanilha.CodConta(Trunc(wFilial),vCtDeb);
        End;
        QLcto1Desc_Complemento.Value := wNumDoc ;
        QLcto1Cod_Historico_Contabil.Value := Trunc(wCodHistorico);
        QLcto1Dt_Lancamento.Value := wDtLcto;
        QLcto1.Post;
      End;
    End;
  Except
    If QLcto1.State in [dsEdit,dsInsert] then
      QLcto1.Cancel;
    Raise;
  End;
End;

Procedure TDMPlanilha.GravaLanc(wTipoDoc : String;
                                wCodDoc  : Real;
                                WNumDoc  : String;
                                wFilial  : integer;
                                wConta,
                                wOperacao : String;
                                wCodCompl ,
                                wCodHistorico,
                                wVlrLcto  : Real;
                                wDtLcto   : TDateTime;
                                wContrapartida : String );
Var vConta : String;
Begin
  If wFilial > 90 Then
     Exit;
  If (wVlrLcto > 0) and (Trim(wConta) <> '') then
  Try
    If Trim(wConta) <> '' Then
    Begin
      If Length( Trim(wConta) ) in [9,7] Then // 9 = nivel Seis, 13 = nível Cinco
        vConta := Trim(wConta) + FormatFloat('000000',wCodCompl)
      Else
        If Length(Trim(wConta)) in [15,13] then
          vConta := Trim(wConta)
        Else
          Raise Exception.Create('Conta inválida: '+ wConta);

      If Length( Trim(wContrapartida) ) in [9,7] Then // 9 = nivel Seis, 13 = nível Cinco
        wContrapartida := Trim(wContrapartida) + FormatFloat('000000',wCodCompl);
      QRegPlanoConta.Close;
      QRegPlanoConta.SetVariable('CONTA',vConta);
      If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
        QRegPlanoConta.SetVariable('FILIAL',wFilial)
      Else
        QRegPlanoConta.SetVariable('FILIAL',1); // Matriz
      QRegPlanoConta.Open;
      If QRegPlanoContaCod_Plano_Conta.Value = 0 then
      Begin
        Try
          QRegPlanoConta.Open;
          QRegPlanoConta.Insert;
//          QRegPlanoContaCod_Plano_Conta.Value := DMOracle.Sequencia('PLANO_CONTA');
          QRegPlanoContaNum_Plano_Conta.Value := vConta;
          QRegPlanoContaNum_Grau.Value := DMParamSistema.QParamSistemaNum_Graus_Contabil.Value;
          If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL' Then
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(wFilial,'COD_REDUZIDO');;
            QRegPlanoContaCod_Filial.Value := wFilial;
           End
          Else
           Begin
            QRegPlanoContaCod_Reduzido.Value := DMSequencia.Sequencia(1,'COD_REDUZIDO');;
            QRegPlanoContaCod_Filial.Value := 1;
           End;
          QRegPlanoContaDesc_Plano_Conta.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(wCodCompl));
          QRegPlanoConta.Post;
        Except
          If QRegPlanoConta.State = dsInsert then
            QRegPlanoConta.Cancel;
          ShowMessage('Não foi possível incluir nova conta de Crédito!');
          Raise;
        End;
      End;
      QLcto1.Close;
      QLcto1.SetVariable('COD_LANCTO_CONTABIL',0);
      QLcto1.Open;
      QLcto1.Insert;
      QLcto1Cod_Lancto_Contabil.Value := DMOracle.Sequencia('LANCTO_CONTABIL');
      QLcto1Cod_Filial.Value := Trunc(wFilial);
      If (wTipoDoc = 'NFE') OR (wTipoDoc = 'NFS') Then
        QLcto1Cod_Nota_Cab.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CP' Then
      Begin
        QLcto1Cod_Conta_Pagar_Cab.Value := Trunc(wCodDoc);
        wCodDoc := QLcto1Cod_Lancto_Contabil.Value;
      End;
      If wTipoDoc = 'CR' Then
      Begin
        QLcto1Cod_Contas_Receber_Cab.Value := Trunc(wCodDoc);
        wCodDoc := QLcto1Cod_Lancto_Contabil.Value;
      End;
      If wTipoDoc = 'CX' Then
        QLcto1Cod_Caixa_Mov.Value := Trunc(wCodDoc);
      If wTipoDoc = 'BC' Then
        QLcto1Cod_Bco_Movimento.Value := Trunc(wCodDoc);
      If wTipoDoc = 'RPA' Then
        QLcto1Num_Rpa.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CNH' Then
        QLcto1Cod_Conhecimento_Frete.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EST' Then
        QLcto1Cod_Estadia.Value := Trunc(wCodDoc);
      If wTipoDoc = 'OBRA' Then
        QLcto1Cod_Obra.Value := Trunc(wCodDoc);
      //ALTERADO FABIANO: 06/08/2004
      If wTipoDoc = 'DEP' Then
        QLcto1COD_DEPRECIACAO_PATRIMONIO.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CIAP' Then
        QLcto1COD_CONTROLE_CREDITO_ICMS.Value := Trunc(wCodDoc);
      If wTipoDoc = 'DIF_CIAP' Then
        QLcto1COD_CONTROLE_CREDITO_ICMS_DIF.Value := Trunc(wCodDoc);
      If wTipoDoc = 'DEP_INC' Then
        QLcto1COD_PATRIMONIO_INCORPORACAO.Value := Trunc(wCodDoc);
      If wTipoDoc = 'BAIXA_P' Then
        QLcto1COD_PATRIMONIO_BAIXA.Value := Trunc(wCodDoc);
      If wTipoDoc = 'BAIXA_DEP_ACUM' Then
        QLcto1COD_PATRIMONIO_BAIXA_DEP_ACUM.Value := Trunc(wCodDoc);
      If wTipoDoc = 'ICMS' Then
        QLcto1COD_PATRIMONIO_ICMS.Value := Trunc(wCodDoc);
      If wTipoDoc = 'OPER_ACC' then
        QLcto1COD_OPERACAO_CAMBIO_ACC.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EGF' then
        QLcto1COD_EGF.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EGF_LIQ' then
        QLcto1COD_EGF_LIQ.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EGF_LIQ_JURO' then
        QLcto1COD_EGF_LIQ_JURO.Value := Trunc(wCodDoc);
      If wTipoDoc = 'VC_ACC' then
        QLcto1COD_VARIACAO_CAMBIAL_ACC.Value := Trunc(wCodDoc);
      If wTipoDoc = 'OPER_SWP' then
        QLcto1COD_OPERACAO_CAMBIO_SWP.Value := Trunc(wCodDoc);
      If wTipoDoc = 'OPER_EPT' then
        QLcto1COD_OPERACAO_CAMBIO_EPT.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EPT_LIQ' then
        QLcto1COD_OPERACAO_CAMBIO_EPT_LIQ.Value := Trunc(wCodDoc);
      If wTipoDoc = 'EPT_LIQ_JURO' then
        QLcto1COD_OPERACAO_CAMBIO_EPT_LIQ_J.Value := Trunc(wCodDoc);
      If wTipoDoc = 'VC_SWP' then
        QLcto1COD_VARIACAO_CAMBIAL_SWP.Value := Trunc(wCodDoc);
      If wTipoDoc = 'VC_EPT' then
        QLcto1COD_VARIACAO_CAMBIAL_EPT.Value := Trunc(wCodDoc);
      If wTipoDoc = 'TRANSF_CX' then
        QLcto1COD_CAIXA_TRANSF_CAB.Value := Trunc(wCodDoc);
      If wTipoDoc = 'APLIC_FINANC' then
        QLcto1COD_APLICACAO_FINANCEIRA_MOV.Value := Trunc(wCodDoc);
      If wTipoDoc = 'MOV_APLIC_FIN' then
        QLcto1COD_APLICACAO_FINANCEIRA_MOV.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CCFUTURA' then
        QLcto1COD_CONTRATO.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CGPRECO' then
        QLcto1COD_CONTRATO_GP.Value := Trunc(wCodDoc);
      If wTipoDoc = 'CVENDA' then
        QLcto1COD_CONTRATO_VEND.Value := Trunc(wCodDoc);
      If wTipoDoc = 'ARROZ' then
        QLcto1COD_CONTRATO_ARROZ.Value := Trunc(wCodDoc);
      If wTipoDoc = 'IND' then
        QLcto1COD_BOLETIM_INDUSTRIA.Value := Trunc(wCodDoc);
      //--FIM FABIANO
      QLcto1Cod_Generico.Value := Trunc(wCodDoc);
      If wOperacao = 'CREDITO' then
      Begin
        QLcto1Ind_Operacao.Value := 'C';
        QLcto1Val_Lancamento.Value := -wVlrLcto;
      end
      Else
        If wOperacao = 'DEBITO' then
        Begin
          QLcto1Ind_Operacao.Value := 'D';
          QLcto1Val_Lancamento.Value := wVlrLcto;
        End;
      QLcto1Cod_Plano_Conta.Value := DMPlanilha.CodConta(Trunc(wFilial),vConta);
      QLcto1Desc_Complemento.Value := wNumDoc ;
      if Trunc(wCodHistorico) <> 0 then
        QLcto1Cod_Historico_Contabil.Value := Trunc(wCodHistorico)
      else
        raise Exception.Create('Histório Contábil não cadastrado para esta operação.');
      QLcto1Dt_Lancamento.Value := wDtLcto;
      QLcto1Num_Contrapartida.Value := wContrapartida;
      QLcto1.Post;
    End; // wConta <> ''
  Except
    If QLcto1.State in [dsEdit,dsInsert] then
      QLcto1.Cancel;
    Raise;
  End;
End;

Procedure TDMPlanilha.Descontabiliza(wNumDoc : Integer; wTipoDoc :String);
Begin
  QLcto.Close;
  QLcto.SetVariable('COD_NOTA_CAB',Null);
  QLcto.SetVariable('COD_CONTA_PAGAR_CAB',Null);
  QLcto.SetVariable('COD_CONTA_RECEBER_CAB',Null);
  QLcto.SetVariable('COD_CAIXA_MOV',Null);
  QLcto.SetVariable('COD_BCO_MOVIMENTO',Null);
  QLcto.SetVariable('COD_LANCTO_CONTABIL',Null);
  QLcto.SetVariable('NUM_RPA',Null);
  QLcto.SetVariable('COD_CONHECIMENTO_FRETE',Null);
  QLcto.SetVariable('COD_ESTADIA',Null);
  QLcto.SetVariable('COD_OBRA',Null);
  //ALTERADO FABIANO: 05/08/2004
  QLcto.SetVariable('COD_DEPRECIACAO_PATRIMONIO',Null);
  QLcto.SetVariable('COD_CONTROLE_CREDITO_ICMS',Null);
  QLcto.SetVariable('COD_CONTROLE_CREDITO_ICMS_DIF',Null);
  QLcto.SetVariable('COD_PATRIMONIO_INCORPORACAO',Null);
  QLcto.SetVariable('COD_PATRIMONIO_BAIXA',Null);
  QLcto.SetVariable('COD_PATRIMONIO_BAIXA_DEP_ACUM',Null);
  QLcto.SetVariable('COD_PATRIMONIO_ICMS',Null);
  QLcto.SetVariable('COD_OPERACAO_CAMBIO_ACC',Null);
  QLcto.SetVariable('COD_EGF',Null);
  QLcto.SetVariable('COD_EGF_LIQ',Null);
  QLcto.SetVariable('COD_EGF_LIQ_JURO',Null);
  QLcto.SetVariable('COD_VARIACAO_CAMBIAL_ACC',Null);
  QLcto.SetVariable('COD_OPERACAO_CAMBIO_SWP',Null);
  QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT',Null);
  QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT_LIQ',Null);
  QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT_LIQ_J',Null);
  QLcto.SetVariable('COD_VARIACAO_CAMBIAL_SWP',Null);
  QLcto.SetVariable('COD_VARIACAO_CAMBIAL_EPT',Null);
  QLcto.SetVariable('COD_CAIXA_TRANSF_CAB',Null);
  QLcto.SetVariable('COD_CONTRATO',Null);
  QLcto.SetVariable('COD_CONTRATO_GP',Null);
  QLcto.SetVariable('COD_CONTRATO_VEND',Null);
  QLcto.SetVariable('COD_CONTRATO_ARROZ',Null);
  QLcto.SetVariable('COD_BOLETIM_INDUSTRIA',Null);
  //FIM FABIANO
  QLcto.SetVariable('COD_GENERICO',wNumDoc);

  If (wTipoDoc = 'NFE') OR (wTipoDoc = 'NFS') Then
      QLcto.SetVariable('COD_NOTA_CAB',wNumDoc)
  Else
  Begin
    If wTipoDoc = 'CP' Then
      QLcto.SetVariable('COD_CONTA_PAGAR_CAB',wNumDoc)
    Else
      If wTipoDoc = 'CR' Then
        QLcto.SetVariable('COD_CONTA_RECEBER_CAB',wNumDoc)
      Else
        If wTipoDoc = 'CX' Then
          QLcto.SetVariable('COD_CAIXA_MOV',wNumDoc)
        Else
          If wTipoDoc = 'BC' Then
            QLcto.SetVariable('COD_BCO_MOVIMENTO',wNumDoc)
          Else
            If wTipoDoc = 'CR_CP_MOV' Then
              QLcto.SetVariable('COD_LANCTO_CONTABIL',wNumDoc)
            Else
              If wTipoDoc = 'RPA' Then
                QLcto.SetVariable('NUM_RPA',wNumDoc)
              Else
                If wTipoDoc = 'CNH' Then
                  QLcto.SetVariable('COD_CONHECIMENTO_FRETE',wNumDoc)
                Else
                  If wTipoDoc = 'EST' Then
                    QLcto.SetVariable('COD_ESTADIA',wNumDoc)
                  Else
                    If wTipoDoc = 'OBRA' Then
                      QLcto.SetVariable('COD_OBRA',wNumDoc)
                    Else //ALTERADO FABIANO: 06/08/2004.........................
                      If wTipoDoc = 'DEP' Then
                        QLcto.SetVariable('COD_DEPRECIACAO_PATRIMONIO',wNumDoc)
                      else
                        If wTipoDoc = 'CIAP' Then
                          QLcto.SetVariable('COD_CONTROLE_CREDITO_ICMS',wNumDoc)
                        else
                          If wTipoDoc = 'DIF_CIAP' Then
                            QLcto.SetVariable('COD_CONTROLE_CREDITO_ICMS_DIF',wNumDoc)
                          else
                            If wTipoDoc = 'DEP_INC' Then
                              QLcto.SetVariable('COD_PATRIMONIO_INCORPORACAO',wNumDoc)
                            else
                              If wTipoDoc = 'BAIXA_P' Then
                                QLcto.SetVariable('COD_PATRIMONIO_BAIXA',wNumDoc)
                              else
                                If wTipoDoc = 'BAIXA_DEP_ACUM' Then
                                  QLcto.SetVariable('COD_PATRIMONIO_BAIXA_DEP_ACUM',wNumDoc)
                                else
                                  If wTipoDoc = 'ICMS' Then
                                    QLcto.SetVariable('COD_PATRIMONIO_ICMS',wNumDoc)
                                  else
                                    if wTipoDoc = 'OPER_ACC' then
                                      QLcto.SetVariable('COD_OPERACAO_CAMBIO_ACC',wNumDoc)
                                    else
                                      if wTipoDoc = 'EGF' then
                                        QLcto.SetVariable('COD_EGF',wNumDoc)
                                      else
                                        if wTipoDoc = 'EGF_LIQ' then
                                          QLcto.SetVariable('COD_EGF_LIQ',wNumDoc)
                                        else
                                          if wTipoDoc = 'EGF_LIQ_JURO' then
                                            QLcto.SetVariable('COD_EGF_LIQ_JURO',wNumDoc)
                                          else
                                            if wTipoDoc = 'VC_ACC' then
                                              QLcto.SetVariable('COD_VARIACAO_CAMBIAL_ACC',wNumDoc)
                                            else
                                              if wTipoDoc = 'OPER_SWP' then
                                                QLcto.SetVariable('COD_OPERACAO_CAMBIO_SWP',wNumDoc)
                                              else
                                                if wTipoDoc = 'OPER_EPT' then
                                                  QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT',wNumDoc)
                                                else
                                                  if wTipoDoc = 'EPT_LIQ' then
                                                    QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT_LIQ',wNumDoc)
                                                  else
                                                    if wTipoDoc = 'EPT_LIQ_JURO' then
                                                      QLcto.SetVariable('COD_OPERACAO_CAMBIO_EPT_LIQ_J',wNumDoc)
                                                    else
                                                      if wTipoDoc = 'VC_SWP' then
                                                        QLcto.SetVariable('COD_VARIACAO_CAMBIAL_SWP',wNumDoc)
                                                      else
                                                        if wTipoDoc = 'VC_EPT' then
                                                          QLcto.SetVariable('COD_VARIACAO_CAMBIAL_EPT',wNumDoc)
                                                        else
                                                          if wTipoDoc = 'TRANSF_CX' then
                                                             QLcto.SetVariable('COD_CAIXA_TRANSF_CAB',wNumDoc)
                                                        else
                                                          if wTipoDoc = 'CCFUTURA' then
                                                             QLcto.SetVariable('COD_CONTRATO',wNumDoc)
                                                          else
                                                            if wTipoDoc = 'CGPRECO' then
                                                               QLcto.SetVariable('COD_CONTRATO_GP',wNumDoc)
                                                            else
                                                              if wTipoDoc = 'CVENDA' then
                                                                 QLcto.SetVariable('COD_CONTRATO_VEND',wNumDoc)
                                                              else
                                                                if wTipoDoc = 'ARROZ' then
                                                                   QLcto.SetVariable('COD_CONTRATO_ARROZ',wNumDoc)
                                                                else
                                                                   if wTipoDoc = 'IND' then
                                                                      QLcto.SetVariable('COD_BOLETIM_INDUSTRIA',wNumDoc)
                                                                   else
                                                                   //FIM FABIANO
                                                                      Raise Exception.Create('Tipo de documento Inválido!');
    end;

//  QLcto.Close;
  QLcto.Open;
  While QLctoCod_Lancto_Contabil.Value > 0  do
  begin
    QApagaLcto.Close;
    QApagaLcto.SetVariable('COD',QLctoCod_Lancto_contabil.Value);
    QApagaLcto.ExecSQL;
    QLcto.Close;
    QLcto.Open;
    // QLcto.First;
  end;
  QLcto.Close;
End;

Function TDMPlanilha.NivelSuperior(wConta:String):String;
Begin
  If Length(wConta) = 15 then       // Ultimo Nivel Plano com 6 Niveis
    Result := Copy(wConta,1,9)
  Else
    If Length(wConta) = 13 then     // Ultimo Nivel Plano com 5 Niveis
      Result := Copy(wConta,1,7)
    Else
      If Length(wConta) = 11 then   // Ultimo Nivel Plano com 4 Niveis
        Result := Copy(wConta,1,5)
      Else
        If Length(wConta) > 1 Then  // Nivel 2 acima
          Result := Copy(wConta,1,Length(wConta)-2)
        Else
          Result := '';
End;

Procedure TDMPlanilha.AtzSaldoContabil(wOperacao:String;wFilial,wCodPlano,wValor : Real; wDataLanc:TDateTime);
Var wNum_Conta : String;
    wCod_num_Conta : Real;
    wAno, wMes, wDia : Word;
    wSaldoAnterior : Real;
Begin
  if Not(ExisteZeramento(wFilial,wDataLanc)) then //Verifica se já foi feito Zeramento de Exercício
    begin
      With DMPlanoConta do
      Begin
        QPlanoConta.Close;
        QPlanoConta.SetVariable('PK',wCodPlano);
        QPlanoConta.Open;
        wNum_Conta := QPlanoContaNum_Plano_Conta.Value;
        DecodeDate(wDataLanc,wAno,wMes,wDia);
        While wNum_Conta <> '' do
        Begin
          wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
          QSaldoContabil.Close;
          QSaldoContabil.SetVariable('FILIAL',wFilial);
          QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
          QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
          QSaldoContabil.Open;
          If Trim(QSaldoContabilCod_Plano_Conta.Text) <> '' Then
            QSaldoContabil.Edit
          Else
          Begin
            QSaldoContabil.Close;
            If wMes = 1 then
              QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno-1)+'12'))
            Else
              QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes-1)));
            QSaldoContabil.Open;
            wSaldoAnterior := QSaldoContabilVal_Atual.Value;
            QSaldoContabil.Insert;
            QSaldoContabilCod_Filial.Value := Trunc(wFilial);
            QSaldoContabilCod_Plano_Conta.Value := Trunc(wCod_Num_Conta);
            QSaldoContabilDt_Ano_Mes.Value := StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes));
            QSaldoContabilVal_Anterior.Value := wSaldoAnterior;
            QSaldoContabilVal_Atual.Value := wSaldoAnterior;
            QSaldoContabilVal_Debito.Value := 0;
            QSaldoContabilVal_Credito.Value := 0;
          End;
          QSaldoContabilVal_Atual.Value := QSaldoContabilVal_Atual.Value+wValor;
          If wOperacao = 'D' Then
            QSaldoContabilVal_Debito.Value := QSaldoContabilVal_Debito.Value+wValor
          Else
            QSaldoContabilVal_Credito.Value := QSaldoContabilVal_Credito.Value+wValor;
          QSaldoContabil.Post;

          QAtzSaldoPost.Close;
          QAtzSaldoPost.SetVariable('FILIAL',wFilial);
          QAtzSaldoPost.SetVariable('COD_CONTA',wCod_Num_Conta);
          QAtzSaldoPost.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
          If wOperacao = 'D' Then
          Begin
            QAtzSaldoPost.SetVariable('VL_DEBITO',wValor);
            QAtzSaldoPost.SetVariable('VL_CREDITO',0);
          End
          Else
          Begin
            QAtzSaldoPost.SetVariable('VL_DEBITO',0);
            QAtzSaldoPost.SetVariable('VL_CREDITO',wValor);
          End;
          QAtzSaldoPost.ExecSQL;

          wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
        End;
      End;
    end
  else
    begin
      raise Exception.Create('Erro! Não é possível fazer Lançamentos Retroativos'+#13+
                             'ou Excluir Lançamentos em um período no qual já foi'+#13+
                             'feito o Zeramento de Exercício.'+#13+
                             'Favor Contactar o Contador ou Responsável.');
    end;
End;

procedure TDMPlanilha.QLanctoContabilCadAfterInsert(DataSet: TDataSet);
begin
  if wPlanilha > 0 then
    QLanctoContabilCadCod_Planilha.Value := wPlanilha;
  If wDt_Lancto1 = '' Then
     QLanctoContabilCadDt_lancamento.Value := Date
  Else
     QLanctoContabilCadDt_lancamento.Value := StrToDate(wDt_Lancto1);
  QLanctoContabilCadInd_Operacao.Value := 'D';
  QLanctoContabilCadCod_Filial.Value:=wLocalLancto1;
  if DmParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI' Then
   Begin
     QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value := wHist_lancto;
     QLanctoContabilCadCOD_PLANO_CONTA.Value := wPlano_lancto1;
     QLanctoContabilCadDESC_COMPLEMENTO.Value := wComplemento;
   End;
end;

procedure TDMPlanilha.QLanctoContabilCadBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  wPlanilha:=QLanctoContabilCadCod_Planilha.Value;
end;

procedure TDMPlanilha.QLanctoContabilCadBeforePost(DataSet: TDataSet);
begin
  if QLanctoContabilCadInd_operacao.Value = 'C' then
    QLanctoContabilCadVal_Lancamento.Value:=abs(QLanctoContabilCadVal_Lancamento.Value)*(-1)
  else
    QLanctoContabilCadVal_Lancamento.Value:=abs(QLanctoContabilCadVal_Lancamento.Value);
  If Not DMUsuario.ContabilPrivilegiado Then
     if QLanctoContabilCadDt_Lancamento.Value>DMoracle.UltimoDiaMes(Now) then
        raise Exception.Create('Erro! O Mês da Data de Lançamento é superior ao do Mês Atual.'+#13+'Favor corrigir este Campo.');
end;

procedure TDMPlanilha.QLanctoContabilCadAfterPost(DataSet: TDataSet);
begin
  if DMPlanilha.QLanctoContabilCadInd_Atualiza_Saldo.Value = 'SIM' Then
     DMPlanilha.AtzSaldoContabil(QLanctoContabilCadInd_Operacao.Value,QLanctoContabilCadCod_Filial.Value,QLanctoContabilCadCod_Plano_Conta.Value,QLanctoContabilCadVal_Lancamento.Value,QLanctoContabilCadDt_Lancamento.Value);
  wLocalLancto1 := DMPlanilha.QLanctoContabilCadCod_Filial.Value;
  wHist_lancto := QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value;
  wPlano_lancto1 := QLanctoContabilCadCOD_PLANO_CONTA.Value;
  wDt_Lancto1 := DateToStr(QLanctoContabilCadDt_lancamento.Value);
  wComplemento := QLanctoContabilCadDESC_COMPLEMENTO.Value;

end;

procedure TDMPlanilha.QLanctoContabilCadBeforeDelete(DataSet: TDataSet);
begin
  If QLanctoContabilCadInd_Atualiza_Saldo.Value = 'SIM' Then
    DMPlanilha.AtzSaldoContabil(QLanctoContabilCadInd_Operacao.Value,QLanctoContabilCadCod_Filial.Value,QLanctoContabilCadCod_Plano_Conta.Value,-QLanctoContabilCadVal_Lancamento.Value,QLanctoContabilCadDt_Lancamento.Value);
end;

procedure TDMPlanilha.QLanctoContabilCadAfterEdit(DataSet: TDataSet);
begin
  If QLanctoContabilCadInd_Atualiza_Saldo.Value = 'SIM' Then
     DMPlanilha.AtzSaldoContabil(QLanctoContabilCadInd_Operacao.Value,QLanctoContabilCadCod_Filial.Value,QLanctoContabilCadCod_Plano_Conta.Value,-QLanctoContabilCadVal_Lancamento.Value,QLanctoContabilCadDt_Lancamento.Value);

end;

procedure TDMPlanilha.QLanctoContabilCadBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPlanilha.QSaldoContabilAfterInsert(DataSet: TDataSet);
begin
  QSaldoContabilCod_Filial.Value:=1;
end;

Procedure TDMPlanilha.ZeraExSaldoContabil(wOperacao:String;wFilial,wCodPlano,wValor : Real; wDataLanc:TDateTime);
Var wNum_Conta : String;
    wCod_num_Conta : Integer;
    wAno, wMes, wDia : Word;
Begin
  With DMPlanoConta do
  Begin
    QPlanoConta.Close;
    QPlanoConta.SetVariable('PK',wCodPlano);
    QPlanoConta.Open;
    wNum_Conta := QPlanoContaNum_Plano_Conta.Value;
    DecodeDate(wDataLanc,wAno,wMes,wDia);
    While wNum_Conta <> '' do
    Begin
      wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
      QSaldoContabil.Close;
      QSaldoContabil.SetVariable('FILIAL',wFilial);
      QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
      QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
      QSaldoContabil.Open;

      If Trim(QSaldoContabilCod_Plano_Conta.Text) <> '' Then
        QSaldoContabil.Edit;
      If QSaldoContabilVal_Saldo_DRE.Value = 0 then
        QSaldoContabilVal_Saldo_DRE.Value := QSaldoContabilVal_Atual.Value;
      QSaldoContabilVal_Atual.Value := QSaldoContabilVal_Atual.Value+wValor;
      If wOperacao = 'D' Then
        QSaldoContabilVal_Debito.Value := QSaldoContabilVal_Debito.Value+wValor
      Else
        QSaldoContabilVal_Credito.Value := QSaldoContabilVal_Credito.Value+wValor;
      QSaldoContabil.Post;

      QAtzSaldoPost.Close;
      QAtzSaldoPost.SetVariable('FILIAL',wFilial);
      QAtzSaldoPost.SetVariable('COD_CONTA',wCod_Num_Conta);
      QAtzSaldoPost.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
      If wOperacao = 'D' Then
      Begin
        QAtzSaldoPost.SetVariable('VL_DEBITO',wValor);
        QAtzSaldoPost.SetVariable('VL_CREDITO',0);
      End
      Else
      Begin
        QAtzSaldoPost.SetVariable('VL_DEBITO',0);
        QAtzSaldoPost.SetVariable('VL_CREDITO',wValor);
      End;
      QAtzSaldoPost.ExecSQL;

      wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
    End;
  End;
End;

function TDMPlanilha.ExisteZeramento(wFilial: Real; wData:TDateTime): Boolean;
var
  wAno,wMes,wDia:Word;
begin
  QVerificaZeramento.Close;
  DecodeDate(wData,wAno,wMes,wDia);
  QVerificaZeramento.SetVariable('DT_ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
  QVerificaZeramento.SetVariable('COD_FILIAL',wFilial);
  QVerificaZeramento.Open;
  if QVerificaZeramentoNum.Value = 0 then
    Result:=False
  else
    Result:=True;
end;

procedure TDMPlanilha.QVoltaZeraBeforeDelete(DataSet: TDataSet);
begin
  DMPlanilha.AtzSaldoContabil(QVoltaZeraInd_Operacao.Value,
                              QVoltaZeraCod_Filial.Value,
                              QVoltaZeraCod_Plano_Conta.Value,
                              -QVoltaZeraVal_Lancamento.Value,
                              QVoltaZeraDt_Lancamento.Value);
end;

procedure TDMPlanilha.SalvaSaldoContabil(wFilial,wCodPlano:Real;
                                         wDataLanc: TDateTime);
Var wNum_Conta : String;
    wCod_num_Conta : Integer;
    wAno, wMes, wDia : Word;
Begin
  With DMPlanoConta do
  Begin
    QPlanoConta.Close;
    QPlanoConta.SetVariable('PK',wCodPlano);
    QPlanoConta.Open;
    wNum_Conta := QPlanoContaNum_Plano_Conta.Value;
    DecodeDate(wDataLanc,wAno,wMes,wDia);
    While wNum_Conta <> '' do
    Begin
      wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
      QSaldoContabil.Close;
      QSaldoContabil.SetVariable('FILIAL',wFilial);
      QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
      QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
      QSaldoContabil.Open;
      If Trim(QSaldoContabilCod_Plano_Conta.Text) <> '' Then
        QSaldoContabil.Edit;
      If QSaldoContabilVal_Saldo_DRE.Value = 0 then
        QSaldoContabilVal_Saldo_DRE.Value:=QSaldoContabilVal_ATUAL.Value;
      QSaldoContabil.Post;
      wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
    End;
  End;
End;

procedure TDMPlanilha.AtzSaldoContabilCZ(wOperacao: String; wFilial,
  wCodPlano, wValor: Real; wDataLanc: TDateTime);
Var wNum_Conta : String;
    wCod_num_Conta : Integer;
    wAno, wMes, wDia : Word;
    wSaldoAnterior : Real;
Begin
    With DMPlanoConta do
      Begin
        QPlanoConta.Close;
        QPlanoConta.SetVariable('PK',wCodPlano);
        QPlanoConta.Open;
        wNum_Conta := QPlanoContaNum_Plano_Conta.Value;
        DecodeDate(wDataLanc,wAno,wMes,wDia);
        While wNum_Conta <> '' do
        Begin
          wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
          QSaldoContabil.Close;
          QSaldoContabil.SetVariable('FILIAL',wFilial);
          QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
          QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
          QSaldoContabil.Open;
          If Trim(QSaldoContabilCod_Plano_Conta.Text) <> '' Then
            QSaldoContabil.Edit
          Else
          Begin
            // Pegar o Saldo Anterior
            QSaldoContabil.Close;
            If wMes = 1 then
              QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno-1)+'12'))
            Else
              QSaldoContabil.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes-1)));
            QSaldoContabil.Open;
            wSaldoAnterior := QSaldoContabilVal_Atual.Value;
            QSaldoContabil.Insert;
            QSaldoContabilCod_Filial.Value := Trunc(wFilial);
            QSaldoContabilCod_Plano_Conta.Value := wCod_Num_Conta;
            QSaldoContabilDt_Ano_Mes.Value := StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes));
            QSaldoContabilVal_Anterior.Value := wSaldoAnterior;
            QSaldoContabilVal_Atual.Value := wSaldoAnterior;
            QSaldoContabilVal_Debito.Value := 0;
            QSaldoContabilVal_Credito.Value := 0;
          End;
          QSaldoContabilVal_Atual.Value := QSaldoContabilVal_Atual.Value+wValor;
          If wOperacao = 'D' Then
            QSaldoContabilVal_Debito.Value := QSaldoContabilVal_Debito.Value+wValor
          Else
            QSaldoContabilVal_Credito.Value := QSaldoContabilVal_Credito.Value+wValor;
          QSaldoContabil.Post;

          // Atualização dos Saldos dos Meses Seguintes ( Lcto. Retroativos )
          QAtzSaldoPost.Close;
          QAtzSaldoPost.SetVariable('FILIAL',wFilial);
          QAtzSaldoPost.SetVariable('COD_CONTA',wCod_Num_Conta);
          QAtzSaldoPost.SetVariable('ANO_MES',StrToInt(FormatFloat('0000',wAno)+FormatFloat('00',wMes)));
          If wOperacao = 'D' Then
          Begin
            QAtzSaldoPost.SetVariable('VL_DEBITO',wValor);
            QAtzSaldoPost.SetVariable('VL_CREDITO',0);
          End
          Else
          Begin
            QAtzSaldoPost.SetVariable('VL_DEBITO',0);
            QAtzSaldoPost.SetVariable('VL_CREDITO',wValor);
          End;
          QAtzSaldoPost.ExecSQL;

          wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
        End;
      End;
End;

Procedure TDMPlanilha.ImplantaSaldo(wOperacao :string; wFilial:Integer; wNumPlano:String; SaldoAnterior,SaldoAtual : Real; wDataLanc:Real);
var wNum_Conta : String;
    wCod_Num_Conta : Integer;
    Num_Grau, Num_Grau2, Cont, Saldo_Anterior, Saldo_Atual : Real;
begin
  Saldo_Anterior := 0;
  Saldo_Atual    := 0; // Inicializa valor da variavel ROBSON 26/06/2000
  With DMPlanoConta do
    Begin
      DMOracle.DBCemapa.StartTransaction;
      wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNumPlano);
      Num_Grau := StrToFloat(DMOracle.BuscaNome('SELECT NUM_GRAU FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(wCod_Num_Conta)));
      Num_Grau2 := DMParamSistema.QParamSistemaNum_Graus_Contabil.Value;
      if Num_Grau = Num_Grau2 then
        begin
          wNum_Conta:=wNumPlano;
          if (wOperacao = 'I') then
          begin
              Try
                While wNum_Conta <> '' do
                  Begin
                    wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
                    QSaldoContabil.Close;
                    QSaldoContabil.SetVariable('FILIAL',wFilial);
                    QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
                    QSaldoContabil.SetVariable('ANO_MES',wDataLanc);
                    QSaldoContabil.Open;
                    If Trim(QSaldoContabilCod_Plano_Conta.Text) <> '' Then
                      QSaldoContabil.Edit
                    Else
                      Begin
                        QSaldoContabil.Insert;
                        QSaldoContabilCod_Filial.Value := Trunc(wFilial);
                        QSaldoContabilCod_Plano_Conta.Value := wCod_Num_Conta;
                        QSaldoContabilDt_Ano_Mes.Value := Trunc(wDataLanc);
                        QSaldoContabilVal_Debito.Value := 0;
                        QSaldoContabilVal_Credito.Value := 0;
                        QSaldoContabilVal_Saldo_DRE.Value := -1;
                      End;
                    QSaldoContabilVal_Atual.Value := QSaldoContabilVal_Atual.Value+SaldoAtual;
                    QSaldoContabilVal_Anterior.Value := QSaldoContabilVal_Anterior.Value+SaldoAnterior;
                    QSaldoContabil.Post;
                    wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
                  End;
                  DMOracle.DBCemapa.Commit;
              except
                DMOracle.DBCemapa.Rollback;
                Raise Exception.Create('Não foi possível incluir o saldo para esta conta.');
              end;
          end;
          if wOperacao = 'E' then
            begin
              if MessageDlg('Atenção! Este Procedimento irá apagar todos os saldos contábeis deste período'+#13+
                            'para esta conta, incluindo as contas de nível superior.',mtConfirmation,[mbYes,mbNo],0)=mrYes then
                 begin
                   Try
                     Cont:=0;
                     While wNum_Conta <> '' do
                       Begin
                         wCod_Num_Conta := DMPlanilha.CodConta(Trunc(wFilial),wNum_Conta);
                         Cont:=Cont+1;
                         if Cont=1 then
                           begin
                             Saldo_Atual:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_ATUAL FROM TB_SALDO_CONTABIL',
                                                                        'COD_FILIAL = '+FloatToStr(wFilial)+' AND COD_PLANO_CONTA = '
                                                                        +FloatToStr(wCod_Num_Conta)+' AND DT_ANO_MES = '+FloatToStr(wDataLanc)));

                             Saldo_Anterior:=StrToFloat(DMOracle.BuscaNome('SELECT VAL_ANTERIOR FROM TB_SALDO_CONTABIL',
                                                                        'COD_FILIAL = '+FloatToStr(wFilial)+' AND COD_PLANO_CONTA = '
                                                                        +FloatToStr(wCod_Num_Conta)+' AND DT_ANO_MES = '+FloatToStr(wDataLanc)));
                             Saldo_Anterior:= -Saldo_Anterior;
                             Saldo_Atual:= -Saldo_Atual;
                             QRemSaldo.Close;
                             QRemSaldo.SetVariable('COD_FILIAL',wFilial);
                             QRemSaldo.setVariable('COD_PLANO_CONTA',wCod_Num_Conta);
                             QRemSaldo.SetVariable('DT_ANO_MES',wDataLanc);
                             QRemSaldo.ExecSQL;
                           end
                         else
                           begin
                             QAtzSaldo_dt.Close;
                             QAtzSaldo_dt.SetVariable('COD_FILIAL',wFilial);
                             QAtzSaldo_dt.SetVariable('COD_PLANO_CONTA',wCod_Num_Conta);
                             QAtzSaldo_dt.SetVariable('DT_ANO_MES',wDataLanc);
                             QAtzSaldo_dt.SetVariable('VAL_ANTERIOR',Saldo_Anterior);
                             QAtzSaldo_dt.SetVariable('VAL_ATUAL',Saldo_Atual);
                             QAtzSaldo_dt.ExecSQL;
                           end;
                         wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
                       end;
                       DMOracle.DBCemapa.Commit;
                   except
                     DMOracle.DBCemapa.Rollback;
                     Raise Exception.Create('Erro ao tentar excluir este saldo.');
                   end;
                 end;
            end;
        end
      else
        begin
          DMOracle.DBCemapa.Rollback;
          Raise Exception.Create('Erro !! Não é possível implantar ou remover em '+#13+
                                 '  uma conta que não pertença ao último nível.');
        end;
    end;
End;

procedure TDMPlanilha.QLcto1BeforeDelete(DataSet: TDataSet);
begin
  If QLcto1Ind_Atualiza_Saldo.Value = 'SIM' Then
    DMPlanilha.AtzSaldoContabil(QLcto1Ind_Operacao.Value,QLcto1Cod_Filial.Value,QLcto1Cod_Plano_Conta.Value,-QLcto1Val_Lancamento.Value,QLcto1Dt_Lancamento.Value);
end;

procedure TDMPlanilha.QRRazaoAnaliticoCalcFields(DataSet: TDataSet);
Var wValSaldo, wAnoMes : String;
begin
  If Copy(DateToStr(pDataFinal),1,2) <> '01' Then
   Begin
    QRSomaRazao.Close;
    QRSomaRazao.SetVariable('PLANO_CONTA',QRRazaoAnaliticoCOD_PLANO_CONTA.Value);
    QRSomaRazao.SetVariable('FILIAL_Inicial',pFilial_Inicial);
    QRSomaRazao.SetVariable('FILIAL_Final',pFilial_Final);
    QRSomaRazao.SetVariable('DT_INICIAL',StrToDate('01/'+
                                                    copy(DateToStr(pDataFinal),4,2)+'/'+
                                                    copy(DateToStr(pDataFinal),7,4)));
    wAnoMes := copy(DateToStr(pDataFinal),7,4) + copy(DateToStr(pDataFinal),4,2);
    QRSomaRazao.SetVariable('DT_FINAL',pDataFinal);
    QRSomaRazao.Open;
//    if pFilial = 0 Then
//     Begin
       wValSaldo :=DMOracle.BuscaNome('SELECT SUM(VAL_ANTERIOR) FROM TB_SALDO_CONTABIL',
                                     'COD_PLANO_CONTA = '+FloatToStr(QRRazaoAnaliticoCOD_PLANO_CONTA.Value)
                                     +' AND DT_ANO_MES = '+wAnoMes + ' And Cod_Filial Between ' + IntToStr(pFilial_Inicial) + ' And ' +IntToStr(pFilial_Final));
       if wValSaldo = '' Then
          wValSaldo := '0';
       QRRazaoAnaliticoVal_Anterior.Value := StrToFloat(wValSaldo) + QRSomaRazaoSVal_Saldo.Value;
//     End
//    Else
//       QRRazaoAnaliticoVal_Anterior.Value := QRRazaoAnaliticoVal_Inicial.Value + QRSomaRazaoSVal_Saldo.Value;
   End
  Else
   Begin
//    if pFilial = 0 Then
//     Begin
       wAnoMes := copy(DateToStr(pDataFinal),7,4) + copy(DateToStr(pDataFinal),4,2);
       wValSaldo :=DMOracle.BuscaNome('SELECT SUM(VAL_ANTERIOR) FROM TB_SALDO_CONTABIL',
                                     'COD_PLANO_CONTA = '+FloatToStr(QRRazaoAnaliticoCOD_PLANO_CONTA.Value)
                                     +' AND DT_ANO_MES = ' + wAnoMes + ' And Cod_Filial Between ' + IntToStr(pFilial_Inicial) + ' And ' +IntToStr(pFilial_Final));
       if wValSaldo = '' Then
          wValSaldo := '0';
       QRRazaoAnaliticoVal_Anterior.Value := StrToFloat(wValSaldo);
//     End
//    Else  }
//      QRRazaoAnaliticoVal_Anterior.Value := QRRazaoAnaliticoVal_Inicial.Value;
   End;
end;

procedure TDMPlanilha.QLanctoContabilCad1AfterInsert(DataSet: TDataSet);
begin
//  QLanctoContabilCad1Cod_Lancto_Contabil.Value := DMOracle.Sequencia('LANCTO_CONTABIL');
  if wPlanilha>0 then
    QLanctoContabilCad1Cod_Planilha.Value := wPlanilha;
  If wDt_Lancto2 = '' Then
    QLanctoContabilCad1Dt_lancamento.Value := Date
  else
    QLanctoContabilCad1Dt_lancamento.Value := StrToDate(wDt_Lancto2);
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI' Then
   Begin
     QLanctoContabilCad1Ind_Operacao.Value := 'C';
     QLanctoContabilCad1Cod_Filial.Value:=wLocalLancto2;
     QLanctoContabilCad1Cod_Plano_Conta.Value := wPlano_lancto2;
   End;
end;

procedure TDMPlanilha.QLanctoContabilCad1AfterPost(DataSet: TDataSet);
begin
  if DMPlanilha.QLanctoContabilCad1Ind_Atualiza_Saldo.Value = 'SIM' Then
    DMPlanilha.AtzSaldoContabil(QLanctoContabilCad1Ind_Operacao.Value,QLanctoContabilCad1Cod_Filial.Value,QLanctoContabilCad1Cod_Plano_Conta.Value,QLanctoContabilCad1Val_Lancamento.Value,QLanctoContabilCad1Dt_Lancamento.Value);
  wLocalLancto2 := QLanctoContabilCad1Cod_Filial.Value;
  wPlano_lancto2 := QLanctoContabilCad1Cod_Plano_Conta.Value;
  wDt_Lancto2 := DateToStr(QLanctoContabilCad1Dt_lancamento.Value);   
end;

procedure TDMPlanilha.QLanctoContabilCad1BeforeDelete(DataSet: TDataSet);
begin
  If QLanctoContabilCad1Ind_Atualiza_Saldo.Value = 'SIM' Then
    DMPlanilha.AtzSaldoContabil(QLanctoContabilCad1Ind_Operacao.Value,QLanctoContabilCad1Cod_Filial.Value,QLanctoContabilCad1Cod_Plano_Conta.Value,-QLanctoContabilCad1Val_Lancamento.Value,QLanctoContabilCad1Dt_Lancamento.Value);

end;

procedure TDMPlanilha.QLanctoContabilCad1BeforePost(DataSet: TDataSet);
begin
  QLanctoContabilCad1Val_Lancamento.Value:=abs(QLanctoContabilCadVal_Lancamento.Value)*(-1);
  QLanctoContabilCad1Dt_lancamento.Value := QLanctoContabilCadDt_lancamento.Value;
  QLanctoContabilCad1Ind_Operacao.Value := 'C';
  QLanctoContabilCad1Cod_Historico_Contabil.Value := QLanctoContabilCadCod_Historico_Contabil.Value;
  QLanctoContabilCad1Desc_Complemento.Value := QLanctoContabilCadDesc_Complemento.Value;
end;

procedure TDMPlanilha.QLanctoContabilCad1AfterEdit(DataSet: TDataSet);
begin
  If QLanctoContabilCad1Ind_Atualiza_Saldo.Value = 'SIM' Then
     DMPlanilha.AtzSaldoContabil(QLanctoContabilCad1Ind_Operacao.Value,QLanctoContabilCad1Cod_Filial.Value,QLanctoContabilCad1Cod_Plano_Conta.Value,-QLanctoContabilCad1Val_Lancamento.Value,QLanctoContabilCad1Dt_Lancamento.Value);
end;

end.
