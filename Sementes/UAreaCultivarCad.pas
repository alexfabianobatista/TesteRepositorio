unit UAreaCultivarCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFAreaCultivarCad = class(TFTCadSimples)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BTSafraCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure DBEdit2Exit(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BTSafraConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAreaCultivarCad: TFAreaCultivarCad;

implementation

uses UAreaCultivar_cl, UPlantioSafraCons, UPlantioSafra_cl, UProdutoCons,
  UProduto_cl, UAreaCultivarCons;

{$R *.DFM}

procedure TFAreaCultivarCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  with DMAreaCultivar do
  begin
    if DBEdit2.Text <> '' then
    begin
      QExibeArea.Close;
      QExibeArea.SetVariable('COD_PLANTIO_SAFRA',Trim(DBEdit2.Text));
      QExibeArea.Open;
    end;
  end;
end;

procedure TFAreaCultivarCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    BTSafraCons.Enabled:=true;
    BTProdutoCons.Enabled:=true;
  end
  else
  begin
    BTSafraCons.Enabled:=false;
    BTProdutoCons.Enabled:=false;
  end;
end;

procedure TFAreaCultivarCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMAreaCultivar.QAreaCultivar.Open;
end;

procedure TFAreaCultivarCad.BTSafraConsClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     with DMAreaCultivar do
     begin
       QAreaCultivarCOD_PLANTIO_SAFRA.Value:=(DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Value);
     end;
   end;
end;

procedure TFAreaCultivarCad.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  with DMAreaCultivar do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QAreaCultivarCod_Produto.Value:=(DMProduto.QProdutoConsCod_Produto.Value);
  end;
end;

procedure TFAreaCultivarCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with  DMAreaCultivar do
  begin
    action:=CaFree;
    FAreaCultivarCad:=nil;
    DMAreaCultivar.QAreaCultivar.Close;
    DMAreaCultivar.QExibeArea.Close;
  end;
end;

procedure TFAreaCultivarCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  with DMAreaCultivar do
  begin
    if FAreaCultivarCons = nil then
      FAreaCultivarCons:=TFAreaCultivarCons.Create(Application);
    if FAreaCultivarCons.showmodal = mrok then
    begin
      QAreaCultivar.Close;
      QAreaCultivar.SetVariable('PK',QAreaCultivarConsCod_Area_Cultivar.Value);
      QAreaCultivar.Open;
    end;
  end;
end;

end.
