unit InfCarga;

interface

uses
  CteTypes;

type
  TInfQ = class(TCTeElementNoEmptys)
  protected
    FCUnid: TCTeIntegerComZero;
    FTpMed: String;
    FQCarga: TCTeFloat4;
  published
    property CUnid: TCTeIntegerComZero read FCUnid write FCUnid;
    property TpMed: String read FTpMed write FTpMed;
    property QCarga: TCTeFloat4 read FQCarga write FQCarga;
  end;
  TInfCarga = class(TCTeElement)
  protected
    FVCarga: TCTeFloat2;
    FProPred: String;
    FXOutCat: String;
    FInfQ: TCTeElementItems;
    FVCargaAverb: TCTeFloat2;
  published
    property VCarga: TCTeFloat2 read FVCarga write FVCarga;
    property ProPred: String read FProPred write FProPred;
    property XOutCat: String read FXOutCat write FXOutCat;
    property InfQ: TCTeElementItems read FInfQ write FInfQ;
    property VCargaAverb: TCTeFloat2 read FVCargaAverb write FVCargaAverb;
  end;

implementation

end.
 