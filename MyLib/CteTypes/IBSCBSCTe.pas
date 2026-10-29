unit IBSCBSCTe;

interface

uses
  CteConsts, CteTypes, TypInfo;

type
  // ----------------------------------------------------------------------------
  // gDif - Grupo de Diferimento
  // ----------------------------------------------------------------------------
  TGDif = class(TCTeElement)
  private
    FPDif: TCTeFloat4;
    FVDif: TCTeFloat2;
  published
    property PDif: TCTeFloat4 read FPDif write FPDif;
    property VDif: TCTeFloat2 read FVDif write FVDif;
  end;

  // ----------------------------------------------------------------------------
  // gDevTrib - Grupo de Devolução de Tributos
  // ----------------------------------------------------------------------------
  TGDevTrib = class(TCTeElement)
  private
    FVDevTrib: TCTeFloat2;
  published
    property VDevTrib: TCTeFloat2 read FVDevTrib write FVDevTrib;
  end;

  // ----------------------------------------------------------------------------
  // gRed - Grupo de Redução da Alíquota
  // ----------------------------------------------------------------------------
  TGRed = class(TCTeElement)
  private
    FPRedAliq: TCTeFloat4;
    FPAliqEfet: TCTeFloat4;
  published
    property PRedAliq: TCTeFloat4 read FPRedAliq write FPRedAliq;
    property PAliqEfet: TCTeFloat4 read FPAliqEfet write FPAliqEfet;
  end;

  // ----------------------------------------------------------------------------
  // gIBSUF - Grupo de Informações do IBS para a UF
  // ----------------------------------------------------------------------------
  TGIBSUF = class(TCTeElement)
  private
    FPIBSUF: TCTeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVIBSUF: TCTeFloat2;
  published
    property PIBSUF: TCTeFloat4 read FPIBSUF write FPIBSUF;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VIBSUF: TCTeFloat2 read FVIBSUF write FVIBSUF;
  end;

  // ----------------------------------------------------------------------------
  // gIBSMun - Grupo de Informações do IBS para o Município
  // ----------------------------------------------------------------------------
  TGIBSMun = class(TCTeElement)
  private
    FPIBSMun: TCTeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVIBSMun: TCTeFloat2;
  published
    property PIBSMun: TCTeFloat4 read FPIBSMun write FPIBSMun;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VIBSMun: TCTeFloat2 read FVIBSMun write FVIBSMun;
  end;

  // ----------------------------------------------------------------------------
  // gCBS - Grupo de Informações da CBS
  // ----------------------------------------------------------------------------
  TGCBS = class(TCTeElement)
  private
    FPCBS: TCTeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVCBS: TCTeFloat2;
  published
    property PCBS: TCTeFloat4 read FPCBS write FPCBS;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VCBS: TCTeFloat2 read FVCBS write FVCBS;
  end;

  // ----------------------------------------------------------------------------
  // gCredPresIBSZFM - Grupo Crédito Presumido do IBS
  // ----------------------------------------------------------------------------
  TGCredPresIBSZFM = class(TCTeElement)
  private
    FCompetApur: String;
    FTpCredPresIBSZFM: Integer;
    FVCredPresIBSZFM: TCTeFloat4;
  published
    property CompetApur: String read FCompetApur write FCompetApur;
    property TpCredPresIBSZFM: Integer read FTpCredPresIBSZFM write FTpCredPresIBSZFM;
    property VCredPresIBSZFM: TCTeFloat4 read FVCredPresIBSZFM write FVCredPresIBSZFM;
  end;

  // ----------------------------------------------------------------------------
  // gIBSCredPres - Grupo Crédito Presumido do IBS
  // ----------------------------------------------------------------------------
  TGIBSCredPres = class(TCTeElement)
  private
    FCCredPres: String;
    FPCredPres: Double;
    FVCredPres: Double;
    FVCredPresCondSus: Double;
  published
    property CCredPres: String read FCCredPres write FCCredPres;
    property PCredPres: Double read FPCredPres write FPCredPres;
    property VCredPres: Double read FVCredPres write FVCredPres;
    property VCredPresCondSus: Double read FVCredPresCondSus write FVCredPresCondSus;
  end;

  // ----------------------------------------------------------------------------
  // gCBSCredPres - Grupo Crédito Presumido da CBS
  // ----------------------------------------------------------------------------
  TGCBSCredPres = class(TCTeElement)
  private
    FCCredPres: String;
    FPCredPres: Double;
    FVCredPres: Double;
    FVCredPresCondSus: Double;
  published
    property CCredPres: String read FCCredPres write FCCredPres;
    property PCredPres: Double read FPCredPres write FPCredPres;
    property VCredPres: Double read FVCredPres write FVCredPres;
    property VCredPresCondSus: Double read FVCredPresCondSus write FVCredPresCondSus;
  end;

  // ----------------------------------------------------------------------------
  // gTribRegular - Grupo Tributação Regular (caso resolutivo/suspensivo)
  // ----------------------------------------------------------------------------
  TGTribRegular = class(TCTeElement)
  private
    FCSTReg: String;
    FCClassTribReg: String;
    FPAliqEfetRegIBSUF: TCTeFloat4;
    FVTribRegIBSUF: TCTeFloat2;
    FPAliqEfetRegIBSMun: TCTeFloat4;
    FVTribRegIBSMun: TCTeFloat2;
    FPAliqEfetRegCBS: TCTeFloat4;
    FVTribRegCBS: TCTeFloat2;
  published
    property CSTReg: String read FCSTReg write FCSTReg;
    property CClassTribReg: String read FCClassTribReg write FCClassTribReg;
    property PAliqEfetRegIBSUF: TCTeFloat4 read FPAliqEfetRegIBSUF write FPAliqEfetRegIBSUF;
    property VTribRegIBSUF: TCTeFloat2 read FVTribRegIBSUF write FVTribRegIBSUF;
    property PAliqEfetRegIBSMun: TCTeFloat4 read FPAliqEfetRegIBSMun write FPAliqEfetRegIBSMun;
    property VTribRegIBSMun: TCTeFloat2 read FVTribRegIBSMun write FVTribRegIBSMun;
    property PAliqEfetRegCBS: TCTeFloat4 read FPAliqEfetRegCBS write FPAliqEfetRegCBS;
    property VTribRegCBS: TCTeFloat2 read FVTribRegCBS write FVTribRegCBS;
  end;

  // ----------------------------------------------------------------------------
  // TTribCompraGov - Grupo de Compra Governamental
  // ----------------------------------------------------------------------------
  TGTribCompraGov = class(TCTeElement)
  private
    FPAliqIBSUF: TCTeFloat4;
    FVTribIBSUF: TCTeFloat2;
    FPAliqIBSMun: TCTeFloat4;
    FVTribIBSMun: TCTeFloat2;
    FPAliqCBS: TCTeFloat4;
    FVTribCBS: TCTeFloat2;
  published
    property PAliqIBSUF: TCTeFloat4 read FPAliqIBSUF write FPAliqIBSUF;
    property VTribIBSUF: TCTeFloat2 read FVTribIBSUF write FVTribIBSUF;
    property PAliqIBSMun: TCTeFloat4 read FPAliqIBSMun write FPAliqIBSMun;
    property VTribIBSMun: TCTeFloat2 read FVTribIBSMun write FVTribIBSMun;
    property PAliqCBS: TCTeFloat4 read FPAliqCBS write FPAliqCBS;
    property VTribCBS: TCTeFloat2 read FVTribCBS write FVTribCBS;
  end;



  // ----------------------------------------------------------------------------
  // TAjusteCompet - Ajuste de competência
  // ----------------------------------------------------------------------------
  TGAjusteCompet = class(TCTeElement)
  private
    FCompetApur: String;
    FVIBS: TCTeFloat2;
    FVCBS: TCTeFloat2;
  published
    property CompetApur: String read FCompetApur write FCompetApur;
    property VIBS: TCTeFloat2 read FVIBS write FVIBS;
    property VCBS: TCTeFloat2 read FVCBS write FVCBS;
  end;



  // ----------------------------------------------------------------------------
  // TGEstornoCred - Estorno de Crédito
  // ----------------------------------------------------------------------------
  TGEstornoCred = class(TCTeElement)
  private
    FVIBSEstCred: TCTeFloat2;
    FVCBSEstCred: TCTeFloat2;
  published
    property VIBSEstCred: TCTeFloat2 read FVIBSEstCred write FVIBSEstCred;
    property VCBSEstCred: TCTeFloat2 read FVCBSEstCred write FVCBSEstCred;
  end;



  // ----------------------------------------------------------------------------
  // TGCredPresOper - Estorno de Crédito
  // ----------------------------------------------------------------------------
  TGCredPresOper = class(TCTeElement)
  private
    FVBCCredPres: TCTeFloat2;
    FCCredPres: String;
    FGIBSCredPres: TGIBSCredPres;
    FGCBSCredPres: TGCBSCredPres;
  published
    property VBCCredPres: TCTeFloat2 read FVBCCredPres write FVBCCredPres;
    property CCredPres: String read FCCredPres write FCCredPres;
    property GIBSCredPres: TGIBSCredPres read FGIBSCredPres write FGIBSCredPres;
    property GCBSCredPres: TGCBSCredPres read FGCBSCredPres write FGCBSCredPres;
  end;

  // ----------------------------------------------------------------------------
  // gIBSCBS - Grupo principal dentro de IBSCBS (gIBSCBS contém IBS e CBS)
  // ----------------------------------------------------------------------------
  TGIBSCBS = class(TCTeElement)
  private
    FVBC: TCTeFloat2;
    FGIBSUF: TGIBSUF;
    FGIBSMun: TGIBSMun;
    FVIBS: TCTeFloat2;
    FGCBS: TGCBS;
    FGTribRegular: TGTribRegular;
    FTribCompraGov: TGTribCompraGov;
    FGIBSCredPres: TGIBSCredPres;
    FGCBSCredPres: TGCBSCredPres;
  published
    property VBC: TCTeFloat2 read FVBC write FVBC;
    property GIBSUF: TGIBSUF read FGIBSUF write FGIBSUF;
    property GIBSMun: TGIBSMun read FGIBSMun write FGIBSMun;
    property VIBS: TCTeFloat2 read FVIBS write FVIBS;
    property GCBS: TGCBS read FGCBS write FGCBS;
    property GTribRegular: TGTribRegular read FGTribRegular write FGTribRegular;
    property GTribCompraGov: TGTribCompraGov read FTribCompraGov write FTribCompraGov;
    property GIBSCredPres: TGIBSCredPres read FGIBSCredPres write FGIBSCredPres;
    property GCBSCredPres: TGCBSCredPres read FGCBSCredPres write FGCBSCredPres;
  end;

  // ----------------------------------------------------------------------------
  // IBSCBS - Classe principal UB12
  // ----------------------------------------------------------------------------
  TIBSCBS = class(TCTeElement)
  private
    FCST: String;
    FCClassTrib: String;
    FIndDoacao: String;
    FGIBSCBS: TGIBSCBS;
    FGEstornoCred: TGEstornoCred;
  published
    property CST: String read FCST write FCST;
    property CClassTrib: String read FCClassTrib write FCClassTrib;
    property IndDoacao: String read FIndDoacao write FIndDoacao;
    property GIBSCBS: TGIBSCBS read FGIBSCBS write FGIBSCBS;
    property GEstornoCred: TGEstornoCred read FGEstornoCred write FGEstornoCred;
  end;

implementation

end.
