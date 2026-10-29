unit UPedido_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPedido = class(TDataModule)
    DSPedidoCons: TDataSource;
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
    QPedidonome_filial: TStringField;
    QPedidonome_cadastro: TStringField;
    QPedidonome_operacao: TStringField;
    QPedidonome_vendedor: TStringField;
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
    QRPedAbertoDESC_PRODUTO: TStringField;
    QRPedAbertoQT_SALDO: TFloatField;
    QRPedAbertoSVAL_TOTAL: TFloatField;
    QRPedAbertonome_vendedor: TStringField;
    QRPedProduto: TOracleDataSet1;
    QRPedProdutoCOD_PRODUTO: TFloatField;
    QRPedProdutoDESC_PRODUTO: TStringField;
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
    QRPedAberto_VencDESC_PRODUTO: TStringField;
    QRPedAberto_VencDT_VENCIMENTO: TDateTimeField;
    QRPedAberto_VencQT_SALDO: TFloatField;
    QRPedAberto_VencSVAL_TOTAL: TFloatField;
    QRPedido_Preco_Medio: TOracleDataSet1;
    QRPedido: TOracleDataSet1;
    QRPedidoCOD_ESTADO: TStringField;
    QRPedidoDESC_ENDERECO: TStringField;
    QRPedidoDESC_CIDADE: TStringField;
    QRPedidoDESC_CEP: TStringField;
    QRPedidoNUM_INSCRICAO: TStringField;
    QRPedidoDESC_TELEFONE: TStringField;
    QRPedidoDESC_BAIRRO: TStringField;
    QRPedidoNUM_CGC_CPF: TStringField;
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
    QPedidoItemqrquantidade: TFloatField;
    QRPedidoEstoque: TOracleDataSet1;
    QRPedidoEstoqueCOD_PRODUTO: TFloatField;
    QRPedidoEstoqueDESC_PRODUTO: TStringField;
    QRPedidoEstoqueNUM_EMBALAGEM: TFloatField;
    QRPedidoEstoqueSQT_SALDO: TFloatField;
    QRPedidoEstoqueqt_estoque: TFloatField;
    QPedidoCOD_PRODUTO: TFloatField;
    QPedidoQT_QUANTIDADE: TFloatField;
    QPedidodesc_produto: TStringField;
    QRPedido_BaseTroca: TOracleDataSet1;
    QRPedido_BaseTrocaDESC_PRODUTO: TStringField;
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
    QPedidoEstoqueDESC_PRODUTO: TStringField;
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
    QRPedidoComNotaNUM_PEDIDO: TFloatField;
    QRPedidoComNotaCOD_PEDIDO_CAB: TFloatField;
    QRPedidoComNotaDT_EMISSAO_PEDIDO: TDateTimeField;
    QRPedidoComNotaDT_ENTREGA: TDateTimeField;
    QRPedidoComNotaNOME: TStringField;
    QRPedidoComNotaNUM_NOTA: TFloatField;
    QRPedidoComNotaDT_EMISSAO: TDateTimeField;
    QRPedidoComNotaDESC_TRANSPORTADORA: TStringField;
    QRPedidoComNotaind_situacao: TStringField;
    QPedidoItemVAL_DESCONTO: TFloatField;
    QRPedAbertoIND_TIPO_PAGAMENTO: TStringField;
    QPedidoCOD_CULTURA: TIntegerField;
    QRPedidoPERC_COMISSAO: TFloatField;
    QRPedAbertoCOD_OPERACAO: TIntegerField;
    QPedidoDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidoConsDT_ENTREGA: TDateTimeField;
    QPedidoConsDT_ENTREGA_PRORROGADA: TDateTimeField;
    QRPedidoEstoqueQT_SALDO_OC: TFloatField;
    QRPedidoEstoqueTOTAL_PEDIDO: TFloatField;
    QRPedidoEstoqueTOTAL_OC: TFloatField;
    QPedidoNR_DIAS_CHEQUE4: TIntegerField;
    QRPedido_Preco_MedioCOD_PRODUTO: TFloatField;
    QRPedido_Preco_MedioDESC_PRODUTO: TStringField;
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
    QRPedidoValorDESC_PRODUTO: TStringField;
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
    QRPedidoCustoDESC_PRODUTO: TStringField;
    QRPedidoCustoVL_CUSTO_MEDIO: TFloatField;
    QRPedidoCustoQT_PEDIDO: TFloatField;
    QRPedidoCustoVAL_TOTAL: TFloatField;
    QRPedidoCustoCUSTO_TOTAL: TFloatField;
    QRComissaoPed: TOracleDataSet1;
    QRComissaoPedDESC_PRODUTO: TStringField;
    QRComissaoPedCOD_VENDEDOR: TIntegerField;
    QRComissaoPedNOME_VENDEDOR: TStringField;
    QRComissaoPedPERC_IRRF: TFloatField;
    QRComissaoPedCOD_FILIAL: TIntegerField;
    QRComissaoPedDESC_FILIAL: TStringField;
    QRComissaoPedCOD_PRODUTO: TFloatField;
    QRComissaoPedPERC_COMISSAO_ITEM: TFloatField;
    QRComissaoPedPERC_COMISSAO_PEDIDO: TFloatField;
    QRComissaoPedSQT_QUANTIDADE: TFloatField;
    QRComissaoPedSVAL_TOTAL: TFloatField;
    QPedidoNUM_PALM: TIntegerField;
    QPedidoVAL_ENTRADA: TFloatField;
    QSomaPedidoSTOTAL_PEDIDO_LIQ: TFloatField;
    QRPedidoDESC_CELULAR: TStringField;
    procedure QPedidoCalcFields(DataSet: TDataSet);
    procedure QPedidoAfterInsert(DataSet: TDataSet);
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
    procedure QPedidoItemBeforePost(DataSet: TDataSet);
    procedure QPedidoCOD_OPERACAOValidate(Sender: TField);
    procedure QRPedidoValorCalcFields(DataSet: TDataSet);
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
     UProduto_cl,UBiblioteca, UOperacao_cl;

