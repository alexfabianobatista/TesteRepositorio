unit XMLUtils;

interface

uses
  Classes, TypInfo;

type
  TXMLType = (xtTag, xtAttribute, xtNone);

  IXmlParseable = interface
    function GetHeader: String;
    function GetXML(MainTAG: String; Ident: Boolean = False): String;
  end;

  IVersionControl = interface
    function ContainsProp(Obj: TObject; PropName: String): Boolean;
  end;

  TVersionControl = class(TInterfacedObject, IVersionControl)
  protected
    FVersion: String;
  public
    constructor Create(Version: String);
    function ContainsProp(Obj: TObject; PropName: String): Boolean; virtual; abstract;
    property Version: String read FVersion;
  end;

  TSimpleXmlParseable = class(TInterfacedPersistent, IXmlParseable)
  protected
    function GetXMLName(Prop: TPropInfo): String; virtual;
    function GetXMLType(Prop: TPropInfo): TXMLType; virtual;
    function GetXMLValor(Prop: TPropInfo): String; virtual;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; virtual;
    function IsNullValue(Prop: TPropInfo): Boolean; virtual;
  public
    function GetHeader: String; virtual; abstract;
    function GetContent(TAGName: String; VersionControl: IVersionControl;
        EvenIfNull: Boolean = True; Level: Integer = 0): String;
    function GetXML(MainTAG: String; Ident: Boolean = False): String; overload;
    function GetXML(MainTAG: String; VersionControl: IVersionControl; Ident: Boolean = False): String; overload;
  end;

  TXmlParseableArray = Array of TSimpleXmlParseable;

  IXmlArrayOfObject = interface
    function GetItems: TXmlParseableArray;
  end;

  TXmlArrayOfObject = class(TInterfacedPersistent, IXmlArrayOfObject)
  public
    function GetItems: TXmlParseableArray; virtual; abstract;
  end;

  TXmlArrayToString = class
    protected
    private
    public
      function ArrayToString(param :TStrings): String;
  end;

procedure PutTag(var XML: String; TagName: String; Ending: Boolean = False);

implementation

uses
  StrUtils, Variants, Dialogs, SysUtils, Math;

procedure PutTAG(var XML: String; TagName: String; Ending: Boolean = False);
begin
  XML := XML + '<' + IfThen(Ending, '/') + TagName + '>';
end;

{ TSimpleXmlParseable }

function TSimpleXmlParseable.GetXML(MainTAG: String; Ident: Boolean = False): String;
begin
  Result := GetXML(MainTAG, nil, Ident);
end;

function TSimpleXmlParseable.GetContent(TAGName: String; VersionControl: IVersionControl;
    EvenIfNull: Boolean = True; Level: Integer = 0): String;
  procedure SimpleVal(var Str: String; CurrTag: String; Prop: TPropInfo);
  var
    Aux: String;
  begin
    try
      Aux := GetXMLValor(Prop);
    except
      on E: Exception do
        Aux := 'Falha de conversão de valor (' +
          Prop.Name + ', ' + e.Message + ')';
    end;
    try
      if (not IsNullValue(Prop)) or (IsTagEvenEmpty(Prop)) then
      begin
        if Level > -1 then
          Str := Str + #13 + #10 + DupeString(Chr(9), Level + 1);
        PutTag(Str, CurrTag);
        Str := Str + Aux;
        PutTag(Str, CurrTag, True);
      end;
    except
      Raise Exception.Create(Prop.Name);
    end;
  end;
  function GetVal(PropInfo: PPropInfo): String;
  var
    propObj: TObject;
    propArray: TXmlParseableArray;
    CurrTag: String;
    i: Integer;
  begin
    Result := '';
    SetLength(propArray, 0);
    CurrTag := GetXMLName(PropInfo^);
    if (PropInfo^.PropType^.Kind = tkClass) then
    begin
      propObj := GetObjectProp(Self, PropInfo);
      if (propObj <> nil) then
      begin
        if (propObj is TSimpleXmlParseable) then
          Result := TSimpleXmlParseable(propObj).GetContent(CurrTag, VersionControl,
              EvenIfNull, IfThen(Level > -1, Level + 1, Level))
        else if (propObj is TXmlArrayOfObject) then
        begin
          propArray := (propObj as TXmlArrayOfObject).GetItems;
          for i := 0 to Length(propArray) - 1 do
            Result := Result + TSimpleXmlParseable(propArray[i]).GetContent(
                CurrTag, VersionControl, EvenIfNull, IfThen(Level > -1,
                Level + 1, Level));
        end
        else
        begin
          SimpleVal(Result, CurrTag, PropInfo^);
        end;
      end
      else if IsTagEvenEmpty(PropInfo^) then
      begin
        if Level > -1 then
          Result := Result + #13 + #10 + DupeString(Chr(9), Level + 1);
        PutTag(Result, CurrTag);
        PutTag(Result, CurrTag, True);
      end;
    end
    else if (PropInfo^.PropType^.Kind = tkDynArray) then
    begin
      //Not supported.
    end
    else
    begin
      SimpleVal(Result, CurrTag, PropInfo^);
    end;
  end;
