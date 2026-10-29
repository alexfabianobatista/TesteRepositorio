unit IdeMdfe;

interface

uses
  MdfeTypes, EnvolvidoMdfe, TypInfo;
type
  TInfMunCarrega = class(TMDFeElement)
  protected
    FCMunCarrega: Integer;
    FXMunCarrega: String;
  published
    property CMunCarrega: Integer read FCMunCarrega write FCMunCarrega;
    property XMunCarrega: String read FXMunCarrega write FXMunCarrega;
  end;
  TInfPercurso = class(TMDFeElement)
  protected
    FUFPer: String;
  published
    property UFPer: String read FUFPer write FUFPer;
  end;
  TIde = class(TMDFeElement)
  protected
    FCUF: Integer;
    FTpAmb: Integer;
    FTpEmit: Integer;
    FTpTransp: Integer;
    FMod: Integer;
    FSerie: Integer;
    FCFOP: Integer;
    FNatOp: String;
    FForPag: Integer;
    FNMDF: Integer;
    FCMDF: TMDFeIntegerComZero;
    FCDV: Integer;
    FModal: Integer;
    FDhEmi: String;
    FTpEmis: Integer;
    FProcEmi: Integer;
    FVerProc: String;
    FUFIni: String;
    FUFFim: String;
    FInfMunCarrega: TMDFeElementItems;
    FInfPercurso: TMDFeElementItems;
  published
    property CUF: Integer read FCUF write FCUF;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property TpEmit: Integer read FTpEmit write FTpEmit;
    property TpTransp: Integer read FTpTransp write FTpTransp;
    property Mod_: Integer read FMod write FMod;
    property Serie: Integer read FSerie write FSerie;
    property NMDF: Integer read FNMDF write FNMDF;
    property CMDF: TMDFeIntegerComZero read FCMDF write FCMDF;
    property CDV: Integer read FCDV write FCDV;
    property Modal: Integer read FModal write FModal;
    property DhEmi: String read FDhEmi write FDhEmi;
    property TpEmis: Integer read FTpEmis write FTpEmis;
    property ProcEmi: Integer read FProcEmi write FProcEmi;
    property VerProc: String read FVerProc write FVerProc;
    property UFIni: String read FUFIni write FUFIni;
    property UFFim: String read FUFFim write FUFFim;
    property InfMunCarrega: TMDFeElementItems read FInfMunCarrega write FInfMunCarrega;
    property InfPercurso: TMDFeElementItems read FInfPercurso write FInfPercurso;
  end;

implementation

end.


