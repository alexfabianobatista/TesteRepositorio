unit ULaudoFloracaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, Db, Grids, DBGrids, StdCtrls, Mask, variants;

type
  TFLaudoFloracaoCons = class(TFTConsulta)
    MENum_Laudo: TMaskEdit;
    Label2: TLabel;
    MESafra: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MECadastro: TMaskEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoFloracaoCons: TFLaudoFloracaoCons;

implementation

uses ULaudo_cl, UCadastroCons, UCampoPlantioCons, UCadastro_cl,
  UCampoPlantio_cl, UPlantioSafraCons, UPlantioSafra_cl;

{$R *.DFM}

procedure TFLaudoFloracaoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    FlaudoFloracaoCons.MECadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFLaudoFloracaoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
   if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    FLaudoFloracaoCons.MESafra.text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFLaudoFloracaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLaudo do
  Begin
    QLaudoFloracaoCons.Close;
    if (MESafra.Text)<> '' then
      QLaudoFloracaoCons.SetVariable('COD_PLANTIO_SAFRA',Trim(MESafra.Text))
    else
      QLaudoFloracaoCons.SetVariable('COD_PLANTIO_SAFRA',null);
    if Trim(MECadastro.Text) <> '' then
      QLaudoFloracaoCons.SetVariable('COD_CADASTRO',Trim(MECadastro.Text))
    else
      QLaudoFloracaoCons.SetVariable('COD_CADASTRO',null);
    if Trim(MENum_Laudo.text) <> '' then
      QLaudoFloracaoCons.SetVariable('NUM_LAUDO',Trim(MENum_Laudo.Text))
    else
      QLaudoFloracaoCons.SetVariable('NUM_LAUDO',null);
    QLaudoFloracaoCons.Open;
  End;
end;

end.
