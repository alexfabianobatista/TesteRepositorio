unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ImgList, ActnList, jpeg, variants;

type
  TFLogin = class(TForm)
    Label1: TLabel;
    MESenha: TMaskEdit;
    BtOk: TBitBtn;
    BtCancelar: TBitBtn;
    Image1: TImage;
    DBLCBUsuario: TDBLookupComboBox;
    MECodUsuario: TMaskEdit;
    Label2: TLabel;
    BtTrocaSenha: TBitBtn;
    SBBase: TSpeedButton;
    ActionList1: TActionList;
    Action1: TAction;
    Timer1: TTimer;
    procedure BtOkClick(Sender: TObject);
    procedure MECodUsuarioExit(Sender: TObject);
    procedure DBLCBUsuarioCloseUp(Sender: TObject);
    procedure BtTrocaSenhaClick(Sender: TObject);
    procedure SBBaseClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Procedure SetaUsuario;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses UUsuario_cl, UTrocaSenha, DB, UOracle_cl;

{$R *.DFM}

procedure TFLogin.BtOkClick(Sender: TObject);
begin
  Try
    DMUsuario.ValidaSenha(DBLCBUsuario.KeyValue,MESenha.Text);
  Except
    ModalResult := mrNone;
    Raise;
  End;
end;

procedure TFLogin.MECodUsuarioExit(Sender: TObject);
begin
  If Trim(MECodUsuario.Text) <> '' then
    DBLCBUsuario.KeyValue := StrToFloat(MECodUsuario.Text);
end;

procedure TFLogin.DBLCBUsuarioCloseUp(Sender: TObject);
begin
  if DBLCBUsuario.KeyValue <> null then
    MECodUsuario.Text := FloatToStr(DBLCBUsuario.KeyValue);
end;

procedure TFLogin.BtTrocaSenhaClick(Sender: TObject);
begin
  If FTrocaSenha = Nil then
    FTrocaSenha := TFTrocaSenha.Create(Application);
  FTrocaSenha.DBLCBUsuario.KeyValue := FLogin.DBLCBUsuario.KeyValue;  
  If FTrocaSenha.ShowModal = mrOk then
  Begin
    MESenha.Text := FTrocaSenha.MESenhaNova.Text;
    DMUsuario.ValidaSenha(DBLCBUsuario.KeyValue,MESenha.Text);
    FLogin.ModalResult := mrOk;
  End;
end;

procedure TFLogin.SetaUsuario;
Var wUsuario : Real;
begin
  wUsuario := DMUsuario.BuscaUsuRede;
//  if ((ParamStr(1) <> '') and (ParamStr(2) <> '')) then
//    wUsuario := StrToInt(ParamStr(1));

  If wUsuario > 0 Then
  Begin
    DBLCBUsuario.KeyValue := wUsuario;
    MECodUsuario.Text := FloatToStr(wUsuario);
    MESenha.SetFocus;
  End;
  MECodUsuarioExit(self);
end;

procedure TFLogin.SBBaseClick(Sender: TObject);
begin
  With DMOracle do
  Try
    If SBBase.Down Then
    Begin
      SBBase.Caption := 'Produção';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORA';
      DBCemapa.Connected := True;
    End
    Else
    Begin
      SBBase.Caption := 'Teste';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORCL';
      DBCemapa.Connected := True;
    End;
    SetaUsuario;
  Except
    MessageDlg('Não foi possível conectar com esta base de dados!'
               +#13+'Certifique-se que esta base existe em seu servidor',mtWarning,[mbOk],0);
  End;
end;

procedure TFLogin.Action1Execute(Sender: TObject);
var
  wAux: String;
begin
  With DMOracle do
    Try
//      DBCemapa.Connected := False;
//      DBCemapa.LogonDataBase := InputBox('Conexão', 'Entre com o nome de Serviço', 'ORCL');
//      DBCemapa.Connected := True;
//      SetaUsuario;
      wAux := 'ORCL';
      if InputQuery('Conexão', 'Entre com o nome de Serviço', wAux) then
      begin
        DBCemapa.Connected := False;
        DBCemapa.LogonDataBase := wAux;
        DBCemapa.Connected := True;
        SetaUsuario;
      end;
    except
      MessageDlg('Não foi possível conectar com esta base de dados!'
               +#13+'Certifique-se que esta base existe em seu servidor',mtWarning,[mbOk],0);
    end;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  MECodUsuario.SetFocus;
  SetaUsuario;
//  if ((ParamStr(1) <> '') and (ParamStr(2) <> '')) then
//  begin
//    MESenha.Text := ParamStr(2);
//    Timer1.Enabled := True;
//  end
//  else
    MESenha.Text := '';
end;

procedure TFLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  BtOk.Click;
end;

end.
