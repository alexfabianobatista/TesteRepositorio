unit ULivroFiscalParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmProduto,
  UFmOperacao, UFmFilial, UFmDatas, UFmEstado, UFmSerie, FileCtrl,
  UFmCadastro;

type
  TFLivroFiscalParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label2: TLabel;
    Me0Operacao: TMaskEdit;
    Bt0Operacao: TBitBtn;
    Ed0Operacao: TEdit;
    TabSheet2: TTabSheet;
    Me1Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Filial: TEdit;
    Me1Operacao: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed1Operacao: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Me1DataI: TMaskEdit;
    Me1DataF: TMaskEdit;
    Rg1Opcao: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Me3Filial: TMaskEdit;
    Bt3ConsFilial: TBitBtn;
    Ed3Filial: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Me3DataI: TMaskEdit;
    Me3DataF: TMaskEdit;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    Me4Filial: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed4Filial: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Me4DataI: TMaskEdit;
    Me4DataF: TMaskEdit;
    TabSheet5: TTabSheet;
    Label15: TLabel;
    ME5Filial: TMaskEdit;
    Ed5Filial: TEdit;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    ME5DataI: TMaskEdit;
    ME5DataF: TMaskEdit;
    ME5Operacao: TMaskEdit;
    Label18: TLabel;
    Ed5Operacao: TEdit;
    tBtn5Filial: TBitBtn;
    BitBtn5: TBitBtn;
    Label19: TLabel;
    ME5Regiao: TMaskEdit;
    Btn5Regiao: TBitBtn;
    Ed5Regiao: TEdit;
    TabSheet6: TTabSheet;
    ME6Filial: TMaskEdit;
    Label20: TLabel;
    Btn6Filial: TBitBtn;
    Ed6Filial: TEdit;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME6DataI: TMaskEdit;
    ME6DataF: TMaskEdit;
    TabSheet7: TTabSheet;
    Label21: TLabel;
    ME7_Filial: TMaskEdit;
    BT7_Filial: TBitBtn;
    ED7_Filial: TEdit;
    GroupBox7: TGroupBox;
    Label22: TLabel;
    Label25: TLabel;
    ME7_DataI: TMaskEdit;
    ME7_DataF: TMaskEdit;
    Label26: TLabel;
    ME7_Cidade: TMaskEdit;
    ME7_Estado: TMaskEdit;
    Label27: TLabel;
    BT7_Estado: TBitBtn;
    ED7_Estado: TEdit;
    Me5Cadastro: TMaskEdit;
    Label28: TLabel;
    Bt5Cadastro: TBitBtn;
    Ed5Cadastro: TEdit;
    TabSheet8: TTabSheet;
    Label30: TLabel;
    MECodFilial8: TMaskEdit;
    BtnFilialCons8: TBitBtn;
    EdDescFilial8: TEdit;
    GroupBox8: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    MEDataI8: TMaskEdit;
    MEDataF8: TMaskEdit;
    Label33: TLabel;
    MEEstado8: TMaskEdit;
    EdEstadoDesc: TEdit;
    Label34: TLabel;
    Me4Cadastro: TMaskEdit;
    Bt4Cadastro: TBitBtn;
    Ed4Cadastro: TEdit;
    TabSheet9: TTabSheet;
    Label35: TLabel;
    ME9CodFilial: TMaskEdit;
    BitBtn15: TBitBtn;
    ED9DescFilial: TEdit;
    GroupBox9: TGroupBox;
    Label36: TLabel;
    ME9Mes: TMaskEdit;
    ME9Ano: TMaskEdit;
    Label37: TLabel;
    RGTipoArquivo: TRadioGroup;
    Rg3TipoArquivo: TRadioGroup;
    Rg3TipoNota: TRadioGroup;
    Rg0Ordem: TRadioGroup;
    TabSheet10: TTabSheet;
    Label38: TLabel;
    ME9Filial: TMaskEdit;
    Bt9Filial: TBitBtn;
    Ed9Filial: TEdit;
    Gb9DataRef: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Me9DataI: TMaskEdit;
    Me9DataF: TMaskEdit;
    ME9Cidade: TMaskEdit;
    Label41: TLabel;
    Bt9Cidade: TBitBtn;
    Ed9Cidade: TEdit;
    Rg7TipoOperacao: TRadioGroup;
    Rg0Tipo: TRadioGroup;
    TabSheet11: TTabSheet;
    ME10Filial: TMaskEdit;
    ME10Operacao: TMaskEdit;
    SB10Filial: TSpeedButton;
    SB10Operacao: TSpeedButton;
    Ed10Filial: TEdit;
    Ed10Operacao: TEdit;
    Label29: TLabel;
    Label42: TLabel;
    GroupBox10: TGroupBox;
    ME10DtInicial: TMaskEdit;
    ME10DtFinal: TMaskEdit;
    Label43: TLabel;
    Label44: TLabel;
    RG10Tipo: TRadioGroup;
    Label45: TLabel;
    Me7Operacao1: TMaskEdit;
    BitBtn4: TBitBtn;
    Me7Operacao2: TMaskEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Me7Operacao3: TMaskEdit;
    Me7Operacao4: TMaskEdit;
    BitBtn8: TBitBtn;
    Me7Operacao7: TMaskEdit;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    Me7Operacao6: TMaskEdit;
    Me7Operacao5: TMaskEdit;
    BitBtn9: TBitBtn;
    Me7Operacao8: TMaskEdit;
    BitBtn12: TBitBtn;
    ME7Operacao9: TMaskEdit;
    Me7Operacao10: TMaskEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label46: TLabel;
    Me3Estado: TMaskEdit;
    Bt3Estado: TBitBtn;
    Ed3Estado: TEdit;
    Rg8TipoNota: TRadioGroup;
    Bt8Estado: TBitBtn;
    Label47: TLabel;
    Me4Operacao: TMaskEdit;
    Bt4Operacao: TBitBtn;
    Ed4Operacao: TEdit;
    RG6EntradaSaida: TRadioGroup;
    TabSheet12: TTabSheet;
    Label48: TLabel;
    Me11Filial: TMaskEdit;
    Ed11Filial: TEdit;
    Sb11Filial: TSpeedButton;
    GroupBox11: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Me11DtInicial: TMaskEdit;
    Me11DtFinal: TMaskEdit;
    TabSheet13: TTabSheet;
    Label51: TLabel;
    Label52: TLabel;
    Me12Filial: TMaskEdit;
    Bt12Filial: TBitBtn;
    Ed12Filial: TEdit;
    GroupBox12: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Me12DtInicial: TMaskEdit;
    Me12DtFinal: TMaskEdit;
    Rg12Arquivo: TRadioGroup;
    Rg12TipoNota: TRadioGroup;
    Me12Estado: TMaskEdit;
    Bt12Estado: TBitBtn;
    Ed12Estado: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    Rg3Convenio: TRadioGroup;
    Label57: TLabel;
    SB0Departamento: TSpeedButton;
    ME0Departamento: TMaskEdit;
    Ed0Departamento: TEdit;
    TabSheet14: TTabSheet;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Me13Filial: TMaskEdit;
    Bt13Filial: TBitBtn;
    Ed13Filial: TEdit;
    GroupBox13: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Me13DataI: TMaskEdit;
    Me13DataF: TMaskEdit;
    Me13Cadastro: TMaskEdit;
    Bt13Cadastro: TBitBtn;
    Ed13Cadastro: TEdit;
    Me13Operacao: TMaskEdit;
    Bt13Operacao: TBitBtn;
    Ed13Operacao: TEdit;
    Label63: TLabel;
    Me13NumClasse: TMaskEdit;
    Bt13NumClasse: TBitBtn;
    Ed13Classe: TEdit;
    Label64: TLabel;
    Me13SubClasse: TMaskEdit;
    TabSheet15: TTabSheet;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Me14Filial: TMaskEdit;
    Bt14Filial: TBitBtn;
    Ed14Filial: TEdit;
    GroupBox14: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Me14DataI: TMaskEdit;
    Me14DataF: TMaskEdit;
    Me14Cadastro: TMaskEdit;
    Bt14Cadastro: TBitBtn;
    Ed14Cadastro: TEdit;
    Me14Operacao: TMaskEdit;
    Bt14Operacao: TBitBtn;
    Ed14Operacao: TEdit;
    Me14NumClasse: TMaskEdit;
    Bt14NumClasse: TBitBtn;
    Ed14Classe: TEdit;
    Me14SubClasse: TMaskEdit;
    TabSheet16: TTabSheet;
    Label72: TLabel;
    ME15Filial: TMaskEdit;
    Ed15Filial: TEdit;
    GroupBox15: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    ME15Dt_Inicial: TMaskEdit;
    Me15Dt_Final: TMaskEdit;
    Label75: TLabel;
    Label76: TLabel;
    SB15Filial: TSpeedButton;
    SB15Estado: TSpeedButton;
    ME15Estado: TMaskEdit;
    Ed15Estado: TEdit;
    Rg13Tipo: TRadioGroup;
    TabSheet17: TTabSheet;
    GB16Perido: TGroupBox;
    ME16DtInicial: TMaskEdit;
    ME16DtFinal: TMaskEdit;
    Label77: TLabel;
    Label78: TLabel;
    TabSheet18: TTabSheet;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Ed17Filial: TEdit;
    Bt17ConsFilial: TBitBtn;
    ME17Filial: TMaskEdit;
    GroupBox16: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    ME17DataI: TMaskEdit;
    ME17DataF: TMaskEdit;
    ME17NatOperacao: TMaskEdit;
    ME17PaginaI: TMaskEdit;
    TabSheet19: TTabSheet;
    SDlgAMagnetico: TSaveDialog;
    TabSheet20: TTabSheet;
    GroupBox18: TGroupBox;
    Label87: TLabel;
    Label88: TLabel;
    Me19DataI: TMaskEdit;
    Me19DataF: TMaskEdit;
    FmFilial19: TFmFilial;
    FmOperacao19: TFmOperacao;
    FmProduto19: TFmProduto;
    ME19CFOP: TMaskEdit;
    Label89: TLabel;
    TabSheet21: TTabSheet;
    PgArquivoSc: TPageControl;
    TabSheet22: TTabSheet;
    TabSheet23: TTabSheet;
    Rg20TipoDeclaracao: TRadioGroup;
    Rg20Centralizada: TRadioGroup;
    Rg20Creditos: TRadioGroup;
    Rg20Porte: TRadioGroup;
    Rg20Transferencia: TRadioGroup;
    Rg20RegimeApuracao: TRadioGroup;
    Rg20Escrita: TRadioGroup;
    Rg20Incentivos: TRadioGroup;
    Rg20SubstitutoTributario: TRadioGroup;
    Rg20Consolidada: TRadioGroup;
    Rg20Movimento: TRadioGroup;
    Label90: TLabel;
    Me20Contador: TMaskEdit;
    Label91: TLabel;
    Me20CpfContador: TMaskEdit;
    Fm20Filial: TFmFilial;
    GroupBox19: TGroupBox;
    Label92: TLabel;
    Label93: TLabel;
    Me20DtInicial: TMaskEdit;
    Me20DtFinal: TMaskEdit;
    Label94: TLabel;
    Me20QtTrabalhadores: TMaskEdit;
    RgArquivoSaida: TRadioGroup;
    TabSheet24: TTabSheet;
    FmFilial25: TFmFilial;
    FmOperacao25: TFmOperacao;
    FmDatas25: TFmDatas;
    GbPesoMinimo: TGroupBox;
    MePesoMinimo25: TMaskEdit;
    LblKg: TLabel;
    GbClasses: TGroupBox;
    MeClasses25: TMaskEdit;
    Label95: TLabel;
    SbBuscaClasse: TSpeedButton;
    FmProduto25: TFmProduto;
    FmEstado25: TFmEstado;
    TabSheet25: TTabSheet;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    FmFilial22: TFmFilial;
    MeMes: TMaskEdit;
    MeAno: TMaskEdit;
    Rg22Decendio: TRadioGroup;
    Me22Pagina: TMaskEdit;
    TabSheet26: TTabSheet;
    FmFilial23: TFmFilial;
    FmDatas23: TFmDatas;
    TabSheet27: TTabSheet;
    FmDatas24: TFmDatas;
    FmFilial24: TFmFilial;
    Label86: TLabel;
    Label84: TLabel;
    GroupBox17: TGroupBox;
    Label85: TLabel;
    Label99: TLabel;
    ME18DtInicial: TMaskEdit;
    ME18DtFinal: TMaskEdit;
    ME18Filial: TMaskEdit;
    SB18Filial: TBitBtn;
    Ed18Filial: TEdit;
    Dlb18Diretorio: TDirectoryListBox;
    RG18Nota: TRadioGroup;
    FmFilial16: TFmFilial;
    TabSheet28: TTabSheet;
    FmDatas26: TFmDatas;
    Rg3Objetivo: TRadioGroup;
    TabSheet29: TTabSheet;
    Fm27Filial: TFmFilial;
    Fm27Datas: TFmDatas;
    Fm27Estado: TFmEstado;
    Label100: TLabel;
    Me27Credito: TMaskEdit;
    Label101: TLabel;
    Me27Operacao: TMaskEdit;
    Bt27Operacao: TBitBtn;
    Rg3GerarIpi: TRadioGroup;
    Rg3Inventario: TRadioGroup;
    TabSheet30: TTabSheet;
    Fm28Filial: TFmFilial;
    Fm28Datas: TFmDatas;
    Rg3CupomFiscal: TRadioGroup;
    Fm27EstadoNaoListar: TFmEstado;
    Rg3Substituto: TRadioGroup;
    TabSheet31: TTabSheet;
    FmFilial28: TFmFilial;
    FmCadastro28: TFmCadastro;
    FmDatas28: TFmDatas;
    TabSheet32: TTabSheet;
    Fm29Filial: TFmFilial;
    Fm29Estado: TFmEstado;
    Fm29Datas: TFmDatas;
    Rg29Tipo: TRadioGroup;
    GroupBox20: TGroupBox;
    Label102: TLabel;
    Me29Csosn101: TMaskEdit;
    Label103: TLabel;
    Me29Csosn102: TMaskEdit;
    Me29Csosn103: TMaskEdit;
    Label104: TLabel;
    Label105: TLabel;
    Me29Csosn201: TMaskEdit;
    Label106: TLabel;
    Me29Csosn202: TMaskEdit;
    Label107: TLabel;
    Me29Csosn203: TMaskEdit;
    Label108: TLabel;
    Me29Csosn300: TMaskEdit;
    Label109: TLabel;
    Me29Csosn400: TMaskEdit;
    Label110: TLabel;
    Me29Csosn500: TMaskEdit;
    Label111: TLabel;
    Me29Csosn900: TMaskEdit;
    ME3MesAno: TMaskEdit;
    TabSheet33: TTabSheet;
    Fm33Filial: TFmFilial;
    Fm33Datas: TFmDatas;
    Rg33TipoNota: TRadioGroup;
    FmOperacao1: TFmOperacao;
    TabSheet34: TTabSheet;
    Label112: TLabel;
    Label113: TLabel;
    Bt33Filial: TBitBtn;
    Me34Filial: TMaskEdit;
    GroupBox21: TGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    Me34DtInicial: TMaskEdit;
    Me34DtFinal: TMaskEdit;
    Me34NatOperacao: TMaskEdit;
    Ed34Filial: TEdit;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Me0OperacaoExit(Sender: TObject);
    procedure Bt0OperacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Me1OperacaoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me3FilialExit(Sender: TObject);
    procedure Bt3ConsFilialClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Me4FilialExit(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure ME5OperacaoExit(Sender: TObject);
    procedure Btn5Operacao(Sender: TObject);
    procedure tBtn5FilialClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ME5RegiaoExit(Sender: TObject);
    procedure Btn5RegiaoClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure Btn6FilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ME7_FilialExit(Sender: TObject);
    procedure BT7_FilialClick(Sender: TObject);
    procedure ME7_EstadoExit(Sender: TObject);
    procedure BT7_EstadoClick(Sender: TObject);
    procedure Me5CadastroExit(Sender: TObject);
    procedure Bt5CadastroClick(Sender: TObject);
    procedure MECodFilial8Exit(Sender: TObject);
    procedure BtnFilialCons8Click(Sender: TObject);
    procedure MEEstado8Exit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Me4CadastroExit(Sender: TObject);
    procedure Bt4CadastroClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure ME9CodFilialExit(Sender: TObject);
    procedure Bt9FilialClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure Bt9CidadeClick(Sender: TObject);
    procedure ME9CidadeExit(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure ME10FilialChange(Sender: TObject);
    procedure ME10OperacaoChange(Sender: TObject);
    procedure SB10OperacaoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Me3EstadoExit(Sender: TObject);
    procedure Bt3EstadoClick(Sender: TObject);
    procedure Bt8EstadoClick(Sender: TObject);
    procedure Me4OperacaoExit(Sender: TObject);
    procedure Bt4OperacaoClick(Sender: TObject);
    procedure Me11FilialChange(Sender: TObject);
    procedure Sb11FilialClick(Sender: TObject);
    procedure Me12FilialExit(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure Me12EstadoExit(Sender: TObject);
    procedure Bt12EstadoClick(Sender: TObject);
    procedure SB0DepartamentoClick(Sender: TObject);
    procedure ME0DepartamentoExit(Sender: TObject);
    procedure Me13FilialExit(Sender: TObject);
    procedure Bt13FilialClick(Sender: TObject);
    procedure Me13CadastroExit(Sender: TObject);
    procedure Bt13CadastroClick(Sender: TObject);
    procedure Me13OperacaoExit(Sender: TObject);
    procedure Bt13OperacaoClick(Sender: TObject);
    procedure Me13NumClasseExit(Sender: TObject);
    procedure Bt13NumClasseClick(Sender: TObject);
    procedure Me13SubClasseExit(Sender: TObject);
    procedure Me14FilialExit(Sender: TObject);
    procedure Bt14FilialClick(Sender: TObject);
    procedure Me14CadastroExit(Sender: TObject);
    procedure Bt14CadastroClick(Sender: TObject);
    procedure Me14OperacaoExit(Sender: TObject);
    procedure Bt14OperacaoClick(Sender: TObject);
    procedure Me14NumClasseExit(Sender: TObject);
    procedure Bt14NumClasseClick(Sender: TObject);
    procedure SB15FilialClick(Sender: TObject);
    procedure ME15FilialExit(Sender: TObject);
    procedure SB15EstadoClick(Sender: TObject);
    procedure ME15EstadoExit(Sender: TObject);
    procedure ME17FilialExit(Sender: TObject);
    procedure Bt17ConsFilialClick(Sender: TObject);
    procedure SbBuscaClasseClick(Sender: TObject);
    procedure TabSheet24Show(Sender: TObject);
    procedure SB18FilialClick(Sender: TObject);
    procedure ME18FilialExit(Sender: TObject);
    procedure Bt27OperacaoClick(Sender: TObject);
    procedure Fm27FilialBtFilialClick(Sender: TObject);
    procedure Rg3InventarioClick(Sender: TObject);
    procedure Me3DataIExit(Sender: TObject);
    procedure FmOperacao25BtOperacaoClick(Sender: TObject);
    procedure FmOperacao1BtOperacaoClick(Sender: TObject);
    procedure Bt33FilialClick(Sender: TObject);
    procedure Me34FilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivroFiscalParam: TFLivroFiscalParam;

implementation

uses UFilial_cl, UFilialCons, UOperacao_cl, UOperacaoCons, UOracle_cl,
  URegiao_cl, URegiaoCons, UUsuario_cl, UEstado_cl, UEstadoCons,
  UCadastro_cl, UCadastroCons, UCidadeCons, UCidade_cl, UDepartamentoCons,
  UDepartamento_cl, UClasseCons, UClasse_cl;

{$R *.DFM}

procedure TFLivroFiscalParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME0Filial.Text))
  Else
    Ed0Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFLivroFiscalParam.Me0OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Operacao.Text) <> '' Then
    Ed0Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME0Operacao.Text))
  Else
    Ed0Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt0OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME0Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME0OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.BitBtn1Click(Sender: TObject);
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

