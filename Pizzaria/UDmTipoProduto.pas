unit UDmTipoProduto;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmTipoProduto = class(TDataModule)
    QSelTipoProduto: TIBQuery;
    DsSelTipoProduto: TDataSource;
    QSelTipoProdutoCOD_TIPO_PRODUTO: TIntegerField;
    QSelTipoProdutoDESC_TIPO_PRODUTO: TIBStringField;
    QSelTipoProdutoNUM_SABORES: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmTipoProduto: TDmTipoProduto;

implementation

{$R *.dfm}

end.
