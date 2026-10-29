unit UGia_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMGia = class(TDataModule)
    DSGia: TDataSource;
    QSomaNota: TOracleDataSet1;
    QSomaNotaSVAL_ICM: TFloatField;
    QSomaNotaSVAL_CONTABIL: TFloatField;
    QSomaNotaSVAL_ICM_BASE: TFloatField;
    QGiaCons: TOracleDataSet1;
    QGiaConsCOD_FILIAL: TIntegerField;
    QGiaConsNUM_ANO: TIntegerField;
    QGiaConsNUM_MES: TIntegerField;
    QGia: TOracleDataSet1;
    QGiaCOD_FILIAL: TIntegerField;
    QGiaNUM_ANO: TIntegerField;
    QGiaNUM_MES: TIntegerField;
    QGiaVAL_02: TFloatField;
    QGiaVAL_04: TFloatField;
    QGiaVAL_06: TFloatField;
    QGiaVAL_Q06: TFloatField;
    QGiaVAL_Q07_NUM_FUNC: TIntegerField;
    QGiaVAL_Q07_FOLHA: TFloatField;
    QGiaVAL_17: TFloatField;
    QGiaVAL_18: TFloatField;
    QGiaVAL_27: TFloatField;
    QGiaVAL_28: TFloatField;
    QGiaVAL_55: TFloatField;
    QGiaVAL_56: TFloatField;
    QGiaVAL_58: TFloatField;
    QGiaVAL_59: TFloatField;
    QGiaVAL_54: TFloatField;
    QGiaVAL_65: TFloatField;
    QGiaVAL_67: TFloatField;
    QGiaVAL_68: TFloatField;
    QGiaVAL_69: TFloatField;
    QGiaNUM_CRC_CONTADOR: TStringField;
    QGiaNOME_CONTADOR: TStringField;
    QGianum_cgc_filial: TStringField;
    QGianome_filial: TStringField;
    QGiaEnd_Filial: TStringField;
    QGiaCidade_filial: TStringField;
    QGiaval_10: TFloatField;
    QGiaval_11: TFloatField;
    QGiaval_21: TFloatField;
    QGiaval_13: TFloatField;
    QGiaval_23: TFloatField;
    QGiaval_14: TFloatField;
    QGiaval_24: TFloatField;
    QGiaval_15: TFloatField;
    QGiaval_25: TFloatField;
    QGiaval_16: TFloatField;
    QGiaval_26: TFloatField;
    QGiaval_19: TFloatField;
    QGiaval_29: TFloatField;
    QGiaval_20: TFloatField;
    QGiaval_30: TFloatField;
    QGiaval_35: TFloatField;
    QGiaval_45: TFloatField;
    QGiaval_34: TFloatField;
    QGiaval_44: TFloatField;
    QGiaval_31: TFloatField;
    QGiaval_41: TFloatField;
    QGiaval_33: TFloatField;
    QGiaval_43: TFloatField;
    QGiaval_39: TFloatField;
    QGiaval_49: TFloatField;
    QGiaval_36: TFloatField;
    QGiaval_46: TFloatField;
    QGiaval_40: TFloatField;
    QGiaval_50: TFloatField;
    QGiaval_51: TFloatField;
    QGiaval_52: TFloatField;
    QGiaval_53: TFloatField;
    QGiaval_60: TFloatField;
    QGiaval_61: TFloatField;
    QGiaval_62: TFloatField;
    QGiaval_63: TFloatField;
    QGiaval_64: TFloatField;
    QGiaval_66: TFloatField;
    QGiaval_70: TFloatField;
    QGiaval_80: TFloatField;
    QGiaval_90: TFloatField;
    QGiadesc_inscricao_filial: TStringField;
    procedure QGiaCalcFields(DataSet: TDataSet);
    procedure QGiaAfterPost(DataSet: TDataSet);
    procedure QGiaBeforeOpen(DataSet: TDataSet);
    procedure QGiaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    Procedure SomaGia(Var wValorContabil,wBase,wIcms:Real;wNat1,wNat2,wNat3,wNat4,wNat5,wNat6:Integer;wTipo:String);
  public
    { Public declarations }
  end;

var
  DMGia: TDMGia;