procedure TFLivroFiscalParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME1Filial.Text))
  Else
    Ed1Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Me1OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Operacao.Text) <> '' Then
    Ed1Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME1Operacao.Text))
  Else
    Ed1Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME1Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME1OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' Then
    Ed3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME3Filial.Text))
  Else
    Ed3Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt3ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME3FilialExit(Self);
  End;
end;

procedure TFLivroFiscalParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME4FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Filial.Text) <> '' Then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME4Filial.Text))
  Else
    Ed4Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Filial.Text) <> '' Then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME5Filial.Text))
  else
    Ed5Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.ME5OperacaoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Operacao.Text) <> '' Then
    Ed5Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME5Operacao.Text))
  else
    Ed5Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Btn5Operacao(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME5Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME5OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.tBtn5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME5FilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME5Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME5OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.ME5RegiaoExit(Sender: TObject);

begin
  inherited;
  if Trim(ME5Regiao.Text) <> '' Then
  with DMRegiao do
  begin
    QRegiao.Close;
    QRegiao.SetVariable('PK',ME5Filial.Text);
    QRegiao.Open;
    Ed5Regiao.Text := QRegiaoDesc_Regiao.Value;
  end
  else
    Ed5Regiao.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Btn5RegiaoClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = Nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
  begin
    ME5Regiao.Text := DMRegiao.QRegiaoConsCod_Regiao.Text;
    ME5RegiaoExit(Self);
  end;

end;

procedure TFLivroFiscalParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6Filial.Text) <> '' Then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME6Filial.Text))
  else
    Ed6Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Btn6FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME6FilialExit(Self);
  end;

