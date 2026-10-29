unit UCadastroMySQL_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMCadastroMySQL = class(TDataModule)
    ZQCadastro: TZQuery;
    ZQCadastroTIPO: TStringField;
    ZQCadastroCLI_NOME: TStringField;
    ZQCadastroCLI_NOMEFANT: TStringField;
    ZQCadastroCLI_ENDERECO: TStringField;
    ZQCadastroCLI_BAIRRO: TStringField;
    ZQCadastroCLI_CEP: TStringField;
    ZQCadastroCLI_FONE: TStringField;
    ZQCadastroCLI_FAX: TStringField;
    ZQCadastroCLI_EMAIL: TStringField;
    ZQCadastroCLI_FISICAJURIDICA: TStringField;
    ZQCadastroCLI_CONSUMFINAL: TStringField;
    ZQCadastroCLI_LIMITECREDITO: TFloatField;
    ZQCadastroCLI_OBSERVACOES: TMemoField;
    ZQCadastroCLI_SITUACAO: TStringField;
    ZQCadastroCLI_DATACAD: TDateField;
    ZQCadastroCID_NOME: TStringField;
    ZQCadastroCID_ESTADO: TStringField;
    ZQCadastroCLI_COMPLEMENTO: TStringField;
    ZQCadastroCLI_ENDNUMERO: TStringField;
    ZQCadastroCLI_CODANP: TStringField;
    ZQCadastroINSCEST: TStringField;
    ZQCadastroCPF: TStringField;
    ZQCadastroRG: TStringField;
    ZQCadastroCLI_DDD: TStringField;
    ZQCadastroCLI_FAXDDD: TStringField;
    ZQCadastroCLI_CODIGO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastroMySQL: TDMCadastroMySQL;

implementation

uses UMySQL_cl;

{$R *.dfm}

end.