implementation

uses ULivroFiscal_Cl, UFilial_cl, UOracle_cl;

{$R *.DFM}

procedure TDMGia.QGiaCalcFields(DataSet: TDataSet);
Var wValContabil, wValBase,wValIcms : Real;
    wDD,wMM,wYY,Nr_Dias_Mes : String;
    wDtRef : TdateTime;
begin
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',QGiaCod_Filial.Value);
    QFilial.Open;
    QGianum_cgc_filial.Value := QFilialNum_CGC.Value;
    QGiadesc_inscricao_filial.Value := QFilialDesc_Inscricao.Value;
    QGianome_filial.Value := QFilialDesc_Filial.Value;
    QGiaEnd_Filial.Value := QFilialDesc_Endereco.Value;
    QGiaCidade_Filial.Value := QFilialDesc_Cidade.Value;
  End;
  QGiaval_10.Value := QGiaVal_02.Value
                     +QGiaVal_04.Value
                     +QGiaVal_06.Value;
  QSomaNota.Close;
  QSomaNota.SetVariable('FILIAL',QGiaCod_Filial.Value);
  wDD        := '01';
  wMM        := FloatToStr(QGiaNum_Mes.Value);
  wYY        := FloatToStr(QGiaNum_Ano.Value);
  wDtRef     := StrToDate((wDD+'/'+wMM+'/'+wYY));
  Nr_Dias_Mes:= FloatToStr(DMOracle.DiasNoMes(wDtRef));

  QSomaNota.SetVariable('DATA_I',wDtRef);

  wMM        := FloatToStr(QGiaNum_Mes.Value);
  wYY        := FloatToStr(QGiaNum_Ano.Value);
  wDtRef     := StrToDate((Nr_Dias_Mes+'/'+wMM+'/'+wYY));

  QSomaNota.SetVariable('DATA_F',wDtRef);
  wValContabil := 0;
  wValBase := 0;
  // Campo 11 e 21
  SomaGia(wValContabil,wValBase,wValIcms,110,160,195,0,0,0,'E');
  QGiaVal_11.Value := wValContabil;
  QGiaVal_21.Value := wValBase;

  // Campo 13 e 23
  SomaGia(wValContabil,wValBase,wValIcms,210,260,295,0,0,0,'E');
  QGiaVal_13.Value := wValContabil;
  QGiaVal_23.Value := wValBase;

  // Campo 14 e 24
  SomaGia(wValContabil,wValBase,wValIcms,310,350,399,0,0,0,'E');
  QGiaVal_14.Value := wValContabil;
  QGiaVal_24.Value := wValBase;

  // Campo 15 e 25
  QGiaVal_15.Value := 0;
  QGiaVal_25.Value := 0;

  // Campo 16 e 26
  SomaGia(wValContabil,wValBase,wValIcms,191,192,197,198,291,292,'E');
  QGiaVal_16.Value := wValContabil;
  QGiaVal_26.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,297,298,391,397,0,0,'E');
  QGiaVal_16.Value := QGiaVal_16.Value+wValContabil;
  QGiaVal_26.Value := QGiaVal_26.Value+wValBase;

  // Campo 17 e 27
  SomaGia(wValContabil,wValBase,wValIcms,140,240,330,0,0,0,'E');
  QGiaVal_17.Value := wValContabil;
  QGiaVal_27.Value := wValBase;

  // Campo 18 e 28
  SomaGia(wValContabil,wValBase,wValIcms,150,250,340,0,0,0,'E');
  QGiaVal_18.Value := wValContabil;
  QGiaVal_28.Value := wValBase;

  // Campo 19 e 29
  SomaGia(wValContabil,wValBase,wValIcms,120,130,180,193,196,199,'E');
  QGiaVal_19.Value := wValContabil;
  QGiaVal_29.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,230,270,292,293,294,296,'E');
  QGiaVal_19.Value := QGiaVal_19.Value + wValContabil;
  QGiaVal_29.Value := QGiaVal_29.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,299,324,394,0,0,0,'E');
  QGiaVal_19.Value := QGiaVal_19.Value + wValContabil;
  QGiaVal_29.Value := QGiaVal_29.Value + wValBase;

  QGiaVal_20.Value := QGiaVal_11.Value
                     +QGiaVal_13.Value
                     +QGiaVal_14.Value
                     +QGiaVal_15.Value
                     +QGiaVal_16.Value
                     +QGiaVal_17.Value
                     +QGiaVal_18.Value
                     +QGiaVal_19.Value;

  QGiaVal_30.Value := QGiaVal_21.Value
                     +QGiaVal_23.Value
                     +QGiaVal_24.Value
                     +QGiaVal_25.Value
                     +QGiaVal_26.Value
                     +QGiaVal_27.Value
                     +QGiaVal_28.Value
                     +QGiaVal_29.Value;

  // Campo 31 e 41
  SomaGia(wValContabil,wValBase,wValIcms,510,540,550,560,596,0,'S');
  QGiaVal_31.Value := wValContabil;
  QGiaVal_41.Value := wValBase;

  // Campo 33 e 43
  SomaGia(wValContabil,wValBase,wValIcms,610,640,650,660,696,0,'S');
  QGiaVal_33.Value := wValContabil;
  QGiaVal_43.Value := wValBase;

  // Campo 34 e 44
  SomaGia(wValContabil,wValBase,wValIcms,710,750,760,0,0,0,'S');
  QGiaVal_34.Value := wValContabil;
  QGiaVal_44.Value := wValBase;

  // Campo 35 e 45
  QGiaVal_35.Value := 0;
  QGiaVal_45.Value := 0;

  // Campo 36 e 46
  SomaGia(wValContabil,wValBase,wValIcms,591,592,595,691,692,695,'S');
  QGiaVal_36.Value := wValContabil;
  QGiaVal_46.Value := wValBase;

  // Campo 39 e 49
  SomaGia(wValContabil,wValBase,wValIcms,520,530,570,580,593,594,'S');
  QGiaVal_39.Value := wValContabil;
  QGiaVal_49.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,597,599,620,630,670,693,'S');
  QGiaVal_39.Value := QGiaVal_39.Value + wValContabil;
  QGiaVal_49.Value := QGiaVal_49.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,694,699,720,730,740,799,'S');
  QGiaVal_39.Value := QGiaVal_39.Value + wValContabil;
  QGiaVal_49.Value := QGiaVal_49.Value + wValBase;

  QGiaVal_40.Value := QGiaVal_31.Value
                     +QGiaVal_33.Value
                     +QGiaVal_34.Value
                     +QGiaVal_35.Value
                     +QGiaVal_36.Value
                     +QGiaVal_39.Value;

  QGiaVal_50.Value := QGiaVal_41.Value
                     +QGiaVal_43.Value
                     +QGiaVal_44.Value
                     +QGiaVal_45.Value
                     +QGiaVal_46.Value
                     +QGiaVal_49.Value;
  // Quadro 09
  With DMLivroFiscal do
  Begin
    QResumoApuracao.Close;
    QResumoApuracao.SetVariable('FILIAL',QGiaCod_Filial.Value);
    QResumoApuracao.SetVariable('ANO',QGiaNum_Ano.Value);
    QResumoApuracao.SetVariable('MES',QGiaNum_Mes.Value);
    if QGiaNum_Mes.Value = 1 Then
    begin
      QResumoApuracao.SetVariable('ANO_ANT',QGiaNum_Ano.Value-1);
      QResumoApuracao.SetVariable('MES_ANT',12);
    end
    Else
    Begin
      QResumoApuracao.SetVariable('ANO_ANT',QGiaNum_Ano.Value);
      QResumoApuracao.SetVariable('MES_ANT',QGiaNum_Mes.Value-1);
    End;
    QResumoApuracao.Open;
    If QResumoApuracao.Locate('COD_OPERACAO',001,[]) Then
      QGiaVal_51.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_51.Value := 0;
    If QResumoApuracao.Locate('COD_OPERACAO',002,[]) Then
      QGiaVal_52.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_52.Value := 0;
    If QResumoApuracao.Locate('COD_OPERACAO',003,[]) Then
      QGiaVal_53.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_53.Value := 0;
    QGiaVal_60.Value := QGiaVal_51.Value
                       +QGiaVal_52.Value
                       +QGiaVal_53.Value
                       +QGiaVal_54.Value
                       +QGiaVal_55.Value
                       +QGiaVal_56.Value
                       +QGiaVal_58.Value
                       +QGiaVal_59.Value;
    If QResumoApuracao.Locate('COD_OPERACAO',009,[]) Then
      QGiaVal_61.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_61.Value := 0;
    If QResumoApuracao.Locate('COD_OPERACAO',005,[]) Then
      QGiaVal_62.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_62.Value := 0;
    If QResumoApuracao.Locate('COD_OPERACAO',006,[]) Then
      QGiaVal_63.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_63.Value := 0;
    If QResumoApuracao.Locate('COD_OPERACAO',007,[]) Then
      QGiaVal_64.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_64.Value := 0;

    // Campo 66
    SomaGia(wValContabil,wValBase,wValIcms,191,197,291,297,0,0,'E');
    QGiaVal_66.Value := wValIcms;
    QGiaVal_62.Value := QGiaVal_62.Value - wValIcms;

    QGiaVal_70.Value := QGiaVal_61.Value
                       +QGiaVal_62.Value
                       +QGiaVal_63.Value
                       +QGiaVal_64.Value
                       +QGiaVal_65.Value
                       +QGiaVal_66.Value
                       +QGiaVal_67.Value
                       +QGiaVal_68.Value
                       +QGiaVal_69.Value;
    If QGiaVal_70.Value > QGiaVal_60.Value Then
      QGiaVal_80.Value := QGiaVal_70.Value - QGiaVal_60.Value
    Else
      qGiaVal_80.Value := 0;
    If QGiaVal_70.Value < QGiaVal_60.Value Then
      QGiaVal_90.Value := QGiaVal_60.Value - QGiaVal_70.Value
    Else
      qGiaVal_90.Value := 0;
  End;
  QSomaNota.Close;
