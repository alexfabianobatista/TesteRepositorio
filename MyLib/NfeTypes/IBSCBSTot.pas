unit IBSCBSTot;

interface

uses
  SysUtils, Classes, NfeTypes, TypInfo;

type
  // ---------------------------------------------------------------------------
  // gEstornoCred - Grupo total do Estorno de Crédito (W59e)
  // ---------------------------------------------------------------------------
  TGEstornoCred = class(TNFeElement)
  private
    FVIBSEstCred: TNFeFloat2; // W59f
    FVCBSEstCred: TNFeFloat2; // W59g
  published
    property VIBSEstCred: TNFeFloat2 read FVIBSEstCred write FVIBSEstCred;
    property VCBSEstCred: TNFeFloat2 read FVCBSEstCred write FVCBSEstCred;
  end;

  // ---------------------------------------------------------------------------
  // gMono - Grupo total da Monofasia (W57)
  // ---------------------------------------------------------------------------
  TGMono = class(TNFeElement)
  private
    FVIBSMono: TNFeFloat2;       // W58
    FVCBSMono: TNFeFloat2;       // W59
    FVIBSMonoReten: TNFeFloat2;  // W59a
    FVCBSMonoReten: TNFeFloat2;  // W59b
    FVIBSMonoRet: TNFeFloat2;    // W59c
    FVCBSMonoRet: TNFeFloat2;    // W59d
  published
    property VIBSMono: TNFeFloat2 read FVIBSMono write FVIBSMono;
    property VCBSMono: TNFeFloat2 read FVCBSMono write FVCBSMono;
    property VIBSMonoReten: TNFeFloat2 read FVIBSMonoReten write FVIBSMonoReten;
    property VCBSMonoReten: TNFeFloat2 read FVCBSMonoReten write FVCBSMonoReten;
    property VIBSMonoRet: TNFeFloat2 read FVIBSMonoRet write FVIBSMonoRet;
    property VCBSMonoRet: TNFeFloat2 read FVCBSMonoRet write FVCBSMonoRet;
  end;

  // ---------------------------------------------------------------------------
  // gCBS - Grupo total da CBS (W50)
  // ---------------------------------------------------------------------------
  TGCBSTot = class(TNFeElement)
  private
    FVDif: TNFeFloat2;               // W53
    FVDevTrib: TNFeFloat2;           // W54
    FVCBS: TNFeFloat2;               // W56
    FVCredPres: TNFeFloat2;          // W56a
    FVCredPresCondSus: TNFeFloat2;   // W56b
  published
    property VDif: TNFeFloat2 read FVDif write FVDif;
    property VDevTrib: TNFeFloat2 read FVDevTrib write FVDevTrib;
    property VCBS: TNFeFloat2 read FVCBS write FVCBS;
    property VCredPres: TNFeFloat2 read FVCredPres write FVCredPres;
    property VCredPresCondSus: TNFeFloat2 read FVCredPresCondSus write FVCredPresCondSus;
  end;

  // ---------------------------------------------------------------------------
  // gIBSMun - Grupo total do IBS do Município (W42)
  // ---------------------------------------------------------------------------
  TGIBSMunTot = class(TNFeElement)
  private
    FVDif: TNFeFloat2;      // W43
    FVDevTrib: TNFeFloat2;  // W44
    FVIBSMun: TNFeFloat2;   // W46
  published
    property VDif: TNFeFloat2 read FVDif write FVDif;
    property VDevTrib: TNFeFloat2 read FVDevTrib write FVDevTrib;
    property VIBSMun: TNFeFloat2 read FVIBSMun write FVIBSMun;
  end;

  // ---------------------------------------------------------------------------
  // gIBSUF - Grupo total do IBS da UF (W37)
  // ---------------------------------------------------------------------------
  TGIBSUFTot = class(TNFeElement)
  private
    FVDif: TNFeFloat2;      // W38
    FVDevTrib: TNFeFloat2;  // W39
    FVIBSUF: TNFeFloat2;    // W41
  published
    property VDif: TNFeFloat2 read FVDif write FVDif;
    property VDevTrib: TNFeFloat2 read FVDevTrib write FVDevTrib;
    property VIBSUF: TNFeFloat2 read FVIBSUF write FVIBSUF;
  end;

  // ---------------------------------------------------------------------------
  // gIBS - Grupo total do IBS (W36)
  // contém gIBSUF (1-1), gIBSMun (1-1), e totais IBS
  // ---------------------------------------------------------------------------
  TGIBS = class(TNFeElement)
  private
    FGIBSUF: TGIBSUFTot;   // W37
    FGIBSMun: TGIBSMunTot; // W42
    FVIBS: TNFeFloat2;                // W47
    FVCredPres: TNFeFloat2;           // W48
    FVCredPresCondSus: TNFeFloat2;    // W49
  protected
    function GetXMLName(Prop: TPropInfo): String; override;
  published
    property GIBSUF: TGIBSUFTot read FGIBSUF write FGIBSUF;
    property GIBSMun: TGIBSMunTot read FGIBSMun write FGIBSMun;
    property VIBS: TNFeFloat2 read FVIBS write FVIBS;
    property VCredPres: TNFeFloat2 read FVCredPres write FVCredPres;
    property VCredPresCondSus: TNFeFloat2 read FVCredPresCondSus write FVCredPresCondSus;
  end;

  // ---------------------------------------------------------------------------
  // IBSCBSTot - Totais de IBS e CBS da NF-e (W34)
  // Campos e subgrupos conforme NT 2025.002 v1.30 (páginas 25–26)
  // ---------------------------------------------------------------------------
  TIBSCBSTot = class(TNFeElement)
  private
    FVBCIBSCBS: TNFeFloat2;        // W35 - vBCIBSCBS
    FVNFTot: TNFeFloat2;
    FGIBS: TGIBS;    // W36 - gIBS (0-1)
    FGCBS: TGCBSTot;    // W50 - gCBS (0-1)
    FGMono: TGMono;  // W57 - gMono (0-1)
    FGEstornoCred: TGEstornoCred; // W59e
  protected
    function GetXMLName(Prop: TPropInfo): String; override;
  published
    property VBCIBSCBS: TNFeFloat2 read FVBCIBSCBS write FVBCIBSCBS;
    property VNFTot: TNFeFloat2 read FVNFTot write FVNFTot;
    property GIBS: TGIBS read FGIBS write FGIBS;
    property GCBS: TGCBSTot read FGCBS write FGCBS;
    property GMono: TGMono read FGMono write FGMono;
    property GEstornoCred: TGEstornoCred read FGEstornoCred write FGEstornoCred;
  end;

implementation

function TGIBS.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'GIBSMunTot') then
    Result := Result + 'GIBSMun';
  if (UpperCase(Prop.Name) = 'GIBSUFTot') then
    Result := Result + 'GIBSUF';
end;

function TIBSCBSTot.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'GCBSTot') then
    Result := Result + 'GCBS';
end;
end.

