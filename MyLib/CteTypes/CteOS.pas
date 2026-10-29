unit CteOS;

interface

uses
  CteTypes, Cte, ideCteOS, ICMSCte, Compl, CteConsts, CteVersao, InfCteNorm, InfCteComp,
  InfCteAnu, Envolvido, TypInfo;

type
  TCTeOS = class;

  TCTesOS = Array of TCTeOS;

  TInfRespTecOS = class(TCTeElement)
  protected
    FCNPJ: String;
    FXContato: String;
    FEmail: String;
    FFone: String;
    FIdCSRT: TCTeIntegerComZero;
    FHashCSRT: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property XContato: String read FXContato write FXContato;
    property Email: String read FEmail write FEmail;
    property Fone: String read FFone write FFone;
    property IdCSRT: TCTeIntegerComZero read FIdCSRT write FIdCSRT;
    property HashCSRT: String read FHashCSRT write FHashCSRT;
  end;
  TInfCteOS = class(TCTeElement)
  private
    procedure SetId(const Value: String);
  protected
    FVersao: String;
    FId: String;
    FIde: TIdeOS;
    FCompl: TCompl;
    FEmit: TEmit;
    FToma: TToma;
    FVPrest: TVPrest;
    FImp: TImpCte;
    FICMSUFFim: TICMSUFFim;
    FInfTribFed: TInfTribFed;
    FInfCTeNorm: TInfCteNorm;
    FInfCteComp: TInfCteComp;
    FInfCteAnu: TInfCteAnu;
    FAutXML: TCTeElementItems;
    FInfRespTec: TInfRespTecOS;
    function GetXMLName(Prop: TPropInfo): String; override;
    constructor Create(Id: String; Versao: TCteVersao);
  published
    property Versao: String read FVersao;
    property Id: String read FId write SetId;
    property Ide: TIdeOS read FIde write FIde;
    property Compl: TCompl read FCompl write FCompl;
    property Emit: TEmit read FEmit write FEmit;
    property Toma: TToma read FToma write FToma;
    property VPrest: TVPrest read FVPrest write FVPrest;
    property Imp: TImpCte read FImp write FImp;
    property ICMSUFFim: TICMSUFFim read FICMSUFFim write FICMSUFFim;
    property InfTribFed: TInfTribFed read FInfTribFed write FInfTribFed;
    property InfCTeNorm: TInfCTeNorm read FInfCTeNorm write FInfCTeNorm;
    property InfCteComp: TInfCteComp read FInfCteComp write FInfCteComp;
    property InfCteAnu: TInfCteAnu read FInfCteAnu write FInfCteAnu;
    property AutXML: TCTeElementItems read FAutXML write FAutXML;
    property InfRespTec: TInfRespTecOS read FInfRespTec write FInfRespTec;
  end;

  TCTeOS = class(TCTeElementNoEmptys)
  protected
    FVersao: String;
    FInfCte: TInfCteOS;
    FXmlns: String;
  public
    constructor Create(Id: String; Versao: TCteVersao);
  published
    property Versao: String read FVersao;
    property Xmlns: String read FXmlns;
    property InfCte: TInfCteOS read FInfCte write FInfCte;
  end;

  TLoteCTeOS = class
  private
  protected
    FId: Longint;
    FCTes: TCTesOS;
  public
    constructor Create(Id: Longint);
    procedure AdicionaCTe(CTe: TCTeOS);
    procedure RemoveCTe(CTe: TCTeOS);
    property CTes: TCTesOS read FCTes write FCTes;
  end;

implementation

uses XMLUtils, SysUtils;

{ TCTe }

constructor TCTeOS.Create(Id: String; Versao: TCteVersao);
begin
  FVersao := Versao.Version;
  FInfCte := TInfCteOS.Create(Id, Versao);
  FXmlns := 'http://www.portalfiscal.inf.br/cte';
end;

{ TLoteCTe }

procedure TLoteCTeOS.AdicionaCTe(CTe: TCTeOS);
var
  i: Integer;
begin
  i := Length(FCTes);
  SetLength(FCTes, i + 1);
  FCTes[i] := CTe;
end;

constructor TLoteCTeOS.Create(Id: Integer);
begin
  FId := Id;
end;

procedure TLoteCTeOS.RemoveCTe(CTe: TCTeOS);
var
  i: Integer;
begin
  for i := 0 to Length(FCTes) - 1 do
    if (FCTes[i] <> nil) and (FCTes[i].FInfCTe.Id = CTe.InfCTe.Id) then
      FCTes[i] := nil;
end;

{ TInfCTe }

constructor TInfCTeOS.Create(Id: String; Versao: TCteVersao);
begin
  FId := Id;
  if Versao <> nil then
    FVersao := Versao.Version;
end;

function TInfCTeOS.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'IMPCTE') then
    Result := 'imp';
end;

procedure TInfCTeOS.SetId(const Value: String);
begin
  FId := Value;
  if (Value <> '') and (Ide <> nil) then
  begin
    Ide.CDV := StrToInt('0' + Copy(Value, Length(Value), 1));
    Ide.CCT := TCTeIntegerComZero.Create(StrToInt('0' + Copy(Value, 39, 8)), 8);
  end;
end;

end.
