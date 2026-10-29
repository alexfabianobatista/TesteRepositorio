unit UCaixaRel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCaixaRel = class(TDataModule)
    QRCaixa_Det: TOracleDataSet1;
    QRCaixa_DetDT_MOVIMENTO: TDateTimeField;
    QRCaixa_DetDINHEIRO: TFloatField;
    QRCaixa_DetVALES: TFloatField;
    QRCaixa_DetCHEQUES: TFloatField;
    QRCaixa_DetOUTROS: TFloatField;
    QRCaixa_MovCaixa: TOracleDataSet1;
    QRCaixa_MovCaixaCOD_DEPARTAMENTO: TIntegerField;
    QRCaixa_MovCaixaCOD_CAIXA_MOV: TIntegerField;
    QRCaixa_MovCaixaCOD_USUARIO: TIntegerField;
    QRCaixa_MovCaixaCOD_FILIAL: TIntegerField;
    QRCaixa_MovCaixaCOD_HISTORICO: TIntegerField;
    QRCaixa_MovCaixaDT_MOVIMENTO: TDateTimeField;
    QRCaixa_MovCaixaVAL_MOVIMENTO: TFloatField;
    QRCaixa_MovCaixaDESC_HORARIO: TStringField;
    QRCaixa_MovCaixaCOD_CADASTRO: TIntegerField;
    QRCaixa_MovCaixaCOD_NOTA_CAB: TIntegerField;
    QRCaixa_MovCaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRCaixa_MovCaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRCaixa_MovCaixaDT_USUARIO: TDateTimeField;
    QRCaixa_MovCaixaDESC_DEPARTAMENTO: TStringField;
    QRCaixa_MovCaixaDESC_HISTORICO: TStringField;
    QRCaixa_MovCaixaIND_OPERACAO: TStringField;
    QRCaixa_MovCaixaDESC_COMPLEMENTO: TStringField;
    QRCaixa_MovCaixacomplemento: TStringField;
    QRCaixa_MovCaixaSint: TOracleDataSet1;
    QRCaixa_MovCaixaSintCREDITO: TFloatField;
    QRCaixa_MovCaixaSintDEBITO: TFloatField;
    QRCaixa_MovCaixaSintCOD_DEPARTAMENTO: TIntegerField;
    QRCaixa_MovCaixaSintCOD_HISTORICO: TIntegerField;
    QRCaixa_MovCaixaSintDT_MOVIMENTO: TDateTimeField;
    QRCaixa_MovCaixaSintDESC_HISTORICO: TStringField;
    QRCaixa_MovCaixaSintDESC_DEPARTAMENTO: TStringField;
    QRCaixa_MovCaixaSintIND_OPERACAO: TStringField;
    QRResLancBancoCaixa: TOracleDataSet1;
    QrCaixaMovHistorico: TOracleDataSet1;
    QrCaixaMovHistoricoCREDITO: TFloatField;
    QrCaixaMovHistoricoDEBITO: TFloatField;
    QrCaixaMovHistoricoCOD_HISTORICO: TIntegerField;
    QrCaixaMovHistoricoDESC_HISTORICO: TStringField;
    QrCaixaMovHistoricoIND_OPERACAO: TStringField;
    QRCaixa_ResLanc: TOracleDataSet1;
    QRCaixa_ResLancCOD_DEPARTAMENTO: TIntegerField;
    QRCaixa_ResLancCOD_HISTORICO: TIntegerField;
    QRCaixa_ResLancDESC_DEPARTAMENTO: TStringField;
    QRCaixa_ResLancDESC_HISTORICO: TStringField;
    QRCaixa_ResLancCREDITO: TFloatField;
    QRCaixa_ResLancDEBITO: TFloatField;
    QrSaldo_Fluxo_Caixa: TOracleDataSet1;
    QrSaldo_Fluxo_CaixaSALDO_BANCOS: TFloatField;
    QrSaldo_Fluxo_CaixaSALDO_CAIXA: TFloatField;
    QrSaldo_Fluxo_CaixaIND_FLUXO_CAIXA: TStringField;
    QrFluxo_Caixa_Cr_Cp: TOracleDataSet1;
    QRCaixa_MovSaldos: TOracleDataSet1;
    QRCaixa_MovSaldosCOD_HISTORICO: TIntegerField;
    QRCaixa_MovSaldosCOD_CAIXA_MOV: TIntegerField;
    QRCaixa_MovSaldosCOD_USUARIO: TIntegerField;
    QRCaixa_MovSaldosCOD_FILIAL: TIntegerField;
    QRCaixa_MovSaldosCOD_DEPARTAMENTO: TIntegerField;
    QRCaixa_MovSaldosDT_MOVIMENTO: TDateTimeField;
    QRCaixa_MovSaldosVAL_MOVIMENTO: TFloatField;
    QRCaixa_MovSaldosDESC_HORARIO: TStringField;
    QRCaixa_MovSaldosDESC_COMPLEMENTO: TStringField;
    QRCaixa_MovSaldosNUM_DOCUMENTO: TIntegerField;
    QRCaixa_MovSaldosCOD_CADASTRO: TIntegerField;
    QRCaixa_MovSaldosCOD_NOTA_CAB: TIntegerField;
    QRCaixa_MovSaldosCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRCaixa_MovSaldosCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRCaixa_MovSaldosDT_USUARIO: TDateTimeField;
    QRCaixa_MovSaldosIND_OPERACAO: TStringField;
    QRCaixa_MovSaldosDESC_HISTORICO: TStringField;
    QRCaixa_Lanc: TOracleDataSet1;
    QRCaixa_LancCOD_DEPARTAMENTO: TIntegerField;
    QRCaixa_LancCOD_CAIXA_MOV: TIntegerField;
    QRCaixa_LancCOD_USUARIO: TIntegerField;
    QRCaixa_LancCOD_FILIAL: TIntegerField;
    QRCaixa_LancCOD_HISTORICO: TIntegerField;
    QRCaixa_LancDT_MOVIMENTO: TDateTimeField;
    QRCaixa_LancVAL_MOVIMENTO: TFloatField;
    QRCaixa_LancDESC_HORARIO: TStringField;
    QRCaixa_LancNUM_DOCUMENTO: TIntegerField;
    QRCaixa_LancCOD_CADASTRO: TIntegerField;
    QRCaixa_LancCOD_NOTA_CAB: TIntegerField;
    QRCaixa_LancCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRCaixa_LancCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRCaixa_LancDT_USUARIO: TDateTimeField;
    QRCaixa_LancDESC_DEPARTAMENTO: TStringField;
    QRCaixa_LancDESC_HISTORICO: TStringField;
    QRCaixa_LancIND_OPERACAO: TStringField;
    QRCaixaDet: TOracleDataSet1;
    QRCaixaDetCOD_CAIXA_DET: TIntegerField;
    QRCaixaDetCOD_FILIAL: TIntegerField;
    QRCaixaDetCOD_DEPARTAMENTO: TIntegerField;
    QRCaixaDetDT_MOVIMENTO: TDateTimeField;
    QRCaixaDetVAL_DINHEIRO: TFloatField;
    QRCaixaDetVAL_VALES: TFloatField;
    QRCaixaDetVAL_CHEQUES: TFloatField;
    QRCaixaDetVAL_OUTROS: TFloatField;
    QRSaldoDiario: TOracleDataSet1;
    QRSaldoDiarioDT_MOVIMENTO: TDateTimeField;
    QRSaldoDiarioCREDITO: TFloatField;
    QRSaldoDiarioDEBITO: TFloatField;
    QRSaldoDiarioSALDO: TFloatField;
    QRResLancBancoCaixaDESC_HISTORICO: TStringField;
    QRResLancBancoCaixaTIPO_MOVIMENTO: TStringField;
    QRResLancBancoCaixaVAL_MOVIMENTO: TFloatField;
    QRSaldoDepartamento: TOracleDataSet1;
    QRSaldoDepartamentoCOD_DEPARTAMENTO: TIntegerField;
    QRSaldoDepartamentoDESC_DEPARTAMENTO: TStringField;
    QRSaldoDepartamentoCREDITO: TFloatField;
    QRSaldoDepartamentoDEBITO: TFloatField;
    QRSaldoDepartamentoSALDO: TFloatField;
    QRIndicadoresDesp: TOracleDataSet1;
    QRIndicadoresDespDESC_HISTORICO: TStringField;
    QRIndicadoresDespVAL_TOTAL: TFloatField;
    QRCaixa_MovCaixaDESC_OBSERVACAO: TStringField;
    QRFluxoCaixaRealizado: TOracleDataSet1;
    QRFluxoCaixaRealizadocomplemento: TStringField;
    QRFluxoCaixaRealizadoDEPARTAMENTO: TFloatField;
    QRFluxoCaixaRealizadoCOD_CAIXA_MOV: TFloatField;
    QRFluxoCaixaRealizadoCADASTRO: TFloatField;
    QRFluxoCaixaRealizadoFILIAL: TFloatField;
    QRFluxoCaixaRealizadoHISTORICO: TFloatField;
    QRFluxoCaixaRealizadoDT_MOVIMENTO: TDateTimeField;
    QRFluxoCaixaRealizadoVAL_MOVIMENTO: TFloatField;
    QRFluxoCaixaRealizadoNUM_DOCUMENTO: TFloatField;
    QRFluxoCaixaRealizadoDESC_DEPARTAMENTO: TStringField;
    QRFluxoCaixaRealizadoDESC_HISTORICO: TStringField;
    QRFluxoCaixaRealizadoIND_OPERACAO: TStringField;
    QRFluxoCaixaRealizadoDESC_COMPLEMENTO: TStringField;
    QRFluxoCaixaRealizadoIND_TIPO: TStringField;
    QRFluxoCaixaRealizadoSint: TOracleDataSet1;
    QRFluxoCaixaRealizadoSintDEPARTAMENTO: TFloatField;
    QRFluxoCaixaRealizadoSintDESC_DEPARTAMENTO: TStringField;
    QRFluxoCaixaRealizadoSintVAL_SALDO_ANTERIOR: TFloatField;
    QRFluxoCaixaRealizadoSintVAL_ENTRADAS: TFloatField;
    QRFluxoCaixaRealizadoSintVAL_SAIDAS: TFloatField;
    QRFluxoCaixaRealizadoSintVAL_SALDO: TFloatField;
    QRCaixa_MovCaixaDESC_COMPLEMENTO1: TStringField;
    QRCaixa_MovCaixaCliente: TOracleDataSet1;
    QRCaixa_MovCaixaClienteCOD_FILIAL: TIntegerField;
    QRCaixa_MovCaixaClienteCOD_HISTORICO: TIntegerField;
    QRCaixa_MovCaixaClienteCOD_CADASTRO: TIntegerField;
    QRCaixa_MovCaixaClienteDESC_FILIAL: TStringField;
    QRCaixa_MovCaixaClienteDESC_HISTORICO: TStringField;
    QRCaixa_MovCaixaClienteVAL_MAIS: TFloatField;
    QRCaixa_MovCaixaClienteVAL_MENOS: TFloatField;
    QRCaixa_MovCaixaClienteDESCRICAO: TStringField;
    QRDre_Caixa: TOracleDataSet1;
    QRDre_CaixaSVAL_FATURAMENTO: TFloatField;
    QRDre_CaixaSVAL_CUSTO_VARIAVEL: TFloatField;
    QRDre_CaixaSVAL_CUSTO_FIXO: TFloatField;
    QRDre_CaixaSVAL_DESPESA_FINANCEIRA: TFloatField;
    QRDre_CaixaSVAL_RECEITA_FINANCEIRA: TFloatField;
    QRCaixa_MovCaixaNUM_DOCUMENTO: TFloatField;
    QRCaixaDetDESC_DEPARTAMENTO: TStringField;
    QRCaixaDetDESC_FILIAL: TStringField;
    QROrigDestValores: TOracleDataSet1;
    QROrigDestValoresENTRADA: TFloatField;
    QROrigDestValoresSAIDA: TFloatField;
    QROrigDestValoresDESC_BANCO_AGENCIA: TStringField;
    QROrigDestValoresIND_FLUXO_CAIXA: TStringField;
    QROrigDestValoresTIPO: TStringField;
    QROrigDestValoresHoje: TOracleDataSet1;
    QROrigDestValoresFinal: TOracleDataSet1;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    QRRazaoPagamentos: TOracleDataSet1;
    QRRazaoPagamentosPAGTO: TDateTimeField;
    QRRazaoPagamentosVENCIMENTO: TDateTimeField;
    QRRazaoPagamentosTITULO: TFloatField;
    QRRazaoPagamentosPARCELA: TIntegerField;
    QRRazaoPagamentosEMISSAO: TDateTimeField;
    QRRazaoPagamentosBANCO: TIntegerField;
    QRRazaoPagamentosCOD_FINALIDADE: TIntegerField;
    QRRazaoPagamentosDESC_FINALIDADE: TStringField;
    QRRazaoPagamentosHISTORICO: TIntegerField;
    QRRazaoPagamentosVALOR: TFloatField;
    QRRazaoPagamentosCADASTRO: TStringField;
    QRRazaoPagamentosJUROS_DESC: TFloatField;
    QRRazaoPagamentosVAL_PAGO: TFloatField;
    QRRazaoPagamentosqtParcelas: TStringField;
    QRRazaoPagamentosCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRRazaoPagamentosCOD_CADASTRO: TIntegerField;
    QRCaixaMensal: TOracleDataSet1;
    QRCaixaMensalMES: TFloatField;
    QRCaixaMensalANO: TFloatField;
    QRCaixaMensalCREDITO: TFloatField;
    QRCaixaMensalDEBITO: TFloatField;
    QRCaixaMensalFILIAL: TStringField;
    QRCaixaMensalSALDO_MENSAL: TFloatField;
    QrFluxo_Caixa_Cr_CpDT_VENCIMENTO: TDateTimeField;
    QrFluxo_Caixa_Cr_CpNOME: TStringField;
    QrFluxo_Caixa_Cr_CpVAL_RECEBER: TFloatField;
    QrFluxo_Caixa_Cr_CpVAL_PAGAR: TFloatField;
    QrFluxo_Caixa_Cr_CpVAL_BANCOS: TFloatField;
    QRResumoPlano: TOracleDataSet1;
    QRResumoPlanoNUM_PLANO1: TStringField;
    QRResumoPlanoNUM_PLANO2: TStringField;
    QRResumoPlanoNUM_PLANO_CONTA_CAIXA: TStringField;
    QRResumoPlanoDESC_HISTORICO: TStringField;
    QRResumoPlanoVAL_MOVIMENTO: TFloatField;
    QRResumoPlanodesc_plano1: TStringField;
    QRResumoPlanodesc_plano2: TStringField;
    QrResBancoCaixaAnalitico: TOracleDataSet1;
    QrResBancoCaixaAnaliticoCOD_HISTORICO: TIntegerField;
    QrResBancoCaixaAnaliticoCOD_CADASTRO: TIntegerField;
    QrResBancoCaixaAnaliticoNUM_DOCUMENTO: TFloatField;
    QrResBancoCaixaAnaliticoDT_MOVIMENTO: TDateTimeField;
    QrResBancoCaixaAnaliticoNOME: TStringField;
    QrResBancoCaixaAnaliticoVAL_MOVIMENTO: TFloatField;
    QrResBancoCaixaAnaliticoNUM_CONTA_CORRENTE: TStringField;
    QrResBancoCaixaAnaliticoDESC_ORIGEM: TStringField;
    QrResBancoCaixaAnaliticoDESC_OBSERVACAO: TStringField;
    QRResLancBancoCaixaCOD_HISTORICO: TFloatField;
    QrResBancoCaixaAnaliticoVAL_DESCONTO: TFloatField;
    QRDre_Caixa_Analitico: TOracleDataSet1;
    QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_BRUTO: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_ITENS: TFloatField;
    QRDre_Caixa_AnaliticoSDESCONTO_ITEM_TOTAL: TFloatField;
    QRDre_Caixa_AnaliticoSDESPESAS_TOTAL: TFloatField;
    QRDre_Caixa_AnaliticoSICMS_SUBST_TOTAL: TFloatField;
    QRDre_Caixa_AnaliticoSIPI_TOTAL: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_AQUISICOES: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_CUSTO_VARIAVEL: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_CUSTO_FIXO: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_DESPESA_FINANCEIRA: TFloatField;
    QRDre_Caixa_AnaliticoSVAL_RECEITA_FINANCEIRA: TFloatField;
    QRDRE_Financeiro: TOracleDataSet1;
    QRDRE_FinanceiroDESCRICAO_DRE: TStringField;
    QRDRE_FinanceiroDESC_HISTORICO: TStringField;
    QRDRE_FinanceiroSVAL_TOTAL: TFloatField;
    QRTotalCR: TOracleDataSet1;
    QRTotalCRVAL_TOTAL: TFloatField;
    QRDre_CaixaSVAL_AQUISICOES: TFloatField;
    QRDemonstrativo: TOracleDataSet1;
    QRDemonstrativoDESC_FILIAL: TStringField;
    QRDemonstrativoMES_REFERENCIA: TStringField;
    QRDemonstrativoSQTD_ESTOQUE: TFloatField;
    QRDemonstrativoSCUSTO_ESTOQUE: TFloatField;
    QRDemonstrativoSCOMPRA: TFloatField;
    QRDemonstrativoSVENDA: TFloatField;
    QRDemonstrativoSVALORRECEBIDO: TFloatField;
    QRDemonstrativoSVALORPAGO: TFloatField;
    QRDemonstrativoSSALDO_CAIXA: TFloatField;
    QRDemonstrativoSSALDO_BANCO: TFloatField;
    QRResumoPlanoCompetencia: TOracleDataSet1;
    QRResumoPlanoCompetenciaNUM_PLANO1: TStringField;
    QRResumoPlanoCompetenciaNUM_PLANO2: TStringField;
    QRResumoPlanoCompetenciaNUM_PLANO_CONTA_CAIXA: TStringField;
    QRResumoPlanoCompetenciaDESC_HISTORICO: TStringField;
    QRResumoPlanoCompetenciaVAL_MOVIMENTO: TFloatField;
    QRResumoPlanoCompetenciadesc_plano1: TStringField;
    QRResumoPlanoCompetenciadesc_plano2: TStringField;
    procedure QRCaixa_MovCaixaCalcFields(DataSet: TDataSet);
    procedure QRFluxoCaixaRealizadoCalcFields(DataSet: TDataSet);
    procedure QRRazaoPagamentosCalcFields(DataSet: TDataSet);
    procedure QRResumoPlanoCalcFields(DataSet: TDataSet);
    procedure QRDemonstrativoCalcFields(DataSet: TDataSet);
    procedure QRResumoPlanoCompetenciaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCaixaRel: TDMCaixaRel;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCaixaRel.QRCaixa_MovCaixaCalcFields(DataSet: TDataSet);
