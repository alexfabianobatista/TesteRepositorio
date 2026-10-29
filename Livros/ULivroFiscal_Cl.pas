unit ULivroFiscal_Cl;

interface
               
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, variants, Oracle;

  
type
  TDMLivroFiscal = class(TDataModule)
    DSLivroFiscal: TDataSource;
    DSResumoApuracao: TDataSource;
    DSLcto: TDataSource;
    QRNotasOperacaoResumo: TOracleDataSet1;
    QRNotasOperacaoResumoIND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacaoResumoCOD_OPERACAO: TFloatField;
    QRNotasOperacaoResumoDESC_OPERACAO: TStringField;
    QRNotasOperacaoResumoDESC_RESUMO: TStringField;
    QRNotasOperacaoResumoSVAL_TOTAL: TFloatField;
    QRNotasOperacaoResumoVAL_FUNRURAL: TFloatField;
    QRLivroFiscalArquivo: TOracleDataSet1;
    QRLivroFiscalArquivoUF_CLIENTE: TStringField;
    QRLivroFiscalArquivoNUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivoNUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivoNUM_NOTA: TFloatField;
    QRLivroFiscalArquivoCOD_SERIE: TStringField;
    QRLivroFiscalArquivoIND_SITUACAO: TStringField;
    QRLivroFiscalArquivoCOD_FILIAL: TFloatField;
    QRLivroFiscalArquivoSITUACAO: TStringField;
    QRLivroFiscalArquivoNAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivoIND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivoVAL_TOTAL: TFloatField;
    QRLivroFiscalArquivoVAL_BASE_ISENTA: TFloatField;
    QRLcto: TOracleDataSet1;
    QRLctoNUM_ANO: TIntegerField;
    QRLctoNUM_MES: TIntegerField;
    QRLctoCOD_FILIAL: TIntegerField;
    QRLctoCOD_OPERACAO: TIntegerField;
    QRLctoVAL_IMPOSTO: TFloatField;
    QRLctoDESC_LCTO: TStringField;
    QRLctoDESC_COMPLEMENTO: TStringField;
    QRLctoCOD_LIVRO_LCTO: TIntegerField;
    QRNotasOperacao: TOracleDataSet1;
    QRNotasOperacaoCOD_NOTA_CAB: TFloatField;
    QRNotasOperacaoDT_EMISSAO: TDateTimeField;
    QRNotasOperacaoDT_RECEBIMENTO: TDateTimeField;
    QRNotasOperacaoIND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacaoNUM_NOTA: TFloatField;
    QRNotasOperacaoCOD_SERIE: TStringField;
    QRNotasOperacaoCOD_OPERACAO: TFloatField;
    QRNotasOperacaoDESC_OPERACAO: TStringField;
    QRNotasOperacaoDESC_RESUMO: TStringField;
    QRNotasOperacaoSVAL_TOTAL: TFloatField;
    QRNotasOperacaoDESC_VALOR: TStringField;
    QRNotasOperacaosVal_Funrural: TFloatField;
    QRNotasImposto: TOracleDataSet1;
    QRNotasImpostoCOD_FILIAL: TIntegerField;
    QRNotasImpostoCOD_ESTADO: TStringField;
    QRNotasImpostoNUM_NOTA: TIntegerField;
    QRNotasImpostoDT_EMISSAO: TDateTimeField;
    QRNotasImpostoIND_ENTRADA_SAIDA: TStringField;
    QRNotasImpostoPERC_ALIQUOTA: TFloatField;
    QRNotasImpostoNAT_OPERACAO: TFloatField;
    QRNotasImpostoSVAL_TOTAL: TFloatField;
    QRNotasImpostoSVAL_ICMS: TFloatField;
    QRLivro_DFC: TOracleDataSet1;
    QRLivroNEPrefeitura: TOracleDataSet1;
    QRLivroNEPrefeituraNUM_CGC_CPF: TStringField;
    QRLivroNEPrefeituraDT_EMISSAO: TDateTimeField;
    QRLivroNEPrefeituraNUM_NOTA: TIntegerField;
    QRLivroNEPrefeituraCOD_PRODUTO: TFloatField;
    QRLivroNEPrefeituraQT_QUANTIDADE: TFloatField;
    QRLivroNEPrefeituraVAL_UNITARIO: TFloatField;
    QRLivroNEPrefeituraVAL_TOTAL: TFloatField;
    QRLivroRelNFPeriodo: TOracleDataSet1;
    QRLivroRelNFPeriodoDT_EMISSAO: TDateTimeField;
    QRLivroRelNFPeriodoNUM_NOTA: TIntegerField;
    QRLivroRelNFPeriodoIND_SITUACAO: TStringField;
    QRLivroRelNFPeriodoDESC_OPERACAO: TStringField;
    QRLivroRelNFPeriodoNOME: TStringField;
    QResumoApuracao: TOracleDataSet1;
    QResumoApuracaoNUM_ANO: TFloatField;
    QResumoApuracaoNUM_MES: TFloatField;
    QResumoApuracaoCOD_FILIAL: TFloatField;
    QResumoApuracaoNUM_BANDA: TStringField;
    QResumoApuracaoNOME_BANDA: TStringField;
    QResumoApuracaoCOD_OPERACAO: TFloatField;
    QResumoApuracaoOPERACAO: TStringField;
    QResumoApuracaoVALOR_TEMP: TFloatField;
    QResumoApuracaoValor: TFloatField;
    QRLivroFResumoOpS: TOracleDataSet1;
    QRLivroFResumoOpSCOD_OPERACAO: TFloatField;
    QRLivroFResumoOpSIND_ENTRADA_SAIDA: TStringField;
    QRLivroFResumoOpSDESC_OPERACAO: TStringField;
    QRLivroFResumoOpSDESC_RESUMO: TStringField;
    QRLivroFResumoOpSVAL_ICM: TFloatField;
    QRLivroFResumoOpA: TOracleDataSet1;
    QRLivroFResumoOpADT_RECEBIMENTO: TDateTimeField;
    QRLivroFResumoOpAIND_ENTRADA_SAIDA: TStringField;
    QRLivroFResumoOpADESC_OPERACAO: TStringField;
    QRLivroFResumoOpADESC_RESUMO: TStringField;
    QRLivroFResumoOpACOD_OPERACAO: TFloatField;
    QRLivroFResumoOpAVAL_ICM: TFloatField;
    QLivroFiscalCons: TOracleDataSet1;
    QLivroFiscalConsNUM_ANO: TIntegerField;
    QLivroFiscalConsNUM_MES: TIntegerField;
    QLivroFiscalConsCOD_FILIAL: TIntegerField;
    QLivroFiscalConsVAL_CR_ICM: TFloatField;
    QLivroFiscalConsVAL_DB_ICM: TFloatField;
    QLivroFiscal: TOracleDataSet1;
    QLivroFiscalNUM_ANO: TIntegerField;
    QLivroFiscalNUM_MES: TIntegerField;
    QLivroFiscalCOD_FILIAL: TIntegerField;
    QLivroFiscalVAL_CR_ICM: TFloatField;
    QLivroFiscalVAL_DB_ICM: TFloatField;
    QLivroFiscalVAL_SALDO_CREDOR: TFloatField;
    QLcto: TOracleDataSet1;
    QLctoNUM_ANO: TIntegerField;
    QLctoNUM_MES: TIntegerField;
    QLctoCOD_FILIAL: TIntegerField;
    QLctoCOD_OPERACAO: TIntegerField;
    QLctoVAL_IMPOSTO: TFloatField;
    QLctoDESC_LCTO: TStringField;
    QLctoDESC_COMPLEMENTO: TStringField;
    QRLivroNEPrefeituraDESC_REGIAO: TStringField;
    QRLivro_DFCCOD_ESTADO: TStringField;
    QRLivro_DFCVAL_ICM_BASE: TFloatField;
    QRLivro_DFCVAL_ICM_BASE_ISENTO: TFloatField;
    QRLivro_DFCVAL_ICM_BASE_OUTRAS: TFloatField;
    QRLivro_DFCVAL_CONTABIL: TFloatField;
    QRLivro_DFCIND_ENTRADA_SAIDA: TStringField;
    QRNFSaida_Devolucao_Periodo: TOracleDataSet1;
    QRNFSaida_Devolucao_Periodototal_isento: TFloatField;
    QRNFSaida_Devolucao_PeriodoDT_RECEBIMENTO: TDateTimeField;
    QRNFSaida_Devolucao_PeriodoNUM_NOTA: TIntegerField;
    QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM: TFloatField;
    QRNFSaida_Devolucao_PeriodoT_VENDA: TFloatField;
    QRNFSaida_Devolucao_PeriodoDESC_ESTADO: TStringField;
    QRLivroFiscalArquivoCOD_NOTA_CAB: TFloatField;
    QRLivroFiscalArquivoItens: TOracleDataSet1;
    QRLivroFiscalArquivoDT_RECEBIMENTO: TDateTimeField;
    QRNotasImpostoIND_CONDICAO_PAGTO: TStringField;
    QRNotasImpostoDESC_RESUMO: TStringField;
    QRNotasImpostodesc_pagto: TStringField;
    QRNotasImpostoNOME: TStringField;
    QRLivroFiscalArquivo_R70: TOracleDataSet1;
    QRNotasImpostoCOD_CADASTRO: TIntegerField;
    QRLivroFiscalArquivo_R75: TOracleDataSet1;
    QRLivroFiscalArquivo_R75DESC_UNIDADE: TStringField;
    QRNotasOperacaoResumoNAT_OPERACAO: TFloatField;
    QRNotasOperacaoResumoIND_ESTOQUE: TStringField;
    QRLivroFiscalArquivo_R70UF_CLIENTE: TStringField;
    QRLivroFiscalArquivo_R70NUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivo_R70NUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivo_R70NUM_CONHECIMENTO: TFloatField;
    QRLivroFiscalArquivo_R70COD_SERIE: TStringField;
    QRLivroFiscalArquivo_R70DT_EMISSAO: TDateTimeField;
    QRLivroFiscalArquivo_R70COD_FILIAL: TFloatField;
    QRLivroFiscalArquivo_R70SITUACAO: TStringField;
    QRLivroFiscalArquivo_R70NAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivo_R70IND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivo_R70VAL_TOTAL: TFloatField;
    QRLivroFiscalArquivo_R70VAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivo_R70VAL_ICM: TFloatField;
    QRLivroFiscalArquivo_R70VAL_BASE_ISENTO: TFloatField;
    QRLivroFiscalArquivo_R70VAL_BASE_OUTRAS: TFloatField;
    QRNotasOperacao2: TOracleDataSet1;
    QRNotasOperacao2COD_NOTA_CAB: TFloatField;
    QRNotasOperacao2DT_EMISSAO: TDateTimeField;
    QRNotasOperacao2DT_RECEBIMENTO: TDateTimeField;
    QRNotasOperacao2IND_ENTRADA_SAIDA: TStringField;
    QRNotasOperacao2NUM_NOTA: TFloatField;
    QRNotasOperacao2COD_SERIE: TStringField;
    QRNotasOperacao2COD_OPERACAO: TFloatField;
    QRNotasOperacao2DESC_OPERACAO: TStringField;
    QRNotasOperacao2DESC_RESUMO: TStringField;
    QRNotasOperacao2SVAL_TOTAL: TFloatField;
    QRNotasOperacao2sval_funrural: TFloatField;
    QRLivroFiscalArquivoIND_EMITE: TStringField;
    QRNotasOperacaoResumoIND_FISICA_JURIDICA: TStringField;
    QRNotasOperacao2DESC_VALOR: TStringField;
    QRLivroFiscalArquivoNUM_LIVROS: TFloatField;
    QRNotasOperacaoCOD_CADASTRO: TFloatField;
    QRNotasOperacaoIND_FISICA_JURIDICA: TStringField;
    QRPisCofins: TOracleDataSet1;
    QRPisCofinsNUMERO: TFloatField;
    QRPisCofinsDT_EMISSAO: TDateTimeField;
    QRPisCofinsDT_RECEBIMENTO: TDateTimeField;
    QRPisCofinsCOD_OPERACAO: TFloatField;
    QRPisCofinsIND_TIPO: TStringField;
    QRLivroFiscalArquivo_R75DESC_PRODUTO: TStringField;
    QRLivroNEPrefeituraDESC_PRODUTO: TStringField;
    QRLivroFiscalArquivoIND_VENDAS: TStringField;
    QRLivroFiscalArquivo_R70IND_VENDAS: TStringField;
    QRNFSaida_Devolucao_PeriodoNOME: TStringField;
    QRLivroSiscredi: TOracleDataSet1;
    QRLivroSiscrediNUM_NOTA: TIntegerField;
    QRLivroSiscrediCOD_SERIE: TStringField;
    QRLivroSiscrediDT_EMISSAO: TDateTimeField;
    QRLivroSiscrediNOME: TStringField;
    QRLivroSiscrediNUM_CGC_CPF: TStringField;
    QRLivroSiscrediNAT_OPERACAO: TFloatField;
    QRLivroSiscrediTOTAL_NOTA: TFloatField;
    QRLivroSiscrediVAL_DIFERIDO: TFloatField;
    QArquivo_GiaSt: TOracleDataSet1;
    QArquivo_GiaStNUM_NOTA: TIntegerField;
    QArquivo_GiaStCOD_SERIE: TStringField;
    QArquivo_GiaStDT_EMISSAO: TDateTimeField;
    QArquivo_GiaStVAL_TOTAL: TFloatField;
    QArquivo_GiaStVAL_ICM_BASE: TFloatField;
    QArquivo_GiaStVAL_ICM: TFloatField;
    QArquivo_GiaStVAL_IPI: TFloatField;
    QArquivo_GiaStVAL_BASE_SUBSTITUICAO: TFloatField;
    QArquivo_GiaStVAL_ICMS_SUBSTITUICAO: TFloatField;
    QArquivo_GiaStIND_VENDAS: TStringField;
    QArquivo_GiaStNUM_INSCRICAO: TStringField;
    QRLivroSiscrediCOD_ESTADO: TStringField;
    QRLivroSiscrediCOD_OPERACAO: TIntegerField;
    QRLivroSiscrediNUM_INSCRICAO: TStringField;
    QRLivroSiscrediDESC_CIDADE: TStringField;
    QRNotasOperacaoSVAL_ICMS: TFloatField;
    QRNotasOperacao2SVAL_ICMS: TFloatField;
    QRImpostoClasse: TOracleDataSet1;
    QRImpostoClasseCOD_FILIAL: TIntegerField;
    QRImpostoClasseCOD_ESTADO: TStringField;
    QRImpostoClasseNUM_NOTA: TIntegerField;
    QRImpostoClasseDT_EMISSAO: TDateTimeField;
    QRImpostoClasseCOD_CADASTRO: TIntegerField;
    QRImpostoClasseNOME: TStringField;
    QRImpostoClassePERC_ALIQUOTA: TFloatField;
    QRImpostoClasseSVAL_TOTAL: TFloatField;
    QRImpostoClasseSVAL_ICMS: TFloatField;
    QRImpostoClasseSVAL_BASE_ICMS: TFloatField;
    QRImpostoProduto: TOracleDataSet1;
    QRImpostoProdutoDESC_PRODUTO: TStringField;
    QRImpostoProdutoSVAL_TOTAL: TFloatField;
    QRImpostoProdutoSVAL_ICMS: TFloatField;
    QRImpostoProdutoSVAL_BASE_ICMS: TFloatField;
    QRImpostoProdutoDESC_OPERACAO: TStringField;
    QRImpostoProdutoCOD_OPERACAO: TIntegerField;
    QRRetornoImposto: TOracleDataSet1;
    QRRetornoImpostoCOD_PRODUTO: TFloatField;
    QRRetornoImpostoDESC_PRODUTO: TStringField;
    QRRetornoImpostoCOD_CADASTRO: TIntegerField;
    QRRetornoImpostoNOME: TStringField;
    QRRetornoImpostoNUM_NOTA: TIntegerField;
    QRRetornoImpostoDT_EMISSAO: TDateTimeField;
    QRRetornoImpostoVAL_TOTAL: TFloatField;
    QRRetornoImpostoPERC_ALIQUOTA: TFloatField;
    QRRetornoImpostoVAL_ICM: TFloatField;
    QRImpostoClasseNUM_CLASSE: TIntegerField;
    QRImpostoClasseNUM_SUBCLASSE: TIntegerField;
    QRImpostoClasseDESC_CLASSE: TStringField;
    QLctoCOD_GIA: TIntegerField;
    QLctoDESC_GIA: TStringField;
    QResumoApuracaoNUM_GIA: TFloatField;
    QResumoApuracaodesc_val_55: TStringField;
    QResumoApuracaodesc_val_65: TStringField;
    QRResumo_IPI_ICMS: TOracleDataSet1;
    QRLctoCOD_GIA: TIntegerField;
    QRLctoDESC_GIA: TStringField;
    QRLivro_DFCIND_FISICA_JURIDICA: TStringField;
    QRLivro_DFCDESC_CIDADE: TStringField;
    QRImpostoNotaProduto: TOracleDataSet1;
    QRImpostoNotaProdutoDESC_PRODUTO: TStringField;
    QRImpostoNotaProdutoCOD_OPERACAO: TIntegerField;
    QRImpostoNotaProdutoNUM_NOTA: TIntegerField;
    QRImpostoNotaProdutoDT_RECEBIMENTO: TDateTimeField;
    QRImpostoNotaProdutoCOD_ESTADO: TStringField;
    QRImpostoNotaProdutoCOD_CADASTRO: TIntegerField;
    QRImpostoNotaProdutoNOME: TStringField;
    QRImpostoNotaProdutoDESC_OPERACAO: TStringField;
    QRImpostoNotaProdutoCOD_CFOP: TFloatField;
    QRImpostoNotaProdutoSVAL_TOTAL: TFloatField;
    QRImpostoNotaProdutoSVAL_ICMS: TFloatField;
    QRImpostoNotaProdutoSVAL_BASE_ICMS: TFloatField;
    QRImpostoNotaProdutoPERC_ALIQUOTA: TFloatField;
    QRImpostoNotaProdutoCOD_PRODUTO: TFloatField;
    QLivroFiscalVAL_SALARIO_MES: TFloatField;
    QLivroFiscalVAL_SALARIO_EXEC_ANTERIOR: TFloatField;
    QLivroFiscalVAL_FUNDOSOCIAL: TFloatField;
    QLivroFiscalVAL_FUNDOCULTURAL: TFloatField;
    QLivroFiscalVAL_FUNDOTURISMO: TFloatField;
    QLivroFiscalVAL_FUNDOESPORTE: TFloatField;
    QRNotaArquivoSc_47: TOracleDataSet1;
    QRNotaArquivoSc_47COD_MUNICIPIO_SC: TIntegerField;
    QRNotaArquivoSc_47SVAL_TOTAL: TFloatField;
    QLivroFiscalVAL_ESTOQUE_INICIO: TFloatField;
    QLivroFiscalVAL_ESTOQUE_FIM: TFloatField;
    QLivroFiscalVAL_DISPONIBILIDADES: TFloatField;
    QLivroFiscalVAL_CONTA_RECEBER_CIRCULANTE: TFloatField;
    QLivroFiscalVAL_ESTOQUE: TFloatField;
    QLivroFiscalVAL_OUTROS_ESTOQUE: TFloatField;
    QLivroFiscalVAL_OUTROS_CONTAS_ATIVO: TFloatField;
    QLivroFiscalVAL_CONTA_RECEBER_REALIZAVEL: TFloatField;
    QLivroFiscalVAL_INVESTIMENTOS: TFloatField;
    QLivroFiscalVAL_IMOBILIZADO: TFloatField;
    QLivroFiscalVAL_DIFERIDO: TFloatField;
    QLivroFiscalval_circulante: TFloatField;
    QLivroFiscalval_realizavel_longo_prazo: TFloatField;
    QLivroFiscalval_permanente: TFloatField;
    QLivroFiscalVAL_OUTROS_CONTAS_REALIZAVEL: TFloatField;
    QLivroFiscalVAL_FORNECEDORES: TFloatField;
    QLivroFiscalVAL_EMPRESTIMOS_FINANCIAMENTOS: TFloatField;
    QLivroFiscalVAL_OUTRAS_CONTAS_PASSIVO: TFloatField;
    QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO: TFloatField;
    QLivroFiscalVAL_RESULTADO_EXERCICIO: TFloatField;
    QLivroFiscalVAL_PASSIVO_DESCOBERTO: TFloatField;
    QLivroFiscalVAL_CAPITAL_SOCIAL: TFloatField;
    QLivroFiscalVAL_OUTRAS_CONTAS_PATR_LIQUIDO: TFloatField;
    QLivroFiscalVAL_OUTRAS_CONT_PATR_LIQ_NEG: TFloatField;
    QLivroFiscalval_circulante_passivo: TFloatField;
    QLivroFiscalval_patrimonio_liquido: TFloatField;
    QLivroFiscalVAL_DEDUCOES_RECEITA_BRUTA: TFloatField;
    QLivroFiscalVAL_OUTRAS_RECEITAS_OPER: TFloatField;
    QLivroFiscalVAL_DESPESAS_OPERACIONAIS: TFloatField;
    QLivroFiscalVAL_RECEITAS_NAO_OPER: TFloatField;
    QLivroFiscalVAL_DESPESAS_NAO_OPER: TFloatField;
    QLivroFiscalVAL_PROVISAO_IR_CONTR_SOCIAL: TFloatField;
    QLivroFiscalVAL_PARTICIPACOES_CONTR: TFloatField;
    QLivroFiscalVAL_PRO_LABORE: TFloatField;
    QLivroFiscalVAL_COMISSOES_SALARIOS: TFloatField;
    QLivroFiscalVAL_COMBUSTIVEIS: TFloatField;
    QLivroFiscalVAL_ENCARGOS_SOCIAIS: TFloatField;
    QLivroFiscalVAL_TRIBUTOS_FEDERAIS: TFloatField;
    QLivroFiscalVAL_TRIBUTOS_ESTADUAIS: TFloatField;
    QLivroFiscalVAL_TRIBUTOS_MUNICIPAIS: TFloatField;
    QLivroFiscalVAL_AGUA_TELEFONE: TFloatField;
    QLivroFiscalVAL_ENERGIA_ELETRICA: TFloatField;
    QLivroFiscalVAL_ALUGUEIS: TFloatField;
    QLivroFiscalVAL_SERVICOS_PROFISSIONAIS: TFloatField;
    QLivroFiscalVAL_SEGUROS: TFloatField;
    QLivroFiscalVAL_FRETES_CARRETOS: TFloatField;
    QLivroFiscalVAL_DESPESAS_FINANCEIRAS: TFloatField;
    QLivroFiscalVAL_OUTRAS_DESPESAS: TFloatField;
    QLivroFiscalCOD_RECEITA: TIntegerField;
    QLivroFiscalDT_VENCIMENTO_RECOLHIMENTO: TDateTimeField;
    QLivroFiscalNUM_CLASSE_VENCTO: TIntegerField;
    QLivroFiscalVAL_RECEITA_BRUTA: TFloatField;
    QLivroFiscalVAL_CUSTO_MERCADORIA: TFloatField;
    QRRegimeEspecialPR: TOracleDataSet1;
    QRRegimeEspecialPRFILIAL: TIntegerField;
    QRRegimeEspecialPRESTADO: TStringField;
    QRRegimeEspecialPRDT_EMISSAO: TDateTimeField;
    QRRegimeEspecialPRNUM_NOTA: TIntegerField;
    QRRegimeEspecialPRMES_ANO_EMISSAO: TStringField;
    QRRegimeEspecialPRVAL_ICM_BASE: TFloatField;
    QRRegimeEspecialPRVAL_ICM: TFloatField;
    QRRegimeEspecialPRQUANTIDADE: TFloatField;
    QRRegimeEspecialPRNUM_CLASSE: TIntegerField;
    QRRegimeEspecialPRDESC_CLASSE: TStringField;
    QRNotaArquivoSc_47DESC_CIDADE: TStringField;
    OPLivros: TOraclePackage;
    QRTipo60Mestre: TOracleDataSet1;
    QRTipo60MestreCOD_REGISTRO_MESTRE: TIntegerField;
    QRTipo60MestreDT_EMISSAO: TDateTimeField;
    QRTipo60MestreDESC_SERIE: TStringField;
    QRTipo60MestreNUM_SEQUENCIAL: TIntegerField;
    QRTipo60MestreDESC_MODELO: TStringField;
    QRTipo60MestreNUM_COO_INI: TIntegerField;
    QRTipo60MestreNUM_COO_FIN: TIntegerField;
    QRTipo60MestreNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QRTipo60MestreNUM_REINICIO_OPRERACAO: TIntegerField;
    QRTipo60MestreVAL_VENDA_BRUTA: TFloatField;
    QRTipo60MestreVAL_TOTAL_GERAL: TFloatField;
    QRTipo60Analitico: TOracleDataSet1;
    QRTipo60AnaliticoCOD_REGISTRO_ANALITICO: TIntegerField;
    QRTipo60AnaliticoDT_EMISSAO: TDateTimeField;
    QRTipo60AnaliticoDESC_SERIE: TStringField;
    QRTipo60AnaliticoIND_SITUACAO_TRIBUTARIA: TStringField;
    QRTipo60AnaliticoVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QRNotasOperacaosVal_Dpi: TFloatField;
    QRNotasOperacao2sval_dpi: TFloatField;
    QRLivroFiscalArquivoItensDESC_PRODUTO: TStringField;
    QRLivroFiscalArquivoItensDESC_UNIDADE: TStringField;
    QRLivroFiscalArquivoItensCOD_PRODUTO: TFloatField;
    QRLivroFiscalArquivoItensNUM_NOTA: TFloatField;
    QRLivroFiscalArquivoItensCOD_SERIE: TStringField;
    QRLivroFiscalArquivoItensIND_FISICA_JURIDICA: TStringField;
    QRLivroFiscalArquivoItensNUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivoItensIND_VENDAS: TStringField;
    QRLivroFiscalArquivoItensNAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivoItensQT_QUANTIDADE: TFloatField;
    QRLivroFiscalArquivoItensVAL_TOTAL: TFloatField;
    QRLivroFiscalArquivoItensVAL_DESCONTO: TFloatField;
    QRLivroFiscalArquivo_R74: TOracleDataSet1;
    QRLivroFiscalArquivo_R74COD_PRODUTO: TFloatField;
    QRLivroFiscalArquivo_R74QT_QUANTIDADE: TFloatField;
    QRLivroFiscalArquivo_R74VL_CUSTO_MEDIO: TFloatField;
    QRLivroFiscalArquivo_R75COD_PRODUTO: TFloatField;
    QLivroFiscalVAL_CREDITO_DCIP: TFloatField;
    QLctoCOD_LIVRO_LCTO: TIntegerField;
    QTermoAbertura: TOracleDataSet1;
    QTermoAberturaCOD_TERMO_ABERTURA: TIntegerField;
    QTermoAberturaCOD_FILIAL: TIntegerField;
    QTermoAberturaNUM_ORDEM: TFloatField;
    QTermoAberturaDESC_NAT_LIVRO: TStringField;
    QTermoAberturaDT_ARQUIVAMENTO: TDateTimeField;
    QTermoAberturaDT_ARQUIVAMENTO_CONVERSAO: TDateTimeField;
    QTermoAberturaDescFilial: TStringField;
    QTermoAberturaDT_INICIAL: TDateTimeField;
    QRLivroFiscalArquivoVAL_ICM_BASE_1: TFloatField;
    QRLivroFiscalArquivoVAL_ICM_1: TFloatField;
    QRLivroFiscalArquivoVAL_BASE_OUTRAS_1: TFloatField;
    QRLivroFiscalArquivoval_icm_base: TFloatField;
    QRLivroFiscalArquivoval_icm: TFloatField;
    QRLivroFiscalArquivoval_base_outras: TFloatField;
    QRLivroFiscalArquivoItensPERC_ALIQUOTA_1: TFloatField;
    QRLivroFiscalArquivoItensVAL_ICM_BASE_1: TFloatField;
    QRLivroFiscalArquivoItensperc_aliquota: TFloatField;
    QRLivroFiscalArquivoItensval_icm_base: TFloatField;
    QRLivroFiscalArquivoPERC_ALIQUOTA_1: TFloatField;
    QRLivroFiscalArquivoperc_aliquota: TFloatField;
    QRLivroFiscalArquivo61: TOracleDataSet1;
    QRLivroFiscalArquivo61NUM_NOTA: TIntegerField;
    QRLivroFiscalArquivo61COD_SERIE: TStringField;
    QRLivroFiscalArquivo61IND_SITUACAO: TStringField;
    QRLivroFiscalArquivo61DT_RECEBIMENTO: TDateTimeField;
    QRLivroFiscalArquivo61COD_FILIAL: TIntegerField;
    QRLivroFiscalArquivo61NAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivo61VAL_TOTAL: TFloatField;
    QRLivroFiscalArquivo61PERC_ALIQUOTA: TFloatField;
    QRLivroFiscalArquivo61VAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivo61VAL_ICM: TFloatField;
    QRLivroFiscalArquivo61VAL_BASE_ISENTA: TFloatField;
    QRLivroFiscalArquivo61VAL_BASE_OUTRAS: TFloatField;
    QRLivroFiscalArquivo61R: TOracleDataSet1;
    QRLivroFiscalArquivo61RCOD_PRODUTO: TFloatField;
    QRLivroFiscalArquivo61RPERC_ALIQUOTA: TFloatField;
    QRLivroFiscalArquivo61RQT_QUANTIDADE: TFloatField;
    QRLivroFiscalArquivo61RVAL_TOTAL: TFloatField;
    QRLivroFiscalArquivo61RVAL_ICM_BASE: TFloatField;
    QRLivroFiscalArquivo61RMESANO: TStringField;
    QRLivroFiscalArquivo61DT_EMISSAO: TDateTimeField;
    QRLivroFiscalArquivoVAL_SUBST_TRIBUT: TFloatField;
    QLivroFiscalNUM_PROCESSO: TStringField;
    QLivroFiscalIND_PROCESSO: TIntegerField;
    QLivroFiscalDESC_PROCESSO: TStringField;
    QLivroFiscalIND_ORIGEM: TStringField;
    QTipo60Resumo: TOracleDataSet1;
    QTipo60ResumoCOD_REGISTRO_RESUMO: TIntegerField;
    QTipo60ResumoNUM_MES: TIntegerField;
    QTipo60ResumoNUM_ANO: TIntegerField;
    QTipo60ResumoCOD_PRODUTO: TStringField;
    QTipo60ResumoQT_QUANTIDADE: TFloatField;
    QTipo60ResumoVAL_PRODUTO: TFloatField;
    QTipo60ResumoVAL_BASE_ICMS: TFloatField;
    QTipo60ResumoIND_SITUACAO_TRIBUTARIA: TStringField;
    QTipo60ResumoPERC_ALIQUOTA: TFloatField;
    QTipo60ResumoCons: TOracleDataSet1;
    QTipo60ResumoConsCOD_REGISTRO_RESUMO: TIntegerField;
    QTipo60ResumoConsNUM_MES: TIntegerField;
    QTipo60ResumoConsNUM_ANO: TIntegerField;
    QTipo60ResumoConsCOD_PRODUTO: TStringField;
    QTipo60ResumoConsQT_QUANTIDADE: TFloatField;
    QTipo60ResumoConsVAL_PRODUTO: TFloatField;
    QTipo60ResumoConsVAL_BASE_ICMS: TFloatField;
    QTipo60ResumoConsIND_SITUACAO_TRIBUTARIA: TStringField;
    QTipo60ResumoConsPERC_ALIQUOTA: TFloatField;
    QTipo60Mestre: TOracleDataSet1;
    QTipo60MestreCOD_REGISTRO_MESTRE: TIntegerField;
    QTipo60MestreDT_EMISSAO: TDateTimeField;
    QTipo60MestreDESC_SERIE: TStringField;
    QTipo60MestreNUM_SEQUENCIAL: TIntegerField;
    QTipo60MestreDESC_MODELO: TStringField;
    QTipo60MestreNUM_COO_INI: TIntegerField;
    QTipo60MestreNUM_COO_FIN: TIntegerField;
    QTipo60MestreNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QTipo60MestreNUM_REINICIO_OPRERACAO: TIntegerField;
    QTipo60MestreVAL_VENDA_BRUTA: TFloatField;
    QTipo60MestreVAL_TOTAL_GERAL: TFloatField;
    QTipo60MestreCons: TOracleDataSet1;
    QTipo60MestreConsCOD_REGISTRO_MESTRE: TIntegerField;
    QTipo60MestreConsDT_EMISSAO: TDateTimeField;
    QTipo60MestreConsDESC_SERIE: TStringField;
    QTipo60MestreConsNUM_SEQUENCIAL: TIntegerField;
    QTipo60MestreConsDESC_MODELO: TStringField;
    QTipo60MestreConsNUM_COO_INI: TIntegerField;
    QTipo60MestreConsNUM_COO_FIN: TIntegerField;
    QTipo60MestreConsNUM_CONTADOR_REDUCAOZ: TIntegerField;
    QTipo60MestreConsNUM_REINICIO_OPRERACAO: TIntegerField;
    QTipo60MestreConsVAL_VENDA_BRUTA: TFloatField;
    QTipo60MestreConsVAL_TOTAL_GERAL: TFloatField;
    QTipo60Analitico: TOracleDataSet1;
    QTipo60AnaliticoCOD_REGISTRO_ANALITICO: TIntegerField;
    QTipo60AnaliticoDT_EMISSAO: TDateTimeField;
    QTipo60AnaliticoDESC_SERIE: TStringField;
    QTipo60AnaliticoIND_SITUACAO_TRIBUTARIA: TStringField;
    QTipo60AnaliticoVLR_ACUMULADO_TOTAL_PARCIAL: TFloatField;
    QTipo60AnaliticoCOD_REGISTRO_MESTRE: TIntegerField;
    QImportaNotas_Resumo60: TOracleDataSet1;
    QImportaNotas_Resumo60COD_PRODUTO: TFloatField;
    QImportaNotas_Resumo60QT_QUANTIDADE: TFloatField;
    QImportaNotas_Resumo60VAL_TOTAL: TFloatField;
    QImportaNotas_Resumo60VAL_ICM_BASE: TFloatField;
    QImportaNotas_Resumo60PERC_ALIQUOTA: TFloatField;
    QDeletaResumoTipo60: TOracleDataSet1;
    QImportaNotas_Resumo60COD_TRIB_IMP_FISCAL: TStringField;
    QDeletaResumoTipo60COD_REGISTRO_RESUMO: TIntegerField;
    QDeletaResumoTipo60NUM_MES: TIntegerField;
    QDeletaResumoTipo60NUM_ANO: TIntegerField;
    QDeletaResumoTipo60COD_PRODUTO: TStringField;
    QDeletaResumoTipo60QT_QUANTIDADE: TFloatField;
    QDeletaResumoTipo60VAL_PRODUTO: TFloatField;
    QDeletaResumoTipo60VAL_BASE_ICMS: TFloatField;
    QDeletaResumoTipo60IND_SITUACAO_TRIBUTARIA: TStringField;
    QDeletaResumoTipo60PERC_ALIQUOTA: TFloatField;
    QRTipo60Resumo: TOracleDataSet1;
    QRTipo60ResumoCOD_REGISTRO_RESUMO: TIntegerField;
    QRTipo60ResumoNUM_MES: TIntegerField;
    QRTipo60ResumoNUM_ANO: TIntegerField;
    QRTipo60ResumoCOD_PRODUTO: TStringField;
    QRTipo60ResumoQT_QUANTIDADE: TFloatField;
    QRTipo60ResumoVAL_PRODUTO: TFloatField;
    QRTipo60ResumoVAL_BASE_ICMS: TFloatField;
    QRTipo60ResumoIND_SITUACAO_TRIBUTARIA: TStringField;
    QRTipo60ResumoPERC_ALIQUOTA: TFloatField;
    QrGiCms: TOracleDataSet1;
    QrGiCmsIND_ENTRADA_SAIDA: TStringField;
    QrGiCmsCOD_ESTADO: TStringField;
    QrGiCmsSVAL_TOTAL: TFloatField;
    QrGiCmsSVL_OUTRAS: TFloatField;
    QrGiCmsSVAL_ICMS_SUBST: TFloatField;
    QrGiCmsSVAL_BASE_CALCULO: TFloatField;
    QExportaNF_Sinco: TOracleDataSet1;
    QExportaNF_Sincoval_total: TFloatField;
    QExportaNF_Sinco432: TOracleDataSet1;
    QExportaNF_Sinco491: TOracleDataSet1;
    QExportaNF_Sinco494: TOracleDataSet1;
    QExportaNF_Sinco495: TOracleDataSet1;
    QExportaNF_Sinco433: TOracleDataSet1;
    QExportaNF_Sinco434: TOracleDataSet1;
    QExportaNF_Sinco435: TOracleDataSet1;
    QExportaNF_Sinco436: TOracleDataSet1;
    QExportaNF_Sinco4101: TOracleDataSet1;
    QExportaNF_Sinco4102: TOracleDataSet1;
    QExportaNF_Sinco4104: TOracleDataSet1;
    QParamPisCofins: TOracleDataSet1;
    QParamPisCofinsCOD_PARAM_PIS_COFINS: TIntegerField;
    QParamPisCofinsCOD_OPERACAO: TIntegerField;
    QParamPisCofinsNUM_NCM: TStringField;
    QParamPisCofinsCOD_CST_PIS: TStringField;
    QParamPisCofinsVAL_ALIQ_PIS: TFloatField;
    QParamPisCofinsVAL_BC_PIS: TFloatField;
    QParamPisCofinsCOD_CST_COFINS: TStringField;
    QParamPisCofinsVAL_ALIQ_COFINS: TFloatField;
    QParamPisCofinsVAL_BC_COFINS: TFloatField;
    QParamPisCofinsCons: TOracleDataSet1;
    QParamPisCofinsConsCOD_PARAM_PIS_COFINS: TIntegerField;
    QParamPisCofinsConsCOD_OPERACAO: TIntegerField;
    QParamPisCofinsConsNUM_NCM: TStringField;
    QParamPisCofinsConsCOD_CST_PIS: TStringField;
    QParamPisCofinsConsVAL_ALIQ_PIS: TFloatField;
    QParamPisCofinsConsVAL_BC_PIS: TFloatField;
    QParamPisCofinsConsCOD_CST_COFINS: TStringField;
    QParamPisCofinsConsVAL_ALIQ_COFINS: TFloatField;
    QParamPisCofinsConsVAL_BC_COFINS: TFloatField;
    QParamPisCofinsConsDESC_OPERACAO: TStringField;
    QCalculaImposto: TOracleDataSet1;
    QCalculaImpostoCOD_CST_PIS: TStringField;
    QCalculaImpostoVAL_BC_PIS: TFloatField;
    QCalculaImpostoVAL_ALIQ_PIS: TFloatField;
    QCalculaImpostoCOD_CST_COFINS: TStringField;
    QCalculaImpostoVAL_BC_COFINS: TFloatField;
    QCalculaImpostoVAL_ALIQ_COFINS: TFloatField;
    QExportaNF_Sinco4105: TOracleDataSet1;
    QExportaNF_Sinco438: TOracleDataSet1;
    QExportaNF_Sinco439: TOracleDataSet1;
    QExportaNF_Sinco4106: TOracleDataSet1;
    QUnidades: TOracleDataSet1;
    QUnidadesDESC_UNIDADE: TStringField;
    QPercPisCofins: TOracleDataSet1;
    QPercPisCofinsCOD_PERC_PIS_COFINS: TIntegerField;
    QPercPisCofinsNUM_ANO: TIntegerField;
    QPercPisCofinsNUM_MES: TIntegerField;
    QPercPisCofinsPERC_PIS_EXP: TFloatField;
    QPercPisCofinsPERC_PIS_TRIB: TFloatField;
    QPercPisCofinsPERC_PIS_NAO_TRIB: TFloatField;
    QPercPisCofinsPERC_COFINS_EXP: TFloatField;
    QPercPisCofinsPERC_COFINS_TRIB: TFloatField;
    QPercPisCofinsPERC_COFINS_NAO_TRIB: TFloatField;
    QPercPisCofinsCons: TOracleDataSet1;
    QPercPisCofinsConsCOD_PERC_PIS_COFINS: TIntegerField;
    QPercPisCofinsConsNUM_ANO: TIntegerField;
    QPercPisCofinsConsNUM_MES: TIntegerField;
    QPercPisCofinsConsPERC_PIS_EXP: TFloatField;
    QPercPisCofinsConsPERC_PIS_TRIB: TFloatField;
    QPercPisCofinsConsPERC_PIS_NAO_TRIB: TFloatField;
    QPercPisCofinsConsPERC_COFINS_EXP: TFloatField;
    QPercPisCofinsConsPERC_COFINS_TRIB: TFloatField;
    QPercPisCofinsConsPERC_COFINS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco491DT_CADASTRO: TDateTimeField;
    QExportaNF_Sinco491NUM_CGC_CPF: TStringField;
    QExportaNF_Sinco491NUM_INSCRICAO: TStringField;
    QExportaNF_Sinco491DESC_INSCRICAO_MUNICIPAL: TStringField;
    QExportaNF_Sinco491NOME: TStringField;
    QExportaNF_Sinco491DESC_ENDERECO: TStringField;
    QExportaNF_Sinco491DESC_CIDADE: TStringField;
    QExportaNF_Sinco491DESC_BAIRRO: TStringField;
    QExportaNF_Sinco491COD_ESTADO: TStringField;
    QExportaNF_Sinco491DESC_PAIS: TStringField;
    QExportaNF_Sinco491DESC_CEP: TStringField;
    QExportaNF_Sinco491DT_ULT_ALTERACAO: TDateTimeField;
    QExportaNF_Sinco494DESC_OPERACAO: TStringField;
    QExportaNF_Sinco494DT_CADASTRO: TDateTimeField;
    QExportaNF_Sinco432IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco432COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco432NUM_NOTA: TIntegerField;
    QExportaNF_Sinco432COD_SERIE: TStringField;
    QExportaNF_Sinco432DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco432IND_CONDICAO_PAGTO: TStringField;
    QExportaNF_Sinco432COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco432DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco432COD_PRODUTO: TFloatField;
    QExportaNF_Sinco432DESC_PRODUTO: TStringField;
    QExportaNF_Sinco432DESC_COMPLEMENTO: TStringField;
    QExportaNF_Sinco432NAT_OPERACAO: TFloatField;
    QExportaNF_Sinco432COD_OPERACAO: TIntegerField;
    QExportaNF_Sinco432NUM_GENERO_NCM: TStringField;
    QExportaNF_Sinco432QT_QUANTIDADE: TFloatField;
    QExportaNF_Sinco432DESC_UNIDADE: TStringField;
    QExportaNF_Sinco432VAL_UNITARIO: TFloatField;
    QExportaNF_Sinco432VAL_TOTAL: TFloatField;
    QExportaNF_Sinco432VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco432IND_IPI: TStringField;
    QExportaNF_Sinco432PERC_IPI: TFloatField;
    QExportaNF_Sinco432VAL_IPI: TFloatField;
    QExportaNF_Sinco432NUM_CLASSIFICACAO: TStringField;
    QExportaNF_Sinco432PERC_ALIQUOTA: TFloatField;
    QExportaNF_Sinco432DESC_SITUACAO_TRIB: TStringField;
    QExportaNF_Sinco432VAL_ICM_BASE: TFloatField;
    QExportaNF_Sinco432VAL_ICM: TFloatField;
    QExportaNF_Sinco432IND_ESTOQUE: TStringField;
    QExportaNF_Sinco432DESC_MODELO: TStringField;
    QExportaNF_Sinco434DESC_TIPO: TStringField;
    QExportaNF_Sinco434IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco434COD_SERIE: TStringField;
    QExportaNF_Sinco434DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco434DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco434COD_PRODUTO: TFloatField;
    QExportaNF_Sinco434DESC_PRODUTO: TStringField;
    QExportaNF_Sinco434DESC_COMPLEMENTO: TStringField;
    QExportaNF_Sinco434NAT_OPERACAO: TFloatField;
    QExportaNF_Sinco434NUM_GENERO_NCM: TStringField;
    QExportaNF_Sinco434QT_QUANTIDADE: TFloatField;
    QExportaNF_Sinco434DESC_UNIDADE: TStringField;
    QExportaNF_Sinco434VAL_UNITARIO: TFloatField;
    QExportaNF_Sinco434VAL_TOTAL: TFloatField;
    QExportaNF_Sinco434VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco434IND_IPI: TStringField;
    QExportaNF_Sinco434PERC_IPI: TFloatField;
    QExportaNF_Sinco434VAL_IPI: TFloatField;
    QExportaNF_Sinco434NUM_CLASSIFICACAO: TStringField;
    QExportaNF_Sinco434PERC_ALIQUOTA: TFloatField;
    QExportaNF_Sinco434DESC_SITUACAO_TRIB: TStringField;
    QExportaNF_Sinco434VAL_ICM_BASE: TFloatField;
    QExportaNF_Sinco434VAL_ICM: TFloatField;
    QExportaNF_Sinco434IND_ESTOQUE: TStringField;
    QExportaNF_Sinco434DESC_MODELO: TStringField;
    QExportaNF_Sinco435IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco435COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco435NUM_NOTA: TIntegerField;
    QExportaNF_Sinco435COD_SERIE: TStringField;
    QExportaNF_Sinco435DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco435COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco435DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco435IND_SITUACAO: TStringField;
    QExportaNF_Sinco435VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco435VAL_TOTAL_PRODUTOS: TFloatField;
    QExportaNF_Sinco435VAL_TOTAL: TFloatField;
    QExportaNF_Sinco435DESC_MODELO: TStringField;
    QExportaNF_Sinco436IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco436COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco436NUM_NOTA: TIntegerField;
    QExportaNF_Sinco436COD_SERIE: TStringField;
    QExportaNF_Sinco436DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco436COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco436DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco436COD_PRODUTO: TFloatField;
    QExportaNF_Sinco436DESC_PRODUTO: TStringField;
    QExportaNF_Sinco436VAL_TOTAL: TFloatField;
    QExportaNF_Sinco436VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco436PERC_INSS: TFloatField;
    QExportaNF_Sinco436VAL_ISS: TFloatField;
    QExportaNF_Sinco436DESC_MODELO: TStringField;
    QExportaNF_Sinco438IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco438COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco438NUM_NOTA: TIntegerField;
    QExportaNF_Sinco438COD_SERIE: TStringField;
    QExportaNF_Sinco438DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco438COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco438DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco438IND_SITUACAO: TStringField;
    QExportaNF_Sinco438VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco438VAL_TOTAL: TFloatField;
    QExportaNF_Sinco439IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco439COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco439NUM_NOTA: TIntegerField;
    QExportaNF_Sinco439COD_SERIE: TStringField;
    QExportaNF_Sinco439DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco439COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco439DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco439COD_PRODUTO: TFloatField;
    QExportaNF_Sinco439DESC_PRODUTO: TStringField;
    QExportaNF_Sinco439VAL_TOTAL: TFloatField;
    QExportaNF_Sinco439VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco439PERC_INSS: TFloatField;
    QExportaNF_Sinco439VAL_ISS: TFloatField;
    QExportaNF_Sinco439COD_NOTA_ITEM: TIntegerField;
    QExportaNF_Sinco4101DESC_MODELO: TStringField;
    QExportaNF_Sinco4101COD_SERIE: TStringField;
    QExportaNF_Sinco4101NUM_NOTA: TIntegerField;
    QExportaNF_Sinco4101DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco4101COD_NOTA_ITEM: TIntegerField;
    QExportaNF_Sinco4101COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco4102COD_SERIE: TStringField;
    QExportaNF_Sinco4102NUM_NOTA: TIntegerField;
    QExportaNF_Sinco4102DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco4102COD_NOTA_ITEM: TIntegerField;
    QExportaNF_Sinco4102COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco4104DESC_MODELO: TStringField;
    QExportaNF_Sinco4104COD_SERIE: TStringField;
    QExportaNF_Sinco4104NUM_NOTA: TIntegerField;
    QExportaNF_Sinco4104DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco4104COD_NOTA_ITEM: TIntegerField;
    QExportaNF_Sinco4104COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco4104PERC_PIS_EXP: TFloatField;
    QExportaNF_Sinco4104PERC_PIS_TRIB: TFloatField;
    QExportaNF_Sinco4104PERC_PIS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco4104PERC_COFINS_EXP: TFloatField;
    QExportaNF_Sinco4104PERC_COFINS_TRIB: TFloatField;
    QExportaNF_Sinco4104PERC_COFINS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco4105DESC_TIPO: TStringField;
    QExportaNF_Sinco4105DESC_MODELO: TStringField;
    QExportaNF_Sinco4105COD_SERIE: TStringField;
    QExportaNF_Sinco4105DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco4105COD_NOTA_ITEM: TFloatField;
    QExportaNF_Sinco4105PERC_PIS_EXP: TFloatField;
    QExportaNF_Sinco4105PERC_PIS_TRIB: TFloatField;
    QExportaNF_Sinco4105PERC_PIS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco4105PERC_COFINS_EXP: TFloatField;
    QExportaNF_Sinco4105PERC_COFINS_TRIB: TFloatField;
    QExportaNF_Sinco4105PERC_COFINS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco4106DESC_MODELO: TStringField;
    QExportaNF_Sinco4106COD_SERIE: TStringField;
    QExportaNF_Sinco4106NUM_NOTA: TIntegerField;
    QExportaNF_Sinco4106DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco4106COD_NOTA_ITEM: TIntegerField;
    QExportaNF_Sinco4106COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco4106COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco4106PERC_PIS_EXP: TFloatField;
    QExportaNF_Sinco4106PERC_PIS_TRIB: TFloatField;
    QExportaNF_Sinco4106PERC_PIS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco4106PERC_COFINS_EXP: TFloatField;
    QExportaNF_Sinco4106PERC_COFINS_TRIB: TFloatField;
    QExportaNF_Sinco4106PERC_COFINS_NAO_TRIB: TFloatField;
    QExportaNF_Sinco495COD_PRODUTO: TFloatField;
    QExportaNF_Sinco495DESC_PRODUTO: TStringField;
    QExportaNF_Sinco495DT_CADASTRO: TDateTimeField;
    QExportaNF_Sinco433val_total: TFloatField;
    QExportaNF_SincoIND_ENTRADA_SAIDA: TStringField;
    QExportaNF_SincoCOD_NOTA_CAB: TIntegerField;
    QExportaNF_SincoNUM_NOTA: TIntegerField;
    QExportaNF_SincoCOD_SERIE: TStringField;
    QExportaNF_SincoDT_EMISSAO: TDateTimeField;
    QExportaNF_SincoIND_CONDICAO_PAGTO: TStringField;
    QExportaNF_SincoCOD_CADASTRO: TIntegerField;
    QExportaNF_SincoDT_RECEBIMENTO: TDateTimeField;
    QExportaNF_SincoVAL_DESCONTO: TFloatField;
    QExportaNF_SincoSVAL_FRETE: TFloatField;
    QExportaNF_SincoSVAL_DESPESAS: TFloatField;
    QExportaNF_SincoSVAL_IPI: TFloatField;
    QExportaNF_SincoVAL_TOTAL_PRODUTOS: TFloatField;
    QExportaNF_SincoCOD_TRANSPORTADOR: TIntegerField;
    QExportaNF_SincoQT_VOLUMES: TFloatField;
    QExportaNF_SincoQT_PESO_BRUTO: TFloatField;
    QExportaNF_SincoQT_PESO_LIQUIDO: TFloatField;
    QExportaNF_SincoIND_TIPO_FRETE: TStringField;
    QExportaNF_SincoDESC_PLACA: TStringField;
    QExportaNF_SincoIND_SITUACAO: TStringField;
    QExportaNF_SincoIND_TIPO_PAGAMENTO: TStringField;
    QExportaNF_SincoOBS: TStringField;
    QExportaNF_SincoDESC_MODELO: TStringField;
    QExportaNF_SincoDESC_TIPO_TRANSPORTE: TStringField;
    QExportaNF_SincoDESC_OBS: TStringField;
    QExportaNF_Sinco433IND_ENTRADA_SAIDA: TStringField;
    QExportaNF_Sinco433COD_SERIE: TStringField;
    QExportaNF_Sinco433DT_EMISSAO: TDateTimeField;
    QExportaNF_Sinco433DT_RECEBIMENTO: TDateTimeField;
    QExportaNF_Sinco433VAL_DESCONTO: TFloatField;
    QExportaNF_Sinco433SVAL_FRETE: TFloatField;
    QExportaNF_Sinco433SVAL_DESPESAS: TFloatField;
    QExportaNF_Sinco433SVAL_IPI: TFloatField;
    QExportaNF_Sinco433IND_TIPO_PAGAMENTO: TStringField;
    QExportaNF_Sinco433DESC_MODELO: TStringField;
    QExportaNF_Sinco433VAL_TOTAL_PRODUTOS: TFloatField;
    QExportaNF_Sinco433DESC_OBS: TStringField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_VENDA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_VENDA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_COMPRA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_COMPRA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_VENDA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_VENDA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_IPI_DEV_COMPRA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_DEV_COMPRA_DEZEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_JANEIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_FEVEREIRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_MARCO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_ABRIL: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_MAIO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_JUNHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_JULHO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_AGOSTO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_SETEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_OUTUBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_NOVEMBRO: TFloatField;
    QRResumo_IPI_ICMSVAL_ICM_FRETE_DEZEMBRO: TFloatField;
    QRLivroFiscalArquivoDESC_MODELO: TStringField;
    QRLivroFiscalArquivoItensDESC_MODELO: TStringField;
    QREcfPeriodo: TOracleDataSet1;
    QREcfPeriodoDT_EMISSAO: TDateTimeField;
    QREcfPeriodoVAL_VENDA_BRUTA: TFloatField;
    QREcfPeriodoTOTAL: TFloatField;
    QRLivroFiscalArquivoIND_CONDICAO_PAGTO: TStringField;
    QRLivroFiscalArquivoDT_EMISSAO: TDateTimeField;
    QRLivroFiscalFinanceiro: TOracleDataSet1;
    QRLivroFiscalFinanceiroNUM_CGC_CPF: TStringField;
    QRLivroFiscalFinanceiroNUM_INSCRICAO: TStringField;
    QRLivroFiscalFinanceiroCOD_ESTADO: TStringField;
    QRLivroFiscalFinanceiroDT_EMISSAO: TDateTimeField;
    QRLivroFiscalFinanceiroDT_VENCIMENTO: TDateTimeField;
    QRLivroFiscalFinanceiroVAL_ORIGINAL: TFloatField;
    QRLivroFiscalFinanceiroNOSSO_NUMERO: TStringField;
    QRLivroFiscalFinanceiroIND_ENTRADA_SAIDA: TStringField;
    QRLivroFiscalArquivoCOD_CADASTRO: TFloatField;
    QREcfPeriodoVAL_DESC_CANC: TFloatField;
    QRCreditoPresumido: TOracleDataSet1;
    QRCreditoPresumidoCOD_FILIAL: TIntegerField;
    QRCreditoPresumidoCOD_ESTADO: TStringField;
    QRCreditoPresumidoDT_EMISSAO: TDateTimeField;
    QRCreditoPresumidoNUM_NOTA: TIntegerField;
    QRCreditoPresumidoCOD_SERIE: TStringField;
    QRCreditoPresumidoNOME: TStringField;
    QRCreditoPresumidoDESC_PRODUTO: TStringField;
    QRCreditoPresumidoVAL_ICM_BASE: TFloatField;
    QRCreditoPresumidoVAL_ICM: TFloatField;
    QRCreditoPresumidoSVAL_PRESUMIDO: TFloatField;
    QRCreditoPresumidoNUM_CGC: TStringField;
    QRCreditoPresumidoDESC_INSCRICAO: TStringField;
    QRCreditoPresumidoPERC_ALIQUOTA: TFloatField;
    QRCreditoPresumidoPERC_PRESUMIDO: TFloatField;
    QMestreAnalitico: TOracleDataSet1;
    QMestreAnaliticoMES: TStringField;
    QMestreAnaliticoANO: TStringField;
    QMestreAnaliticoVAL_MENSAL: TFloatField;
    QRLivroFiscalArquivo_R51: TOracleDataSet1;
    QRLivroFiscalArquivo_R51NUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivo_R51NUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivo_R51DT_RECEBIMENTO: TDateTimeField;
    QRLivroFiscalArquivo_R51DT_EMISSAO: TDateTimeField;
    QRLivroFiscalArquivo_R51UF_CLIENTE: TStringField;
    QRLivroFiscalArquivo_R51COD_SERIE: TStringField;
    QRLivroFiscalArquivo_R51NUM_NOTA: TIntegerField;
    QRLivroFiscalArquivo_R51NAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivo_R51IND_SITUACAO: TStringField;
    QRLivroFiscalArquivo_R51DESC_MODELO: TStringField;
    QRLivroFiscalArquivo_R51VAL_TOTAL: TFloatField;
    QRLivroFiscalArquivo_R51VAL_IPI: TFloatField;
    QRLivroFiscalArquivo_R51VAL_ISENTA_IPI: TFloatField;
    QRLivroFiscalArquivo_R51VAL_OUTRAS_IPI: TFloatField;
    QRLivroFiscalArquivo_R75NUM_GENERO_NCM: TStringField;
    QArquivoSapiens: TOracleDataSet1;
    QArquivoSapiensDESC_CHAVE_ACESSO: TStringField;
    QArquivoSapiensDT_AUTORIZACAO: TDateTimeField;
    QArquivoSapiensDESC_PROT_AUTORIZACAO: TStringField;
    QArquivoSapiensCOD_USUARIO: TFloatField;
    QArquivoSapiensDESC_PROT_CANCELAMENTO: TStringField;
    QArquivoSapiensDESC_PROT_INUTILIZACAO: TStringField;
    QArquivoSapiensDT_INUTILIZACAO: TDateTimeField;
    QArquivoSapiensCOD_USUARIO_INUTILIZACAO: TFloatField;
    QRLivroFiscalArquivo_R70DESC_MODELO: TStringField;
    QExportaNF_Sinco433COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco433NUM_NOTA: TIntegerField;
    QExportaNF_Sinco433COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco434COD_NOTA_CAB: TIntegerField;
    QExportaNF_Sinco434NUM_NOTA: TIntegerField;
    QExportaNF_Sinco434COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco434COD_OPERACAO: TIntegerField;
    QExportaNF_Sinco491COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco494COD_OPERACAO: TIntegerField;
    QExportaNF_Sinco4105NUM_NOTA: TIntegerField;
    QExportaNF_Sinco4105COD_CADASTRO: TIntegerField;
    QExportaNF_Sinco4105COD_NOTA_CAB: TIntegerField;
    QRLivroFiscalArquivo_R53: TOracleDataSet1;
    QRLivroFiscalArquivo_R53NUM_CGC_CPF: TStringField;
    QRLivroFiscalArquivo_R53NUM_INSCRICAO: TStringField;
    QRLivroFiscalArquivo_R53DT_RECEBIMENTO: TDateTimeField;
    QRLivroFiscalArquivo_R53DT_EMISSAO: TDateTimeField;
    QRLivroFiscalArquivo_R53UF_CLIENTE: TStringField;
    QRLivroFiscalArquivo_R53COD_SERIE: TStringField;
    QRLivroFiscalArquivo_R53NUM_NOTA: TIntegerField;
    QRLivroFiscalArquivo_R53NAT_OPERACAO: TFloatField;
    QRLivroFiscalArquivo_R53IND_SITUACAO: TStringField;
    QRLivroFiscalArquivo_R53DESC_MODELO: TStringField;
    QRLivroFiscalArquivo_R53VAL_BASE_SUBST: TFloatField;
    QRLivroFiscalArquivo_R53VAL_ICMS_SUBST: TFloatField;
    QRLivroFiscalArquivo_R53VAL_DESPESAS: TFloatField;
    QRLivroFiscalArquivo_R53IND_EMITE: TStringField;
    QRLivroFiscalArquivoIND_ENTRADA_SAIDA: TStringField;
    QRLivroFiscalArquivo_R51IND_ENTRADA_SAIDA: TStringField;
    QReducaoZCons: TOracleDataSet1;
    QReducaoZConsNUM_SERIE: TStringField;
    QReducaoZConsDT_REDUCAO: TDateTimeField;
    DSReducaoZCons: TDataSource;
    QReducaoZConsDESC_ARQUIVO: TMemoField;
    QReducaoZConsDESC_DADOS_REDUCAO: TMemoField;
    QReducaoZConsNUM_SEQ_IMPRESSORA: TIntegerField;
    QRLivroFiscalArquivo_R53IND_ENTRADA_SAIDA: TStringField;
    QTipo60MestreDESC_HASH_MD5: TStringField;
    QTipo60MestreDT_HORA_EMISSAO_RZ: TDateTimeField;
    QTipo60MestreNUM_USUARIO: TIntegerField;
    QTipo60MestreNUM_COO_RZ: TIntegerField;
    QTipo60MestreIND_DESCONTO_ISSQN: TStringField;
    QTipo60AnaliticoDESC_HASH_MD5: TStringField;
    QRNotasOperacaoResumoDESCONTO: TFloatField;
    QRNotasNaoAutorizadas: TOracleDataSet;
    QRNotasNaoAutorizadasDT_EMISSAO: TDateTimeField;
    QRNotasNaoAutorizadasCOD_CADASTRO: TIntegerField;
    QRNotasNaoAutorizadasNUM_NOTA: TIntegerField;
    QRNotasNaoAutorizadasNOME: TStringField;
    QRNotasNaoAutorizadasENTRADA_SAIDA: TStringField;
    QRTipo60Diario: TOracleDataSet1;
    QRTipo60DiarioCOD_REGISTRO_DIARIO: TIntegerField;
    QRTipo60DiarioDESC_SUBTIPO: TStringField;
    QRTipo60DiarioDT_EMISSAO: TDateTimeField;
    QRTipo60DiarioNUM_SERIE: TStringField;
    QRTipo60DiarioDESC_COD_BARRA: TStringField;
    QRTipo60DiarioQT_QUANTIDADE: TFloatField;
    QRTipo60DiarioVAL_TOTAL: TFloatField;
    QRTipo60DiarioVAL_BASE_ICMS: TFloatField;
    QRTipo60DiarioDESC_ST: TStringField;
    QRTipo60DiarioVAL_ICMS: TFloatField;
    QRNotasCfop_Csosn: TOracleDataSet1;
    QRNotasCfop_CsosnNAT_OPERACAO: TFloatField;
    QRNotasCfop_CsosnDESC_CSOSN: TStringField;
    QRNotasCfop_CsosnVAL_TOTAL: TFloatField;
    QRNotasCfop_CsosnPERC_CSOSN: TFloatField;
    QRLivroFiscalArquivo_R74DT_INVENTARIO: TDateTimeField;
    QResumoApuracaodesc_val_66: TStringField;
    QResumoApuracaodesc_val_67: TStringField;
    QRNotasCfopPagto: TOracleDataSet1;
    QRNotasCfopPagtoDT_EMISSAO: TDateTimeField;
    QRNotasCfopPagtoNAT_OPERACAO: TFloatField;
    QRNotasCfopPagtoSVAL_AVISTA: TFloatField;
    QRNotasCfopPagtoSVAL_APRAZO: TFloatField;
    QRNotasCfopPagtoSVAL_OUTROS: TFloatField;
    QRNotasCfopPagtoSVAL_TEF_CARTAO: TFloatField;
    QRNotasCfopPagtoSVAL_POS_CARTAO: TFloatField;
    QRNotasCfopPagtoIND_VENDAS: TStringField;
    QRPisCofinsTOTAL_NF_SAIDA: TFloatField;
    QRPisCofinsTOTAL_NF_ENTRADA: TFloatField;
    QRPisCofinsVAL_PIS_SAIDA: TFloatField;
    QRPisCofinsVAL_PIS_ENTRADA: TFloatField;
    QRPisCofinsVAL_COFINS_SAIDA: TFloatField;
    QRPisCofinsVAL_COFINS_ENTRADA: TFloatField;
    procedure QLctoAfterPost(DataSet: TDataSet);
    procedure QLctoAfterInsert(DataSet: TDataSet);
    procedure QResumoApuracaoCalcFields(DataSet: TDataSet);
    procedure QLctoBeforeEdit(DataSet: TDataSet);
    procedure QLctoBeforeDelete(DataSet: TDataSet);
    procedure QLctoBeforeInsert(DataSet: TDataSet);
    procedure QLivroFiscalBeforeInsert(DataSet: TDataSet);
    procedure QLivroFiscalBeforeEdit(DataSet: TDataSet);
    procedure QLivroFiscalAfterCancel(DataSet: TDataSet);
    procedure QLivroFiscalAfterPost(DataSet: TDataSet);
    procedure QRLivroFiscalArquivoCalcFields(DataSet: TDataSet);
    procedure QRNotasOperacaoCalcFields(DataSet: TDataSet);
    procedure QRNFSaida_Devolucao_PeriodoCalcFields(DataSet: TDataSet);
    procedure QRNotasImpostoCalcFields(DataSet: TDataSet);
    procedure QRNotasOperacao2CalcFields(DataSet: TDataSet);
    procedure QLivroFiscalCalcFields(DataSet: TDataSet);
    procedure QRLivroFiscalArquivoItensCalcFields(DataSet: TDataSet);
    procedure QTipo60AnaliticoBeforePost(DataSet: TDataSet);
    procedure QTipo60AnaliticoAfterInsert(DataSet: TDataSet);
    procedure QTipo60AnaliticoAfterPost(DataSet: TDataSet);
    procedure QTipo60AnaliticoBeforeDelete(DataSet: TDataSet);
    procedure QTipo60AnaliticoBeforeEdit(DataSet: TDataSet);
    procedure QTipo60AnaliticoBeforeInsert(DataSet: TDataSet);
    procedure QExportaNF_SincoCalcFields(DataSet: TDataSet);
    procedure QExportaNF_Sinco433CalcFields(DataSet: TDataSet);
    procedure QTipo60MestreAfterInsert(DataSet: TDataSet);
    procedure QTipo60ResumoBeforePost(DataSet: TDataSet);
    procedure QTipo60MestreBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SetaRegistro(wFilial,wAno,wMes:Integer);
    Procedure CalculaApuracao;
  end;

