unit UBancoMovParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmCadastro,
  UFmFilial, UFmContaCorrente, UFmDatas;

type
  TFBancoMovParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME1DtInicial: TMaskEdit;
    ME1DtFinal: TMaskEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    ME2DtSaldo: TMaskEdit;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    ME3CodBanco: TMaskEdit;
    ME3CodContaCorrente: TMaskEdit;
    GroupBox4: TGroupBox;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    L2: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    ME3Banco: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ME3ContaCorrente: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox6: TGroupBox;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Label10: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    ME4CodBanco: TMaskEdit;
    ME4Banco: TMaskEdit;
    ME4ContaCorrente: TMaskEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label12: TLabel;
    Label11: TLabel;
    ME4CodContaCorrente: TMaskEdit;
    TabSheet5: TTabSheet;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME6DtInicial: TMaskEdit;
    ME6DtFinal: TMaskEdit;
    ME6CodBanco: TMaskEdit;
    ME6Banco: TMaskEdit;
    ME6ContaCorrente: TMaskEdit;
    ME6CodContaCorrente: TMaskEdit;
    ME6NrCheque: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    ME0CodBanco: TMaskEdit;
    ME0CodContaCorrente: TMaskEdit;
    SpeedButton8: TSpeedButton;
    ME0ContaCorrente: TMaskEdit;
    ME0Banco: TMaskEdit;
    SpeedButton9: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    ME1CodBanco: TMaskEdit;
    ME1CodContaCorrente: TMaskEdit;
    SpeedButton10: TSpeedButton;
    ME1ContaCorrente: TMaskEdit;
    ME1Banco: TMaskEdit;
    SpeedButton11: TSpeedButton;
    Label23: TLabel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    ME5CodBanco: TMaskEdit;
    ME5Banco: TMaskEdit;
    ME5ContaCorrente: TMaskEdit;
    ME5CodContaCorrente: TMaskEdit;
    Label9: TLabel;
    ME3CodHistorico: TMaskEdit;
    SpeedButton3: TSpeedButton;
    ME3Historico: TMaskEdit;
    Label26: TLabel;
    ME0Historico: TMaskEdit;
    SpeedButton14: TSpeedButton;
    ED0Historico: TMaskEdit;
    Label27: TLabel;
    Me1Historico: TMaskEdit;
    SpeedButton15: TSpeedButton;
    ED1Historico: TMaskEdit;
    ME0Historico1: TMaskEdit;
    SpeedButton16: TSpeedButton;
    ED0Historico1: TMaskEdit;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    ME0Historico3: TMaskEdit;
    ED0Historico3: TMaskEdit;
    SpeedButton19: TSpeedButton;
    Me1Historico1: TMaskEdit;
    SpeedButton20: TSpeedButton;
    ED1Historico1: TMaskEdit;
    SpeedButton21: TSpeedButton;
    Me1Historico2: TMaskEdit;
    SpeedButton22: TSpeedButton;
    ED1Historico2: TMaskEdit;
    Me1Historico3: TMaskEdit;
    SpeedButton23: TSpeedButton;
    ED1Historico3: TMaskEdit;
    ME0Historico2: TMaskEdit;
    ED0Historico2: TMaskEdit;
    TabSheet8: TTabSheet;
    GroupBox8: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    ME7DtInicial: TMaskEdit;
    ME7DtFinal: TMaskEdit;
    TabSheet9: TTabSheet;
    Label31: TLabel;
    ME8CodContaCorrente: TMaskEdit;
    Btn8ContaCorrente: TSpeedButton;
    ME8ContaCorrente: TMaskEdit;
    Label32: TLabel;
    ME8CodHistorico: TMaskEdit;
    Btn8Historico: TSpeedButton;
    ME8Historico: TMaskEdit;
    GroupBox9: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME8DtInicial: TMaskEdit;
    ME8DtFinal: TMaskEdit;
    ME8CodDepartamento: TMaskEdit;
    Label35: TLabel;
    Btn8Departamento: TSpeedButton;
    ME8Departamento: TMaskEdit;
    TabSheet10: TTabSheet;
    GroupBox10: TGroupBox;
    Label30: TLabel;
    Label36: TLabel;
    Me9DataI: TMaskEdit;
    Me9DataF: TMaskEdit;
    TabSheet11: TTabSheet;
    Label37: TLabel;
    ME10CodBanco: TMaskEdit;
    SB10BancoCons: TSpeedButton;
    ME10Banco: TMaskEdit;
    Label38: TLabel;
    ME10CodContaCorrente: TMaskEdit;
    SB10ContaCorrenteCons: TSpeedButton;
    ME10ContaCorrente: TMaskEdit;
    Label39: TLabel;
    Bt0Departamento: TSpeedButton;
    Me0Departamento: TMaskEdit;
    Ed0Departamento: TMaskEdit;
    Label40: TLabel;
    Bt1Departamento: TSpeedButton;
    Me1Departamento: TMaskEdit;
    Ed1Departamento: TMaskEdit;
    Label41: TLabel;
    Bt3Departamento: TSpeedButton;
    Me3Departamento: TMaskEdit;
    Ed3Departamento: TMaskEdit;
    Label42: TLabel;
    Bt5Historico: TSpeedButton;
    Me5CodHistorico: TMaskEdit;
    Me5Historico: TMaskEdit;
    Label43: TLabel;
    Bt10Historico: TSpeedButton;
    Me10CodHistorico: TMaskEdit;
    Me10Historico: TMaskEdit;
    TabSheet12: TTabSheet;
    Label44: TLabel;
    ME11CodContaCorrente: TMaskEdit;
    SpeedButton24: TSpeedButton;
    GroupBox11: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    ME11DT_Movimento_I: TMaskEdit;
    ME11DT_Movimento_F: TMaskEdit;
    GroupBox12: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    SpeedButton25: TSpeedButton;
    ED11DescContaCorrente: TEdit;
    ME11ContaCorrente: TMaskEdit;
    ED11ContaCorrente: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    Me0Carga: TMaskEdit;
    RGTipoRemessa: TRadioGroup;
    TabSheet13: TTabSheet;
    GroupBox13: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    ME13Data_I: TMaskEdit;
    ME13Data_F: TMaskEdit;
    ME13CodHistorico: TMaskEdit;
    SpeedButton30: TSpeedButton;
    ME13Desc_Historico: TMaskEdit;
    Label54: TLabel;
    TabSheet14: TTabSheet;
    GroupBox14: TGroupBox;
    Label53: TLabel;
    Label55: TLabel;
    ME14Data_I: TMaskEdit;
    ME14Data_F: TMaskEdit;
    Label56: TLabel;
    ME14Cod_Vendedor: TMaskEdit;
    SpeedButton26: TSpeedButton;
    ME14Desc_Vendedor: TMaskEdit;
    GroupBox15: TGroupBox;
    Label57: TLabel;
    ME14Dt_Emissao: TMaskEdit;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Me0Serie: TMaskEdit;
    Label62: TLabel;
    Me13Serie: TMaskEdit;
    Label63: TLabel;
    Me1Serie: TMaskEdit;
    Me14Serie: TMaskEdit;
    Label64: TLabel;
    TabSheet15: TTabSheet;
    Label65: TLabel;
    Me15Banco: TMaskEdit;
    Bt15Banco: TBitBtn;
    Ed15Banco: TEdit;
    GroupBox16: TGroupBox;
    ME15DtInicial: TMaskEdit;
    ME15DtFinal: TMaskEdit;
    Label66: TLabel;
    Label67: TLabel;
    ME15CC: TMaskEdit;
    SB15CC: TSpeedButton;
    Label68: TLabel;
    ME0Vendedor: TMaskEdit;
    SB0Vendedor: TSpeedButton;
    Ed0Vendedor: TEdit;
    Label69: TLabel;
    Ed13Vendedor: TEdit;
    Ed13Departamento: TEdit;
    Label70: TLabel;
    Label71: TLabel;
    SB13Vendedor: TSpeedButton;
    SB13Departamento: TSpeedButton;
    ME13Vendedor: TMaskEdit;
    ME13Departamento: TMaskEdit;
    TabSheet16: TTabSheet;
    Label72: TLabel;
    ME16Banco: TMaskEdit;
    SB16Banco: TSpeedButton;
    Me16ContaCorrente: TMaskEdit;
    Label73: TLabel;
    SB16ContaCorrente: TSpeedButton;
    GroupBox17: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    ME16DtInicial: TMaskEdit;
    Me16DtFinal: TMaskEdit;
    Ed16Banco: TEdit;
    Ed16ContaCorrente: TEdit;
    Label76: TLabel;
    Bt5Cadastro: TSpeedButton;
    Me5Cadastro: TMaskEdit;
    Ed5Cadastro: TMaskEdit;
    ME1BancoDestino: TMaskEdit;
    SpeedButton27: TSpeedButton;
    ME1CodBancoDestino: TMaskEdit;
    Label77: TLabel;
    Label78: TLabel;
    ME7CodBanco: TMaskEdit;
    SpeedButton28: TSpeedButton;
    ME7Banco: TMaskEdit;
    RG7TipoCheque: TRadioGroup;
    Me14Dt_EmissaoFinal: TMaskEdit;
    Label79: TLabel;
    TabSheet17: TTabSheet;
    Label80: TLabel;
    SB17Banco: TSpeedButton;
    Label81: TLabel;
    SB17ContaCorrente: TSpeedButton;
    ME17Banco: TMaskEdit;
    Me17ContaCorrente: TMaskEdit;
    GroupBox18: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    ME17DtInicial: TMaskEdit;
    Me17DtFinal: TMaskEdit;
    Ed17Banco: TEdit;
    Ed17ContaCorrente: TEdit;
    Label84: TLabel;
    Bt0Cadastro: TSpeedButton;
    Me0Cadastro: TMaskEdit;
    Ed0Cadastro: TMaskEdit;
    Label85: TLabel;
    Bt5Vendedor: TSpeedButton;
    Me5Vendedor: TMaskEdit;
    Ed5Vendedor: TMaskEdit;
    GroupBox19: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Me10DtInicial: TMaskEdit;
    Me10DtFinal: TMaskEdit;
    RG5Ordem: TRadioGroup;
    FmCadastro2: TFmCadastro;
    TabSheet18: TTabSheet;
    FmFilial18: TFmFilial;
    GroupBox20: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    ME18DtInicial: TMaskEdit;
    ME18DtFinal: TMaskEdit;
    Label90: TLabel;
    ME18Banco: TMaskEdit;
    SpeedButton29: TSpeedButton;
    Ed18Banco: TEdit;
    Cb4Conciliacao: TCheckBox;
    TabSheet19: TTabSheet;
    Fm18DataMov: TFmDatas;
    Fm18ContaCorrente: TFmContaCorrente;
    FmContaCorrente1: TFmContaCorrente;
    Rg4ChequeBaixado: TRadioGroup;
    Rg18ChequeBaixado: TRadioGroup;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure Btn8HistoricoClick(Sender: TObject);
    procedure Btn8DepartamentoClick(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure SB10BancoConsClick(Sender: TObject);
    procedure SB10ContaCorrenteConsClick(Sender: TObject);
    procedure Me0DepartamentoExit(Sender: TObject);
    procedure Bt0DepartamentoClick(Sender: TObject);
    procedure Me1DepartamentoExit(Sender: TObject);
    procedure Bt1DepartamentoClick(Sender: TObject);
    procedure Me3DepartamentoExit(Sender: TObject);
    procedure Bt3DepartamentoClick(Sender: TObject);
    procedure Me5CodHistoricoExit(Sender: TObject);
    procedure Bt5HistoricoClick(Sender: TObject);
    procedure ME5CodBancoExit(Sender: TObject);
    procedure ME5CodContaCorrenteExit(Sender: TObject);
    procedure ME6CodBancoExit(Sender: TObject);
    procedure ME6CodContaCorrenteExit(Sender: TObject);
    procedure ME8CodContaCorrenteExit(Sender: TObject);
    procedure ME8CodHistoricoExit(Sender: TObject);
    procedure ME8CodDepartamentoExit(Sender: TObject);
    procedure ME10CodBancoExit(Sender: TObject);
    procedure ME10CodContaCorrenteExit(Sender: TObject);
    procedure Me10CodHistoricoExit(Sender: TObject);
    procedure Bt10HistoricoClick(Sender: TObject);
    procedure ME0CodBancoExit(Sender: TObject);
    procedure ME0CodContaCorrenteExit(Sender: TObject);
    procedure ME0HistoricoExit(Sender: TObject);
    procedure ME0Historico1Exit(Sender: TObject);
    procedure ME0Historico2Exit(Sender: TObject);
    procedure ME0Historico3Exit(Sender: TObject);
    procedure ME1CodBancoExit(Sender: TObject);
    procedure ME1CodContaCorrenteExit(Sender: TObject);
    procedure Me1HistoricoExit(Sender: TObject);
    procedure Me1Historico1Exit(Sender: TObject);
    procedure Me1Historico2Exit(Sender: TObject);
    procedure Me1Historico3Exit(Sender: TObject);
    procedure ME3CodBancoExit(Sender: TObject);
    procedure ME3CodContaCorrenteExit(Sender: TObject);
    procedure ME3CodHistoricoExit(Sender: TObject);
    procedure ME4CodBancoExit(Sender: TObject);
    procedure ME4CodContaCorrenteExit(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure ME11CodContaCorrenteExit(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure ME11ContaCorrenteExit(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure ME13CodHistoricoExit(Sender: TObject);
    procedure Bt15BancoClick(Sender: TObject);
    procedure Me15BancoExit(Sender: TObject);
    procedure SB15CCClick(Sender: TObject);
    procedure SB0VendedorClick(Sender: TObject);
    procedure ME0VendedorExit(Sender: TObject);
    procedure SB13VendedorClick(Sender: TObject);
    procedure SB13DepartamentoClick(Sender: TObject);
    procedure ME13VendedorExit(Sender: TObject);
    procedure ME13DepartamentoExit(Sender: TObject);
    procedure SB16BancoClick(Sender: TObject);
    procedure ME16BancoExit(Sender: TObject);
    procedure SB16ContaCorrenteClick(Sender: TObject);
    procedure Me16ContaCorrenteExit(Sender: TObject);
    procedure Me5CadastroExit(Sender: TObject);
    procedure Bt5CadastroClick(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure ME1CodBancoDestinoExit(Sender: TObject);
    procedure ME7CodBancoExit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure ME17BancoExit(Sender: TObject);
    procedure SB17BancoClick(Sender: TObject);
    procedure Me17ContaCorrenteExit(Sender: TObject);
    procedure SB17ContaCorrenteClick(Sender: TObject);
    procedure Me18BancoExit(Sender: TObject);
    procedure Me0CadastroExit(Sender: TObject);
    procedure Bt0CadastroClick(Sender: TObject);
    procedure Me5VendedorExit(Sender: TObject);
    procedure Bt5VendedorClick(Sender: TObject);
    procedure FmFilial18BtFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoMovParam: TFBancoMovParam;

implementation

uses UBancosCons, UBancoAgencia_cl, UContaCorrenteCons, UOracle_cl,
  UHistoricoCons, UHistorico_cl, UFilialCons, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl, UVendedorCons, UVendedor_cl, UCadastroCons,
  UCadastro_cl, UBiblioteca, DB;

{$R *.DFM}

procedure TFBancoMovParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME4CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME4CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME3CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME3CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME3CodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME6CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME6CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;
end;

procedure TFBancoMovParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME0DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME1DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME1DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME2DTSaldo.Text:=DateToStr(DMOracle.DataServ);
  ME3DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME3DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME4DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME4DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME5DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME5DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME6DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME6DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME7DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME7DTFinal.Text:=DateToStr(DMOracle.DataServ);
  ME8DTInicial.Text:=DateToStr(DMOracle.DataServ);
  ME8DTFinal.Text:=DateToStr(DMOracle.DataServ);

  if ((Trim(Fm18DataMov.MeDtInicial.Text) = '') or (Trim(Fm18DataMov.MeDtFinal.Text) = '')) then
    Bib.PriUltData(Fm18DataMov.MeDtInicial, Fm18DataMov.MeDtFinal);
end;

procedure TFBancoMovParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME0CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
      ME0CodBancoExit(Self);
    end;
end;

procedure TFBancoMovParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME0CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
      ME0CodContaCorrenteExit(self);
    end;
end;

procedure TFBancoMovParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME1CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME1CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    begin
      ME5CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    begin
      ME5CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    end;
end;

procedure TFBancoMovParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME0Historico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME0HistoricoExit(self);
    end;
end;

procedure TFBancoMovParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME1Historico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;

end;

procedure TFBancoMovParam.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME0Historico1.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME0Historico1Exit(self);
    end;
end;

procedure TFBancoMovParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME0Historico2.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME0Historico2Exit(self);
    end;
end;

procedure TFBancoMovParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME0Historico3.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME0Historico3Exit(self);
    end;

end;

procedure TFBancoMovParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME1Historico1.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;

end;

procedure TFBancoMovParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME1Historico2.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;

end;

procedure TFBancoMovParam.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME1Historico3.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;

end;

procedure TFBancoMovParam.Btn8HistoricoClick(Sender: TObject);
begin
  inherited;
if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME8CodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    end;
end;

procedure TFBancoMovParam.Btn8DepartamentoClick(Sender: TObject);
begin
  inherited;
if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=mrOk then
    begin
      ME8CodDepartamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    end;
end;

procedure TFBancoMovParam.TabSheet8Show(Sender: TObject);
begin
  inherited;
  FBancoMovParam.helpcontext:=20;
end;

procedure TFBancoMovParam.TabSheet9Show(Sender: TObject);
begin
  inherited;
  FBancoMovParam.helpcontext:=21;  
end;

procedure TFBancoMovParam.SB10BancoConsClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
     FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
  begin
    ME10CodBanco.Text := floatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    ME10Banco.Text := DMBancoAgencia.QBancoAgenciaConsDESC_BANCO_AGENCIA.Text;
  end;
end;

procedure TFBancoMovParam.SB10ContaCorrenteConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
  begin
    ME10CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME10ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsDESC_CONTA_CORRENTE.Text;
  end;
end;

procedure TFBancoMovParam.Me0DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Departamento.Text)<>'' then
    Ed0Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Me0Departamento.Text)
  else
    Ed0Departamento.Text:='Todos';
end;

procedure TFBancoMovParam.Bt0DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=mrOk then
  Begin
     Me0Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
     Ed0Departamento.Text:=DMDepartamento.QDepartamentoConsDesc_Departamento.Value;
  end;
end;

procedure TFBancoMovParam.Me1DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Departamento.Text)<>'' then
    Ed1Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Me1Departamento.Text)
  else
    Ed1Departamento.Text:='Todos';

end;

procedure TFBancoMovParam.Bt1DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=mrOk then
  Begin
     Me1Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
     Ed1Departamento.Text:=DMDepartamento.QDepartamentoConsDesc_Departamento.Value;
  end;

end;

procedure TFBancoMovParam.Me3DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3Departamento.Text)<>'' then
    Ed3Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Me3Departamento.Text)
  else
    Ed3Departamento.Text:='Todos';

