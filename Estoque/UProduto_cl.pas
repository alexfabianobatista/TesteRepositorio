unit UProduto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Oracle, DBClient, Provider, StdCtrls;

type
  TDMProduto = class(TDataModule)
    QUltimaCompra: TOracleDataSet1;
    QUltimaCompraCOD_TRIBUTACAO: TIntegerField;
    QUltimaCompraQT_QUANTIDADE: TFloatField;
    QUltimaCompraPERC_IPI: TFloatField;
    QUltimaCompraVAL_UNITARIO: TFloatField;
    QUltimaCompraVAL_IPI: TFloatField;
    QUltimaCompraDT_RECEBIMENTO: TDateTimeField;
    QUltimaCompraIND_TIPO_FRETE: TStringField;
    QUltimaCompraNOME: TStringField;
    QProdFornecedorCons: TOracleDataSet1;
    QProdFornConsLcto: TOracleDataSet1;
    QEstoqueBaixaCOD_LOTE_TIPO: TIntegerField;
    QEstoqueBaixaCOD_PRODUTO: TFloatField;
    QEstoqueBaixaCOD_PRODUTO_BAIXA: TIntegerField;
    QEstoqueBaixaCOD_LOTE_TIPO_BAIXA: TIntegerField;
    QEstoqueBaixadesc_lote_tipo: TStringField;
    QEstoqueBaixadesc_lote_tipo_baixa: TStringField;
    QEstoqueBaixadesc_produto_baixa: TStringField;
    QProdutoCons: TOracleDataSet1;
    QProdutoConsCOD_PRODUTO: TFloatField;
    QProdutoConsVAL_VAREJO: TFloatField;
    QProdutoConsPRECO_PROMOCAO: TFloatField;
    QProdutoConsDT_PRECO_PRO_INI: TDateTimeField;
    QProdutoConsDT_PRECO_PRO_FIN: TDateTimeField;
    QProdutoConsDESC_COMPLEMENTO_PROMOCAO: TStringField;
    QProdutoConsNUM_EMBALAGEM: TFloatField;
    QProdutoConsDESC_UNIDADE: TStringField;
    QProdutoConsNUM_CLASSE: TIntegerField;
    QProdutoConsDESC_COD_BARRA: TStringField;
    QProduto: TOracleDataSet1;
    QProdutoCOD_PRODUTO: TFloatField;
    QProdutoCOD_CLASSE: TIntegerField;
    QProdutoCOD_TRIBUTACAO: TIntegerField;
    QProdutoNUM_EMBALAGEM: TFloatField;
    QProdutoDESC_UNIDADE: TStringField;
    QProdutoNUM_TRIB_TRANSFERENCIA: TIntegerField;
    QProdutoPERC_DESCONTO_MAXIMO: TFloatField;
    QProdutoPERC_IPI: TFloatField;
    QProdutoDESC_CLASS_FISCAL: TStringField;
    QProdutoIND_TIPO_PRODUTO: TStringField;
    QProdutoDT_ALTERACAO_PRECO: TDateTimeField;
    QProdutoCOD_CADASTRO: TIntegerField;
    QProdutoPERC_COMISSAO: TFloatField;
    QProdutoPERC_ISS: TFloatField;
    QProdutoPERC_INSS: TFloatField;
    QProdutoPRECO_PROMOCAO: TFloatField;
    QProdutoDT_PRECO_PRO_INI: TDateTimeField;
    QProdutoDT_PRECO_PRO_FIN: TDateTimeField;
    QProdutoIND_SITUACAO: TStringField;
    QProdutoDESC_COMPLEMENTO_PROMOCAO: TStringField;
    QProdutoCOD_PRODUTO_B: TFloatField;
    QTipoProdCons: TOracleDataSet1;
    QTipoProdConsIND_TIPO_PRODUTO: TStringField;
    QEstoqueBaixa: TOracleDataSet1;
    QProdFornecedorConsCOD_PRODUTO: TFloatField;
    QProdFornConsLctoCOD_CADASTRO: TIntegerField;
    QProdFornConsLctoCOD_PRODUTO: TFloatField;
    QProdFornConsLctoNOME: TStringField;
    QProdutoFornecedor: TOracleDataSet1;
    QProdutoIND_CLASSE_TOX: TStringField;
    QAtualizaPrecoTabelaParametro: TOracleDataSet1;
    QAtualizaPrecoTabelaParametroVAL_VAREJO: TFloatField;
    QAtualizaPrecoTabelaParametroVAL_ATACADO: TFloatField;
    QProdutoDESC_FORMULACAO: TStringField;
    QProdutoDESC_GRUPO_QUIMICO: TStringField;
    QProdFornecedorConsCOD_PRODUTO_FORNECEDOR: TFloatField;
    QProdFornConsLctoCOD_PRODUTO_FORNECEDOR: TFloatField;
    QProdutoQuantidade: TOracleDataSet1;
    QProdutoQuantidadeQUANTIDADE: TFloatField;
    QProdutoQuantMinima: TOracleDataSet1;
    QProdutoQuantMinimaQT_MINIMO: TFloatField;
    QProdutoNUM_VOLUMES: TFloatField;
    QProdutoIND_CESTA_BASICA: TStringField;
    QProdutoNUM_METROS_CUBICOS: TFloatField;
    QProdutoIND_TIPO_EMBALAGEM: TStringField;
    QProdutoIND_TIPO_VASILHAME: TStringField;
    QProdutoPromCons: TOracleDataSet1;
    QProdutoPromConsDESC_COMPLEMENTO_PROMOCAO: TStringField;
    QProdutoConsCOD_TRIBUTACAO: TIntegerField;
    QProdutoIND_ESTOFARIA: TStringField;
    QProdutoIND_PINTURA: TStringField;
    QProdutoIND_RETORNAVEL: TStringField;
    QProdutoNUM_CX_PALETE: TIntegerField;
    QProdutoIND_KM: TStringField;
    QProdutoCOD_MARCA: TIntegerField;
    QProdFornecedorConsDESC_PRODUTO: TStringField;
    QProdFornConsLctoDESC_PRODUTO: TStringField;
    QProdutoConsDESC_PRODUTO: TStringField;
    QAtualizaPrecoPercentualLucro: TOracleDataSet1;
    QAtualizaPrecoPercentualLucroPERC_LUCRO: TFloatField;
    QAtualiza_precoCad: TOracleDataSet1;
    QAtualiza_precoCadCOD_ATUALIZA_PRECO: TIntegerField;
    QAtualiza_precoCadVAL_MINIMO: TFloatField;
    QAtualiza_precoCadVAL_MAXIMO: TFloatField;
    QAtualiza_precoCadPERC_LUCRO: TFloatField;
    QAtualiza_PrecoCons: TOracleDataSet1;
    QAtualiza_PrecoConsCOD_ATUALIZA_PRECO: TIntegerField;
    QAtualiza_PrecoConsVAL_MINIMO: TFloatField;
    QAtualiza_PrecoConsVAL_MAXIMO: TFloatField;
    QAtualiza_PrecoConsPERC_LUCRO: TFloatField;
    QImagemProduto: TOracleDataSet1;
    QImagemProdutoCOD_IMAGEM_PRODUTO: TIntegerField;
    QImagemProdutoIMG_IMAGEM: TBlobField;
    QProdutoConsDT_VENCTO_PRECO: TDateTimeField;
    QProdutoPreco: TOracleDataSet1;
    QProdutoPrecoCOD_PRODUTO: TIntegerField;
    QProdutoPrecoCOD_PRODUTO_PRECO: TIntegerField;
    QRCompraPosicao: TOracleDataSet1;
    QRCompraPosicaoCOD_PRODUTO: TFloatField;
    QRCompraPosicaoIND_SITUACAO: TStringField;
    QRCompraPosicaoCOD_CADASTRO: TIntegerField;
    QRCompraPosicaoDt_compra: TDateField;
    QRCompraPosicaoVl_Compra: TFloatField;
    QRCompraPosicaoQt_Compra: TFloatField;
    QRCompraPosicaoqt_quantidade: TFloatField;
    QRCompraPosicaoqt_minimo: TFloatField;
    QRCompraPosicaoVAL_VAREJO: TFloatField;
    QRCompraPosicaoNUM_FABRICANTE: TStringField;
    QRCompraPosicaoDESC_PRODUTO: TStringField;
    QProdutoCOD_LOTE_TIPO: TIntegerField;
    QProdutoCOD_NBM_SH: TStringField;
    QProdutoFornecedorCOD_PRODUTO_FORNECEDOR: TFloatField;
    QProdutoFornecedorCOD_CADASTRO: TIntegerField;
    QProdutoFornecedorCOD_PRODUTO: TFloatField;
    QProdutoFornecedorVAL_PRODUTO: TFloatField;
    QAlteraPreco: TOracleDataSet1;
    QAlteraPrecoVAL_PRODUTO: TFloatField;
    QAlteraPrecoCOD_PRODUTO_FORNECEDOR: TFloatField;
    QProdutoIND_SUBSTITUICAO_RJ: TStringField;
    QAtualizaPrecoProduto: TOracleDataSet1;
    QAtualizaPrecoProdutoVAL_VAREJO: TFloatField;
    QAtualizaPrecoProdutoCOD_PRODUTO: TFloatField;
    OPAtualizaEstoque: TOraclePackage;
    QProdutoConsVAL_ATACADO: TFloatField;
    QProdutoPERC_MARGEM_VAREJO: TFloatField;
    QProdutoPERC_MARGEM_ATACADO: TFloatField;
    QProdutoConsDESC_COMPLEMENTO: TStringField;
    QProdutoQT_TECIDO: TFloatField;
    QProdutoPRECO_PROMOCAO1: TFloatField;
    QProdutoVAL_PRECO_FRETE: TFloatField;
    QProdutoDT_VENCTO_PRECO: TDateTimeField;
    QProdutoConsCOD_MARCA: TIntegerField;
    QProdutoConsDESC_CLASSE: TStringField;
    QProdutoNUM_CONVERTE_FARDO: TFloatField;
    QProdutoCOD_GENERO_PRODUTO: TIntegerField;
    QGeneroProdutoCons: TOracleDataSet1;
    QGeneroProdutoConsCOD_GENERO_PRODUTO: TIntegerField;
    QGeneroProdutoConsDESC_GENERO_PRODUTO: TStringField;
    QGeneroProduto: TOracleDataSet1;
    QGeneroProdutoCOD_GENERO_PRODUTO: TIntegerField;
    QGeneroProdutoDESC_GENERO_PRODUTO: TStringField;
    QListaServicoCons: TOracleDataSet1;
    QListaServicoConsDESC_LISTA_SERVICO: TStringField;
    QListaServico: TOracleDataSet1;
    QListaServicoDESC_LISTA_SERVICO: TStringField;
    QPesagemProducao: TOracleDataSet1;
    QPesagemProducaoCOD_FILIAL: TIntegerField;
    QPesagemProducaoCOD_PRODUTO: TIntegerField;
    QPesagemProducaoCOD_LOTE_TIPO: TIntegerField;
    QPesagemProducaoDT_FABRICACAO: TDateTimeField;
    QPesagemProducaoNUM_PESO_TARA: TFloatField;
    QPesagemProducaoNUM_PESO_LIQUIDO: TFloatField;
    QPesagemProducaoIND_SITUACAO: TStringField;
    QProdutoCOD_EX_TIPI: TStringField;
    QProdutoNUM_GENERO_NCM: TStringField;
    QProdutoQT_PESO_CAIXA_MIN: TFloatField;
    QProdutoQT_PESO_CAIXA_MAX: TFloatField;
    QProdutoNUM_DIAS_VALIDADE: TIntegerField;
    QPesagemProducaoCOD_PESAGEM: TIntegerField;
    QPesagemProducaoCOD_USUARIO: TIntegerField;
    QAtualizaPreco: TOracleDataSet1;
    QAtualizaPrecoCOD_PRODUTO: TFloatField;
    QAtualizaPrecoVL_CUSTO_MEDIO: TFloatField;
    QProdutoMarca: TOracleDataSet1;
    QProdutoMarcaCOD_PRODUTO: TIntegerField;
    QProdutoMarcaCOD_MARCA: TIntegerField;
    QProdutoMarcaVAL_PRODUTO_MARCA: TFloatField;
    QProdutoMarcadesc_marca: TStringField;
    QEstoqueBaixaQT_BAIXA: TFloatField;
    QProdutoIND_PESO_PADRAO: TStringField;
    QProdutoCOD_CULTURA: TIntegerField;
    QProdutoMarcaVAL_CUSTO: TFloatField;
    QProdutoMarcaQT_QUANTIDADE: TFloatField;
    QZeraEstoquePesagem: TOracleDataSet1;
    QZeraEstoquePesagemCOD_PESAGEM: TIntegerField;
    QZeraEstoquePesagemCOD_FILIAL: TIntegerField;
    QZeraEstoquePesagemCOD_PRODUTO: TIntegerField;
    QZeraEstoquePesagemCOD_LOTE_TIPO: TIntegerField;
    QZeraEstoquePesagemDT_FABRICACAO: TDateTimeField;
    QZeraEstoquePesagemNUM_PESO_TARA: TFloatField;
    QZeraEstoquePesagemNUM_PESO_LIQUIDO: TFloatField;
    QZeraEstoquePesagemIND_SITUACAO: TStringField;
    QZeraEstoquePesagemCOD_USUARIO: TIntegerField;
    QProdutoDESC_SECAO: TStringField;
    QProdutoDESC_BOQUETA: TStringField;
    QProdutoRelacionado: TOracleDataSet1;
    QProdutoRelacionadoCOD_PRODUTO_RELACIONADO: TIntegerField;
    QProdutoRelacionadoDESC_PRODUTO_RELACIONADO: TStringField;
    QProdutoRelacionadodesc_produto_pai: TStringField;
    QProdutoRelacionadodesc_produto_filho: TStringField;
    QProdutoRelacionadoCons: TOracleDataSet1;
    QProdutoRelacionadoConsCOD_PRODUTO_RELACIONADO: TIntegerField;
    QProdutoRelacionadoConsDESC_PRODUTO_RELACIONADO: TStringField;
    QProdutoConsDESC_MARCA: TStringField;
    QProdutoConsNUM_GENERO_NCM: TStringField;
    QProdutoRelacionadoConsNUM_FABRICANTE: TStringField;
    QProdutoRelacionadoConsDESC_PRODUTO: TStringField;
    QProdutoConsUltCompras: TOracleDataSet1;
    QProdutoConsUltComprasDT_EMISSAO: TDateTimeField;
    QProdutoConsUltComprasFORNECEDOR: TStringField;
    QProdutoConsUltComprasQT_QUANTIDADE: TFloatField;
    QProdutoConsUltComprasVAL_UNITARIO: TFloatField;
    QCadastroPreco: TOracleDataSet1;
    QCadastroPrecoCOD_CADASTRO_PRECO: TIntegerField;
    QCadastroPrecoCOD_CADASTRO: TIntegerField;
    QCadastroPrecoCOD_PRODUTO: TIntegerField;
    QCadastroPrecoVAL_PRECO: TFloatField;
    QCadastroPrecodesc_cadastro: TStringField;
    QCadastroPrecodesc_produto: TStringField;
    QCadastroPrecoCons: TOracleDataSet1;
    QCadastroPrecoConsCOD_CADASTRO_PRECO: TIntegerField;
    QCadastroPrecoConsCOD_CADASTRO: TIntegerField;
    QCadastroPrecoConsCOD_PRODUTO: TIntegerField;
    QCadastroPrecoConsVAL_PRECO: TFloatField;
    QCadastroPrecoConsDESC_PRODUTO: TStringField;
    QCadastroPrecoConsNOME: TStringField;
    QProdFornecedorConsVAL_PRODUTO: TFloatField;
    QProdFornConsLctoVAL_PRODUTO: TFloatField;
    QEmail: TOracleDataSet1;
    DspEmail: TDataSetProvider;
    CdEmail: TClientDataSet;
    QEmailCOD_PRODUTO: TFloatField;
    QEmailDESC_PRODUTO: TStringField;
    QEmailVAL_PRECO: TFloatField;
    CdEmailCOD_PRODUTO: TFloatField;
    CdEmailDESC_PRODUTO: TStringField;
    CdEmailVAL_PRECO: TFloatField;
    QProdFornConsLctoNUM_EMBALAGEM: TFloatField;
    QAtualizaPrecoProdutoDESC_PRODUTO: TStringField;
    QAtualizaPrecoProdutoVAL_ATACADO: TFloatField;
    QPesagemProducaoDT_PESAGEM: TDateTimeField;
    QEtiquetaSimples: TOracleDataSet1;
    QEtiquetaSimplesCOD_PRODUTO: TFloatField;
    QEtiquetaSimplesDESC_PRODUTO: TStringField;
    QEtiquetaSimplesVAL_VAREJO: TFloatField;
    CdEtiquetaSimples: TClientDataSet;
    CdEtiquetaSimplesCOD_PRODUTO: TFloatField;
    CdEtiquetaSimplesDESC_PRODUTO: TStringField;
    CdEtiquetaSimplesVAL_VAREJO: TFloatField;
    QEstoqueBaixaVAL_UNITARIO: TFloatField;
    QRProdutosBaixar: TOracleDataSet1;
    QRProdutosBaixarDESC_PRODUTO: TStringField;
    QRProdutosBaixarCOD_PRODUTO: TFloatField;
    QRProdutosBaixarCOD_PRODUTO_BAIXA: TIntegerField;
    QRProdutosBaixarQT_BAIXA: TFloatField;
    QRProdutosBaixarVAL_UNITARIO: TFloatField;
    QRProdutosBaixarDESC_PRODUTO_BAIXA: TStringField;
    QProdutoNUM_PESO_BRUTO: TFloatField;
    QProdutoNUM_PESO_LIQUIDO: TFloatField;
    QProdutoCOD_PRODUTO_SIAGRO: TIntegerField;
    QProdutoDESC_PRODUTO: TStringField;
    QProdutoCOD_TIPO_PRODUTO: TStringField;
    QProdutoCOD_CST_IPI: TStringField;
    QVendaPerdida: TOracleDataSet1;
    QVendaPerdidaDT_VENDA_PERDIDA: TDateTimeField;
    QVendaPerdidaCOD_VENDEDOR: TIntegerField;
    QVendaPerdidaQT_QUANTIDADE: TFloatField;
    QVendaPerdidaCOD_MOTIVO: TIntegerField;
    QVendaPerdidaCOD_PRODUTO: TFloatField;
    QRVendaPerdida: TOracleDataSet1;
    QRVendaPerdidaCOD_PRODUTO: TFloatField;
    QRVendaPerdidaDT_VENDA_PERDIDA: TDateTimeField;
    QRVendaPerdidaCOD_MOTIVO: TIntegerField;
    QRVendaPerdidaQT_QUANTIDADE: TFloatField;
    QRVendaPerdidaCOD_VENDEDOR: TIntegerField;
    QRVendaPerdidaDESC_PRODUTO: TStringField;
    QRVendaPerdidaNUM_FABRICANTE: TStringField;
    QRVendaPerdidaNOME: TStringField;
    QRVendaPerdidaDESC_MOTIVO: TStringField;
    QImagem_Consulta: TOracleDataSet1;
    QImagem_ConsultaCOD_IMAGEM_PRODUTO: TIntegerField;
    QImagem_ConsultaIMG_IMAGEM: TBlobField;
    QProdutoConsPERC_MARGEM_VAREJO: TFloatField;
    QProdutoConsUltComprasVAL_CUSTO: TFloatField;
    QProdutoConsCOD_CLASSE: TIntegerField;
    QProdutoDESC_COMPLEMENTO: TStringField;
    QProdutoDESC_COMPLEMENTO_2: TStringField;
    QProdutoNUM_ORIGEM: TIntegerField;
    DSOrigem: TDataSource;
    QProdutoDESC_CONCENTRACAO: TStringField;
    QProdutoConsDT_ALTERACAO_PRECO: TDateTimeField;
    QProdutoCOD_CST_COFINS: TStringField;
    QProdutoCOD_CST_PIS: TStringField;
    QCstpis: TOracleDataSet1;
    QCstpisCOD_CST_PIS: TStringField;
    QCstpisDESC_CST_PIS: TStringField;
    QCstpisDESC_COMPLETA: TStringField;
    DSCstPis: TDataSource;
    QCstCofins: TOracleDataSet1;
    DSCstCofins: TDataSource;
    QCstCofinsCOD_CST_COFINS: TStringField;
    QCstCofinsDESC_CST_COFINS: TStringField;
    QCstCofinsDESC_COMPLETA: TStringField;
    QProdutoExp: TOracleDataSet;
    QCstIpi: TOracleDataSet1;
    DSCstIpi: TDataSource;
    QCstIpiCOD_CST_IPI: TStringField;
    QCstIpiDESC_CST_IPI: TStringField;
    QCstIpiDESC_COMPLETA: TStringField;
    QTipoProduto: TOracleDataSet1;
    QTipoProdutoCOD_TIPO_PRODUTO: TStringField;
    QTipoProdutoDESC_TIPO_PRODUTO: TStringField;
    QTipoProdutoDESC_COMPLETA: TStringField;
    DSTipoProduto: TDataSource;
    QProdutoCOD_NATUREZA_RECEITA: TIntegerField;
    QProdutoExpDESC_UNIDADE: TStringField;
    QProdutoExpCOD_PRODUTO: TFloatField;
    QProdutoExpDESC_PRODUTO: TStringField;
    QProdutoExpNUM_GENERO_NCM: TStringField;
    QProdutoExpNUM_PESO_LIQUIDO: TFloatField;
    QProdutoExpNUM_FABRICANTE: TStringField;
    QProdutoExpCOD_TIPO_PRODUTO: TStringField;
    QProdutoExpPERC_IPI: TFloatField;
    QProdutoExpQT_QUANTIDADE: TFloatField;
    QProdutoExpDT_COMPRA: TDateTimeField;
    QProdutoVAL_VAREJO: TFloatField;
    QProdutoVAL_ATACADO: TFloatField;
    QUnidadeExp: TOracleDataSet;
    QUnidadeExpDESC_UNIDADE: TStringField;
    QVendaPerdidaCOD_VENDA_PERDIDA: TIntegerField;
    QProdutoCOD_SERVICO_MUNICIPAL: TStringField;
    QProdutoDESC_COD_BARRA: TStringField;
    QProdutoQT_TEMP: TFloatField;
    QProdutoCOD_UF_CONSUMO: TStringField;
    QProdutoConsDESC_COMPLEMENTO_2: TStringField;
    QProdutoCOD_CST_PIS_SAIDA: TStringField;
    QProdutoCOD_CST_COFINS_SAIDA: TStringField;
    QCstPisSaida: TOracleDataSet1;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DSCstPisSaida: TDataSource;
    QCstCofinsSaida: TOracleDataSet1;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DSCstCofinsSaida: TDataSource;
    QAtividadeContribCons: TOracleDataSet1;
    QAtividadeContribConsCOD_ATIVIDADE_CONTRIB: TIntegerField;
    QAtividadeContribConsDESC_ATIVIDADE_CONTRIB: TStringField;
    QAtividadeContribConsCOD_NCM: TStringField;
    QAtividadeContribConsPERC_ALIQ: TFloatField;
    QAtividadeContribConsDT_INI_ESCRIT: TDateTimeField;
    QAtividadeContribConsDT_FIN_ESCRIT: TDateTimeField;
    QAtividadeContribConsIND_TIPO: TStringField;
    QProdutoCOD_ATIVIDADE_CONTRIB: TIntegerField;
    QProdutoCOD_PRODUTO_ANP: TIntegerField;
    QProdutoIND_SUBST_TRIB: TStringField;
    QProdutoConsUltComprasNUM_NOTA: TIntegerField;
    QProdutoConsUltVendas: TOracleDataSet1;
    QProdutoConsUltVendasDT_EMISSAO: TDateTimeField;
    QProdutoConsUltVendasNUM_NOTA: TIntegerField;
    QProdutoConsUltVendasCLIENTE: TStringField;
    QProdutoConsUltVendasQT_QUANTIDADE: TFloatField;
    QProdutoConsUltVendasVAL_UNITARIO: TFloatField;
    QProdutoIND_QTD_ETIQUETAS: TIntegerField;
    QProdutoDESC_OBSERVACAO: TStringField;
    QProdutoConsIND_ARREDONDAMENTO_TRUNCAMENTO: TStringField;
    QProdutoConsIND_PROD_PROPRIA_TERCEIRO: TStringField;
    QProdutoDESC_HASH_MD5: TStringField;
    QProdutoConsDESC_BOQUETA: TStringField;
    QProdutoConsCOD_TRIB_IMP_FISCAL: TStringField;
    QProdutoPERC_MARGEM_MINIMA: TFloatField;
    QProdutoIND_PRECO_VENDA_ETIQUETA: TStringField;
    QProdutoConsPERC_COMISSAO: TFloatField;
    QProdutoPERC_MIXGN: TFloatField;
    QProdutoDESC_RECOPI: TStringField;
    QProdutoCOD_CST_IPI_SAIDA: TStringField;
    QCstIpiSaida: TOracleDataSet1;
    QCstIpiSaidaORDEM: TFloatField;
    QCstIpiSaidaCOD_CST_IPI: TStringField;
    QCstIpiSaidaDESC_CST_IPI: TStringField;
    QCstIpiSaidaDESC_COMPLETA: TStringField;
    DSCstIpiSaida: TDataSource;
    QProdutoIND_APLICA_DEDUCAO_BC_ISS: TStringField;
    QProdutoDESC_UNIDADE_DOSAGEM_RECEITA: TStringField;
    QProdutoNUM_EMBALAGEM_RECEITA: TFloatField;
    QProdutoRelacionadoConsDESC_MARCA: TStringField;
    QProdutoRelacionadoConsQT_QUANTIDADE: TFloatField;
    QProdutoRelacionadoConsVAL_VAREJO: TFloatField;
    QProdutoConsUltVendasCOD_OPERACAO: TIntegerField;
    QProdutoCOD_CEST: TStringField;
    QCestCons: TOracleDataSet1;
    QCestConsCOD_CEST: TStringField;
    QCestConsCOD_NCM: TStringField;
    QCestConsDESC_CEST: TStringField;
    QCestConsORDEM: TFloatField;
    QProdutoConsCOD_CEST: TStringField;
    QProdutoConsUltVendasDESC_OBS_CORPO_NOTA: TStringField;
    QProdutoConsUltVendasCOD_ORDEM_SERVICO_CAB: TStringField;
    QCatalogoProdutoCons: TOracleDataSet1;
    QCatalogoProdutoConsCOD_PRODUTO: TFloatField;
    QCatalogoProdutoConsDESC_PRODUTO: TStringField;
    QCatalogoProdutoConsVAL_VAREJO: TFloatField;
    QCatalogoProdutoConsNUM_GENERO_NCM: TStringField;
    QCatalogoProdutoConsCOD_MARCA: TIntegerField;
    CDSCatalogoProduto: TClientDataSet;
    CDSCatalogoProdutoCOD_PRODUTO: TIntegerField;
    CDSCatalogoProdutoDESCRICAO: TStringField;
    CDSCatalogoProdutoMARCA: TStringField;
    CDSCatalogoProdutoPRECO: TFloatField;
    CDSCatalogoProdutoIMAGEM: TBlobField;
    CDSRCatalogoProduto: TClientDataSet;
    CDSRCatalogoProdutoCOD_PRODUTO_1: TIntegerField;
    CDSRCatalogoProdutoIMAGEM_1: TBlobField;
    CDSRCatalogoProdutoDESCRICAO_1: TStringField;
    QCatalogoProdutoConsDESC_COMPLEMENTO: TStringField;
    QCatalogoProdutoConsIMG_IMAGEM: TBlobField;
    CDSCatalogoProdutoCOMPLEMENTO: TStringField;
    CDSRCatalogoProdutoPRECO_1: TFloatField;
    CDSRCatalogoProdutoDESC_OBS_1: TStringField;
    QCatalogoProdutoConsNUM_FABRICANTE: TStringField;
    CDSRCatalogoProdutoCOD_PRODUTO_2: TIntegerField;
    CDSRCatalogoProdutoCOD_PRODUTO_3: TIntegerField;
    CDSRCatalogoProdutoCOD_PRODUTO_4: TIntegerField;
    CDSRCatalogoProdutoIMAGEM_2: TBlobField;
    CDSRCatalogoProdutoIMAGEM_3: TBlobField;
    CDSRCatalogoProdutoIMAGEM_4: TBlobField;
    CDSRCatalogoProdutoDESCRICAO_2: TStringField;
    CDSRCatalogoProdutoDESCRICAO_3: TStringField;
    CDSRCatalogoProdutoDESCRICAO_4: TStringField;
    CDSRCatalogoProdutoPRECO_2: TFloatField;
    CDSRCatalogoProdutoPRECO_3: TFloatField;
    CDSRCatalogoProdutoPRECO_4: TFloatField;
    CDSRCatalogoProdutoDESC_OBS_2: TStringField;
    CDSRCatalogoProdutoDESC_OBS_3: TStringField;
    CDSRCatalogoProdutoDESC_OBS_4: TStringField;
    CDSCatalogoProdutoNUM_FABRICANTE: TStringField;
    CDSRCatalogoProdutoNUM_FABRICANTE_1: TStringField;
    CDSRCatalogoProdutoNUM_FABRICANTE_2: TStringField;
    CDSRCatalogoProdutoNUM_FABRICANTE_3: TStringField;
    CDSRCatalogoProdutoNUM_FABRICANTE_4: TStringField;
    QCatalogoProdutoConsCOD_LOTE_TIPO: TFloatField;
    QProdutoCOD_ROYALTIES: TIntegerField;
    CDSOrigem: TClientDataSet;
    CDSOrigemcod_origem: TIntegerField;
    CDSOrigemOrigem: TStringField;
    QProdutoIND_SOLADO: TStringField;
    QProdutoIND_BICO: TStringField;
    QProdutoDESC_TIME: TStringField;
    QProdutoDESC_ESPORTE: TStringField;
    QProdutoIND_ENFEITE: TStringField;
    QDadosCalcadosCons: TOracleDataSet1;
    QDadosCalcadosConsTABELA: TStringField;
    QDadosCalcadosConsCOD_DADO: TIntegerField;
    QDadosCalcadosConsCOD_PRODUTO: TFloatField;
    QProdutoPERC_GLP_PETROLEO: TFloatField;
    QProdutoPERC_GNI: TFloatField;
    QProdutoIND_ESCALA_RELEVANTE: TStringField;
    QProdutoDESC_CNPJ_FABRICANTE: TStringField;
    QProdutoConsUltVendasVAL_UNITARIO_COM_DESCONTO: TFloatField;
    QProdutoConsQT_ESTOQUE: TFloatField;
    QProdutoPERC_COMISSAO_PRODUCAO: TFloatField;
    QProdutoConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QProdutoConsNUM_VOLUMES: TFloatField;
    QProdutoParaProdutoSkyhub: TOracleDataSet1;
    QProdutoParaProdutoSkyhubDESC_PRODUTO: TStringField;
    QProdutoParaProdutoSkyhubCOD_PRODUTO: TFloatField;
    QProdutoParaProdutoSkyhubDESC_OBSERVACAO: TStringField;
    QProdutoParaProdutoSkyhubVAL_VAREJO: TFloatField;
    QProdutoParaProdutoSkyhubNUM_PESO_BRUTO: TFloatField;
    QProdutoParaProdutoSkyhubNUM_GENERO_NCM: TStringField;
    QProdutoParaProdutoSkyhubDESC_MARCA: TStringField;
    QProdutoParaProdutoSkyhubIND_SITUACAO: TStringField;
    QProdutoParaProdutoSkyhubVL_CUSTO_MEDIO: TFloatField;
    QProdutoParaProdutoSkyhubQT_QUANTIDADE: TFloatField;
    QProdutoDESC_COD_BENEFICIO_FISCAL: TStringField;
    QProdutoCOD_BENEF_FISCAL_REDUCAO: TStringField;
    QProdutoCOD_BENEF_FISCAL_ISENCAO: TStringField;
    QProdutoCOD_BENEF_FISCAL_IMUNIDADE: TStringField;
    QProdutoCOD_BENEF_FISCAL_SUSPENSAO: TStringField;
    QProdutoCOD_BENEF_FISCAL_DIFERIMENTO: TStringField;
    QProdutoConsUltVendasCOD_VENDEDOR: TIntegerField;
    QProdutoNCM: TOracleDataSet1;
    QProdutoNCMCOD_PRODUTO: TFloatField;
    QProdutoNCMDESC_PRODUTO: TStringField;
    QProdutoNCMDESC_UNIDADE: TStringField;
    QRArqBalancaToledo: TOracleDataSet1;
    QRArqBalancaToledoCOD_PRODUTO: TFloatField;
    QRArqBalancaToledoDESC_PRODUTO: TStringField;
    QRArqBalancaToledoDESC_COD_BARRA: TStringField;
    QRArqBalancaToledoDESC_UNIDADE: TFloatField;
    QRArqBalancaToledoDESC_LOTE: TStringField;
    QRArqBalancaToledoVAL_VAREJO: TStringField;
    QRArqBalancaToledoNUM_DIAS_VALIDADE: TFloatField;
    QProdutoIND_ENVIA_BALANCA: TStringField;
    QRArqBalancaToledoIND_ENVIA_BALANCA: TStringField;
    QProdutoQT_MIN_ATACADO: TIntegerField;
    QProdutoVAL_ALTURA: TFloatField;
    QProdutoVAL_LARGURA: TFloatField;
    QProdutoVAL_COMPRIMENTO: TFloatField;
    QProdutoParaProdutoSkyhubVAL_ALTURA: TFloatField;
    QProdutoParaProdutoSkyhubVAL_COMPRIMENTO: TFloatField;
    QProdutoParaProdutoSkyhubVAL_LARGURA: TFloatField;
    QProdutoParaProdutoSkyhubNUM_PESO_LIQUIDO: TFloatField;
    QProdutoCOD_ITEM_IPM: TStringField;
    QProdutoNUM_FABRICANTE: TStringField;
    QProdutoConsNUM_FABRICANTE: TStringField;
    QProdutoRelacionado_Contra: TOracleDataSet1;
    QProdutoRelacionado_ContraCOD_PRODUTO_RELACIONADO: TIntegerField;
    QProdutoRelacionado_ContraDESC_PRODUTO_RELACIONADO: TStringField;
    QProdutoRelacionadoConsDESC_LOCALIZACAO: TStringField;
    QProdutoCOD_PRODUTO_ANVISA: TStringField;
    QProdutoVAL_PRECO_MAXIMO_CONSUMIDOR: TFloatField;
    QProdutoDESC_MOTIVO_ISENCAO_ANVISA: TStringField;
    QProdutoConsDESC_OBSERVACAO: TStringField;
    QProdutoDESC_LOCALIZACAO: TStringField;
    QProdutoConsDESC_LOCALIZACAO: TStringField;
    QProdutoCOD_USUARIO: TIntegerField;
    QProdutoPERC_AD_REM_ICMS: TFloatField;
    QProdutoEstoque: TOracleDataSet1;
    QProdutoEstoqueQT_ESTOQUE: TFloatField;
    QProdutoIND_IMPORT_COMB: TIntegerField;
    QProdutoUF_ORIGEM_COMB: TStringField;
    QProdutoPERC_ORIG_UF_COMB: TFloatField;
    QRProdutosBaixar2: TOracleDataSet;
    QProdutoConsIND_ENVIA_BALANCA: TStringField;
    QImagemProdutoCOD_PRODUTO: TFloatField;
    QImagem_ConsultaCOD_PRODUTO: TFloatField;
    QProdutoRelacionadoCOD_PRODUTO_PAI: TFloatField;
    QProdutoRelacionadoCOD_PRODUTO_FILHO: TFloatField;
    QProdutoRelacionado_ContraCOD_PRODUTO_PAI: TFloatField;
    QProdutoRelacionado_ContraCOD_PRODUTO_FILHO: TFloatField;
    QProdutoRelacionadoConsCOD_PRODUTO_PAI: TFloatField;
    QProdutoRelacionadoConsCOD_PRODUTO_FILHO: TFloatField;
    QProdutoIND_PESAVEL: TStringField;
    QProdutoCOD_CST_IPI_ENQU_IMUNE: TStringField;
    QProdutoCOD_CST_IPI_ENQU_SUSPENSAO: TStringField;
    QProdutoCOD_CST_IPI_ENQU_ISENCAO: TStringField;
    QProdutoIND_OPCAO_PRODUTO: TStringField;
    QProdutoCOD_NBS: TIntegerField;
    QListaServicoITEM_LISTA_SERVICO: TStringField;
    QListaServicoPERC_TRIBUTO_NACIONAL: TFloatField;
    QListaServicoPERC_TRIBUTO_IMPORTADO: TFloatField;
    QProdutoCOD_LISTA_SERVICO: TIntegerField;
    QListaServicoConsCOD_LISTA_SERVICO: TIntegerField;
    QListaServicoCOD_LISTA_SERVICO: TIntegerField;
    QProdutoConsUltComprasCOD_OPERACAO: TIntegerField;
    QProdutoConsUltComprasCOD_CFOP: TIntegerField;
    QProdutoConsUltVendasCOD_CFOP: TIntegerField;
    QClassTribIBSCBS: TOracleDataSet1;
    DSClassTribIBSCBS: TDataSource;
    QProdutoCOD_CLASS_TRIB_IBS_CBS: TIntegerField;
    QProdutoCOD_CLASS_TRIB_IBS_CBS_CMP: TIntegerField;
    QClassTribIBSCBSCOD_CLASS_TRIB: TIntegerField;
    QClassTribIBSCBSCOD_CST_IBS_CBS: TIntegerField;
    QClassTribIBSCBSNUM_CLASS_TRIB: TStringField;
    QClassTribIBSCBSNOME_CLASS_TRIB: TStringField;
    QClassTribIBSCBSDESC_CLASS_TRIB: TStringField;
    QClassTribIBSCBSDESC_LEI: TStringField;
    QClassTribIBSCBSDESC_TIPO_ALIQUOTA: TStringField;
    QClassTribIBSCBSPERC_REDUCAO_IBS: TIntegerField;
    QClassTribIBSCBSPERC_REDUCAO_CBS: TIntegerField;
    QClassTribIBSCBSIND_REDUTOR_BC: TStringField;
    QClassTribIBSCBSIND_GRUPO_TRIB_REGULAR: TStringField;
    QClassTribIBSCBSIND_GRUPO_CRED_PRES_OPER: TStringField;
    QClassTribIBSCBSIND_GRUPO_MONO_PADRAO: TStringField;
    QClassTribIBSCBSIND_GRUPO_MONO_RETEN: TStringField;
    QClassTribIBSCBSIND_GRUPO_MONO_RET: TStringField;
    QClassTribIBSCBSIND_GRUPO_MONO_DIF: TStringField;
    QClassTribIBSCBSIND_GRUPO_ESTORNO_CRED: TStringField;
    QClassTribIBSCBSDESC_CREDITO_PARA: TStringField;
    QClassTribIBSCBSDT_INI_VIGENCIA: TDateTimeField;
    QClassTribIBSCBSDT_FIM_VIGENCIA: TDateTimeField;
    QClassTribIBSCBSDT_ATUALIZACAO: TDateTimeField;
    QClassTribIBSCBSIND_NFE_ABI: TStringField;
    QClassTribIBSCBSIND_NFE: TStringField;
    QClassTribIBSCBSIND_NFCE: TStringField;
    QClassTribIBSCBSIND_CTE: TStringField;
    QClassTribIBSCBSIND_CTE_OS: TStringField;
    QClassTribIBSCBSIND_BPE: TStringField;
    QClassTribIBSCBSIND_BPE_TA: TStringField;
    QClassTribIBSCBSIND_BPE_TM: TStringField;
    QClassTribIBSCBSIND_NF3E: TStringField;
    QClassTribIBSCBSIND_NFSE: TStringField;
    QClassTribIBSCBSIND_NFSE_VIA: TStringField;
    QClassTribIBSCBSIND_NF_COM: TStringField;
    QClassTribIBSCBSIND_NF_AG: TStringField;
    QClassTribIBSCBSIND_NF_GAS: TStringField;
    QClassTribIBSCBSIND_DERE: TStringField;
    QClassTribIBSCBSIND_GRUPO_BIO_DIFERENCA: TStringField;
    QClassTribIBSCBSINDDIR: TStringField;
    QClassTribIBSCBSINDDUIMP: TStringField;
    QClassTribIBSCBSDESC_ANEXO: TStringField;
    QClassTribIBSCBSIND_TP_REC_BRUTA_SIMP_NAC: TStringField;
    QClassTribIBSCBSDESCRICAO: TStringField;
    procedure QProdutoBeforeEdit(DataSet: TDataSet);
    procedure QProdutoAfterPost(DataSet: TDataSet);
    procedure QEstoqueBaixaBeforeInsert(DataSet: TDataSet);
    procedure QEstoqueBaixaBeforeEdit(DataSet: TDataSet);
    procedure QEstoqueBaixaAfterInsert(DataSet: TDataSet);
    procedure QProdutoBeforeInsert(DataSet: TDataSet);
    procedure QEstoqueBaixaAfterPost(DataSet: TDataSet);
    procedure QEstoqueBaixaBeforePost(DataSet: TDataSet);
    procedure QProdutoFornecedorAfterPost(DataSet: TDataSet);
    procedure QProdutoPrecoAfterPost(DataSet: TDataSet);
    procedure QRCompraPosicaoCalcFields(DataSet: TDataSet);
    procedure QProdutoAfterInsert(DataSet: TDataSet);
    procedure QProdutoMarcaCalcFields(DataSet: TDataSet);
    procedure QProdutoMarcaAfterInsert(DataSet: TDataSet);
    procedure QProdutoAfterOpen(DataSet: TDataSet);
    procedure QProdutoMarcaAfterPost(DataSet: TDataSet);
    procedure QProdutoMarcaBeforeEdit(DataSet: TDataSet);
    procedure QProdutoMarcaBeforeInsert(DataSet: TDataSet);
    procedure QProdutoMarcaBeforeDelete(DataSet: TDataSet);
    procedure QProdutoMarcaBeforePost(DataSet: TDataSet);
    procedure QProdutoRelacionadoAfterInsert(DataSet: TDataSet);
    procedure QProdutoRelacionadoAfterPost(DataSet: TDataSet);
    procedure QProdutoRelacionadoBeforeDelete(DataSet: TDataSet);
    procedure QProdutoRelacionadoBeforeEdit(DataSet: TDataSet);
    procedure QProdutoRelacionadoBeforeInsert(DataSet: TDataSet);
    procedure QProdutoRelacionadoBeforePost(DataSet: TDataSet);
    procedure QProdutoRelacionadoCalcFields(DataSet: TDataSet);
    procedure QProdutoRelacionadoConsCalcFields(DataSet: TDataSet);
    procedure QProdutoConsAfterOpen(DataSet: TDataSet);
    procedure QProdutoConsCalcFields(DataSet: TDataSet);
    procedure QCadastroPrecoCalcFields(DataSet: TDataSet);
    procedure QAtualizaPrecoProdutoAfterInsert(DataSet: TDataSet);
    procedure QProdutoBeforeDelete(DataSet: TDataSet);
    procedure QEstoqueBaixaCalcFields(DataSet: TDataSet);
    procedure ValidaCamposNFeProduto;
    procedure QProdutoBeforePost(DataSet: TDataSet);
    procedure QProdutoAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QProdutoBeforeOpen(DataSet: TDataSet);
    procedure QProdutoRelacionadoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    wSqlDadosCalcados: TStringList;
    //wCod_Produto : Integer;
    wCod_Produto : double;
  public
    { Public declarations }
    fFilial: Integer; // usado para passar o parametro para a query QRCompraPosicao
    procedure SalvaDadosCalcados(commit: boolean = true);                                                  
    property pFilial: Integer read fFilial write fFilial;
    function PrecoVenda(pProduto: Real; pCadastro: string; pTipoPessoa: string = 'F'; pLote : Integer = 0): Real; //TipoPessoa = Fisica(Varejo) ou Juridica(Atacado)
    function LocalizaTipo(cod: string; combo: TComboBox): Integer;
    function LocalizaCSTIPI(cod: string; combo: TComboBox): Integer;
    property SqlDadosCalcados: TStringList read wSqlDadosCalcados write wSqlDadosCalcados;
  end;

