unit UContasPagarParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmBanco,
  UFmCadastro, UFmDepartamento, UFmFilial, UFmDatas, UFmFinalidade,
  UFmContaCorrente, UFmObra, UFmCidade;

type
  TFContasPagarParam = class(TFTParametro)
    TS0Vencimentos: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    ME0DataInicial: TMaskEdit;
    ME0DataFinal: TMaskEdit;
    TS1Fornecedor: TTabSheet;
    ME1Fornecedor: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    ME1Inicial: TMaskEdit;
    ME1Final: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    ME1Codigo: TMaskEdit;
    Label7: TLabel;
    ME1CodFilial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    ME1Filial: TMaskEdit;
    TabSheet1: TTabSheet;
    ME2CodFilial: TMaskEdit;
    ME2CodFornecedor: TMaskEdit;
    ME2Filial: TMaskEdit;
    ME2Fornecedor: TMaskEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    CB1TodosFilial: TCheckBox;
    CB1TodosFornec: TCheckBox;
    CB2TodosFilial: TCheckBox;
    CB2TodosFornec: TCheckBox;
    RGSituacao: TRadioGroup;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    SpeedButton8: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    ME4CodFilial: TMaskEdit;
    ME4CodFornecedor: TMaskEdit;
    ME4Filial: TMaskEdit;
    ME4Fornecedor: TMaskEdit;
    ME1CGCCPF: TMaskEdit;
    Label20: TLabel;
    CB1TodosCGCCPF: TCheckBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    ME2Inicial: TMaskEdit;
    Label10: TLabel;
    ME2Final: TMaskEdit;
    RGIndTipoMov: TRadioGroup;
    GroupBox4: TGroupBox;
    ME4Inicial: TMaskEdit;
    Label19: TLabel;
    ME4Final: TMaskEdit;
    Label18: TLabel;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    ME3Inicial: TMaskEdit;
    Label14: TLabel;
    ME3Final: TMaskEdit;
    ME1CodDepto: TMaskEdit;
    ME1Departamento: TMaskEdit;
    SpeedButton11: TSpeedButton;
    Label22: TLabel;
    CB1TodosDepto: TCheckBox;
    ME2CodDepto: TMaskEdit;
    ME2Departamento: TMaskEdit;
    SpeedButton12: TSpeedButton;
    Label23: TLabel;
    CB2TodosDepto: TCheckBox;
    ME3CodDepto: TMaskEdit;
    ME3Departamento: TMaskEdit;
    SpeedButton13: TSpeedButton;
    Label24: TLabel;
    CB3TodosDepto: TCheckBox;
    ME4CodDepto: TMaskEdit;
    SpeedButton14: TSpeedButton;
    Label25: TLabel;
    Rg4Ordem: TRadioGroup;
    SB4CodFornecedor: TSpeedButton;
    Label26: TLabel;
    Me4DtBase: TMaskEdit;
    Me0DtBase: TMaskEdit;
    Label27: TLabel;
    ME0CodDepto: TMaskEdit;
    SpeedButton10: TSpeedButton;
    Label21: TLabel;
    ME0CodFilial: TMaskEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    ME0Filial: TMaskEdit;
    ME0Departamento: TMaskEdit;
    Label28: TLabel;
    Me1Finalidade: TMaskEdit;
    SpeedButton9: TSpeedButton;
    Ed1Finalidade: TMaskEdit;
    Cb1Finalidade: TCheckBox;
    Label29: TLabel;
    Me4Finalidade: TMaskEdit;
    SpeedButton15: TSpeedButton;
    GbContas: TGroupBox;
    Label86: TLabel;
    Me4ContaNao5: TMaskEdit;
    Me4ContaNao1: TMaskEdit;
    Me4ContaNao2: TMaskEdit;
    Me4ContaNao3: TMaskEdit;
    Me4ContaNao4: TMaskEdit;
    Me4ContaNao6: TMaskEdit;
    Me4ContaNao7: TMaskEdit;
    Me4ContaNao8: TMaskEdit;
    Me4ContaNao9: TMaskEdit;
    Me4ContaNao10: TMaskEdit;
    TabSheet4: TTabSheet;
    Label30: TLabel;
    ME5CodFilial: TMaskEdit;
    SB5FilialCons: TSpeedButton;
    Label31: TLabel;
    ME5CodDepto: TMaskEdit;
    SB5DepartamentoCons: TSpeedButton;
    Label32: TLabel;
    ME5Finalidade: TMaskEdit;
    SB5FinalidadeCons: TSpeedButton;
    Ed5Finalidade: TMaskEdit;
    GroupBox6: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME5DataI: TMaskEdit;
    ME5DataF: TMaskEdit;
    ME5Departamento: TMaskEdit;
    ME5Filial: TMaskEdit;
    Rg1Ordem: TRadioGroup;
    Rg5FormaPagto: TRadioGroup;
    Rg5TipoMovimento: TRadioGroup;
    Label35: TLabel;
    Me4OrdemCompra: TMaskEdit;
    RG3Ordem: TRadioGroup;
    SpeedButton16: TSpeedButton;
    Label36: TLabel;
    Me0CodObra: TMaskEdit;
    Me0Obra: TMaskEdit;
    GroupBox7: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Me1DtEmissaoI: TMaskEdit;
    Me1DtEmissaoF: TMaskEdit;
    TabSheet5: TTabSheet;
    ME6Filial: TMaskEdit;
    ME6Finalidade: TMaskEdit;
    ME6DataBase: TMaskEdit;
    GroupBox8: TGroupBox;
    ME6DtInicial: TMaskEdit;
    ME6DtFinal: TMaskEdit;
    SB6Filial: TSpeedButton;
    SB6Finalidade: TSpeedButton;
    Ed6Filial: TEdit;
    Ed6Finalidade: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Rg2Opcao: TRadioGroup;
    SpeedButton17: TSpeedButton;
    ED4OrdemCompra: TEdit;
    Label42: TLabel;
    ME1OrdemCompra: TMaskEdit;
    SpeedButton18: TSpeedButton;
    Ed1OrdemCompra: TEdit;
    TabSheet6: TTabSheet;
    Label43: TLabel;
    ME7Filial: TMaskEdit;
    SB7Filial: TSpeedButton;
    Ed7Filial: TEdit;
    Label44: TLabel;
    ME7Cadastro: TMaskEdit;
    SB7Cadastro: TSpeedButton;
    Ed7Cadastro: TEdit;
    Label45: TLabel;
    ME7Departamento: TMaskEdit;
    SBe7Departamento: TSpeedButton;
    Ed7Departamento: TEdit;
    GroupBox9: TGroupBox;
    ME7DtInicial: TMaskEdit;
    ME7DtFinal: TMaskEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Me0TipoDocumento: TMaskEdit;
    GroupBox10: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    ME0DtMovimentoInicio: TMaskEdit;
    ME0DtMovimentoFim: TMaskEdit;
    Label51: TLabel;
    Me4TipoDocumento: TMaskEdit;
    Rg4Notas: TRadioGroup;
    TabSheet7: TTabSheet;
    Ed8Filial: TEdit;
    Ed8Departamento: TEdit;
    ME8Filial: TMaskEdit;
    ME8Departamento: TMaskEdit;
    Label52: TLabel;
    Label53: TLabel;
    SB8Filial: TSpeedButton;
    SB8Departamento: TSpeedButton;
    GB8Periodo: TGroupBox;
    ME8DtInicial: TMaskEdit;
    ME8DtFinal: TMaskEdit;
    Label54: TLabel;
    Label55: TLabel;
    Rg0Ordem: TRadioGroup;
    TabSheet8: TTabSheet;
    Label56: TLabel;
    SpeedButton19: TSpeedButton;
    Ed9Filial: TEdit;
    Me9Filial: TMaskEdit;
    Label59: TLabel;
    SpeedButton20: TSpeedButton;
    Me9Cadastro: TMaskEdit;
    Ed9Cadastro: TEdit;
    TabSheet9: TTabSheet;
    Label57: TLabel;
    SpeedButton21: TSpeedButton;
    Label58: TLabel;
    SpeedButton22: TSpeedButton;
    Ed10Filial: TEdit;
    Me10Filial: TMaskEdit;
    Me10Cadastro: TMaskEdit;
    Ed10Cadastro: TEdit;
    GroupBox11: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Me10DtInicial: TMaskEdit;
    Me10DtFinal: TMaskEdit;
    Label62: TLabel;
    Me10DtBaixa: TMaskEdit;
    TabSheet10: TTabSheet;
    FmFilial11: TFmFilial;
    FmDepartamento11: TFmDepartamento;
    FmFornecedor11: TFmCadastro;
    FMBanco11: TFMBanco;
    RGFormaPgto11: TRadioGroup;
    FmDatas1: TFmDatas;
    Fm7Finalidade: TFmFinalidade;
    Fm2Finalidade: TFmFinalidade;
    Fm5Cadastro: TFmCadastro;
    MeDatabase7: TMaskEdit;
    Label63: TLabel;
    TabSheet11: TTabSheet;
    Fm12Filial: TFmFilial;
    Fm12Departamento: TFmDepartamento;
    Fm12Finalidade: TFmFinalidade;
    GroupBox12: TGroupBox;
    Me12DtFinal: TMaskEdit;
    Label64: TLabel;
    Me12DtInicial: TMaskEdit;
    Label65: TLabel;
    ME12DtBase: TMaskEdit;
    Label66: TLabel;
    Fm12Cadastro: TFmCadastro;
    TabSheet12: TTabSheet;
    Fm13Filial: TFmFilial;
    Fm13Cadastro: TFmCadastro;
    GroupBox13: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    MeDtFinal: TMaskEdit;
    MeDtInicial: TMaskEdit;
    Fm13Finalidade: TFmFinalidade;
    TabSheet13: TTabSheet;
    Fm14Filial: TFmFilial;
    Fm14Cadastro: TFmCadastro;
    Fm14Finalidade: TFmFinalidade;
    Fm14ContaCorrente: TFmContaCorrente;
    GroupBox14: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Me14DtFinal: TMaskEdit;
    Me14DtInicial: TMaskEdit;
    Label71: TLabel;
    Me14NrCheque: TMaskEdit;
    TabSheet14: TTabSheet;
    Label72: TLabel;
    Me15DtLancamento: TMaskEdit;
    Label73: TLabel;
    Me15VlJiuros: TMaskEdit;
    Label74: TLabel;
    Me15Observacao: TMaskEdit;
    TabSheet15: TTabSheet;
    Fm16Filial: TFmFilial;
    Fm16Finalidade: TFmFinalidade;
    GroupBox15: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Me16DtFinal: TMaskEdit;
    Me16DtInicial: TMaskEdit;
    Fm0Cadastro: TFmCadastro;
    TabSheet16: TTabSheet;
    Fm17Filial: TFmFilial;
    Fm17Cadastro: TFmCadastro;
    Fm17Departamento: TFmDepartamento;
    Fm17Datas: TFmDatas;
    Label77: TLabel;
    Me17TipoDocumento: TMaskEdit;
    Rg17Ordem: TRadioGroup;
    Label78: TLabel;
    Me2TipoDocumento: TMaskEdit;
    RG6Tipo: TRadioGroup;
    Fm3Finalidade: TFmFinalidade;
    Fm3Obra: TFmObra;
    Fm3Filial: TFmFilial;
    Fm3Cadastro: TFmCadastro;
    GroupBox08DtEmissao: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Me6DataInicialLanca: TMaskEdit;
    Me6DataFinalLanca: TMaskEdit;
    GroupBox6Dtmovimento: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    ME5DataIEmissao: TMaskEdit;
    ME5DataFEmissao: TMaskEdit;
    CBDTEmissao: TCheckBox;
    Cb0DadosBancarios: TCheckBox;
    ME0CodFinalidade: TMaskEdit;
    SB0ConsFinalidade: TSpeedButton;
    ME0Finalidade: TMaskEdit;
    Label81: TLabel;
    Label82: TLabel;
    ME4CodNumTitulo: TMaskEdit;
    SB4NumTitulo: TSpeedButton;
    FmCidade4: TFmCidade;
    Rg3Tipo: TRadioGroup;
    Fm9FinalidadeCP: TFmFinalidade;
    Fm9FinalidadeCR: TFmFinalidade;
    TabSheet17: TTabSheet;
    FmFilial17: TFmFilial;
    GBDataReferencia17: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    MeDtFinRef17: TMaskEdit;
    MeDtIniRef17: TMaskEdit;
    GB2FormaPagamento: TGroupBox;
    CB2Caixa: TCheckBox;
    CB2Bancos: TCheckBox;
    CB2Contabil: TCheckBox;
    CB2Todos: TCheckBox;
    RG6IndSituacao: TRadioGroup;
    procedure ME0DataInicialExit(Sender: TObject);
    procedure ME0DataFinalExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME0CodFilialChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME1CodFilialChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ME2CodFilialChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME2CodFornecedorChange(Sender: TObject);
    procedure ME1CodigoChange(Sender: TObject);
    procedure CB1TodosFilialClick(Sender: TObject);
    procedure CB1TodosFornecClick(Sender: TObject);
    procedure CB2TodosFilialClick(Sender: TObject);
    procedure CB2TodosFornecClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ME4CodFilialChange(Sender: TObject);
    procedure ME4CodFornecedorChange(Sender: TObject);
    procedure ME1CGCCPFChange(Sender: TObject);
    procedure CB1TodosCGCCPFClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME0CodDeptoChange(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME1CodDeptoChange(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ME2CodDeptoChange(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ME3CodDeptoChange(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure CB3TodosDeptoClick(Sender: TObject);
    procedure CB2TodosDeptoClick(Sender: TObject);
    procedure CB1TodosDeptoClick(Sender: TObject);
    procedure Sb4FornecedorClick(Sender: TObject);
    procedure SB4CodFornecedorClick(Sender: TObject);
    procedure Me1FinalidadeChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Cb1FinalidadeClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure ME5CodFilialChange(Sender: TObject);
    procedure SB5FilialConsClick(Sender: TObject);
    procedure ME5CodDeptoChange(Sender: TObject);
    procedure SB5DepartamentoConsClick(Sender: TObject);
    procedure ME5FinalidadeChange(Sender: TObject);
    procedure SB5FinalidadeConsClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TS0VencimentosDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TS1FornecedorDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TabSheet1Show(Sender: TObject);
    procedure TS1FornecedorShow(Sender: TObject);
    procedure TS0VencimentosShow(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Me0CodObraChange(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SB6FilialClick(Sender: TObject);
    procedure SB6FinalidadeClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure ME6FinalidadeExit(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure Me4OrdemCompraExit(Sender: TObject);
    procedure ME1OrdemCompraExit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SB7FilialClick(Sender: TObject);
    procedure ME7FilialExit(Sender: TObject);
    procedure SBe7DepartamentoClick(Sender: TObject);
    procedure ME7DepartamentoExit(Sender: TObject);
    procedure SB7CadastroClick(Sender: TObject);
    procedure ME7CadastroExit(Sender: TObject);
    procedure SB8FilialClick(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure SB8DepartamentoClick(Sender: TObject);
    procedure ME8DepartamentoExit(Sender: TObject);
    procedure Me9FilialExit(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure Me9CadastroExit(Sender: TObject);
    procedure Me10FilialExit(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure Me10CadastroExit(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ME6FinalidadeChange(Sender: TObject);
    procedure Fm17DepartamentoMeDepartamentoChange(Sender: TObject);
    procedure Fm17DepartamentoMeDepartamentoExit(Sender: TObject);
    procedure SB0ConsFinalidadeClick(Sender: TObject);
    procedure SB4NumTituloClick(Sender: TObject);
    procedure CB2TodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasPagarParam: TFContasPagarParam;

implementation

uses UCadastroCons, UCadastro_cl, UOracle_cl, UFilialCons, UFilial_cl,
  UParamSistema_cl, UDepartamentoCons, UDepartamento_cl, UUsuario_cl,
  UFinalidadeCons, UFinalidade_cl, UObraCons, UObra_cl, UOrdemCompraCons,
  UOrdemCompra_cl, UBiblioteca, UContasPagar_cl, UContasPagarCons;

{$R *.DFM}


procedure TFContasPagarParam.ME0DataInicialExit(Sender: TObject);
{Var
  wData:TDate;}
begin
  inherited;
  {Try
     wData:=StrToDate(ME0DataInicial.text);
  Except
    Raise Exception.Create('Erro! Data Inválida');
  End;}
end;

procedure TFContasPagarParam.ME0DataFinalExit(Sender: TObject);
{Var
  wData:TDate;}
begin
  inherited;
  {Try
     wData:=StrToDate(ME0DataFinal.text);
  Except
    Raise Exception.Create('Erro! Data Inválida');
  End;}

end;

procedure TFContasPagarParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME1Codigo.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasPagarParam.ME0CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.Text)<>'' then
      ME0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0COdFilial.Text)
  else
      ME0Filial.Clear;
end;

procedure TFContasPagarParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME0CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasPagarParam.ME1CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.Text)<>'' then
    Begin
      ME1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilial.Text);
      CB1TodosFilial.Checked:=False;
    End
  else
    Begin
      ME1Filial.Clear;
      CB1TodosFilial.Checked:=True;
    End;
end;

procedure TFContasPagarParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME1CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasPagarParam.ME2CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilial.Text)<>'' then
    Begin
      ME2Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilial.Text);
      CB2TodosFilial.Checked:=False;
    End
  else
    Begin
      ME2Filial.Clear;
      CB2TodosFilial.Checked:=True;
    End;

end;

procedure TFContasPagarParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME2CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasPagarParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME2CodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;

end;

procedure TFContasPagarParam.ME2CodFornecedorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFornecedor.Text)<>'' then
    Begin
      ME2Fornecedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2CodFornecedor.Text);
      CB2TodosFornec.Checked:=False;
    End
  else
    Begin
      ME2Fornecedor.Clear;
      CB2TodosFornec.Checked:=True;
    End;
end;

procedure TFContasPagarParam.ME1CodigoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1Codigo.Text)<>'' then
    Begin
      ME1Fornecedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME1Codigo.Text);
      CB1TodosFornec.Checked:=False;
    End
  else
    Begin
      ME1Fornecedor.Clear;
      CB1TodosFornec.Checked:=True;
    End;
end;

procedure TFContasPagarParam.CB1TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB1TodosFilial.Checked Then
    Begin
      ME1CodFilial.Clear;
      Me1Filial.Text := 'Todas';
    End;  
end;

procedure TFContasPagarParam.CB1TodosFornecClick(Sender: TObject);
begin
  inherited;
  If CB1TodosFornec.Checked Then
    ME1Codigo.Clear;
end;

procedure TFContasPagarParam.CB2TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB2TodosFilial.Checked then
    ME2CodFilial.Clear;
end;

procedure TFContasPagarParam.CB2TodosFornecClick(Sender: TObject);
begin
  inherited;
  If CB2TodosFornec.Checked then
    ME2CodFornecedor.Clear;
end;

procedure TFContasPagarParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME4CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasPagarParam.ME4CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.Text)<>'' then
    Begin
      ME4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.Text);
    End
  else
    ME4Filial.Text := 'Todos';
