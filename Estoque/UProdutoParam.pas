unit UProdutoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls, Mask, Spin,
  checklst, Grids, DBGrids, UFmClasse, UFmProduto, UFmMarca,
  UFmDepartamento, UFmFilial, UFmLote, UFmUsuario, UFmDatas, UFmMotivo,
  UFmVendedor, UFmNcm, UFmSubClasse, UFmNota, UFmOperacao, UFmCadastro;
//  , DBarImage;

type
  TFProdutoParam = class(TFTParametro)
    TSProdutoClasse: TTabSheet;
    CB0Ordem: TComboBox;
    Label3: TLabel;
    TSProdutos: TTabSheet;
    ME1Cadastro: TMaskEdit;
    ME1TipoProduto: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    SB1Cadastro: TSpeedButton;
    SB1TipoProduto: TSpeedButton;
    CB1Cadastro: TCheckBox;
    CB1TipoProduto: TCheckBox;
    CB1Ordem: TComboBox;
    Label6: TLabel;
    ME1Cod: TMaskEdit;
    Label7: TLabel;
    RG1QtdeEstoque: TRadioGroup;
    ME1Filial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    ME1CodFilial: TMaskEdit;
    Label9: TLabel;
    CB1Filial: TCheckBox;
    TSListaPrecos: TTabSheet;
    ME2TipoProduto: TMaskEdit;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    CB2TipoProduto: TCheckBox;
    RG2QtdeEstoque: TRadioGroup;
    Label11: TLabel;
    CB2Ordem: TComboBox;
    Label12: TLabel;
    TSEtiquetas: TTabSheet;
    GB3EtiquetasPequenas: TGroupBox;
    CLB3Etiquetas: TCheckListBox;
    ME3CodProduto: TMaskEdit;
    SpeedButton4: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    ME0TipoProduto: TMaskEdit;
    Label19: TLabel;
    SpeedButton6: TSpeedButton;
    CB0TipoProduto: TCheckBox;
    TSBaixaEstoque: TTabSheet;
    TabSheet1: TTabSheet;
    ME5CodProduto: TMaskEdit;
    ME5Produto: TMaskEdit;
    SpeedButton5: TSpeedButton;
    SENumEtiquetas: TSpinEdit;
    Label15: TLabel;
    Label16: TLabel;
    TabSheet2: TTabSheet;
    ME6TipoProduto: TMaskEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    ME6DataInicial: TMaskEdit;
    ME6DataFinal: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    CB6Todos: TCheckBox;
    Cb1Situacao: TComboBox;
    Label21: TLabel;
    Label22: TLabel;
    Cb2Situacao: TComboBox;
    Label23: TLabel;
    Cb0Situacao: TComboBox;
    Label24: TLabel;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Me2Fabricante: TMaskEdit;
    Cb2Cadastro: TCheckBox;
    Me2Codigo: TMaskEdit;
    TabSheet3: TTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label29: TLabel;
    Label32: TLabel;
    Me7Nome: TMaskEdit;
    Me7TipoProduto: TMaskEdit;
    Cb7Cadastro: TCheckBox;
    Cb7TipoProduto: TCheckBox;
    Me7Cadastro: TMaskEdit;
    Cb7Situacao: TComboBox;
    TabSheet4: TTabSheet;
    ME8CodFilial: TMaskEdit;
    ME8Filial: TMaskEdit;
    ME8CodProduto: TMaskEdit;
    ME8Produto: TMaskEdit;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    ME8Data: TMaskEdit;
    ME8Volumes: TMaskEdit;
    Label33: TLabel;
    ME8CodBarra: TMaskEdit;
    Label34: TLabel;
    ME8NrCopias: TMaskEdit;
    Label35: TLabel;
    TabSheet5: TTabSheet;
    SpeedButton12: TSpeedButton;
    Label36: TLabel;
    Me9CodFilial: TMaskEdit;
    Me9Filial: TMaskEdit;
    Label37: TLabel;
    Me9CodProduto: TMaskEdit;
    SpeedButton13: TSpeedButton;
    Me9Produto: TMaskEdit;
    Label38: TLabel;
    Me9CodLote: TMaskEdit;
    SpeedButton14: TSpeedButton;
    Me9Lote: TMaskEdit;
    Label39: TLabel;
    Me2DtAlteracao: TMaskEdit;
    Me9DtReferencia: TMaskEdit;
    Label40: TLabel;
    TabSheet6: TTabSheet;
    Label41: TLabel;
    ME6CodFilial: TMaskEdit;
    SB6ConsultaFilial: TSpeedButton;
    ME6DescFilial: TMaskEdit;
    Label42: TLabel;
    ME6Classe_I: TMaskEdit;
    SpeedButton16: TSpeedButton;
    ME6DClasseI: TMaskEdit;
    Label43: TLabel;
    ME6Classe_F: TMaskEdit;
    SB6ConsClasse_F: TSpeedButton;
    ME6DClasseF: TMaskEdit;
    GroupBox2: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    ME_Saldo: TMaskEdit;
    TabSheet7: TTabSheet;
    Label47: TLabel;
    ME10CodFilial: TMaskEdit;
    B10ConsultaFilial: TSpeedButton;
    ME10DescFilial: TMaskEdit;
    ME10CodFornecedor: TMaskEdit;
    Label48: TLabel;
    B10Fornecedor: TSpeedButton;
    ME10DescFornecedor: TMaskEdit;
    Label49: TLabel;
    ME10CodProduto: TMaskEdit;
    B10Produto: TSpeedButton;
    ME10DescProduto: TMaskEdit;
    RGOrdem10: TRadioGroup;
    Label50: TLabel;
    ME10NumClasse: TMaskEdit;
    B10NumClasse: TSpeedButton;
    CB10NumClasse: TCheckBox;
    ME10NumSubClasse: TMaskEdit;
    Label51: TLabel;
    CB10NumSubClasse: TCheckBox;
    Edit10DescClasse: TEdit;
    TabSheet8: TTabSheet;
    Label52: TLabel;
    ME11CodFilial: TMaskEdit;
    SB11FilialCons: TSpeedButton;
    ME11FilialDesc: TMaskEdit;
    Label53: TLabel;
    ME11NumClasseI: TMaskEdit;
    SB11ConsClasseI: TSpeedButton;
    ME11ClasseDescI: TMaskEdit;
    Label54: TLabel;
    ME11NumClasseF: TMaskEdit;
    SB11ClasseConsF: TSpeedButton;
    ME11ClasseDescF: TMaskEdit;
    GroupBox3: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    ME11DataI: TMaskEdit;
    ME11DataF: TMaskEdit;
    ME6Data_I: TMaskEdit;
    ME6Data_F: TMaskEdit;
    TabSheet9: TTabSheet;
    Label57: TLabel;
    SBCadastroCons: TSpeedButton;
    MECadastroNome: TMaskEdit;
    Label58: TLabel;
    SBProdutoCons: TSpeedButton;
    MEProdutoDesc: TMaskEdit;
    RGOpcao: TRadioGroup;
    EdCodCadastro: TEdit;
    EdCodProduto: TEdit;
    Rg5Preco: TRadioGroup;
    Me5CodBarras: TMaskEdit;
    Label59: TLabel;
    TabSheet10: TTabSheet;
    Label60: TLabel;
    ME14Produto: TMaskEdit;
    SpeedButton15: TSpeedButton;
    ME14DescProduto: TMaskEdit;
    ME14NumCopias: TMaskEdit;
    Label61: TLabel;
    TabSheet11: TTabSheet;
    Label62: TLabel;
    SpeedButton17: TSpeedButton;
    Me15CodFilial: TMaskEdit;
    Me15DescFilial: TMaskEdit;
    GroupBox4: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Me15DtInicial: TMaskEdit;
    Me15DtFinal: TMaskEdit;
    Label64: TLabel;
    SpeedButton18: TSpeedButton;
    Me15CodProduto: TMaskEdit;
    Me15DescProduto: TMaskEdit;
    Label63: TLabel;
    SpeedButton19: TSpeedButton;
    Me15CodLote: TMaskEdit;
    Me15Lote: TMaskEdit;
    Label65: TLabel;
    BitBtn2: TBitBtn;
    CBTodosPromocao: TCheckBox;
    MEDescPromocao: TMaskEdit;
    TabSheet12: TTabSheet;
    Label68: TLabel;
    ME16CodFilial: TMaskEdit;
    SpeedButton20: TSpeedButton;
    ME16DescFilial: TMaskEdit;
    Label69: TLabel;
    ME16CodProduto: TMaskEdit;
    SpeedButton21: TSpeedButton;
    ME16DescProduto: TMaskEdit;
    GroupBox5: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    ME16DtInicial: TMaskEdit;
    ME16DtFinal: TMaskEdit;
    Label72: TLabel;
    ME16CodFornecedor: TMaskEdit;
    SpeedButton22: TSpeedButton;
    ME16DescFornecedor: TMaskEdit;
    Label73: TLabel;
    Ed5Situacao: TEdit;
    Label74: TLabel;
    ed5Preco: TEdit;
    Label75: TLabel;
    ME14Produto2: TMaskEdit;
    SpeedButton23: TSpeedButton;
    ME14DescProduto2: TMaskEdit;
    Label76: TLabel;
    ME14NumCopias2: TMaskEdit;
    Label77: TLabel;
    ME14Produto3: TMaskEdit;
    SpeedButton24: TSpeedButton;
    ME14DescProduto3: TMaskEdit;
    Label78: TLabel;
    ME14NumCopias3: TMaskEdit;
    Label79: TLabel;
    ME14Produto4: TMaskEdit;
    SpeedButton25: TSpeedButton;
    ME14DescProduto4: TMaskEdit;
    ME14NumCopias4: TMaskEdit;
    Label80: TLabel;
    Label81: TLabel;
    ME14Produto5: TMaskEdit;
    SpeedButton26: TSpeedButton;
    ME14DescProduto5: TMaskEdit;
    ME14NumCopias5: TMaskEdit;
    Label82: TLabel;
    Label83: TLabel;
    ME14Produto6: TMaskEdit;
    SpeedButton27: TSpeedButton;
    ME14DescProduto6: TMaskEdit;
    ME14NumCopias6: TMaskEdit;
    Label84: TLabel;
    Cb10Situacao: TComboBox;
    Label85: TLabel;
    Label86: TLabel;
    ME15DtInventario: TMaskEdit;
    ME15QT_Inventario: TMaskEdit;
    Label87: TLabel;
    TabSheet13: TTabSheet;
    Label88: TLabel;
    ME17Filial: TMaskEdit;
    SB17Filial: TSpeedButton;
    Label89: TLabel;
    ME17Produto: TMaskEdit;
    SB17Produto: TSpeedButton;
    GroupBox6: TGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    ME17DtInicial: TMaskEdit;
    ME17DtFinal: TMaskEdit;
    Ed17Filial: TEdit;
    Ed17Produto: TEdit;
    Rg16Tipo: TRadioGroup;
    Rg15Opcao: TRadioGroup;
    Label92: TLabel;
    Me2DtValidade: TMaskEdit;
    TabSheet14: TTabSheet;
    ME18Produto: TMaskEdit;
    ME18Marca: TMaskEdit;
    SB18Produto: TSpeedButton;
    SB18Marca: TSpeedButton;
    Ed18Produto: TEdit;
    Ed18Marca: TEdit;
    Label93: TLabel;
    Label94: TLabel;
    TabSheet15: TTabSheet;
    Label95: TLabel;
    ME19Filial: TMaskEdit;
    SpeedButton28: TSpeedButton;
    ED19Filial: TEdit;
    SpeedButton29: TSpeedButton;
    ED19Produto: TEdit;
    ME19Produto: TMaskEdit;
    Label96: TLabel;
    GroupBox7: TGroupBox;
    Label97: TLabel;
    Label98: TLabel;
    ME19DtInicial: TMaskEdit;
    ME19DtFinal: TMaskEdit;
    Label99: TLabel;
    ME19Lote: TMaskEdit;
    SpeedButton30: TSpeedButton;
    ED19Lote: TMaskEdit;
    Label100: TLabel;
    ME19Classe: TMaskEdit;
    SpeedButton31: TSpeedButton;
    ED19Classe: TMaskEdit;
    TabSheet16: TTabSheet;
    SB20Produto: TSpeedButton;
    ME20Produto: TMaskEdit;
    Ed20Produto: TEdit;
    ME20NrCopia: TMaskEdit;
    Label101: TLabel;
    Label102: TLabel;
    TabSheet17: TTabSheet;
    Label103: TLabel;
    ME21Filial: TMaskEdit;
    SpeedButton32: TSpeedButton;
    GroupBox8: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    ME21Data_I: TMaskEdit;
    ME21Data_F: TMaskEdit;
    ED21Filial: TEdit;
    GroupBox9: TGroupBox;
    Label104: TLabel;
    Label105: TLabel;
    ME21Data_I_ant: TMaskEdit;
    ME21Data_F_ant: TMaskEdit;
    RG14Preco: TRadioGroup;
    Label108: TLabel;
    ME8CodFilial2: TMaskEdit;
    SpeedButton33: TSpeedButton;
    ME8Filial2: TMaskEdit;
    Label109: TLabel;
    ME8CodProduto2: TMaskEdit;
    SpeedButton34: TSpeedButton;
    ME8Produto2: TMaskEdit;
    Label110: TLabel;
    ME8Data2: TMaskEdit;
    ME8Volumes2: TMaskEdit;
    Label111: TLabel;
    Label112: TLabel;
    ME8NrCopias2: TMaskEdit;
    ME8CodBarra2: TMaskEdit;
    Label113: TLabel;
    TabSheet18: TTabSheet;
    SpeedButton36: TSpeedButton;
    Label115: TLabel;
    Me22Produto: TMaskEdit;
    Ed22Produto: TEdit;
    SpeedButton37: TSpeedButton;
    Label116: TLabel;
    Me22Uf: TMaskEdit;
    Ed22Uf: TEdit;
    Label117: TLabel;
    ME21Vendedor: TMaskEdit;
    SpeedButton38: TSpeedButton;
    ed21Vendedor: TEdit;
    TabSheet19: TTabSheet;
    ME23Dias: TMaskEdit;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    SpeedButton39: TSpeedButton;
    ME16DescLote: TMaskEdit;
    ME16Lote: TMaskEdit;
    Label121: TLabel;
    Me1Descricao: TMaskEdit;
    Label122: TLabel;
    Label123: TLabel;
    ME5NumEtiquetasImp: TMaskEdit;
    Fm13Classe: TFmClasse;
    TabSheet20: TTabSheet;
    ME24Codigo: TMaskEdit;
    Label124: TLabel;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    Fm26Produto: TFmProduto;
    Fm26Marca: TFmMarca;
    RG2Precos: TRadioGroup;
    Fm2Classe: TFmClasse;
    Fm2Marca: TFmMarca;
    FmDepartamento16: TFmDepartamento;
    TabSheet23: TTabSheet;
    FmProduto23: TFmProduto;
    TabSheet24: TTabSheet;
    Label129: TLabel;
    Label134: TLabel;
    CB28Ordem: TComboBox;
    ME28Localizacao: TMaskEdit;
    Label127: TLabel;
    ME28Secao: TMaskEdit;
    Label128: TLabel;
    ME28Boqueta: TMaskEdit;
    TabSheet25: TTabSheet;
    Fm29Produto: TFmProduto;
    Fm29Lote: TFmLote;
    Me24Data: TMaskEdit;
    Label130: TLabel;
    Fm24Produto: TFmProduto;
    Me24Peso: TMaskEdit;
    Label131: TLabel;
    rg24Cancelamento: TRadioGroup;
    TabSheet26: TTabSheet;
    me30CodPesagemProd: TMaskEdit;
    Label132: TLabel;
    Panel1: TPanel;
    DBText1: TDBText;
    Label133: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    TabSheet27: TTabSheet;
    RG31Custo: TRadioGroup;
    TabSheet28: TTabSheet;
    FmProduto32: TFmProduto;
    FmLote32: TFmLote;
    Label140: TLabel;
    Me32Etiquetas: TMaskEdit;
    FmUsuario32: TFmUsuario;
    FmData32: TFmDatas;
    MEEtiqueta32: TMaskEdit;
    LEtiqueta: TLabel;
    CBResumo32: TCheckBox;
    TabSheet29: TTabSheet;
    GroupBox10: TGroupBox;
    Label141: TLabel;
    Fm33Produto: TFmProduto;
    Me33Quantidade: TMaskEdit;
    TabSheet30: TTabSheet;
    Label142: TLabel;
    ME34PesagemIni: TMaskEdit;
    ME34PesagemFim: TMaskEdit;
    Label143: TLabel;
    RG34AtualizarEstoque: TRadioGroup;
    TabSheet31: TTabSheet;
    FmProduto35: TFmProduto;
    Rg35Ordem: TRadioGroup;
    CB15Implantacao: TCheckBox;
    RG32Situacao: TRadioGroup;
    RG14CodBarra: TRadioGroup;
    Fm23Classe: TFmClasse;
    Fm23Filial: TFmFilial;
    Rg23Estoque: TRadioGroup;
    Rg23Ordem: TRadioGroup;
    TabSheet32: TTabSheet;
    Fm36Produto: TFmProduto;
    Fm36Vendedor: TFmVendedor;
    Fm36Motivo: TFmMotivo;
    Fm36Datas: TFmDatas;
    Rg36CodigoProduto: TRadioGroup;
    Label144: TLabel;
    TabSheet33: TTabSheet;
    FmProduto37: TFmProduto;
    FmNcm37: TFmNcm;
    CB37Ordem: TComboBox;
    Label145: TLabel;
    TabSheet34: TTabSheet;
    TabSheet35: TTabSheet;
    FmDatas39: TFmDatas;
    Fm18Filial: TFmFilial;
    Fm3SubClasse: TFmSubClasse;
    Rg3Situacao: TRadioGroup;
    Rg3Estoque: TRadioGroup;
    TabSheet36: TTabSheet;
    Fm40Datas: TFmDatas;
    Fm0SubClasse1: TFmSubClasse;
    Fm0SubClasse2: TFmSubClasse;
    RG32Tipo: TRadioGroup;
    GroupBox11: TGroupBox;
    CB2PrecoCusto: TCheckBox;
    Cb2Vencimento: TCheckBox;
    Cb2Unidade: TCheckBox;
    Cb2Embalagem: TCheckBox;
    CB2Tributacao: TCheckBox;
    RG2Codigo: TRadioGroup;
    Rg23Exibir: TRadioGroup;
    FmClasse35: TFmClasse;
    RG38Produtos: TRadioGroup;
    Label1: TLabel;
    CB37Situacao: TComboBox;
    Label2: TLabel;
    Me38CodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Me38Filial: TMaskEdit;
    TabSheet37: TTabSheet;
    Fm41Produto: TFmProduto;
    Fm41SubClasse: TFmSubClasse;
    RG41Modo: TRadioGroup;
    RG41QtdeEtiquetas: TRadioGroup;
    Me41QtdeEtiquetas: TMaskEdit;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    ME14Filial: TMaskEdit;
    ME14Lote: TMaskEdit;
    TabSheet38: TTabSheet;
    FmProduto42: TFmProduto;
    MeEtiqueta42: TMaskEdit;
    Label149: TLabel;
    cb1TipoDescricao: TComboBox;
    TabSheet39: TTabSheet;
    RG43Situacao: TRadioGroup;
    Label150: TLabel;
    Me43CodTabelaPreco: TMaskEdit;
    SpeedButton40: TSpeedButton;
    Me43TabelaPreco: TMaskEdit;
    Rg21Ordem: TRadioGroup;
    Fm21SubClasse: TFmSubClasse;
    FmSubClasse43: TFmSubClasse;
    RG43Ordem: TRadioGroup;
    RG41Etiqueta: TRadioGroup;
    RGComCest: TRadioGroup;
    RG37Situacao: TRadioGroup;
    TabSheet40: TTabSheet;
    LblPorcentagem: TLabel;
    Me44Porcentagem: TMaskEdit;
    FmFilial25: TFmFilial;
    FmProdutoInicial25: TFmProduto;
    FmProdutoFinal25: TFmProduto;
    FmLote25: TFmLote;
    FmCadastro25: TFmCadastro;
    Label308: TLabel;
    MEClasse25: TMaskEdit;
    MESubclasse25: TMaskEdit;
    Label309: TLabel;
    BtClasse25: TBitBtn;
    EdClasse25: TEdit;
    MEnumclasse25: TMaskEdit;
    GroupBox25: TGroupBox;
    Label114: TLabel;
    MEDataI25: TMaskEdit;
    MEDataF25: TMaskEdit;
    RgOrdem25: TRadioGroup;
    RgProdComSaida25: TRadioGroup;
    FmOperacao25: TFmOperacao;
    Fmperacao25: TFmOperacao;
    FmNota25: TFmNota;
    Gb25DtSaida: TGroupBox;
    Label126: TLabel;
    Label151: TLabel;
    Me25DtSaidaI: TMaskEdit;
    ME25DtSaidaF: TMaskEdit;
    Label125: TLabel;
    CB37TipoProduto: TComboBox;
    Label152: TLabel;
    Label153: TLabel;
    RG41Valor: TRadioGroup;
    TabSheet41: TTabSheet;
    Fm45Classe: TFmClasse;
    Label154: TLabel;
    RG0MostrarValores: TRadioGroup;
    RG41Artista: TRadioGroup;
    Label155: TLabel;
    MeLote42: TMaskEdit;
    FmMarca1: TFmMarca;
    Fm41Datas: TFmDatas;
    RgTipoRelatorio: TRadioGroup;
    RG45TipoBalanca: TRadioGroup;
    RG0MostrarCodDesc: TRadioGroup;
    Fm0Fornecedor: TFmCadastro;
    GB3Data: TGroupBox;
    Label156: TLabel;
    Label157: TLabel;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    RG1Codigo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure SB1CadastroClick(Sender: TObject);
    procedure SB1TipoProdutoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure CB0TipoProdutoClick(Sender: TObject);
    procedure CB2TipoProdutoClick(Sender: TObject);
    procedure ME2TipoProdutoChange(Sender: TObject);
    procedure CB1CadastroClick(Sender: TObject);
    procedure ME1CodChange(Sender: TObject);
    procedure CB1TipoProdutoClick(Sender: TObject);
    procedure ME1TipoProdutoChange(Sender: TObject);
    procedure CB1FilialClick(Sender: TObject);
    procedure ME1CodFilialChange(Sender: TObject);
    procedure ME0TipoProdutoChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CB6TodosClick(Sender: TObject);
    procedure Me2CodigoChange(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Cb2CadastroClick(Sender: TObject);
    procedure Me7TipoProdutoChange(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Cb7CadastroClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Cb7TipoProdutoClick(Sender: TObject);
    procedure Me7CadastroChange(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME8CodFilialExit(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME8CodProdutoExit(Sender: TObject);
    procedure Me9CodProdutoExit(Sender: TObject);
    procedure Me9CodFilialExit(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Me9CodLoteExit(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Me9DtReferenciaEnter(Sender: TObject);
    procedure ME6CodFilialExit(Sender: TObject);
    procedure SB6ConsultaFilialClick(Sender: TObject);
    procedure ME6Classe_IChange(Sender: TObject);
    procedure ME6Classe_FChange(Sender: TObject);
    procedure SB6ConsClasse_I(Sender: TObject);
    procedure SB6ConsClasse_FClick(Sender: TObject);
    procedure ME10CodFilialExit(Sender: TObject);
    procedure B10ConsultaFilialClick(Sender: TObject);
    procedure ME10CodFornecedorExit(Sender: TObject);
    procedure B10FornecedorClick(Sender: TObject);
    procedure ME10CodProdutoExit(Sender: TObject);
    procedure B10ProdutoClick(Sender: TObject);
    procedure Bt10ClasseClick(Sender: TObject);
    procedure ME10NumSubClasseChange(Sender: TObject);
    procedure B10NumClasseClick(Sender: TObject);
    procedure CB10NumClasseClick(Sender: TObject);
    procedure CB10NumSubClasseClick(Sender: TObject);
    procedure ME11CodFilialExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ME10NumClasseChange(Sender: TObject);
    procedure ME11NumClasseIChange(Sender: TObject);
    procedure ME11NumClasseFChange(Sender: TObject);
    procedure EdCodCadastroChange(Sender: TObject);
    procedure EdCodProdutoChange(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
    procedure SB11ConsClasseIClick(Sender: TObject);
    procedure SB11ClasseConsFClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure Me15CodFilialExit(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure Me15CodProdutoExit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure Me15CodLoteExit(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CBTodosPromocaoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ME16CodFilialExit(Sender: TObject);
    procedure ME16CodFornecedorExit(Sender: TObject);
    procedure ME16CodProdutoExit(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ME5CodProdutoChange(Sender: TObject);
    procedure ME14ProdutoChange(Sender: TObject);
    procedure Me5CodBarrasExit(Sender: TObject);
    procedure ME5CodProdutoExit(Sender: TObject);
    procedure ME14Produto2Change(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure ME14Produto3Change(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure ME14Produto4Exit(Sender: TObject);
    procedure ME14Produto5Change(Sender: TObject);
    procedure ME14Produto6Change(Sender: TObject);
    procedure ME17FilialExit(Sender: TObject);
    procedure SB17FilialClick(Sender: TObject);
    procedure ME17ProdutoExit(Sender: TObject);
    procedure SB17ProdutoClick(Sender: TObject);
    procedure SB18ProdutoClick(Sender: TObject);
    procedure ME18ProdutoExit(Sender: TObject);
    procedure SB18MarcaClick(Sender: TObject);
    procedure ME18MarcaExit(Sender: TObject);
    procedure ME19FilialExit(Sender: TObject);
    procedure ME19ProdutoExit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure ME19LoteExit(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure ME19ClasseChange(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SB20ProdutoClick(Sender: TObject);
    procedure ME20ProdutoExit(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure ME8CodFilial2Exit(Sender: TObject);
    procedure ME8CodProduto2Exit(Sender: TObject);
    procedure ME21FilialExit(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure Me22ProdutoExit(Sender: TObject);
    procedure Me22UfExit(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure ME21VendedorExit(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure ME16LoteExit(Sender: TObject);
    procedure Fm2ClasseBtClasseClick(Sender: TObject);
    procedure Fm2ClasseMeClasseExit(Sender: TObject);
    procedure ME24CodigoExit(Sender: TObject);
    procedure me30CodPesagemProdExit(Sender: TObject);
    procedure me30CodPesagemProdChange(Sender: TObject);
    procedure FmProduto32BtProdutoClick(Sender: TObject);
    procedure FmLote32BtLoteClick(Sender: TObject);
    procedure ME34PesagemIniKeyPress(Sender: TObject; var Key: Char);
    procedure ME34PesagemFimKeyPress(Sender: TObject; var Key: Char);
    procedure SENumEtiquetasExit(Sender: TObject);
    procedure Me38CodFilialExit(Sender: TObject);
    procedure RG41ModoClick(Sender: TObject);
    procedure RG41QtdeEtiquetasClick(Sender: TObject);
    procedure Me43CodTabelaPrecoExit(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure Fm41ProdutoBtProdutoClick(Sender: TObject);
    procedure BtClasse25Click(Sender: TObject);
    procedure MEClasse25Exit(Sender: TObject);
    procedure MESubclasse25Exit(Sender: TObject);
    procedure ME14Produto4Change(Sender: TObject);
    //procedure Me15DtInicialChange(Sender: TObject);
   // procedure GroupBox4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoParam: TFProdutoParam;


implementation

uses UClasseCons, UOracle_cl, URProduto_Classe, UCadastroCons,
  UTipoProdCons, UProduto_cl, UFilialCons, UFilial_cl,
  UProdutoCons, UEstoque_cl, UParamSistema_cl, UTipoLoteCons, UTipoLote_cl,
  UUsuario_cl, UClasse_cl, UCadastro_cl, UProdutoPromocaoCons, UMarcaCons,
  UMarca_cl, UEstadoCons, UEstado_cl, UVendedorCons, UVendedor_cl,
  UTabelaPreco_cl, UtabelaPrecoCons;

{$R *.DFM}

procedure TFProdutoParam.FormCreate(Sender: TObject);
begin
  inherited;
//  CB0Ordem.ItemIndex := 0;
  CB1Ordem.ItemIndex := 0;
  CB2Ordem.ItemIndex := 0;
  CB10Situacao.ItemIndex := 0;
  CLB3Etiquetas.Checked[0] := True;
  CLB3Etiquetas.Checked[1] := True;
  CLB3Etiquetas.Checked[2] := True;
//  CLB3Etiquetas.Checked[2] := True;
//  CLB3Etiquetas.Checked[3] := True;
//  CLB3Etiquetas.Checked[4] := True;
//  CB0Situacao.ItemIndex := 0;
  CB1Situacao.ItemIndex := 0;
  CB2Situacao.ItemIndex := 0;
  CB7Situacao.ItemIndex := 0;
  ME9CodFilial.Text := FloatToStr(DMParamSistema.QParamSistemaCOD_FILIAL.Value);
  // Fixa o Primeiro item do ComboBox como campo a ser ordenado
  MEDataI25.Text := copy(DMOracle.QDataServDTSERVIDOR.Text,1,10);
  MEDataF25.Text := copy(DMOracle.QDataServDTSERVIDOR.Text,1,10);
  if (DMParamSistema.CodEmpresa = 'NEOALI') then //Tipo de Etiqueta 8x3 e filtro valor na etiqueta. Junior - 23/01/2019
  begin
    RG41Etiqueta.ItemIndex := 1;
    RG41Valor.Visible := True;
    RG41Artista.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'JBATACADO') then
  begin
    RG41Valor.Visible := True;
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
    RG41Etiqueta.ItemIndex := 4;
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
    RG41Valor.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'DONABENTA') then
  begin
    RG41Valor.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
  end;
  if (DMParamSistema.CodEmpresa = 'MAVENIDA') or (DMParamSistema.CodEmpresa = 'LACARNES') or
     (DMParamSistema.CodEmpresa = 'FINESTRA') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
    Me41QtdeEtiquetas.Text := '1';
    RG41Etiqueta.ItemIndex := 1;
  end;
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
    ME14Lote.Text := '1';
  end;
  if (DMParamSistema.CodEmpresa = 'FRACTA') or (DMParamSistema.CodEmpresa = 'DONNA') or
     (DMParamSistema.CodEmpresa = 'NFCE-SHADA') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') then
  begin
    RG41Valor.Visible := True;
    RG41Valor.ItemIndex := 1;
    Fm41Datas.Visible := True;
    Fm41Datas.Top := 420;
  end;
  if (DMParamSistema.CodEmpresa = 'GGIRARDI') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
    RG41Etiqueta.ItemIndex := 3;
  end;
//Kelly da Pateli solicitou que usuarios não privilegiados não tenham acesso ao custo. Alex 22/08/2023
  if (DMParamSistema.CodEmpresa = 'PATELI') and (DMUsuario.Privilegiado = False) then
    CB2PrecoCusto.Enabled := False;
  if (DMParamSistema.CodEmpresa = 'FERRAGENS') then
  begin
    RG41Modo.ItemIndex := 1;
    RG41QtdeEtiquetas.ItemIndex := 1;
  end;
  if (DMParamSistema.CodEmpresa = 'DINIZ') or (DMParamSistema.CodEmpresa = 'SCALA') then
  begin
    RG1Codigo.ItemIndex := 1;
  end;
  Fm45Classe.Visible := False;
  Label154.Visible := False;
end;

procedure TFProdutoParam.SB1CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME1Cod.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.value);
    ME1Cadastro.Text := DMCadastro.QCadastroConsNome.value;
  end;
end;

procedure TFProdutoParam.SB1TipoProdutoClick(Sender: TObject);
begin
  inherited;
  if FTipoProdCons = nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  if FTipoProdCons.ShowModal = mrOk then
  begin
    ME1TipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.value;
  end;
end;

procedure TFProdutoParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCOns.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME38CodFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    ME38Filial.Text := DMFilial.QFilialConsDesc_Filial.value;
    ME38CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FTipoProdCons = nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  if FTipoProdCons.ShowModal = mrOk then
  begin
    ME2TipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.value;
  end;
end;


procedure TFProdutoParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FTipoProdCons = nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  if FTipoProdCons.ShowModal = mrOk then
  begin
    ME0TipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.value;
    CB0TipoProduto.Checked := False;
  end;
end;

procedure TFProdutoParam.CB0TipoProdutoClick(Sender: TObject);
begin
  inherited;
  if CB0TipoProduto.Checked then
    ME0Tipoproduto.Clear;
end;

procedure TFProdutoParam.CB2TipoProdutoClick(Sender: TObject);
begin
  inherited;
  if CB2TipoProduto.Checked then
    ME2Tipoproduto.Clear;
end;

procedure TFProdutoParam.ME2TipoProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2TipoProduto.Text) <> '' then
    CB2TipoProduto.Checked := False;
end;

procedure TFProdutoParam.CB1CadastroClick(Sender: TObject);
begin
  inherited;
  if CB1Cadastro.Checked then
  begin
    ME1Cadastro.Clear;
    ME1Cod.Clear;
  end;
end;

procedure TFProdutoParam.ME1CodChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1Cod.Text) <> '' then
  begin
    CB1Cadastro.Checked := False;
  end;
end;

procedure TFProdutoParam.CB1TipoProdutoClick(Sender: TObject);
begin
  inherited;
  if CB1TipoProduto.Checked then
    ME1Tipoproduto.Clear;
end;

procedure TFProdutoParam.ME1TipoProdutoChange(Sender: TObject);
begin
  inherited;
  if trim(ME1TipoProduto.text) <> '' then
    CB1TipoProduto.Checked := False;
end;

procedure TFProdutoParam.CB1FilialClick(Sender: TObject);
begin
  inherited;
  if CB1Filial.Checked then
  begin
    ME1Filial.Clear;
    ME1CodFilial.Clear;
  end;
end;

procedure TFProdutoParam.ME1CodFilialChange(Sender: TObject);
begin
  inherited;
  if trim(ME1CodFilial.text) <> '' then
  begin
    CB1Filial.Checked := False;
    ME1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + TRIM(ME1CodFilial.Text));
  end
end;

procedure TFProdutoParam.ME0TipoProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0TipoProduto.text) <> '' then
    CB0TipoProduto.Checked := False;
end;

procedure TFProdutoParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if (FProdutoCons.Showmodal = mrok) then
     If Trim(Me3CodProduto.text) <> '' Then
        Me3CodProduto.text := Me3CodProduto.text + ',' + DMProduto.QProdutoConsCod_Produto.Text
     Else
        Me3CodProduto.text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if (FProdutoCons.Showmodal = mrok) then
  begin
    ME5CodProduto.text := FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
    ME5CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.CB6TodosClick(Sender: TObject);
begin
  inherited;
  if CB6Todos.Checked then
    ME6TipoProduto.Clear;
end;

procedure TFProdutoParam.Me2CodigoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2Codigo.Text) <> '' then
  begin
    ME2Fabricante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + ME2Codigo.Text);
    CB2Cadastro.Checked := False;
  end
  else
  begin
    ME2Codigo.Clear;
    CB2Cadastro.Checked := True;
  end;
end;

procedure TFProdutoParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME2Codigo.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.value);
    ME2Fabricante.Text := DMCadastro.QCadastroConsNome.value;
  end;
end;

procedure TFProdutoParam.Cb2CadastroClick(Sender: TObject);
begin
  inherited;
  if CB2Cadastro.Checked then
  begin
    ME2Fabricante.Clear;
    ME2Codigo.Clear;
  end;

end;

procedure TFProdutoParam.Me7TipoProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME7TipoProduto.Text) <> '' then
    CB7TipoProduto.Checked := False;

end;

procedure TFProdutoParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME7Cadastro.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.value);
    ME7Nome.Text := DMCadastro.QCadastroConsNome.value;
  end;

end;

procedure TFProdutoParam.Cb7CadastroClick(Sender: TObject);
begin
  inherited;
  if CB7Cadastro.Checked then
  begin
    ME7Nome.Clear;
    ME7Cadastro.Clear;
  end;

end;

procedure TFProdutoParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FTipoProdCons = nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  if FTipoProdCons.ShowModal = mrOk then
  begin
    ME7TipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.value;
  end;
end;

procedure TFProdutoParam.Cb7TipoProdutoClick(Sender: TObject);
begin
  inherited;
  if CB7TipoProduto.Checked then
    ME7TipoProduto.Clear;

end;

procedure TFProdutoParam.Me7CadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(ME7Cadastro.Text) <> '' then
  begin
    ME7Nome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + ME7Cadastro.Text);
    CB7Cadastro.Checked := False;
  end
  else
  begin
    ME7Nome.Clear;
    CB7Cadastro.Checked := True;
  end;

end;

procedure TFProdutoParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME8CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME8CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.ME8CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodFilial.Text) <> '' then
    ME8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME8CodFilial.Text)
  else
    ME8Filial.Clear;
end;

procedure TFProdutoParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
  begin
    ME8CodProduto.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME8CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.ME8CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodProduto.text) <> '' then
    ME8Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + ME8CodProduto.text);
  if Trim(ME8CodProduto.text) <> '' then
    ME8CodBarra.Text := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO',
      'COD_PRODUTO = ' + ME8CodProduto.text)
  else
    ME8Produto.Clear;
end;

procedure TFProdutoParam.Me9CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodProduto.text) <> '' then
    ME9Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + ME9CodProduto.text)
  else
    ME9Produto.Clear;

