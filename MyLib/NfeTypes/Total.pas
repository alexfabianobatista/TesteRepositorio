unit Total;

interface

uses
  NfeTypes, IBSCBSTot;

type
  TRetTrib = class(TNFeElementNoEmptys)
  protected
    FVRetPIS: Extended;
    FVRetCOFINS: Extended;
    FVRetCSLL: Extended;
    FVBCIRRF: Extended;
    FVIRRF: Extended;
    FVBCRetPrev: Extended;
    FVRetPrev: Extended;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VRetPIS: Extended read FVRetPIS write FVRetPIS;
    property VRetCOFINS: Extended read FVRetCOFINS write FVRetCOFINS;
    property VRetCSLL: Extended read FVRetCSLL write FVRetCSLL;
    property VBCIRRF: Extended read FVBCIRRF write FVBCIRRF;
    property VIRRF: Extended read FVIRRF write FVIRRF;
    property VBCRetPrev: Extended read FVBCRetPrev write FVBCRetPrev;
    property VRetPrev: Extended read FVRetPrev write FVRetPrev;
  end;

  TISSQNtot = class(TNFeElementNoEmptys)
  protected
    FVBC: Extended;
    FVCOFINS: Extended;
    FVISS: Extended;
    FVPIS: Extended;
    FVServ: Extended;
    FDCompet: TNFeData;
    FVDeducao: TNFeFloat2;
    FVOutro: TNFeFloat2;
    FVDescIncond: TNFeFloat2;
    FVDescCond: TNFeFloat2;
    FVISSRet: TNFeFloat2;
    FCRegTrib: Integer;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VServ: Extended read FVServ write FVServ;
    property VBC: Extended read FVBC write FVBC;
    property VISS: Extended read FVISS write FVISS;
    property VPIS: Extended read FVPIS write FVPIS;
    property VCOFINS: Extended read FVCOFINS write FVCOFINS;
    property DCompet: TNFeData read FDCompet write FDCompet;
    property VDeducao: TNFeFloat2 read FVDeducao write FVDeducao;
    property VOutro: TNFeFloat2 read FVOutro write FVOutro;
    property VDescIncond: TNFeFloat2 read FVDescIncond write FVDescIncond;
    property VDescCond: TNFeFloat2 read FVDescCond write FVDescCond;
    property VISSRet: TNFeFloat2 read FVISSRet write FVISSRet;
    property CRegTrib: Integer read FCRegTrib write FCRegTrib;
  end;

  TISTot = class(TNFeElement)
  private
    FVIS: TNFeFloat2;
  published
    property VIS: TNFeFloat2 read FVIS write FVIS;
  end;

  TICMSTot = class(TNFeElement)
  protected
    FVBC: Extended;
    FVBCST: Extended;
    FVCOFINS: Extended;
    FVDesc: Extended;
    FVFrete: Extended;
    FVICMS: Extended;
    FVICMSDeson: TNFeFloat2;
    FVFCP: TNFeFloat2;
    FVFCPUFDest: TNFeFloat2;
    FVICMSUFDest: TNFeFloat2;
    FVICMSUFRemet: TNFeFloat2;
    FVII: Extended;
    FVIPI: Extended;
    FVIPIDevol: TNFeFloat2;
    FVNF: Extended;
    FVOutro: Extended;
    FVPIS: Extended;
    FVProd: Extended;
    FVSeg: Extended;
    FVST: Extended;
    FVFCPST: TNFeFloat2;
    FVFCPSTRet: TNFeFloat2;
    FQBCMono: TNFeFloat2;
    FVICMSMono: TNFeFloat2;
    FQBCMonoReten: TNFeFloat2;
    FVICMSMonoReten: TNFeFloat2;
    FQBCMonoRet: TNFeFloat2;
    FVICMSMonoRet: TNFeFloat2;
    FVTotTrib: TNFeFloat2;
    FISTot: TISTot;
    FIBSCBSTot: TIBSCBSTot;
    FVNFTot: TNFeFloat2;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property VICMS: Extended read FVICMS write FVICMS;
    property VICMSDeson: TNFeFloat2 read FVICMSDeson write FVICMSDeson;
    property VFCPUFDest: TNFeFloat2 read FVFCPUFDest write FVFCPUFDest;
    property VICMSUFDest: TNFeFloat2 read FVICMSUFDest write FVICMSUFDest;
    property VICMSUFRemet: TNFeFloat2 read FVICMSUFRemet write FVICMSUFRemet;
    property VFCP: TNFeFloat2 read FVFCP write FVFCP;
    property VBCST: Extended read FVBCST write FVBCST;
    property VST: Extended read FVST write FVST;
    property VFCPST: TNFeFloat2 read FVFCPST write FVFCPST;
    property VFCPSTRet: TNFeFloat2 read FVFCPSTRet write FVFCPSTRet;
    property QBCMono: TNFeFloat2 read FQBCMono write FQBCMono;
    property VICMSMono: TNFeFloat2 read FVICMSMono write FVICMSMono;
    property QBCMonoReten: TNFeFloat2 read FQBCMonoReten write FQBCMonoReten;
    property VICMSMonoReten: TNFeFloat2 read FVICMSMonoReten write FVICMSMonoReten;
    property QBCMonoRet: TNFeFloat2 read FQBCMonoRet write FQBCMonoRet;
    property VICMSMonoRet: TNFeFloat2 read FVICMSMonoRet write FVICMSMonoRet;
    property VProd: Extended read FVProd write FVProd;
    property VFrete: Extended read FVFrete write FVFrete;
    property VSeg: Extended read FVSeg write FVSeg;
    property VDesc: Extended read FVDesc write FVDesc;
    property VII: Extended read FVII write FVII;
    property VIPI: Extended read FVIPI write FVIPI;
    property VIPIDevol: TNFeFloat2 read FVIPIDevol write FVIPIDevol;
    property VPIS: Extended read FVPIS write FVPIS;
    property VCOFINS: Extended read FVCOFINS write FVCOFINS;
    property VOutro: Extended read FVOutro write FVOutro;
    property VNF: Extended read FVNF write FVNF;
    property VTotTrib: TNFeFloat2 read FVTotTrib write FVTotTrib;
    property ISTot: TISTot read FISTot write FISTot;
    property IBSCBSTot: TIBSCBSTot read FIBSCBSTot write FIBSCBSTot;
    property VNFTot: TNFeFloat2 read FVNFTot write FVNFTot;
  end;

  TTotal = class(TNFeElement)
  protected
    FICMSTot: TICMSTot;
    FISSQNtot: TISSQNtot;
    FRetTrib: TRetTrib;
    FISTot: TISTot;
    FIBSCBSTot: TIBSCBSTot;
    FVNFTot: TNFeFloat2;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ICMSTot: TICMSTot read FICMSTot write FICMSTot;
    property ISSQNtot: TISSQNtot read FISSQNtot write FISSQNtot;
    property RetTrib: TRetTrib read FRetTrib write FRetTrib;
    property ISTot: TISTot read FISTot write FISTot;
    property IBSCBSTot: TIBSCBSTot read FIBSCBSTot write FIBSCBSTot;
    property VNFTot: TNFeFloat2 read FVNFTot write FVNFTot;
  end;

implementation

end.
