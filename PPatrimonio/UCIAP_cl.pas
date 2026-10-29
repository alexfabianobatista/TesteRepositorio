unit UCIAP_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCIAP = class(TDataModule)
    QCIAP: TOracleDataSet1;
    QCIAPCOD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QCIAPCOD_FATOR_ICMS: TIntegerField;
    QCIAPCOD_PATRIMONIO_ITEM: TIntegerField;
    QCIAPVAL_CREDITO: TFloatField;
    QCIAPDT_GERADO_CIAP: TDateTimeField;
    QCIAPVAL_PERDIDO: TFloatField;
    QCIAPCons: TOracleDataSet1;
    QCIAPConsDESC_PRODUTO: TStringField;
    QCIAPConsVAL_CREDITO: TFloatField;
    QCIAPConsDT_GERADO_CIAP: TDateTimeField;
    QCIAPConsDESC_LOCALIZACAO: TStringField;
    QCIAPConsNOME: TStringField;
    QCIAPConsVAL_FATOR: TFloatField;
    QCIAPConsNUM_PATRIMONIO: TIntegerField;
    QCIAPConsDESC_FILIAL: TStringField;
    QCIAPConsCOD_PATRIMONIO_ITEM: TIntegerField;
    QCIAPConsCOD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QCIAPPatrimonio: TOracleDataSet1;
    QCIAPPatrimonioCOD_CONTROLE_CREDITO_ICMS: TIntegerField;
    QCIAPPatrimonioCOD_FATOR_ICMS: TIntegerField;
    QCIAPPatrimonioCOD_PATRIMONIO_ITEM: TIntegerField;
    QCIAPPatrimonioVAL_CREDITO: TFloatField;
    QCIAPPatrimonioVAL_PERDIDO: TFloatField;
    QCIAPPatrimonioDT_GERADO_CIAP: TDateTimeField;
    QCIAPPatrimonioVAL_FATOR: TFloatField;
    QRFichaCIAP: TOracleDataSet1;
    QRFichaCIAPCOD_PATRIMONIO_ITEM: TIntegerField;
    QRFichaCIAPDESC_PRODUTO: TStringField;
    QRFichaCIAPNUM_ORDEM: TIntegerField;
    QRFichaCIAPNUM_LRE: TIntegerField;
    QRFichaCIAPNUM_FOLHA_LRE: TIntegerField;
    QRFichaCIAPDT_AQUISICAO: TDateTimeField;
    QRFichaCIAPVAL_ICMS: TFloatField;
    QRFichaCIAPVAL_FATOR: TFloatField;
    QRFichaCIAPVAL_CREDITO: TFloatField;
    QRFichaCIAPDT_GERADO_CIAP: TDateTimeField;
    QRFichaCIAPFORNECEDOR: TStringField;
    QRFichaCIAPNUM_NOTA: TIntegerField;
    QRFichaCIAPDESC_FILIAL: TStringField;
    QRFichaCIAPDESC_INSCRICAO: TStringField;
    QRFichaCIAPNUM_NOTA_SAIDA: TIntegerField;
    QRFichaCIAPDT_EMISSAO: TDateTimeField;
    QRFichaCIAPMODELO: TFloatField;
    QRFichaCIAPDESC_PERDA_CIAP: TStringField;
    QRFichaCIAPDT_PERDA_CIAP: TDateTimeField;
    QRContabil: TOracleDataSet1;
    QRControle: TOracleDataSet1;
    QRControleNUM_ORDEM: TFloatField;
    QRControleCOD_FILIAL: TFloatField;
    QRControleNUM_ANO: TStringField;
    QRControleVAL_CREDITO_JAN: TFloatField;
    QRControleVAL_CREDITO_FEV: TFloatField;
    QRControleVAL_CREDITO_MAR: TFloatField;
    QRControleVAL_CREDITO_ABR: TFloatField;
    QRControleVAL_CREDITO_MAI: TFloatField;
    QRControleVAL_CREDITO_JUN: TFloatField;
    QRControleVAL_CREDITO_JUL: TFloatField;
    QRControleVAL_CREDITO_AGO: TFloatField;
    QRControleVAL_CREDITO_SET: TFloatField;
    QRControleVAL_CREDITO_OUT: TFloatField;
    QRControleVAL_CREDITO_NOV: TFloatField;
    QRControleVAL_CREDITO_DEZ: TFloatField;
    QRControleVAL_CREDITO_TOTAL: TFloatField;
    QRControleDESC_FILIAL: TStringField;
    QRControleDESC_PERIODO_BASE: TStringField;
    QRConferencia: TOracleDataSet1;
    QRConferenciaNUM_ORDEM: TFloatField;
    QRConferenciaCOD_FILIAL: TFloatField;
    QRConferenciaNUM_ANO: TStringField;
    QRConferenciaDESC_FILIAL: TStringField;
    QRConferenciaVAL_ICMS: TFloatField;
    QRConferenciaVAL_ICMS_DIV_48: TFloatField;
    QRConferenciaVAL_PERDIDO_JAN: TFloatField;
    QRConferenciaVAL_PERDIDO_FEV: TFloatField;
    QRConferenciaVAL_PERDIDO_MAR: TFloatField;
    QRConferenciaVAL_PERDIDO_ABR: TFloatField;
    QRConferenciaVAL_PERDIDO_MAI: TFloatField;
    QRConferenciaVAL_PERDIDO_JUN: TFloatField;
    QRConferenciaVAL_PERDIDO_JUL: TFloatField;
    QRConferenciaVAL_PERDIDO_AGO: TFloatField;
    QRConferenciaVAL_PERDIDO_SET: TFloatField;
    QRConferenciaVAL_PERDIDO_OUT: TFloatField;
    QRConferenciaVAL_PERDIDO_NOV: TFloatField;
    QRConferenciaVAL_PERDIDO_DEZ: TFloatField;
    QRConferenciaVAL_PERDIDO_TOTAL: TFloatField;
    QRConferenciaNUM_NOTA: TIntegerField;
    QRConferenciaDESC_PRODUTO: TStringField;
    QRContabilDESC_PLANO_CONTA: TStringField;
    QRContabilDT_AQUISICAO: TDateTimeField;
    QRContabilVAL_ICMS: TFloatField;
    QRContabilVAL_PARC_MENSAL: TFloatField;
    QRContabilVAL_REC: TFloatField;
    QRContabilVAL_PER: TFloatField;
    QRContabilVAL_A_RECUPERAR: TFloatField;
    QRContabilVAL_CREDITO_REC_JAN: TFloatField;
    QRContabilVAL_CREDITO_PER_JAN: TFloatField;
    QRContabilVAL_CREDITO_REC_FEV: TFloatField;
    QRContabilVAL_CREDITO_PER_FEV: TFloatField;
    QRContabilVAL_CREDITO_REC_MAR: TFloatField;
    QRContabilVAL_CREDITO_PER_MAR: TFloatField;
    QRContabilVAL_CREDITO_REC_ABR: TFloatField;
    QRContabilVAL_CREDITO_PER_ABR: TFloatField;
    QRContabilVAL_CREDITO_REC_MAI: TFloatField;
    QRContabilVAL_CREDITO_PER_MAI: TFloatField;
    QRContabilVAL_CREDITO_REC_JUN: TFloatField;
    QRContabilVAL_CREDITO_PER_JUN: TFloatField;
    QRContabilVAL_CREDITO_REC_JUL: TFloatField;
    QRContabilVAL_CREDITO_PER_JUL: TFloatField;
    QRContabilVAL_CREDITO_REC_AGO: TFloatField;
    QRContabilVAL_CREDITO_PER_AGO: TFloatField;
    QRContabilVAL_CREDITO_REC_SET: TFloatField;
    QRContabilVAL_CREDITO_PER_SET: TFloatField;
    QRContabilVAL_CREDITO_REC_OUT: TFloatField;
    QRContabilVAL_CREDITO_PER_OUT: TFloatField;
    QRContabilVAL_CREDITO_REC_NOV: TFloatField;
    QRContabilVAL_CREDITO_PER_NOV: TFloatField;
    QRContabilVAL_CREDITO_REC_DEZ: TFloatField;
    QRContabilVAL_CREDITO_PER_DEZ: TFloatField;
    QRContabildesc_dt_entrada_icms: TStringField;
    QRContabilval_icms_anterior: TFloatField;
    QRContabilval_a_recuperar_calculado: TFloatField;
    QRContabilDESC_FILIAL: TStringField;
    QRFichaCIAPDESC_MES: TStringField;
    QCIAPval: TFloatField;
    QRContabilDESC_PRODUTO: TStringField;
    QRContabilval_per_calculado: TFloatField;
    QRContabilNUM_ORDEM: TIntegerField;
    QRContabilCOD_REDUZIDO: TIntegerField;
    QRContabilCOD_LOCALIZACAO: TIntegerField;
    QRContabilCOD_FILIAL: TIntegerField;
    QRContabilCOD_PATRIMONIO_ITEM: TIntegerField;
    procedure QRContabilCalcFields(DataSet: TDataSet);
    procedure QCIAPBeforePost(DataSet: TDataSet);
    procedure QCIAPCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCIAP: TDMCIAP;

