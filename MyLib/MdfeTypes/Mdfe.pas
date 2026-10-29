unit Mdfe;

interface

uses
  MdfeTypes, ideMdfe, RodoMdfe, MdfeConsts, MdfeVersao, EnvolvidoMdfe, InfDoc, TypInfo;

type
  TMDFe = class;

  TMDFes = Array of TMDFe;
  TInfModal = class(TMDFeElement)
  protected
    FVersaoModal: String;
    FRodo: TRodo;
  published
    property VersaoModal: String read FVersaoModal write FVersaoModal;
    property Rodo: TRodo read FRodo write FRodo;
  end;

  TTot = class(TMDFeElementNoEmptys)
  protected
    FQCTe: Integer;
    FQCT: Integer;
    FQNFe: Integer;
    FQNF: Integer;
    FQMDFe: Integer;
    FVCarga: TMDFeFloat2;
    FCUnid: TMDFeIntegerComZero;
    FQCarga: TMDFeFloat4;
  published
    property QCTe: Integer read FQCTe write FQCTe;
    property QCT: Integer read FQCT write FQCT;
    property QNFe: Integer read FQNFe write FQNFe;
    property QNF: Integer read FQNF write FQNF;
    property QMDFe: Integer read FQMDFe write FQMDFe;
    property VCarga: TMDFeFloat2 read FVCarga write FVCarga;
    property CUnid: TMDFeIntegerComZero read FCUnid write FCUnid;
    property QCarga: TMDFeFloat4 read FQCarga write FQCarga;
  end;
  TLacres = class(TMDFeElement)
  protected
    FNLacre: String;
  published
    property NLacre: String read FNLacre write FNLacre;
  end;
  TAutXML = class(TMDFeElement)
  protected
    FCNPJ: TMDFeIntegerComZero;
    FCPF: TMDFeIntegerComZero;
  published
    property CNPJ: TMDFeIntegerComZero read FCNPJ write FCNPJ;
    property CPF: TMDFeIntegerComZero read FCPF write FCPF;
  end;
  TInfAdic = class(TMDFeElementNoEmptys)
  protected
    FInfAdFisco: String;
    FInfCpl: String;
  published
    property InfAdFisco: String read FInfAdFisco write FInfAdFisco;
    property InfCpl: String read FInfCpl write FInfCpl;
  end;
  TInfSeg = class(TMDFeElementNoEmptys)
  protected
    FXSeg: String;
    FCNPJ: String;
  published
    property XSeg: String read FXSeg write FXSeg;
    property CNPJ: String read FCNPJ write FCNPJ;
  end;
  TInfResp = class(TMDFeElementNoEmptys)
  protected
    FRespSeg: Integer;
    FCNPJ: String;
    FCPF: String;
  published
    property RespSeg: Integer read FRespSeg write FRespSeg;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
  end;
  TSeg = class(TMDFeElement)
  protected
    FInfResp: TInfResp;
    FInfSeg: TInfSeg;
    FNApol: String;
    FNAver: String;
  published
    property InfResp: TInfResp read FInfResp write FInfResp;
    property InfSeg: TInfSeg read FInfSeg write FInfSeg;
    property NApol: String read FNApol write FNApol;
    property NAver: String read FNAver write FNAver;
  end;
  TInfRespTec = class(TMDFeElement)
  protected
    FCNPJ: String;
    FXContato: String;
    FEmail: String;
    FFone: String;
    FIdCSRT: TMDFeIntegerComZero;
    FHashCSRT: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property XContato: String read FXContato write FXContato;
    property Email: String read FEmail write FEmail;
    property Fone: String read FFone write FFone;
    property IdCSRT: TMDFeIntegerComZero read FIdCSRT write FIdCSRT;
    property HashCSRT: String read FHashCSRT write FHashCSRT;
  end;

  TInfLocalDescarrega = class(TMDFeElementNoEmptys)
  protected
    FCEP: String;
    FLatitude: String;
    FLongitude: String;
  published
    property CEP: String read FCEP write FCEP;
    property Latitude: String read FLatitude write FLatitude;
    property Longitude: String read FLongitude write FLongitude;
  end;
  
  TInfLocalCarrega = class(TMDFeElementNoEmptys)
  protected
    FCEP: String;
    FLatitude: String;
    FLongitude: String;
  published
    property CEP: String read FCEP write FCEP;
    property Latitude: String read FLatitude write FLatitude;
    property Longitude: String read FLongitude write FLongitude;
  end;

  TInfLotacao = class(TMDFeElement)
  protected
    FInfLocalCarrega: TInfLocalCarrega;
    FInfLocalDescarrega: TInfLocalDescarrega;
  published
    property InfLocalCarrega: TInfLocalCarrega read FInfLocalCarrega write FInfLocalCarrega;
    property InfLocalDescarrega: TInfLocalDescarrega read FInfLocalDescarrega write FInfLocalDescarrega;
  end;

  TProdPred = class(TMDFeElementNoEmptys)
  protected
    FTpCarga: TMDFeIntegerComZero;
    FXProd: String;
    FCEAN: String;
    FNCM: String;
    FInfLotacao: TInfLotacao;
  published
    property TpCarga: TMDFeIntegerComZero read FTpCarga write FTpCarga;
    property XProd: String read FXProd write FXProd;
    property CEAN: String read FCEAN write FCEAN;
    property NCM: String read FNCM write FNCM;
    property InfLotacao: TInfLotacao read FInfLotacao write FInfLotacao;
  end;

  TInfMDFe = class(TMDFeElement)
  private
    procedure SetId(const Value: String);
  protected
    FVersao: String;
    FId: String;
    FIde: TIde;
    FEmit: TEmit;
    FInfModal: TInfModal;
    FInfDoc: TInfDoc;
    FSeg: TMDFeElementItems;
    FProdPred: TProdPred;
    FTot: TTot;
    FLacres: TMDFeElementItems;
    FAutXML: TMDFeElementItems;
    FInfAdic: TInfAdic;
    FInfRespTec: TInfRespTec;
    //function GetXMLName(Prop: TPropInfo): String; override;
    constructor Create(Id: String; Versao: TMdfeVersao);
  published
    property Versao: String read FVersao;
    property Id: String read FId write SetId;
    property Ide: TIde read FIde write FIde;
    property Emit: TEmit read FEmit write FEmit;
    property InfModal: TInfModal read FInfModal write FInfModal;
    property InfDoc: TInfDoc read FInfDoc write FInfDoc;
    property Seg: TMDFeElementItems read FSeg write FSeg;
    property ProdPred: TProdPred read FProdPred write FProdPred;
    property Tot: TTot read FTot write FTot;
    property Lacres: TMDFeElementItems read FLacres write FLacres;
    property AutXML: TMDFeElementItems read FAutXML write FAutXML;
    property InfAdic: TInfAdic read FInfAdic write FInfAdic;
    property InfRespTec: TInfRespTec read FInfRespTec write FInfRespTec;
  end;
  TInfMDFeSupl = class(TMDFeElement)
  protected
    FQrCodMDFe: String;
  published
    property QrCodMDFe: String read FQrCodMDFe write FQrCodMDFe;
  end;
  TMDFe = class(TMDFeElementNoEmptys)
  protected
    FInfMDFe: TInfMDFe;
    FXmlns: String;
    FInfMDFeSupl: TInfMDFeSupl;
  public
    constructor Create(Id: String; Versao: TMdfeVersao);
  published
    property Xmlns: String read FXmlns;
    property InfMDFe: TInfMDFe read FInfMDFe write FInfMDFe;
    property InfMDFeSupl: TInfMDFeSupl read FInfMDFeSupl write FInfMDFeSupl;
  end;

  TLoteMDFe = class
  private
  protected
    FId: Longint;
    FMDFes: TMDFes;
  public
    constructor Create(Id: Longint);
    procedure AdicionaMDFe(MDFe: TMDFe);
    procedure RemoveMDFe(MDFe: TMDFe);
    property MDFes: TMDFes read FMDFes write FMDFes;
  end;

