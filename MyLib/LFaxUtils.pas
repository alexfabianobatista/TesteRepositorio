unit LFaxUtils;

interface

uses
  Windows, IniFiles, SysUtils, Forms, ToolWin, Dialogs, Variants, Printers,
  Messages, UAguardoBloqueado, StdCtrls, Classes, UBiblioteca;

type
  ILFaxProvider = interface
    function GetFaxNumber: String;
    function GetLogin: string;
    function GetPassword: string;
    function GetDate: TDateTime;
    function GetFirm: string;
    function GetFirmPhone: String;
    function GetContact: string;
    function GetSubject: string;
    function GetComment: string;
    function GetSecondFaxNumber: String;
    function GetPriority: string;
    function GetFacePage: string;
    function GetLFaxDirectory: string;
    procedure Free;
    procedure UpdateData;
  end;

  TLFax = class
  private
    FConfigDir: String;
    FEnabled: Boolean;
    FProvider: ILFaxProvider;
    function GetResponse: String;
    procedure DeleteConfigFile(FileName: String);
    procedure OnWaitResponse(Sender: TObject; Tentativa: Integer; Parametros: TVariantMap;
      var Acao: TExecucaoAction; var Msg: String);
    procedure SetEnabled(const Value: Boolean);
  protected
    constructor Create;
  public
    class procedure VerifyInstance;
    function WaitResponse(TimeOut: Integer; WaitForm: ITelaAguardo): String;
    procedure UpdateConfigDir;
    procedure PutConfigFiles;
    procedure ClearConfigFiles;
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Provider: ILFaxProvider read FProvider write FProvider;
    property Response: String read GetResponse;
  end;

procedure SetPrinter(PrinterName: String; FullName: Boolean = False; IgnoreCharCase: Boolean = True);

var
  LFax: TLFax;

const
  LFAX_FILE_INFO: String = 'lfaxinfo.txt';
  LFAX_FILE_RESPONSE: String = 'lfaxresp.txt';
  LFAX_FILE_LOGIN: String = 'lfaxlogin.inf';

  LFAX_RESP_NOT_FOUND: String = '<Não houve resposta do LFax>';

implementation

uses StrUtils;

procedure SetPrinter(PrinterName: String; FullName: Boolean = False; IgnoreCharCase: Boolean = True);
var
  I: Integer;
  Device: PChar;
  Driver: PChar;
  Port: PChar;
  HdeviceMode: THandle;
  aPrinter: TPrinter;
  Search, Searched: String;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.Create;
  Search := IfThen(IgnoreCharCase, UpperCase(PrinterName), PrinterName);
  for I := 0 to Printer.Printers.Count - 1 do
  begin
    Searched := IfThen(IgnoreCharCase, UpperCase(Printer.Printers[i]), Printer.Printers[i]);
    if (Search = Searched) or ((not FullName) and (PosEx(Search, Searched) > 0)) then
    begin
      aPrinter.PrinterIndex := i;
      aPrinter.GetPrinter(Device, Driver, Port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver);
      StrCat(Device, Port);
      WriteProfileString('windows', 'device', Device);
      StrCopy(Device, 'windows');
//      SendMessage(HWND_BROADCAST, WM_WININICHANGE,
//        0, Longint(@Device));
      Break;
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

{ LFax }

constructor TLFax.Create();
begin
  //Construtor
  FConfigDir := '';
  Enabled := False;
end;

class procedure TLFax.VerifyInstance;
begin
  if LFax = nil then
    LFax := TLFax.Create;
end;

procedure TLFax.PutConfigFiles;
  procedure AddStr(var Str: string; Value: string);
  begin
    Str := Str + Value + ';';
  end;
//  procedure AddInt(var Str: string; Value: Integer);
//  begin
//    Str := Str + IfThen(Value > 0, IntToStr(Value), '') + ';';
//  end;
  procedure AddDate(var Str: string; Value: TDateTime);
  begin
    Str := Str + IfThen(Value <> null, FormatDateTime('ddMMyyyy', Value), '') + ';';
  end;
  procedure AddTime(var Str: string; Value: TDateTime);
  begin
    Str := Str + IfThen(Value <> null, FormatDateTime('hhnn', Value), '') + ';';
  end;
var
  Login, Config, Aux: string;
  TxtFile: TextFile;
