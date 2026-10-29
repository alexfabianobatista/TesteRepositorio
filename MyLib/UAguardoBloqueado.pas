unit UAguardoBloqueado;

interface

uses
  Forms, ExtCtrls, SysUtils, UThreadAction, Variants, UBiblioteca, Classes;

type
  ITelaAguardo = interface
    procedure Acabou;
    procedure Close;
    procedure Feito(Percentual: Extended);
    procedure Limpa;
    procedure MostraPercentual;
    procedure Notifica(Str: String);
    function ShowModal: Integer;
  end;

  TExecucaoAction = (eaAbort, eaContinue, eaOk);
  TExecucaoResult = (erAborted, erContinue, erError, erOk, erTimedOut);

  TDadosExecucao = class
  protected
    FTentativa: Integer;
    FParametros: TVariantMap;
    FObjParametros: TObjectMap;
    FAcao: TExecucaoAction;
    FMsg: String;
    FTela: ITelaAguardo;
  public
    constructor Create;
    property Tentativa: Integer read FTentativa write FTentativa;
    property Parametros: TVariantMap read FParametros write FParametros;
    property ObjParametros: TObjectMap read FObjParametros write FObjParametros;
    property Acao: TExecucaoAction read FAcao write FAcao;
    property Msg: String read FMsg write FMsg;
    property Tela: ITelaAguardo read FTela;
  end;

  IExecucaoSimples = interface
    ['{42F7CAC2-6C07-4607-9782-825A462D5B71}']
    procedure Executar(DadosExecucao: TDadosExecucao);
  end;

  TOnExecucao = procedure(Sender: TObject; Tentativa: Integer; Parametros: TVariantMap;
    var Acao: TExecucaoAction; var Msg: String) of object;
  TOnExecucao2 = procedure(Sender: TObject; DadosExecucao: TDadosExecucao) of object;

  TAguardoBloqueado = class
  private
  protected
    FIntervalo: Integer;
    FResult: TExecucaoResult;
    FMensagem: String;
    FOnExecucao: TOnExecucao;
    FOnExecucao2: TOnExecucao2;
    FExecucoesSimples: TList;
    FParametros: TVariantMap;
    FObjParametros: TObjectMap;
    FTelaAguardo: ITelaAguardo;
    FTentativa: Integer;
    FTentativas: Integer;
    FThread: ThreadAction;
    FTimeOut: Integer;
    procedure ThreadRun(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    function Rodar(EsperaResult: Boolean = True): TExecucaoResult;
    procedure LimpaParametros;
    property Intervalo: Integer read FIntervalo write FIntervalo default 1000;
    property Mensagem: String read FMensagem;
    property OnExecucao: TOnExecucao read FOnExecucao write FOnExecucao;
    property OnExecucao2: TOnExecucao2 read FOnExecucao2 write FOnExecucao2;
    property ExecucoesSimples: TList read FExecucoesSimples;
    property Parametros: TVariantMap read FParametros write FParametros;
    property ObjParametros: TObjectMap read FObjParametros write FObjParametros;
    property TelaAguardo: ITelaAguardo read FTelaAguardo write FTelaAguardo;
    property Thread: ThreadAction read FThread;
    property TimeOut: Integer read FTimeOut write FTimeOut default 30;
  end;

implementation

{ TAguardoBloqueado }

constructor TAguardoBloqueado.Create;
begin
  //Construtor
  FIntervalo := 1000;
  FMensagem := '';
  FTimeOut := 30;
  Parametros := TVariantMap.Create;
  FExecucoesSimples := TList.Create;
end;

destructor TAguardoBloqueado.Destroy;
begin
  //Destrutor
  if Assigned(FThread) then
    FThread.Free;
  if Assigned(FExecucoesSimples) then
    FExecucoesSimples.Free;
  FThread := nil;
end;

function TAguardoBloqueado.Rodar(EsperaResult: Boolean = True): TExecucaoResult;
begin
  FResult := erContinue;
  FThread := ThreadAction.Create(True);
  FThread.FreeOnTerminate := True;
  FThread.OnRun := ThreadRun;
  if FTelaAguardo <> nil then
    FTelaAguardo.Limpa;
  FThread.Resume;
  if FTelaAguardo <> nil then
    FTelaAguardo.ShowModal;
  if (EsperaResult) then
    while FResult = erContinue do //Aguardar o resultado da thread
      Application.ProcessMessages;
  Result := FResult;
end;

procedure TAguardoBloqueado.LimpaParametros;
begin
  FParametros.Clear;
end;

procedure TAguardoBloqueado.ThreadRun(Sender: TObject);
var
  Acao: TExecucaoAction;
  Dados: TDadosExecucao;
  i: Integer;
  Exec: IExecucaoSimples;
begin
  FResult := erContinue;
  try
    if not (Assigned(FOnExecucao) or Assigned(FOnExecucao2) or (ExecucoesSimples.Count > 0)) then
    begin //Nada para fazer
      FResult := erOk;
      Exit;
    end;
    FTentativa := 0;
    while ((FTentativa * FIntervalo) < (FTimeOut * 1000)) do
    begin
      Inc(FTentativa);
      if Application.Terminated then
      begin
        FResult := erAborted;
        Break;
      end;
      Acao := eaContinue;
      Dados := TDadosExecucao.Create;
      Dados.Tentativa := FTentativa;
      Dados.Parametros := FParametros;
      Dados.ObjParametros := FObjParametros;
      Dados.FAcao := Acao;
      Dados.FTela := FTelaAguardo;
      if (FTelaAguardo <> nil) and (FExecucoesSimples.Count > 1) then
        FTelaAguardo.MostraPercentual;
      for i := 0 to FExecucoesSimples.Count - 1 do
      begin
        if Supports(TObject(FExecucoesSimples.Items[i]), IExecucaoSimples, Exec) then
          Exec.Executar(Dados);
        if Dados.Acao <> eaContinue then
          Continue;
        if (FTelaAguardo <> nil) then
          FTelaAguardo.Feito((i + 1) * 100 / FExecucoesSimples.Count);
      end;
      if Assigned(FOnExecucao) then
        FOnExecucao(Self, FTentativa, FParametros, Acao, FMensagem)
      else if Assigned(FOnExecucao2) then
      begin
        FOnExecucao2(Self, Dados);
        FMensagem := Dados.Msg;
        Acao := Dados.Acao;
      end
      else
        if Acao = eaContinue then
          Acao := eaOk;
      if (Acao = eaOk) then
      begin
        FResult := erOk;
        Break;
      end;
      if (Acao = eaAbort) then
      begin
        FResult := erAborted;
        Break;
      end;
      if not Application.Terminated then
        Sleep(FIntervalo);
    end;
  except
    on E: Exception do
    begin
      FMensagem := E.Message;
      FResult := erError;
    end;
  end;
  if FResult = erContinue then
    FResult := erTimedOut;
  Sleep(500);
  if (FTelaAguardo <> nil) then
    FTelaAguardo.Acabou;
  if FTelaAguardo <> nil then
    FTelaAguardo.Close;
end;

{ TDadosExecucao }

constructor TDadosExecucao.Create;
begin
  FParametros := TVariantMap.Create;
  FObjParametros := TObjectMap.Create;
end;

end.