end;

procedure TFContasPagarParam.ME4CodFornecedorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFornecedor.Text)<>'' then
    Begin
      ME4Fornecedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4CodFornecedor.Text);
    End
  else
    ME4Fornecedor.Text := 'Todos';
end;

procedure TFContasPagarParam.ME1CGCCPFChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CGCCPF.Text)<>'' then
    CB1TodosCGCCPF.Checked:=False
  else
    CB1TodosCGCCPF.Checked:=True;
end;

procedure TFContasPagarParam.CB1TodosCGCCPFClick(Sender: TObject);
begin
  inherited;
  if CB1TodosCGCCPF.Checked then
    ME1CGCCPF.Clear;
end;

procedure TFContasPagarParam.FormActivate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'QUERENCIA' then  //Solicitação Marcos(Querencia). Junior 13/10/2021
    ME0DataInicial.Text := DateToStr(Date())
  else
    ME0DataInicial.Text := DateToStr(Date() - 30);
  ME0DataFinal.Text := DateToStr(Date());
//  ME1Inicial.Text := DateToStr(Date() - 30);
//  ME1Final.Text := DateToStr(Date());
  ME2Inicial.Text := DateToStr(Date() - 30);
  ME2Final.Text := DateToStr(Date());
  ME4DtBase.Text := DateToStr(Date());
  ME0DtBase.Text := DateToStr(Date());
  ME5DataI.Text := DateToStr(Date());
  ME5DataF.Text := DateToStr(Date());
  MeDatabase7.Text := DateToStr(Date());
