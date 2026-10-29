unit EventoCTe;

interface

uses
  CteTypes, CteVersao, Rodo, TypInfo;

type
  TEventoCTe = class;
  TEvCancCTe = class(TCTeElementNoEmptys)
  private
  protected
    FDescEvento: String;
    FNProt: String;
    FXJust: String;
  published
    property DescEvento: String read FDescEvento write FDescEvento;
    property NProt: String read FNProt write FNProt;
    property XJust: String read FXJust write FXJust;
  end;

  TInfCorrecao = class(TCTeElementNoEmptys)
  private
  protected
    FGrupoAlterado: String;
    FCampoAlterado: String;
    FValorAlterado: String;
    FNroItemAlterado: TCTeIntegerComZero;
  published
    property GrupoAlterado: String read FGrupoAlterado write FGrupoAlterado;
    property CampoAlterado: String read FCampoAlterado write FCampoAlterado;
    property ValorAlterado: String read FValorAlterado write FValorAlterado;
    property NroItemAlterado: TCTeIntegerComZero read FNroItemAlterado write FNroItemAlterado; 
  end;

  TEvCCeCTe = class(TCTeElementNoEmptys)
  private
  protected
    FDescEvento: String;
    FInfCorrecao: TCTeElementItems;
    FXCondUso: String;
  published
    property DescEvento: String read FDescEvento write FDescEvento;
    property InfCorrecao: TCTeElementItems read FInfCorrecao write FInfCorrecao;
    property XCondUso: String read FXCondUso write FXCondUso;
  end;

  TdetEvento = class(TCTeElementNoEmptys)
  private
  protected
    FVersaoEvento: String;
    FEvCancCTe: TEvCancCTe;
    FEvCCeCTe: TEvCCeCTe;
  public
    constructor Create(Versao: TCteVersao);
  published
    property VersaoEvento: String read FVersaoEvento;
    property EvCancCTe: TEvCancCTe read FEvCancCTe write FEvCancCTe;
    property EvCCeCTe: TEvCCeCTe read FEvCCeCTe write FEvCCeCTe;
  end;

  TinfEvento = class(TCTeElementNoEmptys)
  private
    procedure SetId(const Value: String);
  protected
    FId: String;
    FCOrgao: Integer;
    FTpAmb: Integer;
    FCNPJ: String;
    FChCTe: String;
    FDhEvento: String;
    FTpEvento: Integer;
    FNSeqEvento: Longint;
    FDetEvento: TDetEvento;
    constructor Create(Id: String);
  published
    property Id: String read FId write SetId;
    property COrgao: Integer read FCOrgao write FCOrgao;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property CNPJ: String read FCNPJ write FCNPJ;
    property ChCTe: String read FChCTe write FChCTe;
    property DhEvento: String read FDhEvento write FDhEvento;
    property TpEvento: Integer read FTpEvento write FTpEvento;
    property NSeqEvento: Longint read FNSeqEvento write FNSeqEvento;
    property DetEvento: TDetEvento read FDetEvento write FDetEvento;
  end;

  TEventoCTe = class(TCTeElementNoEmptys)
  private
  protected
    FXmlns: String;
    FVersao: String;
    FInfEvento: TInfEvento;
    FSignature: String;
  public
    constructor Create(Id: String; Versao: TCteVersao);
  published
    property Xmlns: String read FXmlns;
    property Versao: String read FVersao;
    property InfEvento: TInfEvento read FInfEvento;
    property Signature: String read FSignature write FSignature;
  end;

implementation

{ TDetEvento }

constructor TdetEvento.Create(Versao: TCteVersao);
begin
  FVersaoEvento := Versao.Version;
end;

{ TEventoCTe }

constructor TEventoCTe.Create(Id: String; Versao: TCteVersao);
begin
  FInfEvento := TinfEvento.Create(Id);
  FXmlns := 'http://www.portalfiscal.inf.br/cte';
  FVersao := Versao.Version;
end;


{ TinfEvento }

constructor TinfEvento.Create(Id: String);
begin
  FId := Id;
end;

procedure TinfEvento.SetId(const Value: String);
begin
  FId := Value;
end;

end.
