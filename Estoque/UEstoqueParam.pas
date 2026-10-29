unit UEstoqueParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmClasse,
  UFmProduto, UFmFilial, UFmMarca, UFmTributacao, UFmLote, UFmNcm,
  UFmSubClasse, DBCtrls;
  // DBarImage;

type
  TFEstoqueParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0CodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME0Filial: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    TSRegistroInventario: TTabSheet;
    Label3: TLabel;
    ME1CodFilial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ME1Filial: TMaskEdit;
    CB1Ordem: TComboBox;
    Label5: TLabel;
    CB0Todos: TCheckBox;
    RG1Valor: TRadioGroup;
    Label6: TLabel;
    ME1NumClasseInicial: TMaskEdit;
    Label7: TLabel;
    Me1SubClasses: TMaskEdit;
    SB1ClasseInicial: TSpeedButton;
    SB1ClasseFinal: TSpeedButton;
    Ed1SubClasses: TMaskEdit;
    RGEstoque: TRadioGroup;
    TSEstoqueLevantamento: TTabSheet;
    TSEstoqueImplantado: TTabSheet;
    ME2DataInicial: TMaskEdit;
    ME2DataFinal: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    TSEstoqueMinimp: TTabSheet;
    ME4CodFilial: TMaskEdit;
    SpeedButton5: TSpeedButton;
    ME4Filial: TMaskEdit;
    SpeedButton6: TSpeedButton;
    ME4Classe: TMaskEdit;
    ME4NrClasse: TMaskEdit;
    ME4NrSubClasse: TMaskEdit;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TabSheet2: TTabSheet;
    ME5CodFilial: TMaskEdit;
    SpeedButton7: TSpeedButton;
    ME5Filial: TMaskEdit;
    SpeedButton8: TSpeedButton;
    ME5Classe: TMaskEdit;
    ME5NrClasse: TMaskEdit;
    ME5NrSubClasse: TMaskEdit;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    Sp6Filial: TSpeedButton;
    Label19: TLabel;
    Me6CodFilial: TMaskEdit;
    Me6Filial: TMaskEdit;
    Cb6Ordem: TComboBox;
    Rg6Estoque: TRadioGroup;
    Cb6Primeiro: TCheckBox;
    Cb6Ultimo: TCheckBox;
    Label32: TLabel;
    Cb6Situacao: TComboBox;
    Rg1Quantidade: TRadioGroup;
    CBSituacao: TComboBox;
    Label22: TLabel;
    CB1TipoProduto: TComboBox;
    Label23: TLabel;
    TabSheet4: TTabSheet;
    Label24: TLabel;
    Me7CodFilial: TMaskEdit;
    Me7NumClasseInicial: TMaskEdit;
    Label25: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Me7Filial: TMaskEdit;
    Me7DescClasseInicial: TMaskEdit;
    Cb7Primeiro: TCheckBox;
    Me7NumClasseFinal: TMaskEdit;
    Label27: TLabel;
    SpeedButton11: TSpeedButton;
    Me7DescClasseFinal: TMaskEdit;
    Cb7Ultimo: TCheckBox;
    Rg7Estoque: TRadioGroup;
    Cb7Ordem: TComboBox;
    Label28: TLabel;
    Label29: TLabel;
    Cb7Situacao: TComboBox;
    TabSheet5: TTabSheet;
    Label30: TLabel;
    Me8CodFilial: TMaskEdit;
    SpeedButton12: TSpeedButton;
    Me8Filial: TMaskEdit;
    Label31: TLabel;
    Cb8Ordem: TComboBox;
    Label33: TLabel;
    TabSheet6: TTabSheet;
    Label34: TLabel;
    Me9CodFilial: TMaskEdit;
    SpeedButton13: TSpeedButton;
    Me9Filial: TMaskEdit;
    Label36: TLabel;
    Me9NumClasseInicial: TMaskEdit;
    SpeedButton14: TSpeedButton;
    Me9DescClasseInicial: TMaskEdit;
    Cb9Primeiro: TCheckBox;
    Label37: TLabel;
    Me9NumClasseFinal: TMaskEdit;
    SpeedButton15: TSpeedButton;
    Me9DescClasseFinal: TMaskEdit;
    Cb9Ultimo: TCheckBox;
    Label40: TLabel;
    Me9CodProduto: TMaskEdit;
    SpeedButton16: TSpeedButton;
    Me9Produto: TMaskEdit;
    GroupBox1: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    Label47: TLabel;
    ME4CodCadastro: TMaskEdit;
    SB_FornecedorCons: TSpeedButton;
    ME4CadastroNome: TMaskEdit;
    Label41: TLabel;
    ME5CodCadastro: TMaskEdit;
    SBCadastroCons: TSpeedButton;
    ME5CadastroNome: TMaskEdit;
    TabSheet7: TTabSheet;
    Label43: TLabel;
    ME10CodProdutoI: TMaskEdit;
    SB10ProdutoICons: TSpeedButton;
    ME10DescProdutoI: TMaskEdit;
    ME10NrCopias: TMaskEdit;
    Label45: TLabel;
    Label44: TLabel;
    ME10CodProdutoF: TMaskEdit;
    SB10ProdutoFCons: TSpeedButton;
    ME10DescProdutoF: TMaskEdit;
    Me9DataFinal: TMaskEdit;
    Me9DataInicial: TMaskEdit;
    Label35: TLabel;
    Me9SubClasseF: TMaskEdit;
    SpeedButton17: TSpeedButton;
    Me9DescSubClasseF: TMaskEdit;
    Label42: TLabel;
    Me9SubClasseI: TMaskEdit;
    SpeedButton18: TSpeedButton;
    Me9DescSubClasseI: TMaskEdit;
    Me9Cadastro: TMaskEdit;
    Label46: TLabel;
    Sb9Fornecedor: TSpeedButton;
    Ed9Cadastro: TMaskEdit;
    Rg9Situacao: TRadioGroup;
    Me6Vencimento: TMaskEdit;
    Label48: TLabel;
    Rg9Ordem: TRadioGroup;
    Label49: TLabel;
    ME1DtReferencia: TMaskEdit;
    TabSheet8: TTabSheet;
    Label50: TLabel;
    ME11Filial: TMaskEdit;
    SpeedButton20: TSpeedButton;
    Label51: TLabel;
    ME11Produto: TMaskEdit;
    SpeedButton21: TSpeedButton;
    Label52: TLabel;
    ME11Fornecedor: TMaskEdit;
    SpeedButton22: TSpeedButton;
    GroupBox2: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    ME11DT_Emissao_F: TMaskEdit;
    ME11DT_Emissao_I: TMaskEdit;
    ED11Filial: TEdit;
    ED11Produto: TEdit;
    ED11Fornecedor: TEdit;
    ME11Vendedor: TMaskEdit;
    SpeedButton23: TSpeedButton;
    ED11Vendedor: TEdit;
    Label55: TLabel;
    Cb2TipoProduto: TComboBox;
    Label56: TLabel;
    Me9Vendedor: TMaskEdit;
    Label58: TLabel;
    SpeedButton25: TSpeedButton;
    Ed9Vendedor: TEdit;
    Label59: TLabel;
    SpeedButton19: TSpeedButton;
    Me1Classe: TMaskEdit;
    Ed1Classe: TMaskEdit;
    Rg9TpRelatorio: TRadioGroup;
    Rg11VendaFutura: TRadioGroup;
    Label60: TLabel;
    CbTipoProduto: TComboBox;
    Label61: TLabel;
    Cb2Situacao: TComboBox;
    Label62: TLabel;
    SpeedButton26: TSpeedButton;
    Me1Fornecedor: TMaskEdit;
    Ed1Fornecedor: TMaskEdit;
    Cb7TipoProduto: TComboBox;
    Label63: TLabel;
    Label64: TLabel;
    SpeedButton27: TSpeedButton;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    SpeedButton28: TSpeedButton;
    Me0Classe: TMaskEdit;
    Ed0Classe: TMaskEdit;
    Cb0TipoProduto: TComboBox;
    Cb0Situacao: TComboBox;
    Me0Fornecedor: TMaskEdit;
    Ed0Fornecedor: TMaskEdit;
    CB0Ordem: TComboBox;
    Label68: TLabel;
    Label69: TLabel;
    CB2Ordem: TComboBox;
    Label70: TLabel;
    ME8Fornecedor: TMaskEdit;
    SB8Fornecedor: TSpeedButton;
    Label71: TLabel;
    Ed8Fornecedor: TEdit;
    TabSheet9: TTabSheet;
    Label72: TLabel;
    Label73: TLabel;
    SBFilialCons: TSpeedButton;
    ME12Filial: TMaskEdit;
    ED12Filial: TEdit;
    SBProdutoCons: TSpeedButton;
    ED12Produto: TEdit;
    ME12Produto: TMaskEdit;
    GroupBox3: TGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    ME12Data_F: TMaskEdit;
    ME12Data_I: TMaskEdit;
    Label76: TLabel;
    ME12Origem: TMaskEdit;
    SBOrigemCons: TSpeedButton;
    ED12Origem: TEdit;
    RG12Turno: TRadioGroup;
    RG12Linha: TRadioGroup;
    TabSheet10: TTabSheet;
    ME13Filial: TMaskEdit;
    ME13Produto: TMaskEdit;
    SB13Filial: TSpeedButton;
    SB13Produto: TSpeedButton;
    Ed13Filial: TEdit;
    Ed13Produto: TEdit;
    GroupBox4: TGroupBox;
    ME13DtInicial: TMaskEdit;
    ME13DtFinal: TMaskEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    ME13Classe: TMaskEdit;
    SB13Classe: TSpeedButton;
    Ed13Classe: TEdit;
    Label81: TLabel;
    Label82: TLabel;
    Ed1Subclasse: TEdit;
    SB1Subclasse: TSpeedButton;
    ME1Subclasse: TMaskEdit;
    Label4: TLabel;
    Sb7Lote: TSpeedButton;
    Me7CodLote: TMaskEdit;
    Me7Lote: TMaskEdit;
    Label16: TLabel;
    ME12Classe: TMaskEdit;
    SB12Classe: TSpeedButton;
    Ed12Classe: TEdit;
    Label26: TLabel;
    ME11Classe: TMaskEdit;
    SB11Classe: TSpeedButton;
    Label83: TLabel;
    ME11Subclasse: TMaskEdit;
    SB11Subclasse: TSpeedButton;
    Ed11Subclasse: TEdit;
    Ed11Classe: TEdit;
    Label84: TLabel;
    Sb1Fornecedor: TSpeedButton;
    Me1CodFornecedor: TMaskEdit;
    Ed1Nome: TEdit;
    TabSheet11: TTabSheet;
    FmClasse1: TFmClasse;
    FmFilial4: TFmFilial;
    FmProduto4: TFmProduto;
    FmClasse4: TFmClasse;
    TabSheet12: TTabSheet;
    Fm15Filial: TFmFilial;
    Label11: TLabel;
    Me15Ano: TMaskEdit;
    Label57: TLabel;
    Me15Mes: TMaskEdit;
    Cb15Ordem: TComboBox;
    Label85: TLabel;
    SBClasseAdd: TSpeedButton;
    M1Classes: TMemo;
    Me1DescClasseInicial: TEdit;
    Label86: TLabel;
    SB2ClasseInicial: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Me2NumClasseInicial: TMaskEdit;
    M2Classes: TMemo;
    Me2DescClasseInicial: TEdit;
    Me1Percentual: TMaskEdit;
    Label87: TLabel;
    Label88: TLabel;
    Me1Pagina: TMaskEdit;
    Rg1Codigo: TRadioGroup;
    Rg1FormaImpressao: TRadioGroup;
    Fm1Marca: TFmMarca;
    Label89: TLabel;
    Me1Ordem: TComboBox;
    Fm12Tributacao: TFmTributacao;
    Fm1Lote: TFmLote;
    Fm15Ncm: TFmNcm;
    Fm1Produto: TFmProduto;
    Fm6SubClasseInicial: TFmSubClasse;
    Fm6SubClasseFinal: TFmSubClasse;
    rg15Produto: TRadioGroup;
    Label20: TLabel;
    CB15Situacao: TComboBox;
    TabSheet13: TTabSheet;
    Label21: TLabel;
    Me16Classe: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Ed16Classe: TMaskEdit;
    Label90: TLabel;
    Me16SubClasse: TMaskEdit;
    SpeedButton24: TSpeedButton;
    Ed16SubClasse: TEdit;
    Label91: TLabel;
    ME16Fornecedor: TMaskEdit;
    SpeedButton29: TSpeedButton;
    Ed16Fornecedor: TMaskEdit;
    Label92: TLabel;
    Cb16TipoProduto: TComboBox;
    Label93: TLabel;
    Cb16Situacao: TComboBox;
    Label94: TLabel;
    Cb16Ordem: TComboBox;
    Fm16Filial: TFmFilial;
    Fm16Marca: TFmMarca;
    RG9Estoque: TRadioGroup;
    Label95: TLabel;
    CB15TipoProduto: TComboBox;
    FmMarca4: TFmMarca;
    RG1AgrupaLote: TRadioGroup;
    TabSheet14: TTabSheet;
    FmFilial17: TFmFilial;
    FmProduto17: TFmProduto;
    FmSubClasse17: TFmSubClasse;
    RGOrdem17: TRadioGroup;
    RG15Estoque: TRadioGroup;
    Fm15Lote: TFmLote;
    Label96: TLabel;
    Cb17Situacao: TComboBox;
    Label97: TLabel;
    Me15Pagina: TMaskEdit;
    Rg7Preco: TRadioGroup;
    FmMarca1: TFmMarca;
    RG16EstoqueZero: TRadioGroup;
    Rg_Order: TRadioGroup;
    Rg_Order2: TRadioGroup;
    Me16Localizacao: TMaskEdit;
    Label98: TLabel;
    Rg11Ordenar: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB1ClasseInicialClick(Sender: TObject);
    procedure SB1ClasseFinalClick(Sender: TObject);
    procedure CB0TodosClick(Sender: TObject);
    procedure ME0CodFilialChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ME4CodFilialChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME4CodClasseChange(Sender: TObject);
    procedure ME4NrClasseChange(Sender: TObject);
    procedure ME4NrSubClasseChange(Sender: TObject);
    procedure ME5CodFilialChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ME5NrSubClasseChange(Sender: TObject);
    procedure ME5NrClasseChange(Sender: TObject);
    procedure Sp6FilialClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure Me7NumClasseInicialChange(Sender: TObject);
    procedure Cb7PrimeiroClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Me7NumClasseFinalChange(Sender: TObject);
    procedure Cb7UltimoClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Me9CodFilialChange(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Me9NumClasseInicialChange(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Cb9PrimeiroClick(Sender: TObject);
    procedure Me9NumClasseFinalChange(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Cb9UltimoClick(Sender: TObject);
    procedure ME4CodCadastroExit(Sender: TObject);
    procedure SB_FornecedorConsClick(Sender: TObject);
    procedure ME5CodCadastroExit(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure ME10CodProdutoIExit(Sender: TObject);
    procedure ME10CodProdutoFExit(Sender: TObject);
    procedure SB10ProdutoIConsClick(Sender: TObject);
    procedure SB10ProdutoFConsClick(Sender: TObject);
    procedure Me9CodProdutoExit(Sender: TObject);
    procedure Me9CodFilialExit(Sender: TObject);
    procedure Me8CodFilialExit(Sender: TObject);
    procedure Me7CodFilialExit(Sender: TObject);
    procedure Me6CodFilialExit(Sender: TObject);
    procedure Me9SubClasseIChange(Sender: TObject);
    procedure Me9SubClasseFChange(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure Me9CadastroExit(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure ME11FilialExit(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ME11ProdutoExit(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ME11FornecedorExit(Sender: TObject);
    procedure ME11VendedorExit(Sender: TObject);
    procedure Me9VendedorExit(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure Sb9FornecedorClick(Sender: TObject);
    procedure Me1ClasseExit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure Me1FornecedorExit(Sender: TObject);
    procedure Me0ClasseExit(Sender: TObject);
    procedure Me0FornecedorExit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure ME8FornecedorExit(Sender: TObject);
    procedure SB8FornecedorClick(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure SBOrigemConsClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure ME12ProdutoExit(Sender: TObject);
    procedure ME12OrigemExit(Sender: TObject);
    procedure SB13FilialClick(Sender: TObject);
    procedure SB13ProdutoClick(Sender: TObject);
    procedure ME13FilialExit(Sender: TObject);
    procedure ME13ProdutoExit(Sender: TObject);
    procedure SB13ClasseClick(Sender: TObject);
    procedure ME13ClasseExit(Sender: TObject);
    procedure ME1SubclasseExit(Sender: TObject);
    procedure SB1SubclasseClick(Sender: TObject);
    procedure Me1SubClassesExit(Sender: TObject);
    procedure ME1NumClasseInicialExit(Sender: TObject);
    procedure ME1CodFilialExit(Sender: TObject);
    procedure Me7CodLoteChange(Sender: TObject);
    procedure Sb7LoteClick(Sender: TObject);
    procedure SB12ClasseClick(Sender: TObject);
    procedure ME12ClasseExit(Sender: TObject);
    procedure SB11ClasseClick(Sender: TObject);
    procedure SB11SubclasseClick(Sender: TObject);
    procedure ME11ClasseChange(Sender: TObject);
    procedure Sb1FornecedorClick(Sender: TObject);
    procedure Me1CodFornecedorExit(Sender: TObject);
    procedure FmClasse1BtClasseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBClasseAddClick(Sender: TObject);
    procedure Me2NumClasseInicialExit(Sender: TObject);
    procedure SB2ClasseInicialClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Fm16FilialBtFilialClick(Sender: TObject);
    procedure Fm16MarcaBtMarcaClick(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure ME16FornecedorExit(Sender: TObject);
    procedure Me16ClasseExit(Sender: TObject);
    procedure Me16SubClasseExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure FmClasse4BtClasseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueParam: TFEstoqueParam;
  Classes: TStrings;

implementation

uses UFilialCons, UFilial_cl, UClasseCons, UClasse_cl, UParamSistema_cl,
  UProdutoCons, UProduto_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UUsuario_cl, UVendedorCons, UVendedor_cl, UOrigemProducaoCons,
  UOrigemProducao_cl, UTipoLoteCons, UTipoLote_cl, UMarcaCons, UMarca_cl;

{$R *.DFM}

procedure TFEstoqueParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    Begin
      ME0CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;
end;


procedure TFEstoqueParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
     ME1CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
  ME1CodFilialExit(Self);     
end;

procedure TFEstoqueParam.FormCreate(Sender: TObject);
begin
  inherited;
{  DMParamSistema.QParamSistema.Open;}
  CB1Ordem.ItemIndex:=0;
  CB1TipoProduto.ItemIndex:=0;
  CB6Ordem.ItemIndex:=0;
  CB6Situacao.ItemIndex:=0;
  CB7Ordem.ItemIndex:=0;
  CB7Situacao.ItemIndex:=0;
  CB8Ordem.ItemIndex:=0;
  RG1Valor.Items.Clear;
  RG1Valor.Items.Add('Custo Médio');
  RG1Valor.Items.Add('Preço '+DMParamSistema.QParamSistemaInd_Preco.value);
  RG1Valor.Items.Add('Preço '+DMParamSistema.QParamSistemaInd_Preco2.value);
  RG1Valor.Items.Add('Custo da Última Compra');
  RG1Valor.Items.Add('Custo em Dólar');
  RG1Valor.ItemIndex:=0;
{  DMParamSistema.QParamSistema.Close;}
end;

procedure TFEstoqueParam.SB1ClasseInicialClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
     ME1NumClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
  ME1NumClasseInicialExit(Self);   
end;

procedure TFEstoqueParam.SB1ClasseFinalClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
     Me1SubClasses.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
  Me1SubClassesExit(Self);     
end;

procedure TFEstoqueParam.CB0TodosClick(Sender: TObject);
begin
  inherited;
  if CB0Todos.Checked then
    begin
      ME0CodFilial.Clear;
      ME0Filial.Clear;
    end;
end;

procedure TFEstoqueParam.ME0CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.text)<>'' then
    begin
      ME0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilial.text);
      CB0Todos.Checked:=False;
    end
  else
    begin
      ME0Filial.Clear;
      CB0Todos.Checked:=True;
    end;
end;

procedure TFEstoqueParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1CodFilialExit(sender);
  FEstoqueParam.FmFilial4.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME4CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me8CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me9CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me1DtReferencia.Text:=DateToStr(Date);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' Then
     FEstoqueParam.CB1Ordem.ItemIndex := 2;
end;

procedure TFEstoqueParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=MrOk then
    Begin
      ME4CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    End;
end;

procedure TFEstoqueParam.ME4CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.Text)<>'' then
    ME4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.text)
  else
    ME4Filial.Text:='Todos';
end;

procedure TFEstoqueParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME4NrCLasse.Text:=FloatToStr(DMClasse.QClasseConsNUM_CLASSE.Value);
      ME4NrSubCLasse.Text:=FloatToStr(DMClasse.QClasseConsNUM_SUBCLASSE.Value);
      ME4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME4NrClasse.Text+' AND NUM_SUBCLASSE = '+ME4NrSubClasse.Text);
    End;
end;

procedure TFEstoqueParam.ME4CodClasseChange(Sender: TObject);
begin
  inherited;
  If (ME4NrClasse.Text<>'') then
    Begin
      If (ME4NrSubCLasse.Text<>'') then
        ME4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME4NrClasse.Text+' AND NUM_SUBCLASSE = '+ME4NrSubClasse.Text)
      Else
        ME4Classe.Text :='';
    End
  Else
    Begin
       ME4Classe.Text:='Todos';
    End;
end;

procedure TFEstoqueParam.ME4NrClasseChange(Sender: TObject);
begin
  inherited;
  If (ME4NrClasse.Text<>'') then
    Begin
      If (ME4NrSubCLasse.Text<>'') then
        ME4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME4NrClasse.Text+' AND NUM_SUBCLASSE = '+ME4NrSubClasse.Text)
      Else
        ME4Classe.Text :='Todos';
    End
  Else
    Begin
       ME4Classe.Text:='';
    End;
end;

procedure TFEstoqueParam.ME4NrSubClasseChange(Sender: TObject);
begin
  inherited;
  If (ME4NrClasse.Text<>'') then
    Begin
      If (ME4NrSubCLasse.Text<>'') then
        ME4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME4NrClasse.Text+' AND NUM_SUBCLASSE = '+ME4NrSubClasse.Text)
      Else
        ME4Classe.Text :='Todos';
    End
  Else
    Begin
       ME4Classe.Text:='';
    End;
end;

procedure TFEstoqueParam.ME5CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodFilial.Text)<>'' then
    ME5Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME5CodFilial.text)
  else
    ME5Filial.Text:='Todos';
end;

procedure TFEstoqueParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=MrOk then
    Begin
      ME5CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    End;
end;

procedure TFEstoqueParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME5NrCLasse.Text:=FloatToStr(DMClasse.QClasseConsNUM_CLASSE.Value);
      ME5NrSubCLasse.Text:=FloatToStr(DMClasse.QClasseConsNUM_SUBCLASSE.Value);
      ME5Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME5NrClasse.Text+' AND NUM_SUBCLASSE = '+ME5NrSubClasse.Text);
    End;
