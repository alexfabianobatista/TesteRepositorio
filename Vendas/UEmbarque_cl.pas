Unit UEmbarque_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle, Menus, variants, DBClient;

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
    QREmbarquePedidoCOD_CADASTRO: TIntegerField;
    QREmbarquePedidoNOME: TStringField;
    QREmbarquePedidoDT_EMISSAO: TDateTimeField;
    QREmbarquePedidoDESC_OBSERVACAO: TStringField;
    QREmbarquePedidoNUM_PEDIDO: TIntegerField;
    QREmbarquePedidoSQT_PEDIDO: TFloatField;
    QREmbarquePedidoVAL_UNITARIO: TFloatField;
    QREmbarquePedidoPERC_DESCONTO: TFloatField;
    QREmbarquePedidoPERC_DESCONTO1: TFloatField;
    QREmbarquePedidoPERC_DESCONTO2: TFloatField;
    QREmbarquePedidoPERC_ACRESCIMO: TFloatField;
    QREmbarquePedidoval_total: TFloatField;
    QREmbarqueBaixado: TOracleDataSet1;
    QREmbarqueBaixadoCOD_EMBARQUE: TIntegerField;
    QREmbarqueBaixadoDT_ATUALIZA_ESTOQUE: TDateTimeField;
    QRProdutoEmbarcado: TOracleDataSet1;
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
    QREmbarqueDESC_PRODUTO: TStringField;
    QREmbarque2DESC_PRODUTO: TStringField;
    QREmbarquePedidoDESC_PRODUTO: TStringField;
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
    QRControleCargasCOD_EMBARQUE: TFloatField;
    QRControleCargasNUM_EMBARQUE: TFloatField;
    QRControleCargasDT_EMBARQUE: TDateTimeField;
    QRControleCargasNOME_MOTORISTA: TStringField;
    QRControleCargasCOD_TRANSPORTADOR: TFloatField;
    QRControleCargasDESC_PLACA: TStringField;
    QRControleCargasDESC_DESTINO_FRETE: TStringField;
    QRControleCargasSQT_VALOR: TFloatField;
    QRControleCargasSVL_BRINDE: TFloatField;
    QRControleCargasSVL_BONIFICACAO: TFloatField;
    QREtiqCodBarraEmbarqueNUM_VOLUMES: TFloatField;
    QREtiqCodBarraProducaoNUM_VOLUMES: TFloatField;
    QBaixaEstoqueLeitorQT_EMBALAGEM: TFloatField;
    QEmbarqueCOD_EMBARQUE: TIntegerField;
    QEmbarqueDT_EMBARQUE: TDateTimeField;
    QEmbarqueNOME_MOTORISTA: TStringField;
    QEmbarqueCOD_TRANSPORTADOR: TIntegerField;
    QEmbarqueNUM_KILOMETRAGEM: TStringField;
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
    QEstoqueEmbarcadoDT_EMBARQUE: TDateTimeField;
    QREmbarquePedidoDT_FATURAMENTO: TDateTimeField;
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
    QEstoqueEmbarcadoQT_PESO_EMBARCADO: TFloatField;
    QEstoqueEmbarcadoNUM_CONTROLE: TIntegerField;
    QREmbarqueQT_QUANTIDADE_AUX: TFloatField;
    QREmbarqueQT_EMBALAGEM: TFloatField;
    QRProdutoEmbarcado2COD_EMBARQUE: TIntegerField;
    QRProdutoEmbarcado2COD_PRODUTO: TIntegerField;
    QRProdutoEmbarcado2DESC_PRODUTO: TStringField;
    QRProdutoEmbarcado2COD_PEDIDO_CAB: TIntegerField;
    QRProdutoEmbarcado2NUM_CONTROLE: TIntegerField;
    QRProdutoEmbarcado2QT_EMBARCADO: TFloatField;
    QRProdutoEmbarcado2QT_PESO: TFloatField;
    QRProdutoEmbarcado2DT_EMBARQUE: TDateTimeField;
    QRProdutoEmbarcado2NOME_MOTORISTA: TStringField;
    QRProdutoEmbarcado2COD_CADASTRO: TIntegerField;
    QRProdutoEmbarcado2NOME: TStringField;
    QRProdutoEmbarcado2DT_FABRICACAO: TDateTimeField;
    QRProdutoEmbarcado2COD_LOTE_TIPO: TIntegerField;
    QREmbarqueTemperatura: TOracleDataSet1;
    QREmbarqueTemperaturaDESC_CLASSE: TStringField;
    QREmbarqueTemperaturaCOD_EMBARQUE: TIntegerField;
    QREmbarqueTemperaturaDT_EMBARQUE: TDateTimeField;
    QREmbarqueTemperaturaCOD_PRODUTO: TFloatField;
    QREmbarqueTemperaturaDESC_PRODUTO: TStringField;
    QREmbarqueTemperaturaNUM_EMBALAGEM: TFloatField;
    QREmbarqueTemperaturaDESC_UNIDADE: TStringField;
    QREmbarqueTemperaturaNUM_VOLUMES: TFloatField;
    QREmbarqueTemperaturaDESC_LOTE: TStringField;
    QREmbarqueTemperaturaDESC_TEMPERATURA: TStringField;
    QrEmbarque_Ped_NfSPESO_BRUTO: TFloatField;
    QRPedidoEmbarcado: TOracleDataSet1;
    QRPedidoEmbarcadoCOD_EMBARQUE: TIntegerField;
    QRPedidoEmbarcadoDT_EMBARQUE: TDateTimeField;
    QRPedidoEmbarcadoCOD_PEDIDO_CAB: TIntegerField;
    QRPedidoEmbarcadoNUM_PEDIDO: TIntegerField;
    QRPedidoEmbarcadoDT_PEDIDO: TDateTimeField;
    QRPedidoEmbarcadoQT_LIQ: TFloatField;
    QRPedidoEmbarcadoQT_BRUTO: TFloatField;
    QRPedidoEmbarcadoVAL_LIQ: TFloatField;
    QRPedidoEmbarcadoCADASTRO: TStringField;
    QEmbarqueIND_CONFERIDO_MOTORISTA: TStringField;
    QRBaixaEstoqueLeitorNUM_VOLUMES: TFloatField;
    QREmbarqueCOD_EMBARQUE: TIntegerField;
    CDSCodigoBarraComando: TClientDataSet;
    CDSCodigoBarraComandoCODIGO: TStringField;
    CDSCodigoBarraComandoDESCRICAO: TStringField;
    QREmbarqueIND_CONFERIDO_MOTORISTA: TStringField;
    QRBaixaEstoqueLeitorCOD_PEDIDO_CAB: TIntegerField;
    DSBaixaEstoqueLeitor: TDataSource;
    QRBaixaEstoqueLeitorpeso_medio: TFloatField;
    QRBaixaEstoqueLeitorind_situacao: TIntegerField;
    QRBaixaEstoqueLeitortotal_vol: TIntegerField;
    QREmbarqueDESC_TECIDO: TStringField;
    QREmbarqueNOME_VENDEDOR: TStringField;
    QREmbarqueDT_PREV_RETORNO: TDateTimeField;
    QREmbarqueDT_EMBARQUE: TDateTimeField;
    QREmbarqueDESC_VEICULO: TStringField;
    QREmbarqueDESC_CHASSI: TStringField;
    QEmbarqueDESC_OBS: TStringField;
    QEmbarqueDESC_OBS1: TStringField;
    QREmbarque2DESC_OBS: TStringField;
    QREmbarque2DESC_OBS1: TStringField;
    QEmbarqueDESC_OBS2: TStringField;
    QEmbarqueDESC_OBS3: TStringField;
    QEmbarqueDESC_OBS4: TStringField;
    QREmbarqueDESC_OBS_EMBARQUE: TStringField;
    QREmbarqueDESC_FANTASIA: TStringField;
    QREmbarqueCOD_PRAZO_VENCIMENTO: TIntegerField;
    QREmbarqueDESC_PRAZO_VENCIMENTO: TStringField;
    QEmbarqueItemcidade_cliente: TStringField;
    QRQtdeEntregas: TOracleDataSet1;
    QRQtdeEntregasCOD_CADASTRO: TIntegerField;
    QRQtdeEntregasENTREGAS: TFloatField;
    QREmbarqueRes: TOracleDataSet1;
    QREmbarquePrazVcto: TOracleDataSet1;
    QREmbarqueProduto: TOracleDataSet1;
    QREmbarqueProdutoCOD_PRODUTO: TFloatField;
    QREmbarqueProdutoDESC_PRODUTO: TStringField;
    QREmbarqueProdutoQT_PEDIDO: TFloatField;
    QREmbarqueProdutoNUM_PESO_BRUTO: TFloatField;
    QREmbarqueProdutoNUM_PESO_LIQUIDO: TFloatField;
    QREmbarqueProdutoVAL_TOTAL: TFloatField;
    QREmbarqueProdutoCOD_EMBARQUE: TIntegerField;
    QREmbarqueProdutoDT_EMBARQUE: TDateTimeField;
    QREmbarqueProdutoNOME: TStringField;
    QREmbarqueResCOD_EMBARQUE: TIntegerField;
    QREmbarqueResNOME: TStringField;
    QREmbarqueResDESC_CIDADE: TStringField;
    QREmbarqueResDESC_PRAZO_VENCIMENTO: TStringField;
    QREmbarqueResNUM_PESO_BRUTO: TFloatField;
    QREmbarqueResVAL_TOTAL: TFloatField;
    QREmbarqueVAL_ICMS_SUBST: TFloatField;
    QRProdutoEmbarcadoCOD_PRODUTO: TFloatField;
    QRProdutoEmbarcadoDESC_PRODUTO: TStringField;
    QRProdutoEmbarcadoCOD_CLASSE: TIntegerField;
    QRProdutoEmbarcadoDESC_CLASSE: TStringField;
    QRProdutoEmbarcadoQT_QUANTIDADE: TFloatField;
    QEmbarque_EmiteNotaCOD_CFOP: TIntegerField;
    QEmbarque_EmiteNotaCOD_CST_PIS: TStringField;
    QEmbarque_EmiteNotaCOD_CST_COFINS: TStringField;
    QREmbarque2NUM_PESO_BRUTO: TFloatField;
    QREmbarque2QT_EMBALAGEM: TFloatField;
    QEmbarque_EmiteNotaQT_EMBALAGEM: TFloatField;
    QNotasEmbarque: TOracleDataSet1;
    QNotasEmbarqueCOD_NOTA_CAB: TIntegerField;
    QNotasEmbarqueDESC_CHAVE_ACESSO: TStringField;
    QNotasEmbarqueCOD_SERIE_MODELO: TStringField;
    QNotasEmbarqueCOD_SERIE: TStringField;
    QNotasEmbarqueNUM_PESO_BRUTO: TFloatField;
    QNotasEmbarqueSVAL_TOTAL: TFloatField;
    QNotasEmbarqueCOD_CIDADE: TIntegerField;
    QREmbarqueResNUM_PEDIDO_NOTA: TIntegerField;
    QREmbarque2NUM_PESO_LIQUIDO: TFloatField;
    QREmbarqueCOD_OPERACAO: TIntegerField;
    QEmbarqueConsDESC_OBS: TStringField;
    QEmbarque_EmiteNotaIND_CONSUMIDOR_FINAL: TStringField;
    QEmbarqueItensPedCOD_PRODUTO: TFloatField;
    QEmbarqueItensPedCOD_LOTE_TIPO: TIntegerField;
    QEmbarqueItensPedQT_PEDIDO: TFloatField;
    QEmbarqueItensPedCOD_FILIAL: TIntegerField;
    QEmbarqueItensPedQT_QUANTIDADE_AUX: TFloatField;
    QEmbarqueItensPedCOD_PEDIDO_CAB: TIntegerField;
    QREmbarqueProdutoNUM_METROS_CUBICOS: TFloatField;
    QREmbarqueCOD_TRIBUTACAO: TIntegerField;
    QREmbarqueIMG_IMAGEM: TBlobField;
    QRRelacaoProducao: TOracleDataSet1;
    QRRelacaoProducaoCOD_PRODUTO: TIntegerField;
    QRRelacaoProducaoQT_ITEM: TFloatField;
    QRRelacaoProducaodesc_produto: TStringField;
    QRRelacaoProducaoQtdePedido: TOracleDataSet1;
    QRRelacaoProducaoQtdePedidoCOD_PRODUTO: TFloatField;
    QRRelacaoProducaoQtdePedidoDESC_PRODUTO: TStringField;
    QRRelacaoProducaoQtdePedidoQT_ITEM: TFloatField;
    QREmbarqueResNUM_NOTA: TFloatField;
    QREmbarqueCargaDESC_OBS: TStringField;
    QREmbarque2SQT_ESTOQUE: TFloatField;
    QCaixaEmbarque: TOracleDataSet1;
    QCaixaEmbarqueCOD_CAIXA_MOV: TIntegerField;
    QCaixaEmbarqueCOD_USUARIO: TIntegerField;
    QCaixaEmbarqueCOD_FILIAL: TIntegerField;
    QCaixaEmbarqueCOD_DEPARTAMENTO: TIntegerField;
    QCaixaEmbarqueCOD_HISTORICO: TIntegerField;
    QCaixaEmbarqueDT_MOVIMENTO: TDateTimeField;
    QCaixaEmbarqueVAL_MOVIMENTO: TFloatField;
    QCaixaEmbarqueDESC_HORARIO: TStringField;
    QCaixaEmbarqueCOD_CADASTRO: TIntegerField;
    QCaixaEmbarqueCOD_NOTA_CAB: TIntegerField;
    QCaixaEmbarqueCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixaEmbarqueCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixaEmbarqueDT_USUARIO: TDateTimeField;
    QCaixaEmbarqueDESC_COMPLEMENTO: TStringField;
    QCaixaEmbarqueCOD_CONTRATO_MOV: TIntegerField;
    QCaixaEmbarqueCOD_BCO_MOVIMENTO: TIntegerField;
    QCaixaEmbarqueDESC_COMPLEMENTO1: TStringField;
    QCaixaEmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QCaixaEmbarqueCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QCaixaEmbarqueCOD_OFICINA_CAB: TIntegerField;
    QCaixaEmbarqueNUM_OS: TIntegerField;
    QCaixaEmbarqueNUM_DOC: TIntegerField;
    QCaixaEmbarqueNUM_DOCUMENTO: TFloatField;
    QCaixaEmbarqueCOD_CONHECIMENTO: TIntegerField;
    QCaixaEmbarqueCOD_IMOVEL: TIntegerField;
    QCaixaEmbarqueIND_DESCONTA_LOCATARIO: TStringField;
    QCaixaEmbarqueCOD_ADIANTAMENTO: TIntegerField;
    QCaixaEmbarqueCOD_VALE_PRODUTO: TIntegerField;
    QCaixaEmbarqueCOD_CONTRATO_OBRA: TIntegerField;
    QCaixaEmbarqueCOD_EMBARQUE: TIntegerField;
    QEmbarqueConsNUM_EMBARQUE: TIntegerField;
    QREmbarquePesoCidade: TOracleDataSet1;
    QREmbarquePesoCidadeDESC_CIDADE: TStringField;
    QREmbarquePesoCidadeNUM_PESO_BRUTO: TFloatField;
    QEmbarqueDT_FECHAMENTO_MAXIMA: TDateTimeField;
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
    procedure QREmbarquePedidoCalcFields(DataSet: TDataSet);
    procedure QEmbarqueBeforePost(DataSet: TDataSet);
    procedure QEmbarqueAfterEdit(DataSet: TDataSet);
    procedure QEmbarqueBeforeDelete(DataSet: TDataSet);
    procedure QRFretesCalcFields(DataSet: TDataSet);
    procedure QRPedido_VendedorCalcFields(DataSet: TDataSet);
    procedure QREstoqueEmbarqueCalcFields(DataSet: TDataSet);
    procedure QEmbarqueAfterDelete(DataSet: TDataSet);
    procedure QEmbarqueDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure QEmbarqueAfterOpen(DataSet: TDataSet);
    procedure QRBaixaEstoqueLeitorCalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemCOD_PEDIDO_CABChange(Sender: TField);
    procedure QREmbarqueResCalcFields(DataSet: TDataSet);
    procedure QRRelacaoProducaoCalcFields(DataSet: TDataSet);
    procedure QCaixaEmbarqueBeforePost(DataSet: TDataSet);
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
  OldSeq: Integer;

