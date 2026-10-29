unit UOperacaoCambioParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFOperacaoCambioParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME1NumContrato: TMaskEdit;
    Label1: TLabel;
    ME1ContaCorrente: TMaskEdit;
    Label2: TLabel;
    Ed1ContaCorrente: TEdit;
    SB1ContaCorrente: TSpeedButton;
    Label3: TLabel;
    ME1Departamento: TMaskEdit;
    SB1Departamento: TSpeedButton;
    Ed1Departamento: TEdit;
    Label4: TLabel;
    ME1Filial: TMaskEdit;
    SB1Filial: TSpeedButton;
    Ed1Filial: TEdit;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    ME1DtLimiteInicio: TMaskEdit;
    ME1DtLimiteFinal: TMaskEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ME1DtOperacaoInicio: TMaskEdit;
    ME1DtOperacaoFinal: TMaskEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ME1DtCreditoInicio: TMaskEdit;
    ME1DtCreditoFinal: TMaskEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    ME1DtVencimentoInicio: TMaskEdit;
    ME1DtVencimentoFinal: TMaskEdit;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    ME2NumContrato: TMaskEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME2DtLimiteInicio: TMaskEdit;
    ME2DtLimiteFinal: TMaskEdit;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    ME2DtOperacaoInicio: TMaskEdit;
    ME2DtOperacaoFinal: TMaskEdit;
    ME2ContaCorrente: TMaskEdit;
    SB2ContaCorrente: TSpeedButton;
    Label16: TLabel;
    Ed2ContaCorrente: TEdit;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME2DtCreditoInicio: TMaskEdit;
    ME2DtCreditoFinal: TMaskEdit;
    Label21: TLabel;
    ME2Departamento: TMaskEdit;
    SB2Departamento: TSpeedButton;
    Ed2Departamento: TEdit;
    Label22: TLabel;
    ME2Filial: TMaskEdit;
    SB2Filial: TSpeedButton;
    Ed2Filial: TEdit;
    GroupBox8: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME2DtVencimentoInicio: TMaskEdit;
    ME2DtVencimentoFinal: TMaskEdit;
    TabSheet3: TTabSheet;
    Label25: TLabel;
    ME3NumContrato: TMaskEdit;
    Label26: TLabel;
    ME3ContaCorrente: TMaskEdit;
    SB3ContaCorrente: TSpeedButton;
    Ed3ContaCorrente: TEdit;
    Label27: TLabel;
    ME3Departamento: TMaskEdit;
    SB3Departamento: TSpeedButton;
    Ed3Departamento: TEdit;
    Label28: TLabel;
    ME3Filial: TMaskEdit;
    SB3Filial: TSpeedButton;
    Ed3Filial: TEdit;
    GroupBox9: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    ME3DtOperacaoInicio: TMaskEdit;
    ME3DtOperacaoFinal: TMaskEdit;
    GroupBox10: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    ME3DtCreditoInicio: TMaskEdit;
    ME3DtCreditoFinal: TMaskEdit;
    TabSheet4: TTabSheet;
    Label33: TLabel;
    ME4NumContrato: TMaskEdit;
    Label34: TLabel;
    ME4ContaCorrente: TMaskEdit;
    SB4ContaCorrente: TSpeedButton;
    Ed4ContaCorrente: TEdit;
    Label35: TLabel;
    ME4Departamento: TMaskEdit;
    SB4Departamento: TSpeedButton;
    Ed4Departamento: TEdit;
    ME4Filial: TMaskEdit;
    SB4Filial: TSpeedButton;
    Ed4Filial: TEdit;
    GroupBox11: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    ME4DtOperacaoInicio: TMaskEdit;
    ME4DtOperacaoFinal: TMaskEdit;
    GroupBox12: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    ME4DtLiquidacaoInicio: TMaskEdit;
    ME4DtLiquidacaoFinal: TMaskEdit;
    TabSheet5: TTabSheet;
    Label40: TLabel;
    Label41: TLabel;
    ME5NumContrato: TMaskEdit;
    Label42: TLabel;
    ME5ContaCorrente: TMaskEdit;
    SB5ContaCorrente: TSpeedButton;
    Ed5ContaCorrente: TEdit;
    GroupBox13: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    ME5DtOperacaoInicio: TMaskEdit;
    ME5DtOperacaoFinal: TMaskEdit;
    ME5Departamento: TMaskEdit;
    Label45: TLabel;
    SB5Departamento: TSpeedButton;
    Ed5Departamento: TEdit;
    GroupBox14: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    ME5DtLiquidacaoInicio: TMaskEdit;
    ME5DtLiquidacaoFinal: TMaskEdit;
    Label48: TLabel;
    ME5Filial: TMaskEdit;
    SB5Filial: TSpeedButton;
    Ed5Filial: TEdit;
    TabSheet6: TTabSheet;
    Label49: TLabel;
    ME6NumContrato: TMaskEdit;
    Label50: TLabel;
    ME6ContaCorrente: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Ed6ContaCorrente: TEdit;
    Label51: TLabel;
    ME6Departamento: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Ed6Departamento: TEdit;
    Label52: TLabel;
    ME6Filial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Ed6Filial: TEdit;
    GroupBox16: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    ME6DtOperacaoInicio: TMaskEdit;
    ME6DtOperacaoFinal: TMaskEdit;
    GroupBox17: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    ME6DtCreditoInicio: TMaskEdit;
    ME6DtCreditoFinal: TMaskEdit;
    TabSheet7: TTabSheet;
    GroupBox15: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    ME7DtOperacaoInicio: TMaskEdit;
    ME7DtOperacaoFinal: TMaskEdit;
    GroupBox18: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    ME7DtCreditoInicio: TMaskEdit;
    ME7DtCreditoFinal: TMaskEdit;
    Label61: TLabel;
    ME7ContratoVenda: TMaskEdit;
    SpeedButton4: TSpeedButton;
    CB7todosContratos: TCheckBox;
    TabSheet8: TTabSheet;
    Label62: TLabel;
    ME8ContratoVenda: TMaskEdit;
    SpeedButton5: TSpeedButton;
    CB8todosContratos: TCheckBox;
    GroupBox19: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    ME8DtOperacaoInicio: TMaskEdit;
    ME8DtOperacaoFinal: TMaskEdit;
    GroupBox20: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    ME8DtCreditoInicio: TMaskEdit;
    ME8DtCreditoFinal: TMaskEdit;
    TabSheet9: TTabSheet;
    Label67: TLabel;
    ME9ContratoVenda: TMaskEdit;
    SpeedButton6: TSpeedButton;
    CB9todosContratos: TCheckBox;
    GroupBox21: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    ME9DtOperacaoInicio: TMaskEdit;
    ME9DtOperacaoFinal: TMaskEdit;
    TabSheet10: TTabSheet;
    Label70: TLabel;
    ME10ContratoVenda: TMaskEdit;
    SpeedButton7: TSpeedButton;
    CB10todosContratos: TCheckBox;
    GroupBox22: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    ME10DtOperacaoInicio: TMaskEdit;
    ME10DtOperacaoFinal: TMaskEdit;
    GroupBox23: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    ME10DtCreditoInicio: TMaskEdit;
    ME10DtCreditoFinal: TMaskEdit;
    TabSheet11: TTabSheet;
    Label75: TLabel;
    ME11ContratoVenda: TMaskEdit;
    SpeedButton8: TSpeedButton;
    CB11todosContratos: TCheckBox;
    GroupBox24: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    ME11DtOperacaoInicio: TMaskEdit;
    ME11DtOperacaoFinal: TMaskEdit;
    GroupBox25: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    ME11DtCreditoInicio: TMaskEdit;
    ME11DtCreditoFinal: TMaskEdit;
    TabSheet12: TTabSheet;
    Label80: TLabel;
    ME12ContratoVenda: TMaskEdit;
    SpeedButton9: TSpeedButton;
    CB12todosContratos: TCheckBox;
    GroupBox26: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    ME12DtOperacaoInicio: TMaskEdit;
    ME12DtOperacaoFinal: TMaskEdit;
    Label83: TLabel;
    ME1DtBase: TMaskEdit;
    Label84: TLabel;
    ME3DtBase: TMaskEdit;
    Label85: TLabel;
    ME4DtBase: TMaskEdit;
    TabSheet13: TTabSheet;
    GroupBox27: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    ME13DtVariacaoCambialInicio: TMaskEdit;
    ME13DtVariacaoCambialFinal: TMaskEdit;
    ME13NumContrato: TMaskEdit;
    Label88: TLabel;
    RG1Garantia: TRadioGroup;
    GroupBox28: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    ME2DtLiquidacaoIni: TMaskEdit;
    ME2DtLiquidacaoFim: TMaskEdit;
    TabSheet14: TTabSheet;
    Label91: TLabel;
    Label93: TLabel;
    SB14Departamento: TSpeedButton;
    Label94: TLabel;
    SB14Filial: TSpeedButton;
    ME14NumContrato: TMaskEdit;
    ME14Departamento: TMaskEdit;
    Ed14Departamento: TEdit;
    ME14Filial: TMaskEdit;
    Ed14Filial: TEdit;
    GroupBox30: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    ME14DtOperacaoInicio: TMaskEdit;
    ME14DtOperacaoFinal: TMaskEdit;
    GroupBox32: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    ME14DtVencimentoInicio: TMaskEdit;
    ME14DtVencimentoFinal: TMaskEdit;
    RG14Garantia: TRadioGroup;
    TabSheet15: TTabSheet;
    Label96: TLabel;
    Label97: TLabel;
    SpeedButton10: TSpeedButton;
    Label104: TLabel;
    SpeedButton11: TSpeedButton;
    Label105: TLabel;
    SpeedButton12: TSpeedButton;
    Label106: TLabel;
    ME15NumContrato: TMaskEdit;
    ME15ContaCorrente: TMaskEdit;
    Ed15ContaCorrente: TEdit;
    ME15Departamento: TMaskEdit;
    Ed15Departamento: TEdit;
    ME15Filial: TMaskEdit;
    Ed15Filial: TEdit;
    GroupBox33: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    ME15DtOperacaoInicio: TMaskEdit;
    ME15DtOperacaoFinal: TMaskEdit;
    GroupBox34: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    ME15DtCreditoInicio: TMaskEdit;
    ME15DtCreditoFinal: TMaskEdit;
    GroupBox35: TGroupBox;
    Label113: TLabel;
    Label114: TLabel;
    ME15DtVencimentoInicio: TMaskEdit;
    ME15DtVencimentoFinal: TMaskEdit;
    ME15DtBase: TMaskEdit;
    RG15Garantia: TRadioGroup;
    TabSheet16: TTabSheet;
    Label107: TLabel;
    SB16ContaCorrente: TSpeedButton;
    Label108: TLabel;
    Label115: TLabel;
    SB16Departamento: TSpeedButton;
    Label116: TLabel;
    SB16Filial: TSpeedButton;
    ME16NumContrato: TMaskEdit;
    GroupBox36: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    ME16DtOperacaoInicio: TMaskEdit;
    ME16DtOperacaoFinal: TMaskEdit;
    ME16ContaCorrente: TMaskEdit;
    Ed16ContaCorrente: TEdit;
    GroupBox37: TGroupBox;
    Label121: TLabel;
    Label122: TLabel;
    ME16DtCreditoInicio: TMaskEdit;
    ME16DtCreditoFinal: TMaskEdit;
    ME16Departamento: TMaskEdit;
    Ed16Departamento: TEdit;
    ME16Filial: TMaskEdit;
    Ed16Filial: TEdit;
    GroupBox38: TGroupBox;
    Label123: TLabel;
    Label124: TLabel;
    ME16DtVencimentoInicio: TMaskEdit;
    ME16DtVencimentoFinal: TMaskEdit;
    GroupBox39: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    ME16DtLiquidacaoIni: TMaskEdit;
    ME16DtLiquidacaoFim: TMaskEdit;
    TabSheet17: TTabSheet;
    Label117: TLabel;
    ME17NumContrato: TMaskEdit;
    GroupBox29: TGroupBox;
    Label118: TLabel;
    Label127: TLabel;
    ME17DtVariacaoCambialInicio: TMaskEdit;
    ME17DtVariacaoCambialFinal: TMaskEdit;
    TabSheet18: TTabSheet;
    Label128: TLabel;
    SB18ContaCorrente: TSpeedButton;
    Label129: TLabel;
    Label130: TLabel;
    SB18Departamento: TSpeedButton;
    Label131: TLabel;
    SB18Filial: TSpeedButton;
    ME18NumContrato: TMaskEdit;
    GroupBox40: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    ME18DtOperacaoInicio: TMaskEdit;
    ME18DtOperacaoFinal: TMaskEdit;
    ME18ContaCorrente: TMaskEdit;
    Ed18ContaCorrente: TEdit;
    GroupBox41: TGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    ME18DtCreditoInicio: TMaskEdit;
    ME18DtCreditoFinal: TMaskEdit;
    ME18Departamento: TMaskEdit;
    Ed18Departamento: TEdit;
    ME18Filial: TMaskEdit;
    Ed18Filial: TEdit;
    GroupBox42: TGroupBox;
    Label136: TLabel;
    Label137: TLabel;
    ME18DtVencimentoInicio: TMaskEdit;
    ME18DtVencimentoFinal: TMaskEdit;
    GroupBox43: TGroupBox;
    Label138: TLabel;
    Label139: TLabel;
    ME18DtLiquidacaoIni: TMaskEdit;
    ME18DtLiquidacaoFim: TMaskEdit;
    RG15Baixa: TRadioGroup;
    GroupBox44: TGroupBox;
    Label140: TLabel;
    Label141: TLabel;
    ME7DtAplicadoInicio: TMaskEdit;
    ME7DtAplicadoFim: TMaskEdit;
    GroupBox45: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    ME8DtAplicadoInicio: TMaskEdit;
    ME8DtAplicadoFim: TMaskEdit;
    GroupBox46: TGroupBox;
    Label144: TLabel;
    Label145: TLabel;
    ME9DtAplicadoInicio: TMaskEdit;
    ME9DtAplicadoFim: TMaskEdit;
    Label146: TLabel;
    ME7OperacaoCambio: TMaskEdit;
    SpeedButton13: TSpeedButton;
    ed7OperacaoCambio: TEdit;
    Label147: TLabel;
    ME8OperacaoCambio: TMaskEdit;
    SpeedButton14: TSpeedButton;
    ed8OperacaoCambio: TEdit;
    Label148: TLabel;
    ME9OperacaoCambio: TMaskEdit;
    SpeedButton15: TSpeedButton;
    ED9OperacaoCambio: TEdit;
    procedure ME1ContaCorrenteExit(Sender: TObject);
    procedure SB1ContaCorrenteClick(Sender: TObject);
    procedure ME1DepartamentoExit(Sender: TObject);
    procedure SB1DepartamentoClick(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure SB1FilialClick(Sender: TObject);
    procedure ME2ContaCorrenteExit(Sender: TObject);
    procedure ME2DepartamentoExit(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure SB2ContaCorrenteClick(Sender: TObject);
    procedure SB2DepartamentoClick(Sender: TObject);
    procedure SB2FilialClick(Sender: TObject);
    procedure ME3ContaCorrenteExit(Sender: TObject);
    procedure ME3DepartamentoExit(Sender: TObject);
    procedure ME3FilialExit(Sender: TObject);
    procedure SB3ContaCorrenteClick(Sender: TObject);
    procedure SB3DepartamentoClick(Sender: TObject);
    procedure SB3FilialClick(Sender: TObject);
    procedure ME4ContaCorrenteExit(Sender: TObject);
    procedure ME4DepartamentoExit(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure SB4ContaCorrenteClick(Sender: TObject);
    procedure SB4DepartamentoClick(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure ME5ContaCorrenteExit(Sender: TObject);
    procedure ME5DepartamentoExit(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure SB5ContaCorrenteClick(Sender: TObject);
    procedure SB5DepartamentoClick(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure ME6ContaCorrenteExit(Sender: TObject);
    procedure ME6DepartamentoExit(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CB7todosContratosClick(Sender: TObject);
    procedure ME7ContratoVendaChange(Sender: TObject);
    procedure ME8ContratoVendaChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CB8todosContratosClick(Sender: TObject);
    procedure ME9ContratoVendaChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure CB9todosContratosClick(Sender: TObject);
    procedure ME10ContratoVendaChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure CB10todosContratosClick(Sender: TObject);
    procedure ME11ContratoVendaChange(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CB11todosContratosClick(Sender: TObject);
    procedure ME12ContratoVendaChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CB12todosContratosClick(Sender: TObject);
    procedure ME14DepartamentoExit(Sender: TObject);
    procedure SB14DepartamentoClick(Sender: TObject);
    procedure ME14FilialExit(Sender: TObject);
    procedure SB14FilialClick(Sender: TObject);
    procedure ME15ContaCorrenteExit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME15DepartamentoExit(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME15FilialExit(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SB16ContaCorrenteClick(Sender: TObject);
    procedure ME16ContaCorrenteExit(Sender: TObject);
    procedure ME16DepartamentoExit(Sender: TObject);
    procedure SB16DepartamentoClick(Sender: TObject);
    procedure ME16FilialExit(Sender: TObject);
    procedure SB16FilialClick(Sender: TObject);
    procedure ME18ContaCorrenteExit(Sender: TObject);
    procedure SB18ContaCorrenteClick(Sender: TObject);
    procedure ME18DepartamentoExit(Sender: TObject);
    procedure SB18DepartamentoClick(Sender: TObject);
    procedure ME18FilialExit(Sender: TObject);
    procedure SB18FilialClick(Sender: TObject);
    procedure ME7OperacaoCambioExit(Sender: TObject);
    procedure ME8OperacaoCambioExit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ME9OperacaoCambioExit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCambioParam: TFOperacaoCambioParam;

implementation

uses UOracle_cl, UContaCorrenteCons, UBancoAgencia_cl, UDepartamentoCons,
  UDepartamento_cl, UFilialCons, UFilial_cl, UContratoVenda_Cons,
  Ucontrato_cl, UOperacaoCambioACCCons, UOperacaoCambio_cl,
  UOperacaoCambioPRTCons, UOperacaoCambioTRVCons;

{$R *.DFM}

procedure TFOperacaoCambioParam.ME1ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME1ContaCorrente.Text) <> '' then
    Ed1ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME1ContaCorrente.Text))
  else
    Ed1ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB1ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME1ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME1ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME1DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Departamento.Text) <> '' then
    Ed1Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME1Departamento.Text))
  else
    Ed1Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.SB1DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME1Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME1DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Filial.Text) <> '' then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME1Filial.Text))
  else
    Ed1Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME1Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME1FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME2ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME2ContaCorrente.Text) <> '' then
    Ed2ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME2ContaCorrente.Text))
  else
    Ed2ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME2DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME2Departamento.Text) <> '' then
    Ed2Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME2Departamento.Text))
  else
    Ed2Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME2Filial.Text) <> '' then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME2Filial.Text))
  else
    Ed2Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB2ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME2ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME2ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB2DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME2Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME2DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB2FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME2Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME2FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME3ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME3ContaCorrente.Text) <> '' then
    Ed3ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME3ContaCorrente.Text))
  else
    Ed3ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME3DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME3Departamento.Text) <> '' then
    Ed3Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME3Departamento.Text))
  else
    Ed3Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.ME3FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME3Filial.Text) <> '' then
    Ed3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME3Filial.Text))
  else
    Ed3Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB3ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME3ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME3ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB3DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME3Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME3DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB3FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME3Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME3FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME4ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME4ContaCorrente.Text) <> '' then
    Ed4ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME4ContaCorrente.Text))
  else
    Ed4ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME4DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME4Departamento.Text) <> '' then
    Ed4Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME4Departamento.Text))
  else
    Ed4Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME4Filial.Text) <> '' then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME4Filial.Text))
  else
    Ed4Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB4ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME4ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME4ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB4DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME4Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME4DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME4Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME4FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME5ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME5ContaCorrente.Text) <> '' then
    Ed5ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME5ContaCorrente.Text))
  else
    Ed5ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME5DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME5Departamento.Text) <> '' then
    Ed5Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME5Departamento.Text))
  else
    Ed5Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME5Filial.Text) <> '' then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME5Filial.Text))
  else
    Ed5Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB5ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME5ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME5ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB5DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME5Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME5DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME5Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME5FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME6ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME6ContaCorrente.Text) <> '' then
    Ed6ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME6ContaCorrente.Text))
  else
    Ed6ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME6DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME6Departamento.Text) <> '' then
    Ed6Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME6Departamento.Text))
  else
    Ed6Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME6Filial.Text) <> '' then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME6Filial.Text))
  else
    Ed6Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME6ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME6ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME6Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME6DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME6Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME6FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME7ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB7todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB7todosContratos.Checked then
    ME7ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME7ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB7todosContratos.Checked := (ME7ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.ME8ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB8todosContratos.Checked := (ME8ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME8ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB8todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB8todosContratos.Checked then
    ME8ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME9ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB9todosContratos.Checked := (ME9ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME9ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB9todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB9todosContratos.Checked then
    ME9ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME10ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB10todosContratos.Checked := (ME10ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME10ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB10todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB10todosContratos.Checked then
    ME10ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME11ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB11todosContratos.Checked := (ME11ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME11ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB11todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB11todosContratos.Checked then
    ME11ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME12ContratoVendaChange(Sender: TObject);
begin
  inherited;
  CB12todosContratos.Checked := (ME12ContratoVenda.Text = '');
end;

procedure TFOperacaoCambioParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.create(application);

  if FContrato_VendaCons.showmodal = mrok then
     ME12ContratoVenda.Text := DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.text;
end;

procedure TFOperacaoCambioParam.CB12todosContratosClick(Sender: TObject);
begin
  inherited;
  if CB12todosContratos.Checked then
    ME12ContratoVenda.Clear;
end;

procedure TFOperacaoCambioParam.ME14DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME14Departamento.Text) <> '' then
    Ed14Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME14Departamento.Text))
  else
    Ed14Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.SB14DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME14Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME14DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME14FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME14Filial.Text) <> '' then
    Ed14Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME14Filial.Text))
  else
    Ed14Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB14FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME14Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME14FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME15ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME15ContaCorrente.Text) <> '' then
    Ed15ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME15ContaCorrente.Text))
  else
    Ed15ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME15ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME15ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME15DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME15Departamento.Text) <> '' then
    Ed15Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME15Departamento.Text))
  else
    Ed15Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME15Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME15DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME15FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME15Filial.Text) <> '' then
    Ed15Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME15Filial.Text))
  else
    Ed15Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME15Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME15FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SB16ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME16ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME16ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME16ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME16ContaCorrente.Text) <> '' then
    Ed16ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME16ContaCorrente.Text))
  else
    Ed16ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME16DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME16Departamento.Text) <> '' then
    Ed16Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME16Departamento.Text))
  else
    Ed16Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.SB16DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME16Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME16DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME16FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME16Filial.Text) <> '' then
    Ed16Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME16Filial.Text))
  else
    Ed16Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB16FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME16Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME16FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME18ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME18ContaCorrente.Text) <> '' then
    Ed18ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME18ContaCorrente.Text))
  else
    Ed18ContaCorrente.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB18ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
  begin
    ME18ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
    ME18ContaCorrenteExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME18DepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(ME18Departamento.Text) <> '' then
    Ed18Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(ME18Departamento.Text))
  else
    Ed18Departamento.Text := 'Todos';
