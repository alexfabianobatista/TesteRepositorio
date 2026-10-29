unit CartaCorrecao;

interface

uses
  NfeTypes, NfeVersao, TypInfo;

type
  TenvEvento = class;

  TdetEvento = class(TNFeElementNoEmptys)
  private
  protected
    FVersao: String;
    FDescEvento: String;
    FNProt: String;
    FXJust: String;
    FXCorrecao: String;
    FXCondUso: String;
  public
    constructor Create;
  published
    property Versao: String read FVersao;
    property DescEvento: String read FDescEvento write FDescEvento;
    property NProt: String read FNProt write FNProt;
    property XJust: String read FXJust write FXJust;
    property XCorrecao: String read FXCorrecao write FXCorrecao;
    property XCondUso: String read FXCondUso write FXCondUso;
  end;

  TinfEvento = class(TNFeElementNoEmptys)
  private
    procedure SetId(const Value: String);
  protected
    FId: String;
    FCOrgao: Integer;
    FTpAmb: Integer;
    FCNPJ: String;
    FCPF: String;
    FChNFe: String;
    FDhEvento: String;
    FTpEvento: Integer;
    FNSeqEvento: Longint;
    FVerEvento: String;
    FDetEvento: TDetEvento;
    constructor Create(Id: String);
  published
    property Id: String read FId write SetId;
    property COrgao: Integer read FCOrgao write FCOrgao;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property ChNFe: String read FChNFe write FChNFe;
    property DhEvento: String read FDhEvento write FDhEvento;
    property TpEvento: Integer read FTpEvento write FTpEvento;
    property NSeqEvento: Longint read FNSeqEvento write FNSeqEvento;
    property VerEvento: String read FVerEvento write FVerEvento;
    property DetEvento: TDetEvento read FDetEvento write FDetEvento;
  end;

  Tevento = class(TNFeElementNoEmptys)
  private
  protected
    FXmlns: String;
    FVersao: String;
    FInfEvento: TInfEvento;
    FSignature: String;
  public
    constructor Create(Id: String);
  published
    property Xmlns: String read FXmlns;
    property Versao: String read FVersao;
    property InfEvento: TInfEvento read FInfEvento;
    property Signature: String read FSignature write FSignature;
  end;
  TenvEvento = class(TNFeElementNoEmptys)
  private
  protected
    FXmlns: String;
    FVersao: String;
    FIdLote: Longint;
    FEvento: TNFeElementItems;
  public
    constructor Create;
  published
    property Xmlns: String read FXmlns;
    property Versao: String read FVersao;
    property IdLote: Longint read FIdLote write FIdLote;
    property Evento: TNFeElementItems read FEvento write FEvento;
  end;


implementation

{ TDetEvento }

constructor TdetEvento.Create;
begin
  FVersao := TCceVersao1_00.Create.Version;
end;

{ TEnvEvento }

constructor TenvEvento.Create;
begin
  FXmlns := 'http://www.portalfiscal.inf.br/nfe';
  FVersao := TCceVersao1_00.Create.Version;
end;                               

{ TEvento }

constructor Tevento.Create(Id: String);
begin
  FInfEvento := TinfEvento.Create(Id);
  FVersao := TCceVersao1_00.Create.Version;
  FXmlns := 'http://www.portalfiscal.inf.br/nfe';
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
