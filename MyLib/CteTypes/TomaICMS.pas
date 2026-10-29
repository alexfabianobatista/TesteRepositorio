unit TomaICMS;

interface

uses
  CteTypes;

type
  TRefNF = class(TCTeElement)
  protected
    FCNPJ: String;
    FCPF: String;
    FMod: String;
    FSerie: Integer;
    FSubserie: Integer;
    FNro: Integer;
    FValor: TCTeFloat2;
    FDEmi: TCTeData;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property Mod_: String read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property Subserie: Integer read FSubserie write FSubserie;
    property Nro: Integer read FNro write FNro;
    property Valor: TCTeFloat2 read FValor write FValor;
    property DEmi: TCTeData read FDEmi write FDEmi;
  end;
  TTomaICMS = class(TCTeElement)
  protected
    FRefNFe: String;
    FRefNF: TRefNF;
    FRefCte: String;
  published
    property RefNFe: String read FRefNFe write FRefNFe;
    property RefNF: TRefNF read FRefNF write FRefNF;
    property RefCte: String read FRefCte write FRefCte;
  end;
  TTomaNaoICMS = class(TCTeElement)
  protected
    FRefCteAnu: String;
  published
    property RefCteAnu: String read FRefCteAnu write FRefCteAnu;
  end;
implementation

end.
 