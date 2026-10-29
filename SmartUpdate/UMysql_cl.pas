unit UMysql_cl;

interface

uses
  SysUtils, Classes, ZConnection, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, DBClient;

type
  TDMMysql = class(TDataModule)
    conMysql: TZConnection;
    QUpdateMysqlOS: TZQuery;
    QUpdateMysqlProduto: TZQuery;
    CdsUpdatedMysqlOS: TClientDataSet;
    CdsUpdatedMysqlProduto: TClientDataSet;
    CdsUpdatedMysqlProdutoCOD_PRODUTO: TStringField;
    CdsUpdatedMysqlProdutoDESC_PRODUTO: TStringField;
    CdsUpdatedMysqlProdutoVAL_VAREJO: TStringField;
    CdsUpdatedMysqlProdutoQT_QUANTIDADE: TStringField;
    CdsUpdatedMysqlProdutoIND_NIR_SYNC_SITE: TStringField;
    CdsUpdatedMysqlProdutoDT_ALTERACAO_PRECO: TStringField;
    CdsUpdatedMysqlOSCOD_ORDEM_SERVICO_CAB: TStringField;
    CdsUpdatedMysqlOSDESC_EQUIPAMENTO: TStringField;
    CdsUpdatedMysqlOSIND_NIR_SYNC_SITE: TStringField;
    CdsUpdatedMysqlOSDT_ENTRADA: TStringField;
    CdsUpdatedMysqlOSDESC_SOLICITACAO: TStringField;
    CdsUpdatedMysqlOSDT_SAIDA: TStringField;
    CdsUpdatedMysqlOSTECNICO: TStringField;
    CdsUpdatedMysqlOSCLIENTE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMysql: TDMMysql;

implementation

{$R *.dfm}

end.
