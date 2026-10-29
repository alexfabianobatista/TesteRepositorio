unit UProdutoSubstTribCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFProdutoSubstTribCons = class(TFTConsulta)
    SpeedButton1: TSpeedButton;
    MEEstado: TMaskEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    MEFilial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSubstTribCons: TFProdutoSubstTribCons;

implementation

uses UTributacao_cl, UProdutoCons, UProduto_cl, UEstadoCons, UEstado_cl,
  UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFProdutoSubstTribCons.FormCreate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DMTributacao.QProdutoSubstTribCons;
end;

procedure TFProdutoSubstTribCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    METexto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFProdutoSubstTribCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = MrOk then
    MeEstado.Text := DMEstado.QEstadoConsCOD_ESTADO.value;  
end;

procedure TFProdutoSubstTribCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMTributacao do
  begin
    QProdutoSubstTribCons.Close();
    if trim(MeTexto.Text) <> '' then
      QProdutoSubstTribCons.SetVariable('COD_PRODUTO',trim(MeTexto.Text))
    else
      QProdutoSubstTribCons.SetVariable('COD_PRODUTO',null);
    if(trim(MeEstado.Text) <> '') then
      QProdutoSubstTribCons.SetVariable('COD_ESTADO',trim(MeEstado.Text))
    else
      QProdutoSubstTribCons.SetVariable('COD_ESTADO',null);
    if(trim(MEFilial.Text) <> '') then
      QProdutoSubstTribCons.SetVariable('COD_FILIAL',trim(MEFilial.Text))
    else
      QProdutoSubstTribCons.SetVariable('COD_FILIAL',null);
    QProdutoSubstTribCons.Open();
  end;
end;

procedure TFProdutoSubstTribCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    MEFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

end.
