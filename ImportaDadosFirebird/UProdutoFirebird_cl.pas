unit UProdutoFirebird_cl;

interface

uses
  SysUtils, Classes, UFirebird_cl, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TDMProdutoFirebird = class(TDataModule)
    ZQProduto: TZQuery;
    DSProduto: TDataSource;
    ZQEstoque: TZQuery;
    ZQQt_Estoque: TZQuery;
    ZQQt_EstoqueCOD_PRODUTO: TIntegerField;
    ZQQt_EstoqueQT_QUANTIDADE: TIntegerField;
    ZQQt_EstoqueVAL_CUSTO: TFloatField;
    ZQQt_EstoqueQT_MINIMO: TIntegerField;
    ZQMarca: TZQuery;
    ZQMarcaMARCODIGO: TIntegerField;
    ZQMarcaMARNOME: TStringField;
    ZQProdutoCOD_PRODUTO: TIntegerField;
    ZQProdutoNUM_SUBGRUPO: TIntegerField;
    ZQProdutoCOD_MARCA: TIntegerField;
    ZQProdutoIND_SITUACAO: TStringField;
    ZQProdutoCOD_CADASTRO: TIntegerField;
    ZQProdutoDESC_PRODUTO: TStringField;
    ZQProdutoNUM_GENERO_NCM: TStringField;
    ZQProdutoNUM_PESO_BRUTO: TFloatField;
    ZQProdutoNUM_EMBALAGEM: TFloatField;
    ZQProdutoNUM_FABRICANTE: TStringField;
    ZQProdutoDESC_UNIDADE: TStringField;
    ZQProdutoVAL_VAREJO: TFloatField;
    ZQProdutoPERC_MARGEM_VAREJO: TFloatField;
    ZQEstoqueCOD_PRODUTO: TIntegerField;
    ZQEstoqueVAL_CUSTO: TFloatField;
    ZQEstoqueQT_ESTOQUE: TFloatField;
    ZQEstoqueQT_MINIMO: TFloatField;
    ZQProdutoDESC_COD_BARRA: TStringField;
    ZQProdutoAtenas: TZQuery;
    ZQProdutoAtenasCOD_PRODUTO: TIntegerField;
    ZQProdutoAtenasDESC_PRODUTO: TStringField;
    ZQProdutoAtenasVAL_VAREJO: TFloatField;
    ZQProdutoAtenasNUM_GENERO_NCM: TStringField;
    ZQProdutoAtenasDESC_UNIDADE: TStringField;
    ZQProdutoAtenasIND_SITUACAO: TStringField;
    ZQProdutoAtenasVAL_CUSTO: TFloatField;
    ZQProdutoAtenasDESC_COD_BARRA: TStringField;
    ZQMarcaIntelic: TZQuery;
    ZQMarcaIntelicCODIGO: TIntegerField;
    ZQMarcaIntelicNOME: TStringField;
    ZQClasseIntelic: TZQuery;
    ZQClasseIntelicCODIGO: TIntegerField;
    ZQClasseIntelicGRUPO: TStringField;
    ZQProdutoIntelic: TZQuery;
    ZQEStoqueINTELIC: TZQuery;
    ZQProdutoIntelicCODIGO: TIntegerField;
    ZQProdutoIntelicCODEMP: TStringField;
    ZQProdutoIntelicMERCADORIA: TStringField;
    ZQProdutoIntelicVAREJO: TFloatField;
    ZQProdutoIntelicCODFAB: TStringField;
    ZQProdutoIntelicUNIDADEDESC: TStringField;
    ZQProdutoIntelicOBS: TMemoField;
    ZQProdutoIntelicMARCA: TStringField;
    ZQProdutoIntelicDT_INSERT: TDateTimeField;
    ZQProdutoIntelicCODIGO_NCM: TStringField;
    ZQProdutoIntelicCEST: TStringField;
    ZQProdutoIntelicCOMPRIMENTO: TFloatField;
    ZQProdutoIntelicLARGURA: TFloatField;
    ZQProdutoIntelicPESO_LIQUIDO: TFloatField;
    ZQProdutoIntelicPESO_BRUTO: TFloatField;
    ZQProdutoIntelicLOCALIZACAO: TStringField;
    ZQProdutoIntelicCODIGO_FORNECEDOR: TIntegerField;
    ZQProdutoIntelicCODIGO_GRUPO: TIntegerField;
    ZQProdutoIntelicCUSTO: TFloatField;
    ZQEStoqueINTELICCOD_FILIAL: TIntegerField;
    ZQEStoqueINTELICCOD_LOTE_TIPO: TIntegerField;
    ZQEStoqueINTELICCODIGO: TIntegerField;
    ZQEStoqueINTELICCUSTO: TFloatField;
    ZQEStoqueINTELICSALDO_ESTOQUE: TFloatField;
    ZQEStoqueINTELICDT_UPDATE: TDateTimeField;
    ZQEStoqueINTELICINVENTARIO: TFloatField;
    ZQProdutoIntelicATACADO: TFloatField;
    ZQProdutoIntelicCODIGO_SITUACAO_TRIBUTARIA: TIntegerField;
    ZQTabelaPrecoIntelitec: TZQuery;
    ZQTabelaPrecoIntelitecCODIGO_MERCADORIAS: TIntegerField;
    ZQTabelaPrecoIntelitecCODIGO_LISTA_PRECO: TIntegerField;
    ZQTabelaPrecoIntelitecPRECO_FINAL: TFloatField;
    ZQMarcaAtenas: TZQuery;
    ZQMarcaAtenasDESC_MARCA: TStringField;
    ZQProdutoAtenasDESC_OBSERVACAO: TStringField;
    ZQProdutoAtenasDESC_MARCA: TStringField;
    ZQProdutoAtenasREFERENCIA: TStringField;
    ZQProdutoAtenasQDE_ESTOQUE: TFloatField;
    ZQProdutoAtenasCOD_FILIAL: TIntegerField;
    ZQEstoqueAtenas: TZQuery;
    ZQEstoqueAtenasCOD_FILIAL: TIntegerField;
    ZQEstoqueAtenasCOD_PRODUTO: TIntegerField;
    ZQEstoqueAtenasQDE_ESTOQUE: TFloatField;
    ZQEstoqueAtenasVAL_CUSTO: TFloatField;
    ZQProdutoAtenasCOD_CEST: TStringField;
    ZQMarcaRetifoz: TZQuery;
    ZQMarcaRetifozCOD_MARCA: TIntegerField;
    ZQMarcaRetifozDESC_MARCA: TStringField;
    ZQClasseRetifoz: TZQuery;
    ZQClasseRetifozCODIGO: TIntegerField;
    ZQClasseRetifozNOME: TStringField;
    ZQClasseRetifozCLASSIFICACAO: TStringField;
    ZQProdutoRetifoz: TZQuery;
    ZQProdutoRetifozCOD_PRODUTO: TIntegerField;
    ZQProdutoRetifozDESC_PRODUTO: TStringField;
    ZQProdutoRetifozDESC_PRODUTO_REDUZIDO: TStringField;
    ZQProdutoRetifozCOD_MARCA: TIntegerField;
    ZQProdutoRetifozCOD_CLASSE: TIntegerField;
    ZQProdutoRetifozNUM_FABRICANTE: TStringField;
    ZQProdutoRetifozPERC_IPI: TFloatField;
    ZQProdutoRetifozCOD_CEST: TStringField;
    ZQProdutoRetifozIND_SITUACAO: TStringField;
    ZQProdutoRetifozIND_SUBST_TRIB: TStringField;
    ZQProdutoRetifozCOD_TIPO_PRODUTO: TStringField;
    ZQProdutoRetifozIND_TIPO_PRODUTO: TStringField;
    ZQProdutoRetifozPERC_ISS: TFloatField;
    ZQProdutoRetifozCOD_ORDEM_SERVICO: TIntegerField;
    ZQProdutoRetifozNUM_PESO_BRUTO: TFloatField;
    ZQProdutoRetifozNUM_PESO_LIQUIDO: TFloatField;
    ZQProdutoRetifozCOD_LISTA_SERVICO: TStringField;
    ZQProdutoRetifozCOD_SERVICO_MUNICIPAL: TStringField;
    ZQProdutoRetifozDESC_OBSERVACAO: TStringField;
    ZQProdutoRetifozPERC: TFloatField;
    ZQProdutoRetifozTABELA_PRECO: TSmallintField;
    ZQProdutoRetifozVAL_VAREJO: TFloatField;
    ZQProdutoRetifozVAL_ATACADO: TFloatField;
    ZQProdutoRetifozNUM_GENERO_NCM: TStringField;
    ZQProdutoRetifozDESC_UNIDADE: TStringField;
    ZQProdutoRetifozCOD_TRIBUTACAO: TIntegerField;
    ZQProdutoRetifozCOD_LOCALIZACAO: TSmallintField;
    ZQProdutoRetifozDESC_LOCALIZACAO: TStringField;
    ZQEstoqueRetifoz: TZQuery;
    ZQEstoqueRetifozCOD_FILIAL: TSmallintField;
    ZQEstoqueRetifozCOD_PRODUTO: TIntegerField;
    ZQEstoqueRetifozQTD_EMPRESA: TFloatField;
    ZQEstoqueRetifozVL_ULTIMO_CUSTO: TFloatField;
    ZQEstoqueRetifozVL_CUSTO_MEDIO: TFloatField;
    ZQProdutoRelacionadoRetifoz: TZQuery;
    ZQProdutoRelacionadoRetifozCOD_PRODUTO_PRINCIPAL: TIntegerField;
    ZQProdutoRelacionadoRetifozCOD_PRODUTO_SIMILAR: TIntegerField;
    ZQEstoqueAtenasIND_SITUACAO: TStringField;
    ZQProdutoSGB: TZQuery;
    ZQProdutoSGBDESC_PRODUTO: TStringField;
    ZQProdutoSGBDESC_UNIDADE: TStringField;
    ZQProdutoSGBVAL_VAREJO: TFloatField;
    ZQProdutoSGBNUM_GENERO_NCM: TStringField;
    ZQProdutoSGBCOD_TRIBUTACAO: TIntegerField;
    ZQProdutoSGBCOD_CLASSE: TIntegerField;
    ZQProdutoMHNFE: TZQuery;
    ZQProdutoMHNFECOD_PRODUTO: TIntegerField;
    ZQProdutoMHNFEDESC_PRODUTO: TStringField;
    ZQProdutoMHNFENUM_GENERO_NCM: TStringField;
    ZQProdutoMHNFEDESC_UNIDADE: TStringField;
    ZQProdutoMHNFEIND_TIPO_PRODUTO: TStringField;
    ZQProdutoMHNFECOD_CLASSE: TIntegerField;
    ZQProdutoMHNFEVAL_VAREJO: TFloatField;
    ZQProdutoMHNFENUM_PESO_LIQUIDO: TFloatField;
    ZQProdutoMHNFENUM_PESO_BRUTO: TFloatField;
    ZQProdutoMHNFEPERC_INSS: TIntegerField;
    ZQProdutoMHNFEPERC_ISS: TIntegerField;
    ZQProdutoMHNFECOD_TRIBUTACAO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoFirebird: TDMProdutoFirebird;

implementation

{$R *.dfm}

end.