var
  DMProduto: TDMProduto;
  wold_vlr_varejo, wold_vlr_atacado: real;
  wLote_Tipo : Integer;
  wCodPafInclusaoExclusao: String = '';

implementation

uses UOracle_cl, UParamSistema_cl, UBiblioteca, UUsuario_cl, UPedido_cl;

{$R *.DFM}

procedure TDMProduto.QProdutoBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  wold_vlr_atacado := QProdutoval_atacado.value;
  wold_vlr_varejo := QProdutoval_varejo.value;
  QProdutoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMProduto.QProdutoAfterPost(DataSet: TDataSet);
begin
  if (wold_vlr_varejo <> QProdutoval_varejo.value) or (wold_vlr_atacado <> Qprodutoval_atacado.value) then
  begin
    QProduto.edit;
    QProdutoDT_Alteracao_Preco.value := DMOracle.DataServ;
    QProduto.post;
  end;
  if(DMParamSistema.QParamSistemaIND_VALIDA_CAMPOS_NFE.Value = 'S') then
    ValidaCamposNFeProduto;
//  with DMImpressoraFiscal do
//  begin
//    QChecaMD5Produto.Close;
//    QChecaMD5Produto.SetVariable('COD_PRODUTO',QProdutoCOD_PRODUTO.Value);
//    QChecaMD5Produto.Open;
//    bib.GeraMD5Query(QChecaMD5Produto,'TB_PRODUTO');
//    bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//      true);
//  end;
//  QProduto.RefreshRecord;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(QProdutoCOD_PRODUTO.Text+'TB_PRODUTO'),true);
    ExecutaSql('INSERT INTO TB_PRODUTO_SITUACAO_LOG VALUES(SQPRODUTOSITUACAOLOG.NEXTVAL,'
      + QProdutoCOD_PRODUTO.Text
      + ',' +
      IntToStr(DMUsuario.CodUsuarioCorrente)
      + ',' +
      QuotedStr(QProdutoIND_SITUACAO.Value)
      + ',' +
      QuotedStr(DateToStr(DataServ))
      + ')', true);
  end;
  SalvaDadosCalcados;
  if (DMParamSistema.CodEmpresa = 'ENERMED') then
  begin
    QProdutoCOD_CST_PIS.Value := '70';
    QProdutoCOD_CST_COFINS.Value := '70';
  end;
