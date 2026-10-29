unit UDmProduto;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, DBClient, Provider,
  IBUpdateSQL;

type
  TDmProduto = class(TDataModule)
    QSelProduto: TIBQuery;
    DsSelProduto: TDataSource;
    QSelProdutoCOD_PRODUTO: TIntegerField;
    QSelProdutoDESC_PRODUTO: TIBStringField;
    QSelProdutoVLR_VENDA: TFloatField;
    QSelProdutoCOD_TIPO_PRODUTO: TIntegerField;
    QQtdSabores: TIBQuery;
    QQtdSaboresNUM_SABORES: TIntegerField;
    QQtdSaboresVLR_VENDA: TFloatField;
    QProduto: TIBQuery;
    DspProduto: TDataSetProvider;
    CdProduto: TClientDataSet;
    DsProduto: TDataSource;
    CdProdutodesc_produto: TStringField;
    UProduto: TIBUpdateSQL;
    QProdutoCOD_PRODUTO: TIntegerField;
    QProdutoCOD_ITEM: TIntegerField;
    QProdutoCOD_PRODUTO_ITEM: TIntegerField;
    QProdutoCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    CdProdutoCOD_PRODUTO: TIntegerField;
    CdProdutoCOD_ITEM: TIntegerField;
    CdProdutoCOD_PRODUTO_ITEM: TIntegerField;
    CdProdutoCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    DspTipo: TDataSetProvider;
    CdTipo: TClientDataSet;
    DsTipo: TDataSource;
    CdTipoCOD_PRODUTO: TIntegerField;
    CdTipoCOD_ITEM: TIntegerField;
    CdTipoCOD_PRODUTO_ITEM: TIntegerField;
    CdTipoCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    CdTipodesc_tipo_produto: TStringField;
    CdProdutomax_item: TAggregateField;
    CdTipomax_item: TAggregateField;
    QTipo: TIBQuery;
    UTipo: TIBUpdateSQL;
    QTipoCOD_PRODUTO: TIntegerField;
    QTipoCOD_ITEM: TIntegerField;
    QTipoCOD_PRODUTO_ITEM: TIntegerField;
    QTipoCOD_TIPO_PRODUTO_ITEM: TIntegerField;
    QQtdSaboresQT_QUANTIDADE_PADRAO: TFloatField;
    QQtdSaboresIND_TIPO_TAXA_ENTREGA: TIBStringField;
    procedure CdProdutoBeforePost(DataSet: TDataSet);
    procedure CdProdutoCalcFields(DataSet: TDataSet);
    procedure CdTipoBeforePost(DataSet: TDataSet);
    procedure CdTipoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmProduto: TDmProduto;

implementation

uses UFuncoes, UProdutoCad, UDmSistema, Variants;

{$R *.dfm}

procedure TDmProduto.CdProdutoBeforePost(DataSet: TDataSet);
begin
  if ((CdProdutoCOD_ITEM.IsNull) or (CdProdutoCOD_ITEM.Value <= 0)) then
  Begin
    if ((CdProdutomax_item.Value = Null) or (CdProdutomax_item.Value = 0)) then
      CdProdutoCOD_ITEM.Value := 2
    else
      if ((CdProdutoCOD_ITEM.Value = Null) or (CdProdutoCOD_ITEM.Value = 0)) then
        CdProdutoCOD_ITEM.Value := CdProdutomax_item.Value + 1;
  End;
  CdProdutoCOD_PRODUTO.Value := QProduto.ParamByName('COD_PRODUTO').AsInteger;
  CdProdutoCOD_TIPO_PRODUTO_ITEM.Clear;

//  if ((not CdProdutoCOD_PRODUTO_ITEM.IsNull) and (CdProdutoCOD_PRODUTO_ITEM.Value <> 0)) then
//    CdProdutoCOD_TIPO_PRODUTO_ITEM.Clear;
//  if ((not CdProdutoCOD_TIPO_PRODUTO_ITEM.IsNull) and (CdProdutoCOD_TIPO_PRODUTO_ITEM.Value <> 0)) then
//    CdProdutoCOD_PRODUTO_ITEM.Clear;
end;

procedure TDmProduto.CdProdutoCalcFields(DataSet: TDataSet);
begin
  CdProdutodesc_produto.Value := BuscaString('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', CdProdutoCOD_PRODUTO_ITEM.Value);
end;

procedure TDmProduto.CdTipoBeforePost(DataSet: TDataSet);
begin
  if ((CdTipomax_item.Value = Null) or (CdTipomax_item.Value = 0)) then
    CdTipoCOD_ITEM.Value := 10
  else
    if ((CdTipoCOD_ITEM.Value = Null) or (CdTipoCOD_ITEM.Value = 0)) then
      CdTipoCOD_ITEM.Value := CdTipomax_item.Value + 1;
  CdTipoCOD_PRODUTO.Value := QTipo.ParamByName('COD_PRODUTO').AsInteger;
  CdTipoCOD_PRODUTO_ITEM.Clear;
end;

procedure TDmProduto.CdTipoCalcFields(DataSet: TDataSet);
begin
  CdTipodesc_tipo_produto.Value := BuscaString('DESC_TIPO_PRODUTO', 'TB_TIPO_PRODUTO', 'COD_TIPO_PRODUTO', CdTipoCOD_TIPO_PRODUTO_ITEM.Value);
end;

end.
