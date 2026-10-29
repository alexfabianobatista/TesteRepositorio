unit UBancoCCorrenteParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmDatas,
  UFmBanco;

type
  TFBancoAgenciaParam = class(TFTParametro)
    TSBancoCCorrente: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ME2Banco: TMaskEdit;
    SB2Banco: TSpeedButton;
    Ed2Banco: TEdit;
    GroupBox1: TGroupBox;
    ME2DtInicial: TMaskEdit;
    ME2DtFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet3: TTabSheet;
    ME3Banco: TMaskEdit;
    SB3Banco: TSpeedButton;
    Ed3Banco: TEdit;
    GroupBox2: TGroupBox;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    TabSheet4: TTabSheet;
    ME4CC: TMaskEdit;
    ME4Vendedor: TMaskEdit;
    SB4CC: TSpeedButton;
    SB4Vendedor: TSpeedButton;
    Ed4CC: TEdit;
    Ed4Vendedor: TEdit;
    GroupBox3: TGroupBox;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet5: TTabSheet;
    Label11: TLabel;
    ME5Banco: TMaskEdit;
    SB5Banco: TSpeedButton;
    Ed5Banco: TEdit;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    Label15: TLabel;
    Me4DtBase: TMaskEdit;
    Label14: TLabel;
    Me2DtBase: TMaskEdit;
    Rg4Opcao: TRadioGroup;
    ME4Departamento: TMaskEdit;
    SB4Departamento: TSpeedButton;
    Ed4Departamento: TEdit;
    RG5BaixadoNo: TRadioGroup;
    Label16: TLabel;
    RG3BaixadoNo: TRadioGroup;
    Label17: TLabel;
    ME4Cadastro: TMaskEdit;
    SB4Cadastro: TSpeedButton;
    Ed4Cadastro: TEdit;
    Label18: TLabel;
    ME5Cadastro: TMaskEdit;
    SB5Cadastro: TSpeedButton;
    Ed5Cadastro: TEdit;
    RG0Situacao: TRadioGroup;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    Me5Filial: TMaskEdit;
    Ed5Filial: TEdit;
    Label20: TLabel;
    SpeedButton2: TSpeedButton;
    Me3Filial: TMaskEdit;
    Ed3Filial: TEdit;
    Label21: TLabel;
    SpeedButton3: TSpeedButton;
    Me4CodFilial: TMaskEdit;
    Ed4Filial: TEdit;
    Label22: TLabel;
    SpeedButton4: TSpeedButton;
    Me2CodFilial: TMaskEdit;
    Ed2Filial: TEdit;
    TabSheet6: TTabSheet;
    FMBanco6: TFMBanco;
    RG6Bandeira: TRadioGroup;
    FmDtRecebimento6: TFmDatas;
    FmDtEmissao6: TFmDatas;
    TabSheet7: TTabSheet;
    RG7TipoCartao: TRadioGroup;
    procedure TabSheet1Show(Sender: TObject);
    procedure SB2BancoClick(Sender: TObject);
    procedure ME2BancoExit(Sender: TObject);
    procedure SB3BancoClick(Sender: TObject);
    procedure ME3BancoExit(Sender: TObject);
    procedure SB4CCClick(Sender: TObject);
    procedure SB4VendedorClick(Sender: TObject);
    procedure ME4CCExit(Sender: TObject);
    procedure ME4VendedorExit(Sender: TObject);
    procedure ME5BancoExit(Sender: TObject);
    procedure SB5BancoClick(Sender: TObject);
    procedure ME4DepartamentoExit(Sender: TObject);
    procedure SB4DepartamentoClick(Sender: TObject);
    procedure ME4CadastroExit(Sender: TObject);
    procedure SB4CadastroClick(Sender: TObject);
    procedure ME5CadastroExit(Sender: TObject);
    procedure SB5CadastroClick(Sender: TObject);
    procedure Me5FilialExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Me3FilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Me4CodFilialExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Me2CodFilialExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoAgenciaParam: TFBancoAgenciaParam;

implementation

uses UBancosCons, UBancoAgencia_cl, UOracle_cl, UContaCorrenteCons,
  UVendedorCons, UVendedor_cl, UDepartamentoCons, UDepartamento_cl,
  UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFBancoAgenciaParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FBancoAgenciaParam.helpcontext:=20;
end;

procedure TFBancoAgenciaParam.SB2BancoClick(Sender: TObject);
begin
  inherited;
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.ShowModal = mrOk then
  Begin
    ME2Banco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    ME2BancoExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.ME2BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Banco.Text) <> '' Then
    Ed2Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME2banco.Text))
  Else
    Ed2Banco.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.SB3BancoClick(Sender: TObject);
begin
  inherited;
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.ShowModal = mrOk then
  Begin
    ME3Banco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    ME3BancoExit(Self);
  End;

end;

procedure TFBancoAgenciaParam.ME3BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Banco.Text) <> '' Then
    Ed3Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME3banco.Text))
  Else
    Ed3Banco.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.SB4CCClick(Sender: TObject);
begin
  inherited;
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal = mrOk then
  Begin
    ME4CC.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
    ME4CCExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.SB4VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME4Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME4VendedorExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.ME4CCExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4CC.Text) <> '' Then
    Ed4CC.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(ME4CC.Text))
  Else
    Ed4CC.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.ME4VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Vendedor.Text) <> '' Then
    Ed4Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME4Vendedor.Text))
  Else
    Ed4Vendedor.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.ME5BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Banco.Text) <> '' Then
    Ed5Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA',
                                           'COD_BANCO_AGENCIA = '+Trim(ME5banco.Text))
  Else
    Ed5Banco.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.SB5BancoClick(Sender: TObject);
begin
  inherited;
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.ShowModal = mrOk then
  Begin
    ME5Banco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    ME5BancoExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.ME4DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Departamento.Text) <> '' Then
    Ed4Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Trim(ME4Departamento.Text))
  Else
    Ed4Departamento.Text := 'Todos'; 
end;

procedure TFBancoAgenciaParam.SB4DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    ME4Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME4DepartamentoExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.ME4CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Cadastro.Text) <> '' Then
    Ed4Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME4Cadastro.Text))
  Else
    Ed4Cadastro.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.SB4CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME4Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME4CadastroExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.ME5CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Cadastro.Text) <> '' Then
    Ed5Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME5Cadastro.Text))
  Else
    Ed5Cadastro.Text := 'Todos';
end;

procedure TFBancoAgenciaParam.SB5CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME5CadastroExit(Self);
  End;
end;

procedure TFBancoAgenciaParam.Me5FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Filial.Text) <> '' Then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(ME5Filial.Text))
  Else
    Ed5Filial.Text := 'Todos';

end;

procedure TFBancoAgenciaParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME5FilialExit(Self);
  End;

end;

procedure TFBancoAgenciaParam.Me3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Filial.Text) <> '' Then
    Ed3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(Me3Filial.Text))
  Else
    Ed3Filial.Text := 'Todos';

end;

procedure TFBancoAgenciaParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me3FilialExit(Self);
  End;

end;

procedure TFBancoAgenciaParam.Me4CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4CodFilial.Text) <> '' Then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(Me4CodFilial.Text))
  Else
    Ed4Filial.Text := 'Todos';

end;

procedure TFBancoAgenciaParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me4CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me4CodFilialExit(Self);
  End;

end;

procedure TFBancoAgenciaParam.Me2CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me2CodFilial.Text) <> '' Then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(Me2CodFilial.Text))
  Else
    Ed2Filial.Text := 'Todos';

end;

procedure TFBancoAgenciaParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me2CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me2CodFilialExit(Self);
  End;

end;

end.
