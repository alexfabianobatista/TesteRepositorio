unit UPedidoCad;

interface

uses                                                                  
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, ActiveX, ComObj,
  DBDirceu, variants, UFmHistorico, UThreadLocal, ActnList,jpeg,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ExtDlgs, DBPanel, UFmVeiculo;

type
  TFPedidoCad = class(TFTCadSimples)
    PCPedido: TPageControl;
    TSPedido: TTabSheet;
    TSItem: TTabSheet;
    Label1: TLabel;
    DBECodPedido: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBValDesconto: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsOperacao: TBitBtn;
    BtConsVendedor: TBitBtn;
    Label13: TLabel;
    DBEdit19: TDBEdit;
    Label16: TLabel;
    DBEdit20: TDBEdit;
    Label17: TLabel;
    DBECodProduto: TDBEdit;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    DBEdit23: TDBEdit;
    Label20: TLabel;
    DBEdit24: TDBEdit;
    Label23: TLabel;
    DBEdit27: TDBEdit;
    LblLote: TLabel;
    DBELote: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsTributacao: TBitBtn;
    DBGItemPedido: TDBGrid;
    Label25: TLabel;
    DBEdit32: TDBEdit;
    PedidosAbertos1: TMenuItem;
    Outros1: TMenuItem;
    CancelaQtdePedido1: TMenuItem;
    Produto1: TMenuItem;
    Embarques1: TMenuItem;
    Espelho1: TMenuItem;
    PedidosCancelados1: TMenuItem;
    DBEPercComissao: TDBEdit;
    LblComissao: TLabel;
    DBEdit7: TDBEdit;
    LblCodProdutoAux: TLabel;
    DBECodProdutoAux: TDBEdit;
    Pedidosnoperiodo1: TMenuItem;
    AcompanhamentoPedidos1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PedidosAbertoscomPreoMdio1: TMenuItem;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    PedidosAbertosporVencimento1: TMenuItem;
    DBRGTipoPagamento: TDBRadioGroup;
    OracleNavigator1: TOracleNavigator;
    PosioPedidosCEstoque1: TMenuItem;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    DBEdit34: TDBEdit;
    Label29: TLabel;
    DBEdit35: TDBEdit;
    BtConsLote: TBitBtn;
    BitBtn1: TBitBtn;
    OramentoviaWord1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Label30: TLabel;
    DBEdit37: TDBEdit;
    BtConsProdutoAux: TBitBtn;
    PedidoscomNotaFiscal1: TMenuItem;
    DBGrid2: TDBGrid;
    Label32: TLabel;
    DbGridEstoque: TDBGrid;
    Label31: TLabel;
    DBEdit38: TDBEdit;
    DBDLote: TDBDirceu;
    DBDirceu3: TDBDirceu;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit39: TDBEdit;
    Label37: TLabel;
    DBEPrazo: TDBEdit;
    BtConsPrazo: TBitBtn;
    DBRadioGroup2: TDBRadioGroup;
    DBEDescProduto: TDBEdit;
    SpeedButton1: TSpeedButton;
    LblFormaCompra: TLabel;
    LblAutoriza: TLabel;
    Label35: TLabel;
    DBEdit43: TDBEdit;
    DBDUnid: TDBDirceu;
    DBDEmb: TDBDirceu;
    LblUnid: TLabel;
    LblEmb: TLabel;
    DBEdit44: TDBEdit;
    Label36: TLabel;
    DBEdit45: TDBEdit;
    Label38: TLabel;
    DBEdit46: TDBEdit;
    Label39: TLabel;
    DBEdit47: TDBEdit;
    Label40: TLabel;
    DBEdit48: TDBEdit;
    PedidosComValor1: TMenuItem;
    PedidosComCusto1: TMenuItem;
    Comisso1: TMenuItem;
    Label26: TLabel;
    DBEdit33: TDBEdit;
    Label41: TLabel;
    DBEdit49: TDBEdit;
    Label42: TLabel;
    DBEdit50: TDBEdit;
    Label43: TLabel;
    DBEdit51: TDBEdit;
    BtConsMensagem: TBitBtn;
    DBDirceu4: TDBDirceu;
    DBDirceu7: TDBDirceu;
    BtConsDepartamento: TBitBtn;
    Label44: TLabel;
    DBEdit52: TDBEdit;
    BtConsBanco: TBitBtn;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    BaixaEstoque1: TMenuItem;
    VoltaBaixaEstoque1: TMenuItem;
    CancelamentoTotaldoPedido1: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    BtImpItemPed: TBitBtn;
    PedidosporRepresentante1: TMenuItem;
    Label46: TLabel;
    DBEdit16: TDBEdit;
    AcompanhamentoPedidoPFornecedor1: TMenuItem;
    Label47: TLabel;
    DBEdit17: TDBEdit;
    BtConsCultura: TBitBtn;
    Label34: TLabel;
    DBEdit18: TDBEdit;
    TsMateriais: TTabSheet;
    DBGrid3: TDBGrid;
    OracleNavigator2: TOracleNavigator;
    GBUsuariosQueLiberaram: TGroupBox;
    Label49: TLabel;
    DBEdit36: TDBEdit;
    Label50: TLabel;
    DBEdit42: TDBEdit;
    Label51: TLabel;
    DBEdit53: TDBEdit;
    Label52: TLabel;
    DBEdit54: TDBEdit;
    Label53: TLabel;
    BtConsOrigem: TBitBtn;
    Label54: TLabel;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    Label55: TLabel;
    MostraoCdigodoEmbarque1: TMenuItem;
    LblSituacao: TLabel;
    PedidosporSupervisor1: TMenuItem;
    DBENumFabricante: TDBEdit;
    TsCustos: TTabSheet;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    SpeedButton2: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBEdit61: TDBEdit;
    Label60: TLabel;
    DBEdit62: TDBEdit;
    DBGrid4: TDBGrid;
    OracleNavigator3: TOracleNavigator;
    DSCustoFuncionario: TDataSource;
    SBEmite: TSpeedButton;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    DBEdit63: TDBEdit;
    TsAdiantamentos: TTabSheet;
    FmHistorico: TFmHistorico;
    Label61: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MeValor: TMaskEdit;
    BitBtn5: TBitBtn;
    Label69: TLabel;
    DBEdit64: TDBEdit;
    Label70: TLabel;
    MeSaldo: TMaskEdit;
    DBGrid5: TDBGrid;
    DsCaixaPedido: TDataSource;
    BtConsMotivo: TBitBtn;
    LblMarca: TLabel;
    DBECodMarca: TDBEdit;
    BtConsMarca: TBitBtn;
    DBDMarca: TDBDirceu;
    DbEVeiculo: TDBEdit;
    LVeiculo: TLabel;
    DbETecido: TDBEdit;
    LTecido: TLabel;
    DbEFormaPagamento: TDBEdit;
    LFormaPagamento: TLabel;
    ApagarPedidosAntigos1: TMenuItem;
    PreodeVendaXPreoVendido1: TMenuItem;
    CotasporVendedor1: TMenuItem;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    BtTransportador: TBitBtn;
    DBDirceu2: TDBDirceu;
    OramentoviaExcel1: TMenuItem;
    Label45: TLabel;
    DBEdit12: TDBEdit;
    lblImagemNaoCadastrada: TLabel;
    btnIncluirImagem: TBitBtn;
    btnExcluirImagem: TBitBtn;
    MECaminhoImagem: TMaskEdit;
    btnProcurar: TBitBtn;
    Label48: TLabel;
    OPDImagem: TOpenPictureDialog;
    DBPanel1: TDBPanel;
    DSImagemPedido: TDataSource;
    Bevel1: TBevel;
    ImgPedido: TImage;
    Label71: TLabel;
    DBEdit13: TDBEdit;
    Label72: TLabel;
    DBEdit65: TDBEdit;
    DBEdit21: TDBEdit;
    Label73: TLabel;
    LblVendedorPreposto: TLabel;
    DBEdit28: TDBEdit;
    BtConsVendedorPre: TBitBtn;
    DBDirceu5: TDBDirceu;
    LBLComissaoPre: TLabel;
    DBEComissaoPre: TDBEdit;
    DBEdit40: TDBEdit;
    Label74: TLabel;
    Label76: TLabel;
    DBEdit71: TDBEdit;
    Label75: TLabel;
    DBEdit41: TDBEdit;
    N4: TMenuItem;
    PrForma1: TMenuItem;
    DBEdit57: TDBEdit;
    Label77: TLabel;
    DBPObra: TDBPanel;
    Panel2: TPanel;
    Label21: TLabel;
    DBEdit25: TDBEdit;
    Label22: TLabel;
    DBEQtdCancelado: TDBEdit;
    DBPanel2: TDBPanel;
    DBRConsumidor: TDBRadioGroup;
    EdNumFabricante: TEdit;
    Label78: TLabel;
    LbVeiculo: TLabel;
    MEPlaca: TMaskEdit;
    SBVeiculo: TSpeedButton;
    EdModelo: TEdit;
    PedidosporFornecedorExcel1: TMenuItem;
    Panel4: TPanel;
    Label12: TLabel;
    MESeqEmbarque: TMaskEdit;
    MENumEmbarque: TMaskEdit;
    Label7: TLabel;
    SBEmbarqueCons: TSpeedButton;
    SBIncluiEmbarque: TSpeedButton;
    SBEmbarque: TSpeedButton;
    Image1: TImage;
    DBDirceu6: TDBDirceu;
    LDescontoVisual: TLabel;
    DBEValDescontoVisual: TDBEdit;
    Label79: TLabel;
    Label80: TLabel;
    DBMInfAdicional: TDBMemo;
    tbsImagem: TTabSheet;
    lblImagemNaoCadastrada2: TLabel;
    Bevel2: TBevel;
    ImgPedido2: TImage;
    btnIncluirImagem2: TBitBtn;
    btnExcluirImagem2: TBitBtn;
    MECaminhoImagem2: TMaskEdit;
    DBEdit66: TDBEdit;
    Label82: TLabel;
    btnProcurar2: TBitBtn;
    BitBtn2: TBitBtn;
    DBMemo1: TDBMemo;
    Label81: TLabel;
    DBEdit14: TDBEdit;
    Label83: TLabel;
    Label84: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    EtiquetasPedido1: TMenuItem;
    Oramento1: TMenuItem;
    DBEdit69: TDBEdit;
    Label85: TLabel;
    Label86: TLabel;
    DBEdit70: TDBEdit;
    sbImportarPedidoRetifoz: TSpeedButton;
    ODImportaXLS: TOpenDialog;
    DBCarencia: TDBComboBox;
    LblCarencia: TLabel;
    Label87: TLabel;
    DBEdit72: TDBEdit;
    AtualizaPreonoPedido1: TMenuItem;
    TSMedidasInjepar: TTabSheet;
    GroupBox1: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit77: TDBEdit;
    Label96: TLabel;
    Label97: TLabel;
    DBEdit78: TDBEdit;
    Label98: TLabel;
    Label99: TLabel;
    DBEdit79: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    CancelarPedidoMxima1: TMenuItem;
    AlterarCondiodePagamento1: TMenuItem;
    LblDtComissao: TLabel;
    DBDtComissao: TDBEdit;
    Label100: TLabel;
    MEPercDesconto: TMaskEdit;
    Conferncia1: TMenuItem;
    SBEntrega: TSpeedButton;
    QuantidadedeItensnosPedidos1: TMenuItem;
    LPlaca: TLabel;
    DBENumPlaca: TDBEdit;
    LAno: TLabel;
    DBENumAno: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PedidosAbertos1Click(Sender: TObject);
    procedure CancelaQtdePedido1Click(Sender: TObject);
    procedure DBEQtdCanceladoExit(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure SBEmbarqueClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure Espelho1Click(Sender: TObject);
    procedure PedidosCancelados1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Pedidosnoperiodo1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure AcompanhamentoPedidos1Click(Sender: TObject);
    procedure PedidosAbertoscomPreoMdio1Click(Sender: TObject);
    procedure PedidosAbertosporVencimento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PosioPedidosCEstoque1Click(Sender: TObject);
    procedure BtConsProdutoAuxClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure OramentoviaWord1Click(Sender: TObject);
    function GetOrCreateObject(const ClassName: string): IDispatch;
    procedure DBEdit5Exit(Sender: TObject);
    procedure PedidoscomNotaFiscal1Click(Sender: TObject);
    procedure DBECodProdutoChange(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure BtConsPrazoClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BtCopiaClick(Sender: TObject);
    procedure BtConsCulturaClick(Sender: TObject);
    procedure DBRGTipoPagamentoClick(Sender: TObject);
    procedure PedidosComValor1Click(Sender: TObject);
    procedure PedidosComCusto1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure BaixaEstoque1Click(Sender: TObject);
    procedure VoltaBaixaEstoque1Click(Sender: TObject);
    procedure CancelamentoTotaldoPedido1Click(Sender: TObject);
    procedure BtImpItemPedClick(Sender: TObject);
    procedure PedidosporRepresentante1Click(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcompanhamentoPedidoPFornecedor1Click(Sender: TObject);
    procedure DBEPrazoChange(Sender: TObject);
    procedure BtConsOrigemClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure MostraoCdigodoEmbarque1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure PedidosporSupervisor1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBEmiteClick(Sender: TObject);
    procedure DBEdit63Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PCPedidoChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure BtConsMarcaClick(Sender: TObject);
    procedure ApagarPedidosAntigos1Click(Sender: TObject);
    procedure SBIncluiEmbarqueClick(Sender: TObject);
    procedure SBEmbarqueConsClick(Sender: TObject);
    procedure PreodeVendaXPreoVendido1Click(Sender: TObject);
    procedure CotasporVendedor1Click(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure BtTransportadorClick(Sender: TObject);
    procedure OramentoviaExcel1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure OracleNavigator1BeforeAction(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure btnIncluirImagemClick(Sender: TObject);
    procedure btnExcluirImagemClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure AtualizarImagemPedido;
    procedure AtualizarImagemPedido2;
    procedure DSImagemPedidoDataChange(Sender: TObject; Field: TField);
    procedure DBPanel1CodigoChange(Sender: TObject);
    procedure DBECodProdutoExit(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure BtConsVendedorPreClick(Sender: TObject);
    procedure PrForma1Click(Sender: TObject);
    procedure SBImpressaoEspelhoClick(Sender: TObject);
    procedure DBPObraDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2CodigoExit(Sender: TObject);
    procedure DBPanel2AfterConsulta(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBPanel2CodigoChange(Sender: TObject);
    procedure DBPanel2Exit(Sender: TObject);
    procedure DBPanel2Enter(Sender: TObject);
    procedure DBRConsumidorClick(Sender: TObject);
    procedure EdNumFabricanteExit(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure MEPlacaExit(Sender: TObject);
    function TabelaPrecoVencida: Boolean;
    procedure PedidosporFornecedorExcel1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcurar2Click(Sender: TObject);
    procedure btnIncluirImagem2Click(Sender: TObject);
    procedure btnExcluirImagem2Click(Sender: TObject);
    procedure ImprimirImagem1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit68Exit(Sender: TObject);
    procedure EtiquetasPedido1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBECodProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumFabricanteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImportarPedidoRetifozClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AtualizaPreonoPedido1Click(Sender: TObject);
    procedure DBEdit24Enter(Sender: TObject);
    procedure DBRGTipoPagamentoChange(Sender: TObject);
    procedure DBPVendedor2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure CancelarPedidoMxima1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure AlterarCondiodePagamento1Click(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure SBEntregaClick(Sender: TObject);
    procedure QuantidadedeItensnosPedidos1Click(Sender: TObject);

  private
    wAlterouLista: boolean;
    wCodigoTabelaPreco: integer; // Utilizado no change do componente. Para saber se código foi alterado ou não
    thread: TThreadLocal;
    function salvaImagemPedido(caminho: String):Boolean;
    procedure pegaPrecoPrazoVendedor;
    procedure AtualizaCodListaPreco;
    procedure Etiqueta8x3NeoAli(Sender: TObject);
    Procedure Preco_Radiolandia;
  public
    { Public declarations }
    procedure ApagarAntigos(Sender: TObject);
  end;

var
  FPedidoCad: TFPedidoCad;
  newWord: Variant;
  wAlterou : String;  // este campo serve para verificar se alterou condicao de pagamento ou prazo - para atualizar preços radiolandia - César

implementation

uses UPedido_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UVendedorCons, UVendedor_cl, UOracle_cl,
  UProdutoCons, UProduto_cl, UTipoLoteCons, UTipoLote_cl, UTributacaoCons,
  UTributacao_cl, UPedidoCons, UPedidoParam, URPedido_Aberto,
  URPedido_Produto, UEmbarqueCad, URPedido_Espelho, USequencia_cl,
  UPedidoCancela, URPedido_Cancelado, UFRPedidoPeriodo,
  URPedidoAcomp, URPedido_Preco_Medio, URPedAberto_Venc, URPedidoEstoque,
  UParamSistema_cl, URPedido_BaseTroca, UBiblioteca, URPedidosComNota,
  URelatorioVenda_cl, UEstoque_cl, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UNotaSaidaCad, UNotaSaida_cl, UTela_cl, UUsuario_cl,
  UCulturaCons, UCultura_cl, URPedidoValor, URPedidoCusto, URPedidoComissao,
  UMensagemCons, UDepartamentoCons, UMensagem_cl, UDepartamento_cl,
  UBancosCons, UBancoAgencia_cl, URPedidoRepresentante, UContaCorrenteCons,
  URPedidosFornecedor, UEstadoCons, UEstado_cl, UMotivoCons, UMotivo_cl,
  URPedidoSupervisor, USenha, UHistorico_cl, UPlanilha_cl, URReciboCaixa,
  UFFuncionarioCons, UFuncionario_cl, UMarca_cl, UMarcaCons, UEmbarqueCons,
  UEmbarque_cl, URPrecoVendidoPedido, URPrecoVendido, URCotaVendedorPedido,
  URPedidoEspelho1, Math, UBibliotecaUI, UPrecoPrazoVendedor_cl, UFmMarca,
  UPedidoEspelhoWeb, UObraCons, UTabelaPrecoCons, UBibVenda, UVeiculo_cl, UControleEntregaCad,
  UVeiculoCons, UVeiculoCad, URImagemPedido, URPedido_2Vias, UROrcamentoProdutoServico, URPedidoItemQtd, URPedidoItemQtdCidade,
  UROrcamento, URPedido_Espelho2, URPedidoNeoAli, UClassCadastro_cl, UFConferenciaPedidoCodBarras,
  URPedidoSigVans, URPedidoItemQtdCliente;

{$R *.DFM}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';
function A_Feed_Label():integer;stdcall;external 'WINPPLA.DLL';
function A_GetUSBDeviceInfo(nPort:integer; pDeviceName:PAnsiChar; pDeviceNameLen:PInteger;
              pDevicePath:PAnsiChar; pDevicePathLen:PInteger):integer;stdcall;external 'WINPPLA.DLL';
function  A_EnumUSB(buf:PAnsiChar):integer;stdcall;external 'WINPPLA.DLL';
function  A_GetUSBBufferLen():integer;stdcall;external 'WINPPLA.DLL';
function  A_Set_Backfeed(back:integer):integer;stdcall;external 'WINPPLA.DLL';

procedure TFPedidoCad.FormActivate(Sender: TObject);
var  wDescTipoFuncionario : String;
begin
  inherited;
  SBVeiculo.Visible := false;
  if (DMParamSistema.CodEmpresa <> 'DINIZ') then
  begin
    SBEntrega.Enabled := false;
    SBEntrega.Visible := false;
  end;
  if PCPedido.ActivePage <> TSPedido then
    PCPedido.ActivePage := TSPedido;
  with DMPedido do
  begin
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ' then
    begin
      QPedidoItem.SQL[QPedidoItem.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      QPedidoItem.SQL.Add('Order by Cod_Produto');
    end;
    QPedido.Open;
    QPedidoItem.Open;
    QSomaPedido.Open;
    QQuantidadePedido.open;
    QImagemPedido.Open;
    wDtEmissao_Ant := Date;
  end;
  TsAdiantamentos.TabVisible := False;
  TsCustos.TabVisible := False;
  if DMParamSistema.CodEmpresa = 'SIGVANS' then
  begin
    TsMateriais.TabVisible := True;
    LVeiculo.Visible := True;
    DbEVeiculo.Visible := True;
    //LTecido.Visible := True;
    //LFormaPagamento.Visible := True;
    //DbETecido.Visible := True;
    //DbEFormaPagamento.Visible := True;
  end
  else
  begin
    TsMateriais.TabVisible := False;
    LVeiculo.Visible := False;
    LTecido.Visible := False;
    LFormaPagamento.Visible := False;
    DbEVeiculo.Visible := False;
    DbETecido.Visible := False;
    DbEFormaPagamento.Visible := False;
  end;


  if FPedidoCons <> nil then
    FPedidocons.BtConsCadastro.Enabled := True;



  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO' then
  begin
    Label33.Visible := False;
    DBEdit29.Visible := False;
    DBEdit30.Visible := False;
    DBEdit31.Visible := False;
    DBEdit39.Visible := False;
    DBEdit44.Visible := False;
    Label71.Visible := False;
    DBEdit13.Visible := False;
    DBPObra.Visible := False;
    DBEdit52.Visible := False;
    Label44.Visible := False;
    DBEdit16.Visible := False;
    Label46.Visible := False;
    BtConsBanco.Visible := False;
    Label54.Visible := False;
    DBEdit55.Visible := False;
    Label37.left := 340;
    Label37.top := 114;
    DBEPrazo.left := 340;
    DBEPrazo.top := 130;
    BtConsPrazo.Left := 374;
    BtConsPrazo.Top := 130;
    DBDirceu6.Left := 406;
    DBDirceu6.Top := 130;
    LblCarencia.Left := 525;
    LblCarencia.Top := 114;
    DbCarencia.Left := 525;
    DbCarencia.Top := 128;
    Label87.Left := 341;
    Label87.Top := 474;
    DBEdit72.Left := 341;
    DBEdit72.Top := 490;
  end;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ') then
  begin
    DBGrid2.Visible := false;
    label32.Visible := false;
    DBGItemPedido.Height := 230;
    DBELote.TabStop := False;
    DbEdit22.TabStop := False;
    BtConsLote.TabStop := False;
    BtConsTributacao.Top := 106;
    BtConsTributacao.Left := 476;
    DbEdit22.Top := 105;
    DbEdit22.Left := 423;
    Label18.Top := 89;
    Label18.Left := 425;
    DbDirceu3.Top := 105;
    DbDirceu3.Left := 501;
    DBEdit17.Visible := False;
    Label47.Visible := False;
    BtConsCultura.Visible := False;
    Label34.Visible := True;
    DbEdit18.Visible := True;
    DBMInfAdicional.Visible := False;
    Label80.Visible := False;
    DBEdit41.Top := 452;
    DbGridEstoque.Top := 452;
    DbGridEstoque.Height := 80;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ')  Then
   Begin
     LblDtComissao.Visible := True;
     DBDtComissao.Visible := True;
     MMCadSimples.Items[2].Items[2].Enabled := False;
     MMCadSimples.Items[2].Items[3].Enabled := False;
   End;


  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FGLASS') then
  begin
    DBENumFabricante.Left := 9;
    DBENumFabricante.Top := 59;
    DBENumFabricante.Visible := True;
    DBEDescProduto.Left := 136;
    DBEDescProduto.Width := 144;
    BtConsProduto.Left := 106;
    DBEdit17.Visible := False;
    Label47.Visible := False;
    BtConsCultura.Visible := False;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FGLASS') then
    begin
      DBENumFabricante.CharCase := ecUpperCase;
      DBECodProduto.Width := 50;
      DBENumFabricante.Left := DBENumFabricante.Left + 54;
      BtConsProduto.Left := BtConsProduto.Left + 54;
      DBEDescProduto.Left := DBEDescProduto.Left + 54;
      DBELote.Left := DBELote.Left + 54;
      LblLote.Left := LblLote.Left + 54;
      BtConsLote.Left := BtConsLote.Left + 54;
      DBDLote.Left := DBDLote.Left + 54;
      DBDUnid.Left := DBDUnid.Left + 54;
      LblUnid.Left := LblUnid.Left + 54;
      LblEmb.Left := LblEmb.Left + 54;
      DBDEmb.Left := DBDEmb.Left + 54;

      DBECodMarca.Left := DBECodProdutoAux.Left;
      DBECodMarca.Top := DBECodProdutoAux.Top;
      LblMarca.Left := LblCodProdutoAux.Left;
      LblMarca.Top := LblCodProdutoAux.Top;
      BtConsMarca.Left := BtConsProdutoAux.Left;
      BtConsMarca.Top := BtConsProdutoAux.Top;
      DBDMarca.Top := BtConsMarca.Top;
      DBDMarca.Left := BtConsMarca.Left + BtConsMarca.Width + 2;

      DBECodMarca.TabOrder := DBEPercComissao.TabOrder + 1;
      DBECodMarca.Visible := True;
      BtConsMarca.Visible := True;
      DBDMarca.Visible := True;
      LblMarca.Visible := True;
    end;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL') Then
  begin
    DBRGTipoPagamento.Items.Clear;
    DBRGTipoPagamento.Items.Add('A Vista');
    DBRGTipoPagamento.Items.Add('A Prazo');
    DBRGTipoPagamento.Items.Add('Adiantamento');

    DBRGTipoPagamento.Values.Clear;
    DBRGTipoPagamento.Values.Add('A VISTA');
    DBRGTipoPagamento.Values.Add('A PRAZO');
    DBRGTipoPagamento.Values.Add('ADIANTAMENTO');

    TsAdiantamentos.TabVisible := True;
    DBEPercComissao.Visible := False;
    LblComissao.Visible := False;
    DMPedido.QCaixaPedido.Open;
  end;
  //Vendedor Pre-Posto. Neo Ali. Junior - 12/06/2014
  if DMParamSistema.QParamSistemaIND_ROTA.Value = 'S' then
  begin
    LblVendedorPreposto.Visible := True;
    DBEdit28.Visible            := True;
    BtConsVendedorPre.Visible   := True;
    DBDirceu5.Visible           := True;
    LBLComissaoPre.Visible      := True;
    DBEComissaoPre.Visible      := True;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'POLLYANA' then
  begin
    Label77.Left := 155;
    Label77.Top := 89;
    Label77.Visible := True;
    DBEdit57.Left := 155;
    DBEdit57.Top := 105;
    DBEdit57.Visible := True;
    DBEdit57.TabOrder := 9;
    Label23.Visible := False;
    DBEdit27.Visible := False;
    //DBEPercComissao.Visible := False; Comentei para eles conferirem as comissões. Vanessa 23/05/16
    DBEPercComissao.ReadOnly := true;
    DBEComissaoPre.Visible := False;
    DBEdit17.Visible := False;
    Label47.Visible := False;
    BtConsCultura.Visible := False;
    LBLComissaoPre.Visible := False;
    //LblComissao.Visible := False; Comentei para eles conferirem as comissões. Vanessa 23/05/16
    DBEdit23.TabOrder := 6;
    DBEdit24.TabOrder := 7;
    DBEdit57.TabOrder := 8;
    DBELote.TabStop := False;

    DBEdit22.TabStop := False;
    DbGridEstoque.Visible := False;
    label75.Visible := False;
    DBEdit41.Visible := False;

    Label71.Visible := False;
    DBEdit13.Visible := False;
    Label54.Visible := False;
    DBEdit55.Visible := False;
    Label34.Visible := False;
    DBEdit18.Visible := False;
    Label42.Visible := False;
    DBEdit50.Visible := False;
    BtConsMensagem.Visible := False;
    DBDirceu4.Visible := False;
    Label43.Visible := False;
    DBEdit51.Visible := False;
    BtConsDepartamento.Visible := False;
    DBDirceu7.Visible := False;
    Label33.Visible := False;
    DBEdit29.Visible := False;
    DBEdit30.Visible := False;
    DBEdit31.Visible := False;
    DBEdit39.Visible := False;
    DBEdit44.Visible := False;
    Label44.Visible := False;
    DBEdit52.Visible := False;
    Label46.Visible := False;
    DBEdit16.Visible := False;
    BtConsBanco.Visible := False;
    Label31.Visible := False;
    DBEdit38.Visible := False;
    DBRadioGroup2.Left := 9;
    Label24.Top := 435;
    DBEdit1.Top := 451;
    BtTransportador.Top := 451;
    DBDirceu2.Top := 451;
//    Label37.Top := 357; //Campo sobreposto. Junior 16/09/2020
//    Label37.Left := 205;
//    DBEPrazo.Top := 373;
//    DBEPrazo.Left := 205;
//    BtConsPrazo.Top := //372;
//    BtConsPrazo.Left := //245;
//    DBDirceu6.Left := BtConsPrazo.Left + BtConsPrazo.Width + 2;
//    DBDirceu6.Top := BtConsPrazo.Top;
    Label26.Top := 473;
    Label26.Left := 448;
    DBEdit33.Top := 490;//458;
    DBEdit33.Left := 448;
    DbGridEstoque.Visible := False;
    DbgItemPedido.Columns[4].Visible := False;
    DbgItemPedido.Columns[5].Visible := False;
    DbgItemPedido.Columns[6].Visible := False;
    DbgItemPedido.Columns[7].Visible := False;
    DbgItemPedido.Columns[3].Width := 180;
    DBGItemPedido.Width := 489;
    DBPObra.Visible := False;

  end;

  if (DMParamSistema.CodEmpresa =  'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') or
      (DMParamSistema.CodEmpresa = 'DATEL') or (DMParamSistema.CodEmpresa = 'SIGVANS') then
  begin
    LbVeiculo.Visible := True;
    MEPlaca.Visible   := True;
    SBVeiculo.Visible := True;
    EdModelo.Visible  := True;
  end;
  wDescTipoFuncionario := DMOracle.BuscaNome('SELECT DESC_TIPO_FUNCIONARIO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
  begin
    if wDescTipoFuncionario = 'VENDEDOR' then
      DBEdit4.Enabled := false;
  end;

  //BIG METAL SOLICITOU UM CAMPO PARA DESCONTO MAS SÓ PARA APARECER NA TELA. POIS VARIA O PREÇO DE CLIENTE A CLIENTE
  //AUTORIZADO POR MARCOS. JUNIOR 11/09/2017.
  if DMParamSistema.CodEmpresa = 'BIGMETAL' then
  begin
    LDescontoVisual.Visible := True;
    DBEValDescontoVisual.Visible := True;
    LDescontoVisual.Left := 288;
    DBEValDescontoVisual.Left := 288;
    DBEValDescontoVisual.TabOrder := DBEPercComissao.TabOrder + 1
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'WERNER' then
  begin
    DBRGTipoPagamento.Enabled := False;
{    DBRGTipoPagamento.Items.Add('A Vista');
    DBRGTipoPagamento.Items.Add('A Prazo');
    DBRGTipoPagamento.Items.Add('Adiantamento');}

    DBPanel2.Visible := False;
    DBPanel2.Enabled := False;
    Label78.Visible := False;
    EdNumFabricante.Visible := False;
    LblLote.Visible := False;
    DBELote.Visible := False;
    BtConsLote.Visible := False;
    DBDLote.Visible := False;
    LblComissao.Visible := False;
    LBLComissaoPre.Visible := False;
    DBEPercComissao.Visible := False;
    DBEComissaoPre.Visible := False;
    Label47.Visible := False;
    DBEdit17.Visible := False;
    Label18.Visible := False;
    DBEdit22.Visible := False;
    BtConsTributacao.Visible := False;
    DBDirceu3.Visible := False;
    BtConsCultura.Visible := False;
    DBECodProduto.Width := 100;
    Label19.Top := 132;
    Label20.Top := 132;
    Label23.Top := 132;
    DBEdit23.Top := 148;
    DBEdit24.Top := 148;
    DBEdit27.Top := 148;
    Label83.Visible := True;
    Label83.Top := 89;
    Label83.Left := 8;
    Label84.Visible := True;
    Label84.Top := 89;
    Label84.Left := 78;
    DBEdit67.Top := 105;
    DBEdit67.Left := 8;
    DBEdit67.Visible := true;
    DBEdit68.Visible := true;
    DBEdit68.Top := 105;
    DBEdit68.Left := 78;
    DBEdit67.TabStop := True;
    DBEdit67.TabOrder := 12;
    DBEdit68.TabStop := True;
    DBEdit68.TabOrder := 13;
    DBEdit65.TabStop := False;
    DBEdit21.TabStop := False;
    DBEdit40.TabStop := False;
    DBEdit41.TabStop := False;
    DBMInfAdicional.TabStop := False;
    BtImpItemPed.TabStop := False;
  end;
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    TSMedidasInjepar.TabVisible := True;
    Label4.Caption := 'Mecânica';
  end
  else
     TSMedidasInjepar.TabVisible := False;
end;

procedure TFPedidoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFPedidoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FCadastroCons.METipoCadastro.Text := '';
  if FCadastroCons.ShowModal = mrOk then
  begin
    DMPedido.QPedidoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
    DBEdit5Exit(Self);
  end;
end;

procedure TFPedidoCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMPedido.QpedidoCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
  DBEdit3Exit(Self);
end;

procedure TFPedidoCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    DMPedido.QPedidoCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  end;
end;

procedure TFPedidoCad.SBConfirmarClick(Sender: TObject);
var
  wOperacao, wOperacao1, wOperacao2, msg {,wNota_Fiscal,wNada}: string;
  wValor_CC,  wValDesconto {wPercDesconto {,wValor_Outros}: Real;
  //    wDia,wMes,wAno : Word;
begin
  MESeqEmbarque.SetFocus; // para perder o foco - caso tenha alguma consistencia para ser feita (César 29/12/2021)
  DMPedido.Acessa_Operacao;  // PARA ACESSAR OPERACAO SE DATASET ESTIVER FECHADO
  DmUsuario.Checar_Filial_Usuario(DMPedido.QPedidoCOD_FILIAL.Text, 'VENDA');
  if DMPedido.DSPedidoItem.State in [DsInsert, DsEdit] then
     DMPedido.DSPedidoItem.Dataset.Post;

  if DMPedido.QPedidoCod_Vendedor.Text <> '' then
     if (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DMpedido.QPedidoCod_Vendedor.Text)) <> 'ATIVO' then
        raise Exception.Create('Vendedor Inativo');
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk', DMpedido.QPedidoCod_Cadastro.Value);
  DMCadastro.QCadastro.Open;
{  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
  begin
    with DMCadastro do
    begin
      msg := '';
      if not Bib.ValidaCEP(QCadastroDESC_CEP.Value, QCadastroCOD_CIDADE.Value, msg) then
         raise Exception.Create(Bib.ift(msg = '', 'CEP em branco ou inválido.', msg) + ' Informe corretamente o CEP no cadastro do cliente.');
      if QCadastroCOD_CIDADE.IsNull then
         raise Exception.Create('Informe o código da cidade no cadastro do cliente.');
      if QCadastroDESC_ENDERECO.Value = '' then
         raise Exception.Create('Informe o Endereço no cadastro do cliente.');
      if Bib.LimpaNumero(QCadastroDESC_CEP.Value) = '' then
         raise Exception.Create('Informe o Bairro no cadastro do cliente.');
    end;
  end;   }

  wValor_cc := 0;
{Para calcular o valor do desconto quando é informado o percentual no cabeçalho do pedido. Alex 18/03/2024}
  if (MEPercDesconto.Text > '0' ) then
  begin
    DBEdit48.Text := Bib.LimpaString(DBEdit48.Text,'.');
    wValDesconto :=  StrToFloat(DBEdit48.Text) * strtofloat(MEPercDesconto.Text) / 100;
    DBValDesconto.Text := FloatToStr (wValDesconto);
  end;
  if DBRGTipoPagamento.ItemIndex <> 0 then // forma e pagamento <> de a vista
     DMCadastro.ValidaCredito(DMpedido.QPedidoCod_Cadastro.Value, DMpedido.QSomaPedidoSTOTAL_PEDIDO.Value + wValor_cc);
  if DMPedido.QPedidoNum_Pedido.Value = 0 then
     DMPedido.QPedidoNum_Pedido.Value := DMSequencia.Sequencia(DMPedido.QPedidoCod_Filial.Value, 'PEDIDO');
  inherited;

  if (DMParamSistema.CodEmpresa = 'DINIZ') Then
   Begin
//      BaixaEstoque1Click(Self);  // solicitado pelo Edson 06/12/2021 - feito pelo Cesar - 25/03/2025 - substituido por uma trigger
      If (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value <> 'A PRAZO' ) Then  //solicitado pelo Diniz 30/08/2023 - Cesar
         DMPedido.Proc_GeraCaixa(DMOperacao.QOperacaoCod_historico_Caixa.Value, DMPedido.QSomaPedidosval_total_pedido.Value,
                               'Pedido '+ DBRGTipoPagamento.Value);
   End;

   DMOracle.DBCemapa.Commit;
end;

procedure TFPedidoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value
    else
    begin
      if (DMParamSistema.CodEmpresa = 'MARTICAR') then
        MessageDlg('Por acaso você esta tentando incluir um item sem clicar no + ? Isso não pode ser feito.', mtError, [mbOK], 0)
      else
      begin
        DMPedido.QPedidoItem.Edit;
        DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
      end;
    end;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NEOALI') Then
    begin
      DMPedido.QPedidoItemNUM_FABRICANTE.Value := DMProduto.QProdutoConsNum_Fabricante.Value;
      DMPedido.QPedidoItemCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    end;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') Then
        DMPedido.QPedidoItemCOD_LOTE_TIPO.Value := DMEstoque.QEstoqueConsCod_Lote_Tipo.Value;
    //Solicitação Marcos. Junior 01/07/2015
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' then
      DMPedido.QPedidoItemQT_EMBALAGEM.Value := DMProduto.QProdutoConsNUM_EMBALAGEM.Value;
    DBECodProdutoExit(self);
  end;
end;

procedure TFPedidoCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DMPedido.QPedidoItemCod_Produto.Value);
  if FTipoLoteCons.ShowModal = mrOk then
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value
    else
    begin
      if (DMParamSistema.CodEmpresa = 'MARTICAR') then
        MessageDlg('Registro não está em edição ou inserção. Não é possível alterar.', mtError, [mbOK], 0)
      else
      begin
        DMPedido.QPedidoItem.Edit;
        DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
      end;
    end;
end;

procedure TFPedidoCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = MrOk then
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value
    else
    begin
      DMPedido.QPedidoItem.Edit;
      DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
    end
end;

procedure TFPedidoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.pTela_Chamou := 'PEDIDO'; // Para colocar funcionar a seguranca por Filial
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin

      QPedido.Close;
      QPedido.SetVariable('PK', QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      QCustoFuncionario.Close;
      QCustoFuncionario.SetVariable('COD_PEDIDO_CAB', QPedidoConsCod_Pedido_Cab.Value);
      QCustoFuncionario.open;
    end;

  if Trim(MePlaca.Text) <> '' then
  begin
    with DMPedido do
    begin
      if (QPedidoCOD_VEICULO.Value > 0) then
      begin
        MEPlaca.Text := DMOracle.FastSelect('NUM_PLACA','TB_VEICULO','COD_VEICULO = ' + QPedidoCOD_VEICULO.Text);
        MEPlacaExit(Sender);
      end
      else
      begin
        MEPlaca.Clear;
        EdModelo.Clear;
      end;
    end;

    end;

end;

procedure TFPedidoCad.PedidosAbertos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[0].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.ME0Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.ME0Vendedor.Enabled := False;
    FPedidoParam.Bt0Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME0Filial.Text), 'VENDA');
      QRPedAberto.Close;
      QRPedAberto.SetVariable('DATA_I', FPedidoParam.ME0DataI.Text);
      QRPedAberto.SetVariable('DATA_F', FormatDateTime('dd/mm/yyyy hh:nn:ss', (StrToDateTime(FPedidoParam.ME0DataF.Text) + EncodeTime(23, 59, 59, 0))));
      if Trim(FPedidoParam.ME0Filial.Text) = '' then
        QRPedAberto.SetVariable('FILIAL', Null)
      else
        QRPedAberto.SetVariable('FILIAL', FPedidoParam.ME0Filial.Text);
      if Trim(FPedidoParam.ME0Cadastro.Text) = '' then
        QRPedAberto.SetVariable('CADASTRO', Null)
      else
        QRPedAberto.SetVariable('CADASTRO', FPedidoParam.ME0Cadastro.Text);
      if Trim(FPedidoParam.Me0Fornecedor.Text) = '' then
        QRPedAberto.SetVariable('FORNECEDOR', Null)
      else
        QRPedAberto.SetVariable('FORNECEDOR', FPedidoParam.Me0Fornecedor.Text);
      if Trim(FPedidoParam.ME0Produto.Text) = '' then
        QRPedAberto.SetVariable('PRODUTO', Null)
      else
        QRPedAberto.SetVariable('PRODUTO', FPedidoParam.ME0Produto.Text);
      if Trim(FPedidoParam.ME0Vendedor.Text) = '' then
        QRPedAberto.SetVariable('VENDEDOR', Null)
      else
        QRPedAberto.SetVariable('VENDEDOR', FPedidoParam.ME0Vendedor.Text);
      if Trim(FPedidoParam.ME0LoteTipo.Text) = '' then
        QRPedAberto.SetVariable('COD_LOTE', Null)
      else
        QRPedAberto.SetVariable('COD_LOTE', FPedidoParam.ME0LoteTipo.Text);
      if Trim(FPedidoParam.Me0NrInicial.Text) = '' then
        QRPedAberto.SetVariable('NUM_INICIAL', Null)
      else
        QRPedAberto.SetVariable('NUM_INICIAL', FPedidoParam.Me0NrInicial.Text);
      if Trim(FPedidoParam.Me0NrFinal.Text) = '' then
        QRPedAberto.SetVariable('NUM_FINAL', Null)
      else
        QRPedAberto.SetVariable('NUM_FINAL', FPedidoParam.Me0NrFinal.Text);
      if Trim(FPedidoParam.Me0Cultura.Text) = '' then
        QRPedAberto.SetVariable('COD_CULTURA', Null)
      else
        QRPedAberto.SetVariable('COD_CULTURA', FPedidoParam.Me0Cultura.Text);
      if Trim(FPedidoParam.ME0Estado.Text) = '' then
        QRPedAberto.SetVariable('COD_ESTADO', Null)
      else
        QRPedAberto.SetVariable('COD_ESTADO', Trim(FPedidoParam.ME0Estado.Text));
      if Trim(FPedidoParam.ME0Departamento.Text) = '' then
        QRPedAberto.SetVariable('DEPARTAMENTO', Null)
      else
        QRPedAberto.SetVariable('DEPARTAMENTO', Trim(FPedidoParam.ME0Departamento.Text));
      if Trim(FPedidoParam.Me0Safra.Text) = '' then
        QRPedAberto.SetVariable('DESC_SAFRA', Null)
      else
        QRPedAberto.SetVariable('DESC_SAFRA', TRIM(FPedidoParam.Me0Safra.Text));

      QRPedAberto.SQL[QRPedAberto.SQL.count - 1] := '';
      case FPedidoParam.CB0Ordem.ItemIndex of
        0: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        1: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_ENTREGA, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        2: QRPedAberto.SQL.Add('ORDER BY TB_CADASTRO.NOME, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
        3: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_ITEM.COD_PRODUTO, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
        4: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.NUM_PEDIDO');
      else
        raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case
      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: QRPedAberto.SetVariable('TIPO_PAGTO', Null);
        1: QRPedAberto.SetVariable('TIPO_PAGTO', 'A VISTA');
        2: QRPedAberto.SetVariable('TIPO_PAGTO', 'A PRAZO');
        3: QRPedAberto.SetVariable('TIPO_PAGTO', 'OUTROS');
      end; // Case
      if Trim(FPedidoParam.ME0Classe.Text) = '' then
        QRPedAberto.SetVariable('CLASSE', Null)
      else
        QRPedAberto.SetVariable('CLASSE', FPedidoParam.ME0Classe.Text);
      if (Trim(FPedidoParam.ME0SubClasse.Text) = '') or (Trim(FPedidoParam.ME0SubClasse.Text) = '0') then
        QRPedAberto.SetVariable('SUB_CLASSE', Null)
      else
        QRPedAberto.SetVariable('SUB_CLASSE', FPedidoParam.ME0SubClasse.Text);

      if Trim(FPedidoParam.ME0Origem.Text) = '' then
        QRPedAberto.SetVariable('ORIGEM', Null)
      else
        QRPedAberto.SetVariable('ORIGEM', Trim(FPedidoParam.ME0Origem.Text));

      if Trim(FPedidoParam.ME0Motivo.Text) = '' then
        QRPedAberto.SetVariable('MOTIVO', Null)
      else
        QRPedAberto.SetVariable('MOTIVO', Trim(FPedidoParam.ME0Motivo.Text));

      if Trim(FPedidoParam.ME0Operacao1.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO1', Trim(FPedidoParam.ME0Operacao1.Text));
      if Trim(FPedidoParam.ME0Operacao2.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO2', Trim(FPedidoParam.ME0Operacao2.Text));
      if Trim(FPedidoParam.ME0Operacao3.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO3', Trim(FPedidoParam.ME0Operacao3.Text));
      if Trim(FPedidoParam.ME0Operacao4.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO4', Trim(FPedidoParam.ME0Operacao4.Text));

      QRPedAberto.Open;
      if FRPedido_Aberto = nil then
        FRPedido_Aberto := TFRPedido_Aberto.Create(Application);
      FRpedido_Aberto.QRLTitulo.Caption := 'Pedido em Aberto (' + FPedidoParam.ME0DataI.text + ' - ' + FPedidoParam.ME0DataF.Text + ')';
      FRpedido_Aberto.QRLEstado.Caption := 'Departamento:' + Trim(FPedidoParam.ME0Departamento.Text) + ' ' + (FPedidoParam.Ed0Departamento.Text) +
        ' ' + 'Estado: ' + Trim(FPedidoParam.ED0Estado.Text);
      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Todos';
        1: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Vista';
        2: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Prazo';
        3: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Outros';
      end; // Case
      if Trim(FPedidoParam.Me0Cultura.Text) <> '' then
        FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Cultura ' + FPedidoParam.Ed0Cultura.Text;
      if Trim(FPedidoParam.Me0Origem.Text) <> '' then
        FRpedido_Aberto.QRLOrigem.Caption := 'Origem do Produto :' + FpedidoParam.Me0Origem.Text
      else
        FRpedido_Aberto.QRLOrigem.Caption := 'Origem do Produto : Todas';
      FRpedido_Aberto.QRLMotivo.Caption := 'Motivo: ' + FpedidoParam.ME0Motivo.Text + ' ' + FpedidoParam.Ed0Motivo.Text +
        '  Operações: ' + FpedidoParam.ME0Operacao1.Text + ', ' + FpedidoParam.ME0Operacao2.Text
        + ', ' + FpedidoParam.ME0Operacao3.Text + ', ' + FpedidoParam.ME0Operacao4.Text;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Aberto.QRPrimario.Preview
      else
        FRPedido_Aberto.QRPrimario.Print;
      QRPedAberto.Close;
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
      begin
        QRPedido_BaseTroca.Close;
        QRPedido_BaseTroca.SetVariable('DATA_I', FPedidoParam.ME0DataI.Text);
        QRPedido_BaseTroca.SetVariable('DATA_F', FPedidoParam.ME0DataF.Text);
        if Trim(FPedidoParam.ME0Filial.Text) = '' then
          QRPedido_BaseTroca.SetVariable('FILIAL', Null)
        else
          QRPedido_BaseTroca.SetVariable('FILIAL', FPedidoParam.ME0Filial.Text);
        if Trim(FPedidoParam.ME0Cadastro.Text) = '' then
          QRPedido_BaseTroca.SetVariable('CADASTRO', Null)
        else
          QRPedido_BaseTroca.SetVariable('CADASTRO', FPedidoParam.ME0Cadastro.Text);
        if Trim(FPedidoParam.ME0Produto.Text) = '' then
          QRPedido_BaseTroca.SetVariable('PRODUTO', Null)
        else
          QRPedido_BaseTroca.SetVariable('PRODUTO', FPedidoParam.ME0Produto.Text);
        if Trim(FPedidoParam.ME0Vendedor.Text) = '' then
          QRPedido_BaseTroca.SetVariable('VENDEDOR', Null)
        else
          QRPedido_BaseTroca.SetVariable('VENDEDOR', FPedidoParam.ME0Vendedor.Text);

        if Trim(FPedidoParam.ME0Origem.Text) = '' then
          QRPedido_BaseTroca.SetVariable('ORIGEM', Null)
        else
          QRPedido_BaseTroca.SetVariable('ORIGEM', Trim(FPedidoParam.ME0Origem.Text));
        case FPedidoParam.Rg0TipoPagto.ItemIndex of
          0: QRPedido_BaseTroca.SetVariable('TIPO_PAGTO', Null);
          1: QRPedido_BaseTroca.SetVariable('TIPO_PAGTO', 'A VISTA');
          2: QRPedido_BaseTroca.SetVariable('TIPO_PAGTO', 'A PRAZO');
          3: QRPedido_BaseTroca.SetVariable('TIPO_PAGTO', 'OUTROS');
        else
          raise Exception.Create('Nenhuma ordem selecionada!');
        end; // Case
        QRPedido_BaseTroca.Open;
        if FRPedido_BaseTroca = nil then
          Application.CreateForm(TFRPedido_BaseTroca, FRPedido_BaseTroca);
        FRPedido_BaseTroca.QRLTitulo.Caption := 'Pedido em Aberto Base Troca (' + FPedidoParam.ME0DataI.text + ' - ' + FPedidoParam.ME0DataF.Text + ')';
        if FPedidoParam.RGPreview.ItemIndex = 0 then
          FRPedido_BaseTroca.QRPrimario.Preview
        else
          FRPedido_BaseTroca.QRPrimario.Print;
        QRPedido_BaseTroca.Close;
      end;
    end;
end;

procedure TFPedidoCad.CancelaQtdePedido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoCancela = nil then
    FPedidoCancela := TFPedidoCancela.Create(Application);
  FPedidoCancela.ShowModal;

end;

procedure TFPedidoCad.DBEQtdCanceladoExit(Sender: TObject);
begin
  inherited;
  DBEQtdCancelado.ReadOnly := True;
  DBEQtdCancelado.ParentColor := True;
end;

procedure TFPedidoCad.Produto1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[1].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.Me1Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.Me1Vendedor.Enabled := False;
    FPedidoParam.Bt1Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME1Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME1DataI.Text) = '') or (Trim(FPedidoParam.ME1DataF.Text) = '') then
        raise Exception.Create('É necessário informar um período');

      QRPedProduto.Close;
      QRPedProduto.SetVariable('DATA_I', FPedidoParam.ME1DataI.Text);
      QRPedProduto.SetVariable('DATA_F', FPedidoParam.ME1DataF.Text);

      if Trim(FPedidoParam.ME1Filial.Text) = '' then
        QRPedProduto.SetVariable('FILIAL', Null)
      else
        QRPedProduto.SetVariable('FILIAL', FPedidoParam.ME1Filial.Text);
      if Trim(FPedidoParam.ME1Cadastro.Text) = '' then
        QRPedProduto.SetVariable('CADASTRO', Null)
      else
        QRPedProduto.SetVariable('CADASTRO', FPedidoParam.ME1Cadastro.Text);
      if Trim(FPedidoParam.ME1Produto.Text) = '' then
        QRPedProduto.SetVariable('PRODUTO', Null)
      else
        QRPedProduto.SetVariable('PRODUTO', FPedidoParam.ME1Produto.Text);
      if Trim(FPedidoParam.ME1Vendedor.Text) = '' then
        QRPedProduto.SetVariable('VENDEDOR', Null)
      else
        QRPedProduto.SetVariable('VENDEDOR', FPedidoParam.ME1Vendedor.Text);
      if Trim(FPedidoParam.Me1Cultura.Text) = '' then
        QRPedProduto.SetVariable('COD_CULTURA', Null)
      else
        QRPedProduto.SetVariable('COD_CULTURA', FPedidoParam.Me1Cultura.Text);
      if Trim(FPedidoParam.ME1Classe.Text) = '' then
        QRPedProduto.SetVariable('CLASSE', Null)
      else
        QRPedProduto.SetVariable('CLASSE', FPedidoParam.ME1Classe.Text);
      if (Trim(FPedidoParam.ME1SubClasse.Text) = '') or (Trim(FPedidoParam.ME1SubClasse.Text) = '0') then
        QRPedProduto.SetVariable('SUB_CLASSE', Null)
      else
        QRPedProduto.SetVariable('SUB_CLASSE', FPedidoParam.ME1SubClasse.Text);
      if Trim(FPedidoParam.ME1Lote.Text) = '' then
        QRPedProduto.SetVariable('LOTE', Null)
      else
        QRPedProduto.SetVariable('LOTE', FPedidoParam.ME1Lote.Text);
      if FPedidoParam.RGSituacao.ItemIndex = 1 then
        QRPedProduto.SetVariable('SITUACAO', '1')
      else
        QRPedProduto.SetVariable('SITUACAO', null);

      if Trim(FPedidoParam.FMMarca1.MeMarca.Text) = '' then
        QRPedProduto.SetVariable('MARCA', Null)
      else
        QRPedProduto.SetVariable('MARCA', FPedidoParam.FmMarca1.MeMarca.Text);

      case FPedidoParam.Rg1TipoPagto.ItemIndex of
        0: QRPedProduto.SetVariable('TIPO_PAGTO', Null);
        1: QRPedProduto.SetVariable('TIPO_PAGTO', 'A VISTA');
        2: QRPedProduto.SetVariable('TIPO_PAGTO', 'A PRAZO');
        3: QRPedProduto.SetVariable('TIPO_PAGTO', 'OUTROS');
      end; // Case
      QRPedProduto.SQL[QRPedProduto.SQL.count - 1] := '';
      if FPedidoParam.RGOrdem.ItemIndex = 0 then
        QRPedProduto.SQL.add('cod_produto')
      else
        QRPedProduto.SQL.add('Desc_Produto');

      QRPedProduto.Open;
      if FRPedido_Produto = nil then
        FRPedido_Produto := TFRPedido_Produto.Create(Application);
      FRPedido_Produto.QRLTitulo.Caption := 'Pedidos por Produto (' + FPedidoParam.ME1DataI.text + ' - ' + FPedidoParam.ME1DataF.Text + ')';
      FRPedido_Produto.QRLFilial.Caption := 'Filial: ' + FPedidoParam.ED1Filial.Text + ' Classe:' +
        FPedidoParam.ME1Classe.Text + ' ' + FPedidoParam.Ed1Classe.Text +
        ' Lote:' + FPedidoParam.ME1Lote.Text + ' ' + FPedidoParam.Ed1Lote.Text;
      FRPedido_Produto.QRLMarca.Caption := FPedidoParam.FmMarca1.EdMarca.Text;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Produto.QRPrimario.Preview
      else
        FRPedido_Produto.QRPrimario.Print;
      QRPedProduto.Close;
    end;
end;

procedure TFPedidoCad.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCad = nil then
    FEmbarqueCad := TFEmbarqueCad.Create(Application);
  FEmbarqueCad.ShowModal;
end;

procedure TFPedidoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBEmbarque.Enabled := DMPedido.QPedido.State = dsBrowse;
  BtConsCadastro.Enabled := DSPrimario.State <> dsBrowse;
  BtConsCultura.Enabled := DSPrimario.State <> dsBrowse;
  BtConsFilial.Enabled := DSPrimario.State <> dsBrowse;
  BtConsOperacao.Enabled := DSPrimario.State <> dsBrowse;
  BtConsVendedor.Enabled := DSPrimario.State <> dsBrowse;
  BtConsPrazo.Enabled := DSPrimario.State <> dsBrowse;
  Bitbtn1.Enabled := DSPrimario.State <> dsBrowse;
  BtConsMensagem.Enabled := DSPrimario.State <> dsBrowse;
  BtConsDepartamento.Enabled := DSPrimario.State <> dsBrowse;
  BtConsBanco.Enabled := DSPrimario.State <> dsBrowse;
  BtConsOrigem.Enabled := DSPrimario.State <> dsBrowse;
  BtConsMarca.Enabled := DSPrimario.State <> dsBrowse;
  BtTransportador.Enabled := DSPrimario.State <> dsBrowse;
  BtConsProduto.Enabled := DSPrimario.State <> dsBrowse;
  BtConsLote.Enabled := DSPrimario.State <> dsBrowse;
  BtConsProdutoAux.Enabled := DSPrimario.State <> dsBrowse;
  BtConsMotivo.Enabled := DSPrimario.State <> dsBrowse;
  BtConsTributacao.Enabled := DSPrimario.State <> dsBrowse;
  BtConsVendedorPre.Enabled := DSPrimario.State <> dsBrowse;
  DBPanel2.BuscaEnabled := not (DSPrimario.DataSet.State = DSBrowse);
  SBVeiculo.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
end;

procedure TFPedidoCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  if (DMParamSistema.CodEmpresa = 'DINIZ') Then
   Begin
   //   VoltaBaixaEstoque1Click(Self);  // solicitado pelo Edson Diniz 06/12/2021 - feito pelo Cesar
                                        // 25/03/2025 substituido por uma trigger - Cesar 
      try
        DMOracle.DBCemapa.StartTransaction;
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('DELETE TB_CAIXA_MOV WHERE COD_PEDIDO_CAB = ' + chr(39) + DMPedido.QPedidoCOD_PEDIDO_CAB.Text + chr(39));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Não foi possível voltar o lançamento do cartão!');
      end;
   End;
  DMPedido.ExcluiPedido;
end;

procedure TFPedidoCad.Espelho1Click(Sender: TObject);
var
  wLinhas: Integer;
begin
  inherited;
  inherited;
  {--------------------------------------------------------------------------------------------------
   Gian 14/09/2018 à pedido do Junior
   A empresa diniz precisa desse mesmo relatório, mas com algumas alterações, como esse relátório tem
   muitos cod_empresa, será feito um separado só pra eles
   USIMED PEDIU PARA FICAR IGUAL AO DINIZ. Junior-17/05/2019
  --------------------------------------------------------------------------------------------------}
  if (DMParamSistema.CodEmpresa <> 'DINIZ') and (DMParamSistema.CodEmpresa <> 'USIMED') and
     (DMParamSistema.CodEmpresa <> 'INJEPAR')and(DMParamSistema.CodEmpresa <> 'RETIFOZ') and
     (DMParamSistema.CodEmpresa <> 'ALVARES') and (DMParamSistema.CodEmpresa <> 'NEOALI') and
     (DMParamSistema.CodEmpresa <> 'SIGVANS') and (DMParamSistema.CodEmpresa <> 'SCALA') then  //SOLICITADO POR ODIRLEI. - JUNIOR 04/03/2021
  begin
    DMPedido.QRPedido.Open;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') Then
     Begin
        if FRPedidoEspelho1 = nil then
          FRPedidoEspelho1 := TFRPedidoEspelho1.Create(Application);
          FRPedidoEspelho1.QrlMensagem.Caption := 'INSIDE SEMPRE UM BOM NEGOCIO';
          FRPedidoEspelho1.QRLAssinatura.Caption := 'ASSINAR PARA CONFIRMAR ESSE PEDIDO ....................................';
          FRPedidoEspelho1.QRLSite.Caption := 'www.insideautopecas.com.br          atendimento@insideautopecas.com.br';
          FRPedidoEspelho1.QRPrimario.Preview;
     End
    Else
      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then   // Cesar incluiu 15/02/2021 para radiolandia
       Begin
         if FRPedido_Espelho2 = nil then
            FRPedido_Espelho2 := TFRPedido_Espelho2.Create(Application);
         FRPedido_Espelho2.QRLEmpresa.Caption := DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL',
               'COD_FILIAL = '+DMPedido.QPedidoCOD_FILIAL.Text);
         if DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.isNull then
            FRPedido_Espelho2.QRLPrazo.Caption := ''
         else
            FRPedido_Espelho2.QRLPrazo.Caption := DMOracle.FastSelect('DESC_PRAZO_VENCIMENTO', 'TB_PRAZO_VENCIMENTO',
               'COD_PRAZO_VENCIMENTO = '+DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text);
         FRPedido_Espelho2.QRPrimario.Preview;
       End
      Else
       Begin
        if FRPedido_Espelho = nil then
          FRPedido_Espelho := TFRPedido_Espelho.Create(Application);
       wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCod_Pedido_Cab.Text));
       If wLinhas >= 6 then //tava 7
        begin
          If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL') then
             FRPedido_Espelho.QRPrimario.Height := 378+18*wLinhas
          else
             FRPedido_Espelho.QRPrimario.Height := 1056;
        end
       else
         FRPedido_Espelho.QRPrimario.Height := 522;
       if (DMParamSistema.CodEmpresa = 'REDIESEL')  or (DMParamSistema.CodEmpresa = 'BIGMETAL')   or
          (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'FERRAGMED')  or
          (DMParamSistema.CodEmpresa = 'GRASEL')    or (DMParamSistema.CodEmpresa = 'CASATINTAS') or
          (DMParamSistema.CodEmpresa = 'ENERMED')   or (DMParamSistema.CodEmpresa = 'GRAZAPEL')   or
          (DMParamSistema.CodEmpresa = 'ALVARES')   or (DMParamSistema.CodEmpresa = 'SERVITEC')   or
          (DMParamSistema.CodEmpresa = 'CKTINTAS')  or (DMParamSistema.CodEmpresa = 'RODOS') then
       begin  //Pedido imprimindo cortado na HPM128, dai viramos o relatório na folha para imprimir corretamente. Vanessa 06/09/2018
         FRPedido_Espelho.QRPrimario.Height := 1056;
       end;
       if DMParamSistema.CodEmpresa = 'WERNER' then
       begin
         //FRPedido_Espelho.QRDBText30.Enabled := False;
         FRPedido_Espelho.QRLabel3.Enabled := False;
         FRPedido_Espelho.QRLabel28.Enabled := False;
         FRPedido_Espelho.QRLabel10.Enabled := False;
         FRPedido_Espelho.QRDBText32.Enabled := False;
         FRPedido_Espelho.QRDBText33.Enabled := False;
         FRPedido_Espelho.QRDBTNcm.DataField := 'VAL_DIAMETRO';
         FRPedido_Espelho.QRDBTDescProduto.Width := 300;
         FRPedido_Espelho.QRDBTNcm.Enabled := True;
         FRPedido_Espelho.QRDBText30.DataField := 'VAL_COMPRIMENTO';
         FRPedido_Espelho.QRDBTNcm.Left := 320;
         FRPedido_Espelho.QRDBText30.Left := 420;
         FRPedido_Espelho.QRDBText30.Width := 68;
         FRPedido_Espelho.QRLNcm.Enabled := True;
         FRPedido_Espelho.QRLNcm.Left := 340;
         FRPedido_Espelho.QRLNcm.Caption := 'Diametro X Comprimento';
         FRPedido_Espelho.QRLNcm.Font.Size := 9;
         FRPedido_Espelho.QRLabel11.Left := 520;
         FRPedido_Espelho.QRLabel13.Left := 582;
         FRPedido_Espelho.QRDBText11.Left := 495;
         FRPedido_Espelho.QRDBText31.Left := 582;
         FRPedido_Espelho.QRDBText11.Mask := '#,###0.000';
         FRPedido_Espelho.QRDBTNcm.Mask := '#,##0.00';
         FRPedido_Espelho.QRDBText30.Mask := '#,##0.00';
         FRPedido_Espelho.QRLTotalQtde.Left := 450;
       end;
       //desabilita campo email e habilita transportadora
       FRPedido_Espelho.QRDBText4.DataField := 'DESC_E_MAIL';
       FRPedido_Espelho.QRLabel38.Caption := 'E Mail:';
       if (DMParamSistema.CodEmpresa = 'POLLYANA') then
       Begin
         FRPedido_Espelho.QRLabel11.Left := 391;
         FRPedido_Espelho.QRLabel11.Caption := '  Qtde   Un  Emb';
         FRPedido_Espelho.QRDBText11.Left := 385;
         FRPedido_Espelho.QRDBText11.Width := 70;
         FRPedido_Espelho.QRDBTDescProduto.Width := 310;
         //FRPedido_Espelho.QRDBText27.Top :=0;
         FRPedido_Espelho.QRDBText38.Top := 0;
         FRPedido_Espelho.QRLTotalQtde.Left := 391;
         FRPedido_Espelho.QRDBTDescProduto.Width := 300;
         FRPedido_Espelho.QRDBTDescProduto.DataField := 'DESC_PRODUTO2';
       end;
       if (DMParamSistema.CodEmpresa = 'BIGMETAL') then
       begin
         FRPedido_Espelho.QRDBTCodProduto.Font.Size := 7;
         FRPedido_Espelho.QRDBTDescProduto.Font.Size := 7;
         FRPedido_Espelho.QRDBText11.Font.Size := 7;
         FRPedido_Espelho.QRDBText30.Font.Size := 7;
         FRPedido_Espelho.QRDBText31.Font.Size := 7;
         FRPedido_Espelho.QRDBText32.Font.Size := 7;
         FRPedido_Espelho.QRDBText33.Font.Size := 7;
         FRPedido_Espelho.QRDBText34.Font.Size := 7;
       end;
       if DMParamSistema.CodEmpresa = 'PAULINHO' then
       begin
         FRPedido_Espelho.QRLabel45.Caption     := 'Frete';
         FRPedido_Espelho.QRLabel27.Enabled     := False;
         FRPedido_Espelho.QRDBText26.Enabled    := False;
         FRPedido_Espelho.QRLabel39.Enabled     := False;
         FRPedido_Espelho.QRLPesoBruto.Enabled  := False;
         FRPedido_Espelho.QRLabel41.Enabled     := False;
         FRPedido_Espelho.QRLPesoLiquido.Enabled:= False;
       end;
       if (DMParamSistema.CodEmpresa = 'REDIESEL') or (DMParamSistema.CodEmpresa = 'BIGMETAL') or
          (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'FERRAGMED') then
       begin
         FRPedido_Espelho.QRDBTDescProduto.DataField := 'DESC_PRODUTO2';
       end;
       if (DMParamSistema.CodEmpresa = 'CASATINTAS') then
         FRPedido_Espelho.QRDBTDescProduto.DataField := 'DESC_PRODUTO3'; //Junior 21/03/2019
       if DMParamSistema.CodEmpresa = 'ENERMED' then  //Solicitado por Sebastião. Junior 15/05/2020
       begin
         FRPedido_Espelho.QRDBTDescProduto.DataField := 'DESC_PRODUTO3';
         FRPedido_Espelho.QRDBTCodProduto.DataField := 'NUM_FABRICANTE';
       end;

       FRPedido_Espelho.QRPrimario.Preview;
     End;
    DMPedido.QRPedido.Close;
    DMPedido.QRMaterial.Close;
  end
  else if (DMParamSistema.CodEmpresa = 'DINIZ') or (DMParamSistema.CodEmpresa = 'USIMED') or
          (DMParamSistema.CodEmpresa = 'ALVARES') or (DMParamSistema.CodEmpresa = 'SCALA') then   //SOLICITADO POR ODIRLEI. - JUNIOR 04/03/2021
  begin
    DMPedido.QRPedido.Open;
    if FRPedido_2Vias = nil then
      FRPedido_2Vias := TFRPedido_2Vias.Create(Application);
    if (DMParamSistema.CodEmpresa = 'ALVARES') or (DMParamSistema.CodEmpresa = 'DINIZ') or
       (DMParamSistema.CodEmpresa = 'SCALA') then
      FRPedido_2Vias.QRDBTCodProduto.DataField := 'COD_PRODUTO';
    if (DMParamSistema.CodEmpresa <> 'DINIZ') Then
    Begin
      FRPEdido_2Vias.QRShape1.Top := 115;
      FRPEdido_2Vias.QRLabel36.Top := 114;
      FRPEdido_2Vias.QRDBText37.Top := 114;
      FRPEdido_2Vias.QRLabel33.Top := 114;
      FRPEdido_2Vias.QRlTroca.Caption := '';
    End;
    if (DMParamSistema.CodEmpresa = 'SCALA') then
      FRPedido_2Vias.QRLabel3.Caption := 'Orçamento';
    if DMPedido.QRPedido.RecordCount < 15 then
      FRPedido_2Vias.QRCompositeReport1.Preview
    else
      FRPedido_2Vias.QRPrimario.Preview;
    DMPedido.QRPedido.Close;
    FRPedido_2Vias.Free; //Utilizado para ver se resolve o erro de "Illegal Acess..." Suporte(13481). Junior 04/10/2019
    FRPedido_2Vias := nil;
  end
  else if (DMParamSistema.CodEmpresa = 'INJEPAR') then
  begin
    DMPedido.QRPedido.SQL[DMPedido.QRPedido.SQL.Count - 1] := ''; // elimina a última Linha da SQL
    DMPedido.QRPedido.Sql.Add(' ORDER BY TB_PRODUTO.IND_TIPO_PRODUTO,TB_PEDIDO_ITEM.COD_PRODUTO');
    DMPedido.QRPedido.Open;
    if FROrcamentoProdutoServico = nil then
      FROrcamentoProdutoServico := TFROrcamentoProdutoServico.Create(Application);
    FROrcamentoProdutoServico.QRPrimario.Preview;
  end
  else if (DMParamSistema.CodEmpresa = 'NEOALI') then
  begin
    DMPedido.QRPedido.Open;
    if FRPedidoNeoAli = nil then
      FRPedidoNeoAli := TFRPedidoNeoAli.Create(Application);
    FRPedidoNeoAli.QRPrimario.Preview;
  end
  else if (DMParamSistema.CodEmpresa = 'SIGVANS') then
  begin
    DMPedido.QRPedido.SQL[DMPedido.QRPedido.SQL.Count - 1] := ''; // elimina a última Linha da SQL
    DMPedido.QRPedido.Sql.Add(' ORDER BY TB_PRODUTO.IND_OPCAO_PRODUTO,TB_PEDIDO_ITEM.COD_PEDIDO_ITEM');
    DMPedido.QRPedido.Open;
    if FRPedidoSigVans = nil then
      FRPedidoSigVans := TFRPedidoSigVans.Create(Application);
    if messageDlg('Deseja gerar orçamento para produção?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      FRPedidoSigVans.QRDBText14.Enabled :=False;
      FRPedidoSigVans.QRDBText4.Enabled := False;
      FRPedidoSigVans.QRLabel9.Enabled  := False;
      FRPedidoSigVans.QRDBText4.Enabled := False;
      FRPedidoSigVans.QRLabel14.Enabled := False;
      FRPedidoSigVans.QRExpr1.Enabled   := False;
      FRPedidoSigVans.QRLabel15.Enabled := False;
      FRPedidoSigVans.QRExpr2.Enabled   := False;
      FRPedidoSigVans.QRLabel21.Enabled := False;
      FRPedidoSigVans.QRExpr6.Enabled   := False;
      FRPedidoSigVans.QRHRule3.Enabled  := False;
      FRPedidoSigVans.QRLabel22.Enabled := False;
      FRPedidoSigVans.QRExpr4.Enabled   := False;
      FRPedidoSigVans.QRLabel17.Enabled := False;
      FRPedidoSigVans.QRLabel18.Enabled := False;
      FRPedidoSigVans.QRDBText21.Enabled:= False;
      FRPedidoSigVans.QRLabel20.Enabled := False;
      FRPedidoSigVans.QRDBText11.Enabled := False;
    end
    else
    begin
      FRPedidoSigVans.QRDBText14.Enabled :=True;
      FRPedidoSigVans.QRDBText4.Enabled := True;
      FRPedidoSigVans.QRLabel9.Enabled  := True;
      FRPedidoSigVans.QRDBText4.Enabled := True;
      FRPedidoSigVans.QRLabel14.Enabled := True;
      FRPedidoSigVans.QRExpr1.Enabled   := True;
      FRPedidoSigVans.QRLabel15.Enabled := True;
      FRPedidoSigVans.QRExpr2.Enabled   := True;
      FRPedidoSigVans.QRLabel21.Enabled := True;
      FRPedidoSigVans.QRExpr6.Enabled   := True;
      FRPedidoSigVans.QRHRule3.Enabled  := True;
      FRPedidoSigVans.QRLabel22.Enabled := True;
      FRPedidoSigVans.QRExpr4.Enabled   := True;
      FRPedidoSigVans.QRLabel17.Enabled := True;
      FRPedidoSigVans.QRLabel18.Enabled := True;
      FRPedidoSigVans.QRDBText21.Enabled:= True;
      FRPedidoSigVans.QRLabel20.Enabled := True;
      FRPedidoSigVans.QRDBText11.Enabled:= True;
    end;
    FRPedidoSigVans.QRPrimario.Preview;
  end;
end;

procedure TFPedidoCad.PedidosCancelados1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[2].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.ME2Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.ME2Vendedor.Enabled := False;
    FPedidoParam.Bt2Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME2Filial.Text), 'VENDA');
      QRPedido_Cancelado.Close;
      QRPedido_Cancelado.SetVariable('DATA_I', FPedidoParam.ME2DataI.Text);
      QRPedido_Cancelado.SetVariable('DATA_F', FPedidoParam.ME2DataF.Text);

      if Trim(FPedidoParam.ME2Filial.Text) = '' then
        QRPedido_Cancelado.SetVariable('FILIAL', Null)
      else
        QRPedido_Cancelado.SetVariable('FILIAL', FPedidoParam.ME2Filial.Text);
      if Trim(FPedidoParam.ME2Cadastro.Text) = '' then
        QRPedido_Cancelado.SetVariable('CADASTRO', Null)
      else
        QRPedido_Cancelado.SetVariable('CADASTRO', FPedidoParam.ME2Cadastro.Text);
      if Trim(FPedidoParam.ME2Produto.Text) = '' then
        QRPedido_Cancelado.SetVariable('PRODUTO', Null)
      else
        QRPedido_Cancelado.SetVariable('PRODUTO', FPedidoParam.ME2Produto.Text);
      if Trim(FPedidoParam.ME2Vendedor.Text) = '' then
        QRPedido_Cancelado.SetVariable('VENDEDOR', Null)
      else
        QRPedido_Cancelado.SetVariable('VENDEDOR', FPedidoParam.ME2Vendedor.Text);
      QRPedido_Cancelado.Open;
      if FRPedido_Cancelado = nil then
        FRPedido_Cancelado := TFRPedido_Cancelado.Create(Application);
      FRPedido_Cancelado.QRLTitulo.Caption := 'Pedidos Cancelados (' + FPedidoParam.ME2DataI.text + ' - ' + FPedidoParam.ME2DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Cancelado.QRPrimario.Preview
      else
        FRPedido_Cancelado.QRPrimario.Print;
      QRPedido_Cancelado.Close;
    end;

end;

procedure TFPedidoCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ((DBMemo1.Focused) or (DBEdit15.Focused) or (DBEdit7.Focused)) then
    Exit;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MARTICAR' then
  begin
     if Key = Chr(43) then
     begin
       OracleNavigator1.BtnClick(NbInsert);
       Key := #0;
       if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
         EdNumFabricante.SetFocus
       else
         DBECodProduto.SetFocus;
     end;
    if Key = Chr(45) then
    begin
      OracleNavigator1.BtnClick(NbDelete);
      Key := #0;
      if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
        EdNumFabricante.SetFocus
      else
        DBECodProduto.SetFocus;
    end;
  end;
end;

procedure TFPedidoCad.Pedidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[3].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.Fm4Vendedor.MEVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.Fm4Vendedor.MEVendedor.Enabled := False;
    FPedidoParam.Fm4Vendedor.BtVendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME4Filial.Text), 'VENDA');
    if (Trim(FPedidoParam.ME4Data_I.Text) = '') or (Trim(FPedidoParam.ME4Data_F.Text) = '') then
      raise Exception.Create('É necessário informar um período');
    with DMPedido do
    begin
      QRPedidoPeriodo.Close;
      QRPedidoPeriodo.ClearVariables;
      if Trim(FPedidoParam.ME4Filial.Text) <> '' then
        QRPedidoPeriodo.SetVariable('FILIAL', FPedidoParam.ME4Filial.Text);
      if Trim(FPedidoParam.Me4Cadastro.Text) <> '' then
        QRPedidoPeriodo.SetVariable('CADASTRO', FPedidoParam.Me4Cadastro.text);
      if Trim(FPedidoParam.Fm4vendedor.MeVendedor.Text) <> '' then
        QRPedidoPeriodo.SetVariable('VENDEDOR', FPedidoParam.Fm4vendedor.MeVendedor.Text);
      if Trim(FPedidoParam.Fm4Cidade.MeCidade.Text) <> '' then
        QRPedidoPeriodo.SetVariable('COD_CIDADE', FPedidoParam.Fm4Cidade.MeCidade.Text);
      QRPedidoPeriodo.SetVariable('DATA_I', FPedidoParam.ME4Data_I.Text);
      QRPedidoPeriodo.SetVariable('DATA_F', FPedidoParam.ME4Data_F.Text);

      case FPedidoParam.Rg4TipoPagamento.ItemIndex of
        1: QRPedidoPeriodo.SetVariable('TIPO_PAGAMENTO', trim('A VISTA'));
        2: QRPedidoPeriodo.SetVariable('TIPO_PAGAMENTO', trim('A PRAZO'));
        3: QRPedidoPeriodo.SetVariable('TIPO_PAGAMENTO', trim('OUTROS'));
      end;
      If (FPedidoParam.Rg4TipoPedido.ItemIndex = 1) Then
         QRPedidoPeriodo.SetVariable('ATENDIDOS','N')
      else
        QRPedidoPeriodo.SetVariable('ATENDIDOS',NULL);
      if (DMParamSistema.CodEmpresa = 'INJEPAR') then
      begin
        if (FPedidoParam.Rg4TipoMotor.ItemIndex = 0) then
          QRPedidoPeriodo.SetVariable('DESC_TIPO_MOTOR','COMPLETO')
        else
          QRPedidoPeriodo.SetVariable('DESC_TIPO_MOTOR','PARCIAL');
        end
      else
        QRPedidoPeriodo.SetVariable('DESC_TIPO_MOTOR',NULL);

      //alterado para utilizar a query do DMPedido para reduzir o código e facilitar a manutenção. - Cleber - 25/11/2019
      {QRPedidoPeriodo.Sql.Clear;
      QRPedidoPeriodo.Sql.Add('SELECT Tb_pedido_cab.NUM_PEDIDO, Tb_pedido_cab.DT_EMISSAO, Tb_pedido_cab.COD_CADASTRO, Tb_cadastro.NOME,');
      QRPedidoPeriodo.Sql.Add('SUM(DESC_PERC(DESC_PERC(DESC_PERC(QT_PEDIDO * val_unitario,');
      QRPedidoPeriodo.Sql.Add('TB_PEDIDO_ITEM.perc_desconto),');
      QRPedidoPeriodo.Sql.Add('TB_PEDIDO_ITEM.perc_desconto1),');
      QRPedidoPeriodo.Sql.Add('TB_PEDIDO_ITEM.perc_desconto2) +');
      QRPedidoPeriodo.Sql.Add('(QT_PEDIDO*VAL_UNITARIO*(NVL(PERC_ACRESCIMO,0)/100))) AS SVAL_TOTAL ');
      QRPedidoPeriodo.Sql.Add('FROM TB_PEDIDO_CAB Tb_pedido_cab, TB_CADASTRO Tb_cadastro, TB_PEDIDO_ITEM Tb_pedido_item');
      QRPedidoPeriodo.Sql.Add('WHERE (Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) AND (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) ');
      if Trim(FPedidoParam.ME4Filial.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.COD_FILIAL =  ' + Trim(FPedidoParam.ME4Filial.Text));
      if Trim(FPedidoParam.Me4Cadastro.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.COD_CADASTRO =  ' + Trim(FPedidoParam.ME4Cadastro.Text));
      if Trim(FPedidoParam.Me4Origem.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_item.COD_ORIGEM =  ' + Trim(FPedidoParam.ME4Origem.Text));
      If Trim(FPedidoParam.Fm4Vendedor.MeVendedor.Text) <> '' Then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.COD_VENDEDOR =  ' + Trim(Trim(FPedidoParam.Fm4Vendedor.MeVendedor.Text)));
      case FPedidoParam.Rg4TipoPagamento.ItemIndex of
        1: QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'A VISTA' + Chr(39));
        2: QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'A PRAZO' + Chr(39));
        3: QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'OUTROS' + Chr(39));
      end;
      QRPedidoPeriodo.Sql.Add(' AND TB_PEDIDO_CAB.DT_EMISSAO >= ' + chr(39) + FPedidoParam.ME4Data_I.Text + chr(39));
      QRPedidoPeriodo.Sql.Add(' AND TB_PEDIDO_CAB.DT_EMISSAO <= ' + chr(39) + FPedidoParam.ME4Data_F.Text + chr(39));
      QRPedidoPeriodo.Sql.Add(' GROUP BY Tb_pedido_cab.NUM_PEDIDO, Tb_pedido_cab.DT_EMISSAO, Tb_pedido_cab.COD_CADASTRO, Tb_cadastro.NOME');
      QRPedidoPeriodo.Sql.Add(' ORDER BY TB_PEDIDO_CAB.DT_EMISSAO'); }

      QRPedidoPeriodo.Open;

      if FRPedido_Periodo = nil then
        FRPedido_Periodo := TFRPedido_Periodo.Create(Application);
      FRPedido_Periodo.QRLEmpresa.Caption := FPedidoParam.ME4Filial.Text + '-' + FPedidoParam.Ed4Filial.Text;
      FRPedido_Periodo.QRLTitulo.Caption := 'Pedidos no periodo (' + FPedidoParam.ME4Data_I.text + ' - ' + FPedidoParam.ME4Data_F.Text + ')' + '  Origem do Produto : ' + FPedidoParam.ME4Origem.text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Periodo.QRPrimario.Preview
      else
        FRPedido_Periodo.QRPrimario.Print;
      QRPedidoPeriodo.Close;
    end;
  end;
end;

procedure TFPedidoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(14);
end;

procedure TFPedidoCad.AcompanhamentoPedidos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[4].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.ME5Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.ME5Vendedor.Enabled := False;
    FPedidoParam.Btn5Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME5Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME5Data_I.Text) = '') or (Trim(FPedidoParam.ME5Data_F.Text) = '') then
        raise Exception.Create('É necessário informar um período');
      QRPedido_Acomp.Close;
      QRPedido_Acomp.SetVariable('DATA_I', FPedidoParam.ME5Data_I.Text);
      QRPedido_Acomp.SetVariable('DATA_F', FPedidoParam.ME5Data_F.Text);
      if Trim(FPedidoParam.ME5Filial.Text) = '' then
        QRPedido_Acomp.SetVariable('FILIAL', Null)
      else
        QRPedido_Acomp.SetVariable('FILIAL', FPedidoParam.ME5Filial.Text);
      if Trim(FPedidoParam.ME5Vendedor.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedido_Acomp.SetVariable('COD_VENDEDOR', FPedidoParam.ME5Vendedor.Text);
      if Trim(FPedidoParam.Me5Cadastro.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_CADASTRO', Null)
      else
        QRPedido_Acomp.SetVariable('COD_CADASTRO', FPedidoParam.Me5Cadastro.Text);
      if Trim(FPedidoParam.Fm5Produto.MeProduto.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_PRODUTO', Null)
      else
        QRPedido_Acomp.SetVariable('COD_PRODUTO', FPedidoParam.Fm5Produto.MeProduto.Text);
      case FPedidoParam.Rg5TipoPagamento.ItemIndex of
        0: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', Null);
        1: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'A VISTA');
        2: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'A PRAZO');
        3: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'OUTROS');
      end;
      QRPedido_Acomp.Open;
      if FRPedido_Acomp = nil then
        FRPedido_Acomp := TFRPedido_Acomp.Create(Application);
      FRPedido_Acomp.QRLTitulo.Caption := 'Acompanhamento de Pedidos (' + FPedidoParam.ME5Data_I.text + ' - ' + FPedidoParam.ME5Data_F.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Acomp.QRPrimario.Preview
      else
        FRPedido_Acomp.QRPrimario.Print;
      QRPedido_Acomp.Close;
    end;

end;

procedure TFPedidoCad.PedidosAbertoscomPreoMdio1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[5].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.ME6Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.ME6Vendedor.Enabled := False;
    FPedidoParam.Bt6Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME6Filial.Text), 'VENDA');
      QRPedido_Preco_Medio.Close;

      if Trim(FPedidoParam.ME6Filial.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('FILIAL', Null)
      else
        QRPedido_Preco_Medio.SetVariable('FILIAL', FPedidoParam.ME6Filial.Text);

      if Trim(FPedidoParam.ME6Produto.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('PRODUTO', Null)
      else
        QRPedido_Preco_Medio.SetVariable('PRODUTO', FPedidoParam.ME6Produto.Text);

      if Trim(FPedidoParam.ME6Vendedor.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('VENDEDOR', Null)
      else
        QRPedido_Preco_Medio.SetVariable('VENDEDOR', FPedidoParam.ME6Vendedor.Text);

      if Trim(FPedidoParam.ME6DataI.Text) <> '' then
        QRPedido_Preco_Medio.SetVariable('DATA_I', FPedidoParam.ME6DataI.Text)
      else
        raise exception.Create('Data Inicial não pode ficar em Branco !!');
      if Trim(FPedidoParam.ME6DataF.Text) <> '' then
        QRPedido_Preco_Medio.SetVariable('DATA_F', FPedidoParam.ME6DataF.Text)
      else
        raise exception.Create('Data Final não pode ficar em Branco !!');

      case FPedidoParam.Rg6TipoPagamento.ItemIndex of
        0: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', Null);
        1: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'A VISTA');
        2: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'A PRAZO');
        3: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'OUTROS');
      end;
      QRPedido_Preco_Medio.Open;
      if FRPedido_Preco_Medio = nil then
        FRPedido_Preco_Medio := TFRPedido_Preco_Medio.Create(Application);
      FRPedido_Preco_Medio.QRLTitulo.Caption := 'Pedidos Abertos com Preço Médio(' + FPedidoParam.ME6DataI.text + ' - ' + FPedidoParam.ME6DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Preco_Medio.QRPrimario.Preview
      else
        FRPedido_Preco_Medio.QRPrimario.Print;
      QRPedido_Preco_Medio.Close;
    end;

end;

procedure TFPedidoCad.PedidosAbertosporVencimento1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[6].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME7Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME7DataI.Text) = '') or (Trim(FPedidoParam.ME7DataF.Text) = '') then
        raise Exception.Create('É necessário informar um período');

      QRPedAberto_Venc.Close;
      if Trim(FPedidoParam.ME7Filial.Text) = '' then
        QRPedAberto_Venc.SetVariable('FILIAL', Null)
      else
        QRPedAberto_Venc.SetVariable('FILIAL', FPedidoParam.ME7Filial.Text);

      if Trim(FPedidoParam.ME7Cadastro.Text) = '' then
        QRPedAberto_Venc.SetVariable('CADASTRO', Null)
      else
        QRPedAberto_Venc.SetVariable('CADASTRO', FPedidoParam.ME7Cadastro.Text);

      if Trim(FPedidoParam.ME7Produto.Text) = '' then
        QRPedAberto_Venc.SetVariable('PRODUTO', Null)
      else
        QRPedAberto_Venc.SetVariable('PRODUTO', FPedidoParam.ME7Produto.Text);

      QRPedAberto_Venc.SetVariable('DATA_I', FPedidoParam.ME7DataI.Text);
      QRPedAberto_Venc.SetVariable('DATA_F', FPedidoParam.ME7DataF.Text);

      QRPedAberto_Venc.Open;
      if FRPedAberto_Venc = nil then
        FRPedAberto_Venc := TFRPedAberto_Venc.Create(Application);
      FRPedAberto_Venc.QRLTitulo.Caption := 'Pedidos Abertos por Vencimento (' + FPedidoParam.ME7DataI.text + ' - ' + FPedidoParam.ME7DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedAberto_Venc.QRPrimario.Preview
      else
        FRPedAberto_Venc.QRPrimario.Print;
      QRPedAberto_Venc.Close;
    end;

