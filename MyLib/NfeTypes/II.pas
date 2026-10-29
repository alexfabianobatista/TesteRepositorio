unit II;

interface

uses
  NFeTypes;

type
  TII = class (TNFeElement)
  private
    FvBC: Extended;
    FvDespAdu: Extended;
    FvII: Extended;
    FvIOF: Extended;
  protected
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property vBC: Extended read FvBC write FvBC;
    property vDespAdu: Extended read FvDespAdu write FvDespAdu;
    property vII: Extended read FvII write FvII;
    property vIOF: Extended read FvIOF write FvIOF;
  end;

implementation

end.
