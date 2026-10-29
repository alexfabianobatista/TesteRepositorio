unit UNotaSaidaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, QuickRpt, DBTables, DBDirceu, OracleData, OraTeste,
  OracleNavigator, variants, ActnList, DBPanel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFNotaSaidaCad = class(TFTCadSimples)
    PCNota: TPageControl;
    TSCabecalho: TTabSheet;
    TabSheet2: TTabSheet;
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
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBECliente: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
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
    BtConsVendedor: TBitBtn;
    BtConsOperacao: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    BtConsMensagem: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    BtConsTransportador: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit37: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
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
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
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
    BtImpItemPed: TBitBtn;
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
    DBRadioGroup2: TDBRadioGroup;
    Label2: TLabel;
    DBEdit1: TDBEdit;
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
    Comisses1: TMenuItem;
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
    SBGeraContaCorrente: TSpeedButton;
    Label38: TLabel;
    DBEdit35: TDBEdit;
    Label40: TLabel;
    DBEdit46: TDBEdit;
    BitBtn1: TBitBtn;
    Label57: TLabel;
    DBEdit48: TDBEdit;
    DBDirceu1: TDBDirceu;
    SBImprimeCupomFiscal: TSpeedButton;
    SBConsultaFrete: TSpeedButton;
    Label58: TLabel;
    DBEdit29: TDBEdit;
    Label59: TLabel;
    DBEdit49: TDBEdit;
    PMapaVendasPVendedorPagtoClasse1: TMenuItem;
    QContaCorrenteAberto1: TMenuItem;
    RRecibodeComisso1: TMenuItem;
    Label60: TLabel;
    DBEdit58: TDBEdit;
    SRelatrioVendasComCheque1: TMenuItem;
    TRelatrioMaioresClientes1: TMenuItem;
    DBEdit13: TDBEdit;
    DBEdit32: TDBEdit;
    VResumoProdutosPorCliente1: TMenuItem;
    Label61: TLabel;
    DBEdit33: TDBEdit;
    Label62: TLabel;
    DBEComissao_Nota: TDBEdit;
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
    BtImpItemNota: TBitBtn;
    VendasPVendedorClasseFornecedor1: TMenuItem;
    Label63: TLabel;
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
    LblBeneficiado: TLabel;
    DBEBeneficiado: TDBEdit;
    Label67: TLabel;
    DBEdit47: TDBEdit;
    BtConsVendedorPre: TBitBtn;
    Label68: TLabel;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    Label69: TLabel;
    DBMemo1: TDBMemo;
    BtMensagem: TBitBtn;
    Label70: TLabel;
    SBCartaCorrecao: TSpeedButton;
    Label71: TLabel;
    DBEdit68: TDBEdit;
    BtParceiro: TBitBtn;
    Label72: TLabel;
    DBEdit69: TDBEdit;
    Label73: TLabel;
    DBEdit70: TDBEdit;
    Label74: TLabel;
    DBEdit71: TDBEdit;
    LblSituacao: TLabel;
    VendedorCliente1: TMenuItem;
    Label75: TLabel;
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
    Label78: TLabel;
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
    Label87: TLabel;
    DBEdit83: TDBEdit;
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
    MePrazo: TMaskEdit;
    DBDirceu4: TDBDirceu;
    Label92: TLabel;
    DBEdit87: TDBEdit;
    Label93: TLabel;
    DBEdit88: TDBEdit;
    MapaVenda21: TMenuItem;
    DBEdit89: TDBEdit;
    Label94: TLabel;
    RelaoProdutosporCultura1: TMenuItem;
    Label95: TLabel;
    DBEdit90: TDBEdit;
    MostraNmeroEmbarque1: TMenuItem;
    EmissoCpiaNotasIntervalo1: TMenuItem;
    BtNotaCompra_Cons: TBitBtn;
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
    DBEdit107: TDBEdit;
    Label114: TLabel;
    BtArmazemAlfandegario: TBitBtn;
    DBDirceu11: TDBDirceu;
    DBEComplemento: TDBEdit;
    LBrutoPeca: TLabel;
    DBEBrutoPeca: TDBEdit;
    LBrutoServico: TLabel;
    DBEBrutoServico: TDBEdit;
    LblPlaca: TLabel;
    DBEPlaca: TDBEdit;
    DBENumFabricante: TDBEdit;
    btSerieCons: TBitBtn;
    DBPanel11: TDBPanel;
    lblModelo: TLabel;
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
    procedure Comisses1Click(Sender: TObject);
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
    procedure DBEdit6Change(Sender: TObject);
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
    procedure DBEdit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
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
    procedure DBEdit11Exit(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure BtArmazemAlfandegarioClick(Sender: TObject);
    procedure DBPanel11CodigoExit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);

  private
    procedure MsgAutoriza;
    Procedure PImportaPedidos_Items;
    procedure Proc_TrazItens(wCod_Nota_Cab : Integer);
    function LocalizaConhecimento(cod: String): Integer;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FNotaSaidaCad: TFNotaSaidaCad;

implementation

uses UNotaSaida_cl, UCadastroCons, UFilialCons, UVendedorCons, UCadastro_cl,
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
  UNota_ContaCorrente,UNotaImpressao, UParamSistema_cl, UImpFiscal,
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
  URNota_VendaFuturaAtendida, USerie_cl, USerieCons;

{$R *.DFM}

procedure TFNotaSaidaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  begin
    QNotaSaida.Open;
    QSomaItemNota.Open;
    QItemNF.Open;
    QNotaImpostoServico.open;
    QNotaGNRE.open;
    QNotaExpTipoDoc.open;
    QNotaExpConhecimento.open;
    QNotaExpRE.open;
  End;
  DMTransporte.QTransporteAll.Open;
  PCNota.ActivePage := TSCabecalho;
  PCCabecalho.ActivePage := TSGeral;
  If (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '7') Or
     (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') Then
  Begin
    DBEComissao.ReadOnly := False;
    DBEComissao.TabStop := True;
    DBEComissao.ParentColor := False;
    DBEComissao.Color := clWindow;
  End;
  If (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '9') Or
     (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') Then
  Begin
    DBEComissao_Nota.ReadOnly := False;
    DBEComissao_Nota.TabStop := True;
    DBEComissao_Nota.ParentColor := False;
    DBEComissao_Nota.Color := clWindow;
  End;
  If DMParamSistema.QParamSistemaInd_Rota.Value = 'S' Then
  Begin
    DbEdit33.Visible := True;
    DbEdit33.TabStop := True;
    Label61.Visible := True;
    DbEdit47.Visible := True;
    Label67.Visible := True;
    BtConsVendedorPre.Visible := True;
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     DBRadioGroup2.Enabled := False;
     Label92.Visible := True;
     DbEdit87.Visible := True;
     Label93.Visible := True;
     DbEdit88.Visible := True;
     DBEdit107.Visible := True;
     Label114.Visible := True;
     BtArmazemAlfandegario.Visible := True;
     DBDirceu11.Visible := True;
   End;
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRIPAR')) Then
     Label87.Caption := 'Embalagem';
  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
end;

procedure TFNotaSaidaCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
    If DmCadastro.QCadastroConsDt_Cancelamento.Text <> '' then
      Raise Exception.Create('Cliente com Cadastro Encerrado!');
    If FPedidoCons = Nil then
      FPedidoCons := TFPedidoCons.Create(Application);
    FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
    FPedidoCons.MEDataI.Text := DateToStr(Date-180);
    FPedidoCons.pTela_Chamou := 'PEDIDO';  // para controle de segurança    
    FPedidoCons.BtProcurarClick(Self);
    If DMPedido.QPedidoConsCod_Pedido_Cab.Value > 0  then
    Begin
      FPedidoCons.METexto.Enabled := False;
      FPedidoCons.BtConsCadastro.Enabled := False;
      BtImpPedClick(Self);
      FPedidoCons.METexto.Enabled := True;
    End;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
    Begin
      If DMCadastro.QCadastroDesc_Obs.Value <> '' Then
         MessageDlg(DMCadastro.QCadastroDesc_Obs.Text + Chr(13)  +
                    DMCadastro.QCadastroDesc_Obs1.Text + Chr(13) +
                    DMCadastro.QCadastroDesc_Obs2.Text, mtInformation,[mbOk], 0);
    End;
    MsgAutoriza;  // mostra na tela as pessoas autorizadas
  End;
end;

procedure TFNotaSaidaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFNotaSaidaCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFNotaSaidaCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEdit22Exit(Self);
end;

procedure TFNotaSaidaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
  End;
end;

procedure TFNotaSaidaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DmNotaSaida.QItemNfCod_Produto.Value);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  End;
end;

procedure TFNotaSaidaCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
  End;
end;

procedure TFNotaSaidaCad.SBConfirmarClick(Sender: TObject);
begin

  If DMNotaSaida.QItemNF.State <> dsBrowse Then
     DMNotaSaida.QItemNF.Post;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' Then
       if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
         Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');

  If DBEdit8.Text <> '' Then  // Codigo do vendedor
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+DBEdit8.Text) <> 'ATIVO' Then
        Raise Exception.Create('Vendedor Inativo');
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') Then
    If (DBRadioGroup2.ItemIndex <> 0) Then  // condicao de pagamento a vista
     Begin
       If DMCadastro.QCadastroDESC_FORMA_COMPRA.Value = 'A Vista' Then
          Raise Exception.Create('Cliente com Permissão Para Compra Somente a Vista');
     End;
  With DMOperacao Do
   Begin
     QOperacao.Close;
     QOperacao.SetVariable('PK',Trim(DBEdit6.Text));
     QOperacao.Open;
     If QOperacaoInd_Fixar_Empresa.Value <> 'N' Then
         Raise Exception.Create('Operação Não Pode ser Utilizada No Vendas'+Chr(13)+'Produto Agricola Somente No Sistema Agricola');
     If QOperacaoIND_FISICA_JURIDICA.Value <> 'T' Then
        If DMCadastro.QCadastroIND_FISICA_JURIDICA.Value  <> QOperacaoIND_FISICA_JURIDICA.Value Then
         Raise Exception.Create('Operação Inválida - Quanto a Opção Física/Jurídica');
     If QOperacaoIND_TIPO_PAGAMENTO.Value <> 'T' Then
      Begin
        If (DBRadioGroup2.ItemIndex = 0) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'V') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
        If (DBRadioGroup2.ItemIndex = 1) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'P') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
        If (DBRadioGroup2.ItemIndex = 2) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'O') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      End;
     if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'BRASIL') and
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MEDIPECAS') then
     begin
       If (QOperacaoInd_Emite.Value = 'F') And (DMCadastro.QCadastroNum_Cgc_Cpf.Value = '') And
          (DMNotaSaida.QNotaSaidaCod_Estado.Value <> 'EX')  Then
         Raise Exception.Create ('Cadastro sem Cnpj/Cpf');

       if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL') Then
         If (QOperacaoInd_Emite.Value = 'F') And (DMCadastro.QCadastroNum_Inscricao.Value = '') And
            (DMNotaSaida.QNotaSaidaCod_Estado.Value <> 'EX')  Then
            Raise Exception.Create ('Cadastro sem Inscricao/Identidade');
     end;

     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
        If (DMCadastro.QCadastroCOD_VENDEDOR.Text = '') And (QOperacaoInd_Vendas.Value = 'V') Then
          Raise Exception.Create('Não é Permitido Nota de Venda Sem Vendedor'+Chr(13)+'Acertar Cadastro do Cliente');
   End;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
     If (DMCadastro.QCadastroCOD_RAMO.Value = 1) And
        (DMCadastro.QCadastroIND_FISICA_JURIDICA.Value = 'F') And
        (DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Text = '') Then
         Raise Exception.Create('Cadastro de produtor sem CADPRO');
  With  DMNotaSaida do
  Begin
    Try
      pGravando := True;
      QItemNF.AutoCalcFields := False;
      QSomaItemNota.AutoCalcFields := False;
      QItemNF.DisableControls;
      QItemNF.DisableControls;
      QItemNF.First;            // retirado pelo césar no dia 05/02/2001
      While not QItemNF.Eof do // incluido 11/16/99
       Begin
         QItemNF.Edit;
//        CalculaItem;
//        CalculaICM;
         QItemNF.Post;
         QItemNF.Next;
       End; 
      QItemNF.EnableControls;
//     QItemNF.AutoCalcFields := True;
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
    Except
//     QItemNF.AutoCalcFields := True;
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
      QItemNF.EnableControls;
      QItemNF.EnableControls;
      Raise;
    End;
  End;

  DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value := copy(CbConhecimentoExp.Text, 1, 2);

  inherited;
  DMNotaSaida.QItemNF.EnableControls;
  DMOracle.DBCemapa.Commit;
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo); 
end;

procedure TFNotaSaidaCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaSaidaCad.BtConsTributacaoFreteClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Tributacao_Frete.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
end;

procedure TFNotaSaidaCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFNotaSaidaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False;  // digitacao manual de valores de icms
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
    FNotaSaidaCons.DBGrid2.Columns.Items[1].FieldName := 'DESC_COMPLEMENTO';
  If FNotaSaidaCons.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',QNotaSaidaConsCod_Nota_Cab.Value);
    QNotaSaida.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMCadastro.QCadastro.Open;
  End;

  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
  Bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo); 
end;

procedure TFNotaSaidaCad.BtImpPedClick(Sender: TObject);
Var wTipoNota : String;
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    With DMPedido do
    Begin
      QPedido.Close;
      QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      With DMNotaSaida do
      Begin
        QNotaSaidaCod_Filial.Value := QPedidoCod_Filial.Value;
        QNotaSaidaCod_Operacao.Value := QPedidoCod_Operacao.Value;
        QNotaSaidaCod_Cadastro.Text := QPedidoCod_Cadastro.Text;
        QNotaSaidaCod_Departamento.Value := QPedidoCod_Departamento.Value;
        QNotaSaidaPerc_Comissao.Text := QPedidoPerc_Comissao.Text;
        MePrazo.Text := QPedidoCOD_PRAZO_VENCIMENTO.Text;
        if QPedidoCod_Vendedor.Text <> '' then
          QNotaSaidaCod_Vendedor.Text := QPedidoCod_Vendedor.Text;
        QNotaSaidaObs.Text := QPedidoDesc_Observacao.Text;
        QNotaSaidaObs_Complemento.Text := QPedidoDesc_Complemento_Obs.Text;
        QNotaSaidaVal_Imposto.Text := QPedidoVal_Imposto.Text;
        QNotaSaidaCod_Mensagem.Text := QPedidoCod_Mensagem.Text;
        QNotaSaidaNum_Pedido.Text := QPedidoNum_Pedido.Text;
        wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QPedidoCod_Operacao.Value));
        If wTipoNota = 'F' Then // Nota Fiscal
        begin
           QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Nota.Value;
           QNotaSaidaCOD_SERIE_MODELO.Value :=
            DMParamSistema.QParamSistemaCOD_SERIE_MODELO_NOTA.Value;
        end
        else
        begin
           QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Pedido.Value;
           QNotaSaidaCOD_SERIE_MODELO.Value :=
            DMParamSistema.QParamSistemaCOD_SERIE_MODELO_PEDIDO.Value;
        end;
        If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') Or
           (DmParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL') Then
         Begin
           If QPedidoIND_TIPO_PAGAMENTO.Value = 'A VISTA' Then
              QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
           If QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO' Then
              QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
           If QPedidoIND_TIPO_PAGAMENTO.Value = 'OUTROS' Then
              QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
         End;
      End;
    End;
    PImportaPedidos_Items; // procedure para puxar os itens do pedido
  End;
  FPedidoCons.MeTexto.Enabled := True;
end;

procedure TFNotaSaidaCad.BtConsOCAbertoClick(Sender: TObject);
begin
  inherited;
  If FPedido_ConsAberto = Nil then
    FPedido_ConsAberto := TFPedido_ConsAberto.Create(Application);
  With FPedido_ConsAberto do
  Begin
    METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
    MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
    MEProduto.Text := DMNotaSaida.QItemNFCod_Produto.Text;
    METexto.Enabled := False;
    MEFilial.Enabled := False;
    MEProduto.Enabled := False;
    BtConsCadastro.Enabled := False;
    BtConsFilial.Enabled := False;
    BtConsProduto.Enabled := False;
  End;
  If FPedido_ConsAberto.ShowModal = mrOk then
    MENumPedidoBaixar.Text := DMPedido.QPedidoAbertoCod_Pedido_Item.Text;
  FPedido_ConsAberto := Nil;
end;

procedure TFNotaSaidaCad.BtBaixaOCClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If QNotaSaidaInd_Situacao.Value > '1' Then //Digitada
      Raise Exception.Create('Nota já Confirmada ou Cancelada!');
    Try
      QAtuBaixaPed.Open;
      QAtuBaixaPed.Insert;
      QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QAtuBaixaPedCod_Pedido_Item.Value := StrToInt(Trim(MENumPedidoBaixar.Text));
      QAtuBaixaPedQt_Baixa.Value := StrToFloat(MEQtBaixarOC.Text);
      QAtuBaixaPed.Post;
      QBaixasPed.Close;
      QBaixasPed.Open;
    Except
      If QAtuBaixaPed.State = dsInsert then
        QAtuBaixaPed.Cancel;
      Raise;
    End;
    MENumPedidoBaixar.Text := '';
    MEQtBaixarOC.Text := '';
    QAtuBaixaPed.Close;
  End;
end;

procedure TFNotaSaidaCad.BtCancelaBaixaOCClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If QNotaSaidaInd_Situacao.Value > '1' Then //Digitada
      Raise Exception.Create('Nota já Confirmada ou Cancelada!');

    QAtuBaixaPed.Close;
    QAtuBaixaPed.Open;
    QAtuBaixaPed.First;
    While not QAtuBaixaPed.Eof do
    Begin
      If QAtuBaixaPedCod_Pedido_Item.Value = QBaixasPedCod_Pedido_Item.Value then
        QAtuBaixaPed.Delete;
      QAtuBaixaPed.Next;
    End;
    QBaixasPed.Close;
    QBaixasPed.Open;
    If DMOracle.DBCemapa.InTransaction Then
       DMOracle.DBCemapa.Commit;
  End;
end;

procedure TFNotaSaidaCad.BtImpItemPedClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    With DMPedido do
    Begin
      DMNotaSaida.QBaixasPed.Close;
      QPedido.Close;
      QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      PImportaPedidos_Items;  // procedure para trazer os itens de pedido foi desmembrado porque chama do cabeçalho tb
    End;
  End;
  FPedidoCons.METexto.Enabled := True;
  FPedidoCons.BtConsCadastro.Enabled := True;
  FPedidoCons.MEFilial.Enabled := True;
  FPedidoCons.BtConsFilial.Enabled := True;
end;

procedure TFNotaSaidaCad.DSItemNFStateChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    BtImpItemPed.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtImpItemNota.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtNotaCompra_Cons.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled := QNotaSaida.State = dsEdit;
    BtConsProduto.Enabled := QNotaSaida.State = dsEdit;
    BtConsTributacao.Enabled := QNotaSaida.State = dsEdit;
  End;
end;

procedure TFNotaSaidaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    // ** Pedidos ***
    GBBaixaPed.Enabled := (QNotaSaida.State = dsBrowse) and (QNotaSaidaInd_Situacao.Value <> '2');
    BtConsOCAberto.Enabled := GBBaixaPed.Enabled;
    BtBaixaOC.Enabled := GBBaixaPed.Enabled;
    BtCancelaBaixaOC.Enabled := GBBaixaPed.Enabled;
    // ******
    BtImpPed.Enabled := QNotaSaida.State in [dsEdit,dsInsert];
    SBConsultaFrete.Enabled := Not BtImpPed.Enabled;
    SBImprimeCupomFiscal.Enabled := SBConsultaFrete.Enabled;
    SBGeraContaCorrente.Enabled := SBConsultaFrete.Enabled;
    SBCartaCorrecao.Enabled := SBGeraContaCorrente.Enabled;
    BtImpItemPed.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    BtImpItemNota.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    BtNotaCompra_Cons.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled :=    BtImpPed.Enabled;
    BtConsTributacao.Enabled := BtImpPed.Enabled;
    BtConsCadastro.Enabled := BtImpPed.Enabled;
    BtConsOperacao.Enabled := BtImpPed.Enabled;
    BtConsMensagem.Enabled := BtImpPed.Enabled;
    BtMensagem.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     Begin  // nao permite alterar o departamento depois de incluir itens
       BtConsDepartamento.Enabled := (QNotaSaida.State in [DsInsert]) and (QItemNF.State = dsBrowse);
       DBEdit53.Enabled := (QNotaSaida.State in [DsInsert]) and (QItemNF.State = dsBrowse);
     End
    Else
       BtConsDepartamento.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsVendedorPre.Enabled := BtImpPed.Enabled;
    BtConsFilial.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsProduto.Enabled := btImpPed.Enabled;
    BtParceiro.Enabled := btImpPed.Enabled;
    BtCultura.Enabled := btImpPed.Enabled;
    MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
    If QNotaSaidaInd_Situacao.Value = '1' Then
       LblSituacao.Caption := 'DIGITADA';
    If QNotaSaidaInd_Situacao.Value = '2' Then
       LblSituacao.Caption := 'CONFIRMADA';
    If QNotaSaidaInd_Situacao.Value = '3' Then
       LblSituacao.Caption := 'CANCELADA';
  End;
End;

procedure TFNotaSaidaCad.PCNotaChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If PCNota.ActivePage = TSBaixaPedido then
      QBaixasPed.Open
    Else
      QBaixasPed.Close;
  End;
  If DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'S' Then
     BtImpItemNotaClick(Self);
end;

procedure TFNotaSaidaCad.ConfirmarNota1Click(Sender: TObject);
begin
  inherited;   
  Try
    DMNotaSaida.QNotaSaida.Close;  // esta fechando para verificar se nao tem outro terminal que esta confirmando a mesma nota
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
       Raise Exception.Create('Nota Fiscal já confirmada!');
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
       Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
    If Not DMUsuario.ContabilPrivilegiado Then  // foi colocado aqui - porque deixa-se a nota digitada e depois consulta e confirma a nota
       If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' Then
         if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
           Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');
    if FNotaSaida_Confirma = nil then
       FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
    DMNotaSaida.ChecaNota;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.pConfirmando := True;
    If MePrazo.Text <> '' Then
       FNotaSaida_Confirma.MePrazo.Text := MePrazo.Text;  // prazo que veio dos pedidos
    FNotaSaida_Confirma.MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
    FNotaSaida_Confirma.MEDepartamentoExit(Self);
    FNotaSaida_Confirma.MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
    if Trim(FNotaSaida_Confirma.MEFinalidade.Text) <> '' then
      FNotaSaida_Confirma.EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + FNotaSaida_Confirma.MEFinalidade.Text)
    else
      FNotaSaida_Confirma.EdFinalidade.Text := '';
    FNotaSaida_Confirma.ShowModal;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.pConfirmando := False;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QNotaSaida.EnableControls;
    SBRefreshClick(Self);
  Except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
  FNotaSaida_Confirma.Free;
  FNotaSaida_Confirma:=Nil;
end;

procedure TFNotaSaidaCad.DBECodNotaChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QNotaSaidaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QNotaSaidaInd_Situacao.Value = '3';
    QSomaItemNota.Close;
    QSomaItemNota.Open;
  End;
end;

procedure TFNotaSaidaCad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  if (DMOracle.BuscaNome('SELECT COD_OFICINA_CAB FROM TB_OFICINA_CAB', 'COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '') then
    Raise Exception.Create('Não é possível voltar a confirmação de uma nota gerada por uma OS.');  
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' Then
  Begin
    if FSenha = Nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
      If UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) Then
        Raise Exception.Create('Usuário sem permissão!');
  end;
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' Then
       If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
          Raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  Try
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    DMNotaSaida.VoltaConfirmacao;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    DMOracle.Audit( TOracleDataset1 (DMNotaSaida.QNotaSaida ), 'Volta Confirmacao' );
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    raise;
  End;
end;

procedure TFNotaSaidaCad.CancelarNota1Click(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
     Raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
     Raise Exception.Create('Esta Nota Fiscal já está cancelada!');
  If DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' Then
     raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
  If FNotaSaida_Cancela = Nil then
     FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
  If FNotaSaida_Cancela.ShowModal = MrOk Then
   Begin
     If DMOperacao.QOperacaoIND_CUPOM_FISCAL.Value = 'S' Then
     Begin
       if FImpressoraFiscal = nil then
          FImpressoraFiscal:= TFImpressoraFiscal.Create(Application);
       If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
          FImpressoraFiscal.Y8000ECF('1E')
       Else
        Begin
          iRetorno := Bematech_FI_CancelaCupom();
          FImpressoraFiscal.Analisa_iRetorno();
          FImpressoraFiscal.Retorno_Impressora();
        End;
     End;
   End;
//  SBRefreshClick(Self);
end;

procedure TFNotaSaidaCad.VoltaCancelamento1Click(Sender: TObject);
begin
  inherited;
  DMNotaSaida.VoltaCancelamento;
end;

procedure TFNotaSaidaCad.RelaodeNotas1Click(Sender: TObject);
begin
  inherited;
  If FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FNotaEntradaParam.ShowModal = MrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text),'VENDA');
    QRelacao.Close;
    If Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text) = '' then
      QRelacao.SetVariable('FILIAL',Null)
    Else
      QRelacao.SetVariable('FILIAL',FNotaEntradaParam.FmFilial1.MeFilial.Text);

    QRelacao.SetVariable('ENTRADA_SAIDA','S');
    if FNotaEntradaParam.ME0DataI.Text <> '' then
      QRelacao.SetVariable('DATA_I',FNotaEntradaParam.ME0DataI.Text)
    else
      QRelacao.SetVariable('DATA_I',null);
    if FNotaEntradaParam.ME0DataF.Text <> '' then
      QRelacao.SetVariable('DATA_F',FNotaEntradaParam.ME0DataF.Text)
    else
      QRelacao.SetVariable('DATA_F',null);

    Case FNotaEntradaParam.RG0TipoNota.ItemIndex of
      0 : QRelacao.SetVariable('SITUACAO',Null);
      1 : QRelacao.SetVariable('SITUACAO','1');
      2 : QRelacao.SetVariable('SITUACAO','2');
      3 : QRelacao.SetVariable('SITUACAO','3');
    End;
    Case FNotaEntradaParam.Rg1TipoPagto.ItemIndex of
      0 : QRelacao.SetVariable('TIPO_PAGTO','1');
      1 : QRelacao.SetVariable('TIPO_PAGTO','2');
      2 : QRelacao.SetVariable('TIPO_PAGTO','3');
      3 : QRelacao.SetVariable('TIPO_PAGTO',Null);
     End;

     //Frames-----------------
     If Trim(FNotaEntradaParam.FmCadastro1.MeCadastro.Text)= ''   then
       QRelacao.SetVariable('CADASTRO',Null)
     Else
       QRelacao.SetVariable('CADASTRO',FNotaEntradaParam.FmCadastro1.MeCadastro.Text);

    // If Trim(FNotaEntradaParam.FmCadastroParceiro1.MeCadastro.Text)= ''   then
       QRelacao.SetVariable('COD_CADASTRO_PARCEIRO',Null);
    // Else
    //   QRelacao.SetVariable('COD_CADASTRO_PARCEIRO',FNotaEntradaParam.FmCadastroParceiro1.MeCadastro.Text);

     If Trim(FNotaEntradaParam.MeCodVendedor.Text)= ''   then
      QRelacao.SetVariable('VENDEDOR',Null)
     Else
      QRelacao.SetVariable('VENDEDOR',Trim(FNotaEntradaParam.MeCodVendedor.Text));

    //Permitir várias operaçãoes separados por vírgula. Solicitado: Rubens(Kreuz). Junior-08/05/2015.
      if Trim(FNotaEntradaParam.ME1Operacao.Text) <> '' then
      begin
        QRelacao.SetVariable('OPERACAO', 'TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaEntradaParam.ME1Operacao.Text))+')');
      end
      else
        QRelacao.SetVariable('OPERACAO', '1=1');

    If Trim(FNotaEntradaParam.FmDepartamento1.MeDepartamento.Text)= ''   then
      QRelacao.SetVariable('DEPARTAMENTO',Null)
    Else
      QRelacao.SetVariable('DEPARTAMENTO',Trim(FNotaEntradaParam.FmDepartamento1.MeDepartamento.Text));

    If Trim(FNotaEntradaParam.FmMotivo1.MeMotivo.Text)= ''   then
      QRelacao.SetVariable('MOTIVO',Null)
    Else
      QRelacao.SetVariable('MOTIVO',Trim(FNotaEntradaParam.FmMotivo1.MeMotivo.Text));

    If Trim(FNotaEntradaParam.FmSerie1.MeSerie.Text)= ''   then
      QRelacao.SetVariable('COD_SERIE',Null)
    Else
      QRelacao.SetVariable('COD_SERIE',Trim(FNotaEntradaParam.FmSerie1.MeSerie.Text));

    If Trim(FNotaEntradaParam.FmTributacao1.MeTributacao.Text)= ''   then
      QRelacao.SetVariable('COD_TRIBUTACAO',Null)
    Else
      QRelacao.SetVariable('COD_TRIBUTACAO',Trim(FNotaEntradaParam.FmTributacao1.MeTributacao.Text));

    If Trim(FNotaEntradaParam.FmEstado1.MeEstado.Text)= ''   then
      QRelacao.SetVariable('ESTADO',Null)
    Else
      QRelacao.SetVariable('ESTADO',Trim(FNotaEntradaParam.FmEstado1.MeEstado.Text));

    If Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text)= ''   then
      QRelacao.SetVariable('COD_PRODUTO',Null)
     Else
      QRelacao.SetVariable('COD_PRODUTO',Trim(FNotaEntradaParam.FmProduto1.MeProduto.Text));

    If Trim(FNotaEntradaParam.Me0Classe.Text)= ''   then
      QRelacao.SetVariable('CLASSE',Null)
     Else
      QRelacao.SetVariable('CLASSE',Trim(FNotaEntradaParam.Me0Classe.Text));

    If Trim(FNotaEntradaParam.Me0SubClasse.Text)= ''   then
      QRelacao.SetVariable('SUBCLASSE',Null)
     Else
      QRelacao.SetVariable('SUBCLASSE',Trim(FNotaEntradaParam.Me0SubClasse.Text));

    Case FNotaEntradaParam.CB0Ordem.ItemIndex of
      0 : QRelacao.SQL.Add('ORDER BY NOME');
      1 : QRelacao.SQL.Add('ORDER BY DT_RECEBIMENTO');
      2 : QRelacao.SQL.Add('ORDER BY NUM_NOTA,TB_NOTA_CAB.DT_EMISSAO,TB_NOTA_CAB.NUM_PEDIDO');
      Else
        Raise Exception.Create('Nenhuma Ordem Selecionada!');
    End; // Case
    //-----------------------------
    
    QRelacao.Open;
    If FRNotasES_Relacao = Nil then
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
    FRNotasES_Relacao.QRLTitulo.Caption := 'Relação de Notas de Saida de '+ FNotaEntradaParam.ME0DataI.Text  + ' ate ' +FNotaEntradaParam.ME0DataF.Text;
    FRNotasES_Relacao.QRLFilial.Caption := 'Filial:' +Trim(FNotaEntradaParam.FmFilial1.EdFilial.Text) + ' - ' + FNotaEntradaParam.FmFilial1.EdFilial.Text;
    FRNotasES_Relacao.QRLDepartamento.Caption := 'Departamento:' +Trim(FNotaEntradaParam.FmDepartamento1.MeDepartamento.Text);
    FRNotasES_Relacao.QRLMotivo.Caption := 'Motivo:' +Trim(FNotaEntradaParam.FmMotivo1.EdMotivo.Text);
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNotasES_Relacao.QRPrimario.Preview
    Else
      FRNotasES_Relacao.QRPrimario.Print;
    QRelacao.Close;
    QRelacao.SQL[QRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
  End;
end;

procedure TFNotaSaidaCad.Conferncia1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[1].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text),'VENDA');
    QConferencia.Close;
    QConferencia.SetVariable('ENTRADA_SAIDA','S');
    If Trim(FNotaEntradaParam.ME1DataI.Text) <> '' Then
      QConferencia.SetVariable('DATA_I',FNotaEntradaParam.ME1DataI.Text);
    If Trim(FNotaEntradaParam.ME1DataF.Text) <> '' Then
      QConferencia.SetVariable('DATA_F',FNotaEntradaParam.ME1DataF.Text);

    if Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text) = '' then
      QConferencia.SetVariable('FILIAL',Null)
    else
      QConferencia.SetVariable('FILIAL',Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text));

    if Trim(FNotaEntradaParam.FmCadastro2.MeCadastro.Text) = '' then
      QConferencia.SetVariable('CADASTRO',Null)
    else
      QConferencia.SetVariable('CADASTRO',Trim(FNotaEntradaParam.FmCadastro2.MeCadastro.Text));

    if Trim(FNotaEntradaParam.FmOperacao2.MeOperacao.Text) = '' then
      QConferencia.SetVariable('OPERACAO',Null)
    else
      QConferencia.SetVariable('OPERACAO',Trim(FNotaEntradaParam.FmOperacao2.MeOperacao.Text));
    Case FNotaEntradaParam.RG1TipoNota.ItemIndex of
      0 : QConferencia.SetVariable('SITUACAO',Null);
      1 : QConferencia.SetVariable('SITUACAO','1');
      2 : QConferencia.SetVariable('SITUACAO','2');
      3 : QConferencia.SetVariable('SITUACAO','3');
    End;
    Case FNotaEntradaParam.Cb1Ordem.ItemIndex of
      0 : QConferencia.SQL.Add('ORDER BY NOME_FORNECEDOR');
      1 : QConferencia.SQL.Add('ORDER BY TB_NOTA_CAB.DT_RECEBIMENTO');
      2 : QConferencia.SQL.Add('ORDER BY TB_NOTA_CAB.NUM_NOTA');
      Else
        Raise Exception.Create('Nenhuma Ordem Selecionada!');
    End; // Case

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
    FRNotasES_Conferencia.QRLTitulo.Caption := 'Rel. de Conferência de Notas de Saida';
    FRNotasES_Conferencia.pValTotal := 0;
    FRNotasES_Conferencia.pValIPITotal := 0;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
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
    QConferencia.SQL[QConferencia.SQL.Count-1]:='';  // elimina a última Linha da SQL
  end;