end;

procedure TFContasPagarParam.SpeedButton10Click(Sender: TObject);
var i: Integer;
  str: string;
begin
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  FDepartamentoCons.MultiSelect := True;
  if FDepartamentoCons.Showmodal = MrOk then
  begin
    if FDepartamentoCons.DBGrid1.SelectedRows.Count > 1 then
    begin
      Str := '';
      for i := 0 to FDepartamentoCons.DBGrid1.SelectedRows.Count - 1 do
      begin
        DMDepartamento.QDepartamentoCons.GotoBookmark(pointer(FDepartamentoCons.DBGrid1.SelectedRows.Items[i]));
        Str := Str + DMDepartamento.QDepartamentoCons.FieldByName('COD_DEPARTAMENTO').Text;
        if (i < (FDepartamentoCons.DBGrid1.SelectedRows.Count - 1)) then
          Str := Str + ',';
      end;
      ME0CodDepto.Text := Str;
      ME0Departamento.Text := 'VÁRIOS';
    end
    else
      ME0CodDepto.Text := FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
  end;
  FDepartamentoCons.MultiSelect := False;
end;

procedure TFContasPagarParam.ME0CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodDepto.text) <> '' then
    if Bib.LimpaNumero(Trim(ME0CodDepto.Text)) = Trim(ME0CodDepto.Text) then
      ME0Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO =' + ME0CodDepto.Text)
    else
      ME0Departamento.Text := 'VÁRIOS'
  Else
    ME0Departamento.Clear;