implementation

uses XMLUtils, SysUtils;

{ TMDFe }

constructor TMDFe.Create(Id: String; Versao: TMdfeVersao);
begin
  FInfMDFe := TInfMDFe.Create(Id, Versao);
  FXmlns := 'http://www.portalfiscal.inf.br/mdfe';
end;

{ TLoteMDFe }

procedure TLoteMDFe.AdicionaMDFe(MDFe: TMDFe);
var
  i: Integer;
begin
  i := Length(FMDFes);
  SetLength(FMDFes, i + 1);
  FMDFes[i] := MDFe;
end;

constructor TLoteMDFe.Create(Id: Integer);
begin
  FId := Id;
end;

procedure TLoteMDFe.RemoveMDFe(MDFe: TMDFe);
var
  i: Integer;
begin
  for i := 0 to Length(FMDFes) - 1 do
    if (FMDFes[i] <> nil) and (FMDFes[i].FInfMDFe.Id = MDFe.InfMDFe.Id) then
      FMDFes[i] := nil;
end;

{ TInfMDFe }

constructor TInfMDFe.Create(Id: String; Versao: TMdfeVersao);
begin
  FId := Id;
  if Versao <> nil then
    FVersao := Versao.Version;
end;

procedure TInfMDFe.SetId(const Value: String);
begin
  FId := Value;
  if (Value <> '') and (Ide <> nil) then
  begin
    Ide.CDV := StrToInt('0' + Copy(Value, Length(Value), 1));
    Ide.CMDF := TMDFeIntegerComZero.Create(StrToInt('0' + Copy(Value, 40, 8)), 8);
  end;
end;

end.

