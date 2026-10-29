unit UOperacaoCambioACCCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants;

type
  TFOperacaoCambioACCCad = class(TFTCadSimples)
    pcOperacao: TPageControl;
    tsDadosOperacao: TTabSheet;
    tsLiquidacao: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SBBanco: TSpeedButton;
    SBDepartamento: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DSOperacaoCambioACCLiq: TDataSource;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    SBNota: TSpeedButton;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    SBContrato: TSpeedButton;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    Label20: TLabel;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    SBFilial: TSpeedButton;
    DBDirceu3: TDBDirceu;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    SBHistorico: TSpeedButton;
    DBDirceu4: TDBDirceu;
    RelaodeOperaodeCmbioACC1: TMenuItem;
    LiquidaesdasOperaesdeCmbioACC1: TMenuItem;
    tsContratoAplicado: TTabSheet;
    DSContratoAplicado: TDataSource;
    OracleNavigator2: TOracleNavigator;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    SBContratoAplicado: TSpeedButton;
    DBGrid2: TDBGrid;
    OperaodeCmbioACCAplicadoaContratodeVenda1: TMenuItem;
    OperaodeCmbioaAplicarContratodeVenda1: TMenuItem;
    Label27: TLabel;
    lbSaldo: TLabel;
    DSVariacaoCambial: TDataSource;
    Opes1: TMenuItem;
    GerarContabilizaodaVariaoCambial1: TMenuItem;
    VoltarltimaContabilizaodaVariaoCAMBIAL1: TMenuItem;
    TabSheet2: TTabSheet;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    DSContabilizacaoVariacaoCambialACC: TDataSource;
    DBGrid4: TDBGrid;
    Label31: TLabel;
    lblDtUltimaVariacaoCambial: TLabel;
    RelatriodeVariaoCambial1: TMenuItem;
    GroupBox2: TGroupBox;
    Label32: TLabel;
    DBEdit27: TDBEdit;
    Label33: TLabel;
    DBEdit31: TDBEdit;
    Label34: TLabel;
    DBEdit32: TDBEdit;
    SBHistoricoLiq: TSpeedButton;
    SBContaCreditoLiq: TSpeedButton;
    SBContaDebitoLiq: TSpeedButton;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBRGGarantia: TDBRadioGroup;
    PCPenhorCedular: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet5: TTabSheet;
    Label35: TLabel;
    DBEdit33: TDBEdit;
    SBFilialPenhor: TSpeedButton;
    DBDirceu8: TDBDirceu;
    Label36: TLabel;
    DBEdit34: TDBEdit;
    SBProdutoPenhor: TSpeedButton;
    DBDirceu9: TDBDirceu;
    DBEdit35: TDBEdit;
    Label37: TLabel;
    DBEdit36: TDBEdit;
    Label38: TLabel;
    DBEdit37: TDBEdit;
    Label39: TLabel;
    btnBaixarPenhor: TBitBtn;
    MECustoBaixa: TMaskEdit;
    MEDtBaixa: TMaskEdit;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    btnVoltaBaixaPenhor: TBitBtn;
    Label40: TLabel;
    DBEdit38: TDBEdit;
    DBEdit41: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    SbCadastro: TSpeedButton;
    DBEdit42: TDBEdit;
    DBDirceu10: TDBDirceu;
    Label47: TLabel;
    SbContaCorrenteCredito: TSpeedButton;
    DBEdit43: TDBEdit;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    Label48: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SBDepartamentoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SBContratoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSOperacaoCambioACCLiqStateChange(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBHistoricoClick(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure RelaodeOperaodeCmbioACC1Click(Sender: TObject);
    procedure LiquidaesdasOperaesdeCmbioACC1Click(Sender: TObject);
    procedure SBContratoAplicadoClick(Sender: TObject);
    procedure DSContratoAplicadoStateChange(Sender: TObject);
    procedure OperaodeCmbioACCAplicadoaContratodeVenda1Click(
      Sender: TObject);
    procedure OperaodeCmbioaAplicarContratodeVenda1Click(Sender: TObject);
    procedure AtualizaSaldoAplicar;
    procedure DSContratoAplicadoDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure GerarContabilizaodaVariaoCambial1Click(Sender: TObject);
    procedure VoltarltimaContabilizaodaVariaoCAMBIAL1Click(
      Sender: TObject);
    procedure DSContabilizacaoVariacaoCambialACCDataChange(Sender: TObject;
      Field: TField);
    procedure RelatriodeVariaoCambial1Click(Sender: TObject);
    procedure SBHistoricoLiqClick(Sender: TObject);
    procedure SBContaDebitoLiqClick(Sender: TObject);
    procedure SBContaCreditoLiqClick(Sender: TObject);
    procedure DBRGGarantiaChange(Sender: TObject);
    procedure SBFilialPenhorClick(Sender: TObject);
    procedure SBProdutoPenhorClick(Sender: TObject);
    procedure btnBaixarPenhorClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure btnVoltaBaixaPenhorClick(Sender: TObject);
    procedure SbCadastroClick(Sender: TObject);
    procedure SbContaCorrenteCreditoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioACCCad: TFOperacaoCambioACCCad;

implementation

uses UOperacaoCambio_cl, UDepartamentoCons, UDepartamento_cl, UBancosCons,
  UBancoAgencia_cl, UOperacaoCambioACCCons, UContratoVenda_Cons,
  Ucontrato_cl, UNotaSaidaCons, UContasReceber_cl, UFilialCons, UFilial_cl,
  UHistoricoCons, UHistorico_cl, UContaCorrenteCons, UOperacaoCambioParam,
  URRelacaoOperacaoCambioACC, URLiquidacoesOpercaoCambioACC,
  UROperACCAplicadoContratoVenda, UROperACCAplicarContratoVenda, UOracle_cl,
  UVariacaoCambialParam, URVariacaoCambialACC, UPlanoContaCons,
  UPlanoConta_cl, UParamSistema_cl, UProdutoCons, UProduto_cl,
  UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFOperacaoCambioACCCad.AtualizaSaldoAplicar;
var wVal : string;
begin
  inherited;
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_ACC_CONTRATO','COD_OPERACAO_CAMBIO_ACC = ' + '0' + DMOperacaoCambio.QOperacaoCambioACCCOD_OPERACAO_CAMBIO_ACC.Text);
  lbSaldo.Caption := formatFloat('#,##0.00', DMOperacaoCambio.QOperacaoCambioACCVAL_OPERACAO_DOLAR.Value - StrToFloat(wval));
end;

procedure TFOperacaoCambioACCCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioACC.close;
  DMOperacaoCambio.QOperacaoCambioACC.open;
  DMOperacaoCambio.QOperacaoCambioACCLiq.close;
  DMOperacaoCambio.QOperacaoCambioACCLiq.open;
  DMOperacaoCambio.QOperCambioACCContrato.close;
  DMOperacaoCambio.QOperCambioACCContrato.open;

  DMOperacaoCambio.QVariacaoCambioOperacaoCambialACC.close;
  DMOperacaoCambio.QVariacaoCambioOperacaoCambialACC.open;

  DMOperacaoCambio.QContabilizacaoVariacaoCambialACC.close;
  DMOperacaoCambio.QContabilizacaoVariacaoCambialACC.open;


  Case Trunc(DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value) of
    4:begin
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_CREDITO_VC_ACC.EditMask := '#.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_DEBITO_VC_ACC.EditMask  := '#.##.##.######;0;';
      end;
    5:begin
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_CREDITO_VC_ACC.EditMask := '#.##.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_DEBITO_VC_ACC.EditMask  := '#.##.##.##.######;0;';
      end;
    6:begin
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_CREDITO_VC_ACC.EditMask := '#.##.##.##.##.######;0;';
      DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_DEBITO_VC_ACC.EditMask  := '#.##.##.##.##.######;0;';
      end;
  end;

end;

procedure TFOperacaoCambioACCCad.SBDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);
  if FDepartamentoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFOperacaoCambioACCCad.DSPrimarioStateChange(Sender: TObject);
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
    SbContaCorrenteCredito.Enabled  := true;
    SbCadastro.Enabled      := True;
  end
  else
  begin
    SBBanco.Enabled         := false;
    SBDepartamento.Enabled  := false;
    SBFilial.Enabled        := false;
    SBHistorico.Enabled     := false;
    SBProdutoPenhor.Enabled := false;
    SBFilialPenhor.Enabled  := false;
    SbContaCorrenteCredito.Enabled  := false;
    SbCadastro.Enabled      := false;
  end;
end;

procedure TFOperacaoCambioACCCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);
  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFOperacaoCambioACCCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioACCCons = nil then
    FOperacaoCambioACCCons := TFOperacaoCambioACCCons.create(application);

  if FOperacaoCambioACCCons.showmodal = mrok then
  begin
    DMOperacaoCambio.QOperacaoCambioACC.close;
    DMOperacaoCambio.QOperacaoCambioACC.SetVariable('PK', DMOperacaoCambio.QOperacaoCambioACCConsCOD_OPERACAO_CAMBIO_ACC.Value);
    DMOperacaoCambio.QOperacaoCambioACC.OPEN;

    DMOperacaoCambio.QOperacaoCambioACCLiq.Close;
    DMOperacaoCambio.QOperacaoCambioACCLiq.OPEN;
  end;
