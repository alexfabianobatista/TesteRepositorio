unit UPedido_cl;
                                                            
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, DBClient, Provider,StrUtils;

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
    QPedidoPERC_COMISSAO: TFloatField;
    QPedidoDT_VENCIMENTO: TDateTimeField;
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
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QCaixaCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QPedidoVAL_ADIANTAMENTO: TFloatField;
    QCaixaPedido: TOracleDataSet1;
    QCaixaPedidoCOD_CAIXA_MOV: TIntegerField;
    QCaixaPedidoDT_MOVIMENTO: TDateTimeField;
    QCaixaPedidoVAL_MOVIMENTO: TFloatField;
    QCaixaPedidoCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoDESC_PRAZO_VENCIMENTO: TStringField;
    QPedidoConsDESC_OPERACAO: TStringField;
    QPedidoItemCOD_MARCA: TIntegerField;
    QPedidoConsDESC_OBSERVACAO: TStringField;
    QRPedidoVAL_DESCONTO: TFloatField;
    QPedidoDESC_VEICULO: TStringField;
    QPedidoDESC_TECIDO: TStringField;
    QPedidoDESC_FORMA_PAGAMENTO: TStringField;
    QRPedidoPeriodoNUM_PEDIDO: TIntegerField;
    QRPedidoPeriodoDT_EMISSAO: TDateTimeField;
    QRPedidoPeriodoCOD_CADASTRO: TIntegerField;
    QRPedidoPeriodoNOME: TStringField;
    QRPedidoPeriodoSVAL_TOTAL: TFloatField;
    QPedidosAntigos: TOracleDataSet1;
    QPedidosAntigosCOD_PEDIDO_CAB: TIntegerField;
    QEstoqueEmbarcadoAntigo: TOracleDataSet1;
    QEstoqueEmbarcadoAntigoNUM_CONTROLE: TIntegerField;
    QPedidoItensAntigos: TOracleDataSet1;
    QPedidoItensAntigosCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoConsNOME: TStringField;
    QRPrecoVendido: TOracleDataSet1;
    QRCotaVendedor: TOracleDataSet1;
    QRCotaVendedorCOD_VENDEDOR: TIntegerField;
    QRCotaVendedorNOME: TStringField;
    QRCotaVendedorCOD_PRODUTO: TFloatField;
    QRCotaVendedorDESC_PRODUTO: TStringField;
    QRCotaVendedorQT_PEDIDO: TFloatField;
    QRCotaVendedorQT_QUOTA_KG: TFloatField;
    QRCotaVendedorQT_DIFERENCA: TFloatField;
    QRPrecoVendidoCOD_VENDEDOR: TIntegerField;
    QRPrecoVendidoDESC_VENDEDOR: TStringField;
    QRPrecoVendidoCOD_PRODUTO: TFloatField;
    QRPrecoVendidoDESC_PRODUTO: TStringField;
    QRPrecoVendidoVAL_VAREJO: TFloatField;
    QRPrecoVendidoNUM_EMBARQUE: TIntegerField;
    QRPrecoVendidoCOD_EMBARQUE: TIntegerField;
    QRPrecoVendidoVAL_VENDA: TFloatField;
    QRPrecoVendidoVAL_DIFERENCA: TFloatField;
    QRPrecoVendidoQT_PEDIDO: TFloatField;
    QRPrecoVendidoVAL_TOTAL: TFloatField;
    QRPrecoVendidoVAL_DIFERENCA_TOTAL: TFloatField;
    QRPrecoVendidoVAL_VAREJO_TOTAL: TFloatField;
    QRPrecoVendidoDT_EMBARQUE: TDateTimeField;
    QRPrecoVendidoDT_EMISSAO: TDateTimeField;
    QRPedidoDESC_ENDERECO_FILIAL: TStringField;
    QRPedidoDESC_FONE_FILIAL: TStringField;
    QRPedidoDESC_CIDADE_FILIAL: TStringField;
    QRPedidoDESC_CEP_FILIAL: TStringField;
    QRPedidoDESC_LOCALIZACAO: TStringField;
    QPedidoCOD_CADASTRO_TRANSPORTADORA: TIntegerField;
    QRPedidoCOD_CADASTRO_TRANSPORTADORA: TIntegerField;
    QRPedidoNOME_TRANSPORTADOR: TStringField;
    QRPedidoval_substituicao: TFloatField;
    QRPedidoCOD_FILIAL: TIntegerField;
    QOrcamentoExcel: TOracleDataSet1;
    QOrcamentoExcelDT_EMISSAO: TDateTimeField;
    QOrcamentoExcelCOD_CADASTRO: TIntegerField;
    QOrcamentoExcelNOME: TStringField;
    QOrcamentoExcelDESC_E_MAIL: TStringField;
    QOrcamentoExcelDESC_TELEFONE: TStringField;
    QOrcamentoExcelDESC_CELULAR: TStringField;
    QOrcamentoExcelDESC_CIDADE: TStringField;
    QOrcamentoExcelCOD_ESTADO: TStringField;
    QOrcamentoExcelQT_PEDIDO: TFloatField;
    QOrcamentoExcelCOD_PRODUTO: TFloatField;
    QOrcamentoExcelDESC_PRODUTO: TStringField;
    QOrcamentoExcelVAL_UNITARIO: TFloatField;
    QOrcamentoExcelVAL_TOTAL: TFloatField;
    QOrcamentoExcelNUM_PEDIDO: TIntegerField;
    QOrcamentoExcelDESC_VEICULO: TStringField;
    QOrcamentoExcelDESC_TECIDO: TStringField;
    QOrcamentoExcelNOME_VENDEDOR: TStringField;
    QOrcamentoExcelDESC_CHASSI: TStringField;
    QPedidoDESC_CHASSI: TStringField;
    QOrcamentoExcelDESC_ENDERECO_FILIAL: TStringField;
    QOrcamentoExcelNUM_ENDERECO_FILIAL: TIntegerField;
    QOrcamentoExcelDESC_CIDADE_FILIAL: TStringField;
    QOrcamentoExcelCOD_ESTADO_FILIAL: TStringField;
    QOrcamentoExcelDESC_TELEFONE_FILIAL: TStringField;
    QOrcamentoExcelDESC_FAX_FILIAL: TStringField;
    QOrcamentoExcelCOD_PEDIDO_CAB: TIntegerField;
    QOrcamentoExcelVAL_DESCONTO: TFloatField;
    QOrcamentoExcelIND_TIPO_FRETE: TStringField;
    QOrcamentoExcelDESC_FORMA_PAGAMENTO: TStringField;
    QPedidoCompostoCons: TOracleDataSet1;
    QPedidoCompostoConsCOD_PEDIDO_CAB: TIntegerField;
    QPedidoCompostoConsDT_EMISSAO: TDateTimeField;
    QPedidoCompostoConsDT_PREVISAO_ENTREGA: TDateTimeField;
    QPedidoCompostoConsQT_QUANTIDADE: TFloatField;
    QPedidoCompostoConsCOD_USUARIO_VENDEDOR: TIntegerField;
    QPedidoCompostoConsNOME_CADASTRO: TStringField;
    QPedidoCompostoConsNOME_VENDEDOR: TStringField;
    QPedidoCompostoConsCOD_VENDEDOR: TIntegerField;
    QPedidoCompostoConsVAL_TOTAL: TFloatField;
    QPedidoCompostoConsNUM_CGC_CPF_CADASTRO: TStringField;
    QPedidoCompostoConsCOD_APLICACAO: TIntegerField;
    QPedidoCompostoConsDT_CONFIRMACAO: TDateTimeField;
    QPedidoCompostoConsdesc_situacao: TStringField;
    QPedidoCompostoConsIND_SITUACAO: TStringField;
    QPedidoCompostoConsNUM_PEDIDO: TIntegerField;
    QOrcamentoExcelDESC_OBSERVACAO: TStringField;
    QOrcamentoExcelDESC_COMPLEMENTO_OBS: TStringField;
    QOrcamentoExcelDESC_COMPLEMENTO_OBS2: TStringField;
    QPedidoDESC_OBSERVACAO: TStringField;
    QPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoDESC_COMPLEMENTO_OBS2: TStringField;
    QRPedidoDESC_FANTASIA: TStringField;
    QRPedidoDESC_E_MAIL: TStringField;
    QRPedidoComNotaCOD_PEDIDO_CAB: TIntegerField;
    QImagemPedido: TOracleDataSet1;
    QImagemPedidoCOD_IMAGEM_PEDIDO: TIntegerField;
    QImagemPedidoCOD_PEDIDO_CAB: TIntegerField;
    QImagemPedidoDESC_CAMINHO: TStringField;
    QImagemPedidoIMG_IMAGEM: TBlobField;
    QImagem_Consulta: TOracleDataSet1;
    QImagem_ConsultaCOD_IMAGEM_PEDIDO: TIntegerField;
    QImagem_ConsultaCOD_PEDIDO_CAB: TIntegerField;
    QImagem_ConsultaIMG_IMAGEM: TBlobField;
    QOrcamentoExcelIND_CESTA_BASICA: TStringField;
    QPedidoConsCOD_CIDADE: TIntegerField;
    QPedidoConsDESC_CIDADE: TStringField;
    QPedidoIND_TIPO_PAGAMENTO: TStringField;
    QRPedidoperc_comissao_item_calc: TFloatField;
    QRPedidoCOD_CLASSE: TIntegerField;
    QPedidoDESC_SAFRA: TStringField;
    QPedidoItemVAL_ICMS_SUBST: TFloatField;
    QPedidoItemVAL_IPI: TFloatField;
    QOrcamentoExcelVAL_ICMS_SUBST: TFloatField;
    QOrcamentoExcelVAL_IPI: TFloatField;
    QPedidoConsDESC_CHASSI: TStringField;
    QPedidoConsDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoConsDESC_COMPLEMENTO_OBS2: TStringField;
    QRPedidoVAL_ICMS_SUBST: TFloatField;
    QRPedidoDESC_PRODUTO2: TStringField;
    QPedidoCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QPedidoItemPERC_COMISSAO_PREPOSTO: TFloatField;
    QPedidoItemNUM_FABRICANTE: TStringField;
    QPedidoItemCOD_CFOP: TIntegerField;
    QRPedidoNUM_GENERO_NCM: TStringField;
    QPedidoDT_USUARIO: TDateTimeField;
    QRPedidoNUM_PESO_BRUTO: TFloatField;
    QRPedidoNUM_PESO_LIQUIDO: TFloatField;
    QRPedidoNUM_METROS_CUBICOS: TFloatField;
    QPedidoItemval_preco_minimo: TFloatField;
    QRPedidoCOD_CFOP: TIntegerField;
    QRPedidoQT_EMBALAGEM: TFloatField;
    QRPedProdutoDESC_MARCA: TStringField;
    QPedidoLOCAL_ULTIMA_ALTERACAO: TStringField;
    QPedidoItemLOCAL_ULTIMA_ALTERACAO: TStringField;
    QPedidoSTEP_PEDIDO_WEB: TIntegerField;
    QRPedidoIND_SITUACAO: TStringField;
    QPedidoConsCOD_PEDIDO_WEB: TIntegerField;
    QPedidoEspelhoWeb: TOracleDataSet1;
    DSPPedidoEspelhoWeb: TDataSetProvider;
    CDPedidoEspelhoWeb: TClientDataSet;
    CDPedidoEspelhoWebCOD_PEDIDO_CAB: TIntegerField;
    CDPedidoEspelhoWebNUM_PEDIDO: TIntegerField;
    CDPedidoEspelhoWebCOD_CADASTRO: TIntegerField;
    CDPedidoEspelhoWebDT_EMISSAO: TDateTimeField;
    CDPedidoEspelhoWebCOD_OPERACAO: TIntegerField;
    CDPedidoEspelhoWebNOME: TStringField;
    CDPedidoEspelhoWebDESC_OPERACAO: TStringField;
    CDPedidoEspelhoWebIND_SELECIONADO: TStringField;
    QPedidoEspelhoWebCOD_PEDIDO_CAB: TIntegerField;
    QPedidoEspelhoWebNUM_PEDIDO: TIntegerField;
    QPedidoEspelhoWebCOD_CADASTRO: TIntegerField;
    QPedidoEspelhoWebDT_EMISSAO: TDateTimeField;
    QPedidoEspelhoWebCOD_OPERACAO: TIntegerField;
    QPedidoEspelhoWebNOME: TStringField;
    QPedidoEspelhoWebDESC_OPERACAO: TStringField;
    QPedidoEspelhoWebIND_SELECIONADO: TStringField;
    QPedidoConsSTEP_PEDIDO_WEB: TIntegerField;
    QPedidoCOD_OBRA: TIntegerField;
    QPedidoItemCOD_TABELA_PRECO_CAB: TIntegerField;
    QSomaPedidosval_total_pedido: TFloatField;
    QPedidoIND_CONSUMIDOR_FINAL: TStringField;
    QRPedidoDESC_OBSERVACAO: TStringField;
    QPedidoCOD_VEICULO: TIntegerField;
    QRPedidoNUM_PLACA: TStringField;
    QRPedidoDESC_COMPLEMENTO_OBS2: TStringField;
    QRPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QRPedidoFornecedorExcel: TOracleDataSet1;
    QRPedidoFornecedorExcelCOD_FORNECEDOR: TIntegerField;
    QRPedidoFornecedorExcelDESC_FORNECEDOR: TStringField;
    QRPedidoFornecedorExcelCGC_FORNECEDOR: TStringField;
    QRPedidoFornecedorExcelDESC_ENDERECO_FORNECEDOR: TStringField;
    QRPedidoFornecedorExcelDESC_CIDADE_FORNECEDOR: TStringField;
    QRPedidoFornecedorExcelDESC_TELEFONE_FORNECEDOR: TStringField;
    QRPedidoFornecedorExcelCOD_PRODUTO: TFloatField;
    QRPedidoFornecedorExcelDESC_PRODUTO: TStringField;
    QRPedidoFornecedorExcelDESC_COD_BARRA: TStringField;
    QRPedidoFornecedorExcelQT_PEDIDO: TFloatField;
    QPedidoItemVAL_DESCONTO_VISUAL: TFloatField;
    QCodPedidoItem: TOracleDataSet1;
    QCodPedidoItemCOD_PEDIDO_ITEM: TIntegerField;
    QRPedidoDESC_FILIAL: TStringField;
    QPedidoCOD_PEDIDO_WEB: TIntegerField;
    QPedidoSTEP_SINCRONIZACAO: TStringField;
    QPedidoVAL_DESPESAS: TFloatField;
    QPedidoItemVAL_COMPRIMENTO: TFloatField;
    QPedidoItemVAL_DIAMETRO: TFloatField;
    QRPedidoVAL_COMPRIMENTO: TFloatField;
    QRPedidoVAL_DIAMETRO: TFloatField;
    QEtiquetaPedido: TOracleDataSet;
    QEtiquetaPedidoVAL_TOTAL: TFloatField;
    QEtiquetaPedidoVAL_UNITARIO: TFloatField;
    QEtiquetaPedidoCOD_LOTE_TIPO: TIntegerField;
    QEtiquetaPedidoCOD_PRODUTO: TFloatField;
    QEtiquetaPedidoDESC_PRODUTO: TStringField;
    QEtiquetaPedidoQT_PEDIDO: TFloatField;
    QEtiquetaPedidoDT_EMISSAO: TDateTimeField;
    QEtiquetaPedidoDESC_COD_BARRA: TStringField;
    QPedidoItemIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QPedidoConsCOD_CADASTRO: TIntegerField;
    QPedidoConsCOD_VENDEDOR: TIntegerField;
    QPedidoConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QSomaPedidoSPESO_BRUTO: TFloatField;
    QSomaPedidoSTOTAL_ATENDIDO_PEDIDO: TFloatField;
    QEtiquetaPedidoNOME_ARTISTA: TStringField;
    QEtiquetaPedidoVAL_VAREJO: TFloatField;
    QEtiquetaPedidoVAL_UNITARIO_SEM_DESCONTO: TFloatField;

    QLancaOrdemProducao: TOracleDataSet;
    QLancaOP_Item: TOracleDataSet1;
    QLancaOrdemProducaoCOD_BOLETIM: TIntegerField;
    QLancaOrdemProducaoCOD_FILIAL: TIntegerField;
    QLancaOrdemProducaoDT_BOLETIM: TDateTimeField;
    QLancaOrdemProducaoDESC_OBS: TStringField;
    QLancaOrdemProducaoVAL_CUSTO: TFloatField;
    QLancaOrdemProducaoCOD_FORMULA: TIntegerField;
    QLancaOrdemProducaoQT_FABRICADO: TFloatField;
    QLancaOrdemProducaoCOD_TURNO_CONTROLE: TIntegerField;
    QLancaOrdemProducaoPERC_MASSA: TFloatField;
    QLancaOrdemProducaoIND_TIPO_BOLETIM: TStringField;
    QLancaOrdemProducaoNUM_CONTROLE: TIntegerField;
    QLancaOrdemProducaoNUM_LINHA: TIntegerField;
    QLancaOrdemProducaoCOD_DEPARTAMENTO: TIntegerField;
    QLancaOrdemProducaoQT_FABRICADO_VARIACAO: TFloatField;
    QLancaOrdemProducaoIND_SITUACAO: TStringField;
    QLancaOrdemProducaoQT_BAIXADO: TFloatField;
    QLancaOrdemProducaoCOD_LOTE_TIPO: TIntegerField;
    QLancaOrdemProducaoCOD_CADASTRO_CQ: TIntegerField;
    QLancaOrdemProducaoCOD_CADASTRO_ENVASADOR: TIntegerField;
    QLancaOrdemProducaoVAL_MAO_OBRA: TFloatField;
    QLancaOrdemProducaoVAL_CUSTO_CONTABIL: TFloatField;
    QLancaOrdemProducaoCOD_CADASTRO_ROTULADOR: TIntegerField;
    QLancaOP_ItemCOD_BOLETIM: TIntegerField;
    QLancaOP_ItemCOD_BOLETIM_ITEM: TIntegerField;
    QLancaOP_ItemCOD_PRODUTO: TIntegerField;
    QLancaOP_ItemCOD_LOTE_TIPO: TIntegerField;
    QLancaOP_ItemQT_USADA: TFloatField;
    QLancaOP_ItemVAL_CUSTO: TFloatField;
    QFormulaItem: TOracleDataSet1;
    QFormulaItemCOD_FORMULA: TIntegerField;
    QFormulaItemCOD_FORMULA_ITEM: TIntegerField;
    QFormulaItemCOD_PRODUTO: TIntegerField;
    QFormulaItemCOD_LOTE_TIPO: TIntegerField;
    QFormulaItemQT_ITEM: TFloatField;
    QFormulaItemIND_REAPROVEITAMENTO: TStringField;
    QFormulaItemIND_BAIXA_ESTOQUE: TStringField;
    QFormulaItemVL_ULTIMO_CUSTO: TFloatField;
    QLancaOrdemProducaoCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoConsIND_SELECIONADO: TStringField;
    QPedidoConsSVAL_TOTAL: TFloatField;
    QRPedidoDESC_PRODUTO3: TStringField;
    QSomaPedidoSNUM_VOLUMES: TFloatField;
    QPedidoCOD_PEDIDO_MARKETPLACE: TStringField;
    QPedidoConsCOD_PEDIDO_MARKETPLACE: TStringField;
    QPedidoDESC_SITUACAO_MARKETPLACE: TStringField;
    QPedidoConsDESC_SITUACAO_MARKETPLACE: TStringField;
    QPedidoItemsqt_atendido: TFloatField;
    QPedidoConsNUM_PLACA: TStringField;
    QPedidoItemConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QFormulaItemVL_CUSTO_MEDIO: TFloatField;
    QSomaPedidoSTOTAL_CANCELADO: TFloatField;
    QRPedidoVAL_DESPESAS: TFloatField;
    QPedidosIntegraMax: TOracleDataSet1;
    QPedidosIntegraMaxCOD_PEDIDO_CAB: TIntegerField;
    QPedidosIntegraMaxCOD_FILIAL: TIntegerField;
    QPedidosIntegraMaxNUM_PEDIDO: TIntegerField;
    QPedidosIntegraMaxDT_EMISSAO: TDateTimeField;
    QPedidosIntegraMaxIND_TIPO_PAGAMENTO: TStringField;
    QPedidosIntegraMaxDT_FATURAMENTO: TDateTimeField;
    QPedidosIntegraMaxDT_ENTREGA: TDateTimeField;
    QPedidosIntegraMaxDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidosIntegraMaxIND_EMBARQUE: TStringField;
    QPedidosIntegraMaxDESC_OBSERVACAO: TStringField;
    QPedidosIntegraMaxDESC_COMPLEMENTO_OBS: TStringField;
    QPedidosIntegraMaxDESC_COMPLEMENTO_OBS2: TStringField;
    QPedidosIntegraMaxDESC_CHASSI: TStringField;
    QPedidosIntegraMaxCOD_PEDIDO_WEB: TIntegerField;
    QPedidosIntegraMaxSTEP_PEDIDO_WEB: TIntegerField;
    QPedidosIntegraMaxCOD_PEDIDO_MARKETPLACE: TStringField;
    QPedidosIntegraMaxDESC_SITUACAO_MARKETPLACE: TStringField;
    QPedidosIntegraMaxCOD_CADASTRO: TIntegerField;
    QPedidosIntegraMaxCOD_VENDEDOR: TIntegerField;
    QPedidosIntegraMaxIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QPedidosIntegraMaxDESC_OPERACAO: TStringField;
    QPedidosIntegraMaxCOD_CIDADE: TIntegerField;
    QPedidosIntegraMaxDESC_CIDADE: TStringField;
    QPedidosIntegraMaxNOME: TStringField;
    QPedidosIntegraMaxNUM_PLACA: TStringField;
    QPedidosIntegraMaxIND_SELECIONADO: TStringField;
    QPedidosIntegraMaxSVAL_TOTAL: TFloatField;
    QPedidosIntegraMaxCOD_EMBARQUE: TIntegerField;
    QRPedidoIND_TIPO_PRODUTO: TStringField;
    QRPedidoVAL_DESCONTO_ITEM: TFloatField;
    QROrcamentoRetifoz: TOracleDataSet1;
    QROrcamentoRetifozCOD_FILIAL: TIntegerField;
    QROrcamentoRetifozCOD_PEDIDO_CAB: TIntegerField;
    QROrcamentoRetifozNUM_PEDIDO: TIntegerField;
    QROrcamentoRetifozDT_EMISSAO: TDateTimeField;
    QROrcamentoRetifozDT_VENCIMENTO: TDateTimeField;
    QROrcamentoRetifozCOD_CADASTRO: TIntegerField;
    QROrcamentoRetifozCOD_VEICULO: TIntegerField;
    QROrcamentoRetifozNOME: TStringField;
    QROrcamentoRetifozDESC_ENDERECO: TStringField;
    QROrcamentoRetifozDESC_BAIRRO: TStringField;
    QROrcamentoRetifozDESC_TELEFONE: TStringField;
    QROrcamentoRetifozNUM_CGC_CPF: TStringField;
    QROrcamentoRetifozCOD_CIDADE: TIntegerField;
    QROrcamentoRetifozDESC_CEP: TStringField;
    QROrcamentoRetifozNUM_PLACA: TStringField;
    QROrcamentoRetifozDESC_CARACTERISTICA: TStringField;
    QROrcamentoRetifozKM_ATUAL: TFloatField;
    QROrcamentoRetifozDESC_CIDADE: TStringField;
    QROrcamentoRetifozCOD_ESTADO: TStringField;
    QROrcamentoRetifozDESC_FILIAL: TStringField;
    QROrcamentoRetifozNUM_CGC: TStringField;
    QROrcamentoRetifozDESC_INSCRICAO: TStringField;
    QROrcamentoRetifozDESC_ENDERECO_FILIAL: TStringField;
    QROrcamentoRetifozCOD_CIDADE_FILIAL: TIntegerField;
    QROrcamentoRetifozDESC_TELEFONE_FILIAL: TStringField;
    QROrcamentoRetifozDESC_LOGOTIPO_DANFE: TStringField;
    QROrcamentoRetifozDESC_CIDADE_FILIAL: TStringField;
    QROrcamentoRetifozCOD_ESTADO_FILIAL: TStringField;
    QROrcamentoRetifozCOD_PEDIDO_ITEM: TIntegerField;
    QROrcamentoRetifozCOD_PRODUTO: TFloatField;
    QROrcamentoRetifozDESC_PRODUTO: TStringField;
    QROrcamentoRetifozIND_TIPO_PRODUTO: TStringField;
    QROrcamentoRetifozNUM_FABRICANTE: TStringField;
    QROrcamentoRetifozQT_PEDIDO: TFloatField;
    QROrcamentoRetifozVAL_UNITARIO: TFloatField;
    QROrcamentoRetifozcnpj_ie: TStringField;
    QROrcamentoRetifozendereco_bairro_filial: TStringField;
    QROrcamentoRetifozDESC_BAIRRO_FILIAL: TStringField;
    QROrcamentoRetifozcidade_estado_filial: TStringField;
    QROrcamentoRetifozCOD_VENDEDOR: TIntegerField;
    QROrcamentoRetifozNOME_VENDEDOR: TStringField;
    QROrcamentoRetifozcodigo_nome_vendedor: TStringField;
    QROrcamentoRetifozcidade_estado: TStringField;
    QROrcamentoRetifoztipo_produto: TStringField;
    QROrcamentoRetifozDESC_OBSERVACAO: TStringField;
    QROrcamentoRetifozval_total_unitario: TFloatField;
    QROrcamentoRetifozPERC_DESCONTO: TFloatField;
    QROrcamentoRetifozval_desconto: TFloatField;
    QPedidoItemNUM_PEDIDO_COMPRA: TStringField;
    QPedidoItemNUM_PEDIDO_COMPRA_ITEM: TIntegerField;
    QPedidoItemCOD_PRODUTO_AUX: TFloatField;
    QPedidoItemConsCOD_PRODUTO_AUX: TFloatField;
    QPedidoItem_CancCOD_PRODUTO_AUX: TFloatField;
    QPedidoItemdesc_num_fabricante: TStringField;
    QSomaPedidoSTOTAL_ST: TFloatField;
    QPedidoVAL_ENTRADA: TFloatField;
    QRPedidoDESC_OBSERVACAO_RADIOLANDIA: TStringField;
    QOrcamentoExcelNUM_CGC_CPF: TStringField;
    QOrcamentoExcelNUM_FABRICANTE: TStringField;
    QRPedidoDESC_CELULAR: TStringField;
    QEtiquetaPedidoNUM_FABRICANTE: TStringField;
    QROrcamentoRetifozDESC_OBS_ITEM: TStringField;
    QROrcamentoRetifozVAL_DESCONTO_CAB: TFloatField;
    QROrcamentoRetifozDT_ENTREGA: TDateTimeField;
    QROrcamentoRetifozIND_TIPO_PAGAMENTO: TStringField;
    QROrcamentoRetifozDESC_ENDERECO_COMPLETO_FILIAL: TStringField;
    QROrcamentoRetifozIND_TIPO_FRETE: TStringField;
    QRPedidoDESC_CNPJ_FILIAL: TStringField;
    QRPedidoDESC_ENDERECO_FILIAL_NUMERO: TStringField;
    QRPedidoIMG_IMAGEM: TBlobField;
    QROrcamentoRetifozNUM_INSCRICAO: TStringField;
    QROrcamentoRetifozENDERECO_BAIRRO: TStringField;
    QRPedidoNUM_FABRICANTE: TStringField;
    QPedidoDESC_MANCAL_VIRABREQUEIM: TStringField;
    QPedidoDESC_BIELA_VIRABREQUEIM: TStringField;
    QPedidoDESC_MANCAL_CARCACA: TStringField;
    QPedidoDESC_ALOJ_CARCACA: TStringField;
    QPedidoDESC_CILINDRO_COMPRESSOR: TStringField;
    QPedidoDESC_CILINDRO_BLOCO: TStringField;
    QPedidoDESC_COLO_COMPRESSOR: TStringField;
    QRPedidoDESC_COLO_COMPRESSOR: TStringField;
    QRPedidoDESC_MANCAL_VIRABREQUEIM: TStringField;
    QRPedidoDESC_BIELA_VIRABREQUEIM: TStringField;
    QRPedidoDESC_MANCAL_CARCACA: TStringField;
    QRPedidoDESC_ALOJ_CARCACA: TStringField;
    QRPedidoDESC_CILINDRO_COMPRESSOR: TStringField;
    QRPedidoDESC_CILINDRO_BLOCO: TStringField;
    QPedidoDESC_TIPO_MOTOR: TStringField;
    QRPedidoDESC_TIPO_MOTOR: TStringField;
    QRPedidoPeriodoDESC_TIPO_MOTOR: TStringField;
    QROrcamentoRetifozDESC_COMPLEMENTO_PRODUTO: TStringField;
    QROrcamentoRetifozDESC_UNIDADE: TStringField;
    QRPedidoCustoQT_QUANTIDADE: TFloatField;
    QPedidoItemIND_POSICAO_MAX: TStringField;
    QPedidoIND_POSICAO_MAX: TStringField;
    QPedidoIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    QPedidoItemCOD_USUARIO: TIntegerField;
    QROrcamentoRetifozNUM_GENERO_NCM: TStringField;
    QPedidoDT_COMISSAO: TDateTimeField;
    QRPedido_AcompDT_EMISSAO: TDateTimeField;
    QRPedido_AcompNUM_PEDIDO: TIntegerField;
    QROrcamentoRetifozVAL_DESPESA_CAB: TFloatField;
    QROrcamentoRetifozDESC_MENSAGEM: TStringField;
    QConferenciaPedidoCodBarras: TOracleDataSet;
    QConferenciaPedidoCodBarrasCOD_PRODUTO: TFloatField;
    QConferenciaPedidoCodBarrasDESC_COD_BARRA: TStringField;
    QConferenciaPedidoCodBarrasQT_PEDIDO: TFloatField;
    QConferenciaPedidoCodBarrasDESC_PRODUTO: TStringField;
    QConferenciaPedidoCodBarrasNOME: TStringField;
    QConferenciaPedidoCodBarrasCOD_PEDIDO_CAB: TIntegerField;
    QConferenciaPedidoCodBarrasCOD_ESTOQUE_EMBARCADO: TIntegerField;
    QConferenciaPedidoCodBarrasCOD_LOTE_TIPO: TIntegerField;
    QItemPedidoCons: TOracleDataSet1;
    QItemPedidoConsCOD_PEDIDO_CAB: TIntegerField;
    QItemPedidoConsCOD_PEDIDO_ITEM: TIntegerField;
    QItemPedidoConsCOD_PRODUTO: TFloatField;
    QItemPedidoConsQT_PEDIDO: TFloatField;
    QItemPedidoConsDESC_PRODUTO: TStringField;
    QItemPedidoConsDESC_COD_BARRA: TStringField;
    QItemPedidoConsCOD_LOTE_TIPO: TIntegerField;
    QRPedAbertoDESC_PRAZO_VENCIMENTO: TStringField;
    QEntrega: TOracleDataSet1;
    QEntregaItem: TOracleDataSet1;
    QEntregaImagem: TOracleDataSet1;
    QEntregaCOD_ENTREGA_CAB: TIntegerField;
    QEntregaCOD_ENTREGADOR: TIntegerField;
    QEntregaDT_CRIACAO: TDateTimeField;
    QEntregaDT_ULT_ALTERACAO: TDateTimeField;
    QEntregaItemCOD_ENTREGA_CAB: TIntegerField;
    QEntregaItemCOD_ENTREGA_ITEM: TIntegerField;
    QEntregaItemCOD_NOTA_CAB: TIntegerField;
    QEntregaItemCOD_PEDIDO_CAB: TIntegerField;
    QEntregaItemCOD_CIDADE: TIntegerField;
    QEntregaItemDESC_BAIRRO: TStringField;
    QEntregaItemDESC_CEP: TStringField;
    QEntregaItemDESC_ENDERECO: TStringField;
    QEntregaItemDESC_OBS_ENTREGA: TStringField;
    QEntregaItemDESC_OBS_ENTREGADOR: TStringField;
    QEntregaItemDT_CRIACAO: TDateTimeField;
    QEntregaItemDT_ULT_ALTERACAO: TDateTimeField;
    QEntregaItemDT_ENTREGA: TDateTimeField;
    QEntregaItemDT_ENTREGA_PREV: TDateTimeField;
    QEntregaItemIND_SITUACAO: TStringField;
    QEntregaCOD_FILIAL: TIntegerField;
    QEntregaCons: TOracleDataSet1;
    QEntregaConsCOD_ENTREGA_CAB: TIntegerField;
    QEntregaConsCOD_ENTREGADOR: TIntegerField;
    QEntregaConsDT_CRIACAO: TDateTimeField;
    QEntregaConsDT_ULT_ALTERACAO: TDateTimeField;
    QEntregaConsCOD_FILIAL: TIntegerField;
    QEntregaConsfilial: TStringField;
    QEntregaItemDESC_COMPLEMENTO: TStringField;
    QEntregaConsCOD_ENTREGA_ITEM: TIntegerField;
    QEntregaConsCOD_NOTA_CAB: TIntegerField;
    QEntregaConsCOD_PEDIDO_CAB: TIntegerField;
    QEntregaConsDESC_ENDERECO: TStringField;
    QEntregaConsDESC_BAIRRO: TStringField;
    QEntregaConsDESC_CEP: TStringField;
    QEntregaConsDESC_COMPLEMENTO: TStringField;
    QEntregaConsCOD_CIDADE: TIntegerField;
    QEntregaConsDESC_OBS_ENTREGA: TStringField;
    QEntregaConsDESC_OBS_ENTREGADOR: TStringField;
    QEntregaConsDT_CRIACAO_ITEM: TDateTimeField;
    QEntregaConsDT_ENTREGA: TDateTimeField;
    QEntregaConsDT_ENTREGA_PREV: TDateTimeField;
    QEntregaConsDT_ALTERACAO_ITEM: TDateTimeField;
    QEntregaConsCOD_CADASTRO: TIntegerField;
    QEntregaConsnomecadastro: TStringField;
    DSEntregaCons: TDataSource;
    QEntregaConsNUM_PEDIDO: TIntegerField;
    QEntregaConsIND_SITUACAO: TStringField;
    QEntregaConsNOMEENTREGADOR: TStringField;
    QEntregaImagemCOD_ENTREGA_IMAGEM: TIntegerField;
    QEntregaImagemCOD_ENTREGA_ITEM: TIntegerField;
    QEntregaImagemIMG_ENTREGA: TBlobField;
    QRPedidoItemQtd: TOracleDataSet1;
    QRPedidoItemQtdCOD_PRODUTO: TFloatField;
    QRPedidoItemQtdDESC_PRODUTO: TStringField;
    QRPedidoItemQtdSQT_PEDIDO: TFloatField;
    QRPedidoItemQtdSQT_ATENDIDO: TFloatField;
    QRPedidoItemQtdSVAL_UNITARIO: TFloatField;
    QRPedidoItemQtdCidade: TOracleDataSet1;
    QRPedidoItemQtdCidadeCOD_PRODUTO: TFloatField;
    QRPedidoItemQtdCidadeDESC_PRODUTO: TStringField;
    QRPedidoItemQtdCidadeSQT_PEDIDO: TFloatField;
    QRPedidoItemQtdCidadeSQT_ATENDIDO: TFloatField;
    QRPedidoItemQtdCidadeSVAL_UNITARIO: TFloatField;
    QRPedidoItemQtdCidadeCOD_CIDADE: TIntegerField;
    QRPedidoItemQtdCidadeDESC_CIDADE: TStringField;
    QREntregaEntregador: TOracleDataSet1;
    QREntregaEntregadorCOD_ENTREGA_CAB: TIntegerField;
    QREntregaEntregadorCOD_ENTREGADOR: TIntegerField;
    QREntregaEntregadorNOMEENTREGADOR: TStringField;
    QREntregaEntregadorDT_CRIACAO: TDateTimeField;
    QREntregaEntregadorCOD_FILIAL: TIntegerField;
    QREntregaEntregadorNOMECADASTRO: TStringField;
    QREntregaEntregadorNUM_PEDIDO: TIntegerField;
    QREntregaEntregadorDESC_ENDERECO: TStringField;
    QREntregaEntregadorCOD_CIDADE: TIntegerField;
    QREntregaEntregadorDESC_OBS_ENTREGADOR: TStringField;
    QREntregaEntregadorDT_ENTREGA: TDateTimeField;
    QREntregaEntregadorDT_ENTREGA_PREV: TDateTimeField;
    QREntregaEntregadorIND_SITUACAO: TStringField;
    QPedidoVAL_FRETE: TFloatField;
    QRPedidoIND_OPCAO_PRODUTO: TStringField;
    QRPedidoNUM_CHASSI: TStringField;
    QRPedidoNUM_ANO_FAB: TIntegerField;
    QRPedidoDESC_CARACTERISTICA: TStringField;
    QRPedidoVEN_CELULAR: TStringField;
    QPedidoNUM_PLACA: TStringField;
    QPedidoNUM_ANO: TStringField;
    QRPedidoNUM_PLACA_VEICULO: TStringField;
    QRPedidoNUM_ANO_VEICULO: TStringField;
    QRPedidoDESC_VEICULO_PEDIDO: TStringField;
    QRPedidoDESC_CHASSI_VEICULO: TStringField;
    QRPedidoDESC_OBS_ITEM: TStringField;
    QRPedidoPRODNUMBARRAS: TStringField;
    QROrcamentoRetifozPRODNUMBARRAS: TStringField;
    QRPedidoItemQtdCliente: TOracleDataSet1;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    QRPedidoItemQtdClienteCOD_CADASTRO: TIntegerField;
    QRPedidoItemQtdClienteNOME: TStringField;
    QRPedidoIMAGEM_PEDIDO: TBlobField;
    QPedidoItemDESC_OBS_ITEM: TStringField;
    QConferenciaPedidoCodBarrasQT_EMBARCADO: TFloatField;

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
    procedure QCustoFuncionarioBeforeInsert(DataSet: TDataSet);
    procedure QCustoFuncionarioBeforeEdit(DataSet: TDataSet);
    procedure QCustoFuncionarioBeforeDelete(DataSet: TDataSet);
    procedure QPedidoItemNUM_FABRICANTEChange(Sender: TField);
    procedure QPedidoItemCOD_PRODUTOChange(Sender: TField);
    procedure QPedidoItemCOD_MARCAChange(Sender: TField);
    procedure QPedidoCompostoConsCalcFields(DataSet: TDataSet);
    procedure QPedidoItemBeforePost(DataSet: TDataSet);
    procedure QPedidoAfterEdit(DataSet: TDataSet);
    procedure QSomaPedidoCalcFields(DataSet: TDataSet);
    procedure QPedidoItemCOD_TABELA_PRECO_CABChange(Sender: TField);
    procedure QPedidoItemCOD_LOTE_TIPOChange(Sender: TField);
    procedure QROrcamentoRetifozCalcFields(DataSet: TDataSet);
    procedure QPedidoCOD_VENDEDORValidate(Sender: TField);
    procedure QEntregaBeforeEdit(DataSet: TDataSet);
    procedure QEntregaBeforeInsert(DataSet: TDataSet);
    procedure QEntregaAfterCancel(DataSet: TDataSet);
    procedure QEntregaConsCalcFields(DataSet: TDataSet);
    procedure QEntregaAfterPost(DataSet: TDataSet);
    procedure QEntregaItemBeforeInsert(DataSet: TDataSet);
    procedure QEntregaItemBeforeEdit(DataSet: TDataSet);
    procedure QEntregaAfterInsert(DataSet: TDataSet);
    procedure QEntregaItemAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fExcluindo : Boolean;
    fFilial : Integer;
    fAlterando: Boolean;
    fCodListaPreco: integer;
    fUtilizaListaPrecoTodosItens: boolean;
    fUtilizaListaPreco1Item: boolean;
    function estadoPedidoSituacao(situacao: string): string;
    Function CalculaICM() : Real;
    procedure UtilizaListaPrecoTodosItens;
    function BloqueiaItemRepetido: boolean;
    procedure LancaOrdemProducao;
  public
    { Public declarations }
    wDuplica_Pedido : Boolean;
    wProdutoListaPreco : Boolean;
    Property pExcluindo : Boolean Read fExcluindo Write fExcluindo Default False;
    Property pFilial : Integer Read fFilial Write fFilial;  // utilizado na query QrPedidoEstoque
    property pAlterando: Boolean read fAlterando write fAlterando default False;
    Procedure ExcluiPedido;                                 // para usar no CalcFields
    procedure CancelaPedido;
    procedure CancelaPedidoMaxima;
    Procedure CalculaICMPedido;
    Procedure CalculaIPIPedido;
    Procedure ExcluiEntrega;
    property pCodListaPreco: integer read fCodListaPreco write fCodListaPreco;
    property pUtilizaListaPrecoTodosItens: boolean read fUtilizaListaPrecoTodosItens write fUtilizaListaPrecoTodosItens;
    property pUtilizaListaPreco1Item: boolean read fUtilizaListaPreco1Item write fUtilizaListaPreco1Item;
    procedure PrecoTabela;
    function GeraInfAdicionalItem(DataSetItem: TOracleDataset1): string;
    procedure Acessa_Operacao;
    procedure Proc_GeraCaixa(PHistorico : Integer; pValor : Double; PComplemento : String);
    procedure ValidaEntrega(pCodigo : String);
  end;

