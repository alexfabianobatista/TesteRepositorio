unit UMenuPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls;

type
  TFMenuPatrimonio = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastrodePatrimnio1: TMenuItem;
    CadastrodeLocalizao1: TMenuItem;
    CadastrodeFator1: TMenuItem;
    CadastrodeAplice1: TMenuItem;
    CadastrodeCIAPManual1: TMenuItem;
    CadastrodeCFOP1: TMenuItem;
    CadastrodeGrupodeContas1: TMenuItem;
    CadastrodeDepreciaoManual1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastrodePatrimnio1Click(Sender: TObject);
    procedure CadastrodeLocalizao1Click(Sender: TObject);
    procedure CadastrodeFator1Click(Sender: TObject);
    procedure CadastrodeAplice1Click(Sender: TObject);
    procedure CadastrodeCIAPManual1Click(Sender: TObject);
    procedure CadastrodeCFOP1Click(Sender: TObject);
    procedure CadastrodeGrupodeContas1Click(Sender: TObject);
    procedure CadastrodeDepreciaoManual1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPatrimonio: TFMenuPatrimonio;

implementation

uses UPatrimonioCad, UTela_cl, ULocalizacaoCad, UFatorICMSCad, UApoliceCad,
  UCIAPCad, UCFOPCad, UGrupoContaCad, UDepreciacaoManualCad;

{$R *.DFM}

procedure TFMenuPatrimonio.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='PATRIMONIO';
end;

procedure TFMenuPatrimonio.CadastrodePatrimnio1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonioCad = Nil then
    FPatrimonioCad := TFPatrimonioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPatrimonioCad.Caption,FPatrimonioCad.Name);
  FPatrimonioCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastrodeLocalizao1Click(Sender: TObject);
begin
  inherited;
  If FLocalizacaoCad = Nil then
    FLocalizacaoCad := TFLocalizacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FLocalizacaoCad.Caption,FLocalizacaoCad.Name);
  FLocalizacaoCad.ShowModal;
end;

procedure TFMenuPatrimonio.CadastrodeFator1Click(Sender: TObject);
begin
  inherited;
  if FFatorICMSCad = nil then
    FFatorICMSCad := TFFatorICMSCad.create(application);

  DMTela.VerificaTela(pModulo,FFatorICMSCad.Caption,FFatorICMSCad.Name);
  FFatorICMSCad.showmodal;
end;

procedure TFMenuPatrimonio.CadastrodeAplice1Click(Sender: TObject);
begin
  inherited;
  if FApoliceCad = nil then
    FApoliceCad := TFApoliceCad.create(application);

  DMTela.VerificaTela(pModulo,FApoliceCad.Caption,FApoliceCad.Name);
  FApoliceCad.showmodal;
end;

procedure TFMenuPatrimonio.CadastrodeCIAPManual1Click(Sender: TObject);
begin
  inherited;
  if FCIAPCad = nil then
    FCIAPCad := TFCIAPCad.create(application);

  DMTela.VerificaTela(pModulo,FCIAPCad.Caption,FCIAPCad.Name);
  FCIAPCad.showmodal;
end;

procedure TFMenuPatrimonio.CadastrodeCFOP1Click(Sender: TObject);
begin
  inherited;
  if FCFOPCad = nil then
    FCFOPCad := TFCFOPCad.create(application);

  DMTela.VerificaTela(pModulo,FCFOPCad.Caption,FCFOPCad.Name);
  FCFOPCad.showmodal;
end;

procedure TFMenuPatrimonio.CadastrodeGrupodeContas1Click(Sender: TObject);
begin
  inherited;
  if FGrupoContaCad = nil then
    FGrupoContaCad := TFGrupoContaCad.create(application);

  DMTela.VerificaTela(pModulo,FGrupoContaCad.Caption,FGrupoContaCad.Name);
  FGrupoContaCad.showmodal;
end;

procedure TFMenuPatrimonio.CadastrodeDepreciaoManual1Click(
  Sender: TObject);
begin
  inherited;
  if FDepreciacaoManualCad = nil then
    FDepreciacaoManualCad := TFDepreciacaoManualCad.create(application);

  DMTela.VerificaTela(pModulo, FDepreciacaoManualCad.Caption, FDepreciacaoManualCad.Name);
  FDepreciacaoManualCad.showmodal;

end;

end.