end;

procedure TFNotaSaidaCad.Futura1Click(Sender: TObject);
Var wNomeRelatorio : String;
begin
  inherited;
  If FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FNotaEntradaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRFutura.Close;
    QRFutura.Sql.Clear;
    QRFutura.Sql.Add('SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,');
    QRFutura.Sql.Add('Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.DESC_PRODUTO,Tb_nota_cab.NUM_NOTA,');
    QRFutura.Sql.Add('Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,Tb_nota_cab.COD_SERIE,TB_NOTA_ITEM.COD_LOTE_TIPO,');
    QRFutura.Sql.Add('DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,');
    QRFutura.Sql.Add('Tb_nota_item.VAL_UNITARIO,Tb_nota_cab.VAL_FUNRURAL  ');
    QRFutura.Sql.Add('FROM TB_NOTA_ITEM,TB_NOTA_CAB,TB_NOTA_AUX,TB_PRODUTO,TB_CLASSE ');
    QRFutura.Sql.Add(' WHERE Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ');
    QRFutura.Sql.Add(' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ');
    QRFutura.Sql.Add(' Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO  AND ');
    QRFutura.Sql.Add(' QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ');
    QRFutura.Sql.Add(' TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE  AND ');
    Case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
       0 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'COM_FUT' + Chr(39));
             wNomeRelatorio := 'Rel. Notas de Compra Futura';
           End;
       1 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'VEN_FUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Venda Futura';
           End;
       2 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
           End;
       3 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
           End;
       4 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
           End;
       5 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
           End;
       6 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_EMP' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
           End;
       7 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_OUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito Outras Empresas';
           End;
       Else
         Raise Exception.Create('Nenhum tipo de Futura selecionado!');
    End;
    If Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text));
    If Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text));
    If Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text));
    If Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text));
    If Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text));
    If Trim(FNotaEntradaParam.ME2DataI.Text) <> '' Then
       QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39));
    If Trim(FNotaEntradaParam.ME2DataF.Text) <> '' Then
       QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39));
    If Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) <> '' then
       QRFutura.Sql.Add(' And TB_CLASSE.NUM_CLASSE = ' + Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text));
    If Trim(FNotaEntradaParam.ME2SubClasse.Text) <> '' then
       QRFutura.Sql.Add(' And TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FNotaEntradaParam.ME2SubClasse.Text));
    //if (Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) <> '') then
    //   QRFutura.SQL.Add(' and (TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) +
    //   ' OR TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) + ')');
    QRFutura.Sql.Add(' ORDER BY DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_produto.DESC_PRODUTO');
    QRFutura.Open;
    If FRNotasES_Futura = Nil then
      FRNotasES_Futura := TFRNotasES_Futura.Create(Application);
    FRNotasES_Futura.QRLTitulo.Caption := wNomeRelatorio;
    FRNotasES_Futura.QRLFilial.Caption := 'Filial:'+Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) + ' - ' + Trim(FNotaEntradaParam.FmFilial3.EdFilial.Text);
    FRNotasES_Futura.QRLVendedor.Caption := 'Vendedor:'+Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text) + ' De ' + FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
    FRNotasES_Futura.QRLClasse.Caption := 'Classe:'+Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) + ' SubClasse: ' + FNotaEntradaParam.Ed2SubClasse.Text;
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
       FRNotasES_Futura.QRPrimario.Preview
    Else
       FRNotasES_Futura.QRPrimario.Print;
    QRFutura.Close;
  End;
end;

procedure TFNotaSaidaCad.MovEstoque1Click(Sender: TObject);
Var
  wstrS : String;
begin
  inherited;
  If FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[3].TabVisible := True;
  If FNotaEntradaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text),'VENDA');
    QRMovEstoque.Close;
    QRMovEstoque.SetVariable('DATA_I',FNotaEntradaParam.ME3DataI.Text);
    QRMovEstoque.SetVariable('DATA_F',FNotaEntradaParam.ME3DataF.Text);
    If Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text ) = '' then
      QRMovEstoque.SetVariable('FILIAL',Null)
    Else
      QRMovEstoque.SetVariable('FILIAL',FNotaEntradaParam.FmFilial4.MeFilial.Text);
      
    If Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) = '' then
      QRMovEstoque.SetVariable('CADASTRO',Null)
    Else
      QRMovEstoque.SetVariable('CADASTRO',Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text));

    //If Trim(FNotaEntradaParam.FmCadastroArmazem4.MeCadastro.Text) = '' then
    //  QRMovEstoque.SetVariable('COD_ARMAZEM_ALFANDEGADO',Null)
    //Else
    //  QRMovEstoque.SetVariable('COD_ARMAZEM_ALFANDEGADO',Trim(FNotaEntradaParam.FmCadastroArmazem4.MeCadastro.Text));

    If Trim(FNotaEntradaParam.FmFornecedor4.MeCadastro.Text) = '' then
      QRMovEstoque.SetVariable('FORNECEDOR',Null)
    Else
      QRMovEstoque.SetVariable('FORNECEDOR', Trim(FNotaEntradaParam.FmFornecedor4.MeCadastro.Text));

    if Trim(FNotaEntradaParam.Fm3Classe.MeClasse.Text) = '' then
      QRMovEstoque.SetVariable('CLASSE',Null)
    else
      QRMovEstoque.SetVariable('CLASSE',Trim(FNotaEntradaParam.Fm3Classe.MeClasse.Text));

    //if Trim(FNotaEntradaParam.ME3SubClasse.Text) = '' then
    //  QRMovEstoque.SetVariable('SUB_CLASSE',Null)
    //else
    //  QRMovEstoque.SetVariable('SUB_CLASSE',FNotaEntradaParam.Me3SubClasse.Text);

    //If Trim(FNotaEntradaParam.ME3CadastroParceiro.Text) = '' then
    // QRMovEstoque.SetVariable('CADASTRO_PARCEIRO','1 = 1')
    //Else
      //If Trim(FNotaEntradaParam.ME3CadastroParceiro.Text) = '0' then
      //  QRMovEstoque.SetVariable('CADASTRO_PARCEIRO',' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO is null')
      //Else
      //  QRMovEstoque.SetVariable('CADASTRO_PARCEIRO',' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = '+FNotaEntradaParam.ME3CadastroParceiro.Text); Comentei pois estava dando erro ao complilar. Vanessa 31/03/2016

    If Trim(FNotaEntradaParam.FmProduto4.MeProduto.Text) = '' then
      QRMovEstoque.SetVariable('PRODUTO',Null)
    Else
      QRMovEstoque.SetVariable('PRODUTO',FNotaEntradaParam.FmProduto4.MeProduto.Text);
    If Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) = '' then
      QRMovEstoque.SetVariable('VENDEDOR',Null)
    Else
      QRMovEstoque.SetVariable('VENDEDOR',FNotaEntradaParam.FmVendedor4.MeVendedor.Text);

    If Trim(FNotaEntradaParam.ME3CodContratoVenda.Text) = '' then
      QRMovEstoque.SetVariable('COD_CONTRATO_VEND',Null)
    Else
      QRMovEstoque.SetVariable('COD_CONTRATO_VEND',StrToInt(Trim(FNotaEntradaParam.ME3CodContratoVenda.Text)));

    If Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text) = '' then
     Begin
       QRMovEstoque.SetVariable('COD_OPERACAO',Null);
       QRMovEstoque.SetVariable('IND_ESTOQUE','S');
     End
    Else
     Begin
       QRMovEstoque.SetVariable('COD_OPERACAO',Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text));
       QRMovEstoque.SetVariable('IND_ESTOQUE',Null);
     End;
    If Trim(FNotaEntradaParam.FmLote4.MeLote.Text) = '' then
      QRMovEstoque.SetVariable('LOTE',Null)
    Else
      QRMovEstoque.SetVariable('LOTE',FNotaEntradaParam.FmLote4.MeLote.Text);

    if FNotaEntradaParam.me3dco.text <> '  -   .    - ' then
      QRMovEstoque.SetVariable('NUM_DCO', FNotaEntradaParam.me3dco.text)
    else
      QRMovEstoque.SetVariable('NUM_DCO', null);

    Case FNotaEntradaParam.RG3Tipo.ItemIndex of
      0 : QRMovEstoque.SetVariable('TIPO_NOTA','E');
      1 : QRMovEstoque.SetVariable('TIPO_NOTA','S');
      2 : QRMovEstoque.SetVariable('TIPO_NOTA',Null);
    End; // Case
    Case FNotaEntradaParam.RG3TipoProduto.ItemIndex of
      0 : QRMovEstoque.SetVariable('TIPO_PRODUTO','INDUSTRIAL');
      1 : QRMovEstoque.SetVariable('TIPO_PRODUTO','COMERCIAL');
      2 : QRMovEstoque.SetVariable('TIPO_PRODUTO',Null);
    End; // Case
    Case FNotaEntradaParam.RG3ValorDeCusto.ItemIndex of
      0 : QRMovEstoque.SetVariable('IND_MOSTRA_VAL_CUSTO','SIM');
      1 : QRMovEstoque.SetVariable('IND_MOSTRA_VAL_CUSTO','NAO');
    end;
    Case FNotaEntradaParam.Rg3TipoPessoa.ItemIndex of
      0 : QRMovEstoque.SetVariable('IND_FISICA_JURIDICA','F');
      1 : QRMovEstoque.SetVariable('IND_FISICA_JURIDICA','J');
      2 : QRMovEstoque.SetVariable('IND_FISICA_JURIDICA',Null);
    End; // Case
    Case FNotaEntradaParam.CB3Ordem.ItemIndex of
     -1 : QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO, NUM_NOTA');
      0 : QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO, NUM_NOTA');
      1 : QRMovEstoque.SQL.Add('ORDER BY DT_RECEBIMENTO');
      2 : QRMovEstoque.SQL.Add('ORDER BY DESC_PRODUTO,DT_EMISSAO, NUM_NOTA');
      3 : QRMovEstoque.SQL.Add('ORDER BY COD_OPERACAO,DT_EMISSAO, NUM_NOTA');
    End; // Case


    If Trim(FNotaEntradaParam.ME3Serie.Text) = '' then
      QRMovEstoque.SetVariable('SERIE',Null)
    Else
      QRMovEstoque.SetVariable('SERIE',FNotaEntradaParam.ME3Serie.Text);
    QRMovEstoque.Open;
    If FRNotasES_MovEstoque = Nil then
      FRNotasES_MovEstoque := TFRNotasES_MovEstoque.Create(Application);
    wstrS := 'Cliente: Todos - ';
    If Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) <> '' then
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
    begin
      FRNotasES_MovEstoque.QRLDCO.Enabled := true;
      FRNotasES_MovEstoque.QRLDCO.caption := 'DCO : ' + FNotaEntradaParam.me3DCO.Text;
    end
    else
    begin
      FRNotasES_MovEstoque.QRLDCO.Enabled := false;
      FRNotasES_MovEstoque.QRLDCO.caption := 'DCO : ';
    end;

    If(Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text)<>'')Then
      FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: ' + Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) + ' ' + FNotaEntradaParam.FmFilial4.EdFilial.Text
    Else
      FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: Todas';
    wstrS := '';
    //If Trim(FNotaEntradaParam.ME3CadastroParceiro.Text) <> '' then
    // wstrS := 'Parceiro: '+Trim(FNotaEntradaParam.ME3CadastroParceiro.Text)+ ' - '+
    //           DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(FNotaEntradaParam.ME3CadastroParceiro.Text))
    //else
    //  wstrS :='Parceiro: Todos'; Comentei pois estava dando erro ao complilar. Vanessa 31/03/2016
    If Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) <> '' then
      wstrS := wstrS + ' - Vendedor: ' + Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaEntradaParam.FmVendedor4.EdVendedor.Text)
    Else
      wstrS := wstrS + ' - Vendedor: Todos';
    FRNotasES_MovEstoque.QRLParceiro.Caption := wstrS;

    IF FNotaEntradaParam.RG3ValorDeCusto.ItemIndex = 0 THEN
      FRNotasES_MovEstoque.QRLabel14.Caption := 'Custo'
    else
      FRNotasES_MovEstoque.QRLabel14.Caption := 'Vl.Un.';

    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNotasES_MovEstoque.QRPrimario.Preview
    Else
      FRNotasES_MovEstoque.QRPrimario.Print;
    QRMovEstoque.SQL[QRMovEstoque.SQL.Count-1]:='';  // elimina a última Linha da SQL
    QRMovEstoque.Close;
  End;
end;

procedure TFNotaSaidaCad.Emisso1Click(Sender: TObject);
begin
  inherited;
  If FImprimirNota = Nil then
    FImprimirNota := TFImprimirNota.Create(Application);
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MINIMART') OR
       (FImprimirNota.ShowModal = MrOk) Then
    FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
//    wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_NOTA_CAB',
//                    'TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
//                   +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
//    if wTipoDocumento = 'F' then
//    begin
//      if wTipoNota = 'ELETRONICA' then
//        wChaveAcesso := NfeImpressao.GeraXML(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)
//      else
//      begin
//        if wTipoNota = 'AMBAS' then
//        begin
//          if FTipoNota = Nil then
//            FTipoNota := TFTipoNota.Create(Application);
//          FTipoNota.ShowModal;
//          wTipoNota := FTipoNota.TipoNota;
//          if wTipoNota = 'NORMAL' then
//            FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)
//          else
//            wChaveAcesso := NfeImpressao.GeraXML(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
//        end
//        else
//        begin
//          wTipoNota := 'NORMAL';
//          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
//        end;
//      end;
//    end
//    else
//    begin
//      wTipoNota := 'NORMAL';
//      FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
//    end;
//  end;
//  if wChaveAcesso <> '' then
//  begin
//    try
//      With DMOracle do
//      Begin
//        QExecSQL.Close;
//        QExecSQL.SQL.Clear;
//        wComando := 'UPDATE TB_NOTA_CAB SET DESC_CHAVE_ACESSO = ' + QuotedStr(wChaveAcesso)
//          +' WHERE COD_NOTA_CAB = ' + IntToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
//        QExecSQL.SQL.Add(wComando);
//        QExecSQL.ExecSQL;
//        If DMOracle.DBCemapa.InTransaction then
//           DMOracle.DBCemapa.Commit;
//      End;
//    except
//      DMOracle.DBCemapa.Rollback;
//    end;
//  end;
End;

procedure TFNotaSaidaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if PCNota.ActivePage.Name <> 'TSGeral' then
    PCNota.ActivePage := TSCabecalho;
  MePrazo.Clear;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
     BtImpPedClick(Self)
  Else
     BtConsCadastroClick(Self)
end;

procedure TFNotaSaidaCad.Comisses1Click(Sender: TObject);
Var wTipoComissao : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text),'VENDA');
    wTipoComissao := DMParamSistema.QParamSistemaIND_TIPO_COMISSAO.Value;
    if (wTipoComissao <> '7') And (wTipoComissao <> '9') And (wTipoComissao <> 'A') Then
       DMNotaSaida.AtualizaComissao(StrToDate(FNotaSaidaParam.ME0DataI.Text));
    QRComissao.Close;
    QRComissao.SetVariable('DATA_I',FNotaSaidaParam.ME0DataI.Text);
    QRComissao.SetVariable('DATA_F',FNotaSaidaParam.ME0DataF.Text);
    if Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text)= ''   then
      QRComissao.SetVariable('FILIAL',Null)
    else
      QRComissao.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial1.MeFilial.Text));
    if Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text)= ''   then
      QRComissao.SetVariable('VENDEDOR',Null)
    else
      QRComissao.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor1.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmVendedorPreposto1.MeVendedor.Text)= ''   then
      QRComissao.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
      QRComissao.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto1.MeVendedor.Text));
    if Trim(FNotaSaidaParam.Ed0Serie.Text)= ''   then
      QRComissao.SetVariable('SERIE',Null)
    else
      QRComissao.SetVariable('SERIE',Trim(FNotaSaidaParam.Ed0Serie.Text));
    if Trim(FNotaSaidaParam.Ed0Serie1.Text)= ''   then
      QRComissao.SetVariable('SERIE1',Null)
    else
      QRComissao.SetVariable('SERIE1',Trim(FNotaSaidaParam.Ed0Serie1.Text));
    if FNotaSaidaParam.RGCondicaoPagto.ItemIndex <> 3 then
      QRComissao.SetVariable('IND_CONDICAO_PAGTO',FNotaSaidaParam.RGCondicaoPagto.ItemIndex +1);
    if Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text)= ''   then
      QRComissao.SetVariable('SUPERVISOR',Null)
    else
      QRComissao.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text));

    Case FNotaSaidaParam.CB0TipoProduto.ItemIndex of
        0 : QRComissao.SetVariable('TIPO_PRODUTO',NULL);
        1 : QRComissao.SetVariable('TIPO_PRODUTO','INDUSTRIAL');
        2 : QRComissao.SetVariable('TIPO_PRODUTO','COMERCIAL');
        3 : QRComissao.SetVariable('TIPO_PRODUTO','AGRICOLA');
        4 : QRComissao.SetVariable('TIPO_PRODUTO','SERVIÇO');
        5 : QRComissao.SetVariable('TIPO_PRODUTO','PEÇA');
    End;

    case FNotaSaidaParam.cbOrdem.ItemIndex of
        0: QRComissao.SetVariable('ORDEM','TB_NOTA_CAB.DT_EMISSAO');
        1: QRComissao.SetVariable('ORDEM','NOME_VENDEDOR');
    end;

    QRComissao.Open;
    if FRNota_Comissao = Nil then
      FRNota_Comissao := TFRNota_Comissao.Create(Application);
    if FNotaSaidaParam.RG0TipoRelatorio.ItemIndex = 0 Then
       FRNota_Comissao.pTipoRelatorio := 'ANALITICO'
    else
       FRNota_Comissao.pTipoRelatorio := 'SINTETICO';
    FRNota_Comissao.QRlTitulo.Caption := 'Comissao de Clientes de ' + FNotaSaidaParam.ME0DataI.Text + ' Ate ' + FNotaSaidaParam.ME0DataF.Text;
    FRNota_Comissao.QRlSupervisor.Caption := 'Supervisor: ' + Trim(FNotaSaidaParam.FmSupervisor1.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmSupervisor1.EdVendedor.Text);
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_Comissao.QRPrimario.Preview
    else
       FRNota_Comissao.QRPrimario.Print;
    QRComissao.Close;
  end;
  If DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.Commit;
end;

procedure TFNotaSaidaCad.MapadeVendas1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[1].TabVisible := True;
  If (not DMUsuario.Privilegiado) And  // serve para o vendedor somente conseguir tirar o relatorio de suas vendas
     (DMusuario.CodVendedorPadrao <> 0) Then
     Begin
       FNotaSaidaParam.FmVendedor2.MeVendedor.Enabled := False;
       FNotaSaidaParam.FmVendedor2.BtVendedor.Enabled := False;
       FNotaSaidaParam.FmVendedor2.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text),'VENDA');
    If FNotaSaidaParam.RGTipo.ItemIndex = 1 then  // Analítico
    Begin
      QRMapaVenda.Close;
      QRMapaVenda.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVenda.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text)= ''   then
         QRMapaVenda.SetVariable('FILIAL',Null)
      else
         QRMapaVenda.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text)= ''   then
        QRMapaVenda.SetVariable('VENDEDOR',Null)
      else
        QRMapaVenda.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text)= ''   then
        QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO',Null)
      else
        QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text)= ''   then
        QRMapaVenda.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVenda.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text)= ''   then
        QRMapaVenda.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVenda.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text)= ''   then
        QRMapaVenda.SetVariable('COD_CADASTRO',Null)
      else
        QRMapaVenda.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text)= ''   then
        QRMapaVenda.SetVariable('COD_CULTURA',Null)
      else
        QRMapaVenda.SetVariable('COD_CULTURA',Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
      if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text)= ''   then
        QRMapaVenda.SetVariable('ESTADO',Null)
      else
        QRMapaVenda.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
      if Trim(FNotaSaidaParam.Me1Classe.Text)= ''   then
        QRMapaVenda.SetVariable('COD_CLASSE',Null)
      else
        QRMapaVenda.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.Me1Classe.Text));
      if Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' then
      begin
        QRMapaVenda.SetVariable('OPERACAO',Null);
        QRMapaVenda.SetVariable('COD_OPERACAO',Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text));
      end
      else
      begin
        QRMapaVenda.SetVariable('OPERACAO','V');
        QRMapaVenda.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVenda.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVenda.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVenda.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVenda.SetVariable('TIPO_PAGTO',Null);
      End;
      if Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text)= ''   then
        QRMapaVenda.SetVariable('DEPARTAMENTO',Null)
      else
        QRMapaVenda.SetVariable('DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text));
      if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 Then
         QRMapaVenda.SetVariable('TIPO_QUEBRA','F')
      else
         QRMapaVenda.SetVariable('TIPO_QUEBRA','V');
      QRMapaVenda.SQL[QRMapaVenda.SQL.Count-1]:='';  // elimina a última Linha da SQL
      If FNotaSaidaParam.Cb1Ordem.ItemIndex = 0 Then
         QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,TO_CHAR(DT_EMISSAO,'+Chr(39)+'DD/MM'+Chr(39)+'),COD_PRODUTO')
      Else
         QRMapaVenda.Sql.Add(' ORDER BY COD_FILIAL,TO_CHAR(DT_EMISSAO,'+Chr(39)+'DD/MM'+Chr(39)+'),DESC_PRODUTO');

      QRMapaVenda.Open;
      If FRNota_MapaVenda = Nil then
        FRNota_MapaVenda := TFRNota_MapaVenda.Create(Application);
      if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 Then
         FRNota_MapaVenda.QRLabel3.Caption := 'Filial:'
      Else
         FRNota_MapaVenda.QRLabel3.Caption := 'Vendedor:';   
      FRNota_MapaVenda.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      if Trim(FNotaSaidaParam.FmVendedor2.EdVendedor.Text) <> '' Then
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: '+FNotaSaidaParam.FmVendedor2.EdVendedor.Text+' '
      else
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Rep.Comercial: Todos  ';
      FRNota_MapaVenda.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.FmFornecedor2.EdCadastro.Text+' Cliente:'+FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
      if Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' Then
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := FRNota_MapaVenda.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.FmOperacao2.EdOperacao.Text+' '
      else
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := FRNota_MapaVenda.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';
      FRNota_MapaVenda.QRLDepartamento.Caption := 'Departamento :'+FNotaSaidaParam.FmDepartamento1.EdDepartamento.Text ;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
         FRNota_MapaVenda.QRPrimario.Preview
      else
         FRNota_MapaVenda.QRPrimario.Print;
      QRMapaVenda.Close;
    end
    else // **** Resumido
    begin
      QRMapaVendaRes.Close;
      QRMapaVendaRes.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVendaRes.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      If Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text)= ''   then
        QRMapaVendaRes.SetVariable('FILIAL',Null)
      Else
        QRMapaVendaRes.SetVariable('FILIAL',FNotaSaidaParam.FmFilial2.MeFilial.Text);

      If Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text)= ''   then
        QRMapaVendaRes.SetVariable('VENDEDOR',Null)
      Else
        QRMapaVendaRes.SetVariable('VENDEDOR',FNotaSaidaParam.FmVendedor2.MeVendedor.Text);
      If Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text)= ''   then
        QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO',Null)
      Else
        QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text)= ''   then
        QRMapaVendaRes.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVendaRes.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text)= ''   then
        QRMapaVendaRes.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVendaRes.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text)= ''   then
        QRMapaVendaRes.SetVariable('COD_CADASTRO',Null)
      else
        QRMapaVendaRes.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text)= ''   then
        QRMapaVendaRes.SetVariable('COD_CULTURA',Null)
      else
        QRMapaVendaRes.SetVariable('COD_CULTURA',Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
      if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text)= ''   then
        QRMapaVendaRes.SetVariable('ESTADO',Null)
      else
        QRMapaVendaRes.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
      if Trim(FNotaSaidaParam.Me1Classe.Text)= ''   then
        QRMapaVendaRes.SetVariable('COD_CLASSE',Null)
      else
        QRMapaVendaRes.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.Me1Classe.Text));
      If Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' then
       Begin
        QRMapaVendaRes.SetVariable('OPERACAO',Null);
        QRMapaVendaRes.SetVariable('COD_OPERACAO',FNotaSaidaParam.FmOperacao2.MeOperacao.Text);
       end
      else
      begin
        QRMapaVendaRes.SetVariable('OPERACAO','V');
        QRMapaVendaRes.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVendaRes.SetVariable('TIPO_PAGTO',Null);
      End;
      if Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text)= ''   then
        QRMapaVendaRes.SetVariable('DEPARTAMENTO',Null)
      else
        QRMapaVendaRes.SetVariable('DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento1.MeDepartamento.Text));
      if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 Then
         QRMapaVendaRes.SetVariable('TIPO_QUEBRA','F')
      else
         QRMapaVendaRes.SetVariable('TIPO_QUEBRA','V');
      QRMapaVendaRes.SQL[QRMapaVendaRes.SQL.Count-1]:='';  // elimina a última Linha da SQL
      If FNotaSaidaParam.Cb1Ordem.ItemIndex = 0 Then
         QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,COD_PRODUTO')
      Else
         QRMapaVendaRes.Sql.Add(' ORDER BY COD_FILIAL,DESC_PRODUTO');

      QRMapaVendaRes.Open;
      if FRNota_MapaVendaRes = Nil then
        FRNota_MapaVendaRes := TFRNota_MapaVendaRes.Create(Application);
      if FNotaSaidaParam.MeTipoQuebra.ItemIndex = 0 Then
         FRNota_MapaVendaRes.QRLabel3.Caption := 'Filial:'
      Else
         FRNota_MapaVendaRes.QRLabel3.Caption := 'Vendedor:';
      FRNota_MapaVendaRes.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := 'Rep.Comercial: '+FNotaSaidaParam.FmVendedor2.EdVendedor.Text+' ';
      FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.FmOperacao2.EdOperacao.Text+' ';
      FRNota_MapaVendaRes.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.FmFornecedor2.EdCadastro.Text+' Cliente:'+FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
      FRNota_MapaVendaRes.QRLDepartamento.Caption := 'Departamento :'+FNotaSaidaParam.FmDepartamento1.EdDepartamento.Text ;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_MapaVendaRes.QRPrimario.Preview
      else
        FRNota_MapaVendaRes.QRPrimario.Print;
      QRMapaVendaRes.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.VendedoreCondPgto1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRVendedorPgto.Close;
    QRVendedorPgto.SetVariable('DATA_I',FNotaSaidaParam.ME2DataI.Text);
    QRVendedorPgto.SetVariable('DATA_F',FNotaSaidaParam.ME2DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text)= ''   then
      QRVendedorPgto.SetVariable('FILIAL',Null)
    Else
      QRVendedorPgto.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmVendedor3.MeVendedor.Text)= ''   then
      QRVendedorPgto.SetVariable('VENDEDOR',Null)
    Else
      QRVendedorPgto.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor3.MeVendedor.Text));
    If Trim(FNotaSaidaParam.FmVendedorPreposto3.MeVendedor.Text)= ''   then
      QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto3.MeVendedor.Text));
    QRVendedorPgto.Open;
    If FRNota_VendedorPgto = Nil then
      FRNota_VendedorPgto := TFRNota_VendedorPgto.Create(Application);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_VendedorPgto.QRPrimario.Preview
    Else
       FRNota_VendedorPgto.QRPrimario.Print;
    QRVendedorPgto.Close;
  End;
end;

