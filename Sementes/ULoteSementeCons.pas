unit ULoteSementeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFLoteSementeCons = class(TFTConsulta)
    MENumLote: TMaskEdit;
    MESafra: TMaskEdit;
    BTPlantioSafraCons: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    BTCultivarCons: TBitBtn;
    MECultivar: TMaskEdit;
    procedure BTPlantioSafraConsClick(Sender: TObject);
    procedure BTCultivarConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLoteSementeCons: TFLoteSementeCons;

implementation

uses UProducaoSemente_cl, UPlantioSafraCons, UPlantioSafra_cl, UProdutoCons,
  UProduto_cl;

{$R *.DFM}

procedure TFLoteSementeCons.BTPlantioSafraConsClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    if FPlantioSafraCons = nil then
      FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
    if FPlantioSafraCons.ShowModal = mrOk then
    begin
      MESafra.Text:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Text;
    end;
  end;
end;

procedure TFLoteSementeCons.BTCultivarConsClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      MECultivar.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFLoteSementeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    QLoteSementeCons.Close;
    if Trim(MENumLote.Text) <> '' then
      QLoteSementeCons.SetVariable('NUM_LOTE_SEMENTE',Trim(MENumLote.Text))
    else
      QLoteSementeCons.SetVariable('NUM_LOTE_SEMENTE',null);
    if Trim(MECultivar.Text) <> '' then
      QLoteSementeCons.SetVariable('COD_PRODUTO',Trim(MECultivar.Text))
    else
      QLoteSementeCons.SetVariable('COD_PRODUTO',null);
    if Trim(MESafra.Text) <> '' then
      QLoteSementeCons.SetVariable('COD_PLANTIO_SAFRA',Trim(MESafra.Text))
    else
      QLoteSementeCons.SetVariable('COD_PLANTIO_SAFRA',null);
    QLoteSementeCons.Open;
  end;
end;

end.