begin
   If QRCaixa_MovCaixaCod_Cadastro.Text <> '' Then
      QRCaixa_MovCaixaComplemento.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QRCaixa_MovCaixaCod_Cadastro.Value)) +
                                           '-'+QRCaixa_MovCaixaDesc_Complemento.Value
   Else
      if QRCaixa_MovCaixaDESC_COMPLEMENTO.Value <> '' Then
         QRCaixa_MovCaixaComplemento.Value := QRCaixa_MovCaixaDesc_Complemento.Value;
end;

procedure TDMCaixaRel.QRFluxoCaixaRealizadoCalcFields(DataSet: TDataSet);
begin
  If QRFluxoCaixaRealizadoCADASTRO.Text <> '' Then
        QRFluxoCaixaRealizadoComplemento.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QRFluxoCaixaRealizadoCADASTRO.Value)) +
                                                  '-'+QRCaixa_MovCaixaDesc_Complemento.Value
     Else
        if QRFluxoCaixaRealizadoDESC_COMPLEMENTO.Value <> '' Then
           QRFluxoCaixaRealizadoComplemento.Value := QRCaixa_MovCaixaDesc_Complemento.Value;
end;

procedure TDMCaixaRel.QRRazaoPagamentosCalcFields(DataSet: TDataSet);
begin
  if (QRRazaoPagamentosTITULO.Text <> '') and
    (QRRazaoPagamentosCOD_CADASTRO.Text <> '') then
  begin
    QRRazaoPagamentosqtParcelas.Value := QRRazaoPagamentosPARCELA.Text +'/'+
      DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_PAGAR_CAB',
        'NUM_TITULO = ' + QRRazaoPagamentosTITULO.Text + 'AND ' +
        'COD_CADASTRO = ' + QRRazaoPagamentosCOD_CADASTRO.Text);
  end;
