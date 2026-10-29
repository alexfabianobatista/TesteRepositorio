unit InfDoc;

interface

uses
  MdfeTypes;

type
  TLacUnidCarga = class(TMDFeElement)
  protected
    FNLacre: String;
  published
    property NLacre: String read FNLacre write FNLacre;
  end;
  TInfUnidCarga = class(TMDFeElement)
  protected
    FTpUnidCarga: Integer;
    FIdUnidCarga: String;
    FLacUnidCarga: TMDFeElementItems;
    FQtdRat: TMDFeFloat2;
  published
    property TpUnidCarga: Integer read FTpUnidCarga write FTpUnidCarga;
    property IdUnidCarga: String read FIdUnidCarga write FIdUnidCarga;
    property LacUnidCarga: TMDFeElementItems read FLacUnidCarga write FLacUnidCarga;
    property QtdRat: TMDFeFloat2 read FQtdRat write FQtdRat;
  end;
  TLacUnidTransp = class(TMDFeElement)
  protected
    FNLacre: String;

  published
    property NLacre: String read FNLacre write FNLacre;
  end;
  TInfUnidTransp = class(TMDFeElement)
  protected
    FTpUnidTransp: Integer;
    FIdUnidTransp: String;
    FLacUnidTransp: TMDFeElementItems;
    FInfUnidCarga: TMDFeElementItems;
    FQtdRat: TMDFeFloat2;
  published
    property TpUnidTransp: Integer read FTpUnidTransp write FTpUnidTransp;
    property IdUnidTransp: String read FIdUnidTransp write FIdUnidTransp;
    property LacUnidTransp: TMDFeElementItems read FLacUnidTransp write FLacUnidTransp;
    property InfUnidCarga: TMDFeElementItems read FInfUnidCarga write FInfUnidCarga;
    property QtdRat: TMDFeFloat2 read FQtdRat write FQtdRat;
  end;
  TInfCTe = class(TMDFeElementNoEmptys)
  protected
    FChCTe: String;
    FSegCodBarra: String;
    FInfUnidTranp: TMDFeElementItems;
  published
    property ChCTe: String read FChCTe write FChCTe;
    property SegCodBarra: String read FSegCodBarra write FSegCodBarra;
    property InfUnidTranp: TMDFeElementItems read FInfUnidTranp write FInfUnidTranp;
  end;
  TInfCT = class(TMDFeElementNoEmptys)
  protected
    FNCT: String;
    FSerie: Integer;
    FSubser: Integer;
    FDEmi: TMDFeData;
    FVCarga: TMDFeFloat2;
    FInfUnidTransp: TMDFeElementItems;
  published  
    property NCT: String read FNCT write FNCT;
    property Serie: Integer read FSerie write FSerie;
    property Subser: Integer read FSubser write FSubser;
    property DEmi: TMDFeData read FDEmi write FDEmi;
    property VCarga: TMDFeFloat2 read FVCarga write FVCarga;
    property InfUnidTransp: TMDFeElementItems read FInfUnidTransp write FInfUnidTransp;
  end;
  TInfNFe = class(TMDFeElementNoEmptys)
  protected
    FChNFe: String;
    FSegCodBarra: String;
    FInfUnidTranp: TMDFeElementItems;
  published
    property ChNFe: String read FChNFe write FChNFe;
    property SegCodBarra: String read FSegCodBarra write FSegCodBarra;
    property InfUnidTranp: TMDFeElementItems read FInfUnidTranp write FInfUnidTranp;
  end;
  TInfNF = class(TMDFeElementNoEmptys)
  protected
    FCNPJ: TMDFeIntegerComZero;
    FUF: String;
    FNNF: String;
    FSerie: String;
    FDEmi: TMDFeData;
    FVNF: TMDFeFloat2;
    FPIN: String;
    FInfUnidTransp: TMDFeElementItems;
  published
    property CNPJ: TMDFeIntegerComZero read FCNPJ write FCNPJ;
    property UF: String read FUF write FUF;
    property NNF: String read FNNF write FNNF;
    property Serie: String read FSerie write FSerie;
    property DEmi: TMDFeData read FDEmi write FDEmi;
    property VNF: TMDFeFloat2 read FVNF write FVNF;
    property PIN: String read FPIN write FPIN;
    property InfUnidTransp: TMDFeElementItems read FInfUnidTransp write FInfUnidTransp;
  end;
  TInfMDFeTransp = class(TMDFeElement)
  protected
    FChMDFe: String;
    FInfUnidTranp: TMDFeElementItems;
  published
    property ChMDFe: String read FChMDFe write FChMDFe;
    property InfUnidTranp: TMDFeElementItems read FInfUnidTranp write FInfUnidTranp;
  end;
  TInfMunDescarga = class(TMDFeElement)
  protected
    FCMunDescarga: Integer;
    FXMunDescarga: String;
    FInfCTe: TMDFeElementItems;
    FInfCT: TMDFeElementItems;
    FInfNFe: TMDFeElementItems;
    FInfNF: TMDFeElementItems;
    FInfMDFe: TMDFeElementItems;
  published
    property CMunDescarga: Integer read FCMunDescarga write FCMunDescarga;
    property XMunDescarga: String read FXMunDescarga write FXMunDescarga;
    property InfCTe: TMDFeElementItems read FInfCTe write FInfCTe;
    property InfCT: TMDFeElementItems read FInfCT write FInfCT;
    property InfNFe: TMDFeElementItems read FInfNFe write FInfNFe;
    property InfNF: TMDFeElementItems read FInfNF write FInfNF;
    property InfMDFe: TMDFeElementItems read FInfMDFe write FInfMDFe;
  end;
  
  TInfDoc = class(TMDFeElement)
  protected
    FInfMunDescarga: TMDFeElementItems;
  published
    property InfMunDescarga: TMDFeElementItems read FInfMunDescarga write FInfMunDescarga;
  end;

implementation

end.