procedure TFNotaSaidaCad.MovMercadoria1Click(Sender: TObject);
Var
  wstrS : String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[3].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text),'VENDA');
    QRMovMercadoria.Close;
    QrMovMercadoria_CR.Close;
    QRMovMercadoria.SetVariable('DATA_I',FNotaSaidaParam.ME3DataI.Text);
    QRMovMercadoria.SetVariable('DATA_F',FNotaSaidaParam.ME3DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text)= ''   then
      QRMovMercadoria.SetVariable('FILIAL',Null)
    Else
      QRMovMercadoria.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text)= ''   then
      QRMovMercadoria.SetVariable('CADASTRO',Null)
    Else
      QRMovMercadoria.SetVariable('CADASTRO',Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text));

    If Trim(FNotaSaidaParam.Me3Armazem.Text)= ''   then
      QRMovMercadoria.SetVariable('COD_ARMAZEM_ALFANDEGADO',Null)
    Else
      QRMovMercadoria.SetVariable('COD_ARMAZEM_ALFANDEGADO',Trim(FNotaSaidaParam.Me3Armazem.Text));

    If Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text)= ''   then
      QRMovMercadoria.SetVariable('OPERACAO',Null)
    Else
      QRMovMercadoria.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text));
    If Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text)= ''   then
      QRMovMercadoria.SetVariable('COD_PRODUTO',Null)
    Else
      QRMovMercadoria.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text));
    if Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text)= ''   then
      QRMovMercadoria.SetVariable('FORNECEDOR',Null)
    else
      QRMovMercadoria.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text));
    if Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text)= ''   then
      QRMovMercadoria.SetVariable('VENDEDOR',Null)
    else
      QRMovMercadoria.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text)= ''   then
      QRMovMercadoria.SetVariable('DEPARTAMENTO',Null)
    else
      QRMovMercadoria.SetVariable('DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text));
    if Trim(FNotaSaidaParam.ME3Serie.Text)= ''   then
      QRMovMercadoria.SetVariable('SERIE',Null)
    else
      QRMovMercadoria.SetVariable('SERIE',Trim(FNotaSaidaParam.ME3Serie.Text));
    if Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text)= ''   then
      QRMovMercadoria.SetVariable('CULTURA',Null)
    else
      QRMovMercadoria.SetVariable('CULTURA',Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text));
    if Trim(FNotaSaidaParam.Me3Lote.Text)= ''   then
      QRMovMercadoria.SetVariable('COD_LOTE_TIPO',Null)
    else
      QRMovMercadoria.SetVariable('COD_LOTE_TIPO',Trim(FNotaSaidaParam.Me3Lote.Text));
    If Trim(FNotaSaidaParam.Me3Classe.Text)= ''   then
      QRMovMercadoria.SetVariable('COD_CLASSE',Null)
    Else
      QRMovMercadoria.SetVariable('COD_CLASSE',FNotaSaidaParam.Me3Classe.Text);
    If (Trim(FNotaSaidaParam.Me3SubClasse.Text)= '') or
       (Trim(FNotaSaidaParam.Me3SubClasse.Text)= '0')  then
      QRMovMercadoria.SetVariable('COD_SUBCLASSE',Null)
    Else
      QRMovMercadoria.SetVariable('COD_SUBCLASSE',FNotaSaidaParam.Me3SubClasse.Text);

    If Trim(FNotaSaidaParam.ME3CadastroParceiro.Text) = '' then
      QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO','1 = 1')
    Else
      If Trim(FNotaSaidaParam.ME3CadastroParceiro.Text) = '0' then
        QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO',' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO is null')
      Else
        QRMovMercadoria.SetVariable('CADASTRO_PARCEIRO',' TB_NOTA_CAB.COD_CADASTRO_PARCEIRO = '+FNotaSaidaParam.ME3CadastroParceiro.Text);

    Case FNotaSaidaParam.Rg3TipoNota.ItemIndex of
       0 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA','E');
       1 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA','S');
       2 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA',Null);
    End;
    Case FNotaSaidaParam.RG3CondicaoPagto.ItemIndex of
       0 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','1');
       1 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','2');
       2 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','3');
       3 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO',Null);
    End;
    Case FNotaSaidaParam.Rg3TipoPessoa.ItemIndex of
      0 : QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA','F');
      1 : QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA','J');
      2 : QRMovMercadoria.SetVariable('IND_FISICA_JURIDICA',Null);
    End; // Case
    QRMovMercadoria.SQL[QRMovMercadoria.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.Rg3Ordem.ItemIndex of
      0:QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.NUM_NOTA');
      1:QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.DT_EMISSAO');
    End;
    QRMovMercadoria.Open;
    QrMovMercadoria_CR.Open;

    If FRNota_MovMercadoria = Nil then
      FRNota_MovMercadoria := TFRNota_MovMercadoria.Create(Application);
    wstrS := '';
    If(Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text)<>'')Then
      wstrS := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text) +' '+Trim(FNotaSaidaParam.FmFilial4.EdFilial.Text)
    Else
      wstrS := 'Filial: Todas';
    wstrS := wstrS + ' De '+FNotaSaidaParam.ME3DataI.Text+' Até '+FNotaSaidaParam.ME3DataF.Text;
    FRNota_MovMercadoria.QRLPeriodo.Caption := wstrS;
    wstrS := '';
    If(Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text)<>'')Then
      wstrS := 'Fornecedor: ' + Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text) + ' ' + Trim(FNotaSaidaParam.FmFornecedor4.EdCadastro.Text)
    Else
      wstrS := 'Fornecedor: Todos';
    If(Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) <> '')Then
      wstrS := wstrS + ' - Repr.Comercial: ' + Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaSaidaParam.FmVendedor4.EdVendedor.Text)
    Else
      wstrS := wstrS + 'Repr.Comercial: Todos';
    FRNota_MovMercadoria.QrlFornecedor.Caption := wstrS;
    FRNota_MovMercadoria.QRLDepartamento.Caption := 'Departamento:'+FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text+' '+FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text;
    FRNota_MovMercadoria.QRLSerie.Caption := 'Serie:'+FNotaSaidaParam.ME3Serie.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_MovMercadoria.QRPrimario.Preview
    Else
      FRNota_MovMercadoria.QRPrimario.Print;
    QRMovMercadoria.Close;
    QrMovMercadoria_CR.Close;
  End;
end;

procedure TFNotaSaidaCad.ClientessemCompras1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[4].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text),'VENDA');
    QRClienteSemCompra.Close;
    QRClienteSemCompra.SetVariable('DATA_I',Date-StrToFloat(FNotaSaidaParam.ME4Dias.Text));
    QRClienteSemCompra.SetVariable('DATA_F',Date);
    If Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text)= ''   then
      QRClienteSemCompra.SetVariable('FILIAL',Null)
    Else
      QRClienteSemCompra.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial5.MeFilial.Text));
    If Trim(FNotaSaidaParam.FmVendedor5.MeVendedor.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_VENDEDOR',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_VENDEDOR',Trim(FNotaSaidaParam.FmVendedor5.MeVendedor.Text));
    If Trim(FNotaSaidaParam.FmTipoCadastro5.MeTipoCadastro.Text)= ''   then
      QRClienteSemCompra.SetVariable('TIPO_CADASTRO',Null)
    Else
      QRClienteSemCompra.SetVariable('TIPO_CADASTRO',Trim(FNotaSaidaParam.FmTipoCadastro5.MeTipoCadastro.Text));
    If Trim(FNotaSaidaParam.FmClassificacao5.MeClassificacao.Text)= ''   then
      QRClienteSemCompra.SetVariable('CLASS_CADASTRO',Null)
    Else
      QRClienteSemCompra.SetVariable('CLASS_CADASTRO',Trim(FNotaSaidaParam.FmClassificacao5.MeClassificacao.Text));
    If Trim(FNotaSaidaParam.FmClasse5.MeClasse.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_CLASSE',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.FmClasse5.MeClasse.Text));
    If Trim(FNotaSaidaParam.FmCidade5.MeCidade.Text)= ''   then
      QRClienteSemCompra.SetVariable('CIDADE',Null)
    Else
      QRClienteSemCompra.SetVariable('CIDADE',Trim(FNotaSaidaParam.FmCidade5.MeCidade.Text));
    If Trim(FNotaSaidaParam.FmEstado5.MeEstado.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_ESTADO',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_ESTADO',Trim(FNotaSaidaParam.FmEstado5.MeEstado.Text));
    If Trim(FNotaSaidaParam.FmSupervisor5.MeVendedor.Text)= ''   then
      QRClienteSemCompra.SetVariable('SUPERVISOR',Null)
    Else
      QRClienteSemCompra.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor5.MeVendedor.Text));
    If Trim(FNotaSaidaParam.FmProduto5.MeProduto.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_PRODUTO',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto5.MeProduto.Text));
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
    QRClienteSemCompra.SQL[QRClienteSemCompra.SQL.COUNT-1]:='';
    case(FNotaSaidaParam.RG4Cadastro.ItemIndex) of
      //--CLIENTES SEM COMPRA ATIVOS
      0:QRClienteSemCompra.SQL.add('AND ((TB_CADASTRO.DT_CANCELAMENTO IS NULL) AND (TB_CADASTRO.COD_MOTIVO IS NULL)) ');
      //--CLIENTES SEM COMPRA CANCELADOS
      1:QRClienteSemCompra.SQL.add('AND (NOT(TB_CADASTRO.DT_CANCELAMENTO IS NULL) OR NOT(TB_CADASTRO.COD_MOTIVO IS NULL)) ');
      //--TODOS CLIENTES SEM COMPRA
      //--CLIENTES SEM COMPRA ATIVOS
//      2:QRClienteSemCompra.SQL.add(' ORDER BY DESC_CIDADE,NOME');
     end;
    If FRNota_ClienteSemCompra = Nil then
       FRNota_ClienteSemCompra := TFRNota_ClienteSemCompra.Create(Application);
    FRNota_ClienteSemCompra.QRGroup1.Enabled:=False;
    FRNota_ClienteSemCompra.QRBand5.Enabled:=False;
    case (FNotaSaidaParam.Cb4Ordem.ItemIndex) of
      0:Begin
          QRClienteSemCompra.SQL.add(' ORDER BY DESC_CIDADE,NOME');
          FRNota_ClienteSemCompra.QRGroup1.Enabled:=True;
          FRNota_ClienteSemCompra.QRBand5.Enabled:=True;
        End;
      1:QRClienteSemCompra.SQL.add(' ORDER BY COD_CADASTRO,NOME');
      2:QRClienteSemCompra.SQL.add(' ORDER BY NOME');
    End;
    QRClienteSemCompra.Open;

    FRNota_ClienteSemCompra.QRLTitulo.Caption := 'Clientes que não compra a '+FNotaSaidaParam.ME4Dias.Text+' dias '+DateToStr(Date);
    FRNota_ClienteSemCompra.QRLVendedor.Caption := 'Representante Comercial:'+FNotaSaidaParam.FmVendedor5.EdVendedor.Text+' Classe:'+FNotaSaidaParam.FmClasse5.EdClasse.Text;
    FRNota_ClienteSemCompra.QRLTipoCadastro.Caption := 'Tipo de Cadastro :'+FNotaSaidaParam.FmTipoCadastro5.EdTipoCadastro.Text;
    FRNota_ClienteSemCompra.QRLSupervisor.Caption := 'Supervisor :'+FNotaSaidaParam.FmSupervisor5.MeVendedor.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ClienteSemCompra.QRPrimario.Preview
    Else
      FRNota_ClienteSemCompra.QRPrimario.Print;
    QRClienteSemCompra.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporOperacao1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[5].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text),'VENDA');
    QRVendaOperacao.Close;
    QRVendaOperacao.SetVariable('DATA_I',FNotaSaidaParam.ME5DataI.Text);
    QRVendaOperacao.SetVariable('DATA_F',FNotaSaidaParam.ME5DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text)= ''   then
      QRVendaOperacao.SetVariable('FILIAL',Null)
    Else
      QRVendaOperacao.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial6.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmVendedor6.MeVendedor.Text)= ''   then
      QRVendaOperacao.SetVariable('VENDEDOR',Null)
    Else
      QRVendaOperacao.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor6.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmVendedorPreposto6.MeVendedor.Text)= ''   then
      QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto6.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmOperacao6.MeOperacao.Text)= ''   then
      QRVendaOperacao.SetVariable('OPERACAO',Null)
    Else
      QRVendaOperacao.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao6.MeOperacao.Text));
    If Trim(FNotaSaidaParam.Me5Classe.Text)= ''   then
      QRVendaOperacao.SetVariable('COD_CLASSE',Null)
    Else
      QRVendaOperacao.SetVariable('COD_CLASSE',FNotaSaidaParam.Me5Classe.Text);
    If (Trim(FNotaSaidaParam.Me5SubClasse.Text)= '') Or (Trim(FNotaSaidaParam.Me5SubClasse.Text)= '0')  then
      QRVendaOperacao.SetVariable('COD_SUBCLASSE',Null)
    Else
      QRVendaOperacao.SetVariable('COD_SUBCLASSE',FNotaSaidaParam.Me5SubClasse.Text);
    If FRNota_Operacao = Nil then
      FRNota_Operacao := TFRNota_Operacao.Create(Application);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
    Begin
      FRNota_Operacao.QRGFilial.Enabled := False;
      FRNota_Operacao.QRGFilial.Expression := '';
      FRNota_Operacao.QRBRodTotalFilial.Enabled := False;
      QRVendaOperacao.SQL[QRVendaOperacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
      QRVendaOperacao.SQL.Add('ORDER BY Tb_nota_cab.COD_VENDEDOR,Tb_operacao.COD_OPERACAO');
    End;
    QRVendaOperacao.Open;
    FRNota_Operacao.QRLTitulo.Caption := 'Vendas por Operacao de '+ FNotaSaidaParam.ME5DataI.Text+' até '+FNotaSaidaParam.ME5DataF.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_Operacao.QRPrimario.Preview
    Else
      FRNota_Operacao.QRPrimario.Print;
    QRVendaOperacao.Close;
  End;
end;

procedure TFNotaSaidaCad.MovportipodeDocumento1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[6].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text),'VENDA');
    QRTipoDocumento.Close;
    QRTipoDocumento.SetVariable('DATA_I',FNotaSaidaParam.ME6DataI.Text);
    QRTipoDocumento.SetVariable('DATA_F',FNotaSaidaParam.ME6DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text)= ''   then
      QRTipoDocumento.SetVariable('FILIAL',Null)
    Else
      QRTipoDocumento.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial7.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmSerie7.MeSerie.Text)= ''   then
      QRTipoDocumento.SetVariable('SERIE',Null)
    Else
      QRTipoDocumento.SetVariable('SERIE',Trim(FNotaSaidaParam.FmSerie7.MeSerie.Text));
    QRTipoDocumento.Open;
    If FRNota_TipoDocumento = Nil then
      FRNota_TipoDocumento := TFRNota_TipoDocumento.Create(Application);

    FRNota_TipoDocumento.QRLTitulo.Caption := 'Mov. de Produtos por tipo de Documento de '+ FNotaSaidaParam.ME6DataI.Text+' até '+FNotaSaidaParam.ME6DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_TipoDocumento.QRPrimario.Preview
    Else
      FRNota_TipoDocumento.QRPrimario.Print;
    QRTipoDocumento.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporClasse1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[7].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text),'VENDA');
    QRVendaClasse.Close;
    QRVendaClasse.SetVariable('DATA_I',FNotaSaidaParam.ME7DataI.Text);
    QRVendaClasse.SetVariable('DATA_F',FNotaSaidaParam.ME7DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text)= ''   then
      QRVendaClasse.SetVariable('FILIAL',Null)
    Else
      QRVendaClasse.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text));

    If Trim(FNotaSaidaParam.ME7Classe.Text)= ''   then
      QRVendaClasse.SetVariable('CLASSE',Null)
    Else
      QRVendaClasse.SetVariable('CLASSE',FNotaSaidaParam.ME7Classe.Text);

    If Trim(FNotaSaidaParam.FmOperacao8.MeOperacao.Text) = ''   then
      QRVendaClasse.SetVariable('MONTA_NA_SQL','(TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39) + ') or (TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39) + ')')
    Else
      QRVendaClasse.SetVariable('MONTA_NA_SQL','TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.FmOperacao8.MeOperacao.Text));

    If (Trim(FNotaSaidaParam.ME7SubClasse.Text)= '' ) or
       (Trim(FNotaSaidaParam.ME7SubClasse.Text)= '0') then
      QRVendaClasse.SetVariable('SUB_CLASSE',Null)
    Else
      QRVendaClasse.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME7SubClasse.Text);

    If Trim(FNotaSaidaParam.FmVendedor8.MeVendedor.Text)= ''   then
      QRVendaClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendaClasse.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor8.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmFabricante8.MeCadastro.Text)= ''   then
      QRVendaClasse.SetVariable('FABRICANTE',Null)
    Else
      QRVendaClasse.SetVariable('FABRICANTE',Trim(FNotaSaidaParam.FmFabricante8.MeCadastro.Text));
    QRVendaClasse.SetVariable('TIPO_CUSTO',FNotaSaidaParam.Rg7TipoCusto.ItemIndex);  
    QRVendaClasse.SQL[QRVendaClasse.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.CB7Ordem.ItemIndex of
      0:QRVendaClasse.SQL.Add('ORDER BY Tb_classe.DESC_CLASSE,Tb_produto.COD_PRODUTO');
      1:QRVendaClasse.SQL.Add('ORDER BY Tb_classe.DESC_CLASSE,Tb_produto.DESC_PRODUTO');
    End;
    QRVendaClasse.Open;
    If FRNota_Classe = Nil then
      FRNota_Classe := TFRNota_Classe.Create(Application);
    FRNota_Classe.QRLTitulo.Caption := 'Vendas por classe e sub-classe de '+ FNotaSaidaParam.ME7DataI.Text+' até '+FNotaSaidaParam.ME7DataF.Text;
    FRNota_Classe.QRLFilial.Caption := FNotaSaidaParam.FmFilial8.EdFilial.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_Classe.QRPrimario.Preview
    Else
      FRNota_Classe.QRPrimario.Print;
    QRVendaClasse.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporClasseeCondPagto1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[8].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text),'VENDA');
    QRClassePgto.Close;
    QRClassePgtoVend.Close;
    QRClassePgto.SetVariable('DATA_I',FNotaSaidaParam.ME8DataI.Text);
    QRClassePgto.SetVariable('DATA_F',FNotaSaidaParam.ME8DataF.Text);
    QRClassePgtoVend.SetVariable('DATA_I',FNotaSaidaParam.ME8DataI.Text);
    QRClassePgtoVend.SetVariable('DATA_F',FNotaSaidaParam.ME8DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('FILIAL',Null);
      QRClassePgtoVend.SetVariable('FILIAL',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text));
      QRClassePgtoVend.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial9.MeFilial.Text))
    end;

    If Trim(FNotaSaidaParam.ME8Classe.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('CLASSE',Null);
      QRClassePgtoVend.SetVariable('CLASSE',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('CLASSE',FNotaSaidaParam.ME8Classe.Text);
      QRClassePgtoVend.SetVariable('CLASSE',FNotaSaidaParam.ME8Classe.Text)
    End;

    If ( Trim(FNotaSaidaParam.ME8SubClasse.Text)= '' )
       or (Trim(FNotaSaidaParam.ME8SubClasse.Text)= '0')  then
    Begin
      QRClassePgto.SetVariable('SUB_CLASSE',Null);
      QRClassePgtoVend.SetVariable('SUB_CLASSE',Null)
    End
    Else
    Begin
      QRClassePgto.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME8SubClasse.Text);
      QRClassePgtoVend.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME8SubClasse.Text)
    End;

    If Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('VENDEDOR',Null);
      QRClassePgtoVend.SetVariable('VENDEDOR',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text));
      QRClassePgtoVend.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor9.MeVendedor.Text))
    End;

    If Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('VENDEDOR_PREPOSTO',Null);
      QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text));
      QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto9.MeVendedor.Text))
    End;

    QRClassePgto.Open;
    QRClassePgtoVend.Open;
    If FRNota_ClassePgto = Nil then
      FRNota_ClassePgto := TFRNota_ClassePgto.Create(Application);

    If FRNota_ClassePgtoVend = Nil then
      FRNota_ClassePgtoVend := TFRNota_ClassePgtoVend.Create(Application);

    FRNota_ClassePgto.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento '+ FNotaSaidaParam.ME8DataI.Text+' até '+FNotaSaidaParam.ME8DataF.Text;
    FRNota_ClassePgtoVend.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento '+ FNotaSaidaParam.ME8DataI.Text+' até '+FNotaSaidaParam.ME8DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ClassePgtoVend.QRCompositeReport1.Preview
    Else
      FRNota_ClassePgtoVend.QRCompositeReport1.Print;
    QRClassePgto.Close;
    QRClassePgtoVend.Close;
  End;
end;

procedure TFNotaSaidaCad.MovEstoqueES1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[9].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text),'VENDA');
    QRMovEntradaSaida.Close;
    QRMovEntradaSaida.SetVariable('DATA_I',FNotaSaidaParam.ME9DataI.Text);
    QRMovEntradaSaida.SetVariable('DATA_F',FNotaSaidaParam.ME9DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text)= ''   then
      QRMovEntradaSaida.SetVariable('FILIAL',Null)
    Else
      QRMovEntradaSaida.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmProduto10.MeProduto.Text)= ''   then
      QRMovEntradaSaida.SetVariable('PRODUTO',Null)
    Else
      QRMovEntradaSaida.SetVariable('PRODUTO',Trim(FNotaSaidaParam.FmProduto10.MeProduto.Text));

    If Trim(FNotaSaidaParam.FmLote10.MeLote.Text)= ''   then
      QRMovEntradaSaida.SetVariable('LOTE',Null)
    Else
      QRMovEntradaSaida.SetVariable('LOTE',Trim(FNotaSaidaParam.FmLote10.MeLote.Text));

    If Trim(FNotaSaidaParam.FmOperacao10.MeOperacao.Text)= ''   then
      QRMovEntradaSaida.SetVariable('OPERACAO',Null)
    Else
      QRMovEntradaSaida.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao10.MeOperacao.Text));

{aqui foi descomentado}
    If Trim(FNotaSaidaParam.Fm2Operacao10.MeOperacao.Text)= ''   then
      QRMovEntradaSaida.SetVariable('OPERACAO1',Null)
    Else
     QRMovEntradaSaida.SetVariable('OPERACAO1',Trim(FNotaSaidaParam.Fm2Operacao10.MeOperacao.Text));

    If Trim(FNotaSaidaParam.ME9Classe.Text)= ''   then
      QRMovEntradaSaida.SetVariable('CLASSE',Null)
    Else
      QRMovEntradaSaida.SetVariable('CLASSE',FNotaSaidaParam.ME9Classe.Text);

    If (Trim(FNotaSaidaParam.ME9Subclasse.Text)= '') Or (Trim(FNotaSaidaParam.ME9Subclasse.Text)= '0')  then
      QRMovEntradaSaida.SetVariable('SUBCLASSE',Null)
    Else
      QRMovEntradaSaida.SetVariable('SUBCLASSE',FNotaSaidaParam.ME9Subclasse.Text);

//------
    QRMovEntradaSaida.SQL[QRMovEntradaSaida.SQL.Count-1]:='';  // elimina a última Linha da SQL
    If FNotaSaidaParam.Rg9Ordem.ItemIndex = 0 Then
       QRMovEntradaSaida.Sql.Add('ORDER BY TB_PRODUTO.COD_PRODUTO,TB_PRODUTO.DESC_PRODUTO,TB_LOTE_TIPO.DESC_LOTE,TB_LOTE_TIPO.COD_LOTE_TIPO')
    Else
       QRMovEntradaSaida.Sql.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO,TB_PRODUTO.COD_PRODUTO,TB_LOTE_TIPO.DESC_LOTE,TB_LOTE_TIPO.COD_LOTE_TIPO');
    QRMovEntradaSaida.Open;
    If FRNota_EntradaSaida = Nil then
      FRNota_EntradaSaida := TFRNota_EntradaSaida.Create(Application);
    FRNota_EntradaSaida.QRLTitulo.Caption := 'Movimentação de Estoque '+ FNotaSaidaParam.ME9DataI.Text+' até '+FNotaSaidaParam.ME9DataF.Text;
    FRNota_EntradaSaida.QRLFilial.Caption := 'Filial:'+Trim(FNotaSaidaParam.FmFilial10.MeFilial.Text)+' - '+Trim(FNotaSaidaParam.FmFilial10.EdFilial.Text);
    FRNota_EntradaSaida.QRLClasse.Caption := 'Classe: '+Trim(FNotaSaidaParam.ME9Classe.Text)+' Subclasse: '+Trim(FNotaSaidaParam.ME9SubClasse.Text) +
                                              ' ' + Trim(FNotaSaidaParam.Ed9Classe.Text);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_EntradaSaida.QRPrimario.Preview
    Else
      FRNota_EntradaSaida.QRPrimario.Print;
    QRMovEntradaSaida.Close;
  End;
end;

procedure TFNotaSaidaCad.ComissoporCliente1Click(Sender: TObject);
Var wLinha : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[10].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text),'VENDA');
    QRComissaoCliente.Close;
    QRComissaoCliente.SetVariable('DATA_I',FNotaSaidaParam.ME10DataI.Text);
    QRComissaoCliente.SetVariable('DATA_F',FNotaSaidaParam.ME10DataF.Text);
    if Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text)= ''   then
      QRComissaoCliente.SetVariable('FILIAL',Null)
    else
      QRComissaoCliente.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial11.MeFilial.Text));
    if Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text)= ''   then
      QRComissaoCliente.SetVariable('VENDEDOR',Null)
    else
      QRComissaoCliente.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor11.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmVendedorPreposto11.MeVendedor.Text)= ''   then
      QRComissaoCliente.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
      QRComissaoCliente.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto11.MeVendedor.Text));
    if Trim(FNotaSaidaParam.Ed10Serie.Text) = ''   then
      QRComissaoCliente.SetVariable('SERIE',Null)
    else
      QRComissaoCliente.SetVariable('SERIE',Trim(FNotaSaidaParam.Ed10Serie.Text));
    if Trim(FNotaSaidaParam.Ed10Serie1.Text) = ''   then
      QRComissaoCliente.SetVariable('SERIE1',Null)
    else
      QRComissaoCliente.SetVariable('SERIE1',Trim(FNotaSaidaParam.Ed10Serie1.Text));
    if FNotaSaidaParam.RG10CondicaoPagto.ItemIndex <> 3 then
      QRComissaoCliente.SetVariable('IND_CONDICAO_PAGTO',FNotaSaidaParam.RG10CondicaoPagto.ItemIndex+1)
    else
      QRComissaoCliente.SetVariable('IND_CONDICAO_PAGTO',null);
    QRComissaoCliente.SQL[QRComissaoCliente.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.CB10Ordem.ItemIndex of
      0:QRComissaoCliente.SQL.Add('ORDER BY NOME_VENDEDOR,Num_Nota');
      1:QRComissaoCliente.SQL.Add('ORDER BY COD_VENDEDOR,Num_Nota');
    End;
    QRComissaoCliente.Open;
    If FRNota_ComissaoCliente = Nil then
       FRNota_ComissaoCliente := TFRNota_ComissaoCliente.Create(Application);
    FRNota_ComissaoCliente.QRLTitulo.Caption := 'Comissão de Vendedores por Cliente '+ FNotaSaidaParam.ME10DataI.Text+' até '+FNotaSaidaParam.ME10DataF.Text;
    FRNota_ComissaoCliente.QRLFilial.Caption := 'Filial: '+ Trim(FNotaSaidaParam.FmFilial11.EdFilial.Text);
    FRNota_ComissaoCliente.QRLObservacao.Caption := 'Obs: '+ FNotaSaidaParam.Me10Observacao.Text;
    FRNota_ComissaoCliente.QRLObservacao1.Caption := FNotaSaidaParam.Me10Observacao1.Text;
    If FNotaSaidaParam.Rg10Comissao.ItemIndex = 1 Then
     Begin
       FRNota_ComissaoCliente.QRDBText11.Enabled := False;
       FRNota_ComissaoCliente.QRLabel11.Enabled := False;
       FRNota_ComissaoCliente.QRExpr2.Enabled := False;
     End
    Else
     Begin
       FRNota_ComissaoCliente.QRDBText11.Enabled := True;
       FRNota_ComissaoCliente.QRLabel11.Enabled := True;
       FRNota_ComissaoCliente.QRExpr2.Enabled := True;
     End;

    If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS' Then
      FRNota_ComissaoCliente.QRLQuantidade.Caption := 'Quant.'
    else
    begin
      if MessageDlg('Deseja Imprimir o IRRF?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        FRNota_ComissaoCliente.QRLabel3.Enabled:=true;
        FRNota_ComissaoCliente.QRLabel4.Enabled:=true;
        FRNota_ComissaoCliente.QRLabel13.Enabled:=true;
        FRNota_ComissaoCliente.QRExpr3.Enabled:=true;
        FRNota_ComissaoCliente.QRExpr4.Enabled:=true;
        FRNota_ComissaoCliente.QRDBText2.Enabled:=true;
      end
      else
      begin
        FRNota_ComissaoCliente.QRLabel3.Enabled:=false;
        FRNota_ComissaoCliente.QRLabel4.Enabled:=false;
        FRNota_ComissaoCliente.QRLabel13.Enabled:=false;
        FRNota_ComissaoCliente.QRExpr3.Enabled:=false;
        FRNota_ComissaoCliente.QRExpr4.Enabled:=false;
        FRNota_ComissaoCliente.QRDBText2.Enabled:=false;
      end;
    end;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then
       FRNota_ComissaoCliente.QRGCabVendedor.ForceNewPage := True;
    If FNotaSaidaParam.Rg10Opcao.ItemIndex = 0 Then
       FRNota_ComissaoCliente.QRBand3.Enabled := True
    Else
       FRNota_ComissaoCliente.QRBand3.Enabled := False;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_ComissaoCliente.QRPrimario.Preview
    Else
       FRNota_ComissaoCliente.QRPrimario.Print;
    QRComissaoCliente.Close;
  End;
end;

procedure TFNotaSaidaCad.PrazosdeVenda1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text),'VENDA');
    QRPrazoVenda.Close;
    QRPrazoVenda.SetVariable('DATA_I',FNotaSaidaParam.ME11DataI.Text);
    QRPrazoVenda.SetVariable('DATA_F',FNotaSaidaParam.ME11DataF.Text);
    QRPrazoVenda.SetVariable('PRAZO1',FNotaSaidaParam.ME11Prazo1.Text);
    QRPrazoVenda.SetVariable('PRAZO2',FNotaSaidaParam.ME11Prazo2.Text);
    QRPrazoVenda.SetVariable('PRAZO3',FNotaSaidaParam.ME11Prazo3.Text);
    QRPrazoVenda.SetVariable('PRAZO4',FNotaSaidaParam.ME11Prazo4.Text);
    QRPrazoVenda.SetVariable('PRAZO5',FNotaSaidaParam.ME11Prazo5.Text);
    QRPrazoVenda.SetVariable('PRAZO6',FNotaSaidaParam.ME11Prazo6.Text);
    If Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text)= ''   then
      QRPrazoVenda.SetVariable('FILIAL',Null)
    Else
      QRPrazoVenda.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text));
    QRPrazoVenda.Open;
    If FRNota_PrazoVenda = Nil then
      FRNota_PrazoVenda := TFRNota_PrazoVenda.Create(Application);
    FRNota_PrazoVenda.QRLTitulo.Caption := 'Vendas por Prazo de '+ FNotaSaidaParam.ME11DataI.Text+' até '+FNotaSaidaParam.ME11DataF.Text;
    FRNota_PrazoVenda.QRLPrazo1.Caption := 'Até '+FNotaSaidaParam.ME11Prazo1.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo2.Caption := 'Até '+FNotaSaidaParam.ME11Prazo2.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo3.Caption := 'Até '+FNotaSaidaParam.ME11Prazo3.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo4.Caption := 'Até '+FNotaSaidaParam.ME11Prazo4.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo5.Caption := 'Até '+FNotaSaidaParam.ME11Prazo5.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo6.Caption := 'Até '+FNotaSaidaParam.ME11Prazo6.Text+'d.';
    FRNota_PrazoVenda.QRLLongoPrazo.Caption := '+ de '+FNotaSaidaParam.ME11Prazo6.Text+'d.';

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_PrazoVenda.QRPrimario.Preview
    Else
      FRNota_PrazoVenda.QRPrimario.Print;
    QRPrazoVenda.Close;
  End;
