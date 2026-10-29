unit UMenuContasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;
type
  TFMenuContasReceber = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Banco1: TMenuItem;
    Finalidade1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Histrico1: TMenuItem;
    Contabiliza1: TMenuItem;
    PrazodeVencimento1: TMenuItem;
    ConsultaPosioCliente1: TMenuItem;
    FormadeRecebimento1: TMenuItem;
    Border1: TMenuItem;
    procedure Histrico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Finalidade1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Contabiliza1Click(Sender: TObject);
    procedure PrazodeVencimento1Click(Sender: TObject);
    procedure ConsultaPosioCliente1Click(Sender: TObject);
    procedure FormadeRecebimento1Click(Sender: TObject);
    procedure Border1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuContasReceber: TFMenuContasReceber;

implementation

uses UHistoricoCad, UTela_cl, UBancoscad, UFinalidadeCad, UContasReceberCad,
  UContabiliza_CR, UPrazoVencimentoCad, UContasReceberPosicao,
  UFormaRecebimentoCad, DelRun, UBorderoCad;

{$R *.DFM}

procedure TFMenuContasReceber.Histrico1Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCad = nil then
    FHistoricoCad := TFHistoricoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FHistoricoCad.Caption, FHistoricoCad.Name);
  FHistoricoCad.ShowModal;
end;

procedure TFMenuContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuContasReceber.pModulo := 'CONTAS A RECEBER';
end;

procedure TFMenuContasReceber.Banco1Click(Sender: TObject);
begin
  inherited;
  if FBancosCad = nil then
    FBancosCad := TFBancosCad.Create(Application);
  DMTela.VerificaTela(pModulo, FBancosCad.Caption, FBancosCad.Name);
  FBancosCad.ShowModal;
end;

procedure TFMenuContasReceber.Finalidade1Click(Sender: TObject);
begin
  inherited;
  if FFinalidadeCad = nil then
    FFinalidadeCad := TFFinalidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo, FFinalidadeCad.Caption, FFinalidadeCad.Name);
  FFinalidadeCad.ShowModal;
end;

procedure TFMenuContasReceber.ContasaReceber1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberCad = nil then
    FContasReceberCad := TFContasReceberCad.Create(Application);
  DMTela.VerificaTela(pModulo, FContasReceberCad.Caption, FContasReceberCad.Name);
  FContasReceberCad.ShowModal;
end;

procedure TFMenuContasReceber.Contabiliza1Click(Sender: TObject);
begin
  inherited;
  if FContabiliza_CR = nil then
    FContabiliza_CR := TFContabiliza_CR.Create(Application);
  DMTela.VerificaTela(pModulo, FContabiliza_CR.Caption, FContabiliza_CR.Name);
  FContabiliza_CR.ShowModal;
end;

procedure TFMenuContasReceber.PrazodeVencimento1Click(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCad = nil then
    FPrazoVencimentoCad := TFPrazoVencimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPrazoVencimentoCad.Caption, FPrazoVencimentoCad.Name);
  FPrazoVencimentoCad.ShowModal;

end;

procedure TFMenuContasReceber.ConsultaPosioCliente1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberPosicao = nil then
    FContasReceberPosicao := TFContasReceberPosicao.Create(Application);
  DMTela.VerificaTela(pModulo, FContasReceberPosicao.Caption, FContasReceberPosicao.Name);
  FContasReceberPosicao.ShowModal;

end;

procedure TFMenuContasReceber.FormadeRecebimento1Click(Sender: TObject);
begin
  inherited;
  if FFormaRecebimentoCad = nil then
    FFormaRecebimentoCad := TFFormaRecebimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FFormaRecebimentoCad.Caption, FFormaRecebimentoCad.Name);
  FFormaRecebimentoCad.ShowModal;
end;

procedure TFMenuContasReceber.Border1Click(Sender: TObject);
begin
  inherited;
  if FBorderoCad = Nil then
    FBorderoCad := TFBorderoCad.Create(Application);
  FBorderoCad.ShowModal;
end;

end.
