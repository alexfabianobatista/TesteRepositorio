unit UNotaEntradaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, DBCtrls,
  UFmFilial, UFmCadastro, UFmVendedor, UFmOperacao, UFmDepartamento,
  UFmMotivo, UFmTributacao, UFmEstado, UFmProduto, UFmLote, UFmClasse,
  UFmSerie, UFmCidade, UFmDatas, UFmFinalidade, UFmObra, UFmTipoCadastro,
  UFmClassificacao, UFmRamo, UFmMarca;

type
  TFNotaEntradaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label32: TLabel;
    CB0Ordem: TComboBox;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    CB2TipoFutura: TComboBox;
    Label11: TLabel;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME3DataI: TMaskEdit;
    ME3DataF: TMaskEdit;
    Label16: TLabel;
    CB3Ordem: TComboBox;
    TabSheet5: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    ME4Cadastro: TMaskEdit;
    Bt4Cadastro: TBitBtn;
    ME4Produto: TMaskEdit;
    Bt4ConsProduto: TBitBtn;
    ME4Lote: TMaskEdit;
    Bt4ConsLote: TBitBtn;
    ME4Filial: TMaskEdit;
    Bt4ConsFilial: TBitBtn;
    Ed4Filial: TEdit;
    Ed4Cadastro: TEdit;
    Ed4Produto: TEdit;
    Ed4Lote: TEdit;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    RG0TipoNota: TRadioGroup;
    TabSheet6: TTabSheet;
    ME5CodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME5Filial: TMaskEdit;
    GroupBox6: TGroupBox;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    RG3Tipo: TRadioGroup;
    TabSheet7: TTabSheet;
    Label36: TLabel;
    ME6Filial: TMaskEdit;
    Bt6ConsFilial: TBitBtn;
    Ed6Filial: TEdit;
    ME6Cadastro: TMaskEdit;
    Label37: TLabel;
    Bt6ConsCadastro: TBitBtn;
    Ed6Cadastro: TEdit;
    Label38: TLabel;
    ME6Produto: TMaskEdit;
    Bt6ConsProduto: TBitBtn;
    Ed6Produto: TEdit;
    GroupBox7: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    ME6DtInicial: TMaskEdit;
    ME6DtFinal: TMaskEdit;
    RG6TipoFixacao: TRadioGroup;
    TabSheet8: TTabSheet;
    Label39: TLabel;
    ME7_Filial: TMaskEdit;
    BT7_Filial: TBitBtn;
    ED7_Filial: TEdit;
    Label42: TLabel;
    ME7_Produto: TMaskEdit;
    BT7_Produto: TBitBtn;
    ED7_Produto: TEdit;
    GroupBox8: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    ME7_DataI: TMaskEdit;
    ME7_DataF: TMaskEdit;
    TabSheet9: TTabSheet;
    Label45: TLabel;
    ME8_Filial: TMaskEdit;
    BT8_Filial: TBitBtn;
    ED8_Filial: TEdit;
    Label46: TLabel;
    ME8_Produto: TMaskEdit;
    BT8_Produto: TBitBtn;
    ED8_Produto: TEdit;
    GroupBox9: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    ME8_DataI: TMaskEdit;
    ME8_DataF: TMaskEdit;
    TabSheet10: TTabSheet;
    Label49: TLabel;
    Me9CodFilial: TMaskEdit;
    Bt9Filial: TBitBtn;
    Ed9DescFilial: TEdit;
    GroupBox10: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    Me9DtInicial: TMaskEdit;
    Me9DtFinal: TMaskEdit;
    Label52: TLabel;
    Me9Cadastro: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed9Cadastro: TEdit;
    Me7Cadastro: TMaskEdit;
    Label54: TLabel;
    Bt7ConsCadastro: TBitBtn;
    Ed7Cadastro: TEdit;
    Label55: TLabel;
    Me8Cadastro: TMaskEdit;
    Bt8ConsCadastro: TBitBtn;
    Ed8Cadastro: TEdit;
    Rg3TipoProduto: TRadioGroup;
    Label56: TLabel;
    Me7CadastroParceiro: TMaskEdit;
    Bt7CadastroParceiro: TBitBtn;
    Label57: TLabel;
    Me8CadastroParceiro: TMaskEdit;
    Bt8CadastroParceiro: TBitBtn;
    Rg7Situacao: TRadioGroup;
    Rg7BaixaContratos: TRadioGroup;
    Rg8BaixaContratos: TRadioGroup;
    TabSheet11: TTabSheet;
    Label61: TLabel;
    ME10Filial: TMaskEdit;
    ED10Filial: TEdit;
    BT10Filial: TBitBtn;
    Label62: TLabel;
    ME10Produto: TMaskEdit;
    BT10Produto: TBitBtn;
    GroupBox11: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    ME10DtInicial: TMaskEdit;
    ME10DtFinal: TMaskEdit;
    Cb10TipoProduto: TComboBox;
    Label65: TLabel;
    Rg10Saldo: TRadioGroup;
    TabSheet12: TTabSheet;
    Label68: TLabel;
    ME11Nota: TMaskEdit;
    Label69: TLabel;
    ME11Filial: TMaskEdit;
    Label70: TLabel;
    ME11Fornecedor: TMaskEdit;
    BT11Nota: TSpeedButton;
    BT11Filial: TSpeedButton;
    BT11Fornecedor: TSpeedButton;
    Ed11Filial: TEdit;
    Ed11Fornecedor: TEdit;
    GroupBox12: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    ME11DtInicio: TMaskEdit;
    ME11DtFim: TMaskEdit;
    TabSheet13: TTabSheet;
    Label73: TLabel;
    ME12Filial: TMaskEdit;
    Bt12Filial: TBitBtn;
    Ed12Filial: TEdit;
    Label74: TLabel;
    ME12Cadastro: TMaskEdit;
    Bt12Cadastro: TBitBtn;
    Ed12Cadastro: TEdit;
    Label75: TLabel;
    ME12Classe: TMaskEdit;
    SB12Classe: TSpeedButton;
    Ed12Classe: TEdit;
    Label76: TLabel;
    ME12Produto: TMaskEdit;
    Bt12Produto: TBitBtn;
    Ed12Produto: TEdit;
    Label77: TLabel;
    ME12Lote: TMaskEdit;
    Bt12Lote: TBitBtn;
    Ed12Lote: TEdit;
    Label78: TLabel;
    ME12Operacao: TMaskEdit;
    Bt12Operacao: TBitBtn;
    Ed12Operacao: TEdit;
    Label79: TLabel;
    ME12Vendedor: TMaskEdit;
    Bt12Vendedor: TBitBtn;
    Ed12Vendedor: TEdit;
    Label80: TLabel;
    CB12Ordem: TComboBox;
    RG12TipoProduto: TRadioGroup;
    GB12Data: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    ME12DtInicial: TMaskEdit;
    ME12DtFinal: TMaskEdit;


    

    TabSheet14: TTabSheet;
    Label84: TLabel;
    ME13Filial: TMaskEdit;
    BTFilialCons: TBitBtn;
    ED13Filial: TEdit;
    Label85: TLabel;
    ME13Operacao: TMaskEdit;
    BTOperacaoCons: TBitBtn;
    ED13Operacao: TEdit;
    GroupBox13: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    ME13Data_I: TMaskEdit;
    ME13Data_F: TMaskEdit;
    Label88: TLabel;
    ME13Vendedor: TMaskEdit;
    BTVendedorCons: TBitBtn;
    ED13Vendedor: TEdit;
    Cb4Ordem: TComboBox;
    Label92: TLabel;
    SB3Serie: TSpeedButton;
    ME3Serie: TMaskEdit;
    Label93: TLabel;
    CB9TXT: TCheckBox;
    ME2SubClasse: TMaskEdit;
    SB2SubClasse: TSpeedButton;
    Ed2SubClasse: TEdit;
    Label95: TLabel;
    RG1TipoNota: TRadioGroup;
    TabSheet15: TTabSheet;
    Label99: TLabel;
    ME14Filial: TMaskEdit;
    BT14Filial: TBitBtn;
    ED14Filial: TEdit;
    Label100: TLabel;
    ME14Cadastro: TMaskEdit;
    BT14Cadastro: TBitBtn;
    ED14Cadastro: TEdit;
    Label101: TLabel;
    ME14Operacao: TMaskEdit;
    BT14Operacao: TBitBtn;
    ED14Operacao: TEdit;
    Label102: TLabel;
    ME14OperacaoEntrada: TMaskEdit;
    BT14OperacaoEntrada: TBitBtn;
    ED14OperacaoEntrada: TEdit;
    ME14Serie: TMaskEdit;
    ME14Ano: TMaskEdit;
    Label103: TLabel;
    Label104: TLabel;
    ME14SaldoSaida: TMaskEdit;
    ME14SaldoEnt: TMaskEdit;
    Label105: TLabel;
    Label106: TLabel;
    TabSheet16: TTabSheet;
    Label107: TLabel;
    Label108: TLabel;
    Label110: TLabel;
    Label115: TLabel;
    Bt15Classe: TSpeedButton;
    Label117: TLabel;
    Bt15SubClasse: TSpeedButton;
    GroupBox14: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    Me15DtInicial: TMaskEdit;
    Me15DtFinal: TMaskEdit;
    Me15Cadastro: TMaskEdit;
    bt15Cadastro: TBitBtn;
    Me15Produto: TMaskEdit;
    Bt15Produto: TBitBtn;
    Me15Filial: TMaskEdit;
    Bt15Filial: TBitBtn;
    Ed15Filial: TEdit;
    Ed15Cadastro: TEdit;
    Ed15Produto: TEdit;
    Me15Classe: TMaskEdit;
    Ed15Classe: TEdit;
    Me15SubClasse: TMaskEdit;
    Ed15SubClasse: TEdit;
    Label109: TLabel;
    me3DCO: TMaskEdit;
    ME3CodContratoVenda: TMaskEdit;
    Label113: TLabel;
    RG3ValorDeCusto: TRadioGroup;
    Rg3Forma: TRadioGroup;
    Label114: TLabel;
    Me13Supervisor: TMaskEdit;
    Bt13Supervisor: TBitBtn;
    Ed13Supervisor: TEdit;
    Label116: TLabel;
    Me10Cadastro: TMaskEdit;
    Bt10ConsCadastro: TBitBtn;
    Ed10Cadastro: TEdit;
    RG10AnaliticoSintetico: TRadioGroup;
    Rg15TipoPessoa: TRadioGroup;
    Cb1Ordem: TComboBox;
    Label120: TLabel;
    TabSheet17: TTabSheet;
    GroupBox15: TGroupBox;
    Label123: TLabel;
    Me16Recebimento_I: TMaskEdit;
    Me16Recebimento_F: TMaskEdit;
    GroupBox16: TGroupBox;
    Me16Emissao_I: TMaskEdit;
    Me16Emissao_F: TMaskEdit;
    Label122: TLabel;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    FmMotivo1: TFmMotivo;
    FmTributacao1: TFmTributacao;
    FmEstado1: TFmEstado;
    FmFilial2: TFmFilial;
    FmCadastro2: TFmCadastro;
    FmOperacao2: TFmOperacao;
    FmFilial3: TFmFilial;
    FmCadastro3: TFmCadastro;
    FmProduto3: TFmProduto;
    FmLote3: TFmLote;
    FmVendedor3: TFmVendedor;
    FmClasse3: TFmClasse;
    FmFornecedor3: TFmCadastro;
    FmFilial4: TFmFilial;
    FmCadastro4: TFmCadastro;
    FmProduto4: TFmProduto;
    FmLote4: TFmLote;
    FmOperacao4: TFmOperacao;
    FmVendedor4: TFmVendedor;
    FmFornecedor4: TFmCadastro;
    Rg3TipoPessoa: TRadioGroup;
    RG10Opcao: TRadioGroup;
    Rg1TipoPagto: TRadioGroup;
    FmSerie1: TFmSerie;
    FmFilial17: TFmFilial;
    FmCadastro17: TFmCadastro;
    FmOperacao17: TFmOperacao;
    FmProduto1: TFmProduto;
    Rg7FormaPagto: TRadioGroup;
    RG6ExibirSerieCon: TRadioGroup;
    RG0TipoPessoa: TRadioGroup;
    Rg2QuebraVendedor: TRadioGroup;
    TabSheet18: TTabSheet;
    Label5: TLabel;
    MeNumNota: TMaskEdit;
    BtFilial: TBitBtn;
    TabSheet19: TTabSheet;
    Label9: TLabel;
    Me19NotaEntrada: TMaskEdit;
    Bt19NotaEntrada: TBitBtn;
    Rg7TipoRelatorio: TRadioGroup;
    FmCadastro_Alfandegado3: TFmCadastro;
    SpeedButton39: TSpeedButton;
    Me10Operacao: TMaskEdit;
    Label10: TLabel;
    FmCadastroArmazem4: TFmCadastro;
    Rg2Ordem: TRadioGroup;
    FmLote1: TFmLote;
    GroupBox17: TGroupBox;
    Fm18Produto: TFmProduto;
    Label13: TLabel;
    Me10EstoqueInicial: TMaskEdit;
    RG10Pessoa: TRadioGroup;
    Rg6Agrupamento: TRadioGroup;
    Fm5Cadastro: TFmCadastro;
    FmDepartamento4: TFmDepartamento;
    CB1ValUn: TCheckBox;
    FmCidade1: TFmCidade;
    TabSheet20: TTabSheet;
    Fm19Filial: TFmFilial;
    Fm19Cadastro: TFmCadastro;
    Fm19DataEmissao: TFmDatas;
    Fm19DataRecebimento: TFmDatas;
    Fm19Operacao: TFmOperacao;
    RG19TipoNota: TRadioGroup;
    FmVendedor2: TFmVendedor;
    TabSheet21: TTabSheet;
    Fm20Filial: TFmFilial;
    Fm20Operacao: TFmOperacao;
    Fm20Datas: TFmDatas;
    Cb0Frete: TCheckBox;
    CBCpfCidade: TCheckBox;
    FmCidade4: TFmCidade;
    RGTipoEtiqueta: TRadioGroup;
    TabSheet22: TTabSheet;
    Fm21Operacao: TFmOperacao;
    Fm21Filial: TFmFilial;
    Fm21Datas: TFmDatas;
    Fm21Produto: TFmProduto;
    rg1Codigo: TRadioGroup;
    TabSheet23: TTabSheet;
    FmDatas22: TFmDatas;
    TabSheet24: TTabSheet;
    Fm23Datas: TFmDatas;
    Fm23transportador: TFmCadastro;
    Label14: TLabel;
    ed23VlFrete: TEdit;
    ed23PorcentComissao: TEdit;
    Label15: TLabel;
    FmFinalidade2: TFmFinalidade;
    Fm18Produto2: TFmProduto;
    Fm18Produto3: TFmProduto;
    Label19: TLabel;
    FmObra2: TFmObra;
    Fm18Lote: TFmLote;
    ME18Quantidade: TMaskEdit;
    Label12: TLabel;
    TabSheet25: TTabSheet;
    FmFilial24: TFmFilial;
    FmProduto24: TFmProduto;
    FmClassificacao24: TFmClassificacao;
    FmClasse24: TFmClasse;
    FmTipoCadastro24: TFmTipoCadastro;
    FmCidade24: TFmCidade;
    FmEstado24: TFmEstado;
    RGCadastro24: TRadioGroup;
    Label20: TLabel;
    MEDias24: TMaskEdit;
    Label265: TLabel;
    CBOrdem24: TComboBox;
    RG4Tipo: TRadioGroup;
    TabSheet26: TTabSheet;
    FmFilial26: TFmFilial;
    Label21: TLabel;
    MePedido1: TMaskEdit;
    BtPedido: TBitBtn;
    EdPedido1: TEdit;
    CBMostraCustoLucro0: TCheckBox;
    Label22: TLabel;
    ME1Operacao: TMaskEdit;
    Bt1Operacao: TBitBtn;
    Fm3Classe: TFmClasse;
    TabSheet27: TTabSheet;
    RGNotaFiscal: TRadioGroup;
    Cb0ItensNota: TCheckBox;
    FmRamo1: TFmRamo;
    GroupBox18: TGroupBox;
    Label29: TLabel;
    Label34: TLabel;
    Me0DtEmissao_I: TMaskEdit;
    Me0DtEmissao_F: TMaskEdit;
    FmEstado3: TFmEstado;
    Label35: TLabel;
    Me1PrazoVencimento: TMaskEdit;
    Bt1PrazoVencimento: TBitBtn;
    Ed1PrazoVencimento: TEdit;
    FmDepartamento2: TFmDepartamento;
    FmMarca2: TFmMarca;
    Label53: TLabel;
    Me1Bairro: TMaskEdit;
    Label308: TLabel;
    ME0Classe: TMaskEdit;
    ME0Subclasse: TMaskEdit;
    Label309: TLabel;
    Bt0Classe: TBitBtn;
    Ed0Classe: TEdit;
    ME0numclasse: TMaskEdit;
    FmObra1: TFmObra;
    FmVendedorPreposto2: TFmVendedor;
    FmProduto2: TFmProduto;
    FmFornecedor2: TFmCadastro;
    Fm18Cadastro: TFmCadastro;
    Label8: TLabel;
    ME1Cultura: TMaskEdit;
    Bt1Cultura: TBitBtn;
    Ed1Cultura: TEdit;
    Label58: TLabel;
    ME2Cultura: TMaskEdit;
    Bt2Cultura: TBitBtn;
    ED2Cultura: TEdit;
    CB4Margem: TCheckBox;
    CB4Custo: TCheckBox;
    Label59: TLabel;
    Me2Transportador: TMaskEdit;
    BtTransportador: TBitBtn;
    Ed2Transportador: TEdit;
    RG2TipoFrete: TRadioGroup;
    CB0Filial: TCheckBox;
    TabSheet28: TTabSheet;
    GbPeriodo27: TGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    MeInicial27: TMaskEdit;
    MeFinal27: TMaskEdit;
    FmFilial27: TFmFilial;
    FmCadastro27: TFmCadastro;
    Label121: TLabel;
    MEOperacao27: TMaskEdit;
    BitBtn1: TBitBtn;
    Label60: TLabel;
    Label66: TLabel;
    Me10Nota: TMaskEdit;
    Bt10Nota: TBitBtn;
    LBVendedor1: TLabel;
    MeCodVendedor: TMaskEdit;
    Sb3Vendedor: TSpeedButton;
    MeMarca: TMaskEdit;
    Label67: TLabel;
    BtMarca: TBitBtn;
    EdMarca: TEdit;
    FmTecnico1: TFmVendedor;
    rgOrdenacao: TRadioGroup;
    FmTrasnportador1: TFmCadastro;
    ME1Observacao: TMaskEdit;
    Label81: TLabel;
    LbCodDCB: TLabel;
    MeCodDCB: TMaskEdit;
    TabSheet29: TTabSheet;
    FmFilial29: TFmFilial;
    FmCadastro29: TFmCadastro;
    FmDepartamento29: TFmDepartamento;
    FmDatas29: TFmDatas;
    rgOrdem29: TRadioGroup;
    rgSituacao29: TRadioGroup;
    ME1Departamento: TMaskEdit;
    Label89: TLabel;
    Bt1Departamento: TBitBtn;
    GroupBox19: TGroupBox;
    Label94: TLabel;
    Label96: TLabel;
    ME0DataHoraI: TMaskEdit;
    ME0DataHoraF: TMaskEdit;
    procedure Bt0ConsCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt4ConsFilialClick(Sender: TObject);
    procedure Bt4ConsProdutoClick(Sender: TObject);
    procedure Bt4ConsLoteClick(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure ME4ProdutoExit(Sender: TObject);
    procedure ME4LoteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME5CodFilialExit(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure Bt6ConsFilialClick(Sender: TObject);
    procedure ME6CadastroExit(Sender: TObject);
    procedure Bt6ConsCadastroClick(Sender: TObject);
    procedure ME6ProdutoExit(Sender: TObject);
    procedure Bt6ConsProdutoClick(Sender: TObject);
    procedure ME7_FilialExit(Sender: TObject);
    procedure BT7_FilialClick(Sender: TObject);
    procedure ME7_ProdutoExit(Sender: TObject);
    procedure BT7_ProdutoClick(Sender: TObject);
    procedure ME8_FilialExit(Sender: TObject);
    procedure BT8_FilialClick(Sender: TObject);
    procedure ME8_ProdutoExit(Sender: TObject);
    procedure BT8_ProdutoClick(Sender: TObject);
    procedure Bt9FilialClick(Sender: TObject);
    procedure Me9CodFilialExit(Sender: TObject);
    procedure Me9CadastroExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Bt7ConsCadastroClick(Sender: TObject);
    procedure Me8CadastroExit(Sender: TObject);
    procedure Bt8ConsCadastroClick(Sender: TObject);
    procedure Bt7CadastroParceiroClick(Sender: TObject);
    procedure Bt8CadastroParceiroClick(Sender: TObject);
    procedure Me7CadastroExit(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure BT10FilialClick(Sender: TObject);
    procedure BT10ProdutoClick(Sender: TObject);
    procedure ME11FilialExit(Sender: TObject);
    procedure ME11FornecedorExit(Sender: TObject);
    procedure BT11FilialClick(Sender: TObject);
    procedure BT11FornecedorClick(Sender: TObject);
    procedure BT11NotaClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure ME12CadastroExit(Sender: TObject);
    procedure ME12ClasseExit(Sender: TObject);
    procedure ME12ProdutoExit(Sender: TObject);
    procedure ME12LoteExit(Sender: TObject);
    procedure ME12OperacaoExit(Sender: TObject);
    procedure ME12VendedorExit(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure Bt12CadastroClick(Sender: TObject);
    procedure SB12ClasseClick(Sender: TObject);
    procedure Bt12ProdutoClick(Sender: TObject);
    procedure Bt12LoteClick(Sender: TObject);
    procedure Bt12OperacaoClick(Sender: TObject);
    procedure Bt12VendedorClick(Sender: TObject);
    procedure Bt0CodParceiroClick(Sender: TObject);
    procedure ME13FilialExit(Sender: TObject);
    procedure ME13OperacaoExit(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure BTOperacaoConsClick(Sender: TObject);
    procedure BTVendedorConsClick(Sender: TObject);
    procedure ME13VendedorExit(Sender: TObject);
    procedure ME0CadastroChange(Sender: TObject);
    procedure SB3SerieClick(Sender: TObject);
    procedure SB2SubClasseClick(Sender: TObject);
    procedure ME2SubClasseExit(Sender: TObject);
    procedure BT14FilialClick(Sender: TObject);
    procedure BT14CadastroClick(Sender: TObject);
    procedure BT14OperacaoClick(Sender: TObject);
    procedure BT14OperacaoEntradaClick(Sender: TObject);
    procedure ME14FilialExit(Sender: TObject);
    procedure ME14CadastroExit(Sender: TObject);
    procedure ME14OperacaoExit(Sender: TObject);
    procedure ME14OperacaoEntradaExit(Sender: TObject);
    procedure Me15FilialExit(Sender: TObject);
    procedure Bt15FilialClick(Sender: TObject);
    procedure Me15CadastroExit(Sender: TObject);
    procedure bt15CadastroClick(Sender: TObject);
    procedure Me15ClasseExit(Sender: TObject);
    procedure Bt15ClasseClick(Sender: TObject);
    procedure Me15SubClasseExit(Sender: TObject);
    procedure Bt15SubClasseClick(Sender: TObject);
    procedure Me15ProdutoExit(Sender: TObject);
    procedure Bt15ProdutoClick(Sender: TObject);
    procedure Me13SupervisorExit(Sender: TObject);
    procedure Bt13SupervisorClick(Sender: TObject);
    procedure Me10CadastroExit(Sender: TObject);
    procedure Bt10ConsCadastroClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure FmFilial17BtFilialClick(Sender: TObject);
    procedure Bt19NotaEntradaClick(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure FmFilial1BtFilialClick(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure MePedido1Exit(Sender: TObject);
    procedure BtPedidoClick(Sender: TObject);
    procedure FmCidade4BtCidadeClick(Sender: TObject);
    procedure Bt1PrazoVencimentoClick(Sender: TObject);
    procedure Me1PrazoVencimentoExit(Sender: TObject);
    procedure ME0SubclasseExit(Sender: TObject);
    procedure Bt0ClasseClick(Sender: TObject);
    procedure FmObra2BtObraClick(Sender: TObject);
    procedure FmVendedorPreposto1BtVendedorClick(Sender: TObject);
    procedure Bt4CadastroClick(Sender: TObject);
    procedure ME4CadastroExit(Sender: TObject);
    procedure ME1CulturaExit(Sender: TObject);
    procedure Bt1CulturaClick(Sender: TObject);
    procedure ME2CulturaExit(Sender: TObject);
    procedure Bt2CulturaClick(Sender: TObject);
    procedure BtTransportadorClick(Sender: TObject);
    procedure Me2TransportadorExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Bt10NotaClick(Sender: TObject);
    procedure Sb3VendedorClick(Sender: TObject);
    procedure Bt1OperacaoClick(Sender: TObject);
    procedure MeMarcaExit(Sender: TObject);
    procedure FmObra1BtObraClick(Sender: TObject);
    procedure BtMarcaClick(Sender: TObject);
    procedure FmProduto1BtProdutoClick(Sender: TObject);
    procedure Bt1DepartamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
  
  end;

var
  FNotaEntradaParam: TFNotaEntradaParam;

implementation

uses UCadastro_cl, UCadastroCons, UProduto_cl, UProdutoCons, UTipoLote_cl,
  UTipoLoteCons, UFilial_cl, UFilialCons, UVendedor_cl, UVendedorCons,
  UParamSistema_cl, UOperacao_cl, UOperacaoCons, UOracle_cl, UUsuario_cl,
  UClasseCons, UClasse_cl, UNotaEntradaCons, UNotaEntrada_cl, UNotaSaida_cl,
  UEstadoCons, UEstado_cl, UDepartamentoCons, UDepartamento_cl, UMotivoCons,
  UMotivo_cl, USerieCons, USerie_cl, UTributacaoCons, UTributacao_cl, DB,
  UPedidoCons, UPedido_cl, UPrazoVencimentoCons, UPrazoVencimento_cl,
  UCulturaCons, UCultura_cl, UNotaSaidaCons, UFuncao_cl, UMarcaCons,
  UMarca_cl;

{$R *.DFM}

procedure TFNotaEntradaParam.Bt0ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    FmCadastro1.MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaEntradaParam.FormCreate(Sender: TObject);
begin
  inherited;
  CB0Ordem.ItemIndex := 0;
  CB3Ordem.ItemIndex := 0;
  CB1ValUn.Visible := (DMParamSistema.CodEmpresa <> 'INSIDE') and (DMParamSistema.CodEmpresa <> 'DISPART');
  Fm19Filial.MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
    Cb0Frete.Checked := False;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
    Fm18Cadastro.Visible := True;
end;

procedure TFNotaEntradaParam.Bt4ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME4FilialExit(Self); 
end;

procedure TFNotaEntradaParam.Bt4ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME4Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME4ProdutoExit(Self);
end;

procedure TFNotaEntradaParam.Bt4ConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    ME4Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME4LoteExit(Self);
end;

procedure TFNotaEntradaParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Filial.Text) <> '' Then
    Ed4Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME4Filial.text,True)
  Else
    Ed4Filial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME4ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Produto.Text) <> '' Then
     Ed4Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME4Produto.text,True)
  Else
    Ed4Produto.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME4LoteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Lote.Text) <> '' Then
     Ed4Lote.Text :=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                        'COD_LOTE_TIPO = '+ME4Lote.text,True)
  Else
    Ed4Lote.text := 'Todos';
end;

procedure TFNotaEntradaParam.FormActivate(Sender: TObject);
begin
  inherited;
  FmFilial1.MEFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial2.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial3.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial4.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME4Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7_Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME8_Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME5DtInicial.Text := DateToStr(Date);
  ME5DtFinal.Text := DateToStr(Date);
//  Me3CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me7CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me8CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me10Cadastro.Text := DMUsuario.pCodParceria;
//  FMCadastroParceiro1.MeCadastro.Text := DMUsuario.pCodParceria;
//  Me3CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me7CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me8CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me10Cadastro.Enabled := DMUsuario.pCodParceria = '';
//  FMCadastroParceiro1.MeCadastro.Enabled := DMUsuario.pCodParceria = '';
//  Bt3CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt7CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt8CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt10ConsCadastro.Enabled := DMUsuario.pCodParceria = '';
//  FMCadastroParceiro1.MeCadastro.Enabled := DMUsuario.pCodParceria = '';
  if (DMParamSistema.CodEmpresa = 'NUTRIPET') then
  Begin
    Fm18Lote.Enabled := False;
    Me18Quantidade.Enabled := False;
    Label12.Visible := false;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-BAHIA') or (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
  begin
    ME1Departamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
    CB0Ordem.ItemIndex := 2;
  end;
  if DMParamSistema.CodEmpresa = 'VETRO' then
    CBMostraCustoLucro0.Checked := false;

  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NEOALI' then
     FmFornecedor2.Label1.Caption := 'Artista';
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    CBMostraCustoLucro0.Checked := False;
  end;
//Solicitado por Kely da Pateli. 22/08/2023 - Alex
  if (DMParamSistema.CodEmpresa = 'PATELI') and (DMUsuario.Privilegiado = False) then
  begin
    CBMostraCustoLucro0.Checked := false;
    CBMostraCustoLucro0.Enabled := false;
  end;
  if DMParamSistema.CodEmpresa = 'NFCE-DOGAO' then
  begin
    Me0DtEmissao_I.Text := DateToStr(Date);
    Me0DtEmissao_F.Text := DateToStr(Date);
  end;
  if DMParamSistema.CodEmpresa = 'PRAIASMI' then
  begin
    Cb0ItensNota.Checked := true;
  end;
  if DMParamSistema.CodEmpresa = 'GGIRARDI' then
  begin
    LbCodDCB.Visible := True;
    MeCodDCB.Visible := True;
  end;
end;

procedure TFNotaEntradaParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
     ME5CodFilial.text:=DMFilial.QFilialConsCOd_Filial.text;
     ME5CodFilialExit(Self); 
end;

procedure TFNotaEntradaParam.ME5CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodFilial.text)<>'' then
    ME5Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME5CodFilial.text,True)
  else
    ME5Filial.Clear;
