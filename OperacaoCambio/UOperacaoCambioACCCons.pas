unit UOperacaoCambioACCCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFOperacaoCambioACCCons = class(TFTConsulta)
    MEContaCorrente: TMaskEdit;
    SBBanco: TSpeedButton;
    edContaCorrente: TEdit;
    MEDepartamento: TMaskEdit;
    SpeedButton1: TSpeedButton;
    edDepartamento: TEdit;
    Label2: TLabel;
    Label3: TLabel;
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
    procedure BtProcurarClick(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioACCCons: TFOperacaoCambioACCCons;

implementation

uses UOperacaoCambioACCCad, UOperacaoCambio_cl, UOracle_cl, UBancosCons,
  UBancoAgencia_cl, UDepartamentoCons, UDepartamento_cl, UContaCorrenteCons;

{$R *.DFM}

procedure TFOperacaoCambioACCCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioACCCons.close;

  if trim(METexto.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('NUM_CONTRATO',trim(METexto.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('NUM_CONTRATO',null);

  if trim(MEContaCorrente.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('COD_CONTA_CORRENTE',trim(MEContaCorrente.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('COD_CONTA_CORRENTE',null);

  if trim(MEDepartamento.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('COD_DEPARTAMENTO',trim(MEDepartamento.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('COD_DEPARTAMENTO',null);

  if trim(MeDtOperacaoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_OPERACAO_INICIO',trim(MeDtOperacaoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_OPERACAO_INICIO',null);

  if trim(MeDtOperacaoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_OPERACAO_FIM',trim(MeDtOperacaoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_OPERACAO_FIM',null);

  if trim(MEDtCreditoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_CREDITO_INICIO',trim(MEDtCreditoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_CREDITO_INICIO',null);

  if trim(MEDtCreditoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_CREDITO_FIM',trim(MEDtCreditoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_CREDITO_FIM',null);

  if trim(MEDtVencimentoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_VENCIMENTO_INICIO',trim(MEDtVencimentoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_VENCIMENTO_INICIO',null);

  if trim(MEDtVencimentoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_VENCIMENTO_FIM',trim(MEDtVencimentoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('DT_VENCIMENTO_FIM',null);

  if RGBaixa.ItemIndex = 0 then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('IND_BAIXADO',null);
  if RGBaixa.ItemIndex = 1 then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('IND_BAIXADO','NAO');
  if RGBaixa.ItemIndex = 2 then
    DMOperacaoCambio.QOperacaoCambioACCCons.SetVariable('IND_BAIXADO','SIM');


  DMOperacaoCambio.QOperacaoCambioACCCons.Open;
end;

procedure TFOperacaoCambioACCCons.MEContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrente.Text) <> '' then
    EDContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrente.Text)
  else
    EDContaCorrente.Text := '';
end;

procedure TFOperacaoCambioACCCons.SBBancoClick(Sender: TObject);
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

procedure TFOperacaoCambioACCCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    edDepartamento.Text := '';
end;

procedure TFOperacaoCambioACCCons.SpeedButton1Click(Sender: TObject);
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

end.
