unit UNotaAutomaticaFlag;

interface

type
  TNotaAutomaticaFlag = class

  private
    wNotaAutomatica: boolean;
  public
    constructor Create; overload;
    property pNotaAutomatica: boolean Read wNotaAutomatica write wNotaAutomatica;

  end;

var NotaAutomaticaFlag: TNotaAutomaticaFlag;

implementation

{ NotaAutomaticaFlag }

constructor TNotaAutomaticaFlag.Create;
begin
  pNotaAutomatica := false;
end;

end.
