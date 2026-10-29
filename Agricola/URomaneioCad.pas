unit URomaneioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,IdAuthenticationDigest,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, IdAuthentication,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, variants, ActnList, QRPDFfilt,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBTables,
  UFmDepartamento, DBPanel, OracleNavigator, Math, OleServer, IdSSLOpenSSL,
  WTReadWeight_TLB, LePortaCom, tscap32_rt, JPEG,IdCoderMIME, IdHashMessageDigest, IdGlobal;

type
  TLeBalanca = class
  public
    function Leitura(var Param: String): Integer; virtual; abstract;
    function IsError: Boolean; virtual;
  end;

  TLeBalancaEPM = class(TLeBalanca)
  private
    FUltResult: Integer;
  protected
    FComando: String;
  public
    function Leitura(var Param: String): Integer; override;
    function IsError: Boolean; override;
  end;

  TLeBalancaWT3000 = class(TLeBalanca)
  public
    function Leitura(var Param: String): Integer; override;
  end;

  TLeBalancaEPM4000 = class(TLeBalancaEPM)
  public
    function Leitura(var Param: String): Integer; override;
  end;

  TLeBalancaSaturno = class(TLeBalanca)
  public
    function Leitura(var Param: String): Integer; override;
  end;

  TLeBalancaFactory = class
  public
    class function GetLeBalanca(Chave: String): TLeBalanca; 
  end;

  TFRomaneioCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TsBalanca: TTabSheet;
    TsRomaneio: TTabSheet;
    TsRateio: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    DBNavigator1: TDBNavigator;
    BtConsBalanca: TBitBtn;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label31: TLabel;
    DBEdit5: TDBEdit;
    Label32: TLabel;
    DBEdit31: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsFilial: TBitBtn;
    BtConsCadRateio: TBitBtn;
    DBNavigator2: TDBNavigator;
    DBGrid1: TDBGrid;
    RelatorioRomaneios1: TMenuItem;
    RelatrioRomaneiosDescontos1: TMenuItem;
    Opes1: TMenuItem;
    EmissoNotaFiscalRomaneios1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    CadastroProduto1: TMenuItem;
    DemonstrativoSaldoaFixar1: TMenuItem;
    EmissodeRomaneios1: TMenuItem;
    RelatrioSaldoaFixarSinttico1: TMenuItem;
    Label27: TLabel;
    DBEdit37: TDBEdit;
    Label35: TLabel;
    MePesoBalanca: TMaskEdit;
    DBRadioGroup2: TDBRadioGroup;
    RomaneiosnoPerodo1: TMenuItem;
    SbRomaneioPesagem: TSpeedButton;
    RgTipoRomaneio: TDBRadioGroup;
    Romaneiopessagem1: TMenuItem;
    SBPesoChegada: TSpeedButton;
    SBPesoSaida: TSpeedButton;
    LblPorta: TLabel;
    LblEndereco: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit40: TDBEdit;
    Label18: TLabel;
    DBEdit34: TDBEdit;
    Label20: TLabel;
    DBEdit35: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GbDescontos: TGroupBox;
    GroupBox2: TGroupBox;
    Label44: TLabel;
    DBEdit47: TDBEdit;
    GroupBox3: TGroupBox;
    DBEdit43: TDBEdit;
    Label40: TLabel;
    GroupBox4: TGroupBox;
    DBEdit42: TDBEdit;
    Label39: TLabel;
    GroupBox5: TGroupBox;
    Label38: TLabel;
    DBEdit41: TDBEdit;
    GroupBox6: TGroupBox;
    DBEdit45: TDBEdit;
    GroupBox7: TGroupBox;
    DBEdit46: TDBEdit;
    GroupBox8: TGroupBox;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    DBEdit36: TDBEdit;
    Label24: TLabel;
    GroupBox9: TGroupBox;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    Label42: TLabel;
    DBEdit51: TDBEdit;
    GroupBox10: TGroupBox;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label43: TLabel;
    DBEdit52: TDBEdit;
    GroupBox11: TGroupBox;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    Label48: TLabel;
    DBEdit53: TDBEdit;
    CancelarRomaneio1: TMenuItem;
    DescontaTaxaArmazenagem1: TMenuItem;
    Label49: TLabel;
    DBEdit54: TDBEdit;
    BtConsfil: TBitBtn;
    Label51: TLabel;
    DBEdit55: TDBEdit;
    Label52: TLabel;
    DBEdit56: TDBEdit;
    BtConsParceiro: TBitBtn;
    Label53: TLabel;
    DBEdit57: TDBEdit;
    SpeedButton4: TSpeedButton;
    Label54: TLabel;
    DBEdit58: TDBEdit;
    Label55: TLabel;
    DBEdit59: TDBEdit;
    CancelaRomaneioComNotaEmitida1: TMenuItem;
    RelRomaneioEntregaAcumulada1: TMenuItem;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBEdit18: TDBEdit;
    SpeedButton5: TSpeedButton;
    GroupBox12: TGroupBox;
    DBEdit20: TDBEdit;
    Label56: TLabel;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    Label57: TLabel;
    TsFitas: TTabSheet;
    Label58: TLabel;
    DBEdit39: TDBEdit;
    Label59: TLabel;
    DBEdit60: TDBEdit;
    Label60: TLabel;
    DBEdit61: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBDirceu7: TDBDirceu;
    DBGrid2: TDBGrid;
    RelFitas1: TMenuItem;
    MarcarComplementoPeso1: TMenuItem;
    DBComboBox1: TDBComboBox;
    Label61: TLabel;
    DBDirceu8: TDBDirceu;
    Label62: TLabel;
    DBEdit62: TDBEdit;
    Label63: TLabel;
    DBEdit63: TDBEdit;
    Label64: TLabel;
    DBEdit64: TDBEdit;
    BtConsTransportador: TBitBtn;
    Label65: TLabel;
    DBEdit65: TDBEdit;
    TsPesagemEntrada: TTabSheet;
    TsPesagemSaida: TTabSheet;
    TsDiversos: TTabSheet;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    MePesoBalanca_Diversos: TMaskEdit;
    DBEdit84: TDBEdit;
    BitBtn7: TBitBtn;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    DBDirceu13: TDBDirceu;
    DBEdit98: TDBEdit;
    Label76: TLabel;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    BitBtn8: TBitBtn;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label103: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    DBEdit90: TDBEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBEdit100: TDBEdit;
    BitBtn12: TBitBtn;
    GroupBox13: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    DBEdit102: TDBEdit;
    GroupBox14: TGroupBox;
    Label110: TLabel;
    DBEdit104: TDBEdit;
    GroupBox15: TGroupBox;
    Label112: TLabel;
    DBEdit106: TDBEdit;
    GroupBox16: TGroupBox;
    Label114: TLabel;
    DBEdit108: TDBEdit;
    DBEdit110: TDBEdit;
    DBEdit113: TDBEdit;
    DBDirceu14: TDBDirceu;
    DBDirceu15: TDBDirceu;
    DBDirceu16: TDBDirceu;
    DBDirceu17: TDBDirceu;
    DBEdit114: TDBEdit;
    GroupBox17: TGroupBox;
    Label96: TLabel;
    DBEdit92: TDBEdit;
    GroupBox18: TGroupBox;
    Label97: TLabel;
    DBEdit93: TDBEdit;
    GroupBox19: TGroupBox;
    Label98: TLabel;
    DBEdit94: TDBEdit;
    MePesoBalanca_Saida: TMaskEdit;
    Label94: TLabel;
    DBEdit91: TDBEdit;
    Label95: TLabel;
    DBEdit95: TDBEdit;
    Label41: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label99: TLabel;
    Label102: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    DBEdit44: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit99: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit112: TDBEdit;
    DBEdit115: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit117: TDBEdit;
    DBEdit118: TDBEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBEdit119: TDBEdit;
    BitBtn16: TBitBtn;
    DBEdit128: TDBEdit;
    DBEdit129: TDBEdit;
    DBDirceu18: TDBDirceu;
    DBDirceu19: TDBDirceu;
    DBDirceu20: TDBDirceu;
    DBDirceu21: TDBDirceu;
    DBEdit130: TDBEdit;
    MePesoBalancaEntrada: TMaskEdit;
    Label136: TLabel;
    DBEdit134: TDBEdit;
    Label137: TLabel;
    DBEdit135: TDBEdit;
    GroupBox27: TGroupBox;
    DBEdit28: TDBEdit;
    Label28: TLabel;
    GroupBox28: TGroupBox;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    GroupBox29: TGroupBox;
    DBEdit30: TDBEdit;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    Label30: TLabel;
    DBEdit136: TDBEdit;
    MeDesconto: TMaskEdit;
    Label138: TLabel;
    MeLiquido: TMaskEdit;
    Label139: TLabel;
    Label140: TLabel;
    DBEdit137: TDBEdit;
    BtContratoVenda: TBitBtn;
    Label141: TLabel;
    DBEdit138: TDBEdit;
    MeDescontoPadrao: TMaskEdit;
    MeDescontoPadraoProduto: TMaskEdit;
    MeDesconto_Saida: TMaskEdit;
    Label142: TLabel;
    MeLiquido_Saida: TMaskEdit;
    Label143: TLabel;
    Label144: TLabel;
    MeToleraUmidade: TMaskEdit;
    MeDescontoUmidade: TMaskEdit;
    Label111: TLabel;
    Label147: TLabel;
    MeToleraImpureza: TMaskEdit;
    MeDescontoImpureza: TMaskEdit;
    Label113: TLabel;
    Label148: TLabel;
    MeToleraArdidos: TMaskEdit;
    MeDescontoArdidos: TMaskEdit;
    Label115: TLabel;
    Label149: TLabel;
    MeToleraAvariados: TMaskEdit;
    MeDescontoAvariados: TMaskEdit;
    Label145: TLabel;
    Label150: TLabel;
    MeToleraQuebrado: TMaskEdit;
    MeDescontoQuebrados: TMaskEdit;
    Label146: TLabel;
    Label151: TLabel;
    MeToleraTriguilho: TMaskEdit;
    MeDescontoTriguilho: TMaskEdit;
    Label152: TLabel;
    GroupBox20: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    DBEdit103: TDBEdit;
    MeToleraUmidade_E: TMaskEdit;
    MeDescontoUmidade_E: TMaskEdit;
    GroupBox21: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    DBEdit105: TDBEdit;
    MeToleraImpureza_E: TMaskEdit;
    MeDescontoImpureza_E: TMaskEdit;
    GroupBox22: TGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    DBEdit107: TDBEdit;
    MeToleraArdidos_E: TMaskEdit;
    MeDescontoArdidos_E: TMaskEdit;
    GroupBox23: TGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    Label153: TLabel;
    DBEdit109: TDBEdit;
    MeToleraAvariados_E: TMaskEdit;
    MeDescontoAvariados_E: TMaskEdit;
    GroupBox24: TGroupBox;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    DBEdit120: TDBEdit;
    MeToleraQuebrados_E: TMaskEdit;
    MeDescontoQuebrados_E: TMaskEdit;
    GroupBox25: TGroupBox;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    DBEdit121: TDBEdit;
    MeToleraTriguilho_E: TMaskEdit;
    MeDescontoTriguilho_E: TMaskEdit;
    GroupBox26: TGroupBox;
    Label160: TLabel;
    DBEdit122: TDBEdit;
    MeDescontoPadrao_E: TMaskEdit;
    MeDescontoPadraoProduto_E: TMaskEdit;
    Label161: TLabel;
    Label162: TLabel;
    DBEdit123: TDBEdit;
    BtContratoCompra: TBitBtn;
    Label163: TLabel;
    DBEdit124: TDBEdit;
    MeDesconto_Entrada: TMaskEdit;
    Label164: TLabel;
    MeLiquido_Entrada: TMaskEdit;
    Label165: TLabel;
    RelatriodePesagensdeSada1: TMenuItem;
    RelatriodePesagensdeEntrada1: TMenuItem;
    Label166: TLabel;
    DBEdit125: TDBEdit;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BtRomaneio: TBitBtn;
    GroupBox30: TGroupBox;
    Label167: TLabel;
    Label168: TLabel;
    DBEdit126: TDBEdit;
    DBEdit127: TDBEdit;
    GroupBox31: TGroupBox;
    Label169: TLabel;
    Label170: TLabel;
    MEQtLiquida: TMaskEdit;
    MePerc: TMaskEdit;
    DBRetirada: TDBRadioGroup;
    Label33: TLabel;
    DBEdit32: TDBEdit;
    RelBalana1: TMenuItem;
    Label34: TLabel;
    DBEdit33: TDBEdit;
    Label50: TLabel;
    DBEdit131: TDBEdit;
    Label171: TLabel;
    DBEdit132: TDBEdit;
    DBEdit133: TDBEdit;
    Label172: TLabel;
    RelSaldoaFixarSintticoPFilial1: TMenuItem;
    RelDescontosRomaneiossEstornos1: TMenuItem;
    GbDadosNota: TGroupBox;
    Label173: TLabel;
    DBEdit139: TDBEdit;
    Label174: TLabel;
    DBEdit140: TDBEdit;
    Label175: TLabel;
    DBEdit141: TDBEdit;
    BtOperacao: TBitBtn;
    DBDirceu9: TDBDirceu;
    RgPagto: TDBRadioGroup;
    BtEmiteNota: TBitBtn;
    Label176: TLabel;
    DBEdit142: TDBEdit;
    GroupBox32: TGroupBox;
    DBEdit144: TDBEdit;
    GPArroz: TGroupBox;
    Label177: TLabel;
    DBEdit145: TDBEdit;
    DBEdit146: TDBEdit;
    Label178: TLabel;
    DBEdit143: TDBEdit;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    DBEdit147: TDBEdit;
    Label182: TLabel;
    DBEdit148: TDBEdit;
    GroupBox1: TGroupBox;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    DBEdit149: TDBEdit;
    DBEdit150: TDBEdit;
    DBEdit151: TDBEdit;
    GroupBox33: TGroupBox;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    DBEdit152: TDBEdit;
    DBEdit153: TDBEdit;
    DBEdit154: TDBEdit;
    TsTofeco: TTabSheet;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label203: TLabel;
    Label205: TLabel;
    Label208: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    DBEdit155: TDBEdit;
    DBEdit156: TDBEdit;
    DBEdit157: TDBEdit;
    DBEdit158: TDBEdit;
    DBEdit159: TDBEdit;
    DBEdit160: TDBEdit;
    DBEdit161: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit163: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit165: TDBEdit;
    DBEdit166: TDBEdit;
    DBEdit167: TDBEdit;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    MePesoBalanca1: TMaskEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit170: TDBEdit;
    GroupBox35: TGroupBox;
    Label218: TLabel;
    Label219: TLabel;
    DBEdit173: TDBEdit;
    DBEdit174: TDBEdit;
    DBEdit181: TDBEdit;
    DBDirceu22: TDBDirceu;
    DBDirceu23: TDBDirceu;
    DBDirceu24: TDBDirceu;
    DBEdit183: TDBEdit;
    DBEdit187: TDBEdit;
    DBEdit188: TDBEdit;
    MeDesconto1: TMaskEdit;
    MeLiquido1: TMaskEdit;
    BitBtn24: TBitBtn;
    Label202: TLabel;
    DBEdit168: TDBEdit;
    Label204: TLabel;
    DBEdit169: TDBEdit;
    Label206: TLabel;
    DBEdit171: TDBEdit;
    BtFreteiro: TBitBtn;
    DBDirceu25: TDBDirceu;
    Label207: TLabel;
    DBEdit172: TDBEdit;
    Label209: TLabel;
    DBEdit175: TDBEdit;
    Label215: TLabel;
    DBEdit176: TDBEdit;
    BtArranquio: TBitBtn;
    DBDirceu26: TDBDirceu;
    Label216: TLabel;
    DBEdit177: TDBEdit;
    Label217: TLabel;
    DBEdit178: TDBEdit;
    DBEdit179: TDBEdit;
    Label220: TLabel;
    RomaneioporFreteiro1: TMenuItem;
    RomaneioporArranquio1: TMenuItem;
    Label221: TLabel;
    DBEdit180: TDBEdit;
    BtObraCons: TBitBtn;
    Label222: TLabel;
    DBEdit182: TDBEdit;
    Label223: TLabel;
    DBEdit184: TDBEdit;
    BtTransportador: TBitBtn;
    DBDirceu27: TDBDirceu;
    DBEdit38: TDBEdit;
    BtConsMensagem: TBitBtn;
    RomaneioporPlacas1: TMenuItem;
    Fm6Departamento: TFmDepartamento;
    TsImposto: TTabSheet;
    DSImposto: TDataSource;
    OracleNavigator1: TOracleNavigator;
    DBGrid3: TDBGrid;
    DBPImposto: TDBPanel;
    Label224: TLabel;
    DBDirceu28: TDBDirceu;
    SBPesagemRenda: TSpeedButton;
    Label225: TLabel;
    DBEdit185: TDBEdit;
    OracleNavigator2: TOracleNavigator;
    tmBalanca: TTimer;
    ImgPesagemEntrada: TImage;
    ImgPesagemSaida: TImage;
    BtnImgPesagemEntrada: TBitBtn;
    BtnImgPesagemSaida: TBitBtn;
    ImgPesagemEntrada2: TImage;
    ImgPesagemSaida2: TImage;
    MeDescontoManualUmidade: TMaskEdit;
    Label226: TLabel;
    Label227: TLabel;
    MeDescontoManualImpureza: TMaskEdit;
    Label228: TLabel;
    MeDescontoManualArdido: TMaskEdit;
    Label229: TLabel;
    MeDescontoManualAvariado: TMaskEdit;
    Label230: TLabel;
    DBEdit186: TDBEdit;
    Label231: TLabel;
    DBEdit189: TDBEdit;
    Label232: TLabel;
    DBEdit190: TDBEdit;
    BtEncerra: TBitBtn;
    DBEKmDistancia: TDBEdit;
    DBEKmTarifa: TDBEdit;
    LblKmDistancia: TLabel;
    LblKmTarifa: TLabel;
    LblKmDistancia2: TLabel;
    LblKmTarifa2: TLabel;
    LblTotalTarifa: TLabel;
    DBEKmDistancia2: TDBEdit;
    DBEKmTarifa2: TDBEdit;
    DBETotalTarifa: TDBEdit;
    procedure BtConsBalancaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadRateioClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatorioRomaneios1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure RelatrioRomaneiosDescontos1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure EmissoNotaFiscalRomaneios1Click(Sender: TObject);
    procedure CadastroProduto1Click(Sender: TObject);
    procedure DemonstrativoSaldoaFixar1Click(Sender: TObject);
    procedure EmissodeRomaneios1Click(Sender: TObject);
    procedure RelatrioSaldoaFixarSinttico1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure RomaneiosnoPerodo1Click(Sender: TObject);
    procedure SbRomaneioPesagemClick(Sender: TObject);
    procedure Romaneiopessagem1Click(Sender: TObject);
    procedure SBPesoChegadaClick(Sender: TObject);
    procedure SBPesoSaidaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit35Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure CancelarRomaneio1Click(Sender: TObject);
    procedure DescontaTaxaArmazenagem1Click(Sender: TObject);
    procedure BtConsfilClick(Sender: TObject);
    procedure RgTipoRomaneioChange(Sender: TObject);
    procedure MEQtLiquidaExit(Sender: TObject);
    procedure BtConsParceiroClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CancelaRomaneioComNotaEmitida1Click(Sender: TObject);
    procedure RelRomaneioEntregaAcumulada1Click(Sender: TObject);
    procedure DBEdit54Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure DBRadioGroup3Click(Sender: TObject);
    procedure RelFitas1Click(Sender: TObject);
    procedure MarcarComplementoPeso1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure TsBalancaEnter(Sender: TObject);
    procedure TsRomaneioEnter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BtContratoVendaClick(Sender: TObject);
    procedure DBEdit138Change(Sender: TObject);
    procedure TsPesagemSaidaEnter(Sender: TObject);
    procedure TsDiversosEnter(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure BtContratoCompraClick(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit124Change(Sender: TObject);
    procedure TsPesagemEntradaEnter(Sender: TObject);
    procedure RelatriodePesagensdeSada1Click(Sender: TObject);
    procedure RelatriodePesagensdeEntrada1Click(Sender: TObject);
    procedure BtPesagem(Sender: TObject);
    procedure BtRomaneioClick(Sender: TObject);
    procedure MePercExit(Sender: TObject);
    procedure TsRateioEnter(Sender: TObject);
    procedure RelBalana1Click(Sender: TObject);
    procedure RelSaldoaFixarSintticoPFilial1Click(Sender: TObject);
    procedure RelDescontosRomaneiossEstornos1Click(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BtEmiteNotaClick(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure BtFreteiroClick(Sender: TObject);
    procedure BtArranquioClick(Sender: TObject);
    procedure TsTofecoEnter(Sender: TObject);
    procedure RomaneioporFreteiro1Click(Sender: TObject);
    procedure RomaneioporArranquio1Click(Sender: TObject);
    procedure BtObraConsClick(Sender: TObject);
    procedure BtTransportadorClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure RomaneioporPlacas1Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure DBPImpostoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBPesagemRendaClick(Sender: TObject);
    function LerPeso: Integer;
    procedure DBEdit184Exit(Sender: TObject);
    procedure BtnImgPesagemEntradaClick(Sender: TObject);
    procedure BtnImgPesagemSaidaClick(Sender: TObject);
    procedure MeDescontoManualUmidadeExit(Sender: TObject);
    procedure MeDescontoManualImpurezaExit(Sender: TObject);
    procedure MeDescontoManualArdidoExit(Sender: TObject);
    procedure MeDescontoManualAvariadoExit(Sender: TObject);
    procedure DBEdit54Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BtEncerraClick(Sender: TObject);
    procedure InsereRecDespesaVeiculo(wCodVeiculo, wCodProduto, wCodRomaneio: Integer; wTotalTarifa : real; wDtDespesa, wDtInicio, wDtFim : TDate);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    function BaixarSnapshotHikvision(const AIP, AUsuario, ASenha: String;
  ACanal: Integer; const AArquivoDestino: String): Boolean;
  private
    { Private declarations }
//    function LeituraDePeso(porta : integer) : double;
    procedure Proc_Imprime_Romaneio;
//    procedure CameraPesagem(tipo: string = 'ENTRADA');
    procedure incluiImagem(caminho: string; tipo: string = 'IMGENTRADA1'); //'FOTO' ou 'ASSINATURA'
    procedure AtualizarImagemPesagemEntrada(tipo: string = 'IMGENTRADA1');
    procedure AtualizarImagemPesagemSaida(tipo:string = 'IMGSAIDA1');
  end;

var
  FRomaneioCad: TFRomaneioCad;

  { DECLARAÇÃO DAS FUNÇÕES DA DLL DE LEITURA DE PESO }
  function LePeso1: double; stdcall; external 'PesoSaturno_v11.dll' name 'LePeso1';
  function LePeso2: double; stdcall; external 'PesoSaturno_v11.dll' name 'LePeso2';
  function LePeso3: double; stdcall; external 'PesoSaturno_v11.dll' name 'LePeso3';
  function LePeso4: double; stdcall; external 'PesoSaturno_v11.dll' name 'LePeso4';
  function AbreCom1: double; stdcall; external 'PesoSaturno_v11.dll' name 'AbreCom1';
  function FechaCom1: double; stdcall; external 'PesoSaturno_v11.dll' name 'FechaCom1';
  function AbreCom2: double; stdcall; external 'PesoSaturno_v11.dll' name 'AbreCom2';
  function FechaCom2: double; stdcall; external 'PesoSaturno_v11.dll' name 'FechaCom2';
  function AbreCom3: double; stdcall; external 'PesoSaturno_v11.dll' name 'AbreCom3';
  function FechaCom3: double; stdcall; external 'PesoSaturno_v11.dll' name 'FechaCom3';
  function AbreCom4: double; stdcall; external 'PesoSaturno_v11.dll' name 'AbreCom4';
  function FechaCom4: double; stdcall; external 'PesoSaturno_v11.dll' name 'FechaCom4';

  Function ConfiguraRs(Porta:String):Integer; StdCall; External 'peso32.dll';
  Function LePeso(Parametro:String):Integer; StdCall; External 'peso32.dll'; 

const
  BALANCA_EPM: String = 'EPM';
  BALANCA_EPM4000: String = 'EPM4000';
  BALANCA_SATURNO: String = 'SATURNO';
  BALANCA_WT3000: String = 'WT3000';

var
  wPorta, wBalanca: String;
  resultado: boolean;
  vIndicador, vPortaCom, vBaudRate, vParidade, vDataBits, vStopBits, vPeso: integer;
  rdBal: TReadWeight;
  

implementation

uses URomaneioAgricola_cl, UBalancaCons, UProduto_cl, UCadastroCons,
  UCadastro_cl, UFilial_cl, UFilialCons, UProdutoCons, URomaneioCons,
  URomaneioParam, URRomaneio_Periodo, UOracle_cl, URRomaneioEmissao,
  URRomaneioDesconto, URRomaneioNotas, URomDemSaldo, URomaneioImpressao,
  URomSaldo_Param, URRomaneioCadastro, URomConsultaFixar, URomDemSaldo2,
  UNotaImpressao, URFixarSintetico, UParamSistema_cl,
  URResumoRomaneio_Periodo, URRomaneios_no_Periodo,
  UrRomaneio_Pesagem, URRomaneioPesagem, UUsuario_cl, UNotaEntrada_cl,
  UMensagemCons, UMensagem_cl, UProdutoAgricola_cl, UBloqueio_Produto_cl,
  UNotaSaida_cl, URomaneioCancela, URRomaneioAcumulado, UOperacao_cl,
  USenha, URFitas, UContratoVenda_Cons, Ucontrato_cl, UPadraoProduto_cl,
  UContrato_PJuridicaCons, UContrato_Pjuridica_cl, URPesagemSaida,
  URPesagemEntrada, URomaneioRel_cl, UrComparativoFechamento, URBalanca,
  URFixarSintetico_Res, URRomaneioDescontos, UFmProduto, UFmCadastro,
  UFmContrato, UOperacaoCons, UContratoVenda_Cad, UContasPagar_cl,
  URRomaneioFreteiro, URRomaneioArranquio, UFmContaCorrente, UFmFinalidade,
  UObraCons, UObra_cl, StrUtils, UBiblioteca, UFmCidade, UPedido_cl,
  UEnviaEmail, UFmBalanca, URRomPesoIndiceRenda, UImpostoCons, UImposto_cl,
  UPesagemRenda, UPagamentosNFe4, URRomaneioEmissaoEspelho, UPesagemAgricola,
  UFCapturaImagemPesagem, UCapturaPesagemEntrada,uRomaneioEspelhoImagem,
  UCapturaImagemCamIP, UDespesaRecup_cl, OracleData;

  // === CryptoAPI para MD5 ===
const
  PROV_RSA_FULL       = 1;
  CALG_MD5            = $00008003;
  HP_HASHVAL          = $0002;
  CRYPT_VERIFYCONTEXT = $F0000000;

type
  HCRYPTPROV = LongWord;
  HCRYPTHASH = LongWord;

function CryptAcquireContext(phProv: Pointer; pszContainer: PChar;
  pszProvider: PChar; dwProvType, dwFlags: DWORD): BOOL; stdcall;
  external 'advapi32.dll' name 'CryptAcquireContextA';
function CryptCreateHash(hProv: HCRYPTPROV; Algid, hKey, dwFlags: DWORD;
  phHash: Pointer): BOOL; stdcall; external 'advapi32.dll';
function CryptHashData(hHash: HCRYPTHASH; pbData: PAnsiChar;
  dwDataLen, dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll';
function CryptGetHashParam(hHash: HCRYPTHASH; dwParam: DWORD;
  pbData: Pointer; pdwDataLen: Pointer; dwFlags: DWORD): BOOL; stdcall;
  external 'advapi32.dll';
function CryptDestroyHash(hHash: HCRYPTHASH): BOOL; stdcall;
  external 'advapi32.dll';
function CryptReleaseContext(hProv: HCRYPTPROV; dwFlags: DWORD): BOOL; stdcall;
  external 'advapi32.dll';

function MD5Hex(const S: AnsiString): String;
var
  hProv: HCRYPTPROV;
  hHash: HCRYPTHASH;
  Hash: array[0..15] of Byte;
  DataLen: DWORD;
  I: Integer;
begin
  Result := '';
  if not CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) then Exit;
  try
    if not CryptCreateHash(hProv, CALG_MD5, 0, 0, @hHash) then Exit;
    try
      if not CryptHashData(hHash, PAnsiChar(S), Length(S), 0) then Exit;
      DataLen := 16;
      if not CryptGetHashParam(hHash, HP_HASHVAL, @Hash, @DataLen, 0) then Exit;
      for I := 0 to 15 do
        Result := Result + IntToHex(Hash[I], 2);
      Result := LowerCase(Result);
    finally
      CryptDestroyHash(hHash);
    end;
  finally
    CryptReleaseContext(hProv, 0);
  end;
end;
// === fim CryptoAPI ===







{$R *.DFM}

procedure TFRomaneioCad.BtConsBalancaClick(Sender: TObject);
begin
  inherited;
  If FBalancaCons = nil then
     FBalancaCons := TFBalancaCons.Create(Application);
  If FBalancaCons.ShowModal = mrOK then
  begin
    With DMRomaneioAgricola do
    begin
      QBalanca.Close;
      QBalanca.SetVariable('PK',QBalancaConsCod_Balanca.Value);
      QBalanca.Open;
      if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S' then
      begin
        AtualizarImagemPesagemEntrada('IMGENTRADA1');
        AtualizarImagemPesagemEntrada('IMGENTRADA2');
        AtualizarImagemPesagemSaida('IMGSAIDA1');
        AtualizarImagemPesagemSaida('IMGSAIDA2');
      end;
    end;
  end;
end;

procedure TFRomaneioCad.FormActivate(Sender: TObject);
begin
  inherited;

  With DmRomaneioAgricola Do
  Begin
    QBalanca.Open;
    QRomaneio.Open;
    QRateio.Open;
    QRomaneio_Fitas.Open;
    QRomaneioImposto.Open;
  end;

  if (DMParamSistema.CodEmpresa <> 'BMG') then
  begin
    DBEdit186.Visible := false;
    Label230.Visible := false;
    DBEdit189.Visible := false;
    Label231.Visible := false;
    DBEdit190.Visible := false;
    Label232.Visible := false;
  end;

  TsTofeco.TabVisible := False;
  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemEntrada.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
  TsImposto.TabVisible := False;
  PageControl1.ActivePage := TsBalanca;
  if (DMParamSistema.CodEmpresa = 'CEREAIS') Then
  Begin
    DbEdit133.Visible := True;
    Label172.Visible := True;
    DbEdit133.TabStop := True;
  end;
  if (DMParamSistema.CodEmpresa = 'ITATIBA') Or (DMParamSistema.CodEmpresa = 'SAMP')    Or
     (DMParamSistema.CodEmpresa = 'SRTERRA') or (DMParamSistema.CodEmpresa = 'BEDIN')   or
     (DMParamSistema.CodEmpresa = 'ALIANCA') then
  Begin
    GbDescontos.Visible := False;
    Label140.Visible := False;
    BtContratoVenda.Visible := False;
    DBEdit137.Visible := False;
    Label162.Visible := False;
    BtContratoCompra.Visible := False;
    DBEdit123.Visible := False;
    GbDadosNota.Visible := True;
    BtEmiteNota.Visible := True;
  End;
  If (DMParamSistema.CodEmpresa = 'STEIN') Then
  begin
    GbDadosNota.Visible := True;
    BtEmiteNota.Visible := True;
  end;
  If DMParamSistema.CodEmpresa = 'TOFECO' Then
  Begin
    GbDescontos.Visible := False;
    Label140.Visible := False;
    BtContratoVenda.Visible := False;
    DBEdit137.Visible := False;
    Label162.Visible := False;
    BtContratoCompra.Visible := False;
    DBEdit123.Visible := False;
    GbDadosNota.Visible := True;
    BtEmiteNota.Visible := True;
    Label64.Visible := False;
    DBEdit64.Visible := False;
    DBEdit125.Visible := False;
    BtConsTransportador.Visible := False;
    Label166.Visible := False;
    Label54.Visible := False;
    DBEdit58.Visible := False;
    DBEdit179.Left := 27;
    Label220.Left := 27;
    Label220.Visible := True;
    DBEdit179.Visible := True;
  End;
  If DMParamSistema.CodEmpresa = 'MOINHO' Then
    GPArroz.Visible := True;
  if DMParamSistema.CodEmpresa = 'RAMBO' Then
  begin
    BtEmiteNota.Visible := True;
    GbDadosNota.Visible := True;
  end;
  if DMParamSistema.CodEmpresa = 'INOVAR' then
  begin
    // Resultado Fitas Transgênico
    DBRadioGroup3.Caption := 'Resultado Intacta';
    DBRadioGroup3.Items[2] := 'Declarada';
    DBRadioGroup3.Values[2] := 'DECLARADA';
  end;
  if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S' then
  begin
    FRomaneioCad.Width := 1110;
 //   BtnImgPesagemEntrada.Visible := True;
 //   BtnImgPesagemSaida.Visible   := True;
    ImgPesagemEntrada.Visible := True;
    ImgPesagemEntrada2.Visible := True;
    ImgPesagemSaida.Visible := True;
    ImgPesagemSaida2.Visible := True;
  end;

  if DMParamSistema.CodEmpresa = 'ROGERIOALV' then
  begin
    MeDescontoManualUmidade.Visible  := True;
    MeDescontoManualImpureza.Visible := True;
    MeDescontoManualArdido.Visible   := True;
    MeDescontoManualAvariado.Visible := True;
    Label226.Visible := True;
    Label227.Visible := True;
    Label228.Visible := True;
    Label229.Visible := True;

    DBEdit36.ReadOnly := False;
    DBEdit51.ReadOnly := False;
    DBEdit52.ReadOnly := False;
    DBEdit53.ReadOnly := False;
    DBEdit15.ReadOnly := False;
    DBEdit17.ReadOnly := False;
    DBEdit16.ReadOnly := False;
    DBEdit21.ReadOnly := False;
  end;

  if (DMParamSistema.CodEmpresa = 'BMG') then
  begin
    DBEdit186.Left := 288;
    Label230.Left := 288;
  end;
  if (DMParamSistema.CodEmpresa = 'ITATIBA') then
  begin
    LblKmDistancia.Visible  := True;
    LblKmDistancia2.Visible := True;
    LblKmTarifa.Visible  := True;
    LblKmTarifa2.Visible   := True;
    LblTotalTarifa.Visible := True;
    DBEKmDistancia.Visible := True;
    DBEKmDistancia2.Visible := True;
    DBEKmTarifa.Visible := True;
    DBEKmTarifa2.Visible := True;
    DBETotalTarifa.Visible := True;
  end;
end;

procedure TFRomaneioCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
{*  If FProdutoCons.ShowModal = mrOK then
   Begin
     DMRomaneioAgricola.QRomaneioCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
     DBEdit7Exit(Self);
   end;
*}
end;

procedure TFRomaneioCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRomaneioCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
//  If FFilialCons.ShowModal = mrOK then
//     DMRomaneioAgricola.QRomaneioCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFRomaneioCad.BtConsCadRateioClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRateioCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRomaneioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRomaneioCons = nil then
     FRomaneioCons := TFRomaneioCons.Create(Application);
  If FRomaneioCons.ShowModal = mrOK then
   with DMRomaneioAgricola do
   begin
     QRomaneio.Close;
     QRomaneio.SetVariable('PK',QRomaneioConsCod_Romaneio_Agricola.Value);
     QRomaneio.Open;
     MePesoBalanca.Text := FloatToStr(QRomaneioQT_PESO_BRUTO.Value
                                       - QRomaneioQT_TARA.Value);
     MePesoBalanca1.Text := FloatToStr(QRomaneioQT_PESO_BRUTO.Value
                                       - QRomaneioQT_TARA.Value);
     TsRomaneio.TabVisible := False;
     TsTofeco.TabVisible := False;
     TsRateio.TabVisible := False;
     TsFitas.TabVisible := False;
     TsPesagemEntrada.TabVisible := False;
     TsPesagemSaida.TabVisible := False;
     TsDiversos.TabVisible := False;

     If (QRomaneioIND_TIPO_ROMANEIO.Value = 'ROMANEIO') Or (QRomaneioIND_TIPO_ROMANEIO.Value = 'ROMANEIO S') Then
      Begin
        If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
           TsTofeco.TabVisible := True
        Else
          Begin
            TsRomaneio.TabVisible := True;
            TsFitas.TabVisible := True;
          End;
        TsRateio.TabVisible := True;
      End;
     If (QRomaneioIND_TIPO_ROMANEIO.Value = 'TRANSF ENT') Or (QRomaneioIND_TIPO_ROMANEIO.Value = 'TRANSF SAI') Then
        TsRomaneio.TabVisible := True;
     If QRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM EN' Then
        TsPesagemEntrada.TabVisible := True;

     If QRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM SA' Then
        TsPesagemSaida.TabVisible := True;

     If QRomaneioIND_TIPO_ROMANEIO.Value = 'PESAGEM PA' Then
        TsDiversos.TabVisible := True;
     TsImposto.TabVisible := (TsRomaneio.TabVisible or TsTofeco.TabVisible);
   end;
//  PageControl1.ActivePage := TsRomaneio;
end;

procedure TFRomaneioCad.RelatorioRomaneios1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[0].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
  with DmRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME0Filial.Text),'AGRICOLA');
    QRRomaneio.Close;
    QRRateio.Close;
    If Trim(FRomaneioParam.ME0CadastroParceiro.Text) = '' then
       QRRomaneio.SetVariable('CADASTRO_PARCEIRO',Null)
    Else
       QRRomaneio.SetVariable('CADASTRO_PARCEIRO',FRomaneioParam.ME0CadastroParceiro.Text);
    If Trim(FRomaneioParam.FmCidade1.MeCidade.Text) = '' then
       QRRomaneio.SetVariable('CIDADE',Null)
    Else
       QRRomaneio.SetVariable('CIDADE',Trim(FRomaneioParam.FmCidade1.MeCidade.Text));
    If Trim(FRomaneioParam.ME0Filial.Text) = '' then
       QRRomaneio.SetVariable('FILIAL',Null)
    Else
       QRRomaneio.SetVariable('FILIAL',FRomaneioParam.ME0Filial.Text);
    If Trim(FRomaneioParam.ME0Produto.Text) = '' then
       QRRomaneio.SetVariable('PRODUTO',Null)
    Else
       QRRomaneio.SetVariable('PRODUTO',FRomaneioParam.ME0Produto.Text);
    If Trim(FRomaneioParam.ME0Armazem.Text) = '' then
       QRRomaneio.SetVariable('ARMAZEM',Null)
    Else
       QRRomaneio.SetVariable('ARMAZEM',FRomaneioParam.Me0Placa.Text);
    If Trim(FRomaneioParam.Me0Placa.Text) = '' then
      QRRomaneio.SetVariable('PLACA',Null)
    Else
      QRRomaneio.SetVariable('PLACA',FRomaneioParam.Me0Placa.Text);
    Case FRomaneioParam.Rg0TipoRomaneio.ItemIndex Of
     0 : QRRomaneio.SetVariable('TIPO_ROMANEIO','ROMANEIO');
     1 : QRRomaneio.SetVariable('TIPO_ROMANEIO','ROMANEIO S');
     2 : QRRomaneio.SetVariable('TIPO_ROMANEIO','PESAGEM EN');
     3 : QRRomaneio.SetVariable('TIPO_ROMANEIO','PESAGEM SA');
     4 : QRRomaneio.SetVariable('TIPO_ROMANEIO','PESAGEM PA');
     5 : QRRomaneio.SetVariable('TIPO_ROMANEIO','TRANSF ENT');
     6 : QRRomaneio.SetVariable('TIPO_ROMANEIO','TRANSF SAI');
    End;
    Case FRomaneioParam.Cb0Situacao.ItemIndex Of
     0 : QRRomaneio.SetVariable('IND_SITUACAO',Null);
     1 : QRRomaneio.SetVariable('IND_SITUACAO','A');
     2 : QRRomaneio.SetVariable('IND_SITUACAO','E');
     3 : QRRomaneio.SetVariable('IND_SITUACAO','N');
     4 : QRRomaneio.SetVariable('IND_SITUACAO','C');
     5 : QRRomaneio.SetVariable('IND_SITUACAO','T'); //T --> todos que nao estao cancelados. T nao esta gravado em nenhum registro
    End;
    
    QRRomaneio.SetVariable('DATAI',StrToDate(FRomaneioParam.ME0DataI.Text));
    QRRomaneio.SetVariable('DATAF',StrToDate(FRomaneioParam.ME0DataF.Text));
    If Trim(FRomaneioParam.ME0Cadastro.Text) = '' then
       QRRomaneio.SetVariable('SUBSTITUICAO','1 = 1')
    Else
       QRRomaneio.SetVariable('SUBSTITUICAO','COD_ROMANEIO_AGRICOLA in (select COD_ROMANEIO_AGRICOLA from tb_rateio_romaneio where cod_cadastro = ' + FRomaneioParam.ME0Cadastro.Text+')');
    Case FRomaneioParam.CB0Ordem.ItemIndex of
      0 : QRRomaneio.SQL.Add('ORDER BY TB_CADASTRO.NOME');
      1 : QRRomaneio.SQL.Add('ORDER BY TB_ROMANEIO_AGRICOLA.DT_EMISSAO');
      2 : QRRomaneio.SQL.Add('ORDER BY TB_ROMANEIO_AGRICOLA.NUM_ROMANEIO');
      3 : QRRomaneio.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      4 : QRRomaneio.SQL.Add('ORDER BY TB_ROMANEIO_AGRICOLA.NUM_TICKET');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
    end; // Case
    QRRomaneio.Open;
    QRRateio.Open;
    If FRRomaneio_Periodo = Nil then
       FRRomaneio_Periodo := TFRRomaneio_Periodo.Create(Application);
    if DMParamSistema.CodEmpresa = 'ESPIGAO' then
    begin
      FRRomaneio_Periodo.QRPrimario.Font.Name := 'Arial';
      FRRomaneio_Periodo.QRPrimario.Font.Size := 9;
    end;
    FRRomaneio_Periodo.QRLDataI.Caption := DateToStr(StrToDate(FRomaneioParam.ME0DataI.Text));
    FRRomaneio_Periodo.QRLDataF.Caption := DateToStr(StrToDate(FRomaneioParam.ME0DataF.Text));
    FRRomaneio_Periodo.QRLFilial.Caption := 'Filial:'+FRomaneioParam.Ed0Filial.Text + DMOracle.FastSelect('NUM_CGC','TB_FILIAL', 'COD_FILIAL = ' + FRomaneioParam.Me0Filial.Text) + ' Armazem:' + FRomaneioParam.ME0Armazem.Text + ' Cidade:' + FRomaneioParam.FmCidade1.EdCidade.Text + ' Placa:' + FRomaneioParam.Me0Placa.Text;
    If Trim(FRomaneioParam.ME0CadastroParceiro.Text) <> '' then
       FRRomaneio_Periodo.QRLFilial.Caption := FRRomaneio_Periodo.QRLFilial.Caption + ' - Parceiro:' + Trim(FRomaneioParam.ME0CadastroParceiro.Text);
    if FRomaneioParam.RgPreview.ItemIndex = 0 then
       FRRomaneio_Periodo.QRPrimario.Preview
    else
       FRRomaneio_Periodo.QRPrimario.Print;
    QRRomaneio.Close;
    QRRateio.Close;
    QRRomaneio.SQL[QRRomaneio.SQL.Count-1] := '';
  end;
end;

procedure TFRomaneioCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMRomaneioAgricola.QRomaneioCOD_FILIAL.Text),'AGRICOLA');


