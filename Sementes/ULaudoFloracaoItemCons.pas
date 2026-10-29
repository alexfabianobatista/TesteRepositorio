unit ULaudoFloracaoItemCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, Db, Grids, DBGrids, StdCtrls, Mask, variants;

type
  TFLaudoFloracaoItemCons = class(TFTConsulta)
    MEPraga: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    MESafra: TMaskEdit;
    Label3: TLabel;
    MECampo: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoFloracaoItemCons: TFLaudoFloracaoItemCons;

implementation

uses UPragaCons, UPraga_cl, UCampoPlantioCons, UCampoPlantio_cl, ULaudo_cl;

{$R *.DFM}

procedure TFLaudoFloracaoItemCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FPragaCons = nil then
    FPragaCons:= TFPragaCons.Create(Application);
  if FPragaCons.ShowModal = mrOk then
    FLaudoFloracaoItemCons.MEPraga.text:=DMPraga.QPragaConsCod_Praga.Text;
end;

procedure TFLaudoFloracaoItemCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   if FCampoPlantioCons = nil then
    FCampoPlantioCons:= TFCampoPlantioCons.Create(Application);
  if FCampoPlantioCons.ShowModal = mrOk then
    FLaudoFloracaoItemCons.MECampo.text:=DMCampoPlantio.QCampoPlantioConsCod_Campo_Plantio_Cab.Text;
end;

procedure TFLaudoFloracaoItemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoFloracaoItemCons.Close;
    if Trim(METexto.Text) <> '' then
      QLaudoFloracaoItemCons.SetVariable('DOENCA',Trim(METexto.Text))
    else
      QLaudoFloracaoItemCons.SetVariable('DOENCA',null);
    if Trim(MEPraga.Text) <> '' then
      QLaudoFloracaoItemCons.SetVariable('COD_PRAGA',Trim(MEPraga.Text))
    else
      QLaudoFloracaoItemCons.SetVariable('COD_PRAGA',null);
    if length(Trim(MESafra.Text)) > 2 then
      QLaudoFloracaoItemCons.SetVariable('SAFRA',Trim(MESafra.Text))
    else
      QLaudoFloracaoItemCons.SetVariable('SAFRA',null);
    if Trim(MECampo.Text) <> '' then
      QLaudoFloracaoItemCons.SetVariable('COD_CAMPO',Trim(MECampo.Text))
    else
      QLaudoFloracaoItemCons.SetVariable('COD_CAMPO',null);
    QLaudoFloracaoItemCons.Open;
  end;
end;

end.