end;

procedure TFNotaSaidaCad.VendedorPreoMdio1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[12].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
    If DMUsuario.pTipoFuncionario = 'VENDEDOR' Then
     Begin
      FNotaSaidaParam.FmVendedor13.MeVendedor.Enabled := False;
      FNotaSaidaParam.FmVendedor13.BtVendedor.Enabled := False;
      FNotaSaidaParam.FmVendedor13.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End
    Else
     Begin
      FNotaSaidaParam.FmSupervisor13.MeVendedor.Enabled := False;
      FNotaSaidaParam.FmSupervisor13.BtVendedor.Enabled := False;
      FNotaSaidaParam.FmSupervisor13.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text),'VENDA');

    QRVendedorCMedio.Close;
    QRVendedorCMedio2.Close;
    QRVendedorCMedio.SetVariable('DATA_I',FNotaSaidaParam.ME12DataI.Text);
    QRVendedorCMedio.SetVariable('DATA_F',FNotaSaidaParam.ME12DataF.Text);

    QRVendedorCMedio2.SetVariable('DATA_I',FNotaSaidaParam.ME12DataI.Text);
    QRVendedorCMedio2.SetVariable('DATA_F',FNotaSaidaParam.ME12DataF.Text);

    //fabiano 27122004
    if Trim(FNotaSaidaParam.ME12PrecoIni.Text) <> '' then
    begin
      QRVendedorCMedio.SetVariable('VAL_TOTAL_INI',strtofloat(Trim(FNotaSaidaParam.ME12PrecoIni.Text)));
      QRVendedorCMedio2.SetVariable('VAL_TOTAL_INI',strtofloat(Trim(FNotaSaidaParam.ME12PrecoIni.Text)));
    end
    else
    begin
      QRVendedorCMedio.SetVariable('VAL_TOTAL_INI',Null);
      QRVendedorCMedio2.SetVariable('VAL_TOTAL_INI',Null);
    end;

    if Trim(FNotaSaidaParam.ME12PrecoFim.Text) <> '' then
    begin
      QRVendedorCMedio.SetVariable('VAL_TOTAL_FIM',strtofloat(Trim(FNotaSaidaParam.ME12PrecoFim.Text)));
      QRVendedorCMedio2.SetVariable('VAL_TOTAL_FIM',strtofloat(Trim(FNotaSaidaParam.ME12PrecoFim.Text)));
    end
    else
    begin
      QRVendedorCMedio.SetVariable('VAL_TOTAL_FIM',Null);
      QRVendedorCMedio2.SetVariable('VAL_TOTAL_FIM',Null);
    end;
    //fim fabiano

    If Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('FILIAL',Null);
      QRVendedorCMedio2.SetVariable('FILIAL',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text));
      QRVendedorCMedio2.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial13.MeFilial.Text));
    End;

    If Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('VENDEDOR',Null);
      QRVendedorCMedio2.SetVariable('VENDEDOR',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text));
      QRVendedorCMedio2.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor13.MeVendedor.Text));
    End;
    If Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('SUPERVISOR',Null);
      QRVendedorCMedio2.SetVariable('SUPERVISOR',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text));
      QRVendedorCMedio2.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor13.MeVendedor.Text));
    End;
    If Trim(FNotaSaidaParam.ME12Cadastro.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('COD_CADASTRO',Null);
      QRVendedorCMedio2.SetVariable('COD_CADASTRO',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('COD_CADASTRO',FNotaSaidaParam.ME12Cadastro.Text);
      QRVendedorCMedio2.SetVariable('COD_CADASTRO',FNotaSaidaParam.ME12Cadastro.Text);
    End;

    If Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('COD_DEPARTAMENTO',Null);
      QRVendedorCMedio2.SetVariable('COD_DEPARTAMENTO',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('COD_DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text));
      QRVendedorCMedio2.SetVariable('COD_DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento13.MeDepartamento.Text));
    End;

    If Trim(FNotaSaidaParam.Me12Serie.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('COD_SERIE',Null);
      QRVendedorCMedio2.SetVariable('COD_SERIE',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('COD_SERIE',FNotaSaidaParam.Me12Serie.Text);
      QRVendedorCMedio2.SetVariable('COD_SERIE',FNotaSaidaParam.Me12Serie.Text);
    End;
    
    If Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('ESTADO',Null);
      QRVendedorCMedio2.SetVariable('ESTADO',Null);
    End
    Else
    Begin
      QRVendedorCMedio.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text));
      QRVendedorCMedio2.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado13.MeEstado.Text));
    End;

    If Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text) = ''   then
    Begin
      QRVendedorCMedio.SetVariable('IND_VENDAS','V');
      QRVendedorCMedio.SetVariable('OPERACAO',Null);
      QRVendedorCMedio2.SetVariable('IND_VENDAS','V');
      QRVendedorCMedio2.SetVariable('OPERACAO',Null);
     End
    Else
    Begin
      QRVendedorCMedio.SetVariable('IND_VENDAS',Null);
      QRVendedorCMedio.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text));
      QRVendedorCMedio2.SetVariable('IND_VENDAS',Null);
      QRVendedorCMedio2.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao13.MeOperacao.Text));
    End;

    If Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('CLASSE',Null);
      QRVendedorCMedio2.SetVariable('CLASSE',Null);
     End
    Else
    Begin
      QRVendedorCMedio.SetVariable('CLASSE',Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text));
      QRVendedorCMedio2.SetVariable('CLASSE',Trim(FNotaSaidaParam.FmClasse13.MeClasse.Text));
    end;

    If Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text)= ''   then
    Begin
      QRVendedorCMedio.SetVariable('RAMO',Null);
      QRVendedorCMedio2.SetVariable('RAMO',Null);
     End
    Else
    Begin
      QRVendedorCMedio.SetVariable('RAMO',Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text));
      QRVendedorCMedio2.SetVariable('RAMO',Trim(FNotaSaidaParam.FmRamo13.MeRamo.Text));
    end;

    QRVendedorCMedio.Open;

    If FRNota_VendedorCMedio = Nil then
      FRNota_VendedorCMedio := TFRNota_VendedorCMedio.Create(Application);

    FRNota_VendedorCMedio.QRLTitulo.Caption := 'Vendas por Rep. Comercial/Custo Médio de '+ FNotaSaidaParam.ME12DataI.Text+' até '+FNotaSaidaParam.ME12DataF.Text;
    FRNota_VendedorCMedio.QRLOperacao.Caption :=  'Operação:' + Trim(FNotaSaidaParam.FmOperacao13.EdOperacao.Text)+' '+ 'Estado:' + Trim(FNotaSaidaParam.FmEstado13.EdEstado.Text);
    FRNota_VendedorCMedio.QRLRepresentante.Caption := 'Representante: ' + Trim(FNotaSaidaParam.FmVendedor13.EdVendedor.Text) + ' Supervisor:' + Trim(FNotaSaidaParam.FmSupervisor13.EdVendedor.Text);
    QRVendedorCMedio2.Open;

    If FRNota_VendedorCMedio2 = Nil then
      FRNota_VendedorCMedio2 := TFRNota_VendedorCMedio2.Create(Application);
    FRNota_VendedorCMedio2.QRLRepresentante.Caption := 'Representante: ' + Trim(FNotaSaidaParam.FmVendedor13.EdVendedor.Text) + ' Supervisor:' + Trim(FNotaSaidaParam.FmSupervisor13.EdVendedor.Text);

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendedorCMedio.QRCompositeReport2.Preview
     //      QRGVendedorCMedio.Preview
    Else
      FRNota_VendedorCMedio.QRCompositeReport2.Print;
 //     QRGVendedorCMedio.Print;
   QRVendedorCMedio2.Close;
   QRVendedorCMedio.Close;
  End;

end;

procedure TFNotaSaidaCad.QRGVendedorCMedioAddReports(Sender: TObject);
begin
  inherited;
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio.QRPrimario);
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio2.QRPrimario);
end;

procedure TFNotaSaidaCad.Secretaria1Click(Sender: TObject);
Var wClasse_I,wClasse_F : String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[13].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text),'VENDA');
    QRSecretaria.Close;
    QRSecretaria.SetVariable('DATA_I_PRI','01/01/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_PRI','31/03/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_SEG','01/04/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_SEG','30/06/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_TER','01/07/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_TER','30/09/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_QUA','01/10/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_QUA','31/12/'+Trim(FNotaSaidaParam.ME13ANO.Text));

    wClasse_I :=  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13ClasseI.Text)) +
                  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13SubClasseI.Text));

    wClasse_F :=  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13ClasseF.Text)) +
                  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13SubClasseF.Text));

    If Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text)= ''   then
      QRSecretaria.SetVariable('FILIAL',Null)
    Else
      QRSecretaria.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text));

    If Trim(FNotaSaidaParam.ME13ClasseI.Text)= '' then
      QRSecretaria.SetVariable('CLASSE_I',Null)
    Else
      QRSecretaria.SetVariable('CLASSE_I',wClasse_I);

    if Trim(FNotaSaidaParam.ME13ClasseF.Text)= '' then
      QRSecretaria.SetVariable('CLASSE_F',Null)
    Else
      QRSecretaria.SetVariable('CLASSE_F',wClasse_F);

    QRSecretaria.Open;
    If FRNota_Secretaria = Nil then
      FRNota_Secretaria := TFRNota_Secretaria.Create(Application);

    FRNota_Secretaria.QRLFilial.Caption := Trim(FNotaSaidaParam.FmFilial14.EdFilial.Text);
    FRNota_Secretaria.QRLMunicipio.Caption := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+Trim(FNotaSaidaParam.FmFilial14.MeFilial.Text));;
    FRNota_Secretaria.QRLAno.Caption := FNotaSaidaParam.Me13Ano.Text;
    FRNota_Secretaria.QRLResponsavel.Caption := FNotaSaidaParam.Ed13NomeResponsavel.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_Secretaria.QRPrimario.Preview
    else
       FRNota_Secretaria.QRPrimario.Preview;
    QRSecretaria.Close;
  End;
end;

procedure TFNotaSaidaCad.VendedorQuota1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[14].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
  Begin
    FNotaSaidaParam.FmVendedor15.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor15.BtVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor15.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  End;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text),'VENDA');
    QRQuotaVend.Close;
    QRQuotaVend3.Close;
    QRQuotaVend.SetVariable('ANO',FormatFloat('0000',StrToFloat(FNotaSaidaParam.ME14Ano.Text)));
    QRQuotaVend3.SetVariable('ANO',FormatFloat('0000',StrToFloat(FNotaSaidaParam.ME14Ano.Text)));

    if Trim(FNotaSaidaParam.ME14NumClasse.Text)= ''   then
    begin
      //QRQuotaVend.SetVariable('CLASSE',Null);
      QRQuotaVend2.SetVariable('CLASSE',Null);
      QRQuotaVend3.SetVariable('CLASSE',Null);
    end
    else
    begin
      //QRQuotaVend.SetVariable('CLASSE',FNotaSaidaParam.ME14NumClasse.Text);
      QRQuotaVend2.SetVariable('CLASSE',FNotaSaidaParam.ME14NumClasse.Text);
      QRQuotaVend3.SetVariable('CLASSE',FNotaSaidaParam.ME14NumClasse.Text);
    end;

    if Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text)= ''   then
    begin
      QRQuotaVend.SetVariable('VENDEDOR',Null);
      QRQuotaVend2.SetVariable('VENDEDOR',Null);
      QRQuotaVend3.SetVariable('VENDEDOR',Null);
    end
    else
    begin
      QRQuotaVend.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
      QRQuotaVend2.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
      QRQuotaVend3.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor15.MeVendedor.Text));
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

    if Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text)= ''   then
    begin
      //QRQuotaVend.SetVariable('FILIAL',Null);
      QRQuotaVend3.SetVariable('FILIAL',Null);
    end
    else
    begin
      //QRQuotaVend.SetVariable('FILIAL',FNotaSaidaParam.ME14Filial.Text);
      QRQuotaVend3.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial15.MeFilial.Text));
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
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[15].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text),'VENDA');
    QRInadimplencia.Close;
    If Trim(FNotaSaidaParam.ME15DataI.Text) <> '' Then
      QRInadimplencia.SetVariable('DATA_I',FNotaSaidaParam.ME15DataI.Text);
    If Trim(FNotaSaidaParam.ME15DataF.Text) <> '' Then
      QRInadimplencia.SetVariable('DATA_F',FNotaSaidaParam.ME15DataF.Text);
    if Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text) = ''   then
      QRInadimplencia.SetVariable('FILIAL',Null)
    else
      QRInadimplencia.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial16.MeFilial.Text));

    if Trim(FNotaSaidaParam.FmCadastro16.MeCadastro.Text)= ''   then
      QRInadimplencia.SetVariable('VENDEDOR',Null)
    else
      QRInadimplencia.SetVariable('VENDEDOR', Trim(FNotaSaidaParam.FmCadastro16.MeCadastro.Text));
    if Trim(FNotaSaidaParam.FmVendedorPreposto16.MeVendedor.Text)= ''   then
      QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
      QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto16.MeVendedor.Text));

    if Trim(FNotaSaidaParam.FmSupervisor16.MeVendedor.Text)= ''   then
      QRInadimplencia.SetVariable('COD_SUPERVISOR',Null)
    else
      QRInadimplencia.SetVariable('COD_SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor16.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmFinalidade16.MeFinalidade.Text) = ''   then
      QRInadimplencia.SetVariable('COD_FINALIDADE',Null)
    else
      QRInadimplencia.SetVariable('COD_FINALIDADE',Trim(FNotaSaidaParam.FmFinalidade16.MeFinalidade.Text));
    if Trim(FNotaSaidaParam.FmEstado16.MeEstado.Text) = ''   then
      QRInadimplencia.SetVariable('COD_ESTADO',Null)
    else
      QRInadimplencia.SetVariable('COD_ESTADO',Trim(FNotaSaidaParam.FmEstado16.MeEstado.Text));

    Case FNotaSaidaParam.Rg15Situacao.ItemIndex Of
      0 : QRInadimplencia.SetVariable('IND_SITUACAO',Null);
      1 : QRInadimplencia.SetVariable('IND_SITUACAO','ATIVO');
      2 : QRInadimplencia.SetVariable('IND_SITUACAO','INATIVO');
    End;
    QRInadimplencia.SQL[QRInadimplencia.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.Rg15Ordem.ItemIndex of
      0:QRInadimplencia.SQL.Add('ORDER BY COD_SUPERVISOR,NOME_VENDEDOR');
      1:QRInadimplencia.SQL.Add('ORDER BY COD_SUPERVISOR,COD_VENDEDOR');
    End;
    QRInadimplencia.Open;
    If FRNota_Inadimplencia = Nil then
      FRNota_Inadimplencia := TFRNota_Inadimplencia.Create(Application);
    FRNota_Inadimplencia.QRLTitulo.Caption := 'Mapa de Inadimplência de '+ FNotaSaidaParam.ME15DataI.Text+' até '+FNotaSaidaParam.ME15DataF.Text;
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
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[16].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text),'VENDA');
    If FRNota_ContaCorrente = Nil then
      FRNota_ContaCorrente := TFRNota_ContaCorrente.Create(Application);
    QRContaCorrente.Close;
    QRContaCorrente.Sql.Clear;
    QRContaCorrente.Sql.Add('SELECT Tb_Nota_Cab.Cod_Nota_Cab, Tb_nota_cab.DT_EMISSAO, Tb_nota_cab.NUM_NOTA,');
    QRContaCorrente.Sql.Add(' Tb_nota_cab.COD_SERIE, Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME AS NOME_CADASTRO, ');
    QRContaCorrente.Sql.Add(' TB_NOTA_CAB.VAL_AVISTA,TB_VENDEDOR.NOME AS NOME_VENDEDOR,SUM(TB_NOTA_ITEM.VAL_TOTAL) AS VAL_TOTAL_ITENS ');
    QRContaCorrente.Sql.Add(' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_VENDEDOR WHERE ');
    QRContaCorrente.Sql.Add(' TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB ');
    QRContaCorrente.Sql.Add(' AND TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO ');
    QRContaCorrente.Sql.Add(' AND Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO ');
    QRContaCorrente.Sql.Add(' AND Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
    QRContaCorrente.Sql.Add(' AND TB_OPERACAO.IND_VENDAS = ' + CHR(39) + 'V' + CHR(39));
    QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = 2 ');
    If Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial17.MeFilial.Text));
    If Trim(FNotaSaidaParam.FmCadastro17.MeCadastro.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.FmCadastro17.MeCadastro.Text));

    Case FNotaSaidaParam.RGTipoPagto.ItemIndex of
      0 :
        Begin
         QRContaCorrente.Sql.Add(' AND ((TB_NOTA_CAB.IND_CONDICAO_PAGTO = 1 ) OR (TB_NOTA_CAB.VAL_AVISTA > 0))');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas a Vista de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
         If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO'
         Then
            QRContaCorrente.Sql.Add(' AND TB_OPERACAO.COD_HISTORICO_CAIXA = 1');
        End;
      1 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 2 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas a Prazo de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      2 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Conta  Corrente de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      3 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 4 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Cartão de Crédito '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      4 :
        Begin
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Todas de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
    End;
    If Trim(FNotaSaidaParam.FmVendedor17.MeVendedor.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor17.MeVendedor.Text));
    If Trim(FNotaSaidaParam.FmDepartamento17.MeDepartamento.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FNotaSaidaParam.FmDepartamento17.MeDepartamento.Text));
    If Trim(FNotaSaidaParam.Me16Serie.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_SERIE = ' + Chr(39) + Trim(FNotaSaidaParam.Me16Serie.Text)+ Chr(39));
    If Trim(FNotaSaidaParam.FmHistorico17.MeHistorico.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_OPERACAO.COD_HISTORICO_CAIXA = ' + Trim(FNotaSaidaParam.FmHistorico17.MeHistorico.Text));
    If Trim(FNotaSaidaParam.FmClassificacao17.MeClassificacao.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_CADASTRO.COD_CLASS_CADASTRO = ' + Trim(FNotaSaidaParam.FmClassificacao17.MeClassificacao.Text));
    If Trim(FNotaSaidaParam.FmProduto17.MeProduto.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto17.MeProduto.Text));
    If Trim(FNotaSaidaParam.ME16DataI.Text) <> '' Then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME16DataI.Text) + Chr(39));
    If Trim(FNotaSaidaParam.ME16DataF.Text) <> '' Then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME16DataF.Text) + Chr(39));
    pTipoPagto := FNotaSaidaParam.RGTipoPagto.ItemIndex;  // utilizado no calcfields da query
    QRContaCorrente.Sql.Add(' GROUP BY Tb_Nota_Cab.Cod_Nota_Cab, Tb_nota_cab.DT_EMISSAO, Tb_nota_cab.NUM_NOTA,');
    QRContaCorrente.Sql.Add(' Tb_nota_cab.COD_SERIE, Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME, ');
    QRContaCorrente.Sql.Add(' TB_NOTA_CAB.VAL_AVISTA,TB_VENDEDOR.NOME');
    If FNotaSaidaParam.Rg16Ordem.ItemIndex = 0 Then
       QRContaCorrente.Sql.Add(' Order By Tb_cadastro.COD_CADASTRO')
    Else
       QRContaCorrente.Sql.Add(' Order By Tb_nota_cab.NUM_NOTA');

    QRContaCorrente.Open;
    FRNota_ContaCorrente.QRLHistorico.Caption := 'Filial:' + Trim(FNotaSaidaParam.FmFilial17.EdFilial.Text) + ' - ' +Trim(FNotaSaidaParam.FmHistorico17.EdHistorico.Text);
    FRNota_ContaCorrente.QRLDepartamento.Caption:=Trim(FNotaSaidaParam.FmDepartamento17.EdDepartamento.Text);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ContaCorrente.QRPrimario.Preview
    Else
      FRNota_ContaCorrente.QRPrimario.Print;
    QRContaCorrente.Close;
  End;
end;

procedure TFNotaSaidaCad.SBGeraContaCorrenteClick(Sender: TObject);
begin
  inherited;
  Try
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    If FNota_ContaCorrente = Nil then
       FNota_ContaCorrente := TFNota_ContaCorrente.Create(Application);
    FNota_Contacorrente.ShowModal;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
  Except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
end;

procedure TFNotaSaidaCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' Then
  Begin
    if FSenha = Nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
      If UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) Then
        Raise Exception.Create('Usuário sem permissão!');
  end;
  If MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMNotaSaida.ExcluiNota;
end;

procedure TFNotaSaidaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao_CF.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaSaidaCad.SBCancelarClick(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    If QItemNF.State in [dsEdit,dsInsert] then
      QItemNF.Cancel;
  End;
  inherited;
end;

procedure TFNotaSaidaCad.SBImprimeCupomFiscalClick(Sender: TObject);
begin
  inherited;
  if Trim(DBECodNota.Text) = '' then
  begin
    MessageDlg('Primeiro selecione a nota fiscal!',mtInformation,[mbOk],0);
    Exit;
  end  
  else
  begin
    if FImpressoraFiscal = nil then
       FImpressoraFiscal:= TFImpressoraFiscal.Create(Application);
    if FImpressoraFiscal.EmiteCF_Yanco(DBECodNota.Text) = False then
       MessageDlg('Erro na tentativa de imprimir cupom fiscal!',mtInformation,[mbOk],0);
    FImpressoraFiscal.ShowModal;   
  end;
end;

procedure TFNotaSaidaCad.SBConsultaFreteClick(Sender: TObject);
begin
  inherited;
  If FConhecimentoCons = Nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  If FConhecimentoCons.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',DMNotaEntrada.QConhecimentoConsCod_Nota_Cab.Value);
    QNotaSaida.Open;
  End;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoEnter(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QBaixasPed.Open;
  End;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoExit(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QBaixasPed.Close;
  End;
end;

procedure TFNotaSaidaCad.PMapaVendasPVendedorPagtoClasse1Click(
  Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[18].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
    If DMUsuario.pTipoFuncionario = 'VENDEDOR' Then
     Begin
       FNotaSaidaParam.FmVendedor19.Enabled := False;
       FNotaSaidaParam.FmVendedor19.BtVendedor.Enabled := False;
       FNotaSaidaParam.FmVendedor19.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End
    Else
     Begin
       FNotaSaidaParam.FmSupervisor19.MeVendedor.Enabled := False;
       FNotaSaidaParam.FmSupervisor19.BtVendedor.Enabled := False;
       FNotaSaidaParam.FmSupervisor19.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text),'VENDA');
    QRVendClasse.Close;
    QRVendClasse.SetVariable('DATA_I',FNotaSaidaParam.ME18DataI.Text);
    QRVendClasse.SetVariable('DATA_F',FNotaSaidaParam.ME18DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text)= ''   then
      QRVendClasse.SetVariable('FILIAL',Null)
    Else
      QRVendClasse.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial19.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmVendedor19.MeVendedor.Text)= ''   then
      QRVendClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendClasse.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor19.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmVendedorPreposto19.MeVendedor.Text)= ''   then
      QRVendClasse.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendClasse.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto19.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmSupervisor19.MeVendedor.Text)= ''   then
      QRVendClasse.SetVariable('SUPERVISOR',Null)
    Else
      QRVendClasse.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor19.MeVendedor.Text));

    If Trim(FNotaSaidaParam.FmOperacao19.MeOperacao.Text) = ''   then
     Begin
      QRVendClasse.SetVariable('MONTA_NA_ROTINA_VENDA','TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39));
      QRVendClasse.SetVariable('MONTA_NA_ROTINA_DEVOLUCAO','TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39));
     End
    Else
     Begin
      QRVendClasse.SetVariable('MONTA_NA_ROTINA_VENDA','TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.FmOperacao19.MeOperacao.Text));
      QRVendClasse.SetVariable('MONTA_NA_ROTINA_DEVOLUCAO','TB_NOTA_CAB.COD_OPERACAO = 0 '); // SERVE PARA NAO PEGAR NENHUMA NOTA
     End;                                                                                   // NA ROTINA DE DEVOLUCAO QUANDO INFORMADO A OPERACAO


    QRVendClasse.Open;
    If FRVendedorClasse = Nil then
      FRVendedorClasse := TFRVendedorClasse.Create(Application);
    FRVendedorClasse.QRLTitulo.Caption := 'Mapa de Vendas P/Vendedor/Classe/Cond Pagto '+ FNotaSaidaParam.ME18DataI.Text+' até '+FNotaSaidaParam.ME18DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRVendedorClasse.QRPrimario.Preview
    Else
      FRVendedorClasse.QRPrimario.Print;
    QRVendClasse.Close;
  End;

end;

procedure TFNotaSaidaCad.QContaCorrenteAberto1Click(Sender: TObject);
Var wSql : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[19].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    If (Trim(FNotaSaidaParam.ME19Valor.Text) <> '') And
       (Trim(FNotaSaidaParam.ME19ValorMaior.Text) <> '') then
       Raise Exception.Create('Somente informar Opção de valores maior ou menor que...');
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text),'VENDA');
    QRContaCorrente2.Close;
    QRContaCorrente2.Sql.Clear;
    wSql := 'SELECT SUM(SVAL_TOTAL) AS VAL_TOTAL,VAL_AVISTA,COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ';
    wSql := wSql + 'FROM (SELECT SUM(Tb_nota_item.VAL_TOTAL-Tb_nota_item.VAL_DESCONTO) SVAL_TOTAL, ';
    wSql := wSql + 'TB_NOTA_CAB.COD_CADASTRO,VAL_AVISTA,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
    wSql := wSql + 'FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_FILIAL WHERE ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
    wSql := wSql + 'TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO  AND ';
    wSql := wSql + 'TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL AND ';
    wSql := wSql + 'TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39) + ' AND ';
    wSql := wSql + 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3 ';
    wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ';
    If Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text) <> ''   then
      wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial20.MeFilial.Text);
    If Trim(FNotaSaidaParam.ME19CodCadastro.Text) <> ''   then
      wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME19CodCadastro.Text);
    Case FNotaSaidaParam.Rg19TipoNota.ItemIndex Of
      0 : wSql := wSql + ' And TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'E' + chr(39);
      1 : wSql := wSql + ' And TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + chr(39) + 'S' + chr(39);
    End;
    If Trim(FNotaSaidaParam.ME19DtInicial.Text) <> '' Then
      wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtInicial.Text) + chr(39);
    If Trim(FNotaSaidaParam.ME19DtFinal.Text) <> '' Then
      wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtFinal.Text) + chr(39);
    wSql := wSql + ' GROUP BY VAL_AVISTA,TB_NOTA_CAB.COD_CADASTRO,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
    If Trim(FNotaSaidaParam.ME19Valor.Text) <> ''   then
       wSql := wSql + ' ) WHERE VAL_TOTAL < ' + (FNotaSaidaParam.ME19Valor.Text)
    Else
      If Trim(FNotaSaidaParam.ME19ValorMaior.Text) <> ''   then
         wSql := wSql + ' ) WHERE VAL_TOTAL > ' + (FNotaSaidaParam.ME19ValorMaior.Text)
      Else
         wSql := wSql + ' )';
    wSql := wSql + ' GROUP BY VAL_AVISTA,COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ORDER BY NOME';
    QRContaCorrente2.Sql.Add(wSql);
    QRContaCorrente2.Open;
    If FRContaCorrente2 = Nil then
      FRContaCorrente2 := TFRContaCorrente2.Create(Application);
    FRContaCorrente2.QRLTitulo.Caption := 'Conta Corrente de '+ FNotaSaidaParam.ME19DtInicial.Text+' até '+FNotaSaidaParam.ME19DtFinal.Text + ' Valor Menor Que:'+FNotaSaidaParam.ME19Valor.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRContaCorrente2.QRPrimario.Preview
    Else
      FRContaCorrente2.QRPrimario.Print;
    QRContaCorrente2.Close;
  End;
end;

procedure TFNotaSaidaCad.RRecibodeComisso1Click(Sender: TObject);
var
  wSQL :String;