var
  DMLivroFiscal: TDMLivroFiscal;

implementation

uses URegEntrada_cl, UOracle_cl, UParamSistema_cl,UBiblioteca;

{$R *.DFM}

{ TDMLivroFiscal }

procedure TDMLivroFiscal.SetaRegistro(wFilial, wAno, wMes: Integer);
begin
  QLivroFiscal.Close;
  QLivroFiscal.SetVariable('FILIAL',wFilial);
  QLivroFiscal.SetVariable('ANO',wAno);
  QLivroFiscal.SetVariable('MES',wMes);
  QLivroFiscal.Open;
  if QLivroFiscalCod_Filial.Value = 0 Then
  begin
    QLivroFiscal.Insert;
    QLivroFiscalCod_Filial.Value := wFilial;
    QLivroFiscalNum_Ano.Value := wAno;
    QLivroFiscalNum_Mes.Value := wMes;
  end;
  QLcto.Open;
end;

procedure TDMLivroFiscal.CalculaApuracao;
Var wDataI, wDataF : String;
    wUltDia : Integer;
    wValorCreditado, wValorDebitado : Real;
begin
  wDataI := '01/'+FormatFloat('00',QLivroFiscalNum_Mes.Value)+'/'+FormatFloat('0000',QLivroFiscalNum_Ano.Value);
  wUltDia := DMOracle.DiasNoMes(StrToDate(wDataI));
  wDataF := FormatFloat('00',wUltDia)+'/'+FormatFloat('00',QLivroFiscalNum_Mes.Value)+'/'+FormatFloat('0000',QLivroFiscalNum_Ano.Value);
  With DMRegEntrada do
  Begin
    QApuracaoE.Close;
    QApuracaoE.SetVariable('FILIAL',QLivroFiscalCod_Filial.Value);
    QApuracaoE.SetVariable('DATA_I',wDataI);
    QApuracaoE.SetVariable('DATA_F',wDataF);
    QApuracaoE.SetVariable('NAT_OPERACAO',Null);
    QApuracaoE.Open;
    wValorCreditado := 0;
    While not QApuracaoE.Eof do
    Begin
      wValorCreditado := wValorCreditado+QApuracaoEVal_ICM.Value;
      QApuracaoE.Next;
    End;
    QApuracaoS.Close;
    QApuracaoS.SetVariable('FILIAL',QLivroFiscalCod_Filial.Value);
    QApuracaoS.SetVariable('DATA_I',StrToDate(wDataI));
    QApuracaoS.SetVariable('DATA_F',StrToDate(wDataF));
    QApuracaoS.SetVariable('NAT_OPERACAO',Null);
    QApuracaoS.Open;
    wValorDebitado := 0;
    While not QApuracaoS.Eof do
    Begin
      wValorDebitado := wValorDebitado+QApuracaoSVal_ICM.Value;
      QApuracaoS.Next;
    End;
  End;
  QLivroFiscal.Edit;
  QLivroFiscalVal_CR_ICM.Value := wValorCreditado;
  QLivroFiscalVal_DB_ICM.Value := wValorDebitado;
