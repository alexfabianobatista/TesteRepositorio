unit EventoMdfe;

interface

uses
  MdfeTypes, MdfeVersao, RodoMdfe, TypInfo;

type
  TEventoMDFe = class;
  TEvCancMDFe = class(TMDFeElementNoEmptys)
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
  TEvEncMDFe = class(TMDFeElementNoEmptys)
  private
  protected
    FDescEvento: String;
    FNProt: String;
    FDtEnc: TMDFeData;
    FCUF: Integer;
    FCMun: Integer;
  published
    property DescEvento: String read FDescEvento write FDescEvento;
    property NProt: String read FNProt write FNProt;
    property DtEnc: TMDFeData read FDtEnc write FDtEnc;
    property CUF: Integer read FCUF write FCUF;
    property CMun: Integer read FCMun write FCMun;
  end;

  TEvIncCondutorMDFe = class(TMDFeElementNoEmptys)
  private
  protected
    FDescEvento: String;
    FCondutor: TCondutor;
  published
    property DescEvento: String read FDescEvento write FDescEvento;
    property Condutor: TCondutor read FCondutor write FCondutor;
  end;
  
  TdetEvento = class(TMDFeElementNoEmptys)
  private
  protected
    FVersaoEvento: String;
    FEvCancMDFe: TEvCancMDFe;
    FEvEncMDFe: TEvEncMDFe;
    FEvIncCondutorMDFe: TEvIncCondutorMDFe;
  public
    constructor Create(Versao: TMdfeVersao);
  published
    property VersaoEvento: String read FVersaoEvento;
    property EvCancMDFe: TEvCancMDFe read FEvCancMDFe write FEvCancMDFe;
    property EvEncMDFe: TEvEncMDFe read FEvEncMDFe write FEvEncMDFe;
    property EvIncCondutorMDFe: TEvIncCondutorMDFe read FEvIncCondutorMDFe write FEvIncCondutorMDFe;
  end;

  TinfEvento = class(TMDFeElementNoEmptys)
  private
    procedure SetId(const Value: String);
  protected
    FId: String;
    FCOrgao: Integer;
    FTpAmb: Integer;
    FCNPJ: String;
    FChMDFe: String;
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
    property ChMDFe: String read FChMDFe write FChMDFe;
    property DhEvento: String read FDhEvento write FDhEvento;
    property TpEvento: Integer read FTpEvento write FTpEvento;
    property NSeqEvento: Longint read FNSeqEvento write FNSeqEvento;
    property DetEvento: TDetEvento read FDetEvento write FDetEvento;
  end;

  TEventoMDFe = class(TMDFeElementNoEmptys)
  private
  protected
    FXmlns: String;
    FVersao: String;
    FInfEvento: TInfEvento;
    FSignature: String;
  public
    constructor Create(Id: String; Versao: TMdfeVersao);
  published
    property Xmlns: String read FXmlns;
    property Versao: String read FVersao;
    property InfEvento: TInfEvento read FInfEvento;
    property Signature: String read FSignature write FSignature;
  end;

implementation

{ TDetEvento }

constructor TdetEvento.Create(Versao: TMdfeVersao);
begin
  FVersaoEvento := Versao.Version;
end;

{ TEventoMDFe }

constructor TEventoMDFe.Create(Id: String; Versao: TMdfeVersao);
begin
  FInfEvento := TinfEvento.Create(Id);
  FXmlns := 'http://www.portalfiscal.inf.br/mdfe';
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