end;

procedure TFEstoqueParam.ME5NrSubClasseChange(Sender: TObject);
begin
  inherited;
  If (ME5NrClasse.Text<>'') then
    Begin
      If (ME5NrSubCLasse.Text<>'') then
        ME5Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME5NrClasse.Text+' AND NUM_SUBCLASSE = '+ME5NrSubClasse.Text)
      Else
        ME5Classe.Text :='Todos';
    End
  Else
    Begin
       ME5Classe.Text:='';
    End;
end;

procedure TFEstoqueParam.ME5NrClasseChange(Sender: TObject);
begin
  inherited;
  If (ME5NrClasse.Text<>'') then
    Begin
      If (ME5NrSubCLasse.Text<>'') then
        ME5Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+ME5NrClasse.Text+' AND NUM_SUBCLASSE = '+ME5NrSubClasse.Text)
      Else
        ME5Classe.Text :='Todos';
    End
  Else
    Begin
       ME5Classe.Text:='';
    End;
end;

//procedure TFEstoqueParam.Cb6PrimeiroClick(Sender: TObject);
//begin
//  inherited;
//  if CB6Primeiro.Checked then
//    begin
//      ME6NumClasseInicial.Clear;
//      ME6DescClasseInicial.Clear;
//    end;
//
//end;

