unit UOperacaoCambioPRTCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants;

type
  TFOperacaoCambioPRTCad = class(TFTCadSimples)
    RelaodeOperaodeCmbioPronto1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SBBanco: TSpeedButton;
    SBDepartamento: TSpeedButton;
    SBFilial: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    SBNota: TSpeedButton;
    Label17: TLabel;
    SBContrato: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit18: TDBEdit;
    DBGrid1: TDBGrid;
    DSLiquidacoes: TDataSource;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    LiquidaesdeOperaesdeCmbioPRT1: TMenuItem;
    DSContratoAplicado: TDataSource;
    TabSheet3: TTabSheet;
    OracleNavigator2: TOracleNavigator;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    SBContratoAplicado: TSpeedButton;
    DBEdit29: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    DBGrid2: TDBGrid;
    OperaodeCmbioPRTAplicadoaContratodeVenda1: TMenuItem;
    OperaodeCmbioProntoaAplicarContratodeVenda1: TMenuItem;
    Label27: TLabel;
    lbSaldo: TLabel;
    Label40: TLabel;
    DBEdit38: TDBEdit;
    Label45: TLabel;
    DBEdit41: TDBEdit;
    procedure SBBancoClick(Sender: TObject);
    procedure SBDepartamentoClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure SBContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeOperaodeCmbioPronto1Click(Sender: TObject);
    procedure DSLiquidacoesStateChange(Sender: TObject);
    procedure LiquidaesdeOperaesdeCmbioPRT1Click(Sender: TObject);
    procedure DSContratoAplicadoStateChange(Sender: TObject);
    procedure SBContratoAplicadoClick(Sender: TObject);
    procedure OperaodeCmbioPRTAplicadoaContratodeVenda1Click(
      Sender: TObject);
    procedure OperaodeCmbioProntoaAplicarContratodeVenda1Click(
      Sender: TObject);
    procedure AtualizaSaldoAplicar;
    procedure DSContratoAplicadoDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioPRTCad: TFOperacaoCambioPRTCad;

implementation

uses UOperacaoCambio_cl, UBancosCons, UDepartamentoCons, UFilialCons,
  UBancoAgencia_cl, UDepartamento_cl, UFilial_cl, UNotaSaidaCons,
  UContratoVenda_Cons, UContasReceber_cl, Ucontrato_cl,
  UOperacaoCambioPRTCons, UContaCorrenteCons, UHistoricoCons, UHistorico_cl,
  UOperacaoCambioParam, URRelacaoOperacaoCambioPRT,
  URLiquidacoeOperacaoCambioPRT, UROperPRTAplicadoContratoVenda,
  UROperPRTAplicarContratoVenda, UOracle_cl;

{$R *.DFM}

procedure TFOperacaoCambioPRTCad.AtualizaSaldoAplicar;
var wVal : string;
begin
  inherited;
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_PRT_CONTRATO','COD_OPERACAO_CAMBIO_PRT = ' + '0' + DMOperacaoCambio.QOperacaoCambioPRTCOD_OPERACAO_CAMBIO_PRT.Text);
  lbSaldo.Caption := formatFloat('#,##0.00', (DMOperacaoCambio.QOperacaoCambioPRTVAL_OPERACAO_DOLAR.Value) - StrToFloat(wval));
end;


procedure TFOperacaoCambioPRTCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioPRTCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFOperacaoCambioPRTCad.SBDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);
  if FDepartamentoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioPRTCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFOperacaoCambioPRTCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioPRTCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioPRTCad.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.create(application);

  if FNotaSaidaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioPRTLiqCOD_NOTA_CAB.Value :=
      DMContasReceber.QNotaSaidaConsCOD_NOTA_CAB.Value;
end;

procedure TFOperacaoCambioPRTCad.SBContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioPRTLiqCOD_CONTRATO_VEND.Value :=
      DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFOperacaoCambioPRTCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioPRT.close;
  DMOperacaoCambio.QOperacaoCambioPRT.open;
  DMOperacaoCambio.QOperacaoCambioPRTLiq.close;
  DMOperacaoCambio.QOperacaoCambioPRTLiq.open;
  DMOperacaoCambio.QOperCambioPRTContrato.close;
  DMOperacaoCambio.QOperCambioPRTContrato.open;
end;

procedure TFOperacaoCambioPRTCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    SBBanco.Enabled        := true;
    SBDepartamento.Enabled := true;
    SBFilial.Enabled       := true;
