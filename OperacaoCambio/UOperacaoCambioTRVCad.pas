unit UOperacaoCambioTRVCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants;

type
  TFOperacaoCambioTRVCad = class(TFTCadSimples)
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
    Label13: TLabel;
    SBDepartamento: TSpeedButton;
    SBContaCorrente: TSpeedButton;
    SBFilial: TSpeedButton;
    SBHistorico: TSpeedButton;
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
    DBEdit13: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    DSOperacaoCambioTRVLiq: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    SBContrato: TSpeedButton;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    SBNota: TSpeedButton;
    OracleNavigator1: TOracleNavigator;
    RelaodeOperaodeCmbioTrava1: TMenuItem;
    RelaodeOperaodeCmbioTravaLiq1: TMenuItem;
    TabSheet1: TTabSheet;
    DSContratoAplicado: TDataSource;
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
    OperaodeCmbioACCAplicadoaContratodeVenda1: TMenuItem;
    OperaodeCmbioTravaaAplicarContratodeVenda1: TMenuItem;
    Label27: TLabel;
    lbSaldo: TLabel;
    procedure SBDepartamentoClick(Sender: TObject);
    procedure SBContaCorrenteClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBHistoricoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBNotaClick(Sender: TObject);
    procedure SBContratoClick(Sender: TObject);
    procedure DSOperacaoCambioTRVLiqStateChange(Sender: TObject);
    procedure RelaodeOperaodeCmbioTrava1Click(Sender: TObject);
    procedure RelaodeOperaodeCmbioTravaLiq1Click(Sender: TObject);
    procedure DSContratoAplicadoStateChange(Sender: TObject);
    procedure OperaodeCmbioACCAplicadoaContratodeVenda1Click(
      Sender: TObject);
    procedure OperaodeCmbioTravaaAplicarContratodeVenda1Click(
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
  FOperacaoCambioTRVCad: TFOperacaoCambioTRVCad;

implementation

uses UOperacaoCambio_cl, UDepartamentoCons, UContaCorrenteCons, UFilialCons,
  UHistoricoCons, UDepartamento_cl, UBancoAgencia_cl, UFilial_cl,
  UHistorico_cl, UOperacaoCambioTRVCons, UNotaSaidaCons,
  UContratoVenda_Cons, UContasReceber_cl, Ucontrato_cl,
  UOperacaoCambioParam, UROperacaoCambioTRV, UROperacaoCambioTRVLiq,
  UROperTRVAplicadoContratoVenda, UROperTRVAplicarContratoVenda, UOracle_cl;

{$R *.DFM}

procedure TFOperacaoCambioTRVCad.AtualizaSaldoAplicar;
var wVal : string;
begin
  inherited;
  wVal := '0' + DMOracle.BuscaNome('SELECT SUM(VAL_APLICADO) FROM TB_OPER_CAMBIO_TRV_CONTRATO','COD_OPERACAO_CAMBIO_TRV = ' + '0' + DMOperacaoCambio.QOperacaoCambioTRVCOD_OPERACAO_CAMBIO_TRV.Text);
  lbSaldo.Caption := formatFloat('#,##0.00', (DMOperacaoCambio.QOperacaoCambioTRVVAL_OPERACAO_DOLAR.Value * DMOperacaoCambio.QOperacaoCambioTRVVAL_TX_ATUAL.Value) - StrToFloat(wval));
end;

procedure TFOperacaoCambioTRVCad.SBDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);
  if FDepartamentoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFOperacaoCambioTRVCad.SBContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFOperacaoCambioTRVCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOperacaoCambioTRVCad.SBHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFOperacaoCambioTRVCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioTRV.close;
  DMOperacaoCambio.QOperacaoCambioTRV.open;
  DMOperacaoCambio.QOperacaoCambioTRVLiq.close;
  DMOperacaoCambio.QOperacaoCambioTRVLiq.open;
  DMOperacaoCambio.QOperCambioTRVContrato.close;
  DMOperacaoCambio.QOperCambioTRVContrato.open;


  pcOperacao.ActivePage := tsDadosOperacao;