end;

procedure TFProdutoParam.Me9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.Text) <> '' then
    ME9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME9CodFilial.Text)
  else
    ME9Filial.Clear;

end;

procedure TFProdutoParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME9CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9CodFilialExit(Self);
  end;

end;

procedure TFProdutoParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
  begin
    ME9CodProduto.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME9CodProdutoExit(Self);
  end;

end;

procedure TFProdutoParam.Me9CodLoteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodLote.text) <> '' then
    ME9Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
      'COD_LOTE_TIPO = ' + TRIM(ME9CodLote.text))
  else
    ME9Lote.Clear;

end;

procedure TFProdutoParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = mrOK then
  begin
    ME9CodLote.text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME9CodLoteExit(Self);
  end;

end;

procedure TFProdutoParam.Me9DtReferenciaEnter(Sender: TObject);
begin
  inherited;
  if (Trim(ME9CodProduto.Text) <> '') and
    (Trim(ME9CodLote.Text) <> '') and
    (Trim(ME9CodFilial.Text) <> '') then
    Me9DtReferencia.Text := DMOracle.BuscaNome('SELECT DT_INVENTARIO FROM TB_ESTOQUE',
      'TB_ESTOQUE.COD_PRODUTO=' + Trim(ME9CodProduto.Text) +
      ' AND TB_ESTOQUE.COD_LOTE_TIPO=' + Trim(ME9CodLote.Text) +
      ' AND TB_ESTOQUE.COD_FILIAL=' + Trim(ME9CodFilial.Text));