end;

procedure TDMGia.QGiaAfterPost(DataSet: TDataSet);
Var wFilial, wAno, wMes : Real;
begin
  wFilial := QGiaCod_Filial.Value;
  wAno := QGiaNUM_Ano.Value;
  wMes := QGiaNum_Mes.Value;
  QGia.Close;
  QGia.SetVariable('FILIAL',wFilial);
  QGia.SetVariable('ANO',wAno);
  QGia.SetVariable('MES',wMes);
  QGia.Open;
end;

Procedure TDMGia.SomaGia(Var wValorContabil,wBase,wIcms:Real;wNat1, wNat2, wNat3, wNat4, wNat5,
  wNat6: Integer;wTipo:String);
Var wNatFim : Integer;
    wByte : Real;
begin
  wValorContabil := 0;
  wBase := 0;
  wIcms := 0;
  QSomaNota.Close;
  QSomaNota.SetVariable('ENTRADA_SAIDA',wTipo);
  If wNat1 > 0 Then
  Begin
    wNatFim :=wNat1;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat1),3,1));
    if wByte = 0 Then
       wNatFim := wNat1 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat1);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat2 > 0 Then
  Begin
    wNatFim :=wNat2;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat2),3,1));
    if wByte = 0 Then
       wNatFim := wNat2 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat2);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat3 > 0 Then
  Begin
    wNatFim :=wNat3;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat3),3,1));
    if wByte = 0 Then
       wNatFim := wNat3 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat3);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat4 > 0 Then
  Begin
    wNatFim :=wNat4;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat4),3,1));
    if wByte = 0 Then
       wNatFim := wNat4 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat4);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat5 > 0 Then
  Begin
    wNatFim :=wNat5;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat5),3,1));
    if wByte = 0 Then
       wNatFim := wNat5 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat5);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat6 > 0 Then
  Begin
    wNatFim :=wNat6;
    wByte :=  StrToFloat(Copy(FloatToStr(wNat6),3,1));
    if wByte = 0 Then
       wNatFim := wNat6 + 10;
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat6);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNatFim);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
end;

procedure TDMGia.QGiaBeforeOpen(DataSet: TDataSet);
begin
  QGia.AutoCalcFields := True;
end;

procedure TDMGia.QGiaAfterOpen(DataSet: TDataSet);
begin
  QGia.AutoCalcFields := False;
end;

end.
