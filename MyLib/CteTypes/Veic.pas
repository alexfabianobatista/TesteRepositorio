unit Veic;

interface

uses
  CteTypes;

type
  TProp = class(TCTeElement)
  protected
    FCPF: String;
    FCNPJ: String;
    FRNTRC: String;
    FXNome: String;
    FIE: String;
    FUF: String;
    FTpProp: Integer;
  published
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
    property RNTRC: String read FRNTRC write FRNTRC;
    property XNome: String read FXNome write FXNome;
    property IE: String read FIE write FIE;
    property UF: String read FUF write FUF;
    property TpProp: Integer read FTpProp write FTpProp;
  end;
  TVeic = class(TCTeElement)
  protected
    FCInt: String;
    FRENAVAM: String;
    FPlaca: String;
    FTara: Integer;
    FCapKG: Integer;
    FCapM3: Integer;
    FTpProp: String;
    FTpVeic: Integer;
    FTpRod: TCTeIntegerComZero;
    FTpCar: TCTeIntegerComZero;
    FUF: String;
  published
    property CInt: String read FCInt write FCInt;
    property RENAVAM: String read FRENAVAM write FRENAVAM;
    property Placa: String read FPlaca write FPlaca;
    property Tara: Integer read FTara write FTara;
    property CapKG: Integer read FCapKG write FCapKG;
    property CapM3: Integer read FCapM3 write FCapM3;
    property TpProp: String read FTpProp write FTpProp;
    property TpVeic: Integer read FTpVeic write FTpVeic;
    property TpRod: TCTeIntegerComZero read FTpRod write FTpRod;
    property TpCar: TCTeIntegerComZero read FTpCar write FTpCar;
    property UF: String read FUF write FUF;
  end;

implementation

end.
 