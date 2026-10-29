unit UEstoqueSegurancaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFEstoqueSegurancaCons = class(TFTConsulta)
    Label4: TLabel;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    Label2: TLabel;
    MEFilial: TMaskEdit;
    SBFilial: TSpeedButton;
    SBCaracteristica: TSpeedButton;
    procedure SBProdutoClick(Sender: TObject);
    procedure SBCaracteristicaClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueSegurancaCons: TFEstoqueSegurancaCons;

implementation

uses UEstoqueSeguranca_cl, UProdutoSegurancaCons,
  UCaracteristicaProdutoCons, UFilialCons, UProdutoSeguranca_cl,
  UCaracteristicaProduto_cl, UFilial_cl;

{$R *.DFM}

procedure TFEstoqueSegurancaCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    MEProduto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFEstoqueSegurancaCons.SBCaracteristicaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    METexto.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
end;

procedure TFEstoqueSegurancaCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFEstoqueSegurancaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    QEstoqueSegurancaCons.Close;
    if Trim(METexto.Text) = '' then
       QEstoqueSegurancaCons.SetVariable('CARACTERISTICA_PRODUTO',Null)
    else
       QEstoqueSegurancaCons.SetVariable('CARACTERISTICA_PRODUTO',Trim(METexto.Text));
    if Trim(MEFilial.Text) = '' then
       QEstoqueSegurancaCons.SetVariable('FILIAL',Null)
    else
       QEstoqueSegurancaCons.SetVariable('FILIAL',Trim(MEFilial.Text));
    if Trim(MEProduto.Text) = '' then
       QEstoqueSegurancaCons.SetVariable('PRODUTO_SEGURANCA',Null)
    else
       QEstoqueSegurancaCons.SetVariable('PRODUTO_SEGURANCA',Trim(MEProduto.Text));
    QEstoqueSegurancaCons.Open;
  end;

end;

procedure TFEstoqueSegurancaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEProduto.SetFocus;
end;

end.
