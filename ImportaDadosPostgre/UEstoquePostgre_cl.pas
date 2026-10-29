unit UEstoquePostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMEstoquePostgre = class(TDataModule)
    ZQEstoque: TZQuery;
    ZQEstoquecod_lote_tipo: TIntegerField;
    ZQEstoquecod_filial: TIntegerField;
    ZQEstoquevl_custo_medio: TFloatField;
    ZQEstoquevl_ultimo_custo: TFloatField;
    ZQEstoqueqt_quantidade: TFloatField;
    ZQEstoquedesc_localizacao: TStringField;
    ZQEstoquecod_produto: TFloatField;
    ZQEstoqueSeta: TZQuery;
    ZQEstoqueSetacod_produto: TStringField;
    ZQEstoqueSetavl_custo_medio: TFloatField;
    ZQEstoqueSetavl_ultimo_custo: TFloatField;
    ZQEstoqueSetacod_lote_tipo: TIntegerField;
    ZQEstoqueSetacod_filial: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstoquePostgre: TDMEstoquePostgre;

implementation

uses UPostgre_cl;

{$R *.dfm}

end.
