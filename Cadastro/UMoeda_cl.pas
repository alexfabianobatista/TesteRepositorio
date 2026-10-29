unit UMoeda_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMMoeda = class(TDataModule)
    DSMoeda: TDataSource;
    DSMoedaCons: TDataSource;
    DSCotacao: TDataSource;
    QMoeda: TOracleDataSet1;
    QMoedaDESC_MOEDA: TStringField;
    QMoedaCOD_MOEDA: TIntegerField;
    QMoedaCons: TOracleDataSet1;
    QMoedaConsCOD_MOEDA: TIntegerField;
    QMoedaConsDESC_MOEDA: TStringField;
    QCotacao: TOracleDataSet1;
    QCotacaoDT_COTACAO: TDateTimeField;
    QCotacaoCOD_MOEDA: TIntegerField;
    QCotacaoVLR_COTACAO: TFloatField;
    QRMoeda: TOracleDataSet1;
    QRCotacao: TOracleDataSet1;
    QRCotacaoDESC_MOEDA: TStringField;
    QRCotacaoCOD_MOEDA: TIntegerField;
    QRCotacaoVLR_COTACAO: TFloatField;
    QRCotacaoDT_COTACAO: TDateTimeField;
    QRMoedaCOD_MOEDA: TIntegerField;
    QRMoedaDESC_MOEDA: TStringField;
    QDTCotacao: TOracleDataSet1;
    QCotacaoDia: TOracleDataSet1;
    QCotacaoDiaDT_COTACAO: TDateTimeField;
    QCotacaoDiaVLR_COTACAO: TFloatField;
    QCotacaoDiaCOD_MOEDA: TIntegerField;
    QDTCotacaoDT_COTACAO: TDateTimeField;
    QCotacaoCons: TOracleDataSet1;
    QCotacaoConsDT_COTACAO: TDateTimeField;
    QCotacaoConsCOD_MOEDA: TIntegerField;
    QCotacaoConsVLR_COTACAO: TFloatField;
    QCotacaoCad: TOracleDataSet1;
    QCotacaoCadDT_COTACAO: TDateTimeField;
    QCotacaoCadCOD_MOEDA: TIntegerField;
    QCotacaoCadVLR_COTACAO: TFloatField;
    procedure QMoedaAfterInsert(DataSet: TDataSet);
    procedure QCotacaoAfterInsert(DataSet: TDataSet);
    procedure QCotacaoAfterPost(DataSet: TDataSet);
    procedure QMoedaAfterPost(DataSet: TDataSet);
    procedure QCotacaoCadAfterInsert(DataSet: TDataSet);
    procedure QCotacaoCadAfterPost(DataSet: TDataSet);
    procedure QCotacaoCadBeforeDelete(DataSet: TDataSet);
    procedure QCotacaoCadBeforeEdit(DataSet: TDataSet);
    procedure QCotacaoCadBeforeInsert(DataSet: TDataSet);
    procedure QCotacaoCadBeforePost(DataSet: TDataSet);
    procedure QMoedaAfterOpen(DataSet: TDataSet);
    procedure QMoedaBeforeCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Function MaiorCotacao(wMoeda:Real;wDataMax:TDateTime): Real;
  end;

var
  DMMoeda: TDMMoeda;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMoeda.QMoedaAfterInsert(DataSet: TDataSet);
begin
  QMoedaCod_Moeda.Value := DMOracle.Sequencia('MOEDA');
end;

procedure TDMMoeda.QCotacaoAfterInsert(DataSet: TDataSet);
begin
  QCotacaoCod_Moeda.Value := QMoedaCod_Moeda.Value;
end;

procedure TDMMoeda.QCotacaoAfterPost(DataSet: TDataSet);
begin
  QMoeda.Close;
  QMoeda.Open;
  QCotacao.Close;
  QCotacao.Open;
end;

Function TDMMoeda.MaiorCotacao(wMoeda:Real;wDataMax:TDateTime):Real;
Begin
  QDtCotacao.Close;
  QDtCotacao.SetVariable('MOEDA',wMoeda);
  QDtCotacao.SetVariable('DATA_MAX',wDataMax);
  QDtCotacao.Open;
  QCotacaoDia.Close;
  QCotacaoDia.SetVariable('MOEDA',wMoeda);
  QCotacaoDia.SetVariable('DATA',QDtCotacaoDt_Cotacao.Value);
  QCotacaoDia.Open;
  Result := QCotacaoDiaVlr_Cotacao.Value;
End;

procedure TDMMoeda.QMoedaAfterPost(DataSet: TDataSet);
begin
  if QCotacaoCad.State in [DsEdit, DsInsert] then
  begin
    try
      QCotacaoCad.Post;
    except
      QCotacaoCad.Cancel;
    end;
  end;

  QMoeda.SetVariable('PK',QMoedaCod_Moeda.Value);
end;

procedure TDMMoeda.QCotacaoCadAfterInsert(DataSet: TDataSet);
begin
  QCotacaoCadCOD_MOEDA.Value := QMoedaCOD_MOEDA.Value;
end;

procedure TDMMoeda.QCotacaoCadAfterPost(DataSet: TDataSet);
begin
  try
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMMoeda.QCotacaoCadBeforeDelete(DataSet: TDataSet);
begin
  if not (QMoeda.State in [DsEdit, DsInsert]) then
    QMoeda.Edit;
end;

procedure TDMMoeda.QCotacaoCadBeforeEdit(DataSet: TDataSet);
begin
  if not (QMoeda.State in [DsEdit, DsInsert]) then
    QMoeda.Edit;
end;

procedure TDMMoeda.QCotacaoCadBeforeInsert(DataSet: TDataSet);
begin
  if (QMoeda.State = DsInsert) then
    QMoeda.Post;
  if not (QMoeda.State in [DsEdit, DsInsert]) then
    QMoeda.Edit;
end;

procedure TDMMoeda.QCotacaoCadBeforePost(DataSet: TDataSet);
begin
  if QCotacaoCadCOD_MOEDA.IsNull then
    QCotacaoCad.Cancel;
end;

procedure TDMMoeda.QMoedaAfterOpen(DataSet: TDataSet);
begin
  QCotacaoCad.Close;
  QCotacaoCad.Open;
end;

procedure TDMMoeda.QMoedaBeforeCancel(DataSet: TDataSet);
begin
  QCotacaoCad.Cancel;
end;

end.
