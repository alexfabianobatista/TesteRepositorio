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
    QGiadesc_val_55: TStringField;
    QGiadesc_val_65: TStringField;
    procedure QGiaCalcFields(DataSet: TDataSet);
    procedure QGiaAfterPost(DataSet: TDataSet);
    procedure QGiaBeforeOpen(DataSet: TDataSet);
    procedure QGiaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    Procedure SomaGia(Var wValorContabil,wBase,wIcms:Real;wNat1,wNat1F,wNat2,wNat2F,wNat3,wNat3F,wNat4,wNat4F,wNat5,wNat5F,wNat6,wNat6F:Integer;wTipo:String);
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
//  QSomaNota.SetVariable('DATA_I',strtodate('08/01/2007'));

  wMM        := FloatToStr(QGiaNum_Mes.Value);
  wYY        := FloatToStr(QGiaNum_Ano.Value);
  wDtRef     := StrToDate((Nr_Dias_Mes+'/'+wMM+'/'+wYY));

  QSomaNota.SetVariable('DATA_F',wDtRef);
//  QSomaNota.SetVariable('DATA_F',strtodate('08/01/2007'));
  wValContabil := 0;
  wValBase := 0;                         //OS VALORES SEMPRE TRABALHAM EM PARES SENDO O PRIMEIRO VALOR INICIAL E
  // Campo 11 e 21                         O SEGUNDO VALOR O FINAL - FORMANDO ASSIM UM INTERVALO
  SomaGia(wValContabil,wValBase,wValIcms,1101,1126,1151,1152,1154,1154,1201,1204,1206,1206,1208,1209,'E');
  QGiaVal_11.Value := wValContabil;
  QGiaVal_21.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,1351,1356,1501,1501,1503,1504,1651,1651,1658,1658,1660,1660,'E');
  QGiaVal_11.Value := QGiaVal_11.Value + wValContabil;
  QGiaVal_21.Value := QGiaVal_21.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,1932,1932,0,0,0,0,0,0,0,0,0,0,'E');
  QGiaVal_11.Value := QGiaVal_11.Value + wValContabil;
  QGiaVal_21.Value := QGiaVal_21.Value + wValBase;

  // Campo 13 e 23
  SomaGia(wValContabil,wValBase,wValIcms,2101,2126,2151,2152,2154,2154,2201,2204,2206,2206,2208,2209,'E');
  QGiaVal_13.Value := wValContabil;
  QGiaVal_23.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,2351,2356,2501,2501,2503,2504,2651,2653,2658,2658,2660,2660,'E');
  QGiaVal_13.Value := QGiaVal_13.Value + wValContabil;
  QGiaVal_23.Value := QGiaVal_23.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,2932,2932,0,0,0,0,0,0,0,0,0,0,'E');
  QGiaVal_13.Value := QGiaVal_13.Value + wValContabil;
  QGiaVal_23.Value := QGiaVal_23.Value + wValBase;

  // Campo 14 e 24
  SomaGia(wValContabil,wValBase,wValIcms,3101,3102,3126,3127,3201,3202,3206,3206,3211,3211,3351,3356,'E');
  QGiaVal_14.Value := wValContabil;
  QGiaVal_24.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,3503,3503,3651,3651,3930,3930,3949,3949,0,0,0,0,'E');
  QGiaVal_14.Value := QGiaVal_14.Value + wValContabil;
  QGiaVal_24.Value := QGiaVal_24.Value + wValBase;

  // Campo 15 e 25
  SomaGia(wValContabil,wValBase,wValIcms,1401,1401,1403,1403,1406,1411,1414,1415,1652,1653,1659,1659,'E');
  QGiaVal_15.Value := wValContabil;
  QGiaVal_25.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,1661,1662,2401,2401,2403,2403,2406,2411,2415,2415,2652,2653,'E');
  QGiaVal_15.Value := QGiaVal_15.Value + wValContabil;
  QGiaVal_25.Value := QGiaVal_25.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,2659,2659,2661,2662,3652,3653,0,0,0,0,0,0,'E');
  QGiaVal_15.Value := QGiaVal_15.Value + wValContabil;
  QGiaVal_25.Value := QGiaVal_25.Value + wValBase;

  // Campo 16 e 26
  SomaGia(wValContabil,wValBase,wValIcms,1551,1557,2551,2557,3551,3551,3553,3553,3556,3556,0,0,'E');
  QGiaVal_16.Value := wValContabil;
  QGiaVal_26.Value := wValBase;

  // Campo 17 e 27
  SomaGia(wValContabil,wValBase,wValIcms,1153,1153,1207,1207,1251,1257,2153,2153,2207,2207,2251,2257,'E');
  QGiaVal_17.Value := wValContabil;
  QGiaVal_27.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,3207,3207,3251,3251,0,0,0,0,0,0,0,0,'E');
  QGiaVal_17.Value := QGiaVal_17.Value + wValContabil;
  QGiaVal_27.Value := QGiaVal_27.Value + wValBase;

  // Campo 18 e 28
  SomaGia(wValContabil,wValBase,wValIcms,1205,1205,1301,1306,2205,2205,2301,2306,3205,3205,3301,3301,'E');
  QGiaVal_18.Value := wValContabil;
  QGiaVal_28.Value := wValBase;

  // Campo 19 e 29
  SomaGia(wValContabil,wValBase,wValIcms,1506,1506,1451,1452,1502,1502,1601,1603,1605,1605,1901,1931,'E');
  QGiaVal_19.Value := wValContabil;
  QGiaVal_29.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,1933,1933,1949,1949,2502,2502,2603,2650,2901,2949,0,0,'E');
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
  SomaGia(wValContabil,wValBase,wValIcms,5101,5106,
                                         5109,5120,
                                         5122,5125,
                                         5151,5153,
                                         5155,5156,
                                         5201,5202,'S');
  QGiaVal_31.Value := wValContabil;
  QGiaVal_41.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,5205,5210,
                                         5251,5258,
                                         5301,5307,
                                         5351,5357,
                                         5359,5359,
                                         5501,5503,'S');
  QGiaVal_31.Value := QGiaVal_31.Value + wValContabil;
  QGiaVal_41.Value := QGiaVal_41.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,5651,5651,
                                         5658,5658,
                                         5660,5660,
                                         5932,5932,
                                         0,0,
                                         0,0,'S');
  QGiaVal_31.Value := QGiaVal_31.Value + wValContabil;
  QGiaVal_41.Value := QGiaVal_41.Value + wValBase;

  // Campo 33 e 43
  SomaGia(wValContabil,wValBase,wValIcms,6101,6120,
                                         6122,6125,
                                         6151,6153,
                                         6155,6156,
                                         6201,6202,
                                         6205,6210, 'S');
  QGiaVal_33.Value := wValContabil;
  QGiaVal_43.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,6251,6258,
                                         6301,6307,
                                         6351,6357,
                                         6359,6359,
                                         6501,6503,
                                         6651,6651,'S');
  QGiaVal_33.Value := QGiaVal_33.Value + wValContabil;
  QGiaVal_43.Value := QGiaVal_43.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,6658,6658,
                                         6660,6660,
                                         6932,6932,
                                         0,0,
                                         0,0,
                                         0,0,'S');
  QGiaVal_33.Value := QGiaVal_33.Value + wValContabil;
  QGiaVal_43.Value := QGiaVal_43.Value + wValBase;

  // Campo 34 e 44
  SomaGia(wValContabil,wValBase,wValIcms,7101,7102,
                                         7105,7106,
                                         7127,7127,
                                         7201,7202,
                                         7205,7207,
                                         7210,7211,'S');
  QGiaVal_34.Value := wValContabil;
  QGiaVal_44.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,7251,7251,
                                         7301,7301,
                                         7358,7358,
                                         7501,7501,
                                         7651,7651,
                                         7654,7654,'S');
  QGiaVal_34.Value := QGiaVal_34.Value + wValContabil;
  QGiaVal_44.Value := QGiaVal_44.Value + wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,7930,7930,
                                         7949,7949,
                                         0,0,0,0,0,0,0,0,'S');
  QGiaVal_34.Value := QGiaVal_34.Value + wValContabil;
  QGiaVal_44.Value := QGiaVal_44.Value + wValBase;

  // Campo 35 e 45
  SomaGia(wValContabil,wValBase,wValIcms,5401,5405,
                                         5408,5415,
                                         5652,5657,
                                         5659,5659,
                                         5661,5662,
                                         6401,6404,'S');
  QGiaVal_35.Value := wValContabil;
  QGiaVal_45.Value := wValBase;
  SomaGia(wValContabil,wValBase,wValIcms,6408,6415,
                                         6652,6657,
                                         6659,6659,
                                         6661,6662,
                                         0,0,
                                         0,0,'S');
  QGiaVal_35.Value := QGiaVal_35.Value + wValContabil;
  QGiaVal_45.Value := QGiaVal_45.Value + wValBase;

  // Campo 36 e 46
  SomaGia(wValContabil,wValBase,wValIcms,5551,5557,6551,6557,7551,7551,7553,7553,7556,7556,0,0,'S');
  QGiaVal_36.Value := wValContabil;
  QGiaVal_46.Value := wValBase;

  // Campo 39 e 49
  SomaGia( wValContabil,wValBase,wValIcms,5451,5451,
                                          5505,5505,
                                          5601,5605,
                                          5901,5949,
                                          6901,6931,
                                          6505,6505,'S');
  QGiaVal_39.Value := wValContabil;
  QGiaVal_49.Value := wValBase;

  SomaGia( wValContabil,wValBase,wValIcms,6949,6949,
                                          6512,6512,
                                          6405,6405,
                                          0,0,
                                          0,0,
                                          0,0,'S');
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
{
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
}
    If QResumoApuracao.Locate('NUM_GIA',51,[]) Then
      QGiaVal_51.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_51.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',52,[]) Then
      QGiaVal_52.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_52.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',53,[]) Then
      QGiaVal_53.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_53.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',56,[]) Then
      QGiaVal_56.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_56.Value := 0;


