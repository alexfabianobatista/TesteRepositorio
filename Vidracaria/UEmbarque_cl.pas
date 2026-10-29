Unit UEmbarque_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle, Menus, variants;

type
  TDMEmbarque = class(TDataModule)
    DSEmbarque: TDataSource;
    DSEmbarqueItem: TDataSource;
    QREmbarque_Rota: TOracleDataSet1;
    QREmbarque_RotaNOME: TStringField;
    QREmbarque_RotaDESC_TELEFONE: TStringField;
    QREmbarque_RotaDESC_FANTASIA: TStringField;
    QREmbarque_RotaDESC_CIDADE: TStringField;
    QREmbarque_RotaNR_ROTA: TIntegerField;
    QrAcertoCondPagto: TOracleDataSet1;
    QrAcertoCondPagtoCOD_CADASTRO: TIntegerField;
    QrAcertoCondPagtoNUM_NOTA: TIntegerField;
    QrAcertoCondPagtoCOD_EMBARQUE: TIntegerField;
    QrAcertoCondPagtoNOME_MOTORISTA: TStringField;
    QrAcertoCondPagtoDT_EMBARQUE: TDateTimeField;
    QrAcertoCondPagtoNOME: TStringField;
    QrAcertoCondPagtoSVAL_TOTAL: TFloatField;
    QrAcertoCondPagtoSQT_QUANTIDADE: TFloatField;
    QrEmbarque_Ped_Nf: TOracleDataSet1;
    QrAchaNrNota: TOracleDataSet1;
    QrAchaNrNotaNUM_NOTA: TIntegerField;
    QrAchaNrNotaDESC_TRANSPORTADORA: TStringField;
    QRNFs: TOracleDataSet1;
    QRNFsNUM_NOTA: TIntegerField;
    QREmbarque2: TOracleDataSet1;
    QREmbarque2COD_EMBARQUE: TIntegerField;
    QREmbarque2DT_EMBARQUE: TDateTimeField;
    QREmbarque2NOME_MOTORISTA: TStringField;
    QREmbarque2NUM_KILOMETRAGEM: TStringField;
    QREmbarque2DESC_OBS: TStringField;
    QREmbarque2COD_TRANSPORTADOR: TIntegerField;
    QREmbarque2NOME_TRANSPORTADOR: TStringField;
    QREmbarque2COD_PRODUTO: TFloatField;
    QREmbarque2DESC_LOTE: TStringField;
    QREmbarque2SQT_PEDIDO: TFloatField;
    QREmbarque: TOracleDataSet1;
    QREmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QREmbarqueNUM_PEDIDO: TIntegerField;
    QREmbarqueCOD_CADASTRO: TIntegerField;
    QREmbarqueNOME: TStringField;
    QREmbarqueDESC_ENDERECO: TStringField;
    QREmbarqueDESC_CEP: TStringField;
    QREmbarqueCOD_VENDEDOR: TIntegerField;
    QREmbarqueDT_EMISSAO: TDateTimeField;
    QREmbarqueDESC_CIDADE: TStringField;
    QREmbarqueCOD_ESTADO: TStringField;
    QREmbarqueDESC_OBSERVACAO: TStringField;
    QREmbarqueCOD_PRODUTO: TFloatField;
    QREmbarqueDESC_LOTE: TStringField;
    QREmbarqueCOD_PEDIDO_ITEM: TIntegerField;
    QREmbarqueSQT_PEDIDO: TFloatField;
    QREmbarqueQT_PES: TIntegerField;
    QREmbarqueQT_VIDROS: TIntegerField;
    QREmbarqueNOME_MOTORISTA: TStringField;
    QREmbarqueNUM_SEQUENCIAL: TIntegerField;
    QREmbarque3: TOracleDataSet1;
    QREmbarque3SQTDE_CIDADE: TFloatField;
    QREmbarque3DESC_CIDADE: TStringField;
    QEmbarqueCons: TOracleDataSet1;
    QEmbarqueConsCOD_EMBARQUE: TIntegerField;
    QEmbarqueConsDT_EMBARQUE: TDateTimeField;
    QEmbarqueConsNOME_MOTORISTA: TStringField;
    QEmbarqueConsCOD_TRANSPORTADOR: TIntegerField;
    QEmbarqueConsNOME: TStringField;
    QEmbarqueItem: TOracleDataSet1;
    QEmbarqueItemCOD_EMBARQUE: TIntegerField;
    QEmbarqueItemCOD_PEDIDO_CAB: TIntegerField;
    QEmbarqueItemQT_PES: TIntegerField;
    QEmbarqueItemQT_VIDROS: TIntegerField;
    QEmbarqueItemNUM_SEQUENCIAL: TIntegerField;
    QEmbarqueItemnum_pedido: TStringField;
    QEmbarqueItemnome_cliente: TStringField;
    QEmbarque: TOracleDataSet1;
    QEmbarquenome_transportador: TStringField;
    QSomaNF: TOracleDataSet1;
    QSomaNFCOD_EMBARQUE: TIntegerField;
    QSomaNFSVAL_TOTAL: TFloatField;
    QSomaNF2: TOracleDataSet1;
    QSomaNF2COD_EMBARQUE: TIntegerField;
    QSomaNF2NUM_VOLUMES: TFloatField;
    QSomaNF2VAL_AVISTA: TFloatField;
    QSomaNF2VAL_APRAZO: TFloatField;
    QSomaNF2VAL_OUTROS: TFloatField;
    QREmbarque_RotaNUM_NOTA: TIntegerField;
    QREmbarque2SQT_VALOR: TFloatField;
    QREmbarqueImposto: TOracleDataSet1;
    QEmbarque_EmiteNota: TOracleDataSet1;
    QEmbarque_EmiteNotaCOD_PEDIDO_CAB: TIntegerField;
    QEmbarque_EmiteNotaCOD_FILIAL: TIntegerField;
    QEmbarque_EmiteNotaCOD_OPERACAO: TIntegerField;
    QEmbarque_EmiteNotaCOD_VENDEDOR: TIntegerField;
    QEmbarque_EmiteNotaCOD_CADASTRO: TIntegerField;
    QEmbarque_EmiteNotaPERC_COMISSAO_NOTA: TFloatField;
    QEmbarque_EmiteNotaIND_TIPO_PAGAMENTO: TStringField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE1: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE2: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE3: TIntegerField;
    QEmbarque_EmiteNotaCOD_PRODUTO: TFloatField;
    QEmbarque_EmiteNotaVAL_UNITARIO: TFloatField;
    QEmbarque_EmiteNotaCOD_TRIBUTACAO: TIntegerField;
    QEmbarque_EmiteNotaCOD_LOTE_TIPO: TIntegerField;
    QEmbarque_EmiteNotaQT_PEDIDO: TFloatField;
    QEmbarque_EmiteNotaCOD_PEDIDO_ITEM: TIntegerField;
    QEmbarque_EmiteNotaPERC_COMISSAO_ITENS: TFloatField;
    QEmbarque_EmiteNotacod_prazo_vencimento: TIntegerField;
    QEmbarque_EmiteNotaCOD_TRANSPORTADOR: TIntegerField;
    QEmbarque_EmiteNotaIND_TIPO_FRETE: TStringField;
    QREmbarque2SQT_METROS: TFloatField;
    QEmbarque_EmiteNotaVAL_DESCONTO: TFloatField;
    QEmbarque_EmiteNotaNUM_SEQUENCIAL: TIntegerField;
    QREmbarque2NUM_EMBALAGEM: TFloatField;
    QREmbarque2NUM_VOLUMES: TFloatField;
    QREmbarque2sqt_embalagem: TFloatField;
    QSomaNFSVAL_IMPOSTO: TFloatField;
    QSomaNF2sval_total: TFloatField;
    QSomaImposto: TOracleDataSet1;
    QSomaImpostoSVAL_IMPOSTO: TFloatField;
    QEmbarque_EmiteNotaNUM_PEDIDO: TIntegerField;
    QrAcertoCondPagtoCOD_NOTA_CAB: TIntegerField;
    QrAcertoCondPagtodesc_sigla: TStringField;
    QREmbarque_RotaNUM_SEQUENCIAL: TIntegerField;
    QEmbarque_EmiteNotaPERC_DESCONTO_ITEM: TFloatField;
    QNotaEmbarque: TOracleDataSet1;
    QNotaEmbarqueCOD_EMBARQUE: TIntegerField;
    QREmbarqueNUM_CGC_CPF: TStringField;
    QREmbarqueNUM_INSCRICAO: TStringField;
    QREmbarqueIND_TIPO_PAGAMENTO: TStringField;
    QREmbarqueDESC_COMPLEMENTO_OBS: TStringField;
    QREmbarqueVAL_UNITARIO: TFloatField;
    QREmbarqueVAL_TOTAL: TFloatField;
    QREmbarque_RotaCOD_SERIE: TStringField;
    QREmbarque2DESC_CLASSE: TStringField;
    QEmbarqueItensPed: TOracleDataSet1;
    QEmbarqueItensPedCOD_PEDIDO_ITEM: TIntegerField;
    QREmbarqueCarga: TOracleDataSet1;
    QREmbarqueCargaCOD_EMBARQUE: TIntegerField;
    QREmbarqueCargaVAL_AVISTA_NF: TFloatField;
    QREmbarqueCargaVAL_APRAZO_NF: TFloatField;
    QREmbarqueCargaSVAL_IMPOSTO_NF: TFloatField;
    QEmbarqueItensNota: TOracleDataSet1;
    QEmbarqueItensNotaCOD_FILIAL: TIntegerField;
    QEmbarqueItensNotaCOD_PRODUTO: TFloatField;
    QEmbarqueItensNotaQT_QUANTIDADE: TFloatField;
    QEmbarqueSoma: TOracleDataSet1;
    QEmbarqueSomaQT_EMBARQUE: TFloatField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE4: TIntegerField;
    QREmbarqueCargaNOME_MOTORISTA: TStringField;
    QREmbarqueCargaVAL_BANCOS_NF: TFloatField;
    QREmbarquePedido: TOracleDataSet1;
    QREmbarqueBaixado: TOracleDataSet1;
    QREmbarqueBaixadoCOD_EMBARQUE: TIntegerField;
    QREmbarqueBaixadoDT_ATUALIZA_ESTOQUE: TDateTimeField;
    QRProdutoEmbarcado: TOracleDataSet1;
    QRProdutoEmbarcadoCOD_FILIAL: TIntegerField;
    QRProdutoEmbarcadoCOD_PRODUTO: TFloatField;
    QRProdutoEmbarcadoQT_QUANTIDADE: TFloatField;
    QRProdutoEmbarcadoCOD_CLASSE: TIntegerField;
    QRProdutoEmbarcadoDESC_CLASSE: TStringField;
    QREmbarque_RotaQT_TOTAL: TFloatField;
    QREmbarqueBaixadoNUM_EMBARQUE: TIntegerField;
    QREmbarqueCargaNUM_EMBARQUE: TIntegerField;
    QREmbarque2NUM_EMBARQUE: TIntegerField;
    QrAcertoCondPagtoNUM_EMBARQUE: TIntegerField;
    QREmbarque_RotaNOME_MOTORISTA: TStringField;
    QREmbarqueCargaDT_EMISSAO: TDateTimeField;
    QREmbarqueCargaDESC_PLACA: TStringField;
    QEmbarque_EmiteNotaCOD_DEPARTAMENTO: TIntegerField;
    QEmbarque_EmiteNotaCOD_MENSAGEM: TIntegerField;
    QEmbarque_EmiteNotaCOD_BANCO_AGENCIA: TIntegerField;
    QRProdutoEmbarcadoDESC_PRODUTO: TStringField;
    QREmbarqueDESC_PRODUTO: TStringField;
    QREmbarque2DESC_PRODUTO: TStringField;
    QPedidoAberto: TOracleDataSet1;
    QPedidoAbertoTOTAL_CAIXAS: TFloatField;
    QPedidoAbertoVOLUME: TFloatField;
    QPedidoAbertoPESO: TFloatField;
    QPedidoAbertoDESC_REGIAO: TStringField;
    QPedidoAbertoVAL_TOTAL: TFloatField;
    QListaCaminhoes: TOracleDataSet1;
    QListaCaminhoesDESC_PLACA: TStringField;
    QPedidoAbertoCOD_VENDEDOR: TIntegerField;
    QPedidoAbertoCOD_PEDIDO_CAB: TIntegerField;
    OPEmbarque: TOraclePackage;
    QSimuladorEstoque: TOracleDataSet1;
    QSimuladorEstoqueCOD_FILIAL: TIntegerField;
    QSimuladorEstoqueCOD_PRODUTO: TFloatField;
    QSimuladorEstoqueQT_PEDIDO: TFloatField;
    QRPedido_Vendedor: TOracleDataSet1;
    QRPedido_VendedorCOD_VENDEDOR: TIntegerField;
    QRPedido_VendedorNOME: TStringField;
    QRPedido_VendedorDESC_REGIAO: TStringField;
    QRPedido_VendedorTOTAL_CAIXAS: TFloatField;
    QEmbarqueConsDESC_PLACA: TStringField;
    QRPedidoEmbarque: TOracleDataSet1;
    QRPedidoEmbarqueCOD_VENDEDOR: TIntegerField;
    QRPedidoEmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoEmbarqueDESC_REGIAO: TStringField;
    QRPedidoEmbarqueTOTAL_CAIXAS: TFloatField;
    QRPedidoEmbarqueVOLUME: TFloatField;
    QRPedidoEmbarquePESO: TFloatField;
    QRPedidoEmbarqueVAL_TOTAL: TFloatField;
    QPedidoAbertoCOD_CADASTRO: TIntegerField;
    QPedidoAbertoDT_EMISSAO: TDateTimeField;
    QREmbarque2sqt_embalagem_liq: TFloatField;
    QREmbarqueCliente: TOracleDataSet1;
    QREmbarqueClienteCOD_EMBARQUE: TIntegerField;
    QREmbarqueClienteDT_EMBARQUE: TDateTimeField;
    QREmbarqueClienteNOME_MOTORISTA: TStringField;
    QREmbarqueClienteDESC_PLACA: TStringField;
    QREstoqueEmbarque: TOracleDataSet1;
    QEmbarque_EmiteNotaCOD_CONTA_CORRENTE: TIntegerField;
    QCalculaValorCarga: TOracleDataSet1;
    QCalculaValorCargaVAL_CARGA: TFloatField;
    DSCalculaValorCarga: TDataSource;
    QRFretes: TOracleDataSet1;
    QRFretesCOD_EMBARQUE: TIntegerField;
    QRFretesDESC_DESTINO_FRETE: TStringField;
    QRFretesDT_EMBARQUE: TDateTimeField;
    QRFretesVAL_TOTAL_FRETE: TFloatField;
    QRFretesVAL_CONTRATO_FRETE: TFloatField;
    QRFretesqt_entregas: TIntegerField;
    QRFretesval_carga: TFloatField;
    QRFretesNOME_MOTORISTA: TStringField;
    QRFretesVAL_ACERTO: TFloatField;
    QRFretesIND_ACERTO_FRETE: TStringField;
    QRFretesDT_PREV_RETORNO: TDateTimeField;
    QRFretesNUM_PREV_KM_RETORNO: TIntegerField;
    QPedidoAbertoDT_CANCELAMENTO: TDateTimeField;
    QREmbarqueDESC_BAIRRO: TStringField;
    QREmbarque_RotaDESC_BAIRRO: TStringField;
    QREtiqCodBarraProducao: TOracleDataSet1;
    QEtiqueta: TOracleDataSet1;
    QEtiquetaETIQUETA1: TStringField;
    QEtiquetaETIQUETA2: TStringField;
    QEtiquetaETIQUETA3: TStringField;
    QEtiquetaETIQUETA4: TStringField;
    QEtiquetaETIQUETA5: TStringField;
    QEtiquetadesc_produto1: TStringField;
    QEtiquetadesc_produto2: TStringField;
    QEtiquetadesc_produto3: TStringField;
    QEtiquetadesc_produto4: TStringField;
    QEtiquetadesc_produto5: TStringField;
    QPedidoAbertoDESC_OBSERVACAO: TStringField;
    QBaixaEstoqueLeitor: TOracleDataSet1;
    QBaixaEstoqueLeitorCOD_PEDIDO_ITEM: TIntegerField;
    QBaixaEstoqueLeitorQT_PEDIDO: TFloatField;
    QBaixaEstoqueLeitorQT_QUANTIDADE_AUX: TFloatField;
    QRBaixaEstoqueLeitor: TOracleDataSet1;
    QREtiqCodBarraEmbarque: TOracleDataSet1;
    QREtiqCodBarraEmbarqueCOD_PRODUTO: TIntegerField;
    QREtiqCodBarraEmbarqueNUM_CONTROLE: TIntegerField;
    QREtiqCodBarraEmbarqueNUM_LINHA: TIntegerField;
    QREtiqCodBarraEmbarqueCOD_ESTOQUE_PRODUCAO: TIntegerField;
    QPedidoAbertoCOD_OPERACAO: TIntegerField;
    QEmbarque_EmiteNotaCOD_CULTURA: TIntegerField;
    QREstoqueEmbarqueCOD_PRODUTO: TFloatField;
    QREstoqueEmbarqueDESC_PRODUTO: TStringField;
    QREstoqueEmbarqueQT_PEDIDO: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE1: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE2: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE3: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE4: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE5: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE6: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE7: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE8: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE9: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE10: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE11: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE12: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE13: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE14: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE15: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE16: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE17: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE18: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE19: TFloatField;
    QREstoqueEmbarqueQT_EMBARQUE20: TFloatField;
    QREstoqueEmbarqueSub: TOracleDataSet1;
    QREstoqueEmbarqueSubCOD_EMBARQUE: TIntegerField;
    QREstoqueEmbarqueSubROWNUM_EMBARQUE: TFloatField;
    QREstoqueEmbarqueSubTOT_PESO_LIQ: TFloatField;
    QREstoqueEmbarqueSubTOT_PESO_BRUTO: TFloatField;
    QREmbarque2DESC_UNIDADE: TStringField;
    QRPedido_VendedorCOD_SUPERVISOR: TIntegerField;
    QRPedido_Vendedornome_supervisor: TStringField;
    QREtiqCodBarraProducaoCOD_EMBARQUE: TIntegerField;
    QREtiqCodBarraProducaoCOD_PRODUTO: TFloatField;
    QREtiqCodBarraProducaoDESC_PRODUTO: TStringField;
    QREtiqCodBarraProducaoQT_PEDIDO: TFloatField;
    QEmbarque_EmiteNotaPERC_DESCONTO1: TFloatField;
    QEmbarque_EmiteNotaPERC_DESCONTO2: TFloatField;
    QEmbarque_EmiteNotaPERC_ACRESCIMO: TFloatField;
    QREmbarque_RotaDESC_CEP: TStringField;
    QEmbarque_EmiteNotaPERC_SUB: TFloatField;
    QREstoqueEmbarqueqt_quantidade: TFloatField;
    QREstoqueEmbarqueqt_saldo: TFloatField;
    QEmbarquenum_km_diferenca: TFloatField;
    QRParamSistema: TOracleDataSet1;
    QRParamSistemaCOD_EMPRESA: TStringField;
    QRParamSistemaNUM_SEQUENCIAL: TStringField;
    QPedidoAbertoNOME: TStringField;
    QPedidoAbertoDESC_BAIRRO: TStringField;
    QREmbarque3SQT_BONIFICACAO: TFloatField;
    QREmbarque3SQT_BRINDE: TFloatField;
    QREmbarque3SQT_VENDA: TFloatField;
    QRPedido_VendedorTOTAL_PENDENTE: TFloatField;
    QREmbarque2SVL_BRINDE: TFloatField;
    QREmbarque2SVL_BONIFICACAO: TFloatField;
    QBaixaComponente: TOracleDataSet1;
    QBaixaComponenteCOD_PRODUTO: TIntegerField;
    QBaixaComponenteQT_ITEM: TFloatField;
    QBaixaComponenteCOD_LOTE_TIPO: TIntegerField;
    QRControleCargas: TOracleDataSet1;
    QREtiqCodBarraEmbarqueNUM_VOLUMES: TFloatField;
    QREtiqCodBarraProducaoNUM_VOLUMES: TFloatField;
    QBaixaEstoqueLeitorQT_EMBALAGEM: TFloatField;
    QEmbarqueCOD_EMBARQUE: TIntegerField;
    QEmbarqueDT_EMBARQUE: TDateTimeField;
    QEmbarqueNOME_MOTORISTA: TStringField;
    QEmbarqueCOD_TRANSPORTADOR: TIntegerField;
    QEmbarqueNUM_KILOMETRAGEM: TStringField;
    QEmbarqueDESC_OBS: TStringField;
    QEmbarqueIND_SITUACAO: TStringField;
    QEmbarqueIND_ATUALIZA_ESTOQUE: TStringField;
    QEmbarqueDT_ATUALIZA_ESTOQUE: TDateTimeField;
    QEmbarqueNUM_EMBARQUE: TIntegerField;
    QEmbarqueDESC_PLACA: TStringField;
    QEmbarqueIND_BLOQUEADO: TStringField;
    QEmbarqueCOD_MOTORISTA: TIntegerField;
    QEmbarqueIND_TIPO_VEICULO: TStringField;
    QEmbarqueDESC_DESTINO_FRETE: TStringField;
    QEmbarqueNUM_KILOMETRAGEM_CHEGADA: TStringField;
    QEmbarqueVAL_AJUDA_CUSTO: TFloatField;
    QEmbarqueVAL_ADTO_FRETE: TFloatField;
    QEmbarqueVAL_KM: TFloatField;
    QEmbarqueCOD_CONTA_PAGAR_CAB: TIntegerField;
    QEmbarqueDT_VENCIMENTO: TDateTimeField;
    QEmbarqueVAL_FRETE: TFloatField;
    QEmbarqueCOD_USUARIO: TIntegerField;
    QEmbarqueDT_USUARIO: TDateTimeField;
    QEmbarqueVAL_TOTAL_FRETE: TFloatField;
    QEmbarqueIND_ACERTO_FRETE: TStringField;
    QEmbarqueVAL_CONTRATO_FRETE: TFloatField;
    QEmbarqueDT_PREV_RETORNO: TDateTimeField;
    QEmbarqueNUM_PREV_KM_RETORNO: TIntegerField;
    QEmbarqueVAL_PEDAGIO: TFloatField;
    QEmbarqueCOD_CONTA_PAGAR_CAB_PEDAGIO: TIntegerField;
    QEmbarqueCOD_CONTA_PAGAR_CAB_ADTO: TIntegerField;
    QEmbarqueVAL_ICMS: TFloatField;
    QEmbarqueCOD_CONTA_PAGAR_CAB_ICMS: TIntegerField;
    QEmbarqueVAL_FRETE_COMPLEMENTO: TFloatField;
    QEmbarqueCOD_CONTA_PAGAR_CAB_COMPL: TIntegerField;
    QEmbarqueNUM_MANIFESTO: TIntegerField;
    QEmbarqueVAL_MANIFESTO: TFloatField;
    QVoltaEtiquetaEmbarque: TOracleDataSet1;
    QRPedido_Vendedor_Estado: TOracleDataSet1;
    QRPedido_Vendedor_EstadoCOD_ESTADO: TStringField;
    QRPedido_Vendedor_EstadoDESC_CIDADE: TStringField;
    QRPedido_Vendedor_EstadoTOTAL_CAIXAS: TFloatField;
    QRPedido_Vendedor_EstadoTOTAL_METROS: TFloatField;
    QEmbarqueItensPedQT_ATENDIDO: TFloatField;
    QRProdutoEmbarcado2: TOracleDataSet1;
    QREmbarqueImpostoNOME: TStringField;
    QREmbarqueImpostoCOD_CADASTRO: TIntegerField;
    QREmbarqueImpostoNUM_NOTA: TIntegerField;
    QREmbarqueImpostoDT_EMISSAO: TDateTimeField;
    QREmbarqueImpostoCOD_ESTADO: TStringField;
    QREmbarqueImpostoNUM_INSCRICAO: TStringField;
    QREmbarqueImpostoSPERC_IMPOSTO: TFloatField;
    QREmbarqueImpostoSVAL_TOTAL: TFloatField;
    QREmbarqueImpostoSVAL_IMPOSTO: TFloatField;
    QEstoqueEmbarcado: TOracleDataSet1;
    QEstoqueEmbarcadoCOD_ESTOQUE_EMBARCADO: TIntegerField;
    QEstoqueEmbarcadoCOD_FILIAL: TIntegerField;
    QEstoqueEmbarcadoCOD_PRODUTO: TIntegerField;
    QEstoqueEmbarcadoCOD_PEDIDO_CAB: TIntegerField;
    QEstoqueEmbarcadoCOD_PEDIDO_ITEM: TIntegerField;
    QEstoqueEmbarcadoCOD_EMBARQUE: TIntegerField;
    QEstoqueEmbarcadoQT_EMBARCADO: TIntegerField;
    QRProdutoEmbarcado2COD_PRODUTO: TIntegerField;
    QRProdutoEmbarcado2DESC_PRODUTO: TStringField;
    QRProdutoEmbarcado2QT_EMBARCADO: TFloatField;
    QEstoqueEmbarcadoDT_EMBARQUE: TDateTimeField;
    QVoltaEtiquetaEmbarqueCOD_ESTOQUE_PRODUCAO: TIntegerField;
    QVoltaEtiquetaEmbarqueCOD_PRODUTO: TIntegerField;
    QVoltaEtiquetaEmbarqueNUM_CONTROLE: TIntegerField;
    QVoltaEtiquetaEmbarqueNUM_LINHA: TIntegerField;
    QrEmbarque_Ped_NfCOD_CADASTRO: TIntegerField;
    QrEmbarque_Ped_NfNUM_NOTA: TIntegerField;
    QrEmbarque_Ped_NfDT_RECEBIMENTO: TDateTimeField;
    QrEmbarque_Ped_NfCOD_EMBARQUE: TIntegerField;
    QrEmbarque_Ped_NfNOME: TStringField;
    QrEmbarque_Ped_NfNUM_INSCRICAO: TStringField;
    QrEmbarque_Ped_NfNUM_CGC: TStringField;
    QrEmbarque_Ped_NfDESC_INSCRICAO: TStringField;
    QrEmbarque_Ped_NfDESC_ENDERECO: TStringField;
    QrEmbarque_Ped_NfSVAL_TOTAL: TFloatField;
    QrEmbarque_Ped_NfSQT_QUANTIDADE: TFloatField;
    QSomaNFSQUANTIDADE: TFloatField;
    QRNFsCOD_CADASTRO: TIntegerField;
    QRNFsNOME: TStringField;
    QRNFsDESC_CIDADE: TStringField;
    QRNFsCOD_ESTADO: TStringField;
    QEmbarque_EmiteNotaDESC_OBSERVACAO: TStringField;
    QEmbarque_EmiteNotaDESC_COMPLEMENTO_OBS: TStringField;
    QRBaixaEstoqueLeitorCOD_PRODUTO: TFloatField;
    QRBaixaEstoqueLeitorDESC_PRODUTO: TStringField;
    QRBaixaEstoqueLeitorQT_PEDIDO: TFloatField;
    QRBaixaEstoqueLeitorQT_QUANTIDADE_AUX: TFloatField;
    QRBaixaEstoqueLeitorQT_EMBALAGEM: TFloatField;
    DSBaixaEstoqueLeitor: TDataSource;
    QEstoqueEmbarcadoQT_PESO_EMBARCADO: TFloatField;
    QEstoqueEmbarcadoNUM_CONTROLE: TIntegerField;
    QPedidosNoEmbarque: TOracleDataSet1;
    QPedidosNoEmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QPedidosNoEmbarqueCOD_CADASTRO: TIntegerField;
    QPedidosNoEmbarqueDESC_COMPLEMENTO_OBS: TStringField;
    QPedidosNoEmbarqueCOD_PRODUTO: TFloatField;
    QPedidosNoEmbarqueDESC_PRODUTO: TStringField;
    QPedidosNoEmbarqueNOME: TStringField;
    QPedidosNoEmbarqueCOD_PECA: TStringField;
    QPedidosNoEmbarqueVAL_LARGURA: TFloatField;
    QPedidosNoEmbarqueVAL_ALTURA: TFloatField;
    QPedidosNoEmbarqueQT_PEDIDO: TFloatField;
    QPedidosNoEmbarqueDESC_FANTASIA: TStringField;
    QREmbarquePedidoCOD_CADASTRO: TIntegerField;
    QREmbarquePedidoNOME: TStringField;
    QREmbarquePedidoDT_EMISSAO: TDateTimeField;
    QREmbarquePedidoDESC_OBSERVACAO: TStringField;
    QREmbarquePedidoNUM_PEDIDO: TIntegerField;
    QREmbarquePedidoDT_FATURAMENTO: TDateTimeField;
    QREmbarquePedidoDESC_PRODUTO: TStringField;
    QREmbarquePedidoSQT_PEDIDO: TFloatField;
    QREmbarquePedidoVAL_UNITARIO: TFloatField;
    QREmbarquePedidoVAL_TOTAL: TFloatField;
    QREmbarquePedidoCOD_PEDIDO_CAB: TIntegerField;
    QPedidosNoEmbarqueIND_TIPO: TStringField;
    QREmbarquePedidoNUM_SEQUENCIAL: TIntegerField;
    QRPedidosProntos: TOracleDataSet1;
    QRPedidosProntosCOD_PEDIDO_CAB: TIntegerField;
    QRPedidosProntosCOD_CADASTRO: TIntegerField;
    QRPedidosProntosNOME: TStringField;
    QRPedidosProntosDESC_COMPLEMENTO_OBS: TStringField;
    QRPedidosProntosdesc_produto: TStringField;
    DSPedidosProntos: TDataSource;
    QRPedidosProntosNUM_PALM: TIntegerField;
    QAcompanhaEmbarque: TOracleDataSet1;
    QAcompanhaEmbarqueCOD_ACOMPANHAMENTO_PEDIDO: TIntegerField;
    QAcompanhaEmbarqueIND_CALCULO: TStringField;
    QAcompanhaEmbarqueIND_CORTE: TStringField;
    QAcompanhaEmbarqueIND_USINAGEM: TStringField;
    QAcompanhaEmbarqueIND_MARCACAO: TStringField;
    QAcompanhaEmbarqueIND_FORNO: TStringField;
    QAcompanhaEmbarqueIND_EMBARQUE: TStringField;
    QAcompanhaEmbarqueDT_EMBARQUE: TDateTimeField;
    QAcompanhaEmbarqueDT_CORTE: TDateTimeField;
    QAcompanhaEmbarqueDT_USINAGEM: TDateTimeField;
    QAcompanhaEmbarqueDT_MARCACAO: TDateTimeField;
    QAcompanhaEmbarqueDT_FORNO: TDateTimeField;
    QAcompanhaEmbarqueCOD_PECA: TStringField;
    QAcompanhaEmbarqueVAL_LARGURA: TFloatField;
    QAcompanhaEmbarqueVAL_ALTURA: TFloatField;
    QAcompanhaEmbarqueIND_TIPO: TStringField;
    QAcompanhaEmbarqueNOME_CADASTRO: TStringField;
    QAcompanhaEmbarqueIND_QUEBRA: TStringField;
    QAcompanhaEmbarqueDESC_QUEBRAS: TStringField;
    QAcompanhaEmbarqueDT_BAIXA_VIDRACARIA: TDateTimeField;
    QAcompanhaEmbarqueNUM_LINHA: TFloatField;
    DSAcompanhaEmbarque: TDataSource;
    QAcompanhaEmbarqueCOD_PEDIDO_ITEM: TIntegerField;
    QrEmbarque_Ped_NfNUM_PEDIDO: TIntegerField;
    QrEmbarque_Ped_Nfpeso: TFloatField;
    QRPedidosProntosval_peso: TFloatField;
    QREmbarquePedidoqt_itens: TIntegerField;
    QRControleCargasCOD_EMBARQUE: TIntegerField;
    QRControleCargasNUM_EMBARQUE: TIntegerField;
    QRControleCargasDT_EMBARQUE: TDateTimeField;
    QRControleCargasNOME_MOTORISTA: TStringField;
    QRControleCargasCOD_TRANSPORTADOR: TIntegerField;
    QRControleCargasDESC_PLACA: TStringField;
    QRControleCargasDESC_DESTINO_FRETE: TStringField;
    QRControleCargasSQT_VALOR: TFloatField;
    QRControleCargasSVL_BRINDE: TFloatField;
    QRControleCargasSVL_BONIFICACAO: TFloatField;
    QAcompanhaEmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QAcompanhaEmbarqueCOD_PRODUTO: TFloatField;
    QAcompanhaEmbarqueDESC_PRODUTO: TStringField;
    procedure QEmbarqueAfterInsert(DataSet: TDataSet);
    procedure QEmbarqueBeforeInsert(DataSet: TDataSet);
    procedure QEmbarqueBeforeEdit(DataSet: TDataSet);
    procedure QEmbarqueAfterCancel(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeEdit(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeDelete(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeInsert(DataSet: TDataSet);
    procedure QEmbarqueItemAfterInsert(DataSet: TDataSet);
    procedure QEmbarqueCalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemCalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemAfterPost(DataSet: TDataSet);
    procedure QEmbarqueAfterPost(DataSet: TDataSet);
    procedure QEmbarque_EmiteNotaCalcFields(DataSet: TDataSet);
    procedure QREmbarque2CalcFields(DataSet: TDataSet);
    procedure QSomaNF2CalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemBeforePost(DataSet: TDataSet);
    procedure QrAcertoCondPagtoCalcFields(DataSet: TDataSet);
    procedure QEmbarqueBeforePost(DataSet: TDataSet);
    procedure QEmbarqueItemCOD_PEDIDO_CABValidate(Sender: TField);
    procedure QEmbarqueAfterEdit(DataSet: TDataSet);
    procedure QEmbarqueBeforeDelete(DataSet: TDataSet);
    procedure QRFretesCalcFields(DataSet: TDataSet);
    procedure QRPedido_VendedorCalcFields(DataSet: TDataSet);
    procedure QREstoqueEmbarqueCalcFields(DataSet: TDataSet);
    procedure QRPedidosProntosCalcFields(DataSet: TDataSet);
    procedure QrEmbarque_Ped_NfCalcFields(DataSet: TDataSet);
    procedure QREmbarquePedidoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fApagando : Boolean;
  public
    { Public declarations }
    function SenhaLiberaCadastro(): boolean;
    Property pApagando : Boolean Read fApagando Write fApagando Default False;
  end;

var
  DMEmbarque: TDMEmbarque;

implementation

uses UOracle_cl, UParamSistema_cl, USequencia_cl,
  UUsuario_cl, UOficinaPassword;

{$R *.DFM}

function TDMEmbarque.SenhaLiberaCadastro(): boolean;
begin
 // if FOFI0004 = nil then
//     FOFI0004 := TFOFI0004.Create(Application);
//  if FOFI0004.ShowModal = mrOk then
//  begin
//    if (UpperCase(FOFI0004.Password.Text) = UpperCase(DMParamSistema.QParamSistemaDesc_Senha_Oficina.Text))then
//       result := true
//    else
//       result := false;
//  end
// else
//     result := false;
end;

procedure TDMEmbarque.QEmbarqueAfterInsert(DataSet: TDataSet);
begin
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;

  QEmbarqueVAL_MANIFESTO.value := 0;
end;

procedure TDMEmbarque.QEmbarqueBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMEmbarque.QEmbarqueBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMEmbarque.QEmbarqueAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QEmbarque.Close;
  QEmbarque.Open;
end;

procedure TDMEmbarque.QEmbarqueItemBeforeEdit(DataSet: TDataSet);
begin
  If QEmbarque.State <> dsEdit Then
    Raise Exception.Create('Embarque não está no modo de Alteração!');
end;

procedure TDMEmbarque.QEmbarqueItemBeforeDelete(DataSet: TDataSet);
begin
  If QEmbarque.State <> dsEdit Then
     Raise Exception.Create('Embarque não está no modo de Alteração!');
  //---ALTERA SITUACAO DO PEDIDO PARA N = NAO EMBARCADO
  DMEmbarque.OPEmbarque.CallProcedure(
     'SITUACAO_PEDIDO',['N',QEmbarqueItemCod_Pedido_Cab.Value]);

end;

procedure TDMEmbarque.QEmbarqueItemBeforeInsert(DataSet: TDataSet);
begin
  If QEmbarque.State = dsInsert then
  Begin
    QEmbarque.Post;
    QEmbarque.Edit;
  End;
  If QEmbarque.State <> dsEdit Then
    Raise Exception.Create('Embarque não está no modo de Alteração!');
end;

procedure TDMEmbarque.QEmbarqueItemAfterInsert(DataSet: TDataSet);
begin
  QEmbarqueItemCod_Embarque.Value := QEmbarqueCod_Embarque.Value;
end;

procedure TDMEmbarque.QEmbarqueCalcFields(DataSet: TDataSet);
begin
  QEmbarquenome_transportador.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                      'COD_CADASTRO = '+FloatToStr(QEmbarqueCod_Transportador.Value));
 { if QEmbarqueVal_Total_Frete.Text <> '' then
  begin
     QEmbarqueVal_Frete.Value:= (QEmbarqueVal_Total_Frete.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value)
  end;

  if QEmbarqueVAL_ADTO_FRETE.Text <> '' then
  begin
     QEmbarqueVal_Frete.value:= (QEmbarqueVal_Total_Frete.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value);
  end;

  if QEmbarqueVAL_AJUDA_CUSTO.Text <> '' then
  begin
     QEmbarqueVal_Frete.Value:= (QEmbarqueVal_Total_Frete.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value)
  end;}
  If QEmbarqueNum_Kilometragem_Chegada.Value <> '' Then
     QEmbarqueNum_Km_Diferenca.Value := StrToFloat(QEmbarqueNum_Kilometragem_Chegada.Value) - QEmbarqueVal_Km.Value;
end;

procedure TDMEmbarque.QEmbarqueItemCalcFields(DataSet: TDataSet);
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') then
    QEmbarqueItemnum_pedido.Value := '0' 
  else
    QEmbarqueItemnum_pedido.Value := DMOracle.BuscaNome('SELECT NUM_PEDIDO FROM TB_PEDIDO_CAB',
                                   'COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueItemnome_cliente.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO, TB_PEDIDO_CAB',
                                     'TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
                                    +' AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueSoma.Close;
  QEmbarqueSoma.Open;
                                    
end;

procedure TDMEmbarque.QEmbarqueItemAfterPost(DataSet: TDataSet);
begin
  //---ALTERA SITUACAO DO PEDIDO PARA S = EMBARCADO
  DMEmbarque.OPEmbarque.CallProcedure(
     'SITUACAO_PEDIDO',['S',QEmbarqueItemCod_Pedido_Cab.Value]);
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;
end;

procedure TDMEmbarque.QEmbarqueAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QEmbarqueCod_Embarque.Value;
  QEmbarque.Close;
  QEmbarque.SetVariable('PK',wCodigo);
  QEmbarque.Open;
end;

procedure TDMEmbarque.QEmbarque_EmiteNotaCalcFields(DataSet: TDataSet);
Var wCodigo_Prazo : String;
begin
  wCodigo_Prazo := DMOracle.BuscaNome('SELECT COD_PRAZO_VENCIMENTO FROM TB_PEDIDO_CAB',
                                   'COD_PEDIDO_CAB = '+FloatToStr(QEmbarque_EmiteNotaCod_Pedido_Cab.Value));
  if wCodigo_Prazo <> '' Then
     QEmbarque_EmiteNotaCod_Prazo_Vencimento.Value := StrToInt(wCodigo_Prazo);
end;

procedure TDMEmbarque.QREmbarque2CalcFields(DataSet: TDataSet);
begin
  QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Volumes.Value;
  QREmbarque2Sqt_Embalagem_Liq.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Embalagem.Value
end;

procedure TDMEmbarque.QSomaNF2CalcFields(DataSet: TDataSet);
begin
  QSomaNF2sVal_Total.Value := (QSomaNF2VAL_AVISTA.Value + QSomaNF2VAL_APRAZO.Value +
                               QSomaNF2VAL_OUTROS.Value + QSomaImpostosVal_Imposto.Value);
end;

procedure TDMEmbarque.QEmbarqueItemBeforePost(DataSet: TDataSet);
Var wNumero,wCadastro : String;
begin

  if DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB', 'COD_PEDIDO_CAB = ' + QEmbarqueItemCOD_PEDIDO_CAB.Text) <> 'SIM' then
    raise Exception.create('Pedido não liberado.');

  If QEmbarqueItemNum_Sequencial.Text = '' Then
   Begin
     wNumero:=DMOracle.BuscaNome('SELECT MAX(NUM_SEQUENCIAL) FROM TB_EMBARQUE_ITEM',
                                 'COD_EMBARQUE = '+FloatToStr(QEmbarqueItemCod_Embarque.Value));
     If wNumero <> '' Then
        QEmbarqueItemNum_Sequencial.Value := StrToInt(wNumero) + 1
     else
        QEmbarqueItemNum_Sequencial.Value := 1;
   end;

   If Trim(DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text) <> '' Then
    begin
     wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
     If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
     If DMOracle.BuscaNome('SELECT TB_PRODUTO.COD_PRODUTO FROM TB_PRODUTO,TB_PEDIDO_ITEM',
                                  'TB_PRODUTO.COD_PRODUTO=TB_PEDIDO_ITEM.COD_PRODUTO AND TB_PRODUTO.IND_SITUACAO <>' +Chr(39) + 'ATIVO' + Chr(39) +
                                  ' AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB = '+Trim(DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text)) <> '' Then
       raise exception.Create('ATENÇÃO - Pedido Possui Produtos Que Não Estão Ativos!');
    end;
end;

procedure TDMEmbarque.QrAcertoCondPagtoCalcFields(DataSet: TDataSet);
Var wCodBanco : String;
begin
  If QrAcertoCondPagtoCod_Nota_Cab.Text <> '' Then
  Begin
    wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_RECEBER_CAB',
                                  'COD_NOTA_CAB = '+FloatToStr(QrAcertoCondPagtoCod_Nota_Cab.Value));
    If wCodBanco <> '' Then
       QrAcertoCondPagtoDesc_Sigla.Value:=DMOracle.BuscaNome('SELECT DESC_SIGLA FROM TB_BANCO_AGENCIA',
                                  'COD_BANCO_AGENCIA = '+wCodBanco);
  End;
end;

procedure TDMEmbarque.QEmbarqueBeforePost(DataSet: TDataSet);
begin
  if QEmbarqueNUM_EMBARQUE.Text = '' Then
    QEmbarqueNUM_EMBARQUE.Value:=DMSequencia.Sequencia(Trunc(1),'EMBARQUE');
  QEmbarqueCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QEmbarqueDt_Usuario.Value := DMOracle.DataHoraServ;
end;

procedure TDMEmbarque.QEmbarqueItemCOD_PEDIDO_CABValidate(Sender: TField);
begin
  //---bloco responsável pela verificação da existencia de pedido utilizado em dois ou mais embarques
  //---verificacao requerida pela Faville/zadimel  --- Fabio 04/02/2005
  If QEmbarqueItemCod_Pedido_Cab.Text <> '' Then
    if DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+
       QEmbarqueItemCod_Pedido_Cab.Text) <> '' then
    begin
       If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS' Then
          QEmbarqueItem.cancel;
       showmessage('Pedido Nº '+QEmbarqueItemCod_Pedido_Cab.Text+' já utilizado em outro embarque');
    End;
end;

procedure TDMEmbarque.QEmbarqueAfterEdit(DataSet: TDataSet);
begin
  if (QEmbarqueIND_ACERTO_FRETE.Text = 'S') and (not(pApagando)) then
    If Not(DMUsuario.Privilegiado) Then
     Begin
       QEmbarque.cancel;
       showmessage('Frete já acertado com o Motorista, não é permitido alteração ou exclusão');
     End;
end;

procedure TDMEmbarque.QEmbarqueBeforeDelete(DataSet: TDataSet);
begin
  if (QEmbarqueIND_ACERTO_FRETE.Text = 'S') and (not(pApagando)) then
    If Not(DMUsuario.Privilegiado) Then
     Begin
       QEmbarque.cancel;
       showmessage('Frete já acertado com o Motorista, não é permitido alteração ou exclusão');
     end;
end;

procedure TDMEmbarque.QRFretesCalcFields(DataSet: TDataSet);
//var
//  wSQL,wSQLWhere:String;
begin
  if Trim(QRFretesCod_Embarque.Text) <> '' then
  begin
    QRFretesqt_entregas.Value := StrToInt('0'+DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_EMBARQUE_ITEM','COD_EMBARQUE = '+
                                                     Trim(QRFretesCod_Embarque.Text)));

  QSomaNF.Close;
  QSomaNF.SetVariable('EMBARQUE',QRFretesCod_Embarque.Value);
  QSomaNF.SetVariable('IND_LIVRO_FISCAL',Null);
  QSomaNF.Open;
  If not(QSomaNF.Eof) Then
     QRFretesVal_Carga.Value:= QSomaNFsVal_Total.Value;
  end;
