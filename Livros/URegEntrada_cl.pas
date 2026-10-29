unit URegEntrada_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMRegEntrada = class(TDataModule)
    QApuracaoE: TOracleDataSet1;
    QApuracaoENAT_OPERACAO: TFloatField;
    QApuracaoEVAL_ICM_BASE_SQL: TFloatField;
    QApuracaoEVAL_ICM_BASE_ISENTO_SQL: TFloatField;
    QApuracaoEVAL_ICM_SQL: TFloatField;
    QApuracaoEVAL_ICM_BASE_OUTRAS_SQL: TFloatField;
    QApuracaoEVAL_CONTABIL_SQL: TFloatField;
    QApuracaoEval_icm_base: TFloatField;
    QApuracaoEval_icm: TFloatField;
    QApuracaoEval_contabil: TFloatField;
    QApuracaoEval_icm_base_isento: TFloatField;
    QApuracaoEval_icm_base_outras: TFloatField;
    QApuracaoS: TOracleDataSet1;
    QApuracaoSNAT_OPERACAO: TFloatField;
    QApuracaoSVAL_ICM_BASE: TFloatField;
    QApuracaoSVAL_ICM_BASE_ISENTO: TFloatField;
    QApuracaoSVAL_ICM: TFloatField;
    QApuracaoSVAL_ICM_BASE_OUTRAS: TFloatField;
    QApuracaoSVAL_CONTABIL: TFloatField;
    QRegEntrada: TOracleDataSet1;
    QRegEntradaCOD_NOTA_CAB: TFloatField;
    QRegEntradaCOD_OPERACAO: TFloatField;
    QRegEntradaESPECIE: TStringField;
    QRegEntradaNUM_NOTA: TFloatField;
    QRegEntradaCOD_SERIE: TStringField;
    QRegEntradaDT_EMISSAO: TDateTimeField;
    QRegEntradaDT_RECEBIMENTO: TDateTimeField;
    QRegEntradaCOD_CADASTRO: TFloatField;
    QRegEntradaNUM_CGC_CPF: TStringField;
    QRegEntradaNOME_CADASTRO: TStringField;
    QRegEntradaCOD_ESTADO: TStringField;
    QRegEntradaNAT_OPERACAO: TFloatField;
    QRegEntradaNUM_CLASSIFICACAO: TStringField;
    QRegEntradaPERC_ALIQUOTA: TFloatField;
    QRegEntradaDESC_OBS: TStringField;
    QRegEntradaVAL_ICM_BASE: TFloatField;
    QRegEntradaVAL_ICM: TFloatField;
    QRegEntradaIND_CLASS_IPI: TStringField;
    QRegEntradaVAL_IPI_BASE: TFloatField;
    QRegEntradaVAL_IPI: TFloatField;
    QRegEntradaval_contabil: TFloatField;
    QRegEntradaProdPrimario: TOracleDataSet1;
    QRegEntradaProdPrimarioCOD_NOTA_CAB: TIntegerField;
    QRegEntradaProdPrimarioDT_EMISSAO: TDateTimeField;
    QRegEntradaProdPrimarioNUM_NOTA: TIntegerField;
    QRegEntradaProdPrimarioCOD_PRODUTO: TFloatField;
    QRegEntradaProdPrimarioVAL_TOTAL: TFloatField;
    QRegEntradaProdPrimarioDESC_INSCRICAO: TStringField;
    QRegEntradaProdPrimarioNUM_CGC_CPF: TStringField;
    QRegEntradaProdPrimarioCOD_CIDADE: TIntegerField;
    QRegEntradaProdPrimarioIND_FIXAR_EMPRESA: TStringField;
    QRegEntradaProdPrimarioPESO: TFloatField;
    QRegEntradaProdPrimarioNOME: TStringField;
    QRegEntradaProdPrimarioCOD_SERIE: TStringField;
    QRegEntradaProdPrimarioDESC_ENDERECO: TStringField;
    QRegEntradaProdPrimarioDESC_BAIRRO: TStringField;
    QRegEntradaProdPrimarioNUM_NATUREZA_EST_NOVO: TIntegerField;
    QRegEntradaProdPrimarioNUM_NATUREZA_INT_NOVO: TIntegerField;
    QRegEntradaProdPrimarioNUM_CGC: TStringField;
    QRegEntradaProdPrimarioIND_FISICA_JURIDICA: TStringField;
    QRegEntradaProdPrimarioVAL_UNITARIO: TFloatField;
    QRegEntradaProdPrimarioQT_QUANTIDADE: TFloatField;
    QRegEntradaProdPrimarioDESC_UNIDADE: TStringField;
    QRegEntradaProdPrimarioNUM_ITEM: TFloatField;
    QRegEntradaProdPrimarioCOD_ESTADO: TStringField;
    QRegEntradaVAL_ISENTO_AUX: TFloatField;
    QRegEntradaval_isento: TFloatField;
    QRegEntradaval_outras: TFloatField;
    QRegEntradaVAL_OUTRAS_AUX: TFloatField;
    QApuracaoGrupoFiscalE: TOracleDataSet1;
    QApuracaoGrupoFiscalEval_icm_base: TFloatField;
    QApuracaoGrupoFiscalEval_icm: TFloatField;
    QApuracaoGrupoFiscalEval_contabil: TFloatField;
    QApuracaoGrupoFiscalEval_icm_base_isento: TFloatField;
    QApuracaoGrupoFiscalEval_icm_base_outras: TFloatField;
    QApuracaoGrupoFiscalS: TOracleDataSet1;
    QApuracaoGrupoFiscalECOD_GRUPO_FISCAL_CAB: TIntegerField;
    QApuracaoGrupoFiscalEVAL_ICM_BASE_SQL: TFloatField;
    QApuracaoGrupoFiscalEVAL_ICM_BASE_ISENTO_SQL: TFloatField;
    QApuracaoGrupoFiscalEVAL_ICM_SQL: TFloatField;
    QApuracaoGrupoFiscalEVAL_ICM_BASE_OUTRAS_SQL: TFloatField;
    QApuracaoGrupoFiscalEVAL_CONTABIL_SQL: TFloatField;
    QApuracaoGrupoFiscalSCOD_GRUPO_FISCAL_CAB: TIntegerField;
    QApuracaoGrupoFiscalSVAL_ICM_BASE: TFloatField;
    QApuracaoGrupoFiscalSVAL_ICM_BASE_ISENTO: TFloatField;
    QApuracaoGrupoFiscalSVAL_ICM: TFloatField;
    QApuracaoGrupoFiscalSVAL_ICM_BASE_OUTRAS: TFloatField;
    QApuracaoGrupoFiscalSVAL_CONTABIL: TFloatField;
    QApuracaoGrupoFiscalENAT_OPERACAO_INICIO: TStringField;
    QApuracaoGrupoFiscalSNAT_OPERACAO_INICIO: TStringField;
    QRegEntradaProdPrimarioDESC_CEP: TStringField;
    QRegEntradaProdPrimarioDESC_PRODUTO: TStringField;
    QRegEntradaProdPrimarioDESC_HOBBIE: TStringField;
    QRegEntradaVAL_CONTABIL_FRETE: TFloatField;
    QApuracaoGrupoFiscalEDESC_GRUPO_FISCAL: TStringField;
    QApuracaoGrupoFiscalSDESC_GRUPO_FISCAL: TStringField;
    QRegEntradaNUM_CGC_FILIAL: TStringField;
    QApuracaoEntrada_Ipi: TOracleDataSet1;
    QApuracaoEntrada_IpiNAT_OPERACAO: TFloatField;
    QApuracaoEntrada_IpiSVAL_BASE_ISENTO: TFloatField;
    QApuracaoEntrada_IpiSVAL_BASE_OUTRAS: TFloatField;
    QApuracaoEntrada_IpiSVAL_BASE_IPI: TFloatField;
    QApuracaoEntrada_IpiSVAL_IPI: TFloatField;
    QApuracaoEntrada_IpiSVAL_CONTABIL: TFloatField;
    QApuracaoEFilial: TOracleDataSet1;
    QApuracaoEFilialDESC_FILIAL: TStringField;
    QApuracaoEFilialNUM_CGC: TStringField;
    QApuracaoEFilialDESC_INSCRICAO: TStringField;
    QRegEntradaVAL_PIS: TFloatField;
    QRegEntradaVAL_COFINS: TFloatField;
    QApuracaoE_UF: TOracleDataSet1;
    QApuracaoE_UFCOD_ESTADO: TStringField;
    QApuracaoE_UFVAL_ICM_BASE_SQL: TFloatField;
    QApuracaoE_UFVAL_ICM_BASE_ISENTO_SQL: TFloatField;
    QApuracaoE_UFVAL_ICM_SQL: TFloatField;
    QApuracaoE_UFVAL_ICM_BASE_OUTRAS_SQL: TFloatField;
    QApuracaoE_UFVAL_CONTABIL_SQL: TFloatField;
    QApuracaoE_UFval_icm_base: TFloatField;
    QApuracaoE_UFval_icm: TFloatField;
    QApuracaoE_UFval_contabil: TFloatField;
    QApuracaoE_UFval_icm_base_isento: TFloatField;
    QApuracaoE_UFval_icm_base_outras: TFloatField;
    QApuracaoS_UF: TOracleDataSet1;
    QApuracaoS_UFCOD_ESTADO: TStringField;
    QApuracaoS_UFVAL_ICM_BASE: TFloatField;
    QApuracaoS_UFVAL_ICM_BASE_ISENTO: TFloatField;
    QApuracaoS_UFVAL_ICM: TFloatField;
    QApuracaoS_UFVAL_ICM_BASE_OUTRAS: TFloatField;
    QApuracaoS_UFVAL_CONTABIL: TFloatField;
    QApuracaoEntrada_Ipi_Analitico: TOracleDataSet1;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    QApuracaoEntrada_Ipi_AnaliticoNUM_NOTA: TFloatField;
    procedure QRegEntradaCalcFields(DataSet: TDataSet);
    procedure QApuracaoECalcFields(DataSet: TDataSet);
    procedure QApuracaoGrupoFiscalECalcFields(DataSet: TDataSet);
    procedure QApuracaoE_UFCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegEntrada: TDMRegEntrada;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRegEntrada.QRegEntradaCalcFields(DataSet: TDataSet);
