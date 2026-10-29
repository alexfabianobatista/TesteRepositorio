unit NfeTypes;

interface

uses
  XMLUtils, TypInfo;

type
  TNFeElement = class(TSimpleXmlParseable)
  private

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

  TNFeElementNoEmptys = class(TNFeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TNFeElementAllEmptys = class(TNFeElement)
  protected
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  end;

  TNfeArrayOfItems = TXmlParseableArray;

  TNFeElementItems = class(TXmlArrayOfObject)
  protected
    FItems: TNfeArrayOfItems;
  public
    constructor Create; overload;
    constructor Create(Items: TNfeArrayOfItems); overload;
    function GetItems: TXmlParseableArray; override;
    procedure AddItem(Item: TSimpleXmlParseable);
  end;

  TNFeCampoFormatado = class(TObject)
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

  TCST = class(TNFeCampoFormatado)
  public
    constructor Create(CST: Integer);
  end;

  TNFeValor = class(TNFeCampoFormatado)
  public
    function ToString: String; override;
  end;

  TNFeFloat2 = class(TNFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFeFloat4 = class(TNFeValor)
  public
    constructor Create(Valor: Extended);
  end;
  TNFeFloat7 = class(TNFeValor)
  public
    constructor Create(Valor: Extended);
  end;
  TNFeFloat8 = class(TNFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFeFloat3 = class(TNFeValor)
  public
    constructor Create(Valor: Extended);
  end;

  TNFeIntegerComZero = class(TNFeCampoFormatado)
  public
    constructor Create(Valor, Tamanho: Integer);
  end;

  TNFeDataHora = class(TNFeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TNFeDataHoraTZD = class(TNFeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TCceDataHora = class(TNFeCampoFormatado)
  public
    constructor Create; overload;
    constructor Create(DataHora: TDateTime); overload;
  end;

  TNFeData = class(TNFeDataHora)
  public
    constructor Create(Data: TDateTime);
  end;

  TNFeHora = class(TNFeDataHora)
  public
    constructor Create(Hora: TDateTime);
    function ToString: String; override;
  end;

implementation

uses
  StrUtils, SysUtils, Variants, Windows, UOracle_cl;

function GetTimeZone: string;
var
  aux: String;
  TimeZone: TTimeZoneInformation;
begin
  GetTimeZoneInformation(TimeZone);
  aux := IntToStr(TimeZone.Bias div -60);
  if Length(aux) > 2 then
    Result := aux + ':00'
  else
  begin
    Result := Copy(aux,1,1);
    Result := Result + '0';
    Result := Result + Copy(aux,2,1) + ':00';
  end;
end;
{ TNFeElement }

function TNFeElement.GetHeader: String;
begin
  Result := '<?xml version="1.0" encoding="utf-8"?>';
end;

function TNFeElement.GetXMLName(Prop: TPropInfo): String;
var
  PropName, Aux: String;
begin
  PropName := Prop.Name;
  FSameName := FSameName + ',icmstot,id,cnpj,cpf,ie,iest,im,cnae,crt,uf,cep,ufst,cst,aamm,extipi,ncm,' +
      'cfop,ipi,ipitrib,ipint,csosn,issqn,issqntot,icmssn,ufdesemb,ufembarq,di,nfref,ii,ufcons,isuf,nve,'+
      'ufsaidapais,cest,ICMSUFDest,CNPJFab,cnpjprod,IBSCBS,CSTReg,IBSCBSTot,IS,ISTot,'; //Propriedades cujo nome da TAG deve ser exatamente igual ao nome das propriedades.
  FSameClass := FSameClass + ',cofins,pis,nfref,UFTerceiro,DFeReferenciado,';
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

function TNFeElement.GetXMLType(Prop: TPropInfo): TXMLType;
var
  Atts, PropName: String;
begin
  PropName := Prop.Name;
  Atts := ',xmlns,versao,id,nitem,xcampo,'; // Aqui vão as propriedades que são atributos, as que não estão aqui são consideradas TAGs.
  if PosEx(',' + UpperCase(PropName) + ',', UpperCase(Atts)) > 0 then
    Result := xtAttribute
  else
    Result := inherited GetXMLType(Prop);
end;

function TNFeElement.GetXMLValor(Prop: TPropInfo): String;
var
  Obj: TObject;
begin
  if Prop.PropType^.Kind = tkClass then
  begin
    Result := '';
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TNFeCampoFormatado) then
      Result := TNFeCampoFormatado(Obj).ToString;
  end
  else if Prop.PropType^.Kind = tkFloat then
  begin
    Result := FormatFloat('#0.00', GetFloatProp(Self, Prop.Name));
    Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
  end
  else
    Result := inherited GetXMLValor(Prop);
end;

function TNFeElement.IsNullValue(Prop: TPropInfo): Boolean;
var
  Obj: TObject;
begin
  if (Prop.PropType^.Kind = tkClass) then
  begin
    Obj := GetObjectProp(Self, Prop.Name);
    if (Obj <> nil) and (Obj is TNFeCampoFormatado) then
    begin
      Result := (TNFeCampoFormatado(Obj).ToString = '');
      Exit;
    end;
  end;
  Result := inherited IsNullValue(Prop);
end;

function TNFeElement.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
var
  NEmptys, PropName: String;
begin
  if Prop.PropType^.Kind = tkClass then
    Result := False
  else
  begin
    PropName := Prop.Name;
    NEmptys := ',pmvast,pRedBCST,vserv,viss,hSaiEnt,xfant,xcpl,cep,cpais,xpais,' +
        'fone,iest,im,cnae,dpag,isuf,email,extipi,vdescdi,dPrevEntrega,' +
        'nitemped,xped,codif,qtemp,motDesICMS,clEnq,indDoacao,' +
        'CNPJProd,cSelo,qSelo,RNTC,vagao,balsa,xjust,infadprod,tpCredPresIBSZFM,' +
        'qUnid,vUnid,csosn,cst,idDest,indFinal,indPres,nRECOPI,indIEDest,nve,tpViaTransp,' +
        'vAFRMM,tpIntermedio,UFTerceiro,cSitTrib,UFSaidaPais,xLocExporta,' +
        'xLocDespacho,UFEmbarq,xLocEmbarq,idEstrangeiro,cest,indpag,'+
        'cbenef,cnpjfab,indescala,dhcont,dhsaient,indIntermed,xPag,indImport,'; //Propriedades que não aparecem com TAG vazia, ou seja, se for tag vazia, elas não aparecerão.
    Result := not (PosEx(',' + UpperCase(PropName) + ',', UpperCase(NEmptys)) > 0);
  end;
end;

{ TNFeElementItems }

procedure TNFeElementItems.AddItem(Item: TSimpleXmlParseable);
var
  i: Integer;
begin
  i := Length(FItems);
  SetLength(FItems, i + 1);
  FItems[i] := Item;  
end;

constructor TNFeElementItems.Create(Items: TNfeArrayOfItems);
begin
  FItems := Items;
end;

constructor TNFeElementItems.Create;
begin

end;

function TNFeElementItems.GetItems: TXmlParseableArray;
begin
  Result := FItems;
end;

{ TNFeDataHora }

constructor TNFeDataHora.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy"-"MM"-"dd"T"hh":"mm":"ss');
end;

constructor TNFeDataHora.Create;
begin
  Create(Now);
end;

{ TNFeData }

constructor TNFeData.Create(Data: TDateTime);
begin
  inherited Create(Data, 'yyyy-MM-dd');
end;

{ TNFeHora }

constructor TNFeHora.Create(Hora: TDateTime);
begin
  inherited Create(Hora, 'hh:nn:ss');
end;

function TNFeHora.ToString: String;
begin
  Result := FormatDateTime('hhnnss', VarToDateTime(Valor));
  if Result = '000000' then
    Result := ''
  else
    Result := inherited ToString;
end;

{ TNFeCampoFormatado }

constructor TNFeCampoFormatado.Create;
begin
  Create(null, '')
end;

constructor TNFeCampoFormatado.Create(Valor: Variant; Formato: String);
begin
  FValor := Valor;
  FFormato := Formato;
end;

function TNFeCampoFormatado.ToString: String;
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

{ TNFeElementNoEmptys }

function TNFeElementNoEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := False;
end;

{ TNFeElementAllEmptys }

function TNFeElementAllEmptys.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := True;
end;

{ TNFeFloat2 }

constructor TNFeFloat2.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.00');
end;

{ TNFeFloat4 }

constructor TNFeFloat4.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.0000');
end;

{ TNFeValor }

function TNFeValor.ToString: String;
begin
  Result := inherited ToString;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

{ TNFeFloat3 }

constructor TNFeFloat3.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.000');
end; 

{ TCST }

constructor TCST.Create(CST: Integer);
begin
  inherited Create(CST, '00');
end;

{ TNFeIntegerComZero }

constructor TNFeIntegerComZero.Create(Valor, Tamanho: Integer);
begin
  inherited Create(Valor, DupeString('0', Tamanho));
end;

{ TNFeFloat7 }

constructor TNFeFloat7.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.0000000');
end;

{ TCceDataHora }

constructor TCceDataHora.Create;
begin
  Create(Now);
end;

constructor TCceDataHora.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'yyyy-MM-dd hh:nn:ss');
end;

{ TNFeFloat8 }

constructor TNFeFloat8.Create(Valor: Extended);
begin
  inherited Create(Valor, '#0.00000000');
end;

{ TNFeDataHoraTZD }

constructor TNFeDataHoraTZD.Create;
begin
  Create(now);
end;

constructor TNFeDataHoraTZD.Create(DataHora: TDateTime);
begin
  inherited Create(DataHora, 'TZD');
end;

end.