var
  DMPedido: TDMPedido;
  wVal_Unitario_Ant : Real;
  wComissao_Ant : Real;
  wDtEmissao_Ant : TDateTime;
implementation

uses UOracle_cl, UParamSistema_cl, UFilial_cl, UUsuario_cl, UEstoque_cl,
     UProduto_cl,UBiblioteca, UOperacao_cl, USenha, UTributacao_cl,
  UEstado_cl, UCadastro_cl, UEmbarque_cl, UTabelaPreco_cl;

{$R *.DFM}

procedure TDMPedido.QPedidoBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  pUtilizaListaPrecoTodosItens := false; // Inicializa propriedade com um valor
  pUtilizaListaPreco1Item := false; // Inicializa propriedade com um valor
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
  var wCodTabelaPreco: integer;
  wValidadeTabelaPreco: string;
begin
  QPedidoItemCod_Pedido_Cab.Value := QPedidoCod_Pedido_Cab.Value;
  QPedidoItemQT_ATENDIDO.Value := 0;
  QPedidoItemQT_CANCELADO.Value := 0;
  QPedidoItemCOD_LOTE_TIPO.Value := 1;
  QPedidoItemPERC_DESCONTO.Value := 0;
  QPedidoItemPERC_COMISSAO.Value := 0;
  QPedidoItemVAL_IPI.Value := 0;
  QPedidoItemVAL_ICMS_SUBST.Value := 0;
  QPedidoItemQT_PEDIDO.Value := 1; // adicionado para agilizar inclusao de itens, remover se estiver errado.

  if pCodListaPreco > 0 then
    QPedidoItemCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;

  if pUtilizaListaPreco1Item then
  begin
    QPedidoItemCOD_TABELA_PRECO_CAB.Clear;
    pUtilizaListaPreco1Item := false;
  end;

  //No primeiro registro, deve inserir lista de preço do cadastro caso existir.
  if QPedidoItem.RecordCount = 0 then
  begin
    wCodTabelaPreco := StrToInt(DMOracle.FastSelect('NVL(COD_TABELA_PRECO_CAB, -1)', 'TB_CADASTRO'
      , 'COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text));
    if wCodTabelaPreco > 0 then
      QPedidoItemCOD_TABELA_PRECO_CAB.Value := wCodTabelaPreco;
  end;

  // Lista deve respeitar data de validade
  wValidadeTabelaPreco := '';
  wValidadeTabelaPreco := DMOracle.FastSelect('NVL(TO_CHAR(DT_VENCIMENTO_TABELA_PRECO),'+quotedStr('')+')',
    'TB_CADASTRO', 'COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text);
  if (trim(wValidadeTabelaPreco) <> '') and (strToDate(wValidadeTabelaPreco) < DMOracle.DataServ)
    and (not pUtilizaListaPrecoTodosItens) then
    QPedidoItemCOD_TABELA_PRECO_CAB.Clear;
End;

procedure TDMPedido.QPedidoItemCalcFields(DataSet: TDataSet);
Var wMargem, wCusto : Real;
begin
  If QPedidoItemCod_Produto.Text <> '' Then
   Begin
     QPedidoItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True);
     wMargem := StrToFloat('0' + DMOracle.BuscaNome('SELECT nvl(PERC_MARGEM_MINIMA,0) FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True));
     wCusto := StrToFloat('0' + DMOracle.BuscaNome('SELECT nvl(VL_CUSTO_MEDIO,0) FROM TB_ESTOQUE','COD_PRODUTO = '+QPedidoItemCod_Produto.Text +
                      ' AND COD_LOTE_TIPO='+QPedidoItemCod_Lote_Tipo.Text+' AND COD_FILIAL='+QPedidoCod_Filial.Text,True));
     QPedidoItemVal_Preco_Minimo.Value := wCusto + (wCusto * wMargem / 100);
   end;
  If QPedidoItemQt_Pedido.Value > 0 Then
   Begin
     QPedidoItemValor_Total.Value := QPedidoItemQt_Pedido.Value
                                    *Round(QPedidoItemVal_Unitario.Value*
                                    (1-QPedidoItemPerc_Desconto.Value/100) * 1000000) / 1000000;// Era *100 e /100. alterado por Diego para contar mais casas decimais no desconto. 11/09/2009
     If QPedidoItemPerc_Desconto1.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto1.Value / 100);
     If QPedidoItemPerc_Desconto2.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value - (QPedidoItemValor_total.Value * QPedidoItemPerc_Desconto2.Value / 100);
     If QPedidoItemPerc_Acrescimo.Text <> '' Then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + (QPedidoItemValor_total.Value * QPedidoItemPerc_Acrescimo.Value / 100);
     If QPedidoItemVal_icms_subst.Text <> ''  then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + QPedidoItemVal_ICMS_SUBST.Value;
     If QPedidoItemVal_IPI.Text <> ''  then
        QPedidoItemValor_total.Value := QPedidoItemValor_total.Value + QPedidoItemVal_IPI.Value;
   End
  Else
     QPedidoItemValor_total.Value := QPedidoItemVal_Unitario.Value;

  QPedidoItemsqt_atendido.Text := DMOracle.FastSelect('FUNC_QT_ATENDIDA_PEDIDO('+ IntToStr(QPedidoItemCOD_PEDIDO_ITEM.Value)
    + ')','DUAL','1=1');
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
  If (QPedidoVAL_DESCONTO.Value <> 0) and (not QPedidoItem.IsEmpty) Then
  Begin
    wIndice := 0;
    if QSomaPedidoSTOTAL_PEDIDO.Value > 0 then
      wIndice := QPedidoVal_Desconto.Value / QSomaPedidoSTOTAL_PEDIDO.Value;
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
  pCodListaPreco := 0;
end;

procedure TDMPedido.QPedidoCOD_CADASTROValidate(Sender: TField);
Var wVendedor,wDtVencto,wLibera : String;
//    wLibera : String;
begin
  wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(QPedidoCod_Cadastro.Value),True );
  If wVendedor <> '' Then
     QPedidoCod_Vendedor.Value := StrToInt(wVendedor);  // PEGA VENDEDOR DO CADASTRO DE USUARIO - CESAR 15/02/2021
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
          If (wLibera = 'NAO') And ( (DMParamSistema.CodEmpresa <> 'RADIO') and (DMParamSistema.CodEmpresa <> 'FERRAGMED') )  Then
          begin
            raise Exception.Create('Cliente com titulos em atraso - Cadastro não liberado.');
            SetFocus(QPedidoCOD_CADASTRO.Value)
          end
          else
            ShowMessage('Cliente com titulos em atraso');
         End
        Else
           ShowMessage('Cliente Com Titulos A Vencer');
     End;
    If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QPedidoCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');

    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK', QPedidoCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;
    QPedidoIND_CONSUMIDOR_FINAL.Value := DMCadastro.QCadastroIND_CONSUMIDOR_FINAL.Value;

  End;
end;

procedure TDMPedido.QPedidoBeforePost(DataSet: TDataSet);
var wNumParcelas: Integer;
begin
  DMOracle.ValidaFilial(QPedidoCOD_FILIAL.Text);
  //CAMPO USADO PARA O SINCRONISMO DE DADOS COM O SISTEMA DE PEDIDOS WEB
  QPedidoLOCAL_ULTIMA_ALTERACAO.Value := 'CEMAPA';

  if Trim(QPedidoIND_TIPO_PAGAMENTO.Text) = 'A VISTA' then
  begin
    wNumParcelas := StrToInt('0'+DMOracle.FastSelect('NUM_PARCELAS','TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = 0'+
        Trim(QPedidoCOD_PRAZO_VENCIMENTO.Text)));
    if (Trim(QPedidoNR_DIAS_CHEQUE.Text) <> '') or
       (Trim(QPedidoNR_DIAS_CHEQUE1.Text) <> '') or
       (Trim(QPedidoNR_DIAS_CHEQUE2.Text) <> '') or
       (Trim(QPedidoNR_DIAS_CHEQUE3.Text) <> '') or
       (Trim(QPedidoNR_DIAS_CHEQUE4.Text) <> '') or
       (wNumParcelas > 0)  then
      Raise Exception.Create('Tipo de Pagamento deve ser À Prazo');
  end;
  QPedidoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
// retirado pelo Cesar 11/11/2021
{  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE') and (DMUsuario.pTipoFuncionario <> 'DIRETOR')) then
  begin
    if QPedidoIND_SITUACAO.Value <> '1' then
      Exit;
    if DMOracle.BuscaNome('SELECT IND_ATACADO_VAREJO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text) = 'A' then
      Exit;

    QPedidoItem.First;
    while not QPedidoItem.Eof do
    begin
      Try
        wPrecoVarejo := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR' , 'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text +
                      ' AND COD_CADASTRO=' + QPedidoCOD_CADASTRO.Text));
      except
        wPrecoVarejo := 0;
      end;
      If wPrecoVarejo = 0 Then
       Begin
         try
           wPrecoVarejo := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text));
         except
           wPrecoVarejo := 0;
         end;
       End;
      wPrecoMinimo := wPrecoVarejo - (wPrecoVarejo * DMParamSistema.QParamSistemaPERC_DESCONTO_VISTA.Value / 100);
      wPrecoMaximo := wPrecoVarejo + (wPrecoVarejo * DMParamSistema.QParamSistemaPERC_ACRESCIMO_MES.Value / 100);
      wValItem := (QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100));

      wPrecoMinimo := Trunc(wPrecoMinimo * 100) / 100;
      wPrecoMaximo := Trunc(wPrecoMaximo * 100) / 100;
      wValItem := Trunc(wValItem * 100) / 100;

      if (wValItem < wPrecoMinimo) then
        raise Exception.Create('Valor do produto ' + QPedidoItemdesc_produto.Value + ' ABAIXO do valor permitido.');
      if (wValItem > wPrecoMaximo) then
        raise Exception.Create('Valor do produto ' + QPedidoItemdesc_produto.Value + ' ACIMA do valor permitido.');

      try
        wCotaSemana := StrToFloat(DMOracle.BuscaNome('SELECT QT_QUOTA_KG FROM TB_VENDEDOR_QUOTA', 'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_VENDEDOR = ' + QPedidoCOD_VENDEDOR.Text));
      except
        wCotaSemana := 0;
      end;

      wDataAtual := StrToDate(DMOracle.BuscaNome('SELECT TO_CHAR(CURRENT_DATE, ' + QuotedStr('dd/MM/yyyy') + ') FROM DUAL', '1 = 1'));

      if wCotaSemana > 0 then
      begin
        try
          wTotalSemana := StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_PEDIDO_ITEM.QT_PEDIDO) FROM TB_PEDIDO_ITEM INNER JOIN TB_PEDIDO_CAB ON TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB', 'TB_PEDIDO_ITEM.COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text + ' AND TB_PEDIDO_CAB.COD_VENDEDOR = ' + QPedidoCOD_VENDEDOR.Text + ' AND TB_PEDIDO_CAB.COD_PEDIDO_CAB <> ' + QPedidoCOD_PEDIDO_CAB.Text + ' AND TB_PEDIDO_CAB.IND_SITUACAO = ' + QuotedStr('1') + ' AND DT_EMISSAO BETWEEN ' + QuotedStr(FormatDateTime('dd/MM/yyyy', bib.diaSemanaAnterior(wDataAtual, 2))) + ' AND ' + QuotedStr(FormatDateTime('dd/MM/yyyy', bib.diaSemanaProximo(wDataAtual, 1)))));
        except
          wTotalSemana := 0;
        end;
        wTotalSemana := wTotalSemana + QPedidoItemQT_PEDIDO.Value;

        if wTotalSemana > wCotaSemana then
          raise Exception.Create('A quantidade vendida de ' + QPedidoItemdesc_produto.Value + ' ultrapassa a cota semanal de ' + FloatToStr(wCotaSemana) + ' KG.');
      end;

      QPedidoItem.Next;
    end;
  end; }
  if DMParamSistema.CodEmpresa = 'POLLYANA' then
    if QPedidoCOD_PRAZO_VENCIMENTO.Value = 0 then
      Raise Exception.Create('Informe o Prazo de Pagamento!');
  if (DMParamSistema.CodEmpresa = 'DINIZ') Then
     If DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A VISTA' Then
        DMPedido.QPedidoDT_COMISSAO.Value := Trunc(DMOracle.DataHoraServ)
     Else
        DMPedido.QPedidoDT_COMISSAO.Text := '';
