unit UNfe_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UBiblioteca, Variants, Forms, Controls, Dialogs, UOracle_cl,
  Oracle, OraS, Nfe, Cte, CteOS, Rps, DeclaracaoPrestacaoServico, Mdfe, UAguardoBloqueado, NFeRPCRetorno, NfeCliente, DBClient,
  Provider, DateUtils, Windows, ACBrDFeUtil, NfseNacional;

type

  TExecucoesList = class; 
  TDMNfe = class(TDataModule)
    QNfeCons: TOracleDataSet1;
    QNfeConsDESC_CHAVE_ACESSO: TStringField;
    QNfeConsDT_NF_ELETRONICA_CONS: TDateTimeField;
    QNfeConsNUM_CONT: TIntegerField;
    QNfeConsdesc_msg_retorno: TStringField;
    QNfeConsind_aprovado: TBooleanField;
    QNfeConsCOD_FILIAL: TIntegerField;
    QNfeConsDESC_SERIE: TStringField;
    QNfeConsNUM_NF_ELETRONICA: TIntegerField;
    QNfeConsSIT_NFE: TStringField;
    QNfeConsSIT_CANC: TStringField;
    QNfeConsdesc_msg_canc: TStringField;
    QNfe: TOracleDataSet1;
    QNfeDESC_CHAVE_ACESSO: TStringField;
    QNfeSIT_NFE: TStringField;
    QNfeSIT_CANC: TStringField;
    QNfeCOD_FILIAL: TIntegerField;
    QNfeDESC_SERIE: TStringField;
    QNfeNUM_NF_ELETRONICA: TIntegerField;
    QNfeConsDESC_MSG_VALIDACAO: TMemoField;
    QNfeConsDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QNfeConsdesc_validacao: TStringField;
    QInutilizacaoCons: TOracleDataSet1;
    QInutilizacaoConsDESC_CNPJ: TStringField;
    QInutilizacaoConsIND_AMBIENTE: TIntegerField;
    QInutilizacaoConsDESC_PROTOCOLO: TStringField;
    QInutilizacaoConsDESC_NUM_INI: TStringField;
    QInutilizacaoConsDESC_NUM_FIM: TStringField;
    QInutilizacaoConsDESC_UF: TStringField;
    QInutilizacaoConsCOD_SERIE: TStringField;
    QInutilizacaoConsDESC_ANO: TStringField;
    QInutilizacaoConsDESC_STATUS: TStringField;
    QInutilizacaoConsDESC_SITUACAO: TStringField;
    QInutilizacaoConsFILIAL: TStringField;
    QInutilizacaoConsDESC_MOTIVO: TStringField;
    QNfeConfig: TOracleDataSet1;
    QNfeConfigDESC_SERVIDOR: TStringField;
    QNfeConfigNUM_MAX_BUFFER: TIntegerField;
    QNfeConfigDESC_PASTA_CANCELAMENTO: TStringField;
    QNfeConfigDESC_PASTA_INUTILIZACAO: TStringField;
    QNfeConfigDESC_PASTA_STATUS: TStringField;
    QNfeConfigDESC_PASTA_CONSULTA_PROT: TStringField;
    QNfeConfigDESC_PASTA_COPIA_DANFE: TStringField;
    QNfeConfigDESC_PASTA_EMAIL: TStringField;
    QNfeConfigDESC_CERTIFICADO: TStringField;
    QNfeConfigDESC_LOGO: TStringField;
    QNfeConfigDESC_SERVIDOR_IMPRESSAO: TStringField;
    QNfeConfigNUM_INTERVALO: TIntegerField;
    QNfeConfigNUM_MAX_CONSULTA_NFE: TIntegerField;
    QNfeConfigDESC_EMAIL: TStringField;
    QNfeConfigDESC_SENHA_EMAIL: TStringField;
    QNfeConfigNUM_PORTA_SMTP: TIntegerField;
    QNfeConfigDESC_ENDERECO_SMTP: TStringField;
    QNfeind_aprovado: TBooleanField;
    QNfeind_cancelado: TBooleanField;
    QNfeind_denegado: TBooleanField;
    QNfeConsEntr: TOracleDataSet1;
    QNfeConsEntrDESC_CHAVE_ACESSO: TStringField;
    QNfeConsEntrDESC_RETORNO_PROCESSAMENTO: TStringField;
    QNfeConsEntrDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QNfeConsEntrind_aprovado: TBooleanField;
    QNfeConsEntrind_cancelado: TBooleanField;
    QNfeConsEntrind_denegado: TBooleanField;
    QNfeEmail: TOracleDataSet1;
    QNfeEmailDESC_CHAVE_ACESSO: TStringField;
    QNfeEmailTP_ENVIO: TStringField;
    QNfeConfigIND_EMAIL_AUTOMATICO: TStringField;
    QNfeDESC_XML_NFE: TMemoField;
    QNfeStatusServico: TOracleDataSet1;
    QNfeStatusServicoCOD_ESTADO: TIntegerField;
    QNfeStatusServicoIND_AMBIENTE: TIntegerField;
    QNfeStatusServicoCOD_STATUS: TIntegerField;
    QNfeStatusServicoDESC_MOTIVO: TMemoField;
    QNfeStatusServicoDT_STATUS: TDateTimeField;
    QNfeStatusServicomotivo: TStringField;
    QAux: TOracleDataSet1;
    DBNfeEmail: TOraS;
    QGeraNfe: TOracleDataSet1;
    QGeraNfeItem: TOracleDataSet1;
    QGeraNfeCOD_FILIAL: TIntegerField;
    QGeraNfeNOME_FILIAL: TStringField;
    QGeraNfeENDERECO_FILIAL: TStringField;
    QGeraNfeCIDADE_FILIAL: TStringField;
    QGeraNfeTELEFONE_FILIAL: TStringField;
    QGeraNfeCEP_FILIAL: TStringField;
    QGeraNfeUF_FILIAL: TStringField;
    QGeraNfeCPF_CNPJ_FILIAL: TStringField;
    d: TIntegerField;
    QGeraNfeBAIRRO_FILIAL: TStringField;
    QGeraNfeNUM_ENDERECO_FILIAL: TIntegerField;
    QGeraNfeCOMPLEMENTO_FILIAL: TStringField;
    QGeraNfeNUM_VIAS_DANFE: TIntegerField;
    QGeraNfeIND_VIAS_DANFE: TStringField;
    QGeraNfeIND_CONTINGENCIA: TStringField;
    QGeraNfeIND_AMBIENTE_NFE: TIntegerField;
    QGeraNfeDESC_CERTIFICADO: TStringField;
    QGeraNfeDESC_LOGOTIPO_DANFE: TStringField;
    QGeraNfeCOD_NOTA_CAB: TIntegerField;
    QGeraNfeCOD_NOTA_CAB_REF: TIntegerField;
    QGeraNfeCOD_CADASTRO: TIntegerField;
    QGeraNfeCOD_MOTIVO_CANC: TIntegerField;
    QGeraNfeVAL_FRETE: TFloatField;
    QGeraNfeVAL_DESCONTO: TFloatField;
    QGeraNfeVAL_FUNRURAL: TFloatField;
    QGeraNfeIND_TIPO_FRETE: TStringField;
    QGeraNfeIND_ENTRADA_SAIDA: TStringField;
    QGeraNfeIND_SITUACAO: TStringField;
    QGeraNfeIND_CONDICAO_PAGTO: TStringField;
    QGeraNfeNUM_NOTA: TIntegerField;
    QGeraNfeDT_EMISSAO: TDateTimeField;
    QGeraNfeDT_RECEBIMENTO: TDateTimeField;
    QGeraNfeUF_NOTA: TStringField;
    QGeraNfeVAL_DESPESAS: TFloatField;
    QGeraNfeDESC_PLACA: TStringField;
    QGeraNfeNUM_VOLUMES: TIntegerField;
    QGeraNfeDESC_TRANSPORTADORA: TStringField;
    QGeraNfeVAL_AVISTA: TFloatField;
    QGeraNfeCOD_MOTORISTA: TIntegerField;
    QGeraNfeIND_IMPRIME_FRETE: TStringField;
    QGeraNfeVAL_IMPOSTO: TFloatField;
    QGeraNfeVAL_DESCONTO_FITAS: TFloatField;
    QGeraNfeNUM_PEDIDO: TIntegerField;
    QGeraNfeIND_IMPRIME_CAB: TStringField;
    QGeraNfeCOD_CADASTRO_PARCEIRO: TIntegerField;
    QGeraNfeCOD_SERIE: TStringField;
    QGeraNfeDESC_MARCA: TStringField;
    QGeraNfeDESC_ESPECIE: TStringField;
    QGeraNfeDESC_CHAVE_ACESSO: TStringField;
    QGeraNfeCOD_NOTA_CAB_DEV_FIXAR: TIntegerField;
    QGeraNfeNUM_CONHECIMENTO_FRETE: TIntegerField;
    QGeraNfeVAL_SENAR: TFloatField;
    QGeraNfeNOME_CADASTRO: TStringField;
    QGeraNfeINSCRICAO_CADASTRO: TStringField;
    QGeraNfeUF_CADASTRO: TStringField;
    QGeraNfeCPF_CNPJ_CADASTRO: TStringField;
    QGeraNfeCIDADE_CADASTRO: TStringField;
    QGeraNfeCOMPLEMENTO_CADASTRO: TStringField;
    QGeraNfeTELEFONE_CADASTRO: TStringField;
    QGeraNfeCELULAR_CADASTRO: TStringField;
    QGeraNfeFANTASIA_CADASTRO: TStringField;
    QGeraNfeIND_FISICA_JURIDICA: TStringField;
    QGeraNfeCEP_CADASTRO: TStringField;
    QGeraNfeENDERECO_ENTREGA_CADASTRO: TStringField;
    QGeraNfeCIDADE_ENTREGA_CADASTRO: TStringField;
    QGeraNfeINSCRICAO_MUN_CADASTRO: TStringField;
    QGeraNfeNOME_VENDEDOR: TStringField;
    QGeraNfeCELULAR_VENDEDOR: TStringField;
    QGeraNfeCOD_UF_IBGE_FILIAL: TIntegerField;
    QGeraNfeCOD_UF_IBGE_CADASTRO: TIntegerField;
    QGeraNfeCOD_CIDADE_IBGE_FILIAL: TStringField;
    QGeraNfeCOD_CIDADE_IBGE_CADASTRO: TStringField;
    QGeraNfePAIS_CADASTRO: TStringField;
    QGeraNfePAIS_FILIAL: TStringField;
    QGeraNfeCOD_PAIS_IBGE_CADASTRO: TIntegerField;
    QGeraNfeCOD_PAIS_IBGE_FILIAL: TFloatField;
    QGeraNfeEMAIL_FILIAL: TStringField;
    QGeraNfeCOD_UF_IBGE_NOTA: TIntegerField;
    QNfeEmissao: TOracleDataSet1;
    QNfeEmissaoDESC_MODELO: TStringField;
    QNfeEmissaoIND_EMITE: TStringField;
    QNfeEmissaoCOD_UF_IBGE: TIntegerField;
    QNfeEmissaoNUM_CGC: TStringField;
    QNfeEmissaoIND_CONTINGENCIA: TStringField;
    QNfeEmissaoDESC_CHAVE_ACESSO: TStringField;
    QNfeEmissaoDT_EMISSAO: TDateTimeField;
    QNfeEmissaoCOD_SERIE: TStringField;
    QNfeEmissaoNUM_NOTA: TIntegerField;
    QGeraNfeIND_FINALIDADE_NFE: TIntegerField;
    QGeraNfeDESC_MODELO: TStringField;
    QGeraNfeIND_CONTINGENCIA_FILIAL: TStringField;
    QGeraNfeIND_AMBIENTE_NFE_FILIAL: TIntegerField;
    QGeraNfeItemDESC_PRODUTO: TStringField;
    QGeraNfeItemDESC_UNIDADE: TStringField;
    QGeraNfeItemIND_TIPO_PRODUTO: TStringField;
    QGeraNfeItemCOD_EX_TIPI: TStringField;
    QGeraNfeItemNUM_GENERO_NCM: TStringField;
    QGeraNfeItemCOD_NOTA_ITEM: TIntegerField;
    QGeraNfeItemQT_QUANTIDADE: TFloatField;
    QGeraNfeItemVAL_UNITARIO: TFloatField;
    QGeraNfeItemVAL_TOTAL: TFloatField;
    QGeraNfeItemVAL_DESCONTO: TFloatField;
    QGeraNfeItemVAL_FRETE: TFloatField;
    QGeraNfeItemCOD_CFOP: TIntegerField;
    QGeraNfeItemNUM_CGC_CPF_FAB: TStringField;
    QGeraNfeItemCOD_CADASTRO_FAB: TIntegerField;
    QGeraNfeItemVAL_IPI: TFloatField;
    QGeraNfeItemVAL_ICM_BASE: TFloatField;
    QGeraNfeItemVAL_ICM: TFloatField;
    QGeraNfeItemVAL_BASE_SUBST: TFloatField;
    QGeraNfeItemVAL_ICMS_SUBST: TFloatField;
    QGeraNfeItemPERC_ALIQ_SUBST: TFloatField;
    QGeraNfeItemPERC_ALIQUOTA: TFloatField;
    QGeraNfeItemCST: TStringField;
    QGeraNfeItemPERC_ISS: TFloatField;
    QGeraNfeItemCOD_LISTA_SERVICO: TIntegerField;
    QGeraNfeItemPERC_IPI: TFloatField;
    QGeraNfeItemVAL_ISS: TFloatField;
    QGeraNfeItemVAL_PIS: TFloatField;
    QGeraNfeItemDESC_INF_ADICIONAL: TStringField;
    QGeraNfeItemPERC_COFINS: TFloatField;
    QGeraNfeItemPERC_PIS: TFloatField;
    QSomaNfe: TOracleDataSet1;
    QSomaNfeCOD_NOTA_CAB: TIntegerField;
    QSomaNfeSVAL_IPI: TFloatField;
    QSomaNfeSVAL_TOTAL: TFloatField;
    QSomaNfeSVAL_DESCONTO: TFloatField;
    QSomaNfeSVAL_FRETE: TFloatField;
    QSomaNfeSVAL_ICM_BASE: TFloatField;
    QSomaNfeSVAL_BASE_SUBST: TFloatField;
    QSomaNfeSVAL_ICM: TFloatField;
    QSomaNfeSVAL_ICMS_SUBST: TFloatField;
    QSomaNfeSVAL_PIS: TFloatField;
    QSomaNfeSVAL_COFINS: TFloatField;
    QGeraNfeCOD_CADASTRO_TRANSP: TIntegerField;
    QGeraNfeNUM_CGC_CPF_TRANSP: TStringField;
    QGeraNfeIND_FISICA_JURIDICA_TRANSP: TStringField;
    QGeraNfeNOME_TRANSP: TStringField;
    QGeraNfeINSCRICAO_TRANSP: TStringField;
    QGeraNfeDESC_ENDERECO_TRANSP: TStringField;
    QGeraNfeDESC_CIDADE_TRANSP: TStringField;
    QGeraNfeUF_TRANSP: TStringField;
    QSomaNfeSVAL_TOTAL_SERVICOS: TFloatField;
    QSomaNfeSVAL_ISS: TFloatField;
    QSomaNfeval_total: TFloatField;
    QGeraNfeVAL_SUBST_TRIBUT: TFloatField;
    QTitulos: TOracleDataSet1;
    QTitulosNUM_PARCELA: TIntegerField;
    QTitulosDT_VENCIMENTO: TDateTimeField;
    QTitulosVAL_ORIGINAL: TFloatField;
    QSomaNfeSQT_PESO_L: TFloatField;
    QSomaNfeSQT_PESO_B: TFloatField;
    QGeraNfeNUM_NOTA_REF: TIntegerField;
    QGeraNfeNUM_NOTA_DEV_FIXAR: TIntegerField;
    QGeraNfeCOD_VENDEDOR: TIntegerField;
    QGeraNfeItemCOD_TRIBUTACAO: TIntegerField;
    QGeraNfeCOD_MENSAGEM: TIntegerField;
    QGeraNfeItemIND_RETORNAVEL: TStringField;
    QGeraNfeItemVAL_DPI_TRANSGENICOS: TFloatField;
    QMensagem: TOracleDataSet1;
    QMensagemCOD_MENSAGEM: TIntegerField;
    QMensagemDESC_MENSAGEM: TStringField;
    QMensagemDESC_COMPLEMENTO: TStringField;
    QMensagemDESC_COMPLEMENTO1: TStringField;
    QMensagemDESC_COMPLEMENTO2: TStringField;
    QMensagemDESC_COMPLEMENTO3: TStringField;
    QMensagemDESC_COMPLEMENTO4: TStringField;
    QMensagemDESC_COMPLEMENTO5: TStringField;
    QMensagemDESC_COMPLEMENTO6: TStringField;
    QMensagemDESC_COMPLEMENTO7: TStringField;
    QNfeEmissaoCOD_FILIAL: TIntegerField;
    QNfeEmissaoDESC_REPOSITORIO_NFE: TStringField;
    QNfeDESC_PROT_AUTORIZACAO: TStringField;
    QNfeCancela: TOracleDataSet1;
    QNfeCancelaCOD_FILIAL: TIntegerField;
    QNfeCancelaIND_AMBIENTE_NFE: TIntegerField;
    QNfeCancelaDESC_REPOSITORIO_NFE: TStringField;
    QNfeCancelaDESC_PROT_AUTORIZACAO: TStringField;
    QNfeCancelaDESC_MOTIVO: TStringField;
    QNfeCancelaCOD_UF_IBGE: TIntegerField;
    QNfeDESC_REPOSITORIO_NFE: TStringField;
    QNfeEnviaEmail: TOracleDataSet1;
    QNfeEnviaEmailDESC_EMAIL: TStringField;
    QNfeEnviaEmailNUM_NOTA: TIntegerField;
    QNfeEnviaEmailCOD_SERIE: TStringField;
    QNfeEnviaEmailDESC_REPOSITORIO_NFE: TStringField;
    QNfeEnviaEmailDESC_FILIAL: TStringField;
    QNfeEnviaEmailNUM_CGC: TStringField;
    QGeraNfeIND_REGIME_TRIBUTARIO: TIntegerField;
    QNfeDESC_CERTIFICADO: TStringField;
    QNfeDESC_LOGOTIPO: TStringField;
    QNfeIND_AMBIENTE_NFE: TIntegerField;
    QNfeEmissaoDESC_CERTIFICADO: TStringField;
    QNfeEmissaoDESC_LOGOTIPO_DANFE: TStringField;
    QNfeID_LOTE: TFloatField;
    QNfeEnviaEmailDESC_CHAVE_ACESSO: TStringField;
    QNfeEmissaoDESC_VERSAO_NFE: TStringField;
    QGeraNfeDESC_VERSAO_NFE: TStringField;
    QNfeCOD_NOTA_CAB: TFloatField;
    SDXML: TSaveDialog;
    QNfeConfigIND_EMAIL_SSL: TStringField;
    QNfeConfigIND_COD_CADASTRO_NFE: TStringField;
    QNfeEmissaoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QNfeEmissaoIND_SITUACAO: TStringField;
    QNfeEmissaoCOD_UF_IBGE_FILIAL: TIntegerField;
    QGeraNfeDT_CONTINGENCIA: TDateTimeField;
    QGeraNfeDESC_JUST_CONTINGENCIA: TStringField;
    QGeraNfeDESC_OPERACAO: TStringField;
    QGeraNfeItemCSOSN: TStringField;
    QGeraNfeDESC_XML_NFE: TMemoField;
    QGeraNfeversao_nfe: TStringField;
    QNfeEmissaoIND_VIAS_DANFE: TStringField;
    QNfeEmissaoNUM_VIAS_DANFE: TIntegerField;
    QGeraNfeItemNUM_NOTA_PRODUTOR: TIntegerField;
    OPNfe: TOraclePackage;
    dsProdutoXML: TDataSource;
    dsProdutoNcmDuplicado: TDataSource;
    QGeraNfeItemNUM_DI: TStringField;
    QGeraNfeItemDT_DI: TDateTimeField;
    QGeraNfeItemDESC_LOCAL_DESEMB_DI: TStringField;
    QGeraNfeItemCOD_UF_DESEMB_DI: TStringField;
    QGeraNfeItemDT_DESEMB_DI: TDateTimeField;
    QGeraNfeItemCOD_EXPORTADOR: TStringField;
    QGeraNfeItemAdi: TOracleDataSet1;
    QGeraNfeItemAdiCOD_NFE_IMPORT_ADI: TIntegerField;
    QGeraNfeItemAdiCOD_NOTA_ITEM: TIntegerField;
    QGeraNfeItemAdiNUM_ADICAO: TIntegerField;
    QGeraNfeItemAdiNUM_SEQ_ADIC: TIntegerField;
    QGeraNfeItemAdiCOD_FABRICANTE: TStringField;
    QGeraNfeItemAdiVAL_DESCONTO: TFloatField;
    QGeraNfeCOD_ESTADO_EMBARQUE: TStringField;
    QGeraNfeDESC_LOCAL_EMBARQUE: TStringField;
    QGeraNfeItemPERC_TRIBUTADO: TFloatField;
    QGeraNfeCOD_UF_VEICULO: TStringField;
    dspProdutoBD: TDataSetProvider;
    QGeraNfeItemNUM_ORIGEM: TIntegerField;
    QGeraNfeNUM_PESO_BRUTO: TFloatField;
    QGeraNfeNUM_PESO_LIQUIDO: TFloatField;
    QGeraNfeItemVAL_BC_II: TFloatField;
    QGeraNfeItemVAL_DESPADU_II: TFloatField;
    QGeraNfeItemVAL_II: TFloatField;
    QGeraNfeItemVAL_IOF_II: TFloatField;
    QGeraNfeItemPERC_TRIBUTADO_NOTA: TFloatField;
    QNfeEmissaoIND_SERVICO: TStringField;
    QGeraNfeINSCRICAO_MUN_FILIAL: TStringField;
    QGeraNfeCOD_ESTADO_CADASTRO: TStringField;
    QGeraNfeDESC_INSCRICAO_SUBST: TStringField;
    QGeraNfeItemVAL_DESPESAS: TFloatField;
    QSomaNfeSVAL_II: TFloatField;
    cdsProdutoNcmDuplicado: TClientDataSet;
    cdsProdutoNcmDuplicadocodigo: TIntegerField;
    cdsProdutoNcmDuplicadoncm: TStringField;
    cdsProdutoNcmDuplicadodesc_produto_xml: TStringField;
    cdsProdutoNcmDuplicadodesc_produto_bd: TStringField;
    cdsProdutoNcmDuplicadocprod_xml: TStringField;
    cdsProdutoNcmDuplicadoitem: TStringField;
    cdsProdutoXML: TClientDataSet;
    cdsProdutoXMLproduto: TStringField;
    cdsProdutoXMLncm: TStringField;
    cdsProdutoXMLcprod: TStringField;
    cdsProdutoXMLitem: TStringField;
    QGeraCce: TOracleDataSet1;
    QGeraCceItem: TOracleDataSet1;
    QGeraCceID_LOTE: TFloatField;
    QGeraCceDESC_CHAVE_ACESSO: TStringField;
    QGeraCceDESC_RETORNO_PROCESSAMENTO: TStringField;
    QGeraCceDESC_MSG_VALIDACAO: TMemoField;
    QGeraCceItemNSEQ_EVENTO: TIntegerField;
    QGeraCceItemID_LOTE: TFloatField;
    QGeraCceItemID_EVENTO: TStringField;
    QGeraCceItemDT_EVENTO: TDateTimeField;
    QGeraCceItemDESC_CORRECAO: TMemoField;
    QGeraCceItemDESC_RETORNO_PROCESSAMENTO: TStringField;
    QGeraCceItemDESC_MSG_VALIDACAO: TMemoField;
    QGeraCceItemDT_REG_EVENTO: TDateTimeField;
    QGeraCceItemDESC_PROTOCOLO: TStringField;
    QGeraCceItemDESC_XML_RETORNO: TMemoField;
    QGeraCceItemDESC_XML_CCE: TMemoField;
    QNfeEmissaoDESC_IMPRESSORA_DANFE: TStringField;
    QNfeEmissaoCOD_NOTA_CAB: TIntegerField;
    QGeraNfeItemCOD_SERVICO_MUNICIPAL: TStringField;
    QGeraNfeBAIRRO_ENTREGA_CADASTRO: TStringField;
    QGeraNfePERC_BC_NFSE: TFloatField;
    cdsProdutoXMLAssociado: TBooleanField;
    QGeraNfeDESC_CNAE: TStringField;
    QGeraNfeItemCOD_PRODUTO_ANP: TIntegerField;
    QGeraNfeItemQT_TEMP: TFloatField;
    QGeraNfeItemCOD_UF_CONSUMO: TStringField;
    QManifestDest: TOracleDataSet1;
    QEvento: TOracleDataSet1;
    QEventoCOD_EVENTO: TStringField;
    QEventoDESC_EVENTO: TStringField;
    QEventoTIPO_EVENTO: TStringField;

    QManifestDestmsg_validacao: TStringField;
    QManifestDestID_LOTE: TFloatField;
    QManifestDestCOD_NOTA_CAB: TIntegerField;
    QManifestDestDESC_CHAVE_ACESSO: TStringField;
    QManifestDestNSEQ_EVENTO: TIntegerField;
    QManifestDestID_EVENTO: TStringField;
    QManifestDestDT_EVENTO: TDateTimeField;
    QManifestDestDESC_EVENTO: TStringField;
    QManifestDestDESC_JUSTIFICATIVA: TStringField;
    QManifestDestDESC_RETORNO_PROCESSAMENTO: TStringField;
    QManifestDestDESC_MSG_VALIDACAO: TMemoField;
    QManifestDestDT_REG_EVENTO: TDateTimeField;
    QManifestDestDESC_PROTOCOLO: TStringField;
    QManifestDestDESC_XML: TMemoField;
    QManifestDestDESC_XML_RETORNO: TMemoField;
    QManifestDestTP_EVENTO: TStringField;
    QGeraNfeCanc: TOracleDataSet;
    QGeraNfeCancID_LOTE: TFloatField;
    QGeraNfeCancDESC_CHAVE_ACESSO: TStringField;
    QGeraNfeCancNSEQ_EVENTO: TIntegerField;
    QGeraNfeCancID_EVENTO: TStringField;
    QGeraNfeCancDT_EVENTO: TDateTimeField;
    QGeraNfeCancDESC_JUSTIFICATIVA: TStringField;
    QGeraNfeCancDESC_RETORNO_PROCESSAMENTO: TStringField;
    QGeraNfeCancDESC_MSG_VALIDACAO: TMemoField;
    QGeraNfeCancDT_REG_EVENTO: TDateTimeField;
    QGeraNfeCancDESC_PROTOCOLO: TStringField;
    QGeraNfeCancDESC_XML_CANC_NFE: TMemoField;
    QGeraNfeCancDESC_XML_RETORNO: TMemoField;
    QGeraNfeItemNUM_PEDIDO: TIntegerField;
    QProdutoBD: TOracleDataSet1;
    cdsProdutoBD: TClientDataSet;
    cdsProdutoBDCOD_PRODUTO: TFloatField;
    cdsProdutoBDPRODUTO: TStringField;
    cdsProdutoBDNCM: TStringField;
    cdsProdutoBDNUM_FABRICANTE: TStringField;
    cdsProdutoBDCHECADO: TStringField;
    cdsProdutoBDQT_ESTOQUE: TFloatField;
    QGeraNfeDESC_REPOSITORIO_NFE: TStringField;
    QGeraCte: TOracleDataSet1;
    QGeraCteCOD_FILIAL: TIntegerField;
    QGeraCteNOME_FILIAL: TStringField;
    QGeraCteENDERECO_FILIAL: TStringField;
    QGeraCteCIDADE_FILIAL: TStringField;
    QGeraCteTELEFONE_FILIAL: TStringField;
    QGeraCteCEP_FILIAL: TStringField;
    QGeraCteUF_FILIAL: TStringField;
    QGeraCteCPF_CNPJ_FILIAL: TStringField;
    QGeraCteINSCRICAO_MUN_FILIAL: TStringField;
    QGeraCteCXPOSTAL_FILIAL: TIntegerField;
    QGeraCteEMAIL_FILIAL: TStringField;
    QGeraCteNUM_ENDERECO_FILIAL: TIntegerField;
    QGeraCteCOMPLEMENTO_FILIAL: TStringField;
    QGeraCteDESC_CERTIFICADO: TStringField;
    QGeraCteDESC_LOGOTIPO_DANFE: TStringField;
    QGeraCteIND_REGIME_TRIBUTARIO: TIntegerField;
    QGeraCteDESC_CNAE: TStringField;
    QGeraCteDT_EMISSAO: TDateTimeField;
    QGeraCteNUM_CONHECIMENTO: TIntegerField;
    QGeraCteVAL_FRETE: TFloatField;
    QGeraCteCOD_SERIE: TStringField;
    QGeraCteCOD_CONHECIMENTO: TIntegerField;
    QGeraCteDESC_SEGURADORA: TStringField;
    QGeraCteVAL_PEDAGIO: TFloatField;
    QGeraCteVAL_ICMS: TFloatField;
    QGeraCteCOD_CONTA_PAGAR_CAB: TIntegerField;
    QGeraCteCOD_MENSAGEM: TIntegerField;
    QGeraCteIND_SITUACAO: TStringField;
    QGeraCteCOD_USUARIO: TIntegerField;
    QGeraCteDT_RECEBIMENTO: TDateTimeField;
    QGeraCteVAL_SEGURO: TFloatField;
    QGeraCteCOD_BCO_MOVIMENTO: TIntegerField;
    QGeraCteVAL_CONTABIL: TFloatField;
    QGeraCteCOD_CONTA_RECEBER_CAB: TIntegerField;
    QGeraCteVAL_PIS: TFloatField;
    QGeraCteVAL_COFINS: TFloatField;
    QGeraCteCOD_CST_PIS: TStringField;
    QGeraCteCOD_CST_COFINS: TStringField;
    QGeraCteCOD_SERIE_MODELO: TStringField;
    QGeraCteDESC_CHAVE_ACESSO_CTE: TStringField;
    QGeraCteIND_TIPO_SERVICO: TIntegerField;
    QGeraCteIND_TOMADOR_SERVICO: TIntegerField;
    QGeraCteDT_PREVISAO_ENTREGA: TDateTimeField;
    QGeraCteIND_FORMA_PGTO: TIntegerField;
    QGeraCteCOD_CIDADE_ORIGEM: TIntegerField;
    QGeraCteCOD_CIDADE_DESTINO: TIntegerField;
    QGeraCteIND_RESP_SEGURO: TIntegerField;
    QGeraCteNUM_APOLICE_SEGURO: TStringField;
    QGeraCteNUM_AVERBACAO_SEGURO: TStringField;
    QGeraCteVAL_BASE_ICMS: TFloatField;
    QGeraCteVAL_ICMS_SUBST: TFloatField;
    QGeraCteVAL_BASE_ICMS_SUBST: TFloatField;
    QGeraCteIND_LOTACAO: TIntegerField;
    QGeraCteDESC_LACRES: TMemoField;
    QGeraCteCOD_FORN_VALE_PEDAGIO: TIntegerField;
    QGeraCteCOD_RESP_VALE_PEDAGIO: TIntegerField;
    QGeraCteDESC_COMP_VALE_PEDAGIO: TStringField;
    QGeraCteIND_TIPO_CTE: TIntegerField;
    QGeraCteDESC_OUT_CARAC_CARGA: TStringField;
    QGeraCteNUM_PESO_BRUTO: TFloatField;
    QGeraCteVAL_TOTAL_CARGA: TFloatField;
    QGeraCteNUM_PESO_BC: TFloatField;
    QGeraCteNUM_PESO_AFERIDO: TFloatField;
    QGeraCteNUM_CUBAGEM: TFloatField;
    QGeraCteVAL_DESPACHO: TFloatField;
    QGeraCteVAL_GRIS: TFloatField;
    QGeraCteVAL_FRETE_PESO: TFloatField;
    QGeraCteNOME_REM: TStringField;
    QGeraCteENDERECO_REM: TStringField;
    QGeraCteINSCRICAO_REM: TStringField;
    QGeraCteUF_REM: TStringField;
    QGeraCteCPF_CNPJ_REM: TStringField;
    QGeraCteCIDADE_REM: TStringField;
    QGeraCteCOMPLEMENTO_REM: TStringField;
    QGeraCteTELEFONE_REM: TStringField;
    QGeraCteFANTASIA_REM: TStringField;
    QGeraCteIND_FISICA_JURIDICA_REM: TStringField;
    QGeraCteCEP_REM: TStringField;
    QGeraCteEMAIL_REM: TStringField;
    QGeraCteNOME_DEST: TStringField;
    QGeraCteENDERECO_DEST: TStringField;
    QGeraCteINSCRICAO_DEST: TStringField;
    QGeraCteUF_DEST: TStringField;
    QGeraCteCPF_CNPJ_DEST: TStringField;
    QGeraCteCIDADE_DEST: TStringField;
    QGeraCteCOMPLEMENTO_DEST: TStringField;
    QGeraCteTELEFONE_DEST: TStringField;
    QGeraCteFANTASIA_DEST: TStringField;
    QGeraCteIND_FISICA_JURIDICA_DEST: TStringField;
    QGeraCteCEP_DEST: TStringField;
    QGeraCteEMAIL_DEST: TStringField;
    QGeraCteNOME_EXP: TStringField;
    QGeraCteENDERECO_EXP: TStringField;
    QGeraCteINSCRICAO_EXP: TStringField;
    QGeraCteUF_EXP: TStringField;
    QGeraCteCPF_CNPJ_EXP: TStringField;
    QGeraCteCIDADE_EXP: TStringField;
    QGeraCteCOMPLEMENTO_EXP: TStringField;
    QGeraCteTELEFONE_EXP: TStringField;
    QGeraCteFANTASIA_EXP: TStringField;
    QGeraCteIND_FISICA_JURIDICA_EXP: TStringField;
    QGeraCteCEP_EXP: TStringField;
    QGeraCteEMAIL_EXP: TStringField;
    QGeraCteNOME_REC: TStringField;
    QGeraCteENDERECO_REC: TStringField;
    QGeraCteINSCRICAO_REC: TStringField;
    QGeraCteUF_REC: TStringField;
    QGeraCteCPF_CNPJ_REC: TStringField;
    QGeraCteCIDADE_REC: TStringField;
    QGeraCteCOMPLEMENTO_REC: TStringField;
    QGeraCteTELEFONE_REC: TStringField;
    QGeraCteFANTASIA_REC: TStringField;
    QGeraCteIND_FISICA_JURIDICA_REC: TStringField;
    QGeraCteCEP_REC: TStringField;
    QGeraCteEMAIL_REC: TStringField;
    QGeraCteCOD_UF_IBGE_FILIAL: TIntegerField;
    QGeraCteCOD_UF_IBGE_REM: TIntegerField;
    QGeraCteCOD_ESTADO_REM: TStringField;
    QGeraCteCOD_UF_IBGE_DEST: TIntegerField;
    QGeraCteCOD_ESTADO_DEST: TStringField;
    QGeraCteCOD_UF_IBGE_EXP: TIntegerField;
    QGeraCteCOD_ESTADO_EXP: TStringField;
    QGeraCteCOD_UF_IBGE_REC: TIntegerField;
    QGeraCteCOD_ESTADO_REC: TStringField;
    QGeraCteCOD_CIDADE_IBGE_FILIAL: TStringField;
    QGeraCteCOD_CIDADE_IBGE_REM: TStringField;
    QGeraCteCOD_CIDADE_IBGE_DEST: TStringField;
    QGeraCteCOD_CIDADE_IBGE_EXP: TStringField;
    QGeraCteCOD_CIDADE_IBGE_REC: TStringField;
    QGeraCteCOD_CIDADE_IBGE_ORIG: TStringField;
    QGeraCteDESC_CIDADE_ORIG: TStringField;
    QGeraCteUF_ORIG: TStringField;
    QGeraCteCOD_CIDADE_IBGE_DESTINO: TStringField;
    QGeraCteDESC_CIDADE_DESTINO: TStringField;
    QGeraCteUF_DESTINO: TStringField;
    QGeraCtePAIS_REM: TStringField;
    QGeraCteCOD_PAIS_IBGE_REM: TIntegerField;
    QGeraCtePAIS_FILIAL: TStringField;
    QGeraCteCOD_PAIS_IBGE_FILIAL: TFloatField;
    QGeraCteDESC_OPERACAO: TStringField;
    QGeraCteDESC_MODELO: TStringField;
    QGeraCteDESC_XML_CTE: TMemoField;
    QCteEmissao: TOracleDataSet1;
    QGeraNfeItemVAL_TOTAL_TRIB: TFloatField;
    QSomaNfeSVAL_TOTAL_TRIB_NFSE: TFloatField;
    QGeraNfeItemDESC_COD_BARRA: TStringField;
    QGeraCteversao_cte: TStringField;
    QGeraCteNUM_CFOP: TFloatField;
    QGeraCteIND_AMBIENTE_CTE_FILIAL: TIntegerField;
    QGeraCteIND_CONTINGENCIA_CTE_FILIAL: TStringField;
    QGeraCteCOD_UF_IBGE_ORIG: TIntegerField;
    QGeraCteCOD_UF_IBGE_DESTINO: TIntegerField;
    QGeraCteNUM_VIAS_DACTE: TIntegerField;
    QGeraCteIND_VIAS_DACTE: TStringField;
    QGeraCteDESC_VERSAO_CTE: TStringField;
    QGeraCteDT_CONTINGENCIA_CTE: TDateTimeField;
    QGeraCteDESC_JUSTI_CONTINGENCIA_CTE: TStringField;
    QGeraCteDESC_CARAC_ADICIONAL_TRANSP: TStringField;
    QGeraCteDESC_CARAC_ADICIONAL_SERV: TStringField;
    QGeraCteDESC_FUNC_EMISSOR_CTE: TStringField;
    QGeraCtePAIS_EXP: TStringField;
    QGeraCteCOD_PAIS_IBGE_EXP: TIntegerField;
    QGeraCtePAIS_REC: TStringField;
    QGeraCteCOD_PAIS_IBGE_REC: TIntegerField;
    QGeraCtePAIS_DEST: TStringField;
    QGeraCteCOD_PAIS_IBGE_DEST: TIntegerField;
    QDocOriginario: TOracleDataSet1;
    QGeraCteCST: TStringField;
    QGeraCtePERC_ALIQUOTA: TFloatField;
    QGeraCtePERC_TRIBUTADO: TFloatField;
    QGeraCtePERC_TRIBUTADO_NOTA: TFloatField;
    QGeraCteDESC_INF_ADIC_FISCO: TMemoField;
    QGeraCteDESC_PRODUTO: TStringField;
    QGeraCteDESC_UNIDADE: TStringField;
    QGeraCteDESC_RNTRC: TStringField;
    QMotoristaCTe: TOracleDataSet;
    QVeiculoCTe: TOracleDataSet;
    QMotoristaCTeNOME: TStringField;
    QMotoristaCTeNUM_CGC_CPF: TStringField;
    QVeiculoCTeDESC_PLACA: TStringField;
    QVeiculoCTeDESC_RENAVAN: TStringField;
    QVeiculoCTeNUM_TARA: TIntegerField;
    QVeiculoCTeVAL_MAX_CARGA: TIntegerField;
    QVeiculoCTeVAL_VOLUME: TFloatField;
    QVeiculoCTeIND_TIPO_PROPRIEDADE: TStringField;
    QVeiculoCTeIND_TIPO_VEICULO: TIntegerField;
    QVeiculoCTeIND_TIPO_RODADO: TStringField;
    QVeiculoCTeIND_TIPO_CARROCERIA: TStringField;
    QVeiculoCTeCOD_ESTADO: TStringField;
    QVeiculoCTeIND_TIPO_PROPRIETARIO: TIntegerField;
    QVeiculoCTeDESC_RNTRC: TStringField;
    QVeiculoCTeNOME: TStringField;
    QVeiculoCTeESTADO_PROPRIETARIO: TStringField;
    QCteEmissaoDESC_REPOSITORIO_NFE: TStringField;
    QCteEmissaoNUM_CGC: TStringField;
    QCteEmissaoIND_CONTINGENCIA_CTE: TStringField;
    QCteEmissaoIND_VIAS_DACTE: TStringField;
    QCteEmissaoNUM_VIAS_DACTE: TIntegerField;
    QCteEmissaoDESC_CERTIFICADO: TStringField;
    QCteEmissaoDESC_LOGOTIPO_DACTE: TStringField;
    QCteEmissaoIND_AMBIENTE_CTE: TIntegerField;
    QCteEmissaoDESC_VERSAO_CTE: TStringField;
    QCteEmissaoDESC_CHAVE_ACESSO_CTE: TStringField;
    QCteEmissaoCOD_CONHECIMENTO: TIntegerField;
    QCteEmissaoDT_EMISSAO: TDateTimeField;
    QCteEmissaoCOD_SERIE: TStringField;
    QCteEmissaoNUM_CONHECIMENTO: TIntegerField;
    QCteEmissaoCOD_FILIAL: TIntegerField;
    QCteEmissaoIND_SITUACAO: TStringField;
    QCteEmissaoIND_EMITE: TStringField;
    QCteEmissaoCOD_UF_IBGE_FILIAL: TIntegerField;
    QCteEmissaoDESC_MODELO: TStringField;
    QCteEmissaoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QCteEmissaoDESC_IMPRESSORA_DACTE: TStringField;
    QGeraCteCOD_CADASTRO_REMETENTE: TIntegerField;
    QGeraCteCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QGeraCteCOD_CADASTRO_EXPEDIDOR: TIntegerField;
    QGeraCteCOD_CADASTRO_RECEBEDOR: TIntegerField;
    QCte: TOracleDataSet1;
    QCteDESC_CHAVE_ACESSO: TStringField;
    QCteSIT_CTE: TStringField;
    QCteSIT_CANC: TStringField;
    QCteCOD_FILIAL: TIntegerField;
    QCteDESC_SERIE: TStringField;
    QCteNUM_CTE: TIntegerField;
    QCteDESC_XML_CTE: TMemoField;
    QCteDESC_PROT_AUTORIZACAO: TStringField;
    QCteIND_AMBIENTE_CTE: TIntegerField;
    QCteID_LOTE: TFloatField;
    QCteCOD_CONHECIMENTO: TFloatField;
    QCteDESC_REPOSITORIO_NFE: TStringField;
    QCteind_aprovado: TBooleanField;
    QCteind_cancelado: TBooleanField;
    QCteind_denegado: TBooleanField;
    QDocOriginarioCOD_DOC_ORIGINARIO: TIntegerField;
    QDocOriginarioCOD_CONHECIMENTO: TIntegerField;
    QDocOriginarioDESC_CHAVE_ACESSO: TStringField;
    QDocOriginarioDESC_PIN_SUFRAMA: TStringField;
    QDocOriginarioCOD_NOTA_CAB: TIntegerField;
    QDocOriginarioNUM_ROMANEIO: TStringField;
    QDocOriginarioNUM_PEDIDO: TStringField;
    QDocOriginarioCOD_SERIE_MODELO: TStringField;
    QDocOriginarioCOD_SERIE: TStringField;
    QDocOriginarioNUM_DOCUMENTO: TStringField;
    QDocOriginarioDT_EMISSAO: TDateTimeField;
    QDocOriginarioVAL_BASE_ICMS: TFloatField;
    QDocOriginarioVAL_ICMS: TFloatField;
    QDocOriginarioVAL_BASE_ICMS_SUBST: TFloatField;
    QDocOriginarioVAL_ICMS_SUBST: TFloatField;
    QDocOriginarioVAL_TOTAL_PRODUTOS: TFloatField;
    QDocOriginarioVAL_TOTAL: TFloatField;
    QDocOriginarioNUM_CFOP: TIntegerField;
    QDocOriginarioNUM_PESO: TFloatField;
    QGeraCteSVAL_TOTAL_TRIBUTOS: TFloatField;
    QGeraCteQT_VOLUMES: TFloatField;
    QGeraCteVAL_TOTAL_CTE: TFloatField;
    QGeraCteVAL_A_RECEBER: TFloatField;
    QGeraCteCOD_CONHECIMENTO_REF: TIntegerField;
    QGeraCteCOD_CTE_ANULACAO_REF: TIntegerField;
    QGeraCteDT_DECLARACAO_NAO_CONTRIB: TDateTimeField;
    QGeraCteDESC_CHAVE_ACESSO_REF: TStringField;
    QGeraCteIND_TOMA_ICMS: TStringField;
    QGeraNfeDESC_MD5_CUPOM_FISCAL: TStringField;
    QGeraNfePERC_ISS: TFloatField;
    QGeraNfeItemCOD_CST_PIS: TStringField;
    QGeraNfeItemCOD_CST_COFINS: TStringField;
    QGeraNfeItemVAL_COFINS: TFloatField;
    QGeraNfeIND_ISS_RETIDO: TIntegerField;
    QGeraCteNOME_TOM: TStringField;
    QGeraCteENDERECO_TOM: TStringField;
    QGeraCteINSCRICAO_TOM: TStringField;
    QGeraCteUF_TOM: TStringField;
    QGeraCteCPF_CNPJ_TOM: TStringField;
    QGeraCteCIDADE_TOM: TStringField;
    QGeraCteCOMPLEMENTO_TOM: TStringField;
    QGeraCteTELEFONE_TOM: TStringField;
    QGeraCteFANTASIA_TOM: TStringField;
    QGeraCteIND_FISICA_JURIDICA_TOM: TStringField;
    QGeraCteCEP_TOM: TStringField;
    QGeraCteEMAIL_TOM: TStringField;
    QGeraCteCOD_UF_IBGE_TOM: TIntegerField;
    QGeraCteCOD_ESTADO_TOM: TStringField;
    QGeraCteCOD_CIDADE_IBGE_TOM: TStringField;
    QGeraCtePAIS_TOM: TStringField;
    QGeraCteCOD_PAIS_IBGE_TOM: TIntegerField;
    QDocAnterior: TOracleDataSet1;
    QDocAnteriorCOD_DOC_ANTERIOR: TIntegerField;
    QDocAnteriorCOD_CONHECIMENTO: TIntegerField;
    QDocAnteriorIND_TP_DOC: TStringField;
    QDocAnteriorCOD_SERIE: TStringField;
    QDocAnteriorCOD_SUB_SERIE: TStringField;
    QDocAnteriorNUM_DOCUMENTO: TStringField;
    QDocAnteriorDT_EMISSAO: TDateTimeField;
    QDocAnteriorDESC_CHAVE_ACESSO: TStringField;
    QGeraMdfe: TOracleDataSet1;
    QMdfeEmissao: TOracleDataSet1;
    QCondutorMDFe: TOracleDataSet;
    QVeiculoMDFe: TOracleDataSet;
    QMdfe: TOracleDataSet1;
    QMdfeind_aprovado: TBooleanField;
    QMdfeind_cancelado: TBooleanField;
    QMdfeind_denegado: TBooleanField;
    QMdfeSIT_MDFE: TStringField;
    QMdfeNUM_MDFE: TIntegerField;
    QMdfeDESC_XML_MDFE: TMemoField;
    QMdfeIND_AMBIENTE_MDFE: TIntegerField;
    QMdfeCOD_MANIFESTO: TFloatField;
    QMdfeDESC_CHAVE_ACESSO: TStringField;
    QMdfeSIT_CANC: TStringField;
    QMdfeCOD_FILIAL: TIntegerField;
    QMdfeDESC_SERIE: TStringField;
    QMdfeDESC_PROT_AUTORIZACAO: TStringField;
    QMdfeID_LOTE: TFloatField;
    QMdfeDESC_REPOSITORIO_NFE: TStringField;
    QCidadeDescarga: TOracleDataSet;
    QCidadeDescargaCOD_CIDADE_DESCARGA: TIntegerField;
    QCidadeDescargaCOD_CIDADE: TIntegerField;
    QCidadeDescargaCOD_MANIFESTO: TIntegerField;
    QCidadeCarrega: TOracleDataSet;
    QCidadeCarregaCOD_CIDADE_CARREGA: TIntegerField;
    QCidadeCarregaCOD_CIDADE: TIntegerField;
    QCidadeCarregaCOD_MANIFESTO: TIntegerField;
    QUFPercurso: TOracleDataSet;
    QUFPercursoCOD_UF_PERCURSO: TIntegerField;
    QUFPercursoCOD_ESTADO: TStringField;
    QUFPercursoCOD_MANIFESTO: TIntegerField;
    QInfDoc: TOracleDataSet;
    QInfDocCOD_INF_DOC: TIntegerField;
    QInfDocCOD_CIDADE_DESCARGA: TIntegerField;
    QInfDocIND_TIPO_DOC: TStringField;
    QInfDocDESC_CHAVE_ACESSO: TStringField;
    QInfDocDESC_SEG_COD_BARRA: TStringField;
    QInfDocNUM_DOC: TStringField;
    QInfDocDESC_SERIE: TStringField;
    QInfDocDESC_SUBSERIE: TStringField;
    QInfDocDT_EMISSAO: TDateTimeField;
    QInfDocVAL_CARGA: TFloatField;
    QInfDocDESC_CNPJ_EMIT: TStringField;
    QInfDocCOD_UF_DEST: TStringField;
    QInfDocVAL_NF: TFloatField;
    QInfDocDESC_PIN_SUFRAMA: TStringField;
    cdsProdutoBDCOD_TRIBUTACAO: TIntegerField;
    QMdfeEmissaoDESC_REPOSITORIO_NFE: TStringField;
    QMdfeEmissaoNUM_CGC: TStringField;
    QMdfeEmissaoIND_VIAS_DAMDFE: TStringField;
    QMdfeEmissaoNUM_VIAS_DAMDFE: TIntegerField;
    QMdfeEmissaoDESC_CERTIFICADO: TStringField;
    QMdfeEmissaoIND_AMBIENTE_MDFE: TIntegerField;
    QMdfeEmissaoDESC_VERSAO_MDFE: TStringField;
    QMdfeEmissaoCOD_MANIFESTO: TIntegerField;
    QMdfeEmissaoDT_EMISSAO: TDateTimeField;
    QMdfeEmissaoCOD_SERIE: TStringField;
    QMdfeEmissaoNUM_MANIFESTO: TIntegerField;
    QMdfeEmissaoCOD_FILIAL: TIntegerField;
    QMdfeEmissaoIND_SITUACAO: TStringField;
    QMdfeEmissaoCOD_UF_IBGE_FILIAL: TIntegerField;
    QMdfeEmissaoDESC_MODELO: TStringField;
    QMdfeEmissaoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QMdfeEmissaoDESC_IMPRESSORA_DACTE: TStringField;
    QGeraMdfeCOD_FILIAL: TIntegerField;
    QGeraMdfeNOME_FILIAL: TStringField;
    QGeraMdfeENDERECO_FILIAL: TStringField;
    QGeraMdfeCIDADE_FILIAL: TStringField;
    QGeraMdfeTELEFONE_FILIAL: TStringField;
    QGeraMdfeCEP_FILIAL: TStringField;
    QGeraMdfeUF_FILIAL: TStringField;
    QGeraMdfeCPF_CNPJ_FILIAL: TStringField;
    QGeraMdfeINSCRICAO_MUN_FILIAL: TStringField;
    QGeraMdfeCXPOSTAL_FILIAL: TIntegerField;
    QGeraMdfeBAIRRO_FILIAL: TStringField;
    QGeraMdfeEMAIL_FILIAL: TStringField;
    QGeraMdfeNUM_ENDERECO_FILIAL: TIntegerField;
    QGeraMdfeCOMPLEMENTO_FILIAL: TStringField;
    QGeraMdfeNUM_VIAS_DAMDFE: TIntegerField;
    QGeraMdfeIND_VIAS_DAMDFE: TStringField;
    QGeraMdfeIND_AMBIENTE_MDFE_FILIAL: TIntegerField;
    QGeraMdfeDESC_CERTIFICADO: TStringField;
    QGeraMdfeDESC_LOGOTIPO_DANFE: TStringField;
    QGeraMdfeIND_REGIME_TRIBUTARIO: TIntegerField;
    QGeraMdfeDESC_VERSAO_MDFE: TStringField;
    QGeraMdfeDESC_CNAE: TStringField;
    QGeraMdfeDESC_RNTRC: TStringField;
    QGeraMdfeDT_EMISSAO: TDateTimeField;
    QGeraMdfeNUM_MANIFESTO: TIntegerField;
    QGeraMdfeCOD_MANIFESTO: TIntegerField;
    QGeraMdfeIND_SITUACAO: TStringField;
    QGeraMdfeCOD_USUARIO: TIntegerField;
    QGeraMdfeCOD_SERIE: TStringField;
    QGeraMdfeCOD_SERIE_MODELO: TStringField;
    QGeraMdfeCOD_UF_IBGE_FILIAL: TIntegerField;
    QGeraMdfeCOD_CIDADE_IBGE_FILIAL: TStringField;
    QGeraMdfePAIS_FILIAL: TStringField;
    QGeraMdfeCOD_PAIS_IBGE_FILIAL: TFloatField;
    QGeraMdfeDESC_MODELO: TStringField;
    QGeraMdfeDESC_XML_MDFE: TMemoField;
    QGeraMdfeversao_mdfe: TStringField;
    QGeraMdfeIND_MODAL: TIntegerField;
    QGeraMdfeCOD_UF_CARREGA: TStringField;
    QGeraMdfeCOD_UF_DESCARREGA: TStringField;
    QCidadeCarregaCOD_IBGE: TStringField;
    QCidadeDescargaCOD_IBGE: TStringField;
    QCidadeCarregaDESC_CIDADE: TStringField;
    QCidadeDescargaDESC_CIDADE: TStringField;
    QCidadeCarregaCOD_ESTADO: TStringField;
    QCidadeDescargaCOD_ESTADO: TStringField;
    QCondutorMDFeNOME: TStringField;
    QCondutorMDFeNUM_CGC_CPF: TStringField;
    QGeraMdfeVAL_CARGA: TFloatField;
    QGeraMdfeNUM_PESO: TFloatField;
    QGeraMdfeDESC_LACRES: TMemoField;
    QGeraMdfeDESC_OBS: TMemoField;
    QGeraMdfeEvento: TOracleDataSet;
    QGeraMdfeEventoID_EVENTO: TStringField;
    QGeraMdfeEventoDESC_CHAVE_ACESSO: TStringField;
    QGeraMdfeEventoNSEQ_EVENTO: TIntegerField;
    QGeraMdfeEventoDT_EVENTO: TDateTimeField;
    QGeraMdfeEventoTP_EVENTO: TIntegerField;
    QGeraMdfeEventoDESC_JUSTIFICATIVA: TStringField;
    QGeraMdfeEventoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QGeraMdfeEventoDESC_MSG_VALIDACAO: TMemoField;
    QGeraMdfeEventoDT_REG_EVENTO: TDateTimeField;
    QGeraMdfeEventoDESC_PROTOCOLO: TStringField;
    QGeraMdfeEventoDESC_XML_EVENTO: TMemoField;
    QGeraMdfeEventoDESC_XML_RETORNO: TMemoField;
    QGeraMdfeEventoDT_ENCERRAMENTO: TDateTimeField;
    QMdfeind_encerrado: TBooleanField;
    QMdfeSIT_ENC: TStringField;
    QMdfeEmissaoDESC_CHAVE_ACESSO: TStringField;
    QGeraMdfeDESC_CHAVE_ACESSO: TStringField;
    QGeraMdfeIND_TIPO_EMITENTE: TIntegerField;
    QGeraMdfeEventoCOD_CIDADE_ENC: TIntegerField;
    QGeraMdfeEventoCOD_ESTADO_ENC: TStringField;
    QGeraMdfeEventoCOD_CADASTRO_CONDUTOR: TIntegerField;
    QGeraCteEvento: TOracleDataSet;
    QGeraCteEventoDESC_CHAVE_ACESSO: TStringField;
    QGeraCteEventoNSEQ_EVENTO: TIntegerField;
    QGeraCteEventoDT_EVENTO: TDateTimeField;
    QGeraCteEventoTP_EVENTO: TIntegerField;
    QGeraCteEventoDESC_JUSTIFICATIVA: TStringField;
    QGeraCteEventoDESC_RETORNO_PROCESSAMENTO: TStringField;
    QGeraCteEventoDESC_MSG_VALIDACAO: TMemoField;
    QGeraCteEventoDT_REG_EVENTO: TDateTimeField;
    QGeraCteEventoDESC_PROTOCOLO: TStringField;
    QGeraCteEventoDESC_XML_EVENTO: TMemoField;
    QGeraCteEventoDESC_XML_RETORNO: TMemoField;
    QCorrecaoCTe: TOracleDataSet;
    QCorrecaoCTeDESC_GRUPO_ALTERADO: TStringField;
    QCorrecaoCTeDESC_CAMPO_ALTERADO: TStringField;
    QCorrecaoCTeDESC_VALOR_ALTERADO: TStringField;
    QCorrecaoCTeID_EVENTO: TStringField;
    QCorrecaoCTeNUM_ITEM_ALTERADO: TIntegerField;
    QSomaNfeSVAL_ICMS_SUBST_ANT: TFloatField;
    QGeraCteIND_AMBIENTE_CTE: TIntegerField;
    QGeraNfeREGIME_TRIBUTARIO_CADASTRO: TIntegerField;
    QGeraNfeItemPERC_REDUCAO_ICMS_SUBST: TFloatField;
    QGeraNfeDESC_SUFRAMA: TStringField;
    QGeraNfeItemCOD_PRODUTO: TFloatField;
    QGeraCteOBS_TRIBUTACAO: TStringField;
    QGeraNfePERC_ALIQ_CRED_ICMSSN: TFloatField;
    QMdfeEmissaoDESC_RETORNO_CANCELAMENTO: TStringField;
    QMdfeEmissaoDESC_RETORNO_ENCERRAMENTO: TStringField;
    QSomaNfeSVAL_DESPESAS: TFloatField;
    QGeraNfeIND_ORIENTACAO_PAG_DANFE: TIntegerField;
    QGeraCteBAIRRO_FILIAL: TStringField;
    QGeraCteBAIRRO_TOM: TStringField;
    QGeraCteBAIRRO_REM: TStringField;
    QGeraCteBAIRRO_DEST: TStringField;
    QGeraCteBAIRRO_EXP: TStringField;
    QGeraCteBAIRRO_REC: TStringField;
    QGeraNfeEMAIL_CADASTRO: TStringField;
    QGeraNfeIND_CONSUMIDOR_FINAL: TStringField;
    QGeraCteEMAIL_SEGURADORA: TStringField;
    QNotaReferenciada: TOracleDataSet;
    QGeraCtePERC_ALIQ_CRED_ICMSSN: TFloatField;
    QGeraCteVAL_FRETE_POR_TON: TFloatField;
    QSomaNfeVAL_MONOFASICO: TFloatField;
    QGeraNfeItemIND_TIPO_VIA_TRANSP_DI: TIntegerField;
    QGeraNfeItemVAL_AFRMM_DI: TFloatField;
    QGeraNfeItemIND_TIPO_INTERMEDIO_DI: TIntegerField;
    QGeraNfeItemDESC_CNPJ_ENCOMENDANTE_DI: TStringField;
    QGeraNfeItemDESC_UF_ENCOMENDANTE_DI: TStringField;
    QGeraNfeExport: TOracleDataSet1;
    QGeraNfeExportCOD_NFE_EXPORT: TIntegerField;
    QGeraNfeExportCOD_NOTA_ITEM: TIntegerField;
    QGeraNfeExportDESC_NUM_DRAW: TStringField;
    QGeraNfeExportDESC_NUM_RE: TStringField;
    QGeraNfeExportDESC_CHAVE_ACESSO: TStringField;
    QGeraNfeExportQT_QUANTIDADE_EXPORTADA: TFloatField;
    QGeraNfeItemPERC_MIXGN: TFloatField;
    QGeraNfeItemDESC_RECOPI: TStringField;
    cdsProdutoXMLcfop: TStringField;
    QGeraNfeDESC_LOCAL_DESPACHO: TStringField;
    QGeraNfeItemPERC_DIFERIMENTO: TFloatField;
    cdsProdutoAusente: TClientDataSet;
    cdsProdutoAusentecod_produto: TIntegerField;
    cdsProdutoAusentecod_classe: TIntegerField;
    cdsProdutoAusentecod_tributacao: TIntegerField;
    cdsProdutoAusentedesc_produto: TStringField;
    cdsProdutoAusentenum_embalagem: TFloatField;
    cdsProdutoAusentedesc_unidade: TStringField;
    cdsProdutoAusenteval_varejo: TFloatField;
    cdsProdutoAusenteval_atacado: TFloatField;
    cdsProdutoAusenteperc_ipi: TFloatField;
    cdsProdutoAusenteind_tipo_produto: TStringField;
    cdsProdutoAusentenum_fabricante: TStringField;
    cdsProdutoAusenteperc_iss: TFloatField;
    cdsProdutoAusenteperc_inss: TFloatField;
    cdsProdutoAusenteind_situacao: TStringField;
    cdsProdutoAusentenum_volumes: TFloatField;
    cdsProdutoAusentenum_genero_ncm: TStringField;
    cdsProdutoAusentedesc_cod_barra: TStringField;
    cdsProdutoAusenteind_subst_trib: TStringField;
    cdsProdutoAusenteBackup: TClientDataSet;
    cdsProdutoAusenteBackupcod_produto: TIntegerField;
    cdsProdutoAusenteBackupcod_classe: TIntegerField;
    cdsProdutoAusenteBackupcod_tributacao: TIntegerField;
    cdsProdutoAusenteBackupdesc_produto: TStringField;
    cdsProdutoAusenteBackupnum_embalagem: TFloatField;
    cdsProdutoAusenteBackupdesc_unidade: TStringField;
    cdsProdutoAusenteBackupval_varejo: TFloatField;
    cdsProdutoAusenteBackupval_atacado: TFloatField;
    cdsProdutoAusenteBackupperc_ipi: TFloatField;
    cdsProdutoAusenteBackupind_tipo_produto: TStringField;
    cdsProdutoAusenteBackupnum_fabricante: TStringField;
    cdsProdutoAusenteBackupperc_iss: TFloatField;
    cdsProdutoAusenteBackupperc_inss: TFloatField;
    cdsProdutoAusenteBackupind_situacao: TStringField;
    cdsProdutoAusenteBackupnum_volumes: TFloatField;
    cdsProdutoAusenteBackupnum_genero_ncm: TStringField;
    cdsProdutoAusenteBackupdesc_cod_barra: TStringField;
    cdsProdutoAusenteBackupind_subst_trib: TStringField;
    QInsereProduto: TOracleDataSet1;
    QNotaReferenciadaDESC_CHAVE_ACESSO: TStringField;
    QNotaReferenciadaCOD_SERIE: TStringField;
    QNotaReferenciadaCOD_SERIE_MODELO: TStringField;
    QNotaReferenciadaDT_EMISSAO: TDateTimeField;
    QNotaReferenciadaNUM_NOTA: TIntegerField;
    QNotaReferenciadaCPF_CNPJ_CADASTRO: TStringField;
    QNotaReferenciadaCOD_UF_IBGE: TIntegerField;
    QNotaReferenciadaINSCRICAO_CADASTRO: TStringField;
    QNotaReferenciadaIND_FISICA_JURIDICA: TStringField;
    QNotaReferenciadaNUM_COO: TIntegerField;
    QNotaReferenciadaCNPJ_FILIAL: TStringField;
    QNotaReferenciadaINSCRICAO_FILIAL: TStringField;
    QNotaReferenciadaDESC_INSCRICAO_MUNICIPAL: TStringField;
    cdsProdutoBDDESC_MARCA: TStringField;
    QSomaNfeSVAL_DESCONTO_SERVICO: TFloatField;
    QSomaNfeSVAL_DESPESAS_SERVICO: TFloatField;
    QPagamento: TOracleDataSet1;
    QNfeEmissaoCOD_SERIE_MODELO: TStringField;
    QGeraNfeIND_AMBIENTE_NFCE: TIntegerField;
    QGeraNfeIND_VIAS_DANFE_NFCE: TStringField;
    QGeraNfeNUM_VIAS_DANFE_NFCE: TIntegerField;
    QGeraNfeDT_CONTINGENCIA_NFCE: TDateTimeField;
    QGeraNfeDESC_JUST_CONTINGENCIA_NFCE: TStringField;
    QGeraNfeDESC_VERSAO_NFCE: TStringField;
    QGeraNfeDESC_CSC_NFCE: TStringField;
    QGeraNfeDESC_IDENTIFICADOR_CSC_NFCE: TStringField;
    QGeraNfeDESC_LOGOTIPO_DANFE_NFCE: TStringField;
    QGeraNfeDESC_CERTIFICADO_NFCE: TStringField;
    QNfeEmissaoDESC_VERSAO_NFCE: TStringField;
    QNfeEmissaoIND_VIAS_DANFE_NFCE: TStringField;
    QNfeEmissaoNUM_VIAS_DANFE_NFCE: TIntegerField;
    QGeraNfePERC_DEDUCAO_NFSE: TFloatField;
    QPagamentoVAL_PAGAMENTO: TFloatField;
    QPagamentoNSU: TStringField;
    QPagamentoDESC_REDE_AUTORIZADORA: TStringField;
    QPagamentoDESC_BANDEIRA_CARTAO: TStringField;
    QPagamentoVAL_VALOR: TFloatField;
    QGeraNfeCPF_CNPJ_INFORMADO: TStringField;
    QGeraNfeNOME_INFORMADO: TStringField;
    QGeraNfeNOME_MOTORISTA: TStringField;
    QGeraNfeIND_AMBIENTE_NFCE_FILIAL: TIntegerField;
    QNfeEmissaoIND_AMBIENTE_NFE: TFloatField;
    QNfeCOD_SERIE_MODELO: TStringField;
    QValeProduto: TOracleDataSet;
    QValeProdutoCOD_FILIAL: TIntegerField;
    QValeProdutoCOD_CADASTRO: TIntegerField;
    QValeProdutoNOME: TStringField;
    QValeProdutoVAL_VALE_PRODUTO: TFloatField;
    QValeProdutoDT_EMISSAO: TDateTimeField;
    QValeProdutoCOD_VALE_PRODUTO: TIntegerField;
    QValeProdutoIND_UTILIZADO: TStringField;
    QValeProdutoCOD_NOTA_CAB_TROCA: TIntegerField;
    QValeProdutoCOD_NOTA_CAB: TIntegerField;
    QValeProdutoCOD_NOTA_CAB_DEV: TIntegerField;
    QValeProdutoIND_VALIDO: TStringField;
    QValeProdutoIND_CANCELADO: TStringField;
    QDocOriginarioCOD_CIDADE_IBGE: TStringField;
    QGeraNfeIND_CONTINGENCIA_NFCE: TStringField;
    QGeraNfeItemVAL_ICMS_DIFERENCIAL: TFloatField;
    QGeraNfeItemPERC_ALIQ_ICMS_DIFERENCIAL: TFloatField;
    QSomaNfeSVAL_ICMS_DIFERENCIAL: TFloatField;
    QGeraNfeIND_NOME_FANTASIA_DANFE: TStringField;
    QGeraNfeItemCOD_CEST: TStringField;
    QGeraNfeItemPERC_FCP_UF_DEST: TFloatField;
    QGeraNfeNOME_FANTASIA_CADASTRO: TStringField;
    QGeraNfePERC_ICMS_UF_DEST: TFloatField;
    QValeProdutoDESC_TIPO_VALE: TStringField;
    QGeraNfeENDERECO_CADASTRO: TStringField;
    QGeraNfeBAIRRO_CADASTRO: TStringField;
    QGeraNfeIND_CONTRIBUINTE: TStringField;
    cdsProdutoAusentenum_item: TIntegerField;
    cdsProdutoXMLnum_item: TIntegerField;
    cdsProdutoAusenteBackupnum_item: TIntegerField;
    QGeraNfeItemCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QNotaImpostoServico: TOracleDataSet1;
    QNotaImpostoServicoVAL_IMPOSTO: TFloatField;
    QNotaImpostoServicoPERC_ALIQUOTA: TFloatField;
    QNfeEmissaoDESC_E_MAIL: TStringField;
    QInfDocIND_SOMA_TOTAIS: TStringField;
    QInfDocNUM_PESO: TFloatField;
    QSeguroMDFe: TOracleDataSet;
    QSeguroMDFeCOD_SEGURO_MDFE: TIntegerField;
    QSeguroMDFeCOD_MANIFESTO: TIntegerField;
    QSeguroMDFeIND_RESP_SEGURO: TIntegerField;
    QSeguroMDFeNUM_APOLICE_SEGURO: TStringField;
    QSeguroMDFeNUM_AVERBACAO_SEGURO: TStringField;
    QSeguroMDFeCOD_SEGURADORA: TIntegerField;
    QSeguroMDFeDESC_CPF_CNPJ_RESP_SEGURO: TStringField;
    QSeguroMDFeDESC_SEGURADORA: TStringField;
    QSeguroMDFeCNPJ_SEGURADORA: TStringField;
    QInfDocCPF_CNPJ_TOMADOR: TStringField;
    QInfDocIND_FISICA_JURIDICA: TStringField;
    QGeraCteIND_CONTRIBUINTE_TOM: TStringField;
    QGeraCteINSCRICAO_MUN_TOM: TStringField;
    QUFPercursoCTe: TOracleDataSet;
    QGeraCteCOD_CADASTRO_TOMADOR: TIntegerField;
    QDocOriginarioCOD_SUBSERIE: TStringField;
    QGeraCteDESC_TAF: TStringField;
    QGeraCteDESC_NRO_REG_ESTADUAL: TStringField;
    QVeiculoCTeDESC_TAF: TStringField;
    QVeiculoCTeDESC_NRO_REG_ESTADUAL: TStringField;
    QAutXML: TOracleDataSet;
    QCteEmissaoCOD_SERIE_MODELO: TStringField;
    QGeraCteVAL_IR: TFloatField;
    QGeraCteVAL_INSS: TFloatField;
    QGeraCteVAL_CSLL: TFloatField;
    QNfeEmissaoIND_IMPRIME_DANFE: TStringField;
    QNfeEmissaoIND_IMPRIME_DANFE_NFCE: TStringField;
    QCteEmissaoIND_IMPRIME_DACTE: TStringField;
    QMdfeEmissaoIND_IMPRIME_DAMDFE: TStringField;
    QGeraCteIND_GLOBALIZADO: TStringField;
    QGeraNfeItemUNIDADE_NCM: TStringField;
    QGeraNfeItemPESO_BRUTO_PRODUTO: TFloatField;
    QGeraNfeItemPESO_LIQUIDO_PRODUTO: TFloatField;
    QGeraCtePERC_ALIQUOTA_DIFERENCIAL: TFloatField;
    QOccCTe: TOracleDataSet;
    QOccCTeDESC_SERIE: TStringField;
    QOccCTeNUM_OCC: TStringField;
    QOccCTeDT_EMI: TDateTimeField;
    QOccCTeCOD_EMITENTE: TIntegerField;
    QOccCTeNUM_CGC_CPF: TStringField;
    QOccCTeNUM_INSCRICAO: TStringField;
    QOccCTeCOD_ESTADO: TStringField;
    QOccCTeDESC_TELEFONE: TStringField;
    QOccCTeIND_FISICA_JURIDICA: TStringField;
    QGeraCteDESC_SERVICO: TStringField;
    QSomaPagamentos: TOracleDataSet1;
    QSomaPagamentosVAL_PAGO: TFloatField;
    QSomaPagamentosVAL_PAGAMENTOS_CONFIRMADOS: TFloatField;
    QGeraNfeIND_PRESENCA: TIntegerField;
    QUFPercursoCTeCOD_UF_PERCURSO: TIntegerField;
    QUFPercursoCTeCOD_ESTADO: TStringField;
    QUFPercursoCTeCOD_CONHECIMENTO: TIntegerField;
    QTitulosNUM_TITULO: TFloatField;
    QGeraCteDESC_OBS: TStringField;
    QGeraNfeItemCOD_CST_IPI: TStringField;
    QNfeDESC_VERSAO_NFE: TStringField;
    QGeraCteIND_CONTRIBUINTE_REM: TStringField;
    QGeraCteIND_CONTRIBUINTE_DEST: TStringField;
    QGeraCteIND_CONTRIBUINTE_EXP: TStringField;
    QGeraCteIND_CONTRIBUINTE_REC: TStringField;
    QGeraCteINSCRICAO_MUN_REM: TStringField;
    QGeraNfeINSCRICAO_FILIAL: TStringField;
    QGeraCteINSCRICAO_FILIAL: TStringField;
    QGeraMdfeINSCRICAO_FILIAL: TStringField;
    QVeiculoCTeNUM_CGC_CPF: TStringField;
    QVeiculoCTeNUM_INSCRICAO: TStringField;
    QGeraNfeItemPERC_GLP_PETROLEO: TFloatField;
    QGeraNfeItemPERC_GNI: TFloatField;
    QGeraNfeItemDESC_ANP: TStringField;
    QGeraNfeItemPERC_FCP: TFloatField;
    QCstIpiEntrada: TOracleDataSet1;
    QCstIpiEntradaCOD_CST_IPI: TStringField;
    QCstIpiEntradaDESC_CST_IPI: TStringField;
    QCstIpiEntradaDESC_COMPLETA: TStringField;
    DSCstIpiEntrada: TDataSource;
    QCstIpiSaida: TOracleDataSet1;
    QCstIpiSaidaORDEM: TFloatField;
    QCstIpiSaidaCOD_CST_IPI: TStringField;
    QCstIpiSaidaDESC_CST_IPI: TStringField;
    QCstIpiSaidaDESC_COMPLETA: TStringField;
    DSCstIpiSaida: TDataSource;
    QCstpisEntrada: TOracleDataSet1;
    QCstpisEntradaCOD_CST_PIS: TStringField;
    QCstpisEntradaDESC_CST_PIS: TStringField;
    QCstpisEntradaDESC_COMPLETA: TStringField;
    DSCstPisEntrada: TDataSource;
    QCstCofinsEntrada: TOracleDataSet1;
    QCstCofinsEntradaCOD_CST_COFINS: TStringField;
    QCstCofinsEntradaDESC_CST_COFINS: TStringField;
    QCstCofinsEntradaDESC_COMPLETA: TStringField;
    DSCstCofinsEntrada: TDataSource;
    DSCstPisSaida: TDataSource;
    QCstCofinsSaida: TOracleDataSet1;
    QCstPisSaida: TOracleDataSet1;
    DSCstCofinsSaida: TDataSource;
    QCstPisSaidaORDEM: TFloatField;
    QCstPisSaidaCOD_CST_PIS: TStringField;
    QCstPisSaidaDESC_CST_PIS: TStringField;
    QCstPisSaidaDESC_COMPLETA: TStringField;
    QCstCofinsSaidaORDEM: TFloatField;
    QCstCofinsSaidaCOD_CST_COFINS: TStringField;
    QCstCofinsSaidaDESC_CST_COFINS: TStringField;
    QCstCofinsSaidaDESC_COMPLETA: TStringField;
    cdsProdutoAusentecod_cst_ipi: TStringField;
    cdsProdutoAusentecod_cst_ipi_saida: TStringField;
    cdsProdutoAusentecod_cst_pis: TStringField;
    cdsProdutoAusentecod_cst_pis_saida: TStringField;
    cdsProdutoAusentecod_cst_cofins: TStringField;
    cdsProdutoAusentecod_cst_cofins_saida: TStringField;
    cdsProdutoXMLcean: TStringField;
    QSomaNfeSVAL_DPI_TRANSGENICOS: TFloatField;
    QSomaNfeSVAL_FACS: TFloatField;
    QSomaNfeSVAL_FETHAB: TFloatField;
    QGeraCteINSCRICAO_MUN_DEST: TStringField;
    cdsProdutoAusentecprod: TStringField;
    cdsProdutoAusenteBackupcprod: TStringField;
    cdsProdutoAusenteind_vinculo_produto_bd: TBooleanField;
    QGeraNfeOBS_COMPLEMENTO: TStringField;
    QNfeDESC_MSG_VALIDACAO_LOTE: TMemoField;
    QNfeDESC_MSG_VALIDACAO: TMemoField;
    QNfeEmissaoIND_CONTINGENCIA_NFCE: TStringField;
    QNfeEmissaoDESC_JUST_CONTINGENCIA_NFCE: TStringField;
    QNfeEmissaoDT_CONTINGENCIA_NFCE: TDateTimeField;
    cdsProdutoAusentecod_marca: TIntegerField;
    cdsProdutoAusenteBackupcod_marca: TIntegerField;
    cdsProdutoAusenteperc_margem_atacado: TIntegerField;
    cdsProdutoAusenteBackupperc_margem_atacado: TIntegerField;
    QGeraNfeCOD_INC_TRIB: TIntegerField;
    cdsProdutoAusenteind_bico: TStringField;
    cdsProdutoAusenteind_solado: TStringField;
    cdsProdutoAusentedesc_time: TStringField;
    cdsProdutoAusentedesc_esporte: TStringField;
    cdsProdutoAusenteind_enfeite: TStringField;
    cdsProdutoAusenteBackupind_solado: TStringField;
    cdsProdutoAusenteBackupind_bico: TStringField;
    cdsProdutoAusenteBackupdesc_time: TStringField;
    cdsProdutoAusenteBackupdesc_esporte: TStringField;
    cdsProdutoAusenteBackupind_enfeite: TStringField;
    cdsProdutoAusentetem_dados_calcados: TBooleanField;
    cdsProdutoAusenteind_cadastrado_bd: TBooleanField;
    QProdutoInformacaoLoteXml: TOracleDataSet1;
    QProdutoInformacaoLoteXmlDESC_CNPJ: TStringField;
    QProdutoInformacaoLoteXmlIND_TAG: TStringField;
    QProdutoInformacaoLoteXmlIND_LOCAL: TStringField;
    cdsProdutoAusentecod_lote_tipo: TIntegerField;
    cdsProdutoAusenteBackupcod_lote_tipo: TIntegerField;
    QAlteraProduto: TOracleDataSet1;
    QAlteraProdutoCOD_CLASSE: TIntegerField;
    QAlteraProdutoCOD_TRIBUTACAO: TIntegerField;
    QAlteraProdutoDESC_PRODUTO: TStringField;
    QAlteraProdutoNUM_EMBALAGEM: TFloatField;
    QAlteraProdutoDESC_UNIDADE: TStringField;
    QAlteraProdutoIND_TIPO_PRODUTO: TStringField;
    QAlteraProdutoNUM_FABRICANTE: TStringField;
    QAlteraProdutoPERC_ISS: TFloatField;
    QAlteraProdutoPERC_INSS: TFloatField;
    QAlteraProdutoIND_SITUACAO: TStringField;
    QAlteraProdutoNUM_VOLUMES: TFloatField;
    QAlteraProdutoNUM_GENERO_NCM: TStringField;
    QAlteraProdutoDESC_COD_BARRA: TStringField;
    QAlteraProdutoIND_SUBST_TRIB: TStringField;
    QAlteraProdutoCOD_CST_IPI: TStringField;
    QAlteraProdutoCOD_CST_IPI_SAIDA: TStringField;
    QAlteraProdutoCOD_CST_PIS: TStringField;
    QAlteraProdutoCOD_CST_PIS_SAIDA: TStringField;
    QAlteraProdutoCOD_CST_COFINS: TStringField;
    QAlteraProdutoCOD_CST_COFINS_SAIDA: TStringField;
    QAlteraProdutoCOD_MARCA: TIntegerField;
    QAlteraProdutoPERC_MARGEM_ATACADO: TFloatField;
    QAlteraProdutoIND_SOLADO: TStringField;
    QAlteraProdutoIND_BICO: TStringField;
    QAlteraProdutoIND_ENFEITE: TStringField;
    QAlteraProdutoDESC_TIME: TStringField;
    QAlteraProdutoDESC_ESPORTE: TStringField;
    cdsProdutoAusenteBackupind_cadastrado_bd: TBooleanField;
    cdsProdutoAusenteBackupcod_cst_ipi: TStringField;
    cdsProdutoAusenteBackupcod_cst_ipi_saida: TStringField;
    cdsProdutoAusenteBackupcod_cst_pis: TStringField;
    cdsProdutoAusenteBackupcod_cst_pis_saida: TStringField;
    cdsProdutoAusenteBackupcod_cst_cofins: TStringField;
    cdsProdutoAusenteBackupcod_cst_cofins_saida: TStringField;
    QProdutoXMLProdutoBD: TOracleDataSet1;
    QProdutoXMLProdutoBDCPROD: TStringField;
    QProdutoXMLProdutoBDCOD_FORNECEDOR_XML: TIntegerField;
    QProdutoXMLProdutoBDCOD_PRODUTO: TFloatField;
    QAlteraProdutoVAL_VAREJO: TFloatField;
    cdsProdutoAusentedesc_produto_aux: TStringField;
    cdsProdutoAusenteBackupdesc_produto_aux: TStringField;
    cdsProdutoAusenteBackupind_vinculo_produto_bd: TBooleanField;
    QProdutoXMLProdutoBDDESC_PRODUTO_XML: TStringField;
    QProdutoXMLProdutoBDNUM_ITEM: TIntegerField;
    QGeraCteIND_TIPO_FRETAMENTO: TIntegerField;
    QGeraCteDT_VIAGEM: TDateTimeField;
    QGeraCteHORA_VIAGEM: TStringField;
    QGeraNfeItemPERC_BASE_SUBST: TFloatField;
    QGeraNfeItemCOD_BENEF_FISCAL_REDUCAO: TStringField;
    QGeraNfeItemCOD_BENEF_FISCAL_IMUNIDADE: TStringField;
    QGeraNfeItemCOD_BENEF_FISCAL_ISENCAO: TStringField;
    QGeraNfeItemCOD_BENEF_FISCAL_SUSPENSAO: TStringField;
    QGeraNfeItemCOD_BENEF_FISCAL_DIFERIMENTO: TStringField;
    QGeraNfeItemNUM_CLASSIFICACAO: TStringField;
    QGeraNfeCOD_BENEF_FISCAL: TStringField;
    QGeraNfeItemDESC_OBSERVACAO_TR: TStringField;
    QProdutoLoteItem: TOracleDataSet1;
    QProdutoLoteItemCOD_PRODUTO_LOTE_ITEM: TIntegerField;
    QProdutoLoteItemCPROD: TStringField;
    QProdutoLoteItemCOD_FORNECEDOR_XML: TIntegerField;
    QProdutoLoteItemCOD_PRODUTO: TFloatField;
    QProdutoLoteItemNUM_ITEM: TIntegerField;
    QProdutoLoteItemCOD_LOTE_TIPO: TIntegerField;
    QProdutoLoteItemQT_QUANTIDADE: TFloatField;
    QAutXMLNUM_CGC_CPF: TStringField;
    cdsProdutoAusentecfop: TStringField;
    cdsProdutoAusenteBackupcfop: TStringField;
    QVeiculoMDFeDESC_PLACA: TStringField;
    QVeiculoMDFeDESC_RENAVAN: TStringField;
    QVeiculoMDFeNUM_TARA: TIntegerField;
    QVeiculoMDFeVAL_MAX_CARGA: TIntegerField;
    QVeiculoMDFeVAL_VOLUME: TFloatField;
    QVeiculoMDFeIND_TIPO_PROPRIEDADE: TStringField;
    QVeiculoMDFeIND_TIPO_VEICULO: TIntegerField;
    QVeiculoMDFeIND_TIPO_RODADO: TStringField;
    QVeiculoMDFeIND_TIPO_CARROCERIA: TStringField;
    QVeiculoMDFeCOD_ESTADO: TStringField;
    QVeiculoMDFeIND_TIPO_PROPRIETARIO: TIntegerField;
    QVeiculoMDFeNUM_CGC_CPF: TStringField;
    QVeiculoMDFeDESC_RNTRC: TStringField;
    QVeiculoMDFeNOME: TStringField;
    QVeiculoMDFeNUM_INSCRICAO: TStringField;
    QVeiculoMDFeESTADO_PROPRIETARIO: TStringField;
    QVeiculoMDFeIND_FISICA_JURIDICA: TStringField;
    QGeraNfeDESC_VERSAO_NFSE: TStringField;
    QNfeEmissaoDESC_VERSAO_NFSE: TStringField;
    QGeraNfeCOD_UF_IBGE_PRESTACAO: TIntegerField;
    QGeraNfeCOD_CIDADE_IBGE_PRESTACAO: TStringField;
    QGeraNfeCOD_CIDADE_PRESTACAO: TIntegerField;
    QGeraNfeItemNUM_PEDIDO_COMPRA: TStringField;
    QGeraNfeItemNUM_PEDIDO_COMPRA_ITEM: TIntegerField;
    QSomaNfeSVAL_CSLL: TFloatField;
    QSomaNfeSVAL_INSS: TFloatField;
    QGeraMdfeIND_LOTACAO: TStringField;
    QGeraMdfeIND_TIPO_CARGA: TIntegerField;
    QGeraMdfeCOD_PRODUTO: TIntegerField;
    QGeraMdfeDESC_CEP_CARREGA: TStringField;
    QGeraMdfeDESC_LATITUDE_DESCARREGA: TStringField;
    QGeraMdfeDESC_PRODUTO: TStringField;
    QGeraMdfeNUM_GENERO_NCM: TStringField;
    QGeraMdfeDESC_COD_BARRA: TStringField;
    QInfXmlSefa: TOracleDataSet1;
    QInfXmlSefaCOD_INF_XML_SEFA: TIntegerField;
    QInfXmlSefaCOD_FILIAL: TIntegerField;
    QInfXmlSefaDESC_CHAVE_ACESSO: TStringField;
    QInfXmlSefaDESC_CNPJ: TStringField;
    QInfXmlSefaDESC_NOME: TStringField;
    QInfXmlSefaDT_EMISSAO: TDateTimeField;
    QInfXmlSefaIND_ENTRADA_SAIDA: TIntegerField;
    QInfXmlSefaVAL_TOTAL: TFloatField;
    QInfXmlSefaDESC_PROTOCOLO: TStringField;
    QInfXmlSefaIND_SITUACAO_NOTA: TIntegerField;
    QInfXmlSefaNUM_NSU: TFloatField;
    QInfXmlSefaIND_SITUACAO: TStringField;
    QInfXmlSefaNUM_NOTA: TIntegerField;
    QInfXmlSefaNUM_SERIE: TIntegerField;
    QInfXmlSefaCons: TOracleDataSet1;
    QInfXmlSefaConsCOD_INF_XML_SEFA: TIntegerField;
    QInfXmlSefaConsCOD_FILIAL: TIntegerField;
    QInfXmlSefaConsDESC_CHAVE_ACESSO: TStringField;
    QInfXmlSefaConsDESC_CNPJ: TStringField;
    QInfXmlSefaConsDESC_NOME: TStringField;
    QInfXmlSefaConsDT_EMISSAO: TDateTimeField;
    QInfXmlSefaConsTIPO_NFE: TStringField;
    QInfXmlSefaConsVAL_TOTAL: TFloatField;
    QInfXmlSefaConsDESC_PROTOCOLO: TStringField;
    QInfXmlSefaConsSITUACAO_NOTA: TStringField;
    QInfXmlSefaConsNUM_NSU: TFloatField;
    QInfXmlSefaConsIND_SITUACAO: TStringField;
    QInfXmlSefaConsNUM_NOTA: TIntegerField;
    QInfXmlSefaConsNUM_SERIE: TIntegerField;
    QGeraNfeIND_PIS_COFINS_RETIDO: TStringField;
    QGeraNfeItemVAL_ST_ANTERIOR_RETIDO: TFloatField;
    QGeraNfeItemVAL_BASE_ST_ANTERIOR_RETIDO: TFloatField;
    QSomaNfeSVAL_BASE_ST_ANTERIOR_RETIDO: TFloatField;
    QSomaNfeSVAL_ST_ANTERIOR_RETIDO: TFloatField;
    QGeraNfeItemPERC_ST_ANTERIOR_RETIDO: TFloatField;
    QSomaNfeSVAL_IR: TFloatField;
    QValePedagio: TOracleDataSet;
    QValePedagioCOD_VALE_PEDAGIO: TIntegerField;
    QValePedagioNUM_CNPJ_FORNECEDOR: TStringField;
    QValePedagioNUM_COMPRA: TStringField;
    QValePedagioVAL_VALE_PEDAGIO: TFloatField;
    QValePedagioCOD_MANIFESTO: TIntegerField;
    QValePedagioNUM_CPF_CNPJ_TOMADOR: TStringField;
    QGeraNfeIND_INTERMEDIADOR: TStringField;
    QValePedagioIND_TIPO_VALE_PEDAGIO: TStringField;
    QValePedagioIND_COMBINACAO_VEICULAR: TStringField;
    QGeraNfeItemNUM_FABRICANTE: TStringField;
    QGeraNfeOBS: TStringField;
    QGeraNfeItemDESC_LOTE: TStringField;
    QGeraNfeItemDT_VENCIMENTO_LOTE: TDateTimeField;
    QGeraNfeItemDT_FABRICACAO_LOTE: TDateTimeField;
    QGeraNfeItemQT_LOTE: TFloatField;
    QGeraNfeItemCOD_PRODUTO_ANVISA: TStringField;
    QGeraNfeItemDESC_MOTIVO_ISENCAO_ANVISA: TStringField;
    QGeraNfeItemVAL_PRECO_MAXIMO_CONSUMIDOR: TFloatField;
    QGeraNfeItemPERC_AD_REM_ICMS: TFloatField;
    QGeraNfeItemIND_IMPORT_COMB: TIntegerField;
    QGeraNfeItemUF_ORIGEM_COMB: TStringField;
    QGeraNfeItemPERC_ORIG_UF_COMB: TFloatField;
    QGeraCteEventoID_EVENTO: TStringField;
    QGeraNfeDESC_OBS_CORPO_NOTA: TStringField;
    QGeraNfeItemCOD_CST_IPI_ENQU_IMUNE: TStringField;
    QGeraNfeItemCOD_CST_IPI_ENQU_SUSPENSAO: TStringField;
    QGeraNfeItemCOD_CST_IPI_ENQU_ISENCAO: TStringField;
    QSomaNfeSQT_TOTAL_SERVICOS: TFloatField;
    QInfDocDT_VENCIMENTO: TDateTimeField;
    QInfDocNOME: TStringField;
    QInfDocIND_FORMA_PGTO: TIntegerField;
    QInfDocCOD_BANCO: TIntegerField;
    QInfDocCOD_AGENCIA: TIntegerField;
    QInfDocVAL_TOTAL_CTE: TFloatField;
    QGeraNfeItemVAL_IBS_MUN: TFloatField;
    QGeraNfeItemVAL_IBS_EST: TFloatField;
    QGeraNfeItemVAL_CBS: TFloatField;
    QGeraNfeItemVAL_IS: TFloatField;
    QGeraNfeItemVAL_BC_IBS_CBS: TFloatField;
    QSomaNfeSVAL_IBS_MUN: TFloatField;
    QSomaNfeSVAL_IBS_EST: TFloatField;
    QSomaNfeSVAL_IS: TFloatField;
    QSomaNfeSVAL_CBS: TFloatField;
    QSomaNfeSVAL_BC_IBS_CBS: TFloatField;
    QGeraNfeNUM_CFOP: TFloatField;
    QGeraNfeItemCOD_NBS: TIntegerField;
    QNfeEmissaoID_LOTE: TFloatField;
    QGeraNfeNUM_DCO: TStringField;
    QGeraNfeNUM_ART: TStringField;
    QPagamentoDESC_PAGAMENTO: TStringField;
    QGeraCteVAL_IBS_MUN: TFloatField;
    QGeraCteVAL_IBS_EST: TFloatField;
    QGeraCteVAL_IBS_TOTAL: TFloatField;
    QGeraCteVAL_CBS_TOTAL: TFloatField;
    QGeraCteVAL_IS_TOTAL: TFloatField;
    QGeraCteVAL_BC_IBS_CBS: TFloatField;
    QGeraCteDESC_CIOT: TStringField;
    QInfDocDESC_CIOT: TStringField;
    QGeraNfeCIDADE_PRESTACAO: TStringField;
    QGeraNfeIND_AMBIENTE_NFSE_FILIAL: TIntegerField;
    QGeraNfeItemNUM_CLASS_TRIB_IBS_CBS: TStringField;
    QGeraNfeItemNUM_CST_IBS_CBS: TStringField;
    QGeraNfeItemSVAL_TOTAL_ITEM: TFloatField;
    QGeraNfeItemPERC_IBS_UF: TFloatField;
    QGeraNfeItemPERC_IBS_MUN: TFloatField;
    QGeraNfeItemPERC_CBS: TFloatField;
    QProdutoXml: TOracleDataSet1;
    QProdutoXmlCPROD: TStringField;
    QProdutoXmlCOD_FORNECEDOR_XML: TIntegerField;
    QProdutoXmlCOD_PRODUTO: TFloatField;
    QProdutoXmlDESC_PRODUTO_XML: TStringField;
    QProdutoXmlDESC_COD_BARRA: TStringField;
    QGeraNfeItemPERC_REDUCAO_IBS: TIntegerField;
    QGeraNfeItemPERC_REDUCAO_CBS: TIntegerField;
    QProdutoXmlCOD_USUARIO: TIntegerField;
    QGeraCteNUM_CST_IBS_CBS: TStringField;
    QGeraCteNUM_CLASS_TRIB_IBS_CBS: TStringField;
    QGeraCtePERC_IBS_UF_DESTINO: TFloatField;
    QGeraCtePERC_IBS_MUN_DESTINO: TFloatField;
    QGeraCtePERC_REDUCAO_IBS: TFloatField;
    QGeraCtePERC_REDUCAO_CBS: TFloatField;
    QGeraCtePERC_CBS: TFloatField;
    QGeraNfeItemIND_GRUPO_TRIB_REGULAR: TStringField;
    QGeraNfeItemVAL_IBS_MUN_REGULAR: TFloatField;
    QGeraNfeItemVAL_IBS_EST_REGULAR: TFloatField;
    QGeraNfeItemVAL_CBS_REGULAR: TFloatField;
    QGeraNfeItemNUM_CST_IBS_CBS_REGULAR: TStringField;
    QGeraNfeItemNUM_CLASS_TRIB_IBS_CBS_REGULAR: TStringField;
    QGeraNfeItemIND_GRUPO_MONO_PADRAO: TStringField;
    QGeraNfeItemIND_GRUPO_MONO_RETEN: TStringField;
    QGeraNfeItemIND_GRUPO_MONO_RET: TStringField;
    QGeraNfeItemIND_GRUPO_MONO_DIF: TStringField;
    QGeraNfeItemIND_GRUPO_ESTORNO_CRED: TStringField;
    QGeraMdfeDESC_LONGITUDE_CARREGA: TStringField;
    QGeraMdfeDESC_LONGITUDE_DESCARREGA: TStringField;
    QGeraMdfeDESC_LATITUDE_CARREGA: TStringField;
    QGeraMdfeDESC_CEP_DESCARREGA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure QNfeConsCalcFields(DataSet: TDataSet);
    procedure QNfeCalcFields(DataSet: TDataSet);
    procedure QNfeConsEntrCalcFields(DataSet: TDataSet);
    procedure QNfeStatusServicoCalcFields(DataSet: TDataSet);
    procedure QGeraNfeAfterOpen(DataSet: TDataSet);
    procedure QGeraNfeBeforeClose(DataSet: TDataSet);
    procedure QSomaNfeCalcFields(DataSet: TDataSet);
    procedure QSomaNfeAfterOpen(DataSet: TDataSet);
    procedure cdsProdutoXMLAfterScroll(DataSet: TDataSet);
    procedure QNfeEmissaoBeforeOpen(DataSet: TDataSet);
    procedure QManifestDestCalcFields(DataSet: TDataSet);
    procedure QManifestDestTP_EVENTOChange(Sender: TField);
    procedure QGeraCteCalcFields(DataSet: TDataSet);
    procedure QCteEmissaoBeforeOpen(DataSet: TDataSet);
    procedure QCteCalcFields(DataSet: TDataSet);
    procedure QGeraCteAfterOpen(DataSet: TDataSet);
    procedure QMdfeEmissaoBeforeOpen(DataSet: TDataSet);
    procedure QMdfeCalcFields(DataSet: TDataSet);
    procedure cdsProdutoAusenteBeforePost(DataSet: TDataSet);
    procedure QProdutoLoteItemBeforeDelete(DataSet: TDataSet);
    procedure QProdutoLoteItemBeforeInsert(DataSet: TDataSet);
    procedure QProdutoXmlBeforeEdit(DataSet: TDataSet);
    procedure QProdutoXmlBeforeInsert(DataSet: TDataSet);
    procedure QProdutoXmlBeforePost(DataSet: TDataSet);
    procedure QProdutoXmlBeforeDelete(DataSet: TDataSet);
  private
    msgs: TVariantMap;
    formaPagNFCe: TVariantMap;
    RedesAutorizadoras: TVariantMap;
    BandeirasCartoes: TVariantMap;
    wPeso :Double;
    wPesoBruto :Double;
    wVolumes :Double;
    wPesquisar: Boolean;
    wVinculaProdutosPorCodigo: Boolean;
    wVinculaProdutosPorCodigoBarras: Boolean;
    wCodForImportacaoXML: integer;
    function CodigoNFpelaChave(Chave: String): Integer;

    function ExisteNfe(chaveAcesso: String; table: String = 'TB_NF_ELETRONICA'): Boolean;
    procedure Calc_Peso_Nota;
  public
    procedure InutilizaNumeracaoNfe; overload;
    procedure InutilizaNumeracaoNfe(CodFilial: Integer; Serie: String;
              NumInicial, NumFinal: Integer; Estado, Justificativa: String; Ambiente, Modelo: Integer); overload;
    procedure InutilizaNumeracaoCTe;
    procedure ConsultaMDFesNaoEncerrados;
    procedure EmiteCCe(CodNota: Integer);
    procedure RegistraEventoMDFe(CodManifesto, TpEvento: Integer; JustCancMDFe: String = '');
    procedure RegistraEventoCTe(CodConhecimento, TpEvento: Integer; JustCancCTe: String = '');
    function ConsultaCadastro(Filial: Integer; UFCadastro, ParamConsulta: String): String;
    procedure EmiteManifestacaoDestinatario();
    procedure ExportaNFes(Filial, Cadastro: Integer; DataInicial, DataFinal: TDateTime; Saida, Entrada, Xml, Pdf, NFe: Boolean; Caminho: String);
    procedure ExportaCTes(Filial, Remetente, Destinatario: Integer; DataInicial,
              DataFinal: TDateTime; Xml, Pdf: Boolean; Caminho: String; Cancelado: Boolean);
    procedure ExportaMDFes(Filial: Integer; DataInicial,
              DataFinal: TDateTime; Xml, Pdf: Boolean; Caminho: String);
    procedure ImprimeCCe(CodNota: Integer);
    procedure ImprimeCCeCTe(CodConhecimento: Integer);
    procedure EnviarEmailCCe(CodNota: Integer; Xml, Pdf: Boolean);
    procedure EnviarEmailCCeCTe(CodConhecimento: Integer; Xml, Pdf: Boolean);
    function PreparaEmailCCe(CodNota: Integer; Xml, Pdf: Boolean): TObject;
    function PreparaEmailCCeCTe(CodConhecimento: Integer; Xml, Pdf: Boolean): TObject;
    procedure SalvarCCePdf(CodNota: Integer; Caminho: String);
    procedure SalvarCCeCTePdf(CodConhecimento: Integer; Caminho: String);
    procedure SetaNfe(Chave: String; ForcarAtualizar: Boolean = False);
    procedure SetaCte(Chave: String; ForcarAtualizar: Boolean = False);
    procedure SetaMdfe(Chave: String; ForcarAtualizar: Boolean = False);
    procedure SetaNfeConsEntr(Chave: String; ForcarAtualizar: Boolean = False);
    procedure DenegaNfe(Chave :String; Voltar :Boolean = False);
    //function BlockStr(Str: String): String;
    function getWSMessage(codMsg: Integer): String;
    function LimpaChave(Chave: String): String;
    function LimpaStrXML(wStr: String; exce: String = ''): String;
    function Salva(Caminho: String; Str: TStrings; Nome: String; Filial: String = ''): Boolean;
    procedure ValidaNfe(cod_nota_cab :Integer = 0);
    function ValidaCte(cod_conhecimento :Integer = 0): Boolean;
    function ValidaMdfe(cod_manifesto :Integer = 0): Boolean;
    procedure ValidaNfse(cod_nota_cab : Integer = 0);
    function EmissaoNfe(CodNota: Integer; IdLote: Int64 = 0; EnviarNFe: Boolean = False): Boolean;
    function EmissaoCte(CodConhecimento: Integer; IdLote: Int64 = 0; EnviarCTe: Boolean = False): Boolean;
    function EmissaoMdfe(CodManifesto: Integer; IdLote: Int64 = 0; EnviarMDFe: Boolean = False): Boolean;
    function ExecutaAcoes(Acoes: TList; MostraResultado: Boolean = True): Integer; overload;
    function ExecutaAcoes(Acoes: TExecucoesList; MostraResultado: Boolean = True): Integer; overload;
    procedure SalvaXML(Chave, Nome, XmlNFe, XmlRetorno: String);
    procedure SalvaXMLCTe(Nome, XmlCTe, XmlRetorno: String);
    procedure SalvaXMLMDFe(Chave, Nome, XmlMDFe, XmlRetorno: String);
    function GetFuso(UF: String): String;
    function BaixaXMLNFe(Filial: Integer; Chave: String): String;
    procedure ConsultarNFes(Filial: Integer);
    property Peso :Double read WPeso write WPeso;
    property PesoBruto :Double read WPesoBruto write WPesoBruto;
    property Volumes :Double read wVolumes write wVolumes;
    property Pesquisar: Boolean read wPesquisar write wPesquisar;
    property pFormaPagNFCe: TVariantMap read formaPagNFCe;
    property pRedesAutorizadoras: TVariantMap read RedesAutorizadoras;
    property pBandeirasCartoes: TVariantMap read BandeirasCartoes;
    property pVinculaProdutosPorCodigo: boolean read wVinculaProdutosPorCodigo
      write wVinculaProdutosPorCodigo;
    property pVinculaProdutosPorCodigoBarras: boolean read wVinculaProdutosPorCodigoBarras
      write wVinculaProdutosPorCodigoBarras;
    property pCodForImportacaoXML: integer read wCodForImportacaoXML write wCodForImportacaoXML;
    function TiraCaracteresEspeciais(pTexto: string): string;
  end;

  TNfeExecucao = class(TInterfacedPersistent, IExecucaoSimples)
  protected
    FRetorno: TNFeRPCRetorno;
    FServidor: String;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Executar(DadosExecucao: TDadosExecucao); virtual; abstract;
    property Retorno: TNFeRPCRetorno read FRetorno;
    property Servidor: String read FServidor write FServidor;
  end;
  //===================== Classes da NF-e ==============================\\
  TExecucaoEnviaLote = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
    FConsultar: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer; Consultar: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Consultar: Boolean read FConsultar write FConsultar;

  end;

  TExecucaoSalvaDanfePdf = class(TNfeExecucao)
  protected
    FChave: String;
    FCaminho: String;
    FNota: Integer;
    FNFe: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String;
        Nota: Integer; NFe: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property Nota: Integer read FNota write FNota;
    property NFe: Boolean read FNFe write FNFe;
  end;

  TExecucaoExportaNFes = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCadastro: Integer;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FSaida: Boolean;
    FEntrada: Boolean;
    FXml: Boolean;
    FPdf: Boolean;
    FNFe: Boolean;
    FCaminho: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, Cadastro: Integer; DataInicial, DataFinal: TDateTime;
        Saida, Entrada, Xml, Pdf, NFe: Boolean; Caminho: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property Cadastro: Integer read FCadastro write FCadastro;
    property DataInicial: TDate read FDataInicial write FDataInicial;
    property DataFinal: TDate read FDataFinal write FDataFinal;
    property Saida: Boolean read FSaida write FSaida;
    property Entrada: Boolean read FEntrada write FEntrada;
    property Xml: Boolean read FXml write FXml;
    property Pdf: Boolean read FPdf write FPdf;
    property NFe: Boolean read FNFe write FNFe;
    property Caminho: String read FCaminho write FCaminho;
  end;

  TExecucaoSalvaCCePdf = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FCaminho: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Caminho: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Caminho: String read FCaminho write FCaminho;
  end;

  TExecucaoImprimeDanfe = class(TNfeExecucao)
  protected
    FChave: String;
    FImpressora: String;
    FCopias: Integer;
    FNota: Integer;
    FNFe: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Impressora: String;
        Copias, Nota: Integer; NFe: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Impressora: String read FImpressora write FImpressora;
    property Copias: Integer read FCopias write FCopias;
    property Nota: Integer read FNota write FNota;
    property NFe: Boolean read FNFe write FNFe;
  end;

  TExecucaoImprimeCCe = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FImpressora: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Impressora: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Impressora: String read FImpressora write FImpressora;
  end;

  TExecucaoEnviaEmail = class(TNfeExecucao)
  protected
    FChave: String;
    FEmail: String;
    FAssunto: String;
    FCorpo: String;
    FXML: Boolean;
    FPDF: Boolean;
    FNota: Integer;
    FNFe: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Email, Assunto, Corpo: String;
        XML, PDF: Boolean; Nota: Integer; NFe: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Email: String read FEmail write FEmail;
    property Assunto: String read FAssunto write FAssunto;
    property Corpo: String read FCorpo write FCorpo;
    property XML: Boolean read FXML write FXML;
    property PDF: Boolean read FPDF write FPDF;
    property Nota: Integer read FNota write FNota;
    property NFe: Boolean read FNFe write FNFe;
  end;

  TExecucaoConsultaLote = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
  end;

  TExecucaoInutilizaNum = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FSerie: Integer;
    FAmbiente: Integer;
    FNumIni: Integer;
    FNumFim: Integer;
    FJustificativa: String;
    FTpEmissao: Integer;
    FModelo: Integer;
    FCodUsuario: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Serie, Ambiente,
        NumIni, NumFim: Integer; Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Serie: Integer read FSerie write FSerie;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumIni: Integer read FNumIni write FNumIni;
    property NumFim: Integer read FNumFim write FNumFim;
    property Justificativa: String read FJustificativa write FJustificativa;
    property TpEmissao: Integer read FTpEmissao write FTpEmissao;
    property Modelo: Integer read FModelo write FModelo;
    property CodUsuario: Integer read FCodUsuario write FCodUsuario;
  end;

  TExecucaoConsultaProtocolo = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FNumNota: Integer;
    FChave: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente, NumNota: Integer;
        Chave: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumNota: Integer read FNumNota write FNumNota;
    property Chave: String read FChave write FChave;
  end;

  TExecucaoConsultaCadastro = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FUFCadastro: String;
    FParamConsulta: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial: Integer; UFCadastro: String;
                        ParamConsulta: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property UFCadastro: String read FUFCadastro write FUFCadastro;
    property ParamConsulta: String read FParamConsulta write FParamConsulta;
  end;

 TExecucaoCancela = class(TNfeExecucao)
  protected
    FIdLote: Longint;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FNumNota: Integer;
    FChave: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE, Ambiente, NumNota: Integer; Chave: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Longint read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumNota: Integer read FNumNota write FNumNota;
    property Chave: String read FChave write FChave;
  end;

  TExecucaoStatus = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FTpEmissao: Integer;
    FModelo: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente: Integer;
        TpEmissao: Integer; Modelo: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property TpEmissao: Integer read FTpEmissao write FTpEmissao;
    property Modelo: Integer read FModelo write FModelo; 
  end;

  TExecucaoCartaCorrecao = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FCOrgao: Integer;
    FAmbiente: Integer;
    FChaveAcesso: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; COrgao, Ambiente: Integer; ChaveAcesso:String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property COrgao: Integer read FCOrgao write FCOrgao;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
  end;
  TExecucaoManifestacaoDest = class(TNfeExecucao)
  protected
    FIdLote: Longint;
    FCOrgao: Integer;
    FAmbiente: Integer;
    FNumNota: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote: Longint; COrgao, Ambiente: Integer; NumNota:Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Longint read FIdLote write FIdLote;
    property COrgao: Integer read FCOrgao write FCOrgao;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumNota: Integer read FNumNota write FNumNota;
  end;
  TExecucaoEnviaEmailCCe = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FEmail: String;
    FAssunto: String;
    FCorpo: String;
    FXML: Boolean;
    FPDF: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Email, Assunto, Corpo: String;
        XML, PDF: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Email: String read FEmail write FEmail;
    property Assunto: String read FAssunto write FAssunto;
    property Corpo: String read FCorpo write FCorpo;
    property XML: Boolean read FXML write FXML;
    property PDF: Boolean read FPDF write FPDF;
  end;

  TExecucaoPreVisualizaDanfe = class(TNfeExecucao)
  protected
    FChave: String;
    FCaminho: String;
    FNota: Integer;
    FNFe: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String;
        Nota: Integer; NFe: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property Nota: Integer read FNota write FNota;
    property NFe: Boolean read FNFe write FNFe;
  end;

  TExecucaoBaixaXMLNFe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FAmbiente: Integer;
    FChave: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, Ambiente: Integer; Chave: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property Chave: String read FChave write FChave;
  end;

  TExecucaoConsultaNFes = class(TNfeExecucao)
  protected
    FFilial: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
  end;

//===================== Classes do CT-e ==============================\\

  TExecucaoEnviaLoteCTe = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
    FConsultar: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer; Consultar: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Consultar: Boolean read FConsultar write FConsultar;
  end;

  TExecucaoSalvaDactePdf = class(TNfeExecucao)
  protected
    FChave: String;
    FCaminho: String;
    FCTe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String;
        CTe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property CTe: Integer read FCTe write FCTe;
  end;

  TExecucaoPreVisualizaDacte = class(TNfeExecucao)
  protected
    FChave: String;
    FCaminho: String;
    FCTe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String;
        CTe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property CTe: Integer read FCTe write FCTe;
  end;

  TExecucaoExportaCTes = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FRemetente: Integer;
    FDestinatario: Integer;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FXml: Boolean;
    FPdf: Boolean;
    FCaminho: String;
    FCancelado: Boolean;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, Remetente, Destinatario: Integer; DataInicial, DataFinal: TDateTime;
        Xml, Pdf: Boolean; Caminho: String; Cancelado: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property Remetente: Integer read FRemetente write FRemetente;
    property Destinatario: Integer read FDestinatario write FDestinatario;
    property DataInicial: TDate read FDataInicial write FDataInicial;
    property DataFinal: TDate read FDataFinal write FDataFinal;
    property Xml: Boolean read FXml write FXml;
    property Pdf: Boolean read FPdf write FPdf;
    property Caminho: String read FCaminho write FCaminho;
    property Cancelado: Boolean read FCancelado write FCancelado;
  end;

  TExecucaoSalvaCCeCTePdf = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FCaminho: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Caminho: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Caminho: String read FCaminho write FCaminho;
  end;

  TExecucaoImprimeDacte = class(TNfeExecucao)
  protected
    FChave: String;
    FImpressora: String;
    FCopias: Integer;
    FCTe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Impressora: String;
        Copias, CTe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Impressora: String read FImpressora write FImpressora;
    property Copias: Integer read FCopias write FCopias;
    property CTe: Integer read FCTe write FCTe;
  end;

  TExecucaoImprimeCCeCTe = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FImpressora: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Impressora: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Impressora: String read FImpressora write FImpressora;
  end;

  TExecucaoEnviaEmailCTe = class(TNfeExecucao)
  protected
    FChave: String;
    FEmail: String;
    FAssunto: String;
    FCorpo: String;
    FXML: Boolean;
    FPDF: Boolean;
    FCTe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Email, Assunto, Corpo: String;
        XML, PDF: Boolean; CTe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Email: String read FEmail write FEmail;
    property Assunto: String read FAssunto write FAssunto;
    property Corpo: String read FCorpo write FCorpo;
    property XML: Boolean read FXML write FXML;
    property PDF: Boolean read FPDF write FPDF;
    property CTe: Integer read FCTe write FCTe;
  end;

  TExecucaoConsultaLoteCTe = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
  end;

  TExecucaoInutilizaNumCTe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FSerie: Integer;
    FAmbiente: Integer;
    FNumIni: Integer;
    FNumFim: Integer;
    FJustificativa: String;
    FTpEmissao: Integer;
    FModelo: Integer;
    FCodUsuario: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Serie, Ambiente,
        NumIni, NumFim: Integer; Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Serie: Integer read FSerie write FSerie;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumIni: Integer read FNumIni write FNumIni;
    property NumFim: Integer read FNumFim write FNumFim;
    property Justificativa: String read FJustificativa write FJustificativa;
    property TpEmissao: Integer read FTpEmissao write FTpEmissao;
    property Modelo: Integer read FModelo write FModelo;
    property CodUsuario: Integer read FCodUsuario write FCodUsuario;
  end;

  TExecucaoConsultaProtocoloCTe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FNumCTe: Integer;
    FChave: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente, NumCTe: Integer;
        Chave: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumCTe: Integer read FNumCTe write FNumCTe;
    property Chave: String read FChave write FChave;
  end;

  TExecucaoConsultaCadastroCTe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FUFCadastro: String;
    FTipoParamConsulta: Integer;
    FParamConsulta: String;
    FAmbiente: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE: Integer; UFCadastro: String;
                        TipoParamConsulta: Integer; ParamConsulta: String; Ambiente:Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property UFCadastro: String read FUFCadastro write FUFCadastro;
    property TipoParamConsulta: Integer read FTipoParamConsulta write FTipoParamConsulta;
    property ParamConsulta: String read FParamConsulta write FParamConsulta;
    property Ambiente: Integer read FAmbiente write FAmbiente;
  end;

  TExecucaoStatusCTe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FTpEmissao: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente: Integer;
        TpEmissao: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property TpEmissao: Integer read FTpEmissao write FTpEmissao;
  end;
  
  TExecucaoEnviaEmailCCeCTe = class(TNfeExecucao)
  protected
    FIdEvento: String;
    FEmail: String;
    FAssunto: String;
    FCorpo: String;
    FXML: Boolean;
    FPDF: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdEvento: String; Email, Assunto, Corpo: String;
        XML, PDF: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdEvento: String read FIdEvento write FIdEvento;
    property Email: String read FEmail write FEmail;
    property Assunto: String read FAssunto write FAssunto;
    property Corpo: String read FCorpo write FCorpo;
    property XML: Boolean read FXML write FXML;
    property PDF: Boolean read FPDF write FPDF;
  end;

  TExecucaoEventoCTe = class(TNfeExecucao)
  protected
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FIdEvento: String;
    FCTe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; CodUFIBGE, Ambiente, CTe: Integer;
        IdEvento: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property IdEvento: String read FIdEvento write FIdEvento;
    property CTe: Integer read FCTe write FCTe;
  end;

//===================== Classes do MDF-e ==============================\\

  TExecucaoEnviaLoteMDFe = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
    FConsultar: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer; Consultar: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Consultar: Boolean read FConsultar write FConsultar;
  end;

  TExecucaoSalvaDamdfePdf = class(TNfeExecucao)
  protected
    FChave: String;
    FCaminho: String;
    FMDFe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String; MDFe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property MDFe: Integer read FMDFe write FMDFe;
  end;

  TExecucaoPreVisualizaDamdfe = class(TNFeExecucao)    
  protected
    FChave: String;
    FCaminho: String;
    FMDFe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Caminho: String;
        MDFe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Caminho: String read FCaminho write FCaminho;
    property MDFe: Integer read FMDFe write FMDFe;
  end;

  TExecucaoExportaMDFes = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FXml: Boolean;
    FPdf: Boolean;
    FCaminho: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial: Integer; DataInicial, DataFinal: TDateTime;
        Xml, Pdf: Boolean; Caminho: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property DataInicial: TDate read FDataInicial write FDataInicial;
    property DataFinal: TDate read FDataFinal write FDataFinal;
    property Xml: Boolean read FXml write FXml;
    property Pdf: Boolean read FPdf write FPdf;
    property Caminho: String read FCaminho write FCaminho;
  end;

  TExecucaoImprimeDamdfe = class(TNfeExecucao)
  protected
    FChave: String;
    FImpressora: String;
    FCopias: Integer;
    FMDFe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Impressora: String;
        Copias, MDFe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Impressora: String read FImpressora write FImpressora;
    property Copias: Integer read FCopias write FCopias;
    property MDFe: Integer read FMDFe write FMDFe;
  end;

  TExecucaoEnviaEmailMDFe = class(TNfeExecucao)
  protected
    FChave: String;
    FEmail: String;
    FAssunto: String;
    FCorpo: String;
    FXML: Boolean;
    FPDF: Boolean;
    FMDFe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Chave, Email, Assunto, Corpo: String;
        XML, PDF: Boolean; MDFe: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Chave: String read FChave write FChave;
    property Email: String read FEmail write FEmail;
    property Assunto: String read FAssunto write FAssunto;
    property Corpo: String read FCorpo write FCorpo;
    property XML: Boolean read FXML write FXML;
    property PDF: Boolean read FPDF write FPDF;
    property MDFe: Integer read FMDFe write FMDFe;
  end;

  TExecucaoConsultaLoteMDFe = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodUFIBGE: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodUFIBGE: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
  end;

  TExecucaoConsultaProtocoloMDFe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FNumMDFe: Integer;
    FChave: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente, NumMDFe: Integer;
        Chave: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property NumMDFe: Integer read FNumMDFe write FNumMDFe;
    property Chave: String read FChave write FChave;
  end;
  TExecucaoConsultaMDFesNaoEncerrados = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FVersao: String;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente: Integer; Versao: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property Versao: String read FVersao write FVersao;
  end;
  TExecucaoStatusMDFe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FTpEmissao: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; Filial, CodUFIBGE, Ambiente: Integer;
        TpEmissao: Integer); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property TpEmissao: Integer read FTpEmissao write FTpEmissao;
  end;

  TExecucaoEventoMDFe = class(TNfeExecucao)
  protected
    FCodUFIBGE: Integer;
    FAmbiente: Integer;
    FIdEvento: String;
    FMDFe: Integer;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; CodUFIBGE, Ambiente, MDFe: Integer;
        IdEvento: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property CodUFIBGE: Integer read FCodUFIBGE write FCodUFIBGE;
    property Ambiente: Integer read FAmbiente write FAmbiente;
    property IdEvento: String read FIdEvento write FIdEvento;
    property MDFe: Integer read FMDFe write FMDFe;
  end;

//===================== Classes da NFS-e ==============================\\

  TExecucaoEnviaLoteRps = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodIbgeCidade: Integer;
    FConsultar: Boolean;
  public
    constructor Create; overload;
    constructor Create(Servidor: String; IdLote, CodIbgeCidade: Integer; Consultar: Boolean); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property Consultar: Boolean read FConsultar write FConsultar;
  end;

  TExecucaoConsultaSitLote = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodIbgeCidade: Integer;
    FCNPJ: String;
    FInscricaoMunicipal: String;
    FProtocolo: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, CodIbgeCidade: Integer; Protocolo: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property CNPJ: String read FCNPJ write FCNPJ;
    property InscricaoMunicipal: String read FInscricaoMunicipal write FInscricaoMunicipal;
    property Protocolo: String read FProtocolo write FProtocolo;
  end;

  TExecucaoConsultaNFSeRps = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodIbgeCidade: Integer;
    FNumeroRps: Integer;
    FChaveAcesso: String;
    FSerieRps: String;
    FTipoRps: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, CodIbgeCidade, NumeroRps: Integer; ChaveAcesso, SerieRps, TipoRps: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property NumeroRps: Integer read FNumeroRps write FNumeroRps;
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
    property SerieRps: String read FSerieRps write FSerieRps;
    property TipoRps: String read FTipoRps write FTipoRps;
  end;

  TExecucaoConsultaLoteRps = class(TNfeExecucao)
  protected
    FIdLote: Integer;
    FCodIbgeCidade: Integer;
    FProtocolo: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; IdLote, CodIbgeCidade: Integer; Protocolo: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property IdLote: Integer read FIdLote write FIdLote;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property Protocolo: String read FProtocolo write FProtocolo;
  end;

  TExecucaoConsultaNFSe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodIbgeCidade: Integer;
    FNumeroNFSe: String;
    FChaveAcesso: String;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FCnpjTomador: String;
    FInscTomador: String;
    FRazaoSocialIntServico: String;
    FCnpjIntServico: String;
    FInscIntServico: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, CodIbgeCidade: Integer;
                        ChaveAcesso, NumeroNFSe: String; DataInicial, DataFinal: TDateTime; CnpjTomador,
                        InscTomador, RazaoSocialIntServico, CnpjIntServico, InscIntServico: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
    property NumeroNFSe: String read FNumeroNFSe write FNumeroNFSe;
    property DataInicial: TDateTime read FDataInicial write FDataInicial;
    property DataFinal: TDateTime read FDataFinal write FDataFinal;
    property CnpjTomador: String read FCnpjTomador write FCnpjTomador;
    property InscTomador: String read FInscTomador write FInscTomador;
    property RazaoSocialIntServico: String read FRazaoSocialIntServico write FRazaoSocialIntServico;
    property CnpjIntServico: String read FCnpjIntServico write FCnpjIntServico;
    property InscIntServico: String read FInscIntServico write FInscIntServico;
  end;

  TExecucaoCancelaNFSe = class(TNfeExecucao)
  protected
    FFilial: Integer;
    FCodIbgeCidade: Integer;
    FNumeroNFSe: String;
    FChaveAcesso: String;
    FCodCancelamento: String;
  public
    Constructor Create; overload;
    Constructor Create (Servidor: String; Filial, CodIbgeCidade: Integer; NumeroNFSe, ChaveAcesso: String; CodCancelamento: String); overload;
    procedure Executar(DadosExecucao: TDadosExecucao); override;
    property Filial: Integer read FFilial write FFilial;
    property CodIbgeCidade: Integer read FCodIbgeCidade write FCodIbgeCidade;
    property NumeroNFSe: String read FNumeroNFSe write FNumeroNFSe;
    property ChaveAcesso: String read FChaveAcesso write FChaveAcesso;
    property CodCancelamento: String read FCodCancelamento write FCodCancelamento;
  end;

  TExecucoesList = class
  protected
    FExecucoes: TList;
  public
    constructor Create;
    function Add(Execucao: TNfeExecucao): TExecucoesList;
    property Execucoes: TList read FExecucoes;
  end;

var
  DMNfe: TDMNfe;
  Ret: TNFeRPCRetorno;

const
  NFE_TIMEOUT: Integer = 30;
  IMP_DANFE_SUCESSO = 2020;
  IMP_DACTE_SUCESSO = 2040;
  IMP_DAMDFE_SUCESSO = 2100;
  IMP_CCE_SUCCESSO = 4000;

  SIT_NFE_CANCELA: Set of 101..217 = [101];
  SIT_NFE_AUTORIZADO: Set of 100..204 = [100, 150];
  SIT_NFE_ACEITO: Set of 100..204 = [100, 149, 150];
  SIT_NFE_DENEGADA: String = '4';
  SIT_NFE_DIGITADA :String = '1';
  SIT_DFE_NAO_PODE_SER_EXCLUIDO: Set of 100..150 = [100, 101, 105, 108, 110, 149, 150];

  SIT_CTE_CANCELADO: Set of 101..217 = [101];
  SIT_CTE_ACEITO: Set of 100..204 = [100];
  SIT_CTE_DENEGADO: String = '4';
  SIT_CTE_DIGITADO :String = '1';

  SIT_MDFE_CANCELADO: Set of 101..217 = [101];
  SIT_MDFE_ACEITO: Set of 100..204 = [100];
  SIT_MDFE_ENCERRADO: Set of 132..204 = [132];
  SIT_MDFE_DENEGADO: String = '4';
  SIT_MDFE_DIGITADO :String = '1';


  MENS_COMPL_NFE: String = 'COMPLEMENTO DE NOTA REFERENTE A NOTA DE SERIE %SERIE% E ' +
    'NUMERO %NUMERO% EMITIDA EM %DATA%';

  MENS_COMPL_CTE: String = 'COMPLEMENTO DE CT-e REFERENTE AO CONHECIMENTO DE SERIE %SERIE% E ' +
    'NUMERO %NUMERO% EMITIDO EM %DATA%';

  BLOCKED_STR_BEGIN: String = '[blockedstrbegin]';
  BLOCKED_STR_END: String = '[blockedstrend]';

  //Tags específicas para serem substituídas no envio de e-mail NF-e
  NFE_EMAIL_NUMERO: String = '%NUMERONF%';
  NFE_EMAIL_SERIE: String = '%SERIENF%';
  DFE_EMAIL_FILIAL: String = '%NOMEFILIAL%';
  DFE_EMAIL_ARQUIVO: String = '%NOMEARQUIVO%';
  DFE_EMAIL_CNPJ: String = '%CNPJ%';

  //Tags específicas para serem substituídas no envio de e-mail CT-e
  CTE_EMAIL_NUMERO: String = '%NUMEROCT%';
  CTE_EMAIL_SERIE: String = '%SERIECT%';

  //Tags específicas para serem substituídas no envio de e-mail MDF-e
  MDFE_EMAIL_NUMERO: String = '%NUMEROMDFE%';
  MDFE_EMAIL_SERIE: String = '%SERIEMDFE%';

  XML_FILE_NAME: String = 'NF-e_Filial-%FILIAL%_Serie-%SERIE%_Numero-%NUMERO%';
  XML_FILE_NAME_CTE: String = 'CT-e_Filial-%FILIAL%_Serie-%SERIE%_Numero-%NUMERO%';
  XML_FILE_NAME_MDFE: String = 'MDF-e_Filial-%FILIAL%_Serie-%SERIE%_Numero-%NUMERO%';
  XML_FILE_NAME_NFSE: String = 'NFS-e_Filial-%FILIAL%_Serie-%SERIE%_Numero-%NUMERO%';

  //Constantes para os métodos da NF-e
  ACAO_ENVIO_NFE = 'Envio de NF-e';
  ACAO_SALVA_DANFE_PDF = 'Gravação de Danfe em PDF';
  ACAO_PRE_VISUALIZA_DANFE = 'Pré-visualização da DANFe';
  ACAO_IMP_DANFE = 'Impressão de Danfe';
  ACAO_ENVIA_EMAIL = 'Envio de Email';
  ACAO_CONS_LOTE = 'Consulta de Lote';
  ACAO_CONS_PROT = 'Consulta de NF-e';
  ACAO_CONS_CAD = 'Consulta de Cadastro';
  ACAO_INUT_NUM = 'Inutilização de Numeração';
  ACAO_CANCELA = 'Cancelamento de NF-e';
  ACAO_STATUS = 'Consulta de Status de Serviço';
  ACAO_CARTA_CORRECAO = 'Carta de Correção Eletrônica';
  ACAO_MANIFESTACAO_DESTINATARIO = 'Manifestação do Destinatário';
  ACAO_ENVIA_EMAIL_CCE = 'Envio de Email CC-e';
  ACAO_IMP_CCE = 'Impressão de CC-e';
  ACAO_EXPORTA_NFES = 'Exportação de NF-e';
  ACAO_SALVA_CCE_PDF = 'Gravação de CC-e em PDF';
  ACAO_BAIXA_XML_NFE = 'Download de XML';
  ACAO_CONSULTA_NFES = 'Consulta de NF-es';

  //Constantes para os métodos da NFS-e
  ACAO_ENVIO_RPS = 'Envio de NFS-e';
  ACAO_CONS_SIT_LOTE = 'Consulta de Situação de Lote Rps';
  ACAO_CONS_LOTE_RPS = 'Consulta de Lote Rps';
  ACAO_CONS_NFSE_RPS = 'Consulta de NFS-e por Rps';
  ACAO_CONS_NFSE = 'Consulta de NFS-e';
  ACAO_CANCELA_NFSE = 'Cancelamento de NFS-e';
  ACAO_IMP_NFSE = 'Impressão de NFS-e';
  ACAO_ENVIA_EMAIL_NFSE = 'Envio de Email NFS-e';
  ACAO_SALVA_NFSE_PDF = 'Gravação de NFS-e em PDF';

  //Constantes para os métodos da CT-e
  ACAO_ENVIO_CTE = 'Envio de CT-e';
  ACAO_SALVA_DACTE_PDF = 'Gravação de Dacte em PDF';
  ACAO_PRE_VISUALIZA_DACTE = 'Pré-visualização do DACTe';
  ACAO_IMP_DACTE = 'Impressão de Dacte';
  ACAO_ENVIA_EMAIL_CTE = 'Envio de Email CT-e';
  ACAO_CONS_LOTE_CTE = 'Consulta de Lote CT-e';
  ACAO_CONS_PROT_CTE = 'Consulta de CT-e';
  ACAO_CONS_CAD_CTE = 'Consulta de Cadastro CT-e';
  ACAO_INUT_NUM_CTE = 'Inutilização de Numeração CT-e';
  ACAO_STATUS_CTE = 'Consulta de Status de Serviço';
  ACAO_MANIFESTACAO_DESTINATARIO_CTE = 'Manifestação do Destinatário';
  ACAO_ENVIA_EMAIL_CCE_CTE = 'Envio de Email CC-e';
  ACAO_IMP_CCE_CTE = 'Impressão de CC-e';
  ACAO_EXPORTA_CTES = 'Exportação de CT-e';
  ACAO_SALVA_CCE_CTE_PDF = 'Gravação de CC-e em PDF';
  ACAO_REGISTRA_EVENTO_CTE = 'Registro de Evento CT-e';

  //Constantes para os métodos da MDF-e
  ACAO_ENVIO_MDFE = 'Envio de MDF-e';
  ACAO_SALVA_DAMDFE_PDF = 'Gravação de Damdfe em PDF';
  ACAO_PRE_VISUALIZA_DAMDFE = 'Pré-visualização do DAMDFe';
  ACAO_IMP_DAMDFE = 'Impressão de Damdfe';
  ACAO_ENVIA_EMAIL_MDFE = 'Envio de Email MDF-e';
  ACAO_CONS_LOTE_MDFE = 'Consulta de Lote MDF-e';
  ACAO_CONS_PROT_MDFE = 'Consulta de MDF-e';
  ACAO_CONS_CAD_MDFE = 'Consulta de Cadastro MDF-e';
  ACAO_CANCELA_MDFE = 'Cancelamento de MDF-e';
  ACAO_STATUS_MDFE = 'Consulta de Status de Serviço';
  ACAO_EXPORTA_MDFES = 'Exportação de MDF-e';
  ACAO_REGISTRA_EVENTO_MDFE = 'Registro de Evento MDF-e';

  TP_EVENTO_DFE_CARTA_CORRECAO = 110110;
  TP_EVENTO_DFE_CANCELAMENTO = 110111;
  TP_EVENTO_DFE_ENCERRAMENTO = 110112;
  TP_EVENTO_DFE_INC_CONDUTOR = 110114;
  TP_EVENTO_DFE_REG_PASSAGEM = 310620;
  CFOPS_DEVOLUCAO = ',1201,1202,1203,1204,1208,1209,1410,1411,1503,1504,1505,'+
                    '1506,1553,1660,1661,1662,1202,1918,1919,2201,2202,2203,'+
                    '2204,2208,2209,2410,2411,2503,2504,2505,2506,2553,2660,'+
                    '2661,2662,1202,2918,2919,3201,3202,3211,3503,3553,5201,'+
                    '5202,5208,5209,5210,5410,5411,5412,5413,5503,5553,5555,'+
                    '5556,5660,5661,5662,5918,5919,5921,6201,6202,6208,6209,'+
                    '6210,6410,6411,6412,6413,6503,6553,6555,6556,6660,6661,'+
                    '6662,6918,6919,6921,7201,7202,7210,7211,7553,7556,7501,';

implementation

uses UUsuario_cl, UNFeParam, UFmEstado, UFilial_cl, StrUtils,
  UParamSistema_cl, UThreadAction, NfeUtils, CteUtils, NfseUtils, NfseNacionalUtils,
  MdfeUtils, UNfEletronicaLote_cl, UAguardoNfe,
  UNFeRetorno, Math, UNotaSaida_cl, UNotaEntrada_cl, CartaCorrecao, NfeTypes,
  UCteLote_cl, UMdfeLote_cl, UFmCadastro, UDevolucaoTroca_cl, UNotaAutomaticaFlag,
  UPreVisualizacaoDFe;

{$R *.dfm}

{ TDMNfe }

procedure TDMNfe.ValidaNfe(cod_nota_cab :Integer = 0);
begin
  if cod_nota_cab > 0 then
  begin
    QNfeEmissao.Close;
    QNfeEmissao.SetVariable('NOTA_CAB', cod_nota_cab);
    QNfeEmissao.Open;
  end;
  if (QNfeEmissao.State = dsInactive) or (QNfeEmissao.RecordCount = 0) then
  begin
    MessageDlg('NF-e não encotrada para validação', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (StrToInt('0' + QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_AUTORIZADO) or
    (StrToInt('0' + QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_CANCELA) then
    Abort;
end;
function TDMNfe.ValidaCte(cod_conhecimento: Integer): Boolean;
begin
  if cod_conhecimento > 0 then
  begin
    QCteEmissao.Close;
    QCteEmissao.SetVariable('COD_CONHECIMENTO', cod_conhecimento);
    QCteEmissao.Open;
  end;
  Result := True;
  if (QCteEmissao.State = dsInactive) or (QCteEmissao.RecordCount = 0) then
  begin
    MessageDlg('CT-e não encotrado para validação', mtInformation, [mbOK], 0);
    Result := False;
  end;
  if (StrToInt('0' + QCteEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_CTE_ACEITO) or
    (StrToInt('0' + QCteEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_CTE_CANCELADO) then
    Result := False;
end;
procedure TDMNfe.ValidaNfse(cod_nota_cab :Integer = 0);
begin
  if cod_nota_cab > 0 then
  begin
    QNfeEmissao.Close;
    QNfeEmissao.SetVariable('NOTA_CAB', cod_nota_cab);
    QNfeEmissao.Open;
  end;
  if (QNfeEmissao.State = dsInactive) or (QNfeEmissao.RecordCount = 0) then
  begin
    MessageDlg('NF-e não encotrada para validação', mtInformation, [mbOK], 0);
    Abort;
  end;
  if (StrToInt('0' + QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_AUTORIZADO) or
    (StrToInt('0' + QNfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_CANCELA) then
    Abort;
end;
function TDMNfe.ValidaMdfe(cod_manifesto: Integer): Boolean;
begin
  if cod_manifesto > 0 then
  begin
    QMdfeEmissao.Close;
    QMdfeEmissao.SetVariable('COD_MANIFESTO', cod_manifesto);
    QMdfeEmissao.Open;
  end;
  Result := True;
  if (QMdfeEmissao.State = dsInactive) or (QMdfeEmissao.RecordCount = 0) then
  begin
    MessageDlg('MDF-e não encotrado para validação', mtInformation, [mbOK], 0);
    Result := False;
  end;
  if (StrToInt('0' + QMdfeEmissaoDESC_RETORNO_ENCERRAMENTO.Value) in SIT_MDFE_ENCERRADO) then
  begin
    MessageDlg('Este MDF-e já foi encerrado.', mtInformation, [mbOK], 0);
    Result := False;
  end
  else if (StrToInt('0' + QMdfeEmissaoDESC_RETORNO_CANCELAMENTO.Value) in SIT_MDFE_CANCELADO) then
  begin
    MessageDlg('Este MDF-e já foi cancelado.', mtInformation, [mbOK], 0);
    Result := False;
  end
  else if (StrToInt('0' + QMdfeEmissaoDESC_RETORNO_PROCESSAMENTO.Value) in SIT_MDFE_ACEITO) then
    Result := False;
end;
procedure TDMNfe.Calc_Peso_Nota;
var
  wFlagPeso :Boolean;
  wFlagPesoB :Boolean;
begin
  //Faz este cálculo quando tiver um valor no peso bruto e peso liquido no cadastro do produto
  //Se fizer o cálculo por peso bruto e liquido, não pode fazer o cálculo pelo num_volumes e num_embalagens
  //Por isso utiliza wFlagPeso e wFlagPesoB

  wPesoBruto := 0;
  wPeso := 0;
  wVolumes := 0;
  with DMNotaSaida do
  begin
    QNFE_EmiteIt.First;
    while not QNFE_EmiteIt.Eof do
    begin
      wFlagPeso := false;
      wFlagPesoB := false;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ABATE' then  //Abatedouro calcula diferente
      begin
        if QNFE_EmiteItNUM_PESO_BRUTO.Value > 0  then
        begin
          wPesoBruto := wPesoBruto + (QNFE_EmiteItNUM_PESO_BRUTO.Value * QNFE_EmiteItQT_QUANTIDADE.Value);
          wFlagPesoB := true;
        end;
        if QNFE_EmiteItNUM_PESO_LIQUIDO.Value > 0  then
        begin
          wPeso := wPeso + (QNFE_EmiteItNUM_PESO_LIQUIDO.Value * QNFE_EmiteItQT_QUANTIDADE.Value);
          wFlagPeso := true;
        end;
      end;
      if (QNFE_EmiteITInd_Tipo_Produto.Value = 'AGRICOLA') then
      begin
        if not wFlagPeso then
          wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value;
        if not wFlagPesoB then
          wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value;
      end
      else
        begin
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
          begin
            //wPeso :=  wPeso + DMNotaSaida.QNFE_EmiteITQT_Quantidade.Value * DMNotaSaida.QNFE_EmiteITNum_embalagem.Value;
            if not wFlagPeso then
              wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteItNUM_EMBALAGEM.Value;
            if not wFlagPesoB then
            begin
              if QNFE_Emiteqt_beneficiado.Text <> '' then
                wPesoBruto := QNFE_Emiteqt_beneficiado.Value
              else
                wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Volumes.Value;
            end;
          end
          else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR') or
                  (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PERFIL') then
          begin
            if not wFlagPeso then
              wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Volumes.Value;
            if not wFlagPesoB then
              wPesoBruto := wPeso;
          end
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
          begin
            if not wFlagPeso then
              wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteItNUM_METROS_CUBICOS.Value;
            if not wFlagPesoB then
              wPesoBruto := wPeso;
          end
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
          begin
            if QNFE_EmiteInd_Entrada_Saida.Value = 'E' then
            begin
              if not wFlagPeso then
                wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value;
              if not wFlagPesoB then
                wPesoBruto := wPeso;
            end
            else
            begin
              if not wFlagPeso then
                wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value * 1000;
                  //- ((QNFE_EmiteITQT_Quantidade.Value * 1000 / 25) * 0.15);
              if not wFlagPesoB then
              begin
                if QNFE_EmiteITCod_Produto.Value = 7 then
                  wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value + (QNFE_EmiteITQT_Quantidade.Value / 700 * 2)
                else
                  //wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value * QNFE_EmiteITNum_Embalagem.Value + (QNFE_EmiteITQT_Quantidade.Value * 0.15);
                  wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value * 1000 +
                   ((QNFE_EmiteITQT_Quantidade.Value * 1000 / 25) * 0.15);
              end;
            end
          end
          else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SETIMO') or
                  (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PESCADO') then
          begin
            if not wFlagPeso then
              wPeso := wPeso + QNFE_EmiteItQT_QUANTIDADE.Value;
            if not wFlagPesoB then
              wPesoBruto := wPeso;
          end
          else
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
          begin
            wPeso := wPeso + QNFE_EmiteItQT_QUANTIDADE.Value;
            wPesoBruto := wPesoBruto + (QNFE_EmiteItNUM_VOLUMES_NOTA.Value * QNFE_EmiteItNum_Embalagem.Value) + QNFE_EmiteItQT_QUANTIDADE.Value;
            wVolumes := wVolumes + QNFE_EmiteItNUM_VOLUMES_NOTA.Value; //para abatedouro a quantidade transp é a soma dos volumes dos intens informado na nota
          end
          else
          begin
            if QNFE_EmiteItDESC_UNIDADE.Value = 'KG' then
            begin
              if not wFlagPeso then
                wPeso := wPeso + QNFE_EmiteITQT_Quantidade.Value;
              if not wFlagPesoB then
                wPesoBruto := wPesoBruto + QNFE_EmiteITQT_Quantidade.Value;
            end;
          end;
      end;
      // Pega num_volume do produto
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ABATE' then
      begin
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS') or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI')  then
          wVolumes := wVolumes + QNFE_EmiteITQT_Quantidade.Value
        else
          wVolumes := wVolumes + QNFE_EmiteItNUM_VOLUMES.Value * QNFE_EmiteITQT_Quantidade.Value
      end;
      QNFE_EmiteIt.Next;
    end;
    // Se nao pegar num_volume do produto, pega da aba geral da nota
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ABATE' then
    begin
      if not QNFE_EmiteNUM_VOLUMES.IsNull then
        wVolumes := QNFE_EmiteNUM_VOLUMES.Value;
    end;
  end;
end;

procedure TDMNfe.SetaNfe(Chave: String; ForcarAtualizar: Boolean = False);
var
  wChave: String;
begin
  wChave := LimpaChave(Chave);
  if wChave <> '' then
  begin
    if (not ForcarAtualizar) and (QNfeDESC_CHAVE_ACESSO.Value = wChave) then //Se não é necessário atualizar, não precisa reabrir a query se a nfe que está nela for a desejada.
      Exit;
    QNfe.Close;
    QNfe.SetVariable('PK', wChave);
    QNfe.Open;
  end
  else
  begin
    QNfe.Close;
    QNfe.SetVariable('PK',0);
    QNfe.Open;
  end;

  // Em alguns casos as querys QNFE_Emite e QNFE_EmiteIt ficam fechadas
  // e sem dados. São necessárias para gerar NF-e
  with DMNotaSaida do
  begin
    if not QNfe.Eof then
      if QNFE_Emite.Eof then
      begin
        QNFE_Emite.Close;
        QNFE_Emite.SetVariable('COD_NOTA_CAB'
          , QNfeCOD_NOTA_CAB.Value);
        QNFE_Emite.Open;
        QNFE_EmiteIt.Close;
        QNFE_EmiteIt.SetVariable('COD_NOTA_CAB'
          , QNfeCOD_NOTA_CAB.Value);
        QNFE_EmiteIt.Open;
      end;
  end;
end;
procedure TDMNfe.SetaCte(Chave: String; ForcarAtualizar: Boolean = False);
var
  wChave: String;
begin
  wChave := LimpaChave(Chave);
  if wChave <> '' then
  begin
    if (not ForcarAtualizar) and (QCteDESC_CHAVE_ACESSO.Value = wChave) then //Se não é necessário atualizar, não precisa reabrir a query se a nfe que está nela for a desejada.
      Exit;
    QCte.Close;
    QCte.SetVariable('PK', wChave);
    QCte.Open;
  end
  else
  begin
    QCte.Close;
    QCte.SetVariable('PK',0);
    QCte.Open;
  end;
end;
procedure TDMNfe.SetaMdfe(Chave: String; ForcarAtualizar: Boolean = False);
var
  wChave: String;
begin
  wChave := LimpaChave(Chave);
  if wChave <> '' then
  begin
    if (not ForcarAtualizar) and (QMdfeDESC_CHAVE_ACESSO.Value = wChave) then //Se não é necessário atualizar, não precisa reabrir a query se a nfe que está nela for a desejada.
      Exit;
    QMdfe.Close;
    QMdfe.SetVariable('PK', wChave);
    QMdfe.Open;
  end
  else
  begin
    QMdfe.Close;
    QMdfe.SetVariable('PK',0);
    QMdfe.Open;
  end;
end;

procedure TDMNfe.SetaNfeConsEntr(Chave: String; ForcarAtualizar: Boolean = False);
var
  wChave: String;
begin
  wChave := LimpaChave(Chave);
  if wChave <> '' then
  begin
    if (not ForcarAtualizar) and (QNfeConsEntrDESC_CHAVE_ACESSO.Value = wChave) then //Se não é necessário atualizar, não precisa reabrir a query se a nfe que está nela for a desejada.
      Exit;
    QNfeConsEntr.Close;
    QNfeConsEntr.SetVariable('PK', wChave);
    QNfeConsEntr.Open;
  end;
end;

procedure TDMNfe.DenegaNfe(Chave :String; Voltar :Boolean = false);
var
wChave :String;
begin
  wChave := '';
  wChave := LimpaChave(Chave);
  if wChave <> '' then
  begin
    SetaNfe(Chave);
    if QNfeCOD_NOTA_CAB.Value = 0 then
      MessageDlg('NF-e não encontrada', mtInformation, [mbOk], 0);

    with DMOracle do
    begin
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET IND_SITUACAO = ');
      if Voltar then
        QExecSQL.SQL.Add(SIT_NFE_DIGITADA)
      else
        QExecSQL.SQL.Add(SIT_NFE_DENEGADA);
      QExecSQL.SQL.Add(' WHERE COD_NOTA_CAB = ');
      QExecSQL.SQL.Add(QNfeCOD_NOTA_CAB.Text);
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    end;
  end;
end;

procedure TDMNfe.DataModuleCreate(Sender: TObject);
begin
  msgs := TVariantMap.Create;

  //Resultados de Processamentos
  msgs.addValue(100, 'Autorizado o uso da NF-e');
  msgs.addValue(101, 'Cancelamento de NF-e homologado');
  msgs.addValue(102, 'Inutilização de número homologado');
  msgs.addValue(103, 'Lote recebido com sucesso');
  msgs.addValue(104, 'Lote processado');
  msgs.addValue(105, 'Lote em processamento');
  msgs.addValue(106, 'Lote não localizado');
  msgs.addValue(107, 'Serviço em Operação');
  msgs.addValue(108, 'Serviço Paralisado Momentaneamente (curto prazo)');
  msgs.addValue(109, 'Serviço Paralisado sem Previsão');
  msgs.addValue(110, 'Uso Denegado');
  msgs.addValue(111, 'Consulta cadastro com uma ocorrência');
  msgs.addValue(112, 'Consulta cadastro com mais de uma ocorrência');
  msgs.addValue(149, 'NF-e emitida em contingência');
  msgs.addValue(150, 'Autorizado o uso da NF-e, autorização fora de prazo');

  //Motivos de não atendimento
  msgs.addValue(201, 'Rejeição: O numero máximo de numeração de NF-e a inutilizar ultrapassou o limite');
  msgs.addValue(202, 'Rejeição: Falha no reconhecimento da autoria ou integridade do arquivo digital');
  msgs.addValue(203, 'Rejeição: Emissor não habilitado para emissão da NF-e');
  msgs.addValue(204, 'Rejeição: Duplicidade de NF-e');
  msgs.addValue(205, 'Rejeição: NF-e está denegada na base de dados da SEFAZ');
  msgs.addValue(206, 'Rejeição: NF-e já está inutilizada na Base de dados da SEFAZ');
  msgs.addValue(207, 'Rejeição: CNPJ do emitente inválido');
  msgs.addValue(208, 'Rejeição: CNPJ do destinatário inválido');
  msgs.addValue(209, 'Rejeição: IE do emitente inválida');
  msgs.addValue(210, 'Rejeição: IE do destinatário inválida');
  msgs.addValue(211, 'Rejeição: IE do substituto inválida');
  msgs.addValue(212, 'Rejeição: Data de emissão NF-e posterior a data de recebimento');
  msgs.addValue(213, 'Rejeição: CNPJ-Base do Emitente difere do CNPJ-Base do Certificado Digital');
  msgs.addValue(214, 'Rejeição: Tamanho da mensagem excedeu o limite estabelecido');
  msgs.addValue(215, 'Rejeição: Falha no schema XML');
  msgs.addValue(216, 'Rejeição: Chave de Acesso difere da cadastrada');
  msgs.addValue(217, 'Rejeição: NF-e não consta na base de dados da SEFAZ');
  msgs.addValue(218, 'Rejeição: NF-e já esta cancelada na base de dados da SEFAZ');
  msgs.addValue(219, 'Rejeição: Circulação da NF-e verificada');
  msgs.addValue(220, 'Rejeição: NF-e autorizada há mais de 7 dias (168 horas)');
  msgs.addValue(221, 'Rejeição: Confirmado o recebimento da NF-e pelo destinatário');
  msgs.addValue(222, 'Rejeição: Protocolo de Autorização de Uso difere do cadastrado');
  msgs.addValue(223, 'Rejeição: CNPJ do transmissor do lote difere do CNPJ do transmissor da consulta');
  msgs.addValue(224, 'Rejeição: A faixa inicial é maior que a faixa final');
  msgs.addValue(225, 'Rejeição: Falha no Schema XML da NFe');
  msgs.addValue(226, 'Rejeição: Código da UF do Emitente diverge da UF autorizadora');
  msgs.addValue(227, 'Rejeição: Erro na Chave de Acesso - Campo ID');
  msgs.addValue(228, 'Rejeição: Data de Emissão muito atrasada');
  msgs.addValue(229, 'Rejeição: IE do emitente não informada');
  msgs.addValue(230, 'Rejeição: IE do emitente não cadastrada');
  msgs.addValue(231, 'Rejeição: IE do emitente não vinculada ao CNPJ');
  msgs.addValue(232, 'Rejeição: IE do destinatário não informada');
  msgs.addValue(233, 'Rejeição: IE do destinatário não cadastrada');
  msgs.addValue(234, 'Rejeição: IE do destinatário não vinculada ao CNPJ');
  msgs.addValue(235, 'Rejeição: Inscrição SUFRAMA inválida');
  msgs.addValue(236, 'Rejeição: Chave de Acesso com dígito verificador inválido');
  msgs.addValue(237, 'Rejeição: CPF do destinatário inválido');
  msgs.addValue(238, 'Rejeição: Cabeçalho - Versão do arquivo XML superior a Versão vigente');
  msgs.addValue(239, 'Rejeição: Cabeçalho - Versão do arquivo XML não suportada');
  msgs.addValue(240, 'Rejeição: Cancelamento/Inutilização - Irregularidade Fiscal do Emitente');
  msgs.addValue(241, 'Rejeição: Um número da faixa já foi utilizado');
  msgs.addValue(242, 'Rejeição: Cabeçalho - Falha no Schema XML');
  msgs.addValue(243, 'Rejeição: XML Mal Formado');
  msgs.addValue(244, 'Rejeição: CNPJ do Certificado Digital difere do CNPJ da Matriz e do CNPJ do Emitente');
  msgs.addValue(245, 'Rejeição: CNPJ Emitente não cadastrado');
  msgs.addValue(246, 'Rejeição: CNPJ Destinatário não cadastrado');
  msgs.addValue(247, 'Rejeição: Sigla da UF do Emitente diverge da UF autorizadora');
  msgs.addValue(248, 'Rejeição: UF do Recibo diverge da UF autorizadora');
  msgs.addValue(249, 'Rejeição: UF da Chave de Acesso diverge da UF autorizadora');
  msgs.addValue(250, 'Rejeição: UF diverge da UF autorizadora');
  msgs.addValue(251, 'Rejeição: UF/Município destinatário não pertence a SUFRAMA');
  msgs.addValue(252, 'Rejeição: Ambiente informado diverge do Ambiente de recebimento');
  msgs.addValue(253, 'Rejeição: Digito Verificador da chave de acesso composta inválida');
  msgs.addValue(254, 'Rejeição: NF-e complementar não possui NF referenciada');
  msgs.addValue(255, 'Rejeição: NF-e complementar possui mais de uma NF referenciada');
  msgs.addValue(256, 'Rejeição: Uma NF-e da faixa já está inutilizada na Base de dados da SEFAZ');
  msgs.addValue(257, 'Rejeição: Solicitante não habilitado para emissão da NF-e');
  msgs.addValue(258, 'Rejeição: CNPJ da consulta inválido');
  msgs.addValue(259, 'Rejeição: CNPJ da consulta não cadastrado como contribuinte na UF');
  msgs.addValue(260, 'Rejeição: IE da consulta inválida');
  msgs.addValue(261, 'Rejeição: IE da consulta não cadastrada como contribuinte na UF');
  msgs.addValue(262, 'Rejeição: UF não fornece consulta por CPF');
  msgs.addValue(263, 'Rejeição: CPF da consulta inválido');
  msgs.addValue(264, 'Rejeição: CPF da consulta não cadastrado como contribuinte na UF');
  msgs.addValue(265, 'Rejeição: Sigla da UF da consulta difere da UF do Web Service');
  msgs.addValue(266, 'Rejeição: Série utilizada não permitida no Web Service');
  msgs.addValue(267, 'Rejeição: NF Complementar referencia uma NF-e inexistente');
  msgs.addValue(268, 'Rejeição: NF Complementar referencia uma outra NF-e Complementar');
  msgs.addValue(269, 'Rejeição: CNPJ Emitente da NF Complementar difere do CNPJ da NF Referenciada');
  msgs.addValue(270, 'Rejeição: Código Município do Fato Gerador: dígito inválido');
  msgs.addValue(271, 'Rejeição: Código Município do Fato Gerador: difere da UF do emitente');
  msgs.addValue(272, 'Rejeição: Código Município do Emitente: dígito inválido');
  msgs.addValue(273, 'Rejeição: Código Município do Emitente: difere da UF do emitente');
  msgs.addValue(274, 'Rejeição: Código Município do Destinatário: dígito inválido');
  msgs.addValue(275, 'Rejeição: Código Município do Destinatário: difere da UF do Destinatário');
  msgs.addValue(276, 'Rejeição: Código Município do Local de Retirada: dígito inválido');
  msgs.addValue(277, 'Rejeição: Código Município do Local de Retirada: difere da UF do Local de Retirada');
  msgs.addValue(278, 'Rejeição: Código Município do Local de Entrega: dígito inválido');
  msgs.addValue(279, 'Rejeição: Código Município do Local de Entrega: difere da UF do Local de Entrega');
  msgs.addValue(280, 'Rejeição: Certificado Transmissor inválido');
  msgs.addValue(281, 'Rejeição: Certificado Transmissor Data Validade');
  msgs.addValue(282, 'Rejeição: Certificado Transmissor sem CNPJ');
  msgs.addValue(283, 'Rejeição: Certificado Transmissor - erro Cadeia de Certificação');
  msgs.addValue(284, 'Rejeição: Certificado Transmissor revogado');
  msgs.addValue(285, 'Rejeição: Certificado Transmissor difere ICP-Brasil');
  msgs.addValue(286, 'Rejeição: Certificado Transmissor erro no acesso a LCR');
  msgs.addValue(287, 'Rejeição: Código Município do FG - ISSQN: dígito inválido');
  msgs.addValue(288, 'Rejeição: Código Município do FG - Transporte: dígito inválido');
  msgs.addValue(289, 'Rejeição: Código da UF informada diverge da UF solicitada');
  msgs.addValue(290, 'Rejeição: Certificado Assinatura inválido');
  msgs.addValue(291, 'Rejeição: Certificado Assinatura Data Validade');
  msgs.addValue(292, 'Rejeição: Certificado Assinatura sem CNPJ');
  msgs.addValue(293, 'Rejeição: Certificado Assinatura - erro Cadeia de Certificação');
  msgs.addValue(294, 'Rejeição: Certificado Assinatura revogado');
  msgs.addValue(295, 'Rejeição: Certificado Assinatura difere ICP-Brasil');
  msgs.addValue(296, 'Rejeição: Certificado Assinatura erro no acesso a LCR');
  msgs.addValue(297, 'Rejeição: Assinatura difere do calculado');
  msgs.addValue(298, 'Rejeição: Assinatura difere do padrão do Projeto');
  msgs.addValue(299, 'Rejeição: XML da área de cabeçalho com codificação diferente de UTF-8');
  msgs.addValue(401, 'Rejeição: CPF do remetente inválido');
  msgs.addValue(402, 'Rejeição: XML da área de dados com codificação diferente de UTF-8');
  msgs.addValue(403, 'Rejeição: O grupo de informações da NF-e avulsa é de uso exclusivo do Fisco');
  msgs.addValue(404, 'Rejeição: Uso de prefixo de namespace não permitido');
  msgs.addValue(405, 'Rejeição: Código do país do emitente: dígito inválido');
  msgs.addValue(406, 'Rejeição: Código do país do destinatário: dígito inválido');
  msgs.addValue(407, 'Rejeição: O CPF só pode ser informado no campo emitente para a NF-e avulsa');
  msgs.addValue(453, 'Rejeição: Ano de inutilização não pode ser superior ao Ano atual');
  msgs.addValue(454, 'Rejeição: Ano de inutilização não pode ser inferior a 2006');
  msgs.addValue(478, 'Rejeição: Local da entrega não informado para faturamento direto de veículos novos');
  msgs.addValue(999, 'Rejeição: Erro não catalogado (informar a mensagem de erro capturado no tratamento da exceção)');

  //Motivos de denegação de uso
  msgs.addValue(301, 'Uso Denegado: Irregularidade fiscal do emitente');
  msgs.addValue(302, 'Uso Denegado: Irregularidade fiscal do destinatário');

  //Exclusivo Cemapa
  msgs.addValue(1000, 'Pendente: Xml retornado do webservice incompleto ou nulo (ws consulta)');
  msgs.addValue(1001, 'Pendente: Lote não enviado para SEFAZ em 10 tentativas');
  msgs.addValue(1002, 'Pendente: Nota validada por xml schema, mas ainda não enviada para SEFAZ');
  msgs.addValue(1003, 'Pendente: Não conseguiu enviar lote na primeira tentativa');
  msgs.addValue(1004, 'Pendente: Nota enviada para SEFAZ, mas ainda não consultada');
  msgs.addValue(1005, 'Erro: XML da NF-e inválido');
  msgs.addValue(1006, 'Pendente: NF-e recebida pelo servidor');

  formaPagNFCe := TVariantMap.Create;
                              
  formaPagNFCe.addValue('Dinheiro',1);
  formaPagNFCe.addValue('Cheque',2);
  formaPagNFCe.addValue('Cartão de Crédito',3);
  formaPagNFCe.addValue('Cartão de Débito',4);
  formaPagNFCe.addValue('Crédito Loja',5);
  formaPagNFCe.addValue('Vale Alimentação',10);
  formaPagNFCe.addValue('Vale Refeição',11);
  formaPagNFCe.addValue('Vale Presente',12);
  formaPagNFCe.addValue('Vale Combustível',13);
  formaPagNFCe.addValue('Boleto Bancário',15);
  formaPagNFCe.addValue('Depósito Bancário',16);
  formaPagNFCe.addValue('Pagamento Instantâneo (PIX)',17);
  formaPagNFCe.addValue('Transferência bancária, Carteira Digital',18);
  formaPagNFCe.addValue('Programa de fidelidade, Cashback, Crédito Virtual',19);
  formaPagNFCe.addValue('Sem pagamento',90);
  formaPagNFCe.addValue('Outros',99);

  RedesAutorizadoras := TVariantMap.Create;
  RedesAutorizadoras.addValue('00000','00000000000000');
  RedesAutorizadoras.addValue('00001','51427102000129'); //Tecban
  RedesAutorizadoras.addValue('00004','01027058000191'); //Visanet / Cielo
  RedesAutorizadoras.addValue('00005','01425787000101'); //Redecard
  RedesAutorizadoras.addValue('00006','60419645000195'); //Amex
  RedesAutorizadoras.addValue('00021','92702067000196'); //Banrisul
  RedesAutorizadoras.addValue('00031','47866934000174'); //Ticket combustível
  RedesAutorizadoras.addValue('00082','10440482000154'); //GetNet
  RedesAutorizadoras.addValue('00125','01027058000191'); //Visanet / Cielo
  RedesAutorizadoras.addValue('00265','16501555000157'); //Stone
  RedesAutorizadoras.addValue('00223','09051290000177'); //Nutricard



  BandeirasCartoes := TVariantMap.Create;
  BandeirasCartoes.addValue('00001',1);
  BandeirasCartoes.addValue('00002',2);
  BandeirasCartoes.addValue('00003',5);
  BandeirasCartoes.addValue('00004',3);
  BandeirasCartoes.addValue('00012',7);
  BandeirasCartoes.addValue('00013',8);
  BandeirasCartoes.addValue('00015',4);

  if Buscador = nil then
    Buscador := TBuscador.Create([''], False);
end;

function TDMNfe.getWSMessage(codMsg: Integer): String;
var
  v: Variant;
begin
  v := msgs.getValue(codMsg);
  if v = null then
    Result := Bib.ift(QNfeDESC_MSG_VALIDACAO_LOTE.Value = '',
      Bib.ift(QNfeDESC_MSG_VALIDACAO.Value = '', '<Mensagem não encontrada>', QNfeDESC_MSG_VALIDACAO.Value),
      QNfeDESC_MSG_VALIDACAO_LOTE.Value)
  else
    Result := v;
end;

(*
 * Procedure criada para centralizar a logica de salvamento de arquivo XML para
 * NF-e. Ele busca no cadastro da filial se é necessario fazer logon no servidor
 * nfe e, caso seja, utiliza o login e senha que estão la para efetuar esse
 * logon antes de salvar o XML.
 *)
function TDMNfe.Salva(Caminho: String; Str: TStrings; Nome: String; Filial: String = ''): Boolean;
  procedure salva(Caminho: String);
  begin
    Str.SaveToFile(Caminho + Nome);
  end;
  // Tentando mapear, se der certo substituir o Caminho pela letra mapeada.
  function map(var Caminho: String; letra, usuario, senha: String): Boolean;
  begin
    Result := Bib.MapearPorta(letra, Caminho, usuario, senha);
    if Result then
      Caminho := letra + '\';
  end;
var
  Mapeado: Boolean;
begin
  //Salvando Str em arquivo
  Mapeado := False;
  if Filial <> '' then
  begin
    with DMFilial do
    begin
      if QFilialCOD_FILIAL.Text <> Filial then
      begin
        QFilial.Close;
        QFilial.SetVariable('PK', Filial);
        QFilial.open;
      end;

      // Se deve ser efetuado logon entao tenta mapear o caminho com as
      // credenciais dadas na filial para varias unidades. Se alguma der certo
      // ela será atribuida a variavel Caminho, somada de '\'. (Ex: 'N:\')
      if (QFilialIND_LOGIN_NFE.Value = 'S') and (
        (map(Caminho, 'B:', QFilialDESC_USUARIO.Value, QFilialDESC_SENHA.Value)) or
        (map(Caminho, 'N:', QFilialDESC_USUARIO.Value, QFilialDESC_SENHA.Value)) or
        (map(Caminho, 'W:', QFilialDESC_USUARIO.Value, QFilialDESC_SENHA.Value)) or
        (map(Caminho, 'X:', QFilialDESC_USUARIO.Value, QFilialDESC_SENHA.Value))) then
        Mapeado := True;
    end;
  end;
  try
    salva(Caminho); // Salvando o XML
    Result := True;
    if Mapeado then // Se foi feito mapeamento, cancelar ele logo apos para maior segurança.
      Bib.CancelaMapeamentoPorta(Copy(Caminho, 1, 2));
  except
    on e: Exception do
    begin
      Result := False;
      if Mapeado then // Se foi feito mapeamento, cancelar ele logo apos para maior segurança.
        Bib.CancelaMapeamentoPorta(Copy(Caminho, 1, 2));
      MessageDlg('Não foi possível salvar o arquivo.' + #13 + #10 +
        e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TDMNfe.QNfeConsCalcFields(DataSet: TDataSet);
var
  Cod: Integer;
  MsgValida: String;
begin
  Cod := StrToInt('0' + DataSet.FieldByName('SIT_NFE').Text);
  if Cod > 0 then
    DataSet.FieldByName('desc_msg_retorno').Value := DataSet.FieldByName('SIT_NFE').Text + ' - ' + getWSMessage(Cod)
  else
    DataSet.FieldByName('desc_msg_retorno').Value := '';
  DataSet.FieldByName('ind_aprovado').Value := (Cod = 100);
  Cod := StrToInt('0' + DataSet.FieldByName('SIT_CANC').Text);
  if Cod > 0 then
    DataSet.FieldByName('desc_msg_canc').Value := DataSet.FieldByName('SIT_CANC').Text + ' - ' + getWSMessage(Cod)
  else
    DataSet.FieldByName('desc_msg_canc').Value := '';
  DataSet.FieldByName('ind_aprovado').Value := (DataSet.FieldByName('ind_aprovado').Value and (cod = 0));

  MsgValida := DataSet.FieldByName('DESC_MSG_VALIDACAO').Value + #13 + #10 +
      'Envio: ' + DataSet.FieldByName('DESC_MSG_VALIDACAO_LOTE').Value;
  if not DataSet.FieldByName('desc_msg_canc').IsNull then
     MsgValida := MsgValida + #13 + #10 + 'Cancelamento: ' + getWSMessage(Cod);
  DataSet.FieldByName('desc_validacao').Value := MsgValida;
end;

function TDMNfe.CodigoNFpelaChave(Chave: String): Integer;
begin
  SetaNfe(Chave, True);
  Result := QNfeCOD_NOTA_CAB.AsInteger;
end;

procedure TDMNfe.ExportaNFes(Filial, Cadastro: Integer; DataInicial,
  DataFinal: TDateTime; Saida, Entrada, Xml, Pdf, NFe: Boolean; Caminho: String);
var
  wServidor: String;
begin
  wServidor := DMOracle.FastSelect('desc_repositorio_nfe','tb_filial','cod_filial = ' + IntToStr(Filial));
  ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoExportaNFes.Create(wServidor, Filial, Cadastro,DataInicial,DataFinal, Saida, Entrada, Xml,Pdf, NFe,Caminho)));
end;

procedure TDMNfe.ExportaCTes(Filial, Remetente, Destinatario: Integer; DataInicial,
  DataFinal: TDateTime; Xml, Pdf: Boolean; Caminho : String; Cancelado : Boolean);
var
  wServidor: String;
begin
  wServidor := DMOracle.FastSelect('desc_repositorio_nfe','tb_filial','cod_filial = ' + IntToStr(Filial));
  ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoExportaCTes.Create(wServidor, Filial, Remetente, Destinatario,DataInicial,DataFinal, Xml,Pdf, Caminho, Cancelado)));
end;

procedure TDMNfe.ExportaMDFes(Filial: Integer; DataInicial,
  DataFinal: TDateTime; Xml, Pdf: Boolean; Caminho: String);
var
  wServidor: String;
begin
  wServidor := DMOracle.FastSelect('desc_repositorio_nfe','tb_filial','cod_filial = ' + IntToStr(Filial));
  ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoExportaMDFes.Create(wServidor, Filial, DataInicial,DataFinal, Xml,Pdf, Caminho)));
end;

procedure TDMNfe.EmiteCCe(CodNota: Integer);
var
  wServidor: String;
  wExec: TExecucoesList;
  DescEmail: String;
  ExecEmailCCe: TExecucaoEnviaEmailCCe;
  XmlCCe: String;
begin
  QNfeEmissao.Close;
  QNfeEmissao.ClearVariables;
  QNfeEmissao.SetVariable('NOTA_CAB', CodNota);
  QNfeEmissao.Open;
  wServidor := QNfeEmissaoDESC_REPOSITORIO_NFE.Value;
  XmlCCe := TNfeUtils.GeraXMLCCe(CodNota);
  QGeraCceItem.Last;
  QGeraCceItem.Edit;
  QGeraCceItemDESC_XML_CCE.Value := XmlCCe;
  QGeraCceItem.Post;
  if FNFeParam = nil then
    FNFeParam := TFNFeParam.Create(Application);
  FNFeParam.AtivaPagina(6);
  FNFeParam.ME6Chave.Text := Bib.LimpaNumero(QGeraCceDESC_CHAVE_ACESSO.Value);
  FNFeParam.ME6Chave.Enabled := false;
  FNFeParam.RG6Ambiente.ItemIndex := QNfeEmissaoIND_AMBIENTE_NFE.AsInteger - 1;
  if FNFeParam.ShowModal = mrOk then
  begin
    wExec := TExecucoesList.Create;
    wExec.Add(TExecucaoCartaCorrecao.Create( wServidor, DMNfe.QGeraCceItemID_EVENTO.Value,
          DMNfe.QGeraNfeCOD_UF_IBGE_FILIAL.Value, DMNfe.QGeraNfeIND_AMBIENTE_NFE_FILIAL.Value,
          QGeraCceDESC_CHAVE_ACESSO.Value));
    with DMNfe, FNFeParam do
    begin
      if CB6Impressao.Checked then
        wExec.Add(TExecucaoImprimeCCe.Create(wServidor, DMNfe.QGeraCceItemID_EVENTO.Value,
          QNfeEmissaoDESC_IMPRESSORA_DANFE.Value));

      if CB6Email.Checked then
      begin
        ExecEmailCCe := TExecucaoEnviaEmailCCe(PreparaEmailCCe(CodNota,CB6EmailXml.Checked,CB6EmailPdf.Checked));
        DescEmail := ExecEmailCCe.Email;
        if (DescEmail <> '') or (InputQuery('E-mail não cadastrado','Informe o e-mail para ' + QGeraNfeNOME_CADASTRO.Value +
          ' ou cancele para não enviar para este cliente:', DescEmail)) then
          ExecEmailCCe.Email := DescEmail;
        wExec.Add(ExecEmailCCe);
      end;
    end;
    ExecutaAcoes(wExec);
  end;
end;

function TDMNfe.ConsultaCadastro(Filial: Integer; UFCadastro, ParamConsulta: String): String;
var
  wServidor: String;
  wExec: TExecucoesList;
  execucaoConsultaCadastro: TExecucaoConsultaCadastro;
begin
  if Length(ParamConsulta) = 11 then
  begin
    if not bib.ValidaCPF(ParamConsulta) then
      raise Exception.Create('Digite um CPF válido.');
  end
  else if Length(ParamConsulta) = 14 then
  begin
    if not bib.ValidaCGC(ParamConsulta) then
      raise Exception.Create('Digite um CNPJ válido.');
  end
  else
    raise Exception.Create('Digite um CPF / CNPJ válido.');
  wServidor := DMOracle.FastSelect('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));

  wExec := TExecucoesList.Create;
  execucaoConsultaCadastro := TExecucaoConsultaCadastro.Create(wServidor, Filial,UFCadastro,
            ParamConsulta);
  wExec.Add(execucaoConsultaCadastro);
  ExecutaAcoes(wExec);
  if (execucaoConsultaCadastro.FRetorno.Status = 111) or (execucaoConsultaCadastro.FRetorno.Status = 112) then
    Result := execucaoConsultaCadastro.FRetorno.Complemento
  else
    Result := '';
end;

procedure TDMNfe.ImprimeCCe(CodNota: Integer);
begin
  with DMNfe do
  begin
    QNfeEmissao.Close;
    QNfeEmissao.ClearVariables;
    QNfeEmissao.SetVariable('NOTA_CAB', CodNota);
    QNfeEmissao.Open;

    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QGeraCce.Close;
    QGeraCce.Open;

    QGeraCceItem.Close;
    QGeraCceItem.Open;

    QGeraCceItem.Last;

    if FNFeParam = nil then
      FNFeParam := TFNFeParam.Create(Application);
    FNFeParam.AtivaPagina(14);
    FNFeParam.ME14Impressora.Text := QNfeEmissaoDESC_IMPRESSORA_DANFE.Value;
    if FNFeParam.ShowModal = MrOk then
    begin
      if Trim(FNFeParam.ME14Impressora.Text) = '' then
        MessageDlg('Impressora não informada.'+#13+#10+
            'Por favor, informe uma impressora.',
            mtInformation, [mbOK], 0)
      else
        ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoImprimeCCe.Create( QNfeEmissaoDESC_REPOSITORIO_NFE.Value,
          QGeraCceItemID_EVENTO.Value,Trim(FNFeParam.ME14Impressora.Text))));
    end;
  end;
end;
procedure TDMNfe.ImprimeCCeCTe(CodConhecimento: Integer);
begin
  with DMNfe do
  begin
    QCteEmissao.Close;
    QCteEmissao.ClearVariables;
    QCteEmissao.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QCteEmissao.Open;

    QGeraCte.Close;
    QGeraCte.ClearVariables;
    QGeraCte.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QGeraCte.Open;

    QGeraCteEvento.Close;
    QGeraCteEvento.ClearVariables;
    QGeraCteEvento.SetVariable('DESC_CHAVE_ACESSO', LimpaChave(QGeraCteDESC_CHAVE_ACESSO_CTE.Value));
    QGeraCteEvento.SetVariable('TP_EVENTO', TP_EVENTO_DFE_CARTA_CORRECAO);
    QGeraCteEvento.Open;
    QGeraCteEvento.Last;

    if FNFeParam = nil then
      FNFeParam := TFNFeParam.Create(Application);
    FNFeParam.AtivaPagina(14);
    FNFeParam.ME14Impressora.Text := QCteEmissaoDESC_IMPRESSORA_DACTE.Value;
    if FNFeParam.ShowModal = MrOk then
    begin
      if Trim(FNFeParam.ME14Impressora.Text) = '' then
        MessageDlg('Impressora não informada.'+#13+#10+
            'Por favor, informe uma impressora.',
            mtInformation, [mbOK], 0)
      else
        ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoImprimeCCeCTe.Create( QCteEmissaoDESC_REPOSITORIO_NFE.Value,
          QGeraCteEventoID_EVENTO.Value,Trim(FNFeParam.ME14Impressora.Text))));
    end;
  end;
end;
function TDMNfe.PreparaEmailCCe(CodNota: Integer; Xml,
  Pdf: Boolean): TObject;
var
  Assunto, Corpo: String;
begin
  with Bib do
  begin
    Assunto := 'Carta Correção NF-e ' + QGeraNfeNUM_NOTA.Text +
      ' Chave ' + QGeraCceDESC_CHAVE_ACESSO.Value;

    Corpo := 'Carta de Correção Eletrônica Referente ao NF-e '+ QGeraNfeNUM_NOTA.Text +
      ' Série ' + QGeraNfeCOD_SERIE.Value + 
      '<p>' + QGeraNfeCPF_CNPJ_CADASTRO.Value +
      '<p>' + QGeraNfeNOME_CADASTRO.Value;
  end;
  Result := TExecucaoEnviaEmailCCe.Create( QNfeEmissaoDESC_REPOSITORIO_NFE.Value,
      DMNfe.QGeraCceItemID_EVENTO.Value, QGeraNfeEMAIL_CADASTRO.Value, Assunto, Corpo, Xml, Pdf)
end;
function TDMNfe.PreparaEmailCCeCTe(CodConhecimento: Integer; Xml,
  Pdf: Boolean): TObject;
var
  Assunto, Corpo: String;
begin
  with Bib do
  begin
    Assunto := 'Carta Correção CT-e ' + QGeraCteNUM_CONHECIMENTO.Text +
      ' Chave ' + QGeraCteEventoDESC_CHAVE_ACESSO.Value;

    Corpo := 'Carta de Correção Eletrônica Referente ao CT-e '+ QGeraCteNUM_CONHECIMENTO.Text +
      ' Série ' + QGeraCteCOD_SERIE.Value +
      '<p>' + QGeraCteCPF_CNPJ_TOM.Value +
      '<p>' + QGeraCteNOME_TOM.Value;
  end;
  Result := TExecucaoEnviaEmailCCeCTe.Create( QCteEmissaoDESC_REPOSITORIO_NFE.Value,
      DMNfe.QGeraCteEventoID_EVENTO.Value, QGeraCteEMAIL_TOM.Value, Assunto, Corpo, Xml, Pdf)
end;
procedure TDMNfe.EnviarEmailCCe(CodNota: Integer; Xml, Pdf: Boolean);
var
  DescEmail: String;
  ExecEmailCCe: TExecucaoEnviaEmailCCe;
begin
  with DMNfe do
  begin
  if (not QGeraNfe.Active) or (QGeraNfe.Active and (QGeraNfeCOD_NOTA_CAB.Value <> CodNota)) then
  begin
    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QGeraCce.Close;
    QGeraCce.Open;

    QGeraCceItem.Close;
    QGeraCceItem.Open;
    QGeraCceItem.Last;
  end;
  end;
  if (not QNfeEmissao.Active) or (QNfeEmissao.Active and (QNfeEmissaoCOD_NOTA_CAB.Value <> CodNota)) then
  begin
    QNfeEmissao.Close;
    QNfeEmissao.ClearVariables;
    QNfeEmissao.SetVariable('NOTA_CAB', CodNota);
    QNfeEmissao.Open;
  end;

  ExecEmailCCe := TExecucaoEnviaEmailCCe(PreparaEmailCCe(CodNota,Xml,Pdf));
  DescEmail := ExecEmailCCe.Email;
  if InputQuery('E-mail','Informe o e-mail para ' + QGeraNfeNOME_CADASTRO.Value +
    ' ou cancele para não enviar para este cliente:', DescEmail) then
  begin
    ExecEmailCCe.Email := DescEmail;
    ExecutaAcoes(TExecucoesList.Create.Add(ExecEmailCCe));
  end;
end;

procedure TDMNfe.EnviarEmailCCeCTe(CodConhecimento: Integer; Xml, Pdf: Boolean);
var
  DescEmail: String;
  ExecEmailCCe: TExecucaoEnviaEmailCCeCTe;
begin
  with DMNfe do
  begin
  if (not QGeraCte.Active) or (QGeraCte.Active and (QGeraCteCOD_CONHECIMENTO.Value <> CodConhecimento)) then
  begin
    QGeraCte.Close;
    QGeraCte.ClearVariables;
    QGeraCte.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QGeraCte.Open;

    QGeraCteEvento.Close;
    QGeraCteEvento.ClearVariables;
    QGeraCteEvento.SetVariable('DESC_CHAVE_ACESSO', LimpaChave(QGeraCteDESC_CHAVE_ACESSO_CTE.Value));
    QGeraCteEvento.SetVariable('TP_EVENTO', TP_EVENTO_DFE_CARTA_CORRECAO);
    QGeraCteEvento.Open;
    QGeraCteEvento.Last;
  end;
  end;
  if (not QCteEmissao.Active) or (QCteEmissao.Active and (QCteEmissaoCOD_CONHECIMENTO.Value <> CodConhecimento)) then
  begin
    QCteEmissao.Close;
    QCteEmissao.ClearVariables;
    QCteEmissao.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QCteEmissao.Open;
  end;

  ExecEmailCCe := TExecucaoEnviaEmailCCeCTe(PreparaEmailCCeCTe(CodConhecimento,Xml,Pdf));
  DescEmail := ExecEmailCCe.Email;
  if InputQuery('E-mail','Informe o e-mail para ' + QGeraCteNOME_TOM.Value +
    ' ou cancele para não enviar para este cliente:', DescEmail) then
  begin
    ExecEmailCCe.Email := DescEmail;
    ExecutaAcoes(TExecucoesList.Create.Add(ExecEmailCCe));
  end;
end;

procedure TDMNfe.SalvarCCePdf(CodNota: Integer; Caminho: String);
begin
  with dmnfe do
  begin
    QNfeEmissao.Close;
    QNfeEmissao.ClearVariables;
    QNfeEmissao.SetVariable('NOTA_CAB', CodNota);
    QNfeEmissao.Open;

    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QGeraCce.Close;
    QGeraCce.Open;

    QGeraCceItem.Close;
    QGeraCceItem.Open;
    QGeraCceItem.Last;
    ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoSalvaCCePdf.Create( QNfeEmissaoDESC_REPOSITORIO_NFE.Value,
      QGeraCceItemID_EVENTO.Value,Caminho)));
  end;
end;
procedure TDMNfe.SalvarCCeCTePdf(CodConhecimento: Integer; Caminho: String);
var
  wServidor: String;
begin
  with dmnfe do
  begin
    QCteEmissao.Close;
    QCteEmissao.ClearVariables;
    QCteEmissao.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QCteEmissao.Open;

    QGeraCte.Close;
    QGeraCte.ClearVariables;
    QGeraCte.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QGeraCte.Open;

    QGeraCteEvento.Close;
    QGeraCteEvento.ClearVariables;
    QGeraCteEvento.SetVariable('DESC_CHAVE_ACESSO', LimpaChave(QGeraCteDESC_CHAVE_ACESSO_CTE.Value));
    QGeraCteEvento.SetVariable('TP_EVENTO', TP_EVENTO_DFE_CARTA_CORRECAO);
    QGeraCteEvento.Open;
    QGeraCteEvento.Last;

    if (QNfeEmissaoDESC_REPOSITORIO_NFE.Value <> '') then
      wServidor:= QNfeEmissaoDESC_REPOSITORIO_NFE.Value
    else
      wServidor := DMOracle.FastSelect('desc_repositorio_nfe','tb_filial','cod_filial = ' + QCteEmissaoCOD_FILIAL.Text);// IntToStr(Filial));

    ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoSalvaCCeCTePdf.Create(wServidor, QGeraCteEventoID_EVENTO.Value,Caminho)));
    {ExecutaAcoes(TExecucoesList.Create.Add(TExecucaoSalvaCCeCTePdf.Create( QNfeEmissaoDESC_REPOSITORIO_NFE.Value,
      QGeraCteEventoID_EVENTO.Value,Caminho)));}
  end;
end;

procedure TDMNfe.InutilizaNumeracaoNfe();
  function valida(Value, Lbl: String): Boolean;
  begin
    Result := (Value <> '');
    if not Result then
      MessageDlg(Lbl + ': Campo obrigatório!', mtError, [mbOK], 0);
  end;
var
  wFilial, wSerie, wNumIni, wNumFim, wEstado, wJust, wRepNfe, wAmb, wCont, wMod: String;
begin
  if FNFeParam = nil then
    FNFeParam := TFNFeParam.Create(Application);
  FNFeParam.PGRelatorio.Pages[0].TabVisible := True;
  if FNFeParam.ShowModal = MrOk then
  begin
    //wEstado := Trim(FNFeParam.Fm0Estado.MeEstado.Text);
    wEstado := DMOracle.FastSelect('COD_UF_IBGE', 'TB_ESTADO','COD_ESTADO = ' +
        QuotedStr(trim(FNFeParam.Fm0Estado.MeEstado.Text)));
    wFilial := Trim(FNFeParam.Fm0Filial.MeFilial.Text);
    wSerie := Trim(FNFeParam.ME0Serie.Text);
    wNumIni := Trim(FNFeParam.ME0NumInicial.Text);
    wNumFim := Trim(FNFeParam.ME0NumFinal.Text);
    wJust := Trim(FNFeParam.ME0Justificativa.Text);
    wMod := Copy(FNFeParam.CB0Modelo.Text,1,2);
    if (not valida(wFilial, 'Filial')) or
        (not valida(wEstado, 'Estado')) or
        (not valida(wSerie, 'Série')) or
        (not valida(wNumIni, 'Número inicial')) or
        (not valida(wNumFim, 'Número final')) or
        (not valida(wJust, 'Justificativa')) then
      Exit;
    if (Length(wJust) < 15) then
    begin
      MessageDlg('Justificativa precisa ao menos 15 caracteres.', mtError, [mbOK], 0);
      Exit;
    end;

    if (wNumIni = '0') then
    begin
      MessageDlg('Númeração inicial inválida.', mtError, [mbOK], 0);
      Exit;
    end;
    if (wNumFim = '0') then
    begin
      MessageDlg('Númeração final inválida.', mtError, [mbOK], 0);
      Exit;
    end;
    if (StrToInt(wNumIni) > StrToInt(wNumFim)) then
    begin
      MessageDlg('Númeração inicial maior que a final.', mtError, [mbOK], 0);
      Exit;
    end;
    Buscador.Limpa;
    Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    if wMod = '55' then
      Buscador.Adiciona('IND_AMBIENTE_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial)
    else
      Buscador.Adiciona('IND_AMBIENTE_NFCE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Adiciona('IND_CONTINGENCIA', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Buscar;

    wRepNfe := Buscador.Proximo;
    wAmb := Buscador.Proximo;
    wCont := Buscador.Proximo;
    Buscador.Fecha;
    ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoInutilizaNum.Create( wRepNfe, StrToInt(wFilial),
      StrToInt('0' + wEstado), StrToInt('0' + wSerie),
      StrToInt('0' + wAmb), StrToInt('0' + wNumIni),
      StrToInt('0' + wNumFim), wJust, StrToInt('0' + wCont),StrToInt('0'+wMod),DMUsuario.CodUsuarioCorrente)));
  end;
end;
procedure TDMNfe.InutilizaNumeracaoNfe(CodFilial: Integer; Serie: String;
  NumInicial, NumFinal: Integer; Estado, Justificativa: String; Ambiente, Modelo: Integer);
var wCodIbgeEstado, wRepNfe: String;
begin
  wRepNfe := DMOracle.FastSelect('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(CodFilial));
  wCodIbgeEstado := DMOracle.FastSelect('COD_UF_IBGE', 'TB_ESTADO','COD_ESTADO = ' +
        QuotedStr(Estado));
  ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoInutilizaNum.Create(wRepNfe, CodFilial,
      StrToInt('0' + wCodIbgeEstado), StrToInt('0' + Serie),
      Ambiente, NumInicial, NumFinal, Justificativa, 1, Modelo, DMUsuario.CodUsuarioCorrente)));
end;
procedure TDMNfe.InutilizaNumeracaoCTe;
  function valida(Value, Lbl: String): Boolean;
  begin
    Result := (Value <> '');
    if not Result then
      MessageDlg(Lbl + ': Campo obrigatório!', mtError, [mbOK], 0);
  end;
var
  wFilial, wSerie, wNumIni, wNumFim, wEstado, wJust, wRepNfe, wAmb, wCont, wMod: String;
begin
  if FNFeParam = nil then
    FNFeParam := TFNFeParam.Create(Application);
  FNFeParam.PGRelatorio.Pages[8].TabVisible := True;
  if FNFeParam.ShowModal = MrOk then
  begin
    //wEstado := Trim(FNFeParam.Fm0Estado.MeEstado.Text);
    wEstado := DMOracle.FastSelect('COD_UF_IBGE', 'TB_ESTADO','COD_ESTADO = ' +
        QuotedStr(trim(FNFeParam.Fm8Estado.MeEstado.Text)));
    wFilial := Trim(FNFeParam.Fm8Filial.MeFilial.Text);
    wSerie := Trim(FNFeParam.ME8Serie.Text);
    wNumIni := Trim(FNFeParam.ME8NumInicial.Text);
    wNumFim := Trim(FNFeParam.ME8NumFinal.Text);
    wJust := Trim(FNFeParam.ME8Justificativa.Text);
    wMod := Copy(FNFeParam.CB8Modelo.Text,1,2);
    if (not valida(wFilial, 'Filial')) or
        (not valida(wEstado, 'Estado')) or
        (not valida(wSerie, 'Série')) or
        (not valida(wNumIni, 'Número inicial')) or
        (not valida(wNumFim, 'Número final')) or
        (not valida(wJust, 'Justificativa')) then
      Exit;
    if (Length(wJust) < 15) then
    begin
      MessageDlg('Justificativa precisa ao menos 15 caracteres.', mtError, [mbOK], 0);
      Exit;
    end;
    if (wSerie = '0') then
    begin
      MessageDlg('Série inválida.', mtError, [mbOK], 0);
      Exit;
    end;
    if (wNumIni = '0') then
    begin
      MessageDlg('Númeração inicial inválida.', mtError, [mbOK], 0);
      Exit;
    end;
    if (wNumFim = '0') then
    begin
      MessageDlg('Númeração final inválida.', mtError, [mbOK], 0);
      Exit;
    end;
    if (StrToInt(wNumIni) > StrToInt(wNumFim)) then
    begin
      MessageDlg('Númeração inicial maior que a final.', mtError, [mbOK], 0);
      Exit;
    end;
    Buscador.Limpa;
    Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Adiciona('IND_AMBIENTE_CTE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Adiciona('IND_CONTINGENCIA_CTE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Buscar;

    wRepNfe := Buscador.Proximo;
    wAmb := Buscador.Proximo;
    wCont := Buscador.Proximo;
    Buscador.Fecha;
    ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoInutilizaNumCTe.Create(wRepNfe, StrToInt(wFilial),
      StrToInt('0' + wEstado), StrToInt('0' + wSerie),
      StrToInt('0' + wAmb), StrToInt('0' + wNumIni),
      StrToInt('0' + wNumFim), wJust, StrToInt('0' + wCont), StrToInt(wMod), DMUsuario.CodUsuarioCorrente)));

    with FNFeParam do
    begin
      ME0Justificativa.Text := '';
      ME0Serie.Text := '0';
      ME0NumInicial.Text := '0';
      ME0NumFinal.Text := '0';
    end;
  end;
end;

procedure TDMNfe.ConsultaMDFesNaoEncerrados;
function valida(Value, Lbl: String): Boolean;
  begin
    Result := (Value <> '');
    if not Result then
      MessageDlg(Lbl + ': Campo obrigatório!', mtError, [mbOK], 0);
  end;
var
  wFilial, wRepNfe, wAmb, wVersao: String;
begin
  if FNFeParam = nil then
    FNFeParam := TFNFeParam.Create(Application);
  FNFeParam.PGRelatorio.Pages[12].TabVisible := True;
  if FNFeParam.ShowModal = MrOk then
  begin
    wFilial := Trim(FNFeParam.Fm12Filial.MeFilial.Text);
    if (not valida(wFilial, 'Filial')) then
      Exit;

    Buscador.Limpa;
    Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Adiciona('IND_AMBIENTE_MDFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Adiciona('DESC_VERSAO_MDFE', 'TB_FILIAL', 'COD_FILIAL = ' + wFilial);
    Buscador.Buscar;

    wRepNfe := Buscador.Proximo;
    wAmb := Buscador.Proximo;
    wVersao := Buscador.Proximo;
    Buscador.Fecha;
    ExecutaAcoes(TExecucoesList.Create.Add(
      TExecucaoConsultaMDFesNaoEncerrados.Create(wRepNfe, StrToInt(wFilial), 41,
      StrToInt('0' + wAmb),wVersao)));
  end;
end;

function TDMNfe.ExisteNfe(chaveAcesso: String; table: String = 'TB_NF_ELETRONICA'): Boolean;
begin
  Result := (DMOracle.FastSelect('DESC_CHAVE_ACESSO', table,
        'DESC_CHAVE_ACESSO = ' + QuotedStr(LimpaChave(chaveAcesso))) <> '');
end;



//(*
// * Função que serve para adicionar as TAGS que identificam uma String bloqueada.
// * Uma string bloqueada nao será limpada dentro da função LimpaStrXML.
// *)
//function TDMNfe.BlockStr(Str: String): String;
//begin
//  Result := Str;
//  if Str <> '' then
//    Result := BLOCKED_STR_BEGIN + Str + BLOCKED_STR_END;
//end;

function TDMNfe.LimpaStrXML(wStr: String; exce: String = ''): String;
var
  wRes, wExcecoes, wAdd: String;
  wChar: Char;
  i: Integer; //, lenBlocB, lenBlocE: Integer;
  wTag: Boolean; //, wBlocked: Boolean;
begin
  wRes := '';
  wTag := False;
  //wBlocked := False;
  wExcecoes := '@ -.,&":/\%)($=><;+' + chr(39) + exce;
  //lenBlocB := Length(BLOCKED_STR_BEGIN);
//  lenBlocE := Length(BLOCKED_STR_END);
  i := 1;
  while i <= Length(wStr) do
  Begin
    //if Copy(wStr, i, lenBlocB) = BLOCKED_STR_BEGIN then
//    begin
//      Inc(i, lenBlocB);
//      wBlocked := True;
//    end
//    else if Copy(wStr, i, lenBlocE) = BLOCKED_STR_END then
//    begin
//      Inc(i, lenBlocE);
//      wBlocked := False;
//    end;

    wChar := wStr[i];
    if wChar = '<' then
      wTag := True;
    wAdd := wChar;
    if not wTag  then
    begin
      if wChar in ['à', 'á', 'ã', 'â', 'ä'] then
        wChar := 'a';
      if wChar in ['é', 'è', 'ê', 'ë'] then
        wChar := 'e';
      if wChar in ['í', 'ì', 'ï', 'î'] then
        wChar := 'i';
      if wChar in ['ó', 'õ', 'ô', 'ò', 'ö'] then
        wChar := 'o';
      if wChar in ['ú', 'ù', 'ü', 'û'] then
        wChar := 'u';
      if wChar in ['ç'] then
        wChar := 'c';

      if wChar in ['À', 'Á', 'Ã', 'Â', 'Ä'] then
        wChar := 'A';
      if wChar in ['É', 'È', 'Ê', 'Ë'] then
        wChar := 'E';
      if wChar in ['Í', 'Ì', 'Ï', 'Î'] then
        wChar := 'I';
      if wChar in ['Ó', 'Õ', 'Ô', 'Ò', 'Ö'] then
        wChar := 'O';
      if wChar in ['Ú', 'Ù', 'Ü', 'Û'] then
        wChar := 'U';
      if wChar in ['Ç'] then
        wChar := 'C';

      if (PosEx(wChar, wExcecoes) < 1) and (not (wChar in ['A'..'Z','a'..'z', '0'..'9'])) then
        wAdd := ''
      else if wChar = '&' then
        wAdd := '&amp;'
      else if wChar = '"' then
        wAdd := '&quot;'
  //    else if wChar = chr(39) then
//        wAdd := '&#39;'
//      else if wChar = chr(37) then
//        wAdd := '&#37;'
      //else if wChar = ',' then
       // wAdd := '.'
//      else if wChar = '$' then
//        wadd := '&#36;'
      else
        wAdd := wChar;
    end;
    wRes := wRes + wAdd;
    if wChar = '>' then
      wTag := False;
    Inc(i);
  End;
  Result := Bib.RemoveEspacoDuplo(wRes);
end;

function TDMNfe.LimpaChave(Chave: String): String;
begin
  Result := Bib.LimpaNumero(Chave);
end;

procedure TDMNfe.QNfeCalcFields(DataSet: TDataSet);
begin
  QNfeind_aprovado.Value := (StrToInt('0' + QNfeSIT_NFE.Value) in [100,150]);
  QNfeind_cancelado.Value := (StrToInt('0' + QNfeSIT_CANC.Value) in SIT_NFE_CANCELA);
  QNfeind_denegado.Value := (StrToInt('0' + QNfeSIT_NFE.Value) - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
end;

procedure TDMNfe.QNfeConsEntrCalcFields(DataSet: TDataSet);
begin
  QNfeConsEntrind_aprovado.Value := (StrToInt('0' + QNfeConsEntrDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_ACEITO);
  QNfeConsEntrind_cancelado.Value := (StrToInt('0' + QNfeConsEntrDESC_RETORNO_PROCESSAMENTO.Value) in SIT_NFE_CANCELA);
  QNfeConsEntrind_denegado.Value := (StrToInt('0' + QNfeConsEntrDESC_RETORNO_PROCESSAMENTO.Value) - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
end;


procedure TDMNfe.QNfeStatusServicoCalcFields(DataSet: TDataSet);
begin
  if not QNfeStatusServicoDESC_MOTIVO.IsNull then
    QNfeStatusServicomotivo.Value := QNfeStatusServicoDESC_MOTIVO.Value;
end;

procedure TDMNfe.QGeraNfeAfterOpen(DataSet: TDataSet);
begin
  QGeraNfeItem.Close;
  QGeraNfeItem.Open;
end;

procedure TDMNfe.QGeraNfeBeforeClose(DataSet: TDataSet);
begin
  QGeraNfeItem.Close;
end;

function TDMNfe.EmissaoNfe(CodNota: Integer; IdLote: Int64 = 0; EnviarNFe: Boolean = False): Boolean;
  function AdicionaEmLote(var IdLote: Int64; NFe: TNFe; ChaveAntiga: String): Boolean;
  begin
    Result := True;
    with DMNfEletronicaLote do
    begin
      QNfeLote.Close;
      QNfeLote.SetVariable('PK', IdLote);
      QNfeLote.Open;
      if IdLote = 0 then //Novo Lote de NF-e
        QNfeLote.Append
      else
        QNfeLote.Edit;
      QNfeLoteCOD_FILIAL.Value := QNfeEmissaoCOD_FILIAL.Value;
      QNfeLote.Post;
      if (NFe.InfNfe.Id <> ChaveAntiga) then
        DMOracle.ExecutaSql(MontaDelete('TB_NF_ELETRONICA_CONS',
            'DESC_CHAVE_ACESSO = ' + QuotedStr(Bib.LimpaNumero(ChaveAntiga))), False);
      QNfeLoteItem.Close;
      QNfeLoteItem.ClearVariables;
      QNfeLoteItem.SetVariable('COD_NOTA_CAB', CodNota);
      QNfeLoteItem.Open;
      if QNfeLoteItem.Eof then
        QNfeLoteItem.Append
      else
      begin
        if QNfeLoteItemDESC_CHAVE_ACESSO.Value = Bib.LimpaNumero(NFe.InfNfe.Id) then
          QNfeLoteItem.Edit
        else
        begin
          QNfeLoteItem.Delete;
          QNfeLoteItem.Append;
        end;
      end;
      QNfeLoteItemDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(NFe.InfNfe.Id);
      QNfeLoteItemCOD_FILIAL.Value := QNfeEmissaoCOD_FILIAL.Value;
      QNfeLoteItemDESC_SERIE.Value := QNfeEmissaoCOD_SERIE.Value;
      QNfeLoteItemNUM_NF_ELETRONICA.Value := QNfeEmissaoNUM_NOTA.Value;
      QNfeLoteItemDESC_XML_NFE.Value := LimpaStrXML(TNfeUtils.GeraXMLNFe(NFe));
      QNfeLoteItemIND_AMBIENTE_NFE.Value := QNfeEmissaoIND_AMBIENTE_NFE.AsInteger;
      QNfeLoteItemDESC_LOGOTIPO.Value := QNfeEmissaoDESC_LOGOTIPO_DANFE.Value;
      QNfeLoteItemDESC_CERTIFICADO.Value := QNfeEmissaoDESC_CERTIFICADO.Value;
      QNfeLoteItemDESC_IMPRESSORA.Value := QNfeEmissaoDESC_IMPRESSORA_DANFE.Value;
      QNfeLoteItemCOD_NOTA_CAB.Value := CodNota;
      if (QNfeLoteItemIND_CONTINGENCIA.Value = '') AND (Bib.ift(QNfeEmissaoCOD_SERIE_MODELO.Value = '55',
          QNfeEmissaoIND_CONTINGENCIA.Value, QNfeEmissaoIND_CONTINGENCIA_NFCE.Value) = '9') then
      begin
        QNfeLoteItemIND_CONTINGENCIA.Value := '9';
        QNfeLoteItemDT_CONTINGENCIA.Value := QNfeEmissaoDT_CONTINGENCIA_NFCE.Value;
        QNfeLoteItemDESC_JUST_CONTINGENCIA.Value := QNfeEmissaoDESC_JUST_CONTINGENCIA_NFCE.Value;
      end;
      QNfeLoteItemID_LOTE.Value := QNfeLoteID_LOTE.Value;
      QNfeLoteItem.Post;

      IdLote := QNfeLoteID_LOTE.AsInteger;
    end;
  end;
  function AdicionaEmLoteRps(var IdLote: Int64; Rps: TObject; Chave: String): Boolean;
  begin
  Result := True;
    with DMNfEletronicaLote do
    begin
      QNfeLote.Close;
      QNfeLote.SetVariable('PK', IdLote);
      QNfeLote.Open;
      if IdLote = 0 then //Novo Lote de NF-e
        QNfeLote.Append
      else
      begin
        if QNfeEmissaoDESC_VERSAO_NFSE.Value = 'ELOTECH 2.03' then
        begin
          QNfeLoteItem.Close;
          QNfeLoteItem.ClearVariables;
          QNfeLoteItem.SetVariable('ID_LOTE', IdLote);
          QNfeLoteItem.Open;
          if (QNfeLoteItem.RecordCount > 1) or (QNfeLoteItemCOD_NOTA_CAB.Value <> CodNota) then
            QNfeLote.Edit
          else
          begin
            QNfeLote.Delete;
            QNfeLote.Append;
          end;
        end
        else
          QNfeLote.Edit;
      end;
      QNfeLoteCOD_FILIAL.Value := QNfeEmissaoCOD_FILIAL.Value;
      QNfeLote.Post;

      QNfeLoteItem.Close;
      QNfeLoteItem.ClearVariables;
      QNfeLoteItem.SetVariable('COD_NOTA_CAB', CodNota);
      QNfeLoteItem.Open;
      if QNfeLoteItem.Eof then
        QNfeLoteItem.Append
      else
        QNfeLoteItem.Edit;
      QNfeLoteItemDESC_XML_NFE.Value := 'NFS-e';
      QNfeLoteItemIND_NFSE.Value := 'SIM';
      QNfeLoteItemDESC_CHAVE_ACESSO.Value := Chave;
      QNfeLoteItemCOD_FILIAL.Value := QNfeEmissaoCOD_FILIAL.Value;
      QNfeLoteItemDESC_SERIE.Value := QNfeEmissaoCOD_SERIE.Value;
      QNfeLoteItemNUM_NF_ELETRONICA.Value := QNfeEmissaoNUM_NOTA.Value;
      if(Rps is TCDPS) then
        QNfeLoteItemDESC_XML_RPS.Value := TNfseNacionalUtils.GeraXMLDPS(TCDPS(Rps))
      else if(Rps is TRps) then
        QNfeLoteItemDESC_XML_RPS.Value := TNfseUtils.GeraXMLRps(TRps(Rps))
      else
        QNfeLoteItemDESC_XML_RPS.Value := TNfseUtils.
          GeraXMLDeclaracaoPrestacaoServico(TDeclaracaoPrestacaoServico(Rps));
      QNfeLoteItemDESC_CERTIFICADO.Value := QNfeEmissaoDESC_CERTIFICADO.Value;
      QNfeLoteItemDESC_LOGOTIPO.Value := QNfeEmissaoDESC_LOGOTIPO_DANFE.Value;
      QNfeLoteItemIND_AMBIENTE_NFE.Value := QNfeEmissaoIND_AMBIENTE_NFE.AsInteger;
      QNfeLoteItemCOD_NOTA_CAB.Value := CodNota;
      QNfeLoteItemID_LOTE.Value := QNfeLoteID_LOTE.Value;
      QNfeLoteItem.Post;

      IdLote := QNfeLoteID_LOTE.AsInteger;
    end;
  end;
var
  NFe: TNfe;
  Rps: TObject;
  Chave, ChaveAntiga: String;
  B: Boolean;
  Cli: TNFeCliente;
  Acs: TAcoesLote;
  wVias: String;
  mr : TModalResult;
begin
  Result := False;
  //Gerando nfe para ser enviada
  try
    QNfeEmissao.Close;
    QNfeEmissao.ClearVariables;
    QNfeEmissao.SetVariable('NOTA_CAB', CodNota);
    QNfeEmissao.Open;

    if (not QNfeEmissao.Eof) and ((QNfeEmissaoDESC_MODELO.Value = '55') or (QNfeEmissaoDESC_MODELO.Value = '65') or (QNfeEmissaoDESC_MODELO.Value = '98')) and
        (QNfeEmissaoIND_EMITE.Value = 'F') then
    begin
      if QNfeEmissaoIND_SITUACAO.Value <> '2' then
      begin
        MessageDlg('NF não confirmada.', mtInformation, [mbOK], 0);
        Exit;
      end;

      //---------------------- Emissão de NFS-e --------------------------//
      if QNfeEmissaoIND_SERVICO.Value = 'S' then
      begin
        ValidaNfse;
        Chave :=  QNfeEmissaoDESC_CHAVE_ACESSO.Value;
        if Chave = '' then
          Chave := 'NFe' + TNfseUtils.GeraChaveAcesso(QNfeEmissaoNUM_NOTA.Value,QNfeEmissaoDT_EMISSAO.Value, QNfeEmissaoCOD_NOTA_CAB.Value);

        if FNFeParam = nil then
          FNFeParam := TFNFeParam.Create(Application);
        FNFeParam.ME3Chave.Text := Chave;

        if QNfeEmissaoDESC_VERSAO_NFSE.Value = 'NACIONAL' then
        begin
          Rps := TNfseNacionalUtils.GeraDPS(CodNota);
          FNFeParam.DPS := TCDPS(Rps);
        end
        else if (QNfeEmissaoDESC_VERSAO_NFSE.Value = 'ELOTECH') or
          (QNfeEmissaoDESC_VERSAO_NFSE.Value = 'ELOTECH 2.03') then
        begin
          Rps := TNfseUtils.GeraDeclaracaoPrestacaoServico(CodNota);
          FNFeParam.DeclaracaoPrestacaoServico := TDeclaracaoPrestacaoServico(Rps);
        end
        else
        begin
          Rps := TNfseUtils.GeraRps(CodNota);
          FNFeParam.Rps := TRps(Rps);
        end;
        B := True;
        while B do
        begin
          FNFeParam.AtivaPagina(5);
          FNFeParam.ME5Chave.Enabled := not (QNfeind_aprovado.Value or
              QNfeind_cancelado.Value or QNfeind_denegado.Value);
          FNFeParam.RG5Ambiente.ItemIndex := QNfeEmissaoIND_AMBIENTE_NFE.AsInteger - 1;
          mr := mrCancel;
          if EnviarNFe then
          begin
              FNFeParam.RG5EmissaoNfse.ItemIndex := 0;
              mr := FNFeParam.ShowModal;
          end
          else
            FNFeParam.RG5EmissaoNfse.ItemIndex := 1;

          if (QNfeEmissaoDESC_CHAVE_ACESSO.Value <> Chave) then
            DMOracle.ExecutaSql(MontaUpdate('DESC_CHAVE_ACESSO',
              QuotedStr(Chave), 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(CodNota)), False);
          if(Rps is TRps) then
            TRps(Rps).InfRps.Id := 'rps_'+QNfeEmissaoNUM_NOTA.AsString+QNfeEmissaoCOD_SERIE.AsString;

          Chave := RightStr(Chave,Length(Chave)-3);
          if AdicionaEmLoteRps(IdLote, Rps, Chave) then
            DMOracle.DBCemapa.Commit
          else
            Continue;
          B := False;

          if mr = MrOk then
          begin
            Cli := TNFeCliente.GetNFeCliente(QNfeEmissaoDESC_REPOSITORIO_NFE.Value);
            if Cli = nil then
            begin
              MessageDlg('Essa filial não possui configuração de servidor de NF-e.', mtError, [mbOK], 0);
              Exit;
            end;
            with FNFeParam do
              if (PC5EmissaoNFSe.ActivePageIndex = 0) or
                  (RG5EmissaoNfse.ItemIndex = 0) then
                with DMNfEletronicaLote do
                begin
                  CarregaLoteCons(IdLote, True);
                  CDSNfeLoteItemCons.First;
                  while not CDSNfeLoteItemCons.Eof do
                  begin
                    SetSelecaoItem;
                    CDSNfeLoteItemCons.Edit;
                    CDSNfeLoteItemConsEMAIL_XML.Value := IfThen(CB5EmailXML.Checked, 'S');
                    CDSNfeLoteItemConsEMAIL_PDF.Value := IfThen(CB5EmailPDF.Checked, 'S');
                    if (CB5Danfe.Checked and (QNfeEmissaoIND_VIAS_DANFE.Value='S')) then
                    begin
                      wVias := IntToStr(QNfeEmissaoNUM_VIAS_DANFE.Value);
                      InputQuery('Impressão de NFS-e', 'Número de cópias', wVias);
                      CDSNfeLoteItemConsNUM_VIAS_DANFE.Value := StrToInt(wVias);
                    end;
                    CDSNfeLoteItemCons.Post;

                    CDSNfeLoteItemCons.Next;
                  end;

                  Acs := TAcoesLote.Create.Add(alEnvioRps).Add(alConsLoteRps);
                  if CB5Danfe.Checked then
                    Acs.Add(alDanfe);
                  if (CB5Email.Checked) and (CB5EmailXML.Checked or
                      CB5EmailPDF.Checked) then
                    Acs.Add(alEmail);
                  AcaoEmLote(Acs);
                  if DMOracle.DBCemapa.InTransaction then
                    DMOracle.DBCemapa.Commit;
                end;
            Result := True;
          end;
        end;  
      end
      //-------------------------- Emissão de NF-e -------------------------//
      else
      begin
        ValidaNfe;

        Chave := QNfeEmissaoDESC_CHAVE_ACESSO.Value;
        if Chave = '' then
        begin
          Chave := 'NFe' + TNfeUtils.GeraChaveAcesso(
              QNfeEmissaoCOD_UF_IBGE_FILIAL.Value,
              QNfeEmissaoDT_EMISSAO.Value, QNfeEmissaoNUM_CGC.Value,
              StrToInt('0' + QNfeEmissaoDESC_MODELO.Value),
              StrToInt('0' + QNfeEmissaoCOD_SERIE.Value),
              QNfeEmissaoNUM_NOTA.Value,
              StrToInt('0' + Bib.ift(QNfeEmissaoCOD_SERIE_MODELO.Value = '55', QNfeEmissaoIND_CONTINGENCIA.Value,
                QNfeEmissaoIND_CONTINGENCIA_NFCE.Value)));
        end;
        ChaveAntiga := Chave;

        if FNFeParam = nil then
          FNFeParam := TFNFeParam.Create(Application);
        FNFeParam.ME3Chave.Text := Chave;

        if QNfeEmissaoCOD_SERIE_MODELO.Value = '65' then
          NFe := TNfeUtils.GeraNFce(CodNota)
        else
          NFe := TNfeUtils.GeraNFe(CodNota);

        NFe.InfNFe.InfRespTec.HashCSRT := CalcularHashCSRT(DMParamSistema.QParamSistemaDESC_CSRT.Value, Bib.LimpaNumero(Chave));

        FNFeParam.NFe := NFe;
        B := True;
        while B do
        begin
          FNFeParam.AtivaPagina(3);
          SetaNfe(Bib.LimpaNumero(Chave), True);
          FNFeParam.ME3Chave.Enabled := not (QNfeind_aprovado.Value or
              QNfeind_cancelado.Value or QNfeind_denegado.Value);
          FNFeParam.RG3Ambiente.ItemIndex := QNfeEmissaoIND_AMBIENTE_NFE.AsInteger - 1;
          FNFeParam.RG3Contingencia.ItemIndex := StrToInt('0' +
              QNfeEmissaoIND_CONTINGENCIA.Value) - 1;
          FNFeParam.CB3Email.Checked := True;
          if NotaAutomaticaFlag = Nil then
            NotaAutomaticaFlag := TNotaAutomaticaFlag.Create;
          if (QNfeEmissaoCOD_SERIE_MODELO.Value = '65') or
             (DMDevolucaoTroca.QNotaSaidaCons.Active and
              DMNotaEntrada.QNotaReferenciada.Active and
              (DMNotaEntrada.QNotaReferenciadaCOD_NOTA_CAB.Value =
               QNfeEmissaoCOD_NOTA_CAB.Value) and
              (DMNotaEntrada.QNotaReferenciadaCOD_NOTA_CAB_REF.Value=
               DMDevolucaoTroca.QNotaSaidaConsCOD_NOTA_CAB.Value)) or
               NotaAutomaticaFlag.pNotaAutomatica then
          begin
            FNFeParam.CB3Email.Checked := False;
            if NotaAutomaticaFlag.pNotaAutomatica then
            begin
              if trim(QNfeEmissaoDESC_E_MAIL.Value) <> '' then
                FNFeParam.CB3Email.Checked := true;
            end;
              
            if (QNfeEmissaoCOD_SERIE_MODELO.Value = '55') then
              FNFeParam.CB3Danfe.Checked := False
            else
            begin
              if QNfeEmissaoIND_CONTINGENCIA_NFCE.Value <> '9' then
                FNFeParam.CB3Danfe.Checked := QNfeEmissaoIND_IMPRIME_DANFE_NFCE.Value = 'SIM'
              else
                FNFeParam.CB3Danfe.Checked := False;
            end;
            mr := mrOk;
          end
          else
          begin
            FNFeParam.CB3Danfe.Checked := QNfeEmissaoIND_IMPRIME_DANFE.Value = 'SIM';
            mr := FNFeParam.ShowModal;
          end;
          if mr = mrOk then
          begin
            Chave := 'NFe' + Bib.LimpaNumero(FNFeParam.ME3Chave.Text);
            if Length(Chave) <> 47 then
            begin
              MessageDlg('Chave incorreta', mtError, [mbOK], 0);
              Continue;
            end;
            if (QNfeEmissaoDESC_CHAVE_ACESSO.Value <> Chave) then
              DMOracle.ExecutaSql(MontaUpdate('DESC_CHAVE_ACESSO',
                QuotedStr(Chave), 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(CodNota)), False);
            NFe.InfNfe.Id := Chave;

          //  if FNFeParam.PC3EmissaoNFe.ActivePageIndex = 1 then //Enviar em Lote
          //    Lote := StrToInt('0' + Trim(FNFeParam.Fm3NfeLote.MeCodigo.Text));
            if AdicionaEmLote(IdLote, NFe, ChaveAntiga) then
              DMOracle.DBCemapa.Commit
            else
              Continue;
            B := False;
            Cli := TNFeCliente.GetNFeCliente(QNfeEmissaoDESC_REPOSITORIO_NFE.Value);
            if Cli = nil then
            begin
              MessageDlg('Essa filial não possui configuração de servidor de NF-e.', mtError, [mbOK], 0);
              Exit;
            end;
            with FNFeParam do
              if (PC3EmissaoNFe.ActivePageIndex = 0) or
                  (RG3EmissaoNfe.ItemIndex = 0) then
                with DMNfEletronicaLote do
                begin
                  CarregaLoteCons(IdLote, True);
                  CDSNfeLoteItemCons.First;
                  while not CDSNfeLoteItemCons.Eof do
                  begin
                    SetSelecaoItem;
                    CDSNfeLoteItemCons.Edit;
                    CDSNfeLoteItemConsEMAIL_XML.Value := IfThen(CB3EmailXML.Checked, 'S');
                    CDSNfeLoteItemConsEMAIL_PDF.Value := IfThen(CB3EmailPDF.Checked, 'S');
                    if (CB3Danfe.Checked and
                        (IfThen(QNfeEmissaoCOD_SERIE_MODELO.Value='55',QNfeEmissaoIND_VIAS_DANFE.Value,
                        QNfeEmissaoIND_VIAS_DANFE_NFCE.Value)='S')) then
                    begin
                      wVias := IntToStr(IfThen(QNfeEmissaoCOD_SERIE_MODELO.Value='55',QNfeEmissaoNUM_VIAS_DANFE.Value,
                                        QNfeEmissaoNUM_VIAS_DANFE_NFCE.Value));
                      InputQuery('Impressão de DANFE', 'Número de cópias', wVias);
                      if QNfeEmissaoCOD_SERIE_MODELO.Value='55' then
                        CDSNfeLoteItemConsNUM_VIAS_DANFE.Value := StrToInt(wVias)
                      else
                        CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE.Value := StrToInt(wVias);
                    end;
                    CDSNfeLoteItemCons.Post;

                    CDSNfeLoteItemCons.Next;
                  end;
                  if CB3PrevisualizacaoDanfe.Checked then
                  begin
                    if ExecutaAcoes(TExecucoesList.Create.Add(
                      TExecucaoPrevisualizaDanfe.Create(QNfeEmissaoDESC_REPOSITORIO_NFE.Value,
                      Bib.LimpaNumero(FNFeParam.ME3Chave.Text),'',QNfeEmissaoNUM_NOTA.Value, true))) = 2020 then
                    begin
                      try
                        if FPreVisualizacaoDFe = nil then
                          FPreVisualizacaoDFe := TFPreVisualizacaoDFe.Create(Application);
                        if FPreVisualizacaoDFe.ShowModal = MrCancel then
                        begin
                          FPreVisualizacaoDFe := nil;
                          Exit;
                        end;
                        FPreVisualizacaoDFe := nil;
                      except

                      end;
                    end;
                  end;
                  Acs := TAcoesLote.Create.Add(alEnvio).Add(alConsulta);
                  if CB3Danfe.Checked and
                    (((QNfeEmissaoCOD_SERIE_MODELO.Value = '55') and
                     (DMUsuario.ImpressoraPadraoNFe <> '') and
                     (CDSNfeLoteItemConsNUM_VIAS_DANFE.Value > 0)) or
                     ((QNfeEmissaoCOD_SERIE_MODELO.Value = '65') and
                     (DMUsuario.ImpressoraPadraoNFCe <> '') and
                     (CDSNfeLoteItemConsNUM_VIAS_DANFE_NFCE.Value > 0))) then
                    Acs.Add(alDanfe);
                  if (CB3Email.Checked) and (CB3EmailXML.Checked or
                      CB3EmailPDF.Checked) then
                    Acs.Add(alEmail);
                  Result := (AcaoEmLote(Acs) = 0); // 0 não ocorreu nenhum erro
                  if DMOracle.DBCemapa.InTransaction then
                    DMOracle.DBCemapa.Commit;

                  // Se houver algum erro força a execução a sair da função
                  // retornando false
                  if not result then
                    Exit;
                    
                end;
            Result := True;  
          end
          else
            B := False;
        end;
      end;
    end
    else
      Result := True;
  except on E: Exception do
    begin
      if E.Message <> 'Operation aborted' then
        MessageDlg( E.Message,mtError,[mbOk],0 );
      Result := False;
    end;
  end;
end;

procedure TDMNfe.QSomaNfeCalcFields(DataSet: TDataSet);
begin
  QSomaNfeval_total.Value := QSomaNfeSVAL_TOTAL.Value
      + QSomaNfeSVAL_IPI.Value
      + QSomaNfeSVAL_DESPESAS.Value
      - QSomaNfeSVAL_DESCONTO.Value
      + QSomaNfeSVAL_ICMS_SUBST.Value
      + QGeraNfeVAL_SUBST_TRIBUT.Value
      + QSomaNfeSVAL_FRETE.Value;
end;

function TDMNfe.ExecutaAcoes(Acoes: TList;
  MostraResultado: Boolean): Integer;
var
  Aguardo: TAguardoBloqueado;
  i: Integer;
  acao: String;
begin
  Result := 0;
  if Acoes.Count > 0 then
  begin
    if FAguardoNfe = nil then
      FAguardoNfe := TFAguardoNfe.Create(Application);
    Aguardo := TAguardoBloqueado.Create;
    Aguardo.Intervalo := 0;
    Aguardo.ExecucoesSimples.Clear;
    Aguardo.ExecucoesSimples.Assign(Acoes);
    Aguardo.TelaAguardo := FAguardoNfe;
    Aguardo.Rodar;
    if (MostraResultado) then
    begin
      if FNFeRetorno = nil then
        FNFeRetorno := TFNFeRetorno.Create(Application);
      FNFeRetorno.MECStat.Text := '';
      FNFeRetorno.treeViewResultado.Items.Clear;
      for i := 0 to Acoes.Count - 1 do
      begin
        //================== NF-e =========================\\
        if TObject(Acoes[i]) is  TExecucaoEnviaLote then
          acao:= ACAO_ENVIO_NFE;
        if TObject(Acoes[i]) is TExecucaoSalvaDanfePdf then
          acao:= ACAO_SALVA_DANFE_PDF;
        if TObject(Acoes[i]) is TExecucaoPreVisualizaDanfe then
          acao:= ACAO_PRE_VISUALIZA_DANFE;
        if TObject(Acoes[i]) is TExecucaoExportaNFes then
          acao:= ACAO_EXPORTA_NFES;
        if TObject(Acoes[i]) is TExecucaoImprimeDanfe then
          acao:= ACAO_IMP_DANFE;
        if TObject(Acoes[i]) is TExecucaoEnviaEmail then
          acao:= ACAO_ENVIA_EMAIL;
        if TObject(Acoes[i]) is TExecucaoConsultaLote then
          acao:= ACAO_CONS_LOTE;
        if TObject(Acoes[i]) is TExecucaoInutilizaNum then
          acao:= ACAO_INUT_NUM;
        if TObject(Acoes[i]) is TExecucaoConsultaProtocolo then
          acao:= ACAO_CONS_PROT;
        if TObject(Acoes[i]) is TExecucaoConsultaCadastro then
          acao:= ACAO_CONS_CAD;
        if TObject(Acoes[i]) is TExecucaoCancela then
          acao:= ACAO_CANCELA;
        if TObject(Acoes[i]) is TExecucaoStatus then
          acao:= ACAO_STATUS;
        if TObject(Acoes[i]) is TExecucaoCartaCorrecao then
          acao:= ACAO_CARTA_CORRECAO;
        if TObject(Acoes[i]) is TExecucaoManifestacaoDest then
          acao:= ACAO_MANIFESTACAO_DESTINATARIO;
        if TObject(Acoes[i]) is TExecucaoEnviaEmailCCe then
          acao:= ACAO_ENVIA_EMAIL_CCE;
        if TObject(Acoes[i]) is TExecucaoSalvaCCePdf then
          acao:= ACAO_SALVA_CCE_PDF;
        if TObject(Acoes[i]) is TExecucaoImprimeCCe then
          acao:= ACAO_IMP_CCE;
        if TObject(Acoes[i]) is TExecucaoBaixaXMLNFe then
          acao:= ACAO_BAIXA_XML_NFE;
        if TObject(Acoes[i]) is TExecucaoConsultaNFes then
          acao:= ACAO_CONSULTA_NFES;

        //================== CT-e =========================\\
        if TObject(Acoes[i]) is  TExecucaoEnviaLoteCTe then
          acao:= ACAO_ENVIO_CTE;
        if TObject(Acoes[i]) is TExecucaoSalvaDactePdf then
          acao:= ACAO_SALVA_DACTE_PDF;
        if TObject(Acoes[i]) is TExecucaoPreVisualizaDacte then
          acao:= ACAO_PRE_VISUALIZA_DACTE;
        if TObject(Acoes[i]) is TExecucaoExportaCTes then
          acao:= ACAO_EXPORTA_CTES;
        if TObject(Acoes[i]) is TExecucaoImprimeDacte then
          acao:= ACAO_IMP_DACTE;
        if TObject(Acoes[i]) is TExecucaoEnviaEmailCTe then
          acao:= ACAO_ENVIA_EMAIL_CTE;
        if TObject(Acoes[i]) is TExecucaoConsultaLoteCTe then
          acao:= ACAO_CONS_LOTE_CTE;
        if TObject(Acoes[i]) is TExecucaoInutilizaNumCTe then
          acao:= ACAO_INUT_NUM_CTE;
        if TObject(Acoes[i]) is TExecucaoConsultaProtocoloCTe then
          acao:= ACAO_CONS_PROT_CTE;
        if TObject(Acoes[i]) is TExecucaoConsultaCadastroCTe then
          acao:= ACAO_CONS_CAD_CTE;
        if TObject(Acoes[i]) is TExecucaoEventoCTe then
          acao:= ACAO_REGISTRA_EVENTO_CTE;
        if TObject(Acoes[i]) is TExecucaoStatusCTe then
          acao:= ACAO_STATUS_CTE;
        if TObject(Acoes[i]) is TExecucaoEnviaEmailCCeCTe then
          acao:= ACAO_ENVIA_EMAIL_CCE_CTE;
        if TObject(Acoes[i]) is TExecucaoSalvaCCeCTePdf then
          acao:= ACAO_SALVA_CCE_CTE_PDF;
        if TObject(Acoes[i]) is TExecucaoImprimeCCeCTe then
          acao:= ACAO_IMP_CCE_CTE;

        //================== MDF-e =========================\\
        if TObject(Acoes[i]) is  TExecucaoEnviaLoteMDFe then
          acao:= ACAO_ENVIO_MDFE;
        if TObject(Acoes[i]) is TExecucaoSalvaDamdfePdf then
          acao:= ACAO_SALVA_DAMDFE_PDF;
        if TObject(Acoes[i]) is TExecucaoPreVisualizaDamdfe then
          acao:= ACAO_PRE_VISUALIZA_DAMDFE;
        if TObject(Acoes[i]) is TExecucaoExportaMDFes then
          acao:= ACAO_EXPORTA_MDFES;
        if TObject(Acoes[i]) is TExecucaoImprimeDamdfe then
          acao:= ACAO_IMP_DAMDFE;
        if TObject(Acoes[i]) is TExecucaoEnviaEmailMDFe then
          acao:= ACAO_ENVIA_EMAIL_MDFE;
        if TObject(Acoes[i]) is TExecucaoConsultaLoteMDFe then
          acao:= ACAO_CONS_LOTE_MDFE;
        if TObject(Acoes[i]) is TExecucaoConsultaProtocoloMDFe then
          acao:= ACAO_CONS_PROT_MDFE;
        if TObject(Acoes[i]) is TExecucaoEventoMDFe then
          acao:= ACAO_REGISTRA_EVENTO_MDFE;
        if TObject(Acoes[i]) is TExecucaoStatusMDFe then
          acao:= ACAO_STATUS_MDFE;

        //================== NFS-e =========================\\
        if TObject(Acoes[i]) is TExecucaoEnviaLoteRps then
          acao:= ACAO_ENVIO_RPS;
        if TObject(Acoes[i]) is TExecucaoConsultaSitLote then
          acao:= ACAO_CONS_SIT_LOTE;
        if TObject(Acoes[i]) is TExecucaoConsultaNFSeRps then
          acao:= ACAO_CONS_NFSE_RPS;
        if TObject(Acoes[i]) is TExecucaoConsultaLoteRps then
          acao:= ACAO_CONS_LOTE_RPS;
        if TObject(Acoes[i]) is TExecucaoConsultaNFSe then
          acao:= ACAO_CONS_NFSE;
        if TObject(Acoes[i]) is TExecucaoCancelaNFSe then
          acao:= ACAO_CANCELA_NFSE;
        if (acao <> ACAO_PRE_VISUALIZA_DANFE) and
           (acao <> ACAO_PRE_VISUALIZA_DACTE) and
           (acao <> ACAO_PRE_VISUALIZA_DAMDFE) then
          FNFeRetorno.Carrega(acao,TNfeExecucao(Acoes[i]).Retorno);
      end;
      if ((QGeraNfeDESC_MODELO.Value = '65') or
          (DMDevolucaoTroca.QNotaSaidaCons.Active and
           DMNotaEntrada.QNotaReferenciada.Active and
          (DMNotaEntrada.QNotaReferenciadaCOD_NOTA_CAB.Value =
           QGeraNfeCOD_NOTA_CAB.Value) and
          (DMNotaEntrada.QNotaReferenciadaCOD_NOTA_CAB_REF.Value=
           DMDevolucaoTroca.QNotaSaidaConsCOD_NOTA_CAB.Value))) and
         (TObject(Acoes[0]) is  TExecucaoEnviaLote) then
        if (TNfeExecucao(Acoes[0]).Retorno.Status in SIT_NFE_ACEITO) and ((Acoes.Count = 1) or (TNfeExecucao(Acoes[1]).Retorno.Status = 2020)) then
          exit;
      Result := 1;
      if (acao = ACAO_PRE_VISUALIZA_DANFE) then
        if TNfeExecucao(Acoes[0]).Retorno.Status = 2020 then
        begin
          Result := TNfeExecucao(Acoes[0]).Retorno.Status;
          exit;
        end;
      if (acao = ACAO_PRE_VISUALIZA_DACTE) then
        if TNfeExecucao(Acoes[0]).Retorno.Status = 2040 then
        begin
          Result := TNfeExecucao(Acoes[0]).Retorno.Status;
          exit;
        end;
      if (acao = ACAO_PRE_VISUALIZA_DAMDFE) then
        if TNfeExecucao(Acoes[0]).Retorno.Status = 2100 then
        begin
          Result := TNfeExecucao(Acoes[0]).Retorno.Status;
          exit;
        end;
      if (acao = ACAO_BAIXA_XML_NFE) or (acao = ACAO_CONSULTA_NFES) then
        if TNfeExecucao(Acoes[0]).Retorno.Status = 138 then
        begin
          Result := TNfeExecucao(Acoes[0]).Retorno.Status;
          exit;
        end;
      if acao = ACAO_CONS_CAD then
        if (TNfeExecucao(Acoes[0]).Retorno.Status = 111) or
           (TNfeExecucao(Acoes[0]).Retorno.Status = 112) then
        begin
          Result := TNfeExecucao(Acoes[0]).Retorno.Status;
          Exit;
        end;
       // Quando dá algum erro retorna 1 - Verificar se pode deixar assim
      if not NotaAutomaticaFlag.pNotaAutomatica then
        FNFeRetorno.ShowModal;
    end;
  end
  else
    MessageDlg('Nenhum documento selecionado e nenhum lote para ser enviado', mtInformation, [mbOK], 0);
end;

function TDMNfe.ExecutaAcoes(Acoes: TExecucoesList;
  MostraResultado: Boolean): Integer;
begin
  Result := 0;
  if Acoes <> nil then
    Result := ExecutaAcoes(Acoes.Execucoes, MostraResultado);
end;

procedure TDMNfe.SalvaXML(Chave, Nome, XmlNFe, XmlRetorno: String);
var
  Xml: TStrings;
  wNome: String;

begin                                 
  inherited;
  if (Chave <> '') then
  begin
    XML := TStringList.Create;
    if Pos('NF-e', Nome) > 0 then
    begin
      XmlRetorno := StringReplace(XmlRetorno, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);
      XmlRetorno := StringReplace(XmlRetorno, 'TProtNFe', 'protNFe', [rfReplaceAll]);
      if Pos('versao="4.00"', XmlNFe) > 0 then
        XmlNFe := StringReplace(XmlNFe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><nfeProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/nfe">' ,[rfReplaceAll])
      else if Pos('versao="3.10"', XmlNFe) > 0 then
        XmlNFe := StringReplace(XmlNFe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><nfeProc versao="3.10" xmlns="http://www.portalfiscal.inf.br/nfe">' ,[rfReplaceAll])
      else if Pos('versao="2.00"', XmlNFe) > 0 then
        XmlNFe := StringReplace(XmlNFe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><nfeProc versao="2.00" xmlns="http://www.portalfiscal.inf.br/nfe">' ,[rfReplaceAll])
      else
        XmlNFe := StringReplace(XmlNFe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><nfeProc versao="1.10" xmlns="http://www.portalfiscal.inf.br/nfe">' ,[rfReplaceAll]);
      Xml.Add(XmlNFe + XmlRetorno + '</nfeProc>');
    end
    else
    begin
      if XmlNFe = 'NFS-e' then
      begin
        Xml.Clear;
        XML.Text := UTF8Encode(DMOracle.FastSelect('DESC_XML_RPS', 'TB_NF_ELETRONICA',
          'DESC_CHAVE_ACESSO = ' + QuotedStr(Chave)));
      end
      else
      begin
        Xml.Clear;
        XML.Text := UTF8Encode(XmlNFe)
      end;
    end;
    XML.SaveToFile(Nome);
  end;
end;
procedure TDMNfe.SalvaXMLCTe(Nome, XmlCTe, XmlRetorno: String);
var
  Xml: TStrings;
  wNome: String;

begin
  inherited;
  with DMCteLote do
  begin
    if (CDSCteLoteItemConsDESC_CHAVE_ACESSO.Value <> '') then
    begin
      XML := TStringList.Create;
      if (CDSCteLoteItemConsind_autorizado.Value) then
      begin
        if (CDSCteLoteItemConsind_cancelado.Value) then
        begin
          XmlCTe := '<?xml version="1.0" encoding="utf-8"?><procEventoCte versao=\"4.00\">';
          XmlRetorno := StringReplace(CDSCteLoteItemConsDESC_XML_RETORNO_CANCELAMENTO.Value, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);
          XML.Add(XmlCTe + XmlRetorno + '</procEventoCte>');
        end
        else
        begin
          XmlRetorno := StringReplace(XmlRetorno, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);
          XmlRetorno := StringReplace(XmlRetorno, 'TProtCTe', 'protCTe', [rfReplaceAll]);

          if Pos('versao="4.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else if Pos('versao="3.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="3.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else if Pos('versao="2.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="2.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="1.04" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll]);

          Xml.Add(XmlCTe + XmlRetorno + '</cteProc>');
        end;
        XML.SaveToFile(Nome);
      end
      else
        begin
          if Pos('versao="4.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else if Pos('versao="3.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="3.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else if Pos('versao="2.00"', XmlCTe) > 0 then
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="2.00" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll])
          else
            XmlCTe := StringReplace(XmlCTe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><cteProc versao="1.04" xmlns="http://www.portalfiscal.inf.br/cte">' ,[rfReplaceAll]);
          Xml.Add(XmlCTe);
        end;
        XML.SaveToFile(Nome);
    end;
  end;
end;

procedure TDMNfe.SalvaXMLMDFe(Chave, Nome, XmlMDFe, XmlRetorno: String);
var
  Xml: TStrings;
  wXmlEncerramento, wXmlRetornoEncerramento: String;
begin
  inherited;
  if (Chave <> '') then
  begin
    with DMMdfeLote do
    begin
      if CDSMdfeLoteItemConsind_encerrado.Value then
      begin
        XML := TStringList.Create;
        wXmlEncerramento := StringReplace(CDSMdfeLoteItemConsXML_EVENTO_ENCERRAMENTO.Value,
          '<?xml version="1.0" encoding="utf-8"?>',
          '<?xml version="1.0" encoding="utf-8"?><procEventoMDFe versao=\"3.00\">', [rfReplaceAll]);

        wXmlRetornoEncerramento := StringReplace(CDSMdfeLoteItemConsXML_RETORNO_ENCERRAMENTO.Value, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);
        XML.Add(wXmlEncerramento + wXmlRetornoEncerramento + '</procEventoMDFe>');
        XML.SaveToFile('Encerramento_' + Nome);
      end;
    end;
    XML := TStringList.Create;
    XmlRetorno := StringReplace(XmlRetorno, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);
    XmlRetorno := StringReplace(XmlRetorno, 'TProtMDFe', 'protMDFe', [rfReplaceAll]);

    XmlMDFe := StringReplace(XmlMDFe, '<?xml version="1.0" encoding="utf-8"?>','<?xml version="1.0" encoding="utf-8"?><mdfeProc versao="'+
      Bib.ift(Pos('versao="3.00"', XmlMDFe) > 0,'3.00','1.00') + '" xmlns="http://www.portalfiscal.inf.br/mdfe">' ,[rfReplaceAll]);

    Xml.Add(XmlMDFe + XmlRetorno + '</mdfeProc>');
    XML.SaveToFile(Nome);
  end;
end;

procedure TDMNfe.EmiteManifestacaoDestinatario;
var
  wServidor: String;
  wExec: TExecucoesList;
begin
  wServidor := DMNotaEntrada.QNotaEntradadesc_servidor_nfe.Value;

  QManifestDest.Edit;
  QManifestDestDESC_XML.Value := LimpaStrXML(TNfeUtils.GeraXmlMD);
  QManifestDest.Post;

  wExec := TExecucoesList.Create;
  wExec.Add(TExecucaoManifestacaoDest.Create( wServidor, Trunc(QManifestDestID_LOTE.Value),
        DMNotaEntrada.QNotaEntradacod_uf_ibge_filial.Value, DMNotaEntrada.QNotaEntradaIND_AMBIENTE_NFE.Value,
        DMNotaEntrada.QNotaEntradaNUM_NOTA.Value));
  ExecutaAcoes(wExec);
end;
procedure TDMNfe.RegistraEventoMDFe(CodManifesto, TpEvento: Integer; JustCancMDFe: String = '');
  function valida(Value, Lbl: String): Boolean;
  begin
    Result := (Value <> '');
    if not Result then
      MessageDlg(Lbl + ': Campo obrigatório!', mtError, [mbOK], 0);
  end;
var
  wServidor: String;
  wExec: TExecucoesList;
  nSeqEvento: Integer;
  wCidade, wEstado, wCondutor: String;
begin
  QGeraMdfe.Close;
  QGeraMdfe.ClearVariables;
  QGeraMdfe.SetVariable('COD_MANIFESTO', CodManifesto);
  QGeraMdfe.Open;
  
  QMdfeEmissao.Close;
  QMdfeEmissao.ClearVariables;
  QMdfeEmissao.SetVariable('COD_MANIFESTO', CodManifesto);
  QMdfeEmissao.Open;

  DMNfe.SetaMdfe(QGeraMdfeDESC_CHAVE_ACESSO.Value,True);

  QGeraMdfeEvento.Close;
  QGeraMdfeEvento.ClearVariables;
  QGeraMdfeEvento.SetVariable('DESC_CHAVE_ACESSO', RightStr(QGeraMdfeDESC_CHAVE_ACESSO.Value,44));
  QGeraMdfeEvento.SetVariable('TP_EVENTO',TpEvento);
  QGeraMdfeEvento.Open;
  nSeqEvento := 1;
  if QGeraMdfeEvento.RecordCount > 0 then
  begin
    QGeraMdfeEvento.Last;
    case StrToInt('0' + QGeraMdfeEventoDESC_RETORNO_PROCESSAMENTO.Value) of
      135:
      begin
        nSeqEvento := QGeraMdfeEvento.RecordCount + 1;
        QGeraMdfeEvento.Insert;
        QGeraMdfeEventoID_EVENTO.Value := 'ID' + IntToStr(TpEvento) +
                                    RightStr(QGeraMdfeDESC_CHAVE_ACESSO.Value,44) +
                                    IfThen(nSeqEvento > 9, IntToStr(nSeqEvento),
                                     '0'+IntToStr(nSeqEvento));
      end;
      101:
      begin
        MessageDlg('MDF-e já está cancelado na SEFAZ.', mtError, [mbOK], 0);
        Exit;
      end;
      132:
      begin
        MessageDlg('MDF-e já está encerrado na SEFAZ.', mtError, [mbOK], 0);
        Exit;
      end;
      else
        QGeraMdfeEvento.Edit;
    end;
  end
  else
  begin
    QGeraMdfeEvento.Insert;
    QGeraMdfeEventoID_EVENTO.Value := 'ID' + IntToStr(TpEvento) +
                                    RightStr(QGeraMdfeDESC_CHAVE_ACESSO.Value,44) +
                                    IfThen(nSeqEvento > 9, IntToStr(nSeqEvento),
                                     '0'+IntToStr(nSeqEvento));
  end;
  wServidor := QMdfeEmissaoDESC_REPOSITORIO_NFE.Value;

  QGeraMdfeEventoDESC_CHAVE_ACESSO.Value := RightStr(QGeraMdfeDESC_CHAVE_ACESSO.Value,44);
  QGeraMdfeEventoNSEQ_EVENTO.Value := nSeqEvento;
  QGeraMdfeEventoDT_EVENTO.Value :=  Now;
  QGeraMdfeEventoTP_EVENTO.Value := TpEvento;
  wCidade := '';
  wEstado := '';
  wCondutor := '';
  case TpEvento of
    TP_EVENTO_DFE_CANCELAMENTO:
    begin
      QGeraMdfeEventoDESC_JUSTIFICATIVA.Value := JustCancMDFe;
      QGeraMdfeEventoDESC_PROTOCOLO.Value := QMdfeDESC_PROT_AUTORIZACAO.Value;
    end;
    TP_EVENTO_DFE_ENCERRAMENTO:
    begin
      if FNFeParam = nil then
        FNFeParam := TFNFeParam.Create(Application);
      FNFeParam.MeDataEncMDFe.Text := DateToStr(Date);

      FNFeParam.AtivaPagina(10);
      if FNFeParam.ShowModal <> mrOk then
        Exit;
      wEstado := Trim(FNFeParam.fm10Estado.MeEstado.Text);
      wCidade := Trim(FNFeParam.fm10Cidade.MeCidade.Text);
      if (not valida(wCidade, 'Cidade')) or
      (not valida(wEstado, 'Estado')) then
        Exit;

      try
        QGeraMdfeEventoDT_ENCERRAMENTO.Value := StrToDate( FNFeParam.MeDataEncMDFe.Text);
      except
        raise;
      end;
      QGeraMdfeEventoDESC_PROTOCOLO.Value := QMdfeDESC_PROT_AUTORIZACAO.Value;
      QGeraMdfeEventoCOD_ESTADO_ENC.Value := wEstado;
      QGeraMdfeEventoCOD_CIDADE_ENC.Value := StrToInt(Trim(wCidade));
    end;
    TP_EVENTO_DFE_INC_CONDUTOR:
    begin
      if FNFeParam = nil then
        FNFeParam := TFNFeParam.Create(Application);
      FNFeParam.MeDataEncMDFe.Text := DateToStr(Date);

      FNFeParam.AtivaPagina(11);
      if FNFeParam.ShowModal <> mrOk then
        Exit;
      wCondutor := FNFeParam.Fm11Cadastro.MeCadastro.Text;
      if (not valida(wCondutor, 'Condutor')) then
        Exit;

      QGeraMdfeEventoCOD_CADASTRO_CONDUTOR.Value := StrToInt(Trim(wCondutor));
    end;
  end;
  QGeraMdfeEventoDESC_XML_EVENTO.Value := TMdfeUtils.GeraXMLMDFeEvento(TpEvento);
  QGeraMdfeEvento.Post;

  wExec := TExecucoesList.Create;
  wExec.Add(TExecucaoEventoMDFe.Create( wServidor, QGeraMdfeCOD_UF_IBGE_FILIAL.Value,
                                        QGeraMdfeIND_AMBIENTE_MDFE_FILIAL.Value,
                                        QGeraMdfeNUM_MANIFESTO.Value,
                                        QGeraMdfeEventoID_EVENTO.Value));
  ExecutaAcoes(wExec);
end;

procedure TDMNfe.RegistraEventoCTe(CodConhecimento, TpEvento: Integer; JustCancCTe: String = '');
  function valida(Value, Lbl: String): Boolean;
  begin
    Result := (Value <> '');
    if not Result then
      MessageDlg(Lbl + ': Campo obrigatório!', mtError, [mbOK], 0);
  end;
var
  wServidor, DescEmail: String;
  wExec: TExecucoesList;
  nSeqEvento: Integer;
  ExecEmailCCe: TExecucaoEnviaEmailCCeCTe;
begin
  QGeraCte.Close;
  QGeraCte.ClearVariables;
  QGeraCte.SetVariable('COD_CONHECIMENTO', CodConhecimento);
  QGeraCte.Open;
  
  QCteEmissao.Close;
  QCteEmissao.ClearVariables;
  QCteEmissao.SetVariable('COD_CONHECIMENTO', CodConhecimento);
  QCteEmissao.Open;
  
  wServidor := QCteEmissaoDESC_REPOSITORIO_NFE.Value;
  DMNfe.SetaCte(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,True);

  QGeraCteEvento.Close;
  QGeraCteEvento.ClearVariables;
  QGeraCteEvento.SetVariable('DESC_CHAVE_ACESSO', RightStr(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,44));
  QGeraCteEvento.SetVariable('TP_EVENTO',TpEvento);
  QGeraCteEvento.Open;
  
  QCorrecaoCTe.Close;
  QCorrecaoCTe.Open;
  
  nSeqEvento := 1;
  if QGeraCteEvento.RecordCount > 0 then
  begin
    QGeraCteEvento.Last;
    if QGeraCteEventoDESC_RETORNO_PROCESSAMENTO.Value = '135' then
    begin
      nSeqEvento := QGeraCteEvento.RecordCount + 1;
      QGeraCteEvento.Insert;
      QGeraCteEventoID_EVENTO.Value := 'ID' + IntToStr(TpEvento) +
                                    RightStr(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,44) +
                                    IfThen(nSeqEvento > 9, IntToStr(nSeqEvento),
                                     Bib.ift(QGeraCteDESC_VERSAO_CTE.Value = '4.00', '00', '0')+IntToStr(nSeqEvento));
      QGeraCteEventoDESC_CHAVE_ACESSO.Value := RightStr(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,44);
      QGeraCteEventoNSEQ_EVENTO.Value := nSeqEvento;
      QGeraCteEventoTP_EVENTO.Value := TpEvento;
    end
    else
      QGeraCteEvento.Edit;
  end
  else
  begin
    QGeraCteEvento.Insert;
    QGeraCteEventoID_EVENTO.Value := 'ID' + IntToStr(TpEvento) +
                                  RightStr(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,44) +
                                  IfThen(nSeqEvento > 9, IntToStr(nSeqEvento),
                                   Bib.ift(QGeraCteDESC_VERSAO_CTE.Value = '4.00', '00', '0')+IntToStr(nSeqEvento));
    QGeraCteEventoDESC_CHAVE_ACESSO.Value := RightStr(QGeraCteDESC_CHAVE_ACESSO_CTE.Value,44);
    QGeraCteEventoNSEQ_EVENTO.Value := nSeqEvento;
    QGeraCteEventoTP_EVENTO.Value := TpEvento;
  end;
  QGeraCteEventoDT_EVENTO.Value :=  Now;
  if TpEvento = TP_EVENTO_DFE_CANCELAMENTO then
  begin
    QGeraCteEventoDESC_JUSTIFICATIVA.Value := JustCancCTe;
    QGeraCteEventoDESC_PROTOCOLO.Value := QCteDESC_PROT_AUTORIZACAO.Value;
  end;

  QGeraCteEventoDESC_XML_EVENTO.Value := TCteUtils.GeraXMLCTeEvento(TpEvento);
  QGeraCteEvento.Post;

  wExec := TExecucoesList.Create;
  wExec.Add(TExecucaoEventoCTe.Create( wServidor, QGeraCteCOD_UF_IBGE_FILIAL.Value,
                                        QGeraCteIND_AMBIENTE_CTE.Value,
                                        QGeraCteNUM_CONHECIMENTO.Value,
                                        QGeraCteEventoID_EVENTO.Value));
  if TpEvento = TP_EVENTO_DFE_CARTA_CORRECAO then
  begin
    if FNFeParam = nil then
      FNFeParam := TFNFeParam.Create(Application);
    FNFeParam.AtivaPagina(6);
    FNFeParam.ME6Chave.Text := Bib.LimpaNumero(QGeraCteEventoDESC_CHAVE_ACESSO.Value);
    FNFeParam.ME6Chave.Enabled := false;
    FNFeParam.RG6Ambiente.ItemIndex := QGeraCteIND_AMBIENTE_CTE.Value - 1;
    if FNFeParam.ShowModal = mrOk then
    begin
      with DMNfe, FNFeParam do
      begin
        if CB6Impressao.Checked then
          wExec.Add(TExecucaoImprimeCCeCTe.Create(wServidor, QGeraCteEventoID_EVENTO.Value,
            QCteEmissaoDESC_IMPRESSORA_DACTE.Value));

        if CB6Email.Checked then
        begin
          ExecEmailCCe := TExecucaoEnviaEmailCCeCte(PreparaEmailCCeCTe(CodConhecimento,CB6EmailXml.Checked,CB6EmailPdf.Checked));
          DescEmail := ExecEmailCCe.Email;
          if (DescEmail <> '') or (InputQuery('E-mail não cadastrado','Informe o e-mail para ' + QGeraCteNOME_TOM.Value +
            ' ou cancele para não enviar para este cliente:', DescEmail)) then
            ExecEmailCCe.Email := DescEmail;
          wExec.Add(ExecEmailCCe);
        end;
      end;
    end;
  end;
  ExecutaAcoes(wExec);
end;

function TDMNfe.EmissaoCte(CodConhecimento: Integer; IdLote: Int64;
  EnviarCTe: Boolean): Boolean;
function AdicionaEmLote(var IdLote: Int64; CTe: TObject; ChaveAntiga: String): Boolean;
  var chaveAcesso, xmlCTe: String;
  begin
    Result := True;
    with DMCteLote do
    begin
      QCteLote.Close;
      QCteLote.SetVariable('PK', IdLote);
      QCteLote.Open;
      if IdLote = 0 then //Novo Lote de CT-e
        QCteLote.Append
      else
        QCteLote.Edit;
      QCteLoteCOD_FILIAL.Value := QCteEmissaoCOD_FILIAL.Value;
      QCteLote.Post;
      //if (CTe.InfCfe.Id <> ChaveAntiga) then
//        DMOracle.ExecutaSql(MontaDelete('TB_NF_ELETRONICA_CONS',
//            'DESC_CHAVE_ACESSO = ' + QuotedStr(Bib.LimpaNumero(ChaveAntiga))), False);
      QCteLoteItem.Close;
      QCteLoteItem.ClearVariables;
      QCteLoteItem.SetVariable('COD_CONHECIMENTO', CodConhecimento);
      QCteLoteItem.Open;
      if QCteEmissaoCOD_SERIE_MODELO.Value = '57' then
      begin
        chaveAcesso := Bib.LimpaNumero(TCTe(CTe).InfCte.Id);
        xmlCTe := LimpaStrXML( TCteUtils.GeraXMLCTe(TCTe(CTe)));
      end
      else
      begin
        chaveAcesso := Bib.LimpaNumero(TCTeOS(CTe).InfCte.Id);
        xmlCTe := LimpaStrXML(TCteUtils.GeraXMLCTeOS(TCTeOS(CTe)));
      end;
      if QCteLoteItem.Eof then
        QCteLoteItem.Append
      else
      begin

        if QCteLoteItemDESC_CHAVE_ACESSO.Value = chaveAcesso then
          QCteLoteItem.Edit
        else
        begin
          QCteLoteItem.Delete;
          QCteLoteItem.Append;
        end;
      end;
      QCteLoteItemDESC_CHAVE_ACESSO.Value := chaveAcesso;
      QCteLoteItemCOD_FILIAL.Value := QCteEmissaoCOD_FILIAL.Value;
      QCteLoteItemDESC_SERIE.Value := QCteEmissaoCOD_SERIE.Value;
      QCteLoteItemNUM_CTE.Value := QCteEmissaoNUM_CONHECIMENTO.Value;
      QCteLoteItemDESC_XML_CTE.Value := xmlCTe;

      QCteLoteItemIND_AMBIENTE_CTE.Value := QCteEmissaoIND_AMBIENTE_CTE.Value;
      QCteLoteItemCOD_CONHECIMENTO.Value := CodConhecimento;
      QCteLoteItemID_LOTE.Value := QCteLoteID_LOTE.Value;
      QCteLoteItem.Post;

      IdLote := QCteLoteID_LOTE.AsInteger;
    end;
  end;
var
  CTe: TObject;
  Chave, ChaveAntiga: String;
  B: Boolean;
  Cli: TNFeCliente;
  Acs: TAcoesLoteCTe;
  wVias: String;
  mr : TModalResult;
begin
  Result := False;
  //Gerando nfe para ser enviada
  try
    QCteEmissao.Close;
    QCteEmissao.ClearVariables;
    QCteEmissao.SetVariable('COD_CONHECIMENTO', CodConhecimento);
    QCteEmissao.Open;

    if (not QCteEmissao.Eof) and ((QCteEmissaoDESC_MODELO.Value = '57') or
        (QCteEmissaoDESC_MODELO.Value = '67')) and
        (QCteEmissaoIND_EMITE.Value = 'F') then
    begin
      if QCteEmissaoIND_SITUACAO.Value <> '2' then
      begin
        MessageDlg('CT não confirmado.', mtInformation, [mbOK], 0);
        Exit;
      end;

      //-------------------------- Emissão de CT-e -------------------------//
      if ValidaCte(CodConhecimento) then
      begin
        Chave := QCteEmissaoDESC_CHAVE_ACESSO_CTE.Value;
        if Chave = '' then
        begin
          Chave := 'CTe' + TCteUtils.GeraChaveAcesso(
              QCteEmissaoCOD_UF_IBGE_FILIAL.Value,
              QCteEmissaoDT_EMISSAO.Value,
              QCteEmissaoIND_CONTINGENCIA_CTE.Value,
              QCteEmissaoNUM_CGC.Value,
              StrToInt('0' + QCteEmissaoDESC_MODELO.Value),
              StrToInt('0' + QCteEmissaoCOD_SERIE.Value),
              QCteEmissaoNUM_CONHECIMENTO.Value);
        end;
        ChaveAntiga := Chave;

        if FNFeParam = nil then
          FNFeParam := TFNFeParam.Create(Application);
        FNFeParam.ME7Chave.Text := Chave;

        if QCteEmissaoCOD_SERIE_MODELO.Value = '57' then
        begin
          CTe := TCteUtils.GeraCTe(CodConhecimento);
          FNFeParam.CTe := TCTe(CTe);
          FNFeParam.CTe.InfCte.InfRespTec.HashCSRT := CalcularHashCSRT(DMParamSistema.QParamSistemaDESC_CSRT.Value, Bib.LimpaNumero(Chave));
        end
        else
        begin
          CTe := TCteUtils.GeraCTeOS(CodConhecimento);
          FNFeParam.CTeOS := TCTeOS(CTe);
          FNFeParam.CTeOS.InfCte.InfRespTec.HashCSRT := CalcularHashCSRT(DMParamSistema.QParamSistemaDESC_CSRT.Value, Bib.LimpaNumero(Chave));
        end;
        B := True;
        while B do
        begin
          FNFeParam.AtivaPagina(7);
          SetaNfe(Bib.LimpaNumero(Chave), True);
          FNFeParam.ME7Chave.Enabled := not (QNfeind_aprovado.Value or
              QNfeind_cancelado.Value or QNfeind_denegado.Value);
          FNFeParam.CB7Dacte.Checked := QCteEmissaoIND_IMPRIME_DACTE.Value = 'SIM';
          FNFeParam.RG7Ambiente.ItemIndex := QCteEmissaoIND_AMBIENTE_CTE.Value - 1;
          case StrToInt('0'+QCteEmissaoIND_CONTINGENCIA_CTE.Value) of
            1: FNFeParam.RG7Contingencia.ItemIndex :=0;
            5: FNFeParam.RG7Contingencia.ItemIndex :=1;
            7: FNFeParam.RG7Contingencia.ItemIndex :=2;
            8: FNFeParam.RG7Contingencia.ItemIndex :=3;
          end;

          if FNFeParam.ShowModal = MrOk then
          begin
            Chave := 'CTe' + Bib.LimpaNumero(FNFeParam.ME7Chave.Text);
            if Length(Chave) <> 47 then
            begin
              MessageDlg('Chave incorreta', mtError, [mbOK], 0);
              Continue;
            end;
            if (QCteEmissaoDESC_CHAVE_ACESSO_CTE.Value <> Chave) then
              DMOracle.ExecutaSql(MontaUpdate('DESC_CHAVE_ACESSO_CTE',
                QuotedStr(Chave), 'TB_CONHECIMENTO', 'COD_CONHECIMENTO = ' + IntToStr(CodConhecimento)), False);
            if QCteEmissaoCOD_SERIE_MODELO.Value = '57' then
              TCTe(CTe).InfCte.Id := Chave
            else
              TCTeOS(CTe).InfCte.Id := Chave;

          //  if FNFeParam.PC3EmissaoNFe.ActivePageIndex = 1 then //Enviar em Lote
          //    Lote := StrToInt('0' + Trim(FNFeParam.Fm3NfeLote.MeCodigo.Text));
            if AdicionaEmLote(IdLote, CTe, ChaveAntiga) then
              DMOracle.DBCemapa.Commit
            else
              Continue;
            B := False;
            Cli := TNFeCliente.GetNFeCliente(QCteEmissaoDESC_REPOSITORIO_NFE.Value);
            if Cli = nil then
            begin
              MessageDlg('Essa filial não possui configuração de servidor de DF-e.', mtError, [mbOK], 0);
              Exit;
            end;
            with FNFeParam do
              if (PC7EmissaoCTe.ActivePageIndex = 0) or
                  (RG7EmissaoCTe.ItemIndex = 0) then
                with DMCteLote do
                begin
                  CarregaLoteCons(IdLote, True);
                  CDSCteLoteItemCons.First;
                  while not CDSCteLoteItemCons.Eof do
                  begin
                    SetSelecaoItem;
                    CDSCteLoteItemCons.Edit;
                    CDSCteLoteItemConsEMAIL_XML.Value := IfThen(CB7EmailXML.Checked, 'S');
                    CDSCteLoteItemConsEMAIL_PDF.Value := IfThen(CB7EmailPDF.Checked, 'S');
                    if (CB7Dacte.Checked and (QCteEmissaoIND_VIAS_DACTE.Value='S')) then
                    begin
                      wVias := IntToStr(QCteEmissaoNUM_VIAS_DACTE.Value);
                      InputQuery('Impressão de DACTE', 'Número de cópias', wVias);
                      CDSCteLoteItemConsNUM_VIAS_DACTE.Value := StrToInt(wVias);
                    end;
                    CDSCteLoteItemCons.Post;

                    CDSCteLoteItemCons.Next;
                  end;
                  if CB7PrevisualizacaoDacte.Checked then
                  begin
                    if ExecutaAcoes(TExecucoesList.Create.Add(
                      TExecucaoPreVisualizaDacte.Create(QCteEmissaoDESC_REPOSITORIO_NFE.Value,
                      Bib.LimpaNumero(FNFeParam.ME7Chave.Text),'',QCteEmissaoNUM_CONHECIMENTO.Value))) = 2040 then
                    begin
                      try
                        if FPreVisualizacaoDFe = nil then
                          FPreVisualizacaoDFe := TFPreVisualizacaoDFe.Create(Application);
                        if FPreVisualizacaoDFe.ShowModal = MrCancel then
                        begin
                          FPreVisualizacaoDFe := nil;
                          Exit;
                        end;
                        FPreVisualizacaoDFe := nil;
                      except

                      end;
                    end;
                  end;
                  Acs := TAcoesLoteCTe.Create.Add(alEnvioCTe).Add(alConsultaCTe);
                  if CB7Dacte.Checked then
                    Acs.Add(alDacte);
                  if (CB7Email.Checked) and (CB7EmailXML.Checked or
                      CB7EmailPDF.Checked) then
                    Acs.Add(alEmailCTe);
                  AcaoEmLote(Acs);
                  if DMOracle.DBCemapa.InTransaction then
                    DMOracle.DBCemapa.Commit;
                end;
            Result := True;
          end
          else
            B := False;
        end;
      end;
    end
    else
      Result := True;
  except on E: Exception do
    begin
      MessageDlg( E.Message,mtError,[mbOk],0 );
      Result := False;
    end;
  end;

end;

function TDMNfe.EmissaoMdfe(CodManifesto: Integer; IdLote: Int64 = 0; EnviarMDFe: Boolean = False): Boolean;
  function AdicionaEmLote(var IdLote: Int64; MDFe: TMDFe; ChaveAntiga: String): Boolean;
  begin
    Result := True;
    with DMMdfeLote do
    begin
      QMdfeLote.Close;
      QMdfeLote.SetVariable('PK', IdLote);
      QMdfeLote.Open;
      if IdLote = 0 then //Novo Lote de MDF-e
        QMdfeLote.Append
      else
        QMdfeLote.Edit;

      QMdfeLoteCOD_FILIAL.Value := QMdfeEmissaoCOD_FILIAL.Value;
      QMdfeLote.Post;
      QMdfeLoteItem.Close;
      QMdfeLoteItem.ClearVariables;
      QMdfeLoteItem.SetVariable('COD_MANIFESTO', CodManifesto);
      QMdfeLoteItem.Open;
      if QMdfeLoteItem.Eof then
        QMdfeLoteItem.Append
      else
      begin
        if QMdfeLoteItemDESC_CHAVE_ACESSO.Value = Bib.LimpaNumero(MDFe.InfMdfe.Id) then
          QMdfeLoteItem.Edit
        else
        begin
          QMdfeLoteItem.Delete;
          QMdfeLoteItem.Append;
        end;
      end;
      QMdfeLoteItemDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(MDFe.InfMdfe.Id);
      QMdfeLoteItemCOD_FILIAL.Value := QMdfeEmissaoCOD_FILIAL.Value;
      QMdfeLoteItemDESC_SERIE.Value := QMdfeEmissaoCOD_SERIE.Value;
      QMdfeLoteItemNUM_MDFE.Value := QMdfeEmissaoNUM_MANIFESTO.Value;
      QMdfeLoteItemDESC_XML_MDFE.Value := LimpaStrXML(TMdfeUtils.GeraXMLMDFe(MDFe));
      QMdfeLoteItemIND_AMBIENTE_MDFE.Value := QMdfeEmissaoIND_AMBIENTE_MDFE.Value;
      QMdfeLoteItemCOD_MANIFESTO.Value := CodManifesto;
      QMdfeLoteItemID_LOTE.Value := QMdfeLoteID_LOTE.Value;
      QMdfeLoteItem.Post;

      IdLote := QMdfeLoteID_LOTE.AsInteger;
    end;
  end;
var
  MDFe: TMDFe;
  Chave, ChaveAntiga: String;
  B: Boolean;
  Cli: TNFeCliente;
  Acs: TAcoesLoteMDFe;
  wVias: String;
  mr : TModalResult;
begin
  Result := False;
  //Gerando nfe para ser enviada
  try
    QMdfeEmissao.Close;
    QMdfeEmissao.ClearVariables;
    QMdfeEmissao.SetVariable('COD_MANIFESTO', CodManifesto);
    QMdfeEmissao.Open;

    if (not QMdfeEmissao.Eof) and (QMdfeEmissaoDESC_MODELO.Value = '58') then
    begin
      if QMdfeEmissaoIND_SITUACAO.Value <> '2' then
      begin
        MessageDlg('Manifesto não confirmado.', mtInformation, [mbOK], 0);
        Exit;
      end;

      //-------------------------- Emissão de MDF-e -------------------------//
      if ValidaMdfe(CodManifesto) then
      begin
        Chave := QMdfeEmissaoDESC_CHAVE_ACESSO.Value;
        if Chave = '' then
        begin
          Chave := 'MDFe' + TMdfeUtils.GeraChaveAcesso(
              QMdfeEmissaoCOD_UF_IBGE_FILIAL.Value,
              QMdfeEmissaoDT_EMISSAO.Value,
              '1',
              QMdfeEmissaoNUM_CGC.Value,
              StrToInt('0' + QMdfeEmissaoDESC_MODELO.Value),
              StrToInt('0' + QMdfeEmissaoCOD_SERIE.Value),
              QMdfeEmissaoNUM_MANIFESTO.Value);
        end;
        ChaveAntiga := Chave;
        if FNFeParam = nil then
          FNFeParam := TFNFeParam.Create(Application);
        FNFeParam.ME9Chave.Text := Chave;

        MDFe := TMdfeUtils.GeraMDFe(CodManifesto);
        MDFe.InfMDFe.InfRespTec.HashCSRT := CalcularHashCSRT(DMParamSistema.QParamSistemaDESC_CSRT.Value, Bib.LimpaNumero(Chave));
        FNFeParam.MDFe := MDFe;
        B := True;
        while B do
        begin
          FNFeParam.AtivaPagina(9);
          SetaMdfe(Bib.LimpaNumero(Chave), True);
          FNFeParam.CB9Damdfe.Checked := QMdfeEmissaoIND_IMPRIME_DAMDFE.Value = 'SIM';
          FNFeParam.ME9Chave.Enabled := not (QMdfeind_aprovado.Value or
              QMdfeind_cancelado.Value or QMdfeind_denegado.Value or
              QMdfeind_encerrado.Value);
          FNFeParam.RG9Ambiente.ItemIndex := QMdfeEmissaoIND_AMBIENTE_MDFE.Value - 1;
          if FNFeParam.ShowModal = MrOk then
          begin
            Chave := 'MDFe' + Bib.LimpaNumero(FNFeParam.ME9Chave.Text);
            if Length(Chave) <> 48 then
            begin
              MessageDlg('Chave incorreta', mtError, [mbOK], 0);
              Continue;
            end;
            if (QMdfeEmissaoDESC_CHAVE_ACESSO.Value <> Chave) then
              DMOracle.ExecutaSql(MontaUpdate('DESC_CHAVE_ACESSO',
                QuotedStr(Chave), 'TB_MANIFESTO', 'COD_MANIFESTO = ' + IntToStr(CodManifesto)), False);
            MDFe.InfMdfe.Id := Chave;

          //  if FNFeParam.PC3EmissaoNFe.ActivePageIndex = 1 then //Enviar em Lote
          //    Lote := StrToInt('0' + Trim(FNFeParam.Fm3NfeLote.MeCodigo.Text));
            if AdicionaEmLote(IdLote, MDFe, ChaveAntiga) then
              DMOracle.DBCemapa.Commit
            else
              Continue;
            B := False;
            Cli := TNFeCliente.GetNFeCliente(QMdfeEmissaoDESC_REPOSITORIO_NFE.Value);
            if Cli = nil then
            begin
              MessageDlg('Essa filial não possui configuração de servidor de DF-e.', mtError, [mbOK], 0);
              Exit;
            end;
            with FNFeParam do
              if (PC9EmissaoMDFe.ActivePageIndex = 0) or
                  (RG9EmissaoMDFe.ItemIndex = 0) then
                with DMMdfeLote do
                begin
                  CarregaLoteCons(IdLote, True);
                  CDSMdfeLoteItemCons.First;
                  while not CDSMdfeLoteItemCons.Eof do
                  begin
                    SetSelecaoItem;
                    CDSMdfeLoteItemCons.Edit;
                    CDSMdfeLoteItemConsEMAIL_XML.Value := IfThen(CB9EmailXML.Checked, 'S');
                    CDSMdfeLoteItemConsEMAIL_PDF.Value := IfThen(CB9EmailPDF.Checked, 'S');
                    if (CB9Damdfe.Checked and (QMdfeEmissaoIND_VIAS_DAMDFE.Value='S')) then
                    begin
                      wVias := IntToStr(QMdfeEmissaoNUM_VIAS_DAMDFE.Value);
                      InputQuery('Impressão de DAMDFE', 'Número de cópias', wVias);
                      CDSMdfeLoteItemConsNUM_VIAS_DAMDFE.Value := StrToInt(wVias);
                    end;
                    CDSMdfeLoteItemCons.Post;

                    CDSMdfeLoteItemCons.Next;
                  end;
                  if CB9PrevisualizacaoDamdfe.Checked then
                  begin
                    if ExecutaAcoes(TExecucoesList.Create.Add(
                      TExecucaoPreVisualizaDamdfe.Create(QMdfeEmissaoDESC_REPOSITORIO_NFE.Value,
                      Bib.LimpaNumero(FNFeParam.ME9Chave.Text),'',QMdfeEmissaoNUM_MANIFESTO.Value))) = 2100 then
                    begin
                      try
                        if FPreVisualizacaoDFe = nil then
                          FPreVisualizacaoDFe := TFPreVisualizacaoDFe.Create(Application);
                        if FPreVisualizacaoDFe.ShowModal = MrCancel then
                        begin
                          FPreVisualizacaoDFe := nil;
                          Exit;
                        end;
                        FPreVisualizacaoDFe := nil;
                      except

                      end;
                    end;
                  end;
                  Acs := TAcoesLoteMDFe.Create.Add(alEnvioMDFe).Add(alConsultaMDFe);
                  if CB9Damdfe.Checked then
                    Acs.Add(alDamdfe);
                  if (CB9Email.Checked) and (CB9EmailXML.Checked or
                      CB9EmailPDF.Checked) then
                    Acs.Add(alEmailMDFe);
                  AcaoEmLote(Acs);
                  if DMOracle.DBCemapa.InTransaction then
                    DMOracle.DBCemapa.Commit;
                end;
            Result := True;
          end
          else
            B := False;
        end;
      end;
    end
    else
      Result := True;
  except on E: Exception do
    begin
      MessageDlg( E.Message,mtError,[mbOk],0 );
      Result := False;
    end;
  end;
end;

function TDMNfe.BaixaXMLNFe(Filial: Integer; Chave: String): String;
var
  wRepNfe, wAmb: String;
  wExecucaoBaixaXMLNFe: TExecucaoBaixaXMLNFe;
begin
  Result := '';
  Buscador.Limpa;
  Buscador.Adiciona('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));
  if Copy(Chave,21,2) = '55' then
    Buscador.Adiciona('IND_AMBIENTE_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial))
  else
    Buscador.Adiciona('IND_AMBIENTE_NFCE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));
  Buscador.Buscar;

  wRepNfe := Buscador.Proximo;
  wAmb := Buscador.Proximo;
  Buscador.Fecha;
  wExecucaoBaixaXMLNFe := TExecucaoBaixaXMLNFe.Create( wRepNfe, Filial,
        StrToInt('0' + wAmb), chave);
  if ExecutaAcoes(TExecucoesList.Create.Add(wExecucaoBaixaXMLNFe)) = 138 then
    Result := wExecucaoBaixaXMLNFe.FRetorno.Descricao;

end;

function TDMNfe.TiraCaracteresEspeciais(pTexto: string): string;
begin
  result := bib.RemoveAcentos(pTexto);
  result := StringReplace(result, '*', '', [rfReplaceAll]);
  result := StringReplace(result, '@', '', [rfReplaceAll]);
  result := StringReplace(result, '%', '', [rfReplaceAll]);
  result := StringReplace(result, '$', 'E', [rfReplaceAll]);
end;

{ TExecucaoEnviaLote }

constructor TExecucaoEnviaLote.Create;
begin
  Create('', 0, 0, False);
end;

constructor TExecucaoEnviaLote.Create(Servidor: String; IdLote, CodUFIBGE: Integer;
  Consultar: Boolean);
begin
  inherited Create;
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
  FConsultar := Consultar;
end;

procedure TExecucaoEnviaLote.Executar(DadosExecucao: TDadosExecucao);
begin
  DadosExecucao.Tela.Notifica('Enviando lote ' + IntToStr(FIdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaLote(FIdLote,
      FCodUFIBGE, FConsultar);
  if FRetorno.Status <> NFE_ERRO then
    DMNfEletronicaLote.ConfirmaEnvioLoteNfe(FIdLote);
end;

{ TExecucaoImprimeDanfe }

constructor TExecucaoImprimeDanfe.Create;
begin
  Create('', '', '', 0, 0, True);
end;

constructor TExecucaoImprimeDanfe.Create(Servidor, Chave,
  Impressora: String; Copias, Nota: Integer; NFe: Boolean);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FImpressora := Impressora;
  FCopias := Copias;
  FNota := Nota;
  FNFe := NFe;
end;

procedure TExecucaoImprimeDanfe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Solicitando DANFE da nota ' + IfThen(
      FNota > 0, IntToStr(FNota), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ImprimeDanfe(FChave,
      FImpressora, FCopias, FNFe);
end;

{ TExecucaoSalvaDanfePdf }

constructor TExecucaoSalvaDanfePdf.Create;
begin
  Create('', '', '', 0, True);
end;

constructor TExecucaoSalvaDanfePdf.Create(Servidor, Chave,
  Caminho: String; Nota: Integer; NFe: Boolean);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FNota := Nota;
  FNFe := NFe;
end;

procedure TExecucaoSalvaDanfePdf.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
  i, posicaoFim: integer;
  arquivo: String;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Salvando DANFE em arquivo PDF ' + IfThen(
      FNota > 0, IntToStr(FNota), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).SalvaDanfePdf(FChave,FNFe);
  if FRetorno.Status = IMP_DANFE_SUCESSO then
  begin
    i := 1;
    while FRetorno.Complemento <> '' do
    begin
      posicaoFim := pos('FIM_ARQUIVO_NFE', FRetorno.Complemento);
      arquivo := Bib.ift(posicaoFim > 0, copy(FRetorno.Complemento,1, posicaoFim -1),FRetorno.Complemento);
      mStream := TMemoryStream.Create;
      sStream := TStringStream.Create(arquivo);
      mStream.CopyFrom(sStream,Length(arquivo));
      if i = 1 then
        mStream.SaveToFile(FCaminho)
      else
        mStream.SaveToFile(LeftStr(FCaminho, Length(FCaminho) - pos('\',
          ReverseString(FCaminho)))+ '\CC-e_'+ IntToStr(i)+ '_NF-e_'+ IntToStr(FNota) + '.pdf');
      i := i + 1;
      FRetorno.Complemento := StringReplace(FRetorno.Complemento,arquivo+
        Bib.ift(posicaoFim > 0, 'FIM_ARQUIVO_NFE',''),'',[rfReplaceAll]);
    end;
  end;
end;

{ TExecucaoExportaNFes }

constructor TExecucaoExportaNFes.Create;
begin
  Create('',0,0,0,0,false, true,true,false, false,'');
end;

constructor TExecucaoExportaNFes.Create(Servidor: String; Filial,
  Cadastro: Integer; DataInicial, DataFinal: TDateTime; Saida, Entrada, Xml, Pdf, NFe: Boolean;
  Caminho: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCadastro := Cadastro;
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FSaida := Saida;
  FEntrada := Entrada;
  FXml := Xml;
  FPdf := Pdf;
  FNFe := NFe;
  FCaminho := Caminho;
end;

procedure TExecucaoExportaNFes.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Exportando Notas por período');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      ExportaNFes(FFilial,FCadastro,FDataInicial,FDataFinal,FSaida, FEntrada,FXml,FPdf, FNFe);
  if FRetorno.Status = IMP_DANFE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoEnviaEmail }

constructor TExecucaoEnviaEmail.Create;
begin
  Create('', '', '', '', '', False, False, 0, True);
end;

constructor TExecucaoEnviaEmail.Create(Servidor, Chave, Email, Assunto,
  Corpo: String; XML, PDF: Boolean; Nota: Integer; NFe: Boolean);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FEmail := Email;
  FAssunto := Assunto;
  FCorpo := Corpo;
  FXML := XML;
  FPDF := PDF;
  FNota := Nota;
  FNFe := NFe;
end;

procedure TExecucaoEnviaEmail.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando e-mail da nota ' + IfThen(
      FNota > 0, IntToStr(FNota), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaEmail(FChave, FEmail,
      FAssunto, FCorpo, FXML, FPDF, FNFe);
end;

{ TNfeExecucao }

constructor TNfeExecucao.Create;
begin
  FRetorno := nil;
end;

destructor TNfeExecucao.Destroy;
begin
  if Assigned(FRetorno) then
    FRetorno.Free;
  inherited;
end;

{ TExecucaoConsultaLote }

constructor TExecucaoConsultaLote.Create;
begin
  Create('', 0, 0);
end;

constructor TExecucaoConsultaLote.Create(Servidor: String; IdLote,
  CodUFIBGE: Integer);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
end;

procedure TExecucaoConsultaLote.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando lote ' + IntToStr(IdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaLote(IdLote,
      CodUFIBGE);
end;

{ TExecucaoInutilizaNum }

constructor TExecucaoInutilizaNum.Create;
begin
  Create('', 0, 0, 0, 0, 0, 0, '', 0,0,0);
end;

constructor TExecucaoInutilizaNum.Create(Servidor: String; Filial,
  CodUFIBGE, Serie, Ambiente, NumIni, NumFim: Integer;
  Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FSerie := Serie;
  FAmbiente := Ambiente;
  FNumIni := NumIni;
  FNumFim := NumFim;
  FJustificativa := Justificativa;
  FTpEmissao := TpEmissao;
  FModelo := Modelo;
  FCodUsuario := CodUsuario;
end;

procedure TExecucaoInutilizaNum.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Inutilizando número ' + IntToStr(NumIni) +
      ' até ' + IntToStr(NumFim) + ', série ' + IntToStr(Serie));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).InutilizaNumeracao(Filial,
      CodUFIBGE, Serie, Ambiente, NumIni, NumFim, Justificativa, TpEmissao,Modelo, CodUsuario);
end;

{ TExecucaoConsultaProtocolo }

constructor TExecucaoConsultaProtocolo.Create;
begin
  Create('', 0, 0, 0, 0, '');
end;

constructor TExecucaoConsultaProtocolo.Create(Servidor: String; Filial,
  CodUFIBGE, Ambiente, NumNota: Integer; Chave: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FNumNota := NumNota;
  FChave := Chave;
end;

procedure TExecucaoConsultaProtocolo.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando nota ' + IntToStr(NumNota) +
      ' (' + Chave + ')');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaChave(Filial,
      CodUFIBGE, Ambiente, Chave);
end;

{ TExecucaoConsultaCadastro }

constructor TExecucaoConsultaCadastro.Create;
begin
  Create('',0,'','');
end;

constructor TExecucaoConsultaCadastro.Create(Servidor: String; Filial: Integer; UFCadastro: String;
  ParamConsulta: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FUFCadastro := UFCadastro;
  FParamConsulta := ParamConsulta;
end;

procedure TExecucaoConsultaCadastro.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando cadastro de contribuinte.');
  FRetorno := TNFeCliente.GetNFeCliente(Servidor).ConsultaCadastro(Filial,
              UFCadastro, ParamConsulta);
end;

{ TExecucaoCancela }

constructor TExecucaoCancela.Create;
begin
  Create('', 0, 0, 0, 0, '');
end;

constructor TExecucaoCancela.Create(Servidor: String; IdLote, CodUFIBGE, Ambiente,
        NumNota: Integer; Chave: String);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FNumNota := NumNota;
  FChave := Chave;
end;

procedure TExecucaoCancela.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Cancelando nota ' + IntToStr(NumNota) +
      ' (' + Chave + ')');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).CancelaNota(IdLote,
      CodUFIBGE, Ambiente, NumNota, Chave);
end;
{ TExecucaoStatus }

constructor TExecucaoStatus.Create;
begin
  Create('', 0, 0, -1, 0,0);
end;

constructor TExecucaoStatus.Create(Servidor: String; Filial, CodUFIBGE,
  Ambiente: Integer; TpEmissao: Integer; Modelo: Integer);
begin
  inherited Create;
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FTpEmissao := TpEmissao;
  FModelo := Modelo;
end;

procedure TExecucaoStatus.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando status (UF=' + IntToStr(FCodUFIBGE) +
      ', Ambiente=' + IntToStr(FAmbiente) + ')');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaStatus(FFilial,
        FCodUFIBGE, FAmbiente, TpEmissao, Modelo);
end;

{ TExecucaoCartaCorrecao }

constructor TExecucaoCartaCorrecao.Create;
begin
  Create('','',0,0,'');
end;

constructor TExecucaoCartaCorrecao.Create(Servidor: String; IdEvento: String; COrgao,
  Ambiente: Integer; ChaveAcesso:String);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FCOrgao := COrgao;
  FAmbiente := Ambiente;
  FChaveAcesso := ChaveAcesso;
end;

procedure TExecucaoCartaCorrecao.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Emitindo Carta de Correção Eletrônica para a nota ' + ChaveAcesso);
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).CartaCorrecao(FIdEvento,COrgao,
      Ambiente,ChaveAcesso);
end;

{ TExecucaoEnviaEmailCCe }

constructor TExecucaoEnviaEmailCCe.Create;
begin
  Create('','','','','',false,false);
end;

constructor TExecucaoEnviaEmailCCe.Create(Servidor: String;
  IdEvento: String; Email, Assunto, Corpo: String; XML, PDF: Boolean);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FEmail := Email;
  FAssunto := Assunto;
  FCorpo := Corpo;
  FXML := XML;
  FPDF := PDF;
end;

procedure TExecucaoEnviaEmailCCe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando e-mail da CC-e ' );
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaEmailCCe(FIdEvento , FEmail,
      FAssunto, FCorpo, FXML, FPDF);
end;

{ TExecucaoImprimeCCe }

constructor TExecucaoImprimeCCe.Create;
begin
  Create('','','');
end;

constructor TExecucaoImprimeCCe.Create(Servidor: String; IdEvento: String;
  Impressora: String);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FImpressora := Impressora;
end;

procedure TExecucaoImprimeCCe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Imprimindo a CC-e ');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ImprimeCCe(IdEvento, FImpressora);
end;

{ TExecucaoSalvaCCePdf }

constructor TExecucaoSalvaCCePdf.Create;
begin
  Create('','','');
end;

constructor TExecucaoSalvaCCePdf.Create(Servidor: String; IdEvento: String;
  Caminho: String);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FCaminho := Caminho;
end;

procedure TExecucaoSalvaCCePdf.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Salvando CC-e em arquivo PDF ');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).SalvaCCePdf(IdEvento);
  if FRetorno.Status = IMP_CCE_SUCCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;
{ TExecucaoManifestacaoDest }

constructor TExecucaoManifestacaoDest.Create;
begin
  Create('',0,0,0,0);
end;

constructor TExecucaoManifestacaoDest.Create(Servidor: String; IdLote,
  COrgao, Ambiente: Integer; NumNota: Integer);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCOrgao := COrgao;
  FAmbiente := Ambiente;
  FNumNota := NumNota;
end;

procedure TExecucaoManifestacaoDest.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Emitindo Manifestação do Destinatário para a nota '+IntToStr(FNumNota));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ManifestacaoDestinatario(FIdLote,FCOrgao,FAmbiente,FNumNota);
end;


//============================================================================================\\
//               Conhecimento de Transporte Eletrônico - CT-e
//============================================================================================\\

{ TExecucaoEnviaLote }

constructor TExecucaoEnviaLoteCTe.Create;
begin
  Create('', 0, 0, False);
end;

constructor TExecucaoEnviaLoteCTe.Create(Servidor: String; IdLote, CodUFIBGE: Integer;
  Consultar: Boolean);
begin
  inherited Create;
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
  FConsultar := Consultar;
end;

procedure TExecucaoEnviaLoteCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  DadosExecucao.Tela.Notifica('Enviando lote ' + IntToStr(FIdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaLoteCTe(FIdLote,
      FCodUFIBGE, FConsultar);
  if FRetorno.Status <> NFE_ERRO then
    DMCteLote.ConfirmaEnvioLoteCte(FIdLote);
end;

{ TExecucaoImprimeDacte }

constructor TExecucaoImprimeDacte.Create;
begin
  Create('', '', '', 0, 0);
end;

constructor TExecucaoImprimeDacte.Create(Servidor, Chave,
  Impressora: String; Copias, CTe: Integer);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FImpressora := Impressora;
  FCopias := Copias;
  FCTe := CTe;
end;

procedure TExecucaoImprimeDacte.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Solicitando Dacte do CT-e ' + IfThen(
      FCTe > 0, IntToStr(FCTe), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ImprimeDacte(FChave,
      FImpressora, FCopias);
end;

{ TExecucaoSalvaDactePdf }

constructor TExecucaoSalvaDactePdf.Create;
begin
  Create('', '', '', 0);
end;

constructor TExecucaoSalvaDactePdf.Create(Servidor, Chave,
  Caminho: String; CTe: Integer);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FCTe := CTe;
end;

procedure TExecucaoSalvaDactePdf.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Salvando Dacte em arquivo PDF ' + IfThen(
      FCTe > 0, IntToStr(FCTe), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).SalvaDactePdf(FChave);
  if FRetorno.Status = IMP_DACTE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoExportaNFes }

constructor TExecucaoExportaCTes.Create;
begin
  Create('',0,0,0,0,0,true,false,'',true);
end;

constructor TExecucaoExportaCTes.Create(Servidor: String; Filial,
  Remetente, Destinatario: Integer; DataInicial, DataFinal: TDateTime; Xml, Pdf: Boolean;
  Caminho: String; Cancelado: Boolean);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FRemetente := Remetente;
  FDestinatario := Destinatario;
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FXml := Xml;
  FPdf := Pdf;
  FCaminho := Caminho;
  FCancelado := Cancelado;
end;

procedure TExecucaoExportaCTes.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Exportando CT-es por período');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      ExportaCTes(FFilial,FRemetente, FDestinatario,FDataInicial,FDataFinal,FXml,FPdf,FCancelado);
  if FRetorno.Status = IMP_DACTE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoEnviaEmailCTe }

constructor TExecucaoEnviaEmailCTe.Create;
begin
  Create('', '', '', '', '', False, False, 0);
end;

constructor TExecucaoEnviaEmailCTe.Create(Servidor, Chave, Email, Assunto,
  Corpo: String; XML, PDF: Boolean; CTe: Integer);
begin
  inherited Create;
  FServidor := Servidor;
  FChave := Chave;
  FEmail := Email;
  FAssunto := Assunto;
  FCorpo := Corpo;
  FXML := XML;
  FPDF := PDF;
  FCTe:= CTe;
end;

procedure TExecucaoEnviaEmailCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando e-mail do Conhecimento ' + IfThen(
      FCTe > 0, IntToStr(FCTe), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaEmailCTe(FChave, FEmail,
      FAssunto, FCorpo, FXML, FPDF);
end;

{ TExecucaoConsultaLote }

constructor TExecucaoConsultaLoteCTe.Create;
begin
  Create('', 0, 0);
end;

constructor TExecucaoConsultaLoteCTe.Create(Servidor: String; IdLote,
  CodUFIBGE: Integer);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
end;

procedure TExecucaoConsultaLoteCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando lote ' + IntToStr(IdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaLoteCTe(IdLote,
      CodUFIBGE);
end;

{ TExecucaoInutilizaNumCTe }

constructor TExecucaoInutilizaNumCTe.Create;
begin
  Create('', 0, 0, 0, 0, 0, 0, '', 0, 0, 0);
end;

constructor TExecucaoInutilizaNumCTe.Create(Servidor: String; Filial,
  CodUFIBGE, Serie, Ambiente, NumIni, NumFim: Integer;
  Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FSerie := Serie;
  FAmbiente := Ambiente;
  FNumIni := NumIni;
  FNumFim := NumFim;
  FJustificativa := Justificativa;
  FTpEmissao := TpEmissao;
  FModelo := Modelo;
  FCodUsuario := CodUsuario;
end;

procedure TExecucaoInutilizaNumCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Inutilizando número ' + IntToStr(NumIni) +
      ' até ' + IntToStr(NumFim) + ', série ' + IntToStr(Serie));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).InutilizaNumeracaoCTe(Filial,
      CodUFIBGE, Serie, Ambiente, NumIni, NumFim, Justificativa, TpEmissao, Modelo, CodUsuario);
end;

{ TExecucaoConsultaProtocoloCTe }

constructor TExecucaoConsultaProtocoloCTe.Create;
begin
  Create('', 0, 0, 0, 0, '');
end;

constructor TExecucaoConsultaProtocoloCTe.Create(Servidor: String; Filial,
  CodUFIBGE, Ambiente, NumCTe: Integer; Chave: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FNumCTe := NumCTe;
  FChave := Chave;
end;

procedure TExecucaoConsultaProtocoloCTe.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando CT-e ' + IntToStr(NumCTe) +
      ' (' + Chave + ')');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaChaveCTe(Filial,
      CodUFIBGE, Ambiente, Chave);
end;

{ TExecucaoConsultaCadastroCTe }

constructor TExecucaoConsultaCadastroCTe.Create;
begin
  Create('',0,0,'',0,'',0); 
end;

constructor TExecucaoConsultaCadastroCTe.Create(Servidor: String; Filial,
  CodUFIBGE: Integer; UFCadastro: String; TipoParamConsulta: Integer;
  ParamConsulta: String; Ambiente: Integer);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FUFCadastro := UFCadastro;
  FTipoParamConsulta := TipoParamConsulta;
  FParamConsulta := ParamConsulta;
  FAmbiente := Ambiente;
end;

procedure TExecucaoConsultaCadastroCTe.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando cadastro de contribuinte.');
  FRetorno := TNFeCliente.GetNFeCliente(Servidor).ConsultaCadastroCTe(Filial, CodUFIBGE,
              UFCadastro, TipoParamConsulta, ParamConsulta, Ambiente);
end;

{ TExecucaoStatusCTe }

constructor TExecucaoStatusCTe.Create;
begin
  Create('', 0, 0, -1, 0);
end;

constructor TExecucaoStatusCTe.Create(Servidor: String; Filial, CodUFIBGE,
  Ambiente: Integer; TpEmissao: Integer);
begin
  inherited Create;
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FTpEmissao := TpEmissao;
end;

procedure TExecucaoStatusCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando status (UF=' + IntToStr(FCodUFIBGE) +
      ', Ambiente=' + IntToStr(FAmbiente) + ')');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaStatusCTe(FFilial,
        FCodUFIBGE, FAmbiente, TpEmissao);
end;

{ TExecucaoEnviaEmailCCeCTe }

constructor TExecucaoEnviaEmailCCeCTe.Create;
begin
  Create('','','','','',false,false);
end;

constructor TExecucaoEnviaEmailCCeCTe.Create(Servidor: String;
  IdEvento: String; Email, Assunto, Corpo: String; XML, PDF: Boolean);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FEmail := Email;
  FAssunto := Assunto;
  FCorpo := Corpo;
  FXML := XML;
  FPDF := PDF;
end;

procedure TExecucaoEnviaEmailCCeCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando e-mail da CC-e ' );
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaEmailCCeCTe(FIdEvento , FEmail,
      FAssunto, FCorpo, FXML, FPDF);
end;

{ TExecucaoImprimeCCeCTe }

constructor TExecucaoImprimeCCeCTe.Create;
begin
  Create('','','');
end;

constructor TExecucaoImprimeCCeCTe.Create(Servidor: String; IdEvento: String;
  Impressora: String);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FImpressora := Impressora;
end;

procedure TExecucaoImprimeCCeCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Imprimindo a CC-e ');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ImprimeCCeCTe(FIdEvento, FImpressora);
end;

{ TExecucaoSalvaCCeCTePdf }

constructor TExecucaoSalvaCCeCTePdf.Create;
begin
  Create('','','');
end;

constructor TExecucaoSalvaCCeCTePdf.Create(Servidor: String; IdEvento: String;
  Caminho: String);
begin
  FServidor := Servidor;
  FIdEvento := IdEvento;
  FCaminho := Caminho;
end;

procedure TExecucaoSalvaCCeCTePdf.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Salvando CC-e em arquivo PDF ');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).SalvaCCeCTePdf(FIdEvento);
  
  if FRetorno.Status = IMP_CCE_SUCCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoEventoCTe }

constructor TExecucaoEventoCTe.Create;
begin
  Create('',0,0,0,'');
end;

constructor TExecucaoEventoCTe.Create(Servidor: String; CodUFIBGE,
  Ambiente, CTe: Integer; IdEvento: String);
begin
  FServidor := Servidor;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FCTe := CTe;
  FIdEvento := IdEvento;
end;

procedure TExecucaoEventoCTe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Registrando evento ao CT-e nº ' + IntToStr(FCTe));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      RegistraEventoCTe(FCodUFIBGE, FAmbiente, FCTe, FIdEvento);
end;


{ TExecucaoEnviaLoteMDFe }

constructor TExecucaoEnviaLoteMDFe.Create;
begin
  Create('',0,0,False);
end;

constructor TExecucaoEnviaLoteMDFe.Create(Servidor: String; IdLote,
  CodUFIBGE: Integer; Consultar: Boolean);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
  FConsultar := Consultar;
end;

procedure TExecucaoEnviaLoteMDFe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando Lote MDF-e nº '+ IntToStr(IdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      EnviaLoteMDFe(FIdLote, FCodUFIBGE, FConsultar);
end;

{ TExecucaoSalvaDamdfePdf }

constructor TExecucaoSalvaDamdfePdf.Create;
begin
  Create('','','',0);
end;

constructor TExecucaoSalvaDamdfePdf.Create(Servidor, Chave,
  Caminho: String; MDFe: Integer);
begin
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FMDFe := MDFe;
end;

procedure TExecucaoSalvaDamdfePdf.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Exportando Damdfe nº '+ IntToStr(MDFe) +
    ' para o formato PDF');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).SalvaDamdfePdf(FChave);
  if FRetorno.Status = IMP_DAMDFE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoExportaMDFes }

constructor TExecucaoExportaMDFes.Create;
begin
  Create('',0,0,0,True,False,'');
end;

constructor TExecucaoExportaMDFes.Create(Servidor: String;
  Filial: Integer; DataInicial, DataFinal: TDateTime; Xml,
  Pdf: Boolean; Caminho: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FXml := Xml;
  FPdf := Pdf;
  FCaminho := Caminho; 
end;

procedure TExecucaoExportaMDFes.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Exportando MDF-es por período');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      ExportaMDFes(FFilial, FDataInicial,FDataFinal,FXml,FPdf);
  if FRetorno.Status = IMP_DAMDFE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(FCaminho);
  end;
end;

{ TExecucaoImprimeDamdfe }

constructor TExecucaoImprimeDamdfe.Create;
begin
  Create('','','',0,0);
end;

constructor TExecucaoImprimeDamdfe.Create(Servidor, Chave,
  Impressora: String; Copias, MDFe: Integer);
begin
  FServidor := Servidor;
  FChave := Chave;
  FImpressora := Impressora;
  FCopias := Copias;
  FMDFe := MDFe;
end;

procedure TExecucaoImprimeDamdfe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Imprimindo Damdfe nº '+ IntToStr(MDFe));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
    ImprimeDamdfe(FChave, FImpressora, FCopias, FMDFe);
end;


{ TExecucaoEnviaEmailMDFe }

constructor TExecucaoEnviaEmailMDFe.Create;
begin
  create('','','','','',True, False,0);
end;

constructor TExecucaoEnviaEmailMDFe.Create(Servidor, Chave, Email, Assunto,
  Corpo: String; XML, PDF: Boolean; MDFe: Integer);
begin
  FServidor := Servidor;
  FChave := Chave;
  FEmail := Email;
  FAssunto := Assunto;
  FCorpo := Corpo;
  FXML := XML;
  FPDF := PDF;
  FMDFe := MDFe;
end;

procedure TExecucaoEnviaEmailMDFe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando email do MDF-e nº ' + IntToStr(MDFe));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
    EnviaEmailMDFe(FChave, FEmail, FAssunto, FCorpo, FXML, FPDF, FMDFe);
end;

{ TExecucaoConsultaLoteMDFe }

constructor TExecucaoConsultaLoteMDFe.Create;
begin
  create('',0,0);
end;

constructor TExecucaoConsultaLoteMDFe.Create(Servidor: String; IdLote,
  CodUFIBGE: Integer);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodUFIBGE := CodUFIBGE;
end;

procedure TExecucaoConsultaLoteMDFe.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando o lote nº '+ IntToStr(IdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaLoteMDFe(FIdLote, FCodUFIBGE);
end;


{ TExecucaoConsultaProtocoloMDFe }

constructor TExecucaoConsultaProtocoloMDFe.Create;
begin
  create('',0,0,0,0,'');
end;

constructor TExecucaoConsultaProtocoloMDFe.Create(Servidor: String; Filial,
  CodUFIBGE, Ambiente, NumMDFe: Integer; Chave: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FNumMDFe := NumMDFe;
  FChave := Chave;
end;

procedure TExecucaoConsultaProtocoloMDFe.Executar(
  DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando MDF-e nº '+ IntToStr(FNumMDFe));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
        ConsultaChaveMDFe(FFilial,FCodUFIBGE, FAmbiente, FNumMDFe, FChave);
end;
{ TExecucaoConsultaMDFesNaoEncerrados }
constructor TExecucaoConsultaMDFesNaoEncerrados.Create;
begin
  create('',0,0,0,'');
end;

constructor TExecucaoConsultaMDFesNaoEncerrados.Create(Servidor: String; Filial, CodUFIBGE,
  Ambiente: Integer; Versao: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FVersao := Versao;
end;

procedure TExecucaoConsultaMDFesNaoEncerrados.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando MDF-es não encerrados');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
        ConsultaMDFesNaoEncerrados(FFilial, FCodUFIBGE, FAmbiente, FVersao);
end;
{ TExecucaoStatusMDFe }

constructor TExecucaoStatusMDFe.Create;
begin
  create('',0,0,0,0);
end;

constructor TExecucaoStatusMDFe.Create(Servidor: String; Filial, CodUFIBGE,
  Ambiente, TpEmissao: Integer);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FTpEmissao := TpEmissao;
end;

procedure TExecucaoStatusMDFe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando o status do serviço');
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
        ConsultaStatusMDFe(FFilial, FCodUFIBGE, FAmbiente, FTpEmissao);
end;

{ TExecucaoEventoMDFe }

constructor TExecucaoEventoMDFe.Create;
begin
  Create('',0,0,0,'');
end;

constructor TExecucaoEventoMDFe.Create(Servidor: String; CodUFIBGE,
  Ambiente, MDFe: Integer; IdEvento: String);
begin
  FServidor := Servidor;
  FCodUFIBGE := CodUFIBGE;
  FAmbiente := Ambiente;
  FMDFe := MDFe;
  FIdEvento := IdEvento;
end;

procedure TExecucaoEventoMDFe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Registrando evento ao MDF-e nº ' + IntToStr(FMDFe));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).
      RegistraEventoMDFe(FCodUFIBGE, FAmbiente, FMDFe, FIdEvento);
end;

{ TExecucoesList }

function TExecucoesList.Add(Execucao: TNfeExecucao): TExecucoesList;
begin
  FExecucoes.Add(Execucao);
  Result := Self;
end;

constructor TExecucoesList.Create;
begin
  FExecucoes := TList.Create;
end;

procedure TDMNfe.QSomaNfeAfterOpen(DataSet: TDataSet);
begin
  Calc_Peso_Nota;
end;

procedure TDMNfe.cdsProdutoXMLAfterScroll(DataSet: TDataSet);
var
  qtreg : integer;
  wCodProdutoVinculado: String;
  wRecNo: integer;
begin
  qtreg := 0;

  // No modo fabricante, respeita a prioridade:
  // 1. TB_PRODUTO.NUM_FABRICANTE
  // 2. TB_PRODUTOXML_PRODUTOBD.CPROD
  // 3. produtos ativos da TB_PRODUTO com o mesmo NCM para vinculo manual
  if pVinculaProdutosPorCodigo and (Trim(cdsProdutoXMLcprod.Text) <> '') then
  begin
    wCodProdutoVinculado := Trim(DMOracle.FastSelect('MAX(COD_PRODUTO)',
      'TB_PRODUTO',
      'NUM_FABRICANTE = ' + QuotedStr(Trim(cdsProdutoXMLcprod.Text)) +
      ' AND IND_SITUACAO = ' + QuotedStr('ATIVO')));

    if wCodProdutoVinculado = '' then
      wCodProdutoVinculado := Trim(DMOracle.FastSelect('MAX(P.COD_PRODUTO)',
        'TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD' +
        ' ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
        'PXMLBD.CPROD = ' + QuotedStr(Trim(cdsProdutoXMLcprod.Text)) +
        ' AND PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(pCodForImportacaoXML) +
        ' AND P.IND_SITUACAO = ' + QuotedStr('ATIVO')));

    cdsProdutoBD.Close;
    cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
    cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := Null;
    cdsProdutoBD.Params.ParamByName('PRODUTO').Value := Null;
    if wCodProdutoVinculado <> '' then
    begin
      cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Text := wCodProdutoVinculado;
    end
    else
    begin
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      if Trim(cdsProdutoXMLncm.Text) <> '' then
        cdsProdutoBD.Params.ParamByName('NCM').AsString := Trim(cdsProdutoXMLncm.Text)
      else
        cdsProdutoBD.Params.ParamByName('NCM').AsString := '0';
    end;
    cdsProdutoBD.Open;
    Exit;
  end;

  // Verifica se existe produto vinculado
  // Se existir traz o produto
  if (pCodForImportacaoXML > 0) and (DMNfe.cdsProdutoXMLcprod.Value <> '')
    and not ((DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM')
      and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'NAO')
      and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'NAO')) then
  begin
    if (DMParamSistema.CodEmpresa <> 'KREUZ') and (DMParamSistema.CodEmpresa <> 'KAISER') and (DMParamSistema.CodEmpresa <> 'FRACTA') then
    begin
      if DMNfe.cdsProdutoXMLnum_item.Value > 0 then
        wCodProdutoVinculado :=
          DMOracle.FastSelect('MAX(P.COD_PRODUTO)',
                'TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
                'PXMLBD.CPROD = ' + QuotedStr(DMNfe.cdsProdutoXMLcprod.Value)
                + ' AND PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(pCodForImportacaoXML)
                + ' AND (PXMLBD.NUM_ITEM IS NULL OR PXMLBD.NUM_ITEM = ' + DMNfe.cdsProdutoXMLnum_item.Text + ')'
                )
      else
        wCodProdutoVinculado :=
        DMOracle.FastSelect('MAX(P.COD_PRODUTO)',
              'TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
              'PXMLBD.CPROD = ' + QuotedStr(DMNfe.cdsProdutoXMLcprod.Value)
              + ' AND PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(pCodForImportacaoXML)
              );
    end
    else
      if DMNfe.cdsProdutoXMLnum_item.Value > 0 then
        wCodProdutoVinculado := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTOXML_PRODUTOBD','CPROD = ' + chr(39) + DMNfe.cdsProdutoXMLcprod.Value + chr(39) )
      else
        wCodProdutoVinculado := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','NUM_FABRICANTE = ' + DMNfe.cdsProdutoXMLcprod.Value);
   

    wCodProdutoVinculado := Trim(wCodProdutoVinculado);
    if wCodProdutoVinculado <> '' then
    begin
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := Null;
      cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
      cdsProdutoBD.Params.ParamByName('PRODUTO').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Text := wCodProdutoVinculado;
      cdsProdutoBD.Open;
      exit;
    end;
  end;

  if pVinculaProdutosPorCodigoBarras then
  begin
    if (Trim(cdsProdutoXMLcean.Value) <> '') and (Trim(cdsProdutoXMLcean.Value) <> 'SEM GTIN') then
    begin
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('COD_BARRA').AsString :=
          Trim(cdsProdutoXMLcean.Value);
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := Null;
      cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
      cdsProdutoBD.Params.ParamByName('PRODUTO').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      cdsProdutoBD.Open;
    end
    else // Se a pesquisa for por código de barras e o xml não possuir código de barras
    begin // não traz nada
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('NCM').AsString := '0';
      cdsProdutoBD.Params.ParamByName('PRODUTO').AsString := '';
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').AsString := '';
      cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      cdsProdutoBD.Open;
    end;
  end
  else
  if pVinculaProdutosPorCodigo then
  begin
    if Trim(cdsProdutoXMLcprod.Value) <> '' then
    begin
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').AsString :=
          Trim(cdsProdutoXMLcprod.Value);
      cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
      cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
      cdsProdutoBD.Params.ParamByName('PRODUTO').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      cdsProdutoBD.Open;
    end;
  end
  else
  begin
    with DMOracle do
    begin
      qtreg := StrToInt(FastSelect('COUNT(*)', 'TB_PRODUTO', 'NUM_GENERO_NCM = ' +
                 quotedStr(Trim(cdsProdutoXMLncm.Value))));
      if (qtreg > 500) and (Pesquisar) and
        not ((DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM')
          and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'NAO')
          and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'NAO')) then
      begin
        cdsProdutoBD.EmptyDataSet;
        Abort;
      end;
    end;
    if cdsProdutoXMLncm.Value <> '' then
    begin
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('NCM').AsString :=
        Trim(cdsProdutoXMLncm.Value);
      cdsProdutoBD.Params.ParamByName('PRODUTO').Value := NULL;
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := NULL;
      cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      cdsProdutoBD.Open;
    end
    else
    begin
      cdsProdutoBD.Close;
      cdsProdutoBD.Params.ParamByName('NCM').AsString := '0';
      cdsProdutoBD.Params.ParamByName('PRODUTO').AsString := '';
      cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').AsString := '';
      cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
      cdsProdutoBD.Params.ParamByName('COD_PRODUTO').Value := Null;
      cdsProdutoBD.Open;
    end;
    //cdsProdutoBD.First;
  end;
end;

{ TExecucaoEnviaLoteRps }

constructor TExecucaoEnviaLoteRps.Create;
begin
  Create('',0,0,False);
end;

constructor TExecucaoEnviaLoteRps.Create(Servidor: String; IdLote,
  CodIbgeCidade: Integer; Consultar: Boolean);
begin
  FServidor:=Servidor;
  FIdLote:=IdLote;
  FCodIbgeCidade:=CodIbgeCidade;
  FConsultar:=Consultar;
end;

procedure TExecucaoEnviaLoteRps.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Enviando lote ' + IntToStr(FIdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).EnviaLoteRps(FIdLote,
      FCodIbgeCidade, FConsultar);
  if FRetorno.Status <> NFSE_ERRO then
    DMNfEletronicaLote.ConfirmaEnvioLoteNfe(FIdLote);
end;

{ TExecucaoConsultaSitLote }

constructor TExecucaoConsultaSitLote.Create;
begin
  Create('',0,0,'');
end;

constructor TExecucaoConsultaSitLote.Create(Servidor: String; Filial,
  CodIbgeCidade: Integer; Protocolo: String);
begin
  FServidor := Servidor;
  FCodIbgeCidade := CodIbgeCidade;
  FProtocolo := Protocolo;
end;

procedure TExecucaoConsultaSitLote.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando situação do lote protocolo nº ' + Protocolo);
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaSitLote(Filial,CodIbgeCidade, Protocolo);
end;

{ TExecucaoConsultaNFSeRps }

constructor TExecucaoConsultaNFSeRps.Create;
begin
  Create('',0,0,0,'','','');
end;

constructor TExecucaoConsultaNFSeRps.Create(Servidor: String; Filial,
  CodIbgeCidade, NumeroRps: Integer; ChaveAcesso,SerieRps, TipoRps: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodIbgeCidade := CodIbgeCidade;
  FNumeroRps := NumeroRps;
  FChaveAcesso := ChaveAcesso;
  FSerieRps := SerieRps;
  FTipoRps := TipoRps;
end;

procedure TExecucaoConsultaNFSeRps.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando a NFS-e através do RPS nº ' + IntToStr(NumeroRps));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaNFSeRps(Filial,CodIbgeCidade, NumeroRps,
      ChaveAcesso,SerieRps,TipoRps);
end;

{ TExecucaoConsultaLoteRps }

constructor TExecucaoConsultaLoteRps.Create;
begin
  Create('',0,0,'');
end;

constructor TExecucaoConsultaLoteRps.Create(Servidor: String; IdLote,
  CodIbgeCidade: Integer; Protocolo: String);
begin
  FServidor := Servidor;
  FIdLote := IdLote;
  FCodIbgeCidade := CodIbgeCidade;
  FProtocolo := Protocolo;
end;

procedure TExecucaoConsultaLoteRps.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando o Lote de Rps nº ' + IntToStr(IdLote));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaLoteRps(IdLote,CodIbgeCidade,Protocolo);
end;



{ TExecucaoCancelaNFSe }

constructor TExecucaoCancelaNFSe.Create;
begin
  Create('',0,0,'','','');
end;

constructor TExecucaoCancelaNFSe.Create(Servidor: String; Filial,
  CodIbgeCidade: Integer; NumeroNFSe, ChaveAcesso: String; CodCancelamento: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodIbgeCidade := CodIbgeCidade;
  FNumeroNFSe := NumeroNFSe;
  FChaveAcesso := ChaveAcesso;
  FCodCancelamento := CodCancelamento;
end;

procedure TExecucaoCancelaNFSe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Cancelando a NFS-e nº ' + NumeroNFSe);
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).CancelaNFSe(Filial,CodIbgeCidade,
      NumeroNFSe, ChaveAcesso,CodCancelamento);
end;

{ TExecucaoConsultaNFSe }

constructor TExecucaoConsultaNFSe.Create;
begin
Create('',0,0,'','', Date,Date,'','','','','');
end;

constructor TExecucaoConsultaNFSe.Create(Servidor: String; Filial,
  CodIbgeCidade: Integer; ChaveAcesso, NumeroNFSe: String; DataInicial, DataFinal: TDateTime; CnpjTomador,
  InscTomador, RazaoSocialIntServico, CnpjIntServico,
  InscIntServico: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FCodIbgeCidade := CodIbgeCidade;
  FNumeroNFSe := NumeroNFSe;
  FChaveAcesso := ChaveAcesso;
  FDataInicial := DataInicial;
  FDataFinal := DataFinal;
  FCnpjTomador := CnpjTomador;
  FInscTomador := InscTomador;
  FRazaoSocialIntServico := RazaoSocialIntServico;
  FCnpjIntServico := CnpjIntServico;
  FInscIntServico := InscIntServico;
end;

procedure TExecucaoConsultaNFSe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando a NFS-e nº ' + ChaveAcesso);
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaNFSe(Filial,CodIbgeCidade,
      ChaveAcesso, NumeroNFSe, DataInicial, DataFinal, CnpjTomador,
      InscTomador,RazaoSocialIntServico,CnpjIntServico,InscIntServico);
end;

procedure TDMNfe.QNfeEmissaoBeforeOpen(DataSet: TDataSet);
begin
  QNfeEmissao.DeclareVariable('COD_USUARIO', otInteger);
  QNfeEmissao.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;


procedure TDMNfe.QManifestDestCalcFields(DataSet: TDataSet);
begin
  if QManifestDest.Active then
    QManifestDestmsg_validacao.Value := QManifestDestDESC_RETORNO_PROCESSAMENTO.Text + ' - ' + QManifestDestDESC_MSG_VALIDACAO.Value;
end;

procedure TDMNfe.QManifestDestTP_EVENTOChange(Sender: TField);
begin
  QManifestDestID_EVENTO.Value := 'ID'+ QManifestDestTP_EVENTO.Value + QManifestDestDESC_CHAVE_ACESSO.Value + '01';
end;
procedure TDMNfe.QGeraCteCalcFields(DataSet: TDataSet);
begin
  if Pos('versao="1.04"',QGeraCteDESC_XML_CTE.Value) > 0 then
    QGeraCteversao_cte.Value := '1.04'
  else if Pos('versao="2.00"',QGeraCteDESC_XML_CTE.Value) > 0 then
    QGeraCteversao_cte.Value := '2.00'
    else
      QGeraCteversao_cte.Value := QGeraCteDESC_VERSAO_CTE.Value;
end;

procedure TDMNfe.QCteEmissaoBeforeOpen(DataSet: TDataSet);
begin
  QCteEmissao.DeclareVariable('COD_USUARIO', otInteger);
  QCteEmissao.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMNfe.QCteCalcFields(DataSet: TDataSet);
begin
  QCteind_aprovado.Value := (StrToInt('0' + QCteSIT_CTE.Value) in SIT_CTE_ACEITO);
  QCteind_cancelado.Value := (StrToInt('0' + QCteSIT_CANC.Value) in SIT_CTE_CANCELADO);
  QCteind_denegado.Value := (StrToInt('0' + QCteSIT_CTE.Value) - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
end;

procedure TDMNfe.QGeraCteAfterOpen(DataSet: TDataSet);
begin
  // Novas regras para emissão de notas no ambiente de homologação CT-e
  if QGeraCte.RecordCount > 0 then
  begin
    if QGeraCteIND_AMBIENTE_CTE_FILIAL.Value = 2 then
    begin
      //QGeraCteINSCRICAO_REM.Value := '';
      QGeraCteNOME_REM.Value := 'CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      //QGeraCteINSCRICAO_DEST.Value := '';
      QGeraCteNOME_DEST.Value := 'CT-E EMITIDO EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
      //if UpperCase(QGeraCteUF_DEST.Value) = 'EX' then
//        QGeraCteCPF_CNPJ_DEST.Value := ''
//      else
//        QGeraCteCPF_CNPJ_DEST.Value := '99999999000191';
    end;
  end;
end;

procedure TDMNfe.QMdfeEmissaoBeforeOpen(DataSet: TDataSet);
begin
  QMdfeEmissao.DeclareVariable('COD_USUARIO', otInteger);
  QMdfeEmissao.SetVariable('COD_USUARIO', DMUsuario.CodUsuarioCorrente);
end;

procedure TDMNfe.QMdfeCalcFields(DataSet: TDataSet);
begin
  QMdfeind_aprovado.Value := (StrToInt('0' + QMdfeSIT_MDFE.Value) in SIT_MDFE_ACEITO);
  QMdfeind_cancelado.Value := (StrToInt('0' + QMdfeSIT_CANC.Value) in SIT_MDFE_CANCELADO);
  QMdfeind_denegado.Value := (StrToInt('0' + QMdfeSIT_MDFE.Value) - 100 in [10, 105, 201, 202]); //status 110, 205, 301 ou 302
  QMdfeind_encerrado.Value := (StrToInt('0' + QMdfeSIT_ENC.Value) in SIT_MDFE_ENCERRADO);
end;
function TDMNfe.GetFuso(UF: String): String;
var
  I : Integer;
  _TerceiroDomFev, _TerceiroDomOut: TDateTime;

begin
  if (  (UF = 'AL') or (UF = 'AP') or (UF = 'CE') or (UF = 'MA') or
        (UF = 'PA') or (UF = 'PB') or (UF = 'PE') or (UF = 'PI') or (UF = 'RN') or
        (UF = 'SE') or (UF = 'TO') or (UF = 'BA') or
        (UF = 'DF') or (UF = 'ES') or (UF = 'GO') or (UF = 'MG') or (UF = 'PR') or
        (UF = 'RJ') or (UF = 'RS') or (UF = 'SC') or (UF = 'SP')) then
    Result := '-03:00'
  else if UF = 'AC' then
    Result := '-05:00'
  else
    Result := '-04:00';
  //else if ( (UF = 'AM') or (UF = 'RO') or (UF = 'RR') ) then
//    Result := '-04:00'
  //else
//  begin
    //_TerceiroDomFev := StrToDateTime('01/02/'+ FormatDateTime('YYYY',now)+ ' 00:00:00');
//    _TerceiroDomOut := StrToDateTime('01/10/'+ FormatDateTime('YYYY',now)+ ' 00:00:00');
//    while dayofweek(_TerceiroDomFev) <> 1 do
//      _TerceiroDomFev := IncDay(_TerceiroDomFev);
//    while DayOfWeek(_TerceiroDomOut) <> 1 do
//      _TerceiroDomOut := IncDay(_TerceiroDomOut);
//    _TerceiroDomFev := IncDay(_TerceiroDomFev,14);
//    _TerceiroDomOut := IncDay(_TerceiroDomOut,28);
//
//    if ((UF = 'DF') or (UF = 'ES') or (UF = 'GO') or (UF = 'MG') or (UF = 'PR') or
//        (UF = 'RJ') or (UF = 'RS') or (UF = 'SC') or (UF = 'SP')) then
//    begin
//      if ((now >= _TerceiroDomFev) and (now < _TerceiroDomOut)) then
//        Result := '-03:00'//Fuso no Horário Normal
//      else
//        Result := '-02:00'//Fuso no Horário de Verão
//    end
//    else
//    begin
//      if ((now >= _TerceiroDomFev) and (now < _TerceiroDomOut)) then
//        Result := '-04:00'//Fuso no Horário Normal
//      else
//        Result := '-03:00'//Fuso no Horário de verão
//    end;
//  end;
end;
{ TExecucaoPreVisualiza }

constructor TExecucaoPreVisualizaDanfe.Create;
begin
  Create('', '', '', 0, True);
end;

constructor TExecucaoPreVisualizaDanfe.Create(Servidor, Chave, Caminho: String;
  Nota: Integer; NFe: Boolean);
begin
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FNota := Nota;
  FNFe := NFe;
end;

procedure TExecucaoPreVisualizaDanfe.Executar(DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Gerando pré-visualização da DANFe ' + IfThen(
      FNota > 0, IntToStr(FNota), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).PrevisualizaDanfe(FChave,FNFe);
  if FRetorno.Status = IMP_DANFE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(ExtractFilePath(Application.ExeName)+'Previsualiza.pdf');
  end;
end;

{ TExecucaoBaixaXMLNFe }

constructor TExecucaoBaixaXMLNFe.Create;
begin
  Create('', 0,0, '');
end;

constructor TExecucaoBaixaXMLNFe.Create(Servidor: String; Filial, Ambiente: Integer; Chave: String);
begin
  FServidor := Servidor;
  FFilial := Filial;
  FAmbiente := Ambiente;
  FChave := Chave
end;

procedure TExecucaoBaixaXMLNFe.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Tentando baixar xml a partir da Chave '+ FChave);
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).BaixarXMLNFe(FFilial, Ambiente, FChave);
end;

{ TExecucaoPreVisualizaDacte }

constructor TExecucaoPreVisualizaDacte.Create;
begin
  Create('', '', '', 0);
end;

constructor TExecucaoPreVisualizaDacte.Create(Servidor, Chave,
  Caminho: String; CTe: Integer);
begin
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FCTe := CTe;
end;

procedure TExecucaoPreVisualizaDacte.Executar(
  DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Gerando pré-visualização do DACTe ' + IfThen(
      FCTe > 0, IntToStr(FCTe), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).PrevisualizaDacte(FChave);
  if FRetorno.Status = IMP_DACTE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(ExtractFilePath(Application.ExeName)+'Previsualiza.pdf');
  end;

end;

{ TExecucaoPreVisualizaDamdfe }

constructor TExecucaoPreVisualizaDamdfe.Create;
begin
  Create('', '', '', 0);
end;

constructor TExecucaoPreVisualizaDamdfe.Create(Servidor, Chave,
  Caminho: String; MDFe: Integer);
begin
  FServidor := Servidor;
  FChave := Chave;
  FCaminho := Caminho;
  FMDFe := MDFe;
end;

procedure TExecucaoPreVisualizaDamdfe.Executar(
  DadosExecucao: TDadosExecucao);
var
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  inherited;
  DadosExecucao.Tela.Notifica('Gerando pré-visualização do DAMDFe ' + IfThen(
      FMDFe > 0, IntToStr(FMDFe), FChave));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).PrevisualizaDamdfe(FChave);
  if FRetorno.Status = IMP_DAMDFE_SUCESSO then
  begin
    mStream := TMemoryStream.Create;
    sStream := TStringStream.Create(FRetorno.Complemento);
    mStream.CopyFrom(sStream,Length(FRetorno.Complemento));
    mStream.SaveToFile(ExtractFilePath(Application.ExeName)+'Previsualiza.pdf');
  end;

end;

procedure TDMNfe.cdsProdutoAusenteBeforePost(DataSet: TDataSet);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    cdsProdutoAusentedesc_produto.Text
      := TiraCaracteresEspeciais(cdsProdutoAusentedesc_produto.Text);
    cdsProdutoAusentedesc_produto_aux.Text
      := TiraCaracteresEspeciais(cdsProdutoAusentedesc_produto_aux.Text);
  end;
end;

procedure TDMNfe.QProdutoLoteItemBeforeDelete(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMNfe.QProdutoLoteItemBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
end;

{ TExecucaoConsultaNFes }

constructor TExecucaoConsultaNFes.Create;
begin
  Create('',0);
end;

constructor TExecucaoConsultaNFes.Create(Servidor: String;
  Filial: Integer);
begin
  FServidor := Servidor;
  FFilial := Filial;
end;

procedure TExecucaoConsultaNFes.Executar(DadosExecucao: TDadosExecucao);
begin
  inherited;
  DadosExecucao.Tela.Notifica('Consultando NF-es emitidas para a Filial ' + IntToStr(FFilial));
  FRetorno := TNFeCliente.GetNFeCliente(FServidor).ConsultaNFes(FFilial);
end;

procedure TDMNfe.ConsultarNFes(Filial: Integer);
var
  wRepNfe: String;
  wExecucaoConsultaNFes: TExecucaoConsultaNFes;
begin
  wRepNfe := DMOracle.FastSelect('DESC_REPOSITORIO_NFE', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(Filial));

  if wRepNfe = '' then
    raise Exception.Create('Filial ou configuração nf-e inexistente');
  wExecucaoConsultaNFes := TExecucaoConsultaNFes.Create( wRepNfe, Filial);
  ExecutaAcoes(TExecucoesList.Create.Add(wExecucaoConsultaNFes));
end;

procedure TDMNfe.QProdutoXmlBeforeEdit(DataSet: TDataSet);
begin
  QProdutoXmlCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMNfe.QProdutoXmlBeforeInsert(DataSet: TDataSet);
begin
  QProdutoXmlCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMNfe.QProdutoXmlBeforePost(DataSet: TDataSet);
begin
  QProdutoXmlCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMNfe.QProdutoXmlBeforeDelete(DataSet: TDataSet);
begin
  if not (DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

end.

