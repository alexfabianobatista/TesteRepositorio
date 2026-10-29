unit UCustoVeiculoMovCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus,
  UFmProduto, UFmCadastro;

type
  TFCustoVeiculoMovCons = class(TFTConsulta)
    SBVeiculo: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    MEInicio: TMaskEdit;
    Label4: TLabel;
    MEFim: TMaskEdit;
    Label2: TLabel;
    MeNrRequisicao: TMaskEdit;
    FmCadastro1: TFmCadastro;
    FmProduto1: TFmProduto;
    LbTotal: TLabel;
    LblValor: TLabel;
    procedure SBVeiculoClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoVeiculoMovCons: TFCustoVeiculoMovCons;

implementation

uses UCustoVeiculoMov_cl, UVeiculoCons, UVeiculo_cl, UProduto_cl, UprodutoCons,
     UParamSistema_cl;

{$R *.DFM}

procedure TFCustoVeiculoMovCons.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    METexto.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFCustoVeiculoMovCons.BtProcurarClick(Sender: TObject);
var wValorTotal : real;
begin
  inherited;
  with DMCustoVeiculoMov do
  begin
    QCustoVeiculoMovCons.Close;
    if Trim(MEInicio.Text) = '' then
      Raise Exception.Create('A data inicial deve ser Informada');
    if Trim(MEFim.Text) = '' then
      MEFim.Text := DateToStr(Date);
    if Trim(METexto.Text) = '' then
      QCustoVeiculoMovCons.SetVariable('VEICULO', NULL)
    else
      QCustoVeiculoMovCons.SetVariable('VEICULO', METexto.Text);
    if Trim(MeNrRequisicao.Text) = '' then
      QCustoVeiculoMovCons.SetVariable('NUM_NOTA_REQUISICAO', NULL)
    else
      QCustoVeiculoMovCons.SetVariable('NUM_NOTA_REQUISICAO', Trim(MeNrRequisicao.Text));
    //Trans Espíndola precisa dos filtros de produto e cadastro no Movimento Custo Veículo.
    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      QCustoVeiculoMovCons.SetVariable('COD_CADASTRO', Trim(FmCadastro1.MeCadastro.Text))
    else
      QCustoVeiculoMovCons.SetVariable('COD_CADASTRO',NULL);
    if Trim(FmProduto1.MeProduto.Text) <> '' then
      QCustoVeiculoMovCons.SetVariable('COD_PRODUTO', Trim(FmProduto1.MeProduto.Text))
    else
      QCustoVeiculoMovCons.SetVariable('COD_PRODUTO',NULL);
    QCustoVeiculoMovCons.SetVariable('DATA_I',MEInicio.Text);
    QCustoVeiculoMovCons.SetVariable('DATA_F',MEFim.Text);
    QCustoVeiculoMovCons.open;
    wValorTotal := 0;
    QCustoVeiculoMovCons.First;
    while Not QCustoVeiculoMovCons.Eof Do
    begin
      wValorTotal := wValorTotal + QCustoVeiculoMovConsVL_CUSTO.Value;
      QCustoVeiculoMovCons.next;
    end;
    LblValor.Caption := FormatFloat('#,##0.00',wValorTotal);
  end;
end;

procedure TFCustoVeiculoMovCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEInicio.Text := DateToStr(Date-30);
  MEFim.Text := DateToStr(Date);
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    DBGrid1.Columns.Items[2].Visible := False;
    DBGrid1.Columns.Items[4].Visible := False;
    DBGrid1.Columns.Items[8].Visible := True;
    DBGrid1.Columns.Items[12].Index := 4;
  end;

end;

end.
