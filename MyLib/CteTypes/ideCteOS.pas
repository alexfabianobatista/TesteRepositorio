unit ideCteOS;

interface

uses
  CteTypes;
type
  TInfPercurso = class(TCTeElement)
  protected
    FUFPer: String;
  published
    property UFPer: String read FUFPer write FUFPer;
  end;
  TIdeOS = class(TCTeElement)
  protected
    FCUF: Integer;
    FCCT: TCTeIntegerComZero;
    FCFOP: Integer;
    FNatOp: String;
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
    FCMunEnv: Integer;
    FXMunEnv: String;
    FUFEnv: String;
    FModal: TCTeIntegerComZero;
    FTpServ: Integer;
    FIndIEToma: Integer;
    FCMunIni: Integer;
    FXMunIni: String;
    FUFIni: String;
    FCMunFim: Integer;
    FXMunFim: String;
    FUFFim: String;
    FInfPercurso: TCTeElementItems;   //CT-e OS
    FDhCont: TCTeDataHora;
    FXJust: String;
  published
    property CUF: Integer read FCUF write FCUF;
    property CCT: TCTeIntegerComZero read FCCT write FCCT;
    property CFOP: Integer read FCFOP write FCFOP;
    property NatOp: String read FNatOp write FNatOp;
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
    property CMunEnv: Integer read FCMunEnv write FCMunEnv;
    property XMunEnv: String read FXMunEnv write FXMunEnv;
    property UFEnv: String read FUFEnv write FUFEnv;
    property Modal: TCTeIntegerComZero read FModal write FModal;
    property TpServ: Integer read FTpServ write FTpServ;
    property IndIEToma: Integer read FIndIEToma write FIndIEToma;
    property CMunIni: Integer read FCMunIni write FCMunIni;
    property XMunIni: String read FXMunIni write FXMunIni;
    property UFIni: String read FUFIni write FUFIni;
    property CMunFim: Integer read FCMunFim write FCMunFim;
    property XMunFim: String read FXMunFim write FXMunFim;
    property UFFim: String read FUFFim write FUFFim;
    property InfPercurso: TCTeElementItems read FInfPercurso write FInfPercurso;
    property DhCont: TCTeDataHora read FDhCont write FDhCont;
    property XJust: String read FXJust write FXJust;
  end;

implementation

end.

 