unit UFatorICMS_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFatorICMS = class(TDataModule)
    QFatorICMS: TOracleDataSet1;
    QFatorICMSCOD_FATOR_ICMS: TIntegerField;
    QFatorICMSNUM_MES: TIntegerField;
    QFatorICMSNUM_ANO: TIntegerField;
    QFatorICMSVAL_FATOR: TFloatField;
    QFatorICMSdesc_mes: TStringField;
    QFatorICMSCons: TOracleDataSet1;
    QFatorICMSConsCOD_FATOR_ICMS: TIntegerField;
    QFatorICMSConsNUM_MES: TIntegerField;
    QFatorICMSConsNUM_ANO: TIntegerField;
    QFatorICMSConsVAL_FATOR: TFloatField;
    QRFatorICMS: TOracleDataSet1;
    QRFatorICMSCOD_FATOR_ICMS: TIntegerField;
    QRFatorICMSNUM_MES: TIntegerField;
    QRFatorICMSNUM_ANO: TIntegerField;
    QRFatorICMSVAL_FATOR: TFloatField;
    QRFatorICMSdesc_mes: TStringField;
    QFatorICMSCOD_FILIAL: TIntegerField;
    QFatorICMSConsCOD_FILIAL: TIntegerField;
    QRFatorICMSDESC_FILIAL: TStringField;
    QRFatorICMSCOD_FILIAL: TIntegerField;
    procedure QFatorICMSCalcFields(DataSet: TDataSet);
    procedure QFatorICMSAfterInsert(DataSet: TDataSet);
    procedure QRFatorICMSCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFatorICMS: TDMFatorICMS;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMFatorICMS.QFatorICMSCalcFields(DataSet: TDataSet);
begin
  case QFatorICMSNUM_MES.Value of
    1 : QFatorICMSdesc_mes.Value := 'Janeiro';
    2 : QFatorICMSdesc_mes.Value := 'Fevereiro';
    3 : QFatorICMSdesc_mes.Value := 'Março';
    4 : QFatorICMSdesc_mes.Value := 'Abril';
    5 : QFatorICMSdesc_mes.Value := 'Maio';
    6 : QFatorICMSdesc_mes.Value := 'Junho';
    7 : QFatorICMSdesc_mes.Value := 'Julho';
    8 : QFatorICMSdesc_mes.Value := 'Agosto';
    9 : QFatorICMSdesc_mes.Value := 'Setembro';
    10 : QFatorICMSdesc_mes.Value := 'Outubro';
    11 : QFatorICMSdesc_mes.Value := 'Novembro';
    12 : QFatorICMSdesc_mes.Value := 'Dezembro';
    else QFatorICMSdesc_mes.Value := 'Mês inválido';
  end;
end;

procedure TDMFatorICMS.QFatorICMSAfterInsert(DataSet: TDataSet);
var Day,Month,Year:Word;
begin
  DecodeDate(now,Year,Month,Day);

  QFatorICMSNUM_MES.Value := Month;
  QFatorICMSNUM_ANO.Value := Year;
end;

procedure TDMFatorICMS.QRFatorICMSCalcFields(DataSet: TDataSet);
begin
  case QRFatorICMSNUM_MES.Value of
    1 : QRFatorICMSdesc_mes.Value := 'Janeiro';
    2 : QRFatorICMSdesc_mes.Value := 'Fevereiro';
    3 : QRFatorICMSdesc_mes.Value := 'Março';
    4 : QRFatorICMSdesc_mes.Value := 'Abril';
    5 : QRFatorICMSdesc_mes.Value := 'Maio';
    6 : QRFatorICMSdesc_mes.Value := 'Junho';
    7 : QRFatorICMSdesc_mes.Value := 'Julho';
    8 : QRFatorICMSdesc_mes.Value := 'Agosto';
    9 : QRFatorICMSdesc_mes.Value := 'Setembro';
    10 : QRFatorICMSdesc_mes.Value := 'Outubro';
    11 : QRFatorICMSdesc_mes.Value := 'Novembro';
    12 : QRFatorICMSdesc_mes.Value := 'Dezembro';
    else QRFatorICMSdesc_mes.Value := 'Mês inválido';
  end;
end;

end.