implementation

uses UOracle_cl, UPatrimonioCad, UPatrimonio_cl;

{$R *.DFM}

//--------------------------------------
Function PrimeiroDiaDoMes (Data : TDateTime) : TDateTime;
var
  Ano, Mes, Dia : word;
  DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  primeiroDiaDoMes := EncodeDate (Ano, Mes, Dia);
end;

Function UltimoDiaDoMes (Data : TDateTime) : TDateTime;
var
  AuxData : TDateTime;
  DiaDaSemana : Integer;
begin
  AuxData := primeiroDiaDoMes (IncMonth(Data,1)) - 1;
  UltimoDiaDoMes := AuxData;
end;
//--------------------------

procedure TDMCIAP.QRContabilCalcFields(DataSet: TDataSet);
var wVal : string;
begin
  if QRContabilDT_AQUISICAO.Value < StrToDate('01/01/' + QRContabil.GetVariable('NUM_ANO')) then
    QRContabildesc_dt_entrada_icms.Value := 'Sld. Ant.'
  else
    QRContabildesc_dt_entrada_icms.Value := QRContabilDT_AQUISICAO.AsString;

  wVal := DMOracle.BuscaNome
  (
   'SELECT SUM(VAL_CREDITO + VAL_PERDIDO) ' +
   ' FROM TB_PATRIMONIO_ITEM, TB_CONTROLE_CREDITO_ICMS',
   ' TB_PATRIMONIO_ITEM.COD_PATRIMONIO_ITEM = TB_CONTROLE_CREDITO_ICMS.COD_PATRIMONIO_ITEM' +
   ' AND TB_PATRIMONIO_ITEM.COD_PATRIMONIO_ITEM = ' + IntToStr(QRContabilCOD_PATRIMONIO_ITEM.AsInteger) +
   ' AND TO_CHAR(TB_CONTROLE_CREDITO_ICMS.DT_GERADO_CIAP, '+CHR(39)+'YYYY'+CHR(39)+') < ' + QRContabil.GetVariable('NUM_ANO')
  );

  if wVal <> '' then
    QRContabilval_icms_anterior.Value := QRContabilVAL_ICMS.Value - StrToFloat(wVal)
  else
    QRContabilval_icms_anterior.Value := QRContabilVAL_ICMS.Value;

  wVal := DMOracle.BuscaNome(' SELECT DT_TRANSFERENCIA '+
                             ' FROM TB_PATRIMONIO_TRANSF ',
                             ' COD_PATRIMONIO_ITEM = ' + IntToStr(QRContabilCOD_PATRIMONIO_ITEM.AsInteger)+
                             ' AND TO_CHAR(DT_TRANSFERENCIA, ' + CHR(39) + 'YYYY' + CHR(39) + ') <= ' + QRContabil.GetVariable('NUM_ANO'));

  wVal := wVal + DMOracle.BuscaNome(
                             ' SELECT DT_BAIXA '+
                             ' FROM TB_PATRIMONIO_ITEM ',
                             ' COD_PATRIMONIO_ITEM = ' + IntToStr(QRContabilCOD_PATRIMONIO_ITEM.AsInteger)+
                             ' AND TO_CHAR(DT_BAIXA, ' + CHR(39) + 'YYYY' + CHR(39) + ') <= ' + QRContabil.GetVariable('NUM_ANO'));

  if trim(wVal) <> '' then //se o patrimonio foi baixado ou transferido
  begin
    QRContabilval_a_recuperar_calculado.Value := 0;
    QRContabilval_per_calculado.Value := QRContabilVAL_ICMS.Value - QRContabilVAL_REC.Value;
  end
  else
  begin
    QRContabilval_a_recuperar_calculado.Value := QRContabilval_icms_anterior.Value - QRContabilVAL_PER.Value - QRContabilVAL_REC.Value;
    QRContabilval_per_calculado.Value := QRContabilVAL_PER.Value;
  end;