end;

procedure TDMLivroFiscal.QLctoAfterPost(DataSet: TDataSet);
begin
  QLcto.Close;
  QLcto.Open;
end;

procedure TDMLivroFiscal.QLctoAfterInsert(DataSet: TDataSet);
begin
  //QLctoCod_Livro_Lcto.Value := DMOracle.Sequencia('LIVRO_LCTO');
  QLctoCod_Filial.Value     := QLivroFiscalCod_Filial.Value;
  QLctoNum_Ano.Value        := QLivroFiscalNum_Ano.Value;
  QLctoNum_Mes.Value        := QLivroFiscalNum_Mes.Value;

  if not (QLivroFiscal.State in [dsEdit, dsInsert]) then
  begin
    QLcto.cancel;
    raise Exception.Create('Não está em modo de edição');
  end;
end;

procedure TDMLivroFiscal.QResumoApuracaoCalcFields(DataSet: TDataSet);
var wSoma : String;
begin
  // Calculo do Valor
  QResumoApuracaoValor.Value := QResumoApuracaoValor_Temp.Value;
{  if QResumoApuracaoCod_Operacao.Value <> 8 Then
   begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL        ='+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO     ='+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES     ='+QResumoApuracaoNum_Mes.Text
                   +' AND COD_OPERACAO='+QResumoApuracaoCod_Operacao.Text);
   end
  else
   begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND ( COD_OPERACAO  = 006 OR COD_OPERACAO = 007)');
   end;
}
  if QResumoApuracaoNUM_GIA.Value <> -8 Then
  begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL    ='   + QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO ='   + QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES ='   + QResumoApuracaoNum_Mes.Text
                   +' AND COD_GIA = 0' + QResumoApuracaoNUM_GIA.Text); //CONCATENA O ZERO COM O VALOR RETORNADO, PARA EVITAR ERRO CASO O NUM_GIA ESTEJA VAZIO
  end
  else
  begin
    wSoma := DMOracle.BuscaNome('SELECT SUM(VAL_IMPOSTO) FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND ( COD_GIA  =  62 OR COD_GIA  =  63 OR COD_GIA = 64 OR COD_GIA  =  65 OR COD_GIA  =  66 OR COD_GIA  =  67 OR COD_GIA  =  68 OR COD_GIA  =  69)');
  end;

  if Trim(wSoma) <> '' Then
     QResumoApuracaoValor.Value := QResumoApuracaoValor.Value + StrToFloat(wSoma);


  if QResumoApuracaoNUM_GIA.Value = 55 then
    QResumoApuracaodesc_val_55.Value := DMOracle.BuscaNome('SELECT DESC_GIA FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND COD_GIA = 55');

    if QResumoApuracaoNUM_GIA.Value = 65 then
    QResumoApuracaodesc_val_65.Value := DMOracle.BuscaNome('SELECT DESC_GIA FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND COD_GIA = 65');

    if QResumoApuracaoNUM_GIA.Value = 66 then
    QResumoApuracaodesc_val_66.Value := DMOracle.BuscaNome('SELECT DESC_GIA FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   +' AND COD_GIA = 66');

    if QResumoApuracaoNUM_GIA.Value = 67 then
    QResumoApuracaodesc_val_67.Value := DMOracle.BuscaNome('SELECT DESC_GIA FROM TB_LIVRO_LCTO',
                   'COD_FILIAL = '+QResumoApuracaoCod_Filial.Text
                   +' AND NUM_ANO = '+QResumoApuracaoNum_Ano.Text
                   +' AND NUM_MES = '+QResumoApuracaoNum_Mes.Text
                   
                   +' AND COD_GIA = 67');
end;

procedure TDMLivroFiscal.QLctoBeforeEdit(DataSet: TDataSet);
begin
//  if QLivroFiscal.State <> dsEdit Then
//     raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLctoBeforeDelete(DataSet: TDataSet);
begin
//  If QLivroFiscal.State <> dsEdit Then
//    Raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLctoBeforeInsert(DataSet: TDataSet);
begin
  if QLivroFiscal.State = dsInsert Then
  begin
    QLivroFiscal.Post;
    QLivroFiscal.Edit;
  end;
 // if QLivroFiscal.State <> dsEdit Then
 //    raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QLivroFiscalBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMLivroFiscal.QLivroFiscalBeforeEdit(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMLivroFiscal.QLivroFiscalAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QLivroFiscal.Close;
  QLivroFiscal.Open;
end;

procedure TDMLivroFiscal.QLivroFiscalAfterPost(DataSet: TDataSet);
var
  wFilial, wAno, wMes : integer;
begin
  wFilial := QLivroFiscalCod_Filial.Value;
  wAno    := QLivroFiscalNum_Ano.Value;
  wMes    := QLivroFiscalNum_Mes.Value;
  QLivroFiscal.Close;
  QLivroFiscal.SetVariable('FILIAL',wFilial);
  QLivroFiscal.SetVariable('ANO',wAno);
  QLivroFiscal.SetVariable('MES',wMes);
  QLivroFiscal.Open;
end;

procedure TDMLivroFiscal.QRLivroFiscalArquivoCalcFields(DataSet: TDataSet);
begin
  // QRLivroFiscalArquivoVAL_ISENTAS.Value := (QRLivroFiscalArquivoVal_Total.Value - QRLivroFiscalArquivoVal_Icm_Base.Value);
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART')) And
     (QRLivroFiscalArquivoVal_Icm_Base_1.Value > 0)  Then
   Begin
     QRLivroFiscalArquivoVal_Base_Outras.Value := QRLivroFiscalArquivoVal_Base_Outras_1.Value + QRLivroFiscalArquivoVal_Icm_Base_1.Value;
     QRLivroFiscalArquivoVal_Icm_Base.Value := 0;
     QRLivroFiscalArquivoVal_Icm.Value := 0;
     QRLivroFiscalArquivoPerc_Aliquota.Value := 0;
   End
  Else
   Begin
     QRLivroFiscalArquivoVal_Base_Outras.Value := QRLivroFiscalArquivoVal_Base_Outras_1.Value;
     QRLivroFiscalArquivoVal_Icm_Base.Value := QRLivroFiscalArquivoVal_Icm_Base_1.Value;
     QRLivroFiscalArquivoVal_Icm.Value := QRLivroFiscalArquivoVal_Icm_1.Value;
     QRLivroFiscalArquivoPerc_Aliquota.Value := QRLivroFiscalArquivoPerc_Aliquota_1.Value;
   End
end;

procedure TDMLivroFiscal.QRNotasOperacaoCalcFields(DataSet: TDataSet);
var wFunrural, wDPI: String;
begin
  QRNotasOperacaosVal_Funrural.Value := 0;
  if QRNotasOperacaoDESC_VALOR.Value = '' Then
  begin
    wFunrural := DmOracle.BuscaNome('SELECT VAL_FUNRURAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacaoCod_Nota_Cab.Value));
    if wFunrural <> ''  Then
      QRNotasOperacaosVal_Funrural.Value := StrToFloat(wFunrural);
  end;

  QRNotasOperacaosVal_Dpi.Value := 0;
  if (QRNotasOperacaoDESC_VALOR.Value = '') then
  begin
    wDPI := DMOracle.BuscaNome('SELECT VAL_DPI_TRANSGENICOS FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacaoCOD_NOTA_CAB.Value));
    if wDPI <> '' then
      QRNotasOperacaosVal_Dpi.Value := StrToFloat(wDPI);
  end;

end;

procedure TDMLivroFiscal.QRNFSaida_Devolucao_PeriodoCalcFields(
  DataSet: TDataSet);
begin
  if QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM.Value = 0 then
     QRNFSaida_Devolucao_Periodototal_isento.Value:= QRNFSaida_Devolucao_PeriodoT_VENDA.Value
  else
     QRNFSaida_Devolucao_Periodototal_isento.Value:= QRNFSaida_Devolucao_PeriodoT_VENDA.Value-
                                                     QRNFSaida_Devolucao_PeriodoVAL_BASE_ICM.Value;
end;

procedure TDMLivroFiscal.QRNotasImpostoCalcFields(DataSet: TDataSet);
begin
  If QRNotasImpostoInd_Condicao_Pagto.Value = '2' Then
     QRNotasImpostoDesc_Pagto.Value := 'A Prazo'
  Else
     QRNotasImpostoDesc_Pagto.Value := 'A Vista';
end;

procedure TDMLivroFiscal.QRNotasOperacao2CalcFields(DataSet: TDataSet);
var wFunrural, wDPI: String;
begin
//  QRNotasOperacao2sVal_Funrural.Value := 0;
//  if QRNotasOperacao2DESC_VALOR.Value <> 'Funrural' Then
//  begin
//    wFunrural := DmOracle.BuscaNome('SELECT VAL_FUNRURAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacao2Cod_Nota_Cab.Value));
//    if wFunrural <> ''  Then
//       QRNotasOperacao2sVal_Funrural.Value := StrToFloat(wFunrural);
//  end;

  QRNotasOperacao2sVal_Funrural.Value := 0;
  if QRNotasOperacao2DESC_VALOR.Value = '' Then
  begin
    wFunrural := DmOracle.BuscaNome('SELECT VAL_FUNRURAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacao2Cod_Nota_Cab.Value));
    if wFunrural <> ''  Then
       QRNotasOperacao2sVal_Funrural.Value := StrToFloat(wFunrural);
  end;
  QRNotasOperacao2sval_dpi.Value := 0;
  if QRNotasOperacao2DESC_VALOR.Value = '' Then
  begin
    wDPI := DmOracle.BuscaNome('SELECT VAL_DPI_TRANSGENICOS FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + FloatToStr(QRNotasOperacao2Cod_Nota_Cab.Value));
    if wDPI <> ''  Then
       QRNotasOperacao2sval_dpi.Value := StrToFloat(wDPI);
  end;
end;

procedure TDMLivroFiscal.QLivroFiscalCalcFields(DataSet: TDataSet);
begin
  // estes totais sao para o quadro 81 do livro de SC
  QLivroFiscalVal_Circulante.Value := QLivroFiscalVal_Disponibilidades.Value +
       QLivroFiscalVal_Conta_Receber_Circulante.Value + QLivroFiscalVal_Estoque.Value +
       QLivroFiscalVal_Outros_Estoque.Value;
  QLivroFiscalVal_Realizavel_Longo_Prazo.Value := QLivroFiscalVal_Conta_Receber_Realizavel.Value +
       QLivroFiscalVal_Outros_Contas_Realizavel.Value;
  QLivroFiscalVal_Permanente.Value := QLivroFiscalVal_Investimentos.Value +
       QLivroFiscalVal_Imobilizado.Value + QLivroFiscalVal_Diferido.Value;
  // estes totais sao para o quadro 82 do livro de SC
  QLivroFiscalVal_Circulante_Passivo.Value := QLivroFiscalVal_Fornecedores.Value +
       QLivroFiscalVal_Emprestimos_Financiamentos.Value + QLivroFiscalVal_Outras_Contas_Passivo.Value;
  QLivroFiscalVal_Patrimonio_Liquido.Value := QLivroFiscalVal_Capital_Social.Value +
       QLivroFiscalVal_Outras_Contas_Patr_Liquido.Value + QLivroFiscalVal_Outras_Cont_Patr_Liq_Neg.Value;
  // Até Aqui
end;

procedure TDMLivroFiscal.QRLivroFiscalArquivoItensCalcFields(
  DataSet: TDataSet);
begin
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART')) And
     (QRLivroFiscalArquivoItensVal_Icm_Base_1.Value > 0)  Then
   Begin
     QRLivroFiscalArquivoItensVal_Icm_Base.Value := 0;
     QRLivroFiscalArquivoItensPerc_Aliquota.Value := 0;
   End
  Else
   Begin
     QRLivroFiscalArquivoItensVal_Icm_Base.Value := QRLivroFiscalArquivoItensVal_Icm_Base_1.Value;
     QRLivroFiscalArquivoItensPerc_Aliquota.Value := QRLivroFiscalArquivoItensPerc_Aliquota_1.Value;
   End
end;

procedure TDMLivroFiscal.QTipo60AnaliticoBeforePost(DataSet: TDataSet);
begin
  QTipo60AnaliticoCOD_REGISTRO_MESTRE.Value := QTipo60MestreCOD_REGISTRO_MESTRE.Value;
  QTipo60AnaliticoDESC_SERIE.Value := QTipo60MestreDESC_SERIE.Value;
  QTipo60AnaliticoDT_EMISSAO.Value := QTipo60MestreDT_EMISSAO.Value;
  QTipo60AnaliticoDESC_HASH_MD5.Value :=
    bib.GetHashStringMD5(
      QTipo60AnaliticoDESC_SERIE.Value+
      QTipo60AnaliticoIND_SITUACAO_TRIBUTARIA.Value+
      QTipo60AnaliticoVLR_ACUMULADO_TOTAL_PARCIAL.Text+
      QTipo60MestreNUM_CONTADOR_REDUCAOZ.Text
    );
end;

procedure TDMLivroFiscal.QTipo60AnaliticoAfterInsert(DataSet: TDataSet);
begin
  if not (QTipo60Mestre.State in [dsEdit, dsInsert]) then
  begin
    QTipo60Analitico.cancel;
    raise Exception.Create('Não está em modo de edição');
  end;
end;

procedure TDMLivroFiscal.QTipo60AnaliticoAfterPost(DataSet: TDataSet);
begin
//  QTipo60Analitico.Close;
//  QTipo60Analitico.Open;
end;

procedure TDMLivroFiscal.QTipo60AnaliticoBeforeDelete(DataSet: TDataSet);
begin
  If QTipo60Mestre.State <> dsEdit Then
    Raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QTipo60AnaliticoBeforeEdit(DataSet: TDataSet);
begin
  If QTipo60Mestre.State <> dsEdit Then
    Raise Exception.Create('Não estão no modo de Alteração!');
end;

procedure TDMLivroFiscal.QTipo60AnaliticoBeforeInsert(DataSet: TDataSet);
begin
  if QTipo60Mestre.State = dsInsert Then
  begin
    QTipo60Mestre.Post;
    QTipo60Mestre.Edit;
  end;
end;

procedure TDMLivroFiscal.QExportaNF_SincoCalcFields(DataSet: TDataSet);
begin
  QExportaNF_Sincoval_total.Value := QExportaNF_SincoVAL_TOTAL_PRODUTOS.Value - QExportaNF_SincoVAL_DESCONTO.Value + QExportaNF_SincoSVAL_FRETE.Value + QExportaNF_SincoSVAL_DESPESAS.Value + QExportaNF_SincoSVAL_IPI.Value;
end;

procedure TDMLivroFiscal.QExportaNF_Sinco433CalcFields(DataSet: TDataSet);
begin
  QExportaNF_Sinco433val_total.Value := QExportaNF_Sinco433VAL_TOTAL_PRODUTOS.Value - QExportaNF_Sinco433VAL_DESCONTO.Value + QExportaNF_Sinco433SVAL_FRETE.Value + QExportaNF_Sinco433SVAL_DESPESAS.Value + QExportaNF_Sinco433SVAL_IPI.Value;
end;

procedure TDMLivroFiscal.QTipo60MestreAfterInsert(DataSet: TDataSet);
begin
  QTipo60MestreNum_Sequencial.Value := 1;
  QTipo60MestreDesc_Modelo.Value := '33';
end;

procedure TDMLivroFiscal.QTipo60ResumoBeforePost(DataSet: TDataSet);
Var wTributacao : String;
begin
  if DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Text = '' then
  begin
    wTributacao := DmOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DMLivroFiscal.QTipo60ResumoCOD_PRODUTO.Text);
    DMLivroFiscal.QTipo60ResumoIND_SITUACAO_TRIBUTARIA.Value := DmOracle.BuscaNome('SELECT COD_TRIB_IMP_FISCAL FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + wTributacao);
  end;
end;

procedure TDMLivroFiscal.QTipo60MestreBeforePost(DataSet: TDataSet);
begin
  QTipo60MestreDT_EMISSAO.Text :=
    FormatDateTime('DD/MM/YYYY', QTipo60MestreDT_HORA_EMISSAO_RZ.Value);
  QTipo60MestreDESC_HASH_MD5.Value :=
    bib.GetHashStringMD5(
      QTipo60MestreDESC_SERIE.Value+
      QTipo60MestreNUM_CONTADOR_REDUCAOZ.Text+
      QTipo60MestreNUM_REINICIO_OPRERACAO.Text+
      QTipo60MestreNUM_COO_INI.Text+
      QTipo60MestreNUM_COO_FIN.Text+
      QTipo60MestreDT_EMISSAO.Text+
      QTipo60MestreDT_HORA_EMISSAO_RZ.Text+
      QTipo60MestreVAL_VENDA_BRUTA.Text
    );
end;

end.
