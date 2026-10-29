unit Pessoa;

interface

uses
  Endereco, NfeTypes, TypInfo;

type
  TPessoa = class(TNFeElementNoEmptys)
  private
  protected
    FCNPJ: String;
    FCPF: String;
    FXNome: String;
    FEnder: TEndereco;
    FIE: String;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property XNome: String read FXNome write FXNome;
    property Ender: TEndereco read FEnder write FEnder;
    property IE: String read FIE write FIE;
  end;

  TEmit = class(TPessoa)
  private
  protected
    FCNAE: String;
    FCRT: Integer;
    FIEST: String;
    FIM: String;
    FXFant: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property XNome;
    property XFant: String read FXFant write FXFant;
    property Ender;
    property IE;
    property IEST: String read FIEST write FIEST;
    property IM: String read FIM write FIM;
    property CNAE: String read FCNAE write FCNAE;
    property CRT: Integer read FCRT write FCRT;
  end;

  TDest = class(TPessoa)
  private
  protected
    FISUF: String;
    FEmail: String;
    FIdEstrangeiro: String;
    FIndIEDest: Integer;
    FIM: String;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ;
    property CPF;
    property IdEstrangeiro: String read FIdEstrangeiro write FIdEstrangeiro;
    property XNome;
    property Ender;
    property IndIEDest: Integer read FIndIEDest write FIndIEDest;
    property IE;
    property ISUF: String read FISUF write FISUF;
    property IM: String read FIM write FIM;
    property Email: String read FEmail write FEmail;
  end;

implementation

uses
  SysUtils, Nfe;

{ TEmit }

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

{ TPessoa }

function TPessoa.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
//  if Prop.Name = 'CNPJ' then
//    if GetXMLValor(GetPropInfo(self, 'CPF')^) = '' then
//      if GetXMLValor(GetPropInfo(self, 'IndIEDest')^) = '0' then
//      begin
//        Result := True;
//        Exit;
//      end;

  if Prop.Name = 'IdEstrangeiro' then
  begin
    if (self.Ender <> nil) and (self.Ender.CPais <> 1058) then
      Result := True
    else
      Result := inherited IsTagEvenEmpty(Prop);
  end
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