Var wDespesa, wDesconto, wFrete, wItem,wSubst : String;  // variavel wfrete serve para valor do frete AB notas com valor de frete sem conhecimento
    wNumNota : STRING;
    x, y: array of String;
begin
  QRegEntradaVal_Isento.Value := QRegEntradaVal_Isento_Aux.Value;
  QRegEntradaVal_Outras.Value := QRegEntradaVal_Outras_Aux.Value;
  If (QRegEntradaDesc_Obs.Value = 'CANCELADA') or (QRegEntradaDesc_Obs.Value = 'FUTURA') then
     QRegEntradaVal_Contabil.Value := 0
  Else
   begin
     If QRegEntradaEspecie.Value = 'NF' Then
      Begin
       setLength(x, 6); //4 sql diferentes
       setLength(y, 6);

       {x[0] := 'SELECT PEGA_DESPESA_NOTA('+QRegEntradaCod_Nota_Cab.Text+')-PEGA_DESCONTO_NOTA('+
        QRegEntradaCod_Nota_Cab.Text+')+NVL(N.VAL_SUBST_TRIBUT,0) FROM TB_NOTA_CAB N ' +
        'WHERE N.COD_NOTA_CAB = ' + QRegEntradaCod_Nota_Cab.Text;}
       x[0] := 'SELECT PEGA_DESPESA_NOTA('+QRegEntradaCod_Nota_Cab.Text+') FROM DUAL';
       x[1] := 'SELECT VAL_FRETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = '+QRegEntradaCod_Nota_Cab.Text + ' AND COD_OPERACAO_CF IS NULL ' +' AND IND_IMPRIME_FRETE=' + Chr(39) + 'S' + Chr(39);
       x[2] := 'SELECT SUM(VAL_TOTAL+VAL_IPI) FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = '+QRegEntradaCod_Nota_Cab.Text;//
       x[3] := 'SELECT SUM(NVL(VAL_ICMS_SUBST,0)) FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = '+QRegEntradaCod_Nota_Cab.Text;
       x[4] := 'SELECT PEGA_DESCONTO_NOTA('+QRegEntradaCod_Nota_Cab.Text+') FROM DUAL';
       x[5] := 'SELECT NVL(N.VAL_SUBST_TRIBUT,0) FROM TB_NOTA_CAB N WHERE N.COD_NOTA_CAB = ' + QRegEntradaCod_Nota_Cab.Text;

       DMOracle.BuscaNomes(x, y);
       wDespesa := Y[0];
       wFrete := y[1];
       wItem :=  y[2];
       wDesconto := y[4];
       wSubst := y[5];

       If Trim(wItem) <> '' Then
         QRegEntradaVal_Contabil.Value := StrToFloat(wItem);
       If Trim(wDespesa) <> '' Then
         QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value+StrToFloat(wDespesa);
       if Trim(wDesconto) <> '' then
         QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value-StrToFloat(wDesconto);
       if Trim(wSubst) <> '' then
         QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value+StrToFloat(wSubst);
       If Trim(y[3]) <> '' Then
        Begin
          QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value+StrToFloat(y[3]);