const
  SIT_ITEM_EMBARQUE_PENDENTE: Integer = 1;
  SIT_ITEM_EMBARQUE_ATENDIDO: Integer = 2;
  SIT_ITEM_EMBARQUE_EXCEDIDO: Integer = 3;

implementation

uses UOracle_cl, UParamSistema_cl, USequencia_cl,
  UUsuario_cl, UOficinaPassword, UPedido_cl;

{$R *.DFM}

function TDMEmbarque.SenhaLiberaCadastro(): boolean;
begin
  //if FOficinaPassword = nil then
 //    FOficinaPassword := FOficinaPassword.Create(Application);
 // if FOficinaPassword.ShowModal = mrOk then
 // begin
 //   if (UpperCase(FOficinaPassword.Password.Text) = UpperCase(DMParamSistema.QParamSistemaDesc_Senha_Oficina.Text))then
 //      result := true
 //   else
 //      result := false;
 // end
//  else
 //    result := false;
end;

procedure TDMEmbarque.QEmbarqueAfterInsert(DataSet: TDataSet);
begin
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;

  QEmbarqueVAL_MANIFESTO.value := 0;

  if(DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI')then
    DMEmbarque.QEmbarqueIND_CONFERIDO_MOTORISTA.Value := 'S'; //fixar conferido pelo motorista = sim. Vanessa 30-01-2014
end;

procedure TDMEmbarque.QEmbarqueBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction Then
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
  DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET IND_SITUACAO = ' + QuotedStr('1') +
    ', STEP_PEDIDO_WEB = 2, LOCAL_ULTIMA_ALTERACAO = ' + QuotedStr('CEMAPA') +
    ' WHERE COD_PEDIDO_CAB = ' + QEmbarqueItemCOD_PEDIDO_CAB.Text +   
    ' AND IND_SITUACAO = ' + QuotedStr('3'), False);
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
  QEmbarqueItemnum_pedido.Value := DMOracle.BuscaNome('SELECT NUM_PEDIDO FROM TB_PEDIDO_CAB',
                                   'COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueItemnome_cliente.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO, TB_PEDIDO_CAB',
                                     'TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
                                    +' AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueItemcidade_cliente.Value := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO, TB_PEDIDO_CAB',
                                    'TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
                                    +' AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));

  QEmbarqueSoma.Close;
  QEmbarqueSoma.Open;
                                    
end;

procedure TDMEmbarque.QEmbarqueItemAfterPost(DataSet: TDataSet);
var
  Int: Integer;
begin
  //---ALTERA SITUACAO DO PEDIDO PARA S = EMBARCADO
  OPEmbarque.CallProcedure('SITUACAO_PEDIDO',['S',QEmbarqueItemCOD_PEDIDO_CAB.Value]);
  DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET IND_SITUACAO = ' + QuotedStr('3') +
    ', STEP_PEDIDO_WEB = 3, LOCAL_ULTIMA_ALTERACAO = ' + QuotedStr('CEMAPA') +
    ' WHERE COD_PEDIDO_CAB = ' + QEmbarqueItemCOD_PEDIDO_CAB.Text +  
    ' AND IND_SITUACAO = ' + QuotedStr('1'), False);
  try
    OPEmbarque.CallProcedure('SEQUENCIAL_EMB_ITEM',[OldSeq,
        QEmbarqueItemNUM_SEQUENCIAL.Value,QEmbarqueItemCOD_EMBARQUE.Value,
        QEmbarqueItemCOD_PEDIDO_CAB.Value]);
  except
  end;
  Int := QEmbarqueItemNUM_SEQUENCIAL.Value;
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;
  while not ((QEmbarqueItem.Eof) or (QEmbarqueItemNUM_SEQUENCIAL.Value = Int)) do
    QEmbarqueItem.Next;
