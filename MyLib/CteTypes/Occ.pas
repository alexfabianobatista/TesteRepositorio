unit Occ;

interface

uses
  CteTypes;

type
  TEmiOcc = class(TCTeElement)
  protected
    FCNPJ: String;
    FCInt: String;
    FIE: String;
    FUF: String;
    FFone: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CInt: String read FCInt write FCInt;
    property IE: String read FIE write FIE;
    property UF: String read FUF write FUF;
    property Fone: String read FFone write FFone;
  end;
  TOcc = class(TCTeElement)
  protected
    FSerie: String;
    FNOcc: Integer;
    FDEmi: TCTeData;
    FEmiOcc: TEmiOcc;
  published
    property Serie: String read FSerie write FSerie;
    property NOcc: Integer read FNOcc write FNOcc;
    property DEmi: TCTeData read FDEmi write FDEmi;
    property EmiOcc: TEmiOcc read FEmiOcc write FEmiOcc;
  end;

implementation

end.
 