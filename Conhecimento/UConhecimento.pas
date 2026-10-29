unit UConhecimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFConhecimento = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastrodeVeculos1: TMenuItem;
    CadastroPropriete1: TMenuItem;
    CadastroConhecimento1: TMenuItem;
    CadastroRPA1: TMenuItem;
    CadastroBaseClculoIRF1: TMenuItem;
    CadastroOrdemdeCarregamento1: TMenuItem;
    CadastroControledeFretes1: TMenuItem;
    CadastroEstadia1: TMenuItem;
    CadastroControledeCarga1: TMenuItem;
    CadastroValorEfeitoSeguro1: TMenuItem;
    CadastroClassificaodeProduto1: TMenuItem;
    CadastroControleTrem1: TMenuItem;
    CadastroConhecimentoTransportadora1: TMenuItem;
    DeclaraodeTrnsitoAduaneiroMICDTA1: TMenuItem;
    ConhecimentodeTransporteEletrnicoCTe1: TMenuItem;
    ManifestodeDocumentosFiscaisEletrnico1: TMenuItem;
    ControledeEntrega1: TMenuItem;
    ConhecimentodeTransporteEletrnicoOutrosServios1: TMenuItem;
    Viagem1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeVeculos1Click(Sender: TObject);
    procedure CadastroPropriete1Click(Sender: TObject);
    procedure CadastroConhecimento1Click(Sender: TObject);
    procedure CadastroRPA1Click(Sender: TObject);
    procedure CadastroBaseClculoIRF1Click(Sender: TObject);
    procedure CadastroOrdemdeCarregamento1Click(Sender: TObject);
    procedure CadastroControledeFretes1Click(Sender: TObject);
    procedure CadastroEstadia1Click(Sender: TObject);
    procedure CadastroControledeCarga1Click(Sender: TObject);
    procedure CadastroValorEfeitoSeguro1Click(Sender: TObject);
    procedure CadastroClassificaodeProduto1Click(Sender: TObject);
    procedure CadastroControleTrem1Click(Sender: TObject);
    procedure CadastroConhecimentoTransportadora1Click(Sender: TObject);
    procedure ControledeViagem1Click(Sender: TObject);
    procedure DeclaraodeTrnsitoAduaneiroMICDTA1Click(Sender: TObject);
    procedure ConhecimentodeTransporteEletrnicoCTe1Click(Sender: TObject);
    procedure ManifestodeDocumentosFiscaisEletrnico1Click(Sender: TObject);
    procedure ControledeEntrega1Click(Sender: TObject);
    procedure ConhecimentodeTransporteEletrnicoOutrosServios1Click(
      Sender: TObject);
    procedure Viagem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimento: TFConhecimento;

implementation

uses UVeiculoCad, UTela_cl, UProprietarioCad, UMotoristaCad,
  UConhecimentoCad, URPACad, UIRFCad, UOrdemCarregamentoCad,
  UConhecimentoFreteCad, UEstadiaCad, UControleCargaCad,
  UValorEfeitoSeguroCad, UNotaClassificacaoCad, UControleTremCad,
  UConhecimentoCad2, UControleViagemCad, UConhecimentoAduaneiro,
  UMdfeCad, UControleEntregaCad, UCteCad, UCteOSCad, UViagemCad;

{$R *.DFM}

procedure TFConhecimento.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:= 'CONHECIMENTO';
end;

procedure TFConhecimento.CadastrodeVeculos1Click(Sender: TObject);
begin
  inherited;
  If FVeiculoCad = Nil then
    FVeiculoCad := TFVeiculoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeiculoCad.Caption,FVeiculoCad.Name);
  FVeiculoCad.ShowModal;
end;

procedure TFConhecimento.CadastroPropriete1Click(Sender: TObject);
begin
  inherited;
  If FProprietarioCad = Nil then
    FProprietarioCad := TFProprietarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProprietarioCad.Caption,FProprietarioCad.Name);
  FProprietarioCad.ShowModal;
end;

procedure TFConhecimento.CadastroConhecimento1Click(Sender: TObject);
begin
  inherited;
  If FConhecimentoCad = Nil then
     FConhecimentoCad := TFConhecimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FConhecimentoCad.Caption,FConhecimentoCad.Name);
  FConhecimentoCad.ShowModal;
end;

procedure TFConhecimento.CadastroRPA1Click(Sender: TObject);
begin
  inherited;
  If FRPACad = Nil then
     FRPACad := TFRPACad.Create(Application);
  DMTela.VerificaTela(pModulo,FRPACad.Caption,FRPACad.Name);
  FRPACad.ShowModal;
end;

procedure TFConhecimento.CadastroBaseClculoIRF1Click(Sender: TObject);
begin
  inherited;
  If FBaseCalcIRFCad = Nil then
     FBaseCalcIRFCad := TFBaseCalcIRFCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBaseCalcIRFCad.Caption,FBaseCalcIRFCad.Name);
  FBaseCalcIRFCad.ShowModal;
end;

procedure TFConhecimento.CadastroOrdemdeCarregamento1Click(
  Sender: TObject);
