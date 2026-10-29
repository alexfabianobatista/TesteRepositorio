unit UMenuContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuContabil = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Historico: TMenuItem;
    PlanodeContas1: TMenuItem;
    Lanamentos1: TMenuItem;
    ImplantaodeSaldo1: TMenuItem;
    DRE1: TMenuItem;
    PlanilhaLanamento1: TMenuItem;
    PlanilhaLanamentoMtodoSimples1: TMenuItem;
    AcertoContrapartida1: TMenuItem;
    IndiceDesempenho1: TMenuItem;
    DespesaAntecipada1: TMenuItem;
    N1: TMenuItem;
    ermodeAbertura1: TMenuItem;
    PlanodeContasReferencial1: TMenuItem;
    ArquivoMagneticoSinco1: TMenuItem;
    PlanoContaAntigo1: TMenuItem;
    NotaExplicativaPBalano1: TMenuItem;
    ComposiodeCustos1: TMenuItem;
    ExportarLanamentosContbeis1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure HistoricoClick(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure ImplantaodeSaldo1Click(Sender: TObject);
    procedure DRE1Click(Sender: TObject);
    procedure PlanilhaLanamento1Click(Sender: TObject);
    procedure PlanilhaLanamentoMtodoSimples1Click(Sender: TObject);
    procedure AcertoContrapartida1Click(Sender: TObject);
    procedure IndiceDesempenho1Click(Sender: TObject);
    procedure DespesaAntecipada1Click(Sender: TObject);
    procedure ermodeAbertura1Click(Sender: TObject);
    procedure PlanodeContasReferencial1Click(Sender: TObject);
    procedure ArquivoMagneticoSinco1Click(Sender: TObject);
    procedure PlanoContaAntigo1Click(Sender: TObject);
    procedure NotaExplicativaPBalano1Click(Sender: TObject);
    procedure ComposiodeCustos1Click(Sender: TObject);
    procedure ExportarLanamentosContbeis1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuContabil: TFMenuContabil;

implementation

uses UHistContabilCad, UTela_cl, UPlanoContaCad, ULanctoContabilCad,
  USaldoContabilCad, UDRECad, ULanctoContabilCad1, ULanctoContabilSimples,
  UContabilAcerto, UIndiceDesempenhoCad, UDespesaAntecipadaCad,
  UTermoAberturaCad, UPlanoContaReferencialCad, UArquivoSinco,
  UPlanoContaAntigoCad, UNotaExplicativaCad, UComposicaoCustosCad,
  UExportaLancamentosContabeis;

{$R *.DFM}

procedure TFMenuContabil.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'CONTABIL';
end;

procedure TFMenuContabil.HistoricoClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCad = Nil then
    FHistContabilCad := TFHistContabilCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistContabilCad.Caption,FHistContabilCad.Name);
  FHistContabilCad.ShowModal;
end;

procedure TFMenuContabil.PlanodeContas1Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCad = Nil then
    FPlanoContaCad := TFPlanoContaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPlanoContaCad.Caption,FPlanoContaCad.Name);
  FPlanoContaCad.ShowModal;
end;

procedure TFMenuContabil.Lanamentos1Click(Sender: TObject);
begin
  inherited;
  If FLanctoContabilCad = Nil then
    FLanctoContabilCad := TFLanctoContabilCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLanctoContabilCad.Caption,FLanctoContabilCad.Name);
  FLanctoContabilCad.ShowModal;
end;

procedure TFMenuContabil.ImplantaodeSaldo1Click(Sender: TObject);
begin
  inherited;
  If FSaldoContabilCad = Nil then
    FSaldoContabilCad := TFSaldoContabilCad.Create(Application);
  DMTela.VerificaTela(pModulo,FSaldoContabilCad.Caption,FSaldoContabilCad.Name);
  FSaldoContabilCad.ShowModal;
end;

procedure TFMenuContabil.DRE1Click(Sender: TObject);
begin
  inherited;
  If FDRECad = Nil then
    FDRECad := TFDRECad.Create(Application);
  DMTela.VerificaTela(pModulo,FDRECad.Caption,FDRECad.Name);
  FDRECad.ShowModal;
end;