{  With DMRomaneioAgricola do
  Begin
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                QRomaneioPerc_ardidos.Value,
                                QRomaneioPerc_Umidade.Value,
                                QRomaneioPerc_Impureza.Value,
                                QRomaneioPerc_Avariado.Value,
                                QRomaneioPerc_Quebrados.Value,
                                QRomaneioPerc_Diversos.Value,
                                QRomaneioCod_Romaneio_Agricola.Value,
                                QRomaneioCod_Produto.Value,
                                QRomaneioPerc_Triguilho.Value,
                                QRomaneioPerc_Tolera_Ardidos.Value,
                                QRomaneioPerc_Tolera_Impureza.Value,
                                QRomaneioPerc_Tolera_Avariado.Value,
                                wLiquido, wDesconto);
  End;
  If wDesconto > StrToFloat(MePesoBalanca.Text)  Then
     Raise Exception.Create ('Quantidade Desconto Maior Quantidade Romaneio');
}     
  If DMRomaneioAgricola.QRomaneio.State = dsInsert then
  Begin
    With DMProdutoAgricola do
    Begin
      QProdutoAgricola.Close;
      QProdutoAgricola.setVariable('PK',DmRomaneioAgricola.QRomaneioCod_Produto.Value);
      QProdutoAgricola.Open;
    End;
    inherited;  
    DMRomaneioAgricola.QRomaneio.Edit;
    DMRomaneioAgricola.QRomaneio.Post;
    DMOracle.Dbcemapa.Commit;
  End
  Else
  Begin
    inherited;
    DMOracle.DBCemapa.Commit;
  End;
end;

procedure TFRomaneioCad.RelatrioRomaneiosDescontos1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[0].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
  with DmRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME0Filial.Text),'AGRICOLA');
    QRRomDesconto.Close;
    If Trim(FRomaneioParam.ME0Cadastro.Text) = '' then
       QRRomDesconto.SetVariable('CADASTRO',Null)
    Else
       QRRomDesconto.SetVariable('CADASTRO',FRomaneioParam.ME0Cadastro.Text);
    If Trim(FRomaneioParam.ME0CadastroParceiro.Text) = '' then
       QRRomDesconto.SetVariable('CADASTRO_PARCEIRO',Null)
    Else
       QRRomDesconto.SetVariable('CADASTRO_PARCEIRO',FRomaneioParam.ME0CadastroParceiro.Text);
    If Trim(FRomaneioParam.ME0Filial.Text) = '' then
       QRRomDesconto.SetVariable('FILIAL',Null)
    Else
       QRRomDesconto.SetVariable('FILIAL',FRomaneioParam.ME0Filial.Text);
    If Trim(FRomaneioParam.ME0Produto.Text) = '' then
       QRRomDesconto.SetVariable('PRODUTO',Null)
    Else
       QRRomDesconto.SetVariable('PRODUTO',FRomaneioParam.ME0Produto.Text);
    If Trim(FRomaneioParam.ME0Armazem.Text) = '' then
       QRRomDesconto.SetVariable('ARMAZEM',Null)
    Else
       QRRomDesconto.SetVariable('ARMAZEM',FRomaneioParam.ME0Armazem.Text);

    Case FRomaneioParam.Rg0Pessoa.ItemIndex Of
     0 : QRRomDesconto.SetVariable('IND_FISICA_JURIDICA','F');
     1 : QRRomDesconto.SetVariable('IND_FISICA_JURIDICA','J');
     2 : QRRomDesconto.SetVariable('IND_FISICA_JURIDICA',NULL);
    End;

    Case FRomaneioParam.Rg0TipoRomaneio.ItemIndex Of
     0 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','ROMANEIO');
     1 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','ROMANEIO S');
     2 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','PESAGEM EN');
     3 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','PESAGEM SA');
     4 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','PESAGEM PA');
     5 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','TRANSF ENT');
     6 : QRRomDesconto.SetVariable('TIPO_ROMANEIO','TRANSF SAI');
    End;
    Case FRomaneioParam.Cb0Situacao.ItemIndex Of
     0 : QRRomDesconto.SetVariable('IND_SITUACAO',Null);
     1 : QRRomDesconto.SetVariable('IND_SITUACAO','A');
     2 : QRRomDesconto.SetVariable('IND_SITUACAO','E');
     3 : QRRomDesconto.SetVariable('IND_SITUACAO','N');
     4 : QRRomDesconto.SetVariable('IND_SITUACAO','C');
     5 : QRRomDesconto.SetVariable('IND_SITUACAO','T');  //T -- > TODOS NAO CANCELADOS, T NAO ESTÁ GRAVADO NOS REGISTROS DO BANCO DE DADOS
    End;
    QRRomDesconto.SetVariable('DATAI',StrToDate(FRomaneioParam.ME0DataI.Text));
    QRRomDesconto.SetVariable('DATAF',StrToDate(FRomaneioParam.ME0DataF.Text));
    QRRomDesconto.SQL[QRRomDesconto.SQL.Count-1] := '';
    Case FRomaneioParam.CB0Ordem.ItemIndex of
      0 : QRRomDesconto.SQL.Add(' ORDER BY TB_CADASTRO.NOME');
      1 : QRRomDesconto.SQL.Add(' ORDER BY TB_ROMANEIO_AGRICOLA.DT_EMISSAO');
      2 : QRRomDesconto.SQL.Add(' ORDER BY TB_ROMANEIO_AGRICOLA.NUM_ROMANEIO');
      3 : QRRomDesconto.SQL.Add(' ORDER BY TB_RATEIO_ROMANEIO.COD_CADASTRO');
      4 : QRRomDesconto.SQL.Add(' ORDER BY TB_ROMANEIO_AGRICOLA.NUM_TICKET');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
    end; // Case
    QRRomDesconto.Open;
    If FRRomaneioDesconto = Nil then
       FRRomaneioDesconto := TFRRomaneioDesconto.Create(Application);
    FRRomaneioDesconto.QrLTitulo.Caption := 'Relatório de Romaneio com Descontos ' +
                                            DateToStr(StrToDate(FRomaneioParam.ME0DataI.Text)) + ' até ' +
                                            DateToStr(StrToDate(FRomaneioParam.ME0DataF.Text));
    FRRomaneioDesconto.QrLFilial.Caption := 'Filial:' + FRomaneioParam.Ed0Filial.Text + DMOracle.FastSelect('NUM_CGC','TB_FILIAL', 'COD_FILIAL = ' + FRomaneioParam.Me0Filial.Text) + '  Armazem:'+FRomaneioParam.ME0Armazem.Text;
    If Trim(FRomaneioParam.ME0CadastroParceiro.Text) <> '' then
       FRRomaneioDesconto.QRLFilial.Caption := FRRomaneioDesconto.QRLFilial.Caption + ' - Parceiro:' + Trim(FRomaneioParam.ME0CadastroParceiro.Text);
    if FRomaneioParam.RgPreview.ItemIndex = 0 then
       FRRomaneioDesconto.QRPrimario.Preview
    else
       FRRomaneioDesconto.QRPrimario.Print;
    QRRomDesconto.Close;
  end;
end;

procedure TFRomaneioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
//  SBImprime.Enabled := ( (DMRomaneioAgricola.QRomaneio.State = dsBrowse)
//                         and (DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Value > 0) );
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BtConsCadastro.Enabled:=True;
      BtConsProduto.Enabled:=True;
      BtConsMensagem.Enabled:=True;
      BtConsParceiro.Enabled:=True;
      BtConsFilial.Enabled:=True;
    end
  else
    begin
      BtConsCadastro.Enabled:=False;
      BtConsProduto.Enabled:=False;
      BtConsMensagem.Enabled:=False;
      BtConsParceiro.Enabled:=False;
      BtConsFilial.Enabled:=False;
    end;
  OracleNavigator2.Enabled := (DSPrimario.State in [DSInsert, DSEdit]);
end;

procedure TFRomaneioCad.EmissoNotaFiscalRomaneios1Click(Sender: TObject);
Var wBloqueio,wOper: String; //serve para trazer o codigo do produto bloqueado
    wDtVencto : TDateTime;
    wVlFrete, wVlArranquio : Real;
    wRateioSemNota :Boolean;
