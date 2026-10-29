unit UMenuIndustria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuIndustria = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Turno1: TMenuItem;
    Formula1: TMenuItem;
    Boletim1: TMenuItem;
    ControledeTurno1: TMenuItem;
    BoletimMP1: TMenuItem;
    BoletimPA1: TMenuItem;
    Produo1: TMenuItem;
    ProduoAgrcola1: TMenuItem;
    OrdemdeProduo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Formula1Click(Sender: TObject);
    procedure Boletim1Click(Sender: TObject);
    procedure Turno1Click(Sender: TObject);
    procedure ControledeTurno1Click(Sender: TObject);
    procedure BoletimMP1Click(Sender: TObject);
    procedure BoletimPA1Click(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure ProduoAgrcola1Click(Sender: TObject);
    procedure OrdemdeProduo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuIndustria: TFMenuIndustria;

implementation

uses UFormulaCad, UTela_cl, UBoletimCad, UTurnoCad, UTurnoControle,
  UBoletimE, UBoletimS, UBoletim_cl, UProducaoCad, UProducaoAgricolaCad,
  UBoletimOrdemProducao, UParamSistema_cl;

{$R *.DFM}

procedure TFMenuIndustria.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'INDUSTRIA';
end;

procedure TFMenuIndustria.Formula1Click(Sender: TObject);
begin
  inherited;
  If FFormulaCad = Nil then
    FFormulaCad := TFFormulaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFormulaCad.Caption,FFormulaCad.Name);
  FFormulaCad.ShowModal;
end;

procedure TFMenuIndustria.Boletim1Click(Sender: TObject);
begin
  inherited;
  If FBoletimCad = Nil then
    FBoletimCad := TFBoletimCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBoletimCad.Caption,FBoletimCad.Name);
  FBoletimCad.ShowModal;
end;

procedure TFMenuIndustria.Turno1Click(Sender: TObject);
begin
  inherited;
  If FTurnoCad = Nil then
    FTurnoCad := TFTurnoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTurnoCad.Caption,FTurnoCad.Name);
  FTurnoCad.ShowModal;
end;

procedure TFMenuIndustria.ControledeTurno1Click(Sender: TObject);
begin
  inherited;
  If FTurnoControle = Nil then
    FTurnoControle := TFTurnoControle.Create(Application);
  DMTela.VerificaTela(pModulo,FTurnoControle.Caption,FTurnoControle.Name);
  FTurnoControle.ShowModal;
end;

procedure TFMenuIndustria.BoletimMP1Click(Sender: TObject);
begin
  inherited;
  If FBoletimBaixaMatPrim = Nil then
    FBoletimBaixaMatPrim := TFBoletimBaixaMatPrim.Create(Application);
  DMTela.VerificaTela(pModulo,FBoletimBaixaMatPrim.Caption,FBoletimBaixaMatPrim.Name);
  FBoletimBaixaMatPrim.ShowModal;
end;

procedure TFMenuIndustria.BoletimPA1Click(Sender: TObject);
begin
  inherited;
    If FBoletimEntradaProdAcab = Nil then
    FBoletimEntradaProdAcab := TFBoletimEntradaProdAcab.Create(Application);
  DMTela.VerificaTela(pModulo,FBoletimEntradaProdAcab.Caption,FBoletimEntradaProdAcab.Name);
  FBoletimEntradaProdAcab.ShowModal;
end;

procedure TFMenuIndustria.Produo1Click(Sender: TObject);
begin
  //if DMBoletim.pProducao  Then
  //Begin
  If FProducaoCad= Nil then
     FProducaoCad := TFProducaoCad.Create(Application);
//  DMTela.VerificaTela(pModulo,FProducaoCad.Caption);
  FProducaoCad.ShowModal;
  //End;
  //DMBoletim.pProducao := False;
end;

procedure TFMenuIndustria.ProduoAgrcola1Click(Sender: TObject);
begin
  inherited;
  if FProducaoAgricolaCad = Nil then
    FProducaoAgricolaCad := TFProducaoAgricolaCad.Create(Application);
    FProducaoAgricolaCad.ShowModal;
end;

procedure TFMenuIndustria.OrdemdeProduo1Click(Sender: TObject);
begin
  inherited;
  If FBoletimOrdemProducao = Nil then
    FBoletimOrdemProducao := TFBoletimOrdemProducao.Create(Application);
  DMTela.VerificaTela(pModulo,FBoletimOrdemProducao.Caption,FBoletimOrdemProducao.Name);
  FBoletimOrdemProducao.ShowModal;
end;

procedure TFMenuIndustria.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA') then
  begin
    MMCadSimples.Items[0].Items[5].Visible := False;
    MMCadSimples.Items[0].Items[6].Visible := False;
    MMCadSimples.Items[0].Items[7].Visible := False;
  end;
end;

end.