procedure TFMenuContabil.PlanilhaLanamento1Click(Sender: TObject);
begin
  inherited;
  If FLanctoContabilCad1 = Nil then
    FLanctoContabilCad1 := TFLanctoContabilCad1.Create(Application);
  DMTela.VerificaTela(pModulo,FLanctoContabilCad1.Caption,FLanctoContabilCad1.Name);
  FLanctoContabilCad1.ShowModal;
end;

procedure TFMenuContabil.PlanilhaLanamentoMtodoSimples1Click(
  Sender: TObject);
begin
  inherited;
  If FLanctoContabilSimples = Nil then
    FLanctoContabilSimples := TFLanctoContabilSimples.Create(Application);
  DMTela.VerificaTela(pModulo,FLanctoContabilSimples.Caption,FLanctoContabilSimples.Name);
  FLanctoContabilSimples.ShowModal;
end;

procedure TFMenuContabil.AcertoContrapartida1Click(Sender: TObject);
begin
  inherited;
  If FContabilAcerto = Nil then
    FContabilAcerto := TFContabilAcerto.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilAcerto.Caption,FContabilAcerto.Name);
  FContabilAcerto.ShowModal;
end;

procedure TFMenuContabil.IndiceDesempenho1Click(Sender: TObject);
begin
  inherited;
  If FIndiceDesempenhoCad = Nil then
    FIndiceDesempenhoCad := TFIndiceDesempenhoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FIndiceDesempenhoCad.Caption,FIndiceDesempenhoCad.Name);
  FIndiceDesempenhoCad.ShowModal;
end;

procedure TFMenuContabil.DespesaAntecipada1Click(Sender: TObject);
begin
  inherited;
  if FDespesaAntecipadaCad = nil then
    FDespesaAntecipadaCad := TFDespesaAntecipadaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDespesaAntecipadaCad.Caption,FDespesaAntecipadaCad.Name);
  FDespesaAntecipadaCad.ShowModal;
end;

procedure TFMenuContabil.ermodeAbertura1Click(Sender: TObject);
begin
  inherited;
  if FTermoAberturaCad = nil then
    FTermoAberturaCad := TFTermoAberturaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTermoAberturaCad.Caption,FTermoAberturaCad.Name);
  FTermoAberturaCad.ShowModal;
end;

procedure TFMenuContabil.PlanodeContasReferencial1Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaReferencialCad = nil then
    FPlanoContaReferencialCad := TFPlanoContaReferencialCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPlanoContaReferencialCad.Caption,FPlanoContaReferencialCad.Name);
  FPlanoContaReferencialCad.ShowModal;
end;

procedure TFMenuContabil.ArquivoMagneticoSinco1Click(Sender: TObject);
begin
  inherited;
  If FArquivoSinco = Nil Then
     FArquivoSinco := TFArquivoSinco.Create(Application);
  DMTela.VerificaTela(pModulo,FArquivoSinco.Caption,FArquivoSinco.Name);
  FArquivoSinco.ShowModal;
end;

procedure TFMenuContabil.PlanoContaAntigo1Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaAntigoCad = Nil then
    FPlanoContaAntigoCad := TFPlanoContaAntigoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPlanoContaAntigoCad.Caption,FPlanoContaAntigoCad.Name);
  FPlanoContaAntigoCad.ShowModal;

end;

procedure TFMenuContabil.NotaExplicativaPBalano1Click(Sender: TObject);
begin
  inherited;
  if FNotaExplicativaCad = Nil then
    FNotaExplicativaCad := TFNotaExplicativaCad.Create(Application);
 // DMTela.VerificaTela(pModulo, FNotaExplicativaCad.Caption,FNotaExplicativaCad.Name);
  FNotaExplicativaCad.ShowModal;
end;

procedure TFMenuContabil.ComposiodeCustos1Click(Sender: TObject);
begin
  inherited;
    if FComposicaoCustosCad = Nil then
    FComposicaoCustosCad := TFComposicaoCustosCad.Create(Application);
 // DMTela.VerificaTela(pModulo, FNotaExplicativaCad.Caption,FNotaExplicativaCad.Name);
  FComposicaoCustosCad.ShowModal;

end;

procedure TFMenuContabil.ExportarLanamentosContbeis1Click(Sender: TObject);
begin
  inherited;
  if FExportaLancamentosContabeis = Nil then
    FExportaLancamentosContabeis := TFExportaLancamentosContabeis.Create(Application);
  FExportaLancamentosContabeis.ShowModal;
end;

end.