begin
  inherited;
  If FRRomNotaParam = Nil then
    FRRomNotaParam := TFRRomNotaParam.Create(Application);
  FRRomNotaParam.PGRelatorio.Pages[0].TabVisible := True;
  If DMRomaneioAgricola.QRomaneioCod_Filial.Text <> '' Then
   Begin
     FRRomNotaParam.MeFilial.Text := DMRomaneioAgricola.QRomaneioCod_Filial.Text;
     FRRomNotaParam.MeFilialExit(self);
   End;
  If DMRomaneioAgricola.QRomaneioCod_Cadastro.Text <> '' Then
   Begin
     FRRomNotaParam.MeCadastro.Text := DMRomaneioAgricola.QRomaneioCod_Cadastro.Text;
     FRRomNotaParam.MeCadastroExit(Self);
   End;
  If DMRomaneioAgricola.QRomaneioCod_Produto.Text <> '' Then
   Begin
     FRRomNotaParam.MeProduto.Text := DMRomaneioAgricola.QRomaneioCod_Produto.Text;
     FRRomNotaParam.MeProdutoExit(Self);
   End;  
  If FRRomNotaParam.ShowModal = mrOk then
  with DmRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRRomNotaParam.MeFilial.Text),'AGRICOLA');
    DMRomaneioAgricola.pCondicaoPagto := IntToStr(FRRomNotaParam.CBCondicaoPagto.ItemIndex+1);
    //Avisa que rateio não possui nf produtor
    wRateioSemNota := false;
    QRateio.First;
    while not QRateio.Eof do
    begin
      if QRateioNUM_NOTA_PRODUTOR.Value = 0 then
        wRateioSemNota := true;
      QRateio.Next;
    end;
    if wRateioSemNota then
      MessageDlg('Rateio não possui nota fiscal informada por isso nota fiscal não será gerada', mtError,[mbOk],0);

    {if trim(FRRomNotaParam.MeCadastro.Text) <> '' then
      if((DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO','COD_CADASTRO = '+ FRRomNotaParam.MeCadastro.Text) = 'J')
        and
        (DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO','COD_CADASTRO = ' + FRRomNotaParam.MeCadastro.Text) <> 'ISENTO')) then
        //and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TOFECO')) then //FINO não faz nota a fixar. Autorizado pelo César. Junior 24-06-2016
         Raise exception.Create('Cadastro não pode ser pessoa jurídica com inscrição estadual');} //Inovar - Autorizado pelo César 27/02/24 - Junior
         
    QRRomNota.Close;
    If Trim(FRRomNotaParam.MeCadastro.Text) = '' then
       QRRomNota.SetVariable('CADASTRO',Null)
    Else
       QRRomNota.SetVariable('CADASTRO',FRRomNotaParam.MeCadastro.Text);
    If Trim(FRRomNotaParam.MeParceiro.Text) = '' then
       QRRomNota.SetVariable('COD_PARCEIRO','1 = 1')
    Else
       If Trim(FRRomNotaParam.MeParceiro.Text) = '0' then
          QRRomNota.SetVariable('COD_PARCEIRO','Tb_romaneio_agricola.COD_CADASTRO_PARCEIRO is null ')
       Else
          QRRomNota.SetVariable('COD_PARCEIRO','Tb_romaneio_agricola.COD_CADASTRO_PARCEIRO = ' + FRRomNotaParam.MeParceiro.Text);
    If Trim(FRRomNotaParam.MeFilial.Text) = '' then
       QRRomNota.SetVariable('FILIAL',Null)
    Else
       QRRomNota.SetVariable('FILIAL',FRRomNotaParam.MeFilial.Text);
    If Trim(FRRomNotaParam.MeRomaneio.Text) = '' then
       QRRomNota.SetVariable('NUM_ROMANEIO',Null)
    Else
       QRRomNota.SetVariable('NUM_ROMANEIO',FRRomNotaParam.MeRomaneio.Text);
    If Trim(FRRomNotaParam.MeProduto.Text) = '' then
       Raise exception.Create('Atenção! Deve ser Informado o Código do Produto')
    Else
       QRRomNota.SetVariable('PRODUTO',FRRomNotaParam.MeProduto.Text);
    If FRRomNotaParam.RgTipoRomaneio.ItemIndex = 0 Then
       QRRomNota.SetVariable('TIPO_ROMANEIO','ROMANEIO')
    Else
       QRRomNota.SetVariable('TIPO_ROMANEIO','ROMANEIO S');
    QRRomNota.SetVariable('DATAI',StrToDate(FRRomNotaParam.MEDataI.Text));
    QRRomNota.SetVariable('DATAF',StrToDate(FRRomNotaParam.MEDataF.Text));
    QRRomNota.SetVariable('CONSUMO','F');
    Try
      DMOracle.DbCemapa.StartTransaction;
      QRRomNota.Open;
      QrNota.close;
      QrNota.SetVariable('COD_NOTA_CAB',0);
      QRNota.Open;
      DMOperacao.QOperacao.Close;  // para acessar a operacao de a fixar
      DMOperacao.QOperacao.SetVariable('PK',StrToInt(DMOracle.BuscaNome('SELECT COD_OPERACAO_AFIXAR FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FRRomNotaParam.MeProduto.Text)));
      DMOperacao.QOperacao.Open;

      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' Then
       Begin
         ClFreteiro.Close;
         ClFreteiro.Open;
         ClFreteiro.EmptyDataSet;
         ClArranquio.Close;
         ClArranquio.Open;
         ClArranquio.EmptyDataSet;
       End;

      If DMOperacao.QOperacao.RecordCount = 0 then
        Raise Exception.Create('Operacao a fixar nao informada no cadastro de produto agrícola');
      
      // está chamada e para gerar as notas de produtos a fixar
      while not QrRomNota.eof do
      begin
        DMRomaneioAgricola.NotaAgricola;
        QAtzRomaneio.Close;
        QAtzRomaneio.SetVariable('IND_SITUACAO','N');
        QAtzRomaneio.SetVariable('COD_ROMANEIO_AGRICOLA',QrRomNotaCod_Romaneio_Agricola.Text);
        QAtzRomaneio.ExecSQL;
        wDtVencto := QrRomNotaDt_Vencto.Value;
        QrRomNota.Next;
        if (QrRomNotaCod_Cadastro.Value <> QrNotaCod_Cadastro.Value) or
           (QrRomNota.Eof) Then
        begin
          DmRomaneioAgricola.FinalizaNota;
          DMNotaEntrada.QNotaEntrada.Close;
          DMNotaEntrada.QNotaEntrada.SetVariable('PK',QrNotaCod_Nota_Cab.Value);
          DMNotaEntrada.QNotaEntrada.Open;
          DMNotaEntrada.QSomaItemNota.Close;
          DMNotaEntrada.QSomaItemNota.Open;

          PagamentosNFe4.GeraPagamentos('E');

          If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' Then
          Begin
            wVlFrete := 0;

            if ClFreteiro.Locate('Cod_Cadastro', VarArrayOf([DMNotaEntrada.QNotaEntradaCod_Cadastro.Text]),[]) Then
              wVlFrete := ClFreteiroVl_Frete.Value;

            DMContasPagar.GeraContaPagar(DMNotaEntrada.QNotaEntradaCod_Cadastro.Value,StrToInt(Trim(FrRomNotaParam.FmFinalidade.MeFinalidade.Text)), DMNotaEntrada.QNotaEntradaNum_Nota.Value,
              DMNotaEntrada.QNotaEntradaCod_Filial.Value, DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value, DMNotaEntrada.QSomaItemNotaSVal_Total.Value - DMNotaEntrada.QNotaEntradaVal_Funrural.Value - wVlFrete,
              '1',DMNotaEntrada.QNotaEntradaCod_Serie.Value,DMNotaEntrada.QNotaEntradaObs.Value,FrRomNotaParam.FmContaCorrente.MeContaCorrente.Text,
              wDtVencto,DMNotaEntrada.QNotaEntradaDt_Recebimento.Value);
            wVlArranquio := 0;

            // Inclui o título a pagar do arranquio
            if ClArranquio.Locate('Cod_Cadastro', VarArrayOf([DMNotaEntrada.QNotaEntradaCod_Cadastro.Text]), []) then
            begin
              wVlArranquio := ClArranquioVL_ARRANQUIO.Value;
              DMContasPagar.GeraContaPagar(DmRomaneioAgricola.ClArranquioCod_Cadastro.Value,8, 0, StrToInt(Trim(FRRomNotaParam.MeFilial.Text)),
               ClArranquioCod_Nota_Cab.Value, wVlArranquio,
               '1','NF',DmRomaneioAgricola.ClArranquioDesc_Obs.Value,FRRomNotaParam.FmContaCorrente.MeContaCorrente.Text,
               DmRomaneioAgricola.ClArranquioDt_Vencto.Value,DMOracle.DataServ);
            end;

            // Inclui o título a pagar do freteiro
            if wVlFrete > 0 then
            begin
              DMContasPagar.GeraContaPagar(DmRomaneioAgricola.ClFreteiroCod_Cadastro.Value,57, 0, StrToInt(Trim(FRRomNotaParam.MeFilial.Text)),
                 ClFreteiroCod_Nota_Cab.Value, DmRomaneioAgricola.ClFreteiroVl_Frete.Value,
                 '1','NF',DmRomaneioAgricola.ClFreteiroDesc_Obs.Value,FRRomNotaParam.FmContaCorrente.MeContaCorrente.Text,
                 DmRomaneioAgricola.ClFreteiroDt_Vencto.Value,DMOracle.DataServ);
            end;
          End;
          FNotaImpressao.setFlagAgricola(true); //seta variavel para saber que foi chamado pelo agricola - nf-e
          FNotaImpressao.EmiteNf(QrNotaCod_Nota_Cab.Value);  // esta rotina emite nota fiscal

          DMOracle.DbCemapa.Commit;
          DMOracle.DbCemapa.StartTransaction;
        End;
      end;
      
//      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' Then
//       Begin
//          ClFreteiro.first;
//          While Not(ClFreteiro.Eof) Do
//           Begin
//             DMContasPagar.GeraContaPagar(DmRomaneioAgricola.ClFreteiroCod_Cadastro.Value,57, 0, StrToInt(Trim(FRRomNotaParam.MeFilial.Text)),
//                 ClFreteiroCod_Nota_Cab.Value, DmRomaneioAgricola.ClFreteiroVl_Frete.Value,
//                 '1','NF',DmRomaneioAgricola.ClFreteiroDesc_Obs.Value,FRRomNotaParam.FmContaCorrente.MeContaCorrente.Text,
//                 DmRomaneioAgricola.ClFreteiroDt_Vencto.Value,DMOracle.DataServ);
//             ClFreteiro.Next;
//           End;
//          ClFreteiro.Close;
//          ClArranquio.first;
//          While Not(ClArranquio.Eof) Do
//           Begin
//             DMContasPagar.GeraContaPagar(DmRomaneioAgricola.ClArranquioCod_Cadastro.Value,8, 0, StrToInt(Trim(FRRomNotaParam.MeFilial.Text)),
//                 ClArranquioCod_Nota_Cab.Value, DmRomaneioAgricola.ClArranquioVl_Arranquio.Value,
//                 '1','NF',DmRomaneioAgricola.ClArranquioDesc_Obs.Value,FRRomNotaParam.FmContaCorrente.MeContaCorrente.Text,
//                 DmRomaneioAgricola.ClArranquioDt_Vencto.Value,DMOracle.DataServ);
//             ClArranquio.Next;
//           End;
//          ClArranquio.Close;
//       End;

      DMNotaEntrada.QSomaItemNota.Close;
      wOper := DMOracle.BuscaNome('SELECT COD_OPERACAO_AFIXAR_CONSUMO FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FRRomNotaParam.MeProduto.Text);
      If wOper <> '' Then
      Begin
        // está chamada e para gerar as notas de produtos de consumo
        QRRomNota.close;
        QRRomNota.SetVariable('CONSUMO','C');
        QRRomNota.Open;
        DMOperacao.QOperacao.Close;  // para acessar a operacao de consumo
        DMOperacao.QOperacao.SetVariable('PK',StrToInt(wOper));
        DMOperacao.QOperacao.Open;
        QrNota.close;
        QrNota.SetVariable('COD_NOTA_CAB',0);
        QRNota.Open;
        while not QrRomNota.eof do
        begin
          DMRomaneioAgricola.NotaAgricola;
          QAtzRomaneio.Close;
          QAtzRomaneio.SetVariable('IND_SITUACAO','N');
          QAtzRomaneio.SetVariable('COD_ROMANEIO_AGRICOLA',QrRomNotaCod_Romaneio_Agricola.Text);
          QAtzRomaneio.ExecSQL;
          QrRomNota.Next;
          if (QrRomNotaCod_Cadastro.Value <> QrNotaCod_Cadastro.Value) or
             (QrRomNota.Eof) Then
          begin
            DMRomaneioAgricola.FinalizaNota;
            DMNotaEntrada.QNotaEntrada.Close;
            DMNotaEntrada.QNotaEntrada.SetVariable('PK',QrNotaCod_Nota_Cab.Value);
            DMNotaEntrada.QNotaEntrada.Open;
            DMNotaEntrada.QSomaItemNota.Close;
            DMNotaEntrada.QSomaItemNota.Open;
            If DMParamSistema.QParamSistemaPerc_Consumo.Value <> 0 Then
            Begin
              With DMBloqueio_produto do
               Begin
                 QBloqueioProduto_Cad.Close;
                 QBloqueioProduto_Cad.CommitOnPost := Not(QBloqueioProduto_Cad.CommitOnPost);
                 wBloqueio := DMOracle.BuscaNome('SELECT COD_PRODUTO_BLOQUEADO FROM TB_PRODUTO_BLOQUEADO',
                              'COD_CADASTRO=' +DMNotaEntrada.QNotaEntradaCod_Cadastro.Text +
                              ' AND COD_PRODUTO='+DMRomaneioAgricola.QrNotaItemCOD_PRODUTO.Text +
                              ' AND IND_TIPO_PRODUTO='+Chr(39)+'CONSUMO'+CHR(39)+
                              ' AND COD_FILIAL='+DMNotaEntrada.QNotaEntradaCod_Filial.Text);
                 If wBloqueio <> '' Then
                  Begin
                    QBloqueioProduto_Cad.SetVariable('PK',wBloqueio);
                    QBloqueioProduto_Cad.Open;
                    QBloqueioProduto_Cad.Edit;
                  End
                 Else
                  Begin
                    QBloqueioProduto_Cad.Open;
                    QBloqueioProduto_Cad.Insert;
                    QBloqueioProduto_CadCOD_CADASTRO.Value := DMNotaEntrada.QNotaEntradaCod_Cadastro.Value;
                    QBloqueioProduto_CadCOD_FILIAL.Value := DMNotaEntrada.QNotaEntradaCod_Filial.Value;
                    QBloqueioProduto_CadCOD_PRODUTO.Value := Trunc(DMRomaneioAgricola.QrNotaItemCOD_PRODUTO.Value);
                    QBloqueioProduto_CadIND_TIPO_PRODUTO.Value := 'CONSUMO';
                  End;
                 QBloqueioProduto_CadCOD_MOTIVO.Value := 1;
                 QBloqueioProduto_CadCOD_USUARIO.Value :=DMNotaEntrada.QNotaEntradaCod_Usuario.Value;;
  //               QBloqueioProduto_CadDESC_COMPLEMENTO.Value := 'Nf Nr. '+DMNotaEntrada.QNotaEntradaNum_Nota.Text;
                 QBloqueioProduto_CadDT_BLOQUEIO.Value := DMNotaEntrada.QNotaEntradaDt_Emissao.Value;
                 QBloqueioProduto_CadDT_LANCAMENTO.Value := DMNotaEntrada.QNotaEntradaDt_Emissao.Value;
                 QBloqueioProduto_CadQT_QUANTIDADE.Value := Trunc(QBloqueioProduto_CadQT_QUANTIDADE.Value +
                                                            DMRomaneioAgricola.QrNotaItemQt_Quantidade.Value *
                                                            DMParamSistema.QParamSistemaPerc_Consumo.Value / 100);
                 QBloqueioProduto_Cad.Post;
                 QBloqueioProduto_Cad.CommitOnPost := Not(QBloqueioProduto_Cad.CommitOnPost);
                 QBloqueioProduto_Cad.Close;
               End;
            End;
//            if wTipoNota = 'ELETRONICA' then
//              NfeImpressao.GeraXML(QrNotaCod_Nota_Cab.Value)
//            else
//            begin
//              if wTipoNota = 'AMBAS' then
//              begin
//                if FTipoNota = nil then
//                  FTipoNota := TFTipoNota.Create(Application);
//                FTipoNota.ShowModal;
//                if FTipoNota.TipoNota = 'ELETRONICA' then
//                  NfeImpressao.GeraXML(QrNotaCod_Nota_Cab.Value)
//                else
//                  FNotaImpressao.EmiteNF(QrNotaCod_Nota_Cab.Value);
//              end
//              else
//                FNotaImpressao.EmiteNF(QrNotaCod_Nota_Cab.Value);
//            end;
            FNotaImpressao.setFlagAgricola(true); //seta variavel para saber que foi chamado pelo agricola - nf-e
            FNotaImpressao.EmiteNf(QrNotaCod_Nota_Cab.Value);  // esta rotina emite nota fiscal
            DMOracle.DbCemapa.Commit;
            DMOracle.DbCemapa.StartTransaction;
          end;
        end;
      End;
      QRRomNota.close;
      QrNota.Close;
      QRNotaItem.Close;
      DMNotaEntrada.QNotaEntrada.Close;
      DMNotaEntrada.QSomaItemNota.Close;
      If DMOracle.DbCemapa.InTransaction Then
         DMOracle.DBCemapa.Commit;
    Except
      QRRomNota.Close;
      QrNota.Close;
      QRNotaItem.Close;
      DMNotaEntrada.QNotaEntrada.Close;
      DMNotaEntrada.QSomaItemNota.Close;
      DMOracle.DBCemapa.RollBack;
      Raise;
    end;
  end;
end;

procedure TFRomaneioCad.CadastroProduto1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[1].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME1Filial.Text),'AGRICOLA');
    QRCadastro.Close;
    If Trim(FRomaneioParam.ME1Filial.Text) = '' then
      QRCadastro.SetVariable('FILIAL',Null)
    Else
      QRCadastro.SetVariable('FILIAL',FRomaneioParam.ME1Filial.Text);
    If Trim(FRomaneioParam.ME1Cadastro.Text) = '' then
      QRCadastro.SetVariable('CADASTRO',Null)
    Else
      QRCadastro.SetVariable('CADASTRO',FRomaneioParam.ME1Cadastro.Text);
    If Trim(FRomaneioParam.ME1CadastroParceiro.Text) = '' then
      QRCadastro.SetVariable('CADASTRO_PARCEIRO',Null)
    Else
      QRCadastro.SetVariable('CADASTRO_PARCEIRO',Trim(FRomaneioParam.ME1CadastroParceiro.Text));
    If Trim(FRomaneioParam.ME1Produto.Text) = '' then
      QRCadastro.SetVariable('PRODUTO',Null)
    Else
      QRCadastro.SetVariable('PRODUTO',FRomaneioParam.ME1Produto.Text);

    If Trim(FRomaneioParam.ME1Armazem.Text) = '' then
       QRCadastro.SetVariable('ARMAZEM',Null)
    Else
       QRCadastro.SetVariable('ARMAZEM',FRomaneioParam.ME1Armazem.Text);
    Case FRomaneioParam.Rg1TipoRomaneio.ItemIndex Of
     0 : QRCadastro.SetVariable('TIPO_ROMANEIO','ROMANEIO');
     1 : QRCadastro.SetVariable('TIPO_ROMANEIO','ROMANEIO S');
     2 : QRCadastro.SetVariable('TIPO_ROMANEIO','PESAGEM EN');
     3 : QRCadastro.SetVariable('TIPO_ROMANEIO','PESAGEM SA');
     4 : QRCadastro.SetVariable('TIPO_ROMANEIO','PESAGEM PA');
     5 : QRCadastro.SetVariable('TIPO_ROMANEIO','TRANSF ENT');
     6 : QRCadastro.SetVariable('TIPO_ROMANEIO','TRANSF SAI');
    End;

    Case FRomaneioParam.Cb1Situacao.ItemIndex Of
     0 : QRCadastro.SetVariable('IND_SITUACAO',Null);
     1 : QRCadastro.SetVariable('IND_SITUACAO','A');
     2 : QRCadastro.SetVariable('IND_SITUACAO','E');
     3 : QRCadastro.SetVariable('IND_SITUACAO','N');
     4 : QRCadastro.SetVariable('IND_SITUACAO','C');
     5 : QRCadastro.SetVariable('IND_SITUACAO','T');  //T -- > TODOS NAO CANCELADOS, T NAO ESTÁ GRAVADO NOS REGISTROS DO BANCO DE DADOS
    End;

    QRCadastro.SetVariable('DATA_I',StrToDate(FRomaneioParam.ME1DataI.Text));
    QRCadastro.SetVariable('DATA_F',StrToDate(FRomaneioParam.ME1DataF.Text));
    QRCadastro.Open;
    If FRRomaneioCadastro = Nil then
      FRRomaneioCadastro := TFRRomaneioCadastro.Create(Application);
    FRRomaneioCadastro.QRLTitulo.Caption := 'Relação de Romaneios ' +
                                            DateToStr(StrToDate(FRomaneioParam.ME1DataI.Text)) + ' até ' +
                                            DateToStr(StrToDate(FRomaneioParam.ME1DataF.Text));
    FRRomaneioCadastro.QRLFilial.Caption := 'Filial:' + FRomaneioParam.ED1Filial.Text + '  Armazem:'+FRomaneioParam.ME1Armazem.Text;
    if FRomaneioParam.RgPreview.ItemIndex = 0 then
      FRRomaneioCadastro.QRPrimario.Preview
    else
      FRRomaneioCadastro.QRPrimario.Print;
    QRCadastro.Close;
  end;
end;

procedure TFRomaneioCad.DemonstrativoSaldoaFixar1Click(Sender: TObject);
begin
  inherited;
  If FRomSaldo_Param = Nil then
    FRomSaldo_Param := TFRomSaldo_Param.Create(Application);
  FRomSaldo_Param.PGRelatorio.Pages[0].TabVisible := True;
  If FRomSaldo_Param.ShowModal = mrOk then
  with DmRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomSaldo_Param.MeFilial.Text),'AGRICOLA');
    QRelSaldo.Close;
    QRelSaldo2.Close;
    QRelSaldo.Sql.Clear;
    QRelSaldo2.Sql.Clear;
    QRelSaldo.Sql.Add('SELECT SUM(sQuant_Consumo) as sQuant_Consumo,');
    QRelSaldo.Sql.Add('SUM(sQuant_Dev_Consumo) as sQuant_Dev_Consumo,');
    QRelSaldo.Sql.Add('SUM(SQuantidade_Fixado + SQuantidade_Fixado_Dev) as SQuantidade_Fixado,');
    QRelSaldo.Sql.Add('SUM(sQuantidade_Fixar) as sQuantidade_Fixar,');
    QRelSaldo.Sql.Add('SUM(VAL_DESCONTO + VAL_DESCONTO_DEV) as VAL_DESCONTO,');
    QRelSaldo.Sql.Add('SUM(VAL_DESCONTO_SALDO + VAL_DESCONTO_DEV) as VAL_DESCONTO_SALDO,');
    QRelSaldo.Sql.Add('SUM(VAL_TOTAL) as VAL_TOTAL,VAL_UNITARIO,NOME,NUM_CGC_CPF,COD_OPERACAO,NUM_NOTA,');
    // Por Gian, 23/11/2018. A pedido do Marcos
    // Este relatório divide os KG pelo que esta informado no cadastro do produto, no campo Embalagem
    // Mas somente para Grasel, para mostrar no relatório a conversão para sacas, vai sempre dividir por 60,
    // Pra não correr risco de dar problemas em notas
    //RETIRADO PELO CESAR - PARA COLOCAR A CONVERSAO EM FARDOS QUE FOI CRIADO NO CADASTRO DE PRODUTOS 02/08/2019
    //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    //  QRelSaldo.Sql.Add('DT_EMISSAO,DESC_PRODUTO,SUM((sQuantidade_Fixar - (SQuantidade_Fixado + SQuantidade_Fixado_Dev)) / 60) AS NUM_SACAS,COD_PRODUTO,COD_CADASTRO From ( ')
    //else
      QRelSaldo.Sql.Add('DT_EMISSAO,DESC_PRODUTO,SUM((sQuantidade_Fixar - (SQuantidade_Fixado + SQuantidade_Fixado_Dev)) / NUM_CONVERTE_FARDO) AS NUM_SACAS,COD_PRODUTO,COD_CADASTRO From ( ');
    If FRomSaldo_Param.RGTipoFixacao.ItemIndex = 0 Then
     Begin
        QRelSaldo.Sql.Add('Select SUM(decode(TB_OPERACAO.IND_FIXAR_CONSUMO,'+chr(39)+'C'+CHR(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Consumo,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_CONSUMO,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Dev_Consumo,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado_Dev,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',Tb_nota_item.VAL_DESCONTO_RATEIO,decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO)),0)) AS VAL_DESCONTO,');
//        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS VAL_DESCONTO,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',Tb_nota_item.VAL_DESCONTO_RATEIO,decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO)),0)) AS VAL_DESCONTO_SALDO,');
//        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS VAL_DESCONTO_SALDO,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',DECODE(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO_DEV,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS VAL_TOTAL,');
        QRelSaldo.Sql.Add('Tb_nota_item.VAL_UNITARIO,');
     End
    Else
     Begin
        QRelSaldo.Sql.Add('Select 0 AS sQuant_Consumo,0 AS sQuant_Dev_Consumo,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO,');
//        DECODE(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS VAL_DESCONTO,');   ESTAVA ESTE COMANDO NA LINHA ANTERIOR
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO_SALDO,');
        QRelSaldo.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS VAL_TOTAL,');
        QRelSaldo.Sql.Add('Tb_nota_item.VAL_UNITARIO,');
     End;
    QRelSaldo.Sql.Add('Tb_cadastro.NOME, Tb_cadastro.NUM_CGC_CPF, Tb_nota_cab.COD_OPERACAO, Tb_nota_cab.NUM_NOTA, Tb_nota_cab.DT_EMISSAO,Tb_produto.DESC_PRODUTO,');
//    QRelSaldo.SQL.Add('((SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)))/Tb_produto.NUM_EMBALAGEM) AS NUM_SACAS,');
    QRelSaldo.Sql.Add('Tb_nota_item.COD_PRODUTO, Tb_nota_cab.COD_CADASTRO, Tb_produto.NUM_CONVERTE_FARDO FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO,TB_PARAM_SISTEMA WHERE ');
    QRelSaldo.Sql.Add(' TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO ');
    QRelSaldo.Sql.Add(' AND Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO AND Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ');
    QRelSaldo.Sql.Add(' AND TB_nota_cab.IND_SITUACAO = ' + chr(39) + '2' + chr(39));

    If Trim(FRomSaldo_Param.MeCadastro.Text) <> '' then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FRomSaldo_Param.MeCadastro.Text));
    If Trim(FRomSaldo_Param.MeCadastroParceiro.Text) <> '' Then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FRomSaldo_Param.MeCadastroParceiro.Text));
    If Trim(FRomSaldo_Param.MEDataI.Text) <> '' Then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) +Trim(FRomSaldo_Param.MEDataI.Text) + chr(39));
    If Trim(FRomSaldo_Param.MEDataF.Text) <> '' Then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) +Trim(FRomSaldo_Param.MEDataF.Text) + chr(39));
    If Trim(FRomSaldo_Param.MeProduto.Text) <> '' then
       QRelSaldo.Sql.Add(' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FRomSaldo_Param.MeProduto.Text));
    If Trim(FRomSaldo_Param.MeFilial.Text) <> '' then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FRomSaldo_Param.MeFilial.Text));
    If Trim(FRomSaldo_Param.MeDepartamento.Text) <> '' then
       QRelSaldo.Sql.Add(' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FRomSaldo_Param.MeDepartamento.Text));
    If FRomSaldo_Param.RGTipoFixacao.ItemIndex = 0 Then
     Begin
       QRelSaldo.Sql.Add(' AND ((TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'E' + CHR(39)+')');
       QRelSaldo.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'F' + CHR(39)+')');
       QRelSaldo.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'D' + CHR(39)+')');
       QRelSaldo.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'C' + CHR(39)+')');
       QRelSaldo.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'D' + CHR(39)+'))');
     End
    Else
     Begin
       QRelSaldo.Sql.Add(' AND ((TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'E' + CHR(39)+')');
       QRelSaldo.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'F' + CHR(39)+')');
     End;
    QRelSaldo.Sql.Add(' GROUP BY Tb_cadastro.NOME, Tb_cadastro.NUM_CGC_CPF, Tb_nota_cab.COD_OPERACAO,Tb_nota_cab.NUM_NOTA, Tb_nota_cab.DT_EMISSAO,');
    QRelSaldo.Sql.Add(' Tb_produto.DESC_PRODUTO,Tb_produto.NUM_CONVERTE_FARDO,Tb_nota_item.COD_PRODUTO, Tb_nota_cab.COD_CADASTRO,Tb_nota_item.VAL_UNITARIO ');
    Case FRomSaldo_Param.RGOrdem.ItemIndex Of
       0 : QRelSaldo.Sql.Add(') GROUP BY NOME,NUM_CGC_CPF,COD_PRODUTO,NUM_NOTA,VAL_UNITARIO,COD_OPERACAO,DT_EMISSAO,DESC_PRODUTO,COD_CADASTRO ORDER BY NOME,COD_CADASTRO,COD_PRODUTO,NUM_NOTA');
       1 : QRelSaldo.Sql.Add(') GROUP BY COD_CADASTRO,COD_PRODUTO,NUM_NOTA,VAL_UNITARIO,COD_OPERACAO,DT_EMISSAO,DESC_PRODUTO,NOME,NUM_CGC_CPF ORDER BY COD_CADASTRO,COD_PRODUTO,NUM_NOTA');
       2 : QRelSaldo.Sql.Add(') GROUP BY COD_CADASTRO,COD_PRODUTO,DT_EMISSAO,NUM_NOTA,VAL_UNITARIO,COD_OPERACAO,DESC_PRODUTO,NOME,NUM_CGC_CPF ORDER BY COD_CADASTRO,COD_PRODUTO,DT_EMISSAO');
    End;
    // aqui começa rotina para montar segunda SQL //
    QRelSaldo2.Sql.Add('SELECT SUM(sQuant_Consumo) as sQuant_Consumo,');
    QRelSaldo2.Sql.Add('SUM(sQuant_Dev_Consumo) as sQuant_Dev_Consumo,');
    QRelSaldo2.Sql.Add('SUM(SQuantidade_Fixado + SQuantidade_Fixado_Dev) as SQuantidade_Fixado,');
    QRelSaldo2.Sql.Add('SUM(sQuantidade_Fixar) as sQuantidade_Fixar,');
    QRelSaldo2.Sql.Add('SUM(VAL_DESCONTO + VAL_DESCONTO_DEV) as VAL_DESCONTO,');
    QRelSaldo2.Sql.Add('SUM(VAL_DESCONTO_SALDO + VAL_DESCONTO_DEV) as VAL_DESCONTO_SALDO,');
    QRelSaldo2.Sql.Add('SUM(VAL_TOTAL) as VAL_TOTAL,DESC_PRODUTO,COD_PRODUTO FROM (');
    If FRomSaldo_Param.RGTipoFixacao.ItemIndex = 0 Then
     Begin
        QRelSaldo2.Sql.Add('Select SUM(decode(TB_OPERACAO.IND_FIXAR_CONSUMO,'+chr(39)+'C'+CHR(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Consumo,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_CONSUMO,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Dev_Consumo,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado_Dev,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,');    // AS LINHAS ERAM ASSIM O VILSON PEDIU PARA ALTERAR NA IMPLANTACAO DOS DEPOSITOS
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',Tb_nota_item.VAL_DESCONTO_RATEIO,decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO)),0)) AS VAL_DESCONTO,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',Tb_nota_item.VAL_DESCONTO_RATEIO,decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO)),0)) AS VAL_DESCONTO_SALDO,');
//        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO))) AS VAL_DESCONTO,');
//        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO))) AS VAL_DESCONTO_SALDO,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',DECODE(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO_DEV,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS VAL_TOTAL,');
     End
    Else
     Begin
        QRelSaldo2.Sql.Add('Select 0 AS sQuant_Consumo,0 AS sQuant_Dev_Consumo,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',decode(Tb_nota_item.VAL_DESCONTO_RATEIO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO_RATEIO),0)) AS VAL_DESCONTO_SALDO,');
        QRelSaldo2.Sql.Add('SUM(decode(TB_OPERACAO.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS VAL_TOTAL,');
        QRelSaldo2.Sql.Add('0 as SQuantidade_Fixado_Dev, 0 as VAL_DESCONTO_DEV');
     End;
    QRelSaldo2.Sql.Add(' Tb_produto.DESC_PRODUTO,Tb_nota_item.COD_PRODUTO FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_OPERACAO,TB_PRODUTO,TB_DEPARTAMENTO,TB_PARAM_SISTEMA ');
    QRelSaldo2.Sql.Add(' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB ');
    QRelSaldo2.Sql.Add(' AND Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO ');
    QRelSaldo2.Sql.Add(' AND Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO ');
    QRelSaldo2.Sql.Add(' AND TB_nota_cab.IND_SITUACAO = ' + chr(39) + '2' + chr(39));
    QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.COD_DEPARTAMENTO = TB_DEPARTAMENTO.COD_DEPARTAMENTO ');
    If Trim(FRomSaldo_Param.MeCadastro.Text) <> '' then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FRomSaldo_Param.MeCadastro.Text));
    If Trim(FRomSaldo_Param.MeCadastroParceiro.Text) <> '' Then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FRomSaldo_Param.MeCadastroParceiro.Text));
    If Trim(FRomSaldo_Param.MEDataI.Text) <> '' Then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) +Trim(FRomSaldo_Param.MEDataI.Text) + chr(39));
    If Trim(FRomSaldo_Param.MEDataF.Text) <> '' Then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) +Trim(FRomSaldo_Param.MEDataF.Text) + chr(39));
    If Trim(FRomSaldo_Param.MeProduto.Text) <> '' then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FRomSaldo_Param.MeProduto.Text));
    If Trim(FRomSaldo_Param.MeFilial.Text) <> '' then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FRomSaldo_Param.MeFilial.Text));
    If Trim(FRomSaldo_Param.MeDepartamento.Text) <> '' then
       QRelSaldo2.Sql.Add(' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FRomSaldo_Param.MeDepartamento.Text));
    If FRomSaldo_Param.RGTipoFixacao.ItemIndex = 0 Then
     Begin
       QRelSaldo2.Sql.Add(' AND ((TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'E' + CHR(39)+')');
       QRelSaldo2.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'F' + CHR(39)+')');
       QRelSaldo2.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'D' + CHR(39)+')');
       QRelSaldo2.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'C' + CHR(39)+')');
       QRelSaldo2.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'D' + CHR(39)+'))');
     End
    Else
     Begin
       QRelSaldo2.Sql.Add(' AND ((TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'E' + CHR(39)+')');
       QRelSaldo2.Sql.Add(' OR (TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'F' + CHR(39)+')');
     End;
    QRelSaldo2.Sql.Add(' GROUP BY Tb_produto.DESC_PRODUTO,Tb_nota_item.COD_PRODUTO ');
    QRelSaldo2.Sql.Add(' ) GROUP BY DESC_PRODUTO,COD_PRODUTO ORDER BY DESC_PRODUTO,COD_PRODUTO');

    QRelSaldo.Open;

    If FRomSaldo_Param.RgResumo.ItemIndex = 0 Then
       QRelSaldo2.Open;

    If FRRomDemSaldo = Nil then
       FRRomDemSaldo := TFRRomDemSaldo.Create(Application);
    FRRomDemSaldo.QrLTitulo.Caption := 'Demonstrativo Produtos a Fixar ' +
                                            DateToStr(StrToDate(FRomSaldo_Param.MEDataI.Text)) + ' até ' +
                                            DateToStr(StrToDate(FRomSaldo_Param.MEDataF.Text));
    FRRomDemSaldo.QrLDepartamento.Caption := 'Departamento: '+ FRomSaldo_Param.EdDepartamento.Text;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAMBO') then
    begin
      FRRomDemSaldo.QRDBText8.DataField := '';
      FRRomDemSaldo.QREXPR5.Expression := '';
      FRRomDemSaldo.QREXPR10.Expression := '';
    end;

    If FRRomDemSaldo2 = Nil then
       FRRomDemSaldo2 := TFRRomDemSaldo2.Create(Application);

    if FRomSaldo_Param.RgPreview.ItemIndex = 0 then
      If FRomSaldo_Param.RgResumo.ItemIndex = 0 Then
         FRRomDemSaldo.QRCompositeReport1.Preview
      Else
         FRRomDemSaldo.QRPrimario.Preview
    else
      If FRomSaldo_Param.RgResumo.ItemIndex = 0 Then
         FRRomDemSaldo.QRCompositeReport1.Print
      Else
         FRRomDemSaldo.QRPrimario.Print;

    QRelSaldo.Close;
    QRelSaldo2.Close;
  end;
end;

