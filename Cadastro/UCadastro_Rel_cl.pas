unit UCadastro_Rel_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCadastro_Rel = class(TDataModule)
    QRAniversariante: TOracleDataSet1;
    QRAniversarianteCOD_CADASTRO: TIntegerField;
    QRAniversarianteNOME: TStringField;
    QRAniversarianteDESC_ENDERECO: TStringField;
    QRAniversarianteDESC_CIDADE: TStringField;
    QRAniversarianteCOD_ESTADO: TStringField;
    QRAniversarianteDESC_CEP: TStringField;
    QRAniversarianteDESC_TELEFONE: TStringField;
    QRAniversarianteDT_NASCIMENTO: TDateTimeField;
    QREtiquetas2: TOracleDataSet1;
    QREtiquetas2COD_CADASTRO: TIntegerField;
    QREtiquetas2COD_MOTIVO: TIntegerField;
    QREtiquetas2COD_TIPO_CADASTRO: TIntegerField;
    QREtiquetas2COD_REGIAO: TIntegerField;
    QREtiquetas2COD_PAIS: TIntegerField;
    QREtiquetas2COD_ESTADO_CIVIL: TIntegerField;
    QREtiquetas2COD_RAMO: TIntegerField;
    QREtiquetas2COD_ESTADO: TStringField;
    QREtiquetas2NOME: TStringField;
    QREtiquetas2DESC_ENDERECO: TStringField;
    QREtiquetas2DESC_CIDADE: TStringField;
    QREtiquetas2DESC_CEP: TStringField;
    QREtiquetas2NUM_CGC_CPF: TStringField;
    QREtiquetas2NUM_INSCRICAO: TStringField;
    QREtiquetas2NUM_CAIXA_POSTAL: TIntegerField;
    QREtiquetas2DESC_TELEFONE: TStringField;
    QREtiquetas2DESC_CELULAR: TStringField;
    QREtiquetas2NOME_CONTATO: TStringField;
    QREtiquetas2DT_NASCIMENTO: TDateTimeField;
    QREtiquetas2DESC_BAIRRO: TStringField;
    QREtiquetas2PERC_FUNRURAL: TFloatField;
    QREtiquetas2VAL_LIMITE: TFloatField;
    QREtiquetas2DESC_FANTASIA: TStringField;
    QREtiquetas2DESC_CIDADE_COBRANCA: TStringField;
    QREtiquetas2DESC_ENDERECO_COBRANCA: TStringField;
    QREtiquetas2DESC_ESTADO_COBRANCA: TStringField;
    QREtiquetas2DESC_CEP_COBRANCA: TStringField;
    QREtiquetas2DESC_TELEFONE_COMERCIAL: TStringField;
    QREtiquetas2NUM_JUNTA: TIntegerField;
    QREtiquetas2DT_FUNDACAO: TDateTimeField;
    QREtiquetas2DT_JUNTA: TDateTimeField;
    QREtiquetas2DESC_FAX: TStringField;
    QREtiquetas2NOME_MAE: TStringField;
    QREtiquetas2NOME_PAI: TStringField;
    QREtiquetas2DESC_NATURALIDADE: TStringField;
    QREtiquetas2DESC_ESTADO_NATURAL: TStringField;
    QREtiquetas2DT_EXPEDICAO_IDENTIDADE: TDateTimeField;
    QREtiquetas2DESC_FAX_COBRANCA: TStringField;
    QREtiquetas2IND_SEPROC_SIMNAO: TStringField;
    QREtiquetas2DESC_INSCRICAO_MUNICIPAL: TStringField;
    QRCliente: TOracleDataSet1;
    QRClienteCOD_CADASTRO: TIntegerField;
    QRClienteNOME: TStringField;
    QRClienteDESC_ENDERECO: TStringField;
    QRClienteDESC_CIDADE: TStringField;
    QRClienteCOD_ESTADO: TStringField;
    QRClienteDESC_CEP: TStringField;
    QRClienteNUM_INSCRICAO: TStringField;
    QRClienteNUM_CGC_CPF: TStringField;
    QRClienteDESC_TELEFONE: TStringField;
    QRClienteNOME_CONTATO: TStringField;
    QRClienteDT_NASCIMENTO_CONTATO: TDateTimeField;
    QRClienteDESC_E_MAIL: TStringField;
    QRCadastroContato: TOracleDataSet1;
    QRCadastroContatoCOD_CADASTRO: TIntegerField;
    QRCadastroContatoNOME: TStringField;
    QRCadastroContatoDESC_ENDERECO: TStringField;
    QRCadastroContatoDESC_CIDADE: TStringField;
    QRCadastroContatoCOD_ESTADO: TStringField;
    QRCadastroContatoDESC_TELEFONE: TStringField;
    QRCadastroContatoNOME_CONTATO: TStringField;
    QRMalaDireta: TOracleDataSet1;
    QRMalaDiretaCOD_CADASTRO: TIntegerField;
    QRMalaDiretaNOME: TStringField;
    QRMalaDiretaDESC_ENDERECO: TStringField;
    QRMalaDiretaDESC_CIDADE: TStringField;
    QRMalaDiretaCOD_ESTADO: TStringField;
    QRMalaDiretaDESC_CEP: TStringField;
    QRMalaDiretaNUM_CAIXA_POSTAL: TIntegerField;
    QRMalaDiretaDESC_BAIRRO: TStringField;
    QRProprCadastro: TOracleDataSet1;
    QRProprCadastroCOD_CADASTRO: TIntegerField;
    QRProprCadastroNOME: TStringField;
    QRProprCadastroDESC_TELEFONE: TStringField;
    QRProprCadastroDESC_CIDADE: TStringField;
    QRProprCadastroDESC_OBSERVACAO: TStringField;
    QRProprCadastroVAL_PROPRIEDADE: TFloatField;
    QRProprCadastroDESC_LOCALIDADE: TStringField;
    QRProprCadastroNUM_ANO: TIntegerField;
    QRProprCadastroDESC_PROPRIEDADE: TStringField;
    QRProprCadastroCOD_PROPRIEDADE: TIntegerField;
    QRProprCadastroNUM_AREA: TFloatField;
    QRCliente_Fantasia: TOracleDataSet1;
    QRCliente_FantasiaCOD_CADASTRO: TIntegerField;
    QRCliente_FantasiaDESC_FANTASIA: TStringField;
    QRCliente_FantasiaDESC_TELEFONE: TStringField;
    QRCliente_FantasiaDESC_BAIRRO: TStringField;
    QRCliente_FantasiaDESC_CLASSIFICACAO: TStringField;
    QRCliente_FantasiaVAL_LIMITE: TFloatField;
    QREtiquetas: TOracleDataSet1;
    QREtiquetasCOD_CADASTRO: TIntegerField;
    QREtiquetasCOD_ESTADO: TStringField;
    QREtiquetasNOME: TStringField;
    QREtiquetasDESC_ENDERECO: TStringField;
    QREtiquetasDESC_CIDADE: TStringField;
    QREtiquetasDESC_CEP: TStringField;
    QREtiquetasNUM_CAIXA_POSTAL: TIntegerField;
    QREtiquetasDESC_TELEFONE: TStringField;
    QREtiquetasDESC_BAIRRO: TStringField;
    QREtiquetasDESC_CIDADE_COBRANCA: TStringField;
    QREtiquetasDESC_ENDERECO_COBRANCA: TStringField;
    QREtiquetasDESC_ESTADO_COBRANCA: TStringField;
    QREtiquetasDESC_CEP_COBRANCA: TStringField;
    QREtiquetasDESC_TELEFONE_COMERCIAL: TStringField;
    QRMalaDireta_Aniver: TOracleDataSet1;
    QRCadastro_Com_Venda: TOracleDataSet1;
    QRCadastro_Com_VendaCOD_CADASTRO: TIntegerField;
    QRCadastro_Com_VendaNOME: TStringField;
    QRCadastro_Com_VendaDESC_ENDERECO: TStringField;
    QRCadastro_Com_VendaDESC_CIDADE: TStringField;
    QRCadastro_Com_VendaCOD_ESTADO: TStringField;
    QRCadastro_Com_VendaDESC_CEP: TStringField;
    QRCadastro_Com_VendaNUM_INSCRICAO: TStringField;
    QRCadastro_Com_VendaNUM_CGC_CPF: TStringField;
    QRCadastro_Com_VendaDESC_TELEFONE: TStringField;
    QRCadastro_Com_VendaCOD_VENDEDOR: TIntegerField;
    QRCadastro_Com_VendaNOME_VENDEDOR: TStringField;
    QRCadastro_Com_VendaDESC_CELULAR: TStringField;
    QRCadastro_Com_VendaNOME_CONTATO: TStringField;
    QRCadastro_Com_VendaDESC_E_MAIL: TStringField;
    QRCadastroEnvelopes: TOracleDataSet1;
    QRCadastroEnvelopesCOD_CADASTRO: TIntegerField;
    QRCadastroEnvelopesCOD_ESTADO: TStringField;
    QRCadastroEnvelopesNOME: TStringField;
    QRCadastroEnvelopesNUM_CAIXA_POSTAL: TIntegerField;
    QRCadastroEnvelopesDESC_TELEFONE: TStringField;
    QRCadastroEnvelopesDESC_CIDADE_COBRANCA: TStringField;
    QRCadastroEnvelopesDESC_ENDERECO_COBRANCA: TStringField;
    QRCadastroEnvelopesDESC_ESTADO_COBRANCA: TStringField;
    QRCadastroEnvelopesDESC_CEP_COBRANCA: TStringField;
    QRCadastroEnvelopesDESC_BAIRRO: TStringField;
    QREncerrado: TOracleDataSet1;
    QREncerradoCOD_CADASTRO: TIntegerField;
    QREncerradoNOME: TStringField;
    QREncerradoDESC_TELEFONE: TStringField;
    QREncerradoDT_CANCELAMENTO: TDateTimeField;
    QREncerradoCOD_MOTIVO: TIntegerField;
    QREncerradoDESC_MOTIVO: TStringField;
    QREncerradoCOD_VENDEDOR: TIntegerField;
    QREncerradoNOME_VENDEDOR: TStringField;
    QRPropriedade: TOracleDataSet1;
    QRPropriedadeCOD_CADASTRO: TIntegerField;
    QRPropriedadeCOD_TIPO_PROPRIEDADE: TIntegerField;
    QRPropriedadeCOD_PROPRIEDADE: TIntegerField;
    QRPropriedadeDESC_OBSERVACAO: TStringField;
    QRPropriedadeDESC_PROPRIEDADE: TStringField;
    QRPropriedadeVAL_PROPRIEDADE: TFloatField;
    QRPropriedadeDESC_LOCALIDADE: TStringField;
    QRPropriedadeNUM_AREA: TFloatField;
    QRPropriedadeNUM_ANO: TIntegerField;
    QRCadastroDadosPessoais: TOracleDataSet1;
    QRCadastroDadosPessoaisCOD_CADASTRO: TIntegerField;
    QRCadastroDadosPessoaisNOME: TStringField;
    QRCadastroDadosPessoaisDESC_TELEFONE: TStringField;
    QRCadastroDadosPessoaisDESC_CELULAR: TStringField;
    QRCadastroDadosPessoaisDESC_E_MAIL: TStringField;
    QRCadastroDadosPessoaisDESC_CIDADE: TStringField;
    QRCadastroDadosPessoaisCOD_ESTADO: TStringField;
    QRCadastroDadosPessoaisDT_CADASTRO: TDateTimeField;
    QRCadastroDadosPessoaisDESC_RAMO: TStringField;
    QRCadastro_Venda_Acima: TOracleDataSet1;
    QRCadastro_Venda_AcimaNUM_CGC_CPF: TStringField;
    QRCadastro_Venda_AcimaNOME: TStringField;
    QRCadastro_Venda_AcimaVAL_TOTAL: TFloatField;
    QRCadastro_Venda_AcimaDESC_TELEFONE: TStringField;
    QRCadastroEndereco: TOracleDataSet1;
    QRCadastroEnderecoCOD_CADASTRO: TIntegerField;
    QRCadastroEnderecoNOME: TStringField;
    QRCadastroEnderecoDESC_CIDADE: TStringField;
    QRCadastroEnderecoCOD_ESTADO: TStringField;
    QRCadastroEnderecoDESC_CEP: TStringField;
    QRCadastroEnderecoDESC_TELEFONE: TStringField;
    QRCadastroEnderecoDESC_ENDERECO: TStringField;
    QRCadastroEnderecoDESC_BAIRRO: TStringField;
    QRCadastroEnderecoVAL_LIMITE: TFloatField;
    QRCadastroEnderecoDESC_CLASSIFICACAO: TStringField;
    QRCadastro: TOracleDataSet1;
    QRCadastroCOD_CADASTRO: TIntegerField;
    QRCadastroCOD_MOTIVO: TIntegerField;
    QRCadastroCOD_TIPO_CADASTRO: TIntegerField;
    QRCadastroCOD_REGIAO: TIntegerField;
    QRCadastroCOD_PAIS: TIntegerField;
    QRCadastroCOD_ESTADO_CIVIL: TIntegerField;
    QRCadastroCOD_RAMO: TIntegerField;
    QRCadastroCOD_ESTADO: TStringField;
    QRCadastroNOME: TStringField;
    QRCadastroDESC_ENDERECO: TStringField;
    QRCadastroDESC_CIDADE: TStringField;
    QRCadastroDESC_CEP: TStringField;
    QRCadastroNUM_CGC_CPF: TStringField;
    QRCadastroNUM_INSCRICAO: TStringField;
    QRCadastroDT_CADASTRO: TDateTimeField;
    QRCadastroIND_SEXO_CATEGORIA: TStringField;
    QRCadastroNUM_CAIXA_POSTAL: TIntegerField;
    QRCadastroDT_CANCELAMENTO: TDateTimeField;
    QRCadastroDESC_TELEFONE: TStringField;
    QRCadastroDESC_CELULAR: TStringField;
    QRCadastroNOME_CONTATO: TStringField;
    QRCadastroDT_NASCIMENTO: TDateTimeField;
    QRCadastroDESC_BAIRRO: TStringField;
    QRCadastroPERC_FUNRURAL: TFloatField;
    QRCadastroVAL_LIMITE: TFloatField;
    QRCadastroDESC_FANTASIA: TStringField;
    QRCadastroDESC_CIDADE_COBRANCA: TStringField;
    QRCadastroDESC_ENDERECO_COBRANCA: TStringField;
    QRCadastroDESC_ESTADO_COBRANCA: TStringField;
    QRCadastroDESC_CEP_COBRANCA: TStringField;
    QRCadastroDESC_TELEFONE_COMERCIAL: TStringField;
    QRCadastroNUM_JUNTA: TIntegerField;
    QRCadastroDT_FUNDACAO: TDateTimeField;
    QRCadastroDT_JUNTA: TDateTimeField;
    QRCadastroDESC_FAX: TStringField;
    QRCadastroNOME_MAE: TStringField;
    QRCadastroNOME_PAI: TStringField;
    QRCadastroDESC_NATURALIDADE: TStringField;
    QRCadastroDESC_ESTADO_NATURAL: TStringField;
    QRCadastroDT_EXPEDICAO_IDENTIDADE: TDateTimeField;
    QRCadastroDESC_E_MAIL: TStringField;
    QRCadastroDESC_FAX_COBRANCA: TStringField;
    QRCadastroIND_SEPROC_SIMNAO: TStringField;
    QRCadastroDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRCadastroNOME_CONJUGE: TStringField;
    QRCadastroDESC_CPF_CONJUGE: TStringField;
    QRCadastroDESC_IDENTIDADE_CONJUGE: TStringField;
    QRCadastroCOD_CLASS_CADASTRO: TIntegerField;
    QRCadastroCOD_BANCO_AGENCIA: TIntegerField;
    QRCadastroCOD_OPERACAO_CC: TIntegerField;
    QRCadastroDT_NASCIMENTO_CONTATO: TDateTimeField;
    QRCadastroNOME_CONTATO2: TStringField;
    QRCadastroDT_NASCIMENTO2: TDateTimeField;
    QRCadastroCOD_VENDEDOR: TIntegerField;
    QRCadastroPERC_COMISSAO: TFloatField;
    QRCadastroDESC_COMPLEMENTO: TStringField;
    QRCadastroIND_FISICA_JURIDICA: TStringField;
    QRCadastroDESC_ENDERECO_ENTREGA: TStringField;
    QRCadastroDESC_CIDADE_ENTREGA: TStringField;
    QRCadastroDESC_BAIRRO_ENTREGA: TStringField;
    QRCadastroDESC_OBS: TStringField;
    QRCadastroDESC_OBS1: TStringField;
    QRCadastroDESC_OBS2: TStringField;
    QRCadastroDESC_FORMA_COMPRA: TStringField;
    QRCadastroCOD_USUARIO: TIntegerField;
    QRCadastroDESC_REF_COMERCIAL1: TStringField;
    QRCadastroDESC_REF_COMERCIAL2: TStringField;
    QRCadastroDESC_REF_COMERCIAL3: TStringField;
    QRCadastroDESC_REF_BANCO1: TStringField;
    QRCadastroDESC_REF_BANCO2: TStringField;
    QRCadastroDESC_REF_BANCO3: TStringField;
    QRCadastroDESC_REF_PARENTE_NOME: TStringField;
    QRCadastroDESC_REF_PARENTE_ENDERECO: TStringField;
    QRCadastroDESC_REF_PARENTE_CIDADE: TStringField;
    QRCadastroDESC_REF_PARENTE_TELEFONE: TStringField;
    QRCadastroDESC_REF_OUTRAS: TStringField;
    QRCadastroCOD_CADASTRO_NOVO: TIntegerField;
    QRCadastroDESC_ORGAO_EMISSOR: TStringField;
    QRCadastroDESC_INSCRICAO_INSS: TStringField;
    QRCadastroDESC_CARTEIRA: TStringField;
    QRCadastroDT_EXPEDICAO_CARTEIRA: TDateTimeField;
    QRCadastroIND_LIBERA_VENDA: TStringField;
    QRCadastroCOD_VENDEDOR_PREPOSTO: TIntegerField;
    QRCadastroIND_REGIME_ESPECIAL: TStringField;
    QRCadastroCOD_CIDADE: TIntegerField;
    QRCadastroDESC_HOBBIE: TStringField;
    QRCadastroDESC_DESTRITO: TStringField;
    QRCadastroDESC_AGENCIA: TStringField;
    QRCadastroDESC_CONTA_CORRENTE: TStringField;
    QRCadastroCOD_OPERACAO_CC1: TIntegerField;
    QRCadastroCOD_OPERACAO_CC2: TIntegerField;
    QRCadastroDESC_PLACA: TStringField;
    QRCadastroPERC_DESCONTO: TFloatField;
    QRCadastroIND_LIBERA_BLOQUETO: TStringField;
    QRCadastroDT_CONSULTA_SINTEGRA: TDateTimeField;
    QRCadastroDESC_PROFISSAO_CONJUGE: TStringField;
    QRCadastroDT_NASCIMENTO_CONJUGE: TDateTimeField;
    QRCadastroDESC_EMPRESA_CONJUGE: TStringField;
    QRCadastroVL_SALARIO_CONJUGE: TFloatField;
    QRCadastroDESC_FUNCAO: TStringField;
    QRCadastroDESC_EMPRESA: TStringField;
    QRCadastroDESC_FONE_EMPRESA: TStringField;
    QRCadastroDESC_TEMPO: TStringField;
    QRCadastroVAL_SALARIO: TFloatField;
    QRCadastroDESC_PLACA_CARRETA1: TStringField;
    QRCadastroDESC_PLACA_CARRETA2: TStringField;
    QRCadastroDESC_BAIRRO_COBRANCA: TStringField;
    QRCadastronometipocadastro: TStringField;
    QRCadastrodescramo: TStringField;
    QRCadastronome_pais: TStringField;
    QRCadastronome_regiao: TStringField;
    QRCadastrodesc_motivo: TStringField;
    QRCadastrodesc_estado_civil: TStringField;
    QRCadastroclass_cadastro: TStringField;
    QRCadastrobanco_agencia_cobranca: TStringField;
    QRCadastronome_operacao: TStringField;
    QRCadastrodesc_vendedor: TStringField;
    QRCadastrodesc_vendedor_preposto: TStringField;
    QRCadastroDESC_GARANTIAS: TStringField;
    QRCadastroNOME_AUTORIZADO1: TStringField;
    QRCadastroNOME_AUTORIZADO2: TStringField;
    QRCadastroNOME_AUTORIZADO3: TStringField;
    QRCadastroDESC_CPF_AUTORIZADO1: TStringField;
    QRCadastroDESC_CPF_AUTORIZADO2: TStringField;
    QRCadastroDESC_CPF_AUTORIZADO3: TStringField;
    QRCadastroBanco: TOracleDataSet1;
    QRCadastroBancoNOME: TStringField;
    QRCadastroBancoNUM_CGC_CPF: TStringField;
    QRCadastroBancoDESC_BANCO_AGENCIA: TStringField;
    QRCadastroBancoDESC_AGENCIA: TStringField;
    QRCadastroBancoDESC_CONTA_CORRENTE: TStringField;
    QRCadastroDESC_GARANTIAS_OUTRAS: TStringField;
    QRProprCadastroDESC_TIPO_PROPRIEDADE: TStringField;
    QRMalaDiretaMaioresCliente: TOracleDataSet1;
    QRMalaDiretaMaioresClienteCOD_CADASTRO: TIntegerField;
    QRMalaDiretaMaioresClienteNOME: TStringField;
    QRMalaDiretaMaioresClienteDESC_ENDERECO: TStringField;
    QRMalaDiretaMaioresClienteDESC_CIDADE: TStringField;
    QRMalaDiretaMaioresClienteCOD_ESTADO: TStringField;
    QRMalaDiretaMaioresClienteDESC_CEP: TStringField;
    QRMalaDiretaMaioresClienteNUM_CAIXA_POSTAL: TIntegerField;
    QRMalaDiretaMaioresClienteDESC_BAIRRO: TStringField;
    QRCadastroBancoCOD_BANCO: TIntegerField;
    QRCadastroBancoCOD_AGENCIA: TIntegerField;
    QRCadastroContatoDESC_BAIRRO: TStringField;
    QREtiquetaClienteCompra: TOracleDataSet1;
    QREtiquetaClienteCompraCOD_CADASTRO: TIntegerField;
    QREtiquetaClienteCompraNOME: TStringField;
    QREtiquetaClienteCompraDESC_ENDERECO: TStringField;
    QREtiquetaClienteCompraDESC_CIDADE: TStringField;
    QREtiquetaClienteCompraDESC_CEP: TStringField;
    QREtiquetaClienteCompraNUM_CGC_CPF: TStringField;
    QREtiquetaClienteCompraNUM_INSCRICAO: TStringField;
    QREtiquetaClienteCompraCOD_ESTADO: TStringField;
    QREtiquetaClienteCompraDESC_TELEFONE: TStringField;
    QREtiquetaClienteCompraDESC_CLASSIFICACAO: TStringField;
    QREtiqueta: TOracleDataSet1;
    QREtiquetaETIQUETA1: TStringField;
    QREtiquetaETIQUETA2: TStringField;
    QREtiquetaETIQUETA3: TStringField;
    QREtiquetaNOME1: TStringField;
    QREtiquetaNOME2: TStringField;
    QREtiquetaNOME3: TStringField;
    QREtiquetaENDERECO1: TStringField;
    QREtiquetaENDERECO2: TStringField;
    QREtiquetaENDERECO3: TStringField;
    QREtiquetaTELEFONE1: TStringField;
    QREtiquetaTELEFONE2: TStringField;
    QREtiquetaTELEFONE3: TStringField;
    QREtiquetaCEP1: TStringField;
    QREtiquetaCEP2: TStringField;
    QREtiquetaCEP3: TStringField;
    QREtiquetaCIDADE1: TStringField;
    QREtiquetaCIDADE2: TStringField;
    QREtiquetaCIDADE3: TStringField;
    QREtiquetaESTADO1: TStringField;
    QREtiquetaESTADO2: TStringField;
    QREtiquetaESTADO3: TStringField;
    QREtiquetaETIQUETA4: TStringField;
    QREtiquetaETIQUETA5: TStringField;
    QRCadastroEnvelopesDESC_COMPLEMENTO: TStringField;
    QRLimiteCadastro: TOracleDataSet1;
    QRLimiteCadastroCOD_CADASTRO: TIntegerField;
    QRLimiteCadastroNOME: TStringField;
    QRLimiteCadastroVAL_LIMITE: TFloatField;
    QRLimiteCadastroVAL_CR_ABERTO: TFloatField;
    QRLimiteCadastroVAL_PEDIDOS: TFloatField;
    QRLimiteCadastroVAL_CHEQUE: TFloatField;
    QRVendedor_Det: TOracleDataSet1;
    QRVendedor_DetCOD_VENDEDOR: TIntegerField;
    QRVendedor_DetNOME: TStringField;
    QRVendedor_DetPERC_DESCONTO_LIBERADO: TIntegerField;
    QRVendedor_DetPERC_DESCONTO_RESTRICAO: TIntegerField;
    QRVendedor_DetPERC_ACRESCIMO_MAXIMO: TIntegerField;
    QRVendedor_DetPERC_NOTA_FISCAL: TIntegerField;
    QREmailAniversariante: TOracleDataSet1;
    QREmailAniversarianteCOD_CADASTRO: TIntegerField;
    QREmailAniversarianteNOME: TStringField;
    QREmailAniversarianteDESC_E_MAIL: TStringField;
    QRMalaDireta_AniverCOD_CADASTRO: TIntegerField;
    QRMalaDireta_AniverCOD_ESTADO: TStringField;
    QRMalaDireta_AniverNOME: TStringField;
    QRMalaDireta_AniverDESC_TELEFONE: TStringField;
    QRMalaDireta_AniverDESC_ENDERECO: TStringField;
    QRMalaDireta_AniverDESC_CIDADE: TStringField;
    QRMalaDireta_AniverDESC_CEP: TStringField;
    QRMalaDireta_AniverNUM_CAIXA_POSTAL: TIntegerField;
    QRMalaDireta_AniverDT_NASCIMENTO: TDateTimeField;
    QRMalaDireta_AniverNOME_CONTATO: TStringField;
    QRMalaDireta_AniverDT_NASCIMENTO_CONTATO: TDateTimeField;
    QREtiquetaAniver: TOracleDataSet1;
    QEtiqueta: TOracleDataSet1;
    QEtiquetaETIQUETA1: TStringField;
    QEtiquetaETIQUETA2: TStringField;
    QEtiquetaETIQUETA3: TStringField;
    QEtiquetaETIQUETA4: TStringField;
    QEtiquetaETIQUETA5: TStringField;
    QREtiquetaAniverETIQUETA1: TStringField;
    QREtiquetaAniverETIQUETA2: TStringField;
    QREtiquetaAniverNOME1: TStringField;
    QREtiquetaAniverNOME2: TStringField;
    QREtiquetaAniverENDERECO1: TStringField;
    QREtiquetaAniverENDERECO2: TStringField;
    QREtiquetaAniverTELEFONE1: TStringField;
    QREtiquetaAniverTELEFONE2: TStringField;
    QREtiquetaAniverCEP1: TStringField;
    QREtiquetaAniverCEP2: TStringField;
    QREtiquetaAniverCIDADE1: TStringField;
    QREtiquetaAniverCIDADE2: TStringField;
    QREtiquetaAniverESTADO1: TStringField;
    QREtiquetaAniverESTADO2: TStringField;
    QREtiquetaAniverCX_POSTAL1: TIntegerField;
    QREtiquetaAniverCX_POSTAL2: TIntegerField;
    QRClienteDESC_FANTASIA: TStringField;
    QRCliente_FantasiaCOD_PRAZO_VENCIMENTO: TIntegerField;
    QRCadastroEstado: TOracleDataSet1;
    QRCadastroEstadoCODIGO: TIntegerField;
    QRCadastroEstadoCPF_CGC: TStringField;
    QRCadastroEstadoCLIENTE: TStringField;
    QRCadastroEstadoVENDEDOR: TStringField;
    QRProprCadastroIND_TIPO_IMOVEL: TStringField;
    QRLimiteCadastroDT_ALTERACAO: TDateTimeField;
    QRCadastroCOD_AVALISTA: TIntegerField;
    QRCadastronome_avalista: TStringField;
    QRCadastronum_inscricao_avalista: TStringField;
    QRCadastronum_cgc_cpf_avalista: TStringField;
    QRCadastroval_limite_avalista: TFloatField;
    QRCadastrocod_class_cadastro_avalista: TIntegerField;
    QRCadastroind_sexo_categoria_avalista: TStringField;
    QRCadastroind_fisica_juridica_avalista: TStringField;
    QRCadastrocod_estado_civil_avalista: TIntegerField;
    QRCadastrodesc_telefone_avalista: TStringField;
    QRCadastrodesc_fax_avalista: TStringField;
    QRCadastrodesc_celular_avalista: TStringField;
    QRCadastrodt_nascimento_avalista: TStringField;
    QRCadastrodt_cadastro_avalista: TStringField;
    QRCadastroind_tipo_imovel: TStringField;
    QRCadastroval_aluguel: TStringField;
    QRCadastroDESC_ESTADO: TStringField;
    QRClienteDESC_INSCRICAO_MUNICIPAL: TStringField;
    QRCadastroEnvelopesDESC_CIDADE: TStringField;
    QRCadastroEnvelopesDESC_ENDERECO: TStringField;
    QRCadastroEnvelopesDESC_CEP: TStringField;
    QRCliente_FantasiaDESC_E_MAIL: TStringField;
    QRAniversarianteDESC_CELULAR: TStringField;
    QRMalaDireta_AniverDESC_E_MAIL: TStringField;
    QRDestinosMalaDireta: TOracleDataSet1;
    QRDestinosMalaDiretaCOD_CADASTRO: TIntegerField;
    QRDestinosMalaDiretaNOME: TStringField;
    QRDestinosMalaDiretaDESC_E_MAIL: TStringField;
    QREtiquetaAssinantes: TOracleDataSet1;
    QREtiquetaAssinantesCOD_CADASTRO: TIntegerField;
    QREtiquetaAssinantesNOME: TStringField;
    QREtiquetaAssinantesDESC_ENDERECO: TStringField;
    QREtiquetaAssinantesCOD_CIDADE: TIntegerField;
    QREtiquetaAssinantesDESC_CIDADE: TStringField;
    QREtiquetaAssinantesDESC_CEP: TStringField;
    QREtiquetaAssinantesNOME_VENDEDOR: TStringField;
    QRClienteDT_VENCIMENTO_TABELA_PRECO: TDateTimeField;
    QRCliente_FantasiaDT_VENCIMENTO_TABELA_PRECO: TDateTimeField;
    QRCliente_FantasiaN_VENDEDOR: TStringField;
    procedure QRCadastroCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastro_Rel: TDMCadastro_Rel;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMCadastro_Rel.QRCadastroCalcFields(DataSet: TDataSet);
