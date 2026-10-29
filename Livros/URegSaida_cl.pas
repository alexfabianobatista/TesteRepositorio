unit URegSaida_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMRegSaida = class(TDataModule)
    DSRegSaida: TDataSource;
    QRegSaida: TOracleDataSet1;
    QRegSaidaTIPO_IMPOSTO: TStringField;
    QRegSaidaESPECIE: TStringField;
    QRegSaidaCOD_OPERACAO: TFloatField;
    QRegSaidaCOD_NOTA_CAB: TFloatField;
    QRegSaidaNUM_NOTA: TFloatField;
    QRegSaidaCOD_SERIE: TStringField;
    QRegSaidaDIA: TStringField;
    QRegSaidaDT_RECEBIMENTO: TDateTimeField;
    QRegSaidaCOD_ESTADO_DESTINO: TStringField;
    QRegSaidaNAT_OPERACAO: TFloatField;
    QRegSaidaVAL_BASE_ISENTA: TFloatField;
    QRegSaidaDESC_OBS: TStringField;
    QRegSaidaval_contabil: TFloatField;
    QRegSaidaval_observacao: TFloatField;
    QRegSaidaNUM_CGC_CPF: TStringField;
    QRegSaidaNUM_CGC_FILIAL: TStringField;
    QRegSaidaVAL_TOTAL_IPI: TFloatField;
    QApuracaoSaida_Ipi: TOracleDataSet1;
    QApuracaoSaida_IpiNAT_OPERACAO: TFloatField;
    QApuracaoSaida_IpiSVAL_BASE_ISENTO: TFloatField;
    QApuracaoSaida_IpiSVAL_BASE_OUTRAS: TFloatField;
    QApuracaoSaida_IpiSVAL_BASE_IPI: TFloatField;
    QApuracaoSaida_IpiSVAL_IPI: TFloatField;
    QApuracaoSaida_IpiSVAL_CONTABIL: TFloatField;
    QApuracaoSFilial: TOracleDataSet1;
    QApuracaoSFilialDESC_FILIAL: TStringField;
    QApuracaoSFilialNUM_CGC: TStringField;
    QApuracaoSFilialDESC_INSCRICAO: TStringField;
    QRegSaidaPERC_ALIQUOTA1: TFloatField;
    QRegSaidaVAL_BASE_CALCULO1: TFloatField;
    QRegSaidaVAL_DEBITADO1: TFloatField;
    QRegSaidaVAL_BASE_OUTRAS1: TFloatField;
    QRegSaidaperc_aliquota: TFloatField;
    QRegSaidaval_base_calculo: TFloatField;
    QRegSaidaval_debitado: TFloatField;
    QRegSaidaval_base_outras: TFloatField;
    QApuracaoSaida_Ipi_Analitico: TOracleDataSet1;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    QApuracaoSaida_Ipi_AnaliticoNUM_NOTA: TIntegerField;
    QRegSaidaIcms: TOracleDataSet1;
    QRegSaidaIcmsTIPO_IMPOSTO: TStringField;
    QRegSaidaIcmsESPECIE: TStringField;
    QRegSaidaIcmsCOD_OPERACAO: TFloatField;
    QRegSaidaIcmsCOD_NOTA_CAB: TFloatField;
    QRegSaidaIcmsNUM_NOTA: TFloatField;
    QRegSaidaIcmsCOD_SERIE: TStringField;
    QRegSaidaIcmsDIA: TStringField;
    QRegSaidaIcmsDT_RECEBIMENTO: TDateTimeField;
    QRegSaidaIcmsCOD_ESTADO_DESTINO: TStringField;
    QRegSaidaIcmsNAT_OPERACAO: TFloatField;
    QRegSaidaIcmsPERC_ALIQUOTA1: TFloatField;
    QRegSaidaIcmsVAL_BASE_CALCULO1: TFloatField;
    QRegSaidaIcmsVAL_DEBITADO1: TFloatField;
    QRegSaidaIcmsVAL_BASE_ISENTA: TFloatField;
    QRegSaidaIcmsVAL_BASE_OUTRAS1: TFloatField;
    QRegSaidaIcmsDESC_OBS: TStringField;
    QRegSaidaIcmsNUM_CGC_CPF: TStringField;
    QRegSaidaIcmsNUM_CGC_FILIAL: TStringField;
    QRegSaidaIcmsVAL_TOTAL_IPI: TFloatField;
    QRegSaidaIcmsval_contabil: TFloatField;
    QRegSaidaIcmsval_observacao: TFloatField;
    QRegSaidaIcmsVAL_ICMS_APAGAR: TFloatField;
    QRegSaidaVAL_PIS: TFloatField;
    QRegSaidaVAL_COFINS: TFloatField;
    procedure QRegSaidaCalcFields(DataSet: TDataSet);
    procedure QRegSaidaAfterOpen(DataSet: TDataSet);
    procedure QRegSaidaIcmsCalcFields(DataSet: TDataSet);
    procedure QRegSaidaIcmsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    fCod_NotaCab : Real;

  public
    Property pCod_NotaCab : Real Read fCod_NotaCab Write fCod_NotaCab;
    { Public declarations }
  end;

var
  DMRegSaida: TDMRegSaida;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMRegSaida.QRegSaidaCalcFields(DataSet: TDataSet);
Var wDescAcrescimo,
    wItem : String;