end;

procedure TFLivroFiscalParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me3Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me4Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7_Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MECodFilial8.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me0FilialExit(Self);
  Me1FilialExit(Self);
  Me3FilialExit(Self);
  Me4FilialExit(Self);
  ME5FilialExit(Self);
  ME6FilialExit(Self);
  ME7_FilialExit(Self);
  MECodFilial8Exit(Self);
end;

procedure TFLivroFiscalParam.ME7_FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7_Filial.Text) <> '' Then
    ED7_Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME7_Filial.Text))
  else
    ED7_Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BT7_FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME7_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME7_FilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.ME7_EstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7_Estado.Text) <> '' Then
  with DMEstado do
  begin
    QEstado.Close;
    QEstado.SetVariable('COD_ESTADO',FLivroFiscalParam.ME7_Estado.Text);
    QEstado.Open;
    ED7_Estado.Text := QEstadoDesc_Estado.Text
  end
  else
    ED7_Estado.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BT7_EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    ME7_Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    ED7_Estado.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end;
end;

procedure TFLivroFiscalParam.Me5CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Cadastro.Text) <> '' Then
     Ed5Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME5Cadastro.Text);

  if Ed5Cadastro.Text = '' then
     Ed5Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt5CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME5CadastroExit(Self);
  end;

end;

