unit URequisicaoTransfusao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMRequisicaoTransfusao = class(TDataModule)
    QRequisicaoTransfusao: TOracleDataSet1;
    QRequisicaoTransfusaoCons: TOracleDataSet1;
    QRRequisicaoTransfusao: TOracleDataSet1;
    QRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO: TIntegerField;
    QRequisicaoTransfusaoCOD_CADASTRO: TIntegerField;
    QRequisicaoTransfusaoIND_TIPO_REQUISICAO: TStringField;
    QRequisicaoTransfusaoItem: TOracleDataSet1;
    QRequisicaoTransfusaoItemCOD_REQUISICAO_TRANSFUSAO_ITEM: TIntegerField;
    QRequisicaoTransfusaoItemCOD_REQUISICAO_TRANSFUSAO: TIntegerField;
    QRequisicaoTransfusaoItemDESC_HEMOCOMPONENTE: TStringField;
    QRequisicaoTransfusaoItemNUM_BOLSA_SUS: TFloatField;
    QRequisicaoTransfusaoItemNUM_DOACAO: TFloatField;
    QRequisicaoTransfusaoItemDESC_INICIAIS: TStringField;
    QRequisicaoTransfusaoItemDESC_TA: TStringField;
    QRequisicaoTransfusaoItemDESC_COOMBS: TStringField;
    QRequisicaoTransfusaoItemDESC_RESULTADO: TStringField;
    QRequisicaoTransfusaoItemDESC_HEMOLISE: TStringField;
    QRequisicaoTransfusaoItemDESC_ORIGEM: TStringField;
    QRequisicaoTransfusaoItemDT_COLETA: TDateTimeField;
    QRequisicaoTransfusaoItemDESC_ABO: TStringField;
    QRequisicaoTransfusaoItemDESC_RH: TStringField;
    QRequisicaoTransfusaoItemDESC_PAI: TStringField;
    DSRequisicaoTransfusaoItem: TDataSource;
    QRequisicaoTransfusaoConsNOME: TStringField;
    QRequisicaoTransfusaoConsCOD_REQUISICAO_TRANSFUSAO: TIntegerField;
    QRequisicaoTransfusaoConsCOD_CADASTRO: TIntegerField;
    QRequisicaoTransfusaoConsIND_TIPO_REQUISICAO: TStringField;
    QRequisicaoTransfusaoConsDT_COLETA: TDateTimeField;
    QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO: TIntegerField;
    QRRequisicaoTransfusaoCOD_CADASTRO: TIntegerField;
    QRRequisicaoTransfusaoIND_TIPO_REQUISICAO: TStringField;
    QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO_ITEM: TIntegerField;
    QRRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO_1: TIntegerField;
    QRRequisicaoTransfusaoDESC_HEMOCOMPONENTE: TStringField;
    QRRequisicaoTransfusaoNUM_BOLSA_SUS: TFloatField;
    QRRequisicaoTransfusaoNUM_DOACAO: TFloatField;
    QRRequisicaoTransfusaoDESC_INICIAIS: TStringField;
    QRRequisicaoTransfusaoDESC_TA: TStringField;
    QRRequisicaoTransfusaoDESC_COOMBS: TStringField;
    QRRequisicaoTransfusaoDESC_RESULTADO: TStringField;
    QRRequisicaoTransfusaoDESC_HEMOLISE: TStringField;
    QRRequisicaoTransfusaoDESC_ORIGEM: TStringField;
    QRRequisicaoTransfusaoDT_COLETA: TDateTimeField;
    QRRequisicaoTransfusaoDESC_ABO: TStringField;
    QRRequisicaoTransfusaoDESC_RH: TStringField;
    QRRequisicaoTransfusaoDESC_PAI: TStringField;
    QRRequisicaoTransfusaoNOME: TStringField;
    procedure QRequisicaoTransfusaoBeforeInsert(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoBeforeEdit(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoItemAfterInsert(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoItemBeforeDelete(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoItemBeforeInsert(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoItemAfterPost(DataSet: TDataSet);
    procedure QRequisicaoTransfusaoAfterCancel(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRequisicaoTransfusao: TDMRequisicaoTransfusao;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoBeforeInsert(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoBeforeEdit(
  DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoItemAfterInsert(
  DataSet: TDataSet);
begin
  QRequisicaoTransfusaoItemCod_Requisicao_transfusao.Value := QRequisicaoTransfusaoCod_Requisicao_transfusao.Value;
end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoItemBeforeDelete(
  DataSet: TDataSet);
begin
  If Not (QRequisicaoTransfusao.State = dsEdit) then
    Raise Exception.Create('Requisição não está no modo de alteração!');
end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoItemBeforeInsert(
  DataSet: TDataSet);
begin
  If QRequisicaoTransfusao.State = dsInsert then
  Begin
    QRequisicaoTransfusao.Post;
    QRequisicaoTransfusao.Edit;
  End;
  If Not (QRequisicaoTransfusao.State = dsEdit) then
    Raise Exception.Create('Requisição não está no modo de alteração!');

end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoItemAfterPost(
  DataSet: TDataSet);
begin
  QRequisicaoTransfusaoItem.Close;
  QRequisicaoTransfusaoItem.SetVariable('COD_REQUISICAO_TRANSFUSAO',QRequisicaoTransfusaoCOD_REQUISICAO_TRANSFUSAO.Value);
  QRequisicaoTransfusaoItem.open;
end;

procedure TDMRequisicaoTransfusao.QRequisicaoTransfusaoAfterCancel(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QRequisicaoTransfusaoItem.Close;
  QRequisicaoTransfusaoItem.Open;
end;

end.
