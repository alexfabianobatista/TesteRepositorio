unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ImgList;

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
    procedure BtOkClick(Sender: TObject);
    procedure MECodUsuarioExit(Sender: TObject);
    procedure DBLCBUsuarioCloseUp(Sender: TObject);
    procedure BtTrocaSenhaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBBaseClick(Sender: TObject);
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
  Begin
    DBLCBUsuario.KeyValue := StrToFloat(MECodUsuario.Text);
  End;
end;

procedure TFLogin.DBLCBUsuarioCloseUp(Sender: TObject);
begin
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
  // ShowMessage(DMUsuario.QUsuarioNome.Value);
  wUsuario := DMUsuario.BuscaUsuRede;
  If wUsuario > 0 Then
  Begin
    DBLCBUsuario.KeyValue := wUsuario;
    MECodUsuario.Text := FloatToStr(wUsuario);
    MESenha.SetFocus;
  End;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
  SetaUsuario;
  MESenha.Text := '';
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

end.
