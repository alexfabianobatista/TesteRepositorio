unit InfCTeNorm;

interface

uses
  CteTypes, Envolvido, TypInfo, Cobr, InfCarga, DocAnt, TomaICMS, Rodo, RodoOS;
  
type
  TSeg = class(TCTeElementNoEmptys)
  protected
    FRespSeg: String;
    FXSeg: String;
    FNApol: String;
    FNAver: String;
    FVCarga: TCTeFloat2;
  published
    property RespSeg: String read FRespSeg write FRespSeg;
    property XSeg: String read FXSeg write FXSeg;
    property NApol: String read FNApol write FNApol;
    property NAver: String read FNAver write FNAver;
    property VCarga: TCTeFloat2 read FVCarga write FVCarga;
  end;
  TPeri = class(TCTeElement)
  protected
    FNONU: String;
    FXNomeAE: String;
    FXClaRisco: String;
    FGrEmb: String;
    FQTotProd: String;
    FQVolTipo: String;
    FPontoFulgor: String;
  published
    property NONU: String read FNONU write FNONU;
    property XNomeAE: String read FXNomeAE write FXNomeAE;
    property XClaRisco: String read FXClaRisco write FXClaRisco;
    property GrEmb: String read FGrEmb write FGrEmb;
    property QTotProd: String read FQTotProd write FQTotProd;
    property QVolTipo: String read FQVolTipo write FQVolTipo;
    property PontoFulgor: String read FPontoFulgor write FPontoFulgor;
  end;
  TInfModal = class(TCTeElement)
  protected
    FVersaoModal: String;
    FRodo: TRodo;
    FRodoOS: TRodoOS;
  published
    property VersaoModal: String read FVersaoModal write FVersaoModal;
    property Rodo: TRodo read FRodo write FRodo;
    property RodoOS: TRodoOS read FRodoOS write FRodoOS;
  end;
  TVeicNovos = class(TCTeElement)
  protected
    FChassi: String;
    FCCor: String;
    FXCor: String;
    FCMod: String;
    FVUnit: TCTeFloat2;
    FVFrete: TCTeFloat2;
  published
    property Chassi: String read FChassi write FChassi;
    property CCor: String read FCCor write FCCor;
    property XCor: String read FXCor write FXCor;
    property CMod: String read FCMod write FCMod;
    property VUnit: TCTeFloat2 read FVUnit write FVUnit;
    property VFrete: TCTeFloat2 read FVFrete write FVFrete;
  end;

  TInfCteSub = class(TCTeElementNoEmptys)
  protected
    FChCte: String;
    FRefCteAnu: String;
    FTomaICMS: TTomaICMS;
    FTomaNaoICMS: TTomaNaoICMS;
    FIndAlteraToma: Integer;
  published
    property ChCte: String read FChCte write FChCte;
    property RefCteAnu: String read FRefCteAnu write FRefCteAnu;
    property TomaICMS: TTomaICMS read FTomaICMS write FTomaICMS;
    property TomaNaoICMS: TTomaNaoICMS read FTomaNaoICMS write FTomaNaoICMS;
    property IndAlteraToma: Integer read FIndAlteraToma write FIndAlteraToma;
  end;
  TInfNF = class(TCTeElement)
  protected
    FNRoma: String;
    FNPed: String;
    FMod: TCTeIntegerComZero;
    FSerie: String;
    FNDoc: String;
    FDEmi: TCTeData;
    FVBC: TCTeFloat2;
    FVICMS: TCTeFloat2;
    FVBCST: TCTeFloat2;
    FVST: TCTeFloat2;
    FVProd: TCTeFloat2;
    FVNF: TCTeFloat2;
    FNCFOP: Integer;
    FNPeso: TCTeFloat3;
    FPIN: String;
    FLocRet: TLocal;
    FDPrev: TCTeData;
  published
    property NRoma: String read FNRoma write FNRoma;
    property NPed: String read FNPed write FNPed;
    property Mod_: TCTeIntegerComZero read FMod write FMod;
    property Serie: String read FSerie write FSerie;
    property NDoc: String read FNDoc write FNDoc;
    property DEmi: TCTeData read FDEmi write FDEmi;
    property VBC: TCTeFloat2 read FVBC write FVBC;
    property VICMS: TCTeFloat2 read FVICMS write FVICMS;
    property VBCST: TCTeFloat2 read FVBCST write FVBCST;
    property VST: TCTeFloat2 read FVST write FVST;
    property VProd: TCTeFloat2 read FVProd write FVProd;
    property VNF: TCTeFloat2 read FVNF write FVNF;
    property NCFOP: Integer read FNCFOP write FNCFOP;
    property NPeso: TCTeFloat3 read FNPeso write FNPeso;
    property PIN: String read FPIN write FPIN;
    property LocRet: TLocal read FLocRet write FLocRet;
    property DPrev: TCTeData read FDPrev write FDPrev;
  end;
  TInfNFe = class(TCTeElement)
  protected
    FChave: String;
    FPIN: String;
    FDPrev: TCTeData;
  published
    property Chave: String read FChave write FChave;
    property PIN: String read FPIN write FPIN;
    property DPrev: TCTeData read FDPrev write FDPrev;
  end;
  TInfOutros = class(TCTeElementNoEmptys)
  protected
    FTpDoc: TCTeIntegerComZero;
    FDescOutros: String;
    FNDoc: String;
    FDEmi: TCTeData;
    FVDocFisc: TCTeFloat2;
    FDPrev: TCTeData;
  published
    property TpDoc: TCTeIntegerComZero read FTpDoc write FTpDoc;
    property DescOutros: String read FDescOutros write FDescOutros;
    property NDoc: String read FNDoc write FNDoc;
    property DEmi: TCTeData read FDEmi write FDEmi;
    property VDocFisc: TCTeFloat2 read FVDocFisc write FVDocFisc;
    property DPrev: TCTeData read FDPrev write FDPrev;
  end;
  TInfDoc = class(TCTeElement)
  protected
    FInfNF: TCTeElementItems;
    FInfNFe: TCTeElementItems;
    FInfOutros: TCTeElementItems;
  published
    property InfNF: TCTeElementItems read FInfNF write FInfNF;
    property InfNFe: TCTeElementItems read FInfNFe write FInfNFe;
    property InfOutros: TCTeElementItems read FInfOutros write FInfOutros;
  end;
  TInfDocRef = class(TCTeElementNoEmptys)
  protected
    FNDoc: String;
    FSerie: String;
    FSubSerie: String;
    FDEmi: TCTeData;
    FVDoc: TCTeFloat2;
  published
    property NDoc: String read FNDoc write FNDoc;
    property Serie: String read FSerie write FSerie;
    property SubSerie: String read FSubSerie write FSubSerie;
    property DEmi: TCTeData read FDEmi write FDEmi;
    property VDoc: TCTeFloat2 read FVDoc write FVDoc;
  end;
  TInfServico = class(TCTeElement)
  protected
    FXDescServ: String;
    FInfQ: TInfQ;
  published
    property XDescServ: String read FXDescServ write FXDescServ;
    property InfQ: TInfQ read FInfQ write FInfQ;
  end;
  TInfGlobalizado = class(TCTeElement)
  protected
    FXObs: string;
  published
    property XObs: string read FXObs write FXObs;
  end;
  TInfCTeMultimodal = class(TCTeElement)
  protected
    FChCTeMultimodal: string;
  published
    property ChCTeMultimodal: string read FChCTeMultimodal write FChCTeMultimodal;
  end;
  TInfServVinc = class(TCTeElement)
  protected
    FInfCTeMultimodal: TCTeElementItems;
  published
    property InfCTeMultimodal: TCTeElementItems read FInfCTeMultimodal write FInfCTeMultimodal;
  end;
  TInfCTeNorm = class(TCTeElement)
  protected
    FInfServico: TInfServico;  //CT-e OS
    FInfDocRef: TCTeElementItems;    //CT-e OS
    FInfCarga: TInfCarga;
    FInfDoc: TInfDoc;
    FDocAnt: TDocAnt;
    FSeg: TCTeElementItems;    //Comum
    FInfModal: TInfModal;
    FPeri: TCTeElementItems;
    FVeicNovos: TCTeElementItems;
    FCobr: TCobr;
    FInfCteSub: TInfCteSub;
    FInfGlobalizado: TInfGlobalizado;
    FInfServVinc: TInfServVinc;
  published
    property InfServico: TInfServico read FInfServico write FInfServico;
    property InfDocRef: TCTeElementItems read FInfDocRef write FInfDocRef;
    property InfCarga: TInfCarga read FInfCarga write FInfCarga;
    property InfDoc: TInfDoc read FInfDoc write FInfDoc;
    property DocAnt: TDocAnt read FDocAnt write FDocAnt;
    property Seg: TCTeElementItems read FSeg write FSeg;
    property InfModal: TInfModal read FInfModal write FInfModal;
    property Peri: TCTeElementItems read FPeri write FPeri;
    property VeicNovos: TCTeElementItems read FVeicNovos write FVeicNovos;
    property Cobr: TCobr read FCobr write FCobr;
    property InfCteSub: TInfCteSub read FInfCteSub write FInfCteSub;
    property InfGlobalizado: TInfGlobalizado read FInfGlobalizado write FInfGlobalizado;

  end;
implementation


end.
