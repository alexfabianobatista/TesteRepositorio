unit UMenuContasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons;
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
    procedure Histrico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Banco1Click(Sender: TObject);
    procedure Finalidade1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Contabiliza1Click(Sender: TObject);
    procedure PrazodeVencimento1Click(Sender: TObject);
    procedure ConsultaPosioCliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuContasReceber: TFMenuContasReceber;

implementation

uses UHistoricoCad, UTela_cl, UBancoscad, UFinalidadeCad, UContasReceberCad,
  UContabiliza_CR, UPrazoVencimentoCad, UContasReceberPosicao;

{$R *.DFM}

procedure TFMenuContasReceber.Histrico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCad=Nil then
    FHistoricoCad:=TFHistoricoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistoricoCad.Caption,FHistoricoCad.Name);
  FHistoricoCad.ShowModal;
end;

procedure TFMenuContasReceber.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuContasReceber.pModulo:='CONTAS A RECEBER';
end;

procedure TFMenuContasReceber.Banco1Click(Sender: TObject);
begin
  inherited;
  If FBancosCad=Nil then
    FBancosCad:=TFBancosCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosCad.Caption,FBancosCad.Name);
  FBancosCad.ShowModal;
end;

procedure TFMenuContasReceber.Finalidade1Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCad=Nil then
    FFinalidadeCad:=TFFinalidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFinalidadeCad.Caption,FFinalidadeCad.Name);
  FFinalidadeCad.ShowModal;
end;

procedure TFMenuContasReceber.ContasaReceber1Click(Sender: TObject);
begin
  inherited;
  If FContasReceberCad = Nil then
    FContasReceberCad := TFContasReceberCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContasReceberCad.Caption,FContasReceberCad.Name);
  FContasReceberCad.ShowModal;
end;

procedure TFMenuContasReceber.Contabiliza1Click(Sender: TObject);
begin
  inherited;
  If FContabiliza_CR=Nil then
    FContabiliza_CR:=TFContabiliza_CR.Create(Application);
  DMTela.VerificaTela(pModulo,FContabiliza_CR.Caption,FContabiliza_CR.Name);
  FContabiliza_CR.ShowModal;
end;

procedure TFMenuContasReceber.PrazodeVencimento1Click(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCad = Nil then
    FPrazoVencimentoCad:=TFPrazoVencimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPrazoVencimentoCad.Caption,FPrazoVencimentoCad.Name);
  FPrazoVencimentoCad.ShowModal;

end;

procedure TFMenuContasReceber.ConsultaPosioCliente1Click(Sender: TObject);
begin
  inherited;
  If FContasReceberPosicao=Nil then
    FContasReceberPosicao:=TFContasReceberPosicao.Create(Application);
  DMTela.VerificaTela(pModulo,FContasReceberPosicao.Caption,FContasReceberPosicao.Name);
  FContasReceberPosicao.ShowModal;

end;

end.
