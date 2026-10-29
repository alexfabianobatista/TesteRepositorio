unit UEstoqueImplantadoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFEstoqueImplantadoCons = class(TFTConsulta)
    Label4: TLabel;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    Label2: TLabel;
    MEFilial: TMaskEdit;
    SBFilial: TSpeedButton;
    Label3: TLabel;
    MEDtInicio: TMaskEdit;
    SBCaracteristica: TSpeedButton;
    procedure SBProdutoClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBCaracteristicaClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueImplantadoCons: TFEstoqueImplantadoCons;

implementation

uses UEstoqueSeguranca_cl, UProdutoSegurancaCons, UFilialCons,
  UCaracteristicaProdutoCons, UProdutoSeguranca_cl, UFilial_cl,
  UCaracteristicaProduto_cl;

{$R *.DFM}

procedure TFEstoqueImplantadoCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    MEProduto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFEstoqueImplantadoCons.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFEstoqueImplantadoCons.SBCaracteristicaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    METexto.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
end;

procedure TFEstoqueImplantadoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMEstoqueSeguranca do
  begin
    QEstoqueImplantadoCons.Close;
    if Trim(METexto.Text) = '' then
       QEstoqueImplantadoCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Null)
    else
       QEstoqueImplantadoCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Trim(METexto.Text));
    if Trim(MEFilial.Text) = '' then
       QEstoqueImplantadoCons.SetVariable('COD_FILIAL',Null)
    else
       QEstoqueImplantadoCons.SetVariable('COD_FILIAL',Trim(MEFilial.Text));
    if Trim(MEProduto.Text) = '' then
       QEstoqueImplantadoCons.SetVariable('COD_PRODUTO_SEGURANCA',Null)
    else
       QEstoqueImplantadoCons.SetVariable('COD_PRODUTO_SEGURANCA',Trim(MEProduto.Text));
    if Trim(MeDtInicio.Text) = '' then
       QEstoqueImplantadoCons.SetVariable('DT_INICIAL',Null)
    else
       QEstoqueImplantadoCons.SetVariable('DT_INICIAL',Trim(MeDtInicio.Text));
    QEstoqueImplantadoCons.Open;
  end;
end;

procedure TFEstoqueImplantadoCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEProduto.SetFocus;
end;

end.