//procedure TFEstoqueParam.Cb6UltimoClick(Sender: TObject);
//begin
//  inherited;
//  if CB6Ultimo.Checked then
//    begin
//      ME6NumClasseFinal.Clear;
//      ME6DescClasseFinal.Clear;
//    end;
//
//end;

procedure TFEstoqueParam.Sp6FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    ME6CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);

end;

procedure TFEstoqueParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    Begin
      ME7CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;

end;

procedure TFEstoqueParam.Me7NumClasseInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(Me7NumClasseInicial.Text) <> '' then
  begin
    Me7DescClasseInicial.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me7NumClasseInicial.Text);
    CB7Primeiro.Checked:=False;
  end
  else
  begin
    Me7NumClasseInicial.Clear;
    Me7DescClasseInicial.Text := ' ';
  end;end;

procedure TFEstoqueParam.Cb7PrimeiroClick(Sender: TObject);
begin
  inherited;
  if CB7Primeiro.Checked then
    begin
      ME7NumClasseInicial.Clear;
      ME7DescClasseInicial.Clear;
    end;

end;

procedure TFEstoqueParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME7NumClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME7DescClasseInicial.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.Me7NumClasseFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(Me7NumClasseFinal.Text) <> '' then
  begin
    Me7DescClasseFinal.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me7NumClasseFinal.Text);
    CB7Ultimo.Checked:=False;
  end
  else
  begin
    Me7NumClasseFinal.Clear;
    Me7DescClasseFinal.Text := ' ';
  end;
