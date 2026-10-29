unit UCadastro_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, {mxtables, mxstore, mxDB, } OracleData, OraTeste;

type
  TDMCadastro = class(TDataModule)
    DSCadastro: TDataSource;
    DSCadastroCons: TDataSource;
    DSProprCadastro: TDataSource;
    DSPropriedade: TDataSource;
    DSPropriedadeCons: TDataSource;
    QCadastro: TOracleDataSet1;
    QCadastroCOD_CADASTRO: TIntegerField;
    QCadastroCOD_ESTADO: TStringField;
    QCadastroNOME: TStringField;
    QCadastroDESC_CIDADE: TStringField;
    QCadastroNUM_CGC_CPF: TStringField;
    QCadastroNUM_INSCRICAO: TStringField;
    QCadastroDT_CADASTRO: TDateTimeField;
    QCadastroIND_SEXO_CATEGORIA: TStringField;
    QCadastroNUM_CAIXA_POSTAL: TIntegerField;
    QCadastroDESC_TELEFONE: TStringField;
    QCadastroDESC_CELULAR: TStringField;
    QCadastroNOME_CONTATO: TStringField;
    QCadastroDT_NASCIMENTO: TDateTimeField;
    QCadastroDESC_BAIRRO: TStringField;
    QCadastroPERC_FUNRURAL: TFloatField;
    QCadastroVAL_LIMITE: TFloatField;
    QCadastroDESC_CIDADE_COBRANCA: TStringField;
    QCadastroDESC_ENDERECO_COBRANCA: TStringField;
    QCadastroDESC_ESTADO_COBRANCA: TStringField;
    QCadastroDESC_CEP_COBRANCA: TStringField;
    QCadastroDESC_TELEFONE_COMERCIAL: TStringField;
    QCadastroNUM_JUNTA: TIntegerField;
    QCadastroDT_FUNDACAO: TDateTimeField;
    QCadastroDT_JUNTA: TDateTimeField;
    QCadastroNOME_MAE: TStringField;
    QCadastroNOME_PAI: TStringField;
    QCadastroDESC_NATURALIDADE: TStringField;
    QCadastroDESC_ESTADO_NATURAL: TStringField;
    QCadastroDT_EXPEDICAO_IDENTIDADE: TDateTimeField;
    QCadastroDESC_FAX_COBRANCA: TStringField;
    QCadastroIND_SEPROC_SIMNAO: TStringField;
    QCadastroDESC_INSCRICAO_MUNICIPAL: TStringField;
    QCadastroNOME_CONJUGE: TStringField;
    QCadastroDESC_CPF_CONJUGE: TStringField;
    QCadastroDESC_IDENTIDADE_CONJUGE: TStringField;
    QCadastroCOD_BANCO_AGENCIA: TIntegerField;
    QCadastroCOD_OPERACAO_CC: TIntegerField;
    QCadastroDT_NASCIMENTO_CONTATO: TDateTimeField;
    QCadastroNOME_CONTATO2: TStringField;
    QCadastroDT_NASCIMENTO2: TDateTimeField;
    QCadastroCOD_VENDEDOR: TIntegerField;
    QCadastroPERC_COMISSAO: TFloatField;
    QCadastroDESC_COMPLEMENTO: TStringField;
    QCadastroIND_FISICA_JURIDICA: TStringField;
    QCadastroDESC_ENDERECO_ENTREGA: TStringField;
    QCadastroDESC_CIDADE_ENTREGA: TStringField;
    QCadastroDESC_BAIRRO_ENTREGA: TStringField;
    QCadastroDESC_OBS: TStringField;
    QCadastroDESC_OBS1: TStringField;
    QCadastroDESC_OBS2: TStringField;
    QProprCadastro: TOracleDataSet1;
    QProprCadastroCOD_CADASTRO: TIntegerField;
    QProprCadastroCOD_PROPRIEDADE: TIntegerField;
    QProprCadastroDESC_PROPRIEDADE: TStringField;
    QProprCadastroNUM_ANO: TIntegerField;
    QProprCadastroVAL_PROPRIEDADE: TFloatField;
    QProprCadastroDESC_OBSERVACAO: TStringField;
    QPropriedade: TOracleDataSet1;
    QPropriedadeCons: TOracleDataSet1;
    QCadastroCons: TOracleDataSet1;
    QCadastroConsCOD_CADASTRO: TIntegerField;
    QCadastroConsCOD_CLASS_CADASTRO: TIntegerField;
    QCadastroConsNOME: TStringField;
    QCadastroConsNUM_CGC_CPF: TStringField;
    QCadastroConsDESC_FANTASIA: TStringField;
    QCadastroConsNUM_INSCRICAO: TStringField;
    QCadastroConsCOD_ESTADO: TStringField;
    QCadastroConsDESC_TELEFONE: TStringField;
    QCadastroConsDT_CANCELAMENTO: TDateTimeField;
    QCadastroConsDESC_CIDADE: TStringField;
    QCadastroConsDESC_ENDERECO: TStringField;
    QPropriedadeCOD_PROPRIEDADE: TIntegerField;
    QPropriedadeCOD_CADASTRO: TIntegerField;
    QPropriedadeCOD_TIPO_PROPRIEDADE: TIntegerField;
    QPropriedadeDESC_PROPRIEDADE: TStringField;
    QPropriedadeNUM_ANO: TIntegerField;
    QPropriedadeVAL_PROPRIEDADE: TFloatField;
    QPropriedadeDESC_LOCALIDADE: TStringField;
    QPropriedadeDESC_OBSERVACAO: TStringField;
    QPropriedadeConsCOD_PROPRIEDADE: TIntegerField;
    QPropriedadeConsDESC_PROPRIEDADE: TStringField;
    QPropriedadeConsNUM_ANO: TIntegerField;
    QPropriedadeConsVAL_PROPRIEDADE: TFloatField;
    QPropriedadenome_cadastro: TStringField;
    QPropriedadenome_tipo_propriedade: TStringField;
    QSomaLimite: TOracleDataSet1;
    QSomaLimiteSVAL_USADO: TFloatField;
    QCadastroDESC_FORMA_COMPRA: TStringField;
    QCadastroCOD_USUARIO: TIntegerField;
    QCadastroDESC_REF_COMERCIAL1: TStringField;
    QCadastroDESC_REF_COMERCIAL2: TStringField;
    QCadastroDESC_REF_COMERCIAL3: TStringField;
    QCadastroDESC_REF_BANCO1: TStringField;
    QCadastroDESC_REF_BANCO2: TStringField;
    QCadastroDESC_REF_BANCO3: TStringField;
    QCadastroDESC_REF_PARENTE_NOME: TStringField;
    QCadastroDESC_REF_PARENTE_ENDERECO: TStringField;
    QCadastroDESC_REF_PARENTE_CIDADE: TStringField;
    asa: TStringField;
    QPropriedadeIND_HIPOTECA: TStringField;
    QPropriedadeDESC_GRAU_HIPOTECA: TStringField;
    QPropriedadeVAL_HIPOTECA: TFloatField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA: TStringField;
    QPropriedadeDT_VENC_HIPOTECA: TDateTimeField;
    QProprCadastroNUM_AREA: TFloatField;
    QPropriedadeNUM_AREA: TFloatField;
    QPropriedadeConsNUM_AREA: TFloatField;
    QCadastroDESC_ORGAO_EMISSOR: TStringField;
    QCadastroDESC_INSCRICAO_INSS: TStringField;
    QCadastroDESC_CARTEIRA: TStringField;
    QCadastroDT_EXPEDICAO_CARTEIRA: TDateTimeField;
    QCadastroIND_LIBERA_VENDA: TStringField;
    QCadastroCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QCadastroIND_REGIME_ESPECIAL: TStringField;
    QCadastroCancela: TOracleDataSet1;
    QCadastroCancelaCOD_CADASTRO: TIntegerField;
    QCadastroCOD_CIDADE: TIntegerField;
    QCadastroDESC_HOBBIE: TStringField;
    QCadastroDESC_DESTRITO: TStringField;
    QCadastroDESC_CONTA_CORRENTE: TStringField;
    QCadastroCOD_OPERACAO_CC1: TIntegerField;
    QCadastroCOD_OPERACAO_CC2: TIntegerField;
    QCadastroDESC_PLACA: TStringField;
    QCadastroPERC_DESCONTO: TFloatField;
    QCadastroIND_LIBERA_BLOQUETO: TStringField;
    QPropriedadeDESC_CEP: TStringField;
    QPropriedadeDESC_BAIRRO: TStringField;
    QPropriedadeCOD_CIDADE: TIntegerField;
    QPropriedadedesc_cidade: TStringField;
    QPropriedadeConsDESC_LOCALIDADE: TStringField;
    QProprCadastroDESC_BAIRRO: TStringField;
    QProprCadastroDESC_CEP: TStringField;
    QProprCadastroCOD_CIDADE: TIntegerField;
    QProprCadastroDESC_LOCALIDADE: TStringField;
    QCadastroDT_CONSULTA_SINTEGRA: TDateTimeField;
    QCadastroDESC_PROFISSAO_CONJUGE: TStringField;
    QCadastroDT_NASCIMENTO_CONJUGE: TDateTimeField;
    QCadastroDESC_EMPRESA_CONJUGE: TStringField;
    QCadastroVL_SALARIO_CONJUGE: TFloatField;
    QCadastroDESC_FUNCAO: TStringField;
    QCadastroDESC_EMPRESA: TStringField;
    QCadastroDESC_FONE_EMPRESA: TStringField;
    QCadastroDESC_TEMPO: TStringField;
    QCadastroVAL_SALARIO: TFloatField;
    QCadastroDESC_PLACA_CARRETA1: TStringField;
    QCadastroDESC_PLACA_CARRETA2: TStringField;
    QCadastroConsCOD_BANCO_AGENCIA: TIntegerField;
    QCadastroConsDESC_CONTA_CORRENTE: TStringField;
    QCadastroConsDESC_AGENCIA: TStringField;
    QCadastroDESC_AGENCIA: TStringField;
    QCadastroConsDESC_BAIRRO: TStringField;
    QRCadastroVenda: TOracleDataSet1;
    QRCadastroVendaCOD_CADASTRO: TIntegerField;
    QRCadastroVendaNOME: TStringField;
    QRCadastroVendaDESC_ENDERECO: TStringField;
    QRCadastroVendaDESC_CIDADE: TStringField;
    QRCadastroVendaDESC_CEP: TStringField;
    QRCadastroVendaNUM_CGC_CPF: TStringField;
    QRCadastroVendaNUM_INSCRICAO: TStringField;
    QRCadastroVendaCOD_ESTADO: TStringField;
    QRCadastroVendaDESC_TELEFONE: TStringField;
    QRCadastroVendadt_venda: TDateField;
    QRCadastroVendaDESC_CLASSIFICACAO: TStringField;
    QCadastroDESC_GARANTIAS: TStringField;
    QCadastroDESC_CPF_AUTORIZADO1: TStringField;
    QCadastroDESC_CPF_AUTORIZADO2: TStringField;
    QCadastroDESC_CPF_AUTORIZADO3: TStringField;
    QCadastroDESC_GARANTIAS_OUTRAS: TStringField;
    QCadastroConsDT_CONSULTA_SINTEGRA: TDateTimeField;
    QCadastroConsDESC_ORGAO_EMISSOR: TStringField;
    QCadastroDT_SEPROCADO: TDateTimeField;
    QCadastroConsDESC_CLASSIFICACAO: TStringField;
    QCadastroConsDT_SEPROCADO: TDateTimeField;
    QCadastroPERC_META: TFloatField;
    QCadastroCOD_CADASTRO_NOVO: TIntegerField;
    QCadastroConsDESC_OBS: TStringField;
    QCadastroSemCompras: TOracleDataSet1;
    QCadastroCOD_PRAZO_VENCIMENTO: TIntegerField;
    QCadastroIND_SOJICULTOR_PARTICIPANTE: TStringField;
    QCadastroNUM_DIA_VISITA: TIntegerField;
    QCadastroDESC_FREQUENCIA_VISITA: TStringField;
    QCadastroNUM_HORA_VISITA: TIntegerField;
    QProprCadastroCOD_TIPO_PROPRIEDADE: TIntegerField;
    QProprCadastroIND_HIPOTECA: TStringField;
    QProprCadastroDESC_GRAU_HIPOTECA: TStringField;
    QProprCadastroVAL_HIPOTECA: TFloatField;
    QProprCadastroDESC_FAVORECIDO_HIPOTECA: TStringField;
    QProprCadastroDT_VENC_HIPOTECA: TDateTimeField;
    QProprCadastroDESC_TIPO_PROPRIEDADE: TStringField;
    QCadastroNUM_DIA_VENCTO: TIntegerField;
    QPropriedadeNUM_MATRICULA: TIntegerField;
    QPropriedadeIND_TIPO_IMOVEL: TStringField;
    QPropriedadeQT_RENDA_SAFRA: TIntegerField;
    QPropriedadeQT_RENDA_SAFRINHA: TIntegerField;
    QPropriedadeVAL_HIPOTECA2: TFloatField;
    QPropriedadeVAL_HIPOTECA3: TFloatField;
    QPropriedadeVAL_HIPOTECA4: TFloatField;
    QPropriedadeVAL_HIPOTECA5: TFloatField;
    QPropriedadeVAL_HIPOTECA6: TFloatField;
    QPropriedadeDT_VENC_HIPOTECA2: TDateTimeField;
    QPropriedadeDT_VENC_HIPOTECA3: TDateTimeField;
    QPropriedadeDT_VENC_HIPOTECA4: TDateTimeField;
    QPropriedadeDT_VENC_HIPOTECA5: TDateTimeField;
    QPropriedadeDT_VENC_HIPOTECA6: TDateTimeField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA2: TStringField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA3: TStringField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA4: TStringField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA5: TStringField;
    QPropriedadeDESC_FAVORECIDO_HIPOTECA6: TStringField;
    QPropriedadeDESC_CRI: TStringField;
    QPropriedadeDT_VENC_CONTRATO: TDateTimeField;
    QPropriedadeCOD_CADASTRO_PROPRIETARIO: TIntegerField;
    QCadastroConsNOME_CONJUGE: TStringField;
    QCadastroEmail: TOracleDataSet1;
    QCadastroEmailDESC_EMAIL: TStringField;
    QCadastroEmailDESC_SENHA: TStringField;
    QCadastroEmailDESC_SMTP: TStringField;
    QCadastroEmailNUM_PORTA_SMTP: TIntegerField;
    QCadastroEmailDESC_POP3: TStringField;
    QCadastroEmailNUM_PORTA_POP3: TIntegerField;
    QCadastroEmailCOD_EMAIL: TIntegerField;
    QCadastroEmailDESC_MENSAGEM: TMemoField;
    QEmailCons: TOracleDataSet1;
    QCadastroEmailDESC_HOME_PAGE: TStringField;
    QCadastroDESC_COMPLEMENTO_SINTEGRA: TStringField;
    QClienteSCPC: TOracleDataSet1;
    QClienteSCPCCOD_CADASTRO: TIntegerField;
    QClienteSCPCCOD_CONTA_RECEBER_CAB: TIntegerField;
    QClienteSCPCDT_RETIRADA_SCPC: TDateTimeField;
    QClienteSCPCNUM_VALOR: TFloatField;
    QClienteSCPCDT_VENCIMENTO: TDateTimeField;
    QClienteSCPCDT_EMISSAO: TDateTimeField;
    QClienteSCPCDESC_CONTRATO: TStringField;
    QClienteSCPCcpf: TStringField;
    QClienteSCPCCOD_CLIENTE_SCPC: TIntegerField;
    QClienteSCPCCons: TOracleDataSet1;
    QClienteSCPCConsNUM_VALOR: TFloatField;
    QClienteSCPCConsDT_VENCIMENTO: TDateTimeField;
    QClienteSCPCConsDT_EMISSAO: TDateTimeField;
    QClienteSCPCConsDESC_CONTRATO: TStringField;
    QClienteSCPCConsNOME: TStringField;
    QRClienteSCPC: TOracleDataSet1;
    QRClienteSCPCCOD_CLIENTE_SCPC: TIntegerField;
    QRClienteSCPCCOD_CADASTRO: TIntegerField;
    QRClienteSCPCCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRClienteSCPCDT_RETIRADA_SCPC: TDateTimeField;
    QRClienteSCPCNUM_VALOR: TFloatField;
    QRClienteSCPCDT_VENCIMENTO: TDateTimeField;
    QRClienteSCPCDT_EMISSAO: TDateTimeField;
    QRClienteSCPCDESC_CONTRATO: TStringField;
    QRClienteSCPCNOME: TStringField;
    QClienteSCPCConsind_baixado: TStringField;
    QClienteSCPCConsDT_RETIRADA_SCPC: TDateTimeField;
    QClienteSCPCConsCOD_CLIENTE_SCPC: TIntegerField;
    QClienteSCPCind_situacao: TStringField;
    QClienteSCPCDT_REGISTRO: TDateTimeField;
    QClienteSCPCDESC_COMPRADOR_AUTORIZADO: TStringField;
    QClienteSCPCDESC_CPF_COMPRADOR_AUTORIZADO: TStringField;
    QRClienteSCPCDESC_COMPRADOR_AUTORIZADO: TStringField;
    QRClienteSCPCDESC_CPF_COMPRADOR_AUTORIZADO: TStringField;
    QEtiquetaDOS: TOracleDataSet1;
    QEtiquetaDOSCOD_CADASTRO: TIntegerField;
    QEtiquetaDOSNOME: TStringField;
    QEtiquetaDOSDESC_ENDERECO: TStringField;
    QEtiquetaDOSCOD_ESTADO: TStringField;
    QEtiquetaDOSDESC_CEP: TStringField;
    QEtiquetaDOSDESC_CIDADE: TStringField;
    QEmailConsCOD_EMAIL: TIntegerField;
    QEmailConsDESC_EMAIL: TStringField;
    QEmailConsDESC_SENHA: TStringField;
    QEmailConsDESC_SMTP: TStringField;
    QEmailConsNUM_PORTA_SMTP: TIntegerField;
    QEmailConsDESC_POP3: TStringField;
    QEmailConsNUM_PORTA_POP3: TIntegerField;
    QEmailConsDESC_MENSAGEM: TMemoField;
    QCadastroNOME_TITULAR: TStringField;
    QCadastroConsNOME_TITULAR: TStringField;
    QCadastroConsDESC_COMPLEMENTO: TStringField;
    QCadastro_Enderecos: TOracleDataSet1;
    QCadastro_EnderecosCOD_CADASTRO: TIntegerField;
    QCadastro_EnderecosDESC_CADPRO: TStringField;
    QCadastro_EnderecosDESC_ENDERECO: TStringField;
    QCadastro_EnderecosCOD_CIDADE: TIntegerField;
    QCadastro_EnderecosDESC_CIDADE: TStringField;
    QCadastro_EnderecosCOD_ESTADO: TStringField;
    QCadastro_EnderecosDESC_BAIRRO: TStringField;
    QCadastro_EnderecosNUM_CAIXA_POSTAL: TIntegerField;
    QCadastro_EnderecosDESC_CEP: TStringField;
    QCadastro_EnderecosCOD_PAIS: TIntegerField;
    QCadastro_EnderecosDESC_DISTRITO: TStringField;
    QCadastroDESC_CRC: TStringField;
    QCadastroConsDESC_INSCRICAO_MUNICIPAL: TStringField;
    QCadastroDESC_QUALIFICACAO: TStringField;
    QCadastroPERC_ESPECIAL_PECA: TFloatField;
    QCadastroPERC_ESPECIAL_SERVICO: TFloatField;
    QImagemCadastro: TOracleDataSet1;
    QImagemCadastroCOD_CADASTRO_IMAGEM: TIntegerField;
    QImagemCadastroCOD_CADASTRO: TIntegerField;
    QImagemCadastroIMG_IMAGEM: TBlobField;
    QImagemCadastroIMG_ASSINATURA: TBlobField;
    QCadastroDT_ALTERACAO: TDateTimeField;
    QCadastroIND_ATACADO_VAREJO: TStringField;
    QCadastroConsDESC_PLACA: TStringField;
    QCadastroComEmail: TOracleDataSet1;
    QCadastroComEmailNOME: TStringField;
    QCadastroComEmailDESC_E_MAIL: TStringField;
    QCadastroPERC_SENAR: TFloatField;
    QAgendamento: TOracleDataSet1;
    QAgendamentoCOD_AGENDAMENTO: TIntegerField;
    QAgendamentoDESC_CLIENTE: TStringField;
    QAgendamentoDESC_MODELO: TStringField;
    QAgendamentoDESC_EQUIPE: TStringField;
    QAgendamentoDESC_OBS: TStringField;
    QAgendamentoDT_ENTRADA: TDateTimeField;
    QAgendamentoDT_SAIDA: TDateTimeField;
    QAgendamentoCOD_USUARIO: TIntegerField;
    QAgendamentoDT_AGENDAMENTO: TDateTimeField;
    QAgendamentoCons: TOracleDataSet1;
    QRAgendamento: TOracleDataSet1;
    QCadastroConsIND_VENDA: TStringField;
    QCadastroConsDESC_FAX: TStringField;
    QCadastroNUM_LIBERA_LIMITE: TIntegerField;
    QCadastroCOD_MOTIVO: TIntegerField;
    QCadastroCOD_TIPO_CADASTRO: TIntegerField;
    QCadastroCOD_REGIAO: TIntegerField;
    QCadastroCOD_PAIS: TIntegerField;
    QCadastroCOD_ESTADO_CIVIL: TIntegerField;
    QCadastroCOD_RAMO: TIntegerField;
    QCadastroCOD_CLASS_CADASTRO: TIntegerField;
    QCadastroEmailIND_SSL: TStringField;
    QInsCadastro: TOracleDataSet1;
    QAgendamentoDT_FABRICACAO: TDateTimeField;
    QAgendamentoDT_TRANSFORMACAO: TDateTimeField;
    QAgendamentoDT_MONTAGEM: TDateTimeField;
    QAgendamentoDT_OUTROS: TDateTimeField;
    QAgendamentoDESC_OBS_TRANSFORMACAO: TStringField;
    QAgendamentoDESC_OBS_MONTAGEM: TStringField;
    QAgendamentoDESC_OBS_OUTROS: TStringField;
    QAgendamentoDESC_OBS_FABRICACAO: TStringField;
    QCadastroDESC_SUFRAMA: TStringField;
    QCadastroDT_ULT_ALTERACAO: TDateTimeField;
    QCadastroDESC_ENDERECO: TStringField;
    QCadastroCOD_UF_VEICULO: TStringField;
    QCadastroExp: TOracleDataSet;
    QCadastroExpCOD_CADASTRO: TIntegerField;
    QCadastroExpNOME: TStringField;
    QCadastroExpDESC_FANTASIA: TStringField;
    QCadastroExpCOD_ESTADO: TStringField;
    QCadastroExpNUM_CGC_CPF: TStringField;
    QCadastroExpNUM_INSCRICAO: TStringField;
    QCadastroExpDESC_ENDERECO: TStringField;
    QCadastroExpDESC_BAIRRO: TStringField;
    QCadastroExpCOD_CIDADE: TIntegerField;
    QCadastroExpDESC_CIDADE: TStringField;
    QCadastroExpDESC_CEP: TStringField;
    QCadastroExpDESC_TELEFONE: TStringField;
    QCadastroExpIND_FISICA_JURIDICA: TStringField;
    QCadastroExpDESC_SUFRAMA: TStringField;
    QCadastroExpCOD_PAIS_IBGE: TIntegerField;
    QCadastroExpCOD_CIDADE_IBGE: TStringField;
    QCadastroExpPERC_FUNRURAL: TFloatField;
    QCadastroExpCOD_UF_IBGE: TIntegerField;
    QCadastroDESC_DISTRITO: TStringField;
    QCadastroCOD_AVALISTA: TIntegerField;
    QAgendamentoNUM_CHASSI: TStringField;
    QCadastro_EnderecosDESC_E_MAIL_COMERCIAL: TStringField;
    QCadastro_EnderecosDESC_E_MAIL_FINANCEIRO: TStringField;
    QAgendamentoCOD_PEDIDO_CAB: TIntegerField;
    QCadastroDESC_ESTADO_CIVIL: TStringField;
    QCadastroIND_ISS_RETIDO: TIntegerField;
    QCadastroPERC_BASE_SUBSTITUICAO: TFloatField;
    QCadastroPERC_ALIQ_SUBSTITUICAO: TFloatField;
    QCadastroDESC_LEI_SUBSTITUICAO: TStringField;
    QCadastroIND_REGIME_TRIBUTARIO: TIntegerField;
    QCadastroConsPERC_DESCONTO: TFloatField;
    QCadastroPERC_DESCONTO2: TFloatField;
    QCadastroPERC_DEDUCAO_NFSE: TFloatField;
    QCadastroConsIND_TITULO_ATRASADO: TStringField;
    QQualificacaoSocio: TOracleDataSet1;
    QQualificacaoSocioCOD_QUALIFICACAO_SOCIO: TStringField;
    QQualificacaoSocioDESC_QUALIFICACAO_SOCIO: TStringField;
    QQualificacaoSocioDESC_COMPLETA: TStringField;
    DSQualificacaoSocio: TDataSource;
    QCadastroCOD_QUALIFICACAO_SOCIO: TStringField;
    QCadastroPERC_CAP_TOT: TFloatField;
    QCadastroPERC_CAP_VOT: TFloatField;
    QCadastroConsIND_REGIME_ESPECIAL: TStringField;
    QCadastroIND_PIS_COFINS_RETIDO: TStringField;
    QCadastroConsIND_SEPROCADO_LOJA: TStringField;
    QCadastroNOME_AUTORIZADO1: TStringField;
    QCadastroNOME_AUTORIZADO2: TStringField;
    QCadastroNOME_AUTORIZADO3: TStringField;
    QCadastroLOCAL_ULTIMA_ALTERACAO: TStringField;
    QCadastroNUM_CGC_CPF_TITULAR_CONTA: TStringField;
    QCadastroDESC_FAX: TStringField;
    QCadastroCOD_TABELA_PRECO_CAB: TIntegerField;
    QCadastroIND_CONSUMIDOR_FINAL: TStringField;
    QCadastroIND_CONTRIBUINTE: TStringField;
    QAgendamentoCOD_FILIAL: TIntegerField;
    QCadastroDT_VENCIMENTO_TABELA_PRECO: TDateTimeField;
    QCadastroDESC_OPERADORA_CELULAR: TStringField;
    QCadastroNUM_SEQ_CRC: TStringField;
    QCadastroDT_CRC: TDateTimeField;
    QInfoCadastro: TOracleDataSet1;
    QInfoCadastroNOME: TStringField;
    QInfoCadastroNUM_CGC_CPF: TStringField;
    QInfoCadastroNOME_AUTORIZADO1: TStringField;
    QInfoCadastroDESC_CPF_AUTORIZADO1: TStringField;
    QInfoCadastroNOME_AUTORIZADO2: TStringField;
    QInfoCadastroDESC_CPF_AUTORIZADO2: TStringField;
    QInfoCadastroNOME_AUTORIZADO3: TStringField;
    QInfoCadastroDESC_CPF_AUTORIZADO3: TStringField;
    QInfoCadastroIMG_IMAGEM: TBlobField;
    QInfoCadastroIMG_ASSINATURA: TBlobField;
    QCadastroDT_CANCELAMENTO: TDateTimeField;
    QCadastroPERC_ROYALTIES: TFloatField;
    QCadastroIND_TIPO_PROPRIETARIO: TIntegerField;
    QCadastroDESC_RNTRC: TStringField;
    QReceituarioOptico: TOracleDataSet1;
    QReceituarioOpticoCOD_RECEITUARIO_OPTICO: TIntegerField;
    QReceituarioOpticoCOD_CADASTRO: TIntegerField;
    QReceituarioOpticoVAL_LONGE_OD_ESFERICO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OD_CILINDRICO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OD_EIXO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OD_DP: TFloatField;
    QReceituarioOpticoVAL_LONGE_OD_ALTURA: TFloatField;
    QReceituarioOpticoVAL_LONGE_OE_ESFERICO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OE_CILINDRICO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OE_EIXO: TFloatField;
    QReceituarioOpticoVAL_LONGE_OE_DP: TFloatField;
    QReceituarioOpticoVAL_LONGE_OE_ALTURA: TFloatField;
    QReceituarioOpticoVAL_PERTO_OD_ESFERICO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OD_CILINDRICO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OD_EIXO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OD_DP: TFloatField;
    QReceituarioOpticoVAL_PERTO_OD_ALTURA: TFloatField;
    QReceituarioOpticoVAL_PERTO_OE_ESFERICO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OE_CILINDRICO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OE_EIXO: TFloatField;
    QReceituarioOpticoVAL_PERTO_OE_DP: TFloatField;
    QReceituarioOpticoVAL_PERTO_OE_ALTURA: TFloatField;
    QReceituarioOpticoDT_CONSULTA: TDateTimeField;
    QReceituarioOpticoDESC_OBS: TMemoField;
    QReceituarioOpticoDESC_MEDICO: TStringField;
    QCadastroConsDESC_CEP: TStringField;
    QCadastroConsDESC_CELULAR: TStringField;
    QCadastroConsDT_NASCIMENTO: TDateTimeField;
    QCadastroConsNOME_CONTATO: TStringField;
    QCadastroConsDT_NASCIMENTO_CONTATO: TDateTimeField;
    QCadastroConsCOD_VENDEDOR: TIntegerField;
    QCadastroConsCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QCadastroConsIND_FISICA_JURIDICA: TStringField;
    QCadastroConsVAL_LIMITE: TFloatField;
    QCadastroConsDT_FUNDACAO: TDateTimeField;
    QCadastroConsDESC_E_MAIL: TStringField;
    QCadastroConsDT_CADASTRO: TDateTimeField;
    QCadastroConsIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QCadastroConsCOD_CIDADE: TIntegerField;
    QCadastroCOD_CADASTRO_WEB: TIntegerField;
    QCadastroDESC_TAF: TStringField;
    QCadastroDESC_NRO_REG_ESTADUAL: TStringField;
    QCadastroDESC_REF_OUTRAS: TStringField;
    QCadastroConsCOD_RAMO: TIntegerField;
    QCadastroCOD_FILIAL: TIntegerField;
    QPropriedadeDESC_LATITUDE: TStringField;
    QPropriedadeDESC_LONGITUDE: TStringField;
    QCadastroConsCOD_TIPO_CADASTRO: TIntegerField;
    QAgendamentoCOD_CADASTRO: TIntegerField;
    QAgendamentoCOD_PRODUTO: TIntegerField;
    QRAgendamentoCOD_AGENDAMENTO: TIntegerField;
    QRAgendamentoDESC_CLIENTE: TStringField;
    QRAgendamentoDESC_MODELO: TStringField;
    QRAgendamentoDESC_EQUIPE: TStringField;
    QRAgendamentoDESC_OBS: TStringField;
    QRAgendamentoDT_ENTRADA: TDateTimeField;
    QRAgendamentoDT_SAIDA: TDateTimeField;
    QRAgendamentoCOD_USUARIO: TIntegerField;
    QRAgendamentoDT_AGENDAMENTO: TDateTimeField;
    QRAgendamentoDT_FABRICACAO: TDateTimeField;
    QRAgendamentoDT_TRANSFORMACAO: TDateTimeField;
    QRAgendamentoDT_MONTAGEM: TDateTimeField;
    QRAgendamentoDT_OUTROS: TDateTimeField;
    QRAgendamentoDESC_OBS_TRANSFORMACAO: TStringField;
    QRAgendamentoDESC_OBS_MONTAGEM: TStringField;
    QRAgendamentoDESC_OBS_OUTROS: TStringField;
    QRAgendamentoDESC_OBS_FABRICACAO: TStringField;
    QRAgendamentoNUM_CHASSI: TStringField;
    QRAgendamentoCOD_PEDIDO_CAB: TIntegerField;
    QRAgendamentoCOD_FILIAL: TIntegerField;
    QRAgendamentoCOD_CADASTRO: TIntegerField;
    QRAgendamentoCOD_PRODUTO: TIntegerField;
    QRAgendamentoNOME: TStringField;
    QRAgendamentoDESC_PRODUTO: TStringField;
    QCadastroDESC_COD_FICHA: TStringField;
    QCadastroConsDESC_COD_FICHA: TStringField;
    QRAgendamentoDESC_TELEFONE: TStringField;
    QRAgendamentoDESC_TELEFONE_COMERCIAL: TStringField;
    QRAgendamentoDESC_CELULAR: TStringField;
    QRAgendamentoCOD_CIDADE: TIntegerField;
    QRAgendamentoDESC_CIDADE: TStringField;
    QRAgendamentoDESC_ENDERECO: TStringField;
    QAgendamentoConsCOD_AGENDAMENTO: TIntegerField;
    QAgendamentoConsDESC_OBS: TStringField;
    QAgendamentoConsDT_ENTRADA: TDateTimeField;
    QAgendamentoConsDT_SAIDA: TDateTimeField;
    QAgendamentoConsCOD_USUARIO: TIntegerField;
    QAgendamentoConsDT_AGENDAMENTO: TDateTimeField;
    QAgendamentoConsCOD_FILIAL: TIntegerField;
    QAgendamentoConsCOD_CADASTRO: TIntegerField;
    QAgendamentoConsCOD_PRODUTO: TIntegerField;
    QAgendamentoConsNOME: TStringField;
    QAgendamentoConsNOME_CADASTRO: TStringField;
    QAgendamentoConsDESC_PRODUTO: TStringField;
    QAgendamentoDT_ULTIMA_TROCA: TDateTimeField;
    QAgendamentoIND_ATRASADO: TStringField;
    QAgendamentoConsIND_ATRASADO: TStringField;
    QRAgendamentoIND_ATRASADO: TStringField;
    QRAgendamentoDT_ULTIMA_TROCA: TDateTimeField;
    QCadastroCOD_MENSAGEM: TIntegerField;
    QCadastroConsCOD_MENSAGEM: TIntegerField;
    QCadastroDESC_CEP: TStringField;
    QCadastroDT_VCTO_ALVARA_SANITARIO: TDateTimeField;
    QCadastroConsDT_VCTO_ALVARA_SANITARIO: TDateTimeField;
    QCadastroCOD_ENTREGADOR: TIntegerField;
    QRAgendamentoDESC_BAIRRO: TStringField;
    QCadastroIND_CPRB: TStringField;
    QRCadastroSemVenda: TOracleDataSet;
    QRCadastroSemVendaCOD_CADASTRO: TIntegerField;
    QRCadastroSemVendaNOME: TStringField;
    QRCadastroSemVendaDESC_ENDERECO: TStringField;
    QRCadastroSemVendaDESC_CIDADE: TStringField;
    QRCadastroSemVendaDESC_CEP: TStringField;
    QRCadastroSemVendaNUM_CGC_CPF: TStringField;
    QRCadastroSemVendaNUM_INSCRICAO: TStringField;
    QRCadastroSemVendaCOD_ESTADO: TStringField;
    QRCadastroSemVendaDESC_TELEFONE: TStringField;
    QRCadastroSemVendaDESC_CLASSIFICACAO: TStringField;
    QCadastroDESC_ID_ESTRANGEIRO: TStringField;
    QCadastroDESC_FANTASIA: TStringField;
    QCadastroVAL_KM_DISTANCIA: TFloatField;
    QCadastroDESC_CEP_ENTREGA: TStringField;
    QCadastroCOD_ESTADO_ENTREGA: TStringField;
    QCadastroDESC_BAIRRO_COBRANCA: TStringField;
    QCadastroEmailDESC_IMAP: TStringField;
    QCadastroEmailNUM_PORTA_IMAP: TIntegerField;
    QCadastroEmailCOD_USUARIO: TIntegerField;
    QCadastroDT_ADMISSAO_FUNCIONARIO: TDateTimeField;
    QCadastroConsIND_ATENCAO: TStringField;
    QCadastroDESC_E_MAIL: TStringField;
    QCadastroDESC_E_MAIL1: TStringField;
    QCadastroIND_PERFIL_TRIBUTARIO: TIntegerField;
    QCadastroDESC_LATITUDE: TStringField;
    QCadastroDESC_LONGITUTE: TStringField;
    procedure QCadastroAfterInsert(DataSet: TDataSet);
    procedure QCadastroCalcFields(DataSet: TDataSet);
    procedure QCadastroAfterPost(DataSet: TDataSet);
    procedure QPropriedadeAfterInsert(DataSet: TDataSet);
    procedure QPropriedadeCalcFields(DataSet: TDataSet);
    procedure QRCadastroVendaCalcFields(DataSet: TDataSet);
    procedure QCadastroBeforePost(DataSet: TDataSet);
    procedure QCadastroDESC_CIDADEChange(Sender: TField);
    procedure QCadastroCOD_ESTADOChange(Sender: TField);
    procedure QClienteSCPCCalcFields(DataSet: TDataSet);
    procedure QClienteSCPCConsCalcFields(DataSet: TDataSet);
    procedure QCadastro_EnderecosAfterInsert(DataSet: TDataSet);
    procedure QCadastroIND_LIBERA_VENDAChange(Sender: TField);
    procedure QCadastroAfterOpen(DataSet: TDataSet);
    procedure QAgendamentoAfterInsert(DataSet: TDataSet);
    procedure QReceituarioOpticoAfterInsert(DataSet: TDataSet);
    procedure QCadastroBeforeInsert(DataSet: TDataSet);
    procedure QCadastroBeforeEdit(DataSet: TDataSet);
    procedure QCadastroAfterDelete(DataSet: TDataSet);
    procedure QReceituarioOpticoBeforeInsert(DataSet: TDataSet);
    procedure QCadastroBeforeDelete(DataSet: TDataSet);
    procedure QCadastroBeforeCancel(DataSet: TDataSet);
    procedure QCadastroAfterCancel(DataSet: TDataSet);
    procedure QCadastroDESC_INSCRICAO_MUNICIPALChange(Sender: TField);
    procedure QAgendamentoCOD_CADASTROChange(Sender: TField);
    procedure QCadastroEmailBeforePost(DataSet: TDataSet);
    procedure QCadastroEmailBeforeEdit(DataSet: TDataSet);
  private
    procedure ValidaCamposNFeCadastro;
  public
    { Public declarations }
    procedure ValidaCredito(wCadastro, wValor: Real);
  end;

