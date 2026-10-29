unit Nfe;

interface

uses
  Local, Avulsa, Pessoa, Ide, NfeConsts, Total, NfeTypes, Item, Transp, Cobranca,
  InfAdic, Exporta, NfeVersao, TypInfo;

type
  TNFe = class;

  TNFes = Array of TNFe;

  TGPagAntecipado = class(TNFeElementNoEmptys)
  protected
    FRefNFe: TNFeElementItems;
  published
    property RefNFe: TNFeElementItems read FRefNFe write FRefNFe;
  end;

  //ID = A01
  TAutXML = class(TNFeElementNoEmptys)
  protected
    FCNPJ: String;
    FCPF: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
  end;

  TCard = class(TNFeElementNoEmptys)
  protected
    FTpIntegra: Integer;
    FCNPJ: String;
    FTBand: TNFeIntegerComZero;
    FCAut: String;
  published
    property TpIntegra: Integer read FTpIntegra write FTpIntegra;
    property CNPJ: String read FCNPJ write FCNPJ;
    property TBand: TNFeIntegerComZero read FTBand write FTBand;
    property CAut: String read FCAut write FCAut;
  end;

  TPag = class(TNFeElement)
  protected
    //FIndPag: TNFeIntegerComZero;
    FTPag: TNFeIntegerComZero;
    FXPag: string;
    FVPag: TNFeFloat2; 
    FCard: TCard;
  published
    //property IndPag: TNFeIntegerComZero read FIndPag write FIndPag;
    property TPag: TNFeIntegerComZero read FTPag write FTPag;
    property XPag: String read FXPag write FXPag;
    property VPag: TNFeFloat2 read FVPag write FVPag;
    property Card: TCard read FCard write FCard;
  end;

  TPag4 = class(TNFeElement)
  protected
    FDetPag: TNFeElementItems;
    FVTroco: TNFeFloat2;
  published
    property DetPag: TNFeElementItems read FDetPag write FDetPag;
    property VTroco: TNFeFloat2 read FVTroco write FVTroco;
  end;
  TInfRespTec = class(TNFeElement)
  protected
    FCNPJ: String;
    FXContato: String;
    FEmail: String;
    FFone: String;
    FIdCSRT: TNFeIntegerComZero;
    FHashCSRT: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property XContato: String read FXContato write FXContato;
    property Email: String read FEmail write FEmail;
    property Fone: String read FFone write FFone;
    property IdCSRT: TNFeIntegerComZero read FIdCSRT write FIdCSRT;
    property HashCSRT: String read FHashCSRT write FHashCSRT;
  end;

  TInfNfe = class(TNFeElement)
  private
    procedure SetId(const Value: String);
  protected
    FAvulsa: TAvulsa;
    FDest: TDest;
    FEmit: TEmit;
    FId: String;
    FIde: TIde;
    FRetirada: TLocal;
    FEntrega: TLocal;
    FVersao: String;
    FDet: TNFeElementItems;
    FAutXML: TNFeElementItems;
    FTotal: TTotal;
    FTransp: TTransp;
    FCobr: TCobr;
    FPag: TNFeElementItems;
    FPag4: TPag4;
    FInfAdic: TInfAdic;
    FExporta: TExporta;
    FInfRespTec: TInfRespTec;
    constructor Create(Id: String; Versao: TNfeVersao);
    function GetXMLName(Prop: TPropInfo): String; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Versao: String read FVersao;
    property Id: String read FId write SetId;
    property Ide: TIde read FIde write FIde;
    property Emit: TEmit read FEmit write FEmit;
    property Avulsa: TAvulsa read FAvulsa write FAvulsa;
    property Dest: TDest read FDest write FDest;
    property Retirada: TLocal read FRetirada write FRetirada;
    property Entrega: TLocal read FEntrega write FEntrega;
    property AutXML: TNFeElementItems read FAutXML write FAutXML;
    property Det: TNFeElementItems read FDet write FDet;
    property Total: TTotal read FTotal write FTotal;
    property Transp: TTransp read FTransp write FTransp;
    property Cobr: TCobr read FCobr write FCobr;
    property Pag: TNFeElementItems read FPag write FPag;
    property Pag4: TPag4 read FPag4 write FPag4;
    property InfAdic: TInfAdic read FInfAdic write FInfAdic;
    property Exporta: TExporta read FExporta write FExporta;
    property InfRespTec: TInfRespTec read FInfRespTec write FInfRespTec;
  end;

  TNFe = class(TNFeElementNoEmptys)
  private
  protected
    FInfNFe: TInfNfe;
    FXmlns: String;
  public
    constructor Create(Id: String; Versao: TNfeVersao);
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Xmlns: String read FXmlns;
    property InfNFe: TInfNfe read FInfNfe;
  end;

  TLoteNFe = class
  private
  protected
    FId: Longint;
    FNFes: TNFes;
  public
    constructor Create(Id: Longint);
    procedure AdicionaNFe(NFe: TNFe);
    procedure RemoveNFe(NFe: TNFe);
    property NFes: TNFes read FNFes write FNFes;
  end;

implementation

uses XMLUtils, SysUtils;

{ TNFe }

constructor TNFe.Create(Id: String; Versao: TNfeVersao);
begin
  FInfNfe := TInfNfe.Create(Id, Versao);
  FXmlns := 'http://www.portalfiscal.inf.br/nfe';
end;

{ TInfNfe }

constructor TInfNfe.Create(Id: String; Versao: TNfeVersao);
begin
  FId := Id;
  if Versao <> nil then
    FVersao := Versao.Version;
end;

function TInfNfe.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if Prop.Name = 'Pag4' then
    Result := 'pag';
end;

procedure TInfNfe.SetId(const Value: String);
begin
  FId := Value;
  if (Value <> '') and (Ide <> nil) then
  begin
    Ide.CDV := StrToInt('0' + Copy(Value, Length(Value), 1));
    if FVersao = VERSAO_NFE_1_10 then
      Ide.CNF := TNFeIntegerComZero.Create(StrToInt('0' + Copy(Value, 38, 9)), 9)
    else if (FVersao = VERSAO_NFE_2) or (FVersao = VERSAO_NFE_3_10) or (FVersao = VERSAO_NFE_4_00) then
      Ide.CNF := TNFeIntegerComZero.Create(StrToInt('0' + Copy(Value, 39, 8)), 8);
  end;
end;

{ TLoteNFe }

procedure TLoteNFe.AdicionaNFe(NFe: TNFe);
var
  i: Integer;
begin
  i := Length(FNFes);
  SetLength(FNFes, i + 1);
  FNFes[i] := NFe;
end;

constructor TLoteNFe.Create(Id: Integer);
begin
  FId := Id;
end;

procedure TLoteNFe.RemoveNFe(NFe: TNFe);
var
  i: Integer;
begin
  for i := 0 to Length(FNFes) - 1 do
    if (FNFes[i] <> nil) and (FNFes[i].FInfNfe.Id = NFe.InfNfe.Id) then
      FNFes[i] := nil;
end;

function TNFe.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (Prop.Name = 'qUnid') or (Prop.Name = 'vUnid') then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.