end;

procedure TFProdutoParam.ME6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodFilial.Text) <> '' then
    ME6DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME6CodFilial.Text)
  else
    ME6DescFilial.Text := 'Todas'

end;

procedure TFProdutoParam.SB6ConsultaFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME6CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME6CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.ME6Classe_IChange(Sender: TObject);
begin
  inherited;
  if Trim(Me6Classe_I.Text) <> '' then
    ME6DClasseI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
      'NUM_CLASSE = ' + Me6Classe_I.Text)
  else
    ME6DClasseI.Clear;
end;

procedure TFProdutoParam.ME6Classe_FChange(Sender: TObject);
begin
  inherited;
  if Trim(Me6Classe_F.Text) <> '' then
    ME6DClasseF.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
      'NUM_CLASSE = ' + Me6Classe_F.Text)
  else
    ME6DClasseF.Clear;
end;

procedure TFProdutoParam.SB6ConsClasse_I(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    ME6Classe_I.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  end;

end;

procedure TFProdutoParam.SB6ConsClasse_FClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    ME6Classe_F.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  end;
end;

procedure TFProdutoParam.ME10CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodFilial.Text) <> '' then
    ME10DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + Trim(ME10CodFilial.Text))
  else
    ME10DescFilial.Text := 'Todas';
