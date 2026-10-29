unit UCustoVeiculoMovCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel, UFmLote;

type
  TFCustoVeiculoMovCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdKm: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    SBVeiculo: TSpeedButton;
    SBProduto: TSpeedButton;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label14: TLabel;
    DBEdit17: TDBEdit;
    RelCustoporVeculo1: TMenuItem;
    MEKm: TMaskEdit;
    Label15: TLabel;
    RelGastoVeculo1: TMenuItem;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    SBCadastro: TSpeedButton;
    DBEdit21: TDBEdit;
    RelMdia1: TMenuItem;
    ResumodeDespesasdeVeculo1: TMenuItem;
    RelGastoVeculo21: TMenuItem;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    RelatrioReceitaseDespesasdeVeculos1: TMenuItem;
    Label21: TLabel;
    DBEdit23: TDBEdit;
    Opes1: TMenuItem;
    OpConfirmaEstoque: TMenuItem;
    OpVoltaEstoque: TMenuItem;
    DBPLote: TDBPanel;
    Label22: TLabel;
    MEHr: TMaskEdit;
    Label23: TLabel;
    DBEHR: TDBEdit;
    LbValUni: TLabel;
    DBEValUn: TDBEdit;
    RelCustoVeiculoReqNF1: TMenuItem;
    LblVlDesc: TLabel;
    DBEVlDesc: TDBEdit;
    RelRequisicaoVeiculo: TMenuItem;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBCadastroProdutorClick(Sender: TObject);
    procedure SpeedButton1Click2(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure RelMovCustoVeculo1Click(Sender: TObject);
    procedure RelMovCustoporVeculo1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelGastoVeculo1Click(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure RelMdia1Click(Sender: TObject);
    procedure ResumodeDespesasdeVeculo1Click(Sender: TObject);
    procedure RelGastoVeculo21Click(Sender: TObject);
    procedure RelatrioReceitaseDespesasdeVeculos1Click(Sender: TObject);
    procedure OpVoltaEstoqueClick(Sender: TObject);
    procedure OpConfirmaEstoqueClick(Sender: TObject);
    procedure DBPLoteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBEdit1Change(Sender: TObject);
    procedure SBCadastroProdClick(Sender: TObject);
    procedure RelCustoVeiculoReqNF1Click(Sender: TObject);
    procedure DBPLoteCodigoExit(Sender: TObject);
    procedure DBPLoteAfterConsulta(Sender: TObject);
    procedure RelRequisicaoVeiculoClick(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoVeiculoMovCad: TFCustoVeiculoMovCad;

implementation

uses UCustoVeiculoMov_cl, UVeiculoCons, UVeiculo_cl, UCustoVeiculoMovCons,
  UProdutoCons, UProduto_cl,UOracle_cl, UControleVeiculoParam,
  URCustoVeiculoMov, UFRCustoPorVeiculo, URGastoVeiculo, UCadastroCons,
  UCadastro_cl, URMedia, URResumoDespesas, URGastoVeiculo2,
  UrReceitaDespesasVeiculos, UEstoque_cl, UNotaSaida_cl, UTipoLoteCons, UParamSistema_cl,
  DateUtils, URCustoVeiculoReqNF, UrReceitaDespesasVeiculosSintetico, URReceitaDespesasVeiculosMensal,
  URRequisicaoVeiculo;

{$R *.DFM}

procedure TFCustoVeiculoMovCad.DSPrimarioStateChange(Sender: TObject);
var
  wEstoque : string;
begin
  inherited;
  SBVeiculo.Enabled := SBConfirmar.Enabled;
  SBProduto.Enabled := SBConfirmar.Enabled;
  SBCadastro.Enabled := SBConfirmar.Enabled;

  if DMCustoVeiculoMov.QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = 'N' then
    begin
      OpConfirmaEstoque.Enabled := true;
      OpVoltaEstoque.Enabled := false;
    end
  else if DMCustoVeiculoMov.QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = 'S' then
    begin
      OpConfirmaEstoque.Enabled := false;
      OpVoltaEstoque.Enabled := true;
    end;
end;

procedure TFCustoVeiculoMovCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
  DBEdit2Exit(Self);
end;

procedure TFCustoVeiculoMovCad.SBProdutoClick(Sender: TObject);
var wCodFilialVeic : string;
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    if (DMParamSistema.CodEmpresa = 'TOMATESMI') then
    begin
      DMCustoVeiculoMov.QCustoVeiculoMovCadVL_UNITARIO.Value := StrToFloat('0'+DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
            'COD_PRODUTO = ' + FloatToStr(DMProduto.QProdutoConsCOD_PRODUTO.Value) +
            ' AND COD_FILIAL = 1 AND COD_LOTE_TIPO = 1') );// + IntToStr(1) );
      DBEdit20.SetFocus;
    end;
    if (DMParamSistema.CodEmpresa = 'ITATIBA') then
    begin
      wCodFilialVeic := DMOracle.FastSelect('COD_FILIAL','TB_VEICULO','COD_VEICULO = '
                              + IntToStr(DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value) );
      DMCustoVeiculoMov.QCustoVeiculoMovCadVL_UNITARIO.Value := StrToFloat('0'+DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
              'COD_PRODUTO = ' + FloatToStr(DMProduto.QProdutoConsCOD_PRODUTO.Value) +
             ' AND COD_FILIAL = ' + wCodFilialVeic + ' AND COD_LOTE_TIPO = 1') );
      DBEdit20.SetFocus;
    end;
    if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
      DBPLote.DBEdit.SetFocus;
  end;
end;

procedure TFCustoVeiculoMovCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCustoVeiculoMov.QCustoVeiculoMovCad.Open;
  if (DMParamSistema.CodEmpresa <> 'ESPINDOLA') and (DMParamSistema.CodEmpresa <> 'MATRANSP') and (DMParamSistema.CodEmpresa <> 'TOMATESMI') and (DMParamSistema.CodEmpresa <> 'ITATIBA') then
  begin
    LbValUni.Visible := False;
    DBEValUn.Visible := False;
    DBEdit5.Enabled := True;
    LblVlDesc.Visible := False;
    DBEVlDesc.Visible := False;
    Label5.Left  := 277;
    DBEdit5.Left := 277;
    Label6.Left  := 350;
    DBEdit6.Left := 350;
  end;
  
end;

procedure TFCustoVeiculoMovCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCustoVeiculoMov.QCustoVeiculoMovCad.Close;
end;

procedure TFCustoVeiculoMovCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCustoVeiculoMovCons = nil then
    FCustoVeiculoMovCons := TFCustoVeiculoMovCons.Create(Application);
  if FCustoVeiculoMovCons.showModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QCustoVeiculoMovCad.Close;
      QCustoVeiculoMovCad.SetVariable('PK',QCustoVeiculoMovConsCOD_CUSTO_VEICULO_MOV.Value);
      QCustoVeiculoMovCad.Open;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.SBCadastroProdutorClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    DMCustoVeiculoMov.QCustoVeiculoMovCadNUM_VEICULO.Value := DMVeiculo.QVeiculoConsNUM_VEICULO.Value;
end;

procedure TFCustoVeiculoMovCad.SpeedButton1Click2(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    DMCustoVeiculoMov.QCustoVeiculoMovCadNUM_VEICULO.Value := DMVeiculo.QVeiculoConsNUM_VEICULO.Value;
end;

procedure TFCustoVeiculoMovCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  with DMCustoVeiculoMov do
  begin
    if Trim(QCustoVeiculoMovCadCOD_VEICULO.Text) <> '' then
    begin
      //if QCustoVeiculoMovCad.State in [DSInsert,DSEdit] then
      begin
        QCustoVeiculoMovCadNUM_VEICULO.Text := DMOracle.BuscaNome('SELECT NUM_VEICULO FROM TB_VEICULO',
                                                                  'COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text);
        MEKm.Text := DMOracle.BuscaNome('SELECT KM_ATUAL FROM TB_VEICULO','COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text);
        MEHr.Text := DMOracle.BuscaNome('SELECT HR_ATUAL FROM TB_VEICULO','COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text);
        if Trim(MEKm.Text) <> '' then
          MEKm.Text := FormatFloat('#,##0',StrToFloat(MEKm.Text))
        else if Trim(MEHr.Text) <> '' then
          MEHr.Text := FormatFloat('#,##0.00',StrToFloat(MEHr.Text));
      end;
    end
    else
    begin
      if QCustoVeiculoMovCad.State in [DSInsert,DSEdit] then
      begin
        QCustoVeiculoMovCadNUM_VEICULO.Text := '';
        MEKm.Text := '';
        MEHr.Text := '';
      end;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.SBAlterarClick(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa <> 'ESPINDOLA') and (DMParamSistema.CodEmpresa <> 'MATRANSP') then
  begin
    with DMCustoVeiculoMov do
    begin
      if (Trim(QCustoVeiculoMovCadCOD_NOTA_ITEM.Text) <> '') or
         (Trim(QCustoVeiculoMovCadCOD_CONTA_PAGAR_CAB.Text) <> '') or
         (Trim(QCustoVeiculoMovCadCOD_CAIXA_MOV.Text) <> '') then
        Raise Exception.Create('Não é possível alterar um Mov. de Custo gerado por uma Nota/Conta Pagar/Caixa');
    end;
  end;

  if DMCustoVeiculoMov.QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Text = 'S' then
    Raise Exception.Create('Não é possível alterar um Movimento de Custo que já foi baixado do estoque.');

  inherited;
end;

procedure TFCustoVeiculoMovCad.SBExcluirClick(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa <> 'ESPINDOLA') and (DMParamSistema.CodEmpresa <> 'MATRANSP') then
  begin
    with DMCustoVeiculoMov do
    begin
      if (Trim(QCustoVeiculoMovCadCOD_NOTA_ITEM.Text) <> '') or
         (Trim(QCustoVeiculoMovCadCOD_CONTA_PAGAR_CAB.Text) <> '') or
         (Trim(QCustoVeiculoMovCadCOD_CAIXA_MOV.Text) <> '') then
        Raise Exception.Create('Não é possível excluir um Mov. de Custo gerado por uma Nota/Conta Pagar/Caixa');
    end;
  end;
  inherited;
end;

procedure TFCustoVeiculoMovCad.RelMovCustoVeculo1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRCustoVeiculoMov.Close;
      if Trim(FControleVeiculoParam.ME1Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME1Data_F.Text) = '' then
        FControleVeiculoParam.ME1Data_F.Text := DateToStr(Date);
      QRCustoVeiculoMov.SetVariable('DATA_I',FControleVeiculoParam.ME1Data_I.Text);
      QRCustoVeiculoMov.SetVariable('DATA_F',FControleVeiculoParam.ME1Data_F.Text);
      if Trim(FControleVeiculoParam.ME1Veiculo.Text) <> '' then
        QRCustoVeiculoMov.SetVariable('VEICULO',FControleVeiculoParam.ME1Veiculo.Text)
      else
        QRCustoVeiculoMov.SetVariable('VEICULO',NULL);
      if FControleVeiculoParam.RG1Tipo.ItemIndex = 0 then
        QRCustoVeiculoMov.SetVariable('TIPO','CONTA PAGAR')
      else if FControleVeiculoParam.RG1Tipo.ItemIndex = 1 then
        QRCustoVeiculoMov.SetVariable('TIPO','CAIXA')
      else if FControleVeiculoParam.RG1Tipo.ItemIndex = 2 then
        QRCustoVeiculoMov.SetVariable('TIPO','NOTA')
      else if FControleVeiculoParam.RG1Tipo.ItemIndex = 3 then
        QRCustoVeiculoMov.SetVariable('TIPO','OUTROS')
      else
        QRCustoVeiculoMov.SetVariable('TIPO',NULL);
      QRCustoVeiculoMov.Open;
      if FRCustoVeiculoMov = nil then
        FRCustoVeiculoMov := TFRCustoVeiculoMov.Create(Application);
      FRCustoVeiculoMov.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME1Data_I.Text+
                                                      ' Até '+FControleVeiculoParam.ME1Data_F.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRCustoVeiculoMov.QRPrimario.Preview
      else
        FRCustoVeiculoMov.QRPrimario.Print;
      QRCustoVeiculoMov.Close;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.RelMovCustoporVeculo1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[2].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRCustoPorVeiculo.Close;
      if Trim(FControleVeiculoParam.ME2Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME2Data_F.Text) = '' then
        FControleVeiculoParam.ME2Data_F.Text := DateToStr(Date);
      QRCustoPorVeiculo.SetVariable('DATA_I',FControleVeiculoParam.ME2Data_I.Text);
      QRCustoPorVeiculo.SetVariable('DATA_F',FControleVeiculoParam.ME2Data_F.Text);
      if Trim(FControleVeiculoParam.ME2Veiculo.Text) <> '' then
        QRCustoPorVeiculo.SetVariable('VEICULO',FControleVeiculoParam.ME2Veiculo.Text)
      else
        QRCustoPorVeiculo.SetVariable('VEICULO',NULL);
      if Trim(FControleVeiculoParam.ME2Produto.Text) <> '' then
        QRCustoPorVeiculo.SetVariable('PRODUTO',FControleVeiculoParam.ME2Produto.Text)
      else
        QRCustoPorVeiculo.SetVariable('PRODUTO',NULL);
      if Trim(FControleVeiculoParam.Fm2Cadastro.MeCadastro.Text) <> '' then
        QRCustoPorVeiculo.SetVariable('COD_CADASTRO',Trim(FControleVeiculoParam.Fm2Cadastro.MeCadastro.Text))
      else
        QRCustoPorVeiculo.SetVariable('COD_CADASTRO',NULL);
      if Trim(FControleVeiculoParam.CB2Classificacao.Text) <> 'TODOS' then
        QRCustoPorVeiculo.SetVariable('CLASSIFICACAO',FControleVeiculoParam.CB2Classificacao.Text)
      else
        QRCustoPorVeiculo.SetVariable('CLASSIFICACAO',NULL);
      if Trim(FControleVeiculoParam.CB2Tipo.Text) <> 'TODOS' then
        QRCustoPorVeiculo.SetVariable('TIPO',FControleVeiculoParam.CB2Tipo.Text)
      else
        QRCustoPorVeiculo.SetVariable('TIPO',NULL);

      QRCustoPorVeiculo.Open;
      if FRCustoPorVeiculo = nil then
        FRCustoPorVeiculo := TFRCustoPorVeiculo.Create(Application);
      FRCustoPorVeiculo.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME2Data_I.Text+
                                                      ' Até '+FControleVeiculoParam.ME2Data_F.Text;
      FRCustoPorVeiculo.QRLPlaca.Caption := 'Placa: '+FControleVeiculoParam.Ed2Placa.Text;
      FRCustoPorVeiculo.QRLClassificacao.Caption := 'Classificação: '+FControleVeiculoParam.CB2Classificacao.Text;
      FRCustoPorVeiculo.QRLTipo.Caption := 'Tipo Movimento: '+Trim(FControleVeiculoParam.CB2Tipo.Text);
      FRCustoPorVeiculo.qrlcadastro.Caption := 'Cadastro: ' + Trim(FControleVeiculoParam.Fm2Cadastro.EdCadastro.Text);

      if DMParamSistema.CodEmpresa = 'ITATIBA' then
      begin
        //FRCustoPorVeiculo.QRDBText6.DataField := 'DESC_CARACTERISTICA';
        FRCustoPorVeiculo.QRDBText1.DataField := 'DESC_CARACTERISTICA';
        FRCustoPorVeiculo.QRLabel3.Caption := 'Desc.: ';
        //FRCustoPorVeiculo.QRLabel3.Enabled := False;
        //FRCustoPorVeiculo.QRDBText1.Visible := False;
        //FRCustoPorVeiculo.QRDBText1.Enabled := False;
      end;

      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRCustoPorVeiculo.QRPrimario.Preview
      else
        FRCustoPorVeiculo.QRPrimario.Print;
      QRCustoPorVeiculo.Close;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit, DsInsert] then
    with DMCustoVeiculoMov do
    begin
{      if Trim(QCustoVeiculoMovCadind_tp_produto.Value) <> 'VEICULO' then
      begin
        DBEdit3.Clear;
        DBEdit3.SetFocus;
        Raise Exception.Create('Produto Inválido - Este produto não é do Tipo Veículo');
      end;
}      if Trim(QCustoVeiculoMovCadind_km.Value) = 'N' then
      begin
        DBEdKm.Color    := clBtnFace;
        DBEdKm.ReadOnly := True;
        DBEdKm.TabStop  := False;
        DBEHR.Color     := clBtnFace;
        DBEHr.ReadOnly  := True;
        DBEHR.TabStop   := False;
        DBEdit22.SetFocus;
      end
      else
      begin
        DBEdKm.Color    := clWindow;
        DBEdKm.ReadOnly := False;
        DBEdKm.TabStop  := True;
        DBEHR.Color     := clWindow;
        DBEHR.ReadOnly  := False;
        DBEHR.TabStop   := True;
        DBEdit22.SetFocus;
      end;
    end;
end;

procedure TFCustoVeiculoMovCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(8);
end;

procedure TFCustoVeiculoMovCad.RelGastoVeculo1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[3].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRGastoVeiculo.Close;
      if Trim(FControleVeiculoParam.ME3Veiculo.Text) = '' then
        Raise Exception.Create('Selecione um Veículo');
      {if Trim(FControleVeiculoParam.ME3Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME3Data_F.Text) = '' then
        FControleVeiculoParam.ME3Data_F.Text := DateToStr(Date);}
      if Trim(FControleVeiculoParam.ME3Produto.Text) = '' then
        QRGastoVeiculo.SetVariable('PRODUTO',NULL)
      else
        QRGastoVeiculo.SetVariable('PRODUTO',FControleVeiculoParam.ME3Produto.Text);
      QRGastoVeiculo.SetVariable('VEICULO',FControleVeiculoParam.ME3Veiculo.Text);

      if((FControleVeiculoParam.ME3Data_I.Text <> '') and (FControleVeiculoParam.ME3Data_F.Text <> '')) then
      begin
        QRGastoVeiculo.SetVariable('DATA_I',FControleVeiculoParam.ME3Data_I.Text);
        QRGastoVeiculo.SetVariable('DATA_F',FControleVeiculoParam.ME3Data_F.Text);
      end
      else
          Raise Exception.Create('Período de EMISSÃO deve ser informado');

      if((FControleVeiculoParam.Me3DataMovimento_I.Text <> '') and (FControleVeiculoParam.Me3DataMovimento_F.Text <> '')) then
      begin
          QRGastoVeiculo.SetVariable('DATA_MOVIMENTO_I',FControleVeiculoParam.ME3DataMovimento_I.Text);
          QRGastoVeiculo.SetVariable('DATA_MOVIMENTO_F',FControleVeiculoParam.ME3DataMovimento_F.Text);
      end
      else
        Raise Exception.Create('Período do MOVIMENTO deve ser informado');


      QRGastoVeiculo.Open;
      if FRGastoVeiculo = nil then
        FRGastoVeiculo := TFRGastoVeiculo.Create(Application);
      FRGastoVeiculo.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME3Data_I.Text+
                                           ' Até '+FControleVeiculoParam.ME3Data_F.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRGastoVeiculo.QRPrimario.Preview
      else
        FRGastoVeiculo.QRPrimario.Print;
      QRGastoVeiculo.Close;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFCustoVeiculoMovCad.RelMdia1Click(Sender: TObject);
begin
  inherited;
   if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[5].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRMedia.Close;
      if Trim(FControleVeiculoParam.ME5Veiculo.Text) = '' then
        Raise Exception.Create('Selecione um Veículo');
      if Trim(FControleVeiculoParam.ME5Produto.Text) = '' then
        Raise Exception.Create('Selecione um Produto');
      if Trim(FControleVeiculoParam.ME5Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME5Data_F.Text) = '' then
        FControleVeiculoParam.ME5Data_F.Text := DateToStr(Date);
      QRMedia.SetVariable('PRODUTO',FControleVeiculoParam.ME5Produto.Text);
      QRMedia.SetVariable('VEICULO',FControleVeiculoParam.ME5Veiculo.Text);
      QRMedia.SetVariable('DATA_I',FControleVeiculoParam.ME5Data_I.Text);
      QRMedia.SetVariable('DATA_F',FControleVeiculoParam.ME5Data_F.Text);
      QRMedia.Open;
      if FRMedia = nil then
         FRMedia := TFRMedia.Create(Application);
      FRMedia.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME5Data_I.Text+
                                            ' Até '+FControleVeiculoParam.ME5Data_F.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRMedia.QRPrimario.Preview
      else
        FRMedia.QRPrimario.Print;
      QRMedia.Close;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.ResumodeDespesasdeVeculo1Click(
  Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[6].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRResumoDespesa.Close;

      if (((FControleVeiculoParam.ME6DtInicial.Text) = '') or ((FControleVeiculoParam.ME6DtFinal.Text) = ''))then
        Raise Exception.Create('Data inicial deve ser Informada');
        QRResumoDespesa.SetVariable('DT_INICIAL',FControleVeiculoParam.ME6DtInicial.Text);
        QRResumoDespesa.SetVariable('DT_FINAL',FControleVeiculoParam.ME6DtFinal.Text);
      if Trim(FControleVeiculoParam.ME6Filial.Text) = '' then
        QRResumoDespesa.SetVariable('FILIAL',NULL)
      else
        QRResumoDespesa.SetVariable('FILIAL',FControleVeiculoParam.ME6Filial.Text);
      QRResumoDespesa.Open;
      if FRResumoDespesas = nil then
        FRResumoDespesas := TFRResumoDespesas.Create(Application);
      FRResumoDespesas.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME6DtInicial.Text+
                                           ' Até '+FControleVeiculoParam.ME6DtFinal.Text;
      FRResumoDespesas.QRLFilial.Caption := 'Filial:' + FControleVeiculoParam.Ed6Filial.text;                                     
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRResumoDespesas.QRPrimario.Preview
      else
        FRResumoDespesas.QRPrimario.Print;
      QRResumoDespesa.Close;
    end;
  end;

end;

procedure TFCustoVeiculoMovCad.RelGastoVeculo21Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[7].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRGastoVeiculo2.Close;
      if Trim(FControleVeiculoParam.FmVeiculo8.MeVeiculo.Text) = '' then
        Raise Exception.Create('Selecione um Veículo');
      if Trim(FControleVeiculoParam.ME8Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME8Data_F.Text) = '' then
        FControleVeiculoParam.ME8Data_F.Text := DateToStr(Date);
      if Trim(FControleVeiculoParam.FmProduto8.MeProduto.Text) = '' then
        QRGastoVeiculo2.SetVariable('PRODUTO',NULL)
      else
        QRGastoVeiculo2.SetVariable('PRODUTO',Trim(FControleVeiculoParam.FmProduto8.MeProduto.Text));
      QRGastoVeiculo2.SetVariable('VEICULO',Trim(FControleVeiculoParam.FmVeiculo8.MeVeiculo.Text));
      QRGastoVeiculo2.SetVariable('DATA_I', Trim(FControleVeiculoParam.ME8Data_I.Text));
      QRGastoVeiculo2.SetVariable('DATA_F', Trim(FControleVeiculoParam.ME8Data_F.Text));
      QRGastoVeiculo2.Open;

      if FRGastoVeiculo2 = nil then
        FRGastoVeiculo2 := TFRGastoVeiculo2.Create(Application);
      FRGastoVeiculo2.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME8Data_I.Text+
                                           ' Até '+FControleVeiculoParam.ME8Data_F.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRGastoVeiculo2.QRPrimario.Preview
      else
        FRGastoVeiculo2.QRPrimario.Print;
      QRGastoVeiculo2.Close;
    end;
  end;
end;

procedure TFCustoVeiculoMovCad.RelatrioReceitaseDespesasdeVeculos1Click(
  Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[8].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      if FControleVeiculoParam.RGAnaliticoSintetico9.ItemIndex = 0 then  //Relatório Analítico
      begin
        QRCustoVeiculo_Receita.Close;
        if Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text) = '' then
          Raise Exception.Create('Data inicial deve ser Informada');
        if Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text) = '' then
          FControleVeiculoParam.FmDatas9.MeDtFinal.Text := DateToStr(Date);
         //Veículo
        if Trim(FControleVeiculoParam.MeVeiculo9.Text) <> '' then
        begin
          QRCustoVeiculo_Receita.SetVariable('VEICULO', 'TB_CUSTO_VEICULO_MOV.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');
          QRCustoVeiculo_Receita.SetVariable('VEICULO2', 'TB_DESPESA_RECUP.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');
        end
        else
        begin
          QRCustoVeiculo_Receita.SetVariable('VEICULO', '1=1');
          QRCustoVeiculo_Receita.SetVariable('VEICULO2', '1=1');
        end;
        //Proprietário Veículo
        if Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_Receita.SetVariable('COD_PROPRIETARIO', Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text))
        else
          QRCustoVeiculo_Receita.SetVariable('COD_PROPRIETARIO', Null);
          //Jefferson 29-08
        if Trim(FControleVeiculoParam.CB3Classificacao.Text) <> 'TODOS' then
          QRCustoVeiculo_Receita.SetVariable('CLASSIFICACAO',FControleVeiculoParam.CB3Classificacao.Text)
        else
          QRCustoVeiculo_Receita.SetVariable('CLASSIFICACAO',NULL);

        if Trim(FControleVeiculoParam.FmCadastro9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_Receita.SetVariable('COD_CADASTRO',FControleVeiculoParam.FmCadastro9.MeCadastro.Text)
        else
          QRCustoVeiculo_Receita.SetVariable('COD_CADASTRO',NULL);

        QRCustoVeiculo_Receita.SetVariable('DATA_I', Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text));
        QRCustoVeiculo_Receita.SetVariable('DATA_F', Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text));

        QRCustoVeiculo_Receita.Open;

        if FrReceitaDespesasVeiculos = nil then
          FrReceitaDespesasVeiculos := TFrReceitaDespesasVeiculos.Create(Application);
        FrReceitaDespesasVeiculos.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.FmDatas9.MeDtInicial.Text+
                                             ' Até '+FControleVeiculoParam.FmDatas9.MeDtFinal.Text;
        FrReceitaDespesasVeiculos.QRL1Classificacao.Caption := ('Classificação: '+ FControleVeiculoParam.CB3Classificacao.Text);
        if DMParamSistema.CodEmpresa = 'TOMATESMI' then
        begin
          FrReceitaDespesasVeiculos.QRLTitulo.Caption := 'Relatório de despesas e receitas de Estufas';
          FrReceitaDespesasVeiculos.QRLabel3.Enabled := False;
          FrReceitaDespesasVeiculos.QRDBText2.DataField := 'DESC_CARACTERISTICA';

        end;
        if DMParamSistema.CodEmpresa = 'ITATIBA' then
          FrReceitaDespesasVeiculos.QRDBText2.DataField := 'DESC_CARACTERISTICA';

        if FControleVeiculoParam.RGAgrupar9.ItemIndex = 0 then
        begin
          FrReceitaDespesasVeiculos.QRGroup1.Expression := 'QRCustoVeiculo_Receita.NUM_PLACA';
          //FrReceitaDespesasVeiculos.QRSummary.Enabled := False;
        end
        else
        begin
          FrReceitaDespesasVeiculos.QRGroup1.Expression := 'QRCustoVeiculo_Receita.NUM_REQUISICAO';
          //FrReceitaDespesasVeiculos.QRSummary.Enabled := True;
        end;
        if DMParamSistema.CodEmpresa = 'NFCE-ROBER' then
        begin
          FrReceitaDespesasVeiculos.QRDBDescObservacao.DataField := 'DESC_OBSERVACAO2';
        end;
        if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
          FrReceitaDespesasVeiculos.QRPrimario.Preview
        else
          FrReceitaDespesasVeiculos.QRPrimario.Print;
        QRCustoVeiculo_Receita.Close;
      end
      else if FControleVeiculoParam.RGAnaliticoSintetico9.ItemIndex = 1 then  //Relatório Sintético
      begin
        QRCustoVeiculo_ReceitaSintetico.Close;
        if Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text) = '' then
          Raise Exception.Create('Data inicial deve ser Informada');
        if Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text) = '' then
          FControleVeiculoParam.FmDatas9.MeDtFinal.Text := DateToStr(Date);
         //Veículo
        if Trim(FControleVeiculoParam.MeVeiculo9.Text) <> '' then
        begin
          QRCustoVeiculo_ReceitaSintetico.SetVariable('VEICULO', 'TB_CUSTO_VEICULO_MOV.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');
          QRCustoVeiculo_ReceitaSintetico.SetVariable('VEICULO2', 'TB_DESPESA_RECUP.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');

        end
        else
        begin
          QRCustoVeiculo_ReceitaSintetico.SetVariable('VEICULO', '1=1');
          QRCustoVeiculo_ReceitaSintetico.SetVariable('VEICULO2', '1=1');
        end;
        //Proprietário Veículo
        if Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_ReceitaSintetico.SetVariable('COD_PROPRIETARIO',Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text))
        else
        QRCustoVeiculo_ReceitaSintetico.SetVariable('COD_PROPRIETARIO',Null);

        if Trim(FControleVeiculoParam.FmCadastro9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_ReceitaSintetico.SetVariable('COD_CADASTRO',FControleVeiculoParam.FmCadastro9.MeCadastro.Text)
        else
          QRCustoVeiculo_ReceitaSintetico.SetVariable('COD_CADASTRO',NULL);

        QRCustoVeiculo_ReceitaSintetico.SetVariable('DATA_I', Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text));
        QRCustoVeiculo_ReceitaSintetico.SetVariable('DATA_F', Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text));
        QRCustoVeiculo_ReceitaSintetico.Open;

        if FrReceitaDespesasVeiculosSintetico = nil then
          FrReceitaDespesasVeiculosSintetico := TFrReceitaDespesasVeiculosSintetico.Create(Application);
        FrReceitaDespesasVeiculosSintetico.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.FmDatas9.MeDtInicial.Text+
                                             ' Até '+FControleVeiculoParam.FmDatas9.MeDtFinal.Text;
        FrReceitaDespesasVeiculos.QRL1Classificacao.Caption := ('Classificação: '+ FControleVeiculoParam.CB3Classificacao.Text);
        if (DMParamSistema.CodEmpresa = 'TOMATESMI') then
        begin
          FrReceitaDespesasVeiculosSintetico.QRLTitulo.Caption := 'Relatório de despesas e receitas de estufas sintético';
          FrReceitaDespesasVeiculosSintetico.QRLabel3.Enabled := False;
          FrReceitaDespesasVeiculosSintetico.QRDBText2.DataField := 'DESC_CARACTERISTICA';
        end;
        if (DMParamSistema.CodEmpresa = 'ITATIBA') then
          FrReceitaDespesasVeiculosSintetico.QRDBText2.DataField := 'DESC_CARACTERISTICA';


        if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
          FrReceitaDespesasVeiculosSintetico.QRPrimario.Preview
        else
          FrReceitaDespesasVeiculosSintetico.QRPrimario.Print;
        QRCustoVeiculo_ReceitaSintetico.Close;
      end
      else // Relatório Mensal
      begin
        QRCustoVeiculo_ReceitaMensal.Close;
        if Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text) = '' then
          Raise Exception.Create('Data inicial deve ser Informada');
        if Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text) = '' then
          FControleVeiculoParam.FmDatas9.MeDtFinal.Text := DateToStr(Date);
        //Veículo
        if Trim(FControleVeiculoParam.MeVeiculo9.Text) <> '' then
        begin
          QRCustoVeiculo_ReceitaMensal.SetVariable('VEICULO', 'TB_CUSTO_VEICULO_MOV.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');
          QRCustoVeiculo_ReceitaMensal.SetVariable('VEICULO2', 'TB_DESPESA_RECUP.COD_VEICULO IN (' + Trim(FControleVeiculoParam.MeVeiculo9.Text) + ')');
        end
        else
        begin
          QRCustoVeiculo_ReceitaMensal.SetVariable('VEICULO', '1=1');
          QRCustoVeiculo_ReceitaMensal.SetVariable('VEICULO2', '1=1');
        end;
        //Proprietário Veículo
        if Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_ReceitaMensal.SetVariable('COD_PROPRIETARIO',Trim(FControleVeiculoParam.FmPropeitaraioVeiculo9.MeCadastro.Text))
        else
          QRCustoVeiculo_ReceitaMensal.SetVariable('COD_PROPRIETARIO',Null);

        if Trim(FControleVeiculoParam.FmCadastro9.MeCadastro.Text) <> '' then
          QRCustoVeiculo_ReceitaMensal.SetVariable('COD_CADASTRO',FControleVeiculoParam.FmCadastro9.MeCadastro.Text)
        else
          QRCustoVeiculo_ReceitaMensal.SetVariable('COD_CADASTRO',NULL);

        QRCustoVeiculo_ReceitaMensal.SetVariable('DATA_I', Trim(FControleVeiculoParam.FmDatas9.MeDtInicial.Text));
        QRCustoVeiculo_ReceitaMensal.SetVariable('DATA_F', Trim(FControleVeiculoParam.FmDatas9.MeDtFinal.Text));
        QRCustoVeiculo_ReceitaMensal.Open;

        if FrReceitaDespesasVeiculosMensal = nil then
          FrReceitaDespesasVeiculosMensal := TFrReceitaDespesasVeiculosMensal.Create(Application);

        if DMParamSistema.CodEmpresa = 'TOMATESMI' then
        begin
          FrReceitaDespesasVeiculosMensal.QRLTitulo.Caption := 'Relatório de despesas e receitas de estufas Mensal';
          FrReceitaDespesasVeiculosMensal.QRDBText3.Enabled := False;
          FrReceitaDespesasVeiculosMensal.QRDBText8.DataField := 'DESC_CARACTERISTICA';
        end;
        if (DMParamSistema.CodEmpresa = 'ITATIBA') then
          FrReceitaDespesasVeiculosMensal.QRDBText8.DataField := 'DESC_CARACTERISTICA';

        if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
          FrReceitaDespesasVeiculosMensal.QRPrimario.Preview
        else
          FrReceitaDespesasVeiculosMensal.QRPrimario.Print;
        QRCustoVeiculo_ReceitaMensal.Close;
      end;
    end;
  end;