end;

procedure TFContasPagarParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME1CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasPagarParam.ME1CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodDepto.Text)<>'' then
    Begin
      ME1Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME1CodDepto.Text);
      CB1TodosDepto.Checked:=False;
    End
  else
    Begin
      ME1Departamento.Clear;
      CB1TodosDepto.Checked:=True;
    End;
end;

procedure TFContasPagarParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME2CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasPagarParam.ME2CodDeptoChange(Sender: TObject);
begin
  inherited;
  {if Trim(ME2CodDepto.Text)<>'' then
    Begin
      ME2Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME2CodDepto.Text);
      CB2TodosDepto.Checked:=False;
    End
  else
    Begin
      ME2Departamento.Clear;
      CB2TodosDepto.Checked:=True;
    End;}
  if Trim(ME2CodDepto.text) <> '' then
    if Bib.LimpaNumero(Trim(ME2CodDepto.Text)) = Trim(ME2CodDepto.Text) then
      ME2Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO =' + ME2CodDepto.Text)
    else
      ME2Departamento.Text := 'VÁRIOS'
  Else
    ME2Departamento.Clear;

end;

procedure TFContasPagarParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME3CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasPagarParam.ME3CodDeptoChange(Sender: TObject);
begin
  inherited;
  {if Trim(ME3CodDepto.Text)<>'' then
    Begin
      ME3Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME3CodDepto.Text);
      CB3TodosDepto.Checked:=False;
    End
  else
    Begin
      ME3Departamento.Clear;
      CB3TodosDepto.Checked:=True;
    End;}
    if Trim(ME3CodDepto.text) <> '' then
    if Bib.LimpaNumero(Trim(ME3CodDepto.Text)) = Trim(ME3CodDepto.Text) then
      ME3Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO =' + ME3CodDepto.Text)
    else
      ME3Departamento.Text := 'VÁRIOS'
  Else
    ME3Departamento.Clear;

