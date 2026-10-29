unit UPlantioSafraCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons, variants;

type
  TFPlantioSafraCons = class(TFTConsulta)
    MESafraCons: TMaskEdit;
    Label2: TLabel;
    EDCulturaCons: TEdit;
    BTCulturaCons: TBitBtn;
    procedure BTCulturaConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlantioSafraCons: TFPlantioSafraCons;

implementation

uses UPlantioSafra_cl, UCulturaCons, UCultura_cl;

{$R *.DFM}

procedure TFPlantioSafraCons.BTCulturaConsClick(Sender: TObject);
begin
  inherited;
   if FCulturaCons = nil then
     FCulturaCons:= TFCulturaCons.Create(Application);
   if FCulturaCons.ShowModal = mrOk then
   begin
     FPlantioSafraCons.EDCulturaCons.Text:=IntToStr(DMCultura.QCulturaConsCod_Cultura.Value);
   end;
end;

procedure TFPlantioSafraCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPlantioSafra do
  Begin
    QPlantioSafraCons.Close;
    if length(Trim(MESafraCons.Text)) > 2 then
      QPlantioSafraCons.SetVariable('SAFRA',Trim(MESafraCons.Text))
    else
      QPlantioSafraCons.SetVariable('SAFRA',null);
    if Trim(EDCulturaCons.Text) <> '' then
      QPlantioSafraCons.SetVariable('DESCRICAO',Trim(EDCulturaCons.Text))
    else
      QPlantioSafraCons.SetVariable('DESCRICAO',null);
    QPlantioSafraCons.Open;
  End;
end;

end.
