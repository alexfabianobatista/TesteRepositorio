unit ValePed;

interface

uses
  CteTypes;

type
  TValePed = class(TCTeElement)
  protected
    FCNPJForn: String;
    FNCompra: String;
    FCNPJPg: String;
  published
    property CNPJForn: String read FCNPJForn write FCNPJForn;
    property NCompra: String read FNCompra write FNCompra;
    property CNPJPg: String read FCNPJPg write FCNPJPg;
  end;

implementation

end.