var
  DMCadastro: TDMCadastro;
  wAutorizadoOficina: Boolean;

implementation

uses UOracle_cl, UBiblioteca, UClassCadastro_cl, UUsuario_cl,
  UParamSistema_cl, UOficinaPassword, UBensEquipamentoCad, Math, USenha;

{$R *.DFM}

procedure TDMCadastro.QCadastroAfterInsert(DataSet: TDataSet);
begin
  if DMParamSistema.CodEmpresa <> 'ARISTIDES' then
    QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
  QCadastroDT_CADASTRO.Value := DMOracle.DataServ;
  QCadastroDT_ALTERACAO.Value := DMOracle.DataServ;
  QCadastroIND_SEXO_CATEGORIA.Value := 'M'; // Não remover mais esta linha, pois dá problema com PJ (Diego Stiehl - 09/11/2010)

  if (DMParamSistema.CodEmpresa <> 'MOINHO')  and (DMParamSistema.CodEmpresa <> 'ABATE')   and (DMParamSistema.CodEmpresa <> 'KREUZ') and
     (DMParamSistema.CodEmpresa <> 'MERCADO') and (DMParamSistema.CodEmpresa <> 'ALVARES') then  //Solicitado por email (Odirlei) Junior 18/03/2021
  begin
    QCadastroCOD_ESTADO.Value := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL ','COD_FILIAL = '+IntToStr(DMUsuario.CodFilialUsuario), True);
    QCadastroCOD_CIDADE.Value := StrToInt('0' + DMOracle.FastSelect('COD_CIDADE','TB_FILIAL ', 'COD_FILIAL = '+IntToStr(DMUsuario.CodFilialUsuario), True));
    QCadastroDESC_CIDADE.Value := DMOracle.FastSelect('DESC_CIDADE','TB_FILIAL ', 'COD_FILIAL = '+IntToStr(DMUsuario.CodFilialUsuario), True);
    QCadastroDESC_CEP.Value := DMOracle.BuscaNome('SELECT DESC_CEP FROM TB_FILIAL ','COD_FILIAL = '+IntToStr(DMUsuario.CodFilialUsuario), True);
  end;

  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_CEP_COBRANCA.Value := DMCadastro.QCadastroDESC_CEP.Value;

  QCadastroCOD_PAIS.Value := StrToInt('0'+DMOracle.FastSelect('COD_PAIS', 'TB_PAIS', 'TRIM(UPPER(DESC_PAIS)) = TRIM(UPPER(' + QuotedStr('BRASIL') + '))'));

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MERCADO' then
    QCadastroCOD_RAMO.Value := 2;

  If (DMParamSistema.CodEmpresa = 'INSIDE') or (DMParamSistema.CodEmpresa = 'DISPART') then
     QCadastroVal_Limite.Value := 1;
  //para NFCE não cadastrar vendedor do usuário. Estava dando problema na JR Doces. Eles utilizam o vendedor
  //para tirarem os relatório de vendas diárias. Junior - 13/06/2017
  if (pos('NFCE',DMParamSistema.qParamSistemaCod_Empresa.Value) = 0) and (DMUsuario.CodVendedorPadrao <> 0) then
    QCadastroCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;

  if DMParamSistema.CodEmpresa = 'PLOPES' then
    QCadastroCOD_VENDEDOR.text := '';