procedure TFRomaneioCad.EmissodeRomaneios1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[2].TabVisible := True;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME2CodFilial.Text),'AGRICOLA');

    //alterado devido aos erros na emissão de relatórios. Ao emitir através dos componentes pré-existentes
    //os campos calculados eram atualizados a cada iteração gerando divergência nos valores apresentados
    //Cleber 17/07/2020
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', DMUsuario.QUsuarioCOD_FILIAL.Value);
    DMFilial.QFilial.Open;

    if (DMFilial.QFilialIND_IMPRIME_ROMANEIO.Value = 'RELATORIO') Then
    begin

      with DMRomaneioRel do
      begin

        QREmissaoRomaneio.Close;
        if Trim(FRomaneioParam.ME2CodFilial.Text) <>'' then
           QREmissaoRomaneio.SetVariable('COD_FILIAL',FRomaneioParam.ME2CodFilial.text)
        else
           QREmissaoRomaneio.SetVariable('COD_FILIAL',Null);
        if Trim(FRomaneioParam.ME2CodCliente.text) <>'' then
           QREmissaoRomaneio.SetVariable('COD_CADASTRO',FRomaneioParam.ME2CodCliente.text)
        else
           QREmissaoRomaneio.SetVariable('COD_CADASTRO',Null);
        if Trim(FRomaneioParam.ME2RomInicial.Text)<>'' then
           QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_INICIAL',FRomaneioParam.ME2RomInicial.Text)
        else
           QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_INICIAL',Null);
        if Trim(FRomaneioParam.ME2RomFinal.text)<>'' then
           QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_FINAL',FRomaneioParam.ME2RomFinal.text)
        else
           QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_FINAL',Null);

        QREmissaoRomaneio.SetVariable('DT_INICIAL',StrToDate(FRomaneioParam.ME2DtEmissaoInicial.text));
        QREmissaoRomaneio.SetVariable('DT_FINAL',StrToDate(FRomaneioParam.ME2DtEmissaoFinal.text));

        QREmissaoRomaneio.SetVariable('ROMANEIO',Null);

        QREmissaoRomaneio.Open;

        if (DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S') then
        begin
           if FrRomaneioEspelhoImagem = nil then
             FrRomaneioEspelhoImagem := TfrRomaneioEspelhoImagem.Create(Application);
           FrRomaneioEspelhoImagem.QRPrimario.Preview;
        end
        else
        begin
          if FRRomaneioEmissaoEspelho = nil then
            FRRomaneioEmissaoEspelho := TFRRomaneioEmissaoEspelho.Create(Application);
          if DMParamSistema.CodEmpresa = 'ESPIGAO' then
          begin
            FRRomaneioEmissaoEspelho.QRPrimario.Height := 705;
            FRRomaneioEmissaoEspelho.QRBand2.Enabled := False;
            FRRomaneioEmissaoEspelho.QRBand1.Font.Style := FRRomaneioEmissaoEspelho.QRBand1.Font.Style + [fsBold];
          end
          else
            FRRomaneioEmissaoEspelho.QRPrimario.Page.Length := 1056;
          FRRomaneioEmissaoEspelho.QRPrimario.Preview;
        end;

      end;
    end
    else
    begin

      with DMRomaneioAgricola do
      begin
        QrRomEmissao.Close;
        if Trim(FRomaneioParam.ME2CodFilial.Text) <>'' then
           QRRomEmissao.SetVariable('COD_FILIAL',FRomaneioParam.ME2CodFilial.text)
        else
           QRRomEmissao.SetVariable('COD_FILIAL',Null);
        if Trim(FRomaneioParam.ME2CodCliente.text) <>'' then
           QRRomEmissao.SetVariable('COD_CADASTRO',FRomaneioParam.ME2CodCliente.text)
        else
           QRRomEmissao.SetVariable('COD_CADASTRO',Null);
        if Trim(FRomaneioParam.ME2RomInicial.Text)<>'' then
           QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',FRomaneioParam.ME2RomInicial.Text)
        else
           QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',Null);
        if Trim(FRomaneioParam.ME2RomFinal.text)<>'' then
           QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',FRomaneioParam.ME2RomFinal.text)
        else
           QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',Null);

        QRRomEmissao.SetVariable('DT_INICIAL',StrToDate(FRomaneioParam.ME2DtEmissaoInicial.text));
        QRRomEmissao.SetVariable('DT_FINAL',StrToDate(FRomaneioParam.ME2DtEmissaoFinal.text));

        QRRomEmissao.SetVariable('ROMANEIO',Null);

        QrRomEmissao.Open;
        QrRomEmissao.First;

        while not(QrRomEmissao.Eof) do
        begin

          FRomaneioImpressao.EmiteRomaneio;

          QAtzRomaneio.Close;
          QAtzRomaneio.SetVariable('IND_SITUACAO','E');
          QAtzRomaneio.SetVariable('COD_ROMANEIO_AGRICOLA',QrRomEmissaoCod_Romaneio_Agricola.Value);
          QAtzRomaneio.ExecSQL;

          QrRomEmissao.Next;
        end;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
           
      end;
    end;
  end;
end;

procedure TFRomaneioCad.RelatrioSaldoaFixarSinttico1Click(Sender: TObject);
Var
  wSql, wSaldo : String;
begin
  inherited;
  If FRomSaldo_Param = Nil then
    FRomSaldo_Param := TFRomSaldo_Param.Create(Application);
  FRomSaldo_Param.PGRelatorio.Pages[1].TabVisible := True;
  If FRomSaldo_Param.ShowModal = mrOk then
  with DmRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomSaldo_Param.Me1Filial.Text),'AGRICOLA');
    QRSaldoFixar.Close;
    QRSaldoFixar.Sql.Clear;
    wSql :='SELECT COD_CADASTRO,NOME,NUM_CGC_CPF,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO,sConsumo,sAFixar,sAFixar_Sacas,sValorAFixar,sQt_Fixar,sQt_Fixado,sQt_Fixado_Dev FROM (';
    wSql := wSql + 'SELECT COD_CADASTRO,NUM_CGC_CPF,NOME,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO,sum(sQuant_Consumo - sQuant_Dev_Consumo) sConsumo,sum(sQuantidade_Fixar - SQuantidade_Fixado - SQuantidade_Fixado_Dev) sAFixar,';

    {Solicitado pela Grasel para dividir sempre por 60 as sacas e não ter problema com o cadastro NUM_EMBALAGEM - Cleber: 09/05/2019}
    // RETIRADO PELO CESAR PARA COLOCAR CONVERSAO DE FARDOS CRIADO NO CADASTRO DE PRODUTOS
    //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    //   wSql := wSql + ' sum((sQuantidade_Fixar - SQuantidade_Fixado - SQuantidade_Fixado_Dev) / 60) sAFixar_Sacas, sum(sValor_Fixar - sValor_Fixado - sValor_Fixado_Dev) sValorAFixar, '
    //else
       wSql := wSql + ' sum((sQuantidade_Fixar - SQuantidade_Fixado - SQuantidade_Fixado_Dev) / NUM_CONVERTE_FARDO) sAFixar_Sacas, sum(sValor_Fixar - sValor_Fixado - sValor_Fixado_Dev) sValorAFixar, ';

    wSql := wSql + 'sum(sQuantidade_Fixar) as sQt_Fixar, Sum(SQuantidade_Fixado + SQuantidade_Fixado_Dev) as sQt_Fixado,sum(SQuantidade_Fixado_Dev) as sQt_Fixado_Dev ';
    wSql := wSql + ' FROM (SELECT Tb_nota_cab.COD_CADASTRO,Tb_cadastro.NOME,Tb_cadastro.NUM_CGC_CPF,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.NUM_CONVERTE_FARDO,Tb_nota_item.COD_LOTE_TIPO,';
    If FRomSaldo_Param.RG1Tipo.ItemIndex = 0 Then
      Begin
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_CONSUMO,'+chr(39)+'C'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Consumo,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_CONSUMO,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Dev_Consumo,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS sValor_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado_Dev,';
        wSql := wSql + 'sum(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),decode(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0,Tb_nota_item.VAL_TOTAL,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))),0)) AS sValor_Fixado,';
//        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS sValor_Fixado,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',Decode(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0,Tb_nota_item.VAL_TOTAL,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)),0)) AS sValor_Fixado_Dev';
      End
    Else
      Begin
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS sValor_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,';
        wSql := wSql + 'sum(decode(TB_OPERACAO.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',DECODE(COD_EMPRESA,'+CHR(39)+'MOINHO'+CHR(39)+',PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),decode(PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),0,Tb_nota_item.VAL_TOTAL,PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))),0)) AS sValor_Fixado';
//        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Decode(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS sValor_Fixado';
      End;
    wSql := wSql + ' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_PRODUTO,TB_OPERACAO,TB_CLASSE,TB_PARAM_SISTEMA WHERE ';
    wSql := wSql + ' (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND Tb_nota_cab.IND_SITUACAO = ' + CHR(39) + '2' + CHR(39);
    wSql := wSql + ' AND Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ';
    wSql := wSql + ' AND Tb_Produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO ';
    wSql := wSql + ' AND Tb_Produto.COD_CLASSE = Tb_classe.COD_CLASSE ';

    If Trim(FRomSaldo_Param.Me1Cadastro.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FRomSaldo_Param.Me1Cadastro.Text);
//    If Trim(FRomSaldo_Param.Me1CadastroParceiro.Text) <> '' then
//       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FRomSaldo_Param.Me1CadastroParceiro.Text);
    If Trim(FRomSaldo_Param.Me1CadastroParceiro.text) <> '' then
      If Trim(FRomSaldo_Param.Me1CadastroParceiro.text) = '0' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO IS NULL'
      Else
        wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + FRomSaldo_Param.Me1CadastroParceiro.Text;
    If Trim(FRomSaldo_Param.Me1Produto.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FRomSaldo_Param.Me1Produto.Text);
    If Trim(FRomSaldo_Param.Me1Filial.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FRomSaldo_Param.Me1Filial.Text);
    If Trim(FRomSaldo_Param.Me1Departamento.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FRomSaldo_Param.Me1Departamento.Text);
    If Trim(FRomSaldo_Param.Me1LoteTipo.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FRomSaldo_Param.Me1LoteTipo.Text);
    If Trim(FRomSaldo_Param.Me1Classe.Text) <> '' Then
       wSql := wSql + ' AND TB_CLASSE.NUM_CLASSE = ' + Trim(FRomSaldo_Param.Me1Classe.Text);
    If (Trim(FRomSaldo_Param.Me1SubClasse.Text) <> '') And (Trim(FRomSaldo_Param.Me1SubClasse.Text) <> '0') Then
       wSql := wSql + ' AND TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FRomSaldo_Param.Me1SubClasse.Text);
    If FRomSaldo_Param.RG1Tipo.ItemIndex = 0 Then
     Begin
       wSql := wSql + ' AND ((TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'E' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'F' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'D' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'C' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'D' + CHR(39)+'))';
     End
    Else
     Begin
       wSql := wSql + ' AND ((TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'E' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'F' + CHR(39)+')';
     End;
    If Trim(FRomSaldo_Param.Me1DataI.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + QuotedStr(Trim(FRomSaldo_Param.Me1DataI.Text));
    If Trim(FRomSaldo_Param.Me1DataF.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + QuotedStr(Trim(FRomSaldo_Param.Me1DataF.Text));
    wSql := wSql + ' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_cadastro.NOME,Tb_cadastro.NUM_CGC_CPF,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.NUM_CONVERTE_FARDO,Tb_nota_item.COD_LOTE_TIPO ';
    wSql := wSql + ' )GROUP BY COD_CADASTRO,NOME,NUM_CGC_CPF,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO ';
    If FRomSaldo_Param.RGSaldoZerado.ItemIndex = 1 then {Adicionado CodEmpresa Inovar, solicitado por Alaine. Alex 24/09/2026}
    begin
      wSaldo := 'Não';
      If (DMParamSistema.CodEmpresa <> 'RAMBO') and (DMParamSistema.CodEmpresa <> 'INOVAR') Then
        wSql := wSql + ' ) WHERE ((SCONSUMO <> 0) OR (SAFIXAR <> 0) OR (sValorAFixar < -0.5) OR (sValorAFixar > 0.5))'
      Else
        wSql := wSql + ') WHERE SAFIXAR <> 0 ';
    end
    Else
    begin
      wSql := wSql + ') ';
      wSaldo := 'Sim';
    end;
    If FRomSaldo_Param.RG1Ordem.ItemIndex = 0 Then
       wSql := wSql + ' ORDER BY COD_PRODUTO,COD_LOTE_TIPO,NOME'
    Else
       wSql := wSql + ' ORDER BY COD_PRODUTO,COD_LOTE_TIPO,COD_CADASTRO';

    QRSaldoFixar.Sql.Add(wSql);
    QRSaldoFixar.Open;
    If FrFixarSintetico = Nil then
       FrFixarSintetico := TFrFixarSintetico.Create(Application);
    If Trim(FRomSaldo_Param.Me1Cadastro.Text) <> '' then
       FrFixarSintetico.QRGroup1.ForceNewPage := False
    Else
       FrFixarSintetico.QRGroup1.ForceNewPage := True;
    FrFixarSintetico.QrlPeriodo.Caption := 'Filial:' + FRomSaldo_Param.Ed1Filial.Text + ' De ' + FRomSaldo_Param.Me1DataI.Text + ' Ate ' + FRomSaldo_Param.Me1DataF.Text;
    FrFixarSintetico.QRLDepartamento.Caption := 'Departamento:' + FRomSaldo_Param.Ed1Departamento.Text;
    If Trim(FRomSaldo_Param.Me1Cadastro.Text) <> '' then
       FrFixarSintetico.QrlPeriodo.Caption := FrFixarSintetico.QrlPeriodo.Caption + ' Parceiro:'+Trim(FRomSaldo_Param.Me1CadastroParceiro.Text);
    if (DMParamSistema.CodEmpresa = 'MOINHO') then
    begin
      FRFixarSintetico.QRLabel9.Caption := '';
      FRFixarSintetico.QRDBText9.DataField := '';
      FRFixarSintetico.QRLabel6.Caption := 'CPF';
      FRFixarSintetico.QRDBText8.DataField := 'NUM_CGC_CPF';
      FRFixarSintetico.QRDBText8.Left := FRFixarSintetico.QRDBText8.Left - 20;
      FRFixarSintetico.QRDBText8.Width := FRFixarSintetico.QRDBText8.Width + 20;
      FRFixarSintetico.QRLabel6.Left := FRFixarSintetico.QRDBText8.Left;
    end;
    if (DMParamSistema.CodEmpresa = 'RAMBO') then
    begin
      FRFixarSintetico.QRDBText7.DataField := '';
//      FRFixarSintetico.QRDBText9.DataField := '';
      FRFixarSintetico.QREXPR5.Expression := '';
      FRFixarSintetico.QREXPR6.Expression := '';
    end;
    FRFixarSintetico.QRLSaldo.Caption := 'Saldo Zerado: ' + wSaldo;

    if FRomSaldo_Param.RgPreview.ItemIndex = 0 then
       FrFixarSintetico.QrPrimario.Preview
    else
       FrFixarSintetico.QrPrimario.Print;

    QRSaldoFixar.Close;
  end;
end;

procedure TFRomaneioCad.SBExcluirClick(Sender: TObject);
var
  wComando, wCodRomaneio, wCodNota, wCodContaReceber, wSituacao: String;
  wCount: integer;
begin
  with DMRomaneioAgricola do
  begin
    wCodRomaneio := QRomaneioCOD_ROMANEIO_AGRICOLA.Text;
    wCodNota := DMOracle.FastSelect('COD_NOTA_CAB','TB_NOTA_CAB','COD_ROMANEIO_AGRICOLA = ' + chr(39) + wCodRomaneio + chr(39));
    wCodContaReceber := DMOracle.FastSelect('COD_CONTA_RECEBER_CAB','TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = ' + chr(39) + wCodNota + chr(39));
    wSituacao := DMOracle.FastSelect('IND_SITUACAO','TB_CONTA_RECEBER_CAB','COD_CONTA_RECEBER_CAB = ' + chr(39) + wCodContaReceber + chr(39) );
    if QRomaneioInd_Situacao.Value = 'N' Then
       raise Exception.Create('Romaneio Com Nota Já Emitido - Não Permite Excluir');
    if (wSituacao = 'BAIXA PARCIAL') or (wSituacao = 'BAIXA TOTAL') then
       raise Exception.Create('Nota emitida pelo Romaneio possui baixas no Contas a Receber! É necessário voltar as baixas primeiro!');
    PageControl1.ActivePage := TsRomaneio;
    PRateio := 1;
    QRateio.First;
    while not Qrateio.Eof Do
      QRateio.Delete;
    // alteracao na balanca incluido pelo cesar para quando excluir o romaneio deixar a pesagem em aberto 06/08/2019
    QBalanca.Close;
    QBalanca.SetVariable('PK',QRomaneioCod_Balanca.Value);
    QBalanca.Open;
    If Not QBalanca.Eof Then
    Begin
      QBalanca.Edit;
      QBalancaInd_Situacao.Value := 'A';
      QBalanca.Post;
    End;
    inherited;
{Para deletar os lançamentos na recuperação de despesas do veículo. Solicitado por Itatiba. Alex 09/04/2025}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_DESPESA_RECUP WHERE COD_ROMANEIO_AGRICOLA = ' + QuotedStr(wCodRomaneio) );
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
{Para deletar os lançamentos do conta a receber caso a nota seja a prazo. Solicitado por Itatiba. Alex 09/04/2025}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB WHERE COD_NOTA_CAB = ' + QuotedStr(wCodNota));
    DMOracle.QExecSQL.Open;
{Percorre todos os COD_CONTA_RECEBER_CAB encontrados}
    while not DMOracle.QExecSQL.Eof do
    begin
      wCodContaReceber := DMOracle.QExecSQL.FieldByName('COD_CONTA_RECEBER_CAB').AsString;
      Bib.executaQueryString('DELETE FROM TB_CONTA_RECEBER_MOV WHERE COD_CONTA_RECEBER_CAB = ' + QuotedStr(wCodContaReceber));
      Bib.executaQueryString('DELETE FROM TB_CONTA_RECEBER_CAB WHERE COD_CONTA_RECEBER_CAB = ' + QuotedStr(wCodContaReceber));
      DMOracle.QExecSQL.Next;
    end;
    DMOracle.DBCemapa.Commit;
{Para Deletar os Itens da nota.}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + chr(39) + wCodNota + chr(39) );
    DMOracle.QExecSQL.ExecSQL;
{Para deletar os lançamentos na nota saída. Solicitado por Itatiba. Alex 09/04/2025}
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_NOTA_CAB WHERE COD_ROMANEIO_AGRICOLA = ' + chr(39) + wCodRomaneio + chr(39) );
    DMOracle.QExecSQL.ExecSQL;
    If DMOracle.DBCemapa.InTransaction then
       DMOracle.DBCemapa.Commit;
    PRateio := 0;
    PageControl1.ActivePage := TsBalanca;
  end;
end;

procedure TFRomaneioCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (5);
end;

procedure TFRomaneioCad.DBEdit13Exit(Sender: TObject);
begin                           
  inherited;
//  MePesoBalanca.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
//                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
end;

procedure TFRomaneioCad.SBIncluirClick(Sender: TObject);
begin
  If (DMRomaneioAgricola.QBalancaIND_TIPO.Value = 'Romaneio')              Or
     (DMRomaneioAgricola.QBalancaIND_TIPO.Value = 'Pesagem Entrada')       Or
     (DMRomaneioAgricola.QBalancaIND_TIPO.Value = 'Pesagem Saída')         Or
     (DMRomaneioAgricola.QBalancaIND_TIPO.Value = 'Transferencia Entrada') Or
     (DMRomaneioAgricola.QBalancaIND_TIPO.Value = 'Transferencia Saida')   Then
     If (DMRomaneioAgricola.QBalancaQt_Peso_Chegada.Value = 0) Or
        (DMRomaneioAgricola.QBalancaQt_Peso_Saida.Value = 0)   Then
        Raise Exception.Create('Informa peso chegada/saida');
  inherited;
  If DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Romaneio' Then
  Begin
     TsRateio.TabVisible := True;
     If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
      Begin
        TsTofeco.TabVisible := True;
        PageControl1.ActivePage := TsTofeco;
        DBEdit167.SetFocus;
      End
     Else
       Begin
         TsRomaneio.TabVisible := True;
         TsFitas.TabVisible := True;
         PageControl1.ActivePage := TsRomaneio;
         DBEdit7.SetFocus;
       End;
     TsImposto.TabVisible := (TsRomaneio.TabVisible or TsTofeco.TabVisible);
     End;
//Solicitado por Weliton da Inovar para que a mensagem fique automatico quando for romaneio. Alex 15/01/2024
     if (DMParamSistema.CodEmpresa = 'INOVAR') then
       DBEdit38.Text := '30';

  If (DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Transf Entrada') Or
     (DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Transf Saida')   Then
  Begin
     TsRomaneio.TabVisible := True;
     TsRateio.TabVisible := False;
     TsFitas.TabVisible := False;
     PageControl1.ActivePage := TsRomaneio;
     DBEdit7.SetFocus;
  End;
  If DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Entrada' Then
  Begin                                                        //Incluido 'SM' Junior - Pedido Odirlei 28/08/2025
     If (DmParamSistema.CodEmpresa <> 'INOVAR') and (DMParamSistema.CodEmpresa <> 'SM') then // incluido pelo César a pedido do Andrew 06/08/2019
        If DMRomaneioAgricola.QBalancaCOD_CONTRATO_PJURIDICA.Text = '' Then
            Raise Exception.Create('Informar contrato compra');
     TsPesagemEntrada.TabVisible := True;
     PageControl1.ActivePage := TsPesagemEntrada;
  End;
  If DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Saída' Then
  Begin                                                        //Incluido 'SM' Junior - Pedido Odirlei 28/08/2025
     If (DmParamSistema.CodEmpresa <> 'INOVAR') and (DMParamSistema.CodEmpresa <> 'SM') then // incluido pelo César a pedido do Andrew 06/08/2019
        If (DMRomaneioAgricola.QBalancaCOD_CONTRATO_VEND.Text = '') And
           (DMRomaneioAgricola.QBalancaIND_RETIRADA.Text = 'NAO')   Then
            Raise Exception.Create('Informar contrato venda');
     TsPesagemSaida.TabVisible := True;
     PageControl1.ActivePage := TsPesagemSaida;
  End;
  If DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Diversos' Then
  Begin
     TsDiversos.TabVisible := True;
     PageControl1.ActivePage := TsDiversos;
     if DMParamSistema.CodEmpresa = 'ALIANCA' then
       DMRomaneioAgricola.QRomaneioCOD_MENSAGEM.Value := DMParamSistema.QParamSistemaCOD_MENSAGEM.Value;
  end;
end;

procedure TFRomaneioCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  MePesoBalanca.Text := '';
  MePesoBalanca1.Text := '';
end;

procedure TFRomaneioCad.SBAlterarClick(Sender: TObject);
begin
  If DMRomaneioAgricola.QRomaneioInd_Situacao.Value = 'N' Then
     Raise Exception.Create('Romaneio Com Nota Já Emitido - Não Permite Alterar');
  inherited;
end;

procedure TFRomaneioCad.DBEdit30Exit(Sender: TObject);
Var wLote : String;
begin
  inherited;
  If (DMRomaneioAgricola.QRomaneioPERC_PH.VALUE <> 0) And (DMRomaneioAgricola.QRomaneioPERC_PH.Text <> '') Then
   Begin
    wLote := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO=' +FloatToStr(DMRomaneioAgricola.QRomaneioPERC_PH.VALUE));
    If wLote = '' Then
       Raise Exception.Create ('Tipo de PH Não Cadastrado');
   End;
end;

procedure TFRomaneioCad.RomaneiosnoPerodo1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[4].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME4_Filial.Text),'AGRICOLA');
    QRRomaneios_no_Periodo.Close;
    If Trim(FRomaneioParam.ME4_Cadastro.Text) = '' then
       QRRomaneios_no_Periodo.SetVariable('CADASTRO',Null)
    Else
       QRRomaneios_no_Periodo.SetVariable('CADASTRO',FRomaneioParam.ME4_Cadastro.Text);
    If Trim(FRomaneioParam.Me4CadastroParceiro.Text) = '' then
       QRRomaneios_no_Periodo.SetVariable('CADASTRO_PARCEIRO',Null)
    Else
       QRRomaneios_no_Periodo.SetVariable('CADASTRO_PARCEIRO',FRomaneioParam.Me4CadastroParceiro.Text);
    If Trim(FRomaneioParam.ME4_Filial.Text) = '' then
       QRRomaneios_no_Periodo.SetVariable('FILIAL',Null)
    Else
       QRRomaneios_no_Periodo.SetVariable('FILIAL',FRomaneioParam.ME4_Filial.Text);
    If Trim(FRomaneioParam.ME4_Produto.Text) = '' then
       QRRomaneios_no_Periodo.SetVariable('PRODUTO',Null)
    Else
       QRRomaneios_no_Periodo.SetVariable('PRODUTO',FRomaneioParam.ME4_Produto.Text);
    If Trim(FRomaneioParam.ME4_Armazem.Text) = '' then
       QRRomaneios_no_Periodo.SetVariable('ARMAZEM',Null)
    Else
       QRRomaneios_no_Periodo.SetVariable('ARMAZEM',FRomaneioParam.ME4_Armazem.Text);
    Case FRomaneioParam.Rg4TipoRomaneio.ItemIndex Of
     0 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','ROMANEIO');
     1 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','ROMANEIO S');
     2 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','PESAGEM EN');
     3 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','PESAGEM SA');
     4 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','PESAGEM PA');
     5 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','TRANSF ENT');
     6 : QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO','TRANSF SAI');
    End;
    QRRomaneios_no_Periodo.SetVariable('DATA_I',StrToDate(FRomaneioParam.ME4_DtInicial.Text));
    QRRomaneios_no_Periodo.SetVariable('DATA_F',StrToDate(FRomaneioParam.ME4_DtFinal.Text));
    QRRomEmissao.SetVariable('TIPO_ROMANEIO','ROMANEIO');
    QRRomaneios_no_Periodo.Open;
    If FRRomaneios_no_Periodo = Nil then
       FRRomaneios_no_Periodo := TFRRomaneios_no_Periodo.Create(Application);
    FRRomaneios_no_Periodo.QRLTitulo.Caption := 'Romaneios no Período de '+(FRomaneioParam.ME4_DtInicial.Text)+' - '+(FRomaneioParam.ME4_DtFinal.Text);
    FRRomaneios_no_Periodo.QRLEmpresa.Caption := 'Filial:'+FRomaneioParam.ED4_Filial.Text + ' Armazem:' + FRomaneioParam.ME4_Armazem.Text;
    if FRomaneioParam.RgPreview.ItemIndex = 0 then
       FRRomaneios_no_Periodo.QRPrimario.Preview
    else
       FRRomaneios_no_Periodo.QRPrimario.Print;
    QRRomaneios_no_Periodo.Close;
  end;
end;

procedure TFRomaneioCad.SbRomaneioPesagemClick(Sender: TObject);
begin
  inherited;
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(QRomaneioCOD_FILIAL.Text),'AGRICOLA');
    If FRRomaneio_Pesagem = Nil then
       FRRomaneio_Pesagem := TFRRomaneio_Pesagem.Create(Application);
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',QRomaneioCod_Filial.Value);
    DMFilial.QFilial.Open;
    QRRomEmissao.Close;
    If QRomaneioCod_Romaneio_Agricola.Value = 0 then
      raise exception.create('Deve ser Informado Código Romaneio')
    Else
    begin
      QRRomEmissao.SetVariable('ROMANEIO',QRomaneioCod_Romaneio_Agricola.Value);
      QRRomEmissao.SetVariable('COD_CADASTRO',Null);
      QRRomEmissao.SetVariable('DT_INICIAL',QRomaneioDt_Emissao.Value);
      QRRomEmissao.SetVariable('DT_FINAL',QRomaneioDt_Emissao.Value);
      QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',QRomaneioNum_Romaneio.Value);
      QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',QRomaneioNum_Romaneio.Value);
      QRRomEmissao.SetVariable('COD_FILIAL',QRomaneioCod_Filial.Value);
      QRRomEmissao.SetVariable('TIPO_ROMANEIO',QRomaneioInd_Tipo_Romaneio.Value)
    end;
    QRRomEmissao.Open;
    FRRomaneio_Pesagem.QRPrimario.Preview;
    DMFilial.QFilial.Close;
    QRRomEmissao.Close;
  end;
end;