end;

procedure TFNotaEntradaParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
 If Trim(ME6Filial.Text) <> '' Then
    Ed6Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME6Filial.text,True)
  Else
    Ed6Filial.Text := 'Todos';
End;

procedure TFNotaEntradaParam.Bt6ConsFilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME6FilialExit(Self);   
End;

procedure TFNotaEntradaParam.ME6CadastroExit(Sender: TObject);
begin
  inherited;
 If Trim(ME6Cadastro.Text) <> '' Then
   Begin
    Ed6Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+ME6Cadastro.text,True);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME6Cadastro.Text)));
   End
  Else
    Ed6Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Bt6ConsCadastroClick(Sender: TObject);
begin
  inherited;
 If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME6Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME6CadastroExit(Self);
end;

procedure TFNotaEntradaParam.ME6ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Produto.Text) <> '' Then
     Ed6Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME6Produto.text,True)
  Else
    Ed6Produto.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Bt6ConsProdutoClick(Sender: TObject);
begin
  inherited;
If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME6Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME6ProdutoExit(Self); 
end;

procedure TFNotaEntradaParam.ME7_FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me7_Filial.Text) <> '' Then
    Ed7_Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                    'COD_FILIAL = '+Me7_Filial.text,True)
  Else
    Ed7_Filial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BT7_FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME7_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME7_FilialExit(Self); 