end;

procedure TFOperacaoCambioACCCad.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  //calcula a dt de vencimento baseada no periodo
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioACCDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioACCDT_VENCIMENTO.Value :=
        DMOperacaoCambio.QOperacaoCambioACCDT_OPERACAO.Value +
          DMOperacaoCambio.QOperacaoCambioACCNUM_PERIODO_OPERACAO.Value;
end;

procedure TFOperacaoCambioACCCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  //calcula o periodo baseado na dt de vencimento
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioACCDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioACCNUM_PERIODO_OPERACAO.Value :=
        trunc(DMOperacaoCambio.QOperacaoCambioACCDT_VENCIMENTO.Value -
          DMOperacaoCambio.QOperacaoCambioACCDT_OPERACAO.Value);
end;

procedure TFOperacaoCambioACCCad.SBContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCLiqCOD_CONTRATO_VEND.Value :=
      DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFOperacaoCambioACCCad.FormActivate(Sender: TObject);
begin
  inherited;
  pcOperacao.ActivePage := tsDadosOperacao;
end;

procedure TFOperacaoCambioACCCad.DSOperacaoCambioACCLiqStateChange(
  Sender: TObject);
begin
  inherited;
  if DSOperacaoCambioACCLiq.State in [dsEdit, dsInsert] then
  begin
    SBNota.Enabled            := true;
    SBContrato.Enabled        := true;
    SBHistoricoLiq.Enabled    := true;
    SBContaCreditoLiq.Enabled := true;
    SBContaDebitoLiq.Enabled  := true;
  end else
  begin
    SBNota.Enabled            := false;
    SBContrato.Enabled        := false;
    SBHistoricoLiq.Enabled    := false;
    SBContaCreditoLiq.Enabled := false;
    SBContaDebitoLiq.Enabled  := false;
  end;
