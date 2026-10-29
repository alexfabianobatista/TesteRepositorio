unit MdfeTypes;

interface

uses
  XMLUtils, TypInfo;

type
  TMDFeElement = class(TSimpleXmlParseable)
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

  TMDFeElementNoEmptys = class(TMDFeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TMDFeElementAllEmptys = class(TMDFeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TMDFeArrayOfItems = TXmlParseableArray;

  TMDFeElementItems = class(TXmlArrayOfObject)
  protected
    FItems: TMDFeArrayOfItems;
  public
    constructor Create; overload;
    constructor Create(Items: TMDFeArrayOfItems); overload;
    function GetItems: TXmlParseableArray; override;
    procedure AddItem(Item: TSimpleXmlParseable);
  end;

  TMDFeCampoFormatado = class(TObject)
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

  TCST = class(TMDFeCampoFormatado)
  public
    constructor Create(CST: Integer);
  end;

  TMDFeValor = class(TMDFeCampoFormatado)
  public
    function ToString: String; override;
  end;

  TMDFeFloat2 = class(TMDFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TMDFeFloat4 = class(TMDFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TMDFeFloat3 = class(TMDFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TMDFeIntegerComZero = class(TMDFeCampoFormatado)
  public
    constructor Create(Valor, Tamanho: Integer);
  end;

  TMDFeDataHora = class(TMDFeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TMDFeDataHoraTZD = class(TMDFeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TMDFeData = class(TMDFeDataHora)
  public
    constructor Create(Data: TDateTime);
  end;

  TMDFeHora = class(TMDFeDataHora)
  public
    constructor Create(Hora: TDateTime);
    function ToString: String; override;
  end;

implementation

uses
  StrUtils, SysUtils, Variants, UOracle_cl;

{ TMDFeElement }

function TMDFeElement.GetHeader: String;
begin
  Result := '<?xml version="1.0" encoding="utf-8"?>';
end;

function TMDFeElement.GetXMLName(Prop: TPropInfo): String;
var
  PropName, Aux: String;
begin
  PropName := Prop.Name;
  FSameName := FSameName + ',ufenv,ufini,uffim,id,cnpj,cpf,ie,uf,cep,ufst,cst,' +
      'cfop,pin,icmssn,rntrc,comp,ciot,ufper,renavam,ncm,icmscomp,cnpjforn,cnpjpg,cpfpg,pix,'; //Propriedades cujo nome da TAG deve ser exatamente igual ao nome das propriedades.
  FSameClass := FSameClass + ',cofins,pis,';
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

function TMDFeElement.GetXMLType(Prop: TPropInfo): TXMLType;
var
  Atts, PropName: String;
begin
  PropName := Prop.Name;
  Atts := ',versaomodal,xmlns,versao,versaoevento,id,nitem,'; // Aqui vão as propriedades que são atributos, as que não estão aqui são consideradas TAGs.
  if PosEx(',' + UpperCase(PropName) + ',', UpperCase(Atts)) > 0 then
    Result := xtAttribute
  else
    Result := inherited GetXMLType(Prop);
end;

function TMDFeElement.GetXMLValor(Prop: TPropInfo): String;
var
  Obj: TObject;
begin
  if Prop.PropType^.Kind = tkClass then
  begin
    Result := '';
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TMDFeCampoFormatado) then
      Result := TMDFeCampoFormatado(Obj).ToString;
  end
  else if Prop.PropType^.Kind = tkFloat then
  begin
    Result := FormatFloat('#0.00', GetFloatProp(Self, Prop.Name));
    Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  end
  else
    Result := inherited GetXMLValor(Prop);
end;

function TMDFeElement.IsNullValue(Prop: TPropInfo): Boolean;
var
  Obj: TObject;
begin
  if (Prop.PropType^.Kind = tkClass) then
  begin
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TMDFeCampoFormatado) then
    begin
      Result := (TMDFeCampoFormatado(Obj).ToString = '');
      Exit;
    end;
  end;
  Result := inherited IsNullValue(Prop);
end;

function TMDFeElement.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
var
  NEmptys, PropName: String;
begin
  if Prop.PropType^.Kind = tkClass then
    Result := False
  else
  begin
    PropName := Prop.Name;
    NEmptys := ',pRedBCST,xcaracad,refcte,xcaracser,xobs,xemi,xfant,xcpl,cep,cpais,xpais,' +
        'fone,isuf,pin,infadfisco,email,xdetretira,vdescdi,xOutCat,xSeg,fluxo,' +
        'nitemped,xped,codif,qtemp,nApol,nAver,vCarga,pRedBC,idEstrangeiro,' +
        'RNTC,vagao,balsa,xjust,infadprod,cint,ciot,vorig,NPed,vdesc,xComp,' +
        'qUnid,vUnid,NAver,nPed,nPeso,nRoma,cnpj,cpf,chave,cst,tptransp,indAltoDesemp,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
    Result := not (PosEx(',' + UpperCase(PropName) + ',', UpperCase(NEmptys)) > 0);
  end;
end;

{ TMDFeElementItems }

procedure TMDFeElementItems.AddItem(Item: TSimpleXmlParseable);
var
  i: Integer;
begin
  i := Length(FItems);
  SetLength(FItems, i + 1);
  FItems[i] := Item;  
end;

constructor TMDFeElementItems.Create(Items: TMDFeArrayOfItems);
begin
  FItems := Items;
end;

constructor TMDFeElementItems.Create;
begin

end;

function TMDFeElementItems.GetItems: TXmlParseableArray;
begin
  Result := FItems;
end;

{ TMDFeDataHora }

constructor TMDFeDataHora.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy"-"MM"-"dd"T"hh":"mm":"ss');
end;

constructor TMDFeDataHora.Create;
begin
  Create(Now);
end;

{ TMDFeData }

constructor TMDFeData.Create(Data: TDateTime);
begin
  inherited Create(Data, 'yyyy-MM-dd');
end;

{ TMDFeHora }

constructor TMDFeHora.Create(Hora: TDateTime);
begin
  inherited Create(Hora, 'hh:nn:ss');
end;

function TMDFeHora.ToString: String;
begin
  Result := FormatDateTime('hhnnss', VarToDateTime(Valor));
  if Result = '000000' then
    Result := ''
  else
    Result := inherited ToString;
end;

{ TMDFeCampoFormatado }

constructor TMDFeCampoFormatado.Create;
begin
  Create(null, '')
end;

constructor TMDFeCampoFormatado.Create(Valor: Variant; Formato: String);
begin
  FValor := Valor;
  FFormato := Formato;
end;

function TMDFeCampoFormatado.ToString: String;
begin
  Result := '';
  case VarType(FValor) of
    varDouble: Result := FormatFloat(Formato, Valor);
    varInteger: Result := FormatFloat(Formato, Valor);
    varShortInt: Result := FormatFloat(Formato, Valor);
    varCurrency: Result := FormatFloat(Formato, Valor);
    varInt64: Result := FormatFloat(Formato, Valor);
    varSmallint: Result := FormatFloat(Formato, Valor);
    varDate:
      begin
        if Formato = 'TZD' then
          Result := FormatDateTime('yyyy-MM-dd', Valor) + 'T' + FormatDateTime('hh:mm:ss', Valor) + DMOracle.FusoHorarioServ
        else
          Result := FormatDateTime(Formato, Valor);
      end;
  end;
end;

{ TMDFeElementNoEmptys }

function TMDFeElementNoEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := False;
end;

{ TMDFeElementAllEmptys }

function TMDFeElementAllEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := True;
end;

{ TMDFeFloat2 }

constructor TMDFeFloat2.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.00');
end;

{ TMDFeFloat4 }

constructor TMDFeFloat4.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.0000');
end;

{ TMDFeValor }

function TMDFeValor.ToString: String;
begin
  Result := inherited ToString;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

{ TMDFeFloat3 }

constructor TMDFeFloat3.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.000');
end; 

{ TCST }

constructor TCST.Create(CST: Integer);
begin
  inherited Create(CST, '00');
end;

{ TMDFeIntegerComZero }

constructor TMDFeIntegerComZero.Create(Valor, Tamanho: Integer);
begin
  inherited Create(Valor, DupeString('0', Tamanho));
end;

{ TMDFeDataHoraTZD }

constructor TMDFeDataHoraTZD.Create;
begin
  Create(now);
end;

constructor TMDFeDataHoraTZD.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'TZD');
end;

end.