end;

procedure TFCustoVeiculoMovCad.OpVoltaEstoqueClick(Sender: TObject);
var wCodFilialVeic: Integer;
begin
  inherited;
  ///Voltar o estoque conforme o custo de veiculo. Vanessa 06/06/16
  if DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV.Text = '' then
    Raise Exception.Create('Nenhum Movimento Custo de Veículo encontrado.')
  else
  if (MessageDlg('Deseja realmente voltar o estoque?', mtConfirmation,[mbYes, mbNo], 0) = mrYes) then
  begin
    wCodFilialVeic := StrToInt(DMOracle.FastSelect('COD_FILIAL','TB_VEICULO','COD_VEICULO = '
                              + IntToStr(DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value) ));
    DMEstoque.Atualiza_Estoque(0,//operação
    wCodFilialVeic,
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_PRODUTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_LOTE_TIPO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadQT_QUANTIDADE.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadVL_CUSTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadDT_MOVIMENTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadDT_MOVIMENTO.Value);
    DMOracle.ExecutaSql('UPDATE TB_CUSTO_VEICULO_MOV SET ' +
      'IND_ESTOQUE_ATUALIZADO = ' + QuotedStr('N') + ' WHERE COD_CUSTO_VEICULO_MOV = ' + trim(DMCustoVeiculoMov.QCustoVeiculoMovCAdCOD_CUSTO_VEICULO_MOV.Text));
    OpConfirmaEstoque.Enabled := true;
    OpVoltaEstoque.Enabled := false;
    DMOracle.DBCemapa.Commit;
    DMCustoVeiculoMov.QCustoVeiculoMovCad.Refresh;
    ShowMessage('Volta de estoque atualizada com sucesso.');
  end;
