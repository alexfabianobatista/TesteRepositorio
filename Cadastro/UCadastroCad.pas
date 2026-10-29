unit UCadastroCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, DBDirceu, QRExport, variants,
  IdSMTP, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
  IdPOP3, IdBaseComponent, IdMessage, ActnList, ExtDlgs, JPEG, DBPanel, OraTeste,
  IdHTTP, UCarregando2, uLkJSON;

type
  TFCadastroCad = class(TFTCadSimples)
    PCCadastro: TPageControl;
    TSCadastro: TTabSheet;
    TSFisica: TTabSheet;
    TSJuridica: TTabSheet;
    TSEndereco: TTabSheet;
    GroupBox4: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    Label41: TLabel;
    DBEdit41: TDBEdit;
    Label34: TLabel;
    DBEdit34: TDBEdit;
    Label32: TLabel;
    DBEdit32: TDBEdit;
    Label33: TLabel;
    DBEdit33: TDBEdit;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox5: TGroupBox;
    Label42: TLabel;
    DBEdit42: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    GroupBox6: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    Label14: TLabel;
    DBEIncricaoEstadual: TDBEdit;
    Label24: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label40: TLabel;
    DBEdit40: TDBEdit;
    DBEdit51: TDBEdit;
    Label45: TLabel;
    TabSheet1: TTabSheet;
    Padro1: TMenuItem;
    Label46: TLabel;
    DBEdit52: TDBEdit;
    Label47: TLabel;
    DBEdit53: TDBEdit;
    TabSheet2: TTabSheet;
    Encerrados1: TMenuItem;
    Aniversariantes1: TMenuItem;
    MalaDireta1: TMenuItem;
    PropriedadesCadastro1: TMenuItem;
    BtConsUf: TBitBtn;
    PageControl2: TPageControl;
    TsPropriedade: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox7: TGroupBox;
    DBGrid1: TDBGrid;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    BtConsCadastro: TBitBtn;
    BtConsTipoPropriedade: TBitBtn;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    DBEdit62: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    SpeedButton1: TSpeedButton;
    Propriedades1: TMenuItem;
    MalaDiretaAniversriantes1: TMenuItem;
    CadastroContato1: TMenuItem;
    AniversarianteContatos1: TMenuItem;
    Etiquetas1: TMenuItem;
    QtCadastroClassificao1: TMenuItem;
    Envelopes1: TMenuItem;
    CadastroCdigoNome1: TMenuItem;
    FichaCadastral1: TMenuItem;
    CadastrocomVendedor1: TMenuItem;
    CadastroClientesComVendas1: TMenuItem;
    DBComboBox1: TDBComboBox;
    Opo1: TMenuItem;
    CalculoLimiteCrdito1: TMenuItem;
    Label68: TLabel;
    DBEdit24: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    DBComboBox2: TDBComboBox;
    Label69: TLabel;
    DBEdit82: TDBEdit;
    DBDirceu1: TDBDirceu;
    Cadastrodadosbsicos1: TMenuItem;
    TabSheet5: TTabSheet;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label70: TLabel;
    DBEdit83: TDBEdit;
    Label71: TLabel;
    DBEdit84: TDBEdit;
    Label72: TLabel;
    DBEdit85: TDBEdit;
    Label73: TLabel;
    DBEdit86: TDBEdit;
    Label74: TLabel;
    DBEdit87: TDBEdit;
    Label75: TLabel;
    DBEdit88: TDBEdit;
    GroupBox11: TGroupBox;
    Label76: TLabel;
    DBEdit89: TDBEdit;
    Label77: TLabel;
    DBEdit90: TDBEdit;
    Label78: TLabel;
    DBEdit91: TDBEdit;
    Label79: TLabel;
    DBEdit92: TDBEdit;
    Label80: TLabel;
    Label81: TLabel;
    GroupBox12: TGroupBox;
    Label83: TLabel;
    DBEdit94: TDBEdit;
    Label84: TLabel;
    DBEdit95: TDBEdit;
    Label85: TLabel;
    DBEdit96: TDBEdit;
    DBEdit63: TDBEdit;
    Label87: TLabel;
    DBEdit98: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    CancelaAtrasados1: TMenuItem;
    BitBtn5: TBitBtn;
    RelatrioPorEndereo1: TMenuItem;
    GroupBox14: TGroupBox;
    DBEdit104: TDBEdit;
    Label11: TLabel;
    DBEdit105: TDBEdit;
    Label95: TLabel;
    DBEdit109: TDBEdit;
    Label96: TLabel;
    DBEdit110: TDBEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CadastrosAtivosCcompraAcimadeR1: TMenuItem;
    TransfereCodigo1: TMenuItem;
    DBMemo1: TDBMemo;
    DBRadioGroup7: TDBRadioGroup;
    Label99: TLabel;
    DBEdit113: TDBEdit;
    Label100: TLabel;
    DBEdit114: TDBEdit;
    Label101: TLabel;
    DBEdit115: TDBEdit;
    BitBtn8: TBitBtn;
    Label102: TLabel;
    DBEdit117: TDBEdit;
    Label103: TLabel;
    DBEdit118: TDBEdit;
    Label104: TLabel;
    DBEdit119: TDBEdit;
    Label105: TLabel;
    DBEdit120: TDBEdit;
    Label106: TLabel;
    DBEdit121: TDBEdit;
    TabSheet6: TTabSheet;
    Label107: TLabel;
    DBEdit122: TDBEdit;
    Label108: TLabel;
    DBEdit123: TDBEdit;
    Label109: TLabel;
    DBEdit124: TDBEdit;
    Label110: TLabel;
    DBEdit125: TDBEdit;
    Label111: TLabel;
    DBEdit126: TDBEdit;
    TransfereVendedor1: TMenuItem;
    Label115: TLabel;
    DBEdit130: TDBEdit;
    Label116: TLabel;
    DBEdit131: TDBEdit;
    Label117: TLabel;
    DBEdit132: TDBEdit;
    Label118: TLabel;
    Label119: TLabel;
    DBEdit134: TDBEdit;
    Label120: TLabel;
    DBEdit135: TDBEdit;
    DBRadioGroup8: TDBRadioGroup;
    DBEdit133: TDBEdit;
    CadastroDadosBancrios1: TMenuItem;
    MalaDiretaMaioresClientes1: TMenuItem;
    Label121: TLabel;
    DBEdit137: TDBEdit;
    EtiquetaClienteFornecedorescomCompra1: TMenuItem;
    CancelaCadastrosSemCompras1: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    LimiteCrdito1: TMenuItem;
    TabSheet7: TTabSheet;
    Label128: TLabel;
    DBEdit143: TDBEdit;
    Label129: TLabel;
    DBEdit144: TDBEdit;
    Label130: TLabel;
    DBEdit145: TDBEdit;
    Label131: TLabel;
    DBEdit146: TDBEdit;
    Label132: TLabel;
    DBEdit147: TDBEdit;
    Label134: TLabel;
    DBEdit149: TDBEdit;
    Label135: TLabel;
    DBEdit150: TDBEdit;
    Label136: TLabel;
    DBEdit151: TDBEdit;
    Label137: TLabel;
    DBEdit152: TDBEdit;
    DBRadioGroup9: TDBRadioGroup;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    BitBtn9: TBitBtn;
    DBRadioGroup10: TDBRadioGroup;
    TsRelacoesComerciais: TTabSheet;
    BitBtn10: TBitBtn;
    Label133: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    LBVlrPropriedade: TLabel;
    LBBemEquip: TLabel;
    LBVlrPedidos: TLabel;
    LBContasReceber: TLabel;
    Label146: TLabel;
    DBEdit148: TDBEdit;
    Label147: TLabel;
    DBEdit153: TDBEdit;
    Label148: TLabel;
    DBEdit154: TDBEdit;
    LBVlrOnusPropriedade: TLabel;
    LBVlrOnusEquipamento: TLabel;
    LBPatrimonioLiquido: TLabel;
    LBLimiteCredito: TLabel;
    DBEdit157: TDBEdit;
    Label150: TLabel;
    LBCreditoAberto: TLabel;
    DBGrid3: TDBGrid;
    Label152: TLabel;
    DBEdit159: TDBEdit;
    Label153: TLabel;
    DBEdit160: TDBEdit;
    DBRadioGroup11: TDBRadioGroup;
    Label154: TLabel;
    DBEdit161: TDBEdit;
    Label155: TLabel;
    DBEdit162: TDBEdit;
    Label156: TLabel;
    DBEdit163: TDBEdit;
    Label52: TLabel;
    DBEdit61: TDBEdit;
    DBEdit93: TDBEdit;
    DBEdit164: TDBEdit;
    Label82: TLabel;
    DBEdit165: TDBEdit;
    DBEdit166: TDBEdit;
    DBEdit167: TDBEdit;
    Label123: TLabel;
    DBEdit168: TDBEdit;
    DBEdit169: TDBEdit;
    DBEdit170: TDBEdit;
    Label157: TLabel;
    DBEdit171: TDBEdit;
    DBEdit172: TDBEdit;
    DBEdit173: TDBEdit;
    Label158: TLabel;
    DBEdit174: TDBEdit;
    DBEdit175: TDBEdit;
    DBEdit176: TDBEdit;
    Label159: TLabel;
    Label160: TLabel;
    DBEdit177: TDBEdit;
    BtConsProprietario: TBitBtn;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    Label161: TLabel;
    DBEdit59: TDBEdit;
    BitBtn12: TBitBtn;
    DBDirceu6: TDBDirceu;
    Label162: TLabel;
    DBEdit60: TDBEdit;
    BitBtn13: TBitBtn;
    DBDirceu7: TDBDirceu;
    Label163: TLabel;
    LblPropria: TLabel;
    Label165: TLabel;
    LblArrendada: TLabel;
    TabSheet8: TTabSheet;
    DBEdit116: TDBEdit;
    Label164: TLabel;
    GbDados: TGroupBox;
    Label167: TLabel;
    DBEdit178: TDBEdit;
    Label168: TLabel;
    DBEdit179: TDBEdit;
    Label169: TLabel;
    DBEdit180: TDBEdit;
    Label171: TLabel;
    DBEdit182: TDBEdit;
    Label170: TLabel;
    DBEdit181: TDBEdit;
    Label174: TLabel;
    DBEdit185: TDBEdit;
    BitBtn14: TBitBtn;
    GroupBox15: TGroupBox;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    DBEdit187: TDBEdit;
    DBEdit188: TDBEdit;
    DBEdit189: TDBEdit;
    DBEdit190: TDBEdit;
    DBEdit191: TDBEdit;
    DBEdit192: TDBEdit;
    DBEdit193: TDBEdit;
    GroupBox16: TGroupBox;
    Label172: TLabel;
    Label173: TLabel;
    DBEdit183: TDBEdit;
    DBEdit184: TDBEdit;
    GroupBox17: TGroupBox;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label188: TLabel;
    DBEdit196: TDBEdit;
    DBEdit197: TDBEdit;
    DBEdit198: TDBEdit;
    DBEdit199: TDBEdit;
    BtnCidade: TBitBtn;
    DBEdit202: TDBEdit;
    DBEdit195: TDBEdit;
    Label183: TLabel;
    Label187: TLabel;
    DBEdit200: TDBEdit;
    DBEdit194: TDBEdit;
    Label182: TLabel;
    DBRadioGroup4: TDBRadioGroup;
    Label189: TLabel;
    DBEdit201: TDBEdit;
    BitBtn15: TBitBtn;
    Label190: TLabel;
    DBEdit204: TDBEdit;
    Label191: TLabel;
    DBEdit205: TDBEdit;
    GroupBox18: TGroupBox;
    Label192: TLabel;
    DBEdit206: TDBEdit;
    Label193: TLabel;
    DBEdit207: TDBEdit;
    Label194: TLabel;
    DBEdit208: TDBEdit;
    DBEdit209: TDBEdit;
    Label195: TLabel;
    Label196: TLabel;
    DBEdit210: TDBEdit;
    BitBtn16: TBitBtn;
    Label197: TLabel;
    DBEdit212: TDBEdit;
    Label198: TLabel;
    DBEdit213: TDBEdit;
    Label199: TLabel;
    DBEdit214: TDBEdit;
    DBEdit215: TDBEdit;
    Label200: TLabel;
    DBEdit216: TDBEdit;
    MandarEmailClientes1: TMenuItem;
    IdMessage: TIdMessage;
    IdPOP3: TIdPOP3;
    IdSMTP: TIdSMTP;
    ActionList1: TActionList;
    Action_Ctrl_F2: TAction;
    Action_Ctrl_F3: TAction;
    Action_Ctrl_F4: TAction;
    Action_Ctrl_F5: TAction;
    EtiquetasAniversariantes1: TMenuItem;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    EtiquetaImpressoDOS1: TMenuItem;
    CadastroporEstado1: TMenuItem;
    DsCadastroEnderecos: TDataSource;
    PcEnderecos: TPageControl;
    TabSheet9: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BtnCidadeCobrancaCons: TBitBtn;
    GroupBox8: TGroupBox;
    BitBtn4: TBitBtn;
    TsMaisEnderecos: TTabSheet;
    GroupBox19: TGroupBox;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    DBEdit221: TDBEdit;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit225: TDBEdit;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DBEdit227: TDBEdit;
    DBEdit228: TDBEdit;
    Label222: TLabel;
    DBEdit229: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBGrid4: TDBGrid;
    DBDirceu8: TDBDirceu;
    Label224: TLabel;
    DBEdit226: TDBEdit;
    PEndereco: TPanel;
    DBComboBox3: TDBComboBox;
    Label230: TLabel;
    GBDescontoEspecial: TGroupBox;
    TsImagem: TTabSheet;
    imgCadastro: TImage;
    lblImagemNaoCadastrada: TLabel;
    Label233: TLabel;
    MECaminhoImagem: TMaskEdit;
    btnIncluirImagem: TBitBtn;
    btnExcluirImagem: TBitBtn;
    btnProcurar: TBitBtn;
    DSImagemCadastro: TDataSource;
    OPDImagem: TOpenPictureDialog;
    imgAssinatura: TImage;
    lblAssinaturaNaoCadastrada: TLabel;
    MECaminhoAssinatura: TMaskEdit;
    btnIncluirAss: TBitBtn;
    btnExcluirAss: TBitBtn;
    btnProcurarAss: TBitBtn;
    Label236: TLabel;
    DBEdit1: TDBEdit;
    Label235: TLabel;
    RgAtacadoVarejo: TDBRadioGroup;
    SBLiberaLimite: TSpeedButton;
    DbLiberaLimite: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPNome: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPEmail: TDBPanel;
    DBPLimite: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPOperacaoVendaCC: TDBPanel;
    DBPanel15: TDBPanel;
    DBPSegundoContato: TDBPanel;
    DBPVendedor: TDBPanel;
    DBPanel16: TDBPanel;
    DBPVendedorPreposto: TDBPanel;
    DBPPercDesconto: TDBPanel;
    DBPDtConsultaSintegra: TDBPanel;
    DBPanel17: TDBPanel;
    DBPPercMeta: TDBPanel;
    DBPanel19: TDBPanel;
    DBPCadastroNovo: TDBPanel;
    DBPPrazo: TDBPanel;
    DBPDiasVencto: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel18: TDBPanel;
    DBPPercSenar: TDBPanel;
    DBPEnderecoPanel: TDBPanel;
    DBPBairroPanel: TDBPanel;
    DBPDescCidadePanel: TDBPanel;
    DBPCidadePanel: TDBPanel;
    DBPEstadoPanel: TDBPanel;
    DBPDistritoPanel: TDBPanel;
    DBPPaisPanel: TDBPanel;
    DBPCepPanel: TDBPanel;
    DBPCxPostal: TDBPanel;
    DBPCadpro: TDBPanel;
    DBPEndereco: TDBPanel;
    DBPanel24: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel28: TDBPanel;
    DBPAgencia: TDBPanel;
    DBPanel29: TDBPanel;
    DBPanel30: TDBPanel;
    DBPComplementoSintegra: TDBPanel;
    DBPanel31: TDBPanel;
    DBPanel32: TDBPanel;
    DBPanel33: TDBPanel;
    DBPanel34: TDBPanel;
    DBPDistrito: TDBPanel;
    DBPBairro: TDBPanel;
    DBPCep: TDBPanel;
    DBPPais: TDBPanel;
    DBPCidade: TDBPanel;
    DBPDescCidade: TDBPanel;
    DBPEstado: TDBPanel;
    DBDirceu9: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPMotivo: TDBPanel;
    DBP_Email: TDBPanel;
    CBInscricao: TCheckBox;
    ExportaClienteFornecedor1: TMenuItem;
    SaveDialog: TSaveDialog;
    DBPanel35: TDBPanel;
    TsCadastroUnico: TTabSheet;
    DBPanel36: TDBPanel;
    DBPanel37: TDBPanel;
    DBPanel38: TDBPanel;
    DBPanel39: TDBPanel;
    DBPanel40: TDBPanel;
    DBPanel41: TDBPanel;
    DBPanel42: TDBPanel;
    DBPanel43: TDBPanel;
    DBPanel44: TDBPanel;
    DBRadioGroup12: TDBRadioGroup;
    DBPanel45: TDBPanel;
    DBPanel46: TDBPanel;
    DBPanel47: TDBPanel;
    DBPanel48: TDBPanel;
    DBPanel49: TDBPanel;
    DBPanel50: TDBPanel;
    DBPanel51: TDBPanel;
    DBPanel52: TDBPanel;
    DBPanel53: TDBPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBDirceu12: TDBDirceu;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBPanel54: TDBPanel;
    DBPanel55: TDBPanel;
    DBRGFisica_Juridica: TDBRadioGroup;
    DBPanel56: TDBPanel;
    DBRIssRetido: TDBRadioGroup;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    DBRGRegimeTributario: TDBRadioGroup;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    DBPPercDescontoNota: TDBPanel;
    DBPComplemento: TDBPanel;
    DBPanel57: TDBPanel;
    DBEdit136: TDBEdit;
    Panel2: TPanel;
    Label19: TLabel;
    DBPanel58: TDBPanel;
    DBPanel59: TDBPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label20: TLabel;
    DBPanel60: TDBPanel;
    DBPanel61: TDBPanel;
    DBRPisCofinsRetido: TDBRadioGroup;
    DBPanel62: TDBPanel;
    DBPanel1: TDBPanel;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    DBPanel63: TDBPanel;
    DBRTipoConsumidor: TDBRadioGroup;
    DBCBContribuinte: TDBCheckBox;
    DBPanel64: TDBPanel;
    Label23: TLabel;
    DBECadPro: TDBEdit;
    DBComboBox4: TDBComboBox;
    Label25: TLabel;
    DbOperadora: TDBComboBox;
    LblOperadora: TLabel;
    DBComboBox6: TDBComboBox;
    Label27: TLabel;
    DBPanel65: TDBPanel;
    DBPanel66: TDBPanel;
    DBPanel67: TDBPanel;
    DBRadioGroup13: TDBRadioGroup;
    SpeedButton2: TSpeedButton;
    DBPInscricaoMunicipal: TDBPanel;
    btnTirarFoto: TBitBtn;
    DBPanel69: TDBPanel;
    DBPanel70: TDBPanel;
    DBRadioGroup14: TDBRadioGroup;
    DBPanel71: TDBPanel;
    DBRadioGroup15: TDBRadioGroup;
    TabSheet3: TTabSheet;
    DBPanel73: TDBPanel;
    DSReceituarioOptico: TDataSource;
    DBPanel74: TDBPanel;
    DBPanel75: TDBPanel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label57: TLabel;
    DBPanel76: TDBPanel;
    DBPanel77: TDBPanel;
    DBPanel78: TDBPanel;
    DBPanel79: TDBPanel;
    DBPanel80: TDBPanel;
    DBPanel81: TDBPanel;
    DBPanel82: TDBPanel;
    DBPanel83: TDBPanel;
    DBPanel84: TDBPanel;
    Label58: TLabel;
    Label59: TLabel;
    DBPanel85: TDBPanel;
    DBPanel86: TDBPanel;
    DBPanel87: TDBPanel;
    DBPanel88: TDBPanel;
    DBPanel89: TDBPanel;
    DBPanel90: TDBPanel;
    DBPanel91: TDBPanel;
    DBPanel92: TDBPanel;
    DBPanel93: TDBPanel;
    DBPanel94: TDBPanel;
    Panel3: TPanel;
    Label18: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBMemo2: TDBMemo;
    Label60: TLabel;
    DBGrid5: TDBGrid;
    Label61: TLabel;
    OracleNavigator2: TOracleNavigator;
    DBRadioGroup2: TDBRadioGroup;
    DBPanel95: TDBPanel;
    Label31: TLabel;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    Label62: TLabel;
    GroupBox13: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label97: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    DBEdit99: TDBEdit;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit127: TDBEdit;
    DBEdit128: TDBEdit;
    DBPanel23: TDBPanel;
    DBPanel72: TDBPanel;
    DBCBContribuintePF: TDBCheckBox;
    LabelObsCad: TLabel;
    DBEObsCad: TDBEdit;
    DBPanel68: TDBPanel;
    BTValidaCEP: TButton;
    LBCEPValido: TLabel;
    DBPDescCodFicha: TDBPanel;
    DBPanel96: TDBPanel;
    DBPanel97: TDBPanel;
    Label63: TLabel;
    CBUFCadastro: TComboBox;
    MeDocumentoSefaz: TMaskEdit;
    EmissodeEtiquetasAssinatura1: TMenuItem;
    DBPVctoAlvaSanitario: TDBPanel;
    DBPEntregador: TDBPanel;
    DBCheckBox2: TDBCheckBox;
    CadastroClientesSemCompras1: TMenuItem;
    DBRGConsFinal: TDBRadioGroup;
    Button1: TButton;
    LBCEPValido2: TLabel;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    Label64: TLabel;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit25: TDBEdit;
    DBPEstadoEntrega: TDBPanel;
    DBPanel98: TDBPanel;
    DBPanel99: TDBPanel;
    DBEDataAdmissao: TDBEdit;
    Label67: TLabel;
    Label86: TLabel;
    CBPerfilTributario: TComboBox;
    DBPanel100: TDBPanel;
    DBPanel101: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure TSJuridicaEnter(Sender: TObject);
    procedure Encerrados1Click(Sender: TObject);
    procedure Padro1Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
    procedure MalaDireta1Click(Sender: TObject);
    procedure PropriedadesCadastro1Click(Sender: TObject);
    procedure BtConsUfClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Propriedades1Click(Sender: TObject);
    procedure BtConsTipoPropriedadeClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure MalaDiretaAniversriantes1Click(Sender: TObject);
    procedure CadastroContato1Click(Sender: TObject);
    procedure AniversarianteContatos1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure QtCadastroClassificao1Click(Sender: TObject);
    procedure Envelopes1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure CadastroCdigoNome1Click(Sender: TObject);
    procedure FichaCadastral1Click(Sender: TObject);
    procedure CadastrocomVendedor1Click(Sender: TObject);
    procedure CadastroClientesComVendas1Click(Sender: TObject);
    procedure CalculoLimiteCrdito1Click(Sender: TObject);
    procedure Cadastrodadosbsicos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelaAtrasados1Click(Sender: TObject);
    procedure BtnCidadeCobrancaConsClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RelatrioPorEndereo1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CadastrosAtivosCcompraAcimadeR1Click(Sender: TObject);
    procedure TransfereCodigo1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure TransfereVendedor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastroDadosBancrios1Click(Sender: TObject);
    procedure MalaDiretaMaioresClientes1Click(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure EtiquetaClienteFornecedorescomCompra1Click(Sender: TObject);
    procedure CancelaCadastrosSemCompras1Click(Sender: TObject);
    procedure LimiteCrdito1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BtConsProprietarioClick(Sender: TObject);
    procedure DBRadioGroup11Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBEdit202Exit(Sender: TObject);
    procedure DBEdit197Exit(Sender: TObject);
    procedure DBEdit196Exit(Sender: TObject);
    procedure DBEdit199Exit(Sender: TObject);
    procedure BtnCidadeClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure MandarEmailClientes1Click(Sender: TObject);
    procedure Action_Ctrl_F2Execute(Sender: TObject);
    procedure Action_Ctrl_F3Execute(Sender: TObject);
    procedure Action_Ctrl_F4Execute(Sender: TObject);
    procedure Action_Ctrl_F5Execute(Sender: TObject);
    procedure EtiquetasAniversariantes1Click(Sender: TObject);
    procedure EtiquetaImpressoDOS1Click(Sender: TObject);
    procedure CadastroporEstado1Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure DBEdit227Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure PcEnderecosChange(Sender: TObject);
    procedure btnIncluirImagemClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnExcluirImagemClick(Sender: TObject);
    procedure DSImagemCadastroDataChange(Sender: TObject; Field: TField);
    procedure btnIncluirAssClick(Sender: TObject);
    procedure btnProcurarAssClick(Sender: TObject);
    procedure btnExcluirAssClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBLiberaLimiteClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBPanel2CodigoChange(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel13DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPOperacaoVendaCCDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVendedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVendedorPrepostoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPPrazoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPDiasVenctoCodigoExit(Sender: TObject);
    procedure DBPEnderecoPanelCodigoExit(Sender: TObject);
    procedure DBPBairroPanelCodigoExit(Sender: TObject);
    procedure DBPCidadePanelCodigoExit(Sender: TObject);
    procedure DBPCidadePanelDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCidadePanelAfterConsulta(Sender: TObject);
    procedure DBPDescCidadePanelCodigoExit(Sender: TObject);
    procedure DBPEstadoPanelCodigoExit(Sender: TObject);
    procedure DBPPaisPanelDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBEdit23Exit(Sender: TObject);
    procedure DBPCepPanelCodigoExit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBPEnderecoCodigoExit(Sender: TObject);
    procedure DBPCidadeCodigoExit(Sender: TObject);
    procedure DBPEstadoCodigoExit(Sender: TObject);
    procedure DBPDescCidadeCodigoExit(Sender: TObject);
    procedure DBPCidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel28DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCidadeAfterConsulta(Sender: TObject);
    procedure DBPBairroCodigoExit(Sender: TObject);
    procedure DBPCepCodigoExit(Sender: TObject);
    procedure DBPPaisDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel20DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel21DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPMotivoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPMotivoCodigoExit(Sender: TObject);
    procedure imgAssinaturaClick(Sender: TObject);
    procedure imgCadastroClick(Sender: TObject);
    procedure PCCadastroChange(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure CBInscricaoClick(Sender: TObject);
    procedure DBPanel23DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure ExportaClienteFornecedor1Click(Sender: TObject);
    procedure DBPLimiteEnter(Sender: TObject);
    procedure DBPanel13Enter(Sender: TObject);
    procedure DBPanel35DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel7Enter(Sender: TObject);
    procedure DBPanel37DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel45DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel47DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel47CodigoExit(Sender: TObject);
    procedure DBPanel48CodigoExit(Sender: TObject);
    procedure DBPanel49CodigoExit(Sender: TObject);
    procedure DBRGFisica_JuridicaChange(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit185Exit(Sender: TObject);
    procedure DBPCidadeExit(Sender: TObject);
    procedure DBPanel59DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBPanel60Validate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure DBPanel60Exit(Sender: TObject);
    procedure DBPanel61Exit(Sender: TObject);
    procedure DBPanel61Validate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure DBPanel63DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBEIncricaoEstadualChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBPInscricaoMunicipalValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure btnTirarFotoClick(Sender: TObject);
    procedure DBPanel95DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVendedorCodigoChange(Sender: TObject);
    procedure DBRadioGroup5Click(Sender: TObject);
    procedure DBRadioGroup7Click(Sender: TObject);
    procedure BTValidaCEPClick(Sender: TObject);
    procedure BTValidaCEPExit(Sender: TObject);
    procedure DBPCepValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: String);
    procedure DBPanel97DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure MeDocumentoSefazClick(Sender: TObject);
    procedure EmissodeEtiquetasAssinatura1Click(Sender: TObject);
    procedure CadastroClientesSemCompras1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button1Exit(Sender: TObject);
    procedure TsMaisEnderecosShow(Sender: TObject);
    procedure DBEIncricaoEstadualExit(Sender: TObject);
    procedure DBRGRegimeTributarioChange(Sender: TObject);
  private 
    FCarregando: TFCarregando2;
    procedure AtualizarImagemProduto;
    procedure incluiImagem(caminho: string; tipo: string = 'FOTO'); //'FOTO' ou 'ASSINATURA'
    procedure AtualizarAssinatura;
    procedure MostraVendaLiberada;
    procedure MostraImgMax(Query: TOracleDataset1; FieldImg: TField);
    procedure ExportacaoClienteFornecedor;
    procedure FichaCadastralAristides;
    procedure PreencheCbPerfilTributario;
    procedure AjustarPerfilTributario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroCad: TFCadastroCad;


implementation

uses UCadastro_cl, UCadastroCons, UTipoCadastroCons, UTipoCadastro_cl,
  URamoCons, URamo_cl, UPaisCons, UPais_cl, URegiaoCons, URegiao_cl,
  UMotivoCons, UEstadoCivilCons, UMotivo_cl, UEstadoCivil_cl,
  UCadastroParam, URCadastro_Cliente, URCadastro_Encerrado,
  URCadastro_Aniversariante, URCadastro_MalaDireta, URCadastro_Propriedade,
  UEstadoCons, UEstado_cl, UClassCadastroCons, UClassCadastro_cl,
  UPropriedadeCons, URPropriedade_Propriedade,
  UTipoPropriedadeCons, UTipoPropriedade_cl, UBancosCons, UBancoAgencia_cl,
  UOperacaoCons, UOperacao_cl, URCadastro_Anirver_Contato,
  UrCadastroContato, UrCadastro_Aniver_Contato, UVendedorCons, UVendedor_cl,
  UBiblioteca, UEtiquetas, URCadastro_Qt_Classificacao,
  UrCadastroEnvelope, UOracle_cl, UFRCadastroCodNome, FRFichaCadastral,
  UParamSistema_cl, UFRCadastro_com_Venda, URCadastroVenda, UCalculoLimite,
  URCadastroDadosPessoais, UCidadeCons, UCidade_cl, URCadastroEndereco,
  URCadastroVendasAcima, UCadastroTransf, UrPromissoria2, UFilial_cl,
  URFichaCadRadio, UVendedorTransf, UUsuario_cl, UCadastro_Rel_cl,
  URCadastroBanco, URCadastro_MalaDiretaMaioresClientes, UrCadastro_Cidade,
  UREtiquetaClienteCompra, UPrazoVencimentoCons, UPrazoVencimento_cl,
  URLimiteCadastro, UBensEquipamentoCad, UBensEquipamentoCons,
  UValorReferencia_cl, URCadastro_Aniverr_Etiqueta, UEtiquetaImpressao,
  UContaCorrenteCons, UFmVendedor, URCadastro_Estado, UFmEstado,
  UOficinaPassword, Math, MaskUtils, UEnviaEmail, UTabelaPrecoCons,
  UImpCadastroXML, UCapturaFoto, UFilialCons, USenha, UNotasMarketplace,
  UMensagem_cl, UMensagemCons, UNfe_cl, StrUtils, UREtiquetasAssinantes,
  URCadastroSemVenda, ReformaTributaria.Tipos;


{$R *.DFM}


function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var
  S: string;
  x: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;

end;

{Function FormataCNPJ(Numero: String): String;
var
   tmp,resultado: String;
   indx, indx1: integer;
begin
     if Length(Numero) < 12 Then
        begin
        result := '';
        exit;
        end;

     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;
     if Length(Resultado) < 14 Then
        resultado := StringOfChar('0', 14 - Length(Resultado)) + resultado;
     tmp := Copy(resultado,1,2) + '.';
     tmp := tmp + Copy(resultado,3,3) + '.';
     tmp := tmp + Copy(resultado,6,3) + '/';
     tmp := tmp + Copy(resultado,9,4) + '-' + Copy(resultado,13,2);
     Result := tmp;
end;


Function FormataCPF(Numero: String): String;
var
   tmp,resultado: String;
   indx, indx1: integer;
begin
     if Length(Numero) < 10 Then
        begin
        result := '';
        exit;
        end;

     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;
     if Length(Resultado) < 11 Then
        resultado := StringOfChar('0', 11 - Length(Resultado)) + resultado;
     tmp := Copy(resultado,1,3) + '.';
     tmp := tmp + Copy(resultado,4,3) + '.';
     tmp := tmp + Copy(resultado,7,3) + '-';
     tmp := tmp + Copy(resultado,10,2);
     Result := tmp;
end;

Function FormataCNPJ_CPF(Numero: String): String;
var
   indx, tamanho: integer;
   resultado: String;
begin
     for indx := 1 to Length(Numero) do
         begin
         if Numero[indx] in ['0'..'9'] Then
              resultado := resultado + Numero[indx];
         end;

     if (Length(resultado) > 11) Then
        resultado := FormataCNPJ(resultado)
     else
         resultado := FormataCPF(resultado);
     result := resultado;
end; }

procedure TFCadastroCad.FormActivate(Sender: TObject);
begin
  inherited;
  
  with DMCadastro do
  begin
    QCadastro.Open;
    QProprCadastro.Open;
    QPropriedade.Open;
    DMBensEquipamento.QBensEquipamentos.Open;
    DMBensEquipamento.QBensEquipamentos.Open;
    DMBensEquipamento.QListaBensEquip.Open;
    DMCadastro.QCadastro_Enderecos.open;
    QImagemCadastro.open;
    QQualificacaoSocio.Open;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
  begin
    DBPCep.Required := true;
    DBPCidade.Required := true;
    DBPEndereco.Required := true;
    DBPBairro.Required := true;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
  begin
    DBPComplemento.LCaption := 'CNPJ/CPF Conta Corrente';
    DBPComplementoSintegra.Visible := True;
    DBPAgencia.Width := 70;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
    GroupBox14.Caption := 'Número do INCRA';

  DBPDtConsultaSintegra.Visible := false; //Era usado pela ENCOPEL, não vai aparecer para ninguém por enquanto. Diego A. S. 17/11/2010
  FCadastroCad.Label102.Visible := true;
  FCadastroCad.DBEdit117.Visible := true;

  DBPCadastroNovo.Visible := False;

     // Aba Relações Comerciais retirada a pedido do Marcos - 11/2018
//  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
//     (DMParamSistema.qParamSistemaCod_Empresa.Value <> 'SONOBOM')   and
//     (DMParamSistema.qParamSistemaCod_Empresa.Value <> 'RAZENTE')   and
//     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ENCANTO')   and
//     (pos('NFCE',DMParamSistema.qParamSistemaCod_Empresa.Value) = 0) then
//     TsRelacoesComerciais.TabVisible := DMUsuario.Privilegiado;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') then
     DBPAgencia.LCaption := 'Cód. C/C';
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
     DBPSegundoContato.LCaption := 'Valor Frete';
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO' then
     DBPDiasVencto.LCaption := 'Prazo Entrega';
  if DMParamSistema.CodEmpresa = 'GGIRARDI' then
    DBPVctoAlvaSanitario.visible := True;
  if DMParamSistema.CodEmpresa = 'POLLYANA' then
  begin                                 
    DBPanel3.ReadOnly := False;
    DBPanel3.Enabled := True;
  end;
end;

procedure TFCadastroCad.SBConsultaClick(Sender: TObject);
var res, codCidade, codIbgeCidade, CNPJ: String;
  js: TlkJSONobject;
  codCad: Integer;
begin
  inherited;
  if (MeDocumentoSefaz.Text <> '') and (CBUFCadastro.Text <> '') then
  begin
    res := DMNfe.ConsultaCadastro(DMUsuario.CodFilialUsuario, CBUFCadastro.Text, Bib.LimpaNumero(MeDocumentoSefaz.Text));
    if res <> '' then
    begin
      js := TlkJSONobject.Create;
      js := TlkJSON.ParseText(res) as TlkJSONobject;

      codCad := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ', [Bib.LimpaNumero(MeDocumentoSefaz.Text)]);
      if codCad <> 0 then
      begin
        if MessageDlg( 'Já existe um ou mais cadastros com o documento ' +
          Bib.FormataCNPJ_CPF(Bib.LimpaNumero(MeDocumentoSefaz.Text)) + '. Deseja incluí-lo novamente?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          MeDocumentoSefaz.Clear;
          Abort;
        end;
      end;
      SBIncluirClick(Self);
      with DMCadastro do
      begin
        if Length(Bib.LimpaNumero(MeDocumentoSefaz.Text)) = 11 then
        begin
          QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_INSCRICAO_MUNICIPAL.Value := VarToStr(js.Field['IE'].Value);
        end
        else
        begin
          QCadastroIND_FISICA_JURIDICA.Value := 'J';
          QCadastroNUM_INSCRICAO.Value := VarToStr(js.Field['IE'].Value);
        end;
        QCadastroNUM_CGC_CPF.Value := Bib.FormataCNPJ_CPF(Bib.LimpaNumero(MeDocumentoSefaz.Text));
        QCadastroCOD_ESTADO.Value := VarToStr(js.Field['UF'].Value);
        QCadastroNOME.Value := VarToStr(js.Field['xNome'].Value);
        QCadastroDESC_FANTASIA.Value := VarToStr(Bib.ift(js.Field['xFant'].Value = null, '',js.Field['xFant'].Value));
        QCadastroDESC_COMPLEMENTO.Value := VarToStr(js.Field['ender'].Field['xCpl'].Value);
        QCadastroDESC_BAIRRO.Value := VarToStr(js.Field['ender'].Field['xBairro'].Value);
        QCadastroDESC_ENDERECO.Value := VarToStr(js.Field['ender'].Field['xLgr'].Value) + ', '
          + VarToStr(js.Field['ender'].Field['nro'].Value);       
        QCadastroDESC_CEP.Value := FormatMaskText('99.999-999;0;_', VarToStr(js.Field['ender'].Field['CEP'].Value));
        codIbgeCidade := VarToStr(js.Field['ender'].Field['cMun'].Value);
        if Pos('Excesso',js.getString('xRegApur')) > 0 then
          QCadastroIND_REGIME_TRIBUTARIO.Value := 2
        else if Pos('Simples Nacional',js.getString('xRegApur')) > 0 then
          QCadastroIND_REGIME_TRIBUTARIO.Value := 1
        else
          QCadastroIND_REGIME_TRIBUTARIO.Value := 3;

        // Recupera o código da cidade
        codCidade := DMOracle.FastSelect('COD_CIDADE', 'TB_CIDADE','COD_CIDADE_IBGE = ' + copy(codIbgeCidade,3,5)
          + ' AND COD_ESTADO = ' + QuotedStr(QCadastroCOD_ESTADO.Value));
        if codCidade <> '' then
        begin
          QCadastroCOD_CIDADE.Text := codCidade;
          DBPCidadeExit(Self);
        end;
      end;
    end;
    MeDocumentoSefaz.Clear;
  end
  else
  begin
    if FCadastroCons = nil then
       FCadastroCons := TFCadastroCons.Create(Application);
    if FCadastroCons.ShowModal = mrOk then
      with DMCadastro do
      begin
        QCadastro.Close;
        QCadastro.SetVariable('PK', QCadastroConsCod_Cadastro.Value);
        QCadastro.Open;
        MostraVendaLiberada;
      end;
  end;
end;

procedure TFCadastroCad.TSJuridicaEnter(Sender: TObject);
begin
  inherited;
  //DMCadastro.QCadastroNum_CGC_CPF.EditFormat := '##"."###"."###"/"####"-"##;0;';
  //DMCadastro.QCadastroNum_CGC_CPF.DisplayFormat := '##"."###"."###"/"####"-"##;0;';
end;

procedure TFCadastroCad.Encerrados1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[1].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QREncerrado.Close;
      //Frames-----------
      if Trim(FCadastroParam.FmTipoCadastro2.MeTipoCadastro.Text) = '' then
        QREncerrado.SetVariable('TIPO_CADASTRO', Null)
      else
        QREncerrado.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro2.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao2.MeRegiao.Text) = '' then
        QREncerrado.SetVariable('REGIAO', Null)
      else
        QREncerrado.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao2.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo2.MeRamo.Text) = '' then
        QREncerrado.SetVariable('RAMO', Null)
      else
        QREncerrado.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo2.MeRamo.Text)));

      if Trim(FCadastroParam.FmVendedor2.MeVendedor.Text) = '' then
        QREncerrado.SetVariable('VENDEDOR', Null)
      else
        QREncerrado.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor2.MeVendedor.Text)));

      if Trim(FCadastroParam.FmEstado2.MeEstado.Text) = '' then
        QREncerrado.SetVariable('ESTADO', Null)
      else
        QREncerrado.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado2.MeEstado.Text));

      if Trim(FCadastroParam.FmMotivo2.MeMotivo.Text) = '' then
        QREncerrado.SetVariable('MOTIVO', Null)
      else
        QREncerrado.SetVariable('MOTIVO', StrToInt(Trim(FCadastroParam.FmMotivo2.MeMotivo.Text)));
      //--------------------
      case FCadastroParam.CB1Ordem.ItemIndex of
        0: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.NOME');
        1: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_REGIAO');
        3: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_RAMO');
        4: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_ESTADO');
        5: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_MOTIVO');
        6: QREncerrado.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QREncerrado.Open;
      if FRCadastro_Encerrado = nil then
        FRCadastro_Encerrado := TFRCadastro_Encerrado.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Encerrado.QRPrimario.Preview
      else
        FRCadastro_Encerrado.QRPrimario.Print;
      QREncerrado.Close;
      QREncerrado.SQL[QREncerrado.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.Padro1Click(Sender: TObject);
var
{Variaveis criadas para obter os parametros do relatório e exibi-los. Alex 30/06/2023}
  wOrdem, wTipoCadastro, wFantasia, wVendaAtraso, wSituacao: string;
begin
  inherited;
  if FCadastroParam = nil then
     FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[0].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCliente.Close;
      QRCliente_Fantasia.Close;
      //Frames----------------
      if Trim(FCadastroParam.FmTipoCadastro1.MeTipoCadastro.Text) = '' then
        QRCliente.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCliente.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro1.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao1.MeRegiao.Text) = '' then
        QRCliente.SetVariable('REGIAO', Null)
      else
        QRCliente.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao1.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo1.MeRamo.Text) = '' then
        QRCliente.SetVariable('RAMO', Null)
      else
        QRCliente.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo1.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado1.MeEstado.Text) = '' then
        QRCliente.SetVariable('ESTADO', Null)
      else
        QRCliente.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado1.MeEstado.Text));

      if Trim(FCadastroParam.FmCidade1.MeCidade.Text) = '' then
        QRCliente.SetVariable('CIDADE', Null)
      else
        QRCliente.SetVariable('CIDADE', Trim(FCadastroParam.FmCidade1.MeCidade.Text));

      if Trim(FCadastroParam.FmClassificacao1.MeClassificacao.Text) = '' then
        QRCliente.SetVariable('CLASSIFICACAO', Null)
      else
        QRCliente.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao1.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor1.MeVendedor.Text) = '' then
        QRCliente.SetVariable('VENDEDOR', Null)
      else
        QRCliente.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor1.MeVendedor.Text)));

      if Trim(FCadastroParam.Fm2Vendedor1.MeVendedor.Text) = '' then
        QRCliente.SetVariable('COD_SUPERVISOR', Null)
      else
        QRCliente.SetVariable('COD_SUPERVISOR', StrToInt(Trim(FCadastroParam.Fm2Vendedor1.MeVendedor.Text)));

      if Trim(FCadastroParam.FmCadastro1.MeCadastro.Text) = '' then
        QRCliente.SetVariable('COD_CADASTRO', Null)
      else
        QRCliente.SetVariable('COD_CADASTRO', Trim(FCadastroParam.FmCadastro1.MeCadastro.Text));
      if Trim(FCadastroParam.MeBairro.Text) = '' then
        QRCliente.SetVariable('DESC_BAIRRO', Null)
      else
        QRCliente.SetVariable('DESC_BAIRRO', Trim(FCadastroParam.MeBairro.Text));
      //----------------------
      if Trim(FCadastroParam.ME0Data.Text) <> '' then
        QRCliente.SetVariable('DATA', StrToDate(FCadastroParam.ME0Data.Text))
      else
        QRCliente.SetVariable('DATA', Null);
      if Trim(FCadastroParam.ME0DataF.Text) <> '' then
        QRCliente.SetVariable('DATA_F', StrToDate(FCadastroParam.ME0DataF.Text))
      else
        QRCliente.SetVariable('DATA_F', Null);
      //DT_VCTO_TABELA_PRECO - UTILIZADO COMO DT DE VCTO DE ASSINATURA PARA JORNAL MENSAGEIRO - JUNIOR 13/01/2021.
      if Trim(FCadastroParam.FmDatasVctoAssinatura.MeDtInicial.Text) <> '' then
        QRCliente.SetVariable('DATA_VCTO_I', StrToDate(FCadastroParam.FmDatasVctoAssinatura.MeDtInicial.Text))
      else
        QRCliente.SetVariable('DATA_VCTO_I', Null);
      if Trim(FCadastroParam.FmDatasVctoAssinatura.MeDtFinal.Text) <> '' then
        QRCliente.SetVariable('DATA_VCTO_F', StrToDate(FCadastroParam.FmDatasVctoAssinatura.MeDtFinal.Text))
      else
        QRCliente.SetVariable('DATA_VCTO_F', Null);

      if FCadastroParam.RG0TipoCadastro.ItemIndex = 0 then
      begin
        QRCliente.SetVariable('IND_FISICA_JURIDICA', 'F');
        wTipoCadastro := 'Física';
      end;
      if FCadastroParam.RG0TipoCadastro.ItemIndex = 1 then
      begin
        QRCliente.SetVariable('IND_FISICA_JURIDICA', 'J');
        wTipoCadastro := 'Jurídica';
      end;
      if FCadastroParam.RG0TipoCadastro.ItemIndex = 2 then
      begin
        QRCliente.SetVariable('IND_FISICA_JURIDICA', null);
        wTipoCadastro := 'Todos';
      end;
      if FCadastroParam.RG0LiberaVenda.ItemIndex = 0 then
      begin
        QRCliente.SetVariable('IND_LIBERA_VENDA', 'SIM');
        wVendaAtraso := 'Liberado Venda c/Atraso';
      end;
      if FCadastroParam.RG0LiberaVenda.ItemIndex = 1 then
      begin
        QRCliente.SetVariable('IND_LIBERA_VENDA', 'NAO');
        wVendaAtraso := 'Bloquado Venda c/Atraso';
      end;
      if FCadastroParam.RG0LiberaVenda.ItemIndex = 0 then
      begin
        QRCliente.SetVariable('IND_LIBERA_VENDA', NULL);
        wVendaAtraso := 'Todos';
      end;
{Alterado para trazer todos os cadastros. Alex 30/06/2023}
      case FCadastroParam.Rg0Cancelado.ItemIndex of
        0:
        begin
          QRCliente.SQL.Add('AND TB_CADASTRO.COD_MOTIVO IS NOT NULL');//Cancelados
          wSituacao := 'Cancelados';
        end;
        1:
        begin
          QRCliente.SQL.Add('AND TB_CADASTRO.COD_MOTIVO IS NULL'); //Ativos
          wSituacao := 'Ativos';
        end;
        2 :
        begin
          QRCliente.SQL.Add('AND (TB_CADASTRO.COD_MOTIVO IS NULL OR TB_CADASTRO.COD_MOTIVO IS NOT NULL)'); // Todos
          wSituacao := 'Todos';
        end;
      end;

      case FCadastroParam.CB0Ordem.ItemIndex of
        0:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.NOME');
          wOrdem := 'Nome';
        end;
        1:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO,TB_CADASTRO.NOME');
          wOrdem := 'Tipo Cadastro, Nome';
        end;
        2:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO,TB_CADASTRO.NOME');
          wOrdem := 'Região, Nome';
        end;
        3:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO,TB_CADASTRO.NOME');
          wOrdem := 'Ramo, Nome';
        end;
        4:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO,TB_CADASTRO.NOME');
          wOrdem := 'Estado, Nome';
        end;
        5:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO,TB_CADASTRO.NOME');
          wOrdem := 'Código cadastro, Nome';
        end;
        6:
        begin
          QRCliente.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.NOME');
          wOrdem := 'Cidade, Nome';
        end
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end;

      QRCliente.SetVariable('IND_NOME','NOME');
      QRCliente.Open;
      QRCliente_Fantasia.Open;

      if FRCadastro_Cliente = nil then
        FRCadastro_Cliente := TFRCadastro_Cliente.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
      begin
        FRCadastro_Cliente.QRDBText8.DataField := 'DESC_TELEFONE';
        FRCadastro_Cliente.QRLabel11.Caption := 'Telefone';
        FRCadastro_Cliente.QRDBText6.DataField := 'DESC_FANTASIA';
        //       FRCadastro_Cliente.QRDBText6.AutoSize := True; <- Linha removida: solicitação de Marcia - Moinho
        FRCadastro_Cliente.QRDBText6.Width := 150;
        FRCadastro_Cliente.QRLabel9.Caption := 'Fantasia';
        FRCadastro_Cliente.QRDBText5.DataField := '';
        //       FRCadastro_Cliente.QRDBText7.DataField := ''; <- Linha removida: solicitação de Marcia - Moinho
        //       FRCadastro_Cliente.QRDBText5.Left := 923; <- Linha removida: solicitação de Marcia - Moinho
        //       FRCadastro_Cliente.QRDBText7.Left := 923; <- Linha removida: solicitação de Marcia - Moinho
        FRCadastro_Cliente.QRLabel8.Caption := '';
        //       FRCadastro_Cliente.QRLabel10.Caption := ''; <- Linha removida: solicitação de Marcia - Moinho
        FRCadastro_Cliente.QRDBText7.Font.Size := 7;
      end;
      case FCadastroParam.Rg0Fantasia.ItemIndex of
        0:
        begin
          FRCadastro_Cliente.QRSubDetail1.Enabled := True;
          wFantasia := 'SIM';
        end;
        1:
        begin
          FRCadastro_Cliente.QRSubDetail1.Enabled := False;
          wFantasia := 'NÃO';
        end;
      end;
      FRCadastro_Cliente.QRLData.Caption := Bib.DatasParaLabel(FCadastroParam.ME0Data.Text,
        FCadastroParam.ME0DataF.Text);
      FRCadastro_Cliente.QRLVendedor.Caption := '';
{      if Trim(FCadastroParam.FmVendedor1.MeVendedor.Text) <> '' then
        FRCadastro_Cliente.QRLVendedor.Caption := 'Rep.Comercial: ' + Trim(FCadastroParam.FmVendedor1.MeVendedor.Text) + ' - ' + Trim(FCadastroParam.FmVendedor1.EdVendedor.Text);
Comentado e adicionado a linha abaixo para listar os parametros no relatório. Alex 30/06/2023}
      FRCadastro_Cliente.QRLVendedor.Caption := 'Parametros: Tipo Cadastro : ' + FCadastroParam.FmTipoCadastro1.EdTipoCadastro.Text + ' Região: ' +
         FCadastroParam.FmRegiao1.EdRegiao.Text  + ' Ramo: ' + FCadastroParam.FmRamo1.EdRamo.Text  + ' Vendedor: ' + Trim(FCadastroParam.FmVendedor1.MeVendedor.Text)
         + ' - ' + Trim(FCadastroParam.FmVendedor1.EdVendedor.Text) + ' Estado: ' + FCadastroParam.FmEstado1.EdEstado.Text + ' Classificação: ' +
         FCadastroParam.FmClassificacao1.EdClassificacao.Text + ' Cidade: ' + FCadastroParam.FmCidade1.EdCidade.Text + ' Tipo de cadastro: ' + wTipoCadastro +
         ' Situação: ' + wSituacao + ' Ordem: ' + wOrdem + 'Nome Fantasia: ' + wFantasia;

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Cliente.QRPrimario.Preview
      else
        FRCadastro_Cliente.QRPrimario.Print;

      QRCliente.Close;
      QRCliente_Fantasia.Close;

      //QRCliente.SQL[QRCliente.SQL.Count - 1] := '';
      QRCliente.SQL.Delete(QRCliente.SQL.Count - 1);
      QRCliente.SQL.Delete(QRCliente.SQL.Count - 1);
    end;
