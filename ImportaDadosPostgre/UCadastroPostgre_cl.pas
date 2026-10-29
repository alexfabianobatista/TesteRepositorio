unit UCadastroPostgre_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMCadastroPostgre = class(TDataModule)
    ZQCadastro: TZQuery;
    ZQCidadeCons: TZQuery;
    ZQCidadeConscod_cidade: TIntegerField;
    ZQCidadeConsdesc_cidade: TStringField;
    ZQCidadeConscod_estado: TStringField;
    ZQCidadeConscod_cidade_ibge: TStringField;
    ZQCadastrocod_cadastro: TFloatField;
    ZQCadastronome: TStringField;
    ZQCadastrodesc_endereco: TMemoField;
    ZQCadastrocod_tipo_cadastro: TIntegerField;
    ZQCadastrodesc_telefone: TStringField;
    ZQCadastrodesc_celular: TStringField;
    ZQCadastrodesc_fax: TStringField;
    ZQCadastroind_fisica_juridica: TMemoField;
    ZQCadastrodesc_cep: TStringField;
    ZQCadastronum_cgc_cpf: TStringField;
    ZQCadastronum_inscricao: TStringField;
    ZQCadastrodesc_endereco_cobranca: TMemoField;
    ZQCadastrodesc_cep_cobranca: TMemoField;
    ZQCadastrodesc_bairro: TStringField;
    ZQCadastrodesc_fax_cobranca: TMemoField;
    ZQCadastronum_caixa_postal: TMemoField;
    ZQCadastronome_contato: TStringField;
    ZQCadastrodt_cadastro: TDateField;
    ZQCadastrodesc_email1: TStringField;
    ZQCadastrodesc_fantasia: TStringField;
    ZQCadastrodesc_bairro_cobranca: TMemoField;
    ZQCadastronascimento: TDateField;
    ZQCadastrodcadastro: TDateField;
    ZQCadastrodesc_email: TStringField;
    ZQCadastrodesc_cidade: TStringField;
    ZQCadastrocod_estado: TStringField;
    ZQCadastroSeta: TZQuery;
    ZQCadastroSetacod_cadastro: TStringField;
    ZQCadastroSetanome: TStringField;
    ZQCadastroSetadesc_fantasia: TMemoField;
    ZQCadastroSetaind_fisica_jurida: TFloatField;
    ZQCadastroSetaendereco: TMemoField;
    ZQCadastroSetabairro: TMemoField;
    ZQCadastroSetacidade: TMemoField;
    ZQCadastroSetadesc_empresa: TMemoField;
    ZQCadastroSetacod_estado: TStringField;
    ZQCadastroSetanum_caixa_postal: TStringField;
    ZQCadastroSetadesc_telefone: TStringField;
    ZQCadastroSetadesc_comercial: TStringField;
    ZQCadastroSetadesc_celular: TStringField;
    ZQCadastroSetanum_cgc_cpf: TStringField;
    ZQCadastroSetanum_inscricao: TStringField;
    ZQCadastroSetanome_pai: TMemoField;
    ZQCadastroSetanome_mae: TMemoField;
    ZQCadastroSetadesc_e_mail: TMemoField;
    ZQCadastroSetadesc_obs1: TMemoField;
    ZQCadastroSetanome_contato: TMemoField;
    ZQCadastroSetaestado_civil: TMemoField;
    ZQCadastroSetanome_conjuge: TMemoField;
    ZQCadastroSetastatus: TMemoField;
    ZQCadastroSetaind_sexo_categoria: TStringField;
    ZQCadastroSetadesc_ref_comercial1: TMemoField;
    ZQCadastroSetadesc_ref_comercial2: TMemoField;
    ZQCadastroSetadt_cadastro: TDateField;
    ZQCadastroSetadt_alteracao: TDateField;
    ZQCadastroSetadt_nascimento: TDateField;
    ZQCadastroSetadesc_cep: TStringField;
    ZQCadastroSetadesc_complemento: TMemoField;
    ZQCadastroSetatipo_cadastro: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCadastroPostgre: TDMCadastroPostgre;

implementation

uses UPostgre_cl;

{$R *.dfm}

end.
