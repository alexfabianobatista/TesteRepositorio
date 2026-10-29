unit UBordero_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, Provider, DBClient;

type
  TDMBordero = class(TDataModule)
    QContaReceberCons: TOracleDataSet1;
    CDSContaReceberCons: TClientDataSet;
    DSContaReceberCons: TDataSource;
    DSPContaReceberCons: TDataSetProvider;
    DSContaReceberConsClient: TDataSource;
    QContaReceberConsCHECADO: TStringField;
    CDSContaReceberConsCHECADO: TStringField;
    QContaReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberConsNUM_TITULO: TFloatField;
    QContaReceberConsNUM_PARCELA: TIntegerField;
    QContaReceberConsVAL_ORIGINAL: TFloatField;
    QContaReceberConsNOME: TStringField;
    QContaReceberConsDESC_BANCO_AGENCIA: TStringField;
    QContaReceberConsDT_EMISSAO: TDateTimeField;
    QContaReceberConsDT_VENCIMENTO: TDateTimeField;
    CDSContaReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    CDSContaReceberConsNUM_TITULO: TFloatField;
    CDSContaReceberConsNUM_PARCELA: TIntegerField;
    CDSContaReceberConsVAL_ORIGINAL: TFloatField;
    CDSContaReceberConsNOME: TStringField;
    CDSContaReceberConsDESC_BANCO_AGENCIA: TStringField;
    CDSContaReceberConsDT_EMISSAO: TDateTimeField;
    CDSContaReceberConsDT_VENCIMENTO: TDateTimeField;
    QBorderoCab: TOracleDataSet1;
    QBorderoCabCOD_BORDERO: TIntegerField;
    QBorderoCabCOD_CONTA_CORRENTE: TIntegerField;
    QBorderoCabVAL_JUROS: TFloatField;
    QBorderoCabDT_BORDERO: TDateTimeField;
    QBorderoItem: TOracleDataSet1;
    DSBorderoItem: TDataSource;
    QBorderoItemNUM_TITULO: TFloatField;
    QBorderoItemNUM_PARCELA: TIntegerField;
    QBorderoItemVAL_ORIGINAL: TFloatField;
    QBorderoItemNOME: TStringField;
    QBorderoItemDESC_BANCO_AGENCIA: TStringField;
    QBorderoItemDT_EMISSAO: TDateTimeField;
    QBorderoItemDT_VENCIMENTO: TDateTimeField;
    QBorderoItemCOD_CONTA_RECEBER_CAB: TIntegerField;
    QBorderoCons: TOracleDataSet1;
    QBorderoConsCOD_BORDERO: TIntegerField;
    QBorderoConsVAL_JUROS: TFloatField;
    QBorderoConsDT_BORDERO: TDateTimeField;
    QBorderoConsDESC_CONTA_CORRENTE: TStringField;
    QBorderoCabIND_SITUACAO: TStringField;
    procedure QBorderoCabAfterInsert(DataSet: TDataSet);
    procedure QBorderoCabBeforeEdit(DataSet: TDataSet);
    procedure QBorderoCabBeforeInsert(DataSet: TDataSet);
    procedure QBorderoCabAfterPost(DataSet: TDataSet);
    procedure QBorderoCabBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBordero: TDMBordero;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMBordero.QBorderoCabAfterInsert(DataSet: TDataSet);
begin
  QBorderoCabDT_BORDERO.Value :=
    DMOracle.DataServ;
end;

procedure TDMBordero.QBorderoCabBeforeEdit(DataSet: TDataSet);
begin
  if (QBorderoCabIND_SITUACAO.Value <> 'ABERTO') then
    Raise Exception.Create('Borderô Confirmado');
end;

procedure TDMBordero.QBorderoCabBeforeInsert(DataSet: TDataSet);
begin
  QBorderoCabIND_SITUACAO.Value := 'ABERTO';
end;

procedure TDMBordero.QBorderoCabAfterPost(DataSet: TDataSet);
var
  wCodigo :Integer;
begin
  wCodigo := QBorderoCabCOD_BORDERO.Value;
  QBorderoCab.Close;
  QBorderoCab.SetVariable('PK', wCodigo);
  QBorderoCab.Open;
end;

procedure TDMBordero.QBorderoCabBeforeDelete(DataSet: TDataSet);
begin
  if QBorderoCabIND_SITUACAO.Value = 'FECHADO' then
    Raise Exception.Create('Não é possível excluir um borderô confirmado.');
end;

end.
