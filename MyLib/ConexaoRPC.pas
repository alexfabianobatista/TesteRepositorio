unit ConexaoRPC;

interface

uses
  XMLRpcTypes, XMLRPCClient, Variants, SysUtils;

type
  TParamsArray = Array of Variant;
  TPtrResult = ^IRpcResult;

  TRPCParams = class(TObject)
  private
    FArray: TParamsArray;
  protected
  public
    function Add(Par: Variant): TRPCParams;
    property ToArray: TParamsArray read FArray;
  end;

  TConexaoRPCResultado = class
  private
  protected
    FResultado: IRpcResult;
  public
    property Resultado: IRpcResult read FResultado;
  end;

  TConexaoRPC = class
  private
    procedure SetEndPoint(const Value: String);
    procedure SetHost(const Value: String);
    procedure SetPort(const Value: Integer);
  protected
    FCaller: TRpcCaller;
    FEndPoint: String;
    FFuncao: TRpcFunction;
    FHost: String;
    FInternalRes: IRpcResult;
    FMsgErro: String;
    FPort: Integer;
  public
    constructor Create(Host: String; Port: Integer; EndPoint: String);
    function ChamaFuncao(Funcao: String): Boolean; overload;
    function ChamaFuncao(Funcao: String; Params: TRPCParams): Boolean; overload;
    function ChamaFuncao(Funcao: String; Res: TConexaoRPCResultado): Boolean; overload;
    function ChamaFuncao(Funcao: String; Params: TRPCParams; Res: TConexaoRPCResultado): Boolean; overload;
    property Caller: TRpcCaller read FCaller;
    property EndPoint: String read FEndPoint write SetEndPoint;
    property Host: String read FHost write SetHost;
    property MsgErro: String read FMsgErro;
    property Port: Integer read FPort write SetPort;
  end;

implementation

{ TConexaoRPC }

function TConexaoRPC.ChamaFuncao(Funcao: String): Boolean;
begin
  Result := ChamaFuncao(Funcao, nil, nil);
end;

function TConexaoRPC.ChamaFuncao(Funcao: String; Params: TRPCParams): Boolean;
begin
  Result := ChamaFuncao(Funcao, Params, nil);
end;

function TConexaoRPC.ChamaFuncao(Funcao: String; Res: TConexaoRPCResultado): Boolean;
begin
  Result := ChamaFuncao(Funcao, nil, Res)
end;

function TConexaoRPC.ChamaFuncao(Funcao: String; Params: TRPCParams;
  Res: TConexaoRPCResultado): Boolean;
var
  i: Integer;
  b: boolean;
begin
  Result := False;
  try
    FMsgErro := '';
    if FFuncao = nil then
      FFuncao := TRpcFunction.Create;
    FFuncao.Clear;
    FFuncao.ObjectMethod := Funcao;
    if Params <> nil then
    begin
      for i := 0 to Length(Params.ToArray) - 1 do
      begin
        case VarType(Params.ToArray[i]) of
          varEmpty     : raise Exception.Create('Parâmetro inválido (tipo varEmpty).');
          varNull      : raise Exception.Create('Parâmetro inválido (tipo varNull).');
          varSmallInt  : FFuncao.AddItem(Integer(Params.ToArray[i]));
          varInteger   : FFuncao.AddItem(Integer(Params.ToArray[i]));
          varSingle    : raise Exception.Create('Parâmetro inválido (tipo varSingle).');
          varDouble    : FFuncao.AddItem(Extended(Params.ToArray[i]));
          varCurrency  : FFuncao.AddItem(Extended(Params.ToArray[i]));
          varDate      : FFuncao.AddItemDateTime(TDateTime(Params.ToArray[i]));
          varOleStr    : FFuncao.AddItem(String(Params.ToArray[i]));
          varDispatch  : raise Exception.Create('Parâmetro inválido (tipo varDispatch).');
          varError     : raise Exception.Create('Parâmetro inválido (tipo varError).');
          varBoolean   : FFuncao.AddItem(Boolean(Params.ToArray[i]));
          varVariant   : raise Exception.Create('Parâmetro inválido (tipo varVariant).');
          varUnknown   : raise Exception.Create('Parâmetro inválido (tipo varUnknown).');
          varByte      : raise Exception.Create('Parâmetro inválido (tipo varByte).');
          varWord      : FFuncao.AddItem(Integer(Params.ToArray[i]));
          varLongWord  : FFuncao.AddItem(Integer(Params.ToArray[i]));
          varInt64     : FFuncao.AddItem(Integer(Params.ToArray[i]));
          varStrArg    : FFuncao.AddItem(String(Params.ToArray[i]));
          varString    : FFuncao.AddItem(String(Params.ToArray[i]));
          varAny       : raise Exception.Create('Parâmetro inválido (tipo varAny).');
        end;
      end;
    end;
    b := false;
    try
      Res.FResultado := nil;
      b := true;
    except
      FMsgErro := 'Parâmetro para devolver resultado não instanciado.';
    end;
    if b then
    begin
      Res.FResultado := FCaller.Execute(FFuncao);
      FInternalRes := Res.FResultado;
    end
    else
      FInternalRes := FCaller.Execute(FFuncao);
    Result := not FInternalRes.IsError;
    if not Result then
      raise Exception.Create('Erro na execução da função (' + Funcao + '). Cód:' +
        IntToStr(FInternalRes.ErrorCode) + ', Msg: ' + FInternalRes.ErrorMsg);
    FFuncao := nil;
  except
    on E: Exception do
    begin
      FFuncao := nil;
      FMsgErro := e.Message;
    end;
  end;
end;

constructor TConexaoRPC.Create(Host: String; Port: Integer;
  EndPoint: String);
begin
  FCaller := TRpcCaller.Create;
  FFuncao := TRpcFunction.Create;

  Self.EndPoint := EndPoint;
  Self.Host := Host;
  Self.Port := Port;
end;

procedure TConexaoRPC.SetEndPoint(const Value: String);
begin
  FEndPoint := Value;
  FCaller.EndPoint := Value;
end;

procedure TConexaoRPC.SetHost(const Value: String);
begin
  FHost := Value;
  FCaller.HostName := Value;
end;

procedure TConexaoRPC.SetPort(const Value: Integer);
begin
  FPort := Value;
  FCaller.HostPort := Value;
end;

{ TParams }

function TRPCParams.Add(Par: Variant): TRPCParams;
var
  i: Integer;
begin
  i := Length(FArray);
  SetLength(FArray, i + 1);
  FArray[i] := Par;
  Result := Self;
end;

end.
