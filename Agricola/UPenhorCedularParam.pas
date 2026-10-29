unit UPenhorCedularParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFPenhorCedularParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    SB1Filial: TSpeedButton;
    ME1Filial: TMaskEdit;
    ed1Filial: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ME1Produto: TMaskEdit;
    SB1Produto: TSpeedButton;
    ed1Produto: TEdit;
    Label3: TLabel;
    ME1AnoSafra: TMaskEdit;
    RG1Situacao: TRadioGroup;
    procedure ME1FilialExit(Sender: TObject);
    procedure SB1FilialClick(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure SB1ProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPenhorCedularParam: TFPenhorCedularParam;

implementation

uses UOracle_cl, UFilialCons, UProdutoCons, UFilial_cl, UProduto_cl;

{$R *.DFM}

procedure TFPenhorCedularParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.Text) <> '' then
    Ed1Filial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1Filial.Text)
  else
    Ed1Filial.Text := 'Todas';
end;

procedure TFPenhorCedularParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    ME1Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME1FilialExit(Self);
end;

procedure TFPenhorCedularParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Produto.Text) <> '' then
    Ed1Produto.Text:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME1Produto.Text)
  else
    Ed1Produto.Text := 'Todos';
end;

procedure TFPenhorCedularParam.SB1ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.showModal = mrOk then
    ME1Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  ME1ProdutoExit(Self);
end;

end.