//          QRegEntradaVal_Outras.Value := QRegEntradaVal_Outras.Value + StrToFloat(y[3]);
        End;
       If Trim(wFrete) <> '' Then
        Begin
         QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value+StrToFloat(wFrete);
         If QRegEntradaNum_Classificacao.Value = '4' Then
            QRegEntradaVal_Isento.Value := QRegEntradaVal_Isento.Value + StrToFloat(wFrete)
         Else
            QRegEntradaVal_Outras.Value := QRegEntradaVal_Outras.Value + StrToFloat(wFrete);
        End;
      End
     Else
       If QRegEntradaEspecie.Value = 'cf' Then
        Begin
         QRegEntradaVal_Contabil.Value := QRegEntradaVal_Contabil_Frete.Value;
//         If QRegEntradaVal_Icm_Base.Value = 0 Then                                                         //* para nao somar 2 vezes o valor do pedagio */
//            QRegEntradaVal_Contabil.Value := QRegEntradaVal_Contabil.Value + QRegEntradaVal_Isento.Value - QRegEntradaVal_Ipi.Value + QRegEntradaVal_Outras.Value;
        End
       Else
         QRegEntradaVal_Contabil.Text := DMOracle.BuscaNome('SELECT VAL_FRETE FROM TB_NOTA_CAB',
                       'COD_NOTA_CAB = '+FloatToStr(QRegEntradaCod_Nota_Cab.Value));
   End;