end;

procedure TFNotaEntradaParam.ME7_ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7_Produto.Text) <> '' Then
     Ed7_Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME7_Produto.text,True)
  else
    ED7_Produto.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BT7_ProdutoClick(Sender: TObject);
begin
  inherited;
If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME7_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME7_ProdutoExit(Self); 
end;

procedure TFNotaEntradaParam.ME8_FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8_Filial.Text) <> '' Then
    Ed8_Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+Me8_Filial.text,True)
  Else
    Ed8_Filial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BT8_FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME8_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME8_FilialExit(Self);
end;

procedure TFNotaEntradaParam.ME8_ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8_Produto.Text) <> '' Then
     Ed8_Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME8_Produto.text,True)
  else
    ED8_Produto.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BT8_ProdutoClick(Sender: TObject);
begin
  inherited;
If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME8_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME8_ProdutoExit(Self);
end;

procedure TFNotaEntradaParam.Bt9FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME9CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9CodFilialExit(Self); 
end;

procedure TFNotaEntradaParam.Me9CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9CodFilial.Text) <> '' Then
    Ed9DescFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME9CodFilial.text,True)
  Else
    ED9DescFilial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Me9CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Cadastro.Text) <> '' Then
   Begin
     Ed9Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+ME9Cadastro.text,True);
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME9Cadastro.Text)));
   End
  Else
    Ed9Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
 If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME9Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME9CadastroExit(Self); 
