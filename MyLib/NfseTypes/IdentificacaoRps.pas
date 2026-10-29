unit IdentificacaoRps;

interface

uses
  Local, TypInfo,NfseTypes;

type
  TIdentificacaoRps = class(TNFSeElementNoEmptys)
  private
  protected
    FNumero: Integer;
    FSerie: Integer;
    FTipo: Integer;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Numero: Integer read FNumero write FNumero;
    property Serie: Integer read FSerie write FSerie;
    property Tipo: Integer read FTipo write FTipo;
  end;

implementation

{function TIdentificacaoRps.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end; }

end.