{$R *.DFM}

procedure TDMPedido.QPedidoCalcFields(DataSet: TDataSet);
begin
  QPedidonome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QPedidoCod_Filial.Value));
  QPedidonome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
  QPedidonome_operacao.Value := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QPedidoCod_Operacao.Value));
  QPedidonome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QPedidoCod_Vendedor.Value));
  QPedidodesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoCod_Produto.Value));
end;

procedure TDMPedido.QPedidoAfterInsert(DataSet: TDataSet);
begin
  QPedidoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QPedidoDt_Sistema.Value := DMOracle.DataHoraServ;
  QPedidoPerc_Comissao.Value:= wComissao_Ant;
  QPedidoDt_Emissao.Value := wDtEmissao_Ant;
  QPedidoItem.Close;
  QPedidoItem.Open;
end;

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
  QPedidoItemVal_Unitario.Value := wVal_Unitario_Ant;
end;

procedure TDMPedido.QPedidoItemCalcFields(DataSet: TDataSet);
begin
  QPedidoItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
  If QPedidoItemQt_Pedido.Value > 0 Then
   Begin
     QPedidoItemValor_total.Value := QPedidoItemQt_Pedido.Value
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
  If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
     QPedidoItemQRQuantidade.Value := QPedidoItemQT_PEDIDO.Value - QPedidoItemQT_ATENDIDO.Value - QPedidoItemQT_CANCELADO.Value
  Else
     QPedidoItemQRQuantidade.Value := QPedidoItemQT_PEDIDO.Value;
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
Var wVendedor,wDtVencto,wLibera,wClassificacao,wDescClassificacao,wEstado : String;
begin
  If IntToStr(DMUsuario.CodVendedorPadrao) <> '' Then
     QPedidoCod_Vendedor.Value := DMUsuario.CodVendedorPadrao
  Else
    Begin
      wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(QPedidoCod_Cadastro.Value));
      If wVendedor <> '' Then
         QPedidoCod_Vendedor.Value := StrToInt(wVendedor);
    End;
  If QPedidoCod_cadastro.Value > 0 then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(dmPedido.QPedidoCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
    if wDtvencto <> '' then
     Begin
       If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
        Begin
          wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO = '+
                                         FloatToStr(QPedidoCod_Cadastro.Value));
          If StrToDate(wDtVencto) < (Date - 5) Then
             If wLibera = 'NAO' Then
                raise Exception.Create('Cliente Com Titulos Em Aberto - Somente Vendas a Vista')
        End
       Else
        if StrToDate(wDtVencto) < Date Then
           ShowMessage('Cliente Com Titulos Atrasados')
        Else
           ShowMessage('Cliente Com Titulos A Vencer');
     End;
    If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+QPedidoCOD_CADASTRO.Text)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');

    If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'ZADIMEL' then
     Begin
       wClassificacao := DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO',' COD_CADASTRO = '+QPedidoCOD_CADASTRO.Text);
       If StrToInt(wClassificacao) > 2 Then
        Begin
          wDescClassificacao := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+Trim(wClassificacao));
          ShowMessage('Cliente com Classificação = '+wDescClassificacao);
        End;
       QpedidoItem.First;
       wEstado:= DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
       While Not QPedidoItem.Eof Do
        Begin
          QPedidoItem.Edit;
          QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+ wEstado+CHR(39));
          QPedidoItem.Post;
          QPedidoItem.Next;
        End;
     End;
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
  QPedidoItem.First;
  While not QPedidoItem.Eof do
  Begin
      // *** Atualizar estoque com Quantidade 0 para gerar um registro de estoque ***
    DMEstoque.AtualizaEstoque(0,
                             QPedidoCod_Filial.Value,
                             StrToInt(QPedidoItemCod_Produto.Text),
                             QPedidoItemCod_Lote_Tipo.Value,
                             0,
                             0,
                             0,
                             0);

    QPedidoItem.Next;
  End;
