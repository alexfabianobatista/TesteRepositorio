unit UCustoVeiculo_CP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, DBCtrls, Db, ComCtrls;

type
  TFCustoVeiculo_CP = class(TForm)
    DSPrimario: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdKm: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    SBVeiculo: TSpeedButton;
    BtAvancar: TBitBtn;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBProduto: TSpeedButton;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    MEKm: TMaskEdit;
    MECusto: TMaskEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAvancarClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wValServico: Real;
  end;

var
  FCustoVeiculo_CP: TFCustoVeiculo_CP;
  wCusto: Real;

implementation

uses UCustoVeiculoMov_cl, UOracle_cl, UVeiculoCons, UVeiculo_cl,
  UContasPagar_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFCustoVeiculo_CP.DBEdit3Exit(Sender: TObject);
begin
  with DMCustoVeiculoMov do
  begin
    if Trim(QCustoVeiculoMovCadCOD_VEICULO.Text) <> '' then
    begin
      if QCustoVeiculoMovCad.State in [DSInsert,DSEdit] then
      begin
        QCustoVeiculoMovCadNUM_VEICULO.Text := DMOracle.BuscaNome('SELECT NUM_VEICULO FROM TB_VEICULO',
                                                                  'COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text);
        MEKm.Text := DMOracle.BuscaNome('SELECT KM_ATUAL FROM TB_VEICULO','COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text);
        if Trim(MEKm.Text) <> '' then
          MEKm.Text := FormatFloat('#,##0.00',StrToFloat(MEKm.Text));
      end;
    end
    else
    begin
      if QCustoVeiculoMovCad.State in [DSInsert,DSEdit] then
      begin
        QCustoVeiculoMovCadNUM_VEICULO.Text := '';
        MEKm.Text := '';
      end;
    end;
  end;
end;

procedure TFCustoVeiculo_CP.SBVeiculoClick(Sender: TObject);
begin
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
    DBEdit3Exit(Self);
  end;
end;

procedure TFCustoVeiculo_CP.FormActivate(Sender: TObject);
begin
  with DMCustoVeiculoMov do
  begin
    QCustoVeiculoMovCad.Close;
    QCustoVeiculoMovCad.Open;
    QCustoVeiculoMovCad.Insert;
    QCustoVeiculoMovCadCOD_CONTA_PAGAR_CAB.Value := DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
    QCustoVeiculoMovCadCOD_FINALIDADE.Value := DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Value;
    QCustoVeiculoMovCadDT_MOVIMENTO.Value := DMContasPagar.QContasPagar_CabDT_EMISSAO.Value;
    QCustoVeiculoMovCadCOD_CADASTRO.Value := DMContasPagar.QContasPagar_CabCOD_CADASTRO.Value;
    MECusto.Text := FormatFloat('#,##0.00',DMContasPagar.QContasPagar_CabVAL_TITULO.Value+wValServico);
  end;
  wCusto := 0;
  DBEdit3.SetFocus;
end;

procedure TFCustoVeiculo_CP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DSPrimario.DataSet.State in [DSInsert,DSEdit] then
    Raise Exception.Create('Dados não Confirmado - Confirme antes de Sair desta tela');
  DMCustoVeiculoMov.QCustoVeiculoMovCad.Close;
  wValServico := 0.0;
end;

procedure TFCustoVeiculo_CP.BtAvancarClick(Sender: TObject);
begin
  with DMCustoVeiculoMov do
  begin
    if Trim(QCustoVeiculoMovCadCOD_VEICULO.Text) = '' then
      Raise Exception.Create('Veículo deve ser Informado para esta Conta');
    if Trim(QCustoVeiculoMovCadVL_CUSTO.Text) = '' then
    begin
      DBEdit5.SetFocus;
      Raise Exception.Create('Valor Custo não Informado');
    end;
    wCusto := wCusto + QCustoVeiculoMovCadVL_CUSTO.Value;//armazena o total
    QCustoVeiculoMovCad.Post;
    if wCusto < DMContasPagar.QContasPagar_CabVAL_TITULO.Value+wValServico then //
    begin
      QCustoVeiculoMovCad.Insert;
      QCustoVeiculoMovCadCOD_CONTA_PAGAR_CAB.Value := DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
      QCustoVeiculoMovCadCOD_FINALIDADE.Value := DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Value;
      QCustoVeiculoMovCadDT_MOVIMENTO.Value := DMContasPagar.QContasPagar_CabDT_EMISSAO.Value;
      QCustoVeiculoMovCadCOD_CADASTRO.Value := DMContasPagar.QContasPagar_CabCOD_CADASTRO.Value;
      MECusto.Text := FormatFloat('#,##,0.00',DMContasPagar.QContasPagar_CabVAL_TITULO.Value + wValServico - wCusto);//valor restante
      DBEdit3.SetFocus;
    end
    else
      FCustoVeiculo_CP.Close;//fim lançamento
  end;
end;

procedure TFCustoVeiculo_CP.DBEdit2Exit(Sender: TObject);
begin
  with DMCustoVeiculoMov do
  begin
    if Trim(QCustoVeiculoMovCadind_tp_produto.Value) <> 'VEICULO' then
    begin
      DBEdit2.Clear;
      DBEdit2.SetFocus;
      Raise Exception.Create('Produto Inválido - Este produto não é do Tipo Veículo');
    end;
    if Trim(QCustoVeiculoMovCadind_km.Value) = 'N' then
    begin
      DBEdKm.Color := clBtnFace;
      DBEdKm.ReadOnly := True;
      DBEdKm.TabStop := False;
      DBEdit5.SetFocus;
    end
    else
    begin
      DBEdKm.Color := clWindow;
      DBEdKm.ReadOnly := False;
      DBEdKm.TabStop := True;
      DBEdKm.SetFocus;
    end
  end;
end;

procedure TFCustoVeiculo_CP.SBProdutoClick(Sender: TObject);
begin
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    DBEdit2Exit(Self);
  end;
end;

end.
