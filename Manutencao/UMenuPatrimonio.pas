unit UMenuPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuPatrimonio = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastroPatrimnio1: TMenuItem;
    CadastroTipoEquipamento1: TMenuItem;
    CadastroCaractersticasEquipamento1: TMenuItem;
    CategoriaProfissional1: TMenuItem;
    CadastroFuncionrios1: TMenuItem;
    CadastroPrioridades1: TMenuItem;
    TiposdeServio1: TMenuItem;
    CadastroAtividade1: TMenuItem;
    CadastroProcedimento1: TMenuItem;
    CadastroOrdemServio1: TMenuItem;
    ApontamentoModeObra1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroPatrimnio1Click(Sender: TObject);
    procedure CadastroTipoEquipamento1Click(Sender: TObject);
    procedure CadastroCaractersticasEquipamento1Click(Sender: TObject);
    procedure CategoriaProfissional1Click(Sender: TObject);
    procedure CadastroFuncionrios1Click(Sender: TObject);
    procedure CadastroPrioridades1Click(Sender: TObject);
    procedure TiposdeServio1Click(Sender: TObject);
    procedure CadastroAtividade1Click(Sender: TObject);
    procedure CadastroProcedimento1Click(Sender: TObject);
    procedure CadastroOrdemServio1Click(Sender: TObject);
    procedure ApontamentoModeObra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPatrimonio: TFMenuPatrimonio;

implementation

uses UPatrimonioCad, UTela_cl, UTipoEquipamentoCad,
  UTipoEquipamentoCarac_Cad, UCategoriaCad, UFuncionarioCad, UPrioridadeCad,
  U_TipoServicoCad, U_AtividadeCad, UProcedimentoCad, UOSPatrimonio,
  UOSPatrimonio_cl, UApontamentoCad;

{$R *.DFM}

procedure TFMenuPatrimonio.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='PATRIMONIO';
end;

procedure TFMenuPatrimonio.CadastroPatrimnio1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonioCad=Nil then
    FPatrimonioCad:=TFPatrimonioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPatrimonioCad.Caption,FPatrimonioCad.Name);
  FPatrimonioCad.ShowModal;

end;

procedure TFMenuPatrimonio.CadastroTipoEquipamento1Click(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCad=Nil then
    FTipoEquipamentoCad:=TFTipoEquipamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoEquipamentoCad.Caption,FTipoEquipamentoCad.Name);
  FTipoEquipamentoCad.ShowModal;

end;

procedure TFMenuPatrimonio.CadastroCaractersticasEquipamento1Click(
  Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCarac_Cad=Nil then
    FTipoEquipamentoCarac_Cad:=TFTipoEquipamentoCarac_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoEquipamentoCarac_Cad.Caption,FTipoEquipamentoCarac_Cad.Name);
  FTipoEquipamentoCarac_Cad.ShowModal;

end;

procedure TFMenuPatrimonio.CategoriaProfissional1Click(Sender: TObject);
begin
  inherited;
  If FCategoriaCad=Nil then
    FCategoriaCad:=TFCategoriaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCategoriaCad.Caption,FCategoriaCad.Name);
  FCategoriaCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastroFuncionrios1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCad=Nil then
    FFuncionarioCad:=TFFuncionarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncionarioCad.Caption,FFuncionarioCad.Name);
  FFuncionarioCad.ShowModal;

end;

procedure TFMenuPatrimonio.CadastroPrioridades1Click(Sender: TObject);
begin
  inherited;
  If FPrioridadeCad=Nil then
    FPrioridadeCad:=TFPrioridadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPrioridadeCad.Caption,FPrioridadeCad.Name);
  FPrioridadeCad.ShowModal;
end;

procedure TFMenuPatrimonio.TiposdeServio1Click(Sender: TObject);
begin
  inherited;
  If FTipoServicoCad=Nil then
    FTipoServicoCad:=TFTipoServicoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoServicoCad.Caption,FTipoServicoCad.Name);
  FTipoServicoCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastroAtividade1Click(Sender: TObject);
begin
  inherited;
  If FAtividadeCad=Nil then
    FAtividadeCad:=TFAtividadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FAtividadeCad.Caption,FAtividadeCad.Name);
  FAtividadeCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastroProcedimento1Click(Sender: TObject);
begin
  inherited;
  If FProcedimentoCad=Nil then
     FProcedimentoCad:=TFProcedimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProcedimentoCad.Caption,FProcedimentoCad.Name);
  FProcedimentoCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastroOrdemServio1Click(Sender: TObject);
begin
  inherited;
  If FOSPatrimonio=Nil then
     FOSPatrimonio:=TFOSPatrimonio.Create(Application);
  DMTela.VerificaTela(pModulo,FOSPatrimonio.Caption,FOSPatrimonio.Name);
  FOSPatrimonio.ShowModal;
end;

procedure TFMenuPatrimonio.ApontamentoModeObra1Click(Sender: TObject);
begin
  inherited;
   If FApontamentoCad=Nil then
     FApontamentoCad:=TFApontamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FApontamentoCad.Caption,FApontamentoCad.Name);
  FApontamentoCad.ShowModal;
end;

end.