end;

procedure TDMEmbarque.QEmbarqueAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
//  if DMParamSistema.CodEmpresa = 'ABATE' then //Dando commit após gerar numero da sequencia para nao dar "Record is locked by another user".
//  begin
//    if DMOracle.DBCemapa.InTransaction then
//      DMOracle.DBCemapa.Commit;
//    DMOracle.DBCemapa.StartTransaction;
//  end;
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
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' Then
  Begin
    QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2NUM_PESO_BRUTO.Value;
    QREmbarque2Sqt_Embalagem_Liq.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Embalagem.Value;
  end
  else if DMParamSistema.CodEmpresa = 'DEION' then
  begin
    QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2NUM_PESO_BRUTO.Value;
    QREmbarque2Sqt_Embalagem_Liq.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2NUM_PESO_LIQUIDO.Value;
  end
  else
  Begin
    QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Volumes.Value;
    QREmbarque2Sqt_Embalagem_Liq.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Embalagem.Value;
  end;
end;

procedure TDMEmbarque.QSomaNF2CalcFields(DataSet: TDataSet);
begin
  QSomaNF2sVal_Total.Value := (QSomaNF2VAL_AVISTA.Value + QSomaNF2VAL_APRAZO.Value +
                               QSomaNF2VAL_OUTROS.Value + QSomaImpostosVal_Imposto.Value);
