unit UContratoArrozParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, UFmCadastro,
  UFmProduto, UFmFilial, UFmDepartamento;

type
  TFContratoArrozParam = class(TFTParametro)
    Contratos: TTabSheet;
    Label8: TLabel;
    Label12: TLabel;
    ME0Cadastro: TMaskEdit;
    Bt0Cadastro: TBitBtn;
    ME0Filial: TMaskEdit;
    Bt0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Ed0Cadastro: TEdit;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Me1Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Filial: TEdit;
    Label2: TLabel;
    Me1Cadastro: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed1Cadastro: TEdit;
    Me1Produto: TMaskEdit;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Ed1Produto: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label4: TLabel;
    Me0Contrato: TMaskEdit;
    BitBtn4: TBitBtn;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Me2Filial: TMaskEdit;
    BitBtn5: TBitBtn;
    Ed2Filial: TEdit;
    Me2Cadastro: TMaskEdit;
    Label9: TLabel;
    BitBtn6: TBitBtn;
    Ed2Cadastro: TEdit;
    Me2Contrato: TMaskEdit;
    Label10: TLabel;
    BitBtn7: TBitBtn;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    ME3Cod_Cadastro: TMaskEdit;
    BitBtn8: TBitBtn;
    ED3Desc_Cadastro: TEdit;
    TabSheet4: TTabSheet;
    Label15: TLabel;
    ME4CodFilial: TMaskEdit;
    BitBtn9: TBitBtn;
    ED4DescFilial: TEdit;
    TabSheet5: TTabSheet;
    Label16: TLabel;
    Me5CodFilial: TMaskEdit;
    Bt5ConsFilial: TBitBtn;
    Ed5DescFilial: TEdit;
    Label17: TLabel;
    Me5CodCadastro: TMaskEdit;
    Bt5ConsCadastro: TBitBtn;
    Ed5DescCadastro: TEdit;
    Me5CodProduto: TMaskEdit;
    Bt5ConsProduto: TBitBtn;
    Ed5DescProduto: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Me5Beneficiado: TMaskEdit;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Me5Data_I: TMaskEdit;
    Me5Data_F: TMaskEdit;
    TabSheet6: TTabSheet;
    FmFilial7: TFmFilial;
    FmProduto7: TFmProduto;
    FmCadastro7: TFmCadastro;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Me7Data_I: TMaskEdit;
    Me7Data_F: TMaskEdit;
    FmDepartamento7: TFmDepartamento;
    TabSheet7: TTabSheet;
    FmFilial8: TFmFilial;
    FmProduto8: TFmProduto;
    FmCadastro8: TFmCadastro;
    FmDepartamento8: TFmDepartamento;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Me8Data_I: TMaskEdit;
    Me8Data_F: TMaskEdit;
    Rg8TipoRelatorio: TRadioGroup;
    Label26: TLabel;
    Me5Contrato: TMaskEdit;
    Bt5Contrato: TBitBtn;
    Ed5Contrato: TEdit;
    Rg5Funrural: TRadioGroup;
    TabSheet8: TTabSheet;
    FmCadastro9: TFmCadastro;
    FmProduto9: TFmProduto;
    FmFilial9: TFmFilial;
    RGTipoContrato9: TRadioGroup;
    GBDtContrato: TGroupBox;
    ME9DtContratoI: TMaskEdit;
    Label27: TLabel;
    ME9DtContratoF: TMaskEdit;
    Label28: TLabel;
    Rg9Posicao: TRadioGroup;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure Bt0CadastroClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me1ProdutoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Me2CadastroExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure ContratosShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ME3Cod_CadastroExit(Sender: TObject);
    procedure ME4CodFilialExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Me5CodFilialExit(Sender: TObject);
    procedure Bt5ConsFilialClick(Sender: TObject);
    procedure Me5CodCadastroExit(Sender: TObject);
    procedure Bt5ConsCadastroClick(Sender: TObject);
    procedure Me5CodProdutoExit(Sender: TObject);
    procedure Bt5ConsProdutoClick(Sender: TObject);
    procedure Bt5ContratoClick(Sender: TObject);
    procedure Me5ContratoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoArrozParam: TFContratoArrozParam;

implementation

uses UFilial_cl, UFilialCons, UCadastro_cl, UCadastroCons, UProduto_cl,
  UProdutoCons, UContratoArroz_cl, UContratoArrozCons, UParamSistema_cl,
  UUsuario_cl, UOracle_cl;

{$R *.DFM}

procedure TFContratoArrozParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
    Ed0Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = ' + ME0Filial.text)
  Else
    Ed0Filial.Text := 'Todos';

end;

procedure TFContratoArrozParam.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;

end;

procedure TFContratoArrozParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' Then
    Ed0Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + ME0Cadastro.text)
  Else
    Ed0Cadastro.Text := 'Todos';

end;

procedure TFContratoArrozParam.Bt0CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME0CadastroExit(Self);
  End;

end;

