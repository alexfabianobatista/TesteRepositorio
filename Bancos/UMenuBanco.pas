unit UMenuBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuBancos = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Bancos1: TMenuItem;
    MovimentoBancrio1: TMenuItem;
    ConciliaoBancria1: TMenuItem;
    Histrico1: TMenuItem;
    Saldo1: TMenuItem;
    BaixaCheques1: TMenuItem;
    Contabiliza1: TMenuItem;
    MonitorApl1: TMenuItem;
    Financiamento1: TMenuItem;
    ContaPix1: TMenuItem;
    CadastroBandeiraCarto1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MovimentoBancrio1Click(Sender: TObject);
    procedure ConciliaoBancria1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Saldo1Click(Sender: TObject);
    procedure BaixaCheques1Click(Sender: TObject);
    procedure Contabiliza1Click(Sender: TObject);
    procedure MonitorApl1Click(Sender: TObject);
    procedure Financiamento1Click(Sender: TObject);
    procedure ContaPix1Click(Sender: TObject);
    procedure CadastroBandeiraCarto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuBancos: TFMenuBancos;

implementation

uses UBancosMovCad, UTela_cl, UBancoscad, UBancoConciliaCad, UHistoricoCad,
  UBancosSaldo, UBancoBaixaCheque, UContabilizaBancos, UMonitorApl,
  UOracle_cl, UFinanciamentoCad, UBandeiraCartaoCad, UPixCad;

{$R *.DFM}

procedure TFMenuBancos.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='BANCOS';
end;

procedure TFMenuBancos.MovimentoBancrio1Click(Sender: TObject);
begin
  inherited;
  If FBancosMovCad = Nil then
     FBancosMovCad := TFBancosMovCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosMovCad.Caption,FBancosMovCad.Name);
  FBancosMovCad.ShowModal;
end;

procedure TFMenuBancos.ConciliaoBancria1Click(Sender: TObject);
begin
  inherited;
  If FBancoConciliaCad = Nil then
    FBancoConciliaCad := TFBancoConciliaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBancoConciliaCad.Caption,FBancoConciliaCad.Name);
  FBancoConciliaCad.ShowModal;
end;

procedure TFMenuBancos.Bancos1Click(Sender: TObject);
begin
  inherited;
  If FBancosCad = Nil then
    FBancosCad := TFBancosCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosCad.Caption,FBancosCad.Name);
  FBancosCad.ShowModal;
end;

procedure TFMenuBancos.Histrico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCad = Nil then
    FHistoricoCad := TFHistoricoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistoricoCad.Caption,FHistoricoCad.Name);
  FHistoricoCad.ShowModal;
end;

procedure TFMenuBancos.Saldo1Click(Sender: TObject);
begin
  inherited;
  If FBancosSaldo = Nil then
    FBancosSaldo := TFBancosSaldo.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosSaldo.Caption,FBancosSaldo.Name);
  FBancosSaldo.ShowModal;
end;

procedure TFMenuBancos.BaixaCheques1Click(Sender: TObject);
begin
  inherited;
  If FBancosBaixaCheque = Nil then
    FBancosBaixaCheque := TFBancosBaixaCheque.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosBaixaCheque.Caption,FBancosBaixaCheque.Name);
  FBancosBaixaCheque.ShowModal;  
end;

procedure TFMenuBancos.Contabiliza1Click(Sender: TObject);
begin
  inherited;
  If FContabilizaBancos = Nil then
    FContabilizaBancos := TFContabilizaBancos.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilizaBancos.Caption,FContabilizaBancos.Name);
  FContabilizaBancos.ShowModal;
end;

procedure TFMenuBancos.MonitorApl1Click(Sender: TObject);
begin
  inherited;
  If FMonitorApl = Nil then
    FMonitorApl := TFMonitorApl.Create(Application);
  FMonitorApl.Show;
end;

procedure TFMenuBancos.Financiamento1Click(Sender: TObject);
begin
  inherited;
  If FFinanciamentoCad = Nil then
    FFinanciamentoCad := TFFinanciamentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFinanciamentoCad.Caption,FFinanciamentoCad.Name);
  FFinanciamentoCad.ShowModal;
end;

procedure TFMenuBancos.ContaPix1Click(Sender: TObject);
begin
  inherited;
  If FContaPixCad = Nil then
    FContaPixCad := TFContaPixCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContaPixCad.Caption,FContaPixCad.Name);
  FContaPixCad.ShowModal;
end;

procedure TFMenuBancos.CadastroBandeiraCarto1Click(Sender: TObject);
begin
  inherited;
  if FBandeiraCartaoCad = Nil Then
    FBandeiraCartaoCad := TFBandeiraCartaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBandeiraCartaoCad.Caption,FBandeiraCartaoCad.Name);
  FBandeiraCartaoCad.ShowModal;
end;

end.
