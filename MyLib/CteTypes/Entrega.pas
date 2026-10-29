unit Entrega;

interface

uses
  CteTypes;

type
  TSemData = class(TCTeElementNoEmptys)
  protected
    FTpPer: Integer;
  published
    property TpPer: Integer read FTpPer write FTpPer;
  end;
  TComData = class(TCTeElementNoEmptys)
  protected
    FTpPer: Integer;
    FDProg: TCTeData;
  published
    property TpPer: Integer read FTpPer write FTpPer;
    property DProg: TCTeData read FDProg write FDProg;
  end;
  TNoPeriodo = class(TCTeElementNoEmptys)
  protected
    FTpPer: Integer;
    FDIni: TCTeData;
    FDFim: TCTeData;
  published
    property TpPer: Integer read FTpPer write FTpPer;
    property DIni: TCTeData read FDIni write FDIni;
    property DFim: TCTeData read FDFim write FDFim;
  end;
  TSemHora = class(TCTeElementNoEmptys)
  protected
    FTpHor: Integer;
  published
    property TpHor: Integer read FTpHor write FTpHor;
  end;
  TComHora = class(TCTeElementNoEmptys)
  protected
    FTpHor: Integer;
    FHProg: TCTeData;
  published
    property TpHor: Integer read FTpHor write FTpHor;
    property DHrog: TCTeData read FHProg write FHProg;
  end;
  TNoInter = class(TCTeElementNoEmptys)
  protected
    FTpHor: Integer;
    FHIni: TCTeData;
    FHFim: TCTeData;
  published
    property TpHor: Integer read FTpHor write FTpHor;
    property HIni: TCTeData read FHIni write FHIni;
    property HFim: TCTeData read FHFim write FHFim;
  end;
  TEntrega = class(TCTeElementNoEmptys)
  private
  protected
    FSemData: TSemData;
    FComData: TComData;
    FNoPeriodo: TNoPeriodo;
    FSemHora: TSemHora;
    FComHora: TComHora;
    FNoInter: TNoInter;
  published
    property SemData: TSemData read FSemData write FSemData;
    property ComData: TComData read FComData write FComData;
    property NoPeriodo: TNoPeriodo read FNoPeriodo write FNoPeriodo;
    property SemHora: TSemHora read FSemHora write FSemHora;
    property ComHora: TComHora read FComHora write FComHora;
    property NoInter: TNoInter read FNoInter write FNoInter;
  end;

implementation

end.
