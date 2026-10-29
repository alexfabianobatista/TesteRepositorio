unit UMenuPesquisa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuPesquisa = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastroPesquisa1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroPesquisa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPesquisa: TFMenuPesquisa;

implementation

uses UPesquisaCad, UTela_cl;

{$R *.DFM}

procedure TFMenuPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'PESQUISA';
end;

procedure TFMenuPesquisa.CadastroPesquisa1Click(Sender: TObject);
begin
  inherited;
  If FPesquisaCad = Nil then
    FPesquisaCad := TFPesquisaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPesquisaCad.Caption,FPesquisaCad.Name);
  FPesquisaCad.ShowModal;

end;

end.