end;

procedure TDMPedido.QRPedAbertoCalcFields(DataSet: TDataSet);
begin
  QRPedAbertonome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QRPedAbertoCod_Vendedor.Value),True);
end;

Procedure TDMPedido.ExcluiPedido;
var
  wSql, wSql1, wUsuario: string;
begin
  if MessageDlg('Apagar este pedido?',mtConfirmation,[mbYes,mbNo],0) <> mrYes Then
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
{Fim}
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



procedure TDMPedido.QPedidoItemVAL_UNITARIOValidate(Sender: TField);
var wPreco_Min,wPreco_Max : String;
    wPreco : Real;
begin
  If (DMParamSistema.CodEmpresa <> 'ARZ') And (DMParamSistema.CodEmpresa <> 'MOINHO') Then
    If QPedidoItemVal_Unitario.Value > 0 then
    begin
      wPreco_Max := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
      wPreco_Min := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
    end;
    If DMParamSistema.CodEmpresa = 'PLANTIAGRO' then
    Begin
      if DMPedido.QPedidoItemVAL_UNITARIO.Value < StrToFloat(wPreco_Min) then
        Raise Exception.Create('Preço Abaixo do mínimo permitido!');
    end;
    If DMParamSistema.CodEmpresa = 'MOINHO' Then
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
end;

