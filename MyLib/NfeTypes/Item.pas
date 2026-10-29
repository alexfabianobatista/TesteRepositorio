unit Item;

interface

uses
  Adi, DI, Imposto, ICMS, NfeTypes, TypInfo;

type
  TNCM = class(TNFeCampoFormatado)
  public
    constructor Create(NCM: String);
  end;
  TCide = class(TNFeElementNoEmptys)
  private
  protected
    FCBCProd: TNFeFloat4;
    FVAliqProd: TNFeFloat4;
    FVCide: TNFeFloat2;
  public
  published
    property CBCProd: TNFeFloat4 read FCBCProd write FCBCProd;
    property VAliqProd: TNFeFloat4 read FVAliqProd write FVAliqProd;
    property VCide: TNFeFloat2 read FVCide write FVCide;
  end;
  TEncerrante = class(TNFeElementNoEmptys)
  private
  protected
    FNBico: Integer;
    FNBomba: Integer;
    FNTanque: Integer;
    FVEncIni: TNFeFloat3;
    FVEncFin: TNFeFloat3;
    FPBio: TNFeFloat4;
    FOrigComb: TNFeElementItems;
  published
    property NBico: Integer read FNBico write FNBico;
    property NBomba: Integer read FNBomba write FNBomba;
    property NTanque: Integer read FNTanque write FNTanque;
    property VEncIni: TNFeFloat3 read FVEncIni write FVEncIni;
    property VEncFin: TNFeFloat3 read FVEncFin write FVEncFin;
    property PBio: TNFeFloat4 read FPBio write FPBio;
    property OrigComb: TNFeElementItems read FOrigComb write FOrigComb;
  end;

  TOrigComb = class(TNFeElementNoEmptys)
  private
  protected
    FIndImport: String;
    FCUFOrig: Integer;
    FPOrig: TNFeFloat4;
  public
  published
  property IndImport: String read FIndImport write FIndImport;
  property CUFOrig: Integer read FCUFOrig write FCUFOrig;
  property POrig: TNFeFloat4 read FPOrig write FPOrig;
  end;

  TComb = class(TNFeElementNoEmptys)
  private
  protected
    FCProdANP: Integer;
    FPMixGN: TNFeFloat4;
    FDescANP: String;
    FPGLP: TNFeFloat4;
    FPGNn: TNFeFloat4;
    FPGNi: TNFeFloat4;
    FVPart: TNFeFloat2;
    FCODIF: Integer;
    FQTemp: TNFeFloat4;
    FUFCons: String;
    FCide: TCide;
    FEncerrante: TEncerrante;
    FOrigComb: TOrigComb;
  public
  published
    property CProdANP: Integer read FCProdANP write FCProdANP;
    property PMixGN: TNFeFloat4 read FPMixGN write FPMixGN;
    property DescANP: String read FDescANP write FDescANP;
    property PGLP: TNFeFloat4 read FPGLP write FPGLP;
    property PGNn: TNFeFloat4 read FPGNn write FPGNn;
    property PGNi: TNFeFloat4 read FPGNi write FPGNi;
    property VPart: TNFeFloat2 read FVPart write FVPart;
    property CODIF: Integer read FCODIF write FCODIF;
    property QTemp: TNFeFloat4 read FQTemp write FQTemp;
    property UFCons: String read FUFCons write FUFCons;
    property Cide: TCide read FCide write FCide;
    property Encerrante: TEncerrante read FEncerrante write FEncerrante;
    property OrigComb: TOrigComb read FOrigComb write FOrigComb;
  end;
  TExportInd = class(TNFeElement)
  protected
    FNRE: String;
    FChNFe: String;
    FQExport: TNFeFloat2;
  published
    property NRE: String read FNRE write FNRE;
    property ChNFe: String read FChNFe write FChNFe;
    property QExport: TNFeFloat2 read FQExport write FQExport;
  end;
  TDetExport = class(TNFeElement)
  protected
    FNDraw: String;
    FExportInd: TExportInd;
  published
    property NDraw: String read FNDraw write FNDraw;
    property ExportInd: TExportInd read FExportInd write FExportInd;
  end;
  TRastro = class(TNFeElementNoEmptys)
  protected
    FNLote: String;
    FQLote: TNFeFloat3;
    FDFab: TNFeData;
    FDVal: TNFeData;
    FCAgreg: String;
  published
    property NLote: String read FNLote write FNLote;
    property QLote: TNFeFloat3 read FQLote write FQLote;
    property DFab: TNFeData read FDFab write FDFab;
    property DVal: TNFeData read FDVal write FDVal;
    property CAgreg: String read FCAgreg write FCAgreg;
  end;
  TMed = class(TNFeElement)
  protected
    FCProdANVISA: String;
    FXMotivoIsencao: String;
    FVPMC: TNFeFloat2;
  published
    property CProdANVISA: String read FCProdANVISA write FCProdANVISA;
    property XMotivoIsencao: String read FXMotivoIsencao write FXMotivoIsencao;
    property VPMC: TNFeFloat2 read FVPMC write FVPMC;
  end;
  //ID = I01
  TProd = class(TNFeElement)
  private
  protected
    FAdi: TAdi;
    FArma: TNFeElementItems; //Armamento ainda não implementado.
    FCEAN: String;
    FCEANTrib: String;
    FCFOP: Integer;
    FComb: TComb; //Combustível ainda não implementado.
    FNRECOPI: String;
    FCProd: String;
    FDI: TDI;
    FDetExport: TNFeElementItems;
    FRastro: TNFeElementItems;
    FEXTIPI: String;
    FIndTot: Integer;
    FMed: TNFeElementItems; //Medicamento ainda não implementado.
    FNCM: TNCM;
    FNVE: String;
    FCEST: string;
    FIndEscala: String;
    FCNPJFab: String;
    FCBenef: String;
    FNItemPed: Integer;
    FTpCredPresIBSZFM: Integer;
    FQCom: TNFeFloat4;
    FQTrib: TNFeFloat4;
    FUCom: String;
    FUTrib: String;
    FVDesc: TNFeFloat2;
    FVeicProd: TObject; //Veículo ainda não implementado.
    FVFrete: Extended;
    FVOutro: Extended;
    FVProd: Extended;
    FVSeg: Extended;
    FVUnCom: TNFeFloat8;
    FVUnTrib: TNFeFloat8;
    FXPed: String;
    FXProd: String;
  public
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CProd: String read FCProd write FCProd;
    property CEAN: String read FCEAN write FCEAN;
    property XProd: String read FXProd write FXProd;
    property NCM: TNCM read FNCM write FNCM;
    property NVE: String read FNVE write FNVE;
    property CEST: string read FCEST write FCEST;
    property IndEscala: string read FIndEscala write FIndEscala;
    property CNPJFab: string read FCNPJFab write FCNPJFab;
    property CBenef: string read FCBenef write FCBenef;
    property TpCredPresIBSZFM: Integer read FTpCredPresIBSZFM write FTpCredPresIBSZFM;
    property EXTIPI: String read FEXTIPI write FEXTIPI;
    property CFOP: Integer read FCFOP write FCFOP;
    property UCom: String read FUCom write FUCom;
    property QCom: TNFeFloat4 read FQCom write FQCom;
    property VUnCom: TNFeFloat8 read FVUnCom write FVUnCom;
    property VProd: Extended read FVProd write FVProd;
    property CEANTrib: String read FCEANTrib write FCEANTrib;
    property UTrib: String read FUTrib write FUTrib;
    property QTrib: TNFeFloat4 read FQTrib write FQTrib;
    property VUnTrib: TNFeFloat8 read FVUnTrib write FVUnTrib;
    property VFrete: Extended read FVFrete write FVFrete;
    property VSeg: Extended read FVSeg write FVSeg;
    property VDesc: TNFeFloat2 read FVDesc write FVDesc;
    property VOutro: Extended read FVOutro write FVOutro;
    property IndTot: Integer read FIndTot write FIndTot;
    property DI: TDI read FDI write FDI;
    property DetExport: TNFeElementItems read FDetExport write FDetExport;
    property XPed: String read FXPed write FXPed;
    property Rastro: TNFeElementItems read FRastro write FRastro;
    property Adi: TAdi read FAdi write FAdi;
    property NItemPed: Integer read FNItemPed write FNItemPed;
    property VeicProd: TObject read FVeicProd write FVeicProd;
    property Med: TNFeElementItems read FMed write FMed;
    property Arma: TNFeElementItems read FArma write FArma;
    property Comb: TComb read FComb write FComb;
    property NRECOPI: String read FNRECOPI write FNRECOPI;
  end;
  TIPIDevol = class(TNFeElement)
  protected
    FVIPIDevol: TNFeFloat2;
  published
    property VIPIDevol: TNFeFloat2 read FVIPIDevol write FVIPIDevol;
  end;
  TImpostoDevol = class(TNFeElement)
  protected
    FPDevol: TNFeFloat2;
    FIPI: TIPIDevol;
  published
    property PDevol: TNFeFloat2 read FPDevol write FPDevol;
    property IPI: TIPIDevol read FIPI write FIPI;
  end;       
  TDFeReferenciado = class(TNFeElement)
  protected
    FChaveAcesso: string;
  published
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
  end;
  //ID = H01
  TDet = class(TNFeElement)
  private
  protected
    FImposto: TImposto;
    FInfAdProd: String;
    FNItem: Integer;
    FProd: TProd;
    FImpostoDevol: TImpostoDevol;
    FVItem: TNFeFloat2;
    FDFeReferenciado: TDFeReferenciado;
  public
    constructor Create(NItem: Integer);
  published
    property NItem: Integer read FNItem write FNItem;
    property Prod: TProd read FProd write FProd;
    property Imposto: TImposto read FImposto write FImposto;
    property InfAdProd: String read FInfAdProd write FInfAdProd;
    property ImpostoDevol: TImpostoDevol read FImpostoDevol write FImpostoDevol;
    property VItem: TNFeFloat2 read FVItem write FVItem;
    property DFeReferenciado: TDFeReferenciado read FDFeReferenciado write FDFeReferenciado;
  end;

implementation

uses
  SysUtils, StrUtils;

{ TDet }

constructor TDet.Create(NItem: Integer);
begin
  FNItem := NItem;
end;

{ TProd }

function TProd.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
var
  NEmptys: String;
begin
  NEmptys := ',vfrete,vseg,vdesc,voutro,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
  Result := not (PosEx(',' + UpperCase(Prop.Name) + ',', UpperCase(NEmptys)) > 0);
  if Result then
    Result := inherited IsTagEvenEmpty(Prop);
end;

{ TNCM }

constructor TNCM.Create(NCM: String);
begin
  if Length(NCM) > 2 then  //produto
    inherited Create(StrToInt(NCM), '00000000')
  else  //servico
    inherited Create(StrToInt(NCM), '00');
end;

end.