end;

procedure TFCadastroCad.Aniversariantes1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[2].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRAniversariante.Close;
      QRAniversariante.SetVariable('MES_I', bib.StrZeroDecimal(StrToFloat(FCadastroParam.CB2MesI.Text),2,0));
      QRAniversariante.SetVariable('MES_F', bib.StrZeroDecimal(StrToFloat(FCadastroParam.CB2MesF.Text),2,0));
      QRAniversariante.SetVariable('DIA_I', bib.StrZeroDecimal(StrToFloat(FCadastroParam.CB2DiaI.Text),2,0));  
      QRAniversariante.SetVariable('DIA_F', bib.StrZeroDecimal(StrToFloat(FCadastroParam.CB2DiaF.Text),2,0));

      //Frames--------------------
      if Trim(FCadastroParam.FmTipoCadastro3.MeTipoCadastro.Text) = '' then
        QRAniversariante.SetVariable('TIPO_CADASTRO', Null)
      else
        QRAniversariante.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro3.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRamo3.MeRamo.Text) = '' then
        QRAniversariante.SetVariable('RAMO', Null)
      else
        QRAniversariante.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo3.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado3.MeEstado.Text) = '' then
        QRAniversariante.SetVariable('ESTADO', Null)
      else
        QRAniversariante.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado3.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao3.MeClassificacao.Text) = '' then
        QRAniversariante.SetVariable('CLASSIFICACAO', Null)
      else
        QRAniversariante.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao3.MeClassificacao.Text)));
      //----------------------------
      case FCadastroParam.CB2Ordem.ItemIndex of
        0: QRAniversariante.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QRAniversariante.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QRAniversariante.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO');
        3: QRAniversariante.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO');
        4: QRAniversariante.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
        5: QRAniversariante.SQL.Add('ORDER BY TO_CHAR(TB_CADASTRO.DT_NASCIMENTO,' + chr(39) + 'MMDD' + chr(39) + ')');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      QRAniversariante.Open;
      if FRCadastro_Aniversariante = nil then
        FRCadastro_Aniversariante := TFRCadastro_Aniversariante.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Aniversariante.QRPrimario.Preview
      else
        FRCadastro_Aniversariante.QRPrimario.Print;
      QRAniversariante.Close;
      QRAniversariante.SQL[QRAniversariante.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.MalaDireta1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[3].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRMalaDireta.Close;

      //Frames------------------
      if Trim(FCadastroParam.FmCadastro4.MeCadastro.Text) = '' then
        QRMalaDireta.SetVariable('CADASTRO', Null)
      else
        QRMalaDireta.SetVariable('CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro4.MeCadastro.Text)));

      if Trim(FCadastroParam.FmTipoCadastro4.MeTipoCadastro.Text) = '' then
        QRMalaDireta.SetVariable('TIPO_CADASTRO', Null)
      else
        QRMalaDireta.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro4.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao4.MeRegiao.Text) = '' then
        QRMalaDireta.SetVariable('REGIAO', Null)
      else
        QRMalaDireta.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao4.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo4.MeRamo.Text) = '' then
        QRMalaDireta.SetVariable('RAMO', Null)
      else
        QRMalaDireta.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo4.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado4.MeEstado.Text) = '' then
        QRMalaDireta.SetVariable('ESTADO', Null)
      else
        QRMalaDireta.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado4.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao4.MeClassificacao.Text) = '' then
        QRMalaDireta.SetVariable('CLASSIFICACAO', Null)
      else
        QRMalaDireta.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao4.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor4.MeVendedor.Text) = '' then
        QRMalaDireta.SetVariable('VENDEDOR', Null)
      else
        QRMalaDireta.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor4.MeVendedor.Text)));
      //--------------------------
      if Trim(FCadastroParam.ME3Data.Text) = '' then
        QRMalaDireta.SetVariable('DT_REFERENCIA', StrToDate('01/01/1900'))
      else
        QRMalaDireta.SetVariable('DT_REFERENCIA', StrToDate(Trim(FCadastroParam.ME3Data.Text)));

      QRMalaDireta.Open;
      if FRCadastro_MalaDireta = nil then
        FRCadastro_MalaDireta := TFRCadastro_MalaDireta.Create(Application);
      //    FRCadastro_MalaDireta.QRLMensagem.Caption := FCadastroParam.ME4Mensagem.Text;
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_MalaDireta.QRPrimario.Preview
      else
        FRCadastro_MalaDireta.QRPrimario.Print;
      QRMalaDireta.Close;
    end;
