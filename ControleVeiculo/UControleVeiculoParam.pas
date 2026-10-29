unit UControleVeiculoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, DBCtrls,
  UFmProduto, UFmVeiculo, UFmFilial, UFmCadastro, UFmDatas;

type
  TFControleVeiculoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label3: TLabel;
    CB0Tipo: TComboBox;
    Label4: TLabel;
    CB0Classificacao: TComboBox;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    ME1Veiculo: TMaskEdit;
    SB1Veiculo: TSpeedButton;
    Ed1Veiculo: TEdit;
    RG1Tipo: TRadioGroup;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    ME1Data_I: TMaskEdit;
    ME1Data_F: TMaskEdit;
    Label7: TLabel;
    TabSheet3: TTabSheet;
    Label8: TLabel;
    ME2Veiculo: TMaskEdit;
    SB2Veiculo: TSpeedButton;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    ME2Data_I: TMaskEdit;
    ME2Data_F: TMaskEdit;
    Label11: TLabel;
    Ed2Placa: TEdit;
    CB2Classificacao: TComboBox;
    Label12: TLabel;
    CB2Tipo: TComboBox;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    ME3Veiculo: TMaskEdit;
    SB3Veiculo: TSpeedButton;
    Ed3Placa: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    ME3Data_I: TMaskEdit;
    ME3Data_F: TMaskEdit;
    Label16: TLabel;
    ME3Produto: TMaskEdit;
    SB3Produto: TSpeedButton;
    Ed3Produto: TEdit;
    Label17: TLabel;
    ME2Produto: TMaskEdit;
    SB2Produto: TSpeedButton;
    Ed2Produto: TEdit;
    TabSheet5: TTabSheet;
    Label18: TLabel;
    ME4Veiculo: TMaskEdit;
    SB4Veiculo: TSpeedButton;
    Ed4Veiculo: TEdit;
    Label19: TLabel;
    ME4Produto: TMaskEdit;
    SB4Produto: TSpeedButton;
    Ed4Produto: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    ME4Data_I: TMaskEdit;
    ME4Data_F: TMaskEdit;
    Label22: TLabel;
    ME4Cadastro: TMaskEdit;
    SB4Cadastro: TSpeedButton;
    Ed4Cadastro: TEdit;
    TabSheet6: TTabSheet;
    Label23: TLabel;
    ME5Veiculo: TMaskEdit;
    SB5Veiculo: TSpeedButton;
    Ed5Placa: TEdit;
    Label24: TLabel;
    ME5Produto: TMaskEdit;
    SB5Produto: TSpeedButton;
    Ed5Produto: TEdit;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ME5Data_I: TMaskEdit;
    ME5Data_F: TMaskEdit;
    TabSheet7: TTabSheet;
    ME6Filial: TMaskEdit;
    GroupBox6: TGroupBox;
    Ed6Filial: TEdit;
    SB6Filial: TSpeedButton;
    ME6DtInicial: TMaskEdit;
    ME6DtFinal: TMaskEdit;
    Label27: TLabel;
    Label28: TLabel;
    CB0Ativo: TComboBox;
    Label29: TLabel;
    GroupBox7: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Me3DataMovimento_I: TMaskEdit;
    Me3DataMovimento_F: TMaskEdit;
    TabSheet8: TTabSheet;
    FmVeiculo8: TFmVeiculo;
    FmProduto8: TFmProduto;
    GroupBox8: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Me8Data_I: TMaskEdit;
    Me8Data_F: TMaskEdit;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    Label1: TLabel;
    TabSheet9: TTabSheet;
    FmDatas9: TFmDatas;
    TabSheet10: TTabSheet;
    Fm9Datas: TFmDatas;
    RG9Situacao: TRadioGroup;
    GroupBox9: TGroupBox;
    BtConsVeiculo: TBitBtn;
    EDPlaca: TMaskEdit;
    TabSheet11: TTabSheet;
    RG10Ordem: TRadioGroup;
    Me10Filial: TMaskEdit;
    Label2: TLabel;
    Bt10Filial: TBitBtn;
    Ed10Filial: TEdit;
    Label34: TLabel;
    ME10Veiculo: TMaskEdit;
    Bt10Veiculo: TBitBtn;
    ED10Veiculo: TEdit;
    Label35: TLabel;
    Me10Cadastro: TMaskEdit;
    Bt10Cadastro: TBitBtn;
    Ed10Cadastro: TEdit;
    CB10Tipo: TComboBox;
    Label36: TLabel;
    TabSheet12: TTabSheet;
    Label37: TLabel;
    ME12Filial: TMaskEdit;
    Bt12Filial: TBitBtn;
    ED12Filial: TEdit;
    Label38: TLabel;
    ME12Pneu: TMaskEdit;
    Bt12Pneu: TBitBtn;
    ED12Pneu: TEdit;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Me12CompraInicial: TMaskEdit;
    Me12CompraFinal: TMaskEdit;
    Label39: TLabel;
    Label40: TLabel;
    Me12TrocaInicial: TMaskEdit;
    Me12TrocaFinal: TMaskEdit;
    Label41: TLabel;
    Label42: TLabel;
    RG12Situacao: TRadioGroup;
    TabSheet13: TTabSheet;
    Label43: TLabel;
    MeVeiculo13: TMaskEdit;
    EDVeiculo13: TEdit;
    Label44: TLabel;
    MeProduto13: TMaskEdit;
    EdProduto13: TEdit;
    GBEmissao12: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Me13EmissaoI: TMaskEdit;
    Me13EmissaoF: TMaskEdit;
    GBPeriodo12: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Me13MovimentoI: TMaskEdit;
    Me13MovimentoF: TMaskEdit;
    MeReqNF12: TMaskEdit;
    Label49: TLabel;
    FmCadastro12: TFmCadastro;
    BtCadastro: TBitBtn;
    BitBtn1: TBitBtn;
    Fm2Cadastro: TFmCadastro;
    RGAnaliticoSintetico9: TRadioGroup;
    FmPropeitaraioVeiculo9: TFmCadastro;
    Label73: TLabel;
    MeVeiculo9: TMaskEdit;
    BtVeiculo9: TBitBtn;
    RGAgrupar9: TRadioGroup;
    CB3Classificacao: TComboBox;
    Label50: TLabel;
    CB4Classificacao: TComboBox;
    Label51: TLabel;
    FmCadastro9: TFmCadastro;
    procedure ME1VeiculoExit(Sender: TObject);
    procedure SB2VeiculoClick(Sender: TObject);
    procedure SB1VeiculoClick(Sender: TObject);
    procedure ME2VeiculoChange(Sender: TObject);
    procedure ME3VeiculoChange(Sender: TObject);
    procedure SB3VeiculoClick(Sender: TObject);
    procedure ME3ProdutoChange(Sender: TObject);
    procedure SB3ProdutoClick(Sender: TObject);
    procedure ME2ProdutoChange(Sender: TObject);
    procedure SB2ProdutoClick(Sender: TObject);
    procedure ME4CadastroChange(Sender: TObject);
    procedure SB4CadastroClick(Sender: TObject);
    procedure ME4VeiculoChange(Sender: TObject);
    procedure SB4VeiculoClick(Sender: TObject);
    procedure ME4ProdutoChange(Sender: TObject);
    procedure SB4ProdutoClick(Sender: TObject);
    procedure ME5VeiculoChange(Sender: TObject);
    procedure SB5VeiculoClick(Sender: TObject);
    procedure ME5ProdutoChange(Sender: TObject);
    procedure SB5ProdutoClick(Sender: TObject);
    procedure SB6FilialClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure BtConsVeiculoClick(Sender: TObject);
    procedure ME10VeiculoExit(Sender: TObject);
    procedure Bt10VeiculoClick(Sender: TObject);
    procedure Me10FilialExit(Sender: TObject);
    procedure Bt10FilialClick(Sender: TObject);
    procedure Me10CadastroExit(Sender: TObject);
    procedure Bt10CadastroClick(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure ME12PneuExit(Sender: TObject);
    procedure Bt12PneuClick(Sender: TObject);
    procedure MeVeiculo13Change(Sender: TObject);
    procedure MeProduto13Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtVeiculo9Click(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleVeiculoParam: TFControleVeiculoParam;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UVeiculoCons, UVeiculo_cl, UProdutoCons, UProduto_cl, UVeiculoCad,
  UFPneuCons, UVeiculoModeloCons, UPneu_cl;

{$R *.DFM}

procedure TFControleVeiculoParam.ME1VeiculoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Veiculo.Text) <> '' then
    Ed1Veiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO','COD_VEICULO = '+ME1Veiculo.Text)
  else
    Ed1Veiculo.Text := 'Todos';
end;

procedure TFControleVeiculoParam.SB2VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME2Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFControleVeiculoParam.SB1VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME1Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
  ME1VeiculoExit(Self);
end;

procedure TFControleVeiculoParam.ME2VeiculoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2Veiculo.Text) <> '' then
    Ed2Placa.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                        'COD_VEICULO = '+Trim(ME2Veiculo.Text))
  else
    Ed2Placa.Text := 'Todas';
