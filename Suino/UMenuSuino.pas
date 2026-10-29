unit UMenuSuino;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, Buttons, ExtCtrls;

type
  TFMenuSuino = class(TFTMenuPrincipal)
    Manuteo1: TMenuItem;
    Despesas1: TMenuItem;
    Sobra1: TMenuItem;
    ControledeUPL1: TMenuItem;
    CadastroIncentivos1: TMenuItem;
    abelaRemuneraodeLeito1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure Sobra1Click(Sender: TObject);
    procedure ControledeUPL1Click(Sender: TObject);
    procedure CadastroIncentivos1Click(Sender: TObject);
    procedure abelaRemuneraodeLeito1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuSuino: TFMenuSuino;

implementation

uses USuinoDespesaCad, UTela_cl, USuinoSobraProduto, UControleUPL,
  UIncentivo_Cad, URemuneracaoLeitao_Cad;

{$R *.dfm}

procedure TFMenuSuino.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'SUINO';
end;

procedure TFMenuSuino.Despesas1Click(Sender: TObject);
begin
  inherited;
  if FSuinoDespesaCad = nil then
    FSuinoDespesaCad := TFSuinoDespesaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSuinoDespesaCad.Caption, FSuinoDespesaCad.Name);
  FSuinoDespesaCad.ShowModal;
end;

procedure TFMenuSuino.Sobra1Click(Sender: TObject);
begin
  inherited;
  if FSuinoSobraProduto = nil then
    FSuinoSobraProduto := TFSuinoSobraProduto.Create(Application);
  DMTela.VerificaTela(pModulo, FSuinoSobraProduto.Caption, FSuinoSobraProduto.Name);
  FSuinoSobraProduto.ShowModal;
end;

procedure TFMenuSuino.ControledeUPL1Click(Sender: TObject);
begin
  inherited;
  if FControleUPL = nil then
    FControleUPL := TFControleUPL.Create(Application);
  DMTela.VerificaTela(pModulo, FControleUPL.Caption, FControleUPL.Name);
  FControleUPL.ShowModal;

end;

procedure TFMenuSuino.CadastroIncentivos1Click(Sender: TObject);
begin
  inherited;
  if FIncentivo_Cad = nil then
    FIncentivo_Cad := TFIncentivo_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FIncentivo_Cad.Caption, FIncentivo_Cad.Name);
  FIncentivo_Cad.ShowModal;

end;

procedure TFMenuSuino.abelaRemuneraodeLeito1Click(Sender: TObject);
begin
  inherited;
  if FRemuneracaoLeitao_Cad = nil then
    FRemuneracaoLeitao_Cad := TFRemuneracaoLeitao_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FRemuneracaoLeitao_Cad.Caption, FRemuneracaoLeitao_Cad.Name);
  FRemuneracaoLeitao_Cad.ShowModal;

end;

end.