begin
  inherited;
  If FOrdemCarregamentoCad = Nil then
     FOrdemCarregamentoCad := TFOrdemCarregamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOrdemCarregamentoCad.Caption,FOrdemCarregamentoCad.Name);
  FOrdemCarregamentoCad.ShowModal;
end;

procedure TFConhecimento.CadastroControledeFretes1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoFreteCad = nil then
     FConhecimentoFreteCad := TFConhecimentoFreteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FConhecimentoFreteCad.Caption,FConhecimentoFreteCad.Name);
  FConhecimentoFreteCad.ShowModal;
end;

procedure TFConhecimento.CadastroEstadia1Click(Sender: TObject);
begin
  inherited;
  if FEstadiaCad = nil then
     FEstadiaCad := TFEstadiaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FEstadiaCad.Caption,FEstadiaCad.Name);
  FEstadiaCad.ShowModal;
end;

procedure TFConhecimento.CadastroControledeCarga1Click(Sender: TObject);
begin
  inherited;
  if FControleCargaCad = nil then
     FControleCargaCad := TFControleCargaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FControleCargaCad.Caption,FControleCargaCad.Name);
  FControleCargaCad.ShowModal;
end;

procedure TFConhecimento.CadastroValorEfeitoSeguro1Click(Sender: TObject);
begin
  inherited;
  if FValorEfeitoSeguroCad = nil then
     FValorEfeitoSeguroCad := TFValorEfeitoSeguroCad.create(application);

  DMTela.VerificaTela(pModulo,FValorEfeitoSeguroCad.Caption,FValorEfeitoSeguroCad.Name);
  FValorEfeitoSeguroCad.showmodal;
end;

procedure TFConhecimento.CadastroClassificaodeProduto1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaClassificacaoCad = nil then
     FNotaClassificacaoCad := TFNotaClassificacaoCad.create(application);

  DMTela.VerificaTela(pModulo,FNotaClassificacaoCad.Caption,FNotaClassificacaoCad.Name);
  FNotaClassificacaoCad.showmodal;
end;

procedure TFConhecimento.CadastroControleTrem1Click(Sender: TObject);
begin
  inherited;
  if FControleTremCad = Nil then
    FControleTremCad := TFControleTremCad.Create(Application);
  DMTela.VerificaTela(pModulo,FControleTremCad.Caption,FControleTremCad.Name);
  FControleTremCad.ShowModal;
end;

procedure TFConhecimento.CadastroConhecimentoTransportadora1Click(
  Sender: TObject);
begin
  inherited;
  If FConhecimentoCad2 = Nil then
    FConhecimentoCad2 := TFConhecimentoCad2.Create(Application);
  DMTela.VerificaTela(pModulo,FConhecimentoCad2.Caption,FConhecimentoCad2.Name);
  FConhecimentoCad2.ShowModal;
end;

procedure TFConhecimento.ControledeViagem1Click(Sender: TObject);
begin
  inherited;
  if FControleViagemCad = Nil then
    FControleViagemCad := TFControleViagemCad.Create(Application);
  DMTela.VerificaTela(pModulo,FControleViagemCad.Caption,FControleViagemCad.Name);
  FControleViagemCad.ShowModal;
end;

procedure TFConhecimento.DeclaraodeTrnsitoAduaneiroMICDTA1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoAduaneiro = Nil then
    FConhecimentoAduaneiro := TFConhecimentoAduaneiro.Create(Application);
  DMTela.VerificaTela(pModulo,FConhecimentoAduaneiro.Caption, FConhecimentoAduaneiro.Name);
  FConhecimentoAduaneiro.ShowModal;
end;

procedure TFConhecimento.ConhecimentodeTransporteEletrnicoCTe1Click(
  Sender: TObject);
begin
  inherited;
  if FCteCad = Nil then
    FCteCad := TFCteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCteCad.Caption, FCteCad.Name);
  FCteCad.ShowModal;
end;

procedure TFConhecimento.ManifestodeDocumentosFiscaisEletrnico1Click(
  Sender: TObject);
begin
  inherited;
  if FMdfeCad = Nil then
    FMdfeCad := TFMdfeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMdfeCad.Caption, FMdfeCad.Name);
  FMdfeCad.ShowModal;
end;

procedure TFConhecimento.ControledeEntrega1Click(Sender: TObject);
begin
  inherited;
  if FControleEntregaCad = Nil then
    FControleEntregaCad := TFControleEntregaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FControleEntregaCad.Caption, FControleEntregaCad.Name);
  FControleEntregaCad.ShowModal;
end;

procedure TFConhecimento.ConhecimentodeTransporteEletrnicoOutrosServios1Click(
  Sender: TObject);
begin
  inherited;
  if FCteOSCad = Nil then
    FCteOSCad := TFCteOSCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCteOSCad.Caption, FCteOSCad.Name);
  FCteOSCad.ShowModal;
end;

procedure TFConhecimento.Viagem1Click(Sender: TObject);
begin
  inherited;
  if FViagemCad = Nil then
    FViagemCad := TFViagemCad.Create(Application);
  DMTela.VerificaTela(pModulo,FViagemCad.Caption, FViagemCad.Name);
  FViagemCad.ShowModal;
end;

end.
