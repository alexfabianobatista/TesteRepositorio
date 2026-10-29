unit UConfiguracaoMarketplace_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMConfiguracaoMarketplace = class(TDataModule)
    QConfiguracaoMarketplace: TOracleDataSet1;
    QConfiguracaoMarketplaceCons: TOracleDataSet1;
    QConfiguracaoMarketplaceIND_ATIVO: TStringField;
    QConfiguracaoMarketplaceDESC_USUARIO_EMAIL: TStringField;
    QConfiguracaoMarketplaceDESC_TOKEN_INTEGRACAO: TStringField;
    QConfiguracaoMarketplaceDESC_TOKEN_ACCOUNT: TStringField;
    QConfiguracaoMarketplaceCOD_CONFIGURACAO_SKYHUB: TIntegerField;
    QConfiguracaoMarketplaceCOD_FILIAL: TIntegerField;
    QConfiguracaoMarketplaceCOD_OPERACAO: TIntegerField;
    QConfiguracaoMarketplaceCOD_CLASS_CADASTRO: TIntegerField;
    QConfiguracaoMarketplaceCOD_RAMO_FISICA: TIntegerField;
    QConfiguracaoMarketplaceCOD_RAMO_JURIDICA: TIntegerField;
    QConfiguracaoMarketplaceCOD_TIPO_CADASTRO: TIntegerField;
    QConfiguracaoMarketplaceCOD_DEPARTAMENTO: TIntegerField;
    QConfiguracaoMarketplaceCOD_LOTE_TIPO: TIntegerField;
    QConfiguracaoMarketplaceIND_TIPO_PAGAMENTO: TStringField;
    QConfiguracaoMarketplaceCOD_VENDEDOR: TIntegerField;
    QEmailNotificacao: TOracleDataSet1;
    QEmailNotificacaoCOD_EMAIL_NOTIFICACAO: TIntegerField;
    QEmailNotificacaoCOD_CONFIGURACAO_SKYHUB: TIntegerField;
    QEmailNotificacaoDESC_EMAIL: TStringField;
    QConfiguracaoMarketplaceConsDESC_USUARIO_EMAIL: TStringField;
    QConfiguracaoMarketplaceConsCOD_CONFIGURACAO_SKYHUB: TIntegerField;
    QConfiguracaoMarketplaceConsCOD_FILIAL: TIntegerField;
    QConfiguracaoMarketplaceConsIND_ATIVO: TStringField;
    QConfiguracaoMarketplaceCOD_REGIAO: TIntegerField;
    QConfiguracaoMarketplaceDESC_ML_CLIENT_SECRET: TStringField;
    QConfiguracaoMarketplaceIND_ML_ATIVO: TStringField;
    QConfiguracaoMarketplaceDESC_ML_CLIENT_ID: TStringField;
    QConfiguracaoMarketplaceIMGUR_CLIENT_ID: TStringField;
    QConfiguracaoMarketplaceIMGUR_SECRET: TStringField;
    QConfiguracaoMarketplaceIMGUR_REFRESH_TOKEN: TStringField;
    QConfiguracaoMarketplaceDESC_AMBIENTE_SKYHUB: TStringField;
    QConfiguracaoMarketplaceDESC_ACCESS_TOKEN_ML: TStringField;
    QConfiguracaoMarketplaceDESC_SKYHUB_TOKEN: TMemoField;
    QConfiguracaoMarketplaceIMGUR_ACCESS_TOKEN: TStringField;
    procedure QConfiguracaoMarketplaceAfterInsert(DataSet: TDataSet);
    procedure QConfiguracaoMarketplaceAfterCancel(DataSet: TDataSet);
    procedure QConfiguracaoMarketplaceAfterDelete(DataSet: TDataSet);
    procedure QConfiguracaoMarketplaceAfterOpen(DataSet: TDataSet);
    procedure QConfiguracaoMarketplaceAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConfiguracaoMarketplace: TDMConfiguracaoMarketplace;

implementation

uses
  UOracle_cl;

{$R *.dfm}

procedure TDMConfiguracaoMarketplace.QConfiguracaoMarketplaceAfterInsert(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  QConfiguracaoMarketplaceIND_ATIVO.Value := 'S';
  QConfiguracaoMarketplaceIND_ML_ATIVO.Value := 'S';
  QConfiguracaoMarketplaceIND_ATIVO.Value := 'PRODUCAO';
end;

procedure TDMConfiguracaoMarketplace.QConfiguracaoMarketplaceAfterCancel(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMConfiguracaoMarketplace.QConfiguracaoMarketplaceAfterDelete(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMConfiguracaoMarketplace.QConfiguracaoMarketplaceAfterOpen(
  DataSet: TDataSet);
begin
  QEmailNotificacao.Open;
end;

procedure TDMConfiguracaoMarketplace.QConfiguracaoMarketplaceAfterPost(
  DataSet: TDataSet);
begin
  QConfiguracaoMarketplace.SetVariable('PK',QConfiguracaoMarketplaceCOD_CONFIGURACAO_SKYHUB.Value);
end;

end.
