unit UCustoVeiculo_CX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFCustoVeiculo_CX = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    SBVeiculo: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit11: TDBEdit;
    BtAvancar: TBitBtn;
    DSPrimario: TDataSource;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBProduto: TSpeedButton;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    DBEdKm: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    MEKm: TMaskEdit;
    MECusto: TMaskEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    Label7: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoVeiculo_CX: TFCustoVeiculo_CX;
  wCusto: Real;
implementation

uses UCustoVeiculoMov_cl, UVeiculoCons, UCaixa_cl, UVeiculo_cl, UOracle_cl,
  UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFCustoVeiculo_CX.FormActivate(Sender: TObject);
begin
 with DMCustoVeiculoMov do
  begin
    QCustoVeiculoMovCad.Close;
    QCustoVeiculoMovCad.Open;
    QCustoVeiculoMovCad.Insert;
    QCustoVeiculoMovCadDT_MOVIMENTO.Value := DMCaixa.QCaixa_MovDT_MOVIMENTO.Value;
    QCustoVeiculoMovCadCOD_CAIXA_MOV.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
    QCustoVeiculoMovCadCOD_HISTORICO.Value := DMCaixa.QCaixa_MovCOD_HISTORICO.Value;
    QCustoVeiculoMovCadCOD_CADASTRO.Value := DMCaixa.QCaixa_MovCOD_CADASTRO.Value;
    MECusto.Text := FormatFloat('#,##0.00',DMCaixa.QCaixa_MovVAL_MOVIMENTO.Value);
  end;
  wCusto := 0;
  DBEdit3.SetFocus;
end;

procedure TFCustoVeiculo_CX.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DSPrimario.DataSet.State in [DSInsert,DSEdit] then
    Raise Exception.Create('Dados não Confirmado - Confirme antes de Sair desta tela');
  DMCustoVeiculoMov.QCustoVeiculoMovCad.Close;
end;

procedure TFCustoVeiculo_CX.DBEdit3Exit(Sender: TObject);
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

procedure TFCustoVeiculo_CX.SBVeiculoClick(Sender: TObject);
begin
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
    DBEdit3Exit(Self);
  end;
end;

procedure TFCustoVeiculo_CX.BtAvancarClick(Sender: TObject);
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
    if wCusto < DMCaixa.QCaixa_MovVAL_MOVIMENTO.Value then //
    begin
      QCustoVeiculoMovCad.Insert;
      QCustoVeiculoMovCadDT_MOVIMENTO.Value := DMCaixa.QCaixa_MovDT_MOVIMENTO.Value;
      QCustoVeiculoMovCadCOD_CAIXA_MOV.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
      QCustoVeiculoMovCadCOD_HISTORICO.Value := DMCaixa.QCaixa_MovCOD_HISTORICO.Value;
      QCustoVeiculoMovCadCOD_CADASTRO.Value := DMCaixa.QCaixa_MovCOD_CADASTRO.Value;
      MECusto.Text := FormatFloat('#,##,0.00',DMCaixa.QCaixa_MovVAL_MOVIMENTO.Value - wCusto);//valor restante
      DBEdit3.SetFocus;
    end
    else
      FCustoVeiculo_CX.Close;//fim lançamento
  end;
end;

procedure TFCustoVeiculo_CX.DBEdit2Exit(Sender: TObject);
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

procedure TFCustoVeiculo_CX.SBProdutoClick(Sender: TObject);
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