Procedure TDMPedido.QPedidoItemCOD_PRODUTOValidate(Sender: TField);
var wEstado,wSituacao, wDtTabela, wClasse, wTipoProduto : String;
    wPercComissao : real;
begin
  if Not(wDuplica_Pedido) Then  // quando duplica pedido esta true significa que esta duplicando pedido caso contrario esta incluino pedido
  Begin
    wEstado:= DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value),True);
    If (DMParamSistema.CodEmpresa <> 'CGS') and (DMParamSistema.CodEmpresa <> 'MOINHO') Then
     Begin
       QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO_SUBST_TRIB',
          'COD_ESTADO = ' + CHR(39) + wEstado + CHR(39) +
          ' AND COD_FILIAL = ' + QPedidoCod_Filial.Text +
          ' AND COD_PRODUTO = ' + QPedidoItemCod_Produto.Text);
       if QPedidoItemCOD_TRIBUTACAO.Text = '' then
       begin
         if wEstado = DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL', 'COD_FILIAL = ' + QPedidoCod_Filial.Text, True) then
         Begin
           // Se utilizar lista de preço em todos os itens, não deve sobrescrever o preço já informado
           // nos itens que não utilizam lista de preço
           if not pUtilizaListaPrecoTodosItens then
             QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value,QPedidoCod_Cadastro.Text,'F',QPedidoItemCod_Lote_Tipo.Value);
           QPedidoItemCod_Tributacao.Text:= DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
           QPedidoItemCOD_CULTURA.Text := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PRODUTO','COD_PRODUTO = 0'+QPedidoItemCod_Produto.Text);
         end
         else
         Begin
           QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value,QPedidoCod_Cadastro.Text,'F',QPedidoItemCod_Lote_Tipo.Value);
           QPedidoItemCod_Tributacao.Text:= DMOracle.BuscaNome('SELECT TRUNC(PERC_TRIBUTACAO) FROM TB_ESTADO', 'COD_ESTADO = ' + chr(39)+wEstado+chr(39));
           if QPedidoItemCOD_TRIBUTACAO.Text = '' then
              QPedidoItemCod_Tributacao.Text:= DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
           QPedidoItemCOD_CULTURA.Text := DMOracle.BuscaNome('SELECT COD_CULTURA FROM TB_PRODUTO','COD_PRODUTO = 0'+QPedidoItemCod_Produto.Text);
         end;
       end;
     End
    else
       If DMOperacao.QOperacaoCod_Tributacao.Text <> '' Then
          QPedidoItemCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
       else
         Begin
          If wEstado = 'PR' Then
           Begin
             If (DMParamSistema.CodEmpresa = 'MOINHO') And (QPedidoCod_Filial.Value = 10) Then
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
            If (DMParamSistema.CodEmpresa = 'MOINHO') Then
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
    If DMParamSistema.CodEmpresa = 'MOINHO' Then
     Begin
       QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
       QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value,QPedidoCod_Cadastro.Text,'F',QPedidoItemCod_Lote_Tipo.Value);
       wDtTabela := DMOracle.BuscaNome('SELECT DT_VENCTO_PRECO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
       If wDtTabela <> '' Then
          If StrToDate(wDtTabela) < DMOracle.DataServ Then
             Raise Exception.Create('Produto com preço expirado');
     End
    Else
    //A Center Frio trabalha com 2 tipos de comissão, sobre peças e sobre serviço, quando for serviço buscar do perc_comissao2.  Junior - 15/07/2022
    if (DMParamSistema.CodEmpresa = 'INJEPAR') then
    begin
      wTipoProduto := DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text);
      if (wTipoProduto <> 'SERVIÇO') then
      begin
        wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QPedidoCOD_VENDEDOR.Text)));
        QPedidoItemPERC_COMISSAO.Value := wPercComissao;
      end
      else
      begin
        wPercComissao :=  strtofloat('0'+ DMOracle.BuscaNome('SELECT PERC_COMISSAO2 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + (QPedidoCOD_VENDEDOR.Text)));
        QPedidoItemPERC_COMISSAO.Value := wPercComissao;
      end;
    end
    else
    Begin
     QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
     if QPedidoItemPerc_Comissao.Text = '' then
     begin
      if (DMParamsistema.QParamSistemaIND_TIPO_COMISSAO.Text = '2') then //2 = produto - falta programar para os outros itens - Vanessa 15/12/2016
      begin
        QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
          if ((QPedidoItemPerc_Comissao.Text = '') and (QPedidoCod_Vendedor.Text <> '')) then
            QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QPedidoCod_Vendedor.Value));
      end;
     end
     else
     begin
       QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
       If (QPedidoItemPerc_Comissao.Value = 0) And (QPedidoCod_Vendedor.Text <> '') Then
          QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QPedidoCod_Vendedor.Value));
     end;
    End;

    wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
    If Trim(wSituacao) <> '' Then
      If wSituacao <> 'ATIVO' Then
         Raise Exception.Create ('Produto Não Está Ativo - Cadastro de Produtos');
  End;
  PrecoTabela; //Verifica se o produto está cadastrado em tabela de preço
end;

