unit IdeCte;

interface

uses
  CteTypes, Toma;
type
  TIde = class(TCTeElement)
  protected
    FCUF: Integer;
    FCCT: TCTeIntegerComZero;
    FCFOP: Integer;
    FNatOp: String;
    FForPag: String;                 //Não existe na versão 3.00
    FMod: Integer;
    FSerie: Integer;
    FNCT: Integer;
    FDhEmi: String;
    FTpImp: Integer;
    FTpEmis: Integer;
    FCDV: Integer;
    FTpAmb: Integer;
    FTpCTe: Integer;
    FProcEmi: Integer;
    FVerProc: String;
    FIndGlobalizado: Integer;         
    FRefCTE: String;                  //Não existe na versão 3.00
    FCMunEnv: Integer;
    FXMunEnv: String;
    FUFEnv: String;
    FModal: TCTeIntegerComZero;
    FTpServ: Integer;
    FCMunIni: Integer;
    FXMunIni: String;
    FUFIni: String;
    FCMunFim: Integer;
    FXMunFim: String;
    FUFFim: String;
    FRetira: Integer;
    FXDetRetira: String;
    FIndIEToma: Integer;
    FToma03: TToma03;
    FToma3: TToma03;
    FToma4: TToma4;
    FDhCont: TCTeDataHora;
    FXJust: String;
  published
    property CUF: Integer read FCUF write FCUF;
    property CCT: TCTeIntegerComZero read FCCT write FCCT;
    property CFOP: Integer read FCFOP write FCFOP;
    property NatOp: String read FNatOp write FNatOp;
    property ForPag: String read FForPag write FForPag;
    property Mod_: Integer read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property NCT: Integer read FNCT write FNCT;
    property DhEmi: String read FDhEmi write FDhEmi;
    property TpImp: Integer read FTpImp write FTpImp;
    property TpEmis: Integer read FTpEmis write FTpEmis;
    property CDV: Integer read FCDV write FCDV;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property TpCTe: Integer read FTpCTe write FTpCTe;
    property ProcEmi: Integer read FProcEmi write FProcEmi;
    property VerProc: String read FVerProc write FVerProc;
    property IndGlobalizado: Integer read FIndGlobalizado write FIndGlobalizado;
    property RefCTE: String read FRefCTE write FRefCTE;
    property CMunEnv: Integer read FCMunEnv write FCMunEnv;
    property XMunEnv: String read FXMunEnv write FXMunEnv;
    property UFEnv: String read FUFEnv write FUFEnv;
    property Modal: TCTeIntegerComZero read FModal write FModal;
    property TpServ: Integer read FTpServ write FTpServ;
    property CMunIni: Integer read FCMunIni write FCMunIni;
    property XMunIni: String read FXMunIni write FXMunIni;
    property UFIni: String read FUFIni write FUFIni;
    property CMunFim: Integer read FCMunFim write FCMunFim;
    property XMunFim: String read FXMunFim write FXMunFim;
    property UFFim: String read FUFFim write FUFFim;
    property Retira: Integer read FRetira write FRetira;
    property XDetRetira: String read FXDetRetira write FXDetRetira;
    property IndIEToma: Integer read FIndIEToma write FIndIEToma;
    property Toma03: TToma03 read FToma03 write FToma03;
    property Toma3: TToma03 read FToma3 write FToma3;
    property Toma4: TToma4 read FToma4 write FToma4;
    property DhCont: TCTeDataHora read FDhCont write FDhCont;
    property XJust: String read FXJust write FXJust;
  end;

implementation

end.

 