unit UBaixaEstoqueCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFBaixaEstoqueCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    MEProduto: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    SBFilial: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    MECaractProd: TMaskEdit;
    SBCaractProd: TSpeedButton;
    procedure SBFilialClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SBCaractProdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaEstoqueCons: TFBaixaEstoqueCons;

implementation

uses UEstoqueSeguranca_cl, UFilialCons, UProdutoSegurancaCons, UFilial_cl,
  UProdutoSeguranca_cl, UCaracteristicaProdutoCons,
  UCaracteristicaProduto_cl;

{$R *.DFM}

procedure TFBaixaEstoqueCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
     MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFBaixaEstoqueCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
     FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
     MEProduto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFBaixaEstoqueCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    QBaixaEstoqueCons.Close;
    if Trim(METexto.Text) = '' then
       QBaixaEstoqueCons.SetVariable('DT_INICIO',Null)
    else
       QBaixaEstoqueCons.SetVariable('DT_INICIO',StrToDate(Trim(METexto.Text)));
    if Trim(MeFilial.Text) = '' then
       QBaixaEstoqueCons.SetVariable('COD_FILIAL',Null)
    else
       QBaixaEstoqueCons.SetVariable('COD_FILIAL',Trim(MeFilial.Text));
    if Trim(MeProduto.Text) = '' then
       QBaixaEstoqueCons.SetVariable('COD_PRODUTO_SEGURANCA',Null)
    else
       QBaixaEstoqueCons.SetVariable('COD_PRODUTO_SEGURANCA',Trim(MeProduto.Text));
    if Trim(MeCaractProd.Text) = '' then
       QBaixaEstoqueCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Null)
    else
       QBaixaEstoqueCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Trim(MECaractProd.Text));
    QBaixaEstoqueCons.Open;
  end;
end;

procedure TFBaixaEstoqueCons.SBCaractProdClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
     FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
     MECaractProd.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
end;

end.
