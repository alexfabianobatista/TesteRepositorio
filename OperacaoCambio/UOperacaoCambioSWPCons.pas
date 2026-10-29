unit UOperacaoCambioSWPCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  UFmContaCorrente;

type
  TFOperacaoCambioSWPCons = class(TFTConsulta)
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MeDtOperacaoInicio: TMaskEdit;
    MeDtOperacaoFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    MEDtVencimentoInicio: TMaskEdit;
    MEDtVencimentoFim: TMaskEdit;
    RGBaixa: TRadioGroup;
    MEDepartamento: TMaskEdit;
    SpeedButton1: TSpeedButton;
    edDepartamento: TEdit;
    FmContaCorrente1: TFmContaCorrente;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    MeDtLiq_I: TMaskEdit;
    MeDtLiq_F: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioSWPCons: TFOperacaoCambioSWPCons;

implementation

uses UOperacaoCambio_cl, UOracle_cl, UContaCorrenteCons, UBancoAgencia_cl,
  UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFOperacaoCambioSWPCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioSWPCons.close;

  if trim(METexto.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('NUM_CONTRATO',trim(METexto.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('NUM_CONTRATO',null);


  if trim(MEDepartamento.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('COD_DEPARTAMENTO',trim(MEDepartamento.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('COD_DEPARTAMENTO',null);

  if trim(MeDtOperacaoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_OPERACAO_INICIO',trim(MeDtOperacaoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_OPERACAO_INICIO',null);

  if trim(MeDtOperacaoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_OPERACAO_FIM',trim(MeDtOperacaoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_OPERACAO_FIM',null);

  if trim(MeDtLiq_I.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_LIQUIDACAO_I', trim(MeDtLiq_I.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_LIQUIDACAO_I', null);

  if trim(MeDtLiq_F.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_LIQUIDACAO_F', trim(MeDtLiq_F.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_LIQUIDACAO_F', null);

  if trim(MEDtVencimentoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_VENCIMENTO_INICIO',trim(MEDtVencimentoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_VENCIMENTO_INICIO',null);

  if trim(MEDtVencimentoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_VENCIMENTO_FIM',trim(MEDtVencimentoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('DT_VENCIMENTO_FIM',null);
  if trim(FmContaCorrente1.MeContaCorrente.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('CONTA_CORRENTE', trim(FmContaCorrente1.MeContaCorrente.Text))
  else
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('CONTA_CORRENTE', null);

  if RGBaixa.ItemIndex = 0 then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('IND_BAIXADO',null);
  if RGBaixa.ItemIndex = 1 then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('IND_BAIXADO','NAO');
  if RGBaixa.ItemIndex = 2 then
    DMOperacaoCambio.QOperacaoCambioSWPCons.SetVariable('IND_BAIXADO','SIM');

  DMOperacaoCambio.QOperacaoCambioSWPCons.Open;
end;

procedure TFOperacaoCambioSWPCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    edDepartamento.Text := '';
end;

procedure TFOperacaoCambioSWPCons.SpeedButton1Click(Sender: TObject);
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
