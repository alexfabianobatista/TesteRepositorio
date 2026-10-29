unit UMenuSuporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, ImgList, ComCtrls, Buttons, ExtCtrls;

type
  TFMenuSuporte = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Suporte1: TMenuItem;
    procedure Suporte1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuSuporte: TFMenuSuporte;

implementation

uses USuporteCad, UTela_cl;


{$R *.dfm}

procedure TFMenuSuporte.Suporte1Click(Sender: TObject);
begin
  inherited;
  if FSuporteCad = nil then
    FSuporteCad := TFSuporteCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSuporteCad.Caption, FSuporteCad.Name);
  FSuporteCad.ShowModal;
end;

procedure TFMenuSuporte.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'SUPORTE';
end;

procedure TFMenuSuporte.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsNormal;
  FMenuSuporte.TOP:= SCREEN.WorkAreaHeight- FMenuSuporte.HEIGHT;
  FMenuSuporte.LEFT:=SCREEN.WorkareaWidth- FMenuSuporte.WIDTH;
  
end;

end.