end;

procedure TDMCadastro.QCadastroCalcFields(DataSet: TDataSet);
begin
//  Buscador.Limpa;
//  Buscador.Adiciona('DESC_TIPO_CADASTRO', 'TB_TIPO_CADASTRO',
//      'COD_TIPO_CADASTRO = 0' + QCadastroCOD_TIPO_CADASTRO.Text);
//  Buscador.Adiciona('DESC_RAMO', 'TB_RAMO',
//      'COD_RAMO = 0' + QCadastroCOD_RAMO.Text);
//  Buscador.Adiciona('DESC_REGIAO', 'TB_REGIAO',
//      'COD_REGIAO = 0' + QCadastroCOD_REGIAO.Text);
//  Buscador.Adiciona('DESC_MOTIVO', 'TB_MOTIVO',
//      'COD_MOTIVO = 0' + QCadastroCOD_MOTIVO.Text);
//  Buscador.Adiciona('DESC_ESTADO_CIVIL', 'TB_ESTADO_CIVIL',
//      'COD_ESTADO_CIVIL = 0' + QCadastroCOD_ESTADO_CIVIL.Text);
//  Buscador.Adiciona('DESC_CLASSIFICACAO', 'TB_CLASS_CADASTRO',
//      'COD_CLASS_CADASTRO = 0' + QCadastroCOD_CLASS_CADASTRO.Text);
//  Buscador.Adiciona('DESC_OPERACAO', 'TB_OPERACAO',
//      'COD_OPERACAO = 0' + QCadastroCOD_OPERACAO_CC.Text);
//  Buscador.Adiciona('NOME', 'TB_VENDEDOR', 'COD_VENDEDOR = 0' + QCadastroCOD_VENDEDOR.Text);
//  Buscador.Adiciona('NOME', 'TB_VENDEDOR', 'COD_VENDEDOR = 0' + QCadastroCOD_VENDEDOR_PREPOSTO.Text);
//  Buscador.Buscar;

