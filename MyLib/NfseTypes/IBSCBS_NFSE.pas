unit IBSCBS_NFSE;

interface

uses
  NfseTypes;

type
  TIBSUF = class(TNFSeElement)
  private
    FpIBSUF: String;
    FpRedAliqUF: String;
    FpAliqEfetUF: String;
  published
    property pIBSUF: String read FpIBSUF write FpIBSUF;
    property pRedAliqUF: String read FpRedAliqUF write FpRedAliqUF;
    property pAliqEfetUF: String read FpAliqEfetUF write FpAliqEfetUF;
  end;

  TIBSMun = class(TNFSeElement)
  private
    FpIBSMun: String;
    FpRedAliqMun: String;
    FpAliqEfetMun: String;
  published
    property pIBSMun: String read FpIBSMun write FpIBSMun;
    property pRedAliqMun: String read FpRedAliqMun write FpRedAliqMun;
    property pAliqEfetMun: String read FpAliqEfetMun write FpAliqEfetMun;
  end;

  TGIBSUF = class(TNFSeElement)
  private
    FvDifUF: String;
    FvIBSUF: String;
  published
    property vDifUF: String read FvDifUF write FvDifUF;
    property vIBSUF: String read FvIBSUF write FvIBSUF;
  end;

  TGIBSMunTot = class(TNFSeElement)
  private
    FvDifMun: String;
    FvIBSMun: String;
  published
    property vDifMun: String read FvDifMun write FvDifMun;
    property vIBSMun: String read FvIBSMun write FvIBSMun;
  end;

  TGIBS = class(TNFSeElement)
  private
    FGIBSUF: TGIBSUF;
    FGIBSMunTot: TGIBSMunTot;
  published
    property gIBSUF: TGIBSUF read FGIBSUF write FGIBSUF;
    property gIBSMunTot: TGIBSMunTot read FGIBSMunTot write FGIBSMunTot;
  end;

  TGCBSCredPres = class(TNFSeElement)
  private
    FpCredPresCBS: String;
    FvCredPresCBS: String;
    FvDifCBS: String;
    FvCBS: String;
  published
    property pCredPresCBS: String read FpCredPresCBS write FpCredPresCBS;
    property vCredPresCBS: String read FvCredPresCBS write FvCredPresCBS;
    property vDifCBS: String read FvDifCBS write FvDifCBS;
    property vCBS: String read FvCBS write FvCBS;
  end;

  TGCBS = class(TNFSeElement)
  private
    FGCBSCredPres: TGCBSCredPres;
  published
    property gCBSCredPres: TGCBSCredPres read FGCBSCredPres write FGCBSCredPres;
  end;

  TTotCIBS = class(TNFSeElement)
  private
    FGIBS: TGIBS;
    FGCBS: TGCBS;
  published
    property gIBS: TGIBS read FGIBS write FGIBS;
    property gCBS: TGCBS read FGCBS write FGCBS;
  end;

  TValoresIBSCBS = class(TNFSeElement)
  private
    FvBC: String;
    FUF: TIBSUF;
    FMun: TIBSMun;
    FTotCIBS: TTotCIBS;
  published
    property vBC: String read FvBC write FvBC;
    property uf: TIBSUF read FUF write FUF;
    property mun: TIBSMun read FMun write FMun;
    property totCIBS: TTotCIBS read FTotCIBS write FTotCIBS;
  end;

  TIBSCBS = class(TNFSeElement)
  private
    FcLocalidadeIncid: String;
    FxLocalidadeIncid: String;
    FpRedutor: String;
    FValores: TValoresIBSCBS;
  published
    property cLocalidadeIncid: String read FcLocalidadeIncid write FcLocalidadeIncid;
    property xLocalidadeIncid: String read FxLocalidadeIncid write FxLocalidadeIncid;
    property pRedutor: String read FpRedutor write FpRedutor;
    property valores: TValoresIBSCBS read FValores write FValores;
  end;

implementation

end.
