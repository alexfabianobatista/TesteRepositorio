unit UOficinaOrcamentoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, UFmCadastro,
  UFmFilial, UFmMarca, UFmVeiculo, UFmDatas;

type
  TFOficinaOrcamentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm0Filial: TFmFilial;
    Fm0Cadastro: TFmCadastro;
    Fm0Veiculo: TFmVeiculo;
    Fm0Marca: TFmMarca;
    RGAnaliticoSintetico: TRadioGroup;
    Fm0Datas: TFmDatas;
    procedure Fm0VeiculoBtVeiculoClick(Sender: TObject);
    procedure Fm0VeiculoMeVeiculoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaOrcamentoParam: TFOficinaOrcamentoParam;

implementation

uses UVeiculoCons, UOficina_cl, UOracle_cl;

{$R *.dfm}

procedure TFOficinaOrcamentoParam.Fm0VeiculoBtVeiculoClick(
  Sender: TObject);
begin
  inherited;
//  Fm0Veiculo.BtVeiculoClick(Sender);
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    Fm0Veiculo.MEVeiculo.Text := DMOficina.QVeiculoConsCOD_VEICULO.Text;
    Fm0Veiculo.MEVeiculoExit(Self);
  end;
end;

procedure TFOficinaOrcamentoParam.Fm0VeiculoMeVeiculoExit(Sender: TObject);
begin
  inherited;
//  Fm0Veiculo.MeVeiculoExit(Sender);
  if Trim(Fm0Veiculo.MEVeiculo.Text) <> '' then
    Fm0Veiculo.EdVeiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO', 'COD_VEICULO = ' + Trim(Fm0Veiculo.MEVeiculo.Text))
  else
    Fm0Veiculo.EdVeiculo.Text := 'Todos';
end;

end.
