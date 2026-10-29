unit USegurancaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFSegurancaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    RG1IndRetornavel: TRadioGroup;
    SB1FilialCons: TSpeedButton;
    ED1Filial: TEdit;
    SB1FuncionarioCons: TSpeedButton;
    ED1Funcionario: TEdit;
    TabSheet2: TTabSheet;
    ME2CodFilial: TMaskEdit;
    ME2CodProduto: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    SB2FilialCons: TSpeedButton;
    SB2ProdutoCons: TSpeedButton;
    ED2DescFilial: TEdit;
    ED2DescProduto: TEdit;
    ME1CodFilial: TMaskEdit;
    ME1CodFuncionario: TMaskEdit;
    TabSheet3: TTabSheet;
    CB3Situacao: TComboBox;
    Label5: TLabel;
    RG3Retornavel: TRadioGroup;
    Label10: TLabel;
    ME3Fabricante: TMaskEdit;
    Bt3Fornecedor: TSpeedButton;
    Ed3Fabricante: TEdit;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    ME4Filial: TMaskEdit;
    SB4Filial: TSpeedButton;
    Ed4Filial: TEdit;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    ME4Produto: TMaskEdit;
    SB4Produto: TSpeedButton;
    Ed4Produto: TEdit;
    TabSheet5: TTabSheet;
    Label13: TLabel;
    ME5Filial: TMaskEdit;
    SB5Filial: TSpeedButton;
    Ed5Filial: TEdit;
    Label14: TLabel;
    ME5Fornecedor: TMaskEdit;
    SB5Fornecedor: TSpeedButton;
    Ed5Fornecedor: TEdit;
    TabSheet6: TTabSheet;
    Label15: TLabel;
    ME6Filial: TMaskEdit;
    SB6Filial: TSpeedButton;
    Ed6Filial: TEdit;
    RG6TipoFuncionario: TRadioGroup;
    RG6Situacao: TRadioGroup;
    TabSheet7: TTabSheet;
    Label16: TLabel;
    ME7Filial: TMaskEdit;
    SB7Filial: TSpeedButton;
    Ed7Filial: TEdit;
    Label17: TLabel;
    SB7TipoExame: TSpeedButton;
    Ed7TipoExame: TEdit;
    ME7TipoExame: TMaskEdit;
    Label18: TLabel;
    ME7Exame: TMaskEdit;
    SB7Exame: TSpeedButton;
    Ed7Exame: TEdit;
    GroupBox1: TGroupBox;
    ME7Inicio: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    ME7Fim: TMaskEdit;
    TabSheet8: TTabSheet;
    ME8FuncaoFuncionario: TMaskEdit;
    Label11: TLabel;
    SB8FuncaoFuncionario: TSpeedButton;
    Ed8FuncaoFuncionario: TEdit;
    Label21: TLabel;
    ME8Filial: TMaskEdit;
    SB8Filial: TSpeedButton;
    Ed8Filial: TEdit;
    RG1Situacao: TRadioGroup;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ME1DtInicial: TMaskEdit;
    Label4: TLabel;
    ME1DtFinal: TMaskEdit;
    TabSheet9: TTabSheet;
    Label8: TLabel;
    ME9Filial: TMaskEdit;
    SB9Filial: TSpeedButton;
    Ed9Filial: TEdit;
    Label22: TLabel;
    ME9Produto: TMaskEdit;
    SB9Produto: TSpeedButton;
    Ed9Produto: TEdit;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    ME9DtInicial: TMaskEdit;
    Label24: TLabel;
    ME9DtFinal: TMaskEdit;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    ME5DtInicial: TMaskEdit;
    Label26: TLabel;
    ME5DtFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    TabSheet10: TTabSheet;
    Label29: TLabel;
    ME10Filial: TMaskEdit;
    SB10Filial: TSpeedButton;
    Ed10Filial: TEdit;
    Label30: TLabel;
    ME10Produto: TMaskEdit;
    SB10Produto: TSpeedButton;
    Ed10Produto: TEdit;
    TabSheet11: TTabSheet;
    Label31: TLabel;
    ME11Filial: TMaskEdit;
    SB11Filial: TSpeedButton;
    Ed11Filial: TEdit;
    Label32: TLabel;
    ME11Produto: TMaskEdit;
    SB11Produto: TSpeedButton;
    Ed11Produto: TEdit;
    TabSheet12: TTabSheet;
    Label33: TLabel;
    ME12Filial: TMaskEdit;
    SB12Filial: TSpeedButton;
    Ed12Filial: TEdit;
    Label34: TLabel;
    ME12Produto: TMaskEdit;
    SB12Produto: TSpeedButton;
    Ed12Produto: TEdit;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    ME12DtInicio: TMaskEdit;
    ME12DtFim: TMaskEdit;
    TabSheet13: TTabSheet;
    Label37: TLabel;
    ME13FilialOrig: TMaskEdit;
    SB13FilialOrig: TSpeedButton;
    Ed13FilialOrig: TEdit;
    Label38: TLabel;
    ME13Produto: TMaskEdit;
    SB13Produto: TSpeedButton;
    Ed13Produto: TEdit;
    GroupBox7: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    ME13DtInicial: TMaskEdit;
    ME13DtFinal: TMaskEdit;
    Label41: TLabel;
    ME13FilialDest: TMaskEdit;
    SB13FilialDest: TSpeedButton;
    Ed13FilialDest: TEdit;
    TabSheet14: TTabSheet;
    Label42: TLabel;
    ME14Produto: TMaskEdit;
    SB14Produto: TSpeedButton;
    Ed14Produto: TEdit;
    Label43: TLabel;
    ME14Filial: TMaskEdit;
    SB14Filial: TSpeedButton;
    Ed14Filial: TEdit;
    procedure SB1FilialConsClick(Sender: TObject);
    procedure SB1FuncionarioConsClick(Sender: TObject);
    procedure ME1CodFilialExit(Sender: TObject);
    procedure ME1CodFuncionarioExit(Sender: TObject);
    procedure ME3FabricanteExit(Sender: TObject);
    procedure Bt3FornecedorClick(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure SB4ProdutoClick(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure SB5FornecedorClick(Sender: TObject);
    procedure SB6FilialClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure ME7FilialExit(Sender: TObject);
    procedure SB7FilialClick(Sender: TObject);
    procedure ME7TipoExameExit(Sender: TObject);
    procedure SB7TipoExameClick(Sender: TObject);
    procedure ME7ExameExit(Sender: TObject);
    procedure SB7ExameClick(Sender: TObject);
    procedure ME8FuncaoFuncionarioExit(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure SB8FuncaoFuncionarioClick(Sender: TObject);
    procedure SB8FilialClick(Sender: TObject);
    procedure SB9FilialClick(Sender: TObject);
    procedure SB9ProdutoClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure ME9ProdutoExit(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure ME4ProdutoExit(Sender: TObject);
    procedure ME5FornecedorExit(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure ME10ProdutoExit(Sender: TObject);
    procedure SB10ProdutoClick(Sender: TObject);
    procedure ME11FilialExit(Sender: TObject);
    procedure SB11FilialClick(Sender: TObject);
    procedure ME11ProdutoExit(Sender: TObject);
    procedure SB11ProdutoClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure SB12FilialClick(Sender: TObject);
    procedure ME12ProdutoExit(Sender: TObject);
    procedure SB12ProdutoClick(Sender: TObject);
    procedure ME13FilialOrigExit(Sender: TObject);
    procedure SB13FilialOrigClick(Sender: TObject);
    procedure ME13FilialDestExit(Sender: TObject);
    procedure SB13FilialDestClick(Sender: TObject);
    procedure ME13ProdutoExit(Sender: TObject);
    procedure SB13ProdutoClick(Sender: TObject);
    procedure SB14ProdutoClick(Sender: TObject);
    procedure ME14ProdutoExit(Sender: TObject);
    procedure SB14FilialClick(Sender: TObject);
    procedure ME14FilialExit(Sender: TObject);
    procedure SB2ProdutoConsClick(Sender: TObject);
    procedure ME2CodProdutoExit(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure SB2FilialConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSegurancaParam: TFSegurancaParam;

implementation

uses UFilialCons, UFilial_cl, UFFuncionarioCons, UFuncionario_cl,
  UOracle_cl, UCadastroCons, UCadastro_cl,
  UProdutoSegurancaCons, UProdutoSeguranca_cl, UTipoExameCons, UExameCons,
  UExame_cl, UTipoExame_cl, UFuncaoFuncionarioCons, UFuncaoFuncionario_cl;

{$R *.DFM}

procedure TFSegurancaParam.SB1FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
  begin
    ME1CodFilial.Text:=inttostr(DMFilial.QFilialConsCod_Filial.Value);
    ED1Filial.Text:=DMFilial.QFilialConsDESC_FILIAL.Value;
    DMFilial.QFilialCons.Close;
  end;
end;

procedure TFSegurancaParam.SB1FuncionarioConsClick(Sender: TObject);
begin
  inherited;
  if FFuncionarioCons = nil then
    FFuncionarioCons := TFFuncionarioCons.create(application);
  if FFuncionarioCons.showmodal = mrOk then
  begin
    ME1CodFuncionario.Text:=IntToStr(DMFuncionario.QFuncionarioConsCod_Funcionario.Value);
    ED1Funcionario.Text:=DMFuncionario.QFuncionarioConsDesc_Funcionario.value;
    DMFuncionario.QFuncionarioCons.Close;
  end;
end;

procedure TFSegurancaParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.Text) <> '' then
    ED1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                      'COD_FILIAL = '+Trim(ME1CodFilial.Text))
  else
    ED1Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.ME1CodFuncionarioExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFuncionario.Text) <> '' then
    ED1Funcionario.Text := DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO',
                           'COD_FUNCIONARIO = '+Trim(ME1CodFuncionario.Text))
  else
    ED1Funcionario.Text := 'Todos';
end;

procedure TFSegurancaParam.ME3FabricanteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3Fabricante.Text)<>'' then
    Ed3Fabricante.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+Trim(ME3Fabricante.Text))
  else
    Ed3Fabricante.Text:='Todos';
