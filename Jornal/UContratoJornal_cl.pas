unit UContratoJornal_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient;

type
  TDMContratoJornal = class(TDataModule)
    QContratoJornal: TOracleDataSet1;
    QContratoJornalItem: TOracleDataSet1;
    QContratoJornalCOD_CONTRATO_JORNAL: TIntegerField;
    QContratoJornalCOD_FILIAL: TIntegerField;
    QContratoJornalCOD_CADASTRO: TIntegerField;
    QContratoJornalDT_CONTRATO: TDateTimeField;
    QContratoJornalVAL_CONTRATO: TFloatField;
    QContratoJornalCOD_VENDEDOR: TIntegerField;
    QContratoJornalItemCOD_CONTRATO_JORNAL: TIntegerField;
    QContratoJornalItemNUM_EDICAO: TIntegerField;
    QContratoJornalItemDT_EDICAO: TDateTimeField;
    QContratoJornalItemCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContratoJornalCons: TOracleDataSet1;
    QContratoJornalItemCons: TOracleDataSet1;
    QContratoJornalConsCOD_CONTRATO_JORNAL: TIntegerField;
    QContratoJornalConsFILIAL: TStringField;
    QContratoJornalConsCADASTRO: TStringField;
    QContratoJornalConsDT_CONTRATO: TDateTimeField;
    QContratoJornalConsVAL_CONTRATO: TFloatField;
    QContratoJornalConsVENDEDOR: TStringField;
    QContratoJornalItemConsNUM_EDICAO: TIntegerField;
    QContratoJornalItemConsDT_EDICAO: TDateTimeField;
    QContratoJornalItemConsCONTA_RECEBER: TStringField;
    QContratoJornalConsIND_SITUACAO: TIntegerField;
    QContratoJornalConsdesc_situacao: TStringField;
    QContratoJornalIND_SITUACAO: TIntegerField;
    QContratoJornaldesc_situacao: TStringField;
    QContratoJornalItemIND_TIPO: TStringField;
    QContratoJornalItemDESC_OBSERVACAO: TStringField;
    QContratoJornalItemConsIND_TIPO: TStringField;
    QContratoJornalItemConsDESC_OBSERVACAO: TStringField;
    QContratoJornalItemCOD_CONTRATO_JORNAL_ITEM: TIntegerField;
    procedure QContratoJornalAfterOpen(DataSet: TDataSet);
    procedure QContratoJornalAfterClose(DataSet: TDataSet);
    procedure QContratoJornalConsAfterOpen(DataSet: TDataSet);
    procedure QContratoJornalConsAfterClose(DataSet: TDataSet);
    procedure QContratoJornalConsCalcFields(DataSet: TDataSet);
    procedure QContratoJornalCalcFields(DataSet: TDataSet);
    procedure QContratoJornalBeforeEdit(DataSet: TDataSet);
    procedure QContratoJornalBeforeInsert(DataSet: TDataSet);
    procedure QContratoJornalItemAfterInsert(DataSet: TDataSet);
    procedure QContratoJornalAfterInsert(DataSet: TDataSet);
    procedure QContratoJornalItemBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContratoJornal: TDMContratoJornal;

const
  SIT_CONTRATO_ABERTO = 1;
  SIT_CONTRATO_FECHADO = 2;
  SIT_CONTRATO_CANCELADO = 3;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMContratoJornal.QContratoJornalAfterOpen(DataSet: TDataSet);
begin
  QContratoJornalItem.Close;
  QContratoJornalItem.Open;
end;

procedure TDMContratoJornal.QContratoJornalAfterClose(DataSet: TDataSet);
begin
  QContratoJornalItem.Close;
end;

procedure TDMContratoJornal.QContratoJornalConsAfterOpen(
  DataSet: TDataSet);
begin
  QContratoJornalItemCons.Close;
  QContratoJornalItemCons.Open;
end;

procedure TDMContratoJornal.QContratoJornalConsAfterClose(
  DataSet: TDataSet);
begin
  QContratoJornalItemCons.Close;
end;

procedure TDMContratoJornal.QContratoJornalConsCalcFields(
  DataSet: TDataSet);
begin
  QContratoJornalConsdesc_situacao.Value := '';
  case QContratoJornalConsIND_SITUACAO.Value of
    SIT_CONTRATO_ABERTO: QContratoJornalConsdesc_situacao.Value := 'ABERTO';
    SIT_CONTRATO_FECHADO: QContratoJornalConsdesc_situacao.Value := 'FECHADO';
    SIT_CONTRATO_CANCELADO: QContratoJornalConsdesc_situacao.Value := 'CANCELADO';
  end;
end;

procedure TDMContratoJornal.QContratoJornalCalcFields(DataSet: TDataSet);
begin
  QContratoJornaldesc_situacao.Value := '';
  case QContratoJornalIND_SITUACAO.Value of
    SIT_CONTRATO_ABERTO: QContratoJornaldesc_situacao.Value := 'ABERTO';
    SIT_CONTRATO_FECHADO: QContratoJornaldesc_situacao.Value := 'FECHADO';
    SIT_CONTRATO_CANCELADO: QContratoJornaldesc_situacao.Value := 'CANCELADO';
  end;
end;

procedure TDMContratoJornal.QContratoJornalBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContratoJornal.QContratoJornalBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMContratoJornal.QContratoJornalItemAfterInsert(
  DataSet: TDataSet);
begin
  QContratoJornalItemCOD_CONTRATO_JORNAL.Value := QContratoJornalCOD_CONTRATO_JORNAL.Value;
end;

procedure TDMContratoJornal.QContratoJornalAfterInsert(DataSet: TDataSet);
begin
  QContratoJornalDT_CONTRATO.Value := DMOracle.DataServ;
end;

procedure TDMContratoJornal.QContratoJornalItemBeforeInsert(
  DataSet: TDataSet);
begin
  with TOracleDataset1(DataSet).Master do
  begin
    if State = dsInsert then
    begin
      Post;
      RefreshRecord;
    end;
    if State = dsBrowse then
      Edit;
  end;
end;

end.