end;

procedure TFPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMPedido do
  begin
    QPedido.Close;
    QPedidoItem.Close;
    QSomaPedido.Close;
    QUltimosPedidos_Itens.Close;
    QCaixaPedido.Close;
    QImagemPedido.Close;
  end;
  DMEstoque.QEstoqueCons.Close;
  Action := CaFree;
  FPedidoCad := nil;
end;

procedure TFPedidoCad.PosioPedidosCEstoque1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[7].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FPedidoParam.Me8Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FPedidoParam.Me8Vendedor.Enabled := False;
    FPedidoParam.Bt8Vendedor.Enabled := False;
  end;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME8Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME8Data_I.Text) = '') or (Trim(FPedidoParam.ME8Data_F.Text) = '') then
        raise Exception.Create('É necessário informar um período');
      QRPedidoEstoque.Close;
      QRPedidoEstoque.SetVariable('DATA_I', FPedidoParam.ME8Data_I.Text);
      QRPedidoEstoque.SetVariable('DATA_F', FPedidoParam.ME8Data_F.Text);
      if Trim(FPedidoParam.ME8Filial.Text) = '' then
      begin
        QRPedidoEstoque.SetVariable('FILIAL', Null);
        DMPedido.pFilial := 0; // para usar no calcfields
      end
      else
      begin
        QRPedidoEstoque.SetVariable('FILIAL', FPedidoParam.ME8Filial.Text);
        DMPedido.pFilial := StrToInt(Trim(FPedidoParam.ME8Filial.Text)); // para usar no calcfields
      end;
      if Trim(FPedidoParam.ME8Cultura.Text) = '' then
        QRPedidoEstoque.SetVariable('CULTURA', Null)
      else
        QRPedidoEstoque.SetVariable('CULTURA', FPedidoParam.ME8Cultura.Text);
      if Trim(FPedidoParam.ME8Cadastro.Text) = '' then
        QRPedidoEstoque.SetVariable('CADASTRO', Null)
      else
        QRPedidoEstoque.SetVariable('CADASTRO', FPedidoParam.ME8Cadastro.Text);
      if Trim(FPedidoParam.ME8Produto.Text) = '' then
        QRPedidoEstoque.SetVariable('PRODUTO', Null)
      else
        QRPedidoEstoque.SetVariable('PRODUTO', FPedidoParam.ME8Produto.Text);
      if Trim(FPedidoParam.ME8Vendedor.Text) = '' then
        QRPedidoEstoque.SetVariable('VENDEDOR', Null)
      else
        QRPedidoEstoque.SetVariable('VENDEDOR', FPedidoParam.ME8Vendedor.Text);
      if Trim(FPedidoParam.ME8Classe.Text) = '' then
        QRPedidoEstoque.SetVariable('CLASSE', Null)
      else
        QRPedidoEstoque.SetVariable('CLASSE', FPedidoParam.ME8Classe.Text);
      if (Trim(FPedidoParam.ME8SubClasse.Text) = '') or (Trim(FPedidoParam.ME8SubClasse.Text) = '0') then
        QRPedidoEstoque.SetVariable('SUB_CLASSE', Null)
      else
        QRPedidoEstoque.SetVariable('SUB_CLASSE', FPedidoParam.ME8SubClasse.Text);
      if Trim(FpedidoParam.FmMarca8.MeMarca.Text) <> '' then
        QRPedidoEstoque.SetVariable('MARCA', Trim(FpedidoParam.FmMarca8.MeMarca.Text))
      else
        QRPedidoEstoque.SetVariable('MARCA', Null);
      QRPedidoEstoque.SQL[QRPedidoEstoque.SQL.count - 1] := '';
      if FPedidoParam.Rg8Ordem.ItemIndex = 0 then
        QRPedidoEstoque.Sql.Add('Order By Cod_Produto')
      else
        QRPedidoEstoque.Sql.Add('Order By Desc_Produto');
      QRPedidoEstoque.Open;
      if FRPedidoEstoque = nil then
        FRPedidoEstoque := tFRPedidoEstoque.Create(Application);
      FRPedidoEstoque.QRLTitulo.Caption := 'Pedidos por Produto (' + FPedidoParam.ME8Data_I.text + ' - ' + FPedidoParam.ME8Data_F.Text + ')';
      FRPedidoEstoque.QRLFilial.Caption := 'Filial:' + FPedidoParam.Ed8Filial.Text;
      if Trim(FPedidoParam.ME8Cultura.Text) <> '' then
        FRPedidoEstoque.QRLFilial.Caption := FRPedidoEstoque.QRLFilial.Caption + ' Cultura:' + FPedidoParam.Ed8Cultura.Text;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoEstoque.QRPrimario.Preview
      else
        FRPedidoEstoque.QRPrimario.Print;
      QRPedidoEstoque.Close;
    end;
