unit UVendedorFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMVendedorFirebird = class(TDataModule)
    ZQVendedorRetifoz: TZQuery;
    ZQVendedorRetifozCOD_VENDEDOR: TIntegerField;
    ZQVendedorRetifozNOME: TStringField;
    ZQVendedorRetifozDESC_ENDERECO: TStringField;
    ZQVendedorRetifozDESC_BAIRRO: TStringField;
    ZQVendedorRetifozDESC_CPF: TStringField;
    ZQVendedorRetifozDESC_IDENTIDADE: TStringField;
    ZQVendedorRetifozDT_NASCIMENTO: TDateField;
    ZQVendedorRetifozDESC_EMAIL: TStringField;
    ZQVendedorRetifozIND_SITUACAO: TStringField;
    ZQVendedorRetifozDT_CADASTRO: TDateField;
    ZQVendedorRetifozDESC_CEP: TStringField;
    ZQVendedorRetifozDESC_CIDADE: TStringField;
    ZQVendedorRetifozCOD_ESTADO: TStringField;
    ZQVendedorFoneRetifoz: TZQuery;
    ZQVendedorFoneRetifozCOD_VENDEDOR: TIntegerField;
    ZQVendedorFoneRetifozDESC_FONE: TStringField;
    ZQVendedorFoneRetifozDESC_TIPO_FONE: TStringField;
    ZQVendedorFoneRetifozNOME_CONTATO1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendedorFirebird: TDMVendedorFirebird;

implementation
uses UFirebird_cl;

{$R *.dfm}

end.