end;

procedure TDMRegEntrada.QApuracaoECalcFields(DataSet: TDataSet);
begin
  if QApuracaoEVal_Icm_Base_Sql.Value <= 0 Then
     QApuracaoEVal_Icm_Base.Value := 0
  Else
     QApuracaoEVal_Icm_Base.Value := QApuracaoEVal_Icm_Base_Sql.Value;

  if QApuracaoEVal_Icm_Base_Isento_Sql.Value <= 0 Then
     QApuracaoEVal_Icm_Base_Isento.Value := 0
  Else
     QApuracaoEVal_Icm_Base_Isento.Value := QApuracaoEVal_Icm_Base_Isento_Sql.Value;

  if QApuracaoEVal_Icm_Sql.Value <= 0 Then
     QApuracaoEVal_Icm.Value := 0
  Else
     QApuracaoEVal_Icm.Value := QApuracaoEVal_Icm_Sql.Value;

  if QApuracaoEVal_Icm_Base_Outras_Sql.Value <= 0 Then
     QApuracaoEVal_Icm_Base_Outras.Value := 0
  Else
     QApuracaoEVal_Icm_Base_Outras.Value := QApuracaoEVal_Icm_Base_Outras_Sql.Value;

  if QApuracaoEVal_Contabil_Sql.Value <= 0  Then
     QApuracaoEVal_Contabil.Value := 0
  Else
     QApuracaoEVal_Contabil.Value := QApuracaoEVal_Contabil_Sql.Value;