end;

procedure TFCustoVeiculoMovCad.OpConfirmaEstoqueClick(Sender: TObject);
var
  wCodFilialVeic: integer;
begin
  inherited;
  //Atualizar o estoque conforme o custo de veiculo. Vanessa 06/06/16
  if DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV.Text = '' then
    Raise Exception.Create('Nenhum Movimento Custo de Veículo encontrado.')
  else
  if (MessageDlg('Deseja realmente atualizar o estoque?', mtConfirmation,[mbYes, mbNo], 0) = mrYes) then
  begin
    wCodFilialVeic := StrToInt(DMOracle.FastSelect('COD_FILIAL','TB_VEICULO','COD_VEICULO = '
                              + IntToStr(DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_VEICULO.Value) ));
    DMEstoque.Atualiza_Estoque(0, //operação
    wCodFilialVeic,
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_PRODUTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_LOTE_TIPO.Value,
    (DMCustoVeiculoMov.QCustoVeiculoMovCadQT_QUANTIDADE.Value * -1),
    DMCustoVeiculoMov.QCustoVeiculoMovCadVL_CUSTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadDT_MOVIMENTO.Value,
    DMCustoVeiculoMov.QCustoVeiculoMovCadDT_MOVIMENTO.Value);
    DMOracle.ExecutaSql('UPDATE TB_CUSTO_VEICULO_MOV SET ' +
      'IND_ESTOQUE_ATUALIZADO = ' + QuotedStr('S') + ' WHERE COD_CUSTO_VEICULO_MOV = ' + trim(DMCustoVeiculoMov.QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV.Text));
    OpConfirmaEstoque.Enabled := false;
    OpVoltaEstoque.Enabled := true;
    DMOracle.DBCemapa.Commit;
    DMCustoVeiculoMov.QCustoVeiculoMovCad.Refresh;
    ShowMessage('Estoque atualizado com sucesso.');
  end;