procedure TFRomaneioCad.Romaneiopessagem1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[5].TabVisible := True;
  if FRomaneioParam.ShowModal = mrOk then
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomaneioParam.ME5FilialCod.Text),'AGRICOLA');
    if (Trim(FRomaneioParam.ME5DtInicial.Text) = '') or
       (Trim(FRomaneioParam.ME5DtFinal.Text) = '') then
       raise exception.Create('É necessario informar periodo para impressão do relatório!');
    QRRomaneioPesagem.Close;
    if Trim(FRomaneioParam.ME5CadastroCod.Text) = '' then
       QRRomaneioPesagem.SetVariable('COD_CADASTRO',Null)
    else
       QRRomaneioPesagem.SetVariable('COD_CADASTRO',FRomaneioParam.ME5CadastroCod.Text);

    if Trim(FRomaneioParam.ME5FilialCod.Text) = '' then
       QRRomaneioPesagem.SetVariable('COD_FILIAL',Null)
    else
       QRRomaneioPesagem.SetVariable('COD_FILIAL',FRomaneioParam.ME5FilialCod.Text);

    if Trim(FRomaneioParam.Me5ProdutoCod.Text) = '' then
       QRRomaneioPesagem.SetVariable('COD_PRODUTO',Null)
    else
       QRRomaneioPesagem.SetVariable('COD_PRODUTO',FRomaneioParam.Me5ProdutoCod.Text);
    if Trim(FRomaneioParam.Me5Armazem.Text) = '' then
       QRRomaneioPesagem.SetVariable('NUM_ARMAZEM',Null)
    else
       QRRomaneioPesagem.SetVariable('NUM_ARMAZEM',FRomaneioParam.Me5Armazem.Text);

    If Trim(FRomaneioParam.Me5Classe.Text)= ''   then
      QRRomaneioPesagem.SetVariable('CLASSE',Null)
    Else
      QRRomaneioPesagem.SetVariable('CLASSE',FRomaneioParam.Me5Classe.Text);

    If (Trim(FRomaneioParam.Me5SubClasse.Text)= '' ) or
       (Trim(FRomaneioParam.Me5SubClasse.Text)= '0') then
      QRRomaneioPesagem.SetVariable('SUB_CLASSE',Null)
    Else
      QRRomaneioPesagem.SetVariable('SUB_CLASSE',FRomaneioParam.Me5SubClasse.Text);

    QRRomaneioPesagem.SetVariable('DT_EMISSAO_I',StrToDate(FRomaneioParam.ME5DtInicial.Text));
    QRRomaneioPesagem.SetVariable('DT_EMISSAO_F',StrToDate(FRomaneioParam.ME5DtFinal.Text));
    Case FRomaneioParam.Rg5Pesagem.ItemIndex Of
     0 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','ROMANEIO');
     1 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','ROMANEIO S');
     2 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','PESAGEM EN');
     3 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','PESAGEM SA');
     4 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','PESAGEM PA');
     5 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','TRANSF ENT');
     6 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM','TRANSF SAI');
     7 : QRRomaneioPesagem.SetVariable('TIPO_PESAGEM',Null);
    End;
    QRRomaneioPesagem.SQL[QRRomaneioPesagem.SQL.Count-1] := '';
    Case FRomaneioParam.CB5Ordem.ItemIndex of
      0 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_ROMANEIO_AGRICOLA.DT_EMISSAO');
      1 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_ROMANEIO_AGRICOLA.NUM_ROMANEIO');
      2 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_ROMANEIO_AGRICOLA.NUM_TICKET');
      3 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_ROMANEIO_AGRICOLA.COD_PRODUTO');
      4 : QRRomaneioPesagem.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO,IND_TIPO_ROMANEIO');
      5 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_RATEIO_ROMANEIO.COD_CADASTRO');
      6 : QRRomaneioPesagem.SQL.Add('ORDER BY DESC_PRODUTO,IND_TIPO_ROMANEIO,TB_CADASTRO.NOME');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
    end; // Case
    QRRomaneioPesagem.Open;
    if FRRomaneioPesagem = Nil then
       FRRomaneioPesagem := TFRRomaneioPesagem.Create(Application);
    FRRomaneioPesagem.QRLEmpresa.Caption:= FRomaneioParam.Ed5FilialDesc.Text;
    FRRomaneioPesagem.QRLPeriodo.Caption:=' Periodo: '+FRomaneioParam.ME5DtInicial.Text+' A '+FRomaneioParam.ME5DtFinal.Text;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SRTERRA') then
    begin
      FRRomaneioPesagem.QRLabel7.Caption := 'Val.Frete';
      FRRomaneioPesagem.QRDBText5.DataField := 'VAL_DESPESAS';
      FRRomaneioPesagem.QRexpr12.Expression := 'SUM(QRRomaneioPesagem.VAL_DESPESAS)';
      FRRomaneioPesagem.QRexpr4.Expression := 'SUM(QRRomaneioPesagem.VAL_DESPESAS)';

      FRRomaneioPesagem.QRLabel21.Caption := 'Transport.';
      FRRomaneioPesagem.QRLabel9.Enabled:= False;
      FRRomaneioPesagem.QRLabel13.Enabled:= False;
      FRRomaneioPesagem.QRLabel14.Enabled:= False;
      FRRomaneioPesagem.QRLabel15.Enabled:= False;
      FRRomaneioPesagem.QRLabel16.Enabled:= False;
      FRRomaneioPesagem.QRLabel17.Enabled:= False;
      FRRomaneioPesagem.QRLabel18.Enabled:= False;
      FRRomaneioPesagem.QRLabel20.Enabled:= False;
      FRRomaneioPesagem.QRDBText4.Enabled:= False;
      FRRomaneioPesagem.QRDBText7.Enabled:= False;
      FRRomaneioPesagem.QRDBText8.Enabled:= False;
      FRRomaneioPesagem.QRDBText9.Enabled:= False;
      FRRomaneioPesagem.QRDBText10.Enabled:= False;
      FRRomaneioPesagem.QRDBText11.Enabled:= False;
      FRRomaneioPesagem.QRDBText12.Enabled:= False;
      FRRomaneioPesagem.QRDBText16.Enabled:= False;
      FRRomaneioPesagem.QRDBText17.Enabled:= False;
      FRRomaneioPesagem.QRLabel19.Enabled:= True;
      FRRomaneioPesagem.QRLabel19.Width := 141;
      FRRomaneioPesagem.QRExpr11.Enabled := False;
      FRRomaneioPesagem.QRExpr17.Enabled := False;
      FRRomaneioPesagem.QRExpr9.Enabled := False;
      FRRomaneioPesagem.QRExpr2.Enabled := False;
      FRRomaneioPesagem.QRExpr13.Enabled := False;
      FRRomaneioPesagem.QRExpr14.Enabled := False;
      FRRomaneioPesagem.QRExpr15.Enabled := False;
      FRRomaneioPesagem.QRExpr16.Enabled := False;
      FRRomaneioPesagem.QRExpr5.Enabled := False;
      FRRomaneioPesagem.QRExpr6.Enabled := False;
      FRRomaneioPesagem.QRExpr7.Enabled := False;
      FRRomaneioPesagem.QRExpr8.Enabled := False;
    end;

    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FRRomaneioPesagem.QRPrimario.Preview
    else
       FRRomaneioPesagem.QRPrimario.Print;
    QRRomaneioPesagem.Close;
  end;
end;

function TFRomaneioCad.LerPeso: Integer;
var
  Leitor: TLeBalanca;
  vPesoFormatado: string;
  fPeso: Double;
begin
  inherited;
  Result := 0;
  Buscador.Limpa;
  Buscador.Adiciona('IND_PORTA_BALANCA', 'TB_FILIAL',
      'COD_FILIAL = ' + FloatToStr(DMUsuario.CodFilialUsuario));
  Buscador.Adiciona('DESC_TIPO_BALANCA', 'TB_FILIAL',
      'COD_FILIAL = ' + FloatToStr(DMUsuario.CodFilialUsuario));
  Buscador.Buscar;
  wPorta := Buscador.Proximo;
  wBalanca := Buscador.Proximo;

  LblPorta.Caption := wPorta;
  if Copy(wPorta, 1, 3) = 'COM' then
    LblEndereco.Caption := Bib.LimpaNumero(wPorta);

  Leitor := TLeBalancaFactory.GetLeBalanca(wBalanca);

  if Leitor <> nil then
  begin
    Result := Leitor.Leitura(wPorta);
    if Leitor.IsError then
    begin
      MessageDlg('Erro na leitura do peso:' + #13 + #10 + IntToStr(Result) + ' - ' +
          wPorta, mtError, [mbOK], 0);
      Result := 0;
    end;
  end
  else
    MessageDlg('Não foi possível encontrar configuração para sua balança.', mtInformation, [mbOK], 0);
  
end;

procedure TFRomaneioCad.SBPesoChegadaClick(Sender: TObject);
begin
  inherited;
  DMRomaneioAgricola.QBalancaQT_PESO_CHEGADA.Value := LerPeso;
  if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S' then
    BtnImgPesagemEntradaClick(Sender);
End;

procedure TFRomaneioCad.incluiImagem(caminho: string; tipo: string = 'IMGENTRADA1');
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
    if ((Trim(DMParamSistema.QParamSistemaDESC_IP_CAM1.Value) <> '') and (Trim(DMParamSistema.QParamSistemaDESC_IP_CAM2.Value) <> '') )or
        (DMParamSistema.QParamSistemaDESC_IP_DVR.Value <> '')   then
      MyJPEG.LoadFromFile(caminho)
    else
    begin
      if (ext = '.jpeg') then // and (DMParamSistema.QParamSistemaDESC_IP_DVR.Value = '') then
      begin
        MyBMP.LoadFromFile(caminho);
        MyJPEG.Assign(MyBMP);
        MyJPEG.Compress;
      end
      else //se for jpg/jpeg
        MyJPEG.LoadFromFile(caminho);
    end;
    //-------redimensiona a imagem para ficar com o tamanho apropriado-----------
{    if (MessageDlg('Redimensionar imagem?'+#13+#10+'(Deixa ela em tamanho menor, ganhando espaço. Porém, ficará menos legível)', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
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
    end;}
    MyJPEG.SaveToStream(OutStream);
    //---------fim redimensiona a imagem------------

    //------------grava a imagem no banco de dados-----------------
     if tipo = 'IMGENTRADA1' then
       DMRomaneioAgricola.QBalancaIMG_PESAGEM_ENTRADA.LoadFromStream(outStream)
     else if tipo = 'IMGENTRADA2' then
       DMRomaneioAgricola.QBalancaIMG_PESAGEM_ENTRADA_2.LoadFromStream(outStream)
     else if tipo = 'IMGSAIDA1' then
       DMRomaneioAgricola.QBalancaIMG_PESAGEM_SAIDA.LoadFromStream(outStream)
     else if tipo = 'IMGSAIDA2' then
       DMRomaneioAgricola.QBalancaIMG_PESAGEM_SAIDA_2.LoadFromStream(outStream);
       
     DMRomaneioAgricola.QBalanca.Post;
     DMRomaneioAgricola.QBalanca.Edit;
    //----------fim grava imagem no banco de dados------------
     if tipo = 'IMGENTRADA1' then
       AtualizarImagemPesagemEntrada('IMGENTRADA1')
     else if tipo = 'IMGENTRADA2' then
       AtualizarImagemPesagemEntrada('IMGENTRADA2')
     else if tipo = 'IMGSAIDA1' then
       AtualizarImagemPesagemSaida('IMGSAIDA1')
     else if tipo = 'IMGSAIDA2' then
       AtualizarImagemPesagemSaida('IMGSAIDA2');
 finally
    MyJPEG.Free;
    MyBMP.Free;
    StretchBitmap.Free;
  end;
end;

procedure TFRomaneioCad.AtualizarImagemPesagemSaida(tipo: string = 'IMGSAIDA1');
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  if (tipo = 'IMGSAIDA1') then
    b := DMRomaneioAgricola.QBalanca.CreateBlobStream(DMRomaneioAgricola.QBalancaIMG_PESAGEM_SAIDA, bmRead)
  else if (tipo = 'IMGSAIDA2') then
    b := DMRomaneioAgricola.QBalanca.CreateBlobStream(DMRomaneioAgricola.QBalancaIMG_PESAGEM_SAIDA_2, bmRead);

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
      if tipo = 'IMGSAIDA1' then
      begin
        imgPesagemSaida.Picture.Assign(Jpg);
        imgPesagemSaida.visible := true;
      end
      else if tipo = 'IMGSAIDA2' then
      begin
        imgPesagemSaida2.Picture.Assign(Jpg);
        imgPesagemSaida2.visible := true;
      end;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgPesagemSaida.Picture.Assign(nil);
    imgPesagemSaida.Visible := false;
    imgPesagemSaida2.Picture.Assign(nil);
    imgPesagemSaida2.Visible := false;
  end;

  //lblImagemNaoCadastrada.Visible := not imgCadastro.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFRomaneioCad.AtualizarImagemPesagemEntrada(tipo: string = 'IMGENTRADA1');
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
    if tipo = 'IMGENTRADA1' then
      b := DMRomaneioAgricola.QBalanca.CreateBlobStream(DMRomaneioAgricola.QBalancaIMG_PESAGEM_ENTRADA, bmRead)
    else if tipo = 'IMGENTRADA2' then
      b := DMRomaneioAgricola.QBalanca.CreateBlobStream(DMRomaneioAgricola.QBalancaIMG_PESAGEM_ENTRADA_2, bmRead);

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
      if tipo = 'IMGENTRADA1' then
      begin
        imgPesagemEntrada.Picture.Assign(Jpg);
        imgPesagemEntrada.visible := true;
      end
      else
      if tipo = 'IMGENTRADA2' then
      begin
        ImgPesagemEntrada2.Picture.Assign(Jpg);
        ImgPesagemEntrada2.Visible := true;
      end;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgPesagemEntrada.Picture.Assign(nil);
    imgPesagemEntrada.Visible := false;
    ImgPesagemEntrada2.Picture.Assign(nil);
    ImgPesagemEntrada2.Visible := False;

  end;
  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFRomaneioCad.SBPesoSaidaClick(Sender: TObject);
var dirTemp : string;
begin
  inherited;
  DMRomaneioAgricola.QBalancaQT_PESO_SAIDA.Value := LerPeso;
  if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S' then
    BtnImgPesagemSaidaClick(Sender);
end;

procedure TFRomaneioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If (DMRomaneioAgricola.DSRomaneio_Fitas.DataSet.State in [dsEdit,dsInsert]) Then
    Raise Exception.Create('Dados não confirmados. janela fitas!');

  With DmRomaneioAgricola Do
  Begin
    QBalanca.Close;
    QRomaneio.Close;
    QRateio.Close;
  end;
  Action := CaFree;
  FRomaneioCad := Nil;
end;

procedure TFRomaneioCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QBalancaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRomaneioCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
   Begin
     DMRomaneioAgricola.QBalancaCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
     DBEdit35Exit(Self);
   End;
end;

procedure TFRomaneioCad.DBEdit35Exit(Sender: TObject);
begin
  inherited;
  if DMRomaneioAgricola.DsBalanca.State in [DSInsert, DSEdit] then
   Begin
     With DMProdutoAgricola do
     Begin
       QProdutoAgricolaFilial_Cons.Close;
       QProdutoAgricolaFilial_Cons.SetVariable('Cod_Produto',DMRomaneioAgricola.QBalancaCod_Produto.Value);
       QProdutoAgricolaFilial_Cons.SetVariable('Cod_Filial',DMRomaneioAgricola.QBalancaCod_Filial.Value);
       QProdutoAgricolaFilial_Cons.Open;
       If Not(QProdutoAgricolaFilial_Cons.Eof) Then
        Begin
          DMRomaneioAgricola.QBalancaPerc_Tolera_Ardidos.Value := QProdutoAgricolaFilial_ConsPerc_Tolera_Ardidos.Value;
          DMRomaneioAgricola.QBalancaPerc_Tolera_Impureza.Value := QProdutoAgricolaFilial_ConsPerc_Tolera_Impureza.Value;
          DMRomaneioAgricola.QBalancaPerc_Tolera_Avariado.Value := QProdutoAgricolaFilial_ConsPerc_Tolera_Avariado.Value;
          QProdutoAgricolaFilial_Cons.Close;
        End
       Else
        Begin
          QProdutoAgricola.Close;
          QProdutoAgricola.setVariable('PK',DMRomaneioAgricola.QBalancaCod_Produto.Value);
          QProdutoAgricola.Open;
          DMRomaneioAgricola.QBalancaPerc_Tolera_Ardidos.Value := QProdutoAgricolaPerc_Tolera_Ardidos.Value;
          DMRomaneioAgricola.QBalancaPerc_Tolera_Impureza.Value := QProdutoAgricolaPerc_Tolera_Impureza.Value;
          DMRomaneioAgricola.QBalancaPerc_Tolera_Avariado.Value := QProdutoAgricolaPerc_Tolera_Avariado.Value;
          QProdutoAgricola.Close;
        End;
     End;
     DMRomaneioAgricola.QBalancaPerc_Umidade.Value := 0;
   End;
end;

procedure TFRomaneioCad.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  With DMProdutoAgricola do
  Begin
    QProdutoAgricola.Close;
    QProdutoAgricola.setVariable('PK',DMRomaneioAgricola.QRomaneioCod_Produto.Value);
    QProdutoAgricola.Open;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Ardidos.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Ardidos.Value := QProdutoAgricolaPerc_Tolera_Ardidos.Value;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Impureza.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Impureza.Value := QProdutoAgricolaPerc_Tolera_Impureza.Value;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Avariado.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Avariado.Value := QProdutoAgricolaPerc_Tolera_Avariado.Value;
    QProdutoAgricola.Close;
  End;

end;

procedure TFRomaneioCad.CancelarRomaneio1Click(Sender: TObject);
begin
  inherited;
  If DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text = '' Then
     Raise Exception.Create('Não Informado Romaneio Para Cancelar');
  If DMRomaneioAgricola.QRomaneioInd_Situacao.Value = 'N' Then
     Raise Exception.Create('Romaneio com nota já emitida');
  DmUsuario.Checar_Filial_Usuario( Trim(DMRomaneioAgricola.QRomaneioCOD_FILIAL.Text),'AGRICOLA');
  If MessageDlg('Confirma Cancelamento Romaneio?',
     MtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET IND_SITUACAO = ' +
          Chr(39) + 'C' + Chr(39) + ' Where Cod_Romaneio_Agricola=' +
          DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text);
       QExecSQL.ExecSQL;
     End;
     DMOracle.DBCemapa.Commit;
     DMRomaneioAgricola.QRomaneio.Close;
     DMRomaneioAgricola.QRomaneio.Open;
   End;
end;

procedure TFRomaneioCad.DescontaTaxaArmazenagem1Click(Sender: TObject);
Var wBloqueio : String;
begin
  inherited;
  if MessageDlg('Confirma o Desconto Taxa Armazenagem',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      DMOracle.DbCemapa.StartTransaction;
      With DMRomaneioAgricola Do
      Begin
        QTaxaArmazenagem.Close;
        QTaxaArmazenagem.Open;
        While Not QTaxaArmazenagem.Eof Do
        Begin
           With DMBloqueio_produto do
            Begin
              QBloqueioProduto_Cad.Close;
              QBloqueioProduto_Cad.CommitOnPost := Not(QBloqueioProduto_Cad.CommitOnPost);
              wBloqueio := DMOracle.BuscaNome('SELECT COD_PRODUTO_BLOQUEADO FROM TB_PRODUTO_BLOQUEADO',
                           'COD_CADASTRO=' +QTaxaArmazenagemCod_Cadastro.Text +
                           ' AND COD_PRODUTO='+QTaxaArmazenagemCOD_PRODUTO.Text +
                           ' AND IND_TIPO_PRODUTO='+Chr(39)+'CONSUMO'+CHR(39)+
                           ' AND COD_FILIAL='+QTaxaArmazenagemCod_Filial.Text);
              If wBloqueio <> '' Then
               Begin
                 QBloqueioProduto_Cad.SetVariable('PK',wBloqueio);
                 QBloqueioProduto_Cad.Open;
                 QBloqueioProduto_Cad.Edit;
                 QBloqueioProduto_CadDT_BLOQUEIO.Value := Date;
                 QBloqueioProduto_CadQT_QUANTIDADE.Value := Trunc(QBloqueioProduto_CadQT_QUANTIDADE.Value +
                                                            QTaxaArmazenagemSaldo.Value *
                                                            DMParamSistema.QParamSistemaPerc_Consumo_Mes.Value / 100);
                 QBloqueioProduto_Cad.Post;
                 QBloqueioProduto_Cad.CommitOnPost := Not(QBloqueioProduto_Cad.CommitOnPost);
                 QBloqueioProduto_Cad.Close;
               End;
            End;
           QTaxaArmazenagem.Next;
        End;
        DMOracle.DbCemapa.Commit;
        QTaxaArmazenagem.Close;
      End;
    Except
      DMOracle.DBCemapa.RollBack;
      DMRomaneioAgricola.QTaxaArmazenagem.Close;
      Raise;
    end;
  end;  
end;

procedure TFRomaneioCad.BtConsfilClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMRomaneioAgricola.QBalancaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFRomaneioCad.RgTipoRomaneioChange(Sender: TObject);
begin
  inherited;
{  Case RgTipoRomaneio.ItemIndex Of
   0 : LblTipo.caption := 'ROMANEIO';
   1 : LblTipo.caption := 'ROMANEIO SEMENTE';
   2 : LblTipo.caption := 'PESAGEM ENTRADA';
   3 : LblTipo.caption := 'PESAGEM SAIDA';
   4 : LblTipo.caption := 'PESAGEM PARTICULAR';
  End; }
end;

procedure TFRomaneioCad.MEQtLiquidaExit(Sender: TObject);
Var wDesconto, wLiquido, wPercDesconto, wFator : Real;
begin
  If Trim(MEQtLiquida.Text) <> '' Then
  With DMRomaneioAgricola do
  Begin
    DMRomaneioAgricola.CalculoDesconto( StrToFloat(MEQtLiquida.Text),
                                        QRomaneioPerc_desconto.Value,
                                        QRomaneioPerc_ardidos.Value,
                                        QRomaneioPerc_Umidade.Value,
                                        QRomaneioPerc_Impureza.Value,
                                        QRomaneioPerc_Avariado.Value,
                                        QRomaneioPerc_Quebrados.Value,
                                        QRomaneioPerc_Diversos.Value,
                                        QRomaneioCod_Romaneio_Agricola.Value,
                                        QRomaneioCod_Produto.Value,
                                        QRomaneioPerc_Triguilho.Value,
                                        QRomaneioPerc_Tolera_Ardidos.Value,
                                        QRomaneioPerc_Tolera_Impureza.Value,
                                        QRomaneioPerc_Tolera_Avariado.Value,
                                        QRomaneioPerc_Beneficiado.Value,
                                        wLiquido, wDesconto);
    wPercDesconto := wDesconto * 100 / StrToFloat(MEQtLiquida.Text);
    wFator := (100 - wPercDesconto)/100;
    QRateioQT_Rateio.Value := Round( StrToFloat(MEQtLiquida.Text)/wFator );
    QRateioPerc_Rateio.Value := 0;
    MEQtLiquida.Text := '';
  End;
end;

procedure TFRomaneioCad.BtConsParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRomaneioCad.SpeedButton4Click(Sender: TObject);
var warquivo, wemail : string;
  wEvento: TNotifyEvent;
begin
  inherited;
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QRomaneioCod_Filial.Text),'AGRICOLA');
    QRRomEmissao.Close;
    If QRomaneioCod_Romaneio_Agricola.Value = 0 then
       raise exception.create('Deve ser Informado Codigo Romaneio')
    Else
     Begin
       QRRomEmissao.SetVariable('ROMANEIO',QRomaneioCod_Romaneio_Agricola.Value);
       QRRomEmissao.SetVariable('COD_CADASTRO',Null);
       QRRomEmissao.SetVariable('DT_INICIAL',QRomaneioDt_Emissao.Value);
       QRRomEmissao.SetVariable('DT_FINAL',QRomaneioDt_Emissao.Value);
       QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',QRomaneioNum_Romaneio.Value);
       QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',QRomaneioNum_Romaneio.Value);
       QRRomEmissao.SetVariable('COD_FILIAL',QRomaneioCod_Filial.Value);
       QRRomEmissao.SetVariable('TIPO_ROMANEIO',QRomaneioInd_Tipo_Romaneio.Value);
     End;
    QRRomEmissao.Open;
    QRRomEmissao.First;

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', QRomaneioCod_Filial.Text);
    DMFilial.QFilial.Open;

   While not(QRRomEmissao.Eof) do
    Begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ALIANCA') Then

      begin
        wEvento := Self.OnActivate;
        Self.OnActivate := nil;
        FRomaneioImpressao.EmitePesagem40Col;
        Self.OnActivate := wEvento;
      end
      else
        FRomaneioImpressao.EmitePesagem;
      QRRomEmissao.Next;
    End;
    QRRomEmissao.Close;
  End;

//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
//    with DMRomaneioAgricola do
//    begin
//      wemail := DMOracle.BuscaNome('SELECT DESC_E_MAIL FROM TB_CADASTRO', 'COD_CADASTRO = '+ QRomaneioCOD_CADASTRO.AsString);
//      if Trim(wemail) <> '' then // Enviar e-mail automaticamente se houver cadastrado - Djeison
//      begin
//        QRRomaneios_no_Periodo.Close;
//        QRRomaneios_no_Periodo.SetVariable('CADASTRO',QRomaneioCOD_CADASTRO.Value);
//        QRRomaneios_no_Periodo.SetVariable('CADASTRO_PARCEIRO',Null);
//        QRRomaneios_no_Periodo.SetVariable('PRODUTO',QRomaneioConsCOD_PRODUTO.Value);
//        QRRomaneios_no_Periodo.SetVariable('FILIAL',QRomaneioCOD_FILIAL.Value);
//        QRRomaneios_no_Periodo.SetVariable('ARMAZEM',Null);
//        QRRomaneios_no_Periodo.SetVariable('DATA_I',QRomaneioDT_EMISSAO.Value);
//        QRRomaneios_no_Periodo.SetVariable('DATA_F',QRomaneioDT_EMISSAO.Value);
//        QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO',QRomaneioIND_TIPO_ROMANEIO.Value);
//        QRRomaneios_no_Periodo.Open;
//        If FRRomaneios_no_Periodo = Nil then
//           FRRomaneios_no_Periodo := TFRRomaneios_no_Periodo.Create(Application);
//        FRRomaneios_no_Periodo.QRLTitulo.Caption := 'Romaneio de '+ QRomaneioDT_EMISSAO.AsString;
//        FRRomaneios_no_Periodo.QRLEmpresa.Caption := 'Filial:'+ QRomaneioCOD_FILIAL.AsString;
//        FRRomaneios_no_Periodo.QRPrimario.Prepare;
//        wArquivo := Bib.PegaTempDir + 'ROMANEIO_' + QRRomaneios_no_PeriodoNUM_ROMANEIO.AsString + '.pdf';
//        FRRomaneios_no_Periodo.QRPrimario.ExportToFilter(TQRPDFDocumentFilter.Create(wArquivo));
//        if FEnviaEmail = nil then
//            FEnviaEmail := TFEnviaEmail.Create(Application);
//        FEnviaEmail.caminhoAnexo := wArquivo;
//        FEnviaEmail.passunto_email := 'Romaneio de '+ QRomaneioDT_EMISSAO.AsString;
//        FEnviaEmail.pmensagem_email := 'Segue em anexo romaneio da empresa '+DMOracle.FastSelect('DESC_FILIAL',
//            'TB_FILIAL', 'COD_FILIAL = ' + QRomaneioCOD_FILIAL.AsString);
//        FEnviaEmail.pemail := wemail;
//        FEnviaEmail.FormActivate(self);
//        FEnviaEmail.BtEnviarClick(self);
//        DeleteFile(wArquivo);
//
//        QRRomaneios_no_Periodo.Close;
//      end;
//    end;
end;

procedure TFRomaneioCad.CancelaRomaneioComNotaEmitida1Click(
  Sender: TObject);
begin
  inherited;
  If DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text = '' Then
     Raise Exception.Create('Não Informado Romaneio Para Cancelar');
  DmUsuario.Checar_Filial_Usuario( Trim(DMRomaneioAgricola.QRomaneioCOD_FILIAL.Text),'AGRICOLA');
  If FRomaneioCancela = Nil Then
     FRomaneioCancela := TFRomaneioCancela.Create(Application);
  If FRomaneioCancela.ShowModal = MrOk Then
   Begin
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET IND_SITUACAO = ' +
          Chr(39) + 'C' + Chr(39) + ',DESC_OBSERVACAO = ' + 
          Chr(39) + Trim(FRomaneioCancela.MeMotivo.Text) + chr(39) + ' Where Cod_Romaneio_Agricola=' +
          DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text);
       QExecSQL.ExecSQL;
     End;
     DMOracle.DBCemapa.Commit;
     DMRomaneioAgricola.QRomaneio.Close;
     DMRomaneioAgricola.QRomaneio.Open;
   End;

end;

procedure TFRomaneioCad.RelRomaneioEntregaAcumulada1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[7].TabVisible := True;
  if FRomaneioParam.ShowModal = mrOk then
  with DMRomaneioAgricola do
  begin
    if Trim(FRomaneioParam.ME8Inicio.Text) = '' then
       Raise Exception.Create('É necessario informar a Data Inicial!');
    if Trim(FRomaneioParam.ME8Fim.Text) = '' then
       FRomaneioParam.ME8Fim.Text := DateToStr(Date);

    QRRomaneioAcumulado.Close;

    if Trim(FRomaneioParam.ME8Cadastro.Text) = '' then
       QRRomaneioAcumulado.SetVariable('COD_CADASTRO',Null)
    else
       QRRomaneioAcumulado.SetVariable('COD_CADASTRO',FRomaneioParam.ME8Cadastro.Text);

    if Trim(FRomaneioParam.ME8Parceria.Text) = '' then
       QRRomaneioAcumulado.SetVariable('COD_CADASTRO_PARCEIRO',Null)
    else
       QRRomaneioAcumulado.SetVariable('COD_CADASTRO_PARCEIRO',FRomaneioParam.ME8Parceria.Text);

    if Trim(FRomaneioParam.ME8Filial.Text) = '' then
       QRRomaneioAcumulado.SetVariable('COD_FILIAL',Null)
    else
       QRRomaneioAcumulado.SetVariable('COD_FILIAL',FRomaneioParam.ME8Filial.Text);

    if Trim(FRomaneioParam.ME8Produto.Text) = '' then
       QRRomaneioAcumulado.SetVariable('COD_PRODUTO',Null)
    else
       QRRomaneioAcumulado.SetVariable('COD_PRODUTO',FRomaneioParam.ME8Produto.Text);

    if Trim(FRomaneioParam.ME8Armazem.Text) = '' then
       QRRomaneioAcumulado.SetVariable('NUM_ARMAZEM',Null)
    else
       QRRomaneioAcumulado.SetVariable('NUM_ARMAZEM',FRomaneioParam.ME8Armazem.Text);

    QRRomaneioAcumulado.SetVariable('DATA_I',StrToDate(Trim(FRomaneioParam.ME8Inicio.Text)));
    QRRomaneioAcumulado.SetVariable('DATA_F',StrToDate(Trim(FRomaneioParam.ME8Fim.Text)));

    Case FRomaneioParam.Cb8Situacao.ItemIndex Of
     0 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO',Null);
     1 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO','A');
     2 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO','E');
     3 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO','N');
     4 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO','C');
     5 : QRRomaneioAcumulado.SetVariable('IND_SITUACAO','T');  //T -- > TODOS NAO CANCELADOS, T NAO ESTÁ GRAVADO NOS REGISTROS DO BANCO DE DADOS
    End;

    Case FRomaneioParam.Rg8tIPO.ItemIndex Of
     0: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM','ROMANEIO');
     1: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM','ROMANEIO S');
     2: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM','PESAGEM EN');
     3: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM','PESAGEM SA');
     4: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM','PESAGEM PA');
     5: QRRomaneioAcumulado.SetVariable('TIPO_PESAGEM',Null);
    END;
    QRRomaneioAcumulado.SQL[QRRomaneioAcumulado.SQL.Count-1] := '';
    Case FRomaneioParam.CB8Ordem.ItemIndex of
      0 : QRRomaneioAcumulado.SQL.Add('ORDER BY TB_CIDADE.DESC_CIDADE,TB_CADASTRO.NOME,TB_PRODUTO.DESC_PRODUTO');
      1 : QRRomaneioAcumulado.SQL.Add('ORDER BY TB_CIDADE.DESC_CIDADE,TB_PRODUTO.DESC_PRODUTO,TB_CADASTRO.NOME');
      2 : QRRomaneioAcumulado.SQL.Add('ORDER BY TB_CIDADE.DESC_CIDADE,QT_ACUMULADO DESC');
      3 : QRRomaneioAcumulado.SQL.Add('ORDER BY TB_CIDADE.DESC_CIDADE,TB_ROMANEIO_AGRICOLA.COD_CADASTRO,TB_PRODUTO.DESC_PRODUTO');
      else
        QRRomaneioAcumulado.SQL.Add('ORDER BY TB_CIDADE.DESC_CIDADE,TB_CADASTRO.NOME,TB_PRODUTO.DESC_PRODUTO');
    end; // Case

    QRRomaneioAcumulado.Open;

    if FRRomaneioAcumulado = nil then
       FRRomaneioAcumulado := TFRRomaneioAcumulado.Create(Application);
    FRRomaneioAcumulado.QRLTitulo.Caption := 'Relatório de Romaneio - Entrega Acumulada de '+Trim(FRomaneioParam.ME8Inicio.Text)+' até '+Trim(FRomaneioParam.ME8Fim.Text);
    FRRomaneioAcumulado.QRLFilial.Caption:= 'Filial: '+Trim(FRomaneioParam.Ed8Filial.Text);
    FRRomaneioAcumulado.QRLArmazem.Caption:='Armazém: '+Trim(FRomaneioParam.ME8Armazem.Text);
    FRRomaneioAcumulado.QRLParceria.Caption:= 'Parceria: '+Trim(FRomaneioParam.Ed8Parceria.Text);
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FRRomaneioAcumulado.QRPrimario.Preview
    else
       FRRomaneioAcumulado.QRPrimario.Print;
    QRRomaneioAcumulado.Close;
  end;
