unit USenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFSenha = class(TForm)
    Label1: TLabel;
    EdSenha: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    MeUsuario: TMaskEdit;
    BtConsProduto: TBitBtn;
    BitBtn2: TBitBtn;
    CBOpcao: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdSenhaEnter(Sender: TObject);
    procedure EdSenhaExit(Sender: TObject);
    procedure EdSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSenha: TFSenha;

implementation

uses UUsuarioCons, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFSenha.FormActivate(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa = 'NUTRIPET') then
  begin
    Label2.Visible        := True;
    MeUsuario.Visible     := True;
    BtConsProduto.Visible := True;
  end;
  EdSenha.Text := '';
end;

procedure TFSenha.BtConsProdutoClick(Sender: TObject);
begin
  If FUsuarioCons = Nil Then
     FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = MrOk Then
     MeUsuario.Text := DMUsuario.QUsuarioConsCod_Usuario.Text;     
end;

procedure TFSenha.FormShow(Sender: TObject);
begin
  if EdSenha.Showing then
    EdSenha.SetFocus;
end;

procedure TFSenha.EdSenhaEnter(Sender: TObject);
begin
  Self.Tag := 100;
end;

procedure TFSenha.EdSenhaExit(Sender: TObject);
begin
  Self.Tag := 0;
end;

procedure TFSenha.EdSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ModalResult := mrOk;
end;

procedure TFSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if  Key = #27 then  // pressiona ESC
    ModalResult := mrCancel;
end;

end.
