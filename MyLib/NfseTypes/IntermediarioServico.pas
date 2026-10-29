unit IntermediarioServico;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TIntermediarioServico = class(TNFSeElement)
  private
  protected
    FRazaoSocial: String;
    FCpfCnpj: String;
    FInscricaoMunicipal: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    property InscricaoMunicipal: String read FInscricaoMunicipal write FInscricaoMunicipal;
  end;
implementation

{function TIntermediarioServico.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}
end.