end;

procedure TFContasPagarParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
  begin
    if ME4CodDepto.Text = '' then
      ME4CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value)
    else
      ME4CodDepto.Text := ME4CodDepto.Text + ' ,' +
        FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
  end;
end;

procedure TFContasPagarParam.CB3TodosDeptoClick(Sender: TObject);
begin
  inherited;
  If CB3TodosDepto.Checked then
    ME3CodDepto.Clear;
end;

procedure TFContasPagarParam.CB2TodosDeptoClick(Sender: TObject);
begin
  inherited;
  If CB2TodosDepto.Checked then
    ME2CodDepto.Clear;

end;

procedure TFContasPagarParam.CB1TodosDeptoClick(Sender: TObject);
begin
  inherited;
  If CB1TodosDepto.Checked then
    ME1CodDepto.Clear;
end;

procedure TFContasPagarParam.Sb4FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME4CodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;

end;

procedure TFContasPagarParam.SB4CodFornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    ME4CodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFContasPagarParam.Me1FinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1Finalidade.Text)<>'' then
    Begin
      Ed1Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME1Finalidade.Text);
      CB1Finalidade.Checked:=False;
    End
  else
    Begin
      Ed1Finalidade.Clear;
      CB1Finalidade.Checked:=True;
    End;