end;

procedure TFPedidoCad.BtConsProdutoAuxClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Produto_Aux.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFPedidoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;


procedure TFPedidoCad.OramentoviaWord1Click(Sender: TObject);
var
  table,S,Document, Range: Variant;
  wTotalPedido, wTotalProdutos, percDesconto: real;
  wTotalGeralPedido, wTotalGeralProdutos, wTotalDescontoItem: real;
  wCont, wLinha, wNumeroLinha, i: Integer;
  wCodProduto, wDescPrazo, wObs: string;
  MemoU: TMemo;
begin
  //  wTotalCusto := 0;
  MemoU := TMemo.Create(Self);
  MemoU.Parent := FPedidoCad;
  MemoU.Visible := false;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wCont := 1;
  if Trim(DBECodPedido.Text) = '' then
    raise exception.Create('É necessario que um pedido seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DBEdit2.Text);
    QFilial.Open;
  end;
  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', DBEdit5.Text);
    QCadastro.Open;
  end;
{  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') and (not DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.IsNull) then
  begin
    percDesconto := StrToFloat('0' + DMOracle.fastSelect('PERC_DESCONTO', 'TB_PRAZO_VENCIMENTO',
      'COD_PRAZO_VENCIMENTO = ' + DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.AsString));
    wDescPrazo := DMOracle.fastSelect('DESC_PRAZO_VENCIMENTO', 'TB_PRAZO_VENCIMENTO',
      'COD_PRAZO_VENCIMENTO = ' + DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.AsString);
  end
  else  }  // retirado pelo Cesar
    percDesconto := 0;
  wLinha := 0; //Controlar o paragrafo atual do documento
  NewWord := GetOrCreateObject('Word.Application');
  NewWord.Visible := True;


  //  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
  //  begin
  ////    CopyFile(ExtractFilePath(Application.ExeName) + '\OrcamentoPedido.doc', )
  //    NewWord.Documents.Open(ExtractFilePath(Application.ExeName) + '\OrcamentoPedido.doc');
  //  end
  //  else
  //NewWord.Documents.Open(ExtractFilePath(Application.ExeName) + '\contratos\Orcamento com Timbre.doc');     //vitor

  if DMFilial.QFilialIND_IMPRIME_ORCAMENTO_WORD.Text = 'TIMBRADA' then
  begin
    NewWord.Documents.Open(ExtractFilePath(Application.ExeName) + '\contratos\Orcamento com Timbre.doc');
    Document := NewWord.Documents.Item(1);

    Document.Paragraphs.Add;

    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := ' O R Ç A M E N T O ';
    //Range.Font := 'Arial';
    Range.Bold := 1;
    Range.Font.Size := 14;
    Document.Paragraphs.Item(wLinha).Alignment := '1';
    Document.Paragraphs.Item(wLinha).Range.Bold := 0;

    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Document.Paragraphs.Item(wLinha).Alignment := '0';
    Range.Text := '__________________________________________________________________________________';
    Document.Paragraphs.Item(wLinha).Range.Font.Size := 12;  //12

    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'CADASTRO: ' + DBedit5.Text + '-' + DMCadastro.QCadastroNome.Text;
    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'CNPJ: ' + DMCadastro.QCadastroNUM_CGC_CPF.Value+'    INSCRIÇÃO ESTADUAL:' + DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Document.Paragraphs.Item(wLinha).Alignment := '0';
    Document.Paragraphs.Item(wLinha).Range.Font.Size := 10;  //12

    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'ENDEREÇO: ' + DMCadastro.QCadastroDESC_ENDERECO.Value;

    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'CIDADE  : ' + Trim(DMCadastro.QCadastroDESC_CIDADE.Value) + '-' + 'UF: ' +
    Trim(DMCadastro.QCadastroCOD_ESTADO.Value) + '   CEP : ' +
    Trim(DMCadastro.QCadastroDESC_CEP.Value) +
    '    TELEFONE: ' + DMCadastro.QCadastroDESC_CELULAR.Value;
    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'E_Mail: ' +  Trim(DMCadastro.QCadastroDESC_E_MAIL.Text);

    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'VENDEDOR: ' + DBEdit4.Text + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(DMPedido.QPedidoCod_Vendedor.Value));


   Document.Paragraphs.Add;
   Inc(wLinha);
   Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := '__________________________________________________________________________________';
   Document.Paragraphs.Item(wLinha).Range.Font.Size := 12;
 //  Document.Paragraphs.Add; Comentado por Djeison
   Document.Paragraphs.Add;
   Inc(wLinha, 1);
   Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := 'Nº. PEDIDO: ' + DBEdit6.Text + '    DATA EMISSÃO: ' + DBEdit8.Text;
   Range.Bold := 1;
   Range.Font.Size := 10;

   Document.Paragraphs.Add;
   Inc(wLinha);
   Range := Document.Paragraphs.Item(wLinha).Range;
   If DmPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A VISTA' Then
      Range.Text := 'FORMA DE PAGAMENTO: A Vista'
   Else
      If DmPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO' Then
         if DmPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text <> '' Then
            Range.Text := 'FORMA DE PAGAMENTO: A Prazo - ' + DMOracle.BuscaNome('SELECT DESC_PRAZO_VENCIMENTO FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + DmPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text,True)
         Else
            Range.Text := 'FORMA DE PAGAMENTO: A Prazo - '
      Else
         Range.Text := 'FORMA DE PAGAMENTO: Cartão';
   Document.Paragraphs.Add;
   Inc(wLinha, 1);

   Document.Paragraphs.Add;
   Inc(wLinha, 1);
   Range.Bold := 0;
   Document.Paragraphs.Add;
   Inc(wLinha);
   Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := '__________________________________________________________________________________________________';


   Document.Paragraphs.Add;
   Inc(wLinha);
   if DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value <> '' then
   begin
     Range := Document.Paragraphs.Item(wLinha).Range;
     Range.Text := 'FORMA DE PAGAMENTO: ' + DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value;
     Document.Paragraphs.Add;
     Inc(wLinha);
   end;
   Range := Document.Paragraphs.Item(wLinha).Range;
   if not DMPedido.QPedidoDT_ENTREGA.IsNull then
   begin
     Range.Text := 'PRAZO DE ENTREGA: ' + FormatDateTime('dd/MM/yyyy', DMPedido.QPedidoDT_ENTREGA.Value);
     Document.Paragraphs.Add;
     Inc(wLinha);
   end;
   {Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS.Value;

   Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS2.Value;}

    Document.Paragraphs.Add;
    Inc(wLInha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;

    MemoU.Lines.Add(DMPedido.QPedidoDESC_OBSERVACAO.Text);
    wNumeroLinha := MemoU.Lines.Count;
    Range.Text := 'OBSERVAÇÃO : ' + MemoU.Lines.Text;
    while  i < wNumeroLinha do
    begin
      Document.Paragraphs.Add;
      Inc(wLinha);
      Inc(i);
    end;
{    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := DMPedido.QPedidoDESC_OBSERVACAO.Value; }

    Document.Paragraphs.Item(wLinha).Alignment := '0';
    if DMPedido.QPedidoCOD_MENSAGEM.Text <> '' Then
     Begin
       DMMensagem.QMensagem.Close;
       DMMensagem.QMensagem.SetVariable('PK', DMPedido.QPedidoCOD_MENSAGEM.Text);
       DMMensagem.QMensagem.Open;
       if DMMensagem.QMensagemDESC_MENSAGEM.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Inc(wLinha);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_MENSAGEM.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO1.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO1.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO2.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO2.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO3.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO3.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO4.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO4.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO5.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO5.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO6.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO6.Text;
        end;
       if DMMensagem.QMensagemDESC_COMPLEMENTO7.Text <> '' Then
        Begin
          Document.Paragraphs.Add;
          Document.Paragraphs.Add;
          Inc(wLinha,2);
          Range := Document.Paragraphs.Item(wLinha).Range;
          Range.Text := DMMensagem.QMensagemDESC_COMPLEMENTO7.Text;
        end;
       DMMensagem.QMensagem.Close;
    end;
    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := '__________________________________________________________________________________________________';

    //INICIO
   if (DMParamSistema.QParamSistemaCod_Empresa.Text <> 'NIR') then
   Begin
     DMPedido.QPedidoItem.First;

     while not DMPedido.QPedidoItem.eof do
     begin
       with DMPedido do
       begin
         wTotalGeralProdutos := wTotalGeralProdutos + (QPedidoItemVAL_UNITARIO.Value * QPedidoItemQT_PEDIDO.Value);// + QPedidoItemValor_total.Value;
         if QPedidoItemPERC_DESCONTO.Value > 0 then
         begin
           wTotalGeralPedido := wTotalGeralPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value);
           wTotalDescontoItem := wTotalDescontoItem + ((QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100) * QPedidoItemQT_PEDIDO.Value);
         end
         else
           wTotalGeralPedido := wTotalGeralPedido + QPedidoItemValor_total.Value;
         QPedidoItem.Next;
       end;
     end;
     //FIM

      Document.Paragraphs.Add;
      Inc(wLinha);
      Range := Document.Paragraphs.Item(wLinha).Range;
      Range.Text := 'TOTAL DO(S) PRODUTO(S) .........: '+ FormatFloat('#0.00', wTotalGeralProdutos);//Bib.NumToTexto(wTotalGeralProdutos, 2, 10);
      Document.Paragraphs.Add;
      Inc(wLinha);
      Range := Document.Paragraphs.Item(wLinha).Range;
      Range.Text := 'DESCONTO ......................................: '+  FormatFloat('#0.00', wTotalDescontoItem + DMPedido.QPedidoVAL_DESCONTO.Value); //Bib.NumToTexto(DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);
      Document.Paragraphs.Add;
      Inc(wLinha);
      Range := Document.Paragraphs.Item(wLinha).Range;
      Range.Text := 'TOTAL DO PEDIDO........................: '+ FormatFloat('#0.00', wTotalGeralPedido - DMPedido.QPedidoVAL_DESCONTO.Value);//Bib.NumToTexto(wTotalGeralPedido - DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);
    end;
   Document.Paragraphs.Add;
   Document.Paragraphs.Add;
   Document.Paragraphs.Add;
   Inc(wLinha, 3);
   Range := Document.Paragraphs.Item(wLinha).Range;
   Range.Text := DMFilial.QFilialDESC_CIDADE.Value + ', ' + Copy(DateToStr(Date), 1, 2) + ' de ' +
     Bib.NomeMes(StrToInt(Copy(DateToStr(Date), 4, 2))) + ' de ' + Copy(DateToStr(Date), 7, 4);
   Document.Paragraphs.Item(12).Alignment := '0'; //estava '1'   // Alterado de 22 para 11

   if (DMParamSistema.QParamSistemaCod_Empresa.Text <> 'NIR') then
   Begin
     Document.Paragraphs.Add;

     Inc(wLinha, 1);
     Document.Paragraphs.Item(wLinha).Alignment := '2';
     Range := Document.Paragraphs.Item(wLinha).Range;
     Range.Text :=   '________________________________________________';

     Document.Paragraphs.Add;
     Inc(wLinha, 1);
     Document.Paragraphs.Item(wLinha).Alignment := '2';
     Range := Document.Paragraphs.Item(wLinha).Range;

     Range.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
   end;
   Document.Paragraphs.Add;
   Inc(wLinha, 1);

   Range := Document.Paragraphs.Item(15).Range; // Djeison - Era 14   isso quer dizer que vai incluir o texto abaixo a partir da linha 13 do word
   if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'NIR') then
    Begin
      table := Document.Tables.Add(Range, 1, 5);
      table.Cell(1, 1).Width := '1.61';  // codigo
      table.Cell(1, 2).Width := '11';     //  descricao
      table.Cell(1, 3).Width := '1.89';     //  quant 1.39 vira desc 8.31
      table.Cell(1, 4).Width := '1.89';      /// unitario
      table.Cell(1, 5).Width := '1.89';     // total
    end
   else
    Begin
      table := Document.Tables.Add(Range, 1, 8);
      table.Cell(1, 1).Width := '1.1';
      table.Cell(1, 2).Width := '1.61';     //     cod fixo
      table.Cell(1, 3).Width := '8.20';     //  quant 1.39 vira desc 8.31
      table.Cell(1, 4).Width := '1.39';      /// qtd nvo
      table.Cell(1, 5).Width := '1,89';     // unit
      table.Cell(1, 6).Width := '1.89';      //desc
      table.Cell(1, 7).Width := '1.89';     //total
    end;

   table.Cell(1, 1).Range.Text := 'Código';
   if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'NIR') then
    Begin
      table.Cell(1, 2).Range.Text := 'Descrição Produto/Serviço';
      table.Cell(1, 3).Range.Text := 'Quant';
      table.Cell(1, 3).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 4).Range.Text := 'Unitário';
      table.Cell(1, 4).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 5).Range.Text := 'Total';
      table.Cell(1, 5).Range.ParagraphFormat.Alignment := 2;
    End
   else
    Begin
      table.Cell(1, 2).Range.Text := 'Num. Fab.';
      table.Cell(1, 3).Range.Text := 'Descrição Produto/Serviço';
      table.Cell(1, 4).Range.Text := 'Quant';
      table.Cell(1,4).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 5).Range.Text := 'Unitário';
      table.Cell(1,5).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 6).Range.Text := 'Desc %';
      table.Cell(1,6).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 7).Range.Text := 'Total';
      table.Cell(1,7).Range.ParagraphFormat.Alignment := 2;
        //table.Font.Bold = True
    End;
   table.Rows.Add;
   DMPedido.QPedidoItem.First;
   while not DMPedido.QPedidoItem.eof do
   begin
     with DMPedido do
     begin
       if  (DMParamSistema.QParamSistemaCod_Empresa.Text = 'NIR') then
        Begin
          table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := QPedidoItemCOD_PRODUTO.Text;
          if QPedidoItemDESC_OBS_ITEM.Text <> '' Then
             table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := QPedidoItemDESC_OBS_ITEM.Value
          else
             table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := QPedidoItemDESC_PRODUTO.Value;
          table.Cell(QPedidoItem.RecNo + 1, 3).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 0, 6);
          table.Cell(QPedidoItem.RecNo + 1, 4).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * percDesconto / 100), 2, 8);
          table.Cell(QPedidoItem.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
          wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
          if QPedidoItemPERC_DESCONTO.Value > 0 then
             wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
          else
             wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
        end
       else
        begin
          if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARZ') then
             table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := Bib.NumToTexto(wCont, 0, 3);

          table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value, 0, 6);

          table.Cell(QPedidoItem.RecNo + 1, 3).Range.Text := QPedidoItemDESC_PRODUTO.Value;  //Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
          table.Cell(QPedidoItem.RecNo + 1, 4).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 0, 6);

          table.Cell(QPedidoItem.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * percDesconto / 100), 2, 8);
          if QPedidoItemPERC_DESCONTO.Value > 0 then
             table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
          table.Cell(QPedidoItem.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
          wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
          if QPedidoItemPERC_DESCONTO.Value > 0 then
             wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
          else
             wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
        end;
       wCont := wCont + 1;
       QPedidoItem.Next;
     end;
     table.Rows.Add;
   end;

//   table.Cell(DMPedido.QPedidoItem.RecNo + 3, 1).Range.Text := ' ';
   table.Rows.Add;
   table.Cell(wCont + 1, 2).Range.Text := 'Total do orçamento';
   table.Cell(wCont + 1, 5).Range.Text := Bib.NumToTexto(wTotalProdutos, 2, 10);
   Range.Bold := 0;
   Range.Font.Size := 10;


   DMCadastro.QCadastro.Close;
   DMFilial.QFilial.Close;


  end
  else
  begin
  NewWord.Documents.Add;
  // Obtem documento e paragrafo
  Document := NewWord.Documents.Item(1);
  if (DMParamSistema.CodEmpresa = 'KREUZ') Then
  begin
     Document.PageSetup.Orientation := 0;//Fabio da Kreuz, solicitou para ser Retrato. Alex 13/05/2026  // 1; orientacao do papel modo paisagem
     Document.PageSetup.LeftMargin  := '1.5 cm';
     Document.PageSetup.RightMargin := '1.5 cm';
     Document.PageSetup.TopMargin   := '1.5 cm';
     Document.PageSetup.BottomMargin:= '1.5 cm';
  end;
  if percDesconto > 0.009 then
    Document.PageSetup.LeftMargin := '1,8 cm';
//  Document.Paragraphs.Add;  - Comentado por Djeison para economizar espaço
   if (DMParamSistema.CodEmpresa = 'SOLDAR') or (DMParamSistema.CodEmpresa = 'DONABENTA')then
   begin
    try
      Inc(wLinha);
      NewWord.Selection.InlineShapes.AddPicture(WideString(ExtractFilePath(Application.ExeName) + '\logo.jpg'));
      Document.Paragraphs.Add;
    except
      Dec(wLinha);
    end;
  end;

  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := '---  O R Ç A M E N T O  ---';
  //Range.Font := 'Arial';
  Range.Bold := 1;
  Range.Font.Size := 16;
  Document.Paragraphs.Item(wLinha).Alignment := '1';
  Document.Paragraphs.Item(wLinha).Range.Bold := 0;

//  Document.Paragraphs.Add; Comentado por Djeison
//  Inc(wLinha);
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'REDIESEL') then
    Document.Paragraphs.Item(wLinha).Alignment := '0';
  Document.Paragraphs.Add;
  Inc(wLinha);
  Document.Paragraphs.Item(wLinha).Range.Font.Size := 12;

  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'REDIESEL') then
    Range.Text := DMFilial.QFilialDesc_Filial.Text + ' CNPJ: ' + DMFilial.QFilialNUM_CGC.Text +
                ' Inscrição Estadual ' + DMFilial.QFilialDESC_INSCRICAO.Text;

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'REDIESEL') then
    Range.Text := 'ENDEREÇO: ' + DMFilial.QFilialDESC_ENDERECO.Text + ',' + DMFilial.QFilialNUM_ENDERECO.AsString + ' - ' +
      DMFilial.QFilialDESC_CIDADE.Text + ' TELEFONE: ' + DMFilial.QFilialDESC_TELEFONE.Text;

//  Document.Paragraphs.Add;  Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'CADASTRO: ' + DBedit5.Text + '-' + DMCadastro.QCadastroNome.Text;
  Document.Paragraphs.Item(wLinha).Alignment := '0';

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'ENDEREÇO: ' + DMCadastro.QCadastroDESC_ENDERECO.Value;

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'CIDADE  : ' + Trim(DMCadastro.QCadastroDESC_CIDADE.Value) + '-' + 'UF: ' +
    Trim(DMCadastro.QCadastroCOD_ESTADO.Value) + '   CEP : ' +
    Trim(DMCadastro.QCadastroDESC_CEP.Value) +
    '    TELEFONE: ' + DMCadastro.QCadastroDESC_TELEFONE.Value;

//  Document.Paragraphs.Add; Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'VENDEDOR: ' + DBEdit4.Text + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(DMPedido.QPedidoCod_Vendedor.Value));
  //Caso houve um segundo vendedor para o mesmo pedido. Junior - 13/06/2014.
  if DMPedido.QPedidoCOD_VENDEDOR_PREPOSTO.Text <> '' then
  begin
  Document.Paragraphs.Add;
  Inc(wLinha,1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'VENDEDOR: ' + DBEdit28.Text + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(DMPedido.QPedidoCOD_VENDEDOR_PREPOSTO.Value));
  end;
//  Document.Paragraphs.Add; Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'Nº. PEDIDO: ' + DBEdit6.Text + '             DATA EMISSÃO: ' + DBEdit8.Text +
    '          VENCIMENTO: ' + DBEdit26.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Range.Bold := 0;
//  Document.Paragraphs.Add;
//  Document.Paragraphs.Add;  Comentado por Djeison
//  Document.Paragraphs.Add;
  Inc(wLinha, 1);

  if DMPedido.QPedidoDESC_VEICULO.Value <> '' then
  begin
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'VEÍCULO: ' + DMPedido.QPedidoDESC_VEICULO.Value;
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;

  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'OBSERVAÇÃO : ' + DMPedido.QPedidoDESC_OBSERVACAO.Value;

  Document.Paragraphs.Add;
  Inc(wLinha);
  if DMPedido.QPedidoDESC_TECIDO.Value <> '' then
  begin
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'TECIDO: ' + DMPedido.QPedidoDESC_TECIDO.Value;
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;
  if DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value <> '' then
  begin
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'FORMA DE PAGAMENTO: ' + DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value;
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;
  Range := Document.Paragraphs.Item(wLinha).Range;
  if not DMPedido.QPedidoDT_ENTREGA.IsNull then
  begin
    Range.Text := 'PRAZO DE ENTREGA: ' + FormatDateTime('dd/MM/yyyy', DMPedido.QPedidoDT_ENTREGA.Value);
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS.Value;

//  Document.Paragraphs.Add;    Comentado por Djeison
//  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS2.Value;

//  Document.Paragraphs.Add;    Comentado por Djeison
//  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Inc(wLinha, 2);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := DMFilial.QFilialDESC_CIDADE.Value + ', ' + Copy(DateToStr(Date), 1, 2) + ' de ' +
    Bib.NomeMes(StrToInt(Copy(DateToStr(Date), 4, 2))) + ' ' + Copy(DateToStr(Date), 7, 4);
  Document.Paragraphs.Item(11).Alignment := '1';   // Alterado de 22 para 11

//  Document.Paragraphs.Add;
  if (DMParamSistema.CodEmpresa <> 'SOLDAR') and (DMParamSistema.CodEmpresa <> 'DONABENTA') then
  begin
    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'DECLARO ESTAR DE ACORDO COM O PRESENTE ORÇAMENTO E CIENTE DO PRAZO DE ENTREGA E PAGAMENTO.';
  end;

