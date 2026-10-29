unit NfseTypes;

interface

uses
  XMLUtils, TypInfo;

type
  TNFSeElement = class(TSimpleXmlParseable)
  protected
    FSameName: String;
    FSameClass: String;
    function GetXMLName(Prop: TPropInfo): String; override;
    function GetXMLType(Prop: TPropInfo): TXMLType; override;
    function GetXMLValor(Prop: TPropInfo): String; override;
    function IsNullValue(Prop: TPropInfo): Boolean; override;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    function GetHeader: String; override;
  end;

  TNFSeElementNoEmptys = class(TNFSeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TNFSeElementAllEmptys = class(TNFSeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TNFSeArrayOfItems = TXmlParseableArray;

  TNFSeElementItems = class(TXmlArrayOfObject)
  protected
    FItems: TNFSeArrayOfItems;
  public
    constructor Create; overload;
    constructor Create(Items: TNFSeArrayOfItems); overload;
    function GetItems: TXmlParseableArray; override;
    procedure AddItem(Item: TSimpleXmlParseable);
  end;

  TNFSeCampoFormatado = class(TObject)
  protected
    FFormato: String;
    FValor: Variant;
  public
    constructor Create; overload;
    constructor Create(Valor: Variant; Formato: String); overload;
    function ToString: String; virtual;
    property Formato: String read FFormato write FFormato;
    property Valor: Variant read FValor write FValor;
  end;

  TCST = class(TNFSeCampoFormatado)
  public
    constructor Create(CST: Integer);
  end;

  TNFSeValor = class(TNFSeCampoFormatado)
  public
    function ToString: String; override;
  end;

  TNFSeFloat2 = class(TNFSeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFSeFloat4 = class(TNFSeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFSeFloat3 = class(TNFSeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFSeIntegerComZero = class(TNFSeCampoFormatado)
  public
    constructor Create(Valor, Tamanho: Integer);
  end;

  TNFSeDataHora = class(TNFSeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TNFSeDataHoraTimeZone = class(TNFSeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TNFSeData = class(TNFSeDataHora)
  public
    constructor Create(Data: TDateTime);
  end;

  TNFSeHora = class(TNFSeDataHora)
  public
    constructor Create(Hora: TDateTime);
    function ToString: String; override;
  end;

implementation

uses
  StrUtils, SysUtils, Variants;

{ TCTeElement }

function TNFSeElement.GetHeader: String;
begin
  Result := '<?xml version="1.0" encoding="utf-8"?>';
end;

function TNFSeElement.GetXMLName(Prop: TPropInfo): String;
var
  PropName, Aux: String;
begin
  PropName := Prop.Name;
  FSameName := FSameName + 'cst,cnpj,cpf,IBSCBS,cep,Id,IM,CST,'; //Propriedades cujo nome da TAG deve ser exatamente igual ao nome das propriedades.
  FSameClass := FSameClass + '';
  if PosEx(',' + UpperCase(PropName) + ',', UpperCase(FSameName)) > 0 then
    Result := PropName
    
  else if PosEx(',' + UpperCase(PropName) + ',', UpperCase(FSameClass)) > 0 then //Propriedades cujo nome da TAG deve ser igual ao nome da classe delas.
  begin
    Aux := GetObjectProp(Self, PropName).ClassName;
    Result := Copy(Aux, 2, Length(Aux));
  end
  else if (UpperCase(PropName) = 'MOD_') then //Propriedade especial, pois a palavra 'mod' é reservada no delphi.
    Result := 'mod'
  else
    Result := LowerCase(PropName[1]) + Copy(PropName, 2, Length(PropName));
  FSameName := '';
  FSameclass := '';
end;

function TNFSeElement.GetXMLType(Prop: TPropInfo): TXMLType;
var
  Atts, PropName: String;
begin
  PropName := Prop.Name;
  Atts := ',xmlns,versao,id,nitem,'; // Aqui vão as propriedades que são atributos, as que não estão aqui são consideradas TAGs.
  if PosEx(',' + UpperCase(PropName) + ',', UpperCase(Atts)) > 0 then
    Result := xtAttribute
  else
    Result := inherited GetXMLType(Prop);
end;

function TNFSeElement.GetXMLValor(Prop: TPropInfo): String;
var
  Obj: TObject;
begin
  if Prop.PropType^.Kind = tkClass then
  begin
    Result := '';
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TNFSeCampoFormatado) then
      Result := TNFSeCampoFormatado(Obj).ToString;
  end
  else if Prop.PropType^.Kind = tkFloat then
  begin
    Result := FormatFloat('#0.00', GetFloatProp(Self, Prop.Name));
    Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  end
  else
    Result := inherited GetXMLValor(Prop);
end;

function TNFSeElement.IsNullValue(Prop: TPropInfo): Boolean;
var
  Obj: TObject;
begin
  if (Prop.PropType^.Kind = tkClass) then
  begin
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TNFSeCampoFormatado) then
    begin
      Result := (TNFSeCampoFormatado(Obj).ToString = '');
      Exit;
    end;
  end;
  Result := inherited IsNullValue(Prop);
end;

function TNFSeElement.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
var
  NEmptys, PropName: String;
begin
  if Prop.PropType^.Kind = tkClass then
    Result := False
  else
  begin
    PropName := Prop.Name;
    NEmptys := ',RegimeEspecialTributacao,Complemento,CodigoCnae,' +
        'CodigoTributacaoMunicipio,vUnid,csosn,cst,CSTPisCofins,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
    Result := not (PosEx(',' + UpperCase(PropName) + ',', UpperCase(NEmptys)) > 0);
  end;
end;

{ TCTeElementItems }

procedure TNFSeElementItems.AddItem(Item: TSimpleXmlParseable);
var
  i: Integer;
begin
  i := Length(FItems);
  SetLength(FItems, i + 1);
  FItems[i] := Item;  
end;

constructor TNFSeElementItems.Create(Items: TNFSeArrayOfItems);
begin
  FItems := Items;
end;

constructor TNFSeElementItems.Create;
begin

end;

function TNFSeElementItems.GetItems: TXmlParseableArray;
begin
  Result := FItems;
end;

{ TCTeDataHora}

constructor TNFSeDataHora.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy-MM-dd hh:nn:ss');
end;

constructor TNFSeDataHora.Create;
begin
  Create(Now);
end;

{ TCTeData }

constructor TNFSeData.Create(Data: TDateTime);
begin
  inherited Create(Data, 'yyyy-MM-dd');
end;

{ TCTeHora }

constructor TNFSeHora.Create(Hora: TDateTime);
begin
  inherited Create(Hora, 'hh:nn:ss');
end;

function TNFSeHora.ToString: String;
begin
  Result := FormatDateTime('hhnnss', VarToDateTime(Valor));
  if Result = '000000' then
    Result := ''
  else
    Result := inherited ToString;
end;

{ TCTeCampoFormatado }

constructor TNFSeCampoFormatado.Create;
begin
  Create(null, '')
end;

constructor TNFSeCampoFormatado.Create(Valor: Variant; Formato: String);
begin
  FValor := Valor;
  FFormato := Formato;
end;

function TNFSeCampoFormatado.ToString: String;
begin
  Result := '';
  case VarType(FValor) of
    varDouble: Result := FormatFloat(Formato, Valor);
    varInteger: Result := FormatFloat(Formato, Valor);
    varShortInt: Result := FormatFloat(Formato, Valor);
    varCurrency: Result := FormatFloat(Formato, Valor);
    varInt64: Result := FormatFloat(Formato, Valor);
    varSmallint: Result := FormatFloat(Formato, Valor);
    varDate: Result := FormatDateTime(Formato, Valor);
  end;
end;

{ TCTeElementNoEmptys }

function TNFSeElementNoEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := False;
end;

{ TCTeElementAllEmptys }

function TNFSeElementAllEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := True;
end;

{ TCTeFloat2 }

constructor TNFSeFloat2.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.00');
end;

{ TCTeFloat4 }

constructor TNFSeFloat4.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.0000');
end;

{ TCTeValor }

function TNFSeValor.ToString: String;
begin
  Result := inherited ToString;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

{ TCTeFloat3 }

constructor TNFSeFloat3.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.000');
end; 

{ TCST }

constructor TCST.Create(CST: Integer);
begin
  inherited Create(CST, '00');
end;

{ TCTeIntegerComZero }

constructor TNFSeIntegerComZero.Create(Valor, Tamanho: Integer);
begin
  inherited Create(Valor, DupeString('0', Tamanho));
end;

{ TNFSeDataHoraTimeZone }

constructor TNFSeDataHoraTimeZone.Create;
begin
  Create(Now);
end;

constructor TNFSeDataHoraTimeZone.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy"-"MM"-"dd"T"hh":"mm":"ss');
end;

end.