end;

procedure TFEstoqueParam.Cb7UltimoClick(Sender: TObject);
begin
  inherited;
  if CB7Ultimo.Checked then
    begin
      ME7NumClasseFinal.Clear;
      ME7DescClasseFinal.Clear;
    end;


end;

procedure TFEstoqueParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME7NumClasseFinal.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME7DescClasseFinal.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    Begin
      ME8CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;

end;

procedure TFEstoqueParam.Me9CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.text)<>'' then
      ME9Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9CodFilial.text)
  else
      ME9Filial.Text:='Todas';

end;

procedure TFEstoqueParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    Begin
      ME9CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;

end;

procedure TFEstoqueParam.Me9NumClasseInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(Me9NumClasseInicial.Text) <> '' then
  begin
    Me9DescClasseInicial.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me9NumClasseInicial.Text+' And NUM_SUBCLASSE=0');
    CB9Primeiro.Checked:=False;
  end
  else
  begin
    Me9NumClasseInicial.Clear;
    Me9DescClasseInicial.Text := ' ';
  end;

end;

procedure TFEstoqueParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME9NumClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME9DescClasseInicial.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.Cb9PrimeiroClick(Sender: TObject);
begin
  inherited;
  if CB9Primeiro.Checked then
    begin
      ME9NumClasseInicial.Clear;
      ME9DescClasseInicial.Clear;
    end;

