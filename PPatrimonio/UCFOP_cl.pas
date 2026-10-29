unit UCFOP_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCFOP = class(TDataModule)
    QCFOP: TOracleDataSet1;
    QCFOPCOD_CFOP: TIntegerField;
    QCFOPCOD_FILIAL: TIntegerField;
    QCFOPNUM_ANO: TIntegerField;
    QCFOPNUM_MES: TIntegerField;
    QCFOPval_nao_tributado: TFloatField;
    QCFOPCons: TOracleDataSet1;
    QCFOPConsCOD_CFOP: TIntegerField;
    QCFOPConsCOD_FILIAL: TIntegerField;
    QCFOPConsNUM_ANO: TIntegerField;
    QCFOPConsNUM_MES: TIntegerField;
    QRCFOP: TOracleDataSet1;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    QRCFOPNUM_ANO: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField5: TIntegerField;
    QRCFOPDESC_FILIAL: TStringField;
    QRCFOPDESC_MES: TStringField;
    QRCFOPDESC_ENDERECO: TStringField;
    QRCFOPDESC_BAIRRO: TStringField;
    QRCFOPDESC_CIDADE: TStringField;
    QRCFOPCOD_ESTADO: TStringField;
    QRCFOPVAL_NAO_TRIBUTADO: TFloatField;
    QCFOPItem: TOracleDataSet1;
    QCFOPItemCOD_CFOP_ITEM: TIntegerField;
    QCFOPItemCOD_CFOP: TIntegerField;
    QCFOPItemNUM_CFOP: TIntegerField;
    QCFOPItemVAL_TRIBUTADO: TFloatField;
    QCFOPItemVAL_CONTABIL: TFloatField;
    QCFOPItemval_nao_tributado: TFloatField;
    QCFOPConsDESC_FILIAL: TStringField;
    procedure QCFOPBeforePost(DataSet: TDataSet);
    procedure QCFOPItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCFOP: TDMCFOP;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCFOP.QCFOPBeforePost(DataSet: TDataSet);
begin
  if QCFOPNUM_ANO.Value < 1900 then
    raise Exception.Create('Ano Inválido.');

  if (QCFOPNUM_MES.Value < 1) or (QCFOPNUM_MES.Value > 12) then
    raise Exception.Create('Mês Inválido.');
end;

procedure TDMCFOP.QCFOPItemCalcFields(DataSet: TDataSet);
begin
  QCFOPItemval_nao_tributado.Value := QCFOPItemVAL_CONTABIL.Value - QCFOPItemVAL_TRIBUTADO.Value
end;

end.
