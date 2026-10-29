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
    QRegSaidaPERC_ALIQUOTA: TFloatField;
    QRegSaidaVAL_BASE_CALCULO: TFloatField;
    QRegSaidaVAL_DEBITADO: TFloatField;
    QRegSaidaVAL_BASE_ISENTA: TFloatField;
    QRegSaidaVAL_BASE_OUTRAS: TFloatField;
    QRegSaidaDESC_OBS: TStringField;
    QRegSaidaval_contabil: TFloatField;
    QRegSaidaval_observacao: TFloatField;
    procedure QRegSaidaCalcFields(DataSet: TDataSet);
    procedure QRegSaidaAfterOpen(DataSet: TDataSet);
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

uses UOracle_cl;

{$R *.DFM}

procedure TDMRegSaida.QRegSaidaCalcFields(DataSet: TDataSet);
Var wDescAcrescimo,
    wItem : String;
begin
  If QRegSaidaDesc_Obs.Value = 'CANCELADA' then
     QRegSaidaval_contabil.Value := 0
  else
  begin
     If QRegSaidaEspecie.Value = 'NF' Then
     Begin
       wDescAcrescimo := DMOracle.BuscaNome('SELECT SUM(VAL_DESPESAS-VAL_DESCONTO+VAL_FUNRURAL) FROM TB_NOTA_CAB',
                          'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
       wItem := DMOracle.BuscaNome('SELECT SUM(VAL_TOTAL+VAL_IPI) FROM TB_NOTA_ITEM',
                   'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
       If Trim(wItem) <> '' Then
         QRegSaidaVal_Contabil.Value := StrToFloat(wItem);
       If Trim(wDescAcrescimo) <> '' Then
         QRegSaidaval_contabil.Value := QRegSaidaVal_Contabil.Value+StrToFloat(wDescAcrescimo);
{       If QRegSaidaDesc_Obs.Value = 'FUTURA' then
       Begin
         QRegSaidaval_Observacao.Value := QRegSaidaval_contabil.Value;
         QRegSaidaval_contabil.Value := 0;
       End;  }
     End
     Else
       If QRegSaidaEspecie.Value = 'CF' Then // CONHECIMENTO DE FRETES
          QRegSaidaVal_Contabil.Value := QRegSaidaVal_Base_Calculo.Value + QRegSaidaVal_Base_Outras.Value
       else    
          QRegSaidaVal_Contabil.Text := DMOracle.BuscaNome('SELECT VAL_FRETE FROM TB_NOTA_CAB',
                     'COD_NOTA_CAB = '+FloatToStr(QRegSaidaCod_Nota_Cab.Value));
     If PCod_NotaCab = QRegSaidaCod_Nota_Cab.Value Then
        QRegSaidaval_contabil.Value := 0;
     PCod_NotaCab := QRegSaidaCod_Nota_Cab.Value;
  End;
end;

procedure TDMRegSaida.QRegSaidaAfterOpen(DataSet: TDataSet);
begin
  PCod_NotaCab := 0;
end;

end.