end;

procedure TFProdutoParam.B10ConsultaFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME10CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME10CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.ME10CodFornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodFornecedor.Text) <> '' then
    ME10DescFornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + Trim(ME10CodFornecedor.Text))
  else
    ME10DescFornecedor.Text := 'Todos';
end;

procedure TFProdutoParam.B10FornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME10CodFornecedor.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME10CodFornecedorExit(Self);
  end;
end;

procedure TFProdutoParam.ME10CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodProduto.Text) <> '' then
    ME10DescProduto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME10CodProduto.Text))
  else
    ME10DescProduto.Text := 'Todos';
end;

procedure TFProdutoParam.B10ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    ME10CodProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME10CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.Bt10ClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME10NumCLasse.Text := FloatToStr(DMClasse.QClasseConsNUM_CLASSE.Value);
    ME10NumSubCLasse.Text := FloatToStr(DMClasse.QClasseConsNUM_SUBCLASSE.Value);
    Edit10DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
      'NUM_CLASSE = ' + ME10NumClasse.Text + ' AND NUM_SUBCLASSE = ' + ME10NumSubClasse.Text);
  end;

end;

procedure TFProdutoParam.ME10NumSubClasseChange(Sender: TObject);
begin
  inherited;
  if (ME10NumSubClasse.Text <> '') then
  begin
    CB10NumSubClasse.Checked := false;
    if (ME10NumCLasse.Text <> '') then
      Edit10DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
        'NUM_CLASSE = ' + ME10NumClasse.Text +
        ' AND NUM_SUBCLASSE = ' + ME10NumSubClasse.Text)
    else
      Edit10DescClasse.Text := '';
  end
  else
  begin
    CB10NumSubCLasse.Checked := true;
    Edit10DescClasse.Clear;
  end;