//  QCadastroNomeTipoCadastro.Value := Buscador.Proximo;
//  QCadastroDescRamo.Value := Buscador.Proximo;
//  QCadastroNome_Regiao.Value := Buscador.Proximo;
//  QCadastroDesc_Motivo.Value := Buscador.Proximo;
//  QCadastroDesc_Estado_Civil.Value := Buscador.Proximo;
//  QCadastroClass_Cadastro.Value := Buscador.Proximo;
//  QCadastroNome_Operacao.Value := Buscador.Proximo;
//  QCadastroDesc_Vendedor.Value := Buscador.Proximo;
//  QCadastrodesc_vendedor_preposto.Value := Buscador.Proximo;
end;

procedure TDMCadastro.QCadastroAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QCadastroCod_Cadastro.Value;
  QCadastro.Close;
  QCadastro.SetVariable('PK', wCodigo);
  QCadastro.Open;

  if DMParamSistema.QParamSistemaIND_VALIDA_CAMPOS_NFE.Value = 'S' then
    ValidaCamposNFeCadastro;

  if DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CADASTRO_ENDERECOS', 'COD_CADASTRO = ' + FloatToStr(wCodigo)) = '0' then
  begin
    QCadastro_Enderecos.Insert;
    QCadastro_EnderecosCOD_CADASTRO.Value := QCadastroCod_Cadastro.Value;
    if QCadastroDESC_INSCRICAO_MUNICIPAL.Value = '' then
      QCadastro_EnderecosDESC_CADPRO.Value := '1'
    else
      QCadastro_EnderecosDESC_CADPRO.Value := QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    QCadastro_EnderecosDESC_ENDERECO.Value := QCadastroDESC_ENDERECO.Value;
    if (QCadastro_EnderecosDESC_ENDERECO.Value = '') then // Para evitar erro de endereço obrigatorio. Diego A. S. 01/04/2009
      QCadastro_EnderecosDESC_ENDERECO.Value := '.';
    QCadastro_EnderecosCOD_CIDADE.Value := QCadastroCod_Cidade.Value;
    QCadastro_EnderecosDESC_CIDADE.Value := QCadastroDesc_Cidade.Value;
    QCadastro_EnderecosCOD_ESTADO.Value := QCadastroCod_Estado.Value;
    QCadastro_EnderecosDESC_BAIRRO.Value := QCadastroDesc_Bairro.Value;
    QCadastro_EnderecosNUM_CAIXA_POSTAL.Value := QCadastroNum_Caixa_Postal.Value;
    QCadastro_EnderecosDESC_CEP.Value := QCadastroDesc_Cep.Value;
    QCadastro_EnderecosCOD_PAIS.Value := QCadastroCod_Pais.Value;
    QCadastro_EnderecosDESC_DISTRITO.Value := QCadastroDesc_Destrito.Value;
    QCadastro_Enderecos.Post;
  end;
