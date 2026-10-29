unit UPedido_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

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
    QPedidoItem_CancCOD_PRODUTO_AUX: TIntegerField;
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
    QPedidoItemCOD_PRODUTO_AUX: TIntegerField;
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
    QRPedidoComNotaCOD_PEDIDO_CAB: TFloatField;
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
    QMostraMateriais: TOracleDataSet1;
    QMostraMateriaisCOD_ITEM: TIntegerField;
    QMostraMateriaisCOD_PECA: TStringField;
    QMostraMateriaisVAL_LARGURA: TFloatField;
    QMostraMateriaisVAL_ALTURA: TFloatField;
    QMostraMateriaisVAL_AREA: TFloatField;
    QMostraMateriaisVAL_AMOLADURA: TIntegerField;
    QMostraMateriaisIND_TIPO: TStringField;
    QMostraMateriaisDESC_OBS_PECA: TStringField;
    QMostraMateriaisCOD_PEDIDO: TIntegerField;
    QMostraMateriaisIND_REPOSICAO: TStringField;
    DSMostraMateriais: TDataSource;
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
    QRMaterialCOD_PECA: TStringField;
    QRMaterialVAL_ALTURA: TFloatField;
    QRMaterialVAL_LARGURA: TFloatField;
    QRMaterialVAL_AREA: TFloatField;
    QRMaterialIND_TIPO: TStringField;
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
    QMostraMateriaisCOD_MATERIAL: TFloatField;
    QPedidoItemNUM_FABRICANTE: TStringField;
    QCustoFuncionario: TOracleDataSet1;
    QPedidoPERC_LUCRO: TFloatField;
    QPedidoPERC_ISSQN: TFloatField;
    QCustoFuncionarioCOD_FUNCIONARIO: TIntegerField;
    QCustoFuncionarioCOD_PEDIDO_CAB: TIntegerField;
    QCustoFuncionarioNUM_HORAS: TIntegerField;
    QCustoFuncionarioVAL_HORA: TFloatField;
    QCustoFuncionarioCOD_CUSTO_FUNCIONARIO: TIntegerField;
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
    procedure QPedidoBeforeInsert(DataSet: TDataSet);
    procedure QPedidoAfterCancel(DataSet: TDataSet);
    procedure QPedidoItemAfterInsert(DataSet: TDataSet);
    procedure QPedidoItemCalcFields(DataSet: TDataSet);
    procedure QPedidoAfterPost(DataSet: TDataSet);
    procedure QPedidoCOD_CADASTROValidate(Sender: TField);
    procedure QPedidoBeforePost(DataSet: TDataSet);
    procedure QRPedAbertoCalcFields(DataSet: TDataSet);
    procedure QPedido_CanceladoAfterInsert(DataSet: TDataSet);
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
    procedure QMostraMateriaisAfterInsert(DataSet: TDataSet);

    procedure checa_preco;
    procedure QPedidoItemPERC_DESCONTOValidate(Sender: TField);
    procedure QCustoFuncionarioBeforeInsert(DataSet: TDataSet);
    procedure QCustoFuncionarioBeforeEdit(DataSet: TDataSet);
    procedure QCustoFuncionarioBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    fExcluindo : Boolean;
    fFilial : Integer;
  public
    { Public declarations }
    Property pExcluindo : Boolean Read fExcluindo Write fExcluindo Default False;
    Property pFilial : Integer Read fFilial Write fFilial;  // utilizado na query QrPedidoEstoque
    Procedure ExcluiPedido;                                 // para usar no CalcFields
  end;

var
  DMPedido: TDMPedido;
  wVal_Unitario_Ant : Real;
  wComissao_Ant : Real;
  wDtEmissao_Ant : TDateTime;
implementation

uses UOracle_cl, UParamSistema_cl, UFilial_cl, UUsuario_cl, UEstoque_cl,
     UProduto_cl,UBiblioteca, UOperacao_cl, USenha;

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
begin
  QPedidoItemCod_Pedido_Cab.Value := QPedidoCod_Pedido_Cab.Value;
  QPedidoItemQt_Atendido.Value := 0;
  QPedidoItemQt_Cancelado.Value := 0;
  QPedidoItemCod_Lote_Tipo.Value := 1;
  QPedidoItemPerc_Desconto.Value := 0;
  QPedidoItemPerc_Comissao.Value := 0;