end;

procedure TFBancoMovParam.Bt3DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=mrOk then
  Begin
     Me3Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
     Ed3Departamento.Text:=DMDepartamento.QDepartamentoConsDesc_Departamento.Value;
  end;

end;

procedure TFBancoMovParam.Me5CodHistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodHistorico.Text)<>'' then
    ME5Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+Trim(ME5CodHistorico.Text))
  else
    ME5Historico.Text:='Todos';

end;

procedure TFBancoMovParam.Bt5HistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
     FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
     ME5CodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);

end;

procedure TFBancoMovParam.ME5CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodBanco.Text)<>'' then
    begin
      ME5Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+Trim(ME5CodBanco.Text));
      ME5CodContaCorrente.Clear;
    end
  else
    ME5Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME5CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodContaCorrente.Text)<>'' then
    begin
      ME5ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME5CodContaCorrente.Text);
      ME5CodBanco.clear;
    end
  else
    ME5ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.ME6CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodBanco.Text)<>'' then
    begin
      ME6Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME6CodBanco.Text);
      ME6CodContaCorrente.Clear;
    end
  else
    ME6Banco.Text:='Todos';
end;

procedure TFBancoMovParam.ME6CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodContaCorrente.Text)<>'' then
    begin
      ME6ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME6CodContaCorrente.Text);
      ME6CodBanco.clear;
    end
  else
    ME6ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.ME8CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodContaCorrente.Text)<>'' then
    ME8ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME8CodContaCorrente.Text)
  else
    ME8ContaCorrente.Text:='Todas';

