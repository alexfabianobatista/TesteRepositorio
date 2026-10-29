unit UMenuManutencao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuManutencao = class(TFTMenuPrincipal)
    Arquivo1: TMenuItem;
    Equipamento1: TMenuItem;
    TipoEquipamento1: TMenuItem;
    FichaTcnica1: TMenuItem;
    Funcionrio1: TMenuItem;
    CategoriaProfissional1: TMenuItem;
    Atividades1: TMenuItem;
    Procedimento1: TMenuItem;
    TipoServio1: TMenuItem;
    OrdemdeServio1: TMenuItem;
    RequisioPea1: TMenuItem;
    Prioridade1: TMenuItem;
    N1: TMenuItem;
    Ferramentas1: TMenuItem;
    Periodicidade1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Equipamento1Click(Sender: TObject);
    procedure TipoEquipamento1Click(Sender: TObject);
    procedure FichaTcnica1Click(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure CategoriaProfissional1Click(Sender: TObject);
    procedure Atividades1Click(Sender: TObject);
    procedure Procedimento1Click(Sender: TObject);
    procedure TipoServio1Click(Sender: TObject);
    procedure OrdemdeServio1Click(Sender: TObject);
    procedure RequisioPea1Click(Sender: TObject);
    procedure Prioridade1Click(Sender: TObject);
    procedure Ferramentas1Click(Sender: TObject);
    procedure Periodicidade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuManutencao: TFMenuManutencao;

implementation

uses UEquipamentoCad, UTela_cl, UTipoEquipamentoCad,
  UTipoEquipamentoCarac_Cad, UFuncionarioCad, UCategoriaCad, U_AtividadeCad,
  UProcedimentoCad, U_TipoServicoCad, UOSManutencaoCad, URequisicaoPecaCad,
  UPrioridadeCad, UFerramentaCad, UPeriodicidadeCad;

{$R *.DFM}

procedure TFMenuManutencao.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='MANUTENCAO';
end;

procedure TFMenuManutencao.Equipamento1Click(Sender: TObject);
begin
  inherited;
  If FEquipamentoCad = Nil then
    FEquipamentoCad := TFEquipamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FEquipamentoCad.Caption,FEquipamentoCad.Name);
  FEquipamentoCad.ShowModal;
end;

procedure TFMenuManutencao.TipoEquipamento1Click(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCad=Nil then
    FTipoEquipamentoCad:=TFTipoEquipamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoEquipamentoCad.Caption,FTipoEquipamentoCad.Name);
  FTipoEquipamentoCad.ShowModal;
end;

procedure TFMenuManutencao.FichaTcnica1Click(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCarac_Cad=Nil then
    FTipoEquipamentoCarac_Cad:=TFTipoEquipamentoCarac_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoEquipamentoCarac_Cad.Caption,FTipoEquipamentoCarac_Cad.Name);
  FTipoEquipamentoCarac_Cad.ShowModal;

end;

procedure TFMenuManutencao.Funcionrio1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCad=Nil then
    FFuncionarioCad:=TFFuncionarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncionarioCad.Caption,FFuncionarioCad.Name);
  FFuncionarioCad.ShowModal;

end;

procedure TFMenuManutencao.CategoriaProfissional1Click(Sender: TObject);
begin
  inherited;
  If FCategoriaCad=Nil then
    FCategoriaCad:=TFCategoriaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCategoriaCad.Caption,FCategoriaCad.Name);
  FCategoriaCad.ShowModal;
end;

procedure TFMenuManutencao.Atividades1Click(Sender: TObject);
begin
  inherited;
  If FAtividadeCad=Nil then
    FAtividadeCad:=TFAtividadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FAtividadeCad.Caption,FAtividadeCad.Name);
  FAtividadeCad.ShowModal;
end;

procedure TFMenuManutencao.Procedimento1Click(Sender: TObject);
begin
  inherited;
  If FProcedimentoCad=Nil then
    FProcedimentoCad:=TFProcedimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProcedimentoCad.Caption,FProcedimentoCad.Name);
  FProcedimentoCad.ShowModal;
end;

procedure TFMenuManutencao.TipoServio1Click(Sender: TObject);
begin
  inherited;
  If FTipoServicoCad=Nil then
    FTipoServicoCad:=TFTipoServicoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoServicoCad.Caption,FTipoServicoCad.Name);
  FTipoServicoCad.ShowModal;
end;

procedure TFMenuManutencao.OrdemdeServio1Click(Sender: TObject);
begin
  inherited;
  If FOSManutencaoCad=Nil then
    FOSManutencaoCad:=TFOSManutencaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOSManutencaoCad.Caption,FOSManutencaoCad.Name);
  FOSManutencaoCad.ShowModal;
end;

procedure TFMenuManutencao.RequisioPea1Click(Sender: TObject);
begin
  inherited;
  If FRequisicaoPecaCad=Nil then
    FRequisicaoPecaCad:=TFRequisicaoPecaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRequisicaoPecaCad.Caption,FRequisicaoPecaCad.Name);
  FRequisicaoPecaCad.ShowModal;
end;

procedure TFMenuManutencao.Prioridade1Click(Sender: TObject);
begin
  inherited;
  If FPrioridadeCad=Nil then
    FPrioridadeCad:=TFPrioridadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPrioridadeCad.Caption,FPrioridadeCad.Name);
  FPrioridadeCad.ShowModal;
end;

procedure TFMenuManutencao.Ferramentas1Click(Sender: TObject);
begin
  inherited;
  If FFerramentaCad=Nil then
    FFerramentaCad:=TFFerramentaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFerramentaCad.Caption,FFerramentaCad.Name);
  FFerramentaCad.ShowModal;
end;

procedure TFMenuManutencao.Periodicidade1Click(Sender: TObject);
begin
  inherited;
  If FPeriodicidadeCad=Nil then
    FPeriodicidadeCad:=TFPeriodicidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPeriodicidadeCad.Caption,FPeriodicidadeCad.Name);
  FPeriodicidadeCad.ShowModal;
end;

end.
