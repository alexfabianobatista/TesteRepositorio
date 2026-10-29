unit InfIbsCbs;

interface

uses
  TypInfo, NfseTypes;

type
  TGRefNFSe = class(TNFSeElement)
  private
    FRefNFSe: String;
  published
    property RefNFSe: String read FRefNFSe write FRefNFSe;
  end;

  TGDif = class(TNFSeElementNoEmptys)
  private
    FpDifUF: String;
    FpDifMun: String;
    FpDifCBS: String;
  published
    property pDifUF: String read FpDifUF write FpDifUF;
    property pDifMun: String read FpDifMun write FpDifMun;
    property pDifCBS: String read FpDifCBS write FpDifCBS;
  end;

  TGTribRegular = class(TNFSeElementNoEmptys)
  private
    FCstReg: String;
    FcClassTribReg: String;
  published
    property CstReg: String read FCstReg write FCstReg;
    property cClassTribReg: String read FcClassTribReg write FcClassTribReg;
  end;

  TGIBSCBS = class(TNFSeElementNoEmptys)
  private
    FCst: String;
    FcClassTrib: String;
    FcCredPres: String;
    FGTribRegular: TGTribRegular;
    FGDif: TGDif;
  published
    property Cst: String read FCst write FCst;
    property cClassTrib: String read FcClassTrib write FcClassTrib;
    property cCredPres: String read FcCredPres write FcCredPres;
    property gTribRegular: TGTribRegular read FGTribRegular write FGTribRegular;
    property gDif: TGDif read FGDif write FGDif;
  end;

  TCpfCnpj = class(TNFSeElement)
  private
    FCnpj: String;
  published
    property Cnpj: String read FCnpj write FCnpj;
  end;

  TDest = class(TNFSeElement)
  private
    FCpfCnpj: TCpfCnpj;
    FGIBSCBS: TGIBSCBS;
  published
    property CpfCnpj: TCpfCnpj read FCpfCnpj write FCpfCnpj;
    property gIBSCBS: TGIBSCBS read FGIBSCBS write FGIBSCBS;
  end;

  TInfIbsCbs = class(TNFSeElementNoEmptys)
  private
    FfinNFSe: String;
    FindFinal: String;
    FcIndOp: String;
    FtpOper: String;
    FGRefNFSe: TGRefNFSe;
    FtpEnteGov: String;
    FindDest: String;
    FDest: TDest;
  published
    property finNFSe: String read FfinNFSe write FfinNFSe;
    property indFinal: String read FindFinal write FindFinal;
    property cIndOp: String read FcIndOp write FcIndOp;
    property tpOper: String read FtpOper write FtpOper;
    property gRefNFSe: TGRefNFSe read FGRefNFSe write FGRefNFSe;
    property tpEnteGov: String read FtpEnteGov write FtpEnteGov;
    property indDest: String read FindDest write FindDest;
    property dest: TDest read FDest write FDest;
  end;

implementation

end. 