procedure TFLivroFiscalParam.MECodFilial8Exit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial8.Text) <> '' Then
    EdDescFilial8.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(MECodFilial8.Text))
  else
    EdDescFilial8.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BtnFilialCons8Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    MECodFilial8.Text := DMFilial.QFilialConsCod_Filial.Text;
    MECodFilial8Exit(Self);
  end;
end;

procedure TFLivroFiscalParam.MEEstado8Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEEstado8.Text) <> '' then
     EdEstadoDesc.Text:= DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+MEEstado8.Text+CHR(39))
  else
     EdEstadoDesc.Text := 'Todos';
end;

procedure TFLivroFiscalParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  FLivroFiscalParam.helpcontext:=12;
end;

procedure TFLivroFiscalParam.Me4CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Cadastro.Text) <> '' Then
     Ed4Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4Cadastro.Text)
  else
     Ed4Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt4CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me4Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me4CadastroExit(Self);
  end;
end;

procedure TFLivroFiscalParam.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME9CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9CodFilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.ME9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.Text) <> '' Then
    Ed9DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME9CodFilial.Text))
  else
    Ed9DescFilial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt9FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9FilialExit(Self);
  End;
end;

procedure TFLivroFiscalParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Filial.Text) <> '' Then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME9Filial.Text))
  Else
    Ed9Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt9CidadeClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
     FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
  Begin
    ME9Cidade.Text := DMCidade.QCidadeConsCod_Cidade.Text;
    ME9CidadeExit(Self);
  End;

