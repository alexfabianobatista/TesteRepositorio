unit UEstimativaProduto_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu;

type
  TFEstimativaProduto_Cad = class(TFTCadSimples)
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
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstimativaProduto_Cad: TFEstimativaProduto_Cad;

implementation

uses UEstimativaProduto_cl, UProdutoCons, UPlantioSafraCons,
  UEstimativaProduto_Cons, UProduto_cl, UPlantioSafra_cl;

{$R *.DFM}

procedure TFEstimativaProduto_Cad.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMEstimativaProduto.QEstimativaProdutoCod_Produto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
end;

procedure TFEstimativaProduto_Cad.BtPlantioSafraClick(Sender: TObject);
begin
  inherited;
  if FPlantioSafraCons = nil then
    FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
  if FPlantioSafraCons.ShowModal = mrOk then
    DMEstimativaProduto.QEstimativaProdutoCod_plantio_Safra.Value:=DMPlantioSafra.QPLantioSafraConsCod_Plantio_Safra.Value;

end;

procedure TFEstimativaProduto_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEstimativaProduto_Cons = nil then
     FEstimativaProduto_Cons:= TFEstimativaProduto_Cons.Create(Application);
   if FEstimativaProduto_Cons.ShowModal = mrOk then
    begin
      DMEstimativaProduto.QEstimativaProduto.Close;
      DMEstimativaProduto.QEstimativaProduto.setVariable('PK',DMEstimativaProduto.QEstimativaProdutoConsCod_Estimativa_Produto.Value);
      DMEstimativaProduto.QEstimativaProduto.Open;
    end;

end;

procedure TFEstimativaProduto_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMEstimativaProduto.QEstimativaProduto.Open;
end;

procedure TFEstimativaProduto_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMEstimativaProduto.QEstimativaProduto.Close;
end;

end.
