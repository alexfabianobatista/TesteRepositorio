unit UMenuControleVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuControleVeiculo = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    ModelodeVeculo1: TMenuItem;
    Veculo1: TMenuItem;
    TipoCustoVeculo1: TMenuItem;
    MovCustoVeculo1: TMenuItem;
    Cor1: TMenuItem;
    N1: TMenuItem;
    RecDespesa1: TMenuItem;
    Pneu1: TMenuItem;
    Marca1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ModelodeVeculo1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure TipoCustoVeculo1Click(Sender: TObject);
    procedure MovCustoVeculo1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure RecDespesa1Click(Sender: TObject);
    procedure Pneu1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuControleVeiculo: TFMenuControleVeiculo;

implementation

uses UVeiculoModeloCad, UTela_cl, UVeiculoCad, UCustoVeiculoMovCad,
  UVeiculoFabricanteCad, UCorCad, UDespesaRecupCad, UFPneuCad,
  UMarcaPneuCad;

{$R *.DFM}

procedure TFMenuControleVeiculo.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuControleVeiculo.pModulo := 'CONTROLEVEICULO';
end;

procedure TFMenuControleVeiculo.ModelodeVeculo1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCad = Nil then
    FVeiculoModeloCad := TFVeiculoModeloCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeiculoModeloCad.Caption,FVeiculoModeloCad.Name);
  FVeiculoModeloCad.ShowModal;
end;

procedure TFMenuControleVeiculo.Veculo1Click(Sender: TObject);
begin
  inherited;
  if FVeicCad = Nil then
    FVeicCad := TFVeicCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeicCad.Caption,FVeicCad.Name);
  FVeicCad.ShowModal;
end;

procedure TFMenuControleVeiculo.TipoCustoVeculo1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoFabricanteCad = Nil then
    FVeiculoFabricanteCad := TFVeiculoFabricanteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeiculoFabricanteCad.Caption,FVeiculoFabricanteCad.Name);
  FVeiculoFabricanteCad.ShowModal;
end;

procedure TFMenuControleVeiculo.MovCustoVeculo1Click(Sender: TObject);
begin
  inherited;
  if FCustoVeiculoMovCad = Nil then
    FCustoVeiculoMovCad := TFCustoVeiculoMovCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCustoVeiculoMovCad.Caption,FCustoVeiculoMovCad.Name);
  FCustoVeiculoMovCad.ShowModal;
end;

procedure TFMenuControleVeiculo.Cor1Click(Sender: TObject);
begin
  inherited;
  if FCorCad = Nil then
    FCorCad := TFCorCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCorCad.Caption,FCorCad.Name);
  FCorCad.ShowModal;
end;

procedure TFMenuControleVeiculo.RecDespesa1Click(Sender: TObject);
begin
  inherited;
  if FDespesaRecupCad = Nil then
    FDespesaRecupCad := TFDespesaRecupCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDespesaRecupCad.Caption,FDespesaRecupCad.Name);
  FDespesaRecupCad.ShowModal;
end;

procedure TFMenuControleVeiculo.Pneu1Click(Sender: TObject);
begin
  inherited;
  if FPneuCad = nil then
    FPneuCad := TFPneuCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPneuCad.Caption, FPneuCad.Name);
  FPneuCad.ShowModal;
end;

procedure TFMenuControleVeiculo.Marca1Click(Sender: TObject);
begin
  inherited;
  if FMarcaPneuCad = Nil then
    FMarcaPneuCad := TFMarcaPneuCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMarcaPneuCad.Caption,FMarcaPneuCad.Name);
  FMarcaPneuCad.ShowModal;
end;

end.