end;

procedure TFEstoqueParam.Me9NumClasseFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(Me9NumClasseFinal.Text) <> '' then
  begin
    Me9DescClasseFinal.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me9NumClasseFinal.Text+' And NUM_SUBCLASSE=0');
    CB9Ultimo.Checked:=False;
  end
  else
  begin
    Me9NumClasseFinal.Clear;
    Me9DescClasseFinal.Text := ' ';
  end;

end;

procedure TFEstoqueParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME9NumClasseFinal.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME9DescClasseFinal.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=MrOk then
    Begin
      ME9CodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
      ME9Produto.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    End;

end;

procedure TFEstoqueParam.Cb9UltimoClick(Sender: TObject);
begin
  inherited;
  if CB9Ultimo.Checked then
    begin
      ME9NumClasseFinal.Clear;
      ME9DescClasseFinal.Clear;
    end;

end;

procedure TFEstoqueParam.ME4CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodCadastro.Text)<>'' then
    ME4CadastroNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4CodCadastro.Text)
  else
    ME4CodCadastro.Clear;

end;

procedure TFEstoqueParam.SB_FornecedorConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    begin
      ME4CodCadastro.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      ME4CodCadastroExit(Self);
    end;

end;

procedure TFEstoqueParam.ME5CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodCadastro.Text)<>'' then
    ME5CadastroNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME5CodCadastro.Text)
  else
    ME5CodCadastro.Clear;