begin
  inherited;

  if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE') or
     (DMParamSistema.QParamSistemaCod_Empresa.Text = 'ZADIMEL') then
  begin
    wSQL:=
    'SELECT'+
    ' Tb_vendedor.COD_VENDEDOR,'+
    ' Tb_vendedor.PERC_IRRF,'+
    ' Tb_vendedor.NOME AS NOME_VENDEDOR,'+
    ' Tb_nota_cab.COD_SERIE,'+
    ' Tb_filial.COD_FILIAL,'+
    ' Tb_filial.DESC_FILIAL, '+
    ' Tb_vendedor.DESC_CIDADE, '+
    ' Tb_vendedor.DESC_CEP,'+
    ' Tb_vendedor.DESC_ENDERECO,'+
    ' Tb_vendedor.DESC_CPF NUM_CGC,'+
    ' Tb_vendedor.DESC_TELEFONE,'+
    ' Tb_vendedor.COD_ESTADO,'+
    ' SUM(Decode(TB_OPERACAO.IND_VENDAS,'+chr(39)+'V'+chr(39)+',Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO,'+
                                         '(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO)*-1)) AS SVAL_TOTAL,'+
    ' SUM((Decode(TB_OPERACAO.IND_VENDAS,'+chr(39)+'V'+chr(39)+',Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO,'+
                                         ' (Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO)*-1)) * Tb_nota_item.PERC_COMISSAO / 100) AS Sval_comissao'+
  ' FROM'+
    ' TB_NOTA_CAB,'+
    ' TB_NOTA_ITEM,'+
    ' TB_OPERACAO,'+
    ' TB_FILIAL,'+
    ' TB_VENDEDOR'+
  ' WHERE'+
    ' TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'+
    ' AND'+
    ' Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'+
    ' AND'+
    ' Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'+
    ' AND'+
    ' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'+
    ' AND'+
    ' TB_NOTA_CAB.IND_SITUACAO = '+chr(39)+'2'+chr(39)+
    ' AND'+
    ' ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR (TB_NOTA_CAB.PERC_COMISSAO > 0))'+
    ' AND'+
    ' ((TB_OPERACAO.IND_VENDAS = '+chr(39)+'V'+chr(39)+') OR (TB_OPERACAO.IND_VENDAS = '+chr(39)+'D'+chr(39)+'))'+
    ' AND'+
    ' TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'+
    ' AND'+
    ' TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'+
    ' AND'+
    ' (:VENDEDOR IS NULL OR'+
      ' TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'+
    ' AND'+
    ' (:SERIE IS NULL OR'+
      ' TB_NOTA_CAB.COD_SERIE = :SERIE)'+
    ' AND'+
    ' (:SERIE1 IS NULL OR'+
      ' TB_NOTA_CAB.COD_SERIE = :SERIE1)'+
    ' AND'+
    ' (:VENDEDOR_PREPOSTO IS NULL OR'+
      ' TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'+
    ' AND'+
    ' (:FILIAL IS NULL OR'+
      ' TB_NOTA_CAB.COD_FILIAL = :FILIAL)'+
  ' GROUP BY'+
    ' Tb_vendedor.COD_VENDEDOR,'+
    ' Tb_vendedor.PERC_IRRF,'+
    ' Tb_vendedor.NOME,'+
    ' Tb_filial.COD_FILIAL,'+
    ' Tb_nota_cab.COD_SERIE,'+
    ' Tb_filial.DESC_FILIAL,'+
    ' Tb_vendedor.DESC_CIDADE,'+
    ' Tb_vendedor.DESC_CEP,'+
    ' Tb_vendedor.DESC_ENDERECO,'+
    ' Tb_vendedor.DESC_CPF,'+
    ' Tb_vendedor.DESC_TELEFONE,'+
    ' Tb_vendedor.COD_ESTADO ';
  end
  else
  begin
    wSQL:=
    'SELECT'+
    ' Tb_vendedor.COD_VENDEDOR,'+
    ' Tb_vendedor.PERC_IRRF,'+
    ' Tb_vendedor.NOME AS NOME_VENDEDOR,'+
    ' Tb_nota_cab.COD_SERIE,'+
    ' Tb_filial.COD_FILIAL,'+
    ' Tb_filial.DESC_FILIAL, '+
    ' Tb_vendedor.DESC_CIDADE, '+
    ' Tb_vendedor.DESC_CEP,'+
    ' Tb_vendedor.DESC_ENDERECO,'+
    ' Tb_vendedor.DESC_CPF NUM_CGC,'+
    ' Tb_vendedor.DESC_TELEFONE,'+
    ' Tb_vendedor.COD_ESTADO,'+
    ' SUM(Decode(TB_OPERACAO.IND_VENDAS,'+chr(39)+'V'+chr(39)+',Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO,'+
                                         '(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO)*-1)) AS SVAL_TOTAL,'+
    ' SUM((Decode(TB_OPERACAO.IND_VENDAS,'+chr(39)+'V'+chr(39)+',Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO,'+
                                         ' (Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO)*-1)) * Tb_nota_cab.PERC_COMISSAO / 100) AS Sval_comissao'+
  ' FROM'+
    ' TB_NOTA_CAB,'+
    ' TB_NOTA_ITEM,'+
    ' TB_OPERACAO,'+
    ' TB_FILIAL,'+
    ' TB_VENDEDOR'+
  ' WHERE'+
    ' TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'+
    ' AND'+
    ' Tb_nota_cab.COD_FILIAL = Tb_filial.COD_FILIAL'+
    ' AND'+
    ' Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR'+
    ' AND'+
    ' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB'+
    ' AND'+
    ' TB_NOTA_CAB.IND_SITUACAO = '+chr(39)+'2'+chr(39)+
    ' AND'+
    ' ((TB_NOTA_ITEM.PERC_COMISSAO > 0) OR (TB_NOTA_CAB.PERC_COMISSAO > 0))'+
    ' AND'+
    ' ((TB_OPERACAO.IND_VENDAS = '+chr(39)+'V'+chr(39)+') OR (TB_OPERACAO.IND_VENDAS = '+chr(39)+'D'+chr(39)+'))'+
    ' AND'+
    ' TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I'+
    ' AND'+
    ' TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F'+
    ' AND'+
    ' (:VENDEDOR IS NULL OR'+
      ' TB_NOTA_CAB.COD_VENDEDOR = :VENDEDOR)'+
    ' AND'+
    ' (:SERIE IS NULL OR'+
      ' TB_NOTA_CAB.COD_SERIE = :SERIE)'+
    ' AND'+
    ' (:SERIE1 IS NULL OR'+
      ' TB_NOTA_CAB.COD_SERIE = :SERIE1)'+
    ' AND'+
    ' (:VENDEDOR_PREPOSTO IS NULL OR'+
      ' TB_NOTA_CAB.COD_VENDEDOR_PREPOSTO = :VENDEDOR_PREPOSTO)'+
    ' AND'+
    ' (:FILIAL IS NULL OR'+
      ' TB_NOTA_CAB.COD_FILIAL = :FILIAL)'+
  ' GROUP BY'+
    ' Tb_vendedor.COD_VENDEDOR,'+
    ' Tb_vendedor.PERC_IRRF,'+
    ' Tb_vendedor.NOME,'+
    ' Tb_filial.COD_FILIAL,'+
    ' Tb_nota_cab.COD_SERIE,'+
    ' Tb_filial.DESC_FILIAL,'+
    ' Tb_vendedor.DESC_CIDADE,'+
    ' Tb_vendedor.DESC_CEP,'+
    ' Tb_vendedor.DESC_ENDERECO,'+
    ' Tb_vendedor.DESC_CPF,'+
    ' Tb_vendedor.DESC_TELEFONE,'+
    ' Tb_vendedor.COD_ESTADO ';
  end;

  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[20].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  begin
   With DMRelatorio_Venda do
   Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text),'VENDA');
      QRReciboComissao.Close;
      QRReciboComissao.SQL.Clear;
      QRReciboComissao.SQL.add(wSQL);

      QRReciboComissao.SetVariable('DATA_I',FNotaSaidaParam.ME20DtInicial.Text);
      QRReciboComissao.SetVariable('DATA_F',FNotaSaidaParam.ME20DtFinal.Text);
      If Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text) = ''   then
        QRReciboComissao.SetVariable('FILIAL',Null)
      Else
        QRReciboComissao.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial21.MeFilial.Text));
      If Trim(FNotaSaidaParam.FmVendedor21.MeVendedor.Text)= ''   then
        QRReciboComissao.SetVariable('VENDEDOR',Null)
      Else
        QRReciboComissao.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor21.MeVendedor.Text));
      If Trim(FNotaSaidaParam.FmVendedorPreposto21.MeVendedor.Text)= ''   then
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO',Null)
      Else
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto21.MeVendedor.Text));
      if Trim(FNotaSaidaParam.Ed20Serie.Text) = ''   then
        QRReciboComissao.SetVariable('SERIE',Null)
      else
        QRReciboComissao.SetVariable('SERIE',Trim(FNotaSaidaParam.Ed20Serie.Text));
      if Trim(FNotaSaidaParam.Ed20Serie1.Text) = ''   then
        QRReciboComissao.SetVariable('SERIE1',Null)
      else
        QRReciboComissao.SetVariable('SERIE1',Trim(FNotaSaidaParam.Ed20Serie1.Text));
      QRReciboComissao.Open;
      If FReciboComissao2 = Nil then
        FReciboComissao2 := TFReciboComissao2.Create(Application);
      FReciboComissao2.QRLHistorico.Caption := FNotaSaidaParam.Me20Historico.Text;
      FReciboComissao2.QRLData.Caption := FormatDateTime('dd", de" mmmm "de" yyyy"."',StrToDate(FNotaSaidaParam.Me20DtFinal.Text));
      If (Trim(FNotaSaidaParam.Ed20Serie.Text) = 'PE') OR
         (Trim(FNotaSaidaParam.Ed20Serie1.Text) = 'PE') then
       Begin
         FReciboComissao2.QRlabel6.Font.Color := ClwHite;
         FReciboComissao2.QRDBText8.Font.Color := ClwHite;
         FReciboComissao2.QRlabel9.Font.Color := ClwHite;
         FReciboComissao2.QRDBText14.Font.Color := ClwHite;
       End
      Else
       Begin
         FReciboComissao2.QRlabel6.Font.Color := ClWindowText;
         FReciboComissao2.QRDBText8.Font.Color := ClWindowText;
         FReciboComissao2.QRlabel9.Font.Color := ClWindowText;
         FReciboComissao2.QRDBText14.Font.Color := ClWindowText;
       End;
      If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FReciboComissao2.QRPrimario.Preview
      Else
        FReciboComissao2.QRPrimario.Print;
      QRReciboComissao.Close;
    End;
  End;
End;

procedure TFNotaSaidaCad.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
   Begin
     dbRadioGroup2.Items.add('Conta Corrente');
     dbRadioGroup2.Items.add('Cartão');
   End
  else
     dbRadioGroup2.Items.add('Outros');
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRIPAR')) Then
   Begin
     DbEdit72.DataField := 'Num_Volumes';
     Label75.Caption := 'Nr. Volumes';
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'INJEPAR' Then
  begin
//    DBEdit55.Width := 98;
    DBEdit55.Visible := False;
    LBrutoPeca.Visible := True;
    LBrutoServico.Visible := True;
    DBEBrutoPeca.Visible := True;
    DBEBrutoServico.Visible := True;
    DBENumFabricante.Visible := True;
    DBEComplemento.Top := DBEdit55.Top;
    DBEComplemento.Left := DBEdit55.Left + 72;
    DBEComplemento.Width := DBEdit55.Width - 72;
    DBENumFabricante.Top := DBEdit55.Top;
    DBENumFabricante.Left := DBEdit55.Left;
    DBENumFabricante.Width := 70;
    DBEComplemento.Visible := True;
//    DBEComplemento.Anchors := [akLeft,akTop,akRight];
    DBGItens.Columns.Items[1].FieldName := 'DESC_COMPLEMENTO';

    LblBeneficiado.Visible := False;
    DBEBeneficiado.Visible := False;
    LblPlaca.Visible := True;
    DBEPlaca.Visible := True;
    LblPlaca.Left := LblValFrete.Left;
    LblPlaca.Top := LblValFrete.Top;
    DBEPlaca.Left := DBEValFrete.Left;
    DBEPlaca.Top := DBEValFrete.Top;
    DBEPlaca.Width := DBEValFrete.Width;
    LblValFrete.Left := LblBeneficiado.Left;
    LblValFrete.Top := LblBeneficiado.Top;
    DBEValFrete.Left := DBEBeneficiado.Left;
    DBEValFrete.Top := DBEBeneficiado.Top;
  end;
end;

procedure TFNotaSaidaCad.SRelatrioVendasComCheque1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text),'VENDA');
    QRNota_ComCheque.Close;
    QRNota_ComCheque.SetVariable('DATA_I',FNotaSaidaParam.ME11DataI.Text);
    QRNota_ComCheque.SetVariable('DATA_F',FNotaSaidaParam.ME11DataF.Text);

    QRNota_ComCheque.SetVariable('PRAZO1',FNotaSaidaParam.ME11Prazo1.Text);
    QRNota_ComCheque.SetVariable('PRAZO2',FNotaSaidaParam.ME11Prazo2.Text);
    QRNota_ComCheque.SetVariable('PRAZO3',FNotaSaidaParam.ME11Prazo3.Text);
    QRNota_ComCheque.SetVariable('PRAZO4',FNotaSaidaParam.ME11Prazo4.Text);

    If Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text)= ''   then
      QRNota_ComCheque.SetVariable('FILIAL',Null)
    Else
      QRNota_ComCheque.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial12.MeFilial.Text));
    QRNota_ComCheque.Open;
    If FRNota_ComCheque = Nil then
      FRNota_ComCheque := TFRNota_ComCheque.Create(Application);

    FRNota_ComCheque.QRLTitulo.Caption := 'Vendas Com Cheques de '+ FNotaSaidaParam.ME11DataI.Text+' até '+FNotaSaidaParam.ME11DataF.Text;
    FRNota_ComCheque.QRLPrazo1.Caption := 'Até '+FNotaSaidaParam.ME11Prazo1.Text+'d.';
    FRNota_ComCheque.QRLPrazo2.Caption := 'Até '+FNotaSaidaParam.ME11Prazo2.Text+'d.';
    FRNota_ComCheque.QRLPrazo3.Caption := 'Até '+FNotaSaidaParam.ME11Prazo3.Text+'d.';
    FRNota_ComCheque.QRLPrazo4.Caption := 'Até '+FNotaSaidaParam.ME11Prazo4.Text+'d.';
    FRNota_ComCheque.QRLLongoPrazo.Caption := '+ de '+FNotaSaidaParam.ME11Prazo4.Text+'d.';

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ComCheque.QRPrimario.Preview
    Else
      FRNota_ComCheque.QRPrimario.Print;
    QRNota_ComCheque.Close;
  End;

end;

procedure TFNotaSaidaCad.TRelatrioMaioresClientes1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[21].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text),'VENDA');
    QRMaioresClientes.Close;
    QRMaioresClientesVend.Close;
    QRMaioresClientes.SetVariable('DATA_I',FNotaSaidaParam.ME21DataI.Text);
    QRMaioresClientes.SetVariable('DATA_F',FNotaSaidaParam.ME21DataF.Text);
    QRMaioresClientesVend.SetVariable('DATA_I',FNotaSaidaParam.ME21DataI.Text);
    QRMaioresClientesVend.SetVariable('DATA_F',FNotaSaidaParam.ME21DataF.Text);
    If Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('FILIAL',Null);
      QRMaioresClientesVend.SetVariable('FILIAL',Null)
    end
    Else
    Begin
      QRMaioresClientes.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text));
      QRMaioresClientesVend.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial22.MeFilial.Text))
    End;

    If Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR',Null);
      QRMaioresClientesVend.SetVariable('VENDEDOR',Null)
    End
    Else
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text));
      QRMaioresClientesVend.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor22.MeVendedor.Text))
    End;

    If Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO',Null);
      QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO',Null)
    End
    Else
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text));
      QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto22.MeVendedor.Text))
    End;

    If FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex] = 'TODOS'   then
      Begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO',Null);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO',Null)
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO',FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex]);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO',FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex])
      End;
    If Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text) = ''   then
      Begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO',Null);
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO',Null);
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO',Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text));
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO',Trim(FNotaSaidaParam.FmTipoCadastro22.MeTipoCadastro.Text));
      End;
    If Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text) = ''   then
      Begin
        QRMaioresClientes.SetVariable('SUPERVISOR',Null);
        QRMaioresClientesVend.SetVariable('SUPERVISOR',Null);
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text));
        QRMaioresClientesVend.SetVariable('SUPERVISOR',Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text));
      End;
    If Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text) = ''   then
      Begin
        QRMaioresClientes.SetVariable('COD_DEPARTAMENTO',Null);
        QRMaioresClientesVend.SetVariable('COD_DEPARTAMENTO',Null);
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('COD_DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text));
        QRMaioresClientesVend.SetVariable('COD_DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento22.MeDepartamento.Text));
      End;
    If Trim(FNotaSaidaParam.Me21Serie.Text) = ''   then
      Begin
        QRMaioresClientes.SetVariable('COD_SERIE',Null);
        QRMaioresClientesVend.SetVariable('COD_SERIE',Null);
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('COD_SERIE',Trim(FNotaSaidaParam.Me21Serie.Text));
        QRMaioresClientesVend.SetVariable('COD_SERIE',Trim(FNotaSaidaParam.Me21Serie.Text));
      End;
    QRMaioresClientes.SQL[QRMaioresClientes.SQL.Count-1]:='';          // elimina a última Linha da SQL
    QRMaioresClientesVend.SQL[QRMaioresClientesVend.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.RG21Tipo.ItemIndex of
      0 :
        Begin
          QRMaioresClientes.SQL.Add('Order By sVal_Total Desc');
          QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, SVAL_TOTAL DESC');
        End;
      1 :
        Begin
          QRMaioresClientes.SQL.Add('Order By sQt_Quantidade Desc');
          QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, sQt_Quantidade Desc');
        End;
    End;
    QRMaioresClientes.Open;
    QRMaioresClientesVend.Open;
    If FRMaioresClientes = Nil then
      FRMaioresClientes := TFRMaioresClientes.Create(Application);
    FRMaioresClientes.QRLTitulo.Caption := 'Relacao de Maiores Clientes de '+ FNotaSaidaParam.ME21DataI.Text+' até '+FNotaSaidaParam.ME21DataF.Text;
    FRMaioresClientes.QRLSupervisor.Caption := 'Supervisor : '+ Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text)+' '+Trim(FNotaSaidaParam.FmSupervisor22.EdVendedor.Text);
    If FRMaioresClientesVend = Nil then
      FRMaioresClientesVend := TFRMaioresClientesVend.Create(Application);
    FRMaioresClientesVend.QRLTitulo.Caption := 'Relação de Maiores Clientes de '+ FNotaSaidaParam.ME21DataI.Text+' até '+FNotaSaidaParam.ME21DataF.Text;
    FRMaioresClientesVend.QRLSupervisor.Caption := 'Supervisor : '+ Trim(FNotaSaidaParam.FmSupervisor22.MeVendedor.Text)+' '+Trim(FNotaSaidaParam.FmSupervisor22.EdVendedor.Text);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRMaioresClientes.QRCompositeReport1.Preview
     //QRGVendedorCMedio.Preview
    Else
      FRMaioresClientes.QRCompositeReport1.Print;

    QRMaioresClientes.Close;
    QRMaioresClientesVend.Close;
  End;

end;

procedure TFNotaSaidaCad.VResumoProdutosPorCliente1Click(Sender: TObject);
Var wSql : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[23].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text),'VENDA');
    QRResumoCliente.Close;
    QRResumoCliente.Sql.Clear;
    wsql := 'SELECT STIPO,COD_PRODUTO,NUM_EMBALAGEM,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES,';
    wSql := wSql + 'Sum(SQT_QUANTIDADE) as SQT_QUANTIDADE,Sum(SVAL_TOTAL) as SVAL_TOTAL FROM ( ';

    wSql := wSql + 'SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO + 0.00 AS COD_PRODUTO, TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO + 0.00 AS COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR + 0.00 AS COD_VENDEDOR,Tb_nota_cab.NUM_NOTA + 0.00 AS NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) + 0.00 as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'S' + CHR(39);
    wSql := wSql + ' AND TB_OPERACAO.IND_BONIFICACAO <> ' + CHR(39) + 'S' + CHR(39);
    if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
    if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
    if Trim(FNotaSaidaParam.FmOperacao24.MeOperacao.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.FmOperacao24.MeOperacao.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
      wSql := wSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
    if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);

    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+'))  UNION ALL ';
    wSql := wSql + 'SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO, TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) * (-1) as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) * (-1) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'E' + CHR(39);
    wSql := wSql + ' AND TB_OPERACAO.IND_VENDAS = ' + CHR(39) + 'D' + CHR(39);
    if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
    if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
      wSql := wSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
    if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);

    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+'))  UNION ALL ';

    wSql := wSql + 'SELECT ' + CHR(39) + 'BONIFICAÇÃO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO,TB_PRODUTO.NUM_EMBALAGEM, Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_OPERACAO.IND_BONIFICACAO = ' + CHR(39) + 'S' + CHR(39);
    if Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.FmVendedor24.MeVendedor.Text);
    if Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial24.MeFilial.Text);
    if Trim(FNotaSaidaParam.FmOperacao24.MeOperacao.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.FmOperacao24.MeOperacao.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text) <> '' then
      wSql := wSql + 'AND TB_CADASTRO.COD_RAMO = ' + Trim(FNotaSaidaParam.FmRamo24.MeRamo.Text);
    if Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto24.MeProduto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);
    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,TB_PRODUTO.NUM_EMBALAGEM,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) ';
    wSql := wSql + ') GROUP BY STIPO,COD_PRODUTO,NUM_EMBALAGEM,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES ';
    wSql := wSql + ' ORDER BY COD_VENDEDOR, NOMECADASTRO,DT_MES,STIPO ';
    QRResumoCliente.Sql.Add(wSql);
    QRResumoCliente.Open;
    if FRResumoCliente = nil then
       FRResumoCliente := TFRResumoCliente.Create(Application);

    FRResumoCliente.QRLTitulo.Caption := 'Resumo Operação por Cliente de '+ FNotaSaidaParam.ME23DataI.Text+' até '+FNotaSaidaParam.ME23DataF.Text;
    FRResumoCliente.QRLFilial.Caption := 'Filial: '+ Trim(FNotaSaidaParam.FmFilial24.EdFilial.Text);
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRResumoCliente.QRPrimario.Preview
    else
      FRResumoCliente.QRPrimario.Print;
    QRResumoCliente.Close;
  end;
end;

procedure TFNotaSaidaCad.XFuturaEmprstimoConsignaoDepsitoPNota1Click(
  Sender: TObject);
var wNomeRelatorio,wSql:String;
begin
  inherited;
  if FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRFutura_Cliente.Close;
    QRFutura_Cliente.Sql.Clear;
    wSql := 'SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,';
    wSql := wSql + 'Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,';
    wSql := wSql + 'Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO) AS COD_CADASTRO,';
    wSql := wSql + 'TB_LOTE_TIPO.DESC_LOTE,Tb_nota_cab.DT_EMISSAO,Tb_nota_item.COD_LOTE_TIPO,Tb_nota_cab.VAL_FUNRURAL,';
    wSql := wSql + 'Tb_nota_item.VAL_UNITARIO,DECODE(Tb_nota_cab.VAL_DESCONTO,0,0,Tb_nota_item.VAL_DESCONTO / Tb_nota_item.QT_QUANTIDADE) AS VAL_DESCONTO, ';
    wSql := wSql + 'Tb_vendedor.NOME as NOME_VENDEDOR ';
    wSql := wSql + 'FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_NOTA_AUX,TB_VENDEDOR,TB_PRODUTO,TB_LOTE_TIPO,TB_CLASSE ';
    wSql := wSql + 'WHERE TB_LOTE_TIPO.COD_LOTE_TIPO = TB_NOTA_ITEM.COD_LOTE_TIPO AND ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
    wSql := wSql + 'Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO AND ';
    wSql := wSql + 'Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) AND ';
    wSql := wSql + 'QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ';
    wSql := wSql + 'TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE AND ';
    Case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
       0 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'COM_FUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Compra Futura';
           End;
       1 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'VEN_FUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Venda Futura';
           End;
       2 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_FOR' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
           End;
       3 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_CLI' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
           End;
       4 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_FOR' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
           End;
       5 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_CLI' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
           End;
       6 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_EMP' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
           End;
       7 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_OUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Deposito em Outras Empresas';
           End;
       Else
         Raise Exception.Create('Nenhum tipo de Futura selecionado!');
    End;
    If Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text);
    If Trim(FNotaEntradaParam.FmFornecedor3.MeCadastro.Text) <> '' then
       wSql := wSql + ' And TB_PRODUTO.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmFornecedor3.MeCadastro.Text);
    If Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text);
    If Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text);
    If Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text);
    If Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text);
    If Trim(FNotaEntradaParam.ME2DataI.Text) <> '' Then
       wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO >= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39);
    If Trim(FNotaEntradaParam.ME2DataF.Text) <> '' Then
       wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO <= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39);
    If Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text) <> '' then
       wSql := wSql + ' And TB_CLASSE.NUM_CLASSE = ' + Trim(FNotaEntradaParam.FmClasse3.MeClasse.Text);
    If Trim(FNotaEntradaParam.ME2SubClasse.Text) <> '' then
       wSql := wSql + ' And TB_CLASSE.NUM_SUBCLASSE = ' + Trim(FNotaEntradaParam.ME2SubClasse.Text);
    //if (Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) <> '') then
    //   wSql := wSql + ' AND ((TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) +
    //   ') OR (TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro_Alfandegado3.MeCadastro.Text) + '))';
    If FNotaEntradaParam.Rg2QuebraVendedor.ItemIndex = 0 Then
       wSql := wSql + ' ORDER BY Tb_vendedor.NOME,DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_nota_cab.NUM_NOTA '
    Else
       wSql := wSql + ' ORDER BY DECODE(TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO,NULL,TB_NOTA_CAB.COD_CADASTRO,TB_NOTA_CAB.COD_ARMAZEM_ALFANDEGADO),Tb_nota_cab.NUM_NOTA ';
    QRFutura_Cliente.SQL.Add(wSql);
    QRFutura_Cliente.Open;
    If FRNota_VendaFutura = Nil then
      FRNota_VendaFutura := TFRNota_VendaFutura.Create(Application);
    If FNotaEntradaParam.Rg2QuebraVendedor.ItemIndex = 0 Then
     Begin
       FRNota_VendaFutura.QRGroup1.Enabled := True;
       FRNota_VendaFutura.QRBand6.Enabled := True;
     End
    Else
     Begin
       FRNota_VendaFutura.QRGroup1.Enabled := False;
       FRNota_VendaFutura.QRBand6.Enabled := False;
     End;
    FRNota_VendaFutura.QRLTitulo.Caption := wNomeRelatorio;
    FRNota_VendaFutura.QRLFilial.Caption := 'Filial:'+ Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text)+' - '+FNotaEntradaParam.FmFilial3.EdFilial.Text;
    FRNota_VendaFutura.QRLVendedor.Caption := 'Vendedor:'+Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text) + ' De ' + FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
    FRNota_VendaFutura.QRLClasse.Caption := 'Classe:'+Trim(FNotaEntradaParam.FmClasse3.EdClasse.Text) + ' SubClasse: ' + FNotaEntradaParam.Ed2SubClasse.Text;
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendaFutura.QRPrimario.Preview
    Else
      FRNota_VendaFutura.QRPrimario.Print;
    QRFutura_Cliente.Close;
  End;
end;

procedure TFNotaSaidaCad.ZRelatrioHistricoCliente1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[24].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text),'VENDA');
    QRVendaHistorico.Close;
    QRReceberHistorico.Close;
    QRReceber_Titulos.Close;
    QRVendaHistorico.Sql.Clear;
    QRVendaHistorico.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
    QRVendaHistorico.Sql.Add('Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME,');
    QRVendaHistorico.Sql.Add('sum(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS) as val_total ');
    QRVendaHistorico.Sql.Add(' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE ');
    QRVendaHistorico.Sql.Add(' (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ');
    QRVendaHistorico.Sql.Add(' AND (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
    If Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text) <> ''   then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text));
    If Trim(FNotaSaidaParam.ME24Cadastro.Text) <> ''   then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
    If Trim(FNotaSaidaParam.ME24DataI.Text) <> '' Then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
    If Trim(FNotaSaidaParam.ME24DataF.Text) <> '' Then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));
    QRVendaHistorico.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
    QRVendaHistorico.Sql.Add(' Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME ORDER BY NOME,COD_CADASTRO,DT_EMISSAO ');
    QRReceber_Titulos.Sql.Clear;
    QRReceber_Titulos.Sql.Add('SELECT Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,');
    QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.VAL_TITULO,');
    QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,Tb_conta_receber_cab.COD_CADASTRO,Tb_cadastro.NOME FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO ');
    QRReceber_Titulos.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
    QRReceber_Titulos.Sql.Add(' AND (Tb_conta_receber_cab.COD_NOTA_CAB IS NULL) ');
    If Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text) <> ''   then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial25.MeFilial.Text));
    If Trim(FNotaSaidaParam.ME24Cadastro.Text) <> ''   then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
    If Trim(FNotaSaidaParam.ME24DataI.Text) <> '' Then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
    If Trim(FNotaSaidaParam.ME24DataF.Text) <> '' Then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));

    QRVendaHistorico.Open;
    QRReceberHistorico.Open;
    QRReceber_Titulos.Open;
    If FRVendaHistorico = Nil then
      FRVendaHistorico := TFRVendaHistorico.Create(Application);
    If FRTitulos = Nil then
      FRTitulos := TFRTitulos.Create(Application);
    FRVendaHistorico.QRLTitulo.Caption := 'Historico de Vendas Por Cliente de '+ FNotaSaidaParam.ME24DataI.Text+' até '+FNotaSaidaParam.ME24DataF.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendaHistorico.QRCompositeReport1.Preview
//      FRVendaHistorico.QRPrimario.Preview
    Else
       FRVendaHistorico.QRCompositeReport1.Print;
//      FRVendaHistorico.QRPrimario.Print;
    QRVendaHistorico.Close;
    QRReceberHistorico.Close;
  End;
end;

procedure TFNotaSaidaCad.DBEClienteExit(Sender: TObject);   
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  If DMParamSistema.QparamSistemaCod_Empresa.Value = 'GRASEL' Then
     FPedidoCons.MEDataI.Text := '01/01/2008'
  Else
     FPedidoCons.MEDataI.Text := DateToStr(Date-180);
  FPedidoCons.BtProcurarClick(Self);
  If DMPedido.QPedidoConsCod_Pedido_Cab.Value > 0  Then
  Begin
    BtImpPedClick(Self);
    FPedidoCons.METexto.Enabled := True;
  End;
  MsgAutoriza;  //mostra na tela as pessoas autorizadas a comprar
  DBEdit11.SetFocus;
end;

procedure TFNotaSaidaCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
    if (DMParamSistema.QparamSistemaCod_Empresa.Value = 'INJEPAR') then
    begin
      DMNotaSaida.QItemNF.Append;
      Key := #0;
    end
    else
      DbNavigator1.BtnClick(NbInsert);
    DbEdit54.SetFocus;
  End;
  If (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'DINIZ')
    and (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'INJEPAR') Then
  begin
    If Key = Chr(45) Then
    Begin
      DbNavigator1.BtnClick(NbDelete);
      DbEdit54.SetFocus;
    End;
  End;
end;

procedure TFNotaSaidaCad.QuantVendidaporItensporVendedor1Click(
  Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[25].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
  Begin
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text),'VENDA');
    QRVendasPorVendedor.close;
    QRVendasPorVendedor.SetVariable('DATA_I',FNotaSaidaParam.ME25DataI.Text);
    QRVendasPorVendedor.SetVariable('DATA_F',FNotaSaidaParam.ME25DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text)= ''   then
       QRVendasPorVendedor.SetVariable('FILIAL',Null)
    Else
       QRVendasPorVendedor.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial26.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmVendedor26.MeVendedor.Text)= ''   then
       QRVendasPorVendedor.SetVariable('VENDEDOR',Null)
    Else
       QRVendasPorVendedor.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor26.MeVendedor.Text));

     If Trim(FNotaSaidaParam.FmVendedorPreposto26.MeVendedor.Text)= ''   then
       QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
       QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto26.MeVendedor.Text));

    QRVendasPorVendedor.Open;
    If FRVendasPorVendedor = Nil then
       FRVendasPorVendedor := TFRVendasPorVendedor.Create(Application);
    FRVendasPorVendedor.QRLTitulo.Caption := 'Quantidade Vendida por Vendedor '+FNotaSaidaParam.ME25DataI.Text+' até '+FNotaSaidaParam.ME25DataF.Text;
    FRVendasPorVendedor.QRLFilial.Caption := 'Filial:'+Trim(FNotaSaidaParam.FmFilial26.EdFilial.Text);

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendasPorVendedor.QRPrimario.Preview
    Else
       FRVendasPorVendedor.QRPrimario.Print;
    QRVendasPorVendedor.Close;
  end
end;

