unit UPadraoProduto_cl;

interface

uses
  SysUtils, Classes, OraTeste, DB, OracleData;

type
  TDMPadraoProduto = class(TDataModule)
    QPadraoProduto: TOracleDataSet1;
    QPadraoProdutoCOD_PADRAO_PRODUTO: TIntegerField;
    QPadraoProdutoCons: TOracleDataSet1;
    QPadraoProdutoConsCOD_PADRAO_PRODUTO: TIntegerField;
    QPadraoDescontoProduto: TOracleDataSet1;
    QPadraoDescProdCons: TOracleDataSet1;
    QPadraoDescProdConsCOD_PADRAO_PRODUTO: TIntegerField;
    QPadraoDescProdConsCOD_PRODUTO: TIntegerField;
    QPadraoDescProdConsNUM_UMIDADE_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_UMIDADE_DESCONTO: TFloatField;
    QPadraoDescProdConsNUM_IMPUREZA_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_IMPUREZA_DESCONTO: TFloatField;
    QPadraoDescProdConsNUM_AVARIADO_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_AVARIADO_DESCONTO: TFloatField;
    QPadraoDescProdConsNUM_QUEBRADO_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_QUEBRADO_DESCONTO: TFloatField;
    QPadraoDescProdConsNUM_ARDIDOS_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_ARDIDOS_DESCONTO: TFloatField;
    QPadraoDescProdConsDESC_PRODUTO: TStringField;
    QRPadraoDescontoProduto: TOracleDataSet1;
    QRPadraoDescontoProdutoCOD_PADRAO_PRODUTO: TIntegerField;
    QRPadraoDescontoProdutoCOD_PRODUTO: TIntegerField;
    QRPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_UMIDADE_DESCONTO: TFloatField;
    QRPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO: TFloatField;
    QRPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_AVARIADO_DESCONTO: TFloatField;
    QRPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO: TFloatField;
    QRPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO: TFloatField;
    QRPadraoDescontoProdutoDESC_PRODUTO: TStringField;
    QPadraoDescProdConsNUM_TRIGUILHO_TOLERANCIA: TFloatField;
    QPadraoDescProdConsNUM_TRIGUILHO_DESCONTO: TFloatField;
    QPadraoDescontoProdutoCOD_PADRAO_DESCONTO_PRODUTO: TIntegerField;
    QPadraoDescontoProdutoCOD_PADRAO_PRODUTO: TIntegerField;
    QPadraoDescontoProdutoCOD_PRODUTO: TIntegerField;
    QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO: TFloatField;
    QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO: TFloatField;
    QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO: TFloatField;
    QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO: TFloatField;
    QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA: TFloatField;
    QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO: TFloatField;
    QPadraoDescProdConsCOD_PADRAO_DESCONTO_PRODUTO: TIntegerField;
    QRPadraoDescontoProdutoCOD_PADRAO_DESCONTO_PRODUTO: TIntegerField;
    QRPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA: TFloatField;
    QRPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO: TFloatField;
    QPadraoProdutoDESC_PADRAO_PRODUTO: TStringField;
    QPadraoProdutoConsDESC_PADRAO_PRODUTO: TStringField;
    QPadraoDescProdConsDESC_PADRAO_PRODUTO: TStringField;
    QRPadraoDescontoProdutoDESC_PADRAO_PRODUTO: TStringField;
    QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPadraoProduto: TDMPadraoProduto;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
