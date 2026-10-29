unit CteTypes;

interface

uses
  XMLUtils, TypInfo, UOracle_cl;

type
  TCTeElement = class(TSimpleXmlParseable)
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

  TCTeElementNoEmptys = class(TCTeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TCTeElementAllEmptys = class(TCTeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TCTeArrayOfItems = TXmlParseableArray;

  TCTeElementItems = class(TXmlArrayOfObject)
  protected
    FItems: TCTeArrayOfItems;
  public
    constructor Create; overload;
    constructor Create(Items: TCTeArrayOfItems); overload;
    function GetItems: TXmlParseableArray; override;
    procedure AddItem(Item: TSimpleXmlParseable);
  end;

  TCTeCampoFormatado = class(TObject)
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

  TCST = class(TCTeCampoFormatado)
  public
    constructor Create(CST: Integer);
  end;

  TCTeValor = class(TCTeCampoFormatado)
  public
    function ToString: String; override;
  end;

  TCTeFloat2 = class(TCTeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TCTeFloat4 = class(TCTeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TCTeFloat3 = class(TCTeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TCTeIntegerComZero = class(TCTeCampoFormatado)
  public
    constructor Create(Valor, Tamanho: Integer);
  end;
  TCTeDataHoraTZD = class(TCTeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;
  TCTeDataHora = class(TCTeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TCTeData = class(TCTeDataHora)
  public
    constructor Create(Data: TDateTime);
  end;

  TCTeHora = class(TCTeDataHora)
  public
    constructor Create(Hora: TDateTime);
    function ToString: String; override;
  end;

implementation

uses
  StrUtils, SysUtils, Variants;

{ TCTeElement }

function TCTeElement.GetHeader: String;
begin
  Result := '<?xml version="1.0" encoding="utf-8"?>';
end;

function TCTeElement.GetXMLName(Prop: TPropInfo): String;
var
  PropName, Aux: String;
begin
  PropName := Prop.Name;
  FSameName := FSameName + ',ufenv,ufini,uffim,id,cnpj,cpf,ie,iest,uf,ufper,cep,ufst,cst,' +
      'cfop,pin,icmssn,rntrc,comp,ciot,IBSCBS,renavam,icmscomp,taf,nroregestadual,icmsuffim,crt,'; //Propriedades cujo nome da TAG deve ser exatamente igual ao nome das propriedades.
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

function TCTeElement.GetXMLType(Prop: TPropInfo): TXMLType;
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

function TCTeElement.GetXMLValor(Prop: TPropInfo): String;
var
  Obj: TObject;
begin
  if Prop.PropType^.Kind = tkClass then
  begin
    Result := '';
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TCTeCampoFormatado) then
      Result := TCTeCampoFormatado(Obj).ToString;
  end
  else if Prop.PropType^.Kind = tkFloat then
  begin
    Result := FormatFloat('#0.00', GetFloatProp(Self, Prop.Name));
    Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  end
  else
    Result := inherited GetXMLValor(Prop);
end;

function TCTeElement.IsNullValue(Prop: TPropInfo): Boolean;
var
  Obj: TObject;
begin
  if (Prop.PropType^.Kind = tkClass) then
  begin
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TCTeCampoFormatado) then
    begin
      Result := (TCTeCampoFormatado(Obj).ToString = '');
      Exit;
    end;
  end;
  Result := inherited IsNullValue(Prop);
end;

function TCTeElement.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
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
        'nitemped,xped,codif,qtemp,nApol,nAver,vCarga,pRedBC,indDoacao,' +
        'RNTC,vagao,balsa,xjust,infadprod,cint,ciot,vorig,NPed,vdesc,' +
        'qUnid,vUnid,NAver,nPed,nPeso,nRoma,chave,cpf,cnpj,IndIEToma,cst,'+
        'origCalc,destCalc,nroregestadual,taf,forpag,chcte,lota,indglobalizado,vtottrib,'+
        'vcargaaverb,refcteanu,iest,ie,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
    Result := not (PosEx(',' + UpperCase(PropName) + ',', UpperCase(NEmptys)) > 0);
  end;
end;

{ TCTeElementItems }

procedure TCTeElementItems.AddItem(Item: TSimpleXmlParseable);
var
  i: Integer;
begin
  i := Length(FItems);
  SetLength(FItems, i + 1);
  FItems[i] := Item;  
end;

constructor TCTeElementItems.Create(Items: TCTeArrayOfItems);
begin
  FItems := Items;
end;

constructor TCTeElementItems.Create;
begin

end;

function TCTeElementItems.GetItems: TXmlParseableArray;
begin
  Result := FItems;
end;

{ TCTeDataHora }

constructor TCTeDataHora.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy"-"MM"-"dd"T"hh":"mm":"ss');
end;

constructor TCTeDataHora.Create;
begin
  Create(Now);
end;

{ TCTeData }

constructor TCTeData.Create(Data: TDateTime);
begin
  inherited Create(Data, 'yyyy-MM-dd');
end;

{ TCTeHora }

constructor TCTeHora.Create(Hora: TDateTime);
begin
  inherited Create(Hora, 'hh:nn:ss');
end;

function TCTeHora.ToString: String;
begin
  Result := FormatDateTime('hhnnss', VarToDateTime(Valor));
  if Result = '000000' then
    Result := ''
  else
    Result := inherited ToString;
end;

{ TCTeCampoFormatado }

constructor TCTeCampoFormatado.Create;
begin
  Create(null, '')
end;

constructor TCTeCampoFormatado.Create(Valor: Variant; Formato: String);
begin
  FValor := Valor;
  FFormato := Formato;
end;

function TCTeCampoFormatado.ToString: String;
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

{ TCTeElementNoEmptys }

function TCTeElementNoEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := False;
end;

{ TCTeElementAllEmptys }

function TCTeElementAllEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := True;
end;

{ TCTeFloat2 }

constructor TCTeFloat2.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.00');
end;

{ TCTeFloat4 }

constructor TCTeFloat4.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.0000');
end;

{ TCTeValor }

function TCTeValor.ToString: String;
begin
  Result := inherited ToString;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

{ TCTeFloat3 }

constructor TCTeFloat3.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.000');
end; 

{ TCST }

constructor TCST.Create(CST: Integer);
begin
  inherited Create(CST, '00');
end;

{ TCTeIntegerComZero }

constructor TCTeIntegerComZero.Create(Valor, Tamanho: Integer);
begin
  inherited Create(Valor, DupeString('0', Tamanho));
end;

{ TCTeDataHoraTZD }

constructor TCTeDataHoraTZD.Create;
begin
  Create(now);
end;

constructor TCTeDataHoraTZD.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'TZD');
end;

end.