end;

procedure TFBancoMovParam.ME8CodHistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodHistorico.Text)<>'' then
    ME8Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME8CodHistorico.Text)
  else
    ME8Historico.Text:='Todos';

end;

procedure TFBancoMovParam.ME8CodDepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodDepartamento.Text)<>'' then
    ME8Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+ME8CodDepartamento.Text)
  else
    ME8Departamento.Text:='Todos';

end;

procedure TFBancoMovParam.ME10CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodBanco.Text)<>'' then
     ME10Banco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME10CodBanco.Text)
  else
    ME10Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME10CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodContaCorrente.Text)<>'' then
      ME10ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME10CodContaCorrente.Text)
  else
    ME10ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.Me10CodHistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodHistorico.Text)<>'' then
    ME10Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME10CodHistorico.Text)
  else
    ME10Historico.Text:='Todos';

end;

procedure TFBancoMovParam.Bt10HistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
  begin
      ME10CodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME10Historico.Text:= DMHistorico.QHistoricoConsDESC_HISTORICO.Value;
  end;
end;

procedure TFBancoMovParam.ME0CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodBanco.Text)<>'' then
    begin
      ME0Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME0CodBanco.Text);
      ME0CodContaCorrente.Clear;
    end
  else
    ME0Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME0CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodContaCorrente.Text)<>'' then
    begin
      ME0ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME0CodContaCorrente.Text);
      ME0CodBanco.clear;
    end
  else
    ME0ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.ME0HistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Historico.Text)<>'' then
    ED0Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME0Historico.Text)
  else
    ED0Historico.Text:='Todos';