end;

procedure TFContasPagarParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    Begin
      ME1Finalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
    End;

end;

procedure TFContasPagarParam.Cb1FinalidadeClick(Sender: TObject);
begin
  inherited;
  If CB1Finalidade.Checked Then
    ME1Finalidade.Clear;

end;

procedure TFContasPagarParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    Begin
      If Trim(Me4Finalidade.Text) <> '' Then
        Me4Finalidade.Text := Me4Finalidade.Text + ',';
      ME4Finalidade.Text:=Me4Finalidade.Text + DMFinalidade.QFinalidadeConsCod_Finalidade.Text
    End;

end;

procedure TFContasPagarParam.ME5CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodFilial.Text)<>'' then
  begin
    ME5Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME5CodFilial.Text);
  end
  else
    ME5Filial.Text := 'Todos';
end;

procedure TFContasPagarParam.SB5FilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
     ME5CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasPagarParam.ME5CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodDepto.Text)<>'' then
    Begin
      ME5Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME5CodDepto.Text);
    End
  else
    ME5Departamento.Text := 'Todos';
end;

procedure TFContasPagarParam.SB5DepartamentoConsClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
     FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
     ME5CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value); 
end;

procedure TFContasPagarParam.ME5FinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5Finalidade.Text)<>'' then
     Ed5Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME5Finalidade.Text)
  else
     Ed5Finalidade.Text := 'Todos';
end;

procedure TFContasPagarParam.SB5FinalidadeConsClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
     FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
     ME5Finalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);

end;

procedure TFContasPagarParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  FContasPagarParam.helpcontext:=14;
end;

procedure TFContasPagarParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  FContasPagarParam.HelpContext:=15;
end;

procedure TFContasPagarParam.TS0VencimentosDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  FContasPagarParam.HelpContext:=11;
end;

