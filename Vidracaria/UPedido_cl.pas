unit UPedido_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Provider, DBClient;

type
  TDMPedido = class(TDataModule)
    DSPedidoItem: TDataSource;
    DSSomaPedido: TDataSource;
    DSPedidoAberto: TDataSource;
    DsPedido_Cancelado: TDataSource;
    DsPedidoItem_Canc: TDataSource;
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
    QPedidoItemValor_total: TFloatField;
    QRPedAberto: TOracleDataSet1;
    QRPedAbertoCOD_FILIAL: TIntegerField;
    QRPedAbertoNUM_PEDIDO: TIntegerField;
    QRPedAbertoDT_EMISSAO: TDateTimeField;
    QRPedAbertoDT_ENTREGA: TDateTimeField;
    QRPedAbertoCOD_PEDIDO_CAB: TIntegerField;
    QRPedAbertoCOD_VENDEDOR: TIntegerField;
    QRPedAbertoVAL_UNITARIO: TFloatField;
    QRPedAbertoPERC_DESCONTO: TFloatField;
    QRPedAbertoCOD_PRODUTO: TFloatField;
    QRPedAbertoQT_PEDIDO: TFloatField;
    QRPedAbertoQT_ATENDIDO: TFloatField;
    QRPedAbertoQT_CANCELADO: TFloatField;
    QRPedAbertoPERC_COMISSAO: TFloatField;
    QRPedAbertoNOME: TStringField;
    QRPedAbertoCOD_CADASTRO: TIntegerField;
    QRPedAbertoQT_SALDO: TFloatField;
    QRPedAbertoSVAL_TOTAL: TFloatField;
    QRPedAbertonome_vendedor: TStringField;
    QRPedProduto: TOracleDataSet1;
    QRPedProdutoCOD_PRODUTO: TFloatField;
    QRPedProdutoNUM_EMBALAGEM: TFloatField;
    QRPedProdutoDESC_PENEIRA: TStringField;
    QRPedProdutoSQT_PEDIDO: TFloatField;
    QRPedProdutoSQT_ATENDIDO: TFloatField;
    QRPedProdutoSQT_CANCELADO: TFloatField;
    QRPedProdutoSQT_SALDO: TFloatField;
    QRPedProdutoSVAL_SALDO: TFloatField;
    QRPedido_Cancelado: TOracleDataSet1;
    QRPedido_CanceladoCOD_FILIAL: TIntegerField;
    QRPedido_CanceladoCOD_VENDEDOR: TIntegerField;
    QRPedido_CanceladoCOD_CADASTRO: TIntegerField;
    QRPedido_CanceladoNUM_PEDIDO: TIntegerField;
    QRPedido_CanceladoDT_EMISSAO: TDateTimeField;
    QRPedido_CanceladoDT_CANCELAMENTO: TDateTimeField;
    QRPedido_CanceladoCOD_MOTIVO: TIntegerField;
    QRPedido_CanceladoCOD_USUARIO: TIntegerField;
    QRPedido_CanceladoQT_CANCELADO: TFloatField;
    QRPedido_CanceladoCOD_PRODUTO: TFloatField;
    QRPedido_CanceladoQT_PEDIDO: TFloatField;
    QRPedido_CanceladoDESC_MOTIVO: TStringField;
    QRPedidoPeriodo: TOracleDataSet1;
    QRPedidoPeriodoNUM_PEDIDO: TIntegerField;
    QRPedidoPeriodoDT_EMISSAO: TDateTimeField;
    QRPedidoPeriodoCOD_CADASTRO: TIntegerField;
    QRPedidoPeriodoNOME: TStringField;
    QRPedidoPeriodoSVAL_TOTAL: TFloatField;
    QRPedAberto_Venc: TOracleDataSet1;
    QRPedAberto_VencCOD_FILIAL: TIntegerField;
    QRPedAberto_VencNUM_PEDIDO: TIntegerField;
    QRPedAberto_VencDT_EMISSAO: TDateTimeField;
    QRPedAberto_VencDT_ENTREGA: TDateTimeField;
    QRPedAberto_VencCOD_PEDIDO_CAB: TIntegerField;
    QRPedAberto_VencCOD_VENDEDOR: TIntegerField;
    QRPedAberto_VencVAL_UNITARIO: TFloatField;
    QRPedAberto_VencPERC_DESCONTO: TFloatField;
    QRPedAberto_VencCOD_PRODUTO: TFloatField;
    QRPedAberto_VencQT_PEDIDO: TFloatField;
    QRPedAberto_VencQT_ATENDIDO: TFloatField;
    QRPedAberto_VencQT_CANCELADO: TFloatField;
    QRPedAberto_VencPERC_COMISSAO: TFloatField;
    QRPedAberto_VencNOME: TStringField;
    QRPedAberto_VencCOD_CADASTRO: TIntegerField;
    QRPedAberto_VencDT_VENCIMENTO: TDateTimeField;
    QRPedAberto_VencQT_SALDO: TFloatField;
    QRPedAberto_VencSVAL_TOTAL: TFloatField;
    QRPedido_Preco_Medio: TOracleDataSet1;
    QRPedido: TOracleDataSet1;
    QRPedido_Acomp: TOracleDataSet1;
    QRPedido_AcompCOD_VENDEDOR: TIntegerField;
    QRPedido_AcompNOME_VENDEDOR: TStringField;
    QRPedido_AcompCOD_CADASTRO: TIntegerField;
    QRPedido_AcompNOME: TStringField;
    QRPedido_AcompQT_PEDIDO: TFloatField;
    QRPedido_AcompVL_PEDIDO: TFloatField;
    QRPedido_AcompVL_ATENDIDO: TFloatField;
    QRPedido_AcompVL_CANCELADO: TFloatField;
    QPedidoBaixaCons: TOracleDataSet1;
    QPedidoBaixaConsCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoBaixaConsCOD_NOTA_ITEM: TIntegerField;
    QPedidoBaixaConsQT_BAIXA: TFloatField;
    QPedidoBaixaConsNUM_PEDIDO: TIntegerField;
    QPedidoBaixaConsCOD_CADASTRO: TIntegerField;
    QPedidoBaixaConsCOD_PRODUTO: TFloatField;
    QPedidoBaixaConsQT_PEDIDO: TFloatField;
    QPedidoItem_Canc: TOracleDataSet1;
    QPedidoItem_CancCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoItem_CancCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItem_CancCOD_PRODUTO: TFloatField;
    QPedidoItem_CancCOD_TRIBUTACAO: TIntegerField;
    QPedidoItem_CancQT_PEDIDO: TFloatField;
    QPedidoItem_CancVAL_UNITARIO: TFloatField;
    QPedidoItem_CancQT_ATENDIDO: TFloatField;
    QPedidoItem_CancQT_CANCELADO: TFloatField;
    QPedidoItem_CancPERC_DESCONTO: TFloatField;
    QPedidoItem_CancCOD_LOTE_TIPO: TIntegerField;
    QPedidoItem_CancPERC_COMISSAO: TFloatField;
    QPedidoItem_Cancnome_produto: TStringField;
    QPedidoItem_Cancnome_lote: TStringField;
    QPedido_Cancelado: TOracleDataSet1;
    QPedido_CanceladoCOD_PEDIDO_CANCELADO: TIntegerField;
    QPedido_CanceladoCOD_USUARIO: TIntegerField;
    QPedido_CanceladoCOD_MOTIVO: TIntegerField;
    QPedido_CanceladoCOD_PEDIDO_ITEM: TIntegerField;
    QPedido_CanceladoDT_CANCELAMENTO: TDateTimeField;
    QPedido_CanceladoQT_CANCELADO: TFloatField;
    QPedidoAberto: TOracleDataSet1;
    QPedidoAbertoDT_EMISSAO: TDateTimeField;
    QPedidoAbertoCOD_CADASTRO: TIntegerField;
    QPedidoAbertoNUM_PEDIDO: TIntegerField;
    QPedidoAbertoCOD_FILIAL: TIntegerField;
    QPedidoAbertoCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoAbertoCOD_PRODUTO: TFloatField;
    QPedidoAbertoQT_PEDIDO: TFloatField;
    QPedidoAbertoQT_ATENDIDO: TFloatField;
    QPedidoAbertoQT_CANCELADO: TFloatField;
    QPedidoAbertoNOME: TStringField;
    QSomaPedido: TOracleDataSet1;
    QPedidoCons: TOracleDataSet1;
    QPedidoConsCOD_PEDIDO_CAB: TIntegerField;
    QPedidoConsCOD_FILIAL: TIntegerField;
    QPedidoConsNUM_PEDIDO: TIntegerField;
    QPedidoConsDT_EMISSAO: TDateTimeField;
    QRPedidoEstoque: TOracleDataSet1;
    QRPedidoEstoqueCOD_PRODUTO: TFloatField;
    QRPedidoEstoqueNUM_EMBALAGEM: TFloatField;
    QRPedidoEstoqueSQT_SALDO: TFloatField;
    QRPedidoEstoqueqt_estoque: TFloatField;
    QPedidoCOD_PRODUTO: TFloatField;
    QPedidoQT_QUANTIDADE: TFloatField;
    QRPedido_BaseTroca: TOracleDataSet1;
    QRPedidoEstoqueDESC_UNIDADE: TStringField;
    QPedidoItemQT_EMBALAGEM: TFloatField;
    QPedidoItemQT_QUANTIDADE_AUX: TFloatField;
    QRPedido_BaseTrocaCOD_PRODUTO: TIntegerField;
    QRPedido_BaseTrocaQT_QUANTIDADE: TFloatField;
    QRPedAbertoDT_VENCIMENTO: TDateTimeField;
    QRPedidoComNota: TOracleDataSet1;
    QPedidoCOD_USUARIO: TIntegerField;
    QUltimosPedidos_itens: TOracleDataSet1;
    QUltimosPedidos_itensDT_EMISSAO: TDateTimeField;
    QUltimosPedidos_itensNUM_PEDIDO: TIntegerField;
    QUltimosPedidos_itensCOD_FILIAL: TIntegerField;
    QUltimosPedidos_itensQT_PEDIDO: TFloatField;
    QUltimosPedidos_itensQT_ATENDIDO: TFloatField;
    QUltimosPedidos_itensQT_CANCELADO: TFloatField;
    QUltimosPedidos_itensVAL_UNITARIO: TFloatField;
    DsUltimosPedidos_Itens: TDataSource;
    QPedidoConsIND_TIPO_PAGAMENTO: TStringField;
    QPedidoConsDT_FATURAMENTO: TDateTimeField;
    QRPedAbertoNUM_CGC_CPF: TStringField;
    QRPedAbertoNUM_INSCRICAO: TStringField;
    QRPedAbertoPERC_COMISSAO_CAB: TFloatField;
    QPedidoEstoque: TOracleDataSet1;
    QPedidoEstoqueCOD_PRODUTO: TFloatField;
    QPedidoEstoqueQT_QUANTIDADE: TFloatField;
    QPedidoEstoqueVL_ULTIMO_CUSTO: TFloatField;
    QPedidoNR_DIAS_CHEQUE: TIntegerField;
    QPedidoNR_DIAS_CHEQUE1: TIntegerField;
    QPedidoNR_DIAS_CHEQUE2: TIntegerField;
    QPedidoNR_DIAS_CHEQUE3: TIntegerField;
    QPedidoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoIND_TIPO_FRETE: TStringField;
    QRPedAbertoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoItemdesc_produto: TStringField;
    QRPedAbertoDESC_CIDADE: TStringField;
    QRPedAbertoCOD_TRIBUTACAO: TIntegerField;
    QRPedidoComNotaDT_EMISSAO_PEDIDO: TDateTimeField;
    QRPedidoComNotaNUM_NOTA: TFloatField;
    QRPedidoComNotaDESC_TRANSPORTADORA: TStringField;
    QRPedidoComNotaind_situacao: TStringField;
    QPedidoItemVAL_DESCONTO: TFloatField;
    QRPedAbertoIND_TIPO_PAGAMENTO: TStringField;
    QPedidoCOD_CULTURA: TIntegerField;
    QRPedAbertoCOD_OPERACAO: TIntegerField;
    QPedidoDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidoConsDT_ENTREGA: TDateTimeField;
    QPedidoConsDT_ENTREGA_PRORROGADA: TDateTimeField;
    QRPedidoEstoqueQT_SALDO_OC: TFloatField;
    QRPedidoEstoqueTOTAL_PEDIDO: TFloatField;
    QRPedidoEstoqueTOTAL_OC: TFloatField;
    QPedidoNR_DIAS_CHEQUE4: TIntegerField;
    QRPedido_Preco_MedioCOD_PRODUTO: TFloatField;
    QRPedido_Preco_MedioCOD_VENDEDOR: TIntegerField;
    QRPedido_Preco_MedioNOME: TStringField;
    QRPedido_Preco_MedioQT_PEDIDO: TFloatField;
    QRPedido_Preco_MedioVL_TOTAL: TFloatField;
    QRPedidoEstoqueVL_CUSTO: TFloatField;
    QRPedidoEstoqueVL_ESTOQUE_MEDIO: TFloatField;
    QRPedidoEstoqueVL_OC_MEDIO: TFloatField;
    QPedidoItemPERC_DESCONTO1: TFloatField;
    QPedidoItemPERC_DESCONTO2: TFloatField;
    QPedidoItemPERC_ACRESCIMO: TFloatField;
    QRPedidoValor: TOracleDataSet1;
    QRPedidoValorCOD_CADASTRO: TIntegerField;
    QRPedidoValorNOME: TStringField;
    QRPedidoValorCOD_FILIAL: TIntegerField;
    QRPedidoValorDT_EMISSAO: TDateTimeField;
    QRPedidoValorDESC_OBSERVACAO: TStringField;
    QRPedidoValorNUM_PEDIDO: TIntegerField;
    QRPedidoValorSQT_PEDIDO: TFloatField;
    QRPedidoValorVAL_UNITARIO: TFloatField;
    QRPedidoValorPERC_DESCONTO: TFloatField;
    QRPedidoValorPERC_DESCONTO1: TFloatField;
    QRPedidoValorPERC_DESCONTO2: TFloatField;
    QRPedidoValorPERC_ACRESCIMO: TFloatField;
    QSomaPedidoSTOTAL_PEDIDO: TFloatField;
    QRPedidoValorval_total: TFloatField;
    QRPedidoCusto: TOracleDataSet1;
    QRPedidoCustoCOD_FILIAL: TIntegerField;
    QRPedidoCustoCOD_PRODUTO: TFloatField;
    QRPedidoCustoVL_CUSTO_MEDIO: TFloatField;
    QRPedidoCustoQT_PEDIDO: TFloatField;
    QRPedidoCustoVAL_TOTAL: TFloatField;
    QRPedidoCustoCUSTO_TOTAL: TFloatField;
    QRComissaoPed: TOracleDataSet1;
    QRComissaoPedCOD_VENDEDOR: TIntegerField;
    QRComissaoPedNOME_VENDEDOR: TStringField;
    QRComissaoPedPERC_IRRF: TFloatField;
    QRComissaoPedCOD_FILIAL: TIntegerField;
    QRComissaoPedDESC_FILIAL: TStringField;
    QRComissaoPedCOD_PRODUTO: TFloatField;
    QRComissaoPedPERC_COMISSAO_ITEM: TFloatField;
    QRComissaoPedSQT_QUANTIDADE: TFloatField;
    QRComissaoPedSVAL_TOTAL: TFloatField;
    QRPedidoEstoqueDESC_COMPLEMENTO: TStringField;
    QQuantidadePedido: TOracleDataSet1;
    QQuantidadePedidoSQUANT_TOTAL_PEDIDO: TFloatField;
    DSQuantidadePedido: TDataSource;
    QPedidoCOD_MENSAGEM: TIntegerField;
    QPedidoCOD_DEPARTAMENTO: TIntegerField;
    QPedidoCOD_BANCO_AGENCIA: TIntegerField;
    QPedidoIND_SITUACAO: TStringField;
    QPedidoIND_ESTOQUE: TStringField;
    QRPedAberto_VencDESC_PRODUTO: TStringField;
    QRPedAbertoDESC_PRODUTO: TStringField;
    QRPedProdutoDESC_PRODUTO: TStringField;
    QRPedido_Preco_MedioDESC_PRODUTO: TStringField;
    QRPedidoEstoqueDESC_PRODUTO: TStringField;
    QRPedido_BaseTrocaDESC_PRODUTO: TStringField;
    QPedidoEstoqueDESC_PRODUTO: TStringField;
    QRPedidoCustoDESC_PRODUTO: TStringField;
    QRComissaoPedDESC_PRODUTO: TStringField;
    QRPedidoValorDESC_PRODUTO: TStringField;
    QPedidoNUM_PALM: TIntegerField;
    QPedidoItemCons: TOracleDataSet1;
    QPedidoItemConsCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoItemConsCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItemConsCOD_PRODUTO: TFloatField;
    QPedidoItemConsCOD_TRIBUTACAO: TIntegerField;
    QPedidoItemConsQT_PEDIDO: TFloatField;
    QPedidoItemConsVAL_UNITARIO: TFloatField;
    QPedidoItemConsQT_ATENDIDO: TFloatField;
    QPedidoItemConsQT_CANCELADO: TFloatField;
    QPedidoItemConsPERC_DESCONTO: TFloatField;
    QPedidoItemConsCOD_LOTE_TIPO: TIntegerField;
    QPedidoItemConsPERC_COMISSAO: TFloatField;
    QPedidoItemConsCOD_PRODUTO_AUX: TIntegerField;
    QPedidoItemConsQT_EMBALAGEM: TFloatField;
    QPedidoItemConsQT_QUANTIDADE_AUX: TFloatField;
    QPedidoItemConsVAL_DESCONTO: TFloatField;
    QPedidoItemConsPERC_DESCONTO1: TFloatField;
    QPedidoItemConsPERC_DESCONTO2: TFloatField;
    QPedidoItemConsPERC_ACRESCIMO: TFloatField;
    QPedidoConsIND_EMBARQUE: TStringField;
    QRPedAbertoDESC_OBSERVACAO: TStringField;
    QRPedidoRepresentante: TOracleDataSet1;
    QPedidoCOD_CONTA_CORRENTE: TIntegerField;
    QPedidoIND_PRECO_TABELA: TStringField;
    QRPedidoRepresentanteCOD_VENDEDOR: TFloatField;
    QRPedidoRepresentanteNOME: TStringField;
    QRPedidoRepresentanteTOTAL_PEDIDOS: TFloatField;
    QRPedidoRepresentanteQT_CX_LAMINADO: TFloatField;
    QRPedidoRepresentanteQT_KG_LAMINADO: TFloatField;
    QRPedidoRepresentanteQT_CX_RECHEADO: TFloatField;
    QRPedidoRepresentanteQT_KG_RECHEADO: TFloatField;
    QRPedidoRepresentanteQT_CX_360: TFloatField;
    QRPedidoRepresentanteQT_KG_360: TFloatField;
    QRPedidoRepresentanteQT_CX_PAO_MEL: TFloatField;
    QRPedidoRepresentanteQT_KG_PAO_MEL: TFloatField;
    QRPedidoRepresentanteQT_CX_SALGADINHO: TFloatField;
    QRPedidoRepresentanteQT_KG_SALGADINHO: TFloatField;
    QRPedidoRepresentanteQT_CX_POLV_SEQ: TFloatField;
    QRPedidoRepresentanteQT_KG_POLV_SEQ: TFloatField;
    QRPedidoRepresentanteQT_CX_WAFFER: TFloatField;
    QRPedidoRepresentanteQT_KG_WAFFER: TFloatField;
    QRPedidoRepresentanteTOTAL_CX: TFloatField;
    QRPedidoRepresentanteTOTAL_KG: TFloatField;
    QRPedidosFornecedor: TOracleDataSet1;
    QRPedidosFornecedorNOME: TStringField;
    QRPedidosFornecedorCOD_VENDEDOR: TIntegerField;
    QRPedidosFornecedorNOME_VENDEDOR: TStringField;
    QRPedidosFornecedorVAL_TOTAL: TFloatField;
    QPedidoItemCOD_CULTURA: TIntegerField;
    QPedidoVAL_IMPOSTO: TFloatField;
    QRPedidoCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoNUM_PEDIDO: TIntegerField;
    QRPedidoDT_EMISSAO: TDateTimeField;
    QRPedidoDT_ENTREGA: TDateTimeField;
    QRPedidoCOD_CADASTRO: TIntegerField;
    QRPedidoIND_TIPO_PAGAMENTO: TStringField;
    QRPedidoCOD_VENDEDOR: TIntegerField;
    QRPedidoPERC_COMISSAO: TFloatField;
    QRPedidoCOD_OPERACAO: TIntegerField;
    QRPedidoDESC_OBSERVACAO: TStringField;
    QRPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QRPedidoDESC_COMPLEMENTO_OBS2: TStringField;
    QRPedidoCOD_PRODUTO: TFloatField;
    QRPedidoQT_PEDIDO: TFloatField;
    QRPedidoQT_CANCELADO: TFloatField;
    QRPedidoQT_ATENDIDO: TFloatField;
    QRPedidoVAL_UNITARIO: TFloatField;
    QRPedidoPERC_COMISSAO_ITEM: TFloatField;
    QRPedidoPERC_DESCONTO: TFloatField;
    QRPedidoDESC_UNIDADE: TStringField;
    QRPedidoDESC_OPERACAO: TStringField;
    QRPedidoNOME_VENDEDOR: TStringField;
    QRPedidoCOD_ESTADO: TStringField;
    QRPedidoDESC_ENDERECO: TStringField;
    QRPedidoDESC_CIDADE: TStringField;
    QRPedidoDESC_CEP: TStringField;
    QRPedidoNUM_INSCRICAO: TStringField;
    QRPedidoDESC_TELEFONE: TStringField;
    QRPedidoDESC_BAIRRO: TStringField;
    QRPedidoNUM_CGC_CPF: TStringField;
    QRPedidoqrquantidade: TFloatField;
    QRPedidovalor_total: TFloatField;
    QRPedidoPERC_DESCONTO1: TFloatField;
    QRPedidoPERC_DESCONTO2: TFloatField;
    QRPedidoPERC_ACRESCIMO: TFloatField;
    QRPedidoNUM_EMBALAGEM: TFloatField;
    QRPedidoNUM_VOLUMES: TFloatField;
    QRPedidoCOD_TRIBUTACAO: TIntegerField;
    QRPedidoNOME: TStringField;
    QRPedidoDESC_PRODUTO: TStringField;
    QRMaterial: TOracleDataSet1;
    QPedidoIND_LIBERADO: TStringField;
    QPedidoCOD_USUARIO_LIB_CAD: TIntegerField;
    QPedidoCOD_USUARIO_LIB_FIN: TIntegerField;
    QPedidoCOD_USUARIO_LIB_COM: TIntegerField;
    QPedidoItemCOD_ORIGEM: TStringField;
    QPedidoPERC_SUB: TFloatField;
    QPedidoItemCOD_MOTIVO: TIntegerField;
    QRPedidoRepresentanteQT_CX_MATINAIS: TFloatField;
    QRPedidoRepresentanteQT_KG_MATINAIS: TFloatField;
    QRPedidoRepresentanteQT_CX_MACARRAO: TFloatField;
    QRPedidoRepresentanteQT_KG_MACARRAO: TFloatField;
    QPedidoIND_EMBARQUE: TStringField;
    QRPedidoRepresentanteQT_CX_PAO_COB: TFloatField;
    QRPedidoRepresentanteQT_KG_PAO_COB: TFloatField;
    QRPedidoSupervisor: TOracleDataSet1;
    QRPedidoSupervisorTOTAL_PEDIDOS: TFloatField;
    QRPedidoSupervisorQT_CX_MACARRAO: TFloatField;
    QRPedidoSupervisorQT_KG_MACARRAO: TFloatField;
    QRPedidoSupervisorQT_CX_LAMINADO: TFloatField;
    QRPedidoSupervisorQT_KG_LAMINADO: TFloatField;
    QRPedidoSupervisorQT_CX_RECHEADO: TFloatField;
    QRPedidoSupervisorQT_KG_RECHEADO: TFloatField;
    QRPedidoSupervisorQT_CX_360: TFloatField;
    QRPedidoSupervisorQT_KG_360: TFloatField;
    QRPedidoSupervisorQT_CX_PAO_MEL: TFloatField;
    QRPedidoSupervisorQT_KG_PAO_MEL: TFloatField;
    QRPedidoSupervisorQT_CX_PAO_COB: TFloatField;
    QRPedidoSupervisorQT_KG_PAO_COB: TFloatField;
    QRPedidoSupervisorQT_CX_SALGADINHO: TFloatField;
    QRPedidoSupervisorQT_KG_SALGADINHO: TFloatField;
    QRPedidoSupervisorQT_CX_POLV_SEQ: TFloatField;
    QRPedidoSupervisorQT_KG_POLV_SEQ: TFloatField;
    QRPedidoSupervisorQT_CX_RECH_30: TFloatField;
    QRPedidoSupervisorQT_KG_RECH_30: TFloatField;
    QRPedidoSupervisorQT_CX_WAFFER: TFloatField;
    QRPedidoSupervisorQT_KG_WAFFER: TFloatField;
    QRPedidoSupervisorTOTAL_CX: TFloatField;
    QRPedidoSupervisorTOTAL_KG: TFloatField;
    QRPedidoSupervisorQT_CX_MATINAIS: TFloatField;
    QRPedidoSupervisorQT_KG_MATINAIS: TFloatField;
    QRPedidoSupervisorQT_CX_POLV_SEQ_X_QT_CX_RECH_30: TFloatField;
    QRPedidoSupervisorQT_KG_POLV_SEQ_X_QT_KG_RECH_30: TFloatField;
    QRPedidoSupervisorCOD_SUPERVISOR: TIntegerField;
    QRPedidoSupervisorNOME: TStringField;
    QRPedidoComNotaDESC_MOTIVO: TStringField;
    QPedidoItemNUM_FABRICANTE: TStringField;
    QPedidoPERC_LUCRO: TFloatField;
    QPedidoPERC_ISSQN: TFloatField;
    QPedidoVAL_TOTAL: TFloatField;
    QRPedidoComNotaCOD_PRODUTO: TFloatField;
    QRPedidoComNotaDESC_PRODUTO: TStringField;
    QRPedidoComNotaQT_PEDIDO: TFloatField;
    QRPedidoComNotaQT_ATENDIDO: TFloatField;
    QRPedProdutoSQT_TECIDO: TFloatField;
    QUltimosPedidos_itensDT_VENCIMENTO: TDateTimeField;
    QCaixa: TOracleDataSet1;
    QCaixaCOD_CAIXA_MOV: TIntegerField;
    QCaixaCOD_USUARIO: TIntegerField;
    QCaixaCOD_FILIAL: TIntegerField;
    QCaixaCOD_DEPARTAMENTO: TIntegerField;
    QCaixaCOD_HISTORICO: TIntegerField;
    QCaixaDT_MOVIMENTO: TDateTimeField;
    QCaixaVAL_MOVIMENTO: TFloatField;
    QCaixaDESC_HORARIO: TStringField;
    QCaixaNUM_DOCUMENTO: TIntegerField;
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QCaixaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QPedidoVAL_ADIANTAMENTO: TFloatField;
    QRPedidoDESC_PRAZO_VENCIMENTO: TStringField;
    QPedidoConsDESC_OPERACAO: TStringField;
    QMateriais: TOracleDataSet1;
    DSMaterial: TDataSource;
    QDeletaMateriais: TOracleDataSet1;
    QRPedidoCOD_PEDIDO_ITEM: TIntegerField;
    QRPedidoNUM_METROS_CUBICOS: TFloatField;
    QExportaOptyWay: TOracleDataSet1;
    QItensProducaoCons: TOracleDataSet1;
    DSItensProducaoCons: TDataSource;
    QItensProducao: TOracleDataSet1;
    QItensProducaoCOD_PEDIDO_CAB: TIntegerField;
    QItensProducaoCOD_PEDIDO_ITEM: TIntegerField;
    QItensProducaoIND_CALCULO: TStringField;
    QItensProducaoIND_CORTE: TStringField;
    QItensProducaoIND_USINAGEM: TStringField;
    QItensProducaoIND_MARCACAO: TStringField;
    QItensProducaoIND_FORNO: TStringField;
    QItensProducaoIND_EMBARQUE: TStringField;
    QItensProducaoDT_EMBARQUE: TDateTimeField;
    QItensProducaoCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QEtiquetaOpty: TOracleDataSet1;
    DSExportaPedido: TDataSource;
    QExportaPedido: TOracleDataSet1;
    QExportaPedidoCOD_PEDIDO_CAB: TIntegerField;
    QExportaPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QExportaPedidoDESC_PRODUTO: TStringField;
    QExportaPedidoNOME: TStringField;
    QExportaPedidoIND_EXPORTADO: TStringField;
    QDeletaItensProducao: TOracleDataSet1;
    QDeletaItensProducaoCOD_PEDIDO_CAB: TIntegerField;
    QDeletaItensProducaoCOD_PEDIDO_ITEM: TIntegerField;
    QDeletaItensProducaoIND_CALCULO: TStringField;
    QDeletaItensProducaoIND_CORTE: TStringField;
    QDeletaItensProducaoIND_USINAGEM: TStringField;
    QDeletaItensProducaoIND_MARCACAO: TStringField;
    QDeletaItensProducaoIND_FORNO: TStringField;
    QDeletaItensProducaoIND_EMBARQUE: TStringField;
    QDeletaItensProducaoDT_EMBARQUE: TDateTimeField;
    QDeletaItensProducaoCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QDeletaItensProducaoDT_CORTE: TDateTimeField;
    QDeletaItensProducaoDT_USINAGEM: TDateTimeField;
    QDeletaItensProducaoDT_MARCACAO: TDateTimeField;
    QDeletaItensProducaoDT_FORNO: TDateTimeField;
    DSItensProducao: TDataSource;
    DSPedidoCons: TDataSource;
    QPedidoConsDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoConsNUM_PALM: TIntegerField;
    QExportaPedidoIND_REPOSICAO: TStringField;
    QRPedidoDESC_FANTASIA: TStringField;
    QPedidoItemSEQ: TFloatField;
    QRPedidoValorCOD_PEDIDO_CAB: TIntegerField;
    QAcompanhamentoReposicao: TOracleDataSet1;
    QAcompanhamentoReposicaoCOD_PRODUTO: TFloatField;
    QAcompanhamentoReposicaoDESC_PRODUTO: TStringField;
    QItensProducaoConsIND_CALCULO: TStringField;
    QItensProducaoConsIND_CORTE: TStringField;
    QItensProducaoConsIND_USINAGEM: TStringField;
    QItensProducaoConsIND_MARCACAO: TStringField;
    QItensProducaoConsIND_FORNO: TStringField;
    QItensProducaoConsIND_EMBARQUE: TStringField;
    QItensProducaoConsDT_EMBARQUE: TDateTimeField;
    QItensProducaoConsCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QItensProducaoConsDT_CORTE: TDateTimeField;
    QItensProducaoConsDT_USINAGEM: TDateTimeField;
    QItensProducaoConsDT_MARCACAO: TDateTimeField;
    QItensProducaoConsDT_FORNO: TDateTimeField;
    QItensProducaoConsCOD_MATERIAL: TFloatField;
    QItensProducaoConsCOD_ITEM: TIntegerField;
    QItensProducaoConsCOD_PECA: TStringField;
    QItensProducaoConsVAL_LARGURA: TFloatField;
    QItensProducaoConsVAL_ALTURA: TFloatField;
    QItensProducaoConsVAL_AREA: TFloatField;
    QItensProducaoConsVAL_AMOLADURA: TIntegerField;
    QItensProducaoConsIND_TIPO: TStringField;
    QItensProducaoConsDESC_OBS_PECA: TStringField;
    QItensProducaoConsIND_REPOSICAO: TStringField;
    QItensProducaoConsCOD_PEDIDO: TIntegerField;
    QItensProducaoConsDESC_SERVICO: TStringField;
    QItensProducaoConsDESC_ACABAMENTO: TStringField;
    QItensProducaoConsQT_ACABAMENTO: TFloatField;
    QItensProducaoConsDESC_CANTO: TStringField;
    QItensProducaoConsQT_CANTO: TIntegerField;
    QItensProducaoConsDESC_FORMA: TStringField;
    QItensProducaoConsCOD_PEDIDO_ITEM: TIntegerField;
    QItensProducaoConsQT_REPOSICAO: TIntegerField;
    QItensProducaoConsIND_EXPORTADO: TStringField;
    QItensProducaoConsCOD_LOTE_RASTREADO: TIntegerField;
    QItensProducaoConsNUM_SERIE: TIntegerField;
    QItensProducaoConsDESC_ESPECIFICACAO: TStringField;
    QItensProducaoConsNOME_CADASTRO: TStringField;
    QItensProducaoConsNUM_LINHA: TFloatField;
    QEtiqueta: TOracleDataSet1;
    QPedidoConsCOD_CADASTRO: TIntegerField;
    QPedidoConsNOME: TStringField;
    QItensProducaoConsDT_REPOSICAO: TDateTimeField;
    QImagemPedido: TOracleDataSet1;
    DSImagemPedido: TDataSource;
    QEtiquetaOptyCOD_PEDIDO_CAB: TIntegerField;
    QEtiquetaOptyCOD_CADASTRO: TIntegerField;
    QEtiquetaOptyDESC_COMPLEMENTO_OBS: TStringField;
    QEtiquetaOptyCOD_PEDIDO_ITEM: TIntegerField;
    QEtiquetaOptyCOD_PRODUTO: TFloatField;
    QEtiquetaOptyNOME: TStringField;
    QEtiquetaOptyDESC_FANTASIA: TStringField;
    QEtiquetaOptyDESC_COMPLEMENTO: TStringField;
    QEtiquetaOptyVAL_LARGURA: TFloatField;
    QEtiquetaOptyVAL_ALTURA: TFloatField;
    QEtiquetaOptyIND_TIPO: TStringField;
    QEtiquetaOptyIND_REPOSICAO: TStringField;
    QEtiquetaOptyQT_REPOSICAO: TFloatField;
    QEtiquetaOptyCOD_PECA: TStringField;
    QEtiquetaOptyNUM_SERIE: TIntegerField;
    QEtiquetaOptyDESC_SERVICO: TStringField;
    QEtiquetaOptyDESC_ACABAMENTO: TStringField;
    QEtiquetaOptyDESC_FORMA: TStringField;
    QEtiquetaOptyDESC_CANTO: TStringField;
    QEtiquetaOptyDESC_REGIAO: TStringField;
    QEtiquetanum_ordem_item: TIntegerField;
    QEtiquetanum_total_itens: TIntegerField;
    QEtiquetaOptynum_ordem_item: TIntegerField;
    QEtiquetaOptynum_total_itens: TIntegerField;
    QEtiquetaCOD_PEDIDO_CAB: TIntegerField;
    QEtiquetaCOD_CADASTRO: TIntegerField;
    QEtiquetaDESC_COMPLEMENTO_OBS: TStringField;
    QEtiquetaCOD_PEDIDO_ITEM: TIntegerField;
    QEtiquetaCOD_PRODUTO: TFloatField;
    QEtiquetaNOME: TStringField;
    QEtiquetaDESC_FANTASIA: TStringField;
    QEtiquetaDESC_COMPLEMENTO: TStringField;
    QEtiquetaVAL_LARGURA: TFloatField;
    QEtiquetaVAL_ALTURA: TFloatField;
    QEtiquetaIND_TIPO: TStringField;
    QEtiquetaCOD_PECA: TStringField;
    QEtiquetaNUM_SERIE: TIntegerField;
    QEtiquetaDESC_SERVICO: TStringField;
    QEtiquetaDESC_ACABAMENTO: TStringField;
    QEtiquetaDESC_FORMA: TStringField;
    QEtiquetaDESC_CANTO: TStringField;
    QEtiquetaDESC_REGIAO: TStringField;
    QEtiquetaDT_EMISSAO: TDateTimeField;
    QEtiquetaIND_QUEBRA: TStringField;
    QEtiquetaQT_TOTAL_QUEBRAS: TFloatField;
    QExportaOptyWayDESC_COMPLEMENTO_OBS: TStringField;
    QExportaOptyWayCOD_PEDIDO_ITEM: TStringField;
    QExportaOptyWayCOD_PEDIDO_CAB: TStringField;
    QExportaOptyWayCOD_PRODUTO: TStringField;
    QExportaOptyWayCOD_TRIBUTACAO: TStringField;
    QExportaOptyWayQT_PEDIDO: TStringField;
    QExportaOptyWayVAL_UNITARIO: TStringField;
    QExportaOptyWayQT_ATENDIDO: TStringField;
    QExportaOptyWayQT_CANCELADO: TStringField;
    QExportaOptyWayPERC_DESCONTO: TStringField;
    QExportaOptyWayCOD_LOTE_TIPO: TStringField;
    QExportaOptyWayPERC_COMISSAO: TStringField;
    QExportaOptyWayCOD_PRODUTO_AUX: TStringField;
    QExportaOptyWayQT_EMBALAGEM: TStringField;
    QExportaOptyWayQT_QUANTIDADE_AUX: TStringField;
    QExportaOptyWayVAL_DESCONTO: TStringField;
    QExportaOptyWayPERC_DESCONTO1: TStringField;
    QExportaOptyWayPERC_DESCONTO2: TStringField;
    QExportaOptyWayPERC_ACRESCIMO: TStringField;
    QExportaOptyWayCOD_CULTURA: TStringField;
    QExportaOptyWayCOD_ORIGEM: TStringField;
    QExportaOptyWayCOD_MOTIVO: TStringField;
    QExportaOptyWayNUM_FABRICANTE: TStringField;
    QExportaOptyWayCOD_MARCA: TStringField;
    QExportaOptyWayCOD_MATERIAL: TStringField;
    QExportaOptyWayCOD_ITEM: TStringField;
    QExportaOptyWayCOD_PECA: TStringField;
    QExportaOptyWayVAL_LARGURA: TStringField;
    QExportaOptyWayVAL_ALTURA: TStringField;
    QExportaOptyWayVAL_AREA: TStringField;
    QExportaOptyWayVAL_AMOLADURA: TStringField;
    QExportaOptyWayIND_TIPO: TStringField;
    QExportaOptyWayDESC_OBS_PECA: TStringField;
    QExportaOptyWayCOD_PEDIDO: TStringField;
    QExportaOptyWayDESC_SERVICO: TStringField;
    QExportaOptyWayDESC_ACABAMENTO: TStringField;
    QExportaOptyWayQT_ACABAMENTO: TStringField;
    QExportaOptyWayDESC_CANTO: TStringField;
    QExportaOptyWayQT_CANTO: TStringField;
    QExportaOptyWayDESC_FORMA: TStringField;
    QExportaOptyWayCOD_PEDIDO_ITEM_1: TStringField;
    QExportaOptyWayIND_EXPORTADO: TStringField;
    QExportaOptyWayCOD_LOTE_RASTREADO: TStringField;
    QExportaOptyWayNUM_SERIE: TStringField;
    QExportaOptyWayDESC_ESPECIFICACAO: TStringField;
    QExportaOptyWayIND_BAIXADO: TStringField;
    QExportaOptyWayDESC_CLASSE: TStringField;
    QExportaOptyWayNOME: TStringField;
    QExportaOptyWayDESC_FANTASIA: TStringField;
    QExportaOptyWayDESC_PRODUTO: TStringField;
    QExportaOptyWayDESC_COMPLEMENTO: TStringField;
    QDeletaMateriaisCOD_MATERIAL: TFloatField;
    QDeletaMateriaisCOD_ITEM: TIntegerField;
    QDeletaMateriaisCOD_PECA: TStringField;
    QDeletaMateriaisVAL_LARGURA: TFloatField;
    QDeletaMateriaisVAL_ALTURA: TFloatField;
    QDeletaMateriaisVAL_AREA: TFloatField;
    QDeletaMateriaisVAL_AMOLADURA: TIntegerField;
    QDeletaMateriaisIND_TIPO: TStringField;
    QDeletaMateriaisDESC_OBS_PECA: TStringField;
    QDeletaMateriaisCOD_PEDIDO: TIntegerField;
    QDeletaMateriaisDESC_SERVICO: TStringField;
    QDeletaMateriaisDESC_ACABAMENTO: TStringField;
    QDeletaMateriaisQT_ACABAMENTO: TFloatField;
    QDeletaMateriaisDESC_CANTO: TStringField;
    QDeletaMateriaisQT_CANTO: TIntegerField;
    QDeletaMateriaisDESC_FORMA: TStringField;
    QDeletaMateriaisCOD_PEDIDO_ITEM: TIntegerField;
    QDeletaMateriaisIND_EXPORTADO: TStringField;
    QDeletaMateriaisCOD_LOTE_RASTREADO: TIntegerField;
    QDeletaMateriaisNUM_SERIE: TIntegerField;
    QDeletaMateriaisDESC_ESPECIFICACAO: TStringField;
    QDeletaMateriaisIND_BAIXADO: TStringField;
    QMateriaisCOD_MATERIAL: TFloatField;
    QMateriaisCOD_ITEM: TIntegerField;
    QMateriaisCOD_PECA: TStringField;
    QMateriaisVAL_LARGURA: TFloatField;
    QMateriaisVAL_ALTURA: TFloatField;
    QMateriaisVAL_AREA: TFloatField;
    QMateriaisVAL_AMOLADURA: TIntegerField;
    QMateriaisIND_TIPO: TStringField;
    QMateriaisDESC_OBS_PECA: TStringField;
    QMateriaisCOD_PEDIDO: TIntegerField;
    QMateriaisDESC_SERVICO: TStringField;
    QMateriaisDESC_ACABAMENTO: TStringField;
    QMateriaisQT_ACABAMENTO: TFloatField;
    QMateriaisDESC_CANTO: TStringField;
    QMateriaisQT_CANTO: TIntegerField;
    QMateriaisDESC_FORMA: TStringField;
    QMateriaisCOD_PEDIDO_ITEM: TIntegerField;
    QMateriaisIND_EXPORTADO: TStringField;
    QMateriaisCOD_LOTE_RASTREADO: TIntegerField;
    QMateriaisNUM_SERIE: TIntegerField;
    QMateriaisDESC_ESPECIFICACAO: TStringField;
    QMateriaisIND_BAIXADO: TStringField;
    QEtiquetaCOD_MATERIAL: TFloatField;
    QRMaterialCOD_PECA: TStringField;
    QRMaterialVAL_LARGURA: TFloatField;
    QRMaterialVAL_ALTURA: TFloatField;
    QRMaterialIND_TIPO: TStringField;
    QRMaterialIND_REPOSICAO: TStringField;
    QRMaterialQT_REPOSICAO: TFloatField;
    QRMaterialQT_ACABAMENTO: TFloatField;
    QRMaterialQT_CANTO: TIntegerField;
    QRMaterialDESC_SERVICO: TStringField;
    QRMaterialDESC_ACABAMENTO: TStringField;
    QRMaterialDESC_FORMA: TStringField;
    QRMaterialDESC_CANTO: TStringField;
    QRMaterialDESC_ESPECIFICACAO: TStringField;
    QRMaterialQT_PEDIDO: TFloatField;
    QPedidoBaixaManual: TOracleDataSet1;
    CdPedidoBaixaManual: TClientDataSet;
    DspPedidoBaixaManual: TDataSetProvider;
    QPedidoBaixaManualCOD_PEDIDO_CAB: TIntegerField;
    QPedidoBaixaManualCOD_CADASTRO: TIntegerField;
    QPedidoBaixaManualDESC_FANTASIA: TStringField;
    QPedidoBaixaManualIND_BAIXADO: TStringField;
    CdPedidoBaixaManualCOD_PEDIDO_CAB: TIntegerField;
    CdPedidoBaixaManualCOD_CADASTRO: TIntegerField;
    CdPedidoBaixaManualDESC_FANTASIA: TStringField;
    CdPedidoBaixaManualIND_BAIXADO: TStringField;
    QEtiquetaDESC_ESPECIFICACAO: TStringField;
    QEtiquetaOptyCOD_MATERIAL: TFloatField;
    QAcompanhamentoReposicaoVAL_LARGURA: TFloatField;
    QAcompanhamentoReposicaoVAL_ALTURA: TFloatField;
    QRPedidoValorDESC_ESPECIFICACAO: TStringField;
    QRPedProdutoDESC_ESPECIFICACAO: TStringField;
    QEtiquetaIND_TIPO_PRODUTO: TStringField;
    QEtiquetaDESC_PRODUTO: TStringField;
    QAcompanhamentoReposicaoCOD_PECA: TStringField;
    QRPedidoPeriodoCOD_PEDIDO_CAB: TIntegerField;
    QAcompanhamentoReposicaoCOD_PEDIDO_CAB: TIntegerField;
    QAcompanhamentoReposicaocod_cadastro: TIntegerField;
    QAcompanhamentoReposicaonome: TStringField;
    QEtiquetaOptyDESC_PRODUTO: TStringField;
    QEtiquetaOptyQT_PEDIDO: TFloatField;
    QRPedFaturadoNaoEmbarcado: TOracleDataSet1;
    QEtiquetaQT_PEDIDO: TFloatField;
    QRPedidoAberto: TOracleDataSet1;
    QRPedidoAbertoCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoAbertoCOD_CADASTRO: TIntegerField;
    QRPedidoAbertoNOME: TStringField;
    QRPedidoAbertoCOD_PECA: TStringField;
    QRPedidoAbertoVAL_LARGURA: TFloatField;
    QRPedidoAbertoVAL_ALTURA: TFloatField;
    QRPedidoAbertoIND_TIPO: TStringField;
    QRPedidoAbertoDESC_PRODUTO: TStringField;
    QAnaliseCredito: TOracleDataSet1;
    QAnaliseCreditoVAL_TITULO: TFloatField;
    QAnaliseCreditoVAL_PEDIDO: TFloatField;
    QAnaliseCredito1: TOracleDataSet1;
    QAnaliseCredito1VAL_CREDITO: TFloatField;
    QAnaliseCredito1VAL_CHEQUE: TFloatField;
    QAnaliseCreditoval_limite: TFloatField;
    QRPedAbertoPERC_ACRESCIMO: TFloatField;
    QRPedAbertoSVAL_ACRESCIMO: TFloatField;
    QEtiquetaOptyIND_TIPO_PRODUTO: TStringField;
    QEtiquetaOptyDESC_ESPECIFICACAO: TStringField;
    QEtiquetaOptyDT_EMISSAO: TDateTimeField;
    QMateriaisVAL_ACABAMENTO: TFloatField;
    QAnaliseCreditoVAL_ACRESCIMO: TFloatField;
    QRPedFaturadoNaoEmbarcadoCOD_PEDIDO_CAB: TIntegerField;
    QRPedFaturadoNaoEmbarcadoDT_EMISSAO: TDateTimeField;
    QRPedFaturadoNaoEmbarcadoDT_ENTREGA: TDateTimeField;
    QRPedFaturadoNaoEmbarcadoCOD_CADASTRO: TIntegerField;
    QRPedFaturadoNaoEmbarcadoNOME: TStringField;
    QRPedFaturadoNaoEmbarcadoDESC_COMPLEMENTO_OBS: TStringField;
    QRPedFaturadoNaoEmbarcadoCOD_PRODUTO: TFloatField;
    QRPedFaturadoNaoEmbarcadoDESC_PRODUTO: TStringField;
    QRPedFaturadoNaoEmbarcadoVAL_LARGURA: TFloatField;
    QRPedFaturadoNaoEmbarcadoVAL_ALTURA: TFloatField;
    QRPedFaturadoNaoEmbarcadoIND_TIPO: TStringField;
    QRPedidoComNotaCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItemVAL_ICMS_SUBST: TFloatField;
    QPedidoItemVAL_IPI: TFloatField;
    QItensProducaoConsIND_FURACAO: TStringField;
    QItensProducaoConsIND_LAPIDACAO: TStringField;
    QItensProducaoConsIND_LAVACAO: TStringField;
    QItensProducaoConsDT_FURACAO: TDateTimeField;
    QItensProducaoConsDT_LAPIDACAO: TDateTimeField;
    QItensProducaoConsDT_LAVACAO: TDateTimeField;
    QEtiquetaDT_ENTREGA: TDateTimeField;
    QEtiquetaOptyDT_ENTREGA: TDateTimeField;
    QRPedidoPeriodoQT_PEDIDO: TFloatField;
    QImagemPedidoCOD_IMAGEM_PEDIDO: TIntegerField;
    QImagemPedidoCOD_PEDIDO_CAB: TIntegerField;
    QImagemPedidoDESC_CAMINHO: TStringField;
    QRPedidoAbertoDESC_COMPLEMENTO_OBS: TStringField;
    QRPedido_Preco_MedioCOD_CADASTRO: TIntegerField;
    QRPedido_Preco_MedioCLIENTE: TStringField;
    QEtiquetaOptyDESC_COD_BARRA: TStringField;
    QEtiquetaOptyDESC_COMPLEMENTO_2: TStringField;
    QEtiquetaOptyDESC_UNIDADE: TStringField;
    QPedidoItemCOD_PRODUTO_AUX: TFloatField;
    QPedidoItem_CancCOD_PRODUTO_AUX: TFloatField;
    QRPedProdutoqt_estoque: TFloatField;
    QRPedidoDESC_FILIAL: TStringField;
    QRPedidoNUM_CGC: TStringField;
    QRPedidoF_DESC_ENDERECO: TStringField;
    QRPedidoF_DESC_CIDADE: TStringField;
    QRPedidoF_FONE: TStringField;
    QRPedidoVAL_LARGURA: TFloatField;
    QRPedidoVAL_ALTURA: TFloatField;
    QPedidoVAL_FRETE: TFloatField;
    QRPedidoVAL_FRETE: TFloatField;
    QRPedidoF_DESC_E_MAIL: TStringField;
    QRPedidoDESC_E_MAIL: TStringField;
    QRPedidoDESC_MENSAGEM: TStringField;
    QRPedidoDESC_COMPLEMENTO: TStringField;
    QRPedidoDESC_COMPLEMENTO1: TStringField;
    QPedidoItemCOD_USUARIO: TIntegerField;
    procedure QPedidoBeforeInsert(DataSet: TDataSet);
    procedure QPedidoAfterCancel(DataSet: TDataSet);
    procedure QPedidoItemAfterInsert(DataSet: TDataSet);
    procedure QPedidoItemCalcFields(DataSet: TDataSet);
    procedure QPedidoAfterPost(DataSet: TDataSet);
    procedure QPedidoCOD_CADASTROValidate(Sender: TField);
    procedure QPedidoBeforePost(DataSet: TDataSet);
    procedure QRPedAbertoCalcFields(DataSet: TDataSet);
    procedure QPedido_CanceladoAfterPost(DataSet: TDataSet);
    procedure QPedidoItem_CancCalcFields(DataSet: TDataSet);
    procedure QPedidoItemCOD_PRODUTOValidate(Sender: TField);
    procedure QPedidoItemQT_CANCELADOValidate(Sender: TField);
    procedure QPedidoItemVAL_UNITARIOValidate(Sender: TField);
    procedure QPedidoItemAfterPost(DataSet: TDataSet);
    procedure QPedidoItemBeforeEdit(DataSet: TDataSet);
    procedure QPedidoItemBeforeInsert(DataSet: TDataSet);
    procedure QPedidoItemBeforeDelete(DataSet: TDataSet);
    procedure QPedidoBeforeEdit(DataSet: TDataSet);
    procedure QRPedidoEstoqueCalcFields(DataSet: TDataSet);
    procedure QRPedidoComNotaCalcFields(DataSet: TDataSet);
    procedure QPedidoCOD_OPERACAOValidate(Sender: TField);
    procedure QRPedidoValorCalcFields(DataSet: TDataSet);
    procedure QPedidoAfterInsert(DataSet: TDataSet);
    procedure QRPedidoCalcFields(DataSet: TDataSet);
    procedure QMateriaisBeforePost(DataSet: TDataSet);
    procedure QPedidoItemAfterRefresh(DataSet: TDataSet);
    procedure QPedidoItemAfterDelete(DataSet: TDataSet);
    procedure QEtiquetaCalcFields(DataSet: TDataSet);
    procedure QPedidoItemBeforePost(DataSet: TDataSet);
    procedure QPedidoAfterOpen(DataSet: TDataSet);
    procedure QEtiquetaOptyCalcFields(DataSet: TDataSet);
    procedure QMateriaisAfterInsert(DataSet: TDataSet);
    procedure QAcompanhamentoReposicaoCalcFields(DataSet: TDataSet);
    procedure QAnaliseCreditoCalcFields(DataSet: TDataSet);
    procedure QRPedProdutoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fExcluindo: Boolean;
    fFilial: Integer;
  public
    { Public declarations }
    property pExcluindo: Boolean read fExcluindo write fExcluindo default False;
    property pFilial: Integer read fFilial write fFilial; // utilizado na query QrPedidoEstoque
    procedure ExcluiPedido; // para usar no CalcFields
    Procedure CalculaICMPedido;
    Procedure CalculaIPIPedido;
  end;