end;

procedure TFProdutoParam.B10NumClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME10NumCLasse.Text := FloatToStr(DMClasse.QClasseConsNUM_CLASSE.Value);
    ME10NumSubCLasse.Text := FloatToStr(DMClasse.QClasseConsNUM_SUBCLASSE.Value);
    Edit10DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + ME10NumClasse.Text + ' AND NUM_SUBCLASSE = ' + ME10NumSubClasse.Text);
    CB10NumClasse.Checked := false;
    CB10NumSubClasse.Checked := false;
  end;

end;

procedure TFProdutoParam.CB10NumClasseClick(Sender: TObject);
begin
  inherited;
  if CB10NumClasse.Checked then
    ME10NumClasse.Clear;

end;

procedure TFProdutoParam.CB10NumSubClasseClick(Sender: TObject);
begin
  inherited;
  if CB10NumSubClasse.Checked then
    ME10NumSubClasse.Clear;

end;

procedure TFProdutoParam.ME11CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodFilial.Text) <> '' then
    ME11FilialDesc.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME11CodFilial.Text)
  else
    ME11CodFilial.Clear;

end;

procedure TFProdutoParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME8CodFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  Me9CodFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME6CodFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME10CodFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME11CodFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFProdutoParam.ME10NumClasseChange(Sender: TObject);
begin
  inherited;
  if Trim(ME10NumClasse.Text) <> '' then
  begin
    Edit10DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + ME10NumClasse.Text);
    CB10NumClasse.Checked := False;
  end
  else
  begin
    ME10NumClasse.Clear;
    Edit10DescClasse.Text := ' ';
  end;
