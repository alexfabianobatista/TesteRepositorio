unit NFSeNacional;

interface

uses
  SysUtils, TypInfo, NfseTypes;

type
  {
    Gerado a partir dos schemas DPS_v1.01.xsd, NFSe_v1.01.xsd e tiposComplexos_v1.01.xsd.
    Observacao: tipos simples do XSD foram mapeados como String para preservar formato XML.
    Campos maxOccurs foram mantidos como arrays em public para compatibilidade com Delphi 7.
  }

  TSignature = class;
  TCNFSe = class;
  TCInfNFSe = class;
  TCEmitente = class;
  TCValoresNFSe = class;
  TCRTCIBSCBS = class;
  TCRTCValoresIBSCBS = class;
  TCRTCValoresIBSCBSUF = class;
  TCRTCValoresIBSCBSMun = class;
  TCRTCValoresIBSCBSFed = class;
  TCRTCTotalCIBS = class;
  TCRTCTotalIBS = class;
  TCRTCTotalIBSCredPres = class;
  TCRTCTotalIBSUF = class;
  TCRTCTotalIBSMun = class;
  TCRTCTotalCBS = class;
  TCRTCTotalCBSCredPres = class;
  TCRTCTotalTribRegular = class;
  TCRTCTotalTribCompraGov = class;
  TCDPS = class;
  TCInfDPS = class;
  TCSubstituicao = class;
  TCInfoPrestador = class;
  TCRegTrib = class;
  TCInfoPessoa = class;
  TCEndereco = class;
  TCEnderecoEmitente = class;
  TCEnderecoSimples = class;
  TCEnderNac = class;
  TCEnderExt = class;
  TCEnderExtSimples = class;
  TCEnderObraEvento = class;
  TCServ = class;
  TCLocPrest = class;
  TCCServ = class;
  TCComExterior = class;
  TCAtvEvento = class;
  TCInfoObra = class;
  TCInfoCompl = class;
  TCInfoItemPed = class;
  TCInfoValores = class;
  TCInfoTributacao = class;
  TCVServPrest = class;
  TCVDescCondIncond = class;
  TCInfoDedRed = class;
  TCListaDocDedRed = class;
  TCDocDedRed = class;
  TCDocOutNFSe = class;
  TCDocNFNFS = class;
  TCTribMunicipal = class;
  TCBeneficioMunicipal = class;
  TCExigSuspensa = class;
  TCTribFederal = class;
  TCTribOutrosPisCofins = class;
  TCTribTotal = class;
  TCTribTotalMonet = class;
  TCTribTotalPercent = class;
  TCRTCInfoIBSCBS = class;
  TCInfoRefNFSe = class;
  TCRTCInfoDest = class;
  TCRTCInfoImovel = class;
  TCRTCInfoValoresIBSCBS = class;
  TCRTCInfoReeRepRes = class;
  TCRTCInfoTributosIBSCBS = class;
  TCRTCListaDoc = class;
  TCRTCListaDocDFe = class;
  TCRTCListaDocFiscalOutro = class;
  TCRTCListaDocOutro = class;
  TCRTCListaDocFornec = class;
  TCRTCInfoTributosSitClas = class;
  TCRTCInfoTributosTribRegular = class;
  TCRTCInfoTributosDif = class;

  TTCInfoItemPedXItemPedArray = array of String;
  TTCListaDocDedRedDocDedRedArray = array of TCDocDedRed;
  TTCInfoRefNFSeRefNFSeArray = array of String;
  TTCRTCInfoReeRepResDocumentosArray = array of TCRTCListaDoc;

  TSignature = class(TNFSeElementNoEmptys)
  private
  protected
    FXmlAssinado: String;
  published
    property XmlAssinado: String read FXmlAssinado write FXmlAssinado;
  end;

  TCNFSe = class(TNFSeElementNoEmptys)
  private
  protected
    FVersao: String;
    FInfNFSe: TCInfNFSe;
    FSignature: TSignature;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property Versao: String read FVersao write FVersao; // XML attribute: versao
    property infNFSe: TCInfNFSe read FInfNFSe write FInfNFSe;
    property Signature: TSignature read FSignature write FSignature;
  end;

  TCInfNFSe = class(TNFSeElementNoEmptys)
  private
  protected
    FId: String;
    FXLocEmi: String;
    FXLocPrestacao: String;
    FNNFSe: String;
    FCLocIncid: String;
    FXLocIncid: String;
    FXTribNac: String;
    FXTribMun: String;
    FXNBS: String;
    FVerAplic: String;
    FAmbGer: String;
    FTpEmis: String;
    FProcEmi: String;
    FCStat: String;
    FDhProc: String;
    FNDFSe: String;
    FEmit: TCEmitente;
    FValores: TCValoresNFSe;
    FXOutInf: String;
    FIBSCBS: TCRTCIBSCBS;
    FDPS: TCDPS;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property Id: String read FId write FId; // XML attribute: Id
    property xLocEmi: String read FXLocEmi write FXLocEmi;
    property xLocPrestacao: String read FXLocPrestacao write FXLocPrestacao;
    property nNFSe: String read FNNFSe write FNNFSe;
    property cLocIncid: String read FCLocIncid write FCLocIncid; // minOccurs=0
    property xLocIncid: String read FXLocIncid write FXLocIncid; // minOccurs=0
    property xTribNac: String read FXTribNac write FXTribNac;
    property xTribMun: String read FXTribMun write FXTribMun; // minOccurs=0
    property xNBS: String read FXNBS write FXNBS; // minOccurs=0
    property verAplic: String read FVerAplic write FVerAplic;
    property ambGer: String read FAmbGer write FAmbGer;
    property tpEmis: String read FTpEmis write FTpEmis;
    property procEmi: String read FProcEmi write FProcEmi; // minOccurs=0
    property cStat: String read FCStat write FCStat;
    property dhProc: String read FDhProc write FDhProc;
    property nDFSe: String read FNDFSe write FNDFSe;
    property emit: TCEmitente read FEmit write FEmit;
    property valores: TCValoresNFSe read FValores write FValores;
    property xOutInf: String read FXOutInf write FXOutInf; // minOccurs=0
    property IBSCBS: TCRTCIBSCBS read FIBSCBS write FIBSCBS; // minOccurs=0
    property DPS: TCDPS read FDPS write FDPS;
  end;

  TCEmitente = class(TNFSeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FIM: String;
    FXNome: String;
    FXFant: String;
    FEnderNac: TCEnderecoEmitente;
    FFone: String;
    FEmail: String;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    // fim xs:choice
    property IM: String read FIM write FIM; // minOccurs=0
    property xNome: String read FXNome write FXNome;
    property xFant: String read FXFant write FXFant; // minOccurs=0
    property enderNac: TCEnderecoEmitente read FEnderNac write FEnderNac;
    property fone: String read FFone write FFone; // minOccurs=0
    property email: String read FEmail write FEmail; // minOccurs=0
  end;

  TCValoresNFSe = class(TNFSeElementNoEmptys)
  private
  protected
    FVCalcDR: String;
    FTpBM: String;
    FVCalcBM: String;
    FVBC: String;
    FPAliqAplic: String;
    FVISSQN: String;
    FVTotalRet: String;
    FVLiq: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vCalcDR: String read FVCalcDR write FVCalcDR; // minOccurs=0
    property tpBM: String read FTpBM write FTpBM; // minOccurs=0
    property vCalcBM: String read FVCalcBM write FVCalcBM; // minOccurs=0
    property vBC: String read FVBC write FVBC; // minOccurs=0
    property pAliqAplic: String read FPAliqAplic write FPAliqAplic; // minOccurs=0
    property vISSQN: String read FVISSQN write FVISSQN; // minOccurs=0
    property vTotalRet: String read FVTotalRet write FVTotalRet; // minOccurs=0
    property vLiq: String read FVLiq write FVLiq;
  end;

  TCRTCIBSCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FCLocalidadeIncid: String;
    FXLocalidadeIncid: String;
    FPRedutor: String;
    FValores: TCRTCValoresIBSCBS;
    FTotCIBS: TCRTCTotalCIBS;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cLocalidadeIncid: String read FCLocalidadeIncid write FCLocalidadeIncid;
    property xLocalidadeIncid: String read FXLocalidadeIncid write FXLocalidadeIncid;
    property pRedutor: String read FPRedutor write FPRedutor; // minOccurs=0
    property valores: TCRTCValoresIBSCBS read FValores write FValores;
    property totCIBS: TCRTCTotalCIBS read FTotCIBS write FTotCIBS;
  end;

  TCRTCValoresIBSCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FVBC: String;
    FVCalcReeRepRes: String;
    FUf: TCRTCValoresIBSCBSUF;
    FMun: TCRTCValoresIBSCBSMun;
    FFed: TCRTCValoresIBSCBSFed;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vBC: String read FVBC write FVBC;
    property vCalcReeRepRes: String read FVCalcReeRepRes write FVCalcReeRepRes; // minOccurs=0
    property uf: TCRTCValoresIBSCBSUF read FUf write FUf;
    property mun: TCRTCValoresIBSCBSMun read FMun write FMun;
    property fed: TCRTCValoresIBSCBSFed read FFed write FFed;
  end;

  TCRTCValoresIBSCBSUF = class(TNFSeElementNoEmptys)
  private
  protected
    FPIBSUF: String;
    FPRedAliqUF: String;
    FPAliqEfetUF: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pIBSUF: String read FPIBSUF write FPIBSUF;
    property pRedAliqUF: String read FPRedAliqUF write FPRedAliqUF; // minOccurs=0
    property pAliqEfetUF: String read FPAliqEfetUF write FPAliqEfetUF;
  end;

  TCRTCValoresIBSCBSMun = class(TNFSeElementNoEmptys)
  private
  protected
    FPIBSMun: String;
    FPRedAliqMun: String;
    FPAliqEfetMun: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pIBSMun: String read FPIBSMun write FPIBSMun;
    property pRedAliqMun: String read FPRedAliqMun write FPRedAliqMun; // minOccurs=0
    property pAliqEfetMun: String read FPAliqEfetMun write FPAliqEfetMun;
  end;

  TCRTCValoresIBSCBSFed = class(TNFSeElementNoEmptys)
  private
  protected
    FPCBS: String;
    FPRedAliqCBS: String;
    FPAliqEfetCBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pCBS: String read FPCBS write FPCBS;
    property pRedAliqCBS: String read FPRedAliqCBS write FPRedAliqCBS; // minOccurs=0
    property pAliqEfetCBS: String read FPAliqEfetCBS write FPAliqEfetCBS;
  end;

  TCRTCTotalCIBS = class(TNFSeElementNoEmptys)
  private
  protected
    FVTotNF: String;
    FGIBS: TCRTCTotalIBS;
    FGCBS: TCRTCTotalCBS;
    FGTribRegular: TCRTCTotalTribRegular;
    FGTribCompraGov: TCRTCTotalTribCompraGov;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vTotNF: String read FVTotNF write FVTotNF;
    property gIBS: TCRTCTotalIBS read FGIBS write FGIBS;
    property gCBS: TCRTCTotalCBS read FGCBS write FGCBS;
    property gTribRegular: TCRTCTotalTribRegular read FGTribRegular write FGTribRegular; // minOccurs=0
    property gTribCompraGov: TCRTCTotalTribCompraGov read FGTribCompraGov write FGTribCompraGov; // minOccurs=0
  end;

  TCRTCTotalIBS = class(TNFSeElementNoEmptys)
  private
  protected
    FVIBSTot: String;
    FGIBSCredPres: TCRTCTotalIBSCredPres;
    FGIBSUFTot: TCRTCTotalIBSUF;
    FGIBSMunTot: TCRTCTotalIBSMun;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vIBSTot: String read FVIBSTot write FVIBSTot;
    property gIBSCredPres: TCRTCTotalIBSCredPres read FGIBSCredPres write FGIBSCredPres; // minOccurs=0
    property gIBSUFTot: TCRTCTotalIBSUF read FGIBSUFTot write FGIBSUFTot;
    property gIBSMunTot: TCRTCTotalIBSMun read FGIBSMunTot write FGIBSMunTot;
  end;

  TCRTCTotalIBSCredPres = class(TNFSeElementNoEmptys)
  private
  protected
    FPCredPresIBS: String;
    FVCredPresIBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pCredPresIBS: String read FPCredPresIBS write FPCredPresIBS;
    property vCredPresIBS: String read FVCredPresIBS write FVCredPresIBS;
  end;

  TCRTCTotalIBSUF = class(TNFSeElementNoEmptys)
  private
  protected
    FVDifUF: String;
    FVIBSUF: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vDifUF: String read FVDifUF write FVDifUF; // minOccurs=0
    property vIBSUF: String read FVIBSUF write FVIBSUF;
  end;

  TCRTCTotalIBSMun = class(TNFSeElementNoEmptys)
  private
  protected
    FVDifMun: String;
    FVIBSMun: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vDifMun: String read FVDifMun write FVDifMun; // minOccurs=0
    property vIBSMun: String read FVIBSMun write FVIBSMun;
  end;

  TCRTCTotalCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FGCBSCredPres: TCRTCTotalCBSCredPres;
    FVDifCBS: String;
    FVCBS: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property gCBSCredPres: TCRTCTotalCBSCredPres read FGCBSCredPres write FGCBSCredPres; // minOccurs=0
    property vDifCBS: String read FVDifCBS write FVDifCBS; // minOccurs=0
    property vCBS: String read FVCBS write FVCBS;
  end;

  TCRTCTotalCBSCredPres = class(TNFSeElementNoEmptys)
  private
  protected
    FPCredPresCBS: String;
    FVCredPresCBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pCredPresCBS: String read FPCredPresCBS write FPCredPresCBS;
    property vCredPresCBS: String read FVCredPresCBS write FVCredPresCBS;
  end;

  TCRTCTotalTribRegular = class(TNFSeElementNoEmptys)
  private
  protected
    FPAliqEfeRegIBSUF: String;
    FVTribRegIBSUF: String;
    FPAliqEfeRegIBSMun: String;
    FVTribRegIBSMun: String;
    FPAliqEfeRegCBS: String;
    FVTribRegCBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pAliqEfeRegIBSUF: String read FPAliqEfeRegIBSUF write FPAliqEfeRegIBSUF;
    property vTribRegIBSUF: String read FVTribRegIBSUF write FVTribRegIBSUF;
    property pAliqEfeRegIBSMun: String read FPAliqEfeRegIBSMun write FPAliqEfeRegIBSMun;
    property vTribRegIBSMun: String read FVTribRegIBSMun write FVTribRegIBSMun;
    property pAliqEfeRegCBS: String read FPAliqEfeRegCBS write FPAliqEfeRegCBS;
    property vTribRegCBS: String read FVTribRegCBS write FVTribRegCBS;
  end;

  TCRTCTotalTribCompraGov = class(TNFSeElementNoEmptys)
  private
  protected
    FPIBSUF: String;
    FVIBSUF: String;
    FPIBSMun: String;
    FVIBSMun: String;
    FPCBS: String;
    FVCBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pIBSUF: String read FPIBSUF write FPIBSUF;
    property vIBSUF: String read FVIBSUF write FVIBSUF;
    property pIBSMun: String read FPIBSMun write FPIBSMun;
    property vIBSMun: String read FVIBSMun write FVIBSMun;
    property pCBS: String read FPCBS write FPCBS;
    property vCBS: String read FVCBS write FVCBS;
  end;

  TCDPS = class(TNFSeElementNoEmptys)
  private
  protected
    FXmlns: String;
    FVersao: String;
    FInfDPS: TCInfDPS;
    FSignature: TSignature;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property Xmlns: String read FXmlns write FXmlns; // XML attribute: xmlns
    property Versao: String read FVersao write FVersao; // XML attribute: versao
    property infDPS: TCInfDPS read FInfDPS write FInfDPS;
    property Signature: TSignature read FSignature write FSignature; // minOccurs=0
  end;

  TCInfDPS = class(TNFSeElementNoEmptys)
  private
  protected
    FId: String;
    FTpAmb: String;
    FDhEmi: String;
    FVerAplic: String;
    FSerie: String;
    FNDPS: String;
    FDCompet: String;
    FTpEmit: String;
    FCMotivoEmisTI: String;
    FChNFSeRej: String;
    FCLocEmi: String;
    FSubst: TCSubstituicao;
    FPrest: TCInfoPrestador;
    FToma: TCInfoPessoa;
    FInterm: TCInfoPessoa;
    FServ: TCServ;
    FValores: TCInfoValores;
    FIBSCBS: TCRTCInfoIBSCBS;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property Id: String read FId write FId; // XML attribute: Id
    property tpAmb: String read FTpAmb write FTpAmb;
    property dhEmi: String read FDhEmi write FDhEmi;
    property verAplic: String read FVerAplic write FVerAplic;
    property serie: String read FSerie write FSerie;
    property nDPS: String read FNDPS write FNDPS;
    property dCompet: String read FDCompet write FDCompet;
    property tpEmit: String read FTpEmit write FTpEmit;
    property cMotivoEmisTI: String read FCMotivoEmisTI write FCMotivoEmisTI; // minOccurs=0
    property chNFSeRej: String read FChNFSeRej write FChNFSeRej; // minOccurs=0
    property cLocEmi: String read FCLocEmi write FCLocEmi;
    property subst: TCSubstituicao read FSubst write FSubst; // minOccurs=0
    property prest: TCInfoPrestador read FPrest write FPrest;
    property toma: TCInfoPessoa read FToma write FToma; // minOccurs=0
    property interm: TCInfoPessoa read FInterm write FInterm; // minOccurs=0
    property serv: TCServ read FServ write FServ;
    property valores: TCInfoValores read FValores write FValores;
    property IBSCBS: TCRTCInfoIBSCBS read FIBSCBS write FIBSCBS; // minOccurs=0
  end;

  TCSubstituicao = class(TNFSeElementNoEmptys)
  private
  protected
    FChSubstda: String;
    FCMotivo: String;
    FXMotivo: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property chSubstda: String read FChSubstda write FChSubstda;
    property cMotivo: String read FCMotivo write FCMotivo;
    property xMotivo: String read FXMotivo write FXMotivo; // minOccurs=0
  end;

  TCInfoPrestador = class(TNFSeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FNIF: String;
    FCNaoNIF: String;
    FCAEPF: String;
    FIM: String;
    FXNome: String;
    FEnd_: TCEndereco;
    FFone: String;
    FEmail: String;
    FRegTrib: TCRegTrib;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property NIF: String read FNIF write FNIF;
    property cNaoNIF: String read FCNaoNIF write FCNaoNIF;
    // fim xs:choice
    property CAEPF: String read FCAEPF write FCAEPF; // minOccurs=0
    property IM: String read FIM write FIM; // minOccurs=0
    property xNome: String read FXNome write FXNome; // minOccurs=0
    property End_: TCEndereco read FEnd_ write FEnd_; // XML tag: end; minOccurs=0
    property fone: String read FFone write FFone; // minOccurs=0
    property email: String read FEmail write FEmail; // minOccurs=0
    property regTrib: TCRegTrib read FRegTrib write FRegTrib;
  end;

  TCRegTrib = class(TNFSeElementNoEmptys)
  private
  protected
    FOpSimpNac: String;
    FRegApTribSN: String;
    FRegEspTrib: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property opSimpNac: String read FOpSimpNac write FOpSimpNac;
    property regApTribSN: String read FRegApTribSN write FRegApTribSN; // minOccurs=0
    property regEspTrib: String read FRegEspTrib write FRegEspTrib;
  end;

  TCInfoPessoa = class(TNFSeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FNIF: String;
    FCNaoNIF: String;
    FCAEPF: String;
    FIM: String;
    FXNome: String;
    FEnd_: TCEndereco;
    FFone: String;
    FEmail: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property NIF: String read FNIF write FNIF;
    property cNaoNIF: String read FCNaoNIF write FCNaoNIF;
    // fim xs:choice
    property CAEPF: String read FCAEPF write FCAEPF; // minOccurs=0
    property IM: String read FIM write FIM; // minOccurs=0
    property xNome: String read FXNome write FXNome;
    property End_: TCEndereco read FEnd_ write FEnd_; // XML tag: end; minOccurs=0
    property fone: String read FFone write FFone; // minOccurs=0
    property email: String read FEmail write FEmail; // minOccurs=0
  end;

  TCEndereco = class(TNFSeElementNoEmptys)
  private
  protected
    FEndNac: TCEnderNac;
    FEndExt: TCEnderExt;
    FXLgr: String;
    FNro: String;
    FXCpl: String;
    FXBairro: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property endNac: TCEnderNac read FEndNac write FEndNac;
    property endExt: TCEnderExt read FEndExt write FEndExt;
    // fim xs:choice
    property xLgr: String read FXLgr write FXLgr;
    property nro: String read FNro write FNro;
    property xCpl: String read FXCpl write FXCpl; // minOccurs=0
    property xBairro: String read FXBairro write FXBairro;
  end;

  TCEnderecoEmitente = class(TNFSeElementNoEmptys)
  private
  protected
    FXLgr: String;
    FNro: String;
    FXCpl: String;
    FXBairro: String;
    FCMun: String;
    FUF: String;
    FCEP: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property xLgr: String read FXLgr write FXLgr;
    property nro: String read FNro write FNro;
    property xCpl: String read FXCpl write FXCpl; // minOccurs=0
    property xBairro: String read FXBairro write FXBairro;
    property cMun: String read FCMun write FCMun;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;
  end;

  TCEnderecoSimples = class(TNFSeElementNoEmptys)
  private
  protected
    FCEP: String;
    FEndExt: TCEnderExtSimples;
    FXLgr: String;
    FNro: String;
    FXCpl: String;
    FXBairro: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CEP: String read FCEP write FCEP;
    property endExt: TCEnderExtSimples read FEndExt write FEndExt;
    // fim xs:choice
    property xLgr: String read FXLgr write FXLgr;
    property nro: String read FNro write FNro;
    property xCpl: String read FXCpl write FXCpl; // minOccurs=0
    property xBairro: String read FXBairro write FXBairro;
  end;

  TCEnderNac = class(TNFSeElementNoEmptys)
  private
  protected
    FCMun: String;
    FCEP: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cMun: String read FCMun write FCMun;
    property CEP: String read FCEP write FCEP;
  end;

  TCEnderExt = class(TNFSeElementNoEmptys)
  private
  protected
    FCPais: String;
    FCEndPost: String;
    FXCidade: String;
    FXEstProvReg: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cPais: String read FCPais write FCPais;
    property cEndPost: String read FCEndPost write FCEndPost;
    property xCidade: String read FXCidade write FXCidade;
    property xEstProvReg: String read FXEstProvReg write FXEstProvReg;
  end;

  TCEnderExtSimples = class(TNFSeElementNoEmptys)
  private
  protected
    FCEndPost: String;
    FXCidade: String;
    FXEstProvReg: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cEndPost: String read FCEndPost write FCEndPost;
    property xCidade: String read FXCidade write FXCidade;
    property xEstProvReg: String read FXEstProvReg write FXEstProvReg;
  end;

  TCEnderObraEvento = class(TNFSeElementNoEmptys)
  private
  protected
    FCEP: String;
    FEndExt: TCEnderExtSimples;
    FXLgr: String;
    FNro: String;
    FXCpl: String;
    FXBairro: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CEP: String read FCEP write FCEP;
    property endExt: TCEnderExtSimples read FEndExt write FEndExt;
    // fim xs:choice
    property xLgr: String read FXLgr write FXLgr;
    property nro: String read FNro write FNro;
    property xCpl: String read FXCpl write FXCpl; // minOccurs=0
    property xBairro: String read FXBairro write FXBairro;
  end;

  TCServ = class(TNFSeElementNoEmptys)
  private
  protected
    FLocPrest: TCLocPrest;
    FCServ: TCCServ;
    FComExt: TCComExterior;
    FObra: TCInfoObra;
    FAtvEvento: TCAtvEvento;
    FInfoCompl: TCInfoCompl;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property locPrest: TCLocPrest read FLocPrest write FLocPrest;
    property cServ: TCCServ read FCServ write FCServ;
    property comExt: TCComExterior read FComExt write FComExt; // minOccurs=0
    property obra: TCInfoObra read FObra write FObra; // minOccurs=0
    property atvEvento: TCAtvEvento read FAtvEvento write FAtvEvento; // minOccurs=0
    property infoCompl: TCInfoCompl read FInfoCompl write FInfoCompl; // minOccurs=0
  end;

  TCLocPrest = class(TNFSeElementNoEmptys)
  private
  protected
    FCLocPrestacao: String;
    FCPaisPrestacao: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cLocPrestacao: String read FCLocPrestacao write FCLocPrestacao;
    property cPaisPrestacao: String read FCPaisPrestacao write FCPaisPrestacao;
  end;

  TCCServ = class(TNFSeElementNoEmptys)
  private
  protected
    FCTribNac: String;
    FCTribMun: String;
    FXDescServ: String;
    FCNBS: String;
    FCIntContrib: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cTribNac: String read FCTribNac write FCTribNac;
    property cTribMun: String read FCTribMun write FCTribMun; // minOccurs=0
    property xDescServ: String read FXDescServ write FXDescServ;
    property cNBS: String read FCNBS write FCNBS; // minOccurs=0
    property cIntContrib: String read FCIntContrib write FCIntContrib; // minOccurs=0
  end;

  TCComExterior = class(TNFSeElementNoEmptys)
  private
  protected
    FMdPrestacao: String;
    FVincPrest: String;
    FTpMoeda: String;
    FVServMoeda: String;
    FMecAFComexP: String;
    FMecAFComexT: String;
    FMovTempBens: String;
    FNDI: String;
    FNRE: String;
    FMdic: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property mdPrestacao: String read FMdPrestacao write FMdPrestacao;
    property vincPrest: String read FVincPrest write FVincPrest;
    property tpMoeda: String read FTpMoeda write FTpMoeda;
    property vServMoeda: String read FVServMoeda write FVServMoeda;
    property mecAFComexP: String read FMecAFComexP write FMecAFComexP;
    property mecAFComexT: String read FMecAFComexT write FMecAFComexT;
    property movTempBens: String read FMovTempBens write FMovTempBens;
    property nDI: String read FNDI write FNDI; // minOccurs=0
    property nRE: String read FNRE write FNRE; // minOccurs=0
    property mdic: String read FMdic write FMdic;
  end;

  TCAtvEvento = class(TNFSeElementNoEmptys)
  private
  protected
    FXNome: String;
    FDtIni: String;
    FDtFim: String;
    FIdAtvEvt: String;
    FEnd_: TCEnderecoSimples;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property xNome: String read FXNome write FXNome;
    property dtIni: String read FDtIni write FDtIni;
    property dtFim: String read FDtFim write FDtFim;
    // xs:choice - preencher apenas uma das opcoes abaixo
    property idAtvEvt: String read FIdAtvEvt write FIdAtvEvt;
    property End_: TCEnderecoSimples read FEnd_ write FEnd_; // XML tag: end
    // fim xs:choice
  end;

  TCInfoObra = class(TNFSeElementNoEmptys)
  private
  protected
    FInscImobFisc: String;
    FCObra: String;
    FCCIB: String;
    FEnd_: TCEnderObraEvento;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property inscImobFisc: String read FInscImobFisc write FInscImobFisc; // minOccurs=0
    // xs:choice - preencher apenas uma das opcoes abaixo
    property cObra: String read FCObra write FCObra;
    property cCIB: String read FCCIB write FCCIB;
    property End_: TCEnderObraEvento read FEnd_ write FEnd_; // XML tag: end
    // fim xs:choice
  end;

  TCInfoCompl = class(TNFSeElementNoEmptys)
  private
  protected
    FIdDocTec: String;
    FDocRef: String;
    FXPed: String;
    FGItemPed: TCInfoItemPed;
    FXInfComp: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property idDocTec: String read FIdDocTec write FIdDocTec; // minOccurs=0
    property docRef: String read FDocRef write FDocRef; // minOccurs=0
    property xPed: String read FXPed write FXPed; // minOccurs=0
    property gItemPed: TCInfoItemPed read FGItemPed write FGItemPed; // minOccurs=0
    property xInfComp: String read FXInfComp write FXInfComp; // minOccurs=0
  end;

  TCInfoItemPed = class(TNFSeElementNoEmptys)
  private
  protected
    FXItemPed: TTCInfoItemPedXItemPedArray;
  public
    property xItemPed: TTCInfoItemPedXItemPedArray read FXItemPed write FXItemPed; // XML maxOccurs=99
    procedure AddXItemPed(const AValue: String);
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xItemPed esta em public: maxOccurs=99 no XSD
  end;

  TCInfoValores = class(TNFSeElementNoEmptys)
  private
  protected
    FVServPrest: TCVServPrest;
    FVDescCondIncond: TCVDescCondIncond;
    FVDedRed: TCInfoDedRed;
    FTrib: TCInfoTributacao;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vServPrest: TCVServPrest read FVServPrest write FVServPrest;
    property vDescCondIncond: TCVDescCondIncond read FVDescCondIncond write FVDescCondIncond; // minOccurs=0
    property vDedRed: TCInfoDedRed read FVDedRed write FVDedRed; // minOccurs=0
    property trib: TCInfoTributacao read FTrib write FTrib;
  end;

  TCInfoTributacao = class(TNFSeElementNoEmptys)
  private
  protected
    FTribMun: TCTribMunicipal;
    FTribFed: TCTribFederal;
    FTotTrib: TCTribTotal;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property tribMun: TCTribMunicipal read FTribMun write FTribMun;
    property tribFed: TCTribFederal read FTribFed write FTribFed; // minOccurs=0
    property totTrib: TCTribTotal read FTotTrib write FTotTrib;
  end;

  TCVServPrest = class(TNFSeElementNoEmptys)
  private
  protected
    FVReceb: String;
    FVServ: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vReceb: String read FVReceb write FVReceb; // minOccurs=0
    property vServ: String read FVServ write FVServ;
  end;

  TCVDescCondIncond = class(TNFSeElementNoEmptys)
  private
  protected
    FVDescIncond: String;
    FVDescCond: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vDescIncond: String read FVDescIncond write FVDescIncond; // minOccurs=0
    property vDescCond: String read FVDescCond write FVDescCond; // minOccurs=0
  end;

  TCInfoDedRed = class(TNFSeElementNoEmptys)
  private
  protected
    FPDR: String;
    FVDR: String;
    FDocumentos: TCListaDocDedRed;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property pDR: String read FPDR write FPDR;
    property vDR: String read FVDR write FVDR;
    property documentos: TCListaDocDedRed read FDocumentos write FDocumentos;
    // fim xs:choice
  end;

  TCListaDocDedRed = class(TNFSeElementNoEmptys)
  private
  protected
    FDocDedRed: TTCListaDocDedRedDocDedRedArray;
  public
    destructor Destroy; override;
    property docDedRed: TTCListaDocDedRedDocDedRedArray read FDocDedRed write FDocDedRed; // XML maxOccurs=1000
    function AddDocDedRed: TCDocDedRed;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // docDedRed esta em public: maxOccurs=1000 no XSD
  end;

  TCDocDedRed = class(TNFSeElementNoEmptys)
  private
  protected
    FChNFSe: String;
    FChNFe: String;
    FNFSeMun: TCDocOutNFSe;
    FNFNFS: TCDocNFNFS;
    FNDocFisc: String;
    FNDoc: String;
    FTpDedRed: String;
    FXDescOutDed: String;
    FDtEmiDoc: String;
    FVDedutivelRedutivel: String;
    FVDeducaoReducao: String;
    FFornec: TCInfoPessoa;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property chNFSe: String read FChNFSe write FChNFSe;
    property chNFe: String read FChNFe write FChNFe;
    property NFSeMun: TCDocOutNFSe read FNFSeMun write FNFSeMun;
    property NFNFS: TCDocNFNFS read FNFNFS write FNFNFS;
    property nDocFisc: String read FNDocFisc write FNDocFisc;
    property nDoc: String read FNDoc write FNDoc;
    // fim xs:choice
    property tpDedRed: String read FTpDedRed write FTpDedRed;
    property xDescOutDed: String read FXDescOutDed write FXDescOutDed; // minOccurs=0
    property dtEmiDoc: String read FDtEmiDoc write FDtEmiDoc;
    property vDedutivelRedutivel: String read FVDedutivelRedutivel write FVDedutivelRedutivel;
    property vDeducaoReducao: String read FVDeducaoReducao write FVDeducaoReducao;
    property fornec: TCInfoPessoa read FFornec write FFornec; // minOccurs=0
  end;

  TCDocOutNFSe = class(TNFSeElementNoEmptys)
  private
  protected
    FCMunNFSeMun: String;
    FNNFSeMun: String;
    FCVerifNFSeMun: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cMunNFSeMun: String read FCMunNFSeMun write FCMunNFSeMun;
    property nNFSeMun: String read FNNFSeMun write FNNFSeMun;
    property cVerifNFSeMun: String read FCVerifNFSeMun write FCVerifNFSeMun;
  end;

  TCDocNFNFS = class(TNFSeElementNoEmptys)
  private
  protected
    FNNFS: String;
    FModNFS: String;
    FSerieNFS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property nNFS: String read FNNFS write FNNFS;
    property modNFS: String read FModNFS write FModNFS;
    property serieNFS: String read FSerieNFS write FSerieNFS;
  end;

  TCTribMunicipal = class(TNFSeElementNoEmptys)
  private
  protected
    FTribISSQN: String;
    FCPaisResult: String;
    FTpImunidade: String;
    FExigSusp: TCExigSuspensa;
    FBM: TCBeneficioMunicipal;
    FTpRetISSQN: String;
    FPAliq: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property tribISSQN: String read FTribISSQN write FTribISSQN;
    property cPaisResult: String read FCPaisResult write FCPaisResult; // minOccurs=0
    property tpImunidade: String read FTpImunidade write FTpImunidade; // minOccurs=0
    property exigSusp: TCExigSuspensa read FExigSusp write FExigSusp; // minOccurs=0
    property BM: TCBeneficioMunicipal read FBM write FBM; // minOccurs=0
    property tpRetISSQN: String read FTpRetISSQN write FTpRetISSQN;
    property pAliq: String read FPAliq write FPAliq; // minOccurs=0
  end;

  TCBeneficioMunicipal = class(TNFSeElementNoEmptys)
  private
  protected
    FNBM: String;
    FVRedBCBM: String;
    FPRedBCBM: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property nBM: String read FNBM write FNBM;
    // xs:choice - preencher apenas uma das opcoes abaixo
    property vRedBCBM: String read FVRedBCBM write FVRedBCBM; // minOccurs=0
    property pRedBCBM: String read FPRedBCBM write FPRedBCBM; // minOccurs=0
    // fim xs:choice
  end;

  TCExigSuspensa = class(TNFSeElementNoEmptys)
  private
  protected
    FTpSusp: String;
    FNProcesso: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property tpSusp: String read FTpSusp write FTpSusp;
    property nProcesso: String read FNProcesso write FNProcesso;
  end;

  TCTribFederal = class(TNFSeElementNoEmptys)
  private
  protected
    FPiscofins: TCTribOutrosPisCofins;
    FVRetCP: String;
    FVRetIRRF: String;
    FVRetCSLL: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property piscofins: TCTribOutrosPisCofins read FPiscofins write FPiscofins; // minOccurs=0
    property vRetCP: String read FVRetCP write FVRetCP; // minOccurs=0
    property vRetIRRF: String read FVRetIRRF write FVRetIRRF; // minOccurs=0
    property vRetCSLL: String read FVRetCSLL write FVRetCSLL; // minOccurs=0
  end;

  TCTribOutrosPisCofins = class(TNFSeElementNoEmptys)
  private
  protected
    FCST: String;
    FVBCPisCofins: String;
    FPAliqPis: String;
    FPAliqCofins: String;
    FVPis: String;
    FVCofins: String;
    FTpRetPisCofins: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property CST: String read FCST write FCST;
    property vBCPisCofins: String read FVBCPisCofins write FVBCPisCofins; // minOccurs=0
    property pAliqPis: String read FPAliqPis write FPAliqPis; // minOccurs=0
    property pAliqCofins: String read FPAliqCofins write FPAliqCofins; // minOccurs=0
    property vPis: String read FVPis write FVPis; // minOccurs=0
    property vCofins: String read FVCofins write FVCofins; // minOccurs=0
    property tpRetPisCofins: String read FTpRetPisCofins write FTpRetPisCofins; // minOccurs=0
  end;

  TCTribTotal = class(TNFSeElementNoEmptys)
  private
  protected
    FVTotTrib: TCTribTotalMonet;
    FPTotTrib: TCTribTotalPercent;
    FIndTotTrib: String;
    FPTotTribSN: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property vTotTrib: TCTribTotalMonet read FVTotTrib write FVTotTrib;
    property pTotTrib: TCTribTotalPercent read FPTotTrib write FPTotTrib;
    property indTotTrib: String read FIndTotTrib write FIndTotTrib;
    property pTotTribSN: String read FPTotTribSN write FPTotTribSN;
    // fim xs:choice
  end;

  TCTribTotalMonet = class(TNFSeElementNoEmptys)
  private
  protected
    FVTotTribFed: String;
    FVTotTribEst: String;
    FVTotTribMun: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property vTotTribFed: String read FVTotTribFed write FVTotTribFed;
    property vTotTribEst: String read FVTotTribEst write FVTotTribEst;
    property vTotTribMun: String read FVTotTribMun write FVTotTribMun;
  end;

  TCTribTotalPercent = class(TNFSeElementNoEmptys)
  private
  protected
    FPTotTribFed: String;
    FPTotTribEst: String;
    FPTotTribMun: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pTotTribFed: String read FPTotTribFed write FPTotTribFed;
    property pTotTribEst: String read FPTotTribEst write FPTotTribEst;
    property pTotTribMun: String read FPTotTribMun write FPTotTribMun;
  end;

  TCRTCInfoIBSCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FFinNFSe: String;
    FIndFinal: String;
    FCIndOp: String;
    FTpOper: String;
    FGRefNFSe: TCInfoRefNFSe;
    FTpEnteGov: String;
    FIndDest: String;
    FDest: TCRTCInfoDest;
    FImovel: TCRTCInfoImovel;
    FValores: TCRTCInfoValoresIBSCBS;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property finNFSe: String read FFinNFSe write FFinNFSe;
    property indFinal: String read FIndFinal write FIndFinal; // minOccurs=0
    property cIndOp: String read FCIndOp write FCIndOp;
    property tpOper: String read FTpOper write FTpOper; // minOccurs=0
    property gRefNFSe: TCInfoRefNFSe read FGRefNFSe write FGRefNFSe; // minOccurs=0
    property tpEnteGov: String read FTpEnteGov write FTpEnteGov; // minOccurs=0
    property indDest: String read FIndDest write FIndDest;
    property dest: TCRTCInfoDest read FDest write FDest; // minOccurs=0
    property imovel: TCRTCInfoImovel read FImovel write FImovel; // minOccurs=0
    property valores: TCRTCInfoValoresIBSCBS read FValores write FValores;
  end;

  TCInfoRefNFSe = class(TNFSeElementNoEmptys)
  private
  protected
    FRefNFSe: TTCInfoRefNFSeRefNFSeArray;
  public
    property refNFSe: TTCInfoRefNFSeRefNFSeArray read FRefNFSe write FRefNFSe; // XML maxOccurs=99
    procedure AddRefNFSe(const AValue: String);
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // refNFSe esta em public: maxOccurs=99 no XSD
  end;

  TCRTCInfoDest = class(TNFSeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FNIF: String;
    FCNaoNIF: String;
    FXNome: String;
    FEnd_: TCEndereco;
    FFone: String;
    FEmail: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property NIF: String read FNIF write FNIF;
    property cNaoNIF: String read FCNaoNIF write FCNaoNIF;
    // fim xs:choice
    property xNome: String read FXNome write FXNome;
    property End_: TCEndereco read FEnd_ write FEnd_; // XML tag: end; minOccurs=0
    property fone: String read FFone write FFone; // minOccurs=0
    property email: String read FEmail write FEmail; // minOccurs=0
  end;

  TCRTCInfoImovel = class(TNFSeElementNoEmptys)
  private
  protected
    FInscImobFisc: String;
    FCCIB: String;
    FEnd_: TCEnderObraEvento;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property inscImobFisc: String read FInscImobFisc write FInscImobFisc; // minOccurs=0
    // xs:choice - preencher apenas uma das opcoes abaixo
    property cCIB: String read FCCIB write FCCIB;
    property End_: TCEnderObraEvento read FEnd_ write FEnd_; // XML tag: end
    // fim xs:choice
  end;

  TCRTCInfoValoresIBSCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FGReeRepRes: TCRTCInfoReeRepRes;
    FTrib: TCRTCInfoTributosIBSCBS;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property gReeRepRes: TCRTCInfoReeRepRes read FGReeRepRes write FGReeRepRes; // minOccurs=0
    property trib: TCRTCInfoTributosIBSCBS read FTrib write FTrib;
  end;

  TCRTCInfoReeRepRes = class(TNFSeElementNoEmptys)
  private
  protected
    FDocumentos: TTCRTCInfoReeRepResDocumentosArray;
  public
    destructor Destroy; override;
    property documentos: TTCRTCInfoReeRepResDocumentosArray read FDocumentos write FDocumentos; // XML maxOccurs=1000
    function AddDocumentos: TCRTCListaDoc;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // documentos esta em public: maxOccurs=1000 no XSD
  end;

  TCRTCInfoTributosIBSCBS = class(TNFSeElementNoEmptys)
  private
  protected
    FGIBSCBS: TCRTCInfoTributosSitClas;
  public
    constructor Create;
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property gIBSCBS: TCRTCInfoTributosSitClas read FGIBSCBS write FGIBSCBS;
  end;

  TCRTCListaDoc = class(TNFSeElementNoEmptys)
  private
  protected
    FDFeNacional: TCRTCListaDocDFe;
    FDocFiscalOutro: TCRTCListaDocFiscalOutro;
    FDocOutro: TCRTCListaDocOutro;
    FFornec: TCRTCListaDocFornec;
    FDtEmiDoc: String;
    FDtCompDoc: String;
    FTpReeRepRes: String;
    FXTpReeRepRes: String;
    FVlrReeRepRes: String;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property dFeNacional: TCRTCListaDocDFe read FDFeNacional write FDFeNacional;
    property docFiscalOutro: TCRTCListaDocFiscalOutro read FDocFiscalOutro write FDocFiscalOutro;
    property docOutro: TCRTCListaDocOutro read FDocOutro write FDocOutro;
    // fim xs:choice
    property fornec: TCRTCListaDocFornec read FFornec write FFornec; // minOccurs=0
    property dtEmiDoc: String read FDtEmiDoc write FDtEmiDoc;
    property dtCompDoc: String read FDtCompDoc write FDtCompDoc;
    property tpReeRepRes: String read FTpReeRepRes write FTpReeRepRes;
    property xTpReeRepRes: String read FXTpReeRepRes write FXTpReeRepRes; // minOccurs=0
    property vlrReeRepRes: String read FVlrReeRepRes write FVlrReeRepRes;
  end;

  TCRTCListaDocDFe = class(TNFSeElementNoEmptys)
  private
  protected
    FTipoChaveDFe: String;
    FXTipoChaveDFe: String;
    FChaveDFe: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property tipoChaveDFe: String read FTipoChaveDFe write FTipoChaveDFe;
    property xTipoChaveDFe: String read FXTipoChaveDFe write FXTipoChaveDFe; // minOccurs=0
    property chaveDFe: String read FChaveDFe write FChaveDFe;
  end;

  TCRTCListaDocFiscalOutro = class(TNFSeElementNoEmptys)
  private
  protected
    FCMunDocFiscal: String;
    FNDocFiscal: String;
    FXDocFiscal: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property cMunDocFiscal: String read FCMunDocFiscal write FCMunDocFiscal;
    property nDocFiscal: String read FNDocFiscal write FNDocFiscal;
    property xDocFiscal: String read FXDocFiscal write FXDocFiscal;
  end;

  TCRTCListaDocOutro = class(TNFSeElementNoEmptys)
  private
  protected
    FNDoc: String;
    FXDoc: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property nDoc: String read FNDoc write FNDoc;
    property xDoc: String read FXDoc write FXDoc;
  end;

  TCRTCListaDocFornec = class(TNFSeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FNIF: String;
    FCNaoNIF: String;
    FXNome: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    // xs:choice - preencher apenas uma das opcoes abaixo
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property NIF: String read FNIF write FNIF;
    property cNaoNIF: String read FCNaoNIF write FCNaoNIF;
    // fim xs:choice
    property xNome: String read FXNome write FXNome;
  end;

  TCRTCInfoTributosSitClas = class(TNFSeElementNoEmptys)
  private
  protected
    FCST: String;
    FCClassTrib: String;
    FCCredPres: String;
    FGTribRegular: TCRTCInfoTributosTribRegular;
    FGDif: TCRTCInfoTributosDif;
  public
    destructor Destroy; override;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property CST: String read FCST write FCST;
    property cClassTrib: String read FCClassTrib write FCClassTrib;
    property cCredPres: String read FCCredPres write FCCredPres; // minOccurs=0
    property gTribRegular: TCRTCInfoTributosTribRegular read FGTribRegular write FGTribRegular; // minOccurs=0
    property gDif: TCRTCInfoTributosDif read FGDif write FGDif; // minOccurs=0
  end;

  TCRTCInfoTributosTribRegular = class(TNFSeElementNoEmptys)
  private
  protected
    FCSTReg: String;
    FCClassTribReg: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property CSTReg: String read FCSTReg write FCSTReg;
    property cClassTribReg: String read FCClassTribReg write FCClassTribReg;
  end;

  TCRTCInfoTributosDif = class(TNFSeElementNoEmptys)
  private
  protected
    FPDifUF: String;
    FPDifMun: String;
    FPDifCBS: String;
  published (* Nao altere a ordem das propriedades; ela segue a ordem do XSD para o XML *)
    property pDifUF: String read FPDifUF write FPDifUF;
    property pDifMun: String read FPDifMun write FPDifMun;
    property pDifCBS: String read FPDifCBS write FPDifCBS;
  end;

  TDPSNacional = TCDPS;
  TNFSeNacional = TCNFSe;

implementation

constructor TCNFSe.Create;
begin
  inherited Create;
  FVersao := '1.01';
  FInfNFSe := TCInfNFSe.Create;
  FSignature := TSignature.Create;
end;

destructor TCNFSe.Destroy;
begin
  FInfNFSe.Free;
  FSignature.Free;
  inherited Destroy;
end;

constructor TCInfNFSe.Create;
begin
  inherited Create;
  FEmit := TCEmitente.Create;
  FValores := TCValoresNFSe.Create;
  FDPS := TCDPS.Create;
end;

destructor TCInfNFSe.Destroy;
begin
  FEmit.Free;
  FValores.Free;
  FIBSCBS.Free;
  FDPS.Free;
  inherited Destroy;
end;

constructor TCEmitente.Create;
begin
  inherited Create;
  FEnderNac := TCEnderecoEmitente.Create;
end;

destructor TCEmitente.Destroy;
begin
  FEnderNac.Free;
  inherited Destroy;
end;

constructor TCRTCIBSCBS.Create;
begin
  inherited Create;
  FValores := TCRTCValoresIBSCBS.Create;
  FTotCIBS := TCRTCTotalCIBS.Create;
end;

destructor TCRTCIBSCBS.Destroy;
begin
  FValores.Free;
  FTotCIBS.Free;
  inherited Destroy;
end;

constructor TCRTCValoresIBSCBS.Create;
begin
  inherited Create;
  FUf := TCRTCValoresIBSCBSUF.Create;
  FMun := TCRTCValoresIBSCBSMun.Create;
  FFed := TCRTCValoresIBSCBSFed.Create;
end;

destructor TCRTCValoresIBSCBS.Destroy;
begin
  FUf.Free;
  FMun.Free;
  FFed.Free;
  inherited Destroy;
end;

constructor TCRTCTotalCIBS.Create;
begin
  inherited Create;
  FGIBS := TCRTCTotalIBS.Create;
  FGCBS := TCRTCTotalCBS.Create;
end;

destructor TCRTCTotalCIBS.Destroy;
begin
  FGIBS.Free;
  FGCBS.Free;
  FGTribRegular.Free;
  FGTribCompraGov.Free;
  inherited Destroy;
end;

constructor TCRTCTotalIBS.Create;
begin
  inherited Create;
  FGIBSUFTot := TCRTCTotalIBSUF.Create;
  FGIBSMunTot := TCRTCTotalIBSMun.Create;
end;

destructor TCRTCTotalIBS.Destroy;
begin
  FGIBSCredPres.Free;
  FGIBSUFTot.Free;
  FGIBSMunTot.Free;
  inherited Destroy;
end;

destructor TCRTCTotalCBS.Destroy;
begin
  FGCBSCredPres.Free;
  inherited Destroy;
end;

constructor TCDPS.Create;
begin
  inherited Create;
  FXmlns := 'http://www.sped.fazenda.gov.br/nfse';
  FVersao := '1.01';
  FInfDPS := TCInfDPS.Create;
end;

destructor TCDPS.Destroy;
begin
  FInfDPS.Free;
  FSignature.Free;
  inherited Destroy;
end;

constructor TCInfDPS.Create;
begin
  inherited Create;
  FPrest := TCInfoPrestador.Create;
  FServ := TCServ.Create;
  FValores := TCInfoValores.Create;
end;

destructor TCInfDPS.Destroy;
begin
  FSubst.Free;
  FPrest.Free;
  FToma.Free;
  FInterm.Free;
  FServ.Free;
  FValores.Free;
  FIBSCBS.Free;
  inherited Destroy;
end;

constructor TCInfoPrestador.Create;
begin
  inherited Create;
  FRegTrib := TCRegTrib.Create;
end;

destructor TCInfoPrestador.Destroy;
begin
  FEnd_.Free;
  FRegTrib.Free;
  inherited Destroy;
end;

destructor TCInfoPessoa.Destroy;
begin
  FEnd_.Free;
  inherited Destroy;
end;

destructor TCEndereco.Destroy;
begin
  FEndNac.Free;
  FEndExt.Free;
  inherited Destroy;
end;

destructor TCEnderecoSimples.Destroy;
begin
  FEndExt.Free;
  inherited Destroy;
end;

destructor TCEnderObraEvento.Destroy;
begin
  FEndExt.Free;
  inherited Destroy;
end;

constructor TCServ.Create;
begin
  inherited Create;
  FLocPrest := TCLocPrest.Create;
  FCServ := TCCServ.Create;
end;

destructor TCServ.Destroy;
begin
  FLocPrest.Free;
  FCServ.Free;
  FComExt.Free;
  FObra.Free;
  FAtvEvento.Free;
  FInfoCompl.Free;
  inherited Destroy;
end;

destructor TCAtvEvento.Destroy;
begin
  FEnd_.Free;
  inherited Destroy;
end;

destructor TCInfoObra.Destroy;
begin
  FEnd_.Free;
  inherited Destroy;
end;

destructor TCInfoCompl.Destroy;
begin
  FGItemPed.Free;
  inherited Destroy;
end;

procedure TCInfoItemPed.AddXItemPed(const AValue: String);
var
  L: Integer;
begin
  L := Length(FXItemPed);
  SetLength(FXItemPed, L + 1);
  FXItemPed[L] := AValue;
end;

constructor TCInfoValores.Create;
begin
  inherited Create;
  FVServPrest := TCVServPrest.Create;
  FTrib := TCInfoTributacao.Create;
end;

destructor TCInfoValores.Destroy;
begin
  FVServPrest.Free;
  FVDescCondIncond.Free;
  FVDedRed.Free;
  FTrib.Free;
  inherited Destroy;
end;

constructor TCInfoTributacao.Create;
begin
  inherited Create;
  FTribMun := TCTribMunicipal.Create;
  FTotTrib := TCTribTotal.Create;
end;

destructor TCInfoTributacao.Destroy;
begin
  FTribMun.Free;
  FTribFed.Free;
  FTotTrib.Free;
  inherited Destroy;
end;

destructor TCInfoDedRed.Destroy;
begin
  FDocumentos.Free;
  inherited Destroy;
end;

destructor TCListaDocDedRed.Destroy;
var
  I: Integer;
begin
  for I := Low(FDocDedRed) to High(FDocDedRed) do
    FDocDedRed[I].Free;
  SetLength(FDocDedRed, 0);
  inherited Destroy;
end;

function TCListaDocDedRed.AddDocDedRed: TCDocDedRed;
var
  L: Integer;
begin
  L := Length(FDocDedRed);
  SetLength(FDocDedRed, L + 1);
  FDocDedRed[L] := TCDocDedRed.Create;
  Result := FDocDedRed[L];
end;

destructor TCDocDedRed.Destroy;
begin
  FNFSeMun.Free;
  FNFNFS.Free;
  FFornec.Free;
  inherited Destroy;
end;

destructor TCTribMunicipal.Destroy;
begin
  FExigSusp.Free;
  FBM.Free;
  inherited Destroy;
end;

destructor TCTribFederal.Destroy;
begin
  FPiscofins.Free;
  inherited Destroy;
end;

destructor TCTribTotal.Destroy;
begin
  FVTotTrib.Free;
  FPTotTrib.Free;
  inherited Destroy;
end;

constructor TCRTCInfoIBSCBS.Create;
begin
  inherited Create;
  FValores := TCRTCInfoValoresIBSCBS.Create;
end;

destructor TCRTCInfoIBSCBS.Destroy;
begin
  FGRefNFSe.Free;
  FDest.Free;
  FImovel.Free;
  FValores.Free;
  inherited Destroy;
end;

procedure TCInfoRefNFSe.AddRefNFSe(const AValue: String);
var
  L: Integer;
begin
  L := Length(FRefNFSe);
  SetLength(FRefNFSe, L + 1);
  FRefNFSe[L] := AValue;
end;

destructor TCRTCInfoDest.Destroy;
begin
  FEnd_.Free;
  inherited Destroy;
end;

destructor TCRTCInfoImovel.Destroy;
begin
  FEnd_.Free;
  inherited Destroy;
end;

constructor TCRTCInfoValoresIBSCBS.Create;
begin
  inherited Create;
  FTrib := TCRTCInfoTributosIBSCBS.Create;
end;

destructor TCRTCInfoValoresIBSCBS.Destroy;
begin
  FGReeRepRes.Free;
  FTrib.Free;
  inherited Destroy;
end;

destructor TCRTCInfoReeRepRes.Destroy;
var
  I: Integer;
begin
  for I := Low(FDocumentos) to High(FDocumentos) do
    FDocumentos[I].Free;
  SetLength(FDocumentos, 0);
  inherited Destroy;
end;

function TCRTCInfoReeRepRes.AddDocumentos: TCRTCListaDoc;
var
  L: Integer;
begin
  L := Length(FDocumentos);
  SetLength(FDocumentos, L + 1);
  FDocumentos[L] := TCRTCListaDoc.Create;
  Result := FDocumentos[L];
end;

constructor TCRTCInfoTributosIBSCBS.Create;
begin
  inherited Create;
  FGIBSCBS := TCRTCInfoTributosSitClas.Create;
end;

destructor TCRTCInfoTributosIBSCBS.Destroy;
begin
  FGIBSCBS.Free;
  inherited Destroy;
end;

destructor TCRTCListaDoc.Destroy;
begin
  FDFeNacional.Free;
  FDocFiscalOutro.Free;
  FDocOutro.Free;
  FFornec.Free;
  inherited Destroy;
end;

destructor TCRTCInfoTributosSitClas.Destroy;
begin
  FGTribRegular.Free;
  FGDif.Free;
  inherited Destroy;
end;

function TCInfoPrestador.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'END_') then
    Result := 'end';
end;

function TCInfoPessoa.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'END_') then
    Result := 'end';
end;

end.