end;

procedure TFRomaneioCad.DBEdit54Change(Sender: TObject);
Var wLibera_Peso : String;
begin
  inherited;
  If (Trim(DBEdit54.Text) <> '') And (DMUsuario.pCodParceria = '') Then  // SE NO BANCO DE DADOS ESTIVER NAO TRAVA A ENTRADA MANUAL
   Begin
     wLibera_Peso := DMOracle.BuscaNome('SELECT IND_LIBERA_PESO_ROMANEIO FROM TB_FILIAL','COD_FILIAL = '+Trim(DBEdit54.Text));
     DbEdit2.Readonly :=  wLibera_Peso = 'NAO';  // peso entrada
     DbEdit3.Readonly :=  wLibera_Peso = 'NAO';  // peso saída
   end;
end;

procedure TFRomaneioCad.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FSenha = Nil Then
     FSenha := TFSenha.Create(Application);
  If FSenha.ShowModal = MrOk Then
   Begin
     If Trim(FSenha.MeUsuario.Text) <> '' Then
       Try
         DMUsuario.ValidaSenha(StrToFloat(Trim(FSenha.MeUsuario.Text)),Uppercase(FSenha.EdSenha.Text));
         DBEdit2.ReadOnly := DMUsuario.pTipoFuncionario = 'COLABORADOR';
         DBEdit3.ReadOnly := DMUsuario.pTipoFuncionario = 'COLABORADOR';
       Except
         Raise;
       End;
   End;
end;

procedure TFRomaneioCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QBalancaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFRomaneioCad.DBRadioGroup3Click(Sender: TObject);
begin
  inherited;
  DbEdit61.Setfocus;
end;

procedure TFRomaneioCad.RelFitas1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[9].TabVisible := True;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioAgricola.QRFitas.close;

    if trim(FRomaneioParam.ME10Filial.Text) <> '' then
      DMRomaneioAgricola.QRFitas.SetVariable('COD_FILIAL', strtoint(trim(FromaneioParam.ME10Filial.text)))
    else
      DMRomaneioAgricola.QRFitas.SetVariable('COD_FILIAL', null);

    if trim(FRomaneioParam.ME10Cadastro.Text) <> '' then
      DMRomaneioAgricola.QRFitas.SetVariable('COD_CADASTRO', strtoint(trim(FromaneioParam.ME10Cadastro.text)))
    else
      DMRomaneioAgricola.QRFitas.SetVariable('COD_CADASTRO', null);

    if trim(FRomaneioParam.ME10Inicio.Text) <> '' then
      DMRomaneioAgricola.QRFitas.SetVariable('DT_EMISSAO_INI', strtodate(trim(FromaneioParam.ME10Inicio.text)))
    else
      DMRomaneioAgricola.QRFitas.SetVariable('DT_EMISSAO_INI', null);

    if trim(FRomaneioParam.ME10Fim.Text) <> '' then
      DMRomaneioAgricola.QRFitas.SetVariable('DT_EMISSAO_FIM', strtodate(trim(FromaneioParam.ME10Fim.text)))
    else
      DMRomaneioAgricola.QRFitas.SetVariable('DT_EMISSAO_FIM', null);

    DMRomaneioAgricola.QRFitas.open;

    if frFitas = nil then
      frFitas := TfrFitas.create(application);
    if DMParamSistema.CodEmpresa = 'INOVAR' then
      FRFitas.QRLEmpresa.Caption := 'Empresa: ' + DMRomaneioAgricola.qrfitasdesc_filial.Value;
    frFitas.TotalPositivo := 0;
    frFitas.TotalNegativo := 0;
    frFitas.TotalEstragado := 0;

    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       frFitas.QRPrimario.Preview
    else
       frFitas.QRPrimario.Print;
    DMRomaneioAgricola.QRFitas.Close;


  end;
end;

procedure TFRomaneioCad.MarcarComplementoPeso1Click(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirma Romaneio Complemento de Peso?',
     MtConfirmation, [mbYes, mbNo], 0) = mrYes then
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET IND_COMPLEMENTO_PESO = ' +
          Chr(39) + 'S' + Chr(39) + ' Where Cod_Romaneio_Agricola=' +
          DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text);
       QExecSQL.ExecSQL;
     End
   Else
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET IND_COMPLEMENTO_PESO = ' +
          Chr(39) + 'N' + Chr(39) + ' Where Cod_Romaneio_Agricola=' +
          DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Text);
       QExecSQL.ExecSQL;
     End;
   DMOracle.DBCemapa.Commit;
   DMRomaneioAgricola.QRomaneio.Close;
   DMRomaneioAgricola.QRomaneio.Open;
end;

procedure TFRomaneioCad.BitBtn8Click(Sender: TObject);
begin
  inherited;
//  SbRomaneioPesagemClick(Self);
  SpeedButton4Click(Self);
end;

procedure TFRomaneioCad.TsBalancaEnter(Sender: TObject);
begin
  inherited;
{  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemEntrada.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
}
end;

procedure TFRomaneioCad.TsRomaneioEnter(Sender: TObject);
Var wLiquido,wDesconto : Real;
begin
  inherited;
  BtEncerra.Visible := false;
  if (DMParamSistema.CodEmpresa = 'INOVAR') and (DMRomaneioAgricola.QRomaneioIND_SITUACAO.Text = 'A') then
  begin
    BtEncerra.Visible := True;
    BtEncerra.Enabled := True;
  end;
  TsPesagemEntrada.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
  DBEdit56.Enabled := DmUsuario.pCodParceria = '';  // serve para nao deixar trocar o parceiro quando preenchido no cadastro de usuarios
  BTConsParceiro.Enabled := DmUsuario.pCodParceria = '';
  wLiquido := 0;
  wDesconto := 0;
  MePesoBalanca.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
  MePesoBalanca1.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
  With DMRomaneioAgricola do
  Begin
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                QRomaneioPerc_desconto.Value,
                                QRomaneioPerc_ardidos.Value,
                                QRomaneioPerc_Umidade.Value,
                                QRomaneioPerc_Impureza.Value,
                                QRomaneioPerc_Avariado.Value,
                                QRomaneioPerc_Quebrados.Value,
                                QRomaneioPerc_Diversos.Value,
                                QRomaneioCod_Romaneio_Agricola.Value,
                                QRomaneioCod_Produto.Value,
                                QRomaneioPerc_Triguilho.Value,
                                QRomaneioPerc_Tolera_Ardidos.Value,
                                QRomaneioPerc_Tolera_Impureza.Value,
                                QRomaneioPerc_Tolera_Avariado.Value,
                                QRomaneioPerc_Beneficiado.Value,
                                wLiquido, wDesconto);
  End;
  If wDesconto > StrToFloat(MePesoBalanca.Text)  Then
     Raise Exception.Create ('Quantidade Desconto Maior Quantidade Romaneio');
  MeDesconto.Text := FloatToStr(wDesconto);
  MeLiquido.Text := FloatToStr(wLiquido);
  MeDesconto1.Text := FloatToStr(wDesconto);
  MeLiquido1.Text := FloatToStr(wLiquido);
//  DBEdit13Exit(Self);

end;

procedure TFRomaneioCad.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemEntrada.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
  if DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Text = 'S' then
  begin
    if DMRomaneioAgricola.pCameraPesagem = False then
    begin
      ImgPesagemEntrada.Picture := Nil;
      ImgPesagemEntrada2.Picture   := Nil;
      ImgPesagemSaida.Picture := Nil;
      ImgPesagemSaida2.Picture := Nil;
    end;
  end;
end;

procedure TFRomaneioCad.BtContratoVendaClick(Sender: TObject);
begin
  inherited;
  If DMRomaneioAgricola.QBalancaCod_Produto.Text = '' Then
     Raise Exception.Create('Informar Código do Produto - Primeiro');
  If FContrato_VendaCons = nil then
     FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  FContrato_VendaCons.MECodProduto.Text := DMRomaneioAgricola.QBalancaCod_Produto.Text;
  FContrato_VendaCons.MECodProduto.Enabled := False;
  FContrato_VendaCons.SbProduto.Enabled := False;
  If FContrato_VendaCons.ShowModal = mrOK then
     DMRomaneioAgricola.QBalancaCod_Contrato_Vend.Value := DMContrato.QContrato_VendConsCod_Contrato_Vend.Value;
  FContrato_VendaCons.MECodProduto.Enabled := True;
  FContrato_VendaCons.SbProduto.Enabled := True;
end;

procedure TFRomaneioCad.DBEdit138Change(Sender: TObject);
Var wCodigo,wCod_Desconto,wDesc : String;
begin
  inherited;
  wDesc := '';
  If DMRomaneioAgricola.QRomaneioCOD_CONTRATO_VEND.Text <> '' Then
    wCod_Desconto := DMOracle.BuscaNome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+DMRomaneioAgricola.QRomaneioCOD_CONTRATO_VEND.Text);
  If wCod_Desconto <> '' Then
   Begin
     MeDescontoPadraoProduto.Text := wCod_Desconto;
     wCodigo := DMOracle.BuscaNome('SELECT COD_PADRAO_PRODUTO FROM TB_PADRAO_DESCONTO_PRODUTO','COD_PADRAO_DESCONTO_PRODUTO = '+wCod_Desconto);
     wDesc := DMOracle.BuscaNome('SELECT DESC_PADRAO_PRODUTO FROM TB_PADRAO_PRODUTO','COD_PADRAO_PRODUTO = '+wCodigo);
   End;
  MeDescontoPadrao.Text := wDesc;
end;

procedure TFRomaneioCad.TsPesagemSaidaEnter(Sender: TObject);
begin
  inherited;
  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemEntrada.TabVisible := False;
  TsDiversos.TabVisible := False;

  MePesoBalanca_Saida.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
  If Trim(MeDescontoPadraoProduto.Text) <> '' Then
  Begin
    With DMRomaneioAgricola do
    Begin
      CalculoDesconto_Saida( StrToFloat(MePesoBalanca_Saida.Text),
                                  QRomaneioPerc_ardidos.Value,
                                  QRomaneioPerc_Umidade.Value,
                                  QRomaneioPerc_Impureza.Value,
                                  QRomaneioPerc_Avariado.Value,
                                  QRomaneioPerc_Quebrados.Value,
                                  QRomaneioPerc_Triguilho.Value,
                                  StrToInt(MeDescontoPadraoProduto.Text),
                                  wLiquido, wDesconto);
    End;
    If wDesconto > StrToFloat(MePesoBalanca_Saida.Text)  Then
       Raise Exception.Create ('Quantidade Desconto Maior Quantidade Romaneio');
    MeDesconto_Saida.Text := FloatToStr(wDesconto);
    MeLiquido_Saida.Text := FloatToStr(wLiquido);

    // esta acessando a tabela no calculo do desconto saida
    MeToleraUmidade.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_Umidade.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value Then
      MeDescontoUmidade.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Umidade.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO.Value);

    MeToleraArdidos.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_ardidos.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value Then
      MeDescontoArdidos.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_ardidos.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value);

    MeToleraImpureza.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_Impureza.value > DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value Then
      MeDescontoImpureza.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Impureza.value - DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value);

    MeToleraAvariados.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_Avariado.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value Then
      MeDescontoAvariados.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Avariado.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value);

    MeToleraQuebrado.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_Quebrados.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value Then
      MeDescontoQuebrados.TExt := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Quebrados.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO.Value);

    MeToleraTriguilho.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Text;
    If DMRomaneioAgricola.QRomaneioPerc_Triguilho.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value Then
      MeDescontoTriguilho.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Triguilho.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO.Value);
  End
  Else
   Begin
     MeLiquido_Saida.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                      - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
     MeDesconto_Saida.Text := '0';
   End;

end;

procedure TFRomaneioCad.TsDiversosEnter(Sender: TObject);
begin
  inherited;
  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemEntrada.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  MePesoBalanca_Diversos.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
  if (DMRomaneioAgricola.QRomaneioIND_SITUACAO.Value = 'A') then
    BtEmiteNota.Enabled := True;
  if (DMRomaneioAgricola.QRomaneioIND_SITUACAO.Value = 'N') then
    BtEmiteNota.Enabled := False;

end;

procedure TFRomaneioCad.PageControl1Enter(Sender: TObject);
begin
  inherited;
{  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
  }
end;

procedure TFRomaneioCad.BtContratoCompraClick(Sender: TObject);
begin
  inherited;
  If DMRomaneioAgricola.QBalancaCod_Produto.Text = '' Then
     Raise Exception.Create('Informar Código do Produto - Primeiro');
  If FContrato_PJuridicaCons = nil then
     FContrato_PJuridicaCons := TFContrato_PJuridicaCons.Create(Application);
  FContrato_PJuridicaCons.MEProduto.Text := DMRomaneioAgricola.QBalancaCod_Produto.Text;
  FContrato_PJuridicaCons.MEProduto.Enabled := False;
  FContrato_PJuridicaCons.SbProduto.Enabled := False;
  If FContrato_PJuridicaCons.ShowModal = mrOK then
     DMRomaneioAgricola.QBalancaCod_Contrato_PJuridica.Value := DMContrato_PJuridica.QContratoPJuridicaConsCOD_CONTRATO_PJURIDICA.Value;
  FContrato_PJuridicaCons.MEProduto.Enabled := True;
  FContrato_PJuridicaCons.SbProduto.Enabled := True;
end;

procedure TFRomaneioCad.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
//  DBEdit137.Enabled := DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Saída';
  BtContratoVenda.Enabled := DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Saída';
//  DBEdit123.Enabled := DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Entrada';
  BtContratoCompra.Enabled := DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Entrada';
  DBRetirada.Visible := DMRomaneioAgricola.QBalancaInd_Tipo.Value = 'Pesagem Saída';
end;

procedure TFRomaneioCad.DBEdit124Change(Sender: TObject);
Var wCodigo,wCod_Desconto,wDesc : String;
begin
  inherited;
  wDesc := '';
  If DMRomaneioAgricola.QRomaneioCOD_CONTRATO_PJURIDICA.Text <> '' Then
    wCod_Desconto := DMOracle.BuscaNome('SELECT COD_PADRAO_DESCONTO_PRODUTO FROM TB_CONTRATO_PJURIDICA','COD_CONTRATO_PJURIDICA = '+DMRomaneioAgricola.QRomaneioCOD_CONTRATO_PJURIDICA.Text);
  If wCod_Desconto <> '' Then
   Begin
     MeDescontoPadraoProduto_E.Text := wCod_Desconto;
     wCodigo := DMOracle.BuscaNome('SELECT COD_PADRAO_PRODUTO FROM TB_PADRAO_DESCONTO_PRODUTO','COD_PADRAO_DESCONTO_PRODUTO = '+wCod_Desconto);
     wDesc := DMOracle.BuscaNome('SELECT DESC_PADRAO_PRODUTO FROM TB_PADRAO_PRODUTO','COD_PADRAO_PRODUTO = '+wCodigo);
   End;
  MeDescontoPadrao_e.Text := wDesc;

end;

procedure TFRomaneioCad.TsPesagemEntradaEnter(Sender: TObject);
begin
  inherited;
  TsRomaneio.TabVisible := False;
  TsRateio.TabVisible := False;
  TsFitas.TabVisible := False;
  TsPesagemSaida.TabVisible := False;
  TsDiversos.TabVisible := False;
  MePesoBalancaEntrada.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
  With DMRomaneioAgricola do
  Begin
    CalculoDesconto_Saida( StrToFloat(MePesoBalancaEntrada.Text),
                                QRomaneioPerc_ardidos.Value,
                                QRomaneioPerc_Umidade.Value,
                                QRomaneioPerc_Impureza.Value,
                                QRomaneioPerc_Avariado.Value,
                                QRomaneioPerc_Quebrados.Value,
                                QRomaneioPerc_Triguilho.Value,
                                StrToInt(MeDescontoPadraoProduto_E.Text),
                                wLiquido, wDesconto);
  End;
  If wDesconto > StrToFloat(MePesoBalancaEntrada.Text)  Then
     Raise Exception.Create ('Quantidade Desconto Maior Quantidade Romaneio');
  MeDesconto_Entrada.Text := FloatToStr(wDesconto);
  MeLiquido_Entrada.Text := FloatToStr(wLiquido);

  // esta acessando a tabela no calculo do desconto saida
  MeToleraUmidade_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_Umidade.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value Then
    MeDescontoUmidade_E.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Umidade.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_UMIDADE_DESCONTO.Value);

  MeToleraArdidos_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_ardidos.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value Then
    MeDescontoArdidos_E.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_ardidos.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_ARDIDOS_DESCONTO.Value);

  MeToleraImpureza_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_Impureza.value > DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value Then
    MeDescontoImpureza_E.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Impureza.value - DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_IMPUREZA_DESCONTO.Value);

  MeToleraAvariados_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_Avariado.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value Then
    MeDescontoAvariados_E.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Avariado.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_AVARIADO_DESCONTO.Value);

  MeToleraQuebrados_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_Quebrados.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value Then
    MeDescontoQuebrados_E.TExt := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Quebrados.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_QUEBRADO_DESCONTO.Value);

  MeToleraTriguilho_E.Text := DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Text;
  If DMRomaneioAgricola.QRomaneioPerc_Triguilho.Value > DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value Then
    MeDescontoTriguilho_E.Text := FloatToStr((DMRomaneioAgricola.QRomaneioPerc_Triguilho.Value - DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_TOLERANCIA.Value) * DMPadraoProduto.QPadraoDescontoProdutoNUM_TRIGUILHO_DESCONTO.Value);

end;

procedure TFRomaneioCad.RelatriodePesagensdeSada1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[10].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 10;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioAgricola.QRPesagemSaida.close;

    if trim(FRomaneioParam.ME11Filial.Text) <> '' then
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_FILIAL', strtoint(trim(FromaneioParam.ME11Filial.text)))
    else
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_FILIAL', null);

    if trim(FRomaneioParam.Me11Contrato.Text) <> '' then
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_CONTRATO', strtoint(trim(FromaneioParam.Me11Contrato.text)))
    else
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_CONTRATO', null);

    if Trim(FRomaneioParam.ME11Produto.Text) <> '' then
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_PRODUTO',FRomaneioParam.ME11Produto.Text)
    else
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('COD_PRODUTO',Null);

    if trim(FRomaneioParam.ME11Inicio.Text) <> '' then
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('DATAI', strtodate(trim(FromaneioParam.ME11Inicio.text)))
    else
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('DATAI', null);

    if trim(FRomaneioParam.ME11Fim.Text) <> '' then
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('DATAF', strtodate(trim(FromaneioParam.ME11Fim.text)))
    else
      DMRomaneioAgricola.QRPesagemSaida.SetVariable('DATAF', null);

    DMRomaneioAgricola.QRPesagemSaida.open;


    if FRPesagemSaida = nil then
      FRPesagemSaida := TFRPesagemSaida.create(application);

    FRPesagemSaida.QRLTitulo.Caption := 'Relatório de Pesagens de Saída';
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FRPesagemSaida.QRPrimario.Preview
    else
       FRPesagemSaida.QRPrimario.Print;
    DMRomaneioAgricola.QRPesagemSaida.Close;

  end;
end;

procedure TFRomaneioCad.RelatriodePesagensdeEntrada1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = nil then
     FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[11].TabVisible := True;
  FRomaneioParam.PGRelatorio.ActivePageIndex := 11;
  if FRomaneioParam.ShowModal = mrOk then
  begin
    DMRomaneioAgricola.QRPesagemEntrada.close;

    if trim(FRomaneioParam.ME12Filial.Text) <> '' then
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_FILIAL', strtoint(trim(FromaneioParam.ME12Filial.text)))
    else
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_FILIAL', null);

    if trim(FRomaneioParam.Me12Contrato.Text) <> '' then
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_CONTRATO', strtoint(trim(FromaneioParam.Me12Contrato.text)))
    else
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_CONTRATO', null);

    if Trim(FRomaneioParam.ME12Produto.Text) <> '' then
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_PRODUTO',FRomaneioParam.ME12Produto.Text)
    else
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('COD_PRODUTO',Null);

    if trim(FRomaneioParam.ME12Inicio.Text) <> '' then
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('DATAI', strtodate(trim(FromaneioParam.ME12Inicio.text)))
    else
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('DATAI', null);

    if trim(FRomaneioParam.ME12Fim.Text) <> '' then
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('DATAF', strtodate(trim(FromaneioParam.ME12Fim.text)))
    else
      DMRomaneioAgricola.QRPesagemEntrada.SetVariable('DATAF', null);

    DMRomaneioAgricola.QRPesagemEntrada.open;


    if FRPesagemEntrada = nil then
      FRPesagemEntrada := TFRPesagemEntrada.create(application);

    FRPesagemEntrada.QRLTitulo.Caption := 'Relatório de Pesagens de Entrada';
    if FRomaneioParam.RGPreview.ItemIndex = 0 then
       FRPesagemEntrada.QRPrimario.Preview
    else
       FRPesagemEntrada.QRPrimario.Print;
    DMRomaneioAgricola.QRPesagemEntrada.Close;
  end;            
end;

procedure TFRomaneioCad.BtPesagem(Sender: TObject);
begin
  inherited;
  SpeedButton4Click(Self);
end;

procedure TFRomaneioCad.BtRomaneioClick(Sender: TObject);
var
  wArquivo: string;
begin
  inherited;
  Proc_Imprime_Romaneio;

  //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
//    with DMRomaneioAgricola do
//    begin
//      QRRomaneios_no_Periodo.Close;
//      QRRomaneios_no_Periodo.SetVariable('CADASTRO',QRomaneioCOD_CADASTRO.Value);
//      QRRomaneios_no_Periodo.SetVariable('CADASTRO_PARCEIRO',Null);
//      QRRomaneios_no_Periodo.SetVariable('PRODUTO',QRomaneioConsCOD_PRODUTO.Value);
//      QRRomaneios_no_Periodo.SetVariable('FILIAL',QRomaneioCOD_FILIAL.Value);
//      QRRomaneios_no_Periodo.SetVariable('ARMAZEM',Null);
//      QRRomaneios_no_Periodo.SetVariable('DATA_I',QRomaneioDT_EMISSAO.Value);
//      QRRomaneios_no_Periodo.SetVariable('DATA_F',QRomaneioDT_EMISSAO.Value);
//      QRRomaneios_no_Periodo.SetVariable('TIPO_ROMANEIO',QRomaneioIND_TIPO_ROMANEIO.Value);
//      QRRomaneios_no_Periodo.Open;
//
//      If FRRomaneios_no_Periodo = Nil then
//         FRRomaneios_no_Periodo := TFRRomaneios_no_Periodo.Create(Application);
//      FRRomaneios_no_Periodo.QRLTitulo.Caption := 'Romaneio de '+ QRomaneioDT_EMISSAO.AsString;
//      FRRomaneios_no_Periodo.QRLEmpresa.Caption := 'Filial:'+ QRomaneioCOD_FILIAL.AsString;
//
//      FRRomaneios_no_Periodo.QRPrimario.Prepare;
//      wArquivo := Bib.PegaTempDir + 'ROMANEIO_' + QRRomaneios_no_PeriodoNUM_ROMANEIO.AsString + '.pdf';
//      FRRomaneios_no_Periodo.QRPrimario.ExportToFilter(TQRPDFDocumentFilter.Create(wArquivo));
//
//      if FEnviaEmail = nil then
//          FEnviaEmail := TFEnviaEmail.Create(Application);
//      FEnviaEmail.caminhoAnexo := wArquivo;
//      FEnviaEmail.passunto_email := 'Romaneio de '+ QRomaneioDT_EMISSAO.AsString;
//      FEnviaEmail.pmensagem_email := 'Segue em anexo romaneio da empresa '+DMOracle.FastSelect('DESC_FILIAL',
//          'TB_FILIAL', 'COD_FILIAL = ' + QRomaneioCOD_FILIAL.AsString);
//      FEnviaEmail.ShowModal;
//      DeleteFile(wArquivo);
//
//      QRRomaneios_no_Periodo.Close;
//    end;
end;

procedure TFRomaneioCad.MePercExit(Sender: TObject);
Var wDesconto, wLiquido, wPercDesconto, wFator, wAux : Real;
begin
  inherited;
//  wAux := 0;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NUTRI')) Then  //essa rotina é copia do onexit do campo meqtliquida
  Begin
    If Trim(MePerc.Text) <> '' Then
    With DMRomaneioAgricola do
    Begin
      wAux := (((QRomaneioQT_PESO_BRUTO.Value - QRomaneioQT_TARA.Value) * StrToFloat(MEPerc.Text)) /100);
      DMRomaneioAgricola.CalculoDesconto( wAux,
                                          QRomaneioPerc_desconto.Value,
                                          QRomaneioPerc_ardidos.Value,
                                          QRomaneioPerc_Umidade.Value,
                                          QRomaneioPerc_Impureza.Value,
                                          QRomaneioPerc_Avariado.Value,
                                          QRomaneioPerc_Quebrados.Value,
                                          QRomaneioPerc_Diversos.Value,
                                          QRomaneioCod_Romaneio_Agricola.Value,
                                          QRomaneioCod_Produto.Value,
                                          QRomaneioPerc_Triguilho.Value,
                                          QRomaneioPerc_Tolera_Ardidos.Value,
                                          QRomaneioPerc_Tolera_Impureza.Value,
                                          QRomaneioPerc_Tolera_Avariado.Value,
                                          QRomaneioPerc_Beneficiado.Value,
                                          wLiquido, wDesconto);
      //wPercDesconto := wDesconto * 100 / StrToFloat(MEQtLiquida.Text);
      wPercDesconto := wDesconto * 100 / wAux;
      wFator := (100 - wPercDesconto)/100;
      //QRateioQT_Rateio.Value := Round( StrToFloat(MEQtLiquida.Text)/wFator );
      QRateioQT_Rateio.Value := Round( wAux/wFator );
      QRateioPerc_Rateio.Value := 0;
      MEPerc.Text := '';
    End;
  end
  else
  Begin
    If Trim(MePerc.Text) <> '' Then
    Begin
      wDesconto := Round(StrToFloat(MeLiquido.Text) * StrToFloat(MePerc.Text) / 100);
      wFator := StrToFloat(MeLiquido.Text) / StrToFloat(MePesoBalanca.Text);
      DMRomaneioAgricola.QRateioQT_Rateio.Value := Round(wDesconto / wFator);
      MePerc.Text := '';
    End;
  end;
end;

procedure TFRomaneioCad.Proc_Imprime_Romaneio;
Begin
  with DMRomaneioAgricola, DMRomaneioRel do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(QRomaneioCod_Filial.Text),'AGRICOLA');
    QRRomEmissao.Close;

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', QRomaneioCod_Filial.Text);
    DMFilial.QFilial.Open;

    If RGTipoRomaneio.ItemIndex > 1 Then
      raise exception.create('Somente Romaneios Podem ser Emitidos');
    If QRomaneioCod_Romaneio_Agricola.Value = 0 then
      raise exception.create('Deve ser Informado Codigo Romaneio');


    //alterado devido aos erros na emissão de relatórios. Ao emitir através dos componentes pré-existentes
    //os campos calculados eram atualizados a cada iteração gerando divergência nos valores apresentados
    //Cleber 17/07/2020
    if (DMFilial.QFilialIND_IMPRIME_ROMANEIO.Value = 'RELATORIO') Then
    begin
      QREmissaoRomaneio.Close;
      QREmissaoRomaneio.SetVariable('ROMANEIO',QRomaneioCod_Romaneio_Agricola.Value);
      QREmissaoRomaneio.SetVariable('DT_INICIAL',QRomaneioDt_Emissao.Value);
      QREmissaoRomaneio.SetVariable('DT_FINAL',QRomaneioDt_Emissao.Value);
      QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_INICIAL',QRomaneioNum_Romaneio.Value);
      QREmissaoRomaneio.SetVariable('NUM_ROMANEIO_FINAL',QRomaneioNum_Romaneio.Value);
      QREmissaoRomaneio.SetVariable('COD_FILIAL',QRomaneioCod_Filial.Value);
      QREmissaoRomaneio.SetVariable('TIPO_ROMANEIO',QRomaneioInd_Tipo_Romaneio.Value);
      QREmissaoRomaneio.SetVariable('COD_CADASTRO',NULL);
      QREmissaoRomaneio.Open;

      if (DMParamSistema.QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S') then
      begin
         if FrRomaneioEspelhoImagem = nil then
           FrRomaneioEspelhoImagem := TfrRomaneioEspelhoImagem.Create(Application);
         FrRomaneioEspelhoImagem.QRPrimario.Preview;
      end
      else
      begin
        if FRRomaneioEmissaoEspelho = nil then
          FRRomaneioEmissaoEspelho := TFRRomaneioEmissaoEspelho.Create(Application);
        if DMParamSistema.CodEmpresa = 'ESPIGAO' then
        begin
          FRRomaneioEmissaoEspelho.QRPrimario.Height := 705;
          FRRomaneioEmissaoEspelho.QRBand2.Enabled := False;
          FRRomaneioEmissaoEspelho.QRBand1.Font.Style := FRRomaneioEmissaoEspelho.QRBand1.Font.Style + [fsBold]; 
        end
        else
          FRRomaneioEmissaoEspelho.QRPrimario.Height := 1572;
        FRRomaneioEmissaoEspelho.QRPrimario.Preview;
      end
    end
    else
    begin
      QRRomEmissao.SetVariable('ROMANEIO',QRomaneioCod_Romaneio_Agricola.Value);
      QRRomEmissao.SetVariable('COD_CADASTRO',Null);
      QRRomEmissao.SetVariable('DT_INICIAL',QRomaneioDt_Emissao.Value);
      QRRomEmissao.SetVariable('DT_FINAL',QRomaneioDt_Emissao.Value);
      QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',QRomaneioNum_Romaneio.Value);
      QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',QRomaneioNum_Romaneio.Value);
      QRRomEmissao.SetVariable('COD_FILIAL',QRomaneioCod_Filial.Value);
      QRRomEmissao.SetVariable('TIPO_ROMANEIO',QRomaneioInd_Tipo_Romaneio.Value);

      QRRomEmissao.Open;
      QRRomEmissao.First;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO')    Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL')    Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAMBO')     Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ALEOESTE')  Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CITY')      Or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NUTRI')     Or  //NUTRIGRANOS
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CEREAIS')   or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ESPIGAO')   or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INOVAR')    or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BMG') Then
      Begin   // para o moinho a impressao do romaneio precisa saber o rateio para outros clientes liquido
        pRateio := 0; //definido no data modulo de romaneio agricola
        While not(QRRomEmissao.Eof) do
        Begin
          If QrRomEmissaoCod_Cadastro.Value <> QrRomEmissaoCod_Cadastro_Romaneio.Value Then
            pRateio := pRateio + QrRomEmissaoLiquido.Value;
          QRRomEmissao.Next;
        End;
        QRRomEmissao.First;
      End;
      pUmidade := QrRomEmissaoUmidade.Value;
      pImpureza := QrRomEmissaoimpureza.Value;
      pArdidos := QrRomEmissaoardidos.Value;
      pAvariados := QrRomEmissaoavariados.Value;
      pQuebrados := QrRomEmissaoquebrados.Value;
      pTriguilho := QrRomEmissaotriguilho.Value;
      pTotalDescontos := QrRomEmissaototaldesconto.Value;

      While not(QRRomEmissao.Eof) do
      Begin
        DMFilial.QFilial.Close;
        DMFilial.QFilial.SetVariable('PK', QRomaneioCod_Filial.Text);
        DMFilial.QFilial.Open;


        FRomaneioImpressao.EmiteRomaneio;

        If QrRomEmissaoInd_Situacao.Value = 'A' Then
        Begin
          QAtzRomaneio.Close;
          QAtzRomaneio.SetVariable('IND_SITUACAO','E');
          QAtzRomaneio.SetVariable('COD_ROMANEIO_AGRICOLA',QrRomEmissaoCod_Romaneio_Agricola.Value);
          QAtzRomaneio.ExecSQL;
        End;
        QRRomEmissao.Next;
      End;
      QAtzRomaneio.Close;
      QRRomEmissao.Close;
      If DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    end;
  End;