end;

procedure TFProdutoParam.ME11NumClasseIChange(Sender: TObject);
begin
  inherited;
  if Trim(ME11NumClasseI.Text) <> '' then
    ME11ClasseDescI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + ME11NumClasseI.Text)
  else
    ME11NumClasseI.Clear;

end;

procedure TFProdutoParam.ME11NumClasseFChange(Sender: TObject);
begin
  inherited;
  if Trim(ME11NumClasseF.Text) <> '' then
    ME11ClasseDescF.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'COD_CLASSE = ' + ME11NumClasseF.Text)
  else
    ME11NumClasseF.Clear;
end;

procedure TFProdutoParam.EdCodCadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCodCadastro.Text) <> '' then
    MECadastroNome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + Trim(EdCodCadastro.Text))
  else
    MECadastroNome.Clear;
end;

procedure TFProdutoParam.EdCodProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(EdCodProduto.Text) <> '' then
    MEProdutoDesc.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + EdCodProduto.Text)
  else
    MEProdutoDesc.Clear;
end;

procedure TFProdutoParam.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro do
    begin
      EdCodCadastro.Text := QCadastroConsCOD_CADASTRO.Text;
      MECadastroNome.Text := QCadastroNOME.Value;
    end;
  end
  else
  begin
    EdCodCadastro.Text := '';
    MECadastroNome.Text := '';
  end;
end;

procedure TFProdutoParam.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    with DMProduto do
    begin
      EdCodProduto.Text := QProdutoConsCOD_PRODUTO.Text;
      MEProdutoDesc.Text := QProdutoConsDESC_PRODUTO.Value;
    end;
  end
  else
  begin
    EdCodProduto.Text := '';
    MEProdutoDesc.Text := '';
  end;
end;

procedure TFProdutoParam.RGOpcaoClick(Sender: TObject);
begin
  inherited;
  if RGOpcao.ItemIndex = 0 then
  begin
    EdCodCadastro.Enabled := True;
    MECadastroNome.Enabled := True;
    SBCadastroCons.Enabled := True;
    EdCodProduto.Enabled := False;
    MEProdutoDesc.Enabled := False;
    SBProdutoCons.Enabled := False;
  end
  else
  begin
    EdCodCadastro.Enabled := False;
    MECadastroNome.Enabled := False;
    SBCadastroCons.Enabled := False;
    EdCodProduto.Enabled := True;
    MEProdutoDesc.Enabled := True;
    SBProdutoCons.Enabled := True;
  end;
end;

procedure TFProdutoParam.SB11ConsClasseIClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    ME11NumClasseI.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  end;

end;

procedure TFProdutoParam.SB11ClasseConsFClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    ME11NumClasseF.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  end;

end;

procedure TFProdutoParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.Me15CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME15CodFilial.Text) <> '' then
  begin
    ME15DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + Me15CodFilial.Text);
  end
  else
    Me15DescFilial.Text := 'Todas';

end;

procedure TFProdutoParam.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    Me15CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me15CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.Me15CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me15CodProduto.Text) <> '' then
  begin
    FProdutoParam.ME15DtInventario.text := DMoracle.BuscaNome('SELECT MAX(DT_INVENTARIO) FROM TB_ESTOQUE',
      'COD_PRODUTO = ' + Me15CodProduto.Text + ' AND COD_FILIAL = ' + Trim(Me15CodFilial.Text));
    if Trim(Me15Qt_Inventario.Text) <> '/  /' then
      FProdutoParam.ME15Qt_Inventario.text := DMoracle.BuscaNome('SELECT QT_INVENTARIO FROM TB_ESTOQUE',
        'COD_PRODUTO = ' + ME15CodProduto.Text + 'AND DT_INVENTARIO = ' + CHR(39) + ME15DtInventario.Text + CHR(39))
    else
      Me15Qt_Inventario.Text := '';
    Me15DescProduto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me15CodProduto.Text));
  end
  else
    Me15DescProduto.Text := 'Todos';
end;

procedure TFProdutoParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me15CodProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me15CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.Me15CodLoteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me15CodLote.text) <> '' then
    Me15Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
      'COD_LOTE_TIPO = ' + Me15CodLote.text)
  else
    Me15Lote.Clear;

end;

procedure TFProdutoParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = mrOK then
  begin
    Me15CodLote.text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    Me15CodLoteExit(Self);
  end;

end;

procedure TFProdutoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FTipoProdCons = nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  if FTipoProdCons.ShowModal = mrOk then
  begin
    ME6TipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.value;
    CB6Todos.Checked := false;
  end;

end;

procedure TFProdutoParam.CBTodosPromocaoClick(Sender: TObject);
begin
  inherited;
  if CBTodosPromocao.Checked = true then
    MEDescPromocao.Clear;
end;

procedure TFProdutoParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FProdutoPromocaoCons = nil then
    FProdutoPromocaoCons := TFProdutoPromocaoCons.Create(Application);
  if FProdutoPromocaoCons.ShowModal = mrOK then
  begin
    MEDescPromocao.Text := DMProduto.QProdutoPromConsDESC_COMPLEMENTO_PROMOCAO.Text;
    CBTodosPromocao.Checked := false;
  end;
end;

