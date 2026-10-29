unit UDmVenda_Nova;

interface

uses
  SysUtils, Classes, DBClient, Provider, DB, IBCustomDataSet, IBQuery;

type
  TDmVenda_Nova = class(TDataModule)
    QProdutosVenda: TIBQuery;
    QProdutosVendaNUM_ITENS: TIntegerField;
    QProdutosVendaCOD_PRODUTO: TIntegerField;
    QProdutosVendaDESC_PRODUTO: TIBStringField;
    QProdutosVendaVLR_VENDA: TFloatField;
    QProdutosVendaCOD_TIPO_PRODUTO: TIntegerField;
    QProdutosVendaDESC_TIPO_PRODUTO: TIBStringField;
    QProdutosVendaMARCADO: TIBStringField;
    QProdutosVendaDESC_COD_PRODUTO: TIBStringField;
    DsProdutosVenda: TDataSource;
    DspProdutosVenda: TDataSetProvider;
    CdProdutosVenda: TClientDataSet;
    CdProdutosVendaNUM_ITENS: TIntegerField;
    CdProdutosVendaCOD_PRODUTO: TIntegerField;
    CdProdutosVendaDESC_PRODUTO: TStringField;
    CdProdutosVendaVLR_VENDA: TFloatField;
    CdProdutosVendaCOD_TIPO_PRODUTO: TIntegerField;
    CdProdutosVendaDESC_TIPO_PRODUTO: TStringField;
    CdProdutosVendaMARCADO: TStringField;
    CdProdutosVendaDESC_COD_PRODUTO: TStringField;
    QSabor: TIBQuery;
    DspSabor: TDataSetProvider;
    CdSabor: TClientDataSet;
    CdSabordesc_sabor: TStringField;
    DsSabor: TDataSource;
    QProdutosVendaCOD_VENDA_ITEM: TIntegerField;
    CdProdutosVendaCOD_VENDA_ITEM: TIntegerField;
    QProdutoItens: TIBQuery;
    DspProdutoItens: TDataSetProvider;
    CdProdutoItens: TClientDataSet;
    DsProdutoItens: TDataSource;
    QSaborCOD_VENDA: TIntegerField;
    QSaborCOD_VENDA_ITEM: TIntegerField;
    QSaborCOD_PRODUTO: TIntegerField;
    QSaborCOD_ITEM: TIntegerField;
    QSaborCOD_SABOR: TIntegerField;
    QSaborQT_QUANTIDADE: TIntegerField;
    CdSaborCOD_VENDA: TIntegerField;
    CdSaborCOD_VENDA_ITEM: TIntegerField;
    CdSaborCOD_PRODUTO: TIntegerField;
    CdSaborCOD_ITEM: TIntegerField;
    CdSaborCOD_SABOR: TIntegerField;
    CdSaborQT_QUANTIDADE: TIntegerField;
    QProdutoItensDESC_PRODUTO: TIBStringField;
    QProdutoItensDESC_TIPO_PRODUTO: TIBStringField;
    QProdutoItensCOD_SELECIONADO: TIntegerField;
    QProdutoItensDESC_SELECIONADO: TIBStringField;
    QProdutoItensCLASSE_SELECIONADO: TIBStringField;
    QProdutoItensCOD_PRODUTO_ITEM: TIntegerField;
    QProdutoItensCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    CdProdutoItensDESC_PRODUTO: TStringField;
    CdProdutoItensDESC_TIPO_PRODUTO: TStringField;
    CdProdutoItensCOD_SELECIONADO: TIntegerField;
    CdProdutoItensDESC_SELECIONADO: TStringField;
    CdProdutoItensCLASSE_SELECIONADO: TStringField;
    CdProdutoItensCOD_PRODUTO_ITEM: TIntegerField;
    CdProdutoItensCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    QSelSabor: TIBQuery;
    DspSelSabor: TDataSetProvider;
    CdSelSabor: TClientDataSet;
    DsSelSabor: TDataSource;
    QSelSaborDESC_SABOR: TIBStringField;
    QSelSaborVLR_INTEGRAL: TFloatField;
    QSelSaborCOD_SABOR: TIntegerField;
    QSelSaborMARCADO: TIBStringField;
    CdSelSaborDESC_SABOR: TStringField;
    CdSelSaborVLR_INTEGRAL: TFloatField;
    CdSelSaborCOD_SABOR: TIntegerField;
    CdSelSaborMARCADO: TStringField;
    QProdutosVendaVAL_PRECO_DIGITADO: TFloatField;
    CdProdutosVendaVAL_PRECO_DIGITADO: TFloatField;
    QProdutosVendaQT_QUANTIDADE_DIGITADO: TFloatField;
    CdProdutosVendaQT_QUANTIDADE_DIGITADO: TFloatField;
    QInsVenda: TIBQuery;
    QInsVendaItem: TIBQuery;
    QInsVendaItemSabor: TIBQuery;
    QUltimaVenda: TIBQuery;
    QUltimaVendaULTIMO: TIntegerField;
    DspBackup: TDataSetProvider;
    CdBackup: TClientDataSet;
    CdBackupCOD_VENDA: TIntegerField;
    CdBackupCOD_VENDA_ITEM: TIntegerField;
    CdBackupCOD_PRODUTO: TIntegerField;
    CdBackupCOD_ITEM: TIntegerField;
    CdBackupCOD_SABOR: TIntegerField;
    CdBackupQT_QUANTIDADE: TIntegerField;
    CdProdutosVendaval_total_digitado: TFloatField;
    QTicketCozinha: TIBQuery;
    QTicketCozinhaCOD_VENDA_ITEM: TIntegerField;
    QTicketCozinhaCOD_PRODUTO: TIntegerField;
    QTicketCozinhaCOD_ITEM: TIntegerField;
    QTicketCozinhaCOD_SABOR: TIntegerField;
    QTicketCozinhaDESC_PRODUTO: TIBStringField;
    QTicketCozinhaDESC_SABOR: TIBStringField;
    QTicketCab: TIBQuery;
    QTicketItem: TIBQuery;
    QTicketCabCOD_VENDA: TIntegerField;
    QTicketCabDT_VENDA: TDateField;
    QTicketCabCOD_CLIENTE: TIntegerField;
    QTicketCabCOD_OPERADOR: TIntegerField;
    QTicketCabDESC_OBSERVACAO: TIBStringField;
    QTicketCabDESC_NOME_CLIENTE: TIBStringField;
    QTicketCabDESC_ENDERECO: TIBStringField;
    QTicketCabDESC_LOCALIZACAO: TIBStringField;
    QTicketCabDESC_TELEFONE: TIBStringField;
    QTicketCabDESC_NOME_OPERADOR: TIBStringField;
    QTicketItemCOD_PRODUTO: TIntegerField;
    QTicketItemCOD_VENDA: TIntegerField;
    QTicketItemCOD_VENDA_ITEM: TIntegerField;
    QTicketItemVAL_PRECO: TFloatField;
    QTicketItemQT_QUANTIDADE: TFloatField;
    QTicketItemDESC_PRODUTO: TIBStringField;
    QSaborINDICE: TIntegerField;
    CdSaborINDICE: TIntegerField;
    QTicketCabVAL_TAXA_TOTAL: TFloatField;
    CdBackupINDICE: TIntegerField;
    QProdutoItensCOD_TIPO_PRODUTO: TIntegerField;
    CdProdutoItensCOD_TIPO_PRODUTO: TIntegerField;
    QTicketItemIND_TICKET_COZINHA: TIBStringField;
    QTicketItemIND_TICKET_ENTREGADOR: TIBStringField;
    QTicketCozinhaINDICE: TIntegerField;
    QConsVendaTipoProd: TIBQuery;
    QConsVendaTipoProdDESC_TIPO_PRODUTO: TIBStringField;
    QConsVendaTipoProdCOD_TIPO_PRODUTO: TIntegerField;
    QConsVendaTipoProdQT_QUANTIDADE: TFloatField;
    QConsVendaTipoProdVAL_TOTAL: TFloatField;
    procedure CdSaborCalcFields(DataSet: TDataSet);
    procedure CdProdutosVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVenda_Nova: TDmVenda_Nova;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TDmVenda_Nova.CdSaborCalcFields(DataSet: TDataSet);
begin
  if CdSaborCOD_SABOR.Value < 0 then
    CdSabordesc_sabor.Value := 'Sabor não informado'
  else
    CdSabordesc_sabor.Value := BuscaString('DESC_SABOR', 'TB_SABOR', 'COD_SABOR', CdSaborCOD_SABOR.Value);
end;

procedure TDmVenda_Nova.CdProdutosVendaCalcFields(DataSet: TDataSet);
begin
  CdProdutosVendaval_total_digitado.Value := CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value * CdProdutosVendaVAL_PRECO_DIGITADO.Value;
end;

end.
