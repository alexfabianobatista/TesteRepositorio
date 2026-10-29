unit ULaudoVistoriaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFLaudoVistoriaCons = class(TFTConsulta)
    MELaudo: TMaskEdit;
    MESafra: TMaskEdit;
    MECadastro: TMaskEdit;
    SBsafra: TSpeedButton;
    SBCadastro: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure SBsafraClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoVistoriaCons: TFLaudoVistoriaCons;

implementation

uses UPlantioSafraCons, UCadastroCons, ULaudo_cl, UPlantioSafra_cl,
  UCadastro_cl;

{$R *.DFM}

procedure TFLaudoVistoriaCons.SBsafraClick(Sender: TObject);
begin
  inherited;
   if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    FLaudoVistoriaCons.MESafra.text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

procedure TFLaudoVistoriaCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    FlaudoVistoriaCons.MECadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFLaudoVistoriaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLaudo do
  Begin
    QLaudoVistoriaCons.Close;
    if (MESafra.Text)<> '' then
      QLaudoVistoriaCons.SetVariable('COD_PLANTIO_SAFRA',Trim(MESafra.Text))
    else
      QLaudoVistoriaCons.SetVariable('COD_PLANTIO_SAFRA',null);
    if Trim(MECadastro.Text) <> '' then
      QLaudoVistoriaCons.SetVariable('COD_CADASTRO',Trim(MECadastro.Text))
    else
      QLaudoVistoriaCons.SetVariable('COD_CADASTRO',null);
    if Trim(MELaudo.text) <> '' then
      QLaudoVistoriaCons.SetVariable('NUM_LAUDO',Trim(MELaudo.Text))
    else
      QLaudoVistoriaCons.SetVariable('NUM_LAUDO',null);
    QLaudoVistoriaCons.Open;
  End;

end;

end.