procedure TFNotaSaidaCad.Vendasporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[26].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME26Filial.Text),'VENDA');
    QRVendasVndRegiao.close;
    QRVendasVndRegiao.SetVariable('DATA_I',FNotaSaidaParam.ME26DataI.Text);
    QRVendasVndRegiao.SetVariable('DATA_F',FNotaSaidaParam.ME26DataF.Text);
    if Trim(FNotaSaidaParam.ME26Filial.Text) = ''   then
       QRVendasVndRegiao.SetVariable('FILIAL',Null)
    else
       QRVendasVndRegiao.SetVariable('FILIAL',FNotaSaidaParam.ME26Filial.Text);
    if Trim(FNotaSaidaParam.FmVendedor27.MeVendedor.Text) = ''   then
       QRVendasVndRegiao.SetVariable('VENDEDOR',Null)
    else
       QRVendasVndRegiao.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor27.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmVendedorPreposto27.MeVendedor.Text) = ''   then
       QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
       QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto27.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmRegiao27.MeRegiao.Text) = ''   then
       QRVendasVndRegiao.SetVariable('REGIAO',Null)
    else
       QRVendasVndRegiao.SetVariable('REGIAO',Trim(FNotaSaidaParam.FmRegiao27.MeRegiao.Text));
    if Trim(FNotaSaidaParam.FmProduto27.MeProduto.Text) = ''   then
       QRVendasVndRegiao.SetVariable('COD_PRODUTO',Null)
    else
       QRVendasVndRegiao.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto27.MeProduto.Text));
    QRVendasVndRegiao.Open;
    if FRVendasVndRegiao = nil then
       FRVendasVndRegiao := TFRVendasVndRegiao.Create(Application);
    FRVendasVndRegiao.QRLTitulo.Caption := 'Vendas por Vendedor e Região '+FNotaSaidaParam.ME26DataI.Text+' até '+FNotaSaidaParam.ME26DataF.Text;
    FRVendasVndRegiao.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed26Filial.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendasVndRegiao.QRPrimario.Preview
    Else
       FRVendasVndRegiao.QRPrimario.Print;
    QRVendasVndRegiao.Close;
  end

end;

procedure TFNotaSaidaCad.Itensvendidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[27].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text),'VENDA');
    QRVendProdPeriodo.Close;
    QRVendProdPeriodo.SetVariable('DATA_I',FNotaSaidaParam.ME27DataI.Text);
    QRVendProdPeriodo.SetVariable('DATA_F',FNotaSaidaParam.ME27DataF.Text);

    if Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text)= '' then
       QRVendProdPeriodo.SetVariable('FILIAL',Null)
    else
       QRVendProdPeriodo.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial28.MeFilial.Text));

    if Trim(FNotaSaidaParam.FmClasseI28.MeClasse.Text) = '' then
    begin
       MessageDlg('É necessario informar CLASSE!',mtInformation,[mbOK],0);
       Exit;
    end
    else
       QRVendProdPeriodo.SetVariable('CLASSE_I',Trim(FNotaSaidaParam.FmClasseI28.MeClasse.Text));

    if Trim(FNotaSaidaParam.FmClasseF28.MeClasse.Text) = '' then
    begin
       MessageDlg('É necessario informar CLASSE!',mtInformation,[mbOK],0);
       Exit;
    end
    else
      QRVendProdPeriodo.SetVariable('CLASSE_F',Trim(FNotaSaidaParam.FmClasseF28.MeClasse.Text));

    if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
    begin
      QRVendProdPeriodo.SetVariable('IND_COMPRAS',Null);
      QRVendProdPeriodo.SetVariable('IND_VENDAS','V');
    end
    else
    begin
      QRVendProdPeriodo.SetVariable('IND_VENDAS',Null);
      QRVendProdPeriodo.SetVariable('IND_COMPRAS','C');
    end;
    if Trim(FNotaSaidaParam.FmProduto28.MeProduto.Text)= '' then
       QRVendProdPeriodo.SetVariable('PRODUTO',Null)
    else
       QRVendProdPeriodo.SetVariable('PRODUTO',Trim(FNotaSaidaParam.FmProduto28.MeProduto.Text));
    if Trim(FNotaSaidaParam.FmVendedor28.MeVendedor.Text)= '' then
       QRVendProdPeriodo.SetVariable('VENDEDOR',Null)
    else
       QRVendProdPeriodo.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor28.MeVendedor.Text));
    QRVendProdPeriodo.Open;

    if FRVendProdPeriodo = nil then
       FRVendProdPeriodo := TFRVendProdPeriodo.Create(Application);

    // Titulo do relatório
    if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
       FRVendProdPeriodo.QRLTitulo.Caption := 'Venda(s) de Produto(s) no periodo '+FNotaSaidaParam.ME27DataI.Text+' até '+FNotaSaidaParam.ME27DataF.Text
    else
       FRVendProdPeriodo.QRLTitulo.Caption := 'Compra(s) de Produto(s) no periodo '+FNotaSaidaParam.ME27DataI.Text+' até '+FNotaSaidaParam.ME27DataF.Text;

    FRVendProdPeriodo.QRLFilial.Caption := 'Filial:'+Trim(FNotaSaidaParam.FmFilial28.EdFilial.Text);

    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendProdPeriodo.QRPrimario.Preview
    else
       FRVendProdPeriodo.QRPrimario.Print;

    FRVendProdPeriodo.Close;
  end

end;

procedure TFNotaSaidaCad.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaDt_Emissao.Value < Date then
     ShowMessage ('Data de Emissão Menor que Data Atual!');

end;

procedure TFNotaSaidaCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaDt_Recebimento.Value < Date then
     ShowMessage ('Data de Saída Menor que Data Atual!');

end;

procedure TFNotaSaidaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(15);
end;

procedure TFNotaSaidaCad.BtImpItemNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  FNotaSaidaCons.MeTexto.Text:= DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  If FNotaSaidaCons.ShowModal = MrOk then
    Proc_TrazItens(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
end;

procedure TFNotaSaidaCad.VendasPVendedorClasseFornecedor1Click(
  Sender: TObject);
Var wNada : String;
begin
  Inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[29].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME29Filial.Text),'VENDA');
    QRVendaVendClasse.Close;
    QRVendaVendClasse.SetVariable('DATA_I',FNotaSaidaParam.Me29DataI.Text);
    QRVendaVendClasse.SetVariable('DATA_F',FNotaSaidaParam.Me29DataF.Text);
    If Trim(FNotaSaidaParam.ME29Filial.Text)= ''   then
      QRVendaVendClasse.SetVariable('FILIAL',Null)
    Else
      QRVendaVendClasse.SetVariable('FILIAL',FNotaSaidaParam.ME29Filial.Text);
    If Trim(FNotaSaidaParam.ME29Vendedor.Text)= ''   then
      QRVendaVendClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendaVendClasse.SetVariable('VENDEDOR',FNotaSaidaParam.ME29Vendedor.Text);
    If Trim(FNotaSaidaParam.ME29VendedorPreposto.Text)= ''   then
      QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME29VendedorPreposto.Text);
    If Trim(FNotaSaidaParam.ME29ClasseI.Text)= ''   then
      QRVendaVendClasse.SetVariable('CLASSEI',Null)
    Else
      QRVendaVendClasse.SetVariable('CLASSEI',FNotaSaidaParam.ME29ClasseI.Text);
    If Trim(FNotaSaidaParam.ME29SubClasse.Text)= ''   then
      QRVendaVendClasse.SetVariable('SUBCLASSE',Null)
    Else
      QRVendaVendClasse.SetVariable('SUBCLASSE',FNotaSaidaParam.ME29SubClasse.Text);
    If Trim(FNotaSaidaParam.ME29Produto.Text)= ''   then
      QRVendaVendClasse.SetVariable('PRODUTO',Null)
    Else
      QRVendaVendClasse.SetVariable('PRODUTO',FNotaSaidaParam.ME29Produto.Text);
    If Trim(FNotaSaidaParam.Me29Operacao.Text) = ''   then
      wNada := '(TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'V' + Chr(39) + ') Or (TB_OPERACAO.IND_VENDAS = ' + Chr(39) + 'D' + Chr(39) + ')'
    Else
      wNada := 'TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.Me29Operacao.Text);
    QRVendaVendClasse.SetVariable('MONTADO_NA_ROTINA',wNada);
    If FNotaSaidaParam.Rg29Quebra.ItemIndex = 0 Then
       QRVendaVendClasse.SetVariable('IND_QUEBRA','S')
    Else
       QRVendaVendClasse.SetVariable('IND_QUEBRA','N');
    QRVendaVendClasse.Open;
    If FrVendasVendClasse = Nil then
      FrVendasVendClasse := TFrVendasVendClasse.Create(Application);
    If FNotaSaidaParam.Rg29Quebra.ItemIndex = 0 Then
     Begin
       FrVendasVendClasse.QRGroup3.Enabled := True;
       FrVendasVendClasse.QRBand5.Enabled := True;
     End
    Else
     Begin
       FrVendasVendClasse.QRGroup3.Enabled := False;
       FrVendasVendClasse.QRBand5.Enabled := False;
     End;
    FrVendasVendClasse.QRLTitulo.Caption := 'Vendas por Fornecedor/Classe e Vendedor de '+ FNotaSaidaParam.ME29DataI.Text+' até '+FNotaSaidaParam.ME29DataF.Text;
    FrVendasVendClasse.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed29Filial.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FrVendasVendClasse.QRPrimario.Preview
    Else
      FrVendasVendClasse.QRPrimario.Print;
    QRVendaVendClasse.Close;
  End;

end;

procedure TFNotaSaidaCad.DBEdit62Exit(Sender: TObject);
Var wPercICM : Real;
begin
  inherited;
  If Trim(DMNotaSaida.QItemNFCod_Tributacao.Text) <> '' then
  Begin
    wPercICM := StrToFloat( DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(DMNotaSaida.QItemNFCod_Tributacao.Value) ));
    DMNotaSaida.QItemNFVal_ICM.Value := DMNotaSaida.QItemNFVal_ICM_Base.Value*wPercICM/100;
  End;
end;

procedure TFNotaSaidaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QItemNF.Close;
    QSomaItemNota.Close;
    QContaReceber.Close;
    QContaReceberMov.Close;
    QEstoqueBaixa.Close;
    QCaixa.Close;
    QBaixaAux.Close;
    QNotaAux.Close;
    QNotaAuxItNf.Close;
  End;
  Action := CaFree;
  FNotaSaidaCad := Nil;
end;

procedure TFNotaSaidaCad.Clientescomcompranoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[31].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
     DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.MECodFilial31.Text),'VENDA');
     if (Trim(FNotaSaidaParam.MEDataI31.Text) = '') or (Trim(FNotaSaidaParam.MEDataF31.Text) = '') then
        raise exception.Create('É necessario informar periodo para relatório.');
     with DMRelatorio_Venda do
     begin
       QRClienteComCompra.Close;
       if Trim(FNotaSaidaParam.MECodFilial31.Text) = '' then
          QRClienteComCompra.SetVariable('COD_FILIAL',Null)
       else
          QRClienteComCompra.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.MECodFilial31.Text));

       if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
          QRClienteComCompra.SetVariable('COD_VENDEDOR',Null)
       else
          QRClienteComCompra.SetVariable('COD_VENDEDOR',Trim(FNotaSaidaParam.MECodVendedor31.Text));

       If Trim(FNotaSaidaParam.ME31TipoCadastro.Text)= ''   then
         QRClienteComCompra.SetVariable('TIPO_CADASTRO',Null)
       Else
         QRClienteComCompra.SetVariable('TIPO_CADASTRO',FNotaSaidaParam.ME31TipoCadastro.Text);

       if Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text) = '' then
          QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO',Null)
       else
          QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text));

       if Trim(FNotaSaidaParam.ME31Ramo.Text) = '' then
          QRClienteComCompra.SetVariable('RAMO',Null)
       else
          QRClienteComCompra.SetVariable('RAMO',Trim(FNotaSaidaParam.ME31Ramo.Text));

       QRClienteComCompra.SetVariable('DT_EMISSAO_I',FNotaSaidaParam.MEDataI31.Text);
       QRClienteComCompra.SetVariable('DT_EMISSAO_F',FNotaSaidaParam.MEDataF31.Text);
       If Trim(FNotaSaidaParam.MeCodClasse31.Text)= ''   then
         QRClienteComCompra.SetVariable('COD_CLASSE',Null)
       Else
         QRClienteComCompra.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.MeCodClasse31.Text));
       QRClienteComCompra.Open;
       if FRClienteComCompra = nil then
          FRClienteComCompra:= TFRClienteComCompra.Create(Application);
       FRClienteComCompra.QRLTitulo.Caption := 'CLIENTES COM COMPRA NO PERIODO DE : '+
                                               FNotaSaidaParam.MEDataI31.Text+' A '+
                                               FNotaSaidaParam.MEDataF31.Text;
       if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
          FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: TODOS'
       else
          FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: '+Trim(FNotaSaidaParam.MECodVendedor31.Text)+' - '+
                                                    FNotaSaidaParam.EdVendedorNome31.Text;
       if Trim(FNotaSaidaParam.MECodClasse31.Text) = '' then
          FRClienteComCompra.QRLClasse.Caption := 'CLASSE: TODAS'
       else
          FRClienteComCompra.QRLClasse.Caption := ('CLASSE: '+Trim(FNotaSaidaParam.EDDescricaoClasse31.Text));
       FRClienteComCompra.QRLTipoCadastro.Caption := 'Tipo Cadastro : '+ Trim(FNotaSaidaParam.Ed31TipoCadastro.Text);
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
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFNotaSaidaCad.EtiquetaspItensdaNF1Click(Sender: TObject);
var wCont : Byte;
    wLpt_Nota: String;
    wNrEtiquetas: integer;
begin
  inherited;
  if FNotaSaidaParam = nil then
     FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[32].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    if (Trim(FNotaSaidaParam.EdNF32I.Text) = '') or (Trim(FNotaSaidaParam.EdNF32F.Text) = '') then
       raise exception.Create('Deve ser informada nota inicio/final primeiro!');

    with DMRelatorio_Venda do
    begin
      QREtiq_ItemsNF.Close;
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_I',FNotaSaidaParam.EdNF32I.Text);
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_F',FNotaSaidaParam.EdNF32F.Text);
      QREtiq_ItemsNF.Open;
      if QREtiq_ItemsNF.RecordCount = 0 then
         raise exception.Create('Nota(s) fiscal(is) não encontrada(s)!');

      wCont:= 1; // Inicializa valor da variavel.

      // Inicializa impressora.
      // wLpt_Nota:= DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_PARAM_SISTEMA','COD_FILIAL = '+DBEdit2.Text)
      wLpt_Nota:= 'LPT1';
      if Imp = nil then
         Imp := TImp.Create;
      if Trim(wLpt_Nota) = 'LPT1' then
         Imp.AbreImpressora
      else
         if Trim(wLpt_Nota) = 'LPT2' then
            Imp.AbreImpressora_Lpt2
         else
            Imp.AbreImpressora_Com2;

      //Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);

      QREtiq_ItemsNF.First;
      while not QREtiq_ItemsNF.Eof do
      begin

        wNrEtiquetas:= StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text);

        while wNrEtiquetas > 0 do
        begin
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFnome.Value));
          inc(wCont);
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));
          inc(wCont);
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));
          inc(wCont);
          wCont:=wCont+6;
          Dec(wNrEtiquetas);
        end;
        QREtiq_ItemsNF.Next;
      end;

      Imp.SaltaPagina;
      //Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
      Imp.FechaImpressora;

      // Não apague hoje.
       {
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFnome.Value));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFnome.Value));

           wCont:=wCont+1; // Pula para próxima linha

          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));

          wCont:=wCont+1; // Pula para próxima linha

          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));

          wCont:=wCont+7; // Pula linha(s).
          Inc(i);

          wNrEtiquetas:=wNrEtiquetas+2;

          if wNrEtiquetas >= QREtiq_ItemsNFQT_QUANTIDADE.Value then
             i:= 999999;  // Sai do while.
       }

    end;
  end;
end;

procedure TFNotaSaidaCad.NotasContaCorrente1Click(Sender: TObject);
var
  wParametro :string;
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[33].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      if (trim(FNotaSaidaParam.MEDT_Recebimento_I.text)<>'') and (trim(FNotaSaidaParam.MEDT_Recebimento_F.text)<>'') and (trim(FNotaSaidaParam.EDNumNota.text)<>'') then
      begin
        wParametro:= DMOracle.BuscaNome('SELECT COD_NOTA_CONTA_CORRENTE FROM TB_NOTA_CAB','NUM_NOTA = '+Trim(FNotaSaidaParam.EdNumNota.text)+' and TB_Nota_Cab.DT_Recebimento >= '+chr(39)+FNotaSaidaParam.MEDT_Recebimento_I.text+chr(39)+' and TB_Nota_Cab.DT_Recebimento <= '+chr(39)+FNotaSaidaParam.MEDT_Recebimento_F.text+chr(39));
        If wParametro <> '' Then
         Begin
           QRNotaContaCorrente.close;
           QRNotaContaCorrente.setVariable('NUM_NOTA',StrToInt(Trim(FNotaSaidaParam.EdNumNota.text)));
           QRNotaContaCorrente.setVariable('COD_NOTA_CONTA_CORRENTE',wParametro);
           QRNotaContaCorrente.open;
           If FRNotaContaCorrente = Nil then
              FRNotaContaCorrente:= TFRNotaContaCorrente.Create(Application);
           FRNotaContaCorrente.QRPrimario.Preview;
         End
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
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor_Preposto.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFNotaSaidaCad.DBEdit31Change(Sender: TObject);
begin
  inherited;
  If DbEdit31.Text <> '' Then
  Begin
    With DMTributacao do
    Begin
      QTributacao.Close;
      QTributacao.SetVariable('PK',DbEdit31.Text);
      QTributacao.Open;
      DMNotaSaida.QNotaSaidaVAL_ICM_BASE_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value*QTributacaoPerc_Tributado.Value/100);
      DMNotaSaida.QNotaSaidaVAL_ICM_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value*QTributacaoPerc_Tributado.Value/100)
                                                    *QTributacaoPerc_Aliquota.Value/100;
    End;
  End;
end;

procedure TFNotaSaidaCad.BtMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = MrOk then
     DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := DMMensagem.QMensagemConsDesc_Mensagem.Value+ Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento1.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento2.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento3.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento4.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento5.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento6.Value+Chr(13)+Chr(10)+
                                                      DMMensagem.QMensagemConsDesc_Complemento7.Value+Chr(13)+Chr(10);
end;

procedure TFNotaSaidaCad.SBCartaCorrecaoClick(Sender: TObject);
begin
  inherited;
  If (DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value = 0)Then
    raise Exception.Create('É necessário escolher uma nota para gerar uma Carta Corretiva');
  If FNotaCorrecao = Nil Then
    FNotaCorrecao := TFNotaCorrecao.Create(application);
  DMNotaCorrecao.pCodNota := DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
  DMNotaCorrecao.pCodConhecimento := 0;
  FNotaCorrecao.ShowModal;
end;

procedure TFNotaSaidaCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.VendedorCliente1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
  Begin
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.ME34DtInicio.Text := DateToStr(Date);
    FNotaSaidaParam.ME34DtFinal.Text := DateToStr(Date);
  End;
  FNotaSaidaParam.PGRelatorio.Pages[34].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRVendaVendedorCliente.Close;
      if(trim(FNotaSaidaParam.ME34DtInicio.text)<>'') AND (trim(FNotaSaidaParam.ME34DtFinal.text)<>'')then
      Begin
        QRVendaVendedorCliente.setVariable('DT_INICIO',trim(FNotaSaidaParam.ME34DtInicio.text));
        QRVendaVendedorCliente.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME34DtFinal.text));
      End
      else
        showmessage('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME34CodFilial.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('FILIAL',trim(FNotaSaidaParam.ME34CodFilial.text))
      Else
        QRVendaVendedorCliente.setVariable('FILIAL',null);

      If(Trim(FNotaSaidaParam.ME34Ramo.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('RAMO',trim(FNotaSaidaParam.ME34Ramo.text))
      Else
        QRVendaVendedorCliente.setVariable('RAMO',null);

      If(Trim(FNotaSaidaParam.ME34CodVendedor.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('VENDEDOR',trim(FNotaSaidaParam.ME34CodVendedor.text))
      Else
        QRVendaVendedorCliente.setVariable('VENDEDOR',null);

      If(Trim(FNotaSaidaParam.ME34CodClasse.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('CLASSE',trim(FNotaSaidaParam.ME34CodClasse.text))
      Else
        QRVendaVendedorCliente.setVariable('CLASSE',null);
      If FNotaSaidaParam.Rg34Cancelado_Sim_Nao.ItemIndex = 0 Then
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO',null)
      ELSE
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO','NAO');
      QRVendaVendedorCliente.Open;
      If FRVendaVendedorCliente = Nil Then
         FRVendaVendedorCliente := TFRVendaVendedorCliente.Create(Application);
      FRVendaVendedorCliente.QRLTitulo.Caption :=  'Vendas por Vendedor/Cliente no Período de ' + FNotaSaidaParam.ME34DtInicio.text + ' até ' + FNotaSaidaParam.ME34DtFinal.text;
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
  If FOrdemCarregamentoCons = Nil then
    FOrdemCarregamentoCons := TFOrdemCarregamentoCons.Create(Application);
  If FOrdemCarregamentoCons.ShowModal = mrOk then
    If DMOrdemCarregamento.QOrdemCarregamentoConsInd_Situacao.Value = 'B' Then
       Raise Exception.Create('Ordem de Carregamento Já foi Utilizada em Outra Nota Fiscal')
    Else
     Begin
       With DMOrdemCarregamento do
       Begin
         DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_cab.Value := QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value;
         QOrdemCarregamentoCab.Close;
         QOrdemCarregamentoCab.SetVariable('Pk',QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value);
         QOrdemCarregamentoCab.Open;
         QOrdemCarregamentoItem.Close;
         QOrdemCarregamentoItem.Open;
         DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value := QOrdemCarregamentoItemInd_Tipo_Frete.Value;
         DMNotaSaida.QNotaSaidaNUM_CONHECIMENTO_FRETE.Value := 0;
         DMNotaSaida.QNotaSaidaDT_EMISSAO_CF.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
         DMNotaSaida.QNotaSaidaCod_Transportador.Value := QOrdemCarregamentoItemCod_Motorista.Value;
         DMNotaSaida.QNotaSaidaDesc_Placa.Value := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;
         If QOrdemCarregamentoItemInd_Tipo_Frete.Value = 'CIF' Then
          Begin
            If QOrdemCarregamentoCabCod_Motorista.Text <> '' Then
               DMNotaSaida.QNotaSaidaCod_Motorista.Value := QOrdemCarregamentoCabCod_Motorista.Value;
            DMNotaSaida.QNotaSaidaVal_Pedagio.Value := QOrdemCarregamentoItemVal_Pedagio.Value;
            DMNotaSaida.QNotaSaidaVAL_FRETE_TON.Value := QOrdemCarregamentoItemVal_Frete_Ton.Value;
          End;
       End;
     End;
end;

procedure TFNotaSaidaCad.DBEdit62KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True;  // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.DBEdit63KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True;  // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.MELocalizaChange(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False;  // digitacao manual de valores de icms COLOQUEI AQUI NO CASO DE FAZER UMA NOTA INFORMANDO O ICMS E DEPOIS CONSULTAR OUTRA NOTA
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
        Raise Exception.Create('Período deve ser informado');
      if Trim(FNotaSaidaParam.ME35DtFinal.text) = ''then
        FNotaSaidaParam.ME35DtFinal.text := DateToStr(Date);
      if Trim(FNotaSaidaParam.ME35TribFederal.text) = ''then
        Raise Exception.Create('Valor do Tributo Federal deve ser Informado');
      QRVendaVendedorClasse.setVariable('VAL_TRIBUTO',Trim(FNotaSaidaParam.ME35TribFederal.Text));
      QRVendaVendedorClasse.setVariable('DT_INICIAL',Trim(FNotaSaidaParam.ME35DtInicial.Text));
      QRVendaVendedorClasse.setVariable('DT_FINAL',Trim(FNotaSaidaParam.ME35DtFinal.Text));

      QRVendVendedorResumo.setVariable('VAL_TRIBUTO',Trim(FNotaSaidaParam.ME35TribFederal.Text));
      QRVendVendedorResumo.setVariable('DT_INICIAL',Trim(FNotaSaidaParam.ME35DtInicial.Text));
      QRVendVendedorResumo.setVariable('DT_FINAL',Trim(FNotaSaidaParam.ME35DtFinal.Text));

      if Trim(FNotaSaidaParam.ME35Filial.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('FILIAL',Trim(FNotaSaidaParam.ME35Filial.Text));
        QRVendVendedorResumo.setVariable('FILIAL',Trim(FNotaSaidaParam.ME35Filial.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('FILIAL',NULL);
        QRVendVendedorResumo.setVariable('FILIAL',NULL);
      end;

      if Trim(FNotaSaidaParam.ME35Vendedor.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('VENDEDOR',Trim(FNotaSaidaParam.ME35Vendedor.Text));
        QRVendVendedorResumo.setVariable('VENDEDOR',Trim(FNotaSaidaParam.ME35Vendedor.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('VENDEDOR',NULL);
        QRVendVendedorResumo.setVariable('VENDEDOR',NULL);
      end;

      if Trim(FNotaSaidaParam.Me35Supervisor.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('SUPERVISOR',Trim(FNotaSaidaParam.Me35Supervisor.Text));
        QRVendVendedorResumo.setVariable('SUPERVISOR',Trim(FNotaSaidaParam.Me35Supervisor.Text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('SUPERVISOR',NULL);
        QRVendVendedorResumo.setVariable('SUPERVISOR',NULL);
      end;

      if Trim(FNotaSaidaParam.ME35Classe.Text) <> '' then
      begin
        QRVendaVendedorClasse.setVariable('CLASSE',Trim(FNotaSaidaParam.ME35Classe.text));
        QRVendVendedorResumo.setVariable('CLASSE',Trim(FNotaSaidaParam.ME35Classe.text));
      end
      else
      begin
        QRVendaVendedorClasse.setVariable('CLASSE',NULL);
        QRVendVendedorResumo.setVariable('CLASSE',NULL);
      end;

      If FNotaSaidaParam.RG35Tipo.ItemIndex = 1 then
        Begin
          QRVendaVendedorClasse.SQL[QRVendaVendedorClasse.SQL.count -1]:='';
          QRVendaVendedorClasse.Sql.Add('Order By Cod_Classe');
        end;

      QRVendaVendedorClasse.Open;
      QRVendVendedorResumo.Open;

      If FNotaSaidaParam.RG35Tipo.ItemIndex = 0 then
        Begin
          if FRVendaVendedorClasse = nil then
             FRVendaVendedorClasse := TFRVendaVendedorClasse.Create(Application);
          FRVendaVendedorClasse.QRLPeriodo.Caption :=  'Período de ' + FNotaSaidaParam.ME35DtInicial.text + ' até ' + FNotaSaidaParam.ME35DtFinal.text;
          FRVendaVendedorClasse.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed35Filial.Text;
          if FRVendaVendedorResumo = nil then
            FRVendaVendedorResumo := TFRVendaVendedorResumo.Create(Application);

          if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
            FRVendaVendedorClasse.QRCompositeReport1.Preview
          else
            FRVendaVendedorClasse.QRCompositeReport1.Print;
        end
        else
        Begin
          if FRVendaVendedorClasseSintetico = nil then
             FRVendaVendedorClasseSintetico := TFRVendaVendedorClasseSintetico.Create(Application);
          FRVendaVendedorClasseSintetico.QRLPeriodo.Caption :=  'Período de ' + FNotaSaidaParam.ME35DtInicial.text + ' até ' + FNotaSaidaParam.ME35DtFinal.text;
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
    Raise Exception.Create('Informe a nota para lançar a Qt. Chegada');
end;

procedure TFNotaSaidaCad.DBEdit6Change(Sender: TObject);
Var wPagto : String;
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
     (Trim(DBEdit6.Text) <> '') and (DMNotaSaida.QNotaSaidaIND_SITUACAO.Value = '1') Then
    Begin
      wPagto := DMOracle.BuscaNome('SELECT IND_TIPO_PAGAMENTO FROM TB_OPERACAO','COD_OPERACAO = '+DBEdit6.Text);
      If wPagto = 'V' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
      If wPagto = 'P' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
      If wPagto = 'O' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
    End;
end;

procedure TFNotaSaidaCad.MsgAutoriza;
Begin
  If Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text) <> '' Then
   Begin
     LblAutoriza.Caption := 'Autorizado:'+DMCadastro.QCadastroNOME_CONTATO.Text;
     LblAutoriza.Caption := LblAutoriza.Caption+'-'+DMCadastro.QCadastroNOME_CONTATO2.Text;
     LblFormaCompra.Caption := DMCadastro.QCadastroDESC_FORMA_COMPRA.Text;
     LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc '+DMCadastro.QCadastroPERC_DESCONTO.Text;
     LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMCadastro.QCadastroCOD_OPERACAO_CC.Text;
   End
  Else
   Begin
     LblAutoriza.Caption := '';
     LblFormaCompra.Caption := '';
   End;
End;

procedure TFNotaSaidaCad.AcompanhamentodeMeta1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[36].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRAcompanhaMeta.Close;
      if(trim(FNotaSaidaParam.ME36Dt_Inicial.text)<>'') AND (trim(FNotaSaidaParam.ME36Dt_Final.text)<>'')then
      Begin
        QRAcompanhaMeta.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME36Dt_Inicial.text));
        QRAcompanhaMeta.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME36Dt_Final.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME36Filial.Text) <> '')Then
        QRAcompanhaMeta.setVariable('FILIAL',trim(FNotaSaidaParam.ME36Filial.text))
      Else
        QRAcompanhaMeta.setVariable('FILIAL',null);

      If(Trim(FNotaSaidaParam.Me36Supervisor.Text) <> '')Then
        QRAcompanhaMeta.setVariable('COD_SUPERVISOR',trim(FNotaSaidaParam.Me36Supervisor.text))
      Else
        QRAcompanhaMeta.setVariable('COD_SUPERVISOR',null);

      If(Trim(FNotaSaidaParam.Me36Meta.Text) <> '')Then
        pMeta := StrToFloat(FNotaSaidaParam.ME36Meta.Text)
      Else
        Raise Exception.Create('É preciso informar a Meta!');
      QRAcompanhaMeta.Open;
      If FRAcompanhaMeta = Nil Then
         FRAcompanhaMeta := TFRAcompanhaMeta.Create(Application);
      FRAcompanhaMeta.QRLPeriodo.Caption :=  'Período: ' + FNotaSaidaParam.ME36Dt_Inicial.text + ' até ' + FNotaSaidaParam.ME36Dt_Final.text;
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
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[37].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRelacaoNotasRio.Close;
      if(trim(FNotaSaidaParam.ME37Dt_Inicial.text)<>'') AND (trim(FNotaSaidaParam.ME37Dt_Final.text)<>'')then
      Begin
        QRelacaoNotasRio.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME37Dt_Inicial.text));
        QRelacaoNotasRio.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME37Dt_Final.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME37Filial.Text) <> '')Then
        QRelacaoNotasRio.setVariable('COD_FILIAL',trim(FNotaSaidaParam.ME37Filial.text))
      Else
        QRelacaoNotasRio.setVariable('COD_FILIAL',null);
      If FNotaSaidaParam.CB37Venda.Checked Then
        QRelacaoNotasRio.setVariable('IND_VENDAS','V')
      Else
        QRelacaoNotasRio.setVariable('IND_VENDAS','P');
      If FNotaSaidaParam.CB37Bonificacao.Checked Then
        QRelacaoNotasRio.setVariable('IND_BONIFICACAO','S')
      Else
        QRelacaoNotasRio.setVariable('IND_BONIFICACAO','P'); // COLOCADO P PARA CONSEGUIR LISTR AS OPERACOES
      If FNotaSaidaParam.CB37Brinde.Checked Then             // NUNCA VAI EXISTIR UMA OPERACAO COM P
        QRelacaoNotasRio.setVariable('IND_BRINDE','S')
      Else
        QRelacaoNotasRio.setVariable('IND_BRINDE','P');
      If FNotaSaidaParam.CB37Troca.Checked Then
        QRelacaoNotasRio.setVariable('IND_TROCA','S')
      Else
        QRelacaoNotasRio.setVariable('IND_TROCA','P');

      If FNotaSaidaParam.CB37Zero.Checked Then
        QRelacaoNotasRio.SQL[QRelacaoNotasRio.SQL.Count-1]:='AND VAL_SUBSTITUICAO = 0 '
      Else
        QRelacaoNotasRio.SQL[QRelacaoNotasRio.SQL.Count-1]:='AND VAL_SUBSTITUICAO <> 0 ';

      QRelacaoNotasRio.Open;
      If FRNotasRio = Nil Then
         FRNotasRio := TFRNotasRio.Create(Application);
      FRNotasRio.QRLPeriodo.Caption :=  'Período: ' + FNotaSaidaParam.ME37Dt_Inicial.text + ' até ' + FNotaSaidaParam.ME37Dt_Final.text;
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
  If PCCabecalho.ActivePage = TSContaReceber then
   Begin
     DMNotaSaida.QContaReceber.Close;
     DMNotaSaida.QContaReceber.Open;
   End;

end;

procedure TFNotaSaidaCad.BtCulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
    DMNotaSaida.QItemNFCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFNotaSaidaCad.BtMotoristaClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Motorista.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFNotaSaidaCad.AcompanhamentodeVendas1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[38].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
    If DMUsuario.pTipoFuncionario = 'VENDEDOR' Then
     Begin
       FNotaSaidaParam.Me38Vendedor.Enabled := False;
       FNotaSaidaParam.Bt38ConsVendedor.Enabled := False;
       FNotaSaidaParam.Me38Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End
    Else
     Begin
       FNotaSaidaParam.Me38Supervisor.Enabled := False;
       FNotaSaidaParam.Bt38Supervisor.Enabled := False;
       FNotaSaidaParam.Me38Supervisor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRAcompanhaVenda.Close;

      If(Trim(FNotaSaidaParam.ME38Filial.Text) <> '')Then
        QRAcompanhaVenda.setVariable('COD_FILIAL',trim(FNotaSaidaParam.ME38Filial.text))
      else
        QRAcompanhaVenda.setVariable('COD_FILIAL',null);

      if(trim(FNotaSaidaParam.ME38DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME38DtFinal.text)<>'')then
      Begin
        QRAcompanhaVenda.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME38DtInicial.text));
        QRAcompanhaVenda.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME38DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME38Vendedor.Text) <> '')Then
        QRAcompanhaVenda.setVariable('VENDEDOR',trim(FNotaSaidaParam.ME38Vendedor.text))
      else
        QRAcompanhaVenda.setVariable('VENDEDOR',null);

      If(Trim(FNotaSaidaParam.ME38Supervisor.Text) <> '')Then
        QRAcompanhaVenda.setVariable('COD_SUPERVISOR',trim(FNotaSaidaParam.ME38Supervisor.Text))
      else
        QRAcompanhaVenda.setVariable('COD_SUPERVISOR',null);

      if Trim(FNotaSaidaParam.Me38CodEstado.Text) <> '' then
        QRAcompanhaVenda.SetVariable('COD_ESTADO', Trim(FNotaSaidaParam.Me38CodEstado.Text))
      else
        QRAcompanhaVenda.SetVariable('COD_ESTADO', null);

      If FNotaSaidaParam.ME38AnoBase.Text = '' Then
        Raise Exception.Create('Deve ser informado o Ano!');
        QRAcompanhaVenda.SetVariable('ANO',(FNotaSaidaParam.ME38AnoBase.Text));

      QRAcompanhaVenda.Open;
      If FRAcompanhamentoVenda = Nil Then
         FRAcompanhamentoVenda := TFRAcompanhamentoVenda.Create(Application);
         FRAcompanhamentoVenda.QRLVendedor.Caption := 'Vendedor: ' + FNotaSaidaParam.ME38Vendedor.text + ' '+ FNotaSaidaParam.Ed38Vendedor.Text;
         FRAcompanhamentoVenda.QRLSupervisor .Caption := 'Supervisor: '+FNotaSaidaParam.ME38Supervisor.text + ' '+ FNotaSaidaParam.Ed38Supervisor.Text;

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
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[39].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRVendasRamoCliente.Close;
      if(trim(FNotaSaidaParam.ME39DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME39DtFinal.text)<>'')then
      Begin
        QRVendasRamoCliente.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME39DtInicial.text));
        QRVendasRamoCliente.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME39DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');
      If FNotaSaidaParam.ME39Ramo.Text = '' Then
        Raise Exception.Create('Deve ser informado o RAMO do Cliente!');
        QRVendasRamoCliente.SetVariable('RAMO',(FNotaSaidaParam.ME39Ramo.Text));
      If(Trim(FNotaSaidaParam.ME39Supervisor.Text) <> '')Then
        QRVendasRamoCliente.SetVariable('SUPERVISOR',(FNotaSaidaParam.ME39Supervisor.Text))
      else
         QRVendasRamoCliente.SetVariable('SUPERVISOR',null);

      QRVendasRamoCliente.Open;
      If FRVendasRamoCliente = Nil Then
         FRVendasRamoCliente := TFRVendasRamoCliente.Create(Application);
      FRVendasRamoCliente.QRLRamo.Caption := 'Ramo: ' + FNotaSaidaParam.ME39Ramo.text + ' '+ FNotaSaidaParam.Ed39Ramo.Text;
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
  If (Trim(DBEdit22.Text) <> '') And (Trim(DBEdit43.Text) = '') Then
    DMNotaSaida.QNotaSaidaDESC_PLACA.Value := DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO','COD_CADASTRO = '+Trim(DBEdit22.Text));
  If (wEmpresa = 'ABATE') and (Trim(DBEdit22.Text) <> '') And (Trim(DBEdit93.Text) = '') Then
    DMNotaSaida.QNotaSaidaDESC_MARCA.Value := 'FRIELLA';
end;

procedure TFNotaSaidaCad.NotasporCultura1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[40].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRNotasCultura.Close;
      if(trim(FNotaSaidaParam.ME40DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME40DtFinal.text)<>'')then
      Begin
        QRNotasCultura.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME40DtInicial.text));
        QRNotasCultura.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME40DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME40Filial.Text) <> '')Then
        QRNotasCultura.setVariable('FILIAL',trim(FNotaSaidaParam.ME40Filial.text))
      Else
        QRNotasCultura.setVariable('FILIAL',null);

      If(Trim(FNotaSaidaParam.ME40Cadastro.Text) <> '')Then
        QRNotasCultura.setVariable('CADASTRO',trim(FNotaSaidaParam.ME40Cadastro.text))
      Else
        QRNotasCultura.setVariable('CADASTRO',null);

      If(Trim(FNotaSaidaParam.ME40Cultura.Text) <> '')Then
        QRNotasCultura.setVariable('CULTURA',trim(FNotaSaidaParam.ME40Cultura.text))
      Else
        QRNotasCultura.setVariable('CULTURA',null);

      If(Trim(FNotaSaidaParam.Me40Vendedor.Text) <> '')Then
        QRNotasCultura.setVariable('VENDEDOR',trim(FNotaSaidaParam.Me40Vendedor.text))
      Else
        QRNotasCultura.setVariable('VENDEDOR',null);

      QRNotasCultura.Open;
      If FRNotaCultura = Nil Then
         FRNotaCultura := TFRNotaCultura.Create(Application);
         FRNotaCultura.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME40Filial.text + ' '+ FNotaSaidaParam.Ed40Filial.Text;
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
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_CADASTRO_CLASSIFICACAO.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.RelaoNotasComDesconto1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[41].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QrVendaComDesconto.Close;
      if(trim(FNotaSaidaParam.ME41DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME41DtFinal.text)<>'')then
      Begin
        QrVendaComDesconto.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME41DtInicial.text));
        QrVendaComDesconto.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME41DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

       If(Trim(FNotaSaidaParam.ME41Filial.Text) <> '')Then
        QrVendaComDesconto.setVariable('COD_FILIAL',trim(FNotaSaidaParam.ME41Filial.text))
      Else
        QrVendaComDesconto.setVariable('COD_FILIAL',null);

       If(Trim(FNotaSaidaParam.ME41Cadastro.Text) <> '')Then
        QrVendaComDesconto.setVariable('COD_CADASTRO',trim(FNotaSaidaParam.ME41Cadastro.text))
      Else
        QrVendaComDesconto.setVariable('COD_CADASTRO',null);

       If(Trim(FNotaSaidaParam.ME41Departamento.Text) <> '')Then
        QrVendaComDesconto.setVariable('COD_DEPARTAMENTO',trim(FNotaSaidaParam.ME41Departamento.text))
      Else
        QrVendaComDesconto.setVariable('COD_DEPARTAMENTO',null);

      QrVendaComDesconto.Open;
      If FrVendaComDesconto = Nil Then
         FrVendaComDesconto := TFrVendaComDesconto.Create(Application);
      FrVendaComDesconto.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME41Filial.text + ' '+ FNotaSaidaParam.Ed41Filial.Text;
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
Var wVal_Desconto : Real;
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
  Begin
    If Trim(DMNotaSaida.QItemNFVal_Desconto.Text) <> '' Then
      If Trim(DMNotaSaida.QItemNFQt_Quantidade.Text) <> '' Then
       Begin  // esta rotina foi colocada para nao gerar dizima no desconto quando for devolver (se devolve quantidade menor que a nota dava problema no valor)
         wVal_Desconto := DMNotaSaida.QItemNFVal_Desconto.Value / DMNotaSaida.QItemNFQt_Quantidade.Value * 100;
         wVal_Desconto := Trunc(wVal_Desconto) / 100 * DMNotaSaida.QItemNFQt_Quantidade.Value;
         DMNotaSaida.QItemNFVal_Desconto.Value := wVal_Desconto;
         DMNotaSaida.pDigitou_Desconto := True;
         DMNotaSaida.QItemNFVal_Unitario.Value := (DMNotaSaida.QItemNFVal_Unitario.Value * DMNotaSaida.QItemNFQt_Quantidade.Value - DMNotaSaida.QItemNFVal_Desconto.Value) / DMNotaSaida.QItemNFQt_Quantidade.Value;
         DMNotaSaida.QItemNFVal_ICM_Base.Value := 0;  // para recalcular a base de calcula quando alterado
       End;
  End;
