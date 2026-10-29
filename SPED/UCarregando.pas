unit UCarregando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Gauges;

type
  TFCarregando = class(TForm)
    LAguarde: TLabel;
    LProcessando: TLabel;
    BtnCancelar: TBitBtn;
    GProgresso: TGauge;
    LMensagem: TLabel;
    TMensagem: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMensagemTimer(Sender: TObject);
  private
    { Private declarations }
    thread: TThread;
  public
    { Public declarations }
    metodoSaida: String;
    mostraMensagens: boolean;
    mensagemCancelada, mensagemNormal, mensagemErro: String;
    mensagemBuffer: String;
    procedure setThread(valor: TThread);
    procedure FinalizaNormal;
    procedure FinalizaCancela;
    procedure FinalizaErro(erro: String); overload;
    procedure FinalizaErro; overload;
    procedure AtivaTimer;
    procedure DesativaTimer;
    procedure setaMensagem(mensagem: String);
  end;

var
  FCarregando: TFCarregando;

implementation

//uses UBloco0_cl, UBloco1_cl, UBlocoC_cl, UBlocoD_cl, UBlocoE_cl,
//  UBlocoH_cl, UBlocoI_cl, UGia_cl;

{$R *.dfm}

procedure TFCarregando.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if mostraMensagens then
    if metodoSaida = 'NORMAL' then
      MessageDlg(mensagemNormal, mtInformation, [mbOK], 0);
    if metodoSaida = 'CANCELADO' then
      MessageDlg(mensagemCancelada, mtInformation, [mbOK], 0);
    if metodoSaida = 'ERRO' then
      MessageDlg(mensagemErro, mtInformation, [mbOK], 0);

  Action := caFree;
end;

procedure TFCarregando.FinalizaNormal;
Begin
  metodoSaida := 'NORMAL';
  Close;
End;

procedure TFCarregando.FinalizaErro;
Begin
  metodoSaida := 'ERRO';
  Close;
End;

procedure TFCarregando.FinalizaErro(erro: String);
Begin
  metodoSaida := 'ERRO';
  mensagemErro := erro;
  Close;
End;

procedure TFCarregando.FinalizaCancela;
Begin
  metodoSaida := 'CANCELADO';
  Close;
End;

procedure TFCarregando.setThread(valor: TThread);
begin
  Self.thread := valor;
end;

procedure TFCarregando.BtnCancelarClick(Sender: TObject);
begin
  thread.Suspend;
  if (MessageDlg('Deseja realmente cancelar esta operação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  Begin
    metodoSaida := 'CANCELADO';
    thread.Terminate;
    Close;
  End
  Else
    thread.Resume;
end;

procedure TFCarregando.FormCreate(Sender: TObject);
begin
  metodoSaida := 'ERRO';
  mensagemCancelada := 'Operação cancelada.';
  mensagemNormal := 'Operação concluída com sucesso.';
  mensagemerro := 'Erro na Operação. Cancelando.';
  mensagemBuffer := 'Inicializando';
  TMensagem.Enabled := True;
end;

procedure TFCarregando.TMensagemTimer(Sender: TObject);
begin
  setaMensagem(mensagemBuffer);
end;

procedure TFCarregando.AtivaTimer;
begin
  if (not (TMensagem.Enabled)) then
    TMensagem.Enabled := True;
end;

procedure TFCarregando.DesativaTimer;
begin
  TMensagem.Enabled := False;
end;

procedure TFCarregando.setaMensagem(mensagem: String);
begin
  if (not (LMensagem.Visible)) then
    LMensagem.Visible := True;
    
  LMensagem.Caption := mensagemBuffer;
  Application.ProcessMessages;
end;

end.
