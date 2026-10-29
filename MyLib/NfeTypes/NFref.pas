unit NFref;

interface

uses
  NfeTypes;

type
  TRefNF = class(TNFeElement)
  private
  protected
    FAAMM: String;
    FCNPJ: String;
    FCUF: Integer;
    FMod: TNFeIntegerComZero;
    FNNf: Integer;
    FSerie: Integer;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CUF: Integer read FCUF write FCUF;
    property AAMM: String read FAAMM write FAAMM;
    property CNPJ: String read FCNPJ write FCNPJ;
    property Mod_: TNFeIntegerComZero read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property NNF: Integer read FNNf write FNNf;
  end;

  TRefNFP = class(TNFeElementNoEmptys)
  private
  protected
    FAAMM: String;
    FCNPJ: String;
    FCPF: String;
    FCUF: Integer;
    FIE: String;
    FMod: TNFeIntegerComZero;
    FNNf: Integer;
    FSerie: Integer;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CUF: Integer read FCUF write FCUF;
    property AAMM: String read FAAMM write FAAMM;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property IE: String read FIE write FIE;
    property Mod_: TNFeIntegerComZero read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property NNF: Integer read FNNf write FNNf;
  end;

  TRefECF = class(TNFeElement)
  private
  protected
    FMod: String;
    FNCOO: Integer;
    FNECF: Integer;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Mod_: String read FMod write FMod;
    property NECF: Integer read FNECF write FNECF;
    property NCOO: Integer read FNCOO write FNCOO;
  end;

  TNFref = class(TNFeElementNoEmptys)
  private
  protected
    FRefNFe: String;
    FRefNF: TRefNF;
    FRefNFP: TRefNFP;
    FRefCTe: String;
    FRefECF: TRefECF;
  public
    constructor Create(RefNFe: String);
  published
    property RefNFe: String read FRefNFe;
    property RefNF: TRefNF read FRefNF write FRefNF;
    property RefNFP: TRefNFP read FRefNFP write FRefNFP;
    property RefCTe: String read FRefCTe write FRefCTe;
    property RefECF: TRefECF read FRefECF write FRefECF;
  end;
implementation

{ TRefNfe }

{constructor TRefNfe.Create(Id: String);
begin
  FId := Id;
end; }

{ TRefNf }

constructor TNFref.Create(RefNFe:String);
begin
  FRefNFe := RefNFe;
end;

end.
