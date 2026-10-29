unit UProdutoRelatorio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMProdutoRelatorio = class(TDataModule)
    QREtiquetaCodBarra: TOracleDataSet1;
    QREtiquetaCodBarraETIQUETA1: TStringField;
    QREtiquetaCodBarraETIQUETA2: TStringField;
    QREtiquetaCodBarraETIQUETA3: TStringField;
    QREtiquetaCodBarraETIQUETA4: TStringField;
    QREtiquetaCodBarraETIQUETA5: TStringField;
    QREtiquetaCodBarraval_varejo2: TStringField;
    QREtiquetaCodBarradesc_produto2: TStringField;
    QRProdutoEstoqueBaixa: TOracleDataSet1;
    QRProdutoEstoqueBaixaCOD_PRODUTO: TFloatField;
    QRProdutoEstoqueBaixaCOD_CLASSE: TIntegerField;
    QRProdutoEstoqueBaixaCOD_TRIBUTACAO: TIntegerField;
    QRProdutoEstoqueBaixaNUM_EMBALAGEM: TFloatField;
    QRProdutoEstoqueBaixaDESC_UNIDADE: TStringField;
    QRProdutoEstoqueBaixaNUM_TRIB_TRANSFERENCIA: TIntegerField;
    QRProdutoEstoqueBaixaVAL_VAREJO: TFloatField;
    QRProdutoEstoqueBaixaVAL_ATACADO: TFloatField;
    QRProdutoEstoqueBaixaPERC_DESCONTO_MAXIMO: TFloatField;
    QRProdutoEstoqueBaixaPERC_IPI: TFloatField;
    QRProdutoEstoqueBaixaDESC_CLASS_FISCAL: TStringField;
    QRProdutoEstoqueBaixaIND_TIPO_PRODUTO: TStringField;
    QRProdutoEstoqueBaixaDT_ALTERACAO_PRECO: TDateTimeField;
    QRProdutoEstoqueBaixaNUM_FABRICANTE: TStringField;
    QRProdutoEstoqueBaixaCOD_CADASTRO: TIntegerField;
    QRProdutoEstoqueBaixaPERC_COMISSAO: TFloatField;
    QRProdutoEstoqueBaixaDESC_PRODUTO: TStringField;
    QREstoqueBaixa: TOracleDataSet1;
    QREstoqueBaixaCOD_LOTE_TIPO: TIntegerField;
    QREstoqueBaixaCOD_PRODUTO: TFloatField;
    QREstoqueBaixaCOD_PRODUTO_BAIXA: TIntegerField;
    QREstoqueBaixaQT_BAIXA: TFloatField;
    QREstoqueBaixaCOD_LOTE_TIPO_BAIXA: TIntegerField;
    QREstoqueBaixadesc_lote_tipo_baixa: TStringField;
    QREstoqueBaixadesc_produto_baixa: TStringField;
    QREstoqueBaixadesc_lote_tipo: TStringField;
    QRProdutoMarca: TOracleDataSet1;
    QRProdutoMarcaDESC_MARCA: TStringField;
    QRProdutoMarcaCOD_PRODUTO: TFloatField;
    QRProdutoMarcaCOD_MARCA: TIntegerField;
    QRProdutoMarcaDESC_PRODUTO: TStringField;
    QRProdutoClasse: TOracleDataSet1;
    QRProdutoClasseCOD_CLASSE: TIntegerField;
    QRProdutoClasseCOD_PRODUTO: TFloatField;
    QRProdutoClasseCOD_CLASSE_1: TIntegerField;
    QRProdutoClasseCOD_TRIBUTACAO: TIntegerField;
    QRProdutoClasseNUM_EMBALAGEM: TFloatField;
    QRProdutoClasseDESC_UNIDADE: TStringField;
    QRProdutoClasseNUM_TRIB_TRANSFERENCIA: TIntegerField;
    QRProdutoClasseVAL_VAREJO: TFloatField;
    QRProdutoClasseVAL_ATACADO: TFloatField;
    QRProdutoClassePERC_DESCONTO_MAXIMO: TFloatField;
    QRProdutoClassePERC_IPI: TFloatField;
    QRProdutoClasseDESC_CLASS_FISCAL: TStringField;
    QRProdutoClasseIND_TIPO_PRODUTO: TStringField;
    QRProdutoClasseDT_ALTERACAO_PRECO: TDateTimeField;
    QRProdutoClasseNUM_FABRICANTE: TStringField;
    QRProdutoClasseDESC_CLASSE: TStringField;
    QRProdutoClassePERC_COMISSAO1: TFloatField;
    QRProdutoClassePERC_COMISSAO2: TFloatField;
    QRProdutoClasseNUM_CLASSE: TIntegerField;
    QRProdutoClasseNUM_SUBCLASSE: TIntegerField;
    QRProdutoClasseDESC_TRIBUTACAO: TStringField;
    QRProdutoClasseDESC_PRODUTO: TStringField;
    QRProdutoSEstoque: TOracleDataSet1;
    QRProdutoSEstoqueNUM_EMBALAGEM: TFloatField;
    QRProdutoSEstoqueDESC_UNIDADE: TStringField;
    QRProdutoSEstoqueSQUANT: TFloatField;
    QRProdutoSEstoqueDESC_PRODUTO: TStringField;
    QRProdutoEtiquetas: TOracleDataSet1;
    QRProdutoEtiquetasCOD_PRODUTO: TFloatField;
    QRProdutoEtiquetasVAL_VAREJO: TFloatField;
    QRProdutoEtiquetasVAL_ATACADO: TFloatField;
    QRProdutoEtiquetasNUM_FABRICANTE: TStringField;
    QRProdutoEtiquetasDESC_PRODUTO: TStringField;
    QRMovimentoFornecedor: TOracleDataSet1;
    QRMovimentoFornecedorCOD_CADASTRO: TIntegerField;
    QRMovimentoFornecedorCOD_OPERACAO: TIntegerField;
    QRMovimentoFornecedorDT_EMISSAO: TDateTimeField;
    QRMovimentoFornecedorNUM_NOTA: TIntegerField;
    QRMovimentoFornecedorCOD_VENDEDOR: TIntegerField;
    QRMovimentoFornecedorQT_QUANTIDADE: TFloatField;
    QRMovimentoFornecedorCOD_PRODUTO: TFloatField;
    QRMovimentoFornecedorCOD_FORNECEDOR: TIntegerField;
    QRMovimentoFornecedorDESC_PRODUTO: TStringField;
    QRMovimentoFornecedorDESC_VENDEDOR: TStringField;
    QRMovimentoFornecedorDESC_CLIENTE: TStringField;
    QRMovimentoFornecedorDESC_OPERACAO: TStringField;
    QRProdutosPromocao: TOracleDataSet1;
    QRProdutosPromocaoCOD_PRODUTO: TFloatField;
    QRProdutosPromocaoCOD_CLASSE: TIntegerField;
    QRProdutosPromocaoCOD_TRIBUTACAO: TIntegerField;
    QRProdutosPromocaoNUM_EMBALAGEM: TFloatField;
    QRProdutosPromocaoDESC_UNIDADE: TStringField;
    QRProdutosPromocaoIND_TIPO_PRODUTO: TStringField;
    QRProdutosPromocaoNUM_FABRICANTE: TStringField;
    QRProdutosPromocaoPRECO_PROMOCAO: TFloatField;
    QRProdutosPromocaoPRECO_PROMOCAO1: TFloatField;
    QRProdutosPromocaoDT_PRECO_PRO_INI: TDateTimeField;
    QRProdutosPromocaoDT_PRECO_PRO_FIN: TDateTimeField;
    QRProdutosPromocaoDESC_COMPLEMENTO_PROMOCAO: TStringField;
    QRProdutosPromocaoDESC_CLASSE: TStringField;
    QRProdutosPromocaoDESC_PRODUTO: TStringField;
    QRListaPrecos: TOracleDataSet1;
    QRListaPrecosCOD_PRODUTO: TFloatField;
    QRListaPrecosCOD_CLASSE: TFloatField;
    QRListaPrecosCOD_TRIBUTACAO: TFloatField;
    QRListaPrecosNUM_EMBALAGEM: TFloatField;
    QRListaPrecosDESC_UNIDADE: TStringField;
    QRListaPrecosNUM_TRIB_TRANSFERENCIA: TFloatField;
    QRListaPrecosVAL_VAREJO: TFloatField;
    QRListaPrecosVAL_ATACADO: TFloatField;
    QRListaPrecosPERC_DESCONTO_MAXIMO: TFloatField;
    QRListaPrecosPERC_IPI: TFloatField;
    QRListaPrecosDESC_CLASS_FISCAL: TStringField;
    QRListaPrecosIND_TIPO_PRODUTO: TStringField;
    QRListaPrecosDT_ALTERACAO_PRECO: TDateTimeField;
    QRListaPrecosNUM_FABRICANTE: TStringField;
    QRListaPrecosCOD_CADASTRO: TFloatField;
    QRListaPrecosSQTDE_ESTOQUE: TFloatField;
    QRListaPrecosDESC_PRODUTO: TStringField;
    QRListaPrecosDT_VENCTO_PRECO: TDateTimeField;
    QRProduto: TOracleDataSet1;
    QRProdutoCOD_PRODUTO: TFloatField;
    QRProdutoCOD_CLASSE: TIntegerField;
    QRProdutoCOD_TRIBUTACAO: TIntegerField;
    QRProdutoNUM_EMBALAGEM: TFloatField;
    QRProdutoDESC_UNIDADE: TStringField;
    QRProdutoNUM_TRIB_TRANSFERENCIA: TIntegerField;
    QRProdutoVAL_VAREJO: TFloatField;
    QRProdutoVAL_ATACADO: TFloatField;
    QRProdutoPERC_DESCONTO_MAXIMO: TFloatField;
    QRProdutoPERC_IPI: TFloatField;
    QRProdutoDESC_CLASS_FISCAL: TStringField;
    QRProdutoIND_TIPO_PRODUTO: TStringField;
    QRProdutoDT_ALTERACAO_PRECO: TDateTimeField;
    QRProdutoNUM_FABRICANTE: TStringField;
    QRProdutoCOD_CADASTRO: TIntegerField;
    QRProdutoSQTDE_ESTOQUE: TFloatField;
    QRProdutoDESC_PRODUTO: TStringField;
    QRProdutosCodBarra: TOracleDataSet1;
    QRProdutoCodBarraPeq: TOracleDataSet1;
    QRProdutoCodBarraPeqCOD_PRODUTO: TFloatField;
    QRProdutoCodBarraPeqDESC_PRODUTO: TStringField;
    QREstoqueLevantamento: TOracleDataSet1;
    QREstoqueLevantamentoCOD_PRODUTO: TFloatField;
    QREstoqueLevantamentoDESC_CLASSE: TStringField;
    QREstoqueLevantamentoNUM_CLASSE: TIntegerField;
    QREstoqueLevantamentoNUM_SUBCLASSE: TIntegerField;
    QREstoqueLevantamentoCOD_CLASSE: TIntegerField;
    QREstoqueLevantamentoDESC_PRODUTO: TStringField;
    QRProdFornecedor_F: TOracleDataSet1;
    QRProdFornecedor_FCOD_CADASTRO: TIntegerField;
    QRProdFornecedor_FCOD_PRODUTO: TFloatField;
    QRProdFornecedor_FNOME: TStringField;
    QRProdFornecedor_FDESC_PRODUTO: TStringField;
    QRProdFornecedor_P: TOracleDataSet1;
    QRProdFornecedor_PCOD_PRODUTO: TFloatField;
    QRProdFornecedor_PCOD_CADASTRO: TIntegerField;
    QRProdFornecedor_PNOME: TStringField;
    QRProdFornecedor_PDESC_PRODUTO: TStringField;
    QRProdFornecedor_FVAL_PRODUTO: TFloatField;
    QRProdFornecedor_PVAL_PRODUTO: TFloatField;
    QRProdutoSemMovimentacao: TOracleDataSet1;
    QRProdutoSemMovimentacaoCOD_PRODUTO: TFloatField;
    QRProdutoSemMovimentacaoDESC_PRODUTO: TStringField;
    QREstoqueLevantamentoNUM_FABRICANTE: TStringField;
    QREstoqueSemEmbarque: TOracleDataSet1;
    QREstoqueSemEmbarqueCOD_PRODUTO: TIntegerField;
    QREstoqueSemEmbarqueDESC_PRODUTO: TStringField;
    QREstoqueSemEmbarqueQT_QUANTIDADE: TFloatField;
    QREstoqueSemEmbarqueQT_PRODUCAO: TFloatField;
    QREstoqueSemEmbarqueNUM_VOLUMES: TFloatField;
    QRPrecoMarca: TOracleDataSet1;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    QRProdutoMarcaVAL_PRODUTO_MARCA: TFloatField;
    QRPrecoMarcaVAL_CUSTO: TFloatField;
    QRProdutoServicoMotor: TOracleDataSet1;
    QRProdutoServicoMotorCOD_MARCA: TIntegerField;
    QRProdutoServicoMotorDESC_MARCA: TStringField;
    QRProdutoServicoMotorCOD_PRODUTO: TFloatField;
    QRProdutoServicoMotorDESC_PRODUTO: TStringField;
    QRProdutoServicoMotorQT_QUANTIDADE: TFloatField;
    QRProdutoServicoMotorVAL_PRODUTO_MARCA: TFloatField;
    QRProdutoServicoMotorVAL_PRODUTO_MARCA_TOTAL: TFloatField;
    QRProdutoServicoMotorDESC_UNIDADE: TStringField;
    QRListaPrecosDESC_LOCALIZACAO: TStringField;
    QRListaPrecosVAL_CUSTO_MEDIO: TFloatField;
    QRListaPrecosDESC_CLASSE: TStringField;
    QRProdutoLocalizacao: TOracleDataSet1;
    QRProdutoLocalizacaoCOD_PRODUTO: TFloatField;
    QRProdutoLocalizacaoNUM_FABRICANTE: TStringField;
    QRProdutoLocalizacaoDESC_PRODUTO: TStringField;
    QRProdutoLocalizacaoVAL_VAREJO: TFloatField;
    QRProdutoLocalizacaoVAL_ATACADO: TFloatField;
    QRProdutoLocalizacaoDESC_LOCALIZACAO: TStringField;
    QRProdutoLocalizacaoDESC_SECAO: TStringField;
    QRProdutoLocalizacaoDESC_BOQUETA: TStringField;
    QRProdutoLocalizacaoSQTDE_ESTOQUE: TFloatField;
    QEstoqueLote: TOracleDataSet1;
    QEstoqueLoteCOD_PRODUTO: TIntegerField;
    QEstoqueLoteCOD_LOTE_TIPO: TIntegerField;
    QEstoqueLoteDT_FABRICACAO: TDateTimeField;
    QEstoqueLoteNUM_PESO_LIQUIDO: TFloatField;
    QEstoqueLoteNUM_DIAS_VALIDADE: TIntegerField;
    QEstoqueLoteDESC_PRODUTO: TStringField;
    QEstoqueLoteDESC_LOTE: TStringField;
    QRProdutoValorDifMargem: TOracleDataSet1;
    QRProdutoValorDifMargemNUM_FABRICANTE: TStringField;
    QRProdutoValorDifMargemDESC_PRODUTO: TStringField;
    QRProdutoValorDifMargemVAL_CUSTO: TFloatField;
    QRProdutoValorDifMargemPERC_MARGEM_ATACADO: TFloatField;
    QRProdutoValorDifMargemVAL_ATACADO: TFloatField;
    QRProdutoValorDifMargemPERC_MARGEM_VAREJO: TFloatField;
    QRProdutoValorDifMargemVAL_VAREJO: TFloatField;
    QRProdutoValorDifMargemDESC_LOCALIZACAO: TStringField;
    QRProdutoValorDifMargemDESC_SECAO: TStringField;
    QRProdutoValorDifMargemDESC_BOQUETA: TStringField;
    QRProdutoValorDifMargemVAL_ATACADO_CORRIGIDO: TFloatField;
    QRProdutoValorDifMargemVAL_VAREJO_CORRIGIDO: TFloatField;
    QRProdFornecedor_FNUM_EMBALAGEM: TFloatField;
    QRProdFornecedor_PNUM_EMBALAGEM: TFloatField;
    QRProdutoNCM: TOracleDataSet1;
    QRProdutoNCMCOD_PRODUTO: TFloatField;
    QRProdutoNCMNUM_FABRICANTE: TStringField;
    QRProdutoNCMDESC_PRODUTO: TStringField;
    QRProdutoNCMNUM_GENERO_NCM: TStringField;
    QRProdutoLote: TOracleDataSet1;
    QRProdutoLoteDESC_PRODUTO: TStringField;
    QRProdutoLoteCOD_PRODUTO: TFloatField;
    QRProdutoLoteDESC_UNIDADE: TStringField;
    QRProdutoLoteDESC_LOTE: TStringField;
    QRProdutoLoteVAL_VAREJO: TFloatField;
    QRProdutoLoteVAL_ATACADO: TFloatField;
    QRProdutoMarcaQT_QUANTIDADE: TFloatField;
    QRProdutoSemMovimentacaoNUM_FABRICANTE: TStringField;
    QREtiquetaCaixa: TOracleDataSet1;
    QREtiquetaCaixaDESC_PRODUTO: TStringField;
    QREtiquetaCaixaCOD_PRODUTO: TFloatField;
    QREtiquetaCaixaDESC_COD_BARRA: TStringField;
    QREtiquetaZebra: TOracleDataSet1;
    QREtiquetaZebraDESC_PRODUTO: TStringField;
    QREtiquetaZebraAux: TOracleDataSet1;
    QREtiquetaZebraAuxCOD_PRODUTO: TFloatField;
    QREtiquetaZebraAuxDESC_PRODUTO: TStringField;
    QREtiquetaZebraAuxQT_QUANTIDADE: TIntegerField;
    CDSEtiquetaZebra: TClientDataSet;
    CDSEtiquetaZebraCOD_PRODUTO: TIntegerField;
    CDSEtiquetaZebraDESC_PRODUTO: TStringField;
    CDSEtiquetaZebraVAL_VAREJO: TFloatField;
    QREtiquetaZebraVAL_VAREJO: TFloatField;
    QREtiquetaZebraCOD_PRODUTO: TIntegerField;
    QREtiquetaZebraQT_QUANTIDADE: TIntegerField;
    QRProdutoClasseDESC_MARCA: TStringField;
    QRProdutoLoteDESC_LOCALIZACAO: TStringField;
    QRProdutoLoteDESC_MARCA: TStringField;
    CDSEtiquetaZebraind_preco_venda_etiqueta: TStringField;
    QREtiquetaZebraAuxIND_PRECO_VENDA_ETIQUETA: TStringField;
    QREtiquetaZebraIND_PRECO_VENDA_ETIQUETA: TStringField;
    QREstoqueLevantamentoQT_QUANTIDADE: TFloatField;
    QREstoqueLevantamentoFilial: TOracleDataSet1;
    QREstoqueLevantamentoFilialCOD_PRODUTO: TFloatField;
    QREstoqueLevantamentoFilialDESC_PRODUTO: TStringField;
    QREstoqueLevantamentoFilialNUM_FABRICANTE: TStringField;
    QREstoqueLevantamentoFilialDESC_CLASSE: TStringField;
    QREstoqueLevantamentoFilialNUM_CLASSE: TIntegerField;
    QREstoqueLevantamentoFilialNUM_SUBCLASSE: TIntegerField;
    QREstoqueLevantamentoFilialCOD_CLASSE: TIntegerField;
    QREstoqueLevantamentoFilialCOD_FILIAL: TIntegerField;
    QREstoqueLevantamentoFilialCOD_LOTE_TIPO: TIntegerField;
    QREstoqueLevantamentoFilialDESC_LOTE: TStringField;
    QREstoqueLevantamentoFilialDESC_MARCA: TStringField;
    QREstoqueLevantamentoFilialQT_QUANTIDADE: TFloatField;
    QREstoqueLevantamentoFilialDESC_FILIAL: TStringField;
    QREstoqueLevantamentoFilialDESC_LOCALIZACAO: TStringField;
    QREtiqueta: TOracleDataSet1;
    QREtiquetaCOD_PRODUTO: TFloatField;
    QREtiquetaDESC_PRODUTO: TStringField;
    QREtiquetaDESC_COMPLEMENTO: TStringField;
    QREtiquetaDESC_COMPLEMENTO_2: TStringField;
    QREtiquetaDESC_COD_BARRA: TStringField;
    QREtiquetaNUM_FABRICANTE: TStringField;
    CDSEtiquetaZebraCOD_FILIAL: TIntegerField;
    QRProdutoCOD_LOTE_TIPO: TIntegerField;
    QRProdutoDESC_LOTE: TStringField;
    QREtiquetaVAL_VAREJO: TFloatField;
    QRProdutoSemMovimentacaoQT_QUANTIDADE: TFloatField;
    QRProdutoSemMovimentacaoVL_CUSTO_MEDIO: TFloatField;
    QRProdutoNCMCOD_CEST: TStringField;
    QREtiquetaZebraDESC_COD_BARRA: TStringField;
    QRMovEntradaSaida: TOracleDataSet1;
    QRMovEntradaSaidaCOD_PRODUTO: TFloatField;
    QRMovEntradaSaidaSQT_ENTRADA: TFloatField;
    QRMovEntradaSaidaSVAL_UNIT_ENTRADA: TFloatField;
    QRMovEntradaSaidaSVAL_TOTAL_ENTRADA: TFloatField;
    QRMovEntradaSaidaSQT_EMB_ENTRADA: TFloatField;
    QRMovEntradaSaidaSQT_SAIDA: TFloatField;
    QRMovEntradaSaidaSVAL_UNIT_SAIDA: TFloatField;
    QRMovEntradaSaidaSVAL_TOTAL_SAIDA: TFloatField;
    QRMovEntradaSaidaSQT_EMB_SAIDA: TFloatField;
    QRMovEntradaSaidacusto: TFloatField;
    QRMovEntradaSaidaDESC_PRODUTO: TStringField;
    QRMovEntradaSaidaSQT_TOTAL: TFloatField;
    QRMovEntradaSaidaSQT_EMB_TOTAL: TFloatField;
    QRMovEntradaSaidaqt_quantidade: TFloatField;
    QRMovEntradaSaidaCOD_FILIAL: TIntegerField;
    QRMovEntradaSaidaNUM_MES: TFloatField;
    QRMovEntradaSaidaNUM_ANO: TFloatField;
    QRMovEntradaSaidasqt_estoque_total: TFloatField;
    QRMovEntradaSaidasqt_estoque_emb_total: TFloatField;
    QRMovEntradaSaidaNUM_EMBALAGEM: TFloatField;
    QREtiquetaZebraCOD_LOTE_TIPO: TIntegerField;
    CDSEtiquetaZebraCOD_LOTE_TIPO: TIntegerField;
    QRProdutoSEstoqueCOD_PRODUTO: TFloatField;
    QRProdutoSEstoqueCOD_CLASSE: TIntegerField;
    QRProdutoSEstoqueCOD_TRIBUTACAO: TIntegerField;
    CDSEtiquetaZebradesc_cod_barra: TStringField;
    QREtiquetaZebraNOME: TStringField;
    CDSEtiquetaZebraNOME_FABRICANTE: TStringField;
    CDSEtiquetaZebraNUM_FABRICANTE: TStringField;
    QREtiquetaZebraNUM_FABRICANTE: TStringField;
    CDSEtiquetaZebraDESC_LOCALIZACAO: TStringField;
    QRProdutoMarcaCOD_LOTE_TIPO: TIntegerField;
    QRProdutoMarcaDESC_LOTE: TStringField;
    QREtiquetaZebraDESC_LOCALIZACAO: TStringField;
    CDSEtiquetaZebradt_fabricacao: TDateField;
    CDSEtiquetaZebradt_vencimento: TDateField;
    QREtiquetaZebraNUM_CONVERTE_FARDO: TFloatField;
    CDSEtiquetaZebraNUM_CONVERTE_FARDO: TFloatField;
    QRProdutoDESC_COD_BARRA: TStringField;
    QRProdutoClasseDESC_COD_BARRA: TStringField;
    QRProdutoVL_ULTIMO_CUSTO: TFloatField;
    QREtiquetaCodBarraval_varejo3: TStringField;
    QREtiquetaCodBarradesc_produto3: TStringField;
    QREtiquetaCodBarraval_varejo4: TStringField;
    QREtiquetaCodBarradesc_produto4: TStringField;
    QREtiquetaCodBarraval_varejo5: TStringField;
    QREtiquetaCodBarradesc_produto5: TStringField;
    QREtiquetaCodBarraval_varejo1: TStringField;
    QREtiquetaCodBarradesc_produto1: TStringField;
    QREtiquetaZebraDESC_OBSERVACAO: TStringField;
    CDSEtiquetaZebradesc_observacao: TMemoField;
    procedure QREstoqueBaixaCalcFields(DataSet: TDataSet);
    procedure QREtiquetaCodBarraCalcFields(DataSet: TDataSet);
    procedure ImprimeEtiquetaZebra(DataSet: TClientDataSet);
    procedure QREstoqueLevantamentoCalcFields(DataSet: TDataSet);
    procedure ImprimeEtiquetaZebra8x3(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra8x3Finestra(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra8x3NeoAli(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra5x5(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebra5x3(DataSet: TClientDataSet);
    procedure ImprimeEtiquetaZebraJBATACADO(DataSet: TClientDataSet);
    procedure QRMovEntradaSaidaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    fValorEtiqueta: Boolean;
    fImprimeArtista: string;
    property pValorEtiqueta: Boolean read fValorEtiqueta write fValorEtiqueta;
    property pImprimeArtista: string read fImprimeArtista write fImprimeArtista;
  end;

var
  DMProdutoRelatorio: TDMProdutoRelatorio;

implementation

uses UOracle_cl, UParamSistema_cl, UFilial_cl, UBiblioteca;

{$R *.DFM}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall;external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external  'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height:  integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external  'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer):  integer; stdcall; external 'WINPPLA.DLL';function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar):
  integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer;  stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall;  external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';
function A_Feed_Label(): integer; stdcall; external 'WINPPLA.DLL';
function A_GetUSBDeviceInfo(nPort: integer; pDeviceName: PAnsiChar;
  pDeviceNameLen: PInteger;
  pDevicePath: PAnsiChar; pDevicePathLen: PInteger): integer; stdcall; external   'WINPPLA.DLL';
function A_EnumUSB(buf: PAnsiChar): integer; stdcall; external 'WINPPLA.DLL';
function A_GetUSBBufferLen(): integer; stdcall; external 'WINPPLA.DLL';
function A_Set_Backfeed(back: integer): integer; stdcall; external  'WINPPLA.DLL';
function  A_Set_Unit(unit_Renamed:char):integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Gap(gap:integer):integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Syssetting(transfer:integer; cut_peel:integer; length:integer; zero:integer; pause:integer):integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Sensor_Mode(type_Renamed:char; continuous:integer):integer;stdcall; external 'WINPPLA.DLL';


//PPLB

function B_Set_Darkness(darkness: integer): integer; stdcall; external
  'WINPPLB.DLL';

function B_CreatePrn(selection: integer; FileName: pchar): integer; stdcall;
  external 'WINPPLB.DLL';

function B_Print_Out(labset: integer): integer; stdcall; external 'WINPPLB.DLL';

function B_Prn_Text(x, y, ori, font, hor_factor, ver_factor: integer; mode:
  char; data: pchar): integer; stdcall; external 'WINPPLB.DLL';
//function B_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLB.DLL';

function B_Prn_Barcode(x, y, ori: integer; typee: string; n, w, height: integer;
  human: char; data: pchar): integer; stdcall; external 'WINPPLB.DLL';

function B_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight,
  FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer):
  integer; stdcall; external 'WINPPLB.DLL';

function B_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar):
  integer; stdcall; external 'WINPPLB.DLL';