procedure TDMPedido.QPedidoItemQT_CANCELADOValidate(Sender: TField);
begin
  if QPedidoItemQt_Pedido.Value < (QPedidoItemsqt_atendido.Value + QPedidoItemQt_Cancelado.Value) Then
     raise Exception.Create('Quantidade Inválida!');
end;

procedure TDMPedido.QPedidoItemAfterPost(DataSet: TDataSet);
var wPedidoItem : Real;
begin
  wPedidoItem := QPedidoItemCod_Pedido_Item.Value;
  QPedidoItem.Close;
  QpedidoItem.Open;
  //COM O LOCATE FICAVA TODO DESORGANIZADO A INSERÇÃO DO ITENS E SEM O LOCATE O FOCO SEMPRE VOLTA PARA O PRIMEIRO ITEM NA ALTERAÇÃO.
  //foi criado uma property para verificar se o pedido está em alteração. Junior - 23/06/2015.
  if (pAlterando = True) then //Verifica se está em alteração.
    QPedidoItem.Locate('COD_PEDIDO_ITEM',wPedidoItem,[]);

  QSomaPedido.Close;
  QSomaPedido.Open;

  UtilizaListaPrecoTodosItens;
end;

procedure TDMPedido.QPedidoItemBeforeEdit(DataSet: TDataSet);
var wIndSituacao : String;
begin
  if QPedido.State <> dsEdit then
     raise Exception.Create('Pedido não está no modo de Alteração!');
  if DMParamSistema.CodEmpresa = 'WERNER' then //Verificar se já foi produzido o produto Junio 17/10/2019 suporte(13602)
  Begin
    wIndSituacao := DMOracle.FastSelect('IND_SITUACAO','TB_BOLETIM','COD_PEDIDO_ITEM =' + QPedidoItemCOD_PEDIDO_ITEM.Text);
    if (wIndSituacao <> '1') and (wIndSituacao <> '') then
      Raise Exception.Create('Não é possível alterar item já produzido!');
  end;
  
  If QPedidoItemsqt_atendido.Value = (QPedidoItemQT_PEDIDO.Value + QPedidoItemQT_CANCELADO.Value) Then
    raise Exception.Create('Item já atendido e/ou cancelado. Não é possível alterar.');
  wVal_Unitario_Ant := QPedidoItemVal_Unitario.Value;
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
var
wBoletim : integer;
wIndSituacao : String;
begin
  If QPedidoItemQt_Atendido.Value > 0 Then
     raise Exception.Create('Item Já Atendido Não é permitido Excluir!');
  If pExcluindo = False Then
  begin
    if QPedido.State <> dsEdit then
       raise Exception.Create('Pedido não está no modo de Alteração!');
  end;
  QPedidoItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if DMParamSistema.CodEmpresa = 'WERNER' then //Verificar se já foi produzido o produto Junio 17/10/2019 suporte(13603)
  Begin
    wIndSituacao := DMOracle.FastSelect('IND_SITUACAO','TB_BOLETIM','COD_PEDIDO_ITEM =' + QPedidoItemCOD_PEDIDO_ITEM.Text);
    if (wIndSituacao <> '1') and (wIndSituacao <> '') then
      Raise Exception.Create('Não é possível alterar item já produzido!')
    else
    Begin
      if wIndSituacao <> '' then
      begin
        wBoletim := StrToInt(DMOracle.FastSelect('COD_BOLETIM','TB_BOLETIM','COD_PEDIDO_ITEM =' + QPedidoItemCOD_PEDIDO_ITEM.Text));

        try
          DMOracle.DBCemapa.StartTransaction;
          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BOLETIM_ITEM WHERE COD_BOLETIM = ' + IntToStr(wBoletim));
          DMOracle.QExecSQL.ExecSQL;

          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BOLETIM WHERE COD_BOLETIM = ' + IntToStr(wBoletim));
          DMOracle.QExecSQL.ExecSQL;
          DmOracle.DBCemapa.Commit;
        except
          DmOracle.DBCemapa.Rollback;
        raise;
        end;
      end;
    end;
  end;
end;

procedure TDMPedido.QPedidoBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;

  if QPedidoIND_EMBARQUE.Text = 'S' then
    raise Exception.Create('Não é permitido alterar pedido que está em embarque.');
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
     wRetorno := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM','QT_PEDIDO > QT_ATENTIDA_PEDIDO(COD_PEDIDO_ITEM) + QT_CANCELADO AND COD_PEDIDO_CAB = '+QrPedidoComNotaCod_Pedido_Cab.Text);
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
    Acessa_Operacao;
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
//var wData:TDateTime;
begin
//  wData := DMOracle.DataServ;
  QPedidoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QPedidoDt_Sistema.Value := DMOracle.DataHoraServ;
  QPedidoDT_USUARIO.Value := DMOracle.DataHoraServ;
  QPedidoCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;
  If DMUsuario.CodOperacaoPadrao <> 0 Then
     QPedidoCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
  // Adicionado por Djeison - 25/03/2013
  If DMUsuario.CodVendedorPadrao <> 0 Then
    QPedidoCOD_VENDEDOR.Value := DMUsuario.CodVendedorPadrao;

  If DMParamSistema.CodEmpresa <> 'MOINHO' Then
     QPedidoPerc_Comissao.Value := wComissao_Ant;
  If DMParamSistema.CodEmpresa = 'NIR' Then
     QPedidoCod_Mensagem.Value := 12;
  QPedidoDt_Emissao.Value := wDtEmissao_Ant;
  QPedidoIND_LIBERADO.Value := 'SIM';
  If DMParamSistema.CodEmpresa = 'ARZ' Then
     QPedidoDt_Emissao.Value := DMOracle.DataServ;

  If DMParamSistema.CodEmpresa = 'WERNER' Then
   Begin
     QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
//     QPedidoPerc_Comissao.Value := 3.5; - solicitado pela Daniele para pegar comissao do cadastro de vendedores 11/11/21 cesar
   End;

  //Gian 20/09/2018 - O Diniz quer todos os pedidos a prazo
  if DMParamSistema.CodEmpresa = 'DINIZ' then
  begin
    QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
    QPedidoCOD_PRAZO_VENCIMENTO.Value := 1;
    QPedidoPerc_Comissao.Value := 1; //solicitado pelo DINIZ - Cesar
    QPedidoDt_Emissao.Value := DMOracle.DataServ;  // incluido pelo César a pedido do Diniz 05/01/2019
    If QPedidoCod_Filial.Value = 2 Then
       QPedidoCod_Operacao.Value := 46 // solicitado pelo Diniz - Cesar 06/07/2023
    Else
       QPedidoCod_Operacao.Value := 23; // solicitado pelo Diniz - Cesar 30/12/2021
  end;

//  QPedidoItem.Close;
//  QPedidoItem.Open;
end;

procedure TDMPedido.QRPedidoCalcFields(DataSet: TDataSet);
Var wPerc_Faixa,wPerc_Indice, wPercentual : Real;
begin
  If QrPedidoQt_Pedido.Value > 0 Then
   Begin
     QrPedidoValor_Total.Value := QrPedidoQt_Pedido.Value
                                    * QrPedidoVal_Unitario.Value;//*
                                    //(1 - (QrPedidoPerc_Desconto.Value/100)) * 1000000) / 1000000;// Era *100 e /100. alterado por Diego para contar mais casas decimais no desconto. 11/09/2009
     If QrPedidoPerc_Desconto1.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto1.Value / 100);
     If QrPedidoPerc_Desconto2.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value - (QrPedidoValor_total.Value * QrPedidoPerc_Desconto2.Value / 100);
     If QrPedidoPerc_Acrescimo.Text <> '' Then
        QrPedidoValor_total.Value := QrPedidoValor_total.Value + (QrPedidoValor_total.Value * QrPedidoPerc_Acrescimo.Value / 100);
   End
  Else
     QrPedidoValor_total.Value := QrPedidoVal_Unitario.Value;

  If DMParamSistema.CodEmpresa = 'ENCOPEL' then
     QRPedidoQRQuantidade.Value := QRPedidoQT_PEDIDO.Value - QRPedidoQT_ATENDIDO.Value - QRPedidoQT_CANCELADO.Value
  Else
     QRPedidoQRQuantidade.Value := QRPedidoQT_PEDIDO.Value;
  If (DMParamSistema.CodEmpresa = 'INSIDE') Then
     QrPedidoVal_Substituicao.Value := CalculaICM();

  QrPedidoperc_comissao_item_calc.Value := QrPedidoPerc_Comissao_item.Value;
  If DMParamSistema.CodEmpresa = 'ZAPOLI' then
   Begin
     QRPedidoval_substituicao.Value := QRPedidoVAL_ICMS_SUBST.Value; // * QrPedidoQt_Pedido.Value;
     wPercentual := 0;
     If QrPedidoPerc_Desconto.Value > 0 Then
     Begin
       wPerc_Faixa := StrToFloat('0'+DMOracle.BuscaNome('SELECT QT_ATE FROM TB_COMISSAO_CLASSE','COD_VENDEDOR = '+QrPedidoCod_Vendedor.Text + ' AND COD_CLASSE='+QrPedidoCod_Classe.Text));
       wPerc_Indice := StrToFloat('0'+DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_COMISSAO_CLASSE','COD_VENDEDOR = '+QrPedidoCod_Vendedor.Text + ' AND COD_CLASSE='+QrPedidoCod_Classe.Text));
       If wPerc_Faixa = 0 Then
          wPerc_Faixa := 1;
       wPercentual := QrPedidoPERC_DESCONTO.Value / wPerc_Faixa * wPerc_Indice;
     End;
     QrPedidoperc_comissao_item_calc.Value := QrPedidoPerc_Comissao_item.Value - wPercentual;
   End;
end;

procedure TDMPedido.QMostraMateriaisAfterInsert(DataSet: TDataSet);
begin
  QMostraMateriaisCod_Pedido.Value := QPedidoCod_Pedido_Cab.Value;
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

procedure TDMPedido.QPedidoItemNUM_FABRICANTEChange(Sender: TField);
begin
  If QPedidoItemNUM_FABRICANTE.Value <> '' Then
    QPedidoItemCOD_PRODUTO.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + QuotedStr(QPedidoItemNUM_FABRICANTE.Value));
end;

procedure TDMPedido.QPedidoItemCOD_PRODUTOChange(Sender: TField);
begin
  if (DMParamSistema.CodEmpresa = 'FGLASS') and
     (QPedidoItemCOD_MARCA.Value                    > 0)        and
     (QPedidoItemCOD_PRODUTO.Value                  > 0)        then
    QPedidoItemVAL_UNITARIO.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_PRODUTO_MARCA' +
        ' FROM TB_PRODUTO_MARCA', 'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_MARCA = ' +
        QPedidoItemCOD_MARCA.Text, True));

// Se operação tiver tributação informada
  if QPedidoCOD_OPERACAO.Value <> DMOperacao.QOperacaoCOD_OPERACAO.Value then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('PK', QPedidoCOD_OPERACAO.Value);
    DMOperacao.QOperacao.Open;
  end;
  if DMOperacao.QOperacaoCod_Tributacao.Value > 0 then
  begin
    QPedidoItemCOD_TRIBUTACAO.Value := DMOperacao.QOperacaoCod_Tributacao.Value
  end
end;

procedure TDMPedido.QPedidoItemCOD_MARCAChange(Sender: TField);
begin
  if (DMParamSistema.CodEmpresa = 'FGLASS') and
     (QPedidoItemCOD_MARCA.Value > 0)                           and
     (QPedidoItemCOD_PRODUTO.Value > 0)                         then
     QPedidoItemVAL_UNITARIO.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_PRODUTO_MARCA' +
        ' FROM TB_PRODUTO_MARCA', 'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text + ' AND COD_MARCA = ' +
        QPedidoItemCOD_MARCA.Text, True));
end;

Function TDMPedido.CalculaICM() : Real;
Var
    wPercICM,wPercAliqSubs,wBaseAliqSubs,wIcm,wIcm_Item,wBase,wBase_Subst,wIcmSubst : Real;
    wAuxBase : Real;
    wPrecoPauta,wTipoCalculo : String;
    wTipoCliente : string;
begin
  wPercAliqSubs := 0;
  wBaseAliqSubs := 0;
  wIcm := 0;
  wTipoCliente := DMOracle.BuscaNome('SELECT COD_TIPO_CADASTRO FROM TB_CADASTRO','COD_CADASTRO ='+QRPedidoCOD_CADASTRO.Text);
  Try
    If Trim(QRPedidoCod_Tributacao.Text) <> '' then
    Begin
      If DMTributacao.QTributacaoCod_Tributacao.Value <> QRPedidoCod_Tributacao.Value Then
       Begin
         DMTributacao.QTributacao.Close;
         DMTributacao.QTributacao.SetVariable('Pk',QRPedidoCod_Tributacao.Value);
         DMTributacao.QTributacao.Open;
       End;
      wPercICM := DMTributacao.QTributacaoPERC_ALIQUOTA.Value;
      wAuxBase:= DMTributacao.QTributacaoPERC_TRIBUTADO.Value;

      //Para o caso da tributação ser isenta e ter que calcular ST
      if (wAuxBase = 0) and
        ((Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '30')or
        (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '60')) then
        wAuxBase := 100;

      If QRPedidoCod_Operacao.Value <> DMOperacao.QOperacaoCOD_OPERACAO.Value Then
       Begin
         DMOperacao.QOperacao.Close;
         DMOperacao.QOperacao.SetVariable('Pk',QRPedidoCod_Operacao.Value);
         DMOperacao.QOperacao.Open;
       End;

      If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
         (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) And
         (DMOperacao.QOperacaoInd_Emite.Value = 'F')  Then
         If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '70') or   // reducao de base de calculo e cobranca de icms por substituicao tributaria
            (DMTributacao.QTributacaoDESC_CSOSN.Value ='201') or
            (DMTributacao.QTributacaoDESC_CSOSN.Value ='202') or
            (DMTributacao.QTributacaoDESC_CSOSN.Value ='203') or
            (DMTributacao.QTributacaoDESC_CSOSN.Value ='900') then
         Begin
           If DMEstado.QEstadoCod_Estado.Value <> QRPedidoCod_Estado.Value Then
           Begin
             DMEstado.QEstado.Close;
             DMEstado.QEstado.SetVariable('COD_ESTADO',QRPedidoCod_Estado.Value);
             DMEstado.QEstado.Open;
           End;
           wPercAliqSubs := DMEstado.QEstadoPERC_ALIQ_SUBST.Value;
           wBaseAliqSubs := DMEstado.QEstadoPERC_BASE_SUBST.Value;
           DmTributacao.QProdutoSubstTribCons.Close;  // esta trabalhando com esta tabela para o caso de produtos com substituicao diferente dentro do mesmo estado  - Cesar - 04/02/2010
           DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Produto',QRPedidoCod_Produto.Value);
           DmTributacao.QProdutoSubstTribCons.SetVariable('Cod_Estado',QRPedidoCod_Estado.Value);
           DmTributacao.QProdutoSubstTribCons.Open;
           If Not(DmTributacao.QProdutoSubstTribCons.Eof) Then
            Begin
              wPercAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Aliquota.Value;
              wBaseAliqSubs := DmTributacao.QProdutoSubstTribConsPerc_Tributado.Value;
            End;
           DmTributacao.QProdutoSubstTribCons.Close;
         End;
      // Rotina para verificar se tem preco pauta para calculo de icms
     wBase := QRPedidoValor_Total.Value * wAuxBase / 100;
     wIcm_Item := wBase * wPercICM / 100;

     If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
        (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) And
        (DMOperacao.QOperacaoInd_Emite.Value = 'F') Then
       If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '70') or // reducao de base de calculo e cobranca de icms por substituicao tributaria
          (DMTributacao.QTributacaoDESC_CSOSN.Value ='201') or
          (DMTributacao.QTributacaoDESC_CSOSN.Value ='202') or
          (DMTributacao.QTributacaoDESC_CSOSN.Value ='203') or
          (DMTributacao.QTributacaoDESC_CSOSN.Value ='900') then

        Begin
         wTipoCalculo := DMOracle.BuscaNome('SELECT IND_SUBSTITUICAO FROM TB_FILIAL','COD_FILIAL = '+QRPedidoCod_Filial.Text,True);
         If (wPrecoPauta <> '') And (wTipoCalculo = 'P') Then  // calculo por pauta cfe tabela de filial
          Begin
            wPrecoPauta := DMOracle.BuscaNome('SELECT VAL_PAUTA FROM TB_PAUTA_ICMS','COD_PRODUTO = '+QRPedidoCod_Produto.Text + ' And COD_ESTADO='+Chr(39)+QRPedidoCod_Estado.Value+Chr(39));
            wBase_Subst := StrToFloat(wPrecoPauta) * QRPedidoQt_Pedido.Value;
          End
         Else
          If (DMParamSistema.CodEmpresa = 'MEDIPECAS') Or (DMParamSistema.CodEmpresa = 'DINIZ') Or (DMParamSistema.CodEmpresa = 'INSIDE') Then
           Begin
             wBase_Subst := (QRPedidoValor_Total.Value) * wBaseAliqSubs / 100;
             If ((DMParamSistema.CodEmpresa = 'DINIZ') or (DMParamSistema.CodEmpresa = 'MARTICAR') and
                 (DMEstado.QEstadoCod_Estado.Value <> 'PR')) Then  // calcula icms do parana para descontar da substituicao mas nao deve sair na nota fiscal o ICMS do Parana - César
                wIcm := QRPedidoValor_Total.Value * 0.12; // 0.12 é a aliquota do icms do paraná
           End
           else
              wBase_Subst := wBase * wBaseAliqSubs / 100;

         wIcmSubst := wBase_Subst * wPercAliqSubs / 100;

         if ((DMParamSistema.CodEmpresa = 'INSIDE') or  (DMParamSistema.QParamSistemaCod_Empresa.Text = 'DISPART')) and
             (wTipoCliente = '7') Then
          Begin
            wIcmSubst := 0;
            wBase_Subst := 0;
          end
         else
          Begin
            If wIcmSubst <> 0 Then
             Begin
               wIcmSubst := wIcmSubst - wIcm_Item - wIcm;
             End;
          end;
        End;
    End;
    Result := wIcmSubst;
  Except
    raise; //aqui
    //Raise Exception.Create ('Erro no Calculo de Icms');
  End;