end;

procedure TFEstoqueParam.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
  FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    begin
      ME5CodCadastro.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      ME5CodCadastroExit(Self);
    end;
end;

procedure TFEstoqueParam.ME10CodProdutoIExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodProdutoI.text)<>'' then
    ME10DescProdutoI.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME10CodProdutoI.text)
  else
    ME10DescProdutoI.Clear;
end;

procedure TFEstoqueParam.ME10CodProdutoFExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodProdutoF.text)<>'' then
    ME10DescProdutoF.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME10CodProdutoF.text)
  else
    ME10DescProdutoF.Clear;
end;

procedure TFEstoqueParam.SB10ProdutoIConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
  begin
    ME10CodProdutoI.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME10CodProdutoIExit(Self);
  end;

end;

procedure TFEstoqueParam.SB10ProdutoFConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
  begin
    ME10CodProdutoF.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME10CodProdutoFExit(Self);
  end;

end;

procedure TFEstoqueParam.Me9CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me9CodProduto.Text) <> '' then
    Me9Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me9CodProduto.Text)
  Else
    Me9Produto.Text:='Todos';
end;

procedure TFEstoqueParam.Me9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me9CodFilial.Text) <> '' then
    Me9Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me9CodFilial.Text)
  else
    Me9Filial.Text:='Todas';
end;

procedure TFEstoqueParam.Me8CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodFilial.text)<>'' then
      ME8Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8CodFilial.text)
  else
      ME8Filial.Text:='Todas';

end;

procedure TFEstoqueParam.Me7CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodFilial.text)<>'' then
      ME7Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME7CodFilial.text)
  else
      ME7Filial.Text := 'Todas';

end;

procedure TFEstoqueParam.Me6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodFilial.text)<>'' then
      ME6Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6CodFilial.text)
  else
      ME6Filial.Text :='Todas';
end;

procedure TFEstoqueParam.Me9SubClasseIChange(Sender: TObject);
begin
  inherited;
  if Trim(Me9SubClasseI.Text) <> '' then
    Me9DescSubClasseI.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me9NumClasseInicial.Text + ' And NUM_SUBCLASSE='+Me9SubClasseI.Text)
  else
  Begin
    Me9SubClasseI.Clear;
    Me9DescSubClasseI.Text := ' ';
  end;

end;

procedure TFEstoqueParam.Me9SubClasseFChange(Sender: TObject);
begin
  inherited;
  if Trim(Me9SubClasseF.Text) <> '' then
    Me9DescSubClasseF.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me9NumClasseFinal.Text + ' And NUM_SUBCLASSE = ' + Me9SubClasseF.Text)
  else
   begin
    Me9SubClasseF.Clear;
    Me9DescSubClasseF.Text := ' ';
   end;

end;

procedure TFEstoqueParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME9SubClasseI.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      ME9DescSubClasseI.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME9SubClasseF.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      ME9DescSubClasseF.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.Me9CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me9Cadastro.Text) <> '' then
    Ed9Cadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me9Cadastro.Text)
  Else
    Ed9Cadastro.Text:='Todos';

end;

procedure TFEstoqueParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME1Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Ed1Classe.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;
end;

procedure TFEstoqueParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
      ME11Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFEstoqueParam.ME11FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me11Filial.Text) <> '' then
    ED11Filial.Text:=DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial','COD_Filial = '+Trim(Me11Filial.Text))
  Else
    ED11Filial.Text:='Todas';
end;

procedure TFEstoqueParam.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=MrOk then
    ME11Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFEstoqueParam.ME11ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11Produto.Text) <> '' then
    ED11Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME11Produto.Text))
  Else
    ED11Produto.Text:='Todos';
