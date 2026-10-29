unit EnderecoNfse;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TEnderecoExt = class(TNFSeElement)
  private
  protected
    FCPais: Integer;
    FCEndPost: String;
    FXCidade: String;
    FXExtProvReg: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
	  property CPais: Integer read FCPais write FCPais;
    property CEndPost: String read FCEndPost write FCEndPost;
    property XCidade: String read FXCidade write FXCidade;
    property XExtProvReg: String read FXExtProvReg write FXExtProvReg;
  end;

  TEndereco = class(TNFSeElement)
  private
  protected
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCodigoMunicipio: String;
    FCidadeNome: String;
    FUf: String;
    FCep: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Endereco: String read FEndereco write FEndereco;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property CodigoMunicipio: String read FCodigoMunicipio write FCodigoMunicipio;
    property CidadeNome: String read FCidadeNome write FCidadeNome;
    property Uf: String read FUf write FUf;
    property Cep: String read FCep write FCep;
  end;
implementation

{function TEndereco.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end; }

end.