end;

procedure TDMProduto.QEstoqueBaixaBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o contas o Produto não estiver a Transação em Aberto
    raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Produto.');
  if QProduto.State = dsInsert then
  begin
    QProduto.post;
    QProduto.edit;
  end;
end;

procedure TDMProduto.QEstoqueBaixaBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then //Se o contas o Produto não estiver a Transação em Aberto
    raise Exception.Create('Não é Possível alterar ou incluir valores no movimento. Altere antes o Contas à Pagar.');
  if QProduto.State = dsInsert then
  begin
    QProduto.post;
    QProduto.edit;
  end;
end;

procedure TDMProduto.QEstoqueBaixaAfterInsert(DataSet: TDataSet);
begin
  QEstoqueBaixaCod_Produto.Value := QProdutoCod_Produto.Value;
  QEstoqueBaixaCOD_LOTE_TIPO.Value := wLote_Tipo;
end;

procedure TDMProduto.QProdutoBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMProduto.QEstoqueBaixaAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QEstoqueBaixaCod_Produto_Baixa.Value;
  QEstoqueBaixa.DisableControls;
  QEstoqueBaixa.Close;
  QEstoqueBaixa.Open;
  QEstoqueBaixa.Locate('COD_PRODUTO', wCodigo, []);
  QEstoqueBaixa.EnableControls;
  wLote_Tipo := QEstoqueBaixaCOD_LOTE_TIPO.Value;