var
  propList: TPropList;
  Info: PPropInfo;
  i: Integer;
  Attributes, Content: String;
begin
  GetPropList(Self.ClassInfo, tkAny, @propList, False);
  Content := '';
  Result := '';
  for i := 0 to Length(propList) - 1 do
  begin
    Info := propList[i];
    if (Info <> nil) then
    begin
      try
        GetPropValue(Self, Info^.Name); //Código mágico, sem ele não funciona, mas não faz nada também. Não remova.
      except
      end;

      try
        if (VersionControl <> nil) and (not VersionControl.ContainsProp(Self,
            Info^.Name)) then
          Continue;
        case GetXMLType(Info^) of
          xtTag:
          begin
            Content := Content + GetVal(Info);
          end;
          xtAttribute:
          begin
            Attributes := Attributes + ' ' + GetXMLName(Info^) + '="' +
                GetXMLValor(Info^) + '"';
          end;
        end;
      except
      end;
    end;
  end;
  if (EvenIfNull) or (Content <> '') then
  begin
    if Level > -1 then
      Result := Result + #13 + #10 + DupeString(Chr(9), Level);
    PutTag(Result, TAGName + Attributes);
    Result := Result + Content;
    if Level > -1 then
      Result := Result + #13 + #10 + DupeString(Chr(9), Level);
    PutTag(Result, TAGName, True);
  end;
end;

function TSimpleXmlParseable.GetXMLName(Prop: TPropInfo): String;
begin
  Result := Prop.Name;
end;

function TSimpleXmlParseable.GetXMLType(Prop: TPropInfo): TXMLType;
begin
  Result := xtTag;
end;

function TSimpleXmlParseable.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  Result := True;
end;

function TSimpleXmlParseable.GetXMLValor(Prop: TPropInfo): String;
var
  v: Variant;
begin
  Result := '';
  v := GetPropValue(Self, Prop.Name);
  if v <> null then
    Result := VarToStr(v);
end;

function TSimpleXmlParseable.IsNullValue(Prop: TPropInfo): Boolean;
begin
  Result := ((Prop.PropType^.Kind = tkString) and (GetStrProp(Self, Prop.Name) = '')) or
      ((Prop.PropType^.Kind = tkLString) and (GetStrProp(Self, Prop.Name) = '')) or
      ((Prop.PropType^.Kind = tkInteger) and (GetPropValue(Self, Prop.Name) = 0)) or
      ((Prop.PropType^.Kind = tkFloat) and (GetFloatProp(Self, Prop.Name) = 0)) or
      ((Prop.PropType^.Kind = tkInt64) and (GetInt64Prop(Self, Prop.Name) = 0)) or
      ((Prop.PropType^.Kind = tkVariant) and (GetVariantProp(Self, Prop.Name) = null));
end;

function TSimpleXmlParseable.GetXML(MainTAG: String;
  VersionControl: IVersionControl; Ident: Boolean): String;
begin
  Result := GetHeader + GetContent(MainTAG, VersionControl, False, IfThen(Ident, 0, -1));
end;

{ TVersionControl }

constructor TVersionControl.Create(Version: String);
begin
  FVersion := Version;
end;

{ TXmlArrayToString }
function TXmlArrayToString.ArrayToString(param :TStrings):String;
var
  i: Integer;
  wXml: String;
begin
  wXml := '';
  for i := 0 to param.Count -1 do
  begin
    wXml := wXml + param[i];
  end;
  Result := wXml;
end;

end.