end;

procedure TFNotaEntradaParam.TabSheet5Show(Sender: TObject);
begin
  inherited;
  FNotaEntradaParam.helpcontext:=3;
end;

procedure TFNotaEntradaParam.TabSheet4Show(Sender: TObject);
begin
  inherited;
  FNotaEntradaParam.HelpContext:=24;
end;

procedure TFNotaEntradaParam.Bt7ConsCadastroClick(Sender: TObject);
begin
  inherited;
 If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME7Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME7CadastroExit(Self); 

end;

procedure TFNotaEntradaParam.Me8CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Cadastro.Text) <> '' Then
   Begin
    Ed8Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+ME8Cadastro.text,True);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME8Cadastro.Text)));
   End
  Else
    Ed8Cadastro.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt8ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME8Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
  ME8CadastroExit(Self);
end;

procedure TFNotaEntradaParam.Bt7CadastroParceiroClick(Sender: TObject);
begin
  inherited;
 If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me7CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaEntradaParam.Bt8CadastroParceiroClick(Sender: TObject);
begin
  inherited;
 If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me8CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFNotaEntradaParam.Me7CadastroExit(Sender: TObject);
begin
  inherited;
 If Trim(ME7Cadastro.Text) <> '' Then
   Begin
    Ed7Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+ME7Cadastro.text,True);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME7Cadastro.Text)));
   End
  Else
    Ed7Cadastro.Text := 'Todos';