end;

procedure TFOperacaoCambioTRVCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    SBContaCorrente.Enabled := true;
    SBDepartamento.Enabled  := true;
    SBFilial.Enabled        := true;
    SBHistorico.Enabled     := true;
  end
  else
  begin
    SBContaCorrente.Enabled := false;
    SBDepartamento.Enabled  := false;
    SBFilial.Enabled        := false;
    SBHistorico.Enabled     := false;
  end;
end;

procedure TFOperacaoCambioTRVCad.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  //calcula a dt de vencimento baseada no periodo
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioTRVDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioTRVDT_LIQUIDACAO.Value :=
        DMOperacaoCambio.QOperacaoCambioTRVDT_OPERACAO.Value +
          DMOperacaoCambio.QOperacaoCambioTRVNUM_PERIODO_OPERACAO.Value;
end;

procedure TFOperacaoCambioTRVCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  //calcula o periodo baseado na dt de vencimento
  if DSPrimario.State in [dsEdit, dsInsert] then
    if trim(DMOperacaoCambio.QOperacaoCambioTRVDT_OPERACAO.Text) <> '' then
      DMOperacaoCambio.QOperacaoCambioTRVNUM_PERIODO_OPERACAO.Value :=
        trunc(DMOperacaoCambio.QOperacaoCambioTRVDT_LIQUIDACAO.Value -
          DMOperacaoCambio.QOperacaoCambioTRVDT_OPERACAO.Value);
end;

procedure TFOperacaoCambioTRVCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioTRVCons = nil then
    FOperacaoCambioTRVCons := TFOperacaoCambioTRVCons.create(application);

  if FOperacaoCambioTRVCons.showmodal = mrok then
  begin
    DMOperacaoCambio.QOperacaoCambioTRV.close;
    DMOperacaoCambio.QOperacaoCambioTRV.SetVariable('PK', DMOperacaoCambio.QOperacaoCambioTRVConsCOD_OPERACAO_CAMBIO_TRV.Value);
    DMOperacaoCambio.QOperacaoCambioTRV.OPEN;
  end;
end;

procedure TFOperacaoCambioTRVCad.SBNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.create(application);

  if FNotaSaidaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVLiqCOD_NOTA_CAB.Value :=
      DMContasReceber.QNotaSaidaConsCOD_NOTA_CAB.Value;
end;

procedure TFOperacaoCambioTRVCad.SBContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
    DMOperacaoCambio.QOperacaoCambioTRVLiqCOD_CONTRATO_VEND.Value :=
      DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Value;
end;

procedure TFOperacaoCambioTRVCad.DSOperacaoCambioTRVLiqStateChange(
  Sender: TObject);
begin
  inherited;
  if DSOperacaoCambioTRVLiq.State in [dsEdit, dsInsert] then
  begin
    SBNota.Enabled     := true;
    SBContrato.Enabled := true;
  end
  else
  begin
    SBNota.Enabled     := false;
    SBContrato.Enabled := false;
  end;
end;

