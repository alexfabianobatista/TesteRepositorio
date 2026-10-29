unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Buttons;

type
  TFPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Ajuda1: TMenuItem;
    Conta1: TMenuItem;
    RecebimentodeBloqueto1: TMenuItem;
    CadastrarContas1: TMenuItem;
    SelecionarContaAtiva1: TMenuItem;
    SobreoSistema1: TMenuItem;
    LbData: TLabel;
    Label1: TLabel;
    LbBanco: TLabel;
    LbCodBanco: TLabel;
    LbNumConta: TLabel;
    LbAgencia: TLabel;
    Label2: TLabel;
    LbDtRemessa: TLabel;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Contedo1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RecebimentodeBloqueto1Click(Sender: TObject);
    procedure CadastrarContas1Click(Sender: TObject);
    procedure SelecionarContaAtiva1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure Contedo1Click(Sender: TObject);
  private
    { Private declarations }
    wbooFlag : Boolean;
    procedure IniciaParam();
    procedure AtualizaTela();
    procedure RecebimentoBloqueto();
    procedure CadastrarConta();
    procedure AtivarConta();
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses UAcesso_cl, URecebeBloqueto, UContaCad, UContaCons, UConta_cl, USobre;

{$R *.DFM}

procedure TFPrincipal.IniciaParam();
Var
  wstrAux : String;
Begin
  With DMAcesso Do
  Begin
    wstrAux := BuscaNome('SELECT COUNT(*) FROM TB_PARAM_SISTEMA');
    If( wstrAux = '0')Then
    Begin
      wstrAux := 'INSERT INTO TB_PARAM_SISTEMA (COD_PARAM_SISTEMA) VALUES (1);';
      ExecutaSql(wstrAux);
    End;
    QParamSistema.Close;
    QParamSistema.Open;
  End;
  AtualizaTela();
End;

procedure TFPrincipal.AtualizaTela();
Begin
  With DMConta Do
  Begin
    QConta.Close;
    QConta.ParamByName('PK').AsInteger := DMAcesso.QParamSistemaCOD_CONTA_ATIVA.Value;
    QConta.Open;
    LbBanco.Caption := 'Banco: ' + QContaDESC_BANCO_AGENCIA.Text;
    LbCodBanco.Caption := 'Código do Banco: ' + QContaCOD_BANCO.Text;
    LbAgencia.Caption := 'Agência: ' + QContaCOD_AGENCIA.Text + '-' + QContaDV_AGENCIA.Text;
    LbNumConta.Caption := 'Conta: ' + QContaNUM_CONTA.Text + '-' + QContaDV_CONTA.Text;
    LbDtRemessa.Caption := 'Dt.Última Remessa: ' + FormatDateTime('DD/MM/YYYY',DMAcesso.QParamSistemaDT_ULTIMA_REMESSA.Value);
  End;
End;

procedure TFPrincipal.RecebimentoBloqueto();
Begin
  If(DMAcesso.QParamSistemaCOD_CONTA_ATIVA.IsNull)Then
    raise Exception.Create('Nenhuma Conta esta Ativada')
  Else
  If(FRecebeBloqueto=nil)Then
    FRecebeBloqueto := TFRecebeBloqueto.Create(Application);
  FRecebeBloqueto.FChamador := FPrincipal;
  FRecebeBloqueto.show;
End;

procedure TFPrincipal.CadastrarConta();
Begin
  If(FContaCad=nil)Then
    FContaCad := TFContaCad.Create(Application);
  FContaCad.FChamador := FPrincipal;
  FContaCad.show;
End;

procedure TFPrincipal.AtivarConta();
Var
  wstrAux : String;
Begin
  If(FContaCons=nil)Then
    FContaCons := TFContaCons.Create(Application);
  If(FContaCons.showmodal = mrOk)Then
  Begin
    If( NOT DMConta.QContaConsCOD_CONTA.IsNull )Then
    Begin
      wstrAux := 'UPDATE TB_PARAM_SISTEMA SET COD_CONTA_ATIVA = ' +
                 dmconta.QContaConsCOD_CONTA.Text + 'WHERE COD_PARAM_SISTEMA = 1;';
      DMAcesso.ExecutaSql(wstrAux);
      DMAcesso.QParamSistema.Close;
      DMAcesso.QParamSistema.Open;
      AtualizaTela();
    End;
  End;
End;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMAcesso.QParamSistema.Close;
  DMConta.QConta.Close;
  Action := CaFree;
  FPrincipal := nil;
end;

procedure TFPrincipal.FormActivate(Sender: TObject);
begin
  If(NOT wbooFlag)Then
  Begin
    LbData.Caption := DateTimeToStr(now);
    if MessageDlg('A Data e Hora do Sistema estão Corretos?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      MessageDlg('Configure a Data e Hora de seu computador', mtError,
        [mbOk], 0);
      Application.Terminate;
    end;
    wbooFlag := true;
  End;
  IniciaParam();
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
  LbData.Caption := DateTimeToStr(now);
end;

procedure TFPrincipal.RecebimentodeBloqueto1Click(Sender: TObject);
begin
  RecebimentoBloqueto()
end;

procedure TFPrincipal.CadastrarContas1Click(Sender: TObject);
begin
  CadastrarConta();
end;

procedure TFPrincipal.SelecionarContaAtiva1Click(Sender: TObject);
begin
  AtivarConta();
end;

procedure TFPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.SobreoSistema1Click(Sender: TObject);
begin
  If(FSobre = nil)Then
    FSobre := TFSobre.Create(Application);
  FSobre.showmodal;
end;

procedure TFPrincipal.Contedo1Click(Sender: TObject);
begin
  Application.HelpContext (1);
end;

end.