end;

procedure TFBancoMovParam.ME0Historico1Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Historico1.Text)<>'' then
    ED0Historico1.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME0Historico1.Text)
  else
    ED0Historico1.Text:='Todos';

end;

procedure TFBancoMovParam.ME0Historico2Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Historico2.Text)<>'' then
    ED0Historico2.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME0Historico2.Text)
  else
    ED0Historico2.Text:='Todos';

end;

procedure TFBancoMovParam.ME0Historico3Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Historico3.Text)<>'' then
    ED0Historico3.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME0Historico3.Text)
  else
    ED0Historico3.Text:='Todos';

end;

procedure TFBancoMovParam.ME1CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodBanco.Text)<>'' then
    begin
      ME1Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME1CodBanco.Text);
      ME1CodContaCorrente.Clear;
    end
  else
    ME1Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME1CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodContaCorrente.Text)<>'' then
    begin
      ME1ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME1CodContaCorrente.Text);
      ME1CodBanco.clear;
    end
  else
    ME1ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.Me1HistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Historico.Text)<>'' then
    ED1Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME1Historico.Text)
  else
    ED1Historico.Text:='Todos';

end;

procedure TFBancoMovParam.Me1Historico1Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Historico1.Text)<>'' then
    ED1Historico1.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME1Historico1.Text)
  else
    ED1Historico1.Text:='Todos';


