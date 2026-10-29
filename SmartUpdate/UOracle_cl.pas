unit UOracle_cl;

interface

uses
  SysUtils, Classes, Oracle, DB, OracleData, OraTeste;

type
  TDMOracle = class(TDataModule)
    conOracle: TOracleSession;
    QOrdemServicoCab: TOracleDataSet1;
    QOrdemServicoCabCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoCabDESC_EQUIPAMENTO: TStringField;
    QOrdemServicoCabIND_NIR_SYNC_SITE: TStringField;
    QOrdemServicoCabDT_ENTRADA: TDateTimeField;
    QOrdemServicoCabDESC_SOLICITACAO: TStringField;
    QOrdemServicoCabDT_SAIDA: TDateTimeField;
    QOrdemServicoCabTECNICO: TStringField;
    QOrdemServicoCabCLIENTE: TStringField;
    QOrdemServicoCabCPF: TStringField;
    QProduto: TOracleDataSet1;
    QProdutoCOD_PRODUTO: TFloatField;
    QProdutoDESC_PRODUTO: TStringField;
    QProdutoVAL_VAREJO: TFloatField;
    QProdutoQT_QUANTIDADE: TFloatField;
    QProdutoIND_NIR_SYNC_SITE: TStringField;
    QProdutoDT_ALTERACAO_PRECO: TDateTimeField;
    QOrdemServicoCabDESC_OBS: TMemoField;
    QOrdemServicoCabDT_ENTRADA_MANUTENCAO: TDateTimeField;
    QOrdemServicoCabDT_SAIDA_MANUTENCAO: TDateTimeField;
    QTriggers: TOracleDataSet1;
    QTriggersTRIGGER_NAME: TStringField;
    QTriggersSTATUS: TStringField;
    QTriggerOS: TOracleDataSet1;
    QTriggerProdutoA: TOracleDataSet1;
    QTriggerProdutoB: TOracleDataSet1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOracle: TDMOracle;

implementation

{$R *.dfm}

end.
