unit IBSCBS;

interface

uses
  NfeConsts, NfeTypes, TypInfo;

type
  // ----------------------------------------------------------------------------
  // gDif - Grupo de Diferimento
  // ----------------------------------------------------------------------------
  TGDif = class(TNFeElement)
  private
    FPDif: TNFeFloat4;
    FVDif: TNFeFloat2;
  published
    property PDif: TNFeFloat4 read FPDif write FPDif;
    property VDif: TNFeFloat2 read FVDif write FVDif;
  end;

  // ----------------------------------------------------------------------------
  // gDevTrib - Grupo de Devolução de Tributos
  // ----------------------------------------------------------------------------
  TGDevTrib = class(TNFeElement)
  private
    FVDevTrib: TNFeFloat2;
  published
    property VDevTrib: TNFeFloat2 read FVDevTrib write FVDevTrib;
  end;

  // ----------------------------------------------------------------------------
  // gRed - Grupo de Redução da Alíquota
  // ----------------------------------------------------------------------------
  TGRed = class(TNFeElement)
  private
    FPRedAliq: TNFeFloat4;
    FPAliqEfet: TNFeFloat4;
  published
    property PRedAliq: TNFeFloat4 read FPRedAliq write FPRedAliq;
    property PAliqEfet: TNFeFloat4 read FPAliqEfet write FPAliqEfet;
  end;

  // ----------------------------------------------------------------------------
  // gIBSUF - Grupo de Informações do IBS para a UF
  // ----------------------------------------------------------------------------
  TGIBSUF = class(TNFeElement)
  private
    FPIBSUF: TNFeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVIBSUF: TNFeFloat2;
  published
    property PIBSUF: TNFeFloat4 read FPIBSUF write FPIBSUF;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VIBSUF: TNFeFloat2 read FVIBSUF write FVIBSUF;
  end;

  // ----------------------------------------------------------------------------
  // gIBSMun - Grupo de Informações do IBS para o Município
  // ----------------------------------------------------------------------------
  TGIBSMun = class(TNFeElement)
  private
    FPIBSMun: TNFeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVIBSMun: TNFeFloat2;
  published
    property PIBSMun: TNFeFloat4 read FPIBSMun write FPIBSMun;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VIBSMun: TNFeFloat2 read FVIBSMun write FVIBSMun;
  end;

  // ----------------------------------------------------------------------------
  // gCBS - Grupo de Informações da CBS
  // ----------------------------------------------------------------------------
  TGCBS = class(TNFeElement)
  private
    FPCBS: TNFeFloat4;
    FGDif: TGDif;
    FGDevTrib: TGDevTrib;
    FGRed: TGRed;
    FVCBS: TNFeFloat2;
  published
    property PCBS: TNFeFloat4 read FPCBS write FPCBS;
    property GDif: TGDif read FGDif write FGDif;
    property GDevTrib: TGDevTrib read FGDevTrib write FGDevTrib;
    property GRed: TGRed read FGRed write FGRed;
    property VCBS: TNFeFloat2 read FVCBS write FVCBS;
  end;

  // ----------------------------------------------------------------------------
  // gCredPresIBSZFM - Grupo Crédito Presumido do IBS
  // ----------------------------------------------------------------------------
  TGCredPresIBSZFM = class(TNFeElement)
  private
    FCompetApur: String;
    FTpCredPresIBSZFM: Integer;
    FVCredPresIBSZFM: TNFeFloat4;
  published
    property CompetApur: String read FCompetApur write FCompetApur;
    property TpCredPresIBSZFM: Integer read FTpCredPresIBSZFM write FTpCredPresIBSZFM;
    property VCredPresIBSZFM: TNFeFloat4 read FVCredPresIBSZFM write FVCredPresIBSZFM;
  end;

  // ----------------------------------------------------------------------------
  // gIBSCredPres - Grupo Crédito Presumido do IBS
  // ----------------------------------------------------------------------------
  TGIBSCredPres = class(TNFeElement)
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
  TGCBSCredPres = class(TNFeElement)
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
  TGTribRegular = class(TNFeElement)
  private
    FCSTReg: String;
    FCClassTribReg: String;
    FPAliqEfetRegIBSUF: TNFeFloat4;
    FVTribRegIBSUF: TNFeFloat2;
    FPAliqEfetRegIBSMun: TNFeFloat4;
    FVTribRegIBSMun: TNFeFloat2;
    FPAliqEfetRegCBS: TNFeFloat4;
    FVTribRegCBS: TNFeFloat2;
  published
    property CSTReg: String read FCSTReg write FCSTReg;
    property CClassTribReg: String read FCClassTribReg write FCClassTribReg;
    property PAliqEfetRegIBSUF: TNFeFloat4 read FPAliqEfetRegIBSUF write FPAliqEfetRegIBSUF;
    property VTribRegIBSUF: TNFeFloat2 read FVTribRegIBSUF write FVTribRegIBSUF;
    property PAliqEfetRegIBSMun: TNFeFloat4 read FPAliqEfetRegIBSMun write FPAliqEfetRegIBSMun;
    property VTribRegIBSMun: TNFeFloat2 read FVTribRegIBSMun write FVTribRegIBSMun;
    property PAliqEfetRegCBS: TNFeFloat4 read FPAliqEfetRegCBS write FPAliqEfetRegCBS;
    property VTribRegCBS: TNFeFloat2 read FVTribRegCBS write FVTribRegCBS;
  end;

  // ----------------------------------------------------------------------------
  // TTribCompraGov - Grupo de Compra Governamental
  // ----------------------------------------------------------------------------
  TGTribCompraGov = class(TNFeElement)
  private
    FPAliqIBSUF: TNFeFloat4;
    FVTribIBSUF: TNFeFloat2;
    FPAliqIBSMun: TNFeFloat4;
    FVTribIBSMun: TNFeFloat2;
    FPAliqCBS: TNFeFloat4;
    FVTribCBS: TNFeFloat2;
  published
    property PAliqIBSUF: TNFeFloat4 read FPAliqIBSUF write FPAliqIBSUF;
    property VTribIBSUF: TNFeFloat2 read FVTribIBSUF write FVTribIBSUF;
    property PAliqIBSMun: TNFeFloat4 read FPAliqIBSMun write FPAliqIBSMun;
    property VTribIBSMun: TNFeFloat2 read FVTribIBSMun write FVTribIBSMun;
    property PAliqCBS: TNFeFloat4 read FPAliqCBS write FPAliqCBS;
    property VTribCBS: TNFeFloat2 read FVTribCBS write FVTribCBS;
  end;
  
  

  // ----------------------------------------------------------------------------
  // TAjusteCompet - Ajuste de competência
  // ----------------------------------------------------------------------------
  TGAjusteCompet = class(TNFeElement)
  private
    FCompetApur: String;
    FVIBS: TNFeFloat2;
    FVCBS: TNFeFloat2;
  published
    property CompetApur: String read FCompetApur write FCompetApur;
    property VIBS: TNFeFloat2 read FVIBS write FVIBS;
    property VCBS: TNFeFloat2 read FVCBS write FVCBS;
  end;
  
  

  // ----------------------------------------------------------------------------
  // TGEstornoCred - Estorno de Crédito
  // ----------------------------------------------------------------------------
  TGEstornoCred = class(TNFeElement)
  private
    FVIBSEstCred: TNFeFloat2;
    FVCBSEstCred: TNFeFloat2;
  published
    property VIBSEstCred: TNFeFloat2 read FVIBSEstCred write FVIBSEstCred;
    property VCBSEstCred: TNFeFloat2 read FVCBSEstCred write FVCBSEstCred;
  end;
  
  

  // ----------------------------------------------------------------------------
  // TGCredPresOper - Estorno de Crédito
  // ----------------------------------------------------------------------------
  TGCredPresOper = class(TNFeElement)
  private
    FVBCCredPres: TNFeFloat2;
    FCCredPres: String;
    FGIBSCredPres: TGIBSCredPres;
    FGCBSCredPres: TGCBSCredPres;
  published
    property VBCCredPres: TNFeFloat2 read FVBCCredPres write FVBCCredPres;
    property CCredPres: String read FCCredPres write FCCredPres;
    property GIBSCredPres: TGIBSCredPres read FGIBSCredPres write FGIBSCredPres;
    property GCBSCredPres: TGCBSCredPres read FGCBSCredPres write FGCBSCredPres;
  end;

  // ----------------------------------------------------------------------------
  // gTransfCred - Transferências de Crédito
  // ----------------------------------------------------------------------------
  TGTransfCred = class(TNFeElement)
  private
    FVIBS: TNFeFloat2;
    FVCBS: TNFeFloat2;
  published
    property VIBS: TNFeFloat2 read FVIBS write FVIBS;
    property VCBS: TNFeFloat2 read FVCBS write FVCBS;
  end;

  // UB86 - gIBSMonoAdRem/gMonoPadrao
  TGIBSMonoAdRemPadrao = class(TNFeElement)
  private
    FQBCMono: TNFeFloat4;    // UB86a
    FAdRemIBS: TNFeFloat4;   // UB86b
    FVIBSMono: TNFeFloat2;   // UB86c
  published
    property QBCMono: TNFeFloat4 read FQBCMono write FQBCMono;
    property AdRemIBS: TNFeFloat4 read FAdRemIBS write FAdRemIBS;
    property VIBSMono: TNFeFloat2 read FVIBSMono write FVIBSMono;
  end;
 
  // UB87 - gIBSMonoAdRem/gMonoReten
  TGIBSMonoAdRemReten = class(TNFeElement)
  private
    FQBCMonoReten: TNFeFloat4;   // UB87a
    FAdRemIBSReten: TNFeFloat4;  // UB87b
    FVIBSMonoReten: TNFeFloat2;  // UB87c
  published
    property QBCMonoReten: TNFeFloat4 read FQBCMonoReten write FQBCMonoReten;
    property AdRemIBSReten: TNFeFloat4 read FAdRemIBSReten write FAdRemIBSReten;
    property VIBSMonoReten: TNFeFloat2 read FVIBSMonoReten write FVIBSMonoReten;
  end;
 
  // UB91 - gIBSMonoAdValorem/gMonoPadrao
  TGIBSMonoAdValPadrao = class(TNFeElement)
  private
    FVBCMono: TNFeFloat2;        // UB91a
    FPAliqMonoUF: TNFeFloat4;    // UB91b
    FVIBSMonoUF: TNFeFloat2;     // UB91c
    FPAliqMonoMun: TNFeFloat4;   // UB91d
    FVIBSMonoMun: TNFeFloat2;    // UB91e
    FVIBSMono: TNFeFloat2;       // UB91f (R = vIBSMonoUF + vIBSMonoMun)
  published
    property VBCMono: TNFeFloat2 read FVBCMono write FVBCMono;
    property PAliqMonoUF: TNFeFloat4 read FPAliqMonoUF write FPAliqMonoUF;
    property VIBSMonoUF: TNFeFloat2 read FVIBSMonoUF write FVIBSMonoUF;
    property PAliqMonoMun: TNFeFloat4 read FPAliqMonoMun write FPAliqMonoMun;
    property VIBSMonoMun: TNFeFloat2 read FVIBSMonoMun write FVIBSMonoMun;
    property VIBSMono: TNFeFloat2 read FVIBSMono write FVIBSMono;
  end;
 
  // UB92 - gIBSMonoAdValorem/gMonoReten
  TGIBSMonoAdValReten = class(TNFeElement)
  private
    FVBCMonoReten: TNFeFloat2;     // UB92a
    FPAliqMonoReten: TNFeFloat4;   // UB92b
    FVIBSMonoReten: TNFeFloat2;    // UB92c
  published
    property VBCMonoReten: TNFeFloat2 read FVBCMonoReten write FVBCMonoReten;
    property PAliqMonoReten: TNFeFloat4 read FPAliqMonoReten write FPAliqMonoReten;
    property VIBSMonoReten: TNFeFloat2 read FVIBSMonoReten write FVIBSMonoReten;
  end;
 
  // UB88 / UB93 - gMonoRet (igual em Ad Rem e Ad Valorem)
  TGIBSMonoRet = class(TNFeElement)
  private
    FVIBSMonoRet: TNFeFloat2;    // UB88a / UB93a
  published
    property VIBSMonoRet: TNFeFloat2 read FVIBSMonoRet write FVIBSMonoRet;
  end;
 
  // UB89 / UB94 - gpBioDiferenca (igual em Ad Rem e Ad Valorem)
  // cClassTrib 620004 = valor a recolher ; 620005 = valor a ressarcir
  TGIBSpBioDiferenca = class(TNFeElement)
  private
    FQBCBioComb: TNFeFloat4;      // UB89a / UB94a
    FVIBSDiferenca: TNFeFloat2;   // UB89b / UB94b
  published
    property QBCBioComb: TNFeFloat4 read FQBCBioComb write FQBCBioComb;
    property VIBSDiferenca: TNFeFloat2 read FVIBSDiferenca write FVIBSDiferenca;
  end;
 
  // ----------------------------------------------------------------------------
  // IBS - grupos de modalidade
  // ----------------------------------------------------------------------------
 
  // UB85a - gIBSMonoAdRem
  TGIBSMonoAdRem = class(TNFeElement)
  private
    FGMonoPadrao: TGIBSMonoAdRemPadrao;
    FGMonoReten: TGIBSMonoAdRemReten;
    FGMonoRet: TGIBSMonoRet;
    FGpBioDiferenca: TGIBSpBioDiferenca;
  published
    property GMonoPadrao: TGIBSMonoAdRemPadrao read FGMonoPadrao write FGMonoPadrao;
    property GMonoReten: TGIBSMonoAdRemReten read FGMonoReten write FGMonoReten;
    property GMonoRet: TGIBSMonoRet read FGMonoRet write FGMonoRet;
    property GpBioDiferenca: TGIBSpBioDiferenca read FGpBioDiferenca write FGpBioDiferenca;
  end;
 
  // UB90 - gIBSMonoAdValorem
  TGIBSMonoAdValorem = class(TNFeElement)
  private
    FGMonoPadrao: TGIBSMonoAdValPadrao;
    FGMonoReten: TGIBSMonoAdValReten;
    FGMonoRet: TGIBSMonoRet;
    FGpBioDiferenca: TGIBSpBioDiferenca;
  published
    property GMonoPadrao: TGIBSMonoAdValPadrao read FGMonoPadrao write FGMonoPadrao;
    property GMonoReten: TGIBSMonoAdValReten read FGMonoReten write FGMonoReten;
    property GMonoRet: TGIBSMonoRet read FGMonoRet write FGMonoRet;
    property GpBioDiferenca: TGIBSpBioDiferenca read FGpBioDiferenca write FGpBioDiferenca;
  end;
 
  // ----------------------------------------------------------------------------
  // CBS - grupos folha
  // ----------------------------------------------------------------------------
 
  // UB96 - gCBSMonoAdRem/gMonoPadrao
  TGCBSMonoAdRemPadrao = class(TNFeElement)
  private
    FQBCMono: TNFeFloat4;    // UB96a
    FAdRemCBS: TNFeFloat4;   // UB96b
    FVCBSMono: TNFeFloat2;   // UB96c
  published
    property QBCMono: TNFeFloat4 read FQBCMono write FQBCMono;
    property AdRemCBS: TNFeFloat4 read FAdRemCBS write FAdRemCBS;
    property VCBSMono: TNFeFloat2 read FVCBSMono write FVCBSMono;
  end;
 
  // UB97 - gCBSMonoAdRem/gMonoReten
  TGCBSMonoAdRemReten = class(TNFeElement)
  private
    FQBCMonoReten: TNFeFloat4;   // UB97a
    FAdRemCBSReten: TNFeFloat4;  // UB97b
    FVCBSMonoReten: TNFeFloat2;  // UB97c
  published
    property QBCMonoReten: TNFeFloat4 read FQBCMonoReten write FQBCMonoReten;
    property AdRemCBSReten: TNFeFloat4 read FAdRemCBSReten write FAdRemCBSReten;
    property VCBSMonoReten: TNFeFloat2 read FVCBSMonoReten write FVCBSMonoReten;
  end;
 
  // UB101 - gCBSMonoAdValorem/gMonoPadrao
  TGCBSMonoAdValPadrao = class(TNFeElement)
  private
    FVBCMono: TNFeFloat2;        // UB101a
    FPAliqMonoCBS: TNFeFloat4;   // UB101b
    FVCBSMono: TNFeFloat2;       // UB101c (R)
  published
    property VBCMono: TNFeFloat2 read FVBCMono write FVBCMono;
    property PAliqMonoCBS: TNFeFloat4 read FPAliqMonoCBS write FPAliqMonoCBS;
    property VCBSMono: TNFeFloat2 read FVCBSMono write FVCBSMono;
  end;
 
  // UB102 - gCBSMonoAdValorem/gMonoReten
  TGCBSMonoAdValReten = class(TNFeElement)
  private
    FVBCMonoReten: TNFeFloat2;     // UB102a
    FPAliqMonoReten: TNFeFloat4;   // UB102b
    FVCBSMonoReten: TNFeFloat2;    // UB102c
  published
    property VBCMonoReten: TNFeFloat2 read FVBCMonoReten write FVBCMonoReten;
    property PAliqMonoReten: TNFeFloat4 read FPAliqMonoReten write FPAliqMonoReten;
    property VCBSMonoReten: TNFeFloat2 read FVCBSMonoReten write FVCBSMonoReten;
  end;
 
  // UB98 / UB103 - gMonoRet (igual em Ad Rem e Ad Valorem)
  TGCBSMonoRet = class(TNFeElement)
  private
    FVCBSMonoRet: TNFeFloat2;    // UB98a / UB103a
  published
    property VCBSMonoRet: TNFeFloat2 read FVCBSMonoRet write FVCBSMonoRet;
  end;
 
  // UB99 / UB104 - gpBioDiferenca (igual em Ad Rem e Ad Valorem)
  TGCBSpBioDiferenca = class(TNFeElement)
  private
    FQBCBioComb: TNFeFloat4;      // UB99a / UB104a
    FVCBSDiferenca: TNFeFloat2;   // UB99b / UB104b
  published
    property QBCBioComb: TNFeFloat4 read FQBCBioComb write FQBCBioComb;
    property VCBSDiferenca: TNFeFloat2 read FVCBSDiferenca write FVCBSDiferenca;
  end;
 
  // ----------------------------------------------------------------------------
  // CBS - grupos de modalidade
  // ----------------------------------------------------------------------------
 
  // UB95a - gCBSMonoAdRem
  TGCBSMonoAdRem = class(TNFeElement)
  private
    FGMonoPadrao: TGCBSMonoAdRemPadrao;
    FGMonoReten: TGCBSMonoAdRemReten;
    FGMonoRet: TGCBSMonoRet;
    FGpBioDiferenca: TGCBSpBioDiferenca;
  published
    property GMonoPadrao: TGCBSMonoAdRemPadrao read FGMonoPadrao write FGMonoPadrao;
    property GMonoReten: TGCBSMonoAdRemReten read FGMonoReten write FGMonoReten;
    property GMonoRet: TGCBSMonoRet read FGMonoRet write FGMonoRet;
    property GpBioDiferenca: TGCBSpBioDiferenca read FGpBioDiferenca write FGpBioDiferenca;
  end;
 
  // UB100 - gCBSMonoAdValorem
  TGCBSMonoAdValorem = class(TNFeElement)
  private
    FGMonoPadrao: TGCBSMonoAdValPadrao;
    FGMonoReten: TGCBSMonoAdValReten;
    FGMonoRet: TGCBSMonoRet;
    FGpBioDiferenca: TGCBSpBioDiferenca;
  published
    property GMonoPadrao: TGCBSMonoAdValPadrao read FGMonoPadrao write FGMonoPadrao;
    property GMonoReten: TGCBSMonoAdValReten read FGMonoReten write FGMonoReten;
    property GMonoRet: TGCBSMonoRet read FGMonoRet write FGMonoRet;
    property GpBioDiferenca: TGCBSpBioDiferenca read FGpBioDiferenca write FGpBioDiferenca;
  end;
 
  // ----------------------------------------------------------------------------
  // UB84 - gIBSCBSMono
  // Ordem no XML: gIBSMonoAdRem | gIBSMonoAdValorem (escolha), depois
  //               gCBSMonoAdRem | gCBSMonoAdValorem (escolha), depois totais.
  // ----------------------------------------------------------------------------
  TGIBSCBSMono = class(TNFeElement)
  private
    FGIBSMonoAdRem: TGIBSMonoAdRem;              // UB85a
    FGIBSMonoAdValorem: TGIBSMonoAdValorem;      // UB90
    FGCBSMonoAdRem: TGCBSMonoAdRem;              // UB95a
    FGCBSMonoAdValorem: TGCBSMonoAdValorem;      // UB100
    FVTotIBSMonoItem: TNFeFloat2;                // UB105a
    FVTotCBSMonoItem: TNFeFloat2;                // UB105b
  published
    property GIBSMonoAdRem: TGIBSMonoAdRem read FGIBSMonoAdRem write FGIBSMonoAdRem;
    property GIBSMonoAdValorem: TGIBSMonoAdValorem read FGIBSMonoAdValorem write FGIBSMonoAdValorem;
    property GCBSMonoAdRem: TGCBSMonoAdRem read FGCBSMonoAdRem write FGCBSMonoAdRem;
    property GCBSMonoAdValorem: TGCBSMonoAdValorem read FGCBSMonoAdValorem write FGCBSMonoAdValorem;
    property VTotIBSMonoItem: TNFeFloat2 read FVTotIBSMonoItem write FVTotIBSMonoItem;
    property VTotCBSMonoItem: TNFeFloat2 read FVTotCBSMonoItem write FVTotCBSMonoItem;
  end;

  // ----------------------------------------------------------------------------
  // gIBSCBS - Grupo principal dentro de IBSCBS (gIBSCBS contém IBS e CBS)
  // ----------------------------------------------------------------------------
  TGIBSCBS = class(TNFeElement)
  private
    FVBC: TNFeFloat2;
    FGIBSUF: TGIBSUF;
    FGIBSMun: TGIBSMun;
    FVIBS: TNFeFloat2;
    FGCBS: TGCBS;
    FGTribRegular: TGTribRegular;
    FTribCompraGov: TGTribCompraGov;
    FGIBSCredPres: TGIBSCredPres;
    FGCBSCredPres: TGCBSCredPres;
  published
    property VBC: TNFeFloat2 read FVBC write FVBC;
    property GIBSUF: TGIBSUF read FGIBSUF write FGIBSUF;
    property GIBSMun: TGIBSMun read FGIBSMun write FGIBSMun;
    property VIBS: TNFeFloat2 read FVIBS write FVIBS;
    property GCBS: TGCBS read FGCBS write FGCBS;
    property GTribRegular: TGTribRegular read FGTribRegular write FGTribRegular;
    property GTribCompraGov: TGTribCompraGov read FTribCompraGov write FTribCompraGov;
    property GIBSCredPres: TGIBSCredPres read FGIBSCredPres write FGIBSCredPres;
    property GCBSCredPres: TGCBSCredPres read FGCBSCredPres write FGCBSCredPres;
  end;

  // ----------------------------------------------------------------------------
  // IBSCBS - Classe principal UB12
  // ----------------------------------------------------------------------------
  TIBSCBS = class(TNFeElement)
  private
    FCST: String;
    FCClassTrib: String;
    FIndDoacao: String;
    FGIBSCBS: TGIBSCBS;
    FGIBSCBSMono: TGIBSCBSMono;
    FGTransfCred: TGTransfCred;
    FGAjusteCompet: TGAjusteCompet;
    FGEstornoCred: TGEstornoCred;
    FGCredPresOper: TGCredpresOper;
    FGCredPresIBSZFM: TGCredPresIBSZFM;
  published
    property CST: String read FCST write FCST;
    property CClassTrib: String read FCClassTrib write FCClassTrib;
    property IndDoacao: String read FIndDoacao write FIndDoacao;
    property GIBSCBS: TGIBSCBS read FGIBSCBS write FGIBSCBS;
    property GIBSCBSMono: TGIBSCBSMono read FGIBSCBSMono write FGIBSCBSMono;
    property GTransfCred: TGTransfCred read FGTransfCred write FGTransfCred;
    property GAjusteCompet: TGAjusteCompet read FGAjusteCompet write FGAjusteCompet;
    property GEstornoCred: TGEstornoCred read FGEstornoCred write FGEstornoCred;
    property GCredpresOper: TGCredpresOper read FGCredpresOper write FGCredpresOper;
    property GCredPresIBSZFM: TGCredPresIBSZFM read FGCredPresIBSZFM write FGCredPresIBSZFM;
  end;

implementation

end.