End;

procedure TDMPedido.QPedidoItemCalcFields(DataSet: TDataSet);
begin
  QPedidoItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True);
  If QPedidoItemQt_Pedido.Value > 0 Then
   Begin
     QPedidoItemValor_Total.Value := QPedidoItemQt_Pedido.Value
                                    *Round(QPedidoItemVal_Unitario.Value*
                                    (1-QPedidoItemPerc_Desconto.Value/100) * 100) / 100;
     If QPedidoItemPerc_Desconto1.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto1.Value / 100);
     If QPedidoItemPerc_Desconto2.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto2.Value / 100);
     If QPedidoItemPerc_Acrescimo.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + (QPedidoItemValor_total.Value * QPedidoItemPerc_Acrescimo.Value / 100);
   End
  Else
     QPedidoItemValor_total.Value := QPedidoItemVal_Unitario.Value;
end;

procedure TDMPedido.QPedidoAfterPost(DataSet: TDataSet);
Var wIndice : Real;
    wComando,wValor : String;
begin
  QPedido.SetVariable('PK',QPedidoCod_Pedido_Cab.Value);
  QPedido.Close;
  QPedido.Open;
  wComissao_Ant := QPedidoPerc_Comissao.Value;
  wDtEmissao_Ant := QPedidoDt_Emissao.Value;
  If QPedidoVal_Desconto.Value <> 0 Then
   Begin
     wIndice := QPedidoVal_Desconto.Value / QSomaPedidoSTotal_Pedido.Value;
     QPedidoItem.First;
     While Not (QPedidoItem.Eof) do
      Begin
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;   // o valor do desconto fica unitario devido a quantidade atendida e cancelada
          wValor := FloatToStr(wIndice * QPedidoItemValor_Total.Value / QPedidoItemQt_Pedido.Value);
          while Pos(',', wValor) > 0 do
               wValor[Pos(',', wValor)] := '.';
          wComando := 'UPDATE TB_PEDIDO_ITEM SET VAL_DESCONTO = ' + wValor;
          wComando := wComando + ' WHERE COD_PEDIDO_ITEM = ' + QPedidoItemCod_Pedido_Item.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        End;
        QPedidoItem.Next;
      End;
   End;
end;

procedure TDMPedido.QPedidoCOD_CADASTROValidate(Sender: TField);
Var wVendedor,wDtVencto,wLibera : String;
//    wLibera : String;
begin
  wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(QPedidoCod_Cadastro.Value),True );
  If wVendedor <> '' Then
    QPedidoCod_Vendedor.Value := StrToInt(wVendedor)
  Else
    QPedidoCod_Vendedor.Text := '';
  If QPedidoCod_cadastro.Value > 0 then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(dmPedido.QPedidoCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
    if wDtvencto <> '' then
     Begin
{       If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
        Begin
          wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO = '+
                                         FloatToStr(QPedidoCod_Cadastro.Value));
          If StrToDate(wDtVencto) < (Date - 5) Then
             If wLibera = 'NAO' Then
                raise Exception.Create('Cliente Com Titulos Em Aberto - Somente Vendas a Vista')
        End
       Else  }
        if StrToDate(wDtVencto) < Date Then
         Begin
          wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO','COD_CADASTRO = '+
                                        FloatToStr(QPedidoCOD_CADASTRO.Value));
          If wLibera = 'NAO' Then
             If DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'ENCOPEL' then
                ShowMessage('Cliente Com Titulos Atrasados')
             Else
                raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
         End
        Else
          If DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' then
             ShowMessage('Cliente Com Titulos A Vencer');
     End;
    If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QPedidoCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');

  End;
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
      Raise Exception.Create('Tipo de Pagamento deve ser À Prazo');
  QPedidoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;

end;

procedure TDMPedido.QRPedAbertoCalcFields(DataSet: TDataSet);
begin
  QRPedAbertonome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QRPedAbertoCod_Vendedor.Value),True);