//  Document.Paragraphs.Add; Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Document.Paragraphs.Item(wLinha).Alignment := '2';
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := '___/___/______     ________________________________________________';
  Document.Paragraphs.Add;

  Inc(wLinha, 1);
  Document.Paragraphs.Item(wLinha).Alignment := '2';
  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.CodEmpresa = 'SOLDAR') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
    Range.Text := DMFilial.QFilialDESC_FILIAL.Value
  else
    Range.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(10).Range; // Djeison - Era 14
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' then
   Begin
     table := Document.Tables.Add(Range, 1, 8); //9 / Fabio da Kreuz solicitou para ser alterado. Alex 13/05/2026
      table.Cell(1, 1).Width := '1.80';
      table.Cell(1, 2).Width := '1.40';
      table.Cell(1, 3).Width := '0.70';
      table.Cell(1, 4).Width := '6.00';
      table.Cell(1, 5).Width := '1.60';
      table.Cell(1, 6).Width := '1.60';
      table.Cell(1, 7).Width := '1.60';
      table.Cell(1, 8).Width := '1.60';

      table.Cell(1, 1).Range.Text := 'Código';
      table.Cell(1, 2).Range.Text := 'Quant.';
      table.Cell(1, 2).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 3).Range.Text := 'Un';
      table.Cell(1, 4).Range.Text := 'Descrição Produto/Serviço';
      table.Cell(1, 4).Range.ParagraphFormat.Alignment := 0;
      table.Cell(1, 5).Range.Text := 'Unitário';
      table.Cell(1, 5).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 6).Range.Text := 'Desconto';
      table.Cell(1, 6).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 7).Range.Text := 'Unit C/Desc';
      table.Cell(1, 7).Range.ParagraphFormat.Alignment := 2;
      table.Cell(1, 8).Range.Text := 'Total';
      table.Cell(1, 8).Range.ParagraphFormat.Alignment := 2;
   End
   else
   Begin
     if (percDesconto > 0.009) then
      begin
        table := Document.Tables.Add(Range, 1, 8);
        table.Cell(1, 1).Width := '0.5';
      end
     else
      begin
        table := Document.Tables.Add(Range, 1, 7); // novoDoc.Tables.Add(Selection.Range, 3, 5)
        table.Cell(1, 1).Width := '0.95';
      end;
     if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAELETRO' then
        table.Cell(1, 1).Width := '1.90';
     table.Cell(1, 2).Width := '1.61';
     table.Cell(1, 3).Width := '1.39';
     table.Cell(1, 4).Width := '0.80';
     table.Cell(1, 5).Width := '8.31';
     table.Cell(1, 6).Width := '1.89';
     // table.Cell(1,6).Width:= '1.51';
     table.Cell(1, 7).Width := '1.89';
     if (percDesconto > 0.009) then
        table.Cell(1, 8).Width := '1.89'
     else
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAELETRO' then
          table.Cell(1, 1).Range.Text := 'NCM'
       else
          table.Cell(1, 1).Range.Text := 'Item';
     table.Cell(1, 2).Range.Text := 'Código';
     table.Cell(1, 3).Range.Text := 'Quant.';
     table.Cell(1, 3).Range.ParagraphFormat.Alignment := 2;
     table.Cell(1, 4).Range.Text := 'Un';
     table.Cell(1, 5).Range.Text := 'Descrição Produto/Serviço';
     table.Cell(1,5).Range.ParagraphFormat.Alignment := 0;
     if (percDesconto > 0.009) then
      begin
        table.Cell(1, 6).Range.Text := 'Un c\ Desc';
        table.Cell(1,6).Range.ParagraphFormat.Alignment := 2;
        table.Cell(1, 7).Range.Text := 'Unitário';
        table.Cell(1,7).Range.ParagraphFormat.Alignment := 2;
        //  table.Cell(1,6).Range.Text:='% Desc.    ';
        table.Cell(1, 8).Range.Text := 'Total';
        table.Cell(1,8).Range.ParagraphFormat.Alignment := 2;
      end
     else
      begin
        table.Cell(1, 6).Range.Text := 'Unitário';
        table.Cell(1,6).Range.ParagraphFormat.Alignment := 2;
        //  table.Cell(1,6).Range.Text:='% Desc.    ';
        table.Cell(1, 7).Range.Text := 'Total';
        table.Cell(1,7).Range.ParagraphFormat.Alignment := 2;
      end;
      //table.Font.Bold = True
   end;
   table.Rows.Add;
   DMPedido.QPedidoItem.First;
  while not DMPedido.QPedidoItem.eof do
  begin
    with DMPedido do
    begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'KREUZ')  Then
       Begin
         if (Trim(QPedidoItemNUM_FABRICANTE.Value) <> '') Then
           table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := QPedidoItemNUM_FABRICANTE.Value
         else
           table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value, 0, 6);
         table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 2, 6);
         table.Cell(QPedidoItem.RecNo + 1, 3).Range.Text := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value));
         table.Cell(QPedidoItem.RecNo + 1, 4).Range.Text := QPedidoItemDESC_PRODUTO.Value;  //Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
         table.Cell(QPedidoItem.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value, 2, 6);

         table.Cell(QPedidoItem.RecNo + 1, 6).Range.Text := Bib.NumToTexto((QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);
         table.Cell(QPedidoItem.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);

         table.Cell(QPedidoItem.RecNo + 1, 8).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 6);
         wTotalProdutos := wTotalProdutos + QPedidoItemVAL_UNITARIO.Value * QPedidoItemQT_PEDIDO.Value;
         wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
       end
      else
       begin
        if DMParamSistema.QParamSistemaCod_Empresa.Text = 'RAELETRO' then
          table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := Trim(DMOracle.BuscaNome('SELECT NUM_GENERO_NCM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)))
        else
          table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := Bib.NumToTexto(wCont, 0, 3);
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ')     Or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'NEOALI'))   And
           (Trim(QPedidoItemNUM_FABRICANTE.Value) <> '') Then
           table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := QPedidoItemNUM_FABRICANTE.Value
        else
           table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value, 0, 6);
        table.Cell(QPedidoItem.RecNo + 1, 3).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 0, 6);
        table.Cell(QPedidoItem.RecNo + 1, 4).Range.Text := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value));
        table.Cell(QPedidoItem.RecNo + 1, 5).Range.Text := QPedidoItemDESC_PRODUTO.Value;  //Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
        if (percDesconto > 0.009) then
        begin
          table.Cell(QPedidoItem.RecNo + 1, 6).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * percDesconto / 100), 2, 8);
          table.Cell(QPedidoItem.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);
          //      if QPedidoItemPERC_DESCONTO.Value > 0 then
          //         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
          table.Cell(QPedidoItem.RecNo + 1, 8).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
          wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
          if QPedidoItemPERC_DESCONTO.Value > 0 then
            wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
          else
            wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
        end
        else
        begin
          table.Cell(QPedidoItem.RecNo + 1, 6).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);
          table.Cell(QPedidoItem.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
          wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
          if QPedidoItemPERC_DESCONTO.Value > 0 then
            wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
          else
            wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
        end;
       end;
      wCont := wCont + 1;
      QPedidoItem.Next;
    end;
    table.Rows.Add;
  end;

//  table.Rows.Add;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'KREUZ')  Then
   Begin
     table.Cell(DMPedido.QPedidoItem.RecNo + 3, 4).Range.Text :=
          'TOTAL DO(S) PRODUTO(S) .........: ';
     table.Cell(DMPedido.QPedidoItem.RecNo + 3, 8).Range.Text :=
          Bib.NumToTexto(wTotalProdutos, 2, 10);
   end
  Else
   Begin
     table.Cell(DMPedido.QPedidoItem.RecNo + 3, 5).Range.Text :=
          'TOTAL DO(S) PRODUTO(S) .........: ';
     table.Cell(DMPedido.QPedidoItem.RecNo + 3, 7).Range.Text :=
          Bib.NumToTexto(wTotalProdutos, 2, 10);
   end;

  if (percDesconto > 0.009) then
  begin
    table.Rows.Add;
    table.Cell(DMPedido.QPedidoItem.RecNo + 4, 5).Range.Text :=
      'DESCONTO PARA PAGAMENTO ' + wDescPrazo + ':';
    table.Cell(DMPedido.QPedidoItem.RecNo + 4, 7).Range.Text :=
      Bib.NumToTexto(wTotalPedido * percDesconto/100 , 2, 10);

    table.Rows.Add;
    table.Cell(DMPedido.QPedidoItem.RecNo + 5, 5).Range.Text :=
      'TOTAL DO PEDIDO ........................: ';
    table.Cell(DMPedido.QPedidoItem.RecNo + 5, 7).Range.Text :=
      Bib.NumToTexto(wTotalPedido - wTotalPedido * percDesconto/100, 2, 10);
  end
  else
  begin
    table.Rows.Add;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'KREUZ')  Then
     Begin
       table.Cell(DMPedido.QPedidoItem.RecNo + 4, 4).Range.Text :=
         'DESCONTO ...................................: ';
       table.Cell(DMPedido.QPedidoItem.RecNo + 4, 8).Range.Text :=
         Bib.NumToTexto(wTotalPedido - wTotalProdutos, 2, 10);
     end
    else
     begin
       table.Cell(DMPedido.QPedidoItem.RecNo + 4, 5).Range.Text :=
         'DESCONTO ...................................: ';
       table.Cell(DMPedido.QPedidoItem.RecNo + 4, 7).Range.Text :=
         Bib.NumToTexto(DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);
     end;

    table.Rows.Add;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'KREUZ')  Then
     Begin
       table.Cell(DMPedido.QPedidoItem.RecNo + 5, 4).Range.Text :=
         'TOTAL DO PEDIDO .......................: ';
       table.Cell(DMPedido.QPedidoItem.RecNo + 5, 8).Range.Text :=
         Bib.NumToTexto(wTotalPedido - DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);
     end
    else
     Begin
       table.Cell(DMPedido.QPedidoItem.RecNo + 5, 5).Range.Text :=
         'TOTAL DO PEDIDO .......................: ';
       table.Cell(DMPedido.QPedidoItem.RecNo + 5, 7).Range.Text :=
         Bib.NumToTexto(wTotalPedido - DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);
     end;
  end;
  Range.Bold := 0;
  Range.Font.Size := 10;

  DMCadastro.QCadastro.Close;
  DMFilial.QFilial.Close;
{  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') then
  begin
    Document.Paragraphs.Add;
    NewWord.Selection.InlineShapes.AddPicture(WideString(ExtractFilePath(Application.ExeName) + '\imagens\assinatura.jpeg'),
      False, True, Document.Paragraphs.Item(Document.Paragraphs.Count).Range);
  end;  }
  //-----------------lista de produtos em estoque
  if (DMParamSistema.CodEmpresa <> 'REDIESEL')  and
     (DMParamSistema.CodEmpresa <> 'KREUZ')     and
     (DMParamSistema.CodEmpresa <> 'NIR')       and
     (DMParamSistema.CodEmpresa <> 'NEOALI')    and
     (DMParamSistema.CodEmpresa <> 'SOLDAR')    and
     (DMParamSistema.CodEmpresa <> 'DONABENTA') then
  begin
    DMPedido.QPedidoItem.First;
//    Document.Paragraphs.Add;  Comentado por Djeison
//    Document.Paragraphs.Add;
    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
    Range.Text := 'Relação Produtos Em Estoque';
//Comentado por Djeison
//    Document.Paragraphs.Add;
//    Inc(wLinha);
//    Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
//    Range.Text := '------------------------------------';
//    Document.Paragraphs.Add;
//    Inc(wLinha);
    Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
    Document.Paragraphs.Add;
    Inc(wLinha);
    Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
    Range.Text := ' Código         Produto                                    Custo         Quantidade';
//    Document.Paragraphs.Add;   Comentado por Djeison
//    Inc(wLinha);
    with DMPedido do
    begin
      while not DMPedido.QPedidoItem.Eof do
      begin
        QPedidoEstoque.Close;
        QPedidoEstoque.SetVariable('COD_PRODUTO', QPedidoItemCOD_PRODUTO.Value);
        QPedidoEstoque.Open;
        Document.Paragraphs.Add;
        Inc(wLinha);
        Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
          wCodProduto := QPedidoItemNUM_FABRICANTE.Text
        else
          wCodProduto := QPedidoItemCOD_PRODUTO.Text;
        Range.Text := Bib.FormataTexto(wCodProduto, 14) + ' |  ' + Bib.FormataTexto(Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value))), 30)
          + ' |  ' + Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueVL_ULTIMO_CUSTO.Value, 2, 8), 10) + ' |  ' + Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueQT_QUANTIDADE.Value, 0, 10), 10);
        QPedidoItem.Next;
      end;
    end;
  end;
end;
end;


function TFPedidoCad.GetOrCreateObject(const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID(ClassName);
  if Succeeded(GetActiveObject(ClassID, nil, Unknown)) then
    OleCheck(Unknown.QueryInterface(IDispatch, Result))
  else
    Result := CreateOleObject(ClassName);
end;

procedure TFPedidoCad.DBEdit5Exit(Sender: TObject);
var wEnderecoEntrega, wEntrega, wCadastro, wClassCadastro, wObs: string;
  wVctoAlvaraSanitarioStr: string;
  wVctoAlvaraSanitario, wDataAtual: TDateTime;
begin
  inherited;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' then
  begin
    wObs := DMOracle.FastSelect('DESC_OBS','TB_CADASTRO','COD_CADASTRO = ' + DBEdit5.Text);
    if wObs <> '' then
    begin
      MessageDlg(wObs, mtInformation, [mbOK], 0);
    end;
  end;

  if (DSPrimario.State in [DsEdit, DsInsert]) then
  begin
    if Trim(DMPedido.QPedidoCod_Cadastro.Text) <> '' then
    begin
      if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') then
      begin
        Buscador.Limpa;
        Buscador.Adiciona('DESC_FORMA_COMPRA', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCOD_CADASTRO.Value));
        Buscador.Adiciona('PERC_DESCONTO', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value));
        Buscador.Adiciona('NOME_CONTATO', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        Buscador.Adiciona('NOME_CONTATO2', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        Buscador.Adiciona('COD_OPERACAO_CC', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ') then
          Buscador.Adiciona('COD_PRAZO_VENCIMENTO', 'TB_CADASTRO',
            'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        Buscador.Adiciona('IND_CONSUMIDOR_FINAL', 'TB_CADASTRO',
          'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        Buscador.Buscar();
        LblFormaCompra.Caption := Buscador.Proximo;
        LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc ' + Buscador.Proximo;
        LblAutoriza.Caption := 'Autorizado:' + Buscador.Proximo;
        LblAutoriza.Caption := LblAutoriza.Caption + '-' + Buscador.Proximo;
        LblAutoriza.Caption := LblAutoriza.Caption + ' Oper:' + Buscador.Proximo;
{Solicitado por Junior da Deion para que quando houver endereço de entrega informado no cadastro do cliente o mesmo vá automaticamente para a observação
pedido/nota. cod_suporte: 7101 - Alex 18/05/2023. Adicinado para GGIRARDI. Cod_suporte: 7463 Alex 30/06/2023}
        if (DMParamSistema.CodEmpresa = 'DEION') or (DMParamSistema.CodEmpresa = 'GGIRARDI') then
        begin
          wEnderecoEntrega := DMOracle.FastSelect('DESC_ENDERECO_ENTREGA', 'TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
            if (wEnderecoEntrega <> '') then
            begin
              wEntrega := 'Endereço de entrega: ' + wEnderecoEntrega + ' / ' + DMOracle.FastSelect('DESC_CIDADE_ENTREGA', 'TB_CADASTRO', 'COD_CADASTRO = ' +
                                                                                   DMPedido.QPedidoCOD_CADASTRO.Text);
              DBMemo1.Text := wEntrega;
            end;
        end;

        if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ') then
           DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text := Buscador.Proximo;
        DMPedido.QPedidoIND_CONSUMIDOR_FINAL.Value := BusCador.Proximo;
      end;
      DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
      begin
        if (DMPedido.QPedidoCod_Departamento.Value = 12) then
          if DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMpedido.QPedidoCod_Cadastro.Text) = 'PR' then
            DMPedido.QPedidoCod_Mensagem.Value := 3
          else
            DMPedido.QPedidoCod_Mensagem.Value := 8;
        if DMPedido.QPedidoCOD_FILIAL.Value = 9 then
          DMPedido.QPedidoCod_Mensagem.Value := 49;
      end;
    end
    else
    begin
      LblAutoriza.Caption := '';
      LblFormaCompra.Caption := '';
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'DEION') and (not DMUsuario.Privilegiado) then
   begin
     if DMCadastro.QCadastroCOD_TABELA_PRECO_CAB.text = '' then
     begin
       DBEdit5.Clear;
       raise Exception.Create('Cliente sem Tabela de Preço, favor contatar a gerência');
     end;
//Solicitado para bloquear pedidos para clientes com classificação sem premissão de venda. cod_suporte: 8103. Alex 27/10/2023
     wCadastro := '';
     wClassCadastro := '';
     wCadastro := (DMOracle.FastSelect('COD_CLASS_CADASTRO', 'TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text));
     wClassCadastro :=  (DMOracle.FastSelect('IND_VENDA', 'TB_CLASS_CADASTRO', 'COD_CLASS_CADASTRO = ' + wCadastro));
     if (wClassCadastro = 'N') then
       raise Exception.Create('Cliente sem permissão para digitar pedido. Entre em contato com a gerência!!!');
   end;
  // Notificar quando a licença sanitária do cliente está vencida ou prestes. Utilizado por GGirardi COD_SUPORTE: 9962. Jefferson
  if Trim(DMPedido.QPedidoCod_Cadastro.Text) <> '' then
  begin
    wVctoAlvaraSanitarioStr := DMOracle.FastSelect('DT_VCTO_ALVARA_SANITARIO', 'TB_CADASTRO',
           'COD_CADASTRO = ' + DMPedido.QPedidoCod_Cadastro.Text);
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
end;

procedure TFPedidoCad.PedidoscomNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[8].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME34Filial.Text), 'VENDA');
      QRPedidoComNota.Close;
      if Trim(FPedidoParam.ME34Filial.Text) = '' then
        QRPedidoComNota.SetVariable('COD_FILIAL', Null)
      else
        QRPedidoComNota.SetVariable('COD_FILIAL', trim(FPedidoParam.ME34Filial.Text));

      if Trim(FPedidoParam.ME34Cadastro.Text) = '' then
        QRPedidoComNota.SetVariable('COD_CADASTRO', Null)
      else
        QRPedidoComNota.SetVariable('COD_CADASTRO', trim(FPedidoParam.ME34Cadastro.Text));

      if Trim(FPedidoParam.ME34Vendedor.Text) = '' then
        QRPedidoComNota.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedidoComNota.SetVariable('COD_VENDEDOR', trim(FPedidoParam.ME34Vendedor.Text));

      if Trim(FPedidoParam.ME34DT_Emissao_I.Text) <> '' then
        QRPedidoComNota.SetVariable('DT_EMISSAO_I', trim(FPedidoParam.ME34DT_Emissao_I.Text));

      if Trim(FPedidoParam.ME34DT_Emissao_F.Text) <> '' then
        QRPedidoComNota.SetVariable('DT_EMISSAO_F', trim(FPedidoParam.ME34DT_Emissao_F.Text));

      if Trim(FPedidoParam.ME34Motivo.Text) = '' then
        QRPedidoComNota.SetVariable('MOTIVO', Null)
      else
        QRPedidoComNota.SetVariable('MOTIVO', Trim(FPedidoParam.ME34Motivo.Text));

      if Trim(FPedidoParam.ME34Operacao1.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO1', Trim(FPedidoParam.ME34Operacao1.Text));
      if Trim(FPedidoParam.ME34Operacao2.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO2', Trim(FPedidoParam.ME34Operacao2.Text));
      if Trim(FPedidoParam.ME34Operacao3.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO3', Trim(FPedidoParam.ME34Operacao3.Text));
      if Trim(FPedidoParam.ME34Operacao4.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO4', Trim(FPedidoParam.ME34Operacao4.Text));

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      begin
        QRPedidoComNota.SQL.Add('ORDER BY DESC_MOTIVO, COD_PEDIDO_CAB');
      end;

      QRPedidoComNota.Open;
      if FRPedidoComNota = nil then
        FRPedidoComNota := TFRPedidoComNota.Create(Application);

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      begin
        FRPedidoComNota.QRGroup1.Enabled := true;
        QRPedidoComNota.SQL[QRPedidoComNota.SQL.Count - 1] := '';
      end;
      FRPedidoComNota.QRLFilial.Caption := FPedidoParam.ME34Filial.Text + ' ' + FPedidoParam.Ed34Filial.Text;
      FRPedidoComNota.QRLCliente.Caption := FPedidoParam.ME34Cadastro.Text + ' ' + FPedidoParam.Ed34Cadastro.Text;
      FRPedidoComNota.QRLVendedor.Caption := FPedidoParam.ME34Vendedor.Text + ' ' + FPedidoParam.Ed34Vendedor.Text;
      FRPedidoComNota.QRLMotivo.Caption := 'Motivo: ' + FPedidoParam.Ed34Motivo.Text + '  Operações: '
        + FPedidoParam.Me34Operacao1.Text + ', ' + FPedidoParam.Me34Operacao2.Text + ', '
        + FPedidoParam.Me34Operacao3.Text + ', ' + FPedidoParam.Me34Operacao4.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoComNota.QRPrimario.Preview
      else
        FRPedidoComNota.QRPrimario.Print;
      QRPedidoComNota.Close;
    end;
end;

procedure TFPedidoCad.DBECodProdutoChange(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_empresa.Value <> 'MOINHO') then
  begin
    if (DBECodProduto.Text <> '') and (DMPedido.QpedidoCod_Cadastro.Text <> '') then
    begin
      DMPedido.QUltimosPedidos_Itens.Close;
      DMPedido.QUltimosPedidos_Itens.SetVariable('Cadastro', DMPedido.QpedidoCod_Cadastro.Value);
      DMPedido.QUltimosPedidos_Itens.SetVariable('Produto', DBECodProduto.Text);
      DMPedido.QUltimosPedidos_Itens.Open;
    end;
    if (DBECodProduto.Text <> '') then
    begin
      DMEstoque.QEstoqueCons.Close;
      DMEstoque.QEstoqueCons.SetVariable('Filial', Null);
      DMEstoque.QEstoqueCons.SetVariable('Produto', Null);
      DMEstoque.QEstoqueCons.SetVariable('Tipo_Lote', Null);
      DMEstoque.QEstoqueCons.SetVariable('Cod_Produto', DBECodProduto.Text);
      DMEstoque.QEstoqueCons.Open;
    end;
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ') And (DMPedido.QPedidoItemCOD_PRODUTO.Text <> '') And
     (DMOracle.pDuplicando) then
      DMPedido.QPedidoItemVAL_UNITARIO.Value := strToFloat('0' + DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text));
  
end;

procedure TFPedidoCad.SBCancelarClick(Sender: TObject);
begin
  DMPedido.QPedidoItem.Cancel;
  inherited;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFPedidoCad.BtConsPrazoClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;

end;

procedure TFPedidoCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (DMPedido.QPedidoCOD_OPERACAO.Text <> '') and (DSPrimario.State in [DsEdit, DsInsert]) then
  begin
    if DMOperacao.QOperacaoIND_LIBERADO.Value = '' Then
       DMPedido.Acessa_Operacao;  // para acessar a operacao quando estiver fechada
    if DMOperacao.QOperacaoIND_LIBERADO.Value <> 'S' then // cadastro de operacao esta sendo aberto no on validate da query
    begin
      DbEdit3.SetFocus;
      raise Exception.Create('Operação Não Liberada Para Uso');
    end;
    If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value =  'P' Then
       DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO'
    Else
      If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'O' Then
         DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'OUTROS'
      Else
         If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'V' Then
            DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A VISTA';
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
      if Trim(DBEdit51.Text) = '12' then
      begin
        if DMOperacao.QOperacaoInd_Bonificacao.Value = 'S' then
          DMPedido.QPedidoCod_Mensagem.Value := 16;
        if DMOperacao.QOperacaoInd_Troca.Value = 'S' then
          DMPedido.QPedidoCod_Mensagem.Value := 17;
      end;
    DMPedido.QPedidoCOD_MENSAGEM.Text := DMOperacao.QOperacaoCod_Mensagem.Text;
  end;
end;

procedure TFPedidoCad.SpeedButton1Click(Sender: TObject);
var
  wRetorno, wNotaCab: string;
begin
  inherited;
  wRetorno := DMOracle.BuscaNome('SELECT COD_NOTA_ITEM FROM TB_BAIXA_PEDIDO', 'COD_PEDIDO_ITEM = ' + DMPedido.QPedidoItemCod_Pedido_Item.Text);
  if wRetorno <> '' then
  begin
    wNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_ITEM', 'COD_NOTA_ITEM = ' + wRetorno);
    if FNotaSaidaCad = nil then
      FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK', wNotaCab);
    DMTela.VerificaTela('VENDA', FNotaSaidaCad.Caption, FNotaSaidaCad.Name);
    FNotaSaidaCad.ShowModal;
  end;
end;

procedure TFPedidoCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin 
  inherited;
  if DMPedido.DSPedidoItem.State = DsInsert then
   Begin
     if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
       EdNumFabricante.SetFocus
     else
       DBECodProduto.SetFocus;
   End;
end;

procedure TFPedidoCad.BtCopiaClick(Sender: TObject);
var
  wVlCampo: array[0..350, 0..300] of string;
  wCont, wQtPedidoOrig: Integer;
  wRegistro, i: Integer;
  wCampo, wMascara, wSituacaoProd : String;
  wCodPedidoAnterior: Integer;
  wValVarejo : real;
  Log : TextFile;
begin
  DmOracle.pDuplicando := True;   // esta propriedade serve para poder verificar se esta duplicando um registro - nos modulos somente testar se esta verdadeiro
  wCodPedidoAnterior := DMPedido.QPedidoCOD_PEDIDO_CAB.value;
  wQtPedidoOrig := 0;
  //Pega qt de itens do pedido original para comparar com qt do pedido duplicado
  wQtPedidoOrig := DMPedido.QPedidoItem.RecordCount;

  DMPedido.wDuplica_Pedido := True;
  with DMPedido do
  begin
    wRegistro := -1;
    QPedidoItem.DisableControls;
    DSPedidoItem.DataSet.first;
    while not (DSPedidoItem.DataSet.eof) do
    begin
      wRegistro := wRegistro + 1;
      for wCont := 0 to DSPedidoItem.DataSet.FieldCount - 1 do
      begin
        if DSPedidoItem.Dataset.Fields[wCont].Text = '0,00%' then
          wVlCampo[wCont, wRegistro] := DSPedidoItem.Dataset.Fields[wCont].Text;
        if (DSPedidoItem.Dataset.Fields[wCont].FieldName <> 'Valor_total') and
           (DSPedidoItem.Dataset.Fields[wCont].FieldName <> 'VAL_UNITARIO') then
          DSPedidoItem.Dataset.Fields[wCont].Text := Bib.LimpaString(DSPedidoItem.Dataset.Fields[wCont].Text, '%');

        if (dmparamsistema.QParamSistemaCOD_EMPRESA.Text = 'ARZ') and (DMOperacao.QOperacaoIND_PRECO.Text = 'P') then //A pedido do Luiz Rogério - Vanessa 27/06/2018
        begin
          if (DSPedidoItem.Dataset.Fields[wCont].FieldName = 'COD_PRODUTO') then
          Begin
            If DMOracle.FastSelect('IND_SITUACAO','TB_PRODUTO','COD_PRODUTO = ' + DSPedidoItem.Dataset.Fields[wcont].text) <> 'ATIVO' Then
              Raise Exception.Create('Produto '+DSPedidoItem.Dataset.Fields[wCont].Text+' está desativado ou fora de linha! Não é permitido duplicar o pedido!');
            wValVarejo :=  strtofloat(DMOracle.FastSelect('NVL(VAL_VAREJO,0)', 'TB_PRODUTO', 'COD_PRODUTO = ' + DSPedidoItem.Dataset.Fields[wCont].Text));
          end;
          if (wValVarejo < 0.01) and (DSPedidoItem.Dataset.Fields[wCont].FieldName = 'COD_PRODUTO') then
          begin
            ShowMessage('Valor Unitário do Produto ' + DSPedidoItem.Dataset.Fields[wCont].Text + ' não será atualizado porque esta sem Valor de Varejo no Cadastro de Produto');
          end;
          if (wValVarejo > 0) and (DSPedidoItem.Dataset.Fields[wCont].FieldName = 'VAL_UNITARIO') then
            DSPedidoItem.Dataset.Fields[wCont].Value := wValVarejo
        end;

        wCampo := DSPedidoItem.Dataset.Fields[wCont].Text;
        wVlCampo[wCont, wRegistro] := '';
        for i := 1 to length(wCampo) do
          If wCampo[i] <> '.' Then
             wVlCampo[wCont, wRegistro] := wVlCampo[wCont, wRegistro] + wCampo[i];
      end;
      DSPedidoItem.DataSet.next;
    end;

    inherited;

    for i := 0 to wRegistro do
    begin
      DSPedidoItem.DataSet.Insert;
      for wCont := 0 to DSPedidoItem.DataSet.FieldCount - 1 do
        if ((DSPedidoItem.DataSet.Fields[wCont].Text = '')        Or (DSPedidoItem.DataSet.Fields[wCont].Text = '0')     Or
           (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00')    Or (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00%') Or
           (DSPedidoItem.DataSet.Fields[wCont].FieldName = 'QT_PEDIDO')) and ((DSPedidoItem.DataSet.Fields[wCont].FieldName <> 'QT_ATENDIDO') and
              (DSPedidoItem.DataSet.Fields[wCont].FieldName <> 'QT_CANCELADO'))  then  //Duplicar também a quantidade, não duplicava porque ela tem valor padrao 1.
                                                                                        //Não deve duplicar a quantidade atendido e quantidade cancelado - Alessandro 26/09/12
          DSPedidoItem.DataSet.Fields[wCont].Text := wVlCampo[wCont, i];
      DSPedidoItem.DataSet.Post;
    end;
    QPedidoItem.EnableControls;
  end;
  DMPedido.wDuplica_Pedido := False;

  if (DMParamSistema.CodEmpresa = 'MARTICAR') then
  begin
  //Gravando log para futura verificação da duplicação dos itens - Alessandro
    AssignFile(Log, ExtractFilePath(Application.ExeName) + 'Log.Log');
    If FileExists(ExtractFilePath(Application.ExeName) + 'Log.Log') then
      Append(Log)
    else
      ReWrite(Log);
    Writeln(Log, datetostr(dmoracle.DataHoraServ) + ' - Usuário: ' +  IntToStr(DMUsuario.CodUsuarioCorrente)
      + ' Pedido base: ' + IntToStr(wCodPedidoAnterior) + ' Qtde Base: ' + IntToStr(wQtPedidoOrig) + ' - Pedido gerado: '
        + IntToStr(DMPedido.QPedidoCOD_PEDIDO_CAB.value) + ' Qtde gerado: ' + IntToStr(DMPedido.QPedidoItem.RecordCount));
    CloseFile(Log);
  end;
  // Compara se pedidos original e duplicado tem qt diferentes
  DmOracle.pDuplicando := False;   // esta propriedade serve para poder verificar se esta duplicando um registro - nos modulos somente testar se esta verdadeiro
  if DMPedido.QPedidoItem.RecordCount <> wQtPedidoOrig then
  begin
    MessageDlg('Ocorreu um erro durante a duplicação dos itens do pedido, ' +
      'por favor faça novamente o procedimento.', mtError, [mbOk],0);
    DMOracle.DBCemapa.Rollback;
    Abort;
  end;
end;

procedure TFPedidoCad.BtConsCulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFPedidoCad.DBRGTipoPagamentoClick(Sender: TObject);
begin
  inherited;
  DBEdit5.SetFocus;
end;

procedure TFPedidoCad.PedidosComValor1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[9].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoValor.Close;
      if Trim(FPedidoParam.Me9Filial.Text) <> '' then
        QRPedidoValor.SetVariable('FILIAL', Trim(FPedidoParam.Me9Filial.Text))
      else
        QRPedidoValor.SetVariable('FILIAL', null);
      if Trim(FPedidoParam.Me9Cadastro.Text) = '' then
        QRPedidoValor.SetVariable('CADASTRO', Null)
      else
        QRPedidoValor.SetVariable('CADASTRO', Trim(FPedidoParam.Me9Cadastro.Text));
      if (FPedidoParam.Me9DtInicial.Text = '') or (FPedidoParam.Me9DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoValor.SetVariable('DT_INICIAL', trim(FPedidoParam.ME9DtInicial.Text));
      QRPedidoValor.SetVariable('DT_FINAL', trim(FPedidoParam.ME9DtFinal.Text));
      case FPedidoParam.Rg9Situacao.ItemIndex of
        0: QRPedidoValor.SetVariable('IND_BAIXADO', Null);
        1: QRPedidoValor.SetVariable('IND_BAIXADO', 'A');
        2: QRPedidoValor.SetVariable('IND_BAIXADO', 'B');
      end;

      QRPedidoValor.Open;
      if FrPedidoValor = nil then
        FrPedidoValor := TFrPedidoValor.Create(Application);
      FRPedidoValor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME9DtInicial.Text + ' até ' + FPedidoParam.ME9DtFinal.Text;
      FRPedidoValor.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME9Filial.Text + '' + FPedidoParam.Ed9Filial.Text;
      FRPedidoValor.QRBSumario.Enabled := FPedidoParam.CB9Total.Checked;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoValor.QRPrimario.Preview
      else
        FrPedidoValor.QRPrimario.Print;
      QRPedidoValor.Close;
    end;

end;

procedure TFPedidoCad.PedidosComCusto1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[10].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoCusto.Close;
      if Trim(FPedidoParam.Me10Filial.Text) <> '' then
        QRPedidoCusto.SetVariable('FILIAL', Trim(FPedidoParam.Me10Filial.Text))
      else
        QRPedidoCusto.SetVariable('FILIAL', null);
      if Trim(FPedidoParam.Me10Vendedor.Text) <> '' then
        QRPedidoCusto.SetVariable('COD_VENDEDOR', Trim(FPedidoParam.Me10Vendedor.Text))
      else
        QRPedidoCusto.SetVariable('COD_VENDEDOR', null);

      if (FPedidoParam.Me10Dt_Inicial.Text = '') or (FPedidoParam.Me10Dt_Final.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoCusto.SetVariable('DT_INICIAL', trim(FPedidoParam.ME10Dt_Inicial.Text));
      QRPedidoCusto.SetVariable('DT_FINAL', trim(FPedidoParam.ME10Dt_Final.Text));
      if Trim(FPedidoParam.FM10Cadastro.MeCadastro.Text) <> '' then
        QRPedidoCusto.SetVariable('COD_CADASTRO', Trim(FPedidoParam.FM10Cadastro.MeCadastro.Text))
      else
        QRPedidoCusto.SetVariable('COD_CADASTRO', null);

      QRPedidoCusto.Open;
      if FrPedidoCusto = nil then
        FrPedidoCusto := TFrPedidoCusto.Create(Application);
      FRPedidoCusto.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME10Dt_Inicial.Text + ' até ' + FPedidoParam.ME10Dt_Final.Text;
      FRPedidoCusto.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME10Filial.Text + ' - ' + FPedidoParam.Ed10Filial.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoCusto.QRPrimario.Preview
      else
        FrPedidoCusto.QRPrimario.Print;
      QRPedidoCusto.Close;
    end;
end;

procedure TFPedidoCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[11].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRComissaoPed.Close;
      if Trim(FPedidoParam.ME11Data_I.Text) = '' then
        raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FPedidoParam.ME11Data_F.Text) = '' then
        FPedidoParam.ME11Data_F.Text := DateToStr(Date);
      If DmparamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
        QRComissaoPed.SetVariable('DATAS', 'DT_COMISSAO BETWEEN ' + Chr(39) + Trim(FPedidoParam.ME11Data_I.Text) + Chr(39) + ' AND ' + Chr(39) + Trim(FPedidoParam.ME11Data_F.Text) + Chr(39))
      else
        QRComissaoPed.SetVariable('DATAS', 'DT_EMISSAO BETWEEN ' + Chr(39) + Trim(FPedidoParam.ME11Data_I.Text) + Chr(39) + ' AND ' + Chr(39) + Trim(FPedidoParam.ME11Data_F.Text) + Chr(39));
      if Trim(FPedidoParam.ME11Filial.Text) = '' then
        QRComissaoPed.SetVariable('FILIAL', Null)
      else
        QRComissaoPed.SetVariable('FILIAL', FPedidoParam.ME11Filial.Text);
      if Trim(FPedidoParam.ME11Vendedor.Text) = '' then
        QRComissaoPed.SetVariable('VENDEDOR', Null)
      else
        QRComissaoPed.SetVariable('VENDEDOR', FPedidoParam.ME11Vendedor.Text);
      if FPedidoParam.RG11TipoPagamento.ItemIndex = 0 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'A VISTA')
      else if FPedidoParam.RG11TipoPagamento.ItemIndex = 1 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'A PRAZO')
      else if FPedidoParam.RG11TipoPagamento.ItemIndex = 2 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'OUTROS')
      else
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', NULL);
      QRComissaoPed.Open;
      if FRPedidoComissao = nil then
        FRPedidoComissao := TFRPedidoComissao.Create(Application);
      if FPedidoParam.RG11TipoRelatorio.ItemIndex = 0 then
        FRPedidoComissao.pTipo := 'ANALITICO'
      else
        FRPedidoComissao.pTipo := 'SINTETICO';
      FRPedidoComissao.QRLTitulo.Caption := 'Comissão de Vendedores de ' + FPedidoParam.ME11Data_I.Text + ' Ate ' + FPedidoParam.ME11Data_F.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoComissao.QRPrimario.Preview
      else
        FRPedidoComissao.QRPrimario.Print;
      QRComissaoPed.Close;
    end;
end;

procedure TFPedidoCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;

end;

procedure TFPedidoCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFPedidoCad.BtConsBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.showModal = mrOk then
  begin
    DMPedido.QPedidoCod_Banco_Agencia.Value := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value;
    DMPedido.QPedidoCod_Conta_Corrente.Value := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  end;
end;

procedure TFPedidoCad.BaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    if QPedidoInd_Estoque.Value = 'SIM' then
      raise Exception.Create('Este Pedido Já Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        while not QPedidoItem.Eof do
        begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value, QPedidoCod_Filial.Value, QPedidoItemCod_Produto.Value,
             QPedidoItemCOD_LOTE_TIPO.Value, (QPedidoItemQt_Pedido.Value * -1), 0, Date, Date);
          QPedidoItem.Next;
        end;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'SIM';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  end;
end;

procedure TFPedidoCad.VoltaBaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    if QPedidoInd_Estoque.Value <> 'SIM' then
      raise Exception.Create('Este Pedido Não Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        while not QPedidoItem.Eof do
        begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value, QPedidoCod_Filial.Value, QPedidoItemCod_Produto.Value,
             QPedidoItemCOD_LOTE_TIPO.Value,(QPedidoItemQt_Pedido.Value), 0, Date, Date);
          QPedidoItem.Next;
        end;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'NAO';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  end;
end;

procedure TFPedidoCad.CancelamentoTotaldoPedido1Click(Sender: TObject);
begin
  inherited;
  DMPedido.CancelaPedido;
//  if MessageDlg('Deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//    with DMPedido do
//    begin
//      if QPedidoInd_Situacao.Value = '2' then
//        raise Exception.Create('Este Pedido Já Foi Cancelado');
//      QPedidoItem.First;
//      if QPedidoItem.recordCount > 0 then
//      begin
//        try
//          DMOracle.DBCemapa.StartTransaction;
//          QPedido_Cancelado.Open;
//          QPedido.Edit;
//          while not QPedidoItem.Eof do
//          begin
//            QPedidoItem.Edit;
//            QPedidoItemQt_Cancelado.Value := QPedidoItemQt_Pedido.Value - QPedidoItemQt_Atendido.Value;
//            QPedidoItem.Post;
//            QPedido_Cancelado.Insert;
//            QPedido_CanceladoCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
//            QPedido_CanceladoDt_Cancelamento.Value := DMOracle.DataServ;
//            QPedido_CanceladoQt_Cancelado.Value := QPedidoItemQt_Cancelado.Value;
//            QPedido_CanceladoCod_Usuario.Value := DmUsuario.CodUsuarioCorrente;
//            QPedido_CanceladoCod_Motivo.Value := 1;
//            QPedido_Cancelado.Post;
//            QPedidoItem.Next;
//          end;
//          QPedidoInd_Situacao.Value := '2';
//          QPedido.Post;
//          DmOracle.DBCemapa.Commit;
//        except
//          DmOracle.DBCemapa.Rollback;
//          QPedidoItem.Cancel;
//          raise;
//        end;
//      end
//      else
//        raise exception.Create('Selecionar Pedido Para Cancelar');
//    end;

end;

procedure TFPedidoCad.BtImpItemPedClick(Sender: TObject);
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMPedido.QPedidoCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMPedido.QPedidoCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin
      QPedidoItemCons.Close;
      QPedidoItemCons.SetVariable('Cod_Pedido_Cab', QPedidoConsCod_Pedido_Cab.Value);
      QPedidoItemCons.Open;
      while not QPedidoItemCons.Eof do
      begin
        QPedidoItem.Insert;
        QPedidoItemCOD_PRODUTO.Value := QPedidoItemConsCOD_PRODUTO.Value;
        QPedidoItemCOD_TRIBUTACAO.Value := QPedidoItemConsCOD_TRIBUTACAO.Value;
        QPedidoItemQT_PEDIDO.Value := QPedidoItemConsQT_PEDIDO.Value;
        QPedidoItemVAL_UNITARIO.Value := QPedidoItemConsVAL_UNITARIO.Value;
        QPedidoItemPERC_DESCONTO.Value := QPedidoItemConsPERC_DESCONTO.Value;
        QPedidoItemCOD_LOTE_TIPO.Value := QPedidoItemConsCOD_LOTE_TIPO.Value;
        QPedidoItemPERC_COMISSAO.Value := QPedidoItemConsPERC_COMISSAO.Value;
        QPedidoItemQT_EMBALAGEM.Value := QPedidoItemConsQT_EMBALAGEM.Value;
        if QPedidoItemConsQT_QUANTIDADE_AUX.Text <> '' then
          QPedidoItemQT_QUANTIDADE_AUX.Value := QPedidoItemConsQT_QUANTIDADE_AUX.Value;
        if QPedidoItemConsCOD_PRODUTO_AUX.Text <> '' then
          QPedidoItemCOD_PRODUTO_AUX.Value := QPedidoItemConsCOD_PRODUTO_AUX.Value;
        QPedidoItemPERC_DESCONTO1.Value := QPedidoItemConsPERC_DESCONTO1.Value;
        QPedidoItemPERC_DESCONTO2.Value := QPedidoItemConsPERC_DESCONTO2.Value;
        QPedidoItemPERC_ACRESCIMO.Value := QPedidoItemConsPERC_ACRESCIMO.Value;
        QPedidoItem.Post;
        QPedidoItemCons.Next;
      end;
    end;
end;

procedure TFPedidoCad.PedidosporRepresentante1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[12].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoRepresentante.Close;
      if Trim(FPedidoParam.Me12Filial.Text) <> '' then
        QRPedidoRepresentante.SetVariable('FILIAL', Trim(FPedidoParam.Me12Filial.Text))
      else
        QRPedidoRepresentante.SetVariable('FILIAL', null);

      if Trim(FPedidoParam.ME12Vendedor.Text) = '' then
        QRPedidoRepresentante.SetVariable('VENDEDOR', Null)
      else
        QRPedidoRepresentante.SetVariable('VENDEDOR', FPedidoParam.ME12Vendedor.Text);

      if Trim(FPedidoParam.ME12Supervisor.Text) = '' then
        QRPedidoRepresentante.SetVariable('SUPERVISOR', Null)
      else
        QRPedidoRepresentante.SetVariable('SUPERVISOR', FPedidoParam.ME12Supervisor.Text);
      if Trim(FPedidoParam.Me12Classe.Text) = '' then
        QRPedidoRepresentante.SetVariable('NUM_CLASSE', Null)
      else
        QRPedidoRepresentante.SetVariable('NUM_CLASSE', FPedidoParam.Me12Classe.Text);
      if Trim(FPedidoParam.Me12SubClasse.Text) = '' then
        QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE', Null)
      else
        QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE', FPedidoParam.Me12SubClasse.Text);

      if (FPedidoParam.Me12DtInicial.Text = '') or (FPedidoParam.Me12DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoRepresentante.SetVariable('DT_INICIAL', trim(FPedidoParam.ME12DtInicial.Text));
      QRPedidoRepresentante.SetVariable('DT_FINAL', trim(FPedidoParam.ME12DtFinal.Text));

      QRPedidoRepresentante.Open;
      if FrPedidoRepresentante = nil then
        FrPedidoRepresentante := TFrPedidoRepresentante.Create(Application);
      FrPedidoRepresentante.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME12DtInicial.Text + ' até ' + FPedidoParam.ME12DtFinal.Text;
      FrPedidoRepresentante.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME12Filial.Text + '' + FPedidoParam.Ed12Filial.Text;
      FrPedidoRepresentante.QRLVendedor.Caption := 'Vendedor:' + FPedidoParam.ME12Vendedor.Text + '' + FPedidoParam.Ed12Vendedor.Text;
      FrPedidoRepresentante.QRLSupervisor.Caption := 'Supervisor:' + FPedidoParam.ME12Supervisor.Text + '' + FPedidoParam.Ed12Supervisor.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoRepresentante.QRPrimario.Preview
      else
        FrPedidoRepresentante.QRPrimario.Print;
      QRPedidoRepresentante.Close;
    end;
end;

procedure TFPedidoCad.DBEdit16Change(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit16.Text) <> '' then
    DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(DBEdit16.Text))
  else
    DMPedido.QPedidoCod_Banco_Agencia.Text := '';

end;

procedure TFPedidoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMPedido.DSPedidoItem.AutoEdit := (DMParamSistema.CodEmpresa <> 'MARTICAR');
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MALAGGI') then
      DBGItemPedido.Columns.Items[7].Index := 3;
  GBUsuariosQueLiberaram.Visible := false;


  //Para ZAPOLI não aparecer os campos de desconto e comissao na tela de ITENS. - Junior 12/11/2013
{  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZAPOLI' then  // retirado pelo César dia 28/06/2014
  begin
    if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    begin
      DBEdit27.Visible        := False;
      DBEPercComissao.Visible := False;
      Label23.Visible         := False;
      LblComissao.Visible     := False;
    end
    else
    begin
      DBEdit27.Visible        := True;
      DBEPercComissao.Visible := True;
      Label23.Visible         := True;
      LblComissao.Visible     := True;
    end;
  end;
}
//Solicitado por Marcos da Radiolandia para que os usuários não possam cancelar o inicio de um pedido novo, forçando que o mesmo seja salvo.
//cod_suporte: 3761
  if (DMUsuario.QUsuarioIND_CONTABIL_PRIVILEGIO.Value = 'N') then
  begin
    if (DMParamSistema.CodEmpresa = 'RADIO') then
    begin
     SBCancelar.Enabled := False;
     SBCancelar.Visible := False;
    end;
  end;
  PreodeVendaXPreoVendido1.Visible := True;

end;

procedure TFPedidoCad.AcompanhamentoPedidoPFornecedor1Click(
  Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[13].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidosFornecedor.Close;
      if Trim(FPedidoParam.Me13Filial.Text) <> '' then
        QRPedidosFornecedor.SetVariable('COD_FILIAL', Trim(FPedidoParam.Me13Filial.Text))
      else
        QRPedidosFornecedor.SetVariable('COD_FILIAL', null);

      if Trim(FPedidoParam.Me13Vendedor.Text) = '' then
        QRPedidosFornecedor.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedidosFornecedor.SetVariable('COD_VENDEDOR', FPedidoParam.Me13Vendedor.Text);

      if Trim(FPedidoParam.Me13Classe.Text) = '' then
        QRPedidosFornecedor.SetVariable('NUM_CLASSE', Null)
      else
        QRPedidosFornecedor.SetVariable('NUM_CLASSE', FPedidoParam.Me13Classe.Text);

      if (FPedidoParam.Me13DtInicial.Text = '') or (FPedidoParam.Me13DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidosFornecedor.SetVariable('DT_INICIAL', trim(FPedidoParam.Me13DtInicial.Text));
      QRPedidosFornecedor.SetVariable('DT_FINAL', trim(FPedidoParam.Me13DtFinal.Text));

      QRPedidosFornecedor.Open;
      if FRPedidosFornecedor = nil then
        FRPedidosFornecedor := TFRPedidosFornecedor.Create(Application);
      FRPedidosFornecedor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.Me13DtInicial.Text + ' até ' + FPedidoParam.Me13DtFinal.Text;
      FRPedidosFornecedor.QRLPeriodo.Caption := FRPedidosFornecedor.QRLPeriodo.Caption + ' Classe:' + FPedidoParam.Ed13Classe.Text;
      FRPedidosFornecedor.QRLFilial.Caption := 'Filial:' + FPedidoParam.Me13Filial.Text + ' ' + FPedidoParam.Ed13Filial.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidosFornecedor.QRPrimario.Preview
      else
        FRPedidosFornecedor.QRPrimario.Print;
      QRPedidosFornecedor.Close;
    end;

end;

procedure TFPedidoCad.DBEPrazoChange(Sender: TObject);
begin
  inherited;
  if DBEPrazo.Text <> '' then
    DMpedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
  wAlterou := 'SIM';   // utilizado para atualizar os preços da radiolandia
end;

procedure TFPedidoCad.BtConsOrigemClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Origem.Value := DMEstado.QEstadoConsCod_Estado.Value;
end;

procedure TFPedidoCad.SBAlterarClick(Sender: TObject);
begin
  //  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then
  //    If (DMPedido.QPedidoInd_Embarque.Value = 'S') And Not(DMUsuario.Privilegiado) Then
  //      Raise Exception.Create('Somente usuário privilegiado pode alterar pedido que está no embarque');
  if (DMParamSistema.CodEmpresa = 'DINIZ') Then
   Begin
  //   If (DMPedido.QPedidoInd_Estoque.Value = 'SIM') Then // solicitado pelo Edson Diniz 06/12/2021 - feito pelo Cesar
  //       VoltaBaixaEstoque1Click(Self);                  // 25/03/2025 - substituido por uma trigger
     //feito pelo César a pedido do Diniz 30/08/2023
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE TB_CAIXA_MOV WHERE COD_PEDIDO_CAB = ' + chr(39) + DMPedido.QPedidoCOD_PEDIDO_CAB.Text + chr(39));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Não foi possível voltar o lançamento do cartão!');
    end;
   End;
  inherited;

  if ((DMOracle.FastSelect('COD_PEDIDO_CAB', 'TB_PEDIDO_ITEM',
    '(QT_PEDIDO - FUNC_QT_ATENDIDA_PEDIDO(COD_PEDIDO_ITEM) - QT_CANCELADO) <> 0 AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB =' +
    DMPedido.QPedidoCOD_PEDIDO_CAB.Text) = '') and
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'DEION')) then  //A pedido do Junior e autorizado pelo Marcos. Vanessa 11/02/2019
  begin
    SBCancelar.Click;
    raise Exception.Create('Pedido já foi atendido, não é permitido alterar.');
  end;


end;

procedure TFPedidoCad.MostraoCdigodoEmbarque1Click(Sender: TObject);
var
  wCodigo, wCodigo1, wCodigo2, wCodigo3: string;
begin
  inherited;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text <> '' then
  begin
    wCodigo := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text);

    if wCodigo <> '' then
      wCodigo1 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo);
    if wCodigo1 <> '' then
      wCodigo2 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo
        + ' AND COD_EMBARQUE <> ' + wCodigo1);
    if wCodigo2 <> '' then
      wCodigo3 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo
        + ' AND COD_EMBARQUE <> ' + wCodigo1
        + ' AND COD_EMBARQUE <> ' + wCodigo2);

    if wCodigo <> '' then
      ShowMessage('Pedido Está No Embarque Código ' + wCodigo + ', ' + wCodigo1 + ', ' + wCodigo2 + ', ' + wCodigo3)
    else
      ShowMessage('Pedido Não Está Em Nenhum Embarque ');
  end;
  ShowMessage('Selecione um Pedido!');
