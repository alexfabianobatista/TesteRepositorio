unit UDmVenda;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, DBClient, Provider,
  IBUpdateSQL;

type
  TDmVenda = class(TDataModule)
    QItemVenda: TIBQuery;
    DspItemVenda: TDataSetProvider;
    CdItemVenda: TClientDataSet;
    DsItemVenda: TDataSource;
    CdItemVendadesc_produto: TStringField;
    CdItemVendaval_total: TFloatField;
    QItemVendaCOD_VENDA: TIntegerField;
    QItemVendaCOD_VENDA_ITEM: TIntegerField;
    QItemVendaCOD_PRODUTO: TIntegerField;
    QItemVendaQT_QUANTIDADE: TFloatField;
    QItemVendaVAL_PRECO: TFloatField;
    CdItemVendaCOD_VENDA: TIntegerField;
    CdItemVendaCOD_VENDA_ITEM: TIntegerField;
    CdItemVendaCOD_PRODUTO: TIntegerField;
    CdItemVendaQT_QUANTIDADE: TFloatField;
    CdItemVendaVAL_PRECO: TFloatField;
    CdItemVendamax_codigo: TAggregateField;
    QInsVenda: TIBQuery;
    QInsVendaItem: TIBQuery;
    QInsVendaItemSabor: TIBQuery;
    QSabor: TIBQuery;
    DspSabor: TDataSetProvider;
    CdSabor: TClientDataSet;
    DsSabor: TDataSource;
    CdSaborCOD_VENDA: TIntegerField;
    CdSaborCOD_VENDA_ITEM: TIntegerField;
    CdSaborCOD_SABOR: TIntegerField;
    CdSabordesc_sabor: TStringField;
    QSaborCOD_VENDA: TIntegerField;
    QSaborCOD_VENDA_ITEM: TIntegerField;
    QSaborCOD_SABOR: TIntegerField;
    QSaborQT_QUANTIDADE: TIntegerField;
    CdSaborQT_QUANTIDADE: TIntegerField;
    CdBackup: TClientDataSet;
    DspBackup: TDataSetProvider;
    CdBackupCOD_VENDA: TIntegerField;
    CdBackupCOD_VENDA_ITEM: TIntegerField;
    CdBackupCOD_SABOR: TIntegerField;
    CdBackupQT_QUANTIDADE: TIntegerField;
    QUltimaVenda: TIBQuery;
    QUltimaVendaULTIMO: TIntegerField;
    QTicketCab: TIBQuery;
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
    QTicketItem: TIBQuery;
    QTicketItemCOD_VENDA: TIntegerField;
    QTicketItemCOD_VENDA_ITEM: TIntegerField;
    QTicketItemCOD_PRODUTO: TIntegerField;
    QTicketItemQT_QUANTIDADE: TFloatField;
    QTicketItemVAL_PRECO: TFloatField;
    QTicketSabor: TIBQuery;
    QTicketSaborCOD_VENDA: TIntegerField;
    QTicketSaborCOD_VENDA_ITEM: TIntegerField;
    QTicketSaborCOD_SABOR: TIntegerField;
    QTicketSaborQT_QUANTIDADE: TIntegerField;
    QTicketSaborDESC_SABOR: TIBStringField;
    QTicketItemDESC_PRODUTO: TIBStringField;
    procedure CdItemVendaCalcFields(DataSet: TDataSet);
    procedure CdSaborCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVenda: TDmVenda;

implementation

uses UDmSistema, UFuncoes;

{$R *.dfm}

procedure TDmVenda.CdItemVendaCalcFields(DataSet: TDataSet);
begin
  CdItemVendadesc_produto.Value := BuscaString('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', CdItemVendaCOD_PRODUTO.Value);
  CdItemVendaval_total.Value := CdItemVendaQT_QUANTIDADE.Value * CdItemVendaVAL_PRECO.Value;
end;

procedure TDmVenda.CdSaborCalcFields(DataSet: TDataSet);
begin
  if CdSaborCOD_SABOR.Value < 0 then
    CdSabordesc_sabor.Value := 'Sabor não informado'
  else
    CdSabordesc_sabor.Value := BuscaString('DESC_SABOR', 'TB_SABOR', 'COD_SABOR', CdSaborCOD_SABOR.Value);
end;

end.
