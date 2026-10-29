unit Ide;

interface

uses
  NFRef, NfeTypes, TypInfo;

type
  //ID = B01
  TIde = class(TNFeElement)
  private
  protected
    FCUF: Integer;
    FCDV: Integer;
    FCMunFG: Integer;
    FCNF: TNFeIntegerComZero;
    FDEmi: TNFeData;
    FDhEmi: String;
    FDhCont: String;
    FDSaiEnt: TNFeData;
    FDPrevEntrega: String;
    FDhSaiEnt: String;
    FFinNFe: Integer;
    FIndFinal: String;
    FIndPres: Integer;
    FIndIntermed: String;
    FHSaiEnt: TNFeHora;
    FIndPag: String;
    FMod: String;
    FNatOp: String;
    FNFref: TNFeElementItems;
    FNNF: Integer;
    FProcEmi: Integer;
    FSerie: Integer;
    FTpAmb: Integer;
    FTpEmis: Integer;
    FTpImp: Integer;
    FTpNf: Integer;
    FIdDest: Integer;
    FVerProc: String;
    FXJust: String;
  public
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CUF: Integer read FCUf write FCUf;
    property CNF: TNFeIntegerComZero read FCNf write FCNf;
    property NatOp: String read FNatOp write FNatOp;
    property IndPag: String read FIndPag write FIndPag;
    property Mod_: String read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property NNF: Integer read FNNf write FNNf;
    property DEmi: TNFeData read FDEmi write FDEmi;
    property DhEmi: String read FDhEmi write FDhEmi;
    property DSaiEnt: TNFeData read FDSaiEnt write FDSaiEnt;
    property DPrevEntrega: String read FDPrevEntrega write FDPrevEntrega;
    property DhSaiEnt: String read FDhSaiEnt write FDhSaiEnt;
    property HSaiEnt: TNFeHora read FHSaiEnt write FHSaiEnt;
    property TpNF: Integer read FTpNf write FTpNf;
    property IdDest: Integer read FIdDest write FIdDest;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property TpImp: Integer read FTpImp write FTpImp;
    property TpEmis: Integer read FTpEmis write FTpEmis;
    property CDV: Integer read FCDV write FCDV;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property FinNFe: Integer read FFinNFe write FFinNFe;
    property IndFinal: String read FIndFinal write FIndFinal;
    property IndPres: Integer read FIndPres write FIndPres;
    property IndIntermed: String read FIndIntermed write FIndIntermed;
    property ProcEmi: Integer read FProcEmi write FProcEmi;
    property VerProc: String read FVerProc write FVerProc;
    property DhCont: String read FDhCont write FDhCont;
    property XJust: String read FXJust write FXJust;
    property NFref: TNFeElementItems read FNFref write FNFref;
  end;

implementation

uses
  SysUtils;

function TIde.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (Prop.Name = 'IndPres') then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
 