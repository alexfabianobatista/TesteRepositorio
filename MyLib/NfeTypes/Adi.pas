unit Adi;

interface

uses NfeTypes;

type

  TAdi = class(TNFeElement)
  private
  protected
    FNAdicao: Integer;
    FNSeqAdic: Integer;
    FCFabricante: String;
    FVDescDI: Double;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property NAdicao: Integer read FNAdicao write FNAdicao;
    property NSeqAdic: Integer read FNSeqAdic write FNSeqAdic;
    property CFabricante: String read FCFabricante write FCFabricante;
    property VDescDI: Double read FVDescDI write FVDescDI;
  end;

implementation

end.
 