var
  DMPedido: TDMPedido;
  wVal_Unitario_Ant: Real;
  wComissao_Ant: Real;
  wDtEmissao_Ant: TDateTime;
implementation

uses UOracle_cl, UParamSistema_cl, UFilial_cl, UUsuario_cl, UEstoque_cl,
  UProduto_cl, UBiblioteca, UOperacao_cl, USenha, Math, USequencia_cl,
  UTributacao_cl, UEstado_cl;

{$R *.DFM}

procedure TDMPedido.QPedidoBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPedido.QPedidoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  DMPedido.Qpedido.Close;
  DMPedido.QpedidoItem.Close;
  DMPedido.Qpedido.Open;
  DMPedido.QpedidoItem.Open;
end;

procedure TDMPedido.QPedidoItemAfterInsert(DataSet: TDataSet);
var
  wSeq: integer;
  wSerie, wAux: string;
begin

  QPedidoItemCod_Pedido_Cab.Value := QPedidoCod_Pedido_Cab.Value;
  QPedidoItemQt_Atendido.Value := 0;
  QPedidoItemQt_Cancelado.Value := 0;
  QPedidoItemCod_Lote_Tipo.Value := 1;
  QPedidoItemPerc_Desconto.Value := 0;
  QPedidoItemPerc_Comissao.Value := 0;
  QPedidoItemQT_PEDIDO.Value := 1;
  QPedidoItemVAL_UNITARIO.Value := 0;

  wSeq := StrToInt(DMOracle.BuscaNome('SELECT SQPECAS.NEXTVAL FROM DUAL', '1=1'));
  if wSeq > 999999 then
  begin
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DROP SEQUENCE SQPECAS');
    DMOracle.QExecSQL.ExecSQL;

    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('CREATE SEQUENCE SQPECAS START WITH 1');
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;

    wSerie := IntToStr(StrToInt(DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA =''NUM_SERIE''')) + 1);
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_SEQUENCIA SET VAL_SEQUENCIA =' + wSerie + ' WHERE NOME_SEQUENCIA =''NUM_SERIE''');
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    wSeq := StrToInt(DMOracle.BuscaNome('SELECT SQPECAS.NEXTVAL FROM DUAL', '1=1'));
  end;
  DSMaterial.DataSet.Open;
  DSMaterial.DataSet.Insert;
  QMateriaisCOD_PEDIDO.Value := QPedidoCOD_PEDIDO_CAB.Value;
  QMateriaisCOD_PEDIDO_ITEM.Value := QPedidoItemCOD_PEDIDO_ITEM.Value;
  QMateriaisCOD_PECA.Value := IntToStr(wSeq);
  QMateriaisNUM_SERIE.Value := StrToInt(DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA =''NUM_SERIE'''));
  QMateriais.Post;
  QMateriais.Edit;

end;

procedure TDMPedido.QPedidoItemCalcFields(DataSet: TDataSet);
var
  wCont: integer;
begin
  wCont := 0;
  QPedidoItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value), True);
  
  if QPedidoItemQt_Pedido.Value > 0 then
  begin
    QPedidoItemValor_Total.Value := QPedidoItemQt_Pedido.Value
      * Round(QPedidoItemVal_Unitario.Value *
      (1 - QPedidoItemPerc_Desconto.Value / 100) * 100) / 100;
    if QPedidoItemPerc_Desconto1.Text <> '' then
      QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto1.Value / 100);
    if QPedidoItemPerc_Desconto2.Text <> '' then
      QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto2.Value / 100);
    if ((QPedidoItemPerc_Acrescimo.Text <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ')) then
      QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + (QPedidoItemValor_total.Value * QPedidoItemPerc_Acrescimo.Value / 100);
    If QPedidoItemVal_icms_subst.Text <> ''  then
      QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + QPedidoItemVal_ICMS_SUBST.Value;
    If QPedidoItemVal_IPI.Text <> ''  then
      QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + QPedidoItemVal_IPI.Value;  
  end
  else
    QPedidoItemValor_total.Value := QPedidoItemVal_Unitario.Value;
end;

procedure TDMPedido.QPedidoAfterPost(DataSet: TDataSet);
var wIndice: Real;
  wComando, wValor: string;
begin
  QPedido.SetVariable('PK', QPedidoCod_Pedido_Cab.Value);
  QPedido.Close;
  QPedido.Open;
  wComissao_Ant := QPedidoPerc_Comissao.Value;
  wDtEmissao_Ant := QPedidoDt_Emissao.Value;
  if (QPedidoVal_Desconto.Value <> 0) and ((DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'VETRO') AND
     (DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'TEMPERFOZ')) then
  begin
    wIndice := QPedidoVal_Desconto.Value / QSomaPedidoSTotal_Pedido.Value;
    QPedidoItem.First;
    while not (QPedidoItem.Eof) do
    begin
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear; // o valor do desconto fica unitario devido a quantidade atendida e cancelada
        wValor := FloatToStr(wIndice * QPedidoItemValor_Total.Value / QPedidoItemQt_Pedido.Value);
        while Pos(',', wValor) > 0 do
          wValor[Pos(',', wValor)] := '.';
        wComando := 'UPDATE TB_PEDIDO_ITEM SET VAL_DESCONTO = ' + wValor;
        wComando := wComando + ' WHERE COD_PEDIDO_ITEM = ' + QPedidoItemCod_Pedido_Item.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
      QPedidoItem.Next;
    end;
  end;
end;

procedure TDMPedido.QPedidoCOD_CADASTROValidate(Sender: TField);
var wVendedor, wDtVencto, wLibera, wDesconto, wPrazoEntrega : string;
//    wLibera : String;
begin
  wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(QPedidoCod_Cadastro.Value), True);
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO') OR
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERFOZ')) Then
  Begin
    wDesconto := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO','COD_CADASTRO = '+ IntToStr(QPedidoCod_Cadastro.Value), True);
    wPrazoEntrega := DMOracle.BuscaNome('SELECT NUM_DIA_VENCTO FROM TB_CADASTRO','COD_CADASTRO='+ IntToStr(QPedidoCod_Cadastro.Value), True);
    if wDesconto <> '' then
      QPedidoVAL_DESCONTO.Value := StrToFloat(wDesconto);
    If wPrazoEntrega <> '' then
      QPedidoDT_ENTREGA.Value := DMOracle.DataServ + StrToInt(wPrazoEntrega);  
  end;
  if wVendedor <> '' then
    QPedidoCod_Vendedor.Value := StrToInt(wVendedor)
  else
    QPedidoCod_Vendedor.Text := '';
  if QPedidoCod_cadastro.Value > 0 then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(dmPedido.QPedidoCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    if wDtvencto <> '' then
    begin  
      if StrToDate(wDtVencto) < Date then
      begin
        wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'COD_CADASTRO = ' +
          FloatToStr(QPedidoCOD_CADASTRO.Value));
        if wLibera = 'NAO' then
          if DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'ENCOPEL' then
            ShowMessage('Cliente Com Titulos Atrasados')
          else
            raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
      end
      else
        if DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' then
          ShowMessage('Cliente Com Titulos A Vencer');
    end;
    if Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO', ' COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text)) <> '' then
      raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');

  end;
end;

procedure TDMPedido.QPedidoBeforePost(DataSet: TDataSet);
begin
  if Trim(QPedidoIND_TIPO_PAGAMENTO.Text) = 'A VISTA' then
    if (Trim(QPedidoCOD_PRAZO_VENCIMENTO.Text) <> '') or
      (Trim(QPedidoNR_DIAS_CHEQUE.Text) <> '') or
      (Trim(QPedidoNR_DIAS_CHEQUE1.Text) <> '') or
      (Trim(QPedidoNR_DIAS_CHEQUE2.Text) <> '') or
      (Trim(QPedidoNR_DIAS_CHEQUE3.Text) <> '') or
      (Trim(QPedidoNR_DIAS_CHEQUE4.Text) <> '') then
      raise Exception.Create('Tipo de Pagamento deve ser À Prazo');
  QPedidoCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMPedido.QRPedAbertoCalcFields(DataSet: TDataSet);
begin
  QRPedAbertonome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(QRPedAbertoCod_Vendedor.Value), True);
end;

procedure TDMPedido.ExcluiPedido;
var
  wSql, wSql1, wUsuario: string;
begin
  if MessageDlg('Apagar este pedido?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Abort;
  try
    pExcluindo := True;
    DMOracle.DBCemapa.StartTransaction;
{Para atualizar o usuário que excluiu o pedido quando for diferente do usuario que criou o pedido. Alex 18/11/2025}
    wUsuario := IntToStr(DMUsuario.CodUsuarioCorrente);
    wSql1 := 'UPDATE TB_PEDIDO_ITEM SET COD_USUARIO = ' + wUsuario + ' WHERE COD_PEDIDO_CAB = ' + QPedidoCOD_PEDIDO_CAB.Text;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add(wSql1);
    DMOracle.QExecSQL.ExecSQL;
{Atualizar o cab do pedido.}
    wSql := 'UPDATE TB_PEDIDO_CAB SET COD_USUARIO = ' + wUsuario + ' WHERE COD_PEDIDO_CAB = ' + QPedidoCOD_PEDIDO_CAB.Text;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add(wSql);
    DMOracle.QExecSQL.ExecSQL;
    QPedido.Refresh;
    DMOracle.Audit(TOracleDataset1(DMPedido.QPedido), 'Exclusão');
    QDeletaMateriais.Close;
    QDeletaMateriais.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
    QDeletaMateriais.Open;
    while not QDeletaMateriais.eof do
      QDeletaMateriais.DELETE;

    QDeletaItensProducao.Close;
    QDeletaItensProducao.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
    QDeletaItensProducao.Open;
    while not QDeletaItensProducao.Eof do
      QDeletaItensProducao.Delete;

   // QPedidoItem.First;
    while not QPedidoItem.Eof do
      QPedidoItem.Delete;

    QPedido.Delete;
    pExcluindo := False;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    pExcluindo := False;
    raise;
  end;
end;

procedure TDMPedido.QPedido_CanceladoAfterPost(DataSet: TDataSet);
begin
  QPedido_Cancelado.Close;
  QPedido_Cancelado.Open;
end;

procedure TDMPedido.QPedidoItem_CancCalcFields(DataSet: TDataSet);
begin
  QPedidoItem_Cancnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItem_CancCod_Produto.Value), True);
  QPedidoItem_Cancnome_lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = ' + FloatToStr(QPedidoItem_CancCod_Lote_Tipo.Value), True);
end;

procedure TDMPedido.QPedidoItemVAL_UNITARIOValidate(Sender: TField);
var wPreco_Min, wPreco_Max: string;
  wPreco: Real;
begin

end;

procedure TDMPedido.QPedidoItemCOD_PRODUTOValidate(Sender: TField);
var wEstado, wSituacao, wDtTabela, wClasse: string;
begin
  wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text);
  If ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') AND (wEstado <> 'PR')) then
    QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT TRUNC(PERC_TRIBUTACAO) FROM TB_ESTADO','COD_ESTADO = '+chr(39)+wEstado+chr(39))
  else
    QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value));
  QPedidoItemCOD_CULTURA.Text := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PRODUTO', 'COD_PRODUTO=' + QPedidoItemCod_Produto.Text);
  if DMParamSistema.QparamSistemaCOD_EMPRESA.Value <> 'TEMPERMED' Then 
    QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QPedidoCod_Cadastro.Value));
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value));
  if Trim(wSituacao) <> '' then
    if wSituacao <> 'ATIVO' then
      raise Exception.Create('Produto Não Está Ativo - Cadastro de Produtos');
  //if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') and (DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR',
  //        'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_CADASTRO =' + QPedidoCOD_CADASTRO.Text) = '') and
  //        (DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO','COD_CADASTRO='+QPedidoCOD_CADASTRO.Text) = 'SIM')) then
  //Begin
 //   QPedidoItemCOD_PRODUTO.Text := '';
  //  Raise Exception.Create('Preço do produto não cadastrado para esse cliente!');
  //end;
end;

procedure TDMPedido.QPedidoItemQT_CANCELADOValidate(Sender: TField);
begin
  if QPedidoItemQt_Pedido.Value < (QPedidoItemQt_Atendido.Value + QPedidoItemQt_Cancelado.Value) then
    raise Exception.Create('Quantidade Inválida!');
end;

procedure TDMPedido.QPedidoItemAfterPost(DataSet: TDataSet);
var
  wPedidoItem: Real;
  wProduto: string;
begin
  wPedidoItem := QPedidoItemCod_Pedido_Item.Value;
  QPedidoItem.Close;
  QpedidoItem.Open;
  QPedidoItem.Locate('COD_PEDIDO_ITEM', wPedidoItem, []);

  QSomaPedido.Close;
  QSomaPedido.Open;

      // *** Atualizar estoque com Quantidade 0 para gerar um registro de estoque ***
  if QPedidoItemCod_Produto.Text <> '' then
    DMEstoque.AtualizaEstoque(-2,
      QPedidoCod_Filial.Value,
      StrToInt(QPedidoItemCod_Produto.Text),
      QPedidoItemCod_Lote_Tipo.Value,
      0,
      0,
      0,
      0);
  if DSMaterial.State in [dsInsert, dsEdit] then
  begin
    QMateriais.Post;
    QMateriais.Edit;
  end;


  if DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_ACOMPANHAMENTO_PEDIDO', 'COD_PEDIDO_CAB = ' + QPedidoItemCOD_PEDIDO_CAB.Text + ' AND COD_PEDIDO_ITEM = ' + QPedidoItemCOD_PEDIDO_ITEM.Text) = '0' then
  Begin
    DMOracle.ExecutaSql(
      'INSERT INTO TB_ACOMPANHAMENTO_PEDIDO(COD_ACOMPANHAMENTO_PEDIDO, COD_PEDIDO_CAB, COD_PEDIDO_ITEM) ' +
      'VALUES(SQACOMPANHAMENTO_PEDIDO.NEXTVAL, ' + QPedidoItemCOD_PEDIDO_CAB.Text + ', ' + QPedidoItemCOD_PEDIDO_ITEM.Text + ')'
      );
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO') and (DMPedido.QPedidoCOD_CADASTRO.Value = 2)) then//VIDRAÇARIA MERCURIO
      DMOracle.ExecutaSql(
      'INSERT INTO TB_CONTROLE_ES(COD_CONTROLE_ES, COD_PEDIDO_ITEM) ' +
      'VALUES(SQCONTROLE_ES.NEXTVAL, ' + QPedidoItemCOD_PEDIDO_ITEM.Text + ')'
      );
  end;
  if QPedidoItemCOD_PRODUTO.Text <> '' then
    QPedidoItemNUM_FABRICANTE.Text := DMOracle.BuscaNome('SELECT DESC_COD_BARRA FROM TB_PRODUTO','COD_PRODUTO='+QPedidoItemCOD_PRODUTO.Text);
end;

procedure TDMPedido.QPedidoItemBeforeEdit(DataSet: TDataSet);
begin
  if QPedido.State <> dsEdit then
    raise Exception.Create('Pedido não está no modo de Alteração!');

end;

procedure TDMPedido.QPedidoItemBeforeInsert(DataSet: TDataSet);
begin
  if QPedido.State = dsInsert then
  begin
    QPedido.Post;
    QPedido.Edit;
  end;
  if QPedido.State <> dsEdit then
    raise Exception.Create('Pedido não está no modo de Alteração!');
end;

procedure TDMPedido.QPedidoItemBeforeDelete(DataSet: TDataSet);
begin
  if QPedidoItemQt_Atendido.Value > 0 then
    raise Exception.Create('Item Já Atendido Não é permitido Excluir!');
  if pExcluindo = False then
  begin
    if QPedido.State <> dsEdit then
      raise Exception.Create('Pedido não está no modo de Alteração!');
//    QPedidoItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QMateriais.Close;
    QMateriais.SetVariable('COD_PEDIDO_ITEM', QPedidoItemCOD_PEDIDO_ITEM.Value);
    QMateriais.Open;
    while not QMateriais.eof do
      QMateriais.DELETE;

    QDeletaItensProducao.Close;
    QDeletaItensProducao.SetVariable('COD_PEDIDO_ITEM', QPedidoItemCOD_PEDIDO_ITEM.Value);
    QDeletaItensProducao.SetVariable('COD_PEDIDO_CAB', QPedidoItemCOD_PEDIDO_CAB.Value);
    QDeletaItensProducao.Open;
    while not QDeletaItensProducao.Eof do
      QDeletaItensProducao.Delete;

    DMOracle.ExecutaSql('DELETE FROM TB_ACOMPANHAMENTO_PEDIDO WHERE COD_PEDIDO_CAB = ' + QPedidoItemCOD_PEDIDO_CAB.Text + ' AND COD_PEDIDO_ITEM = ' + QPedidoItemCOD_PEDIDO_ITEM.Text);

  end;
end;

procedure TDMPedido.QPedidoBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMPedido.QRPedidoEstoqueCalcFields(DataSet: TDataSet);
var wEstoque, wCusto: string;
begin
  if pFilial = 0 then
  begin
    wEstoque := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value));
    wCusto := DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value));
  end
  else
  begin
    wEstoque := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value) + ' And COD_FILIAL=' + FloatToStr(pFilial));
    wCusto := DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value) + ' And COD_FILIAL=' + FloatToStr(pFilial));
  end;
  if wEstoque <> '' then
    QRPedidoEstoqueQt_Estoque.Value := StrToFloat(wEstoque);
  if wCusto <> '' then
    QRPedidoEstoqueVl_Custo.Value := StrToFloat(wCusto);
end;

procedure TDMPedido.QRPedidoComNotaCalcFields(DataSet: TDataSet);
var wRetorno: string;
begin
  wRetorno := '';
  if QRPedidoComNotaNum_Nota.Value > 0 then
  begin
    wRetorno := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM', 'QT_PEDIDO > QT_ATENDIDO + QT_CANCELADO AND COD_PEDIDO_CAB = ' + QrPedidoComNotaCod_Pedido_Cab.Text);
    if wRetorno <> '' then
      QRPedidoComNotaInd_Situacao.Value := 'Parcial'
    else
      QRPedidoComNotaInd_Situacao.Value := 'Total';
  end
  else
    QRPedidoComNotaInd_Situacao.Value := 'Aberto';

end;

procedure TDMPedido.QPedidoCOD_OPERACAOValidate(Sender: TField);
begin
  if DMPedido.QPedidoCod_Operacao.Text <> '' then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk', DMPedido.QPedidoCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    if DMOperacao.QOperacao.Eof then
      raise Exception.Create('Operação Não Cadastrada');
  end;
end;

procedure TDMPedido.QRPedidoValorCalcFields(DataSet: TDataSet);
begin
  QRPedidoValorVal_Total.Value := QRPedidoValorSqt_Pedido.Value *
    QRPedidoValorVal_Unitario.Value;
  if QRPedidoValorPerc_Desconto.Value > 0 then
    QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
      (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto.Value / 100);
  if QRPedidoValorPerc_Desconto1.Text <> '' then
    QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
      (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto1.Value / 100);
  if QRPedidoValorPerc_Desconto2.Text <> '' then
    QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
      (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto2.Value / 100);
  if ((QRPedidoValorPerc_Acrescimo.Text <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')) then
    QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value +
      (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Acrescimo.Value / 100);
end;

procedure TDMPedido.QPedidoAfterInsert(DataSet: TDataSet);
var wData: TDateTime;
begin
  wData := DMOracle.DataServ;
  QPedidoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QPedidoDt_Sistema.Value := DMOracle.DataHoraServ;
  QPedidoCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;

  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' then
    QPedidoPerc_Comissao.Value := wComissao_Ant;
  QPedidoDt_Emissao.Value := wDtEmissao_Ant;

  QPedidoIND_LIBERADO.Value := 'SIM';
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
  begin
    QPedidoCOD_OPERACAO.Value := 52;
    QPedidoCOD_PRAZO_VENCIMENTO.Value := 1;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
  begin
    QPedidoCOD_OPERACAO.Value := 3;
    QPedidoCOD_PRAZO_VENCIMENTO.Value := 1;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
  begin
    QPedidoCOD_OPERACAO.Value := 250;
    QPedidoCOD_PRAZO_VENCIMENTO.Value := 1;
  end;

end;

procedure TDMPedido.QRPedidoCalcFields(DataSet: TDataSet);
begin
  if QrPedidoQt_Pedido.Value > 0 then
  begin
    QrPedidoValor_Total.Value := QrPedidoQt_Pedido.Value
      * Round(QrPedidoVal_Unitario.Value *
      (1 - QrPedidoPerc_Desconto.Value / 100) * 100) / 100;
    if QrPedidoPerc_Desconto1.Text <> '' then
      QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto1.Value / 100);
    if QrPedidoPerc_Desconto2.Text <> '' then
      QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto2.Value / 100);
    if QrPedidoPerc_Acrescimo.Text <> '' then
      QrPedidoValor_total.Value := QrPedidoValor_total.Value + (QrPedidoValor_total.Value * QrPedidoPerc_Acrescimo.Value / 100);
  end
  else
    QrPedidoValor_total.Value := QrPedidoVal_Unitario.Value;
  QRPedidoQRQuantidade.Value := QRPedidoQRQuantidade.Value + QRPedidoQT_PEDIDO.Value;

end;

procedure TDMPedido.QMateriaisBeforePost(DataSet: TDataSet);
var
wValVarejo : String;
wValAcabamento : Real;
begin
  if DSPedidoItem.State in [dsInsert] then
  begin
    QPedidoItem.Post;
    QPedidoItem.Edit;
  end;
  
end;

procedure TDMPedido.QPedidoItemAfterRefresh(DataSet: TDataSet);
var
  wCont: integer;
begin
  wCont := 0;
 // while not DMPedido.QPedidoItem.Eof do
 // Begin
 //   inc(wCont);
 //   DMPedido.QPedidoItemseq.Value := wCont;
 //   DMPedido.QPedidoItem.Next;
  //end;
end;

procedure TDMPedido.QPedidoItemAfterDelete(DataSet: TDataSet);
var
  wCont: integer;
begin
  wCont := 0;
 // DMPedido.QPedidoItem.First;
  //while not DMPedido.QPedidoItem.Eof do
  //Begin
  //  inc(wCont);
  //  DMPedido.QPedidoItemseq.Value := wCont;
  //  DMPedido.QPedidoItem.Next;
 // end;
end;

procedure TDMPedido.QEtiquetaCalcFields(DataSet: TDataSet);
begin
  QEtiquetanum_ordem_item.Value := StrToInt(DMOracle.BuscaNome(
    'select numero from ( ' +
    ' select b.cod_pedido_item, rownum as numero from( ' +
    ' select a.cod_pedido_item from tb_pedido_item a ' +
    ' where a.cod_pedido_cab = ' + QEtiquetaCOD_PEDIDO_CAB.Text +
    ' order by a.cod_pedido_item ' +
    ') b ' +
    ') '
    , 'cod_pedido_item = ' + QEtiquetaCOD_PEDIDO_ITEM.Text));

  QEtiquetanum_total_itens.Value := StrToInt(DMOracle.BuscaNome('select count(*) from tb_pedido_item', 'cod_pedido_cab = ' + QEtiquetaCOD_PEDIDO_CAB.Text));
end;

procedure TDMPedido.QPedidoItemBeforePost(DataSet: TDataSet);
var
  wValOriginal, wValVarejo, wValAcabamento, wQtEstoque: Real;
  wTipoProduto,wEstado,wConsumidorFinal : String;
begin
  if DMPedido.QPedidoItemCOD_PRODUTO.Text <> '' then
    wTipoProduto :=  DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+QPedidoItemCOD_PRODUTO.Text);
  //If ((wTipoProduto = 'PEÇA') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO')) Then
  //Begin
  //  wQtEstoque := StrToFloat(DMOracle.FastSelect('QT_QUANTIDADE','TB_ESTOQUE ', 'COD_PRODUTO = '+QPedidoItemCOD_PRODUTO.Text));
  //  If wQtEstoque < DMPedido.QPedidoItemQT_PEDIDO.Value then
  //    Raise Exception.Create('Quantidade em insuficiente('+FloatToStr(wQtEstoque)+')!');
  //  DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_FORNO = ''S'' WHERE COD_PEDIDO_ITEM =' + QPedidoItemCOD_PEDIDO_ITEM.Text);
 // end;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')) then
  begin
    if QPedidoVal_Desconto.Value <> 0 then
    begin
      if QPedidoItemCOD_PRODUTO.Text <> '' then
      begin
        if DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR',
          'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_CADASTRO =' + QPedidoCOD_CADASTRO.Text) <> '' then
          wValOriginal := StrToFloat(DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR',
            'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_CADASTRO =' + QPedidoCOD_CADASTRO.Text))
        else
          if DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.Text) <> '' then
            wValOriginal := StrTOFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.Text));
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
        Begin
          wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO='+DMPedido.QPedidoCOD_CADASTRO.Text);
          if wEstado = 'SC' then
            wValOriginal := StrToFloat(DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO=' + QPedidoItemCOD_PRODUTO.text));
        end;
        QPedidoItemVAL_UNITARIO.Value := ((wValOriginal - (wValOriginal * QPedidoVal_Desconto.Value) / 100));
      end;
    end;
    If ((QPedidoItemQT_PEDIDO.Value <= 0.25) and (QMateriaisDESC_SERVICO.Value <> 'SEM TEMPERA') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO')) then
      QPedidoItemQT_PEDIDO.Value := 0.25;
    If ((QPedidoItemQT_PEDIDO.Value <= 0.09) and (QMateriaisDESC_SERVICO.Value <> 'SEM TEMPERA') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')) then
      QPedidoItemQT_PEDIDO.Value := 0.09;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
  Begin
    //wConsumidorFinal := DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO','COD_CADASTRO='+QPedidoCOD_CADASTRO.Text);
    if QPedidoItemCOD_PRODUTO.Text <> '' then
      wValVarejo := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO='+QPedidoItemCOD_PRODUTO.Text));
    if QPedidoItemVAL_UNITARIO.Value <= wValVarejo then
    Begin
      if QPedidoItemPERC_ACRESCIMO.Text <> '' then
        QPedidoItemVAL_UNITARIO.Value := QPedidoItemVAL_UNITARIO.Value + ((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_ACRESCIMO.Value)/100);
      if QMateriaisVAL_ACABAMENTO.Text <> '' then
      Begin
        //wValAcabamento := (QMateriaisQT_ACABAMENTO.Value/1000) * QMateriaisVAL_ACABAMENTO.Value;
        wValAcabamento := ((((QMateriaisQT_ACABAMENTO.Value/1000) * QMateriaisVAL_ACABAMENTO.Value)*100)/(QPedidoItemVAL_UNITARIO.Value*QPedidoItemQT_PEDIDO.Value));
        wValAcabamento := QPedidoItemVAL_UNITARIO.Value + ((QPedidoItemVAL_UNITARIO.Value * wValAcabamento)/100);
        QPedidoItemVAL_UNITARIO.Value := wValAcabamento;
      end;
    end;
    //If wConsumidorFinal = 'NAO' Then  comentado Marcos 01/09/2012 retirado para nao calcular imposto no pedido
    //  CalculaIcmPedido;
   // if QMateriaisDESC_SERVICO.Value <> 'SEM TEMPERA' then
   //   CalculaIPIPedido;
  end;
  QPedidoItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMPedido.QPedidoAfterOpen(DataSet: TDataSet);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPER' then
    if DMPedido.QPedidoCOD_PEDIDO_CAB.Value <> 0 then
    begin
      QImagemPedido.Close;
      QImagemPedido.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
      QImagemPedido.Open;
    end;
end;

procedure TDMPedido.QEtiquetaOptyCalcFields(DataSet: TDataSet);
begin
  QEtiquetaOptynum_ordem_item.Value := StrToInt(DMOracle.BuscaNome(
    'select numero from ( ' +
    ' select b.cod_pedido_item, rownum as numero from( ' +
    ' select a.cod_pedido_item from tb_pedido_item a ' +
    ' where a.cod_pedido_cab = ' + QEtiquetaOptyCOD_PEDIDO_CAB.Text +
    ' order by a.cod_pedido_item ' +
    ') b ' +
    ') '
    , 'cod_pedido_item = ' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text));

  QEtiquetaOptynum_total_itens.Value := StrToInt(DMOracle.BuscaNome('select count(*) from tb_pedido_item', 'cod_pedido_cab = ' + QEtiquetaOptyCOD_PEDIDO_CAB.Text));
end;

procedure TDMPedido.QMateriaisAfterInsert(DataSet: TDataSet);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    QMateriaisVAL_AMOLADURA.Value := 3;
 
end;

procedure TDMPedido.QAcompanhamentoReposicaoCalcFields(DataSet: TDataSet);

begin
  QAcompanhamentoReposicaocod_cadastro.Text := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB ='+QAcompanhamentoReposicaoCOD_PEDIDO_CAB.Text);
  QAcompanhamentoReposicaonome.Text := DMOracle.BuscaNome('SELECT DESC_FANTASIA FROM TB_CADASTRO','COD_CADASTRO='+QAcompanhamentoReposicaocod_cadastro.Text);
end;

procedure TDMPedido.QAnaliseCreditoCalcFields(DataSet: TDataSet);
begin
  //QAnaliseCreditoval_cheque.Value := StrToFloat('0'+DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_BCO_MOVIMENTO','IND_BAIXA_CHEQUE=''N'' AND COD_CADASTRO='+QPedidoCOD_CADASTRO.Text));
  QAnaliseCreditoVAL_LIMITE.Value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_LIMITE FROM TB_CADASTRO','COD_CADASTRO='+ QPedidoCOD_CADASTRO.Text));
end;

Procedure TDMPedido.CalculaICMPedido;
Var wPercICM,wPercAliqSubs,wBaseAliqSubs, wValIcmItem, wValBaseIcmItem, wValBaseSubstItem  : Real;
    wPercDesc,wAuxBase, wTotal, wValUnitario, wQtPedido : Real;
    wPrecoPauta,wTipoCalculo : String;
    wClasse : Integer;
    wTipoCliente, wEstado,wIPI : string;
begin
  wPercAliqSubs := 0;
  wBaseAliqSubs := 0;
  wPercDesc := 0;
  wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO ','COD_CADASTRO='+QPedidoCOD_CADASTRO.Text);
  if DMPedido.QPedidoItemPERC_DESCONTO.Value > 0 then
    wValUnitario := StrToFloat(FormatFloat('#,##0.00',QPedidoItemVAL_UNITARIO.Value-((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_DESCONTO.Value)/100)))
  else
    wValUnitario := StrToFloat(FormatFloat('#,##0.00',QPedidoItemVAL_UNITARIO.Value));
  wQtPedido := StrToFloat(FormatFloat('#,##0.00',QPedidoItemQT_PEDIDO.Value));
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',DMPedido.QPedidoCOD_FILIAL.Text);
  DMFilial.QFilial.Open;

  if ((DMFilial.QFilialIND_ST.Value = 'S') and (DMPedido.QPedidoItemVAL_ICMS_SUBST.Text = '')) then
  Begin
    Try
      If QSomaPedidoSTotal_Pedido.Value >= 0 then
        wTotal := wValUnitario * wQtPedido;
      //else
      //  wTotal := (wValUnitario*wQtPedido)+((wValUnitario*wQtPedido)*QPedidoItemPERC_ACRESCIMO.Value/100);

      If wTotal <> 0 Then
        wPercDesc := 1+(QPedidoVal_Desconto.Value)/wTotal;
      If Trim(QPedidoItemCod_Tributacao.Text) <> '' then
      Begin
        wIPI := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO','COD_PRODUTO='+QPedidoItemCOD_PRODUTO.Text);
        If DMTributacao.QTributacaoCod_Tributacao.Value <>  QPedidoItemCod_Tributacao.Value Then
        Begin
          DMTributacao.QTributacao.Close;
          DMTributacao.QTributacao.SetVariable('Pk',QPedidoItemCod_Tributacao.Value);
          DMTributacao.QTributacao.Open;
        End;
        wPercICM := DMTributacao.QTributacaoPERC_ALIQUOTA.Value;
        wAuxBase := DMTributacao.QTributacaoPERC_TRIBUTADO.Value;

        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK',QPedidoCOD_OPERACAO.Text);
        DMOperacao.QOperacao.Open;
        If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
           (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) Then
           If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
              (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
              (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
              (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '70') Then // reducao de base de calculo e cobranca de icms por substituicao tributaria
           Begin
             If DMEstado.QEstadoCod_Estado.Value <> wEstado Then
             Begin
               DMEstado.QEstado.Close;
               DMEstado.QEstado.SetVariable('COD_ESTADO',wEstado);
               DMEstado.QEstado.Open;
             End;
             wPercAliqSubs := DMEstado.QEstadoPERC_ALIQ_SUBST.Value;
             wBaseAliqSubs := DMEstado.QEstadoPERC_BASE_SUBST.Value;
             DmTributacao.QProdutoSubstTribCons.Close; // esta trabalhando com esta tabela para o caso de produtos com substituicao diferente dentro do mesmo estado  - Cesar - 04/02/2010
             DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Produto', QPedidoItemCod_Produto.Value);
             DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Estado', wEstado);
             DmTributacao.QProdutoSubstTribCons.Open;
             if not (DmTributacao.QProdutoSubstTribCons.Eof) then
             begin
               wPercAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Aliquota.Value;
               wBaseAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Tributado.Value;
             end;
             DmTributacao.QProdutoSubstTribCons.Close;
           End;
        // Rotina para verificar se tem preco pauta para calculo de icms

       // wValBaseIcmItem := QPedidoItemValor_total.Value * wAuxBase / 100 * wPercDesc;
        wValBaseIcmItem := wTotal * wAuxBase / 100;
        wValIcmItem := wValBaseIcmItem * wPercICM / 100;

       If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
          (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) Then
         If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '70') Then // reducao de base de calculo e cobranca de icms por substituicao tributaria
          Begin
           wTipoCalculo := DMOracle.BuscaNome('SELECT IND_SUBSTITUICAO FROM TB_FILIAL','COD_FILIAL = '+QPedidoCod_Filial.Text,True);
           wPrecoPauta := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+QPedidoItemCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39));
           If (wPrecoPauta <> '') And (wTipoCalculo = 'P') Then  // calculo por pauta cfe tabela de filial
            Begin 
              //wValBaseSubstItem := StrToFloat(wPrecoPauta) * QPedidoItemQt_Pedido.Value;
              wBaseAliqSubs := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+QPedidoItemCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39)));
              if QMateriaisDESC_SERVICO.Value <> 'SEM TEMPERA' then
                wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100)
              else
                wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);
            End
           Else
           if QMateriaisDESC_SERVICO.Value <> 'SEM TEMPERA' then
             wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100 )
           else
             wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);

           QPedidoItemVal_Icms_Subst.Value := wValBaseSubstItem * wPercAliqSubs / 100;

           If QPedidoItemVal_Icms_Subst.Value <> 0 Then
            QPedidoItemVal_Icms_Subst.Value := QPedidoItemVal_Icms_Subst.Value - wValIcmItem;

          End;
      End;
    Except
      raise; //aqui
      //Raise Exception.Create ('Erro no Calculo de Icms');
    End;
  End;
End;

Procedure TDMPedido.CalculaIPIPedido;
var
wQtPedido : Real;
begin
   wQtPedido := StrToFloat(FormatFloat('#,##0.00',QPedidoItemQT_PEDIDO.Value));
   DMProduto.QProduto.Close;
   DMProduto.QProduto.SetVariable('PK',QPedidoItemCOD_PRODUTO.Value);
   DMProduto.QProduto.Open;
   if DMPedido.QPedidoItemPERC_DESCONTO.Value > 0 then
     QPedidoItemVAL_IPI.Value := ((((QPedidoItemVAL_UNITARIO.Value-((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_DESCONTO.Value)/100)) * wQtPedido) * DMProduto.QProdutoPERC_IPI.Value)/100)
   else
     QPedidoItemVAL_IPI.Value := (((QPedidoItemVAL_UNITARIO.Value * wQtPedido) * DMProduto.QProdutoPERC_IPI.Value)/100);

end;

procedure TDMPedido.QRPedProdutoCalcFields(DataSet: TDataSet);
begin
  QRPedProdutoqt_estoque.Value := StrToFLoat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO ='+ QRPedProdutoCOD_PRODUTO.Text)); 
end;

end.