procedure TFContasPagarParam.TS1FornecedorDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  FContasPagarParam.HelpContext:=13;
end;

procedure TFContasPagarParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FContasPagarParam.HelpContext:=12;
end;

procedure TFContasPagarParam.TS1FornecedorShow(Sender: TObject);
begin
  inherited;
  FContasPagarParam.HelpContext:=13;
end;

procedure TFContasPagarParam.TS0VencimentosShow(Sender: TObject);
begin
  inherited;
  FContasPagarParam.HelpContext:=11;
end;

procedure TFContasPagarParam.TabSheet4Show(Sender: TObject);
begin
  inherited;
  FContasPagarParam.HelpContext:=18;
end;

procedure TFContasPagarParam.Me0CodObraChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodObra.Text)<>'' then
     ME0Obra.Text:=DMOracle.BuscaNome('SELECT DESC_Obra FROM TB_Obra','COD_Obra = '+ME0CodObra.Text)
  else
     ME0Obra.Clear;
end;

procedure TFContasPagarParam.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  If FObraCons=Nil then
     FObraCons:=TFObraCons.Create(Application);
  If FObraCons.ShowModal=mrOk then
     ME0CodObra.Text:=FloatToStr(DMObra.QObra_ConsCod_Obra.Value);
end;

procedure TFContasPagarParam.SB6FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
     ME6Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
  Ed6Filial.Text:=DMfilial.QfilialConsDesc_filial.Text;
end;

procedure TFContasPagarParam.SB6FinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
     FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
     ME6Finalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
  Ed6Finalidade.Text := DMFinalidade.QFinalidadeConsDesc_Finalidade.Text;
end;

procedure TFContasPagarParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6Filial.text)<>'' then
    Ed6Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6Filial.text)
  else
    Ed6Filial.Text:='Todas';
end;

procedure TFContasPagarParam.ME6FinalidadeExit(Sender: TObject);
begin
  inherited;
  {If Trim(ME6Finalidade.Text)<>'' then
    Ed6Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME6Finalidade.Text)
  Else
    Ed6Finalidade.Text:='Todas';}
  if Trim(ME6Finalidade.Text) = '' then
    Ed6Finalidade.Text := 'TODOS'
end;

procedure TFContasPagarParam.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraCons = nil then
    FOrdemCompraCons := TFOrdemCompraCons.create(application);

  if FOrdemCompraCons.showmodal = mrok then
  begin
    ME4OrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsCOD_ORDEM_COMPRA_CAB.AsString;
    Me4OrdemCompraExit(sender);
  end;
end;

procedure TFContasPagarParam.Me4OrdemCompraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4OrdemCompra.Text)<>'' then
      ED4OrdemCompra.Text:=DMOracle.BuscaNome('SELECT NUM_ORDEM_COMPRA FROM TB_ORDEM_COMPRA_CAB','COD_ORDEM_COMPRA_CAB = '+Me4OrdemCompra.Text)
  else
    ED4OrdemCompra.Text := 'Todos';
end;

procedure TFContasPagarParam.ME1OrdemCompraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1OrdemCompra.Text)<>'' then
      ED1OrdemCompra.Text:=DMOracle.BuscaNome('SELECT NUM_ORDEM_COMPRA FROM TB_ORDEM_COMPRA_CAB','COD_ORDEM_COMPRA_CAB = '+Me1OrdemCompra.Text)
  else
    ED1OrdemCompra.Text := 'Todos';
end;

procedure TFContasPagarParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraCons = nil then
    FOrdemCompraCons := TFOrdemCompraCons.create(application);

  if FOrdemCompraCons.showmodal = mrok then
  begin
    ME1OrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsCOD_ORDEM_COMPRA_CAB.AsString;
    Me1OrdemCompraExit(sender);
  end;
end;

procedure TFContasPagarParam.SB7FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME7Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME7FilialExit(self);
end;

procedure TFContasPagarParam.ME7FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7Filial.text)<>'' then
    Ed7Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME7Filial.text)
  else
    Ed7Filial.Text:='Todas';
end;

procedure TFContasPagarParam.SBe7DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
     FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
     ME7Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
     ME7DepartamentoExit(self);
end;

procedure TFContasPagarParam.ME7DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7Departamento.text)<>'' then
    Ed7Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+ME7Departamento.text)
  else
    Ed7Departamento.Text:='Todos';
end;

procedure TFContasPagarParam.SB7CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    ME7Cadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  ME7CadastroExit(self);
end;

procedure TFContasPagarParam.ME7CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7Cadastro.text)<>'' then
    Ed7Cadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME7Cadastro.text)
  else
    Ed7Cadastro.Text:='Todos';
end;

