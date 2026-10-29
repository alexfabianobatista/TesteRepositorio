unit UOperacaoCambioPRTCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFOperacaoCambioPRTCons = class(TFTConsulta)
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
    SBBanco: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    MEContaCorrente: TMaskEdit;
    edContaCorrente: TEdit;
    MEDepartamento: TMaskEdit;
    edDepartamento: TEdit;
    procedure SBBancoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioPRTCons: TFOperacaoCambioPRTCons;

implementation

uses UOperacaoCambio_cl, UBancosCons, UBancoAgencia_cl, UDepartamentoCons,
  UDepartamento_cl, UOracle_cl, UContaCorrenteCons;

{$R *.DFM}

procedure TFOperacaoCambioPRTCons.SBBancoClick(Sender: TObject);
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

procedure TFOperacaoCambioPRTCons.SpeedButton1Click(Sender: TObject);
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

procedure TFOperacaoCambioPRTCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioPRTCons.close;

  if trim(METexto.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('NUM_CONTRATO',trim(METexto.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('NUM_CONTRATO',null);

  if trim(MEContaCorrente.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('COD_CONTA_CORRENTE',trim(MEContaCorrente.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('COD_CONTA_CORRENTE',null);

  if trim(MEDepartamento.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('COD_DEPARTAMENTO',trim(MEDepartamento.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('COD_DEPARTAMENTO',null);

  if trim(MeDtOperacaoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_OPERACAO_INICIO',trim(MeDtOperacaoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_OPERACAO_INICIO',null);

  if trim(MeDtOperacaoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_OPERACAO_FIM',trim(MeDtOperacaoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_OPERACAO_FIM',null);

  if trim(MEDtCreditoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_CREDITO_INICIO',trim(MEDtCreditoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_CREDITO_INICIO',null);

  if trim(MEDtCreditoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_CREDITO_FIM',trim(MEDtCreditoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioPRTCons.SetVariable('DT_CREDITO_FIM',null);

  DMOperacaoCambio.QOperacaoCambioPRTCons.Open;
end;

procedure TFOperacaoCambioPRTCons.MEContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrente.Text) <> '' then
    EDContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrente.Text)
  else
    EDContaCorrente.Text := '';
end;

procedure TFOperacaoCambioPRTCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    edDepartamento.Text := '';
end;

end.
