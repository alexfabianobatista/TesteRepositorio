unit IdentificacaoTomador;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TCpfCnpj = class(TNFSeElementNoEmptys)
  private
  protected
    FCpf: String;
    FCnpj: String;
  public
  published
    property Cpf: String read FCpf write FCpf;
    property Cnpj: String read FCnpj write FCnpj;
  end;

  TIdentificacaoTomador = class(TNFSeElementNoEmptys)
  private
  protected
    FCpfCnpj: TCpfCnpj;
    FInscricaoMunicipal: String;
  public
//    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CpfCnpj: TCpfCnpj read FCpfCnpj write FCpfCnpj;
    property InscricaoMunicipal: String read FInscricaoMunicipal write FInscricaoMunicipal;
  end;
implementation

//function TIdentificacaoTomador.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
//begin
//  if Prop.Name = 'CpfCnpj' then
//    Result := True
//  else
//    Result := inherited IsTagEvenEmpty(Prop);
//end;
end.
