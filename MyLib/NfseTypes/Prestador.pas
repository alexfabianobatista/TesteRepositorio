unit Prestador;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TPrestador = class(TNFSeElement)
  private
  protected
    FCnpj: String;
    FInscricaoMunicipal: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Cnpj: String read FCnpj write FCnpj;
    property InscricaoMunicipal: String read FInscricaoMunicipal write FInscricaoMunicipal;
  end;
implementation

{function TPrestador.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}
end.