end;

procedure TFBancoMovParam.Me1Historico2Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Historico2.Text)<>'' then
    ED1Historico2.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME1Historico2.Text)
  else
    ED1Historico2.Text:='Todos';

end;

procedure TFBancoMovParam.Me1Historico3Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Historico3.Text)<>'' then
    ED1Historico3.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME1Historico3.Text)
  else
    ED1Historico3.Text:='Todos';

end;

procedure TFBancoMovParam.ME3CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodBanco.Text)<>'' then
    ME3Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME3CodBanco.Text)
  else
    ME3Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME3CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodContaCorrente.Text)<>'' then
    ME3ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME3CodContaCorrente.Text)
  else
    ME3ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.ME3CodHistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodHistorico.Text)<>'' then
    ME3Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME3CodHistorico.Text)
  else
    ME3Historico.Text:='Todos';

end;

procedure TFBancoMovParam.ME4CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodBanco.Text)<>'' then
    begin
      ME4Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME4CodBanco.Text);
      ME4CodContaCorrente.Clear;
    end
  else
    ME4Banco.Text:='Todos';

end;

procedure TFBancoMovParam.ME4CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodContaCorrente.Text)<>'' then
    begin
      ME4ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME4CodContaCorrente.Text);
      ME4CodBanco.clear;
    end
  else
    ME4ContaCorrente.Text:='Todos';