end;

procedure TDMProduto.QEstoqueBaixaBeforePost(DataSet: TDataSet);
begin
  if (QEstoqueBaixaCod_Lote_Tipo.Value = QEstoqueBaixaCod_Lote_Tipo_Baixa.Value)
    and (QEstoqueBaixaCod_Produto.Value = QEstoqueBaixaCod_Produto_Baixa.Value) then
  begin
    QEstoqueBaixa.cancel;
    Raise Exception.Create('Erro! Não é possível incluir este produto com este lote,' + chr(13) + 'pois não é permitido dar baixa nele mesmo.');
  end;
end;

function TDMProduto.PrecoVenda(pProduto: Real; pCadastro: string; pTipoPessoa: string = 'F'; pLote : Integer = 0): Real;
var
  wPreco, wDtInicioProm, wDtFimProm, wPrecoCadastro: string;
  wParcelas : Integer;
begin
  wPreco := '';
  wDtInicioProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_INI FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
  wDtFimProm    := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_FIN FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
  if (wDtInicioProm <> '') and (wDtFimProm <> '') then
  begin  // estava validando errado data >= wDtInicioProm, fazendo puxar o valor de promoção antes do início da promoção. Junior-Alex 03/09/2021 - DONA BENTA.
    if (Date >= StrToDate(wDtInicioProm)) and (Date <= StrToDate(wDtFimProm)) then
      wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
  end;
  if (wPreco = '') or (wPreco = '0') then //indica que nao tem nenhuma promocao vigente da forma acima tabela
  begin
    wDtFimProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_FIN FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
    if wDtFimProm <> '' then
    begin
      if (Date <= StrToDate(wDtFimProm)) then
        wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO1 FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
    end;
  end;
  if Trim(pCadastro) <> '' then // indica que tem preco cadastrado para este cadastro
    wPrecoCadastro := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR', 'COD_PRODUTO = ' + FloatToStr(pProduto) +
      ' AND COD_CADASTRO=' + Trim(pCadastro));
  if wPrecoCadastro <> '' then
    wPreco := wPrecoCadastro;

  If  (wPreco = '') or (wPreco = '0') then
   Begin
     wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRECO_LOTE', 'COD_PRODUTO = ' + FloatToStr(pProduto) + ' And COD_LOTE_TIPO=' + IntToStr(PLote), True)
   End;
  if (wPreco = '') or (wPreco = '0') then //indica que nao tem nenhuma promocao vigente entao vale preco de tabela
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' Then
     Begin
       wParcelas := 0;
       If DMPedido.QPedidoCod_Prazo_Vencimento.Text <> '' Then
          wParcelas := StrToInt(DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' +
                 DMPedido.QPedidoCod_Prazo_Vencimento.Text, false));
       If (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') And (wParcelas > 12) Then
          wPreco := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false)
       Else
          wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false);
     end
    else
     Begin
       if pTipoPessoa = 'F' then
          wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false)
       else
          wPreco := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false);
     End;
  end;
  if Trim(wPreco) <> '' then
    Result := StrToFloat(wPreco)
  else
    Result := 0;

  {wPreco := '';
  wDtInicioProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_INI FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
  if wDtInicioProm <> '' then
  begin
    if (Date <= StrToDate(wDtInicioProm)) then // estava validando errado data >= wDtInicioProm, fazendo puxar o valor de promoção antes da dta estabelicidade. Junior 03/09/2021 - DONA BENTA.
      wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
  end;
  if (wPreco = '') or (wPreco = '0') then //indica que nao tem nenhuma promocao vigente da forma acima tabela
  begin
    wDtFimProm := DMOracle.BuscaNome('SELECT DT_PRECO_PRO_FIN FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
    if wDtFimProm <> '' then
    begin
      if (Date <= StrToDate(wDtFimProm)) then
        wPreco := DMOracle.BuscaNome('SELECT PRECO_PROMOCAO1 FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto));
    end;
  end;
  if Trim(pCadastro) <> '' then // indica que tem preco cadastrado para este cadastro
    wPrecoCadastro := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR', 'COD_PRODUTO = ' + FloatToStr(pProduto) +
      ' AND COD_CADASTRO=' + Trim(pCadastro));
  if wPrecoCadastro <> '' then
    wPreco := wPrecoCadastro;

  If  (wPreco = '') or (wPreco = '0') then
   Begin
     wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRECO_LOTE', 'COD_PRODUTO = ' + FloatToStr(pProduto) + ' And COD_LOTE_TIPO=' + IntToStr(PLote), True)
   End;
  if (wPreco = '') or (wPreco = '0') then //indica que nao tem nenhuma promocao vigente entao vale preco de tabela
  begin
    if pTipoPessoa = 'F' then
      wPreco := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false)
    else
      wPreco := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(pProduto), false);
  end;
  if Trim(wPreco) <> '' then
    Result := StrToFloat(wPreco)
  else
    Result := 0;}