end;

procedure TDMEmbarque.QEmbarqueItemBeforePost(DataSet: TDataSet);
Var wNumero,wCadastro, wLibera, wDtVencto  : String;
wVal_limite:real;
begin

//  if DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_PEDIDO_CAB', 'COD_PEDIDO_CAB = ' + QEmbarqueItemCOD_PEDIDO_CAB.Text) <> 'SIM' then
//    raise Exception.create('Pedido não liberado.');

  If QEmbarqueItemNUM_SEQUENCIAL.Text = '' Then
  Begin
    wNumero:=DMOracle.BuscaNome('SELECT MAX(NUM_SEQUENCIAL) FROM TB_EMBARQUE_ITEM',
                                 'COD_EMBARQUE = '+FloatToStr(QEmbarqueItemCod_Embarque.Value));

    QEmbarqueItemNum_Sequencial.Value := StrToInt('0'+wNumero) + 1
//    If wNumero <> '' Then
//      QEmbarqueItemNum_Sequencial.Value := StrToInt(wNumero) + 1
//    else
//      QEmbarqueItemNum_Sequencial.Value := 1;
  end;
  try
    OldSeq := QEmbarqueItemNUM_SEQUENCIAL.OldValue;
  except
    OldSeq := 0;
  end;

  If Trim(DMEmbarque.QEmbarqueItemCOD_PEDIDO_CAB.Text) <> '' Then
  begin
    wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCOD_PEDIDO_CAB.Text);
    If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro)) <> '' then
      raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
    If DMOracle.BuscaNome('SELECT TB_PRODUTO.COD_PRODUTO FROM TB_PRODUTO,TB_PEDIDO_ITEM',
                                'TB_PRODUTO.COD_PRODUTO=TB_PEDIDO_ITEM.COD_PRODUTO AND TB_PRODUTO.IND_SITUACAO <>' +Chr(39) + 'ATIVO' + Chr(39) +
                                ' AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB = '+Trim(DMEmbarque.QEmbarqueItemCOD_PEDIDO_CAB.Text)) <> '' Then
    raise exception.Create('ATENÇÃO - Pedido Possui Produtos Que Não Estão Ativos!');
  end;
  //Validação para não permitir fazer o embarque para clientes que estão em débito. - Pedido de Giovani, empresa MARICOTA
  if (Trim(DMEmbarque.QEmbarqueItemCOD_PEDIDO_CAB.Text) <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA') then
   begin
    wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO',' COD_CADASTRO = ' + wCadastro);
    wVal_limite := StrToFloat(DMOracle.BuscaNome('SELECT VAL_LIMITE FROM TB_CADASTRO',  ' COD_CADASTRO = '+wCadastro));
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + wCadastro + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    if wDtVencto <> '' then //em caso de não haver contas a receber em aberto.
    begin
      if (wVal_Limite = 0) and ((wLibera = 'NAO') and (StrToDate(wDtVencto) < Date)) then
      begin
        raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
      end;
    end;
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

procedure TDMEmbarque.QREmbarquePedidoCalcFields(DataSet: TDataSet);
begin
  QREmbarquePedidoVal_Total.Value := QREmbarquePedidosQt_Pedido.Value *
                                     QREmbarquePedidoVal_Unitario.Value;
  If QREmbarquePedidoPerc_Desconto.Value > 0 Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto.Value / 100);
  If QREmbarquePedidoPerc_Desconto1.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto1.Value / 100);
  If QREmbarquePedidoPerc_Desconto2.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto2.Value / 100);
  If QREmbarquePedidoPerc_Acrescimo.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value +
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Acrescimo.Value / 100);
end;