end;

procedure TFCadastroCad.PropriedadesCadastro1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[4].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRProprCadastro.Close;

      //Frames--------------
      if Trim(FCadastroParam.FmCadastro5.MeCadastro.Text) = '' then
        QRProprCadastro.SetVariable('COD_CADASTRO', Null)
      else
        QRProprCadastro.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro5.MeCadastro.Text)));

      if Trim(FCadastroParam.FmTipoCadastro5.MeTipoCadastro.Text) = '' then
        QRProprCadastro.SetVariable('TIPO_CADASTRO', Null)
      else
        QRProprCadastro.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro5.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao5.MeRegiao.Text) = '' then
        QRProprCadastro.SetVariable('REGIAO', Null)
      else
        QRProprCadastro.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao5.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo5.MeRamo.Text) = '' then
        QRProprCadastro.SetVariable('RAMO', Null)
      else
        QRProprCadastro.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo5.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado5.MeEstado.Text) = '' then
        QRProprCadastro.SetVariable('ESTADO', Null)
      else
        QRProprCadastro.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado5.MeEstado.Text));
      //---------------------
      case FCadastroParam.CB4Ordem.ItemIndex of
        0: QRProprCadastro.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
        1: QRProprCadastro.SQL.Add('ORDER BY TB_CADASTRO.NOME');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      QRProprCadastro.Open;
      if FRCadastro_Propriedade = nil then
        FRCadastro_Propriedade := TFRCadastro_Propriedade.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Propriedade.QRPrimario.Preview
      else
        FRCadastro_Propriedade.QRPrimario.Print;
      QRProprCadastro.Close;
      QRProprCadastro.SQL[QRProprCadastro.SQL.Count - 1] := '';

    end;
end;

procedure TFCadastroCad.BtConsUfClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
  begin
    DMCadastro.QCadastroDESC_NATURALIDADE.Value := DMCidade.QCidadeConsDESC_CIDADE.Value;
    DMCadastro.QCadastroDESC_ESTADO_NATURAL.Value := DMCidade.QCidadeConsCod_Estado.Value; //DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO ' , 'COD_ESTADO = '+CHR(39)+Trim(DMCidade.QCidadeConsCod_Estado.Text)+CHR(39) );
  end;

  {  If FEstadoCons = Nil then
      FEstadoCons := TFEstadoCons.Create(Application);
    If FEstadoCons.ShowModal = mrOk then
      DMCadastro.QCadastroDesc_Estado_Natural.Value := DMEstado.QEstadoConsCod_Estado.Value;}

end;

procedure TFCadastroCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FPropriedadeCons = nil then
    FPropriedadeCons := TFPropriedadeCons.Create(Application);
  FPropriedadeCons.MECadastro.Text := DMCadastro.QCadastroCOD_CADASTRO.Text;
  // FPropriedadeCons.MECadastro.Enabled := False;
  // FPropriedadeCons.BtConsCadastro.Enabled := False;

  if FPropriedadeCons.ShowModal = mrOk then
    with DMCadastro do
    begin
      QPropriedade.Close;
      QPropriedade.SetVariable('PK', QPropriedadeConsCod_Propriedade.Value);
      QPropriedade.Open;
    end;
end;

procedure TFCadastroCad.Propriedades1Click(Sender: TObject);
begin
  inherited;
  DMCadastro_Rel.QRPropriedade.Open;
  if FRPropriedade_Propriedade = nil then
    FRPropriedade_propriedade := TFRPropriedade_propriedade.Create(Application);
  FRPropriedade_Propriedade.QRPrimario.Preview;
  DMCadastro_Rel.QRPropriedade.Close;
end;

procedure TFCadastroCad.BtConsTipoPropriedadeClick(Sender: TObject);
begin
  inherited;
  if FTipoPropriedadeCons = nil then
    FTipoPropriedadeCons := TFTipoPropriedadeCons.Create(Application);
  if FTipoPropriedadeCons.ShowModal = mrOk then
    DMCadastro.QPropriedadeCod_Tipo_Propriedade.Value := DMTipoPropriedade.QTipoPropriedadeConsCod_Tipo_Propriedade.Value;
end;

procedure TFCadastroCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMCadastro.QPropriedadeCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFCadastroCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(14);
end;

procedure TFCadastroCad.MalaDiretaAniversriantes1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[5].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SetVariable('MES_DIA_I', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_I.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_I.Text)));
      QRMalaDireta_Aniver.SetVariable('MES_DIA_F', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_F.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_F.Text)));

      //Frames-------------------
      if Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao6.MeRegiao.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('REGIAO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao6.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo6.MeRamo.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('RAMO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo6.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado6.MeEstado.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('ESTADO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado6.MeEstado.Text));
      //---------------------------
      case FCadastroParam.CB5Ordem.ItemIndex of
        0: QRMalaDireta_Aniver.SQL.Add('ORDER BY NOME_CONTATO');
        1: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_TIPO_CADASTRO');
        2: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_RAMO');
        3: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_ESTADO');
        4: QRMalaDireta_Aniver.SQL.Add('ORDER BY TO_CHAR(DT_NASCIMENTO_CONTATO,' + chr(39) + 'MMDD' + chr(39) + ')');
        5: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QRMalaDireta_Aniver.Open;
      if FRCadastro_Aniversariante_Contato = nil then
        FRCadastro_Aniversariante_Contato := TFRCadastro_Aniversariante_Contato.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Aniversariante_Contato.Preview
      else
        FRCadastro_Aniversariante_Contato.Print;
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SQL[QRMalaDireta_Aniver.SQL.Count - 1] := '';
    end;

end;

procedure TFCadastroCad.CadastroContato1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[6].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCadastroContato.Close;

      //Frames---------------
      if Trim(FCadastroParam.FmTipoCadastro7.MeTipoCadastro.Text) = '' then
        QRCadastroContato.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCadastroContato.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro7.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao7.MeRegiao.Text) = '' then
        QRCadastroContato.SetVariable('REGIAO', Null)
      else
        QRCadastroContato.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao7.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo7.MeRamo.Text) = '' then
        QRCadastroContato.SetVariable('RAMO', Null)
      else
        QRCadastroContato.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo7.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado7.MeEstado.Text) = '' then
        QRCadastroContato.SetVariable('ESTADO', Null)
      else
        QRCadastroContato.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado7.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao7.MeClassificacao.Text) = '' then
        QRCadastroContato.SetVariable('CLASSIFICACAO', Null)
      else
        QRCadastroContato.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao7.MeClassificacao.Text)));
      //------------------------
      case FCadastroParam.CB6Ordem.ItemIndex of
        0: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO');
        3: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO');
        4: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO');
        5: QRCadastroContato.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      case FCadastroParam.Rg6Cancelado.ItemIndex of
        0: QRCadastroContato.SetVariable('MOTIVO', 'SIM');
        1: QRCadastroContato.SetVariable('MOTIVO', 'NAO');
      end;

      QRCadastroContato.Open;
      if FRCadastroContato = nil then
        FRCadastroContato := TFRCadastroContato.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastroContato.QRPrimario.Preview
      else
        FRCadastroContato.QRPrimario.Print;
      QRCadastroContato.Close;
      QRCadastroContato.SQL[QRCadastroContato.SQL.Count - 1] := '';
    end;

end;

procedure TFCadastroCad.AniversarianteContatos1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[5].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SetVariable('MES_DIA_I', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_I.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_I.Text)));
      QRMalaDireta_Aniver.SetVariable('MES_DIA_F', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_F.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_F.Text)));
      //Frames---------------------------
      if Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao6.MeRegiao.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('REGIAO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao6.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo6.MeRamo.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('RAMO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo6.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado6.MeEstado.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('ESTADO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado6.MeEstado.Text));
      //--------------------------
      case FCadastroParam.CB5Ordem.ItemIndex of
        0: QRMalaDireta_Aniver.SQL.Add('ORDER BY NOME_CONTATO');
        1: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_TIPO_CADASTRO');
        2: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_RAMO');
        3: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_ESTADO');
        4: QRMalaDireta_Aniver.SQL.Add('ORDER BY TO_CHAR(DT_NASCIMENTO_CONTATO,' + chr(39) + 'MMDD' + chr(39) + ')');
        5: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QRMalaDireta_Aniver.Open;
      if FRCadastro_Aniver_Contato = nil then
        FRCadastro_Aniver_Contato := TFRCadastro_Aniver_Contato.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Aniver_Contato.QrPrimario.Preview
      else
        FRCadastro_Aniver_Contato.QrPrimario.Print;
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SQL[QRMalaDireta_Aniver.SQL.Count - 1] := '';
    end;

end;

procedure TFCadastroCad.PageControl2Change(Sender: TObject);
begin
  inherited;
  with DmCadastro do
  begin
    QProprCadastro.Close;
    QProprCadastro.Open;
  end;
end;

procedure TFCadastroCad.Etiquetas1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[7].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QREtiquetas.Close;

      //Frames---------------
      if Trim(FCadastroParam.Fm1Cadastro8.MeCadastro.Text) <> '' then
        QREtiquetas.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.Fm1Cadastro8.MeCadastro.Text)));

      QREtiquetas.Open;

      QREtiquetas2.Close;

      if Trim(FCadastroParam.Fm2Cadastro8.MeCadastro.Text) <> '' then
        QREtiquetas2.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.Fm2Cadastro8.MeCadastro.Text)));
      //----------------------
      QREtiquetas2.Open;

      if Etiquetas = nil then
        Etiquetas := TEtiquetas.Create;
      Etiquetas.pNumCopias := Trunc(FCadastroParam.SE7NrCopias.Value);
      Etiquetas.pNumCopias2 := Trunc(FCadastroParam.SE7NrCopias2.Value);
      //     if DMParamSistema.QParamSistemaCod_Empresa.Text = 'RADIO' then
      //       Etiquetas.EmiteEtiquetas(3,0)
      //     else
      Etiquetas.EmiteEtiquetas(2, 0);
    end;
end;

procedure TFCadastroCad.QtCadastroClassificao1Click(Sender: TObject);
begin
  inherited;
  with DMClassCadastro do
  begin
    QRClassCadastro.Close;
    QRClassCadastro.Open;
    if FRCadastro_Qt_Classificacao = nil then
      FRCadastro_Qt_Classificacao := TFRCadastro_Qt_Classificacao.Create(Application);
    FRCadastro_Qt_Classificacao.QRPrimario.Preview;
    QRClassCadastro.Close;
  end;
end;

procedure TFCadastroCad.Envelopes1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[8].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCadastroEnvelopes.Close;

      //Frames---------------------
      if Trim(FCadastroParam.FmTipoCadastro9.MeTipoCadastro.Text) = '' then
        QRCadastroEnvelopes.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCadastroEnvelopes.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro9.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao9.MeRegiao.Text) = '' then
        QRCadastroEnvelopes.SetVariable('REGIAO', Null)
      else
        QRCadastroEnvelopes.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao9.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo9.MeRamo.Text) = '' then
        QRCadastroEnvelopes.SetVariable('RAMO', Null)
      else
        QRCadastroEnvelopes.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo9.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado9.MeEstado.Text) = '' then
        QRCadastroEnvelopes.SetVariable('ESTADO', Null)
      else
        QRCadastroEnvelopes.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado9.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao9.MeClassificacao.Text) = '' then
        QRCadastroEnvelopes.SetVariable('CLASSIFICACAO', Null)
      else
        QRCadastroEnvelopes.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao9.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor9.MeVendedor.Text) = '' then
        QRCadastroEnvelopes.SetVariable('VENDEDOR', Null)
      else
        QRCadastroEnvelopes.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor9.MeVendedor.Text)));

      if Trim(FCadastroParam.FmCadastro9.MeCadastro.Text) = '' then
        QRCadastroEnvelopes.SetVariable('CADASTRO', Null)
      else
        QRCadastroEnvelopes.SetVariable('CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro9.MeCadastro.Text)));
      //-------------------------------
      QRCadastroEnvelopes.Open;
      if FRCadastroEnvelope = nil then
        FRCadastroEnvelope := TFRCadastroEnvelope.Create(Application);
//      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then // para impressao laser envolope personalizado
//        FRCadastroEnvelope.QrBand2.Height := 250;
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastroEnvelope.QRPrimario.Preview
      else
        FRCadastroEnvelope.QRPrimario.Print;
      QRCadastroEnvelopes.Close;
    end;
end;

procedure TFCadastroCad.SBConfirmarClick(Sender: TObject);
var
  wCadastro, wPis: string;
  wCont_Telefone, ValorPerfilSelecionado, indice: integer;
begin
//  PCCadastro.ActivePage := TSCadastro;
//  DBECodCadastro.SetFocus;
  DMParamSistema.QParamSistema.RefreshRecord;
  DMCadastro.QCadastro.UpdateRecord;
  
  {
    A seguir, comentado por Gian 27/10/2017, casa das tintas solicitou ser possível não informar RG/IE mas obrigar informar Cpf/Cnpj
    autorizado por Cesar Angonese 26/10/2017

  if (DMParamSistema.QParamSistemaIND_CADASTRO_OBRIGATORIO.Value = 'S') And
     (DMCadastro.QCadastroCOD_ESTADO.Value <> 'EX') Then
  begin
    if (DbRadioGroup2.ItemIndex = 0) then // pessoa fisica
    begin
      if ((DBEdit13.Text = '') or // cpf
         (DBEdit51.Text = '')) then // identidade
        raise Exception.Create('Obrigatório Informar a Identidade e Cpf para pessoa Física');
      if DBEdit13.Text <> '' then
        if not (Bib.ValidaCpf(DBEdit13.Text)) then
          raise exception.Create('Cpf Inválido!');
    end
    else
    begin
      if ((DBEdit40.Text = '') or //cnpj
          (DBEIncricaoEstadual.Text = '')) then
          raise Exception.Create('Obrigatório Informar o Cpnj e Inscrição para pessoa Jurídica');

      if not (Bib.ValidaCgc(DbEdit40.Text)) then
         raise exception.Create('CNPJ Inválido!');
      if (DMCadastro.QCadastroCOD_ESTADO.Value <> 'BA') and
         (DMCadastro.QCadastroCOD_ESTADO.Value <> 'RO') and
         (DMCadastro.QCadastroCOD_ESTADO.Value <> 'AL') then
         if not (Bib.ValidaIEstadual(DBEIncricaoEstadual.Text, DMCadastro.QCadastroCOD_ESTADO.Value)) then
            raise exception.Create('Inscrição Estadual Inválido!');
    end;
  end; }
  if (DMParamSistema.QParamSistemaIND_CADASTRO_OBRIGATORIO.Value = 'S') And
     (DMCadastro.QCadastroCOD_ESTADO.Value <> 'EX') Then
  begin
    if (DbRadioGroup2.ItemIndex = 0) then // pessoa fisica
    begin
      if (DBEdit13.Text = '') then // cpf
        raise Exception.Create('Obrigatório Informar o Cpf para pessoa Física');
      if DBEdit13.Text <> '' then
        if not (Bib.ValidaCpf(DBEdit13.Text)) then
          raise exception.Create('Cpf Inválido!');
    end
    else
    begin
      if (DBEdit40.Text = '') then //cnpj                                                 
          raise Exception.Create('Obrigatório Informar o Cpnj para pessoa Jurídica');
      if not (Bib.ValidaCgc(DbEdit40.Text)) then
         raise exception.Create('CNPJ Inválido!');
    end;
  end;

  // Reforma tributaria - campo para o tipo de perfil tributário da pessoa
  if CBPerfilTributario.ItemIndex <= 0 then
  begin
    DMCadastro.QCadastroIND_PERFIL_TRIBUTARIO.Clear;
  end
  else
  begin
    // Subtrai 1 para gravar exatamente o código correto do seu Enum (0 a 5)
    DMCadastro.QCadastroIND_PERFIL_TRIBUTARIO.AsInteger := CBPerfilTributario.ItemIndex - 1;
  end;                                   
 
  if (DMParamSistema.QParamSistemaIND_CADASTRO_OBRIGATORIO_RG.Value = 'S') And
     (DMCadastro.QCadastroCOD_ESTADO.Value <> 'EX') Then
  begin
{Comentado pois o RG não é mais obrigatório, apenas o CPF. Alex 06/04/2026.
    if (DbRadioGroup2.ItemIndex = 0) then // pessoa fisica
    begin
      if (DBEdit51.Text = '') then // identidade
        raise Exception.Create('Obrigatório Informar a Identidade para pessoa Física');
    end                          }
    if (DbRadioGroup2.ItemIndex <> 0) then
    begin
      if (DBEIncricaoEstadual.Text = '') then
          raise Exception.Create('Obrigatório Informar a Inscrição para pessoa Jurídica');
      if (DMCadastro.QCadastroCOD_ESTADO.Value <> 'BA') and
         (DMCadastro.QCadastroCOD_ESTADO.Value <> 'RO') and
         (DMCadastro.QCadastroCOD_ESTADO.Value <> 'AL') and
         (DMCadastro.QCadastroCOD_ESTADO.Value <> 'MG') then
         if not (Bib.ValidaIEstadual(DBEIncricaoEstadual.Text, DMCadastro.QCadastroCOD_ESTADO.Value)) then
            raise exception.Create('Inscrição Estadual Inválido!');
    end;
  end;
  //Gian: Solicitado por Marcos 22/09/2017
  //Se obrigatório informar consumidor final
  if DMParamSistema.QParamSistemaIND_OBRIGA_CONSUMIDOR_FINAL.Text = 'S' then
    if (DBRTipoConsumidor.Value <> 'S') and (DBRTipoConsumidor.Value <> 'N') then
      raise exception.Create('Obrigatório informar consumidor final!');
  DBPMotivoCodigoExit(Self);
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') tHEN
     if DBRadioGroup2.ItemIndex = 0 then
       if DBComboBox1.Text = '' then
          raise Exception.Create('Para Pessoa Física é Obrigado ' + chr(13) + 'Informar %Funrural')
       else if (DbComboBox1.Text <> '2,3') and (DbComboBox1.Text <> '2,7') then
               raise Exception.Create('%Funrural Informado Errado');
  if (not DMCadastro.QCadastroNUM_CGC_CPF.IsNull) and
     (DMParamSistema.QParamSistemaIND_BLOQUEIO_CGC.Value = 'S') then
  begin
    wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO',
      'REPLACE(REPLACE(REPLACE(REPLACE(NUM_CGC_CPF, ' + QuotedStr('.') + '), ' +
      QuotedStr('-') + '), ' + QuotedStr('/') + '), ' + QuotedStr(' ') + ') = ' +
      QuotedStr(Bib.LimpaNumero(DMCadastro.QCadastroNUM_CGC_CPF.Text)) + ' ORDER BY 1');
    if (wCadastro <> '') and (wCadastro <> DMCadastro.QCadastroCOD_CADASTRO.Text) then
      raise Exception.Create('CPF/CNPJ já utilizado no cadastro de código ' + wCadastro + '.')
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
    (Trim(DMCadastro.QCadastroCOD_TIPO_CADASTRO.Text) = '1') and
    (Trim(DMCadastro.QCadastroCOD_VENDEDOR.Text) = '') then
    raise Exception.Create('Obrigatório Informar Codigo do Vendedor');
  if (Trim(DMCadastro.QCadastroDT_CANCELAMENTO.Text) = '') and (Trim(DMCadastro.QCadastroCOD_MOTIVO.Text) <> '') then
    raise Exception.Create('Quando informar data de cancelamento - informar tambem o motivo cancelamento');
  if Trim(DbEdit99.Text) <> '' then // consistencia inss
  begin
    wPis := Bib.TiraMascara(Trim(DbEdit99.Text));
    if Length(wPis) <> 11 then
      raise Exception.Create('Inscrição INSS Incompleta');
    if not (Bib.ValidaPis(wPis)) then
      raise Exception.Create('Inscrição INSS Inválida');
  end;
  if (DSPrimario.State in [DsEdit]) then
    DMCadastro.QCadastroDT_ALTERACAO.Value := DATE;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO') Then
   Begin    // SOLICITADO PELO MARCOS A PEDIDO DO NEREU FEITO PELO CESAR 04/02/2022
     wCont_Telefone := 0;
     If Trim(DMCadastro.QCadastroDESC_TELEFONE.Text) <> '' Then
        wCont_Telefone := wCont_Telefone + 1;
     If Trim(DMCadastro.QCadastroDESC_TELEFONE_COMERCIAL.Text) <> '' Then
        wCont_Telefone := wCont_Telefone + 1;
     If Trim(DMCadastro.QCadastroDESC_CELULAR.Text) <> '' Then
        wCont_Telefone := wCont_Telefone + 1;
     If wCont_Telefone < 2 Then
        Raise Exception.Create('Preencher no minimo 2 telefones');
  End;
  if (DMParamSistema.CodEmpresa = 'DEION') then // Solicitação Deion(Junior). Junior 03/03/2023 suporte #6543
  begin
    with DMCadastro do
    begin
      if (QCadastroIND_FISICA_JURIDICA.Value = 'F') and (Trim(QCadastroDT_NASCIMENTO.Text) = '') then
        Raise Exception.Create('Obrigatório informar Data de Nascimento para pessoa Física');
      if (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (Trim(QCadastroDT_FUNDACAO.Text) = '') then
        Raise Exception.Create('Obrigatório informar Data de Fundação para pessoa Jurídica');
    end;
  end;
  MostraVendaLiberada;

  // QCadastro estava com commitOnPost = true
  // Foi alterado para false pois está trabalhando com inserção de dados
  // em outras querys (QCadastro_Endereços, QReceituarioOptico) e deve
  // salvar todos os dados de uma vez só, ou não salvar nada. 
  try
    inherited;
    DMOracle.DBCemapa.Commit;
  Except
    DMOracle.DBCemapa.Rollback;
  end;
  if MELocaliza.CanFocus then
    MELocaliza.SetFocus;
  //PCCadastro.ActivePage := TSCadastro;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SONOBOM')  or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LEURIA') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRAUBER') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CASAPEIXE') or
     (pos('NFCE',DMParamSistema.qParamSistemaCod_Empresa.Value) > 0) then
    PCCadastro.ActivePage := TabSheet8;
  {Adicionado esta linha pois ao salvar não estava marcando o campo de Contribuinte quando o cadastro possui inscrição estadual informada. Alex 13/02/2025}
  DBEIncricaoEstadualChange(Sender);

end;

procedure TFCadastroCad.CadastroCdigoNome1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[9].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCliente.Close;
      //Frames--------------------
      if Trim(FCadastroParam.FmTipoCadastro10.MeTipoCadastro.Text) = '' then
        QRCliente.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCliente.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro10.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao10.MeRegiao.Text) = '' then
        QRCliente.SetVariable('REGIAO', Null)
      else
        QRCliente.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao10.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo10.MeRamo.Text) = '' then
        QRCliente.SetVariable('RAMO', Null)
      else
        QRCliente.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo10.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado10.MeEstado.Text) = '' then
        QRCliente.SetVariable('ESTADO', Null)
      else
        QRCliente.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado10.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao10.MeClassificacao.Text) = '' then
        QRCliente.SetVariable('CLASSIFICACAO', Null)
      else
        QRCliente.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao10.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor10.MeVendedor.Text) = '' then
        QRCliente.SetVariable('VENDEDOR', Null)
      else
        QRCliente.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor10.MeVendedor.Text)));
      if Trim(FCadastroParam.Me10Bairro.Text) = '' then
        QRCliente.SetVariable('DESC_BAIRRO', Null)
      else
        QRCliente.SetVariable('DESC_BAIRRO', Trim(FCadastroParam.Me10Bairro.Text));
      //--------------------------
      if Trim(FCadastroParam.ME9Data.Text) <> '' then
        QRCliente.SetVariable('DATA', StrToDate(FCadastroParam.ME9Data.Text))
      else
        QRCliente.SetVariable('DATA', Null);

      if ((Trim(FcadastroParam.ME10Mes_I.Text) = '1') and (Trim(FCadastroParam.ME10Dia_I.Text) = '1') and
        (Trim(FCadastroParam.ME10MES_F.Text) = '12') and (Trim(FcadastroParam.ME10Dia_F.Text) = '31')) then
      begin
        QRCliente.SetVariable('MES_DIA_I', NULL);
        QRCliente.SetVariable('MES_DIA_F', NULL);
      end
      else
      begin
        QRCliente.SetVariable('MES_DIA_I', FormatFloat('00', StrToFloat(FCadastroParam.ME10Mes_I.Text))
          + FormatFloat('00', StrToFloat(FCadastroParam.ME10Dia_I.Text)));
        QRCliente.SetVariable('MES_DIA_F', FormatFloat('00', StrToFloat(FCadastroParam.ME10Mes_F.Text))
          + FormatFloat('00', StrToFloat(FCadastroParam.ME10Dia_F.Text)));
      end;

      QRCliente.SetVariable('MOTIVO_CANCELAMENTO', FCadastroParam.RadioGroup1.ItemIndex);

      Case FCadastroParam.CB9Ordem.ItemIndex of
        0: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO,TB_CADASTRO.NOME');
        2: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO,TB_CADASTRO.NOME');
        3: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO,TB_CADASTRO.NOME');
        4: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO,TB_CADASTRO.NOME');
        5: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
        6: QRCliente.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.NOME');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      //Case FCadastroParam.Rg9Situacao.ItemIndex of
       // 0: QRCliente.SetVariable('MOTIVO', 'SIM');
       // 1: QRCliente.SetVariable('MOTIVO', 'NAO');
      //end;
      Case FCadastroParam.Rg9Nome.ItemIndex of
        0: QRCliente.SetVariable('IND_NOME','NOME');
        1: QRCliente.SetVariable('IND_NOME','FANTASIA');
      End;
      QRCliente.Open;
      if FRCadastroCodNome = nil then
        FRCadastroCodNome := TFRCadastroCodNome.Create(Application);

      FRCadastroCodNome.QRLVendedor.Caption := '';
      if Trim(FCadastroParam.FmVendedor10.MeVendedor.Text) <> '' then
        FRCadastroCodNome.QRLVendedor.Caption := 'Vendedor: ' + Trim(FCadastroParam.FmVendedor10.MeVendedor.Text) + ' - ' + Trim(FCadastroParam.FmVendedor10.EdVendedor.Text);

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastroCodNome.QRPrimario.Preview
      else
        FRCadastroCodNome.QRPrimario.Print;

      QRCliente.Close;
      QRCliente.SQL[QRCliente.SQL.Count - 1] := '';
    end;

