unit Cte;

interface

uses
  CteTypes, ideCte, ICMSCte, Compl, CteConsts, CteVersao, InfCteNorm, InfCteComp,
  InfCteAnu, Envolvido, TypInfo, IBSCBSCTe;

type
  TCTe = class;

  TCTes = Array of TCTe;
  TAutXML = class(TCTeElementNoEmptys)
  protected
    FCNPJ: String;
    FCPF: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
  end;
  TICMSUFFim = class(TCTeElementAllEmptys)
  private
  protected
    FVBCUFFim: TCTeFloat2;
    FPFCPUFFim: TCTeFloat2;
    FPICMSUFFim: TCTeFloat2;
    FPICMSInter: TCTeFloat2;
    //FPICMSInterPart: TCTeFloat2;
    FVFCPUFFim: TCTeFloat2;
    FVICMSUFFim: TCTeFloat2;
    FVICMSUFIni: TCTeFloat2;
  published
    property VBCUFFim: TCTeFloat2 read FVBCUFFim write FVBCUFFim;
    property PFCPUFFim: TCTeFloat2 read FPFCPUFFim write FPFCPUFFim;
    property PICMSUFFim: TCTeFloat2 read FPICMSUFFim write FPICMSUFFim;
    property PICMSInter: TCTeFloat2 read FPICMSInter write FPICMSInter;
    //property PICMSInterPart: TCTeFloat2 read FPICMSInterPart write FPICMSInterPart;
    property VFCPUFFim: TCTeFloat2 read FVFCPUFFim write FVFCPUFFim;
    property VICMSUFFim: TCTeFloat2 read FVICMSUFFim write FVICMSUFFim;
    property VICMSUFIni: TCTeFloat2 read FVICMSUFIni write FVICMSUFIni;
  end;
  TComp = class(TCTeElement)
  protected
    FXNome: String;
    FVComp: TCTeFloat2;
  published
    property XNome: String read FXNome write FXNome;
    property VComp: TCTeFloat2 read FVComp write FVComp;
  end;

  TVPrest = class(TCTeElement)
  protected
    FVTPrest: TCTeFloat2;
    FVRec: TCTeFloat2;
    FComp: TCTeElementItems;
  published
    property VTPrest: TCTeFloat2 read FVTPrest write FVTPrest;
    property VRec: TCTeFloat2 read FVRec write FVRec;
    property Comp: TCTeElementItems read FComp write FComp;
  end;
  TInfTribFed = class(TCTeElementNoEmptys)
  protected
    FVPIS: TCTeFloat2;
    FVCOFINS: TCTeFloat2;
    FVIR: TCTeFloat2;
    FVINSS: TCTeFloat2;
    FVCSLL: TCTeFloat2;
  published
    property VPIS: TCTeFloat2 read FVPIS write FVPIS;
    property VCOFINS: TCTeFloat2 read FVCOFINS write FVCOFINS;
    property VIR: TCTeFloat2 read FVIR write FVIR;
    property VINSS: TCTeFloat2 read FVINSS write FVINSS;
    property VCSLL: TCTeFloat2 read FVCSLL write FVCSLL;
  end;
  TImpCte = class(TCTeElement)
  protected
    FICMS: TICMSImposto;  
    FVTotTrib: TCTeFloat2;
    FInfAdFisco: String;
    FICMSUFFim: TICMSUFFim;
    FInfTribFed: TInfTribFed;
    FIBSCBS: TIBSCBS;
    FVTotDFe: TCTeFloat2;
    function GetXMLName(Prop: TPropInfo): String; override;
  published
    property ICMS: TICMSImposto read FICMS write FICMS;
    property VTotTrib: TCTeFloat2 read FVTotTrib write FVTotTrib;
    property InfAdFisco: String read FInfAdFisco write FInfAdFisco;
    property ICMSUFFim: TICMSUFFim read FICMSUFFim write FICMSUFFim;
    property InfTribFed: TInfTribFed read FInfTribFed write FInfTribFed;
    property IBSCBS: TIBSCBS read FIBSCBS write FIBSCBS;
    property VTotDFe: TCTeFloat2 read FVTotDFe write FVTotDFe;
  end;
  TInfRespTec = class(TCTeElement)
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
  TInfCte = class(TCTeElement)
  private
    procedure SetId(const Value: String);
  protected
    FVersao: String;
    FId: String;
    FIde: TIde;
    FCompl: TCompl;
    FEmit: TEmit;
    FRem: TRem;
    FExped: TExped;
    FReceb: TReceb;
    FDest: TDest;
    FVPrest: TVPrest;
    FImp: TImpCte;
    FICMSUFFim: TICMSUFFim;
    FInfCTeNorm: TInfCteNorm;
    FInfCteComp: TInfCteComp;
    FInfCteAnu: TInfCteAnu;
    FAutXML: TCTeElementItems;
    FInfRespTec: TInfRespTec;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
    constructor Create(Id: String; Versao: TCteVersao);
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published
    property Versao: String read FVersao;
    property Id: String read FId write SetId;
    property Ide: TIde read FIde write FIde;
    property Compl: TCompl read FCompl write FCompl;
    property Emit: TEmit read FEmit write FEmit;
    property Rem: TRem read FRem write FRem;
    property Exped: TExped read FExped write FExped;
    property Receb: TReceb read FReceb write FReceb;
    property Dest: TDest read FDest write FDest;
    property VPrest: TVPrest read FVPrest write FVPrest;
    property Imp: TImpCte read FImp write FImp;
    property InfCTeNorm: TInfCTeNorm read FInfCTeNorm write FInfCTeNorm;
    property InfCteComp: TInfCteComp read FInfCteComp write FInfCteComp;
    property InfCteAnu: TInfCteAnu read FInfCteAnu write FInfCteAnu;
    property AutXML: TCTeElementItems read FAutXML write FAutXML;
    property InfRespTec: TInfRespTec read FInfRespTec write FInfRespTec;
  end;
  TInfMDFeSupl = class(TCTeElement)
  protected
    FQrCodMDFe: String;
  published
    property QrCodMDFe: String read FQrCodMDFe write FQrCodMDFe;
  end;
  TCTe = class(TCTeElementNoEmptys)
  protected
    FInfCte: TInfCte;
    FXmlns: String;
    FInfMDFeSupl: TInfMDFeSupl;
  public
    constructor Create(Id: String; Versao: TCteVersao);
  published
    property Xmlns: String read FXmlns;
    property InfCte: TInfCte read FInfCte write FInfCte;
    property InfMDFeSupl: TInfMDFeSupl read FInfMDFeSupl write FInfMDFeSupl;
  end;

  TLoteCTe = class
  private
  protected
    FId: Longint;
    FCTes: TCTes;
  public
    constructor Create(Id: Longint);
    procedure AdicionaCTe(CTe: TCTe);
    procedure RemoveCTe(CTe: TCTe);
    property CTes: TCTes read FCTes write FCTes;
  end;

