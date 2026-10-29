unit UMenuOperacaoCambio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuOperacaoCambio = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    ContratodeCmbioACC1: TMenuItem;
    ContratodeCmbioTrava1: TMenuItem;
    ContratodeCmbioPronto1: TMenuItem;
    LimitedeBancos1: TMenuItem;
    EGF1: TMenuItem;
    ContratodeCambioSwap1: TMenuItem;
    OperaodeCmbioEmprstimo1: TMenuItem;
    AplicaoFinanceira1: TMenuItem;
    PremioExportao1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ContratodeCmbioACC1Click(Sender: TObject);
    procedure ContratodeCmbioTrava1Click(Sender: TObject);
    procedure ContratodeCmbioPronto1Click(Sender: TObject);
    procedure LimitedeBancos1Click(Sender: TObject);
    procedure EGF1Click(Sender: TObject);
    procedure ContratodeCambioSwap1Click(Sender: TObject);
    procedure OperaodeCmbioEmprstimo1Click(Sender: TObject);
    procedure AplicaoFinanceira1Click(Sender: TObject);
    procedure PremioExportao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuOperacaoCambio: TFMenuOperacaoCambio;

implementation

uses UOperacaoCambioACCCad, UTela_cl, UOperacaoCambioPRTCad,
  UOperacaoCambioTRVCad, ULimiteBancoCad, UEGFCad, UOperacaoCambioSWPCad,
  UOperacaoCambioEPTCad, UAplicacaoFinanceiraCad, UPremioExportacao;

{$R *.DFM}

procedure TFMenuOperacaoCambio.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='OPERACOES_CAMBIO';
end;

procedure TFMenuOperacaoCambio.ContratodeCmbioACC1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioACCCad = nil then
    FOperacaoCambioACCCad := TFOperacaoCambioACCCad.create(application);
  DMTela.VerificaTela(pModulo,FOperacaoCambioACCCad.Caption,FOperacaoCambioACCCad.Name);
  FOperacaoCambioACCCad.showmodal;
end;

procedure TFMenuOperacaoCambio.ContratodeCmbioTrava1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioTRVCad = nil then
    FOperacaoCambioTRVCad := TFOperacaoCambioTRVCad.create(application);
  DMTela.VerificaTela(pModulo,FOperacaoCambioTRVCad.Caption,FOperacaoCambioTRVCad.Name);
  FOperacaoCambioTRVCad.showmodal
end;

procedure TFMenuOperacaoCambio.ContratodeCmbioPronto1Click(
  Sender: TObject);
begin
  inherited;
  if FOperacaoCambioPRTCad = nil then
    FOperacaoCambioPRTCad := TFOperacaoCambioPRTCad.create(application);
  DMTela.VerificaTela(pModulo,FOperacaoCambioPRTCad.Caption,FOperacaoCambioPRTCad.Name);
  FOperacaoCambioPRTCad.showmodal;
end;

procedure TFMenuOperacaoCambio.LimitedeBancos1Click(Sender: TObject);
begin
  inherited;
  if FLimiteBancoCad = nil then
    FLimiteBancoCad := TFLimiteBancoCad.create(application);
  DMTela.VerificaTela(pModulo,FLimiteBancoCad.Caption,FLimiteBancoCad.Name);
  FLimiteBancoCad.showmodal;
end;

procedure TFMenuOperacaoCambio.EGF1Click(Sender: TObject);
begin
  inherited;
  if FEGFCad = nil then
    FEGFCad := TFEGFCad.create(application);
  DMTela.VerificaTela(pModulo,FEGFCad.Caption,FEGFCad.Name);
  FEGFCad.showmodal;
end;

procedure TFMenuOperacaoCambio.ContratodeCambioSwap1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioSWPCad = nil then
    FOperacaoCambioSWPCad := TFOperacaoCambioSWPCad.create(application);
  DMTela.VerificaTela(pModulo,FOperacaoCambioSWPCad.Caption,FOperacaoCambioSWPCad.Name);
  FOperacaoCambioSWPCad.showmodal;
end;

procedure TFMenuOperacaoCambio.OperaodeCmbioEmprstimo1Click(
  Sender: TObject);
begin
  inherited;
  if FOperacaoCambioEPTCad = nil then
    FOperacaoCambioEPTCad := TFOperacaoCambioEPTCad.create(application);
  DMTela.VerificaTela(pModulo,FOperacaoCambioEPTCad.Caption,FOperacaoCambioEPTCad.Name);
  FOperacaoCambioEPTCad.showmodal;
end;

procedure TFMenuOperacaoCambio.AplicaoFinanceira1Click(Sender: TObject);
begin
  inherited;
  if FAplicacaoFinanceiraCad = Nil then
    FAplicacaoFinanceiraCad := TFAplicacaoFinanceiraCad.create(Application);
  DMTela.VerificaTela(pModulo,FAplicacaoFinanceiraCad.Caption,FAplicacaoFinanceiraCad.Name);
  FAplicacaoFinanceiraCad.showmodal;  
end;

procedure TFMenuOperacaoCambio.PremioExportao1Click(Sender: TObject);
begin
  inherited;
  if FPremioExportacao = Nil then
    FPremioExportacao := TFPremioExportacao.Create(Application);
  DMTela.VerificaTela(pModulo,FPremioExportacao.Caption,FPremioExportacao.Name);
  FPremioExportacao.ShowModal();
end;

end.
