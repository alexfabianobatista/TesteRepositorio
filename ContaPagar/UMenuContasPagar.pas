unit UMenuContasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuContasPagar = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Bancos1: TMenuItem;
    Finalidade1: TMenuItem;
    ContasaPagar1: TMenuItem;
    Histrico1: TMenuItem;
    Contabilizao1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure Finalidade1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure TipodeMovimento1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Contabilizao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuContasPagar: TFMenuContasPagar;

implementation

uses UBancoscad, UTela_cl, UFinalidadeCad, UContasPagarCad,
  UTipoMovimentoCad, UHistoricoCad, UContabiliza_CP;

{$R *.DFM}

procedure TFMenuContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuContasPagar.pModulo:='CONTAS A PAGAR';
end;

procedure TFMenuContasPagar.Bancos1Click(Sender: TObject);
begin
  inherited;
  If FBancosCad=Nil then
    FBancosCad:=TFBancosCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBancosCad.Caption,FBancosCad.Name);
  FBancosCad.ShowModal;
end;

procedure TFMenuContasPagar.Finalidade1Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCad=Nil then
    FFinalidadeCad:=TFFinalidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFinalidadeCad.Caption,FFinalidadeCad.Name);
  FFinalidadeCad.ShowModal;
end;

procedure TFMenuContasPagar.ContasaPagar1Click(Sender: TObject);
begin
  inherited;
  If FContasPagarCad=Nil then
    FContasPagarCad:=TFContasPagarCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContasPagarCad.Caption,FContasPagarCad.Name);
  FContasPagarCad.ShowModal;
end;

procedure TFMenuContasPagar.TipodeMovimento1Click(Sender: TObject);
begin
  inherited;
  If FTipoMovimentoCad=Nil then
    FTipoMovimentoCad:=TFTipoMovimentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoMovimentoCad.Caption,FTipoMovimentoCad.Name);
  FTipoMovimentoCad.ShowModal;
end;

procedure TFMenuContasPagar.Histrico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCad=Nil then
    FHistoricoCad:=TFHistoricoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistoricoCad.Caption,FHistoricoCad.Name);
  FHistoricoCad.ShowModal;
end;

procedure TFMenuContasPagar.Contabilizao1Click(Sender: TObject);
begin
  inherited;
{
  If FContabiliza_CP=Nil then
    FContabiliza_CP:=TFContabiliza_CP.Create(Application);
  DMTela.VerificaTela(pModulo,FContabiliza_CP.Caption,FContabiliza_CP.Name);
  FContabiliza_CP.ShowModal;
}  
end;

end.