end;

procedure TDMPedido.QRPedAbertoCalcFields(DataSet: TDataSet);
begin
  QRPedAbertonome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QRPedAbertoCod_Vendedor.Value));
end;

Procedure TDMPedido.ExcluiPedido;
begin
  if MessageDlg('Apagar este pedido?',mtConfirmation,[mbYes,mbNo],0) <> mrYes Then
    Abort;
  try
    pExcluindo := True;
    DMOracle.DBCemapa.StartTransaction;
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
  QPedidoItem_Cancnome_produto.Value:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItem_CancCod_Produto.Value));
  QPedidoItem_Cancnome_lote.Value:= DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = '+FloatToStr(QPedidoItem_CancCod_Lote_Tipo.Value));
end;

procedure TDMPedido.QPedidoItemVAL_UNITARIOValidate(Sender: TField);
var wPreco_Min,wPreco_Max : String;
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') AND (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARZ') Then
    if QPedidoItemVal_Unitario.Value > 0 then
    begin
      wPreco_Max := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
      wPreco_Min := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
      if Trim(wPreco_Min) <> '' Then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
         Begin
          if (QPedidoItemVal_Unitario.Value <> StrToFloat(wPreco_Min)) And
             (QPedidoInd_Tipo_Frete.Value = 'FOB')  then
            ShowMessage('Preço Informado Diferente do Preço do Cadastro de Produtos');
         End
        Else
         if QPedidoItemVal_Unitario.Value < StrToFloat(wPreco_Min) then
            If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Or
               (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Then
              Raise Exception.Create ('Preço Informado Menor Que Preço Minimo do Cadastro')
            Else
              ShowMessage('Preço Informado Menor Que Preço Minimo do Cadastro');
      if Trim(wPreco_Max) <> '' Then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
         Begin
          if (QPedidoItemVal_Unitario.Value <> StrToFloat(wPreco_Max)) And
             (QPedidoInd_Tipo_Frete.Value = 'CIF')  then
            ShowMessage('Preço Informado Diferente do Preço do Cadastro de Produtos');
         End
        Else
         if QPedidoItemVal_Unitario.Value > StrToFloat(wPreco_Max) then
            If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Or
               (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Then
              Raise Exception.Create ('Preço Informado Maior Que Preço Ideal do Cadastro')
            Else
              ShowMessage('Preço Informado Maior Que Preço Ideal do Cadastro');
    end;
end;

procedure TDMPedido.QPedidoItemCOD_PRODUTOValidate(Sender: TField);
var wEstado : String;
begin
  wEstado:= DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'FAVILLE') and (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ZADIMEL') then
   Begin
     QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value,'');
     QPedidoItemCod_Tributacao.Text:= DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
   End
  else
     if DMOperacao.QOperacaoCod_Tributacao.Text <> '' Then
        QPedidoItemCod_Tributacao.Value := DMOperacao.QOperacaoCod_Tributacao.Value
     else
        QPedidoItemCod_Tributacao.Text := DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+ wEstado+CHR(39));
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') and (QPedidoCod_Filial.Value = 2) and (QPedidoCod_Operacao.Value = 10) Then
     QPedidoItemCod_Tributacao.Value := 2;
  QPedidoItemPerc_Comissao.Text := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidoCod_Cadastro.Value));
  If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)) <> 'ATIVO' Then
     Raise Exception.Create ('Produto Não Está Ativo - Cadastro de Produtos');
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
  wVal_Unitario_Ant := QPedidoItemVal_Unitario.Value;
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

procedure TDMPedido.QPedidoItemBeforePost(DataSet: TDataSet);
var
  wExiste: String;
  wValor: Extended;
begin
  if (DMParamSistema.CodEmpresa = 'RADIO') then
  begin
    wExiste := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO',
      'COD_PRODUTO = ' + QPedidoItemCOD_PRODUTO.Text);
    wValor := StrToFloat('0' + wExiste);
    if QPedidoItemVAL_UNITARIO.Value < wValor then
      Raise Exception.Create('Valor inferior ao permitido. Valor mínimo: ' + FormatFloat('#,##0.00', wValor) + '.');
  end;
  wExiste:='';
  if QPedidoItem.State = DSInsert then
  begin
    If (DMParamSistema.QParamSistemaCod_empresa.Value = 'FAVILLE') Or
       (DMParamSistema.QParamSistemaCod_empresa.Value = 'ZADIMEL') then
    begin
      wExiste := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PEDIDO_ITEM','COD_PRODUTO = '+trim(QPedidoItemCod_Produto.text)+
                                  ' AND COD_PEDIDO_CAB = '+DMPedido.QPedidoCod_Pedido_Cab.Text);
      if (wExiste <> '') Then
      Begin
        QPedidoItem.Cancel;
        Raise Exception.create('Produto Já Lançado Neste Pedido, Escolha Outro Produto');
      end;
    end;
  end;
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

end.