procedure TDMEmbarque.QEmbarqueBeforePost(DataSet: TDataSet);
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' Then
     QEmbarqueNUM_EMBARQUE.Value := QEmbarqueCOD_EMBARQUE.Value
  Else
     if QEmbarqueNUM_EMBARQUE.Text = '' Then
       QEmbarqueNUM_EMBARQUE.Value:=DMSequencia.Sequencia(Trunc(1),'EMBARQUE');
  QEmbarqueCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QEmbarqueDt_Usuario.Value := DMOracle.DataHoraServ;
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
       Exit;
     end;
  // Apaga registros vinculados
  QEmbarqueItem.First;
  while not QEmbarqueItem.Eof do
  begin
    QEmbarque.Edit;
    QEmbarqueItem.Delete;
    QEmbarque.Post;
  end;
  QCaixaEmbarque.First;
  while not QCaixaEmbarque.Eof do
    QCaixaEmbarque.Delete;
end;

procedure TDMEmbarque.QRFretesCalcFields(DataSet: TDataSet);
//var
//  wSQL,wSQLWhere:String;
begin
  if Trim(QRFretesCod_Embarque.Text) <> '' then
  begin
    QRFretesqt_entregas.Value := StrToInt('0'+DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_EMBARQUE_ITEM','COD_EMBARQUE = '+
                                                     Trim(QRFretesCod_Embarque.Text)));