end;

procedure TFControleVeiculoParam.ME3VeiculoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3Veiculo.Text) <> '' then
    Ed3Placa.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                        'COD_VEICULO = '+Trim(ME3Veiculo.Text))
  else
    Ed3Placa.Text := 'SELECIONE UM VEÍCULO';
end;

procedure TFControleVeiculoParam.SB3VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME3Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFControleVeiculoParam.ME3ProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME3Produto.Text) <> '' then
    Ed3Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME3Produto.Text))
  else
    Ed3Produto.Text := 'TODOS';
end;

procedure TFControleVeiculoParam.SB3ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME3Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFControleVeiculoParam.ME2ProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2Produto.Text) <> '' then
    Ed2Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME2Produto.Text))
  else
    Ed2Produto.Text := 'TODOS';
end;

procedure TFControleVeiculoParam.SB2ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME2Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFControleVeiculoParam.ME4CadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4Cadastro.Text) <> '' then
    Ed4Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME4Cadastro.Text))
  else
    Ed4Cadastro.Text := 'Todos';
end;

procedure TFControleVeiculoParam.SB4CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME4Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFControleVeiculoParam.ME4VeiculoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4Veiculo.Text) <> '' then
    Ed4Veiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                          'COD_VEICULO = '+Trim(ME4Veiculo.Text))
  else
    Ed4Veiculo.Text := 'Todos';
