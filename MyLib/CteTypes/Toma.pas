unit Toma;

interface

uses
  CteTypes, TypInfo, EnderecoCte;

type
  TToma03 = class(TCTeElement)
  protected
    FToma: Integer;
  published
    property Toma: Integer read FToma write FToma;
  end;

  TToma4 = class(TCTeElement)
  protected
    FToma: Integer;
    FCNPJ: String;
    FCPF: String;
    FIE: String;
    FXNome: String;
    FXFant: String;
    FFone: String;
    FEnderToma: TEnderecoCTe;
    FEmail: String;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    constructor Create;
  published
    property Toma: Integer read FToma;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property IE: String read FIE write FIE;
    property XNome: String read FXNome write FXNome;
    property XFant: String read FXFant write FXFant;
    property Fone: String read FFone write FFone;
    property EnderToma: TEnderecoCTe read FEnderToma write FEnderToma;
    property Email: String read FEmail write FEmail;
  end;

implementation

uses
  CteConsts;

{ TToma4 }

constructor TToma4.Create;
begin
  FToma := TOMA_OUTROS;
end;

function TToma4.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if Prop.Name = 'CNPJ' then
    if GetXMLValor(GetPropInfo(self, 'CPF')^) = '' then
    begin
      Result := True;
      Exit;
    end;

  if Prop.Name = 'IE' then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
