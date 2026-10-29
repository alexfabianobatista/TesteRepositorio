unit RodoOS;

interface

uses
  CteTypes;

type
  TPropOS = class(TCTeElement)
  protected
    FCPF: String;
    FCNPJ: String;
    FTAF: String;
    FNroRegEstadual: String;
    FXNome: String;
    FIE: String;
    FUF: String;
    FTpProp: Integer;
  published
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
    property TAF: String read FTAF write FTAF;
    property NroRegEstadual: String read FNroRegEstadual write FNroRegEstadual;
    property XNome: String read FXNome write FXNome;
    property IE: String read FIE write FIE;
    property UF: String read FUF write FUF;
    property TpProp: Integer read FTpProp write FTpProp;
  end;
  TVeicOS = class(TCTeElement)
  protected
    FPlaca: String;
    FRENAVAM: String;
    FProp: TPropOS;
    FUF: String;
  published
    property Placa: String read FPlaca write FPlaca;
    property RENAVAM: String read FRENAVAM write FRENAVAM;
    property Prop: TPropOS read FProp write FProp;
    property UF: String read FUF write FUF;
  end;
  TInfFretamento = class(TCTeElement)
  protected
    FTpFretamento: Integer;
    FDhViagem: String;
  published
    property TpFretamento: Integer read FTpFretamento write FTpFretamento;
    property DhViagem: String read FDhViagem write FDhViagem;
  end;

  TRodoOS = class(TCTeElement)
  protected
    FTAF: TCTeIntegerComZero;
    FNroRegEstadual: TCTeIntegerComZero;
    FVeic: TVeicOS;
    FInfFretamento: TInfFretamento;
  published
    property TAF: TCTeIntegerComZero read FTAF write FTAF;
    property NroRegEstadual: TCTeIntegerComZero read FNroRegEstadual write FNroRegEstadual;
    property Veic: TVeicOS read FVeic write FVeic;
    property InfFretamento: TInfFretamento read FInfFretamento write FInfFretamento;
  end;

implementation

end.