end;

procedure TDMCaixaRel.QRResumoPlanoCalcFields(DataSet: TDataSet);
begin
  If (Length(Trim(QRResumoPlanoNum_Plano2.Text)) < 6) And (Trim(QRResumoPlanoNum_Plano2.Text) <> '') Then
   Begin
     QRResumoPlanoDesc_Plano1.Value
      := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','NUM_PLANO_CONTA_CAIXA = '
      + quotedStr(QRResumoPlanoNum_Plano1.Text));
     QRResumoPlanoDesc_Plano2.Value
      := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','NUM_PLANO_CONTA_CAIXA = '
      + quotedStr(QRResumoPlanoNum_Plano2.Text));
   End;
end;

procedure TDMCaixaRel.QRDemonstrativoCalcFields(DataSet: TDataSet);
begin
{  if (QRDemonstrativoVALOR_ENTRADA_CX.Value <> 0) and (QRDemonstrativoVALOR_SAIDA_CX.Value <> 0) then
  begin
   	if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '01' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '02' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '03' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '04' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '05' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '06' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '07' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '08' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '09' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '10' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '11' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
    if Copy(QRDemonstrativoMES_REFERENCIA.Value, 1, 2) = '12' then
      QRDemonstrativosSaldoCaixa.Value := QRDemonstrativoVALOR_ENTRADA_CX.Value - QRDemonstrativoVALOR_SAIDA_CX.Value;
  end;  }
end;

procedure TDMCaixaRel.QRResumoPlanoCompetenciaCalcFields(DataSet: TDataSet);
begin
  If (Length(Trim(QRResumoPlanoNum_Plano2.Text)) < 6) And (Trim(QRResumoPlanoNum_Plano2.Text) <> '') Then
  Begin
    QRResumoPlanoCompetenciadesc_plano1.Value
      := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','NUM_PLANO_CONTA_CAIXA = '
      + quotedStr(QRResumoPlanoCompetenciadesc_plano1.Text));
    QRResumoPlanoCompetenciadesc_plano2.Value
      := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','NUM_PLANO_CONTA_CAIXA = '
      + quotedStr(QRResumoPlanoCompetenciadesc_plano2.Text));
  End;
end;

end.
