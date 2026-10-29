unit ConstrucaoCivil;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TConstrucaoCivil = class(TNFSeElementNoEmptys)
  private
  protected
    FCodigoObra: String;
    FArt: String;
    FIncorporacao: Integer;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CodigoObra: String read FCodigoObra write FCodigoObra;
    property Art: String read FArt write FArt;
    property Incorporacao: Integer read FIncorporacao write FIncorporacao;
  end;
implementation

{function TConstrucaoCivil.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}

end.