end;

procedure TFEstoqueParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=MrOk then
    Begin
      Me11Fornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Ed11Fornecedor.Text:=DMCadastro.QCadastroConsNome.Value;
    End;
end;

procedure TFEstoqueParam.ME11FornecedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me11Fornecedor.Text) <> '' then
    Ed11Fornecedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+trim(Me11Fornecedor.Text))
  Else
    Ed11Fornecedor.Text:='Todos';

end;

procedure TFEstoqueParam.ME11VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me11Vendedor.Text) <> '' then
    Ed11Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+trim(Me11Vendedor.Text))
  Else
    Ed11Vendedor.Text:='Todos';
end;

procedure TFEstoqueParam.Me9VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me9Vendedor.Text) <> '' then
    Ed9Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(Me9Vendedor.Text))
  Else
    Ed9Vendedor.Text:='Todos';

end;

procedure TFEstoqueParam.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=MrOk then
   Begin
     Me9Vendedor.Text:=FloatToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
     Ed9Vendedor.Text:=DMVendedor.QVendedorConsNome.Value;
   End;

end;

procedure TFEstoqueParam.Sb9FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=MrOk then
    Begin
      Me9Cadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Ed9Cadastro.Text:=DMCadastro.QCadastroConsNome.Value;
    End;

end;

procedure TFEstoqueParam.Me1ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Classe.Text) <> '' then
    Ed1Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me1Classe.Text)
  else
    Ed1Classe.Text := 'Todas';
end;

procedure TFEstoqueParam.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=MrOk then
   Begin
     Me11Vendedor.Text:=FloatToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
     Ed11Vendedor.Text:=DMVendedor.QVendedorConsNome.Value;
   End;

end;

procedure TFEstoqueParam.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me1Fornecedor.Text:= DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me1FornecedorExit(Self);
  End;
end;

procedure TFEstoqueParam.Me1FornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Fornecedor.Text) <> '' then
     Ed1Fornecedor.Text:=DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+Trim(Me1Fornecedor.Text))
  else
    Ed1Fornecedor.Text := 'Todos';
end;

procedure TFEstoqueParam.Me0ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Classe.Text) <> '' then
    Ed0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me0Classe.Text)
  else
    Ed0Classe.Text := 'Todas';

end;

procedure TFEstoqueParam.Me0FornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Fornecedor.Text) <> '' then
    Ed0Fornecedor.Text:=DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+Trim(Me0Fornecedor.Text))
  else
    Ed0Fornecedor.Text := 'Todos';

end;

procedure TFEstoqueParam.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me0Fornecedor.Text:= DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me0FornecedorExit(Self);
  End;

end;

procedure TFEstoqueParam.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      Me0Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Ed0Classe.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.ME8FornecedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me8Fornecedor.Text) <> '' then
    Ed8Fornecedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+trim(Me8Fornecedor.Text))
  Else
    Ed8Fornecedor.Text:='Todos';

end;

procedure TFEstoqueParam.SB8FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=MrOk then
    Begin
      Me8Fornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Ed8Fornecedor.Text:=DMCadastro.QCadastroConsNome.Value;
    End;

end;

procedure TFEstoqueParam.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
      ME12Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFEstoqueParam.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=MrOk then
    ME12Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFEstoqueParam.SBOrigemConsClick(Sender: TObject);
begin
  inherited;
  If FOrigemProducaoCons=Nil then
    FOrigemProducaoCons:=TFOrigemProducaoCons.Create(Application);
  If FOrigemProducaoCons.ShowModal=MrOk then
    ME12Origem.Text:=FloatToStr(DMOrigemProducao.QOrigemProducaoConsCod_Origem_Producao.Value);
end;

procedure TFEstoqueParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me12Filial.Text) <> '' then
    ED12Filial.Text:=DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial','COD_Filial = '+Trim(Me12Filial.Text))
  Else
    ED12Filial.Text:='Todas';
end;

procedure TFEstoqueParam.ME12ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Produto.Text) <> '' then
    ED12Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME12Produto.Text))
  Else
    ED12Produto.Text:='Todos';
end;

procedure TFEstoqueParam.ME12OrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Produto.Text) <> '' then
    ED12Origem.Text:=DMOracle.BuscaNome('SELECT DESC_ORIGEM_PRODUCAO FROM TB_ORIGEM_PRODUCAO','COD_ORIGEM_PRODUCAO = '+Trim(ME12Origem.Text))
  Else
    ED12Origem.Text:='Todos';
end;

procedure TFEstoqueParam.SB13FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
      ME13Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
      ME13FilialExit(self);
end;

procedure TFEstoqueParam.SB13ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal=MrOk then
    ME13Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
    ME13ProdutoExit(self);
end;

procedure TFEstoqueParam.ME13FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13Filial.Text) <> '' then
    ED13Filial.Text:=DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial','COD_Filial = '+Trim(Me13Filial.Text))
  Else
    ED13Filial.Text:='Todas';

end;

procedure TFEstoqueParam.ME13ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13Produto.Text) <> '' then
    ED13Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME13Produto.Text))
  Else
    ED13Produto.Text:='Todos';

end;

procedure TFEstoqueParam.SB13ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME13Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME13ClasseExit(self);
    End;

end;

procedure TFEstoqueParam.ME13ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13Classe.Text) <> '' then
    Ed13Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me13Classe.Text)
  else
    Ed13Classe.Text := 'Todas'; 
end;

procedure TFEstoqueParam.ME1SubclasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1SubClasse.Text) <> '' then
    Ed1SubClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me1SubClasse.Text)
  else
    Ed1SubClasse.Text := 'Todas';
