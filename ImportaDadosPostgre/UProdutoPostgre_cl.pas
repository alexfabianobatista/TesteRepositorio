unit UProdutoPostgre_cl;

interface

uses
  SysUtils, Classes, UPostgre_cl, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TDMProdutoPostgre = class(TDataModule)
    ZQProduto: TZQuery;
    DSProduto: TDataSource;
    ZQGrupo: TZQuery;
    ZQSubGrupo: TZQuery;
    ZQGruponum_classe: TFloatField;
    ZQGruponum_subclasse: TIntegerField;
    ZQGrupodesc_classe: TStringField;
    ZQSubGruponum_classe: TFloatField;
    ZQSubGruponum_subclasse: TFloatField;
    ZQSubGrupodesc_subclasse: TStringField;
    ZQProdutocod_produto: TFloatField;
    ZQProdutonum_fabricante: TStringField;
    ZQProdutodesc_produto: TStringField;
    ZQProdutodesc_unidade: TStringField;
    ZQProdutonum_classe: TFloatField;
    ZQProdutonum_subclasse: TFloatField;
    ZQProdutoval_varejo: TFloatField;
    ZQProdutoval_atacado: TFloatField;
    ZQProdutonum_peso_bruto: TFloatField;
    ZQProdutonum_peso_liquido: TFloatField;
    ZQProdutoperc_ipi: TFloatField;
    ZQProdutonum_volumes: TIntegerField;
    ZQProdutoind_situacao: TFloatField;
    ZQProdutocod_tributacao: TIntegerField;
    ZQProdutoperc_iss: TIntegerField;
    ZQProdutoperc_inss: TIntegerField;
    ZQProdutolocalizacao: TStringField;
    ZQProdutonum_genero_ncm: TStringField;
    ZQProdutoperc_margem_varejo: TFloatField;
    ZQProdutoSeta: TZQuery;
    ZQProdutoSetadesc_produto: TStringField;
    ZQProdutoSetacod_marca: TStringField;
    ZQProdutoSetacod_fornecedor: TStringField;
    ZQProdutoSetanum_fabricante: TStringField;
    ZQProdutoSetadesc_complemento: TStringField;
    ZQProdutoSetaval_varejo: TFloatField;
    ZQProdutoSetaval_atacado: TFloatField;
    ZQProdutoSetadesc_unidade: TStringField;
    ZQProdutoSetadesc_ncm: TStringField;
    ZQProdutoSetacod_cest: TStringField;
    ZQProdutoSetacod_tributacao: TIntegerField;
    ZQProdutoSetaind_tipo_produto: TStringField;
    ZQProdutoSetadesc_situacao: TStringField;
    ZQProdutoSetanum_embalagem: TIntegerField;
    ZQProdutoSetaperc_iss: TIntegerField;
    ZQProdutoSetaperc_inss: TIntegerField;
    ZQProdutoSetacodigo: TStringField;
    ZQProdutoSetadesc_classe: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoPostgre: TDMProdutoPostgre;

implementation

{$R *.dfm}

end.