{  wSQL:='SELECT '+
          'SUM(DECODE(Tb_pedido_item.QT_PEDIDO,0,Tb_pedido_item.VAL_UNITARIO,(Tb_pedido_item.QT_PEDIDO '+
           '   -Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARIO '+
           '   -(((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.VAL_UNITARIO)*Tb_pedido_item.perc_desconto/100)) '+
           '   -((Tb_pedido_item.QT_PEDIDO-Tb_pedido_item.QT_CANCELADO) * Tb_pedido_item.Val_Desconto)) AS VAL_CARGA '+
        'FROM '+
          'TB_EMBARQUE, '+
          'TB_EMBARQUE_ITEM, '+
          'TB_PEDIDO_CAB, '+
          'TB_PEDIDO_ITEM,TB_OPERACAO ';
  wSQLWhere:=
          'Tb_embarque_item.COD_EMBARQUE = Tb_embarque.COD_EMBARQUE '+
          'AND Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB '+
          'AND Tb_pedido_cab.COD_PEDIDO_CAB = Tb_pedido_item.COD_PEDIDO_CAB '+
          'AND Tb_pedido_cab.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO '+
          'AND Tb_operacao.IND_VENDAS = '+Chr(39) + 'V' + Chr(39) +
          ' AND TB_EMBARQUE.COD_EMBARQUE = '+Trim(QRFretesCod_Embarque.Text);
  QRFretesVal_Carga.Value:= StrToFloat('0'+DMOracle.BuscaNome(wSQL,wSQLWhere));
}
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