end;

procedure TFNotaSaidaCad.ResumodeVendasporVendedor1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[42].TabVisible := True;

  //FNotaSaidaParam.Me42Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);

  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRVendedorResumoVenda.Close;
      if(trim(FNotaSaidaParam.ME42DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME42DtFinal.text)<>'')then
      Begin
        QRVendedorResumoVenda.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME42DtInicial.text));
        QRVendedorResumoVenda.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME42DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

       If(Trim(FNotaSaidaParam.ME42Filial.Text) <> '')Then
        QRVendedorResumoVenda.setVariable('FILIAL',trim(FNotaSaidaParam.ME42Filial.text))
      Else
        QRVendedorResumoVenda.setVariable('FILIAL',null);

       If(Trim(FNotaSaidaParam.ME42Vendedor.Text) <> '')Then
        QRVendedorResumoVenda.setVariable('VENDEDOR',trim(FNotaSaidaParam.ME42Vendedor.text))
      Else
        QRVendedorResumoVenda.setVariable('VENDEDOR',null);

       If Trim(FNotaSaidaParam.ME42Supervisor.Text)= ''   then
         QRVendedorResumoVenda.SetVariable('SUPERVISOR',Null)
       Else
         QRVendedorResumoVenda.SetVariable('SUPERVISOR',FNotaSaidaParam.ME42Supervisor.Text);

       if trim(FNotaSaidaParam.Me42Produto.Text) = '' then
        QRVendedorResumoVenda.SetVariable('PRODUTO', Null)
       else
        QRVendedorResumoVenda.SetVariable('PRODUTO', trim(FNotaSaidaParam.Me42Produto.Text));

      Case FNotaSaidaParam.RG42Pagto.ItemIndex Of
      0 : QRVendedorResumoVenda.SetVariable('TIPO_PAGTO','1');
      1 : QRVendedorResumoVenda.SetVariable('TIPO_PAGTO','2');
      2 : QRVendedorResumoVenda.SetVariable('TIPO_PAGTO','3');
      3 : QRVendedorResumoVenda.SetVariable('TIPO_PAGTO',Null);
      End;  

      QRVendedorResumoVenda.Open;
      If FrVendedorResumo = Nil Then
         FrVendedorResumo := TFrVendedorResumo.Create(Application);
      FrVendedorResumo.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.ME42Filial.text + ' '+ FNotaSaidaParam.Ed42Filial.Text;
      FrVendedorResumo.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.ME42DtInicial.text + ' até ' + FNotaSaidaParam.ME42DtFinal.text;
      FrVendedorResumo.QRLPagto.Caption := 'Tipo de Pagamento: '+ FNotaSaidaParam.RG42Pagto.Items.Strings[FNotaSaidaParam.RG42Pagto.ItemIndex] +
                                           ' - Supervisor: '+ FnotaSaidaParam.Ed42Supervisor.Text;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
      begin
        FRVendedorResumo.QRLabel6.Enabled  := false;
        FRVendedorResumo.QRLabel6.Visible  := false;
        FRVendedorResumo.QRDBText4.Enabled := false;
        FRVendedorResumo.QRDBText4.Visible := false;
        FRVendedorResumo.QRExpr2.Enabled   := false;
        FRVendedorResumo.QRExpr2.Visible   := false;
      end;            

      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FrVendedorResumo.QRPrimario.Preview
      else
        FrVendedorResumo.QRPrimario.Print;
      QRVendedorResumoVenda.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.VendedorPreoMdioAnual1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[43].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
    If DMUsuario.pTipoFuncionario = 'VENDEDOR' Then
     Begin
      FNotaSaidaParam.Me43Vendedor.Enabled := False;
      FNotaSaidaParam.Bt43ConsVendedor.Enabled := False;
      FNotaSaidaParam.Me43Vendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End
    Else
     Begin
      FNotaSaidaParam.Me43Supervisor.Enabled := False;
      FNotaSaidaParam.Bt43Supervisor.Enabled := False;
      FNotaSaidaParam.Me43Supervisor.text := IntToStr(DMusuario.CodVendedorPadrao);
     End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME43Filial.Text),'VENDA');
    QRVendedorCMedioMes.Close;
    QRVendedorCMedioMes.SetVariable('DATA_I',FNotaSaidaParam.ME43DataI.Text);
    QRVendedorCMedioMes.SetVariable('DATA_F',FNotaSaidaParam.ME43DataF.Text);


    //fabiano 27122004
    if Trim(FNotaSaidaParam.ME43PrecoIni.Text) <> '' then
      QRVendedorCMedioMes.SetVariable('VAL_TOTAL_INI',strtofloat(Trim(FNotaSaidaParam.ME43PrecoIni.Text)))
    else
      QRVendedorCMedioMes.SetVariable('VAL_TOTAL_INI',Null);

    if Trim(FNotaSaidaParam.ME43PrecoFim.Text) <> '' then
      QRVendedorCMedioMes.SetVariable('VAL_TOTAL_FIM',strtofloat(Trim(FNotaSaidaParam.ME43PrecoFim.Text)))
    else
      QRVendedorCMedioMes.SetVariable('VAL_TOTAL_FIM',Null);
    //fim fabiano

    If Trim(FNotaSaidaParam.ME43Filial.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('FILIAL',Null)
    Else
      QRVendedorCMedioMes.SetVariable('FILIAL',FNotaSaidaParam.ME43Filial.Text);

    If Trim(FNotaSaidaParam.ME43Vendedor.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('VENDEDOR',Null)
    Else
      QRVendedorCMedioMes.SetVariable('VENDEDOR',FNotaSaidaParam.ME43Vendedor.Text);

    If Trim(FNotaSaidaParam.ME43Supervisor.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('SUPERVISOR',Null)
    Else
      QRVendedorCMedioMes.SetVariable('SUPERVISOR',FNotaSaidaParam.ME43Supervisor.Text);

    If Trim(FNotaSaidaParam.ME43Cadastro.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('COD_CADASTRO',Null)
    Else
      QRVendedorCMedioMes.SetVariable('COD_CADASTRO',FNotaSaidaParam.ME43Cadastro.Text);

    If Trim(FNotaSaidaParam.Me43Departamento.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('COD_DEPARTAMENTO',Null)
    Else
      QRVendedorCMedioMes.SetVariable('COD_DEPARTAMENTO',FNotaSaidaParam.Me43Departamento.Text);

    If Trim(FNotaSaidaParam.Me43Serie.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('COD_SERIE',Null)
    Else
      QRVendedorCMedioMes.SetVariable('COD_SERIE',FNotaSaidaParam.Me43Serie.Text);

    If Trim(FNotaSaidaParam.Me43Estado.Text)= ''   then
      QRVendedorCMedioMes.SetVariable('ESTADO',Null)
    Else
      QRVendedorCMedioMes.SetVariable('ESTADO',FNotaSaidaParam.Me43Estado.Text);

    If Trim(FNotaSaidaParam.ME43Operacao.Text)= ''   then
    Begin
      QRVendedorCMedioMes.SetVariable('IND_VENDAS','V');
      QRVendedorCMedioMes.SetVariable('OPERACAO',Null);
    End
    Else
    Begin
      QRVendedorCMedioMes.SetVariable('IND_VENDAS',Null);
      QRVendedorCMedioMes.SetVariable('OPERACAO',FNotaSaidaParam.ME43Operacao.Text);
    End;
    QRVendedorCMedioMes.Open;

    If FRNota_VendedorCMedioMes = Nil then
      FRNota_VendedorCMedioMes := TFRNota_VendedorCMedioMes.Create(Application);

    FRNota_VendedorCMedioMes.QRLTitulo.Caption := 'Vendas por Vendedor/Custo Médio Anual de '+ FNotaSaidaParam.ME43DataI.Text+' até '+FNotaSaidaParam.ME43DataF.Text;
    FRNota_VendedorCMedioMes.QRLOperacao.Caption :=  'Operação:' + FNotaSaidaParam.Ed43Operacao.Text+' '+ 'Estado:' + FNotaSaidaParam.Ed43Estado.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendedorCMedioMes.QRPrimario.Preview
    Else
      FRNota_VendedorCMedioMes.QRPrimario.Print;
   QRVendedorCMedioMes.Close;
  End;
end;

procedure TFNotaSaidaCad.DBEdit1Change(Sender: TObject);
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

Procedure TFNotaSaidaCad.PImportaPedidos_Items;
Var wCodItemNF : Integer;
    wQt_Item_nota : Real;
    wCodAuxiliar,wIpi : String;
Begin
  With DMPedido do
  Begin
    DMNotaSaida.QBaixasPed.Close;
    QPedidoItem.Open;
    QPedidoItem.First;
    DMNotaSaida.pTrazPedido := True;
    While not QPedidoItem.Eof do
      With DMNotaSaida do
      Begin
        QItemNF.Insert;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
        Begin
          if QPedidoItemQT_QUANTIDADE_AUX.Text <> '' then
          Begin
            QItemNFQt_Quantidade.Value := QPedidoItemQT_QUANTIDADE_AUX.Value;
            QItemNFNUM_VOLUMES.Value := StrToInt(QPedidoItemQT_EMBALAGEM.Text);
          end
          else
            QItemNFQt_Quantidade.Value := QPedidoItemQt_Pedido.Value-QPedidoItemQt_Atendido.Value-QPedidoItemQt_Cancelado.Value;
        end
        Else
          QItemNFQt_Quantidade.Value := QPedidoItemQt_Pedido.Value-QPedidoItemQt_Atendido.Value-QPedidoItemQt_Cancelado.Value;
        QItemNFCod_Cultura.Text := QPedidoItemCod_Cultura.Text;
        If FPedidoCons.RGCodigoAuxiliar.ItemIndex = 1 Then
         Begin
           QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
           QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value;
           QItemNFVal_Unitario_Tabela.Value := QPedidoItemVal_Unitario.Value;
           If QItemNFQt_Quantidade.Value > 0 Then
              QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value*QItemNFQt_Quantidade.Value
           Else
              QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value;
         end
        else
         Begin
           wCodAuxiliar := DMOracle.BuscaNome('SELECT COD_PRODUTO_B FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
           If wCodAuxiliar <> '' Then
              QItemNFCod_Produto.Value := StrToFloat(wCodAuxiliar)
           Else
              QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
           QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value / 2;
           QItemNFVal_Total.Value := (QPedidoItemVal_Unitario.Value*QItemNFQt_Quantidade.Value) / 2;
         end;
        QItemNFCod_Lote_Tipo.Value := QPedidoItemCod_Lote_Tipo.Value;
        QItemNFCod_Tributacao.Value := QPedidoItemCod_Tributacao.Value;
        QItemNFPerc_Desconto.Value := QPedidoItemPerc_Desconto.Value;
        QItemNFPerc_Comissao.Value := QPedidoItemPerc_Comissao.Value;
        wIpi := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO','COD_PRODUTO = '+QItemNFCod_Produto.Text);
        If wIpi <> '' Then
           QItemNFPerc_Ipi.Value := StrToFloat(wIpi);
        wCodItemNF := QItemNFCod_Nota_Item.Value;
        wQt_Item_nota := QItemNFQt_Quantidade.Value;
        QItemNF.Post;
        QAtuBaixaPed.Open;
        QAtuBaixaPed.Insert;
        QAtuBaixaPedCod_Nota_Item.Value := wCodItemNF;
        QAtuBaixaPedCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
        QAtuBaixaPedQt_Baixa.Value := wQt_Item_nota;
        QAtuBaixaPed.Post;
        QAtuBaixaPed.Close;
        QAtuDtFatura_Ped.Close;
        QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB',QPedidoItemCod_Pedido_Cab.Value);
        QAtuDtFatura_Ped.Open;
        QAtuDtFatura_Ped.Edit;
        QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
        QAtuDtFatura_Ped.Post;
        QAtuDtFatura_Ped.Close;
        // Itens de Pedidos atualizados nos eventos da query
        QPedidoItem.Next;
      End;
      With DMNotaSaida do
      Begin
        QAtuBaixaPed.Close;
        QItemNF.Close;
        QPedidoItem.Close;
        QItemNF.Open;
        QAtuBaixaPed.Open;
        QPedidoItem.Open;
      End;
     QPedido.Close;
     QPedidoItem.Close;
   End;
   DMNotaSaida.pTrazPedido := False;
End;

procedure TFNotaSaidaCad.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = ' ' Then
     Key := #0;
end;

procedure TFNotaSaidaCad.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  If Key = #13 Then
//     Key := #0;
end;

procedure TFNotaSaidaCad.MapaVenda21Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[1].TabVisible := True;
  If (not DMUsuario.Privilegiado) And
     (DMusuario.CodVendedorPadrao <> 0) Then
  Begin
    FNotaSaidaParam.FmVendedor26.MeVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.BtVendedor.Enabled := False;
    FNotaSaidaParam.FmVendedor26.MeVendedor.text := IntToStr(DMusuario.CodVendedorPadrao);
  End;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text),'VENDA');
    If FNotaSaidaParam.RGTipo.ItemIndex = 1 then  // Analítico
    Begin
      QRMapaVenda2.Close;
      QRMapaVenda2.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVenda2.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      if Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text)= ''   then
         QRMapaVenda2.SetVariable('FILIAL',Null)
      else
         QRMapaVenda2.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text));
      if Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text)= ''   then
        QRMapaVenda2.SetVariable('VENDEDOR',Null)
      else
        QRMapaVenda2.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text)= ''   then
        QRMapaVenda2.SetVariable('VENDEDOR_PREPOSTO',Null)
      else
        QRMapaVenda2.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text));
      if Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text) = ''   then
        QRMapaVenda2.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVenda2.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text)= ''   then
        QRMapaVenda2.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVenda2.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text) = ''   then
        QRMapaVenda2.SetVariable('COD_CADASTRO',Null)
      else
        QRMapaVenda2.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text)= ''   then
        QRMapaVenda2.SetVariable('COD_CULTURA',Null)
      else
        QRMapaVenda2.SetVariable('COD_CULTURA',Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
      if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text)= ''   then
        QRMapaVenda2.SetVariable('ESTADO',Null)
      else
        QRMapaVenda2.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
      if Trim(FNotaSaidaParam.Me1Classe.Text)= ''   then
        QRMapaVenda2.SetVariable('COD_CLASSE',Null)
      else
        QRMapaVenda2.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.Me1Classe.Text));
      if Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' then
      begin
        QRMapaVenda2.SetVariable('OPERACAO',Null);
        QRMapaVenda2.SetVariable('COD_OPERACAO',Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text));
      end
      else
      begin
        QRMapaVenda2.SetVariable('OPERACAO','V');
        QRMapaVenda2.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVenda2.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVenda2.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVenda2.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVenda2.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVenda2.SetVariable('TIPO_PAGTO',Null);
      End;

      QRMapaVenda2.Open;
      If FRNota_MapaVenda2 = Nil then
        FRNota_MapaVenda2 := TFRNota_MapaVenda2.Create(Application);
      FRNota_MapaVenda2.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      if Trim(FNotaSaidaParam.FmVendedor2.EdVendedor.Text) <> '' Then
         FRNota_MapaVenda2.QRLVendedor_Oper.Caption := 'Rep.Comercial: '+FNotaSaidaParam.FmVendedor2.EdVendedor.Text+' '
      else
         FRNota_MapaVenda2.QRLVendedor_Oper.Caption := 'Rep.Comercial: Todos  ';
      FRNota_MapaVenda2.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.FmFornecedor2.EdCadastro.Text+' Cliente:'+FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
      if Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' Then
         FRNota_MapaVenda2.QRLVendedor_Oper.Caption := FRNota_MapaVenda2.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.FmOperacao2.EdOperacao.Text+' '
      else
         FRNota_MapaVenda2.QRLVendedor_Oper.Caption := FRNota_MapaVenda2.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
         FRNota_MapaVenda2.QRPrimario.Preview
      else
         FRNota_MapaVenda2.QRPrimario.Print;
      QRMapaVenda2.Close;
    end
    else // **** Resumido
    begin
      QRMapaVendaRes2.Close;
      QRMapaVendaRes2.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVendaRes2.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      If Trim(FNotaSaidaParam.FmFilial2.MeFilial.Text)= ''   then
        QRMapaVendaRes2.SetVariable('FILIAL',Null)
      Else
        QRMapaVendaRes2.SetVariable('FILIAL',FNotaSaidaParam.FmFilial2.MeFilial.Text);

      If Trim(FNotaSaidaParam.FmVendedor2.MeVendedor.Text)= ''   then
        QRMapaVendaRes2.SetVariable('VENDEDOR',Null)
      Else
        QRMapaVendaRes2.SetVariable('VENDEDOR',FNotaSaidaParam.FmVendedor2.MeVendedor.Text);
      If Trim(FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text)= ''   then
        QRMapaVendaRes2.SetVariable('VENDEDOR_PREPOSTO',Null)
      Else
        QRMapaVendaRes2.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.FmVendedorPreposto2.MeVendedor.Text);
      if Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text) = ''   then
        QRMapaVendaRes2.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVendaRes2.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto2.MeProduto.Text));
      if Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text) = ''   then
        QRMapaVendaRes2.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVendaRes2.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text)= ''   then
        QRMapaVendaRes2.SetVariable('COD_CADASTRO',Null)
      else
        QRMapaVendaRes2.SetVariable('COD_CADASTRO',Trim(FNotaSaidaParam.FmCadastro2.MeCadastro.Text));
      if Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text)= ''   then
        QRMapaVendaRes2.SetVariable('COD_CULTURA',Null)
      else
        QRMapaVendaRes2.SetVariable('COD_CULTURA',Trim(FNotaSaidaParam.FmCultura2.MeCultura.Text));
      if Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text)= ''   then
        QRMapaVendaRes2.SetVariable('ESTADO',Null)
      else
        QRMapaVendaRes2.SetVariable('ESTADO',Trim(FNotaSaidaParam.FmEstado2.MeEstado.Text));
      if Trim(FNotaSaidaParam.Me1Classe.Text)= ''   then
        QRMapaVendaRes2.SetVariable('COD_CLASSE',Null)
      else
        QRMapaVendaRes2.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.Me1Classe.Text));
      If Trim(FNotaSaidaParam.FmOperacao2.MeOperacao.Text) <> '' then
       Begin
        QRMapaVendaRes2.SetVariable('OPERACAO',Null);
        QRMapaVendaRes2.SetVariable('COD_OPERACAO',FNotaSaidaParam.FmOperacao2.MeOperacao.Text);
       end
      else
      begin
        QRMapaVendaRes2.SetVariable('OPERACAO','V');
        QRMapaVendaRes2.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVendaRes2.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVendaRes2.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVendaRes2.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVendaRes2.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVendaRes2.SetVariable('TIPO_PAGTO',Null);
      End;
      QRMapaVendaRes2.Open;
      if FRNota_MapaVendaRes2 = Nil then
        FRNota_MapaVendaRes2 := TFRNota_MapaVendaRes2.Create(Application);
      FRNota_MapaVendaRes2.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption := 'Rep.Comercial: '+FNotaSaidaParam.FmVendedor2.EdVendedor.Text+' ';
      FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes2.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.FmOperacao2.EdOperacao.Text+' ';
      FRNota_MapaVendaRes2.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.FmFornecedor2.EdCadastro.Text+' Cliente:'+FNotaSaidaParam.FmCadastro2.EdCadastro.Text;
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
  If FNotaSaidaParam = Nil then // FOI RETIRADO A BONIFICAÇÃO DESTE REL. A PEDIDO DO MAYCON(MOINHO)
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application); //"bonificação que naõ tem cultura entao cara para não consertar todas"
  FNotaSaidaParam.PGRelatorio.Pages[44].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME44Filial.Text),'VENDA');

    QrProdutoCultura.Close;
    if ((FnotaSaidaParam.ME44DtInicial.text = '') or (FnotaSaidaParam.ME44DtFinal.text = '' )) then
      Raise Exception.Create('Informe o Período desejado');
    QRProdutoCultura.SetVariable('DT_INICIAL',FNotaSaidaParam.ME44DtInicial.Text);
    QRProdutoCultura.SetVariable('DT_FINAL',FNotaSaidaParam.ME44DtFinal.Text);

    If Trim(FNotaSaidaParam.ME44Filial.Text)= ''   then
      QRProdutoCultura.SetVariable('FILIAL',Null)
    Else
      QRProdutoCultura.SetVariable('FILIAL',FNotaSaidaParam.ME44Filial.Text);

    If Trim(FNotaSaidaParam.ME44Cadastro.Text)= ''   then
      QRProdutoCultura.SetVariable('CADASTRO',Null)
    Else
      QRProdutoCultura.SetVariable('CADASTRO',FNotaSaidaParam.ME44Cadastro.Text);

    If Trim(FNotaSaidaParam.ME44Operacao.Text)= ''   then
      QRProdutoCultura.SetVariable('OPERACAO',Null)
    Else
      QRProdutoCultura.SetVariable('OPERACAO',FNotaSaidaParam.ME44Operacao.Text);

    If Trim(FNotaSaidaParam.ME44Produto.Text)= ''   then
      QRProdutoCultura.SetVariable('PRODUTO',Null)
    Else
      QRProdutoCultura.SetVariable('PRODUTO',FNotaSaidaParam.ME44Produto.Text);

    if Trim(FNotaSaidaParam.ME44Fornecedor.Text)= ''   then
      QRProdutoCultura.SetVariable('FORNECEDOR',Null)
    else
      QRProdutoCultura.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.ME44Fornecedor.Text));

    if Trim(FNotaSaidaParam.ME44Vendedor.Text)= ''   then
      QRProdutoCultura.SetVariable('VENDEDOR',Null)
    else
      QRProdutoCultura.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.ME44Vendedor.Text));

    if Trim(FNotaSaidaParam.Me44Cultura.Text)= ''   then
     QRProdutoCultura.SetVariable('CULTURA',Null)
    else
      QRProdutoCultura.SetVariable('CULTURA',Trim(FNotaSaidaParam.Me44Cultura.Text));

    If Trim(FNotaSaidaParam.Me44Classificacao.Text)= ''   then
      QRProdutoCultura.SetVariable('CLASSIFICACAO',Null)
    Else
      QRProdutoCultura.SetVariable('CLASSIFICACAO',FNotaSaidaParam.Me44Classificacao.Text);

    If Trim(FNotaSaidaParam.Me44Classe.Text)= ''   then
      QRProdutoCultura.SetVariable('CLASSE',Null)
    Else
      QRProdutoCultura.SetVariable('CLASSE',FNotaSaidaParam.Me44Classe.Text);

    If (Trim(FNotaSaidaParam.Me44SubClasse.Text)= '') or
       (Trim(FNotaSaidaParam.Me44SubClasse.Text)= '0')  then
      QRProdutoCultura.SetVariable('SUBCLASSE',Null)
    Else
      QRProdutoCultura.SetVariable('SUBCLASSE',FNotaSaidaParam.Me44SubClasse.Text);

    Case FNotaSaidaParam.Rg44TipoNota.ItemIndex of
       0 : QRProdutoCultura.SetVariable('TIPO_NOTA','E');
       1 : QRProdutoCultura.SetVariable('TIPO_NOTA','S');
       2 : QRProdutoCultura.SetVariable('TIPO_NOTA',Null);
    End;
    Case FNotaSaidaParam.RG44TipoPagto.ItemIndex of
       0 : QRProdutoCultura.SetVariable('TIPO_PAGTO','1');
       1 : QRProdutoCultura.SetVariable('TIPO_PAGTO','2');
       2 : QRProdutoCultura.SetVariable('TIPO_PAGTO','3');
       3 : QRProdutoCultura.SetVariable('TIPO_PAGTO',Null);
    End;  

    QRProdutoCultura.Open;

    If FRProdutoCultura = Nil then
      FRProdutoCultura := TFRProdutoCultura.Create(Application);
    FRProdutoCultura.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.FmFilial5.EdFilial.Text + '   Cliente:'+FNotaSaidaParam.Ed44Cadastro.Text;
    FRProdutoCultura.QRLCultura.Caption := 'Cultura: '+FnotaSaidaParam.Ed44Cultura.Text + '  Produto: '+FNotaSaidaParam.ED44Produto.Text;
    FRProdutoCultura.QRLVendedor.Caption := 'Vendedor:'+FNotaSaidaParam.ME44Vendedor.Text + '   Fornecedor:'+FNotaSaidaParam.Ed44Fornecedor.Text;
    FRProdutoCultura.QRLPeriodo.Caption := 'Classe/Subclasse: ' +FNotaSaidaParam.ME44Classe.Text + '/' +FNotaSaidaParam.ME44SubClasse.Text+
                                            FNotaSaidaParam.Ed44Classe.Text +'  Operação: '+FNotaSaidaParam.Ed44Operacao.Text +
                                            '  Período : ' +FNotaSaidaParam.ME44DtInicial.Text + ' Até ' +FNotaSaidaParam.ME44DtFinal.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRProdutoCultura.QRPrimario.Preview
    Else
      FRProdutoCultura.QRPrimario.Print;
    QRProdutoCultura.Close;
  End;

