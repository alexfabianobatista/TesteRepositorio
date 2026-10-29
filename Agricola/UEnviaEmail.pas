unit UEnviaEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, CemapaUtils_TLB;

type
  TFEnviaEmail = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    mensagem_email: string;
    assunto_email: string;
    email : string;
    mostraMsgConclusao: Boolean;
    EmailSistema: IEmailSistema;
  published
    edEmail: TEdit;
    Label1: TLabel;
    BtEnviar: TBitBtn;
    BtCancelar: TBitBtn;
    procedure configuraSMTP;
    procedure FormActivate(Sender: TObject);
    procedure BtEnviarClick(Sender: TObject);
  public
    caminhoAnexo: string;
    mostraCarregando: Boolean;
    property pmensagem_email: string read mensagem_email write mensagem_email;
    property passunto_email: string read assunto_email write assunto_email;
    property pemail: string read email write email;
    property pMostraMsgConclusao: Boolean read mostraMsgConclusao write mostraMsgConclusao
      default true;
  end;

var
  FEnviaEmail: TFEnviaEmail;

implementation

uses UCadastro_cl, UParamSistema_cl, DB, UOracle_cl, UPedido_cl, DateUtils,
  UAguarde;

{$R *.dfm}

procedure TFEnviaEmail.configuraSMTP;
begin
  With DMCadastro do
  begin
    QCadastroEmail.Close;
    QCadastroEmail.Open;
    if QCadastroEmail.RecordCount = 0 then
      raise Exception.Create('Email não configurado!');
    try
      EmailSistema := CoEmailSistema.Create;
    except
      WinExec( 'regasm CemapaUtils.dll /tlb:CemapaUtils.tlb',SW_HIDE);
      Screen.Cursor := crHourGlass;
      Sleep(3000);
      Screen.Cursor := crDefault;
      EmailSistema := CoEmailSistema.Create;
    end;
      EmailSistema.Configurar(QCadastroEmailDESC_SMTP.Value, QCadastroEmailNUM_PORTA_SMTP.Value,
                            QCadastroEmailDESC_EMAIL.Value, QCadastroEmailDESC_SENHA.Value,
                            QCadastroEmailIND_SSL.Value = 'S');
    end;
end;


procedure TFEnviaEmail.FormActivate(Sender: TObject);
begin
  if email <> '' then
    edEmail.Text := email;
end;

procedure TFEnviaEmail.BtEnviarClick(Sender: TObject);
begin
  FEnviaEmail.Visible := false;


  if mostraCarregando then
  begin
    if faguarde = nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show();
    Application.ProcessMessages;
  end;
  
  if (EmailSistema.Enviar(edEmail.Text,'','',2,mensagem_email, true, caminhoAnexo,'', assunto_email)) and
    (pMostraMsgConclusao) then
  begin
    email := '';
    ShowMessage('E-mail enviado com sucesso.');
  end;
end;


procedure TFEnviaEmail.FormCreate(Sender: TObject);
begin
  try
    mostraCarregando := True;
    configuraSMTP;
  except
    close;
  end;
end;

end.
