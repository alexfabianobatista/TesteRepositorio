unit UBloco0_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmBloco0 = class(TDataModule)
    QReg000: TOracleDataSet1;
    QReg000IND_ESC_CONS: TStringField;
    QReg002: TOracleDataSet1;
    QReg002COD_CLASSIFICACAO_CONTRIB_IPI: TStringField;
    QReg005: TOracleDataSet1;
    QReg005DESC_FILIAL: TStringField;
    QReg005DESC_CEP: TStringField;
    QReg005DESC_ENDERECO: TStringField;
    QReg005NUM_ENDERECO: TIntegerField;
    QReg005DESC_COMPLEMENTO_ENDERECO: TStringField;
    QReg005DESC_BAIRRO: TStringField;
    QReg005NUM_CAIXA_POSTAL: TIntegerField;
    QReg005DESC_TELEFONE: TStringField;
    QReg005DESC_FAX: TStringField;
    QReg005DESC_E_MAIL: TStringField;
    QReg100: TOracleDataSet1;
    QReg200: TOracleDataSet1;
    QReg150: TOracleDataSet1;
    QReg190: TOracleDataSet1;
    QReg190DESC_UNIDADE: TStringField;
    QReg400: TOracleDataSet1;
    QReg450: TOracleDataSet1;
    QReg000DESC_FILIAL: TStringField;
    QReg000NUM_CGC: TStringField;
    QReg000DESC_NIT: TStringField;
    QReg000DESC_SIGLA_ESTADO: TStringField;
    QReg000DESC_INSCRICAO: TStringField;
    QReg000DESC_INSCRICAO_MUNICIPAL: TStringField;
    QReg000DESC_SUFRAMA: TStringField;
    QReg100NOME: TStringField;
    QReg100DESC_CPF: TStringField;
    QReg100DESC_CNPJ: TStringField;
    QReg100DESC_CRC: TStringField;
    QReg100DESC_CEP: TStringField;
    QReg100DESC_ENDERECO: TStringField;
    QReg100DESC_COMPLEMENTO: TStringField;
    QReg100DESC_BAIRRO: TStringField;
    QReg100DESC_TELEFONE: TStringField;
    QReg100DESC_FAX: TStringField;
    QReg100DESC_E_MAIL: TStringField;
    QReg460: TOracleDataSet1;
    QReg007: TOracleDataSet1;
    QReg007COD_ENTIDADE_CONTABIL: TStringField;
    QReg020: TOracleDataSet1;
    QReg020IND_DESC: TStringField;
    QReg020NUM_CGC: TStringField;
    QReg020DESC_SIGLA_ESTADO: TStringField;
    QReg020DESC_INSCRICAO: TStringField;
    QReg020COD_CIDADE_IBGE: TStringField;
    QReg020DESC_INSCRICAO_MUNICIPAL: TStringField;
    QReg020NUM_NIRE: TStringField;
    QReg150COD_CADASTRO: TFloatField;
    QReg150NOME: TStringField;
    QReg150COD_PAIS_IBGE: TFloatField;
    QReg150DESC_CNPJ: TStringField;
    QReg150DESC_CPF: TStringField;
    QReg150NUM_INSCRICAO: TStringField;
    QReg150DESC_SUFRAMA: TStringField;
    QReg150DESC_ENDERECO: TStringField;
    QReg150DESC_COMPLEMENTO: TStringField;
    QReg150DESC_BAIRRO: TStringField;
    QReg150DESC_SIGLA_ESTADO: TStringField;
    QReg150DESC_INSCRICAO_MUNICIPAL: TStringField;
    QReg400COD_OPERACAO: TFloatField;
    QReg400DESC_OPERACAO: TStringField;
    QReg460DESC_MENSAGEM: TStringField;
    QReg200COD_PRODUTO: TFloatField;
    QReg200DESC_PRODUTO: TStringField;
    QReg200NUM_FABRICANTE: TStringField;
    QReg200DESC_UNIDADE: TStringField;
    QReg200PERC_ALIQUOTA: TFloatField;
    QReg200COD_GENERO_PRODUTO: TFloatField;
    QReg200COD_EX_TIPI: TStringField;
    QReg200NUM_GENERO_NCM: TStringField;
    QReg200COD_LISTA_SERVICO: TFloatField;
    QReg150IND_FISICA_JURIDICA: TStringField;
    QReg000COD_CIDADE_IBGE: TStringField;
    QReg000COD_UF_IBGE: TFloatField;
    QReg100COD_CIDADE_IBGE: TStringField;
    QReg100COD_UF_IBGE: TFloatField;
    QReg150COD_UF_IBGE: TFloatField;
    QReg150COD_CIDADE_IBGE: TStringField;
    QReg450COD_MENSAGEM: TFloatField;
    QReg450DESC_MENSAGEM: TStringField;
    QReg200COD_TIPO_PRODUTO: TStringField;
    QReg007DESC_INSCRICAO: TStringField;
    QReg000IND_PERFIL_SPED: TStringField;
    QReg000IND_TIPO_ATIVIDADE: TStringField;
    QReg000IND_NIRE: TFloatField;
    QReg000IND_FIN_ESC: TFloatField;
    QReg000COD_HASH_SUB: TStringField;
    QReg000NIRE_SUBST: TStringField;
    QReg000IND_SIT_ESP: TStringField;
    QReg000IND_GRANDE_PORTE: TFloatField;
    QReg000TIP_ECD: TFloatField;
    QReg000COD_SCP: TStringField;
    QReg000IDENT_MF: TStringField;
    QReg460COD_OBS: TIntegerField;
    QReg210: TOracleDataSet1;
    QReg210COD_ITEM_COMP: TIntegerField;
    QReg210QTD_COMP: TFloatField;
    QReg210PERDA: TFloatField;
    QReg200COD_CEST: TStringField;
    QReg000IND_CENTRALIZADA: TStringField;
    QReg000IND_MUDANC_PC: TStringField;
    QReg000DESC_CNAE: TStringField;
    QReg000IND_VALORES_AGREGADOS: TStringField;
    QReg000DT_INVENTARIO: TDateTimeField;
    QReg221: TOracleDataSet1;
    QReg221COD_PRODUTO: TFloatField;
    QReg221COD_PRODUTO_BAIXA: TIntegerField;
    QReg221DESC_UNIDADE: TStringField;
    QReg221QT_BAIXA: TFloatField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBloco0: TDmBloco0;

implementation


uses UOracle_cl;

{$R *.dfm}

end.
