unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, ImgList, ComCtrls, Buttons, ExtCtrls;

type
  TFMenuPrincipal = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Cadastraalquotas1: TMenuItem;
    procedure Cadastraalquotas1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPrincipal: TFMenuPrincipal;

implementation

uses UCadastraAliquota;

{$R *.dfm}

procedure TFMenuPrincipal.Cadastraalquotas1Click(Sender: TObject);
begin
  inherited;
  if FCadastraAliquota = Nil then
    FCadastraAliquota := TFCadastraAliquota.Create(Application);
  FCadastraAliquota.ShowModal; 
end;

procedure TFMenuPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'CONFIGURAIMPRESSORA'
end;

end.
