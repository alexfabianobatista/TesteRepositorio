unit InfCteAnu;

interface

uses
  CteTypes;
type
  TInfCteAnu = class(TCTeElement)
  protected
    FChCte: String;
    FDEmi: String;
  published
    property ChCte: String read FChCte write FChCte;
    property DEmi: String read FDEmi write FDEmi;
  end;
implementation

end.
 