end;

procedure TFSegurancaParam.Bt3FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  begin
    ME3Fabricante.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    ME3FabricanteExit(Self);
    DMCadastro.QCadastroCons.Close;
  end;
end;

procedure TFSegurancaParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    ME4Filial.Text:=inttostr(DMFilial.QFilialConsCod_Filial.Value);
  ME4FilialExit(Self);
end;

procedure TFSegurancaParam.SB4ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    Me4Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME4ProdutoExit(Self);
end;
 procedure TFSegurancaParam.SB5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    ME5Filial.Text:=inttostr(DMFilial.QFilialConsCod_Filial.Value);
  ME5FilialExit(Self);
end;

procedure TFSegurancaParam.SB5FornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME5Fornecedor.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  ME5FornecedorExit(Self);
end;

procedure TFSegurancaParam.SB6FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME6FilialExit(Self);
end;

procedure TFSegurancaParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6Filial.Text) <> '' then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+ME6Filial.Text)
  else
    Ed6Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.ME7FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7Filial.Text) <> '' then
    Ed7Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+ME7Filial.Text)
  else
    Ed7Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB7FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME7Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME7FilialExit(Self);
end;

procedure TFSegurancaParam.ME7TipoExameExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7TipoExame.Text) <> '' then
    Ed7TipoExame.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_EXAME FROM TB_TIPO_EXAME',
                                            'COD_TIPO_EXAME = '+ME7TipoExame.Text)
  else
    Ed7TipoExame.Text := 'Todos';
