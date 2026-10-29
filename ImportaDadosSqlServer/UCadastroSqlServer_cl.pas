unit UCadastroSqlServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMCadastroSqlServer = class(TDataModule)
    SSQCadastro: TADOQuery;
    SSQCadastroCOD_CADASTRO: TIntegerField;
    SSQCadastroTIPO_CADASTRO: TStringField;
    SSQCadastroNome: TStringField;
    SSQCadastroDESC_ENDERECO: TStringField;
    SSQCadastroCOD_ESTADO: TStringField;
    SSQCadastroDESC_BAIRRO: TStringField;
    SSQCadastroDESC_CIDADE: TStringField;
    SSQCadastroDESC_CEP: TStringField;
    SSQCadastroNUM_CPF: TStringField;
    SSQCadastroNUM_CGC_CPF: TStringField;
    SSQCadastroNUM_INSCRICAO: TStringField;
    SSQCadastroDESC_TELEFONE: TStringField;
    SSQCadastroDESC_CELULAR: TStringField;
    SSQCadastroDESC_E_MAIL: TStringField;
    SSQCadastroDT_CADASTRO: TDateTimeField;
    SSQCadastroDT_NASCIMENTO: TDateTimeField;
    SSQCadastroFantasia: TStringField;
    SSQForn: TADOQuery;
    SSQFornCOD_CADASTRO: TIntegerField;
    SSQFornTIPO_CADASTRO: TStringField;
    SSQFornNOME: TStringField;
    SSQFornDESC_FANTASIA: TStringField;
    SSQFornDESC_ENDERECO: TStringField;
    SSQFornDESC_BAIRRO: TStringField;
    SSQFornCOD_CIDADE: TStringField;
    SSQFornDESC_CIDADE: TStringField;
    SSQFornCOD_ESTADO: TStringField;
    SSQFornDESC_CEP: TStringField;
    SSQFornNUM_CGC_CPF: TStringField;
    SSQFornNUM_CPF: TStringField;
    SSQFornNUM_INSCRICAO: TStringField;
    SSQFornNUM_RG: TStringField;
    SSQFornDESC_TELEFONE: TStringField;
    SSQFornDESC_FAX: TStringField;
    SSQFornDESC_E_MAIL: TStringField;
    SSQFornDESC_OBSERVACAO: TStringField;
    SSQFornDESC_CONTATO: TStringField;
    SSQFornDT_CADASTRO: TDateTimeField;
    SSQFornObs_for: TMemoField;
    SSQFornDESC_CELULAR: TStringField;
    SSQCadastroNUM_RG: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastroSqlServer: TDMCadastroSqlServer;

implementation

{$R *.dfm}

end.