end;

procedure TFNotaSaidaCad.MostraNmeroEmbarque1Click(Sender: TObject);
begin
  inherited;
  DMEmbarque.QNotaEmbarque.Close;
  DMEmbarque.QNotaEmbarque.SetVariable('Nota',DMNotaSaida.QNotaSaidaNum_Nota.Value);
  DMEmbarque.QNotaEmbarque.SetVariable('Dt_Recebimento',DMNotaSaida.QNotaSaidaDt_Recebimento.Value);
  DMEmbarque.QNotaEmbarque.Open;
  If Not(DMEmbarque.QNotaEmbarque.Eof) Then
     ShowMessage('Embarque Número: '+  DMEmbarque.QNotaEmbarqueCod_Embarque.Text)
  Else
     ShowMessage('Nota Sem Embarque');
  DMEmbarque.QNotaEmbarque.Close;
end;

procedure TFNotaSaidaCad.DBEClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     BtConsCadastro.Click;
end;

procedure TFNotaSaidaCad.EmissoCpiaNotasIntervalo1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then // FOI RETIRADO A BONIFICAÇÃO DESTE REL. A PEDIDO DO MAYCON(MOINHO)
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application); //"bonificação que naõ tem cultura entao cara para não consertar todas"
  FNotaSaidaParam.PGRelatorio.Pages[45].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QCopiaNota.Close;
    if ((FnotaSaidaParam.Me45DtInicio.text = '') or (FnotaSaidaParam.Me45DtFim.text = '' )) then
      Raise Exception.Create('Informe o Período desejado');
    if ((FnotaSaidaParam.Me45NotaInicio.text = '') or (FnotaSaidaParam.Me45NotaFim.text = '' )) then
      Raise Exception.Create('Informe o Numero de Notas Desejado');
    QCopiaNota.SetVariable('DT_INICIO',FNotaSaidaParam.Me45DtInicio.Text);
    QCopiaNota.SetVariable('DT_FIM',FNotaSaidaParam.Me45DtFim.Text);

    QCopiaNota.SetVariable('NUMERO_I',Trim(FnotaSaidaParam.Me45NotaInicio.Text));
    QCopiaNota.SetVariable('NUMERO_F',Trim(FnotaSaidaParam.Me45NotaFim.Text));
    QCopiaNota.Open;
    While not(QCopiaNota.eof) Do
     Begin
       If QCopiaNotaInd_Entrada_Saida.Value = 'E' Then
        Begin
          DMNotaEntrada.QNotaEntrada.Close;
          DMNotaEntrada.QNotaEntrada.SetVariable('Pk',QCopiaNotaCod_Nota_Cab.Value);
          DMNotaEntrada.QNotaEntrada.Open;
          DMNotaEntrada.QItemNF.Close;
          DMNotaEntrada.QItemNF.open;
          DMNotaEntrada.QSomaItemNota.Close;
          DMNotaEntrada.QSomaItemNota.Open;
        End;

       FNotaImpressao.EmiteNF(QCopiaNotaCod_Nota_Cab.Value);
       QCopiaNota.Next;
     End;
    QCopiaNota.Close;
  End;
end;

procedure TFNotaSaidaCad.Proc_TrazItens(wCod_Nota_Cab : Integer);
begin
  With DMNotaSaida do
  Begin
    QItemNfCons.Close;
    QItemNfCons.SetVariable('COD_NOTA_CAB',wCod_Nota_Cab);
    QItemNfCons.Open;
    QItemNfCons.First;
    DMNotaSaida.pTrazPedido := True;
    While not QItemNfCons.Eof do
      With DMNotaSaida do
      Begin
        QItemNF.Insert;
        QItemNFCod_Produto.Value := QItemNfConsCod_Produto.Value;
        If QNotaSaidaConsVal_Desconto.Value > 0 Then
           QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value - (QItemNfConsVal_Desconto.Value / QItemNfConsQt_Quantidade.Value)
        else
           QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value;
        QItemNFVal_Unitario_Tabela.Value := QItemNFVal_Unitario.Value;
        QItemNFQt_Quantidade.Value := QItemNfConsQt_Quantidade.Value;
//          QItemNFVal_Desconto.Value := QItemNfConsVal_Desconto.Value;
        QItemNFCod_Tributacao.Value := QItemNfConsCod_Tributacao.Value;
        QItemNFPerc_Comissao.Value := QItemNfConsPerc_Comissao.Value;
        QItemNFCod_cultura.Value := QItemNFConsCod_Cultura.Value;
        QItemNFCod_Nota_Item_Origem.Value := QItemNFConsCod_Nota_Item.Value;
        // Itens de Ordem de Compra atualizados nos eventos da query
        QItemNfCons.Next;
      End;
      QItemNfCons.Close;
      DMNotaSaida.pTrazPedido := False;
      If DMOracle.BuscaNome('SELECT Ind_Compras FROM TB_OPERACAO',
                            'COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value),True) = 'D'  Then  // serve para colocar a msg de nota fiscal de devolucao no cabecalho
         QNotaSaidaObs.Value := 'DEV. REF. NF. NR. '+ DMNotaEntrada.QNotaEntradaConsNum_Nota.Text + ' De '+DMNotaEntrada.QNotaEntradaConsDt_Emissao.Text;
      If DMOracle.BuscaNome('SELECT Ind_Futura_Cliente FROM TB_OPERACAO',
                            'COD_OPERACAO = '+FloatToStr(QNotaSaidaCod_Operacao.Value),True) = 'S'  Then  // serve para colocar a msg de nota fiscal de Simples remessa no cabecalho
         QNotaSaidaObs.Value := 'simples remessa ref. nf de venda futura '+ DMNotaSaida.QNotaSaidaConsNum_Nota.Text + ' De '+DMNotaSaida.QNotaSaidaConsDt_Emissao.Text;

  End;
End;

procedure TFNotaSaidaCad.BtNotaCompra_ConsClick(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  FNotaEntradaCons.MeTexto.Text:= DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  If FNotaEntradaCons.ShowModal = mrOk then
    Proc_TrazItens(DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value);

end;

procedure TFNotaSaidaCad.Mov1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[3].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text),'VENDA');
    QRMovMercadoria_Sintetico.Close;

    QRMovMercadoria_Sintetico.SetVariable('DATA_I',FNotaSaidaParam.ME3DataI.Text);
    QRMovMercadoria_Sintetico.SetVariable('DATA_F',FNotaSaidaParam.ME3DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('FILIAL',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text));

    If Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('CADASTRO',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('CADASTRO',Trim(FNotaSaidaParam.FmCadastro4.MeCadastro.Text));

    If Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('OPERACAO',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('OPERACAO',Trim(FNotaSaidaParam.FmOperacao4.MeOperacao.Text));
    If Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('COD_PRODUTO',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.FmProduto4.MeProduto.Text));
    if Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('FORNECEDOR',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text));
    if Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('VENDEDOR',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text));
    if Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('DEPARTAMENTO',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('DEPARTAMENTO',Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text));
    if Trim(FNotaSaidaParam.ME3Serie.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('SERIE',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('SERIE',Trim(FNotaSaidaParam.ME3Serie.Text));
    if Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('CULTURA',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('CULTURA',Trim(FNotaSaidaParam.FmCultura4.MeCultura.Text));
    if Trim(FNotaSaidaParam.Me3Lote.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('COD_LOTE_TIPO',Null)
    else
      QRMovMercadoria_Sintetico.SetVariable('COD_LOTE_TIPO',Trim(FNotaSaidaParam.Me3Lote.Text));
    If Trim(FNotaSaidaParam.Me3Classe.Text)= ''   then
      QRMovMercadoria_Sintetico.SetVariable('COD_CLASSE',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('COD_CLASSE',FNotaSaidaParam.Me3Classe.Text);
    If (Trim(FNotaSaidaParam.Me3SubClasse.Text)= '') or
       (Trim(FNotaSaidaParam.Me3SubClasse.Text)= '0')  then
      QRMovMercadoria_Sintetico.SetVariable('COD_SUBCLASSE',Null)
    Else
      QRMovMercadoria_Sintetico.SetVariable('COD_SUBCLASSE',FNotaSaidaParam.Me3SubClasse.Text);
    Case FNotaSaidaParam.Rg3TipoNota.ItemIndex of
       0 : QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA','E');
       1 : QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA','S');
       2 : QRMovMercadoria_Sintetico.SetVariable('ENTRADA_SAIDA',Null);
    End;
    Case FNotaSaidaParam.RG3CondicaoPagto.ItemIndex of
       0 : QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO','1');
       1 : QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO','2');
       2 : QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO','3');
       3 : QRMovMercadoria_Sintetico.SetVariable('CONDICAO_PAGTO',Null);
    End;
    {QRMovMercadoria_Sintetico.SQL[QRMovMercadoria_Sintetico.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.Rg3Ordem.ItemIndex of
      0:QRMovMercadoria_Sintetico.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.NUM_NOTA');
      1:QRMovMercadoria_Sintetico.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.DT_EMISSAO');
    End; }
    QRMovMercadoria_Sintetico.Open;


    If FRMovMercadoria_Sintetico = Nil then
      FRMovMercadoria_Sintetico := TFRMovMercadoria_Sintetico.Create(Application);
      FRMovMercadoria_Sintetico.QRLPeriodo.Caption := 'Filial: ' + Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text)+' '+Trim(FNotaSaidaParam.FmFilial4.MeFilial.Text)+
                                                      ' Periodo: '+ FNotaSaidaParam.ME3DataI.Text +' ate '+ FNotaSaidaParam.ME3DataF.Text;
      FRMovMercadoria_Sintetico.QRLVendedor.Caption := 'Vendedor: '+Trim(FNotaSaidaParam.FmVendedor4.MeVendedor.Text)+' '+Trim(FNotaSaidaParam.FmVendedor4.EdVendedor.Text)+
                                                       ' Fornecedor: '+Trim(FNotaSaidaParam.FmFornecedor4.MeCadastro.Text)+' '+Trim(FNotaSaidaParam.FmFornecedor4.EdCadastro.Text);
      FRMovMercadoria_Sintetico.QRLDepartamento.Caption :='Departamento: '+Trim(FNotaSaidaParam.FmDepartamento4.MeDepartamento.Text)+' '+Trim(FNotaSaidaParam.FmDepartamento4.EdDepartamento.Text)+
                                                          ' Série: '+FNotaSaidaParam.ME3Serie.Text;
    //wstrS := '';
    //If(Trim(FNotaSaidaParam.ME3Filial.Text)<>'')Then
    //  wstrS := 'Filial: ' + Trim(FNotaSaidaParam.ME3Filial.Text)+' '+Trim(FNotaSaidaParam.Ed3Filial.Text)
    //Else
    //  wstrS := 'Filial: Todas';
    //wstrS := wstrS + ' De '+FNotaSaidaParam.ME3DataI.Text+' Até '+FNotaSaidaParam.ME3DataF.Text;
   // FRNota_MovMercadoria.QRLPeriodo.Caption := wstrS;
   // wstrS := '';
    //If(Trim(FNotaSaidaParam.ME3Fornecedor.Text)<>'')Then
    //  wstrS := 'Fornecedor: ' + Trim(FNotaSaidaParam.ME3Fornecedor.Text) + ' ' + Trim(FNotaSaidaParam.Ed3Fornecedor.Text)
    //Else
   //   wstrS := 'Fornecedor: Todos';
    //If(FNotaSaidaParam.ME3Vendedor.Text <> '')Then
   //   wstrS := wstrS + ' - Repr.Comercial: ' + Trim(FNotaSaidaParam.ME3Vendedor.Text) + ' ' + Trim(FNotaSaidaParam.Ed3Vendedor.Text)
    //Else
   //   wstrS := wstrS + 'Repr.Comercial: Todos';
   // FRNota_MovMercadoria.QrlFornecedor.Caption := wstrS;
    //FRNota_MovMercadoria.QRLDepartamento.Caption := 'Departamento:'+FNotaSaidaParam.ME3Departamento.Text+' '+FNotaSaidaParam.Ed3Departamento.Text;
   // FRNota_MovMercadoria.QRLSerie.Caption := 'Serie:'+FNotaSaidaParam.ME3Serie.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRMovMercadoria_Sintetico.QRPrimario.Preview
    Else
      FRMovMercadoria_Sintetico.QRPrimario.Print;
    QRMovMercadoria_Sintetico.Close;

  End;

end;

procedure TFNotaSaidaCad.ExtratodeProdutosAgrcola1Click(Sender: TObject);
begin
  inherited;
  //-------------------------------------------
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[46].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DMUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.FmFilial47.MeFilial.Text),'VENDA');
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

    if Trim(FNotaSaidaParam.Me47Operacao.Text) <> '' Then
       QRExtratoAgricola.SetVariable('DESC_OPERACAO','TB_NOTA_CAB.COD_OPERACAO IN (' + Trim(FNotaSaidaParam.Me47Operacao.Text+ ')'))
    Else
       QRExtratoAgricola.SetVariable('DESC_OPERACAO','1=1');
    if (Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text) = '') or (Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text) = '') then
      Raise Exception.Create('Deve-se Fornecer um Intervalo de Datas Válido.')
    else
    begin
      QRExtratoAgricola.SetVariable('DT_INICIAL', Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text));
      QRExtratoAgricola.SetVariable('DT_FINAL',   Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text));
    end;

    QRExtratoAgricola.Open;
    //--------------------------------------------------------------------------
    if FRExtratoProdutoAgricola = Nil then
      FRExtratoProdutoAgricola := TFRExtratoProdutoAgricola.Create(Application);

    if FNotaSaidaParam.RgICMS47.ItemIndex = 0 then
    begin
      //Trocar o Campo com ICMS
      FRExtratoProdutoAgricola.QRDBVal_Unitario.DataField     := 'VAL_UNITARIO_COM_ICMS';
      FRExtratoProdutoAgricola.QRDBVal_Total.DataField        := 'VAL_TOTAL_COM_ICMS';
      FRExtratoProdutoAgricola.QRExprValorUnitario.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_COM_ICMS) / SUM(QRExtratoAgricola.QUANTIDADE) * QRExtratoAgricola.EMBALAGENS';
      FRExtratoProdutoAgricola.QRExprValorTotal.Expression    := 'SUM(QRExtratoAgricola.VAL_TOTAL_COM_ICMS)';
      FRExtratoProdutoAgricola.QRLIcms.Caption                := 'com ICMS';
      //------------------------
    end;
    if FNotaSaidaParam.RgICMS47.ItemIndex = 1 then
    begin
      //Trocar o Campo sem ICMS
      FRExtratoProdutoAgricola.QRDBVal_Unitario.DataField     := 'VAL_UNITARIO_SEM_ICMS';
      FRExtratoProdutoAgricola.QRDBVal_Total.DataField        := 'VAL_TOTAL_SEM_ICMS';
      FRExtratoProdutoAgricola.QRExprValorUnitario.Expression := 'SUM(QRExtratoAgricola.VAL_TOTAL_SEM_ICMS) / SUM(QRExtratoAgricola.QUANTIDADE) * QRExtratoAgricola.EMBALAGENS';
      FRExtratoProdutoAgricola.QRExprValorTotal.Expression    := 'SUM(QRExtratoAgricola.VAL_TOTAL_SEM_ICMS)';
      FRExtratoProdutoAgricola.QRLIcms.Caption                := 'sem ICMS';
      //------------------------
    end;

    //Cabeçalho-------------------------------
    FRExtratoProdutoAgricola.QRLFilial.Caption  := Trim(FNotaSaidaParam.FmFilial47.EdFilial.Text);
    FRExtratoProdutoAgricola.QRLPeriodo.Caption := 'De: ' + Trim(FNotaSaidaParam.FmDatas47.MeDtInicial.Text) + ' Até: ' + Trim(FNotaSaidaParam.FmDatas47.MeDtFinal.Text);
    //----------------------------------------
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRExtratoProdutoAgricola.QRPrimario.Preview
    Else
      FRExtratoProdutoAgricola.QRPrimario.Print;
    QRExtratoAgricola.Close;
  end;
  //-------------------------------------------
end;

procedure TFNotaSaidaCad.VendaporClasseeData1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[47].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial8.MeFilial.Text),'VENDA');
    QRVendaClasseData.Close;
    QRVendaClasseData.SetVariable('DATA_I',FNotaSaidaParam.ME48DataI.Text);
    QRVendaClasseData.SetVariable('DATA_F',FNotaSaidaParam.ME48DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text)= ''   then
      QRVendaClasseData.SetVariable('FILIAL',Null)
    Else
      QRVendaClasseData.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text));

    If Trim(FNotaSaidaParam.ME48Classe.Text)= ''   then
      QRVendaClasseData.SetVariable('CLASSE',Null)
    Else
      QRVendaClasseData.SetVariable('CLASSE',FNotaSaidaParam.ME48Classe.Text);

    If (Trim(FNotaSaidaParam.ME48SubClasse.Text)= '' ) or
       (Trim(FNotaSaidaParam.ME48SubClasse.Text)= '0') then
      QRVendaClasseData.SetVariable('SUB_CLASSE',Null)
    Else
      QRVendaClasseData.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME48SubClasse.Text);

    If Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text)= '' then
      QRVendaClasseData.SetVariable('VENDEDOR',Null)
    Else
      QRVendaClasseData.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text));
    QRVendaClasseData.Open;

    //

    QRVendaClasseDataResumo.Close;
    QRVendaClasseDataResumo.SetVariable('DATA_I',FNotaSaidaParam.ME48DataI.Text);
    QRVendaClasseDataResumo.SetVariable('DATA_F',FNotaSaidaParam.ME48DataF.Text);

    If Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text)= ''   then
      QRVendaClasseDataResumo.SetVariable('FILIAL',Null)
    Else
      QRVendaClasseDataResumo.SetVariable('FILIAL',Trim(FNotaSaidaParam.FmFilial48.MeFilial.Text));

    If Trim(FNotaSaidaParam.ME48Classe.Text)= ''   then
      QRVendaClasseDataResumo.SetVariable('CLASSE',Null)
    Else
      QRVendaClasseDataResumo.SetVariable('CLASSE',FNotaSaidaParam.ME48Classe.Text);

    If (Trim(FNotaSaidaParam.ME48SubClasse.Text)= '' ) or
       (Trim(FNotaSaidaParam.ME48SubClasse.Text)= '0') then
      QRVendaClasseDataResumo.SetVariable('SUB_CLASSE',Null)
    Else
      QRVendaClasseDataResumo.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME48SubClasse.Text);

    If Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text)= '' then
      QRVendaClasseDataResumo.SetVariable('VENDEDOR',Null)
    Else
      QRVendaClasseDataResumo.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.FmVendedor48.MeVendedor.Text));
    QRVendaClasseDataResumo.Open;

    //

    If FRNota_ClasseData = Nil then
      FRNota_ClasseData := TFRNota_ClasseData.Create(Application);
    If FRNota_ClasseDataRes = Nil then
      FRNota_ClasseDataRes := TFRNota_ClasseDataRes.Create(Application);
    FRNota_ClasseData.QRLTitulo.Caption := 'Vendas por classe, sub-classe e Data de '+ FNotaSaidaParam.ME48DataI.Text+' até '+FNotaSaidaParam.ME48DataF.Text;
    FRNota_ClasseData.QRLFilial.Caption := FNotaSaidaParam.FmFilial48.EdFilial.Text;
    FRNota_ClasseDataRes.QRLTitulo.Caption := FRNota_ClasseData.QRLTitulo.Caption;
    FRNota_ClasseDataRes.QRLFilial.Caption := FRNota_ClasseData.QRLFilial.Caption;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
    Begin
//      FRNota_ClasseData.QRPrimario.Preview;
//      FRNota_ClasseDataRes.QRPrimario.Preview;

      FRNota_ClasseData.QRCompositeReport1.Preview;
    end
    Else
      FRNota_ClasseData.QRCompositeReport1.Print;
    QRVendaClasseData.Close;
    QRVendaClasseDataResumo.Close;
  End;
end;

procedure TFNotaSaidaCad.SbPesquisaFluxoTremClick(Sender: TObject);
begin
  inherited;
  if FControleTremCons = Nil then
    FControleTremCons := TFControleTremCons.Create(Application);
  if FControleTremCons.ShowModal = MrOk then
    DMNotaSaida.QNotaSaidaCOD_FLUXO_TREM.Value := DMControleTrem.QControleTremConsCOD_FLUXO_TREM.Value;

end;

procedure TFNotaSaidaCad.HistricodeVendas1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[48].TabVisible := true;
  if FNotaSaidaParam.ShowModal = MrOk then
  begin
    if (trim(FNotaSaidaParam.Me49Data_I.Text) = '') or (trim(FNotaSaidaParam.Me49Data_F.Text) = '') then
      Raise Exception.Create('Intervalo de datas nao informado');

    with DMRelatorio_Venda do
    begin
      QRHistoricoVendas.Close;
      QRHistoricoVendas.SetVariable('DATA_I', trim(FNotaSaidaParam.Me49Data_I.Text));
      QRHistoricoVendas.SetVariable('DATA_F', trim(FNotaSaidaParam.Me49Data_F.Text));
      QRHistoricoVendas.Open;

      if FRHistoricoVendas = Nil then
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
Var
  wNomeRelatorio : String;
  parametrosRelatorio : String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[49].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRFutura_Atendido.Close;
    QRFutura_Atendido.Sql.Clear;
    QRFutura_Atendido.Sql.Add('SELECT Tb_nota_aux.COD_NOTA_AUX, Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,');
    QRFutura_Atendido.Sql.Add('Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.DESC_PRODUTO,Tb_produto.COD_PRODUTO,tb_nota_cab.NUM_NOTA,');
    QRFutura_Atendido.Sql.Add('Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,Tb_nota_cab.COD_SERIE,Tb_nota_cab.DT_EMISSAO,NF_ITEM.COD_LOTE_TIPO,');
    QRFutura_Atendido.Sql.Add('Tb_nota_item.VAL_UNITARIO,Tb_nota_cab.VAL_FUNRURAL, Tb_baixa_aux.QT_QUANTIDADE, ');
    QRFutura_Atendido.Sql.Add('NF_CAB.DT_EMISSAO DT_BAIXA,NF_CAB.NUM_NOTA NF_BAIXA, NF_CAB.COD_SERIE NF_SERIE,');
    QRFutura_Atendido.Sql.Add('DECODE(Tb_nota_cab.VAL_DESCONTO,0,0,Tb_nota_item.VAL_DESCONTO / Tb_nota_item.QT_QUANTIDADE) AS VAL_DESCONTO,');
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
    Case FNotaSaidaParam.CB50TipoFutura.ItemIndex of
       0 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'COM_FUT' + Chr(39));
             wNomeRelatorio := 'Rel. Notas de Compra Futura';
           End;
       1 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'VEN_FUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Venda Futura';
           End;
       2 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
           End;
       3 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
           End;
       4 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
           End;
       5 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
           End;
       6 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_EMP' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
           End;
       7 : Begin
             QRFutura_Atendido.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_OUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito Outras Empresas';
           End;
       Else
         Raise Exception.Create('Nenhum tipo de Futura selecionado!');
    End;
    If Trim(FNotaSaidaParam.FmCadastro47.MeCadastro.Text) <> '' then
       QRFutura_Atendido.Sql.Add(' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.FmCadastro50.MeCadastro.Text));
    If Trim(FNotaSaidaParam.FmFilial47.MeFilial.Text) <> '' then
       QRFutura_Atendido.Sql.Add(' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.FmFilial50.MeFilial.Text));
    If Trim(FNotaSaidaParam.FmProduto47.MeProduto.Text) <> '' then
       QRFutura_Atendido.Sql.Add(' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.FmProduto50.MeProduto.Text));
    If Trim(FNotaSaidaParam.FmLote50.MeLote.Text) <> '' then
       QRFutura_Atendido.Sql.Add(' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaSaidaParam.FmLote50.MeLote.Text));
    If Trim(FNotaSaidaParam.ME50DtI.Text) <> '' Then
       QRFutura_Atendido.Sql.Add(' And NF_CAB.DT_EMISSAO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME50DtI.Text) + chr(39));
    If Trim(FNotaSaidaParam.ME50DtF.Text) <> '' Then
       QRFutura_Atendido.Sql.Add(' And NF_CAB.DT_EMISSAO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME50DtF.Text) + chr(39));
    QRFutura_Atendido.SQL.Add(' ORDER BY COD_CADASTRO,Tb_nota_item.COD_PRODUTO, TB_NOTA_CAB.NUM_NOTA');
    QRFutura_Atendido.Open;
    If FRNota_VendaFuturaAtendida = Nil then
      FRNota_VendaFuturaAtendida := TFRNota_VendaFuturaAtendida.Create(Application);

    FRNota_VendaFuturaAtendida.QRLTitulo.Caption := wNomeRelatorio;

    parametrosRelatorio := 'Filial:'+Trim(FNotaSaidaParam.FmFilial50.MeFilial.Text) + ' - ' + Trim(FNotaSaidaParam.FmFilial50.EdFilial.Text);
    parametrosRelatorio := parametrosRelatorio + ', De ' + FNotaSaidaParam.ME50DtI.Text + ' Até ' + FNotaSaidaParam.ME50DtF.Text;

    FRNota_VendaFuturaAtendida.parametrosUtilizados.Lines.Clear;
    FRNota_VendaFuturaAtendida.parametrosUtilizados.Lines.Add(parametrosRelatorio);

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_VendaFuturaAtendida.QRPrimario.Preview
    Else
       FRNota_VendaFuturaAtendida.QRPrimario.Print;
    QRFutura_Atendido.Close;
  End;
end;


procedure TFNotaSaidaCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    if DMNotaSaida.QNotaSaidaCOD_SERIE.Value = '2' then
      DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value :=
      'DANFE Documento Auxiliar da Nota Fiscal Eletronica saida serie 1. ' +
      'Conforme Lacre num:   Placa:'
  end;
end;

function TFNotaSaidaCad.LocalizaConhecimento(cod: String): Integer;
var i: Integer;
Begin
  for i := 0 to CbConhecimentoExp.Items.Count -1 do
    if (copy(CbConhecimentoExp.Items[i], 1, 2) = cod) then
    Begin
      Result := i;
      Exit;
    End;
  Result := -1;
End;

procedure TFNotaSaidaCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
end;

procedure TFNotaSaidaCad.MELocalizaExit(Sender: TObject);
begin
  inherited;

  CbConhecimentoExp.ItemIndex := LocalizaConhecimento(DMNotaSaida.QNotaSaidaIND_TIPO_CONHECIMENTO.Value);
end;

procedure TFNotaSaidaCad.BtArmazemAlfandegarioClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFNotaSaidaCad.DBPanel11CodigoExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
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
     DBPanel11.OnCodigoExit(self);
    end;
  end;
end;

end.