end;

procedure TFLivroFiscalParam.ME9CidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Cidade.Text) <> '' Then
    Ed9Cidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE = ' + Trim(ME9Cidade.Text))
  Else
    Ed9Cidade.Text := 'Todos';
end;

procedure TFLivroFiscalParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME10Filialchange(Self);
  End;
end;

procedure TFLivroFiscalParam.ME10FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME10Filial.Text) <> '' Then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME10Filial.Text))
  Else
    Ed10Filial.Text := 'Todas';
end;

procedure TFLivroFiscalParam.ME10OperacaoChange(Sender: TObject);
begin
  inherited;
   If Trim(ME10Operacao.Text) <> '' Then
    Ed10Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME10Operacao.Text))
  Else
    Ed10Operacao.Text := 'Todas';
end;

procedure TFLivroFiscalParam.SB10OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME10Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME10Operacaochange(Self);
end;
end;
procedure TFLivroFiscalParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao2.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao3.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao4.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao5.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao6.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao7.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao8.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao9.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.BitBtn14Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME7Operacao10.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFLivroFiscalParam.Me3EstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3Estado.Text) <> '' Then
    Ed3Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + Chr(39) + Trim(Me3Estado.Text) + Chr(39))
  else
    Ed3Estado.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt3EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    Me3Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    Ed3Estado.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end;

