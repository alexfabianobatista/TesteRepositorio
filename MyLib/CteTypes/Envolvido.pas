unit Envolvido;

interface

uses
  CteTypes, EnderecoCte, TypInfo;

type
  TEnvolvido = class(TCTeElementNoEmptys)
  protected
    FCNPJ: String;
    FCPF: String;
    FXNome: String;
    FEnder: TEnderecoCTe;
    FIE: String;
  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property XNome: String read FXNome write FXNome;
    property Ender: TEnderecoCTe read FEnder write FEnder;
    property IE: String read FIE write FIE;
  end;
  TLocal = class(TEnderecoCTe)
  protected
    FCNPJ: String;
    FCPF: String;
    FXNome: String;
  published
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property XNome: String read FXNome write FXNome;
    property XLgr;
    property Nro;
    property XCpl;
    property XBairro;
    property CMun;
    property XMun;
    property UF;
  end;

  TEmit = class(TEnvolvido)
  protected
    FXFant: String;
    FIEST: String;
    FCRT: integer;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property IE;
    property IEST: String read FIEST write FIEST;
    property XNome;
    property XFant: String read FXFant write FXFant;
    property Ender;
    property CRT: integer read FCRT write FCRT;
  end;

  TRem = class(TEnvolvido)
  private
  protected
    FXFant: String;
    FFone: String;
    FEmail: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IE;
    property XNome;
    property XFant: String read FXFant write FXFant;
    property Fone: String read FFone write FFone;
    property Ender;
    property Email: String read FEmail write FEmail;    
  end;
  TExped = class(TEnvolvido)
  private
  protected
    FFone: String;
    FEmail: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IE;
    property XNome;
    property Fone: String read FFone write FFone;
    property Ender;
    property Email: String read FEmail write FEmail;
  end;
  TReceb = class(TEnvolvido)
  private
  protected
    FFone: String;
    FEmail: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IE;
    property XNome;
    property Fone: String read FFone write FFone;
    property Ender;
    property Email: String read FEmail write FEmail;
  end;
  TDest = class(TEnvolvido)
  private
  protected
    FFone: String;
    FISUF: String;
    FEmail: String;
    FLocEnt: TLocal;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IE;
    property XNome;
    property Fone: String read FFone write FFone;
    property ISUF: String read FISUF write FISUF;
    property Ender;
    property Email: String read FEmail write FEmail;
    property LocEnt: TLocal read FLocEnt write FLocEnt;
  end;
  TToma = class(TEnvolvido)
  private
  protected
    FXFant: String;
    FFone: String;
    FEmail: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IE;
    property XNome;
    property XFant: String read FXFant write FXFant;
    property Fone: String read FFone write FFone;
    property Ender;
    property Email: String read FEmail write FEmail;    
  end;

implementation

uses
  SysUtils;
  
{TEmit }

function TEmit.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Emit';
end;

{ TDest }

function TDest.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Dest';
end;
{ TRem }

function TRem.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Reme';
end;

{ TExped }

function TExped.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Exped';
end;

{ TReceb }

function TReceb.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Receb';
end;

{TToma }

function TToma.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (UpperCase(Prop.Name) = 'ENDER') then
    Result := Result + 'Toma';
end;

end.
 