end;

procedure TFCadastroCad.FichaCadastral1Click(Sender: TObject);
var
  wTexto: string;
begin
  inherited;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RADIO') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') then
  begin
    if FCadastroParam = nil then
      FCadastroParam := TFCadastroParam.Create(Application);
    FCadastroParam.PGRelatorio.Pages[10].TabVisible := True;
    if FCadastroParam.ShowModal = mrOk then
      with DMCadastro_Rel do
      begin
        QRCadastro.Close;

        //Frames--------------------
        if Trim(FCadastroParam.FmCadastro11.MeCadastro.Text) = '' then
          QRCadastro.SetVariable('COD_CADASTRO', Null)
        else
          QRCadastro.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro11.MeCadastro.Text)));

        if Trim(FCadastroParam.FmVendedor11.MeVendedor.Text) <> '' then
          QRCadastro.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor11.MeVendedor.Text)))
        else
          QRCadastro.SetVariable('COD_VENDEDOR', Null);
        //--------------------------

        if FCadastroParam.Rg10Cancelados.ItemIndex = 1 then
          QRCadastro.SQL.Add(' And TB_CADASTRO.COD_MOTIVO IS NULL')
        else
          QRCadastro.SQL.Add(' '); // serve apenas para acrescentar uma linha para poder excluir no final

        QRCadastro.Open;
        if FRFichaCad = nil then
          FRFichaCad := TFRFichaCad.Create(Application);
        FRFichaCad.QRLTitulo.Caption := ' Ficha Cadastral';

        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
          FRFichaCad.QRLabel17.Caption := 'MOINHO IGUACU AGROINDUSTRIAL LTDA se houver qualquer alteração nos dados.'
        else
        begin
          FRFichaCad.QRLabel17.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL ', 'COD_FILIAL = 1');
          FRFichaCad.QRLabel17.Caption := FRFichaCad.QRLabel17.Caption + ' se houver qualquer alteracao nos dados.';
          FRFichaCad.QRLabel79.Caption := '';
          if ((DMparamsistema.CodEmpresa = 'COZER') or (DMparamsistema.CodEmpresa = 'PROPE')) then
            FRFichaCad.QRLabel79.Caption := '    Autorizo consultar meu nome junto aos órgãos de proteção ao crédito.'
        end;
        FrFichaCad.QRMemo1.Lines.Clear;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SONOBOM' then
        begin
          FRFichaCad.QRMemo1.Lines.Add(QRCadastroDESC_REF_COMERCIAL1.Value);
          FRFichaCad.QRMemo1.Lines.Add(QRCadastroDESC_REF_COMERCIAL2.Value);
          FRFichaCad.QRMemo1.Lines.Add(QRCadastroDESC_REF_COMERCIAL3.Value);
        end
        else
        FrFichaCad.QRMemo1.Lines.Add(QRCadastroDESC_REF_OUTRAS.Value);

        if FCadastroParam.RGPreview.ItemIndex = 0 then
          FRFichaCad.QRPrimario.Preview
        else
          FRFichaCad.QRPrimario.Print;
        DMFilial.QFilial.Close;
        DMFilial.QFilial.SetVariable('PK', 1);
        DMFilial.QFilial.Open;
        if FRPromissoria2 = nil then
          FRPromissoria2 := TFRPromissoria2.Create(Application);
        wTexto := 'Na data de ___/___/____, pagarei por esta unica via de NOTA PROMISSORIA a ';
        wTexto := wTexto + Trim(DMFilial.QFilialDesc_Filial.Value);
        wTexto := wTexto + ' CPF/CNPJ: ' + DMFilial.QFilialNUM_CGC.Value;
        wTexto := wTexto + ' ou a sua ordem a quantia de: (____________________________________________________)';
        wTexto := wTexto + ' em moeda corrente deste pais.';
        FRPromissoria2.QrLocal_Pagamento.Caption := DMFilial.QFilialDESC_CIDADE.Value;
        FRPromissoria2.QrLCidade.Caption := DMFilial.QFilialDESC_CIDADE.Value;
        FRPromissoria2.QrDescricao.Caption := wTexto;
        FRPromissoria2.QrEmitente.Caption := FloatToStr(QRCadastroCod_Cadastro.Value) + ' - ' + QRCadastroNOME.Value;
        FRPromissoria2.QrCpf_Cnpj.Caption := QRCadastroNUM_CGC_CPF.Value;
        FRPromissoria2.QrEndereco.Caption := QRCadastroDESC_ENDERECO.Value;
        FRPromissoria2.QrCidade.Caption := QRCadastroDESC_CIDADE.Value;
        FRPromissoria2.QrCpfEmitente.Caption := QRCadastroNUM_CGC_CPF.Value;
        FRPromissoria2.QrNomeEmitente.Caption := FRPromissoria2.QrEmitente.Caption;
        FRPromissoria2.QRlAvalista1.Caption := '.';
        FRPromissoria2.QRlAvalista2.Caption := '.';
        //Frame------------------------
        if Trim(FCadastroParam.FmVendedor11.MeVendedor.Text) = '' then //somente imprime promissoria quando for apenas para um cadastro
          FRPromissoria2.QRPrimario.Preview;
        //-----------------------------

        QRCadastro.Close;
        QRCadastro.SQL[QRCadastro.SQL.Count - 1] := '';
      end;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO' then
   begin
    if FCadastroParam = nil then
      FCadastroParam := TFCadastroParam.Create(Application);
    FCadastroParam.PGRelatorio.Pages[10].TabVisible := True;
    if FCadastroParam.ShowModal = mrOk then
      with DMCadastro_Rel do
      begin
        QRCadastro.Close;
        //Frames---------------------------
        if Trim(FCadastroParam.FmCadastro11.MeCadastro.Text) = '' then
          raise Exception.Create('Informe Código do Cadastro')
        else
          QRCadastro.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro11.MeCadastro.Text)));

        if Trim(FCadastroParam.FmVendedor11.MeVendedor.Text) <> '' then
          QRCadastro.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor11.MeVendedor.Text)))
        else
          QRCadastro.SetVariable('COD_VENDEDOR', Null);
        //----------------------------------

        if FCadastroParam.Rg10Cancelados.ItemIndex = 1 then
          QRCadastro.SQL.Add(' And TB_CADASTRO.COD_MOTIVO IS NULL')
        else
          QRCadastro.SQL.Add(' '); // serve apenas para acrescentar uma linha para poder excluir no final
        QRCadastro.Open;
        if FRFichaCadRadio = nil then
          FRFichaCadRadio := TFRFichaCadRadio.Create(Application);
        //FRFichaCadRadio.QRLTitulo.Caption:=' Ficha Cadastral';
        if FCadastroParam.RGPreview.ItemIndex = 0 then
          FRFichaCadRadio.QRPrimario.Preview;
        QRCadastro.Close;
        QRCadastro.SQL[QRCadastro.SQL.Count - 1] := '';
      end;
   end
  Else
   If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
   Begin
      with DMCadastro_Rel do
      begin
        QRCadastro.Close;
        QRCadastro.SetVariable('COD_CADASTRO', DMCadastro.QCadastroCod_Cadastro.Value);
        QRCadastro.SetVariable('COD_VENDEDOR', Null);
        QRCadastro.Open;
        FichaCadastralAristides;
        QRCadastro.Close;
      End;
   End;
end;