end;

Procedure TDMPedido.ExcluiPedido;
begin
  if MessageDlg('Apagar este pedido?',mtConfirmation,[mbYes,mbNo],0) <> mrYes Then
    Abort;
  try
    pExcluindo := True;
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.Audit( TOracleDataset1 (DMPedido.QPedido ), 'Exclusão' );
    while not QPedidoItem.Eof do
      QPedidoItem.Delete;
    while not QMostraMateriais.Eof do
      QMostraMateriais.Delete;
    QPedido.Delete;
    pExcluindo := False;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    pExcluindo := False;
    raise;
  end;
end;

procedure TDMPedido.QPedido_CanceladoAfterInsert(DataSet: TDataSet);
begin
//  QPedido_CanceladoCod_Pedido_Cancelado.Value := DmOracle.Sequencia('PEDIDO_CANCELADO');
end;

procedure TDMPedido.QPedido_CanceladoAfterPost(DataSet: TDataSet);
begin
  QPedido_Cancelado.Close;
  QPedido_Cancelado.Open;
end;

procedure TDMPedido.QPedidoItem_CancCalcFields(DataSet: TDataSet);
begin
  QPedidoItem_Cancnome_produto.Value:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItem_CancCod_Produto.Value),True);
  QPedidoItem_Cancnome_lote.Value:= DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = '+FloatToStr(QPedidoItem_CancCod_Lote_Tipo.Value),True);
end;

procedure TDMPedido.checa_preco;
var
  wPreco2,wDesconto : String;
  wPrecoMinimo : Real;
  wVal : string;
  wDtVencimentoPreco : TDate;
Begin
  If false then //o Fernando da brasperon pediu pra tirar temporariamente
    If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') And
       (QPedidoIND_TIPO_PAGAMENTO.Value <> 'RESERVA')  then
    Begin
      If (not DmUsuario.Privilegiado){ And (DMOperacao.QOperacaoInd_Vendas.Value = 'V')} Then  // propriedade definida na dmusuario
      Begin
        wPrecoMinimo := 0;
        wPreco2 := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO',
                                      'COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value) );
        If DMUsuario.pPerc_Desconto_Maximo <> 0 Then
           wDesconto := FloatToStr(DMUsuario.pPerc_Desconto_Maximo)
        Else
           wDesconto := DMOracle.BuscaNome('SELECT PERC_DESCONTO_MAXIMO FROM TB_PRODUTO',
                                           'COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value) );
        If Trim(wPreco2) <> '' then
           wPrecoMinimo := StrToFloat(wPreco2);
        If Trim(wDesconto) <> '' Then
           wPrecoMinimo := wPrecoMinimo*(1-StrToFloat(wDesconto)/100 );

        wPrecoMinimo := strtofloat(FormatFloat('0.00', wPrecoMinimo));

        wDtVencimentoPreco := QPedidoDT_VENCIMENTO.Value;
        wVal := DMOracle.BuscaNome('SELECT DT_VENCTO_PRECO FROM TB_PRODUTO', 'COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value) );
        if wVal <> '' then
          wDtVencimentoPreco := StrToDate(wVal);


        // se o desconto dado for maior que o permitido, ou o valor unitario
        //informado tiver com desconto maior que o permitido retornar erro
        //nessa ultima verificacao, se o valor for 0.00, nao retornar o erro.
        //ou a data de vencimento do preco do produto for menor que a data de
        //vencimento do pedido.
        if (
             (wDesconto <> '') and
             (DMPedido.QPedidoItemPERC_DESCONTO.Value > StrToFloat(wDesconto))
           )
           or
           (
            ((wPrecoMinimo > QPedidoItemVal_Unitario.Value * (1-DMPedido.QPedidoItemPERC_DESCONTO.Value / 100)) and
            (QPedidoItemVal_Unitario.Value * (1-DMPedido.QPedidoItemPERC_DESCONTO.Value / 100) <> 0.00))
           )
           or
           (
             wDtVencimentoPreco < QPedidoDT_VENCIMENTO.Value
           )
            then
        Begin
          If Fsenha = Nil Then
            FSenha := TFSenha.Create(Application);

          FSenha.Label2.Visible := false;
          FSenha.MeUsuario.Visible := false;
          FSenha.BtConsProduto.Visible := false;

          Fsenha.ShowModal;

          FSenha.Label2.Visible := true;
          FSenha.MeUsuario.Visible := true;
          FSenha.BtConsProduto.Visible := true;

          If UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) Then
            Raise Exception.Create('Preço unitário abaixo do preço mínimo ou Desconto maior que o Desconto Máximo!');
        End;
      End;
    End;
end;

procedure TDMPedido.QPedidoItemVAL_UNITARIOValidate(Sender: TField);
var wPreco_Min,wPreco_Max : String;
    wPreco : Real;
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARZ') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') Then
    If QPedidoItemVal_Unitario.Value > 0 then
    begin
      wPreco_Max := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
      wPreco_Min := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
      if Trim(wPreco_Min) <> '' Then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
        Begin
          if (QPedidoItemVal_Unitario.Value <> StrToFloat(wPreco_Min)) And
             (QPedidoInd_Tipo_Frete.Value = 'FOB')  then
            ShowMessage('Preço Informado Diferente do Preço do Cadastro de Produtos');
        End;

      if Trim(wPreco_Max) <> '' Then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
        Begin
          if (QPedidoItemVal_Unitario.Value <> StrToFloat(wPreco_Max)) And
             (QPedidoInd_Tipo_Frete.Value = 'CIF')  then
            ShowMessage('Preço Informado Diferente do Preço do Cadastro de Produtos');
        End;
    end;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
      If (QPedidoCod_Departamento.Value = 11) Then
       Begin
         wPreco_Min := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO',
                                     'COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
         If Trim(wPreco_Min) <> '' then
          Begin
            wPreco := Trunc(StrToFloat(Trim(wPreco_Min)) * 100) / 100;
            If  QPedidoItemVal_Unitario.Value < wPreco then
               Raise Exception.Create('Preço Abaixo da Tabela');
          End;
       End;

  checa_preco;

