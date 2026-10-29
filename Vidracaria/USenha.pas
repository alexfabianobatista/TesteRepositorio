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
    procedure FormActivate(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSenha: TFSenha;

implementation

uses UUsuarioCons, UUsuario_cl;

{$R *.DFM}

procedure TFSenha.FormActivate(Sender: TObject);
begin
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

end.