procedure TFCadastroCad.CadastrocomVendedor1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[11].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCadastro_com_Venda.Close;

      //Frames-----------------------
      if Trim(FCadastroParam.FmTipoCadastro12.MeTipoCadastro.Text) = '' then
        QRCadastro_com_Venda.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCadastro_com_Venda.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro12.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao12.MeRegiao.Text) = '' then
        QRCadastro_com_Venda.SetVariable('REGIAO', Null)
      else
        QRCadastro_com_Venda.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao12.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo12.MeRamo.Text) = '' then
        QRCadastro_com_Venda.SetVariable('RAMO', Null)
      else
        QRCadastro_com_Venda.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo12.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado12.MeEstado.Text) = '' then
        QRCadastro_com_Venda.SetVariable('ESTADO', Null)
      else
        QRCadastro_com_Venda.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado12.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao12.MeClassificacao.Text) = '' then
        QRCadastro_com_Venda.SetVariable('CLASSIFICACAO', Null)
      else
        QRCadastro_com_Venda.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao12.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor12.MeVendedor.Text) = '' then
        QRCadastro_com_Venda.SetVariable('VENDEDOR', Null)
      else
        QRCadastro_com_Venda.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor12.MeVendedor.Text)));
      if Trim(FCadastroParam.FmCidade12.MeCidade.Text) = '' then
        QRCadastro_com_Venda.SetVariable('CIDADE', Null)
      else
        QRCadastro_com_Venda.SetVariable('CIDADE', StrToInt(Trim(FCadastroParam.FmCidade12.MeCidade.Text)));
      if Trim(FCadastroParam.Me12Bairro.Text) = '' then
        QRCadastro_com_Venda.SetVariable('DESC_BAIRRO', Null)
      else
        QRCadastro_com_Venda.SetVariable('DESC_BAIRRO', Trim(FCadastroParam.Me12Bairro.Text));
      //--------------------------------

      case FCadastroParam.CB11Ordem.ItemIndex of
        0: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.NOME');
        1: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_REGIAO');
        3: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_RAMO');
        4: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_ESTADO');
        5: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.COD_CADASTRO');
        6: QRCadastro_com_Venda.SQL.Add('ORDER BY TB_CADASTRO.COD_VENDEDOR, TB_CADASTRO.DESC_CIDADE');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QRCadastro_com_Venda.Open;
      if FRCadastro_com_Venda = nil then
        FRCadastro_com_Venda := TFRCadastro_com_Venda.Create(Application);
      if Trim(FCadastroParam.FmVendedor12.MeVendedor.Text) <> '' then
        FRCadastro_com_Venda.QRLEmpresa.Caption := 'Vendedor: ' + Trim(FCadastroParam.FmVendedor12.EdVendedor.Text)
      else
        FRCadastro_com_Venda.QRLEmpresa.Caption := 'Vendedor: ' + 'Todos';
      FRCadastro_com_Venda.QRLTitulo.Caption := 'Relatório de Cadastro Por Vendedor';
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_com_Venda.QRPrimario.Preview
      else
        FRCadastro_com_Venda.QRPrimario.Print;
      QRCadastro_com_Venda.Close;
      QRCadastro_com_Venda.SQL[QRCadastro_com_Venda.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.CadastroClientesComVendas1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[12].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro do
    begin
      QRCadastroVenda.Close;

      //Frames-------------------------
      if Trim(FCadastroParam.FmTipoCadastro13.MeTipoCadastro.Text) = '' then
        QRCadastroVenda.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCadastroVenda.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro13.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao13.MeRegiao.Text) = '' then
        QRCadastroVenda.SetVariable('COD_REGIAO', Null)
      else
        QRCadastroVenda.SetVariable('COD_REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao13.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo13.MeRamo.Text) = '' then
        QRCadastroVenda.SetVariable('COD_RAMO', Null)
      else
        QRCadastroVenda.SetVariable('COD_RAMO', StrToInt(Trim(FCadastroParam.FmRamo13.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado13.MeEstado.Text) = '' then
        QRCadastroVenda.SetVariable('COD_ESTADO', Null)
      else
        QRCadastroVenda.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado13.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao13.MeClassificacao.Text) = '' then
        QRCadastroVenda.SetVariable('COD_CLASS_CADASTRO', Null)
      else
        QRCadastroVenda.SetVariable('COD_CLASS_CADASTRO', StrToInt(Trim(FCadastroParam.FmClassificacao13.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor13.MeVendedor.Text) = '' then
        QRCadastroVenda.SetVariable('COD_VENDEDOR', Null)
      else
        QRCadastroVenda.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor13.MeVendedor.Text)));
      //---------------------------------

      case FCadastroParam.CB12Ordem.ItemIndex of
        0: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO');
        3: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO');
        4: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO');
        5: QRCadastroVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      QRCadastroVenda.SetVariable('DT_VENDA', StrToDate(FCadastroParam.Me12DtReferencia.Text));

      QRCadastroVenda.Open;
      if FRCadastroVendas = nil then
        FRCadastroVendas := TFRCadastroVendas.Create(Application);

      if Trim(FCadastroParam.FmVendedor13.MeVendedor.Text) <> '' then
        FRCadastroVendas.QRLTitulo.Caption := 'Vendedor: ' + Trim(FCadastroParam.FmVendedor13.EdVendedor.Text) + ' Relatório de Cadastro com Venda'
      else
        FRCadastroVendas.QRLTitulo.Caption := 'Vendedor: ' + 'Todos' + ' Relatório de Cadastro com Venda';

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastroVendas.QRPrimario.Preview
      else
        FRCadastroVendas.QRPrimario.Print;

      QRCadastroVenda.Close;
      QRCadastroVenda.SQL[QRCadastroVenda.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.CalculoLimiteCrdito1Click(Sender: TObject);
var
  wQtArea, wValor_Limite: Real;
  wComando: string;
begin
  inherited;
  if FCalculoLimite = nil then
    FCalculoLimite := TFCalculoLimite.Create(Application);
  if FCalculoLimite.ShowModal = mrOk then
    with DMValorReferencia do
    begin
      QAtualiza_Limite.Close;
      if Trim(FCalculoLimite.METipoCadastro.Text) = '' then
        QAtualiza_Limite.SetVariable('COD_TIPO_CADASTRO', Null)
      else
        QAtualiza_Limite.SetVariable('COD_TIPO_CADASTRO', StrToInt(Trim(FCalculoLimite.MeTipoCadastro.Text)));

      if Trim(FCalculoLimite.MEClassificacao.Text) = '' then
        QAtualiza_Limite.SetVariable('COD_CLASS_CADASTRO', Null)
      else
        QAtualiza_Limite.SetVariable('COD_CLASS_CADASTRO', StrToInt(Trim(FCalculoLimite.MeClassificacao.Text)));

      if Trim(FCalculoLimite.MECadastro.Text) = '' then
        QAtualiza_Limite.SetVariable('COD_CADASTRO', Null)
      else
        QAtualiza_Limite.SetVariable('COD_CADASTRO', StrToInt(Trim(FCalculoLimite.MeCadastro.Text)));

      QAtualiza_Limite.Open;

      try
        DMoracle.DBCemapa.StartTransaction;
        QAtualiza_Limite.First;
        QValorReferenciaCad.Close;
        QValorReferenciaCad.Open;
        while not QAtualiza_Limite.Eof do
        begin
          if QAtualiza_LimiteQT_AreaTotal.Value = 0 then
            wValor_Limite := 0
          else
          begin
            wQtArea := QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Producao_Media.Value;
            wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Custo_Producao.Value;
            wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Manutencao.Value;
            wQtArea := wQtArea - QAtualiza_LimiteQt_Arrendamento.Value;
            wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Colheita.Value;

            wValor_Limite := wQtArea * QValorReferenciaCadVal_Produto.Value * (QAtualiza_LimitePerc_Equipamento.Value / 100);
            if wValor_Limite = 0 then
              wValor_Limite := 1;
            with DMOracle do
            begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_CADASTRO SET VAL_LIMITE=' + StringReplace(FloatToStr(wValor_Limite), ',', '.', [rfReplaceAll]);
              wComando := wComando + ' WHERE COD_CADASTRO = ' + FloatToStr(QAtualiza_LimiteCod_Cadastro.Value);
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
            end;
          end;
          QAtualiza_Limite.Next;
        end;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Erro ao Calcular Limite de Crédito !');
      end;
      QAtualiza_Limite.Close;
    end;

end;

procedure TFCadastroCad.Cadastrodadosbsicos1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[13].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCadastroDadosPessoais.Close;

      //Frames--------------------------
      if Trim(FCadastroParam.FmCadastro14.MeCadastro.Text) = '' then
        QRCadastroDadosPessoais.SetVariable('COD_CADASTRO', Null)
      else
        QRCadastroDadosPessoais.SetVariable('COD_CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro14.MeCadastro.Text)));

      if Trim(FCadastroParam.FmTipoCadastro14.MeTipoCadastro.Text) = '' then
        QRCadastroDadosPessoais.SetVariable('COD_TIPO_CADASTRO', Null)
      else
        QRCadastroDadosPessoais.SetVariable('COD_TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro14.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRamo14.MeRamo.Text) = '' then
        QRCadastroDadosPessoais.SetVariable('COD_RAMO', Null)
      else
        QRCadastroDadosPessoais.SetVariable('COD_RAMO', StrToInt(Trim(FCadastroParam.FmRamo14.MeRamo.Text)));
      //-----------------------------------
      QRCadastroDadosPessoais.Open;

      if FRCadastroDadosPessoais = nil then
        FRCadastroDadosPessoais := TFRCadastroDadosPessoais.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastroDadosPessoais.QRPrimario.Preview
      else
        FRCadastroDadosPessoais.QRPrimario.Print;
      QRCadastroDadosPessoais.Close;
    end;
end;

procedure TFCadastroCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMCadastro do
  begin
    QCadastro.Close;
    QProprCadastro.Close;
    QPropriedade.Close;
    DMBensEquipamento.QBensEquipamentos.Close;
    DMBensEquipamento.QBensEquipamentos.Close;
    DMBensEquipamento.QListaBensEquip.Close;
    DMCadastro.QCadastro_Enderecos.Close;
    QImagemCadastro.Close;
  end;
//  Action := CaFree;
//  FCadastroCad := nil;
end;

procedure TFCadastroCad.CancelaAtrasados1Click(Sender: TObject);
var
  wComando: string;
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[14].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro do
    begin
      if MessageDlg('Deseja cancelar os cadastros que não realizam compras a ' + Trim(FCadastroParam.Me14Dias.Text) + ' dias?', mtConfirmation, [mbYes,mbNo], 0) = MrNo then
        Exit; //Adicionado por Andre 13/11/2024 para evitar o cancelamento direto
      QCadastroCancela.Close;
      QCadastroCancela.SetVariable('DATA_REF', DATE - StrToInt(Trim(FCadastroParam.Me14Dias.Text)));
      QCadastroCancela.Open;
      while not QCadastroCancela.Eof do
      begin
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CADASTRO';
          wComando := wComando + ' SET DT_CANCELAMENTO=' + Chr(39) + DateToStr(Date) + Chr(39);
          wComando := wComando + ' ,COD_MOTIVO=' + Trim(FCadastroParam.Me14Motivo.Text);
          wComando := wComando + ' WHERE COD_CADASTRO = ' + FloatToStr(QCadastroCancelaCod_Cadastro.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        end;
        QCadastroCancela.Next;
      end;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DbCemapa.Commit;
      QCadastroCancela.Close;
    end;
end;

procedure TFCadastroCad.BtnCidadeCobrancaConsClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
  begin
    DMCadastro.QCadastroDESC_CIDADE_COBRANCA.Value := DMCidade.QCidadeConsDESC_CIDADE.Value;
    DMCadastro.QCadastroDESC_ESTADO_COBRANCA.Value := DMCidade.QCidadeConsCod_Estado.Value; //DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO ' , 'COD_ESTADO = '+CHR(39)+Trim(DMCidade.QCidadeConsCod_Estado.Text)+CHR(39) );
  end;
end;

procedure TFCadastroCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
  begin
    DMCadastro.QCadastroDESC_CIDADE_ENTREGA.Value := DMCidade.QCidadeConsDESC_CIDADE.Value;
    DMCadastro.QCadastroCOD_ESTADO_ENTREGA.Value := DMCidade.QCidadeConsCOD_ESTADO.Value;
  end;
end;

procedure TFCadastroCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    DMCadastro.QCadastroDESC_REF_PARENTE_CIDADE.Value := DMCidade.QCidadeConsDESC_CIDADE.Value;

end;

procedure TFCadastroCad.RelatrioPorEndereo1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[15].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QrCadastroEndereco.Close;

      //Frames----------------------------
      if Trim(FCadastroParam.FmTipoCadastro16.MeTipoCadastro.Text) = '' then
        QrCadastroEndereco.SetVariable('TIPO_CADASTRO', Null)
      else
        QrCadastroEndereco.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro16.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao16.MeRegiao.Text) = '' then
        QrCadastroEndereco.SetVariable('REGIAO', Null)
      else
        QrCadastroEndereco.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao16.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo16.MeRamo.Text) = '' then
        QrCadastroEndereco.SetVariable('RAMO', Null)
      else
        QrCadastroEndereco.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo16.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado16.MeEstado.Text) = '' then
        QrCadastroEndereco.SetVariable('ESTADO', Null)
      else
        QrCadastroEndereco.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado16.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao16.MeClassificacao.Text) = '' then
        QrCadastroEndereco.SetVariable('CLASSIFICACAO', Null)
      else
        QrCadastroEndereco.SetVariable('CLASSIFICACAO', StrToInt(Trim(FCadastroParam.FmClassificacao16.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor16.MeVendedor.Text) = '' then
        QrCadastroEndereco.SetVariable('VENDEDOR', Null)
      else
        QrCadastroEndereco.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor16.MeVendedor.Text)));

      if Trim(FCadastroParam.FmCidade16.MeCidade.Text) <> '' then
        QrCadastroEndereco.SetVariable('CIDADE', Trim(FCadastroParam.FmCidade16.EdCidade.Text))
      else
        QrCadastroEndereco.SetVariable('CIDADE', Null);
      if Trim(FCadastroParam.Me16Bairro.Text) <> '' then
        QrCadastroEndereco.SetVariable('DESC_BAIRRO', Trim(FCadastroParam.Me16Bairro.Text))
      else
        QrCadastroEndereco.SetVariable('DESC_BAIRRO', Null);
      //------------------------------------

      if Trim(FCadastroParam.Me15Data.Text) <> '' then
        QrCadastroEndereco.SetVariable('DATA', StrToDate(FCadastroParam.Me15Data.Text))
      else
        QrCadastroEndereco.SetVariable('DATA', Null);

      case FCadastroParam.Cb15Ordem.ItemIndex of
        0: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.NOME');
        1: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_REGIAO');
        3: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_RAMO');
        4: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_ESTADO');
        5: QrCadastroEndereco.SQL.Add('ORDER BY TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      case FCadastroParam.Rg15Cancelado.ItemIndex of
        0: QrCadastroEndereco.SetVariable('MOTIVO', 'SIM');
        1: QrCadastroEndereco.SetVariable('MOTIVO', 'NAO');
      end;
      QrCadastroEndereco.Open;
      if FrCadastroEndereco = nil then
        FrCadastroEndereco := TFrCadastroEndereco.Create(Application);
      FrCadastroEndereco.QRLTitulo.Caption := 'Relatório Cadastro p/Endereço Vendedor: ' + Trim(FCadastroParam.FmVendedor16.MeVendedor.Text) + ' - ' + Trim(FCadastroParam.FmVendedor16.EdVendedor.Text);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FrCadastroEndereco.QRPrimario.Preview
      else
        FrCadastroEndereco.QRPrimario.Print;
      QrCadastroEndereco.Close;
      QrCadastroEndereco.SQL[QrCadastroEndereco.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMCadastro.QCadastroCod_Operacao_cc1.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFCadastroCad.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMCadastro.QCadastroCod_Operacao_cc2.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFCadastroCad.CadastrosAtivosCcompraAcimadeR1Click(
  Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[17].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QrCadastro_Venda_Acima.Close;

      //Frames--------------------------
      if Trim(FCadastroParam.FmTipoCadastro18.MeTipoCadastro.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_TIPO_CADASTRO', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro18.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao18.MeRegiao.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_REGIAO', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao18.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo18.MeRamo.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_RAMO', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_RAMO', StrToInt(Trim(FCadastroParam.FmRamo18.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado18.MeEstado.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_ESTADO', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado18.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao18.MeClassificacao.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_CLASS_CADASTRO', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_CLASS_CADASTRO', StrToInt(Trim(FCadastroParam.FmClassificacao18.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor18.MeVendedor.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_VENDEDOR', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor18.MeVendedor.Text)));

      if Trim(FCadastroParam.FmFilial18.MeFilial.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('COD_FILIAL', Null)
      else
        QrCadastro_Venda_Acima.SetVariable('COD_FILIAL', StrToInt(Trim(FCadastroParam.FmFilial18.MeFilial.Text)));
      //---------------------------------
      if Trim(FCadastroParam.Me17Valor.Text) = '' then
        QrCadastro_Venda_Acima.SetVariable('VAL_REFERENCIA', 0)
      else
        QrCadastro_Venda_Acima.SetVariable('VAL_REFERENCIA', StrToFloat(Trim(FCadastroParam.Me17Valor.Text)));

      QrCadastro_Venda_Acima.SetVariable('Dt_Inicio', StrToDate(FCadastroParam.Me17Dt_Inicial.Text));

      QrCadastro_Venda_Acima.Open;

      if FrCadastroVendasAcima = nil then
        FrCadastroVendasAcima := TFrCadastroVendasAcima.Create(Application);
      FrCadastroVendasAcima.QRLTitulo.Caption := 'Relatório Cadastro Vendas Acima de R$: ' + Trim(FCadastroParam.FmVendedor18.MeVendedor.Text) + ' - ' + Trim(FCadastroParam.FmVendedor18.EdVendedor.Text);

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FrCadastroVendasAcima.QRPrimario.Preview
      else
        FrCadastroVendasAcima.QRPrimario.Print;
      QrCadastro_Venda_Acima.Close;
    end;
end;

procedure TFCadastroCad.TransfereCodigo1Click(Sender: TObject);
begin
  inherited;
  if FCadastroTransf = nil then
    FCadastroTransf := TFCadastroTransf.Create(Application);
  FCadastroTransf.ShowModal;
end;

procedure TFCadastroCad.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    DMCadastro.QPropriedadeCOD_CIDADE.Value := DMCidade.QCidadeConsCod_Cidade.Value;
end;

procedure TFCadastroCad.TransfereVendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorTransf = nil then
    FVendedorTransf := TFVendedorTransf.Create(Application);
  FVendedorTransf.ShowModal;
end;

procedure TFCadastroCad.FormCreate(Sender: TObject);
begin
  inherited;
  DBEdit21.Visible := false;
  Label64.Visible := false;
  DBPEntregador.Visible := false;
  if DSPrimario.DataSet = nil then
     DSPrimario.DataSet := DMCadastro.QCadastro;
  if PCCadastro.ActivePage <> TSCadastro then
     PCCadastro.ActivePage := TSCadastro;

  if (DmParamSistema.CodEmpresa = 'ARISTIDES') or (DMParamSistema.CodEmpresa = 'SONOBOM') or (pos('NFCE',DMParamSistema.CodEmpresa) > 0) then
  begin
    //DEIXA VISIVEL APENAS ABA DE CADASTRO DA ARISTIDES
    TabSheet8.TabVisible := true;
    PCCadastro.ActivePage := TabSheet8;
    TabSheet7.TabVisible := false;
    TabSheet6.TabVisible := false;
    TabSheet5.TabVisible := false;
    TabSheet2.TabVisible := false;
    TabSheet1.TabVisible := false;
    TsFisica.TabVisible := false;
    TsJuridica.TabVisible := false;
    TsEndereco.TabVisible := false;
    TsCadastro.TabVisible := false;
    TsRelacoesComerciais.TabVisible := false;
    TsImagem.TabVisible := false;
    if (DMParamSistema.CodEmpresa = 'NFCE-ACIOL') then
    begin
      DBECadPro.Visible := True;
      Label23.Visible := True;
      DBRGConsFinal.Visible := True;
    end;
    if (DmParamSistema.CodEmpresa = 'ARISTIDES') then
    begin
      TabSheet6.PageIndex := TabSheet8.PageIndex + 1;
      TabSheet6.TabVisible := true;
      Panel2.Visible := false;
      Label108.Visible := false;
      DBEdit123.Visible := false;
      Label107.Visible := false;
      DBEdit122.Visible := false;
      Label109.Visible := false;
      DBEdit124.Visible := false;
      Label110.Visible := false;
      DBEdit125.Visible := false;
      Label111.Visible := false;
      DBEdit126.Visible := false;
      DBRadioGroup8.Visible := false;
      Label224.Visible := false;
      DBEdit126.Visible := false;
      DBEdit136.Visible := false;
      DBEdit226.Visible := false;
      DBPanel66.Visible := false;
      DBPanel67.Visible := false;
      Label230.Visible := false;
      DBComboBox3.Visible := false;
      TsImagem.TabVisible := true;
    end;
  end;
  if (DmParamSistema.CodEmpresa = 'GRAUBER') then
  begin
    //DEIXA VISIVEL APENAS ABA DE CADASTRO DA ARISTIDES
    TabSheet8.TabVisible := true;
    PCCadastro.ActivePage := TabSheet8;
    TabSheet7.TabVisible := false;
    TabSheet6.TabVisible := false;
    TabSheet5.TabVisible := false;
    TabSheet2.TabVisible := false;
    TabSheet1.TabVisible := false;
    TsFisica.TabVisible := false;
    TsJuridica.TabVisible := false;
    TsEndereco.TabVisible := false;
    TsCadastro.TabVisible := false;
    TsRelacoesComerciais.TabVisible := false;
    TsImagem.TabVisible := false;
    GroupBox16.Visible := False; // filiação
    GroupBox18.Visible := False; //Trabalho
    GroupBox15.Visible := False; // Conjuge
    DBPanel98.Visible := False; //Dt Cancelamento
    DBPanel99.Visible := False; //Motivo
    Label189.Visible := False; //Classificação
    DBEdit201.Visible := False; //Classificação
    DBDirceu9.Visible := False; //Classificação
    Label190.Visible := False; //Limite
    DBEdit204.Visible := False; //Limite
    BitBtn15.Visible := False; // Limite
    Label196.Visible := False; // Ligar
    DBEdit210.Visible := False; //Ligar
    DBDirceu10.Visible := False;//Ligar
    BitBtn16.Visible := False;// Ligar
    Label191.Visible := False; //Dt Seproc
    DBEdit205.Visible := False; //Dt Seproc
    Label199.Visible := False; //Obs
    DBEdit214.Visible := False; //Obs
    DBEdit215.Visible := False; //Obs
    GroupBox17.Top := 37; //Endereço;
    DBPanel56.Top := 230; //Email XML
    DBPanel96.Top := 270; //Email Boleto
    DBRadioGroup13.Top := 310; //ISS Retido
    Label23.Top := 305; //Cad Pro
    DBECadPro.Top := 320; //Cad Pro


  end;
  TsCadastroUnico.TabVisible := False;
  if (DMParamSistema.CodEmpresa = 'SONOBOM') then
  begin
    TabSheet5.TabVisible := true;
  end;
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    DBPPercDesconto.LCaption := '% Desc. Peças';
    DBPPercMeta.LCaption := '% Desc. Serviços';
    PEndereco.Visible := True;
    GBDescontoEspecial.Visible := True;
    {** INICIO ** - Foi adicionado campo PERC_DESCONTO2 para ser utilizado nas emissões de notas, mas para
    INJEPAR, nesse lugar tem o campo PERC_META utilizado para desconto de serviços. Solicitacao Marcos. Junior - 10/02/2014}
    DBPPercMeta.Top := 168;
    DBPPercMeta.Left := 636;
    DBPPercDescontoNota.Top := 288;
    DBPPercDescontoNota.Left := 612;
    {** FIM **}
  end;
  if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')then  //Pemitir puxar operação do cadastro no Vendas. Suporte: 7801
  begin
    DBRadioGroup3.Visible := False;
    DBComboBox1.Visible := False;
    Label24.Visible := False;
    DBPPercMeta.Visible := False;
    DBPOperacaoVendaCC.LCaption := 'Operação p/Vendas';
    DBComboBox2.Visible := False;
    Label81.Visible := False;
    DBRadioGroup6.Visible := False;
    DBPCadastroNovo.Visible := False;
    DBPVendedorPreposto.Visible := False;
    DBPPrazo.Visible := False;
    DBPDiasVencto.Visible := False;
    DBPPercSenar.Visible := False;
    DBPLimite.Left := 313;
    DBPPercDesconto.Left := 432;
    DBPPercDescontoNota.Left := 558;
    DBP_Email.Left := 9;
    DBP_Email.Top := 329;
    DBPPercDescontoNota.Visible := False;
    DBPLimite.Visible := False;
    DbLiberaLimite.Visible := False;
    DBPPercDesconto.Visible := False;
    SBLiberaLimite.Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'NIR')      or (DMParamSistema.CodEmpresa = 'MARTICAR')   or (DMParamSistema.CodEmpresa = 'POSTUBOS')   or
     (DMParamSistema.CodEmpresa = 'SRTERRA')  or (DMParamSistema.CodEmpresa= 'PIXIXE')      or (DMParamSistema.CodEmpresa= 'CASATINTAS')  or
     (DMParamSistema.CodEmpresa = 'JORNAL')   or (DMParamSistema.CodEmpresa = 'RADIO')      or (DMParamSistema.CodEmpresa = 'LALA')       or
     (DMParamSistema.CodEmpresa = 'ARZ')      or (DMParamSistema.CodEmpresa = 'MAGNO')      or (DMParamSistema.CodEmpresa = 'CONSTRUIR')  or
     (DMParamSistema.CodEmpresa = 'LIVRARIA') or (DMParamSistema.CodEmpresa = 'ITATIBA')    or (DMParamSistema.CodEmpresa = 'MAYER')      or
     (DMParamSistema.CodEmpresa = 'DALGAS')   or (DMParamSistema.CodEmpresa = 'GERALPECAS') or (DMParamSistema.CodEmpresa = 'DALLMOVEIS') or
     (DMParamSistema.CodEmpresa = 'MISTER')   or (DMParamSistema.CodEmpresa = 'VOSSER')     or (DMParamSistema.CodEmpresa = 'FOGOES')     or
     (DMParamSistema.CodEmpresa = 'NEOALI') Then
  begin
    DBRadioGroup3.Visible := False;
    DBComboBox1.Visible := False;
    Label24.Visible := False;
    DBPPercMeta.Visible := False;
    DBPOperacaoVendaCC.Visible := False;
    DBComboBox2.Visible := False;
    Label81.Visible := False;
    DBRadioGroup6.Visible := False;
    DBPCadastroNovo.Visible := False;
    DBPVendedorPreposto.Visible := False;
    DBPPrazo.Visible := False;
    DBPDiasVencto.Visible := False;
    DBPPercSenar.Visible := False;
    DBPLimite.Left := 313;
    DBPPercDesconto.Left := 432;
    DBPPercDescontoNota.Left := 558;
    DBP_Email.Left := 9;
    DBP_Email.Top := 329;
    DBPPercDescontoNota.Visible := False;
    DBPLimite.Visible := False;
    DbLiberaLimite.Visible := False;
    DBPPercDesconto.Visible := False;
    SBLiberaLimite.Visible := False;
  end;
{Adicionado campo para informar a distancia entre o endereço do cliente e a filial. Este valor é utilizado para o calculo automatico do frete na emissão da
pessagem quando o frete é recebido pela empresa. Solicitado por Marcio da Itatiba. Alex 09/08/2024.}
  if (DMParamSistema.CodEmpresa = 'ITATIBA') then
  begin
    DBEdit21.Visible := True;
    DBEdit21.Top := 342;
    DBEdit21.Left := 312;
    Label64.Visible := True;
    Label64.top := 329;
    Label64.Left := 312;
  end;
//Solicitado por Sabrina da Construir para habilitar o campo que mostra o valor do limite do cliente.
//Cod_suporte: 4321 - Alex 08/01/2022
  If (DMParamSistema.CodEmpresa = 'CONSTRUIR') then
  begin
    DBPLimite.Visible := True;
    SBLiberaLimite.Visible := True;
  end;
  If (DMParamSistema.CodEmpresa = 'ARZ') Then
   Begin
     DBComboBox2.Visible := True;
     Label81.Visible := True;
     DBPLimite.Visible := True;
     SBLiberaLimite.Visible := True;
     DBPLimite.Left := 408;
   End;
  If (DMParamSistema.CodEmpresa = 'RADIO') Then
   Begin
     DBPLimite.Visible := True;
     SBLiberaLimite.Visible := True;
     DBPLimite.Left := 408;
     DBRadioGroup7.Caption := 'Cartão de Crédito';
     DbPanel65.LCaption := 'Whats App';
     DbPanel7.LCaption := 'Whats Esposa';
     DbPanel9.LCaption := 'Telefone Parente';
     DbOperadora.Visible := False;
     LblOperadora.Visible := False;
   End;
  If (DMParamSistema.CodEmpresa = 'JORNAL')   Then
   Begin
     DBPVendedorPreposto.Visible:= False;
     DBPLimite.Visible := False;
     SBLiberaLimite.Visible := False;
     DbLiberaLimite.Visible := False;
     DBPSegundoContato.Visible := False;
     DBPanel19.Visible := False;
     RgAtacadoVarejo.Visible := False;
     DBPPercDesconto.Visible := False;
     DBPanel17.Visible := false;
     DBPEntregador.Visible := true;
     DBPEntregador.Left := 241;
   End;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') then //Dani solicitou o campo obs na tela principal do cadastro. Junior 08/08/2019 suporte(12422)
  begin
    LabelObsCad.Visible := true;
    DBEObsCad.Visible   := true;
    LabelObsCad.Top := 466;
    DBEObsCad.Top   := 480;
  end;
  if (DMParamSistema.CodEmpresa = 'CASAFILTRO') then //suporte(864). Junior 09/09/2020
  begin
    DBPDescCodFicha.Visible := True;
    DBPanel97.Visible := False;
    DBPDescCodFicha.Top  := 368;
    DBPDescCodFicha.Left := 9;
    LabelObsCad.Visible := true;
    DBEObsCad.Visible   := true;
    LabelObsCad.Top := 466;
    DBEObsCad.Top   := 480;
  end;
  TabSheet3.TabVisible := (DMParamSistema.CodEmpresa = 'OTICA');

  // Esconde as abas 'Bens Móveis e Equip.' e 'Relações Comerciais'
  TabSheet7.TabVisible := false;
  TsRelacoesComerciais.TabVisible := false;

  //Mostrar esta aba para os seguintes clientes
  //Gian 09/11/2018
  if ((DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')) then
  begin
    TsRelacoesComerciais.TabVisible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'STEIN') then
  begin
    DBPPercDesconto.LCaption := '%Desc. Senar';
  end;

  // Esconde a aba 'Propriedade' para empresas que não possuem Coletor Monsanto (Qion)
  TabSheet2.TabVisible := (Pos(DMParamSistema.QParamSistemaCOD_EMPRESA.Value
    , 'GRASEL,MULTAGRO,GOLDEN') > 0);

  Bib.addControleCharCase(DBPEmail, Self.Name);
  Bib.addControleCharCase(DBP_Email, Self.Name);

  DMCadastro.QReceituarioOptico.Open;
  TEdit(DBMemo2).CharCase := ecUpperCase;

  if FCarregando = nil then
    FCarregando := TFCarregando2.Create(Application);

  if (DMParamSistema.CodEmpresa <> 'ESPINDOLA') and (DMParamSistema.CodEmpresa <> 'MATRANSP') then
  begin
    DBEDataAdmissao.Enabled := false;
    DBEDataAdmissao.Visible := false;
    Label67.Visible := false;
    Label67.Enabled := false;
  end;

  PreencheCbPerfilTributario;

end;

procedure TFCadastroCad.CadastroDadosBancrios1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[18].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QrCadastroBanco.Close;

      //Frames-----------------------------
      if Trim(FCadastroParam.FmCadastro19.MeCadastro.Text) = '' then
        QrCadastroBanco.SetVariable('CADASTRO', Null)
      else
        QrCadastroBanco.SetVariable('CADASTRO', StrToInt(Trim(FCadastroParam.FmCadastro19.MeCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao19.MeRegiao.Text) = '' then
        QrCadastroBanco.SetVariable('REGIAO', Null)
      else
        QrCadastroBanco.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao19.MeRegiao.Text)));

      if Trim(FCadastroParam.FmCidade19.MeCidade.Text) = '' then
        QrCadastroBanco.SetVariable('CIDADE', Null)
      else
        QrCadastroBanco.SetVariable('CIDADE', StrToInt(Trim(FCadastroParam.FmCidade19.MeCidade.Text)));

      if Trim(FCadastroParam.FmVendedor19.MeVendedor.Text) = '' then
        QrCadastroBanco.SetVariable('VENDEDOR', Null)
      else
        QrCadastroBanco.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor19.MeVendedor.Text)));
      //-------------------------------------

      QrCadastroBanco.Open;

      if FrCadastroBanco = nil then
        FrCadastroBanco := TFrCadastroBanco.Create(Application);

      FrCadastroBanco.QRLTitulo.Caption := 'Relatório Cadastro com Dados Bancários ';
      FrCadastroBanco.QRLCidade.Caption := 'Cidade: ' + FcadastroParam.FmCidade19.EdCidade.Text + '  Região: ' + FCadastroParam.FmRegiao19.EdRegiao.Text;
      FrCadastroBanco.QRLVendedor.Caption := 'Vendedor: ' + FcadastroParam.FmVendedor19.EdVendedor.Text;

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FrCadastroBanco.QRPrimario.Preview
      else
        FrCadastroBanco.QRPrimario.Print;

      QrCadastroBanco.Close;
    end;
end;

procedure TFCadastroCad.MalaDiretaMaioresClientes1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[19].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRMalaDiretaMaioresCliente.Close;
      QRMalaDiretaMaioresCliente.SetVariable('DATA_I', FCadastroParam.ME19DataI.Text);
      QRMalaDiretaMaioresCliente.SetVariable('DATA_F', FCadastroParam.ME19DataF.Text);

      //Frames-------------------------
      if Trim(FCadastroParam.FmFilial20.MeFilial.Text) = '' then
        QRMalaDiretaMaioresCliente.SetVariable('FILIAL', Null)
      else
        QRMalaDiretaMaioresCliente.SetVariable('FILIAL', StrToInt(Trim(FCadastroParam.FmFilial20.MeFilial.Text)));

      if Trim(FCadastroParam.Fm1Vendedor20.MeVendedor.Text) = '' then
        QRMalaDiretaMaioresCliente.SetVariable('VENDEDOR', Null)
      else
        QRMalaDiretaMaioresCliente.SetVariable('VENDEDOR', StrToInt(Trim(FCadastroParam.Fm1Vendedor20.MeVendedor.Text)));

      if Trim(FCadastroParam.Fm2Vendedor20.MeVendedor.Text) = '' then
        QRMalaDiretaMaioresCliente.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRMalaDiretaMaioresCliente.SetVariable('VENDEDOR_PREPOSTO', StrToInt(Trim(FCadastroParam.Fm2Vendedor20.MeVendedor.Text)));

      if Trim(FCadastroParam.FmTipoCadastro20.MeTipoCadastro.Text) = '' then
        QRMalaDiretaMaioresCliente.SetVariable('TIPO_CADASTRO', Null)
      else
        QRMalaDiretaMaioresCliente.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro20.MeTipoCadastro.Text)));
      //------------------------------

      if FCadastroParam.CB19TipoProduto.Items[FCadastroParam.CB19TipoProduto.ItemIndex] = 'TODOS' then
        QRMalaDiretaMaioresCliente.SetVariable('TIPO_PRODUTO', Null)
      else
        QRMalaDiretaMaioresCliente.SetVariable('TIPO_PRODUTO', FCadastroParam.CB19TipoProduto.Items[FCadastroParam.CB19TipoProduto.ItemIndex]);

      QRMalaDiretaMaioresCliente.Open;

      if FRCadastro_MalaDiretaMaioresClientes = nil then
        FRCadastro_MalaDiretaMaioresClientes := TFRCadastro_MalaDiretaMaioresClientes.Create(Application);

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_MalaDiretaMaioresClientes.QRPrimario.Preview
      else
        FRCadastro_MalaDiretaMaioresClientes.QRPrimario.Print;

      QRMalaDiretaMaioresCliente.Close;
    end;
end;

procedure TFCadastroCad.DBRadioGroup2Change(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ARISTIDES') AND
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'SONOBOM')   AND
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'RAZENTE')   AND
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASAPEIXE') AND
     (pos('NFCE',DMParamSistema.qParamSistemaCod_Empresa.Value) = 0) then
    if DBRadioGroup2.ItemIndex = 0 then
    begin
      TsFisica.TabVisible := True;
      TsJuridica.TabVisible := False;
    end
    else
    begin
      TsJuridica.TabVisible := True;
      TsFisica.TabVisible := False;
    end;

  AjustarPerfilTributario;
end;

procedure TFCadastroCad.EtiquetaClienteFornecedorescomCompra1Click(
  Sender: TObject);
var
  wCont: Integer;