end;

Procedure TDMPedido.QPedidoItemCOD_PRODUTOValidate(Sender: TField);
var wEstado,wSituacao, wDtTabela, wClasse : String;
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS')     and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO')  Then
   Begin
     QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value);
     QPedidoItemCod_Tributacao.Text:= DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
   End
  else
     If DMOperacao.QOperacaoCod_Tributacao.Text <> '' Then
        QPedidoItemCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
     else
       Begin
        wEstado:= DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value),True);
        If wEstado = 'PR' Then
         Begin
           If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And (QPedidoCod_Filial.Value = 10) Then
            Begin
              wClasse := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True);
              If (wClasse = '249') or (wClasse = '250') Then  // Pipoca
                 QPedidoItemCod_Tributacao.Value := 79
              Else
                 QPedidoItemCod_Tributacao.Value := 80  // arroz e feijao
            End
           Else
             QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value))
         End
        Else
          If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
           Begin
             wClasse := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True);
             If QPedidoCod_Filial.Value = 10 Then // filial do mato grosso do sul
              Begin
               If (wClasse = '249') or (wClasse = '250') or (wClasse = '259') or (wClasse = '263') or (wClasse = '272') Then  // Pipoca
                  QPedidoItemCod_Tributacao.Value := 79
               Else
                  QPedidoItemCod_Tributacao.Value := 80  // arroz e feijao
              End
             Else If wEstado = 'MS' Then  // cliente que esta vendendo é do mato grosso do sul
              Begin
               If (wClasse = '225') or (wClasse = '227') Then
                  QPedidoItemCod_Tributacao.Value := 70  // feijao
               Else
                  QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+ wEstado+CHR(39));
              End;
           End
          Else
            QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+ wEstado+CHR(39));
       End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
     QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value);
     wDtTabela := DMOracle.BuscaNome('SELECT DT_VENCTO_PRECO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
     If wDtTabela <> '' Then
        If StrToDate(wDtTabela) < DMOracle.DataServ Then
           Raise Exception.Create('Produto com preço expirado');
   End
  Else
     QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
  wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
  If Trim(wSituacao) <> '' Then
    If wSituacao <> 'ATIVO' Then
       Raise Exception.Create ('Produto Não Está Ativo - Cadastro de Produtos');

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR') then
    QPedidoItemVal_Unitario.Value:= StrToFloat(DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE ','COD_PRODUTO = ' +DMPedido.QPedidoItemCod_Produto.Text));

end;

procedure TDMPedido.QPedidoItemQT_CANCELADOValidate(Sender: TField);
begin
  if QPedidoItemQt_Pedido.Value < (QPedidoItemQt_Atendido.Value+QPedidoItemQt_Cancelado.Value) Then
     raise Exception.Create('Quantidade Inválida!');
end;

procedure TDMPedido.QPedidoItemAfterPost(DataSet: TDataSet);
var wPedidoItem : Real;
begin
  wPedidoItem := QPedidoItemCod_Pedido_Item.Value;
  QPedidoItem.Close;
  QpedidoItem.Open;
  QPedidoItem.Locate('COD_PEDIDO_ITEM',wPedidoItem,[]);
  QSomaPedido.Close;
  QSomaPedido.Open;
      // *** Atualizar estoque com Quantidade 0 para gerar um registro de estoque ***
  DMEstoque.AtualizaEstoque(-2,
                            QPedidoCod_Filial.Value,
                            StrToInt(QPedidoItemCod_Produto.Text),
                            QPedidoItemCod_Lote_Tipo.Value,
                            0,
                            0,
                            0,
                            0);
 
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
  If QPedidoItemQt_Atendido.Value > 0 Then
     raise Exception.Create('Item Já Atendido Não é permitido Excluir!');
  If pExcluindo = False Then
  begin
    if QPedido.State <> dsEdit then
       raise Exception.Create('Pedido não está no modo de Alteração!');
  end;
end;

procedure TDMPedido.QPedidoBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPedido.QRPedidoEstoqueCalcFields(DataSet: TDataSet);
Var wEstoque,wCusto : String;
begin
  If pFilial = 0 Then
   Begin
     wEstoque := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE','COD_PRODUTO = '+FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value));
     wCusto := DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE','COD_PRODUTO = '+FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value));
   End
  Else
   Begin
     wEstoque := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE','COD_PRODUTO = '+FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value) + ' And COD_FILIAL=' +FloatToStr(pFilial));
     wCusto := DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE','COD_PRODUTO = '+FloatToStr(QRPedidoEstoqueCOD_PRODUTO.Value) + ' And COD_FILIAL=' +FloatToStr(pFilial));
   End;
  If wEstoque <> '' Then
     QRPedidoEstoqueQt_Estoque.Value := StrToFloat(wEstoque);
  If wCusto <> '' Then
     QRPedidoEstoqueVl_Custo.Value := StrToFloat(wCusto);
end;

procedure TDMPedido.QRPedidoComNotaCalcFields(DataSet: TDataSet);
Var wRetorno : String;
begin
  wRetorno := '';
  If QRPedidoComNotaNum_Nota.Value > 0 Then
   Begin
     wRetorno := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM','QT_PEDIDO > QT_ATENDIDO + QT_CANCELADO AND COD_PEDIDO_CAB = '+QrPedidoComNotaCod_Pedido_Cab.Text);
     If wRetorno <> '' Then
        QRPedidoComNotaInd_Situacao.Value := 'Parcial'
     Else
        QRPedidoComNotaInd_Situacao.Value := 'Total';
   End
  Else
   QRPedidoComNotaInd_Situacao.Value := 'Aberto';

end;

procedure TDMPedido.QPedidoCOD_OPERACAOValidate(Sender: TField);
begin
  If DMPedido.QPedidoCod_Operacao.Text <> '' Then
  Begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk',DMPedido.QPedidoCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    If DMOperacao.QOperacao.Eof Then
       Raise Exception.Create('Operação Não Cadastrada');
  End;

end;

procedure TDMPedido.QRPedidoValorCalcFields(DataSet: TDataSet);
begin
  QRPedidoValorVal_Total.Value := QRPedidoValorSqt_Pedido.Value *
                                     QRPedidoValorVal_Unitario.Value;
  If QRPedidoValorPerc_Desconto.Value > 0 Then
     QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
       (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto.Value / 100);
  If QRPedidoValorPerc_Desconto1.Text <> '' Then
     QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
       (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto1.Value / 100);
  If QRPedidoValorPerc_Desconto2.Text <> '' Then
     QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value -
       (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Desconto2.Value / 100);
  If QRPedidoValorPerc_Acrescimo.Text <> '' Then
     QRPedidoValorVal_Total.Value := QRPedidoValorVal_Total.Value +
       (QRPedidoValorVal_Total.Value * QRPedidoValorPerc_Acrescimo.Value / 100);
  
end;

procedure TDMPedido.QPedidoAfterInsert(DataSet: TDataSet);
var wData:TDateTime;
begin
  wData := DMOracle.DataServ;
  QPedidoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QPedidoDt_Sistema.Value := DMOracle.DataHoraServ;
  QPedidoCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;

  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
     QPedidoPerc_Comissao.Value := wComissao_Ant;
  QPedidoDt_Emissao.Value := wDtEmissao_Ant;

  QPedidoIND_LIBERADO.Value := 'SIM';

  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' Then
  Begin
    QCustoFuncionario.open;
    QPedidoPERC_ISSQN.Value := 3;
    QPedidoVAL_IMPOSTO.Value := 5.4;
  End;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' Then
     QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
//  QPedidoItem.Close;
//  QPedidoItem.Open;
end;

procedure TDMPedido.QRPedidoCalcFields(DataSet: TDataSet);
begin
  If QrPedidoQt_Pedido.Value > 0 Then
   Begin
     QrPedidoValor_Total.Value := QrPedidoQt_Pedido.Value
                                    *Round(QrPedidoVal_Unitario.Value*
                                    (1-QrPedidoPerc_Desconto.Value/100) * 100) / 100;
     If QrPedidoPerc_Desconto1.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto1.Value / 100);
     If QrPedidoPerc_Desconto2.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto2.Value / 100);
     If QrPedidoPerc_Acrescimo.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value + (QrPedidoValor_total.Value * QrPedidoPerc_Acrescimo.Value / 100);
   End
  Else
     QrPedidoValor_total.Value := QrPedidoVal_Unitario.Value;

  If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
     QRPedidoQRQuantidade.Value := QRPedidoQT_PEDIDO.Value - QRPedidoQT_ATENDIDO.Value - QRPedidoQT_CANCELADO.Value
  Else
     QRPedidoQRQuantidade.Value := QRPedidoQT_PEDIDO.Value;

end;

procedure TDMPedido.QMostraMateriaisAfterInsert(DataSet: TDataSet);
begin
  QMostraMateriaisCod_Pedido.Value := QPedidoCod_Pedido_Cab.Value;
end;

procedure TDMPedido.QPedidoItemPERC_DESCONTOValidate(Sender: TField);
begin
checa_preco;
end;

procedure TDMPedido.QCustoFuncionarioBeforeInsert(DataSet: TDataSet);
begin
  if QPedido.State = dsInsert then
  begin
    QPedido.Post;
    QPedido.Edit;
  end;
  if QPedido.State <> dsEdit then
     raise Exception.Create('Pedido não está no modo de alteração!');
end;

procedure TDMPedido.QCustoFuncionarioBeforeEdit(DataSet: TDataSet);
begin
  if QPedido.State = dsInsert then
  Begin
    QPedido.Post;
    QPedido.Edit;
  End;
  If QPedido.State <> dsEdit then
    Raise Exception.Create('Pedido não está no modo de alteração!');
end;

procedure TDMPedido.QCustoFuncionarioBeforeDelete(DataSet: TDataSet);
begin
  If QPedido.State <> dsEdit then
    Raise Exception.Create('Pedido não está no modo de alteração!');
end;

end.
