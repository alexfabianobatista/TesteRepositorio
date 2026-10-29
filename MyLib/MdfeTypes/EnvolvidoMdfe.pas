unit EnvolvidoMdfe;

interface

uses
  MdfeTypes, EnderecoMdfe, TypInfo;

type
  TEnvolvido = class(TMDFeElementNoEmptys)
  protected
    FCNPJ: String;
    FCPF: String;
    FXNome: String;
    FEnder: TEnderecoMDFe;
    FIE: String;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property XNome: String read FXNome write FXNome;
    property Ender: TEnderecoMDFe read FEnder write FEnder;
    property IE: String read FIE write FIE;
  end;
  TLocal = class(TEnderecoMDFe)
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
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property IE;
    property XNome;
    property XFant: String read FXFant write FXFant;
    property Ender;
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

{ TEnvolvido }

function TEnvolvido.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
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

