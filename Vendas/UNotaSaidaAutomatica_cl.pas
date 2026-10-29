unit UNotaSaidaAutomatica_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMNotaSaidaAutomatica = class(TDataModule)
    QNotaSaidaEmitida: TOracleDataSet1;
    QNotaSaidaEmitidaCOD_NOTA_CAB: TIntegerField;
    QNotaSaidaEmitidaCOD_FILIAL: TIntegerField;
    QNotaSaidaEmitidaNUM_NOTA: TIntegerField;
    QNotaSaidaEmitidaCADASTRO: TStringField;
    DSNotaSaidaEmitida: TDataSource;
    QNotaSaidaEmitidaSITUACAO: TStringField;
    QValidaOperacao: TOracleDataSet1;
    QValidaOperacaoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QNotaSaidaEmitir: TOracleDataSet1;
    QNotaSaidaEmitirCOD_NOTA_CAB: TIntegerField;
    QPedidoSincronismo: TOracleDataSet1;
    QPedidoItemSincronismo: TOracleDataSet1;
    QPedidoItemSincronismoCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoItemSincronismoCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItemSincronismoCOD_PRODUTO: TFloatField;
    QPedidoItemSincronismoCOD_TRIBUTACAO: TIntegerField;
    QPedidoItemSincronismoQT_PEDIDO: TFloatField;
    QPedidoItemSincronismoVAL_UNITARIO: TFloatField;
    QPedidoItemSincronismoQT_ATENDIDO: TFloatField;
    QPedidoItemSincronismoQT_CANCELADO: TFloatField;
    QPedidoItemSincronismoPERC_DESCONTO: TFloatField;
    QPedidoItemSincronismoCOD_LOTE_TIPO: TIntegerField;
    QPedidoItemSincronismoPERC_COMISSAO: TFloatField;
    QPedidoItemSincronismoCOD_PRODUTO_AUX: TIntegerField;
    QPedidoItemSincronismoQT_EMBALAGEM: TFloatField;
    QPedidoItemSincronismoQT_QUANTIDADE_AUX: TFloatField;
    QPedidoItemSincronismoVAL_DESCONTO: TFloatField;
    QPedidoItemSincronismoPERC_DESCONTO1: TFloatField;
    QPedidoItemSincronismoPERC_DESCONTO2: TFloatField;
    QPedidoItemSincronismoPERC_ACRESCIMO: TFloatField;
    QPedidoItemSincronismoCOD_CULTURA: TIntegerField;
    QPedidoItemSincronismoCOD_ORIGEM: TStringField;
    QPedidoItemSincronismoCOD_MOTIVO: TIntegerField;
    QPedidoItemSincronismoNUM_FABRICANTE: TStringField;
    QPedidoItemSincronismoCOD_MARCA: TIntegerField;
    QPedidoItemSincronismoVAL_ICMS_SUBST: TFloatField;
    QPedidoItemSincronismoVAL_IPI: TFloatField;
    QPedidoItemSincronismoPERC_COMISSAO_PREPOSTO: TFloatField;
    QPedidoItemSincronismoCOD_CFOP: TIntegerField;
    QPedidoItemSincronismoLOCAL_ULTIMA_ALTERACAO: TStringField;
    QPedidoItemSincronismoCOD_PEDIDO_ITEM_WEB: TIntegerField;
    QPedidoItemSincronismoDESC_OBS_ITEM: TStringField;
    QPedidoItemSincronismoCOD_TABELA_PRECO_CAB: TIntegerField;
    QPedidoSincronismoCOD_PEDIDO_CAB: TIntegerField;
    QPedidoSincronismoCOD_FILIAL: TIntegerField;
    QPedidoSincronismoCOD_OPERACAO: TIntegerField;
    QPedidoSincronismoCOD_VENDEDOR: TIntegerField;
    QPedidoSincronismoCOD_CADASTRO: TIntegerField;
    QPedidoSincronismoNUM_PEDIDO: TIntegerField;
    QPedidoSincronismoDT_EMISSAO: TDateTimeField;
    QPedidoSincronismoVAL_DESCONTO: TFloatField;
    QPedidoSincronismoDT_ENTREGA: TDateTimeField;
    QPedidoSincronismoDT_FATURAMENTO: TDateTimeField;
    QPedidoSincronismoDT_SISTEMA: TDateTimeField;
    QPedidoSincronismoDESC_OBSERVACAO: TStringField;
    QPedidoSincronismoDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoSincronismoPERC_COMISSAO: TFloatField;
    QPedidoSincronismoDESC_COMPLEMENTO_OBS2: TStringField;
    QPedidoSincronismoDT_VENCIMENTO: TDateTimeField;
    QPedidoSincronismoIND_TIPO_PAGAMENTO: TStringField;
    QPedidoSincronismoCOD_PRODUTO: TFloatField;
    QPedidoSincronismoQT_QUANTIDADE: TFloatField;
    QPedidoSincronismoCOD_USUARIO: TIntegerField;
    QPedidoSincronismoNR_DIAS_CHEQUE: TIntegerField;
    QPedidoSincronismoNR_DIAS_CHEQUE1: TIntegerField;
    QPedidoSincronismoNR_DIAS_CHEQUE2: TIntegerField;
    QPedidoSincronismoNR_DIAS_CHEQUE3: TIntegerField;
    QPedidoSincronismoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoSincronismoIND_TIPO_FRETE: TStringField;
    QPedidoSincronismoCOD_CULTURA: TIntegerField;
    QPedidoSincronismoDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidoSincronismoNR_DIAS_CHEQUE4: TIntegerField;
    QPedidoSincronismoCOD_MENSAGEM: TIntegerField;
    QPedidoSincronismoCOD_DEPARTAMENTO: TIntegerField;
    QPedidoSincronismoCOD_BANCO_AGENCIA: TIntegerField;
    QPedidoSincronismoIND_SITUACAO: TStringField;
    QPedidoSincronismoIND_ESTOQUE: TStringField;
    QPedidoSincronismoIND_EMBARQUE: TStringField;
    QPedidoSincronismoNUM_PALM: TIntegerField;
    QPedidoSincronismoCOD_CONTA_CORRENTE: TIntegerField;
    QPedidoSincronismoIND_PRECO_TABELA: TStringField;
    QPedidoSincronismoVAL_IMPOSTO: TFloatField;
    QPedidoSincronismoIND_LIBERADO: TStringField;
    QPedidoSincronismoPERC_SUB: TFloatField;
    QPedidoSincronismoCOD_USUARIO_LIB_CAD: TIntegerField;
    QPedidoSincronismoCOD_USUARIO_LIB_FIN: TIntegerField;
    QPedidoSincronismoCOD_USUARIO_LIB_COM: TIntegerField;
    QPedidoSincronismoPERC_LUCRO: TFloatField;
    QPedidoSincronismoPERC_ISSQN: TFloatField;
    QPedidoSincronismoVAL_TOTAL: TFloatField;
    QPedidoSincronismoVAL_ADIANTAMENTO: TFloatField;
    QPedidoSincronismoCOD_SERIE: TStringField;
    QPedidoSincronismoDESC_VEICULO: TStringField;
    QPedidoSincronismoDESC_TECIDO: TStringField;
    QPedidoSincronismoDESC_FORMA_PAGAMENTO: TStringField;
    QPedidoSincronismoVAL_ENTRADA: TFloatField;
    QPedidoSincronismoCOD_CADASTRO_TRANSPORTADORA: TIntegerField;
    QPedidoSincronismoDESC_CHASSI: TStringField;
    QPedidoSincronismoNUM_ORDEM_COMPRA: TStringField;
    QPedidoSincronismoDESC_SAFRA: TStringField;
    QPedidoSincronismoCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QPedidoSincronismoDT_USUARIO: TDateTimeField;
    QPedidoSincronismoLOCAL_ULTIMA_ALTERACAO: TStringField;
    QPedidoSincronismoSTEP_PEDIDO_WEB: TIntegerField;
    QPedidoSincronismoCOD_PEDIDO_WEB: TIntegerField;
    QPedidoSincronismoCOD_OBRA: TIntegerField;
    QPedidoSincronismoIND_CONSUMIDOR_FINAL: TStringField;
    QPedidoSincronismoCOD_VEICULO: TIntegerField;
    QAtuBaixaPed: TOracleDataSet1;
    QAtuBaixaPedCOD_PEDIDO_ITEM: TIntegerField;
    QAtuBaixaPedCOD_NOTA_ITEM: TIntegerField;
    QAtuBaixaPedQT_BAIXA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotaSaidaAutomatica: TDMNotaSaidaAutomatica;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
