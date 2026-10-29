unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, Buttons, ExtCtrls;

type
  TFMenu = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    GrupoProduto1: TMenuItem;
    CadastroTabelaPreos1: TMenuItem;
    CadastroVerbapRepresenante1: TMenuItem;
    DistribuiVerbaPVendedor1: TMenuItem;
    procedure GrupoProduto1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastroTabelaPreos1Click(Sender: TObject);
    procedure CadastroVerbapRepresenante1Click(Sender: TObject);
    procedure DistribuiVerbaPVendedor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

uses UGrupoProduto_Cad, UTela_cl, UPrecoPocket1_Cad, UVerbaRepresentante,
  UVerbaVendedor;

{$R *.dfm}

procedure TFMenu.GrupoProduto1Click(Sender: TObject);
begin
  inherited;
  If FGrupoProduto_Cad = Nil Then
     FGrupoProduto_Cad := TFGrupoProduto_Cad.Create(application);
  DMTela.VerificaTela(pModulo,FGrupoProduto_Cad.Caption,FGrupoProduto_Cad.Name);
  FGrupoProduto_Cad.ShowModal;
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'COORDENADOR';
end;

procedure TFMenu.CadastroTabelaPreos1Click(Sender: TObject);
begin
  inherited;
  If FPrecoPocket1_Cad = Nil Then
     FPrecoPocket1_Cad := TFPrecoPocket1_Cad.Create(application);
  DMTela.VerificaTela(pModulo,FPrecoPocket1_Cad.Caption,FPrecoPocket1_Cad.Name);
  FPrecoPocket1_Cad.ShowModal;

end;

procedure TFMenu.CadastroVerbapRepresenante1Click(Sender: TObject);
begin
  inherited;
  If FVerbaRepresentante = Nil Then
     FVerbaRepresentante := TFVerbaRepresentante.Create(application);
  DMTela.VerificaTela(pModulo,FVerbaRepresentante.Caption,FVerbaRepresentante.Name);
  FVerbaRepresentante.ShowModal;

end;

procedure TFMenu.DistribuiVerbaPVendedor1Click(Sender: TObject);
begin
  inherited;
  If FVerbaVendedor = Nil Then
     FVerbaVendedor := TFVerbaVendedor.Create(application);
  DMTela.VerificaTela(pModulo,FVerbaVendedor.Caption,FVerbaVendedor.Name);
  FVerbaVendedor.ShowModal;

end;

end.