function B_Draw_Box(mode, x, y, width, height, top, side: integer): integer;
  stdcall; external 'WINPPLB.DLL';

function B_Draw_Line(mode, x, y, width, height: integer): integer; stdcall;
  external 'WINPPLB.DLL';

procedure B_ClosePrn(); stdcall; external 'WINPPLB.DLL';

function B_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external
  'WINPPLB.DLL';

function B_Clear_Memory(): integer; stdcall; external 'WINPPLB.DLL';

function B_GetUSBDeviceInfo(nPort: integer; pDeviceName: PAnsiChar;
  pDeviceNameLen: PInteger;
  pDevicePath: PAnsiChar; pDevicePathLen: PInteger): integer; stdcall; external
    'WINPPLB.DLL';

function B_EnumUSB(buf: PAnsiChar): integer; stdcall; external 'WINPPLB.DLL';

function B_GetUSBBufferLen(): integer; stdcall; external 'WINPPLB.DLL';
//function  B_Set_Backfeed(back:integer):integer;stdcall;external 'WINPPLB.DLL';

function B_Set_Backfeed(option: char): integer; stdcall; external 'WINPPLB.DLL';
//int B_Set_Backfeed(char option);

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
  {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;
  {if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    A_Set_Unit('m');             // Unidade métrica
    A_Set_Sensor_Mode('e', 0);   // Sensor transmissivo / GAP
    A_Set_Gap(2);                // GAP = 2 mm
    A_Set_Syssetting(
                1,    // Direct Thermal
                0,    // Sem cutter / peel
                79,   // Comprimento da etiqueta = 20 mm
                1,    // Zero normal
                2);     // Cancela pause
  end;}
 // A_Set_Darkness(12);
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', '');
  if wEmpresa = 'NIR' then
    wEmpresa := 'CEMAPA';
      
  wDuasColunas := (wEmpresa = 'DINIZ'); //Medibens é apenas 2 colunas

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        if wEmpresa = 'DINIZ' then
        begin
          //A_Prn_Text(020, 040, 1, 1, 0, 1, 3, 'n', 2, pchar(DataSet.FieldByName('NUM_FABRICANTE').AsString));
          //A_Prn_Text(020, 038, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,25)));
          //A_Prn_Text(020,  25, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,25)));
          //A_Prn_Text(020,  10, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,26,25)));
          A_Prn_Text_TrueType(20, 50, 30, 'Arial', 1, 700, 0, 0, 0, 'AA' , pchar(DataSet.FieldByName('NUM_FABRICANTE').AsString), 1);
          A_Prn_Text_TrueType(20, 38, 30, 'Arial', 1, 700, 0, 0, 0, 'AB' , pchar(Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,39)), 1);
          A_Prn_Text_TrueType(20, 25, 30, 'Arial', 1, 700, 0, 0, 0, 'AC' , pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,25)), 1);
          A_Prn_Text_TrueType(20, 14, 30, 'Arial', 1, 700, 0, 0, 0, 'AD' , pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,26,25)), 1);
          //A_Set_Backfeed(320);
          //A_Print_Out(1, 1, 1, 1);