end;

procedure TFCustoVeiculoMovCad.DBPLoteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

procedure TFCustoVeiculoMovCad.DBEdit1Change(Sender: TObject);
begin
  inherited;
  with DMCustoVeiculoMov do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = '';
    MMCadSimples.Items[2].Items[1].Enabled := QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = 'S';

  end;
end;

procedure TFCustoVeiculoMovCad.SBCadastroProdClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
end;

procedure TFCustoVeiculoMovCad.RelCustoVeiculoReqNF1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[12].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMCustoVeiculoMov do
    begin
      QRGastoVeiculoReq.Close;
      //***** V E I C U L O *****
      if Trim(FControleVeiculoParam.MeVeiculo13.Text) = '' then
        //Raise Exception.Create('Selecione um Veículo')
        QRGastoVeiculoReq.SetVariable('VEICULO',Null)
      else
        QRGastoVeiculoReq.SetVariable('VEICULO',FControleVeiculoParam.MeVeiculo13.Text);
      //***** C A D A S T R O *****
      if Trim(FControleVeiculoParam.FmCadastro12.MeCadastro.Text) = '' then
        QRGastoVeiculoReq.SetVariable('COD_CADASTRO',NULL)
      else
        QRGastoVeiculoReq.SetVariable('COD_CADASTRO',Trim(FControleVeiculoParam.FmCadastro12.MeCadastro.Text));
      //***** P R O D U T O *****
      if Trim(FControleVeiculoParam.MeProduto13.Text) = '' then
        QRGastoVeiculoReq.SetVariable('PRODUTO',NULL)
      else
        QRGastoVeiculoReq.SetVariable('PRODUTO',FControleVeiculoParam.MeProduto13.Text);
      //***** D A T A   E M I S S A O *****
      if((FControleVeiculoParam.Me13EmissaoI.Text <> '') and (FControleVeiculoParam.Me13EmissaoF.Text <> '')) then
      begin
        QRGastoVeiculoReq.SetVariable('DATA_I',FControleVeiculoParam.Me13EmissaoI.Text);
        QRGastoVeiculoReq.SetVariable('DATA_F',FControleVeiculoParam.Me13EmissaoF.Text);
      end
      else
        Raise Exception.Create('Período de EMISSÃO deve ser informado');
      //***** D A T A   M O V I M E N T O *****
      if((FControleVeiculoParam.Me13MovimentoI.Text <> '') and (FControleVeiculoParam.Me13MovimentoF.Text <> '')) then
      begin
        QRGastoVeiculoReq.SetVariable('DATA_MOVIMENTO_I',FControleVeiculoParam.Me13MovimentoI.Text);
        QRGastoVeiculoReq.SetVariable('DATA_MOVIMENTO_F',FControleVeiculoParam.Me13MovimentoF.Text);
      end
      else
        Raise Exception.Create('Período do MOVIMENTO deve ser informado');
     //***** N U M.  N O T A   R E Q U I S I C A O *****
      if Trim(FControleVeiculoParam.MeReqNF12.Text) = '' then
        QRGastoVeiculoReq.SetVariable('NUM_NOTA_REQUISICAO', Null)
      else
        QRGastoVeiculoReq.SetVariable('NUM_NOTA_REQUISICAO', Trim(FControleVeiculoParam.MeReqNF12.Text));

      QRGastoVeiculoReq.Open;
      if FRCustoVeiculoReqNF = nil then
        FRCustoVeiculoReqNF := TFRCustoVeiculoReqNF.Create(Application);
      FRCustoVeiculoReqNF.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.Me13EmissaoI.Text+
                                           ' Até '+FControleVeiculoParam.Me13EmissaoF.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRCustoVeiculoReqNF.QRPrimario.Preview
      else
        FRCustoVeiculoReqNF.QRPrimario.Print;
      QRGastoVeiculoReq.Close;
    end;
  end;

