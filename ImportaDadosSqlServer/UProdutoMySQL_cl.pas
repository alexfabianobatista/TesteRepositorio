unit UProdutoMySQL_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  OracleData, OraTeste;

type
  TDMProdutoMySQL = class(TDataModule)
    ZQProduto: TZQuery;
    ZQProdutoPRO_CODIGO: TIntegerField;
    ZQProdutoPRO_DESCRICAO: TStringField;
    ZQSubClasse: TZQuery;
    ZQSubClasseNUM_SUBGRUPO: TIntegerField;
    ZQSubClasseSBGR_DESCRICAO: TStringField;
    ZQSubClasseNUM_GRUPO: TIntegerField;
    ZQProdutoPRO_UNIDADE: TStringField;
    ZQProdutoPRO_PESOBRUTO: TFloatField;
    ZQProdutoPRO_PESOLIQUIDO: TFloatField;
    ZQProdutoPRO_COMISSAO: TFloatField;
    ZQProdutoPRO_PERCIPI: TFloatField;
    ZQProdutoPRO_PIS: TStringField;
    ZQProdutoPRO_COFINS: TStringField;
    ZQProdutoPRO_ATIVO: TStringField;
    ZQProdutoPRO_DATACAD: TDateField;
    ZQProdutoSBGR_CODIGO: TIntegerField;
    ZQProdutoPRO_INDUSTRIALIZADO: TStringField;
    ZQProdutoPRO_ISS: TStringField;
    ZQProdutoTRIBIPI_CODIGO: TIntegerField;
    ZQProdutoTRIBPIS_CODIGO: TIntegerField;
    ZQProdutoTRIBCOFINS_CODIGO: TIntegerField;
    ZQProdutoPRO_PERCISS: TFloatField;
    ZQProdutoPRO_NATRECEITA: TIntegerField;
    ZQProdutoGRU_CODIGO: TIntegerField;
    ZQEstoque: TZQuery;
    ZQProdutoPRO_NCM: TStringField;
    ZQProdutoCEST_CODIGO: TStringField;
    ZQProdutoPRO_CODBARRA: TStringField;
    ZQProdutoVAL_VAREJO: TFloatField;
    ZQProdutoVAL_ATACADO: TFloatField;
    ZQFormula: TZQuery;
    ZQEstoqueFIL_CODIGO: TIntegerField;
    ZQEstoquePRO_CODIGO: TIntegerField;
    ZQEstoqueEST_QTDE: TFloatField;
    ZQEstoquePRO_CUSTOCOMPRA: TFloatField;
    ZQFormulaPro_Codigo: TIntegerField;
    ZQFormulaPro_CodMatPrima: TIntegerField;
    ZQFormulaComp_Qtde: TFloatField;
    ZQFormulaComp_TipoCompos: TIntegerField;
    ZQFormulaComp_PercPerda: TFloatField;
    ZQTabelaPreco: TZQuery;
    QTabelaPreco: TOracleDataSet1;
    QTabelaPrecoCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoDESC_TABELA_PRECO: TStringField;
    QTabelaPrecoIND_SITUACAO: TStringField;
    QTabelaPrecoItem: TOracleDataSet1;
    QTabelaPrecoItemCOD_TABELA_PRECO_ITEM: TIntegerField;
    QTabelaPrecoItemCOD_TABELA_PRECO_CAB: TIntegerField;
    QTabelaPrecoItemCOD_PRODUTO: TIntegerField;
    QTabelaPrecoItemVAL_PRECO: TFloatField;
    ZQTabelaPrecoTPRC_CODIGO: TIntegerField;
    ZQTabelaPrecoTPRC_DESCRICAO: TStringField;
    ZQTabelaPrecoPRO_CODIGO: TIntegerField;
    ZQTabelaPrecoPRO_CODBARRAS: TStringField;
    ZQTabelaPrecoTPRCITM_VALOR: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoMySQL: TDMProdutoMySQL;

implementation

uses UMySQL_cl;

{$R *.dfm}

end.