end;

procedure TFLivroFiscalParam.Bt8EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    MEEstado8.Text := DMEstado.QEstadoConsCod_Estado.Text;
    EDEstadoDesc.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end;

end;

procedure TFLivroFiscalParam.Me4OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Operacao.Text) <> '' Then
    Ed4Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME4Operacao.Text))
  Else
    Ed4Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt4OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME4Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME4OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me11FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME11Filial.Text) <> '' Then
    Ed11Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME11Filial.Text))
  Else
    Ed11Filial.Text := 'Todas';

end;

procedure TFLivroFiscalParam.Sb11FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME11Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME11Filialchange(Self);
  End;

end;

procedure TFLivroFiscalParam.Me12FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me12Filial.Text) <> '' Then
    Ed12Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me12Filial.Text))
  Else
    Ed12Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me12Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me12FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me12EstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me12Estado.Text) <> '' Then
    Ed12Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + Chr(39) + Trim(Me12Estado.Text) + Chr(39))
  else
    Ed12Estado.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt12EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    Me12Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    Ed12Estado.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end;

end;

procedure TFLivroFiscalParam.SB0DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    ME0Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME0DepartamentoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.ME0DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Departamento.Text) <> '' Then
    Ed0Departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO = ' + Trim(ME0Departamento.Text))
  Else
    Ed0Departamento.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Me13FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me13Filial.Text) <> '' Then
    Ed13Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME13Filial.Text))
  Else
    Ed13Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt13FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME13Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME13FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me13CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13Cadastro.Text) <> '' Then
     Ed13Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me13Cadastro.Text)
  else
     Ed13Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt13CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me13Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me13CadastroExit(Self);
  end;