begin
  inherited;
  wCont := 1;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[20].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QREtiqueta.Close;
      QREtiqueta.open;
      if QREtiqueta.RecordCount > 0 then
      begin
        QREtiqueta.First;
        while not QREtiqueta.Eof do
          QREtiqueta.Delete;
      end;

      QREtiquetaClienteCompra.Close;

      //Frames-----------------------------
      if Trim(FCadastroParam.FmTipoCadastro21.MeTipoCadastro.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('TIPO_CADASTRO', Null)
      else
        QREtiquetaClienteCompra.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro21.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao21.MeRegiao.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('COD_REGIAO', Null)
      else
        QREtiquetaClienteCompra.SetVariable('COD_REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao21.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo21.MeRamo.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('COD_RAMO', Null)
      else
        QREtiquetaClienteCompra.SetVariable('COD_RAMO', StrToInt(Trim(FCadastroParam.FmRamo21.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado21.MeEstado.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('COD_ESTADO', Null)
      else
        QREtiquetaClienteCompra.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado21.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao21.MeClassificacao.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('COD_CLASS_CADASTRO', Null)
      else
        QREtiquetaClienteCompra.SetVariable('COD_CLASS_CADASTRO', StrToInt(Trim(FCadastroParam.FmClassificacao21.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor21.MeVendedor.Text) = '' then
        QREtiquetaClienteCompra.SetVariable('COD_VENDEDOR', Null)
      else
        QREtiquetaClienteCompra.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor21.MeVendedor.Text)));
      //---------------------------------------

      if (FCadastroParam.FmTipoCadastro21.EdTipoCadastro.Text = 'Fornecedor') or (FCadastroParam.FmTipoCadastro21.EdTipoCadastro.Text = 'FORNECEDOR')
        or (FCadastroParam.FmTipoCadastro21.EdTipoCadastro.Text = 'Fornecedores') then
      begin
        QREtiquetaClienteCompra.SQL[QREtiquetaClienteCompra.SQL.Count - 1] := ''; // elimina a última Linha da SQL
        QREtiquetaClienteCompra.SQL.Add('tb_operacao.ind_compras =' + CHR(39) + 'C' + CHR(39) + ')');
      end;
      case FCadastroParam.CB20Ordem.ItemIndex of
        0: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO');
        3: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO');
        4: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO');
        5: QREtiquetaClienteCompra.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      QREtiquetaClienteCompra.SetVariable('DT_VENDA', StrToDate(FCadastroParam.Me20DtReferencia.Text));

      QREtiquetaClienteCompra.Open;

      QREtiquetaClienteCompra.First;
      while not QREtiquetaClienteCompra.EOF do
      begin
        if wcont = 1 then
        begin
          QREtiqueta.Insert;
          QREtiquetaETIQUETA1.Value := QREtiquetaClienteCompraCOD_CADASTRO.Text;

        end;
        if wcont = 2 then
          QREtiquetaETIQUETA2.Value := QREtiquetaClienteCompraCOD_CADASTRO.Text;

        if wcont = 3 then
        begin
          QREtiquetaETIQUETA3.Value := QREtiquetaClienteCompraCOD_CADASTRO.Text;
          QREtiqueta.Post;
        end;
        QREtiquetaClienteCompra.Next;
        if wcont = 3 then
          wCont := 1
        else
          inc(wcont);
        QREtiquetaClienteCompra.Next;
      end;

      QREtiqueta.close;
      QREtiqueta.OPEN;

      if FREtiquetaClienteCompra = nil then
        FREtiquetaClienteCompra := TFREtiquetaClienteCompra.Create(Application);

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FREtiquetaClienteCompra.QuickRep1.Preview
      else
        FREtiquetaClienteCompra.QuickRep1.Print;

      QREtiquetaClienteCompra.Close;
      QREtiquetaClienteCompra.SQL.delete(QREtiquetaClienteCompra.SQL.Count - 1);
      QREtiquetaClienteCompra.SQL.delete(QREtiquetaClienteCompra.SQL.Count - 1);
      QREtiquetaClienteCompra.SQL.add('tb_operacao.ind_vendas =' + CHR(39) + 'V' + CHR(39) + ')');
    end;

end;

procedure TFCadastroCad.CancelaCadastrosSemCompras1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[14].TabVisible := True;
  FCadastroParam.Label102.Caption := 'Nr. Dias S/Compras:';
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro do
    begin
      if MessageDlg('Deseja cancelar os cadastros que não realizam compras a ' + Trim(FCadastroParam.Me14Dias.Text) + ' dias?', mtConfirmation, [mbYes,mbNo], 0) = MrNo then
        Exit; //Adicionado por Andre 13/11/2024 para evitar o cancelamento direto
      QCadastroSemCompras.Close;
      QCadastroSemCompras.SetVariable('Dt_Referencia', Date - StrToInt(Trim(FCadastroParam.Me14Dias.Text)));
      QCadastroSemCompras.SetVariable('Motivo', StrToInt(Trim(FCadastroParam.Me14Motivo.Text)));
      QCadastroSemCompras.ExecSQL;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DbCemapa.Commit;
      QCadastroSemCompras.Close;
    end;

end;

procedure TFCadastroCad.LimiteCrdito1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[21].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRLimiteCadastro.Close;

      //Frames----------------------
      if trim(FCadastroParam.FmCadastro22.MeCadastro.Text) <> '' then
        QRLimiteCadastro.setVariable('COD_CADASTRO', StrToInt(trim(FCadastroParam.FmCadastro22.MeCadastro.Text)))
      else
        QRLimiteCadastro.setVariable('COD_CADASTRO', null);

      if trim(FCadastroParam.FmFilial22.MeFilial.Text) <> '' then
        QRLimiteCadastro.setVariable('COD_FILIAL', StrToInt(trim(FCadastroParam.FmFilial22.MeFilial.Text)))
      else
        QRLimiteCadastro.setVariable('COD_FILIAL', null);
      //----------------------------

      if trim(FCadastroParam.ME20Data_I.Text) <> '' then
        QRLimiteCadastro.setVariable('DATA_I', trim(FCadastroParam.ME20Data_I.Text))
      else
        QRLimiteCadastro.setVariable('DATA_I', null);

      if trim(FCadastroParam.ME20Data_F.Text) <> '' then
        QRLimiteCadastro.setVariable('DATA_F', trim(FCadastroParam.ME20Data_F.Text))
      else
        QRLimiteCadastro.setVariable('DATA_F', null);
      QRLimiteCadastro.Open;

      if FRLimiteCadastro = nil then
        FRLimiteCadastro := TFRLimiteCadastro.Create(Application);
      FRLimiteCadastro.QRLFilial.Caption := 'Filial - ' + trim(FCadastroParam.FmFilial22.MeFilial.Text) + ' ' + trim(FCadastroParam.FmFilial22.EdFilial.Text);
      FRLimiteCadastro.QRLPeriodo.Caption := 'Período de ' + trim(FCadastroParam.ME20Data_I.Text) + ' até ' + trim(FCadastroParam.ME20Data_F.Text);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRLimiteCadastro.QRPrimario.Preview
      else
        FRLimiteCadastro.QRPrimario.Print;

      QRLimiteCadastro.Close;
    end;
end;

procedure TFCadastroCad.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if FBemEquipamentoCons = nil then
    FBemEquipamentoCons := TFBemEquipamentoCons.create(application);
  FBemEquipamentoCons.MECadastro.text := DMCadastro.QCadastroCod_Cadastro.text;
  if FBemEquipamentoCons.showmodal = mrok then
    with DMBensEquipamento do
    begin
      QBensEquipamentos.Close;
      QBensEquipamentos.setVariable('pk', QBensEquipamentosConsCod_Bem_Equipamento.Value);
      QBensEquipamentos.Open;
    end;
end;

procedure TFCadastroCad.BitBtn10Click(Sender: TObject);
var
  wPropriedade, wOnusPropriedade, wBemEquipamento, wOnusBemEquipamento: Real;
  wLimiteCredito, wContasReceber, wPedidos, wQtArea, wValor_Limite, wArea_Propria, wArea_Arrendada: Real;
begin
  inherited;
  if DMCadastro.QCadastroCod_Cadastro.Text <> '' then
  begin
    LBVlrPropriedade.Caption := '';
    LBVlrOnusPropriedade.Caption := '';
    LBBemEquip.Caption := '';
    LBVlrOnusEquipamento.Caption := '';
    LBVlrPedidos.Caption := '';
    LBContasReceber.caption := '';
    LBPatrimonioLiquido.Caption := '';
    LBLimiteCredito.Caption := '';
    LBCreditoAberto.caption := '';

    wPropriedade := 0;
    wOnusPropriedade := 0;
    wBemEquipamento := 0;
    wOnusBemEquipamento := 0;
    wLimiteCredito := 0;
    wContasReceber := 0;
    wPedidos := 0;
    wArea_Propria := 0;
    wArea_Arrendada := 0;

    LBVlrPropriedade.Caption := DMOracle.BuscaNome('SELECT SUM(VAL_PROPRIEDADE) FROM TB_PROPRIEDADE',
      'TB_PROPRIEDADE.COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    LBVlrOnusPropriedade.Caption := DMOracle.BuscaNome('SELECT SUM(VAL_HIPOTECA) FROM TB_PROPRIEDADE',
      'TB_PROPRIEDADE.COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    LBBemEquip.Caption := DMOracle.BuscaNome('SELECT SUM(VAL_BEM_EQUIPAMENTO) FROM TB_BEM_EQUIPAMENTO',
      'TB_BEM_EQUIPAMENTO.COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    LBVlrOnusEquipamento.Caption := DMOracle.BuscaNome('SELECT SUM(VAL_FINANCIAMENTO) FROM TB_BEM_EQUIPAMENTO',
      'TB_BEM_EQUIPAMENTO.COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    LBVlrPedidos.Caption := DMOracle.BuscaNome('SELECT  SUM(VAL_UNITARIO*(QT_PEDIDO-QT_ATENDIDO-QT_CANCELADO)) FROM TB_PEDIDO_CAB, TB_PEDIDO_ITEM ',
      'TB_PEDIDO_CAB.COD_PEDIDO_CAB = TB_PEDIDO_ITEM.COD_PEDIDO_CAB AND (QT_PEDIDO-QT_ATENDIDO-QT_CANCELADO) > 0' +
      ' AND TB_PEDIDO_CAB.COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    LBContasReceber.caption := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO + VAL_JUROS) FROM TB_CONTA_RECEBER_CAB ',
      ' IND_SITUACAO <> ''BAIXA TOTAL'' AND DT_BAIXA IS NULL AND  COD_CADASTRO = ' + DMCadastro.QCadastroCod_Cadastro.Text);

    //---este bloco formata o valor e atribui a variavel para realizar o calculo do patrimonio liquido
    if LBVlrPropriedade.Caption <> '' then
    begin
      wPropriedade := StrToFloat(LBVlrPropriedade.Caption);
      LBVlrPropriedade.Caption := bib.numToTexto(wPropriedade, 2, 11);
    end;

    if LBVlrOnusPropriedade.Caption <> '' then
    begin
      wOnusPropriedade := StrToFloat(LBVlrOnusPropriedade.Caption);
      LBVlrOnusPropriedade.Caption := Bib.NumToTexto(wOnusPropriedade, 2, 11);
    end;

    if LBBemEquip.Caption <> '' then
    begin
      wBemEquipamento := StrToFloat(LBBemEquip.Caption);
      LBBemEquip.Caption := Bib.NumToTexto(wBemEquipamento, 2, 11);
    end;

    if LBVlrOnusEquipamento.Caption <> '' then
    begin
      wOnusBemEquipamento := StrToFloat(LBVlrOnusEquipamento.Caption);
      LBVlrOnusEquipamento.Caption := Bib.NumToTexto(wOnusBemEquipamento, 2, 11);
    end;

    if LBVlrPedidos.Caption <> '' then
    begin
      wPedidos := StrToFloat(LBVlrPedidos.Caption);
      LBVlrPedidos.Caption := Bib.NumToTexto(wPedidos, 2, 11);
    end;

    if LBContasReceber.caption <> '' then
    begin
      wContasReceber := StrToFloat(LBContasReceber.caption);
      LBContasReceber.caption := Bib.NumToTexto(wContasReceber, 2, 11);
    end;
    LBPatrimonioLiquido.Caption := bib.NumToTexto(wPropriedade - wOnusPropriedade + wBemEquipamento - wOnusBemEquipamento, 2, 11);

    //---query faz o calculo do limite -- busca a area e multiplica pelo referencial da class cadastro

    with DMValorReferencia do
    begin
      QAtualiza_Limite.Close;
      QAtualiza_Limite.SetVariable('COD_TIPO_CADASTRO', Null);
      QAtualiza_Limite.SetVariable('COD_CLASS_CADASTRO', Null);
      QAtualiza_Limite.SetVariable('COD_CADASTRO', DMCadastro.QCadastroCod_Cadastro.Value);
      QAtualiza_Limite.Open;
      QAtualiza_Limite.First;
      QValorReferenciaCad.Close;
      QValorReferenciaCad.Open;
      while not QAtualiza_Limite.Eof do
      begin
        wArea_Propria := wArea_Propria + QAtualiza_LimiteQt_Propria.Value;
        wArea_Arrendada := wArea_Arrendada + QAtualiza_LimiteQt_Arrendada.Value;
        if QAtualiza_LimiteQT_AreaTotal.Value = 0 then
          wValor_Limite := 0
        else
        begin
          wQtArea := QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Producao_Media.Value;
          wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Custo_Producao.Value;
          wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Manutencao.Value;
          wQtArea := wQtArea - QAtualiza_LimiteQt_Arrendamento.Value;
          wQtArea := wQtArea - QAtualiza_LimiteQt_AreaTotal.Value * QValorReferenciaCadQt_Colheita.Value;
          wValor_Limite := wQtArea * QValorReferenciaCadVal_Produto.Value * (QAtualiza_LimitePerc_Equipamento.Value / 100);
          LBLimiteCredito.caption := bib.NumToTexto(wValor_Limite, 2, 11);
        end;
        QAtualiza_Limite.Next;
      end;
      QAtualiza_Limite.Close;
      LBCreditoAberto.caption := bib.NumToTexto(DMCadastro.QCadastroVAL_LIMITE.Value - wContasReceber - wPedidos, 2, 11);
      LBLPropria.caption := bib.NumToTexto(wArea_Propria, 2, 11);
      LBLArrendada.caption := bib.NumToTexto(wArea_Arrendada, 2, 11);
    end
  end
  else
    showmessage('É necessário escolher um cadastro para que possa Calcular o Limite');
end;

procedure TFCadastroCad.BtConsProprietarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMCadastro.QPropriedadeCod_Cadastro_Proprietario.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFCadastroCad.DBRadioGroup11Change(Sender: TObject);
begin
  inherited;
  if DBRadioGroup11.ItemIndex = 0 then
  begin
    DbEdit177.Enabled := False;
    BtConsProprietario.Enabled := False;
  end
  else
  begin
    DbEdit177.Enabled := True;
    BtConsProprietario.Enabled := True;
  end;
end;

procedure TFCadastroCad.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMBensEquipamento.QBensEquipamentosCod_Cadastro_Proprietario.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFCadastroCad.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMBensEquipamento.QBensEquipamentosCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFCadastroCad.DBEdit202Exit(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    if Trim(QCadastroCOD_CIDADE.Text) <> '' then
    begin
      QCadastroDESC_CIDADE.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
      QCadastroCOD_ESTADO.Text := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
      if DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' then
      begin
        QCadastroDESC_CIDADE_COBRANCA.Text := QCadastroDESC_CIDADE.Text;
        QCadastroDESC_ESTADO_COBRANCA.Text := QCadastroCOD_ESTADO.Text;
      end;
    end
  end;
end;

procedure TFCadastroCad.DBEdit197Exit(Sender: TObject);
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' then
    DmCadastro.QcadastroDesc_Endereco_Cobranca.Value := DMCadastro.QCadastroDesc_Endereco.Value;
end;

procedure TFCadastroCad.DBEdit196Exit(Sender: TObject);
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' then
    DmCadastro.QcadastroDesc_Bairro_Cobranca.Value := DMCadastro.QCadastroDesc_Bairro.Value;
end;

procedure TFCadastroCad.DBEdit199Exit(Sender: TObject);
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' then
    DmCadastro.QcadastroDesc_Bairro_Cobranca.Value := DMCadastro.QCadastroDesc_Bairro.Value;
end;

procedure TFCadastroCad.BtnCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    DMCadastro.QCadastroCOD_CIDADE.Value := DMCidade.QCidadeConsCod_Cidade.Value;
  DBEdit202Exit(Self);
  DBEdit202.SetFocus;
end;

procedure TFCadastroCad.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if FClassCadastroCons = nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  if FClassCadastroCons.ShowModal = mrOk then
    DMCadastro.QCadastroCod_Class_Cadastro.Value := DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Value;
end;

procedure TFCadastroCad.MandarEmailClientes1Click(Sender: TObject);
var
  wMensagem: TStrings;
  wTeste: Integer;
  wIncremento: Double;
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[2].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      FCarregando.ModoAmpliado;
      FCarregando.Show;
      FCarregando.Detalhe('Buscando clientes...');

      QREmailAniversariante.Close;
      if FCadastroParam.RG2TipoMensagem.ItemIndex = 0 then
      begin
        QrEmailAniversariante.SetVariable('MES_DIA_I', FCadastroParam.CB2MesI.Text +
          FCadastroParam.CB2DiaI.Text);
        QrEmailAniversariante.SetVariable('MES_DIA_F', FCadastroParam.CB2MesF.Text +
        FCadastroParam.CB2DiaF.Text);
      end
      else
      begin
        QrEmailAniversariante.SetVariable('MES_DIA_I', null);
        QrEmailAniversariante.SetVariable('MES_DIA_F', null);
      end;

      if Trim(FCadastroParam.FmTipoCadastro3.MeTipoCadastro.Text) = '' then
        QrEmailAniversariante.SetVariable('TIPO_CADASTRO', Null)
      else
        QrEmailAniversariante.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro3.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRamo3.MeRamo.Text) = '' then
        QrEmailAniversariante.SetVariable('RAMO', Null)
      else
        QrEmailAniversariante.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo3.MeRamo.Text)));
      QREmailAniversariante.Open;

      if QREmailAniversariante.RecordCount = 0 then
        MessageDlg('Nenhum aniversariante para enviar neste período', mtInformation, [mbOk], 0)
      else
      begin
        wIncremento := (100/QREmailAniversariante.RecordCount);
        
        DMCadastro_Rel.QREmailAniversariante.First;

        DMFilial.QFilial.Close;
        DMFilial.QFilial.SetVariable('PK', DMParamSistema.QParamSistemaCOD_FILIAL.Text);
        DMFilial.QFilial.open;
        DMCadastro.QCadastroEmail.Close;
        DMCadastro.QCadastroEmail.open;
        if FEnviaEmail = Nil then
          FEnviaEmail := TFEnviaEmail.Create(Application);
        FEnviaEmail.mostraCarregando := False;
        while not DMCadastro_Rel.QREmailAniversariante.Eof do
        begin
          FCarregando.Incremeta(wIncremento);
          FCarregando.Detalhe('Enviando para: ' + QREmailAniversarianteNOME.Text);
          if FCadastroParam.RG2TipoMensagem.ItemIndex = 0 then
          begin
            //IdMessage.Recipients.EMailAddresses := QREmailAniversarianteDESC_E_MAIL.Text;
            //ShowMessage('Codigo do cliente'+ DMCadastro_Rel.QREmailAniversarianteCOD_CADASTRO.Text);
            //IdMessage.Subject := 'FELIZ ANIVERSARIO';
    //        IdMessage.ContentType := 'text/html';
    //        IdMessage.CharSet := 'iso-8859-1';
            wMensagem := TStringList.Create;
            wMensagem.add('<html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>');
            wMensagem.add('<body> <table align="center"><tr><td><h3><center><font face="Tahoma">' + DMCadastro_Rel.QREmailAniversarianteNOME.Value + '</font></center></h3></td></tr>');
            wMensagem.add('<td><h3><center><font face="Tahoma"><b>Parabéns pelo seu Aniversário</b></font></center></h3></td> </tr></table>');
            wMensagem.add('<table align="center" cellpadding="0" width="400px">');
            wMensagem.add('<tr><td><center><font face="monotype corsiva" size="3">' + DMCadastro.QCadastroEmailDESC_MENSAGEM.Value + '</font></center></td></tr>');
            wMensagem.add('</table>');
            wMensagem.add('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            wMensagem.add('<table align="center" cellpadding="0">');
            wMensagem.add('<tr><td><center><font face="tahoma" size="2">São os votos da equipe <font color="blue">' + DMFilial.QFilialDESC_FILIAL.Value + '</font></font></center></td></tr></table>');
            wMensagem.add('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            wMensagem.add('<table align="right" cellpadding="0">');
            wMensagem.add('<tr><td align="right"><font face="tahoma" size="1">' + DMFilial.QFilialDESC_ENDERECO.Value + '</font></font></td></tr>');
            wMensagem.add('<tr><td align="right"><font face="tahoma" size="1">' + DMFilial.QFilialDESC_CEP.Value + '-' + DMFilial.QFilialDESC_CIDADE.Value + '-' + DMFilial.QFilialCOD_ESTADO.Value + '</font></td></tr>');
            wMensagem.add('<tr><td align="right"><font face="tahoma" size="1">E-mail:' + DMFilial.QFilialDESC_E_MAIL.Value + '- Home page: ' + DMCadastro.QCadastroEmailDESC_HOME_PAGE.Value + '</font></td></tr></table');
            wMensagem.add('</body></html>');
            FEnviaEmail.passunto_email := 'FELIZ ANIVERSÁRIO';
          end
          else
          begin
            wMensagem := TStringList.Create;
            wMensagem.Add('<html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>');
            wMensagem.Add('<body> <table align="center"><tr><td><h3><center><font face="Tahoma">' + FCadastroParam.Me2Assunto.Text + '</font></center></h3></td></tr></table>');
            wTeste := 0;
            wMensagem.Add('<table align="left">');
            while(wTeste <= FCadastroParam.ME2Mensagem.Lines.Count) do
            begin
              wMensagem.Add('<tr><td>');
              wMensagem.Add(FCadastroParam.ME2Mensagem.Lines.Strings[wTeste]);
              wMensagem.Add('</td></tr>');
              Inc(wTeste);
            end;
            wMensagem.Add('</table></body></html>');
            FEnviaEmail.passunto_email := FCadastroParam.Me2Assunto.Text;
          end;

          if QREmailAniversarianteDESC_E_MAIL.Text <> '' then
          begin                                                         
            FEnviaEmail.pmensagem_email := wMensagem.Text;
            FEnviaEmail.edEmail.Text := QREmailAniversarianteDESC_E_MAIL.Text;
            FEnviaEmail.pMostraMsgConclusao := false;
            FEnviaEmail.BtEnviarClick(Self);
          end;

          DMCadastro_Rel.QREmailAniversariante.Next;
        end; //while

        FCarregando.Close;
        Application.MessageBox('E-Mails enviados com sucesso', 'Confirmação',
          MB_ICONINFORMATION + MB_OK);
      end;
    end;
end;

procedure TFCadastroCad.Action_Ctrl_F2Execute(Sender: TObject);
begin
  inherited;
  if DsPrimario.DataSet.State = DsInsert then
    if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARISTIDES' then
      DMCadastro.QCadastroCod_Cadastro.Value := DMOracle.Sequencia('CADASTRO');
end;

procedure TFCadastroCad.Action_Ctrl_F3Execute(Sender: TObject);
begin
  inherited;
  if DsPrimario.DataSet.State = DsInsert then
    if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARISTIDES' then
      DMCadastro.QCadastroCod_Cadastro.Value := DMOracle.Sequencia('CADASTRO1');

end;

procedure TFCadastroCad.Action_Ctrl_F4Execute(Sender: TObject);
begin
  inherited;
  if DsPrimario.DataSet.State = DsInsert then
    if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARISTIDES' then
      DMCadastro.QCadastroCod_Cadastro.Value := DMOracle.Sequencia('CADASTRO2');

end;

procedure TFCadastroCad.Action_Ctrl_F5Execute(Sender: TObject);
begin
  inherited;
  if DsPrimario.DataSet.State = DsInsert then
    if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARISTIDES' then
      DMCadastro.QCadastroCod_Cadastro.Value := DMOracle.Sequencia('CADASTRO3');

end;

procedure TFCadastroCad.EtiquetasAniversariantes1Click(Sender: TObject);
var
  wCount: Integer;
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[5].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SetVariable('MES_DIA_I', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_I.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_I.Text)));
      QRMalaDireta_Aniver.SetVariable('MES_DIA_F', FormatFloat('00', StrToFloat(FCadastroParam.ME5Mes_F.Text))
        + FormatFloat('00', StrToFloat(FCadastroParam.ME5Dia_F.Text)));
      if Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro6.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao6.MeRegiao.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('REGIAO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao6.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo6.MeRamo.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('RAMO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('RAMO', StrToInt(Trim(FCadastroParam.FmRamo6.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado6.MeEstado.Text) = '' then
        QRMalaDireta_Aniver.SetVariable('ESTADO', Null)
      else
        QRMalaDireta_Aniver.SetVariable('ESTADO', Trim(FCadastroParam.FmEstado6.MeEstado.Text));
      case FCadastroParam.CB5Ordem.ItemIndex of
        0: QRMalaDireta_Aniver.SQL.Add('ORDER BY NOME_CONTATO');
        1: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_TIPO_CADASTRO');
        2: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_RAMO');
        3: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_ESTADO');
        4: QRMalaDireta_Aniver.SQL.Add('ORDER BY TO_CHAR(DT_NASCIMENTO_CONTATO,' + chr(39) + 'MMDD' + chr(39) + ')');
        5: QRMalaDireta_Aniver.SQL.Add('ORDER BY COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      QRMalaDireta_Aniver.Open;

      QEtiqueta.Close;
      QEtiqueta.Open;
      QEtiqueta.First;

      while not QEtiqueta.Eof do
      begin
        QEtiqueta.Delete;
      end;

      DMOracle.DBCemapa.Commit;

      QEtiqueta.First;
      QRMalaDireta_Aniver.First;
      wCount := 1;

      while not QRMalaDireta_Aniver.Eof do
      begin
        QEtiqueta.Insert;
        while wCount <= 2 do
        begin
          if wCount = 1 then
            QEtiquetaETIQUETA1.Value := QRMalaDireta_AniverCOD_CADASTRO.Text;
          if wCount = 2 then
            QEtiquetaETIQUETA2.Value := QRMalaDireta_AniverCOD_CADASTRO.Text;
          Inc(wCount);
          QRMalaDireta_Aniver.Next;
        end;
        wCount := 1;
        QEtiqueta.Post;
        QEtiqueta.Next;
      end;
      DMOracle.DBCemapa.Commit;

      QREtiquetaAniver.Close;
      QREtiquetaAniver.Open;

      if FRCadastro_Aniverr_Etiqueta = nil then
        FRCadastro_Aniverr_Etiqueta := TFRCadastro_Aniverr_Etiqueta.Create(Application);
      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Aniverr_Etiqueta.QuickRep1.Preview
      else
        FRCadastro_Aniverr_Etiqueta.QuickRep1.Print;
      QRMalaDireta_Aniver.Close;
      QRMalaDireta_Aniver.SQL[QRMalaDireta_Aniver.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.EtiquetaImpressoDOS1Click(Sender: TObject);
var
  EtiquetaImpressao: TEtiquetaImpressao;
  wQtImpressao: Integer;
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[22].TabVisible := true;
  if FCadastroParam.ShowModal = MrOk then
  begin

    EtiquetaImpressao := TEtiquetaImpressao.Create;

    with DMCadastro do
    begin
      QEtiquetaDOS.Close;

      //Frames--------------------------
      if Trim(FCadastroParam.FmCadastro23.MeCadastro.Text) <> '' then
        QEtiquetaDOS.SetVariable('CADASTRO', Trim(FCadastroParam.FmCadastro23.MeCadastro.Text))
      else
        QEtiquetaDOS.SetVariable('CADASTRO', null);
      if Trim(FCadastroParam.FmCidade23.MeCidade.Text) <> '' then
        QEtiquetaDOS.SetVariable('CIDADE', Trim(FCadastroParam.FmCidade23.MeCidade.Text))
      else
        QEtiquetaDOS.SetVariable('CIDADE', null);
      //---------------------------------

      if Trim(FCadastroParam.Me23Data_I.Text) <> '' then
        QEtiquetaDOS.SetVariable('DATA_I', Trim(FCadastroParam.Me23Data_I.Text))
      else
        QEtiquetaDOS.SetVariable('DATA_I', null);
      if Trim(FCadastroParam.Me23Data_F.Text) <> '' then
        QEtiquetaDOS.SetVariable('DATA_F', Trim(FCadastroParam.Me23Data_F.Text))
      else
        QEtiquetaDOS.SetVariable('DATA_F', null);
      QEtiquetaDOS.Open;
    end;
    wQtImpressao := FCadastroParam.CMB23Quantidade.ItemIndex;
    if FCadastroParam.RG23Porta.ItemIndex = 0 then
      EtiquetaImpressao.ImprimeEtiqueta('LPT1', wQtImpressao)
    else if FCadastroParam.RG23Porta.ItemIndex = 1 then
      EtiquetaImpressao.ImprimeEtiqueta('LPT2', wQtImpressao);

  end;
end;

procedure TFCadastroCad.CadastroporEstado1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[23].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro_Rel do
    begin
      QRCadastroEstado.Close;
      if FRCadastro_Estado = nil then
        FRCadastro_Estado := TFRCadastro_Estado.Create(Application);

      if Trim(FCadastroParam.FmEstado23.MeEstado.Text) <> '' then
      begin
        QRCadastroEstado.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado23.MeEstado.Text));
        FRCadastro_Estado.QRLEstado.Caption := FCadastroParam.FmEstado23.EdEstado.Text
      end
      else
        QRCadastroEstado.SetVariable('COD_ESTADO', null);
      case FCadastroParam.RG23TipoCadastro.ItemIndex of
        0:
          begin
            QRCadastroEstado.SetVariable('IND_FISICA_JURIDICA', 'F');
            FRCadastro_Estado.QRLTipoCadastro.Caption := 'FISICA';
          end;
        1:
          begin
            QRCadastroEstado.SetVariable('IND_FISICA_JURIDICA', 'J');
            FRCadastro_Estado.QRLTipoCadastro.Caption := 'JURIDICA';
          end;
        2:
          QRCadastroEstado.SetVariable('IND_FISICA_JURIDICA', null);
      end;
      QRCadastroEstado.open;

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FRCadastro_Estado.QRPrimario.Preview
      else
        FRCadastro_Estado.QRPrimario.Print;
    end;

end;

procedure TFCadastroCad.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.Showmodal = mrOk then
    DMCadastro.QCadastro_EnderecosCOD_CIDADE.Value := DMCidade.QCidadeConsCod_Cidade.Value;
  DBEdit227Exit(Self);
  DBEdit227.SetFocus;

end;

procedure TFCadastroCad.DBEdit227Exit(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    if Trim(QCadastro_EnderecosCOD_CIDADE.Text) <> '' then
    begin
      QCadastro_EnderecosDESC_CIDADE.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastro_EnderecosCOD_CIDADE.Text);
      QCadastro_EnderecosCOD_ESTADO.Text := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastro_EnderecosCOD_CIDADE.Text);
    end
  end;

end;

procedure TFCadastroCad.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if FPaisCons = nil then
    FPaisCons := TFPaisCons.Create(Application);
  if FPaisCons.ShowModal = mrOk then
    DMCadastro.QCadastro_EnderecosCod_Pais.Value := DMPais.QPaisConsCod_Pais.Value;

end;

procedure TFCadastroCad.PcEnderecosChange(Sender: TObject);
begin
  inherited;
  if PcEnderecos.ActivePage = TsMaisEnderecos then
  begin
    if DMCadastro.QCadastroCOD_CADASTRO.IsNull then
      raise exception.Create('Selecionar um Cadastro');
    DMCadastro.QCadastro_Enderecos.Insert;
    DMCadastro.QCadastro_Enderecos.Cancel;
  end;
end;

procedure TFCadastroCad.incluiImagem(caminho: string; tipo: string = 'FOTO'); //'FOTO' ou 'ASSINATURA'
var
  MyJPEG: TJPEGImage;
  MyBMP: TBitmap;
  (*stream, *)outStream: TMemoryStream;
  ext: string;

  StretchBitmap: TBitmap;
  Ratio: double;
  ARect: TRect;

  Height, width: integer;
begin
  inherited;

  if not FileExists(caminho) then
    raise Exception.Create('Arquivo não encontrado');

  ext := ExtractFileExt(LowerCase(caminho));
  if (ext <> '.bmp') and (ext <> '.jpg') and (ext <> '.jpeg') then
    raise Exception.Create('Arquivo Inválido');

  OutStream := TMemoryStream.Create;
  MyJPEG := TJPEGImage.Create;
  MyBMP := TBitmap.Create;

  // Create bitmap
  StretchBitmap := TBitmap.Create;
  try
    //se a figura informada for um bitmap é feita a conversão para jpeg
    if ext = '.bmp' then
    begin
      MyBMP.LoadFromFile(caminho);
      MyJPEG.Assign(MyBMP);
      MyJPEG.Compress;
    end
    else //se for jpg/jpeg
      MyJPEG.LoadFromFile(caminho);

    //-------redimensiona a imagem para ficar com o tamanho apropriado-----------
    if (MessageDlg('Redimensionar imagem?'+#13+#10+'(Deixa ela em tamanho menor, ganhando espaço. Porém, ficará menos legível)', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      // Adjust parameters
      Ratio := 0;
      Height := 240;
      width := 200;

      if MyJPEG.Height > 0 then
        Ratio := MyJPEG.Width / MyJPEG.Height;

      if Ratio > 1 then
        Height := Round(width / Ratio)
      else
        Width := Round(Height * Ratio);

      // Set bitmap atributes
      StretchBitmap.Width := width;
      StretchBitmap.Height := Height;
      StretchBitmap.Canvas.Brush.Color := clWindow;
      StretchBitmap.Canvas.FillRect(Rect(0, 0, Width, Height));

      // StretchDraw original image
      ARect := Rect(0, 0, width, Height);
      StretchBitmap.Canvas.StretchDraw(ARect, MyJPEG);

      // Assign back to the Jpeg, and save to the output file
      MyJPEG.Assign(StretchBitmap);
    end;
    MyJPEG.SaveToStream(OutStream);
    //---------fim redimensiona a imagem------------

    //------------grava a imagem no banco de dados-----------------
    DMCadastro.QImagemCadastro.close;
    DMCadastro.QImagemCadastro.open;

    if DMCadastro.QImagemCadastro.IsEmpty then
      DMCadastro.QImagemCadastro.Insert
    else
      DMCadastro.QImagemCadastro.Edit;

    DMCadastro.QImagemCadastroCOD_CADASTRO_IMAGEM.Value := DMCadastro.QCadastroCOD_CADASTRO.AsInteger;
    if tipo = 'FOTO' then
      DMCadastro.QImagemCadastroIMG_IMAGEM.LoadFromStream(outStream)
    else
      DMCadastro.QImagemCadastroIMG_ASSINATURA.LoadFromStream(outStream);
    DMCadastro.QImagemCadastro.post;
    //----------fim grava imagem no banco de dados------------

    if tipo = 'FOTO' then
      AtualizarImagemProduto
    else
      AtualizarAssinatura;
  finally
    MyJPEG.Free;
    MyBMP.Free;
    StretchBitmap.Free;
  end;
end;

procedure TFCadastroCad.btnIncluirImagemClick(Sender: TObject);
begin
  inherited;
  incluiImagem(MECaminhoImagem.Text, 'FOTO');
end;

procedure TFCadastroCad.btnProcurarClick(Sender: TObject);
begin
  inherited;
  if OPDImagem.Execute then
    MECaminhoImagem.Text := OPDImagem.FileName;
end;

procedure TFCadastroCad.btnExcluirImagemClick(Sender: TObject);
begin
  inherited;
  if messageDlg('Deseja realmente excluir esta imagem?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if DMCadastro.QImagemCadastroIMG_ASSINATURA.IsNull then
      DMCadastro.QImagemCadastro.Delete
    else
    begin
      DMCadastro.QImagemCadastro.Edit;
      DMCadastro.QImagemCadastroIMG_IMAGEM.Clear;
      DMCadastro.QImagemCadastro.Post;
    end;
  end;
end;

procedure TFCadastroCad.AtualizarImagemProduto;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMCadastro.QImagemCadastro.CreateBlobStream(DMCadastro.QImagemCadastroIMG_IMAGEM, bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      imgCadastro.Picture.Assign(Jpg);
      imgCadastro.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgCadastro.Picture.Assign(nil);
    imgCadastro.Visible := false;
  end;

  lblImagemNaoCadastrada.Visible := not imgCadastro.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFCadastroCad.AtualizarAssinatura;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;
  b := DMCadastro.QImagemCadastro.CreateBlobStream(DMCadastro.QImagemCadastroIMG_ASSINATURA, bmRead);

  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      imgAssinatura.Picture.Assign(Jpg);
      imgAssinatura.visible := true;
    except
    end;
  end
  else
  begin
    imgAssinatura.Picture.Assign(nil);
    imgAssinatura.Visible := false;
  end;

  lblAssinaturaNaoCadastrada.Visible := not imgAssinatura.Visible;

  jpg.Free;
  b.Destroy;
end;

procedure TFCadastroCad.DSImagemCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (DMCadastro.QImagemCadastro.RecordCount <= 0) then
  begin
    btnIncluirImagem.Enabled := true;
    btnProcurar.Enabled := true;
    btnExcluirImagem.Enabled := false;
    MECaminhoImagem.Text := 'C:\';
    MECaminhoImagem.ReadOnly := true;
    MECaminhoImagem.Color := clWindow;
    MECaminhoImagem.TabStop := true;

    btnIncluirAss.Enabled := true;
    btnProcurarAss.Enabled := true;
    btnExcluirImagem.Enabled := false;
    MECaminhoAssinatura.Text := 'C:\';
    MECaminhoAssinatura.ReadOnly := true;
    MECaminhoAssinatura.Color := clWindow;
    MECaminhoAssinatura.TabStop := true;
  end
  else
  begin
    if DMCadastro.QImagemCadastroIMG_IMAGEM.IsNull then
    begin
      btnIncluirImagem.Enabled := true;
      btnProcurar.Enabled := true;
      btnExcluirImagem.Enabled := false;
      MECaminhoImagem.Text := 'C:\';
      MECaminhoImagem.ReadOnly := true;
      MECaminhoImagem.Color := clWindow;
      MECaminhoImagem.TabStop := true;
    end
    else
    begin
      btnIncluirImagem.Enabled := false;
      btnProcurar.Enabled := false;
      btnExcluirImagem.Enabled := true;
      MECaminhoImagem.Text := '[Imagem já incluída]';
      MECaminhoImagem.ReadOnly := false;
      MECaminhoImagem.Color := clBtnFace;
      MECaminhoImagem.TabStop := false;
    end;

    if DMCadastro.QImagemCadastroIMG_ASSINATURA.IsNull then
    begin
      btnIncluirAss.Enabled := true;
      btnProcurarAss.Enabled := true;
      btnExcluirAss.Enabled := false;
      MECaminhoAssinatura.Text := 'C:\';
      MECaminhoAssinatura.ReadOnly := true;
      MECaminhoAssinatura.Color := clWindow;
      MECaminhoAssinatura.TabStop := true;
    end
    else
    begin
      btnIncluirAss.Enabled := false;
      btnProcurarAss.Enabled := false;
      btnExcluirAss.Enabled := true;
      MECaminhoAssinatura.Text := '[Imagem já incluída]';
      MECaminhoAssinatura.ReadOnly := false;
      MECaminhoAssinatura.Color := clBtnFace;
      MECaminhoAssinatura.TabStop := false;
    end;
  end;
end;

procedure TFCadastroCad.btnIncluirAssClick(Sender: TObject);
begin
  inherited;
  incluiImagem(MECaminhoAssinatura.Text, 'ASSINATURA');
end;

procedure TFCadastroCad.btnProcurarAssClick(Sender: TObject);
begin
  inherited;
  if OPDImagem.Execute then
    MECaminhoAssinatura.Text := OPDImagem.FileName;
end;

procedure TFCadastroCad.btnExcluirAssClick(Sender: TObject);
begin
  inherited;
  if messageDlg('Deseja realmente excluir esta assinatura?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if DMCadastro.QImagemCadastroIMG_IMAGEM.IsNull then
      DMCadastro.QImagemCadastro.Delete
    else
    begin
      DMCadastro.QImagemCadastro.Edit;
      DMCadastro.QImagemCadastroIMG_ASSINATURA.Clear;
      DMCadastro.QImagemCadastro.Post;
    end;
  end;
end;

procedure TFCadastroCad.MostraVendaLiberada;
var permite: string;
begin
  if DMCadastro.QCadastroCOD_CLASS_CADASTRO.IsNull then
    permite := 'S'
  else
    permite := DMOracle.BuscaNome('SELECT IND_VENDA FROM TB_CLASS_CADASTRO', 'COD_CLASS_CADASTRO = ' + DMCadastro.QCadastroCOD_CLASS_CADASTRO.Text);

  if ((DMParamSistema.QParamSistemaIND_CADASTRO_RUIM_VERMELHO.Value <> 'S') or (permite = 'S')) then
  begin
    DBPNome.DBEdit.Color := clWindow;
    DBPNome.DBEdit.Font.Color := clWindowText;
    DBPNome.DBEdit.Font.Style := [];
  end
  else
  begin
    DBPNome.DBEdit.Color := clRed;
    DBPNome.DBEdit.Font.Color := clWhite;
    DBPNome.DBEdit.Font.Style := [fsBold];
  end;
end;

procedure TFCadastroCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  MostraVendaLiberada;
end;

procedure TFCadastroCad.SBLiberaLimiteClick(Sender: TObject);
var
  Cap: String;
begin
  inherited;
  if (not DMCadastro.QCadastro.Eof) and (DSPrimario.State in [DsEdit, DsInsert]) then
  begin
    if FOficinaPassword = nil then
      FOficinaPassword := TFOficinaPassword.Create(Application);
    Cap := FOficinaPassword.Caption;
    FOficinaPassword.Caption := 'Senha para liberar o cadastro...';
    if FOficinaPassword.ShowModal = MrOk then
    begin
      if FOficinaPassword.Password.Text = DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text then
        DMCadastro.QCadastroNUM_LIBERA_LIMITE.Value := 1
      else
        MessageDlg('Senha inválida.', mtError, [mbOK], 0);
    end;
    FOficinaPassword.Caption := Cap;
  end;
end;

procedure TFCadastroCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBLiberaLimite.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  btnTirarFoto.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  CBInscricao.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  if (Length(Trim(DMCadastro.QCadastroDESC_TELEFONE.Value)) < 11) and (DMCadastro.QCadastroDESC_TELEFONE.Text <> '') then
    DMCadastro.QCadastroDESC_TELEFONE.EditMask := '(99)  9999-9999;0;_'
  else
    DMCadastro.QCadastroDESC_TELEFONE.EditMask := '(99) 99999-9999;0;_';
  DBLookupComboBox1.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  OracleNavigator2.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  CBPerfilTributario.Enabled := DSPrimario.State in [dsInsert, dsEdit];
// POLLYANA: permite alterar o código do cadastro na alteração. Alex 21/10/2026
  if (DMParamSistema.CodEmpresa = 'POLLYANA') and (DSPrimario.State = dsEdit) then
  begin
    DMCadastro.QCadastroCOD_CADASTRO.ReadOnly := False;
    DBPanel3.ReadOnly := False;
    DBPanel3.Enabled := True;
  end
end;

procedure TFCadastroCad.DBPanel2CodigoChange(Sender: TObject);
begin
  inherited;
  AtualizarImagemProduto;
  AtualizarAssinatura;
end;

procedure TFCadastroCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;
end;

procedure TFCadastroCad.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRegiaoCons;
  Classe := TFRegiaoCons;
end;

procedure TFCadastroCad.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFCadastroCad.DBPanel13DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FClassCadastroCons;
  Classe := TFClassCadastroCons;
end;

procedure TFCadastroCad.DBPOperacaoVendaCCDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFCadastroCad.DBPVendedorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFCadastroCad.DBPVendedorPrepostoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFCadastroCad.DBPPrazoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPrazoVencimentoCons;
  Classe := TFPrazoVencimentoCons;
end;

procedure TFCadastroCad.DBPDiasVenctoCodigoExit(Sender: TObject);
begin
  inherited;
  if DMCadastro.QCadastroNUM_DIA_VENCTO.Text <> '' then
    if not (DMCadastro.QCadastroNUM_DIA_VENCTO.Value in [1..31]) then
    begin
      DBPDiasVencto.DBEdit.Setfocus;
      raise Exception.Create('Dia deve estar entre 1 e 31');
    end;
end;

procedure TFCadastroCad.DBPEnderecoPanelCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_ENDERECO_COBRANCA.Value := DMCadastro.QCadastroDESC_ENDERECO.Value;
end;

procedure TFCadastroCad.DBPBairroPanelCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_BAIRRO_COBRANCA.Value := DMCadastro.QCadastroDESC_BAIRRO.Value;
end;

procedure TFCadastroCad.DBPCidadePanelCodigoExit(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    if Trim(QCadastroCOD_CIDADE.Text) <> '' then
    begin
      QCadastroDESC_CIDADE.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
      QCadastroCOD_ESTADO.Text := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CIDADE', 'COD_CIDADE = ' + QCadastroCOD_CIDADE.Text);
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then
      begin
        QCadastroDESC_CIDADE_COBRANCA.Text := QCadastroDESC_CIDADE.Text;
        QCadastroDESC_ESTADO_COBRANCA.Text := QCadastroCOD_ESTADO.Text;
      end;
    end
    else
    begin
      QCadastroDESC_CIDADE.Text:='' ;
      QCadastroCOD_ESTADO.Text:='' ;
    end;
  end;
end;

procedure TFCadastroCad.DBPCidadePanelDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFCadastroCad.DBPCidadePanelAfterConsulta(Sender: TObject);
begin
  inherited;
  DBPCidadePanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPDescCidadePanelCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_CIDADE_COBRANCA.Value := DMCadastro.QCadastroDESC_CIDADE.Value;
end;

procedure TFCadastroCad.DBPEstadoPanelCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_ESTADO_COBRANCA.Value := DMCadastro.QCadastroCOD_ESTADO.Value;
end;

procedure TFCadastroCad.DBPPaisPanelDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPaisCons;
  Classe := TFPaisCons;
end;

procedure TFCadastroCad.DBEdit23Exit(Sender: TObject);
begin
  inherited;
  DBPBairroPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPCepPanelCodigoExit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'MOINHO' then
    DMCadastro.QCadastroDESC_CEP_COBRANCA.Value := DMCadastro.QCadastroDESC_CEP.Value;
end;

procedure TFCadastroCad.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  DBPCepPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPEnderecoCodigoExit(Sender: TObject);
begin
  inherited;
  DBPEnderecoPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPCidadeCodigoExit(Sender: TObject);
begin
  inherited;
  DBPCidadePanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPEstadoCodigoExit(Sender: TObject);
begin
  inherited;
  DBPEstadoPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPDescCidadeCodigoExit(Sender: TObject);
begin
  inherited;
  DBPDescCidadePanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPCidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFCadastroCad.DBPanel28DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FBancosCons;
  Classe := TFBancosCons;
end;

procedure TFCadastroCad.DBPCidadeAfterConsulta(Sender: TObject);
begin
  inherited;
  DBPCidadeCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPBairroCodigoExit(Sender: TObject);
begin
  inherited;
  DBPBairroPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPCepCodigoExit(Sender: TObject);
begin
  inherited;

  DBPCepPanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPPaisDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPaisCons;
  Classe := TFPaisCons;
end;

procedure TFCadastroCad.DBPanel20DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FClassCadastroCons;
  Classe := TFClassCadastroCons;
end;

procedure TFCadastroCad.DBPanel21DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCivilCons;
  Classe := TFEstadoCivilCons;
end;

procedure TFCadastroCad.DBPMotivoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMotivoCons;
  Classe := TFMotivoCons;
end;

procedure TFCadastroCad.DBPMotivoCodigoExit(Sender: TObject);
begin
  inherited;
  if (DMCadastro.QCadastroDT_CANCELAMENTO.IsNull) and
    (DBPMotivo.DBEdit.Text <> '') then
    DMCadastro.QCadastroDT_CANCELAMENTO.Value := DMOracle.DataServ;
end;

procedure TFCadastroCad.MostraImgMax(Query: TOracleDataset1; FieldImg: TField);
var
  Stream: TStream;
  FormImg: TForm;
  Pic: TImage;
  Jpg: TJPEGImage;
begin
  //Mostrar imagem aumentada
  if not FieldImg.IsNull then
  begin
    Stream := Query.CreateBlobStream(FieldImg, bmRead);
    Jpg := TJPEGImage.Create;
    Jpg.LoadFromStream(Stream);

    FormImg := TForm.Create(Application);
    Pic := TImage.Create(FormImg);
    Pic.Parent := FormImg;
    Pic.Align := alClient;
    FormImg.BorderStyle := bsDialog;
    FormImg.Position := poScreenCenter;
    FormImg.ClientHeight := IfThen(Jpg.Height > 0, Jpg.Height, 100);
    FormImg.ClientWidth := IfThen(Jpg.Width > 0, Jpg.Width, 100);
    FormImg.Caption := 'Imagem no tamanho normal';
    Pic.Picture.Assign(Jpg);
    FormImg.ShowModal;
    FormImg.Free;
  end;
end;

procedure TFCadastroCad.imgAssinaturaClick(Sender: TObject);
begin
  inherited;
  with DMCadastro do
    MostraImgMax(QImagemCadastro, QImagemCadastroIMG_ASSINATURA);
end;

procedure TFCadastroCad.imgCadastroClick(Sender: TObject);
begin
  inherited;
  with DMCadastro do
    MostraImgMax(QImagemCadastro, QImagemCadastroIMG_IMAGEM);
end;

procedure TFCadastroCad.PCCadastroChange(Sender: TObject);
begin
  inherited;
  If PCCadastro.ActivePage.PageIndex = 5 Then
   Begin
     DMCadastro.QPropriedade.Close;
     If DMCadastro.QCadastroCOD_CADASTRO.Text <> DMCadastro.QPropriedadeCOD_CADASTRO.Text Then
        DMCadastro.QPropriedade.SetVariable('Pk',Null);
     DMCadastro.QPropriedade.Open;
   End;
end;

procedure TFCadastroCad.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  FRegiaoCons.Caption := 'Ligar';
  if FRegiaoCons.ShowModal = mrOk then
    DMCadastro.QCadastroCOD_REGIAO.Value := DMRegiao.QRegiaoCOD_REGIAO.Value;
end;

procedure TFCadastroCad.CBInscricaoClick(Sender: TObject);
begin
  inherited;
  if CBInscricao.Checked then
  begin
    DMCadastro.QCadastroNUM_INSCRICAO.Value := 'ISENTO';
    DBEIncricaoEstadual.Enabled := false;
    DBCBContribuinte.Enabled := True;
  end
  else
  begin
    DMCadastro.QCadastroNUM_INSCRICAO.Value := '';
    DBEIncricaoEstadual.Enabled := true;
  end;
end;

procedure TFCadastroCad.DBPanel23DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEStadoCons;
  Classe := TFEstadoCons;
end;

procedure TFCadastroCad.ExportaClienteFornecedor1Click(Sender: TObject);
begin
  inherited;
  {if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[25].TabVisible := True;
  FCadastroParam.RGPreview.Visible := False;
  if FCadastroParam.ShowModal = mrOk then
   ExportacaoClienteFornecedor;

  FCadastroParam.RGPreview.Visible := True; }
end;

procedure TFCadastroCad.ExportacaoClienteFornecedor;
{var
  S : String;
  F : TextFile;
  wSequencia : Integer;  }
begin
  {wSequencia := 1;
  try
    with DMCadastro do  begin
      QCadastroExp.Close;
      if trim(FCadastroParam.FmTipoCadastro25.MeTipoCadastro.Text) = '' then
        QCadastroExp.SetVariable(':COD_TIPO_CADASTRO', Null)
      else
        QCadastroExp.SetVariable(':COD_TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro25.MeTipoCadastro.Text)));

      QCadastroExp.Open;
      QCadastroExp.First;
      begin
        while not (QCadastroExp.Eof) do
        begin
          //CNPJ/CPF
          if ((Trim(QCadastroExpDESC_CIDADE.Text) = 'EXTERIOR') or (trim(QCadastroNUM_CGC_CPF.Text) = '')) then
            S := S + '99.999.999/9999-99'
          else
            S := S +   bib.FormataTexto(bib.FormataCNPJ_CPF(Bib.TiraMascara(QCadastroExpNUM_CGC_CPF.Value)),18,' ');
          //RAZAO SOCIAL
          S := S +Bib.FormataTexto(QCadastroExpNOME.Value,40)                +
          //FANTASIA
          Bib.FormataTexto(QCadastroExpDESC_FANTASIA.Value,20)       +
          //ESTADO
          bib.FormataTexto(QCadastroExpCOD_ESTADO.Value,2) ;
          //INSCRICAO ESTADUAL
          if QCadastroExpNUM_INSCRICAO.Text = 'ISENTO' then
             S := S + bib.FormataTexto(QCadastroExpNUM_INSCRICAO.Value,20,' ')
          else
            S := S + RMaskCGC_CPF(QCadastroExpNUM_INSCRICAO.Value,20);
          //ENDERECO
          S := S + Bib.FormataTexto(QCadastroExpDESC_ENDERECO.Value,40) +
          //BAIRRO
          Bib.FormataTexto(QCadastroExpDESC_BAIRRO.Value,20)         +
          //CIDADE
          Bib.FormataTexto(QCadastroExpDESC_CIDADE.value,20)         +
          //CEP
          RMaskCGC_CPF(QCadastroExpDESC_CEP.Value,8)                 +
          //CODIGO CIDADE
          RMaskCGC_CPF(QCadastroExpCOD_CIDADE_IBGE.Value,4)                +
          //TELEFONE
          RMaskCGC_CPF(QCadastroExpDESC_TELEFONE.Value,13)           +
          //CONTAS CONTÁBEIS - CTA CLIENTE/HIST. CLIENTE/ CONT/FORN
          Bib.StrZero2(0,6,0) + bib.StrZero2(0,3,0) + bib.StrZero2(0,6,0) +
          //HISTÓRICO FORNECEDOR
          bib.StrZero2(0,3,0);
          //Utilizado para preencher com S/N para Produtor Rural no Layout.
          if (QCadastroExpPERC_FUNRURAL.Text > '0') and (QCadastroExpPERC_FUNRURAL.Text <> null)then
            S := S + 'S'
          else
            S := S + 'N';
          //identificacao exterior
          s := S + bib.StrZero2(0,18,0);
          //preencher com o numero do endereço
          if bib.NumEndereco(QCadastroExpDESC_ENDERECO.Value) = 'sn' then
             S := s + '00000'
          else
             S := S + bib.StrZero(bib.NumEndereco(QCadastroExpDESC_ENDERECO.Value),5);
          //preenhcer com zeros o complemento do endereco
          S := S + bib.FormataTexto(' ',20,' ') +
          //SUFRAMA
          RMaskCGC_CPF(QCadastroExpDESC_SUFRAMA.Value,9) +
          //COD PAIS IBGE
          RMaskCGC_CPF(QCadastroExpCOD_PAIS_IBGE.Text,5) +
          {Para Nat. Juridica  - ADICIONADO 'O' PARA DEIXAR EM BRANCO
                       1-Pessoa Juridica de Direito Privado  2-Órgão, Autarquia ou Fundação Federal;
                       3-Demais Entidades;                   4-Órgão, Autarquia ou Fundação Estadual ou Municipal;
                       5-Sociedade; }
          {'0'                                                        +
           RMaskCGC_CPF(QCadastroExpCOD_UF_IBGE.Text,2) +  RMaskCGC_CPF(QCadastroExpCOD_CIDADE_IBGE.Value,5) +
           bib.FormataTexto(' ',5,' ') +
          //Sequencia
          RMaskCGC_CPF(IntToStr(wSequencia),6);

          wSequencia := wSequencia + 1;
          S := S+Chr(13)+Chr(10);
          QCadastroExp.Next;
        end;
      end;
    end;

    if FCadastroCad.SaveDialog.Execute then
    begin
     AssignFile(F,FCadastroCad.SaveDialog.FileName);
     Rewrite(F);
     Writeln(F,S);
     CloseFile(F);
     Application.MessageBox('Arquivo Gerado com Sucesso.', 'Atenção', MB_ICONINFORMATION or MB_OK);
    end;
  except on e:Exception do
   begin
     Application.MessageBox('Não foi possível gerar o arquivo de exportaçao.', 'Atenção', MB_ICONINFORMATION or MB_OK);
     //FCadastroParam.RGPreview.Visible := True;
   end;
  end; }

end;

procedure TFCadastroCad.DBPLimiteEnter(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_SENHA_LIMITE.Value = 'S' Then
  Begin
    //if DSPrimario.State in [DsEdit] then  //Se o usuário colocasse o foco do mouse dentro do campo antes de alterar, o Sistema não validava a senha. Vanessa F. 06/02/2018
    //Begin
      if FOficinaPassword = nil then
        FOficinaPassword := TFOficinaPassword.Create(Application);

      FOficinaPassword.Caption := 'Senha para alterar o limite...';
      if FOficinaPassword.ShowModal = MrOk then
      begin
        if FOficinaPassword.Password.Text = DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text then
          
        else
        Begin
          DBPPercDesconto.SetFocus;
          MessageDlg('Senha inválida.', mtError, [mbOK], 0);
        end;
      end
      else
        DBPPercDesconto.SetFocus;
    //end;
  end;
end;

procedure TFCadastroCad.DBPanel13Enter(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
  Begin
    if DSPrimario.State in [DsEdit] then
    Begin
      if FOficinaPassword = nil then
        FOficinaPassword := TFOficinaPassword.Create(Application);

      FOficinaPassword.Caption := 'Senha para alterar o limite...';
      if FOficinaPassword.ShowModal = MrOk then
      begin
        if FOficinaPassword.Password.Text = DMParamSistema.QParamSistemaDESC_SENHA_OFICINA.Text then
          DBPVendedor.SetFocus
        else
        Begin
          DBPVendedor.SetFocus;
          MessageDlg('Senha inválida.', mtError, [mbOK], 0);
        end;
      end
      else
        DBPVendedor.SetFocus;
    end;
  end;
end;

procedure TFCadastroCad.DBPanel35DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCadastroCad.DBPanel7Enter(Sender: TObject);
begin
  inherited;
  DMCadastro.QCadastroDESC_TELEFONE.EditMask := '(99) 99999-9999;0;_';
end;

procedure TFCadastroCad.DBPanel37DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;

end;

procedure TFCadastroCad.DBPanel45DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCivilCons;
  Classe := TFEstadoCivilCons;

end;

procedure TFCadastroCad.DBPanel47DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;

end;

procedure TFCadastroCad.DBPanel47CodigoExit(Sender: TObject);
begin
  inherited;
  DBPCidadePanelCodigoExit(Sender);

end;

procedure TFCadastroCad.DBPanel48CodigoExit(Sender: TObject);
begin
  inherited;
  DBPDescCidadePanelCodigoExit(Sender);

end;

procedure TFCadastroCad.DBPanel49CodigoExit(Sender: TObject);
begin
  inherited;
  DBPEstadoPanelCodigoExit(Sender);

end;

procedure TFCadastroCad.DBRGFisica_JuridicaChange(Sender: TObject);
begin
  inherited;
  if DBRGFisica_Juridica.ItemIndex = 0 then
  begin
    Label169.Caption := 'RG';
    Label171.Caption := 'CPF';
  end
  else
  begin
    Label169.Caption := 'I.E';
    Label171.Caption := 'CNPJ';
  end
end;

procedure TFCadastroCad.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if FEstadoCivilCons = nil then
    FEstadoCivilCons := TFEstadoCivilCons.Create(Application);
  if FEstadoCivilCons.Showmodal = mrOk then
    DMCadastro.QCadastroCOD_ESTADO_CIVIL.Value := DMEstadoCivil.QEstadoCivilConsCOD_ESTADO_CIVIL.Value;
  DBEdit185Exit(Self);
  DBEdit185.SetFocus;
end;

procedure TFCadastroCad.DBEdit185Exit(Sender: TObject);
begin
  inherited;
   with DMCadastro do
    begin
     if Trim(QCadastroCOD_ESTADO_CIVIL.Text) <> '' then
     begin
       QCadastroDESC_ESTADO_CIVIL.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = ' + QCadastroCOD_ESTADO_CIVIL.Text);
     end;
    end;
end;
procedure TFCadastroCad.DBPCidadeExit(Sender: TObject);
begin
  inherited;
  DBPCidadePanelCodigoExit(Sender);
end;

procedure TFCadastroCad.DBPanel59DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPaisCons;
  Classe := TFPaisCons;
end;

procedure TFCadastroCad.DBLookupComboBox1DropDown(Sender: TObject);
begin
  inherited;
  with DMCadastro, DMOracle do
  begin

    if QCadastroCOD_PAIS.Value = 0 then
    begin
      MessageDlg('País não informado.', mtError, [mbOk], 0);
      Abort;
    end;

    QQualificacaoSocio.Close;

    QQualificacaoSocio.SetVariable('PAIS'
      ,FastSelect('DESC_PAIS', 'TB_PAIS'
      ,'COD_PAIS = ' + QCadastroCOD_PAIS.Text)
    );                                          
    QQualificacaoSocio.SetVariable('TIPO'
      ,'P' + QCadastroIND_FISICA_JURIDICA.Value);

    QQualificacaoSocio.Open;    
  end;
end;

procedure TFCadastroCad.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.Hint
      := DMCadastro.QQualificacaoSocioDESC_COMPLETA.Value;
end;

procedure TFCadastroCad.DBPanel60Validate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
begin
  inherited;
  if (Value > 99.99) or (Value < 0) then
  begin
    Msg := 'Percentual não pode ser maior que 99,99% ou menor que 0%';
    isValid := false;
  end;


end;

procedure TFCadastroCad.DBPanel60Exit(Sender: TObject);
begin
  inherited;
  DMCadastro.QCadastroPERC_CAP_TOT.Text
    := formatfloat('#0.00', DMCadastro.QCadastroPERC_CAP_TOT.Value);
end;

procedure TFCadastroCad.DBPanel61Exit(Sender: TObject);
begin
  inherited;
  DMCadastro.QCadastroPERC_CAP_VOT.Text
    := formatfloat('#0.00', DMCadastro.QCadastroPERC_CAP_VOT.Value);
end;

procedure TFCadastroCad.DBPanel61Validate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
begin
  inherited;
  if (Value > 99.99) or (Value < 0) then
  begin
    Msg := 'Percentual não pode ser maior que 99,99% ou menor que 0%';
    isValid := false;
  end;
end;

procedure TFCadastroCad.FichaCadastralAristides;
Begin
  MessageDlg('Prepare impressora para emissão da ficha cadastral!',mtWarning,[mbOk],0);
  if imp = Nil then
    imp:=TImp.Create;
  Imp.AbreImpressora;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','OITAVOS',32);
  with DMCadastro_Rel do
    begin

      Imp.WriteXY(1.5,1,QRCadastroNome.Value);
      Imp.WriteXY(10.3,1,copy(QRCadastroDt_Nascimento.Text,1,2));
      Imp.WriteXY(11.3,1,copy(QRCadastroDt_Nascimento.Text,4,2));
      Imp.WriteXY(12.1,1,copy(QRCadastroDt_Nascimento.Text,7,4));
      Imp.WriteXY(14.5,1,QRCadastroNum_Inscricao.Text);
      Imp.WriteXY(18.5,1,QRCadastroCod_Cadastro.Text);

      Imp.WriteXY(2,3,QRCadastroNome_Conjuge.Value);
      Imp.WriteXY(10.3,3,copy(QRCadastroDt_Nascimento_Conjuge.Text,1,2));
      Imp.WriteXY(11.3,3,copy(QRCadastroDt_Nascimento_Conjuge.Text,4,2));
      Imp.WriteXY(12.1,3,copy(QRCadastroDt_Nascimento_Conjuge.Text,7,4));
      Imp.WriteXY(12.5,3,QRCadastroDesc_Identidade_Conjuge.Value);

      Imp.WriteXY(1.8,5,QRCadastroNome_Pai.Value + '  ' +QRCadastroNome_Mae.Value);
      Imp.WriteXY(1.8,7,QRCadastroNOME_AUTORIZADO2.Value + '  ' +QRCadastroNOME_AUTORIZADO3.Value);
 


      Imp.WriteXY(1.5,9,QRCadastroNUM_CGC_CPF.Value);
      Imp.WriteXY(7,9,QRCadastroDESC_CPF_CONJUGE.Value);

      Imp.WriteXY(1.5,12,QRCadastroDESC_BAIRRO.Value);
      Imp.WriteXY(7.5,12,QRCadastroDESC_CIDADE.Value);
      Imp.WriteXY(13,12,QRCadastroDESC_ESTADO.Value);

      Imp.WriteXY(2.2,14,QRCadastroDESC_ENDERECO.Value);
      Imp.WriteXY(12.5,14,QRCadastroDESC_TELEFONE.Value);
      Imp.WriteXY(17.5,14,QRCadastroDESC_CELULAR.Value);

      Imp.WriteXY(2.2,16,QRCadastroDESC_EMPRESA.Value + '- ' + QRCadastroDESC_FUNCAO.Value);
      Imp.WriteXY(12.5,16,QRCadastroDESC_FONE_EMPRESA.Value);

      Imp.WriteXY(2.2,19,QRCadastroDESC_EMPRESA_CONJUGE.Value);
      Imp.WriteXY(9.5,19,copy(QRCadastroDt_Cadastro.Text,4,7));
    End;
  Imp.SaltaPagina;
  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao

End;

procedure TFCadastroCad.DBPanel63DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTabelaPrecoCons;
  Classe := TFTabelaPrecoCons;
end;

procedure TFCadastroCad.SBAlterarClick(Sender: TObject);
var i: integer;
begin   
  inherited;
  // Não permite usuários comuns alterar a classificação do cliente
  with DMUsuario do
  begin
    if (pTipoFuncionario = 'COLABORADOR') or (pTipoFuncionario = 'VENDEDOR') then
    begin
      //DBPanel13.ReadOnly := true;
      TMaskEdit(DBPanel13.Components[2]).Enabled := false;
      TMaskEdit(DBPanel13.Components[3]).Enabled := false;
      TMaskEdit(DBPanel13.Components[3]).Hint := '';
      DBPanel13.Hint := 'Somente usuários do tipo Diretor, Gerente ou Supervisor'
        + ' podem alterar a classificação do cliente';
    end
    else
    begin
      //DBPanel13.ReadOnly := false;
      TMaskEdit(DBPanel13.Components[2]).Enabled := true;
      TMaskEdit(DBPanel13.Components[3]).Enabled := true;
      DBPanel13.Refresh;
      DBPanel13.Hint := '';
    end;
  end;
  DBNavigator2.Enabled := True;

  CBPerfilTributario.ItemIndex := DMCadastro.QCadastroIND_PERFIL_TRIBUTARIO.Value;
end;

procedure TFCadastroCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  // Limpa as configurações da classificação do cliente
  with DMUsuario do
  begin
    if not(pTipoFuncionario = 'COLABORADOR')
      or not(pTipoFuncionario = 'VENDEDOR') then
    begin
      //DBPanel13.ReadOnly := false;
      TMaskEdit(DBPanel13.Components[2]).Enabled := true;
      TMaskEdit(DBPanel13.Components[3]).Enabled := true;
      DBPanel13.Hint := '';
    end;
  end;
end;

procedure TFCadastroCad.DBEIncricaoEstadualChange(Sender: TObject);
begin
  inherited;
  if DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'J' then
  begin
    if Trim(DBEIncricaoEstadual.Text) = '' then
    begin
      DBCBContribuinte.Checked := false;
      DBCBContribuinte.Enabled := False;
    end
    else if DBEIncricaoEstadual.Text = 'ISENTO' then
      DBCBContribuinte.Enabled := true
    else
    begin
      DBCBContribuinte.Checked := true;
      DBCBContribuinte.Enabled := False;
    end;
  end;
end;

procedure TFCadastroCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FImpCadastroXML = nil then
    FImpCadastroXML := TFImpCadastroXML.Create(Application);
  FImpCadastroXML.ShowModal;
end;

procedure TFCadastroCad.DBPInscricaoMunicipalValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
begin
  inherited;  
  if (Value <> null) and (Length(Value) < 5) and (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') then
  begin
    isValid := false;
    Msg := 'Inscrição de Produtor Rural inválida.';
  end;
end;

procedure TFCadastroCad.btnTirarFotoClick(Sender: TObject);
var
  dirTemp : String;
begin
  inherited;
  dirTemp := 'tempUsuario.bmp';
  if FCapturaFoto = nil then
    FCapturaFoto := TFCapturaFoto.Create(Application);
  FCapturaFoto.tsCapWebCam.Connected := True;
  FCapturaFoto.ShowModal;

  if FCapturaFoto.ModalResult = mrOk then
  begin
    with FCapturaFoto do
    begin
      tsCapWebCam.SaveAsBMP := dirTemp;
      incluiImagem(dirTemp, 'FOTO');
      FCapturaFoto.tsCapWebCam.Connected := False;
    end;
  end
  else
    FCapturaFoto.tsCapWebCam.Connected := False;
end;

procedure TFCadastroCad.DBPanel95DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFCadastroCad.DBPVendedorCodigoChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit]) then
    begin
    if DMParamSistema.QParamSistemaIND_SENHA_ALTERA_VENDEDOR.Value = 'SIM' then
    begin
      if FSenha = nil then
        FSenha := TFSenha.Create(Application);
      if FSenha.ShowModal = MrOk then
      begin
        if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
          raise Exception.Create('Senha Incorreta.');
      end
      else
        Abort;
    end;
  end;
end;

procedure TFCadastroCad.DBRadioGroup5Click(Sender: TObject);
begin
  inherited;
  DMUsuario.QUsuario.Open;  //adicionado permissão para usuário cadastrado como supervisor liberar venda com titulo em atraso (Eletronica Borges) - Alex 07/04/2021
  if (DMUsuario.QUsuarioIND_PRIVILEGIO.Text <> 'P') {and ( (DMParamSistema.CodEmpresa = 'BORGES') or (DMParamSistema.CodEmpresa = 'FERRAGMED') )}  //Adicionado ferragem Medianeira. Alex 28/10/2023
      and ( (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value <> 'SUPERVISOR') and (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value <> 'DIRETOR') ) then
    raise Exception.Create('Somente usuários privilegiados podem realizar esta alteração.');
end;

procedure TFCadastroCad.DBRadioGroup7Click(Sender: TObject);
begin
  inherited;
  DMUsuario.QUsuario.Open;
  if DMUsuario.QUsuarioIND_PRIVILEGIO.Text <> 'P' then
    raise Exception.Create('Somente usuários privilegiados podem realizar esta alteração.');
end;

procedure TFCadastroCad.BTValidaCEPClick(Sender: TObject);
begin
  with DMCadastro do
    Bib.ValidaCEP(QCadastroDESC_CEP.Value, TObject(QCadastroDESC_ENDERECO), TObject(QCadastroDESC_BAIRRO),
      TObject(QCadastroDESC_COMPLEMENTO), TObject(QCadastroCOD_ESTADO), TObject(QCadastroCOD_CIDADE),  LBCEPValido);
  DBPCidadeCodigoExit(Self);
end;

procedure TFCadastroCad.BTValidaCEPExit(Sender: TObject);
begin
  inherited;
  LBCEPValido.Visible := false;
end;

procedure TFCadastroCad.DBPCepValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: String);
var
  mensagemErro, ibge: String;
begin
  inherited;
  isValid := True;
  if DBPCep.Required then
  begin
    if not Bib.ValidaCEP(DMCadastro.QCadastroDESC_CEP.Value, DMCadastro.QCadastroCOD_CIDADE.Value, mensagemErro) then
    begin
      isValid := false;
      Msg := 'CEP inválido. ' + mensagemErro +  ' Insira um CEP válido para continuar.';
    end;
  end;
end;

procedure TFCadastroCad.DBPanel97DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

procedure TFCadastroCad.MeDocumentoSefazClick(Sender: TObject);
begin
  inherited;
  MeDocumentoSefaz.SelectAll;
end;

procedure TFCadastroCad.EmissodeEtiquetasAssinatura1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[27].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
  with DMCadastro_Rel do
  begin
    QREtiquetaAssinantes.Close;
    if Trim(FCadastroParam.FmCidade27.MeCidade.Text) <> '' then
      QREtiquetaAssinantes.SetVariable('COD_CIDADE',Trim(FCadastroParam.FmCidade27.MeCidade.Text))
    else
      QREtiquetaAssinantes.SetVariable('COD_CIDADE',null);

    if Trim(FCadastroParam.MeBairroEtiqueta27.Text) = '' then
        QREtiquetaAssinantes.SetVariable('DESC_BAIRRO', Null)//add filtro bairro. Kaua 21/07/2021. Solic. Junior
    else
        QREtiquetaAssinantes.SetVariable('DESC_BAIRRO', Trim(FCadastroParam.MeBairroEtiqueta27.Text));
    if Trim(FCadastroParam.MEData27.Text) <> '' then
        QREtiquetaAssinantes.SetVariable('DATA_I', StrToDate(FCadastroParam.MEData27.Text)) //add filtro Data Inicial. Kaua 21/07/2021. Solic. Junior
    else
        QREtiquetaAssinantes.SetVariable('DATA_I', Null);
    if Trim(FCadastroParam.MEDataF27.Text) <> '' then
        QREtiquetaAssinantes.SetVariable('DATA_F', StrToDate(FCadastroParam.MEDataF27.Text)) //add filtro Data Final. Kaua 21/07/2021. Solic. Junior
    else
        QREtiquetaAssinantes.SetVariable('DATA_F', Null);
    if Trim(FCadastroParam.FmRegiao27.MeRegiao.Text) = '' then
        QREtiquetaAssinantes.SetVariable('REGIAO', Null)  //add filtro Regiao. Kaua 21/07/2021. Solic. Junior
    else
        QREtiquetaAssinantes.SetVariable('REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao27.MeRegiao.Text)));
    if Trim(FCadastroParam.FmEntregador.MeVendedor.Text) = '' then
        QREtiquetaAssinantes.SetVariable('COD_ENTREGADOR', Null)
    else
        QREtiquetaAssinantes.SetVariable('COD_ENTREGADOR', StrToInt(Trim(FCadastroParam.FmEntregador.MeVendedor.Text)));
    QREtiquetaAssinantes.open;
    if FREtiquetasAssinantes = nil then
      FREtiquetasAssinantes := TFREtiquetasAssinantes.Create(Application);
    if FCadastroParam.RGPreview.ItemIndex = 0 then
      FREtiquetasAssinantes.QRPrimario.Preview
    else
      FREtiquetasAssinantes.QRPrimario.Print;
  end;
end;

procedure TFCadastroCad.CadastroClientesSemCompras1Click(Sender: TObject);
begin
  inherited;
  if FCadastroParam = nil then
    FCadastroParam := TFCadastroParam.Create(Application);
  FCadastroParam.PGRelatorio.Pages[28].TabVisible := True;
  if FCadastroParam.ShowModal = mrOk then
    with DMCadastro do
    begin
      QRCadastroSemVenda.Close;

      //Frames-------------------------
      if Trim(FCadastroParam.FmTipoCadastro8.MeTipoCadastro.Text) = '' then
        QRCadastroSemVenda.SetVariable('TIPO_CADASTRO', Null)
      else
        QRCadastroSemVenda.SetVariable('TIPO_CADASTRO', StrToInt(Trim(FCadastroParam.FmTipoCadastro8.MeTipoCadastro.Text)));

      if Trim(FCadastroParam.FmRegiao3.MeRegiao.Text) = '' then
        QRCadastroSemVenda.SetVariable('COD_REGIAO', Null)
      else
        QRCadastroSemVenda.SetVariable('COD_REGIAO', StrToInt(Trim(FCadastroParam.FmRegiao3.MeRegiao.Text)));

      if Trim(FCadastroParam.FmRamo8.MeRamo.Text) = '' then
        QRCadastroSemVenda.SetVariable('COD_RAMO', Null)
      else
        QRCadastroSemVenda.SetVariable('COD_RAMO', StrToInt(Trim(FCadastroParam.FmRamo8.MeRamo.Text)));

      if Trim(FCadastroParam.FmEstado8.MeEstado.Text) = '' then
        QRCadastroSemVenda.SetVariable('COD_ESTADO', Null)
      else
        QRCadastroSemVenda.SetVariable('COD_ESTADO', Trim(FCadastroParam.FmEstado8.MeEstado.Text));

      if Trim(FCadastroParam.FmClassificacao2.MeClassificacao.Text) = '' then
        QRCadastroSemVenda.SetVariable('COD_CLASS_CADASTRO', Null)
      else
        QRCadastroSemVenda.SetVariable('COD_CLASS_CADASTRO', StrToInt(Trim(FCadastroParam.FmClassificacao2.MeClassificacao.Text)));

      if Trim(FCadastroParam.FmVendedor3.MeVendedor.Text) = '' then
        QRCadastroSemVenda.SetVariable('COD_VENDEDOR', Null)
      else
        QRCadastroSemVenda.SetVariable('COD_VENDEDOR', StrToInt(Trim(FCadastroParam.FmVendedor3.MeVendedor.Text)));
      //---------------------------------

      case FCadastroParam.CB13Ordem.ItemIndex of
        0: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.NOME');
        1: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_TIPO_CADASTRO');
        2: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_REGIAO');
        3: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_RAMO');
        4: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_ESTADO');
        5: QRCadastroSemVenda.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
      QRCadastroSemVenda.SetVariable('DT_VENDA', StrToDate(FCadastroParam.Me13DtReferencia.Text));

      QRCadastroSemVenda.Open;
      if FrCadastroSemVendas = nil then
        FrCadastroSemVendas := TFrCadastroSemVendas.Create(Application);

      if Trim(FCadastroParam.FmVendedor3.MeVendedor.Text) <> '' then
        FrCadastroSemVendas.QRLTitulo.Caption := ' Relatório de Cadastro Sem Venda'
      else
        FrCadastroSemVendas.QRLTitulo.Caption := ' Relatório de Cadastro Sem Venda';

      if FCadastroParam.RGPreview.ItemIndex = 0 then
        FrCadastroSemVendas.QRPrimario.Preview
      else
        FrCadastroSemVendas.QRPrimario.Print;

      QRCadastroSemVenda.Close;
      QRCadastroSemVenda.SQL[QRCadastroSemVenda.SQL.Count - 1] := '';
    end;
end;

procedure TFCadastroCad.Button1Click(Sender: TObject);
begin
  inherited;
  with DMCadastro do
    Bib.ValidaCEP(QCadastroDESC_CEP.Value, TObject(QCadastroDESC_ENDERECO), TObject(QCadastroDESC_BAIRRO),
      TObject(QCadastroDESC_COMPLEMENTO), TObject(QCadastroCOD_ESTADO), TObject(QCadastroCOD_CIDADE),  LBCEPValido2);
  DBPCidadeCodigoExit(Self);
end;

procedure TFCadastroCad.Button1Exit(Sender: TObject);
begin
  inherited;
  LBCEPValido2.Visible := false;
end;

procedure TFCadastroCad.TsMaisEnderecosShow(Sender: TObject);
begin
  inherited;
  if DMCadastro.QCadastro.State <> dsEdit then
    DBNavigator2.Enabled := false;
end;

procedure TFCadastroCad.DBEIncricaoEstadualExit(Sender: TObject);
begin
  inherited;                      
  DBEIncricaoEstadualChange(Sender);
end;

procedure TFCadastroCad.PreencheCbPerfilTributario;
begin
  CBPerfilTributario.Items.BeginUpdate;
  CBPerfilTributario.Items.Add('');
  PreencherComboPerfisReforma(CBPerfilTributario);
  CBPerfilTributario.Items.EndUpdate;
end;

procedure TFCadastroCad.AjustarPerfilTributario;
begin
  // Reforma Tributária
  if DBRadioGroup2.ItemIndex = 0 then
  begin
    CBPerfilTributario.ItemIndex := 6
  end
  else
  begin
    if (DSPrimario.State in [dsEdit, dsInsert]) then
    begin
      if (DBRGRegimeTributario.ItemIndex in [0,1]) then
        CBPerfilTributario.ItemIndex := 2
      else if (DBRGRegimeTributario.ItemIndex in [2])  then
        CBPerfilTributario.ItemIndex := 1;
    end;
  end;
end;

procedure TFCadastroCad.DBRGRegimeTributarioChange(Sender: TObject);
begin
  inherited;
  AjustarPerfilTributario;
end;

end.