end;

procedure TFBancoMovParam.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
  begin
    ME11CodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
  end;
end;

procedure TFBancoMovParam.ME11CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodContaCorrente.Text)<>'' then
  begin
    ED11ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME11CodContaCorrente.Text);
  end
  else
    ED11ContaCorrente.Text:='Todas';
end;

procedure TFBancoMovParam.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
  begin
    ME11ContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME11ContaCorrenteExit(self);
  end;
end;

procedure TFBancoMovParam.ME11ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11ContaCorrente.Text)<>'' then
  begin
    ED11DescContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME11ContaCorrente.Text);
  end
  else
    ED11DescContaCorrente.Text:='Todos';
end;

procedure TFBancoMovParam.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    begin
      ME13CodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
      ME13CodHistoricoExit(Self);
    end;
end;

procedure TFBancoMovParam.ME13CodHistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodHistorico.Text)<>'' then
    ME13Desc_Historico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+ME13CodHistorico.Text)
  else
    ME13Desc_Historico.Text:='Todos';
end;

procedure TFBancoMovParam.Bt15BancoClick(Sender: TObject);
begin
  inherited;
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.ShowModal = mrOk then
  Begin
    ME15Banco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    ME15BancoExit(Self);
  End;
end;

procedure TFBancoMovParam.Me15BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME15Banco.Text) <> '' Then
    Ed15Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME15banco.Text))
  Else
    Ed15Banco.Text := 'Todos';
