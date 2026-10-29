unit UMediaKm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, Grids, DBGrids, Buttons;

type
  TFMediaKm = class(TForm)
    DSMedia: TDataSource;
    DBGrid1: TDBGrid;
    MEVeiculo: TMaskEdit;
    Label1: TLabel;
    SBVeiculo: TSpeedButton;
    MEProduto: TMaskEdit;
    Label2: TLabel;
    SBProduto: TSpeedButton;
    EdVeiculo: TEdit;
    EdProduto: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    MEData_I: TMaskEdit;
    MEData_F: TMaskEdit;
    Label4: TLabel;
    BBMedia: TBitBtn;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure MEVeiculoChange(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure MEProdutoChange(Sender: TObject);
    procedure BBMediaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMediaKm: TFMediaKm;

implementation

uses  UVeiculoCons, UVeiculo_cl, UOracle_cl, UProdutoCons, UProduto_cl, UDespesaRecup_cl;

{$R *.DFM}

procedure TFMediaKm.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMediaKm.SBVeiculoClick(Sender: TObject);
begin
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
    MEVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFMediaKm.MEVeiculoChange(Sender: TObject);
begin
  if Trim(MEVeiculo.Text) <> '' then
    EdVeiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO','COD_VEICULO = '+Trim(MEVeiculo.Text))
  else
    EdVeiculo.Text := 'SELECIONE UM VEÍCULO';
end;

procedure TFMediaKm.SBProdutoClick(Sender: TObject);
begin
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFMediaKm.MEProdutoChange(Sender: TObject);
begin
  if Trim(MEProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MEProduto.Text))
  else
    EdProduto.Text := 'SELECIONE UM PRODUTO';
end;

procedure TFMediaKm.BBMediaClick(Sender: TObject);
begin
  if Trim(MEVeiculo.Text) = '' then
    Raise Exception.Create('Deve ser Informado um Veículo');
  if Trim(MEProduto.Text) = '' then
    Raise Exception.Create('Deve ser Informado um Produto');
  if Trim(MEData_I.Text) = '' then
    Raise Exception.Create('Data inicial deve ser Informada');
  if Trim(MEData_F.Text) = '' then
    MEData_F.Text := DateToStr(DMOracle.DataServ);
  with DMDespesaRecup do
  begin
    try
      QMedia.Close;
      QMedia.SetVariable('VEICULO',Trim(MEVeiculo.Text));
      QMedia.SetVariable('PRODUTO',Trim(MEProduto.Text));
      QMedia.SetVariable('DATA_I',Trim(MEData_I.Text));
      QMedia.SetVariable('DATA_F',Trim(MEData_F.Text));
      QMedia.Open;
    except
      Raise
    end;
  end;
end;

end.
