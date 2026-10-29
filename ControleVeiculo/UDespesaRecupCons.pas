unit UDespesaRecupCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFDespesaRecupCons = class(TFTConsulta)
    SBCadastro: TSpeedButton;
    Label2: TLabel;
    MEVeiculo: TMaskEdit;
    SBVeiculo: TSpeedButton;
    Label3: TLabel;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    MEData_I: TMaskEdit;
    Label5: TLabel;
    MEData_F: TMaskEdit;
    procedure SBCadastroClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDespesaRecupCons: TFDespesaRecupCons;

implementation

uses UDespesaRecup_cl, UCadastroCons, UCadastro_cl, UVeiculoCons,
  UVeiculo_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFDespesaRecupCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFDespesaRecupCons.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    MEVeiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFDespesaRecupCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFDespesaRecupCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMDespesaRecup do
  begin
    QDespesaRecupCons.Close;
    if Trim(METexto.Text) = '' then
      QDespesaRecupCons.SetVariable('CADASTRO',NULL)
    else
      QDespesaRecupCons.SetVariable('CADASTRO',Trim(METexto.Text));
    if Trim(MEVeiculo.Text) = '' then
      QDespesaRecupCons.SetVariable('VEICULO',NULL)
    else
      QDespesaRecupCons.SetVariable('VEICULO',Trim(MEVeiculo.Text));
    if Trim(MEProduto.Text) = '' then
      QDespesaRecupCons.SetVariable('PRODUTO',NULL)
    else
      QDespesaRecupCons.SetVariable('PRODUTO',Trim(MEVeiculo.Text));
    if Trim(MEData_I.Text) = '' then
      QDespesaRecupCons.SetVariable('DATA_I',NULL)
    else
      QDespesaRecupCons.SetVariable('DATA_I',Trim(MEData_I.Text));
    if Trim(MEData_F.Text) = '' then
      QDespesaRecupCons.SetVariable('DATA_F',NULL)
    else
      QDespesaRecupCons.SetVariable('DATA_F',Trim(MEData_F.Text));
    QDespesaRecupCons.Open;
  end;
end;

end.
