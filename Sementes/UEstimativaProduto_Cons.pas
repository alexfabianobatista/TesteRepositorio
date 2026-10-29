unit UEstimativaProduto_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFEstimativaProduto_Cons = class(TFTConsulta)
    Label2: TLabel;
    MeProduto: TMaskEdit;
    BtProdutoCons: TBitBtn;
    BtPlantioSafra: TBitBtn;
    procedure BtProdutoConsClick(Sender: TObject);
    procedure BtPlantioSafraClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstimativaProduto_Cons: TFEstimativaProduto_Cons;

implementation

uses UEstimativaProduto_cl, UProdutoCons, UPlantioSafraCons, UProduto_cl,
  UPlantioSafra_cl;

{$R *.DFM}

procedure TFEstimativaProduto_Cons.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    MeProduto.Text := DMProduto.QProdutoConsCod_Produto.text;

end;

procedure TFEstimativaProduto_Cons.BtPlantioSafraClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    METexto.Text:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Text;

end;

procedure TFEstimativaProduto_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEstimativaProduto Do
  Begin
    QEstimativaProdutoCons.Close;
    If Trim(MeTexto.Text) = '' Then
       QEstimativaProdutoCons.SetVariable('Cod_Plantio_Safra',Null)
    Else
       QEstimativaProdutoCons.SetVariable('Cod_Plantio_Safra',Trim(MeTexto.Text));

    If Trim(MeProduto.Text) = '' Then
       QEstimativaProdutoCons.SetVariable('Cod_Produto',Null)
    Else
       QEstimativaProdutoCons.SetVariable('Cod_Produto',Trim(MeProduto.Text));
    QEstimativaProdutoCons.Open;
  End;
end;

end.
