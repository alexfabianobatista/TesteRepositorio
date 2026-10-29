unit Contato;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TContato = class(TNFSeElementNoEmptys)
  private
  protected
    FTelefone: String;
    FEmail: String;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Telefone: String read FTelefone write FTelefone;
    property Email: String read FEmail write FEmail;
  end;
implementation

{function TContato.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}

end.