End;



procedure TDMPedido.QPedidoCompostoConsCalcFields(DataSet: TDataSet);
begin
  QPedidoCompostoConsdesc_situacao.Value :=
    estadoPedidoSituacao(QPedidoCompostoConsIND_SITUACAO.Value);
end;

function TDMPedido.estadoPedidoSituacao(situacao: string): string;
begin
  if situacao = '0' then Result := 'EM ABERTO'
  else if situacao = '1' then Result := 'ACEITO VENDEDOR'
  else if situacao = '2' then Result := 'ACEITO EMPRESA'
  else if situacao = '3' then Result := 'ACEITO'
  else if situacao = '4' then Result := 'CONFIRMADO'
  else if situacao = '5' then Result := 'EM PRODUÇÃO'
  else if situacao = '6' then Result := 'NOTA GERADA'
  else if situacao = '7' then Result := 'CANCELADO'
  else Result := '';
end;

procedure TDMPedido.CancelaPedido;
begin
  if MessageDlg('Deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    if QPedidoInd_Situacao.Value = '2' then
      raise Exception.Create('Este Pedido Já Foi Cancelado');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        QPedido_Cancelado.Open;
        QPedido.Edit;
        while not QPedidoItem.Eof do
        begin
          QPedidoItem.Edit;
          QPedidoItemQt_Cancelado.Value := QPedidoItemQt_Pedido.Value - QPedidoItemQt_Atendido.Value;
          QPedidoItem.Post;
          QPedido_Cancelado.Insert;
          QPedido_CanceladoCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
          QPedido_CanceladoDt_Cancelamento.Value := DMOracle.DataServ;
          QPedido_CanceladoQt_Cancelado.Value := QPedidoItemQt_Cancelado.Value;
          QPedido_CanceladoCod_Usuario.Value := DmUsuario.CodUsuarioCorrente;
          QPedido_CanceladoCod_Motivo.Value := 1;
          QPedido_Cancelado.Post;
          QPedidoItem.Next;
        end;
        QPedidoInd_Situacao.Value := '2';
        //MUDA STEP PARA 7 PARA CANCELAR O PEDIDO NA WEB
        QPedidoSTEP_PEDIDO_WEB.Value := 7;
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Cancelar');
  End;
end;

procedure TDMPedido.CancelaPedidoMaxima;
var wComando: string;
begin
  if not QPedido.Eof then
   Begin
    if MessageDlg('Deseja cancelar o pedido no Portal Máxima?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        With DMOracle do
      Begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_PEDIDO_ITEM SET IND_SINC_MAX_ROTEIRIZADOR = ' + QuotedStr('A') +
          ', IND_POSICAO_MAX = ' + QuotedStr('C');
        wComando := wComando + ' WHERE COD_PEDIDO_CAB = ' + QPedidoCOD_PEDIDO_CAB.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;

        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_PEDIDO_CAB SET IND_SINC_MAX_ROTEIRIZADOR = ' + QuotedStr('A') +
          ', IND_POSICAO_MAX = ' + QuotedStr('C');
        wComando := wComando + ' WHERE COD_PEDIDO_CAB = ' + QPedidoCOD_PEDIDO_CAB.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
        MessageDlg('Pedido cancelado no portal Máxima com sucesso.'
          , mtInformation, [mbOk], 0);
        DMOracle.DBCemapa.Commit;
      End;
      except
        DmOracle.DBCemapa.Rollback;
        raise;
      end;
    End;
  end
    else
      raise exception.Create('Selecionar Pedido Para Cancelar');
end;

Procedure TDMPedido.CalculaICMPedido;
  function CalculaICMSParaDescontar: Boolean;
  var
    wRegimeTributario: string;
  begin
    result := False;
    if(Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value, 2, 2) = '30') or // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='201') or //
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='202') or
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='203') or
      (DMTributacao.QTributacaoDESC_CSOSN.Value ='900') then
      result := True;
  end;
Var wPercICM,wPercAliqSubs,wBaseAliqSubs, wValIcmItem, wValBaseIcmItem, wValBaseSubstItem, wValIcmDeduzido: Real;
    wPercDesc,wAuxBase, wTotal, wValUnitario, wQtPedido : Real;
    wPrecoPauta,wTipoCalculo : String;
    wClasse, wTribEstado : Integer;
    wTipoCliente, wEstado,wIPI : string;
begin
  wPercAliqSubs := 0;
  wBaseAliqSubs := 0;
  wPercDesc := 0;
  wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO ','COD_CADASTRO='+QPedidoCOD_CADASTRO.Text);
  if DMPedido.QPedidoItemPERC_DESCONTO.Value > 0 then
    wValUnitario := QPedidoItemVAL_UNITARIO.Value-((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_DESCONTO.Value)/100)
  else
    wValUnitario := QPedidoItemVAL_UNITARIO.Value;
  wQtPedido := QPedidoItemQT_PEDIDO.Value;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',DMPedido.QPedidoCOD_FILIAL.Text);
  DMFilial.QFilial.Open;
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
      if DMParamSistema.CodEmpresa = 'ZAPOLI' then
      Begin
        wTribEstado := strtoint(DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO='+chr(39)+wEstado+chr(39)));
        wPercICM := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO='+IntToStr(wTribEstado)));
        wAuxBase := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_TRIBUTACAO','COD_TRIBUTACAO='+IntToStr(wTribEstado)));
      end;

      DMOperacao.QOperacao.Close;
      DMOperacao.QOperacao.SetVariable('PK',QPedidoCOD_OPERACAO.Text);
      DMOperacao.QOperacao.Open;
      If ((DMOperacao.QOperacaoInd_Vendas.Value = 'V') Or
         (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S')) Then
         If (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '10') Or   // Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '30') or   // isenta ou nao Tributada e com cobranca de icms por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '60') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Text,2,2) = '70') or   // icms cobrado anteriormente por substituicao tributaria
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '201')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '202')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '203')        or
            (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '900') Then
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
          (Copy(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '70') or  // reducao de base de calculo e cobranca de icms por substituicao tributaria
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '201')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '202')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '203')        or
          (Copy(DMTributacao.QTributacaoDESC_CSOSN.Text,1,3) = '900') Then
        Begin
          wTipoCalculo := DMOracle.BuscaNome('SELECT IND_SUBSTITUICAO FROM TB_FILIAL','COD_FILIAL = '+QPedidoCod_Filial.Text,True);
          wPrecoPauta := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+QPedidoItemCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39));
          If (wPrecoPauta <> '') And (wTipoCalculo = 'P') Then  // calculo por pauta cfe tabela de filial
          Begin 
            //wValBaseSubstItem := StrToFloat(wPrecoPauta) * QPedidoItemQt_Pedido.Value;
            wBaseAliqSubs := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TRIBUTADO FROM TB_PRODUTO_SUBST_TRIB','COD_PRODUTO = '+QPedidoItemCod_Produto.Text + ' And COD_ESTADO='+chr(39)+wEstado+chr(39)));
            //wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100)
            wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);
          End
        Else
          //wValBaseSubstItem := ((wTotal+(StrToFLoat(wIPI)*wTotal/100)) * wBaseAliqSubs / 100 );
          wValBaseSubstItem := (wTotal * wBaseAliqSubs / 100);

        QPedidoItemVal_Icms_Subst.Value := wValBaseSubstItem * wPercAliqSubs / 100;

        wValIcmDeduzido := 0;
        if CalculaICMSParaDescontar then
          if(DMParamSistema.CodEmpresa = 'ZAPOLI') then //a pedido dO JUNIOR ,
            wValIcmDeduzido := ((wValUnitario * wQtPedido) * 0.12);

        If QPedidoItemVal_Icms_Subst.Value <> 0 Then
        begin
          QPedidoItemVal_Icms_Subst.Value := QPedidoItemVal_Icms_Subst.Value - wValIcmItem - wValIcmDeduzido;
          If DMOracle.BuscaNome('SELECT IND_REGIME_TRIBUTARIO FROM TB_CADASTRO','COD_CADASTRO = '+QPedidoCod_Cadastro.Text,True) <> '3' Then
                                                                                  //implementado por Adriel em
            QPedidoItemVal_Icms_Subst.Value := QPedidoItemVal_Icms_Subst.Value -  //09/05/2014 para a Provina
                                              (QPedidoItemVal_Icms_Subst.Value *
                                              DMEstado.QEstadoPERC_REDUCAO_ICMS_SUBST.Value / 100);
        end;
      End;
    End;
  Except
    raise; //aqui
    //Raise Exception.Create ('Erro no Calculo de Icms');
  End;
End;

Procedure TDMPedido.CalculaIPIPedido;
var
wQtPedido : Real;
begin
  if (DMFilial.QFilial.RecordCount = 0)
    or (DMFilial.QFilialCOD_FILIAL.Value <> QPedidoCOD_FILIAL.Value) then
  begin
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', QPedidoCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
  end;
  if DMFilial.QFilialIND_IPI.Value <> 'S' then
  begin
    QPedidoItemVAL_IPI.Value := 0;
    exit;
  end;
  wQtPedido := QPedidoItemQT_PEDIDO.Value;
  DMProduto.QProduto.Close;
  DMProduto.QProduto.SetVariable('PK',QPedidoItemCOD_PRODUTO.Value);
  DMProduto.QProduto.Open;
  if DMPedido.QPedidoItemPERC_DESCONTO.Value > 0 then
    QPedidoItemVAL_IPI.Value := ((((QPedidoItemVAL_UNITARIO.Value-((QPedidoItemVAL_UNITARIO.Value*QPedidoItemPERC_DESCONTO.Value)/100)) * wQtPedido) * DMProduto.QProdutoPERC_IPI.Value)/100)
  else
    QPedidoItemVAL_IPI.Value := (((QPedidoItemVAL_UNITARIO.Value * wQtPedido) * DMProduto.QProdutoPERC_IPI.Value)/100);

end;

procedure TDMPedido.QPedidoItemBeforePost(DataSet: TDataSet);
var
  wConsumidorFinal, wTipoProduto: String;
  wParcelas : integer;
  wVal_Varejo, wQtEstoque : Real;
  wCst, wCsosn, wNumGeneroNCM: string;
  wSt: boolean;
  wPercComissao : Double;