end;

procedure TFNotaEntradaParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Filial.Text) <> '' then
    ED10Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME10Filial.text,True)
  else
    ED10Filial.Text := 'Todas';
end;

procedure TFNotaEntradaParam.BT10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME10FilialExit(Self); 
end;

procedure TFNotaEntradaParam.BT10ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk then
   Begin
     If Trim(ME10Produto.Text) <> '' Then
        ME10Produto.Text := ME10Produto.Text + ',';
     ME10Produto.Text := ME10Produto.Text + DMProduto.QProdutoConsCod_Produto.Text;
   End; 
end;

procedure TFNotaEntradaParam.ME11FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11Filial.Text) <> '' then
    Ed11Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                                        'COD_FILIAL = '+ME11Filial.text,True)
  else
    Ed11Filial.Text := 'Todas';
end;

procedure TFNotaEntradaParam.ME11FornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11Fornecedor.Text) <> '' then
   Begin
     Ed11Fornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                                               'COD_CADASTRO = '+ME11Fornecedor.text,True);
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME11Fornecedor.Text)));
   End
  else
    Ed11Fornecedor.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BT11FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME11Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME11FilialExit(Self);
end;

procedure TFNotaEntradaParam.BT11FornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME11Fornecedor.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME11FornecedorExit(Self); 
end;