end;

procedure TFBancoMovParam.SB15CCClick(Sender: TObject);
begin
  inherited;
    If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal = mrOk then
  Begin
    ME15CC.Text := DMBancoAgencia.QContaCorrenteConsNum_conta_corrente.Text;

  End;

end;

procedure TFBancoMovParam.SB0VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal=mrOk then
    begin
      ME0Vendedor.Text:=DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
      ME0VendedorExit(self);
    end;

end;

procedure TFBancoMovParam.ME0VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Vendedor.Text)<>'' then
    Ed0Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me0Vendedor.Text)
  else
    Ed0Vendedor.Text:='Todos';

end;

procedure TFBancoMovParam.SB13VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal=mrOk then
    begin
      ME13Vendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
      ME13VendedorExit(Self);
    end;
end;

procedure TFBancoMovParam.SB13DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=mrOk then
    begin
      ME13Departamento.Text:=DMDepartamento.QDepartamentoConsCod_Departamento.Text;
      ME13DepartamentoExit(Self);
    end;
end;

procedure TFBancoMovParam.ME13VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13Vendedor.Text)<>'' then
    Ed13Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME13Vendedor.Text)
  else
    Ed13Vendedor.Text:='Todos';
end;

procedure TFBancoMovParam.ME13DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13Departamento.Text)<>'' then
    Ed13Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+ME13Departamento.Text)
  else
    Ed13Departamento.Text:='Todos';   