end;

procedure TDMCadastro.QPropriedadeAfterInsert(DataSet: TDataSet);
begin
  QPropriedadeCod_cadastro.Value := QCadastroCod_Cadastro.Value;
end;

procedure TDMCadastro.QPropriedadeCalcFields(DataSet: TDataSet);
begin
//  QPropriedadenome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPropriedadeCod_Cadastro.Value));
//  QPropriedadenome_tipo_propriedade.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_PROPRIEDADE FROM TB_TIPO_PROPRIEDADE','COD_TIPO_PROPRIEDADE = '+FloatToStr(QPropriedadeCod_Tipo_Propriedade.Value));
//  QPropriedadedesc_cidade.Value := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = '+FloatToStr(QPropriedadeCod_Cidade.Value));
end;

procedure TDMCadastro.ValidaCredito(wCadastro, wValor: Real);
var
  //Número de liberações para o cadastro. Para Friella poder liberar estourar o limite apenas 1 vez. Diego A. S. 10/08/2010
  x, y: array of string;
begin
  QSomaLimite.Close;
  QSomaLimite.SetVariable('CADASTRO', wCadastro);
  QSomaLimite.Open;

  setLength(x, 2); //2 sql diferentes
  setLength(y, 2);

  x[0] := 'SELECT NVL(NUM_LIBERA_LIMITE,0) FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(wCadastro);
  x[1] := 'SELECT NVL(VAL_LIMITE,0) FROM TB_CADASTRO WHERE COD_CADASTRO = '+ FloatToStr(wCadastro);

  DMOracle.BuscaNomes(x, y);

  try
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'VETRO') AND
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ') AND
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'EXECUTIVA'){ AND
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRIVET') pedido para desabilitar por raquel}
        ) then
      if (StrToInt(y[0]) < 1) and (StrToFloat(y[1]) >= 0) and ((y[1]) <> '0') and (StrToFloat(y[1]) < (wValor + QSomaLimiteSVAL_USADO.Value)) then
        raise Exception.Create('Cadastro com limite insuficiente!');
    if StrToInt(y[0]) > 0 then
      DMOracle.ExecutaSql('UPDATE TB_CADASTRO SET NUM_LIBERA_LIMITE = NUM_LIBERA_LIMITE - 1 ' +
        'WHERE COD_CADASTRO = ' + FloatToStr(wCadastro), False);
  except
    QSomaLimite.Close;
    raise;
  end;
  QSomaLimite.Close;