procedure TFNotaEntradaParam.BT11NotaClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  if FNotaEntradaCons.ShowModal = mrOk then
    ME11Nota.Text := DMNotaEntrada.QNotaEntradaConsNUM_NOTA.Text;
end;

procedure TFNotaEntradaParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Filial.Text) <> '' Then
    Ed12Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+ME12Filial.text,True)
  Else
    Ed12Filial.Text := 'Todos';
end;
procedure TFNotaEntradaParam.ME12CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Cadastro.Text) <> '' Then
   Begin
     Ed12Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                       'COD_CADASTRO = '+ME12Cadastro.text,True);
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME12Cadastro.Text)));
   End
  Else
    Ed12Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME12ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12Classe.Text) <> '' Then
     Ed12Classe.Text :=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM  TB_CLASSE',
                        'COD_CLASSE = '+ME12Classe.text,True)
  else
    Ed12Classe.Text := 'Todos';

end;

procedure TFNotaEntradaParam.ME12ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Produto.Text) <> '' Then
     Ed12Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME12Produto.text,True)
  Else
    Ed12Produto.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME12LoteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Lote.Text) <> '' Then
     Ed12Lote.Text :=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                        'COD_LOTE_TIPO = '+ME12Lote.text,True)
  Else
    Ed12Lote.text := 'Todos';

end;

procedure TFNotaEntradaParam.ME12OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me12Operacao.Text) <> '' Then
    Ed12Operacao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                    'COD_OPERACAO = '+Me12Operacao.text,True)
  Else
    Ed12Operacao.Text := 'Todos';

end;

procedure TFNotaEntradaParam.ME12VendedorExit(Sender: TObject);
begin
  inherited;
 If Trim(Me12Vendedor.Text) <> '' Then
    Ed12Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+Me12Vendedor.text,True)
  Else
    Ed12Vendedor.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME12Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME12FilialExit(Self);
end;

procedure TFNotaEntradaParam.Bt12CadastroClick(Sender: TObject);
begin
  inherited;
   If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME12Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME12CadastroExit(Self);
end;

procedure TFNotaEntradaParam.SB12ClasseClick(Sender: TObject);
begin
  inherited;
 if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME12Classe.Text := DMClasse.QClasseConsCod_Classe.Text;
    ME12ClasseExit(Self);
end;

procedure TFNotaEntradaParam.Bt12ProdutoClick(Sender: TObject);
begin
  inherited;
   If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME12Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME12ProdutoExit(Self); 
end;

procedure TFNotaEntradaParam.Bt12LoteClick(Sender: TObject);
begin
  inherited;
   If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    ME12Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME12LoteExit(Self);  
end;

procedure TFNotaEntradaParam.Bt12OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    Me12Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Me12OperacaoExit(Self);
end;

procedure TFNotaEntradaParam.Bt12VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me12Vendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  Me12VendedorExit(Self);
end;

procedure TFNotaEntradaParam.Bt0CodParceiroClick(Sender: TObject);
begin
  inherited;
//  If FCadastroCons = Nil then
//    FCadastroCons := TFCadastroCons.Create(Application);
//  If FCadastroCons.ShowModal = mrOk then
//    FmCadastroParceiro1.MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
//    FmCadastroParceiro1.MeCadastroExit(self);
end;

procedure TFNotaEntradaParam.ME13FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13Filial.Text) <> '' Then
     Ed13Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+ME13Filial.text,True)
  Else
    Ed13Filial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME13OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me13Operacao.Text) <> '' Then
    Ed13Operacao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                    'COD_OPERACAO = '+Me13Operacao.text,True)
  Else
    Ed13Operacao.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME13Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME13FilialExit(Self);
end;

procedure TFNotaEntradaParam.BTOperacaoConsClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    Me13Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Me13OperacaoExit(Self);
end;

procedure TFNotaEntradaParam.BTVendedorConsClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me13Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me13VendedorExit(Self);
end;