end;

procedure TFRomaneioCad.TsRateioEnter(Sender: TObject);
begin
  inherited;
  If DMRomaneioAgricola.QRomaneio.State <> DsBrowse Then  // serve apenas para habilitar o DbNavigator
  Begin
    DMRomaneioAgricola.QRateio.Insert;
    DMRomaneioAgricola.QRateio.Cancel;
  End;
end;

procedure TFRomaneioCad.RelBalana1Click(Sender: TObject);
begin
  inherited;
  if FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[13].TabVisible := true;
  if FRomaneioParam.ShowModal = MrOk then
  begin
    with DMRomaneioAgricola do
    begin
      QRBalanca.Close;

      if trim(FRomaneioParam.FmBalanca14.MeBalanca.Text) <> '' then
        QRBalanca.setVariable('PLACA', trim(FRomaneioParam.FmBalanca14.MeBalanca.Text))
      else
        QRBalanca.setVariable('PLACA', null);
      if trim(FRomaneioParam.FmFilial14.MeFilial.Text) <> '' then
        QRBalanca.SetVariable('FILIAL', trim(FRomaneioParam.FmFilial14.MeFilial.Text))
      else
        QRBalanca.SetVariable('FILIAL', null);

      Case FRomaneioParam.Rg14Situacao.ItemIndex Of
        0: QRBalanca.SetVariable('SITUACAO','A');
        1: QRBalanca.SetVariable('SITUACAO','F');
        2: QRBalanca.SetVariable('SITUACAO',null);
      end;

     if Trim(FRomaneioParam.FmCadastro14.MeCadastro.Text) <> '' then
       QRBalanca.SetVariable('COD_CADASTRO', StrToInt(Trim(FRomaneioParam.FmCadastro14.MeCadastro.Text)))
     else
       QRBalanca.SetVariable('COD_CADASTRO', null);

     If FRomaneioParam.Cb14TipoPesagem.ItemIndex = 4 Then
       QRBalanca.SetVariable('TIPO',null)
     Else
       QRBalanca.SetVariable('TIPO',FRomaneioParam.Cb14TipoPesagem.Items[FRomaneioParam.Rg14situacao.ItemIndex]);

     if trim(FRomaneioParam.Me14Data_I.Text) <> '' then
     begin
       QRBalanca.SetVariable('DT_REFERENCIA_I', trim(FRomaneioParam.Me14Data_I.Text));
       if trim(FRomaneioParam.Me14Data_F.Text) <> '' then
         QRBalanca.SetVariable('DT_REFERENCIA_F', trim(FRomaneioParam.Me14Data_F.Text))
       else
         QRBalanca.SetVariable('DT_REFERENCIA_F', DateToStr(Date));
     end
     else
       Raise Exception.Create('Data inicial deve ser informada');

      QRBalanca.Open;

      if FRBalanca = nil then
        FRBalanca := TFRBalanca.Create(Application);
      if Trim(FRomaneioParam.FmFilial14.MeFilial.Text) <> '' then
        FRBalanca.QRLFilial.Caption := 'Filial: ' + Trim(FRomaneioParam.FmFilial14.MeFilial.Text)
      else
        FRBalanca.QRLFilial.Caption := 'Filial: Todas';
      FRBalanca.QRLPeriodo.Caption := 'De: ' + FRomaneioParam.Me14Data_I.Text + ' Até: ' + FRomaneioParam.Me14Data_F.Text;
      if FRomaneioParam.RGPreview.ItemIndex = 0 then
         FRBalanca.QRPrimario.Preview
      else
         FRBalanca.QRPrimario.Print;
      QRBalanca.Close;
    end;
  end;
end;


procedure TFRomaneioCad.RelSaldoaFixarSintticoPFilial1Click(
  Sender: TObject);
Var wSql : String;
begin
  inherited;
  If FRomSaldo_Param = Nil then
    FRomSaldo_Param := TFRomSaldo_Param.Create(Application);
  FRomSaldo_Param.PGRelatorio.Pages[1].TabVisible := True;
  If FRomSaldo_Param.ShowModal = mrOk then
  with DmRomaneioRel do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FRomSaldo_Param.Me1Filial.Text),'AGRICOLA');
    QRSaldoFixar_Sintetico.Close;
    QRSaldoFixar_Sintetico.Sql.Clear;
    wSql :='SELECT COD_FILIAL,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO,sConsumo,sAFixar,sAFixar_Sacas,sValorAFixar,sQt_Fixar,sQt_Fixado FROM (';
    wSql := wSql + 'SELECT COD_FILIAL,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO,sum(sQuant_Consumo - sQuant_Dev_Consumo) sConsumo,sum(sQuantidade_Fixar - SQuantidade_Fixado - SQuantidade_Fixado_Dev) sAFixar, ';
    wSql := wSql + 'sum((sQuantidade_Fixar - SQuantidade_Fixado - SQuantidade_Fixado_Dev)/NUM_CONVERTE_FARDO) sAFixar_Sacas, ';
    wSql := wSql + 'sum(sValor_Fixar - sValor_Fixado - sValor_Fixado_Dev) sValorAFixar, sum(sQuantidade_Fixar) as sQt_Fixar, Sum(SQuantidade_Fixado + SQuantidade_Fixado_Dev) as sQt_Fixado ';
    wSql := wSql + ' FROM (SELECT Nvl(Tb_nota_cab.COD_CADASTRO_PARCEIRO,Tb_Nota_Cab.COD_FILIAL) As Cod_Filial,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.NUM_CONVERTE_FARDO,Tb_nota_item.COD_LOTE_TIPO,';
    If FRomSaldo_Param.RG1Tipo.ItemIndex = 0 Then
      Begin
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_CONSUMO,'+chr(39)+'C'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Consumo,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_CONSUMO,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuant_Dev_Consumo,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS sValor_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado_Dev,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'F'+chr(39)+',Tb_nota_item.VAL_DESCONTO,0)) AS sValor_Fixado,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_EMPRESA,'+chr(39)+'D'+chr(39)+',DECODE(Tb_nota_item.VAL_DESCONTO,0,Tb_nota_item.VAL_TOTAL,Tb_nota_item.VAL_DESCONTO),0)) AS sValor_Fixado_Dev';
      End
    Else
      Begin
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS sQuantidade_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'E'+chr(39)+',Tb_nota_item.VAL_TOTAL,0)) AS sValor_Fixar,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Tb_nota_item.QT_QUANTIDADE,0)) AS SQuantidade_Fixado,';
        wSql := wSql + 'sum(decode(tb_operacao.IND_FIXAR_OUTRAS_EMP,'+chr(39)+'F'+chr(39)+',Tb_nota_item.VAL_DESCONTO,0)) AS sValor_Fixado';
      End;
    wSql := wSql + ' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_OPERACAO,TB_CLASSE WHERE ';
    wSql := wSql + ' (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND Tb_nota_cab.IND_SITUACAO = ' + CHR(39) + '2' + CHR(39);
    wSql := wSql + ' AND Tb_Produto.COD_PRODUTO = Tb_nota_item.COD_PRODUTO ';
    wSql := wSql + ' AND Tb_Produto.COD_CLASSE = Tb_Classe.COD_CLASSE ';

    If Trim(FRomSaldo_Param.Me1Cadastro.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FRomSaldo_Param.Me1Cadastro.Text);
//    If Trim(FRomSaldo_Param.Me1CadastroParceiro.Text) <> '' then
//       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + Trim(FRomSaldo_Param.Me1CadastroParceiro.Text);
    If Trim(FRomSaldo_Param.Me1CadastroParceiro.text) <> '' then
      If Trim(FRomSaldo_Param.Me1CadastroParceiro.text) = '0' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO IS NULL'
      Else
        wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + FRomSaldo_Param.Me1CadastroParceiro.Text;
    If Trim(FRomSaldo_Param.Me1Produto.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FRomSaldo_Param.Me1Produto.Text);
    If Trim(FRomSaldo_Param.Me1Filial.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FRomSaldo_Param.Me1Filial.Text);
    If Trim(FRomSaldo_Param.Me1Departamento.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FRomSaldo_Param.Me1Departamento.Text);
    If Trim(FRomSaldo_Param.Me1LoteTipo.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FRomSaldo_Param.Me1LoteTipo.Text);
    If Trim(FRomSaldo_Param.Me1Classe.Text) <> '' Then
       wSql := wSql + ' AND TB_CLASSE.NUM_CLASSE = ' + Trim(FRomSaldo_Param.Me1Classe.Text);
    If (Trim(FRomSaldo_Param.Me1SubClasse.Text) <> '') And (Trim(FRomSaldo_Param.Me1SubClasse.Text) <> '0') Then
       wSql := wSql + ' AND TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FRomSaldo_Param.Me1SubClasse.Text);
    If FRomSaldo_Param.RG1Tipo.ItemIndex = 0 Then
     Begin
       wSql := wSql + ' AND ((TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'E' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'F' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_EMPRESA = ' + CHR(39) + 'D' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'C' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_CONSUMO = ' + CHR(39) + 'D' + CHR(39)+'))';
     End
    Else
     Begin
       wSql := wSql + ' AND ((TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'E' + CHR(39)+')';
       wSql := wSql + ' OR (TB_OPERACAO.IND_FIXAR_OUTRAS_EMP = ' + CHR(39) + 'F' + CHR(39)+')';
     End;
//    If Trim(FRomSaldo_Param.Me1DataI.Text) <> '' then
//       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + CHR(39) + Trim(FRomSaldo_Param.Me1DataI.Text) + CHR(39);
//    If Trim(FRomSaldo_Param.Me1DataF.Text) <> '' then
//       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + CHR(39) + Trim(FRomSaldo_Param.Me1DataF.Text) + CHR(39);
    If Trim(FRomSaldo_Param.Me1DataI.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DT_EMISSAOI';
    If Trim(FRomSaldo_Param.Me1DataF.Text) <> '' then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DT_EMISSAOF';
    wSql := wSql + ' GROUP BY Nvl(Tb_nota_cab.COD_CADASTRO_PARCEIRO,Tb_Nota_Cab.COD_FILIAL),Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.NUM_CONVERTE_FARDO,Tb_nota_item.COD_LOTE_TIPO ';
    wSql := wSql + ' )GROUP BY COD_FILIAL,COD_PRODUTO,DESC_PRODUTO,COD_LOTE_TIPO ';
    If FRomSaldo_Param.RGSaldoZerado.ItemIndex = 1 then
       If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RAMBO' Then
          wSql := wSql + ' ) WHERE ((SCONSUMO <> 0) OR (SAFIXAR <> 0) OR (sValorAFixar < -0.5) OR (sValorAFixar > 0.5))'
       Else
          wSql := wSql + ') WHERE SAFIXAR <> 0 '
    Else
       wSql := wSql + ') ';
//    wSql := wSql + ' ) WHERE (SCONSUMO <> 0) OR (SAFIXAR <> 0) OR (sValorAFixar < -0.5) OR (sValorAFixar > 0.5)';
    If FRomSaldo_Param.RG1Ordem.ItemIndex = 0 Then
       wSql := wSql + ' ORDER BY COD_FILIAL,COD_PRODUTO,COD_LOTE_TIPO'
    Else
       wSql := wSql + ' ORDER BY COD_FILIAL,DESC_CADASTRO,COD_PRODUTO,COD_LOTE_TIPO';

    QRSaldoFixar_Sintetico.Sql.Add(wSql);
    QRSaldoFixar_Sintetico.SetVariable('DT_EMISSAOI', FRomSaldo_Param.Me1DataI.Text);
    QRSaldoFixar_Sintetico.SetVariable('DT_EMISSAOF', FRomSaldo_Param.Me1DataF.Text);
    QRSaldoFixar_Sintetico.Open;
    If FRFixarSintetico_Res = Nil then
       FRFixarSintetico_Res := TFRFixarSintetico_Res.Create(Application);
    FRFixarSintetico_Res.QrlPeriodo.Caption := 'Filial:' + FRomSaldo_Param.Ed1Filial.Text + ' De ' + FRomSaldo_Param.Me1DataI.Text + ' Ate ' + FRomSaldo_Param.Me1DataF.Text;
    FRFixarSintetico_Res.QRLDepartamento.Caption := 'Departamento:' + FRomSaldo_Param.Ed1Departamento.Text;
    If Trim(FRomSaldo_Param.Me1Cadastro.Text) <> '' then
       FRFixarSintetico_Res.QrlPeriodo.Caption := FRFixarSintetico_Res.QrlPeriodo.Caption + ' Parceiro:'+Trim(FRomSaldo_Param.Me1CadastroParceiro.Text);
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAMBO') then
    begin
      FRFixarSintetico_Res.QRDBText7.DataField := '';
      FRFixarSintetico_Res.QRDBText5.DataField := '';
      FRFixarSintetico_Res.QREXPR2.Expression := '';
      FRFixarSintetico_Res.QREXPR4.Expression := '';
      FRFixarSintetico_Res.QREXPR5.Expression := '';
      FRFixarSintetico_Res.QREXPR6.Expression := '';
    end;


    if FRomSaldo_Param.RgPreview.ItemIndex = 0 then
       FRFixarSintetico_Res.QrPrimario.Preview
    else
       FRFixarSintetico_Res.QrPrimario.Print;

    QRSaldoFixar_Sintetico.Close;
  end;

end;

procedure TFRomaneioCad.RelDescontosRomaneiossEstornos1Click(
  Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[15].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
    with DmRomaneioAgricola do
    begin
      QRRomaneioDescontos.Close;

      if Trim(FRomaneioParam.Fm16Filial.MeFilial.Text) = '' then
        QRRomaneioDescontos.SetVariable('COD_FILIAL', null)
      else
        QRRomaneioDescontos.SetVariable('COD_FILIAL', Trim(FRomaneioParam.Fm16Filial.MeFilial.Text));
      if Trim(FRomaneioParam.Fm16Produto.MeProduto.Text) = '' then
        QRRomaneioDescontos.SetVariable('COD_PRODUTO', null)
      else
        QRRomaneioDescontos.SetVariable('COD_PRODUTO', Trim(FRomaneioParam.Fm16Produto.MeProduto.Text));
      if Trim(FRomaneioParam.Fm16Cadastro.MeCadastro.Text) = '' then
        QRRomaneioDescontos.SetVariable('COD_CADASTRO', null)
      else
        QRRomaneioDescontos.SetVariable('COD_CADASTRO', Trim(FRomaneioParam.Fm16Cadastro.MeCadastro.Text));
      if Trim(FRomaneioParam.Fm16Contrato.MeContrato.Text) = '' then
        QRRomaneioDescontos.SetVariable('COD_CONTRATO', null)
      else
        QRRomaneioDescontos.SetVariable('COD_CONTRATO', Trim(FRomaneioParam.Fm16Contrato.MeContrato.Text));
      if Trim(FRomaneioParam.ME16DataI.Text) = '/  /' then
        QRRomaneioDescontos.SetVariable('DT_MOVIMENTO_I', null)
      else
        QRRomaneioDescontos.SetVariable('DT_MOVIMENTO_I', FRomaneioParam.ME16DataI.Text);
      if Trim(FRomaneioParam.ME16DataF.Text) = '/  /' then
        QRRomaneioDescontos.SetVariable('DT_MOVIMENTO_F', null)
      else
        QRRomaneioDescontos.SetVariable('DT_MOVIMENTO_F', FRomaneioParam.ME16DataF.Text);

      if FRRomaneioDescontos = nil then
        FRRomaneioDescontos := TFRRomaneioDescontos.Create(Application);
      FRRomaneioDescontos.QRLFilial.Caption := FRomaneioParam.Fm16Filial.EdFilial.Text;
      FRRomaneioDescontos.QRLProduto.Caption := FRomaneioParam.Fm16Produto.EdProduto.Text;
      FRRomaneioDescontos.QRLCadastro.Caption := FRomaneioParam.Fm16Cadastro.EdCadastro.Text;
      FRRomaneioDescontos.QRLContrato.Caption := FRomaneioParam.Fm16Contrato.EdContrato.Text;
      FRRomaneioDescontos.QRLDtMovimento.Caption := FRomaneioParam.ME16DataI.Text + ' até ' + FRomaneioParam.ME16DataF.Text;
      QRRomaneioDescontos.open;

      if FRomaneioParam.RGPreview.ItemIndex = 0 then
        FRRomaneioDescontos.QRPrimario.Preview
      else
        FRRomaneioDescontos.QRPrimario.Print;
    end;
end;

procedure TFRomaneioCad.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFRomaneioCad.BtEmiteNotaClick(Sender: TObject);
Var wPagto,wDespesas,wFrete, wCodVeiculo, wPlacaMascara : String;
    wNumNota, wCodRomaneio : Integer;
    wQuant,wVolumes, wValFrete : Real;
    wCodTributacao : integer;
    wPeso, wDescObra, wDepartamento: String;
begin
  inherited;
  wPeso := '';
  wCodVeiculo := '';
  wCodRomaneio := DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Value;
  if (DMParamSistema.CodEmpresa = 'SRTERRA') or (DMParamSistema.CodEmpresa = 'BEDIN') or
     (DMParamSistema.CodEmpresa = 'STEIN') then //NÃO USAM MAIS A IMPRESSORA LX300 E PRECISAM QUE SAI NO FRPEDIDO OS PESOS.(ADICIONEI PARA APARECER NA OBS).
  begin                                        //Solicitado Paula - Junior 18/06/2019.
    if DMRomaneioAgricola.QRomaneioCOD_OBRA.Text <> '' then //Paula solicitou a obra na OBS para NFE e Pedido. Junior 18/08/2020
      wDescObra := ' Obra: ' + DMOracle.FastSelect('DESC_OBRA','TB_OBRA','COD_OBRA = ' + DMRomaneioAgricola.QRomaneioCOD_OBRA.Text);
    if DMParamSistema.CodEmpresa = 'SRTERRA' then
    begin
      wPeso := 'P.Bruto:'+DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Text + '(-)Tara:'+ DMRomaneioAgricola.QRomaneioQT_TARA.Text +
             '(=)' + FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value - DMRomaneioAgricola.QRomaneioQT_TARA.Value) +'kg' + wDescObra +
              ' DEP.:' + tRIM(Fm6Departamento.MeDepartamento.Text) + '-' + Trim(Fm6Departamento.EdDepartamento.Text);
    end
    else
      wPeso := 'P.Bruto:'+DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Text + '(-)Tara:'+ DMRomaneioAgricola.QRomaneioQT_TARA.Text +
             '(=)' + FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value - DMRomaneioAgricola.QRomaneioQT_TARA.Value) +'kg' + wDescObra;
  end;
  DmUsuario.Checar_Filial_Usuario(DMRomaneioAgricola.QRomaneioCOD_FILIAL.Text,'AGRICOLA');
  If DMRomaneioAgricola.QRomaneioCod_Operacao.Text = '' Then
     Raise exception.Create('Preencher operação');
  If DMRomaneioAgricola.QRomaneioVAL_PRECO_VENDA.Text = '' Then
     Raise Exception.Create('Preencher preço de venda');
  wVolumes := StrToFloat('0'+DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO = '+DMRomaneioAgricola.QRomaneioCod_Produto.Text));
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('Pk',DMRomaneioAgricola.QRomaneioCod_Operacao.Value);
  DMOperacao.QOperacao.Open;
  //Caso não tiver tributação na operação, busca a trib. do produto. Estava passando sempre a trib. 1.  Solicitação: LANI (SR). Junior 14/11/2016
  if DMOperacao.QOperacaoCOD_TRIBUTACAO.Value > 0 then
    wCodTributacao := DMOperacao.QOperacaoCOD_TRIBUTACAO.Value
  else
    wCodTributacao := StrToInt(DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO','COD_PRODUTO = '+DMRomaneioAgricola.QRomaneioCod_Produto.Text));

  wQuant := StrToFloat(MePesoBalanca_Diversos.Text) / wVolumes;
  with DMNotaSaida do
   begin
     Try
       DMOracle.DBCemapa.StartTransaction;
       pTR := False;
       pTRF := False;
       QNotaSaida.Close;
       QItemNF.Close;
       QNotaSaida.SetVariable('PK',0);
       QNotaSaida.Open;
       QItemNF.Open;
       QSomaItemNota.Open;
       wNumNota := 0;
       If RGPagto.ItemIndex = 0 Then
          wPagto := '1';
       If RGPagto.ItemIndex = 1 Then
          wPagto := '2'
       Else
          wPagto := '3';
       wDespesas := DMRomaneioAgricola.QRomaneioVAL_DESPESAS.Text;
       wFrete := DMRomaneioAgricola.QRomaneioVAL_DESPESAS.Text;
       If DMRomaneioAgricola.QRomaneioCod_Transportadora.Text <> '' Then
          wDespesas := ''  // quando nao tem transportador é despesa
       Else
          wFrete := '';  // quando tem transportador é frete
       FContrato_Vend.GeraNF(DMRomaneioAgricola.QRomaneioCod_Operacao.Value,
              DMOperacao.QOperacaoCod_Serie.Value,
              DMOperacao.QOperacaoCOD_SERIE_MODELO.Value,
              RoundTo(wQuant,-2),//usando o RoundTo para arredondamento(Problema na validação do NFE(xml). Junior-13/09/2016.
              DMRomaneioAgricola.QRomaneioVAL_PRECO_VENDA.Value,
              DMRomaneioAgricola.QRomaneioCOD_FILIAL.Value,
              DMRomaneioAgricola.QRomaneioCOD_CADASTRO.Value,
              DMRomaneioAgricola.QRomaneioCOD_PRODUTO.Value,
              0,
              DMRomaneioAgricola.QRomaneioCod_Transportadora.Text,
              wCodtributacao, //1,
              '',
              DMRomaneioAgricola.QRomaneioDESC_PLACA.Value,
              '',
              DMRomaneioAgricola.QRomaneioDESC_OBSERVACAO.Value,
              wPeso,//'',  {pobs1}
              wNumNota,DateToStr(Date),
              wPagto,'',0,'',DateToStr(Date),'',
              IntToStr(wNumNota),'',wFrete,'',DMRomaneioAgricola.QRomaneioDT_EMISSAO.Text,
              '','','','','','','','',
              Trim(Fm6Departamento.MeDepartamento.Text),'',
              wDespesas,'','',DMRomaneioAgricola.QRomaneioCod_Obra.Text,'');
       if DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Text <> '' then
         QNotaSaidaCOD_ROMANEIO_AGRICOLA.Value := DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Value;
       FContrato_Vend.ConfirmaNF;
       with DMRomaneioAgricola do
       begin
         if (DMParamSistema.CodEmpresa = 'ITATIBA') then
         begin
           wPlacaMascara := Copy(QRomaneioDESC_PLACA.AsString, 1, 3) + '-' + Copy(QRomaneioDESC_PLACA.AsString, 4, 4);
           wCodVeiculo := DMOracle.FastSelect('COD_VEICULO','TB_VEICULO','NUM_PLACA = ' + QuotedStr(wPlacaMascara) );
           if (wCodVeiculo <> '') and (QRomaneioVAL_TOTAL_TARIFA.Value > 0) then
             InsereRecDespesaVeiculo(strtoint(wCodVeiculo), StrToInt(QRomaneioCOD_PRODUTO.AsString), QRomaneioCOD_ROMANEIO_AGRICOLA.Value , QRomaneioVAL_TOTAL_TARIFA.Value,
                                         QRomaneioDT_EMISSAO.Value, QRomaneioDT_EMISSAO.Value,QRomaneioDT_EMISSAO.Value);
         end;
       end;
       BtEmiteNota.Enabled := False;
       If DMOracle.DBCemapa.InTransaction Then
          DMOracle.DBCemapa.Commit;
       QNotaSaida.Close;
       QItemNF.Close;
     except
       DMOracle.DBCemapa.Rollback;
        QNotaSaida.Close;
       QItemNF.Close;
       Raise;
       // Exception.Create('Erro! Não foi possível confirmar os dados para esta Nota.');
     end;
   end
end;

procedure TFRomaneioCad.InsereRecDespesaVeiculo(wCodVeiculo, wCodProduto, wCodRomaneio: Integer; wTotalTarifa : real; wDtDespesa, wDtInicio, wDtFim : TDate);
begin
  with DMRomaneioAgricola, DMDespesaRecup, dmnotasaida do
  begin
    try
        DMOracle.DBCemapa.StartTransaction;
        QDespesaRecupCad.Close;
        QDespesaRecupCad.Open;
        QDespesaRecupCad.Insert;
        QDespesaRecupCadCOD_VEICULO.Value := wCodVeiculo;
        QDespesaRecupCadCOD_PRODUTO.Value := wCodProduto;
        QDespesaRecupCadQT_QUANTIDADE.Value := 1;
        QDespesaRecupCadVL_UNITARIO.Value := wTotalTarifa;
        QDespesaRecupCadDT_DESPESA.Value := wDtDespesa;
        QDespesaRecupCadDT_INICIO.Value := wDtInicio;
        QDespesaRecupCadDT_FIM.Value := wDtFim;
        QDespesaRecupCadCOD_ROMANEIO_AGRICOLA.Value := wCodRomaneio;
        QDespesaRecupCad.Post;
        DMOracle.DBCemapa.Commit;
    Except
      DMOracle.DBCemapa.Rollback;
      QDespesaRecupCad.Cancel;
      raise;
    end;
  end;
end;

procedure TFRomaneioCad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  If (DMRomaneioAgricola.QRomaneioIND_SITUACAO.Value = 'A') Or
     (DMRomaneioAgricola.QRomaneioIND_SITUACAO.Value = 'E') Then
   Begin
     DBEdit8.Enabled := True;
     DBEdit8.Color := clWindow;
     BtConsCadastro.Enabled := True;
   End
  Else
   Begin
     DBEdit8.Enabled := False;
     DBEdit8.Color := clBtnFace;
     BtConsCadastro.Enabled := False;
   End
end;

procedure TFRomaneioCad.BtFreteiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Transportadora.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFRomaneioCad.BtArranquioClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Arranquio.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFRomaneioCad.TsTofecoEnter(Sender: TObject);
begin
  inherited;
  TsRomaneioEnter(Self);
end;

procedure TFRomaneioCad.RomaneioporFreteiro1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[17].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
    with DmRomaneioAgricola do
    begin
      QRFreteiro.Close;

      if Trim(FRomaneioParam.FmFilial18.MeFilial.Text) = '' then
        QRFreteiro.SetVariable('COD_FILIAL', Null)
      else
        QRFreteiro.SetVariable('COD_FILIAL', Trim(FRomaneioParam.FmFilial18.MeFilial.Text));

      if Trim(FRomaneioParam.FmCadastro18.MeCadastro.Text) = '' then
        QRFreteiro.SetVariable('COD_CADASTRO', Null)
      else
        QRFreteiro.SetVariable('COD_CADASTRO', Trim(FRomaneioParam.FmCadastro18.MeCadastro.Text));
      // Adicionado a opção de Ordenação de apresentação dos dados pelo próprio usuário.
      //10.01.2011 - Junior.
      QRFreteiro.SQL[QRFreteiro.SQL.Count-1] := '';
      Case FRomaneioParam.CB9Ordem.ItemIndex of
        0 : QRFreteiro.SQL.Add('FRETEIRO.COD_CADASTRO'            );
        1 : QRFreteiro.SQL.Add('FRETEIRO.NOME'                    );
        2 : QRFreteiro.SQL.Add('TB_ROMANEIO_AGRICOLA.DT_EMISSAO'  );
        3 : QRFreteiro.SQL.Add('TB_ROMANEIO_AGRICOLA.NUM_ROMANEIO');
        else
          raise Exception.Create('Nenhuma Ordem Selecionada!');
      End; // CASE

      {ADICIONADO ESSE IF PARA VERIFICAR SE AS DATAS ESTÃO EM BRANCO.
                 SE DEIXASSE EM BRANCO GERAVA UM ERRO}
      if trim(FRomaneioParam.FmData18.MeDtInicial.Text) <> '' then
      begin
       QRFreteiro.SetVariable('DT_EMISSAO_INI', FRomaneioParam.FmData18.MeDtInicial.Text);
       if trim(FRomaneioParam.FmData18.MeDtFinal.Text) <> '' then
         QRFreteiro.SetVariable('DT_EMISSAO_FIN', trim(FRomaneioParam.FmData18.MeDtFinal.Text))
       else
         QRFreteiro.SetVariable('DT_EMISSAO_FIN', DateToStr(Date));
     end
     else
       Raise Exception.Create('Data inicial deve ser informada');

     //comentado este código por ter sido adicionado a verificação em caso do campo não estar preenchido.
     {  QRFreteiro.SetVariable('DT_EMISSAO_INI', FRomaneioParam.FmData18.MeDtInicial.Text);
        QRFreteiro.SetVariable('DT_EMISSAO_FIN', FRomaneioParam.FmData18.MeDtFinal.Text);}

      if FRRomaneioFreteiro = nil then
         FRRomaneioFreteiro := TFRRomaneioFreteiro.Create(Application);
      FRRomaneioFreteiro.QRLTitulo.Caption := 'Relatório de Romaneio por Freteiro ' +
         FRomaneioParam.FmData18.MeDtInicial.Text + ' Até ' + FRomaneioParam.FmData18.MeDtFinal.Text;

      QRFreteiro.open;
      if FRomaneioParam.RGPreview.ItemIndex = 0 then
        FRRomaneioFreteiro.QRPrimario.Preview
      else
        FRRomaneioFreteiro.QRPrimario.Print;
    end;
end;

procedure TFRomaneioCad.RomaneioporArranquio1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[17].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
    with DmRomaneioAgricola do
    begin
      QRArranquio.Close;

      if Trim(FRomaneioParam.FmFilial18.MeFilial.Text) = '' then
        QRArranquio.SetVariable('COD_FILIAL', Null)
      else
        QRArranquio.SetVariable('COD_FILIAL', Trim(FRomaneioParam.FmFilial18.MeFilial.Text));

      if Trim(FRomaneioParam.FmCadastro18.MeCadastro.Text) = '' then
        QRArranquio.SetVariable('COD_CADASTRO', Null)
      else
        QRArranquio.SetVariable('COD_CADASTRO', Trim(FRomaneioParam.FmCadastro18.MeCadastro.Text));

      // Adicionado a opção de Ordenação de apresentação dos dados pelo próprio usuário.
      //10.01.2011 - Junior.
      QRFreteiro.SQL[QRFreteiro.SQL.Count-1] := '';
      Case FRomaneioParam.CB9Ordem.ItemIndex of
        0 : QRFreteiro.SQL.Add('ARRANQUIO.COD_CADASTRO'           );
        1 : QRFreteiro.SQL.Add('CADASTRO.NOME'                    );
        2 : QRFreteiro.SQL.Add('TTB_ROMANEIO_AGRICOLA.DT_EMISSAO' );
        3 : QRFreteiro.SQL.Add('TB_ROMANEIO_AGRICOLA.NUM_ROMANEIO');
        else
          raise Exception.Create('Nenhuma Ordem Selecionada!');
      End; // CASE

      {ADICIONADO ESSE IF PARA VERIFICAR SE AS DATAS ESTÃO EM BRANCO.
                 SE DEIXASSE EM BRANCO GERAVA UM ERRO}
      if trim(FRomaneioParam.FmData18.MeDtInicial.Text) <> '' then
      begin
       QRFreteiro.SetVariable('DT_EMISSAO_INI', FRomaneioParam.FmData18.MeDtInicial.Text);
       if trim(FRomaneioParam.FmData18.MeDtFinal.Text) <> '' then
         QRFreteiro.SetVariable('DT_EMISSAO_FIN', trim(FRomaneioParam.FmData18.MeDtFinal.Text))
       else
         QRFreteiro.SetVariable('DT_EMISSAO_FIN', DateToStr(Date));
     end
     else
       Raise Exception.Create('Data inicial deve ser informada');
      {QRArranquio.SetVariable('DT_EMISSAO_INI', FRomaneioParam.FmData18.MeDtInicial.Text);
      QRArranquio.SetVariable('DT_EMISSAO_FIN', FRomaneioParam.FmData18.MeDtFinal.Text);}

      if FRRomaneioArranquio = nil then
        FRRomaneioArranquio := TFRRomaneioArranquio.Create(Application);
      FRRomaneioArranquio.QRLTitulo.Caption := 'Relatório de Romaneio por Arranquio ' +
         FRomaneioParam.FmData18.MeDtInicial.Text + ' Até ' + FRomaneioParam.FmData18.MeDtFinal.Text;
      QRArranquio.open;

      if FRomaneioParam.RGPreview.ItemIndex = 0 then
        FRRomaneioArranquio.QRPrimario.Preview
      else
        FRRomaneioArranquio.QRPrimario.Print;
    end;
end;

procedure TFRomaneioCad.BtObraConsClick(Sender: TObject);
begin
  inherited;
  If FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  If FObraCons.ShowModal = mrOk then
    DMRomaneioAgricola.QBalancaCod_Obra.Value := DMObra.QObra_ConsCod_Obra.Value;
end;

procedure TFRomaneioCad.BtTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Transportadora.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEdit184Exit(Self); // para calcular valor do frete
end;

{ TLeBalancaEPM }

function TLeBalancaEPM.IsError: Boolean;
begin
  Result := (FUltResult = 0);
end;

function TLeBalancaEPM.Leitura(var Param: String): Integer;
var
  I: Integer;
begin
  if FComando = '' then
    FComando := ':9600,E,8,2';
  ConfiguraRs(Param + FComando);
  Param := '';
  for I := 1 to 50 do
    Param := Param + chr(32);
  FUltResult := LePeso(Param);
  Result := FUltResult;
  if not IsError then
    Result := StrToInt(Copy(Param,1,7));
end;

{ TLeBalancaFactory }

class function TLeBalancaFactory.GetLeBalanca(Chave: String): TLeBalanca;
begin
  Result := nil;
  if Chave = BALANCA_EPM then
    Result := TLeBalancaEPM.Create
  else if Chave = BALANCA_SATURNO then
    Result := TLeBalancaSaturno.Create
  else if Chave = BALANCA_EPM4000 then
    Result := TLeBalancaEPM4000.Create
  else if Chave = BALANCA_WT3000 then
    Result := TLeBalancaWT3000.Create;

end;

{ TLeBalanca }

function TLeBalanca.IsError: Boolean;
begin
  Result := False;
end;

{ TLeBalancaSaturno }

function TLeBalancaSaturno.Leitura(var Param: String): Integer;
begin
  Result := 0;
  case StrToInt(Bib.LimpaNumero(Param)) of
    1:
    begin
      AbreCom1;
      Result := Trunc(LePeso1);
      FechaCom1;
    end;
    2:
    begin
      AbreCom2;
      Result := Trunc(LePeso2);
      FechaCom2;
    end;
    3:
    begin
      AbreCom3;
      Result := Trunc(LePeso3);
      FechaCom3;
    end;
    4:
    begin
      AbreCom4;
      Result := Trunc(LePeso4);
      FechaCom4;
    end;
  end;
end;

{ TLeBalancaWT3000 }
function TLeBalancaWT3000.Leitura(var Param: String): Integer;
var
  FBalancaAgr: TBalanca;
begin
  if FBalancaAgr = nil then
      FBalancaAgr := TBalanca.Create;
  FBalancaAgr.AbreSerial(StrToInt(Copy(Param, 4,1)), 9600, 8, 1, 0, true);
  result := StrToInt(FBalancaAgr.LePesoWT3000);
  FBalancaAgr.FechaSerial;
  FreeAndNil(FBalancaAGr);
end;

{ TLeBalancaEPM4000 }

function TLeBalancaEPM4000.Leitura(var Param: String): Integer;
begin
  FComando := ':9600,N,8,2';
  Result := inherited Leitura(Param);
end;

procedure TFRomaneioCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = nil then
     FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = MrOK then
     DMRomaneioAgricola.QRomaneioCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;

end;

procedure TFRomaneioCad.RomaneioporPlacas1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioParam = Nil then
    FRomaneioParam := TFRomaneioParam.Create(Application);
  FRomaneioParam.PGRelatorio.Pages[18].TabVisible := True;
  If FRomaneioParam.ShowModal = mrOk then
    with DmRomaneioRel do
    begin
      QRRomPesoIndiceRenda.Close;

      if Trim(FRomaneioParam.FmBalanca19.MeBalanca.Text) = '' then
        QRRomPesoIndiceRenda.SetVariable('DESC_PLACA', Null)
      else
        QRRomPesoIndiceRenda.SetVariable('DESC_PLACA', Trim(FRomaneioParam.FmBalanca19.MeBalanca.Text));

      if Trim(FRomaneioParam.FmProduto19.MeProduto.Text) = '' then
        QRRomPesoIndiceRenda.SetVariable('COD_PRODUTO', Null)
      else
        QRRomPesoIndiceRenda.SetVariable('COD_PRODUTO', Trim(FRomaneioParam.FmProduto19.MeProduto.Text));

      if trim(FRomaneioParam.FmDatas19.MeDtInicial.Text) <> '' then
      begin
        QRRomPesoIndiceRenda.SetVariable('DT_INICIAL',Trim(FRomaneioParam.FmDatas19.MeDtInicial.Text));
        QRRomPesoIndiceRenda.SetVariable('DT_FINAL', trim(FRomaneioParam.FmDatas19.MeDtFinal.Text));
      end
      else
        Raise Exception.Create('É necessário informar a Data de Referência');

      if FRRomPesoIndiceRenda = nil then
        FRRomPesoIndiceRenda := TFRRomPesoIndiceRenda.Create(Application);
      FRRomPesoIndiceRenda.QRLTitulo.Caption := 'Relatório de Romaneio Indice por Renda ' +
         FRomaneioParam.FmDatas19.MeDtInicial.Text + ' Até ' + FRomaneioParam.FmDatas19.MeDtFinal.Text;
      FRRomPesoIndiceRenda.QRLProduto.Caption := 'Produto: ' + Trim(FRomaneioParam.FmProduto19.EdProduto.Text);

      if FRomaneioParam.RGAgrupado19.ItemIndex = 1 then
      begin
        FRRomPesoIndiceRenda.QRGroup3.Enabled := False;
        FRRomPesoIndiceRenda.QRBand4.Enabled := False;
      end
      else
      begin
        FRRomPesoIndiceRenda.QRGroup3.Enabled := True;
        FRRomPesoIndiceRenda.QRBand4.Enabled := True;
      end;

      QRRomPesoIndiceRenda.open;

      if FRomaneioParam.RGPreview.ItemIndex = 0 then
        FRRomPesoIndiceRenda.QRPrimario.Preview
      else
        FRRomPesoIndiceRenda.QRPrimario.Print;
    end;
end;

procedure TFRomaneioCad.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  TsImposto.TabVisible := (TsRomaneio.TabVisible or TsTofeco.TabVisible);
end;

procedure TFRomaneioCad.DBPImpostoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;          
  Classe := TFImpostoCons;
  FormConsulta := @FImpostoCons;
end;

procedure TFRomaneioCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  TsImposto.TabVisible := (TsRomaneio.TabVisible or TsTofeco.TabVisible);
end;

procedure TFRomaneioCad.SBPesagemRendaClick(Sender: TObject);
begin
  inherited;
  if FPesagemRenda = Nil then
    FPesagemRenda := TFPesagemRenda.Create(Application);
  FPesagemRenda.ShowModal;
end;

procedure TFRomaneioCad.DBEdit184Exit(Sender: TObject);
Var wKM : Real;
begin
  inherited;
  If (DMRomaneioAgricola.QRomaneioCOD_TRANSPORTADORA.Text <> '') And
     (DMRomaneioAgricola.QRomaneioCOD_OBRA.Text <> '') Then
   Begin
     wKM := StrToInt(DMOracle.BuscaNome('SELECT NUM_DISTANCIA_KM FROM TB_OBRA','COD_OBRA = '+DMRomaneioAgricola.QRomaneioCOD_OBRA.Text));
     DMRomaneioAgricola.QRomaneioVAL_DESPESAS.Value := DMRomaneioAgricola.QRomaneioVAL_FRETE_KM.Value * wKM * StrToFloat(MePesoBalanca_Diversos.Text) / 1000;
   End;
end;

procedure TFRomaneioCad.BtnImgPesagemEntradaClick(Sender: TObject);
var
  dirTemp1, dirTemp2 : String;
begin
  inherited;
  with DMParamSistema do
  begin
    if (QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S') then
    begin
      if (QParamSistemaDESC_IP_DVR.Value <> '') and (QParamSistemaDESC_IP_CAM1.Value = '') and (QParamSistemaDESC_IP_CAM2.Value = '')  then
      begin //CAMERA POR DVR HykVision
        if DMRomaneioAgricola.DsBalanca.State in [DsInsert, DsEdit] then
        begin
          dirTemp1 := ExtractFilePath(Application.ExeName) + 'tempCam1.jpeg';
          dirTemp2 := ExtractFilePath(Application.ExeName) + 'tempCam2.jpeg';
          // Canal vem do parâmetro — ex: CAM1 = canal 101, CAM2 = canal 201
          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_DVR.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                      QParamSistemaNUM_CANAL_DVR01.Value, dirTemp1) then
            incluiImagem(dirTemp1, 'IMGENTRADA1')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 1');

          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_DVR.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                     QParamSistemaNUM_CANAL_DVR02.Value, dirTemp2) then
            incluiImagem(dirTemp2, 'IMGENTRADA2')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 2');
        end
        else
          raise Exception.Create('Pesagem não está em modo de alteração');
        end
      else if (QParamSistemaDESC_IP_DVR.Value = '') and (QParamSistemaDESC_IP_CAM1.Value <> '') and (QParamSistemaDESC_IP_CAM2.Value <> '')  then
      begin //CAMERA HykVision por IP (sem DVR)
        if DMRomaneioAgricola.DsBalanca.State in [DsInsert, DsEdit] then
        begin
          dirTemp1 := ExtractFilePath(Application.ExeName) + 'tempCam1.jpeg';
          dirTemp2 := ExtractFilePath(Application.ExeName) + 'tempCam2.jpeg';
          // Canal vem do parâmetro — ex: CAM1 = canal 101, CAM2 = canal 201
          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_CAM1.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                      QParamSistemaNUM_CANAL_DVR01.Value, dirTemp1) then
            incluiImagem(dirTemp1, 'IMGENTRADA1')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 1');

          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_CAM2.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                     QParamSistemaNUM_CANAL_DVR02.Value, dirTemp2) then
            incluiImagem(dirTemp2, 'IMGENTRADA2')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 2');
        end
      end
      else
      begin
        dirTemp1 := ExtractFilePath(Application.ExeName) +'tempPesagem1.jpeg';
        dirTemp2 := ExtractFilePath(Application.ExeName) +'tempPesagem2.jpeg';
        if FCapturaPesagemEntrada = nil then
          FCapturaPesagemEntrada := TFCapturaPesagemEntrada.Create(Application);
        FCapturaPesagemEntrada.ShowModal;
        FCapturaPesagemEntrada.ModalResult := MrOk;
        if FCapturaPesagemEntrada.ModalResult = mrOK then
        begin
          FCapturaPesagemEntrada.Frame_Video1.Image1.Picture.SaveToFile(dirTemp1);
          incluiImagem(dirTemp1,'IMGENTRADA1');
          FCapturaPesagemEntrada.Frame_Video2.Image1.Picture.SaveToFile(dirTemp2);
          incluiImagem(dirTemp2,'IMGENTRADA2');
        end; //WEB CAM
      end;
    end;
  end;