end;

procedure TDMRegEntrada.QApuracaoGrupoFiscalECalcFields(DataSet: TDataSet);
begin
  if QApuracaoGrupoFiscalEVal_Icm_Base_Sql.Value < 0 Then
     QApuracaoGrupoFiscalEVal_Icm_Base.Value := 0
  Else
     QApuracaoGrupoFiscalEVal_Icm_Base.Value := QApuracaoGrupoFiscalEVal_Icm_Base_Sql.Value;

  if QApuracaoGrupoFiscalEVal_Icm_Base_Isento_Sql.Value < 0 Then
     QApuracaoGrupoFiscalEVal_Icm_Base_Isento.Value := 0
  Else
     QApuracaoGrupoFiscalEVal_Icm_Base_Isento.Value := QApuracaoGrupoFiscalEVal_Icm_Base_Isento_Sql.Value;

  if QApuracaoGrupoFiscalEVal_Icm_Sql.Value < 0 Then
     QApuracaoGrupoFiscalEVal_Icm.Value := 0
  Else
     QApuracaoGrupoFiscalEVal_Icm.Value := QApuracaoGrupoFiscalEVal_Icm_Sql.Value;

  if QApuracaoGrupoFiscalEVal_Icm_Base_Outras_Sql.Value < 0 Then
     QApuracaoGrupoFiscalEVal_Icm_Base_Outras.Value := 0
  Else
     QApuracaoGrupoFiscalEVal_Icm_Base_Outras.Value := QApuracaoGrupoFiscalEVal_Icm_Base_Outras_Sql.Value;
     
  if QApuracaoGrupoFiscalEVal_Contabil_Sql.Value < 0  Then
     QApuracaoGrupoFiscalEVal_Contabil.Value := 0
  Else
     QApuracaoGrupoFiscalEVal_Contabil.Value := QApuracaoGrupoFiscalEVal_Contabil_Sql.Value;

end;

procedure TDMRegEntrada.QApuracaoE_UFCalcFields(DataSet: TDataSet);
begin
  if QApuracaoE_UFVal_Icm_Base_Sql.Value < 0 Then
     QApuracaoE_UFVal_Icm_Base.Value := 0
  Else
     QApuracaoE_UFVal_Icm_Base.Value := QApuracaoE_UFVal_Icm_Base_Sql.Value;

  if QApuracaoE_UFVal_Icm_Base_Isento_Sql.Value < 0 Then
     QApuracaoE_UFVal_Icm_Base_Isento.Value := 0
  Else
     QApuracaoE_UFVal_Icm_Base_Isento.Value := QApuracaoE_UFVal_Icm_Base_Isento_Sql.Value;

  if QApuracaoE_UFVal_Icm_Sql.Value < 0 Then
     QApuracaoE_UFVal_Icm.Value := 0
  Else
     QApuracaoE_UFVal_Icm.Value := QApuracaoE_UFVal_Icm_Sql.Value;

  if QApuracaoE_UFVal_Icm_Base_Outras_Sql.Value < 0 Then
     QApuracaoE_UFVal_Icm_Base_Outras.Value := 0
  Else
     QApuracaoE_UFVal_Icm_Base_Outras.Value := QApuracaoE_UFVal_Icm_Base_Outras_Sql.Value;

  if QApuracaoE_UFVal_Contabil_Sql.Value < 0  Then
     QApuracaoE_UFVal_Contabil.Value := 0
  Else
     QApuracaoE_UFVal_Contabil.Value := QApuracaoE_UFVal_Contabil_Sql.Value;

end;

end.