end;

procedure TFControleVeiculoParam.SB4VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME4Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFControleVeiculoParam.ME4ProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4Produto.Text) <> '' then
    Ed4Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME4Produto.Text))
  else
    Ed4Produto.Text := 'Todos';
end;

procedure TFControleVeiculoParam.SB4ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME4Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFControleVeiculoParam.ME5VeiculoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5Veiculo.Text) <> '' then
    Ed5Placa.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                        'COD_VEICULO = '+Trim(ME5Veiculo.Text))
  else
    Ed5Placa.Text := 'SELECIONE UM VEÍCULO';
end;

procedure TFControleVeiculoParam.SB5VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME5Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
end;

procedure TFControleVeiculoParam.ME5ProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5Produto.Text) <> '' then
    Ed5Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME5Produto.Text))
  else
    Ed5Produto.Text := 'SELECIONE UM PRODUTO';
end;

procedure TFControleVeiculoParam.SB5ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME5Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFControleVeiculoParam.SB6FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME6Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME6FilialExit(Self);     
end;

procedure TFControleVeiculoParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6Filial.Text) <> '' then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6Filial.Text)
  else
    Ed6Filial.Text := 'Todas';        
end;

procedure TFControleVeiculoParam.BtConsVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    EDPlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Value;
  end;

  FVeiculoCons.Close;
end;

procedure TFControleVeiculoParam.ME10VeiculoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Veiculo.Text) <> '' then
    Ed10Veiculo.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO','COD_VEICULO = '+ME10Veiculo.Text)
  else
    Ed10Veiculo.Text := 'Todos';
end;

procedure TFControleVeiculoParam.Bt10VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    ME10Veiculo.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
  ME10VeiculoExit(Self);
end;

procedure TFControleVeiculoParam.Me10FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Filial.Text) <> '' then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME10Filial.Text)
  else
    Ed10Filial.Text := 'Todos';
end;

procedure TFControleVeiculoParam.Bt10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME10Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME10FilialExit(Self);
end;

procedure TFControleVeiculoParam.Me10CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Cadastro.Text) <> '' then
    Ed10Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME10Cadastro.Text)
  else
    Ed10Cadastro.Text := 'Todos';
end;

procedure TFControleVeiculoParam.Bt10CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME10Cadastro.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
  ME10CadastroExit(Self);
end;

procedure TFControleVeiculoParam.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME10Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME12FilialExit(Self);
end;

procedure TFControleVeiculoParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Filial.Text) <> '' then
    Ed12Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME12Filial.Text)
  else
    Ed12Filial.Text := 'Todos';
end;

procedure TFControleVeiculoParam.ME12PneuExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Pneu.Text) <> '' then
    Ed12Pneu.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO','COD_VEICULO = '+ME12Pneu.Text)
  else
    Ed12Pneu.Text := 'Todos';
end;

procedure TFControleVeiculoParam.Bt12PneuClick(Sender: TObject);
begin
  inherited;
  if FPneuCons = nil then
    FPneuCons := TFPneuCons.Create(Application);
  if FPneuCons.ShowModal = mrOk then
    ME12Pneu.Text := DMPneu.QPneuConsCOD_PNEU.Text;
  ME12PneuExit(Self);
end;

procedure TFControleVeiculoParam.MeVeiculo13Change(Sender: TObject);
begin
  inherited;
  if Trim(MeVeiculo13.Text) <> '' then
    EDVeiculo13.Text := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                        'COD_VEICULO = '+Trim(MeVeiculo13.Text))
  else
    EDVeiculo13.Text := 'SELECIONE UM VEÍCULO';
end;

procedure TFControleVeiculoParam.MeProduto13Change(Sender: TObject);
begin
  inherited;
  if Trim(MeProduto13.Text) <> '' then
    EdProduto13.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(MeProduto13.Text))
  else
    EdProduto13.Text := 'TODOS';

end;

procedure TFControleVeiculoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    MeProduto13.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFControleVeiculoParam.BtVeiculo9Click(Sender: TObject);
begin
  inherited;

  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    if Trim(MeVeiculo9.Text) <> '' then
      MeVeiculo9.Text := MeVeiculo9.Text + ',' + DMVeiculo.QVeiculoConsCOD_VEICULO.Text
    else
      MeVeiculo9.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
  end;
  
end;

procedure TFControleVeiculoParam.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    MeVeiculo13.Text := DMVeiculo.QVeiculoConsCOD_VEICULO.Text;
  end;
  FVeiculoCons.Close;
end;

end.