end;

procedure TDMProduto.QProdutoFornecedorAfterPost(DataSet: TDataSet);
begin
  QProdutoFornecedor.SetVariable('PK', QProdutoFornecedorCOD_PRODUTO_FORNECEDOR.Value);
end;

procedure TDMProduto.QProdutoPrecoAfterPost(DataSet: TDataSet);
var
  wCodigo: Integer;
begin
  wCodigo := QProdutoPrecoCod_Produto.Value;
  QProdutoPreco.Close;
  QProdutoPreco.SetVariable('COD_PRODUTO', wCodigo);
  QProdutoPreco.Open;
end;

procedure TDMProduto.QRCompraPosicaoCalcFields(DataSet: TDataSet);
var
  wDtRef, wAux: string;
begin
  QUltimaCompra.Close;
  wDtRef := DMOracle.BuscaNome('SELECT DT_COMPRA FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value), True);
  if Trim(wDtRef) = '' then
  begin
    wDtRef := DateToStr(Date - 10);
    QUltimaCompra.SetVariable('RECEBIMENTO1', Date);
  end
  else
    QUltimaCompra.SetVariable('RECEBIMENTO1', wDtRef);
  QUltimaCompra.SetVariable('RECEBIMENTO', wDtRef);
  QUltimaCompra.SetVariable('PRODUTO', QRCompraPosicaoCod_Produto.Value);
  QUltimaCompra.Open;
  if not QUltimaCompra.Eof then
  begin
    QRCompraPosicaoDt_Compra.Value := QUltimaCompraDt_Recebimento.Value;
    QRCompraPosicaoVl_Compra.Value := QUltimaCompraVal_Unitario.Value;
    if QUltimaCompraQt_Quantidade.Value <> 0 then
      QRCompraPosicaoVl_Compra.Value := (QRCompraPosicaoVl_Compra.Value + QUltimaCompraVal_Ipi.Value); //Tirei /QUltimaCompraQt_Quantidade.Value;  Vanessa 18/08/2015
    QRCompraPosicaoQt_Compra.Value := QUltimaCompraQt_Quantidade.Value;
  end
  else
  begin
    QRCompraPosicaoDt_Compra.Text := '';
    //Solicitação João Vetro. Não tem nota de compra mas precisa que saia o custo no relatório. Junior 12/05/2020.
    QRCompraPosicaoVl_Compra.Value :=  StrToFloat('0' + DMOracle.BuscaNome('SELECT NVL(VL_CUSTO_MEDIO,VL_ULTIMO_CUSTO) FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value) +
      ' AND COD_FILIAL = ' + IntToStr(pFilial)) );
//    QRCompraPosicaoVl_Compra.Text := '';
    QRCompraPosicaoQt_Compra.Text := '';
  end;
  if pFilial <> 0 then
  begin
    wAux := DMOracle.BuscaNome('SELECT Sum(QT_QUANTIDADE) FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value) +
      ' AND COD_FILIAL = ' + IntToStr(pFilial));
    if wAux <> '' then
      QRCompraPosicaoQt_Quantidade.Value := StrToFloat(wAux);
    wAux := DMOracle.BuscaNome('SELECT QT_MINIMO FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value) +
      ' AND COD_FILIAL = ' + IntToStr(pFilial));
    if wAux <> '' then
      QRCompraPosicaoQt_Minimo.Value := StrToFloat(wAux);
  end
  else
  begin
    wAux := DMOracle.BuscaNome('SELECT Sum(QT_QUANTIDADE) FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value));
    if wAux <> '' then
      QRCompraPosicaoQt_Quantidade.Value := StrToFloat(wAux);
    wAux := DMOracle.BuscaNome('SELECT QT_MINIMO FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + FloatToStr(QRCompraPosicaoCod_Produto.Value));
    if wAux <> '' then
      QRCompraPosicaoQt_Minimo.Value := StrToFloat(wAux);
  end;
end;


procedure TDMProduto.QProdutoAfterInsert(DataSet: TDataSet);
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FORTE') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SAFARI') then
  begin
    QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
    QProdutoCOD_CLASSE.Value := 6;
    QProdutoCOD_TRIBUTACAO.Value := 1; //pode ser que nao seja 1, era pra ser isento
    QProdutoDESC_UNIDADE.Value := 'UN';
    QProdutoNUM_EMBALAGEM.Value := 1;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    QProdutoCOD_CLASSE.Value := 1;
    QProdutoCOD_TRIBUTACAO.Value := 1;
    QProdutoNUM_EMBALAGEM.Value := 1;
    QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
  end;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
     (DMParamSistema.QParamSistemaCod_Empresa.Text = 'DISPART') then
  begin
    QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
    QProdutoCOD_TRIBUTACAO.Value := 18; //pode ser que nao seja 1, era pra ser isento
    QProdutoDESC_UNIDADE.Value := 'PC';
    QProdutoNUM_EMBALAGEM.Value := 1;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
  begin
    QProdutoIND_TIPO_PRODUTO.Value := 'PEÇA';
  end;
  wSqlDadosCalcados.Clear;
end;

procedure TDMProduto.QProdutoMarcaCalcFields(DataSet: TDataSet);
begin
//  if QProdutoMarcaCOD_PRODUTO.Text <> '' then
//    QProdutoMarcadesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QProdutoMarcaCOD_PRODUTO.Text, True)
//  else
//    QProdutoMarcadesc_produto.Value := '';
  if QProdutoMarcaCOD_MARCA.Text <> '' then
    QProdutoMarcadesc_marca.Value := DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA', 'COD_MARCA = ' + QProdutoMarcaCOD_MARCA.Text, True)
  else
    QProdutoMarcadesc_marca.Value := '';
end;

procedure TDMProduto.QProdutoMarcaAfterInsert(DataSet: TDataSet);
begin
  QProdutoMarcaCOD_PRODUTO.Value := Trunc(QProdutoCOD_PRODUTO.Value);
end;

procedure TDMProduto.QProdutoAfterOpen(DataSet: TDataSet);
begin
  QProdutoMarca.Close;
  QProdutoMarca.Open;
  QProdutoRelacionado.Close;
  QProdutoRelacionado.Open;
  QCstpis.Open;
  QCstCofins.Open;
  QCstpisSaida.Open;
  QCstCofinsSaida.Open;
  QCstIpi.Open;
  QCstIpiSaida.Open;
  QTipoProduto.Open;
end;

procedure TDMProduto.QProdutoMarcaAfterPost(DataSet: TDataSet);
begin
  try
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMProduto.QProdutoMarcaBeforeEdit(DataSet: TDataSet);
begin
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
end;

procedure TDMProduto.QProdutoMarcaBeforeInsert(DataSet: TDataSet);
begin
  if (QProduto.State = DsInsert) then
    QProduto.Post;
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
end;

procedure TDMProduto.QProdutoMarcaBeforeDelete(DataSet: TDataSet);
begin
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
end;

procedure TDMProduto.QProdutoMarcaBeforePost(DataSet: TDataSet);
begin
  if QProdutoMarcaCOD_MARCA.Text = '' then
    QProdutoMarca.cancel;
end;

procedure TDMProduto.QProdutoRelacionadoAfterInsert(DataSet: TDataSet);
begin
  QProdutoRelacionadoCOD_PRODUTO_PAI.Value := Trunc(QProdutoCOD_PRODUTO.Value);
end;

procedure TDMProduto.QProdutoRelacionadoAfterPost(DataSet: TDataSet);
var
  wQuant : integer;
begin
  try
    if DMOracle.DBCemapa.InTransaction then
     Begin
      DMOracle.DBCemapa.Commit;  // nesta primeira inserção esta incluido o produto relacionado (contrapartida)
      wQuant := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PRODUTO_RELACIONADO', 'COD_PRODUTO_PAI = ' + QProdutoRelacionadoCOD_PRODUTO_FILHO.Text +
                                                                                  ' and COD_PRODUTO_FILHO = ' + QProdutoRelacionadoCOD_PRODUTO_PAI.Text, True));
      If wQuant = 0 Then // significa que não esta cadastrado a contrapartida do produto relacionado
       Begin
         QProdutoRelacionado_Contra.Close;
         QProdutoRelacionado_Contra.Open;
         QProdutoRelacionado_Contra.Insert;
         QProdutoRelacionado_ContraCod_Produto_Pai.Value := QProdutoRelacionadoCOD_PRODUTO_FILHO.Value;
         QProdutoRelacionado_ContraCod_Produto_Filho.Value := QProdutoRelacionadoCOD_PRODUTO_PAI.Value;
         QProdutoRelacionado_Contra.Post;
         QProdutoRelacionado_Contra.Close;
       End;
      // aqui vai relacionario os produtos entre eles - para ficarem um relacionado com o outro - César 13/09/2022
      wCod_Produto := QProdutoRelacionadoCOD_PRODUTO_FILHO.Value;
      QProdutoRelacionado.First;

      While not (QProdutoRelacionado.Eof) do
      Begin
        If wCod_Produto <> QProdutoRelacionadoCOD_PRODUTO_FILHO.Value Then   // para não fazer para o mesmo produto inserido
         Begin
          wQuant := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PRODUTO_RELACIONADO', 'COD_PRODUTO_PAI = ' + FloatToStr(wCod_Produto) +
                                                                                      ' and COD_PRODUTO_FILHO = ' + QProdutoRelacionadoCOD_PRODUTO_FILHO.Text, True));
          If (wQuant = 0) Then // significa que não esta cadastrado a contrapartida do produto relacionado
           Begin
             QProdutoRelacionado_Contra.Close;
             QProdutoRelacionado_Contra.Open;
             QProdutoRelacionado_Contra.Insert;
             QProdutoRelacionado_ContraCod_Produto_Pai.Value := wCod_Produto;
             QProdutoRelacionado_ContraCod_Produto_Filho.Value := QProdutoRelacionadoCOD_PRODUTO_FILHO.Value;
             QProdutoRelacionado_Contra.Post;
             QProdutoRelacionado_Contra.Close;
           End;
           // CONTRAPARTIDA DO ITEM ANTERIOR
          wQuant := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PRODUTO_RELACIONADO', 'COD_PRODUTO_PAI = ' + QProdutoRelacionadoCOD_PRODUTO_FILHO.Text +
                                                                                      ' and COD_PRODUTO_FILHO = ' + FloatToStr(wCod_Produto), True));
          If (wQuant = 0)  Then // significa que não esta cadastrado a contrapartida do produto relacionado
           Begin
             QProdutoRelacionado_Contra.Close;
             QProdutoRelacionado_Contra.Open;
             QProdutoRelacionado_Contra.Insert;
             QProdutoRelacionado_ContraCod_Produto_Pai.Value := QProdutoRelacionadoCOD_PRODUTO_FILHO.Value;
             QProdutoRelacionado_ContraCod_Produto_Filho.Value := wCod_Produto;
             QProdutoRelacionado_Contra.Post;
             QProdutoRelacionado_Contra.Close;
           End;
         End;
         QProdutoRelacionado.next;
      End;


     End
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TDMProduto.QProdutoRelacionadoBeforeDelete(DataSet: TDataSet);
begin
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
  wCod_Produto := QProdutoRelacionadoCOD_PRODUTO_FILHO.Value;  // para utilizar na rotina de after delete
  DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_RELACIONADO WHERE COD_PRODUTO_PAI = '+
       QProdutoRelacionadoCOD_PRODUTO_FILHO.Text + ' AND COD_PRODUTO_FILHO = '+
       QProdutoRelacionadoCOD_PRODUTO_PAI.Text,False);
