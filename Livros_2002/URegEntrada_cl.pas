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
    QRegEntradaVAL_ISENTO: TFloatField;
    QRegEntradaVAL_OUTRAS: TFloatField;
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
    QRegEntradaProdPrimarioIND_COMPRAS: TStringField;
    procedure QRegEntradaCalcFields(DataSet: TDataSet);
    procedure QApuracaoECalcFields(DataSet: TDataSet);
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
Var wDescAcrescimo,
    wItem : String;
begin
  IF (QRegEntradaDesc_Obs.Value = 'CANCELADA') or (QRegEntradaDesc_Obs.Value = 'FUTURA') then
     QRegEntradaVal_Contabil.Value := 0
  else
  begin
     If QRegEntradaEspecie.Value = 'NF' Then
      Begin
       wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS-VAL_DESCONTO) FROM TB_NOTA_CAB',
                          'COD_NOTA_CAB = '+FloatToStr(QRegEntradaCod_Nota_Cab.Value));
       wItem := DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL+VAL_IPI) FROM TB_NOTA_ITEM',
                   'COD_NOTA_CAB = '+FloatToStr(QRegEntradaCod_Nota_Cab.Value));
       If Trim(wItem) <> '' Then
         QRegEntradaVal_Contabil.Value := StrToFloat(wItem);
       If Trim(wDescAcrescimo) <> '' Then
         QRegEntradaval_contabil.Value := QRegEntradaVal_Contabil.Value+StrToFloat(wDescAcrescimo);
      End
     Else
       If QRegEntradaEspecie.Value = 'cf' Then
         QRegEntradaVal_Contabil.Value := QRegEntradaVal_Icm_Base.Value + QRegEntradaVal_Ipi.Value
       Else
         QRegEntradaVal_Contabil.Text := DMOracle.BuscaNome('SELECT VAL_FRETE FROM TB_NOTA_CAB',
                       'COD_NOTA_CAB = '+FloatToStr(QRegEntradaCod_Nota_Cab.Value));
  end;
end;

procedure TDMRegEntrada.QApuracaoECalcFields(DataSet: TDataSet);
begin
  if QApuracaoEVal_Icm_Base_Sql.Value < 0 Then
     QApuracaoEVal_Icm_Base.Value := 0
  Else
     QApuracaoEVal_Icm_Base.Value := QApuracaoEVal_Icm_Base_Sql.Value;
  if QApuracaoEVal_Icm_Base_Isento_Sql.Value < 0 Then
     QApuracaoEVal_Icm_Base_Isento.Value := 0
  Else
     QApuracaoEVal_Icm_Base_Isento.Value := QApuracaoEVal_Icm_Base_Isento_Sql.Value;
  if QApuracaoEVal_Icm_Sql.Value < 0 Then
     QApuracaoEVal_Icm.Value := 0
  Else
     QApuracaoEVal_Icm.Value := QApuracaoEVal_Icm_Sql.Value;
  if QApuracaoEVal_Icm_Base_Outras_Sql.Value < 0 Then
     QApuracaoEVal_Icm_Base_Outras.Value := 0
  Else
     QApuracaoEVal_Icm_Base_Outras.Value := QApuracaoEVal_Icm_Base_Outras_Sql.Value;
  if QApuracaoEVal_Contabil_Sql.Value < 0  Then
     QApuracaoEVal_Contabil.Value := 0
  Else
     QApuracaoEVal_Contabil.Value := QApuracaoEVal_Contabil_Sql.Value;
end;

end.
