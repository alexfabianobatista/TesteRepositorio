unit UThreadLocal;

interface

uses Classes, UThreadAction, Forms, UCarregando;

type
  TThreadLocal = class
  private
    FOnRun: TNotifyEvent;
//    procedure Run;
  public
    thread: ThreadAction;
    tela: TFCarregando;
//    property OnRun: TNotifyEvent read FOnRun write FOnRun;
    constructor Create; overload;
    procedure Resume;
    procedure Suspend;
    procedure Terminate;
    procedure FimDaThread(Sender: TObject);
    procedure avisaErro(erro: String);
    procedure atualizaProgresso(atual, total: Integer);
    procedure mostramensagem(mensagem: String; atraso: Boolean = False);
  end;

implementation

uses SysUtils, Math;

{ TThreadLocal }

//procedure TThreadLocal.Run;
//Begin
//
//End;

constructor TThreadLocal.Create;
begin
  thread := ThreadAction.Create(True);
//  thread.OnRun := OnRun;
  thread.OnTerminate := FimDaThread;
  If tela = Nil then
    tela := TFCarregando.Create(Application);
end;

procedure TThreadLocal.Resume;
begin
  thread.Resume;
  tela.setThread(thread);
  tela.ShowModal;
  Application.ProcessMessages;
end;

procedure TThreadLocal.Suspend;
begin
  thread.Suspend;
end;

procedure TThreadLocal.Terminate;
begin
  thread.Terminate;
end;

procedure TThreadLocal.FimDaThread(Sender: TObject);
begin
  tela.FinalizaNormal;
  Free;
end;

procedure TThreadLocal.avisaErro(erro: String);
begin
  tela.FinalizaErro(erro);
  thread.Free;
  Free;
end;

procedure TThreadLocal.atualizaProgresso(atual, total: Integer);
Begin
  tela.gProgresso.MinValue := 0;
  tela.gProgresso.MaxValue := total;
  tela.gProgresso.progress := atual;
End;

procedure TThreadLocal.mostramensagem(mensagem: String; atraso: Boolean = False);
Begin
  tela.mensagemBuffer := mensagem;
  if (not (atraso)) then
    tela.setaMensagem(mensagem)
  else
    tela.AtivaTimer;
End;

end.