procedure TDMEmbarque.QEmbarqueAfterDelete(DataSet: TDataSet);
begin
    DMOracle.DBCemapa.Commit;
end;

procedure TDMEmbarque.QEmbarqueDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;

end;

procedure TDMEmbarque.QEmbarqueAfterOpen(DataSet: TDataSet);
begin
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;
end;

procedure TDMEmbarque.QRBaixaEstoqueLeitorCalcFields(DataSet: TDataSet);
var
  wDif: Integer;
begin
  QRBaixaEstoqueLeitorpeso_medio.Value := 0;
  if QRBaixaEstoqueLeitorQT_EMBALAGEM.Value > 0 then
    QRBaixaEstoqueLeitorpeso_medio.Value := QRBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value /
      QRBaixaEstoqueLeitorQT_EMBALAGEM.Value;
  QRBaixaEstoqueLeitortotal_vol.Value := 0;
  if QRBaixaEstoqueLeitorpeso_medio.Value > 0 then
    QRBaixaEstoqueLeitortotal_vol.Value := Round(QRBaixaEstoqueLeitorQT_PEDIDO.Value /
      QRBaixaEstoqueLeitorpeso_medio.Value);
  QRBaixaEstoqueLeitorind_situacao.Value := SIT_ITEM_EMBARQUE_PENDENTE;
  if QRBaixaEstoqueLeitortotal_vol.Value > 0 then
  begin
    wDif := Trunc(QRBaixaEstoqueLeitortotal_vol.Value -
      QRBaixaEstoqueLeitorQT_EMBALAGEM.Value);
    if (wDif < 0) then
      QRBaixaEstoqueLeitorind_situacao.Value := SIT_ITEM_EMBARQUE_EXCEDIDO
    else if (wDif <= 2) then
      QRBaixaEstoqueLeitorind_situacao.Value := SIT_ITEM_EMBARQUE_ATENDIDO;
  end;
