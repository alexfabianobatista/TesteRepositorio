unit UOrdemServicoMySQL_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  OracleData, OraTeste;

type
  TDMOrdemServicoMySQL = class(TDataModule)
    ZQOrdemServico: TZQuery;
    QOrdemServicoCab: TOracleDataSet1;
    ZQOrdemServicoFIL_CODIGO: TIntegerField;
    ZQOrdemServicoORD_NUMERO: TIntegerField;
    ZQOrdemServicoCLI_CODIGO: TIntegerField;
    ZQOrdemServicoORD_DATAABERTURA: TDateField;
    ZQOrdemServicoORD_DATAFECHAMENTO: TDateField;
    ZQOrdemServicoORD_VLRPRODUTOS: TFloatField;
    ZQOrdemServicoORD_VLRSERVICOS: TFloatField;
    ZQOrdemServicoORD_VLROS: TFloatField;
    ZQOrdemServicoORD_ANOTACOES: TMemoField;
    ZQOrdemServicoORD_OBS: TMemoField;
    ZQOrdemServicoORD_DESCRICAOAUX: TMemoField;
    ZQOrdemServicoORD_SITUACAO: TIntegerField;
    ZQOrdemServicoIDE_CODIGO: TStringField;
    ZQOrdemServicoPRO_CODIGO: TIntegerField;
    ZQOrdemServicoORDP_QTDE: TFloatField;
    ZQOrdemServicoORDP_VLRUNITARIO: TFloatField;
    ZQOrdemServicoORDP_VLRTOTAL: TFloatField;
    ZQOrdemServicoORDP_LIQREAL: TFloatField;
    ZQOrdemServicoORDP_PERCDESC: TFloatField;
    ZQOrdemServicoORDP_VLRDESC: TFloatField;
    ZQOrdemServicoORDP_OBS: TMemoField;
    QOrdemServicoCabCOD_CADASTRO: TIntegerField;
    QOrdemServicoCabCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoCabDESC_EQUIPAMENTO: TStringField;
    QOrdemServicoCabDT_ENTRADA: TDateTimeField;
    QOrdemServicoCabDESC_SOLICITACAO: TStringField;
    QOrdemServicoCabVL_DESCONTO: TFloatField;
    QOrdemServicoCabDT_SAIDA: TDateTimeField;
    QOrdemServicoCabCOD_FILIAL: TIntegerField;
    QOrdemServicoCabCOD_TECNICO: TIntegerField;
    QOrdemServicoCabCOD_USUARIO: TIntegerField;
    QOrdemServicoCabCOD_CAIXA: TIntegerField;
    QOrdemServicoCabCOD_NOTA_CAB: TIntegerField;
    QOrdemServicoCabDT_PREVISAO_ENTREGA: TDateTimeField;
    QOrdemServicoCabHR_PREVISAO_ENTREGA: TDateTimeField;
    QOrdemServicoCabCOD_VEICULO: TIntegerField;
    QOrdemServicoCabCOD_OPERACAO: TIntegerField;
    QOrdemServicoCabDESC_CADASTRO: TStringField;
    QOrdemServicoCabCOD_MENSAGEM: TIntegerField;
    QOrdemServicoCabDESC_SENHA_EQUIPAMENTO: TStringField;
    QOrdemServicoCabDESC_OBS: TMemoField;
    QOrdemServicoCabQT_HORAS: TStringField;
    QOrdemServicoCabIND_COM_CHIP: TStringField;
    QOrdemServicoCabDT_ENTRADA_MANUTENCAO: TDateTimeField;
    QOrdemServicoCabDT_SAIDA_MANUTENCAO: TDateTimeField;
    QOrdemServicoCabCOD_PRAZO_VENCIMENTO: TIntegerField;
    QOrdemServicoCabIND_NIR_SYNC_SITE: TStringField;
    QOrdemServicoCabIND_COMPUTADOR_EDITANDO: TStringField;
    QOrdemServicoItem: TOracleDataSet1;
    QOrdemServicoItemCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoItemCOD_ORDEM_SERVICO_ITEM: TIntegerField;
    QOrdemServicoItemCOD_PRODUTO: TIntegerField;
    QOrdemServicoItemDESC_COMPLEMENTO: TStringField;
    QOrdemServicoItemQT_PRODUTO: TFloatField;
    QOrdemServicoItemVL_UNITARIO: TFloatField;
    QOrdemServicoItemVAL_DESCONTO: TFloatField;
    QOrdemServicoItemCOD_LOTE: TIntegerField;
    QOrdemServicoItemCOD_CFOP: TIntegerField;
    QOrdemServicoItemCOD_LOTE_TIPO: TIntegerField;
    QOrdemServicoItemCOD_TRIBUTACAO: TIntegerField;
    QOrdemServicoItemPERC_DESCONTO: TFloatField;
    QOrdemServicoItemVAL_ISS: TFloatField;
    QOrdemServicoItemVAL_ACRESCIMO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOrdemServicoMySQL: TDMOrdemServicoMySQL;

implementation

uses UMySQL_cl, UOracle_cl;

{$R *.dfm}

end.