end;

procedure TFPedidoCad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if DMPedido.QPedidoInd_Situacao.Value = '2' then
    LblSituacao.Caption := 'CANCELADO'
  else
    LblSituacao.Caption := '';
  MMCadSimples.Items[2].Items[9].Enabled := DMPedido.QPedidoIND_POSICAO_MAX.Value <> 'C';
end;

procedure TFPedidoCad.PedidosporSupervisor1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[14].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoSupervisor.Close;
      if Trim(FPedidoParam.Me14CodFilial.Text) <> '' then
        QRPedidoSupervisor.SetVariable('FILIAL', Trim(FPedidoParam.Me14CodFilial.Text))
      else
        QRPedidoSupervisor.SetVariable('FILIAL', null);
      if Trim(FPedidoParam.Me14CodClasse.Text) <> '' then
        QRPedidoSupervisor.SetVariable('NUM_CLASSE', Trim(FPedidoParam.Me14CodClasse.Text))
      else
        QRPedidoSupervisor.SetVariable('NUM_CLASSE', null);
      if Trim(FPedidoParam.Me14SubClasse.Text) <> '' then
        QRPedidoSupervisor.SetVariable('NUM_SUBCLASSE', Trim(FPedidoParam.Me14SubClasse.Text))
      else
        QRPedidoSupervisor.SetVariable('NUM_SUBCLASSE', null);

      QRPedidoSupervisor.SetVariable('DT_INICIAL', Trim(FPedidoParam.Me14Data_I.Text));
      QRPedidoSupervisor.SetVariable('DT_FINAL', Trim(FPedidoParam.Me14Data_F.Text));

      QRPedidoSupervisor.open;

      if FRPedidoSupervisor = nil then
        FRPedidoSupervisor := TFRPedidoSupervisor.Create(Application);
      FRPedidoSupervisor.QRLFilial.Caption := 'FILIAL ' + Trim(FPedidoParam.Me14CodFilial.Text) + ' ' + Trim(FPedidoParam.Ed14DescFilial.Text);
      FrPedidoSupervisor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME14Data_I.Text + ' até ' + FPedidoParam.ME14Data_F.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoSupervisor.QRPrimario.Preview
      else
        FRPedidoSupervisor.QRPrimario.Print;
      QRPedidoSupervisor.Close;

    end;
end;

procedure TFPedidoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFuncionarioCons = nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  if FFuncionarioCons.ShowModal = mrOk then
    DMPedido.QCustoFuncionarioCod_Funcionario.Value := DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
end;

procedure TFPedidoCad.SBEmiteClick(Sender: TObject);
var
  table, Document, Range: Variant;
  wTotalPedido, wTotalProdutos, wNumHoras, wTotalHoras: real;
  wCont: Integer;
  //  wCodProduto : String;
begin
  wNumHoras := 0;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wTotalHoras := 0;
  wCont := 1;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text = '' then
    raise exception.Create('É necessário que um pedido seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DBEdit2.Text);
    QFilial.Open;
  end;

  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', DBEdit5.Text);
    QCadastro.Open;
  end;

  NewWord := GetOrCreateObject('Word.Application');
  NewWord.Visible := True;
  NewWord.Documents.Add;

  // Obtem documento e paragrafo
  Document := NewWord.Documents.Item(1);
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(1).Range;
  Range.Text := '---  FICHA DE CUSTOS  ---';
  //Range.Font := 'Arial';
  Range.Bold := 1;
  Range.Font.Size := 16;
  Document.Paragraphs.Item(1).Alignment := '1';

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(3).Range;
  Range.Text := 'EMPRESA : ' + DBedit5.Text + '-' + DMCadastro.QCadastroNome.Text;
  Range.Bold := 1;
  Document.Paragraphs.Item(3).Alignment := '0';

  Document.Paragraphs.add;
  Document.Paragraphs.add;
  Range := Document.Paragraphs.Item(5).Range;
  Range.text := 'PRODUTO : ' + DMPedido.QPedidoDESC_OBSERVACAO.Text;
  Range.Bold := 1;
  Document.Paragraphs.Item(5).Alignment := '0';

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(8).Range;
  Range.Text := 'Nº. PEDIDO: ' + DBEdit6.Text + '             DATA EMISSÃO: ' + DBEdit8.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range.Bold := 0;
  Range.Font.Size := 10;
  Range := Document.Paragraphs.Item(10).Range;
  table := Document.Tables.Add(Range, 1, 6); // novoDoc.Tables.Add(Selection.Range, 3, 5)

  table.cell(1, 1).Width := '15';
  table.cell(1, 2).Width := '0';
  table.cell(1, 3).Width := '0';
  table.cell(1, 4).Width := '0';
  table.cell(1, 5).Width := '0';
  table.cell(1, 6).Width := '0';

  table.Cell(1, 1).Range.Text := 'RELAÇÃO DOS MATERIAIS UTILIZADOS';
  table.Cell(1, 2).Range.Text := '';
  table.Cell(1, 3).Range.Text := '';
  table.Cell(1, 4).Range.Text := '';
  table.Cell(1, 5).Range.Text := '';
  table.Cell(1, 6).Range.Text := '';

  table.rows.add;
  table.Cell(2, 1).Width := '1.71';
  table.Cell(2, 2).Width := '8.31';
  table.Cell(2, 3).Width := '1.20';
  table.Cell(2, 4).Width := '1.39';
  table.Cell(2, 5).Width := '1.81';
  table.Cell(2, 6).Width := '1.99';

  table.Cell(2, 1).Range.Text := 'Código';
  table.Cell(2, 2).Range.Text := 'Material';
  table.Cell(2, 3).Range.Text := 'Unid.';
  table.Cell(2, 4).Range.Text := 'Quant.';
  table.Cell(2, 5).Range.Text := 'Unitário';
  table.Cell(2, 6).Range.Text := 'Total';

  table.Rows.Add;
  DMPedido.QPedidoItem.First;
  while not DMPedido.QPedidoItem.eof do
  begin
    with DMPedido do
    begin
      table.Cell(QPedidoItem.RecNo + 2, 1).Range.Text := Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value, 0, 10);
      table.Cell(QPedidoItem.RecNo + 2, 2).Range.Text := Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo + 2, 3).Range.Text := Trim(DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo + 2, 4).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 0, 6);
      table.Cell(QPedidoItem.RecNo + 2, 5).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);
      table.Cell(QPedidoItem.RecNo + 2, 6).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
      wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
      if QPedidoItemPERC_DESCONTO.Value > 0 then
        wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
      else
        wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
      wCont := wCont + 1;
      QPedidoItem.Next;
    end;
    table.Rows.Add;
  end;
  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo + (wCont + 1), 2).Range.Text :=
    'TOTAL DOS MATERIAIS .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo + (wCont + 1), 6).Range.Text :=
    Bib.NumToTexto(wTotalProdutos, 2, 10);

  Table.Rows.Add;
  wCont := wCont + 5;
  table.cell(wCont, 1).Width := '15';
  table.cell(wCont, 2).Width := '0';
  table.cell(wCont, 3).Width := '0';
  table.cell(wCont, 4).Width := '0';
  table.cell(wCont, 5).Width := '0';
  table.cell(wCont, 6).Width := '0';

  table.Cell(wCont, 1).Range.Text := 'HORAS TRABALHADAS POR FUNCIONÁRIO';
  table.Cell(wCont, 2).Range.Text := '';
  table.Cell(wCont, 3).Range.Text := '';
  table.Cell(wCont, 4).Range.Text := '';
  table.Cell(wCont, 5).Range.Text := '';
  table.Cell(wCont, 6).Range.Text := '';

  wCont := wCont + 1;
  Table.Rows.Add;
  table.Cell(wCont, 1).Width := '1.71';
  table.Cell(wCont, 2).Width := '8.31';
  table.Cell(wCont, 3).Width := '1.20';
  table.Cell(wCont, 4).Width := '1.39';
  table.Cell(wCont, 5).Width := '1.81';
  table.Cell(wCont, 6).Width := '1.99';

  table.Cell(wCont, 1).Range.Text := 'Código';
  table.Cell(wCont, 2).Range.Text := 'Funcionário';
  table.Cell(wCont, 3).Range.Text := 'Unid.';
  table.Cell(wCont, 4).Range.Text := 'Quant.';
  table.Cell(wCont, 5).Range.Text := 'Unitário';
  table.Cell(wCont, 6).Range.Text := 'Total';

  table.Rows.Add;
  DMPedido.QCustoFuncionario.Close;
  DMPedido.QCustoFuncionario.SetVariable('COD_PEDIDO_CAB', DMPedido.QPedidoCOD_PEDIDO_CAB.Value);
  DMPedido.QCustoFuncionario.Open;
  DMPedido.QCustoFuncionario.First;
  while not DMPedido.QCustoFuncionario.eof do
  begin
    with DMPedido do
    begin
      table.Cell(QCustoFuncionario.RecNo + wCont, 1).Range.Text := Bib.NumToTexto(QCustoFuncionarioCOD_Funcionario.Value, 0, 10);
      table.Cell(QCustoFuncionario.RecNo + wCont, 2).Range.Text := Trim(DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO', 'COD_FUNCIONARIO = ' + FloatToStr(QCustoFuncionarioCod_Funcionario.Value)));
      table.Cell(QCustoFuncionario.RecNo + wCont, 3).Range.Text := 'h';
      table.Cell(QCustoFuncionario.RecNo + wCont, 4).Range.Text := Bib.NumToTexto(QCustoFuncionarioNUM_HORAS.Value, 0, 6);
      table.Cell(QCustoFuncionario.RecNo + wCont, 5).Range.Text := Bib.NumToTexto(QCustoFuncionarioVAL_HORA.Value, 2, 8);
      table.Cell(QCustoFuncionario.RecNo + wCont, 6).Range.Text := Bib.NumToTexto((QCustoFuncionarioNUM_HORAS.Value * QCustoFuncionarioVAL_HORA.Value), 2, 10);
      wTotalHoras := wTotalHoras + (QCustoFuncionarioNUM_HORAS.Value * QCustoFuncionarioVAL_HORA.Value);
      wNumHoras := wNumHoras + QCustoFuncionarioNUM_HORAS.Value;
      wCont := wCont + 1;
      QCustoFuncionario.Next;
    end;
    table.Rows.Add;
  end;

  table.Rows.Add;
  table.Cell(DMPedido.QCustoFuncionario.RecNo + wCont, 2).Range.Text :=
    'TOTAL DAS HORAS TRABALHADAS .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo + wCont, 4).Range.Text :=
    Bib.NumToTexto(wNumHoras, 0, 10);
  table.Cell(DMPedido.QPedidoItem.RecNo + wCont, 6).Range.Text :=
    Bib.NumToTexto(wTotalHoras, 2, 10);

  Table.Rows.Add;
  wCont := wCont + 5;
  table.cell(wCont, 1).Width := '15';
  table.cell(wCont, 2).Width := '0';
  table.cell(wCont, 3).Width := '0';
  table.cell(wCont, 4).Width := '0';
  table.cell(wCont, 5).Width := '0';
  table.cell(wCont, 6).Width := '0';

  table.Cell(wCont, 1).Range.Text := 'IMPOSTOS/COMISSÃO/LUCRATIVIDADE';
  table.Cell(wCont, 2).Range.Text := '';
  table.Cell(wCont, 3).Range.Text := '';
  table.Cell(wCont, 4).Range.Text := '';
  table.Cell(wCont, 5).Range.Text := '';
  table.Cell(wCont, 6).Range.Text := '';

  wCont := wCont + 1;
  Table.Rows.Add;
  table.Cell(wCont, 1).Width := '9.92';
  table.Cell(wCont, 2).Width := '0.80';
  table.Cell(wCont, 3).Width := '0.80';
  table.Cell(wCont, 4).Width := '1.10';
  table.Cell(wCont, 5).Width := '1.81';
  table.Cell(wCont, 6).Width := '1.99';

  table.Cell(wCont, 1).Range.Text := 'Descrição';
  table.Cell(wCont, 2).Range.Text := '';
  table.Cell(wCont, 3).Range.Text := '';
  table.Cell(wCont, 4).Range.Text := '   %';
  table.Cell(wCont, 5).Range.Text := 'base';
  table.Cell(wCont, 6).Range.Text := 'Valor';
  table.Rows.Add;

  Table.Cell(wCont, 1).Range.Text := 'ISSQN';
  Table.Cell(wCont, 2).Range.Text := '';
  Table.Cell(wCont, 3).Range.Text := '';
  Table.Cell(wCont, 4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_ISSQN.Value, 2, 5);
  Table.Cell(wCont, 5).Range.Text := Bib.NumToTexto(wTotalHoras, 2, 10);
  Table.Cell(wCont, 6).Range.Text := Bib.NumToTexto(((DMPedido.QPedidoPERC_ISSQN.Value * wTotalHoras) / 100), 2, 10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont, 1).Range.Text := 'IMPOSTO ÚNICO';
  Table.Cell(wCont, 2).Range.Text := '';
  Table.Cell(wCont, 3).Range.Text := '';
  Table.Cell(wCont, 4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_IMPOSTO.Value, 2, 5);
  Table.Cell(wCont, 5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value, 2, 10);
  Table.Cell(wCont, 6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoVAL_IMPOSTO.Value * DMPedido.QPedidoVAL_TOTAL.Value / 100), 2, 10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont, 1).Range.Text := 'COMISSÃO';
  Table.Cell(wCont, 2).Range.Text := '';
  Table.Cell(wCont, 3).Range.Text := '';
  Table.Cell(wCont, 4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_COMISSAO.Value, 2, 5);
  Table.Cell(wCont, 5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value, 2, 10);
  Table.Cell(wCont, 6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoPERC_COMISSAO.Value * DMPedido.QPedidoVAL_TOTAL.Value / 100), 2, 10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont, 1).Range.Text := 'LUCRATIVIDADE';
  Table.Cell(wCont, 2).Range.Text := '';
  Table.Cell(wCont, 3).Range.Text := '';
  Table.Cell(wCont, 4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_LUCRO.Value, 2, 5);
  Table.Cell(wCont, 5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value, 2, 10);
  Table.Cell(wCont, 6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoPERC_LUCRO.Value * DMPedido.QPedidoVAL_TOTAL.Value / 100), 2, 10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont, 1).Range.Text := 'PREÇO DE VENDA';
  Table.Cell(wCont, 2).Range.Text := '';
  Table.Cell(wCont, 3).Range.Text := '';
  Table.Cell(wCont, 4).Range.Text := '';
  Table.Cell(wCont, 5).Range.Text := '';
  Table.Cell(wCont, 6).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value, 2, 10);

  DMFilial.QFilial.Close;
  DMCadastro.QCadastro.Close;

end;

procedure TFPedidoCad.DBEdit63Exit(Sender: TObject);
var
  wTotalFuncionario, wComissao, wTotalPedido, wTotalISSQN, wTotalImposto, wLucro: real;
begin
  inherited;
  if ((DMPedido.QPedido.State = dsEdit) or (DMPedido.QPedido.State = dsInsert)) then
  begin
    DMPedido.QPedido.Post;
    DMPedido.QPedido.Edit;
  end;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text = '' then
    raise Exception.Create('Selecione um Pedido!')
  else
  begin
    DMPedido.QCustoFuncionario.Close;
    DMPedido.QCustoFuncionario.SetVariable('COD_PEDIDO_CAB', DMPedido.QPedidoCOD_PEDIDO_CAB.Value);
    DMPedido.QCustoFuncionario.Open;
    DMPedido.QCustoFuncionario.First;
    while not DMPedido.QCustoFuncionario.eof do
    begin
      wTotalFuncionario := wTotalFuncionario + (DMPedido.QCustoFuncionarioNUM_HORAS.Value * DMPedido.QCustoFuncionarioVAL_HORA.Value);
      DMPedido.QCustoFuncionario.Next;
    end;
  end;
  if Trim(DBEdit63.Text) <> '' then
  begin
    wTotalPedido := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value;
    wTotalISSQN := (wTotalFuncionario * DMPedido.QPedidoPERC_ISSQN.Value / 100);
    wTotalImposto := (DMPedido.QPedidoVAL_TOTAL.Value * DMPedido.QPedidoVAL_IMPOSTO.Value / 100);
    wComissao := (DMPedido.QPedidoVAL_TOTAL.Value * DMPedido.QPedidoPERC_COMISSAO.Value / 100);
    wLucro := (DMPedido.QPedidoVAL_TOTAL.Value - wTotalPedido - wTotalFuncionario - wTotalISSQN - wTotalImposto - wComissao);

    MaskEdit1.Text := Bib.NumToTexto(wTotalPedido, 2, 10);
    MaskEdit2.Text := Bib.NumToTexto(wTotalFuncionario, 2, 10);
    MaskEdit3.Text := Bib.NumToTexto(wTotalISSQN, 2, 10);
    Maskedit4.Text := Bib.NumToTexto(wTotalImposto, 2, 10);
    MaskEdit5.Text := Bib.NumToTexto(wComissao, 2, 10);
    MaskEdit6.Text := Bib.NumToTexto(wLucro, 2, 10);
    DBEdit61.Text := Bib.NumToTexto((wLucro * 100 / DMPedido.QPedidoVAL_TOTAL.Value), 2, 10);

  end;
end;

procedure TFPedidoCad.DBEdit24Exit(Sender: TObject);
var
  wValInformado, wValVarejo: Real;
  wExiste: String;
  wParcelas : Integer;
  wValor: Extended;
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and (DBRGTipoPagamento.ItemIndex <> 3) then
  begin
    if DBEdit24.Text <> '' then
    begin
      wValVarejo := strToFloat('0' + DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text));
      wValInformado := strToFloat(Trim(DBEdit24.Text));
      if wValInformado < wValVarejo then
      begin
        if FSenha = nil then
          FSenha := TFSenha.Create(Application);
        if FSenha.ShowModal = MrOk then
        begin
          if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
          begin
            DMPedido.QPedidoItemVAL_UNITARIO.Value := wValVarejo;
            raise Exception.Create('Você não tem permissao pra alterar o preço');
          end;
        end;
      end;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'RADIO') then
  begin
    wParcelas := 0;
    If DMPedido.QPedidoCod_Prazo_Vencimento.Text <> '' Then
       wParcelas := StrToInt(DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' +
              DMPedido.QPedidoCod_Prazo_Vencimento.Text, false));
    If (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') And (wParcelas > 12) Then
       wExiste := DMOracle.FastSelect('VAL_ATACADO', 'TB_PRODUTO',
                  'COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text)
    else
      wExiste := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO',
                 'COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text);
    wValor := StrToFloat('0' + wExiste);
    if DMPedido.QPedidoItemVAL_UNITARIO.Value < wValor then
     Begin
       if DMPedido.QPedidoItem.State = DsBrowse Then
          DMPedido.QPedidoItem.Edit;
       DMPedido.QPedidoItemVAL_UNITARIO.Value := wValor;
       DbEdit24.SetFocus;
       Raise Exception.Create('Valor inferior ao permitido. Valor mínimo: ' + FormatFloat('#,##0.00', wValor) + '.');
     End;
  end;
  wExiste:='';
end;

procedure TFPedidoCad.BitBtn3Click(Sender: TObject);
var
  wNumDoc, wContaCred, wContaDeb: string;
  wCodDoc, wCodHistorico, wVlrLancto, wCodCompl: Real;
  wDtLancto: TDateTime;
  wFilial: Integer;
begin
  inherited;
  if Trim(FMHistorico.MeHistorico.Text) = '' then
    raise Exception.Create('Preencher Histórico');
  if Trim(MeValor.Text) = '' then
    raise Exception.Create('Preecher Valor');
  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('Pk', StrToInt(Trim(FMHistorico.MeHistorico.Text)));
  DMHistorico.QHistorico.Open;
  if DMHistorico.QHistorico.Eof then
    raise Exception.Create('Historico Não Cadastrado');
  DMPedido.Proc_GeraCaixa(StrToInt(Trim(FMHistorico.MeHistorico.Text)), StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.')),
                           'Adiantamento pedido nr. ' + DMPedido.QPedidoNum_Pedido.Text);
  if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
  begin
    wCodDoc := DMPedido.QCaixaCod_Caixa_Mov.Value; // RETIRADO A PEDIDO DA ANDREIA - 07/08/2009 (CESAR)
    wNumDoc := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCod_Cadastro.Text); // Trim(DMPedido.QCaixaDesc_Complemento.Value)+'-'+
    wFilial := DMPedido.QCaixaCod_Filial.Value;
    wContaCred := DMHistorico.QHistoricoCod_Contabil_Cred.Value;
    wContaDeb := DMHistorico.QHistoricoCod_Contabil_Deb.Value;
    wCodCompl := DMPedido.QCaixaCod_Cadastro.Value;
    wCodHistorico := DMHistorico.QHistoricoCod_Historico_Contabil.Value;
    if wCodHistorico <> 0 then
    begin
      wVlrLancto := DMPedido.QCaixaVal_Movimento.Value;
      wDtLancto := DMPedido.QCaixaDt_Movimento.Value;
      DMPlanilha.GravaLanc('CX', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDtLancto, wContaDeb);
      DMPlanilha.GravaLanc('CX', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDtLancto, wContaCred);
    end;
  end;
  DMPedido.QPedido.Edit;
  DMPedido.QPedidoVal_Adiantamento.Value := DMPedido.QPedidoVal_Adiantamento.Value + StrToFloat(Bib.LimpaString(Trim(MeValor.Text), '.'));
  DMPedido.QPedido.Post;
  wVlrLancto := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value - DMPedido.QPedidoVal_Adiantamento.Value;
  if wVlrLancto > 0 then
    MeSaldo.Text := FloatToStr(wVlrLancto)
  else
    MeSaldo.Text := '0,00';
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
  ShowMessage('Movimentos Gerados com Sucesso!');
  DMHistorico.QHistorico.Close;
  DMPedido.QCaixa.Close;
end;

procedure TFPedidoCad.BitBtn4Click(Sender: TObject);
var
  wNumero: Integer;
begin
  inherited;
  if FRReciboCaixa = nil then
    FRReciboCaixa := TFRReciboCaixa.Create(Application);
  FRReciboCaixa.QRBand2.Enabled := DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL';
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMPedido.QPedidoCod_Filial.Value);
  DMFilial.QFilial.Open;
  FRReciboCaixa.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.value;
  FRReciboCaixa.QRLRecibo.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
  wNumero := DMSequencia.Sequencia(DMPedido.QPedidoCod_Filial.Value, 'RECIBO');
  FRReciboCaixa.QRLNumero.Caption := FloatToStr(wNumero);
  FRReciboCaixa.QRLNumDocumento.Caption := DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLComplemento.Caption := 'Adiantamento Referente Pedido Nr. ' + DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLValorExtenso.Caption := Bib.extenso(DMPedido.QCaixaPedidoVAL_MOVIMENTO.Value, 'REAL');
  FRReciboCaixa.QRLValor.Caption := FormatFloat('#,##0.00', DMPedido.QCaixaPedidoVAL_MOVIMENTO.Value);
  FRReciboCaixa.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', DMPedido.QCaixaPedidoDt_Movimento.Value);

  FRReciboCaixa.QRLResponsavel1.Caption := DMFilial.QFilialDesc_Filial.value;
  FRReciboCaixa.QRLRecibo1.Caption := FRReciboCaixa.QRLRecibo.Caption;
  FRReciboCaixa.QRLNumero1.Caption := FloatToStr(wNumero);
  FRReciboCaixa.QRLNumDocumento1.Caption := DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLComplemento1.Caption := 'Adiantamento Referente Pedido Nr. ' + DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLValorExtenso1.Caption := Bib.extenso(DMPedido.QCaixaPedidoVAL_MOVIMENTO.Value, 'REAL');
  FRReciboCaixa.QRLValor1.Caption := FormatFloat('#,##0.00', DMPedido.QCaixaPedidoVAL_MOVIMENTO.Value);
  FRReciboCaixa.QRLData1.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', DMPedido.QCaixaPedidoDt_Movimento.Value);
  FRReciboCaixa.QuickRep1.Preview;
  DMFilial.QFilial.Close;