end;

procedure TDMEmbarque.QRPedido_VendedorCalcFields(DataSet: TDataSet);
begin
  QRPedido_Vendedornome_supervisor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                 'COD_VENDEDOR = '+FloatToStr(QRPedido_VendedorCod_Supervisor.Value));
end;

procedure TDMEmbarque.QREstoqueEmbarqueCalcFields(DataSet: TDataSet);
begin
  QREstoqueEmbarqueQt_Quantidade.Text := '0' + DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE',
               'COD_PRODUTO = '+FloatToStr(QREstoqueEmbarqueCod_Produto.Value) + ' And Cod_Filial = 1');
  QREstoqueEmbarqueQt_Saldo.Value := QREstoqueEmbarqueQt_Quantidade.Value - QREstoqueEmbarqueQt_Pedido.Value;
end;

procedure TDMEmbarque.QRPedidosProntosCalcFields(DataSet: TDataSet);
var
wProduto,wPeso,wQuantidade : string;
begin
  wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PEDIDO_ITEM',' COD_PEDIDO_CAB = '+ QRPedidosProntosCOD_PEDIDO_CAB.Text);

  if wProduto = '' then
  begin
    ShowMessage('Pedido com código: ' + QRPedidosProntosCOD_PEDIDO_CAB.Text + ' esta com algum item inválido. Verifique o pedido e refaça esta operação.');
    QRPedidosProntos.close;
  end
  else
  begin
    wQuantidade := DMOracle.BuscaNome('SELECT SUM(QT_PEDIDO) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+QRPedidosProntosCOD_PEDIDO_CAB.Text);
    wPeso := DMOracle.BuscaNome('SELECT NUM_METROS_CUBICOS FROM TB_PRODUTO','COD_PRODUTO='+wProduto);
    if wPeso = '' then
      wPeso := '0';
    QRPedidosProntosdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ wProduto);
    QRPedidosProntosval_peso.Value := StrToFloat(wPeso) * StrToFloat(wQuantidade);
  end;
end;

procedure TDMEmbarque.QrEmbarque_Ped_NfCalcFields(DataSet: TDataSet);
Var
wProduto : string;
begin
  wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PEDIDO_ITEM ',' COD_PEDIDO_CAB='+QrEmbarque_Ped_NfNUM_PEDIDO.Text);
  if wProduto <> '' then
    QrEmbarque_Ped_Nfpeso.Value := StrTOFloat(DMOracle.buscaNome('SELECT nvl(NUM_METROS_CUBICOS,0) FROM TB_PRODUTO','COD_PRODUTO='+wProduto));
end;

procedure TDMEmbarque.QREmbarquePedidoCalcFields(DataSet: TDataSet);
begin
  QREmbarquePedidoqt_itens.Text := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB='+QREmbarquePedidoCOD_PEDIDO_CAB.Text);
end;

end.