end;

procedure TFLivroFiscalParam.Me13OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13Operacao.Text) <> '' Then
    Ed13Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(ME13Operacao.Text))
  Else
    Ed13Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt13OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME13Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME13OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me13NumClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13NumClasse.Text) = '' Then
  Begin
    Ed13Classe.Text := 'Todos';
    ME13SubClasse.Text := '';
  End
  Else
    If Trim(ME13SubClasse.Text) = '' then
    Begin
      Ed13Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13NumClasse.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME13SubClasse.Text := '0';
    End
    Else
      Ed13Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13NumClasse.Text+
                                           'AND NUM_SUBCLASSE = '+ME13SubClasse.Text);

end;

procedure TFLivroFiscalParam.Bt13NumClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME13NumClasse.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME13SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME13NumClasseExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me13SubClasseExit(Sender: TObject);
begin
  inherited;
  Me13NumClasseExit(Self);
end;

procedure TFLivroFiscalParam.Me14FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14Filial.Text) <> '' Then
    Ed14Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me14Filial.Text))
  Else
    Ed14Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt14FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME14Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME14FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me14CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14Cadastro.Text) <> '' Then
     Ed14Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me14Cadastro.Text)
  else
     Ed14Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt14CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me14Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me14CadastroExit(Self);
  end;

end;

procedure TFLivroFiscalParam.Me14OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14Operacao.Text) <> '' Then
    Ed14Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO', 'COD_OPERACAO = ' + Trim(Me14Operacao.Text))
  Else
    Ed14Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt14OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    Me14Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Me14OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me14NumClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14NumClasse.Text) = '' Then
  Begin
    Ed14Classe.Text := 'Todos';
    ME14SubClasse.Text := '';
  End
  Else
    If Trim(ME14SubClasse.Text) = '' then
    Begin
      Ed14Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14NumClasse.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME14SubClasse.Text := '0';
    End
    Else
      Ed14Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14NumClasse.Text+
                                           'AND NUM_SUBCLASSE = '+ME14SubClasse.Text);