end;

procedure TFPedidoCad.PCPedidoChange(Sender: TObject);
begin
  inherited;
  if PCPedido.ActivePage = TsAdiantamentos then
  begin
    MeValor.Text := FloatToStr(DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value);
    MeSaldo.Text := FloatToStr(DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value - DMPedido.QPedidoVal_Adiantamento.Value);
  end;
  if (PCPedido.ActivePage = TsItem) And (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO') Then
   Begin
     If (DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text = '') And  (DBRGTipoPagamento.ItemIndex = 1) Then
      Begin
        PCPedido.ActivePage := TSPedido;
        DBEPrazo.SetFocus;
        Raise Exception.Create('Informar prazo de vencimento');
      End;
      // para Radiolandia quando muda o tipo de pagamento deverá mudar o preço de venda, se já informado itens no pedido -- César 28/12/2021
     if ((DMPedido.QPedido.State = DsInsert) Or (DMPedido.QPedido.State = DsEdit)) And
         (wAlterou = 'SIM') then
        Preco_Radiolandia;
   End;
   wAlterou := 'NAO'; // Este atributo atualiza na alteracao de prazo de vencimento ou condicao de pagto - César 
  if (PCPedido.ActivePage = TSItem) then
  begin
    if (DMParamSistema.CodEmpresa = 'FURGOESMED') Or (DMParamSistema.CodEmpresa = 'FURGMED') or
       (DMParamSistema.CodEmpresa = 'RADIO') then
      EdNumFabricante.SetFocus
    else if ((DMParamSistema.CodEmpresa = 'RETIFOZ') or
             (DMParamSistema.CodEmpresa = 'RETIFOZ2')) and
             (DMPedido.QPedido.State in [DSEdit, DSInsert]) then
      EdNumFabricante.SetFocus
    else if ((DMParamSistema.CodEmpresa = 'RETIFOZ') or
             (DMParamSistema.CodEmpresa = 'RETIFOZ2')) and
             (DMPedido.QPedido.State in [DSBrowse]) then
      DBEdit23.SetFocus
    {else
      DBECodProduto.SetFocus;  }
  end;
end;

procedure TFPedidoCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if DMPedido.QCaixaPedidoCod_Pedido_Cab.Text = '' then
    raise Exception.Create('Selecionar um Pedido para voltar adiantamento');
  if DMPedido.QCaixaPedidoCod_Caixa_Mov.Text = '' then
    raise Exception.Create('Pedido Sem Adiantamentos');
  if DMOracle.DBCemapa.InTransaction = False then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMPedido.QCaixa.Close;
    DMPedido.QCaixa.SetVariable('Pk', DMPedido.QCaixaPedidoCod_Caixa_Mov.Value);
    DMPedido.QCaixa.Open;
    // Vai descontabilizar
    DMPlanilha.Descontabiliza(DMPedido.QCaixaPedidoCod_Caixa_Mov.Value, 'CX');
    // Vai atualizar o valor do adiantamento
    DMPedido.QPedido.Edit;
    DMPedido.QPedidoVal_Adiantamento.Value := DMPedido.QPedidoVal_Adiantamento.Value - DMPedido.QCaixaPedidoVal_Movimento.Value;
    DMPedido.QPedido.Post;
    // Exclui o lancamento do caixa
    DMPedido.QCaixa.Delete;
    DMOracle.DBCemapa.Commit;
    DMPedido.QCaixa.Close;
    DMPedido.QCaixaPedido.Close;
    DMPedido.QCaixaPedido.Open;
    ShowMessage('Movimento Excluido com Sucesso!');
  except
    DMPedido.QCaixa.Cancel;
    DMOracle.DBCemapa.RollBack;
    DMPedido.QCaixa.Close;
  end;

end;

procedure TFPedidoCad.BtConsMotivoClick(Sender: TObject);
begin
  inherited;
  if FMotivoCons = nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  if FMotivoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Motivo.Value := DMMotivo.QMotivoConsCod_Motivo.Value;
end;

procedure TFPedidoCad.BtConsMarcaClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = mrOk then
    DMPedido.QPedidoItemCOD_MARCA.Value := DMMarca.QMarcaConsCOD_MARCA.Value;
end;

procedure TFPedidoCad.ApagarAntigos(Sender: TObject);
begin
  try
    with DMPedido do
    begin
      QPedidosAntigos.Close;
      QPedidosAntigos.SetVariable('DT_EMISSAO_INI', FPedidoParam.Me16DtInicial.Text);
      QPedidosAntigos.SetVariable('DT_EMISSAO_FIN', FPedidoParam.Me16DtFinal.Text);
      QPedidosAntigos.Open;
      QPedidosAntigos.First;

      while not QPedidosAntigos.Eof do
      begin
        thread.atualizaProgresso(QPedidosAntigos.RecNo, QPedidosAntigos.RecordCount);
        QEstoqueEmbarcadoAntigo.Close;
        QEstoqueEmbarcadoAntigo.SetVariable('COD_PEDIDO_CAB', QPedidosAntigosCOD_PEDIDO_CAB.Value);
        QEstoqueEmbarcadoAntigo.Open;
        QEstoqueEmbarcadoAntigo.First;
        while not QEstoqueEmbarcadoAntigo.Eof do
        begin
          DMOracle.ExecutaSql('DELETE FROM TB_PESAGEM_PRODUCAO WHERE COD_PESAGEM = ' + QEstoqueEmbarcadoAntigoNUM_CONTROLE.Text, False);
          QEstoqueEmbarcadoAntigo.Next;
        end;

        DMOracle.ExecutaSql('DELETE FROM TB_ESTOQUE_EMBARCADO WHERE COD_PEDIDO_CAB = ' + QPedidosAntigosCOD_PEDIDO_CAB.Text, False);
        DMOracle.ExecutaSql('DELETE FROM TB_EMBARQUE_ITEM WHERE COD_PEDIDO_CAB = ' + QPedidosAntigosCOD_PEDIDO_CAB.Text, False);

        QPedidoItensAntigos.Close;
        QPedidoItensAntigos.SetVariable('COD_PEDIDO_CAB', QPedidosAntigosCOD_PEDIDO_CAB.Value);
        QPedidoItensAntigos.Open;
        QPedidoItensAntigos.First;
        while not QPedidoItensAntigos.Eof do
        begin
          DMOracle.ExecutaSql('DELETE FROM TB_PEDIDO_CANCELADO WHERE COD_PEDIDO_ITEM = ' + QPedidoItensAntigosCOD_PEDIDO_ITEM.Text, False);
          DMOracle.ExecutaSql('DELETE FROM TB_BAIXA_PEDIDO WHERE COD_PEDIDO_ITEM = ' + QPedidoItensAntigosCOD_PEDIDO_ITEM.Text, False);

          QPedidoItensAntigos.Next;
        end;

        DMOracle.ExecutaSql('DELETE FROM TB_PEDIDO_ITEM WHERE COD_PEDIDO_CAB = ' + QPedidosAntigosCOD_PEDIDO_CAB.Text, False);
        DMOracle.ExecutaSql('DELETE FROM TB_PEDIDO_CAB WHERE COD_PEDIDO_CAB = ' + QPedidosAntigosCOD_PEDIDO_CAB.Text, False);

        QPedidosAntigos.Next;
      end;
    end;

    DMOracle.DBCemapa.Commit;
  except
    on e: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      thread.avisaErro('Erro inesperado durante a deleção dos pedidos.' + #13 + #10 + e.Message);
    end;
  end;
end;

procedure TFPedidoCad.ApagarPedidosAntigos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[16].TabVisible := True;
  if FPedidoParam.ShowModal <> mrOk then
    Exit;

  thread := TThreadLocal.Create;
  thread.thread.OnRun := ApagarAntigos; //Aqui está o código-fonte (ApagarAntigos)
  thread.tela.mensagemNormal := 'Pedidos excluídos com sucesso.';
  thread.tela.mostraMensagens := True;

  thread.Resume;
end;

procedure TFPedidoCad.SBIncluiEmbarqueClick(Sender: TObject);
var wCodEmbarque, wNumSequencia: Integer;
begin
//  if (DMPedido.QPedidoIND_SITUACAO.Value <> '2') then
//    raise Exception.Create('Pedido ainda não confirmado.');

  try
    if (DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text) <> '0') then
      raise Exception.Create('Pedido já está em algum embarque.');

    if (Trim(MESeqEmbarque.Text) = '') then
      raise Exception.Create('A sequência é de preenchimento obrigatório.');
    wNumSequencia := StrToInt(Trim(MESeqEmbarque.Text));

    if (Trim(MENumEmbarque.Text) = '') then
    begin
      DMOracle.ExecutaSql('INSERT INTO TB_EMBARQUE(COD_EMBARQUE, DT_EMBARQUE) VALUES(SQEMBARQUE.NEXTVAL, CURRENT_DATE)', False);
      wCodEmbarque := StrToInt(DMOracle.BuscaNome('SELECT SQEMBARQUE.CURRVAL FROM DUAL', '1=1'));
      MENumEmbarque.Text := IntToStr(wCodEmbarque);
    end
    else
    begin
      if (DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_EMBARQUE', 'COD_EMBARQUE = ' + Trim(MENumEmbarque.Text)) = '0') then
        raise Exception.Create('Embarque inexistente.');
      if (DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_EMBARQUE_ITEM', 'COD_EMBARQUE = ' + Trim(MENumEmbarque.Text) + ' AND NUM_SEQUENCIAL = ' + Trim(MESeqEmbarque.Text)) <> '0') then
        raise Exception.Create('Sequência já cadastrada para este embarque.');
      wCodEmbarque := StrToInt(Trim(MENumEmbarque.Text));
    end;

    DMOracle.ExecutaSql('INSERT INTO TB_EMBARQUE_ITEM(COD_EMBARQUE, COD_PEDIDO_CAB, NUM_SEQUENCIAL) VALUES(' + IntToStr(wCodEmbarque) + ', ' + IntToStr(DMPedido.QPedidoCOD_PEDIDO_CAB.Value) + ', ' + IntToStr(wNumSequencia) + ')', False);

    DMOracle.DBCemapa.Commit;

    MESeqEmbarque.Text := IntToStr(StrToInt(Trim(MESeqEmbarque.Text)) + 1);
  except
    on e: exception do
    begin
      DMOracle.DBCemapa.Rollback;
      MessageDlg(e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFPedidoCad.SBEmbarqueConsClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
    MENumEmbarque.Text := DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text;
end;

procedure TFPedidoCad.PreodeVendaXPreoVendido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[15].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPrecoVendido.Close;
      QRPrecoVendido.SetVariable('DT_EMISSAO_INI', FPedidoParam.Me15DtInicial.Text);
      QRPrecoVendido.SetVariable('DT_EMISSAO_FIN', FPedidoParam.Me15DtFinal.Text);
      if Trim(FPedidoParam.Fm15Vendedor.MeVendedor.Text) <> '' then
        QRPrecoVendido.SetVariable('COD_VENDEDOR', StrToInt(Trim(FPedidoParam.Fm15Vendedor.MeVendedor.Text)))
      else
        QRPrecoVendido.SetVariable('COD_VENDEDOR', Null);
      if Trim(FPedidoParam.Fm15Produto.MeProduto.Text) <> '' then
        QRPrecoVendido.SetVariable('COD_PRODUTO', StrToInt(Trim(FPedidoParam.Fm15Produto.MeProduto.Text)))
      else
        QRPrecoVendido.SetVariable('COD_PRODUTO', Null);
      QRPrecoVendido.Open;

      if FRPrecoVendidoPedido = nil then
        FRPrecoVendidoPedido := TFRPrecoVendidoPedido.Create(Application);
      FRPrecoVendidoPedido.QRLCadastro.Enabled := FPedidoParam.CB15Nome.Checked;
      FRPrecoVendidoPedido.QRDBTCadastro.Enabled := FPedidoParam.CB15Nome.Checked;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPrecoVendidoPedido.QRPrimario.Preview
      else
        FRPrecoVendidoPedido.QRPrimario.Print;

      QRPrecoVendido.Close;
    end;
end;

procedure TFPedidoCad.CotasporVendedor1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[17].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRCotaVendedor.Close;
      QRCotaVendedor.SetVariable('DT_EMISSAO_INI', Bib.diaSemanaAnterior(StrToDate(FPedidoParam.Me17Data.Text), 2));
      QRCotaVendedor.SetVariable('DT_EMISSAO_FIN', Bib.diaSemanaProximo(StrToDate(FPedidoParam.Me17Data.Text), 1));
      if Trim(FPedidoParam.Fm17Vendedor.MeVendedor.Text) <> '' then
        QRCotaVendedor.SetVariable('COD_VENDEDOR', StrToInt(Trim(FPedidoParam.Fm17Vendedor.MeVendedor.Text)))
      else
        QRCotaVendedor.SetVariable('COD_VENDEDOR', Null);
      if Trim(FPedidoParam.Fm17Produto.MeProduto.Text) <> '' then
        QRCotaVendedor.SetVariable('COD_PRODUTO', StrToInt(Trim(FPedidoParam.Fm17Produto.MeProduto.Text)))
      else
        QRCotaVendedor.SetVariable('COD_PRODUTO', Null);
      QRCotaVendedor.Open;

      if FRCotaVendedorPedido = nil then
        FRCotaVendedorPedido := TFRCotaVendedorPedido.Create(Application);

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRCotaVendedorPedido.QRPrimario.Preview
      else
        FRCotaVendedorPedido.QRPrimario.Print;

      QRCotaVendedor.Close;
    end;
end;

procedure TFPedidoCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  // esta rotina foi colocada para um vedendor nao acessar pedidos de outro vendedor
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
    If DMPedido.QPedidoCOD_VENDEDOR.Value <> DMUsuario.CodVendedorPadrao Then
       DMPedido.QPedido.Close;

//para quando houver placa no pedido trazer a mesma na tela.
//Alex - 22/07/2021
  if Trim(MePlaca.Text) <> '' then
  begin
    with DMPedido do
    begin
      if (QPedidoCOD_VEICULO.Value > 0) then
      begin
        MEPlaca.Text := DMOracle.FastSelect('NUM_PLACA','TB_VEICULO','COD_VEICULO = ' + QPedidoCOD_VEICULO.Text);
        MEPlacaExit(Sender);
      end
      else
      begin
        MEPlaca.Clear;
        EdModelo.Clear;
      end;
    end;
  end;
end;

procedure TFPedidoCad.BtTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Cadastro_Transportadora.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFPedidoCad.OramentoviaExcel1Click(Sender: TObject);
var
  Excel, Sheet: Variant;
  Linha, wOk : Integer;
  wCaminho: String;
begin
  with DMPedido do
  begin
    QOrcamentoExcel.Close;
    QOrcamentoExcel.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
    QOrcamentoExcel.Open;
    QOrcamentoExcel.First;

    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := True;
   {Excel.Workbooks.Add;}
    Excel.WorkBooks.Open(ExtractFilePath(Application.ExeName) + 'Orcamento.xls');
    Sheet := Excel.WorkBooks[1].Sheets[1];
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MARTICAR' then
    begin
      if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      begin
        Sheet.Cells[3, 5] := QOrcamentoExcelDESC_ENDERECO_FILIAL.Value + ', ' + QOrcamentoExcelNUM_ENDERECO_FILIAL.Text + ' - ' + QOrcamentoExcelDESC_CIDADE_FILIAL.Value + ' - ' + QOrcamentoExcelCOD_ESTADO_FILIAL.Value;
        Sheet.Cells[4, 5] := 'FONE: ' + QOrcamentoExcelDESC_TELEFONE_FILIAL.Value + '  FAX: ' + QOrcamentoExcelDESC_FAX_FILIAL.Value;
      end
      else
      begin
        Sheet.Cells[3, 4] := QOrcamentoExcelDESC_ENDERECO_FILIAL.Value + ', ' + QOrcamentoExcelNUM_ENDERECO_FILIAL.Text + ' - ' + QOrcamentoExcelDESC_CIDADE_FILIAL.Value + ' - ' + QOrcamentoExcelCOD_ESTADO_FILIAL.Value;
        Sheet.Cells[4, 4] := 'FONE: ' + QOrcamentoExcelDESC_TELEFONE_FILIAL.Value + '  FAX: ' + QOrcamentoExcelDESC_FAX_FILIAL.Value;
      end;
    end; //Pedido da Magali para ficar igual o excel base. Junior - 15/12/2014.
    Sheet.Cells[8, 1] := 'ORÇAMENTO: n° ' + QOrcamentoExcelCOD_PEDIDO_CAB.Text;

//    Sheet.Cells[9, 2] := FormatDateTime('dd/mm/yyyy', QOrcamentoExcelDT_EMISSAO.Value);
    Sheet.Cells[9, 2] := QOrcamentoExcelDT_EMISSAO.Text;
    if DMParamSistema.CodEmpresa = 'RETIFOZ' then
    begin
      Sheet.Cells[9, 6] := QOrcamentoExcelDESC_E_MAIL.Value;
      Sheet.Cells[10, 2] := QOrcamentoExcelNOME.Value;
      Sheet.Cells[10, 9] := QOrcamentoExcelNUM_CGC_CPF.Value;
      Sheet.Cells[11, 2] := QOrcamentoExcelDESC_TELEFONE.Value;
      Sheet.Cells[11, 6] := QOrcamentoExcelDESC_CELULAR.Value;
      Sheet.Cells[11, 9] := QOrcamentoExcelDESC_CIDADE.Value + '/' + QOrcamentoExcelCOD_ESTADO.Value;
      Sheet.Cells[12, 2] := QOrcamentoExcelDESC_VEICULO.Value;
      Sheet.Cells[12, 9] := QOrcamentoExcelDESC_CHASSI.Value;
    end
    else
    begin
      Sheet.Cells[10, 2] := QOrcamentoExcelNOME.Value;
      Sheet.Cells[10, 8] := QOrcamentoExcelDESC_E_MAIL.Value;
      Sheet.Cells[11, 2] := QOrcamentoExcelDESC_TELEFONE.Value;
      Sheet.Cells[11, 5] := QOrcamentoExcelDESC_CELULAR.Value;
      Sheet.Cells[11, 8] := QOrcamentoExcelDESC_CIDADE.Value + '/' + QOrcamentoExcelCOD_ESTADO.Value;
      Sheet.Cells[12, 2] := QOrcamentoExcelDESC_VEICULO.Value;
      Sheet.Cells[12, 8] := QOrcamentoExcelDESC_CHASSI.Value;
    end;
    Linha := 15;
    wOk := 0;
    while not QOrcamentoExcel.Eof do begin
      If (QOrcamentoExcelIND_CESTA_BASICA.Value = 'SIM') And
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
        Sheet.Cells[Linha, 1] := QOrcamentoExcelQT_PEDIDO.Value;
        Sheet.Cells[Linha, 2] := QOrcamentoExcelNUM_FABRICANTE.Value;
        Sheet.Cells[Linha, 3] := QOrcamentoExcelDESC_PRODUTO.Value;
        Sheet.Cells[Linha, 9] := QOrcamentoExcelVAL_UNITARIO.Value;
        Sheet.Cells[Linha, 10] := QOrcamentoExcelVAL_TOTAL.Value;
      end
      else
      begin
        Sheet.Cells[Linha, 1] := QOrcamentoExcelQT_PEDIDO.Value;
        Sheet.Cells[Linha, 2] := QOrcamentoExcelDESC_PRODUTO.Value;
        Sheet.Cells[Linha, 8] := QOrcamentoExcelVAL_UNITARIO.Value;
//      If QOrcamentoExcelDesc_Classe.Value <> 'OPCIONAL' Then               //A pedido da Miriam
        Sheet.Cells[Linha, 9] := QOrcamentoExcelVAL_TOTAL.Value;
      end;
      QOrcamentoExcel.Next;
      Inc(Linha);
    end;

    if ((QOrcamentoExcelVAL_DESCONTO.IsNull) or (QOrcamentoExcelVAL_DESCONTO.Value = 0)) then
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
      Sheet.Cells[59, 9] := QOrcamentoExcelVAL_DESCONTO.Value;
    end;
    Sheet.Cells[62, 1] := 'Pagamento a prazo:' + QOrcamentoExcelDESC_FORMA_PAGAMENTO.Value;
    {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
      Sheet.Cells[63, 1] := 'Obs: O revestimento de teto e laterais na van modelo MASTER, apartir de fev/2015, será todo em ABS. ' + QOrcamentoExcelDESC_OBSERVACAO.Value +
          QOrcamentoExcelDESC_COMPLEMENTO_OBS.Value +
          QOrcamentoExcelDESC_COMPLEMENTO_OBS2.Value//Pedido da Magali. Junior - 15/12/2014.
    else} //Pedido para Retirar essa mensagem. Solicitação Michelli. Junior - 26/01/2014.
    Sheet.Cells[63, 1] := 'Obs: ' + QOrcamentoExcelDESC_OBSERVACAO.Value +
          QOrcamentoExcelDESC_COMPLEMENTO_OBS.Value +
          QOrcamentoExcelDESC_COMPLEMENTO_OBS2.Value;
    if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
      Sheet.Cells[66, 1] := 'Tecido: ' + QOrcamentoExcelDESC_TECIDO.Value;
    if QOrcamentoExcelIND_TIPO_FRETE.Value = 'CIF' then
    begin
      Sheet.Cells[67, 1] := '';
      Sheet.Cells[67, 2] := '';
    end
    else
      Sheet.Cells[67, 2] := QOrcamentoExcelIND_TIPO_FRETE.Value;
    Sheet.Cells[68, 1] := QOrcamentoExcelNOME_VENDEDOR.Value;
    //wCaminho := ExtractFilePath(Application.ExeName) + 'img_' + DMPedido.QImagemPedidoCOD_IMAGEM_PEDIDO.AsString + '.jpg';
    wCaminho := bib.PegaTempDir + 'img_' + DMPedido.QImagemPedidoCOD_IMAGEM_PEDIDO.AsString + '.jpg';  
    if salvaImagemPedido(wCaminho) then
    // Sheet.Shapes.AddPicture(wCaminho, 0, 1, 450, 640, 106, 191); - Medidas antigas - Alterado por Djeison - 24/07/2013
      Sheet.Shapes.AddPicture(wCaminho, 0, 1, 470, 640, 90, 191);
    Excel.WorkBooks[1].SaveAs(ExtractFilePath(Application.ExeName) + 'Orcamento_' + QOrcamentoExcelCOD_PEDIDO_CAB.Text + '(' + formatdatetime('dd-mm-yyyy-hh-mm-ss', now) + ')' + '.xls');

    //    Sheet.PrintPreview;
  end;
end;

procedure TFPedidoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMPedido.wDuplica_Pedido := False;
  MEPercDesconto.Text := '';
  if PCPedido.ActivePage.Name <> 'TSPedido' then
    PCPedido.ActivePage := TSPedido;

//Solicitado por Marcos da Radiolandia para que os usuários não possam cancelar o inicio de um pedido novo, forçando que o mesmo seja salvo.
//cod_suporte: 3761 - Alex 14/10/2021
  if (DMUsuario.QUsuarioIND_PRIVILEGIO.Value = 'N') then
  begin
    if (DMParamSistema.CodEmpresa = 'RADIO') then
    begin
      SBCancelar.Enabled := False;
      SBCancelar.Visible := False;
      MMCadSimples.Items[0].Items[4].Enabled := False;
    end;
  end;
end;

procedure TFPedidoCad.OracleNavigator1BeforeAction(Sender: TObject;
  Button: TOracleNavigateBtn);
var sql: String;
begin
  inherited;
  if (Button = nbDelete) and (DSPrimario.State = DSEdit) then
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARTICAR' then
    begin
      with DMOracle, DMPedido do
      begin
        sql := 'INSERT INTO TB_PEDIDO_ITEM_LOG(' +
        'COD_PEDIDO_CAB,'+
        'COD_PEDIDO_ITEM,' +
        'COD_PRODUTO,' +
        'DESC_PRODUTO,' +
        'DESC_TRANSACAO,' +
        'DT_TRANSACAO,' +
        'DESC_CLIQUE_EXCLUSAO' +
        ') VALUES (' +
        QPedidoItemCOD_PEDIDO_CAB.Text + ', ' +
        QPedidoItemCOD_PEDIDO_ITEM.Text + ', ' +
        QPedidoItemCOD_PRODUTO.Text + ', ' +
        quotedStr('PRODUTO') + ', ' +
        quotedStr('EXCLUSAO POR CLIQUE') + ', ' +
        quotedStr(DateTimeToStr(DataServ)) + ', ' +
        quotedStr('O usuário ' + IntToStr(DMUsuario.CodUsuarioCorrente) +
          ' excluiu o item do pedido por clique') +
        ')';
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add(sql);
        QExecSQL.ExecSQL;
        //DBCemapa.Commit;
      end;
    end;
  end;
end;

procedure TFPedidoCad.btnIncluirImagemClick(Sender: TObject);
var
  MyJPEG: TJPEGImage;
  MyBMP: TBitmap;
  stream, outStream: TMemoryStream;
  ext: string;

  StretchBitmap: TBitmap;
  Ratio: double;
  ARect: TRect;

  Height, width: integer;

begin
  inherited;

  if not FileExists(MECaminhoImagem.Text) then
    raise Exception.Create('Arquivo não encontrado');

  ext := ExtractFileExt(LowerCase(MECaminhoImagem.Text));
  if (ext <> '.bmp') and (ext <> '.jpg') and (ext <> '.jpeg') then
    raise Exception.Create('Arquivo Inválido');

  stream := TMemoryStream.Create;
  OutStream := TMemoryStream.Create;
  MyJPEG := TJPEGImage.Create;
  MyBMP := TBitmap.Create;

  // Create bitmap
  StretchBitmap := TBitmap.Create;
  try
    //se a figura informada for um bitmap é feita a conversão para jpeg
    if ext = '.bmp' then
    begin
      MyBMP.LoadFromFile(MECaminhoImagem.Text);
      MyJPEG.Assign(MyBMP);
      MyJPEG.Compress;
    end
    else //se for jpg/jpeg
      MyJPEG.LoadFromFile(MECaminhoImagem.Text);

    //-------redimensiona a imagem para ficar com o tamanho apropriado-----------
    // Adjust parameters
    Ratio := 0;
//    Height := 240;
//    width := 200;
    //Agora faz-se necessária a imagem em tamanho original (Diego Stiehl - 13/07/2010)
    Height := MyJPEG.Height;
    width := MyJPEG.Width;

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
    MyJPEG.SaveToStream(OutStream);
    //---------fim redimensiona a imagem------------

    //------------grava a imagem no banco de dados-----------------
    DMPedido.QImagemPedido.close;
    DMPedido.QImagemPedido.open;

    DMPedido.QImagemPedido.Insert;

    DMPedido.QImagemPedidoCOD_PEDIDO_CAB.Value := DMPedido.QPedidoCOD_PEDIDO_CAB.AsInteger;
    DMPedido.QImagemPedidoIMG_IMAGEM.LoadFromStream(outStream);
    DMPedido.QImagemPedido.post;
    //----------fim grava imagem no banco de dados------------

    AtualizarImagemPedido;
  finally
    MyJPEG.Free;
    MyBMP.Free;
    StretchBitmap.Free;
  end;
end;

procedure TFPedidoCad.btnExcluirImagemClick(Sender: TObject);
begin
  inherited;
  if messageDlg('Deseja realmente excluir essa imagem?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMPedido.QImagemPedido.delete;

end;

procedure TFPedidoCad.btnProcurarClick(Sender: TObject);
begin
  inherited;
  if OPDImagem.Execute then
    MECaminhoImagem.Text := OPDImagem.FileName;
end;

procedure TFPedidoCad.AtualizarImagemPedido;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMPedido.QImagemPedido.CreateBlobStream(DMPedido.QImagemPedidoIMG_IMAGEM, bmRead);
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
      imgPedido.Picture.Assign(Jpg);
      imgPedido.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgPedido.Picture.Assign(nil);
    imgPedido.Visible := false;
  end;

  lblImagemNaoCadastrada.Visible := not imgPedido.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFPedidoCad.AtualizarImagemPedido2;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMPedido.QImagemPedido.CreateBlobStream(DMPedido.QImagemPedidoIMG_IMAGEM, bmRead);
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
      imgPedido2.Picture.Assign(Jpg);
      imgPedido2.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgPedido2.Picture.Assign(nil);
    imgPedido2.Visible := false;
  end;

  lblImagemNaoCadastrada2.Visible := not imgPedido2.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFPedidoCad.DSImagemPedidoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (DMPedido.QImagemPedido.RecordCount <= 0) then
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
end;

procedure TFPedidoCad.DBPanel1CodigoChange(Sender: TObject);
begin
  inherited;
  AtualizarImagemPedido;
  AtualizarImagemPedido2;
end;

function TFPedidoCad.salvaImagemPedido(caminho: String):Boolean;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;
  b := DMPedido.QImagemPedido.CreateBlobStream(DMPedido.QImagemPedidoIMG_IMAGEM, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      jpg.SaveToFile(caminho);
      Result := true;
    except
    end;
  end
  else
    result := false;

  jpg.Free;
  b.Destroy;
end;

procedure TFPedidoCad.pegaPrecoPrazoVendedor;
Var wEstado : String;
begin
  wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(DMPedido.QPedidoCod_Cadastro.Value),True);
  DMVendedor.QVendedor.Close;
  DMVendedor.QVendedor.SetVariable('PK', DMPedido.QPedidoCOD_VENDEDOR.Value);
  DMVendedor.QVendedor.Open;
  With DMPrecoPrazoVendedor do
  begin
    Try
      QPrecoPrazoVendedorCons.Close;
      QPrecoPrazoVendedorCons.SetVariable('PRODUTO', DMPedido.QPedidoItemCOD_PRODUTO.Value);
      QPrecoPrazoVendedorCons.SetVariable('ESTADO', wEstado);
      QPrecoPrazoVendedorCons.SetVariable('PRAZO_VENCIMENTO', DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Value);
      QPrecoPrazoVendedorCons.Open;
      if not QPrecoPrazoVendedorCons.IsEmpty then
        DMPedido.QPedidoItemVAL_UNITARIO.Value := QPrecoPrazoVendedorConsVAL_PRODUTO.Value;
    Except
      raise Exception.Create('Não foi encontrado preço cadastrado para esse prazo e vendedor');
    end;
  end;
end;

procedure TFPedidoCad.DBECodProdutoExit(Sender: TObject);
var
 bibVenda: TBibVenda;
 wCadastro, wAtacadoVarejo: string;
begin
  inherited;
  if trim(DBECodProduto.Text) <> '' then
  begin
    if (Trim(FPedidoCad.DBECodProduto.Text) <> '') AND (DMParamSistema.CodEmpresa = 'POLLYANA') then
      DMPedido.QPedidoItemQT_EMBALAGEM.Value := StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = ' +
                                                                                                 DMPedido.QPedidoItemCOD_PRODUTO.Text));
    // Personalizações
    FPedidoCad.DBEdit40.Clear;
    bibVenda := TBibVenda.Create;
    bibVenda.PersonalizaDados(DMPedido.QPedidoItem, DMPedido.QPedido, DMPedido.QPedidoCOD_FILIAL.Value);

    DBPanel2Exit(self);
{CodSuporte: 11741. Solicitado para que puxe o preço de venda conforme o cadastro do cliente. Alex 29/09/2025}
    if (DMParamSistema.CodEmpresa = 'PERTUTTI') then
    begin
      wAtacadoVarejo := DMOracle.FastSelect('IND_ATACADO_VAREJO','TB_CADASTRO','COD_CADASTRO = ' + dmpedido.QPedidoCOD_CADASTRO.Text);
      if (wAtacadoVarejo = 'A') then
        DMPedido.QPedidoItemVAL_UNITARIO.Value := DMProduto.QProdutoConsVAL_ATACADO.Value
      else
        DMPedido.QPedidoItemVAL_UNITARIO.Value := DMProduto.QProdutoConsVAL_VAREJO.Value;
    end;
  end;
//Para Bloquear os produtos listados pela PF para que não sejam vendidos para pessoa física. Solicitado por Junior - Deion
// Alex 01/02/2023
  if DMParamSistema.CodEmpresa = 'DEION' then
  begin
    wCadastro := DMOracle.FastSelect('IND_FISICA_JURIDICA','TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
    If ((DMPedido.QPedidoCOD_FILIAL.Value = 2) or (DMPedido.QPedidoCOD_FILIAL.Value = 3)) or
       ((DMPedido.QPedidoCOD_FILIAL.Value = 1) and (wCadastro = 'F')) then
    begin
        if trim(DBECodProduto.Text) <> '' then
          if DMOracle.FastSelect('COD_MARCA','TB_PRODUTO','COD_PRODUTO = '+DMPedido.QPedidoItemCOD_PRODUTO.Text) = '1' then //PRODUTOS PF
          Begin
            FPedidoCad.DBECodProduto.SetFocus;
            ShowMessage('Produto não permitido para venda!');
          end;
        end;
    end;
end;

procedure TFPedidoCad.DBEdit27Exit(Sender: TObject);
Var x, y: array of string;
  wUf : String;
  wPreco, wPerc : Real;
begin
  inherited;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI') And
     (DMPedido.QPedidoItemCOD_PRODUTO.Text         <> '')       Then
//     (DMPedido.QPedidoItemPERC_DESCONTO.Value       > 0)
   Begin
     If DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text = '' Then
        Raise Exception.Create('Informar prazo de vencimento');
     wUf := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text,True);
     setLength(x, 2); //2 sql diferentes
     setLength(y, 2);
     x[0] := 'SELECT VAL_PRODUTO FROM TB_PRECO_PRAZO_VENDEDOR WHERE COD_ESTADO = ' + QuoteDStr(wUf) + ' AND COD_PRODUTO=' + DMPedido.QPedidoItemCOD_PRODUTO.Text +
             ' AND COD_PRAZO_VENCIMENTO= ' + DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text;
     x[1] := 'SELECT PERC_DESCONTO_MAXIMO FROM TB_PRODUTO WHERE COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text;
     DMOracle.BuscaNomes(x, y);
     If DmUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value = 'VENDEDOR' Then   // vendedor não pode dar desconto maior que o permitido - César 25/06/2014
        If DMPedido.QPedidoItemPERC_DESCONTO.Value > StrToFloat(Y[1]) Then
        Begin
          DbEdit27.SetFocus;
          Raise exception.Create('Desconto maior que o permitido');
        End;
     If DMPedido.QPedidoItemPERC_DESCONTO.Value <> 0 Then
      Begin
        If (DMPedido.QPedidoItemPERC_DESCONTO.Value >= 0.6) And
           (DMPedido.QPedidoItemPERC_DESCONTO.Value <= 5)   Then
            DMPedido.QPedidoItemPERC_COMISSAO.Value := 7
        Else
           If (DMPedido.QPedidoItemPERC_DESCONTO.Value >= 5.1) Then
              DMPedido.QPedidoItemPERC_COMISSAO.Value := 5
           Else
              DMPedido.QPedidoItemPERC_COMISSAO.Value := 10;
      End;
   End;
end;

procedure TFPedidoCad.BtConsVendedorPreClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMPedido.QPedidoCOD_VENDEDOR_PREPOSTO.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFPedidoCad.PrForma1Click(Sender: TObject);
var
  table, table1, table2, table3, table4, table5, table6, Document, Range: Variant;
  table7, table8, table9, table10, table11, table12, table13, table14, table15, table16, table17 :Variant;
  wAux, wCont, wCont1, wQtPedido, wCodProdutoB : integer;
  wCidade, wProduto, wLote : string;
  wTotalProdutos : Real;
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[18].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  wCont := 0;
  wCont1 := 0;
  wQtPedido := 0;
  wAux := 0;
  with DMPedido do
  Begin
    if DMPedido.QPedidoCOD_PEDIDO_CAB.Text = '' then
      Raise Exception.Create('Selecione um Pedido!');

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',QPedidoCOD_FILIAL.Text);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',QPedidoCOD_CADASTRO.Text);
    DMCadastro.QCadastro.Open;
    if DMCadastro.QCadastroCOD_CIDADE.Text = '' then
      Raise Exception.create('O código da cidade não está preenchido no cadastro do Cliente!!');
    wCidade := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE ='+ DMCadastro.QCadastroCOD_CIDADE.Text);

    if FPedidoParam.RG18Idioma.ItemIndex = 0 then //espanhol
    Begin
      NewWord := GetOrCreateObject( 'Word.Application' );
      NewWord.Visible := True;
      NewWord.Documents.Add;

      // Obtem documento e paragrafo
      Document := NewWord.Documents.Item(1);
      Document.PageSetup.TopMargin := '2,50 cm';
      Document.PageSetup.BottomMargin := '2,50 cm';
      Document.PageSetup.LeftMargin := '2,50 cm';
      Document.PageSetup.RightMargin := '2,50 cm';
      Document.Paragraphs.Add;
      inc(wCont1);

      ///tabela cabeçalho
      Range := Document.Paragraphs.Item(wCont1).Range;
      table := Document.Tables.Add(Range,1,1);
      table.cell(1,1).Width:= '15';
      table.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
      '                                                                                                  ' +
      DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
      '                                                                                                  ' +
      DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
      '                                                                                                  ' +
      '                             BRASIL       '                                                         +
      '                                                                                                  ' +
      '                                    CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;

      ///tabela invoice
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table1 := Document.Tables.Add(Range,1,1);
      table1.cell(1,1).Width:= '15';
      table1.Cell(1,1).Range.Bold := 1;
      table1.Cell(1,1).Range.Text := '                                           ' +
      'COMERCIAL INVOICE';

      ///tabela dados comprador
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table2 := Document.Tables.Add(Range,1,1);
      table2.cell(1,1).Width:= '15';
      table2.Cell(1,1).Range.Text := '                                                                   '              +
      'NUMERO:' + '                                                                   '                                 +
      'Importador:                                                FECHA:                                               '+
      '                                                                      '        +
      (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
      (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
      (DMCadastro.QCadastroDESC_BAIRRO.Text +
      '                                                                                   ')  +
      '                                                                                   '  +
      (wCidade                                                                                   +
      '                                                                                           ')+
      '                                                                                           '+
      '                                                                                           ';

      ///tabela TITULO
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table3 := Document.Tables.Add(Range,1,1);
      table3.cell(1,1).Width:= '15';
      table3.Cell(1,1).Range.Bold := 1;
      table3.Cell(1,1).Range.Text := '                                           ' +
      'DESCRIPCION DEL GENERO';

      //tabela cabeçalho produto
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table4 := Document.Tables.Add(Range,1,5);
      table4.Cell(1,1).Width:= '7';
      table4.Cell(1,2).Width:= '1.55';
      table4.Cell(1,3).Width:= '1';
      table4.Cell(1,4).Width:= '2.60';
      table4.Cell(1,5).Width:= '2.85';
      table4.cell(1,1).Range.Font.Size:= '8';
      table4.cell(1,2).Range.Font.Size:= '8';
      table4.cell(1,3).Range.Font.Size:= '8';
      table4.cell(1,4).Range.Font.Size:= '8';
      table4.cell(1,5).Range.Font.Size:= '8';
      table4.Cell(1,1).Range.Bold := 1;
      table4.Cell(1,2).Range.Bold := 1;
      table4.Cell(1,3).Range.Bold := 1;
      table4.Cell(1,4).Range.Bold := 1;
      table4.Cell(1,5).Range.Bold := 1;
      table4.Cell(1,1).Range.Text:='DESCRIPCION DEL GENERO';
      table4.Cell(1,2).Range.Text:='REF.';
      table4.Cell(1,3).Range.Text:='QTI.';
      table4.Cell(1,4).Range.Text:='PRECIO UNIT U$';
      table4.Cell(1,5).Range.Text:='PRECIO TOTAL U$';

      //table produtos
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table5 := Document.Tables.Add(Range,1,5);
      table5.Cell(1,1).Width:= '7';
      table5.Cell(1,2).Width:= '1.55';
      table5.Cell(1,3).Width:= '1';
      table5.Cell(1,4).Width:= '2.60';
      table5.Cell(1,5).Width:= '2.85';
      table5.cell(1,1).Range.Font.Size:= '8';
      table5.cell(1,2).Range.Font.Size:= '8';
      table5.cell(1,3).Range.Font.Size:= '8';
      table5.cell(1,4).Range.Font.Size:= '8';
      table5.cell(1,5).Range.Font.Size:= '8';


      QPedidoItem.First;
      while not QPedidoItem.eof do
      begin
        //while  ((wCont < 38) and not(QPedidoItem.Eof)) do
        while  ((wCont < 48) and not(QPedidoItem.Eof)) do
        Begin
          wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
          wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
          table5.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
          Document.Paragraphs.Add;
          inc(wCont1);

          wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
          wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
          QPedidoItem.Next;
          table5.Rows.Add;
          inc(wCont)
        end;
       
        //if wCont <= 27 then//finaliza a proforma se qtde de produtos for menor q 27 senao manda pra outra pagina
        if wCont <= 32 then
        Begin
          table5.Rows.Add;
          table5.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
          table5.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
          ///tabela destino
          wAux := wCont1 + 33;
           while wCont1 < wAux do
           Begin
             Document.Paragraphs.Add;
             inc(wCont1);
           end;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table6 := Document.Tables.Add(Range,1,1);
          table6.cell(1,1).Width:= '15';
          table6.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                         '                                                                              ' +
                                         'Forma del pago:                                                         ' +
                                         '                                                                        ' +
                                         'Cantidade de Cajas:                                                     ' +
                                         '                                                                        ' +
                                         'Local del Embarca:                                                      ' +
                                         '                                                                        ' +
                                         'Local del Destino:                                                      ' +
                                         '                                                                        ' +
                                         'Origem de la Mercadoria: Brasil                                         ' +
                                         '                                                                        ' +
                                         'Mercancia del primero calidad                                           ' +
                                         '                                                                        ' +
                                         'NCM                                                                     ' +
                                         '                                                                               ' +
                                         'Precio Fob                                                              ' +
                                         '                                                                                ' +
                                         'Peso Liquido:                                                           ' +
                                         '                                                                             ' +
                                         'Peso Gruesso:                                                           ' +
                                         '                                                                              ' +
                                         'M/3:                                                                   ';

        end
        else
        Begin
          table5.Rows.Add;
          table5.Cell(QPedidoItem.RecNo+1,1).Range.Text := 'continuacion';
        end;
        //aqui começa outra folha
             ///tabela cabeçalho
        if ((wCont > 31) and (wCont <= 48)) then
        Begin
          wAux := wCont1 + 61;
          while wCont1 < wAux do
          Begin
            Document.Paragraphs.Add;
            inc(wCont1)
          end;

          Range := Document.Paragraphs.Item(wCont1).Range;
          table6 := Document.Tables.Add(Range,1,1);
          table6.cell(1,1).Width:= '15';
          table6.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
          '                                                                                                  ' +
          DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
          '                                                                                                  ' +
          DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
          '                                                                                                  ' +
          '                             BRASIL       '                                                         +
          '                                                                                                  ' +
          '                                    CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;


           ///tabela invoice
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(265).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table7 := Document.Tables.Add(Range,1,1);
          table7.cell(1,1).Width:= '15';
          table7.Cell(1,1).Range.Bold := 1;
          table7.Cell(1,1).Range.Text := '                                             ' +
          'COMERCIAL INVOICE';

          ///tabela dados comprador
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(268).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table8 := Document.Tables.Add(Range,1,1);
          table8.cell(1,1).Width:= '15';
          table8.Cell(1,1).Range.Text := '                                                                   '              +
          'NUMERO:' + '                                                                   '                                 +
          'Importador:                                                FECHA:                                               '+
          '                                                                      '        +
          (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
          (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
          (DMCadastro.QCadastroDESC_BAIRRO.Text +
          '                                                                                   ')  +
          '                                                                                   '  +
          (wCidade                                                                                   +
          '                                                                                           ')+
          '                                                                                           '+
          '                                                                                           ';

          ///tabela TITULO
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(271).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table9 := Document.Tables.Add(Range,1,1);
          table9.cell(1,1).Width:= '15';
          table9.Cell(1,1).Range.Bold := 1;
          table9.Cell(1,1).Range.Text := '                                           ' +
          'DESCRIPCION DEL GENERO';

          //tabela cabeçalho produto
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(274).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table9 := Document.Tables.Add(Range,1,5);
          table9.Cell(1,1).Width:= '7';
          table9.Cell(1,2).Width:= '1.55';
          table9.Cell(1,3).Width:= '1';
          table9.Cell(1,4).Width:= '2.60';
          table9.Cell(1,5).Width:= '2.85';
          table9.cell(1,1).Range.Font.Size:= '8';
          table9.cell(1,2).Range.Font.Size:= '8';
          table9.cell(1,3).Range.Font.Size:= '8';
          table9.cell(1,4).Range.Font.Size:= '8';
          table9.cell(1,5).Range.Font.Size:= '8';
          table9.Cell(1,1).Range.Bold := 1;
          table9.Cell(1,2).Range.Bold := 1;
          table9.Cell(1,3).Range.Bold := 1;
          table9.Cell(1,4).Range.Bold := 1;
          table9.Cell(1,5).Range.Bold := 1;
          table9.Cell(1,1).Range.Text:='DESCRIPCION DEL GENERO';
          table9.Cell(1,2).Range.Text:='REF.';
          table9.Cell(1,3).Range.Text:='QTI.';
          table9.Cell(1,4).Range.Text:='PRECIO UNIT U$';
          table9.Cell(1,5).Range.Text:='PRECIO TOTAL U$';

          //table produtos
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(280).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table10 := Document.Tables.Add(Range,1,5);
          table10.Cell(1,1).Width:= '7';
          table10.Cell(1,2).Width:= '1.55';
          table10.Cell(1,3).Width:= '1';
          table10.Cell(1,4).Width:= '2.60';
          table10.Cell(1,5).Width:= '2.85';
          table10.cell(1,1).Range.Font.Size:= '8';
          table10.cell(1,2).Range.Font.Size:= '8';
          table10.cell(1,3).Range.Font.Size:= '8';
          table10.cell(1,4).Range.Font.Size:= '8';
          table10.cell(1,5).Range.Font.Size:= '8';

          while not ((DMPedido.QPedidoItem.eof) or (wCont > 96)) do
          begin
            wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
            wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
            table10.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
            Document.Paragraphs.Add;
            inc(wCont1);

            wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
            wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
            inc(wCont);
            QPedidoItem.Next;
            table10.Rows.Add;
          end;
          
          if wCont < 79 then//finaliza a proforma se qtde de produtos for menor q 65 senao manda pra outra pagina
          Begin
            table10.Rows.Add;
            table10.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
            table10.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
            ///tabela destino
            wAux := wCont1 + 24;
            while wCont1 < wAux do
            Begin
              Document.Paragraphs.Add;
              inc(wCont1);
            end;

            Document.Paragraphs.Add;
            inc(wCont1);
            Range := Document.Paragraphs.Item(wCont1).Range;
            table11 := Document.Tables.Add(Range,1,1);
            table11.cell(1,1).Width:= '15';
            table11.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                           '                                                                              ' +
                                           'Forma del pago:                                                         ' +
                                           '                                                                        ' +
                                           'Cantidade de Cajas:                                                     ' +
                                           '                                                                        ' +
                                           'Local del Embarca:                                                      ' +
                                           '                                                                        ' +
                                           'Local del Destino:                                                      ' +
                                           '                                                                        ' +
                                           'Origem de la Mercadoria: Brasil                                         ' +
                                           '                                                                        ' +
                                           'Mercancia del primero calidad                                           ' +
                                           '                                                                        ' +
                                           'NCM                                                                     ' +
                                           '                                                                               ' +
                                           'Precio Fob                                                              ' +
                                           '                                                                                ' +
                                           'Peso Liquido:                                                           ' +
                                           '                                                                             ' +
                                           'Peso Gruesso:                                                           ' +
                                           '                                                                              ' +
                                           'M/3:                                                                   ';

          end
          else
          Begin
            table10.rows.add;
            table10.Cell(QPedidoItem.RecNo+1,1).Range.Text := 'continuacion';
          end;

                      //aqui começa outra folha
            if ((wCont > 79)) then
            Begin
              wAux := wCont1 + 55;
              while wCont1 < wAux do
              Begin
                Document.Paragraphs.Add;
                inc(wCont1);
              end;
                 ///tabela cabeçalho
              Document.Paragraphs.add;
              inc(wCont1);
              Range := Document.Paragraphs.Item(wCont1).Range;
              table11 := Document.Tables.Add(Range,1,1);
              table11.cell(1,1).Width:= '15';
              table11.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
              '                                                                                                  ' +
              DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
              '                                                                                                  ' +
              DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
              '                                                                                                  ' +
              '                             BRASIL       '                                                         +
              '                                                                                                  ' +
              '                                     CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;


               ///tabela invoice
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table12 := Document.Tables.Add(Range,1,1);
              table12.cell(1,1).Width:= '15';
              table12.Cell(1,1).Range.Bold := 1;
              table12.Cell(1,1).Range.Text := '                                           ' +
              'COMERCIAL INVOICE';

              ///tabela dados comprador
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table13 := Document.Tables.Add(Range,1,1);
              table13.cell(1,1).Width:= '15';
              table13.Cell(1,1).Range.Text := '                                                                   '              +
              'NUMERO:' + '                                                                   '                                 +
              'Importador:                                                FECHA:                                               '+
              '                                                             ' +
              (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
              (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
              (DMCadastro.QCadastroDESC_BAIRRO.Text +
              '                                                                                   ')  +
              '                                                                                   '  +
              (wCidade                                                                                   +
              '                                                                                           ')+
              '                                                                                           '+
              '                                                                                           ';

              ///tabela TITULO
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table14 := Document.Tables.Add(Range,1,1);
              table14.cell(1,1).Width:= '15';
              table14.cell(1,1).Range.Bold:= 1;
              table14.Cell(1,1).Range.Text := '                                           ' +
              'DESCRIPCION DEL GENERO';

              //tabela cabeçalho produto
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table15 := Document.Tables.Add(Range,1,5);
              table15.Cell(1,1).Width:= '7';
              table15.Cell(1,2).Width:= '1.55';
              table15.Cell(1,3).Width:= '1';
              table15.Cell(1,4).Width:= '2.60';
              table15.Cell(1,5).Width:= '2.85';
              table15.Cell(1,1).Range.Bold := 1;
              table15.Cell(1,2).Range.Bold := 1;
              table15.Cell(1,3).Range.Bold := 1;
              table15.Cell(1,4).Range.Bold := 1;
              table15.Cell(1,5).Range.Bold := 1;
              table15.cell(1,1).Range.Font.Size:= '8';
              table15.cell(1,2).Range.Font.Size:= '8';
              table15.cell(1,3).Range.Font.Size:= '8';
              table15.cell(1,4).Range.Font.Size:= '8';
              table15.cell(1,5).Range.Font.Size:= '8';
              table15.Cell(1,1).Range.Text:='DESCRIPCION DEL GENERO';
              table15.Cell(1,2).Range.Text:='REF.';
              table15.Cell(1,3).Range.Text:='QTI.';
              table15.Cell(1,4).Range.Text:='PRECIO UNIT U$';
              table15.Cell(1,5).Range.Text:='PRECIO TOTAL U$';

              //table produtos
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table16 := Document.Tables.Add(Range,1,5);
              table16.Cell(1,1).Width:= '7';
              table16.Cell(1,2).Width:= '1.55';
              table16.Cell(1,3).Width:= '1';
              table16.Cell(1,4).Width:= '2.60';
              table16.Cell(1,5).Width:= '2.85';
              table16.cell(1,1).Range.Font.Size:= '8';
              table16.cell(1,2).Range.Font.Size:= '8';
              table16.cell(1,3).Range.Font.Size:= '8';
              table16.cell(1,4).Range.Font.Size:= '8';
              table16.cell(1,5).Range.Font.Size:= '8';

              while not DMPedido.QPedidoItem.eof do
              begin
                wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
                wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
                table16.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
                Document.Paragraphs.Add;
                inc(wCont1);

                wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
                wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
                inc(wCont);
                QPedidoItem.Next;
                table16.Rows.Add;
              end;


              if wCont <= 103 then//finaliza a proforma se qtde de produtos for menor q  senao manda pra outra pagina
              Begin
                table16.Rows.Add;
                table16.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
                table16.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
                ///tabela destino

                wAux := wCont1 + 30;
                while wCont1 < wAux do
                Begin
                  Document.Paragraphs.Add;
                  inc(wCont1);
                end;
                Range := Document.Paragraphs.Item(wCont1).Range;
                table17 := Document.Tables.Add(Range,1,1);
                table17.cell(1,1).Width:= '15';
                table17.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                               '                                                                              ' +
                                               'Forma del pago:                                                         ' +
                                               '                                                                        ' +
                                               'Cantidade de Cajas:                                                     ' +
                                               '                                                                        ' +
                                               'Local del Embarca:                                                      ' +
                                               '                                                                        ' +
                                               'Local del Destino:                                                      ' +
                                               '                                                                        ' +
                                               'Origem de la Mercadoria: Brasil                                         ' +
                                               '                                                                        ' +
                                               'Mercancia del primero calidad                                           ' +
                                               '                                                                        ' +
                                               'NCM                                                                     ' +
                                               '                                                                               ' +
                                               'Precio Fob                                                              ' +
                                               '                                                                                ' +
                                               'Peso Liquido:                                                           ' +
                                               '                                                                             ' +
                                               'Peso Gruesso:                                                           ' +
                                               '                                                                              ' +
                                               'M/3:                                                                   ';

            end;
          end;
        end;
      end;
    end
    else
    if FPedidoParam.RG18Idioma.ItemIndex = 1 then
    Begin
      NewWord := GetOrCreateObject( 'Word.Application' );
      NewWord.Visible := True;
      NewWord.Documents.Add;

      // Obtem documento e paragrafo
      Document := NewWord.Documents.Item(1);
      Document.PageSetup.TopMargin := '2,50 cm';
      Document.PageSetup.BottomMargin := '2,50 cm';
      Document.PageSetup.LeftMargin := '2,50 cm';
      Document.PageSetup.RightMargin := '2,50 cm';
      Document.Paragraphs.Add;
      inc(wCont1);

      ///tabela cabeçalho
      Range := Document.Paragraphs.Item(wCont1).Range;
      table := Document.Tables.Add(Range,1,1);
      table.cell(1,1).Width:= '15';
      table.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
      '                                                                                                  ' +
      DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
      '                                                                                                  ' +
      DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
      '                                                                                                  ' +
      '                             BRASIL       '                                                         +
      '                                                                                                  ' +
      '                                    CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;

      ///tabela invoice
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table1 := Document.Tables.Add(Range,1,1);
      table1.cell(1,1).Width:= '15';
      table1.Cell(1,1).Range.Bold := 1;
      table1.Cell(1,1).Range.Text := '                                           ' +
      'PROFORMA INVOICE';

      ///tabela dados comprador
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table2 := Document.Tables.Add(Range,1,1);
      table2.cell(1,1).Width:= '15';
      table2.Cell(1,1).Range.Text := '                                                                   '              +
      'NUMBER:' + '                                                                   '                                 +
      'Import:                                                                                                         '+
      '                                                                      '        +
      (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
      (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
      (DMCadastro.QCadastroDESC_BAIRRO.Text +
      '                                                                                   ')  +
      '                                                                                   '  +
      (wCidade                                                                                   +
      '                                                                                           ')+
      '                                                                                           '+
      '                                                                                           ';

      ///tabela TITULO
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table3 := Document.Tables.Add(Range,1,1);
      table3.cell(1,1).Width:= '15';
      table3.Cell(1,1).Range.Bold := 1;
      table3.Cell(1,1).Range.Text := '                                           ' +
      'DESCRIPCION             ';

      //tabela cabeçalho produto
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table4 := Document.Tables.Add(Range,1,5);
      table4.Cell(1,1).Width:= '7';
      table4.Cell(1,2).Width:= '1.55';
      table4.Cell(1,3).Width:= '1';
      table4.Cell(1,4).Width:= '2.60';
      table4.Cell(1,5).Width:= '2.85';
      table4.cell(1,1).Range.Font.Size:= '8';
      table4.cell(1,2).Range.Font.Size:= '8';
      table4.cell(1,3).Range.Font.Size:= '8';
      table4.cell(1,4).Range.Font.Size:= '8';
      table4.cell(1,5).Range.Font.Size:= '8';
      table4.Cell(1,1).Range.Bold := 1;
      table4.Cell(1,2).Range.Bold := 1;
      table4.Cell(1,3).Range.Bold := 1;
      table4.Cell(1,4).Range.Bold := 1;
      table4.Cell(1,5).Range.Bold := 1;
      table4.Cell(1,1).Range.Text:='DESCRIPCION';
      table4.Cell(1,2).Range.Text:='REF.';
      table4.Cell(1,3).Range.Text:='QTI.';
      table4.Cell(1,4).Range.Text:='UNIT PRICE U$';
      table4.Cell(1,5).Range.Text:='TOTAL PRICE U$';

      //table produtos
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      Document.Paragraphs.Add;
      inc(wCont1);
      inc(wCont1);

      Range := Document.Paragraphs.Item(wCont1).Range;
      table5 := Document.Tables.Add(Range,1,5);
      table5.Cell(1,1).Width:= '7';
      table5.Cell(1,2).Width:= '1.55';
      table5.Cell(1,3).Width:= '1';
      table5.Cell(1,4).Width:= '2.60';
      table5.Cell(1,5).Width:= '2.85';
      table5.cell(1,1).Range.Font.Size:= '8';
      table5.cell(1,2).Range.Font.Size:= '8';
      table5.cell(1,3).Range.Font.Size:= '8';
      table5.cell(1,4).Range.Font.Size:= '8';
      table5.cell(1,5).Range.Font.Size:= '8';


      QPedidoItem.First;
      while not QPedidoItem.eof do
      begin
        //while  ((wCont < 38) and not(QPedidoItem.Eof)) do
        while  ((wCont < 48) and not(QPedidoItem.Eof)) do
        Begin
          wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
          wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
          table5.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
          Document.Paragraphs.Add;
          inc(wCont1);
          table5.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
          Document.Paragraphs.Add;
          inc(wCont1);

          wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
          wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
          QPedidoItem.Next;
          table5.Rows.Add;
          inc(wCont)
        end;

        //if wCont <= 27 then//finaliza a proforma se qtde de produtos for menor q 27 senao manda pra outra pagina
        if wCont <= 32 then
        Begin
          table5.Rows.Add;
          table5.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
          table5.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
          ///tabela destino
          wAux := wCont1 + 33;
           while wCont1 < wAux do
           Begin
             Document.Paragraphs.Add;
             inc(wCont1);
           end;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table6 := Document.Tables.Add(Range,1,1);
          table6.cell(1,1).Width:= '15';
          table6.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                         '                                                                              ' +
                                         'Value:                                                                  ' +
                                         '                                                                                 ' +
                                         'Mode of payment:                                                        ' +
                                         '                                                                        ' +
                                         'Box:                                                                    ' +
                                         '                                                                        ' +
                                         'Embarkment of port:                                                     ' +
                                         '                                                                        ' +
                                         'destination porto:                                                      ' +
                                         '                                                                        ' +
                                         'origin of merchandise: Brasil                                           ' +
                                         '                                                                        ' +
                                         'merchandise if first quality                                            ' +
                                         '                                                                               ' +
                                         'NCM                                                                     ' +
                                         '                                                                                  ' +
                                         'Price Fob                                                               ' +
                                         '                                                                             ' +
                                         'weight:                                                                 ' +
                                         '                                                                                 ' +
                                         'gross weight:                                                           ' +
                                         '                                                                             ' +
                                         'M/3:                                                                   ';

        end
        else
        Begin
          table5.Rows.Add;
          table5.Cell(QPedidoItem.RecNo+1,1).Range.Text := 'continuacion';
        end;
        //aqui começa outra folha
             ///tabela cabeçalho
        if ((wCont > 31) and (wCont <= 48)) then
        Begin
          wAux := wCont1 + 61;
          while wCont1 < wAux do
          Begin
            Document.Paragraphs.Add;
            inc(wCont1)
          end;

          Range := Document.Paragraphs.Item(wCont1).Range;
          table6 := Document.Tables.Add(Range,1,1);
          table6.cell(1,1).Width:= '15';
          table6.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
          '                                                                                                  ' +
          DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
          '                                                                                                  ' +
          DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
          '                                                                                                  ' +
          '                             BRASIL       '                                                         +
          '                                                                                                  ' +
          '                                    CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;


           ///tabela invoice
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(265).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table7 := Document.Tables.Add(Range,1,1);
          table7.cell(1,1).Width:= '15';
          table7.Cell(1,1).Range.Bold := 1;
          table7.Cell(1,1).Range.Text := '                                             ' +
          'PROFORMA INVOICE';

          ///tabela dados comprador
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(268).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table8 := Document.Tables.Add(Range,1,1);
          table8.cell(1,1).Width:= '15';
          table8.Cell(1,1).Range.Text := '                                                                   '              +
          'NUMBER:' + '                                                                   '                                 +
          'Import:                                                                                                        '+
          '                                                                      '        +
          (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
          (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
          (DMCadastro.QCadastroDESC_BAIRRO.Text +
          '                                                                                   ')  +
          '                                                                                   '  +
          (wCidade                                                                                   +
          '                                                                                           ')+
          '                                                                                           '+
          '                                                                                           ';

          ///tabela TITULO
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(271).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table9 := Document.Tables.Add(Range,1,1);
          table9.cell(1,1).Width:= '15';
          table9.Cell(1,1).Range.Bold := 1;
          table9.Cell(1,1).Range.Text := '                                           ' +
          'DESCRIPCION            ';

          //tabela cabeçalho produto
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(274).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table9 := Document.Tables.Add(Range,1,5);
          table9.Cell(1,1).Width:= '7';
          table9.Cell(1,2).Width:= '1.55';
          table9.Cell(1,3).Width:= '1';
          table9.Cell(1,4).Width:= '2.60';
          table9.Cell(1,5).Width:= '2.85';
          table9.cell(1,1).Range.Font.Size:= '8';
          table9.cell(1,2).Range.Font.Size:= '8';
          table9.cell(1,3).Range.Font.Size:= '8';
          table9.cell(1,4).Range.Font.Size:= '8';
          table9.cell(1,5).Range.Font.Size:= '8';
          table9.Cell(1,1).Range.Bold := 1;
          table9.Cell(1,2).Range.Bold := 1;
          table9.Cell(1,3).Range.Bold := 1;
          table9.Cell(1,4).Range.Bold := 1;
          table9.Cell(1,5).Range.Bold := 1;
          table9.Cell(1,1).Range.Text:='DESCRIPCION ';
          table9.Cell(1,2).Range.Text:='REF.';
          table9.Cell(1,3).Range.Text:='QTI.';
          table9.Cell(1,4).Range.Text:='UNIT PRICE U$';
          table9.Cell(1,5).Range.Text:='TOTAL PRICE U$';

          //table produtos
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);
          Document.Paragraphs.Add;
          inc(wCont1);

          //Range := Document.Paragraphs.Item(280).Range;
          Range := Document.Paragraphs.Item(wCont1).Range;
          table10 := Document.Tables.Add(Range,1,5);
          table10.Cell(1,1).Width:= '7';
          table10.Cell(1,2).Width:= '1.55';
          table10.Cell(1,3).Width:= '1';
          table10.Cell(1,4).Width:= '2.60';
          table10.Cell(1,5).Width:= '2.85';
          table10.cell(1,1).Range.Font.Size:= '8';
          table10.cell(1,2).Range.Font.Size:= '8';
          table10.cell(1,3).Range.Font.Size:= '8';
          table10.cell(1,4).Range.Font.Size:= '8';
          table10.cell(1,5).Range.Font.Size:= '8';

          while not ((DMPedido.QPedidoItem.eof) or (wCont > 96)) do
          begin
            wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
            wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
            table10.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
            Document.Paragraphs.Add;
            inc(wCont1);
            table10.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
            Document.Paragraphs.Add;
            inc(wCont1);

            wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
            wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
            inc(wCont);
            QPedidoItem.Next;
            table10.Rows.Add;
          end;


          if wCont < 79 then//finaliza a proforma se qtde de produtos for menor q 65 senao manda pra outra pagina
          Begin
            table10.Rows.Add;
            table10.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
            table10.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
            ///tabela destino
            wAux := wCont1 + 24;
            while wCont1 < wAux do
            Begin
              Document.Paragraphs.Add;
              inc(wCont1);
            end;

            Document.Paragraphs.Add;
            inc(wCont1);
            Range := Document.Paragraphs.Item(wCont1).Range;
            table11 := Document.Tables.Add(Range,1,1);
            table11.cell(1,1).Width:= '15';
            table11.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                         '                                                                              ' +
                                         'Value:                                                                  ' +
                                         '                                                                                 ' +
                                         'Mode of payment:                                                        ' +
                                         '                                                                        ' +
                                         'Box:                                                                    ' +
                                         '                                                                        ' +
                                         'Embarkment of port:                                                     ' +
                                         '                                                                        ' +
                                         'destination porto:                                                      ' +
                                         '                                                                        ' +
                                         'origin of merchandise: Brasil                                           ' +
                                         '                                                                        ' +
                                         'merchandise if first quality                                            ' +
                                         '                                                                               ' +
                                         'NCM                                                                     ' +
                                         '                                                                                  ' +
                                         'Price Fob                                                               ' +
                                         '                                                                             ' +
                                         'weight:                                                                 ' +
                                         '                                                                                 ' +
                                         'gross weight:                                                           ' +
                                         '                                                                             ' +
                                         'M/3:                                                                   ';

          end
          else
          Begin
            table10.rows.add;
            table10.Cell(QPedidoItem.RecNo+1,1).Range.Text := 'continuacion';
          end;

                      //aqui começa outra folha
            if ((wCont > 79)) then
            Begin
              wAux := wCont1 + 55;
              while wCont1 < wAux do
              Begin
                Document.Paragraphs.Add;
                inc(wCont1);
              end;
                 ///tabela cabeçalho
              Document.Paragraphs.add;
              inc(wCont1);
              Range := Document.Paragraphs.Item(wCont1).Range;
              table11 := Document.Tables.Add(Range,1,1);
              table11.cell(1,1).Width:= '15';
              table11.Cell(1,1).Range.Text:= DMFilial.QFilialDESC_FILIAL.Text                                        +
              '                                                                                                  ' +
              DMFilial.QFilialDESC_ENDERECO.Text                                                                   +
              '                                                                                                  ' +
              DMFilial.QFilialDESC_CIDADE.Text+'/'+DMFilial.QFilialCOD_ESTADO.Text                                 +
              '                                                                                                  ' +
              '                             BRASIL       '                                                         +
              '                                                                                                  ' +
              '                                     CGC/MF :'+ DMFilial.QFilialNUM_CGC.Text;


               ///tabela invoice
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table12 := Document.Tables.Add(Range,1,1);
              table12.cell(1,1).Width:= '15';
              table12.Cell(1,1).Range.Bold := 1;
              table12.Cell(1,1).Range.Text := '                                           ' +
              'PROFORMA INVOICE';

              ///tabela dados comprador
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table13 := Document.Tables.Add(Range,1,1);
              table13.cell(1,1).Width:= '15';
              table13.Cell(1,1).Range.Text := '                                                                   '  +
              'NUMBER:          ' + '                                                                   '            +
              'Import:                                                                                               '+
              '                                                             ' +
              (DMCadastro.QCadastroNOME.Text + '                                                                      ')        +
              (DMCadastro.QCadastroDESC_ENDERECO.Text + '                                              ')+
              (DMCadastro.QCadastroDESC_BAIRRO.Text +
              '                                                                                   ')  +
              '                                                                                   '  +
              (wCidade                                                                                   +
              '                                                                                           ')+
              '                                                                                           '+
              '                                                                                           ';

              ///tabela TITULO
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table14 := Document.Tables.Add(Range,1,1);
              table14.cell(1,1).Width:= '15';
              table14.cell(1,1).Range.Bold:= 1;
              table14.Cell(1,1).Range.Text := '                                           ' +
              'DESCRIPCION            ';

              //tabela cabeçalho produto
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table15 := Document.Tables.Add(Range,1,5);
              table15.Cell(1,1).Width:= '7';
              table15.Cell(1,2).Width:= '1.55';
              table15.Cell(1,3).Width:= '1';
              table15.Cell(1,4).Width:= '2.60';
              table15.Cell(1,5).Width:= '2.85';
              table15.Cell(1,1).Range.Bold := 1;
              table15.Cell(1,2).Range.Bold := 1;
              table15.Cell(1,3).Range.Bold := 1;
              table15.Cell(1,4).Range.Bold := 1;
              table15.Cell(1,5).Range.Bold := 1;
              table15.cell(1,1).Range.Font.Size:= '8';
              table15.cell(1,2).Range.Font.Size:= '8';
              table15.cell(1,3).Range.Font.Size:= '8';
              table15.cell(1,4).Range.Font.Size:= '8';
              table15.cell(1,5).Range.Font.Size:= '8';
              table15.Cell(1,1).Range.Text:='DESCRIPCION ';
              table15.Cell(1,2).Range.Text:='REF.';
              table15.Cell(1,3).Range.Text:='QTI.';
              table15.Cell(1,4).Range.Text:='UNIT PRICE U$';
              table15.Cell(1,5).Range.Text:='TOTAL PRICE U$';

              //table produtos
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);
              Document.Paragraphs.Add;
              inc(wCont1);

              Range := Document.Paragraphs.Item(wCont1).Range;
              table16 := Document.Tables.Add(Range,1,5);
              table16.Cell(1,1).Width:= '7';
              table16.Cell(1,2).Width:= '1.55';
              table16.Cell(1,3).Width:= '1';
              table16.Cell(1,4).Width:= '2.60';
              table16.Cell(1,5).Width:= '2.85';
              table16.cell(1,1).Range.Font.Size:= '8';
              table16.cell(1,2).Range.Font.Size:= '8';
              table16.cell(1,3).Range.Font.Size:= '8';
              table16.cell(1,4).Range.Font.Size:= '8';
              table16.cell(1,5).Range.Font.Size:= '8';

              while not DMPedido.QPedidoItem.eof do
              begin
                wProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QPedidoItemCod_Produto.Text);
                wLote    := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO ='+QPedidoItemCod_Lote_Tipo.Text);
                table16.Cell(QPedidoItem.RecNo+1,1).Range.Text:= wProduto + ' '+ wLote;
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemCOD_PRODUTO.Value;
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
                Document.Paragraphs.Add;
                inc(wCont1);
                table16.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
                Document.Paragraphs.Add;
                inc(wCont1);

                wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
                wQtPedido := wQtPedido + StrToInt(QPedidoItemQT_PEDIDO.Text);
                inc(wCont);
                QPedidoItem.Next;
                table16.Rows.Add;
              end;


              if wCont <= 103 then//finaliza a proforma se qtde de produtos for menor q  senao manda pra outra pagina
              Begin
                table16.Rows.Add;
                table16.Cell(QPedidoItem.RecNo+2,3).Range.Text := Bib.NumToTexto(wQtPedido,0,6);
                table16.Cell(QPedidoItem.RecNo+2,5).Range.Text := Bib.NumToTexto(wTotalProdutos,2,10);
                ///tabela destino

                wAux := wCont1 + 30;
                while wCont1 < wAux do
                Begin
                  Document.Paragraphs.Add;
                  inc(wCont1);
                end;
                Range := Document.Paragraphs.Item(wCont1).Range;
                table17 := Document.Tables.Add(Range,1,1);
                table17.cell(1,1).Width:= '15';
                table17.Cell(1,1).Range.Text := 'TOTAL                                                                         ' +
                                         '                                                                              ' +
                                         'Value:                                                                  ' +
                                         '                                                                                 ' +
                                         'Mode of payment:                                                        ' +
                                         '                                                                        ' +
                                         'Box:                                                                    ' +
                                         '                                                                        ' +
                                         'Embarkment of port:                                                     ' +
                                         '                                                                        ' +
                                         'destination porto:                                                      ' +
                                         '                                                                        ' +
                                         'origin of merchandise: Brasil                                           ' +
                                         '                                                                        ' +
                                         'merchandise if first quality                                            ' +
                                         '                                                                               ' +
                                         'NCM                                                                     ' +
                                         '                                                                                  ' +
                                         'Price Fob                                                               ' +
                                         '                                                                             ' +
                                         'weight:                                                                 ' +
                                         '                                                                                 ' +
                                         'gross weight:                                                           ' +
                                         '                                                                             ' +
                                         'M/3:                                                                   ';

              end;
            end;
          end;
        end;
    end;
  end;
end;

procedure TFPedidoCad.SBImpressaoEspelhoClick(Sender: TObject);
begin
  inherited;
  If FPedidoEspelhoWeb = Nil then
    FPedidoEspelhoWeb := TFPedidoEspelhoWeb.Create(Application);
  FPedidoEspelhoWeb.ShowModal;
end;

procedure TFPedidoCad.DBPObraDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FObraCons;
  Classe := TFObraCons;

end;

procedure TFPedidoCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTabelaPrecoCons;
  Classe := TFTabelaPrecoCons;
end;

function TFPedidoCad.TabelaPrecoVencida: Boolean;
var wValidadeTabelaPreco: string;
begin
  result := false;
  // Deve respeitar data de validade da lista
  if DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Text =  DMOracle.FastSelect('COD_TABELA_PRECO_CAB', 'TB_CADASTRO',
    'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text) then
  begin
    wValidadeTabelaPreco := '';
    wValidadeTabelaPreco := DMOracle.FastSelect('NVL(TO_CHAR(DT_VENCIMENTO_TABELA_PRECO),'+quotedStr('')+')',
      'TB_CADASTRO', 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
    if (trim(wValidadeTabelaPreco) <> '') and (strToDate(wValidadeTabelaPreco) < DMOracle.DataServ) then
    begin
      MessageDlg('Tabela de preço com data de validade vencida no dia '+ wValidadeTabelaPreco
        , mtInformation, [mbOk], 0);
      DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Clear;
      DBPanel2.SetFocus;
      result := true;
    end;
  end;
end;

procedure TFPedidoCad.DBPanel2CodigoExit(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoItem.State in [DsInsert, DsEdit] then
  begin
    if DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Value > 0 then
    begin

      // Não houve alteração
      if wAlterouLista = false then
        exit;
      if DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Value = wCodigoTabelaPreco then
        exit;

      if tabelaPrecoVencida then
        exit;

      // Faz uma verificação de bloqueio da tabela de preços
      if not BibVenda.LiberaBloqueioTabelaPreco then
      begin
        // Busca o código da tabela de preços atrelada ao cliente
        DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Text :=
          DMOracle.FastSelect('COD_TABELA_PRECO_CAB', 'TB_CADASTRO',
            'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);
        MessageDlg('Usuário não habilitado para alterar lista de preços'
          , mtInformation, [mbOk], 0);
        if tabelaPrecoVencida then
          DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Clear;
          
        Exit;
      end;

      if MessageDlg('Deseja utilizar esta lista em todos os itens do pedido?'
        , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMPedido.pUtilizaListaPrecoTodosItens := true;
        DMPedido.pUtilizaListaPreco1Item := false;
      end
      else
      begin
        DMPedido.pUtilizaListaPreco1Item := true;
        DMPedido.pUtilizaListaPrecoTodosItens := false;
      end;
    end;

    if (DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Value > 0) and
    (DMPedido.QPedidoItemCOD_PRODUTO.Value > 0) then
    begin
      DMPedido.PrecoTabela;
    end
    else
      if DMPedido.QPedidoItemCOD_PRODUTO.Value > 0 then
        DMPedido.QPedidoItemCOD_PRODUTOValidate(nil);
    wAlterouLista := false;
  end;
end;

procedure TFPedidoCad.DBPanel2AfterConsulta(Sender: TObject);
begin
  inherited;
  DBPanel2CodigoExit(self);
end;

procedure TFPedidoCad.AtualizaCodListaPreco;
var wCodTabelaPreco: integer;
begin
  // Atualiza a property pCodListaPreco ao consultar uma nota e editar seus itens
  if DMPedido.QPedidoCOD_CADASTRO.Value > 0 then
  begin
    wCodTabelaPreco := StrToInt(DMOracle.FastSelect('NVL(COD_TABELA_PRECO_CAB, -1)', 'TB_CADASTRO'
      , 'COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text));
    if (wCodTabelaPreco > 0) and (DMPedido.pCodListaPreco = 0) then
      DMPedido.pCodListaPreco := wCodTabelaPreco
  end;
end;

procedure TFPedidoCad.DBEdit5Change(Sender: TObject);
begin
  inherited;
  AtualizaCodListaPreco;
end;

procedure TFPedidoCad.DBPanel2CodigoChange(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoItem.State in [DSInsert, DSEdit] then
    wAlterouLista := true;
end;

procedure TFPedidoCad.DBPanel2Exit(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedido.State in [DSInsert, DSEdit] then
  begin
    if DMPedido.QPedidoItemVAL_DESCONTO.ReadOnly then
    begin

      DBEdit27.Color := clBtnFace;
      DBEdit27.Hint := 'Desconto desabilitado por lista de preços';
      DBEdit27.ShowHint := true;
      DBEdit27.ParentShowHint := false;

      DBEdit45.Color := clBtnFace;
      DBEdit45.Hint := 'Desconto desabilitado por lista de preços';
      DBEdit45.ShowHint := true;
      DBEdit45.ParentShowHint := false;

      DBEdit46.Color := clBtnFace;
      DBEdit46.Hint := 'Desconto desabilitado por lista de preços';
      DBEdit46.ShowHint := true;
      DBEdit46.ParentShowHint := false;

    end
    else
    begin

      DBEdit27.Color := clWindow;
      DBEdit27.Hint := '';

      DBEdit45.Color := clWindow;
      DBEdit45.Hint := '';

      DBEdit46.Color := clWindow;
      DBEdit46.Hint := '';
      
    end;
  end;
end;

procedure TFPedidoCad.DBPanel2Enter(Sender: TObject);
begin
  inherited;
  wCodigoTabelaPreco := DMPedido.QPedidoItemCOD_TABELA_PRECO_CAB.Value;
end;

procedure TFPedidoCad.DBRConsumidorClick(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoItem.RecordCount  > 0 then
    MessageDlg('Após alterar o tipo de consumidor, é recomendado verificar' +
      ' o cfop de cada item na aba Itens', mtInformation,[mbOk],0);
end;

procedure TFPedidoCad.EdNumFabricanteExit(Sender: TObject);
var mNumeroFabricante: string;
begin
  inherited;
    mNumeroFabricante := ''; // Inicializa valor do numero fabricante.
    if Trim(EdNumFabricante.Text) <> '' then
    begin
      mNumeroFabricante := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(EdNumFabricante.Text) + chr(39), True);
      if Trim(mNumeroFabricante) = '' then
         EdNumFabricante.Text := mNumeroFabricante
      else
      begin
        if (DMPedido.DSPedidoItem.State = dsBrowse) and (DMPedido.QPedidoItemCOD_PRODUTO.Value = 0) then
           DMPedido.QPedidoItem.Insert;
        if (DmPedido.DSPedidoItem.State = dsBrowse) and (DMPedido.QPedidoItemCod_produto.Value > 0) then
           DmPedido.QPedidoItem.Edit;
        DmPedido.QPedidoItemCOD_PRODUTO.Value := StrToFloat(mNumeroFabricante);
        DMPedido.QPedidoItemNUM_FABRICANTE.Value := Trim(EdNumFabricante.Text); //ULTRAMAQ - Para utilizar na exportação via word. Junior 08/03/2021.
      end;
      EdNumFabricante.Text := '';
      DBEdit23.SetFocus;
    end;
end;

procedure TFPedidoCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    MePlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Value;
    if (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'SIGVANS') then
    begin
      DMPedido.QPedidoCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
      EdModelo.Text := DMVeiculo.QVeiculoConsDESC_MODELO.Value;
    end;
    MePlacaExit(Sender);
  end;
end;

procedure TFPedidoCad.MEPlacaExit(Sender: TObject);
begin
  inherited;
  if (Trim(MePlaca.Text) <> '-') then//Trim(MePlaca.Text) <> '' then
  begin
    with DMVeiculo, DMPedido do
    begin
      QVeiculoCons.close;
      QVeiculoCons.SetVariable('NUM_PLACA','%'+Trim(MePlaca.Text)+'%');
//      QVeiculoCons.SetVariable('NUM_PLACA',Trim(MePlaca.Text));
      QVeiculoCons.Open;
      if QVeiculoCons.RecordCount > 0 then
      begin
        EdModelo.Text := QVeiculoConsDESC_MODELO.Text;
        QPedidoCOD_VEICULO.Value := QVeiculoConsCOD_VEICULO.Value;
        if (DMParamSistema.CodEmpresa <> 'SIGVANS') then
        begin
          if QPedido.State in [dsInsert,dsEdit] then //Função é chamada na consulta da O.S para preencher o modelo do veículo e para não mudar o cód. do cadastro na tela coloquei essa verificação. Junior-26/06/2019.
            QPedidoCOD_CADASTRO.Value := QVeiculoConsCOD_CADASTRO.Value;
        end;
       // QPedidoCOD_CADASTRO.Value := QVeiculoConsCOD_CADASTRO.Value
      end
      else
      begin
        if (MessageDlg('Veículo não cadastrado. Deseja cadastrar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if FVeicCad = Nil then
            FVeicCad := TFVeicCad.Create(Application);
          FVeicCad.SBConsulta.Enabled := false;
          FVeicCad.ShowModal;
        end
        else
        begin
          QPedidoCOD_VEICULO.Value := 0;
          EdModelo.Clear;

        end;
      end;
    end;
  end;

end;

procedure TFPedidoCad.PedidosporFornecedorExcel1Click(Sender: TObject);
var
  Excel, Sheet: Variant;
  linha, coluna, planilha, wFornecedor, planilhasInicio : Integer;
  cabecalho, cabecalhoProduto: boolean;
begin
  inherited;
  if FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[19].TabVisible := true;
  if FPedidoParam.ShowModal = MrOk then
  begin
    with DMPedido, FPedidoParam do
    begin
      QRPedidoFornecedorExcel.Close;
      if Trim(FmFilial19.MeFilial.Text) <> '' then
        QRPedidoFornecedorExcel.SetVariable('COD_FILIAL'
          , FmFilial19.MeFilial.Text)
      else
        QRPedidoFornecedorExcel.SetVariable('COD_FILIAL'
          , null);
      if Trim(FmCadastro19.MeCadastro.Text) <> '' then
        QRPedidoFornecedorExcel.SetVariable('COD_CADASTRO'
          , FmCadastro19.MeCadastro.Text)
      else
        QRPedidoFornecedorExcel.SetVariable('COD_CADASTRO'
          , null);
      QRPedidoFornecedorExcel.SetVariable('DT_INI', FmDatas19.MeDtInicial.Text);
      QRPedidoFornecedorExcel.SetVariable('DT_FIN', FmDatas19.MeDtFinal.Text);
      QRPedidoFornecedorExcel.Open;

      if QRPedidoFornecedorExcel.Eof then
      begin
        MessageDlg('Nenhum pedido encontrado', mtError, [mbOk], 0);
        exit;
      end;

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := True;
      Excel.WorkBooks.Add;
      planilhasInicio := Excel.Workbooks[1].WorkSheets.Count;
      planilha := 1;
      Sheet := Excel.WorkBooks[1].Sheets[planilha];
      linha := 1;
      Sheet.Name :=
        StringReplace(
          StringReplace(
            StringReplace(
              StringReplace(
                StringReplace(
                 StringReplace(
                    copy(QRPedidoFornecedorExcelDESC_FORNECEDOR.Text, 1, 20)
                  ,'/','', [rfReplaceAll])
                ,'\','', [rfReplaceAll])
              ,'?','', [rfReplaceAll])
            ,'*','', [rfReplaceAll])
          ,'[','', [rfReplaceAll])
        ,']','', [rfReplaceAll]) + FormatDateTime('hnsz', now);
      wFornecedor := 0;
      coluna := 1;
      cabecalho := false;
      cabecalhoProduto := false;

      while not QRPedidoFornecedorExcel.Eof do
      begin

        // Adiciona uma nova planilha para cada fornecedor
        if wFornecedor > 0 then
        begin
          if QRPedidoFornecedorExcelCOD_FORNECEDOR.Value <> wFornecedor then
          begin
            Inc(planilha);
            if planilha > planilhasInicio then
              //Excel.WorkBooks[1].Sheets.Add;
              Excel.Workbooks[1].WorkSheets.Add(After := Excel.Workbooks[1].WorkSheets[Excel.Workbooks[1].WorkSheets.Count]);
            Sheet := Excel.WorkBooks[1].Sheets[planilha];  
            Sheet.Name :=
              StringReplace(
                StringReplace(
                  StringReplace(
                    StringReplace(
                      StringReplace(
                       StringReplace(
                          copy(QRPedidoFornecedorExcelDESC_FORNECEDOR.Text, 1, 20)
                        ,'/','', [rfReplaceAll])
                      ,'\','', [rfReplaceAll])
                    ,'?','', [rfReplaceAll])
                  ,'*','', [rfReplaceAll])
                ,'[','', [rfReplaceAll])
              ,']','', [rfReplaceAll]) + FormatDateTime('hnsz', now);
            linha := 1;
            coluna := 1;
            cabecalho := false;
            cabecalhoProduto := false;
          end;
        end;  
        wFornecedor := QRPedidoFornecedorExcelCOD_FORNECEDOR.Value;

        if not cabecalho then
        begin

          Sheet.Cells[linha, coluna].font.size := 12; // Tamanho da Fonte
          Sheet.Cells[linha, coluna].font.bold := true; // Negrito
          Sheet.Cells[linha, coluna]
            := 'RELATÓRIO DE PRODUTOS DE PEDIDOS POR FORNECEDOR';
          Inc(linha, 2);
          if Trim(FmFilial19.MeFilial.Text) <> '' then
          begin
            Sheet.Cells[linha, coluna]
              := DMOracle.FastSelect('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = '
                + Trim(FmFilial19.MeFilial.Text));
            Inc(linha);
          end;
          Sheet.Cells[linha, coluna]
            := 'Período de '
            + Trim(FmDatas19.MeDtInicial.Text)
            + ' até '
            + Trim(FmDatas19.MeDtFinal.Text);
          Inc(linha, 2);
          Sheet.Cells[linha, coluna].font.bold := true; // Negrito
          Sheet.Cells[linha, coluna] := 'FORNECEDOR: '
            + QRPedidoFornecedorExcelCOD_FORNECEDOR.Text
            + ' '
            + QRPedidoFornecedorExcelDESC_FORNECEDOR.Text;
          Inc(linha);
          Sheet.Cells[linha, coluna] := 'CNPJ: '
            + QRPedidoFornecedorExcelCGC_FORNECEDOR.Text;
          Inc(linha);
          Sheet.Cells[linha, coluna] := 'TELEFONE: '
            + QRPedidoFornecedorExcelDESC_TELEFONE_FORNECEDOR.Text;
          Inc(linha);
          Sheet.Cells[linha, coluna]
            := QRPedidoFornecedorExcelDESC_ENDERECO_FORNECEDOR.Text
            + ' '
            + QRPedidoFornecedorExcelDESC_CIDADE_FORNECEDOR.Text;            
          cabecalho := true;
          
        end;

        // Itens
        coluna := 1;
        if not cabecalhoProduto then
        begin 
          Inc(linha, 3);
          Sheet.Cells[linha, coluna].font.bold := true;
          Sheet.Cells[linha, coluna]
            := 'CÓDIGO';
          Sheet.Cells[linha, coluna].ColumnWidth := 15;
          Inc(coluna);
          Sheet.Cells[linha, coluna].font.bold := true;
          Sheet.Cells[linha, coluna]
            := 'CÓDIGO DE BARRAS';
          Sheet.Cells[linha, coluna].ColumnWidth := 25;
          Inc(coluna);
          Sheet.Cells[linha, coluna].font.bold := true;
          Sheet.Cells[linha, coluna]
            := 'DESCRIÇÃO';
          Sheet.Cells[linha, coluna].ColumnWidth := 50;
          Inc(coluna);
          Sheet.Cells[linha, coluna].font.bold := true;
          Sheet.Cells[linha, coluna]
            := 'QUANTIDADE';
          Sheet.Cells[linha, coluna].ColumnWidth := 15;
          cabecalhoProduto := true;
          coluna := 1;
        end;
        Inc(linha);
        Sheet.Cells[linha, coluna]
          := QRPedidoFornecedorExcelCOD_PRODUTO.Text; 
        Inc(coluna);
        Sheet.Cells[linha, coluna]
          := QRPedidoFornecedorExcelDESC_COD_BARRA.Text;
        Inc(coluna);
        Sheet.Cells[linha, coluna]
          := QRPedidoFornecedorExcelDESC_PRODUTO.Text;
        Inc(coluna);
        Sheet.Cells[linha, coluna]
          := StringReplace(QRPedidoFornecedorExcelQT_PEDIDO.Text
            , ',', '.', [rfReplaceAll]);
        QRPedidoFornecedorExcel.Next;

      end;

    end;
  end;
end;

procedure TFPedidoCad.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  If Key = 123 Then
    SBConsultaClick(Sender);}
     if ((GetKeyState(VK_CONTROL) AND 128)=128) and (Key = 84) then
    begin
      if (DMParamSistema.CodEmpresa = 'RETIFOZ') then
        sbImportarPedidoRetifozClick(sbImportarPedidoRetifoz);
    end;
end;

procedure TFPedidoCad.btnProcurar2Click(Sender: TObject);
begin
  inherited;
  if OPDImagem.Execute then
    MECaminhoImagem2.Text := OPDImagem.FileName;
end;

procedure TFPedidoCad.btnIncluirImagem2Click(Sender: TObject);
var
  MyJPEG: TJPEGImage;
  MyBMP: TBitmap;
  stream, outStream: TMemoryStream;
  ext: string;

  StretchBitmap: TBitmap;
  Ratio: double;
  ARect: TRect;

  Height, width: integer;

begin
  inherited;

  if not FileExists(MECaminhoImagem2.Text) then
    raise Exception.Create('Arquivo não encontrado');

  ext := ExtractFileExt(LowerCase(MECaminhoImagem2.Text));
  if (ext <> '.bmp') and (ext <> '.jpg') and (ext <> '.jpeg') then
    raise Exception.Create('Arquivo Inválido');

  stream := TMemoryStream.Create;
  OutStream := TMemoryStream.Create;
  MyJPEG := TJPEGImage.Create;
  MyBMP := TBitmap.Create;

  // Create bitmap
  StretchBitmap := TBitmap.Create;
  try
    //se a figura informada for um bitmap é feita a conversão para jpeg
    if ext = '.bmp' then
    begin
      MyBMP.LoadFromFile(MECaminhoImagem2.Text);
      MyJPEG.Assign(MyBMP);
      MyJPEG.Compress;
    end
    else //se for jpg/jpeg
      MyJPEG.LoadFromFile(MECaminhoImagem2.Text);

    //-------redimensiona a imagem para ficar com o tamanho apropriado-----------
    // Adjust parameters
    Ratio := 0;
//    Height := 240;
//    width := 200;
    //Agora faz-se necessária a imagem em tamanho original (Diego Stiehl - 13/07/2010)
    Height := MyJPEG.Height;
    width := MyJPEG.Width;

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
    MyJPEG.SaveToStream(OutStream);
    //---------fim redimensiona a imagem------------

    //------------grava a imagem no banco de dados-----------------
    DMPedido.QImagemPedido.close;
    DMPedido.QImagemPedido.open;

    DMPedido.QImagemPedido.Insert;

    DMPedido.QImagemPedidoCOD_PEDIDO_CAB.Value := DMPedido.QPedidoCOD_PEDIDO_CAB.AsInteger;
    DMPedido.QImagemPedidoIMG_IMAGEM.LoadFromStream(outStream);
    DMPedido.QImagemPedido.post;
    //----------fim grava imagem no banco de dados------------

    AtualizarImagemPedido2;
  finally
    MyJPEG.Free;
    MyBMP.Free;
    StretchBitmap.Free;
  end;
end;

procedure TFPedidoCad.btnExcluirImagem2Click(Sender: TObject);
begin
  inherited;
  if messageDlg('Deseja realmente excluir essa imagem?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMPedido.QImagemPedido.delete;
    AtualizarImagemPedido2;
  end;
end;

procedure TFPedidoCad.ImprimirImagem1Click(Sender: TObject);
begin
  inherited;

  with DMPedido do
  begin
    if QPedidoCOD_PEDIDO_CAB.IsNull then
      raise Exception.Create('Selecione um pedido');
    if QImagemPedidoIMG_IMAGEM.IsNull then
      raise Exception.Create('Pedido sem imagem');
    if FRImagemPedido = nil then
      FRImagemPedido := TFRImagemPedido.Create(Application);
    FRImagemPedido.QRPrimario.Preview
  end;
end;

procedure TFPedidoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    if QPedidoCOD_PEDIDO_CAB.IsNull then
      raise Exception.Create('Selecione um pedido');
    if QImagemPedidoIMG_IMAGEM.IsNull then
      raise Exception.Create('Pedido sem imagem');
    if FRImagemPedido = nil then
      FRImagemPedido := TFRImagemPedido.Create(Application);
    FRImagemPedido.QRPrimario.Preview
  end;
end;

procedure TFPedidoCad.DBEdit68Exit(Sender: TObject);
begin
  inherited;
  with DMPedido do
  Begin
    if DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO =' + DBECodProduto.Text) = 'MAO OBRA' then
    Begin
      if Trim(DBEdit67.Text) = '' then
      Begin
        DBEdit67.SetFocus;
        ShowMessage('Obrigatório informar o diâmetro!');
      end;
      if Trim(DBEdit68.Text) = '' then
      Begin
        DBEdit68.SetFocus;
        ShowMessage('Obrigatório informar o comprimento!');
      end;

      QPedidoItemQT_PEDIDO.Value := ((((StrToFloat(QPedidoItemVAL_DIAMETRO.Text)/2)*(StrToFloat(QPedidoItemVAL_DIAMETRO.Text)/2))*3.1416)*StrToFloat(QPedidoItemVAL_COMPRIMENTO.Text));
    end;
  end;
end;

procedure TFPedidoCad.EtiquetasPedido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[20].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QEtiquetaPedido.Close;
      if Trim(FPedidoParam.FmPedido21.MePedido.Text) <> '' then
        QEtiquetaPedido.SetVariable('COD_PEDIDO_CAB',FPedidoParam.FmPedido21.MePedido.Text)
      else
        Raise Exception.Create('Obrigatório selecionar o pedido');
      QEtiquetaPedido.Open;
      Etiqueta8x3NeoAli(Sender);
    end;
end;

procedure TFPedidoCad.Etiqueta8x3NeoAli(Sender: TObject);
var
  ret,nLen : integer;
  pbuf : array[0..127] of AnsiChar;
  ver : PAnsiChar;
  strmsg : string;
  len1,len2, wNumEtiquetas : integer;
  buf1,buf2 : AnsiString;
  buff1 : array[0..127] of WideChar;
  wEmpresa, wValor: string;
  wColuna,wQtdeItemProduto: Integer;
  wControla_Ultima_Linha, wDuasColunas: Boolean;
  ArqTeste: TextFile;
  wDesc_Etiqueta: String;
begin
  inherited;
  wControla_Ultima_Linha := False;
  nLen := A_GetUSBBufferLen() + 1;
  len1 := 128;
  len2 := 128;
  SetLength(buf1,len1);
  SetLength(buf2,len2);

  A_EnumUSB(pbuf);
  A_GetUSBDeviceInfo(1, PAnsiChar(buf1), @len1, PAnsiChar(buf2), @len2);
  ret := A_CreatePrn(12, PAnsiChar(buf2));   // open usb.

  A_Set_Darkness(15); //Escurecer a Impressão
  with DMPedido do
  begin
    QEtiquetaPedido.First;
    wColuna := 1;
    while ( not QEtiquetaPedido.Eof) do
    begin
      wQtdeItemProduto := QEtiquetaPedidoQT_PEDIDO.AsInteger;
      while wQtdeItemProduto > 0 do
      begin
        A_Prn_Text(035, 090, 1, 1, 0, 2, 3, 'n', 2,pchar(QEtiquetaPedidoNUM_FABRICANTE.AsString));
        A_Prn_Text(015, 076, 1, 1, 0, 2, 2, 'n', 2,pchar('ARTISTA:' + Copy(QEtiquetaPedidoNOME_ARTISTA.AsString,1,35)));
        A_Prn_Text(015, 060, 1, 1, 0, 2, 2, 'n', 2,pchar(Copy(QEtiquetaPedidoDESC_PRODUTO.AsString,1,35)));
        A_Prn_Barcode(060, 015, 1, 'D', 0, 10, 33, 'N', 0, pchar(FormatFloat('0000000000',QEtiquetaPedidoCOD_PRODUTO.AsInteger)));
        if FPedidoParam.RG21Valor.ItemIndex = 0 then
//          A_Prn_Text(200, 015, 1, 1, 0, 1, 2, 'n', 2,pchar('R$ '+ FormatFloat('0.00',QEtiquetaPedidoVAL_VAREJO.AsFloat)));
          A_Prn_Text(170, 015, 1, 1, 0, 2, 2, 'n', 2,pchar('NBA'+ QEtiquetaPedidoVAL_VAREJO.AsString + '00') );
        A_Set_Backfeed(320);
        A_Print_Out(1, 1, 1, 1);

        wQtdeItemProduto := wQtdeItemProduto - 1;
      end;
        QEtiquetaPedido.Next;
    end;
    A_ClosePrn;
  end;
end;

procedure TFPedidoCad.Oramento1Click(Sender: TObject);
begin
  inherited;
  //Por Gian 08/07/2020 solicitado pelo Junior.
  //Orçamento para Retifoz.

  with DMPedido do
  begin
    if QPedidoCOD_PEDIDO_CAB.Value = 0 then
      MessageDlg('Selecione o pedido para gerar o orçamento', mtError, [mbOK], 0)
    else
    begin
      QROrcamentoRetifoz.Close;
      QROrcamentoRetifoz.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
      QROrcamentoRetifoz.Open;

      if FROrcamento = nil then
        FROrcamento := TFROrcamento.Create(Application);
      if DMParamSistema.CodEmpresa = 'NFCE-SINAL' then
      begin
      //  FROrcamento.QRDBText15.DataField := 'DESC_ENDERECO_COMPLETO_FILIAL';
        FROrcamento.QRLabel8.Caption := 'Forma Pgto';
        FROrcamento.QRDBText6.DataField := 'IND_TIPO_PAGAMENTO';
      end;
      FROrcamento.QRPrimario.Preview;
    end;
  end;

end;

procedure TFPedidoCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
    DBEdit5.SetFocus;
end;

procedure TFPedidoCad.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then
    BtConsCadastro.Click;
end;

procedure TFPedidoCad.DBECodProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then
    BtConsProduto.Click;
end;

procedure TFPedidoCad.EdNumFabricanteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then
    BtConsProduto.Click;
end;

procedure TFPedidoCad.sbImportarPedidoRetifozClick(Sender: TObject);
var
  wCaminhoArquivo: string;
begin
  inherited;
  DBGItemPedido.DataSource.DataSet.DisableControls;
  if (ODImportaXLS.Execute) then
  begin
    wCaminhoArquivo := ExtractFilePath(ODImportaXLS.FileName) +  ExtractFileName(ODImportaXLS.FileName);
    if BibVenda.ImportaPedidoExcelRetifoz(DMPedido.QPedido, DMPedido.QPedidoItem, wCaminhoArquivo) then
      ShowMessage('Pedido importado com ÊXITO')
    else
      ShowMessage('ERRO ao importar o Pedido. Entre em contato com o suporte.');
  end;
  DBGItemPedido.DataSource.DataSet.EnableControls;  
end;

procedure TFPedidoCad.SpeedButton3Click(Sender: TObject);
var wCaminhoArquivo: string;
begin
  inherited;
  DBGItemPedido.DataSource.DataSet.DisableControls;
  if (ODImportaXLS.Execute) then
  begin
    wCaminhoArquivo := ExtractFilePath(ODImportaXLS.FileName) +  ExtractFileName(ODImportaXLS.FileName);
    if BibVenda.ImportaPedidoExcelRetifoz(DMPedido.QPedido, DMPedido.QPedidoItem, wCaminhoArquivo) then
    begin
      DMOracle.DBCemapa.Commit;
      ShowMessage('Pedido importado com ÊXITO');
    end
    else
    begin
      DMOracle.DBCemapa.Rollback;
      ShowMessage('ERRO ao importar o Pedido. Entre em contato com o suporte.');
    end;
  end;
  DBGItemPedido.DataSource.DataSet.EnableControls;

end;

procedure TFPedidoCad.AtualizaPreonoPedido1Click(Sender: TObject);
Var wPreco : Real;
begin
  inherited;
  with DMPedido do
  begin
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        QPedido.Edit;
        while not QPedidoItem.Eof do
        begin
          QPedidoItem.Edit;
          if DMParamSistema.CodEmpresa = 'ARZ' then
            QPedidoItemVal_Unitario.Text := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True)
          else
            QPedidoItemVal_Unitario.Text := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value),True);
          QPedidoItem.Post;
          QPedidoItem.Next;
        end;
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  end;

end;

procedure TFPedidoCad.DBEdit24Enter(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'DEION' then //JUNIOR DEION SOLICITOU BLOQUEIO DE VALOR UNITARIO QUANDO O PRODUTO ESTIVER NA LISTA DE PREÇO. Junior 10/08/2021
    DMPedido.PrecoTabela;
end;

Procedure TFPedidoCad.Preco_Radiolandia;
Begin
  // para Radiolandia quando muda o tipo de pagamento deverá mudar o preço de venda, se já informado itens no pedido -- César 28/12/2021
  With DMPedido Do
  Begin
    QPedidoItem.First;
    While Not(QPedidoItem.Eof) do
    Begin
      QPedidoItem.Edit;
      QPedidoItemVal_Unitario.Value:= DMProduto.PrecoVenda(QPedidoItemCod_Produto.Value,QPedidoCod_Cadastro.Text,'F',QPedidoItemCod_Lote_Tipo.Value);
      QPedidoItem.Post;
      QpedidoItem.Next;
    End;
  End;

End;

procedure TFPedidoCad.DBRGTipoPagamentoChange(Sender: TObject);
begin
  inherited;
  wAlterou := 'SIM'; // utilizado para atualizar os precos para Radiolandia
end;

procedure TFPedidoCad.DBPVendedor2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFPedidoCad.CancelarPedidoMxima1Click(Sender: TObject);
begin
  inherited;
  DMPedido.CancelaPedidoMaxima;
  SBRefreshClick(Self);
end;

procedure TFPedidoCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    If (DMPedido.QPedidoCod_Filial.Value = 2) Then
     DMPedido.QPedidoCod_Operacao.Value := 46 // solicitado pelo Diniz - Cesar 06/07/2023
    Else
     DMPedido.QPedidoCod_Operacao.Value := 23; // solicitado pelo Diniz - Cesar 30/12/2021
  end;

end;

procedure TFPedidoCad.AlterarCondiodePagamento1Click(Sender: TObject);
var sql, wCondicao: String;
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[21].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.Fm21Filial.MeFilial.Text), 'VENDA');
      If Trim(FPedidoParam.Fm21Filial.MeFilial.Text) = '' Then
         Raise exception.Create('Informar código da filial');
      If Trim(FPedidoParam.Fm21Cadastro.MeCadastro.Text) = '' Then
         Raise exception.Create('Informar código do cadastro');
      If Trim(FPedidoParam.Fm21Datas.MeDtInicial.Text) = '' Then
         Raise exception.Create('Informar data inicial');
      If Trim(FPedidoParam.Fm21Datas.MeDtFinal.Text) = '' Then
         Raise exception.Create('Informar data final');
      Case FPedidoParam.Rg21Condicao.ItemIndex of
         0:
          begin
            wCondicao := 'A VISTA';
            if Trim(FPedidoParam.Me21Prazo.Text) <> '' Then
                 Raise exception.Create('Não preencher prazo de pagamento para condição A VISTA');
          end;
         1:
          begin
            wCondicao := 'A PRAZO';
            if Trim(FPedidoParam.Me21Prazo.Text) = '' Then
                 Raise exception.Create('Preencher prazo de pagamento para condição A PRAZO');
          end;
         2:
          begin
            wCondicao := 'OUTROS';
            if Trim(FPedidoParam.Me21Prazo.Text) <> '' Then
                 Raise exception.Create('Não preencher prazo de pagamento para condição OUTROS');
          end;
      End;
      with DMOracle, DMPedido do
      begin
        sql := 'UPDATE TB_PEDIDO_CAB SET IND_TIPO_PAGAMENTO = ' + quotedStr(wCondicao);
        if  Trim(FPedidoParam.Me21Prazo.Text) <> '' Then
            sql := sql + ',COD_PRAZO_VENCIMENTO = ' + Trim(FPedidoParam.Me21Prazo.Text)
        else
            sql := sql + ',COD_PRAZO_VENCIMENTO = Null';
        sql := sql + ' WHERE COD_FILIAL = ' +  Trim(FPedidoParam.Fm21Filial.MeFilial.Text) +
        ' AND COD_CADASTRO = ' +  Trim(FPedidoParam.Fm21Cadastro.MeCadastro.Text) +
        ' AND DT_EMISSAO BETWEEN ' + quotedStr(Trim(FPedidoParam.Fm21Datas.MeDtInicial.Text)) +
        ' AND ' + quotedStr(Trim(FPedidoParam.Fm21Datas.MeDtFinal.Text));
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add(sql);
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      end;
    end;
end;

procedure TFPedidoCad.DBEdit23Exit(Sender: TObject);
var
 wQuantidade: double;
begin
  inherited;
{Solicitado por Everton da ferragem Medianeira para exibir um alerta quando o produto estiver com quantidade zerado. Alex 28/10/2023}
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
  begin                       
    wQuantidade := StrToFloat(DMOracle.FastSelect('QT_QUANTIDADE','TB_ESTOQUE','COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text));
    if (wQuantidade < DMPedido.QPedidoItemQT_PEDIDO.Value) or (wQuantidade = 0) then
      ShowMessage('A quantidade do estoque esta zerada, favor conferir a quantidade informada e o valor unitário!');
  end;
end;

procedure TFPedidoCad.Conferncia1Click(Sender: TObject);
begin
  inherited;
  if FConferenciaPedidoCodBarras = nil then
    FConferenciaPedidoCodBarras := TFConferenciaPedidoCodBarras.Create(Application);
  FConferenciaPedidoCodBarras.ShowModal;
end;

procedure TFPedidoCad.SBEntregaClick(Sender: TObject);
begin
  inherited;
  if FControleEntregaCad = nil then
    FControleEntregaCad := TFControleEntregaCad.Create(Application);
  DMTela.VerificaTela('VENDA', FControleEntregaCad.Caption, FControleEntregaCad.Name);
  FControleEntregaCad.ShowModal;
end;

procedure TFPedidoCad.QuantidadedeItensnosPedidos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[22].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoItemQtd.Close;
      QRPedidoItemQtdCidade.Close;
      QRPedidoItemQtdCliente.Close;
      if trim(FPedidoParam.FmFilial23.MeFilial.Text)  = '' then
      begin
        QRPedidoItemQtd.SetVariable('COD_FILIAL', Null);
        QRPedidoItemQtdCidade.SetVariable('COD_FILIAL', Null);
        QRPedidoItemQtdCliente.SetVariable('COD_FILIAL', Null);
      end
      else
      begin
        QRPedidoItemQtd.SetVariable('COD_FILIAL', StrToInt(FPedidoParam.FmFilial23.MeFilial.Text));
        QRPedidoItemQtdCidade.SetVariable('COD_FILIAL', StrToInt(FPedidoParam.FmFilial23.MeFilial.Text));
        QRPedidoItemQtdCliente.SetVariable('COD_FILIAL', StrToInt(FPedidoParam.FmFilial23.MeFilial.Text));
      end;

      if FPedidoParam.Me23DtEmissaoInicial.Text = '' then
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_EMI',null);
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_EMI',null);
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_EMI',null);
      end
      else
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_EMI',StrToDate(FPedidoParam.Me23DtEmissaoInicial.Text));
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_EMI',StrToDate(FPedidoParam.Me23DtEmissaoInicial.Text));
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_EMI',StrToDate(FPedidoParam.Me23DtEmissaoInicial.Text));
      end;
      if FPedidoParam.Me23DtEmissaoFinal.Text = '' then
      begin
        QRPedidoItemQtd.SetVariable('DT_FIM_EMI',null);
        QRPedidoItemQtdCidade.SetVariable('DT_FIM_EMI',null);
        QRPedidoItemQtdCliente.SetVariable('DT_FIM_EMI',null);
      end
      else
      begin
        QRPedidoItemQtd.SetVariable('DT_FIM_EMI',StrToDate(FPedidoParam.Me23DtEmissaoFinal.Text));
        QRPedidoItemQtdCidade.SetVariable('DT_FIM_EMI',StrToDate(FPedidoParam.Me23DtEmissaoFinal.Text));
        QRPedidoItemQtdCliente.SetVariable('DT_FIM_EMI',StrToDate(FPedidoParam.Me23DtEmissaoFinal.Text));
      end;

      if FPedidoParam.Me23DtFaturamentoInicial.Text = '' then
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_FAT',null);
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_FAT',null);
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_FAT',null);
      end
      else
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoInicial.Text));
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoInicial.Text));
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoInicial.Text));
      end;
      if FPedidoParam.Me23DtFaturamentoFinal.Text = '' then
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_FAT',null);
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_FAT',null);
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_FAT',null);
      end
      else
      begin
        QRPedidoItemQtd.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoFinal.Text));
        QRPedidoItemQtdCidade.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoFinal.Text));
        QRPedidoItemQtdCliente.SetVariable('DT_INICIO_FAT',StrToDate(FPedidoParam.Me23DtFaturamentoFinal.Text));
      end;

      QRPedidoItemQtd.Open;
      QRPedidoItemQtdCidade.Open;
      QRPedidoItemQtdCliente.Open;
      if FRPedidoItemQtd = nil then
        FRPedidoItemQtd := TFRPedidoItemQtd.Create(Application);
      if (FPedidoParam.Me23DtEmissaoInicial.Text <> '' ) or (FPedidoParam.Me23DtEmissaoFinal.Text <> '') then
        FRPedidoItemQtd.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos emitidos no período de: (' + FPedidoParam.Me23DtEmissaoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtEmissaoFinal.Text + ')';
      if (FPedidoParam.Me23DtFaturamentoInicial.Text <> '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text <> '') then
        FRPedidoItemQtd.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos faturados no período de: (' + FPedidoParam.Me23DtFaturamentoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtFaturamentoFinal.Text + ')';
      if (FPedidoParam.Me23DtEmissaoInicial.Text = '' )    or  (FPedidoParam.Me23DtEmissaoFinal.Text = '')     or
         (FPedidoParam.Me23DtFaturamentoInicial.Text = '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text = '') then
        FRPedidoItemQtd.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos';

      if FRPedidoItemQtdCidade = nil then
        FRPedidoItemQtdCidade := TFRPedidoItemQtdCidade.Create(Application);
      if (FPedidoParam.Me23DtEmissaoInicial.Text <> '' ) or (FPedidoParam.Me23DtEmissaoFinal.Text <> '') then
        FRPedidoItemQtdCidade.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade emitidos no período de: (' + FPedidoParam.Me23DtEmissaoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtEmissaoFinal.Text + ')';
      if (FPedidoParam.Me23DtFaturamentoInicial.Text <> '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text <> '') then
        FRPedidoItemQtdCidade.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade faturados no período de: (' + FPedidoParam.Me23DtFaturamentoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtFaturamentoFinal.Text + ')';
      if (FPedidoParam.Me23DtEmissaoInicial.Text = '' )    or  (FPedidoParam.Me23DtEmissaoFinal.Text = '')     or
         (FPedidoParam.Me23DtFaturamentoInicial.Text = '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text = '') then
        FRPedidoItemQtdCidade.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade';

      if FRPedidoItemQtdCliente = nil then
        FRPedidoItemQtdCliente := TFRPedidoItemQtdCliente.Create(Application);
      if (FPedidoParam.Me23DtEmissaoInicial.Text <> '' ) or (FPedidoParam.Me23DtEmissaoFinal.Text <> '') then
        FRPedidoItemQtdCliente.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade emitidos no período de: (' + FPedidoParam.Me23DtEmissaoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtEmissaoFinal.Text + ')';
      if (FPedidoParam.Me23DtFaturamentoInicial.Text <> '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text <> '') then
        FRPedidoItemQtdCliente.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade faturados no período de: (' + FPedidoParam.Me23DtFaturamentoInicial.Text + ' - ' +
                                              FPedidoParam.Me23DtFaturamentoFinal.Text + ')';
      if (FPedidoParam.Me23DtEmissaoInicial.Text = '' )    or  (FPedidoParam.Me23DtEmissaoFinal.Text = '')     or
         (FPedidoParam.Me23DtFaturamentoInicial.Text = '' ) or (FPedidoParam.Me23DtFaturamentoFinal.Text = '') then
        FRPedidoItemQtdCliente.QRLTitulo.Caption := 'Relatório de quantidade de produtos nos pedidos por cidade';

      if FPedidoParam.RGPreview.ItemIndex = 0 then
      begin
        if (FPedidoParam.RGAgrupar23.ItemIndex= 0) then
          FRPedidoItemQtd.QRCompositeReport1.Preview
        else
          FRPedidoItemQtd.QRCompositeReport2.Preview;
      end;
      if FPedidoParam.RGPreview.ItemIndex = 1 then
      begin
        if (FPedidoParam.RGAgrupar23.ItemIndex= 1) then
          FRPedidoItemQtd.QRCompositeReport1.Print
        else
          FRPedidoItemQtd.QRCompositeReport2.Print;
      end;

      QRPedidoItemQtd.Close;
      QRPedidoItemQtdCidade.Close;
      QRPedidoItemQtdCliente.Close;
    end;
end;

end.