end;

procedure TFSegurancaParam.SB7TipoExameClick(Sender: TObject);
begin
  inherited;
  if FTipoExameCons = nil then
    FTipoExameCons := TFTipoExameCons.Create(Application);
  if FTipoExameCons.ShowModal = mrOk then
    ME7TipoExame.Text := DMTipoExame.QTipoExameConsCod_Tipo_Exame.Text;
  ME7TipoExameExit(Self);
end;

procedure TFSegurancaParam.ME7ExameExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7Exame.Text) <> '' then
    Ed7Exame.Text := DMOracle.BuscaNome('SELECT DESC_EXAME FROM TB_EXAME',
                                        'COD_EXAME = '+ME7Exame.Text)
  else
    Ed7Exame.Text := 'Todos';
end;

procedure TFSegurancaParam.SB7ExameClick(Sender: TObject);
begin
  inherited;
  if FExameCons = nil then
    FExameCons := TFExameCons.Create(Application);
  if FExameCons.ShowModal = mrOk then
    ME7Exame.Text := DMExame.QExameConsCod_Exame.Text;
  ME7ExameExit(Self);
end;

procedure TFSegurancaParam.ME8FuncaoFuncionarioExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8FuncaoFuncionario.Text) <> '' then
    Ed8FuncaoFuncionario.Text := DMOracle.BuscaNome('SELECT DESC_FUNCAO_FUNCIONARIO FROM TB_FUNCAO_FUNCIONARIO',
                                                    'COD_FUNCAO_FUNCIONARIO = '+ME8FuncaoFuncionario.Text)
  else
    Ed8FuncaoFuncionario.Text := 'Todas';
end;

procedure TFSegurancaParam.ME8FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Filial.Text) <> '' then
    Ed8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+ME8Filial.Text)
  else
    Ed8Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB8FuncaoFuncionarioClick(Sender: TObject);
begin
  inherited;
  if FFuncaoFuncionarioCons = nil then
    FFuncaoFuncionarioCons := TFFuncaoFuncionarioCons.Create(Application);
  if FFuncaoFuncionarioCons.ShowModal = mrOk then
    ME8FuncaoFuncionario.Text := DMFuncaoFuncionario.QFuncaoFuncionarioConsCod_Funcao_Funcionario.Text;
  ME8FuncaoFuncionarioExit(Self);
end;

procedure TFSegurancaParam.SB8FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME8Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME8FilialExit(Self);
end;

procedure TFSegurancaParam.SB9FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME9FilialExit(Self);
end;

