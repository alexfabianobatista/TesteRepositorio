unit Transp;

interface

uses
  NfeTypes, TypInfo;

type
  TVol = class(TNFeElementNoEmptys)
  protected
    FQVol: Integer;
    FEsp: String;
    FMarca: String;
    FNVol: String;
    FPesoL: TNFeFloat3;
    FPesoB: TNFeFloat3;
    FLacre: TObject; //Lacres não implementados
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QVol: Integer read FQVol write FQVol;
    property Esp: String read FEsp write FEsp;
    property Marca: String read FMarca write FMarca;
    property NVol: String read FNVol write FNVol;
    property PesoL: TNFeFloat3 read FPesoL write FPesoL;
    property PesoB: TNFeFloat3 read FPesoB write FPesoB;
    property Lacre: TObject read FLacre write FLacre;
  end;

  TReboque = class(TNFeElement)
  protected
    FPlaca: String;
    FUF: String;
    FRNTC: String;
    FVagao: String;
    FBalsa: String;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Placa: String read FPlaca write FPlaca;
    property UF: String read FUF write FUF;
    property RNTC: String read FRNTC write FRNTC;
    property Vagao: String read FVagao write FVagao;
    property Balsa: String read FBalsa write FBalsa;
  end;

  TVeicTransp = class(TNFeElementNoEmptys)
  protected
    FPlaca: String;
    FUF: String;
    FRNTC: String;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Placa: String read FPlaca write FPlaca;
    property UF: String read FUF write FUF;
    property RNTC: String read FRNTC write FRNTC;
  end;

  TRetTransp = class(TNFeElement)
  protected
    FVServ: Extended;
    FVBCRet: Extended;
    FPICMSRet: Extended;
    FVICMSRet: Extended;
    FCFOP: Integer;
    FCMunFG: Integer;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VServ: Extended read FVServ write FVServ;
    property VBCRet: Extended read FVBCRet write FVBCRet;
    property PICMSRet: Extended read FPICMSRet write FPICMSRet;
    property VICMSRet: Extended read FVICMSRet write FVICMSRet;
    property CFOP: Integer read FCFOP write FCFOP;
    property CMunFG: Integer read FCMunFG write FCMunFG;
  end;

  TTransporta = class(TNFeElementNoEmptys)
  protected
    FCNPJ: String;
    FCPF: String;
    FXNome: String;
    FIE: String;
    FXEnder: String;
    FXMun: String;
    FUF: String;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property XNome: String read FXNome write FXNome;
    property IE: String read FIE write FIE;
    property XEnder: String read FXEnder write FXEnder;
    property XMun: String read FXMun write FXMun;
    property UF: String read FUF write FUF;
  end;

  //X01
  TTransp = class(TNFeElement)
  protected
    FModFrete: Integer;
    FTransporta: TTransporta;
    FRetTransp: TRetTransp;
    FVeicTransp: TVeicTransp;
    FReboque: TReboque;
    FVol: TVol;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModFrete: Integer read FModFrete write FModFrete;
    property Transporta: TTransporta read FTransporta write FTransporta;
    property RetTransp: TRetTransp read FRetTransp write FRetTransp;
    property VeicTransp: TVeicTransp read FVeicTransp write FVeicTransp;
    property Reboque: TReboque read FReboque write FReboque;
    property Vol: TVol read FVol write FVol;
  end;

implementation

uses SysUtils;

end.
