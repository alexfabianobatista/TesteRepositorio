unit ICMS;

interface

uses
  NfeConsts, NfeTypes, TypInfo;

type
  TICMS = class(TNFeElement)
  private
  protected
    FCST: TCST;
    FOrig: Integer;
    FCSOSN: Integer;
  public
    constructor Create(CST_CSOSN: Integer; CSOSN: boolean = false);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Orig: Integer read FOrig write FOrig;
    property CST: TCST read FCST;
    property CSOSN: Integer read FCSOSN write FCSOSN;
  end;

  TICMSImposto = class(TNFeElement)
  protected
    FIcms: TICMS;
    function GetXMLName(Prop: TPropInfo): String; override;
  published
    property Icms: TICMS read FIcms write FIcms;
  end;

  TICMS00 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FPICMS: Extended;
    FVBC: Extended;
    FVICMS: Extended;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property VBC: Extended read FVBC write FVBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
  end;       

  TICMS02 = class(TICMS)
  private
  protected
    FQBCMono: TNFeFloat4;
    FAdRemICMS: TNFeFloat2;
    FVICMSMono: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCMono: TNFeFloat4 read FQBCMono write FQBCMono;
    property AdRemICMS: TNFeFloat2 read FAdRemICMS write FAdRemICMS;
    property VICMSMono: TNFeFloat2 read FVICMSMono write FVICMSMono;
  end;

  TICMS10 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FModBCST: Integer;
    FPICMS: Extended;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBCST: Extended;
    FVBC: Extended;
    FVBCST: Extended;
    FVICMS: Extended;
    FVBCFCP: TNFeFloat2;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property VBC: Extended read FVBC write FVBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property VBCFCP: TNFeFloat2 read FVBCFCP write FVBCFCP;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
  end;

  TICMS15 = class(TICMS)
  private
  protected
    FQBCMono: TNFeFloat4;
    FAdRemICMS: TNFeFloat2;
    FVICMSMono: TNFeFloat2;
    FQBCMonoReten: TNFeFloat4;
    FAdRemICMSReten: TNFeFloat2;
    FVICMSMonoReten: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCMono: TNFeFloat4 read FQBCMono write FQBCMono;
    property AdRemICMS: TNFeFloat2 read FAdRemICMS write FAdRemICMS;
    property VICMSMono: TNFeFloat2 read FVICMSMono write FVICMSMono;
    property QBCMonoReten: TNFeFloat4 read FQBCMonoReten write FQBCMonoReten;
    property AdRemICMSReten: TNFeFloat2 read FAdRemICMSReten write FAdRemICMSReten;
    property VICMSMonoReten: TNFeFloat2 read FVICMSMonoReten write FVICMSMonoReten;
  end;

  TICMS20 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FPRedBC: Extended;
    FVBC: Extended;
    FPICMS: Extended;
    FVICMS: Extended;
    FVBCFCP: TNFeFloat2;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
    FVICMSDeson: TNFeFloat2;
    FMotDesICMS: Integer;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property VBC: Extended read FVBC write FVBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property VBCFCP: TNFeFloat2 read FVBCFCP write FVBCFCP;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property MotDesICMS: Integer read FMotDesICMS write FMotDesICMS;
  end;

  TICMS30 = class(TICMS)
  private
  protected
    FModBCST: Integer;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
    FVICMSDeson: TNFeFloat2;
    FMotDesICMS: Integer;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property MotDesICMS: Integer read FMotDesICMS write FMotDesICMS;
  end;

  TICMS40 = class(TICMS)
  private
  protected
    FVICMSDeson: TNFeFloat2;
    FMotDesICMS: Integer;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    constructor Create(CST: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property MotDesICMS: Integer read FMotDesICMS write FMotDesICMS;
  end;

  TICMS51 = class(TICMS)
  private
  protected
    FModBC: Integer; 
    FPRedBC: Extended;
    FVBC: Extended;
    FPICMS: Extended;
    FVICMSOp: TNFeFloat2;
    FPDif: TNFeFloat4;
    FVICMSDif: TNFeFloat2;
    FVICMS: Extended;
    FVBCFCP: TNFeFloat2;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property VBC: Extended read FVBC write FVBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMSOp: TNFeFloat2 read FVICMSOp write FVICMSOp;
    property PDif: TNFeFloat4 read FPDif write FPDif;
    property VICMSDif: TNFeFloat2 read FVICMSDif write FVICMSDif;
    property VICMS: Extended read FVICMS write FVICMS;
    property VBCFCP: TNFeFloat2 read FVBCFCP write FVBCFCP;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
  end;

  TICMS53 = class(TICMS)
  private
  protected
    FQBCMono: TNFeFloat4;
    FAdRemICMS: TNFeFloat2;
    FVICMSMonoOp: TNFeFloat2;
    FPDif: TNFeFloat2;
    FVICMSMono: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCMono: TNFeFloat4 read FQBCMono write FQBCMono;
    property AdRemICMS: TNFeFloat2 read FAdRemICMS write FAdRemICMS;
    property VICMSMonoOp: TNFeFloat2 read FVICMSMonoOp write FVICMSMonoOp;
    property PDif: TNFeFloat2 read FPDif write FPDif;
    property VICMSMono: TNFeFloat2 read FVICMSMono write FVICMSMono;
  end;

  TICMS60 = class(TICMS)
  private
  protected
    FVBCST: Extended;
    FVICMSST: Extended;
    FVBCSTRet: Extended;
    FPST: TNFeFloat2;
    FVICMSSTRet: Extended;
    FVBCFCPSTRet: TNFeFloat2;
    FPFCPSTRet: TNFeFloat4;
    FVFCPSTRet: TNFeFloat2;
    FPRedBCEfet: TNFeFloat4;
    FVBCEfet: TNFeFloat2;
    FPICMSEfet: TNFeFloat4;
    FVICMSEfet: TNFeFloat2;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCST: Extended read FVBCST write FVBCST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCSTRet: Extended read FVBCSTRet write FVBCSTRet;
    property PST: TNFeFloat2 read FPST write FPST;
    property VICMSSTRet: Extended read FVICMSSTRet write FVICMSSTRet;
    property VBCFCPSTRet: TNFeFloat2 read FVBCFCPSTRet write FVBCFCPSTRet;
    property PFCPSTRet: TNFeFloat4 read FPFCPSTRet write FPFCPSTRet;
    property VFCPSTRet: TNFeFloat2 read FVFCPSTRet write FVFCPSTRet;
    property PRedBCEfet: TNFeFloat4 read FPRedBCEfet write FPRedBCEfet;
    property VBCEfet: TNFeFloat2 read FVBCEfet write FVBCEfet;
    property PICMSEfet: TNFeFloat4 read FPICMSEfet write FPICMSEfet;
    property VICMSEfet: TNFeFloat2 read FVICMSEfet write FVICMSEfet;
  end;

  TICMS61 = class(TICMS)
  private
  protected
    FQBCMonoRet: TNFeFloat4;
    FAdRemICMSRet: TNFeFloat4;
    FVICMSMonoRet: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCMonoRet: TNFeFloat4 read FQBCMonoRet write FQBCMonoRet;
    property AdRemICMSRet: TNFeFloat4 read FAdRemICMSRet write FAdRemICMSRet;
    property VICMSMonoRet: TNFeFloat2 read FVICMSMonoRet write FVICMSMonoRet;
  end;

  TICMS70 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FModBCST: Integer;
    FPICMS: Extended;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBC: Extended;
    FPRedBCST: Extended;
    FVBC: Extended;
    FVBCST: Extended;
    FVICMS: Extended;
    FVBCFCP: TNFeFloat2;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
    FVICMSDeson: TNFeFloat2;
    FMotDesICMS: Integer;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property VBC: Extended read FVBC write FVBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property VBCFCP: TNFeFloat2 read FVBCFCP write FVBCFCP;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property MotDesICMS: Integer read FMotDesICMS write FMotDesICMS;
  end;

  TICMS90 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FModBCST: Integer;
    FPICMS: Extended;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBC: Extended;
    FPRedBCST: Extended;
    FVBC: Extended;
    FVBCST: Extended;
    FVICMS: Extended;
    FVBCFCP: TNFeFloat2;
    FPFCP: TNFeFloat4;
    FVFCP: TNFeFloat2;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
    FVICMSDeson: TNFeFloat2;
    FMotDesICMS: Integer;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property VBC: Extended read FVBC write FVBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property VBCFCP: TNFeFloat2 read FVBCFCP write FVBCFCP;
    property PFCP: TNFeFloat4 read FPFCP write FPFCP;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property MotDesICMS: Integer read FMotDesICMS write FMotDesICMS;
  end;

  TICMSPart = class(TICMS)
  private
  protected
    FModBC: Integer;
    FVBC: Extended;
    FPRedBC: Extended;
    FPICMS: Extended;
    FVICMS: Extended;
    FModBCST: Integer;
    FPMVAST: TNFeFloat2;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FPICMSST: Extended;
    FVICMSST: Extended;
    FPBCOp: Extended;
    FUFST: String;
  public
    constructor Create(CST: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property VBC: Extended read FVBC write FVBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property PBCOp: Extended read FPBCOp write FPBCOp;
    property UFST: String read FUFST write FUFST;
  end;
  TICMSST = class(TICMS)
  private
  protected
    FVBCSTRet: Extended;
    FVICMSSTRet: Extended;
    FVBCSTDest: Extended;
    FVICMSSTDest: Extended;
  public
    constructor Create(CST: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCSTRet: Extended read FVBCSTRet write FVBCSTRet;
    property VICMSSTRet: Extended read FVICMSSTRet write FVICMSSTRet;
    property VBCSTDest: Extended read FVBCSTDest write FVBCSTDest;
    property VICMSSTDest: Extended read FVICMSSTDest write FVICMSSTDest;
  end;

  TICMSSN101 = class(TICMS)
  private
  protected
    FPCredSN: TNFeFloat2;
    FVCredICMSSN: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property PCredSN: TNFeFloat2 read FPCredSN write FPCredSN;
    property VCredICMSSN: TNFeFloat2 read FVCredICMSSN write FVCredICMSSN;
  end;

  TICMSSN102 = class(TICMS)
  private
  protected

  public
    constructor Create(CSOSN: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)

  end;

  TICMSSN201 = class(TICMS)
  private
  protected
    FModBCST: Integer;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
    FPCredSN: TNFeFloat2;
    FVCredICMSSN: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property PCredSN: TNFeFloat2 read FPCredSN write FPCredSN;
    property VCredICMSSN: TNFeFloat2 read FVCredICMSSN write FVCredICMSSN;
  end;

  TICMSSN202 = class(TICMS)
  private
  protected
    FModBCST: Integer;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
  public
    constructor Create(CSOSN: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
  end;

  TICMSSN500 = class(TICMS)
  private
  protected
    FVBCSTRet: Extended;
    FPST: TNFeFloat4;
    FVICMSSTRet: Extended;
    FVBCFCPSTRet: TNFeFloat2;
    FPFCPSTRet: TNFeFloat4;
    FVFCPSTRet: TNFeFloat2;
    FPRedBCEfet: TNFeFloat4;
    FVBCEfet: TNFeFloat2;
    FPICMSEfet: TNFeFloat4;
    FVICMSEfet: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCSTRet: Extended read FVBCSTRet write FVBCSTRet;
    property PST: TNFeFloat4 read FPST write FPST;
    property VICMSSTRet: Extended read FVICMSSTRet write FVICMSSTRet;
    property VBCFCPSTRet: TNFeFloat2 read FVBCFCPSTRet write FVBCFCPSTRet;
    property PFCPSTRet: TNFeFloat4 read FPFCPSTRet write FPFCPSTRet;
    property VFCPSTRet: TNFeFloat2 read FVFCPSTRet write FVFCPSTRet;
    property PRedBCEfet: TNFeFloat4 read FPRedBCEfet write FPRedBCEfet;
    property VBCEfet: TNFeFloat2 read FVBCEfet write FVBCEfet;
    property PICMSEfet: TNFeFloat4 read FPICMSEfet write FPICMSEfet;
    property VICMSEfet: TNFeFloat2 read FVICMSEfet write FVICMSEfet;
  end;

  TICMSSN900 = class(TICMS)
  private
  protected
    FModBC: Integer;
    FModBCST: Integer;
    FPICMS: Extended;
    FPICMSST: Extended;
    FPMVAST: TNFeFloat2;
    FPRedBC: Extended;
    FPRedBCST: Extended;
    FVBC: Extended;
    FVBCST: Extended;
    FVICMS: Extended;
    FVICMSST: Extended;
    FVBCFCPST: TNFeFloat2;
    FPFCPST: TNFeFloat4;
    FVFCPST: TNFeFloat2;
    FPCredSN: TNFeFloat2;
    FVCredICMSSN: TNFeFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property VBC: Extended read FVBC write FVBC;
    property PRedBC: Extended read FPRedBC write FPRedBC;
    property PICMS: Extended read FPICMS write FPICMS;
    property VICMS: Extended read FVICMS write FVICMS;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PMVAST: TNFeFloat2 read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VBCFCPST: TNFeFloat2 read FVBCFCPST write FVBCFCPST;
    property PFCPST: TNFeFloat4 read FPFCPST write FPFCPST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property PCredSN: TNFeFloat2 read FPCredSN write FPCredSN;
    property VCredICMSSN: TNFeFloat2 read FVCredICMSSN write FVCredICMSSN;
  end;

implementation

uses SysUtils;

{ TICMS }

constructor TICMS.Create(CST_CSOSN: Integer; CSOSN: boolean = false);
begin
  if CSOSN then
    FCSOSN := CST_CSOSN
  else
    FCST := TCST.Create(CST_CSOSN);
end;

{ TICMS00 }

constructor TICMS00.Create;
begin
  inherited Create(CST_ICMS_TRIB_INTEGRAL);
end;

{ TICMS10 }

constructor TICMS10.Create;
begin
  inherited Create(CST_ICMS_TRIB_COM_ST);
end;

{ TICMS20 }

constructor TICMS20.Create;
begin
  inherited Create(CST_ICMS_TRIB_COM_RED_BC);
end;
function TICMS20.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if UpperCase(Prop.Name) = 'PREDBC' then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

{ TICMS30 }

constructor TICMS30.Create;
begin
  inherited Create(CST_ICMS_TRIB_ISENTA_COM_ST);
end;

{ TICMS40 }

constructor TICMS40.Create(CST: Integer);
begin
  inherited Create(CST);
end;

function TICMS40.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if UpperCase(Prop.Name) = 'ORIG' then
    Result := True
  else
    if UpperCase(Prop.Name) = 'VICMS' then
      Result := False
    else
      Result := inherited IsTagEvenEmpty(Prop);
end;

{ TICMS51 }

constructor TICMS51.Create;
begin
  inherited Create(CST_ICMS_TRIB_DIFERIDA);
end;

{ TICMS60 }

constructor TICMS60.Create;
begin
  inherited Create(CST_ICMS_TRIB_COBRADA_POR_ST);
end;

function TICMS60.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if UpperCase(Prop.Name) = 'ORIG' then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;


{ TICMS70 }

constructor TICMS70.Create;
begin
  inherited Create(CST_ICMS_TRIB_RED_BC_COM_ST);
end;

{ TICMS90 }

constructor TICMS90.Create;
begin
  inherited Create(CST_ICMS_TRIB_OUTROS);
end;

{ TICMSPart }

constructor TICMSPart.Create(CST: Integer);
begin
  inherited Create(CST);
end;

{ TICMS101 }

constructor TICMSSN101.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COM_CRED, True);
end;

{ TICMS102 }

constructor TICMSSN102.Create(CSOSN: Integer);
begin
  inherited Create(CSOSN,True);
end;

{ TICMS201 }

constructor TICMSSN201.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COM_CRED_ST,True);
end;

{ TICMS202 }

constructor TICMSSN202.Create(CSOSN: Integer);
begin
  inherited Create(CSOSN,True);
end;

{ TICMS500 }

constructor TICMSSN500.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COBRADO_POR_ST,True);
end;

{ TICMS900 }

constructor TICMSSN900.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_OUTROS,True);
end;

{ TICMSImposto }

function TICMSImposto.GetXMLName(Prop: TPropInfo): String;
begin
  FSameClass := ',icms';
  Result := inherited GetXMLName(Prop);
end;


{ TICMSST }

constructor TICMSST.Create(CST: Integer);
begin
  inherited Create(CST);
end;

{ TICMS02 }

constructor TICMS02.Create;
begin
  inherited Create(CST_ICMS_TRIB_MONOFASICA);
end;

{ TICMS15 }

constructor TICMS15.Create;
begin
  inherited Create(CST_ICMS_TRIB_MONOFASICA_RETENCAO);
end;

{ TICMS53 }

constructor TICMS53.Create;
begin
  inherited Create(CST_ICMS_TRIB_MONOFASICA_DIFERIDO);
end;

{ TICMS61 }

constructor TICMS61.Create;
begin
  inherited Create(CST_ICMS_TRIB_MONOFASICA_COBRADA_ANTERIORMENTE);
end;

end.