begin
  If QRegSaidaDESC_OBS.Value = 'CANCELADA' then
     QRegSaidaval_contabil.Value := 0
  else
  begin
     If QRegSaidaESPECIE.Value = 'NF' Then
     Begin
       wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS+VAL_FUNRURAL) FROM TB_NOTA_CAB',
                          'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
       If StrToFloat(wDescAcrescimo) = 0 Then
          wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS) FROM TB_NOTA_ITEM',
                          'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
       //Somar o valor de frete. Junior 13/08/2024 - LEONIR DEBONA
       wItem := DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL+VAL_IPI+VAL_FRETE+NVL(VAL_ICMS_SUBST,0)-PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) FROM TB_NOTA_ITEM',
                   'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));

       If Trim(wItem) <> '' Then
         QRegSaidaVal_Contabil.Value := StrToFloat(wItem);
       If Trim(wDescAcrescimo) <> '' Then
         QRegSaidaval_contabil.Value := QRegSaidaval_contabil.Value+StrToFloat(wDescAcrescimo);
{       If QRegSaidaDesc_Obs.Value = 'FUTURA' then
       Begin
         QRegSaidaval_Observacao.Value := QRegSaidaval_contabil.Value;
         QRegSaidaval_contabil.Value := 0;
       End;  }
     End
     Else
       If QRegSaidaEspecie.Value = 'CF' Then // CONHECIMENTO DE FRETES
          QRegSaidaVal_Contabil.Value := QRegSaidaval_base_calculo1.Value + QRegSaidaval_base_outras1.Value + QRegSaidaVAL_BASE_ISENTA.Value
       else
          QRegSaidaVal_Contabil.Text := DMOracle.BuscaNome('SELECT VAL_FRETE FROM TB_NOTA_CAB',
                     'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
     If PCod_NotaCab = QRegSaidaCod_Nota_Cab.Value Then
        QRegSaidaval_contabil.Value := 0;
     PCod_NotaCab := QRegSaidaCod_Nota_Cab.Value;
  End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') And // para inside notas de saida nao deve imprimir valor de icms
     (QRegSaidaVal_Debitado1.Value > 0)  Then
   Begin
     QRegSaidaVal_Base_Outras.Value := QRegSaidaVal_Base_Outras1.Value + QRegSaidaVal_Base_Calculo1.Value;
     QRegSaidaVal_Debitado.Value := 0;
     QRegSaidaVal_Base_Calculo.Value := 0;
     QRegSaidaPerc_Aliquota.Value := 0;
   End
  Else
   Begin
     QRegSaidaVal_Base_Outras.Value := QRegSaidaVal_Base_Outras1.Value;
     QRegSaidaVal_Debitado.Value := QRegSaidaVal_Debitado1.Value;
     QRegSaidaVal_Base_Calculo.Value := QRegSaidaVal_Base_Calculo1.Value;
     QRegSaidaPerc_Aliquota.Value := QRegSaidaPerc_Aliquota1.Value;
   End;

End;

procedure TDMRegSaida.QRegSaidaAfterOpen(DataSet: TDataSet);
begin
  PCod_NotaCab := 0;
end;

procedure TDMRegSaida.QRegSaidaIcmsCalcFields(DataSet: TDataSet);
Var wDescAcrescimo,
    wItem : String;
begin
  If QRegSaidaIcmsDESC_OBS.Value = 'CANCELADA' then
     QRegSaidaIcmsval_contabil.Value := 0
  else
  begin
     If QRegSaidaIcmsESPECIE.Value = 'NF' Then
     Begin
       wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS+VAL_FUNRURAL) FROM TB_NOTA_CAB',
                          'COD_NOTA_CAB = '+FloatToStr(QRegSaidaIcmsCod_Nota_Cab.Value));
       If StrToFloat(wDescAcrescimo) = 0 Then
          wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS) FROM TB_NOTA_ITEM',
                          'COD_NOTA_CAB = '+FloatToStr(QRegSaidaIcmsCod_Nota_Cab.Value));

       wItem := DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL+VAL_IPI+NVL(VAL_ICMS_SUBST,0)-PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) FROM TB_NOTA_ITEM',
                   'COD_NOTA_CAB = '+FloatToStr(QRegSaidaIcmsCod_Nota_Cab.Value));

       If Trim(wItem) <> '' Then
         QRegSaidaIcmsVal_Contabil.Value := StrToFloat(wItem);
       If Trim(wDescAcrescimo) <> '' Then
         QRegSaidaIcmsval_contabil.Value := QRegSaidaIcmsval_contabil.Value+StrToFloat(wDescAcrescimo);
     End
     Else
       If QRegSaidaIcmsEspecie.Value = 'CF' Then // CONHECIMENTO DE FRETES
          QRegSaidaIcmsVal_Contabil.Value := QRegSaidaIcmsval_base_calculo1.Value + QRegSaidaIcmsval_base_outras1.Value + QRegSaidaIcmsVAL_BASE_ISENTA.Value
       else
          QRegSaidaIcmsVal_Contabil.Text := DMOracle.BuscaNome('SELECT VAL_FRETE FROM TB_NOTA_CAB',
                     'COD_NOTA_CAB = '+FloatToStr(QRegSaidaIcmsCod_Nota_Cab.Value));
     If PCod_NotaCab = QRegSaidaIcmsCod_Nota_Cab.Value Then
        QRegSaidaIcmsval_contabil.Value := 0;
     PCod_NotaCab := QRegSaidaIcmsCod_Nota_Cab.Value;
  End;

end;

procedure TDMRegSaida.QRegSaidaIcmsAfterOpen(DataSet: TDataSet);
begin
  PCod_NotaCab := 0;
end;

end.



