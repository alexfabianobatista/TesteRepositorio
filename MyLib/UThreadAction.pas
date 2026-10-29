unit UThreadAction;

interface

uses
  Classes;

type
  ThreadAction = class(TThread)
  private

    FOnRun: TNotifyEvent;
    procedure Run;
  protected
    procedure Execute; override;
  published
    property OnRun: TNotifyEvent read FOnRun write FOnRun;

  end;

implementation

uses UNotaAutomaticaFlag;

procedure ThreadAction.Execute;
begin
  // Para nota automática deve sincronizar com a thread principal
  if NotaAutomaticaFlag = Nil then
    NotaAutomaticaFlag := TNotaAutomaticaFlag.Create;
  if NotaAutomaticaFlag.pNotaAutomatica then
    Synchronize(Run)
  else
    Run;
end;

procedure ThreadAction.Run;
Begin
  if Assigned(FOnRun) then FOnRun(Self);
End;

end.