procedure TFSegurancaParam.SB9ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    ME9Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME9ProdutoExit(Self);
end;

procedure TFSegurancaParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Filial.Text) <> '' then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = ' + ME9Filial.Text)
  else
    Ed9Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.ME9ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Produto.Text) <> '' then
    Ed9Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                          'COD_PRODUTO_SEGURANCA = '+ME9Produto.Text)
  else
    Ed9Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Filial.Text) <> '' then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = ' + ME5Filial.Text)
  else
    Ed5Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.ME4ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Produto.Text) <> '' then
    Ed4Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                          'COD_PRODUTO_SEGURANCA = '+ME4Produto.Text)
  else
    Ed4Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.ME5FornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Fornecedor.Text) <> '' then
    Ed5Fornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                              'COD_CADASTRO = ' + ME5Fornecedor.Text)
  else
    Ed5Fornecedor.Text := 'Todos';
end;

procedure TFSegurancaParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Filial.Text) <> '' then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = ' + ME4Filial.Text)
  else
    Ed4Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Filial.Text) <> '' then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = ' + ME10Filial.Text)
  else
    Ed10Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME10FilialExit(Self);
end;

procedure TFSegurancaParam.ME10ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Produto.Text) <> '' then
    Ed10Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                           'COD_PRODUTO_SEGURANCA = '+ME10Produto.Text)
  else
    Ed10Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.SB10ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    ME10Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME10ProdutoExit(Self);
end;

procedure TFSegurancaParam.ME11FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11Filial.Text) <> '' then
    Ed11Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = ' + ME11Filial.Text)
  else
    Ed11Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB11FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME11Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME11FilialExit(Self);

end;

procedure TFSegurancaParam.ME11ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11Produto.Text) <> '' then
    Ed11Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                           'COD_PRODUTO_SEGURANCA = '+ME11Produto.Text)
  else
    Ed11Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.SB11ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    ME11Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME11ProdutoExit(Self);
end;

procedure TFSegurancaParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Filial.Text) <> '' then
    Ed12Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = ' + ME12Filial.Text)
  else
    Ed12Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME12Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME12FilialExit(Self);
end;

procedure TFSegurancaParam.ME12ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Produto.Text) <> '' then
    Ed12Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                           'COD_PRODUTO_SEGURANCA = '+ME12Produto.Text)
  else
    Ed12Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.SB12ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    ME12Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME12ProdutoExit(Self);
end;

procedure TFSegurancaParam.ME13FilialOrigExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13FilialOrig.Text) <> '' then
    Ed13FilialOrig.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                              'COD_FILIAL = ' + ME13FilialOrig.Text)
  else
    Ed13FilialOrig.Text := 'Todas';
end;

procedure TFSegurancaParam.SB13FilialOrigClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME13FilialOrig.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME13FilialOrigExit(Self);
end;

procedure TFSegurancaParam.ME13FilialDestExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13FilialDest.Text) <> '' then
    Ed13FilialDest.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                              'COD_FILIAL = ' + ME13FilialDest.Text)
  else
    Ed13FilialDest.Text := 'Todas';
end;

procedure TFSegurancaParam.SB13FilialDestClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME13FilialDest.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME13FilialDestExit(Self);
end;

procedure TFSegurancaParam.ME13ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13Produto.Text) <> '' then
    Ed13Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                           'COD_PRODUTO_SEGURANCA = '+ME13Produto.Text)
  else
    Ed13Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.SB13ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    ME13Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME13ProdutoExit(Self);
end;

procedure TFSegurancaParam.SB14ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOk then
    ME14Produto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME14ProdutoExit(Self);
end;

procedure TFSegurancaParam.ME14ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto.Text) <> '' then
    Ed14Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                           'COD_PRODUTO_SEGURANCA = '+ME14Produto.Text)
  else
    Ed14Produto.Text := 'Todos';
end;

procedure TFSegurancaParam.SB14FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOK then
     ME14Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME14FilialExit(Self);
end;

procedure TFSegurancaParam.ME14FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME14Filial.Text) <> '' then
    Ed14Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = ' + ME14Filial.Text)
  else
    Ed14Filial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB2ProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.Create(Application);
  if FProdutoSegurancaCons.ShowModal = mrOK then
    Me2CodProduto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  ME2CodProdutoExit(Self);
end;

procedure TFSegurancaParam.ME2CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodProduto.Text) <> '' then
    Ed2DescProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                              'COD_PRODUTO_SEGURANCA = '+ME2CodProduto.Text)
  else
    Ed2DescProduto.Text := 'Todos';
end;
                                     
procedure TFSegurancaParam.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilial.Text) <> '' then
    Ed2DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilial.Text)
  else
    Ed2DescFilial.Text := 'Todas';
end;

procedure TFSegurancaParam.SB2FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    ME2CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME2CodFilialExit(Self);
end;

end.