procedure TFOperacaoCambioTRVCad.RelaodeOperaodeCmbioTrava1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam := TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[3].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin

    DMOperacaoCambio.QROperacaoCambioTRV.close;

    if FOperacaoCambioParam.ME4DtBase.Text = '' then
      FOperacaoCambioParam.ME4DtBase.Text := datetostr(date);

    DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_OPERACAO_BASE',strtodate(FOperacaoCambioParam.ME4DtBase.Text));

    if trim(FoperacaoCambioParam.ME4NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME4NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME4ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME4ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME4Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME4Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME4Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME4Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME4DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME4DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME4DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME4DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME4DtLiquidacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_LIQUIDACAO_INICIO',trim(FoperacaoCambioParam.ME4DtLiquidacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_LIQUIDACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME4DtLiquidacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_LIQUIDACAO_FIM',trim(FoperacaoCambioParam.ME4DtLiquidacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRV.SetVariable('DT_LIQUIDACAO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioTRV.open;

    if FROperacaoCambioTRV = nil then
      FROperacaoCambioTRV := TFROperacaoCambioTRV.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperacaoCambioTRV.QRPrimario.Preview
    else
      FROperacaoCambioTRV.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioTRV.Close;
  end;
end;

procedure TFOperacaoCambioTRVCad.RelaodeOperaodeCmbioTravaLiq1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[4].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin

    DMOperacaoCambio.QROperacaoCambioTRVLiq.close;

    if trim(FoperacaoCambioParam.ME5NumContrato.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('NUM_CONTRATO',trim(FoperacaoCambioParam.ME5NumContrato.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('NUM_CONTRATO',null);

    if trim(FoperacaoCambioParam.ME5ContaCorrente.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_CONTA_CORRENTE',trim(FoperacaoCambioParam.ME5ContaCorrente.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FoperacaoCambioParam.ME5Departamento.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_DEPARTAMENTO',trim(FoperacaoCambioParam.ME5Departamento.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_DEPARTAMENTO',null);

    if trim(FoperacaoCambioParam.ME5Filial.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_FILIAL',trim(FoperacaoCambioParam.ME5Filial.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('COD_FILIAL',null);

    if trim(FoperacaoCambioParam.ME5DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME5DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME5DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME5DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_OPERACAO_FIM',null);

    if trim(FoperacaoCambioParam.ME5DtLiquidacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_LIQUIDACAO_INICIO',trim(FoperacaoCambioParam.ME5DtLiquidacaoInicio.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_LIQUIDACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME5DtLiquidacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_LIQUIDACAO_FIM',trim(FoperacaoCambioParam.ME5DtLiquidacaoFinal.Text))
    else
      DMOperacaoCambio.QROperacaoCambioTRVLiq.SetVariable('DT_LIQUIDACAO_FIM',null);

    DMOperacaoCambio.QROperacaoCambioTRVLiq.open;

    if FROperacaoCambioTRVLiq = nil then
      FROperacaoCambioTRVLiq := TFROperacaoCambioTRVLiq.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperacaoCambioTRVLiq.QRPrimario.Preview
    else
      FROperacaoCambioTRVLiq.QRPrimario.Print;

    DMOperacaoCambio.QROperacaoCambioTRVLiq.Close;
  end;

end;

procedure TFOperacaoCambioTRVCad.DSContratoAplicadoStateChange(
  Sender: TObject);
begin
  inherited;
  if DSContratoAplicado.State in [dsEdit, dsInsert] then
    SBContratoAplicado.Enabled := true
  else
    SBContratoAplicado.Enabled := false;
end;

procedure TFOperacaoCambioTRVCad.OperaodeCmbioACCAplicadoaContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[8].TabVisible := True;
  If FoperacaoCambioParam.ShowModal = mrOk then
  begin
    DMOperacaoCambio.QROperTRVAplicadoContratoVenda.close;


    if trim(FoperacaoCambioParam.ME9OperacaoCambio.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_TRV',trim(FoperacaoCambioParam.ME9OperacaoCambio.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('COD_OPERACAO_CAMBIO_TRV',null);

    if trim(FoperacaoCambioParam.ME9ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME9ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME9DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME9DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME9DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME9DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_OPERACAO_FIM',null);



    if trim(FoperacaoCambioParam.ME9DtAplicadoInicio.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',trim(FoperacaoCambioParam.ME9DtAplicadoInicio.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_APLICADO_INICIO',null);

    if trim(FoperacaoCambioParam.ME9DtAplicadoFim.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',trim(FoperacaoCambioParam.ME9DtAplicadoFim.Text))
    else
      DMOperacaoCambio.QROperTRVAplicadoContratoVenda.SetVariable('DT_APLICADO_FIM',null);



    DMOperacaoCambio.QROperTRVAplicadoContratoVenda.open;

    if FROperTRVAplicadoContratoVenda = nil then
      FROperTRVAplicadoContratoVenda := TFROperTRVAplicadoContratoVenda.create(application);


    FROperTRVAplicadoContratoVenda.QRLNumContrato.Caption := FoperacaoCambioParam.ed7OperacaoCambio.Text;

    FROperTRVAplicadoContratoVenda.QRLDtOperacao.Caption := '';
    if (FoperacaoCambioParam.ME9DtOperacaoInicio.Text <> '') and
       (FoperacaoCambioParam.ME9DtOperacaoFinal.Text <> '')  then
      FROperTRVAplicadoContratoVenda.QRLDtOperacao.Caption := FoperacaoCambioParam.ME9DtOperacaoInicio.Text + ' até ' + FoperacaoCambioParam.ME9DtOperacaoFinal.Text;

    //FROperTRVAplicadoContratoVenda.QRLDtCredito.Caption := '';
    //if (FoperacaoCambioParam.ME9DtCreditoInicio.Text <> '') and
    //   (FoperacaoCambioParam.ME9DtCreditoFinal.Text <> '')  then
    //  FROperTRVAplicadoContratoVenda.QRLDtCredito.Caption := FoperacaoCambioParam.ME9DtCreditoInicio.Text + ' até ' + FoperacaoCambioParam.ME9DtCreditoFinal.Text;

    FROperTRVAplicadoContratoVenda.QRLDtAplicacao.Caption := '';
    if (FoperacaoCambioParam.ME9DtAplicadoInicio.Text <> '') and
       (FoperacaoCambioParam.ME9DtAplicadoFim.Text <> '')  then
      FROperTRVAplicadoContratoVenda.QRLDtAplicacao.Caption := FoperacaoCambioParam.ME9DtAplicadoInicio.Text + ' até ' + FoperacaoCambioParam.ME9DtAplicadoFim.Text;


    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperTRVAplicadoContratoVenda.QRPrimario.Preview
    else
      FROperTRVAplicadoContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperTRVAplicadoContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioTRVCad.OperaodeCmbioTravaaAplicarContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FoperacaoCambioParam = Nil then
    FoperacaoCambioParam:= TFoperacaoCambioParam.Create(Application);
  FoperacaoCambioParam.PGRelatorio.Pages[11].TabVisible:=True;
  If FoperacaoCambioParam.ShowModal =  mrOk then
  begin
    DMOperacaoCambio.QROperTRVAplicarContratoVenda.close;

    if trim(FoperacaoCambioParam.ME12ContratoVenda.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',trim(FoperacaoCambioParam.ME12ContratoVenda.Text))
    else
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('COD_CONTRATO_VEND',null);

    if trim(FoperacaoCambioParam.ME12DtOperacaoInicio.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',trim(FoperacaoCambioParam.ME12DtOperacaoInicio.Text))
    else
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('DT_OPERACAO_INICIO',null);

    if trim(FoperacaoCambioParam.ME12DtOperacaoFinal.Text) <> '' then
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',trim(FoperacaoCambioParam.ME12DtOperacaoFinal.Text))
    else
      DMOperacaoCambio.QROperTRVAplicarContratoVenda.SetVariable('DT_OPERACAO_FIM',null);

    DMOperacaoCambio.QROperTRVAplicarContratoVenda.open;

    if FROperTRVAplicarContratoVenda = nil then
      FROperTRVAplicarContratoVenda := TFROperTRVAplicarContratoVenda.create(application);

    If FoperacaoCambioParam.RGPreview.ItemIndex = 0 then
      FROperTRVAplicarContratoVenda.QRPrimario.Preview
    else
      FROperTRVAplicarContratoVenda.QRPrimario.Print;

    DMOperacaoCambio.QROperTRVAplicarContratoVenda.Close;
  end;
end;

procedure TFOperacaoCambioTRVCad.DSContratoAplicadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;
end;

procedure TFOperacaoCambioTRVCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  AtualizaSaldoAplicar;
end;

end.