{
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
}

    If QResumoApuracao.Locate('NUM_GIA',61,[]) Then
      QGiaVal_61.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_61.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',62,[]) Then
      QGiaVal_62.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_62.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',63,[]) Then
      QGiaVal_63.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_63.Value := 0;
    If QResumoApuracao.Locate('NUM_GIA',64,[]) Then
      QGiaVal_64.Value := QResumoApuracaoValor.Value
    Else
      QGiaVal_64.Value := 0;

    if QResumoApuracao.Locate('NUM_GIA',55,[]) Then
    begin
      QGiaVAL_55.Value := QResumoApuracaoValor.Value;
      QGiadesc_val_55.Value := QResumoApuracaodesc_val_65.Value;
    end;
    if QResumoApuracao.Locate('NUM_GIA',65,[]) Then
    begin
      QGiadesc_val_65.Value := QResumoApuracaodesc_val_65.Value;
      QGiaVAL_65.Value := QResumoApuracaoValor.Value;
    end;
    if QResumoApuracao.Locate('NUM_GIA',68,[]) Then
    begin
      //QGiadesc_val_65.Value := QResumoApuracaodesc_val_65.Value;
      QGiaVAL_68.Value := QResumoApuracaoValor.Value;
    end;

    if QResumoApuracao.Locate('NUM_GIA',66,[]) Then
      QGiaVAL_66.Value := QResumoApuracaoValor.Value;

    // Campo 66
    SomaGia(wValContabil,wValBase,wValIcms,1551,1551,2551,2551,0,0,0,0,0,0,0,0,'E');
    QGiaVal_66.Value := QGiaVal_66.Value + wValIcms;
    QGiaVal_62.Value := QGiaVal_62.Value - wValIcms;
    SomaGia(wValContabil,wValBase,wValIcms,1556,1556,2556,2556,0,0,0,0,0,0,0,0,'E');
    QGiaVal_67.Value := wValIcms;
    QGiaVal_62.Value := QGiaVal_62.Value - wValIcms;
    // campo 69
    if QResumoApuracao.Locate('NUM_GIA',69,[]) Then
      QGiaVAL_69.Value := QResumoApuracaoValor.Value;

    QGiaVal_60.Value := QGiaVal_51.Value
                       +QGiaVal_52.Value
                       +QGiaVal_53.Value
                       +QGiaVal_54.Value
                       +QGiaVal_55.Value
                       +QGiaVal_56.Value
                       +QGiaVal_58.Value
                       +QGiaVal_59.Value;

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

Procedure TDMGia.SomaGia(Var wValorContabil,wBase,wIcms:Real;wNat1,wNat1F, wNat2,wNat2F, wNat3,wNat3F, wNat4,wNat4F, wNat5,wNat5F,
  wNat6,wNat6F: Integer;wTipo:String);
begin
  wValorContabil := 0;
  wBase := 0;
  wIcms := 0;
  QSomaNota.Close;
  QSomaNota.SetVariable('ENTRADA_SAIDA',wTipo);
  If wNat1 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat1);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat1F);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat2 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat2);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat2F);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat3 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat3);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat3F);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat4 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat4);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat4F);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat5 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat5);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat5F);
    QSomaNota.Open;
    wValorContabil := wValorContabil + QSomaNotaSVal_Contabil.Value;
    wBase := wBase + QSomaNotaSVal_ICM_Base.Value;
    wIcms := wIcms + QSomaNotaSVal_ICM.Value;
  End;
  If wNat6 > 0 Then
  Begin
    QSomaNota.Close;
    QSomaNota.SetVariable('NAT_OPERACAO',wNat6);
    QSomaNota.SetVariable('NAT_OPERACAO_FIM',wNat6F);
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
