unit RodoMdfe;

interface

uses
  MdfeTypes, TypInfo;

type
  TDisp = class(TMDFeElementNoEmptys)
  protected
    FCNPJForn: String;
    FCNPJPg: String;
    FCPFPg: String;
    FNCompra: String;
    FVValePed: TMDFeFloat2;
    FTpValePed: String;

  published
    property CNPJForn: String read FCNPJForn write FCNPJForn;
    property CNPJPg: String read FCNPJPg write FCNPJPg;
    property CPFPg: String read FCPFPg write FCPFPg;
    property NCompra: String read FNCompra write FNCompra;
    property VValePed: TMDFeFloat2 read FVValePed write FVValePed;
    property TpValePed: String read FTpValePed write FTpValePed;
  end;
  TValePed = class(TMDFeElement)
  protected
    FDisp: TMDFeElementItems;
    FCategCombVeic: String;
  published
    property Disp: TMDFeElementItems read FDisp write FDisp;
    property CategCombVeic: String read FCategCombVeic write FCategCombVeic;
  end;
  TCondutor = class(TMDFeElement)
  protected
    FXNome: String;
    FCPF: String;
  published
    property XNome: String read FXNome write FXNome;
    property CPF: String read FCPF write FCPF;
  end;
  TProp = class(TMDFeElement)
  protected
    FCPF: String;
    FCNPJ: String;
    FRNTRC: String;
    FXNome: String;
    FIE: String;
    FUF: String;
    FTpProp: Integer;
  published
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
    property RNTRC: String read FRNTRC write FRNTRC;
    property XNome: String read FXNome write FXNome;
    property IE: String read FIE write FIE;
    property UF: String read FUF write FUF;
    property TpProp: Integer read FTpProp write FTpProp;
  end;
  TVeic = class(TMDFeElementNoEmptys)
  protected
    FCInt: String;
    FPlaca: String;
    FTara: Integer;
    FCapKG: Integer;
    FCapM3: Integer;
    FProp: TProp;
    FCondutor: TMDFeElementItems;
    FTpRod: TMDFeIntegerComZero;
    FTpCar: TMDFeIntegerComZero;
    FUF: String;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published
    property CInt: String read FCInt write FCInt;
    property Placa: String read FPlaca write FPlaca;
    property Tara: Integer read FTara write FTara;
    property CapKG: Integer read FCapKG write FCapKG;
    property CapM3: Integer read FCapM3 write FCapM3;
    property Prop: TProp read FProp write FProp;
    property Condutor: TMDFeElementItems read FCondutor write FCondutor;
    property TpRod: TMDFeIntegerComZero read FTpRod write FTpRod;
    property TpCar: TMDFeIntegerComZero read FTpCar write FTpCar;
    property UF: String read FUF write FUF;
  end;
  TVeicTracao = class(TVeic)
  protected
  published
    property CInt;
    property Placa;
    property Tara;
    property CapKG;
    property CapM3;
    property Prop;
    property Condutor;
    property TpRod;
    property TpCar;
    property UF;
  end;
  TVeicReboque = class(TVeic)
  protected
  published
    property CInt;
    property Placa;
    property Tara;
    property CapKG;
    property CapM3;
    property Prop;
    property Condutor;
    property TpCar;
    property UF;
  end;
  TInfCIOT = class(TMDFeElementNoEmptys)
  protected
    FCIOT: String;
    FCPF: String;
    FCNPJ: String;
  published
    property CIOT: String read FCIOT write FCIOT;
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
  end;
  TInfContratante = class(TMDFeElementNoEmptys)
  protected
    FCPF: String;
    FCNPJ: String;
    FIdEstrangeiro: String;
  published
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
    property IdEstrangeiro: String read FIdEstrangeiro write FIdEstrangeiro;
  end;

  TInfBanc = class(TMDFeElementNoEmptys)
  protected
    FCodBanco: String;
    FCodAgencia: String;
    FCNPJIPEF: String;
    FPIX: String;
  published
    property CodBanco: String read FCodBanco write FCodBanco;
    property CodAgencia: String read FCodAgencia write FCodAgencia;
    property CNPJIPEF: String read FCNPJIPEF write FCNPJIPEF;
    property PIX: String read FPIX write FPIX;
  end;

  TInfPrazo = class(TMDFeElement)
  protected
    FNParcela: String;
    FDVenc: TMDFeData;
    FVParcela: TMDFeFloat2;
  published
    property NParcela: String read FNParcela write FNParcela;
    property DVenc: TMDFeData read FDVenc write FDVenc;
    property VParcela: TMDFeFloat2 read FVParcela write FVParcela;
  end;

  TComp = class(TMDFeElement)
  protected
    FTpComp: TMDFeIntegerComZero;
    FVComp: TMDFeFloat2;
    FXComp: String;
  published
    property TpComp: TMDFeIntegerComZero read FTpComp write FTpComp;
    property VComp: TMDFeFloat2 read FVComp write FVComp;
    property XComp: String read FXComp write FXComp;
  end;

  TInfPag = class(TMDFeElement)
  protected
    FXNome: String;
    FCPF: String;
    FCNPJ: String;
    FIdEstrangeiro: String;
    FComp: TComp;
    FVContrato: TMDFeFloat2;
    FIndAltoDesemp: string;
    FIndPag: Integer;
    FInfPrazo: TInfPrazo;
    FTpAntecip: Integer;
    FInfBanc: TInfBanc;
  published
    property XNome: String read FXNome write FXNome;
    property CPF: String read FCPF write FCPF;
    property CNPJ: String read FCNPJ write FCNPJ;
    property IdEstrangeiro: String read FIdEstrangeiro write FIdEstrangeiro;
    property Comp: TComp read FComp write FComp;
    property VContrato: TMDFeFloat2 read FVContrato write FVContrato;
    property IndAltoDesemp: String read FIndAltoDesemp write FIndAltoDesemp;
    property IndPag: Integer read FindPag write FindPag;
    property InfPrazo: TInfPrazo read FInfPrazo write FInfPrazo;
    property TpAntecip: Integer read FTpAntecip write FTpAntecip;
    property InfBanc: TInfBanc read FInfBanc write FInfBanc;
  end;

  TInfANTT = class(TMDFeElementNoEmptys)
  protected
    FRNTRC: String;
    FInfCIOT: TMDFeElementItems;
    FValePed: TValePed;
    FInfContratante: TMDFeElementItems;
    FInfPag: TMDFeElementItems;
  published
    property RNTRC: String read FRNTRC write FRNTRC;
    property InfCIOT: TMDFeElementItems read FInfCIOT write FInfCIOT;
    property ValePed: TValePed read FValePed write FValePed;
    property InfContratante: TMDFeElementItems read FInfContratante write FInfContratante;
    property InfPag: TMDFeElementItems read FInfPag write FInfPag;
  end;
  TRodo = class(TMDFeElementNoEmptys)
  protected
    FInfANTT: TInfANTT;
    FRNTRC: String;
    FCIOT: String;
    FVeicTracao: TVeicTracao;
    FVeicReboque: TMDFeElementItems;
  published
    property InfANTT: TInfANTT read FInfANTT write FInfANTT;
    property RNTRC: String read FRNTRC write FRNTRC;
    property CIOT: String read FCIOT write FCIOT;
    property VeicTracao: TVeicTracao read FVeicTracao write FVeicTracao;
    property VeicReboque: TMDFeElementItems read FVeicReboque write FVeicReboque;
  end;

implementation

function TVeic.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (Prop.Name = 'Tara') or (Prop.Name = 'CapKG') then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);

end;


end.