var
  wVersao: string;

implementation

uses XMLUtils, SysUtils;

{ TCTe }

constructor TCTe.Create(Id: String; Versao: TCteVersao);
begin
  FInfCte := TInfCte.Create(Id, Versao);
  FXmlns := 'http://www.portalfiscal.inf.br/cte';
end;

{ TLoteCTe }

procedure TLoteCTe.AdicionaCTe(CTe: TCTe);
var
  i: Integer;
begin
  i := Length(FCTes);
  SetLength(FCTes, i + 1);
  FCTes[i] := CTe;
end;

constructor TLoteCTe.Create(Id: Integer);
begin
  FId := Id;
end;

procedure TLoteCTe.RemoveCTe(CTe: TCTe);
var
  i: Integer;
begin
  for i := 0 to Length(FCTes) - 1 do
    if (FCTes[i] <> nil) and (FCTes[i].FInfCTe.Id = CTe.InfCTe.Id) then
      FCTes[i] := nil;
end;

{ TInfCTe }

constructor TInfCTe.Create(Id: String; Versao: TCteVersao);
begin
  FId := Id;
  if Versao <> nil then
    FVersao := Versao.Version;
end;

function TInfCTe.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'IMPCTE') then
    Result := 'imp';
end;

function TInfCte.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if ((Prop.Name = 'forPag')) and (self.Versao = '2.00') then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

procedure TInfCTe.SetId(const Value: String);
begin
  FId := Value;
  if (Value <> '') and (Ide <> nil) then
  begin
    Ide.CDV := StrToInt('0' + Copy(Value, Length(Value), 1));
    Ide.CCT := TCTeIntegerComZero.Create(StrToInt('0' + Copy(Value, 39, 8)), 8);
  end;
end;

{ TImpCte }

function TImpCte.GetXMLName(Prop: TPropInfo): String;
begin
  FSameName := ',icms';
  Result := inherited GetXMLName(Prop);
end;

end.
 