end;


procedure TDMCadastro.QRCadastroVendaCalcFields(DataSet: TDataSet);
var wDtVenda: string;
begin
  wDtVenda := DMOracle.BuscaNome('SELECT MAX(DT_EMISSAO) FROM TB_NOTA_CAB', 'COD_CADASTRO = ' + FloatToStr(QrCadastroVendaCod_Cadastro.Value), True);
  if Trim(wDtVenda) <> '' then
    QrCadastroVendadt_venda.Value := StrToDate(wDtVenda);
end;

procedure TDMCadastro.QCadastroBeforePost(DataSet: TDataSet);
begin
  if (QCadastroCOD_FILIAL.Text <> '') then
    DMOracle.ValidaFilial(QCadastroCOD_FILIAL.Text);
  //CAMPO USADO PARA O SINCRONISMO DE DADOS COM O SISTEMA DE PEDIDOS WEB
  QCadastroLOCAL_ULTIMA_ALTERACAO.Value := 'CEMAPA';
  if DMUsuario.CodUsuarioCorrente > 0 then
    QCadastroCod_Usuario.Value := DMUsuario.CodUsuarioCorrente
  else
    QCadastroCod_Usuario.Text := '';
  if QReceituarioOptico.State in [dsInsert, dsEdit] then
    QReceituarioOptico.Post;

  //----------------------------------------------------------------------------
  // Por Gian 24/01/2019, à pedido da Dani da Grasel, suporte 10244
  // Quando Tipo de cadastro Cliente, e pessoa física, é necessário informar
  // o cadastro do produtor rural.
  //----------------------------------------------------------------------------
  if DMParamSistema.CodEmpresa = 'GRASEL' then
  begin
    if (QCadastroCOD_TIPO_CADASTRO.Value = 1) and
      (QCadastroIND_FISICA_JURIDICA.Value = 'F') and
      (Trim(QCadastroDESC_INSCRICAO_MUNICIPAL.Value) = '') then
    begin
      MessageDlg('Informar cadastro de produtor rural!', mtError, [mbOK], 0);
      Abort;
    end;
  end;
  if QCadastroIND_FISICA_JURIDICA.Value = 'F' then
    QCadastroIND_ISS_RETIDO.Value := 2;