procedure TFContasPagarParam.SB8FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME8Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
  ME8FilialExit(self);
end;

procedure TFContasPagarParam.ME8FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Filial.text)<>'' then
    Ed8Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8Filial.text)
  else
    Ed8Filial.Text:='Todas';
end;

procedure TFContasPagarParam.SB8DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
     FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
     ME8Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
     ME8DepartamentoExit(self);
end;

procedure TFContasPagarParam.ME8DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Departamento.text)<>'' then
    Ed8Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+ME8Departamento.text)
  else
    Ed8Departamento.Text:='Todos';   
end;

procedure TFContasPagarParam.Me9FilialExit(Sender: TObject);
begin
  inherited;
  Ed9Filial.Text := DMOracle.BuscaParametro('DESC_FILIAL','TB_FILIAL','COD_FILIAL',Me9Filial.text,'Todas');
end;

procedure TFContasPagarParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    Me9Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
  Me9FilialExit(self);

end;

procedure TFContasPagarParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Me9Cadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  Me9CadastroExit(self);

end;

procedure TFContasPagarParam.Me9CadastroExit(Sender: TObject);
begin
  inherited;
  Ed9Cadastro.Text := DMOracle.BuscaParametro('NOME','TB_CADASTRO','COD_CADASTRO',Me9Cadastro.text,'');

end;

procedure TFContasPagarParam.Me10FilialExit(Sender: TObject);
begin
  inherited;
  Ed10Filial.Text := DMOracle.BuscaParametro('DESC_FILIAL','TB_FILIAL','COD_FILIAL',Me10Filial.text,'Todas');

end;

procedure TFContasPagarParam.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    Me10Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
  Me10FilialExit(self);

end;

procedure TFContasPagarParam.Me10CadastroExit(Sender: TObject);
begin
  inherited;
  Ed10Cadastro.Text := DMOracle.BuscaParametro('NOME','TB_CADASTRO','COD_CADASTRO',Me10Cadastro.text,'');

end;

procedure TFContasPagarParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Me10Cadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  Me10CadastroExit(self);

end;

procedure TFContasPagarParam.ME6FinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME6Finalidade.text) <> '' then
    if Bib.LimpaNumero(Trim(ME6Finalidade.Text)) = Trim(ME6Finalidade.Text) then
      Ed6Finalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE =' + ME6Finalidade.Text)
    else
      Ed6Finalidade.Text := 'VÁRIOS'
  Else
    Ed6Finalidade.Clear;
end;

procedure TFContasPagarParam.Fm17DepartamentoMeDepartamentoChange(
  Sender: TObject);
begin
  inherited;
  if Trim(Fm17Departamento.MeDepartamento.text) <> '' then
    if Bib.LimpaNumero(Trim(Fm17Departamento.MeDepartamento.Text)) = Trim(Fm17Departamento.MeDepartamento.Text) then
      Fm17Departamento.EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO =' + Fm17Departamento.MeDepartamento.Text)
    else
      Fm17Departamento.EdDepartamento.Text := 'VÁRIOS'
  Else
      Fm17Departamento.EdDepartamento.Clear;
end;

procedure TFContasPagarParam.Fm17DepartamentoMeDepartamentoExit(
  Sender: TObject);
begin
  inherited;
  {Fm17Departamento.MeDepartamentoExit(Sender);}
  if trim(Fm17Departamento.MeDepartamento.Text) = '' then
    Fm17Departamento.EdDepartamento.Text := 'TODOS'

end;

procedure TFContasPagarParam.SB0ConsFinalidadeClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
     FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
  begin
     ME0CodFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCOD_FINALIDADE.Value);
     ME0Finalidade.Text:=DMFinalidade.QFinalidadeConsDESC_FINALIDADE.Value
  end;
end;

procedure TFContasPagarParam.SB4NumTituloClick(Sender: TObject);
begin
  inherited;
  if FContasPagarCons = nil then
    FContasPagarCons := TFContasPagarCons.Create(Application);
  if FContasPagarCons.ShowModal = mrOk then
  begin
    ME4CodNumTitulo.Text := DMContasPagar.QContasPagar_CabConsNUM_TITULO.Text;
  end;
end;

procedure TFContasPagarParam.CB2TodosClick(Sender: TObject);
begin
  inherited;
  If Cb2Todos.Checked Then
   Begin
      CB2Caixa.Checked := true;
      CB2Bancos.Checked := true;
      CB2Contabil.Checked := true;
   End
  Else
   Begin
      CB2Caixa.Checked := false;
      CB2Bancos.Checked := false;
      CB2Contabil.Checked := false;
      CB2Todos.Checked := false;
   End;

end;

end.