end;

procedure TDMCIAP.QCIAPBeforePost(DataSet: TDataSet);
var
  wVal : string;
begin
  wVal := DMOracle.BuscaNome(
           'SELECT IND_CONFIRMADO FROM TB_PATRIMONIO_ITEM',
           'COD_PATRIMONIO_ITEM = ' + inttostr(DMCIAP.QCIAPCOD_PATRIMONIO_ITEM.value));

  if wVal <> 'SIM' then
  begin
    QCIAP.cancel;
    raise Exception.Create('Esse Patrimônio ainda não foi confirmado!');
  end;
end;

procedure TDMCIAP.QCIAPCalcFields(DataSet: TDataSet);
var
  wData : TDate;
  wVal : string;
  wSql : string;
  wValICMS : Real;
  wValFator : Real;
begin

  if QCIAPCOD_FATOR_ICMS.Text <> '' then
  begin
    //CALCULA A DATA QUE FOI GERADO O CIAP
    wSql := '';
    wSql := wSql + ' SELECT TO_DATE('+chr(39)+'01/'+chr(39)+'||NUM_MES||'+chr(39)+'/'+chr(39)+'||NUM_ANO) AS DT  ';
    wSql := wSql + ' FROM TB_FATOR_ICMS ';
    wVal := DMOracle.BuscaNome(wSql,'COD_FATOR_ICMS = ' + QCIAPCOD_FATOR_ICMS.Text);
    if trim(wVal) <> '' then
    begin
      wData := StrToDate(wVal);
      wData := UltimoDiaDoMes(wData);
      if QCIAPDT_GERADO_CIAP.Value <> wData then
        QCIAPDT_GERADO_CIAP.Value := wData;
    end;
    //------------------------------
  end;


  {
  //VALOR NAO RECUPERADO - CALCULA AUTOMATICAMENTE
  if (QCIAPVAL_CREDITO.Text <> '') and (QCIAPVAL_PERDIDO.Text = '') and (QCIAPCOD_FATOR_ICMS.Text <> '') then
  begin
    wSql := '';
    wSql := wSql + ' SELECT VAL_FATOR  ';
    wSql := wSql + ' FROM TB_FATOR_ICMS ';
    wVal := DMOracle.BuscaNome(wSql,'COD_FATOR_ICMS = ' + QCIAPCOD_FATOR_ICMS.Text);

    if wVal <> '' then
    begin
      QCIAP.AutoCalcFields := false;
      if strtofloat(wVal) <> 0 then //pra nao dar divisao por zero
        QCIAPVAL_PERDIDO.Value := ( ( (1/48) * QCIAPVAL_CREDITO.Value) / strtofloat(wVal) ) - QCIAPVAL_CREDITO.Value
      else
        QCIAPVAL_PERDIDO.Value := QCIAPVAL_CREDITO.Value;
      QCIAPVAL_CREDITO.Value := QCIAPVAL_CREDITO.Value - QCIAPVAL_PERDIDO.Value;
      QCIAP.AutoCalcFields := true;
    end;
  end;
  }

  if (QCIAPVAL_CREDITO.Text = '') and (QCIAPVAL_PERDIDO.Text = '') and (QCIAPCOD_FATOR_ICMS.Text <> '') and (QCIAPCOD_PATRIMONIO_ITEM.Text <> '') then
  begin
     wVal := DMOracle.BuscaNome('SELECT VAL_ICMS FROM TB_PATRIMONIO_ITEM','COD_PATRIMONIO_ITEM = ' + QCIAPCOD_PATRIMONIO_ITEM.Text);
     if wVal <> '' then
     begin
       wValICMS := StrToFloat(wVal);
       wVal := DMOracle.BuscaNome('SELECT VAL_FATOR FROM TB_FATOR_ICMS','COD_FATOR_ICMS = ' + QCIAPCOD_FATOR_ICMS.Text);
       if wVal <> '' then
       begin
         QCIAP.AutoCalcFields := false;
         wValFator := StrToFloat(wVal);
         QCIAPVAL_CREDITO.Value := wValICMS * wValFator;
         QCIAPVAL_PERDIDO.Value := wValICMS * (1/48 - wValFator);
         QCIAP.AutoCalcFields := true;
       end;
     end;
  end;
end;

end.