end;

procedure TFRomaneioCad.BtnImgPesagemSaidaClick(Sender: TObject);
var dirTemp1, dirTemp2 : String;
begin
  inherited;
  with DMParamSistema do
  begin
    if (QParamSistemaIND_CAMERA_PESAGEM_BALANCA.Value = 'S') then
    begin
      if (QParamSistemaDESC_IP_DVR.Value <> '') and (QParamSistemaDESC_IP_CAM1.Value = '') and (QParamSistemaDESC_IP_CAM2.Value = '')  then
      begin //CAMERA POR DVR HykVision
        if DMRomaneioAgricola.DsBalanca.State in [DsInsert, DsEdit] then
        begin
          dirTemp1 := ExtractFilePath(Application.ExeName) + 'tempCam1.jpeg';
          dirTemp2 := ExtractFilePath(Application.ExeName) + 'tempCam2.jpeg';
          // Canal vem do parâmetro — ex: CAM1 = canal 101, CAM2 = canal 201
          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_DVR.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                      QParamSistemaNUM_CANAL_DVR01.Value, dirTemp2) then
            incluiImagem(dirTemp1, 'IMGSAIDA1')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 2');

          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_DVR.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                     QParamSistemaNUM_CANAL_DVR02.Value, dirTemp1) then
            incluiImagem(dirTemp2, 'IMGSAIDA2')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 1');
        end
        else
          raise Exception.Create('Pesagem não está em modo de alteração');
      end
      else if (QParamSistemaDESC_IP_DVR.Value = '') and (QParamSistemaDESC_IP_CAM1.Value <> '') and (QParamSistemaDESC_IP_CAM2.Value <> '')  then
      begin //CAMERA HykVision por IP (Sem DVR)
        if DMRomaneioAgricola.DsBalanca.State in [DsInsert, DsEdit] then
        begin
          dirTemp1 := ExtractFilePath(Application.ExeName) + 'tempCam1.jpeg';
          dirTemp2 := ExtractFilePath(Application.ExeName) + 'tempCam2.jpeg';
          // Canal vem do parâmetro — ex: CAM1 = canal 101, CAM2 = canal 201
          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_CAM1.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                      QParamSistemaNUM_CANAL_DVR01.Value, dirTemp1) then
            incluiImagem(dirTemp1, 'IMGSAIDA1')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 1');

          if BaixarSnapshotHikvision(QParamSistemaDESC_IP_CAM2.Value,QParamSistemaDESC_USUARIO_DVR.Value, QParamSistemaDESC_SENHA_DVR.Value,
                                     QParamSistemaNUM_CANAL_DVR02.Value, dirTemp2) then
            incluiImagem(dirTemp2, 'IMGSAIDA2')
          else
            ShowMessage('Falha ao capturar imagem da Câmera 2');
        end
      end
      else
      begin
        dirTemp1 := ExtractFilePath(Application.ExeName) +'tempPesagem1.jpeg';
        dirTemp2 := ExtractFilePath(Application.ExeName) +'tempPesagem2.jpeg';
        if FCapturaPesagemEntrada = nil then
          FCapturaPesagemEntrada := TFCapturaPesagemEntrada.Create(Application);
        FCapturaPesagemEntrada.ShowModal;
        FCapturaPesagemEntrada.ModalResult := MrOk;
        if FCapturaPesagemEntrada.ModalResult = mrOK then
        begin
          FCapturaPesagemEntrada.Frame_Video1.Image1.Picture.SaveToFile(dirTemp1);
          incluiImagem(dirTemp1,'IMGENTRADA1');
          FCapturaPesagemEntrada.Frame_Video2.Image1.Picture.SaveToFile(dirTemp2);
          incluiImagem(dirTemp2,'IMGENTRADA2');
        end; //WEB CAM
      end;
    end;
  end;
end;

procedure TFRomaneioCad.MeDescontoManualUmidadeExit(Sender: TObject);
var wDesconto, wLiquido : Real;
begin
  inherited;
  if Trim(MeDescontoManualUmidade.Text) <> '' then
  begin
    with DMRomaneioAgricola do
    begin
      QRomaneioPERC_DESCONTO.Value := RoundTo((StrToFloat(MeDescontoManualUmidade.Text) / StrToFloat(MePesoBalanca.Text)  * 100),-6);
      QRomaneioPERC_UMIDADE.Value :=  RoundTo((StrToFloat(MeDescontoManualUmidade.Text) / StrToFloat(MePesoBalanca.Text)  * 100),-6);
      CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                  QRomaneioPerc_desconto.Value,
                                  QRomaneioPerc_ardidos.Value,
                                  QRomaneioPerc_Umidade.Value,
                                  QRomaneioPerc_Impureza.Value,
                                  QRomaneioPerc_Avariado.Value,
                                  QRomaneioPerc_Quebrados.Value,
                                  QRomaneioPerc_Diversos.Value,
                                  QRomaneioCod_Romaneio_Agricola.Value,
                                  QRomaneioCod_Produto.Value,
                                  QRomaneioPerc_Triguilho.Value,
                                  QRomaneioPerc_Tolera_Ardidos.Value,
                                  QRomaneioPerc_Tolera_Impureza.Value,
                                  QRomaneioPerc_Tolera_Avariado.Value,
                                  QRomaneioPerc_Beneficiado.Value,
                                  wLiquido, wDesconto);

    MeDesconto.Text := FloatToStr(wDesconto);
    MeLiquido.Text := FloatToStr(wLiquido);
    end;
  end;
end;

procedure TFRomaneioCad.MeDescontoManualImpurezaExit(Sender: TObject);
begin
  inherited;
  if Trim(MeDescontoManualImpureza.Text) <> '' then
  begin
    with DMRomaneioAgricola do
    begin
    QRomaneioPERC_IMPUREZA.Value := RoundTo((StrToFloat(MeDescontoManualImpureza.Text) / StrToFloat(MePesoBalanca.Text)  * 100),-6);
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                  QRomaneioPerc_desconto.Value,
                                  QRomaneioPerc_ardidos.Value,
                                  QRomaneioPerc_Umidade.Value,
                                  QRomaneioPerc_Impureza.Value,
                                  QRomaneioPerc_Avariado.Value,
                                  QRomaneioPerc_Quebrados.Value,
                                  QRomaneioPerc_Diversos.Value,
                                  QRomaneioCod_Romaneio_Agricola.Value,
                                  QRomaneioCod_Produto.Value,
                                  QRomaneioPerc_Triguilho.Value,
                                  QRomaneioPerc_Tolera_Ardidos.Value,
                                  QRomaneioPerc_Tolera_Impureza.Value,
                                  QRomaneioPerc_Tolera_Avariado.Value,
                                  QRomaneioPerc_Beneficiado.Value,
                                  wLiquido, wDesconto);

    MeDesconto.Text := FloatToStr(wDesconto);
    MeLiquido.Text := FloatToStr(wLiquido);
    end;
  end;
end;

procedure TFRomaneioCad.MeDescontoManualArdidoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeDescontoManualArdido.Text) <> '' then
  begin
    with DMRomaneioAgricola do
    begin
    QRomaneioPERC_ARDIDOS.Value := (StrToFloat(MeDescontoManualArdido.Text) / StrToFloat(MePesoBalanca.Text) ) * 100;
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                  QRomaneioPerc_desconto.Value,
                                  QRomaneioPerc_ardidos.Value,
                                  QRomaneioPerc_Umidade.Value,
                                  QRomaneioPerc_Impureza.Value,
                                  QRomaneioPerc_Avariado.Value,
                                  QRomaneioPerc_Quebrados.Value,
                                  QRomaneioPerc_Diversos.Value,
                                  QRomaneioCod_Romaneio_Agricola.Value,
                                  QRomaneioCod_Produto.Value,
                                  QRomaneioPerc_Triguilho.Value,
                                  QRomaneioPerc_Tolera_Ardidos.Value,
                                  QRomaneioPerc_Tolera_Impureza.Value,
                                  QRomaneioPerc_Tolera_Avariado.Value,
                                  QRomaneioPerc_Beneficiado.Value,
                                  wLiquido, wDesconto);

    MeDesconto.Text := FloatToStr(wDesconto);
    MeLiquido.Text := FloatToStr(wLiquido);
    end;
  end;
end;

procedure TFRomaneioCad.MeDescontoManualAvariadoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeDescontoManualAvariado.Text) <> '' then
  begin
    with DMRomaneioAgricola do
    begin
    QRomaneioPERC_AVARIADO.Value := (StrToFloat(MeDescontoManualAvariado.Text) / StrToFloat(MePesoBalanca.Text) ) * 100;
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                  QRomaneioPerc_desconto.Value,
                                  QRomaneioPerc_ardidos.Value,
                                  QRomaneioPerc_Umidade.Value,
                                  QRomaneioPerc_Impureza.Value,
                                  QRomaneioPerc_Avariado.Value,
                                  QRomaneioPerc_Quebrados.Value,
                                  QRomaneioPerc_Diversos.Value,
                                  QRomaneioCod_Romaneio_Agricola.Value,
                                  QRomaneioCod_Produto.Value,
                                  QRomaneioPerc_Triguilho.Value,
                                  QRomaneioPerc_Tolera_Ardidos.Value,
                                  QRomaneioPerc_Tolera_Impureza.Value,
                                  QRomaneioPerc_Tolera_Avariado.Value,
                                  QRomaneioPerc_Beneficiado.Value,
                                  wLiquido, wDesconto);

    MeDesconto.Text := FloatToStr(wDesconto);
    MeLiquido.Text := FloatToStr(wLiquido);
    end;
  end;
end;

procedure TFRomaneioCad.DBEdit54Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit54.Text);
end;

procedure TFRomaneioCad.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit9.Text);
end;

procedure TFRomaneioCad.BtEncerraClick(Sender: TObject);
begin
  inherited;
{Apenas para a Inovar. Solicitado por Wellington para finalizar os romaneios que são de prestação de serviços e não são gerados notas de entrada.
Alex 11/11/2023}  
  with DMOracle do
  begin
    if ( FastSelect('IND_TIPO_ROMANEIO','TB_ROMANEIO_AGRICOLA','COD_ROMANEIO_AGRICOLA = ' + DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Text) = 'ROMANEIO') then
    begin
      try
//Para encerrar o Romaneio.
        DMOracle.DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET IND_SITUACAO = ' + chr(39) + 'N' + chr(39) );
        QExecSQL.SQL.Add('WHERE COD_ROMANEIO_AGRICOLA = ' + DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Text);
        QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        ShowMessage('Romaneio encerrado.');
//Fim
//Para gravar o usuario que realizou a operação.
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_AGRICOLA SET COD_USUARIO = ' + chr(39) + IntToStr( DMUsuario.CodUsuarioCorrente) + chr(39) );
        QExecSQL.SQL.Add('WHERE COD_ROMANEIO_AGRICOLA = ' + DMRomaneioAgricola.QRomaneioCOD_ROMANEIO_AGRICOLA.Text);
        QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
//fim
        FRomaneioCad.SBRefreshClick(Sender);
      except
        DMOracle.DBCemapa.Rollback;
          raise Exception.Create('O romaneio não pode ser finalizado.');
      end;
    end
    else
      raise Exception.Create('O romaneio não pode ser finalizado sem nota.');
    end;
end;

procedure TFRomaneioCad.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
//  ShowMessage(GetEnumName(TypeInfo(TNavigateBtn), Ord(Button)));
//  ShowMessage(IntToStr(Ord(Button)));
  if Ord(Button) = 4 then //4 (nbInsert) nbInsert não reconhece. Evitar o erro esporádico de Record By User  na Cereais Iguaçu //Junior 16/06/2026.
  begin
   // DMRomaneioAgricola.QBalanca.Refresh;
  end;
end;

function TFRomaneioCad.BaixarSnapshotHikvision(
  const AIP, AUsuario, ASenha: String;
  ACanal: Integer;
  const AArquivoDestino: String): Boolean;

var
  HTTP: TIdHTTP;
  Stream: TMemoryStream;
  URL, AuthHeader, Realm, Nonce, URI: String;
  HA1, HA2, HResp, DigestHeader: String;
  NC, CNonce: String;

  function ExtrairValor(const AHeader, AChave: String): String;
  var
    P, PFim: Integer;
  begin
    Result := '';
    P := Pos(AChave + '="', AHeader);
    if P = 0 then Exit;
    Inc(P, Length(AChave) + 2);
    PFim := PosEx('"', AHeader, P);
    if PFim = 0 then Exit;
    Result := Copy(AHeader, P, PFim - P);
  end;

  function IntToHexStr(Value: Integer; Digits: Integer): String;
  begin
    Result := UpperCase(Format('%.*x', [Digits, Value]));
  end;

begin
  Result := False;

  URI := Format('/ISAPI/Streaming/channels/%d/picture', [ACanal]);
  URL := 'http://' + AIP + URI;

  HTTP := TIdHTTP.Create(nil);
  Stream := TMemoryStream.Create;

  try
    HTTP.Request.BasicAuthentication := False;
    HTTP.HandleRedirects := True;
    HTTP.ReadTimeout := 5000;

    // 1. Primeira chamada (gera 401 e desafio Digest)
    try
      HTTP.Get(URL, Stream);
    except
      on E: EIdHTTPProtocolException do
      begin
        if HTTP.ResponseCode <> 401 then
          raise;
      end;
    end;

    AuthHeader := HTTP.Response.RawHeaders.Values['WWW-Authenticate'];
    if AuthHeader = '' then
      raise Exception.Create('WWW-Authenticate não retornado pela câmera');

    Realm := ExtrairValor(AuthHeader, 'realm');
    Nonce := ExtrairValor(AuthHeader, 'nonce');

    if (Realm = '') or (Nonce = '') then
      raise Exception.Create('Realm ou Nonce inválido');

    // 2. Digest qop=auth
    NC := '00000001';
    CNonce := IntToHexStr(Random(MaxInt), 8);

    HA1 := MD5Hex(AUsuario + ':' + Realm + ':' + ASenha);
    HA2 := MD5Hex('GET:' + URI);

    HResp := MD5Hex(
      HA1 + ':' +
      Nonce + ':' +
      NC + ':' +
      CNonce + ':' +
      'auth' + ':' +
      HA2
    );

    DigestHeader :=
      'Digest username="' + AUsuario + '", ' +
      'realm="' + Realm + '", ' +
      'nonce="' + Nonce + '", ' +
      'uri="' + URI + '", ' +
      'qop=auth, ' +
      'nc=' + NC + ', ' +
      'cnonce="' + CNonce + '", ' +
      'response="' + HResp + '"';

    // 3. Segunda chamada autenticada
    Stream.Clear;
    HTTP.Request.CustomHeaders.Clear;
    HTTP.Request.CustomHeaders.Add('Authorization: ' + DigestHeader);

    HTTP.Get(URL, Stream);

    if HTTP.ResponseCode = 200 then
    begin
      Stream.SaveToFile(AArquivoDestino);
      Result := True;
    end;

  finally
    HTTP.Free;
    Stream.Free;
  end;
end;

end.