end;

procedure TDMCadastro.QCadastroDESC_CIDADEChange(Sender: TField);
begin
  QCadastroDesc_Cidade_Cobranca.Value := QCadastroDESC_CIDADE.Text;
end;

procedure TDMCadastro.QCadastroCOD_ESTADOChange(Sender: TField);
begin
  QCadastroDesc_Estado_Cobranca.Value := QCadastroCOD_ESTADO.Text;
end;

procedure TDMCadastro.QClienteSCPCCalcFields(DataSet: TDataSet);
begin
  if QClienteSCPCCOD_CADASTRO.Text <> '' then
    QClienteSCPCcpf.Value := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' +
      QClienteSCPCCOD_CADASTRO.Text, true);
  if QClienteSCPCDT_RETIRADA_SCPC.Text = '' then
    QClienteSCPCind_situacao.Value := 'ATIVO'
  else
    QClienteSCPCind_situacao.Value := 'BAIXADO';
end;

procedure TDMCadastro.QClienteSCPCConsCalcFields(DataSet: TDataSet);
begin
  if QClienteSCPCConsDT_RETIRADA_SCPC.Text = '' then
    QClienteSCPCConsind_baixado.Value := 'ATIVO'
  else
    QClienteSCPCConsind_baixado.Value := 'BAIXADO';