//    SBHistorico.Enabled    := true;
  end
  else
  begin
    SBBanco.Enabled        := false;
    SBDepartamento.Enabled := false;
    SBFilial.Enabled       := false;
//    SBHistorico.Enabled    := false;
  end;
end;

procedure TFOperacaoCambioPRTCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioPRTCons = nil then
    FOperacaoCambioPRTCons := TFOperacaoCambioPRTCons.create(application);

  if FOperacaoCambioPRTCons.showmodal = mrok then
  begin
    DMOperacaoCambio.QOperacaoCambioPRT.close;
    DMOperacaoCambio.QOperacaoCambioPRT.SetVariable('PK', DMOperacaoCambio.QOperacaoCambioPRTConsCOD_OPERACAO_CAMBIO_PRT.Value);
    DMOperacaoCambio.QOperacaoCambioPRT.OPEN;
  end;
end;

procedure TFOperacaoCambioPRTCad.RelaodeOperaodeCmbioPronto1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[2].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin

    DMOperacaoCambio.QROperacaoCambioPRT.close;

    if FOperacaoCambioParam.ME3DtBase.Text = '' then
      FOperacaoCambioParam.ME3DtBase.Text := datetostr(date);

    DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_OPERACAO_BASE',strtodate(FOperacaoCambioParam.ME3DtBase.Text));

    if trim(FoperacaoCambioParam.ME3NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME3NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME3ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME3ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME3Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME3Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME3Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME3Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME3DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME3DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME3DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME3DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME3DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME3DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME3DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME3DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRT.SetVariable('DT_CREDITO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioPRT.open;

    if FROperacaoCambioPRT = nil then
      FROperacaoCambioPRT := TFROperacaoCambioPRT.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperacaoCambioPRT.QRPrimario.Preview
    else
      FROperacaoCambioPRT.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioPRT.Close;
  end;

end;

procedure TFOperacaoCambioPRTCad.DSLiquidacoesStateChange(Sender: TObject);
begin
  inherited;
  if DSLiquidacoes.State in [dsEdit, dsInsert] then
  begin
    SBNota.Enabled         := true;
    SBContrato.Enabled     := true;
  end
  else
  begin
    SBNota.Enabled         := false;
    SBContrato.Enabled     := false;
  end;
end;

procedure TFOperacaoCambioPRTCad.LiquidaesdeOperaesdeCmbioPRT1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[5].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin

    DMOperacaoCambio.QROperacaoCambioPRTLiq.close;

    if trim(FoperacaoCambioParam.ME2NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME2NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME2ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME2ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME2Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME2Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME2Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME2Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME2DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME2DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME2DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME2DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME2DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME2DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME2DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioPRTLiq.SetVariable('DT_CREDITO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioPRTLiq.open;

    if FRLiquidacoeOperacaoCambioPRT = nil then
      FRLiquidacoeOperacaoCambioPRT := TFRLiquidacoeOperacaoCambioPRT.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FRLiquidacoeOperacaoCambioPRT.QRPrimario.Preview
    else
      FRLiquidacoeOperacaoCambioPRT.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioPRTLiq.Close;
  end;
end;

procedure TFOperacaoCambioPRTCad.DSContratoAplicadoStateChange(
  Sender: TObject);
begin
  inherited;
  if DSContratoAplicado.State in [dsEdit, dsInsert] then
    SBContratoAplicado.Enabled := true
  else
    SBContratoAplicado.Enabled := false;
end;

procedure TFOperacaoCambioPRTCad.SBContratoAplicadoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
    DMOperacaoCambio.QOperCambioPRTContratoCOD_CONTRATO_VEND.Value :=
      DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFOperacaoCambioPRTCad.OperaodeCmbioPRTAplicadoaContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[7].TabVisible := True;
  If FoperacaoCambioParam.ShowModal = mrOk then
  begin
    DMOperacaoCambio.QROperPRTAplicadoContratoVenda.close;

    if trim(FoperacaoCambioParam.ME8ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME8ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME8OperacaoCambio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_PRT',trim(FoperacaoCambioParam.ME8OperacaoCambio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_PRT',null);

    if trim(FoperacaoCambioParam.ME8DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME8DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME8DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME8DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME8DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_CREDITO_INICIO',trim(FoperacaoCambioParam.ME8DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME8DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_CREDITO_FIM',trim(FoperacaoCambioParam.ME8DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_CREDITO_FIM',null);

    if trim(FoperacaoCambioParam.ME8DtAplicadoInicio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',trim(FoperacaoCambioParam.ME8DtAplicadoInicio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',null);

    if trim(FoperacaoCambioParam.ME8DtAplicadoFim.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',trim(FoperacaoCambioParam.ME8DtAplicadoFim.Text))
    else
      DMOperacaoCambio.QROperPRTAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',null);

    DMOperacaoCambio.QROperPRTAplicadoContratoVenda.open;

    if FROperPRTAplicadoContratoVenda = nil then
      FROperPRTAplicadoContratoVenda := TFROperPRTAplicadoContratoVenda.create(application);


    FROperPRTAplicadoContratoVenda.QRLNumContrato.Caption := FoperacaoCambioParam.ed8OperacaoCambio.Text;

    FROperPRTAplicadoContratoVenda.QRLDtOperacao.Caption := '';
    if (FoperacaoCambioParam.ME8DtOperacaoInicio.Text <> '') and
       (FoperacaoCambioParam.ME8DtOperacaoFinal.Text <> '')  then
      FROperPRTAplicadoContratoVenda.QRLDtOperacao.Caption := FoperacaoCambioParam.ME8DtOperacaoInicio.Text + ' até ' + FoperacaoCambioParam.ME8DtOperacaoFinal.Text;

    FROperPRTAplicadoContratoVenda.QRLDtCredito.Caption := '';
    if (FoperacaoCambioParam.ME8DtCreditoInicio.Text <> '') and
       (FoperacaoCambioParam.ME8DtCreditoFinal.Text <> '')  then
      FROperPRTAplicadoContratoVenda.QRLDtCredito.Caption := FoperacaoCambioParam.ME8DtCreditoInicio.Text + ' até ' + FoperacaoCambioParam.ME8DtCreditoFinal.Text;

    FROperPRTAplicadoContratoVenda.QRLDtAplicacao.Caption := '';
    if (FoperacaoCambioParam.ME8DtAplicadoInicio.Text <> '') and
       (FoperacaoCambioParam.ME8DtAplicadoFim.Text <> '')  then
      FROperPRTAplicadoContratoVenda.QRLDtAplicacao.Caption := FoperacaoCambioParam.ME8DtAplicadoInicio.Text + ' até ' + FoperacaoCambioParam.ME8DtAplicadoFim.Text;




    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperPRTAplicadoContratoVenda.QRPrimario.Preview
    else
      FROperPRTAplicadoContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperPRTAplicadoContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioPRTCad.OperaodeCmbioProntoaAplicarContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[10].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperPRTAplicarContratoVenda.close;

    if trim(FoperacaoCambioParam.ME11ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME11ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME11DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',Trim(FoperacaoCambioParam.ME11DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME11DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME11DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME11DtCreditoInicio.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_CREDITO_INICIO',Trim(FoperacaoCambioParam.ME11DtCreditoInicio.Text))
    else
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_CREDITO_INICIO',null);

    if trim(FoperacaoCambioParam.ME11DtCreditoFinal.Text) <> '' then
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_CREDITO_FIM',Trim(FoperacaoCambioParam.ME11DtCreditoFinal.Text))
    else
      DMOperacaoCambio.QROperPRTAplicarContratoVenda.SetVariable('DT_CREDITO_FIM',null);

    DMOperacaoCambio.QROperPRTAplicarContratoVenda.open;

    if FROperPRTAplicarContratoVenda = nil then
      FROperPRTAplicarContratoVenda := TFROperPRTAplicarContratoVenda.create(application);
    FROperPRTAplicarContratoVenda.QRLPeriodo.Caption := 'Período de '+Trim(FoperacaoCambioParam.ME11DtOperacaoInicio.Text) + ' Até '+ Trim(FoperacaoCambioParam.ME11DtOperacaoFinal.Text);
    FROperPRTAplicarContratoVenda.QRLCredito.Caption := 'Crédito de '+Trim(FoperacaoCambioParam.ME11DtCreditoInicio.Text) + ' Até '+Trim(FoperacaoCambioParam.ME11DtCreditoFinal.Text);
    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperPRTAplicarContratoVenda.QRPrimario.Preview
    else
      FROperPRTAplicarContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperPRTAplicarContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioPRTCad.DSContratoAplicadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;
end;

procedure TFOperacaoCambioPRTCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;
end;

end.
