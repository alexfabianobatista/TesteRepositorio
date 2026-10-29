unit UImportaFutura_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMimportaFutura = class(TDataModule)
    QPedido: TOracleDataSet1;
    QPedidoCOD_PEDIDO_CAB: TIntegerField;
    QPedidoCOD_FILIAL: TIntegerField;
    QPedidoCOD_OPERACAO: TIntegerField;
    QPedidoCOD_VENDEDOR: TIntegerField;
    QPedidoCOD_CADASTRO: TIntegerField;
    QPedidoNUM_PEDIDO: TIntegerField;
    QPedidoDT_EMISSAO: TDateTimeField;
    QPedidoVAL_DESCONTO: TFloatField;
    QPedidoDT_ENTREGA: TDateTimeField;
    QPedidoDT_FATURAMENTO: TDateTimeField;
    QPedidoDT_SISTEMA: TDateTimeField;
    QPedidoDESC_OBSERVACAO: TStringField;
    QPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoPERC_COMISSAO: TFloatField;
    QPedidoDESC_COMPLEMENTO_OBS2: TStringField;
    QPedidoDT_VENCIMENTO: TDateTimeField;
    QPedidoIND_TIPO_PAGAMENTO: TStringField;
    QPedidoCOD_PRODUTO: TFloatField;
    QPedidoQT_QUANTIDADE: TFloatField;
    QPedidoCOD_USUARIO: TIntegerField;
    QPedidoNR_DIAS_CHEQUE: TIntegerField;
    QPedidoNR_DIAS_CHEQUE1: TIntegerField;
    QPedidoNR_DIAS_CHEQUE2: TIntegerField;
    QPedidoNR_DIAS_CHEQUE3: TIntegerField;
    QPedidoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoIND_TIPO_FRETE: TStringField;
    QPedidoCOD_CULTURA: TIntegerField;
    QPedidoDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidoNR_DIAS_CHEQUE4: TIntegerField;
    QPedidoItem: TOracleDataSet1;
    QPedidoItemCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoItemCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItemCOD_PRODUTO: TFloatField;
    QPedidoItemCOD_TRIBUTACAO: TIntegerField;
    QPedidoItemQT_PEDIDO: TFloatField;
    QPedidoItemVAL_UNITARIO: TFloatField;
    QPedidoItemQT_ATENDIDO: TFloatField;
    QPedidoItemQT_CANCELADO: TFloatField;
    QPedidoItemPERC_DESCONTO: TFloatField;
    QPedidoItemCOD_LOTE_TIPO: TIntegerField;
    QPedidoItemPERC_COMISSAO: TFloatField;
    QPedidoItemQT_EMBALAGEM: TFloatField;
    QPedidoItemQT_QUANTIDADE_AUX: TFloatField;
    QPedidoItemCOD_PRODUTO_AUX: TIntegerField;
    QPedidoItemVAL_DESCONTO: TFloatField;
    QPedidoItemPERC_DESCONTO1: TFloatField;
    QPedidoItemPERC_DESCONTO2: TFloatField;
    QPedidoItemPERC_ACRESCIMO: TFloatField;
    QPrazoVencimento: TOracleDataSet1;
    QPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoNUM_DIAS: TIntegerField;
    QPedidoCOD_DEPARTAMENTO: TIntegerField;
    QPedidoCOD_BANCO_AGENCIA: TIntegerField;
    QPedidoCOD_CONTA_CORRENTE: TIntegerField;
    QPedidoCOD_MENSAGEM: TIntegerField;
    QPedidoNUM_PALM: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMimportaFutura: TDMimportaFutura;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