end;

procedure TDMCadastro.QCadastro_EnderecosAfterInsert(DataSet: TDataSet);
begin
  QCadastro_EnderecosCod_Cadastro.Value := QCadastroCod_Cadastro.Value;
end;

procedure TDMCadastro.QCadastroIND_LIBERA_VENDAChange(Sender: TField);
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS') and (QCadastro.State = DsEdit) then
  begin
    if not wAutorizadoOficina then
    begin
      if FOficinaPassword = nil then
        FOficinaPassword := TFOficinaPassword.Create(Application);
      if FOficinaPassword.ShowModal = MrOk then
        wAutorizadoOficina := (UpperCase(FOficinaPassword.Password.Text) = UpperCase(DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text))
      else
        Abort;
    end;
    if not wAutorizadoOficina then
      raise Exception.Create('Não autorizado');
  end;
end;

procedure TDMCadastro.QCadastroAfterOpen(DataSet: TDataSet);
begin
  wAutorizadoOficina := False;
  QReceituarioOptico.Close;
  QReceituarioOptico.SetVariable('COD_CADASTRO', QCadastroCOD_CADASTRO.Value);
  QReceituarioOptico.Open;
end;

procedure TDMCadastro.QAgendamentoAfterInsert(DataSet: TDataSet);
begin
  QAgendamentoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  QAgendamentoDT_ENTRADA.Value := DMOracle.DataServ;
end;

procedure TDMCadastro.ValidaCamposNFeCadastro;
  var naoPreenchidos : string;
begin
  if(QCadastroDESC_ENDERECO.Value = '') then
    naoPreenchidos := naoPreenchidos + #13 + 'Endereço';
  if(QCadastroDESC_BAIRRO.Value = '') then
    naoPreenchidos := naoPreenchidos + #13 + 'Bairro';
  if(QCadastroDESC_CEP.Value = '') then
    naoPreenchidos := naoPreenchidos + #13 + 'CEP';
  if(QCadastroCOD_CIDADE.IsNull) then
    naoPreenchidos := naoPreenchidos + #13 + 'Cidade';
  if DMOracle.FastSelect('COD_CIDADE_IBGE', 'TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text) = '' then
    naoPreenchidos := naoPreenchidos + #13 + 'Código do IBGE da Cidade ' + QCadastroDESC_CIDADE.Text;
  if(naoPreenchidos <> '') then
    ShowMessage('Os campos a seguir são obrigatórios para a emissão de NF-e: ' + naoPreenchidos);
end;

procedure TDMCadastro.QReceituarioOpticoAfterInsert(DataSet: TDataSet);
begin
  QReceituarioOpticoCOD_CADASTRO.Value
    := QCadastroCOD_CADASTRO.Value;
end;

procedure TDMCadastro.QCadastroBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCadastro.QCadastroBeforeEdit(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCadastro.QCadastroAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMCadastro.QReceituarioOpticoBeforeInsert(DataSet: TDataSet);
begin
  if QCadastro.State in [dsInsert, dsEdit] then
  begin
    QCadastro.Post;
    QCadastro.Edit;
  end;
end;

procedure TDMCadastro.QCadastroBeforeDelete(DataSet: TDataSet);
begin
  QReceituarioOptico.DisableControls;
  QReceituarioOptico.First;
  while not QReceituarioOptico.Eof do
  begin
    QReceituarioOptico.Delete;
  end;
  QReceituarioOptico.EnableControls;
end;

procedure TDMCadastro.QCadastroBeforeCancel(DataSet: TDataSet);
begin
  if QReceituarioOptico.State in [dsInsert, dsEdit] then
    QReceituarioOptico.Cancel;
end;

procedure TDMCadastro.QCadastroAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMCadastro.QCadastroDESC_INSCRICAO_MUNICIPALChange(
  Sender: TField);
begin
  if (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') then
  begin
    if Trim(QCadastroDESC_INSCRICAO_MUNICIPAL.Value) = '' then
    begin
      QCadastroIND_CONTRIBUINTE.Value := 'NAO';
    end
    else if Length(Trim(QCadastroDESC_INSCRICAO_MUNICIPAL.Value)) >= 5 then
    begin
      DMCadastro.QCadastroIND_CONTRIBUINTE.Value := 'SIM';
    end;
  end;
end;

procedure TDMCadastro.QAgendamentoCOD_CADASTROChange(Sender: TField);
begin
  if DMParamSistema.CodEmpresa = 'CASAFILTRO' then
    DMCadastro.QAgendamentoDESC_OBS.Value := DmOracle.FastSelect('DESC_OBS','TB_CADASTRO','COD_CADASTRO = ' + QAgendamentoCOD_CADASTRO.Text);
end;

procedure TDMCadastro.QCadastroEmailBeforePost(DataSet: TDataSet);
begin
  QCadastroEmailCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMCadastro.QCadastroEmailBeforeEdit(DataSet: TDataSet);
begin
  QCadastroEmailCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.