begin
  if not Enabled then
    Raise Exception.Create('Objeto LFax não habilitado.' + #13 + #10 +
      'Informações técnicas: atributo Enabled está falso.');

  try
    if FConfigDir = '' then
      UpdateConfigDir;
    ClearConfigFiles;

    FProvider.UpdateData;

    Login := '';
    Aux := FProvider.GetLogin;
    if Aux <> '' then
    begin
      AddStr(Login, Aux);
      AddStr(Login, FProvider.GetPassword);
      Login := Copy(Login, 1, Length(Login) - 1); //Removendo ultimo ';'
    end;

    Config := '';
    AddStr(Config, FProvider.GetFaxNumber);
    AddStr(Config, FProvider.GetLogin);
    AddDate(Config, FProvider.GetDate);
    AddTime(Config, FProvider.GetDate);
    AddStr(Config, FProvider.GetFirm);
    AddStr(Config, FProvider.GetFirmPhone);
    AddStr(Config, FProvider.GetContact);
    AddStr(Config, FProvider.GetSubject);
    AddStr(Config, FProvider.GetComment);
    AddStr(Config, FProvider.GetSecondFaxNumber);
    AddStr(Config, FProvider.GetPriority);
    AddStr(Config, FProvider.GetFacePage);
    AddStr(Config, '');
    Config := Copy(Config, 1, Length(Config) - 1); //Removendo ultimo ';'

    if Login <> '' then
    begin
      AssignFile(TxtFile, FConfigDir + LFAX_FILE_LOGIN);
      Rewrite(TxtFile);
      Write(TxtFile, Login);
      CloseFile(TxtFile);
    end;

    AssignFile(TxtFile, FConfigDir + LFAX_FILE_INFO);
    Rewrite(TxtFile);
    Write(TxtFile, Config);
    CloseFile(TxtFile);
  except
    Raise;
  end;
end;

function TLFax.GetResponse: String;
var
  RespDir, Buff: String;
  Resp: TextFile;
begin
  Result := '';
  RespDir := FConfigDir + LFAX_FILE_RESPONSE;
  if FileExists(RespDir) then
  begin
    AssignFile(Resp, RespDir);
    Reset(Resp);
    while not Eof(Resp) do
    begin
      Readln(Resp, Buff);
      Result := Result + Buff;
    end;
    CloseFile(Resp);
  end;
end;

procedure TLFax.UpdateConfigDir;
begin
  FConfigDir := FProvider.GetLFaxDirectory;
  if FConfigDir[Length(FConfigDir) - 1] <> '\' then
    FConfigDir := FConfigDir + '\';
  if not DirectoryExists(FConfigDir) then
    CreateDir(FConfigDir);
end;

procedure TLFax.ClearConfigFiles;
begin
  DeleteConfigFile(FConfigDir + LFAX_FILE_RESPONSE);
  DeleteConfigFile(FConfigDir + LFAX_FILE_INFO);
  DeleteConfigFile(FConfigDir + LFAX_FILE_LOGIN);
end;

procedure TLFax.DeleteConfigFile(FileName: String);
begin
  try
    if FileExists(FileName) then
      DeleteFile(FileName);
  except
  end;
end;

procedure TLFax.SetEnabled(const Value: Boolean);
begin
  if (Value) and (FProvider = nil) then
    Raise Exception.Create('Provedor do LFax não informado.');
  FEnabled := Value;
end;

function TLFax.WaitResponse(TimeOut: Integer; WaitForm: ITelaAguardo): String;
var
  I, WaitTime: Integer;
  WaitObject: TAguardoBloqueado;
begin
  WaitObject := TAguardoBloqueado.Create;

  WaitObject.OnExecucao := OnWaitResponse;
  WaitObject.TelaAguardo := WaitForm;
  WaitObject.TimeOut := TimeOut;
  WaitObject.Intervalo := 500;
  if WaitObject.Rodar = erOk then
    Result := WaitObject.Mensagem
  else
    Result := LFAX_RESP_NOT_FOUND;
//  if wait
//  else
//  begin
//    if FConfigDir = '' then
//      UpdateConfigDir;
//    WaitTime := 500; //Verificar a cada meio segundo
//    for I := 0 to Trunc(TimeOut*(1000/WaitTime)) do //Aguardando resposta do LFax.
//    begin
//      Result := Response;
//      if Result <> '' then
//        Exit;
//      Sleep(WaitTime);
//    end;
//    Result := LFAX_RESP_NOT_FOUND;
//  end;
end;

procedure TLFax.OnWaitResponse(Sender: TObject; Tentativa: Integer;
  Parametros: TVariantMap; var Acao: TExecucaoAction; var Msg: String);
begin
  Msg := Response;
  if Msg <> '' then
    Acao := eaOk;
end;

end.

