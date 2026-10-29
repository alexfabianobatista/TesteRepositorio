unit UValida_cl;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, OracleData, OraTeste;

type
  TDmValida = class(TDataModule)
    QCadastro: TOracleDataSet1;
    QCadastroNUM_CGC_CPF: TStringField;
    QCadastroIND_FISICA_JURIDICA: TStringField;
    QCadastroDESC_CNPJ: TStringField;
    QCadastroDESC_CPF: TStringField;
    QCadastroNUM_INSCRICAO: TStringField;
    QCadastroCOD_CADASTRO: TIntegerField;
    QCadastroNOME: TStringField;
    QCadastroDESC_SIGLA_ESTADO: TStringField;
    QCadastroIND_ERRO: TStringField;
    QCadastroDESC_MENSAGEM_ERRO: TStringField;
    QCadastroIND_ALTERADO: TStringField;
    DsPCadastro: TDataSetProvider;
    CdCadastro: TClientDataSet;
    CdCadastroNUM_CGC_CPF: TStringField;
    CdCadastroIND_FISICA_JURIDICA: TStringField;
    CdCadastroDESC_CNPJ: TStringField;
    CdCadastroDESC_CPF: TStringField;
    CdCadastroNUM_INSCRICAO: TStringField;
    CdCadastroCOD_CADASTRO: TIntegerField;
    CdCadastroNOME: TStringField;
    CdCadastroDESC_SIGLA_ESTADO: TStringField;
    CdCadastroIND_ERRO: TStringField;
    CdCadastroDESC_MENSAGEM_ERRO: TStringField;
    CdCadastroIND_ALTERADO: TStringField;
    CdCadastrototal_registros: TAggregateField;
    QConsEstado: TOracleDataSet1;
    QConsEstadoDESC_SIGLA_ESTADO: TStringField;
    QConsEstadodesc_mascara: TStringField;
    QCadastroIND_ERRO_CPF: TStringField;
    QCadastroIND_ERRO_CNPJ: TStringField;
    QCadastroIND_ERRO_IE: TStringField;
    CdCadastroIND_ERRO_CPF: TStringField;
    CdCadastroIND_ERRO_CNPJ: TStringField;
    CdCadastroIND_ERRO_IE: TStringField;
    QCadastroDESC_CPF_NUMEROS: TStringField;
    QCadastroDESC_CNPJ_NUMEROS: TStringField;
    CdCadastroDESC_CPF_NUMEROS: TStringField;
    CdCadastroDESC_CNPJ_NUMEROS: TStringField;
    QCadastroNUM_INSCRICAO_NUMEROS: TStringField;
    CdCadastroNUM_INSCRICAO_NUMEROS: TStringField;
    QCadastroIND_ERRO_TELEFONE: TStringField;
    QCadastroDESC_TELEFONE: TStringField;
    QCadastroDESC_TELEFONE_NUMEROS: TStringField;
    CdCadastroIND_ERRO_TELEFONE: TStringField;
    CdCadastroDESC_TELEFONE: TStringField;
    CdCadastroDESC_TELEFONE_NUMEROS: TStringField;
    QNotas: TOracleDataSet1;
    QNotasCOD_NOTA_CAB: TIntegerField;
    QNotasNUM_NOTA: TIntegerField;
    QNotasDESC_FILIAL: TStringField;
    QNotasCOD_SERIE: TStringField;
    QNotasDESC_CHAVE_ACESSO: TStringField;
    QCadastroDESC_INSCRICAO_MUNICIPAL: TStringField;
    CdCadastroDESC_INSCRICAO_MUNICIPAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmValida: TDmValida;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