//          A_Prn_Barcode(60, 014, 1, 'a', 0, 1, 22, 'N', 0,pchar(FormatFloat('00', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
//          A_Prn_Text(020, 020, 2, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,39)));
//          A_Prn_Text(020, 010, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,39)));
//          B_Prn_Text(015, 040, 1, 2, 1, 1, 'n', pchar('Num.Fabric.: '+ DataSet.FieldByName('NUM_FABRICANTE').AsString));
          //B_Prn_Text(015, 020, 1, 2, 1, 1, 'n', pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,39)));

        end
        else if wEmpresa = 'PIXIXE' then
        begin
          A_Prn_Text(043, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PIXIXE'));
          A_Prn_Text(008, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(008, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'LOJAS COZER LTDA') then
          //wEmpresa = 'COZER' // COZER, PROPE, PLANETA MANIA UTILIZAM O MESMO COD_EMPRESA
        begin //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
          A_Prn_Text(043, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('COZER'));
          A_Prn_Text(008, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(008, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(008, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'PROPE CALCADOS') or
          //MIRACI PRECISA DESSA FORMA A IMPRESSAO DA ETIQUETA, MAS UTILIZA O COD_EMPRESA COZER
        (DMParamSistema.QParamSistemaDESC_EMPRESA.Value = 'PLANETA MANIA') then
          //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
        begin
          A_Prn_Text(012, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(008, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(008, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(008, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
{Prope mudou de dono e o CodEmpresa foi separado. Alex 01/02/2024. Luiz solicitou aumentar o tamanho do código de barras. 21/05/2025}
        else if (DMParamSistema.CodEmpresa = 'PROPE') then
        begin
          A_Prn_Text(012, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(008, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(008, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(008, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 2, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'PAPELARIA' then
        begin
          A_Prn_Text(043, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(010, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(010, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(050, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'OSARE' then
        begin
          A_Prn_Text(040, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(010, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(010, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(025, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(040, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
        end
        else if wEmpresa = 'MODASUL' then
        begin
          A_Prn_Text(040, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(010, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(010, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(040, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(040, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
        end
        else if wEmpresa = 'KREUZ' then
        begin
          A_Prn_Text(030, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('KREUZ & CIA'));
          A_Prn_Text(013, 055, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(013, 040, 1, 1, 0, 2, 2, 'n', 2, pchar('Cod. ' +
            DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(050, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'NFCE-DOCES' then
        begin
          A_Prn_Text(043, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('JR DOCES'));
          A_Prn_Text(008, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if (pValorEtiqueta = true) then
            A_Prn_Text(008, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        end
        else if (wEmpresa = 'CEMAPA') or (wEmpresa = 'BAZAR') then
        begin
          A_Prn_Text(035, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(015, 057, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(015, 040, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(012, 014, 1, 'a', 0, 20, 23, 'N', 10,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(050, 001, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if (wEmpresa = 'NUTRIPET') then
        begin
          A_Prn_Text(028, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('NUTRIPET')); //023
          A_Prn_Text(010, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
            //003
          if Length(DataSet.fieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(010, 035, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(010, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('Cod. ' +
            DataSet.FieldByName('COD_PRODUTO').AsString)); //008
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            // este campo esta no cadastro de produtos e indica se é para emitir preco de venda na etiqueta
            A_Prn_Text(068, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          //A_Prn_Barcode(033, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(FormatFloat('000000',QEtiqNotaCOD_PRODUTO.Value)));
        end
        else if wEmpresa = 'QUERENCIA' then
        begin
          A_Prn_Text(030, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('QUERENCIA'));
          A_Prn_Text(005, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(005, 038, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
            {A_Prn_Text(005, 028, 1, 1, 0, 1, 2, 'n', 2, pchar('A prazo: R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_ATACADO').AsFloat)));}
          A_Prn_Barcode(015, 004, 1, 'D', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(080, 006, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if (wEmpresa = 'EMBGARCIA') or (wEmpresa = 'EMBVAL') then
        begin
          A_Prn_Text(033, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('EMBEMA'));
          A_Prn_Text(003, 055, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Barcode(003, 020, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(050, 006, 1, 1, 0, 2, 2, 'n', 2,pchar('R$' + FormatFloat('0.00',DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Text(003, 006, 1, 1, 0, 1, 2, 'n', 2,pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if (wEmpresa = 'CEIFAGRIL') then
        begin
          A_Prn_Text(005, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('JR MULTIPECAS'));
          A_Prn_Text(003, 056, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(003, 044, 1, 1, 0, 1, 2, 'n', 2, pchar('Fab. ' + DataSet.FieldByName('NUM_FABRICANTE').AsString));
          A_Prn_Text(003, 032, 1, 1, 0, 1, 2, 'n', 2, pchar('Loc. ' + DataSet.FieldByName('DESC_LOCALIZACAO').AsString));
          //A_Prn_Text(003, 020, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(010, 002, 1, 'D', 0, 1, 20, 'N', 0,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'FRACTA' then
        begin
          A_Prn_Text(005, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('FRACTA'));
          A_Prn_Text(005, 056, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(005, 038, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(015, 004, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(080, 006, 1, 1, 0, 1, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if wEmpresa = 'FERRAGENS' then
        begin
          A_Prn_Text(005, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('AGROFERRAGENS'));
          A_Prn_Text(005, 056, 1, 1, 0, 2, 2, 'n', 2, pchar('COSTA OESTE'));
          A_Prn_Text(005, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
//          A_Prn_Text(005, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 50)));
          {A_Prn_Barcode(015, 004, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(080, 006, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));}
          A_Prn_Barcode(012, 014, 1, 'a', 0, 20, 23, 'N', 10,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(050, 001, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else
        begin
          A_Prn_Text(033, 070, 1, 1, 0, 2, 2, 'n', 2,
            pchar(wEmpresa));
          A_Prn_Text(003, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(003, 035, 1, 1, 0, 1, 2, 'n', 2,
            pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
          A_Prn_Text(050, 006, 1, 1, 0, 2, 2, 'n', 2,
            pchar('R$' + FormatFloat('0.00',
              DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(003, 004, 1, 'D', 0, 1, 22, 'N', 0,
          pchar(FormatFloat('0000',
          DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end;
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin
        if wEmpresa = 'DINIZ' then
        begin
          A_Prn_Text_TrueType(225, 50, 30, 'Arial', 1, 700, 0, 0, 0, 'AA' , pchar(DataSet.FieldByName('NUM_FABRICANTE').AsString), 1);
          A_Prn_Text_TrueType(225, 38, 30, 'Arial', 1, 700, 0, 0, 0, 'AB' , pchar(Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,39)), 1);
          A_Prn_Text_TrueType(225, 25, 30, 'Arial', 1, 700, 0, 0, 0, 'AC' , pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,25)), 1);
          A_Prn_Text_TrueType(225, 14, 30, 'Arial', 1, 700, 0, 0, 0, 'AD' , pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,26,25)), 1);

          //A_Prn_Text(220, 040, 1, 1, 0, 1, 3, 'n', 2, pchar('Num.AFabric.: '+ DataSet.FieldByName('NUM_FABRICANTE').AsString));
          {A_Prn_Text(220, 020, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_LOCALIZACAO').AsString,1,39)));
          A_Prn_Text(220, 020, 1, 1, 0, 1, 3, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,39)));}

          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'PIXIXE' then
        begin
          A_Prn_Text(185, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PIXIXE'));
          A_Prn_Text(148, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(148, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(160, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'LOJAS COZER LTDA') then
          //wEmpresa = 'COZER'  // COZER, PROPE, PLANETA MANIA UTILIZAM O MESMO COD_EMPRESA
        begin //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
          A_Prn_Text(185, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('COZER'));
          A_Prn_Text(150, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(150, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(150, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(160, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'PROPE CALCADOS') or
          //MIRACI PRECISA DESSA FORMA A IMPRESSAO DA ETIQUETA, MAS UTILIZA O COD_EMPRESA COZER
        (DMParamSistema.QParamSistemaDESC_EMPRESA.Value = 'PLANETA MANIA') then
          //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
        begin
          A_Prn_Text(154, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(150, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(150, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(150, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(160, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
{Prope mudou de dono e o CodEmpresa foi separado. Alex 01/02/2024. Luiz solicitou aumentar o tamanho do código de barras. 21/05/2025}
        else if (DMParamSistema.CodEmpresa = 'PROPE') then
        begin
          A_Prn_Text(154, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(150, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(150, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(150, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(160, 006, 1, 'D', 0, 1, 20, 'N', 2, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'PAPELARIA' then
        begin
          A_Prn_Text(185, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(152, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(152, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(190, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'OSARE' then
        begin
          A_Prn_Text(180, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(150, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(150, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(165, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(180, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
        end
        else if wEmpresa = 'MODASUL' then
        begin
          A_Prn_Text(180, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(150, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(150, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(180, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(180, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
        end
        else if wEmpresa = 'KREUZ' then
        begin
          A_Prn_Text(173, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('KREUZ & CIA'));
          A_Prn_Text(155, 055, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(155, 040, 1, 1, 0, 2, 2, 'n', 2, pchar('Cod. ' +
            DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(190, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'NFCE-DOCES' then
        begin
          A_Prn_Text(185, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('JR DOCES'));
          A_Prn_Text(148, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if (pValorEtiqueta = true) then
            A_Prn_Text(148, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(160, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        end
        else if (wEmpresa = 'CEMAPA') or (wEmpresa = 'BAZAR') then
        begin
          A_Prn_Text(174, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(150, 057, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(150, 040, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));

          A_Prn_Barcode(150, 014, 1, 'a', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(187, 001, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if (wEmpresa = 'NUTRIPET') then
        begin
          A_Prn_Text(175, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('NUTRIPET')); //175
          A_Prn_Text(155, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
            //145
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(155, 035, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(155, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('Cod. ' +
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString))); //148
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            // este campo esta no cadastro de produtos e indica se é para emitir preco de venda na etiqueta
            A_Prn_Text(208, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          //        A_Prn_Barcode(176, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(FormatFloat('000000',QEtiqNotaCOD_PRODUTO.Value)));
        end
        else if wEmpresa = 'QUERENCIA' then
        begin
          A_Prn_Text(170, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('QUERENCIA'));
          A_Prn_Text(150, 055, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(150, 038, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
         { A_Prn_Text(150, 028, 1, 1, 0, 1, 2, 'n', 2, pchar('A prazo: R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_ATACADO').AsFloat)));}
          A_Prn_Barcode(155, 006, 1, 'D', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(215, 006, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else if (wEmpresa = 'EMBGARCIA') or (wEmpresa = 'EMBVAL') then
        begin
          A_Prn_Text(170, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('EMBEMA'));
          A_Prn_Text(143, 055, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Barcode(143, 020, 1, 'D', 0, 1, 22, 'N', 0, pchar(FormatFloat('0000000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
//          A_Prn_Text(143, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(195, 006, 1, 1, 0, 2, 2, 'n', 2, pchar('R$' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Text(143, 006, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
//          A_Prn_Barcode(143, 004, 1, 'D', 0, 1, 22, 'N', 0, pchar(FormatFloat('0000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if (wEmpresa = 'CEIFAGRIL') then
        begin
          A_Prn_Text(145, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('JR MULTIPECAS'));
          A_Prn_Text(144, 056, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(144, 044, 1, 1, 0, 1, 2, 'n', 2, pchar('Fab. ' + DataSet.FieldByName('NUM_FABRICANTE').AsString));
          A_Prn_Text(144, 032, 1, 1, 0, 1, 2, 'n', 2, pchar('Loc. ' + DataSet.FieldByName('DESC_LOCALIZACAO').AsString));
          //A_Prn_Text(003, 020, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(150, 002, 1, 'D', 0, 1, 20, 'N', 0,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end
        else if wEmpresa = 'FRACTA' then
        begin
          A_Prn_Text(150, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('FRACTA'));
          A_Prn_Text(150, 055, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(150, 038, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(155, 006, 1, 'D', 0, 1, 22, 'N', 0, pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(215, 006, 1, 1, 0, 1, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end 
        else if wEmpresa = 'FERRAGENS' then
        begin
          A_Prn_Text(150, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('AGROFERRAGENS'));
          A_Prn_Text(150, 056, 1, 1, 0, 2, 2, 'n', 2, pchar('COSTA OESTE'));
          A_Prn_Text(150, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          //A_Prn_Text(150, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 50)));
          {A_Prn_Barcode(015, 004, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(080, 006, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));}
          A_Prn_Barcode(150, 014, 1, 'a', 0, 20, 23, 'N', 10,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(187, 001, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
        end
        else
        begin
          A_Prn_Text(170, 070, 1, 1, 0, 2, 2, 'n', 2,
            pchar(wEmpresa));
          A_Prn_Text(143, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(143, 035, 1, 1, 0, 1, 2, 'n', 2,
            pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(195, 006, 1, 1, 0, 2, 2, 'n', 2,
              pchar('R$' + FormatFloat('0.00',
                DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(143, 004, 1, 'D', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        end;
      end;
      if wColuna = 3 then
      begin
        if wEmpresa = 'PIXIXE' then
        begin
          A_Prn_Text(320, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PIXIXE'));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(295, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(300, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'LOJAS COZER LTDA') then
          //wEmpresa = 'COZER' // COZER, PROPE, PLANETA MANIA UTILIZAM O MESMO COD_EMPRESA
        begin //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
          A_Prn_Text(330, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('COZER'));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(295, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(295, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(330, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if (DMParamSistema.QParamSistemaDESC_EMPRESA.Value =
          'PROPE CALCADOS') or
          //MIRACI PRECISA DESSA FORMA A IMPRESSAO DA ETIQUETA, MAS UTILIZA O COD_EMPRESA COZER
        (DMParamSistema.QParamSistemaDESC_EMPRESA.Value = 'PLANETA MANIA') then
          //UNICA FORMA FOI UTILIZAR DESC_EMPRESA. JUNIOR 15/07/2020. Obs: Não xingar...kkkk
        begin
          A_Prn_Text(299, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(295, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(295, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(330, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
{Prope mudou de dono e o CodEmpresa foi separado. Alex 01/02/2024. Luiz solicitou aumentar o tamanho do código de barras. 21/05/2025}
        else if (DMParamSistema.CodEmpresa = 'PROPE') then
        begin
          A_Prn_Text(299, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('PROPE/PLANETA'));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 28 then
          begin
            A_Prn_Text(295, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 56)));
          end;
          A_Prn_Text(295, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(330, 006, 1, 'D', 0, 1, 20, 'N', 2, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'PAPELARIA' then
        begin
          A_Prn_Text(330, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(297, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(297, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(330, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(
            FormatFloat('000000',
              DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'OSARE' then
        begin
          A_Prn_Text(332, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(295, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(290, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(325, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'MODASUL' then
        begin
          A_Prn_Text(332, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(295, 045, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(325, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
            FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(325, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger) +
            FormatFloat('00', DataSet.FieldByName('COD_LOTE_TIPO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'KREUZ' then
        begin
          A_Prn_Text(310, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('KREUZ & CIA'));
          A_Prn_Text(298, 055, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(298, 040, 1, 1, 0, 2, 2, 'n', 2, pchar('Cod. ' +
            DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(330, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(FormatFloat('000000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));

          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'NFCE-DOCES' then
        begin
          A_Prn_Text(320, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('JR DOCES'));
          A_Prn_Text(295, 056, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if (pValorEtiqueta = true) then
            A_Prn_Text(295, 040, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(300, 006, 1, 'D', 0, 1, 20, 'N', 0,
            pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if (wEmpresa = 'CEMAPA') or (wEmpresa = 'BAZAR') then
        begin
          A_Prn_Text(317, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(295, 057, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(295, 040, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(295, 014, 1, 'a', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(330, 001, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if (wEmpresa = 'NUTRIPET') then
        begin
          A_Prn_Text(320, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('NUTRIPET')); //300
          A_Prn_Text(303, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
            //209
          if Length(DataSet.FieldByName('DESC_PRODUTO').AsString) > 26 then
          begin
            A_Prn_Text(303, 035, 1, 1, 0, 1, 2, 'n', 2,
              pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 27, 56)));
          end;
          A_Prn_Text(303, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('Cod. ' +
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            // este campo esta no cadastro de produtos e indica se é para emitir preco de venda na etiqueta
            A_Prn_Text(350, 010, 1, 1, 0, 1, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          //        A_Prn_Barcode(317, 006, 1, 'D', 0, 1, 20, 'N', 0, pchar(FormatFloat('000000',QEtiqNotaCOD_PRODUTO.Value)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if wEmpresa = 'QUERENCIA' then
        begin
          A_Prn_Text(310, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('QUERENCIA'));
          A_Prn_Text(290, 055, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(292, 038, 1, 1, 0, 2, 3, 'n', 2, pchar('R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          {A_Prn_Text(292, 028, 1, 1, 0, 1, 2, 'n', 2, pchar('A prazo: R$ ' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_ATACADO').AsFloat)));}
          A_Prn_Barcode(292, 006, 1, 'D', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(355, 006, 1, 1, 0, 2, 2, 'n', 2,
            pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if (wEmpresa = 'EMBGARCIA') or (wEmpresa = 'EMBVAL') then
        begin
          A_Prn_Text(320, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('EMBEMA'));
          A_Prn_Text(290, 055, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Barcode(290, 020, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(340, 006, 1, 1, 0, 2, 2, 'n', 2, pchar('R$' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Text(290, 006, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. '+DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
        end
        else if (wEmpresa = 'CEIFAGRIL') then
        begin
          A_Prn_Text(288, 070, 1, 1, 0, 2, 2, 'n', 2,pchar('JR MULTIPECAS'));
          A_Prn_Text(285, 056, 1, 1, 0, 1, 2, 'n', 2,pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(285, 044, 1, 1, 0, 1, 2, 'n', 2, pchar('Fab. ' + DataSet.FieldByName('NUM_FABRICANTE').AsString));
          A_Prn_Text(285, 032, 1, 1, 0, 1, 2, 'n', 2, pchar('Loc. ' + DataSet.FieldByName('DESC_LOCALIZACAO').AsString));
          //A_Prn_Text(003, 020, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Prn_Barcode(300, 002, 1, 'D', 0, 1, 20, 'N', 0,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
        end else if wEmpresa = 'FRACTA' then
        begin
          A_Prn_Text(290, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('FRACTA'));
          A_Prn_Text(290, 055, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(292, 038, 1, 1, 0, 1, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(292, 006, 1, 'D', 0, 1, 22, 'N', 0, pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(355, 006, 1, 1, 0, 1, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end 
        else if wEmpresa = 'FERRAGENS' then
        begin
          A_Prn_Text(290, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('AGROFERRAGENS'));
          A_Prn_Text(290, 056, 1, 1, 0, 2, 2, 'n', 2, pchar('COSTA OESTE'));
          A_Prn_Text(290, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          //A_Prn_Text(290, 040, 1, 1, 0, 1, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 29, 50)));
          {A_Prn_Barcode(015, 004, 1, 'D', 0, 1, 22, 'N', 0,pchar(FormatFloat('0000', DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(080, 006, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));}
          A_Prn_Barcode(295, 014, 1, 'a', 0, 20, 23, 'N', 10,pchar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
          A_Prn_Text(330, 001, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else if not wDuasColunas then
        begin
          A_Prn_Text(320, 070, 1, 1, 0, 2, 2, 'n', 2, pchar(wEmpresa));
          A_Prn_Text(290, 048, 1, 1, 0, 1, 2, 'n', 2,
            pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 28)));
          A_Prn_Text(290, 035, 1, 1, 0, 1, 2, 'n', 2, pchar('Cod. ' +
            DataSet.FieldByName('COD_PRODUTO').AsString));
          if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
            A_Prn_Text(340, 006, 1, 1, 0, 2, 2, 'n', 2, pchar('R$' +
              FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(290, 004, 1, 'D', 0, 1, 22, 'N', 0,
            pchar(FormatFloat('0000',
            DataSet.FieldByName('COD_PRODUTO').AsInteger)));              
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
        end;
      end;

      Inc(wColuna);

      {if (DMParamSistema.CodEmpresa = 'DINIZ') then
      begin
       if wColuna > 2 then
       begin
         wColuna := 1;
         wControla_Ultima_Linha := False;
       end;// bloco INID.
      end
      else}
      if wColuna > 3 then
      begin
        wColuna := 1;
        wControla_Ultima_Linha := False;
      end;
    end
    else
    begin

      AssignFile(ArqTeste, 'c:\etiquetas.txt');
      if DataSet.RecNo = 1 then
        Rewrite(ArqTeste)
      else
        Append(ArqTeste);
      Writeln(ArqTeste, IntToStr(DataSet.RecNo) + ' ' + wEmpresa);
      Writeln(ArqTeste, DataSet.FieldByName('DESC_PRODUTO').AsString);
      Writeln(ArqTeste, 'Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString);
      if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
        Writeln(ArqTeste, 'R$ ' + DataSet.FieldByName('VAL_VAREJO').AsString);
      Writeln(ArqTeste, '                                            ');
      CloseFile(ArqTeste);
    end;
    {if wDuasColunas then
    begin
     if wColuna = 2 then
      DataSet.Next;
    end
    else
     DataSet.Next; }
    if ((wColuna <> 3) and (wDuasColunas)) or (not wDuasColunas) then
      DataSet.Next;

  end;
  if wImprimir then
    if wControla_Ultima_Linha then
      if wDuasColunas then
      begin
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
      begin
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
      end;
  A_ClosePrn;
end;


procedure TDMProdutoRelatorio.QREstoqueBaixaCalcFields(DataSet: TDataSet);
begin
  QREstoqueBaixadesc_produto_baixa.Value :=
    DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' +
    FloatToStr(QREstoqueBaixaCod_Produto_baixa.Value));
  QREstoqueBaixadesc_lote_tipo.Value :=
    DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = ' +
    FloatToStr(QREstoqueBaixaCod_Lote_Tipo.Value));
  QREstoqueBaixadesc_lote_tipo_baixa.Value :=
    DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = ' +
    FloatToStr(QREstoqueBaixaCod_Lote_Tipo_baixa.Value));
end;

procedure TDMProdutoRelatorio.QREtiquetaCodBarraCalcFields(
  DataSet: TDataSet);
var
  S: string;
begin


  if DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text <> '' then
  begin
    if Length(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text) > 6 then
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto1.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text)
    else
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto1.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'COD_PRODUTO = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text);
    S := (DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = '
      + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text));
    if S <> '' then
    begin
      S := FormatFloat('###,###.00', StrToFloat(S));
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo1.Value := 'Preço R$ ' + S;
    end
    else
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo1.Value := 'Preço R$ ' +
        '0,00';
  end;

  if DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA2.Text <> '' then
  begin
    if Length(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA2.Text) > 6 then
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto2.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA2.Text)
    else
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto2.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'COD_PRODUTO = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA2.Text);
    S := (DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = '
      + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA2.Text));
    if S <> '' then
    begin
      S := FormatFloat('###,###.00', StrToFloat(S));
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo2.Value := 'Preço R$ ' + S;
    end
    else
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo2.Value := 'Preço R$ ' +
        '0,00';
  end;

  if DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA3.Text <> '' then
  begin
    if Length(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA3.Text) > 6 then
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto3.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA3.Text)
    else
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto3.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'COD_PRODUTO = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA3.Text);
    S := (DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = '
      + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA3.Text));
    if S <> '' then
    begin
      S := FormatFloat('###,###.00', StrToFloat(S));
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo3.Value := 'Preço R$ ' + S;
    end
    else
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo3.Value := 'Preço R$ ' +
        '0,00';
  end;

  if DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA4.Text <> '' then
  begin
    if Length(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA4.Text) > 6 then
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto4.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA4.Text)
    else
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto4.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'COD_PRODUTO = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA4.Text);
    S := (DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = '
      + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA4.Text));
    if S <> '' then
    begin
      S := FormatFloat('###,###.00', StrToFloat(S));
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo4.Value := 'Preço R$ ' + S;
    end
    else
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo4.Value := 'Preço R$ ' +
        '0,00';
  end;

  if DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA5.Text <> '' then
  begin
    if Length(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA5.Text) > 6 then
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto5.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA5.Text)
    else
      DMProdutoRelatorio.QREtiquetaCodBarradesc_produto5.Value :=
        DMOracle.BuscaNome('SELECT LOWER(DESC_PRODUTO) FROM TB_PRODUTO',
        'COD_PRODUTO = ' + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA5.Text);
    S := (DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = '
      + DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA5.Text));
    if S <> '' then
    begin
      S := FormatFloat('###,###.00', StrToFloat(S));
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo5.Value := 'Preço R$ ' + S;
    end
    else
      DMProdutoRelatorio.QREtiquetaCodBarraval_varejo5.Value := 'Preço R$ ' +
        '0,00';
  end;

end;

procedure TDMProdutoRelatorio.QREstoqueLevantamentoCalcFields(
  DataSet: TDataSet);
begin
  //QREstoqueLevantamentoqt_quantidade.Text := DMOracle.FastSelect('SUM(QT_QUANTIDADE)','TB_ESTOQUE','COD_PRODUTO = '+QREstoqueLevantamentoCOD_PRODUTO.Text);   //coloquei direto na query - Vanessa 11/12/2014
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra8x3(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  inherited;
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  //  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA','TB_FILIAL','COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
 {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
   if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;

  {if DMParamSistema.CodEmpresa = 'MAVENIDA' then
    A_Set_Darkness(14)
  else
    A_Set_Darkness(12); //Escurecer a Impressão}
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if DMParamSistema.CodEmpresa = 'LACARNES' then
      begin
        A_Prn_Text(001, 085, 1, 2, 0, 2, 1, 'n', 2, pchar('COD.' + DataSet.FieldByName('COD_PRODUTO').AsString));
        A_Prn_Text(001, 050, 1, 1, 0, 2, 4, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 35)));
        A_Prn_Text(001, 030, 1, 2, 0, 2, 1, 'n', 1, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        A_Prn_Text(160, 010, 1, 2, 0, 2, 4, 'n', 2, pchar('R$ ' + FormatFloat('##,##0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
      begin
        if DMParamSistema.CodEmpresa <> 'MAVENIDA' then
          A_Prn_Text(001, 080, 1, 2, 0, 2, 1, 'n', 2, pchar('COD.' + DataSet.FieldByName('COD_PRODUTO').AsString));
        A_Prn_Text(001, 050, 1, 1, 0, 2, 4, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 35)));
        if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') then
          A_Prn_Text(001, 030, 1, 2, 0, 2, 1, 'n', 1, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString))
        else if (DMParamSistema.CodEmpresa = 'QUERENCIA') then
          A_Prn_Text(001, 030, 1, 2, 0, 2, 1, 'n', 1, pchar(DataSet.FieldByName('COD_PRODUTO').AsString));

        A_Prn_Text(155, 010, 1, 2, 0, 2, 4, 'n', 2, pchar('R$ ' + FormatFloat('##,##0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end;
    end;
    DataSet.Next;
  end;
  A_ClosePrn;

end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra8x3Finestra(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  inherited;
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  //  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA','TB_FILIAL','COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
 {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
   if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;

  {if DMParamSistema.CodEmpresa = 'MAVENIDA' then
    A_Set_Darkness(14)
  else
    A_Set_Darkness(12); //Escurecer a Impressão}
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      A_Prn_Text  (001, 090, 1, 2, 0, 2, 1, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 26)));
      if DataSet.FieldByName('NUM_CONVERTE_FARDO').Value < 1 then
      begin
        A_Prn_Text(160, 045, 1, 2, 0, 2, 4, 'n', 1, pchar('R$ ' + FormatFloat('##,##0.00', (DataSet.FieldByName('VAL_VAREJO').AsFloat/1000)*100) ));
        A_Prn_Text(001, 045, 1, 2, 0, 2, 1, 'n', 1, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        A_Prn_Text(001, 030, 1, 2, 0, 2, 1, 'n', 2, pchar('REF PRECO POR 100G'));
        A_Prn_Text(030, 010, 1, 2, 0, 2, 1, 'n', 1, pchar('PRECO POR KG R$ '+ FormatFloat('##,##0.00',DataSet.FieldByName('VAL_VAREJO').AsFloat)));
      end
      else
      begin
        A_Prn_Text(160, 045, 1, 2, 0, 2, 4, 'n', 1, pchar('R$ ' + FormatFloat('##,##0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
        A_Prn_Text(001, 010, 1, 2, 0, 2, 1, 'n', 1, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
      end;
      A_Set_Backfeed(320);
      A_Print_Out(1, 1, 1, 1);
    end;
    DataSet.Next;
  end;
  A_ClosePrn;

end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra8x3NeoAli(DataSet:
  TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  inherited;
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  //  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA','TB_FILIAL','COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);

  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.

  //A_Set_Darkness(15); //Escurecer a Impressão
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      A_Prn_Text(035, 090, 1, 1, 0, 2, 3, 'n', 2,
        pchar(DataSet.FieldByName('NUM_FABRICANTE').AsString));
//Adicionado para não imprimir o nome de artista. Solicitado pelo Rogerio. cod_suporte: 5063. Alex 06/06/2022
      if pImprimeArtista = 'ARTISTA' then
        A_Prn_Text(015, 076, 1, 1, 0, 2, 2, 'n', 2, pchar('ARTISTA:' +
          Copy(DataSet.FieldByName('NOME_FABRICANTE').AsString, 1, 35)))
      else
        A_Prn_Text(015, 076, 1, 1, 0, 2, 2, 'n', 2, pchar(pImprimeArtista)); //pchar('LINHA ACCESS'));

      A_Prn_Text(015, 060, 1, 1, 0, 2, 2, 'n', 2,
        pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 35)));
      //A_Prn_Barcode(018, 030, 1, 'I', 0, 1, 20, 'N', 0,pchar(bib.LimpaString(DataSet.FieldByName('NUM_FABRICANTE').AsString,'A~Z')));
      A_Prn_Barcode(060, 015, 1, 'D', 0, 10, 33, 'N', 0,
        pchar(FormatFloat('0000000000',
        DataSet.FieldByName('COD_PRODUTO').AsInteger)));
      if pValorEtiqueta = True then
        //        A_Prn_Text(200, 015, 1, 1, 0, 1, 2, 'n', 2,pchar('R$ '+ FormatFloat('0.00',DataSet.FieldByName('VAL_VAREJO').AsFloat)));
        A_Prn_Text(170, 015, 1, 1, 0, 2, 2, 'n', 2, pchar('NBA' +
          DataSet.FieldByName('VAL_VAREJO').AsString + '00'));
      A_Set_Backfeed(320);
      A_Print_Out(1, 1, 1, 1);
    end;
    DataSet.Next;
  end;
  A_ClosePrn;

end;

procedure TDMProdutoRelatorio.QRMovEntradaSaidaCalcFields(
  DataSet: TDataSet);
begin
  QRMovEntradaSaidaCusto.Text :=
    DMOracle.BuscaNome('SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE',
    'COD_PRODUTO = ' + QRMovEntradaSaidaCod_Produto.Text);
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
  begin
    QRMovEntradaSaidaSqt_Estoque_Total.Text :=
      DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE', 'COD_PRODUTO = '
      + QRMovEntradaSaidaCod_Produto.Text + ' And Cod_Filial=' +
      QRMovEntradaSaidaCod_Filial.Text);
    QRMovEntradaSaidaSqt_Estoque_Emb_Total.Value := 0;
    QRMovEntradaSaidaQt_Quantidade.Text := '0';
  end
  else
  begin
    QRMovEntradaSaidaQt_Quantidade.Text := '0' +
      DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE_INVENTARIO',
      'COD_PRODUTO = ' + QRMovEntradaSaidaCod_Produto.Text + ' And Cod_Filial=' +
      QRMovEntradaSaidaCod_Filial.Text +
      ' And NUM_ANO = ' + QRMovEntradaSaidaNUM_ANO.Text + ' And NUM_MES=' +
        QRMovEntradaSaidaNUM_MES.Text);
    QRMovEntradaSaidaSqt_Estoque_Total.Value :=
      QRMovEntradaSaidaQt_Quantidade.Value + QRMovEntradaSaidaSqt_Total.Value;
    QRMovEntradaSaidaSqt_Estoque_Emb_Total.Value :=
      ((QRMovEntradaSaidaQt_Quantidade.Value *
      QRMovEntradaSaidaNum_Embalagem.Value) +
      (QRMovEntradaSaidaSqt_Emb_Total.Value));
  end;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra5x5(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
  {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;
 // A_Set_Darkness(12);
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', '');
  if wEmpresa = 'NIR' then
    wEmpresa := 'CEMAPA';

  wDuasColunas := True; //Medibens é apenas 2 colunas

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        if wEmpresa = 'NFCE-DOCES' then
        begin
          A_Prn_Text(043, 170, 1, 1, 0, 3, 2, 'n', 2, pchar('JR DOCES'));
          A_Prn_Text(013, 140, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 20)));
          A_Prn_Text(013, 120, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 21, 20)));
          A_Prn_Text(013, 095, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Fab.: ' + DataSet.FieldByName('dt_fabricacao').AsString)); //FABRICACAO
          A_Prn_Text(013, 075, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Vcto.:' + DataSet.FieldByName('dt_vencimento').AsString)); //VCTO
          if (pValorEtiqueta = true) then
            A_Prn_Text(010, 050, 1, 1, 0, 3, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(030, 006, 1, 'D', 0, 1, 20, 'N', 0,pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
          A_Prn_Text(135, 010, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        end
        else
        begin
          A_Prn_Text(043, 170, 1, 1, 0, 3, 2, 'n', 2, pchar(DMParamSistema.QParamSistemaDESC_EMPRESA.Text));
          A_Prn_Text(005, 140, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 20)));
          A_Prn_Text(005, 120, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 21, 20)));
          A_Prn_Text(005, 090, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Fab.: ' + DataSet.FieldByName('dt_fabricacao').AsString)); //FABRICACAO
          A_Prn_Text(005, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Vcto.:' + DataSet.FieldByName('dt_vencimento').AsString)); //VCTO
          A_Prn_Text(005, 045, 1, 1, 0, 3, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(020, 006, 1, 'D', 0, 1, 20, 'N', 0,pchar(FormatFloat('000000',DataSet.FieldByName('DESC_COD_BARRA').AsInteger)));
        end;
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin
        if wEmpresa = 'NFCE-DOCES' then
        begin
          A_Prn_Text(240, 170, 1, 1, 0, 3, 2, 'n', 2, pchar('JR DOCES'));
          A_Prn_Text(220, 140, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 20)));
          A_Prn_Text(220, 120, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 21, 20)));
          A_Prn_Text(220, 090, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt.Fab.:  ' + DataSet.FieldByName('dt_fabricacao').AsString));
          A_Prn_Text(220, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Vcto.:' + DataSet.FieldByName('dt_vencimento').AsString));
          if (pValorEtiqueta = true) then
            A_Prn_Text(216, 045, 1, 1, 0, 3, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(240, 006, 1, 'D', 0 , 1, 20, 'N', 0, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
          A_Prn_Text(335, 010, 1, 1, 0, 2, 2, 'n', 2, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end
        else
        begin
          A_Prn_Text(240, 170, 1, 1, 0, 3, 2, 'n', 2, pchar(DMParamSistema.QParamSistemaDESC_EMPRESA.Text));
          A_Prn_Text(210, 140, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 20)));
          A_Prn_Text(210, 120, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 21, 20)));
          A_Prn_Text(210, 090, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt.Fab.:  ' + DataSet.FieldByName('dt_fabricacao').AsString));
          A_Prn_Text(210, 070, 1, 1, 0, 2, 2, 'n', 2, pchar('Dt. Vcto.:' + DataSet.FieldByName('dt_vencimento').AsString));
          A_Prn_Text(210, 045, 1, 1, 0, 3, 2, 'n', 2, pchar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)));
          A_Prn_Barcode(240, 006, 1, 'D', 0 , 1, 20, 'N', 0, pchar(FormatFloat('000000',DataSet.FieldByName('DESC_COD_BARRA').AsInteger)));
          A_Set_Backfeed(320);
          A_Print_Out(1, 1, 1, 1);
        end;
      end;

      Inc(wColuna);

      if wColuna > 2 then
      begin
        wColuna := 1;
        wControla_Ultima_Linha := False;
      end;
    end
    else
    begin

      AssignFile(ArqTeste, 'c:\etiquetas.txt');
      if DataSet.RecNo = 1 then
        Rewrite(ArqTeste)
      else
        Append(ArqTeste);
      Writeln(ArqTeste, IntToStr(DataSet.RecNo) + ' ' + wEmpresa);
      Writeln(ArqTeste, DataSet.FieldByName('DESC_PRODUTO').AsString);
      Writeln(ArqTeste, 'Cod. ' + DataSet.FieldByName('COD_PRODUTO').AsString);
      if DataSet.FieldByName('IND_PRECO_VENDA_ETIQUETA').AsString = 'S' then
        Writeln(ArqTeste, 'R$ ' + DataSet.FieldByName('VAL_VAREJO').AsString);
      Writeln(ArqTeste, '                                            ');
      CloseFile(ArqTeste);
    end;
    //if ((wColuna <> 2) and (wDuasColunas)) or (not wDuasColunas) then
      DataSet.Next;
 //   wDuasColunas := False;
  end;
  if wImprimir then
  begin
    if wControla_Ultima_Linha then
    begin
       A_Set_Backfeed(320);
       A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
    end;
  end;
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebraJBATACADO(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
  wObservacao: TStringList;
  i: Integer;

  {procedure ImprimeObservacao(X, Y: Integer; Texto: string);
  var
    Lista: TStringList;
    I: Integer;
    Linha: AnsiString;
    Identificador: AnsiString;
  begin
    Lista := TStringList.Create;
    try
      // Normaliza as quebras de linha
      Texto := StringReplace(Texto, #13#10, #10, [rfReplaceAll]);
      Texto := StringReplace(Texto, #10, #13#10, [rfReplaceAll]);

      Lista.Text := Texto;

      for I := 0 to Lista.Count - 1 do
      begin
        Linha := AnsiString(Trim(Lista[I]));

        if Linha <> '' then
        begin
          // Identificador exclusivo para cada linha e coluna
          Identificador := AnsiString(Chr(Ord('D') + I) + IntToStr(wColuna));
          A_Prn_Text_TrueType(X,Y - (I * 12),25,'Arial',1,400,0, 0, 0,PAnsiChar(Identificador),PAnsiChar(Linha),1);
        end;
      end;
    finally
      Lista.Free;
    end;
  end;}
  procedure ImprimeObservacao(X, Y: Integer; Texto: string);
  var
    Lista: TStringList;
    I, J: Integer;
    Linha, Parte: AnsiString;
    Identificador: AnsiString;
  begin
    Lista := TStringList.Create;
    try
      Texto := StringReplace(Texto, #13#10, #10, [rfReplaceAll]);
      Texto := StringReplace(Texto, #13, #10, [rfReplaceAll]);
      Texto := StringReplace(Texto, #10, #13#10, [rfReplaceAll]);

      Lista.Text := Texto;
      J := 0;

      for I := 0 to Lista.Count - 1 do
      begin
        Linha := Trim(AnsiString(Lista[I]));

        while Linha <> '' do
        begin
          Parte := Copy(Linha, 1, 23);
          Delete(Linha, 1, 23);
          Identificador := AnsiString(Chr(Ord('D') + (J mod 20)) + IntToStr(wColuna));
          A_Prn_Text_TrueType(X, Y - (J * 12), 25, 'Arial', 1, 400,0, 0, 0, PAnsiChar(Identificador),PAnsiChar(Parte), 1);
          Inc(J);
        end;
      end;
    finally
      Lista.Free;
    end;
  end;

begin
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
  {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;
 // A_Set_Darkness(12);
  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  wDuasColunas := True; //Medibens é apenas 2 colunas

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if wColuna = 1 then
      begin
        A_Prn_Text_TrueType(005, 230, 40, 'Arial', 1, 700,0, 0, 0, 'AA', PChar('REF.' + DataSet.FieldByName('NUM_FABRICANTE').AsString), 1);
        A_Prn_Text_TrueType(005, 200, 30, 'Arial', 1, 400, 0, 0, 0,'AB', PChar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 23)), 1);
        A_Prn_Text_TrueType(005, 185, 30, 'Arial', 1, 400, 0, 0, 0, 'AC', PChar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 24, 23)), 1);
        ImprimeObservacao(005, 150,DataSet.FieldByName('DESC_OBSERVACAO').AsString);
        if (pValorEtiqueta = true) then
          A_Prn_Text_TrueType(025, 055, 50, 'Arial', 1, 700, 0, 0, 0,'AX', PChar('R$ ' + FormatFloat('0.00', DataSet.FieldByName('VAL_VAREJO').AsFloat)), 1);
        A_Prn_Barcode(060, 020, 1, 'a', 2, 4, 25, 'N', 0,PChar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').Value)));
        A_Prn_Text_TrueType(090, 005, 30, 'Arial', 1, 400, 0, 0, 0,'AY',PChar(DataSet.FieldByName('COD_PRODUTO').AsString),1);
        wControla_Ultima_Linha := True;
      end;
      if wColuna = 2 then
      begin

        A_Prn_Text_TrueType(200, 230, 40, 'Arial', 1, 700, 0, 0, 0,'BA',PChar('REF.'+DataSet.FieldByName('NUM_FABRICANTE').AsString),1);
        A_Prn_Text_TrueType(200, 200, 30, 'Arial', 1, 400, 0, 0, 0,'BB',PChar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 1, 23)),1);
        A_Prn_Text_TrueType(200, 185, 30, 'Arial', 1, 400, 0, 0, 0,'BC',PChar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString, 24, 23)),1);
        ImprimeObservacao(200, 150,DataSet.FieldByName('DESC_OBSERVACAO').AsString);
        if pValorEtiqueta then
          A_Prn_Text_TrueType(220, 055, 50, 'Arial', 1, 700, 0, 0, 0,'BX',PChar('R$ ' + FormatFloat('0.00',DataSet.FieldByName('VAL_VAREJO').AsFloat)),1);
        A_Prn_Barcode(250, 020, 1, 'a', 2, 4, 25, 'N', 0,PChar(FormatFloat('0000',DataSet.FieldByName('COD_PRODUTO').Value)));
        A_Prn_Text_TrueType(280, 005, 30, 'Arial', 1, 400, 0, 0, 0,'BY',PChar(DataSet.FieldByName('COD_PRODUTO').AsString),1);
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end;

      Inc(wColuna);

      if wColuna > 2 then
      begin
        wColuna := 1;
        wControla_Ultima_Linha := False;
      end;
    end;
    DataSet.Next;
  end;
  if wImprimir then
  begin
    if wControla_Ultima_Linha then
    begin
       A_Set_Backfeed(320);
       A_Print_Out(1, 1, 1, 1); // aqui manda para a impressora
    end;
  end;
  A_ClosePrn;
end;

procedure TDMProdutoRelatorio.ImprimeEtiquetaZebra5x3(DataSet: TClientDataSet);
var
  ret, nLen: integer;
  pbuf: array[0..127] of AnsiChar;
  ver: PAnsiChar;
  strmsg: string;
  len1, len2, wNumEtiquetas: integer;
  buf1, buf2: AnsiString;
  buff1: array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna: Integer;
  wImprimir, wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: string;
begin
  inherited;
  wImprimir := True;
    // serve para mandar para arquivo texto para testar o programa quando false ou true manda para impressora
  //  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA','TB_FILIAL','COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);
  wDesc_Etiqueta := DMOracle.FastSelect('DESC_LPT_ETIQUETA', 'TB_FILIAL',
    'COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);

  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1, len1);
  SetLength(buf2, len2);
 {Função A_Create_Prn()
   0 -> print to file.
   1 -> lpt1, 2 -> lpt2, 3 -> lpt3
   4 -> com1, 5 -> com2, 6 -> com3
   10 -> pipe, 11 -> USBXXX, 12 -> USB
   13 -> LAN Client(TCP/IP)}
   if wDesc_Etiqueta = 'LPT1' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt1.
  if wDesc_Etiqueta = 'LPT2' then
    ret := A_CreatePrn(2, PAnsiChar(buf2)); // open lpt2.
  if wDesc_Etiqueta = 'LPT3' then
    ret := A_CreatePrn(1, PAnsiChar(buf2)); // open lpt3.
  //Alterado para em caso da impressora ARGOX estar ligada nas LPTS
  if wDesc_Etiqueta = 'USB' then
  begin
    A_EnumUSB(pbuf);
    A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
    ret := A_CreatePrn(12, PAnsiChar(buf2)); // open usb.
  end;

  A_Set_Darkness(DMParamSistema.QParamSistemaNUM_DENSIDADE_ETIQUETA.Value);

  DataSet.First;
  wColuna := 1;
  while (not Dataset.Eof) do
  begin
    if wImprimir then
    begin
      if DMParamSistema.CodEmpresa = 'GGIRARDI' then
      begin
        A_Prn_Text(005, 100, 1, 1, 0, 3, 2, 'n', 2, pchar('DIST.GGIRARDI'));
        A_Prn_Text(005, 080, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,20)));
        A_Prn_Text(005, 065, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,21,20)));
//        A_Prn_Barcode(050, 010, 1, 'D', 0, 25, 35, 'N', 0, pchar(FormatFloat('000000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        A_Prn_Barcode(030, 025, 1,   'a', 0, 25, 35, 'N', 0, pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        A_Prn_Text(080, 005, 1, 1, 0, 2, 2, 'n', 2,pchar(DataSet.FieldByName('DESC_COD_BARRA').AsString));
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end
      else
      begin
        A_Prn_Text(005, 100, 1, 1, 0, 3, 2, 'n', 2, pchar(DMParamSistema.CodEmpresa));
        A_Prn_Text(005, 080, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,1,20)));
        A_Prn_Text(005, 065, 1, 1, 0, 2, 2, 'n', 2, pchar(Copy(DataSet.FieldByName('DESC_PRODUTO').AsString,21,20)));
//        A_Prn_Barcode(050, 010, 1, 'D', 0, 1, 20, 'N', 0, pchar(FormatFloat('000000',DataSet.FieldByName('COD_PRODUTO').AsInteger)));
        A_Prn_Barcode(050, 010, 1,   'D', 0, 35, 35, 'N', 0, pchar(DataSet.FieldByName('COD_PRODUTO').AsInteger));
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);
      end;
    end;
    DataSet.Next;
  end;
  A_ClosePrn;

end;


end.