procedure TFProdutoParam.ME16CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16CodFilial.Text) <> '' then
    ME16DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME16CodFilial.Text)
  else
    ME16DescFilial.Text := 'Todas';
end;

procedure TFProdutoParam.ME16CodFornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16CodFornecedor.Text) <> '' then
    ME16DescFornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + Trim(ME16CodFornecedor.Text))
  else
    ME16DescFornecedor.Text := 'Todos';
end;

procedure TFProdutoParam.ME16CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16CodProduto.Text) <> '' then
    Me16DescProduto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me16CodProduto.Text))
  else
    Me16DescProduto.Text := 'Todos';
end;

procedure TFProdutoParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME16CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME16CodFilialExit(Self);
  end;
end;

procedure TFProdutoParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME16CodFornecedor.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME16CodFornecedorExit(Self);
  end;
end;

procedure TFProdutoParam.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me16CodProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me16CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.ME5CodProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodProduto.Text) <> '' then
    ME5Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + Trim(ME5CodProduto.Text))
  else
    ME5Produto.Clear;

end;

procedure TFProdutoParam.ME14ProdutoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto.Text) <> '' then
    ME14DescProduto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto.Text))
  else
    ME14DescProduto.Text := 'Todos';

end;

procedure TFProdutoParam.Me5CodBarrasExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5CodBarras.Text) <> '' then
  begin
    Me5CodProduto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
      'NUM_FABRICANTE = ' + Chr(39) + Trim(Me5CodBarras.Text) + chr(39));
    ME5CodProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.ME5CodProdutoExit(Sender: TObject);
begin
  inherited;
  if ME5CodProduto.Text <> '' then
  begin
    Me5CodBarras.Clear;
    Ed5Preco.Text := DMOracle.BuscaNome('SELECT Val_Varejo FROM TB_PRODUTO',
      'COD_PRODUTO = ' + Trim(ME5CodProduto.Text));
    Ed5Situacao.Text := DMOracle.BuscaNome('SELECT Ind_Situacao FROM TB_PRODUTO',
      'COD_PRODUTO = ' + Trim(ME5CodProduto.Text));
  end;
end;

procedure TFProdutoParam.ME14Produto2Change(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto2.Text) <> '' then
    ME14DescProduto2.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto2.Text))
  else
    ME14DescProduto2.Text := 'Todos';
end;

procedure TFProdutoParam.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto3.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto2.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.ME14Produto3Change(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto3.Text) <> '' then
    ME14DescProduto3.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto3.Text))
  else
    ME14DescProduto3.Text := 'Todos';
end;

procedure TFProdutoParam.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto4.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto5.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME14Produto6.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFProdutoParam.ME14Produto4Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto4.Text) <> '' then
    ME14DescProduto4.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto4.Text))
  else
    ME14DescProduto4.Text := 'Todos';
end;

procedure TFProdutoParam.ME14Produto5Change(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto5.Text) <> '' then
    ME14DescProduto5.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto5.Text))
  else
    ME14DescProduto5.Text := 'Todos';
end;

procedure TFProdutoParam.ME14Produto6Change(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto6.Text) <> '' then
    ME14DescProduto6.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto6.Text))
  else
    ME14DescProduto6.Text := 'Todos';
end;


procedure TFProdutoParam.ME17FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17Filial.Text) <> '' then
    Ed17Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME17Filial.Text)
  else
    Ed17Filial.Text := 'Todas';

end;

procedure TFProdutoParam.SB17FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME19Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME19FilialExit(Self);
  end;

end;

procedure TFProdutoParam.ME17ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me17Produto.Text) <> '' then
    Ed17Produto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me17Produto.Text))
  else
    Ed17Produto.Text := 'Todos';
end;

procedure TFProdutoParam.SB17ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me17Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me17ProdutoExit(Self);
  end;

end;

procedure TFProdutoParam.SB18ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me18Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me18ProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.ME18ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me18Produto.Text) <> '' then
    Ed18Produto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me18Produto.Text))
  else
    Ed18Produto.Text := 'Todos';
end;

procedure TFProdutoParam.SB18MarcaClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = mrOk then
  begin
    ME18Marca.Text := DMMarca.QMarcaConsCod_Marca.Text;
    ME18MarcaExit(Self);
  end;
end;

procedure TFProdutoParam.ME18MarcaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me18Marca.Text) <> '' then
    Ed18Marca.Text := DmOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA',
      'COD_MARCA=' + Trim(Me18Marca.Text))
  else
    Ed18Marca.Text := 'Todos';
end;

procedure TFProdutoParam.ME19FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME19Filial.Text) <> '' then
    Ed19Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME19Filial.Text)
  else
    Ed19Filial.Text := 'Todas';
end;

procedure TFProdutoParam.ME19ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me19Produto.Text) <> '' then
    Ed19Produto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me19Produto.Text))
  else
    Ed19Produto.Text := 'Todos';
end;

procedure TFProdutoParam.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME19Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME19FilialExit(Self);
  end;
end;

procedure TFProdutoParam.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me19Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me19ProdutoExit(Self);
  end;

end;

procedure TFProdutoParam.ME19LoteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me19Lote.text) <> '' then
    ed19Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
      'COD_LOTE_TIPO = ' + Me19Lote.text)
  else
    ed19Lote.Clear;
end;

procedure TFProdutoParam.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = mrOK then
  begin
    Me16Lote.text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    Me16LoteExit(Self);
  end;
end;

procedure TFProdutoParam.ME19ClasseChange(Sender: TObject);
begin
  inherited;
  if Trim(ME19Classe.Text) <> '' then
    ED19Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + ME19Classe.Text)
  else
    ED19Classe.Clear;
end;

procedure TFProdutoParam.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    ME19Classe.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
  end;
end;

procedure TFProdutoParam.SB20ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me20Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me20ProdutoExit(Self);
  end;
end;

procedure TFProdutoParam.ME20ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me20Produto.Text) = '' then
    raise Exception.Create('É Preciso escolher um produto!');
  Ed20Produto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
    'COD_PRODUTO=' + Trim(Me20Produto.Text));
end;

procedure TFProdutoParam.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME8CodFilial2.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME8CodFilial2Exit(Self);
  end;
end;

procedure TFProdutoParam.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
  begin
    ME8CodProduto2.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME8CodProduto2Exit(Self);
  end;
end;

procedure TFProdutoParam.ME8CodFilial2Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodFilial2.Text) <> '' then
    ME8Filial2.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME8CodFilial2.Text)
  else
    ME8Filial2.Clear;
end;

procedure TFProdutoParam.ME8CodProduto2Exit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodProduto2.text) <> '' then
    ME8Produto2.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + ME8CodProduto2.text);
  if Trim(ME8CodProduto2.text) <> '' then
    ME8CodBarra2.Text := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO',
      'COD_PRODUTO = ' + ME8CodProduto2.text)
  else
    ME8Produto2.Clear;
end;

procedure TFProdutoParam.ME21FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME21Filial.Text) <> '' then
    ED21Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
      'COD_FILIAL = ' + ME21Filial.Text)
  else
    ED21Filial.TEXT := 'Todas';
end;

procedure TFProdutoParam.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    ME21Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME21FilialExit(Self);
  end;
end;

procedure TFProdutoParam.Me22ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me22Produto.Text) = '' then
    Ed22Produto.Text := 'Todos'
  else
    Ed22Produto.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(Me22Produto.Text));
end;

procedure TFProdutoParam.Me22UfExit(Sender: TObject);
begin
  inherited;
  if Trim(Me22Uf.Text) = '' then
    Ed22Uf.Text := 'Todos'
  else
    Ed22Uf.Text := DmOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO',
      'COD_ESTADO=' + Chr(39) + Trim(Me22Uf.Text) + Chr(39));
end;

procedure TFProdutoParam.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Me22Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me22ProdutoExit(Self);
  end;

end;

procedure TFProdutoParam.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    Me22UF.Text := DMEstado.QEstadoConsCod_Estado.Text;
    Me22UFExit(Self);
  end;

end;

procedure TFProdutoParam.ME21VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME21Vendedor.Text) <> '' then
    ED21Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_Vendedor',
      'COD_Vendedor = ' + ME21Vendedor.Text)
  else
    ED21Vendedor.TEXT := 'Todos';
end;