end;

procedure TDMProduto.QProdutoRelacionadoBeforeEdit(DataSet: TDataSet);
begin
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
end;

procedure TDMProduto.QProdutoRelacionadoBeforeInsert(DataSet: TDataSet);
begin
  if (QProduto.State = DsInsert) then
    QProduto.Post;
  if not (QProduto.State in [DsEdit, DsInsert]) then
    QProduto.Edit;
end;

procedure TDMProduto.QProdutoRelacionadoBeforePost(DataSet: TDataSet);
begin
  if QProdutoRelacionadoCOD_PRODUTO_FILHO.Text = '' then
    QProdutoRelacionado.Cancel;
end;

procedure TDMProduto.QProdutoRelacionadoCalcFields(DataSet: TDataSet);
begin
  if QProdutoRelacionadoCOD_PRODUTO_FILHO.Text <> '' then
    QProdutoRelacionadodesc_produto_filho.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QProdutoRelacionadoCOD_PRODUTO_FILHO.Text, True)
  else
    QProdutoRelacionadodesc_produto_filho.Value := '';
end;

procedure TDMProduto.QProdutoRelacionadoConsCalcFields(DataSet: TDataSet);
begin
//  QProdutoRelacionadoConsdesc_produto_filho.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QProdutoRelacionadoConsCOD_PRODUTO_FILHO.Text, True);
end;