end;

procedure TFEstoqueParam.SB1SubclasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME1SubClasse.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      Ed1SubClasse.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.Me1SubClassesExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1SubClasses.Text) <> '' then
    Ed1SubClasses.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(Me1NumClasseInicial.Text) + ' And NUM_SUBCLASSE='+Trim(Me1SubClasses.Text))
  else
    Ed1SubClasses.Text:='Todos';
end;

procedure TFEstoqueParam.ME1NumClasseInicialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1NumClasseInicial.Text) <> '' then
    Me1DescClasseInicial.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(Me1NumClasseInicial.Text) + ' And NUM_SUBCLASSE=0')
  else
    ME1DescClasseInicial.Text := 'Todos ';
end;

procedure TFEstoqueParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.text)<>'' then
     ME1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilial.text)
  else
     ME1Filial.Text:='Todos';
end;

procedure TFEstoqueParam.Me7CodLoteChange(Sender: TObject);
begin
  inherited;
  if Trim(Me7CodLote.text)<>'' then
      ME7Lote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+Me7CodLote.text)
  else
      ME7Lote.Text :='Todas';

end;

procedure TFEstoqueParam.Sb7LoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons=Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.Showmodal = MrOk then
    ME7CodLote.Text:=DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
  Me7CodLoteChange(self);
end;

procedure TFEstoqueParam.SB12ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME12Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Ed12Classe.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.ME12ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Classe.Text) <> '' then
    ED12Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(ME12Classe.Text))
  Else
    ED12Classe.Text:='Todos';

end;

procedure TFEstoqueParam.SB11ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME11Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Ed11Classe.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End; 
end;

procedure TFEstoqueParam.SB11SubclasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME11SubClasse.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      Ed11SubClasse.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;

end;

procedure TFEstoqueParam.ME11ClasseChange(Sender: TObject);
begin
  inherited;
  if Trim(Me11Classe.Text) <> '' then
    Ed11Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me11Classe.Text+' And NUM_SUBCLASSE=0');
end;

procedure TFEstoqueParam.Sb1FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=MrOk then
    Begin
      Me1CodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Ed1Nome.Text:=DMCadastro.QCadastroConsNome.Value;
    End;

end;

procedure TFEstoqueParam.Me1CodFornecedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1CodFornecedor.Text) <> '' then
    Ed1Nome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+trim(Me1CodFornecedor.Text))
  Else
    Ed1Nome.Text:='Todos';

end;

procedure TFEstoqueParam.FmClasse1BtClasseClick(Sender: TObject);
begin
  inherited;
  FmClasse1.BtClasseClick(Sender);

end;

procedure TFEstoqueParam.FormShow(Sender: TObject);
begin
  inherited;
  M1Classes.Lines.Clear;
  M2Classes.Lines.Clear;
end;

procedure TFEstoqueParam.SBClasseAddClick(Sender: TObject);
begin
  inherited;
  if ME1NumClasseInicial.Text <> '' then
  begin
    M1Classes.Lines.Add(ME1NumClasseInicial.Text);
    ME1NumClasseInicial.Text := '';
    Me1DescClasseInicial.Text := '';
  end;
end;

procedure TFEstoqueParam.Me2NumClasseInicialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me2NumClasseInicial.Text) <> '' then
    Me2DescClasseInicial.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(Me2NumClasseInicial.Text) + ' And NUM_SUBCLASSE=0')
  else
    ME2DescClasseInicial.Text := 'Todos ';
end;

procedure TFEstoqueParam.SB2ClasseInicialClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
     ME2NumClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
  ME2NumClasseInicialExit(Self);
end;

procedure TFEstoqueParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if ME2NumClasseInicial.Text <> '' then
  begin
    M2Classes.Lines.Add(ME2NumClasseInicial.Text);
    ME2NumClasseInicial.Text := '';
    Me2DescClasseInicial.Text := '';
  end;
end;

procedure TFEstoqueParam.Fm16FilialBtFilialClick(Sender: TObject);
begin
  inherited;
  Fm16Filial.BtFilialClick(Sender);

end;

procedure TFEstoqueParam.Fm16MarcaBtMarcaClick(Sender: TObject);
begin
  inherited;
  Fm16Marca.BtMarcaClick(Sender);

end;

procedure TFEstoqueParam.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me16Fornecedor.Text:= DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me16FornecedorExit(Self);
  End;
end;

procedure TFEstoqueParam.ME16FornecedorExit(Sender: TObject);
begin
  inherited;
   if Trim(Me16Fornecedor.Text) <> '' then
     Ed16Fornecedor.Text:=DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+Trim(Me16Fornecedor.Text))
  else
    Ed16Fornecedor.Text := 'Todos';
end;

procedure TFEstoqueParam.Me16ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16Classe.Text) <> '' then
    Ed16Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me16Classe.Text)
  else
    Ed16Classe.Text := 'Todas';
end;

procedure TFEstoqueParam.Me16SubClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16SubClasse.Text) <> '' then
    Ed16SubClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me16SubClasse.Text)
  else
    Ed16SubClasse.Text := 'Todas';
end;

procedure TFEstoqueParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME16Classe.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Ed16Classe.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;
end;

procedure TFEstoqueParam.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME16SubClasse.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      Ed16SubClasse.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;
end;

procedure TFEstoqueParam.FmClasse4BtClasseClick(Sender: TObject);
begin
  inherited;
  FmClasse4.BtClasseClick(Sender);

end;


end.


