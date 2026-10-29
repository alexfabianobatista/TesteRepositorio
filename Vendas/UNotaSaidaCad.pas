unit UNotaSaidaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, QuickRpt, DBTables, DBDirceu, OracleData, OraTeste,
  OracleNavigator, variants, ActnList, xmldom, XMLIntf, msxmldom, XMLDoc,
  DBPanel, CustomDialog, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Math, DateUtils;

type
  TFNotaSaidaCad = class(TFTCadSimples)
    PCNota: TPageControl;
    TSCabecalho: TTabSheet;
    TsItemProduto: TTabSheet;
    PCCabecalho: TPageControl;
    TSGeral: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBECodNota: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBECodOperacao: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBECliente: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    BtConsCadastro: TBitBtn;
    BtConsFilial: TBitBtn;
    BtConsOperacao: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    BtConsMensagem: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    LblValDesconto: TLabel;
    DBEValDesconto: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    BtConsTransportador: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit37: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    LblProduto: TLabel;
    LblComissao: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    LblValFrete: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    BtConsTributacao: TBitBtn;
    BtConsLote: TBitBtn;
    DBECodProduto: TDBEdit;
    DBEdit57: TDBEdit;
    DBEComissao: TDBEdit;
    DBEDesconto: TDBEdit;
    DBEdit59: TDBEdit;
    DBEValFrete: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    BtConsProduto: TBitBtn;
    Label56: TLabel;
    DBEdit65: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    BtImpPed: TBitBtn;
    TSBaixaPedido: TTabSheet;
    GBBaixaPed: TGroupBox;
    DBGrid3: TDBGrid;
    BtCancelaBaixaOC: TBitBtn;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    Label41: TLabel;
    BtBaixaOC: TBitBtn;
    MEQtBaixarOC: TMaskEdit;
    MENumPedidoBaixar: TMaskEdit;
    BtConsOCAberto: TBitBtn;
    GroupBox3: TGroupBox;
    Label42: TLabel;
    Label32: TLabel;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBEdit40: TDBEdit;
    DSItemNF: TDataSource;
    DBGItens: TDBGrid;
    Operaes1: TMenuItem;
    ConfirmarNota1: TMenuItem;
    CancelarNota1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    VoltaCancelamento1: TMenuItem;
    RelaodeNotas1: TMenuItem;
    Conferncia1: TMenuItem;
    Futura1: TMenuItem;
    MovEstoque1: TMenuItem;
    Emisso1: TMenuItem;
    DBRGCondicaoPagamento: TDBRadioGroup;
    Label2: TLabel;
    DBEValUnitario: TDBEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    BtConsTributacaoFrete: TBitBtn;
    iTE: TMenuItem;
    MapadeVendas1: TMenuItem;
    VendedoreCondPgto1: TMenuItem;
    MovMercadoria1: TMenuItem;
    ClientessemCompras1: TMenuItem;
    VendasporOperacao1: TMenuItem;
    MovportipodeDocumento1: TMenuItem;
    VendasporClasse1: TMenuItem;
    VendasporClasseeCondPagto1: TMenuItem;
    MovEstoqueES1: TMenuItem;
    ComissoporCliente1: TMenuItem;
    PrazosdeVenda1: TMenuItem;
    VendedorPreoMdio1: TMenuItem;
    QRGVendedorCMedio: TQRCompositeReport;
    Secretaria1: TMenuItem;
    VendedorQuota1: TMenuItem;
    Inadimplncia1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Label37: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    Label39: TLabel;
    DBEdit45: TDBEdit;
    Label38: TLabel;
    DBEdit35: TDBEdit;
    Label40: TLabel;
    DBEdit46: TDBEdit;
    BitBtn1: TBitBtn;
    Label57: TLabel;
    DBEdit48: TDBEdit;
    DBDirceu1: TDBDirceu;
    Label58: TLabel;
    DBEdit29: TDBEdit;
    Label59: TLabel;
    DBEdit49: TDBEdit;
    PMapaVendasPVendedorPagtoClasse1: TMenuItem;
    QContaCorrenteAberto1: TMenuItem;
    RRecibodeComisso1: TMenuItem;
    DBEdit58: TDBEdit;
    SRelatrioVendasComCheque1: TMenuItem;
    TRelatrioMaioresClientes1: TMenuItem;
    DBEdit13: TDBEdit;
    DBEdit32: TDBEdit;
    VResumoProdutosPorCliente1: TMenuItem;
    Label61: TLabel;
    DBEdit33: TDBEdit;
    XFuturaEmprstimoConsignaoDepsitoPNota1: TMenuItem;
    ZRelatrioHistricoCliente1: TMenuItem;
    QuantVendidaporItensporVendedor1: TMenuItem;
    Vendasporvendedorregio1: TMenuItem;
    Itensvendidosnoperiodo1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    VendasPVendedorClasseFornecedor1: TMenuItem;
    LblContrato: TLabel;
    DBEdit34: TDBEdit;
    Clientescomcompranoperiodo1: TMenuItem;
    Label64: TLabel;
    DBEdit53: TDBEdit;
    DBDirceu12: TDBDirceu;
    BtConsDepartamento: TBitBtn;
    EtiquetaspItensdaNF1: TMenuItem;
    Label65: TLabel;
    DBEdit56: TDBEdit;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    NotasContaCorrente1: TMenuItem;
    LblCSLL: TLabel;
    DBECSLL: TDBEdit;
    Label68: TLabel;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    Label69: TLabel;
    DBMemo1: TDBMemo;
    BtMensagem: TBitBtn;
    Label70: TLabel;
    LblCadastroParceiro: TLabel;
    DBEdit68: TDBEdit;
    BtParceiro: TBitBtn;
    LblPedido: TLabel;
    DBEdit69: TDBEdit;
    Label73: TLabel;
    DBEdit70: TDBEdit;
    Label74: TLabel;
    DBEdit71: TDBEdit;
    VendedorCliente1: TMenuItem;
    LblChegada: TLabel;
    DBEdit72: TDBEdit;
    Label76: TLabel;
    DBEdit73: TDBEdit;
    BtOrdemCarregamento: TBitBtn;
    VendaCustoVendedorClasse1: TMenuItem;
    N3: TMenuItem;
    LanarQtChegada1: TMenuItem;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    Label77: TLabel;
    LblEmbalagem: TLabel;
    Label79: TLabel;
    DBEdit74: TDBEdit;
    Label80: TLabel;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    LblFormaCompra: TLabel;
    LblAutoriza: TLabel;
    AcompanhamentodeMeta1: TMenuItem;
    Label81: TLabel;
    DBEdit77: TDBEdit;
    Label82: TLabel;
    DBEdit78: TDBEdit;
    RelaoNotasSubstituio1: TMenuItem;
    TSContaReceber: TTabSheet;
    DBGrid2: TDBGrid;
    Label84: TLabel;
    DBEdit80: TDBEdit;
    Label85: TLabel;
    DBEdit81: TDBEdit;
    BtMotorista: TBitBtn;
    DBDirceu7: TDBDirceu;
    AcompanhamentodeVendas1: TMenuItem;
    VendasPorRamoCliente1: TMenuItem;
    NotasporCultura1: TMenuItem;
    Label86: TLabel;
    DBEdit82: TDBEdit;
    BitBtn3: TBitBtn;
    DBDirceu8: TDBDirceu;
    RelaoNotasComDesconto1: TMenuItem;
    LblCultura: TLabel;
    DBECultura: TDBEdit;
    BtCultura: TBitBtn;
    ResumodeVendasporVendedor1: TMenuItem;
    VendedorPreoMdioAnual1: TMenuItem;
    Label83: TLabel;
    DBEdit79: TDBEdit;
    TabSheet1: TTabSheet;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    DBGrid4: TDBGrid;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    BitBtn4: TBitBtn;
    DBDirceu10: TDBDirceu;
    OracleNavigator1: TOracleNavigator;
    DBNavigator1: TOracleNavigator;
    DSImpostoServico: TDataSource;
    Label91: TLabel;
    DBDirceu4: TDBDirceu;
    MapaVenda21: TMenuItem;
    DBEdit89: TDBEdit;
    LblDco: TLabel;
    RelaoProdutosporCultura1: TMenuItem;
    Label95: TLabel;
    DBEdit90: TDBEdit;
    MostraNmeroEmbarque1: TMenuItem;
    EmissoCpiaNotasIntervalo1: TMenuItem;
    Mov1: TMenuItem;
    ExtratodeProdutosAgrcola1: TMenuItem;
    VendaporClasseeData1: TMenuItem;
    Label96: TLabel;
    DBEdit91: TDBEdit;
    SbPesquisaFluxoTrem: TSpeedButton;
    DBDirceu9: TDBDirceu;
    HistricodeVendas1: TMenuItem;
    Label97: TLabel;
    Label98: TLabel;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    TsGNRE: TTabSheet;
    DsGNRE: TDataSource;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    DBGrid5: TDBGrid;
    DBEdit94: TDBEdit;
    DBEdit95: TDBEdit;
    DBEdit96: TDBEdit;
    BitBtn5: TBitBtn;
    OracleNavigator2: TOracleNavigator;
    DBRadioGroup3: TDBRadioGroup;
    Label102: TLabel;
    DBEdit97: TDBEdit;
    Label103: TLabel;
    DBEdit98: TDBEdit;
    Label104: TLabel;
    DBEdit99: TDBEdit;
    NotaQueAtendeuNota1: TMenuItem;
    Label105: TLabel;
    CbConhecimentoExp: TComboBox;
    TabSheet3: TTabSheet;
    PageControl1: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label107: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    DBGrid6: TDBGrid;
    DBEdit101: TDBEdit;
    OracleNavigator3: TOracleNavigator;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit104: TDBEdit;
    DBEdit105: TDBEdit;
    DsNotaExpTipoDoc: TDataSource;
    Label106: TLabel;
    Label108: TLabel;
    DBGrid7: TDBGrid;
    DBEdit100: TDBEdit;
    OracleNavigator4: TOracleNavigator;
    DBEdit102: TDBEdit;
    DsNotaExpConhecimento: TDataSource;
    DsNotaExpRE: TDataSource;
    Label109: TLabel;
    Label112: TLabel;
    DBGrid8: TDBGrid;
    DBEdit103: TDBEdit;
    OracleNavigator5: TOracleNavigator;
    DBEdit106: TDBEdit;
    DBEComplemento: TDBEdit;
    LBrutoPeca: TLabel;
    DBEBrutoPeca: TDBEdit;
    LBrutoServico: TLabel;
    DBEBrutoServico: TDBEdit;
    LblPlaca: TLabel;
    DBEPlaca: TDBEdit;
    PsVenda1: TMenuItem;
    DBDirceu13: TDBDirceu;
    BitBtn2: TBitBtn;
    DBEdit36: TDBEdit;
    Label51: TLabel;
    LblCfop: TLabel;
    DBECfop: TDBEdit;
    PreodeVendaXPreoVendidoporVendedor1: TMenuItem;
    InutilizaodenumeraoNFe1: TMenuItem;
    EnviarviaemailNFe1: TMenuItem;
    Label47: TLabel;
    DBEChaveAcesso: TDBEdit;
    EmitircpiadeDanfe1: TMenuItem;
    ReconsultarNFe1: TMenuItem;
    RelaodeControledeCargas1: TMenuItem;
    DBPSerie: TDBPanel;
    N8: TMenuItem;
    AlterarNmeroContrato1: TMenuItem;
    DBMInfAdicional: TDBMemo;
    Label11: TLabel;
    DBTSituacao: TDBText;
    DBTSitSefaz: TDBText;
    SBChaveAcesso: TSpeedButton;
    NFe1: TMenuItem;
    AlterarInserirestanotaemLoteNFe1: TMenuItem;
    EnviarloteparaSEFAZ1: TMenuItem;
    DBPObra: TDBPanel;
    ConsultarLotedeNFe1: TMenuItem;
    DbPPedido: TDBPanel;
    N9: TMenuItem;
    DenegarNota1: TMenuItem;
    VoltarNotaDenegada1: TMenuItem;
    ExportarNFe1: TMenuItem;
    Label66: TLabel;
    N10: TMenuItem;
    VerretornodeenvioNFe1: TMenuItem;
    DBLCCstIpi: TDBLookupComboBox;
    DsCstIpiCons: TDataSource;
    DBCheckBox1: TDBCheckBox;
    TabSheet8: TTabSheet;
    GroupBox1: TGroupBox;
    DBRadioGroup5: TDBRadioGroup;
    DBPanel4: TDBPanel;
    DBLookupComboBox3: TDBLookupComboBox;
    DsObrigacaoICMS: TDataSource;
    Label113: TLabel;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    TabSheet9: TTabSheet;
    DBLookupComboBox4: TDBLookupComboBox;
    Label87: TLabel;
    DBPanel7: TDBPanel;
    Label115: TLabel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    CurvaABC1: TMenuItem;
    DBLCCSTPis: TDBLookupComboBox;
    DBLCCSTCofins: TDBLookupComboBox;
    Label116: TLabel;
    Label117: TLabel;
    Emite1: TMenuItem;
    Opecoes1: TMenuItem;
    ExportarNotasdeSada1: TMenuItem;
    SaveDialog: TSaveDialog;
    Comiss1: TMenuItem;
    SaveDialogCLI: TSaveDialog;
    DBPModelo: TDBPanel;
    btSerieCons: TBitBtn;
    lblModelo: TLabel;
    ExportarNFe2: TMenuItem;
    SaveDialogExportaNFes: TSaveDialog;
    emitirCartaCorrecaoEletronica: TMenuItem;
    VendasporOperaoProduto1: TMenuItem;
    VendasdeClientesporOperaoProduto1: TMenuItem;
    DBENum_NFSe: TDBEdit;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    btImportaCte: TBitBtn;
    ransaesGerenciaisTEF1: TMenuItem;
    DBTSubst: TDBText;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBRGConsumidor: TDBRadioGroup;
    ACLMenuFiscal: TActionList;
    Action1: TAction;
    LblComissaoPre: TLabel;
    DbEComissaoPre: TDBEdit;
    N11: TMenuItem;
    LanarValorFretePComisso1: TMenuItem;
    Label93: TLabel;
    Label92: TLabel;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit107: TDBEdit;
    Label114: TLabel;
    BtArmazemAlfandegario: TBitBtn;
    DBDirceu11: TDBDirceu;
    Label8: TLabel;
    Label62: TLabel;
    LblVendedorPreposto: TLabel;
    DBEdit8: TDBEdit;
    BtConsVendedor: TBitBtn;
    DBEComissao_Nota: TDBEdit;
    DBEdit47: TDBEdit;
    BtConsVendedorPre: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    SBDocInserir: TSpeedButton;
    SBDocRemover: TSpeedButton;
    DBGDocOriginario: TDBGrid;
    DBRFinalidadeNFe: TDBRadioGroup;
    DsNotaReferenciada: TDataSource;
    BTDetExport: TBitBtn;
    DBPanel14: TDBPanel;
    LblComplemento: TLabel;
    Label48: TLabel;
    BtImportaNfRef: TBitBtn;
    DBEdit21: TDBEdit;
    BtNotaCabRef: TBitBtn;
    DBDNotaCabRef: TDBDirceu;
    LBFormasPagamentoNFCe: TLabel;
    DBEdit11: TDBEdit;
    Label63: TLabel;
    DBEdit54: TDBEdit;
    Label67: TLabel;
    DBLBFormasPagamentoNFCe: TDBLookupListBox;
    DBEdit26: TDBEdit;
    Label26: TLabel;
    VendasPorProdutoLote1: TMenuItem;
    DBDProduto: TDBDirceu;
    DBECusto: TDBEdit;
    LbValCusto: TLabel;
    pmImportacaoItens: TPopupMenu;
    este1: TMenuItem;
    teste21: TMenuItem;
    btnImportacaoItens: TBitBtn;
    razerItensdePedido1: TMenuItem;
    DBPanel15: TDBPanel;
    razeritens1: TMenuItem;
    Panel2: TPanel;
    DBTemDevolucao: TDBText;
    SpeedButton1: TSpeedButton;
    ppAtalhos: TPopupMenu;
    Consultarfrete1: TMenuItem;
    Gerarcontacorrente1: TMenuItem;
    Imprimircupomfiscal1: TMenuItem;
    Emitircartadecorreo1: TMenuItem;
    ImprimirNotafiscal1: TMenuItem;
    Ultimasvendas1: TMenuItem;
    EtiquetaZebraEPL1: TMenuItem;
    Label71: TLabel;
    CBIndPresenca: TComboBox;
    Royalties1: TMenuItem;
    GBValeCompras: TGroupBox;
    btIncluir: TSpeedButton;
    btExcluir: TSpeedButton;
    Label60: TLabel;
    DBGValeCompras: TDBGrid;
    MeCodValeProduto: TMaskEdit;
    BtBuscarValeProduto: TBitBtn;
    DsValeProduto: TDataSource;
    SBCartaoCredito: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    LancamentoCartao: TMenuItem;
    DBENumFabricante: TDBEdit;
    VendasporInformaesAddItem1: TMenuItem;
    Vendasporlote1: TMenuItem;
    DBPCidadePrestacao: TDBPanel;
    DBEdit6: TDBEdit;
    Label72: TLabel;
    DBEdit55: TDBEdit;
    Label75: TLabel;
    DBEdit60: TDBEdit;
    Label78: TLabel;
    EspelhodaNota1: TMenuItem;
    ResumoVendaOS1: TMenuItem;
    DBEdit83: TDBEdit;
    DbCarencia: TDBComboBox;
    LblCarencia: TLabel;
    BtPrazoCons: TBitBtn;
    Button1: TButton;
    DBEdit108: TDBEdit;
    Label94: TLabel;
    DBEdit109: TDBEdit;
    Label118: TLabel;
    DBEdit110: TDBEdit;
    Label119: TLabel;
    DBEdit111: TDBEdit;
    Label120: TLabel;
    DBEdit112: TDBEdit;
    Label121: TLabel;
    DBEdit113: TDBEdit;
    Label122: TLabel;
    DBEdit114: TDBEdit;
    Label123: TLabel;
    DBEdit116: TDBEdit;
    Label125: TLabel;
    BTCarregaSTAnterior: TBitBtn;
    DBEdit115: TDBEdit;
    Label124: TLabel;
    OramentoViaExcel1: TMenuItem;
    Label126: TLabel;
    CBIndIntermediador: TComboBox;
    DBEdit117: TDBEdit;
    Label127: TLabel;
    BtConsTecnico: TBitBtn;
    ComissoTcnicoVendedor1: TMenuItem;
    DBPCodFormula: TDBPanel;
    BtFormula: TBitBtn;
    ConfernciaNFCdigoBarras1: TMenuItem;
    btnEnviaBoletoApi: TButton;
    btnImprimirBoletoApi: TButton;
    btnEnviarBoletoEmail: TButton;
    DBEdit118: TDBEdit;
    Label128: TLabel;
    LblDiasCheque: TLabel;
    ConsolidarContasReceber1: TMenuItem;
    Label129: TLabel;
    DBLCCClasTribIBSCBSVenda: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsTributacaoFreteClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtImpPedClick(Sender: TObject);
    procedure BtConsOCAbertoClick(Sender: TObject);
    procedure BtBaixaOCClick(Sender: TObject);
    procedure BtCancelaBaixaOCClick(Sender: TObject);
    procedure BtImpItemPedClick(Sender: TObject);
    procedure DSItemNFStateChange(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure PCNotaChange(Sender: TObject);
    procedure ConfirmarNota1Click(Sender: TObject);
    procedure DBECodNotaChange(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure CancelarNota1Click(Sender: TObject);
    procedure VoltaCancelamento1Click(Sender: TObject);
    procedure RelaodeNotas1Click(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure Futura1Click(Sender: TObject);
    procedure MovEstoque1Click(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure iTEClick(Sender: TObject);
    procedure MapadeVendas1Click(Sender: TObject);
    procedure VendedoreCondPgto1Click(Sender: TObject);
    procedure MovMercadoria1Click(Sender: TObject);
    procedure ClientessemCompras1Click(Sender: TObject);
    procedure VendasporOperacao1Click(Sender: TObject);
    procedure MovportipodeDocumento1Click(Sender: TObject);
    procedure VendasporClasse1Click(Sender: TObject);
    procedure VendasporClasseeCondPagto1Click(Sender: TObject);
    procedure MovEstoqueES1Click(Sender: TObject);
    procedure ComissoporCliente1Click(Sender: TObject);
    procedure PrazosdeVenda1Click(Sender: TObject);
    procedure VendedorPreoMdio1Click(Sender: TObject);
    procedure QRGVendedorCMedioAddReports(Sender: TObject);
    procedure Secretaria1Click(Sender: TObject);
    procedure VendedorQuota1Click(Sender: TObject);
    procedure Inadimplncia1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure SBGeraContaCorrenteClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBImprimeCupomFiscalClick(Sender: TObject);
    procedure SBConsultaFreteClick(Sender: TObject);
    procedure TSBaixaPedidoEnter(Sender: TObject);
    procedure TSBaixaPedidoExit(Sender: TObject);
    procedure PMapaVendasPVendedorPagtoClasse1Click(Sender: TObject);
    procedure QContaCorrenteAberto1Click(Sender: TObject);
    procedure RRecibodeComisso1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SRelatrioVendasComCheque1Click(Sender: TObject);
    procedure TRelatrioMaioresClientes1Click(Sender: TObject);
    procedure VResumoProdutosPorCliente1Click(Sender: TObject);
    procedure XFuturaEmprstimoConsignaoDepsitoPNota1Click(Sender: TObject);
    procedure ZRelatrioHistricoCliente1Click(Sender: TObject);
    procedure DBEClienteExit(Sender: TObject);
//    procedure BloqueiaVenda(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QuantVendidaporItensporVendedor1Click(Sender: TObject);
    procedure Vendasporvendedorregio1Click(Sender: TObject);
    procedure Itensvendidosnoperiodo1Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtImpItemNotaClick(Sender: TObject);
    procedure VendasPVendedorClasseFornecedor1Click(Sender: TObject);
    procedure DBEdit62Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientescomcompranoperiodo1Click(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure EtiquetaspItensdaNF1Click(Sender: TObject);
    procedure NotasContaCorrente1Click(Sender: TObject);
    procedure BtConsVendedorPreClick(Sender: TObject);
    procedure DBEdit31Change(Sender: TObject);
    procedure BtMensagemClick(Sender: TObject);
    procedure SBCartaCorrecaoClick(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
    procedure VendedorCliente1Click(Sender: TObject);
    procedure BtOrdemCarregamentoClick(Sender: TObject);
    procedure DBEdit62KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit63KeyPress(Sender: TObject; var Key: Char);
    procedure MELocalizaChange(Sender: TObject);
    procedure VendaCustoVendedorClasse1Click(Sender: TObject);
    procedure LanarQtChegada1Click(Sender: TObject);
    procedure DBECodOperacaoChange(Sender: TObject);
    procedure AcompanhamentodeMeta1Click(Sender: TObject);
    procedure RelaoNotasSubstituio1Click(Sender: TObject);
    procedure PCCabecalhoChange(Sender: TObject);
    procedure BtCulturaClick(Sender: TObject);
    procedure BtMotoristaClick(Sender: TObject);
    procedure AcompanhamentodeVendas1Click(Sender: TObject);
    procedure VendasPorRamoCliente1Click(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure NotasporCultura1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RelaoNotasComDesconto1Click(Sender: TObject);
    procedure DBEDescontoExit(Sender: TObject);
    procedure ResumodeVendasporVendedor1Click(Sender: TObject);
    procedure VendedorPreoMdioAnual1Click(Sender: TObject);
    procedure DBEValUnitarioChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    //procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure MapaVenda21Click(Sender: TObject);
    procedure RelaoProdutosporCultura1Click(Sender: TObject);
    procedure MostraNmeroEmbarque1Click(Sender: TObject);
    procedure DBEClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EmissoCpiaNotasIntervalo1Click(Sender: TObject);
    procedure BtNotaCompra_ConsClick(Sender: TObject);
    procedure Mov1Click(Sender: TObject);
    procedure ExtratodeProdutosAgrcola1Click(Sender: TObject);
    procedure VendaporClasseeData1Click(Sender: TObject);
    procedure SbPesquisaFluxoTremClick(Sender: TObject);
    procedure HistricodeVendas1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure NotaQueAtendeuNota1Click(Sender: TObject);
    //procedure DBEdit11Exit(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure BtArmazemAlfandegarioClick(Sender: TObject);
    procedure PsVenda1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtNotaCabRefClick(Sender: TObject);
    procedure BtImportaNfRefClick(Sender: TObject);
    procedure PreodeVendaXPreoVendidoporVendedor1Click(Sender: TObject);
    procedure DBEValUnitarioExit(Sender: TObject);
    procedure DBEValUnitarioEnter(Sender: TObject);
    procedure InutilizaodenumeraoNFe1Click(Sender: TObject);
    procedure EnviarviaemailNFe1Click(Sender: TObject);
    procedure EmitircpiadeDanfe1Click(Sender: TObject);
    procedure ReconsultarNFe1Click(Sender: TObject);
    procedure RelaodeControledeCargas1Click(Sender: TObject);
    procedure DBPSerieValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: string);
    procedure DBPSerieCodigoExit(Sender: TObject);
    procedure AlterarNmeroContrato1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBChaveAcessoClick(Sender: TObject);
    procedure AlterarInserirestanotaemLoteNFe1Click(Sender: TObject);
    procedure EnviarloteparaSEFAZ1Click(Sender: TObject);
    procedure DBPObraDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure ConsultarLotedeNFe1Click(Sender: TObject);
    procedure DBECodProdutoExit(Sender: TObject);
    procedure DBEdit57Change(Sender: TObject);
    procedure DenegarNota1Click(Sender: TObject);
    procedure VoltarNotaDenegada1Click(Sender: TObject);
    procedure DBTSitSefazMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ExportarNFe1Click(Sender: TObject);
    procedure VerretornodeenvioNFe1Click(Sender: TObject);
    procedure DBECfopExit(Sender: TObject);
    procedure SbUltimasVendasClick(Sender: TObject);
    procedure DBECodOperacaoExit(Sender: TObject);
    procedure DBPanel8DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure CurvaABC1Click(Sender: TObject);
    procedure SBImprimeNFConsClick(Sender: TObject);
    procedure Emite1Click(Sender: TObject);
    procedure ExportarNotasdeSada1Click(Sender: TObject);
    procedure Comiss1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBPModeloCodigoExit(Sender: TObject);
    procedure ExportarNFe2Click(Sender: TObject);
    procedure emitirCartaCorrecaoEletronicaClick(Sender: TObject);
    procedure VendasporOperaoProduto1Click(Sender: TObject);
    procedure VendasdeClientesporOperaoProduto1Click(Sender: TObject);
    procedure btImportaCteClick(Sender: TObject);
    procedure ransaesGerenciaisTEF1Click(Sender: TObject);
    procedure DBEdit43KeyPress(Sender: TObject; var Key: Char);
    procedure DBEValDescontoExit(Sender: TObject);
    procedure ChamaMenuFiscal(Sender: TObject);
    procedure DBRGCondicaoPagamentoChange(Sender: TObject);
    procedure LanarValorFretePComisso1Click(Sender: TObject);
    procedure SBDocInserirClick(Sender: TObject);
    procedure SBDocRemoverClick(Sender: TObject);
    procedure BTDetExportClick(Sender: TObject);
    procedure DBPModeloCodigoChange(Sender: TObject);
    procedure BtBuscarValeProdutoClick(Sender: TObject);
    procedure MeCodValeProdutoExit(Sender: TObject);
    procedure MeCodValeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure SBRefreshClick(Sender: TObject);
    procedure VendasPorProdutoLote1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure DBRFinalidadeNFeChange(Sender: TObject);
    procedure DBEdit50Exit(Sender: TObject);
    procedure btImportacaoItensClick(Sender: TObject);
    procedure btnImportacaoItensClick(Sender: TObject);
    procedure este1Click(Sender: TObject);
    procedure teste21Click(Sender: TObject);
    procedure razerItensdePedido1Click(Sender: TObject);
    procedure DBPanel15DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel15CodigoExit(Sender: TObject);
    procedure DBPanel15AfterConsulta(Sender: TObject);
    procedure DBEClienteChange(Sender: TObject);
    procedure DBPanel15CodigoChange(Sender: TObject);
    procedure DBPanel15Exit(Sender: TObject);
    procedure DBPanel15Enter(Sender: TObject);
    procedure DBRGConsumidorClick(Sender: TObject);
    procedure razeritens1Click(Sender: TObject);
    function TabelaPrecoVencida(): Boolean;
    procedure DBECodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure EtiquetaZebraEPL1Click(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure DBEdit61Exit(Sender: TObject);
    procedure Royalties1Click(Sender: TObject);
    procedure MeCodValeProdutoEnter(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure SBCartaoCreditoClick(Sender: TObject);
    procedure LancamentoCartaoClick(Sender: TObject);
    procedure DBENumFabricanteExit(Sender: TObject);
    procedure VendasporInformaesAddItem1Click(Sender: TObject);
    procedure Vendasporlote1Click(Sender: TObject);
    procedure NotasMarketplace1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure DBPCidadePrestacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure EspelhodaNota1Click(Sender: TObject);
    procedure ResumoVendaOS1Click(Sender: TObject);
    procedure BtPrazoConsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit108Exit(Sender: TObject);
    procedure DBEdit110Exit(Sender: TObject);
    procedure BTCarregaSTAnteriorClick(Sender: TObject);
    procedure DBEdit50Enter(Sender: TObject);
    procedure OramentoViaExcel1Click(Sender: TObject);
    procedure BtConsTecnicoClick(Sender: TObject);
    procedure ComissoTcnicoVendedor1Click(Sender: TObject);
    procedure BtFormulaClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure ConfernciaNFCdigoBarras1Click(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure btnEnviaBoletoApiClick(Sender: TObject);
    procedure btnImprimirBoletoApiClick(Sender: TObject);
    procedure btnEnviarBoletoEmailClick(Sender: TObject);
    procedure ConsolidarContasReceber1Click(Sender: TObject);
//    procedure ValidaFilial;


  private
    wQuantidadeAnterior: real;
    wAlterouLista: boolean;
    wPermiteDesconto: boolean; //Criado para bloquear desconto da Kreuz quando usuário não tiver privilégio - Cleber - 10/01/2020
    wCodigoTabelaPreco: integer; // Utilizado no change do componente. Para saber se código foi alterado ou não
    wEnviaBoletoEmail: Boolean; // Para validar o envio de e-mail do novo boleto híbrido - Cleber - 17/07/2025
    procedure MsgAutoriza;
    procedure PImportaPedidos_Items;
    procedure Proc_TrazItens(wCod_Nota_Cab: Integer);
    procedure Proc_TrazItensOS(wCod_Ordem_Servico_Cab: Integer);
    function LocalizaConhecimento(cod: string): Integer;
    procedure ImportaPedidoDebona;
    function verificaCadatroDebona(codPedido: Integer): Integer;
    procedure exportaNotasSaida;
    procedure ExportacaoClienteFornecedor;
    procedure AtualizaCodListaPreco;
    procedure TrataValeProduto(TipoVale:String);
    procedure GerarPedido;
    procedure GeraBoletoApi;
    procedure ImprimeBoletoApi;
    procedure EnviarEmailBoletoApi;

    { Private declarations }
  public
    { Public declarations }
 //   wLancCartaoIndividual : Boolean;
  end;

var
  FNotaSaidaCad: TFNotaSaidaCad;
  ValUn: Real;
//  CodFilial: String = '0';
  wContaCorrente, wNumNota: String;

implementation

uses
  UNotaSaida_cl, UCadastroCons, UFilialCons, UVendedorCons, UCadastro_cl,
  UFilial_cl, UVendedor_cl, UTransporte_cl, UProdutoCons, UProduto_cl,
  UTipoLoteCons, UTipoLote_cl, UTributacaoCons, UTributacao_cl, UOracle_cl,
  UOperacaoCons, UOperacao_cl, UMensagemCons, UMensagem_cl, UNotaSaidaCons,
  UPedidoCons, UPedido_cl, UPedido_ConsAberto, UNotaSaida_Confirma,
  UNotaSaida_Cancela, UNotaEntradaParam, UNotaEntrada_cl, URNotasES_Relacao,
  URNotasES_Conferencia, URNotasES_Futura, URNotasES_MovEstoque,
  URNota_Pedido, UNotaSaidaParam,
  URNota_Comissao, URNota_MapaVenda, URNota_MapaVendaRes,
  URNota_VendedorPgto, URNota_MovMercadoria, URNota_ClienteSemCompra,
  URNota_Operacao, URNota_TipoDocumento, URNota_Classe, URNota_ClassePgto,
  URNota_EntradaSaida, URNota_ComissaoCliente, URNota_PrazoVenda,
  URNota_VendedorCMedio, URNota_VendedorCMedio2, URNota_Secretaria,
  URNota_Secretaria2, URNota_QuotaVend, URNota_QuotaVend3,
  URNota_Inadimplencia, URNota_ContaCorrente, URNota_Claspar,
  UNota_ContaCorrente, UNotaImpressao, UParamSistema_cl, UImpFiscal,
  UConhecimentoCons, URVendedorClasse, URContaCorrente2,
  URNota_ComCheque, URMaioresClientes, URMaioresClientesVend,
  URNota_ClassePgtoVend, ULotesClaspar, URResumoCliente, URNota_VendaFutura,
  UrVendaHistorico, UNotaSaidaVendasVendedor, URNotaVendasVndRegiao,
  URNotaVendProdPeriodo, URTitulos, URVendasVendClasse, URelatorioVenda_cl,
  UImpressoraFiscal, URClienteComCompra, UDepartamentoCons,
  UBiblioteca, UDepartamento_cl, URNotaContaCorrente, UNotaCorrecao,
  UUsuario_cl, UNotaCorrecao_cl, URVendaVendedorCliente,
  UOrdemCarregamentoCons, UOrdemCarregamento_cl, URVendaVendedorClasse,
  UQtChegada, UNotaComprovanteEntrega, URComprovanteEntrega,
  URAcompanhaMeta, URRelacaoNotasRio, UCulturaCons, UCultura_cl,
  URAcompanhamentoVenda, URVendaVendedorClasseSintetico,
  URVendasRamoCliente, URVendaVendedorResumo, URNotaCultura,
  URVendaComDesconto, URVendedorResumo, URNota_VendedorCMedioMes,
  UImpostoCons, UImposto_cl, URNota_MapaVenda2, URNota_MapaVendaRes2,
  URProdutoCultura, UEmbarque_cl, UReciboComissao, URReciboComissao2,
  UNotaEntradaCons, URMovMercadoria_Sintetico, UImprimirNota, UFmFilial,
  UFmDepartamento, UGraficoParam, URExtratoProdutoAgricola,
  URNota_ClasseData, UControleTremCons, UControleTrem_cl,
  URNota_ClasseDataRes, URHistoricoVendas, USenha, UEstadoCons, UEstado_cl,
  URNota_VendaFuturaAtendida, UNotaSaidaPosVenda, UTipoConhecimentoCons,
  URPrecoVendido, UNfe_cl, URControleCarga, StrUtils,
  UAlteraCodigoContrato, UNfEletronicaLote_cl, UNfEletronicaLoteCons,
  UObra_cl, UObraCons, UNFeParam, UComparaCadastro, UPedidoCompostoCons,
  UContasReceberCons, UNotaUltimasVendas, UEstoque_cl, UObrigacaoICMS_cl,
  URCurvaABC, UNotaConsumidorNome, USerie_cl, UContasReceber_cl,
  UPromissoria, URComissaoFrete, USerieCons, UCartaCorrecaoEletronica,
  UCartaCorrecaoEletronica_cl, UExportarNotasParam, UFROperacaoProduto,UFROperacaoProduto2, UFRVendaClienteOP,
  UTef, USpedValidacao, URPromissorias, UFmOperacao, UFmObra,
  UImpressoraFiscal_cl, UAtualizaFreteComissao, UFinalidadeNFeParam,
  UDevolucaoCarregaItens, UDetExportCad, UBibVenda, UValeProdutoCons,
  UDevolucaoTroca_cl, UrVendasProdutoLote, UImpDadosXMLNFe,
  UTabelaPrecoCons, UTabelaPreco_cl, URRelacaonotas40Colunas,
  UOrdemServico_cl, UOrdemServicoCons, UFmProduto, Cport, ShellAPI,
  URNota_EntradaSaidaRetrato, URNota_ComissaoRoyalties, UTaxaCartao,
  USequencia_cl, UFmCadastro, UReceituarioOtico, URDetalhamentoFunrural, URVendaInfAddItem,
  UTFiltroRelatorio, UFiltroRelContaCorrente, URNotasLoteCadastro, UNotasMarketplace,
  UCidadeCons, URelEspelhoNota, UResumoVendaOS, URComissaoClasse,
  UPrazoVencimentoCons, UPrazoVencimento_cl, URNota_Comissao_Rad, ComObj,
  UDespesaRecup_cl, ULancaHorimetro, UFAtualizadataassinatura,
  URClasseMaisVendida, URComissaoTecnico, URComissaoVendedor,
  ULancamentoCartaoCad, URNota_ComissaoOS,URComissaoArtista, UFormulaCons,
  UFormula_cl, UFmRegiao, UInformaBancoPix, UFRNota_MapaVendaRes40Colunas,
  UConferenciaNFCodBarras, URNotasES_MovEstoqueItatiba, BoletoAPI.BoletoFactory,
  BoletoApi.Interfaces, UContasPagar_cl, UTitulosFaturamento;

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

procedure TFNotaSaidaCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    QNotaSaida.Open;
    QSomaItemNota.Open;
    QItemNF.Open;
    QNotaReferenciada.Open;
    QNotaImpostoServico.open;
    QNotaGNRE.open;
    QNotaExpTipoDoc.open;
    QNotaExpConhecimento.open;
    QNotaExpRE.open;
    QSomaPagamentos.Open;
    QValeProdutoTroca.Open;
  end;
  DMEstado.QREstado.Open;
  DMObrigacaoICMS.QObrigacaoICMSCons.Open;
  DMTransporte.QTransporteAll.Open;
  if (DMParamSistema.CodEmpresa <> 'DIVINO') then
  begin
    DBPCodFormula.Visible := false;
    BtFormula.Visible := false;
  end;

  PCNota.ActivePage := TSCabecalho;
  PCCabecalho.ActivePage := TSGeral;
  if (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '7') or
     (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') then
  begin
    DBEComissao.ReadOnly := False;
    DBEComissao.TabStop := True;
    DBEComissao.ParentColor := False;
    DBEComissao.Color := clWindow;
  end;
  if (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '9') or
    (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') then
  begin
    DBEComissao_Nota.ReadOnly := False;
    DBEComissao_Nota.TabStop := True;
    DBEComissao_Nota.ParentColor := False;
    DBEComissao_Nota.Color := clWindow;
  end;
  if (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '1') Then // comissao por vendedor
  Begin
    DBEComissao.Visible := False;
    LblComissao.Visible := False;
  End;
  if DMParamSistema.CodEmpresa = 'GOLDEN' then
  begin
    DBEComissao.Visible := True;
    LblComissao.Visible := True;
  end;
  if DMParamSistema.QParamSistemaInd_Rota.Value = 'S' then
  begin
    DbEdit33.Visible := True;
    DbEdit33.TabStop := True;
    Label61.Visible := True;
    DbEdit47.Visible := True;
    LblVendedorPreposto.Visible := True;
    BtConsVendedorPre.Visible := True;
  end;
  if DMParamSistema.CodEmpresa = 'MOINHO' then
  begin
    DBRGCondicaoPagamento.Enabled := False;
    Label92.Visible := True;
    DbEdit87.Visible := True;
    Label93.Visible := True;
    DbEdit88.Visible := True;
    DBEdit107.Visible := True;
    Label114.Visible := True;
    BtArmazemAlfandegario.Visible := True;
    DBDirceu11.Visible := True;
  end;
  If DMParamSistema.CodEmpresa = 'TRIPAR' then
     LblCultura.Caption := 'Embalagem';

  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);

  if DMParamSistema.CodEmpresa = 'GRASMIL' then
    DMNotaSaida.QItemNFVAL_UNITARIO.DisplayFormat := '#,##0.0000';

  if DMParamSistema.CodEmpresa = 'DEBONA' then
  begin
    GroupBox3.Visible := False;
    GBBaixaPed.Visible := False;
  end
  else
  begin
    GroupBox3.Visible := True;
    GBBaixaPed.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'NIR') Or (DMParamSistema.CodEmpresa = 'ARZ') then
  begin
    DBPObra.Visible := False;
    LblContrato.Visible := False;
    DBEdit34.Visible := False;
    LblCadastroParceiro.Visible := False;
    DBEdit68.Visible := False;
    BtParceiro.Visible := False;
    DBEdit58.Visible := False;
    DBEdit13.Visible := False;
    DBEdit32.Visible := False;
    DBEdit66.Visible := False;
    DBEdit76.Visible := False;
    LblDiasCheque.Visible := False;
    LblDco.Visible := False;
    DBEdit89.Visible := False;
    LblPedido.Top := LblContrato.Top;
    LblPedido.left := LblContrato.Left;
    DBEdit69.Top := DBEdit34.Top;
    DBEdit69.left := DBEdit34.Left;
    LblChegada.Visible := False;
    DBEdit72.Visible := False;
    DBEdit83.Visible := False;
    Label91.Visible := False;
    DBEdit90.Visible := False;
    Label95.Visible := False;
    //LblEmbalagem.left := 479;
    //DBDirceu6.left := 479;
    //LblBeneficiado.Visible := False;
    //DBEBeneficiado.Visible := False;
  End;
  if (DMParamSistema.CodEmpresa = 'NIR') Then
  begin
    LblVendedorPreposto.Visible := False;
    DBEdit47.Visible := False;
    BtConsVendedorPre.Visible := False;
    LblContrato.Visible := False;
    DBEdit34.Visible := False;
    Label62.Visible := False;
    DBEComissao_Nota.Visible := False;
    Label64.Visible := False;
    DBEdit53.Visible := False;
    BtConsDepartamento.Visible := False;
    DBDirceu12.Visible := False;
    Label61.Visible := False;
    DBEdit33.Visible := False;
    DBEdit69.Visible := False;
    LblPedido.Visible := False;
    DBECultura.Visible := False;
    LblCultura.Visible := False;
    BtCultura.Visible := False;
    SBCartaoCredito.Visible := True;
  End
  else
    SBCartaoCredito.Visible := False;
  if (DMParamSistema.CodEmpresa = 'NEOALI') then
  begin
    DBEdit72.Visible := False;
    LblChegada.Visible := False;
    Label115.Caption := 'Cód. Obra';
    LblComissao.Left := 83;
    DBEComissao.Left := 83;
    LblComissaoPre.Visible := True;
    DbEComissaoPre.Visible := True;
    LblComissaoPre.Left := 136;
    DbEComissaoPre.Left := 143;
    DbEComissaoPre.TabOrder := 30;
    DBEdit34.Visible := False;
    LblContrato.Visible := False;
    DBEdit68.Visible := False;
    LblCadastroParceiro.Visible := False;
    DBECultura.Visible := False;
    LblCultura.Visible := False;
    BtCultura.Visible := False;
    //DBEBeneficiado.Visible := False;
    //LblBeneficiado.Visible := False;
    DBPObra.Visible := False;
    BtParceiro.Visible := False;
    DBEdit89.Visible := False;
    LblDco.Visible := False;
    LblComplemento.Visible := False;
    DBEdit21.Visible := False;
    BtNotaCabRef.Visible := False;
    DBDNotaCabRef.Visible := False;
    BtImportaNfRef.Visible := False;
  end;

  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value = 'COLABORADOR')  then
    SBCancelar.Visible := false;

  if DMParamSistema.CodEmpresa = 'ARZ' then
    LblPedido.Caption := 'NºOrd.Serviço';

  if DMParamSistema.CodEmpresa = 'RADIO' then
  begin
    BtPrazoCons.Visible := True;
    DBCarencia.Visible := True;
    LblCarencia.Visible := True;
  end;
//Consulta tecnico, utilizado pela Center Frio e pela Casa dos Filtros. Cod_suporte: 4561 - Alex 16/02/2022
//Adicionado para a JR. Alex 29/04/2022
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'REFRISM') or (DMParamSistema.CodEmpresa = 'CEIFAGRIL') or
     (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    Label8.Visible := Enabled;
    DBEdit117.Visible := Enabled;
    BtConsTecnico.Visible := Enabled;
  end;
  if (DMParamSistema.CodEmpresa = 'INJEPAR') then
    Label127.Caption := 'Mecânica';
  if (DMParamSistema.CodEmpresa = 'DIVINO') then
  begin
    Label127.Caption := 'Consultor';
    LblVendedorPreposto.Caption := 'RT';

    LblVendedorPreposto.Top := 71;
    LblVendedorPreposto.Left := 192;
    DBEdit47.Top := 85;
    DBEdit47.Left := 190;
    DBEdit47.TabOrder := 16;
    BtConsVendedorPre.Top := 85;
    BtConsVendedorPre.Left := 234;
  end;
  if (DMParamSistema.CodEmpresa = 'KREUZ') then
  begin
    DBEdit58.Visible := False;
    DBEdit13.Visible := False;
    DBEdit32.Visible := False;
    DBEdit66.Visible := False;
    DBEdit76.Visible := False;
    LblDiasCheque.Visible := False;
    DBEdit34.Visible := False;
    LblContrato.Visible := False;
    DBPObra.Visible := False;
    DBEdit118.Visible := False;
    Label128.Visible := False;
    BtPrazoCons.Visible := True;
    Label91.Top := 162;
    BtPrazoCons.Top := 162;
    DbEdit83.Top := 176;
    BtPrazoCons.Top := 176;
    DBEComissao_Nota.Left := 11;
    Label62.Left := 11;
    Label64.Left := 82;
    DbEdit53.Left := 82;
    BtConsDepartamento.Left := 127;
    DBDirceu12.Left := 152;
  end;

  //Refresh na QItemNF para autalizar na tela a informação do DESC_INF_ADICIONAL do item. Problema do próprio componente. Junior - 01/07/2015
  DMNotaSaida.QItemNF.Refresh;
  MeCodValeProduto.Clear;
end;

procedure TFNotaSaidaCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'SCALA') then
  begin
     if FCadastroCons = nil then
       FCadastroCons := TFCadastroCons.Create(Application);
     if FCadastroCons.ShowModal = mrOk then
     begin
       DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
       if DmCadastro.QCadastroConsDt_Cancelamento.Text <> '' then
         raise Exception.Create('Cliente com Cadastro Encerrado!');

       DMMensagem.QMensagem.Close;
       DMMensagem.QMensagem.SetVariable('PK', DMCadastro.QCadastroConsCOD_MENSAGEM.Value);
       DMMensagem.QMensagem.Open;
       DBEClienteExit(Self);

    {    if FPedidoCons = nil then    // retirado pelo César 21/12/2011 - colocar para chamar rotina exit do campo cadastro cliente
          FPedidoCons := TFPedidoCons.Create(Application);
        FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' then
          FPedidoCons.MEDataI.Text := DateToStr(Date - 30)
        else
          FPedidoCons.MEDataI.Text := DateToStr(Date - 180);
        FPedidoCons.pTela_Chamou := 'PEDIDO'; // para controle de segurança
        FPedidoCons.BtProcurarClick(Self);
        if DMPedido.QPedidoConsCod_Pedido_Cab.Value > 0 then
        begin
          FPedidoCons.METexto.Enabled := False;
          FPedidoCons.BtConsCadastro.Enabled := False;
          BtImpPedClick(Self);
          FPedidoCons.METexto.Enabled := True;
        end;
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' then
        begin
          if DMCadastro.QCadastroDesc_Obs.Value <> '' then
            MessageDlg(DMCadastro.QCadastroDesc_Obs.Text + Chr(13) +
              DMCadastro.QCadastroDesc_Obs1.Text + Chr(13) +
              DMCadastro.QCadastroDesc_Obs2.Text, mtInformation, [mbOk], 0);
        end;
        MsgAutoriza; // mostra na tela as pessoas autorizadas
      end;

      PCNota.ActivePage := TsCabecalho;
      DBEdit10.SetFocus;
    }
    end;
  end
{Adicionado para a Empresa Scala filtrar os cadastros apenas pelo tipo de cadastro 1 sem que seja necessário alterar na tela da consulta. Alex 27/03/2026}
  else
  begin
    if FCadastroCons = Nil then
    begin
      FCadastroCons := TFCadastroCons.Create(Application);
      FCadastroCons.METipoCadastro.Text := '1';
    end;
    if FCadastroCons.ShowModal = mrOk then
    begin
      FCadastroCons.METipoCadastro.Text := '1';
      DBECliente.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
       if DmCadastro.QCadastroConsDt_Cancelamento.Text <> '' then
         raise Exception.Create('Cliente com Cadastro Encerrado!');
    end;
    DBEClienteExit(self);
  end;
end;

procedure TFNotaSaidaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  if (DMParamSistema.CodEmpresa = 'STEIN') then
    DBEdit3Exit(Self);
  DBECodOperacao.Setfocus;
end;

procedure TFNotaSaidaCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
//Adicionado para corrigir o erro de campo desativado, pois o cod_tecnico esta habilitado apenas para CenterFrio. Alex - 12/04/2022
//Jr e Casa dos Filtros estão utilizando o campo de tecnico. Alex - 29/04/022
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
    DMNotaSaida.QNotaSaidaCOD_TECNICO.Value := DMVendedor.QVendedorConsCOD_VENDEDOR.Value;
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'REFRISM') or
     (DMParamSistema.CodEmpresa = 'CEIFAGRIL') or (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    DbEdit117.Setfocus;
  end
  else
    DBEdit18.SetFocus;
end;

procedure TFNotaSaidaCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEdit22Exit(Self);
end;

procedure TFNotaSaidaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QItemNF.Edit;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') then
      DMNotaSaida.QItemNFCOD_LOTE_TIPO.Value := DMEstoque.QEstoqueConsCod_Lote_Tipo.Value;
    DMNotaSaida.QItemNFCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    FNotaSaidaCad.DBECodProdutoExit(Sender);
  end;
end;

procedure TFNotaSaidaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DmNotaSaida.QItemNfCod_Produto.Value);
  if FTipoLoteCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  end;
end;

procedure TFNotaSaidaCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
    if Trim(DMTributacao.QTributacaoConsCOD_CST_IBS_CBS.Text) <> '' then
      DMNotaSaida.QItemNFNUM_CST_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CST_IBS_CBS FROM TB_CST_IBS_CBS','COD_CST_IBS_CBS =' + DMTributacao.QTributacaoConsCOD_CST_IBS_CBS.Text);
  end;
end;

procedure TFNotaSaidaCad.SBConfirmarClick(Sender: TObject);
var
  wPrecoMin, wValTotalMin, wValIBSMun, wValIBSUF, wValCBS,
  wPercIBSMun, wPercIBSUF, wPercCBS: Real;
  wPercAux: String;
  spedValidacao: TSpedValidacao;
begin
  Panel1.SetFocus;

  DMNotaSaida.sFormularioUsado := TForm(Self).Name;

  DMParamSistema.QParamSistema.RefreshRecord;
  DMNotaSaida.QNotaSaidaIND_PRESENCA.Value := Bib.ift(CBIndPresenca.ItemIndex < 6,CBIndPresenca.ItemIndex,9);
  if Trim(DBECodOperacao.Text) = '' then
  begin
    DBECodOperacao.SetFocus;
    raise Exception.Create('Informe a operação');
  end;
  if DMNotaSaida.QNotaSaidaIND_PRESENCA.Value = 5 then
    raise Exception.Create('É preciso referenciar uma nota quando for "5 - Operação presencial, fora do estabelecimento".');
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('Pk', StrToInt('0'+Trim(DBECodOperacao.Text)));
    QOperacao.Open;

    //Faz validação dos códigos CST de pis e cofins para filiais que entregam sped
    //Foi colocado aqui pois na DMNotaSaida estava dando problema
    if (QOperacaoIND_EMITE.Text = 'F') then //validar somente para NF. Vanessa 12/03/2015
    begin
      try
        spedValidacao := TSpedValidacao.Create;
        spedValidacao.Valida(DMNotaSaida.QNotaSaida, DMNotaSaida.QItemNF);
      Except
        Abort;
      end;  //Para não deixar salvar nota que é NFe sem CFOP. Junior - 08/05/2015.
      if (QOperacaoNUM_NATUREZA_EST_NOVO.Value = 0) or (DMOperacao.QOperacaoNUM_NATUREZA_INT_NOVO.Value = 0) then
        raise Exception.Create('Para confirmar a nota é preciso preencher o campo CFOP da Operação!');
    end;
    if (QOperacaoIND_EMITE.Text = 'P') and                      //Não deixa salvar operação de pedido
       (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '99') then         //com série fiscal Adriel 17/09/2015
      raise Exception.Create('É necessário usar de série de pedidos ou '+  //pedido por Rubens Kreuz
                             'colocar operação de nota fiscal.');
    if (QOperacaoIND_OBRIGA_VALE_PRODUTO.Value = 'S') and
       (DMNotaSaida.QValeProdutoTroca.RecordCount = 0) then
    begin
      MessageDlg('Para efetuar uma venda relacionada a uma troca é preciso informar o Vale Compras.', mtError,
          [mbOk], 0);
      MeCodValeProduto.SetFocus;
      Abort;
    end;
  end;
  DMNotaSaida.QValeProdutoTroca.Refresh;
  if DMCadastro.QCadastro.Eof then
  begin
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMCadastro.QCadastro.Open;
  end
  else
    DMCadastro.QCadastro.RefreshRecord;

  wValTotalMin := 0;
  if DMNotaSaida.QItemNF.State <> dsBrowse then
    DMNotaSaida.QItemNF.Post;
  DmUsuario.Checar_Filial_Usuario(Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text), 'VENDA');
  if not DMUsuario.ContabilPrivilegiado then
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' then
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
        raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');

  if DBEdit8.Text <> '' then
  begin // Codigo do vendedor
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DBEdit8.Text) <> 'ATIVO' then
      raise Exception.Create('Vendedor Inativo');
  end
  else
    raise Exception.Create('Preencher código vendedor');
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') then
    if (DBRGCondicaoPagamento.ItemIndex <> 0) then // condicao de pagamento a vista
    begin
      if DMCadastro.QCadastroDESC_FORMA_COMPRA.Value = 'A Vista' then
        raise Exception.Create('Cliente com Permissão Para Compra Somente a Vista');
    end;
  if (DBRGCondicaoPagamento.ItemIndex = 0) And // condicao de pagamento a vista não preencher valor de entrada
     (DMNotaSaida.QNotaSaidaVAL_AVISTA.Value <> 0) Then
     Raise exception.Create('Para condição de pagamento a vista não preencher valor da entrada');
  with DMOperacao do
  begin
    if QOperacaoInd_Fixar_Empresa.Value <> 'N' then
      raise Exception.Create('Operação Não Pode ser Utilizada No Vendas' + Chr(13) + 'Produto Agricola Somente No Sistema Agricola');
    if QOperacaoIND_FISICA_JURIDICA.Value <> 'T' then
      if DMCadastro.QCadastroIND_FISICA_JURIDICA.Value <> QOperacaoIND_FISICA_JURIDICA.Value then
        raise Exception.Create('Operação Inválida - Quanto a Opção Física/Jurídica');
    if QOperacaoIND_TIPO_PAGAMENTO.Value <> 'T' then
    begin
      if (DBRGCondicaoPagamento.ItemIndex = 0) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'V') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      if (DBRGCondicaoPagamento.ItemIndex = 1) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'P') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      if (DBRGCondicaoPagamento.ItemIndex = 2) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'O') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
    end;

//    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'BRASIL') and
//      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MEDIPECAS') then
    if (DMParamSistema.QParamSistemaIND_RG_CPF_NF.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
    begin
      if (QOperacaoInd_Emite.Value = 'F') and (DMCadastro.QCadastroNUM_CGC_CPF.Value = '') and
        (DMNotaSaida.QNotaSaidaCOD_ESTADO.Value <> 'EX') and
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CEREAIS') then
        raise Exception.Create('Cadastro sem Cnpj/Cpf');

      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL') and
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  <> 'CEREAIS') then
        if (QOperacaoInd_Emite.Value = 'F') and (DMCadastro.QCadastroNUM_INSCRICAO.Value = '') and
          (DMNotaSaida.QNotaSaidaCod_Estado.Value <> 'EX') then
          raise Exception.Create('Cadastro sem Inscricao/Identidade');
    end;

    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
      if (DMCadastro.QCadastroCOD_VENDEDOR.Text = '') and (QOperacaoInd_Vendas.Value = 'V') then
        raise Exception.Create('Não é Permitido Nota de Venda Sem Vendedor' + Chr(13) + 'Acertar Cadastro do Cliente');
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    if (DMCadastro.QCadastroCOD_RAMO.Value = 1) and
      (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') and
      (DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Text = '') then
      raise Exception.Create('Cadastro de produtor sem CADPRO');
  if DMNotaSaida.QItemNF.RecordCount = 0 then
    raise Exception.Create('Insira os itens da nota antes de confirmá-la.');
  DBRadioGroup1Click(Self);

  // REFORMA TRIBUTÁRIA
  with DMNotaSaida, DMOracle do
  begin
    wPercAux := BuscaNome('SELECT PERC_IBS_MUN FROM TB_CIDADE', 'COD_CIDADE = (SELECT COD_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + Trim(QNotaSaidaCOD_CADASTRO.Text) + ')');
    wPercIBSMun := StrToFloat(wPercAux);
    wPercAux := BuscaNome('SELECT PERC_IBS_UF FROM TB_ESTADO', 'COD_ESTADO = ' + QuotedStr(QNotaSaidaCOD_ESTADO.Value));
    wPercIBSUF := StrToFloat(wPercAux);
    QItemNFVAL_IBS_MUN.Value := (wPercIBSMun/100) * QItemNFVAL_TOTAL.Value;
    QItemNFVAL_IBS_EST.Value := (wPercIBSUF/100) * QItemNFVAL_TOTAL.Value;
  end;

  with DMNotaSaida do
  begin
    try
      pGravando := True;
      QItemNF.AutoCalcFields := False;
      QSomaItemNota.AutoCalcFields := False;
      QItemNF.DisableControls;
      QItemNF.DisableControls;
      QItemNF.First; // retirado pelo césar no dia 05/02/2001
      while not QItemNF.Eof do // incluido 11/16/99
      begin
        QItemNF.Edit;
        //        CalculaItem;
        //        CalculaICM;
        QItemNF.Post;
        QItemNF.Next;
      end;
      QItemNF.EnableControls;
      //     QItemNF.AutoCalcFields := True;
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
    except
      //     QItemNF.AutoCalcFields := True;
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
      QItemNF.EnableControls;
      QItemNF.EnableControls;
      raise;
    end;
  end;

  DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value := copy(CbConhecimentoExp.Text, 1, 2);

  inherited;
  DMNotaSaida.QItemNF.EnableControls;
  DMOracle.DBCemapa.Commit;

  with DMDevolucaoTroca do
  begin
    QValeProdutoValida.Close;
    QValeProdutoValida.ClearVariables;
    QValeProdutoValida.SetVariable('COD_NOTA_CAB_TROCA', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    QValeProdutoValida.Open;
  end;
  // Código para calcular o inss no momento de salvar a nota.
  if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA') or
     (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'HOSPITAL') then
     ConfirmarNota1Click(Self);
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);

  with DMImpressoraFiscal,DMNotaSaida do
  begin
    QChecaMD5NotaCab.Close;
    QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QNotaSaidaCOD_NOTA_CAB.Value);
    QChecaMD5NotaCab.Open;
    bib.GeraMD5Query(QChecaMD5NotaCab,'TB_NOTA_CAB');
  end;
end;

procedure TFNotaSaidaCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
  DBECodOperacaoExit(Self);
  DbEdit8.Setfocus;
end;

procedure TFNotaSaidaCad.BtConsTributacaoFreteClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Tributacao_Frete.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
end;

procedure TFNotaSaidaCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
  //DbEdit26.Setfocus; //foi tirado esse campo da tela. Vanessa 24/09/2015
  DBEdit27.SetFocus;
end;

procedure TFNotaSaidaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False; // digitacao manual de valores de icms
  if FNotaSaidaCons = nil then
     FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
     FNotaSaidaCons.DBGrid2.Columns.Items[1].FieldName := 'DESC_COMPLEMENTO';
  if FNotaSaidaCons.ShowModal = mrOk then
    with DMNotaSaida do
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK', QNotaSaidaConsCod_Nota_Cab.Value);
      QNotaSaida.Open;
      QValeProdutoTroca.Refresh;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK', DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
      DMCadastro.QCadastro.Open;
//      MePrazo.Text := DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text;
      MeCodValeProduto.Text := DMOracle.FastSelect('COD_VALE_PRODUTO','TB_VALE_PRODUTO',
        'COD_NOTA_CAB_TROCA = ' +IntToStr(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value));
      CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);
      CBIndIntermediador.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value = '', -1, StrToInt('0' + DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value));
    end;

  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
  AtualizaCodListaPreco;
  PCCabecalho.ActivePage := TSGeral;
end;

procedure TFNotaSaidaCad.BtImpPedClick(Sender: TObject);
var
  wTipoNota: string;
  wSerie, wSerieModelo: string;
begin
  inherited;
  if FPedidoCons = nil then
     FPedidoCons := TFPedidoCons.Create(Application);
  if FPedidoCons.ShowModal = mrOk then
  begin
    with DMPedido do
    begin
      QPedido.Close;
      QPedido.SetVariable('PK', QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;

      with DMNotaSaida do
      begin
        pTrazPedido := true;
        QNotaSaidaCod_Filial.Value := QPedidoCod_Filial.Value;
        If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') And (QPedidoCod_Filial.Value = 2) Then
           QNotaSaidaCod_Operacao.Value := 46
        Else
           QNotaSaidaCod_Operacao.Value := QPedidoCod_Operacao.Value;
        QNotaSaidaCod_Cadastro.Text := QPedidoCod_Cadastro.Text;
        QNotaSaidaCod_Departamento.Value := QPedidoCod_Departamento.Value;
        if DMParamSistema.CodEmpresa = 'LRMARMORE' then
          QNotaSaidaVAL_DESPESAS.Value := QPedidoVAL_FRETE.Value
        else
          QNotaSaidaVAL_DESPESAS.Value := QPedidoVAL_DESPESAS.Value;
        QNotaSaidaPerc_Comissao.Text := QPedidoPerc_Comissao.Text;
        QNotaSaidaIND_TIPO_FRETE.Text := QPedidoIND_TIPO_FRETE.Text;
{retirado pelo cesar 12/02/2021. Pollyana solicitou que apareça o prazo impresso na nota PE. Alex 09/04/2025.}
        QNotaSaidaNUM_DIAS_CARENCIA.Value := QPedidoNUM_PALM.Value;
        QNotaSaidaCOD_PRAZO_VENCIMENTO.Text := QPedidoCOD_PRAZO_VENCIMENTO.Text;
        QNotaSaidaVAL_AVISTA.Value := QPedidoVAL_ENTRADA.Value;
        if QPedidoCod_Vendedor.Text <> '' then
           QNotaSaidaCod_Vendedor.Text := QPedidoCod_Vendedor.Text;
        if QPedidoCod_Obra.Text <> '' Then
           QNotaSaidaCod_Obra.Text := QPedidoCod_Obra.Text;
        //vendedor pre_posto (NeoAli) junior - 12/06/2014
        if QPedidoCOD_VENDEDOR_PREPOSTO.Text <> '' then
           QNotaSaidaCOD_VENDEDOR_PREPOSTO.Text := QPedidoCOD_VENDEDOR_PREPOSTO.Text;
        if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'INSIDE') and
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DISPART') then
        begin
          QNotaSaidaOBS.Text := QPedidoDesc_Observacao.Text;
          QNotaSaidaObs_Complemento.Text := QPedidoDesc_Complemento_Obs.Text;
        end;
        if not QPedidoCOD_CADASTRO_TRANSPORTADORA.IsNull then
          QNotaSaidaCod_Transportador.Value := QPedidoCOD_CADASTRO_TRANSPORTADORA.Value;
        QNotaSaidaVal_Imposto.Text := QPedidoVal_Imposto.Text;
        QNotaSaidaVal_Desconto.Text := Bib.LimpaString(QPedidoVAL_DESCONTO.Text,'.');
        QNotaSaidaCod_Mensagem.Text := QPedidoCod_Mensagem.Text;
        QNotaSaidaNum_Pedido.Text := QPedidoNum_Pedido.Text;
        wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(QPedidoCod_Operacao.Value));

        if QPedidoIND_TIPO_PAGAMENTO.Value = 'A VISTA' then
           QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
        if QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO' then
           QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
        if QPedidoIND_TIPO_PAGAMENTO.Value = 'OUTROS' then
           QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';

{        if DMParamSistema.QparamSistemaCod_Empresa.Value = 'GRASEL' then
        begin
          DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value +
            'Pedido nr. ' + DMPedido.QPedidoConsNUM_PEDIDO.Text;
          if DMPEDIDO.QPedidoIND_TIPO_PAGAMENTO.Value = 'ADIANTAMENTO' then  //a pedido da Dani. Vanessa 30/01/2015
            DmNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
        end;  } // RETIRADO PELO CESAR 
{        if DMParamSistema.QparamSistemaCod_Empresa.Value = 'DINIZ' then
           QNotaSaidaCod_Operacao.Value := 41;} //DINIZ SAIU DO SIMPLES, REGRA NÃO APLICADA. JUNIOR 07/02/2023

        //Alterado para pegar série e modelo cadastrado na operação
        with DMOracle do
        begin
          wSerie := FastSelect('NVL(COD_SERIE,-1)','TB_OPERACAO',
            'COD_OPERACAO = ' + QPedidoCOD_OPERACAO.Text);
          wSerieModelo := FastSelect('NVL(COD_SERIE_MODELO,-1)','TB_OPERACAO',
            'COD_OPERACAO = ' + QPedidoCOD_OPERACAO.Text);
          if (wSerie = '-1') or (wSerieModelo = '-1') then
            MessageDlg('Série e/ou modelo não informados na operação.' + #13#10 +
              'Verifique o cadastro da operação e informe esses dados.',
              mtInformation, [mbOk],0)
          else
          begin
            QNotaSaidaCOD_SERIE.Value := wSerie;
            QNotaSaidaCOD_SERIE_MODELO.Value := wSerieModelo;
          end;
        end;
        QNotaSaidaIND_CONSUMIDOR_FINAL.Value := QPedidoIND_CONSUMIDOR_FINAL.Value;
      end;
    end;
    PImportaPedidos_Items; // procedure para puxar os itens do pedido
    DMNotaSaida.pTrazPedido := false;
  end;
  FPedidoCons.MeTexto.Enabled := True;
end;

procedure TFNotaSaidaCad.BtConsOCAbertoClick(Sender: TObject);
begin
  inherited;
  if FPedido_ConsAberto = nil then
    FPedido_ConsAberto := TFPedido_ConsAberto.Create(Application);
  with FPedido_ConsAberto do
  begin
    METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
    MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
    MEProduto.Text := DMNotaSaida.QItemNFCod_Produto.Text;
    METexto.Enabled := False;
    MEFilial.Enabled := False;
    MEProduto.Enabled := False;
    BtConsCadastro.Enabled := False;
    BtConsFilial.Enabled := False;
    BtConsProduto.Enabled := False;
  end;
  if FPedido_ConsAberto.ShowModal = mrOk then
    MENumPedidoBaixar.Text := DMPedido.QPedidoAbertoCod_Pedido_Item.Text;
  FPedido_ConsAberto := nil;
end;

procedure TFNotaSaidaCad.BtBaixaOCClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if QNotaSaidaInd_Situacao.Value > '1' then //Digitada
      raise Exception.Create('Nota já Confirmada ou Cancelada!');
    try
      QAtuBaixaPed.Open;
      QAtuBaixaPed.Insert;
      QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QAtuBaixaPedCod_Pedido_Item.Value := StrToInt(Trim(MENumPedidoBaixar.Text));
      QAtuBaixaPedQt_Baixa.Value := StrToFloat(MEQtBaixarOC.Text);
      QAtuBaixaPed.Post;
      QBaixasPed.Close;
      QBaixasPed.Open;
    except
      if QAtuBaixaPed.State = dsInsert then
        QAtuBaixaPed.Cancel;
      raise;
    end;
    MENumPedidoBaixar.Text := '';
    MEQtBaixarOC.Text := '';
    QAtuBaixaPed.Close;
  end;
end;

procedure TFNotaSaidaCad.BtCancelaBaixaOCClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if QNotaSaidaInd_Situacao.Value > '1' then //Digitada
      raise Exception.Create('Nota já Confirmada ou Cancelada!');

    QAtuBaixaPed.Close;
    QAtuBaixaPed.Open;
    QAtuBaixaPed.First;
    while not QAtuBaixaPed.Eof do
    begin
      if QAtuBaixaPedCod_Pedido_Item.Value = QBaixasPedCod_Pedido_Item.Value then
        QAtuBaixaPed.Delete;
      QAtuBaixaPed.Next;
    end;
    QBaixasPed.Close;
    QBaixasPed.Open;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFNotaSaidaCad.BtImpItemPedClick(Sender: TObject);
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  if FPedidoCons.ShowModal = mrOk then
  begin
    with DMPedido do
    begin
      DMNotaSaida.QBaixasPed.Close;
      QPedido.Close;
      QPedido.SetVariable('PK', QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      PImportaPedidos_Items; // procedure para trazer os itens de pedido foi desmembrado porque chama do cabeçalho tb
    end;
  end;
  FPedidoCons.METexto.Enabled := True;
  FPedidoCons.BtConsCadastro.Enabled := True;
  FPedidoCons.MEFilial.Enabled := True;
  FPedidoCons.BtConsFilial.Enabled := True;
end;

procedure TFNotaSaidaCad.DSItemNFStateChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    btnImportacaoItens.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled := QNotaSaida.State = dsEdit;
    BtConsProduto.Enabled := QNotaSaida.State = dsEdit;
    BtConsTributacao.Enabled := QNotaSaida.State = dsEdit;
    If QItemNF.State = DsInsert Then
     Begin
       PCNota.ActivePage := TsItemProduto;
//       DBECodProduto.SetFocus;          Não descomentar, pois cancela o insert, se for clicado no DBGrid. SetFocus movido para o click do DBNavigator - Alessandro.
     End;
  end;
end;

procedure TFNotaSaidaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    // ** Pedidos ***
    GBBaixaPed.Enabled := (QNotaSaida.State = dsBrowse) and (QNotaSaidaInd_Situacao.Value <> '2');
    BtConsOCAberto.Enabled := GBBaixaPed.Enabled;
    BtBaixaOC.Enabled := GBBaixaPed.Enabled;
    BtCancelaBaixaOC.Enabled := GBBaixaPed.Enabled;
    // ******
    BtImpPed.Enabled := QNotaSaida.State in [dsEdit, dsInsert];
    //SBConsultaFrete.Enabled := not BtImpPed.Enabled;
    //SBImprimeCupomFiscal.Enabled := SBConsultaFrete.Enabled;
    //SBGeraContaCorrente.Enabled := SBConsultaFrete.Enabled;
    //SBCartaCorrecao.Enabled := SBGeraContaCorrente.Enabled;
    btnImportacaoItens.Enabled := (QNotaSaida.State in [dsEdit, dsInsert]) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled := BtImpPed.Enabled;
    BtConsTributacao.Enabled := BtImpPed.Enabled;
    BtConsCadastro.Enabled := BtImpPed.Enabled;
    BtConsOperacao.Enabled := BtImpPed.Enabled;
    BtConsMensagem.Enabled := BtImpPed.Enabled;
    BtMensagem.Enabled := (QNotaSaida.State in [dsEdit, dsInsert]) and (QItemNF.State = dsBrowse);
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
    begin // nao permite alterar o departamento depois de incluir itens
      BtConsDepartamento.Enabled := (QNotaSaida.State in [DsInsert]) and (QItemNF.State = dsBrowse);
      DBEdit53.Enabled := (QNotaSaida.State in [DsInsert]) and (QItemNF.State = dsBrowse);
    end
    else
      BtConsDepartamento.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsVendedorPre.Enabled := BtImpPed.Enabled;
    BtConsFilial.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsProduto.Enabled := btImpPed.Enabled;
    BtParceiro.Enabled := btImpPed.Enabled;
    BtCultura.Enabled := btImpPed.Enabled;
    BtNotaCabRef.Enabled := btImpPed.Enabled;
    BtImportaNfRef.Enabled := btImpPed.Enabled;
    SBChaveAcesso.Enabled := BtImpPed.Enabled;
    MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
    MMCadSimples.Items[3].Enabled := DSPrimario.DataSet.State = dsBrowse;
    if(DSPrimario.State = dsEdit) then
      pCodFilial := QNotaSaidaCOD_FILIAL.Value;
    btSerieCons.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
    btPrazoCons.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
    btImportaCte.Enabled := not (DSPrimario.DataSet.State = DSBrowse);
    BtBuscarValeProduto.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
    MeCodValeProduto.ReadOnly := not (DSPrimario.DataSet.State in [dsEdit, dsInsert]);
    DBPanel15.BuscaEnabled := not (DSPrimario.DataSet.State = DSBrowse);
    GBValeCompras.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;

  end;
end;

procedure TFNotaSaidaCad.PCNotaChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if PCNota.ActivePage = TSBaixaPedido then
      DMNotaSaida.QBaixasPed.Open
    else
      DMNotaSaida.QBaixasPed.Close;
    if (DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'S')
      and (QItemNF.Eof) then
      BtImpItemNotaClick(Self);
    if PCNota.ActivePage = TsItemProduto then
    begin
      if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
       // DBENumFabricante.SetFocus   Alterado para taborder pois não deixava sair da tela de produto.
       DBENumFabricante.TabOrder := 1
      else
        //DBECodProduto.SetFocus;
        DBECodProduto.TabOrder := 1;
      if (QNotaSaidaCOD_OPERACAO.Text <> '') and (QNotaSaidaIND_SITUACAO.Value = '1') then
        if DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO',
         'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True) = 'D' then
        begin
          BtNotaCompra_ConsClick(Self);
        end;
    end;
  end;
end;

procedure TFNotaSaidaCad.ConfirmarNota1Click(Sender: TObject);
var wValeProdutoAux: Real;
    wNum_parcelas : integer;
    wSenha_informada, wSenha_Banco, wPrivilegio, wBancoPadrao, wPadrao: String;
//label
//  lErroQrCode;
begin
  inherited;
  try
    DMNotaSaida.QPagamento.Close;
    DMNotaSaida.QPagamento.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMNotaSaida.QPagamento.Open;
    DMNotaSaida.pValorValeCompras := 0;
    DMNotaSaida.pValorNovoValeCompras := 0;
    DMNotaSaida.pValorValePresente := 0;
    DMNotaSaida.pValorNovoValePresente := 0;

    DMParamSistema.QParamSistema.RefreshRecord;
    DMNotaSaida.QNotaSaida.Close; // esta fechando para verificar se nao tem outro terminal que esta confirmando a mesma nota
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    if DMNotaSaida.QNotaSaidaIND_SITUACAO.Value = '2' then
      raise Exception.Create('Nota Fiscal já confirmada!');
    if DMNotaSaida.QNotaSaidaIND_SITUACAO.Value = '3' then
      raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
    if not DMUsuario.ContabilPrivilegiado then // foi colocado aqui - porque deixa-se a nota digitada e depois consulta e confirma a nota
      if DMParamSistema.QParamSistemaDT_FECHAMENTO_SISTEMA.Text <> '' then
        if DMParamSistema.QParamSistemaDT_FECHAMENTO_SISTEMA.Value >= DMNotaSaida.QNotaSaidaDT_EMISSAO.Value then
          raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');
 {Movido para quando iniciar a nota. Alex 27/04/2023
    //colocado este teste para não permitir emitir nota fiscal de clientes que não estão pagando o sistema - Cesar Angonese
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCod_Filial.Text) = 'C' Then
       raise Exception.Create('Cliente com pendência financeira - Favor entrar em contato com Cemapa');}

    if (DMParamSistema.QParamSistemaIND_CADPRO_OBRIGATORIO_NOTA.Value = 'SIM') then
      if (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '55') and
         (DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO','COD_CADASTRO = ' +
          DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) = 'F') and
         (DMOracle.BuscaNome('SELECT DESC_INSCRICAO_MUNICIPAL FROM TB_CADASTRO','COD_CADASTRO = ' +
         DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) = '') Then
         raise Exception.Create('Informe a inscrição estadual do produtor.');
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' Then // Nereu solicitou que vendas acima de 12 vezes sem entrada somente com senha dele
       If DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text <> '' Then
        Begin
          wNum_parcelas := StrToInt(DMOracle.FastSelect('NUM_PARCELAS','TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = ' + DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.AsString));
          If (wNum_parcelas > 12) and (DMNotaSaida.QNotaSaidaVAL_AVISTA.Value = 0) Then
          Begin
            if FSenha = nil then
               FSenha := TFSenha.Create(Application);
            FSenha.MeUsuario.Visible := True;
            FSenha.Label2.Visible := True;
            FSenha.BtConsProduto.Visible := True;
            FSenha.Caption := 'Permitir venda sem desconto: ';
            FSenha.ShowModal;
            if FSenha.ModalResult = mrOk then
             begin
                wSenha_Informada := Bib.Encode(UpperCase(FSenha.EdSenha.Text+Copy(wBranco,1,10-Length(FSenha.EdSenha.Text)))); //Criptografia da Cemapa para senha de usuario
                wSenha_Banco := DMOracle.FastSelect('DESC_SENHA','TB_USUARIO','COD_USUARIO = ' + FSenha.MeUsuario.Text);
                wPrivilegio := DMOracle.FastSelect('IND_PRIVILEGIO','TB_USUARIO','COD_USUARIO = ' + FSenha.MeUsuario.Text);
                If wPrivilegio <> 'P' Then
                   raise Exception.Create('Usuário informado não tem privilégio para liberar venda');
                If wSenha_Informada <> wSenha_Banco Then
                   raise Exception.Create('Senha Informada não confere');
             End
            Else
               raise Exception.Create('Deve ser informado um usuario e senha para liberar');
          End;
        End;
    if FNotaSaida_Confirma = nil then
      FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
    //Adicionado Modal atualiza data de assinatura 31/08/2021 -Kauã
    if (DMParamSistema.CodEmpresa = 'JORNAL') and (DMOracle.FastSelect('DT_VENCIMENTO_TABELA_PRECO','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.AsString) <> '') then
    begin
     if FAtualizadataassinatura = nil then
       FAtualizadataassinatura := TFAtualizadataassinatura.Create(Application);
     FAtualizadataassinatura.ShowModal;
    end;
    // Tratamento do Vale-compras
    DMNotaSaida.QSomaItemNota.Refresh;
    //DMNotaSaida.pValesProdutos := TStringList.Create;
    TrataValeProduto('VALE-COMPRAS');

    // Tratamento do Vale-presente
    DMNotaSaida.QSomaItemNota.Refresh;
    TrataValeProduto('VALE-PRESENTE');
    DMNotaSaida.QSomaItemNota.Refresh;
    DMNotaSaida.QSomaVales.Close;
    DMNotaSaida.QSomaVales.Open;

    DMNotaSaida.SetaEmissao(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMNotaSaida.ChecaNota;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.pConfirmando := True;
//    if MePrazo.Text <> '' then alterado pelo cesar 12/02/2021
    If DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text <> '' Then
      FNotaSaida_Confirma.MePrazo.Text := DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text; // prazo que veio dos pedidos
//    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
//    begin
//      FNotaSaida_Confirma.PnComissao.Visible := True;
//      if (not DMNotaSaida.QNotaSaidaNUM_PEDIDO.IsNull) then
//        FNotaSaida_Confirma.EComissao.Text := FormatFloat('#,###,##0.00', StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + DMNotaSaida.QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text)))
//      else
//        FNotaSaida_Confirma.EComissao.Text := '0,00';
//    end
//    else
//      FNotaSaida_Confirma.PnComissao.Visible := False;
    FNotaSaida_Confirma.MeDepartamento.Text := DMNotaSaida.QNotaSaidaCOD_DEPARTAMENTO.Text; // IntToStr(DMUsuario.CodDepartamentoUsuario); trocado pelo César 16/02/2021
    FNotaSaida_Confirma.MEDepartamentoExit(Self);
    //Buscar finalidade da operação, caso não tiver busca do usuario. Junior 23/09/2020. Suporte(1061).
    with DMOperacao do
    begin
      QOperacao.Close;
      QOperacao.SetVariable('Pk', StrToInt('0'+Trim(DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text)));
      QOperacao.Open;
      if DMOperacao.QOperacaoCOD_FINALIDADE.Text <> '' then
        FNotaSaida_Confirma.MeFinalidade.Text := DMOperacao.QOperacaoCOD_FINALIDADE.Text
      else
        FNotaSaida_Confirma.MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
    end;
 {Solicitado pela Girardi para preencher automaticamente o código da conta corrente ao finalizar a nota a prazo. CodSuporte: 9161. Alex 10/06/2024.}
    if (DMParamSistema.CodEmpresa = 'GGIRARDI') or (DMParamSistema.CodEmpresa = 'BRINDES') then
    begin
      wPadrao := 'SIM';
      wBancoPadrao := DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_BANCO_AGENCIA', 'IND_BANCO_PADRAO = ''' + wPadrao + '''');
      if (wBancoPadrao <> '') then
      begin
        FNotaSaida_Confirma.MeContaCorrente.Text := DMOracle.FastSelect('COD_CONTA_CORRENTE','TB_CONTA_CORRENTE','COD_BANCO_AGENCIA = ' + wBancoPadrao);
        FNotaSaida_Confirma.MeContaCorrenteExit(Self);
      end;
    end;
    if Trim(FNotaSaida_Confirma.MEFinalidade.Text) <> '' then
      FNotaSaida_Confirma.EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + FNotaSaida_Confirma.MEFinalidade.Text)
    else
      FNotaSaida_Confirma.EdFinalidade.Text := '';
{    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    begin
      FNotaSaida_Confirma.MeFinalidade.Text := '2';
    end;  }
{Comentado a chamada do laçamento de cartão pois no modelo 65 a condição de pagto é 3.
movido para dentro de procedure TFNotaSaida_Confirma.BtAvancarClick / Alex 01/02/2023
    if DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S' then
    Begin
      DMNotaSaida.wLancCartaoIndividual := False;
      if ((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') or//cartão débito
          (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '4')) then //cartão Crédito
      Begin
        if FLancamentoCartao = nil then
          FLancamentoCartao := TFLancamentoCartao.Create(Application);
        FLancamentoCartao.ShowModal;
      end; }
   {   if (DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value) -  //lança para mais de 1 cartão
               StrToFloat('0' + DMOracle.BuscaNome('SELECT  SUM(VAL_ORIGINAL) FROM TB_LANCAMENTO_CARTAO',
                                                   'COD_NOTA_CAB = '+ DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text)) <> 0 then
      Begin
        if FLancamentoCartao = nil then
          FLancamentoCartao := TFLancamentoCartao.Create(Application);
        FLancamentoCartao.ShowModal;
      end;
    end;  }
    FNotaSaida_Confirma.ShowModal;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.pConfirmando := False;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QNotaSaida.EnableControls;
    SBRefreshClick(Self);
    wEnviaBoletoEmail := FNotaSaida_Confirma.cbEnviaEmail.Checked;
  except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    raise;
  end;
  FNotaSaida_Confirma.Free;
  FNotaSaida_Confirma := nil;

  {
    Incluir aqui as validações para verificar se o contas a receber
    Verificar se a compra é parcelada, se é sicredi, se é padrão API
    Se sim, chamar a classe responsável nesse ponto para que ela
    faça o envio dos boletos.
  }
     GeraBoletoApi;
  {
    Incluir aqui as validações para verificar se o contas a receber
    Verificar se a compra é parcelada, se é sicredi, se é padrão API
    Se sim, chamar a classe responsável nesse ponto para que ela
    faça o envio dos boletos.
  }


end;

procedure TFNotaSaidaCad.DBECodNotaChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QNotaSaidaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QNotaSaidaInd_Situacao.Value = '3';
    MMCadSimples.Items[2].Items[20].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    //MMCadSimples.Items[2].Items[21].Enabled := QNotaSaidaInd_Situacao.Value = '4';
    MMCadSimples.Items[2].Items[21].Enabled := false;
    QSomaVales.Close;
    QSomaVales.Open;
    QSomaItemNota.Close;
    QSomaItemNota.Open;
  end;
end;

procedure TFNotaSaidaCad.VoltaConfirmao1Click(Sender: TObject);
var
  wAux: string;
  waux1: integer;
begin
  inherited;
  with DMNotaSaida do
  begin
    if QNotaSaida.Eof then
      exit;
    with DMNfe do
    begin
      if QNotaSaidaCOD_SERIE_MODELO.Value = '65' then
      begin
        if not QNfe.Eof or (QNfeCOD_NOTA_CAB.Value <> QNotaSaidaCOD_NOTA_CAB.Value) then
          SetaNfe(Bib.LimpaNumero(QNotaSaidaDESC_CHAVE_ACESSO.Value));
        if QNfeSIT_NFE.Value = '149' then
          raise Exception.Create('Não é permitido voltar a confirmação de uma NFC-e emitida em contingência.');
        if (QSomaPagamentosVAL_TEF.Value > 0) and
           (QSomaPagamentosVAL_TEF_PROCESSADO.Value = QSomaPagamentosVAL_TEF.Value) then
          if MessageDlg('Se voltar a confirmação o pagamento TEF será cancelado. Deseja mesmo continuar?',mtWarning,[mbYes, mbNo],0) = mrNo then
            Abort;
      end;
    end;
  end;
  if (DMOracle.BuscaNome('SELECT COD_OFICINA_CAB FROM TB_OFICINA_CAB', 'COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '') then
    raise Exception.Create('Não é possível voltar a confirmação de uma nota gerada por uma OS.');
  if not DMNotaSaida.QNotaSaidaCOD_ORDEM_SERVICO_CAB.IsNull then
    raise Exception.Create('Não é possível voltar a confirmação de uma nota gerada por uma OS.');
  wAux := DMOracle.BuscaNome('SELECT COD_PRODUCAO_AGRICOLA FROM TB_PRODUCAO_AGRICOLA',
    'COD_NOTA_CAB_SAIDA = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
  if (wAux <> '') then
    raise Exception.Create('Essa nota foi gerada pelo Sistema PjIndustria.' + chr(13) + chr(10) +
      'Para voltar a confirmação dela você deve voltar a confirmação da Produção Agrícola de código ' + wAux);
  if not DMNotaSaida.QNotaSaidaNUM_OS.IsNull then
    raise Exception.Create('Essa Nota foi gerada pelo sistema de oficina, portanto não pode ser voltada.');
  //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') or
//    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO') or
//    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGENS') then
  if (DMParamSistema.QParamSistemaIND_SENHA_VOLTA_CONFIRMACAO.Value = 'SIM') and
     (DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> 'CD') then//Modificado por Adriel em 27/12/2017
  begin                                                                        //Para Aristides pedido por Cesar
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
  if not DMUsuario.ContabilPrivilegiado then
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' then
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
        raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  try
{Adicionado pois estava gerando problema no sequencial das notas fiscais, o cliente voltava a confirmação mas não zerava o numero da nota, desta forma a nota fiscal
era emitida com o sequencial da nota PE. Autorizado por Marcos. Alex 13/06/2024}
    if ( (DMParamSistema.CodEmpresa = 'FINESTRA') or (DMParamSistema.CodEmpresa = 'REFRISM') or (DMParamSistema.CodEmpresa = 'MODASUL') )
        and (DMNotaSaida.QNotaSaidaCOD_SERIE.Value = 'PE') then
    begin
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET NUM_NOTA = 0 WHERE COD_NOTA_CAB = ' + chr(39) + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;

    if DMNotaSaida.QSomaPagamentosVAL_TEF_PROCESSADO.Value > 0 then
      FTEF.Finaliza(0);
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    DMNotaSaida.VoltaConfirmacao;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    DMOracle.Audit(TOracleDataset1(DMNotaSaida.QNotaSaida), 'Volta Confirmacao');
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    raise;
  end;
  If DMOracle.BuscaNome('SELECT COD_LANCAMENTO_CARTAO FROM TB_LANCAMENTO_CARTAO','COD_NOTA_CAB ='+DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '' then
  Begin
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE TB_LANCAMENTO_CARTAO WHERE COD_NOTA_CAB = ' + chr(39) + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Não foi possível voltar o lançamento do cartão!');
    end;
  end;
//Exclui lançamento do movimento bancário quando o tipo de pagamento da nota for PIX. Alex 23/09/2022
  if (DMOracle.FastSelect('COD_BCO_MOVIMENTO','TB_BCO_MOVIMENTO','COD_NOTA_CAB =' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '') then
  begin
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE TB_BCO_MOVIMENTO WHERE COD_NOTA_CAB = ' + chr(39) + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFNotaSaidaCad.CancelarNota1Click(Sender: TObject);
var
  iRetornoAux: Integer;
  cCPF, cNomeCliente, cEnderecoCliente, cTexto, wDescPrazoVencimento, wCodPedido, wEmite, wRetorno: String;
  TemTEF: Boolean;
begin
  inherited;
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' then
    raise Exception.Create('Esta Nota Fiscal já está cancelada!');
  if DMNotaSaida.QNotaSaidaNUM_NOTA.Value = 0 then
    raise Exception.Create('Não é possível cancelar uma nota que não foi confirmada.' +
      #13 + #10 + 'Para se desfazer dessa nota basta excluir.');
  if DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' then
    raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
  wEmite := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Operacao.Value));
  If wEmite = 'F' Then // nota fiscal com opção de emissão
   Begin
     If(DmNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value = '') Then
        raise Exception.Create('Está Nota Não foi Enviada para SEFAZ - Favor Verificar!')
     Else
       Begin
         wEmite := DMOracle.BuscaNome('SELECT DESC_RETORNO_PROCESSAMENTO FROM TB_NF_ELETRONICA', 'COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_cab.Value));
         If wEmite <> '100' Then
            Raise Exception.Create('Nota fiscal não foi autorizada na SEFAZ - Favor Verificar');
       End;
   End;
  if FNotaSaida_Cancela = nil then
    FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);

  if (DMNotaSaida.QSomaPagamentosVAL_TEF.Value > 0) then
  begin
    DMNotaSaida.QSomaPagamentos.Refresh;
    if (DMNotaSaida.QSomaPagamentosVAL_TEF.Value =
        DMNotaSaida.QSomaPagamentosVAL_TEF_EFETUADO.Value) then
    begin
      if FTef = nil then
        FTef := TFTef.Create(Application);
      FTEF.IndNFCe := False;
      FTEF.ValorTransacao := 0;
      FTEF.Modalidade := 200;
      FTEF.btIniciaTef.Visible := true;
      FTEF.Comprovantes := TStringList.Create;
      FTEF.lbMensagem.Caption := '';
      if FTEF.ShowModal <> mrOk then
        Abort;
    end;
  end;
  if FNotaSaida_Cancela.ShowModal = MrOk then
  begin
    with DMOperacao, DMNotaSaida do
    begin
      // Chamar cancelamento de Pedido referente a nota.
      if QNotaSaidaNUM_PEDIDO.Value <> 0 then
      begin
        wCodPedido := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB',
          'NUM_PEDIDO = ' + QNotaSaidaNUM_PEDIDO.AsString);
        if Trim(wCodPedido) <> '' then
        begin
          with DMPedido do
          begin
            QPedido.Close;
            QPedido.SetVariable('PK', wCodPedido);
            QPedido.Open;
            QPedidoItem.Close;
            QPedidoItem.SetVariable('COD_PEDIDO_CAB', wCodPedido);
            QPedidoItem.Open;
            CancelaPedido;
          end;
        end;
      end;
      QOperacao.Close;
      QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Text);
      QOperacao.Open;
      QNotaNome.Close;
      QNotaNome.SetVariable('PK', QNotaSaidaCOD_NOTA_CAB.Text);
      QNotaNome.Open;
    end;
    if (DMOperacao.QOperacaoIND_CUPOM_FISCAL.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
    begin
      if FImpressoraFiscal = nil then
        FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' then
        FImpressoraFiscal.Y8000ECF('1E')
      else
      begin
        with DMNotaSaida do
        begin
          cCPF             := QNotaNomeDESC_CGC_CPF.Value;
          cNomeCliente     := QNotaNomeNOME.Value;
          cEnderecoCliente := '';
        end;
        iRetorno := Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( cCPF ), pchar( cNomeCliente ), pchar( cEnderecoCliente ) );
        FImpressoraFiscal.Analisa_iRetorno();
        iRetornoAux := iRetorno;
        FImpressoraFiscal.Retorno_Impressora();
        if iRetornoAux = 1 then
        begin
          cTexto := 'Comprovante Vinculado ao CF da NF '+ DMNotaSaida.QNotaSaidaNUM_NOTA.Text;
          iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado( pchar( cTexto ));
          FImpressoraFiscal.Analisa_iRetorno();
          FImpressoraFiscal.Retorno_Impressora();

          iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado();
          FImpressoraFiscal.Analisa_iRetorno();
          FImpressoraFiscal.Retorno_Impressora();
        end;

        iRetorno := Bematech_FI_CancelaCupom();
        FImpressoraFiscal.Analisa_iRetorno();
        iRetornoAux := iRetorno;
        FImpressoraFiscal.Retorno_Impressora();
//**************************************************************************
        //rotina do TEF

        if (iRetornoAux = 1) then
        begin
          TemTEF := False;
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') and
          (DMOracle.FastSelect('NVL(DESC_IP_TEF,0)','TB_FILIAL',
              'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text) <> '0') then
          begin
              //Para tef da aristides
            if DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text <> '' then
            begin
              wDescPrazoVencimento :=
                DMOracle.FastSelect('DESC_PRAZO_VENCIMENTO','TB_PRAZO_VENCIMENTO',
                  'COD_PRAZO_VENCIMENTO = ' + DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text);
              if Pos('CARTAO',UpperCase(Trim(wDescPrazoVencimento))) > 0 then
                TemTEF := True;
            end;
          end
          else
            //Normal
            if DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '4' then
              TemTEF := True;

          if TemTEF and (FImpressoraFiscal.StatusTEF <> 0) then
          begin
            if FTef = nil then
              FTef := TFTef.Create(Application);
            FTEF.ValorTransacao := 0;
            FTEF.Modalidade := 200;
            FTEF.btIniciaTef.Visible := true;
            FTEF.Comprovantes := TStringList.Create;
            FTEF.lbMensagem.Caption := '';
            FTEF.ShowModal;
            FImpressoraFiscal.StatusTEF := 1;
          end;
        end;
        //fim da rotina do tef
//**************************************************************************
      end;
    end;
  end;
  if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
      (DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO','COD_PRODUTO= '+DMNotaSaida.QItemNFCOD_PRODUTO.Text) = 'S')) then
    Begin
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_DESPESA_RECUP WHERE COD_NOTA_ITEM IN');
      DMOracle.QExecSQL.SQL.Add('(SELECT COD_NOTA_ITEM FROM TB_NOTA_ITEM WHERE');
      DMOracle.QExecSQL.SQL.Add('COD_NOTA_CAB ='+DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text+' )');
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end; 
end;

procedure TFNotaSaidaCad.VoltaCancelamento1Click(Sender: TObject);
var
  XML: TXMLDocument;
  Node: IXMLNode;
  Amb: string;
begin
  inherited;
  if (not DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.isNull) then
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.Value);
      QFilial.Open;
      with DMNfe do
      begin
        SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
        if (QNfeind_cancelado.Value) or (QNfeind_denegado.Value) then
        begin
          if DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '98' then
          begin
            MessageDlg('Nota já está cancelada no servidor do município, não é possível voltar.', mtError, [mbOK], 0);
            Exit;
          end
          else
          begin
            XML := TXMLDocument.Create(Application);
            XML.XML.Text := QNfeDESC_XML_NFE.Value; //Tem de testar volta de nota denegada!
            XML.Active := True;
            Node := XML.DocumentElement.ChildNodes.FindNode('infNFe');
            Node := Node.ChildNodes.FindNode('ide');
            Amb := Node.ChildNodes.FindNode('tpAmb').Text;
            if Amb = '1' then
            begin
              MessageDlg('Nota já está cancelada na SEFAZ, não é possível voltar.', mtError, [mbOK], 0);
              Exit;
            end;
          end;
        end;
      end;
    end;
  DMNotaSaida.VoltaCancelamento;
end;

procedure TFNotaSaidaCad.RelaodeNotas1Click(Sender: TObject);
Var
  wTipoNota: String;
begin
  inherited;
  if FNotaEntradaParam = nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FNotaEntradaParam.ShowModal = MrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text), 'VENDA');
      QRelacao.Close;
      if Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text) = '' then
        QRelacao.SetVariable('FILIAL', Null)
      else
        QRelacao.SetVariable('FILIAL', StrToInt(Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text)));

      QRelacao.SetVariable('ENTRADA_SAIDA', 'S');

      if Trim(FNotaEntradaParam.ME0DataI.Text) <> ''  then
         QRelacao.SetVariable('DATA_I', StrToDate(FNotaEntradaParam.ME0DataI.Text))
      Else
         QRelacao.SetVariable('DATA_I', Null);

      if Trim(FNotaEntradaParam.ME0DataF.Text) <> ''  then
         QRelacao.SetVariable('DATA_F', StrToDate(FNotaEntradaParam.ME0DataF.Text))
      Else
         QRelacao.SetVariable('DATA_F', Null);

      if Trim(FNotaEntradaParam.Me0DtEmissao_I.Text) <> '' Then
         QRelacao.SetVariable('DT_EMISSAO_I', StrToDate(FNotaEntradaParam.Me0DtEmissao_I.Text))
      Else
         QRelacao.SetVariable('DT_EMISSAO_I', Null);

      if Trim(FNotaEntradaParam.Me0DtEmissao_F.Text) <> '' Then
         QRelacao.SetVariable('DT_EMISSAO_F', StrToDateTime(FNotaEntradaParam.Me0DtEmissao_F.Text))
      Else
         QRelacao.SetVariable('DT_EMISSAO_F', Null);

      if Trim(Copy(FNotaEntradaParam.ME0DataHoraI.Text, 1, 2)) <> '' then
      begin
        // Valida a data e hora antes de enviar.
        StrToDateTime(FNotaEntradaParam.ME0DataHoraI.Text);
        QRelacao.SetVariable('DT_USUARIO_I', FNotaEntradaParam.ME0DataHoraI.Text);
      end
      else
        QRelacao.SetVariable('DT_USUARIO_I', Null);

      if Trim(Copy(FNotaEntradaParam.ME0DataHoraF.Text, 1, 2)) <> '' then
      begin
        // Valida a data e hora antes de enviar.
        StrToDateTime(FNotaEntradaParam.ME0DataHoraF.Text);
        QRelacao.SetVariable('DT_USUARIO_F', FNotaEntradaParam.ME0DataHoraF.Text);
      end
      else
        QRelacao.SetVariable('DT_USUARIO_F', Null);

      case FNotaEntradaParam.RG0TipoNota.ItemIndex of
        0: begin
             wTipoNota := 'Todas';
             QRelacao.SetVariable('SITUACAO', Null);
           end;
        1: begin
             wTipoNota := 'Digitadas';
             QRelacao.SetVariable('SITUACAO', '1');
           end;
        2: begin
             wTipoNota := 'Confirmadas';
             QRelacao.SetVariable('SITUACAO', '2');
           end;
        3: begin
             wTipoNota := 'Canceladas';
             QRelacao.SetVariable('SITUACAO', '3');
           end;
      end;
      case FNotaEntradaParam.Rg1TipoPagto.ItemIndex of //ind_condicao_pagto passou a ser variável de substituição. Junior 16/05/2019
        0: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 1');//vista
        1: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 2');//prazo
        2: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3');//outros
        3: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 4');//cartão Crédito
        4: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 5');//cartão Débito
        5: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 6');//Pix
        6: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)');//débito e crédito
        7: QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 7');//Convenio
        8: QRelacao.SetVariable('TIPO_PAGTO', '1=1');//geral
       { 3: begin   alterado para ter todas as opções de cartões para todos os clientes. Marcos 16/12/2020
           if DMParamSistema.CodEmpresa = 'DINGLIS' then //Dinglis solicitou para aparecer as vendas cartão Deb/Cred utilizando o mesmo filtro. Junior 16/05/2019
             QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)')//cartao
           else
             QRelacao.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 4');//cartao
           end; }
      end;

      //Frames-----------------
      if Trim(FNotaEntradaParam.FmCadastro1.MeCadastro.Text) = '' then
        QRelacao.SetVariable('CADASTRO', Null)
      else
        QRelacao.SetVariable('CADASTRO', Trim(FNotaEntradaParam.FmCadastro1.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmTrasnportador1.MeCadastro.Text) = '' then
        QRelacao.SetVariable('TRANSPORTADOR', Null)
      else
        QRelacao.SetVariable('TRANSPORTADOR',Trim(FNotaEntradaParam.FmTrasnportador1.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmCidade1.MeCidade.Text) = '' then
        QRelacao.SetVariable('COD_CIDADE', Null)
      else
        QRelacao.SetVariable('COD_CIDADE', Trim(FNotaEntradaParam.FmCidade1.MeCidade.Text));

      //Alterado para buscar vários vendedores  separados por virgula Solicitado por Nestor(Deion) - Marcos - Cleber-08/06/2019
      if Trim(FNotaEntradaParam.MeCodVendedor.Text) = '' then
        QRelacao.SetVariable('VENDEDOR', '1=1')
      else
        QRelacao.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaEntradaParam.MeCodVendedor.Text) +  ')');
      //TECNICO
      if Trim(FNotaEntradaParam.FmTecnico1.MeVendedor.Text) = '' then
        QRelacao.SetVariable('COD_TECNICO', Null)
      else
        QRelacao.SetVariable('COD_TECNICO', Trim(FNotaEntradaParam.FmTecnico1.MeVendedor.Text));

      //Permitir várias operaçãoes separados por vírgula. Solicitado: Rubens(Kreuz). Junior-08/05/2015.
      if Trim(FNotaEntradaParam.ME1Operacao.Text) <> '' then
      begin
        QRelacao.SetVariable('OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaEntradaParam.ME1Operacao.Text))+')');
      end
      else
        QRelacao.SetVariable('OPERACAO', '1=1');

{Alterado para buscar vários Departamentos separados por virgula Solicitado por Guilherme(Pixixe) - Alex - 19/05/2026}
      if Trim(FNotaEntradaParam.ME1Departamento.Text) = '' then
        QRelacao.SetVariable('DEPARTAMENTO', '1=1')
      else
        QRelacao.SetVariable('DEPARTAMENTO', 'TB_NOTA_CAB.COD_DEPARTAMENTO IN (' + TRIM(FNotaEntradaParam.ME1Departamento.Text) +  ')');

      if Trim(FNotaEntradaParam.FmMotivo1.MeMotivo.Text) = '' then
        QRelacao.SetVariable('MOTIVO', Null)
      else
        QRelacao.SetVariable('MOTIVO', Trim(FNotaEntradaParam.FmMotivo1.MeMotivo.Text));

      if Trim(FNotaEntradaParam.FmSerie1.MeSerie.Text) = '' then
        QRelacao.SetVariable('COD_SERIE', Null)
      else
        QRelacao.SetVariable('COD_SERIE', Trim(FNotaEntradaParam.FmSerie1.MeSerie.Text));

      if Trim(FNotaEntradaParam.FmTributacao1.MeTributacao.Text) = '' then
        QRelacao.SetVariable('COD_TRIBUTACAO', Null)
      else
        QRelacao.SetVariable('COD_TRIBUTACAO', Trim(FNotaEntradaParam.FmTributacao1.MeTributacao.Text));

      if Trim(FNotaEntradaParam.FmLote1.MeLote.Text) = '' then
        QRelacao.SetVariable('COD_LOTE_TIPO', Null)
      else
        QRelacao.SetVariable('COD_LOTE_TIPO', Trim(FNotaEntradaParam.FmLote1.MeLote.Text));

      if Trim(FNotaEntradaParam.FmEstado1.MeEstado.Text) = '' then
        QRelacao.SetVariable('ESTADO', Null)
      else
        QRelacao.SetVariable('ESTADO', Trim(FNotaEntradaParam.FmEstado1.MeEstado.Text));

      if Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text) = '' then
      begin
        QRelacao.SetVariable('COD_PRODUTO', Null);
        QRelacaoItens.SetVariable('COD_PRODUTO', Null);
      end
      else
      begin
        QRelacao.SetVariable('COD_PRODUTO', Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text));
        QRelacaoItens.SetVariable('COD_PRODUTO', Trim (FNotaEntradaParam.FMProduto1.MeProduto.Text));
      end;

      if trim(FNotaEntradaParam.MeMarca.Text) = '' then
        QRelacao.SetVariable('COD_MARCA', Null)
      else
        QRelacao.SetVariable('COD_MARCA',trim(FNotaEntradaParam.MeMarca.Text));

      if Trim(FNotaEntradaParam.FmObra1.MeObra.Text) = '' then
        QRelacao.SetVariable('COD_OBRA', Null)
      else
        QRelacao.SetVariable('COD_OBRA', Trim(FNotaEntradaParam.FmObra1.MeObra.Text));

      if Trim(FNotaEntradaParam.ME0Classe.Text) = '' then
        QRelacao.SetVariable('CLASSE', Null)
      else
        QRelacao.SetVariable('CLASSE', FNotaEntradaParam.ME0Classe.Text);

      if (Trim(FNotaEntradaParam.ME0Subclasse.Text) = '') or (Trim(FNotaEntradaParam.ME0Subclasse.Text) = '0') then
        QRelacao.SetVariable('SUBCLASSE', Null)
      else
        QRelacao.SetVariable('SUBCLASSE', FNotaEntradaParam.ME0Subclasse.Text);

      if Trim(FNotaEntradaParam.MePedido1.Text) = '' then
        QRelacao.SetVariable('NUM_PEDIDO', Null)
      else
        QRelacao.SetVariable('NUM_PEDIDO', FNotaEntradaParam.MePedido1.Text);

      if Trim(FNotaEntradaParam.FmRamo1.MeRamo.Text) = '' then
        QRelacao.SetVariable('COD_RAMO', Null)
      else
        QRelacao.SetVariable('COD_RAMO', FNotaEntradaParam.FmRamo1.MeRamo.Text);

      if Trim(FNotaEntradaParam.Me1PrazoVencimento.Text) = '' then
        QRelacao.SetVariable('COD_PRAZO_VENCIMENTO', Null)
      else
        QRelacao.SetVariable('COD_PRAZO_VENCIMENTO', FNotaEntradaParam.Me1PrazoVencimento.Text);
      if Trim(FNotaEntradaParam.Me1Bairro.Text) = '' then
        QRelacao.SetVariable('DESC_BAIRRO', Null)
      else
        QRelacao.SetVariable('DESC_BAIRRO', FNotaEntradaParam.Me1Bairro.Text);

      case FNotaEntradaParam.RG0TipoPessoa.ItemIndex of
        0: QRelacao.SetVariable('IND_FISICA_JURIDICA', 'F');
        1: QRelacao.SetVariable('IND_FISICA_JURIDICA', 'J');
        2: QRelacao.SetVariable('IND_FISICA_JURIDICA', Null);
      end;

      if FNotaEntradaParam.Cb0Frete.Checked then
        QRelacao.SetVariable('MOSTRA_FRETE', 'S')
      else
        QRelacao.SetVariable('MOSTRA_FRETE', 'N');

      QRelacao.SQL.Strings[QRelacao.SQL.Count - 1] := '';
      case FNotaEntradaParam.CB0Ordem.ItemIndex of
        0: if FNotaEntradaParam.CB0Filial.Checked then
             QRelacao.SQL.Add('ORDER BY COD_FILIAL, NOME')
           else
             QRelacao.SQL.Add('ORDER BY COD_FILIAL, NOME');
        1: if FNotaEntradaParam.CB0Filial.Checked then
             QRelacao.SQL.Add('ORDER BY COD_FILIAL, DT_RECEBIMENTO, NUM_NOTA')
           else
             QRelacao.SQL.Add('ORDER BY DT_RECEBIMENTO, NUM_NOTA');
        2:  if FNotaEntradaParam.CB0Filial.Checked then
              QRelacao.SQL.Add('ORDER BY COD_FILIAL, NUM_NOTA')
            else
              QRelacao.SQL.Add('ORDER BY NUM_NOTA');
        3:  if FNotaEntradaParam.CB0Filial.Checked then
              QRelacao.SQL.Add('ORDER BY COD_FILIAL, DT_EMISSAO, NUM_NOTA')
            else
              QRelacao.SQL.Add('ORDER BY DT_EMISSAO, NUM_NOTA');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case

      if Trim(FNotaEntradaParam.Me10Nota.Text) <> '' then
      begin
        QRelacao.SetVariable('NUM_NOTA', 'TB_NOTA_CAB.NUM_NOTA IN ('+Bib.colocaaspanastring(Trim(FNotaEntradaParam.Me10Nota.Text))+')');
      end
      else
        QRelacao.SetVariable('NUM_NOTA', '1=1');

      if Trim(FNotaEntradaParam.Me1Observacao.Text) <> '' then   //Adicionado por ANDRE campo de consulta por observacao 24/10/2024
        QRelacao.SetVariable('DESC_OBSERVACAO', '%'+Trim(FNotaEntradaParam.ME1Observacao.Text)+'%')
      else
        QRelacao.SetVariable('DESC_OBSERVACAO', Null);

      //-----------------------------

      QRelacao.Open;
      QRelacaoItens.Open;
      if (DMParamSistema.CodEmpresa = 'NFCE-BAHIA') or (DMParamSistema.CodEmpresa = 'NFCE-RODOL') or
         (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
      begin
        if FRRelacaoNotas40Colunas = nil then
          FRRelacaoNotas40Colunas := TFRRelacaoNotas40Colunas.Create(Application);

        FRRelacaoNotas40Colunas.QRPrimario.Height := FRRelacaoNotas40Colunas.QRPrimario.Height + QRelacao.RecordCount * 19;

        if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
          FRRelacaoNotas40Colunas.QRPrimario.Preview
        else
          FRRelacaoNotas40Colunas.QRPrimario.Print;

      end
      else
      begin
        if FRNotasES_Relacao = nil then
          FRNotasES_Relacao := TFRNotasES_Relacao.Create(Application);

        if FNotaEntradaParam.CBMostraCustoLucro0.Checked = False then //Não mostrar lucro e custo a pedido Rubens. Vanessa 09/10/2014
        begin
          FRNotasES_Relacao.QRLabel12.Enabled := false;
          FRNotasES_Relacao.QRLabel16.Enabled := false;
          FRNotasES_Relacao.QRDBText10.Enabled := false;
          FRNotasES_Relacao.QRDBText13.Enabled := false;
          FRNotasES_Relacao.QRLVolume.Enabled := false;
          FRNotasES_Relacao.QRLCusto.Enabled := false;
        end
        else
        begin
          FRNotasES_Relacao.QRLabel12.Enabled := true;
          FRNotasES_Relacao.QRLabel16.Enabled := true;
          FRNotasES_Relacao.QRDBText10.Enabled := true;
          FRNotasES_Relacao.QRDBText13.Enabled := true;
          FRNotasES_Relacao.QRLVolume.Enabled := true;
          FRNotasES_Relacao.QRLCusto.Enabled := true;
        end;

        if FNotaEntradaParam.Cb0ItensNota.Checked = True then
        begin
          FRNotasES_Relacao.QRSubDetail1.Enabled := true;
          FRNotasES_Relacao.QRBandCab.Frame.DrawTop := True;
          FRNotasES_Relacao.QRDBText11.Enabled := false;
          FRNotasES_Relacao.QRLPecas.Enabled := false;
          FRNotasES_Relacao.QRLabel13.Enabled := true;
        end
        else
        begin
          FRNotasES_Relacao.QRSubDetail1.Enabled := False;
          FRNotasES_Relacao.QRBandCab.Frame.DrawTop := False;
          FRNotasES_Relacao.QRDBText11.Enabled := true;
          FRNotasES_Relacao.QRLabel13.Enabled := false; //Não sei porque esta escrito Peças. Tirei! Vanessa 30/11/2018 (Vou esperar alguma reclamação)
          FRNotasES_Relacao.QRDBText11.Enabled := false;
          FRNotasES_Relacao.QRLPecas.Enabled := false;
        end;

        if FNotaEntradaParam.CBCpfCidade.Checked = True then
          FRNotasES_Relacao.ChildBand1.Enabled := true
        else
          FRNotasES_Relacao.ChildBand1.Enabled := False;

        FRNotasES_Relacao.QRLTitulo.Caption := 'Relação de Notas de Saida : Recebim.: de ' + FNotaEntradaParam.ME0DataI.Text + ' até ' + FNotaEntradaParam.ME0DataF.Text +
                                               '     Emissão: de ' + FNotaEntradaParam.Me0DtEmissao_I.Text + ' até '+FNotaEntradaParam.Me0DtEmissao_F.Text;
        if (DMParamSistema.CodEmpresa = 'TOMATESMI') then
          FRNotasES_Relacao.QRLFilial.Caption := 'Filial:' + Trim(FNotaEntradaParam.FmFilial1.EdFilial.Text) + ' - ' + bib.FormataCPF(QRelacaoNUM_CGC.Text)
        else
          FRNotasES_Relacao.QRLFilial.Caption := 'Filial:' + Trim(FNotaEntradaParam.FmFilial1.EdFilial.Text);
        if Trim(FNotaEntradaParam.ME1Departamento.Text) <> '' then
          FRNotasES_Relacao.QRLDepartamento.Caption := 'Departamento:' + Trim(FNotaEntradaParam.ME1Departamento.Text)
        else
          FRNotasES_Relacao.QRLDepartamento.Caption := 'Departamento: Todos';
        FRNotasES_Relacao.QRLMotivo.Caption := 'Motivo:' + Trim(FNotaEntradaParam.FmMotivo1.EdMotivo.Text);
        FRNotasES_Relacao.QRLOperacao.Caption := 'Operação: ' + Trim(FNotaEntradaParam.ME1Operacao.Text) + ' ';
        FRNotasES_Relacao.QRLProduto.Caption := 'Produto: ' + Trim(FNotaEntradaParam.FmProduto1.EdProduto.Text) + ' ';
        FRNotasES_Relacao.QRLOperacao.Caption := FRNotasES_Relacao.QRLOperacao.Caption + ' - ' + Trim(FNotaEntradaParam.FmObra1.EdObra.Text);
        FRNotasES_Relacao.QRLabel24.Caption := 'Situação das Notas: ' + wTipoNota;
        if (Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text) <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZITO') then
        FRNotasES_Relacao.QRLOperacao.Caption := FRNotasES_Relacao.QRLOperacao.Caption
                                                  + '                              Produto: ' + Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text)
                                                  + ' - ' + Trim(copy(FNotaEntradaParam.FmProduto1.EdProduto.Text,1,25));
        FRNotasES_Relacao.QRLTransp.Caption := 'Transportador: (' + Trim(FNotaEntradaParam.FmTrasnportador1.MeCadastro.Text) + ')'
                                                + FNotaEntradaParam.FmTrasnportador1.EdCadastro.Text; 

        //FRNotasES_Relacao.QRLPrazo.Caption := 'Condição de Pagto:'+

        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 0 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+' À Vista  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//vista
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 1 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'À Prazo  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//prazo
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 2 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Outros  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//outros
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 3 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Cartão Crédito  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//cartão Débito
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 4 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Cartão Débito  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//cartão crédito
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
         if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 5 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Pix  '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//débito e crédito
            FRNotasES_Relacao.QRLabel22.Enabled := False;
            FRNotasES_Relacao.QRDBText24.Enabled := False;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 6 then
          begin
            FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Todos do Cartões '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//geral
            FRNotasES_Relacao.QRLabel22.Enabled := True;
            FRNotasES_Relacao.QRDBText24.Enabled := True;
          end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 7 then
        begin
          FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Conv. '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//Convênio
          FRNotasES_Relacao.QRLabel22.Enabled := True;
          FRNotasES_Relacao.QRDBText24.Enabled := True;

        end;
        if FNotaEntradaParam.Rg1TipoPagto.ItemIndex = 8 then
        begin
          FRNotasES_Relacao.QRLPrazo.Caption :='Cond. Pagto:'+ 'Todos '+'   Prazo Venc.: ' + trim(FNotaEntradaParam.Me1PrazoVencimento.Text) + '-' + trim(FNotaEntradaParam.Ed1PrazoVencimento.Text);//geral
          FRNotasES_Relacao.QRLabel22.Enabled := True;
          FRNotasES_Relacao.QRDBText24.Enabled := True;

        end;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then //Aparecer N Ord Servico no lugar do Num Pedido. 21/08/2014
        begin
          FRNotasES_Relacao.QRLabel5.Caption := 'NºOrd Serv';
          FRNotasES_Relacao.QRLabel5.left := 285;
        end;
        if DMParamSistema.CodEmpresa = 'GGIRARDI' then
        begin
          FRNotasES_Relacao.QRLParceria.Caption := 'Cód. DCB: ' + FNotaEntradaParam.MeCodDCB.Text;
          FRNotasES_Relacao.QRLotes.Enabled := True;
        end;
        if FNotaEntradaParam.CB0Filial.Checked then
        begin
          FRNotasES_Relacao.QRGFilial.Enabled := True;
          FRNotasES_Relacao.QRTotalFilial.Enabled := True;
        end
        else
        begin
          FRNotasES_Relacao.QRGFilial.Enabled := False;
          FRNotasES_Relacao.QRTotalFilial.Enabled := False;
        end;

        if (Trim(Copy(FNotaEntradaParam.ME0DataHoraI.Text, 1, 2)) <> '') or (Trim(Copy(FNotaEntradaParam.ME0DataHoraF.Text, 1, 2)) <> '') then
          FRNotasES_Relacao.QRLabel23.Caption := 'Data/Hora Usuário: ' + FNotaEntradaParam.ME0DataHoraI.Text + ' Até: ' + FNotaEntradaParam.ME0DataHoraF.Text
        else
          FRNotasES_Relacao.QRLabel23.Caption := 'Data/Hora Usuário: Todo o período';

        if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
          FRNotasES_Relacao.QRPrimario.Preview
        else
          FRNotasES_Relacao.QRPrimario.Print;
      end;
      QRelacao.Close;
      QRelacaoItens.Close;
      if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
        RelaodeNotas1Click(Self);
    end;
end;

procedure TFNotaSaidaCad.Conferncia1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[1].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text), 'VENDA');
      QConferencia.Close;
      QConferencia.SetVariable('ENTRADA_SAIDA', 'S');
      if Trim(FNotaEntradaParam.ME1DataI.Text) <> '' then
        QConferencia.SetVariable('DATA_I', FNotaEntradaParam.ME1DataI.Text);
      if Trim(FNotaEntradaParam.ME1DataF.Text) <> '' then
        QConferencia.SetVariable('DATA_F', FNotaEntradaParam.ME1DataF.Text + ' 23:59:59');

      if Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text) = '' then
        QConferencia.SetVariable('FILIAL', Null)
      else
        QConferencia.SetVariable('FILIAL', Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text));

      if Trim(FNotaEntradaParam.FmCadastro2.MeCadastro.Text) = '' then
        QConferencia.SetVariable('CADASTRO', Null)
      else
        QConferencia.SetVariable('CADASTRO', Trim(FNotaEntradaParam.FmCadastro2.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmOperacao2.MeOperacao.Text) = '' then
        QConferencia.SetVariable('OPERACAO', Null)
      else
        QConferencia.SetVariable('OPERACAO', Trim(FNotaEntradaParam.FmOperacao2.MeOperacao.Text));
      if Trim(FNotaEntradaParam.FmVendedor2.MeVendedor.Text) = '' then
        QConferencia.SetVariable('COD_VENDEDOR', Null)
      else
        QConferencia.SetVariable('COD_VENDEDOR', Trim(FNotaEntradaParam.FmVendedor2.MeVendedor.Text));
      if Trim(FNotaEntradaParam.FmVendedorPreposto2.MeVendedor.Text) = '' then
        QConferencia.SetVariable('COD_VENDEDOR_PREPOSTO', Null)
      else
        QConferencia.SetVariable('COD_VENDEDOR_PREPOSTO', Trim(FNotaEntradaParam.FmVendedorPreposto2.MeVendedor.Text));
      if Trim(FNotaEntradaParam.FmObra2.MeObra.Text) = '' then
        QConferencia.SetVariable('COD_OBRA', Null)
      else
        QConferencia.SetVariable('COD_OBRA', Trim(FNotaEntradaParam.FmObra2.MeObra.Text));
      if Trim(FNotaEntradaParam.FmDepartamento2.MeDepartamento.Text) = '' then
        QConferencia.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QConferencia.SetVariable('COD_DEPARTAMENTO', Trim(FNotaEntradaParam.FmDepartamento2.MeDepartamento.Text));
      if Trim(FNotaEntradaParam.FmMarca2.MeMarca.Text) = '' then
        QConferencia.SetVariable('COD_MARCA', Null)
      else
        QConferencia.SetVariable('COD_MARCA', Trim(FNotaEntradaParam.FmMarca2.MeMarca.Text));

      if Trim(FNotaEntradaParam.FmProduto2.MeProduto.Text) = '' then
        QConferencia.SetVariable('COD_PRODUTO', Null)
      else
        QConferencia.SetVariable('COD_PRODUTO', Trim(FNotaEntradaParam.FmProduto2.MeProduto.Text));

      if Trim(FNotaEntradaParam.ME2Cultura.Text) = '' then
        QConferencia.SetVariable('COD_CULTURA', Null)
      else
        QConferencia.SetVariable('COD_CULTURA', Trim(FNotaEntradaParam.ME2Cultura.Text));

      if Trim(FNotaEntradaParam.FmFornecedor2.MeCadastro.Text) = '' then
        QConferencia.SetVariable('COD_FORNECEDOR', Null)
      else
        QConferencia.SetVariable('COD_FORNECEDOR', Trim(FNotaEntradaParam.FmFornecedor2.MeCadastro.Text));

      if Trim(FNotaEntradaParam.Me2Transportador.Text) = '' then
        QConferencia.SetVariable('COD_TRANSPORTADOR', Null)
      else
        QConferencia.SetVariable('COD_TRANSPORTADOR', Trim(FNotaEntradaParam.Me2Transportador.Text));

      case FNotaEntradaParam.RG2TipoFrete.ItemIndex of
        0: QConferencia.SetVariable('IND_TIPO_FRETE', null);
        1: QConferencia.SetVariable('IND_TIPO_FRETE', 'FOB');
        2: QConferencia.SetVariable('IND_TIPO_FRETE', 'CIF');
        3: QConferencia.SetVariable('IND_TIPO_FRETE', 'TER');
        4: QConferencia.SetVariable('IND_TIPO_FRETE', 'REM');
        5: QConferencia.SetVariable('IND_TIPO_FRETE', 'DES');
        6: QConferencia.SetVariable('IND_TIPO_FRETE', 'SEM');
      end;

      case FNotaEntradaParam.RG1TipoNota.ItemIndex of
        0: QConferencia.SetVariable('SITUACAO', Null);
        1: QConferencia.SetVariable('SITUACAO', '1');
        2: QConferencia.SetVariable('SITUACAO', '2');
        3: QConferencia.SetVariable('SITUACAO', '3');
      end;
      
      case FNotaEntradaParam.Cb1Ordem.ItemIndex of
        0: QConferencia.SQL.Add('');
        1: QConferencia.SQL.Add('ORDER BY NOME_FORNECEDOR');
        2: QConferencia.SQL.Add('ORDER BY TB_NOTA_CAB.DT_RECEBIMENTO');
        3: QConferencia.SQL.Add('ORDER BY TB_NOTA_CAB.NUM_NOTA');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end;

      if trim(FNotaEntradaParam.FmFinalidade2.MeFinalidade.Text) = '' then
      begin
        QConferencia.SetVariable(':TABELAS', Null);
        QConferencia.SetVariable(':FINALIDADE', 'AND 1 = 1')
      end
      else
      begin
        QConferencia.SetVariable(':TABELAS', ',TB_CONTA_RECEBER_CAB CR');
        QConferencia.SetVariable(':FINALIDADE', 'AND TB_NOTA_CAB.COD_NOTA_CAB '
          + '= CR.COD_NOTA_CAB AND CR.COD_FINALIDADE = '
          + trim(FNotaEntradaParam.FmFinalidade2.MeFinalidade.Text));
      end;

      QConferencia.Open;
      QConfItem.Close;
      QConfItem.Open;
      QConfContaPagar.Close;
      QConfContaPagar.Open;
      DMNotaEntrada.QImposto.Close;
      DMNotaEntrada.QImposto.Master := QConferencia;
      DMNotaEntrada.QImposto.MasterFields := 'COD_NOTA_CAB';
      DMNotaEntrada.QImposto.Open;
      if FRNotasES_Conferencia = nil then
        FRNotasES_Conferencia := TFRNotasES_Conferencia.Create(Application);
      FRNotasES_Conferencia.QRLTitulo.Caption := 'Conferência de Notas de Saída de '+ FNotaEntradaParam.ME1DataI.Text + ' até ' +FNotaEntradaParam.ME1DataF.Text;
      FRNotasES_Conferencia.pValTotal := 0;
      FRNotasES_Conferencia.pValIPITotal := 0;

      FRNotasES_Conferencia.QRLObra.Caption := 'Obra: ' + Trim(FNotaEntradaParam.FmObra2.EdObra.Text);
      FRNotasES_Conferencia.QRLValUn.Enabled := FNotaEntradaParam.CB1ValUn.Checked;
      with FNotaEntradaParam.FmVendedor2 do
        FRNotasES_Conferencia.QRLvendedor.Caption := IfThen(Trim(MeVendedor.Text) = '',
          '', Trim(MeVendedor.Text) + ' - ') + EdVendedor.Text;
      if FNotaEntradaParam.CB1ValUn.Checked then
      begin
        FRNotasES_Conferencia.QRDBTDescLote.DataField := 'VAL_UNITARIO';
        FRNotasES_Conferencia.QRDBTDescLote.Alignment := taRightJustify;
      end
      else
      begin
        FRNotasES_Conferencia.QRDBTDescLote.DataField := 'DESC_LOTE';
        FRNotasES_Conferencia.QRDBTDescLote.Alignment := taLeftJustify;
      end;
      if (FNotaEntradaParam.rg1Codigo.ItemIndex = 1) or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') then
      begin
        FRNotasES_Conferencia.QRDBText6.DataField := 'FABRICANTE';
        FRNotasES_Conferencia.QRDBText6.Refresh;
      end;
      if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
        FRNotasES_Conferencia.QRPrimario.Preview
      else
        FRNotasES_Conferencia.QRPrimario.Print;
      QConferencia.Close;
      QConfItem.Close;
      QConfItem.Open;
      QConfContaPagar.Close;
      DMNotaEntrada.QImposto.Close;
      DMNotaEntrada.QImposto.MasterFields := '';
      QConferencia.SQL[QConferencia.SQL.Count - 1] := ''; // elimina a última Linha da SQL
    end;
end;

procedure TFNotaSaidaCad.Futura1Click(Sender: TObject);
var
  wNomeRelatorio: string;
begin
  inherited;
  if FNotaEntradaParam = nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text), 'VENDA');
      QRFutura.Close;
      QRFutura.Sql.Clear;
      QRFutura.Sql.Add('SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,');
      QRFutura.Sql.Add('Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.DESC_PRODUTO,Tb_nota_cab.NUM_NOTA,');
      QRFutura.Sql.Add('Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,Tb_nota_cab.COD_SERIE,TB_NOTA_ITEM.COD_LOTE_TIPO,');
      QRFutura.Sql.Add('DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,');
      QRFutura.SQL.Add('TB_NOTA_ITEM.VAL_UNITARIO - (PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) / DECODE(IND_ENTRADA_SAIDA,'+QuoteDStr('E')+',1,TB_NOTA_ITEM.QT_QUANTIDADE)'
        + '/ DECODE(IND_ENTRADA_SAIDA,'+QuoteDStr('S')+',1,(TB_NOTA_ITEM.QT_QUANTIDADE - TB_NOTA_AUX.QT_DEVOLVIDO - TB_NOTA_AUX.QT_ATENDIDO - TB_NOTA_AUX.QT_CANCELADO))) AS VAL_UNITARIO');
      // PARA NOTAS DE SAIDA O VALOR JA É UNITARIO, PARA NOTAS DE ENTRADA É VALOR TOTAL DO ITEM - CESAR 08/03/2021
      QRFutura.Sql.Add(',Tb_nota_cab.VAL_FUNRURAL,  ');
      QRfutura.Sql.Add('tb_nota_item.val_icms_subst  ');
      QRFutura.Sql.Add('FROM TB_NOTA_ITEM,TB_NOTA_CAB,TB_NOTA_AUX,TB_PRODUTO,TB_CLASSE ');
      QRFutura.Sql.Add(' WHERE Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ');
      QRFutura.Sql.Add(' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ');
      QRFutura.Sql.Add(' Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO  AND ');
      QRFutura.Sql.Add(' Tb_nota_cab.IND_SITUACAO = ' + QUOTEDSTR('2'));
      QRFutura.Sql.Add(' AND QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ');
      QRFutura.Sql.Add(' TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE  AND ');
      case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
        0:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'COM_FUT' + Chr(39));
            wNomeRelatorio := 'Rel. Notas de Compra Futura';
          end;
        1:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'VEN_FUT' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Venda Futura';
          end;
        2:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_FOR' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
          end;
        3:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_CLI' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
          end;
        4:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_FOR' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
          end;
        5:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_CLI' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
          end;
        6:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_EMP' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
          end;
        7:
          begin
            QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_OUT' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Deposito Outras Empresas';
          end;
      else
        raise Exception.Create('Nenhum tipo de Futura selecionado!');
      end;
      if Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
        QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text));
      if Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
        QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text));
      if Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
        QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text));
      if Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
        QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text));
      if Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
        QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text));
      if Trim(FNotaEntradaParam.ME2DataI.Text) <> '' then
        QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39));
      if Trim(FNotaEntradaParam.ME2DataF.Text) <> '' then
        QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39));
      if Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) <> '' then
        QRFutura.Sql.Add(' And TB_CLASSE.NUM_CLASSE = ' + Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text));
      if Trim(FNotaEntradaParam.ME2SubClasse.Text) <> '' then
        QRFutura.Sql.Add(' And TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FNotaEntradaParam.ME2SubClasse.Text));
      if (Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) <> '') then
        QRFutura.SQL.Add(' and TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text));
      //       +  ' OR TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) + ')'); Vilson pediu para tirar via e_mail
      QRFutura.Sql.Add(' ORDER BY DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_produto.DESC_PRODUTO');
      QRFutura.Open;
      if FRNotasES_Futura = nil then
        FRNotasES_Futura := TFRNotasES_Futura.Create(Application);
      FRNotasES_Futura.QRLTitulo.Caption := wNomeRelatorio;
      FRNotasES_Futura.QRLFilial.Caption := 'Filial:' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) + ' - ' + Trim(FNotaEntradaParam.FmFilial3.EdFilial.Text);
      FRNotasES_Futura.QRLVendedor.Caption := 'Vendedor:' + Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text) + ' De ' + FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
      FRNotasES_Futura.QRLClasse.Caption := 'Classe:' + Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) + ' SubClasse: ' + FNotaEntradaParam.Ed2SubClasse.Text;
      if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
        FRNotasES_Futura.QRPrimario.Preview
      else
        FRNotasES_Futura.QRPrimario.Print;
      QRFutura.Close;
    end;
end;

procedure TFNotaSaidaCad.MovEstoque1Click(Sender: TObject);
var
  wstrS: string;
begin
  inherited;
  if FNotaEntradaParam = nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[3].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text), 'VENDA');
      QRMovEstoque.Close;
      if (FNotaEntradaParam.ME3DataI.Text = '') or (FNotaEntradaParam.ME3DataF.Text = '') then
        raise Exception.Create('É necessário informar a data de Recebimento.');
      QRMovEstoque.SetVariable('DATA_I', FNotaEntradaParam.ME3DataI.Text);
      QRMovEstoque.SetVariable('DATA_F', FNotaEntradaParam.ME3DataF.Text + ' 23:59:59');
      if Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) = '' then
        QRMovEstoque.SetVariable('FILIAL', Null)
      else
        QRMovEstoque.SetVariable('FILIAL', FNotaEntradaParam.FmFilial4.MeFilial.Text);

      if Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) = '' then
        QRMovEstoque.SetVariable('CADASTRO', Null)
      else
        QRMovEstoque.SetVariable('CADASTRO', Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmCidade4.MeCidade.Text) = '' then
        QRMovEstoque.SetVariable('CIDADE', Null)
      else
        QRMovEstoque.SetVariable('CIDADE', Trim(FNotaEntradaParam.FmCidade4.MeCidade.Text));

      if Trim(FNotaEntradaParam.FmCadastroArmazem4.MeCadastro.Text) = '' then
        QRMovEstoque.SetVariable('COD_ARMAZEM_ALFANDEGADO', Null)
      else
        QRMovEstoque.SetVariable('COD_ARMAZEM_ALFANDEGADO', Trim(FNotaEntradaParam.FmCadastroArmazem4.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmFornecedor4.MeCadastro.Text) = '' then
        QRMovEstoque.SetVariable('FORNECEDOR', Null)
      else
        QRMovEstoque.SetVariable('FORNECEDOR', Trim(FNotaEntradaParam.FmFornecedor4.MeCadastro.Text));

      if Trim(FNotaEntradaParam.FmDepartamento4.MeDepartamento.Text) = '' then
        QRMovEstoque.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QRMovEstoque.SetVariable('COD_DEPARTAMENTO', Trim(FNotaEntradaParam.FmDepartamento4.MeDepartamento.Text));

      if Trim(FNotaEntradaParam.Fm3Classe.MeClasse.Text) = '' then
        QRMovEstoque.SetVariable('CLASSE', Null)
      else
        QRMovEstoque.SetVariable('CLASSE', Trim(FNotaEntradaParam.Fm3Classe.MeClasse.Text));
      {if Trim(FNotaEntradaParam.ME3SubClasse.Text) = '' then
        QRMovEstoque.SetVariable('SUB_CLASSE', Null)
      else
        QRMovEstoque.SetVariable('SUB_CLASSE', FNotaEntradaParam.Me3SubClasse.Text);} //Foi feito direto na sql - Vanessa 14/08/2015
      if Trim(FNotaEntradaParam.FmProduto4.MeProduto.Text) = '' then
        QRMovEstoque.SetVariable('PRODUTO', Null)
      else
        QRMovEstoque.SetVariable('PRODUTO', FNotaEntradaParam.FmProduto4.MeProduto.Text);
      if Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) = '' then
        QRMovEstoque.SetVariable('VENDEDOR', Null)
      else
        QRMovEstoque.SetVariable('VENDEDOR', FNotaEntradaParam.FmVendedor4.MeVendedor.Text);

      if Trim(FNotaEntradaParam.ME3CodContratoVenda.Text) = '' then
        QRMovEstoque.SetVariable('COD_CONTRATO_VEND', Null)
      else
        QRMovEstoque.SetVariable('COD_CONTRATO_VEND', StrToInt(Trim(FNotaEntradaParam.ME3CodContratoVenda.Text)));

      if Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text) = '' then
      begin
        QRMovEstoque.SetVariable('COD_OPERACAO', Null);
        QRMovEstoque.SetVariable('IND_ESTOQUE', 'S');
      end
      else
      begin
        QRMovEstoque.SetVariable('COD_OPERACAO', Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text));
        QRMovEstoque.SetVariable('IND_ESTOQUE', Null);
      end;
      if Trim(FNotaEntradaParam.FmLote4.MeLote.Text) = '' then
        QRMovEstoque.SetVariable('LOTE', Null)
      else
        QRMovEstoque.SetVariable('LOTE', FNotaEntradaParam.FmLote4.MeLote.Text);

      if FNotaEntradaParam.me3dco.text <> '  -   .    - ' then
        QRMovEstoque.SetVariable('NUM_DCO', FNotaEntradaParam.me3dco.text)
      else
        QRMovEstoque.SetVariable('NUM_DCO', null);
      if Trim(FNotaEntradaParam.FMestado3.MeEstado.Text) = '' then
        QRMovEstoque.SetVariable('COD_ESTADO', Null)
      else
        QRMovEstoque.SetVariable('COD_ESTADO', FNotaEntradaParam.FMestado3.MeEstado.Text);

      case FNotaEntradaParam.RG3Tipo.ItemIndex of
        0: QRMovEstoque.SetVariable('TIPO_NOTA', 'E');
        1: QRMovEstoque.SetVariable('TIPO_NOTA', 'S');
        2: QRMovEstoque.SetVariable('TIPO_NOTA', Null);
      end; // Case
      case FNotaEntradaParam.RG3TipoProduto.ItemIndex of
        0: QRMovEstoque.SetVariable('TIPO_PRODUTO', 'INDUSTRIAL');
        1: QRMovEstoque.SetVariable('TIPO_PRODUTO', 'COMERCIAL');
        2: QRMovEstoque.SetVariable('TIPO_PRODUTO', Null);
      end; // Case
      case FNotaEntradaParam.RG3ValorDeCusto.ItemIndex of
        0: QRMovEstoque.SetVariable('IND_MOSTRA_VAL_CUSTO', 'SIM');
        1: QRMovEstoque.SetVariable('IND_MOSTRA_VAL_CUSTO', 'NAO');
      end;
      case FNotaEntradaParam.Rg3TipoPessoa.ItemIndex of
        0: QRMovEstoque.SetVariable('IND_FISICA_JURIDICA', 'F');
        1: QRMovEstoque.SetVariable('IND_FISICA_JURIDICA', 'J');
        2: QRMovEstoque.SetVariable('IND_FISICA_JURIDICA', Null);
      end; // Case
      case FNotaEntradaParam.CB3Ordem.ItemIndex of
        -1: QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO, NUM_NOTA');
        0: QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO, NUM_NOTA');
        1: QRMovEstoque.SQL.Add('ORDER BY DT_RECEBIMENTO');
        2: QRMovEstoque.SQL.Add('ORDER BY DESC_PRODUTO,DT_EMISSAO, NUM_NOTA');
        3: QRMovEstoque.SQL.Add('ORDER BY COD_OPERACAO,DT_EMISSAO, NUM_NOTA');
      end; // Case

      if Trim(FNotaEntradaParam.ME3Serie.Text) = '' then
        QRMovEstoque.SetVariable('SERIE', Null)
      else
        QRMovEstoque.SetVariable('SERIE', FNotaEntradaParam.ME3Serie.Text);
      QRMovEstoque.Open;
      //if (DMParamSistema.CodEmpresa <> 'ITATIBA') then
      //begin
        if FRNotasES_MovEstoque = nil then
          FRNotasES_MovEstoque := TFRNotasES_MovEstoque.Create(Application);

        wstrS := 'Cliente: Todos - ';
        if Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) <> '' then
          wstrS := 'Cliente: ' + Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) + ' ' + FNotaEntradaParam.FmCadastro4.EdCadastro.Text;
        wstrS := wstrS + ' De ' + FNotaEntradaParam.ME3DataI.Text + ' Até ' + FNotaEntradaParam.ME3DataF.Text;
        FRNotasES_MovEstoque.QrlCadastro.Caption := wstrS;

        if trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) <> '' then
        begin
          FRNotasES_MovEstoque.QRLcnpj.caption := 'CNPJ: ' + dmoracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'COD_FILIAL = ' + trim(FNotaEntradaParam.FmFilial4.MeFilial.Text));
          FRNotasES_MovEstoque.QRLEndereco.caption := 'ENDEREÇO: ' + dmoracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL', 'COD_FILIAL = ' + trim(FNotaEntradaParam.FmFilial4.MeFilial.Text));
        end
        else
        begin
          FRNotasES_MovEstoque.QRLcnpj.caption := 'CNPJ : ';
          FRNotasES_MovEstoque.QRLEndereco.caption := 'ENDEREÇO: ';
        end;

        if FNotaEntradaParam.me3DCO.Text <> '  -   .    - ' then
          FRNotasES_MovEstoque.QRLDCO.caption := 'DCO : ' + FNotaEntradaParam.me3DCO.Text + ' Departamento: ' + FNotaEntradaParam.FmDepartamento4.EdDepartamento.Text
        else
          FRNotasES_MovEstoque.QRLDCO.caption := 'Departamento: ' + FNotaEntradaParam.FmDepartamento4.EdDepartamento.Text;
        if Trim(FNotaEntradaParam.ME3Serie.Text) = '' then
          FRNotasES_MovEstoque.QRLSerie.caption := ' '
        else
          FRNotasES_MovEstoque.QRLSerie.caption := 'Serie: ' + FNotaEntradaParam.ME3Serie.Text;

        if (Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) <> '') then
          FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: ' + Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) + ' ' + FNotaEntradaParam.FmFilial4.EdFilial.Text
        else
          FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: Todas';
        wstrS := 'Estado:'+FNotaEntradaParam.FmEstado3.EdEstado.Text;
        if Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) <> '' then
          wstrS := wstrS + ' - Vendedor: ' + Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaEntradaParam.FmVendedor4.EdVendedor.Text)
        else
          wstrS := wstrS + ' - Vendedor: Todos';
        FRNotasES_MovEstoque.QRLParceiro.Caption := wstrS;

        if FNotaEntradaParam.RG3ValorDeCusto.ItemIndex = 0 then
          FRNotasES_MovEstoque.QRLabel14.Caption := 'Custo'
        else
          FRNotasES_MovEstoque.QRLabel14.Caption := 'Vl.Un.';

        if FNotaEntradaParam.Rg3Forma.ItemIndex = 1 then
          FRNotasES_MovEstoque.QRDetalhe.Enabled := False
        else
          FRNotasES_MovEstoque.QRDetalhe.Enabled := True;

        if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
          FRNotasES_MovEstoque.QRPrimario.Preview
        else
          FRNotasES_MovEstoque.QRPrimario.Print;
      //end
{Relatório com layout diferente para a Itatiba. Solicitado por Daniel. Alex 15/08/2024}
      {else
      begin
        if FRNotasES_MovEstoqueItatiba = nil then
          FRNotasES_MovEstoqueItatiba := TFRNotasES_MovEstoqueItatiba.Create(Application);

        wstrS := 'Cliente: Todos - ';
        if Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) <> '' then
          wstrS := 'Cliente: ' + Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) + ' ' + FNotaEntradaParam.FmCadastro4.EdCadastro.Text;
        wstrS := wstrS + ' De ' + FNotaEntradaParam.ME3DataI.Text + ' Até ' + FNotaEntradaParam.ME3DataF.Text;
        FRNotasES_MovEstoqueItatiba.QrlCadastro.Caption := wstrS;

        if trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) <> '' then
        begin
          FRNotasES_MovEstoqueItatiba.QRLcnpj.caption := 'CNPJ: ' + dmoracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'COD_FILIAL = ' + trim(FNotaEntradaParam.FmFilial4.MeFilial.Text));
          FRNotasES_MovEstoqueItatiba.QRLEndereco.caption := 'ENDEREÇO: ' + dmoracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL', 'COD_FILIAL = ' + trim(FNotaEntradaParam.FmFilial4.MeFilial.Text));
        end
        else
        begin
          FRNotasES_MovEstoqueItatiba.QRLcnpj.caption := 'CNPJ : ';
          FRNotasES_MovEstoqueItatiba.QRLEndereco.caption := 'ENDEREÇO: ';
        end;

        if (Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) <> '') then
          FRNotasES_MovEstoqueItatiba.QrlFilial.Caption := 'Filial: ' + Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) + ' ' + FNotaEntradaParam.FmFilial4.EdFilial.Text
        else
          FRNotasES_MovEstoqueItatiba.QrlFilial.Caption := 'Filial: Todas';

        if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
          FRNotasES_MovEstoqueItatiba.QRPrimario.Preview
        else
          FRNotasES_MovEstoqueItatiba.QRPrimario.Print;
      end;}

      QRMovEstoque.SQL[QRMovEstoque.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      QRMovEstoque.Close;
    end;
end;

procedure TFNotaSaidaCad.Emisso1Click(Sender: TObject);
var
  wLote: Integer;
  Modelo,wResult: string;
begin
  inherited;
  FNotaImpressao := TFNotaImpressao.Create;
  if DMParamSistema.QParamSistemaIND_CONFIRMA_EMISSAO.Value = 'S' then // não solicita uma confirmação para imprimir
    if MessageDlg('Deseja emitir a NOTA/PEDIDO Nº ' + DMNotaSaida.QNotaSaidaNUM_NOTA.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) = MrNo then // caso nao for imprimir sai da procedure
      Exit;
  Modelo := DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value;
  if (Modelo <> '55') and (Modelo <> '98') and (Modelo <> '65') then
    FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)
  else
  begin
    wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
    if wResult = '' then
      wLote := 0
    else
      wLote := StrToInt(wResult);
    if (not DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    with DMNfe do
    begin
      SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
      if QNfeind_aprovado.Value or QNfeind_cancelado.Value then
      begin
        if FNfEletronicaLoteCons = nil then
          FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
        FNfEletronicaLoteCons.CarregaNota(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
        FNfEletronicaLoteCons.Foco := nfDanfe;
        FNfEletronicaLoteCons.ShowModal;
        Exit;
      end;
      if not QNfeind_denegado.Value then
      begin
        FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value,'',wLote,true);
      end
      else
        MessageDlg('Nota denegada. Não será gerada cópia.', mtInformation, [mbOK], 0);
    end
    else
      FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'',wLote,true);
  end;
  //2 via do cupom - Ainda não funciona
  with DMOracle, DMNotaSaida do
  begin
    if (FastSelect('IND_CUPOM_FISCAL','TB_OPERACAO','COD_OPERACAO = ' +
      QNotaSaidaCOD_OPERACAO.Text) = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
      if FastSelect('IND_SEGUNDA_VIA_CUPOM','TB_OPERACAO','COD_OPERACAO = ' +
        QNotaSaidaCOD_OPERACAO.Text) = 'SIM' then
        begin
          FImpressoraFiscal.ImprimeComprovanteNaoFiscalVinculado(false);
        end;
  end;
  FNotaImpressao.Free;
  SBRefreshClick(Self);
end;
{
procedure TFNotaSaidaCad.ValidaFilial;
begin
//Adicionado para validar se a filial esta ativa para emissão de notas. Alex 27/04/2023
  if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCod_Filial.Text) = 'C' Then
    raise Exception.Create('Filial não habiliada para emissão de notas, favor entrar em contato com a gerência');
end;
 }
procedure TFNotaSaidaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
//  DMNotaSaida.ValidaFilial;
  if PCNota.ActivePage.Name <> 'TSGeral' then
    PCNota.ActivePage := TSCabecalho;
//  MePrazo.Clear;
  if DMParamSistema.CodEmpresa = 'ENCOPEL' then
    BtImpPedClick(Self)
  else
    if DMParamSistema.CodEmpresa = 'DEBONA' then
      ImportaPedidoDebona
    else
      BtConsCadastroClick(Self);

  if (DMParamSistema.CodEmpresa = 'MULTAGRO') then
    DBRGConsumidor.ItemIndex := 1;

  
  if DMParamSistema.CodEmpresa = 'FERRAGENS' then
    DBRGCondicaoPagamento.ItemIndex := 1;
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or //Marcos 07/01/2021
     (DMParamSistema.CodEmpresa = 'INJEPAR') then //Solicitado por Leni da Injepar. Alex 09/08/2022
    DBRadioGroup1.ItemIndex := 0;

  MeCodValeProduto.Clear;
  BibVenda.PersonalizaNota(DMParamSistema.CodEmpresa, Self);
  CBIndPresenca.ItemIndex := 1;
  if (DMParamSistema.CodEmpresa = 'STEIN') then
    DBECodOperacaoExit(Self);
end;

procedure TFNotaSaidaCad.iTEClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[0].TabVisible := True;
  FNotaSaidaParam.cbOrdem.ItemIndex := 0;
  if DMParamSistema.CodEmpresa <> 'RADIO' then
  Begin
    FNotaSaidaParam.FmOperacao1.Visible := False;
    FNotaSaidaParam.FmOperacao1.Enabled := False;
    with FNotaSaidaParam.FmVendedor1 do
    begin
      MeVendedor.Enabled := ((DMParamSistema.CodEmpresa <> 'BORGES') or
        (DMUsuario.Privilegiado)); // PARA BORGES BLOQUEAR RELATÓRIO APENAS PARA O VENDEDOR LOGADO. DIEGO A. S. 21/06/2010
      if not MeVendedor.Enabled then
      begin
        MeVendedor.Text := IntToStr(DMUsuario.CodUsuarioCorrente);
        MeVendedorExit(Sender);
      end;
    end;
    if FNotaSaidaParam.ShowModal = mrOk then
      with DMRelatorio_Venda do
      begin
        DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text), 'VENDA');

        if (DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value <> '7') and
           (DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value <> '9') and
           (DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value <> 'A') then
           DMNotaSaida.AtualizaComissao(StrToDate(FNotaSaidaParam.ME0DataI.Text));


        QRComissao.Close;
        QRComissao.SetVariable('DATA_I', FNotaSaidaParam.ME0DataI.Text);
        QRComissao.SetVariable('DATA_F', FNotaSaidaParam.ME0DataF.Text + ' 23:59:59');
        if Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text) = '' then
          QRComissao.SetVariable('FILIAL', Null)
        else
          QRComissao.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text));
        if Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text) = '' then
          QRComissao.SetVariable('VENDEDOR', Null)
        else
          QRComissao.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text));
        if Trim(FNotaSaidaParam.FmVendedorPreposto1.MeVendedor.Text) = '' then
          QRComissao.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRComissao.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto1.MeVendedor.Text));
        if Trim(FNotaSaidaParam.Ed0Serie.Text) = '' then
          QRComissao.SetVariable('SERIE', Null)
        else
          QRComissao.SetVariable('SERIE', Trim(FNotaSaidaParam.Ed0Serie.Text));
        if Trim(FNotaSaidaParam.Ed0Serie1.Text) = '' then
          QRComissao.SetVariable('SERIE1', Null)
        else
          QRComissao.SetVariable('SERIE1', Trim(FNotaSaidaParam.Ed0Serie1.Text));

        if FNotaSaidaParam.RGCondicaoPagto.ItemIndex <> 3 then
          QRComissao.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RGCondicaoPagto.ItemIndex + 1)
        else
          QRComissao.SetVariable('IND_CONDICAO_PAGTO', null);

        if Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text) = '' then
          QRComissao.SetVariable('SUPERVISOR', Null)
        else
          QRComissao.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text));

        case FNotaSaidaParam.CB0TipoProduto.ItemIndex of
          0: QRComissao.SetVariable('TIPO_PRODUTO', NULL);
          1: QRComissao.SetVariable('TIPO_PRODUTO', 'INDUSTRIAL');
          2: QRComissao.SetVariable('TIPO_PRODUTO', 'COMERCIAL');
          3: QRComissao.SetVariable('TIPO_PRODUTO', 'AGRICOLA');
          4: QRComissao.SetVariable('TIPO_PRODUTO', 'SERVIÇO');
          5: QRComissao.SetVariable('TIPO_PRODUTO', 'PEÇA');
        end;

        case FNotaSaidaParam.cbOrdem.ItemIndex of
          0: QRComissao.SetVariable('ORDEM', 'TB_NOTA_CAB.DT_EMISSAO, TB_NOTA_CAB.NUM_NOTA');
          1: QRComissao.SetVariable('ORDEM', 'TB_NOTA_CAB.DT_EMISSAO, TB_NOTA_ITEM.COD_PRODUTO');
          2: QRComissao.SetVariable('ORDEM', 'NOME_VENDEDOR');
        end;

        if Trim(FNotaSaidaParam.FmProduto1.MeProduto.Text) = '' then
          QRComissao.SetVariable('COD_PRODUTO', Null)
        else
          QRComissao.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto1.MeProduto.Text));

        if trim(fnotasaidaparam.FmFabricante1.MeCadastro.Text) = '' then
          QRComissao.SetVariable('COD_FABRICANTE', NULL)
        else
          QRComissao.SetVariable('COD_FABRICANTE', trim(FNotaSaidaParam.FmFabricante1.MeCadastro.Text));

        QRComissao.Open;
        if FRNota_Comissao = nil then
          FRNota_Comissao := TFRNota_Comissao.Create(Application);
        if FNotaSaidaParam.RG0TipoRelatorio.ItemIndex = 0 then
          FRNota_Comissao.pTipoRelatorio := 'ANALITICO'
        else
          FRNota_Comissao.pTipoRelatorio := 'SINTETICO';
        FRNota_Comissao.QRlTitulo.Caption := 'Comissao de Clientes de ' + FNotaSaidaParam.ME0DataI.Text + ' Ate ' + FNotaSaidaParam.ME0DataF.Text;

        if dmparamsistema.QParamSistemaCOD_EMPRESA.Text = 'NEOALI' then
          FRNota_Comissao.QRlSupervisor.Caption := 'Artista: ' + Trim(FNotaSaidaParam.FmVendedorPreposto1.EdVendedor.Text) + '      Vendedor: ' + Trim(FNotaSaidaParam.FmVendedor1.EdVendedor.Text)
        else
          FRNota_Comissao.QRlSupervisor.Caption := 'Supervisor: ' + Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmSupervisor1.EdVendedor.Text);

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_Comissao.QRPrimario.Preview
        else
          FRNota_Comissao.QRPrimario.Print;
        QRComissao.Close;
      end;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end
  else
  Begin
    FNotaSaidaParam.FmVendedorPreposto1.Enabled := False;
    FNotaSaidaParam.FmSupervisor1.Enabled := False;
    FNotaSaidaParam.FmProduto1.Enabled := False;
    FNotaSaidaParam.FmFabricante1.Enabled := False;
    FNotaSaidaParam.Label18.Enabled := False;
    FNotaSaidaParam.CB0TipoProduto.Enabled := False;
    FNotaSaidaParam.cbOrdem.Enabled := False;
    FNotaSaidaParam.Label23.Enabled := False;
    FNotaSaidaParam.RGCondicaoPagto.Enabled := False;

    FNotaSaidaParam.FmVendedorPreposto1.Visible := False;
    FNotaSaidaParam.FmSupervisor1.Visible := False;
    FNotaSaidaParam.FmProduto1.Visible := False;
    FNotaSaidaParam.FmFabricante1.Visible := False;
    FNotaSaidaParam.Label18.Visible := False;
    FNotaSaidaParam.CB0TipoProduto.Visible := False;
    FNotaSaidaParam.cbOrdem.Visible := False;
    FNotaSaidaParam.Label23.Visible := False;
    FNotaSaidaParam.RGCondicaoPagto.Visible := False;

    if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text), 'VENDA');

      QRComissaoClasse.Close;
      QRComissaoClasse.SetVariable('DATA_I', FNotaSaidaParam.ME0DataI.Text);
      QRComissaoClasse.SetVariable('DATA_F', FNotaSaidaParam.ME0DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text) = '' then
        QRComissaoClasse.SetVariable('FILIAL', Null)
      else
        QRComissaoClasse.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text) = '' then
        QRComissaoClasse.SetVariable('VENDEDOR', Null)
      else
        QRComissaoClasse.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text));

      if Trim(FNotaSaidaParam.Ed0Serie.Text) = '' then
        QRComissaoClasse.SetVariable('SERIE', Null)
      else
        QRComissaoClasse.SetVariable('SERIE', Trim(FNotaSaidaParam.Ed0Serie.Text));
      if Trim(FNotaSaidaParam.Ed0Serie1.Text) = '' then
        QRComissaoClasse.SetVariable('SERIE1', Null)
      else
        QRComissaoClasse.SetVariable('SERIE1', Trim(FNotaSaidaParam.Ed0Serie1.Text));

      if Trim(FNotaSaidaParam.FmOperacao1.MeOperacao.Text) <> '' then
        QRComissaoClasse.SetVariable('COD_OPERACAO', StrToInt(Trim(FNotaSaidaParam.FmOperacao1.MeOperacao.Text)))
      else
        QRComissaoClasse.SetVariable('COD_OPERACAO',Null);

      QRComissaoClasse.Open;
      if FRNota_Comissao_Rad = nil then
        FRNota_Comissao_Rad := TFRNota_Comissao_Rad.Create(Application);
      if FNotaSaidaParam.RG0TipoRelatorio.ItemIndex = 0 then
        FRNota_Comissao_Rad.pTipoRelatorio := 'ANALITICO'
      else
        FRNota_Comissao_Rad.pTipoRelatorio := 'SINTETICO';
      FRNota_Comissao_Rad.QRlTitulo.Caption := 'Comissao de Clientes de ' + FNotaSaidaParam.ME0DataI.Text + ' Ate ' + FNotaSaidaParam.ME0DataF.Text;
      FRNota_Comissao_Rad.QRLEmpresa.Caption := 'Filial : ' + Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text) + ' ' +Trim(FNotaSaidaParam.FmFilial1.EdFilial.Text);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_Comissao_Rad.QRPrimario.Preview
      else
        FRNota_Comissao_Rad.QRPrimario.Print;
      QRComissaoClasse.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.MapadeVendas1Click(Sender: TObject);
var
  wInt, wInt2: Integer;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[1].TabVisible := True;
  FNotaSaidaParam.Cb1Ordem.ItemIndex := 1;
  if (not DMUsuario.Privilegiado) and // serve para o vendedor somente conseguir tirar o relatorio de suas vendas
    (DMusuario.CodVendedorPadrao <> 0) and (DMUsuario.pTipoFuncionario = 'VENDEDOR') then
  begin
    FNotaSaidaParam.Me1CodVendedor.Enabled := False;
    FNotaSaidaParam.Sb1Vendedor.Enabled := False;
    FNotaSaidaParam.Me1CodVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  end;

  BibVenda.PersonalizaNotaSaidaParam(DMParamSistema.QParamSistemaCOD_EMPRESA.Value, FNotaSaidaParam);

  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text), 'VENDA');
      if (FNotaSaidaParam.RGTipo.ItemIndex = 1) or (FNotaSaidaParam.RGTipo.ItemIndex = 2) then // Analítico
      begin
        QRMapaVenda.Close;
        if (Trim(FNotaSaidaParam.ME1DataI.Text) <> '') and (Trim(FNotaSaidaParam.ME1DataF.Text) <> '') then
        begin
          QRMapaVenda.SetVariable('DATA_I', FNotaSaidaParam.ME1DataI.Text);
          QRMapaVenda.SetVariable('DATA_F', FNotaSaidaParam.ME1DataF.Text + ' 23:59:59');
        end
        else
          raise Exception.Create('É necessário informar a data Inicial e Final');

        if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text) = '' then
          QRMapaVenda.SetVariable('FILIAL', Null)
        else
          QRMapaVenda.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text));
        //Alterado para buscar vários vendedores  separados por virgula Solicitado por Nestor(Deion) - Marcos - Cleber-08/06/2019
        if (Trim(FNotaSaidaParam.Me1CodVendedor.Text) <> '') then
          QRMapaVenda.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me1CodVendedor.Text) +  ')')
        else
          QRMapaVenda.SetVariable('VENDEDOR', '1=1');

        if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text) = '' then
          QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text));
        if Trim(FNotaSaidaParam.FmTecnico2.MeVendedor.Text) = '' then
          QRMapaVenda.SetVariable('TECNICO', Null)
        else
          QRMapaVenda.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico2.MeVendedor.Text));
        if Trim(FNotaSaidaParam.Me1Produto.Text) = '' then
          QRMapaVenda.SetVariable('COD_PRODUTO', '1 = 1')
        else
          QRMapaVenda.SetVariable('COD_PRODUTO', 'Tb_Nota_item.Cod_Produto in (' + Trim(FNotaSaidaParam.Me1Produto.Text)+')');
        if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text) = '' then
          QRMapaVenda.SetVariable('FORNECEDOR', Null)
        else
          QRMapaVenda.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.Me1Marca.Text) = '' then
          QRMapaVenda.SetVariable('COD_MARCA', Null)
        else
          QRMapaVenda.SetVariable('COD_MARCA', Trim(FNotaSaidaParam.Me1Marca.Text));
        if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text) = '' then
          QRMapaVenda.SetVariable('COD_CADASTRO', Null)
        else
          QRMapaVenda.SetVariable('COD_CADASTRO', Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text) = '' then
          QRMapaVenda.SetVariable('COD_CULTURA', Null)
        else
          QRMapaVenda.SetVariable('COD_CULTURA', Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
        if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text) = '' then
          QRMapaVenda.SetVariable('ESTADO', Null)
        else
          QRMapaVenda.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));

        if Trim(FNotaSaidaParam.ME2Classe.Text) = '' then
          QRMapaVenda.SetVariable('CLASSE', Null)
        else
          QRMapaVenda.SetVariable('CLASSE', FNotaSaidaParam.ME2Classe.Text);

        if (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '0') then
          QRMapaVenda.SetVariable('SUBCLASSE', Null)
        else
          QRMapaVenda.SetVariable('SUBCLASSE', FNotaSaidaParam.ME2Subclasse.Text);
        if FNotaSaidaParam.Cb1Frete.Checked then
          QRMapaVenda.SetVariable('MOSTRA_FRETE', 'S')
        else
          QRMapaVenda.SetVariable('MOSTRA_FRETE', 'N');
        if Trim(FNotaSaidaParam.ME1Operacao.Text) <> '' then
         begin
          QRMapaVenda.SetVariable('OPERACAO', Null);
          QRMapaVenda.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Operacao.Text))+')');
         end
        else
         begin
          QRMapaVenda.SetVariable('OPERACAO', 'V');
          QRMapaVenda.SetVariable('COD_OPERACAO', '1=1');
         end;
        if Trim(FNotaSaidaParam.Me1CFOP.Text) <> '' then
          QRMapaVenda.SetVariable('COD_CFOP', 'TB_NOTA_ITEM.COD_CFOP IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Cfop.Text))+')')
        else
          QRMapaVenda.SetVariable('COD_CFOP', '1=1');

        case FNotaSaidaParam.RgProducao.ItemIndex of
          0: QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO', 'PROPRIA');
          1: QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO', 'TERCEIROS');
          2: QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO', Null);
        end;
        case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
          0: QRMapaVenda.SetVariable('TIPO_PAGTO', '1');
          1: QRMapaVenda.SetVariable('TIPO_PAGTO', '2');
          2: QRMapaVenda.SetVariable('TIPO_PAGTO', '3');
          3: QRMapaVenda.SetVariable('TIPO_PAGTO', '4');
          4: QRMapaVenda.SetVariable('TIPO_PAGTO', '5');
          5: QRMapaVenda.SetVariable('TIPO_PAGTO', '6');
          6: QRMapaVenda.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)');//débito e crédito
          7: QRMapaVenda.SetVariable('TIPO_PAGTO', '7'); // CONV.
          8: QRMapaVenda.SetVariable('TIPO_PAGTO', Null);
        end;
        case FNotaSaidaParam.CB2TipoProduto.ItemIndex of
          0:  QRMapaVenda.SetVariable('TIPO_PRODUTO', NULL);
          1:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'AGRICOLA');
          2:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'AGUA');
          3:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'COM. ARROZ');
          4:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'COMERCIAL');
          5:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'CONSUMO');
          6:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'IMOBILIZADO');
          7:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'INDUSTRIAL');
          8:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'INSUMOS');
          9:  QRMapaVenda.SetVariable('TIPO_PRODUTO', 'PATRIMONIO');
          10: QRMapaVenda.SetVariable('TIPO_PRODUTO', 'SERVIÇO');
          11: QRMapaVenda.SetVariable('TIPO_PRODUTO', 'VEICULO');
          12: QRMapaVenda.SetVariable('TIPO_PRODUTO', 'PEÇA');


        end;
        if Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text) = '' then
          QRMapaVenda.SetVariable('DEPARTAMENTO', Null)
        else
          QRMapaVenda.SetVariable('DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text));
        if Trim(FNotaSaidaParam.FmCidade2.MeCidade.Text) = '' then
          QRMapaVenda.SetVariable('CIDADE', Null)
        else
          QRMapaVenda.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade2.EdCidade.Text));
        if Trim(FNotaSaidaParam.Me1Serie.Text) = '' then
          QRMapaVenda.SetVariable('COD_SERIE', '1=1')
        else
          QRMapaVenda.SetVariable('COD_SERIE', 'TB_NOTA_CAB.COD_SERIE IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.Me1Serie.Text))+')');
        if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 then   //Paula Sr solicitou quebra por cliente - Vitor / Jr - 15/03/2021
          QRMapaVenda.SetVariable('TIPO_QUEBRA', 'F')
        else
        if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 1 then
          QRMapaVenda.SetVariable('TIPO_QUEBRA', 'V')
        else
          QRMapaVenda.SetVariable('TIPO_QUEBRA', NULL);
        if FNotaSaidaParam.RGTipo.ItemIndex = 2 then
          QRMapaVenda.SetVariable(':TIPO', 'FATURAMENTODIARIO')
        else
          QRMapaVenda.SetVariable(':TIPO', 'DIARIO');
        if (trim(FNotaSaidaParam.FmNota1.MeNota.Text) = '') then
          QRMapaVenda.SetVariable('COD_NOTA_CAB',NULL)
        else
          QRMapaVenda.SetVariable('COD_NOTA_CAB',trim(FNotaSaidaParam.FmNota1.MeNota.Text));

         if Trim(FNotaSaidaParam.ME1Regiao.Text) = '' then
          QRMapaVenda.SetVariable('COD_REGIAO', '1 = 1')
        else
          QRMapaVenda.SetVariable('COD_REGIAO', 'Tb_Cadastro.Cod_Regiao in (' + Trim(FNotaSaidaParam.ME1Regiao.Text)+')');

        QRMapaVenda.SQL[QRMapaVenda.SQL.Count - 1] := ''; // elimina a última Linha da SQL
        if FNotaSaidaParam.RGTipo.ItemIndex = 2 then
          QRMapaVenda.Sql.Add(' ORDER BY EMISSAO')
        else
        begin
          Case FNotaSaidaParam.Cb1Ordem.ItemIndex of
            0 : QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + '),COD_PRODUTO');
            1 : QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + '),DESC_PRODUTO');
            2 : QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + '),NUM_FABRICANTE');
            3 : QRMapaVenda.Sql.Add(' ORDER BY TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + ')');
            4 : QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,SQT_QUANTIDADE DESC');//TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + '),NUM_FABRICANTE');
          End;
        end;
        QRMapaVenda.Open;

        if FRNota_MapaVenda = nil then
           FRNota_MapaVenda := TFRNota_MapaVenda.Create(Application);
        if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 then
           FRNota_MapaVenda.QRLabel3.Caption := 'Filial:'
        else if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 1 then
           FRNota_MapaVenda.QRLabel3.Caption := 'Vendedor: ' + FNotaSaidaParam.Me1CodVendedor.Text
        else
           FRNota_MapaVenda.QRLabel3.Caption := 'Cliente:' ;
        FRNota_MapaVenda.QRLTitulo.Caption := 'Mapa de Vendas de ' + FNotaSaidaParam.ME1DataI.Text + ' até ' + FNotaSaidaParam.ME1DataF.Text;

        if Trim(FNotaSaidaParam.Me1CodVendedor.Text) <> '' then
          FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.Me1CodVendedor.Text + ' '
        else
          FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: Todos  ';
       { if Trim(FNotaSaidaParam.FmVendedor2.EdVendedor.Text) <> '' then
          FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.FmVendedor2.EdVendedor.Text + ' '
        else
          FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: Todos  '; }
        FRNota_MapaVenda.QRLFornecedor.Caption := 'Fornecedor: ' + FNotaSaidaParam.FmFornecedor2.EdCadastro.Text + ' Cliente:' + FNotaSaidaParam.FmCadastro2.MeCadastro.Text + ' - ' + FNotaSaidaParam.FmCadastro2.EdCadastro.Text;


        if Trim(FNotaSaidaParam.ME1Operacao.Text) <> '' then
           FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Operacao: ' + FNotaSaidaParam.ME1Operacao.Text
        else
           FRNota_MapaVenda.QRLVendedor_Oper.Caption := FRNota_MapaVenda.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';
        FRNota_MapaVenda.QRLDepartamento.Caption := 'Departamento :' + FNotaSaidaParam.FmDepartamento1.EdDepartamento.Text;

        if not FNotaSaidaParam.CBCusto2.Checked then
         begin
           FRNota_MapaVenda.QRLCusto.Font.Color := ClWindow;
           FRNota_MapaVenda.QRDBTCusto.Font.Color := ClWindow;
           FRNota_MapaVenda.QRExprCusto.Font.Color := ClWindow;
           FRNota_MapaVenda.QRLLucro.Font.Color := ClWindow;
           FRNota_MapaVenda.QRExprLucro.Font.Color := ClWindow;
           FRNota_MapaVenda.QRExprSumLucro.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVenda.QRLCusto.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRDBTCusto.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRExprCusto.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRLLucro.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRExprLucro.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRExprSumLucro.Font.Color := ClWindowText;
         end;
        if not FNotaSaidaParam.CBTotal2.Checked then
         begin
           FRNota_MapaVenda.QRLTotal.Font.Color := ClWindow;
           FRNota_MapaVenda.QRDBTTotal.Font.Color := ClWindow;
           FRNota_MapaVenda.QRExprTotal.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVenda.QRLTotal.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRDBTTotal.Font.Color := ClWindowText;
           FRNota_MapaVenda.QRExprTotal.Font.Color := ClWindowText;
         end;
        if not FNotaSaidaParam.CB1Peso.Checked then  // Solicitado por Odirlei - Ceramica Alvares para exibir a quantidade de peso vendida - 28/04/2021 - Alex
        begin
           FRNota_MapaVenda.QRLPesoLiquido.Font.Color := clWindow;
           FRNota_MapaVenda.QRDBTPeso.Font.Color := clWindow;
           FRNota_MapaVenda.QRExprPesoLiquido.Font.Color := clWindow;
        end
        else
        begin
           FRNota_MapaVenda.QRLPesoLiquido.Font.Color := clWindowText;
           FRNota_MapaVenda.QRDBTPeso.Font.Color := clWindowText;
           FRNota_MapaVenda.QRExprPesoLiquido.Font.Color := clWindowText;
        end;
        with FRNota_MapaVenda do
        begin
          if FNotaSaidaParam.RG2CodProduto.ItemIndex = 0 then
          begin
            QRDBTCodProduto.DataField := 'COD_PRODUTO';
            QRDBTCodProduto.Width := 51;
          end
          else
          begin
            QRDBTCodProduto.DataField := 'NUM_FABRICANTE';
            QRDBTCodProduto.Width := 100;
          end;
          wInt := QRDBTCodProduto.Left + QRDBTCodProduto.Width + 3; //8
          wInt2 := QRDBTProduto.Left - wInt;
          QRDBTProduto.Left := wInt;
          QRDBTProduto.Width := QRDBTProduto.Width - wInt2;
          QRDBTCodProduto.Enabled := True;
        end;
        if DMParamSistema.CodEmpresa = 'DINGLIS' then
        begin
          FRNota_MapaVenda.QRDBLote.Enabled := True;
          FRNota_MapaVenda.QRDBLote.Left := 361;
        end;
        FRNota_MapaVenda.QRDBTCodProduto.Enabled := not (FNotaSaidaParam.RGTipo.ItemIndex = 2);

        FRNota_MapaVenda :=
          TFRNota_MapaVenda(BibVenda.PersonalizaMapaVenda(DMParamSistema.QParamSistemaCOD_EMPRESA.Value,
            FRNota_MapaVenda));

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_MapaVenda.QRPrimario.Preview
        else
          FRNota_MapaVenda.QRPrimario.Print;
        QRMapaVenda.Close;
      end
      else // ************** Resumido ******************
      begin
        QRMapaVendaRes.Close;
        if (Trim(FNotaSaidaParam.ME1DataI.Text) <> '') and (Trim(FNotaSaidaParam.ME1DataF.Text) <> '') then
        begin
          QRMapaVendaRes.SetVariable('DATA_I', FNotaSaidaParam.ME1DataI.Text);
          QRMapaVendaRes.SetVariable('DATA_F', FNotaSaidaParam.ME1DataF.Text + ' 23:59:59');
        end
        else
          raise Exception.Create('É necessário informar a data Inicial e Final');
        if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text) = '' then
          QRMapaVendaRes.SetVariable('FILIAL', Null)
        else
          QRMapaVendaRes.SetVariable('FILIAL', FNotaSaidaParam.FmFilial2.MeFilial.Text);

        if Trim(FNotaSaidaParam.Me1CodVendedor.Text) <> '' then
          QRMapaVendaRes.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me1CodVendedor.Text) +  ')')
        else
          QRMapaVendaRes.SetVariable('VENDEDOR', '1=1');

        if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text) = '' then
          QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO', FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text);
        if Trim(FNotaSaidaParam.FmTecnico2.MeVendedor.Text) = '' then
          QRMapaVendaRes.SetVariable('TECNICO', Null)
        else
          QRMapaVendaRes.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico2.MeVendedor.Text));  
        if Trim(FNotaSaidaParam.Me1Produto.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_PRODUTO', '1 = 1')
        else
          QRMapaVendaRes.SetVariable('COD_PRODUTO', 'Tb_Nota_item.Cod_Produto in (' + Trim(FNotaSaidaParam.Me1Produto.Text)+')');
        if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text) = '' then
          QRMapaVendaRes.SetVariable('FORNECEDOR', Null)
        else
          QRMapaVendaRes.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.Me1Marca.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_MARCA', Null)
        else
          QRMapaVendaRes.SetVariable('COD_MARCA', Trim(FNotaSaidaParam.Me1Marca.Text));
        if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_CADASTRO', Null)
        else
          QRMapaVendaRes.SetVariable('COD_CADASTRO', Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_CULTURA', Null)
        else
          QRMapaVendaRes.SetVariable('COD_CULTURA', Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
        if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text) = '' then
          QRMapaVendaRes.SetVariable('ESTADO', Null)
        else
          QRMapaVendaRes.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
        if Trim(FNotaSaidaParam.ME2Classe.Text) = '' then
          QRMapaVendaRes.SetVariable('CLASSE', Null)
        else
          QRMapaVendaRes.SetVariable('CLASSE', FNotaSaidaParam.ME2Classe.Text);

        if (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '0') then
          QRMapaVendaRes.SetVariable('SUBCLASSE', Null)
        else
          QRMapaVendaRes.SetVariable('SUBCLASSE', FNotaSaidaParam.ME2Subclasse.Text);
        if FNotaSaidaParam.Cb1Frete.Checked then
          QRMapaVendaRes.SetVariable('MOSTRA_FRETE', 'S')
        else
          QRMapaVendaRes.SetVariable('MOSTRA_FRETE', 'N');

        if Trim(FNotaSaidaParam.Me1Operacao.Text) <> '' then
        begin
          QRMapaVendaRes.SetVariable('OPERACAO', Null);
          QRMapaVendaRes.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Operacao.Text))+')');
        end
        else
        begin
          QRMapaVendaRes.SetVariable('OPERACAO', 'V');
          QRMapaVendaRes.SetVariable('COD_OPERACAO', '1=1');
        end;
        if Trim(FNotaSaidaParam.Me1CFOP.Text) <> '' then
          QRMapaVendaRes.SetVariable('COD_CFOP', 'TB_NOTA_ITEM.COD_CFOP IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Cfop.Text))+')')
        else
          QRMapaVendaRes.SetVariable('COD_CFOP', '1=1');
        case FNotaSaidaParam.RgProducao.ItemIndex of
          0: QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO', 'PROPRIA');
          1: QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO', 'TERCEIROS');
          2: QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO', Null);
        end;
        case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
          0: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '1');
          1: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '2');
          2: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '3');
          3: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '4');
          4: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '5');
          5: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '6');
          6: QRMapaVendaRes.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)');//débito e crédito
          7: QRMapaVendaRes.SetVariable('TIPO_PAGTO', '7'); // CONV.
          8: QRMapaVendaRes.SetVariable('TIPO_PAGTO', Null);
        end;
        case FNotaSaidaParam.CB2TipoProduto.ItemIndex of
          0:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', NULL);
          1:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'AGRICOLA');
          2:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'AGUA');
          3:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'COM. ARROZ');
          4:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'COMERCIAL');
          5:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'CONSUMO');
          6:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'IMOBILIZADO');
          7:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'INDUSTRIAL');
          8:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'INSUMOS');
          9:  QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'PATRIMONIO');
          10: QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'SERVIÇO');
          11: QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'VEICULO');
          12: QRMapaVendaRes.SetVariable('TIPO_PRODUTO', 'PEÇA');
        end;
        if Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text) = '' then
          QRMapaVendaRes.SetVariable('DEPARTAMENTO', Null)
        else
          QRMapaVendaRes.SetVariable('DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text));
        if Trim(FNotaSaidaParam.Me1Serie.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_SERIE', '1=1')
        else
          QRMapaVendaRes.SetVariable('COD_SERIE', 'TB_NOTA_CAB.COD_SERIE IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.Me1Serie.Text))+')');
        if (trim(FNotaSaidaParam.FmNota1.MeNota.Text) = '') then
          QRMapaVendaRes.SetVariable('COD_NOTA_CAB',NULL)
        else
          QRMapaVendaRes.SetVariable('COD_NOTA_CAB',trim(FNotaSaidaParam.FmNota1.MeNota.Text));
        if Trim(FNotaSaidaParam.FmCidade2.MeCidade.Text) = '' then

        if Trim(FNotaSaidaParam.ME1Regiao.Text) = '' then
          QRMapaVendaRes.SetVariable('COD_REGIAO', '1 = 1')
        else
          QRMapaVendaRes.SetVariable('COD_REGIAO', 'Tb_Cadastro.Cod_Regiao in (' + Trim(FNotaSaidaParam.ME1Regiao.Text)+')');

        if Trim(FNotaSaidaParam.FmCidade2.MeCidade.Text) = '' then
          QRMapaVendaRes.SetVariable('CIDADE', Null)
        else
          QRMapaVendaRes.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade2.EdCidade.Text));
        if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 then
          QRMapaVendaRes.SetVariable('TIPO_QUEBRA', 'F')
        else
        if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 1 then
          QRMapaVendaRes.SetVariable('TIPO_QUEBRA', 'V')
        else
          QRMapaVendaRes.SetVariable('TIPO_QUEBRA', NULL);
        QRMapaVendaRes.SQL[QRMapaVendaRes.SQL.Count - 1] := ''; // elimina a última Linha da SQL
        Case FNotaSaidaParam.Cb1Ordem.ItemIndex of
          0 : QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,COD_PRODUTO');
          1 : QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,DESC_PRODUTO');
          2 : QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,NUM_FABRICANTE');
          3 : QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL, TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + ')');
          4 : QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,SQT_QUANTIDADE DESC');//TO_CHAR(DT_EMISSAO,' + Chr(39) + 'DD/MM' + Chr(39) + '),NUM_FABRICANTE');
        End;

        QRMapaVendaRes.Open;
        if (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
        begin
          if FRNota_MapaVendaRes40Colunas = nil then
            FRNota_MapaVendaRes40Colunas := TFRNota_MapaVendaRes40Colunas.Create(Application);
          FRNota_MapaVendaRes40Colunas.QRPrimario.Height := FRNota_MapaVendaRes40Colunas.QRPrimario.Height + QRMapaVendaRes.RecordCount * 30;
          FRNota_MapaVendaRes40Colunas.QRLTitulo.Caption := 'Vendas ' + FNotaSaidaParam.ME1DataI.Text + ' ATÉ ' + FNotaSaidaParam.ME1DataF.Text;
          if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
            FRNota_MapaVendaRes40Colunas.QRPrimario.Preview
          else
            FRNota_MapaVendaRes40Colunas.QRPrimario.Print;
        end
        else
        begin
          if FRNota_MapaVendaRes = nil then
             FRNota_MapaVendaRes := TFRNota_MapaVendaRes.Create(Application);
          if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 then
             FRNota_MapaVendaRes.QRLabel3.Caption := 'Filial:'
          else if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 1 then
             FRNota_MapaVendaRes.QRLabel3.Caption := 'Vendedor:' + FNotaSaidaParam.Me1CodVendedor.Text
          else
             FRNota_MapaVendaRes.QRLabel3.Caption := 'Cadastro:';
          FRNota_MapaVendaRes.QRLTitulo.Caption := 'Mapa de Vendas de ' + FNotaSaidaParam.ME1DataI.Text + ' até ' + FNotaSaidaParam.ME1DataF.Text;
          //FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.FmVendedor2.EdVendedor.Text + ' ';
          FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.Me1CodVendedor.Text + ' '; // Agroferragens precisa do vendedor no relatório. Junior 05/09/2019.
          FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes.QRLVendedor_Oper.Caption + ' Operacao: ' + FNotaSaidaParam.ME1Operacao.Text + ' ';
          FRNota_MapaVendaRes.QRLFornecedor.Caption := 'Fornecedor: ' + FNotaSaidaParam.FmFornecedor2.EdCadastro.Text + ' Cliente:' + FNotaSaidaParam.FmCadastro2.MeCadastro.Text + ' - '
            + FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
          FRNota_MapaVendaRes.QRLDepartamento.Caption := 'Departamento :' + FNotaSaidaParam.FmDepartamento1.EdDepartamento.Text;
          if not FNotaSaidaParam.CBCusto2.Checked then
           begin
             FRNota_MapaVendaRes.QRLCusto.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRDBTCusto.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExprCusto.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRLLucro.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExprLucro.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExprSumLucro.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExpr3.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExpr4.Font.Color := ClWindow;
           end
          Else
           begin
             FRNota_MapaVendaRes.QRLCusto.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRDBTCusto.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExprCusto.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRLLucro.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExprLucro.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExprSumLucro.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExpr3.Font.Color := clWindowText;
             FRNota_MapaVendaRes.QRExpr4.Font.Color := clWindowText;
           end;
          if not FNotaSaidaParam.CBTotal2.Checked then
           begin
             FRNota_MapaVendaRes.QRLTotal.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRDBTTotal.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExprTotal.Font.Color := ClWindow;
             FRNota_MapaVendaRes.QRExpr2.Font.Color := clWindow;
           end
          Else
           begin
             FRNota_MapaVendaRes.QRLTotal.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRDBTTotal.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExprTotal.Font.Color := ClWindowText;
             FRNota_MapaVendaRes.QRExpr2.Font.Color := clWindowText;
           end;
          with FRNota_MapaVendaRes do
          begin
            if FNotaSaidaParam.RG2CodProduto.ItemIndex = 0 then
            begin
              QRDBTCodProduto.DataField := 'COD_PRODUTO';
              QRDBTCodProduto.Width := 51;
            end
            else
            begin
              QRDBTCodProduto.DataField := 'NUM_FABRICANTE';
              QRDBTCodProduto.Width := 100;
            end;
            wInt := QRDBTCodProduto.Left + QRDBTCodProduto.Width + 8;
            wInt2 := QRDBTDescProduto.Left - wInt;
            QRDBTDescProduto.Left := wInt;
            QRDBTDescProduto.Width := QRDBTDescProduto.Width - wInt2;
            QRDBTCodProduto.Enabled := True;
          end;
          FRNota_MapaVendaRes.QRDBTCodProduto.Enabled := true;
          if DMParamSistema.CodEmpresa = 'TOMATESMI' then
          begin
            FRNota_MapaVendaRes.QRDBNumCGC.Enabled := True;
//            FRNota_MapaVendaRes.QRDBNumCGC.Mask := '000.000.000-00;0';
          end;
          FRNota_MapaVendaRes:= TFRNota_MapaVendaRes( BibVenda.PersonalizaMapaVendaRes(
            DMParamSistema.QParamSistemaCOD_EMPRESA.Value, TForm(FRNota_MapaVendaRes)));

          if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
             FRNota_MapaVendaRes.QRPrimario.Preview
          else
             FRNota_MapaVendaRes.QRPrimario.Print;

          if ((DMParamSistema.CodEmpresa = 'DEION') and (DMUsuario.pTipoFuncionario = 'SUPERVISOR')) Then
            if messageDlg('Deseja gerar pedido de transferência?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              GerarPedido;

          QRMapaVendaRes.Close;
        end;
      end;
    end;
end;

procedure TFNotaSaidaCad.VendedoreCondPgto1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text), 'VENDA');
      QRVendedorPgto.Close;
      QRVendedorPgto.SetVariable('DATA_I', FNotaSaidaParam.ME2DataI.Text);
      QRVendedorPgto.SetVariable('DATA_F', FNotaSaidaParam.ME2DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text) = '' then
        QRVendedorPgto.SetVariable('FILIAL', Null)
      else
        QRVendedorPgto.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmVendedor3.MeVendedor.Text) = '' then
        QRVendedorPgto.SetVariable('VENDEDOR', Null)
      else
        QRVendedorPgto.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor3.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto3.MeVendedor.Text) = '' then
        QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto3.MeVendedor.Text));
      QRVendedorPgto.Open;
      if FRNota_VendedorPgto = nil then
        FRNota_VendedorPgto := TFRNota_VendedorPgto.Create(Application);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_VendedorPgto.QRPrimario.Preview
      else
        FRNota_VendedorPgto.QRPrimario.Print;
      QRVendedorPgto.Close;
    end;
end;

procedure TFNotaSaidaCad.MovMercadoria1Click(Sender: TObject);
var
  wstrS: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[3].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text), 'VENDA');
      QRMovMercadoria.Close;
      QrMovMercadoria_CR.Close;
      QRMovMercadoria.SetVariable('DATA_I', FNotaSaidaParam.ME3DataI.Text);
      QRMovMercadoria.SetVariable('DATA_F', FNotaSaidaParam.ME3DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) = '' then
        QRMovMercadoria.SetVariable('FILIAL', Null)
      else
        QRMovMercadoria.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text) = '' then
        QRMovMercadoria.SetVariable('CADASTRO', Null)
      else
        QRMovMercadoria.SetVariable('CADASTRO', Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text));

      if Trim(FNotaSaidaParam.FmCidade4.MeCidade.Text) = '' then
        QRMovMercadoria.SetVariable('CIDADE', Null)
      else
        QRMovMercadoria.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade4.MeCidade.Text));

      if Trim(FNotaSaidaParam.Me3Armazem.Text) = '' then
        QRMovMercadoria.SetVariable('COD_ARMAZEM_ALFANDEGADO', Null)
      else
        QRMovMercadoria.SetVariable('COD_ARMAZEM_ALFANDEGADO', Trim(FNotaSaidaParam.Me3Armazem.Text));

      if Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text) = '' then
        QRMovMercadoria.SetVariable('OPERACAO', Null)
      else
        QRMovMercadoria.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text));
      if Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text) = '' then
        QRMovMercadoria.SetVariable('COD_PRODUTO', Null)
      else
        QRMovMercadoria.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) = '' then
        QRMovMercadoria.SetVariable('FORNECEDOR', Null)
      else
        QRMovMercadoria.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) = '' then
        QRMovMercadoria.SetVariable('VENDEDOR', Null)
      else
        QRMovMercadoria.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text) = '' then
        QRMovMercadoria.SetVariable('DEPARTAMENTO', Null)
      else
        QRMovMercadoria.SetVariable('DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text));
      if Trim(FNotaSaidaParam.ME3Serie.Text) = '' then
        QRMovMercadoria.SetVariable('SERIE', Null)
      else
        QRMovMercadoria.SetVariable('SERIE', Trim(FNotaSaidaParam.ME3Serie.Text));
      if Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text) = '' then
        QRMovMercadoria.SetVariable('CULTURA', Null)
      else
        QRMovMercadoria.SetVariable('CULTURA', Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text));
      if Trim(FNotaSaidaParam.Me3Lote.Text) = '' then
        QRMovMercadoria.SetVariable('COD_LOTE_TIPO', Null)
      else
        QRMovMercadoria.SetVariable('COD_LOTE_TIPO', Trim(FNotaSaidaParam.Me3Lote.Text));
      if Trim(FNotaSaidaParam.Me3Classe.Text) = '' then
        QRMovMercadoria.SetVariable('COD_CLASSE', Null)
      else
        QRMovMercadoria.SetVariable('COD_CLASSE', FNotaSaidaParam.Me3Classe.Text);

       if Trim(FNotaSaidaParam.ME3Marca.Text) = '' then
        QRMovMercadoria.SetVariable('COD_MARCA', Null)
      else
        QRMovMercadoria.SetVariable('COD_MARCA', FNotaSaidaParam.ME3Marca.Text);

      if (Trim(FNotaSaidaParam.Me3SubClasse.Text) = '') or
        (Trim(FNotaSaidaParam.Me3SubClasse.Text) = '0') then
        QRMovMercadoria.SetVariable('COD_SUBCLASSE', Null)
      else
        QRMovMercadoria.SetVariable('COD_SUBCLASSE', FNotaSaidaParam.Me3SubClasse.Text);
      if Trim(FNotaSaidaParam.ME3CadastroParceiro.Text) = '' then
        QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO', '1 = 1')
      else if Trim(FNotaSaidaParam.ME3CadastroParceiro.Text) = '0' then
        QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO', ' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO is null')
      else
        QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO', ' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = ' + FNotaSaidaParam.ME3CadastroParceiro.Text);
      if Trim(FNotaSaidaParam.Me3CFOP.Text) <> '' then
        QRMovMercadoria.SetVariable('COD_CFOP', 'TB_NOTA_ITEM.COD_CFOP IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME3Cfop.Text))+')')
      else
        QRMovMercadoria.SetVariable('COD_CFOP', '1=1');

      if Trim(FNotaSaidaParam.MePedido3.Text) = '' then
        QRMovMercadoria.SetVariable('NUM_PEDIDO', Null)
      else
        QRMovMercadoria.SetVariable('NUM_PEDIDO', FNotaSaidaParam.MePedido3.Text);

      case FNotaSaidaParam.Rg3TipoNota.ItemIndex of
        0: QRMovMercadoria.SetVariable('ENTRADA_SAIDA', 'E');
        1: QRMovMercadoria.SetVariable('ENTRADA_SAIDA', 'S');
        2: QRMovMercadoria.SetVariable('ENTRADA_SAIDA', Null);
      end;
      case FNotaSaidaParam.RG3CondicaoPagto.ItemIndex of
        0: QRMovMercadoria.SetVariable('CONDICAO_PAGTO', '1');
        1: QRMovMercadoria.SetVariable('CONDICAO_PAGTO', '2');
        2: QRMovMercadoria.SetVariable('CONDICAO_PAGTO', '3');
        3: QRMovMercadoria.SetVariable('CONDICAO_PAGTO', Null);
      end;
      case FNotaSaidaParam.Rg3TipoPessoa.ItemIndex of
        0: QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA', 'F');
        1: QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA', 'J');
        2: QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA', Null);
      end; // Case
      QRMovMercadoria.SQL[QRMovMercadoria.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FNotaSaidaParam.Rg3Ordem.ItemIndex of
        0: QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME, Tb_cadastro.COD_CADASTRO, Tb_nota_cab.NUM_NOTA');
        1: QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME, Tb_cadastro.COD_CADASTRO, Tb_nota_cab.DT_EMISSAO');
      end;
      QRMovMercadoria.Open;
      QrMovMercadoria_CR.Open;
      if FRNota_MovMercadoria = Nil then
         FRNota_MovMercadoria := TFRNota_MovMercadoria.Create(Application);
      wstrS := '';
      if (Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) <> '') then
        wstrS := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) + ' ' + Trim(FNotaSaidaParam.FmFilial4.EdFilial.Text)
      else
        wstrS := 'Filial: Todas';
      wstrS := wstrS + ' De ' + FNotaSaidaParam.ME3DataI.Text + ' Até ' + FNotaSaidaParam.ME3DataF.Text;
      FRNota_MovMercadoria.QRLPeriodo.Caption := wstrS;
      wstrS := '';
      if (Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) <> '') then
        wstrS := 'Fornecedor: ' + Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) + ' ' + Trim(FNotaSaidaParam.FmFornecedor4.EdCadastro.Text)
      else
        wstrS := 'Fornecedor: Todos';
      if (Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) <> '') then
        wstrS := wstrS + ' - Repr.Comercial: ' + Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmVendedor4.EdVendedor.Text)
      else
        wstrS := wstrS + 'Repr.Comercial: Todos';
      FRNota_MovMercadoria.QrlFornecedor.Caption := wstrS;
      FRNota_MovMercadoria.QRLDepartamento.Caption := 'Departamento:' + FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text + ' ' + FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text;
      FRNota_MovMercadoria.QRLSerie.Caption := 'Serie:' + FNotaSaidaParam.ME3Serie.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_MovMercadoria.QRPrimario.Preview
      else
        FRNota_MovMercadoria.QRPrimario.Print;
      QRMovMercadoria.Close;
      QrMovMercadoria_CR.Close;
    end;
    
end;

procedure TFNotaSaidaCad.ClientessemCompras1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[4].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text), 'VENDA');
      QRClienteSemCompra.Close;
      QRClienteSemCompra.SetVariable('DATA_I', Date - StrToFloat(FNotaSaidaParam.ME4Dias.Text));
      QRClienteSemCompra.SetVariable('DATA_F', StrToDateTime(FormatDateTime('dd/mm/yyyy', Date)  + ' 23:59:59'));
      if Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text) = '' then
        QRClienteSemCompra.SetVariable('FILIAL', Null)
      else
        QRClienteSemCompra.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor5.MeVendedor.Text) = '' then
        QRClienteSemCompra.SetVariable('COD_VENDEDOR', Null)
      else
        QRClienteSemCompra.SetVariable('COD_VENDEDOR', Trim(FNotaSaidaParam.FmVendedor5.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmTipoCadastro5.MeTipoCadastro.Text) = '' then
        QRClienteSemCompra.SetVariable('TIPO_CADASTRO', Null)
      else
        QRClienteSemCompra.SetVariable('TIPO_CADASTRO', Trim(FNotaSaidaParam.FmTipoCadastro5.MeTipoCadastro.Text));
      if Trim(FNotaSaidaParam.FmClassificacao5.MeClassificacao.Text) = '' then
        QRClienteSemCompra.SetVariable('CLASS_CADASTRO', Null)
      else
        QRClienteSemCompra.SetVariable('CLASS_CADASTRO', Trim(FNotaSaidaParam.FmClassificacao5.MeClassificacao.Text));
      if Trim(FNotaSaidaParam.FmClasse5.MeClasse.Text) = '' then
        QRClienteSemCompra.SetVariable('COD_CLASSE', Null)
      else
        QRClienteSemCompra.SetVariable('COD_CLASSE', Trim(FNotaSaidaParam.FmClasse5.MeClasse.Text));
      if Trim(FNotaSaidaParam.FmCidade5.MeCidade.Text) = '' then
        QRClienteSemCompra.SetVariable('CIDADE', Null)
      else
        QRClienteSemCompra.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade5.MeCidade.Text));
      if Trim(FNotaSaidaParam.FmEstado5.MeEstado.Text) = '' then
        QRClienteSemCompra.SetVariable('COD_ESTADO', Null)
      else
        QRClienteSemCompra.SetVariable('COD_ESTADO', Trim(FNotaSaidaParam.FmEstado5.MeEstado.Text));
      if Trim(FNotaSaidaParam.FmSupervisor5.MeVendedor.Text) = '' then
        QRClienteSemCompra.SetVariable('SUPERVISOR', Null)
      else
        QRClienteSemCompra.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor5.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmProduto5.MeProduto.Text) = '' then
        QRClienteSemCompra.SetVariable('COD_PRODUTO', Null)
      else
        QRClienteSemCompra.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto5.MeProduto.Text));
      if Trim(FNotaSaidaParam.Me4Bairro.Text) = '' then
        QRClienteSemCompra.SetVariable('BAIRRO', Null)
      else
        QRClienteSemCompra.SetVariable('BAIRRO', Trim(FNotaSaidaParam.Me4Bairro.Text));

      //    QRClienteSemCompra.Close;

        {  case(FNotaSaidaParam.RG4Cadastro.ItemIndex) of
            0:
            wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
                   '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
                   '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade '                              +
                   'FROM'                                                                             +
                   '  TB_CADASTRO '                                                                   +
                   ' WHERE '                                                                          +
                   ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
                   ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
                   ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
                   ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
                   ' AND cod_cadastro NOT in'                                                         +
                   ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
                   ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_VENDEDOR'                                 +
                   ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
                   ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
                   ' TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR AND'                         +
                   ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
                   ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
                   ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
                   ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F  AND (:SUPERVISOR IS NULL OR'         +
                   ' TB_VENDEDOR.COD_SUPERVISOR = :SUPERVISOR)'                                       +
                   ' AND (TB_CADASTRO.DT_CANCELAMENTO IS NULL) AND (TB_CADASTRO.COD_MOTIVO IS NULL))';

            1:
            wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
                   '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
                   '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade  '                             +
                   'FROM'                                                                             +
                   '  TB_CADASTRO '                                                                   +
                   ' WHERE '                                                                          +
                   ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
                   ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
                   ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
                   ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
                   ' AND cod_cadastro NOT in'                                                         +
                   ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
                   ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_VENDEDOR'                                 +
                   ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
                   ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
                   ' TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR AND'                         +
                   ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
                   ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
                   ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
                   ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F '                                     +
                   ' AND (:SUPERVISOR IS NULL OR TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR )'           +
                   ' AND NOT(TB_CADASTRO.DT_CANCELAMENTO IS NULL) OR NOT(TB_CADASTRO.COD_MOTIVO IS NULL))';

            2:
            wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
                   '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
                   '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade '                              +
                   'FROM'                                                                             +
                   '  TB_CADASTRO '                                                                   +
                   ' WHERE '                                                                          +
                   ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
                   ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
                   ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
                   ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
                   ' AND cod_cadastro NOT in'                                                         +
                   ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
                   ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO,TB_VENDEDOR'                                 +
                   ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
                   ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
                   ' TB_NOTA_CAB.COD_VENDEDOR = TB_VENDEDOR.COD_VENDEDOR AND'                         +
                   ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
                   ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
                   ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
                   ' AND (:SUPERVISOR IS NULL OR TB_VENDEDOR.COD_SUPERVISOR =:SUPERVISOR )'           +
                   ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F )';
          end;
          QRClienteSemCompra.SQL.Clear;
          QRClienteSemCompra.SQL.Add(wSql);
          }
      QRClienteSemCompra.SQL[QRClienteSemCompra.SQL.COUNT - 1] := '';
      case (FNotaSaidaParam.RG4Cadastro.ItemIndex) of
        //--CLIENTES SEM COMPRA ATIVOS
        0: QRClienteSemCompra.SQL.add('AND ((TB_CADASTRO.DT_CANCELAMENTO IS NULL) AND (TB_CADASTRO.COD_MOTIVO IS NULL)) ');
        //--CLIENTES SEM COMPRA CANCELADOS
        1: QRClienteSemCompra.SQL.add('AND (NOT(TB_CADASTRO.DT_CANCELAMENTO IS NULL) OR NOT(TB_CADASTRO.COD_MOTIVO IS NULL)) ');
        //--TODOS CLIENTES SEM COMPRA
        //--CLIENTES SEM COMPRA ATIVOS
  //      2:QRClienteSemCompra.SQL.add(' ORDER BY DESC_CIDADE,NOME');
      end;
      if FRNota_ClienteSemCompra = nil then
        FRNota_ClienteSemCompra := TFRNota_ClienteSemCompra.Create(Application);
      FRNota_ClienteSemCompra.QRGroup1.Enabled := False;
      FRNota_ClienteSemCompra.QRBand5.Enabled := False;
      case (FNotaSaidaParam.Cb4Ordem.ItemIndex) of
        0:
          begin
            QRClienteSemCompra.SQL.add(' ORDER BY DESC_CIDADE,NOME');
            FRNota_ClienteSemCompra.QRGroup1.Enabled := True;
            FRNota_ClienteSemCompra.QRBand5.Enabled := True;
          end;
        1: QRClienteSemCompra.SQL.add(' ORDER BY COD_CADASTRO,NOME');
        2: QRClienteSemCompra.SQL.add(' ORDER BY NOME');
      end;
      QRClienteSemCompra.Open;

      FRNota_ClienteSemCompra.QRLTitulo.Caption := 'Clientes que não compra a ' + FNotaSaidaParam.ME4Dias.Text + ' dias ' + DateToStr(Date);
      FRNota_ClienteSemCompra.QRLVendedor.Caption := 'Representante Comercial: ' + FNotaSaidaParam.FmVendedor5.EdVendedor.Text + ' Classe: ' + FNotaSaidaParam.FmClasse5.EdClasse.Text;
      FRNota_ClienteSemCompra.QRLTipoCadastro.Caption := 'Tipo de Cadastro: ' + FNotaSaidaParam.FmTipoCadastro5.EdTipoCadastro.Text;
      FRNota_ClienteSemCompra.QRLSupervisor.Caption := 'Supervisor: ' + FNotaSaidaParam.FmSupervisor5.MeVendedor.Text;
      FRNota_ClienteSemCompra.QRLBairro.Caption := 'Bairro: ' + FNotaSaidaParam.Me4Bairro.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_ClienteSemCompra.QRPrimario.Preview
      else
        FRNota_ClienteSemCompra.QRPrimario.Print;
      QRClienteSemCompra.Close;
    end;
end;

procedure TFNotaSaidaCad.VendasporOperacao1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[5].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text), 'VENDA');
      QRVendaOperacao.Close;
      QRVendaOperacao.SetVariable('DATA_I', FNotaSaidaParam.ME5DataI.Text);
      QRVendaOperacao.SetVariable('DATA_F', FNotaSaidaParam.ME5DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text) = '' then
        QRVendaOperacao.SetVariable('FILIAL', Null)
      else
        QRVendaOperacao.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmVendedor6.MeVendedor.Text) = '' then
        QRVendaOperacao.SetVariable('VENDEDOR', Null)
      else
        QRVendaOperacao.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor6.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmVendedorPreposto6.MeVendedor.Text) = '' then
        QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto6.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmOperacao6.MeOperacao.Text) = '' then
        QRVendaOperacao.SetVariable('OPERACAO', Null)
      else
        QRVendaOperacao.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao6.MeOperacao.Text));
      if Trim(FNotaSaidaParam.Me5Classe.Text) = '' then
        QRVendaOperacao.SetVariable('COD_CLASSE', Null)
      else
        QRVendaOperacao.SetVariable('COD_CLASSE', FNotaSaidaParam.Me5Classe.Text);
      if (Trim(FNotaSaidaParam.Me5SubClasse.Text) = '') or (Trim(FNotaSaidaParam.Me5SubClasse.Text) = '0') then
        QRVendaOperacao.SetVariable('COD_SUBCLASSE', Null)
      else
        QRVendaOperacao.SetVariable('COD_SUBCLASSE', FNotaSaidaParam.Me5SubClasse.Text);
      if FRNota_Operacao = nil then
        FRNota_Operacao := TFRNota_Operacao.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
      begin
        FRNota_Operacao.QRGFilial.Enabled := False;
        FRNota_Operacao.QRGFilial.Expression := '';
        FRNota_Operacao.QRBRodTotalFilial.Enabled := False;
        // FRNota_Operacao.QRGCabVendedor.Enabled := False;
        // FRNota_Operacao.QRBRodTotalVendedor.Enabled := False;
        QRVendaOperacao.SQL[QRVendaOperacao.SQL.Count - 1] := ''; // elimina a última Linha da SQL
        // QRVendaOperacao.SQL.Add('ORDER BY Tb_OPERACAO.DESC_OPERACAO,Tb_operacao.COD_OPERACAO');
        QRVendaOperacao.SQL.Add('ORDER BY Tb_nota_cab.COD_VENDEDOR,Tb_operacao.COD_OPERACAO');
      end;
      QRVendaOperacao.Open;
      FRNota_Operacao.QRLTitulo.Caption := 'Vendas por Operacao de ' + FNotaSaidaParam.ME5DataI.Text + ' até ' + FNotaSaidaParam.ME5DataF.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_Operacao.QRPrimario.Preview
      else
        FRNota_Operacao.QRPrimario.Print;
      QRVendaOperacao.Close;
    end;
end;

procedure TFNotaSaidaCad.MovportipodeDocumento1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[6].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text), 'VENDA');
      QRTipoDocumento.Close;
      if (FNotaSaidaParam.ME6DataI.Text = '') or (FNotaSaidaParam.ME6DataF.Text = '') then
        raise Exception.Create('É necessário informar a data de Emissão.');
      QRTipoDocumento.SetVariable('DATA_I', FNotaSaidaParam.ME6DataI.Text);
      QRTipoDocumento.SetVariable('DATA_F', FNotaSaidaParam.ME6DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text) = '' then
        QRTipoDocumento.SetVariable('FILIAL', Null)
      else
        QRTipoDocumento.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmSerie7.MeSerie.Text) = '' then
        QRTipoDocumento.SetVariable('SERIE', Null)
      else
        QRTipoDocumento.SetVariable('SERIE', Trim(FNotaSaidaParam.FmSerie7.MeSerie.Text));
      QRTipoDocumento.Open;
      if FRNota_TipoDocumento = nil then
        FRNota_TipoDocumento := TFRNota_TipoDocumento.Create(Application);

      FRNota_TipoDocumento.QRLTitulo.Caption := 'Mov. de Produtos por tipo de Documento de ' + FNotaSaidaParam.ME6DataI.Text + ' até ' + FNotaSaidaParam.ME6DataF.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_TipoDocumento.QRPrimario.Preview
      else
        FRNota_TipoDocumento.QRPrimario.Print;
      QRTipoDocumento.Close;
    end;
end;

procedure TFNotaSaidaCad.VendasporClasse1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[7].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text), 'VENDA');
      QRVendaClasse.Close;
      if (FNotaSaidaParam.ME7DataI.Text = '') or (FNotaSaidaParam.ME7DataF.Text = '') then
        raise Exception.Create('É necessário informar a Data de Emissão');
      QRVendaClasse.SetVariable('DATA_I', FNotaSaidaParam.ME7DataI.Text);
      QRVendaClasse.SetVariable('DATA_F', FNotaSaidaParam.ME7DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text) = '' then
        QRVendaClasse.SetVariable('FILIAL', Null)
      else
        QRVendaClasse.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text));
//Classes e subclasses. Adicionado para listar mais de uma classe. Cod_suporte 6221 - Alex 12/04/2023.
      if Trim(FNotaSaidaParam.ME7Classe.Text) = '' then
        QRVendaClasse.SetVariable('CLASSE', Null)
      else
        QRVendaClasse.SetVariable('CLASSE', FNotaSaidaParam.ME7Classe.Text);
      if (Trim(FNotaSaidaParam.ME7SubClasse.Text) = '') or (Trim(FNotaSaidaParam.ME7SubClasse.Text) = '0') then
        QRVendaClasse.SetVariable('SUB_CLASSE', Null)
      else
        QRVendaClasse.SetVariable('SUB_CLASSE', FNotaSaidaParam.ME7SubClasse.Text);

      if Trim(FNotaSaidaParam.ME7Classefinal.text) = '' then
        QRVendaClasse.SetVariable('CLASSE_FINAL', null)
      else
        QRVendaClasse.SetVariable('CLASSE_FINAL', Trim(FNotaSaidaParam.ME7Classefinal.text));
      if (Trim(FNotaSaidaParam.ME7SubClasseFinal.Text) = '') or (Trim(FNotaSaidaParam.ME7SubClasseFinal.Text) = '0') then
        QRVendaClasse.SetVariable('SUB_CLASSE_FINAL', Null)
      else
        QRVendaClasse.SetVariable('SUB_CLASSE_FINAL', Trim(FNotaSaidaParam.ME7SubClasseFinal.Text));
//Fim das classes e subclasses

      if Trim(FNotaSaidaParam.FmCidade8.MeCidade.Text) = '' then
        QRVendaClasse.SetVariable('CIDADE', Null)
      else
        QRVendaClasse.SetVariable('CIDADE', FNotaSaidaParam.FmCidade8.MeCidade.Text);

      if Trim(FNotaSaidaParam.FmRegiao8.MeRegiao.Text) = '' then
        QRVendaClasse.SetVariable('REGIAO', Null)
      else
        QRVendaClasse.SetVariable('REGIAO', trim(FNotaSaidaParam.FmRegiao8.MeRegiao.Text));

      if Trim(FNotaSaidaParam.FmEstado8.MeEstado.Text) = '' then
        QRVendaClasse.SetVariable('ESTADO', Null)
      else
        QRVendaClasse.SetVariable('ESTADO', FNotaSaidaParam.FmEstado8.MeEstado.Text);

      if Trim(FNotaSaidaParam.MeOperacao8.Text) = '' then
        QRVendaClasse.SetVariable('MONTA_NA_SQL','(TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39) + ') or (TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39) + ')')
      else
        QRVendaClasse.SetVariable('MONTA_NA_SQL', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MeOperacao8.Text))+')');

       //Alterado para buscar vários vendedores  separados por virgula Solicitado por Nestor(Deion) - Alex 12/04/2023
      if Trim(FNotaSaidaParam.Me7CodVendedor.Text) = '' then
        QRVendaClasse.SetVariable('VENDEDOR', '1=1')
      else
        QRVendaClasse.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me7CodVendedor.Text) +  ')');
//
      {if Trim(FNotaSaidaParam.FmVendedor8.MeVendedor.Text) = '' then
        QRVendaClasse.SetVariable('VENDEDOR', Null)
      else
        QRVendaClasse.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor8.MeVendedor.Text));}

      if Trim(FNotaSaidaParam.FmTecnico8.MeVendedor.Text) = '' then
        QRVendaClasse.SetVariable('TECNICO', Null)
      else
        QRVendaClasse.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico8.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmFabricante8.MeCadastro.Text) = '' then
        QRVendaClasse.SetVariable('FABRICANTE', Null)
      else
        QRVendaClasse.SetVariable('FABRICANTE', Trim(FNotaSaidaParam.FmFabricante8.MeCadastro.Text));
      QRVendaClasse.SetVariable('TIPO_CUSTO', FNotaSaidaParam.Rg7TipoCusto.ItemIndex);
      QRVendaClasse.SQL[QRVendaClasse.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      if FNotaSaidaParam.RG7TipoRelatorio.ItemIndex = 0 then
      begin
        case FNotaSaidaParam.CB7Ordem.ItemIndex of
          0: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.COD_CLASSE,Tb_produto.COD_PRODUTO');
          1: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.COD_CLASSE,Tb_produto.DESC_PRODUTO');
          2: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.COD_CLASSE,Tb_produto.NUM_FABRICANTE');
          3: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.DESC_CLASSE,Tb_produto.COD_PRODUTO');
          4: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.DESC_CLASSE,Tb_produto.DESC_PRODUTO');
          5: QRVendaClasse.SQL.Add('ORDER BY To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+'),To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+'),Tb_classe.DESC_CLASSE,Tb_produto.NUM_FABRICANTE');
        end;
        QRVendaClasse.SetVariable('DESC_MES', 'To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MONTH')+')');
        QRVendaClasse.SetVariable('NUM_MES', 'To_Char(tb_nota_cab.dt_emissao,'+QuoteDStr('MM')+')');
      end
      else
      begin
        case FNotaSaidaParam.CB7Ordem.ItemIndex of
          0: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.COD_CLASSE,Tb_produto.COD_PRODUTO');
          1: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.COD_CLASSE,Tb_produto.DESC_PRODUTO');
          2: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.COD_CLASSE,Tb_produto.NUM_FABRICANTE');
          3: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.DESC_CLASSE,Tb_produto.COD_PRODUTO');
          4: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.DESC_CLASSE,Tb_produto.DESC_PRODUTO');
          5: QRVendaClasse.SQL.Add('ORDER BY Tb_classe.DESC_CLASSE,Tb_produto.NUM_FABRICANTE');
        end;
        QRVendaClasse.SetVariable('DESC_MES', quotedStr('1=1'));
        QRVendaClasse.SetVariable('NUM_MES', quotedStr('1=1'));
      end;

      QRVendaClasse.Open;
      if FRNota_Classe = nil then
        FRNota_Classe := TFRNota_Classe.Create(Application);
      if FNotaSaidaParam.Rg7Codigo.ItemIndex = 0 then
        FRNota_Classe.QRDBProduto.DataField := 'COD_PRODUTO'
      else
        FRNota_Classe.QRDBProduto.DataField := 'NUM_FABRICANTE';

      FRNota_Classe.QRGroup1.Enabled := (FNotaSaidaParam.RG7TipoRelatorio.ItemIndex = 0);
      FRNota_Classe.QRBand5.Enabled := (FNotaSaidaParam.RG7TipoRelatorio.ItemIndex = 0);

      FRNota_Classe.QRLTitulo.Caption := 'Vendas por classe e sub-classe de ' + FNotaSaidaParam.ME7DataI.Text + ' até ' + FNotaSaidaParam.ME7DataF.Text;
      FRNota_Classe.QRLFilial.Caption := FNotaSaidaParam.FmFilial8.EdFilial.Text;
      FRNota_Classe.QRLCidade.Caption := FNotaSaidaParam.FmCidade8.EdCidade.Text;
      FRNota_Classe.QRLEstado.Caption := FNotaSaidaParam.FmEstado8.EdEstado.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_Classe.QRPrimario.Preview
      else
        FRNota_Classe.QRPrimario.Print;
      QRVendaClasse.Close;
    end;
end;

procedure TFNotaSaidaCad.VendasporClasseeCondPagto1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[8].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text), 'VENDA');
      QRClassePgto.Close;
      QRClassePgtoVend.Close;
      if (FNotaSaidaParam.ME8DataI.Text = '') or (FNotaSaidaParam.ME8DataF.Text = '') then
        raise Exception.Create('É necessário informar a Data de Emissão.');
      QRClassePgto.SetVariable('DATA_I', FNotaSaidaParam.ME8DataI.Text);
      QRClassePgto.SetVariable('DATA_F', FNotaSaidaParam.ME8DataF.Text + ' 23:59:59');
      QRClassePgtoVend.SetVariable('DATA_I', FNotaSaidaParam.ME8DataI.Text);
      QRClassePgtoVend.SetVariable('DATA_F', FNotaSaidaParam.ME8DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text) = '' then
      begin
        QRClassePgto.SetVariable('FILIAL', Null);
        QRClassePgtoVend.SetVariable('FILIAL', Null)
      end
      else
      begin
        QRClassePgto.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text));
        QRClassePgtoVend.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text))
      end;

      if Trim(FNotaSaidaParam.ME8Classe.Text) = '' then
      begin
        QRClassePgto.SetVariable('CLASSE', Null);
        QRClassePgtoVend.SetVariable('CLASSE', Null)
      end
      else
      begin
        QRClassePgto.SetVariable('CLASSE', FNotaSaidaParam.ME8Classe.Text);
        QRClassePgtoVend.SetVariable('CLASSE', FNotaSaidaParam.ME8Classe.Text)
      end;

      if (Trim(FNotaSaidaParam.ME8SubClasse.Text) = '')
        or (Trim(FNotaSaidaParam.ME8SubClasse.Text) = '0') then
      begin
        QRClassePgto.SetVariable('SUB_CLASSE', Null);
        QRClassePgtoVend.SetVariable('SUB_CLASSE', Null)
      end
      else
      begin
        QRClassePgto.SetVariable('SUB_CLASSE', FNotaSaidaParam.ME8SubClasse.Text);
        QRClassePgtoVend.SetVariable('SUB_CLASSE', FNotaSaidaParam.ME8SubClasse.Text)
      end;

      if Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text) = '' then
      begin
        QRClassePgto.SetVariable('VENDEDOR', Null);
        QRClassePgtoVend.SetVariable('VENDEDOR', Null)
      end
      else
      begin
        QRClassePgto.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text));
        QRClassePgtoVend.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text))
      end;

      if Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text) = '' then
      begin
        QRClassePgto.SetVariable('VENDEDOR_PREPOSTO', Null);
        QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO', Null)
      end
      else
      begin
        QRClassePgto.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text));
        QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text))
      end;

      QRClassePgto.Open;
      QRClassePgtoVend.Open;
      if FRNota_ClassePgto = nil then
        FRNota_ClassePgto := TFRNota_ClassePgto.Create(Application);

      if FRNota_ClassePgtoVend = nil then
        FRNota_ClassePgtoVend := TFRNota_ClassePgtoVend.Create(Application);

      FRNota_ClassePgto.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento ' + FNotaSaidaParam.ME8DataI.Text + ' até ' + FNotaSaidaParam.ME8DataF.Text;
      FRNota_ClassePgtoVend.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento ' + FNotaSaidaParam.ME8DataI.Text + ' até ' + FNotaSaidaParam.ME8DataF.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_ClassePgtoVend.QRCompositeReport1.Preview
      else
        FRNota_ClassePgtoVend.QRCompositeReport1.Print;
      QRClassePgto.Close;
      QRClassePgtoVend.Close;
    end;
end;

procedure TFNotaSaidaCad.MovEstoqueES1Click(Sender: TObject);
var
  wAnoInicial, wMesInicial, wDiaInicial : String;
  wDataJob : TDateTime;
begin
  inherited;
  dmoracle.qdataserv.Open;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[9].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text), 'VENDA');
      QRMovEntradaSaida.Close;

      QRMovEntradaSaida.SetVariable('DATA_I',FNotaSaidaParam.ME9DataI.Text);
      QRMovEntradaSaida.SetVariable('DATA_F',FNotaSaidaParam.ME9DataF.Text + ' 23:59:59'); // + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text) = '' then
        raise Exception.Create('Informe uma filial.')
      else
        QRMovEntradaSaida.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text));
      if trim(FNotaSaidaParam.FmCadastro10.MeCadastro.Text) = '' then
        QRMovEntradaSaida.SetVariable('COD_CADASTRO', NULL)
      else
        QRMovEntradaSaida.SetVariable('COD_CADASTRO', trim(FNotaSaidaParam.FmCadastro10.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmProdutoInicial10.MeProduto.Text) = '' then
        QRMovEntradaSaida.SetVariable('PRODUTO', '1 = 1')
      else
       Begin
         If Trim(FNotaSaidaParam.FmProdutoFinal10.MeProduto.Text) = '' Then
            Raise Exception.Create('Quando informado produto inicial é obrigado informar produto final');
         QRMovEntradaSaida.SetVariable('PRODUTO','TB_NOTA_ITEM.COD_PRODUTO BETWEEN ' + Trim(FNotaSaidaParam.FmProdutoInicial10.MeProduto.Text) +
           ' And ' + Trim(FNotaSaidaParam.FmProdutoFinal10.MeProduto.Text));
       End;
      if Trim(FNotaSaidaParam.FmLote10.MeLote.Text) = '' then
        QRMovEntradaSaida.SetVariable('LOTE', Null)
      else
        QRMovEntradaSaida.SetVariable('LOTE', Trim(FNotaSaidaParam.FmLote10.MeLote.Text));

      if Trim(FNotaSaidaParam.FmOperacao10.MeOperacao.Text) = '' then
        QRMovEntradaSaida.SetVariable('OPERACAO', Null)
      else
        QRMovEntradaSaida.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao10.MeOperacao.Text));

      {aqui foi descomentado}
      if Trim(FNotaSaidaParam.Fm2Operacao10.MeOperacao.Text) = '' then
        QRMovEntradaSaida.SetVariable('OPERACAO1', Null)
      else
        QRMovEntradaSaida.SetVariable('OPERACAO1', Trim(FNotaSaidaParam.Fm2Operacao10.MeOperacao.Text));

      if Trim(FNotaSaidaParam.ME9Classe.Text) = '' then
        QRMovEntradaSaida.SetVariable('CLASSE', Null)
      else
        QRMovEntradaSaida.SetVariable('CLASSE', FNotaSaidaParam.ME9Classe.Text);

      if (Trim(FNotaSaidaParam.ME9Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME9Subclasse.Text) = '0') then
        QRMovEntradaSaida.SetVariable('SUBCLASSE', Null)
      else
        QRMovEntradaSaida.SetVariable('SUBCLASSE', FNotaSaidaParam.ME9Subclasse.Text);

      if(trim(FNotaSaidaParam.FmMarca9.MeMarca.Text) = '') then
        QRMovEntradaSaida.SetVariable('COD_MARCA', null)
      else
        QRMovEntradaSaida.SetVariable('COD_MARCA', FNotaSaidaParam.FmMarca9.MeMarca.Text);

      if Trim(FNotaSaidaParam.FmNota10.MeNota.Text) = '' then
        QRMovEntradaSaida.SetVariable('COD_PRODUTOS_NOTA', '1 = 1')
      Else
        QRMovEntradaSaida.SetVariable('COD_PRODUTOS_NOTA', 'TB_NOTA_ITEM.COD_PRODUTO IN (SELECT COD_PRODUTO FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + Trim(FNotaSaidaParam.FmNota10.MeNota.Text)+')');

      Case FNotaSaidaParam.Rg9ProdComSaida.itemindex Of
         0 : QRMovEntradaSaida.SetVariable('IND_ENTRADA_SAIDA', 'E');
         1 : QRMovEntradaSaida.SetVariable('IND_ENTRADA_SAIDA', 'S');
         2 : QRMovEntradaSaida.SetVariable('IND_ENTRADA_SAIDA', Null);
      End;
      //------
     QRMovEntradaSaida.SQL[QRMovEntradaSaida.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      if FNotaSaidaParam.Rg9Ordem.ItemIndex = 0 then
         QRMovEntradaSaida.Sql.Add('ORDER BY COD_PRODUTO,DESC_PRODUTO')
      else
         QRMovEntradaSaida.Sql.Add('ORDER BY DESC_PRODUTO,COD_PRODUTO');
      QRMovEntradaSaida.Open;

      if FNotaSaidaParam.Rg9Embalagem.ItemIndex = 0 then
      begin
        If FRNota_EntradaSaida = nil then
           FRNota_EntradaSaida := TFRNota_EntradaSaida.Create(Application);
        FRNota_EntradaSaida.QRLTitulo.Caption := 'MOVIMENTAÇÃO DE ESTOQUE DESDE O DIA ' + FNotaSaidaParam.ME9DataI.Text;
        FRNota_EntradaSaida.QRLFilial.Caption := 'FILIAL: ' + Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text) + ' - ' + Trim(FNotaSaidaParam.FmFilial10.EdFilial.Text);
        FRNota_EntradaSaida.QRLClasse.Caption := 'CLASSE: ' + Trim(FNotaSaidaParam.ME9Classe.Text) + ' SUBCLASSE: ' + Trim(FNotaSaidaParam.ME9SubClasse.Text) +
          ' ' + Trim(FNotaSaidaParam.Ed9Classe.Text);
        FRNota_EntradaSaida.QRLCadastro.Caption := 'CADASTRO: ' + Trim(FNotaSaidaParam.FmCadastro10.EdCadastro.Text);

        wDataJob := DMOracle.QDataServDTSERVIDOR.Value - 1;

        FRNota_EntradaSaida.QRLabel8.Caption := DateToStr(wDataJob); //wDiaInicial + '/' + wMesInicial + '/' + wAnoInicial;

        FRNota_EntradaSaida.QrLabel8.Enabled := True;
        FRNota_EntradaSaida.QrDbText4.Enabled := True;
        FRNota_EntradaSaida.QrExpr8.Enabled := True;
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
           FRNota_EntradaSaida.QRPrimario.Preview
        else
           FRNota_EntradaSaida.QRPrimario.Print;
        QRMovEntradaSaida.Close;
      end
      else
      begin
        If FRNota_EntradaSaidaRetrato = nil then
           FRNota_EntradaSaidaRetrato := TFRNota_EntradaSaidaRetrato.Create(Application);
        FRNota_EntradaSaidaRetrato.QRLTitulo.Caption := 'MOVIMENTAÇÃO DE ESTOQUE DESDE O DIA ' + FNotaSaidaParam.ME9DataI.Text;
        FRNota_EntradaSaidaRetrato.QRLFilial.Caption := 'FILIAL: ' + Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text) + ' - ' + Trim(FNotaSaidaParam.FmFilial10.EdFilial.Text);
        FRNota_EntradaSaidaRetrato.QRLClasse.Caption := 'CLASSE: ' + Trim(FNotaSaidaParam.ME9Classe.Text) + ' SUBCLASSE: ' + Trim(FNotaSaidaParam.ME9SubClasse.Text) +
          ' ' + Trim(FNotaSaidaParam.Ed9Classe.Text);
        FRNota_EntradaSaidaRetrato.QRLCadastro.Caption := 'CADASTRO: ' + Trim(FNotaSaidaParam.FmCadastro10.EdCadastro.Text);

        wDataJob := DMOracle.QDataServDTSERVIDOR.Value - 1;

        If (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') Then
          FRNota_EntradaSaidaRetrato.QRLabel8.Caption := FNotaSaidaParam.ME9DataI.Text//wDiaInicial + '/' + wMesInicial + '/' + wAnoInicial;
        Else
          FRNota_EntradaSaidaRetrato.QRLabel8.Caption := DateToStr(wDataJob);//wDiaInicial + '/' + wMesInicial + '/' + wAnoInicial;

        FRNota_EntradaSaidaRetrato.QrLabel8.Enabled := True;
        FRNota_EntradaSaidaRetrato.QrDbText4.Enabled := True;
        FRNota_EntradaSaidaRetrato.QrExpr8.Enabled := True;

       if (DMParamSistema.CodEmpresa = 'GOLDEN') then
         begin
           FRNota_EntradaSaidaRetrato.QRExpr6.Enabled := False;
           FRNota_EntradaSaidaRetrato.QRDBText7.Enabled := False;
           FRNota_EntradaSaidaRetrato.QRLabel11.Enabled := False;
         end;

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
           FRNota_EntradaSaidaRetrato.QRPrimario.Preview
        else
           FRNota_EntradaSaidaRetrato.QRPrimario.Print;
        QRMovEntradaSaida.Close;
        dmoracle.QDataServ.Close;
      end;

      if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
        MovEstoqueES1Click(Self);
    end;

end;

procedure TFNotaSaidaCad.ComissoporCliente1Click(Sender: TObject);
var
  wLinha: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[10].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text), 'VENDA');
      if DMParamSistema.CodEmpresa <> 'DIVINO' then
      begin
        QRComissaoCliente.Close;
        {if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
        begin
          QRComissaoCliente.Sql.Clear;
          QRComissaoCliente.Sql.Add('SELECT Tb_vendedor.COD_VENDEDOR,Tb_vendedor.NOME NOME_VENDEDOR,Tb_vendedor.PERC_IRRF, Tb_cadastro.COD_CADASTRO,');
          QRComissaoCliente.Sql.Add('Tb_cadastro.NOME NOME_CADASTRO,Tb_Nota_Cab.Num_Nota,Tb_Nota_Cab.Cod_Serie,Tb_Nota_Cab.Dt_Emissao,');
          QRComissaoCliente.Sql.Add('Tb_Nota_Cab.Cod_Nota_Cab,Tb_Comissao_Classe.Perc_Comissao perc_comissao_nota,Tb_Comissao_Classe.Perc_Comissao perc_comissao_item,');
          QRComissaoCliente.Sql.Add('Tb_Produto.Perc_comissao Perc_Comissao_Produto');
          QRComissaoCliente.Sql.Add('SUM(Decode(TB_OPERACAO.IND_VENDAS,' + Chr(39) + 'V' + chr(39) + ',Tb_nota_item.QT_QUANTIDADE,Tb_nota_item.QT_QUANTIDADE*-1)) AS SQT_QUANTIDADE,');
          QRComissaoCliente.Sql.Add('SUM(Decode(TB_OPERACAO.IND_VENDAS,' + Chr(39) + 'V' + Chr(39) + ',Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))*-1)) AS SVAL_TOTAL ');
          QRComissaoCliente.Sql.Add('FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_VENDEDOR,TB_OPERACAO,TB_PRODUTO,TB_COMISSAO_CLASSE,TB_PRODUTO WHERE ');
          QRComissaoCliente.Sql.Add('Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ');
          QRComissaoCliente.Sql.Add('TB_NOTA_CAB.IND_SITUACAO = 2 AND TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO AND ');
          QRComissaoCliente.Sql.Add('Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO AND Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) AND');
          QRComissaoCliente.Sql.Add('((TB_OPERACAO.IND_VENDAS = ' + chr(39) + 'V' + chr(39) + ') OR (TB_OPERACAO.IND_VENDAS = ' + chr(39) + 'D' + chr(39) + '))');
          QRComissaoCliente.Sql.Add(' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND TB_PRODUTO.COD_CLASSE = TB_COMISSAO_CLASSE.COD_CLASSE');
          QRComissaoCliente.Sql.Add(' AND TB_NOTA_CAB.COD_VENDEDOR = TB_COMISSAO_CLASSE.COD_VENDEDOR');
          QRComissaoCliente.Sql.Add(' AND (:FILIAL IS NULL OR :FILIAL = TB_NOTA_CAB.COD_FILIAL)');
          QRComissaoCliente.Sql.Add(' AND (:VENDEDOR IS NULL OR :VENDEDOR = TB_NOTA_CAB.COD_VENDEDOR)');
          QRComissaoCliente.Sql.Add(' AND (:VENDEDOR_PREPOSTO IS NULL OR :VENDEDOR_PREPOSTO = TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO)');
          QRComissaoCliente.Sql.Add(' AND ((:SERIE IS NULL OR TB_NOTA_CAB.COD_SERIE = :SERIE)');
          QRComissaoCliente.Sql.Add(' OR  (:SERIE1 IS NULL OR TB_NOTA_CAB.COD_SERIE = :SERIE1))');
          QRComissaoCliente.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F');
          QRComissaoCliente.Sql.Add(' AND (:IND_CONDICAO_PAGTO IS NULL OR TB_NOTA_CAB.IND_CONDICAO_PAGTO = :IND_CONDICAO_PAGTO)');
          QRComissaoCliente.Sql.Add(' GROUP BY Tb_vendedor.COD_VENDEDOR,Tb_vendedor.NOME,Tb_vendedor.PERC_IRRF,Tb_cadastro.COD_CADASTRO,Tb_cadastro.NOME,');
          QRComissaoCliente.Sql.Add(' Tb_Nota_Cab.Num_Nota,Tb_Nota_Cab.Cod_Serie,Tb_Nota_Cab.Dt_Emissao,Tb_Nota_Cab.Cod_Nota_Cab,Tb_Comissao_Classe.Perc_Comissao,');
          QRComissaoCliente.Sql.Add(' Tb_Comissao_Classe.Perc_Comissao,Tb_Produto.Perc_comissao');
          QRComissaoCliente.Sql.Add(' ORDER BY NOME_VENDEDOR,Num_Nota');
          wlinha := QRComissaoCliente.Sql.text;
        end;  }
        QRComissaoCliente.SetVariable('DATA_I', FNotaSaidaParam.ME10DataI.Text);
        QRComissaoCliente.SetVariable('DATA_F', FNotaSaidaParam.ME10DataF.Text + ' 23:59:59');
        if Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text) = '' then
          QRComissaoCliente.SetVariable('FILIAL', Null)
        else
          QRComissaoCliente.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text));
        if Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text) = '' then
          QRComissaoCliente.SetVariable('VENDEDOR', Null)
        else
          QRComissaoCliente.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text));
        if Trim(FNotaSaidaParam.FmVendedorPreposto11.MeVendedor.Text) = '' then
          QRComissaoCliente.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRComissaoCliente.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto11.MeVendedor.Text));
        if Trim(FNotaSaidaParam.ed10NumNota.text) = '' then
          QRComissaoCliente.setvariable('NOTA', Null)
        else
          QRComissaoCliente.setvariable('NOTA', Trim(FNotaSaidaParam.ed10NumNota.Text));
        if Trim(FNotaSaidaParam.Ed10Serie.Text) = '' then
          QRComissaoCliente.SetVariable('SERIE', Null)
        else
          QRComissaoCliente.SetVariable('SERIE', Trim(FNotaSaidaParam.Ed10Serie.Text));
        if Trim(FNotaSaidaParam.Ed10Serie1.Text) = '' then
          QRComissaoCliente.SetVariable('SERIE1', Null)
        else
          QRComissaoCliente.SetVariable('SERIE1', Trim(FNotaSaidaParam.Ed10Serie1.Text));
        if FNotaSaidaParam.RG10CondicaoPagto.ItemIndex <> 3 then
          QRComissaoCliente.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RG10CondicaoPagto.ItemIndex + 1)
        else
          QRComissaoCliente.SetVariable('IND_CONDICAO_PAGTO', null);

        case FNotaSaidaParam.CB10TipoProduto.ItemIndex of
          0:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', NULL);
          1:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'AGRICOLA');
          2:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'AGUA');
          3:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'COM. ARROZ');
          4:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'COMERCIAL');
          5:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'CONSUMO');
          6:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'IMOBILIZADO');
          7:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'INDUSTRIAL');
          8:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'INSUMOS');
          9:  QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'PATRIMONIO');
          10: QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'SERVIÇO');
          11: QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'VEICULO');
          12: QRComissaoCliente.SetVariable('TIPO_PRODUTO', 'PEÇA');
        end;
        QRComissaoCliente.SQL[QRComissaoCliente.SQL.Count - 1] := ''; // elimina a última Linha da SQL
        case FNotaSaidaParam.CB10Ordem.ItemIndex of
          0: QRComissaoCliente.SQL.Add('ORDER BY NOME_VENDEDOR,Num_Nota');
          1: QRComissaoCliente.SQL.Add('ORDER BY COD_VENDEDOR,Num_Nota');
          2: QRComissaoCliente.SQL.Add('ORDER BY DT_EMISSAO');
        end;
        QRComissaoCliente.Open;
        if FRNota_ComissaoCliente = nil then
          FRNota_ComissaoCliente := TFRNota_ComissaoCliente.Create(Application);
        FRNota_ComissaoCliente.QRLTitulo.Caption := 'Comissão de Vendedores por Cliente ' + FNotaSaidaParam.ME10DataI.Text + ' até ' + FNotaSaidaParam.ME10DataF.Text;
        FRNota_ComissaoCliente.QRLFilial.Caption := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial11.EdFilial.Text);
        FRNota_ComissaoCliente.QRLObservacao.Caption := 'Obs: ' + FNotaSaidaParam.Me10Observacao.Text;
        FRNota_ComissaoCliente.QRLObservacao1.Caption := FNotaSaidaParam.Me10Observacao1.Text;
        if FNotaSaidaParam.Rg10Comissao.ItemIndex = 1 then
        begin
          FRNota_ComissaoCliente.QRDBText11.Enabled := False;
          FRNota_ComissaoCliente.QRLabel11.Enabled := False;
          FRNota_ComissaoCliente.QRExpr2.Enabled := False;
        end
        else
        begin
          FRNota_ComissaoCliente.QRDBText11.Enabled := True;
          FRNota_ComissaoCliente.QRLabel11.Enabled := True;
          FRNota_ComissaoCliente.QRExpr2.Enabled := True;
        end;

        if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS' then
          FRNota_ComissaoCliente.QRLQuantidade.Caption := 'Quant.'
        else
        begin
          if MessageDlg('Deseja Imprimir o IRRF?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            FRNota_ComissaoCliente.QRLabel3.Enabled := true;
            FRNota_ComissaoCliente.QRLabel4.Enabled := true;
            FRNota_ComissaoCliente.QRLabel13.Enabled := true;
            FRNota_ComissaoCliente.QRExpr3.Enabled := true;
            FRNota_ComissaoCliente.QRExpr4.Enabled := true;
            FRNota_ComissaoCliente.QRDBText2.Enabled := true;
          end
          else
          begin
            FRNota_ComissaoCliente.QRLabel3.Enabled := false;
            FRNota_ComissaoCliente.QRLabel4.Enabled := false;
            FRNota_ComissaoCliente.QRLabel13.Enabled := false;
            FRNota_ComissaoCliente.QRExpr3.Enabled := false;
            FRNota_ComissaoCliente.QRExpr4.Enabled := false;
            FRNota_ComissaoCliente.QRDBText2.Enabled := false;
          end;
        end;
//        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' then
//           FRNota_ComissaoCliente.QRGCabVendedor.ForceNewPage := True;
        if FNotaSaidaParam.Rg10Opcao.ItemIndex = 0 then
          FRNota_ComissaoCliente.QRBand3.Enabled := True
        else
          FRNota_ComissaoCliente.QRBand3.Enabled := False;
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_ComissaoCliente.QRPrimario.Preview
        else
          FRNota_ComissaoCliente.QRPrimario.Print;
        QRComissaoCliente.Close;
    end
    else //DIVINO
    begin
      QRComissaoArtista.Close;
      if Trim(FNotaSaidaParam.ME10DataI.Text) <> '' then
        QRComissaoArtista.SetVariable('DATA_I', FNotaSaidaParam.ME10DataI.Text)
      else
        QRComissaoArtista.SetVariable('DATA_I', null);
      if Trim(FNotaSaidaParam.ME10DataF.Text) <> '' then
        QRComissaoArtista.SetVariable('DATA_F', FNotaSaidaParam.ME10DataF.Text + ' 23:59:59')
      else
        QRComissaoArtista.SetVariable('DATA_F',null);
      if Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text) = '' then
        QRComissaoArtista.SetVariable('COD_FILIAL', Null)
      else
        QRComissaoArtista.SetVariable('COD_FILIAL', Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text) = '' then
        QRComissaoArtista.SetVariable('COD_VENDEDOR', Null)
      else
        QRComissaoArtista.SetVariable('COD_VENDEDOR', Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FMConsultor10.MeCadastro.Text) = '' then
        QRComissaoArtista.SetVariable('COD_CONSULTOR', Null)
      else
        QRComissaoArtista.SetVariable('COD_CONSULTOR', Trim(FNotaSaidaParam.FMConsultor10.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmArtista10.MeCadastro.Text) = '' then
        QRComissaoArtista.SetVariable('COD_ARTISTA',null)
      else
        QRComissaoArtista.SetVariable('COD_ARTISTA', Trim(FNotaSaidaParam.FmArtista10.MeCadastro.Text));
      {if Trim(FNotaSaidaParam.ed10NumNota.text) = '' then
        QRComissaoArtista.setvariable('NOTA', Null)
      else
        QRComissaoArtista.setvariable('NOTA', Trim(FNotaSaidaParam.ed10NumNota.Text));
      if Trim(FNotaSaidaParam.Ed10Serie.Text) = '' then
        QRComissaoArtista.SetVariable('SERIE', Null)
      else
        QRComissaoArtista.SetVariable('SERIE', Trim(FNotaSaidaParam.Ed10Serie.Text));
      if Trim(FNotaSaidaParam.Ed10Serie1.Text) = '' then
        QRComissaoArtista.SetVariable('SERIE1', Null)
      else
        QRComissaoArtista.SetVariable('SERIE1', Trim(FNotaSaidaParam.Ed10Serie1.Text));
      if FNotaSaidaParam.RG10CondicaoPagto.ItemIndex <> 3 then
        QRComissaoArtista.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RG10CondicaoPagto.ItemIndex + 1)
      else
        QRComissaoArtista.SetVariable('IND_CONDICAO_PAGTO', null);}
      QRComissaoArtista.SQL[QRComissaoArtista.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FNotaSaidaParam.CB10Ordem.ItemIndex of
        0: QRComissaoArtista.SQL.Add('ORDER BY NOME_VENDEDOR,Num_Nota');
        1: QRComissaoArtista.SQL.Add('ORDER BY COD_VENDEDOR,Num_Nota');
        2: QRComissaoArtista.SQL.Add('ORDER BY DT_EMISSAO');
      end;
      QRComissaoArtista.Open;
      if FRComissaoArtista = nil then
        FRComissaoArtista := TFRComissaoArtista.Create(Application);
      FRComissaoArtista.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME10DataI.Text + ' Até ' + FNotaSaidaParam.ME10DataF.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRComissaoArtista.QRPrimario.Preview
      else
        FRComissaoArtista.QRPrimario.Print;
      QRComissaoArtista.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.PrazosdeVenda1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text), 'VENDA');
      QRPrazoVenda.Close;
      QRPrazoVenda.SetVariable('DATA_I', FNotaSaidaParam.ME11DataI.Text);
      QRPrazoVenda.SetVariable('DATA_F', FNotaSaidaParam.ME11DataF.Text + ' 23:59:59');
      QRPrazoVenda.SetVariable('PRAZO1', FNotaSaidaParam.ME11Prazo1.Text);
      QRPrazoVenda.SetVariable('PRAZO2', FNotaSaidaParam.ME11Prazo2.Text);
      QRPrazoVenda.SetVariable('PRAZO3', FNotaSaidaParam.ME11Prazo3.Text);
      QRPrazoVenda.SetVariable('PRAZO4', FNotaSaidaParam.ME11Prazo4.Text);
      QRPrazoVenda.SetVariable('PRAZO5', FNotaSaidaParam.ME11Prazo5.Text);
      QRPrazoVenda.SetVariable('PRAZO6', FNotaSaidaParam.ME11Prazo6.Text);
      if Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text) = '' then
        QRPrazoVenda.SetVariable('FILIAL', Null)
      else
        QRPrazoVenda.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text));
      QRPrazoVenda.Open;
      if FRNota_PrazoVenda = nil then
        FRNota_PrazoVenda := TFRNota_PrazoVenda.Create(Application);
      FRNota_PrazoVenda.QRLTitulo.Caption := 'Vendas por Prazo de ' + FNotaSaidaParam.ME11DataI.Text + ' até ' + FNotaSaidaParam.ME11DataF.Text;
      FRNota_PrazoVenda.QRLPrazo1.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo1.Text + 'd.';
      FRNota_PrazoVenda.QRLPrazo2.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo2.Text + 'd.';
      FRNota_PrazoVenda.QRLPrazo3.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo3.Text + 'd.';
      FRNota_PrazoVenda.QRLPrazo4.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo4.Text + 'd.';
      FRNota_PrazoVenda.QRLPrazo5.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo5.Text + 'd.';
      FRNota_PrazoVenda.QRLPrazo6.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo6.Text + 'd.';
      FRNota_PrazoVenda.QRLLongoPrazo.Caption := '+ de ' + FNotaSaidaParam.ME11Prazo6.Text + 'd.';

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_PrazoVenda.QRPrimario.Preview
      else
        FRNota_PrazoVenda.QRPrimario.Print;
      QRPrazoVenda.Close;
    end;
end;

procedure TFNotaSaidaCad.VendedorPreoMdio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[12].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
    if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    begin
      FNotaSaidaParam.FmVendedor13.MeVendedor.Enabled := False;
      FNotaSaidaParam.FmVendedor13.BtVendedor.Enabled := False;
      FNotaSaidaParam.FmVendedor13.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end
    else
    begin
      FNotaSaidaParam.FmSupervisor13.MeVendedor.Enabled := False;
      FNotaSaidaParam.FmSupervisor13.BtVendedor.Enabled := False;
      FNotaSaidaParam.FmSupervisor13.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text), 'VENDA');

      QRVendedorCMedio.Close;
      QRVendedorCMedio2.Close;
      QRVendedorCMedio.SetVariable('DATA_I', FNotaSaidaParam.ME12DataI.Text);
      QRVendedorCMedio.SetVariable('DATA_F', FNotaSaidaParam.ME12DataF.Text + ' 23:59:59');

      QRVendedorCMedio2.SetVariable('DATA_I', FNotaSaidaParam.ME12DataI.Text);
      QRVendedorCMedio2.SetVariable('DATA_F', FNotaSaidaParam.ME12DataF.Text + ' 23:59:59');

      //fabiano 27122004
      if Trim(FNotaSaidaParam.ME12PrecoIni.Text) <> '' then
      begin
        QRVendedorCMedio.SetVariable('VAL_TOTAL_INI', strtofloat(Trim(FNotaSaidaParam.ME12PrecoIni.Text)));
        QRVendedorCMedio2.SetVariable('VAL_TOTAL_INI', strtofloat(Trim(FNotaSaidaParam.ME12PrecoIni.Text)));
      end
      else
      begin
        QRVendedorCMedio.SetVariable('VAL_TOTAL_INI', Null);
        QRVendedorCMedio2.SetVariable('VAL_TOTAL_INI', Null);
      end;

      if Trim(FNotaSaidaParam.ME12PrecoFim.Text) <> '' then
      begin
        QRVendedorCMedio.SetVariable('VAL_TOTAL_FIM', strtofloat(Trim(FNotaSaidaParam.ME12PrecoFim.Text)));
        QRVendedorCMedio2.SetVariable('VAL_TOTAL_FIM', strtofloat(Trim(FNotaSaidaParam.ME12PrecoFim.Text)));
      end
      else
      begin
        QRVendedorCMedio.SetVariable('VAL_TOTAL_FIM', Null);
        QRVendedorCMedio2.SetVariable('VAL_TOTAL_FIM', Null);
      end;
      //fim fabiano

      if Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('FILIAL', Null);
        QRVendedorCMedio2.SetVariable('FILIAL', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text));
        QRVendedorCMedio2.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text));
      end;

      if Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('VENDEDOR', Null);
        QRVendedorCMedio2.SetVariable('VENDEDOR', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text));
        QRVendedorCMedio2.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text));
      end;
      if Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('SUPERVISOR', Null);
        QRVendedorCMedio2.SetVariable('SUPERVISOR', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text));
        QRVendedorCMedio2.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text));
      end;
      if Trim(FNotaSaidaParam.ME12Cadastro.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('COD_CADASTRO', Null);
        QRVendedorCMedio2.SetVariable('COD_CADASTRO', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('COD_CADASTRO', FNotaSaidaParam.ME12Cadastro.Text);
        QRVendedorCMedio2.SetVariable('COD_CADASTRO', FNotaSaidaParam.ME12Cadastro.Text);
      end;

      if Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('COD_DEPARTAMENTO', Null);
        QRVendedorCMedio2.SetVariable('COD_DEPARTAMENTO', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('COD_DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text));
        QRVendedorCMedio2.SetVariable('COD_DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text));
      end;

      if Trim(FNotaSaidaParam.Me12Serie.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('COD_SERIE', Null);
        QRVendedorCMedio2.SetVariable('COD_SERIE', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('COD_SERIE', FNotaSaidaParam.Me12Serie.Text);
        QRVendedorCMedio2.SetVariable('COD_SERIE', FNotaSaidaParam.Me12Serie.Text);
      end;

      if Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('ESTADO', Null);
        QRVendedorCMedio2.SetVariable('ESTADO', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text));
        QRVendedorCMedio2.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text));
      end;

      if Trim(FNotaSaidaParam.FmCidade12.MeCidade.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('CIDADE', Null);
        QRVendedorCMedio2.SetVariable('CIDADE', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade12.MeCidade.Text));
        QRVendedorCMedio2.SetVariable('CIDADE', Trim(FNotaSaidaParam.FmCidade12.MeCidade.Text));
      end;

      if Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('IND_VENDAS', 'V');
        QRVendedorCMedio.SetVariable('OPERACAO', Null);
        QRVendedorCMedio2.SetVariable('IND_VENDAS', 'V');
        QRVendedorCMedio2.SetVariable('OPERACAO', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('IND_VENDAS', Null);
        QRVendedorCMedio.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text));
        QRVendedorCMedio2.SetVariable('IND_VENDAS', Null);
        QRVendedorCMedio2.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text));
      end;

      if Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('CLASSE', Null);
        QRVendedorCMedio2.SetVariable('CLASSE', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('CLASSE', Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text));
        QRVendedorCMedio2.SetVariable('CLASSE', Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text));
      end;

      if Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text) = '' then
      begin
        QRVendedorCMedio.SetVariable('RAMO', Null);
        QRVendedorCMedio2.SetVariable('RAMO', Null);
      end
      else
      begin
        QRVendedorCMedio.SetVariable('RAMO', Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text));
        QRVendedorCMedio2.SetVariable('RAMO', Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text));
      end;

      QRVendedorCMedio.Open;

      if FRNota_VendedorCMedio = nil then
        FRNota_VendedorCMedio := TFRNota_VendedorCMedio.Create(Application);

      FRNota_VendedorCMedio.QRLTitulo.Caption := 'Vendas por Rep. Comercial/Custo Médio de ' + FNotaSaidaParam.ME12DataI.Text + ' até ' + FNotaSaidaParam.ME12DataF.Text;
      FRNota_VendedorCMedio.QRLOperacao.Caption := 'Operação:' + Trim(FNotaSaidaParam.FmOperacao13.EdOperacao.Text) + ' ' + 'Estado:' + Trim(FNotaSaidaParam.FmEstado13.EdEstado.Text);
      FRNota_VendedorCMedio.QRLRepresentante.Caption := 'Representante: ' + Trim(FNotaSaidaParam.FmVendedor13.EdVendedor.Text) + ' Supervisor:' + Trim(FNotaSaidaParam.FmSupervisor13.EdVendedor.Text);
      QRVendedorCMedio2.Open;

      if FRNota_VendedorCMedio2 = nil then
        FRNota_VendedorCMedio2 := TFRNota_VendedorCMedio2.Create(Application);
      FRNota_VendedorCMedio2.QRLRepresentante.Caption := 'Representante: ' + Trim(FNotaSaidaParam.FmVendedor13.EdVendedor.Text) + ' Supervisor:' + Trim(FNotaSaidaParam.FmSupervisor13.EdVendedor.Text);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_VendedorCMedio.QRCompositeReport2.Preview
          //      QRGVendedorCMedio.Preview
      else
        FRNota_VendedorCMedio.QRCompositeReport2.Print;
      //     QRGVendedorCMedio.Print;
      QRVendedorCMedio2.Close;
      QRVendedorCMedio.Close;
    end;

end;

procedure TFNotaSaidaCad.QRGVendedorCMedioAddReports(Sender: TObject);
begin
  inherited;
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio.QRPrimario);
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio2.QRPrimario);
end;

procedure TFNotaSaidaCad.Secretaria1Click(Sender: TObject);
var
  wClasse_I, wClasse_F: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[13].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text), 'VENDA');
      QRSecretaria.Close;
      QRSecretaria.SetVariable('DATA_I_PRI', '01/01/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_F_PRI', '31/03/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_I_SEG', '01/04/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_F_SEG', '30/06/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_I_TER', '01/07/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_F_TER', '30/09/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_I_QUA', '01/10/' + Trim(FNotaSaidaParam.ME13ANO.Text));
      QRSecretaria.SetVariable('DATA_F_QUA', '31/12/' + Trim(FNotaSaidaParam.ME13ANO.Text));

      wClasse_I := FormatFloat('000', StrToFloat(FNotaSaidaParam.ME13ClasseI.Text)) +
        FormatFloat('000', StrToFloat(FNotaSaidaParam.ME13SubClasseI.Text));

      wClasse_F := FormatFloat('000', StrToFloat(FNotaSaidaParam.ME13ClasseF.Text)) +
        FormatFloat('000', StrToFloat(FNotaSaidaParam.ME13SubClasseF.Text));

      if Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text) = '' then
        QRSecretaria.SetVariable('FILIAL', Null)
      else
        QRSecretaria.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text));

      if Trim(FNotaSaidaParam.ME13ClasseI.Text) = '' then
        QRSecretaria.SetVariable('CLASSE_I', Null)
      else
        QRSecretaria.SetVariable('CLASSE_I', wClasse_I);

      if Trim(FNotaSaidaParam.ME13ClasseF.Text) = '' then
        QRSecretaria.SetVariable('CLASSE_F', Null)
      else
        QRSecretaria.SetVariable('CLASSE_F', wClasse_F);

      QRSecretaria.Open;
      if FRNota_Secretaria = nil then
        FRNota_Secretaria := TFRNota_Secretaria.Create(Application);

      FRNota_Secretaria.QRLFilial.Caption := Trim(FNotaSaidaParam.FmFilial14.EdFilial.Text);
      FRNota_Secretaria.QRLMunicipio.Caption := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text));
      ;
      FRNota_Secretaria.QRLAno.Caption := FNotaSaidaParam.Me13Ano.Text;
      FRNota_Secretaria.QRLResponsavel.Caption := FNotaSaidaParam.Ed13NomeResponsavel.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_Secretaria.QRPrimario.Preview
      else
        FRNota_Secretaria.QRPrimario.Preview;
      QRSecretaria.Close;
    end;
end;

procedure TFNotaSaidaCad.VendedorQuota1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[14].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
  begin
    FNotaSaidaParam.FmVendedor15.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor15.BtVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor15.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text), 'VENDA');
      QRQuotaVend.Close;
      QRQuotaVend3.Close;
      QRQuotaVend.SetVariable('ANO', FormatFloat('0000', StrToFloat(FNotaSaidaParam.ME14Ano.Text)));
      QRQuotaVend3.SetVariable('ANO', FormatFloat('0000', StrToFloat(FNotaSaidaParam.ME14Ano.Text)));

      if Trim(FNotaSaidaParam.ME14NumClasse.Text) = '' then
      begin
        //QRQuotaVend.SetVariable('CLASSE',Null);
        QRQuotaVend2.SetVariable('CLASSE', Null);
        QRQuotaVend3.SetVariable('CLASSE', Null);
      end
      else
      begin
        //QRQuotaVend.SetVariable('CLASSE',FNotaSaidaParam.ME14NumClasse.Text);
        QRQuotaVend2.SetVariable('CLASSE', FNotaSaidaParam.ME14NumClasse.Text);
        QRQuotaVend3.SetVariable('CLASSE', FNotaSaidaParam.ME14NumClasse.Text);
      end;

      if Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text) = '' then
      begin
        QRQuotaVend.SetVariable('VENDEDOR', Null);
        QRQuotaVend2.SetVariable('VENDEDOR', Null);
        QRQuotaVend3.SetVariable('VENDEDOR', Null);
      end
      else
      begin
        QRQuotaVend.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
        QRQuotaVend2.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
        QRQuotaVend3.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
      end;

      {    if Trim(FNotaSaidaParam.ME14VendedorPreposto.Text)= ''   then
          begin
            QRQuotaVend.SetVariable('VENDEDOR_PREPOSTO',Null);
            QRQuotaVend2.SetVariable('VENDEDOR_PREPOSTO',Null);
            QRQuotaVend3.SetVariable('VENDEDOR_PREPOSTO',Null);
          end
          else
          begin
            QRQuotaVend.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME14VendedorPreposto.Text);
            QRQuotaVend2.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME14VendedorPreposto.Text);
            QRQuotaVend3.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME14VendedorPreposto.Text);
          end;
      }

      if Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text) = '' then
      begin
        //QRQuotaVend.SetVariable('FILIAL',Null);
        QRQuotaVend3.SetVariable('FILIAL', Null);
      end
      else
      begin
        //QRQuotaVend.SetVariable('FILIAL',FNotaSaidaParam.ME14Filial.Text);
        QRQuotaVend3.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text));
      end;
      QRQuotaVend.Open;
      QRQuotaVend3.Open;

      if FRNota_QuotaVend = nil then
        FRNota_QuotaVend := TFRNota_QuotaVend.Create(Application);
      FRNota_QuotaVend.QRLTitulo.Caption := 'Vendas por Vendedor/Quota';

      if FRNota_QuotaVend3 = nil then
        FRNota_QuotaVend3 := TFRNota_QuotaVend3.Create(Application);
      FRNota_QuotaVend3.QRLTitulo.Caption := 'Resumo de Vendas por Vendedor/Quota';

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_QuotaVend.QRCompositeReport1.Preview
      else
        FRNota_QuotaVend.QRCompositeReport1.Print;

      QRQuotaVend.Close;
      QRQuotaVend3.Close;
    end;
end;

procedure TFNotaSaidaCad.Inadimplncia1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[15].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text), 'VENDA');
      QRInadimplencia.Close;
      if Trim(FNotaSaidaParam.ME15DataI.Text) <> '' then
        QRInadimplencia.SetVariable('DATA_I', FNotaSaidaParam.ME15DataI.Text);
      if Trim(FNotaSaidaParam.ME15DataF.Text) <> '' then
        QRInadimplencia.SetVariable('DATA_F', FNotaSaidaParam.ME15DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text) = '' then
        QRInadimplencia.SetVariable('FILIAL', Null)
      else
        QRInadimplencia.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmCadastro16.MeCadastro.Text) = '' then
        QRInadimplencia.SetVariable('VENDEDOR', Null)
      else
        QRInadimplencia.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmCadastro16.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto16.MeVendedor.Text) = '' then
        QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto16.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmSupervisor16.MeVendedor.Text) = '' then
        QRInadimplencia.SetVariable('COD_SUPERVISOR', Null)
      else
        QRInadimplencia.SetVariable('COD_SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor16.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmFinalidade16.MeFinalidade.Text) = '' then
        QRInadimplencia.SetVariable('COD_FINALIDADE', Null)
      else
        QRInadimplencia.SetVariable('COD_FINALIDADE', Trim(FNotaSaidaParam.FmFinalidade16.MeFinalidade.Text));
      if Trim(FNotaSaidaParam.FmEstado16.MeEstado.Text) = '' then
        QRInadimplencia.SetVariable('COD_ESTADO', Null)
      else
        QRInadimplencia.SetVariable('COD_ESTADO', Trim(FNotaSaidaParam.FmEstado16.MeEstado.Text));

      case FNotaSaidaParam.Rg15Situacao.ItemIndex of
        0: QRInadimplencia.SetVariable('IND_SITUACAO', Null);
        1: QRInadimplencia.SetVariable('IND_SITUACAO', 'ATIVO');
        2: QRInadimplencia.SetVariable('IND_SITUACAO', 'INATIVO');
      end;
      case FNotaSaidaParam.Rg15CondPagto.ItemIndex of
        0: QRInadimplencia.SetVariable('TIPO_PAGAMENTO', '2');
        1: QRInadimplencia.SetVariable('TIPO_PAGAMENTO', Null);
      end;
      case FNotaSaidaParam.Rg15DtReceber.ItemIndex of
        0: QRInadimplencia.SetVariable('DATA_CONTA_RECEBER', 'DT_EMISSAO BETWEEN ' + QuoteDStr(FNotaSaidaParam.ME15DataI.Text) +
                                                             ' And ' + QuoteDStr(FNotaSaidaParam.ME15DataF.Text)) ;
        1: QRInadimplencia.SetVariable('DATA_CONTA_RECEBER', 'DT_VENCIMENTO BETWEEN ' + QuoteDStr(FNotaSaidaParam.ME15DataI.Text) +
                                                             ' And ' + QuoteDStr(FNotaSaidaParam.ME15DataF.Text)) ;
      end;
      QRInadimplencia.SQL[QRInadimplencia.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FNotaSaidaParam.Rg15Ordem.ItemIndex of
        0: QRInadimplencia.SQL.Add('ORDER BY COD_SUPERVISOR,NOME_VENDEDOR');
        1: QRInadimplencia.SQL.Add('ORDER BY COD_SUPERVISOR,COD_VENDEDOR');
      end;
      QRInadimplencia.Open;
      if FRNota_Inadimplencia = nil then
        FRNota_Inadimplencia := TFRNota_Inadimplencia.Create(Application);
      FRNota_Inadimplencia.QRLTitulo.Caption := 'Mapa de Inadimplência de ' + FNotaSaidaParam.ME15DataI.Text + ' até ' + FNotaSaidaParam.ME15DataF.Text;
      FRNota_Inadimplencia.QRLSupervisor.Caption := FNotaSaidaParam.FmSupervisor16.EdVendedor.Text;
      if FNotaSaidaParam.FmEstado16.EdEstado.Text <> 'Todos' then
        FRNota_Inadimplencia.QRLInadimplencia.Caption := FNotaSaidaParam.FmEstado16.EdEstado.Text
      else
        FRNota_Inadimplencia.QRLInadimplencia.Caption := '';

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_Inadimplencia.QRPrimario.Preview
      else
        FRNota_Inadimplencia.QRPrimario.Print;
      QRInadimplencia.Close;
    end;
end;

procedure TFNotaSaidaCad.ContaCorrente1Click(Sender: TObject);
var i: Integer;
    wRegistrosSelecionados: String;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[16].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text), 'VENDA');
      if FRNota_ContaCorrente = nil then
        FRNota_ContaCorrente := TFRNota_ContaCorrente.Create(Application);
      if FFiltroRelContaCorrente = nil then
        FFiltroRelContaCorrente := TFFiltroRelContaCorrente.Create(Application);
      FFiltroRelContaCorrente.CDSFiltroRelatorio.Close;
      if Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_FILIAL').Value := null
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_FILIAL').Value :=
          Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text);
      if Trim(FNotaSaidaParam.FmCadastro17.MeCadastro.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CADASTRO').Value := null
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CADASTRO').Value :=
          Trim(FNotaSaidaParam.FmCadastro17.MeCadastro.Text);

      case FNotaSaidaParam.RGTipoPagto.ItemIndex of
        0:
          begin
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := '1';
            FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas à Vista de ' + FNotaSaidaParam.ME16DataI.Text + ' até ' + FNotaSaidaParam.ME16DataF.Text;
            //if DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' then
//              QRContaCorrente.SetVariable(':CONDICAO_PAGTO',' ((TB_NOTA_CAB.IND_CONDICAO_PAGTO = 1 ) '+
//                ' OR (TB_NOTA_CAB.VAL_AVISTA > 0)) AND TB_OPERACAO.COD_HISTORICO_CAIXA = 1');
          end;
        1:
          begin
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := '2';
            FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas a Prazo de ' + FNotaSaidaParam.ME16DataI.Text + ' até ' + FNotaSaidaParam.ME16DataF.Text;
          end;
        2:
          begin
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := '3';
            FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Conta  Corrente de ' + FNotaSaidaParam.ME16DataI.Text + ' até ' + FNotaSaidaParam.ME16DataF.Text;
          end;
        3:
          begin
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := '4';
            FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Cartão de Crédito ' + FNotaSaidaParam.ME16DataI.Text + ' até ' + FNotaSaidaParam.ME16DataF.Text;
          end;
        4:
          begin
            FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('CONDICAO_PAGTO').Value := NULL;
            FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Todas de ' + FNotaSaidaParam.ME16DataI.Text + ' até ' + FNotaSaidaParam.ME16DataF.Text;
          end;
      end;
      if Trim(FNotaSaidaParam.FmVendedor16.MeVendedor.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_VENDEDOR').Value := null
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_VENDEDOR').Value :=
          Trim(FNotaSaidaParam.FmVendedor16.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmDepartamento16.MeDepartamento.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_DEPARTAMENTO').Value := NULL
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_DEPARTAMENTO').Value :=
          Trim(FNotaSaidaParam.FmDepartamento16.MeDepartamento.Text);
      if Trim(FNotaSaidaParam.Me16Serie.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('SERIE').Value := NULL
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('SERIE').Value :=
          Trim(FNotaSaidaParam.Me16Serie.Text);
      if Trim(FNotaSaidaParam.FmHistorico16.MeHistorico.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('HISTORICO_CAIXA').Value := NULL
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('HISTORICO_CAIXA').Value :=
          Trim(FNotaSaidaParam.FmHistorico16.MeHistorico.Text);
      if Trim(FNotaSaidaParam.FmClassificacao16.MeClassificacao.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CLASS_CADASTRO').Value := NULL
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_CLASS_CADASTRO').Value :=
          Trim(FNotaSaidaParam.FmClassificacao16.MeClassificacao.Text);
      if Trim(FNotaSaidaParam.FmProduto16.MeProduto.Text) = '' then
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_PRODUTO').Value := NULL
      else
        FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('COD_PRODUTO').Value :=
          Trim(FNotaSaidaParam.FmProduto16.MeProduto.Text);
      FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('DATA_I').Value :=
        StrToDate(Trim(FNotaSaidaParam.ME16DataI.Text));
      FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('DATA_F').Value :=
        StrToDate(Trim(FNotaSaidaParam.ME16DataF.Text));

      FFiltroRelContaCorrente.CDSFiltroRelatorio.Params.ParamByName('NOTA_CAB').Value := NULL;
      pTipoPagto := FNotaSaidaParam.RGTipoPagto.ItemIndex; // utilizado no calcfields da query
      QRContaCorrente.Sql.Delete(QRContaCorrente.SQL.Count-1);
      if FNotaSaidaParam.Rg16Ordem.ItemIndex = 0 then
      begin
        if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
          QRContaCorrente.Sql.Add(' Order By NOME_CADASTRO')
        else
          QRContaCorrente.Sql.Add(' Order By Tb_Cadastro.COD_CADASTRO')
      end
      else
        QRContaCorrente.Sql.Add(' Order By Tb_nota_cab.NUM_NOTA');

      FFiltroRelContaCorrente.CDSFiltroRelatorio.Open;
      if FFiltroRelContaCorrente.ShowModal = mrOk then
      begin
        wRegistrosSelecionados := '';
        FFiltroRelContaCorrente.CDSFiltroRelatorio.First;
        while not FFiltroRelContaCorrente.CDSFiltroRelatorio.Eof do
        begin
          if FFiltroRelContaCorrente.CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
            wRegistrosSelecionados := wRegistrosSelecionados + FFiltroRelContaCorrente.CDSFiltroRelatorioCOD_NOTA_CAB.Text + ',';
          FFiltroRelContaCorrente.CDSFiltroRelatorio.Next;
        end;
        if wRegistrosSelecionados <> '' then
        begin
          wRegistrosSelecionados := LeftStr(wRegistrosSelecionados, Length(wRegistrosSelecionados) - 1);
          QRContaCorrente.SetVariable('NOTA_CAB',wRegistrosSelecionados);
          QRContaCorrente.Open;
          FRNota_ContaCorrente.QRLHistorico.Caption := 'Filial:' + Trim(FNotaSaidaParam.FmFilial17.EdFilial.Text) + ' - ' + Trim(FNotaSaidaParam.FmHistorico16.EdHistorico.Text);
          FRNota_ContaCorrente.QRLDepartamento.Caption := Trim(FNotaSaidaParam.FmDepartamento16.EdDepartamento.Text);
          if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
            FRNota_ContaCorrente.QRPrimario.Preview
          else
            FRNota_ContaCorrente.QRPrimario.Print;
          QRContaCorrente.Close;
        end;
      end;
    end;
end;

procedure TFNotaSaidaCad.SBGeraContaCorrenteClick(Sender: TObject);
begin
  inherited;
  try
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    if FNota_ContaCorrente = nil then
      FNota_ContaCorrente := TFNota_ContaCorrente.Create(Application);
    FNota_Contacorrente.ShowModal;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
  except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    raise;
  end;
end;

procedure TFNotaSaidaCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
  begin
    if FSenha = nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
      if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        raise Exception.Create('Usuário sem permissão!');
  end;
  if MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (not DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      if (DMOracle.BuscaNome('SELECT COD_DOC_ORIGINARIO FROM TB_DOC_ORIGINARIO', 'COD_NOTA_CAB = ' +
          DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '') then
        raise Exception.Create('Não é possível excluir esta nota. Ela está associada ao CT-e CÓD. ' +
          DMOracle.BuscaNome('SELECT COD_CONHECIMENTO FROM TB_DOC_ORIGINARIO', 'COD_NOTA_CAB = ' +
          DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text));

      DMNfe.SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, true);
      if ((StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_DFE_NAO_PODE_SER_EXCLUIDO) or
          (StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) = 635)) and
         (DMNfe.QNfeIND_AMBIENTE_NFE.Value = 1) then
      begin
        MessageDlg('Essa nota está registrada na SEFAZ.' + #13 + #10 +
          'Não é permitida a sua exclusão.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    DMNotaSaida.ExcluiNota;
  end;
  MeCodValeProduto.Clear;
end;

procedure TFNotaSaidaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao_CF.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaSaidaCad.SBCancelarClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Cancel;
  end;
  inherited;
  MeCodValeProduto.Text := DMOracle.FastSelect('COD_VALE_PRODUTO','TB_VALE_PRODUTO',
    'COD_NOTA_CAB_TROCA = ' +IntToStr(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value));
end;

procedure TFNotaSaidaCad.SBImprimeCupomFiscalClick(Sender: TObject);
begin
  inherited;
  if Trim(DBECodNota.Text) = '' then
  begin
    MessageDlg('Primeiro selecione a nota fiscal!', mtInformation, [mbOk], 0);
    Exit;
  end
  else
  begin
    if FImpressoraFiscal = nil then
      FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
    if FImpressoraFiscal.EmiteCF_Yanco(DBECodNota.Text) = False then
      MessageDlg('Erro na tentativa de imprimir cupom fiscal!', mtInformation, [mbOk], 0);
    FImpressoraFiscal.ShowModal;
  end;
end;

procedure TFNotaSaidaCad.SBConsultaFreteClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoCons = nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
    with DMNotaSaida do
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK', DMNotaEntrada.QConhecimentoConsCod_Nota_Cab.Value);
      QNotaSaida.Open;
    end;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoEnter(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    QBaixasPed.Open;
  end;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoExit(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    QBaixasPed.Close;
  end;
end;

procedure TFNotaSaidaCad.PMapaVendasPVendedorPagtoClasse1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[18].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
    if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    begin
      FNotaSaidaParam.FmVendedor19.Enabled := False;
      FNotaSaidaParam.FmVendedor19.BtVendedor.Enabled := False;
      FNotaSaidaParam.FmVendedor19.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end
    else
    begin
      FNotaSaidaParam.FmSupervisor19.MeVendedor.Enabled := True;
      FNotaSaidaParam.FmSupervisor19.BtVendedor.Enabled := True;
//      FNotaSaidaParam.FmSupervisor19.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text), 'VENDA');
      QRVendClasse.Close;
      QRVendClasse.SetVariable('DATA_I', FNotaSaidaParam.ME18DataI.Text);
      QRVendClasse.SetVariable('DATA_F', FNotaSaidaParam.ME18DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text) = '' then
        QRVendClasse.SetVariable('FILIAL', Null)
      else
        QRVendClasse.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmVendedor19.MeVendedor.Text) = '' then
        QRVendClasse.SetVariable('VENDEDOR', Null)
      else
        QRVendClasse.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor19.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmVendedorPreposto19.MeVendedor.Text) = '' then
        QRVendClasse.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendClasse.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto19.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmSupervisor19.MeVendedor.Text) = '' then
        QRVendClasse.SetVariable('SUPERVISOR', Null)
      else
        QRVendClasse.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor19.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmOperacao19.MeOperacao.Text) = '' then
      begin
        QRVendClasse.SetVariable('MONTA_NA_ROTINA_VENDA', 'TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39));
        if DMParamSistema.CodEmpresa = 'JASOL' then
          QRVendClasse.SetVariable('MONTA_NA_ROTINA_DEVOLUCAO', 'TB_NOTA_CAB.COD_OPERACAO = 0 ') 
        else
          QRVendClasse.SetVariable('MONTA_NA_ROTINA_DEVOLUCAO', 'TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39));
      end
      else
      begin
        QRVendClasse.SetVariable('MONTA_NA_ROTINA_VENDA', 'TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.FmOperacao19.MeOperacao.Text));
        QRVendClasse.SetVariable('MONTA_NA_ROTINA_DEVOLUCAO', 'TB_NOTA_CAB.COD_OPERACAO = 0 '); // SERVE PARA NAO PEGAR NENHUMA NOTA
      end; // NA ROTINA DE DEVOLUCAO QUANDO INFORMADO A OPERACAO

      QRVendClasse.Open;
      if FRVendedorClasse = nil then
        FRVendedorClasse := TFRVendedorClasse.Create(Application);
      FRVendedorClasse.QRLTitulo.Caption := 'Mapa de Vendas P/Vendedor/Classe/Cond Pagto ' + FNotaSaidaParam.ME18DataI.Text + ' até ' + FNotaSaidaParam.ME18DataF.Text;
      if FNotaSaidaParam.RG18Tipo.ItemIndex = 0 then
        FRVendedorClasse.QRBand4.Enabled := True
      else
        FRVendedorClasse.QRBand4.Enabled := False;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendedorClasse.QRPrimario.Preview
      else
        FRVendedorClasse.QRPrimario.Print;
      QRVendClasse.Close;
    end;

end;

procedure TFNotaSaidaCad.QContaCorrenteAberto1Click(Sender: TObject);
var
  wSql: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[19].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      if (Trim(FNotaSaidaParam.ME19Valor.Text) <> '') and
        (Trim(FNotaSaidaParam.ME19ValorMaior.Text) <> '') then
        raise Exception.Create('Somente informar Opção de valores maior ou menor que...');
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text), 'VENDA');
      QRContaCorrente2.Close;
      QRContaCorrente2.Sql.Clear;
      wSql := 'SELECT SUM(SVAL_TOTAL) AS VAL_TOTAL,VAL_AVISTA,COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ';
      wSql := wSql + 'FROM (SELECT SUM(Tb_nota_item.VAL_TOTAL+TB_NOTA_ITEM.VAL_ICMS_SUBST- PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM)) SVAL_TOTAL, ';
      wSql := wSql + 'TB_NOTA_CAB.COD_CADASTRO,VAL_AVISTA,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
      wSql := wSql + 'FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_FILIAL WHERE ';
      wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
      wSql := wSql + 'TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO  AND ';
      wSql := wSql + 'TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL AND ';
      wSql := wSql + 'TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39) + ' AND ';
      wSql := wSql + 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3 ';
      wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ';
      if Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text);
      if Trim(FNotaSaidaParam.ME19CodCadastro.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME19CodCadastro.Text);
      case FNotaSaidaParam.Rg19TipoNota.ItemIndex of
        0: wSql := wSql + ' And TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'E' + chr(39);
        1: wSql := wSql + ' And TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'S' + chr(39);
      end;
      if Trim(FNotaSaidaParam.ME19DtInicial.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtInicial.Text) + chr(39);
      if Trim(FNotaSaidaParam.ME19DtFinal.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtFinal.Text) + chr(39);
      wSql := wSql + ' GROUP BY VAL_AVISTA,TB_NOTA_CAB.COD_CADASTRO,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
      if Trim(FNotaSaidaParam.ME19Valor.Text) <> '' then
        wSql := wSql + ' ) WHERE VAL_TOTAL < ' + (FNotaSaidaParam.ME19Valor.Text)
      else if Trim(FNotaSaidaParam.ME19ValorMaior.Text) <> '' then
        wSql := wSql + ' ) WHERE VAL_TOTAL > ' + (FNotaSaidaParam.ME19ValorMaior.Text)
      else
        wSql := wSql + ' )';
      wSql := wSql + ' GROUP BY VAL_AVISTA,COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ORDER BY NOME';
      QRContaCorrente2.Sql.Add(wSql);
      QRContaCorrente2.Open;
      if FRContaCorrente2 = nil then
        FRContaCorrente2 := TFRContaCorrente2.Create(Application);
      FRContaCorrente2.QRLTitulo.Caption := 'Conta Corrente de ' + FNotaSaidaParam.ME19DtInicial.Text + ' até ' + FNotaSaidaParam.ME19DtFinal.Text + ' Valor Menor Que:' + FNotaSaidaParam.ME19Valor.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRContaCorrente2.QRPrimario.Preview
      else
        FRContaCorrente2.QRPrimario.Print;
      QRContaCorrente2.Close;
    end;
end;

procedure TFNotaSaidaCad.RRecibodeComisso1Click(Sender: TObject);
var
  wSQL: string;
begin
  inherited;

    wSQL :=
      'SELECT' +
      ' Tb_vendedor.COD_VENDEDOR,' +
      ' Tb_vendedor.PERC_IRRF,' +
      ' Tb_vendedor.NOME AS NOME_VENDEDOR,' +
      ' Tb_nota_cab.COD_SERIE,' +
      ' Tb_filial.COD_FILIAL,' +
      ' Tb_filial.DESC_FILIAL, ' +
      ' Tb_vendedor.DESC_CIDADE, ' +
      ' Tb_vendedor.DESC_CEP,' +
      ' Tb_vendedor.DESC_ENDERECO,' +
      ' Tb_vendedor.DESC_CPF NUM_CGC,' +
      ' Tb_vendedor.DESC_TELEFONE,' +
      ' Tb_vendedor.COD_ESTADO,' +
      ' SUM(Decode(TB_OPERACAO.IND_VENDAS,' + chr(39) + 'V' + chr(39) + ',Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),' +
      '(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))*-1)) AS SVAL_TOTAL,' +
      ' SUM((Decode(TB_OPERACAO.IND_VENDAS,' + chr(39) + 'V' + chr(39) + ',Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM),' +
      ' (Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM))*-1)) * Tb_nota_cab.PERC_COMISSAO / 100) AS Sval_comissao' +
      ' FROM' +
      ' TB_NOTA_CAB,' +
      ' TB_NOTA_ITEM,' +
      ' TB_OPERACAO,' +
      ' TB_FILIAL,' +
      ' TB_VENDEDOR' +
      ' WHERE' +
      ' TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO' +
      ' AND' +
      ' Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL' +
      ' AND' +
      ' Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR' +
      ' AND' +
      ' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB' +
      ' AND' +
      ' TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39) +
      ' AND' +
      ' ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR (TB_NOTA_CAB.PERC_COMISSAO > 0))' +
      ' AND' +
      ' ((TB_OPERACAO.IND_VENDAS = ' + chr(39) + 'V' + chr(39) + ') OR (TB_OPERACAO.IND_VENDAS = ' + chr(39) + 'D' + chr(39) + '))' +
      ' AND' +
      ' TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I' +
      ' AND' +
      ' TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F' +
      ' AND' +
      ' (:VENDEDOR IS NULL OR' +
      ' TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)' +
      ' AND' +
      ' (:SERIE IS NULL OR' +
      ' TB_NOTA_CAB.COD_SERIE = :SERIE)' +
      ' AND' +
      ' (:SERIE1 IS NULL OR' +
      ' TB_NOTA_CAB.COD_SERIE = :SERIE1)' +
      ' AND' +
      ' (:VENDEDOR_PREPOSTO IS NULL OR' +
      ' TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)' +
      ' AND' +
      ' (:FILIAL IS NULL OR' +
      ' TB_NOTA_CAB.COD_FILIAL = :FILIAL)' +
      ' GROUP BY' +
      ' Tb_vendedor.COD_VENDEDOR,' +
      ' Tb_vendedor.PERC_IRRF,' +
      ' Tb_vendedor.NOME,' +
      ' Tb_filial.COD_FILIAL,' +
      ' Tb_nota_cab.COD_SERIE,' +
      ' Tb_filial.DESC_FILIAL,' +
      ' Tb_vendedor.DESC_CIDADE,' +
      ' Tb_vendedor.DESC_CEP,' +
      ' Tb_vendedor.DESC_ENDERECO,' +
      ' Tb_vendedor.DESC_CPF,' +
      ' Tb_vendedor.DESC_TELEFONE,' +
      ' Tb_vendedor.COD_ESTADO ';
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[20].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text), 'VENDA');
      QRReciboComissao.Close;
      QRReciboComissao.SQL.Clear;
      QRReciboComissao.SQL.add(wSQL);

      QRReciboComissao.SetVariable('DATA_I', FNotaSaidaParam.ME20DtInicial.Text);
      QRReciboComissao.SetVariable('DATA_F', FNotaSaidaParam.ME20DtFinal.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text) = '' then
        QRReciboComissao.SetVariable('FILIAL', Null)
      else
        QRReciboComissao.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor21.MeVendedor.Text) = '' then
        QRReciboComissao.SetVariable('VENDEDOR', Null)
      else
        QRReciboComissao.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor21.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto21.MeVendedor.Text) = '' then
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto21.MeVendedor.Text));
      if Trim(FNotaSaidaParam.Ed20Serie.Text) = '' then
        QRReciboComissao.SetVariable('SERIE', Null)
      else
        QRReciboComissao.SetVariable('SERIE', Trim(FNotaSaidaParam.Ed20Serie.Text));
      if Trim(FNotaSaidaParam.Ed20Serie1.Text) = '' then
        QRReciboComissao.SetVariable('SERIE1', Null)
      else
        QRReciboComissao.SetVariable('SERIE1', Trim(FNotaSaidaParam.Ed20Serie1.Text));
      QRReciboComissao.Open;
      if FReciboComissao2 = nil then
        FReciboComissao2 := TFReciboComissao2.Create(Application);
      FReciboComissao2.QRLHistorico.Caption := FNotaSaidaParam.Me20Historico.Text;
      FReciboComissao2.QRLData.Caption := FormatDateTime('dd", de" mmmm "de" yyyy"."', StrToDate(FNotaSaidaParam.Me20DtFinal.Text));
      if (Trim(FNotaSaidaParam.Ed20Serie.Text) = 'PE') or
        (Trim(FNotaSaidaParam.Ed20Serie1.Text) = 'PE') then
      begin
        FReciboComissao2.QRlabel6.Font.Color := ClwHite;
        FReciboComissao2.QRDBText8.Font.Color := ClwHite;
        FReciboComissao2.QRlabel9.Font.Color := ClwHite;
        FReciboComissao2.QRDBText14.Font.Color := ClwHite;
      end
      else
      begin
        FReciboComissao2.QRlabel6.Font.Color := ClWindowText;
        FReciboComissao2.QRDBText8.Font.Color := ClWindowText;
        FReciboComissao2.QRlabel9.Font.Color := ClWindowText;
        FReciboComissao2.QRDBText14.Font.Color := ClWindowText;
      end;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FReciboComissao2.QRPrimario.Preview
      else
        FReciboComissao2.QRPrimario.Print;
      QRReciboComissao.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.FormCreate(Sender: TObject);
var
  sCaminho: String;
begin
  inherited;
  DMNotaSaida.QClassTribIbsCbs.Open;
  if (DMParamSistema.CodEmpresa = 'INSIDE') or (DMParamSistema.CodEmpresa = 'DISPART') then
    DBRGCondicaoPagamento.Items.add('CONTA CORRENTE')
  else
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NUTRI' then
       DBRGCondicaoPagamento.Items.add('CHEQUES')
    else
    begin
      DBRGCondicaoPagamento.Items.Add('OUTROS');
      DBRGCondicaoPagamento.Items.Add('CARTÃO CRÉDITO');
      DBRGCondicaoPagamento.Items.Add('CARTÃO DÉBITO');
      DBRGCondicaoPagamento.Items.Add('PIX');
    end;

  BibVenda.PersonalizaPagamento(DBRGCondicaoPagamento);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  begin
    DBRGCondicaoPagamento.Items.Add('DINHEIRO');
    DBRGCondicaoPagamento.Items.Add('CHEQUE');
    DBRGCondicaoPagamento.Items.Add('CARTAO CREDITO');
    DBRGCondicaoPagamento.Items.Add('CARTAO DEBITO');
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'INJEPAR') then
  begin
    DBRGCondicaoPagamento.Items[2] := 'CONTA CORRENTE';
  end;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR') then
  begin
    DBDProduto.Visible := False;
    LBrutoPeca.Visible := True;
    LBrutoServico.Visible := True;
    DBEBrutoPeca.Visible := True;
    DBEBrutoServico.Visible := True;
    DBEComplemento.Top := DBDProduto.Top;
    DBEComplemento.Left := DBDProduto.Left + 72;
    DBEComplemento.Width := DBDProduto.Width - 72;
    DBEComplemento.Visible := True;
    DBGItens.Columns.Items[1].FieldName := 'DESC_COMPLEMENTO';
    LblPlaca.Visible := True;
    DBEPlaca.Visible := True;
    LblPlaca.Left := LblValFrete.Left;
    LblPlaca.Top := LblValFrete.Top;
    DBEPlaca.Left := DBEValFrete.Left;
    DBEPlaca.Top := DBEValFrete.Top;
    DBEPlaca.Width := DBEValFrete.Width;
    LblValFrete.Left := LblCSLL.Left;
    LblValFrete.Top := LblCSLL.Top;
    DBEValFrete.Left := DBECSLL.Left;
    DBEValFrete.Top := DBECSLL.Top;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'JJPNEUS' then // Para colocar complemento no item
  begin
    LblCultura.Caption := 'Complemento';
    DBECultura.Visible := False;
    BtCultura.Visible := False;
    LblCfop.Visible := False;
    DBECfop.Visible := False;
    DBEComplemento.Top := DBECultura.Top;
    DBEComplemento.Left := DBECultura.Left;
    DBEComplemento.Width := 200;
    DBEComplemento.Visible := True;
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZITO') Then
  Begin
    LbValCusto.Visible := True;
    LbValCusto.Top   := 130;
    LbValCusto.Left := 660;
    DBECusto.Visible := True;
    DBECusto.Top := 146;
    DBECusto.Left := 660;
  end;
{  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MFARINHA') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'PRECIOSA'))Then
  Begin
    LblContrato.Visible := False;
    DBPObra.Visible := False;
    Label60.Visible := False;
    MeCodValeProduto.Visible := False;
    BtBuscarValeProduto.Visible := False;
    LblChegada.Visible := False;
    DBEdit34.Visible := False;
    DBEdit72.Visible := False;
    DBECultura.Visible := False;
    LblCultura.Visible := False;
    BtCultura.Visible := False;
  end;  }
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GOLDEN' then
     DBEdit10.Enabled := False; //Desabilitado o campo NUM_NOTA para GOLDEN. Motivo: A Jessica estava informando
                               //o Numero manual e não deixava sequir a sequencia da SÉRIE. Junior - 13/11/2013.

  if DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S' then
    MMCadSimples.Items[4].Items[3].Enabled := True;

  if DMParamSistema.CodEmpresa = 'NEOALI' then
  begin
    Label45.Visible    := False;//lote
    DBEdit57.Visible   := False; //lote
    BtConsLote.Visible := False;//lote
    DBDirceu4.Visible  := False;//lote
    DBENumFabricante.Width := 155;
    BtConsProduto.Left     := 230;
    DBDProduto.Left        := 260;
    DBDProduto.Width       := 330;

    DBGItens.Columns.Items[2].Title.Caption := 'Cód. Obra';
    DBGItens.Columns.Items[2].Title.Alignment := taLeftJustify;
    DBGItens.Columns.Items[2].FieldName := 'NUM_FABRICANTE';
    DBGItens.Columns.Items[1].Width := 330;
    DBGItens.Columns.Items[3].Width := 60;
  end;
  //Por Gian 23/07/2020
  //Solicitado pela Gabriele que trabalha na G.Girardi.
  if (DMParamSistema.CodEmpresa = 'GGIRARDI') or (DMParamSistema.CodEmpresa = 'STEIN') then
    DMNotaSaida.QItemNFVAL_UNITARIO.DisplayFormat := '#,###0.0000000'
  else
    DMNotaSaida.QItemNFVAL_UNITARIO.DisplayFormat := '#,###0.0000';
end;

procedure TFNotaSaidaCad.SRelatrioVendasComCheque1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text), 'VENDA');
      QRNota_ComCheque.Close;
      QRNota_ComCheque.SetVariable('DATA_I', FNotaSaidaParam.ME11DataI.Text);
      QRNota_ComCheque.SetVariable('DATA_F', FNotaSaidaParam.ME11DataF.Text + ' 23:59:59');

      QRNota_ComCheque.SetVariable('PRAZO1', FNotaSaidaParam.ME11Prazo1.Text);
      QRNota_ComCheque.SetVariable('PRAZO2', FNotaSaidaParam.ME11Prazo2.Text);
      QRNota_ComCheque.SetVariable('PRAZO3', FNotaSaidaParam.ME11Prazo3.Text);
      QRNota_ComCheque.SetVariable('PRAZO4', FNotaSaidaParam.ME11Prazo4.Text);

      if Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text) = '' then
        QRNota_ComCheque.SetVariable('FILIAL', Null)
      else
        QRNota_ComCheque.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text));
      QRNota_ComCheque.Open;
      if FRNota_ComCheque = nil then
        FRNota_ComCheque := TFRNota_ComCheque.Create(Application);

      FRNota_ComCheque.QRLTitulo.Caption := 'Vendas Com Cheques de ' + FNotaSaidaParam.ME11DataI.Text + ' até ' + FNotaSaidaParam.ME11DataF.Text;
      FRNota_ComCheque.QRLPrazo1.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo1.Text + 'd.';
      FRNota_ComCheque.QRLPrazo2.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo2.Text + 'd.';
      FRNota_ComCheque.QRLPrazo3.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo3.Text + 'd.';
      FRNota_ComCheque.QRLPrazo4.Caption := 'Até ' + FNotaSaidaParam.ME11Prazo4.Text + 'd.';
      FRNota_ComCheque.QRLLongoPrazo.Caption := '+ de ' + FNotaSaidaParam.ME11Prazo4.Text + 'd.';

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_ComCheque.QRPrimario.Preview
      else
        FRNota_ComCheque.QRPrimario.Print;
      QRNota_ComCheque.Close;
    end;

end;

procedure TFNotaSaidaCad.TRelatrioMaioresClientes1Click(Sender: TObject);
var
  wSql, wSql1: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[21].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text), 'VENDA');
      QRMaioresClientes.Close;
      QRMaioresClientesVend.Close;
      QRMaioresClientes.SetVariable('DATA_I', FNotaSaidaParam.ME21DataI.Text);
      QRMaioresClientes.SetVariable('DATA_F', FNotaSaidaParam.ME21DataF.Text + ' 23:59:59');
      QRMaioresClientesVend.SetVariable('DATA_I', FNotaSaidaParam.ME21DataI.Text);
      QRMaioresClientesVend.SetVariable('DATA_F', FNotaSaidaParam.ME21DataF.Text + ' 23:59:59');

      //TESTE MARCOS
      if FNotaSaidaParam.Rg21Cliente.ItemIndex = 0 then
      begin
        wSql := 'TB_OPERACAO.IND_VENDAS,''V''';
        wSql1 := '((TB_OPERACAO.IND_VENDAS = ''V'') OR  (TB_OPERACAO.IND_VENDAS = ''D''))';
        QRMaioresClientes.SetVariable('IND_COMPRA_VENDA', wSql);
        QRMaioresClientes.SetVariable('IND_COMPRA_VENDA1', wSql1);
        QRMaioresClientesVend.SetVariable('IND_COMPRA_VENDA', wSql);
        QRMaioresClientesVend.SetVariable('IND_COMPRA_VENDA1', wSql1);
      end
      else
      begin
        wSql := 'TB_OPERACAO.IND_COMPRAS,''C''';
        wSql1 := '((TB_OPERACAO.IND_COMPRAS = ''C'') OR  (TB_OPERACAO.IND_COMPRAS = ''D''))';
        QRMaioresClientes.SetVariable('IND_COMPRA_VENDA', wSql);
        QRMaioresClientes.SetVariable('IND_COMPRA_VENDA1', wSql1);
        QRMaioresClientesVend.SetVariable('IND_COMPRA_VENDA', wSql);
        QRMaioresClientesVend.SetVariable('IND_COMPRA_VENDA1', wSql1);
      end;

      if Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('FILIAL', Null);
        QRMaioresClientesVend.SetVariable('FILIAL', Null)
      end
      else
      begin
        QRMaioresClientes.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text));
        QRMaioresClientesVend.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text))
      end;

      if Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('VENDEDOR', Null);
        QRMaioresClientesVend.SetVariable('VENDEDOR', Null)
      end
      else
      begin
        QRMaioresClientes.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text));
        QRMaioresClientesVend.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text))
      end;

      if Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO', Null);
        QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO', Null)
      end
      else
      begin
        QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text));
        QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text))
      end;

      if FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex] = 'TODOS' then
      begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO', Null);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO', Null)
      end
      else
      begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO', FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex]);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO', FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex])
      end;                                                                            
      if Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO', Null);
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO', Null);
      end
      else
      begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO', Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text));
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO', Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text));
      end;
      if Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('SUPERVISOR', Null);
        QRMaioresClientesVend.SetVariable('SUPERVISOR', Null);
      end
      else
      begin
        QRMaioresClientes.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text));
        QRMaioresClientesVend.SetVariable('SUPERVISOR', Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text));
      end;
      if Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('COD_DEPARTAMENTO', Null);
        QRMaioresClientesVend.SetVariable('COD_DEPARTAMENTO', Null);
      end
      else
      begin
        QRMaioresClientes.SetVariable('COD_DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text));
        QRMaioresClientesVend.SetVariable('COD_DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text));
      end;
      if Trim(FNotaSaidaParam.Me21Serie.Text) = '' then
      begin
        QRMaioresClientes.SetVariable('COD_SERIE', Null);
        QRMaioresClientesVend.SetVariable('COD_SERIE', Null);
      end
      else
      begin
        QRMaioresClientes.SetVariable('COD_SERIE', Trim(FNotaSaidaParam.Me21Serie.Text));
        QRMaioresClientesVend.SetVariable('COD_SERIE', Trim(FNotaSaidaParam.Me21Serie.Text));
      end;
      QRMaioresClientes.SQL[QRMaioresClientes.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      QRMaioresClientesVend.SQL[QRMaioresClientesVend.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FNotaSaidaParam.RG21Tipo.ItemIndex of
        0:
          begin
            QRMaioresClientes.SQL.Add('Order By sVal_Total Desc');
            QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, SVAL_TOTAL DESC');
          end;
        1:
          begin
            QRMaioresClientes.SQL.Add('Order By sQt_Quantidade Desc');
            QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, sQt_Quantidade Desc');
          end;
      end;
      QRMaioresClientes.Open;
      QRMaioresClientesVend.Open;
      if FRMaioresClientes = nil then
        FRMaioresClientes := TFRMaioresClientes.Create(Application);
      FRMaioresClientes.QRLTitulo.Caption := 'Relacao de Maiores Clientes de ' + FNotaSaidaParam.ME21DataI.Text + ' até ' + FNotaSaidaParam.ME21DataF.Text;
      FRMaioresClientes.QRLSupervisor.Caption := 'Supervisor : ' + Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmSupervisor22.EdVendedor.Text);
      if FRMaioresClientesVend = nil then
        FRMaioresClientesVend := TFRMaioresClientesVend.Create(Application);
      FRMaioresClientesVend.QRLTitulo.Caption := 'Relação de Maiores Clientes de ' + FNotaSaidaParam.ME21DataI.Text + ' até ' + FNotaSaidaParam.ME21DataF.Text;
      FRMaioresClientesVend.QRLSupervisor.Caption := 'Supervisor : ' + Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmSupervisor22.EdVendedor.Text);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRMaioresClientes.QRCompositeReport1.Preview
          //QRGVendedorCMedio.Preview
      else
        FRMaioresClientes.QRCompositeReport1.Print;

      QRMaioresClientes.Close;
      QRMaioresClientesVend.Close;
    end;

end;

procedure TFNotaSaidaCad.VResumoProdutosPorCliente1Click(Sender: TObject);
var
  wSql, WSql2: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[23].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text), 'VENDA');
      QRResumoCliente.Close;
      QRResumoCliente.Sql.Clear;
      wsql := 'SELECT STIPO,COD_PRODUTO,COD_LOTE_TIPO,NUM_EMBALAGEM,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES,DESC_MES,';
      wSql := wSql + 'Sum(SQT_QUANTIDADE) as SQT_QUANTIDADE,Sum(SVAL_TOTAL) as SVAL_TOTAL,VAL_CUSTO,COD_REGIAO,DESC_REGIAO FROM (';

      wSql := wSql + 'SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO + 0.00 AS COD_PRODUTO,Tb_nota_item.COD_LOTE_TIPO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO + 0.00 AS COD_CADASTRO,';
      wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR + 0.00 AS COD_VENDEDOR,Tb_nota_cab.NUM_NOTA + 0.00 AS NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')) DT_MES,to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +') DESC_MES,Sum(Tb_nota_item.QT_QUANTIDADE) + 0.00 as SQT_QUANTIDADE,';
      wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_ICMS_SUBST) ';
      wSql := wSql + 'as SVAL_TOTAL,Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao,TB_REGIAO.DESC_REGIAO FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO,TB_CLASSE,TB_REGIAO ';
      wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)';
      wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)';
      wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)';
      wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)';
      wSql := wSql + ' AND (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE)';
      wSql := wSql + ' AND (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)';
      wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2';
      wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'S' + CHR(39);
      wSql := wSql + ' AND TB_OPERACAO.IND_BONIFICACAO <> ' + CHR(39) + 'S' + CHR(39);
      if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
      if Trim(FNotaSaidaParam.MeOperacao22.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MeOperacao22.Text))+')';
      if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
      if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
        wSql := wSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
      if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
      if Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text) <> '' then
        wSql := wSql + ' AND TB_PRODUTO.COD_MARCA = ' + Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text);
      if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
      if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' then
        wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);
      if Trim(FNotaSaidaParam.MeClasse24.Text) <> '' then
        wSql := wSql + 'and tb_classe.num_classe = ' + Trim(FNotaSaidaParam.MeClasse24.Text);
      if (Trim(FNotaSaidaParam.MeSubClasse24.Text) <> '') then
        wSql := wSql + 'and tb_classe.num_subclasse = ' + Trim(FNotaSaidaParam.MeSubClasse24.Text);

      if (Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text) <> '') then
        wSql := wSql + 'and tb_cadastro.cod_regiao = ' + Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text);
      if (Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text) <> '') then
        wSql := wSql + 'and tb_cadastro.cod_cidade = ' + Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text);

      wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_nota_item.COD_LOTE_TIPO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
      wSql := wSql + ' Tb_cadastro.NOME,Tb_cadastro.DESC_TELEFONE,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')),to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +'),Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao,tb_regiao.desc_regiao UNION ALL ';

         //testando adc mais uma string wSQL2
      WSql := WSql + ' SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO, Tb_nota_item.COD_LOTE_TIPO, TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
      WSql := WSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')) DT_MES,to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +') DESC_MES,Sum(Tb_nota_item.QT_QUANTIDADE) * (-1) as SQT_QUANTIDADE,';
      WSql := WSql + ' Sum(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_ICMS_SUBST) * (-1) as SVAL_TOTAL,Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao, TB_REGIAO.DESC_REGIAO ';
      WSql := WSql + ' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO,TB_CLASSE,TB_REGIAO ';
      WSql := WSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)';
      WSql := WSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
      WSql := WSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)';
      WSql := WSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)';
      WSql := WSql + ' AND (Tb_PRODUTO.COD_CLASSE = Tb_CLASSE.COD_CLASSE)';
      WSql := WSql + ' AND (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)';
      WSql := WSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2';
      WSql := WSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'E' + CHR(39);
      WSql := WSql + ' AND TB_OPERACAO.IND_VENDAS = ' + CHR(39) + 'D' + CHR(39);
      if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
      if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
      if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
        WSql := WSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
      if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
      if Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text) <> '' then
        WSql := WSql + ' AND TB_PRODUTO.COD_MARCA = ' + Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text);
      if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
      if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);
      if Trim(FNotaSaidaParam.MeClasse24.Text) <> '' then
        WSql := WSql + 'and tb_classe.num_classe = ' + Trim(FNotaSaidaParam.MeClasse24.Text);
      if (Trim(FNotaSaidaParam.MeSubClasse24.Text) <> '') then
        WSql := WSql + 'and tb_classe.num_subclasse = ' + Trim(FNotaSaidaParam.MeSubClasse24.Text);

      if (Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text) <> '') then
        WSql := WSql + 'and tb_cadastro.cod_regiao = ' + Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text);
      if (Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text) <> '') then
        WSql := WSql + 'and tb_cadastro.cod_cidade = ' + Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text);

      WSql := WSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_nota_item.COD_LOTE_TIPO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
      WSql := WSql + ' Tb_cadastro.NOME,Tb_cadastro.DESC_TELEFONE,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')),to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +'),Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao, TB_REGIAO.DESC_REGIAO UNION ALL ';

      WSql := WSql + 'SELECT ' + CHR(39) + 'BONIFICAÇÃO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO,Tb_nota_item.COD_LOTE_TIPO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
      WSql := WSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')) DT_MES,to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +') DESC_MES,Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,';
      WSql := WSql + 'Sum(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + TB_NOTA_ITEM.VAL_ICMS_SUBST) as SVAL_TOTAL,Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao, TB_REGIAO.DESC_REGIAO ';
      WSql := WSql + ' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO,TB_CLASSE, TB_REGIAO ';
      WSql := WSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO)';
      WSql := WSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO)';
      WSql := WSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB)';
      WSql := WSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO)';
      WSql := WSql + ' AND (Tb_PRODUTO.COD_CLASSE = Tb_CLASSE.COD_CLASSE)';
      WSql := WSql + ' AND (Tb_CADASTRO.COD_REGIAO = Tb_REGIAO.COD_REGIAO)';
      WSql := WSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2';
      WSql := WSql + ' AND TB_OPERACAO.IND_BONIFICACAO = ' + CHR(39) + 'S' + CHR(39);
      if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
      if Trim(FNotaSaidaParam.MeOperacao22.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MeOperacao22.Text))+')';
      if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
      if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
        WSql := WSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
      if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
      if Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text) <> '' then
        WSql := WSql + ' AND TB_PRODUTO.COD_MARCA = ' + Trim(FNotaSaidaParam.FmMarca1.MeMarca.Text);
      if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
      if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' then
        WSql := WSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);
      if Trim(FNotaSaidaParam.MeClasse24.Text) <> '' then
        WSql := WSql + 'and tb_classe.num_classe = ' + Trim(FNotaSaidaParam.MeClasse24.Text);
      if (Trim(FNotaSaidaParam.MeSubClasse24.Text) <> '') then
        WSql := WSql + 'and tb_classe.num_subclasse = ' + Trim(FNotaSaidaParam.MeSubClasse24.Text);

      if (Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text) <> '') then
        WSql := WSql + 'and tb_cadastro.cod_regiao = ' + Trim(FNotaSaidaParam.FmRegiao2.MeRegiao.Text);
      if (Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text) <> '') then
        WSql := WSql + 'and tb_cadastro.cod_cidade = ' + Trim(FNotaSaidaParam.FmCidade1.MeCidade.Text);

      WSql := WSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_nota_item.COD_LOTE_TIPO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
      WSql := WSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,' + CHR(39) + 'MM' + CHR(39) + ')),to_char(Tb_Nota_Cab.DT_EMISSAO,'+ CHR(39) + 'Month' + CHR(39) +'),Tb_nota_item.VAL_CUSTO,tb_cadastro.cod_regiao, TB_REGIAO.DESC_REGIAO ';
      WSql := WSql + ') GROUP BY STIPO,COD_PRODUTO,COD_LOTE_TIPO,NUM_EMBALAGEM,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES,DESC_MES,VAL_CUSTO,COD_REGIAO,DESC_REGIAO ';
      WSql := WSql + ' ORDER BY COD_REGIAO,DT_MES,COD_VENDEDOR,NOMECADASTRO,STIPO ';
      QRResumoCliente.Sql.Add(wSql);

      QRResumoCliente.Open;

      if FRResumoCliente = nil then
        FRResumoCliente := TFRResumoCliente.Create(Application);

      FRResumoCliente.QRLTitulo.Caption := 'Resumo Operação por Cliente de ' + FNotaSaidaParam.ME23DataI.Text + ' até ' + FNotaSaidaParam.ME23DataF.Text;
      FRResumoCliente.QRLFilial.Caption := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial24.EdFilial.Text);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRResumoCliente.QRPrimario.Preview
      else
        FRResumoCliente.QRPrimario.Print;
      QRResumoCliente.Close;
      //Mantem a tela de parametros do relatório aberta para a empresa Aristides
    if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
      VResumoProdutosPorCliente1Click(Self);
    end;

    //Mantem a tela de parametros do relatório aberta para a empresa Aristides
{    if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
      VResumoProdutosPorCliente1Click(Self);}

end;

procedure TFNotaSaidaCad.XFuturaEmprstimoConsignaoDepsitoPNota1Click(
  Sender: TObject);
var
  wNomeRelatorio, wSql: string;
begin
  inherited;
  if FNotaEntradaParam = nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);       
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text), 'VENDA');
      QRFutura_Cliente.Close;
      QRFutura_Cliente.Sql.Clear;
      wSql := 'SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,';
      wSql := wSql + 'Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,';
      wSql := wSql + 'Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,';
      wSql := wSql + 'TB_LOTE_TIPO.DESC_LOTE,Tb_nota_cab.DT_EMISSAO,Tb_nota_item.COD_LOTE_TIPO,Tb_nota_cab.VAL_FUNRURAL,';
      wSql := wSql + 'Tb_nota_item.VAL_UNITARIO as VAL_UNITARIO, ';
      // PARA VALOR DO DESCONTO FICAR UNITARIO - CESAR 09/03/2021
      wSql := wSql + 'PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) / Tb_nota_aux.QT_NOTA_ITEM AS VAL_DESCONTO, ';
      wSql := wSql + 'Tb_vendedor.NOME as NOME_VENDEDOR,TB_NOTA_ITEM.VAL_ICMS_SUBST ';
      wSql := wSql + 'FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_NOTA_AUX,TB_VENDEDOR,TB_PRODUTO,TB_LOTE_TIPO,TB_CLASSE, TB_CADASTRO ';
      wSql := wSql + 'WHERE TB_LOTE_TIPO.COD_LOTE_TIPO = TB_NOTA_ITEM.COD_LOTE_TIPO AND ';
      wSql := wSql + 'Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ';
      wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
      wSql := wSql + 'Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO AND ';
      wSql := wSql + 'Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) AND ';
      wSql := wSql + 'QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ';
      wSql := wSql + 'TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE AND ';
      wSql := wSql + 'Tb_nota_cab.IND_SITUACAO = ' + QUOTEDSTR('2');
      wSql := wSql + ' AND TB_CADASTRO.COD_CADASTRO = DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AND ';
      case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
        0:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'COM_FUT' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Compra Futura';
          end;
        1:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'VEN_FUT' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Venda Futura';
          end;
        2:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_FOR' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
          end;
        3:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_CLI' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
          end;
        4:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_FOR' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
          end;
        5:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_CLI' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
          end;
        6:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_EMP' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
          end;
        7:
          begin
            wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_OUT' + CHR(39);
            wNomeRelatorio := 'Rel. Notas de Deposito em Outras Empresas';
          end;
      else
        raise Exception.Create('Nenhum tipo de Futura selecionado!');
      end;
      if Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text);
      if Trim(FNotaEntradaParam.FmFornecedor3.MeCadastro.Text) <> '' then
        wSql := wSql + ' And TB_PRODUTO.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmFornecedor3.MeCadastro.Text);
      if Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text);
      if Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text);
      if Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text);
      if Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
        wSql := wSql + ' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text);
      if Trim(FNotaEntradaParam.ME2DataI.Text) <> '' then
        wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO >= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39);
      if Trim(FNotaEntradaParam.ME2DataF.Text) <> '' then
        wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO <= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39);
      if Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) <> '' then
        wSql := wSql + ' And TB_CLASSE.NUM_CLASSE = ' + Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text);
      if Trim(FNotaEntradaParam.ME2SubClasse.Text) <> '' then
        wSql := wSql + ' And TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FNotaEntradaParam.ME2SubClasse.Text);
      if (Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) <> '') then
        wSql := wSql + ' AND TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text);
      //       ') OR (TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) + '))'; vilson pediu para tirar 01/10/2009
      if FNotaEntradaParam.Rg2Ordem.ItemIndex = 0 then
      begin
        if FNotaEntradaParam.Rg2QuebraVendedor.ItemIndex = 0 then
          wSql := wSql + ' ORDER BY Tb_vendedor.NOME, DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_nota_cab.NUM_NOTA '
        else
          wSql := wSql + ' ORDER BY DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_nota_cab.NUM_NOTA ';
      end
      else
      begin
        if FNotaEntradaParam.Rg2QuebraVendedor.ItemIndex = 0 then
          wSql := wSql + ' ORDER BY Tb_vendedor.NOME, TB_CADASTRO.NOME, Tb_nota_cab.NUM_NOTA '
        else
          wSql := wSql + ' ORDER BY TB_CADASTRO.NOME, Tb_nota_cab.NUM_NOTA ';
      end;
      QRFutura_Cliente.SQL.Add(wSql);
      QRFutura_Cliente.Open;
      if FRNota_VendaFutura = nil then
        FRNota_VendaFutura := TFRNota_VendaFutura.Create(Application);
      if FNotaEntradaParam.Rg2QuebraVendedor.ItemIndex = 0 then
      begin
        FRNota_VendaFutura.QRGroup1.Enabled := True;
        FRNota_VendaFutura.QRBand6.Enabled := True;
      end
      else
      begin
        FRNota_VendaFutura.QRGroup1.Enabled := False;
        FRNota_VendaFutura.QRBand6.Enabled := False;
      end;
      FRNota_VendaFutura.QRLTitulo.Caption := wNomeRelatorio;
      FRNota_VendaFutura.QRLFilial.Caption := 'Filial:' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) + ' - ' + FNotaEntradaParam.FmFilial3.EdFilial.Text;
      FRNota_VendaFutura.QRLVendedor.Caption := 'Vendedor:' + Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text) + ' De ' + FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
      FRNota_VendaFutura.QRLClasse.Caption := 'Classe:' + Trim(FNotaEntradaParam.FmClasse3.EdClasse.Text) + ' SubClasse: ' + FNotaEntradaParam.Ed2SubClasse.Text;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'KREUZ' Then // para colocar decimais no relatorio
       Begin
         FRNota_VendaFutura.QRDBText4.Mask := '#,##0.00';
         //FRNota_VendaFutura.QRDBText5.Mask := '#,##0.00';
         FRNota_VendaFutura.QRExpr1.Mask := '#,##0.00';
         FRNota_VendaFutura.QRExpr3.Mask := '#,##0.00';
         FRNota_VendaFutura.QRExpr8.Mask := '#,##0.00';
         FRNota_VendaFutura.QRExpr4.Mask := '#,##0.00';
       End;

      if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
        FRNota_VendaFutura.QRPrimario.Preview
      else
        FRNota_VendaFutura.QRPrimario.Print;
      QRFutura_Cliente.Close;
    end;
end;

procedure TFNotaSaidaCad.ZRelatrioHistricoCliente1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[24].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text), 'VENDA');
      QRVendaHistorico.Close;
      QRReceberHistorico.Close;
      QRReceber_Titulos.Close;
      QRVendaHistorico.Sql.Clear;
      QRVendaHistorico.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
      QRVendaHistorico.Sql.Add('Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME,');
      QRVendaHistorico.Sql.Add('sum(Tb_nota_item.VAL_TOTAL - PEGA_DESCONTO_ITEM(TB_NOTA_ITEM.COD_NOTA_ITEM) + Tb_nota_item.VAL_DESPESAS + TB_NOTA_ITEM.VAL_ICMS_SUBST) as val_total ');
      QRVendaHistorico.Sql.Add(' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE ');
      QRVendaHistorico.Sql.Add(' (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ');
      QRVendaHistorico.Sql.Add(' AND (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
      if Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text) <> '' then
        QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text));
      if Trim(FNotaSaidaParam.ME24Cadastro.Text) <> '' then
        QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
      if Trim(FNotaSaidaParam.ME24DataI.Text) <> '' then
        QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
      if Trim(FNotaSaidaParam.ME24DataF.Text) <> '' then
        QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));
      QRVendaHistorico.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
      QRVendaHistorico.Sql.Add(' Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME ORDER BY NOME,COD_CADASTRO,DT_EMISSAO ');
      QRReceber_Titulos.Sql.Clear;
      QRReceber_Titulos.Sql.Add('SELECT Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,');
      QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.VAL_TITULO,');
      QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,Tb_conta_receber_cab.COD_CADASTRO,Tb_cadastro.NOME FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO ');
      QRReceber_Titulos.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
      QRReceber_Titulos.Sql.Add(' AND (Tb_conta_receber_cab.COD_NOTA_CAB IS NULL) ');
      if Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text) <> '' then
        QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text));
      if Trim(FNotaSaidaParam.ME24Cadastro.Text) <> '' then
        QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
      if Trim(FNotaSaidaParam.ME24DataI.Text) <> '' then
        QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
      if Trim(FNotaSaidaParam.ME24DataF.Text) <> '' then
        QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));

      QRVendaHistorico.Open;
      QRReceberHistorico.Open;
      QRReceber_Titulos.Open;
      if FRVendaHistorico = nil then
        FRVendaHistorico := TFRVendaHistorico.Create(Application);
      if FRTitulos = nil then
        FRTitulos := TFRTitulos.Create(Application);
      FRVendaHistorico.QRLTitulo.Caption := 'Historico de Vendas Por Cliente de ' + FNotaSaidaParam.ME24DataI.Text + ' até ' + FNotaSaidaParam.ME24DataF.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendaHistorico.QRCompositeReport1.Preview
          //      FRVendaHistorico.QRPrimario.Preview
      else
        FRVendaHistorico.QRCompositeReport1.Print;
      //      FRVendaHistorico.QRPrimario.Print;
      QRVendaHistorico.Close;
      QRReceberHistorico.Close;
    end;
end;
{
procedure TFNotaSaidaCad.BloqueiaVenda(Sender: TObject);
var
  //wAux, wData_Cadastro, wCodTabelaPreco, wDataVencimentoTabelaPreco: string;
  wDtvencto, wLibera : string;
begin
  inherited;
//  if (DMParamSistema.CodEmpresa = 'JASOL') then
//  begin
    wLibera   := DMOracle.FastSelect('IND_LIBERA_VENDA','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(DmnotaSaida.QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    if wDtvencto <> '' then
      if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) then
    if wLibera = 'NAO' then
      //ShowMessage('Cliente Com Titulos Em Aberto. Não Será Permitido Venda a Prazo. - Checar Venda com Gerência.');
      raise exception.Create('Cliente Com Titulos Em Aberto. Não Será Permitido Venda a Prazo. - Checar Venda com Gerência.');
  //end;
end;
}
procedure TFNotaSaidaCad.DBEClienteExit(Sender: TObject);
var
  wAux, wData_Cadastro, wCodTabelaPreco, wDataVencimentoTabelaPreco: string;
  wDtvencto, wLibera, wObs : string; //agroferragens
  wVctoAlvaraSanitarioStr: string;
  wVctoAlvaraSanitario, wDataAtual: TDateTime;
  wValordesconto: Double;
begin
  inherited;

  if DMParamSistema.CodEmpresa = 'POLLYANA' then
  begin
    wObs := DMOracle.FastSelect('DESC_OBS','TB_CADASTRO','COD_CADASTRO = ' + DBECliente.Text);
    if wObs <> '' then
    begin
      MessageDlg(wObs, mtInformation, [mbOK], 0);
    end;
  end;

  if DSPrimario.State in [DsEdit, DsInsert] then
  begin
    If DMParamSistema.QParamSistemaNUM_DIAS_RENOVA_CADASTRO.Value <> 0 Then
     Begin
       wData_Cadastro := DMOracle.BuscaNome('SELECT DT_ALTERACAO FROM TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
       If wData_Cadastro = '' Then
          Raise exception.Create('Realizar atualização de cadastro');
       If StrToDate(wData_Cadastro) < DmOracle.DataServ - DMParamSistema.QParamSistemaNUM_DIAS_RENOVA_CADASTRO.Value Then
          Raise exception.Create('Realizar atualização de cadastro');
     End;
    if DMParamSistema.CodEmpresa <> 'KREUZ' then
     Begin
       if FPedidoCons = nil then
         FPedidoCons := TFPedidoCons.Create(Application);
       FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
       if DMParamSistema.QparamSistemaCod_Empresa.Value = 'GRASEL' then
         FPedidoCons.MEDataI.Text := '01/01/2008'
       else
         FPedidoCons.MEDataI.Text := DateToStr(Date - 180);
       FPedidoCons.BtProcurarClick(Self);
       if DMPedido.QPedidoConsCod_Pedido_Cab.Value > 0 then
       begin
         BtImpPedClick(Self);
         FPedidoCons.METexto.Enabled := True;
       end;
     End;

    MsgAutoriza; //mostra na tela as pessoas autorizadas a comprar
    DMNotaSaida.VerificaNotaDigitada('S');
    //DBEdit11.SetFocus;
    if (not (DmNotaSaida.QNotaSaidaCOD_CADASTRO.IsNull)) then
    begin
      wAux := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB ',
        ' IND_SITUACAO<>' + Chr(39) + 'BAIXA TOTAL' + Chr(39) +
        ' AND COD_CADASTRO = ' + Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text));
      if ((wAux <> '') and (DMParamSistema.CodEmpresa <> 'CEREAIS') and // Adicionado NFCE Cod. Suporte = 8501 02/01/2024 Pedro e Alex
         (DMParamSistema.CodEmpresa <> 'FERRAGENS') and ( (DMParamSistema.CodEmpresa <> 'PIXIXE_FAB') or (DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text <> '53') ) and
         (pos('NFC',DMParamSistema.CodEmpresa) = 0) ) then
         if MessageDLG('Cliente Possui Titulos R$ ' + wAux, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
           if FContasReceberCons = nil then
             FContasReceberCons := TFContasReceberCons.Create(Application);
           FContasReceberCons.MecodCliente.Text := DmNotaSaida.QNotaSaidaCod_Cadastro.Text;
           FContasReceberCons.BtProcurarClick(Self);
           FContasReceberCons.ShowModal;
         end;
      if (DMParamSistema.CodEmpresa = 'JASOL') then
        DMNotaSaida.BloqueiaVenda(Sender);
      if (DMParamSistema.CodEmpresa = 'FERRAGENS') then
      begin  //Claudionor, Aline(Agroferragens) solicitaram aviso de cliente com débito no início da nota.O bloqueio já é feito ao confirmar a nota. Junior 09/07/2019
        wLibera   := DMOracle.FastSelect('IND_LIBERA_VENDA','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
        wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(DmnotaSaida.QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
        if wDtvencto <> '' then
          if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) then
        if wLibera = 'NAO' then
          ShowMessage('Cliente Com Titulos Em Aberto. Não Será Permitido Venda a Prazo. - Checar Venda com Gerência.');
      end;
{João da Calce solicitou não deixar digitar nota quando o cliente tiver parcelas em aberto. Alex 04/01/2024
      if (DMParamSistema.CodEmpresa = 'JASOL') then
      begin
        wLibera   := DMOracle.FastSelect('IND_LIBERA_VENDA','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
        wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(DmnotaSaida.QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
        if wDtvencto <> '' then
          if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) then
        if wLibera = 'NAO' then
          //ShowMessage('Cliente Com Titulos Em Aberto. Não Será Permitido Venda a Prazo. - Checar Venda com Gerência.');
          raise exception.Create('Cliente Com Titulos Em Aberto. Não Será Permitido Venda a Prazo. - Checar Venda com Gerência.');
      end;
    }

      //JUNIOR da Deion solicita que traga a operação do cadastro do cliente - 24/06/2020.. Adicionado Kreuz - Junior 27/09/2023. suporte{7801}
      if (DMParamSistema.CodEmpresa = 'DEION') or (DMParamSistema.CodEmpresa = 'KREUZ') then
      begin
        if not(DMCadastro.QCadastroCOD_OPERACAO_CC.isNull) then
          DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value := DMCadastro.QCadastroCOD_OPERACAO_CC.Value;
      end;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OTICA' then
      begin
        if FReceituarioOtico = Nil then
          FReceituarioOtico := TFReceituarioOtico.Create(Application);
        FReceituarioOtico.ShowModal;
      end;
    end;
    BibVenda.PersonalizaNota(DMParamSistema.QParamSistemaCOD_EMPRESA.Value,Self);
    PCNota.ActivePage := TsCabecalho;
    if DMParamSistema.CodEmpresa = 'RACOESIGUA' then //Clovis informa o numero do controle do bloco do vendedor para os PE.
      DBEdit10.SetFocus
    else
      DBPSerie.SetFocus;
    //Gian 27/11/2017, solicitado por Marlom, mostrar mensagem quando o cadastro tiver uma tabela de preço vencida
    wDataVencimentoTabelaPreco := DMOracle.FastSelect('COD_TABELA_PRECO_CAB','TB_CADASTRO','COD_CADASTRO=' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    if wDataVencimentoTabelaPreco <> '' then
    begin
      wDataVencimentoTabelaPreco := DMOracle.FastSelect('DT_VENCIMENTO_TABELA_PRECO','TB_CADASTRO','COD_CADASTRO=' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
      if (wDataVencimentoTabelaPreco <> '') and (StrToDate(wDataVencimentoTabelaPreco) < Now()) then
        ShowMessage('Cadastro com tabela de preço vencida!');
    end;
  end;
  // Notificar quando a licença sanitária do cliente está vencida ou prestes. Utilizado por GGirardi COD_SUPORTE: 9962. Jefferson
  if Trim(DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) <> '' then
  begin
    wVctoAlvaraSanitarioStr := DMOracle.FastSelect('DT_VCTO_ALVARA_SANITARIO', 'TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    if wVctoAlvaraSanitarioStr <> '' then
    begin
      try
        wVctoAlvaraSanitario := StrToDate(wVctoAlvaraSanitarioStr);
        wDataAtual := Date;

        if wVctoAlvaraSanitario < wDataAtual then
        begin
          MessageDlg('A licença sanitária do cliente está vencida!' + sLineBreak +
            'Data de vencimento: ' + FormatDateTime('dd/mm/yyyy', wVctoAlvaraSanitario),
            mtWarning, [mbOK], 0);
        end
        else if wVctoAlvaraSanitario <= (wDataAtual + 30) then
        begin
          MessageDlg('A licença sanitária do cliente está prestes a vencer' + sLineBreak +
            'Data de vencimento: ' + FormatDateTime('dd/mm/yyyy', wVctoAlvaraSanitario),
            mtWarning, [mbOK], 0);
        end;
      except
        on E: EConvertError do
          MessageDlg('Data de vencimento da licença sanitária inválida.', mtError, [mbOK], 0);
      end;
    end;
  end;
{Jr Multipeças passou para o regime normal e precisa quando o cliente for consumidor final que a operação seja código 49. Alex 10/01/2025}
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') and
     ( (DMParamSistema.QParamSistemaDESC_EMPRESA.Value <> 'LZ MULTIPECAS') and (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value = 'SUPERVISOR') ) then
  begin
    if (DMCadastro.QCadastroIND_CONSUMIDOR_FINAL.Value = 'S') then
      DBECodOperacao.Text := '49';
  end;
{Criado este bloco para trazer o valor das notas de devoluções como desconto, quando os titulos da nota original já estão baixados. Alex 08/04/2026}
  if (DMParamSistema.QParamSistemaIND_BAIXA_PARCELA.Value = 'S') then
  begin
    with DMDevolucaoTroca do
    begin
      QContasPagarCabCons.Close;
      QContasPagarCabCons.SetVariable('COD_CADASTRO',Trim(DBECliente.Text));
      QContasPagarCabCons.Open;
      if QContasPagarCabCons.RecordCount > 0 then
      begin
        QContasPagarCabCons.First;
        wValordesconto := 0;
        while not QContasPagarCabCons.Eof do
        begin
          wValordesconto := wValordesconto + QContasPagarCabConsVAL_TITULO.Value;
          QContasPagarCabCons.Next;
        end;
        DBEValDesconto.Text := FloatToStr(wValordesconto);
      end;
    end;

  end;
end;

procedure TFNotaSaidaCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //Marticar. Maristela informou que precisa adicionar o sinal de + nas observacoes da nota e do item,
  //mas ao adicionar o sinal de mais o sistema jogava o foco na tela dos itens. Junior - 25/02/2014
  if ((DBEdit27.Focused) or (DBEdit28.Focused) or (DBMemo1.Focused) or (DBMInfAdicional.Focused)) then
    Exit;
  if Key = Chr(43) then
  begin
    ActiveControl := nil;//incluído para acionar o onexit do campo que estiver caso seja digitado '+' - Cleber 09/01/2020
    if (DMParamSistema.QparamSistemaCod_Empresa.Value = 'INJEPAR') then
    begin
      DMNotaSaida.QItemNF.Append;
      Key := #0;
    end
    else
    begin
      DbNavigator1.BtnClick(NbInsert);
      Key := #0;
    end;
    if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
      DBENumFabricante.SetFocus
    else
      DBECodProduto.SetFocus;
  end;

////////////////////////////////////////////////////////////////////////////////
// Tirei porque essa porcaria apaga um produto quando vai digitar qualquer    //
// coisa com hífem em qualquer lugar da tela.                                 //
//                                                                            //
//                                                                            //
//  if (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'DINIZ') and         //
//    (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'DEBONA') and         //
//    (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'INJEPAR') and        //
//    (DSItemNF.State = DsBrowse) then                                        //
//  begin                                                                     //
//    if Key = Chr(45) then                                                   //
//    begin                                                                   //
//      DbNavigator1.BtnClick(NbDelete);                                      //
//      DBECodProduto.SetFocus;                                               //
//      Key := #0;                                                            //
//    end;                                                                    //
//  end;                                                                      //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

end;

procedure TFNotaSaidaCad.QuantVendidaporItensporVendedor1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[25].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) and ((DMParamSistema.CodEmpresa <> 'FERRAGMED') AND (DMParamSistema.CodEmpresa <> 'DONABENTA')) then
  begin
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text), 'VENDA');
      QRVendasPorVendedor.close;
      QRVendasPorVendedor.SetVariable('DATA_I', FNotaSaidaParam.ME25DataI.Text);
      QRVendasPorVendedor.SetVariable('DATA_F', FNotaSaidaParam.ME25DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text) = '' then
        QRVendasPorVendedor.SetVariable('FILIAL', Null)
      else
        QRVendasPorVendedor.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmVendedor26.MeVendedor.Text) = '' then
        QRVendasPorVendedor.SetVariable('VENDEDOR', Null)
      else
        QRVendasPorVendedor.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor26.MeVendedor.Text));

      if Trim(FNotaSaidaParam.FmVendedorPreposto26.MeVendedor.Text) = '' then
        QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto26.MeVendedor.Text));

      if Trim(FNotaSaidaParam.ME25Operacao.Text) <> '' then
        QRVendasPorVendedor.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME25Operacao.Text))+')')
      else
        QRVendasPorVendedor.SetVariable('COD_OPERACAO', '1=1');


      QRVendasPorVendedor.Open;
      if FRVendasPorVendedor = nil then
        FRVendasPorVendedor := TFRVendasPorVendedor.Create(Application);
      FRVendasPorVendedor.QRLTitulo.Caption := 'Quantidade Vendida por Vendedor ' + FNotaSaidaParam.ME25DataI.Text + ' até ' + FNotaSaidaParam.ME25DataF.Text;
      FRVendasPorVendedor.QRLFilial.Caption := 'Filial:' + Trim(FNotaSaidaParam.FmFilial26.EdFilial.Text);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendasPorVendedor.QRPrimario.Preview
      else
        FRVendasPorVendedor.QRPrimario.Print;
      QRVendasPorVendedor.Close;
    end
end;

procedure TFNotaSaidaCad.Vendasporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[26].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.ME26Filial.Text), 'VENDA');
      QRVendasVndRegiao.close;
      QRVendasVndRegiao.SetVariable('DATA_I', FNotaSaidaParam.ME26DataI.Text);
      QRVendasVndRegiao.SetVariable('DATA_F', FNotaSaidaParam.ME26DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.ME26Filial.Text) = '' then
        QRVendasVndRegiao.SetVariable('FILIAL', Null)
      else
        QRVendasVndRegiao.SetVariable('FILIAL', FNotaSaidaParam.ME26Filial.Text);
      if Trim(FNotaSaidaParam.FmVendedor27.MeVendedor.Text) = '' then
        QRVendasVndRegiao.SetVariable('VENDEDOR', Null)
      else
        QRVendasVndRegiao.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor27.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto27.MeVendedor.Text) = '' then
        QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto27.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmRegiao27.MeRegiao.Text) = '' then
        QRVendasVndRegiao.SetVariable('REGIAO', Null)
      else
        QRVendasVndRegiao.SetVariable('REGIAO', Trim(FNotaSaidaParam.FmRegiao27.MeRegiao.Text));
      if Trim(FNotaSaidaParam.FmProduto27.MeProduto.Text) = '' then
        QRVendasVndRegiao.SetVariable('COD_PRODUTO', Null)
      else
        QRVendasVndRegiao.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto27.MeProduto.Text));
      QRVendasVndRegiao.Open;
      if FRVendasVndRegiao = nil then
        FRVendasVndRegiao := TFRVendasVndRegiao.Create(Application);
      FRVendasVndRegiao.QRLTitulo.Caption := 'Vendas por Vendedor e Região ' + FNotaSaidaParam.ME26DataI.Text + ' até ' + FNotaSaidaParam.ME26DataF.Text;
      FRVendasVndRegiao.QRLFilial.Caption := 'Filial:' + FNotaSaidaParam.Ed26Filial.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendasVndRegiao.QRPrimario.Preview
      else
        FRVendasVndRegiao.QRPrimario.Print;
      QRVendasVndRegiao.Close;
    end
end;

procedure TFNotaSaidaCad.Itensvendidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[27].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text), 'VENDA');
      QRVendProdPeriodo.Close;
      QRVendProdPeriodo.SetVariable('DATA_I', FNotaSaidaParam.ME27DataI.Text);
      QRVendProdPeriodo.SetVariable('DATA_F', FNotaSaidaParam.ME27DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text) = '' then
        QRVendProdPeriodo.SetVariable('FILIAL', Null)
      else
        QRVendProdPeriodo.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmClasseI28.MeClasse.Text) = '' then
      begin
        MessageDlg('É necessario informar CLASSE!', mtInformation, [mbOK], 0);
        Exit;
      end
      else
        QRVendProdPeriodo.SetVariable('CLASSE_I', Trim(FNotaSaidaParam.FmClasseI28.MeClasse.Text));

      if Trim(FNotaSaidaParam.FmClasseF28.MeClasse.Text) = '' then
      begin
        MessageDlg('É necessario informar CLASSE!', mtInformation, [mbOK], 0);
        Exit;
      end
      else
        QRVendProdPeriodo.SetVariable('CLASSE_F', Trim(FNotaSaidaParam.FmClasseF28.MeClasse.Text));

      if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
      begin
        QRVendProdPeriodo.SetVariable('IND_COMPRAS', Null);
        QRVendProdPeriodo.SetVariable('IND_VENDAS', 'V');
      end
      else
      begin
        QRVendProdPeriodo.SetVariable('IND_VENDAS', Null);
        QRVendProdPeriodo.SetVariable('IND_COMPRAS', 'C');
      end;
      if Trim(FNotaSaidaParam.Me28Produto.Text) = '' then
        QRVendProdPeriodo.SetVariable('PRODUTO', '1 = 1')
      else
        QRVendProdPeriodo.SetVariable('PRODUTO', 'TB_NOTA_ITEM.COD_PRODUTO In (' + Trim(FNotaSaidaParam.Me28Produto.Text) + ')');
      if Trim(FNotaSaidaParam.FmVendedor28.MeVendedor.Text) = '' then
        QRVendProdPeriodo.SetVariable('VENDEDOR', Null)
      else
        QRVendProdPeriodo.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor28.MeVendedor.Text));
      QRVendProdPeriodo.Open;

      if FRVendProdPeriodo = nil then
        FRVendProdPeriodo := TFRVendProdPeriodo.Create(Application);

      // Titulo do relatório
      if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
        FRVendProdPeriodo.QRLTitulo.Caption := 'Venda(s) de Produto(s) no periodo ' + FNotaSaidaParam.ME27DataI.Text + ' até ' + FNotaSaidaParam.ME27DataF.Text
      else
        FRVendProdPeriodo.QRLTitulo.Caption := 'Compra(s) de Produto(s) no periodo ' + FNotaSaidaParam.ME27DataI.Text + ' até ' + FNotaSaidaParam.ME27DataF.Text;

      FRVendProdPeriodo.QRLFilial.Caption := 'Filial:' + Trim(FNotaSaidaParam.FmFilial28.EdFilial.Text);
      FRVendProdPeriodo.QRexpr4.Width := 0;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendProdPeriodo.QRPrimario.Preview
      else
        FRVendProdPeriodo.QRPrimario.Print;
      QRVendProdPeriodo.Close;
    end
end;

procedure TFNotaSaidaCad.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) and (DMNotaSaida.QNotaSaidaDt_Emissao.Value < Date) then
    ShowMessage('Data de Emissão Menor que Data Atual!');
end;

procedure TFNotaSaidaCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) and (DMNotaSaida.QNotaSaidaDt_Recebimento.Value < Date) then
    ShowMessage('Data de Saída Menor que Data Atual!');
end;

procedure TFNotaSaidaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(15);
end;

procedure TFNotaSaidaCad.BtImpItemNotaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  FNotaSaidaCons.MeTexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  if FNotaSaidaCons.ShowModal = MrOk then
    Proc_TrazItens(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
end;

procedure TFNotaSaidaCad.VendasPVendedorClasseFornecedor1Click(
  Sender: TObject);
var
  wNada: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[29].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.ME29Filial.Text), 'VENDA');
      QRVendaVendClasse.Close;
      QRVendaVendClasse.SetVariable('DATA_I', FNotaSaidaParam.Me29DataI.Text);
      QRVendaVendClasse.SetVariable('DATA_F', FNotaSaidaParam.Me29DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.ME29Filial.Text) = '' then
        QRVendaVendClasse.SetVariable('FILIAL', Null)
      else
        QRVendaVendClasse.SetVariable('FILIAL', FNotaSaidaParam.ME29Filial.Text);
      if Trim(FNotaSaidaParam.ME29Vendedor.Text) = '' then
        QRVendaVendClasse.SetVariable('VENDEDOR', Null)
      else
        QRVendaVendClasse.SetVariable('VENDEDOR', FNotaSaidaParam.ME29Vendedor.Text);
      if Trim(FNotaSaidaParam.ME29VendedorPreposto.Text) = '' then
        QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO', FNotaSaidaParam.ME29VendedorPreposto.Text);
      if Trim(FNotaSaidaParam.ME29ClasseI.Text) = '' then
        QRVendaVendClasse.SetVariable('CLASSEI', Null)
      else
        QRVendaVendClasse.SetVariable('CLASSEI', FNotaSaidaParam.ME29ClasseI.Text);
      if Trim(FNotaSaidaParam.ME29SubClasse.Text) = '' then
        QRVendaVendClasse.SetVariable('SUBCLASSE', Null)
      else
        QRVendaVendClasse.SetVariable('SUBCLASSE', FNotaSaidaParam.ME29SubClasse.Text);
      if Trim(FNotaSaidaParam.ME29Produto.Text) = '' then
        QRVendaVendClasse.SetVariable('PRODUTO', Null)
      else
        QRVendaVendClasse.SetVariable('PRODUTO', FNotaSaidaParam.ME29Produto.Text);
      if Trim(FNotaSaidaParam.Me29Operacao.Text) = '' then
        wNada := '(TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39) + ') Or (TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39) + ')'
      else
        wNada := 'TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.Me29Operacao.Text);
      QRVendaVendClasse.SetVariable('MONTADO_NA_ROTINA', wNada);
      if FNotaSaidaParam.Rg29Quebra.ItemIndex = 0 then
        QRVendaVendClasse.SetVariable('IND_QUEBRA', 'S')
      else
        QRVendaVendClasse.SetVariable('IND_QUEBRA', 'N');
      QRVendaVendClasse.Open;
      if FrVendasVendClasse = nil then
        FrVendasVendClasse := TFrVendasVendClasse.Create(Application);
      if FNotaSaidaParam.Rg29Quebra.ItemIndex = 0 then
      begin
        FrVendasVendClasse.QRGroup3.Enabled := True;
        FrVendasVendClasse.QRBand5.Enabled := True;
      end
      else
      begin
        FrVendasVendClasse.QRGroup3.Enabled := False;
        FrVendasVendClasse.QRBand5.Enabled := False;
      end;
      FrVendasVendClasse.QRLTitulo.Caption := 'Vendas por Fornecedor/Classe e Vendedor de ' + FNotaSaidaParam.ME29DataI.Text + ' até ' + FNotaSaidaParam.ME29DataF.Text;
      FrVendasVendClasse.QRLFilial.Caption := 'Filial:' + FNotaSaidaParam.Ed29Filial.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FrVendasVendClasse.QRPrimario.Preview
      else
        FrVendasVendClasse.QRPrimario.Print;
      QRVendaVendClasse.Close;
    end;

end;

procedure TFNotaSaidaCad.DBEdit62Exit(Sender: TObject);
var
  wPercICM: Real;
begin
  inherited;
  if Trim(DMNotaSaida.QItemNFCod_Tributacao.Text) <> '' then
  begin
    wPercICM := StrToFloat(DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO', 'COD_TRIBUTACAO = ' + FloatToStr(DMNotaSaida.QItemNFCod_Tributacao.Value)));
    DMNotaSaida.QItemNFVal_ICM.Value := DMNotaSaida.QItemNFVal_ICM_Base.Value * wPercICM / 100;
  end;
end;

procedure TFNotaSaidaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMNotaSaida do
  begin
    QNotaSaida.Close;
    QItemNF.Close;
    QNotaReferenciada.Close;
    QSomaItemNota.Close;
    QContaReceber.Close;
    QContaReceberMov.Close;
    QEstoqueBaixa.Close;
    QCaixa.Close;
    QBaixaAux.Close;
    QNotaAux.Close;
    QNotaAuxItNf.Close;
    QSomaPagamentos.Close;
    QValeProdutoTroca.Close;
    QContaPix.Close;
  end;
  DMEstado.QREstado.Close;
  DMObrigacaoICMS.QObrigacaoICMSCons.Close;
  Action := CaFree;
  FNotaSaidaCad := nil;
end;

procedure TFNotaSaidaCad.Clientescomcompranoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[31].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.MECodFilial31.Text), 'VENDA');
    if (Trim(FNotaSaidaParam.MEDataI31.Text) = '') or (Trim(FNotaSaidaParam.MEDataF31.Text) = '') then
      raise exception.Create('É necessario informar periodo para relatório.');
    with DMRelatorio_Venda do
    begin
      QRClienteComCompra.Close;
      if Trim(FNotaSaidaParam.MECodFilial31.Text) = '' then
        QRClienteComCompra.SetVariable('COD_FILIAL', Null)
      else
        QRClienteComCompra.SetVariable('COD_FILIAL', Trim(FNotaSaidaParam.MECodFilial31.Text));

      if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
        QRClienteComCompra.SetVariable('COD_VENDEDOR', Null)
      else
        QRClienteComCompra.SetVariable('COD_VENDEDOR', Trim(FNotaSaidaParam.MECodVendedor31.Text));

      if Trim(FNotaSaidaParam.ME31TipoCadastro.Text) = '' then
        QRClienteComCompra.SetVariable('TIPO_CADASTRO', Null)
      else
        QRClienteComCompra.SetVariable('TIPO_CADASTRO', FNotaSaidaParam.ME31TipoCadastro.Text);

      if Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text) = '' then
        QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO', Null)
      else
        QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text));

      if Trim(FNotaSaidaParam.ME31Ramo.Text) = '' then
        QRClienteComCompra.SetVariable('RAMO', Null)
      else
        QRClienteComCompra.SetVariable('RAMO', Trim(FNotaSaidaParam.ME31Ramo.Text));

      QRClienteComCompra.SetVariable('DT_EMISSAO_I', FNotaSaidaParam.MEDataI31.Text);
      QRClienteComCompra.SetVariable('DT_EMISSAO_F', FNotaSaidaParam.MEDataF31.Text);

      if Trim(FNotaSaidaParam.MeCodClasse31.Text) = '' then
        QRClienteComCompra.SetVariable('COD_CLASSE', Null)
      else
        QRClienteComCompra.SetVariable('COD_CLASSE', Trim(FNotaSaidaParam.MeCodClasse31.Text));
      if Trim(FNotaSaidaParam.FmCidade31.MeCidade.Text) = '' then
        QRClienteComCompra.SetVariable('COD_CIDADE', Null)
      else
        QRClienteComCompra.SetVariable('COD_CIDADE', Trim(FNotaSaidaParam.FmCidade31.MeCidade.Text));

      if Trim(FNotaSaidaParam.FmProduto31.Meproduto.Text) = '' then
        QRClienteComCompra.SetVariable('COD_PRODUTO', Null)
      else
        QRClienteComCompra.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto31.Meproduto.Text));

      if Trim(FNotaSaidaParam.FmRegiao31.MeRegiao.Text) = '' then
         QRClienteComCompra.SetVariable('COD_REGIAO', Null)
      else
        QRClienteComCompra.SetVariable('COD_REGIAO', Trim(FNotaSaidaParam.FmRegiao31.MeRegiao.Text));


      QRClienteComCompra.Open;
      if FRClienteComCompra = nil then
        FRClienteComCompra := TFRClienteComCompra.Create(Application);
      FRClienteComCompra.QRLTitulo.Caption := 'CLIENTES COM COMPRA NO PERIODO DE : ' +
        FNotaSaidaParam.MEDataI31.Text + ' A ' +
        FNotaSaidaParam.MEDataF31.Text;
      if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
        FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: TODOS'
      else
        FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: ' + Trim(FNotaSaidaParam.MECodVendedor31.Text) + ' - ' +
          FNotaSaidaParam.EdVendedorNome31.Text;
      if Trim(FNotaSaidaParam.MECodClasse31.Text) = '' then
        FRClienteComCompra.QRLClasse.Caption := 'CLASSE: TODAS'
      else
        FRClienteComCompra.QRLClasse.Caption := ('CLASSE: ' + Trim(FNotaSaidaParam.EDDescricaoClasse31.Text));
      if Trim(FNotaSaidaParam.FmProduto31.MeProduto.Text) = '' then
        FRClienteComCompra.QRLProduto.Caption := 'PRODUTO: TODOS'
      else
        FRClienteComCompra.QRLProduto.Caption := ('PRODUTO: ' + Trim(FNotaSaidaParam.FmProduto31.MeProduto.Text) + ' - ' + Trim(FNotaSaidaParam.fmproduto31.EdProduto.Text));

      if Trim(FNotaSaidaParam.FmRegiao31.MeRegiao.Text) = '' then
        FRClienteComCompra.QRLRegiao.Caption := 'REGIAO: TODAS'
      else
        FRClienteComCompra.QRLRegiao.Caption := ('REGIAO: ' + Trim(FNotaSaidaParam.fmregiao31.Edregiao.Text));

      FRClienteComCompra.QRLTipoCadastro.Caption := 'Tipo Cadastro : ' + Trim(FNotaSaidaParam.Ed31TipoCadastro.Text);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRClienteComCompra.QRPrimario.Preview
      else
        FRClienteComCompra.QRPrimario.Print;
      QRClienteComCompra.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
  DbEdit27.Setfocus;
end;

procedure TFNotaSaidaCad.EtiquetaspItensdaNF1Click(Sender: TObject);
var
  wCont: integer;
  wLpt_Nota: string;
  wNrEtiquetas, wVolume: integer;
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'OSARE' Then
  Begin
   if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[32].TabVisible := True;
    if FNotaSaidaParam.ShowModal = mrOk then
    begin
      with DMRelatorio_Venda do
      begin
        QRClasseMaisVendida.Close;
        if Trim(FNotaSaidaParam.ME32DtInicial.text) = '' then
          raise Exception.Create('Período deve ser informado');
        if Trim(FNotaSaidaParam.ME32DtFinal.text) = '' then
          FNotaSaidaParam.ME32DtFinal.text := DateToStr(Date);

        QRClasseMaisVendida.setVariable('DT_INICIAL', Trim(FNotaSaidaParam.ME32DtInicial.Text));
        QRClasseMaisVendida.setVariable('DT_FINAL', Trim(FNotaSaidaParam.ME32DtFinal.Text));

        if Trim(FNotaSaidaParam.ME32Vendedor.Text) <> '' then
          QRClasseMaisVendida.setVariable('VENDEDOR', Trim(FNotaSaidaParam.ME32Vendedor.Text))
        else
          QRClasseMaisVendida.setVariable('VENDEDOR', NULL);

        If FNotaSaidaParam.RG32Agrupar.ItemIndex = 2 then
        Begin
          QRClasseMaisVendida.SQL[QRClasseMaisVendida.SQL.count - 1] := '';
          case FNotaSaidaParam.RG32Ordem.ItemIndex of
            0: QRClasseMaisVendida.SQL.Add('ORDER BY NUM_CLASSE,NUM_SUBCLASSE');
            1: QRClasseMaisVendida.SQL.Add('ORDER BY PERC_LUCRO DESC');
            2: QRClasseMaisVendida.SQL.Add('ORDER BY VAL_TOTAL_VENDA DESC');
          end;
        end
        else
        Begin
          QRClasseMaisVendida.SQL[QRClasseMaisVendida.SQL.count - 1] := '';
          case FNotaSaidaParam.RG32Ordem.ItemIndex of
            0: QRClasseMaisVendida.SQL.Add('ORDER BY NUM_CLASSE,NUM_SUBCLASSE');
          end;
        end;

        QRTotalFaturamento.Close;
        QRTotalFaturamento.SetVariable('DT_INICIAL',Trim(FNotaSaidaParam.ME32DtInicial.Text));
        QRTotalFaturamento.SetVariable('DT_FINAL', Trim(FNotaSaidaParam.ME32DtFinal.Text));
        QRTotalFaturamento.Open;

        QRClasseMaisVendida.Open;
        
        
        if FRClasseMaisVendida = nil then
          FRClasseMaisVendida := TFRClasseMaisVendida.Create(Application);
        if FNotaSaidaParam.RG32Agrupar.ItemIndex = 0 then
        Begin
          FRClasseMaisVendida.QRBand4.Enabled := True;
          FRClasseMaisVendida.QRGroup1.Enabled := True;
          FRClasseMaisVendida.QRBand6.Enabled := True;
        end
        else
        if FNotaSaidaParam.RG32Agrupar.ItemIndex = 1 then
        Begin
          FRClasseMaisVendida.QRBand4.Enabled := False;
          FRClasseMaisVendida.QRGroup1.Enabled := True;
          FRClasseMaisVendida.QRBand6.Enabled := True;
        end
        else
        Begin
          FRClasseMaisVendida.QRBand4.Enabled := True;
          FRClasseMaisVendida.QRGroup1.Enabled := False;
          FRClasseMaisVendida.QRBand6.Enabled := False;
        end;
        FRClasseMaisVendida.QRLTitulo.Caption := 'Classe Mais Vendida' + 'Período de ' + FNotaSaidaParam.ME32DtInicial.text + ' até ' + FNotaSaidaParam.ME32DtFinal.text;
        //FRVendaVendedorClasse.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed35Filial.Text;
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRClasseMaisVendida.QRPrimario.Preview
        else
          FRClasseMaisVendida.QRPrimario.Print;

       QRClasseMaisVendida.Close;
     end;

   end;


  end;
{  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[32].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    if (Trim(FNotaSaidaParam.EdNF32I.Text) = '') or (Trim(FNotaSaidaParam.EdNF32F.Text) = '') then
      raise exception.Create('Deve ser informada nota inicio/final primeiro!');

    with DMRelatorio_Venda do
    begin
      QREtiq_ItemsNF.Close;
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_I', FNotaSaidaParam.EdNF32I.Text);
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_F', FNotaSaidaParam.EdNF32F.Text);
      QREtiq_ItemsNF.SetVariable('COD_SERIE', FNotaSaidaParam.Fm32Serie.MeSerie.Text);
      QREtiq_ItemsNF.Open;
      if QREtiq_ItemsNF.RecordCount = 0 then
        raise exception.Create('Nota(s) fiscal(is) não encontrada(s)!');

      wCont := 0; // Inicializa valor da variavel.

      // Inicializa impressora.
      // wLpt_Nota:= DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_PARAM_SISTEMA','COD_FILIAL = '+DBEdit2.Text)
      wLpt_Nota := 'LPT1';
      if Imp = nil then
        Imp := TImp.Create;
      if Trim(wLpt_Nota) = 'LPT1' then
        Imp.AbreImpressora
      else if Trim(wLpt_Nota) = 'LPT2' then
        Imp.AbreImpressora_Lpt2
      else
        Imp.AbreImpressora_Com2;

      //Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);

      // Modificado por Djeison - 25/03/2013
      QREtiq_ItemsNF.First;

      wNrEtiquetas := QREtiq_ItemsNFNUM_VOLUMES.Value;
      if (wNrEtiquetas = 0) then
        while not QREtiq_ItemsNF.Eof do
        begin
          wNrEtiquetas := StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) + wNrEtiquetas;
          QREtiq_ItemsNF.Next;
        end;

      wVolume := 1; // Indica o volume atual
      while wVolume <= wNrEtiquetas do
        begin
          Imp.WriteXY(0, wCont, Trim(QREtiq_ItemsNFDESC_FILIAL.Text));
          inc(wCont);
          Imp.WriteXY(0, wCont, 'Nota: '+Trim(QREtiq_ItemsNFNUM_NOTA.Text));
          Imp.WriteXY(4.5, wCont, 'Fone:'+Trim(QREtiq_ItemsNFDESC_TELEFONE.Text));
          inc(wCont);
          Imp.WriteXY(0, wCont, 'Cliente: '+ AnsiMidStr(Trim(QREtiq_ItemsNFnome.Value), 1, 35));
          inc(wCont);
          Imp.WriteXY(0, wCont, 'Cidade: '+AnsiMidStr(Trim(QREtiq_ItemsNFDESC_CIDADE.Value), 1, 35));
          inc(wCont);
          Imp.WriteXY(0, wCont, 'Volume: '+ IntToStr(wVolume) + '/' + IntToStr(wNrEtiquetas));
          inc(wVolume);
          wCont := wCont + 5;
          Imp.WriteXY(0.1, wCont, '');
      end;
      // Comentado por Djeison - 08/05/2013
//      Imp.SaltaPagina;
      //Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);

      Imp.FechaImpressora;
    end;
  end;    }
end;

procedure TFNotaSaidaCad.NotasContaCorrente1Click(Sender: TObject);
var
  wParametro: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[33].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      if (trim(FNotaSaidaParam.MEDT_Recebimento_I.text) <> '') and (trim(FNotaSaidaParam.MEDT_Recebimento_F.text) <> '') and (trim(FNotaSaidaParam.EDNumNota.text) <> '') then
      begin
        wParametro := DMOracle.BuscaNome('SELECT COD_NOTA_CONTA_CORRENTE FROM TB_NOTA_CAB', 'NUM_NOTA = ' + Trim(FNotaSaidaParam.EdNumNota.text) + ' and TB_Nota_Cab.DT_Recebimento >= ' + chr(39) + FNotaSaidaParam.MEDT_Recebimento_I.text + chr(39) + ' and TB_Nota_Cab.DT_Recebimento <= ' + chr(39) + FNotaSaidaParam.MEDT_Recebimento_F.text + chr(39));
        if wParametro <> '' then
        begin
          QRNotaContaCorrente.close;
          QRNotaContaCorrente.setVariable('NUM_NOTA', StrToInt(Trim(FNotaSaidaParam.EdNumNota.text)));
          QRNotaContaCorrente.setVariable('COD_NOTA_CONTA_CORRENTE', wParametro);
          QRNotaContaCorrente.open;
          if FRNotaContaCorrente = nil then
            FRNotaContaCorrente := TFRNotaContaCorrente.Create(Application);
          FRNotaContaCorrente.QRPrimario.Preview;
        end
        else
          ShowMessage('Esta Nota Não Foi Atendida Neste Período');
      end
      else
        showmessage('Todos os campos devem ser Preenchidos!');
    end;
  end;
end;

procedure TFNotaSaidaCad.BtConsVendedorPreClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'DIVINO' then
  begin
    if FCadastroCons = nil then
      FCadastroCons := TFCadastroCons.Create(Application);
    if FCadastroCons.ShowModal = mrOK then
      DMNotaSaida.QNotaSaidaCOD_VENDEDOR_PREPOSTO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
  end
  else
  begin
    if FVendedorCons = nil then
      FVendedorCons := TFVendedorCons.Create(Application);
    if FVendedorCons.ShowModal = mrOk then
      DMNotaSaida.QNotaSaidaCod_Vendedor_Preposto.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  end;
end;

procedure TFNotaSaidaCad.DBEdit31Change(Sender: TObject);
begin
  inherited;
  if DbEdit31.Text <> '' then
  begin
    with DMTributacao do
    begin
      QTributacao.Close;
      QTributacao.SetVariable('PK', DbEdit31.Text);
      QTributacao.Open;
      DMNotaSaida.QNotaSaidaVAL_ICM_BASE_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value * QTributacaoPerc_Tributado.Value / 100);
      DMNotaSaida.QNotaSaidaVAL_ICM_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value * QTributacaoPerc_Tributado.Value / 100)
        * QTributacaoPerc_Aliquota.Value / 100;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtMensagemClick(Sender: TObject);
var str: string;
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = MrOk then
  begin
    str := DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value;
    if not DMMensagem.QMensagemConsDESC_MENSAGEM.IsNull then
    begin
      if Trim(str) <> '' then
        str := str + #13 + #10;
      str := str + DMMensagem.QMensagemConsDESC_MENSAGEM.Value;
    end;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO.IsNull then
      str := str + ' '+ DMMensagem.QMensagemConsDESC_COMPLEMENTO.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO1.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO1.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO2.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO2.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO3.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO3.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO4.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO4.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO5.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO5.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO6.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO6.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO7.IsNull then
      str := str + ' ' + DMMensagem.QMensagemConsDESC_COMPLEMENTO7.Value;
    DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := str;
  end;
end;

procedure TFNotaSaidaCad.SBCartaCorrecaoClick(Sender: TObject);
var
  RetProcessamento: String;
  IdLote: String;
  ChaveAcesso: String;
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value = 0) then
    raise Exception.Create('É necessário escolher uma nota para emitir uma Carta de Correção Eletrônica.');
  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
  begin
    MessageDlg('A nota precisa ter uma chave de acesso. Se for uma NF-e, confirme-a.', mtError, [mbOK], 0);
    Exit;
  end;
  RetProcessamento := '';
  IdLote := '';
  ChaveAcesso := Copy( DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value,4, 44);
  Buscador.Limpa;
  Buscador.Adiciona('DESC_RETORNO_PROCESSAMENTO', 'TB_NF_ELETRONICA', 'DESC_CHAVE_ACESSO = ' + QuotedStr(ChaveAcesso));
  Buscador.Adiciona('ID_LOTE', 'TB_CCE', 'DESC_CHAVE_ACESSO = ' + QuotedStr(ChaveAcesso));
  Buscador.Buscar();
  RetProcessamento := Buscador.Proximo;
  IdLote := Buscador.Proximo;
  Buscador.Fecha;

  if RetProcessamento <> '100' then
  begin
    MessageDlg('A NF-e deve estar confirmada e autorizada pela Sefaz.', mtError, [mbOK], 0);
    Exit;
  end;

  if FCartaCorrecaoEletronica = nil then
    FCartaCorrecaoEletronica := TFCartaCorrecaoEletronica.Create(application);
  FCartaCorrecaoEletronica.pCodNota := DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
  if IdLote <> '' then
    FCartaCorrecaoEletronica.pIdLote := StrToFloat(IdLote)
  else
    FCartaCorrecaoEletronica.pIdLote := 0;

  FCartaCorrecaoEletronica.pChaveAcesso := ChaveAcesso;
  FCartaCorrecaoEletronica.ShowModal;
end;

procedure TFNotaSaidaCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.VendedorCliente1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
  begin
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.ME34DtInicio.Text := DateToStr(Date);
    FNotaSaidaParam.ME34DtFinal.Text := DateToStr(Date);
  end;
  FNotaSaidaParam.PGRelatorio.Pages[34].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRVendaVendedorCliente.Close;
      if (trim(FNotaSaidaParam.ME34DtInicio.text) <> '') and (trim(FNotaSaidaParam.ME34DtFinal.text) <> '') then
      begin
        QRVendaVendedorCliente.setVariable('DT_INICIO', trim(FNotaSaidaParam.ME34DtInicio.text));
        QRVendaVendedorCliente.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME34DtFinal.text) + ' 23:59:59');
      end
      else
        showmessage('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME34CodFilial.Text) <> '') then
        QRVendaVendedorCliente.setVariable('FILIAL', trim(FNotaSaidaParam.ME34CodFilial.text))
      else
        QRVendaVendedorCliente.setVariable('FILIAL', null);

      if (Trim(FNotaSaidaParam.ME34Ramo.Text) <> '') then
        QRVendaVendedorCliente.setVariable('RAMO', trim(FNotaSaidaParam.ME34Ramo.text))
      else
        QRVendaVendedorCliente.setVariable('RAMO', null);

      if (Trim(FNotaSaidaParam.ME34CodVendedor.Text) <> '') then
        QRVendaVendedorCliente.setVariable('VENDEDOR', trim(FNotaSaidaParam.ME34CodVendedor.text))
      else
        QRVendaVendedorCliente.setVariable('VENDEDOR', null);

      if (Trim(FNotaSaidaParam.ME34CodClasse.Text) <> '') then
        QRVendaVendedorCliente.setVariable('CLASSE', trim(FNotaSaidaParam.ME34CodClasse.text))
      else
        QRVendaVendedorCliente.setVariable('CLASSE', null);
      if FNotaSaidaParam.Rg34Cancelado_Sim_Nao.ItemIndex = 0 then
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO', null)
      else
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO', 'NAO');
      QRVendaVendedorCliente.Open;
      if FRVendaVendedorCliente = nil then
        FRVendaVendedorCliente := TFRVendaVendedorCliente.Create(Application);
      FRVendaVendedorCliente.QRLTitulo.Caption := 'Vendas por Vendedor/Cliente no Período de ' + FNotaSaidaParam.ME34DtInicio.text + ' até ' + FNotaSaidaParam.ME34DtFinal.text;
      FRVendaVendedorCliente.QRLbFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed34Filial.Text;
      FRVendaVendedorCliente.QRLbClasse.Caption := 'Classe: ' + FNotaSaidaParam.Ed34Classe.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendaVendedorCliente.QRPrimario.Preview
      else
        FRVendaVendedorCliente.QRPrimario.Print;
      QRVendaVendedorCliente.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtOrdemCarregamentoClick(Sender: TObject);
begin
  inherited;
  if FOrdemCarregamentoCons = nil then
    FOrdemCarregamentoCons := TFOrdemCarregamentoCons.Create(Application);
  if FOrdemCarregamentoCons.ShowModal = mrOk then
    if DMOrdemCarregamento.QOrdemCarregamentoConsInd_Situacao.Value = 'B' then
      raise Exception.Create('Ordem de Carregamento Já foi Utilizada em Outra Nota Fiscal')
    else
    begin
      with DMOrdemCarregamento do
      begin
        DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_cab.Value := QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value;
        QOrdemCarregamentoCab.Close;
        QOrdemCarregamentoCab.SetVariable('Pk', QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value);
        QOrdemCarregamentoCab.Open;
        QOrdemCarregamentoItem.Close;
        QOrdemCarregamentoItem.Open;
        DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value := QOrdemCarregamentoItemInd_Tipo_Frete.Value;
        DMNotaSaida.QNotaSaidaNUM_CONHECIMENTO_FRETE.Value := 0;
        DMNotaSaida.QNotaSaidaDT_EMISSAO_CF.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
        DMNotaSaida.QNotaSaidaCod_Transportador.Value := QOrdemCarregamentoItemCod_Motorista.Value;
        DMNotaSaida.QNotaSaidaDesc_Placa.Value := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;
        if QOrdemCarregamentoItemInd_Tipo_Frete.Value = 'CIF' then
        begin
          if QOrdemCarregamentoCabCod_Motorista.Text <> '' then
            DMNotaSaida.QNotaSaidaCod_Motorista.Value := QOrdemCarregamentoCabCod_Motorista.Value;
          DMNotaSaida.QNotaSaidaVal_Pedagio.Value := QOrdemCarregamentoItemVal_Pedagio.Value;
          DMNotaSaida.QNotaSaidaVAL_FRETE_TON.Value := QOrdemCarregamentoItemVal_Frete_Ton.Value;
        end;
      end;
    end;
end;

procedure TFNotaSaidaCad.DBEdit62KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True; // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.DBEdit63KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True; // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.MELocalizaChange(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False; // digitacao manual de valores de icms COLOQUEI AQUI NO CASO DE FAZER UMA NOTA INFORMANDO O ICMS E DEPOIS CONSULTAR OUTRA NOTA
end;

procedure TFNotaSaidaCad.VendaCustoVendedorClasse1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[35].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRVendaVendedorClasse.Close;
      if Trim(FNotaSaidaParam.ME35DtInicial.text) = '' then
        raise Exception.Create('Período deve ser informado');
      if Trim(FNotaSaidaParam.ME35DtFinal.text) = '' then
        FNotaSaidaParam.ME35DtFinal.text := DateToStr(Date);
      if Trim(FNotaSaidaParam.ME35TribFederal.text) = '' then
        raise Exception.Create('Valor do Tributo Federal deve ser Informado');
      QRVendaVendedorClasse.setVariable('VAL_TRIBUTO', Trim(FNotaSaidaParam.ME35TribFederal.Text));
      QRVendaVendedorClasse.setVariable('DT_INICIAL', Trim(FNotaSaidaParam.ME35DtInicial.Text));
      QRVendaVendedorClasse.setVariable('DT_FINAL', Trim(FNotaSaidaParam.ME35DtFinal.Text) + ' 23:59:59');

      QRVendVendedorResumo.setVariable('VAL_TRIBUTO', Trim(FNotaSaidaParam.ME35TribFederal.Text));
      QRVendVendedorResumo.setVariable('DT_INICIAL', Trim(FNotaSaidaParam.ME35DtInicial.Text));
      QRVendVendedorResumo.setVariable('DT_FINAL', Trim(FNotaSaidaParam.ME35DtFinal.Text) + ' 23:59:59');

      if Trim(FNotaSaidaParam.ME35Filial.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('FILIAL', Trim(FNotaSaidaParam.ME35Filial.Text));
        QRVendVendedorResumo.setVariable('FILIAL', Trim(FNotaSaidaParam.ME35Filial.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('FILIAL', NULL);
        QRVendVendedorResumo.setVariable('FILIAL', NULL);
      end;

      if Trim(FNotaSaidaParam.ME35Vendedor.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('VENDEDOR', Trim(FNotaSaidaParam.ME35Vendedor.Text));
        QRVendVendedorResumo.setVariable('VENDEDOR', Trim(FNotaSaidaParam.ME35Vendedor.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('VENDEDOR', NULL);
        QRVendVendedorResumo.setVariable('VENDEDOR', NULL);
      end;

      if Trim(FNotaSaidaParam.Me35Supervisor.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('SUPERVISOR', Trim(FNotaSaidaParam.Me35Supervisor.Text));
        QRVendVendedorResumo.setVariable('SUPERVISOR', Trim(FNotaSaidaParam.Me35Supervisor.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('SUPERVISOR', NULL);
        QRVendVendedorResumo.setVariable('SUPERVISOR', NULL);
      end;

      if Trim(FNotaSaidaParam.ME35Classe.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('CLASSE', Trim(FNotaSaidaParam.ME35Classe.text));
        QRVendVendedorResumo.setVariable('CLASSE', Trim(FNotaSaidaParam.ME35Classe.text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('CLASSE', NULL);
        QRVendVendedorResumo.setVariable('CLASSE', NULL);
      end;

      if FNotaSaidaParam.RG35Tipo.ItemIndex = 1 then
      begin
        QRVendaVendedorClasse.SQL[QRVendaVendedorClasse.SQL.count - 1] := '';
        QRVendaVendedorClasse.Sql.Add('Order By Cod_Classe');
      end;

      QRVendaVendedorClasse.Open;
      QRVendVendedorResumo.Open;

      if FNotaSaidaParam.RG35Tipo.ItemIndex = 0 then
      begin
        if FRVendaVendedorClasse = nil then
          FRVendaVendedorClasse := TFRVendaVendedorClasse.Create(Application);
        FRVendaVendedorClasse.QRLPeriodo.Caption := 'Período de ' + FNotaSaidaParam.ME35DtInicial.text + ' até ' + FNotaSaidaParam.ME35DtFinal.text;
        FRVendaVendedorClasse.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed35Filial.Text;
        if FRVendaVendedorResumo = nil then
          FRVendaVendedorResumo := TFRVendaVendedorResumo.Create(Application);

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRVendaVendedorClasse.QRCompositeReport1.Preview
        else
          FRVendaVendedorClasse.QRCompositeReport1.Print;
      end
      else
      begin
        if FRVendaVendedorClasseSintetico = nil then
          FRVendaVendedorClasseSintetico := TFRVendaVendedorClasseSintetico.Create(Application);
        FRVendaVendedorClasseSintetico.QRLPeriodo.Caption := 'Período de ' + FNotaSaidaParam.ME35DtInicial.text + ' até ' + FNotaSaidaParam.ME35DtFinal.text;
        FRVendaVendedorClasseSintetico.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed35Filial.Text;
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRVendaVendedorClasseSintetico.QRPrimario.Preview
        else
          FRVendaVendedorClasseSintetico.QRPrimario.Print;
      end;
      QRVendaVendedorClasse.Close;
      QRVendVendedorResumo.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.LanarQtChegada1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMNotaSaida.QItemNFCOD_NOTA_ITEM.Text) <> '' then
  begin
    if FQtChegada = nil then
      FQtChegada := TFQtChegada.Create(Application);
    FQtChegada.wNota := 'S';
    FQtChegada.showModal;
  end
  else
    raise Exception.Create('Informe a nota para lançar a Qt. Chegada');
end;

procedure TFNotaSaidaCad.DBECodOperacaoChange(Sender: TObject);
var
  wPagto: string;
begin
  inherited;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
    (Trim(DBECodOperacao.Text) <> '') and (DMNotaSaida.QNotaSaidaIND_SITUACAO.Value = '1') then
  begin
    wPagto := DMOracle.BuscaNome('SELECT IND_TIPO_PAGAMENTO FROM TB_OPERACAO', 'COD_OPERACAO = ' + DBECodOperacao.Text);
    if wPagto = 'V' then
      DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
    if wPagto = 'P' then
      DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
    if wPagto = 'O' then
      DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
  end;
  if Trim(DBECodOperacao.Text) <> '' then
  begin
    if DMOracle.FastSelect('IND_SERVICO', 'TB_OPERACAO', 'COD_OPERACAO = ' + DBECodOperacao.Text) = 'S' then
    begin
      Label47.Caption := 'Número NFS-e';
      DBENum_NFSe.Visible := true;
      DBEChaveAcesso.Visible := false;
      SBChaveAcesso.Visible := false;
      Label10.Caption := 'Num. Rps';
    end
    else
    begin
      Label47.Caption := 'Chave de Acesso';
      DBENum_NFSe.Visible := false;
      DBEChaveAcesso.Visible := true;
      SBChaveAcesso.Visible := true;
      Label10.Caption := 'Num. Nota';
    end;
    
  end;
end;

procedure TFNotaSaidaCad.MsgAutoriza;
begin
  if Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text) <> '' then
  begin
    LblAutoriza.Caption := 'Autorizado:' + DMCadastro.QCadastroNOME_CONTATO.Text;
    LblAutoriza.Caption := LblAutoriza.Caption + '-' + DMCadastro.QCadastroNOME_CONTATO2.Text;
    LblFormaCompra.Caption := DMCadastro.QCadastroDESC_FORMA_COMPRA.Text;
    LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc ' + DMCadastro.QCadastroPERC_DESCONTO.Text;
    LblAutoriza.Caption := LblAutoriza.Caption + ' Oper:' + DMCadastro.QCadastroCOD_OPERACAO_CC.Text;
  end
  else
  begin
    LblAutoriza.Caption := '';
    LblFormaCompra.Caption := '';
  end;
end;

procedure TFNotaSaidaCad.AcompanhamentodeMeta1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[36].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRAcompanhaMeta.Close;
      if (trim(FNotaSaidaParam.ME36Dt_Inicial.text) <> '') and (trim(FNotaSaidaParam.ME36Dt_Final.text) <> '') then
      begin
        QRAcompanhaMeta.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME36Dt_Inicial.text));
        QRAcompanhaMeta.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME36Dt_Final.text) + ' 23:59:59');
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME36Filial.Text) <> '') then
        QRAcompanhaMeta.setVariable('FILIAL', trim(FNotaSaidaParam.ME36Filial.text))
      else
        QRAcompanhaMeta.setVariable('FILIAL', null);

      if (Trim(FNotaSaidaParam.Me36Supervisor.Text) <> '') then
        QRAcompanhaMeta.setVariable('COD_SUPERVISOR', trim(FNotaSaidaParam.Me36Supervisor.text))
      else
        QRAcompanhaMeta.setVariable('COD_SUPERVISOR', null);

      if (Trim(FNotaSaidaParam.Me36Meta.Text) <> '') then
        pMeta := StrToFloat(FNotaSaidaParam.ME36Meta.Text)
      else
        raise Exception.Create('É preciso informar a Meta!');
      QRAcompanhaMeta.Open;
      if FRAcompanhaMeta = nil then
        FRAcompanhaMeta := TFRAcompanhaMeta.Create(Application);
      FRAcompanhaMeta.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME36Dt_Inicial.text + ' até ' + FNotaSaidaParam.ME36Dt_Final.text;
      FRAcompanhaMeta.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Me36Filial.Text + FNotaSaidaParam.Ed36Filial.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRAcompanhaMeta.QRPrimario.Preview
      else
        FRAcompanhaMeta.QRPrimario.Print;
      QRAcompanhaMeta.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.RelaoNotasSubstituio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[37].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRelacaoNotasRio.Close;
      if (trim(FNotaSaidaParam.ME37Dt_Inicial.text) <> '') and (trim(FNotaSaidaParam.ME37Dt_Final.text) <> '') then
      begin
        QRelacaoNotasRio.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME37Dt_Inicial.text));
        QRelacaoNotasRio.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME37Dt_Final.text  + ' 23:59:59'));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME37Filial.Text) <> '') then
        QRelacaoNotasRio.setVariable('COD_FILIAL', trim(FNotaSaidaParam.ME37Filial.text))
      else
        QRelacaoNotasRio.setVariable('COD_FILIAL', null);
      if (Trim(FNotaSaidaParam.Fm37Estado.MeEstado.Text) <> '') then
        QRelacaoNotasRio.setVariable('COD_ESTADO', trim(FNotaSaidaParam.Fm37Estado.MeEstado.text))
      else
        raise Exception.Create('O Estado deve ser informado');
      if FNotaSaidaParam.CB37Venda.Checked then
        QRelacaoNotasRio.setVariable('IND_VENDAS', 'V')
      else
        QRelacaoNotasRio.setVariable('IND_VENDAS', 'P');
      if FNotaSaidaParam.CB37Bonificacao.Checked then
        QRelacaoNotasRio.setVariable('IND_BONIFICACAO', 'S')
      else
        QRelacaoNotasRio.setVariable('IND_BONIFICACAO', 'P'); // COLOCADO P PARA CONSEGUIR LISTR AS OPERACOES
      if FNotaSaidaParam.CB37Brinde.Checked then // NUNCA VAI EXISTIR UMA OPERACAO COM P
        QRelacaoNotasRio.setVariable('IND_BRINDE', 'S')
      else
        QRelacaoNotasRio.setVariable('IND_BRINDE', 'P');
      if FNotaSaidaParam.CB37Troca.Checked then
        QRelacaoNotasRio.setVariable('IND_TROCA', 'S')
      else
        QRelacaoNotasRio.setVariable('IND_TROCA', 'P');

      if FNotaSaidaParam.CB37Zero.Checked then
        QRelacaoNotasRio.SQL[QRelacaoNotasRio.SQL.Count - 1] := 'AND VAL_SUBSTITUICAO = 0 '
      else
        QRelacaoNotasRio.SQL[QRelacaoNotasRio.SQL.Count - 1] := 'AND VAL_SUBSTITUICAO <> 0 ';

      QRelacaoNotasRio.Open;
      if FRNotasRio = nil then
        FRNotasRio := TFRNotasRio.Create(Application);
      FRNotasRio.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME37Dt_Inicial.text + ' até ' + FNotaSaidaParam.ME37Dt_Final.text;
      FRNotasRio.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Me37Filial.Text + FNotaSaidaParam.Ed37Filial.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNotasRio.QRPrimario.Preview
      else
        FRNotasRio.QRPrimario.Print;
      QRelacaoNotasRio.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.PCCabecalhoChange(Sender: TObject);
begin
  inherited;
  if PCCabecalho.ActivePage = TSContaReceber then
  begin
    DMNotaSaida.QContaReceber.Close;
    DMNotaSaida.QContaReceber.Open;

    {PARA O BOTÃO DE ENVIO DO BOLETO E REIMPRESSÃO}
    btnEnviaBoletoApi.Enabled := False;
    btnImprimirBoletoApi.Enabled := False;
    btnEnviarBoletoEmail.Enabled := False;
    if DMNotaSaida.QContaReceber.RecordCount > 0 then
    begin
      if (DMNotaSaida.QContaReceberIND_WEB_API.Value = 'S') AND (DMNotaSaida.QContaReceberIND_ENVIADO_BANCO.Value = 'NAO') then
        btnEnviaBoletoApi.Enabled := True;
      if (DMNotaSaida.QContaReceberIND_WEB_API.Value = 'S') AND (DMNotaSaida.QContaReceberIND_ENVIADO_BANCO.Value = 'SIM') then
      begin
        btnImprimirBoletoApi.Enabled := True;
        btnEnviarBoletoEmail.Enabled := True;
      end;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtCulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = mrOk then
    DMNotaSaida.QItemNFCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFNotaSaidaCad.BtMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Motorista.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.AcompanhamentodeVendas1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[38].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
    if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    begin
      FNotaSaidaParam.Me38Vendedor.Enabled := False;
      FNotaSaidaParam.Bt38ConsVendedor.Enabled := False;
      FNotaSaidaParam.Me38Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end
    else
    begin
      FNotaSaidaParam.Me38Supervisor.Enabled := False;
      FNotaSaidaParam.Bt38Supervisor.Enabled := False;
      FNotaSaidaParam.Me38Supervisor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRAcompanhaVenda.Close;

      if (Trim(FNotaSaidaParam.ME38Filial.Text) <> '') then
        QRAcompanhaVenda.setVariable('COD_FILIAL', trim(FNotaSaidaParam.ME38Filial.text))
      else
        QRAcompanhaVenda.setVariable('COD_FILIAL', null);

      if (trim(FNotaSaidaParam.ME38DtInicial.text) <> '') and (trim(FNotaSaidaParam.ME38DtFinal.text) <> '') then
      begin
        QRAcompanhaVenda.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME38DtInicial.text));
        QRAcompanhaVenda.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME38DtFinal.text + ' 23:59:59'));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME38Vendedor.Text) <> '') then
        QRAcompanhaVenda.setVariable('VENDEDOR', trim(FNotaSaidaParam.ME38Vendedor.text))
      else
        QRAcompanhaVenda.setVariable('VENDEDOR', null);

      if (Trim(FNotaSaidaParam.ME38Supervisor.Text) <> '') then
        QRAcompanhaVenda.setVariable('COD_SUPERVISOR', trim(FNotaSaidaParam.ME38Supervisor.Text))
      else
        QRAcompanhaVenda.setVariable('COD_SUPERVISOR', null);

      if Trim(FNotaSaidaParam.Me38CodEstado.Text) <> '' then
        QRAcompanhaVenda.SetVariable('COD_ESTADO', Trim(FNotaSaidaParam.Me38CodEstado.Text))
      else
        QRAcompanhaVenda.SetVariable('COD_ESTADO', null);

      if FNotaSaidaParam.ME38AnoBase.Text = '' then
        raise Exception.Create('Deve ser informado o Ano!');
      QRAcompanhaVenda.SetVariable('ANO', (FNotaSaidaParam.ME38AnoBase.Text));

      QRAcompanhaVenda.Open;
      if FRAcompanhamentoVenda = nil then
        FRAcompanhamentoVenda := TFRAcompanhamentoVenda.Create(Application);
      FRAcompanhamentoVenda.QRLVendedor.Caption := 'Vendedor: ' + FNotaSaidaParam.ME38Vendedor.text + ' ' + FNotaSaidaParam.Ed38Vendedor.Text;
      FRAcompanhamentoVenda.QRLSupervisor.Caption := 'Supervisor: ' + FNotaSaidaParam.ME38Supervisor.text + ' ' + FNotaSaidaParam.Ed38Supervisor.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRAcompanhamentoVenda.QRPrimario.Preview
      else
        FRAcompanhamentoVenda.QRPrimario.Print;
      QRAcompanhaVenda.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.VendasPorRamoCliente1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[39].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRVendasRamoCliente.Close;
      if (trim(FNotaSaidaParam.ME39DtInicial.text) <> '') and (trim(FNotaSaidaParam.ME39DtFinal.text) <> '') then
      begin
        QRVendasRamoCliente.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME39DtInicial.text));
        QRVendasRamoCliente.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME39DtFinal.text + ' 23:59:59'));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');
      if Trim(FNotaSaidaParam.ME39Ramo.Text) = '' then
        raise Exception.Create('Deve ser informado o RAMO do Cliente!');
      QRVendasRamoCliente.SetVariable('RAMO', (FNotaSaidaParam.ME39Ramo.Text));
      if (Trim(FNotaSaidaParam.ME39Supervisor.Text) <> '') then
        QRVendasRamoCliente.SetVariable('SUPERVISOR', (FNotaSaidaParam.ME39Supervisor.Text))
      else
        QRVendasRamoCliente.SetVariable('SUPERVISOR', null);

      QRVendasRamoCliente.Open;
      if FRVendasRamoCliente = nil then
        FRVendasRamoCliente := TFRVendasRamoCliente.Create(Application);
      FRVendasRamoCliente.QRLRamo.Caption := 'Ramo: ' + FNotaSaidaParam.ME39Ramo.text + ' ' + FNotaSaidaParam.Ed39Ramo.Text;
      FRVendasRamoCliente.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME39DtInicial.text + ' até ' + FNotaSaidaParam.ME39DtFinal.text;
      FRVendasRamoCliente.QRLSupervisor.Caption := 'Supervisor: ' + FNotaSaidaParam.ME39Supervisor.text + ' ' + FNotaSaidaParam.Ed39Supervisor.text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendasRamoCliente.QRPrimario.Preview
      else
        FRVendasRamoCliente.QRPrimario.Print;
      QRVendasRamoCliente.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.DBEdit22Exit(Sender: TObject);
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaCOD_TRANSPORTADOR.Text <> '') then
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Value := 'VOLUME'
  else
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Clear;
  if (Trim(DBEdit22.Text) <> '') and (Trim(DBEdit43.Text) = '') and
    (DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value = '') then
  begin
    DMNotaSaida.QNotaSaidaDESC_PLACA.Value :=
      DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
    DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value :=
      DMOracle.BuscaNome('SELECT COD_UF_VEICULO FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
  end;
  if (wEmpresa = 'ABATE') and (Trim(DBEdit22.Text) <> '') and (Trim(DBEdit93.Text) = '') then
    DMNotaSaida.QNotaSaidaDESC_MARCA.Value := 'FRIELLA';
end;

procedure TFNotaSaidaCad.NotasporCultura1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[40].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRNotasCultura.Close;
      if (trim(FNotaSaidaParam.ME40DtInicial.text) <> '') and (trim(FNotaSaidaParam.ME40DtFinal.text) <> '') then
      begin
        QRNotasCultura.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME40DtInicial.text));
        QRNotasCultura.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME40DtFinal.text + ' 23:59:59'));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME40Filial.Text) <> '') then
        QRNotasCultura.setVariable('FILIAL', trim(FNotaSaidaParam.ME40Filial.text))
      else
        QRNotasCultura.setVariable('FILIAL', null);

      if (Trim(FNotaSaidaParam.ME40Cadastro.Text) <> '') then
        QRNotasCultura.setVariable('CADASTRO', trim(FNotaSaidaParam.ME40Cadastro.text))
      else
        QRNotasCultura.setVariable('CADASTRO', null);

      if (Trim(FNotaSaidaParam.ME40Cultura.Text) <> '') then
        QRNotasCultura.setVariable('CULTURA', trim(FNotaSaidaParam.ME40Cultura.text))
      else
        QRNotasCultura.setVariable('CULTURA', null);

      if (Trim(FNotaSaidaParam.Me40Vendedor.Text) <> '') then
        QRNotasCultura.setVariable('VENDEDOR', trim(FNotaSaidaParam.Me40Vendedor.text))
      else
        QRNotasCultura.setVariable('VENDEDOR', null);

      QRNotasCultura.Open;
      if FRNotaCultura = nil then
        FRNotaCultura := TFRNotaCultura.Create(Application);
      FRNotaCultura.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME40Filial.text + ' ' + FNotaSaidaParam.Ed40Filial.Text;
      FRNotaCultura.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME40DtInicial.text + ' até ' + FNotaSaidaParam.ME40DtFinal.text;
      FRNotaCultura.QRLCliente.Caption := 'Cliente: ' + FNotaSaidaParam.ME40Cadastro.text + '' + FNotaSaidaParam.Ed40Cadastro.text +
        '  Cultura: ' + FNotaSaidaParam.ME40Cultura.text + '' + FNotaSaidaParam.Ed40Cultura.text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNotaCultura.QRPrimario.Preview
      else
        FRNotaCultura.QRPrimario.Print;
      QRNotasCultura.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_CADASTRO_CLASSIFICACAO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.RelaoNotasComDesconto1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[41].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QrVendaComDesconto.Close;
      if (trim(FNotaSaidaParam.ME41DtInicial.text) <> '') and (trim(FNotaSaidaParam.ME41DtFinal.text) <> '') then
      begin
        QrVendaComDesconto.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME41DtInicial.text));
        QrVendaComDesconto.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME41DtFinal.text + ' 23:59:59'));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME41Filial.Text) <> '') then
        QrVendaComDesconto.setVariable('COD_FILIAL', trim(FNotaSaidaParam.ME41Filial.text))
      else
        QrVendaComDesconto.setVariable('COD_FILIAL', null);

      if (Trim(FNotaSaidaParam.ME41Cadastro.Text) <> '') then
        QrVendaComDesconto.setVariable('COD_CADASTRO', trim(FNotaSaidaParam.ME41Cadastro.text))
      else
        QrVendaComDesconto.setVariable('COD_CADASTRO', null);

      if (Trim(FNotaSaidaParam.ME41Departamento.Text) <> '') then
        QrVendaComDesconto.setVariable('COD_DEPARTAMENTO', trim(FNotaSaidaParam.ME41Departamento.text))
      else
        QrVendaComDesconto.setVariable('COD_DEPARTAMENTO', null);
      //Alterado para buscar vários vendedores  separados por virgula Solicitado por Nestor(Deion) - Marcos - Cleber-08/06/2019
      if (Trim(FNotaSaidaParam.Me41CodVendedor.Text) <> '') then
        QrVendaComDesconto.setVariable('COD_VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me41CodVendedor.Text) +  ')')
      else
        QrVendaComDesconto.setVariable('COD_VENDEDOR', '1=1');

      QrVendaComDesconto.Open;
      if FrVendaComDesconto = nil then
        FrVendaComDesconto := TFrVendaComDesconto.Create(Application);
      FrVendaComDesconto.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME41Filial.text + ' ' + FNotaSaidaParam.Ed41Filial.Text;
      FrVendaComDesconto.QRLTitulo.Caption := 'Relatório Com Descontos Período: ' + FNotaSaidaParam.ME41DtInicial.text + ' até ' + FNotaSaidaParam.ME41DtFinal.text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FrVendaComDesconto.QRPrimario.Preview
      else
        FrVendaComDesconto.QRPrimario.Print;
      QrVendaComDesconto.Close;
    end;
  end;

end;

procedure TFNotaSaidaCad.DBEDescontoExit(Sender: TObject);
var
  wVal_Desconto: Real;
  wRegistros: Integer;
begin
  inherited;
  with DMNotaSaida do
  begin
    if DMParamSistema.CodEmpresa = 'MOINHO' then
    begin
      if Trim(DMNotaSaida.QItemNFVal_Desconto.Text) <> '' then
        if Trim(DMNotaSaida.QItemNFQt_Quantidade.Text) <> '' then
        begin // esta rotina foi colocada para nao gerar dizima no desconto quando for devolver (se devolve quantidade menor que a nota dava problema no valor)
          wVal_Desconto := DMNotaSaida.QItemNFVal_Desconto.Value / DMNotaSaida.QItemNFQt_Quantidade.Value * 100;
          wVal_Desconto := Trunc(wVal_Desconto) / 100 * DMNotaSaida.QItemNFQt_Quantidade.Value;
          DMNotaSaida.QItemNFVal_Desconto.Value := wVal_Desconto;
          DMNotaSaida.pDigitou_Desconto := True;
          DMNotaSaida.QItemNFVal_Unitario.Value := (DMNotaSaida.QItemNFVal_Unitario.Value * DMNotaSaida.QItemNFQt_Quantidade.Value - DMNotaSaida.QItemNFVal_Desconto.Value) / DMNotaSaida.QItemNFQt_Quantidade.Value;
          DMNotaSaida.QItemNFVal_ICM_Base.Value := 0; // para recalcular a base de calcula quando alterado
        end;
    end;
    //Verifica se pode dar desconto na tabela de preço. Por Gian, solicitado por Marlom 24/11/2017
    if (Trim(QItemNFCOD_TABELA_PRECO_CAB.Text) <> '') then
    begin
      wRegistros := StrToInt(DMOracle.FastSelect('COUNT(*)','TB_TABELA_PRECO_ITEM','COD_PRODUTO=' +
                      QuotedStr(QItemNFCOD_PRODUTO.Text) + ' AND COD_TABELA_PRECO_CAB=' +
                      QuotedStr(QItemNFCOD_TABELA_PRECO_CAB.Text)));
      if (DMUsuario.QUsuarioIND_PRIVILEGIO.Text <> 'P') and (QItemNFVAL_DESCONTO.Value <> 0) and
         (wRegistros > 0) and (DMParamSistema.CodEmpresa <> 'FERRAGMED') then
      begin
        DMNotaSaida.QItemNFVAL_DESCONTO.Value := 0;
        raise Exception.Create('Usuário não permitido a dar desconto para esta tabela de preço.');
      end;
    end;
    if (DMParamSistema.CodEmpresa = 'KREUZ') and (QItemNFVAL_DESCONTO.Value > 0 ) then
    begin
      QItemNFPERC_DESCONTO.Value := 100*(QItemNFVAL_DESCONTO.Value/QItemNFVAL_UNITARIO.Value);
      Checar_preco;
    end;
  end;
end;

procedure TFNotaSaidaCad.ResumodeVendasporVendedor1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[42].TabVisible := True;

  //FNotaSaidaParam.Me42Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);

  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRVendedorResumoVenda.Close;
      QRVendedorResumoVenda.SQL.Strings[QRVendedorResumoVenda.SQL.Count - 1] := '';
      if (trim(FNotaSaidaParam.ME42DtInicial.text) <> '') and (trim(FNotaSaidaParam.ME42DtFinal.text) <> '') then
      begin
        QRVendedorResumoVenda.setVariable('DT_INICIAL', trim(FNotaSaidaParam.ME42DtInicial.text));
        QRVendedorResumoVenda.setVariable('DT_FINAL', trim(FNotaSaidaParam.ME42DtFinal.text));
      end
      else
        raise Exception.Create('O Período deve ser Informado!');

      if (Trim(FNotaSaidaParam.ME42Filial.Text) <> '') then
        QRVendedorResumoVenda.setVariable('FILIAL', trim(FNotaSaidaParam.ME42Filial.text))
      else
        QRVendedorResumoVenda.setVariable('FILIAL', null);

      if (Trim(FNotaSaidaParam.ME42Vendedor.Text) <> '') then
        QRVendedorResumoVenda.setVariable('VENDEDOR', trim(FNotaSaidaParam.ME42Vendedor.text))
      else
        QRVendedorResumoVenda.setVariable('VENDEDOR', null);

      if Trim(FNotaSaidaParam.ME42Supervisor.Text) = '' then
        QRVendedorResumoVenda.SetVariable('SUPERVISOR', Null)
      else
        QRVendedorResumoVenda.SetVariable('SUPERVISOR', FNotaSaidaParam.ME42Supervisor.Text);

      if trim(FNotaSaidaParam.Me42Produto.Text) = '' then
        QRVendedorResumoVenda.SetVariable('PRODUTO', Null)
      else
        QRVendedorResumoVenda.SetVariable('PRODUTO', trim(FNotaSaidaParam.Me42Produto.Text));

      //QRVendedorResumoVenda.SetVariable('IND_TEF', 'N');
      case FNotaSaidaParam.RG42Pagto.ItemIndex of
        0: QRVendedorResumoVenda.SetVariable('TIPO_PAGTO', '1');
        1: QRVendedorResumoVenda.SetVariable('TIPO_PAGTO', '2');
        2: QRVendedorResumoVenda.SetVariable('TIPO_PAGTO', '3');
        3: QRVendedorResumoVenda.SetVariable('TIPO_PAGTO', '4'); 
        4: QRVendedorResumoVenda.SetVariable('TIPO_PAGTO', Null);
      end;
      case FNotaSaidaParam.Rg42Ordem.ItemIndex of
        0: QRVendedorResumoVenda.SQL.Add('ORDER BY COD_VENDEDOR');
        1: QRVendedorResumoVenda.SQL.Add('ORDER BY NOME');
      end;
      QRVendedorResumoVenda.Open;
      if FrVendedorResumo = nil then
        FrVendedorResumo := TFrVendedorResumo.Create(Application);
      FrVendedorResumo.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME42Filial.text + ' ' + FNotaSaidaParam.Ed42Filial.Text;
      FrVendedorResumo.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME42DtInicial.text + ' até ' + FNotaSaidaParam.ME42DtFinal.text;
      FrVendedorResumo.QRLPagto.Caption := 'Tipo de Pagamento: ' + FNotaSaidaParam.RG42Pagto.Items.Strings[FNotaSaidaParam.RG42Pagto.ItemIndex] +
        ' - Supervisor: ' + FnotaSaidaParam.Ed42Supervisor.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FrVendedorResumo.QRPrimario.Preview
      else
        FrVendedorResumo.QRPrimario.Print;
      QRVendedorResumoVenda.Close;
    end;
    if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
      ResumodeVendasporVendedor1Click(Self);
  end;
end;

procedure TFNotaSaidaCad.VendedorPreoMdioAnual1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[43].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
    if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    begin
      FNotaSaidaParam.Me43Vendedor.Enabled := False;
      FNotaSaidaParam.Bt43ConsVendedor.Enabled := False;
      FNotaSaidaParam.Me43Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end
    else
    begin
      FNotaSaidaParam.Me43Supervisor.Enabled := False;
      FNotaSaidaParam.Bt43Supervisor.Enabled := False;
      FNotaSaidaParam.Me43Supervisor.text := IntToStr(DMusuario.CodVendedorPadrao);
    end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.ME43Filial.Text), 'VENDA');
      QRVendedorCMedioMes.Close;
      QRVendedorCMedioMes.SetVariable('DATA_I', FNotaSaidaParam.ME43DataI.Text);
      QRVendedorCMedioMes.SetVariable('DATA_F', FNotaSaidaParam.ME43DataF.Text + ' 23:59:59');

      //fabiano 27122004
      if Trim(FNotaSaidaParam.ME43PrecoIni.Text) <> '' then
        QRVendedorCMedioMes.SetVariable('VAL_TOTAL_INI', strtofloat(Trim(FNotaSaidaParam.ME43PrecoIni.Text)))
      else
        QRVendedorCMedioMes.SetVariable('VAL_TOTAL_INI', Null);

      if Trim(FNotaSaidaParam.ME43PrecoFim.Text) <> '' then
        QRVendedorCMedioMes.SetVariable('VAL_TOTAL_FIM', strtofloat(Trim(FNotaSaidaParam.ME43PrecoFim.Text)))
      else
        QRVendedorCMedioMes.SetVariable('VAL_TOTAL_FIM', Null);
      //fim fabiano

      if Trim(FNotaSaidaParam.ME43Filial.Text) = '' then
        QRVendedorCMedioMes.SetVariable('FILIAL', Null)
      else
        QRVendedorCMedioMes.SetVariable('FILIAL', FNotaSaidaParam.ME43Filial.Text);

      if Trim(FNotaSaidaParam.ME43Vendedor.Text) = '' then
        QRVendedorCMedioMes.SetVariable('VENDEDOR', Null)
      else
        QRVendedorCMedioMes.SetVariable('VENDEDOR', FNotaSaidaParam.ME43Vendedor.Text);

      if Trim(FNotaSaidaParam.ME43Supervisor.Text) = '' then
        QRVendedorCMedioMes.SetVariable('SUPERVISOR', Null)
      else
        QRVendedorCMedioMes.SetVariable('SUPERVISOR', FNotaSaidaParam.ME43Supervisor.Text);

      if Trim(FNotaSaidaParam.ME43Cadastro.Text) = '' then
        QRVendedorCMedioMes.SetVariable('COD_CADASTRO', Null)
      else
        QRVendedorCMedioMes.SetVariable('COD_CADASTRO', FNotaSaidaParam.ME43Cadastro.Text);

      if Trim(FNotaSaidaParam.Me43Departamento.Text) = '' then
        QRVendedorCMedioMes.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QRVendedorCMedioMes.SetVariable('COD_DEPARTAMENTO', FNotaSaidaParam.Me43Departamento.Text);

      if Trim(FNotaSaidaParam.Me43Serie.Text) = '' then
        QRVendedorCMedioMes.SetVariable('COD_SERIE', Null)
      else
        QRVendedorCMedioMes.SetVariable('COD_SERIE', FNotaSaidaParam.Me43Serie.Text);

      if Trim(FNotaSaidaParam.Me43Estado.Text) = '' then
        QRVendedorCMedioMes.SetVariable('ESTADO', Null)
      else
        QRVendedorCMedioMes.SetVariable('ESTADO', FNotaSaidaParam.Me43Estado.Text);

      if Trim(FNotaSaidaParam.ME43Operacao.Text) = '' then
      begin
        QRVendedorCMedioMes.SetVariable('IND_VENDAS', 'V');
        QRVendedorCMedioMes.SetVariable('OPERACAO', Null);
      end
      else
      begin
        QRVendedorCMedioMes.SetVariable('IND_VENDAS', Null);
        QRVendedorCMedioMes.SetVariable('OPERACAO', FNotaSaidaParam.ME43Operacao.Text);
      end;
      QRVendedorCMedioMes.Open;

      if FRNota_VendedorCMedioMes = nil then
        FRNota_VendedorCMedioMes := TFRNota_VendedorCMedioMes.Create(Application);

      FRNota_VendedorCMedioMes.QRLTitulo.Caption := 'Vendas por Vendedor/Custo Médio Anual de ' + FNotaSaidaParam.ME43DataI.Text + ' até ' + FNotaSaidaParam.ME43DataF.Text;
      FRNota_VendedorCMedioMes.QRLOperacao.Caption := 'Operação:' + FNotaSaidaParam.Ed43Operacao.Text + ' ' + 'Estado:' + FNotaSaidaParam.Ed43Estado.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_VendedorCMedioMes.QRPrimario.Preview
      else
        FRNota_VendedorCMedioMes.QRPrimario.Print;
      QRVendedorCMedioMes.Close;
    end;
end;

procedure TFNotaSaidaCad.DBEValUnitarioChange(Sender: TObject);
begin
  inherited;
  DMNotaSaida.pDigitou_Desconto := False;
end;

procedure TFNotaSaidaCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FImpostoCons = nil then
    FImpostoCons := TFImpostoCons.create(application);

  if FImpostoCons.showmodal = mrok then
    DMNotaSaida.QNotaImpostoServicoCOD_IMPOSTO.Value := DMImposto.QImpostoConsCOD_IMPOSTO.Value;
end;

procedure TFNotaSaidaCad.PImportaPedidos_Items;
var
  wCodItemNF: Integer;
  wQt_Item_nota: Real;
  wCodAuxiliar, wIpi, wPedido: string;
  cstPis: String;
  cstCofins: String;
  cstIpi: String;
  bibVenda: TBibVenda;
  cclastrib, wRegimeFilial, wClasstrib: String;
begin
  cstPis    := '';
  cstCofins := '';
  cstIPI    := '';
  cclastrib := '';
  wClasstrib := '';
  with DMPedido do
  begin
    DMNotaSaida.QBaixasPed.Close;
    QPedidoItem.Open;
    QPedidoItem.First;
    DMNotaSaida.pTrazPedido := True;
    while not QPedidoItem.Eof do
      with DMNotaSaida do
      begin
        //Quando o produto estava com quantidade zero no pedido, estava importando o produto para a nota venda e não deveria. Vanessa 24/02/2015
        QPedidoItemQT_QUANTIDADE_AUX.Value :=  QPedidoItemQT_PEDIDO.Value
          - QPedidoItemsqt_atendido.Value
          - QPedidoItemQt_Cancelado.Value;
        if QPedidoItemQT_QUANTIDADE_AUX.Value <= 0  then
        begin
          QPedidoItem.Next;
          Continue;
        end;//
        QItemNF.Insert;
          QItemNFQt_Quantidade.Value := QPedidoItemQT_PEDIDO.Value
          - QPedidoItemsqt_atendido.Value
          - QPedidoItemQt_Cancelado.Value;

        QItemNFNUM_PEDIDO_COMPRA.Value := QPedidoItemNUM_PEDIDO_COMPRA.Value;
        QItemNFNUM_PEDIDO_COMPRA_ITEM.Value := QPedidoItemNUM_PEDIDO_COMPRA_ITEM.Value;

        QItemNFDESC_INF_ADICIONAL.Text := QPedidoItemQT_EMBALAGEM.Text +
            ' ' + QPedidoItemDESC_OBS_ITEM.Text; // adicionado a obs do item pedido Junior 31/10/2017(utilizado por casa das tintas).
        QItemNFCod_Cultura.Text := QPedidoItemCod_Cultura.Text;
        QItemNFCod_Lote_Tipo.Value := QPedidoItemCod_Lote_Tipo.Value;
        if (DMParamSistema.CodEmpresa = 'DINIZ') And (DmNotaSaida.QNotaSaidaCOD_FILIAL.Value = 2) Then // esta filial é regime simples (César)
           QItemNFCod_Tributacao.Value := 35
        Else
           QItemNFCod_Tributacao.Value := QPedidoItemCod_Tributacao.Value;
        if FPedidoCons.RGCodigoAuxiliar.ItemIndex = 1 then
        begin
          QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
          QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value;
          QItemNFVal_Unitario_Tabela.Value := QPedidoItemVal_Unitario.Value;
          if QItemNFQt_Quantidade.Value > 0 then
            QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value * QItemNFQt_Quantidade.Value
          else
            QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value;
        end
        else
        begin
          wCodAuxiliar := DMOracle.BuscaNome('SELECT COD_PRODUTO_B FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value));
          if wCodAuxiliar <> '' then
            QItemNFCod_Produto.Value := StrToFloat(wCodAuxiliar)
          else
            QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
          QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value / 2;
          QItemNFVal_Total.Value := (QPedidoItemVal_Unitario.Value * QItemNFQt_Quantidade.Value) / 2;
        end;
        if QPedidoItemCOD_CFOP.Text <> '' then
          QItemNFCOD_CFOP.Value := QPedidoItemCOD_CFOP.Value;
        if (DMParamSistema.CodEmpresa = 'INJEPAR') then
          QItemNFPerc_Desconto.Value := QPedidoItemPerc_Comissao.Value
        else
          QItemNFPerc_Desconto.Value := QPedidoItemPerc_Desconto.Value;
        QItemNFPerc_Comissao.Value := QPedidoItemPerc_Comissao.Value;
        //comissao pre_posto para um segundo vendedor. Neo Ali. Junior 12/06/2014
        QItemNFPERC_COMISSAO_PREPOSTO.Value := QPedidoItemPERC_COMISSAO_PREPOSTO.Value;
        wIpi := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCod_Produto.Text);

        if wIpi <> '' then
          QItemNFPerc_Ipi.Value := StrToFloat(wIpi);
        wCodItemNF := QItemNFCod_Nota_Item.Value;
        wQt_Item_nota := QItemNFQt_Quantidade.Value;

        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK', QNotaSaidaCOD_OPERACAO.Value);
        DMOperacao.QOperacao.Open;

        cstPis := Trim(DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ DMNotaSaida.QItemNFCOD_PRODUTO.Text));
        if trim(DMOperacao.QOperacaoCOD_CST_PIS.Value) <> '' then
          cstPis := DMOperacao.QOperacaoCOD_CST_PIS.Value;
        if CstPis <> '' then
        begin
          FNotaSaidaCad.DBLCCSTPis.KeyValue := cstPis;
          QItemNFCOD_CST_PIS.Value := cstPis;
          DBLCCSTPis.KeyValue := cstPis;
        end;

        cstCofins := Trim(DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ DMNotaSaida.QItemNFCOD_PRODUTO.Text));
        if trim(DMOperacao.QOperacaoCOD_CST_COFINS.Value) <> '' then
          cstCofins := DMOperacao.QOperacaoCOD_CST_COFINS.Value;
        if cstCofins <> '' then
        begin
          FNotaSaidaCad.DBLCCSTCofins.KeyValue := cstCofins;
          QItemNFCOD_CST_COFINS.Value := cstCofins;
          DBLCCSTCofins.KeyValue := cstCofins;
        end;
        //NÃO ESTAVA PUXANDO O CST_IPI  PELA IMPORTAÇÃO DO PEDIDO - JUNIOR-07/11/2016 (Solicitação Marta - Zorzinco)
        cstIpi := Trim(DMOracle.BuscaNome('SELECT COD_CST_IPI_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ DMNotaSaida.QItemNFCOD_PRODUTO.Text));
        if cstIpi <> '' then
        begin
          FNotaSaidaCad.DBLCCstIpi.KeyValue := cstIpi;
          QItemNFCOD_CST_IPI.Value := cstIpi;
          DBLCCstIpi.KeyValue := cstIpi;
        end;
        {Para trazer o Cclastrib da operação ou do produto. Alex 18/09/2026}
        wRegimeFilial := Trim(DMOracle.BuscaNome('SELECT IND_REGIME_TRIBUTARIO FROM TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text));
        if wRegimeFilial = '3' then
        begin
          wClasstrib := DMOracle.BuscaNome('SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_OPERACAO','COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
          if wClasstrib = '' then
            wClasstrib := DMOracle.BuscaNome('SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_PRODUTO','COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text);
          if wClasstrib <> '' then
          begin
            cclastrib := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS','COD_CLASS_TRIB = ' +  wClasstrib);
            FNotaSaidaCad.DBLCCClasTribIBSCBSVenda.KeyValue := cclastrib;
            QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := cclastrib;
            DBLCCClasTribIBSCBSVenda.KeyValue := cclastrib;
          end
          else
              Raise Exception.Create ('Produto e operação sem o CCLASTRIB informado. Favor verificar qual o CClastrib com seu contador qual deve ser o Cclastrib para esta nota.!')
        end;

        if not QPedidoItemCOD_TABELA_PRECO_CAB.IsNull then
          QItemNFCOD_TABELA_PRECO_CAB.Value := QPedidoItemCOD_TABELA_PRECO_CAB.Value;

        // Personalizações
        bibVenda := TBibVenda.Create;
        bibVenda.PersonalizaDados(QItemNF, QNotaSaida, QNotaSaidaCOD_FILIAL.Value);
        FNotaSaidaCad.DBLCCstIpi.KeyValue := QItemNFCOD_CST_IPI.Value;

        QItemNF.Post;
        QAtuBaixaPed.Open;
        QAtuBaixaPed.Insert;
        QAtuBaixaPedCod_Nota_Item.Value := wCodItemNF;
        QAtuBaixaPedCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
        QAtuBaixaPedQt_Baixa.Value := wQt_Item_nota;
        QAtuBaixaPedCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QAtuBaixaPed.Post;
        QAtuBaixaPed.Close;
        QAtuDtFatura_Ped.Close;
        QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB', QPedidoItemCod_Pedido_Cab.Value);
        QAtuDtFatura_Ped.Open;
        QAtuDtFatura_Ped.Edit;
        QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
        QAtuDtFatura_PedCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QAtuDtFatura_Ped.Post;
        QAtuDtFatura_Ped.Close;
        // Itens de Pedidos atualizados nos eventos da query
        QPedidoItem.Next;
      end;
    with DMNotaSaida do
    begin
      QAtuBaixaPed.Close;
      QItemNF.Close;
      QPedidoItem.Close;
      QItemNF.Open;
      QBaixasPed.Open;
      QPedidoItem.Open;
    end;
    QPedido.Close;
    QPedidoItem.Close;
  end;
  DMNotaSaida.GerenciaItensPorLote;
  DMNotaSaida.pTrazPedido := False;
end;

{procedure TFNotaSaidaCad.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = ' ' then
    Key := #0;
end;}

procedure TFNotaSaidaCad.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //  If Key = #13 Then
  //     Key := #0;
  Key := AnsiUpperCase( Key )[1]; // Charcase Upper
end;

procedure TFNotaSaidaCad.MapaVenda21Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[1].TabVisible := True;
  if (not DMUsuario.Privilegiado) and
    (DMusuario.CodVendedorPadrao <> 0) then
  begin
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.BtVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  end;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text), 'VENDA');
      if FNotaSaidaParam.RGTipo.ItemIndex = 1 then // Analítico
      begin
        QRMapaVenda2.Close;
        QRMapaVenda2.SetVariable('DATA_I', FNotaSaidaParam.ME1DataI.Text);
        QRMapaVenda2.SetVariable('DATA_F', FNotaSaidaParam.ME1DataF.Text + ' 23:59:59');

        if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text) = '' then
          QRMapaVenda2.SetVariable('FILIAL', Null)
        else
          QRMapaVenda2.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text));
        //Alterado para buscar vários vendedores  separados por virgula Solicitado por Nestor(Deion) - Marcos - Cleber-08/06/2019
        if Trim(FNotaSaidaParam.Me1CodVendedor.Text) = '' then
          QRMapaVenda2.SetVariable('VENDEDOR', '1=1')
        else
          QRMapaVenda2.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me1CodVendedor.Text) +  ')');;
        if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text) = '' then
          QRMapaVenda2.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRMapaVenda2.SetVariable('VENDEDOR_PREPOSTO', Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text));
        if Trim(FNotaSaidaParam.Me1Produto.Text) = '' then
          QRMapaVenda2.SetVariable('COD_PRODUTO', '1 = 1')
        else
          QRMapaVenda2.SetVariable('COD_PRODUTO', 'Tb_Nota_item.Cod_Produto in (' + Trim(FNotaSaidaParam.Me1Produto.Text)+')');
        if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text) = '' then
          QRMapaVenda2.SetVariable('FORNECEDOR', Null)
        else
          QRMapaVenda2.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text) = '' then
          QRMapaVenda2.SetVariable('COD_CADASTRO', Null)
        else
          QRMapaVenda2.SetVariable('COD_CADASTRO', Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text) = '' then
          QRMapaVenda2.SetVariable('COD_CULTURA', Null)
        else
          QRMapaVenda2.SetVariable('COD_CULTURA', Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
        if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text) = '' then
          QRMapaVenda2.SetVariable('ESTADO', Null)
        else
          QRMapaVenda2.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
        if Trim(FNotaSaidaParam.ME2Classe.Text) = '' then
          QRMapaVenda2.SetVariable('CLASSE', Null)
        else
          QRMapaVenda2.SetVariable('CLASSE', FNotaSaidaParam.ME2Classe.Text);

        if (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '0') then
          QRMapaVenda2.SetVariable('SUBCLASSE', Null)
        else
          QRMapaVenda2.SetVariable('SUBCLASSE', FNotaSaidaParam.ME2Subclasse.Text);
        if Trim(FNotaSaidaParam.Me1Operacao.Text) <> '' then
        begin
          QRMapaVenda2.SetVariable('OPERACAO', Null);
          QRMapaVenda2.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Operacao.Text))+')');
        end
        else
        begin
          QRMapaVenda2.SetVariable('OPERACAO', 'V');
          QRMapaVenda2.SetVariable('COD_OPERACAO', '1=1');
        end;
        case FNotaSaidaParam.RgProducao.ItemIndex of
          0: QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO', 'PROPRIA');
          1: QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO', 'TERCEIROS');
          2: QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO', Null);
        end;
        case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
          0: QRMapaVenda2.SetVariable('TIPO_PAGTO', '1');
          1: QRMapaVenda2.SetVariable('TIPO_PAGTO', '2');
          2: QRMapaVenda2.SetVariable('TIPO_PAGTO', '3');
          3: QRMapaVenda2.SetVariable('TIPO_PAGTO', '4');
          4: QRMapaVenda2.SetVariable('TIPO_PAGTO', '5');
          5: QRMapaVenda2.SetVariable('TIPO_PAGTO', '6');
          6: QRMapaVenda2.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)');//débito e crédito
          7: QRMapaVenda2.SetVariable('TIPO_PAGTO', Null);
        end;

        QRMapaVenda2.Open;
        if FRNota_MapaVenda2 = nil then
          FRNota_MapaVenda2 := TFRNota_MapaVenda2.Create(Application);
        FRNota_MapaVenda2.QRLTitulo.Caption := 'Mapa de Vendas de ' + FNotaSaidaParam.ME1DataI.Text + ' até ' + FNotaSaidaParam.ME1DataF.Text;
       { if Trim(FNotaSaidaParam.FmVendedor2.EdVendedor.Text) <> '' then
          FRNota_MapaVenda2.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.FmVendedor2.EdVendedor.Text + ' '
        else
          FRNota_MapaVenda2.QRLVendedor_Oper.Caption := 'Rep.Comercial: Todos  ';  }
        FRNota_MapaVenda2.QRLFornecedor.Caption := 'Fornecedor: ' + FNotaSaidaParam.FmFornecedor2.EdCadastro.Text + ' Cliente:' + FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
        if Trim(FNotaSaidaParam.ME1Operacao.Text) <> '' then
          FRNota_MapaVenda2.QRLVendedor_Oper.Caption := FRNota_MapaVenda2.QRLVendedor_Oper.Caption + 'Operacao: ' + FNotaSaidaParam.ME1Operacao.Text + ' '
        else
          FRNota_MapaVenda2.QRLVendedor_Oper.Caption := FRNota_MapaVenda2.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';

        if not FNotaSaidaParam.CBCusto2.Checked then
         begin
           FRNota_MapaVenda2.QRLCusto.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRDBTCusto.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRExprCusto.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRLLucro.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRExprLucro.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRExprSumLucro.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVenda2.QRLCusto.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRDBTCusto.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRExprCusto.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRLLucro.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRExprLucro.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRExprSumLucro.Font.Color := clWindowText;
         end;

        if not FNotaSaidaParam.CBTotal2.Checked then
         begin
           FRNota_MapaVenda2.QRLTotal.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRDBTTotal.Font.Color := ClWindow;
           FRNota_MapaVenda2.QRExprTotal.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVenda2.QRLTotal.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRDBTTotal.Font.Color := clWindowText;
           FRNota_MapaVenda2.QRExprTotal.Font.Color := clWindowText;
         end;

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_MapaVenda2.QRPrimario.Preview
        else
          FRNota_MapaVenda2.QRPrimario.Print;
        QRMapaVenda2.Close;
      end
      else // **** Resumido
      begin
        QRMapaVendaRes2.Close;
        QRMapaVendaRes2.SetVariable('DATA_I', FNotaSaidaParam.ME1DataI.Text);
        QRMapaVendaRes2.SetVariable('DATA_F', FNotaSaidaParam.ME1DataF.Text + ' 23:59:59');

        if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text) = '' then
          QRMapaVendaRes2.SetVariable('FILIAL', Null)
        else
          QRMapaVendaRes2.SetVariable('FILIAL', FNotaSaidaParam.FmFilial2.MeFilial.Text);

        if Trim(FNotaSaidaParam.Me1CodVendedor.Text) = '' then
          QRMapaVendaRes2.SetVariable('VENDEDOR', '1=1')
        else
          QRMapaVendaRes2.SetVariable('VENDEDOR', 'TB_NOTA_CAB.COD_VENDEDOR IN (' + TRIM(FNotaSaidaParam.Me1CodVendedor.Text) +  ')');
        if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text) = '' then
          QRMapaVendaRes2.SetVariable('VENDEDOR_PREPOSTO', Null)
        else
          QRMapaVendaRes2.SetVariable('VENDEDOR_PREPOSTO', FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text);
        if Trim(FNotaSaidaParam.Me1Produto.Text) = '' then
          QRMapaVendaRes2.SetVariable('COD_PRODUTO', '1 = 1')
        else
          QRMapaVendaRes2.SetVariable('COD_PRODUTO', 'Tb_Nota_item.Cod_Produto in (' + Trim(FNotaSaidaParam.Me1Produto.Text)+')');
        if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text) = '' then
          QRMapaVendaRes2.SetVariable('FORNECEDOR', Null)
        else
          QRMapaVendaRes2.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text) = '' then
          QRMapaVendaRes2.SetVariable('COD_CADASTRO', Null)
        else
          QRMapaVendaRes2.SetVariable('COD_CADASTRO', Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
        if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text) = '' then
          QRMapaVendaRes2.SetVariable('COD_CULTURA', Null)
        else
          QRMapaVendaRes2.SetVariable('COD_CULTURA', Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
        if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text) = '' then
          QRMapaVendaRes2.SetVariable('ESTADO', Null)
        else
          QRMapaVendaRes2.SetVariable('ESTADO', Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
        if Trim(FNotaSaidaParam.ME2Classe.Text) = '' then
          QRMapaVendaRes2.SetVariable('CLASSE', Null)
        else
          QRMapaVendaRes2.SetVariable('CLASSE', FNotaSaidaParam.ME2Classe.Text);

        if (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME2Subclasse.Text) = '0') then
          QRMapaVendaRes2.SetVariable('SUBCLASSE', Null)
        else
          QRMapaVendaRes2.SetVariable('SUBCLASSE', FNotaSaidaParam.ME2Subclasse.Text);
        if Trim(FNotaSaidaParam.Me1Operacao.Text) <> '' then
        begin
          QRMapaVendaRes2.SetVariable('OPERACAO', Null);
          QRMapaVendaRes2.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.ME1Operacao.Text))+')');
        end
        else
        begin
          QRMapaVendaRes2.SetVariable('OPERACAO', 'V');
          QRMapaVendaRes2.SetVariable('COD_OPERACAO', '1=1');
        end;
        case FNotaSaidaParam.RgProducao.ItemIndex of
          0: QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO', 'PROPRIA');
          1: QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO', 'TERCEIROS');
          2: QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO', Null);
        end;
        case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
          0: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '1');
          1: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '2');
          2: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '3');
          3: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '4');
          4: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '5');
          5: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', '6');
          6: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', 'TB_NOTA_CAB.IND_CONDICAO_PAGTO IN (4,5)');//débito e crédito
          7: QRMapaVendaRes2.SetVariable('TIPO_PAGTO', Null);
        end;
        QRMapaVendaRes2.Open;
        if FRNota_MapaVendaRes2 = nil then
           FRNota_MapaVendaRes2 := TFRNota_MapaVendaRes2.Create(Application);
        FRNota_MapaVendaRes2.QRLTitulo.Caption := 'Mapa de Vendas de ' + FNotaSaidaParam.ME1DataI.Text + ' até ' + FNotaSaidaParam.ME1DataF.Text;
        //FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption := 'Rep.Comercial: ' + FNotaSaidaParam.FmVendedor2.EdVendedor.Text + ' ';
        FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption + 'Operacao: ' + FNotaSaidaParam.ME1Operacao.Text + ' ';
        FRNota_MapaVendaRes2.QRLFornecedor.Caption := 'Fornecedor: ' + FNotaSaidaParam.FmFornecedor2.EdCadastro.Text + ' Cliente:' + FNotaSaidaParam.FmCadastro2.EdCadastro.Text;

        if not FNotaSaidaParam.CBCusto2.Checked then
         begin
           FRNota_MapaVendaRes2.QRLCusto.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRDBCusto.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRExprCusto.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRLLucro.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRExprLucro.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRExprSumLucro.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVendaRes2.QRLCusto.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRDBCusto.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRExprCusto.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRLLucro.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRExprLucro.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRExprSumLucro.Font.Color := clWindowText;
         end;

        if not FNotaSaidaParam.CBTotal2.Checked then
         begin
           FRNota_MapaVendaRes2.QRLTotal.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRDBTTotal.Font.Color := ClWindow;
           FRNota_MapaVendaRes2.QRExprTotal.Font.Color := ClWindow;
         end
        Else
         begin
           FRNota_MapaVendaRes2.QRLTotal.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRDBTTotal.Font.Color := clWindowText;
           FRNota_MapaVendaRes2.QRExprTotal.Font.Color := clWindowText;
         end;

        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_MapaVendaRes2.QRPrimario.Preview
        else
          FRNota_MapaVendaRes2.QRPrimario.Print;
        QRMapaVendaRes2.Close;
      end;
    end;
end;

procedure TFNotaSaidaCad.RelaoProdutosporCultura1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then // FOI RETIRADO A BONIFICAÇÃO DESTE REL. A PEDIDO DO MAYCON(MOINHO)
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application); //"bonificação que naõ tem cultura entao cara para não consertar todas"
  FNotaSaidaParam.PGRelatorio.Pages[44].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.Fm44Filial.MeFilial.Text), 'VENDA');

      QrProdutoCultura.Close;
      if ((FnotaSaidaParam.ME44DtInicial.text = '') or (FnotaSaidaParam.ME44DtFinal.text = '')) then
        raise Exception.Create('Informe o Período desejado');
      QRProdutoCultura.SetVariable('DT_INICIAL', FNotaSaidaParam.ME44DtInicial.Text);
      QRProdutoCultura.SetVariable('DT_FINAL', FNotaSaidaParam.ME44DtFinal.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.Fm44Filial.MeFilial.Text) = '' then
        QRProdutoCultura.SetVariable('FILIAL', Null)
      else
        QRProdutoCultura.SetVariable('FILIAL', FNotaSaidaParam.Fm44Filial.MeFilial.Text);

      if Trim(FNotaSaidaParam.Fm44Cadastro.MeCadastro.Text) = '' then
        QRProdutoCultura.SetVariable('CADASTRO', Null)
      else
        QRProdutoCultura.SetVariable('CADASTRO', FNotaSaidaParam.Fm44Cadastro.MeCadastro.Text);

      if Trim(FNotaSaidaParam.Fm44Operacao.MeOperacao.Text) = '' then
        QRProdutoCultura.SetVariable('OPERACAO', Null)
      else
        QRProdutoCultura.SetVariable('OPERACAO', FNotaSaidaParam.Fm44Operacao.MeOperacao.Text);

      if Trim(FNotaSaidaParam.Fm44Produto.MeProduto.Text) = '' then
        QRProdutoCultura.SetVariable('PRODUTO', Null)
      else
        QRProdutoCultura.SetVariable('PRODUTO', FNotaSaidaParam.Fm44Produto.MeProduto.Text);

      if Trim(FNotaSaidaParam.Fm44Fornecedor.MeCadastro.Text) = '' then
        QRProdutoCultura.SetVariable('FORNECEDOR', Null)
      else
        QRProdutoCultura.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.Fm44Fornecedor.MeCadastro.Text));

      if Trim(FNotaSaidaParam.Fm44Vendedor.MeVendedor.Text) = '' then
        QRProdutoCultura.SetVariable('VENDEDOR', Null)
      else
        QRProdutoCultura.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.Fm44Vendedor.MeVendedor.Text));

      if Trim(FNotaSaidaParam.Fm44Cultura.MeCultura.Text) = '' then
        QRProdutoCultura.SetVariable('CULTURA', Null)
      else
        QRProdutoCultura.SetVariable('CULTURA', Trim(FNotaSaidaParam.Fm44Cultura.MeCultura.Text));

      if Trim(FNotaSaidaParam.Fm44Marca.MeMarca.Text) = '' then
        QRProdutoCultura.SetVariable('MARCA', Null)
      else
        QRProdutoCultura.SetVariable('MARCA', Trim(FNotaSaidaParam.Fm44Marca.MeMarca.Text));

      if Trim(FNotaSaidaParam.Me44Classificacao.Text) = '' then
        QRProdutoCultura.SetVariable('CLASSIFICACAO', Null)
      else
        QRProdutoCultura.SetVariable('CLASSIFICACAO', FNotaSaidaParam.Me44Classificacao.Text);

      if Trim(FNotaSaidaParam.Me44Classe.Text) = '' then
        QRProdutoCultura.SetVariable('CLASSE', Null)
      else
        QRProdutoCultura.SetVariable('CLASSE', FNotaSaidaParam.Me44Classe.Text);

      if (Trim(FNotaSaidaParam.Me44SubClasse.Text) = '') or
        (Trim(FNotaSaidaParam.Me44SubClasse.Text) = '0') then
        QRProdutoCultura.SetVariable('SUBCLASSE', Null)
      else
        QRProdutoCultura.SetVariable('SUBCLASSE', FNotaSaidaParam.Me44SubClasse.Text);

      case FNotaSaidaParam.Rg44TipoNota.ItemIndex of
        0: QRProdutoCultura.SetVariable('TIPO_NOTA', 'E');
        1: QRProdutoCultura.SetVariable('TIPO_NOTA', 'S');
        2: QRProdutoCultura.SetVariable('TIPO_NOTA', Null);
      end;
      case FNotaSaidaParam.RG44TipoPagto.ItemIndex of
        0: QRProdutoCultura.SetVariable('TIPO_PAGTO', '1');
        1: QRProdutoCultura.SetVariable('TIPO_PAGTO', '2');
        2: QRProdutoCultura.SetVariable('TIPO_PAGTO', '3');
        3: QRProdutoCultura.SetVariable('TIPO_PAGTO', Null);
      end;

      QRProdutoCultura.Open;

      if FRProdutoCultura = nil then
        FRProdutoCultura := TFRProdutoCultura.Create(Application);
      FRProdutoCultura.QRLFilial.Caption := 'Filial:' + FNotaSaidaParam.Fm44Filial.EdFilial.Text + '   Cliente:' + FNotaSaidaParam.Fm44Cadastro.EdCadastro.Text;
      FRProdutoCultura.QRLCultura.Caption := 'Cultura: ' + FnotaSaidaParam.Fm44Cultura.EdCultura.Text + '  Produto: ' + FNotaSaidaParam.Fm44Produto.EdProduto.Text;
      FRProdutoCultura.QRLVendedor.Caption := 'Vendedor:' + FNotaSaidaParam.Fm44Vendedor.EdVendedor.Text + '   Fornecedor:' + FNotaSaidaParam.Fm44Fornecedor.EdCadastro.Text;
      FRProdutoCultura.QRLPeriodo.Caption := 'Classe/Subclasse: ' + FNotaSaidaParam.ME44Classe.Text + '/' + FNotaSaidaParam.ME44SubClasse.Text +
        FNotaSaidaParam.Ed44Classe.Text + '  Operação: ' + FNotaSaidaParam.Fm44Operacao.EdOperacao.Text +
        '  Período : ' + FNotaSaidaParam.ME44DtInicial.Text + ' Até ' + FNotaSaidaParam.ME44DtFinal.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRProdutoCultura.QRPrimario.Preview
      else
        FRProdutoCultura.QRPrimario.Print;
      QRProdutoCultura.Close;
    end;

end;

procedure TFNotaSaidaCad.MostraNmeroEmbarque1Click(Sender: TObject);
begin
  inherited;
  DMEmbarque.QNotaEmbarque.Close;
  DMEmbarque.QNotaEmbarque.SetVariable('Nota', DMNotaSaida.QNotaSaidaNum_Nota.Value);
  DMEmbarque.QNotaEmbarque.SetVariable('Dt_Recebimento', DMNotaSaida.QNotaSaidaDt_Recebimento.Value);
  DMEmbarque.QNotaEmbarque.Open;
  if not (DMEmbarque.QNotaEmbarque.Eof) then
    ShowMessage('Embarque Número: ' + DMEmbarque.QNotaEmbarqueCod_Embarque.Text)
  else
    ShowMessage('Nota Sem Embarque');
  DMEmbarque.QNotaEmbarque.Close;
end;

procedure TFNotaSaidaCad.DBEClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 123 then //123 = F12
    BtConsCadastro.Click;
end;

procedure TFNotaSaidaCad.EmissoCpiaNotasIntervalo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then // FOI RETIRADO A BONIFICAÇÃO DESTE REL. A PEDIDO DO MAYCON(MOINHO)
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application); //"bonificação que naõ tem cultura entao cara para não consertar todas"
  FNotaSaidaParam.PGRelatorio.Pages[45].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMNotaSaida do
    begin
      QCopiaNota.Close;
      if ((FnotaSaidaParam.Me45DtInicio.text = '') or (FnotaSaidaParam.Me45DtFim.text = '')) then
        raise Exception.Create('Informe o Período desejado');
      if ((FnotaSaidaParam.Me45NotaInicio.text = '') or (FnotaSaidaParam.Me45NotaFim.text = '')) then
        raise Exception.Create('Informe o Numero de Notas Desejado');
      QCopiaNota.SetVariable('DT_INICIO', FNotaSaidaParam.Me45DtInicio.Text);
      QCopiaNota.SetVariable('DT_FIM', FNotaSaidaParam.Me45DtFim.Text);

      QCopiaNota.SetVariable('NUMERO_I', Trim(FnotaSaidaParam.Me45NotaInicio.Text));
      QCopiaNota.SetVariable('NUMERO_F', Trim(FnotaSaidaParam.Me45NotaFim.Text));
      QCopiaNota.Open;
      while not (QCopiaNota.eof) do
      begin
        if QCopiaNotaInd_Entrada_Saida.Value = 'E' then
        begin
          DMNotaEntrada.QNotaEntrada.Close;
          DMNotaEntrada.QNotaEntrada.SetVariable('Pk', QCopiaNotaCod_Nota_Cab.Value);
          DMNotaEntrada.QNotaEntrada.Open;
          DMNotaEntrada.QItemNF.Close;
          DMNotaEntrada.QItemNF.open;
          DMNotaEntrada.QSomaItemNota.Close;
          DMNotaEntrada.QSomaItemNota.Open;
        end;

        FNotaImpressao.EmiteNF(QCopiaNotaCod_Nota_Cab.Value);
        QCopiaNota.Next;
      end;
      QCopiaNota.Close;
    end;
end;

procedure TFNotaSaidaCad.Proc_TrazItens(wCod_Nota_Cab: Integer);
var cstPis, cstCofins, cstIpi: string;
begin
  if DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO',
    'COD_OPERACAO = ' + FloatToStr(DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value), True) = 'D' then
  begin // Atualmente, este bloco deve ser o único, mas veja o comentário mais abaixo para entender o porque deste IF aqui. Diego Stiehl (08/12/2011)
    Application.CreateForm(TFDevolucaoCarregaItens, FDevolucaoCarregaItens);
    if FDevolucaoCarregaItens.carrega(DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value) = MrOK then
      with DMNotaEntrada do
        with DMNotaSaida do
        begin
          if (Trim(QNotaEntradaConsDESC_CHAVE_ACESSO.Value) = '') and
          ((QNotaEntradaconsCOD_SERIE_MODELO.Value = '55') or (QNotaEntradaconsCOD_SERIE_MODELO.Value = '65')) then
          begin
            raise Exception.Create('A nota referenciada precisa ter chave de acesso.');
            Exit;
          end;
          if not((QNotaEntradaConsCOD_SERIE_MODELO.Value = '55') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '65') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '01') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '02') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '04') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2B') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2C') or
             (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2D')) and
             (QNotaSaidaCOD_SERIE_MODELO.Value = '55') then
          begin
            MessageDlg('A nota referenciada precisa ser de algum desses modelos: 55, 65, 01, 04, 2B, 2C e 2D.', mtError, [mbOK],0);
            Exit;
          end;
          try
            if QNotaSaida.State = dsInsert then
            begin
              QNotaSaida.Post;
              QNotaSaida.Edit;
            end;
            try
              QNotaReferenciada.Insert;
              QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
              QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNotaEntradaConsCOD_NOTA_CAB.Value;
              QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNotaEntradaConsDESC_CHAVE_ACESSO.Value);
              QNotaReferenciadaNUM_NOTA.Value := QNotaEntradaConsNUM_NOTA.AsInteger;
              QNotaReferenciadaCOD_SERIE.Value := QNotaEntradaConsCOD_SERIE.Value;
              QNotaReferenciadaCOD_SERIE_MODELO.Value := QNotaEntradaConsCOD_SERIE_MODELO.Value;
              QNotaReferenciadaDT_EMISSAO.Value := QNotaEntradaConsDT_EMISSAO.Value;
              QNotaReferenciada.Post;
            except
              QNotaReferenciada.Cancel;
            end;
            with FDevolucaoCarregaItens do
            begin
              CdItensDevolucao.First;
              while not CdItensDevolucao.Eof do
              begin
                if CdItensDevolucaoIND_MARCADO.Value = 'S' then
                begin
                  QItemNF.Append;
                  QItemNFQT_QUANTIDADE.Value := CdItensDevolucaoQT_QUANTIDADE.Value;
                  QItemNFCod_Lote_Tipo.Value := CdItensDevolucaoCod_Lote_Tipo.Value;
                  QItemNFCod_Produto.Value := CdItensDevolucaoCod_Produto.Value;
                  QItemNFCod_Tributacao.Value := CdItensDevolucaoCod_Tributacao.Value;
                  QItemNFPerc_Comissao.Value := CdItensDevolucaoPerc_Comissao.Value;
                  QItemNFVal_Custo.Value := CdItensDevolucaoVal_Custo.Value;
                  QItemNFCod_Cultura.Value := CdItensDevolucaoCod_Cultura.Value;

                  //quando fazia nota de devolução não puxava cst de pis/cofins/ipi - Vanessa 16/11/2016
                  cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS FROM TB_OPERACAO', 'COD_OPERACAO = '+
                    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
                  if cstPis = '' then
                    cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
                      DMNotaSaida.QItemNFCOD_PRODUTO.Text);
                  if(cstPis <> '') then
                  begin
                    FNotaSaidaCad.DBLCCSTPis.KeyValue := cstPis;
                    QItemNFCOD_CST_PIS.Value := cstPis;
                  end;
                  cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS FROM TB_OPERACAO', 'COD_OPERACAO = '+
                    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
                  if cstCofins = '' then
                    cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
                      DMNotaSaida.QItemNFCOD_PRODUTO.Text);
                  if cstCofins <> '' then
                  begin
                    FNotaSaidaCad.DBLCCSTCofins.KeyValue := cstCofins;
                    QItemNFCOD_CST_COFINS.Value := cstCofins;
                  end;

                  cstIpi := Trim(DMOracle.BuscaNome('SELECT COD_CST_IPI_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ DMNotaSaida.QItemNFCOD_PRODUTO.Text));
                  if cstIpi <> '' then
                  begin
                    FNotaSaidaCad.DBLCCstIpi.KeyValue := cstIpi;
                    QItemNFCOD_CST_IPI.Value := cstIpi;
                    DBLCCstIpi.KeyValue := cstIpi;
                  end;
                  //Até aqui - Vanessa 16/11/2016
                
                  if (CdItensDevolucaoVal_Desconto.Value > 0) then
                    QItemNFVal_Unitario.Value := CdItensDevolucaoVal_Unitario.Value - CdItensDevolucaoVal_Desconto.Value
                  else
                    QItemNFVal_Unitario.Value := CdItensDevolucaoVal_Unitario.Value;
                  QItemNFVAL_ICMS_SUBST.Value := CdItensDevolucaoVAL_ICMS_SUBST.Value;
                  QItemNFVAL_BASE_SUBST.Value := CdItensDevolucaoVAL_BASE_SUBST.Value;
                  QItemNFVAL_ICM_BASE.Value := CdItensDevolucaoVAL_ICM_BASE.Value;
                  QItemNFVAL_ICM.Value := CdItensDevolucaoVAL_ICM.Value;
                  QItemNFCod_Nota_Item_Origem.Value := CdItensDevolucaoCod_Nota_Item.Value;
                  QItemNF.Post;
                end;
                CdItensDevolucao.Next;
              end;
            end;
            QNotaSaidaObs.Value := 'DEV. REF. NF. NR. ' + QNotaEntradaConsNUM_NOTA.Text + ' De ' + QNotaEntradaConsDT_EMISSAO.Text;
          except
            if QNotaReferenciada.State in [DsEdit, DsInsert] then
              QNotaReferenciada.Cancel;
          end;
        end;
  end
  else
  begin // O bloco abaixo contém o código antigo da procedure. Foi necessário por motivo da reutilização desta função em casos NÃO-devolução. Diego Stiehl (08/12/2011)
    with DMNotaSaida do
    begin
      QItemNfCons.Close;
      QItemNfCons.SetVariable('COD_NOTA_CAB', wCod_Nota_Cab);
      QItemNfCons.Open;
      QItemNfCons.First;
      DMNotaSaida.pTrazPedido := True;
      while not QItemNfCons.Eof do
        with DMNotaSaida do
        begin
          QItemNF.Insert;
          QItemNFCod_Produto.Value := QItemNfConsCod_Produto.Value;
          if QNotaSaidaConsVal_Desconto.Value > 0 then
            QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value - (QItemNfConsVAL_DESCONTO_RATEIO.Value / QItemNfConsQt_Quantidade.Value)
          else
            QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value;
          QItemNFVal_Unitario_Tabela.Value := QItemNFVal_Unitario.Value;
          QItemNFQt_Quantidade.Value := QItemNfConsQt_Quantidade.Value;
          QItemNFVal_Desconto.Value := QItemNfConsVal_Desconto.Value;
          QItemNFCod_Tributacao.Value := QItemNfConsCod_Tributacao.Value;
          QItemNFPerc_Comissao.Value := QItemNfConsPerc_Comissao.Value;
          QItemNFCod_cultura.Value := QItemNFConsCod_Cultura.Value;
          QItemNFCod_Nota_Item_Origem.Value := QItemNFConsCod_Nota_Item.Value;
          //Vanessa 17/08/2015
          QItemNFCOD_LOTE_TIPO.Value := QItemNfConsCOD_LOTE_TIPO.Value;
          QItemNFCOD_CFOP.TEXT := Bib.ift(QItemNfConsNUM_NATUREZA_EST_NOVO.Value = 5929,
            '', QItemNfConsCOD_CFOP.TEXT);
          QItemNFDESC_INF_ADICIONAL.Value := QItemNfConsDESC_INF_ADICIONAL.Value;

          cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS FROM TB_OPERACAO', 'COD_OPERACAO = '+
            DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
          if cstPis = '' then
            cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
              DMNotaSaida.QItemNFCOD_PRODUTO.Text);
          if(cstPis <> '') then
          begin
            FNotaSaidaCad.DBLCCSTPis.KeyValue := cstPis;
            QItemNFCOD_CST_PIS.Value := cstPis;
          end;

          cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS FROM TB_OPERACAO', 'COD_OPERACAO = '+
            DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
          if cstCofins = '' then
            cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
              DMNotaSaida.QItemNFCOD_PRODUTO.Text);
          if cstCofins <> '' then
          begin
            FNotaSaidaCad.DBLCCSTCofins.KeyValue := cstCofins;
            QItemNFCOD_CST_COFINS.Value := cstCofins;
          end;

          QItemNFCOD_CST_IPI.Value := QItemNfConsCOD_CST_IPI.Value;
          QItemNF.Post;
          //Vanessa
          // Itens de Ordem de Compra atualizados nos eventos da query
          QItemNfCons.Next;
        end;
      QItemNfCons.Close;
      DMNotaSaida.pTrazPedido := False;
      if DMOracle.BuscaNome('SELECT Ind_Compras FROM TB_OPERACAO',
        'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True) = 'D' then // serve para colocar a msg de nota fiscal de devolucao no cabecalho
        QNotaSaidaObs.Value := 'DEV. REF. NF. NR. ' + DMNotaEntrada.QNotaEntradaConsNum_Nota.Text + ' De ' + DMNotaEntrada.QNotaEntradaConsDt_Emissao.Text;
      if DMOracle.BuscaNome('SELECT Ind_Futura_Cliente FROM TB_OPERACAO',
        'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True) = 'S' then // serve para colocar a msg de nota fiscal de Simples remessa no cabecalho
      begin
        QNotaReferenciada.Insert;
        QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
        QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNotaSaidaConsCOD_NOTA_CAB.Value;
        QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNotaSaidaConsDESC_CHAVE_ACESSO.Value);
        QNotaReferenciadaNUM_NOTA.Value := QNotaSaidaConsNUM_NOTA.AsInteger;
        QNotaReferenciadaCOD_SERIE.Value := QNotaSaidaConsCOD_SERIE.Value;
        QNotaReferenciadaCOD_SERIE_MODELO.Value := QNotaSaidaConsCOD_SERIE_MODELO.Value;
        QNotaReferenciadaDT_EMISSAO.Value := QNotaSaidaConsDT_EMISSAO.Value;
        QNotaReferenciada.Post;
        QNotaSaidaObs.Value := 'simples remessa ref. nf de venda futura ' + DMNotaSaida.QNotaSaidaConsNum_Nota.Text + ' De ' + DMNotaSaida.QNotaSaidaConsDt_Emissao.Text;
      end;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtNotaCompra_ConsClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  FNotaEntradaCons.MeTexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  if FNotaEntradaCons.ShowModal = mrOk then
    Proc_TrazItens(DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value);
end;

procedure TFNotaSaidaCad.Mov1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[3].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text), 'VENDA');
      QRMovMercadoria_Sintetico.Close;

      QRMovMercadoria_Sintetico.SetVariable('DATA_I', FNotaSaidaParam.ME3DataI.Text);
      QRMovMercadoria_Sintetico.SetVariable('DATA_F', FNotaSaidaParam.ME3DataF.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('FILIAL', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text));

      if Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('CADASTRO', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('CADASTRO', Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text));

      if Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('OPERACAO', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('OPERACAO', Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text));
      if Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('COD_PRODUTO', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('FORNECEDOR', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('FORNECEDOR', Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('VENDEDOR', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('DEPARTAMENTO', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('DEPARTAMENTO', Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text));
      if Trim(FNotaSaidaParam.ME3Serie.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('SERIE', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('SERIE', Trim(FNotaSaidaParam.ME3Serie.Text));
      if Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('CULTURA', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('CULTURA', Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text));
      if Trim(FNotaSaidaParam.Me3Lote.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('COD_LOTE_TIPO', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('COD_LOTE_TIPO', Trim(FNotaSaidaParam.Me3Lote.Text));
      if Trim(FNotaSaidaParam.Me3Classe.Text) = '' then
        QRMovMercadoria_Sintetico.SetVariable('COD_CLASSE', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('COD_CLASSE', FNotaSaidaParam.Me3Classe.Text);
      if (Trim(FNotaSaidaParam.Me3SubClasse.Text) = '') or
        (Trim(FNotaSaidaParam.Me3SubClasse.Text) = '0') then
        QRMovMercadoria_Sintetico.SetVariable('COD_SUBCLASSE', Null)
      else
        QRMovMercadoria_Sintetico.SetVariable('COD_SUBCLASSE', FNotaSaidaParam.Me3SubClasse.Text);

      if Trim(FNotaSaidaParam.Me3Marca.Text) = '' then
          QRMovMercadoria_Sintetico.SetVariable('COD_MARCA', Null)
        else
          QRMovMercadoria_Sintetico.SetVariable('COD_MARCA', Trim(FNotaSaidaParam.Me3Marca.Text));

      case FNotaSaidaParam.Rg3TipoNota.ItemIndex of
        0: QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA', 'E');
        1: QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA', 'S');
        2: QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA', Null);
      end;
      case FNotaSaidaParam.RG3CondicaoPagto.ItemIndex of
        0: QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO', '1');
        1: QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO', '2');
        2: QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO', '3');
        3: QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO', Null);
      end;

      QRMovMercadoria_Sintetico.Open;

      if FRMovMercadoria_Sintetico = nil then
         FRMovMercadoria_Sintetico := TFRMovMercadoria_Sintetico.Create(Application);
      FRMovMercadoria_Sintetico.QRLPeriodo.Caption := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) + ' ' + Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) +
        ' Periodo: ' + FNotaSaidaParam.ME3DataI.Text + ' ate ' + FNotaSaidaParam.ME3DataF.Text;
      FRMovMercadoria_Sintetico.QRLVendedor.Caption := 'Vendedor: ' + Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmVendedor4.EdVendedor.Text) +
        ' Fornecedor: ' + Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) + ' ' + Trim(FNotaSaidaParam.FmFornecedor4.EdCadastro.Text);
      FRMovMercadoria_Sintetico.QRLDepartamento.Caption := 'Departamento: ' + Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text) + ' ' + Trim(FNotaSaidaParam.FmDepartamento4.EdDepartamento.Text) +
        ' Série: ' + FNotaSaidaParam.ME3Serie.Text;
      FRMovMercadoria_Sintetico.QRLMarca.Caption := 'Marca: ' + Trim(FNotaSaidaParam.ME3Marca.Text) + ' ' + Trim(FNotaSaidaParam.Ed3Marca.Text);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRMovMercadoria_Sintetico.QRPrimario.Preview
      else
        FRMovMercadoria_Sintetico.QRPrimario.Print;
      QRMovMercadoria_Sintetico.Close;
    end;
end;

procedure TFNotaSaidaCad.ExtratodeProdutosAgrcola1Click(Sender: TObject);
begin
  inherited;
  //-------------------------------------------
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[46].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DMUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial47.MeFilial.Text), 'VENDA');
      QRExtratoAgricola.Close;

      //Frames--------------------------------------------------------------------
      if Trim(FNotaSaidaParam.FmFilial47.MeFilial.Text) <> '' then
        QRExtratoAgricola.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial47.MeFilial.Text))
      else
        QRExtratoAgricola.SetVariable('FILIAL', null);

      if Trim(FNotaSaidaParam.FmCadastro47.MeCadastro.Text) <> '' then
        QRExtratoAgricola.SetVariable('CADASTRO', Trim(FNotaSaidaParam.FmCadastro47.MeCadastro.Text))
      else
        QRExtratoAgricola.SetVariable('CADASTRO', null);

      if Trim(FNotaSaidaParam.FmProduto47.MeProduto.Text) <> '' then
        QRExtratoAgricola.SetVariable('PRODUTO', Trim(FNotaSaidaParam.FmProduto47.MeProduto.Text))
      else
        QRExtratoAgricola.SetVariable('PRODUTO', null);

      if Trim(FNotaSaidaParam.Me47Operacao.Text) <> '' then
        QRExtratoAgricola.SetVariable('DESC_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN (' + Trim(FNotaSaidaParam.Me47Operacao.Text + ')'))
      else
        QRExtratoAgricola.SetVariable('DESC_OPERACAO', '1=1');
      if (Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text) = '') or (Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text) = '') then
        raise Exception.Create('Deve-se Fornecer um Intervalo de Datas Válido.')
      else
      begin
        QRExtratoAgricola.SetVariable('DT_INICIAL', Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text));
        QRExtratoAgricola.SetVariable('DT_FINAL', Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text + ' 23:59:59'));
      end;

      QRExtratoAgricola.Open;
      //--------------------------------------------------------------------------
      if FRExtratoProdutoAgricola = nil then
        FRExtratoProdutoAgricola := TFRExtratoProdutoAgricola.Create(Application);

      if FNotaSaidaParam.RgICMS47.ItemIndex = 0 then
      begin
        //Trocar o Campo com ICMS
        FRExtratoProdutoAgricola.QRDBVal_Unitario.DataField := 'VAL_UNITARIO_COM_ICMS';
        FRExtratoProdutoAgricola.QRDBVal_Total.DataField := 'VAL_TOTAL_COM_ICMS';
        FRExtratoProdutoAgricola.QRExprValorUnitario.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_COM_ICMS) / SUM(QRExtratoAgricola.QUANTIDADE) * QRExtratoAgricola.EMBALAGENS';
        FRExtratoProdutoAgricola.QRExprValorTotal.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_COM_ICMS)';
        FRExtratoProdutoAgricola.QRLIcms.Caption := 'com ICMS';
        //------------------------
      end;
      if FNotaSaidaParam.RgICMS47.ItemIndex = 1 then
      begin
        //Trocar o Campo sem ICMS
        FRExtratoProdutoAgricola.QRDBVal_Unitario.DataField := 'VAL_UNITARIO_SEM_ICMS';
        FRExtratoProdutoAgricola.QRDBVal_Total.DataField := 'VAL_TOTAL_SEM_ICMS';
        FRExtratoProdutoAgricola.QRExprValorUnitario.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_SEM_ICMS) / SUM(QRExtratoAgricola.QUANTIDADE) * QRExtratoAgricola.EMBALAGENS';
        FRExtratoProdutoAgricola.QRExprValorTotal.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_SEM_ICMS)';
        FRExtratoProdutoAgricola.QRLIcms.Caption := 'sem ICMS';
        //------------------------
      end;

      //Cabeçalho-------------------------------
      FRExtratoProdutoAgricola.QRLFilial.Caption := Trim(FNotaSaidaParam.FmFilial47.EdFilial.Text);
      FRExtratoProdutoAgricola.QRLPeriodo.Caption := 'De: ' + Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text) + ' Até: ' + Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text);
      //----------------------------------------
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRExtratoProdutoAgricola.QRPrimario.Preview
      else
        FRExtratoProdutoAgricola.QRPrimario.Print;
      QRExtratoAgricola.Close;
    end;
  //-------------------------------------------
end;

procedure TFNotaSaidaCad.VendaporClasseeData1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[47].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text), 'VENDA');
      QRVendaClasseData.Close;
      if (FNotaSaidaParam.ME48DataI.Text = '') or (FNotaSaidaParam.ME48DataF.Text = '') then
        raise Exception.Create('É necessário informar a Data de Emissão.');
      QRVendaClasseData.SetVariable('DATA_I', FNotaSaidaParam.ME48DataI.Text);
      QRVendaClasseData.SetVariable('DATA_F', FNotaSaidaParam.ME48DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text) = '' then
        QRVendaClasseData.SetVariable('FILIAL', Null)
      else
        QRVendaClasseData.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text));
      if Trim(FNotaSaidaParam.ME48Classe.Text) = '' then
        QRVendaClasseData.SetVariable('CLASSE', Null)
      else
        QRVendaClasseData.SetVariable('CLASSE', trim(FNotaSaidaParam.ME48Classe.Text));
      if (Trim(FNotaSaidaParam.ME48Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME48Subclasse.Text) = '0') then
        QRVendaClasseData.SetVariable('SUB_CLASSE', Null)
      else
        QRVendaClasseData.SetVariable('SUB_CLASSE', FNotaSaidaParam.ME48Subclasse.Text);
      Case FNotaSaidaParam.RGTipoNota48.itemindex Of
         0 : QRVendaClasseData.SetVariable('IND_ENTRADA_SAIDA', 'E');
         1 : QRVendaClasseData.SetVariable('IND_ENTRADA_SAIDA', 'S');
         2 : QRVendaClasseData.SetVariable('IND_ENTRADA_SAIDA', Null);
      end;
      if Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text) = '' then
        QRVendaClasseData.SetVariable('VENDEDOR', Null)
      else
        QRVendaClasseData.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text));
      QRVendaClasseData.Open;
      QRVendaClasseDataResumo.Close;
      QRVendaClasseDataResumo.SetVariable('DATA_I', FNotaSaidaParam.ME48DataI.Text);
      QRVendaClasseDataResumo.SetVariable('DATA_F', FNotaSaidaParam.ME48DataF.Text + ' 23:59:59');
      if Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text) = '' then
        QRVendaClasseDataResumo.SetVariable('FILIAL', Null)
      else
        QRVendaClasseDataResumo.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text));

       if Trim(FNotaSaidaParam.ME48Classe.Text) = '' then
        QRVendaClasseDataResumo.SetVariable('CLASSE', Null)
      else
        QRVendaClasseDataResumo.SetVariable('CLASSE', trim(FNotaSaidaParam.ME48Classe.Text));

      if (Trim(FNotaSaidaParam.ME48Subclasse.Text) = '') or (Trim(FNotaSaidaParam.ME48Subclasse.Text) = '0') then
        QRVendaClasseDataResumo.SetVariable('SUB_CLASSE', Null)
      else
        QRVendaClasseDataResumo.SetVariable('SUB_CLASSE', trim(FNotaSaidaParam.ME48Subclasse.Text));

      if Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text) = '' then
        QRVendaClasseDataResumo.SetVariable('VENDEDOR', Null)
      else
        QRVendaClasseDataResumo.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text));
      QRVendaClasseDataResumo.Open;

      if FRNota_ClasseData = nil then
        FRNota_ClasseData := TFRNota_ClasseData.Create(Application);
      if FRNota_ClasseDataRes = nil then
        FRNota_ClasseDataRes := TFRNota_ClasseDataRes.Create(Application);
      FRNota_ClasseData.QRLTitulo.Caption := 'Vendas por classe, sub-classe e Data de ' + FNotaSaidaParam.ME48DataI.Text + ' até ' + FNotaSaidaParam.ME48DataF.Text;
      FRNota_ClasseData.QRLFilial.Caption := FNotaSaidaParam.FmFilial48.EdFilial.Text;
      FRNota_ClasseDataRes.QRLTitulo.Caption := FRNota_ClasseData.QRLTitulo.Caption;
      FRNota_ClasseDataRes.QRLFilial.Caption := FRNota_ClasseData.QRLFilial.Caption;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      begin
        FRNota_ClasseData.QRCompositeReport1.Preview;
      end
      else
        FRNota_ClasseData.QRCompositeReport1.Print;
      QRVendaClasseData.Close;
      QRVendaClasseDataResumo.Close;
    end;
end;

procedure TFNotaSaidaCad.SbPesquisaFluxoTremClick(Sender: TObject);
begin
  inherited;
  if FControleTremCons = nil then
    FControleTremCons := TFControleTremCons.Create(Application);
  if FControleTremCons.ShowModal = MrOk then
    DMNotaSaida.QNotaSaidaCOD_FLUXO_TREM.Value := DMControleTrem.QControleTremConsCOD_FLUXO_TREM.Value;

end;

procedure TFNotaSaidaCad.HistricodeVendas1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[48].TabVisible := true;
  if FNotaSaidaParam.ShowModal = MrOk then
  begin
    if (trim(FNotaSaidaParam.Me49Data_I.Text) = '') or (trim(FNotaSaidaParam.Me49Data_F.Text) = '') then
      raise Exception.Create('Intervalo de datas nao informado');

    with DMRelatorio_Venda do
    begin
      QRHistoricoVendas.Close;
      QRHistoricoVendas.SetVariable('DATA_I', trim(FNotaSaidaParam.Me49Data_I.Text));
      QRHistoricoVendas.SetVariable('DATA_F', trim(FNotaSaidaParam.Me49Data_F.Text) + ' 23:59:59');
      QRHistoricoVendas.Open;

      if FRHistoricoVendas = nil then
        FRHistoricoVendas := TFRHistoricoVendas.Create(Application);
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRHistoricoVendas.QRPrimario.Preview
      else
        FRHistoricoVendas.QRPrimario.Print;
    end;
  end;
end;

procedure TFNotaSaidaCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.Create(Application);

  if FEstadoCons.ShowModal = mrok then
    DMNotaSaida.QNotaGNRECOD_UF.Value := DMEstado.QEstadoConsCOD_ESTADO.Value;
end;

procedure TFNotaSaidaCad.NotaQueAtendeuNota1Click(Sender: TObject);
var
  wNomeRelatorio: string;
  parametrosRelatorio: string;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[49].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text), 'VENDA');
      QRFutura_Atendido.Close;
      QRFutura_Atendido.Sql.Clear;
      QRFutura_Atendido.Sql.Add('SELECT Tb_nota_aux.COD_NOTA_AUX, Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,');
      QRFutura_Atendido.Sql.Add('Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.DESC_PRODUTO,Tb_produto.COD_PRODUTO,tb_nota_cab.NUM_NOTA,');
      QRFutura_Atendido.Sql.Add('Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,Tb_nota_cab.COD_SERIE,Tb_nota_cab.DT_EMISSAO,NF_ITEM.COD_LOTE_TIPO,');
      QRFutura_Atendido.Sql.Add('Tb_nota_item.VAL_UNITARIO,Tb_nota_cab.VAL_FUNRURAL, Tb_baixa_aux.QT_QUANTIDADE, ');
      QRFutura_Atendido.Sql.Add('NF_CAB.DT_EMISSAO DT_BAIXA,NF_CAB.NUM_NOTA NF_BAIXA, NF_CAB.COD_SERIE NF_SERIE,');
      QRFutura_Atendido.Sql.Add('Tb_nota_item.VAL_DESCONTO + (Tb_nota_item.VAL_DESCONTO_RATEIO / Tb_nota_item.QT_QUANTIDADE) AS VAL_DESCONTO,');
      //QRFutura_Atendido.Sql.Add('DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO');
      QRFutura_Atendido.Sql.Add('TB_NOTA_CAB.COD_CADASTRO + 0.00 AS COD_CADASTRO');
      QRFutura_Atendido.Sql.Add('FROM TB_NOTA_ITEM,TB_NOTA_CAB,TB_NOTA_AUX,TB_PRODUTO, TB_BAIXA_AUX, TB_LOTE_TIPO, ');
      QRFutura_Atendido.Sql.Add('TB_NOTA_ITEM NF_ITEM, TB_NOTA_CAB NF_CAB');
      QRFutura_Atendido.Sql.Add('WHERE');
      QRFutura_Atendido.Sql.Add(' NF_ITEM.COD_NOTA_ITEM = Tb_baixa_aux.COD_NOTA_ITEM AND');
      QRFutura_Atendido.Sql.Add(' NF_CAB.COD_NOTA_CAB = NF_ITEM.COD_NOTA_CAB AND');
      QRFutura_Atendido.Sql.Add(' Tb_nota_item.COD_NOTA_ITEM = Tb_Nota_aux.COD_NOTA_ITEM AND');
      QRFutura_Atendido.Sql.Add(' TB_LOTE_TIPO.COD_LOTE_TIPO = NF_ITEM.COD_LOTE_TIPO AND');
      QRFutura_Atendido.Sql.Add(' Tb_nota_aux.COD_NOTA_AUX = Tb_baixa_aux.COD_NOTA_AUX AND');
      QRFutura_Atendido.Sql.Add(' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND');
      QRFutura_Atendido.Sql.Add(' Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO AND');
      //    QRFutura_Atendido.Sql.Add(' QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ');
      case FNotaSaidaParam.CB50TipoFutura.ItemIndex of
        0:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'COM_FUT' + Chr(39));
            wNomeRelatorio := 'Rel. Notas de Compra Futura';
          end;
        1:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'VEN_FUT' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Venda Futura';
          end;
        2:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_FOR' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
          end;
        3:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_CLI' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
          end;
        4:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_FOR' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
          end;
        5:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_CLI' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
          end;
        6:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_EMP' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
          end;
        7:
          begin
            QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_OUT' + chr(39));
            wNomeRelatorio := 'Rel. Notas de Deposito Outras Empresas';
          end;
      else
        raise Exception.Create('Nenhum tipo de Futura selecionado!');
      end;
      if Trim(FNotaSaidaParam.FmCadastro50.MeCadastro.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.FmCadastro50.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmFilial50.MeFilial.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial50.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmProduto50.MeProduto.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto50.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmLote50.MeLote.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaSaidaParam.FmLote50.MeLote.Text));
      if Trim(FNotaSaidaParam.ME50DtI.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And NF_CAB.DT_EMISSAO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME50DtI.Text) + chr(39));
      if Trim(FNotaSaidaParam.ME50DtF.Text) <> '' then
        QRFutura_Atendido.Sql.Add(' And NF_CAB.DT_EMISSAO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME50DtF.Text) + chr(39));
      QRFutura_Atendido.SQL.Add(' ORDER BY COD_CADASTRO,Tb_nota_item.COD_PRODUTO, TB_NOTA_CAB.NUM_NOTA');
      QRFutura_Atendido.Open;
      if FRNota_VendaFuturaAtendida = nil then
        FRNota_VendaFuturaAtendida := TFRNota_VendaFuturaAtendida.Create(Application);

      FRNota_VendaFuturaAtendida.QRLTitulo.Caption := wNomeRelatorio;

      parametrosRelatorio := 'Filial:' + Trim(FNotaSaidaParam.FmFilial50.MeFilial.Text) + ' - ' + Trim(FNotaSaidaParam.FmFilial50.EdFilial.Text);
      parametrosRelatorio := parametrosRelatorio + ', De ' + FNotaSaidaParam.ME50DtI.Text + ' Até ' + FNotaSaidaParam.ME50DtF.Text;

      FRNota_VendaFuturaAtendida.parametrosUtilizados.Lines.Clear;
      FRNota_VendaFuturaAtendida.parametrosUtilizados.Lines.Add(parametrosRelatorio);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_VendaFuturaAtendida.QRPrimario.Preview
      else
        FRNota_VendaFuturaAtendida.QRPrimario.Print;
      QRFutura_Atendido.Close;
    end;
end;

{procedure TFNotaSaidaCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    if DMNotaSaida.QNotaSaidaCOD_SERIE.Value = '2' then
      DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
        'DANFE Documento Auxiliar da Nota Fiscal Eletronica saida serie 1. ' +
        'Conforme Lacre num:   Placa:'
  end;
end;}

function TFNotaSaidaCad.LocalizaConhecimento(cod: string): Integer;
var
  i: Integer;
begin
  for i := 0 to CbConhecimentoExp.Items.Count - 1 do
    if (copy(CbConhecimentoExp.Items[i], 1, 2) = cod) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

procedure TFNotaSaidaCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
//  MePrazo.Text := DMNotaSaida.QPedidoNotaCOD_PRAZO_VENCIMENTO.Text;
  DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value));
end;

procedure TFNotaSaidaCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
//  MePrazo.Text := DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text;
  MeCodValeProduto.Text := DMOracle.FastSelect('COD_VALE_PRODUTO','TB_VALE_PRODUTO',
    'COD_NOTA_CAB_TROCA = ' +IntToStr(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value));
  AtualizaCodListaPreco;
  CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);;
  CBIndIntermediador.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value = '', -1, StrToInt('0' + DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value));
end;

procedure TFNotaSaidaCad.BtArmazemAlfandegarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaSaidaCad.PsVenda1Click(Sender: TObject);
begin
  inherited;
  if ((DMNotaSaida.QNotaSaida.IsEmpty) or (DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.IsNull)) then
    raise Exception.Create('Selecione uma Nota.');

  DMNotaSaida.QPosVenda.Close;
  DMNotaSaida.QPosVenda.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
  DMNotaSaida.QPosVenda.open;

  if DMNotaSaida.QPosVenda.IsEmpty then
  begin
    DMNotaSaida.QPosVenda.Append;
    DMNotaSaida.QPosVendaDT_POS_VENDA.Value := Date;
    if DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) = 'F' then
      DMNotaSaida.QPosVendaDESC_NOME.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  end
  else
    DMNotaSaida.QPosVenda.Edit;

  if FNotaSaidaPosVenda = nil then
    FNotaSaidaPosVenda := TFNotaSaidaPosVenda.Create(Application);
  if FNotaSaidaPosVenda.ShowModal = mrOk then
  begin
    if DMNotaSaida.QPosVendaDT_POS_VENDA.IsNull then
      raise Exception.Create('Informe a Data.');
    if DMNotaSaida.QPosVendaDESC_NOME.Value = '' then
      raise Exception.Create('Informe o Nome.');
    if DMNotaSaida.QPosVendaDESC_POS_VENDA.Value = '' then
      raise Exception.Create('Informe a Descrição.');

    DMNotaSaida.QPosVendaCOD_NOTA_CAB.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
    DMNotaSaida.QPosVenda.Post;
    DMOracle.DBCemapa.Commit;
  end
  else
  begin
    DMNotaSaida.QPosVenda.cancel;
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFNotaSaidaCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FTipoConhecimentoCons = nil then
    FTipoConhecimentoCons := TFTipoConhecimentoCons.Create(Application);
  if FTipoConhecimentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaExpConhecimentoCOD_TIPO_CONHECIMENTO.Value := DMNotaSaida.QTipoConhecimentoConsCOD_TIPO_CONHECIMENTO.Value;
end;

procedure TFNotaSaidaCad.BtNotaCabRefClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeNFeParam.ShowModal = mrOk then
  begin
    DMNotaSaida.QNotaSaidaIND_FINALIDADE_NFE.Value := FFinalidadeNFeParam.RGFinalidade.ItemIndex + 1;
    if FNotaSaidaCons = nil then
      FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
    if FNotaSaidaCons.ShowModal = mrOk then
      DMNotaSaida.QNotaSaidaCOD_NOTA_CAB_REF.Value := DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Value;
  end;
end;

procedure TFNotaSaidaCad.BtImportaNfRefClick(Sender: TObject);
var
  wCod, wNum, wOp: string;
begin
  inherited;
  with DMNotaSaida do
    if QNotaSaidaCOD_NOTA_CAB_REF.Value > 0 then
    begin
      wCod := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB_REF.Text;
      wNum := DMOracle.FastSelect('NUM_NOTA', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wCod);
      if (MessageDlg('Tem certeza que deseja importar os dados da NF ' + wNum + '?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        if QNotaSaidaCOD_SERIE.IsNull then
          QNotaSaidaCOD_SERIE.Value := '2';
        if QNotaSaidaCOD_OPERACAO.IsNull then
        begin
          wOp := DMOracle.FastSelect('COD_OPERACAO', 'TB_OPERACAO',
            'IND_FINALIDADE_NFE = 2 AND IND_TIPO_OPERACAO = ' + QuotedStr('S'));
          if wOp <> '' then
            QNotaSaidaCOD_OPERACAO.Value := StrToInt(wOp)
          else
          begin
            MessageDlg('Não foi encontrada nenhuma operação de saída que seja de complemento.' + #13 + #10 +
              'Por favor, cadastre uma informando a finalidade "Complemento" na aba "Outros".', mtError, [mbOK], 0);
            Abort;
          end;
        end;

        DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value := StrToInt('0' +
          DMOracle.FastSelect('COD_CADASTRO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wCod));
        Proc_TrazItens(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB_REF.Value);
        DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
          Trim(DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value +
          ' COMPLEMENTO DE NOTA REFERENTE A NOTA NUMERO ' + wNum +
          ' EMITIDA EM ' + DMOracle.FastSelect('DT_EMISSAO', 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wCod));
        DMNotaSaida.QNotaSaidaIND_TIPO_FRETE.Value := 'CIF'; // Para nota de complemento, informar frete por conta do emitente
      end;
    end;
end;

procedure TFNotaSaidaCad.PreodeVendaXPreoVendidoporVendedor1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[50].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      QRPrecoVendido.Close;
      QRPrecoVendido.SetVariable('DT_RECEBIMENTO_INI', FNotaSaidaParam.Me51DtInicial.Text);
      QRPrecoVendido.SetVariable('DT_RECEBIMENTO_FIN', FNotaSaidaParam.Me51DtFinal.Text);
      if Trim(FNotaSaidaParam.Fm51Vendedor.MeVendedor.Text) <> '' then
        QRPrecoVendido.SetVariable('COD_VENDEDOR', StrToInt(Trim(FNotaSaidaParam.Fm51Vendedor.MeVendedor.Text)))
      else
        QRPrecoVendido.SetVariable('COD_VENDEDOR', Null);
      if Trim(FNotaSaidaParam.Fm51Produto.MeProduto.Text) <> '' then
        QRPrecoVendido.SetVariable('COD_PRODUTO', StrToInt(Trim(FNotaSaidaParam.Fm51Produto.MeProduto.Text)))
      else
        QRPrecoVendido.SetVariable('COD_PRODUTO', Null);
      QRPrecoVendido.Open;

      if FRPrecoVendido = nil then
        FRPrecoVendido := TFRPrecoVendido.Create(Application);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRPrecoVendido.QRPrimario.Preview
      else
        FRPrecoVendido.QRPrimario.Print;

      QRPrecoVendido.Close;
    end;
end;

procedure TFNotaSaidaCad.DBEValUnitarioExit(Sender: TObject);
Var
  wValor : Double;
  wOperacao : String;
begin
  inherited;
  with DMNotaSaida do
  begin
    //Para trazer o desconto do Cliente informado no cadastro. Solicitação Marcos. Junior - 27/02/2015
    if DMCadastro.QCadastroPERC_DESCONTO2.Value > 0 then
    begin
      QItemNFPERC_DESCONTO.Value := DmCadastro.QCadastroPERC_DESCONTO2.Value;
    end;
    if ValUn <> QItemNFVAL_UNITARIO.Value then
      QItemNFVAL_UNITARIO_TABELA.Value := QItemNFVAL_UNITARIO.Value;
  end;
  If DMParamSistema.CodEmpresa = 'RADIO' Then // Solicitado pelo Marcos da Radiolandia 26/02/2021
   Begin
     wValor := StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO =' + FNotaSaidaCad.DBECodProduto.Text));
     wOperacao := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO =' + DBECodOperacao.Text);
     if (DMNotaSaida.QItemNFVAL_UNITARIO.Value < wValor) and (wOperacao = 'V') then  // valor de venda nao pode ser menor que tabela
     //     if (StrToFloat(FNotaSaidaCad.DBEValUnitario.Text) < wValor) and (wOperacao = 'V') then  // valor de venda nao pode ser menor que tabela
      Begin
        DBEValUnitario.SetFocus;
        DBEValUnitario.Text := '';
        Raise Exception.Create('O Preço informado é inferior ao preço de Venda!');
      end;
   end;
   if ((DMParamSistema.CodEmpresa = 'ALIANCA') and (DBECodProduto.Text <> '')) then
   Begin
     if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
         (DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C') and
        (DSPrimario.State in [DsInsert,DsEdit])) then
     begin
      if FLancaHorimetro = nil then
         FLancaHorimetro := TFLancaHorimetro.Create(Application);
       FLancaHorimetro.ShowModal;
     end;
   end;
   //if (DMParamSistema.CodEmpresa = 'KREUZ') then //Precisa checar o preço na saida do campo. No Validade valide se for informado desconto no item junior 26/03/2026
   DMNotaSaida.Checar_preco;

end;

procedure TFNotaSaidaCad.DBEValUnitarioEnter(Sender: TObject);
begin
  inherited;
  ValUn := DMNotaSaida.QItemNFVAL_UNITARIO.Value;
end;

procedure TFNotaSaidaCad.InutilizaodenumeraoNFe1Click(Sender: TObject);
begin
  inherited;
  DMNfe.InutilizaNumeracaoNfe;
end;

procedure TFNotaSaidaCad.EnviarviaemailNFe1Click(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
  begin
    MessageDlg('Por favor, informe uma nota que contenha chave de acesso.', mtError, [mbOK], 0);
    Exit;
  end;
  with DMNotaSaida do
  begin
    if FNfEletronicaLoteCons = nil then
      FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
    FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
    FNfEletronicaLoteCons.Foco := nfEmail;
    FNfEletronicaLoteCons.ShowModal;
  end;
end;

procedure TFNotaSaidaCad.EmitircpiadeDanfe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfDanfe;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaSaidaCad.ReconsultarNFe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfConsulta;
      FNfEletronicaLoteCons.ShowModal;
    end;
  SBRefreshClick(Self);
end;

procedure TFNotaSaidaCad.RelaodeControledeCargas1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[51].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      QRControleCarga.Close;
      QRControleCarga.SetVariable('DT_RECEBIMENTO_INI', FNotaSaidaParam.Me52DataIni.Text);
      QRControleCarga.SetVariable('DT_RECEBIMENTO_FIN', FNotaSaidaParam.Me52DataFin.Text);
      if Trim(FNotaSaidaParam.Fm52Filial.MeFilial.Text) <> '' then
        QRControleCarga.SetVariable('COD_FILIAL', StrToInt(Trim(FNotaSaidaParam.Fm52Filial.MeFilial.Text)))
      else
        QRControleCarga.SetVariable('COD_FILIAL', Null);
      QRControleCarga.SetVariable('NR_ROTA', StrToInt(Trim(FNotaSaidaParam.Me52Embarque.Text)));
      QRControleCarga.Open;

      if FRControleCarga = nil then
        FRControleCarga := TFRControleCarga.Create(Application);
      FRControleCarga.QRLCarga.Caption := 'Carga: ' + Trim(FNotaSaidaParam.Me52Embarque.Text) +
        ' De ' + FNotaSaidaParam.Me52DataIni.Text + ' Até ' + FNotaSaidaParam.Me52DataFin.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRControleCarga.QRPrimario.Preview
      else
        FRControleCarga.QRPrimario.Print;

      QRControleCarga.Close;
    end;
end;

procedure TFNotaSaidaCad.DBPSerieValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: string);
var
  contingencia: string;
  tipoNota: string;
begin
  inherited;
  if (not DMNotaSaida.QNotaSaidaCOD_FILIAL.IsNull) and (not DMNotaSaida.QNotaSaidaCOD_OPERACAO.IsNull) then
  begin
    Buscador.Limpa;
    Buscador.Adiciona('IND_CONTINGENCIA', 'TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
    Buscador.Adiciona('IND_EMITE', 'TB_OPERACAO', 'COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
    Buscador.Buscar();
    contingencia := Buscador.Proximo;
    tipoNota := Buscador.Proximo;
    isValid := (tipoNota <> 'F') or (contingencia <> '3') or ((Value >= '900') and (Value <= '999'));
    if not isValid then
      Msg := 'Filial em ambiente Scan, por favor utilize uma série entre 900 e 999';
  end;
end;

procedure TFNotaSaidaCad.DBPSerieCodigoExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')  then
   Begin
     If (DMNotaSaida.QNotaSaidaCod_Serie.Value = 'PE') Or
        (DMNotaSaida.QNotaSaidaCod_Serie.Value = '1')  Then
        DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2';
     If DMNotaSaida.QNotaSaidaCod_Serie.Value = 'CUP' Then
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '2D';

     If DMNotaSaida.QNotaSaidaCod_Serie.Value = '1' Then
     begin
        if DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '55' then
          DMNotaSaida.QNotaSaidaNUM_NOTA.Value := 0;
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '55';
     end;

     if DMNotaSaida.QNotaSaidaCOD_SERIE.Value = '3' then
     begin
        if DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65' then
          DMNotaSaida.QNotaSaidaNUM_NOTA.Value := 0;
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '65';
     end;
   End;
end;

procedure TFNotaSaidaCad.AlterarNmeroContrato1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text) <> '' then
  begin
    if FAlteraCodigoContrato = nil then
      FAlteraCodigoContrato := TFAlteraCodigoContrato.Create(Application);
    FAlteraCodigoContrato.wTela := 'VENDA';
    FAlteraCodigoContrato.ShowModal;
  end
  else
    raise Exception.Create('Informe a nota para lançar o Contrato');
end;

procedure TFNotaSaidaCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
var i: Integer;
begin
  inherited;
  with DMNotaSaida.QNotaSaidaIND_SITUACAO do
    if Value = SIT_NOTA_DIGITADA then
      DBTSituacao.Font.Color := clRed
    else if (Value = SIT_NOTA_CONFIRMADA) or (Value = SIT_NOTA_DENEGADA) then
      DBTSituacao.Font.Color := clGreen
    else if Value = SIT_NOTA_CANCELADA then
      DBTSituacao.Font.Color := clBlue
    else
      DBTSituacao.Font.Color := clWindowText;
  if Field <> nil then
    if (Field.Name = 'QNotaSaidaCOD_CADASTRO') and
       (DMParamSistema.CodEmpresa = 'DEION') and
       (DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value > 0) then
    begin
      with DMCadastro do
      begin
        QCadastro.Close;
        QCadastro.SetVariable('PK',DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
        QCadastro.Open;
        if QCadastroDESC_FORMA_COMPRA.Value <> '' then
        begin
          if DSPrimario.State in [dsInsert, dsEdit] then
          begin
            if (QCadastroDESC_FORMA_COMPRA.Value = 'A Prazo') or
               (QCadastroDESC_FORMA_COMPRA.Value = 'Boleto') then
              DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
            if (QCadastroDESC_FORMA_COMPRA.Value = 'A Vista') or
               (QCadastroDESC_FORMA_COMPRA.Value = 'Com Cheque') then
              DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
            if (QCadastroDESC_FORMA_COMPRA.Value = 'Cartão') then
              DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '4';
            if (QCadastroDESC_FORMA_COMPRA.Value = 'Conta Corrente') then
              DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
          end;
          for i := 0 to DBRGCondicaoPagamento.Items.Count - 1 do
            DBRGCondicaoPagamento.Controls[i].Enabled := false;
        end
        else
          for i := 0 to DBRGCondicaoPagamento.Items.Count - 1 do
            DBRGCondicaoPagamento.Controls[i].Enabled := True;
      end;
    end;
end;

procedure TFNotaSaidaCad.SBChaveAcessoClick(Sender: TObject);
  procedure ChaveManual(Chave: string);
  begin
    if InputQuery('Nova Chave de Acesso', 'Digite a chave:', Chave) then
    begin
      Chave := Bib.LimpaNumero(Chave);
      if Length(Chave) <> 44 then
      begin
        MessageDlg('Chave errada, precisa possuir 44 números.', mtError, [mbOK], 0);
        ChaveManual(Chave);
      end
      else
        DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value := 'NFe' + Chave;
    end;
  end;
begin
  inherited;
  with DMNfe do
  begin
    SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value), True);
    if (QNfeind_aprovado.Value) or (QNfeind_cancelado.Value) or (QNfeind_denegado.Value) then
    begin
      MessageDlg('Esta chave já está autorizada, cancelada ou denegada na SEFAZ.' + #13 + #10 +
        'Não é permitido alterar a chave de uma nota nesta situação.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  case MessageDlgCustom('Alterar chave de acesso', mtConfirmation,
    [mbYes, mbNo, mbCancel], ['Informar manualmente',
    'Gerar outra chave automaticamente', 'Cancelar'], nil) of
    mrYes:
      ChaveManual(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value);
    mrNo:
      if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        MessageDlg('A Chave de Acesso será apagada, pois, assim, ela será gerada automaticamente na confirmação da nota.', mtInformation, [mbOK], 0);
        DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value := '';
      end;
  end;
end;

procedure TFNotaSaidaCad.AlterarInserirestanotaemLoteNFe1Click(
  Sender: TObject);
begin
  inherited;
  DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value));
  if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
  begin
    MessageDlg('Esta nota já está autorizada. Não é mais permitido modificar o lote.', mtError, [mbOk],0);
    Abort;
  end;
  DMNfEletronicaLote.AdicionaNotaEmLote(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value,
    DMNotaSaida.QNotaSaidaCOD_FILIAL.Value, DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
  DMOracle.DBCemapa.Commit;
end;

procedure TFNotaSaidaCad.EnviarloteparaSEFAZ1Click(Sender: TObject);
var
  Acs: TAcoesLote;
begin
  inherited;
  DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value));
  if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
  begin
    MessageDlg('Esta nota já está autorizada. Não é possível reenviar o lote.', mtError, [mbOk],0);
    Abort;
  end;
  FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'',DMNfe.QNfeID_LOTE.AsInteger, True);
  SBRefreshClick(Self);
end;

procedure TFNotaSaidaCad.DBPObraDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FObraCons;
  Classe := TFObraCons;
end;

procedure TFNotaSaidaCad.ConsultarLotedeNFe1Click(Sender: TObject);
begin
  inherited;
  if FNfEletronicaLoteCons = nil then
    FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
  FNfEletronicaLoteCons.CarregaNota(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
  FNfEletronicaLoteCons.ShowModal;
  {with FNfEletronicaLoteCons do
  begin
    if not DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.IsNull then
    begin
      FMNota.MeNota.Text := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text;
      FMNota.MeNotaExit(Sender);
    end;
    FmFilial.MeFilial.Text := DMNotaSaida.QNotaSaidaCOD_FILIAL.Text;
    FmFilial.MeFilialExit(Sender);

    Buscar;

    ShowModal;
  end;}
end;

procedure TFNotaSaidaCad.DBECodProdutoExit(Sender: TObject);
var wDescProduto: string;
  wUN, wEmb :String;
  wAgricola :boolean;
  buscador :TBuscador;
  cstPis, cstCofins, cstIpi, cstReforma: String;
  wTipoProduto, wAtacadoVarejo: String;
  wPercInss : real;
  bibVenda: TBibVenda;
  wHoraI, wHoraF : real;
  wRegimeFilial, cclastrib, wClasstrib : string;
begin
  inherited;
  cstPis := '';
  cstCofins := '';
  cstIpi := '';
  cclastrib := '';
  wRegimeFilial := '';
  wClasstrib := '';
  if (DsPrimario.State <> DSBrowse) and
    (DMNotaSaida.QItemNFCod_Produto.text <> '') then
  begin

    if ((DMNotaSaida.QItemNFCod_Produto.Value = 20000) and
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'KREUZ')) then
    begin
      if InputQuery('Produto', 'Descrição Produto', wDescProduto) then
      begin
  {      DMNotaSaida.QNotaProduto.Close;
        DMNotaSaida.QNotaProduto.SetVariable('Pk', DMNotaSaida.QItemNFCod_Nota_Item.Value);
        DMNotaSaida.QNotaProduto.Open;
        if not DMNotaSaida.QNotaProduto.Eof then
          DMNotaSaida.QNotaProduto.Edit
        else
          DMNotaSaida.QNotaProduto.Insert;
        DMNotaSaida.QNotaProdutoCOD_NOTA_ITEM.Value := DMNotaSaida.QItemNFCod_Nota_Item.Value;
        DMNotaSaida.QNotaProdutoDESC_PRODUTO.Value := wDescProduto;
        DMNotaSaida.QNotaProduto.Post;
  }
        DMNotaSaida.QItemNFDESC_Complemento.Value := wDescProduto;
      end;
    end;
    DMNotaSaida.QVendaFuturaAberto.Close;
    DMNotaSaida.QVendaFuturaAberto.SetVariable('Cod_Cadastro',DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
    DMNotaSaida.QVendaFuturaAberto.SetVariable('Cod_Produto',DMNotaSaida.QItemNFCod_Produto.Value);
    DMNotaSaida.QVendaFuturaAberto.SetVariable('Cod_Filial',DMNotaSaida.QNotaSaidaCOD_Filial.Value);
    DMNotaSaida.QVendaFuturaAberto.Open;
    If DMNotaSaida.QVendaFuturaAbertoQt_Saldo.Value > 0 Then
       ShowMessage('Cliente possui venda futura em aberto deste produto -  favor verificar');
    with DMNotaSaida do
    begin
      // Bloco alterado por Djeison A. Selzlein - 17/05/2013
      // Configuração de CST de PIS e COFINS na operação tem prioridade sobre
      // a configuração feito no cadastro do Produto
      
      cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS FROM TB_OPERACAO', 'COD_OPERACAO = '+
        DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
      if cstPis = '' then
        cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
          DMNotaSaida.QItemNFCOD_PRODUTO.Text);
      if(cstPis <> '') then
      begin
        FNotaSaidaCad.DBLCCSTPis.KeyValue := cstPis;
        QItemNFCOD_CST_PIS.Value := cstPis;
      end;

      cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS FROM TB_OPERACAO', 'COD_OPERACAO = '+
        DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
      if cstCofins = '' then
        cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
          DMNotaSaida.QItemNFCOD_PRODUTO.Text);
      if cstCofins <> '' then
      begin
        FNotaSaidaCad.DBLCCSTCofins.KeyValue := cstCofins;
        QItemNFCOD_CST_COFINS.Value := cstCofins;
      end;

      // Até Aqui - 17/05/2013 - Djeison A. Selzlein

     {Para trazer o Cclastrib da operação ou do produto. Alex 18/09/2026}
      wRegimeFilial := Trim(DMOracle.BuscaNome('SELECT IND_REGIME_TRIBUTARIO FROM TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text));
      if wRegimeFilial = '3' then
      begin
        wClasstrib := DMOracle.BuscaNome('SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_OPERACAO','COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
        if wClasstrib = '' then
          wClasstrib := DMOracle.BuscaNome('SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_PRODUTO','COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text);
        if wClasstrib <> '' then
        begin
          cclastrib := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS','COD_CLASS_TRIB = ' +  wClasstrib);
          FNotaSaidaCad.DBLCCClasTribIBSCBSVenda.KeyValue := cclastrib;
          QItemNFNUM_CLASS_TRIB_IBS_CBS.Value := cclastrib;
          DBLCCClasTribIBSCBSVenda.KeyValue := cclastrib;
        end
        else
            Raise Exception.Create ('Produto e operação sem o CCLASTRIB informado. Favor verificar qual o CClastrib com seu contador qual deve ser o Cclastrib para esta nota.!')
      end;

      cstIpi := DMOracle.BuscaNome('SELECT COD_CST_IPI_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
        DMNotaSaida.QItemNFCOD_PRODUTO.Text);
      if cstIpi <> '' then
      begin
        FNotaSaidaCad.DBLCCstIpi.KeyValue := cstIpi;
        QItemNFCOD_CST_IPI.Value := cstIpi;
      end;
      QItemNFCOD_NATUREZA_RECEITA.Text := Trim(
        DMOracle.BuscaNome('SELECT COD_NATUREZA_RECEITA FROM TB_PRODUTO', 'COD_PRODUTO = '+
        DMNotaSaida.QItemNFCOD_PRODUTO.Text));
      //Para trazer o desconto do Cliente informado no cadastro. Solicitação Marcos. Junior - 27/02/2015
      if DMCadastro.QCadastroPERC_DESCONTO2.Value > 0 then
      begin
        QItemNFPERC_DESCONTO.Value := DMCadastro.QCadastroPERC_DESCONTO2.Value;
      end;
      wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' +
        QItemNFCOD_PRODUTO.Text);
      if Trim(wTipoProduto) = '' Then
       Begin
         DBECodProduto.SetFocus;
         Raise Exception.Create('Produto não cadastrado');
       end;
      if (QNotaSaidaCOD_SERIE_MODELO.Value = '98') and (wTipoProduto <> '') and (wTipoProduto <> 'SERVIÇO') then
      begin
        QItemNFCOD_PRODUTO.Text := '';
        DBECodProduto.SetFocus;
        MessageDlg('É preciso inserir itens do tipo serviço para NFS-e.', mtInformation, [mbOk], 0);
      end;

      //Não estava populando o campo val inss. Cesar pediu para fazer assim. Vanessa 11/01/2017
      wPercInss := strtofloat('0'+DMOracle.BuscaNome('SELECT PERC_INSS FROM TB_PRODUTO', 'COD_PRODUTO = '+
        DMNotaSaida.QItemNFCOD_PRODUTO.Text));
      if wpercInss > 0 then
        QItemNFPERC_INSS.Value := wPercInss
      else
        QItemNFPERC_INSS.Value := 0;

      // Personalizações
      bibVenda := TBibVenda.Create;
      bibVenda.PersonalizaDados(QItemNF, QNotaSaida, QNotaSaidaCOD_FILIAL.Value);
      FNotaSaidaCad.DBLCCstIpi.KeyValue := QItemNFCOD_CST_IPI.Value;
      DBPanel15Exit(self);
    end;
  end;
  if (DMNotaSaida.QItemNFCod_Produto.text <> '') and
     ((DMParamSistema.CodEmpresa = 'KREUZ') or
     (DMParamSistema.CodEmpresa = 'CONKRETA')) and
     (PCNota.TabIndex = 1)then
    DBEdit50.SetFocus;

  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ALIANCA') and (DBECodProduto.Text <> '')) then
  Begin
    if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
        (DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO','COD_PRODUTO= '+DMNotaSaida.QItemNFCOD_PRODUTO.Text) = 'S') and
        (DSPrimario.State in [DsInsert,DsEdit])) then
    begin
      if FLancaHorimetro = nil then
         FLancaHorimetro := TFLancaHorimetro.Create(Application);
       FLancaHorimetro.ShowModal;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'PERTUTTI') then
  begin
    wAtacadoVarejo := DMOracle.FastSelect('IND_ATACADO_VAREJO','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    if (wAtacadoVarejo = 'A') then
      DMNotaSaida.QItemNFVAL_UNITARIO.Value := DMProduto.QProdutoConsVAL_ATACADO.Value
    else
      DMNotaSaida.QItemNFVAL_UNITARIO.Value := DMProduto.QProdutoConsVAL_VAREJO.Value;
  end;
end;

procedure TFNotaSaidaCad.ImportaPedidoDebona;
var wIpi, wTipoOp, wSerieOp: string;
  wPedido, wItem: Integer;
  wTotalItens, wTotalItensDesconto: Extended;
begin
  if FPedidoCompostoCons = nil then
    FPedidoCompostoCons := TFPedidoCompostoCons.Create(Application);
  FPedidoCompostoCons.setaSituacao(false, true, false, true, false);
  FPedidoCompostoCons.GbSituacao.Enabled := False;
  if FPedidoCompostoCons.ShowModal = mrOk then
    with DMNotaSaida do
    begin
      QPedidoNota.Close;
      QPedidoNota.SetVariable('COD_PEDIDO_CAB', DMPedido.QPedidoCompostoConsCOD_PEDIDO_CAB.Value);
      QPedidoNota.Open;

      QPedidoNota.First;

      QNotaSaidaCOD_FILIAL.Value := QPedidoNotaCOD_FILIAL.Value;
      QNotaSaidaCOD_OPERACAO.Value := StrToInt(DMOracle.FastSelect('COD_OPERACAO_VENDA', 'TB_PARAM_SISTEMA'));
      QNotaSaidaCOD_CADASTRO.Value := verificaCadatroDebona(QPedidoNotaCOD_PEDIDO_CAB.Value);
      QNotaSaidaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario;
      QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := QPedidoNotaCOD_PRAZO_VENCIMENTO.Value;
      if not QPedidoNotaCOD_VENDEDOR.IsNull then
        QNotaSaidaCOD_VENDEDOR.Value := QPedidoNotaCOD_VENDEDOR.Value;
      QNotaSaidaOBS.Value := QPedidoNotaDESC_OBSERVACAO.Value;
//        QNotaSaidaOBS_COMPLEMENTO.Value := '';
//        QNotaSaidaVAL_IMPOSTO.Value := 0;
//        QNotaSaidaCOD_MENSAGEM.Value := 0;
      QNotaSaidaNUM_PEDIDO.Value := QPedidoNotaNUM_PEDIDO.Value;
      QNotaSaidaPERC_COMISSAO.Value := QPedidoNotaPERC_COMISSAO.Value;
      wSerieOp := DMOracle.FastSelect('COD_SERIE', 'TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text);
      wTipoOp := DMOracle.FastSelect('IND_EMITE', 'TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text);
      if wSerieOp = '' then
      begin
        if wTipoOp = 'F' then
          QNotaSaidaCOD_SERIE.Value := DMParamSistema.QParamSistemaCOD_SERIE_NOTA.Value
        else
          QNotaSaidaCOD_SERIE.Value := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;
      end
      else
        QNotaSaidaCOD_SERIE.Value := wSerieOp;
      if (
        (DMOracle.FastSelect('COUNT(*)', 'TB_PRAZO_VENCIMENTO_DIAS', 'COD_PRAZO_VENCIMENTO = ' + QPedidoNotaCOD_PRAZO_VENCIMENTO.Text) = '1') and
        (DMOracle.FastSelect('NUM_DIAS', 'TB_PRAZO_VENCIMENTO_DIAS', 'COD_PRAZO_VENCIMENTO = ' + QPedidoNotaCOD_PRAZO_VENCIMENTO.Text) = '0')
        ) then
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '1'
      else
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
//        DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := '';

      wPedido := QPedidoNotaCOD_PEDIDO_CAB.Value;

      if QPedidoNotaIND_TIPO_PEDIDO.Value = 'M' then
      begin
        if QPedidoNotaItem.Locate('IND_PRINCIPAL', 'S', []) then
//      if QPedidoNotaItemIND_PRINCIPAL.Value = 'S' then
        begin
          QItemNF.Append;
          QItemNFQT_QUANTIDADE.Value := QPedidoNotaQT_QUANTIDADE.Value;
          QItemNFCOD_PRODUTO.Value := QPedidoNotaItemCOD_PRODUTO_ITEM.Value;
          QItemNFVAL_UNITARIO.Value := Bib.Arredondar(QPedidoNotaVAL_TOTAL.Value / QItemNFQT_QUANTIDADE.Value, 2);
          QItemNFVAL_TOTAL.Value := QItemNFVAL_UNITARIO.Value * QItemNFQT_QUANTIDADE.Value;
          QItemNFVAL_UNITARIO_TABELA.Value := QItemNFVAL_UNITARIO.Value;
          if QPedidoNotaItemCOD_LOTE_TIPO_ITEM.IsNull then
            QItemNFCOD_LOTE_TIPO.Value := 1
          else
            QItemNFCOD_LOTE_TIPO.Value := QPedidoNotaItemCOD_LOTE_TIPO_ITEM.Value;
          QItemNFCOD_TRIBUTACAO.Value := QPedidoNotaItemCOD_TRIBUTACAO_ITEM.Value;
          wIpi := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
          if wIpi <> '' then
            QItemNFPERC_IPI.Value := StrToFloat(wIpi);
          wItem := QItemNFCOD_NOTA_ITEM.Value;
          QItemNFDESC_INF_ADICIONAL.Clear;
          QItemNF.Post;

          wTotalItens := wTotalItens + QPedidoNotaItemVAL_TOTAL_ITEM.Value;
        end;

        QPedidoNotaItem.First;
        while not QPedidoNotaItem.Eof do
        begin
          if QPedidoNotaItemIND_PRINCIPAL.Value <> 'S' then
          begin
            QItemNF.Edit;
            if QItemNFDESC_INF_ADICIONAL.IsNull then
              QItemNFDESC_INF_ADICIONAL.Value := QPedidoNotaItemDESC_PRODUTO_ITEM.Value
            else
              QItemNFDESC_INF_ADICIONAL.Value := QItemNFDESC_INF_ADICIONAL.Value + ', ' + QPedidoNotaItemDESC_PRODUTO_ITEM.Value;
            QItemNF.Post;
          end;

          QPedidoNotaItem.Next;
        end;
      end
      else
      begin
        QPedidoNotaItem.First;
        wTotalItens := 0;
        while not QPedidoNotaItem.Eof do
        begin
          wTotalItens := wTotalItens + QPedidoNotaItemVAL_TOTAL_ITEM.Value;
          QItemNF.Append;
          QItemNFQT_QUANTIDADE.Value := QPedidoNotaItemQT_PEDIDO_ITEM.Value;
          QItemNFCOD_PRODUTO.Value := QPedidoNotaItemCOD_PRODUTO_ITEM.Value;
          QItemNFVAL_UNITARIO.Value := QPedidoNotaItemVAL_UNITARIO_ITEM.Value;
          QItemNFVAL_TOTAL.Value := QPedidoNotaItemVAL_TOTAL_ITEM.Value;
          QItemNFVAL_UNITARIO_TABELA.Value := QPedidoNotaItemVAL_UNITARIO_ITEM.Value;
          if QPedidoNotaItemCOD_LOTE_TIPO_ITEM.IsNull then
            QItemNFCOD_LOTE_TIPO.Value := 1
          else
            QItemNFCOD_LOTE_TIPO.Value := QPedidoNotaItemCOD_LOTE_TIPO_ITEM.Value;
          QItemNFCOD_TRIBUTACAO.Value := QPedidoNotaItemCOD_TRIBUTACAO_ITEM.Value;
          wIpi := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO', 'COD_PRODUTO = ' + QItemNFCOD_PRODUTO.Text);
          if wIpi <> '' then
            QItemNFPERC_IPI.Value := StrToFloat(wIpi);
          wItem := QItemNFCOD_NOTA_ITEM.Value;
          QItemNF.Post;

          QPedidoNotaItem.Next;
        end;
      end;

      QPedidoNota.Next;

//      QNotaSaidaPERC_COMISSAO.Value := QPedidoNotaPERC_COMISSAO.Value;
//      wTotalItensDesconto := wTotalItens - QPedidoNotaVAL_DESCONTO.Value;
//      if wTotalItensDesconto > QPedidoNotaVAL_TOTAL.Value then
//      begin
//        QNotaSaidaVAL_DESCONTO.Value := QPedidoNotaVAL_DESCONTO.Value + (wTotalItensDesconto - QPedidoNotaVAL_TOTAL.Value);
//        QNotaSaidaVAL_DESPESAS.Value := 0;
//      end
//      else
//      begin
//        QNotaSaidaVAL_DESCONTO.Value := 0;
//        QNotaSaidaVAL_DESPESAS.Value := 0;
//      end

//      QNotaSaidaVAL_DESCONTO.Value := QPedidoNotaVAL_DESCONTO.Value;
//      QNotaSaidaVAL_DESPESAS.Value := wTotalItens - QPedidoNotaVAL_DESCONTO.Value;

      wTotalItensDesconto := wTotalItens - QPedidoNotaVAL_DESCONTO.Value;
      QNotaSaidaVAL_DESCONTO.Value := QPedidoNotaVAL_DESCONTO.Value;
      QNotaSaidaVAL_DESPESAS.Value := 0;
      if wTotalItensDesconto < QPedidoNotaVAL_TOTAL.Value then
        QNotaSaidaVAL_DESPESAS.Value := QPedidoNotaVAL_TOTAL.Value - wTotalItensDesconto
      else
        QNotaSaidaVAL_DESCONTO.Value := QNotaSaidaVAL_DESCONTO.Value + (wTotalItensDesconto - QPedidoNotaVAL_TOTAL.Value);

//      MePrazo.Text := DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text;

      QNotaSaida.Post;

      DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET ' +
        'IND_SITUACAO = ' + QuotedStr('6') + ', ' +
        'DT_GERACAO_NOTA = SYSDATE WHERE COD_PEDIDO_CAB = ' + IntToStr(wPedido));
    end;

  FPedidoCompostoCons.GbSituacao.Enabled := True;
end;

function TFNotaSaidaCad.verificaCadatroDebona(codPedido: Integer): Integer;
var wCodCadastro: string;
begin
  FComparaCadastro := TFComparaCadastro.Create(Application);
  if FComparaCadastro.carregar(codPedido) then
    Result := FComparaCadastro.codCliente
  else
  begin
    SBCancelar.Click;
    Abort;
  end;
end;

procedure TFNotaSaidaCad.DBEdit57Change(Sender: TObject);
begin
  inherited;
  //DMNotaSaida.QItemNFDESC_INF_ADICIONAL.Clear;   Comentado por Andre e passado para o Exit
end;

procedure TFNotaSaidaCad.DenegarNota1Click(Sender: TObject);
var wComando: string;
begin
  inherited;
  if DMNotaSaida.QNotaSaida.RecordCount = 0 then
  begin
    MessageDlg('Nenhuma nota foi selecionada', mtError, [mbOk],0);
    Abort;
  end;
  if (DMNotaSaida.QNotaSaidaIND_SITUACAO.Value <> '2') and
    (DMNotaSaida.QNotaSaidaIND_SITUACAO.Value <> '1') then
  begin
    MessageDlg('Somente notas Digitadas ou Confirmadas podem ser Denegadas',
      mtError, [mbOk],0);
      Abort;
  end;

  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value <> '' then
  begin
    if DMOracle.FastSelect('DESC_RETORNO_PROCESSAMENTO', 'TB_NF_ELETRONICA'
      , 'DESC_CHAVE_ACESSO = '
      + quotedStr(copy(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value
        , 4
        , Length(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value)-3))
      )
      <> '205' then
    begin
      MessageDlg('NF-e deve estar denegada pela SEFAZ', mtError, [mbOk], 0);
      //Abort;
    end;
    try
      if DMNotaSaida.QNotaSaidaIND_SITUACAO.Value = '2' then
        VoltaConfirmao1Click(Sender);
      DMNfe.DenegaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value);

      // Volta a baixa do pedido
      DMNotaSaida.QItemNF.First;
      While not DMNotaSaida.QItemNF.Eof do
      Begin
        DMNotaSaida.QCancelaDesdobramento.Close;
        DMNotaSaida.QCancelaDesdobramento.SetVariable('COD_NOTA_ITEM'
          ,DMNotaSaida.QItemNFCod_Nota_Item.Value);
        DMNotaSaida.QCancelaDesdobramento.ExecSQL;

        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_BAIXA_PEDIDO';
        wComando := wComando + ' WHERE COD_NOTA_ITEM = '+FloatToStr(DMNotaSaida.QItemNFCod_Nota_Item.Value);
        DMOracle.QExecSQL.SQL.Add(wComando);
        DMOracle.QExecSQL.ExecSQL;
        DMNotaSaida.QItemNF.Next;
      End;
      DMOracle.DBCemapa.Commit;
    except
      on E : Exception do
      begin
        DMOracle.DBCemapa.Rollback;
      end;
    end;
  end;
  SBRefreshClick(Sender);
end;

procedure TFNotaSaidaCad.VoltarNotaDenegada1Click(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value <> '' then
    DMNfe.DenegaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, true);
  SBRefreshClick(Sender);
end;

procedure TFNotaSaidaCad.DBTSitSefazMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBTSitSefaz.Hint :=
    DMNotaSaida.QNotaSaidadesc_situacao_sefaz.Value;
end;

procedure TFNotaSaidaCad.ExportarNFe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfExportar;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaSaidaCad.VerretornodeenvioNFe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfRetornoEnvio;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaSaidaCad.DBECfopExit(Sender: TObject);
begin
  inherited;
  if DBECfop.Text <> '' then
    if StrToInt(Trim(DBECfop.Text)) < 5000 then
    begin
      DBECfop.SetFocus;
      raise Exception.Create('Cfop deve ser de saída');
    end;
end;

procedure TFNotaSaidaCad.SbUltimasVendasClick(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QNotaSaidaCod_Cadastro.Text = '' then
    raise Exception.Create('Preencher Código Cadastro');
  if DMNotaSaida.QItemNFCod_Produto.Text = '' then
    raise Exception.Create('Preencher Código Produto');
  if FNotaUltimasVendas = nil then
    FNotaUltimasVendas := TFNotaUltimasVendas.Create(Application);
  DMNotaSaida.QUltimasVendas.Close;
  DMNotaSaida.QUltimasVendas.SetVariable('Cod_Cadastro', DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
  DMNotaSaida.QUltimasVendas.SetVariable('Cod_Produto', DMNotaSaida.QItemNFCod_Produto.Value);
  DMNotaSaida.QUltimasVendas.Open;
  FNotaUltimasVendas.ShowModal;
end;

procedure TFNotaSaidaCad.DBECodOperacaoExit(Sender: TObject);
var wOperacao, wModelo: string;
begin
  inherited;
  with DMOperacao, DMNotaSaida do
  begin
    if (Trim(DBECodOperacao.Text) = '') Then  // quando não informado o codigo de operação não executa está procedure
      Exit;
    QOperacao.Close;
    QOperacao.SetVariable('PK',Trim(DBECodOperacao.Text));
    QOperacao.Open;
    if QOperacaoIND_TIPO_OPERACAO.Value <> 'S' then
    begin
      QNotaSaidaCOD_OPERACAO.Clear;
      DBECodOperacao.SetFocus;
      raise Exception.Create('A operação informada não é de saida.');
    end;
    //Alterar Série e Modelo quando alterar a operacao. Junior - 04/07/2018

    if (QOperacaoCOD_SERIE.Value <> '') or (QOperacaoCOD_SERIE_MODELO.Value <> '') then
    begin
      QNotaSaidaCOD_SERIE.Text := QOperacaoCOD_SERIE.Value;
      QNotaSaidaCOD_SERIE_MODELO.Text := QOperacaoCOD_SERIE_MODELO.Value;
    end;
  {Adicionado para a Stein para puxar a série da filial, pois eles emitem nota de produto e o cadastro da filial é sempre o mesmo, mudando apenas a inscrição estadual
  por isto foram criados séries diferentes. Alex 25/03/2024}
    if (DMParamSistema.CodEmpresa = 'STEIN') then
    begin
      QNotaSaidaCOD_SERIE_MODELO.Text := QOperacaoCOD_SERIE_MODELO.Value;
      if (QOperacaoCOD_SERIE.Text = '') then
        DBPSerie.DBEdit.Text := DMOracle.FastSelect('COD_SERIE','TB_FILIAL','COD_FILIAL = ' + Trim (DBEdit3.Text) )
      else
        QNotaSaidaCOD_SERIE_MODELO.Text := QOperacaoCOD_SERIE_MODELO.Value;
    end;
  end;
end;

procedure TFNotaSaidaCad.DBPanel8DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFNotaSaidaCad.CurvaABC1Click(Sender: TObject);
Var wTotal : Real;
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[52].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      if FRCurvaABC = nil then
        FRCurvaABC := TFRCurvaABC.Create(Application);
      QRCurvaABC.Close;
      if Trim(FNotaSaidaParam.Fm53Filial.MeFilial.Text) <> '' then
        QRCurvaABC.SetVariable('COD_FILIAL', StrToInt(Trim(FNotaSaidaParam.Fm53Filial.MeFilial.Text)))
      else
        QRCurvaABC.SetVariable('COD_FILIAL', Null);
      if Trim(FNotaSaidaParam.Fm53Cadastro.MeCadastro.Text) <> '' then
        QRCurvaABC.SetVariable('COD_CADASTRO', StrToInt(Trim(FNotaSaidaParam.Fm53Cadastro.MeCadastro.Text)))
      else
        QRCurvaABC.SetVariable('COD_CADASTRO', Null);
      if Trim(FNotaSaidaParam.Fm53Vendedor.MeVendedor.Text) <> '' then
        QRCurvaABC.SetVariable('COD_VENDEDOR', StrToInt(Trim(FNotaSaidaParam.Fm53Vendedor.MeVendedor.Text)))
      else
        QRCurvaABC.SetVariable('COD_VENDEDOR', Null);

      if Trim(FNotaSaidaParam.FmOperacao52.MeOperacao.Text) <> '' then
        QRCurvaABC.SetVariable('COD_OPERACAO', StrToInt(Trim(FNotaSaidaParam.FmOperacao52.MeOperacao.Text)))
      else
        QRCurvaABC.SetVariable('COD_OPERACAO', Null);

      if Trim(FNotaSaidaParam.Fm53SubClasse.MeClasse.Text) <> '' then
        QRCurvaABC.SetVariable('NUM_CLASSE', StrToInt(Trim(FNotaSaidaParam.Fm53SubClasse.MeClasse.Text)))
      else
        QRCurvaABC.SetVariable('NUM_CLASSE', Null);
      if (Trim(FNotaSaidaParam.Fm53SubClasse.MeSubClasse.Text) <> '') And
         (Trim(FNotaSaidaParam.Fm53SubClasse.MeSubClasse.Text) <> '0') then
        QRCurvaABC.SetVariable('NUM_SUBCLASSE', StrToInt(Trim(FNotaSaidaParam.Fm53SubClasse.MeSubClasse.Text)))
      else
        QRCurvaABC.SetVariable('NUM_SUBCLASSE', Null);
      QRCurvaABC.SetVariable('NR_ITENS', StrToInt(Trim(FNotaSaidaParam.Me53NrItens.Text)));
      QRCurvaABC.SetVariable('DATA_I', FNotaSaidaParam.Fm53Datas.MeDtInicial.Text);
      QRCurvaABC.SetVariable('DATA_F', FNotaSaidaParam.Fm53Datas.MeDtFinal.Text + ' 23:59:59');
      Case FNotaSaidaParam.Rg53TipoCurva.ItemIndex Of
        0 :
          Begin
            QRCurvaABC.SetVariable('ORDENAR','VAL_CUSTO');
            FRCurvaABC.QRDBValor.Datafield := 'VAL_CUSTO';
          End;
        1 :
          Begin
            QRCurvaABC.SetVariable('ORDENAR','SVAL_TOTAL');
            FRCurvaABC.QRDBValor.Datafield := 'SVAL_TOTAL';
          End;
        2 :
          Begin
            QRCurvaABC.SetVariable('ORDENAR','SQT_QUANTIDADE');
            FRCurvaABC.QRDBValor.Datafield := 'SQT_QUANTIDADE';
          End;
      End;
      QRCurvaABC.Open;
      wTotal := 0;
      While Not (QRCurvaABC.Eof) do
       Begin
        Case FNotaSaidaParam.Rg53TipoCurva.ItemIndex Of
          0 : wTotal := wTotal + QRCurvaABCVAL_CUSTO.Value;
          1 : wTotal := wTotal + QRCurvaABCSVAL_TOTAL.Value;
          2 : wTotal := wTotal + QRCurvaABCSQT_QUANTIDADE.Value;
        End;
        QRCurvaABC.Next;
       End;
      QRCurvaABC.First;
      FRCurvaABC.wTotal := wTotal;
      FRCurvaABC.wIndTipo := FNotaSaidaParam.Rg53TipoCurva.ItemIndex;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'NEOALI' then
      begin
        FRCurvaABC.QRDBText2.Width := 230;
        FRCurvaABC.QRDBText2.Left := 96;
        FRCurvaABC.QRDBText2.datafield := 'NUM_FABRICANTE';
      end;
      
      FRCurvaABC.QRLTitulo.Caption := 'Curva ABC De ' + FNotaSaidaParam.Fm53Datas.MeDtInicial.Text + ' Até ' + FNotaSaidaParam.Fm53Datas.MeDtFinal.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRCurvaABC.QRPrimario.Preview
      else
        FRCurvaABC.QRPrimario.Print;

      QRCurvaABC.Close;
    end;
end;

procedure TFNotaSaidaCad.SBImprimeNFConsClick(Sender: TObject);
begin
  inherited;
  If (DMparamsistema.CodEmpresa <> 'COZER')     and
     (DMparamsistema.CodEmpresa <> 'PROPE')     and
     (DMparamsistema.CodEmpresa <> 'INSIDE')    and
     (DMparamsistema.CodEmpresa <> 'DISPART')   and
     (DMparamsistema.CodEmpresa <> 'KREUZ')     and
     (DMparamsistema.CodEmpresa <> 'BORGES')    then
  begin
    if (DMNotaSaida.QNotaSaidaInd_Situacao.Value       <> '2')      and
       (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '4')      then
      raise Exception.Create('Somente Notas Confirmadas Para Emitir Cópia de Nota');
    //    If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Operacao.Value)) = 'F' Then
    //       Raise Exception.Create('Somente é Permitido Está Operação Com Nota Fiscal');
  end;
  if FNotaConsumidorNome = nil then
    FNotaConsumidorNome := TFNotaConsumidorNome.Create(Application);
  if FNotaConsumidorNome.ShowModal = mrOk then
    with DMNotaSaida do
    begin
      If  ((DMParamsistema.CodEmpresa <> 'COZER')    and
          (DMParamsistema.CodEmpresa <> 'PROPE')     and
          (DMParamsistema.CodEmpresa <> 'INSIDE')    and
          (DMParamsistema.CodEmpresa <> 'DISPART')   and
          (DMParamsistema.CodEmpresa <> 'BORGES')    and
          (DMParamsistema.CodEmpresa <> 'KREUZ'))    and
          (DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2') then // somente para notas confirmadas que muda
      begin
        pNotaNome := True; // este campo testa na query QNotaCab // before post // before edit
        if (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') or
           (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') then
        begin
          QNotaSaida.Edit;
          if (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') then
            QNotaSaidaCod_Cadastro.Value := StrToInt(Trim(FNotaConsumidorNome.MeCadastro.Text));
          if (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') then
            QNotaSaidaCod_Operacao.Value := StrToInt(trim(FNotaConsumidorNome.MeOperacao.Text));
          if (Trim(FNotaConsumidorNome.MeSerie.Text) <> '') then
            QNotaSaidaCod_Serie.Value := Trim(FNotaConsumidorNome.MeSerie.Text);
          if (Trim(FNotaConsumidorNome.MeNumero.Text) = '') then
            QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value,
              QNotaSaidaCOD_SERIE_MODELO.Value)
          else
            QNotaSaidaNum_Nota.Value := StrToInt(Trim(FNotaConsumidorNome.MeNumero.Text));
          QNotaSaida.Post;
          DMOracle.DBCemapa.Commit;
        end;
        pNotaNome := False; // este campo testa na query QNotaCab // before post // before edit
      end;
      if (Trim(FNotaConsumidorNome.EdCadastro.Text) <> '') Or
         (Trim(FNotaConsumidorNome.MeCadastro.Text)  = '') then
      begin
        QNotaNome.Close;
        QNotaNome.SetVariable('PK', QNotaSaidaCod_Nota_Cab.Value);
        QNotaNome.Open;
        if QNotaNome.Eof then
          QNotaNome.Insert
        else
          QNotaNome.Edit;
        QNotaNomeCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
        QNotaNomeNOME.Value := Trim(FNotaConsumidorNome.EdCadastro.Text);
        QNotaNomeDESC_ENDERECO.Value := Trim(FNotaConsumidorNome.MeEndereco.Text);
        QNotaNomeDESC_CGC_CPF.Value := Trim(FNotaConsumidorNome.MeCgc_Cpf.Text);
        QNotaNomeDESC_INSCRICAO.Value := Trim(FNotaConsumidorNome.MeInscricao.Text);
        QNotaNomeDESC_CIDADE.Value := Trim(FNotaConsumidorNome.edCidade.Text);
        QNotaNomeDESC_ESTADO.Value := Trim(FNotaConsumidorNome.edEstado.Text);
        QNotaNomeDESC_CEP.Value := Trim(FNotaConsumidorNome.edCEP.Text);
        if QNotaSaida.State = DsInsert then
        begin
          QNotaSaida.Post;
          QNotaSaida.Edit;
        end;
        QNotaNome.Post;
      end;
    end;
  If (DMParamsistema.CodEmpresa <> 'COZER')     and
     (DMParamsistema.CodEmpresa <> 'PROPE')     and
     (DMParamsistema.CodEmpresa <> 'INSIDE')    and
     (DMParamsistema.CodEmpresa <> 'DISPART')   and
     (DMParamsistema.CodEmpresa <> 'KREUZ')     and
     (DMParamsistema.CodEmpresa <> 'BORGES')    then
  begin
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
      if (DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
      begin
        if FImpressoraFiscal = nil then
          FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        FimpressoraFiscal.EmiteCF_Yanco(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      end
      else
        FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
  end;

end;

procedure TFNotaSaidaCad.Emite1Click(Sender: TObject);
begin
  inherited;
  if(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.IsNull) then
    MessageDlg('Selecione uma nota antes de emitir as promissórias!', mtError, [mbOK], 0)
  else if(DMNotaSaida.QNotaSaidaIND_SITUACAO.Value <> '2') then
    MessageDlg('A nota precisa estar confirmada para emitir as promissórias!', mtError, [mbOK], 0)
  else if(DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '2') then
    MessageDlg('Para emitir promissórias a nota deve ser a prazo!', mtError, [mbOK], 0)
  else
  begin
    with DMContasReceber do
    begin
      QRContasReceber_Duplicatas.Close;
      QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', DMNotaSaida.QNotaSaidaCod_Filial.Value);
      QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', Null);
      QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_CADASTRO', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR', Null);
      QRContasReceber_Duplicatas.Open;
    end;
    if DMParamSistema.QParamSistemaIND_IMPRESSAO_PROMISSORIA.Value = 'M' then
      FPromissoria.Promissoria_Dos
    else
    begin
      if FRPromissorias = nil then
         FRPromissorias := TFRPromissorias.Create(Application);
      FRPromissorias.QRPrimario.Preview;
    end;
  end;
end;

procedure TFNotaSaidaCad.ExportarNotasdeSada1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[53].TabVisible := True;
  if FNotaSaidaParam.ShowModal = MrOk then
  begin
    if Application.MessageBox('Este processo poderá demorar alguns minutos dependendo da quantidade de notas.'+#13+#10+
              'Deseja continuar?', 'Atenção', MB_ICONINFORMATION or MB_YESNO) = IDYES then
      //exportaNotasSaida;
      ExportacaoClienteFornecedor;
  end;
end;

procedure TFNotaSaidaCad.exportaNotasSaida;
var
  S : String;
  F : TextFile;
  wSequencia : integer;
  wTotalContabil, wTotalBaseICMS, wTotalICMS, wTotalIsentoICMS : Real;
  wTotalBase_ST, wTotalIcms_ST, wTotalMercadoria_ST : Real;
begin
   wSequencia          := 1;
   wTotalBase_ST       := 0;
   wTotalIcms_ST       := 0;
   wTotalMercadoria_ST := 0;
   wTotalContabil      := 0;
   wTotalBaseICMS      := 0;
   wTotalICMS          := 0;
   wTotalIsentoICMS    := 0;
  try
    //ExportacaoClienteFornecedor;
    with DMNotaSaida do
    begin
      QNotaSaidaExp.Close;
      if (Trim(FNotaSaidaParam.FmDatas53.MeDtInicial.Text) <> '') and
         (Trim(FNotaSaidaParam.FmDatas53.MeDtFinal.Text) <> '') then
      begin
        QNotaSaidaExp.SetVariable('DT_EMISSAO_I',FNotaSaidaParam.FmDatas53.MeDtInicial.Text);
        QNotaSaidaExp.SetVariable('DT_EMISSAO_F',FNotaSaidaParam.FmDatas53.MeDtFinal.Text);
       // ExportacaoClienteFornecedor;
      end
      else
      begin
        Application.MessageBox('Informe a Data Inicial e Data Final de emissão das notas.', 'Atenção', MB_ICONINFORMATION or MB_OK);
        Exit;
      end;
      QNotaSaidaExp.Open;
      QNotaSaidaExp.First;
      S := S + '0'+                                    //LAYOUT - REGISTRO HEADER
      bib.TiraMascara(DateToStr(DMOracle.DataServ)) +  //Data de geraçao do arquivo
      bib.FormataTexto(bib.FormataCNPJ_CPF(bib.TiraMascara(QNotaSaidaExpNUM_CGC.Value)),18)+   //CNPJ da Filial
      '1'                          +                   //Opção para CÁLCULOS BASES
      bib.FormataTexto(' ',3,' ')  +                   //Origem
      Bib.FormataTexto(' ',443,' ')+                   //Brancos
      Bib.FormataTexto(' ',20,' ') +                   //Uso da EBS
      bib.StrZero2(wSequencia,6,0);                    //Sequencia

      wSequencia := wSequencia + 1;
      S := S+Chr(13)+Chr(10);
      while not QNotaSaidaExp.Eof do
      begin
        {S := S + '0'+                                    //LAYOUT - REGISTRO HEADER
        bib.TiraMascara(DateToStr(DMOracle.DataServ)) +  //Data de geraçao do arquivo
        bib.FormataTexto(bib.FormataCNPJ_CPF(bib.TiraMascara(QNotaSaidaExpNUM_CGC.Value)),18)+   //CNPJ da Filial
        '1'                          +                   //Opção para CÁLCULOS BASES
        bib.FormataTexto(' ',3,' ')  +                   //Origem
        Bib.FormataTexto(' ',443,' ')+                   //Brancos
        Bib.FormataTexto(' ',20,' ') +                   //Uso da EBS
        bib.StrZero2(wSequencia,6,0);                    //Sequencia

        wSequencia := wSequencia + 1;
        S := S+Chr(13)+Chr(10); }

        //LAYOUT REGISTRO EMITENTE/DESTINATÁRIO
        S := S + '4' +
        bib.FormataTexto(Bib.FormataCNPJ_CPF(bib.TiraMascara(QNotaSaidaExpNUM_CGC_CPF.Text)),18)+
        bib.FormataTexto(QNotaSaidaExpNOME.Text,40)+
        bib.FormataTexto(QNotaSaidaExpDESC_FANTASIA.Text,20)+
        bib.FormataTexto(QNotaSaidaExpCOD_ESTADO.Text,2,' ');
        if QNotaSaidaExpNUM_INSCRICAO.Text = 'ISENTO' then
         S := S + bib.FormataTexto(QNotaSaidaExpNUM_INSCRICAO.Value,20,' ')
        else
         S := S + RMaskCGC_CPF(QNotaSaidaExpNUM_INSCRICAO.Text,20);
        S := S + bib.FormataTexto(QNotaSaidaExpDESC_ENDERECO.Text,40,' ')+
        bib.FormataTexto(QNotaSaidaExpDESC_BAIRRO.Text,20,' ') +
        bib.FormataTexto(QNotaSaidaExpDESC_CIDADE.Text,20,' ') +
        RMaskCGC_CPF(QNotaSaidaExpDESC_CEP.Text,8) +
        RMaskCGC_CPF(QNotaSaidaExpCOD_CIDADE.Text,4,) +
        RMaskCGC_CPF(QNotaSaidaExpDESC_TELEFONE.Text,13) +
        Bib.FormataTexto('0',18,'0');             //Campos-CTA.CLIENTE/HIS.CLIENTE/CTA.FORN./HIS.FORN.
        if (QNotaSaidaExpPERC_FUNRURAL.Text > '0') and (QNotaSaidaExpPERC_FUNRURAL.Text <> null)then
          S := S + 'S'
        else
         S := S + 'N';
        S := S + Bib.FormataTexto(' ',18,' ') +
        bib.FormataTexto(' ',5,' ')+
        Bib.FormataTexto(' ',20,' ') +
        Bib.FormataTexto(QNotaSaidaExpDESC_SUFRAMA.Text,9,'0') +
        RMaskCGC_CPF(QNotaSaidaExpCOD_PAIS_IBGE.Text,5) +
        {Para Nat. Juridica  - ADICIONADO 'O' PARA DEIXAR EM BRANCO
                     1-Pessoa Juridica de Direito Privado  2-Órgão, Autarquia ou Fundação Federal;
                     3-Demais Entidades;                   4-Órgão, Autarquia ou Fundação Estadual ou Municipal;
                     5-Sociedade; }
         '5' +
         Bib.FormataTexto(QNotaSaidaExpCOD_UF_IBGE.Text,2)+Bib.FormataTexto(QNotaSaidaExpCOD_CIDADE_IBGE.Text,5,'0')+
         Bib.FormataTexto(' ',204,' ') +
         Bib.StrZero2(wSequencia,6,0);
         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         //LAYOUT DO REGISTRO DE NOTAS FISCAIS
         S := S + '1' +
         bib.TiraMascara(DateToStr(QNotaSaidaExpDT_RECEBIMENTO.Value)) +
         bib.StrZero(QNotaSaidaExpCOD_NOTA_CAB.Text,6) + //Numero Inicial
         bib.StrZero(QNotaSaidaExpCOD_NOTA_CAB.Text,6) + //Numero Final
         bib.TiraMascara(DateToStr(QNotaSaidaExpDT_EMISSAO.Value)) +
         Bib.FormataTexto(' ',3,' ') +     //RESERVADO
         bib.FormataTexto(QNotaSaidaExpCOD_SERIE_MODELO.Value,2)   +
         bib.FormataTexto(QNotaSaidaExpCOD_SERIE.Value,3,' ') +
         //SUBSÉRIE
         Bib.FormataTexto(' ',3,' ') +
         Bib.FormataTexto(QNotaSaidaExpCFOP.Text,4,' ') +
         //Variacao/Classificacao1/classificacao2
         '01' + '00'+ '00' +
         bib.FormataTexto(Bib.FormataCNPJ_CPF(bib.TiraMascara(QNotaSaidaExpNUM_CGC_CPF.Text)),18)+
         bib.StrZeroDecimal(QNotaSaidaExpVAL_TOTAL.Value,12,2) +
         bib.StrZeroDecimal(100,12,2) +     //BASE PIS - FIXO 100%
         bib.StrZeroDecimal(100,12,2) +     //BASE COFINS - FIXO 100%
         bib.StrZeroDecimal(0,12,2)   +     //BASE CSLL
         bib.StrZeroDecimal(0,12,2)   +     //BASE IRPJ
         bib.FormataTexto(' ',8,' ') ;// +     //Brancos    ;
         //showMessage(bib.FormataTexto(QNotaSaidaExpPERC_ALIQUOTA.AsString,4,'0'));
         S := S + Trim(bib.StrZeroDecimal(QNotaSaidaExpVAL_ICM_BASE.Value,12,2)) +  //BASE ICMS A
         bib.FormataTexto(QNotaSaidaExpPERC_ALIQUOTA.Text,4,'0')+
        // bib.StrZeroDecimal(QNotaSaidaExpPERC_ALIQUOTA.AsInteger,4,2) +  //ALIQUOTA ICMS A
         bib.StrZeroDecimal(QNotaSaidaExpVAL_ICM.Value,12,2)  +      //VALOR ICMS A
         bib.StrZeroDecimal(0,12,2)  +      //BASE ICMS B
         bib.StrZeroDecimal(0,4,2)   +      //ALIQUOTA ICMS B
         bib.StrZeroDecimal(0,12,2)  +      //VALOR ICMS B
         bib.StrZeroDecimal(0,12,2)  +      //BASE ICMS C
         bib.StrZeroDecimal(0,4,2)   +      //ALIQUOTA ICMS C
         bib.StrZeroDecimal(0,12,2)  +      //VALOR ICMS C
         bib.StrZeroDecimal(0,12,2)  +      //BASE ICMS D
         bib.StrZeroDecimal(0,4,2)   +      //ALIQUOTA ICMS D
         bib.StrZeroDecimal(0,12,2)  +      //VALOR ICMS D
         bib.StrZeroDecimal(QNotaSaidaExpSVAL_ICM_BASE_ISENTO.Value,12,2)  + //ISENTA ICMS
         bib.StrZeroDecimal(0,12,2)  +      //OUTRAS ICMS
         bib.StrZeroDecimal(0,12,2)  +      //BASE IPI
         bib.StrZeroDecimal(0,12,2)  +      //VALOR IPI
         bib.StrZeroDecimal(0,12,2)  +      //ISENTAS IPI
         bib.StrZeroDecimal(0,12,2);        //OUTRAS IPI
         if DBCheckBox1.Checked = True then
         begin  //MERCADORIAS ST / BASE ST / ICMS ST
           S := S + bib.StrZeroDecimal(QNotaSaidaExpVAL_Total.Value,12,2) + //TOTAL ST
           bib.StrZeroDecimal(QNotaSaidaExpVAL_BASE_SUBST.Value,12,2)  +    //TOTAL BASE ST
           bib.StrZeroDecimal(QNotaSaidaExpVAL_ICMS_SUBST.Value,12,2)  ;    //TOTAL ICMS ST
           wTotalBase_ST       := wTotalBase_ST       + QNotaSaidaExpVAL_Total.Value     ;
           wTotalIcms_ST       := wTotalIcms_ST       + QNotaSaidaExpVAL_BASE_SUBST.Value;
           wTotalMercadoria_ST := wTotalMercadoria_ST + QNotaSaidaExpVAL_ICMS_SUBST.Value;
         end
         else
         begin
           S := S + bib.StrZeroDecimal(0,12,2) +   //TOTAL ST
           bib.StrZeroDecimal(0,12,2) +            //TOTAL BASE ST
           bib.StrZeroDecimal(0,12,2);             //TOTAL ICMS ST
         end;
         S := S + bib.StrZeroDecimal(0,12,2)  + //DIFERIDAS
         bib.StrZeroDecimal(0,12,2)   +         //BASE ISS
         bib.StrZeroDecimal(0,4,2)    +         //ALIQUOTA ISS
         bib.StrZeroDecimal(0,12,2)   +         //VALOR ISS
         bib.StrZeroDecimal(0,12,2)   +         //ISENTA ISS
         bib.StrZeroDecimal(0,12,2)   +         //IRRF RETIDO
         Bib.FormataTexto(' ',50,' ') +         //OBSERVACOES
         bib.FormataTexto(QNotaSaidaExpDESC_RESUMO.Text,5,' '); //ESPECIE DO DOCUMENTO
         //TIPO DE VENDA
         case  StrToInt(QNotaSaidaExpIND_CONDICAO_PAGTO.Text) of
           1 : S := S + 'S';
           2 : S := S + 'N';
          else   S := S + 'X';
         end;
         S := S + bib.StrZero2(0,4,0) + // NAT. OPERACAO ST
         bib.StrZeroDecimal(0,8,2);     //BASE PIS/COFINS ST
         //TIPO DE FRETE
         if Trim(QNotaSaidaExpIND_TIPO_FRETE.Text) <> '' then
         begin
           if(QNotaSaidaExpIND_TIPO_FRETE.Text = 'CIF') then
             S := S + '1';
           if(QNotaSaidaExpIND_TIPO_FRETE.Text = 'FOB') then
             S := S + '2';
         end
         else
           S := S + '0';
         S := S + bib.StrZeroDecimal(0,12,2) + //PIS RETIDO
         bib.StrZeroDecimal(0,12,2) +          //COFINS RETIDO
         bib.StrZeroDecimal(0,12,2) +          //CSLL RETIDO
         Bib.StrZeroDecimal(0,8,0)        +    //DATA RECEBIMENTO
         Bib.StrZeroDecimal(0,4,0)        +    //OPERACAO CONTABIL
         bib.StrZeroDecimal(0,12,2)       +    //TOTAL MATERIAIS de prestação de serviço
         bib.StrZeroDecimal(0,12,2)       +    //SUBEMPRETIADA de prestação de serviço
         bib.StrZeroDecimal(0,4,0)        +    //CÓDIGO DE SERVIÇO
         bib.StrZeroDecimal(0,6,0)        +    //CLIFOR - Campo Reservado
         bib.FormataTexto(' ',18,' ') +        //IDENTIFICACAO EXTERIOR
         bib.FormataTexto(' ',5,' ') +         //RESERVADO
         bib.StrZero2(wSequencia,6,0);         //Sequencia
         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         //LAYOUT DO REGISTRO DE PRODUTOS
         S := S + '2' +
         bib.StrZero2(QNotaSaidaExpCOD_PRODUTO.Value,10,0)         +
         bib.StrZeroDecimal(QNotaSaidaExpQT_QUANTIDADE.Value,9,3)  +
         bib.StrZeroDecimal(QNotaSaidaExpVAL_TOTAL.Value,12,2)     +
         //DEIXAR EM BRANCO - QUANTIDADE -2
         bib.FormataTexto(' ',13,' ')+
         bib.StrZeroDecimal(QNotaSaidaExpVAL_DESCONTO.Value,12,2)  +
         bib.StrZeroDecimal(QNotaSaidaExpVAL_ICM_BASE.Value,12,2)  +
         bib.StrZeroDecimal(QNotaSaidaExpPERC_ALIQUOTA.Value,5,2) +
         bib.StrZeroDecimal(QNotaSaidaExpVAL_IPI.Value,12,2)       +
         bib.StrZeroDecimal(QNotaSaidaExpVAL_BASE_SUBST.Value,12,2)+
         bib.strZeroDecimal(QNotaSaidaExpPERC_IPI.Value,5,2)+
         bib.StrZeroDecimal(0,5,2)+                //PREC.RED.ICMS
         bib.StrZero(QNotaSaidaExpDESC_SITUACAO_TRIB.Value,3) +
         bib.FormataTexto(QNotaSaidaExpNUM_FABRICANTE.Value,15, ' ') +
         bib.StrZero(QNotaSaidaExpCOD_CST_IPI.Value,3)   +
         Bib.StrZeroDecimal(0,12,2) +  //BASE IPI
         Bib.FormataTexto(QNotaSaidaExpCOD_CST_PIS.Value,2,'0') +
         Bib.StrZeroDecimal(0,12,2)+   //BASE PIS
         Bib.StrZeroDecimal(0,7,4)+    //ALIQUOTA PIS
         Bib.StrZeroDecimal(0,13,3)+   //QTDE DE BASE DE PIS
         Bib.StrZeroDecimal(0,14,4)+   //ALIQUOTA DE PIS (R$)
         Bib.StrZeroDecimal(QNotaSaidaExpVAL_PIS.Value,12,2) +
         Bib.FormataTexto(QNotaSaidaExpCOD_CST_COFINS.Value,2,'0') +
         bib.strzerodecimal(0,12,2)+  //BASE COFINS
         Bib.StrZeroDecimal(0,7,4) +  //ALIQUOTA COFINS
         Bib.StrZeroDecimal(0,13,3) + //QUANTIDADE DE BASE COFINS
         bib.StrZeroDecimal(0,14,4)+  //ALIQUOTA DE COFINS
         Bib.StrZeroDecimal(QNotaSaidaExpVAL_CONFINS.Value,12,2) +
         bib.StrZeroDecimal(QNotaSaidaExpVAL_ICMS_SUBST.Value,12,2)+
         Bib.StrZeroDecimal(0,5,2) +  //ALIQUOTA ICMS ST
         Bib.StrZeroDecimal(QNotaSaidaExpVAL_ICM.Value,12,2) +
         Bib.FormataTexto(QNotaSaidaExpCFOP.Text,4,'0') +
         bib.FormataTexto(QNotaSaidaExpDESC_UNIDADE.Value,6, ' ') +
         Bib.FormataTexto(' ',194,' ') + //BRANCOS/USO DA EBS
         bib.StrZero2(wSequencia,6,0);   //Sequencia
         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         //LAYOUT DADOS COMPLEMENTARES DA NOTA FISCAL DE SAIDA
         S := S + '5' +
         bib.StrZeroDecimal(QNotaSaidaExpSVAL_TOTAL.Value,12,2)     +
         bib.StrZeroDecimal(QNotaSaidaExpSVAL_DESCONTO.Value, 12,2) +
         bib.StrZeroDecimal(QNotaSaidaExpSVAL_FRETE.Value,12,2)     +
         bib.StrZeroDecimal(QNotaSaidaExpSVAL_DESPESAS.Value, 12,2) +
         bib.StrZeroDecimal(0,12,2)+    //TOTAL SEGURO
         bib.StrZeroDecimal(QNotaSaidaExpNUM_PESO_BRUTO.Value,8,2)  +
         bib.StrZeroDecimal(QNotaSaidaExpNUM_PESO_LIQUIDO.Value,8,2)+
         RMaskCGC_CPF(QNotaSaidaExpNUM_CGC_CPF.Text,18) +
         Bib.StrZero2(QNotaSaidaExpCOD_TRANSPORTE.Value,1,0) +
         bib.FormataTexto(QNotaSaidaExpDESC_PLACA.Value,15, ' ')+
         bib.StrZero2(QNotaSaidaExpNUM_VOLUMES.Value,6,0)+
         bib.FormataTexto(QNotaSaidaExpDESC_ESPECIE.Text,10, ' ') +
         //PARA EXPORTACAO DE PRODUTOS
         bib.StrZeroDecimal(0,12,0)  + //NUMERO RE
         bib.StrZeroDecimal(0,11,0)  + //NUMERO Despacho
         bib.StrZeroDecimal(0,6,0)   + //PAÍS Destino
         bib.StrZeroDecimal(0,6,0)   + //Moeda
         bib.StrZeroDecimal(0,8,0)   + //DATA Despacho
         bib.StrZeroDecimal(0,12,0)  + //VALOR Despacho
         bib.StrZeroDecimal(0,18,0)  + //Remetente
         bib.FormataTexto(' ',2,' ') + //UF Destino
         bib.FormataTexto(' ',18,' ')+ //IDENTIFICACAO Exterior Remetente
         'N' +     //REDESPACHO
         bib.StrZeroDecimal(0,12,2)  + //INSS RETIDO DAS NOTAS DE SERVIÇO
         bib.StrZeroDecimal(0,12,2)  + //FUNRURAL RETIDO
         bib.FormataTexto(QNotaSaidaExpDESC_CHAVE_ACESSO.Value, 44,' ') +
         'N' +     //ISS RETIDOS S/N
         'N' +     //ISS DEVIDO PRESTACAO S/N
         bib.FormataTexto(' ',2,' ')+ //UF PRESTACAO DE SERVICO
         bib.StrZeroDecimal(0,7,0)  + //MUNICIPIO PRESTACAO DE SERVICO
         Bib.FormataTexto(' ',2,' ')+ //UF ORIGEM
         Bib.StrZeroDecimal(0,7,0)  + //MUNICIPIO IBGE ORGEM DO TRANSPORTE
         'N' +                        //ICMS-ST RETIDO ANTECIPADAMENTE
         RMaskCGC_CPF(QNotaSaidaExpNUM_INSCRICAO.Value,20) +
         bib.FormataTexto(' ',164,' ')+ //BRANCOS/USO DA EBS
         bib.StrZero2(wSequencia,6,0);   //SEQUENCIA

         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         //LAYOUT DAS NOTAS (CONHECIMENTO DE FRETE)
         S := S + '6' ;
         if Trim(QNotaSaidaExpNUM_CONHECIMENTO_FRETE.Text) <> '' then
         begin
           S := S + bib.StrZero(QNotaSaidaExpCOD_NOTA_CAB.Text,6) +
           bib.FormataTexto(QNotaSaidaExpCOD_SERIE_MODELO.Value,2)     +
           bib.StrZeroDecimal(QNotaSaidaExpSVAL_TOTAL.Value,12,2) +
           bib.FormataTexto(QNotaSaidaExpCOD_SERIE.Value,3,' ')   +
           bib.TiraMascara(DateToStr(QNotaSaidaExpDT_EMISSAO.Value));
         end
         else
         begin
           S := S + bib.StrZero2(0,6,0) + //COD_NOTA_CAB
           bib.StrZero2(0,2,0)          + //MODELO DA NOTA
           bib.StrZeroDecimal(0,12,2)   + //Valor Total da Nota
           bib.FormataTexto(' ',3,' ')  + //SERIE da Nota
           bib.StrZero2(0,8,0)          ; //Data de Emissão
         end;
         S := S + bib.FormataTexto(' ',457,' ')+ //Brancos
         bib.FormataTexto(' ',5,' ')  + //Usao da EBS
         bib.StrZero2(wSequencia,6,0);  //SEQUENCIA

         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         //LAYOUT PARCELAS PARA NF A PRAZO
         S := S + '9' +
         'N';   //TIPO DA PARCELA
         if Trim(QNotaSaidaExpIND_CONDICAO_PAGTO.Text) = '2' then
         begin
           S := S + RMaskCGC_CPF(IntToStr(QNotaSaidaExpCOD_NOTA_CAB.Value),9) +
           '00' + '00000000' + //TIPO TITULO/DT_VENCIMENTO
           bib.StrZeroDecimal(0,12,2);
         end else
         begin
           S := S + bib.StrZero2(0,9,0)+  //cod_nota
           '00' + '00000000'  +  //TIPO TITULO/DT_VENCIMENTO
           bib.StrZeroDecimal(0,12,2);
         end;
         S := S + bib.FormataTexto(' ',456,' ') + //BRANCOS
         bib.StrZero2(0,5,0)     +                //USO DA EBS
         bib.StrZero2(wSequencia,6,0);            //SEQUENCIA
         wSequencia := wSequencia + 1;
         S := S+Chr(13)+Chr(10);

         wTotalContabil := wTotalContabil + QNotaSaidaExpVAL_TOTAL.Value;
         wTotalBaseICMS := wTotalBaseICMS + QNotaSaidaExpVAL_ICM_BASE.Value;
         wTotalICMS     := wTotalICMS     + QNotaSaidaExpVAL_ICM.Value;
         wTotalIsentoICMS := wTotalIsentoICMS + QNotaSaidaExpSVAL_ICM_BASE_ISENTO.Value;

         QNotaSaidaExp.Next;
      end;
      // LAYOUT DO REGISTRO TRAILLER
      wSequencia := wSequencia - 1;
      S := S + '3' +
      bib.StrZeroDecimal(wTotalContabil,12,2) +
      Bib.StrZeroDecimal(0,12,2) +  //base de calculo PIS
      Bib.StrZeroDecimal(0,12,2) +  //base de calculo COFINS
      Bib.StrZeroDecimal(0,12,2) +  //base CSLL
      Bib.StrZeroDecimal(0,12,2) +  //base IRPJ
      Bib.StrZeroDecimal(wTotalBaseICMS,12,2) + //base ICMS A
      Bib.StrZeroDecimal(wTotalICMS,12,2) +  //valor ICMS A
      Bib.StrZeroDecimal(0,12,2) +  //base ICMS B
      Bib.StrZeroDecimal(0,12,2) + //valor ICMS B
      Bib.StrZeroDecimal(0,12,2) + //base ICMS C
      Bib.StrZeroDecimal(0,12,2) + //valor ICMS C
      Bib.StrZeroDecimal(0,12,2) + //base ICMS D
      Bib.StrZeroDecimal(0,12,2) + //valor ICSM D
      Bib.StrZeroDecimal(wTotalIsentoICMS,12,2)+ //ISENTAS ICMS
      bib.StrZeroDecimal(0,12,2) + //outras ICMS
      bib.StrZeroDecimal(0,12,2) + //BASE IPI
      bib.StrZeroDecimal(0,12,2) + //VALOR IPI
      bib.StrZeroDecimal(0,12,2) + //ISENTAS IPI
      bib.StrZeroDecimal(0,12,2) ; //outras IPI
      if DBCheckBox1.Checked = True then
        S := S + Bib.StrZeroDecimal(wTotalMercadoria_ST,12,2)+
        bib.StrZeroDecimal(wTotalBase_ST,12,2) +
        Bib.StrZeroDecimal(wTotalIcms_ST,12,2)
      else
         S := S + Bib.StrZeroDecimal(0,12,2)+
         bib.StrZeroDecimal(0,12,2)+
         bib.StrZeroDecimal(0,12,2);
      S := S + bib.StrZeroDecimal(0,12,2) + //DIFERIDAS
      Bib.StrZeroDecimal(0,12,2)+           //BASE ISS
      Bib.StrZeroDecimal(0,12,2)+           //VALOR ISS
      Bib.StrZeroDecimal(0,12,2)+           //ISENTAS ISS
      Bib.StrZeroDecimal(0,12,2)+           //IRRF ISS
      bib.FormataTexto(' ',169,' ') +
      Bib.StrZero2(wSequencia,6,0);

      if FNotaSaidaCad.SaveDialog.Execute then
      begin
        AssignFile(F, FNotaSaidaCad.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F,S);
        CloseFile(F);
        Application.MessageBox(pchar('Arquivo de Notas de Saída gerado com sucesso.'), 'Atenção', MB_ICONINFORMATION or MB_OK);
      end;
    end;
  except on e:Exception do
    Application.MessageBox('Não foi possível gerar o arquivo de exportaçao.','Atenção', MB_ICONINFORMATION or MB_OK);
  end;
end;

procedure TFNotaSaidaCad.ExportacaoClienteFornecedor;
var
  S : String;
  F : TextFile;
  wSequencia : Integer;
begin
  wSequencia := 1;
  try
    with DMCadastro do  begin
      QCadastroExp.Close;
      if (Trim(FNotaSaidaParam.FmDatas53.MeDtInicial.Text) <> '') and
         (Trim(FNotaSaidaParam.FmDatas53.MeDtFinal.Text) <> '') then
      begin
        QCadastroExp.SetVariable('DT_EMISSAO_I',FNotaSaidaParam.FmDatas53.MeDtInicial.Text);
        QCadastroExp.SetVariable('DT_EMISSAO_F',FNotaSaidaParam.FmDatas53.MeDtFinal.Text);
        //QCadastroExp.SetVariable('IND_ENTRADA_SAIDA','S');
      end
      else
        raise Exception.Create('Informe a Data Inicial e Data Final.');
      QCadastroExp.Open;
      QCadastroExp.First;
      begin
        while not (QCadastroExp.Eof) do
        begin
          //CNPJ/CPF
          if Trim(QCadastroExpDESC_CIDADE.Text) = 'EXTERIOR'  then
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
          '0'                                                        +
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

    if FNotaSaidaCad.SaveDialogCLI.Execute then
    begin
     AssignFile(F,FNotaSaidaCad.SaveDialogCLI.FileName);
     Rewrite(F);
     Writeln(F,S);
     CloseFile(F);
     Application.MessageBox('Arquivo de Clientes/Fornecedores exportado com Sucesso.', 'Atenção', MB_ICONINFORMATION or MB_OK);
     exportaNotasSaida;
    end;
  except on e:Exception do
   begin
     Application.MessageBox('Não foi possível gerar o arquivo de exportaçao.', 'Atenção', MB_ICONINFORMATION or MB_OK);
     //FCadastroParam.RGPreview.Visible := True;
   end;
  end;

end;

procedure TFNotaSaidaCad.Comiss1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[23].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRComissaoFrete.Close;
      if FNotaEntradaParam.Fm23Datas.MeDtFinal.Text = '' then
        raise Exception.Create('A data final deve ser informada');
      if FNotaEntradaParam.Fm23Datas.MeDtInicial.Text = '' then
        raise Exception.Create('A data inicial deve ser informada');
      if FNotaEntradaParam.ed23VlFrete.Text = '' then
        raise Exception.Create('O valor do frete deve ser informado');
      if FNotaEntradaParam.ed23PorcentComissao.Text = '' then
        raise Exception.Create('A porcentagem de comissão deve ser informada');

      QRComissaoFrete.SetVariable('DT_FINAL', FNotaEntradaParam.Fm23Datas.MeDtFinal.Text + ' 23:59:59');
      QRComissaoFrete.SetVariable('DT_INICIAL', FNotaEntradaParam.Fm23Datas.MeDtInicial.Text);
      QRComissaoFrete.SetVariable('VALOR_FRETE_SC', StrToFloat(FNotaEntradaParam.ed23VlFrete.Text));
      QRComissaoFrete.SetVariable('PORCENTAGEM_COMISSAO', StrToFloat(FNotaEntradaParam.ed23PorcentComissao.Text));
      if trim(FNotaEntradaParam.Fm23transportador.MeCadastro.Text) = '' then
        QRComissaoFrete.SetVariable('COD_TRANSPORTADOR', null)
      else
        QRComissaoFrete.SetVariable('COD_TRANSPORTADOR', StrToInt(trim(FNotaEntradaParam.Fm23transportador.MeCadastro.Text)));
      QRComissaoFrete.Open;
    end;
    if FRComissaoFrete = nil then
      FRComissaoFrete := TFRComissaoFrete.Create(Application);
    FRComissaoFrete.QRPrimario.Preview;
  end;
end;

procedure TFNotaSaidaCad.DBNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;

  if (Button = nbInsert) then
  begin
    if (DMParamSistema.CodEmpresa = 'FURGOESMED') then
      DBENumFabricante.SetFocus
    else
      DBECodProduto.SetFocus;

    // Este código mantém os itens da nota na ordem que foram inseridos
    // Antes os itens novos ficavam acima dos que já estavam inseridos
    DMNotaSaida.QItemNF.Cancel;
    DMNotaSaida.QItemNF.Append;
  end;
end;

procedure TFNotaSaidaCad.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMNotaSaida.QNotaSaidaCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMNotaSaida, DMSerie do
    begin
      QNotaSaidaCOD_SERIE.Value :=
        QSerieConsCOD_SERIE.Value;
      QNotaSaidaCOD_SERIE_MODELO.Value :=
        QSerieConsCOD_SERIE_MODELO.Value;
     DBPModelo.OnCodigoExit(self);
    end;
  end;
end;

procedure TFNotaSaidaCad.DBPModeloCodigoExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaSaidaCad.ExportarNFe2Click(Sender: TObject);
var
  filial: Integer;
  cadastro: Integer;
  dtInicial, dtFinal: TDateTime;
begin
  inherited;
  if FExportarNotasParam = nil then
    FExportarNotasParam := TFExportarNotasParam.Create(Application);
  if FExportarNotasParam.ShowModal = mrOk then
  begin
    filial := StrToInt(Trim(FExportarNotasParam.FmFilial1.MeFilial.Text));
    if Trim(FExportarNotasParam.FmCadastro1.MeCadastro.Text) = '' then
      cadastro := 0
    else
      cadastro := StrToInt(Trim(FExportarNotasParam.FmCadastro1.MeCadastro.Text));
    FExportarNotasParam.FmDatas1.ChecaDatasInformadas;
    dtInicial := StrToDateTime(FExportarNotasParam.FmDatas1.MeDtInicial.Text);
    dtFinal := StrToDateTime(FExportarNotasParam.FmDatas1.MeDtFinal.Text + ' 23:59:00');
    if (FExportarNotasParam.RDGTipoDoc.ItemIndex = 0 ) then
      SaveDialogExportaNFes.FileName := 'Notas_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if (FExportarNotasParam.RDGTipoDoc.ItemIndex = 1 ) then
      SaveDialogExportaNFes.FileName := 'Notas_Servico_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if(SaveDialogExportaNFes.Execute) then
      DMNfe.ExportaNFes(filial, cadastro, dtInicial, dtFinal,FExportarNotasParam.ChkSaida.Checked, FExportarNotasParam.ChkEntrada.Checked, FExportarNotasParam.CBEmailXML.Checked, FExportarNotasParam.CBEmailPDF.Checked, FExportarNotasParam.RDGTipoDoc.ItemIndex = 0 , Trim(SaveDialogExportaNFes.FileName + '.zip'));
  end;
end;

procedure TFNotaSaidaCad.emitirCartaCorrecaoEletronicaClick(
  Sender: TObject);
begin
  inherited;
  SBCartaCorrecaoClick(self);
end;

procedure TFNotaSaidaCad.VendasporOperaoProduto1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[54].TabVisible := True;
  if FNotaSaidaParam.ShowModal = MrOk then
    with DMRelatorio_Venda do
    begin
      QRVendaOperacaoProduto.Close;
      QRVendaOperacaoProduto2.Close;
      if (Trim(FNotaSaidaParam.FmDatas54.MeDtInicial.Text) <> '')
                                  and (Trim(FNotaSaidaParam.FmDatas54.MeDtFinal.Text) <> '') then
      begin
        QRVendaOperacaoProduto.SetVariable('DATA_I',Trim(FNotaSaidaParam.FmDatas54.MeDtInicial.Text));
        QRVendaOperacaoProduto.SetVariable('DATA_F',Trim(FNotaSaidaParam.FmDatas54.MeDtFinal.Text) + ' 23:59:59');
        QRVendaOperacaoProduto2.SetVariable('DATA_I',Trim(FNotaSaidaParam.FmDatas54.MeDtInicial.Text));
        QRVendaOperacaoProduto2.SetVariable('DATA_F',Trim(FNotaSaidaParam.FmDatas54.MeDtFinal.Text) + ' 23:59:59');
      end
      else
        raise Exception.Create('Deve informar o período');

      if Trim(FNotaSaidaParam.FmFilial54.MeFilial.Text) <> '' then
      begin
        QRVendaOperacaoProduto.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.FmFilial54.MeFilial.Text));
        QRVendaOperacaoProduto2.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.FmFilial54.MeFilial.Text));
      end
      else
      begin
        QRVendaOperacaoProduto.SetVariable('COD_FILIAL',Null);
        QRVendaOperacaoProduto2.SetVariable('COD_FILIAL',Null);
      end;

      if FNotaSaidaParam.RGEntrada_Saida54.ItemIndex = 0 then
      begin
        QRVendaOperacaoProduto.SetVariable('ENTRADA_SAIDA','E');
        QRVendaOperacaoProduto2.SetVariable('ENTRADA_SAIDA','E');
      end
      else
      begin
        QRVendaOperacaoProduto.SetVariable('ENTRADA_SAIDA','S');
        QRVendaOperacaoProduto2.SetVariable('ENTRADA_SAIDA','S');
      end;

      QRVendaOperacaoProduto.Open;
      QRVendaOperacaoProduto2.Open;

      if FROperacaoProduto = nil then
        FROperacaoProduto := TFROperacaoProduto.Create(Application);
      if FROperacaoProduto2 = nil then
        FROperacaoProduto2 := TFROperacaoProduto2.Create(Application);

      FROperacaoProduto.QRLPeriodo.Caption := FNotaSaidaParam.FmDatas54.MeDtInicial.Text + ' até ' + FNotaSaidaParam.FmDatas54.MeDtFinal.Text;
      FROperacaoProduto.QRLbFilial.Caption := 'Filial: ' + FNotaSaidaParam.FmFilial54.EdFilial.Text;

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FROperacaoProduto.QRCompositeReport1.Preview
      else
        FROperacaoProduto.QRCompositeReport1.Print;
    end;
end;

procedure TFNotaSaidaCad.VendasdeClientesporOperaoProduto1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[55].Visible := True;
  if FNotaSaidaParam.ShowModal = MrOK then
    with DMRelatorio_Venda do
    begin
      QRVendaClienteOP.Close;

      if (Trim(FNotaSaidaParam.FmDatas55.MeDtInicial.Text) <> '')
                                  and (Trim(FNotaSaidaParam.FmDatas55.MeDtFinal.Text) <> '') then
      begin
        QRVendaClienteOP.SetVariable('DATA_I',Trim(FNotaSaidaParam.FmDatas55.MeDtInicial.Text));
        QRVendaClienteOP.SetVariable('DATA_F',Trim(FNotaSaidaParam.FmDatas55.MeDtFinal.Text) + ' 23:59:59');
      end
      else
        raise Exception.Create('Deve informar o período');

      if Trim(FNotaSaidaParam.FmFilial55.MeFilial.Text) <> '' then
        QRVendaClienteOP.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.FmFilial55.MeFilial.Text))
      else
        QRVendaClienteOP.SetVariable('COD_FILIAL', Null);

      if Trim(FNotaSaidaParam.FmCadastro55.MeCadastro.Text) <> '' then
        QRVendaClienteOP.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro55.MeCadastro.Text))
      else
        QRVendaClienteOP.SetVariable('COD_CADASTRO',Null);

      if FNotaSaidaParam.RGEntrada_Saida55.ItemIndex = 0 then
        QRVendaClienteOP.SetVariable('IND_ENTRADA_SAIDA','E')
      else
        QRVendaClienteOP.SetVariable('IND_ENTRADA_SAIDA','S');
      QRVendaClienteOP.Open;
      if FRVendaClienteOP = nil then
        FRVendaClienteOP := TFRVendaClienteOP.Create(Application);

      with FRVendaClienteOP do
      begin
        if FNotaSaidaParam.RG55CodProduto.ItemIndex = 0 then
          QRDBText2.DataField := 'CODIGO'
        else
          QRDBText2.DataField := 'FABRICANTE';
      end;

      FRVendaClienteOP.QRLbFilial.Caption := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial55.EdFilial.Text);
      FRVendaClienteOP.QRLbPeriodo.Caption := Trim(FNotaSaidaParam.FmDatas55.MeDtInicial.Text) + ' até ' + Trim(FNotaSaidaParam.FmDatas55.MeDtFinal.Text);

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendaClienteOP.QRPrimario.Preview
      else
        FRVendaClienteOP.QRPrimario.Print;
    end;
end;

procedure TFNotaSaidaCad.btImportaCteClick(Sender: TObject);
var
  od: TOpenDialog;
  xml: TXmlDocument;
  nodeCte: IXMLNode;
  nodeInfCte: IXMLNode;
  chaveAcesso: String;
begin
  inherited;
  chaveAcesso := '';
  xml := TXmlDocument.Create(Application);
  od := TOpenDialog.Create(Application);
  od.Filter := 'XML files|*.xml';
  if od.Execute then
  begin
    xml.LoadFromFile(od.FileName);
    if xml.DocumentElement.NodeName <> 'cteProc' then
    begin
      MessageDlg('Erro: Tag cteProc inexistente neste documento.' +
      ' Este documento não está em conformidade com o Layout da Distribuição CT-e.' +
      ' Entre em contato com o seu fornecedor.',
      mtError, [mbOk],0);
    end;
    nodeCte := xml.DocumentElement.ChildNodes['CTe'];
    if NodeCte <> Nil then
      nodeInfCte := NodeCte.ChildNodes['infCte'];
    chaveAcesso := nodeInfCte.GetAttributeNS('Id', '');
  end;
  DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO_CTE.Value := chaveAcesso;  
end;

procedure TFNotaSaidaCad.ransaesGerenciaisTEF1Click(Sender: TObject);
var
  iRetornoAux: Integer;
begin
  inherited;
  //**************************************************************************
        //rotina do TEF
  if FTef = nil then
    FTef := TFTef.Create(Application);
  FTEF.IndNFCe := False;
  FTEF.ValorTransacao := 0;
  FTEF.Modalidade := 110;
  FTEF.btIniciaTef.Visible := true;
  FTEF.Comprovantes := TStringList.Create;
  FTEF.lbMensagem.Caption := '';
  FTEF.PrimeiraInicializacao := True;
  FTEF.ShowModal;
     //fim da rotina do tef
//**************************************************************************
end;

procedure TFNotaSaidaCad.DBEdit43KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = ' ' Then
     Key := Chr(0);
end;


procedure TFNotaSaidaCad.DBEValDescontoExit(Sender: TObject);
begin
  inherited;
  if Trim(DBEValDesconto.Text) = '' then
    DSPrimario.DataSet.FieldByName('VAL_DESCONTO').Value := 0;
end;

procedure TFNotaSaidaCad.ChamaMenuFiscal(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFNotaSaidaCad.DBRGCondicaoPagamentoChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if (QNotaSaida.State <> dsBrowse) and
      (DBRGCondicaoPagamento.ItemIndex > -1) then
      QNotaSaidaIND_TIPO_PAGAMENTO.Value :=
        DBRGCondicaoPagamento.Items[DBRGCondicaoPagamento.ItemIndex];
  end;
end;

procedure TFNotaSaidaCad.LanarValorFretePComisso1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '' then
  begin
    if FAtualizaFreteComissao = nil then
      FAtualizaFreteComissao := TFAtualizaFreteComissao.Create(Application);
    FAtualizaFreteComissao.showModal;
  end
  else
    raise Exception.Create('Informe a nota para lançar frete para comissão');

end;

procedure TFNotaSaidaCad.SBDocInserirClick(Sender: TObject);
var i: Integer;
    Chave: String;
begin
  inherited;
  with DMNotaSaida do
  begin
    if QNotaSaidaCOD_OPERACAO.Value > 0 then
    begin
      with DMOperacao do
      begin
        if QNotaSaidaCOD_OPERACAO.Value = QOperacaoCOD_OPERACAO.Value then
          QOperacao.RefreshRecord
        else
        begin
          QOperacao.Close;
          QOperacao.SetVariable('Pk', QNotaSaidaCod_Operacao.Value);
          QOperacao.Open;
        end;
      end;
    end;
    if (QNotaSaidaIND_FINALIDADE_NFE.Value = 4) or
       (DMOperacao.QOperacaoNUM_NATUREZA_EST_NOVO.Value = 7501) or
       (DMOperacao.QOperacaoNUM_NATUREZA_EST_NOVO.Value = 7501) then
    begin
      if FNotaSaidaParam = nil then
        FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
      FNotaSaidaParam.PGRelatorio.Pages[59].TabVisible := True;
      if FNotaSaidaParam.ShowModal = mrOk then
      begin
        if FNotaSaidaParam.RGNotaFiscal.ItemIndex = 0 then
        begin
          if FNotaEntradaCons = nil then
            FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
          try
            FNotaEntradaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
            FNotaEntradaCons.LBVariosRegistros.Visible := False;
            if FNotaEntradaCons.ShowModal = mrOk then
            begin
              with FNotaEntradaCons.DBGrid1 do
              begin
                for i := 0 to SelectedRows.Count - 1 do
                begin
                  DataSource.DataSet.Bookmark := SelectedRows[i];
                  with DMNotaEntrada do
                  begin
                    if (QNotaEntradaConsDESC_CHAVE_ACESSO.Value = '') and
                    ((QNotaEntradaConsCOD_SERIE_MODELO.Value = '55') or (QNotaEntradaConsCOD_SERIE_MODELO.Value = '65')) then
                    begin
                      MessageDlg('A nota nº ' + QNotaEntradaConsNUM_NOTA.Text + ' não será referenciada pois não possui chave de acesso.', mtError, [mbOK],0);
                      Continue;
                    end;
                    if not((QNotaEntradaConsCOD_SERIE_MODELO.Value = '55') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '65') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '01') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '02') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '04') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2B') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2C') or
                       (QNotaEntradaConsCOD_SERIE_MODELO.Value = '2D')) then
                    begin
                      MessageDlg('A nota nº ' + QNotaEntradaConsNUM_NOTA.Text + ' não será referenciada pois seu modelo diverge dos modelos aceitos: 55, 65, 01, 04, 2B, 2C e 2D.', mtError, [mbOK],0);
                      Continue;
                    end;
                    try
                      DMNotaSaida.QNotaReferenciada.Insert;
                      DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
                      DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNotaEntradaConsCOD_NOTA_CAB.Value;
                      DMNotaSaida.QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNotaEntradaConsDESC_CHAVE_ACESSO.Value);
                      DMNotaSaida.QNotaReferenciadaNUM_NOTA.Value := QNotaEntradaConsNUM_NOTA.AsInteger;
                      DMNotaSaida.QNotaReferenciadaCOD_SERIE.Value := QNotaEntradaConsCOD_SERIE.Value;
                      DMNotaSaida.QNotaReferenciadaCOD_SERIE_MODELO.Value := QNotaEntradaConsCOD_SERIE_MODELO.Value;
                      DMNotaSaida.QNotaReferenciadaDT_EMISSAO.Value := QNotaEntradaConsDT_EMISSAO.Value;
                      DMNotaSaida.QNotaReferenciada.Post;
                    except
                      DMNotaSaida.QNotaReferenciada.Cancel;
                    end;
                  end;
                end;
              end;
            end;
          except
            if QNotaReferenciada.State in [DsEdit, DsInsert] then
              QNotaReferenciada.Cancel;
          end;
          FNotaEntradaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
          FNotaEntradaCons.LBVariosRegistros.Visible := False;
        end;
        if FNotaSaidaParam.RGNotaFiscal.ItemIndex = 1 then
        begin
          Chave := '';
          if InputQuery('Nova Chave de Acesso', 'Digite a chave:', Chave) then
          begin
            Chave := Bib.LimpaNumero(Chave);
            if Length(Chave) <> 44 then
              raise Exception.Create('A Chave de Acesso precisa ter 44 dígitos.');
            if not((Copy(Chave,21,2) = '55') or
               (Copy(Chave,21,2) = '65')) then
            begin
              MessageDlg('O documento nº '+ FImpDadosXMLNFe.NFes[i].pNumero +' chave ' + FImpDadosXMLNFe.NFes[i].pChaveAcesso + ' não será referenciada pois seu modelo diverge dos modelos aceitos: 55, 65, 01, 04, 2B, 2C e 2D.', mtError, [mbOK],0);
              Abort;
            end;
            try
              DMNotaSaida.QNotaReferenciada.Insert;
              DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
              DMNotaSaida.QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Chave;
              DMNotaSaida.QNotaReferenciadaNUM_NOTA.Value := StrToInt('0'+Copy(Chave,26,9));
              DMNotaSaida.QNotaReferenciadaCOD_SERIE.Value := IntToStr(StrToInt(Copy(Chave,23,3)));
              DMNotaSaida.QNotaReferenciadaCOD_SERIE_MODELO.Value := Copy(Chave,21,2);
              DMNotaSaida.QNotaReferenciada.Post;
            except
              DMNotaSaida.QNotaReferenciada.Cancel;
            end;
          end;
        end;
        if FNotaSaidaParam.RGNotaFiscal.ItemIndex = 2 then
        begin
          if FImpDadosXMLNFe = nil then
            FImpDadosXMLNFe := TFImpDadosXMLNFe.Create(Application);
          if FImpDadosXMLNFe.ShowModal = MrOk then
          begin
            with DMNotaSaida do
            begin
              for i := 0 to Length(FImpDadosXMLNFe.NFes)-1 do
              begin
                if not((FImpDadosXMLNFe.NFes[i].pModelo = '55') or
                   (FImpDadosXMLNFe.NFes[i].pModelo = '65')) then
                begin
                  MessageDlg('O documento nº '+ FImpDadosXMLNFe.NFes[i].pNumero +' chave ' + FImpDadosXMLNFe.NFes[i].pChaveAcesso + ' não será referenciada pois seu modelo diverge dos modelos aceitos: 55, 65, 01, 04, 2B, 2C e 2D.', mtError, [mbOK],0);
                  Continue;
                end;
                try
                  DMNotaSaida.QNotaReferenciada.Insert;
                  DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
                  DMNotaSaida.QNotaReferenciadaDESC_CHAVE_ACESSO.Value := FImpDadosXMLNFe.NFes[i].pChaveAcesso;
                  DMNotaSaida.QNotaReferenciadaNUM_NOTA.Text := FImpDadosXMLNFe.NFes[i].pNumero;
                  DMNotaSaida.QNotaReferenciadaCOD_SERIE.Value := FImpDadosXMLNFe.NFes[i].pSerie;;
                  DMNotaSaida.QNotaReferenciadaCOD_SERIE_MODELO.Value := FImpDadosXMLNFe.NFes[i].pModelo;
                  DMNotaSaida.QNotaReferenciadaDT_EMISSAO.Text := FImpDadosXMLNFe.NFes[i].pDataEmissao;
                  DMNotaSaida.QNotaReferenciada.Post;
                except
                  DMNotaSaida.QNotaReferenciada.Cancel;
                end;
              end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      if FNotaSaidaCons = nil then
        FNotaSaidaCons := TFNotaSaidaCons.Create(Application);

      try
        FNotaSaidaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
        FNotaSaidaCons.LBVariosRegistros.Visible := False;
        if FNotaSaidaCons.ShowModal = mrOk then
        begin
          with FNotaSaidaCons.DBGrid1 do
          begin
            for i := 0 to SelectedRows.Count - 1 do
            begin
              DataSource.DataSet.Bookmark := SelectedRows[i];
              if (QNotaSaidaConsDESC_CHAVE_ACESSO.Value = '')
                 and ((QNotaSaidaConsCOD_SERIE_MODELO.Value = '55')
                 or (QNotaSaidaConsCOD_SERIE_MODELO.Value = '65')) then
              begin
                MessageDlg('A nota nº ' + QNotaSaidaConsNUM_NOTA.Text + ' não será referenciada pois não possui chave de acesso.', mtError, [mbOK],0);
                Continue;
              end;
              if not((QNotaSaidaConsCOD_SERIE_MODELO.Value = '55') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '65') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '01') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '02') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '04') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '2B') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '2C') or
                 (QNotaSaidaConsCOD_SERIE_MODELO.Value = '2D')) then
              begin
                MessageDlg('A nota nº ' + QNotaSaidaConsNUM_NOTA.Text + ' não será referenciada pois seu modelo diverge dos modelos aceitos: 55, 65, 01, 04, 2B, 2C e 2D.', mtError, [mbOK],0);
                Continue;
              end;
              try
                DMNotaSaida.QNotaReferenciada.Insert;
                DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
                DMNotaSaida.QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNotaSaidaConsCOD_NOTA_CAB.Value;
                DMNotaSaida.QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNotaSaidaConsDESC_CHAVE_ACESSO.Value);
                DMNotaSaida.QNotaReferenciadaNUM_NOTA.Value := QNotaSaidaConsNUM_NOTA.AsInteger;
                DMNotaSaida.QNotaReferenciadaCOD_SERIE.Value := QNotaSaidaConsCOD_SERIE.Value;
                DMNotaSaida.QNotaReferenciadaCOD_SERIE_MODELO.Value := QNotaSaidaConsCOD_SERIE_MODELO.Value;
                DMNotaSaida.QNotaReferenciadaDT_EMISSAO.Value := QNotaSaidaConsDT_EMISSAO.Value;
                DMNotaSaida.QNotaReferenciada.Post;
              except
                DMNotaSaida.QNotaReferenciada.Cancel;
              end;
            end;
          end;
        end;
      except
        if DMNotaSaida.QNotaReferenciada.State in [DsEdit, DsInsert] then
          DMNotaSaida.QNotaReferenciada.Cancel;
      end;
      FNotaSaidaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
      FNotaSaidaCons.LBVariosRegistros.Visible := False;
    end;
    if (QNotaSaida.State = dsBrowse) and DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFNotaSaidaCad.SBDocRemoverClick(Sender: TObject);
begin
  inherited;
  if  not DMNotaSaida.QNotaReferenciada.IsEmpty then
    DMNotaSaida.QNotaReferenciada.Delete;
  if (DMNotaSaida.QNotaSaida.State = dsBrowse) and DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
end;

procedure TFNotaSaidaCad.BTDetExportClick(Sender: TObject);
begin
  inherited;
  if FDetExportCad = nil then
    FDetExportCad := TFDetExportCad.Create(Application);
  FDetExportCad.ShowModal;
end;

procedure TFNotaSaidaCad.DBPModeloCodigoChange(Sender: TObject);
begin
  inherited;
  DBLBFormasPagamentoNFCe.Visible := DBPModelo.DBEdit.Text = '65';
  LBFormasPagamentoNFCe.Visible := DBLBFormasPagamentoNFCe.Visible;
  DBRGCondicaoPagamento.Visible := not DBLBFormasPagamentoNFCe.Visible;
  DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := Bib.ift(DBPModelo.DBEdit.Text = '65',
      '3',DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value);
  BibVenda.PersonalizaNota(DMParamSistema.QParamSistemaCOD_EMPRESA.Value
    ,Self);
  {DBPCidadePrestacao.VisibleComponents := Bib.ift(DBPModelo.DBEdit.Text = '98',
    [dbpcCodigo,dbpcBusca,dbpcDescricao], []);   }
  //Comentado por Gian 29/07/2020
  //Não estava compilando... Conversei com o Adriel que tinha feito a alteração
  //e pediu para fazer com IF.

  DBPCidadePrestacao.Visible := DBPModelo.DBEdit.Text = '98';


  if (DBPModelo.DBEdit.Text <> DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value) and
     (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '') and
     (Length(Trim(DBPModelo.DBEdit.Text)) = 2) and
     (DMNfe.QNfeSIT_NFE.Value <> '100') and
     (DMNfe.QNfeSIT_NFE.Value <> '150') and
     (DMNfe.QNfeSIT_NFE.Value <> '149') and
     (DMParamSistema.CodEmpresa <> 'ARZ') then //zerar número da nota quando mudar serie de pedido para serie fiscal. Vanessa  18/04/2017
    dmnotasaida.QNotaSaidaNUM_NOTA.Value := 0;
end;

procedure TFNotaSaidaCad.BtBuscarValeProdutoClick(Sender: TObject);
begin
  inherited;
  if FValeProdutoCons = nil then
    FValeProdutoCons := TFValeProdutoCons.Create(Application);
  if FValeProdutoCons.ShowModal = mrOk then
  begin
    MeCodValeProduto.Text := DMDevolucaoTroca.QValeProdutoConsCOD_VALE_PRODUTO.Text;
    MeCodValeProdutoExit(Self);
  end;
end;

procedure TFNotaSaidaCad.MeCodValeProdutoExit(Sender: TObject);
begin
  inherited;
  Self.Tag := 0; 
end;

procedure TFNotaSaidaCad.MeCodValeProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08,#13,#27,#42] ) then
    key:=#0;
  if Key = #13 then
    btIncluirClick(Self);
end;

procedure TFNotaSaidaCad.SBRefreshClick(Sender: TObject);
begin
  inherited;
  MeCodValeProduto.Text := DMOracle.FastSelect('COD_VALE_PRODUTO','TB_VALE_PRODUTO',
    'COD_NOTA_CAB_TROCA = ' +IntToStr(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value));
    CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);
    CBIndIntermediador.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value = '', -1, StrToInt('0' + DMNotaSaida.QNotaSaidaIND_INTERMEDIADOR.Value));
end;

procedure TFNotaSaidaCad.VendasPorProdutoLote1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[58].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text), 'VENDA');
      QRVendaProduto_Lote.Close;
      if (FNotaSaidaParam.Fm58Datas.MeDtInicial.Text = '') or (FNotaSaidaParam.Fm58Datas.MeDtFinal.Text = '') then
        raise Exception.Create('É necessário informar a Data de Emissão');
      QRVendaProduto_Lote.SetVariable('DATA_I', FNotaSaidaParam.Fm58Datas.MeDtInicial.Text);
      QRVendaProduto_Lote.SetVariable('DATA_F', FNotaSaidaParam.Fm58Datas.MeDtFinal.Text + ' 23:59:59');

      if Trim(FNotaSaidaParam.Fm58Filial.MeFilial.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_FILIAL', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_FILIAL', Trim(FNotaSaidaParam.Fm58Filial.MeFilial.Text));

      if Trim(FNotaSaidaParam.Fm58Cadastro.MeCadastro.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_CADASTRO', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_CADASTRO', Trim(FNotaSaidaParam.Fm58Cadastro.MeCadastro.Text));

      if Trim(FNotaSaidaParam.Me58Classe.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_CLASSE', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_CLASSE', FNotaSaidaParam.Me58Classe.Text);

      if (Trim(FNotaSaidaParam.ME58SubClasse.Text) = '') or
        (Trim(FNotaSaidaParam.ME58SubClasse.Text) = '0') then
        QRVendaProduto_Lote.SetVariable('COD_SUB_CLASSE', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_SUB_CLASSE', FNotaSaidaParam.ME58SubClasse.Text);

      if Trim(FNotaSaidaParam.Fm58Cidade.MeCidade.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_CIDADE', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_CIDADE', FNotaSaidaParam.Fm58Cidade.MeCidade.Text);

      if Trim(FNotaSaidaParam.Fm58Estado.MeEstado.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_ESTADO', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_ESTADO', FNotaSaidaParam.Fm58Estado.MeEstado.Text);

      if Trim(FNotaSaidaParam.Fm58Vendedor.MeVendedor.Text) = '' then
        QRVendaProduto_Lote.SetVariable('COD_VENDEDOR', Null)
      else
        QRVendaProduto_Lote.SetVariable('COD_VENDEDOR', Trim(FNotaSaidaParam.Fm58Vendedor.MeVendedor.Text));


      QRVendaProduto_Lote.Open;
      if FRVendasProdutoLote = nil then
         FRVendasProdutoLote := TFRVendasProdutoLote.Create(Application);

      FRVendasProdutoLote.QRLTitulo.Caption := 'Vendas por produto/lote de ' + FNotaSaidaParam.Fm58Datas.MeDtInicial.Text + ' até ' + FNotaSaidaParam.Fm58Datas.MeDtFinal.Text;
      FrVendasProdutoLote.QRLCliente.Caption := 'Cadastro: ' + FNotaSaidaParam.Fm58Cadastro.MeCadastro.Text + '-' + FNotaSaidaParam.Fm58Cadastro.EdCadastro.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendasProdutoLote.QRPrimario.Preview
      else
        FRVendasProdutoLote.QRPrimario.Print;
      QRVendaProduto_Lote.Close;
    end;
end;

procedure TFNotaSaidaCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button in [nbInsert, nbEdit] then
    if DMNotaSaida.QItemNF.State in [dsInsert, dsEdit] then
    begin
      DMNotaSaida.QItemNF.Post;
      DMNotaSaida.QNotaImpostoServico.Append;
    end;

end;

procedure TFNotaSaidaCad.DBRFinalidadeNFeChange(Sender: TObject);
begin
  inherited;
  if DBRFinalidadeNFe.Value = '1' then
  begin
    DBEdit65.ReadOnly := true; //valor total item
    DBEdit64.ReadOnly := true; //valor do ipi
  end
  else
  begin          //notas complementares - quantidade do item = 0
    DBEdit65.ReadOnly := false; //valor total item
    DBEdit64.ReadOnly := false; //valor do ipi
  end;
end;

procedure TFNotaSaidaCad.DBEdit50Exit(Sender: TObject);
var
  wQtdMinAtacado : integer;
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'SRTERRA' Then
   Begin
     DMNotaSaida.QBaixasPed.Open;
     If DMNotaSaida.QBaixasPedCOD_PEDIDO_ITEM.Text <> '' Then
        If (DMNotaSaida.QBaixasPedQT_PEDIDO.Value - DMNotaSaida.QBaixasPedQT_ATENDIDO.Value) <
            DMNotaSaida.QItemNFQT_QUANTIDADE.Value Then
            ShowMessage('Quantidade informada é maior que pedido');
     DMNotaSaida.QBaixasPed.Close;       
   End;
   with DMNotaSaida do
   begin
     if QItemNFVAL_ST_ANTERIOR_RETIDO.Value > 0 then
     begin
      QItemNFVAL_BASE_ST_ANTERIOR_RETIDO.Value :=
        (QItemNFVAL_BASE_ST_ANTERIOR_RETIDO.Value / wQuantidadeAnterior) *
        QItemNFQT_QUANTIDADE.Value;
      QItemNFVAL_ST_ANTERIOR_RETIDO.Value :=
        (QItemNFVAL_ST_ANTERIOR_RETIDO.Value / wQuantidadeAnterior) *
        QItemNFQT_QUANTIDADE.Value;
     end;
   end;
   if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ALIANCA') and (DBECodProduto.Text <> '')) then
   Begin
     if ((DMParamSistema.QParamSistemaIND_CONTROLE_VEICULO.Value = 'S') and
         (DMOracle.BuscaNome('SELECT IND_FIXAR_CONSUMO FROM TB_OPERACAO','COD_OPERACAO= '+DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text) = 'C') and
        (DSPrimario.State in [DsInsert,DsEdit])) then
     begin
       DMNOtaSaida.QItemNFVal_Unitario.Value := StrToFloat(DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE','COD_PRODUTO='+DMNotaSaida.QitemNFCOD_Produto.Text));
    end;
  end;
end;

procedure TFNotaSaidaCad.btImportacaoItensClick(Sender: TObject);
var
  button: TControl;
  lowerLeft: TPoint;
begin
  if Sender is TControl then
  begin
    button := TControl(Sender);
    lowerLeft := Point(button.Left, button.Top + Button.Height + 65); //65 é somente para arrumar melhor a posição na tela
    lowerLeft := ClientToScreen(lowerLeft);
    pmImportacaoItens.Popup(lowerLeft.X, lowerLeft.Y);
  end;
end;
procedure TFNotaSaidaCad.btnImportacaoItensClick(Sender: TObject);
var
  button: TControl;
  lowerLeft: TPoint;
begin
  if Sender is TControl then
  begin
    button := TControl(Sender);
    lowerLeft := Point(button.Left, button.Top + Button.Height + 65); //65 é somente para arrumar melhor a posição na tela
    lowerLeft := ClientToScreen(lowerLeft);
    pmImportacaoItens.Popup(lowerLeft.X, lowerLeft.Y);
  end;
end;

procedure TFNotaSaidaCad.este1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  FNotaEntradaCons.MeTexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  if FNotaEntradaCons.ShowModal = mrOk then
    Proc_TrazItens(DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value);
end;

procedure TFNotaSaidaCad.teste21Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  FNotaSaidaCons.MeTexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  if FNotaSaidaCons.ShowModal = MrOk then
    Proc_TrazItens(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
end;

procedure TFNotaSaidaCad.razerItensdePedido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  if FPedidoCons.ShowModal = mrOk then
  begin
    with DMPedido do
    begin
      DMNotaSaida.QBaixasPed.Close;
      QPedido.Close;
      QPedido.SetVariable('PK', QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      PImportaPedidos_Items; // procedure para trazer os itens de pedido foi desmembrado porque chama do cabeçalho tb
    end;
  end;
  FPedidoCons.METexto.Enabled := True;
  FPedidoCons.BtConsCadastro.Enabled := True;
  FPedidoCons.MEFilial.Enabled := True;
  FPedidoCons.BtConsFilial.Enabled := True;
end;

procedure TFNotaSaidaCad.DBPanel15DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTabelaPrecoCons;
  Classe := TFTabelaPrecoCons;
end;

function TFNotaSaidaCad.TabelaPrecoVencida(): Boolean;
var wValidadeTabelaPreco: string;
begin
  result := false;
  // Deve respeitar data de validade da lista
  if DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text =  DMOracle.FastSelect('COD_TABELA_PRECO_CAB', 'TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) then
  begin
    wValidadeTabelaPreco := '';
    wValidadeTabelaPreco := DMOracle.FastSelect('NVL(TO_CHAR(DT_VENCIMENTO_TABELA_PRECO),'+quotedStr('')+')',
      'TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    if (trim(wValidadeTabelaPreco) <> '') and (strToDate(wValidadeTabelaPreco) < DMOracle.DataServ) then
    begin
      MessageDlg('Tabela de preço com data de validade vencida no dia '+ wValidadeTabelaPreco
        , mtInformation, [mbOk], 0);
      DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Clear;
      DBPanel15.SetFocus;
      result := true;
    end;
  end;
end;

procedure TFNotaSaidaCad.DBPanel15CodigoExit(Sender: TObject);
var wRecno: integer;
begin
  inherited;
  if DMNotaSaida.QItemNF.State in [DsInsert, DsEdit] then
  begin
    if DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Value > 0 then
    begin

      // Não houve alteração
      if wAlterouLista = false then
        exit;
      if DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Value = wCodigoTabelaPreco then
        exit;

      if tabelaPrecoVencida then
        exit;

      // Faz uma verificação de bloqueio da tabela de preços
      if not BibVenda.LiberaBloqueioTabelaPreco then
      begin

        // Busca o código da tabela de preços atrelada ao cliente
        DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text :=
          DMOracle.FastSelect('COD_TABELA_PRECO_CAB', 'TB_CADASTRO',
            'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
        MessageDlg('Usuário não habilitado para alterar lista de preços'
          , mtInformation, [mbOk], 0);

        if tabelaPrecoVencida then
          DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Clear;

        Exit;
      end;

      if MessageDlg('Deseja utilizar esta lista em todos os itens da nota?'
        , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMNotaSaida.pUtilizaListaPrecoTodosItens := true;
        DMNotaSaida.pUtilizaListaPreco1Item := false;
      end
      else
      begin
        DMNotaSaida.pUtilizaListaPreco1Item := true;
        DMNotaSaida.pUtilizaListaPrecoTodosItens := false;
      end;
    end;

    if (DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Value > 0) and
    (DMNotaSaida.QItemNFCOD_PRODUTO.Value > 0) then
      DMNotaSaida.PrecoTabela
    else
      if DMNotaSaida.QItemNFCOD_PRODUTO.Value > 0 then
        DMNotaSaida.QItemNFCOD_PRODUTOValidate(nil);
    wAlterouLista := false;
  end;
end;

procedure TFNotaSaidaCad.DBPanel15AfterConsulta(Sender: TObject);
begin
  inherited;

  DBPanel15CodigoExit(self);
  DBPanel15Exit(self);
end;

procedure TFNotaSaidaCad.AtualizaCodListaPreco;
var wCodTabelaPreco: integer;
begin
  // Atualiza a property pCodListaPreco ao consultar uma nota e editar seus itens
  if DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value > 0 then
  begin
    wCodTabelaPreco := StrToInt(DMOracle.FastSelect('NVL(COD_TABELA_PRECO_CAB, -1)', 'TB_CADASTRO'
      , 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text));
    if (wCodTabelaPreco > 0) and (DMNotaSaida.pCodListaPreco = 0) then
      DMNotaSaida.pCodListaPreco := wCodTabelaPreco
    
  end;
end;

procedure TFNotaSaidaCad.DBEClienteChange(Sender: TObject);
begin
  inherited;
  AtualizaCodListaPreco;
end;

procedure TFNotaSaidaCad.DBPanel15CodigoChange(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QItemNF.State in [DsInsert, DsEdit] then
  begin
      wAlterouLista := true;
  end;
end;

procedure TFNotaSaidaCad.DBPanel15Exit(Sender: TObject);
begin
  inherited;
  if (DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Value = 0) and (DMParamSistema.CodEmpresa <> 'FERRAGMED') then
  begin
    DMNotaSaida.QItemNFVAL_DESCONTO.ReadOnly := false;
    DMNotaSaida.QItemNFPERC_DESCONTO.ReadOnly := false;
    DBEDesconto.Color := clWindow;
    DBEDesconto.Hint := '';
    DBEdit61.Color := clWindow;
    DBEdit61.Hint := '';
    exit;
  end;
  if (DMNotaSaida.QNotaSaida.State in [DSInsert, DSEdit]) and (DMParamSistema.CodEmpresa <> 'FERRAGMED') then
  begin
    if DMNotaSaida.QItemNFVAL_DESCONTO.ReadOnly then
    begin
      DBEDesconto.Color := clBtnFace;
      DBEDesconto.Hint := 'Desconto desabilitado por lista de preços';
      DBEDesconto.ShowHint := true;
      DBEDesconto.ParentShowHint := false;

      DBEdit61.Color := clBtnFace;
      DBEdit61.Hint := 'Desconto desabilitado por lista de preços';
      DBEdit61.ShowHint := true;
      DBEdit61.ParentShowHint := false;
    end
    else
    begin
      DBEDesconto.Color := clWindow;
      DBEDesconto.Hint := '';

      DBEdit61.Color := clWindow;
      DBEdit61.Hint := '';
    end;
  end;
end;

procedure TFNotaSaidaCad.DBPanel15Enter(Sender: TObject);
begin
  inherited;
  wCodigoTabelaPreco := DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Value;
end;

procedure TFNotaSaidaCad.DBRGConsumidorClick(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QItemNF.RecordCount  > 0 then
    MessageDlg('Após alterar o tipo de consumidor, é recomendado verificar' +
      ' o cfop de cada item na aba Itens', mtInformation,[mbOk],0);
end;

procedure TFNotaSaidaCad.Proc_TrazItensOS(wCod_Ordem_Servico_Cab: Integer);
begin
  with DMNotaSaida, DMOrdemServico, DMProduto do
  begin
    QOrdemServico.Close;
    QOrdemServico.SetVariable('PK', wCod_Ordem_Servico_Cab);
    QOrdemServico.Open;
    QOrdemServicoIt.Close;
    //QOrdemServicoIt.SetVariable('COD_ORDEM_SERVICO_CAB', wCod_Ordem_Servico_Cab);
    QOrdemServicoIt.Open;
    QOrdemServicoIt.First;
    while not QOrdemServicoIt.Eof do
    begin

      QProduto.Close;
      QProduto.SetVariable('PK', QOrdemServicoItCOD_PRODUTO.Value);
      QProduto.Open;

      if QNotaSaidaCOD_SERIE_MODELO.Value = '55' then
        if QProdutoIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
        begin
          QOrdemServicoIt.Next;
          continue;
        end;

      if QNotaSaidaCOD_SERIE_MODELO.Value = '98' then
        if QProdutoIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
        begin
          QOrdemServicoIt.Next;
          continue;
        end;
      //não aparecer na obs da nota os cód. da OS para Furgoes. Solicitado por Jheison - Junior 28/08/2017
      if QNotaSaidaDESC_OBS_CORPO_NOTA.Text = '' then //Não estava dizendo de qual ordem deVanessa 16/06/2017
        QNotaSaidaDESC_OBS_CORPO_NOTA.Text := QNotaSaidaDESC_OBS_CORPO_NOTA.Text
             + bib.ift(DMParamSistema.CodEmpresa = 'FURGOESMED','','Código da OS: ' + IntToStr(wCod_Ordem_Servico_Cab) )
      else
        QNotaSaidaDESC_OBS_CORPO_NOTA.Text := QNotaSaidaDESC_OBS_CORPO_NOTA.Text
            + bib.ift (DMParamSistema.CodEmpresa = 'FURGOESMED','', ',' + IntToStr(wCod_Ordem_Servico_Cab) );

      QItemNF.Append;
      QItemNFCOD_NOTA_CAB.Value := QNotaSaidaCOD_NOTA_CAB.Value;
      QItemNFCOD_PRODUTO.Value := QOrdemServicoItCOD_PRODUTO.Value;
      QItemNFCOD_TRIBUTACAO.Value := QProdutoCOD_TRIBUTACAO.Value;
      QItemNFQT_QUANTIDADE.Value := QOrdemServicoItQT_PRODUTO.Value;
      QItemNFCOD_LOTE_TIPO.Value := 1;
      QItemNFVAL_DESCONTO.Value := QOrdemServicoItVAL_DESCONTO.Value;
      QItemNFVAL_UNITARIO.Value := QOrdemServicoItVL_UNITARIO.Value;
      QItemNFCOD_ORDEM_SERVICO_ITEM.Value := QOrdemServicoItCOD_ORDEM_SERVICO_ITEM.Value;
      if QOrdemServicoItCOD_CFOP.Value > 0 then
        QItemNFCOD_CFOP.Value := QOrdemServicoItCOD_CFOP.Value;
      QItemNFDESC_INF_ADICIONAL.Value := QOrdemServicoItDESC_COMPLEMENTO.Value;
      DBECodProdutoExit(self);
      QItemNF.Post;

      QOrdemServicoIt.Next;
    end;
  end;
end;

procedure TFNotaSaidaCad.razeritens1Click(Sender: TObject);
begin
  inherited;
  with DMOrdemServico do
  begin

    if FOrdemServicoCons = Nil then
      FOrdemServicoCons := TFOrdemServicoCons.Create(Application);
    if FOrdemServicoCons.ShowModal = MrOK then
    begin
      if QOrdemServicoCons.RecordCount > 0 then
        Proc_TrazItensOS(QOrdemServicoConsCOD_ORDEM_SERVICO_CAB.Value);
    end;

  end;
end;

procedure TFNotaSaidaCad.DBECodProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12 - Junior 10/04/2017. Solicitado por Gustavo (Agroferragens JG).
    BtConsProduto.Click;
end;

procedure TFNotaSaidaCad.SpeedButton1Click(Sender: TObject);
var
  pnt: TPoint;
begin
  inherited;
  if GetCursorPos(pnt) then
    ppAtalhos.Popup(pnt.X, pnt.Y);
end;

procedure TFNotaSaidaCad.DBRadioGroup1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if ((QNotaSaidaVAL_FRETE.Value > 0) or
       (QNotaSaidaCOD_TRANSPORTADOR.Value > 0)) and
       (DBRadioGroup1.ItemIndex = 3) then
    begin
      MessageDlg('Você não pode selecionar a opção "Sem Frete" porque os campos Vlr. Frete e/ou Transportador estão preenchidos.',
        mtInformation, [mbOK],0);
      PCNota.TabIndex := 0;
      PCCabecalho.TabIndex := 1;
      DBRadioGroup1.SetFocus;
      DBRadioGroup1.Font.Color := clRed;
      Abort;
    end
    else
    begin
      DBRadioGroup1.Font.Color := clWindowText;
    end;
  end;
end;

procedure TFNotaSaidaCad.EtiquetaZebraEPL1Click(Sender: TObject);
var
  wContVolumes, i: integer;
  wString : TStringList;
const
  arquivo = 'C:\Temp\etiqueta.prn';
begin
  inherited;
  DMNotaSaida.QNotaSaida.Open;
  //1DMRelatorio_Venda.QREtiquetaZebra.Open;
  DMUsuario.QUsuario.Open;
  wString := TStringList.create;
  wString.clear;

  if (Trim(DMNotaSaida.QNotaSaidaNUM_NOTA.Text) = '') then
    raise exception.Create('Pesquise uma nota.');
  if (Trim(DMNotaSaida.QNotaSaidaNUM_VOLUMES.Text) = '') then
    raise exception.Create('A nota precisa ter número de volumes.');
  if (Trim(DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text) = '') then
    raise exception.Create('Configure a sua impressora Zebra no Cadastro de Usúario. Ex.:\\localhost\nomeimpressora');
  if MessageDlg('Deseja Gerar as Etiquetas da Nota: ' + DMNotaSaida.QNotaSaidaNUM_NOTA.Text +
    ' com Volumes: ' + DMNotaSaida.QNotaSaidaNUM_VOLUMES.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMRelatorio_Venda.QREtiquetaZebra.Close;
    DMRelatorio_Venda.QREtiquetaZebra.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMRelatorio_Venda.QREtiquetaZebra.Open;
    if DMRelatorio_Venda.QREtiquetaZebra.RecordCount = 0 then
      raise exception.Create('Nota fiscal não encontrada.');
    wContVolumes := 1;
    for i := wContVolumes to DMRelatorio_Venda.QREtiquetaZebraNUM_VOLUMES.Value do
    begin
      wString.Add('I8,A,001');
      wString.Add('');
      wString.Add('');
      wString.Add('Q288,024');
      wString.Add('q831');
      wString.Add('rN');
      wString.Add('S3');
      wString.Add('D7');
      wString.Add('ZT');
      wString.Add('JF');
      wString.Add('O');
      wString.Add('R0,0');
      wString.Add('f100');
      wString.Add('N');
      wString.Add('A814,247,2,1,2,2,N,"'          +DMRelatorio_Venda.QREtiquetaZebraDESC_FILIAL.Text+'"');
      wString.Add('A814,223,2,1,2,2,N," "');
      wString.Add('A814,199,2,1,2,2,N,"CLIENTE: ' +DMRelatorio_Venda.QREtiquetaZebraNOME.text+'"');
      wString.Add('A814,151,2,1,2,2,N,"CIDADE: '  +DMRelatorio_Venda.QREtiquetaZebraDESC_CIDADE.Text+'"');
      wString.Add('A814,103,2,1,2,2,N,"FONE: '    +DMRelatorio_Venda.QREtiquetaZebraDESC_TELEFONE.Text+'"');
      wString.Add('A814,55,2,1,2,2,N,"Nº Nota: '  +DMRelatorio_Venda.QREtiquetaZebraNUM_NOTA.Text+ '  VOLUMES: ' +inttostr(wContVolumes) + '/' + DMRelatorio_Venda.QREtiquetaZebraNUM_VOLUMES.Text + '"');
      wString.Add('P1');
      try
        // gera arquivo texto com o conteúdo que será enviado para a impressora
        wString.SaveToFile(arquivo);
        //Para usar USB tem que compartilhar a impressora e enviar o arquivo para o compartilhamento
        ShellExecute(Handle, 'open', PChar('cmd.exe'), PChar('/c type '+ arquivo +' > '+ DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text), nil, SW_HIDE);
      finally
        Sleep(1200);
        wString.Clear;
      if FileExists(arquivo) then
        DeleteFile(arquivo);
      end;
      wContVolumes := wContVolumes + 1;
    end;
    DMRelatorio_Venda.QREtiquetaZebra.Close;
    DMUsuario.QUsuario.Close;
  end;
end;
procedure TFNotaSaidaCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  CBIndPresenca.ItemIndex := 1;
end;

procedure TFNotaSaidaCad.DBEdit61Exit(Sender: TObject);
var
  wRegistros : Integer;
  wPrecoTabela : double;
begin
  inherited;
  //Criado para bloquear desconto da Kreuz quando usuário não tiver privilégio - Cleber - 10/01/2020
  wPermiteDesconto := true;
  //Verifica se pode dar desconto na tabela de preço. Por Gian, solicitado por Marlom 24/11/2017
  if (Trim(DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text) <> '') then
  begin
    wRegistros := StrToInt(DMOracle.FastSelect('COUNT(*)','TB_TABELA_PRECO_ITEM','COD_PRODUTO=' +
                    QuotedStr(DMNotaSaida.QItemNFCOD_PRODUTO.Text) + ' AND COD_TABELA_PRECO_CAB=' +
                    QuotedStr(DMNotaSaida.QItemNFCOD_TABELA_PRECO_CAB.Text)));
    if (DMUsuario.QUsuarioIND_PRIVILEGIO.Text <> 'P') and (DMNotaSaida.QItemNFPERC_DESCONTO.Value <> 0) and
       (wRegistros > 0)and (DMParamSistema.CodEmpresa <> 'FERRAGMED') then
    begin
      DMNotaSaida.QItemNFPERC_DESCONTO.Value := 0;
      raise Exception.Create('Usuário não permitido a dar desconto para esta tabela de preço.');
    end;
  end
  else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' then//Solicitado por Rubens para que não seja permitido desconto maior que informado no produto
  begin
    if (DMUsuario.QUsuarioIND_PRIVILEGIO.Text <> 'P') and
       (StrToFloat(Dmoracle.FastSelect('PERC_DESCONTO_MAXIMO','TB_PRODUTO','COD_PRODUTO = ' +
                      DMNotaSaida.QItemNFCOD_PRODUTO.Text)) < DMNotaSaida.QItemNFPERC_DESCONTO.Value) then
    begin
     DMNotaSaida.QItemNFPERC_DESCONTO.Value := 0;
     MessageDlg('Desconto informado maior que o maximo permitido.', mTInformation, [mbOk], 0);
     wPermiteDesconto := false;
    end;
  end;
{Ferragem irá trabalhar com tabela de preço para validar o valor dos produtos. Alex 19/01/2024}
{  if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
    DMNotaSaida.ValidaPrecoTabela(Sender);}
end;

procedure TFNotaSaidaCad.Royalties1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[60].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial60.MeFilial.Text),'VENDA');

    if (FNotaSaidaParam.MeInicial60.Text = '') and (FNotaSaidaParam.MeFinal60.Text = '') then
      raise Exception.Create('Informe a Data de Emissão');

    QRComissaoRoyalties.Close;
    QRComissaoRoyalties.SetVariable('DATA_I',FNotaSaidaParam.MeInicial60.Text);
    QRComissaoRoyalties.SetVariable('DATA_F',  FNotaSaidaParam.MeFinal60.Text);

    if Trim(FNotaSaidaParam.FmFilial60.MeFilial.Text)= ''   then
      QRComissaoRoyalties.SetVariable('FILIAL',Null)
    else
      QRComissaoRoyalties.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial60.MeFilial.Text));

    if Trim(FNotaSaidaParam.FmVendedor60.MeVendedor.Text)= ''   then
      QRComissaoRoyalties.SetVariable('VENDEDOR',Null)
    else
      QRComissaoRoyalties.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor60.MeVendedor.Text));

    if Trim(FNotaSaidaParam.FmArtista60.MeCadastro.Text) = ''   then
      QRComissaoRoyalties.SetVariable('COD_ROYALTIES',Null)
    else
      QRComissaoRoyalties.SetVariable('COD_ROYALTIES',Trim(FNotaSaidaParam.FmArtista60.MeCadastro.Text));

    if FNotaSaidaParam.RgPagto60.ItemIndex <> 3 then
      QRComissaoRoyalties.SetVariable('IND_CONDICAO_PAGTO',FNotaSaidaParam.RgPagto60.ItemIndex + 1);

    QRComissaoRoyalties.Open;
    if FRNota_ComissaoRoyalties = Nil then
      FRNota_ComissaoRoyalties := TFRNota_ComissaoRoyalties.Create(Application);
    //if FNotaSaidaParam.RgPagto60.ItemIndex = 0 Then
     //  FRNota_ComissaoRoyalties.pTipoRelatorio := 'ANALITICO'
    //else
    //   FRNota_ComissaoRoyalties.pTipoRelatorio := 'SINTETICO';
    FRNota_ComissaoRoyalties.QRlTitulo.Caption := 'Relatório Royalties de ' + FNotaSaidaParam.MeInicial60.Text + ' Até ' + FNotaSaidaParam.MeFinal60.Text;

    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_ComissaoRoyalties.QRPrimario.Preview
    else
       FRNota_ComissaoRoyalties.QRPrimario.Print;

    QRComissaoRoyalties.Close;
  end;
end;

procedure TFNotaSaidaCad.MeCodValeProdutoEnter(Sender: TObject);
begin
  inherited;
  Self.Tag := 100;
end;

procedure TFNotaSaidaCad.btIncluirClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida, DMDevolucaoTroca do
  begin
    if QNotaSaida.State = dsInsert then
    begin
      QNotaSaida.Post;
      QNotaSaida.Edit;
    end;
    DMNfe.SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
    if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
    begin
      MessageDlg('Esta nota já está autorizada ou cancelada. Não é possível inserir nem excluir Vales.', mtError,
          [mbOk], 0);
      MeCodValeProduto.Clear;
      Abort;
    end;
    if trim(MeCodValeProduto.Text) <> '' then
    begin

      QValeProdutoValida.Close;
      QValeProdutoValida.ClearVariables;
      QValeProdutoValida.SetVariable('COD_VALE_PRODUTO', trim(MeCodValeProduto.Text));
      QValeProdutoValida.Open;

      if QValeProdutoValida.RecordCount = 0 then
      begin
        MessageDlg('Informe um Vale que exista e esteja disponível.', mtError,
        [mbOk], 0);
        MeCodValeProduto.Clear;
        MeCodValeProduto.SetFocus;
        Abort;
      end
      else
      begin
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DONABENTA') then
        begin
          if Date > IncMonth(QValeProdutoValidaDT_EMISSAO.Value, 6) then
          begin
            MessageDlg('Este vale perdeu a validade em ' +
              FormatDateTime('dd/MM/yyyy', IncDay(IncMonth(QValeProdutoValidaDT_EMISSAO.Value, 6), 1)), mtError,
            [mbOk], 0);
            MeCodValeProduto.Clear;
            MeCodValeProduto.SetFocus;
            Abort;
          end;
        end;
        if (QValeProdutoValidaDESC_TIPO_VALE.Value = 'VALE-PRESENTE') AND
           (QValeProdutoValidaIND_SITUACAO_VALE_PRESENTE.Value <> 2) then
        begin
          MessageDlg('Este Vale-presente já foi cancelado ou não foi emitido.', mtError,
            [mbOk], 0);
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
          Abort;
        end;
        if not QValeProdutoValidaCOD_NOTA_CAB_TROCA.IsNull and
          (QValeProdutoValidaCOD_NOTA_CAB_TROCA.Value <>
           QNotaSaidaCOD_NOTA_CAB.Value) and
          ((QValeProdutoValidaIND_UTILIZADO.Value = 'S') or
           (QValeProdutoValidaIND_CANCELADO.Value = 'S')) then
        begin
          if (QValeProdutoValidaIND_CANCELADO.Value = 'S') then
            MessageDlg('Este Vale não é mais válido. A nota de devolução foi cancelada.', mtError,
            [mbOk], 0)
          else
            MessageDlg('Este Vale já foi utilizado em outra nota.', mtError,
            [mbOk], 0);
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
          Abort;
        end
        else if QValeProdutoValidaCOD_NOTA_CAB_TROCA.Value <>
           QNotaSaidaCOD_NOTA_CAB.Value then
        begin
          QValeProduto.Close;
          QValeProduto.ClearVariables;
          QValeProduto.SetVariable('PK', QValeProdutoValidaCOD_VALE_PRODUTO.Value);
          QValeProduto.Open;

          QValeProduto.Edit;
          QValeProdutoCOD_NOTA_CAB_TROCA.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
          QValeProduto.Post;

          QValeProdutoTroca.Refresh;
          QSomaVales.Close;
          QSomaVales.Open;
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TFNotaSaidaCad.btExcluirClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if not QValeProdutoTroca.Eof then
    begin
      if (QValeProdutoTrocaIND_UTILIZADO.Value = 'S') then
      begin
        MessageDlg('Não é possível desvincular um Vale Compras já utilizado.', mtError,
          [mbOk], 0);
        Abort;
      end;
      QValeProdutoTroca.Edit;
      QValeProdutoTrocaCOD_NOTA_CAB_TROCA.Value := 0;
      QValeProdutoTroca.Post;
      QValeProdutoTroca.Refresh;
    end;
  end;
end;

procedure TFNotaSaidaCad.TrataValeProduto(TipoVale: String);
var
  wValeProdutoAux, wDiferenca: Real;
begin
  with DMDevolucaoTroca do
  begin
    QValeProdutoValida.Close;
    QValeProdutoValida.ClearVariables;
    QValeProdutoValida.SetVariable('TIPO_VALE', TipoVale);
    QValeProdutoValida.SetVariable('COD_NOTA_CAB_TROCA', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    QValeProdutoValida.Open;

    wDiferenca := DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value -
      DMNotaSaida.pValorValeCompras;
 
    while not QValeProdutoValida.Eof do
    begin
      if wDiferenca > 0 then
      begin
        wDiferenca := wDiferenca - QValeProdutoValidaVAL_VALE_PRODUTO.Value;
        wValeProdutoAux := bib.ift(wDiferenca <= 0, QValeProdutoValidaVAL_VALE_PRODUTO.Value + wDiferenca,
            QValeProdutoValidaVAL_VALE_PRODUTO.Value);
        if TipoVale = 'VALE-COMPRAS' then
        begin
          DMNotaSaida.pValorValeCompras := DMNotaSaida.pValorValeCompras + wValeProdutoAux;
          DMNotaSaida.pValorNovoValeCompras := DMNotaSaida.pValorNovoValeCompras +
              bib.ift(wDiferenca >= 0,0,Abs(wDiferenca));
        end
        else
        begin
          DMNotaSaida.pValorValePresente := DMNotaSaida.pValorValePresente + wValeProdutoAux;
          DMNotaSaida.pValorNovoValePresente := DMNotaSaida.pValorNovoValePresente +
              bib.ift(wDiferenca >= 0,0,Abs(wDiferenca));
        end;
        //if wValeProdutoAux > 0 then
        //  DMNotaSaida.pValesProdutos.Add(FloatToStr(wValeProdutoAux));
      end
      else
        if TipoVale = 'VALE-COMPRAS' then
          DMNotaSaida.pValorNovoValeCompras := DMNotaSaida.pValorNovoValeCompras +
            QValeProdutoValidaVAL_VALE_PRODUTO.Value
        else
          DMNotaSaida.pValorNovoValePresente := DMNotaSaida.pValorNovoValePresente +
            QValeProdutoValidaVAL_VALE_PRODUTO.Value;
      QValeProdutoValida.Next;
    end;
  end;
end;

procedure TFNotaSaidaCad.SBCartaoCreditoClick(Sender: TObject);
begin
  inherited;
  If FTaxaCartao = Nil then
    FTaxaCartao := TFTaxaCartao.Create(Application);
  FTaxaCartao.ShowModal;
end;

procedure TFNotaSaidaCad.GerarPedido;
Var
  wLote, wCusto,wIndSituacaoTabelaPreco : string;
  wCodTabelaPreco : string;
Begin
  wCusto:= '';
  with DMPedido do
  begin
    QPedido.Close;
    QPedidoItem.Close;

    with DMRelatorio_Venda do
    Begin
      if QRMapaVendaRes.recordCount > 0 then
        begin
          try
            DMOracle.DBCemapa.StartTransaction;
            QPedido.Open;
            QpedidoItem.Open;
            QPedido.Insert;
            QPedidoNUM_PEDIDO.Value := DMSequencia.Sequencia(2,'PEDIDO');
            QPedidoCOD_FILIAL.Value := 1;
            QPedidoCOD_CADASTRO.Value := 1650;
            QPedidoCOD_OPERACAO.Value := 72;
            QPedidoDT_EMISSAO.Value := Date;

            wCodTabelaPreco := DMOracle.FastSelect('COD_TABELA_PRECO_CAB','TB_CADASTRO','COD_CADASTRO = ' + QPedidoCOD_CADASTRO.Text);
            if (DMOracle.FastSelect('IND_SITUACAO','TB_TABELA_PRECO_CAB','COD_TABELA_PRECO_CAB = ' + wCodTabelaPreco) = 'DESATIVADO') then
              Raise Exception.Create('Tabela de preço ' + wCodTabelaPreco + ' está desativado.');

            QRMapaVendaRes.First;
            while not QRMapaVendaRes.Eof do
            begin
              QPedidoItem.Insert;
              QPedidoItemCOD_PRODUTO.Value := QRMapaVendaResCOD_PRODUTO.Value;
              QPedidoItemQT_PEDIDO.Value := QRMapaVendaResSQT_QUANTIDADE.Value;
              wLote := DMOracle.BuscaNome('SELECT MAX(COD_LOTE_TIPO) FROM TB_ESTOQUE','COD_PRODUTO ='
                                          + QRMapaVendaResCOD_PRODUTO.Text);
              wCusto := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE',
                                                ' COD_PRODUTO = ' + QRMapaVendaResCOD_PRODUTO.Text +
                                                ' AND COD_LOTE_TIPO = ' + wLote);
              if wCusto = '' then
                ShowMessage('Produto ' + QRMapaVendaResCOD_PRODUTO.Text + ' não tem custo cadastrado! Cadastre o custo!');
              QPedidoItemVAL_UNITARIO.Value := StrToFloat(wCusto);

              QRMapaVendaRes.Next;
            end;
          QPedidoInd_Situacao.Value := '1';
          QPedido.Post;
          //QPedidoItem.Post;
          DmOracle.DBCemapa.Commit;
        except
          DmOracle.DBCemapa.Rollback;
          Qpedido.Cancel;
          QPedidoItem.Cancel;
          raise;
        end;
      end;
    end;
  end;

end;

procedure TFNotaSaidaCad.LancamentoCartaoClick(Sender: TObject);
begin
  inherited;
{  if FReceituarioOtico = Nil then
    FReceituarioOtico := TFReceituarioOtico.Create(Application);
  FReceituarioOtico.ShowModal;}
  DMNotaSaida.wLancCartaoIndividual := True;
  if FLancamentoCartao = Nil then
    FLancamentoCartao := TFLancamentoCartao.Create(Application);
  FLancamentoCartao.ShowModal;
end;

procedure TFNotaSaidaCad.DBENumFabricanteExit(Sender: TObject);
var
  codProduto: string;
begin
  inherited;
  codProduto := '';
  if Trim(DBENumFabricante.Text) <> '' then
  begin
    codProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(DBENumFabricante.Text) + chr(39), True);
    if Trim(codProduto) = '' then
      DBENumFabricante.Text := ''
    else
      DMNotaSaida.QItemNFCOD_PRODUTO.Value := StrToFloat(codProduto);
    DBEdit50.SetFocus;
  end
  else
  begin
    //Gian 07/12/2018 à pedido do Marlon
    //Focar no campo quantidade para Kreuz
    if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA') or
      (DMParamSistema.CodEmpresa  = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
      DBEdit50.SetFocus;
  end;
end;

procedure TFNotaSaidaCad.VendasporInformaesAddItem1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[61].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial61.MeFilial.Text),'VENDA');

    if (FNotaSaidaParam.FmDatas61.MeDtInicial.Text = '') and (FNotaSaidaParam.FmDatas61.MeDtFinal.Text = '') then
      raise Exception.Create('Informe a Data de Emissão');

    QRVendaInfAddItem.Close;
    QRVendaInfAddItem.SetVariable('DATA_I',FNotaSaidaParam.FmDatas61.MeDtInicial.Text);
    QRVendaInfAddItem.SetVariable('DATA_F',  FNotaSaidaParam.FmDatas61.MeDtFinal.Text);

    if Trim(FNotaSaidaParam.FmFilial61.MeFilial.Text)= ''   then
      QRVendaInfAddItem.SetVariable('COD_FILIAL',Null)
    else
      QRVendaInfAddItem.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.FmFilial61.MeFilial.Text));
   if Trim(FNotaSaidaParam.FmCadastro61.MeCadastro.Text) = ''   then
      QRVendaInfAddItem.SetVariable('COD_CADASTRO',Null)
    else
      QRVendaInfAddItem.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro61.MeCadastro.Text));

    if Trim(FNotaSaidaParam.MEOperacao61.Text) <> '' then
      QRVendaInfAddItem.SetVariable('COD_OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MeOperacao61.Text))+')')
    else
      QRVendaInfAddItem.SetVariable('COD_OPERACAO', '1=1');
    if Trim(FNotaSaidaParam.MeSerie61.Text) <> '' then
      QRVendaInfAddItem.SetVariable('COD_SERIE', 'TB_NOTA_CAB.COD_SERIE IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MeSerie61.Text))+')')
    else
      QRVendaInfAddItem.SetVariable('COD_SERIE', '1=1');
    if Trim(FNotaSaidaParam.MeInfAdicionais61.Text) = '' then
      QRVendaInfAddItem.SetVariable('DESC_INF_ADICIONAL',' ')
    else
      QRVendaInfAddItem.SetVariable('DESC_INF_ADICIONAL', Trim(FNotaSaidaParam.MeInfAdicionais61.Text));


    QRVendaInfAddItem.Open;
    if FRVendaInfAddItem = Nil then
      FRVendaInfAddItem := TFRVendaInfAddItem.Create(Application);
    FRVendaInfAddItem.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.FmDatas61.MeDtInicial.Text +
                                            ' a ' + FNotaSaidaParam.FmDatas61.MeDtFinal.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendaInfAddItem.QRPrimario.Preview
    else
       FRVendaInfAddItem.QRPrimario.Print;

    QRVendaInfAddItem.Close;
  end;

end;

procedure TFNotaSaidaCad.Vendasporlote1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[62].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    if (FNotaSaidaParam.Me62DtInicial.Text = '') and (FNotaSaidaParam.Me62DtFinal.Text = '') then
      raise Exception.Create('Informe a Data de Emissão');

    QRNotasLoteCadastro.Close;

    Bib.setVariableOuNull(QRNotasLoteCadastro,'DATA_I',FNotaSaidaParam.Me62DtInicial.Text);
    Bib.setVariableOuNull(QRNotasLoteCadastro,'DATA_F',FNotaSaidaParam.Me62DtFinal.Text);
    Bib.setVariableOuNull(QRNotasLoteCadastro,'FILIAL',Trim(FNotaSaidaParam.Fm62Filial.MeFilial.Text));
    Bib.setVariableOuNull(QRNotasLoteCadastro,'CADASTRO',Trim(FNotaSaidaParam.Fm62Cadastro.MeCadastro.Text));
    Bib.setVariableOuNull(QRNotasLoteCadastro,'CLASSE',Trim(FNotaSaidaParam.Fm62Classe.MeClasse.Text));
    Bib.setVariableOuNull(QRNotasLoteCadastro,'PRODUTO',Trim(FNotaSaidaParam.Fm62Produto.MeProduto.Text));
    Bib.setVariableOuNull(QRNotasLoteCadastro,'LOTE',Trim(FNotaSaidaParam.Fm62Lote.MeLote.Text));
    Bib.setVariableOuNull(QRNotasLoteCadastro,'OPERACAO',Trim(FNotaSaidaParam.Fm62Operacao.MeOperacao.Text));

    case FNotaSaidaParam.Rg62Ordem.ItemIndex of
      0: Bib.setVariableOuNull(QRNotasLoteCadastro,'ORDEM','CAD.NOME');
      1: Bib.setVariableOuNull(QRNotasLoteCadastro,'ORDEM','LOTE.DESC_LOTE');
      2: Bib.setVariableOuNull(QRNotasLoteCadastro,'ORDEM','PROD.DESC_PRODUTO');
    end;

    QRNotasLoteCadastro.Open;

    if FRNotasLoteCadastro = Nil then
      FRNotasLoteCadastro := TFRNotasLoteCadastro.Create(Application);
    FRNotasLoteCadastro.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.Me62DtInicial.Text +
                                            ' a ' + FNotaSaidaParam.Me62DtFinal.Text;
    FRNotasLoteCadastro.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNotasLoteCadastro.QRPrimario.Preview
    else
       FRNotasLoteCadastro.QRPrimario.Print;

    QRNotasLoteCadastro.Close;
  end;
end;

procedure TFNotaSaidaCad.NotasMarketplace1Click(Sender: TObject);
begin
  inherited;
  if FNotasMarketplace = nil then
     FNotasMarketplace := TFNotasMarketplace.Create(Application);
  FNotasMarketplace.btnPesquisarClick(Sender);
  FNotasMarketplace.ShowModal;
end;

procedure TFNotaSaidaCad.DBNavigator1BeforeAction(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  //incluído para acionar o onexit do campo que estiver caso seja clicado em algum botão do dbavigator - Cleber 09/01/2020
  DBEdit61.SetFocus;
  ActiveControl := nil;
  if wPermiteDesconto = false then
    Abort;

end;

procedure TFNotaSaidaCad.DBPCidadePrestacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFNotaSaidaCad.EspelhodaNota1Click(Sender: TObject);
begin
  inherited;
  with DMRelatorio_Venda do
  begin
   if DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value = 0 then
     MessageDlg('Selecione a nota para gerar o espelho', mtError, [mbOK], 0)
   else
   begin
    QRelEspelhoNota.Close;
    QRelEspelhoNota.SetVariable('PK',DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    QRelEspelhoNota.Open;

    if FRelEspelhoNota = nil then
        FRelEspelhoNota := TFRelEspelhoNota.Create(Application);

    if (DMParamSistema.CodEmpresa = 'DISMAVEL') then
      FRelEspelhoNota.QRDBText13.DataField := 'NUM_GENERO_NCM';

    if (DMParamSistema.CodEmpresa = 'NFCE-TMT') then
      FRelEspelhoNota.QRLabel39.Caption := 'Orç.: ';

    FRelEspelhoNota.QRPrimario.Preview;
   end;
  end;
end;

procedure TFNotaSaidaCad.ResumoVendaOS1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[63].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRResumoVendaOS.Close;
      if trim(FNotaSaidaParam.FmFilial63.MeFilial.Text) <> '' then
        QRResumoVendaOS.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.FmFilial63.MeFilial.Text))
      else
        QRResumoVendaOS.SetVariable('COD_FILIAL', null);
      if (FNotaSaidaParam.FmDatas63.MeDtInicial.Text = '') and (FNotaSaidaParam.FmDatas63.MeDtFinal.Text = '') then
        raise Exception.Create('Informe a Data de Emissão')
      else
      begin
        QRResumoVendaOS.SetVariable('DATA_I', FNotaSaidaParam.FmDatas63.MeDtInicial.Text);
        QRResumoVendaOS.SetVariable('DATA_F', FNotaSaidaParam.FmDatas63.MeDtFinal.Text);
      end;
      QRResumoVendaOS.Open;

     if FResumoVendaOS = nil then
        FResumoVendaOS := TFResumoVendaOS.Create(Application);
      FResumoVendaOS.QRPrimario.Preview;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtPrazoConsClick(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.showModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;

end;

procedure TFNotaSaidaCad.Button1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    QInsertContabiliza.Close;
    QInsertContabiliza.Open;
    QInsertContabiliza.First;
    while not QInsertContabiliza.Eof do
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK',QInsertContabilizaCOD_NOTA_CAB.Value);
      QNotaSaida.Open;
      Contabiliza;
      DMOracle.DBCemapa.Commit;
      QInsertContabiliza.Next;
    end;
  end;
end;

procedure TFNotaSaidaCad.DBEdit108Exit(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    QItemNFVAL_CSLL.Value := QItemNFVAL_TOTAL.Value * QItemNFPERC_CSLL.Value /100; 
end;

procedure TFNotaSaidaCad.DBEdit110Exit(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    QItemNFVAL_IR.Value := QItemNFVAL_TOTAL.Value * QItemNFPERC_IR.Value /100;
end;

procedure TFNotaSaidaCad.BTCarregaSTAnteriorClick(Sender: TObject);
begin
  inherited;
  if FNotaEntradaCons = nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  if FNotaEntradaCons.ShowModal = mrOk then
  begin
    with DMNotaEntrada do
    begin
      QItemNfCons.Close;
      QItemNfCons.SetVariable('COD_NOTA_CAB', QNotaEntradaConsCOD_NOTA_CAB.Value);
      QItemNfCons.Open;

      if DMNotaSaida.QItemNFCOD_PRODUTO.Value = 0 then
        raise Exception.Create('Preencha o campo produto.');
      if DMNotaSaida.QItemNFQT_QUANTIDADE.Value = 0 then
        raise Exception.Create('Preencha o campo quantidade.');
      if not QItemNfCons.Locate('COD_PRODUTO', DMNotaSaida.QItemNFCOD_PRODUTO.Value,[]) then
        raise Exception.Create('A nota de entrada escolhida não possui este produto.');
      if QItemNfConsVAL_ST_ANTERIOR_RETIDO.Value > 0 then
      begin
        DMNotaSaida.QItemNFVAL_BASE_ST_ANTERIOR_RETIDO.Value :=
          (QItemNfConsVAL_BASE_ST_ANTERIOR_RETIDO.Value / QItemNfConsQT_QUANTIDADE.Value) *
          DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
        DMNotaSaida.QItemNFVAL_ST_ANTERIOR_RETIDO.Value :=
          (QItemNfConsVAL_ST_ANTERIOR_RETIDO.Value / QItemNfConsQT_QUANTIDADE.Value) *
          DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
        DMNotaSaida.QItemNFPERC_ST_ANTERIOR_RETIDO.Value := QItemNfConsPERC_ST_ANTERIOR_RETIDO.Value;
      end
      else if QItemNfConsVAL_ICMS_SUBST.Value > 0 then
      begin
        DMNotaSaida.QItemNFVAL_BASE_ST_ANTERIOR_RETIDO.Value :=
          (QItemNfConsVAL_BASE_SUBST.Value / QItemNfConsQT_QUANTIDADE.Value) *
          DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
        DMNotaSaida.QItemNFVAL_ST_ANTERIOR_RETIDO.Value :=
          (QItemNfConsVAL_ICMS_SUBST.Value / QItemNfConsQT_QUANTIDADE.Value) *
          DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
      end;
    end;
  end;
end;

procedure TFNotaSaidaCad.DBEdit50Enter(Sender: TObject);
begin
  inherited;
  wQuantidadeAnterior := DMNotaSaida.QItemNFQT_QUANTIDADE.Value;
end;

procedure TFNotaSaidaCad.OramentoViaExcel1Click(Sender: TObject);
var
  Excel, Sheet: Variant;
  Linha, wOk : Integer;
begin
  inherited;
  with DMNotaSaida do
  begin
    QExpexcel.Close;
    QExpexcel.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QExpexcel.Open;
    QExpexcel.First;

    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := True;
    {Excel.Workbooks.Add;}
    Excel.WorkBooks.open(ExtractFilePath(Application.ExeName) + 'Orcamento.xls');
    Sheet := Excel.WorkBooks[1].Sheets[1];

    Sheet.cells[3, 5] := DMFilial.QFilialDESC_ENDERECO.Value + ', ' + DMFilial.QFilialNUM_ENDERECO.Text + ' - ' + DMFilial.QFilialDESC_FILIAL.Value + ' - ' + DMFilial.QFilialCOD_ESTADO.Value;
    Sheet.cells[4 ,4] := 'FONE: ' + DMFilial.QFilialDESC_TELEFONE.Value + ' FAX: ' + DMFilial.QFilialDESC_FAX.value;
    Sheet.cells[8, 1] := ' Nº NF: ' + QExpexcelNUM_NOTA.AsString;
    Sheet.Cells[9, 2] := QExpexcelDT_EMISSAO.Text;
    Sheet.Cells[10, 2] := QExpexcelNOME.Value;
    Sheet.Cells[10, 8] := QExpexcelDESC_E_MAIL.Value;
    Sheet.Cells[11, 2] := QExpexcelDESC_TELEFONE.Value;
    Sheet.Cells[11, 5] := QExpexcelDESC_CELULAR.Value;
    Sheet.Cells[11, 8] := QExpexcelDESC_CIDADE.Value + '/' + QExpexcelCOD_ESTADO.Value;
//     Sheet.Cells[12, 2] := QExpexcelDESC_VEICULO.Value;
//      Sheet.Cells[12, 8] := QExpexcelDESC_CHASSI.Value;
    Linha := 15;
    wOk := 0;
    while not QExpexcel.Eof do begin
      If (QExpexcelIND_CESTA_BASICA.Value = 'SIM') And
         (wOk = 0) Then
       Begin
         wOk := 1;
         Inc(Linha,1);
         Sheet.Cells[Linha, 2].font.size := 10; // Tamanho da Fonte
         Sheet.Cells[Linha, 2].font.bold := true; // Negrito
         Sheet.Cells[Linha, 2].font.italic := true; // Italico
         Sheet.Cells[Linha, 2].font.color := clRed; // Cor da Fonte
         Sheet.Cells[Linha, 2] := 'OPCIONAIS A SEREM INCLUIDOS NO ORÇAMENTO';
         Inc(Linha);
       End;
      if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      begin
        Sheet.Cells[Linha, 1] := QExpexcelQT_QUANTIDADE.Value;
        Sheet.Cells[Linha, 2] := QExpexcelNUM_FABRICANTE.Value;
        Sheet.Cells[Linha, 3] := QExpexcelDESC_PRODUTO.Value;
        Sheet.Cells[Linha, 9] := QExpexcelVAL_UNITARIO.Value;
        Sheet.Cells[Linha, 10] := QExpexcelVAL_TOTAL.Value;
      end
      else
      begin
        Sheet.Cells[Linha, 1] := QExpexcelQT_QUANTIDADE.Value;
        Sheet.Cells[Linha, 2] := QExpexcelDESC_PRODUTO.Value;
        Sheet.Cells[Linha, 8] := QExpexcelVAL_UNITARIO.Value;
//      If QExpexcelDesc_Classe.Value <> 'OPCIONAL' Then               //A pedido da Miriam
        Sheet.Cells[Linha, 9] := QExpexcelVAL_TOTAL.Value;
      end;
      QExpexcel.Next;
      Inc(Linha);
    end;

    if ((QExpexcelVAL_DESCONTO.IsNull) or (QExpexcelVAL_DESCONTO.Value = 0)) then
    begin
      Sheet.Cells[59, 9] := '';
      Sheet.Cells[59, 8] := '';
      Sheet.Cells[60, 9] := '';
      Sheet.Cells[60, 8] := '';
      Sheet.Cells[58, 8] := 'Total';
    end
    else
    begin
      Sheet.Cells[59, 8] := 'Desconto:';
      Sheet.Cells[59, 9] := QExpexcelVAL_DESCONTO.Value;
    end;
//    Sheet.Cells[62, 1] := 'Pagamento a prazo:' + QExpexcelDESC_FORMA_PAGAMENTO.Value;
    {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
      Sheet.Cells[63, 1] := 'Obs: O revestimento de teto e laterais na van modelo MASTER, apartir de fev/2015, será todo em ABS. ' + QExpexcelDESC_OBSERVACAO.Value +
          QExpexcelDESC_COMPLEMENTO_OBS.Value +
          QExpexcelDESC_COMPLEMENTO_OBS2.Value//Pedido da Magali. Junior - 15/12/2014.
    else} //Pedido para Retirar essa mensagem. Solicitação Michelli. Junior - 26/01/2014.
    Sheet.Cells[63, 1] := 'Obs: ' + QExpexcelOBS.Value; {+
          QExpexcelDESC_COMPLEMENTO_OBS.Value +
          QExpexcelDESC_COMPLEMENTO_OBS2.Value;         }

    if QExpexcelIND_TIPO_FRETE.Value = 'CIF' then
    begin
      Sheet.Cells[67, 1] := '';
      Sheet.Cells[67, 2] := '';
    end
    else
      Sheet.Cells[67, 2] := QExpexcelIND_TIPO_FRETE.Value;
      Sheet.Cells[68, 1] := QExpexcelNOME_VENDEDOR.Value;
   Excel.WorkBooks[1].SaveAs(ExtractFilePath(Application.ExeName) + 'Orcamento_' + QExpexcelCOD_NOTA_CAB.Text + '(' + formatdatetime('dd-mm-yyyy-hh-mm-ss', now) + ')' + '.xls');

    //    Sheet.PrintPreview;
  end;
end;

procedure TFNotaSaidaCad.BtConsTecnicoClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_TECNICO.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  DbEdit18.Setfocus;

end;

procedure TFNotaSaidaCad.ComissoTcnicoVendedor1Click(Sender: TObject);
begin
  inherited;
 
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[64].TabVisible := True;
 // FNotaSaidaParam.cbOrdem.ItemIndex := 64;
  if FNotaSaidaParam.ShowModal = mrOk then
    with DMRelatorio_Venda do
    begin
      QRComissaoTecnico.Close;
      QRComissaoVendedor.Close;
      QRComissaoTotalOS.Close;
      QRComissaoVendedor.SetVariable('DATA_I', FNotaSaidaParam.MeDtInicial64.Text);
      QRComissaoTecnico.SetVariable('DATA_I', FNotaSaidaParam.MeDtInicial64.Text);
      QRComissaoTotalOS.SetVariable('DATA_I', FNotaSaidaParam.MeDtInicial64.Text);
      QRComissaoTecnico.SetVariable('DATA_F', FNotaSaidaParam.MeDtFinal64.Text);
      QRComissaoVendedor.SetVariable('DATA_F', FNotaSaidaParam.MeDtFinal64.Text);
      QRComissaoTotalOS.SetVariable('DATA_F', FNotaSaidaParam.MeDtFinal64.Text);
      if Trim(FNotaSaidaParam.FmFilial64.MeFilial.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('FILIAL', Null);
        QRComissaoVendedor.SetVariable('FILIAL', Null);
        QRComissaoTotalOS.SetVariable('FILIAL', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial64.MeFilial.Text));
        QRComissaoVendedor.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial64.MeFilial.Text));
        QRComissaoTotalOS.SetVariable('FILIAL', Trim(FNotaSaidaParam.FmFilial64.MeFilial.Text));
      end;
      if trim(FNotaSaidaParam.FmVendedor64.MeVendedor.Text) = '' then
      begin
      //  QRComissaoTecnico.SetVariable('VENDEDOR', Null);
        QRComissaoVendedor.SetVariable('VENDEDOR', Null);
      end
      else
      begin
     //   QRComissaoTecnico.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text));
        QRComissaoVendedor.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmVendedor64.MeVendedor.Text));
      end;
      if Trim(FNotaSaidaParam.FmTecnico64.MeVendedor.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('TECNICO', Null);
        QRComissaoTotalOS.SetVariable('TECNICO', Null);
      //  QRComissaoVendedor.SetVariable('TECNICO', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico64.MeVendedor.Text));
        QRComissaoTotalOS.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico64.MeVendedor.Text));
    //    QRComissaoVendedor.SetVariable('TECNICO', Trim(FNotaSaidaParam.FmTecnico.MeVendedor.Text));
      end;
      if Trim(FNotaSaidaParam.EdSerie64.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('SERIE', Null);
        QRComissaoVendedor.SetVariable('SERIE', Null);
        QRComissaoTotalOS.SetVariable('SERIE', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('SERIE', Trim(FNotaSaidaParam.EdSerie64.Text));
        QRComissaoVendedor.SetVariable('SERIE', Trim(FNotaSaidaParam.EdSerie64.Text));
        QRComissaoTotalOS.SetVariable('SERIE', Trim(FNotaSaidaParam.EdSerie64.Text));
      end;
      if Trim(FNotaSaidaParam.EdSerie65.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('SERIE1', Null);
        QRComissaoVendedor.SetVariable('SERIE1', Null);
        QRComissaoTotalOS.SetVariable('SERIE1', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('SERIE1', Trim(FNotaSaidaParam.EdSerie65.Text));
        QRComissaoVendedor.SetVariable('SERIE1', Trim(FNotaSaidaParam.EdSerie65.Text));
        QRComissaoTotalOS.SetVariable('SERIE1', Trim(FNotaSaidaParam.EdSerie65.Text));
      end;
      if FNotaSaidaParam.RGCondicaoPagto64.ItemIndex <> 3 then
      begin
        QRComissaoTecnico.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RGCondicaoPagto64.ItemIndex + 1);
        QRComissaoVendedor.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RGCondicaoPagto64.ItemIndex + 1);
        QRComissaoTotalOS.SetVariable('IND_CONDICAO_PAGTO', FNotaSaidaParam.RGCondicaoPagto64.ItemIndex + 1);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('IND_CONDICAO_PAGTO', null);
        QRComissaoVendedor.SetVariable('IND_CONDICAO_PAGTO', null);
        QRComissaoTotalOS.SetVariable('IND_CONDICAO_PAGTO', null);
      end;

      if Trim(FNotaSaidaParam.FmProduto64.MeProduto.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('COD_PRODUTO', Null);
        QRComissaoVendedor.SetVariable('COD_PRODUTO', Null);
       // QRComissaoTotalOS.SetVariable('COD_PRODUTO', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto64.MeProduto.Text));
        QRComissaoVendedor.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto64.MeProduto.Text));
        //QRComissaoTotalOS.SetVariable('COD_PRODUTO', Trim(FNotaSaidaParam.FmProduto64.MeProduto.Text));
      end;
      if Trim(FNotaSaidaParam.FmOperacao64.MeOperacao.Text) = '' then
      begin
        QRComissaoTecnico.SetVariable('COD_OPERACAO', Null);
        QRComissaoVendedor.SetVariable('COD_OPERACAO', Null);
        QRComissaoTotalOS.SetVariable('COD_OPERACAO', Null);
      end
      else
      begin
        QRComissaoTecnico.SetVariable('COD_OPERACAO', Trim(FNotaSaidaParam.FmOperacao64.MeOperacao.Text));
        QRComissaoVendedor.SetVariable('COD_OPERACAO', Trim(FNotaSaidaParam.FmOperacao64.MeOperacao.Text));
        QRComissaoTotalOS.SetVariable('COD_OPERACAO', Trim(FNotaSaidaParam.FmOperacao64.MeOperacao.Text));
      end;
//      if (DMParamSistema.CodEmpresa <> 'REFRISM') then
      QRComissaoTecnico.SetVariable('IND_TIPO_PRODUTO','SERVIÇO');
//      else
//        QRComissaoTecnico.SetVariable('IND_TIPO_PRODUTO',Null);



      QRComissaoTecnico.Open;
      QRComissaoVendedor.Open;
      QRComissaoTotalOS.Open;

      if FNotaSaidaParam.RGTipoRelatorio64.ItemIndex = 0 then
      begin
       if FRComissaoTecnico = nil then
         FRComissaoTecnico := TFRComissaoTecnico.Create(Application);
       FRComissaoTecnico.QRLabel4.Caption := 'Período:' + FNotaSaidaParam.MeDtInicial64.Text + ' Até ' + FNotaSaidaParam.MeDtFinal64.Text;
       if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
         FRComissaoTecnico.QRPrimario.Preview
       else
         FRComissaoTecnico.QRPrimario.Print;
      end
      else if FNotaSaidaParam.RGTipoRelatorio64.ItemIndex = 1 then
      begin
        if FRComissaoVendedor = nil then
          FRComissaoVendedor := TFRComissaoVendedor.Create(Application);
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRComissaoVendedor.QRPrimario.Preview
        else
          FRComissaoVendedor.QRPrimario.Print;
      end
      else
      begin
        if FRNota_ComissaoOS = nil then
          FRNota_ComissaoOS := TFRNota_ComissaoOS.Create(Application);
        if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRNota_ComissaoOS.QRPrimario.Preview
        else
          FRNota_ComissaoOS.QRPrimario.Print;
      end;

      QRComissaoTecnico.Close;
      QRComissaoVendedor.Close;
      QRComissaoTotalOS.close;
      end;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit
 end;
procedure TFNotaSaidaCad.BtFormulaClick(Sender: TObject);
begin
  inherited;
  if FFormulaCons = nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  if FFormulaCons.ShowModal = mrOk then
    DMNotaSaida.QItemNFCOD_FORMULA.Value := DMFormula.QFormulaConsCOD_FORMULA.Value;
end;

procedure TFNotaSaidaCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit3.Text);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' Then
  Begin
    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value := 46;
    if DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 2 Then
    Begin
      DMNotaSaida.QItemNF.First;
      While (not DMNotaSaida.QItemNF.Eof) do
      Begin
        DMNotaSaida.QItemNF.Edit;
        DMNotaSaida.QItemNFCOD_TRIBUTACAO.VAlue := 35;
        DMNotaSaida.QItemNF.Post;
        DMNotaSaida.QItemNF.Next;
      end;
    end;
  End;
{Adicionado para a Stein para puxar a série da filial, pois eles emitem nota de produto e o cadastro da filial é sempre o mesmo, mudando apenas a inscrição estadual
por isto foram criados séries diferentes. Alex 25/03/2024
Adicionado CodEmpresa GRauber. Alex 09/04/2026.}
  if (DMParamSistema.CodEmpresa = 'STEIN') or (DMParamSistema.CodEmpresa = 'GRAUBER') then
    DBPSerie.DBEdit.Text := DMOracle.FastSelect('COD_SERIE','TB_FILIAL','COD_FILIAL = ' + Trim (DBEdit3.Text) );
end;

procedure TFNotaSaidaCad.ConfernciaNFCdigoBarras1Click(Sender: TObject);
begin
  inherited;
  if FConferenciaNFCodBarras = nil then
      FConferenciaNFCodBarras := TFConferenciaNFCodBarras.Create(Application);
    FConferenciaNFCodBarras.ShowModal;
end;

procedure TFNotaSaidaCad.DBEdit57Exit(Sender: TObject);
begin
  inherited;
     DMNotaSaida.QItemNFDESC_INF_ADICIONAL.Clear;
end;

procedure TFNotaSaidaCad.GeraBoletoApi;
var
  wBoletoApi: IBoletoApi;
  wEmiteNfe, wComando: string;
  wPodeGerarBoleto: Boolean;

begin
  { Verifica se a nota pode gerar boleto }
  wEmiteNfe := DMOracle.FastSelect('IND_EMITE','TB_OPERACAO','COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text);
  wPodeGerarBoleto := (DMNfe.QNfeSIT_NFE.Value = '100') or(wEmiteNfe <> 'F');//Emitir boletos apenas para notas autorizadas. Solic. NeoAli - Junior 22/07/2026. 

  if not wPodeGerarBoleto then
    Exit;

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;

    if QBoletoAPINotaIND_API_BOLETO.Value <> 'SIM' then
      Exit;

    if MessageDlg('Deseja emitir o(s) boleto(s)?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);

      // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(
                      QNotaSaidaCOD_FILIAL.Value,
                      QNotaSaidaNUM_NOTA.Value,
                      QNotaSaidaCOD_NOTA_CAB.Value,
                      QBoletoAPINotaCOD_BANCO.Value,
                      0, // SE NOTA, NÃO PRECISA O CONTRATO
                      TGBNota,
                      QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                      wEnviaBoletoEmail,
                      True);

      wBoletoApi.EnviarBoletosApi;

      if not wBoletoApi.GetIndTemRejeicao then
      begin
        //if MessageDlg('Deseja imprimir o(s) boleto(s)?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
        //begin
          wBoletoApi.GerarPDF;
        //end;
      end;
    end
    else
    begin
     { Usuário optou por não enviar boleto para API, mantendo apenas o contas a receber gerado Solic. Marcos cemapa. Junior 22/07/2026}
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_WEB_API = ' + QuotedStr('S');
      wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCOD_NOTA_CAB.Value);
      DMOracle.QExecSQL.SQL.Add(wComando);
      DMOracle.QExecSQL.ExecSQL;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    end;
  end;
end;

procedure TFNotaSaidaCad.ImprimeBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;



    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);

                   // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           false, true);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.ImprimirBoletosApi;
    end;
  end;
end;

procedure TFNotaSaidaCad.EnviarEmailBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;



    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);

                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           true,false);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.EnviaEmailBoletosApi;
    end;
  end;
end;

procedure TFNotaSaidaCad.btnEnviaBoletoApiClick(Sender: TObject);
begin
  inherited;
  GeraBoletoApi;
end;

procedure TFNotaSaidaCad.btnImprimirBoletoApiClick(Sender: TObject);
begin
  inherited;
  ImprimeBoletoAPI;
end;

procedure TFNotaSaidaCad.btnEnviarBoletoEmailClick(Sender: TObject);
begin
  inherited;
  EnviarEmailBoletoApi;
end;

procedure TFNotaSaidaCad.ConsolidarContasReceber1Click(Sender: TObject);
begin
  inherited;
  if FTitulosFaturamento = nil then
     FTitulosFaturamento := FTitulosFaturamento.Create(Application);
  FTitulosFaturamento.ShowModal;
end;

end.
