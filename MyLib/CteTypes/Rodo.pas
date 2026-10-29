unit Rodo;

interface

uses
  CteTypes, Occ, TypInfo;

type
  TLacRodo = class(TCTeElement)
  protected
    FNLacre: String;
  published
    property NLacre: String read FNLacre write FNLacre;
  end;
  TMoto = class(TCTeElement)
  protected
    FXNome: String;
    FCPF: String;
  published
    property XNome: String read FXNome write FXNome;
    property CPF: String read FCPF write FCPF;
  end;
  TProp = class(TCTeElement)
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
    property NTRC: String read FRNTRC write FRNTRC;
    property XNome: String read FXNome write FXNome;
    property IE: String read FIE write FIE;
    property UF: String read FUF write FUF;
    property TpProp: Integer read FTpProp write FTpProp;
  end;
  TVeic = class(TCTeElement)
  protected
    FCInt: String;
    FRENAVAM: String;
    FPlaca: String;
    FTara: Integer;
    FCapKG: Integer;
    FCapM3: Integer;
    FTpProp: String;
    FTpVeic: Integer;
    FTpRod: TCTeIntegerComZero;
    FTpCar: TCTeIntegerComZero;
    FUF: String;
  published
    property CInt: String read FCInt write FCInt;
    property RENAVAM: String read FRENAVAM write FRENAVAM;
    property Placa: String read FPlaca write FPlaca;
    property Tara: Integer read FTara write FTara;
    property CapKG: Integer read FCapKG write FCapKG;
    property CapM3: Integer read FCapM3 write FCapM3;
    property TpProp: String read FTpProp write FTpProp;
    property TpVeic: Integer read FTpVeic write FTpVeic;
    property TpRod: TCTeIntegerComZero read FTpRod write FTpRod;
    property TpCar: TCTeIntegerComZero read FTpCar write FTpCar;
    property UF: String read FUF write FUF;
  end;
  TRodo = class(TCTeElement)
  protected
    FRNTRC: String;
    FDPrev: TCTeData; //Não existe na versão 3.00
    FLota: Integer;   //Não existe na versão 3.00
    FCIOT: String;    //Não existe na versão 3.00
    FOcc: TCTeElementItems;
    FValePed: TCTeElementItems;  //Não existe na versão 3.00
    FVeic: TCTeElementItems;     //Não existe na versão 3.00
    FLacRodo: TCTeElementItems;  //Não existe na versão 3.00
    FMoto: TCTeElementItems;     //Não existe na versão 3.00
  public
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published
    property RNTRC: String read FRNTRC write FRNTRC;
    property DPrev: TCTeData read FDPrev write FDPrev;   //Não existe na versão 3.00
    property Lota: Integer read FLota write FLota;       //Não existe na versão 3.00
    property CIOT: String read FCIOT write FCIOT;        //Não existe na versão 3.00
    property Occ: TCTeElementItems read FOcc write FOcc;
    property ValePed: TCTeElementItems read FValePed write FValePed; //Não existe na versão 3.00
    property Veic: TCTeElementItems read FVeic write FVeic;          //Não existe na versão 3.00
    property LacRodo: TCTeElementItems read FLacRodo write FLacRodo; //Não existe na versão 3.00
    property Moto: TCTeElementItems read FMoto write FMoto;          //Não existe na versão 3.00
  end;

implementation

{ TRodo }

function TRodo.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (Prop.Name = 'Lota') and (self.DPrev <> nil) then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