end;

procedure TFBancoMovParam.SB16BancoClick(Sender: TObject);
begin
  inherited;
 if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    ME16Banco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
end;

procedure TFBancoMovParam.ME16BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME16Banco.Text) <> '' Then
    Ed16Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME16banco.Text))
  Else
    Ed16Banco.Text := 'Todos';
end;

procedure TFBancoMovParam.SB16ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    ME16ContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value); 
end;

procedure TFBancoMovParam.Me16ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16ContaCorrente.Text)<>'' then
  begin
    ED16ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME16ContaCorrente.Text);
  end
  else
    ED16ContaCorrente.Text:='Todas';
end;

procedure TFBancoMovParam.Me5CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Cadastro.Text)<>'' then
    Ed5Cadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME5Cadastro.Text))
  else
    Ed5Cadastro.Text:='Todos';

end;

procedure TFBancoMovParam.Bt5CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk then
     ME5Cadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFBancoMovParam.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
  begin
    ME1codBancoDestino.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
  end;
end;

procedure TFBancoMovParam.ME1CodBancoDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodBancoDestino.Text)<>'' then
    begin
      ME1BancoDestino.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME1CodBancoDestino.Text);
    end
    else
      ME1BancoDestino.Text:='Todos';
end;

procedure TFBancoMovParam.ME7CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodBanco.Text)<>'' then
    ME7Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME7CodBanco.Text)
  else
    ME7Banco.Text:='Todos';
end;

procedure TFBancoMovParam.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
  begin
    ME7CodBanco.Text := FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    ME7CodBancoExit(sender);
  end;
end;

procedure TFBancoMovParam.ME17BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME17Banco.Text) <> '' Then
    Ed17Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME17banco.Text))
  Else
    Ed17Banco.Text := 'Todos';
end;

procedure TFBancoMovParam.SB17BancoClick(Sender: TObject);
begin
  inherited;
 if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
  begin
    ME18Banco.Text := FloatToStr(DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value);
    Me18BancoExit(Sender);
  end
end;

procedure TFBancoMovParam.Me17ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17ContaCorrente.Text) <> '' then
    ED17ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + ME17ContaCorrente.Text)
  else
    ED17ContaCorrente.Text := 'Todas';
end;

procedure TFBancoMovParam.SB17ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
  begin
    ME17ContaCorrente.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    Me17ContaCorrenteExit(sender);
  end;
end;

procedure TFBancoMovParam.Me18BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18Banco.Text) <> '' Then
    Ed18Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME18Banco.Text))
  Else
    Ed18Banco.Text := 'Todos';
end;

procedure TFBancoMovParam.Me0CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Cadastro.Text)<>'' then
    Ed0Cadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me0Cadastro.Text))
  else
    Ed0Cadastro.Text:='Todos';

end;

procedure TFBancoMovParam.Bt0CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk then
     Me0Cadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFBancoMovParam.Me5VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5Vendedor.Text)<>'' then
     Ed5Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me5Vendedor.Text)
  else
    Ed5Vendedor.Text:='Todos';
end;

procedure TFBancoMovParam.Bt5VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal=mrOk then
    Me5Vendedor.Text:=FloatToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);

end;

procedure TFBancoMovParam.FmFilial18BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial18.BtFilialClick(Sender);

end;

end.
