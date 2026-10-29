unit Tomador;

interface

uses
  Local, TypInfo, NfseTypes, IdentificacaoTomador, EnderecoNfse, Contato;

type
  TTomador = class(TNFSeElementNoEmptys)
  private
  protected
    FIdentificacaoTomador: TIdentificacaoTomador;
    FRazaoSocial: String;
    FNifTomador: String;
    FNaoNifTomador: Integer;
    FEndereco: TEndereco;
    FContato: TContato;
    FInscricaoEstadual: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property IdentificacaoTomador: TIdentificacaoTomador read FIdentificacaoTomador write FIdentificacaoTomador;
    property NifTomador: String read FNifTomador write FNifTomador;
    property NaoNifTomador: Integer read FNaoNifTomador write FNaoNifTomador;
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property Contato: TContato read FContato write FContato;
    property InscricaoEstadual: String read FInscricaoEstadual write FInscricaoEstadual;
  end;
implementation

{function TTomador.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end; }

end.
