unit UOperacaoCambioTRVCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFOperacaoCambioTRVCons = class(TFTConsulta)
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
    edContaCorrente: TEdit;
    edDepartamento: TEdit;
    Label2: TLabel;
    SBContaCorrente: TSpeedButton;
    MEContaCorrente: TMaskEdit;
    Label3: TLabel;
    MEDepartamento: TMaskEdit;
    SBDepartamento: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBContaCorrenteClick(Sender: TObject);
    procedure SBDepartamentoClick(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioTRVCons: TFOperacaoCambioTRVCons;

implementation

uses UOperacaoCambio_cl, UContaCorrenteCons, UBancoAgencia_cl,
  UDepartamentoCons, UDepartamento_cl, UOracle_cl;

{$R *.DFM}

procedure TFOperacaoCambioTRVCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOperacaoCambio.QOperacaoCambioTRVCons.close;

  if trim(METexto.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('NUM_CONTRATO',trim(METexto.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('NUM_CONTRATO',null);

  if trim(MEContaCorrente.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('COD_CONTA_CORRENTE',trim(MEContaCorrente.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('COD_CONTA_CORRENTE',null);

  if trim(MEDepartamento.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('COD_DEPARTAMENTO',trim(MEDepartamento.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('COD_DEPARTAMENTO',null);

  if trim(MeDtOperacaoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_OPERACAO_INICIO',trim(MeDtOperacaoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_OPERACAO_INICIO',null);

  if trim(MeDtOperacaoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_OPERACAO_FIM',trim(MeDtOperacaoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_OPERACAO_FIM',null);

  if trim(MEDtCreditoInicio.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_LIQUIDACAO_INICIO',trim(MEDtCreditoInicio.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_LIQUIDACAO_INICIO',null);

  if trim(MEDtCreditoFim.Text) <> '' then
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_LIQUIDACAO_FIM',trim(MEDtCreditoFim.Text))
  else
    DMOperacaoCambio.QOperacaoCambioTRVCons.SetVariable('DT_LIQUIDACAO_FIM',null);

  DMOperacaoCambio.QOperacaoCambioTRVCons.Open;
end;

procedure TFOperacaoCambioTRVCons.SBContaCorrenteClick(Sender: TObject);
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

procedure TFOperacaoCambioTRVCons.SBDepartamentoClick(Sender: TObject);
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

procedure TFOperacaoCambioTRVCons.MEContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrente.Text) <> '' then
    EDContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrente.Text)
  else
    EDContaCorrente.Text := '';
end;

procedure TFOperacaoCambioTRVCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    edDepartamento.Text := '';
end;

end.