procedure TFNotaEntradaParam.ME13VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me13Vendedor.Text) <> '' Then
    Ed13Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+trim(Me13Vendedor.Text),True)
  Else
    Ed13Vendedor.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME0CadastroChange(Sender: TObject);
begin
  inherited;
  If Trim(FmCadastro1.MeCadastro.Text) <> '' Then
   Begin
     FmCadastro1.EdCadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+FmCadastro1.MeCadastro.text,True);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(FmCadastro1.MeCadastro.Text)));
   End
  Else
    FmCadastro1.EdCadastro.Text := 'Todos';

end;

procedure TFNotaEntradaParam.SB3SerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    ME3Serie.Text := DMSerie.QserieConsCod_Serie.Text;
End;
procedure TFNotaEntradaParam.SB2SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME2SubClasse.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
  ME2SubClasseExit(Self);
end;

procedure TFNotaEntradaParam.ME2SubClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me2SubClasse.Text) <> '' then
    Ed2SubClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+FmClasse3.MeClasse.Text + ' AND NUM_SUBCLASSE = '+Me2SubClasse.Text,True)
  else
    Ed2SubClasse.Text := 'Todas';
end;

procedure TFNotaEntradaParam.BT14FilialClick(Sender: TObject);
begin
  inherited;
   If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME14Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME14FilialExit(Self);
end;

procedure TFNotaEntradaParam.BT14CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME14Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME14CadastroExit(Self);
end;

procedure TFNotaEntradaParam.BT14OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    Me14Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Me14OperacaoExit(Self);
end;

procedure TFNotaEntradaParam.BT14OperacaoEntradaClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME14OperacaoEntrada.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME14OperacaoEntradaExit(Self);
end;

procedure TFNotaEntradaParam.ME14FilialExit(Sender: TObject);
begin
  inherited;
   If Trim(ME14Filial.Text) <> '' Then
    Ed14Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+ME14Filial.text,True)
  Else
    Ed14Filial.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME14CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14Cadastro.Text) <> '' Then
     Ed14Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                                            'COD_CADASTRO = '+ME14Cadastro.text,True)
  Else
    Ed14Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME14OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14Operacao.Text) <> '' Then
    Ed14Operacao.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                          'COD_OPERACAO = '+Me14Operacao.text,True)
  Else
    Ed14Operacao.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME14OperacaoEntradaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14OperacaoEntrada.Text) <> '' Then
    ED14OperacaoEntrada.text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                                 'COD_OPERACAO = '+ME14OperacaoEntrada.text,True)
  Else
    ED14OperacaoEntrada.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Me15FilialExit(Sender: TObject);
begin
  inherited;
 If Trim(ME15Filial.Text) <> '' Then
    Ed15Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+Me15Filial.text,True)
  Else
    Ed15Filial.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt15FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me15Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me15FilialExit(self);
end;

procedure TFNotaEntradaParam.Me15CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me15Cadastro.Text) <> '' Then
   Begin
     Ed15Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+Me15Cadastro.text,True);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(Me15Cadastro.Text)));
   End
  Else
    Ed15Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.bt15CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me15Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
  Me15CadastroExit(self);

end;

procedure TFNotaEntradaParam.Me15ClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me15Classe.Text) <> '' Then
     Ed15Classe.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me15Classe.Text + ' AND NUM_SUBCLASSE = 0',True)
  else
     Ed15Classe.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt15ClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me15Classe.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  Me15ClasseExit(self);

end;

procedure TFNotaEntradaParam.Me15SubClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(Me15SubClasse.Text) <> '' Then
     Ed15SubClasse.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Me15Classe.Text + ' AND NUM_SUBCLASSE = '+Me15SubClasse.text,True)
  else
    Ed15SubClasse.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt15SubClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me15SubClasse.Text := DMClasse.QClasseConsNUM_SUBCLASSE.Text;
  Me15SubClasseExit(self);

end;

procedure TFNotaEntradaParam.Me15ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME15Produto.Text) <> '' Then
     Ed15Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+Me15Produto.text,True)
  Else
    Ed15Produto.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt15ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    Me15Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
  Me15ProdutoExit(self);

end;

procedure TFNotaEntradaParam.Me13SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me13Supervisor.Text) <> '' Then
    Ed13Supervisor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+trim(Me13Supervisor.Text),True)
  Else
    Ed13Supervisor.Text := 'Todos';

end;

procedure TFNotaEntradaParam.Bt13SupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me13Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me13SupervisorExit(Self);

end;

procedure TFNotaEntradaParam.Me10CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Cadastro.Text) <> '' Then
    Ed10Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO', 'COD_CADASTRO = '+ME10Cadastro.text,True)
  Else
    Ed10Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Bt10ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME10Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
  ME10CadastroExit(Self);
end;

procedure TFNotaEntradaParam.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
      MeNumNota.Text := IntToStr(DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value)
end;

procedure TFNotaEntradaParam.FmFilial17BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial17.BtFilialClick(Sender);

end;

procedure TFNotaEntradaParam.Bt19NotaEntradaClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
    Me19NotaEntrada.Text := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Text;
end;

procedure TFNotaEntradaParam.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = MrOk  then
   Begin
     If Trim(Me10Operacao.Text) <> '' Then
        Me10Operacao.Text := Me10Operacao.Text + ',';
     Me10Operacao.Text := Me10Operacao.Text + DMOperacao.QOperacaoConsCod_Operacao.Text;
   End;
end;

procedure TFNotaEntradaParam.FmFilial1BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial1.BtFilialClick(Sender);

end;

procedure TFNotaEntradaParam.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmCadastro1.BtCadastroClick(Sender);

end;

procedure TFNotaEntradaParam.MePedido1Exit(Sender: TObject);
begin
  inherited;
  if Trim(MePedido1.Text) <> '' then
    EdPedido1.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_PEDIDO_CAB INNER JOIN TB_CADASTRO ON TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO','TB_PEDIDO_CAB.NUM_PEDIDO = ' + MePedido1.Text, True)
  else
    EdPedido1.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BtPedidoClick(Sender: TObject);
begin
  inherited;
  if FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  if FPedidoCons.ShowModal = MrOk then
  begin
    MePedido1.Text := DMPedido.QPedidoConsNUM_PEDIDO.Text;
    MePedido1Exit(Self);
  end;
end;

procedure TFNotaEntradaParam.FmCidade4BtCidadeClick(Sender: TObject);
begin
  inherited;
  FmCidade4.BtCidadeClick(Sender);

end;

procedure TFNotaEntradaParam.Bt1PrazoVencimentoClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = MrOk then
  begin
    Me1PrazoVencimento.Text := DMPrazoVencimento.QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO.Text;
    Me1PrazoVencimentoExit(Self);
  end;
end;

