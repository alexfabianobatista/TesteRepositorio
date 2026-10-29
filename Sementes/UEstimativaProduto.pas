unit UEstimativaProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFEstimativaProduto = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtProdutoCons: TBitBtn;
    BtPlantioSafra: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    procedure BtProdutoConsClick(Sender: TObject);
    procedure BtPlantioSafraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstimativaProduto: TFEstimativaProduto;

implementation

uses UEstimativaProduto_cl;

{$R *.DFM}

procedure TFEstimativaProduto.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMEstimativaProduto.QEstimativaProdutoCod_Produto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
end;

procedure TFEstimativaProduto.BtPlantioSafraClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    DMEstimativaProduto.QEstimativaProdutoCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;

end;

end.
