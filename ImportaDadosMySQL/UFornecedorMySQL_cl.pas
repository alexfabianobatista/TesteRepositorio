unit UFornecedorMySQL_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMFornecedorMySql = class(TDataModule)
    ZQFornecedor: TZQuery;
    ZQFornecedorTIPO: TStringField;
    ZQFornecedorFOR_RAZAOSOCIAL: TStringField;
    ZQFornecedorFOR_NOMEFANT: TStringField;
    ZQFornecedorFOR_ENDERECO: TStringField;
    ZQFornecedorFOR_BAIRRO: TStringField;
    ZQFornecedorFOR_CEP: TStringField;
    ZQFornecedorFOR_FONE: TStringField;
    ZQFornecedorFOR_FONEDDD: TStringField;
    ZQFornecedorFOR_FAXDDD: TStringField;
    ZQFornecedorFOR_FAX: TStringField;
    ZQFornecedorFOR_EMAIL: TStringField;
    ZQFornecedorFOR_CAIXAPOSTAL: TStringField;
    ZQFornecedorFISICAJURIDICA: TStringField;
    ZQFornecedorCONSUMFINAL: TStringField;
    ZQFornecedorLIMITECREDITO: TLargeintField;
    ZQFornecedorFOR_OBSERVACAO: TMemoField;
    ZQFornecedorFOR_SITUACAO: TStringField;
    ZQFornecedorFOR_DATACAD: TDateField;
    ZQFornecedorCID_NOME: TStringField;
    ZQFornecedorCID_ESTADO: TStringField;
    ZQFornecedorFOR_COMPLEMENTO: TStringField;
    ZQFornecedorFOR_ENDNUMERO: TStringField;
    ZQFornecedorFOR_CODANP: TStringField;
    ZQFornecedorFOR_INSCEST: TStringField;
    ZQFornecedorCNPJ: TStringField;
    ZQFornecedorFOR_RG: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFornecedorMySql: TDMFornecedorMySql;

implementation

uses UMySQL_cl;

{$R *.dfm}

end.