procedure TFNotaEntradaParam.Me1PrazoVencimentoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1PrazoVencimento.Text) <> '' then
  begin
    Ed1PrazoVencimento.Text := DMOracle.BuscaNome('SELECT DESC_PRAZO_VENCIMENTO FROM TB_PRAZO_VENCIMENTO ','TB_PRAZO_VENCIMENTO.COD_PRAZO_VENCIMENTO = ' + Me1PrazoVencimento.Text, true);
  end
  else
    Ed1PrazoVencimento.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME0SubclasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Classe.Text) = '' Then
  Begin
    Ed0Classe.Text := 'Todos';
    ME0SubClasse.Text := '';
    ME0NumClasse.Text := '';
  End
  Else
    If Trim(ME0SubClasse.Text) = '' then
    Begin
      Ed0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME0SubClasse.Text := '0';
      ME0NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
    End
    Else
    Begin
      Ed0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME0SubClasse.Text);
      ME0NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME0SubClasse.Text);
    End;
end;

procedure TFNotaEntradaParam.Bt0ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME0Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME0SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME0SubClasseExit(Self);
end;

procedure TFNotaEntradaParam.FmObra2BtObraClick(Sender: TObject);
begin
  inherited;
  FmObra2.BtObraClick(Sender);

end;

procedure TFNotaEntradaParam.FmVendedorPreposto1BtVendedorClick(
  Sender: TObject);
begin
  inherited;
  FmVendedorPreposto2.BtVendedorClick(Sender);
end;

procedure TFNotaEntradaParam.Bt4CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME4Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME4CadastroExit(Self);
end;

procedure TFNotaEntradaParam.ME4CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Cadastro.Text) <> '' Then
    Ed4Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                    'COD_CADASTRO = '+ME4Cadastro.text,True)
  Else
    Ed4Cadastro.Text := 'Todos';
end;

procedure TFNotaEntradaParam.ME1CulturaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Cultura.Text) <> '' then
  begin
    Ed1Cultura.Text := DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA ','TB_CULTURA.COD_CULTURA = ' + Me1Cultura.Text, true);
  end
  else
    Ed1Cultura.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Bt1CulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = MrOk then
  begin
    Me1Cultura.Text := DMCultura.QCulturaConsCOD_CULTURA.Text;
    Me1CulturaExit(Self);
  end;
end;

procedure TFNotaEntradaParam.ME2CulturaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me2Cultura.Text) <> '' then
  begin
    Ed2Cultura.Text := DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA ','TB_CULTURA.COD_CULTURA = ' + Me2Cultura.Text, true);
  end
  else
    Ed2Cultura.Text := 'Todos';
end;

procedure TFNotaEntradaParam.Bt2CulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = MrOk then
  begin
    Me2Cultura.Text := DMCultura.QCulturaConsCOD_CULTURA.Text;
    Me2CulturaExit(Self);
  end;
end;

procedure TFNotaEntradaParam.BtTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    Me2Transportador.Text := DMCadastro.QCadastroConsCOD_Cadastro.Text;
    Me2TransportadorExit(Self);
  end;
end;

procedure TFNotaEntradaParam.Me2TransportadorExit(Sender: TObject);
begin
  inherited;
  inherited;
  if Trim(Me2Transportador.Text) <> '' then
  begin
    Ed2Transportador.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO ','TB_CADASTRO.COD_CADASTRO = ' + Me2Transportador.Text, true);
  end
  else
    Ed2Transportador.Text := 'Todos';
end;

procedure TFNotaEntradaParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    If Trim(MEOperacao27.Text) <> '' Then
      MEOperacao27.Text := MEOperacao27.Text + ',' + DMOperacao.QOperacaoConsCOD_OPERACAO.Text
    else
      MEOperacao27.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  End;
end;

procedure TFNotaEntradaParam.Bt10NotaClick(Sender: TObject);
begin
  inherited;
  if dmfuncao.QModuloNOME_MODULO.Text = 'VENDA' then
  begin
    If FNotaSaidaCons = Nil then
      FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
    If FNotaSaidaCons.ShowModal = mrOk then
    Begin
      If Trim(Me10Nota.Text) <> '' Then
        Me10Nota.Text := Me10Nota.Text + ',' + DMNotaSaida.QNotaSaidaConsNUM_NOTA.Text
      else
        Me10Nota.Text := DMNotaSaida.QNotaSaidaConsNUM_NOTA.Text;
    end;
  end;
  if dmfuncao.QModuloNOME_MODULO.Text = 'COMPRA' then
  begin
    If FNotaEntradaCons = Nil then
      FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
    If FNotaEntradaCons.ShowModal = mrOk then
    Begin
      If Trim(Me10Nota.Text) <> '' Then
        Me10Nota.Text := Me10Nota.Text + ',' + DMNotaEntrada.QNotaEntradaConsNUM_NOTA.Text
      else
        Me10Nota.Text := DMNotaEntrada.QNotaEntradaConsNUM_NOTA.Text;
      End;
    end;
  end;

procedure TFNotaEntradaParam.Sb3VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk  then
  begin
    if Trim(MeCodVendedor.Text) <> '' then
       MeCodVendedor.Text := MeCodVendedor.Text + ', ' + DMVendedor.QVendedorConsCod_Vendedor.Text
    else
      MeCodVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
  end;

end;

procedure TFNotaEntradaParam.Bt1OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    If Trim(Me1Operacao.Text) <> '' Then
      ME1Operacao.Text := ME1Operacao.Text + ',' + DMOperacao.QOperacaoConsCOD_OPERACAO.Text
    else
      ME1Operacao.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  End;
end;

procedure TFNotaEntradaParam.MeMarcaExit(Sender: TObject);
begin
  inherited;
  If Trim(MeMarca.Text) <> '' Then
    EdMarca.Text := DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA',
                                            'COD_MARCA = '+Trim(MeMarca.Text))
   Else
    EdMarca.Text := 'Todos';
end;

procedure TFNotaEntradaParam.FmObra1BtObraClick(Sender: TObject);
begin
  inherited;
  FmObra1.BtObraClick(Sender);

end;

procedure TFNotaEntradaParam.BtMarcaClick(Sender: TObject);
begin
  inherited;
  If FMarca_Cons = Nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  If FMarca_Cons.ShowModal = mrOk then
    MeMarca.Text := DMMarca.QMarcaConsCod_Marca.Text;
  MeMarcaExit(Self);

end;

procedure TFNotaEntradaParam.FmProduto1BtProdutoClick(Sender: TObject);
begin
  inherited;
  FmProduto1.BtProdutoClick(Sender);

end;

procedure TFNotaEntradaParam.Bt1DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    If Trim(ME1Departamento.Text) <> '' Then
      ME1Departamento.Text := ME1Departamento.Text + ',' + DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text
    else
      ME1Departamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
  End;
end;

end.
