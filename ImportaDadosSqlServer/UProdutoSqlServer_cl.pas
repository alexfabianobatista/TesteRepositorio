unit UProdutoSqlServer_cl;

interface

uses
  SysUtils, Classes, ADODB, DB, OracleData;

type
  TDMProdutoSqlServer = class(TDataModule)
    SSQProduto: TADOQuery;
    SSQProdutoCOD_PRODUTO: TIntegerField;
    SSQProdutoDESC_PRODUTO: TStringField;
    SSQProdutoDESC_UNIDADE: TStringField;
    SSQProdutoIND_TIPO_PRODUTO: TStringField;
    SSQProdutoCOD_CLASSE: TSmallintField;
    SSQProdutoDESC_MARCA: TStringField;
    SSQProdutoDESC_COD_BARRA: TStringField;
    SSQProdutoVL_ULTIMO_CUSTO: TBCDField;
    SSQProdutoVL_CUSTO_MEDIO: TBCDField;
    SSQProdutoPERC_MARGEM_VAREJO: TBCDField;
    SSQProdutoVAL_VAREJO: TBCDField;
    SSQProdutoVAL_ATACADO: TBCDField;
    SSQProdutoQT_QUANTIDADE: TBCDField;
    SSQProdutoQT_COMPRA: TBCDField;
    SSQProdutoDT_COMPRA: TDateTimeField;
    SSQProdutoDT_VENDA: TDateTimeField;
    SSQProdutoCsosn: TStringField;
    SSQProdutoCOD_CST_PIS: TStringField;
    SSQProdutoNUM_GENERO_NCM: TStringField;
    SSQProdutoCOD_CEST: TStringField;
    SSQProdutoPERC_MARGEM_ATACADO: TBCDField;
    SSQProdutoCst: TStringField;
    SSQProdutoNUM_FABRICANTE: TStringField;
    SSQProdutoRelacionado: TADOQuery;
    SSQProdutoRelacionadoCOD_PRODUTO: TIntegerField;
    SSQProdutoRelacionadoDESC_PRODUTO: TStringField;
    SSQProdutoRelacionadoREF_FORNECEDOR: TStringField;
    SSQProdutoRelacionadoCOD_NUM_FABRICANTE: TStringField;
    SSQProdutoRelacionadoCOD_PRODUTO_FILHO: TStringField;
    SSQProdutoNUM_SIMILAR: TStringField;
    SSQProdutoNUM_SIMILAR2: TStringField;
    SSQProdutoNUM_SIMILAR3: TStringField;
    SSQProdutoNUM_SIMILAR4: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoSqlServer: TDMProdutoSqlServer;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
