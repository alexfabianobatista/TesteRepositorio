unit UMenuMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, Buttons, ExtCtrls;

type
  TFMenuMedico = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Cadastros1: TMenuItem;
    CadastroBaseClculoIRF1: TMenuItem;
    CadastroConvnio1: TMenuItem;
    CadastrodeLanamentoparaRepasse1: TMenuItem;
    RequisiodeTransfuso1: TMenuItem;
    CadastroPacientes1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cadastros1Click(Sender: TObject);
    procedure CadastroConvnio1Click(Sender: TObject);
    procedure CadastroBaseClculoIRF1Click(Sender: TObject);
    procedure CadastrodeLanamentoparaRepasse1Click(Sender: TObject);
    procedure RequisiodeTransfuso1Click(Sender: TObject);
    procedure CadastroPacientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuMedico: TFMenuMedico;

implementation

uses UMedicoCad, UTela_cl, UConvenioCad, UIRFCad, ULancamentoCad,
  URequisicaoTransfusaoCad, UCadastroCad;

{$R *.dfm}

procedure TFMenuMedico.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuMedico.pModulo := 'MEDICO';
end;

procedure TFMenuMedico.Cadastros1Click(Sender: TObject);
begin
  inherited;
  if FMedicoCad = Nil then
    FMedicoCad := TFMedicoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMedicoCad.Caption,FMedicoCad.Name);
  FMedicoCad.ShowModal;
end;

procedure TFMenuMedico.CadastroConvnio1Click(Sender: TObject);
begin
  inherited;
  if FConvenioCad = Nil then
    FConvenioCad := TFConvenioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FConvenioCad.Caption,FConvenioCad.Name);
  FConvenioCad.ShowModal;
end;

procedure TFMenuMedico.CadastroBaseClculoIRF1Click(Sender: TObject);
begin
  inherited;
  if FBaseCalcIRFCad = Nil then
    FBaseCalcIRFCad := TFBaseCalcIRFCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBaseCalcIRFCad.Caption,FBaseCalcIRFCad.Name);
  FBaseCalcIRFCad.ShowModal;
end;

procedure TFMenuMedico.CadastrodeLanamentoparaRepasse1Click(
  Sender: TObject);
begin
  inherited;
  if FLancamentoCad = Nil then
    FLancamentoCad := TFLancamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLancamentoCad.Caption,FLancamentoCad.Name);
  FLancamentoCad.ShowModal;
end;

procedure TFMenuMedico.RequisiodeTransfuso1Click(Sender: TObject);
begin
  inherited;
  if FRequisicaoTransfusaoCad = Nil then
    FRequisicaoTransfusaoCad := TFRequisicaoTransfusaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRequisicaoTransfusaoCad.Caption,FRequisicaoTransfusaoCad.Name);
  FRequisicaoTransfusaoCad.ShowModal;
end;

procedure TFMenuMedico.CadastroPacientes1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCad = Nil then
    FCadastroCad := TFCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCadastroCad.Caption,FCadastroCad.Name);
  FCadastroCad.ShowModal;

end;

end.