end;

procedure TFOperacaoCambioACCCad.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.create(application);

  if FNotaSaidaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCLiqCOD_NOTA_CAB.Value :=
      DMContasReceber.QNotaSaidaConsCOD_NOTA_CAB.Value;
end;

procedure TFOperacaoCambioACCCad.DBEdit13Exit(Sender: TObject);
var wNumDias     : integer;
begin
  inherited;
  {o desagio é a porcentagem do juro por ano}
  {para calcular o valor juro da liquidacao, primeiro é calculado o percentual
  de juros a ser cobrado, isso é feito através uma formula

      juros = dias corridos * taxa desagio * valor liquidado / 3600

  }

  if DSOperacaoCambioACCLiq.State in [dsInsert, dsEdit] then
  begin
    wNumDias := trunc(DMOperacaoCambio.QOperacaoCambioACCLiqDT_LIQUIDACAO.value -
      DMOperacaoCambio.QOperacaoCambioACCDT_OPERACAO.value);

    //wPercDesagio := DMOperacaoCambio.QOperacaoCambioACCPERC_DESAGIO.Value *
    //  wNumDias / 365;

    //DMOperacaoCambio.QOperacaoCambioACCLiqVAL_JUROS.Value := wPercDesagio *
    //  DMOperacaoCambio.QOperacaoCambioACCLiqVAL_LIQUIDACAO.Value / 100;

    DMOperacaoCambio.QOperacaoCambioACCLiqVAL_JUROS.Value := (wNumDias *
      DMOperacaoCambio.QOperacaoCambioACCPERC_DESAGIO.Value *
      DMOperacaoCambio.QOperacaoCambioACCLiqVAL_LIQUIDACAO.Value) / 36000;
  end;
end;

procedure TFOperacaoCambioACCCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioACCCad.SBHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioACCCad.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  //DMOperacaoCambio.QOperacaoCambioACCVAL_ATUAL_TITULO_DOLAR.Value :=
    //DMOperacaoCambio.QOperacaoCambioACCVAL_OPERACAO_DOLAR.Value;
end;

procedure TFOperacaoCambioACCCad.RelaodeOperaodeCmbioACC1Click(
  Sender: TObject);
begin
  inherited;

  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[0].TabVisible := True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperacaoCambioACC.close;

    if FOperacaoCambioParam.ME1DtBase.Text = '' then
      FOperacaoCambioParam.ME1DtBase.Text := datetostr(date);

    DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_OPERACAO_BASE',strtodate(FOperacaoCambioParam.ME1DtBase.Text));

    if trim(FoperacaoCambioParam.ME1NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME1NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME1ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME1ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME1Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME1Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME1Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME1Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME1DtLimiteInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_LIMITE_INICIO',trim(FoperacaoCambioParam.ME1DtLimiteInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_LIMITE_INICIO',null);

    if trim(FoperacaoCambioParam.ME1DtLimiteFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_LIMITE_FIM',trim(FoperacaoCambioParam.ME1DtLimiteFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_LIMITE_FIM',null);

    if trim(FoperacaoCambioParam.ME1DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME1DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME1DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME1DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME1DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME1DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME1DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME1DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME1DtVencimentoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_VENCIMENTO_INICIO',trim(FoperacaoCambioParam.ME1DtVencimentoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_VENCIMENTO_INICIO',null);

    if trim(FoperacaoCambioParam.ME1DtVencimentoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_VENCIMENTO_FIM',trim(FoperacaoCambioParam.ME1DtVencimentoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('DT_VENCIMENTO_FIM',null);

    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 0 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA',null);
    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 1 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA','NTP');
    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 2 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA','CTF');
    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 3 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA','HPT');
    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 4 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA','PNP');
    if FOperacaoCambioParam.RG1Garantia.ItemIndex = 5 then
      DMOperacaoCambio.QROperacaoCambioACC.SetVariable('IND_GARANTIA','NHP');

    DMOperacaoCambio.QROperacaoCambioACC.open;

    if FRRelacaoOperacaoCambioACC = nil then
      FRRelacaoOperacaoCambioACC := TFRRelacaoOperacaoCambioACC.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRRelacaoOperacaoCambioACC.QRPrimario.Preview
    else
      FRRelacaoOperacaoCambioACC.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioACC.Close;
  end;
end;

procedure TFOperacaoCambioACCCad.LiquidaesdasOperaesdeCmbioACC1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[1].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperacaoCambioACCLiq.close;

    if trim(FoperacaoCambioParam.ME2NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME2NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME2ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME2ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME2Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME2Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME2Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME2Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME2DtLimiteInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIMITE_INICIO',trim(FoperacaoCambioParam.ME2DtLimiteInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIMITE_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtLimiteFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIMITE_FIM',trim(FoperacaoCambioParam.ME2DtLimiteFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIMITE_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME2DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME2DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME2DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME2DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtVencimentoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_VENCIMENTO_INICIO',trim(FoperacaoCambioParam.ME2DtVencimentoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_VENCIMENTO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtVencimentoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_VENCIMENTO_FIM',trim(FoperacaoCambioParam.ME2DtVencimentoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_VENCIMENTO_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtLiquidacaoIni.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIQUIDACAO_INICIO',trim(FoperacaoCambioParam.ME2DtLiquidacaoIni.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIQUIDACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtLiquidacaoFim.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIQUIDACAO_FIM',trim(FoperacaoCambioParam.ME2DtLiquidacaoFim.Text))
    else
      DMOperacaoCambio.QROperacaoCambioACCLiq.SetVariable('DT_LIQUIDACAO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioACCLiq.open;

    if FRLiquidacoesOpercaoCambioACC = nil then
      FRLiquidacoesOpercaoCambioACC := TFRLiquidacoesOpercaoCambioACC.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRLiquidacoesOpercaoCambioACC.QRPrimario.Preview
    else
      FRLiquidacoesOpercaoCambioACC.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioACCLiq.Close;
  end;
end;

procedure TFOperacaoCambioACCCad.SBContratoAplicadoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
    DMOperacaoCambio.QOperCambioACCContratoCOD_CONTRATO_VEND.Value :=
      DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFOperacaoCambioACCCad.DSContratoAplicadoStateChange(
  Sender: TObject);
begin
  inherited;
  if DSContratoAplicado.State in [dsEdit, dsInsert] then
    SBContratoAplicado.Enabled := true
  else
    SBContratoAplicado.Enabled := false;
end;

procedure TFOperacaoCambioACCCad.OperaodeCmbioACCAplicadoaContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[6].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperACCAplicadoContratoVenda.close;

    if trim(FoperacaoCambioParam.ME7ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME7ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME7OperacaoCambio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_ACC',trim(FoperacaoCambioParam.ME7OperacaoCambio.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_ACC',null);

    if trim(FoperacaoCambioParam.ME7DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME7DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME7DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME7DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME7DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME7DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME7DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME7DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME7DtAplicadoInicio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',trim(FoperacaoCambioParam.ME7DtAplicadoInicio.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',null);

    if trim(FoperacaoCambioParam.ME7DtAplicadoFim.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',trim(FoperacaoCambioParam.ME7DtAplicadoFim.Text))
    else
      DMOperacaoCambio.QROperACCAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',null);

    DMOperacaoCambio.QROperACCAplicadoContratoVenda.open;

    if FROperACCAplicadoContratoVenda = nil then
      FROperACCAplicadoContratoVenda := TFROperACCAplicadoContratoVenda.create(application);

    FROperACCAplicadoContratoVenda.QRLNumContrato.Caption := FoperacaoCambioParam.ed7OperacaoCambio.Text;

    FROperACCAplicadoContratoVenda.QRLDtOperacao.Caption := '';
    if (FoperacaoCambioParam.ME7DtOperacaoInicio.Text <> '') and
       (FoperacaoCambioParam.ME7DtOperacaoFinal.Text <> '')  then
      FROperACCAplicadoContratoVenda.QRLDtOperacao.Caption := FoperacaoCambioParam.ME7DtOperacaoInicio.Text + ' até ' + FoperacaoCambioParam.ME7DtOperacaoFinal.Text;

    FROperACCAplicadoContratoVenda.QRLDtCredito.Caption := '';
    if (FoperacaoCambioParam.ME7DtCreditoInicio.Text <> '') and
       (FoperacaoCambioParam.ME7DtCreditoFinal.Text <> '')  then
      FROperACCAplicadoContratoVenda.QRLDtCredito.Caption := FoperacaoCambioParam.ME7DtCreditoInicio.Text + ' até ' + FoperacaoCambioParam.ME7DtCreditoFinal.Text;

    FROperACCAplicadoContratoVenda.QRLDtAplicacao.Caption := '';
    if (FoperacaoCambioParam.ME7DtAplicadoInicio.Text <> '') and
       (FoperacaoCambioParam.ME7DtAplicadoFim.Text <> '')  then
      FROperACCAplicadoContratoVenda.QRLDtAplicacao.Caption := FoperacaoCambioParam.ME7DtAplicadoInicio.Text + ' até ' + FoperacaoCambioParam.ME7DtAplicadoFim.Text;

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperACCAplicadoContratoVenda.QRPrimario.Preview
    else
      FROperACCAplicadoContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperACCAplicadoContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioACCCad.OperaodeCmbioaAplicarContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[9].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperACCAplicarContratoVenda.close;

    if trim(FoperacaoCambioParam.ME10ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME10ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME10DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME10DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME10DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME10DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME10DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME10DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME10DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME10DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperACCAplicarContratoVenda.SetVariable('DT_CREDITO_FIM',null);

    DMOperacaoCambio.QROperACCAplicarContratoVenda.open;

    if FROperACCAplicarContratoVenda = nil then
      FROperACCAplicarContratoVenda := TFROperACCAplicarContratoVenda.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperACCAplicarContratoVenda.QRPrimario.Preview
    else
      FROperACCAplicarContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperACCAplicarContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioACCCad.DSContratoAplicadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;
end;

procedure TFOperacaoCambioACCCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;

  if DMOperacaoCambio.QOperacaoCambioACCDT_BAIXA_PENHOR.IsNull then
  begin
    btnBaixarPenhor.Enabled := true;
    btnVoltaBaixaPenhor.Enabled := false;
  end
  else
  begin
    btnBaixarPenhor.Enabled := false;
    btnVoltaBaixaPenhor.Enabled := true;
  end;
end;

procedure TFOperacaoCambioACCCad.GerarContabilizaodaVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if FVariacaoCambialParam = nil then
    FVariacaoCambialParam := TFVariacaoCambialParam.create(application);

  FVariacaoCambialParam.PGRelatorio.Pages[0].TabVisible := True;
  if FVariacaoCambialParam.showmodal = mrok then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;

      if Trim(FVariacaoCambialParam.ME0DtVariacaoCambial.Text) = '' then
        raise Exception.Create('Informe a data da Variação Cambial');

//      if Trim(FVariacaoCambialParam.ME0DtContabilizacao.Text) = '' then
//        raise Exception.Create('Informe a data de Contabilização');

      if Trim(FVariacaoCambialParam.ME0Historico.Text) = '' then
        raise Exception.Create('Informe o Histórico');

      if Trim(FVariacaoCambialParam.ME0ContaDebito.Text) = '' then
        raise Exception.Create('Informe a Conta Débito');

      if Trim(FVariacaoCambialParam.ME0ContaCredito.Text) = '' then
        raise Exception.Create('Informe a Conta Crédito');

      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('GERAR_VARIACAO_CAMBIAL_ACC',
          [strtodate(FVariacaoCambialParam.ME0DtVariacaoCambial.Text),
           strtodate(FVariacaoCambialParam.ME0DtVariacaoCambial.Text),
           strtoint(FVariacaoCambialParam.ME0Historico.Text),
           FVariacaoCambialParam.ME0ContaDebito.Text,
           FVariacaoCambialParam.ME0ContaCredito.Text
          ]);

      DMOracle.DBCemapa.Commit;

      MessageDlg('Variação Cambial gerada com sucesso.', mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFOperacaoCambioACCCad.VoltarltimaContabilizaodaVariaoCAMBIAL1Click(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente voltar a última variação cambial?', mtConfirmation, [mbyes, mbNo], 0) = mryes then
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOperacaoCambio.OPOperacaoCambio.CallProcedure('VOLTAR_VARIACAO_CAMBIAL_ACC',[]);
      DMOracle.DBCemapa.Commit;
      MessageDlg('Variação Cambial voltada com sucesso.',mtInformation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
end;

procedure TFOperacaoCambioACCCad.DSContabilizacaoVariacaoCambialACCDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  lblDtUltimaVariacaoCambial.Caption := DMOracle.BuscaNome('SELECT MAX(DT_VARIACAO_CAMBIAL_ACC) FROM TB_VARIACAO_CAMBIAL_ACC', '');
end;

procedure TFOperacaoCambioACCCad.RelatriodeVariaoCambial1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);

  FoperacaoCambioParam.PGRelatorio.Pages[12].TabVisible := True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QRVariacaoCambialACC.close;

    if trim(FoperacaoCambioParam.ME13NumContrato.Text) = '' then
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('NUM_CONTRATO', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('NUM_CONTRATO', trim(FoperacaoCambioParam.ME13NumContrato.Text));

    if FoperacaoCambioParam.ME13DtVariacaoCambialInicio.Text = '' then
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('DT_VARIACAO_CAMBIAL_ACC_INI', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('DT_VARIACAO_CAMBIAL_ACC_INI', StrToDate(FoperacaoCambioParam.ME13DtVariacaoCambialInicio.Text));

    if FoperacaoCambioParam.ME13DtVariacaoCambialFinal.Text = '' then
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('DT_VARIACAO_CAMBIAL_ACC_FIM', NULL)
    else
      DMOperacaoCambio.QRVariacaoCambialACC.SetVariable('DT_VARIACAO_CAMBIAL_ACC_FIM', StrToDate(FoperacaoCambioParam.ME13DtVariacaoCambialFinal.Text));

    DMOperacaoCambio.QRVariacaoCambialACC.open;

    if FRVariacaoCambialACC = nil then
      FRVariacaoCambialACC := TFRVariacaoCambialACC.create(application);

    if FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRVariacaoCambialACC.QRPrimario.Preview
    else
      FRVariacaoCambialACC.QRPrimario.print;

    DMOperacaoCambio.QRVariacaoCambialACC.close;
  end;
end;

procedure TFOperacaoCambioACCCad.SBHistoricoLiqClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCLiqCOD_HISTORICO.Value := DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioACCCad.SBContaDebitoLiqClick(Sender: TObject);
begin
  inherited;

  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_DEBITO_VC_ACC.Value := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
end;

procedure TFOperacaoCambioACCCad.SBContaCreditoLiqClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);

  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacaoCambio.QOperacaoCambioACCLiqCONTA_CREDITO_VC_ACC.Value := DMPlanoConta.QPlanoContaConsNum_Plano_conta.Value;
end;

procedure TFOperacaoCambioACCCad.DBRGGarantiaChange(Sender: TObject);
begin
  inherited;
  if (DBRGGarantia.ItemIndex = 3) or (DBRGGarantia.ItemIndex = 4) then //PNP --> Penhor de produto
    PCPenhorCedular.Visible := true
  else
    PCPenhorCedular.Visible := false;  
end;

procedure TFOperacaoCambioACCCad.SBFilialPenhorClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_FILIAL_PENHOR.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioACCCad.SBProdutoPenhorClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_PRODUTO_PENHOR.Text :=
      DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOperacaoCambioACCCad.btnBaixarPenhorClick(Sender: TObject);
begin
  inherited;

  if trim(MECustoBaixa.Text) = '' then
    raise Exception.Create('Informe o custo da baixa');

  if Trim(MEDtBaixa.Text) = '' then
    raise Exception.Create('Informe a data da baixa');

  if MessageDlg('Deseja realmente baixar esse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioACC.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioACC.Edit;

  DMOperacaoCambio.QOperacaoCambioACCVAL_CUSTO_BAIXA_PENHOR.Value := StrToFloat(trim(MECustoBaixa.Text));
  DMOperacaoCambio.QOperacaoCambioACCDT_BAIXA_PENHOR.Value := StrToDate(MEDtBaixa.Text);

  DMOperacaoCambio.QOperacaoCambioACC.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Penhor Baixado com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioACCCad.SBConfirmarClick(Sender: TObject);
begin
  if (DBRGGarantia.ItemIndex = 3) or
     (DBRGGarantia.ItemIndex = 4) then
  begin
    if DMOperacaoCambio.QOperacaoCambioACCCOD_FILIAL_PENHOR.IsNull then
      raise Exception.create('Informe a filial do Penhor');

    if DMOperacaoCambio.QOperacaoCambioACCCOD_PRODUTO_PENHOR.IsNull then
      raise Exception.create('Informe o produto do Penhor');

    if DMOperacaoCambio.QOperacaoCambioACCQT_QUILOS_PENHOR.IsNull then
      raise Exception.create('Informe a quantidade');

    if DMOperacaoCambio.QOperacaoCambioACCVAL_SEGURO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do seguro');

    if DMOperacaoCambio.QOperacaoCambioACCVAL_REGISTRO_PENHOR.IsNull then
      raise Exception.create('Informe o valor do registro');
  end;

  inherited;
end;

procedure TFOperacaoCambioACCCad.btnVoltaBaixaPenhorClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('Deseja realmente voltar a baixa desse penhor?', mtConfirmation, [mbyes, mbno], 0) <> mryes then
    abort;

  if not (DMOperacaoCambio.QOperacaoCambioACC.State in [dsInsert, dsEdit]) then
    DMOperacaoCambio.QOperacaoCambioACC.Edit;

  DMOperacaoCambio.QOperacaoCambioACCVAL_CUSTO_BAIXA_PENHOR.clear;
  DMOperacaoCambio.QOperacaoCambioACCDT_BAIXA_PENHOR.Clear;

  DMOperacaoCambio.QOperacaoCambioACC.Post;
  MEDtBaixa.Clear;
  MECustoBaixa.clear;
  PCPenhorCedular.ActivePage := TabSheet1;

  messageDlg('Baixa Voltada com sucesso.', mtInformation, [mbok], 0);
end;

procedure TFOperacaoCambioACCCad.SbCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_Cadastro.Value :=
      DMCadastro.QCadastroConsCOD_Cadastro.Value;
end;

procedure TFOperacaoCambioACCCad.SbContaCorrenteCreditoClick(
  Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);
  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioACCCOD_CONTA_CORRENTE_CREDITO.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;

end;

end.
