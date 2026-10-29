unit UOperacaoCambioEPTCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants;

type
  TFOperacaoCambioEPTCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEVlrTxCambio: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    RGTipoEmprestimo: TDBRadioGroup;
    SBBanco: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SBDepartamento: TSpeedButton;
    DBDirceu2: TDBDirceu;
    SBFilial: TSpeedButton;
    DBDirceu3: TDBDirceu;
    SBHistorico: TSpeedButton;
    DBDirceu4: TDBDirceu;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBRGGarantia: TDBRadioGroup;
    PCPenhorCedular: TPageControl;
    TabSheet3: TTabSheet;
    Label35: TLabel;
    SBFilialPenhor: TSpeedButton;
    Label36: TLabel;
    SBProdutoPenhor: TSpeedButton;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit33: TDBEdit;
    DBDirceu8: TDBDirceu;
    DBEdit34: TDBEdit;
    DBDirceu9: TDBDirceu;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    TabSheet5: TTabSheet;
    Label41: TLabel;
    Label42: TLabel;
    btnBaixarPenhor: TBitBtn;
    MECustoBaixa: TMaskEdit;
    MEDtBaixa: TMaskEdit;
    btnVoltaBaixaPenhor: TBitBtn;
    Opes1: TMenuItem;
    GerarContabilizaodaVariaoCambial1: TMenuItem;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    lblDtUltimaVariacaoCambial: TLabel;
    Label31: TLabel;
    DSContabilizacaoVariacaoCambialEPT: TDataSource;
    VoltarltimaContabilizaodaVariaoCambial1: TMenuItem;
    DSEmprestimoLiq: TDataSource;
    Label10: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label15: TLabel;
    SBHistoricoLiq: TSpeedButton;
    OracleNavigator1: TOracleNavigator;
    DBEdit15: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBGrid1: TDBGrid;
    DBEdit10: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    RelaodeEmprstimos1: TMenuItem;
    Label20: TLabel;
    DBETxDolarLiq: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    LiquidaesdosEmprstimos1: TMenuItem;
    RelatriodeVariaoCambial1: TMenuItem;
    TabSheet6: TTabSheet;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    DsOperacaoCambioEpt_Ren: TDataSource;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    Label28: TLabel;
    DBEdit26: TDBEdit;
    Label29: TLabel;
    DBEdit27: TDBEdit;
    Label30: TLabel;
    DBEdit28: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBDirceu6: TDBDirceu;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    Label26: TLabel;
    DBEdit24: TDBEdit;
    Label32: TLabel;
    DBEdit29: TDBEdit;
    Label33: TLabel;
    SbHistoricoSwap: TSpeedButton;
    DBEdit30: TDBEdit;
    DBDirceu7: TDBDirceu;
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure SBDepartamentoClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBHistoricoClick(Sender: TObject);
    procedure SBFilialPenhorClick(Sender: TObject);
    procedure SBProdutoPenhorClick(Sender: TObject);
    procedure btnBaixarPenhorClick(Sender: TObject);
    procedure btnVoltaBaixaPenhorClick(Sender: TObject);
    procedure DBRGGarantiaChange(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RGTipoEmprestimoChange(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBConsultaClick(Sender: TObject);
    procedure GerarContabilizaodaVariaoCambial1Click(Sender: TObject);
    procedure VoltarltimaContabilizaodaVariaoCambial1Click(
      Sender: TObject);
    procedure SBHistoricoLiqClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DSEmprestimoLiqStateChange(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure RelaodeEmprstimos1Click(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure DSContabilizacaoVariacaoCambialEPTDataChange(Sender: TObject;
      Field: TField);
    procedure LiquidaesdosEmprstimos1Click(Sender: TObject);
    procedure RelatriodeVariaoCambial1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit24Exit(Sender: TObject);
    procedure SbHistoricoSwapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioEPTCad: TFOperacaoCambioEPTCad;

implementation

uses UOperacaoCambio_cl, UContaCorrenteCons, UDepartamentoCons, UFilialCons,
  UHistoricoCons, UProdutoCons, UBancoAgencia_cl, UDepartamento_cl,
  UFilial_cl, UHistorico_cl, UProduto_cl, UOperacaoCambioEPTCons,
  UVariacaoCambialParam, UOracle_cl, UOperacaoCambioParam,
  URRelacaoOperacaoCambioEPT, URLiquidacaoOpercaoCambioEPT,
  URVariacaoCambialEPT;

{$R *.DFM}

procedure TFOperacaoCambioEPTCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMOperacaoCambio.QOperacaoCambioEPT;

end;

procedure TFOperacaoCambioEPTCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    SBBanco.Enabled         := true;
    SBDepartamento.Enabled  := true;
    SBFilial.Enabled        := true;
    SBHistorico.Enabled     := true;
    SBProdutoPenhor.Enabled := true;
    SBFilialPenhor.Enabled  := true;
  end
  else
  begin
    SBBanco.Enabled         := false;
    SBDepartamento.Enabled  := false;
    SBFilial.Enabled        := false;
    SBHistorico.Enabled     := false;
    SBProdutoPenhor.Enabled := false;
    SBFilialPenhor.Enabled  := false;
  end;
end;

procedure TFOperacaoCambioEPTCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFOperacaoCambioEPTCad.SBDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);
  if FDepartamentoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFOperacaoCambioEPTCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioEPTCad.SBHistoricoClick(Sender: TObject);
begin
  inherited;
    if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioEPTCad.SBFilialPenhorClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_FILIAL_PENHOR.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioEPTCad.SBProdutoPenhorClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTCOD_PRODUTO_PENHOR.Text :=
      DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOperacaoCambioEPTCad.btnBaixarPenhorClick(Sender: TObject);
begin
  inherited;

  if trim(MECustoBaixa.Text) = '' then
    raise Exception.Create('Informe o custo da baixa');

  if Trim(MEDtBaixa.Text) = '' then
    raise Exception.Create('Informe a data da baixa');

  if MessageDlg('Deseja realmente baixar esse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioEPT.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioEPT.Edit;

  DMOperacaoCambio.QOperacaoCambioEPTVAL_CUSTO_BAIXA_PENHOR.Value := StrToFloat(trim(MECustoBaixa.Text));
  DMOperacaoCambio.QOperacaoCambioEPTDT_BAIXA_PENHOR.Value := StrToDate(MEDtBaixa.Text);

  DMOperacaoCambio.QOperacaoCambioEPT.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Penhor Baixado com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioEPTCad.btnVoltaBaixaPenhorClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('Deseja realmente voltar a baixa desse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioEPT.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioEPT.Edit;

  DMOperacaoCambio.QOperacaoCambioEPTVAL_CUSTO_BAIXA_PENHOR.clear;
  DMOperacaoCambio.QOperacaoCambioEPTDT_BAIXA_PENHOR.Clear;

  DMOperacaoCambio.QOperacaoCambioEPT.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Baixa Voltada com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioEPTCad.DBRGGarantiaChange(Sender: TObject);
begin
  inherited;
  if (DBRGGarantia.ItemIndex = 3) or (DBRGGarantia.ItemIndex = 4) then //PNP --> Penhor de produto
    PCPenhorCedular.Visible := true
  else
    PCPenhorCedular.Visible := false;  
end;

procedure TFOperacaoCambioEPTCad.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  //calcula a dt de vencimento baseada no periodo
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioEPTDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioEPTDT_VENCIMENTO.Value :=
        DMOperacaoCambio.QOperacaoCambioEPTDT_OPERACAO.Value +
          DMOperacaoCambio.QOperacaoCambioEPTNUM_PERIODO_OPERACAO.Value;
end;

procedure TFOperacaoCambioEPTCad.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  //calcula o periodo baseado na dt de vencimento
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioEPTDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioEPTNUM_PERIODO_OPERACAO.Value :=
        trunc(DMOperacaoCambio.QOperacaoCambioEPTDT_VENCIMENTO.Value -
          DMOperacaoCambio.QOperacaoCambioEPTDT_OPERACAO.Value);
end;

procedure TFOperacaoCambioEPTCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioEPT.close;
  DMOperacaoCambio.QOperacaoCambioEPT.open;
  DMOperacaoCambio.QOperacaoCambioEPTLiq.close;
  DMOperacaoCambio.QOperacaoCambioEPTLiq.open;

  DMOperacaoCambio.QContabilizacaoVariacaoCambialEPT.close;
  DMOperacaoCambio.QContabilizacaoVariacaoCambialEPT.open;
  DMOperacaoCambio.QOperacaoCambioEpt_Ren.Open;
end;

procedure TFOperacaoCambioEPTCad.RGTipoEmprestimoChange(Sender: TObject);
begin
  inherited;
  if RGTipoEmprestimo.ItemIndex = 0 then
  begin
    //if DMOperacaoCambio.QOperacaoCambioEPTVAL_TX_JUROS.Text = '' then
    if DSPrimario.State in [dsInsert, dsEdit] then
      DMOperacaoCambio.QOperacaoCambioEPTVAL_TX_CAMBIO.Value := 1;
    DBEVlrTxCambio.TabStop  := false;
    DBEVlrTxCambio.ReadOnly := true;
    DBEVlrTxCambio.Color    := clBtnFace;
  end
  else
  begin
    DBEVlrTxCambio.TabStop  := true;
    DBEVlrTxCambio.ReadOnly := false;
    DBEVlrTxCambio.Color    := clWindow;
  end;
end;

procedure TFOperacaoCambioEPTCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if DMOperacaoCambio.QOperacaoCambioEPTDT_BAIXA_PENHOR.IsNull then
  begin
    btnBaixarPenhor.Enabled     := true;
    btnVoltaBaixaPenhor.Enabled := false;
  end
  else
  begin
    btnBaixarPenhor.Enabled     := false;
    btnVoltaBaixaPenhor.Enabled := true;
  end;

  if DMOperacaoCambio.QOperacaoCambioEPTIND_MOEDA_EMPRESTIMO.Value = 'R' then
  begin
    DBETxDolarLiq.tabStop   := false;
    DBETxDolarLiq.ReadOnly  := true;
    DBETxDolarLiq.color     := clBtnFace;
  end
  else
  begin
    DBETxDolarLiq.tabStop   := true;
    DBETxDolarLiq.readOnly  := false;
    DBETxDolarLiq.color     := clWindow;
  end;
end;

procedure TFOperacaoCambioEPTCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioEPTCons = nil then
    FOperacaoCambioEPTCons := TFOperacaoCambioEPTCons.create(application);

  if FOperacaoCambioEPTCons.showmodal = mrok then
  begin
    DMOperacaoCambio.QOperacaoCambioEPT.close;
    DMOperacaoCambio.QOperacaoCambioEPT.SetVariable('PK', DMOperacaoCambio.QOperacaoCambioEPTConsCOD_OPERACAO_CAMBIO_EPT.Value);
    DMOperacaoCambio.QOperacaoCambioEPT.Open;
  end;
end;

procedure TFOperacaoCambioEPTCad.GerarContabilizaodaVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if FVariacaoCambialParam = nil then
    FVariacaoCambialParam := TFVariacaoCambialParam.create(application);

  // seta os campos debto e credito inverso ao debto e credito do historico do cadastro do emprestimo - Pedido da Grasiela
  //Marlon - 04/2008
  {
  if DMOperacaoCambio.QOperacaoCambioEPTLiqCOD_HISTORICO.Value = 194 then
  begin
    FVariacaoCambialParam.ME2ContaDebito.Text := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO', 'COD_HISTORICO = ' +
                                                                    DMOperacaoCambio.QOperacaoCambioEPTCOD_HISTORICO.Text);
    FVariacaoCambialParam.ME2ContaCredito.Text := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO', 'COD_HISTORICO = ' +
                                                                    DMOperacaoCambio.QOperacaoCambioEPTCOD_HISTORICO.Text);
  end;
  }

  FVariacaoCambialParam.PGRelatorio.Pages[2].TabVisible := True;
  if FVariacaoCambialParam.showmodal = mrok then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;

      if Trim(FVariacaoCambialParam.ME2DtVariacaoCambial.Text) = '' then
        raise Exception.Create('Informe a data da Variação Cambial');

      if Trim(FVariacaoCambialParam.ME2Historico.Text) = '' then
        raise Exception.Create('Informe o Histórico');

      if Trim(FVariacaoCambialParam.ME2ContaDebito.Text) = '' then
        raise Exception.Create('Informe a Conta Débito');

      if Trim(FVariacaoCambialParam.ME2ContaCredito.Text) = '' then
        raise Exception.Create('Informe a Conta Crédito');

      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('GERAR_VARIACAO_CAMBIAL_EPT',
          [strtodate(FVariacaoCambialParam.ME2DtVariacaoCambial.Text),
           strtodate(FVariacaoCambialParam.ME2DtVariacaoCambial.Text),
           strtoint(FVariacaoCambialParam.ME2Historico.Text),
           FVariacaoCambialParam.ME2ContaDebito.Text,
           FVariacaoCambialParam.ME2ContaCredito.Text
          ]);

      DMOracle.DBCemapa.Commit;

      MessageDlg('Variação Cambial gerada com sucesso.', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFOperacaoCambioEPTCad.VoltarltimaContabilizaodaVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente voltar a última variação cambial?', mtConfirmation, [mbyes, mbNo], 0) = mryes then
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('VOLTAR_VARIACAO_CAMBIAL_EPT',[]);
      DMOracle.DBCemapa.Commit;
      MessageDlg('Variação Cambial voltada com sucesso.', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
end;

procedure TFOperacaoCambioEPTCad.SBHistoricoLiqClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTLiqCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioEPTCad.SBConfirmarClick(Sender: TObject);
begin
  if (DBRGGarantia.ItemIndex = 3) or
     (DBRGGarantia.ItemIndex = 4) then
  begin
    if DMOperacaoCambio.QOperacaoCambioEPTCOD_FILIAL_PENHOR.IsNull then
      raise Exception.create('Informe a filial do Penhor');

    if DMOperacaoCambio.QOperacaoCambioEPTCOD_PRODUTO_PENHOR.IsNull then
      raise Exception.create('Informe o produto do Penhor');

    if DMOperacaoCambio.QOperacaoCambioEPTQT_QUILOS_PENHOR.IsNull then
      raise Exception.create('Informe a quantidade');

    if DMOperacaoCambio.QOperacaoCambioEPTVAL_SEGURO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do seguro');

    if DMOperacaoCambio.QOperacaoCambioEPTVAL_REGISTRO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do registro');
  end;

  inherited;
end;

procedure TFOperacaoCambioEPTCad.DSEmprestimoLiqStateChange(
  Sender: TObject);
begin
  inherited;
  if DSEmprestimoLiq.State in [dsEdit, dsInsert] then
   Begin
    SBHistoricoLiq.Enabled := true;
    SbHistoricoSwap.Enabled := true;
   End
  else
   Begin
    SBHistoricoLiq.Enabled := false;
    SbHistoricoSwap.Enabled := False;
   End;
end;

procedure TFOperacaoCambioEPTCad.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  //calcula o valor dos juros
  if DSEmprestimoLiq.State in [dsEdit, dsInsert] then
    if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Text <> '' then
      if DMOperacaoCambio.QOperacaoCambioEPTLiqDT_LIQUIDACAO.Text <> '' then
        if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JURO.Text = '' then
        begin
          if DMOperacaoCambio.QOperacaoCambioEPTIND_TIPO_TX_JUROS.Value = 'AA' then //AA --> AO ANO
            DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JURO.Value := DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value -
              (100 - ((DMOperacaoCambio.QOperacaoCambioEPTLiqDT_LIQUIDACAO.Value - DMOperacaoCambio.QOperacaoCambioEPTDT_CREDITO.Value)*DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Value/365))/100 * DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value;

          if DMOperacaoCambio.QOperacaoCambioEPTIND_TIPO_TX_JUROS.Value = 'AM' then
            DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JURO.Value := DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value -
              (100 - ((DMOperacaoCambio.QOperacaoCambioEPTLiqDT_LIQUIDACAO.Value - DMOperacaoCambio.QOperacaoCambioEPTDT_CREDITO.Value)*DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Value/30))/100 * DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value;
        end;

  //calcula o valor da liquidacao em reais (valor que vai pro lancamento no banco e na contabilidade)
  if DSEmprestimoLiq.State in [dsEdit, dsInsert] then
    if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Text <> '' then
      if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Text <> '' then
        if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO_REAIS.Text = '' then
          DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO_REAIS.Value := DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_LIQUIDACAO.Value * DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Value;

end;

procedure TFOperacaoCambioEPTCad.RelaodeEmprstimos1Click(Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[14].TabVisible := True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperacaoCambioEPT.close;

    if FOperacaoCambioParam.ME15DtBase.Text = '' then
      FOperacaoCambioParam.ME15DtBase.Text := datetostr(date);

    DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_OPERACAO_BASE',strtodate(FOperacaoCambioParam.ME15DtBase.Text));

    if trim(FoperacaoCambioParam.ME15NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME15NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME15ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME15ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME15Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME15Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME15Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME15Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME15DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME15DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME15DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME15DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME15DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME15DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME15DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME15DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME15DtVencimentoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_VENCIMENTO_INICIO',trim(FoperacaoCambioParam.ME15DtVencimentoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_VENCIMENTO_INICIO',null);

    if trim(FoperacaoCambioParam.ME15DtVencimentoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_VENCIMENTO_FIM',trim(FoperacaoCambioParam.ME15DtVencimentoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('DT_VENCIMENTO_FIM',null);

    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 0 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA',null);
    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 1 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA','NTP');
    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 2 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA','CTF');
    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 3 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA','HPT');
    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 4 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA','PNP');
    if FOperacaoCambioParam.RG15Garantia.ItemIndex = 5 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_GARANTIA','NHP');

    if FOperacaoCambioParam.RG15Baixa.ItemIndex = 0 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_BAIXA', null);
    if FOperacaoCambioParam.RG15Baixa.ItemIndex = 1 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_BAIXA', 'LIQUIDADO');
    if FOperacaoCambioParam.RG15Baixa.ItemIndex = 2 then
      DMOperacaoCambio.QROperacaoCambioEPT.SetVariable('IND_BAIXA', 'ABERTO');

    DMOperacaoCambio.QROperacaoCambioEPT.open;

    if FRRelacaoOperacaoCambioEPT = nil then
      FRRelacaoOperacaoCambioEPT := TFRRelacaoOperacaoCambioEPT.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRRelacaoOperacaoCambioEPT.QRPrimario.Preview
    else
      FRRelacaoOperacaoCambioEPT.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioEPT.Close;
  end;
end;

procedure TFOperacaoCambioEPTCad.DBEdit21Exit(Sender: TObject);
begin
  inherited;
  //calcula o valor da liquidacao em reais (valor que vai pro lancamento no banco e na contabilidade)
  if DSEmprestimoLiq.State in [dsEdit, dsInsert] then
    if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JURO.Text <> '' then
      if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Text <> '' then
        if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JUROS_REAIS.Text = '' then
          DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JUROS_REAIS.Value := DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_JURO.value * DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.value;
end;

procedure TFOperacaoCambioEPTCad.DSContabilizacaoVariacaoCambialEPTDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  lblDtUltimaVariacaoCambial.Caption := DMOracle.BuscaNome('SELECT MAX(DT_VARIACAO_CAMBIAL_EPT) FROM TB_VARIACAO_CAMBIAL_EPT', '');
end;

procedure TFOperacaoCambioEPTCad.LiquidaesdosEmprstimos1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[15].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperacaoCambioEPTLiq.close;

    if trim(FoperacaoCambioParam.ME16NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME16NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME16ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME16ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME16Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME16Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME16Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME16Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME16DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME16DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME16DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME16DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME16DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME16DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME16DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME16DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtVencimentoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_VENCIMENTO_INICIO',trim(FoperacaoCambioParam.ME16DtVencimentoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_VENCIMENTO_INICIO',null);

    if trim(FoperacaoCambioParam.ME16DtVencimentoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_VENCIMENTO_FIM',trim(FoperacaoCambioParam.ME16DtVencimentoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_VENCIMENTO_FIM',null);

    if trim(FoperacaoCambioParam.ME16DtLiquidacaoIni.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_LIQUIDACAO_INICIO',trim(FoperacaoCambioParam.ME16DtLiquidacaoIni.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_LIQUIDACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME16DtLiquidacaoFim.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_LIQUIDACAO_FIM',trim(FoperacaoCambioParam.ME16DtLiquidacaoFim.Text))
    else
      DMOperacaoCambio.QROperacaoCambioEPTLiq.SetVariable('DT_LIQUIDACAO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioEPTLiq.open;

    if FRLiquidacaoOpercaoCambioEPT = nil then
      FRLiquidacaoOpercaoCambioEPT := TFRLiquidacaoOpercaoCambioEPT.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRLiquidacaoOpercaoCambioEPT.QRPrimario.Preview
    else
      FRLiquidacaoOpercaoCambioEPT.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioEPTLiq.Close;
  end;
end;

procedure TFOperacaoCambioEPTCad.RelatriodeVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);

  FoperacaoCambioParam.PGRelatorio.Pages[16].TabVisible := True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QRVariacaoCambialEPT.close;

    if trim(FoperacaoCambioParam.ME17NumContrato.Text) = '' then
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('NUM_CONTRATO', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('NUM_CONTRATO', trim(FoperacaoCambioParam.ME17NumContrato.Text));

    if FoperacaoCambioParam.ME17DtVariacaoCambialInicio.Text = '' then
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('DT_VARIACAO_CAMBIAL_EPT_INI', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('DT_VARIACAO_CAMBIAL_EPT_INI', StrToDate(FoperacaoCambioParam.ME17DtVariacaoCambialInicio.Text));

    if FoperacaoCambioParam.ME17DtVariacaoCambialFinal.Text = '' then
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('DT_VARIACAO_CAMBIAL_EPT_FIM', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialEPT.SetVariable('DT_VARIACAO_CAMBIAL_EPT_FIM', StrToDate(FoperacaoCambioParam.ME17DtVariacaoCambialFinal.Text));

    DMOperacaoCambio.QRVariacaoCambialEPT.open;

    if FRVariacaoCambialEPT = nil then
      FRVariacaoCambialEPT := TFRVariacaoCambialEPT.create(application);

    if FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRVariacaoCambialEPT.QRPrimario.Preview
    else
      FRVariacaoCambialEPT.QRPrimario.print;

    DMOperacaoCambio.QRVariacaoCambialEPT.close;
  end;
end;

procedure TFOperacaoCambioEPTCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPT_RenCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;

end;

procedure TFOperacaoCambioEPTCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioEPT.close;
  DMOperacaoCambio.QOperacaoCambioEPTLiq.close;
  DMOperacaoCambio.QContabilizacaoVariacaoCambialEPT.close;
  DMOperacaoCambio.QOperacaoCambioEpt_Ren.Close;
end;

procedure TFOperacaoCambioEPTCad.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  if DSEmprestimoLiq.State in [dsEdit, dsInsert] then
    if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP.Text <> '' then
      if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.Text <> '' then
        if DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP_REAIS.Text = '' then
           DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP_REAIS.Value := DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_RESULTADO_SWAP.value * DMOperacaoCambio.QOperacaoCambioEPTLiqVAL_TAXA_LIQ.value;
end;

procedure TFOperacaoCambioEPTCad.SbHistoricoSwapClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioEPTLiqCOD_HISTORICO_SWAP.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;

end;

end.