procedure TFProdutoParam.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
  begin
    ME21Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME21VendedorExit(Self);
  end;
end;

procedure TFProdutoParam.ME16LoteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16Lote.text) <> '' then
    ME16DescLote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
      'COD_LOTE_TIPO = ' + Me16Lote.text)
  else
    ME16DescLote.Clear;
end;

procedure TFProdutoParam.Fm2ClasseBtClasseClick(Sender: TObject);
begin
  inherited;
//  Fm2Classe.BtClasseClick(Sender);
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    Fm2Classe.MeClasse.Text := DMClasse.QClasseConsCOD_CLASSE.Text;
    Fm2ClasseMeClasseExit(Self);
  end;
end;

procedure TFProdutoParam.Fm2ClasseMeClasseExit(Sender: TObject);
begin
  inherited;
//  Fm2Classe.MeClasseExit(Sender);
  if Trim(Fm2Classe.MeClasse.Text) <> '' then
    Fm2Classe.EdClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'COD_CLASSE = ' + Fm2Classe.MeClasse.Text)
  else
    Fm2Classe.EdClasse.Text := 'Todas';
end;

procedure TFProdutoParam.ME24CodigoExit(Sender: TObject);
begin
  inherited;
  Fm24Produto.MeProduto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM = ' + ME24Codigo.Text);
  Fm24Produto.MeProdutoExit(Fm24Produto.MeProduto);
  Me24Data.Text := DMOracle.BuscaNome('SELECT DT_FABRICACAO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM = ' + ME24Codigo.Text);
  Me24Peso.Text := DMOracle.BuscaNome('SELECT NUM_PESO_LIQUIDO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM = ' + ME24Codigo.Text);
end;

procedure TFProdutoParam.me30CodPesagemProdExit(Sender: TObject);
begin
  inherited;
  if trim(me30CodPesagemProd.Text) <> '' then
  begin
    with DMProduto do
    begin
      QPesagemProducao.Close;
      QPesagemProducao.SetVariable(':PK', me30CodPesagemProd.Text);
      QPesagemProducao.Open;

      if QPesagemProducao.RecordCount = 0 then
        raise Exception.Create('Nenhuma pesagem foi encontrada com este código');
    end;
  end;
end;

procedure TFProdutoParam.me30CodPesagemProdChange(Sender: TObject);
begin
  inherited;
  if Length(trim(me30CodPesagemProd.Text)) >= 7 then
    me30CodPesagemProdExit(self);
end;

procedure TFProdutoParam.FmProduto32BtProdutoClick(Sender: TObject);
begin
  inherited;
  FmProduto32.BtProdutoClick(Sender);

end;

procedure TFProdutoParam.FmLote32BtLoteClick(Sender: TObject);
begin
  inherited;
  FmLote32.BtLoteClick(Sender);

end;

procedure TFProdutoParam.ME34PesagemIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (GetKeyState(VK_CONTROL) = 0) and (not (Key in ['0'..'9', #8, #13])) then
    Key := #0;
end;

procedure TFProdutoParam.ME34PesagemFimKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (GetKeyState(VK_CONTROL) = 0) and (not (Key in ['0'..'9', #8, #13])) then
    Key := #0;
end;

procedure TFProdutoParam.SENumEtiquetasExit(Sender: TObject);
var
  wResto :Real;
begin
  inherited;
  wResto := 0.00;
  //Garante que o número informado é múltiplo de 5
  wResto := (StrToInt(SENumEtiquetas.Text) mod 5);
  if wResto <> 0.00 then
  begin
    MessageDlg('O número deve ser múltiplo de 5 (Ex: 5,10,15...)', mtError, [mbOk],0);
    SENumEtiquetas.Text := '5';
  end;
end;

procedure TFProdutoParam.Me38CodFilialExit(Sender: TObject);
begin
  inherited;
    if Trim(ME38CodFilial.text)<>'' then
     ME38Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME38CodFilial.text)
  else
     ME38Filial.Text:='Todos';
end;

procedure TFProdutoParam.RG41ModoClick(Sender: TObject);
begin
  inherited;
  Fm41Produto.Enabled := (RG41Modo.ItemIndex = 1);
  Fm41Produto.MeProduto.Enabled := (RG41Modo.ItemIndex = 1);
  Fm41Produto.BtProduto.Enabled := (RG41Modo.ItemIndex = 1);
  Fm41SubClasse.Enabled := (RG41Modo.ItemIndex = 0);
  Fm41SubClasse.BtClasse.Enabled:= (RG41Modo.ItemIndex = 0);
  if RG41Modo.ItemIndex = 1 then
  begin
    Fm41SubClasse.MeClasse.Clear;
    Fm41SubClasse.MeSubClasse.Clear;
  end;
  if RG41Modo.ItemIndex = 0 then
    Fm41Produto.MeProduto.Clear;
end;

procedure TFProdutoParam.RG41QtdeEtiquetasClick(Sender: TObject);
begin
  inherited;
  Me41QtdeEtiquetas.Enabled := (RG41QtdeEtiquetas.ItemIndex = 1);
  ME14Filial.Enabled := (RG41QtdeEtiquetas.ItemIndex = 0);
  //ME14Lote.Enabled := (RG41QtdeEtiquetas.ItemIndex = 0);
  if RG41QtdeEtiquetas.ItemIndex = 0 then
    Me41QtdeEtiquetas.Clear;
  if RG41QtdeEtiquetas.ItemIndex = 1 then
  begin
    ME14Filial.Clear;
    ME14Lote.Clear;
  end;
end;

procedure TFProdutoParam.Me43CodTabelaPrecoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me43CodTabelaPreco.text) <> '' then
     Me43TabelaPreco.Text:=DMOracle.BuscaNome('SELECT DESC_TABELA_PRECO FROM TB_TABELA_PRECO_CAB','COD_TABELA_PRECO_CAB = '+Me43CodTabelaPreco.text)
  else
     Me43TabelaPreco.Text:='Todos';
end;

procedure TFProdutoParam.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  if FTabelaPrecoCons = nil then
    FTabelaPrecoCons := TFTabelaPrecoCons.Create(Application);
  if FTabelaPrecoCons.ShowModal = mrOK then
  begin
    Me43CodTabelaPreco.Text := FloatToStr(DMTabelaPreco.QTabelaPrecoConsCOD_TABELA_PRECO_CAB.Value);
    Me43TabelaPreco.Text := DMTabelaPreco.QTabelaPrecoConsDESC_TABELA_PRECO.Value;
    Me43CodTabelaPrecoExit(Self);
  end;
end;

procedure TFProdutoParam.Fm41ProdutoBtProdutoClick(Sender: TObject);
begin
  inherited;
  Fm41Produto.BtProdutoClick(Sender);

end;

procedure TFProdutoParam.BtClasse25Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    MEClasse25.Text := DMClasse.QClasseConsNum_Classe.Text;
    MESubClasse25.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    MESubClasse25Exit(Self);
end;

procedure TFProdutoParam.MEClasse25Exit(Sender: TObject);
begin
  inherited;
  MESubClasse25Exit(Self);
end;

procedure TFProdutoParam.MESubclasse25Exit(Sender: TObject);
begin
  inherited;
   If Trim(MEClasse25.Text) = '' Then
  Begin
    EdClasse25.Text := 'Todos';
    MESubClasse25.Text := '';
    MENumClasse25.Text := '';
  End
  Else
    If Trim(MESubClasse25.Text) = '' then
    Begin
      EdClasse25.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+MEClasse25.Text+
                                           'AND NUM_SUBCLASSE = 0');
      MESubClasse25.Text := '0';
      MENumClasse25.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+MEClasse25.Text+
                                           'AND NUM_SUBCLASSE = 0');
    End
    Else
    Begin
      EdClasse25.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+MEClasse25.Text+
                                           'AND NUM_SUBCLASSE = '+MESubClasse25.Text);
      MENumClasse25.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+MEClasse25.Text+
                                           'AND NUM_SUBCLASSE = '+MESubClasse25.Text);
    End;
end;

procedure TFProdutoParam.ME14Produto4Change(Sender: TObject);
begin
  inherited;
  if Trim(ME14Produto4.Text) <> '' then
    ME14DescProduto4.Text := DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO=' + Trim(ME14Produto4.Text))
  else
    ME14DescProduto4.Text := 'Todos';
end;

end.

