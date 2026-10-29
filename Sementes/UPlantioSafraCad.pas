unit UPlantioSafraCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFPlantioSafraCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BTCulturaCons: TBitBtn;
    BTClassePlantioCons: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    N2: TMenuItem;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BTFilialCons: TBitBtn;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BTCulturaConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTClassePlantioConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlantioSafraCad: TFPlantioSafraCad;

implementation

uses UOracle_cl, UPlantioSafra_cl, UCultivarCons, UCulturaCons, UCultura_cl,
  UClassePlantioCons, UClassePlantio_cl, UPlantioSafraCons, USementeParam,
  URPlantioSafra, UFilial_cl, UFilialCons;

{$R *.DFM}

procedure TFPlantioSafraCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPlantioSafra.QPlantioSafra.Open;
end;

procedure TFPlantioSafraCad.BTCulturaConsClick(Sender: TObject);
begin
  inherited;
   if FCulturaCons = nil then
     FCulturaCons:= TFCulturaCons.Create(Application);
   if FCulturaCons.ShowModal = mrOk then
   begin
     DMPlantioSafra.QPlantioSafraCod_Cultura.Value:=DMCultura.QCulturaConsCod_Cultura.Value;
   end;
end;

procedure TFPlantioSafraCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    FPlantioSafraCad.BTCulturaCons.enabled:=True;
    FPlantioSafraCad.BTClassePlantioCons.enabled:=True;
    FPlantioSafraCad.BTFilialCons.enabled:=True;
  End
  Else
  Begin
    FPlantioSafraCad.BTCulturaCons.enabled:=False;
    FPlantioSafraCad.BTClassePlantioCons.enabled:=False;
    FPlantioSafraCad.BTFilialCons.enabled:=False;
  End;
end;

procedure TFPlantioSafraCad.BTClassePlantioConsClick(Sender: TObject);
begin
  inherited;
   if FClassePlantioCons = nil then
     FClassePlantioCons:= TFClassePlantioCons.Create(Application);
   if FClassePlantioCons.ShowModal = mrOk then
   begin
     DMPlantioSafra.QPlantioSafraCod_Classe_Plantio.Value:=DMClassePlantio.QClassePlantioConsCod_Classe_Plantio.Value;
   end;
end;

procedure TFPlantioSafraCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     with  DMPlantioSafra do
     begin
       QPlantioSafra.Close;
       QPlantioSafra.setVariable('PK',QPlantioSafraConsCod_Plantio_Safra.Value);
       QPlantioSafra.Open;
     end;
   end;
end;

procedure TFPlantioSafraCad.N2Click(Sender: TObject);
begin
  inherited;
  If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
      with DMPlantioSafra do
      begin
        QRPlantioSafra.Close;
        QRPlantioSafra.SetVariable('PK',Trim(FSementeParam.MEPlantioSafra1.Text));
        QRPlantioSafra.Open;
      end;
      if FRPlantioSafra = nil then
         FRPlantioSafra := TFRPlantioSafra.Create(Application);
      if FSementeParam.RGPreview.ItemIndex = 0 then
         FRPlantioSafra.QRPrimario.Preview
      else
         FRPlantioSafra.QRPrimario.Print;
      DMPlantioSafra.QRPlantioSafra.Close;
  end;
end;

procedure TFPlantioSafraCad.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  with DMPlantioSafra do
  begin
    if FFilialCons = nil then
      FFilialCons:= TFFilialCons.Create(Application);
    if FFilialCons.ShowModal = mrOk then
      QPlantioSafraCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
  end;
end;

end.
