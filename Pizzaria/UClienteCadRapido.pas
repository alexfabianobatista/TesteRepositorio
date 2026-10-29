unit UClienteCadRapido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFClienteCadRapido = class(TForm)
    Label1: TLabel;
    ENome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EEndereco: TEdit;
    Label4: TLabel;
    ELocalizacao: TEdit;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    MeTelefone: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeTelefoneEnter(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cliente: Integer;
  end;

var
  FClienteCadRapido: TFClienteCadRapido;

implementation

uses UDmCliente, UDmSistema, UFuncoes, DB;

{$R *.dfm}

procedure TFClienteCadRapido.FormShow(Sender: TObject);
begin
  ENome.SetFocus;
  Cliente := -1;
end;

procedure TFClienteCadRapido.BtnGravarClick(Sender: TObject);
var teste: TModalResult;
begin
  if ENome.Text = '' then
  Begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    ENome.SetFocus;
    Exit;
  End;

  if MeTelefone.Text = '(45)     -    ' then
  Begin
    MessageDlg('Informe o Telefone.', mtWarning, [mbOK], 0);
    MeTelefone.SetFocus;
    Exit;
  End;

  DmCliente.QTelCadastrado.Close;
  DmCliente.QTelCadastrado.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
  DmCliente.QTelCadastrado.Open;

  if (not DmCliente.QTelCadastrado.IsEmpty) then
  Begin
    teste := MessageDlg('Este telefone já está cadastrado no Cliente' + DmCliente.QTelCadastradoDESC_NOME.Value + ' (' + IntToStr(DmCliente.QTelCadastradoCOD_CLIENTE.Value) + ')' + ' .'+#13+#10+'Utilizar este cadastro?', mtWarning, [mbYes, mbNo], 0);
    if teste = mrNo then
    Begin
      MeTelefone.SetFocus;
      Exit;
    End;
    if teste = mrYes then
    Begin
      Cliente := DmCliente.QTelCadastradoCOD_CLIENTE.Value;
      Close;
      Exit;
    End;
  End;

  DmCliente.QMaxCliente.Close;
  DmCliente.QMaxCliente.Open;

  DmSistema.TSistema.CommitRetaining;

  try
    DmCliente.QInsCliente.Close;
    DmCliente.QInsCliente.ParamByName('COD_CLIENTE').AsInteger := DmCliente.QMaxClienteULTIMO.Value + 1;
    DmCliente.QInsCliente.ParamByName('DESC_NOME').AsString := Trim(ENome.Text);
    DmCliente.QInsCliente.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
    DmCliente.QInsCliente.ParamByName('DESC_ENDERECO').AsString := Trim(EEndereco.Text);
    DmCliente.QInsCliente.ParamByName('DESC_LOCALIZACAO').AsString := Trim(ELocalizacao.Text);
    DmCliente.QInsCliente.ExecSQL;

    DmSistema.TSistema.CommitRetaining;
  except
    DmSistema.TSistema.RollbackRetaining;
    Raise Exception.Create('Erro ao gravar o registro.');
  end;

  Cliente := DmCliente.QMaxClienteULTIMO.Value + 1;

  Close;
end;

procedure TFClienteCadRapido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFClienteCadRapido.MeTelefoneEnter(Sender: TObject);
begin
  MeTelefone.SelStart := 5;
  MeTelefone.SelLength := 9;
end;

procedure TFClienteCadRapido.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFClienteCadRapido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
  if key = VK_F9 then
    BtnGravar.Click;
end;

procedure TFClienteCadRapido.FormCreate(Sender: TObject);
begin
  MeTelefone.Text := '(45) ';
end;

end.