procedure TFContratoArrozParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
    Ed1Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = ' + ME1Filial.text)
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFContratoArrozParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;

end;

procedure TFContratoArrozParam.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' Then
    Ed1Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + ME1Cadastro.text)
  Else
    Ed1Cadastro.Text := 'Todos';

end;

procedure TFContratoArrozParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(Self);
  End;


end;

procedure TFContratoArrozParam.Me1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' Then
    Ed1Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                    'COD_PRODUTO = ' + ME1Produto.text)
  Else
    Ed1Produto.Text := 'Todos';

end;

procedure TFContratoArrozParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME1ProdutoExit(Self);
  End;

end;

procedure TFContratoArrozParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FContratoArrozCons = Nil then
    FContratoArrozCons := TFContratoArrozCons.Create(Application);
  If FContratoArrozCons.ShowModal = mrOk then
  Begin
    ME0Contrato.Text := DMContratoArroz.QContrato_ArrozConsNum_Contrato.Text;
  End;

end;

procedure TFContratoArrozParam.Me2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
    Ed2Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = ' + Me2Filial.text)
  Else
    Ed2Filial.Text := 'Todos';
end;

procedure TFContratoArrozParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;
end;

procedure TFContratoArrozParam.Me2CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Cadastro.Text) <> '' Then
    Ed2Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + ME2Cadastro.text)
  Else
    Ed2Cadastro.Text := 'Todos';
end;

procedure TFContratoArrozParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME2Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME2CadastroExit(Self);
  End;

end;

procedure TFContratoArrozParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FContratoArrozCons = Nil then
    FContratoArrozCons := TFContratoArrozCons.Create(Application);
  If FContratoArrozCons.ShowModal = mrOk then
  Begin
    ME2Contrato.Text := DMContratoArroz.QContrato_ArrozConsNum_Contrato.Text;
  End;

end;

procedure TFContratoArrozParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME1FilialExit(Self);
  ME2FilialExit(Self);
end;

procedure TFContratoArrozParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  FContratoArrozParam.helpcontext:=11;
end;

procedure TFContratoArrozParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FContratoArrozParam.helpcontext:=11;
end;

procedure TFContratoArrozParam.ContratosShow(Sender: TObject);
begin
  inherited;
  FContratoArrozParam.helpcontext:=9;
end;

procedure TFContratoArrozParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME3Cod_Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME3Cod_CadastroExit(Self);
  End;
end;

procedure TFContratoArrozParam.ME3Cod_CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Cod_Cadastro.Text) <> '' Then
    ED3Desc_Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + ME3Cod_Cadastro.text)
  Else
    ED3Desc_Cadastro.Text := 'Todos';
end;

procedure TFContratoArrozParam.ME4CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4CodFilial.Text) <> '' Then
    ED4DescFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = ' + ME4CodFilial.text)
  Else
    ED4DescFilial.Text := 'Todos';
end;

procedure TFContratoArrozParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME4CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME4CodFilialExit(Self);
  End;
end;

procedure TFContratoArrozParam.Me5CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5CodFilial.Text) <> '' Then
    Ed5DescFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = ' + Me5CodFilial.text)
  Else
    Ed5DescFilial.Text := 'Todos';
end;

procedure TFContratoArrozParam.Bt5ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME5CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME5CodFilialExit(Self);
  End;
end;

procedure TFContratoArrozParam.Me5CodCadastroExit(Sender: TObject);
begin
  inherited;
   If Trim(ME5CodCadastro.Text) <> '' Then
    Ed5DescCadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + ME5CodCadastro.text)
  Else
    Ed5DescCadastro.Text := 'Todos';
end;

procedure TFContratoArrozParam.Bt5ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me5CodCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me5CodCadastroExit(Self);
  End;
  
end;

procedure TFContratoArrozParam.Me5CodProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5CodProduto.Text) <> '' Then
    Ed5DescProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                    'COD_PRODUTO = ' + Me5CodProduto.text)
  Else
    Ed5DescProduto.Text := 'Todos';
end;

procedure TFContratoArrozParam.Bt5ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME5CodProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME5CodProdutoExit(Self);
  End;
end;

procedure TFContratoArrozParam.Bt5ContratoClick(Sender: TObject);
begin
  inherited;
  If FContratoArrozCons = Nil then
    FContratoArrozCons := TFContratoArrozCons.Create(Application);
  If FContratoArrozCons.ShowModal = mrOk then
  Begin
    Me5Contrato.Text := DMContratoArroz.QContrato_ArrozConsCod_Contrato_Arroz.Text;
    Me5ContratoExit(Self);
  End;

end;

procedure TFContratoArrozParam.Me5ContratoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Contrato.Text) <> '' Then
    Ed5Contrato.text:=DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_ARROZ',
                    'COD_CONTRATO_ARROZ = ' + Me5Contrato.text)
  Else
    Ed5Contrato.Text := 'Todos';

end;

end.