var wAux : String;
begin
  //Busca em lotes
  Buscador.Limpa;
  Buscador.Adiciona('DESC_TIPO_CADASTRO', 'TB_TIPO_CADASTRO',
      'COD_TIPO_CADASTRO = '+FloatToStr(QRCadastroCOD_TIPO_CADASTRO.Value));
  Buscador.Adiciona('DESC_RAMO', 'TB_RAMO',
      'COD_RAMO = '+FloatToStr(QRCadastroCOD_RAMO.Value));
  Buscador.Adiciona('DESC_PAIS', 'TB_PAIS',
      'COD_PAIS = '+FloatToStr(QRCadastroCOD_PAIS.Value));
  Buscador.Adiciona('DESC_REGIAO', 'TB_REGIAO',
      'COD_REGIAO = '+FloatToStr(QRCadastroCOD_REGIAO.Value));
  Buscador.Adiciona('DESC_MOTIVO', 'TB_MOTIVO',
      'COD_MOTIVO = '+FloatToStr(QRCadastroCOD_MOTIVO.Value));
  Buscador.Adiciona('DESC_ESTADO_CIVIL', 'TB_ESTADO_CIVIL',
      'COD_ESTADO_CIVIL = '+FloatToStr(QRCadastroCOD_ESTADO_CIVIL.Value));
  Buscador.Adiciona('DESC_CLASSIFICACAO', 'TB_CLASS_CADASTRO',
      'COD_CLASS_CADASTRO = '+FloatToStr(QRCadastroCOD_CLASS_CADASTRO.Value));
  Buscador.Adiciona('DESC_BANCO_AGENCIA', 'TB_BANCO_AGENCIA',
      'COD_BANCO_AGENCIA = '+FloatToStr(QRCadastroCOD_BANCO_AGENCIA.Value));
  Buscador.Adiciona('DESC_OPERACAO', 'TB_OPERACAO',
      'COD_OPERACAO = '+FloatToStr(QRCadastroCOD_OPERACAO_CC.Value));
  Buscador.Adiciona('NOME', 'TB_VENDEDOR',
      'COD_VENDEDOR = '+FloatToStr(QRCadastroCOD_VENDEDOR.Value));
  Buscador.Adiciona('NOME', 'TB_VENDEDOR',
      'COD_VENDEDOR = '+FloatToStr(QRCadastroCOD_VENDEDOR_PREPOSTO.Value));
  Buscador.Buscar; //Buscando no banco

  //Recebendo as buscas na ordem que foram adicionadas
  QRCadastronometipocadastro.Value := Buscador.Proximo;
  QRCadastrodescramo.Value := Buscador.Proximo;
  QRCadastronome_pais.Value := Buscador.Proximo;
  QRCadastronome_regiao.Value := Buscador.Proximo;
  QRCadastrodesc_motivo.Value := Buscador.Proximo;
  QRCadastrodesc_estado_civil.Value := Buscador.Proximo;
  QRCadastroclass_cadastro.Value := Buscador.Proximo;
  QRCadastrobanco_agencia_cobranca.Value := Buscador.Proximo;
  QRCadastronome_operacao.Value := Buscador.Proximo;
  QRCadastrodesc_vendedor.Value := Buscador.Proximo;
  QRCadastrodesc_vendedor_preposto.Value := Buscador.Proximo;

  //
  QRCadastroind_tipo_imovel.Value := DMOracle.FastSelect('IND_TIPO_IMOVEL','TB_PROPRIEDADE','COD_CADASTRO = ' + QRCadastroCOD_CADASTRO.Text);
  QRCadastroval_aluguel.Value    := DMOracle.FastSelect('VAL_PROPRIEDADE','TB_PROPRIEDADE','COD_CADASTRO = ' + QRCadastroCOD_CADASTRO.Text);
  //
  // Busca de Dados do Avalista - Djeison.
  if Trim(QRCadastroCOD_AVALISTA.AsString) <> '' then
  begin
    Buscador.Limpa;
    Buscador.Adiciona('NOME', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('NUM_INSCRICAO', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('NUM_CGC_CPF', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('DT_NASCIMENTO', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('DT_CADASTRO', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('VAL_LIMITE', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('COD_CLASS_CADASTRO', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('IND_SEXO_CATEGORIA', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('IND_FISICA_JURIDICA', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('COD_ESTADO_CIVIL', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('DESC_TELEFONE', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('DESC_FAX', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Adiciona('DESC_CELULAR', 'TB_CADASTRO',
        'COD_CADASTRO = '+FloatToStr(QRCadastroCOD_AVALISTA.Value));
    Buscador.Buscar;
    // Atribuição
    QRCadastronome_avalista.Value := Buscador.Proximo;
    QRCadastronum_inscricao_avalista.Value := Buscador.Proximo;
    QRCadastronum_cgc_cpf_avalista.Value := Buscador.Proximo;
    QRCadastrodt_nascimento_avalista.Value := Buscador.Proximo;
    QRCadastrodt_cadastro_avalista.Value := Buscador.Proximo;
    wAux := Buscador.Proximo;
    if Trim(wAux) <> '' then
      QRCadastroval_limite_avalista.Value := StrtoFloat(wAux);
    wAux := Buscador.Proximo;
    if Trim(wAux) <> '' then
      QRCadastrocod_class_cadastro_avalista.Value := StrToInt(wAux);
    QRCadastroind_sexo_categoria_avalista.Value := Buscador.Proximo;
    QRCadastroind_fisica_juridica_avalista.Value := Buscador.Proximo;
    wAux := Buscador.Proximo;
    if Trim(wAux) <> '' then
      QRCadastrocod_estado_civil_avalista.Value := StrToInt(wAux);
    QRCadastrodesc_telefone_avalista.Value := Buscador.Proximo;
    QRCadastrodesc_fax_avalista.Value := Buscador.Proximo;
    QRCadastrodesc_celular_avalista.Value := Buscador.Proximo;
  end;
end;

end.