procedure TDMProduto.QProdutoConsAfterOpen(DataSet: TDataSet);
begin
  QProdutoRelacionadoCons.Close;
  QProdutoRelacionadoCons.Open;
end;

procedure TDMProduto.QProdutoConsCalcFields(DataSet: TDataSet);
// var x, y: array of string;
begin
{  if DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE' then
  begin
    setLength(x, 2);
    setLength(y, 2);

    x[0] := 'SELECT Sum(QT_QUANTIDADE) FROM TB_ESTOQUE WHERE COD_PRODUTO = ' + QProdutoConsCod_Produto.Text;
    x[1] := 'SELECT AVG(VL_CUSTO_MEDIO) FROM TB_ESTOQUE WHERE COD_PRODUTO = ' + QProdutoConsCod_Produto.Text;

    DMOracle.BuscaNomes(x, y);
    QProdutoConsQt_Estoque.Text := y[0];
    QProdutoConsVal_Custo.Text := y[1];
  end;
}
end;

procedure TDMProduto.QCadastroPrecoCalcFields(DataSet: TDataSet);
begin
//  QCadastroPrecodesc_cadastro.Value := DMOracle.BuscaNome('NOME FROM')
end;

procedure TDMProduto.QAtualizaPrecoProdutoAfterInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMProduto.QProdutoBeforeDelete(DataSet: TDataSet);
var
  wAux: String;