begin
  if ((dmpedido.QPedidoItemVAL_UNITARIO.Value = 0) or (dmpedido.QPedidoItemVAL_UNITARIO.Value < 0) or (dmpedido.QPedidoItemVAL_UNITARIO.Text = ''))  then
    raise Exception.Create('Informe um valor unitário válido para esse item.');      //Nao deixar o valor unitário em branco e nem zerado. Vanessa 22/11/2017
  //CAMPO USADO PARA O SINCRONISMO DE DADOS COM O SISTEMA DE PEDIDOS WEB
  QPedidoItemLOCAL_ULTIMA_ALTERACAO.Value := 'CEMAPA';
  //property utilizado para verificar se o pedido está em alteração. Junior - 23/06/2015.
  if QPedidoItem.State = dsEdit then
    pAlterando := True
  else
    pAlterando := False;
  QPedidoItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;

  if QPedidoItemQT_PEDIDO.Value < (QPedidoItemsqt_atendido.Value + QPedidoItemQT_CANCELADO.Value) then
    raise Exception.Create('Item já atendido e/ou cancelado. Não é possível alterar.');
  If  ((DMParamSistema.CodEmpresa = 'NIR') or (DMParamSistema.CodEmpresa = 'DEION')) then
  begin
    CalculaIcmPedido;
    CalculaIPIPedido;
  end;

  pCodListaPreco := QPedidoItemCOD_TABELA_PRECO_CAB.Value;

  // busca o cfop para itens que possuem ST e que não tenham sido informados manualmente
  if QPedidoItemCOD_CFOP.IsNull then
  begin
    wNumGeneroNCM := DMOracle.FastSelect('NUM_GENERO_NCM','TB_PRODUTO','COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text);
    wCst := '';
    wCsosn := '';
    if QPedidoItemCOD_TRIBUTACAO.Value > 0 then
    begin
      wCst := DMOracle.FastSelect('DESC_SITUACAO_TRIB', 'TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + QPedidoItemCOD_TRIBUTACAO.Text);
      wCsosn := DMOracle.FastSelect('DESC_CSOSN', 'TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + QPedidoItemCOD_TRIBUTACAO.Text);
    end;
    wSt := ((wCst = '010') or (wCst = '030') or (wCst = '060') or (wCst = '070') or
      (wCsosn = '201') or (wCsosn = '202') or (wCsosn = '203') or (wCsosn = '500'));
    if (wSt) and (QpedidoIND_CONSUMIDOR_FINAL.Value <> 'S') then
    begin
      if DMOracle.FastSelect('COD_ESTADO', 'TB_CADASTRO', 'COD_CADASTRO = '
        + QPedidoCOD_CADASTRO.Text) = DMOracle.FastSelect('COD_ESTADO',
        'TB_FILIAL', 'COD_FILIAL = ' + QPedidoCOD_FILIAL.Text) then
      begin
        QPedidoItemCOD_CFOP.Text :=
         DMOracle.FastSelect('COD_CFOP_ST', 'TB_OPERACAO', 'COD_OPERACAO = '
          + QPedidoCOD_OPERACAO.Text);
      end
      else
      begin
        QPedidoItemCOD_CFOP.Text :=
         DMOracle.FastSelect('COD_CFOP_INT_ST', 'TB_OPERACAO', 'COD_OPERACAO = '
          + QPedidoCOD_OPERACAO.Text);
      end;
    end;
    if (DMParamSistema.CodEmpresa = 'DINIZ') and
               ( (wNumGeneroNCM = '27101259') or (wNumGeneroNCM = '22071090') or
                 (wNumGeneroNCM = '27101921') or (wNumGeneroNCM = '27101932') ) then //CFOP De lubrificantes precisa sair na CFOP 5656/6656
    begin
    if DMOracle.FastSelect('COD_ESTADO', 'TB_CADASTRO', 'COD_CADASTRO = '+ QPedidoCOD_CADASTRO.Text) = DMOracle.FastSelect('COD_ESTADO',
               'TB_FILIAL', 'COD_FILIAL = ' + QPedidoCOD_FILIAL.Text) then //CFOP De lubrificantes precisa sair na CFOP 5656/6656
      if QpedidoIND_CONSUMIDOR_FINAL.Value = 'S' then
        QPedidoItemCOD_CFOP.Value := 5656
      else
        QPedidoItemCOD_CFOP.Value := 5655
    else
      if QpedidoIND_CONSUMIDOR_FINAL.Value = 'S' then
        QPedidoItemCOD_CFOP.Value := 6656
      else
        QPedidoItemCOD_CFOP.Value := 6655
    end;
  end;
  if QPedidoItemDESC_OBS_ITEM.IsNull then     //Feito igual o vendas para puxar obs do item. Junior 21/03/2019
     QPedidoItemDESC_OBS_ITEM.Value := GeraInfAdicionalItem(QPedidoItem);
  // Utilizado na transformação do pedido em nota quando o sistema gerencia
  // os lotes automaticamente
  if BloqueiaItemRepetido then
  begin
    MessageDlg('Produto já utilizado neste pedido.' + chr(13)+chr(10)
      + 'Sistema configurado para gerenciar lotes automaticamente na transformação de pedido em nota'
      , mtError, [mbOk], 0);
    abort;
  end;
  {  **** Foi Colocado na trigger este controle de estoque para o Diniz - trg_estoque_pedidos_diniz - César 10/06/2026 ****
  if (DMParamSistema.CodEmpresa = 'DINIZ')  Then // verifica se o produto tem estoque - nao deixa vender sem estoque ou negativo - César 05/06 (solicitado pelo Diniz
   Begin
    wQtEstoque := StrToFloat(DMOracle.BuscaNome('SELECT Sum(QT_QUANTIDADE) FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value) + ' AND COD_LOTE_TIPO = ' + FloatToStr(QPedidoItemCod_Lote_Tipo.Value)));
    If QPedidoItemQt_Pedido.Value > wQtEstoque Then
     Begin
       MessageDlg('Quantidade vendida maior que quantidade em estoque.', mtError, [mbOk], 0);
       abort;
     End;
   End;
  }
  if DMParamSistema.CodEmpresa = 'WERNER' then
    LancaOrdemProducao;
end;

procedure TDMPedido.QPedidoAfterEdit(DataSet: TDataSet);
begin
  QPedidoDT_USUARIO.Value := DMOracle.DataHoraServ;
end;

procedure TDMPedido.UtilizaListaPrecoTodosItens;
var wRecNo: integer;
  wEventoAfter: TDataSetNotifyEvent;
  wEventoBefore: TDataSetNotifyEvent;
begin
  if (pUtilizaListaPrecoTodosItens)
    and (pCodListaPreco > 0) then
  begin
    wRecNo := QPedidoItem.RecNo;
    QPedidoItem.First;

    //Deve retirar o evento que chama esta procedure para não criar um laço infinito ao fazer post
    wEventoAfter := QPedidoItem.AfterPost;
    wEventoBefore := QPedidoItem.BeforePost;
    QPedidoItem.AfterPost := nil;
    QPedidoItem.BeforePost := nil;

    try
      while not QPedidoItem.Eof do
      begin
        QPedidoItem.Edit;
        if pCodListaPreco > 0 then
          QPedidoItemCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;

        QPedidoItemCOD_PRODUTOValidate(nil);
        QPedidoItem.Post;
        QPedidoItem.Next;
      end;
    finally
      // Devolve o evento para a query
      QPedidoItem.AfterPost := wEventoAfter;
      QPedidoItem.BeforePost := wEventoBefore;
      QPedidoItem.RecNo := wRecNo;
    end;

    //pUtilizaListaPrecoTodosItens := false;
  end;
end;

procedure TDMPedido.PrecoTabela;
begin
  // Verifica se o produto está cadastrado em tabela de preço
  // Se estiver, sobrescreve o valor do produto com o valor que está na tabela
  if QPedidoItemCOD_TABELA_PRECO_CAB.Value > 0 then
  begin
    with DMTabelaPreco do
    begin
      QTabelaPrecoProduto.Close;
      QTabelaPrecoProduto.SetVariable('COD_PRODUTO', QPedidoItemCOD_PRODUTO.Value);
      QTabelaPrecoProduto.SetVariable('COD_TABELA_PRECO', QPedidoItemCOD_TABELA_PRECO_CAB.Value);
      QTabelaPrecoProduto.Open;

       if QTabelaPrecoProduto.RecordCount > 0 then
       begin
         if (QTabelaPrecoProdutoIND_SITUACAO.Text <> 'ATIVO') then//Adicionado validação para a situação da tabela de preço. Solicitado por Nestor - Deion / Alex 11/11/2021
           raise Exception.Create('A tabela de preço ' + QPedidoItemCOD_TABELA_PRECO_CAB.AsString + ' selecionada não está mais ativa, entre em contato com a gerência!');
         QPedidoItemVAL_UNITARIO.Value := QTabelaPrecoProdutoVAL_PRECO.Value;
         if QTabelaPrecoProdutoQT_QUANTIDADE.AsString <> '' then //Junior - Utilizado pela Injepar 01/07/2022
           QPedidoItemQT_PEDIDO.Value := QTabelaPrecoProdutoQT_QUANTIDADE.Value;
         if (DMParamSistema.CodEmpresa = 'DEION') and (not DMUsuario.Privilegiado) then //JUNIOR DEION SOLICITOU BLOQUEIO DE VALOR UNITARIO QUANDO O PRODUTO ESTIVER NA LISTA DE PREÇO. Junior 10/08/2021
           QPedidoItemVAL_UNITARIO.ReadOnly := True
       end
       else
       begin
         QPedidoItemVAL_UNITARIO.ReadOnly := False;
         if (DMParamSistema.CodEmpresa = 'DEION') and (not DMUsuario.Privilegiado) then
           raise Exception.Create('Produto não se encontra na Tabela de Preço');
       end;
    end;
  end
  else
    begin
      if (DMParamSistema.CodEmpresa = 'DEION') and (not DMUsuario.Privilegiado) then
          raise Exception.Create('Não permitido informar itens sem estar na Tabela de Preço');
    end;
end;

function TDMPedido.BloqueiaItemRepetido: boolean;
var bloqueado: boolean;
  wCont: integer;
  wProduto: double;
begin
  // Só deve bloquear se o sistema gerenciar os lotes automaticamente
  // na transformação do pedido em nota
  if DMParamSistema.QParamSistemaIND_GERENCIA_LOTE_ESTOQUE.Value = 'NAO' then
    result := false
  else
  begin
    if QPedidoItem.State = DsEdit then
      result := false
    else
    begin
      QPedidoItemCons.Close;
      QPedidoItemCons.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
      QPedidoItemCons.Open;
      bloqueado := false;
      wCont := 0;
      wProduto := QPedidoItemCOD_PRODUTO.Value;
      while not QPedidoItemCons.Eof do
      begin
        if QPedidoItemConsCOD_PRODUTO.Value = wProduto then
          Inc(wCont);
        QPedidoItemCons.Next;
      end;
      bloqueado := (wCont > 0);
      result := bloqueado;
    end;
  end;
end;

procedure TDMPedido.QSomaPedidoCalcFields(DataSet: TDataSet);
begin
  QSomaPedidosval_total_pedido.Value := (QSomaPedidoSTOTAL_PEDIDO.Value +
    QPedidoVAL_DESPESAS.Value) - QPedidoVAL_DESCONTO.Value -
    Bib.ift(DMParamSistema.CodEmpresa = 'DEION', QSomaPedidoSTOTAL_ST.Value,0);
end;

procedure TDMPedido.QPedidoItemCOD_TABELA_PRECO_CABChange(Sender: TField);
begin
  if QPedidoItemCOD_TABELA_PRECO_CAB.Value = 0 then
    exit;
    
  // Respeita o bloqueio da tabela de preços
  if DMOracle.FastSelect('IND_BLOQUEIA_DESCONTO', 'TB_TABELA_PRECO_CAB'
    , 'COD_TABELA_PRECO_CAB = ' + QPedidoItemCOD_TABELA_PRECO_CAB.Text) = 'SIM' then
  begin
    QPedidoItemVAL_DESCONTO.Value := 0;
    QPedidoItemPERC_DESCONTO.Value := 0;
    QPedidoItemPERC_DESCONTO1.Value := 0;
    QPedidoItemPERC_DESCONTO2.Value := 0;
    QPedidoItemVAL_DESCONTO.ReadOnly := true;
    QPedidoItemPERC_DESCONTO.ReadOnly := true;
    QPedidoItemPERC_DESCONTO1.ReadOnly := true;
    QPedidoItemPERC_DESCONTO2.ReadOnly := true;
  end
  else
  begin
    QPedidoItemVAL_DESCONTO.ReadOnly := false;
    QPedidoItemPERC_DESCONTO.ReadOnly := false;
    QPedidoItemPERC_DESCONTO1.ReadOnly := false;
    QPedidoItemPERC_DESCONTO2.ReadOnly := false;
  end;
  
end;

procedure TDMPedido.QPedidoItemCOD_LOTE_TIPOChange(Sender: TField);
var valor: string;
begin
  if DMParamSistema.CodEmpresa = 'INSIDE' then
  begin
    if (QPedidoItemCOD_PRODUTO.Value > 0) and (QPedidoItemCOD_LOTE_TIPO.Value > 0) then
    begin
      valor := '';
      valor := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRECO_LOTE',
        'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text
          + ' AND COD_LOTE_TIPO = ' + QPedidoItemCOD_LOTE_TIPO.Text);
      if valor <> '' then
        QPedidoItemVAL_UNITARIO.Text := valor;
    end;
  end;
end;

procedure TDMPedido.LancaOrdemProducao;
var
wFormula, wBoletim : integer;
wCustoTotal : real;
begin
  if DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO =' + QPedidoItemCOD_PRODUTO.Text) = 'COMERCIAL' then
  Begin
    try
      DMOracle.DBCemapa.StartTransaction;

      If DMOracle.FastSelect('COD_FORMULA','TB_FORMULA','COD_PRODUTO =' + QPedidoItemCOD_PRODUTO.Text) <> '' then
        wformula := StrToInt(DMOracle.FastSelect('COD_FORMULA','TB_FORMULA','COD_PRODUTO =' + QPedidoItemCOD_PRODUTO.Text))
      else
        Raise Exception.Create('Produto sem fórmula cadastrada!');

      if QPedidoItem.State = dsInsert then
      Begin
        QFormulaItem.Close;
        QFormulaItem.SetVariable('COD_FORMULA',wFormula);
        QFormulaItem.Open;
        QFormulaItem.First;
        while not QFormulaItem.Eof do
        Begin
          if DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO' then //Estava pegando sempre o ultimo custo. Junior-15/10/2019 suporte(13583)
            wCustoTotal := wCustoTotal + (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_ULTIMO_CUSTO.Value
          else
            wCustoTotal := wCustoTotal + (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_CUSTO_MEDIO.Value;
          QFormulaItem.Next;
        end;
        QLancaOrdemProducao.Close;
        QLancaOrdemProducao.Open;
        QLancaOrdemProducao.Insert;
        wBoletim := StrToInt(DMOracle.BuscaNome('SELECT SQBOLETIM.NEXTVAL FROM DUAL', '1=1'));
        QLancaOrdemProducaoCOD_BOLETIM.Value := wBoletim;
        QLancaOrdemProducaoCOD_FORMULA.Value := wFormula;
        QLancaOrdemProducaoCOD_FILIAL.Value := QPedidoCOD_FILIAL.Value;
        QLancaOrdemProducaoDT_BOLETIM.Value := DMOracle.DataServ;
        QLancaOrdemProducaoQT_FABRICADO.Value := QPedidoItemQT_PEDIDO.Value;
        QLancaOrdemProducaoCOD_DEPARTAMENTO.Value := 1;
        QLancaOrdemProducaoCOD_LOTE_TIPO.Value := 1;
        QLancaOrdemProducaoVAL_CUSTO.Value := wCustoTotal; //QPedidoItemQT_PEDIDO.Value * wCustoTotal; //Junior 15/10/2019 suporte(13583)
        QLancaOrdemProducaoCOD_TURNO_CONTROLE.Value := 1;
        QLancaOrdemProducaoIND_TIPO_BOLETIM.Value := 'P';
        QLancaOrdemProducaoCOD_PEDIDO_ITEM.Value := QPedidoItemCOD_PEDIDO_ITEM.Value;
        QLancaOrdemProducaoDESC_OBS.Value := 'Cód.Pedido - ' + QPedidoCOD_PEDIDO_CAB.Text + ' - Cliente - ' +
                                              DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO =' + QPedidoCOD_CADASTRO.Text);
        QLancaOrdemProducao.Post;

        QFormulaItem.First;

        while not QFormulaItem.Eof do
        Begin
          QLancaOP_Item.Close;
          QLancaOP_Item.Open;
          QLancaOP_Item.Insert;
          QLancaOP_ItemCOD_BOLETIM.Value := wBoletim;
          QLancaOP_ItemCOD_BOLETIM_ITEM.Value :=StrToInt(DMOracle.BuscaNome('SELECT SQBOLETIM_ITEM.NEXTVAL FROM DUAL', '1=1'));
          QLancaOP_ItemCOD_PRODUTO.Value := QFormulaItemCOD_PRODUTO.Value;
          QLancaOP_ItemCOD_LOTE_TIPO.Value := QFormulaItemCOD_LOTE_TIPO.Value;
          //QLancaOP_ItemCOD_PEDIDO_ITEM.Value := QPedidoItemCOD_PEDIDO_ITEM.Value;
          QLancaOP_ItemQT_USADA.Value := QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value;
          if DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO' then //Estava pegando sempre o ultimo custo. Junior-15/10/2019 suporte(13583)
            QLancaOP_ItemVAL_CUSTO.Value := (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_ULTIMO_CUSTO.Value
          else
            QLancaOP_ItemVAL_CUSTO.Value := (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_CUSTO_MEDIO.Value;
          QLancaOP_Item.Post;
          QFormulaItem.Next;
        end;
      end;

      if QPedidoItem.State = dsEdit then
      Begin
        wBoletim := StrToInt(DMOracle.FastSelect('COD_BOLETIM','TB_BOLETIM','COD_PEDIDO_ITEM =' + QPedidoItemCOD_PEDIDO_ITEM.Text));
        QFormulaItem.Close;
        QFormulaItem.SetVariable('COD_FORMULA',wFormula);
        QFormulaItem.Open;
        QFormulaItem.First;
        while not QFormulaItem.Eof do
        Begin
          if DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO' then //Estava pegando sempre o ultimo custo. Junior-15/10/2019 suporte(13583)
            wCustoTotal := wCustoTotal + (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_ULTIMO_CUSTO.Value
          else
            wCustoTotal := wCustoTotal + (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_CUSTO_MEDIO.Value;
          QFormulaItem.Next;
        end;
        QLancaOrdemProducao.Close;
        QLancaOrdemProducao.SetVariable('PK',wBoletim);
        QLancaOrdemProducao.Open;
        QLancaOrdemProducao.Edit;
        QLancaOrdemProducaoCOD_FORMULA.Value := wFormula;
        QLancaOrdemProducaoCOD_FILIAL.Value := QPedidoCOD_FILIAL.Value;
        QLancaOrdemProducaoDT_BOLETIM.Value := DMOracle.DataServ;
        QLancaOrdemProducaoQT_FABRICADO.Value := QPedidoItemQT_PEDIDO.Value;
        QLancaOrdemProducaoCOD_DEPARTAMENTO.Value := 1;
        QLancaOrdemProducaoCOD_LOTE_TIPO.Value := 1;
        QLancaOrdemProducaoVAL_CUSTO.Value := wCustoTotal; //QPedidoItemQT_PEDIDO.Value * wCustoTotal; //Junior 15/10/2019 suporte(13583)
        QLancaOrdemProducaoCOD_TURNO_CONTROLE.Value := 1;
        QLancaOrdemProducaoIND_TIPO_BOLETIM.Value := 'P';
        //QLancaOrdemProducaoCOD_PEDIDO_ITEM.Value := QPedidoItemCOD_PEDIDO_ITEM.Value;
        QLancaOrdemProducaoDESC_OBS.Value := 'Cód.Pedido - ' + QPedidoCOD_PEDIDO_CAB.Text + ' - Cliente - ' +
                                              DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO =' + QPedidoCOD_CADASTRO.Text);
        QLancaOrdemProducao.Post;

        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_BOLETIM_ITEM WHERE COD_BOLETIM = ' + IntToStr(wBoletim));
        DMOracle.QExecSQL.ExecSQL;

        QFormulaItem.First;

        while not QFormulaItem.Eof do
        Begin
          QLancaOP_Item.Close;
          QLancaOP_Item.Open;
          QLancaOP_Item.Insert;
          QLancaOP_ItemCOD_BOLETIM.Value := wBoletim;
          QLancaOP_ItemCOD_BOLETIM_ITEM.Value :=StrToInt(DMOracle.BuscaNome('SELECT SQBOLETIM_ITEM.NEXTVAL FROM DUAL', '1=1'));
          QLancaOP_ItemCOD_PRODUTO.Value := QFormulaItemCOD_PRODUTO.Value;
          QLancaOP_ItemCOD_LOTE_TIPO.Value := QFormulaItemCOD_LOTE_TIPO.Value;
          QLancaOP_ItemQT_USADA.Value := QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value;
          if DMParamSistema.QParamSistemaIND_CUSTO.Text = 'ULTIMO' then  //Estava pegando sempre o ultimo custo. Junior-15/10/2019 suporte(13583)
            QLancaOP_ItemVAL_CUSTO.Value := (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_ULTIMO_CUSTO.Value
          else
            QLancaOP_ItemVAL_CUSTO.Value := (QPedidoItemQT_PEDIDO.Value * QFormulaItemQT_ITEM.Value) * QFormulaItemVL_CUSTO_MEDIO.Value;
          QLancaOP_Item.Post;
          QFormulaItem.Next;
        end;
      end;
      DmOracle.DBCemapa.Commit;
    except
      DmOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

function TDMPedido.GeraInfAdicionalItem(DataSetItem: TOracleDataset1): string;
(*
 * Esse procedimento gera informações adicionais para o item. Estas informações são
 * geradas de acordo com os dados do item em questão. 
 *)
  procedure Insere(var Onde: string; OQue: string; Separador: string = '.');
  begin
    Onde := Onde + IfThen((Onde <> '') and (OQue <> ''), Separador + ' ') + OQue;
  end;
var
  wInfAd, wUN, wEmb: string;
  Prod: string;
  Buscador: TBuscador;
  wAgricola: boolean;
begin
  wUN := '';
  wEmb := '';
  wInfAd := '';
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Prod := DataSetItem.FieldByName('COD_PRODUTO').Text;
  Buscador.Adiciona('DESC_UNIDADE','TB_PRODUTO', 'COD_PRODUTO = ' + Prod);
  Buscador.Adiciona('NUM_EMBALAGEM','TB_PRODUTO','COD_PRODUTO = ' + Prod);
  Buscador.Adiciona('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + Prod);
  Buscador.Buscar();
  wUN := buscador.Proximo;
  wEmb := buscador.Proximo;
  {wAgricola := (buscador.Proximo = 'AGRICOLA');
  if (wUN <> '') and (wEmb <> '') and (StrToFloat(wEmb) > 1) then
    if ((trim(wUN) = 'KG') and (wAgricola)) then
      Insere(wInfAd, 'Preco em sacas de ' + wEmb + ' KG.');

  if DMParamSistema.CodEmpresa = 'TOFECO' then
    Insere(wInfAd, 'Preco em tonelada');}
  if DMParamSistema.CodEmpresa = 'CASATINTAS' then
  begin
    if(Prod <> '') then
    begin
      Insere(wInfAd, wUN +' '+ wEmb);
    end;
  end;
  Result := wInfAd;
end; 

procedure TDMPedido.QROrcamentoRetifozCalcFields(DataSet: TDataSet);
var
wTotalGeralProdutos,wTotalGeralPedido, wTotalDescontoItem : real;
begin
  QROrcamentoRetifozcnpj_ie.Value := 'CNPJ: ' + QROrcamentoRetifozNUM_CGC.Value + ' I.E: ' + QROrcamentoRetifozDESC_INSCRICAO.Value;
  QROrcamentoRetifozendereco_bairro_filial.Value := QROrcamentoRetifozDESC_ENDERECO_COMPLETO_FILIAL.Value;
  //QROrcamentoRetifozendereco_bairro_filial.Value := QROrcamentoRetifozDESC_ENDERECO_FILIAL.Value + ' - ' + QROrcamentoRetifozDESC_BAIRRO_FILIAL.Value;
  QROrcamentoRetifozcidade_estado_filial.Value := QROrcamentoRetifozDESC_CIDADE_FILIAL.Value + ' - ' + QROrcamentoRetifozCOD_ESTADO_FILIAL.Value;
  //QROrcamentoRetifozendereco_bairro.Value := QROrcamentoRetifozDESC_ENDERECO.Value + ', ' + QROrcamentoRetifozDESC_BAIRRO.Value;
  QROrcamentoRetifozcodigo_nome_vendedor.Value := IntToStr(QROrcamentoRetifozCOD_VENDEDOR.Value) + ' - ' + QROrcamentoRetifozNOME_VENDEDOR.Value;
  QROrcamentoRetifozcidade_estado.Value := QROrcamentoRetifozDESC_CIDADE.Value + ' - ' + QROrcamentoRetifozCOD_ESTADO.Value;
  QROrcamentoRetifozval_desconto.Value := (QROrcamentoRetifozVAL_UNITARIO.Value*(QROrcamentoRetifozPERC_DESCONTO.Value/100));
  QROrcamentoRetifozval_total_unitario.Value := ((QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozVAL_UNITARIO.Value)-(QROrcamentoRetifozQT_PEDIDO.Value*QROrcamentoRetifozval_desconto.Value));

  if ((QROrcamentoRetifozIND_TIPO_PRODUTO.Value = 'SERVIÇO') or (QROrcamentoRetifozIND_TIPO_PRODUTO.Value = 'MAO OBRA')) then
    QROrcamentoRetifoztipo_produto.Value := 'S'
  else
    QROrcamentoRetifoztipo_produto.Value := 'P';
end;

procedure TDMPedido.QPedidoCOD_VENDEDORValidate(Sender: TField);
begin
  If DMParamSistema.CodEmpresa = 'GRASEL' then
     If (Trim(QPedidoCOD_VENDEDOR.Text) <> '') And (QPedidoPerc_Comissao.Value = 0)  Then
        QPedidoPerc_Comissao.Text := DMOracle.FastSelect('PERC_COMISSAO1','TB_VENDEDOR','COD_VENDEDOR =' + QPedidoCOD_VENDEDOR.Text)
end;

procedure TDMPedido.Acessa_Operacao;
Begin
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('Pk',DMPedido.QPedidoCod_Operacao.Value);
  DMOperacao.QOperacao.Open;
  If DMOperacao.QOperacao.Eof Then
     Raise Exception.Create('Operação Não Cadastrada');

End;

procedure TDMPedido.Proc_GeraCaixa(PHistorico : integer; pValor : Double; PComplemento:String);
Begin
  DMPedido.QCaixa.Close;
  DMPedido.QCaixa.Open;
  DMPedido.QCaixa.Insert;
  DMPedido.QCaixaCOD_USUARIO.Value := DMusuario.CodUsuarioCorrente;
  DMPedido.QCaixaCOD_FILIAL.Value := DMPedido.QPedidoCod_Filial.Value;
  DMPedido.QCaixaCOD_DEPARTAMENTO.Value := DmUsuario.CodDepartamentoUsuario;
  DMPedido.QCaixaCOD_HISTORICO.Value := pHistorico;
  DMPedido.QCaixaDT_MOVIMENTO.Value := Date;
  DMPedido.QCaixaVAL_MOVIMENTO.Value := pValor;
  DMPedido.QCaixaNUM_DOCUMENTO.Value := DMPedido.QPedidoNum_Pedido.Value;
  DMPedido.QCaixaCOD_CADASTRO.Value := DMPedido.QPedidoCod_Cadastro.Value;
  DMPedido.QCaixaDT_USUARIO.Value := DMOracle.DataServ;
  DMPedido.QCaixaDESC_COMPLEMENTO.Value := pComplemento;
  DMPedido.QCaixaCod_Pedido_Cab.Value := DMPedido.QPedidoCod_Pedido_Cab.Value;
  DMPedido.QCaixa.Post;
End;

procedure TDMPedido.QEntregaBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
//  QEntregaItem.Edit;
end;

procedure TDMPedido.QEntregaBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPedido.QEntregaAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QEntrega.Close;
  QEntregaItem.Close;
  QEntrega.Open;
  QEntregaItem.Open;
end;

procedure TDMPedido.QEntregaConsCalcFields(DataSet: TDataSet);
begin
  if QEntregaConsCOD_FILIAL.Text <> '' then
    QEntregaConsfilial.Value := DMOracle.FastSelect('DESC_FILIAL','TB_FILIAL','COD_FILIAL = ' + QEntregaConsCOD_FILIAL.Text);
  QEntregaConsnomecadastro.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
end;

procedure TDMPedido.QEntregaAfterPost(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMPedido.QEntregaItemBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPedido.QEntregaItemBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPedido.QEntregaAfterInsert(DataSet: TDataSet);
begin
  QEntregaItem.Open;
end;

Procedure TDMPedido.ExcluiEntrega;
begin
  QEntregaItem.close;
  QEntregaItem.Open;
  QEntregaItem.SetVariable('COD_ENTREGA_CAB',QEntregaCOD_ENTREGA_CAB.Value);
  if QEntregaItemIND_SITUACAO.Value = 'C' then
  begin
    DMOracle.DBCemapa.Rollback;
    raise Exception.Create('Não é possível excluir uma entrega com a situação Cancelada!');
  end;
  if QEntregaItemIND_SITUACAO.Value = 'R' then
  begin
    DMOracle.DBCemapa.Rollback;
    raise Exception.Create('Não é possível excluir uma entrega com a situação Recusada!');
  end;
  if QEntregaItemIND_SITUACAO.Value = 'E' then
  begin
    DMOracle.DBCemapa.Rollback;
    raise Exception.Create('Não é possível excluir uma entrega com a situação Entregue!');
  end;
  if QEntregaItemIND_SITUACAO.Value = 'P' then
  begin
    if (MessageDlg('Tem certeza que deseja excluir esta entrega do sistema?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE TB_ENTREGA_ITEM_IMAGEM WHERE COD_ENTREGA_ITEM = ' + chr(39) + QEntregaItemCOD_ENTREGA_ITEM.Text + chr(39) );
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        QEntregaItem.Delete;
        qentrega.Delete;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Não foi possível excluir a Entrega!');
      end;
      DMOracle.DBCemapa.Commit;
    end
    else
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Operação cancelada pelo usuário!');
    end;
  QEntregaItem.Close;
  QEntregaItem.Open;
  QEntrega.Close;
  QEntrega.Open
  end;
end;

procedure TDMPedido.ValidaEntrega(pCodigo : string);
var
 wCodNota, wCodEntrega: string;
begin
  wCodNota := DMOracle.FastSelect('COD_NOTA_CAB','TB_ENTREGA_ITEM','COD_ENTREGA_ITEM = ' + chr(39) + pCodigo + chr(39) );
  if pCodigo <> '' then
  begin
    wCodEntrega := DMOracle.FastSelect('COD_ENTREGA_CAB','TB_ENTREGA_ITEM','COD_PEDIDO_CAB = ' + chr(39) + pCodigo + chr(39) );
    if wCodEntrega <> '' then
      raise Exception.Create('Este pedido está inserido na entrega Nº: ' + wCodEntrega);
  end;
  if wCodNota <> '' then
  begin
    wCodEntrega := DMOracle.FastSelect('COD_ENTREGA_CAB','TB_ENTREGA_ITEM','COD_NOTA_CAB = ' + chr(39) + wCodNota + chr(39) );
    raise Exception.Create('Esta nota está na entrega Nº: ' + wCodEntrega);
  end;
end;

procedure TDMPedido.QEntregaItemAfterPost(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

end.

