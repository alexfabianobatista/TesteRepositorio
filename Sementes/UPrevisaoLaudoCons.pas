unit UPrevisaoLaudoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPrevisaoLaudoCons = class(TFTConsulta)
    MESafra: TMaskEdit;
    Label2: TLabel;
    MEProduto: TMaskEdit;
    BTSafraCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    procedure BTSafraConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrevisaoLaudoCons: TFPrevisaoLaudoCons;

implementation

uses UPrevisaoLaudo_cl, UPlantioSafraCons, UPlantioSafra_cl, UProdutoCons,
  UProduto_cl;

{$R *.DFM}

procedure TFPrevisaoLaudoCons.BTSafraConsClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     FPrevisaoLaudoCons.MESafra.Text:=IntToStr(DMPlantioSafra.QPlantioSafraConsCod_Plantio_Safra.Value);
  end;
end;

procedure TFPrevisaoLaudoCons.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:= TFProdutoCons.Create(Application);
   if FProdutoCons.ShowModal = mrOk then
   begin
      FPrevisaoLaudoCons.MEProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
   end;
end;

procedure TFPrevisaoLaudoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPrevisaoLaudo do
  begin
    QPrevisaoLaudoCons.Close;
    if Trim(MESafra.Text) <> '' then
      QPrevisaoLaudoCons.SetVariable('Cod_Plantio_Safra',Trim(MESafra.Text))
    else
      QPrevisaoLaudoCons.SetVariable('Cod_Plantio_Safra',null);

    if Trim(MEProduto.Text) <> '' then
      QPrevisaoLaudoCons.SetVariable('Cod_Produto',Trim(MEProduto.Text))
    else
      QPrevisaoLaudoCons.SetVariable('Cod_Produto',null);
    QPrevisaoLaudoCons.Open;
  end;
end;

end.
