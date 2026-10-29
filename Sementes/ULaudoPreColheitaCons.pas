unit ULaudoPreColheitaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, variants;

type
  TFLaudoPreColheitaCons = class(TFTConsulta)
    Label2: TLabel;
    EDNum_Laudo: TEdit;
    EDLaudo_Floracao: TEdit;
    SpeedButton1: TSpeedButton;
    MESafra: TMaskEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLaudoPreColheitaCons: TFLaudoPreColheitaCons;

implementation

uses ULaudo_cl, UPlantioSafraCons, UPlantioSafra_cl;

{$R *.DFM}

procedure TFLaudoPreColheitaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    QLaudoPreColheitaCons.Close;
    if Trim(EDNum_Laudo.Text) <> '' then
      QLaudoPreColheitaCons.SetVariable('NUM_LAUDO',Trim(EDNum_Laudo.Text))
    else
      QLaudoPreColheitaCons.SetVariable('NUM_LAUDO',null);
    if Trim(EDLaudo_Floracao.Text) <> '' then
      QLaudoPreColheitaCons.SetVariable('COD_LAUDO',Trim(EDLaudo_Floracao.Text))
    else
      QLaudoPreColheitaCons.SetVariable('COD_LAUDO',null);
    if (MESafra.Text <> '') then
      QLaudoPreColheitaCons.SetVariable('COD_PLANTIO_SAFRA',Trim(MESafra.text))
    else
      QLaudoPreColheitaCons.SetVariable('COD_PLANTIO_SAFRA',null);
    QLaudoPreColheitaCons.Open;
  end;
end;

procedure TFLaudoPreColheitaCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
   if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
     FLaudoPreColheitaCons.MESafra.text:=DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Text;
end;

end.
