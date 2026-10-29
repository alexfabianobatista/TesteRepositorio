unit UPrevisaoColheitaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids;

type
  TFPrevisaoColheitaCad = class(TFTCadSimples)
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
    DBGrid1: TDBGrid;
    procedure BTSafraConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrevisaoColheitaCad: TFPrevisaoColheitaCad;

implementation

uses UPrevisaoColheita_cl, UPlantioSafraCons, UPlantioSafra_cl,
  UProdutoCons, UProduto_cl, UPrevisaoColheitaCons;

{$R *.DFM}

procedure TFPrevisaoColheitaCad.BTSafraConsClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     with DMPrevisaoColheita do
     begin
       QPrevisaoColheitaCod_Plantio_Safra.Value:=(DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Value);
     end;
   end;
end;

procedure TFPrevisaoColheitaCad.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  with DMPrevisaoColheita do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      QPrevisaoColheitaCod_Produto.Value:=(DMProduto.QProdutoConsCod_Produto.Value);
  end;
end;

procedure TFPrevisaoColheitaCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMPrevisaoColheita.QPrevisaoColheita.Open;
  DMPrevisaoColheita.QExibePrevisao.Open;
end;

procedure TFPrevisaoColheitaCad.DSPrimarioStateChange(Sender: TObject);
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

procedure TFPrevisaoColheitaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  with DMPrevisaoColheita do
  begin
    if FPrevisaoColheitaCons = nil then
      FPrevisaoColheitaCons:=TFPrevisaoColheitaCons.Create(Application);
    if FPrevisaoColheitaCons.showmodal = mrok then
    begin
      QPrevisaoColheita.Close;
      QPrevisaoColheita.SetVariable('PK',QPrevisaoColheitaConsCod_Previsao_Colheita.Value);
      QPrevisaoColheita.Open;
    end;
  end;
end;

end.