end;

procedure TFLivroFiscalParam.Bt14NumClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME14NumClasse.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME14SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME14NumClasseExit(Self);
  End;

end;

procedure TFLivroFiscalParam.SB15FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me15Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me15FilialExit(Self);
end;

procedure TFLivroFiscalParam.ME15FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me15Filial.Text) <> '' Then
    Ed15Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me15Filial.Text))
  Else
    Ed15Filial.Text := 'Todas';
end;

procedure TFLivroFiscalParam.SB15EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    Me15Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    Ed15Estado.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end; 
end;

procedure TFLivroFiscalParam.ME15EstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me15Estado.Text) <> '' Then
    Ed15Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + Chr(39) + Trim(Me15Estado.Text) + Chr(39))
  else
    Ed15Estado.Text := 'Todos'; 
end;

procedure TFLivroFiscalParam.ME17FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME17Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME17Filial.Text);
    QFilial.Open;
    Ed17Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed17Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt17ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME17Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME17FilialExit(Self);
  End;
end;

procedure TFLivroFiscalParam.SbBuscaClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    If Trim(MeClasses25.Text) = '' Then
       MeClasses25.Text := DMClasse.QClasseConsCOD_CLASSE.Text
    Else
       MeClasses25.Text := MeClasses25.Text + ',' + DMClasse.QClasseConsCOD_CLASSE.Text;
  end;
end;

procedure TFLivroFiscalParam.TabSheet24Show(Sender: TObject);
begin
  inherited;
  FmDatas25.MeDtInicial.Text := DateToStr(Date - 30);
  FmDatas25.MeDtFinal.Text   := DateToStr(Date);
  MeClasses25.Text           := '2,3,4,10,13,50';
end;

procedure TFLivroFiscalParam.SB18FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME18Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME18FilialExit(Self);
  End;
end;

procedure TFLivroFiscalParam.ME18FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME18Filial.Text);
    QFilial.Open;
    Ed18Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed18Filial.Text := 'Todos'; 
end;

procedure TFLivroFiscalParam.Bt27OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
     If Trim(Me27Operacao.Text) = '' Then
        Me27Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text
     Else
        Me27Operacao.Text := Me27Operacao.Text + ',' + DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFLivroFiscalParam.Fm27FilialBtFilialClick(Sender: TObject);
begin
  inherited;
  Fm27Filial.BtFilialClick(Sender);

end;

procedure TFLivroFiscalParam.Rg3InventarioClick(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  ME3MesAno.Enabled := (Rg3Inventario.ItemIndex = 0);
  case Rg3Inventario.ItemIndex of
  0 : (ME3MesAno.Color := clWindow);
  1 : (ME3MesAno.Color := clBtnFace);
  end;
  if (Rg3Inventario.ItemIndex = 0) and (Trim(ME3MesAno.Text) = '') then
  begin
    decodeDate(DMOracle.DataServ, wAno, wMes, wDia);
    ME3MesAno.Text := formatFloat('00',wMes) + IntToStr(wAno); 
  end;
end;

procedure TFLivroFiscalParam.Me3DataIExit(Sender: TObject);
var
  wDia, wMes, wAno: word;
begin
  inherited;
  if (trim(Me3DataI.Text) <> '') then
  begin
    decodeDate(StrToDate(trim(Me3DataI.Text)), wAno, wMes, wDia);
    ME3MesAno.Text := formatFloat('00', wMes) + IntToStr(wAno);
  end;
end;

procedure TFLivroFiscalParam.FmOperacao25BtOperacaoClick(Sender: TObject);
begin
  inherited;
  FmOperacao25.BtOperacaoClick(Sender);

end;

procedure TFLivroFiscalParam.FmOperacao1BtOperacaoClick(Sender: TObject);
begin
  inherited;
  FmOperacao1.BtOperacaoClick(Sender);

end;

procedure TFLivroFiscalParam.Bt33FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me34Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me34FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me34FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me34Filial.Text) <> '' Then
    Ed34Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me34Filial.Text))
  Else
    Ed34Filial.Text := 'Todos';

end;

end.
