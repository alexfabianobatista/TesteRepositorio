unit UOperacaoCambioEPTCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFOperacaoCambioEPTCons = class(TFTConsulta)
    SBBanco: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    edContaCorrente: TEdit;
    edDepartamento: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MeDtOperacaoInicio: TMaskEdit;
    MeDtOperacaoFim: TMaskEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MEDtCreditoInicio: TMaskEdit;
    MEDtCreditoFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    MEDtVencimentoInicio: TMaskEdit;
    MEDtVencimentoFim: TMaskEdit;
    RGBaixa: TRadioGroup;
    MEContaCorrente: TMaskEdit;
    MEDepartamento: TMaskEdit;
    procedure SBBancoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioEPTCons: TFOperacaoCambioEPTCons;

implementation

uses UContaCorrenteCons, UBancoAgencia_cl, UDepartamentoCons,
  UDepartamento_cl, UOracle_cl, UOperacaoCambio_cl;

{$R *.DFM}

procedure TFOperacaoCambioEPTCons.SBBancoClick(Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    MEContaCorrente.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    MEContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioEPTCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If (FDepartamentoCons = nil) Then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If (FDepartamentoCons.ShowModal = mrOk) Then
  begin
    MEDepartamento.Text := floattostr(DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value);
    MEDepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioEPTCons.MEContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrente.Text) <> '' then
    EDContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrente.Text)
  else
    EDContaCorrente.Text := '';
end;

procedure TFOperacaoCambioEPTCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    edDepartamento.Text := '';
end;

procedure TFOperacaoCambioEPTCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioEPTCons.close;

  if trim(METexto.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('NUM_CONTRATO',trim(METexto.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('NUM_CONTRATO',null);

  if trim(MEContaCorrente.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('COD_CONTA_CORRENTE',trim(MEContaCorrente.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('COD_CONTA_CORRENTE',null);

  if trim(MEDepartamento.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('COD_DEPARTAMENTO',trim(MEDepartamento.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('COD_DEPARTAMENTO',null);

  if trim(MeDtOperacaoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_OPERACAO_INICIO',trim(MeDtOperacaoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_OPERACAO_INICIO',null);

  if trim(MeDtOperacaoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_OPERACAO_FIM',trim(MeDtOperacaoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_OPERACAO_FIM',null);

  if trim(MEDtCreditoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_CREDITO_INICIO',trim(MEDtCreditoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_CREDITO_INICIO',null);

  if trim(MEDtCreditoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_CREDITO_FIM',trim(MEDtCreditoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_CREDITO_FIM',null);

  if trim(MEDtVencimentoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_VENCIMENTO_INICIO',trim(MEDtVencimentoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_VENCIMENTO_INICIO',null);

  if trim(MEDtVencimentoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_VENCIMENTO_FIM',trim(MEDtVencimentoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('DT_VENCIMENTO_FIM',null);

  if RGBaixa.ItemIndex = 0 then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('IND_BAIXADO',null);
  if RGBaixa.ItemIndex = 1 then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('IND_BAIXADO','NAO');
  if RGBaixa.ItemIndex = 2 then
    DMOperacaoCambio.QOperacaoCambioEPTCons.SetVariable('IND_BAIXADO','SIM');

  DMOperacaoCambio.QOperacaoCambioEPTCons.Open;
end;

end.