end;

procedure TFOperacaoCambioParam.SB18DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    ME18Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.AsString;
    ME18DepartamentoExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME18FilialExit(Sender: TObject);
begin
  inherited;
  if trim(ME18Filial.Text) <> '' then
    Ed18Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME18Filial.Text))
  else
    Ed18Filial.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SB18FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
  begin
    ME18Filial.Text := DMFilial.QFilialConsCOD_FILIAL.AsString;
    ME18FilialExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME7OperacaoCambioExit(Sender: TObject);
begin
  inherited;
  if trim(ME7OperacaoCambio.Text) <> '' then
    ed7OperacaoCambio.Text := DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_OPERACAO_CAMBIO_ACC','COD_OPERACAO_CAMBIO_ACC = ' + Trim(ME7OperacaoCambio.Text))
  else
    ed7OperacaoCambio.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.ME8OperacaoCambioExit(Sender: TObject);
begin
  inherited;
  if trim(ME8OperacaoCambio.Text) <> '' then
    ed8OperacaoCambio.Text := DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_OPERACAO_CAMBIO_PRT','COD_OPERACAO_CAMBIO_PRT = ' + Trim(ME8OperacaoCambio.Text))
  else
    ed8OperacaoCambio.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioACCCons = nil then
    FOperacaoCambioACCCons := TFOperacaoCambioACCCons.create(application);

  if FOperacaoCambioACCCons.showmodal = mrok then
  begin
    ME7OperacaoCambio.Text := DMOperacaoCambio.QOperacaoCambioACCConsCOD_OPERACAO_CAMBIO_ACC.text;
    ME7OperacaoCambioExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioPRTCons = nil then
    FOperacaoCambioPRTCons := TFOperacaoCambioPRTcons.create(application);

  if FOperacaoCambioPRTCons.showmodal = mrok then
  begin
    ME8OperacaoCambio.Text := DMOperacaoCambio.QOperacaoCambioPRTConsCOD_OPERACAO_CAMBIO_PRT.text;
    ME8OperacaoCambioExit(sender);
  end;
end;

procedure TFOperacaoCambioParam.ME9OperacaoCambioExit(Sender: TObject);
begin
  inherited;
  if trim(ME9OperacaoCambio.Text) <> '' then
    ed9OperacaoCambio.Text := DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_OPERACAO_CAMBIO_TRV','COD_OPERACAO_CAMBIO_TRV = ' + Trim(ME9OperacaoCambio.Text))
  else
    ed9OperacaoCambio.Text := 'Todas';
end;

procedure TFOperacaoCambioParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCambioTRVCons = nil then
    FOperacaoCambioTRVCons := TFOperacaoCambioTRVCons.create(application);

  if FOperacaoCambioTRVCons.showmodal = mrok then
  begin
    ME9OperacaoCambio.Text := DMOperacaoCambio.QOperacaoCambioTRVConsCOD_OPERACAO_CAMBIO_TRV.text;
    ME9OperacaoCambioExit(sender);
  end;
end;

end.