end;

procedure TDMEmbarque.QEmbarqueItemCOD_PEDIDO_CABChange(Sender: TField);
begin
  //--Adicionar a observacao do Pedido no Embarque para a Marticar. Vanessa 16/10/2013
  // Foi tirado esse trecho da código da consulta de Pedido. Vanessa 17/02/2014
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'MARTICAR' then
  begin
    DMEmbarque.QEmbarqueDESC_OBS.Text := DMPedido.QPedidoConsDESC_OBSERVACAO.Text;
    DMEmbarque.QEmbarqueDESC_OBS1.Text := DMPedido.QPedidoConsDESC_COMPLEMENTO_OBS.Text;
    DMEmbarque.QEmbarqueDESC_OBS2.Text := DMPedido.QPedidoConsDESC_COMPLEMENTO_OBS2.Text;
  end;
  //--
end;

procedure TDMEmbarque.QREmbarqueResCalcFields(DataSet: TDataSet);
begin
//   if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZAPOLI') or
//       (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MARICOTA')) then
//    QREmbarqueResnum_nota.Text := DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB',
//                                   'NUM_PEDIDO = '+FloatToStr(QREmbarqueResNUM_PEDIDO_NOTA.Value))
//   else
//    QREmbarqueResnum_nota.Text := '';
end;

procedure TDMEmbarque.QRRelacaoProducaoCalcFields(DataSet: TDataSet);
begin
  QRRelacaoProducaodesc_produto.Value := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' +
                                      QRRelacaoProducaoCOD_PRODUTO.Text);

end;

procedure TDMEmbarque.QCaixaEmbarqueBeforePost(DataSet: TDataSet);
begin
  QCaixaEmbarqueCOD_EMBARQUE.Value := QEmbarqueCOD_EMBARQUE.Value;
  QCaixaEmbarqueCOD_USUARIO.Value := QEmbarqueCOD_USUARIO.Value;
  QCaixaEmbarqueDT_MOVIMENTO.Value := QEmbarqueDT_EMBARQUE.Value;
  QCaixaEmbarqueDT_USUARIO.Text := FormatDateTime('dd/mm/yyyy', QEmbarqueDT_USUARIO.Value);
end;

end.