end;

procedure TFCustoVeiculoMovCad.DBPLoteCodigoExit(Sender: TObject);
begin
  inherited;
  DBPLoteAfterConsulta(Sender);
end;

procedure TFCustoVeiculoMovCad.DBPLoteAfterConsulta(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    DMCustoVeiculoMov.QCustoVeiculoMovCadVL_UNITARIO.Value := StrToFloat('0'+DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
       'COD_PRODUTO = ' +  DBEdit3.Text + ' AND COD_FILIAL = 1 AND COD_LOTE_TIPO = ' + DBPLote.DBEdit.Text) );
    DBEdit20.SetFocus;
  end;
end;

procedure TFCustoVeiculoMovCad.RelRequisicaoVeiculoClick(Sender: TObject);
begin
  inherited;
  with DMCustoVeiculoMov do
  begin
  QRRequisicaoVeiculo.close;
    if QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV.AsString = '' then //Trim(FCustoVeiculoMovCad.DBEdit1.Text) = '' then
        Raise Exception.Create('Selecione um Lançamento!')
    else
        QRRequisicaoVeiculo.SetVariable('COD_VEICULO_MOV', QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV.Value); //Trim(FCustoVeiculoMovCad.DBEdit1.Text));
    QRRequisicaoVeiculo.open;

    if FRRequisicaoVeiculo = nil then
      FRRequisicaoVeiculo := TFRRequisicaoVeiculo.Create(Application);
    FRRequisicaoVeiculo.QRPrimario.Preview;
    QRRequisicaoVeiculo.Close;
  end;

end;
procedure TFCustoVeiculoMovCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  DMCustoVeiculoMov.QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value := 'N';
end;

end.
