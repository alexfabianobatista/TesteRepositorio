unit NFeRPCRetorno;

interface

uses
  Classes;

type
  TNFeRPCRetorno = class
  protected
    FStatus: Integer;
    FMotivo: String;
    FDescricao: String;
    FComplemento: String;
  public
    constructor Create; overload;
    constructor Create(Stream: String); overload;
    function sBreakApart(BaseString, BreakString: string; StringList: TStringList): TStringList;
    property Status: Integer read FStatus write FStatus;
    property Motivo: String read FMotivo write FMotivo;
    property Descricao: String read FDescricao write FDescricao;
    property Complemento: String read FComplemento write FComplemento;
  end;

const
  SEPARATOR: Char = '~';

implementation

uses
  StrUtils, SysUtils;

{ TNFeRPCRetorno }

constructor TNFeRPCRetorno.Create;
begin
  Create('' + SEPARATOR + '' + SEPARATOR + '' + SEPARATOR + '');
end;

constructor TNFeRPCRetorno.Create(Stream: String);
  procedure Subst(var Str: String; Old, New: String);
  begin
    Str := StringReplace(Str, Old, New, [rfReplaceAll]);
  end;
var
  Str: TStringList;
begin
  Str := TStringList.Create;
  Str.Clear;
  {Str.Delimiter := SEPARATOR;
  Subst(Stream, ' ', '$espaco$');
  Subst(Stream, #13 + #10, '$enter$');
  Subst(Stream, #$A, '$enter$');
  Str.DelimitedText := Stream;}
  Str:= sBreakApart(Stream,SEPARATOR,Str);
  FStatus := StrToInt('0' + Str[0]);
  FMotivo := Str[1];
  FDescricao := Str[2];
  FComplemento := Str[3];
end;

function TNFeRPCRetorno.sBreakApart(BaseString, BreakString: string; StringList: TStringList): TStringList;
var
  EndOfCurrentString: Integer;
  TempStr: string;
  i: Integer;
begin
  i:=0;
  repeat
    EndOfCurrentString := PosEx(BreakString, BaseString);
    i := i+1;
    if (EndOfCurrentString = 0) or (i = 4) then
    begin
      StringList.add(BaseString);
      EndOfCurrentString := 0;
    end
    else
      StringList.add(Copy(BaseString, 1, EndOfCurrentString - 1));
    BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);
  until EndOfCurrentString = 0;
  result := StringList;
end;

end.
