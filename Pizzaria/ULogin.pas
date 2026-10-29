unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    MeCodOperador: TMaskEdit;
    EOperador: TEdit;
    ESenha: TEdit;
    Label1: TLabel;
    BtnLogin: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeCodOperadorChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    idnOK: Boolean;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses UDmOperador, UFuncoes, UOperadorCad, UDmSistema, DB;

{$R *.dfm}

procedure TFLogin.BtnLoginClick(Sender: TObject);
begin
  if MeCodOperador.Text = '' then
  Begin
    MessageDlg('Informe o Operador.', mtWarning, [mbOK], 0);
    MeCodOperador.SetFocus;
    Abort;
  End;

  if ESenha.Text = '' then
  Begin
    MessageDlg('Informe a Senha.', mtWarning, [mbOK], 0);
    ESenha.SetFocus;
    Abort;
  End;

  DmOperador.QLogin.Close;
  DmOperador.QLogin.ParamByName('COD_OPERADOR').AsInteger := StrToInt(MeCodOperador.Text);
  DmOperador.QLogin.ParamByName('DESC_SENHA').AsString := ESenha.Text;
  DmOperador.QLogin.Open;

  if DmOperador.QLogin.IsEmpty then
  Begin
    MessageDlg('Usuário ou senha incorretos.', mtError, [mbOK], 0);
    Abort;
    MeCodOperador.SetFocus;
  End;

  OperadorLogado := DmOperador.QLoginCOD_OPERADOR.Value;

  idnOK := True;
  Close;
end;

procedure TFLogin.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not idnOK then
    Application.Terminate;
end;

procedure TFLogin.MeCodOperadorChange(Sender: TObject);
begin
  if MeCodOperador.Text <> '' then
    EOperador.Text := BuscaString('DESC_NOME', 'TB_OPERADOR', 'COD_OPERADOR', StrToInt(MeCodOperador.Text))
  else
    EOperador.Clear;
end;

procedure TFLogin.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFOperadorCad, FOperadorCad);
  FOperadorCad.Consultando := True;
  FOperadorCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodOperador.Text := IntToStr(RetornoConsulta)
  else
    MeCodOperador.Clear;

  MeCodOperador.SetFocus;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  idnOK := False;
end;

end.