begin
  if QProdutoCOD_PRODUTO.Value > 0 then
  begin
    wAux := DMOracle.FastSelect('SUM(QT_QUANTIDADE)', 'TB_ESTOQUE', 'COD_PRODUTO = ' +
        QProdutoCOD_PRODUTO.Text);
    if wAux > '0' then
      if (MessageDlg('Produto possui estoque (' + wAux + '). Excluir o estoque?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        DMOracle.ExecutaSql('DELETE FROM TB_ESTOQUE WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
        DMOracle.ExecutaSql('DELETE FROM TB_ESTOQUE_MOV WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
      end;
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_GENERO_CALCADO WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_SALTO_CALCADO WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_MATERIAL_CALCADO WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_CONFIG_CALCADO WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_SITUACAO_LOG WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTOXML_PRODUTOBD WHERE COD_PRODUTO = ' + QProdutoCOD_PRODUTO.Text, False);
  end;
  wCodPafInclusaoExclusao := QProdutoCOD_PRODUTO.Text+'TB_PRODUTO';
end;

procedure TDMProduto.QEstoqueBaixaCalcFields(DataSet: TDataSet);
begin
  if not QEstoqueBaixaCOD_PRODUTO_BAIXA.IsNull then
    QEstoqueBaixadesc_produto_baixa.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+QEstoqueBaixaCOD_PRODUTO_BAIXA.Text);
  if not QEstoqueBaixaCOD_LOTE_TIPO.IsNull then
    QEstoqueBaixadesc_lote_tipo.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO='+QEstoqueBaixaCOD_LOTE_TIPO.Text);
  if not QEstoqueBaixaCOD_LOTE_TIPO_BAIXA.IsNull then
    QEstoqueBaixadesc_lote_tipo_baixa.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO='+QEstoqueBaixaCOD_LOTE_TIPO_BAIXA.Text);
end;

function TDMProduto.LocalizaTipo(cod: string; combo: TComboBox): Integer;
var i: Integer;
begin
  for i := 0 to combo.Items.Count - 1 do
    if (copy(combo.Items[i], 1, 2) = cod) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

function TDMProduto.LocalizaCSTIPI(cod: string; combo: TComboBox): Integer;
var i: Integer;
begin
  for i := 0 to combo.Items.Count - 1 do
    if (copy(combo.Items[i], 1, 2) = cod) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

procedure TDMProduto.ValidaCamposNFeProduto;
  var naoPreenchidos : string;
begin
  if(QProdutoNUM_GENERO_NCM.Value = '') then
    naoPreenchidos := naoPreenchidos + #13 + 'Genero NCM';
  if(QProdutoDESC_UNIDADE.Value = '') then
    naoPreenchidos := naoPreenchidos + #13 + 'Unidade de medida';
  if(naoPreenchidos <> '') then
    MessageDlg('Os campos a seguir devem são obrigatórios para a emissão de NF-e: ' + naoPreenchidos, mtInformation, [mbOK], 0);
end;
procedure TDMProduto.QProdutoBeforePost(DataSet: TDataSet);
var
  wDescNCM : String;
begin
  wDescNCM := copy(QProdutoNUM_GENERO_NCM.Value,1,4);
  if (pos(wDescNCM,'2710,2711,2712,2713') > 0 ) and
     ( (QProdutoCOD_PRODUTO_ANP.Text = '') or (QProdutoIND_IMPORT_COMB.Text = '') or (QProdutoPERC_ORIG_UF_COMB.Text = '') ) then
    raise Exception.Create('Obrigatório informar código ANP, Nacional ou importado (0 / 1), estado (UF) de origem e código IBGE UF origem para NCM iniciado (2710, 2711, 2712 e 2713).');
//Adicionado para gravar o código do usuário que esta realizando a alteração. Alex 27/06/2023
  QProdutoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMProduto.QProdutoAfterDelete(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodPafInclusaoExclusao),true);
  end;
end;

procedure TDMProduto.DataModuleCreate(Sender: TObject);
begin
  wSqlDadosCalcados := TStringList.Create;
end;

procedure TDMProduto.SalvaDadosCalcados(commit: boolean = true);
var exec: TExecutador;
  i: integer;
begin
  if wSqlDadosCalcados.Count = 0 then
    exit;
  exec := TExecutador.Create;
  with DMOracle, DMProduto do
  begin
    for i := 0 to wSqlDadosCalcados.Count -1 do
    begin
      exec.Adiciona(wSqlDadosCalcados[i]);
    end;
    exec.Executar(true, commit);
    exec.Free;
    exec := nil;
    wSqlDadosCalcados.Clear;
  end;
end;

procedure TDMProduto.QProdutoBeforeOpen(DataSet: TDataSet);
begin
  wSqlDadosCalcados.Clear;
end;

procedure TDMProduto.QProdutoRelacionadoAfterDelete(DataSet: TDataSet);
begin
  // exclui o produto tambem do produto relacionado
  //agora vai excluir todos os produtos relacionados que utilizam este filho - César 13/09/2022
  QProdutoRelacionado.First;
  While not (QProdutoRelacionado.Eof) do
  Begin
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_RELACIONADO WHERE COD_PRODUTO_PAI = '+
       FloatToStr(wCod_Produto) + ' AND COD_PRODUTO_FILHO = '+
       QProdutoRelacionadoCOD_PRODUTO_Filho.Text,False);
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_RELACIONADO WHERE COD_PRODUTO_PAI = '+
       QProdutoRelacionadoCOD_PRODUTO_FILHO.Text + ' AND COD_PRODUTO_FILHO = '+
       FloatToStr(wCod_Produto),False);
    QProdutoRelacionado.Next;
  End;

end;

end.
