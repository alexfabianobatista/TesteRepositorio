unit UImportacaoNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, Buttons, xmldom, XMLIntf, msxmldom,
  XMLDoc, UBiblioteca, NfeCliente, NFeRPCRetorno, UAguardoBloqueado, DB,
  DBClient, Grids, DBGrids, ImgList, ExtCtrls, UFmSerie, UFmOperacao,
  oxmldom, UFmTributacao, UFmClasse, UFmMarca, DBCtrls, StrUtils, UFmOC,
  DBPanel, UFmDatas, UFmFilial;

type

  TProdutoNfe = class
  private
    codigo :Integer;
    quantidade :String;
    valorTotal :Double;
    ncm :String;
    cfop :String;
    descricao :String;
    baseSubst: Double;
    valorSubst :Double;
    percSubst :Double;
    valorIpi :Double;
    cProd :String;
    item: String;
    temSubst: Boolean;
    temCST020: Boolean;
    temCSOSN103: Boolean;
    numFabricante: String;
    lote: Integer;
    baseSTAnteriorRetido: Double;
    valorSTAnteriorRetido: Double;
    percSTAnteriorRetido: Double;
    baseICMS: Double;
    valorICMS: Double;
    basePis: Double;
    percPis: Double;
    valPis: Double;
    baseCofins: Double;
    percCofins: Double;
    valCofins: Double;
    valorDesconto: Double;//para trazer o desconto do item quando existir no xml. Alex 01/09/2026

  protected

  public
    property pCodigo: Integer read codigo write codigo;
    property pQuantidade :String read quantidade write quantidade;
    property pValorTotal: Double read valorTotal write valorTotal;
    property pNcm: String read ncm write ncm;
    property pCfop: String read cfop write cfop;
    property pDescricao: String read descricao write descricao;
    property pBaseSubst: Double read baseSubst write baseSubst;
    property pValorSubst: Double read valorSubst write valorSubst;
    property pPercSubst: Double read percSubst write percSubst;
    property pValorIpi: Double read valorIpi write valorIpi;
    property pCProd :String read cProd write cProd;
    property pTemSubst: Boolean read temSubst write temSubst;
    property pTemCST020: Boolean read temCST020 write temCST020;
    property pTemCSOSN103: Boolean read temCSOSN103 write temCSOSN103;
    property pNumFabricante: String read numFabricante write numFabricante;
    property pLote: Integer read lote write lote;
    property pBaseSTAnteriorRetido: Double read baseSTAnteriorRetido write baseSTAnteriorRetido;
    property pValorSTAnteriorRetido: Double read valorSTAnteriorRetido write valorSTAnteriorRetido;
    property pPercSTAnteriorRetido: Double read percSTAnteriorRetido write percSTAnteriorRetido;
    property pBaseICMS: Double read baseICMS write baseICMS;
    property pValorICMS: Double read valorICMS write valorICMS;
    property pBasePis: Double read basePis write basePis;
    property pPercPis: Double read percPis write percPis;
    property pValPis: Double read valPis write valPis;
    property pBaseCofins: Double read baseCofins write baseCofins;
    property pPercCofins: Double read percCofins write percCofins;
    property pValCofins: Double read valCofins write valCofins;
    property pValorDesconto: Double read valorDesconto write valorDesconto;
  end;

  TArrProdutoNfe = Array of TProdutoNfe;

  TFImportacaoNfe = class(TForm)
    StatusBar1: TStatusBar;
    OpenDialog1: TOpenDialog;
    XMLDocument1: TXMLDocument;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblNaoAut: TLabel;
    Label1: TLabel;
    sbCarregaArquivo: TSpeedButton;
    MEArquivoXML: TMaskEdit;
    btConsultaNota: TButton;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MECNPJ: TMaskEdit;
    MENome: TMaskEdit;
    MEFantasia: TMaskEdit;
    MELogradouro: TMaskEdit;
    MENumero: TMaskEdit;
    MEBairro: TMaskEdit;
    MEMunicipio: TMaskEdit;
    MECodigoMunIBGE: TMaskEdit;
    MEUF: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MECEP: TMaskEdit;
    MEPais: TMaskEdit;
    MECodigoPaisIBGE: TMaskEdit;
    MEFone: TMaskEdit;
    MEInscricao: TMaskEdit;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ILChecks: TImageList;
    btRemover: TBitBtn;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    TabSheet4: TTabSheet;
    ListBox4: TListBox;
    TabSheet5: TTabSheet;
    FmSerie1: TFmSerie;
    FmOperacao1: TFmOperacao;
    btConcluir: TBitBtn;
    ListBox5: TListBox;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    DBGrid3: TDBGrid;
    MEProcurar: TMaskEdit;
    MeProcurarFabricante: TMaskEdit;
    qtItens: TLabel;
    qtItensVinc: TLabel;
    meCfopST: TMaskEdit;
    Label16: TLabel;
    cbCfopST: TCheckBox;
    pMensagem: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    DBGProdutoAusente: TDBGrid;
    DSProdutoAusente: TDataSource;
    GroupBox1: TGroupBox;
    cbNCM: TCheckBox;
    cbFabricante: TCheckBox;
    Label24: TLabel;
    cbCodBarras: TCheckBox;
    btSalvaItemBD: TBitBtn;
    RGNCM: TRadioGroup;
    FmOC1: TFmOC;
    GroupBox2: TGroupBox;
    btVincularProduto: TBitBtn;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    FmClasse1: TFmClasse;
    FmTributacao1: TFmTributacao;
    btCompletaProduto: TBitBtn;
    MeCodigoProduto: TMaskEdit;
    cbTipoProduto: TComboBox;
    MeDescricaoProduto: TMaskEdit;
    DBLCCstIpiEntrada: TDBLookupComboBox;
    DBLCCstIpiSaida: TDBLookupComboBox;
    DBLCCstPisEntrada: TDBLookupComboBox;
    DBLCCstPisSaida: TDBLookupComboBox;
    DBLCCstCofinsEntrada: TDBLookupComboBox;
    DBLCCstCofinsSaida: TDBLookupComboBox;
    MEProdutoVinculado: TMaskEdit;
    Label22: TLabel;
    btDesvincularProduto: TBitBtn;
    Panel1: TPanel;
    Label35: TLabel;
    Panel2: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    MeDescCodBarra: TMaskEdit;
    FmMarca1: TFmMarca;
    QRLMaragemAtacado: TLabel;
    MeMargemAtacado: TMaskEdit;
    TabSheet6: TTabSheet;
    PCProdutosAristides: TPageControl;
    TabSheet7: TTabSheet;
    DBGProdutoAusenteAristides: TDBGrid;
    DBPanel2: TDBPanel;
    DBComboBox1: TDBComboBox;
    Label38: TLabel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBLCCstIpiEnt: TDBLookupComboBox;
    Label39: TLabel;
    Label40: TLabel;
    DBLCCstIpiSaid: TDBLookupComboBox;
    Label41: TLabel;
    Label42: TLabel;
    DBLCCstPisEtn: TDBLookupComboBox;
    DBLCCstPisSaid: TDBLookupComboBox;
    Label43: TLabel;
    Label44: TLabel;
    DBLCCstCofinsEnt: TDBLookupComboBox;
    DBLCCstCofinsSaid: TDBLookupComboBox;
    DBPanel7: TDBPanel;
    TabSheet8: TTabSheet;
    GBGenero: TGroupBox;
    cbMasculino: TCheckBox;
    cbFeminino: TCheckBox;
    cbUnissex: TCheckBox;
    cbAdulto: TCheckBox;
    cbInfantil: TCheckBox;
    cbBebe: TCheckBox;
    GBSalto: TGroupBox;
    cbAlto: TCheckBox;
    cbBaixo: TCheckBox;
    cbMedio: TCheckBox;
    cbRasteira: TCheckBox;
    cbGrosso: TCheckBox;
    cbFino: TCheckBox;
    cbAnabela: TCheckBox;
    cbFachete: TCheckBox;
    cbEncapado: TCheckBox;
    cbCortica: TCheckBox;
    cbAcrilico: TCheckBox;
    cbLatex: TCheckBox;
    cbBorracha: TCheckBox;
    cbPVC: TCheckBox;
    cbTR: TCheckBox;
    GBMaterial: TGroupBox;
    cbCouro: TCheckBox;
    cbSintetico: TCheckBox;
    cbSwed: TCheckBox;
    cbMicrofibra: TCheckBox;
    cbVerniz: TCheckBox;
    cbLona: TCheckBox;
    cbTecido: TCheckBox;
    cbGliter: TCheckBox;
    cbCamurca: TCheckBox;
    cbNobuk: TCheckBox;
    cbElastico: TCheckBox;
    cbPlastico: TCheckBox;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    btConfirmarProdutoAristides: TBitBtn;
    btConfirmarProdutoAristidesConfig: TBitBtn;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    GBConfig: TGroupBox;
    cbBoneca: TCheckBox;
    cbDorsai: TCheckBox;
    cbSlipper: TCheckBox;
    cbEsportiva: TCheckBox;
    cbIate: TCheckBox;
    cbSlipon: TCheckBox;
    cbIndoorSalao: TCheckBox;
    cbCampo: TCheckBox;
    cbSuicoSociety: TCheckBox;
    cbTiraTornozelo: TCheckBox;
    cbSalome: TCheckBox;
    cbDedo: TCheckBox;
    cbGaspea: TCheckBox;
    cbTiraX: TCheckBox;
    cb2Tiras: TCheckBox;
    cbMule: TCheckBox;
    cbCoturno: TCheckBox;
    cbMontaria: TCheckBox;
    cbOpenboot: TCheckBox;
    cbAnkleboot: TCheckBox;
    cbOver: TCheckBox;
    cbCanoMedio: TCheckBox;
    cbMangaLonga: TCheckBox;
    cbMangaCurta: TCheckBox;
    cbTermica: TCheckBox;
    cbProtecaoSolar: TCheckBox;
    cbLargo: TCheckBox;
    cbEstreito: TCheckBox;
    cbMedioConfig: TCheckBox;
    cb2Alcas: TCheckBox;
    cbTransversal: TCheckBox;
    cbBau: TCheckBox;
    cbNotebook: TCheckBox;
    cbFesta: TCheckBox;
    cbClutch: TCheckBox;
    cbEscolar: TCheckBox;
    cbViagem: TCheckBox;
    cb2Rodas: TCheckBox;
    cb4Rodas: TCheckBox;
    cb5Rodas: TCheckBox;
    cb360: TCheckBox;
    cbKit: TCheckBox;
    DBPanel10: TDBPanel;
    GroupBox4: TGroupBox;
    Label45: TLabel;
    BitBtn1: TBitBtn;
    MEProdutoVinculadoAristides: TMaskEdit;
    BitBtn2: TBitBtn;
    DBMDescProduto: TDBMemo;
    Label46: TLabel;
    btExcluirProdutoAristides: TBitBtn;
    DBPanel1: TDBPanel;
    TabSheet9: TTabSheet;
    DBGrid4: TDBGrid;
    DBEProdutoLoteItemQuantia: TDBEdit;
    Label47: TLabel;
    DBPProdutoLoteItemNumero: TDBPanel;
    DsProdutoLoteItem: TDataSource;
    SBProdutoLoteItemRemover: TSpeedButton;
    BtnProdutoLoteInserir: TBitBtn;
    cbChunky: TCheckBox;
    cbSneaker: TCheckBox;
    cbOxford: TCheckBox;
    MENumFabricante: TMaskEdit;
    Label48: TLabel;
    DBGInfXmlSefa: TDBGrid;
    DsInfXmlSefa: TDataSource;
    BTBaixarInfXmlSefa: TBitBtn;
    FmDatas1: TFmDatas;
    GroupBox5: TGroupBox;
    FmFilial1: TFmFilial;
    CBSituacao: TComboBox;
    Label49: TLabel;
    BTBuscarInfXmlSefa: TBitBtn;
    MeChaveAcesso: TMaskEdit;
    Label50: TLabel;
    FmFilial2: TFmFilial;
    MeProcuraCodProduto: TMaskEdit;
    EdNumNFe: TEdit;
    Label51: TLabel;
    DBLCCClasTribIBSCBSVenda: TDBLookupComboBox;
    DBLCCClasTribIBSCBSCompra: TDBLookupComboBox;
    Label52: TLabel;
    Label53: TLabel;
    procedure sbCarregaArquivoClick(Sender: TObject);
    procedure btConsultaNotaClick(Sender: TObject);
    procedure MEArquivoXMLChange(Sender: TObject);
    procedure btAvancarClick(Sender: TObject);
    procedure CadastraFornecedor;
    procedure FormActivate(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FmSerie1MeSerieExit(Sender: TObject);
    procedure FmOperacao1MeOperacaoExit(Sender: TObject);
    procedure FmSerie1MeSerieChange(Sender: TObject);
    procedure FmOperacao1MeOperacaoChange(Sender: TObject);
    procedure FmOperacao1BtOperacaoClick(Sender: TObject);
    procedure btConcluirClick(Sender: TObject);
    procedure MEProcurarEnter(Sender: TObject);
    procedure MEProcurarExit(Sender: TObject);
    procedure MeProcurarFabricanteEnter(Sender: TObject);
    procedure MeProcurarFabricanteExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TabSheet3Show(Sender: TObject);
    procedure meCfopSTChange(Sender: TObject);
    procedure MEProcurarChange(Sender: TObject);
    procedure MeProcurarFabricanteChange(Sender: TObject);
    procedure cbNCMClick(Sender: TObject);
    procedure cbFabricanteClick(Sender: TObject);
    procedure btCompletaProdutoClick(Sender: TObject);
    procedure DBGProdutoAusenteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure MEProcurarClick(Sender: TObject);
    procedure cbCodBarrasClick(Sender: TObject);
    procedure btSalvaItemBDClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBLCCstIpiEntradaCloseUp(Sender: TObject);
    procedure DBLCCstIpiSaidaCloseUp(Sender: TObject);
    procedure DBLCCstPisEntradaCloseUp(Sender: TObject);
    procedure DBLCCstPisSaidaCloseUp(Sender: TObject);
    procedure DBLCCstCofinsEntradaCloseUp(Sender: TObject);
    procedure DBLCCstCofinsSaidaCloseUp(Sender: TObject);
    procedure DSProdutoAusenteDataChange(Sender: TObject; Field: TField);
    procedure btVincularProdutoClick(Sender: TObject);
    procedure btDesvincularProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FmClasse1Enter(Sender: TObject);
    procedure FmTributacao1Enter(Sender: TObject);
    procedure MeProcurarFabricanteClick(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure cbMasculinoClick(Sender: TObject);
    procedure cbFemininoClick(Sender: TObject);
    procedure cbUnissexClick(Sender: TObject);
    procedure cbAdultoClick(Sender: TObject);
    procedure cbInfantilClick(Sender: TObject);
    procedure cbBebeClick(Sender: TObject);
    procedure cbAltoClick(Sender: TObject);
    procedure cbBaixoClick(Sender: TObject);
    procedure cbMedioClick(Sender: TObject);
    procedure cbRasteiraClick(Sender: TObject);
    procedure cbGrossoClick(Sender: TObject);
    procedure cbFinoClick(Sender: TObject);
    procedure cbAnabelaClick(Sender: TObject);
    procedure cbFacheteClick(Sender: TObject);
    procedure cbEncapadoClick(Sender: TObject);
    procedure cbCorticaClick(Sender: TObject);
    procedure cbAcrilicoClick(Sender: TObject);
    procedure cbLatexClick(Sender: TObject);
    procedure cbBorrachaClick(Sender: TObject);
    procedure cbPVCClick(Sender: TObject);
    procedure cbTRClick(Sender: TObject);
    procedure cbCouroClick(Sender: TObject);
    procedure cbSinteticoClick(Sender: TObject);
    procedure cbSwedClick(Sender: TObject);
    procedure cbMicrofibraClick(Sender: TObject);
    procedure cbVernizClick(Sender: TObject);
    procedure cbLonaClick(Sender: TObject);
    procedure cbTecidoClick(Sender: TObject);
    procedure cbGliterClick(Sender: TObject);
    procedure cbCamurcaClick(Sender: TObject);
    procedure cbNobukClick(Sender: TObject);
    procedure cbElasticoClick(Sender: TObject);
    procedure cbPlasticoClick(Sender: TObject);
    procedure DBGProdutoAusenteAristidesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBPanel4CodigoChange(Sender: TObject);
    procedure DBPanel5CodigoChange(Sender: TObject);
    procedure btConfirmarProdutoAristidesClick(Sender: TObject);
    procedure PCProdutosAristidesChange(Sender: TObject);
    procedure btConfirmarProdutoAristidesConfigClick(Sender: TObject);
    procedure cbBonecaClick(Sender: TObject);
    procedure cbDorsaiClick(Sender: TObject);
    procedure cbSlipperClick(Sender: TObject);
    procedure cbEsportivaClick(Sender: TObject);
    procedure cbIateClick(Sender: TObject);
    procedure cbOverClick(Sender: TObject);
    procedure cbCampoClick(Sender: TObject);
    procedure cbSuicoSocietyClick(Sender: TObject);
    procedure cbTiraTornozeloClick(Sender: TObject);
    procedure cbSalomeClick(Sender: TObject);
    procedure cbDedoClick(Sender: TObject);
    procedure cbEstreitoClick(Sender: TObject);
    procedure cb2TirasClick(Sender: TObject);
    procedure cbMuleClick(Sender: TObject);
    procedure cbCoturnoClick(Sender: TObject);
    procedure cbMontariaClick(Sender: TObject);
    procedure cbOpenbootClick(Sender: TObject);
    procedure cbCanoMedioClick(Sender: TObject);
    procedure cbMedioConfigClick(Sender: TObject);
    procedure cb2AlcasClick(Sender: TObject);
    procedure cbTransversalClick(Sender: TObject);
    procedure cbBauClick(Sender: TObject);
    procedure cbNotebookClick(Sender: TObject);
    procedure cbFestaClick(Sender: TObject);
    procedure cbClutchClick(Sender: TObject);
    procedure cbKitClick(Sender: TObject);
    procedure cbSliponClick(Sender: TObject);
    procedure cbEscolarClick(Sender: TObject);
    procedure cbViagemClick(Sender: TObject);
    procedure cb360Click(Sender: TObject);
    procedure cbGaspeaClick(Sender: TObject);
    procedure cbProtecaoSolarClick(Sender: TObject);
    procedure cbMangaLongaClick(Sender: TObject);
    procedure cbMangaCurtaClick(Sender: TObject);
    procedure cbTermicaClick(Sender: TObject);
    procedure cbAnklebootClick(Sender: TObject);
    procedure cbIndoorSalaoClick(Sender: TObject);
    procedure cb2RodasClick(Sender: TObject);
    procedure cb4RodasClick(Sender: TObject);
    procedure cb5RodasClick(Sender: TObject);
    procedure cbLargoClick(Sender: TObject);
    procedure cbTiraXClick(Sender: TObject);
    procedure DBMDescProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btExcluirProdutoAristidesClick(Sender: TObject);
    procedure DBPProdutoLoteItemNumeroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel12DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBProdutoLoteItemRemoverClick(Sender: TObject);
    procedure BtnProdutoLoteInserirClick(Sender: TObject);
    procedure DBEProdutoLoteItemQuantiaExit(Sender: TObject);
    procedure cbChunkyClick(Sender: TObject);
    procedure cbSneakerClick(Sender: TObject);
    procedure cbOxfordClick(Sender: TObject);
    procedure MEArquivoXMLKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGProdutoAusenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet4Show(Sender: TObject);
    procedure BTBaixarInfXmlSefaClick(Sender: TObject);
    procedure BTBuscarInfXmlSefaClick(Sender: TObject);
    procedure DsInfXmlSefaDataChange(Sender: TObject; Field: TField);
    procedure FmFilial1MeFilialExit(Sender: TObject);
    procedure MeChaveAcessoChange(Sender: TObject);
    procedure MeChaveAcessoExit(Sender: TObject);
    procedure MeProcuraCodProdutoEnter(Sender: TObject);
    procedure MeProcuraCodProdutoExit(Sender: TObject);
    procedure MeProcuraCodProdutoChange(Sender: TObject);
    procedure DBLCCClasTribIBSCBSDropDown(Sender: TObject);
  private
    { Private declarations }
    indexTabSheet : array of Integer;
    itensNota :TStringList;
    itensXML :TStringList;
    itensXMLNomeNcm :TStringList;
    serieNota :String;
    count :Integer;
    chaveAcesso :String;
    codFor :Integer;
    cnpjFor :String;
    nomeFor :String;
    fantFor :String;
    lgrFor :String;
    nroFor :String;
    bairroFor :String;
    cMunFor :String;
    munFor :String;
    ufFor :String;
    cUfFor :String;
    cepFor :String;
    cPaisFor :String;
    paisFor :String;
    foneFor :String;
    ieFor :String;
    xProd :String;
    cProd :String;
    ncm :String;
    cfop :String;
    qtProduto :String;
    valTotalProd :Double;
    serie :String;
    cnpjFilial :String;
    codOperacao :Integer;
    infCpl :String;
    nNF :Integer;
    codFilial :Integer;
    indPag :String;
    dtEmi :String;
    dtSaiEnt :String;
    xml :String;
    codOrdemCompra: integer;
    valDesconto :Double;
    valDespesa: Double;
    qtItensXML: Integer;
    qtItensVinculados: Integer;
    temSubst: Boolean;
    temCST020: Boolean;
    temCSOSN103: Boolean;
    arrProdutoNfe :TArrProdutoNfe;
    notaComST: Boolean;
    valTotalICMSDest: double;
    valTotalICMSRemet: double;
    clicouConsulta: boolean;
    FAvancandoAutomaticamente: Boolean;
    FClassTribIBSCBSVendaPorItem: TStringList;
    FClassTribIBSCBSCompraPorItem: TStringList;
    procedure SalvaClassTribIBSCBSProdutoAtual;
    procedure CarregaClassTribIBSCBSProdutoAtual;
    procedure VerificaConsulta(Sender: TObject; Tentativa: Integer;
      Parametros: TVariantMap; var Acao: TExecucaoAction; var Msg: String);
    procedure LeArquivoXML;
    procedure ChecaFornecedor;
    procedure GerenciaTabSheets(qtMover :Integer; voltar :Boolean = false);
    procedure InverteSelecaoItem;
    procedure SetSelecaoItem(Sel: String = 'NAO');
    function ProdutosSemCadastro :Integer;
    function NcmUnicoRegistro(pNcm :String) :Boolean;
    procedure AdicionaItemNotaEntrada;
    procedure CadastraSerie;
    procedure HabilitaBtConcluir;
    function ConsultaFilial: boolean;
    procedure ChecaProdutosVinculados;
    function VinculoSomentePorNCM: Boolean;
    procedure SincronizaProdutosAssociadosPorNCM;
    procedure AtualizaQtItensVinculados(pOperacao: string);
    procedure AtualizaQtItensXML(pOperacao: string);
    procedure VinculaProdutosCodBarra;
    procedure VinculaProdutosFabricante;
    procedure VinculaProdutosProdutoVinculado;
    function TemProdutoVinculado: boolean;
    procedure SetaPropriedadeRelacionamentoAutomatico;
    procedure gerenciaCheckBox(checkBox: TObject; tabela: string);
    procedure LimpaCheckBox;
    procedure BuscaDadosCalcados;
    function CadastraProdutoAusente(cadastraTodos: boolean = true): boolean;
    function AlteraProduto: boolean;
    procedure XmlCProdDuplicado;
    procedure GeraBackupProdutoAusente;
    procedure WMAvancarAposVinculo(var Msg: TMessage); message WM_USER + 1;
    procedure GerenciaTabSheetIndex(targetIndex: Integer);
  public
    { Public declarations }
    procedure RetiraItemNota(pCodigo :String; pProdutoXML :String; pCProdXML :String;
      pItem: String);
    procedure AdicionaItemNota;
    property pSerieNota :String read serieNota write serieNota;
    property pChaveAcesso :String read chaveAcesso write chaveAcesso;
    property pCodFor :Integer read codFor write codFor;
    property pCodOperacao :Integer read codOperacao write codOperacao;
    property pInfCpl :String read infCpl write infCpl;
    property pItensNota :TArrProdutoNfe read arrProdutoNfe write arrProdutoNfe;
    property pNnf :Integer read nNF write nNF;
    property pCodFilial :Integer read codFilial write codFilial;
    property pCNPJFilial :String read cnpjFilial write cnpjFilial;
    property pIndPag :String read indPag write indPag;
    property pDtEmi :String read dtEmi write dtEmi;
    property pDtSaiEnt :String read dtSaiEnt write dtSaiEnt;
    property pXml :String read xml write xml;
    property pValDesconto :Double read valDesconto write valDesconto;
    property pValDespesa: Double read valDespesa write valDespesa;
    property pTemSubst: Boolean read temSubst write temSubst;
    property pTemCST020: Boolean read temCST020 write temCST020;
    property pTemCSOSN103: Boolean read temCSOSN103 write temCSOSN103;
    property pValTotalICMSDest: double read valTotalICMSDest write valTotalICMSDest;
    property pValTotalICMSRemet: double read valTotalICMSRemet write valTotalICMSRemet;
    property pClicouConsulta: boolean read clicouConsulta write clicouConsulta;
    property pCodOrdemCompra: integer read codOrdemCompra write codOrdemCompra;
  end;

var
  FImportacaoNfe: TFImportacaoNfe;
  produtoNfe :TProdutoNfe;
  wProdutoSemCadastro: integer;
  wProdutoVinculado: integer;
  arrProdutoNfe : Array of TProdutoNfe;
  wCDSProdutoAusenteRecNo: integer;

implementation

uses UAguardoNfe, UNFe_cl, UNFeRetorno, UUsuario_cl, UOracle_cl, Math,
  UBibCompra, UParamSistema_cl, DateUtils, UProdutoCons, UProduto_cl,
  UClasseCons, UTributacaoCons, UMarcaCons, UFilialCons, UTipoLoteCons,
  UFilial_cl;

{$R *.dfm}

procedure TFImportacaoNfe.DBLCCClasTribIBSCBSDropDown(Sender: TObject);
begin
  with DMProduto do
  begin
    QClassTribIBSCBS.Close;
    QClassTribIBSCBS.Open;
  end;
end;
procedure TFImportacaoNfe.SalvaClassTribIBSCBSProdutoAtual;
var
  wItem: string;
begin
  if (FClassTribIBSCBSVendaPorItem = nil) or
    (FClassTribIBSCBSCompraPorItem = nil) or
    (not DMNfe.cdsProdutoAusente.Active) or DMNfe.cdsProdutoAusente.IsEmpty then
    Exit;

  wItem := DMNfe.cdsProdutoAusentenum_item.Text;
  if VarIsNull(DBLCCClasTribIBSCBSVenda.KeyValue) then
    FClassTribIBSCBSVendaPorItem.Values[wItem] := ''
  else
    FClassTribIBSCBSVendaPorItem.Values[wItem] := VarToStr(DBLCCClasTribIBSCBSVenda.KeyValue);

  if VarIsNull(DBLCCClasTribIBSCBSCompra.KeyValue) then
    FClassTribIBSCBSCompraPorItem.Values[wItem] := ''
  else
    FClassTribIBSCBSCompraPorItem.Values[wItem] := VarToStr(DBLCCClasTribIBSCBSCompra.KeyValue);
end;

procedure TFImportacaoNfe.CarregaClassTribIBSCBSProdutoAtual;
var
  wItem, wValor: string;
begin
  if (FClassTribIBSCBSVendaPorItem = nil) or
    (FClassTribIBSCBSCompraPorItem = nil) or
    (not DMNfe.cdsProdutoAusente.Active) or DMNfe.cdsProdutoAusente.IsEmpty then
    Exit;

  wItem := DMNfe.cdsProdutoAusentenum_item.Text;
  wValor := FClassTribIBSCBSVendaPorItem.Values[wItem];
  if wValor = '' then
    DBLCCClasTribIBSCBSVenda.KeyValue := Null
  else
    DBLCCClasTribIBSCBSVenda.KeyValue := StrToInt(wValor);

  wValor := FClassTribIBSCBSCompraPorItem.Values[wItem];
  if wValor = '' then
    DBLCCClasTribIBSCBSCompra.KeyValue := Null
  else
    DBLCCClasTribIBSCBSCompra.KeyValue := StrToInt(wValor);
end;
function TFImportacaoNfe.VinculoSomentePorNCM: Boolean;
begin
  Result := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM')
    and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'NAO')
    and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'NAO');
end;

procedure TFImportacaoNfe.SincronizaProdutosAssociadosPorNCM;
var
  wAssociado: Boolean;
begin
  if not VinculoSomentePorNCM then
    Exit;

  with DMNfe do
  begin
    cdsProdutoXML.DisableControls;
    cdsProdutoNcmDuplicado.DisableControls;
    try
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof do
      begin
        wAssociado := cdsProdutoNcmDuplicado.Locate('cprod_xml;item',
          VarArrayOf([cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value]), []);
        if cdsProdutoXMLAssociado.Value <> wAssociado then
        begin
          cdsProdutoXML.Edit;
          cdsProdutoXMLAssociado.Value := wAssociado;
          cdsProdutoXML.Post;
        end;
        cdsProdutoXML.Next;
      end;

      // Posiciona no primeiro item que ainda precisa ser relacionado.
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof and cdsProdutoXMLAssociado.Value do
        cdsProdutoXML.Next;
      if cdsProdutoXML.Eof then
        cdsProdutoXML.First;
    finally
      cdsProdutoNcmDuplicado.EnableControls;
      cdsProdutoXML.EnableControls;
    end;
  end;
end;

procedure TFImportacaoNfe.ChecaProdutosVinculados;
begin
  with DMNfe do
    Self.btnAvancar.Enabled := (cdsProdutoNcmDuplicado.RecordCount = cdsProdutoXML.RecordCount);
  if FAvancandoAutomaticamente then
    Exit;
  if (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'SIM')    and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'NAO')
    and (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'NAO') and (Self.btnAvancar.Enabled) then
  begin
    if PageControl1.ActivePageIndex <> -1 then
      btAvancarClick(Self);
  end;
  Application.ProcessMessages;
end;

function TFImportacaoNfe.ConsultaFilial: boolean;
var
  i: Integer;
begin
  codFilial := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ_FILIAL',[cnpjFilial]);
  if DMNfe.cdsProdutoBD.Active then
    DMNfe.cdsProdutoBD.Close;
  for i := 0 to DMNfe.QProdutoBD.SQL.Count - 1 do
    if Pos('AND E.COD_FILIAL =', UpperCase(DMNfe.QProdutoBD.SQL[i])) > 0 then
      DMNfe.QProdutoBD.SQL[i] := '          AND E.COD_FILIAL = ' + IntToStr(codFilial) +
        '), 0) QT_ESTOQUE';
  result := (codFilial > 0);
  if codFilial = 0 then
  begin
    MessageDlg('A filial com o CNPJ ' + cnpjFilial + ' não pode ser encontrada.' + #13#10 +
    'Verifique se o CNPJ da NF-e esta correto e se esta NF-e foi realmente emitida para sua empresa.',
      mtError, [mbOk], 0);
  end;
end;

procedure TFImportacaoNfe.HabilitaBtConcluir;
begin
  btConcluir.Enabled := ((FmSerie1.MeSerie.Text <> '') and (trim(FmOperacao1.MeOperacao.Text) <> ''));
  if (Trim(meCfopST.Text) = '') and (notaComST) then
    btConcluir.Enabled := false;
  if (Trim(FmSerie1.MeSerie.Text) <> '') and (Trim(FmOperacao1.MeOperacao.Text) <> '') and (notaComST) then
    pMensagem.Visible := true;
  if (Trim(FmSerie1.MeSerie.Text) <> '') and (Trim(FmOperacao1.MeOperacao.Text) <> '') and (meCfopST.Text <> '') and (notaComST) then
    pMensagem.Visible := false;
  if not notaComST then
    pMensagem.Visible := false;
  Application.processMessages;
end;

procedure TFImportacaoNfe.CadastraSerie;
var
  wSql :String;
  buscador :TBuscador;
begin
  buscador := TBuscador.Create;
  if codFilial > 0 then
  begin
    wSql := 'SELECT COUNT(*) FROM TB_SERIE WHERE COD_SERIE LIKE '+ serie;
    wSql := wSql + ' AND COD_FILIAL = ' + IntToStr(codFilial);
    wSql := wSql + ' AND COD_SERIE_MODELO = ' + quotedStr('55');
    buscador.Limpa;
    buscador.Adiciona(wSql);
    buscador.Buscar(true);
    if buscador.Proximo = '0' then
    begin
      with DMOracle do
      begin
        wSql := '';
        wSql := 'INSERT INTO TB_SERIE(COD_SERIE, NUM_SERIE, COD_FILIAL, ';
        wSql := wSql + 'COD_SERIE_MODELO) VALUES (';
        wSql := wSql + quotedStr(serie) + ', 0, ' + IntToStr(codFilial) + ', ' + quotedStr('55') + ' )';
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add(wSql);
        try
          DBCemapa.StartTransaction;
          QExecSQL.ExecSQL;
          DBCemapa.Commit;
          serieNota := serie;
          FmSerie1.MeSerie.Text := serie;
        except
          DBCemapa.Rollback;
          MessageDlg('Série não pode ser cadastrada', mtError, [mbOk], 0);
          serieNota := '';
          Abort;
        end;
      end;
    end
    else
      FmSerie1.MeSerie.Text := serie;
  end
  else
    FmSerie1.EdSerie.Text := 'Não foi encontrada uma filial com o cnpj '+ cnpjFilial + '. Série não pode ser cadastrada automaticamente';
end;

procedure TFImportacaoNfe.AdicionaItemNotaEntrada;
var
  i,j :Integer;
  existe :Boolean;
  wCodigo, str1, str2 :String;
  buscador :TBuscador;
  ncmXml, ncmBD :String;
  produto :String;
  linha :String;
  prodXml, itemXml, prodBD :String;
  itemBD: string;
begin
  existe := false;
  buscador := TBuscador.Create;
  wCodigo := '';
  itensNota.Clear;
  ncm := '';
  produto := '';
  linha := '';
  prodXml := '';
  prodBD := '';
  ncmXml := '';
  ncmBD := '';
  itemXml := '';
  itemBD := '';

  with DMNfe do   //Produtos com ncm duplicados
  begin
    cdsProdutoNcmDuplicado.First;
    while not cdsProdutoNcmDuplicado.Eof do
    begin
      prodXml := Trim(cdsProdutoNcmDuplicadodesc_produto_xml.Value);
      ncmXml :=  Trim(cdsProdutoNcmDuplicadoncm.Text);
      itemXml := Trim(cdsProdutoNcmDuplicadoItem.Text);
      for j:=0 to Length(arrProdutoNfe) - 1 do
      begin
        prodBD := Trim(arrProdutoNfe[j].pDescricao);
        ncmBD := Trim(arrProdutoNfe[j].ncm);
        itemBD := Trim(arrProdutoNfe[j].item);
        if ((CompareStr(ncmBD, ncmXml) = 0) and (CompareStr(prodBD, prodXml) = 0) and (CompareStr(itemBD, itemXml) = 0))
          or
          ( (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'SIM') and
            (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'NAO') and
            (CompareStr(Trim(arrProdutoNfe[j].numFabricante), cdsProdutoNcmDuplicadocprod_xml.Value) = 0) )
          or
          // Comparacao adicional por NCM e Item para produtos cadastrados
          ((CompareStr(ncmBD, ncmXml) = 0) and (CompareStr(itemBD, itemXml) = 0)) then
        begin
          arrProdutoNfe[j].codigo := cdsProdutoNcmDuplicadocodigo.Value;
          if (DMParamSistema.CodEmpresa = 'DINIZ') and ((arrProdutoNfe[j].cfop = '5652') or (arrProdutoNfe[j].cfop = '5655')) then// or (Copy(arrProdutoNfe[j].cfop,2,3) = '655') then
            arrProdutoNfe[j].cfop := '1652'   //Junior 08/02/2023
          else if (DMParamSistema.CodEmpresa = 'DINIZ') and ((arrProdutoNfe[j].cfop = '6652') or (arrProdutoNfe[j].cfop = '6655')) then
            arrProdutoNfe[j].cfop := '2652'
          else
          begin
            if (meCfopST.Enabled) and (trim(meCfopST.Text) <> '') and (arrProdutoNfe[j].temSubst) then
              arrProdutoNfe[j].cfop := trim(meCfopST.Text);
          end;
        end;
      end;
      cdsProdutoNcmDuplicado.Next;
    end;
  end;

  //Verificacoes
  if (DMParamSistema.QParamSistemaIND_ATUALIZA_NCM_PELO_XML.Value = 'NAO') then
  begin
    if(IntToStr(Length(arrProdutoNfe)) <> IntToStr(itensXML.Count)) then
    begin
      MessageDlg('Por algum motivo o sistema não conseguiu reconhecer todos os produtos',
        mtError, [mbOk],0);
      Abort;
    end;
    for i:=0 to length(arrProdutoNfe) - 1 do   //Verifica se existe produto sem codigo
    begin
      if arrProdutoNfe[i].codigo = 0 then
      begin
        MessageDlg('O produto com ncm: ' + arrProdutoNfe[i].ncm + ' não foi encontrado no sistema', mtError, [mbOk],0);
        Abort;
      end;
    end;
  end;
end;

function TFImportacaoNfe.NcmUnicoRegistro(pNcm :String) :Boolean;
var
  buscador :TBuscador;
  wQtReg :Integer;
begin
  buscador := TBuscador.Create;
  buscador.Limpa;
  buscador.Adiciona('SELECT COUNT (*) FROM TB_PRODUTO WHERE NUM_GENERO_NCM = '+ quotedStr(trim(pNcm)));
  buscador.Buscar(true);
  wQtReg := StrToInt(buscador.Proximo);
  result :=  (wQtReg > 1) or (wQtReg = 0);  //se nao tiver nenhum registro deve retornar true tambem
end;

function TFImportacaoNfe.ProdutosSemCadastro :Integer;
var
  wProdutos :TStringList;
  busador :TBuscador;
  wNcm :String;
  wNumFabricante: String;
  wCodBarra: String;
  wCprod: String;
  wProdutoEncontrado: Boolean;
  i,res: Integer;
  wSql: String;
  wCondicao: boolean;
begin
  with DMNfe do
  begin
    cdsProdutoAusente.DisableControls;
    cdsProdutoAusenteBackup.First;
    cdsProdutoAusente.EmptyDataSet;
    //Volta o cdsprodutoausente ao estado original
    while not DMNfe.cdsProdutoAusenteBackup.Eof do
    begin
      DMNfe.cdsProdutoAusente.Append;
      DMNfe.cdsProdutoAusentenum_item.Value := DMNfe.cdsProdutoAusenteBackupnum_item.Value;
      DMNfe.cdsProdutoAusentecod_produto.Value := DMNfe.cdsProdutoAusenteBackupcod_produto.Value;
      DMNfe.cdsProdutoAusentecod_classe.Value := DMNfe.cdsProdutoAusenteBackupcod_classe.Value;
      DMNfe.cdsProdutoAusentecod_tributacao.Value := DMNfe.cdsProdutoAusenteBackupcod_tributacao.Value;
      DMNfe.cdsProdutoAusentedesc_produto.Value := DMNfe.cdsProdutoAusenteBackupdesc_produto.Value;
      DMNfe.cdsProdutoAusentenum_embalagem.Value := DMNfe.cdsProdutoAusenteBackupnum_embalagem.Value;
      DMNfe.cdsProdutoAusentedesc_unidade.Value := DMNfe.cdsProdutoAusenteBackupdesc_unidade.Value;
      DMNfe.cdsProdutoAusenteind_tipo_produto.Value := DMNfe.cdsProdutoAusenteBackupind_tipo_produto.Value;
      DMNfe.cdsProdutoAusentecprod.Value := DMNfe.cdsProdutoAusenteBackupcprod.Value;
      DMNfe.cdsProdutoAusentenum_fabricante.Value := DMNfe.cdsProdutoAusenteBackupnum_fabricante.Value;
      DMNfe.cdsProdutoAusenteperc_iss.Value := DMNfe.cdsProdutoAusenteBackupperc_iss.Value;
      DMNfe.cdsProdutoAusenteind_situacao.Value := DMNfe.cdsProdutoAusenteBackupind_situacao.Value;
      DMNfe.cdsProdutoAusentenum_volumes.Value := DMNfe.cdsProdutoAusenteBackupnum_volumes.Value;
      DMNfe.cdsProdutoAusentenum_genero_ncm.Value := DMNfe.cdsProdutoAusenteBackupnum_genero_ncm.Value;
      DMNfe.cdsProdutoAusentedesc_cod_barra.Value := DMNfe.cdsProdutoAusenteBackupdesc_cod_barra.Value;
      DMNfe.cdsProdutoAusenteind_subst_trib.Value := DMNfe.cdsProdutoAusenteBackupind_subst_trib.Value;
      DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := TemProdutoVinculado;
      DMNfe.cdsProdutoAusenteind_solado.Value := DMNfe.cdsProdutoAusenteBackupind_solado.Value;
      DMNfe.cdsProdutoAusenteind_bico.Value := DMNfe.cdsProdutoAusenteBackupind_bico.Value;
      DMNfe.cdsProdutoAusentedesc_time.Value := DMNfe.cdsProdutoAusenteBackupdesc_time.Value;
      DMNfe.cdsProdutoAusentedesc_esporte.Value := DMNfe.cdsProdutoAusenteBackupdesc_esporte.Value;
      DMNfe.cdsProdutoAusenteind_enfeite.Value := DMNfe.cdsProdutoAusenteBackupind_enfeite.Value;
      DMNfe.cdsProdutoAusentecod_lote_tipo.Value := DMNfe.cdsProdutoAusenteBackupcod_lote_tipo.Value;
      DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := DMNfe.cdsProdutoAusenteBackupind_cadastrado_bd.Value;
      if DMNfe.cdsProdutoAusenteBackupcod_marca.Value > 0 then
        DMNfe.cdsProdutoAusentecod_marca.Value := DMNfe.cdsProdutoAusenteBackupcod_marca.Value;
      DMNfe.cdsProdutoAusentecod_cst_ipi.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_ipi.Value;
      DMNfe.cdsProdutoAusentecod_cst_ipi_saida.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_ipi_saida.Value;
      DMNfe.cdsProdutoAusentecod_cst_pis.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_pis.Value;
      DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_pis_saida.Value;
      DMNfe.cdsProdutoAusentecod_cst_cofins.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_cofins.Value;
      DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value := DMNfe.cdsProdutoAusenteBackupcod_cst_cofins_saida.Value;
      DMNfe.cdsProdutoAusentedesc_produto_aux.Value := DMNfe.cdsProdutoAusenteBackupdesc_produto_aux.Value;
      DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := DMNfe.cdsProdutoAusenteBackupind_vinculo_produto_bd.Value;
      DMNFE.cdsProdutoAusentecfop.Value := DMNfe.cdsProdutoAusenteBackupcfop.Value;
      DMNfe.cdsProdutoAusente.Post;
      DMNfe.cdsProdutoAusenteBackup.Next;
    end;

    cdsProdutoAusente.First;
    while not cdsProdutoAusente.Eof do
    begin
      buscador := TBuscador.Create;
      wNcm := quotedStr(Trim(cdsProdutoAusentenum_genero_ncm.Value));
      wNumFabricante := quotedStr(Trim(cdsProdutoAusentenum_fabricante.Value));
      wCodBarra := quotedStr(Trim(cdsProdutoAusentedesc_cod_barra.Value));
      buscador.Limpa;
      wCondicao := false;

      // Ao abrir a tela faz essa consulta
      if (not cbNCM.Checked) and (not cbFabricante.Checked) and (not cbCodBarras.Checked) then
      begin
        cbNCM.Checked := true;
        cbFabricante.Checked := true;
        cbCodBarras.Checked := true;
        buscador.Adiciona('SELECT COUNT (*) FROM TB_PRODUTO WHERE NUM_GENERO_NCM = '+
          wNcm +
          ' AND IND_SITUACAO = ' + quotedStr('ATIVO'));
        buscador.Adiciona('SELECT COUNT (*) FROM TB_PRODUTO WHERE NUM_FABRICANTE = '+
          wNumFabricante +
          ' AND IND_SITUACAO = ' + quotedStr('ATIVO'));
        buscador.Adiciona('SELECT COUNT (*) FROM TB_PRODUTO WHERE DESC_COD_BARRA = '+
          wCodBarra +
          ' AND IND_SITUACAO = ' + quotedStr('ATIVO'));
      end
      else
      begin
        wSql := 'SELECT COUNT(*) FROM TB_PRODUTO WHERE';
        if cbNCM.Checked then
        begin
          wSql := wSql + ' NUM_GENERO_NCM LIKE ' + wNcm;
          wCondicao := true;
        end;
        if cbFabricante.Checked then
        begin
{Alterado para buscar na tabela tb_produtoxml_produtobd quando estiver marcado pelo Cod.Fabricante, pois em alguns clientes existe o codigo de fabricante e
o codigo do fornecedor para o mesmo produto. Alex 22/05/2025 }
          // Fabricante: procura primeiro no cadastro do produto, depois na tabela associativa e, por ultimo, permite vinculo manual por NCM.
          wSql := 'SELECT COUNT(*) FROM ('
            + ' SELECT P.COD_PRODUTO FROM TB_PRODUTO P'
            + ' WHERE (P.NUM_FABRICANTE LIKE ' + wNumFabricante
            + ' OR P.NUM_GENERO_NCM LIKE ' + wNcm + ')'
            + ' AND P.IND_SITUACAO = ' + QuotedStr('ATIVO')
            + ' UNION SELECT PXML.COD_PRODUTO FROM TB_PRODUTOXML_PRODUTOBD PXML'
            + ' INNER JOIN TB_PRODUTO P ON P.COD_PRODUTO = PXML.COD_PRODUTO'
            + ' WHERE PXML.CPROD LIKE ' + wNumFabricante
            + ' AND PXML.COD_FORNECEDOR_XML = ' + IntToStr(codFor)
            + ' AND P.IND_SITUACAO = ' + QuotedStr('ATIVO') + ')';
          wCondicao := true;
        end;
        if cbCodBarras.Checked then
        begin
          if(wCondicao) then
            wSql := wSql + ' OR P.DESC_COD_BARRA LIKE ' + wCodBarra
          else
            wSql := wSql + ' DESC_COD_BARRA LIKE ' + wCodBarra;
          wCondicao := true;
        end;
        if not cbFabricante.Checked then
          wSql := wSql + ' AND IND_SITUACAO = ' + quotedStr('ATIVO');
        buscador.Adiciona(wSql);
        wCondicao := false;
      end;

      // Personaliza as pesquias no B.D. conforme a empresa
      buscador := BibCompra.personalizaBuscaProdutoAusenteNFe(buscador
        , DMNfe.cdsProdutoAusentecod_produto.Text);

      buscador.Buscar(true);

      res := 0;
      res := StrToInt(buscador.Proximo);
      if buscador.TemProximo then
        res := StrToInt(buscador.Proximo);

      // Para ARISTIDES, devem permanecer todos os produtos da nota
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
        res := 0;

      // A pesquisa acima continua sendo usada para listar sugestoes ao usuario,
      // mas nao pode retirar o item da tela de cadastro por uma coincidencia de
      // NCM. Somente um produto identificado pelo fabricante/codigo de barras
      // ou por um vinculo do XML permite seguir sem cadastro manual.
      wProdutoEncontrado := False;
      wCprod := Trim(cdsProdutoAusentecprod.Value);

      if wCprod <> '' then
        wProdutoEncontrado := StrToIntDef(DMOracle.FastSelect('COUNT(*)', 'TB_PRODUTO', 'REPLACE(UPPER(NUM_FABRICANTE), ''-'', '''') = REPLACE(UPPER(' +
          QuotedStr(wCprod) + '), ''-'', '''') AND IND_SITUACAO = ' + QuotedStr('ATIVO')), 0) > 0;

      if (not wProdutoEncontrado) and (Trim(cdsProdutoAusentedesc_cod_barra.Value) <> '') then
        wProdutoEncontrado := StrToIntDef(DMOracle.FastSelect('COUNT(*)', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +
                              QuotedStr(Trim(cdsProdutoAusentedesc_cod_barra.Value)) + ' AND IND_SITUACAO = ' + QuotedStr('ATIVO')), 0) > 0;

      if (not wProdutoEncontrado) and (wCprod <> '') then
      begin
        wSql := 'PXML.CPROD = ' + QuotedStr(wCprod) + ' AND PXML.COD_FORNECEDOR_XML = ' + IntToStr(codFor);
        if DMParamSistema.CodEmpresa = 'ARISTIDES' then
          wSql := wSql + ' AND PXML.DESC_PRODUTO_XML = ' + QuotedStr(cdsProdutoAusentedesc_produto_aux.Value) + ' AND PXML.NUM_ITEM = ' +
                  cdsProdutoAusentenum_item.Text;
        wProdutoEncontrado := StrToIntDef(DMOracle.FastSelect('COUNT(*)', 'TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXML ' +
                              'ON P.COD_PRODUTO = PXML.COD_PRODUTO',wSql + ' AND P.IND_SITUACAO = ' + QuotedStr('ATIVO')), 0) > 0;
      end;

      if wProdutoEncontrado then
      begin
        if (cdsProdutoAusente.RecordCount > 0) and (not cdsProdutoAusenteind_vinculo_produto_bd.Value) then
        begin
          cdsProdutoAusente.Delete;
          cdsProdutoAusente.First;
          continue;
        end;
      end;
      cdsProdutoAusente.Next;
    end; 

    // Contador que armazena a quantidade de produtos vinculados no banco de dados
    wProdutoVinculado := 0;
    cdsProdutoAusente.First;
    while not cdsProdutoAusente.Eof do
    begin
      if cdsProdutoAusenteind_vinculo_produto_bd.Value then
        Inc(wProdutoVinculado);
      cdsProdutoAusente.Next;
    end;

    wProdutoSemCadastro := cdsProdutoAusente.RecordCount - wProdutoVinculado;
    result := cdsProdutoAusente.RecordCount - wProdutoVinculado;
    cdsProdutoAusente.First;
    cdsProdutoAusente.EnableControls;
  end;
end;

procedure TFImportacaoNfe.RetiraItemNota(pCodigo :String; pProdutoXML :String;
  pCProdXML :String; pItem: String);
var
  wAux :String;
  codigo :String;
  nome :String;
  cProd :String;
  item: String;
  i :Integer;
begin
    codigo := '';
    nome := '';
    cProd := '';
    item := '';
    with DMNfe do
    begin
      cdsProdutoNcmDuplicado.DisableControls;
      cdsProdutoNcmDuplicado.First;
      while not cdsProdutoNcmDuplicado.Eof do
      begin
        codigo := trim(cdsProdutoNcmDuplicadocodigo.Text);
        nome := cdsProdutoNcmDuplicadodesc_produto_xml.Text;
        cProd := cdsProdutoNcmDuplicadocprod_xml.Text;
        item := cdsProdutoNcmDuplicadoitem.Text;
        
        // O numero do item identifica de forma unica a linha dentro da NF-e.
        // Usa os demais campos apenas como compatibilidade para registros
        // antigos que eventualmente nao possuam o item preenchido.
        if ((Trim(pItem) <> '') and
            (CompareStr(Trim(item), Trim(pItem)) = 0)) or
           ((Trim(pItem) = '') and
            (CompareStr(codigo, Trim(pCodigo)) = 0) and
            (CompareStr(nome, pProdutoXML) = 0) and
            (CompareStr(Trim(cProd), Trim(pCprodXML)) = 0)) then
        begin
          cdsProdutoNcmDuplicado.Delete;
          AtualizaQtItensVinculados('-');
          // Delete ja posiciona o cursor no proximo registro.
        end
        else
          cdsProdutoNcmDuplicado.Next;
      end;
      cdsProdutoNcmDuplicado.EnableControls;
    end;
end;

procedure TFImportacaoNfe.AdicionaItemNota;
begin
  with DMNfe do
  begin
    cdsProdutoBd.DisableControls;
    cdsProdutoBd.First;
    while not cdsProdutoBd.Eof do
    begin
      RetiraItemNota(cdsProdutoBDCOD_PRODUTO.Text, cdsProdutoXMLproduto.Text,
        cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value);
      cdsProdutoBd.Next;
    end;
    cdsProdutoBd.First;
    while not cdsProdutoBd.Eof do
    begin
      if cdsProdutoBDCHECADO.Value = 'SIM' then
      begin
        cdsProdutoNcmDuplicado.Insert;
        cdsProdutoNcmDuplicadocodigo.Text := cdsProdutoBDCOD_PRODUTO.Text;
        cdsProdutoNcmDuplicadodesc_produto_bd.Text := cdsProdutoBDPRODUTO.Text;
        cdsProdutoNcmDuplicadodesc_produto_xml.Text := cdsProdutoXMLproduto.Text;
        cdsProdutoNcmDuplicadocprod_xml.Text := cdsProdutoXMLcprod.Text;
        cdsProdutoNcmDuplicadoitem.Value := cdsProdutoXMLitem.Value;
        if RGNCM.ItemIndex = 1 then
          cdsProdutoNcmDuplicadoncm.Value := cdsProdutoXMLncm.Value
        else
          cdsProdutoNcmDuplicadoncm.Value := cdsProdutoBDNCM.Value;
        cdsProdutoNcmDuplicado.Post;
        AtualizaQtItensVinculados('+');
      end;
      cdsProdutoBd.Next;
    end;
    ChecaProdutosVinculados;
    cdsProdutoBd.EnableControls;
  end;
end;

procedure TFImportacaoNfe.InverteSelecaoItem;
begin
  if DMNfe.cdsProdutoBDchecado.Value = 'SIM' then
    SetSelecaoItem('NAO')
  else
    SetSelecaoItem('SIM');
end;

procedure TFImportacaoNfe.SetSelecaoItem(Sel: String);
begin
  try
    if (DMNfe.cdsProdutoBDchecado.Value <> Sel) then
    begin
      if not (DMNfe.cdsProdutoBD.State in [DsEdit, DsInsert]) then
        DMNfe.cdsProdutoBD.Edit;
      DMNfe.cdsProdutoBDchecado.Value := Sel;
      if DMNfe.cdsProdutoBD.State in [DsEdit, DsInsert] then
        DMNfe.cdsProdutoBD.Post;
    end;
  except
    Raise;
  end;
end;


procedure TFImportacaoNfe.GerenciaTabSheets(qtMover :Integer; voltar :Boolean = false);
var
  index :Integer;
  proximaAba: TTabSheet;
begin
  index := 0;
  index := PageControl1.ActivePageIndex;
  if not voltar then
  begin
    indexTabSheet[count] := PageControl1.ActivePage.TabIndex;
    Inc(count);
    indexTabSheet[count] := PageControl1.Pages[index + qtMover].TabIndex;
    Inc(count);
    proximaAba := PageControl1.Pages[index + qtMover];
    proximaAba.TabVisible := true;
    PageControl1.ActivePage := proximaAba;
    PageControl1.Pages[index].TabVisible := false;
  end
  else
  begin
    proximaAba := PageControl1.Pages[index - qtMover];
    proximaAba.TabVisible := true;
    PageControl1.ActivePage := proximaAba;
    PageControl1.Pages[index].TabVisible := false;
    Dec(count);
  end;
  if PageControl1.ActivePage.Name = 'TabSheet1' then
  begin
    DMNfe.Pesquisar := false;
    DMNfe.cdsProdutoNcmDuplicado.EmptyDataSet;
  end
  else
  if PageControl1.ActivePage.Name = 'TabSheet2' then
    MECNPJ.SetFocus
  else
  if PageControl1.ActivePage.Name = 'TabSheet3' then
  begin
    ChecaProdutosVinculados;
    //DMNfe.cdsProdutoNcmDuplicado.EmptyDataSet;
    DMNfe.Pesquisar := true;
  end
  else
  if (PageControl1.ActivePage.Name = 'TabSheet4') and (not voltar) then // Produtos nao encontrados
  begin
    if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
      cbTipoProduto.ItemIndex := 19
    else
      cbTipoProduto.ItemIndex := 0;
    FmClasse1.MeClasse.Clear;
    FmClasse1.EdClasse.Clear;
    FmTributacao1.MeTributacao.Clear;
    FmTributacao1.EdTributacao.Clear;
    DBLCCstIpiEntrada.KeyValue := 0;
    DBLCCstIpiSaida.KeyValue := 0;
    DBLCCstPisEntrada.KeyValue := 0;
    DBLCCstPisSaida.KeyValue := 0;
    DBLCCstCofinsEntrada.KeyValue := 0;
    DBLCCstCofinsSaida.KeyValue := 0;
  end
  else
  if PageControl1.ActivePage.Name = 'TabSheet5' then
    FmSerie1.MeSerie.SetFocus
  else
  if (PageControl1.ActivePage.Name = 'TabSheet6') then
  begin
    PCProdutosAristides.ActivePageIndex := 0;
// Para rodar a programacao feita nos eventos do DSProdutoAusente
    DMNfe.cdsProdutoAusente.Next;
    DMNfe.cdsProdutoAusente.Prior;
    PageControl1.ActivePage.TabVisible := false;
    Dec(count); // desfaz o registro desta aba no historico
    PageControl1.Pages[index - 1].TabVisible := true;
  end;
end;

procedure TFImportacaoNfe.LeArquivoXML;
var
  nodeFornecedor :IXMLNode;
  Atributos :IXMLNodeList;
  nodeDet :IXMLNode;
  nodeDetAux :IXMLNode;
  nodeProduto :IXMLNode;
  nodeProdutoAux :IXMLNode;
  nodeImposto :IXMLNode;
  nodeSec :IXMLNode;
  nodeIde :IXMLNode;
  nodeDest :IXMLNode;
  nodeInfAdic :IXMLNode;
  nodeIpi :IXMLNode;
  nodeIpiTrib :IXMLNode;
  nodeVIpi :IXMLNode;
  nodePIpi: IXMLNode;
  nodeIcms :IXMLNode;
  nodeIcmsItens :IXMLNode;
  nodePis :IXMLNode;
  nodePisAliq :IXMLNode;
  bcPis: IXMLNode;
  basePis: Double;
  valPis :IXMLNode;
  pis: Double;
  percPis :IXMLNode;
  valPercPis: Double;
  nodeCofins :IXMLNode;
  nodeCofinsAliq :IXMLNode;
  bcCofins: IXMLNode;
  baseCofins: Double;
  valCofins :IXMLNode;
  Cofins: Double;
  percCofins :IXMLNode;
  valPercCofins: Double;
  nodeTotal :IXMLNode;
  nodeInfCpl :IXMLNode;
  nodeItem : IXMLNode;
  nodePag: IXMLNode; // NF-e 4.0
  nodeInfAdProd: IXMLNode;
  cdsProduto :TClientDataSet;
  wCont, i :Integer;
  xProdAux :String;
  ipi :Double;
  valBaseSubst: String;
  valSubst :String;
  percSubst :String;
  valBaseSTAnteriorRetido: String;
  valSTAnteriorRetido: String;
  percSTAnteriorRetido: String;
  item : variant;
  versaoNFe : String;
  cEAN :String;
  ncm :String;
  cfop :String;
  uCom :String;
  codProduto: integer;
  infAdProd: string;
  valBaseICMS : String;
  valICMS : String;
  nodeVDesc: IXMLNode;
  valDescontoProd: Double;
begin
  //inicializa as variaveis
  nodeFornecedor := Nil;
  Atributos := Nil;
  nodeDet := Nil;
  nodeDetAux := Nil;
  nodeProduto := Nil;
  nodeProdutoAux := Nil;
  nodeImposto := Nil;
  nodeSec := Nil;
  nodeIde := Nil;
  nodeDest := Nil;
  nodeInfAdic := Nil;
  nodeIpi := Nil;
  nodeIpiTrib := Nil;
  nodeVIpi := Nil;
  nodePIpi := Nil;
  nodeIcms := Nil;
  nodeIcmsItens := Nil;
  nodeTotal := Nil;
  nodeInfCpl := Nil;
  nodeItem := Nil;
  nodeInfAdProd := Nil;
  nodePis := Nil;
  nodePisAliq := Nil;
  bcPis := Nil;
  valPis := Nil;
  percPis := Nil;
  nodeCofins := Nil;
  nodeCofinsAliq := Nil;
  bcCofins := Nil;
  valCofins := Nil;
  percCofins := Nil;
  qtItensXML:= 0;
  qtItensVinculados:= 0;
  wCont := 0;
  xml := XMLDocument1.XML.Text;
  pValTotalICMSDest := 0;
  pValTotalICMSRemet := 0;
  infAdProd := '';

  //Chave de acesso
  //Atributos := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].AttributeNodes;
  //chaveAcesso := Atributos.Nodes['Id'].Text;
  if XMLDocument1.DocumentElement.NodeName <> 'nfeProc' then
  begin
    MessageDlg('Erro: Tag nfeProc inexistente neste documento.' + ' Este documento não esta em conformidade com o Layout da Distribuição NF-e.' +
      ' Entre em contato com o seu fornecedor.', mtError, [mbOk],0);
    Abort;
  end;
  chaveAcesso := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].GetAttributeNS('Id', '');
  //utilizado para pegar a versao do NFe(2.00 ou 3.10). Junior - 12/09/2014
  versaoNFe := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes['infNFe'].GetAttributeNS('versao', '');
  StatusBar1.Panels[0].Text := chaveAcesso;
  //Dados do fornecedor
  nodeFornecedor := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
    ChildNodes.FindNode('emit');
  cnpjFor   := nodeFornecedor.ChildNodes.Nodes['CNPJ'].Text;
  if cnpjFor = '' then
    cnpjFor   := nodeFornecedor.ChildNodes.Nodes['CPF'].Text;
  nomeFor   := nodeFornecedor.ChildNodes.Nodes['xNome'].Text;
  fantFor   := nodeFornecedor.ChildNodes.Nodes['xFant'].Text;
  ieFor     := nodeFornecedor.ChildNodes.Nodes['IE'].Text;
  lgrFor    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xLgr'].Text;
  nroFor    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['nro'].Text;
  bairroFor := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xBairro'].Text;
  cMunFor   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cMun'].Text;
  munFor    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xMun'].Text;
  ufFor     := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['UF'].Text;
  cepFor    := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['CEP'].Text;
  cPaisFor  := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['cPais'].Text;
  paisFor   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['xPais'].Text;
  foneFor   := nodeFornecedor.ChildNodes.Nodes['enderEmit'].ChildNodes.Nodes['fone'].Text;
  cUfFor    := copy(chaveAcesso,4,2);

  if cPaisFor = '' then
    cPaisFor := '1058'; //Brasil

  //Dados do produto
  itensXML.Clear;
  itensXMLNomeNcm.Clear;

  // Serve apenas para setar o tamanho do Array de produtos
  nodeDetAux := XMLDocument1.DocumentElement.ChildNodes['NFe'].childNodes.First.ChildNodes.FindNode('det');
  repeat
    nodeProdutoAux := nodeDetAux.ChildNodes['prod'];
    nodeProdutoAux.ChildNodes.First;
    repeat
      xProdAux := nodeProdutoAux.ChildNodes['xProd'].Text;
      if xProdAux <> '' then
        Inc(wCont);
      nodeProdutoAux := nodeProdutoAux.NextSibling;
    until nodeProdutoAux = Nil;
    nodeDetAux := nodeDetAux.NextSibling;
  until nodeDetAux = Nil;
  SetLength(arrProdutoNfe, wCont);
  //-------------------------------------------------------

  nodeDet := XMLDocument1.DocumentElement.ChildNodes['NFe'].childNodes.First.ChildNodes.FindNode('det');
  nodeSec := nodeDet;
  nodeSec.ChildNodes.First;

  DMNfe.cdsProdutoXML.EmptyDataSet;
  DMNfe.cdsProdutoAusente.EmptyDataSet;
  DMNfe.cdsProdutoAusenteBackup.EmptyDataSet;

  xProd := '';
  ncm := '';
  qtProduto := '';
  valTotalProd := 0;
  i := 0;
  item := '';
  itensXML.Clear;
  itensXMLNomeNcm.Clear;
  notaComST := false; //para verificar se a nota possui pelo menos 1 item com ST
  repeat
    item :=  nodeSec.GetAttributeNS('nItem','');
    nodeProduto := nodeSec.ChildNodes['prod'];
    nodeProduto.ChildNodes.First;
    nodeImposto := nodeSec.ChildNodes['imposto'];
    nodeIcms := nodeImposto.ChildNodes['ICMS'];
    nodeIpi := nodeImposto.ChildNodes.FindNode('IPI');
    nodePis := nodeImposto.ChildNodes['PIS'];
    nodeCofins := nodeImposto.ChildNodes['COFINS'];

    nodeInfAdProd := nodeSec.ChildNodes.FindNode('infAdProd');
    if nodeInfAdProd <> Nil then
    begin
      if Pos('<xProd>', nodeInfAdProd.XML) > 0 then
        infAdProd := copy(nodeInfAdProd.XML, 0,  Pos('<xProd>', nodeInfAdProd.XML)-1)
      else
        infAdProd := nodeInfAdProd.XML;
      if Pos('<infAdProd xmlns="http://www.portalfiscal.inf.br/nfe">', infAdProd) > 0 then
        infAdProd := copy(infAdProd, 55, Length(infAdProd))
      else
        infAdProd := nodeInfAdProd.XML;
    end
    else
      infAdProd := '';

    temSubst  := false;
    temCST020 := false;
    temCSOSN103 := False;

    if item = null then
      break;

//ClientDataSet que armazena informacoes de todos os itens. Depois sao excluidos os itens que ja existem no B.D. Os que sobrarem serao cadastrados no B.D. pelo sistema
    DMNfe.cdsProdutoAusente.Append;

    DMNfe.cdsProdutoAusentenum_item.Value := item;
    DMNfe.cdsProdutoAusentenum_embalagem.Value := 1;
    if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
      DMNfe.cdsProdutoAusenteind_tipo_produto.Value := 'VEICULO'
    else
      DMNfe.cdsProdutoAusenteind_tipo_produto.Value := 'COMERCIAL';
    DMNfe.cdsProdutoAusenteperc_inss.Value := 0;
    DMNfe.cdsProdutoAusenteind_situacao.Value := 'ATIVO';
    DMNfe.cdsProdutoAusentenum_volumes.Value := 1;
    DMNfe.cdsProdutoAusenteperc_iss.Value := 0;


    if nodeIcms <> Nil then
    begin
      if nodeIcms.ChildNodes.First <> Nil then
      begin
        nodeIcmsItens := nodeIcms.ChildNodes.First;
        //inicio     //importar VAL_ICMS E BASE_ICMS DO XML - Junior 25/02/2022
        if nodeIcmsItens.ChildNodes.FindNode('vBC') <> Nil then
          valBaseICMS := nodeIcmsItens.ChildNodes.FindNode('vBC').Text;
        if nodeIcmsItens.ChildNodes.FindNode('vICMS') <> Nil then
          valICMS := nodeIcmsItens.ChildNodes.FindNode('vICMS').Text;
        //fim
        if nodeIcmsItens.ChildNodes.FindNode('vBCST') <> Nil then
          valBaseSubst := nodeIcmsItens.ChildNodes.FindNode('vBCST').Text;
        if nodeIcmsItens.ChildNodes.FindNode('vICMSST') <> Nil then
          valSubst := nodeIcmsItens.ChildNodes.FindNode('vICMSST').Text;
        if nodeIcmsItens.ChildNodes.FindNode('pICMSST') <> Nil then
          percSubst := nodeIcmsItens.ChildNodes.FindNode('pICMSST').Text;
        if nodeIcmsItens.ChildNodes.FindNode('vBCSTRet') <> Nil then
          valBaseSTAnteriorRetido := nodeIcmsItens.ChildNodes.FindNode('vBCSTRet').Text;
        if nodeIcmsItens.ChildNodes.FindNode('vICMSSTRet') <> Nil then
          valSTAnteriorRetido := nodeIcmsItens.ChildNodes.FindNode('vICMSSTRet').Text;
        if nodeIcmsItens.ChildNodes.FindNode('pST') <> Nil then
          percSTAnteriorRetido := nodeIcmsItens.ChildNodes.FindNode('pST').Text;

        if (nodeIcmsItens.ChildNodes.FindNode('CST') <> Nil) then
          temCST020 := temCST020 or (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '20')
        else
          temCST020 := False;
        //verifica se item tem substituicao tributaria
        if nodeIcmsItens.ChildNodes.FindNode('CST') <> Nil then
        begin
          if (DMParamSistema.CodEmpresa = 'KREUZ') then
            temSubst := temSubst or
            ( ((nodeIcmsItens.ChildNodes.FindNode('CST').Text = '90') and (valBaseSubst <> '') ) or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '10') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '30') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '60') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '70'))
          else
            temSubst := temSubst or ((nodeIcmsItens.ChildNodes.FindNode('CST').Text = '10') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '30') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '60') or
              (nodeIcmsItens.ChildNodes.FindNode('CST').Text = '70'));
          if temSubst then
            DMNfe.cdsProdutoAusenteind_subst_trib.Value := 'NAO'
          else
            DMNfe.cdsProdutoAusenteind_subst_trib.Value := 'SIM';
        end;
        if nodeIcmsItens.ChildNodes.FindNode('CSOSN') <> Nil then
        begin
          temSubst := temSubst or ((nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '201') or
            (nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '202') or
            (nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '203') or
            (nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '500'));
          temCSOSN103 := temCSOSN103 or ((nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '101') or
            (nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '102') or
            (nodeIcmsItens.ChildNodes.FindNode('CSOSN').Text = '103'));
        end;

        if (temSubst) and (not notaComST) then
          notaComST := temSubst;
        if temSubst then
            DMNfe.cdsProdutoAusenteind_subst_trib.Value := 'NAO'
          else
            DMNfe.cdsProdutoAusenteind_subst_trib.Value := 'SIM';
      end;
    end;
    if nodeIpi <> Nil then
    begin
      nodeIpiTrib := nodeIpi.ChildNodes.FindNode('IPITrib');
      if nodeIpiTrib <> Nil then
      begin
        nodeVIpi := nodeIpiTrib.ChildNodes.FindNode('vIPI');
        if nodeVIpi <> Nil then
          ipi := StrToFloat(StringReplace((
            nodeVIpi.Text),'.',',',[rfIgnoreCase]));
        nodePIpi := nodeIpiTrib.ChildNodes.FindNode('pIPI');
        if nodePIpi <> Nil then
          DMNfe.cdsProdutoAusenteperc_ipi.Value :=  StrToFloat(StringReplace((
            nodePIpi.Text),'.',',',[rfIgnoreCase]));
      end;
    end;

    if nodePIS <> Nil then  // IMPORTAR VALORES DO PIS
    begin
      // Encontra no com dados do tributo
      nodePisAliq := nodePis.ChildNodes.FindNode('PISAliq');
      if nodePisAliq <> Nil then
      begin
        // Informacoes da base de calculo do PIS
        bcPIS := nodePisAliq.ChildNodes.FindNode('vBC');
        if bcPIS <> Nil then  //Se tem valor, converte para numero
          basePis := StrToFloat(StringReplace((
            bcPIS.Text),'.',',',[rfIgnoreCase]));

        // Dados do Percentual da aliquota do pis
        percPis := nodePisAliq.ChildNodes.FindNode('pPIS');
        if percPis <> Nil then  // Se tem valor, converte para numero
          valPercPis := StrToFloat(StringReplace((
            percPis.Text),'.',',',[rfIgnoreCase]));

        // Dados do Valor da aliquota do pis
        valPis := nodePisAliq.ChildNodes.FindNode('vPIS');
        if valPis <> Nil then  // Se tem valor, converte para numero
          pis := StrToFloat(StringReplace((
            valPis.Text),'.',',',[rfIgnoreCase]));
      end;
    end;

    if nodeCofins <> Nil then  // IMPORTAR VALORES DO Cofins
    begin
      // Encontra no com dados do tributo
      nodeCofinsAliq := nodeCofins.ChildNodes.FindNode('COFINSAliq');
      if nodeCofinsAliq <> Nil then
      begin
        // Informacoes da base de calculo do Cofins
        bcCofins := nodeCofinsAliq.ChildNodes.FindNode('vBC');
        if bcCofins <> Nil then  //Se tem valor, converte para numero
          baseCofins := StrToFloat(StringReplace((
            bcCofins.Text),'.',',',[rfIgnoreCase]));

        // Dados do Percentual da aliquota do Cofins
        percCofins := nodeCofinsAliq.ChildNodes.FindNode('pCOFINS');
        if percCofins <> Nil then  // Se tem valor, converte para numero
          valPercCofins := StrToFloat(StringReplace((
            percCofins.Text),'.',',',[rfIgnoreCase]));

        // Dados do Valor da aliquota do Cofins
        valCofins := nodeCofinsAliq.ChildNodes.FindNode('vCOFINS');
        if valCofins <> Nil then  // Se tem valor, converte para numero
          Cofins := StrToFloat(StringReplace((
            valCofins.Text),'.',',',[rfIgnoreCase]));
      end;
    end;
    repeat
      xProd := nodeProduto.ChildNodes['xProd'].Text;
      cProd := nodeProduto.ChildNodes['cProd'].Text;
      cEAN := nodeProduto.ChildNodes['cEAN'].Text;

      if (Trim(cEAN) = '') or (Trim(cEAN) = 'SEM GTIN') then
        cEAN := nodeProduto.ChildNodes['cEANTrib'].Text;
      if Trim(cEAN) = 'SEM GTIN' then
        cEAN := '';
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
        cEAN := '';
      ncm := nodeProduto.ChildNodes['NCM'].Text;
      cfop := nodeProduto.ChildNodes['CFOP'].Text;
      uCom := nodeProduto.ChildNodes['uCom'].Text;
      if (xProd <> '') and (ncm <> '') then
      begin
        DMNfe.cdsProdutoAusentedesc_produto.Value := xProd;
        DMNfe.cdsProdutoAusentecprod.Value := cProd;
        DMNfe.cdsProdutoAusentenum_fabricante.Value := cProd;
        DMNfe.cdsProdutoAusentenum_genero_ncm.Value := ncm;
        DMNfe.cdsProdutoAusentedesc_cod_barra.Value := cEAN;
        DMNfe.cdsProdutoAusentedesc_unidade.Value := uCom;
        DMnfe.cdsProdutoAusentecfop.Value := cfop;
        if TryStrToInt(cProd, codProduto) then
          DMNfe.cdsProdutoAusentecod_produto.Value := codProduto;
        ChecaFornecedor;
        // Aristides
        // Se o produto ja estiver cadastrado no B.D.
        // Busca as informacoes
        if DMParamSistema.CodEmpresa = 'ARISTIDES' then
        begin
          // Busca o codigo do produto
          if TryStrToInt(
            DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTOXML_PRODUTOBD',
              'CPROD LIKE ' + quotedStr(cProd)
              + ' AND COD_FORNECEDOR_XML = ' + IntToStr(DMNfe.pCodForImportacaoXML)
              + ' AND DESC_PRODUTO_XML = ' + QuotedStr(DMNfe.cdsProdutoAusentedesc_produto.Value)
              + ' AND NUM_ITEM = ' + DMNfe.cdsProdutoAusentenum_item.Text
          ), codProduto ) then
            DMNfe.cdsProdutoAusentecod_produto.Value := codProduto
          else
            DMNfe.cdsProdutoAusentecod_produto.Clear;

          // Verifica se o produto esta cadastrado
          if TryStrToInt(
            DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTOXML_PRODUTOBD',
              'CPROD LIKE ' + quotedStr(cProd)
              + ' AND COD_FORNECEDOR_XML = ' + IntToStr(DMNfe.pCodForImportacaoXML)
              + ' AND DESC_PRODUTO_XML = ' + QuotedStr(DMNfe.cdsProdutoAusentedesc_produto.Value)
              + ' AND IND_CADASTRO_PRODUTO = ' + QuotedStr('SIM')
              + ' AND NUM_ITEM = ' + DMNfe.cdsProdutoAusentenum_item.Text
          ), codProduto ) then
          begin
            DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
            DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := true;
          end;

          // Verifica se o produto esta vinculado
          if TryStrToInt(DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTOXML_PRODUTOBD', 'CPROD LIKE ' + quotedStr(cProd) + ' AND COD_FORNECEDOR_XML = ' +
                                IntToStr(DMNfe.pCodForImportacaoXML) + ' AND NUM_ITEM = ' + DMNfe.cdsProdutoAusentenum_item.Text), codProduto ) then
          begin
            DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
            DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := false;
          end;

          DMNfe.cdsProdutoAusentedesc_produto_aux.Value := DMNfe.cdsProdutoAusentedesc_produto.Value;
          DMNfe.cdsProdutoAusentedesc_produto.Value := DMNfe.cdsProdutoAusentedesc_produto.Value + infAdProd;
          if DMNfe.cdsProdutoAusentecod_produto.Text <> '' then
          begin
            // Query utilizada apenas para obter os dados do produto
            DMNfe.QAlteraProduto.Close;
            DMNfe.QAlteraProduto.SetVariable('COD_PRODUTO', codProduto);
            DMNfe.QAlteraProduto.Open;
            if not DMNfe.QAlteraProduto.Eof then
            begin
              DMNfe.cdsProdutoAusenteind_bico.Value := DMNfe.QAlteraProdutoIND_BICO.Value;
              DMNfe.cdsProdutoAusenteind_solado.Value := DMNfe.QAlteraProdutoIND_SOLADO.Value;
              DMNfe.cdsProdutoAusenteind_enfeite.Value := DMNfe.QAlteraProdutoIND_ENFEITE.Value;
              DMNfe.cdsProdutoAusentedesc_time.Value := DMNfe.QAlteraProdutoDESC_TIME.Value;
              DMNfe.cdsProdutoAusentedesc_esporte.Value := DMNfe.QAlteraProdutoDESC_ESPORTE.Value;
              DMNfe.cdsProdutoAusenteind_tipo_produto.Value := DMNfe.QAlteraProdutoIND_TIPO_PRODUTO.Value;
              DMNfe.cdsProdutoAusentenum_genero_ncm.Value := DMNfe.QAlteraProdutoNUM_GENERO_NCM.Value;
              DMNfe.cdsProdutoAusentecod_classe.Value := DMNfe.QAlteraProdutoCOD_CLASSE.Value;
              DMNfe.cdsProdutoAusentecod_tributacao.Value := DMNfe.QAlteraProdutoCOD_TRIBUTACAO.Value;
              if DMNFe.QAlteraProdutoCOD_MARCA.Value > 0 then
                DMNfe.cdsProdutoAusentecod_marca.Value := DMNFe.QAlteraProdutoCOD_MARCA.Value;
              DMNfe.cdsProdutoAusentedesc_cod_barra.Value := DMNfe.QAlteraProdutoDESC_COD_BARRA.Value;
              DMNfe.cdsProdutoAusentecod_cst_ipi.Value := DMNfe.QAlteraProdutoCOD_CST_IPI.Value;
              DMNfe.cdsProdutoAusentecod_cst_ipi_saida.Value := DMNfe.QAlteraProdutoCOD_CST_IPI_SAIDA.Value;
              DMNfe.cdsProdutoAusentecod_cst_pis.Value := DMNfe.QAlteraProdutoCOD_CST_PIS.Value;
              DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value := DMNfe.QAlteraProdutoCOD_CST_PIS_SAIDA.Value;
              DMNfe.cdsProdutoAusentecod_cst_cofins.Value := DMNfe.QAlteraProdutoCOD_CST_COFINS.Value;
              DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value := DMNfe.QAlteraProdutoCOD_CST_COFINS_SAIDA.Value;
              if (DMNfe.cdsProdutoAusentedesc_unidade.Value = 'PAR')
                or (DMNfe.cdsProdutoAusentedesc_unidade.Value = 'PR') then
                DMNfe.cdsProdutoAusentedesc_unidade.Value := 'PR'
              else
                DMNfe.cdsProdutoAusentedesc_unidade.Value := 'UN';
            end;
          end;
        end
        else // Diferente de Aristides
        begin
          // Busca o codigo do produto
          if TryStrToInt(DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTOXML_PRODUTOBD','CPROD LIKE ' + quotedStr(cProd) + ' AND COD_FORNECEDOR_XML = ' +
                         IntToStr(DMNfe.pCodForImportacaoXML) ), codProduto ) then
          begin
            DMNfe.cdsProdutoAusentecod_produto.Value := codProduto;
            DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
          end
          else
          begin
            DMNfe.cdsProdutoAusentecod_produto.Clear;
            DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := false;
          end;
        end;

        DMNfe.cdsProdutoAusentecod_lote_tipo.Value := bibCompra.loteImportacaoXML(cnpjFor, xProd, infAdProd, cProd);

        qtProduto := nodeProduto.ChildNodes['qCom'].Text;
        valTotalProd := StrToFloat(StringReplace(nodeProduto.ChildNodes['vProd'].Text,'.',',',[rfReplaceAll, rfIgnoreCase]));
        valDescontoProd := 0;
        nodeVDesc := nodeProduto.ChildNodes.FindNode('vDesc');
        if nodeVDesc <> Nil then
          valDescontoProd := StrToFloat(StringReplace(nodeVDesc.Text, '.', ',',[rfReplaceAll, rfIgnoreCase]));

        produtoNfe := TProdutoNfe.Create;
        produtoNfe.pNcm := ncm;
        produtoNfe.pCfop := cfop;
        produtoNfe.pDescricao := xProd;
        produtoNfe.item := item;
        produtoNfe.pQuantidade := qtProduto;
        produtoNfe.pValorTotal := valTotalProd;
        produtoNfe.pValorDesconto := valDescontoProd;
        produtoNfe.pCProd := cProd;
        produtoNfe.pValorIpi := ipi;
        produtoNfe.pNumFabricante := cProd;
        produtoNfe.basePis := basePis;
        produtoNfe.percPis := valPercPis;
        produtoNfe.valPis := pis;
        produtoNfe.baseCofins := baseCofins;
        produtoNfe.percCofins := valPercCofins;
        produtoNfe.valCofins := Cofins;

        //inicio
        if valBaseICMS <> '' then  //importar valor de base e icms do xml - Junior 25/02/2022
          produtoNfe.pBaseICMS := StrToFloat(StringReplace(valBaseICMS,'.',',',[rfReplaceAll, rfIgnoreCase]));
        if valICMS <> '' then
          produtoNfe.pValorICMS := StrToFloat(StringReplace(valICMS,'.',',',[rfReplaceAll, rfIgnoreCase]));
        //fim
        if valBaseSubst <> '' then
          produtoNfe.pBaseSubst := StrToFloat(StringReplace(valBaseSubst,'.',',',[rfReplaceAll, rfIgnoreCase]));
        if valSubst <> '' then
          produtoNfe.pValorSubst := StrToFloat(StringReplace(valSubst,'.',',',[rfReplaceAll, rfIgnoreCase]));
        if percSubst <> '' then
          produtoNfe.pPercSubst := StrToFloat(StringReplace(percSubst,'.',',',[rfReplaceAll, rfIgnoreCase]));

        if valBaseSTAnteriorRetido <> '' then
          produtoNfe.pBaseSTAnteriorRetido := StrToFloat(StringReplace(valBaseSTAnteriorRetido,'.',',',[rfReplaceAll, rfIgnoreCase]));
        if valSTAnteriorRetido <> '' then
          produtoNfe.pValorSTAnteriorRetido := StrToFloat(StringReplace(valSTAnteriorRetido,'.',',',[rfReplaceAll, rfIgnoreCase]));
        if percSTAnteriorRetido <> '' then
          produtoNfe.pPercSTAnteriorRetido := StrToFloat(StringReplace(percSTAnteriorRetido,'.',',',[rfReplaceAll, rfIgnoreCase]));

        produtoNfe.pTemSubst := temSubst;
        produtonfe.pTemCST020 := temCST020;
        produtonfe.pTemCSOSN103 := temCSOSN103;
        produtoNfe.lote := DMNfe.cdsProdutoAusentecod_lote_tipo.Value;
        arrProdutoNfe[i] := produtoNfe;
        Inc(i);
        itensXML.Add(ncm); //Guarda todos os itens que estao no xml
        itensXMLNomeNcm.Add('NCM: ' + ncm + ' - ' + xProd); //Serve para mostrar o produto que nao tem cadastro no bd na procedure ProdutosSemCadastro
        with DMNfe do
        begin
//          if NcmVariosRegistros(ncm) then
//          begin
            cdsProdutoXML.Append; //Guarda os itens que possuem mais de um ncm
            cdsProdutoXMLproduto.Value := xProd;
            cdsProdutoXMLcprod.Value := cProd;
            if item <> null then
              cdsProdutoXMLitem.Value := item;
            cdsProdutoXMLncm.Value := ncm;
            cdsProdutoXMLcfop.Value := cfop;
            cdsProdutoXMLnum_item.Value := item;
            cdsProdutoXMLcean.Value := cEAN;
            cdsProdutoXML.Post;
            AtualizaQtItensXML('+');
  //        end;
        end;
      end;
      nodeProduto := nodeProduto.NextSibling;
    until nodeProduto = nil;
    ipi := 0;
    valBaseSubst := '';
    valSubst := '';
    percSubst := '';
    valBaseSTAnteriorRetido := '';
    valSTAnteriorRetido := '';
    percSTAnteriorRetido := '';
    valBaseICMS := '';
    valICMS := '';
    basePis := 0;
    valPercPis := 0;
    pis := 0;
    baseCofins := 0;
    valPercCofins := 0;
    Cofins := 0;

    DMNfe.cdsProdutoAusente.Post;
    nodeSec := nodeSec.NextSibling;
  until nodeSec = nil;

  //Gera um backup dos produtos da nota
  GeraBackupProdutoAusente;
  DMNfe.cdsProdutoXML.First;
  //Serie
  nodeIde := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('ide');
  serie := nodeIde.ChildNodes['serie'].Text;
  nNF := StrToInt(nodeIde.ChildNodes['nNF'].Text);

  if (versaoNFe <> '4.00') then //versao 4.00 nao tem a tag indPag. Junior - 30/01/2014
    indPag := nodeIde.ChildNodes['indPag'].Text
  else  // NF-e 4.0
  begin
    nodePag := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').
      ChildNodes.FindNode('pag');
    indPag := nodePag.ChildNodes['detPag'].ChildNodes['indPag'].Text;
    if trim(indPag) = '' then
      indPag := '2';
  end;
  //A nova versao do NFe 3.10 utiliza outra tag para Datas. Junior - 12/09/2014.
  if (versaoNFe = '1.10') or (versaoNFe = '2.00')  then
  begin
    dtEmi := nodeIde.ChildNodes['dEmi'].Text;
    dtSaiEnt := nodeIde.ChildNodes['dSaiEnt'].Text;
  end
  else //Versao da NFe 3.10 e 4.00
  begin
    dtEmi := nodeIde.ChildNodes['dhEmi'].Text;
    dtSaiEnt := nodeIde.ChildNodes['dhSaiEnt'].Text;
  end;
  //CNPJ da filial
  nodeDest := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('dest');
  cnpjFilial := nodeDest.ChildNodes['CNPJ'].Text;
  if trim(cnpjFilial) = '' then
    cnpjFilial := nodeDest.ChildNodes['CPF'].Text;

  //Dados adicionais
  nodeInfAdic := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('infAdic');
  if nodeInfAdic <> Nil then
  begin
    nodeInfCpl := nodeInfAdic.ChildNodes.FindNode('infCpl');
    if nodeInfCpl <> Nil then
      infCpl := nodeInfAdic.ChildNodes['infCpl'].Text;
  end;
  //Total
  nodeTotal := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('total');
  valDesconto := StrToFloat(StringReplace(nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vDesc').Text,'.',',',
    [rfReplaceAll, rfIgnoreCase]));
  valDespesa := StrToFloat(StringReplace(nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vOutro').Text,'.',',',
    [rfReplaceAll, rfIgnoreCase]));
  valDespesa := valDespesa + StrToFloat(StringReplace(nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vFrete').Text,'.',',',[rfReplaceAll, rfIgnoreCase]));

  if nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vICMSUFDest') <> nil then
  begin
    pValTotalICMSDest := pValTotalICMSDest + StrToFloat(StringReplace(nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vICMSUFDest').Text,'.',',',[rfReplaceAll, rfIgnoreCase]));
  end;

  if nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vICMSUFRemet') <> nil then
  begin
    pValTotalICMSRemet := pValTotalICMSRemet + StrToFloat(StringReplace(nodeTotal.ChildNodes.FindNode('ICMSTot').ChildNodes.FindNode('vICMSUFRemet').Text,'.',',',[rfReplaceAll, rfIgnoreCase]));
  end;

end;

procedure TFImportacaoNfe.ChecaFornecedor;
begin
  codFor := DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[cnpjFor]);
  DMNfe.pCodForImportacaoXML := codFor;
end;

procedure TFImportacaoNfe.sbCarregaArquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MEArquivoXML.Text := OpenDialog1.FileName;
    XMLDocument1.FileName := MEArquivoXML.Text;
    XMLDocument1.Active := true;
  end;
end;

procedure TFImportacaoNfe.btConsultaNotaClick(Sender: TObject);
var
  Aguardo: TAguardoBloqueado;
  Rep, Amb, NNf, Uf :String;
  Exec: TExecucaoConsultaProtocolo;
begin
  LeArquivoXML;
  lblNaoAut.Visible := false;
  Rep := DMOracle.FastSelect('DESC_REPOSITORIO_NFE', 'TB_FILIAL','COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));
  Amb := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('ide').ChildValues['tpAmb'];
  NNf := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('ide').ChildValues['nNF'];
  Uf := XMLDocument1.DocumentElement.ChildNodes['NFe'].ChildNodes.FindNode('infNFe').ChildNodes.FindNode('ide').ChildValues['cUF'];
  Exec := TExecucaoConsultaProtocolo.Create(Rep, DMUsuario.CodFilialUsuario,StrToInt('0' + Uf), StrToInt(Amb), StrToInt(NNf), DMNfe.LimpaChave(StatusBar1.Panels[0].Text));
  DMNfe.ExecutaAcoes(TExecucoesList.Create.Add(Exec), False);
  
  if FNFeRetorno = nil then
    FNFeRetorno := TFNFeRetorno.Create(Application);
  FNFeRetorno.Carrega(ACAO_CONS_PROT, Exec.Retorno);
  FNFeRetorno.ShowModal;
  if not (Exec.Retorno.Status in SIT_NFE_ACEITO) then
  begin
    lblNaoAut.Visible := true;
    Exit;
  end;
end;

procedure TFImportacaoNfe.VerificaConsulta(Sender: TObject;
  Tentativa: Integer; Parametros: TVariantMap; var Acao: TExecucaoAction;
  var Msg: String);
begin
  with DMNfe do
  begin
    SetaNfeConsEntr(Parametros.getValue('CHAVE'));
    if QNfeConsEntrind_aprovado.Value then
      Acao := eaOk
    else if not QNfeConsEntrDESC_RETORNO_PROCESSAMENTO.IsNull then //Retornou da SEFAZ, mas não esta autorizada.
    begin
      Acao := eaAbort;
      Msg := QNfeConsEntrDESC_MSG_VALIDACAO_LOTE.Value;
    end
    else
      Msg := 'Não houve retorno da SEFAZ, Servidor NF-e não esteja funcionando ou não há comunicação com a internet.';
    QNfeConsEntr.Close;
  end;
end;

procedure TFImportacaoNfe.MEArquivoXMLChange(Sender: TObject);
begin
  if MEArquivoXML.Text = '' then
  begin
    btConsultaNota.Enabled := false;
    btnAvancar.Enabled := ((DsInfXmlSefa.DataSet.State = dsBrowse) And (DsInfXmlSefa.DataSet.RecordCount > 0)) Or
      ((MeChaveAcesso.Text <> '') And (FmFilial2.MeFilial.Text <> ''));
  end
  else
  begin
    btConsultaNota.Enabled := true;
    btnAvancar.Enabled := true;
    MeChaveAcesso.Clear;
    FmFilial2.MeFilial.Clear
  end;
end;

procedure TFImportacaoNfe.btAvancarClick(Sender: TObject);
var
  wSql, xml, path, fileName, chaveAcesso: String;
  buscador: TBuscador;
  executador: TExecutador;
  wCodCidade{, wProdutoVinculado}: String;
  i, filial: Integer;
  mStream: TMemoryStream;
  sStream: TStringStream;
begin
  DMOracle.ValidaFilial(FmFilial1.MeFilial.Text);
  If (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA') or (DMParamSistema.CodEmpresa = 'DINIZ') then
    meCfopST.ReadOnly := true;

  try
    count := 0;
    i := 0;
//    wProdutoVinculado := '0';
    DMNfe.Pesquisar := false;
    SetLength(indexTabSheet, PageControl1.PageCount);

    if PageControl1.ActivePage.Name = 'TabSheet1' then
    begin
      with DMNfe do
      begin
        QProdutoBD.Close;
        cdsProdutoXML.EmptyDataSet;
        if cdsProdutoBD.Active = true then
          cdsProdutoBD.EmptyDataSet;
      end;

      if (MEArquivoXML.Text = '') Or ((MeChaveAcesso.Text <> '') And (FmFilial2.MeFilial.Text <> '')) then
      begin
        with DMNfe do
        begin
          path := ExtractFilePath(Application.ExeName) + 'xml\';
          if not DirectoryExists(path) then
          begin
            if not CreateDir(path) then
              ForceDirectories(path);
          end;
          fileName := path + Bib.ift(MeChaveAcesso.Text = '', QInfXmlSefaConsDESC_CHAVE_ACESSO.Value, Bib.LimpaNumero(MeChaveAcesso.Text)) + '.xml';
          if not FileExists(fileName) then
          begin
            if MeChaveAcesso.Text <> '' then
            begin
              filial := StrToInt(Trim(FmFilial2.MeFilial.Text));
              chaveAcesso := Bib.LimpaNumero(MeChaveAcesso.Text);
            end
            else
            begin
              filial := QInfXmlSefaConsCOD_FILIAL.Value;
              chaveAcesso := QInfXmlSefaConsDESC_CHAVE_ACESSO.Value;
            end;
            xml := BaixaXMLNFe(filial, chaveAcesso);
            if xml <> '' then
            begin
              xml := LimpaStrXML(xml);
              mStream := TMemoryStream.Create;
              sStream := TStringStream.Create(xml);
              mStream.CopyFrom(sStream, Length(xml));
              mStream.SaveToFile(fileName);
              if (MeChaveAcesso.Text = '') then
              begin
                QInfXmlSefa.Close;
                QInfXmlSefa.SetVariable('PK', QInfXmlSefaConsCOD_INF_XML_SEFA.Value);
                QInfXmlSefa.Open;
                QInfXmlSefa.Edit;
                QInfXmlSefaIND_SITUACAO.Value := 'Xml Baixado';
                QInfXmlSefa.Post;
              end;
            end;
          end;
          if not FileExists(fileName) then
          begin
            btnAvancar.Enabled := true;
            Abort;
          end;
          XMLDocument1.FileName := fileName;
          XMLDocument1.Active := true;
        end;
      end;

      LeArquivoXML;
      if not ConsultaFilial then
        exit;
      with DMNfe do
      begin
        ChecaFornecedor;
        if codFor > 0 then
        begin
          ProdutosSemCadastro;
          if (wProdutoSemCadastro > 0) then
          begin
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
              GerenciaTabSheets(5)
            else
              GerenciaTabSheets(2);
          end
          //else if ( StrToInt(wProdutoVinculado)  > 0) and (wProdutoSemCadastro = 0) then
          else if (wProdutoVinculado > 0) and (wProdutoSemCadastro = 0) then
            GerenciaTabSheets(3)
          else
            if cdsProdutoXML.RecordCount > 0 then
              GerenciaTabSheets(3)
            else
              GerenciaTabSheets(4);
        end
        else
        begin
          GerenciaTabSheets(1);
          MECNPJ.Text := cnpjFor;
          MENome.Text := nomeFor;
          MEFantasia.Text := fantFor;
          MELogradouro.Text := lgrFor;
          MENumero.Text := nroFor;
          MEBairro.Text := bairroFor;
          MECodigoMunIBGE.Text := cMunFor;
          MEMunicipio.Text := munFor;
          MEUF.Text := ufFor;
          MECEP.Text := cepFor;
          MECodigoPaisIBGE.Text := cPaisFor;
          MEPais.Text := paisFor;
          MEFone.Text := foneFor;
          MEInscricao.Text := ieFor;
        end;
      end;
      btnVoltar.Enabled := true;
    end
    else
    if PageControl1.ActivePage.Name = 'TabSheet2' then
    begin
      CadastraFornecedor;
      ProdutosSemCadastro;
      if wProdutoSemCadastro > 0 then
      begin
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
          GerenciaTabSheets(4)
        else
          GerenciaTabSheets(1);
      end
      else
      if DMNfe.cdsProdutoBD.RecordCount > 0 then
        GerenciaTabSheets(2)
      else
        GerenciaTabSheets(3);
    end
    else
    if PageControl1.ActivePage.Name = 'TabSheet4' then
    begin
      if not CadastraProdutoAusente then
        Exit;
      if ProdutosSemCadastro = 0 then
      begin
        // Retorna para relacionar os produtos, inclusive os que acabaram de ser cadastrados na TB_PRODUTO.
        GerenciaTabSheetIndex(TabSheet3.PageIndex)
      end
      else
        MessageDlg('Ainda existem produtos não cadastrados', mtInformation, [mbOk], 0);
    end
    else
    if (PageControl1.ActivePage.Name = 'TabSheet6') and (DMParamSistema.CodEmpresa = 'ARISTIDES') then
    begin
      GeraBackupProdutoAusente;
      if ProdutosSemCadastro = 0 then
        GerenciaTabSheets(2, true)
      else
        MessageDlg('Ainda existem produtos não cadastrados', mtInformation, [mbOk], 0);
    end
    else
    if PageControl1.ActivePage.Name = 'TabSheet3' then 
    begin
      with DMNfe, DMOracle do
      begin
        cdsProdutoNcmDuplicado.First;
        while not cdsProdutoNcmDuplicado.Eof do
        begin
          ExecutaSql('UPDATE TB_PRODUTO SET NUM_GENERO_NCM = ' + QuotedStr(cdsProdutoNcmDuplicadoncm.Value) + ' WHERE COD_PRODUTO = ' +
                     cdsProdutoNcmDuplicadocodigo.Text, true);
          cdsProdutoNcmDuplicado.Next;
        end;
      end;
      CadastraSerie;
      GerenciaTabSheets(1);
      btnAvancar.Enabled := false;
    end
    else
    if PageControl1.ActivePage.Name = 'TabSheet5' then
    begin
      // A aba Finalizar e a ultima etapa da importacao. Nao navega para a aba especifica da Aristides, que redirecionaria para Vincular Produtos.
      btnAvancar.Enabled := false;
    end
    else
    begin
      GerenciaTabSheets(1);
      if PageControl1.ActivePage.Name = 'TabSheet5' then
      begin
        with DMNfe, DMOracle do
        begin
          cdsProdutoNcmDuplicado.First;
          while not cdsProdutoNcmDuplicado.Eof do
          begin
            ExecutaSql('UPDATE TB_PRODUTO SET NUM_GENERO_NCM = ' + QuotedStr(cdsProdutoNcmDuplicadoncm.Value) + ' WHERE COD_PRODUTO = ' +
                       cdsProdutoNcmDuplicadocodigo.Text, true);
            cdsProdutoNcmDuplicado.Next;
          end;
        end;
        CadastraSerie;
        btnAvancar.Enabled := false;
      end;
    end;

  Except
    on e: Exception do
      MessageDlg(e.Message, mtError, [mbOk], 0);
  end;
end;

procedure TFImportacaoNfe.CadastraFornecedor;
var
  wSql :String;
  buscador :TBuscador;
  wCodCidade :String;
  wCodPais: String;
begin
  with DMOracle do
  begin
    //Pega os dados do formulario para salvar no banco de dados
    nomeFor := Trim(MeNome.Text);
    ufFor := Trim(MeUF.Text);
    cPaisFor := Trim(MeCodigoPaisIBGE.Text);
    lgrFor := Trim(MeLogradouro.Text);
    nroFor := Trim(MeNumero.Text);
    munFor := Trim(MeMunicipio.Text);
    cepFor := bib.TiraMascara((MeCEP.Text));
    cnpjFor := bib.TiraMascara((MECNPJ.Text));
    ieFor := bib.TiraMascara(Trim(MeInscricao.Text));
    foneFor := bib.TiraMascara(Trim(MeFone.Text));
    bairroFor := bib.TiraMascara(Trim(MeBairro.Text));
    fantFor := Trim(MeFantasia.Text);
    
    btnAvancar.Enabled := false;
    //Procura se existe UF cadastrada, caso nao tenha faz o cadastro
    buscador := TBuscador.Create;
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_ESTADO WHERE COD_UF_IBGE = ' + cUfFor);
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_ESTADO(COD_ESTADO, DESC_ESTADO, DESC_SIGLA_ESTADO, COD_UF_IBGE) ';
      wSql := wSql + 'VALUES(' + quotedStr(ufFor) + ',' + quotedStr(ufFor) + ',' + quotedStr(ufFor) + ',' + cUfFor + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Abort;
      end;
    end;

    // Procura se existe Cidade, caso nao exista faz o cadastro
    buscador.Limpa;
    buscador.Adiciona('SELECT COUNT(*) FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(cMunFor,3,5));
    buscador.Buscar();
    if buscador.Proximo = '0' then
    begin
      wSql := 'INSERT INTO TB_CIDADE(COD_CIDADE, DESC_CIDADE, COD_ESTADO, COD_CIDADE_IBGE) VALUES ';
      wSql := wSql + '(SQCIDADE.NEXTVAL, ' + quotedStr(munFor) + ',' + quotedStr(ufFor) + ',' + copy(cMunFor,3,5) + ')';
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      Except
        DBCemapa.Rollback;
        Abort;
      end;
    end;

    // Recupera o codigo da cidade
    wSql := 'SELECT COD_CIDADE FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' + copy(cMunFor,3,5);
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodCidade := QExecSQL.Fields[0].AsString;

    // Recupera o codigo do pais
    wSql := 'SELECT COD_PAIS FROM TB_PAIS WHERE COD_PAIS_IBGE = ' + cPaisFor;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    QExecSQL.Close;
    QExecSQL.Open;
    wCodPais := QExecSQL.Fields[0].AsString;

    // Cadastra o fornecedor
    wSql := 'INSERT INTO TB_CADASTRO ( COD_CADASTRO, NOME, COD_TIPO_CADASTRO, COD_ESTADO, ';
    wSql := wSql + 'COD_PAIS, DESC_ENDERECO, DESC_CIDADE, COD_CIDADE, DESC_CEP, NUM_CGC_CPF, ';
    wSql := wSql + 'NUM_INSCRICAO, DT_CADASTRO, IND_SEXO_CATEGORIA, DESC_TELEFONE, DESC_BAIRRO, ';
    wSql := wSql + 'DESC_FANTASIA, IND_FISICA_JURIDICA, COD_USUARIO) VALUES ( ';
    wSql := wSql + 'SQCADASTRO.NEXTVAL, ' + quotedStr(nomeFor) + ', ' + '2' + ', ' + quotedStr(ufFor) + ', ';
    wSql := wSql + wCodPais +', '+ quotedStr(lgrFor + ', ' + nroFor) + ', ' + quotedStr(munFor) + ', ' + wCodcidade + ', ';
    wSql := wSql + quotedStr(cepFor) + ', ' + quotedStr(cnpjFor) + ', ' + quotedStr(ieFor) + ', ';
    wSql := wSql + quotedStr(DateToStr(DataServ)) + ', ' + quotedStr('J') + ', ' + quotedStr(foneFor) + ', ' + quotedStr(bairroFor) + ', ';
    wSql := wSql + quotedStr(copy(fantFor,0,30)) + ', ' + Bib.ift(length(cnpjFor) > 11, quotedStr('J'), quotedStr('F')) + ', ' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
    QExecSql.Close;
    QExecSql.SQL.Clear;
    QExecSql.SQL.Add(wSql);
    try
      QExecSQL.ExecSQL;

      // Recupera o codigo do cadastro
      wSql := 'SELECT COD_CADASTRO FROM TB_CADASTRO WHERE NUM_CGC_CPF = '
        + QuotedStr(cnpjFor);
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      QExecSQL.Close;
      QExecSQL.Open;
      codFor := QExecSQL.Fields[0].AsInteger;
      DBCemapa.Commit;
    Except
      DBCemapa.Rollback;
      Abort;
    end;
    ChecaFornecedor;
    btnAvancar.Enabled := true;
  end;
end;

procedure TFImportacaoNfe.FormActivate(Sender: TObject);
var
  i :Integer;
begin
  i := 0;
  while i < PageControl1.PageCount do
  begin
    if i > 0 then
      PageControl1.Pages[i].TabVisible := false;
    Inc(i);
  end;
  if PageControl1.ActivePage.Name = 'TabSheet1' then
  begin
    btnVoltar.Enabled := false;
    btnAvancar.Enabled := false;
  end;
  FmDatas1.MeDtInicial.Text := DateToStr(Date - 90);
  FmDatas1.MeDtFinal.Text := DateToStr(Date);

  FmFilial1.MeFilial.Text := IntToStr(DMUsuario.CodFilialUsuario);
  FmFilial1.MeFilialExit(Self);
end;

procedure TFImportacaoNfe.btVoltarClick(Sender: TObject);
var evento: TNotifyEvent;
begin
  if (MessageDlg('Tem certeza que deseja retornar? Se retornar irá perder as alterações já realizadas.', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
  begin    
    GerenciaTabSheets(PageControl1.ActivePageIndex,true);
    evento := cbNCM.OnClick;
    cbNCM.OnClick := nil;
    cbNCM.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM');
    cbNCM.OnClick := evento;
    evento := cbFabricante.OnClick;
    cbFabricante.OnClick := nil;
    cbFabricante.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'SIM');
    cbFabricante.OnClick := evento;
    evento := cbCodBarras.OnClick;
    cbCodBarras.OnClick := nil;
    cbCodBarras.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'SIM');
    cbCodBarras.OnClick := evento;

    SetaPropriedadeRelacionamentoAutomatico;
// Caso nao haja configuracao de identificacao de produtos, utiliza NCM e Fabricante por padrao
    if (not cbNCM.Checked) and (not cbFabricante.Checked)
      and (not cbCodBarras.Checked) then
    begin
      evento := cbNCM.OnClick;
      cbNCM.OnClick := nil;
      cbNCM.Checked := true;
      cbNCM.OnClick := evento;
      evento := cbFabricante.OnClick;
      cbFabricante.OnClick := nil;
      cbFabricante.Checked := true;
      cbFabricante.OnClick := evento;
    end;
    if DMParamSistema.QParamSistemaIND_ATUALIZA_NCM_PELO_XML.Value = 'SIM' then
      RGNCM.ItemIndex := 1
    else
      RGNCM.ItemIndex := 0;
    DMNfe.cdsProdutoXML.EmptyDataSet;
    DMNfe.cdsProdutoNcmDuplicado.EmptyDataSet;
    DMNfe.cdsProdutoAusente.EmptyDataSet;
    DMOracle.DBCemapa.Rollback;
  end;

  if PageControl1.ActivePage.Name = 'TabSheet1' then
  begin
    btnVoltar.Enabled := false;
    btnAvancar.Enabled := true;
  end;
end;

procedure TFImportacaoNfe.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'CHECADO' then
  begin
    DBGrid2.Canvas.FillRect(Rect);
    if DMNfe.cdsProdutoBDchecado.Value = 'SIM' then
      ILChecks.Draw(DBGrid2.Canvas, Rect.Left + 2, Rect.Top + 1, 0)
    else
      ILChecks.Draw(DBGrid2.Canvas, Rect.Left + 2, Rect.Top + 1, 1);
  end;

end;

procedure TFImportacaoNfe.DBGrid2CellClick(Column: TColumn);
var
  recNumber :Integer;
begin
  with DMNfe do
    if ((Column.Field.Value <> null) and (Column.FieldName = 'CHECADO')) then
    begin
      if (not cdsProdutoBD.IsEmpty) then
      begin
        recNumber := cdsProdutoBD.RecNo;
        cdsProdutoBD.First;
        cdsProdutoBD.DisableControls;
        while not cdsProdutoBD.Eof do
        begin
          if not (cdsProdutoBD.State in [DsEdit, DsInsert]) then
            cdsProdutoBD.Edit;
          cdsProdutoBDCHECADO.Value := 'NAO';
          cdsProdutoBD.Next;
          if cdsProdutoBD.State in [DsEdit, DsInsert] then
            cdsProdutoBD.Post;
        end;
        cdsProdutoBD.RecNo := recNumber;
        InverteSelecaoItem;         
        AdicionaItemNota;
        cdsProdutoBD.EnableControls;
        DMNfe.cdsProdutoXML.Edit;
        DMNfe.cdsProdutoXMLAssociado.Value := true;
        DMNfe.cdsProdutoXML.Post;
        // A verificacao anterior ocorre dentro de AdicionaItemNota, antes de o item XML ser marcado como associado. Recalcula apos o Post.
        ChecaProdutosVinculados;
      end;
      try
        DBGrid2.SelectedIndex := DBGrid2.SelectedIndex + 1;
      except
      end;
      cdsProdutoBD.RecNo := recNumber;
      DBGrid1.Refresh;
    end;
end;

procedure TFImportacaoNfe.FormCreate(Sender: TObject);
var evento: TNotifyEvent;
begin
  itensNota := TStringList.Create;
  itensXML := TStringList.Create;
  itensXMLNomeNcm := TStringList.Create;
  FClassTribIBSCBSVendaPorItem := TStringList.Create;
  FClassTribIBSCBSCompraPorItem := TStringList.Create;
  DMProduto.QClassTribIBSCBS.Open;
  self.WindowState := wsMaximized;
  MeDescricaoProduto.CharCase := ecUpperCase;
  with DMNfe do
  begin
    DSCstIpiEntrada.DataSet.Open;
    DSCstIpiSaida.DataSet.Open;
    DSCstPisEntrada.DataSet.Open;
    DSCstPisSaida.DataSet.Open;
    DSCstCofinsEntrada.DataSet.Open;
    DSCstCofinsSaida.DataSet.Open;
  end;

  evento := cbNCM.OnClick;
  cbNCM.OnClick := nil;
  cbNCM.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM');
  cbNCM.OnClick := evento;
  evento := cbFabricante.OnClick;
  cbFabricante.OnClick := nil;
  cbFabricante.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'SIM');
  cbFabricante.OnClick := evento;
  evento := cbCodBarras.OnClick;
  cbCodBarras.OnClick := nil;
  cbCodBarras.Checked := (DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'SIM');
  cbCodBarras.OnClick := evento;

  SetaPropriedadeRelacionamentoAutomatico;

  // Caso nao haja configuracao de identificacao de produtos, utiliza NCM e Fabricante por padrao
  if (not cbNCM.Checked) and (not cbFabricante.Checked)
    and (not cbCodBarras.Checked) then
  begin
    evento := cbNCM.OnClick;
    cbNCM.OnClick := nil;
    cbNCM.Checked := true;
    cbNCM.OnClick := evento;
    evento := cbFabricante.OnClick;
    cbFabricante.OnClick := nil;
    cbFabricante.Checked := true;
    cbFabricante.OnClick := evento;
  end;
  if DMParamSistema.QParamSistemaIND_ATUALIZA_NCM_PELO_XML.Value = 'SIM' then
    RGNCM.ItemIndex := 1
  else
    RGNCM.ItemIndex := 0;
  if DMParamSistema.CodEmpresa = 'FERRAGMED' then
  begin
    QRLMaragemAtacado.Visible := True;
    MeMargemAtacado.Visible   := True;
  end;
  DBGrid2.Enabled := not(DMParamSistema.CodEmpresa = 'ARISTIDES');
  MEProcurar.Enabled := not(DMParamSistema.CodEmpresa = 'ARISTIDES');
  MeProcurarFabricante.Enabled := not(DMParamSistema.CodEmpresa = 'ARISTIDES');
end;

procedure TFImportacaoNfe.btRemoverClick(Sender: TObject);
var
  wItemXML: Variant;
begin
  with DMNfe do
  begin
    if cdsProdutoNcmDuplicado.RecordCount > 0 then
    begin
      // Guarda o item antes da exclusao, pois o cursor do XML pode estar posicionado em outro produto.
      wItemXML := cdsProdutoNcmDuplicadoitem.Value;

      if cdsProdutoXML.Locate('item', wItemXML, []) then
      begin
        cdsProdutoXML.Edit;
        cdsProdutoXMLAssociado.Value := false;
        cdsProdutoXML.Post;
      end;

      cdsProdutoNcmDuplicado.Delete;
      qtItensVinculados := cdsProdutoNcmDuplicado.RecordCount;
      qtItensVinc.Caption := '(' + IntToStr(qtItensVinculados) + ' itens)';
      DBGrid1.Refresh;
    end;
  end;
  ChecaProdutosVinculados;
end;

procedure TFImportacaoNfe.Button1Click(Sender: TObject);
var  i :Integer;
begin
  AdicionaItemNotaEntrada;
  ListBox5.Clear;
  for i:=0 to itensNota.Count -1 do
    ListBox5.AddItem(itensNota[i], nil);
end;

procedure TFImportacaoNfe.FmSerie1MeSerieExit(Sender: TObject);
begin
  FmSerie1.MeSerieExit(Sender);
  serieNota := FmSerie1.MeSerie.Text;
end;

procedure TFImportacaoNfe.FmOperacao1MeOperacaoExit(Sender: TObject);
begin
  FmOperacao1.MeOperacaoExit(Sender);
end;

procedure TFImportacaoNfe.FmSerie1MeSerieChange(Sender: TObject);
begin
  HabilitaBtConcluir; 
end;

procedure TFImportacaoNfe.FmOperacao1MeOperacaoChange(Sender: TObject);
begin
  HabilitaBtConcluir;
  if trim(FmOperacao1.MeOperacao.Text) <> '' then
  begin
    codOperacao := StrToInt(trim(FmOperacao1.MeOperacao.Text));
    if notaComST then
    begin
      meCfopST.Enabled := true;
      meCfopST.Color := clWindow;
      cbCfopST.Enabled := true;
      cbCfopST.Visible := true;
      if Trim(ufFor) = Trim(DMOracle.FastSelect('COD_ESTADO','TB_FILIAL', 'COD_FILIAL = ' + IntToStr(pCodFilial))) then
        meCfopST.Text := DMOracle.FastSelect('COD_CFOP_ST','TB_OPERACAO', 'COD_OPERACAO = ' + trim(FmOperacao1.MeOperacao.Text))
      else
        meCfopST.Text := DMOracle.FastSelect('COD_CFOP_INT_ST','TB_OPERACAO', 'COD_OPERACAO = ' + trim(FmOperacao1.MeOperacao.Text));
    end
    else
    begin
      meCfopST.Enabled := false;
      meCfopST.Color := clBtnFace;
      cbCfopST.Enabled := false;
      cbCfopST.Visible := false;
    end;
  end;
end;

procedure TFImportacaoNfe.FmOperacao1BtOperacaoClick(Sender: TObject);
begin
  FmOperacao1.BtOperacaoClick(Sender);
end;

procedure TFImportacaoNfe.btConcluirClick(Sender: TObject);
var
  sql1,sql2: String;
begin
  sql2 :=  ' WHERE COD_OPERACAO = ' + Trim(FmOperacao1.MeOperacao.Text);

  if Trim(ufFor) = Trim(DMOracle.FastSelect('COD_ESTADO','TB_FILIAL', 'COD_FILIAL = ' + IntToStr(pCodFilial))) then
    sql1 := 'UPDATE TB_OPERACAO SET COD_CFOP_ST = ' + Trim(meCfopST.Text)
  else
    sql1 := 'UPDATE TB_OPERACAO SET COD_CFOP_INT_ST = ' + Trim(meCfopST.Text);

  if (Trim(meCfopST.Text) <> '') and (cbCfopST.Checked) then
  begin
    DMOracle.ExecutaSql(sql1 + sql2);
  end;
  AdicionaItemNotaEntrada;
  if Trim(FmOC1.MeOrdemCompra.Text) <> '' then
    codOrdemCompra := StrToInt(Trim(FmOC1.MeOrdemCompra.Text));
  with DMNfe do
  begin
    cdsProdutoXML.EmptyDataSet;
    cdsProdutoBD.EmptyDataSet;
  end;
end;

procedure TFImportacaoNfe.MEProcurarEnter(Sender: TObject);
begin
  if Trim(MEProcurar.Text) = 'Busca por nome' then
  begin
    MEProcurar.Text := '';
    MEProcurar.Font.Color := clBlack;
  end;
end;

procedure TFImportacaoNfe.MEProcurarExit(Sender: TObject);
begin
  if MEProcurar.Text = '' then
  begin
    MEProcurar.Font.Color := clGrayText;
    MEProcurar.Text := 'Busca por nome';
  end;
end;

procedure TFImportacaoNfe.MeProcurarFabricanteEnter(Sender: TObject);
begin
  if MeProcurarFabricante.Text = 'Busca por número do fabricante' then
  begin
    MeProcurarFabricante.Text := '';
    MEProcurar.Font.Color := clBlack;
  end;
end;

procedure TFImportacaoNfe.MeProcurarFabricanteExit(Sender: TObject);
begin
  MEProcurar.Font.Color := clGrayText;
  MeProcurarFabricante.Text := 'Busca por número do fabricante';
end;

procedure TFImportacaoNfe.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if DMNfe.cdsProdutoXML.Active then
    begin
      if (DMNfe.cdsProdutoXMLAssociado.Value) then
      begin
        dbgrid1.Canvas.Brush.Color := clMoneyGreen;
        dbgrid1.Canvas.FillRect(Rect);
        dbgrid1.DefaultDrawColumnCell( Rect,DataCol,Column,State);
        if not DMNfe.cdsProdutoXMLAssociado.Value then
        begin
          DMNfe.cdsProdutoXML.Edit;
          DMNfe.cdsProdutoXMLAssociado.Value := true;
          DMNfe.cdsProdutoXML.Post;
        end;
      end
      else
      begin
        if DBGrid1.Canvas.Brush.Color = clMoneyGreen then
          dbgrid1.Canvas.Brush.Color := clWindow;
      end;
    end;
end;

procedure TFImportacaoNfe.AtualizaQtItensVinculados(pOperacao: string);
begin
  if pOperacao = '+' then
    Inc(qtItensVinculados)
  else
    Dec(qtItensVinculados);
  qtItensVinc.caption := '(' + IntToStr(qtItensVinculados) + ' itens)'
end;

procedure TFImportacaoNfe.AtualizaQtItensXml(pOperacao: string);
begin
  if pOperacao = '+' then
    Inc(qtItensXML)
  else
    Dec(qtItensXML);
  qtItens.caption := '(' + IntToStr(qtItensXML) + ' itens)'
end;

procedure TFImportacaoNfe.TabSheet3Show(Sender: TObject);
var
  wTemNaoVinculado: Boolean;
begin
  // Recalcula o layout ao retornar das telas de cadastro/consulta.
  FormResize(Self);
  qtItensVinculados := 0;
  qtItensVinc.Caption := '';
  SincronizaProdutosAssociadosPorNCM;
  VinculaProdutosCodBarra;
  VinculaProdutosFabricante;
  if (not VinculoSomentePorNCM) and
    (not DMNfe.pVinculaProdutosPorCodigo) then
    VinculaProdutosProdutoVinculado;

// O contador incremental representa somente os vinculos feitos nesta passagem. Exibe a quantidade real que ira compor a nota.
  qtItensVinculados := DMNfe.cdsProdutoNcmDuplicado.RecordCount;
  qtItensVinc.Caption := '(' + IntToStr(qtItensVinculados) + ' itens)';

  with DMNfe do
    btnAvancar.Enabled := (cdsProdutoNcmDuplicado.RecordCount = cdsProdutoXML.RecordCount);

  if btnAvancar.Enabled and (DMNfe.cdsProdutoXML.RecordCount > 0) then
  begin
// PostMessage adia a chamada para APOS o evento TabSheet3Show terminar, evitando EAccessViolation no PageControl durante a transicao de abas
    PostMessage(Self.Handle, WM_USER + 1, 0, 0);
  end
  else
  begin
    wTemNaoVinculado := False;
    DMNfe.cdsProdutoXML.First;
    while not DMNfe.cdsProdutoXML.Eof do
    begin
      if not DMNfe.cdsProdutoXMLAssociado.Value then
      begin
        wTemNaoVinculado := True;
        Break;
      end;
      DMNfe.cdsProdutoXML.Next;
    end;
    DMNfe.cdsProdutoXML.First;
    if wTemNaoVinculado then
      MessageDlg('O sistema tentou relacionar os itens automaticamente, pelo número do fabricante.' + chr(13) + chr(10) +
                 'Se ainda existir produtos não relacionados, por favor faça o relacionamento manualmente.', mtInformation, [mbOk], 0);
  end;
end;

procedure TFImportacaoNfe.meCfopSTChange(Sender: TObject);
begin
  HabilitaBtConcluir;
end;

procedure TFImportacaoNfe.MEProcurarChange(Sender: TObject);
begin
  if BibCompra.importacaoPorCodigo then
    exit;
  if (MEProcurar.Text <> '') and (MEProcurar.Text <> 'Busca por nome') then
  begin
    with DMNfe do
    begin
      RetiraItemNota(cdsProdutoBDCOD_PRODUTO.Text, cdsProdutoXMLproduto.Text,
          cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value);
      cdsProdutoBD.EmptyDataSet;
      cdsProdutoBD.Close;
        cdsProdutoBD.Params.ParamByName('PRODUTO').AsString  := Trim('%' + UpperCase(MEProcurar.Text) + '%');
        cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
        cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := Null;
        cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
        cdsProdutoBD.Open;
        cdsProdutoXML.Edit;
        cdsProdutoXMLAssociado.Value := false;
        cdsProdutoXML.Post;
    end;
  end;
end;

procedure TFImportacaoNfe.MeProcurarFabricanteChange(Sender: TObject);
begin
  if BibCompra.importacaoPorCodigo then
    exit;
   if (MeProcurarFabricante.Text <> '') and (MeProcurarFabricante.Text <> 'Busca por número do fabricante') then
  begin
    with DMNfe do
    begin
      RetiraItemNota(cdsProdutoBDCOD_PRODUTO.Text, cdsProdutoXMLproduto.Text, cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value);
      cdsProdutoBD.EmptyDataSet;
      cdsProdutoBD.Close;
        cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').AsString  := Trim(UpperCase(MEProcurarFabricante.Text) + '%');
        cdsProdutoBD.Params.ParamByName('NCM').Value := Null;
        cdsProdutoBD.Params.ParamByName('PRODUTO').Value := Null;
        cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
        cdsProdutoBD.Open;
    end;
  end;
end;

procedure TFImportacaoNfe.cbNCMClick(Sender: TObject);
var evento: TNotifyEvent;
begin
  if (not cbNCM.Checked) and (not cbFabricante.Checked) and (not cbCodBarras.Checked)then
    cbNCM.Checked := true;

  // A opcao de pesquisa por codigo de barras
  evento := cbCodBarras.OnClick;
  cbCodBarras.OnClick := nil;
  cbCodBarras.Checked := false;
  cbCodBarras.OnClick := evento;

  ProdutosSemCadastro;
  pClicouConsulta := true;
  RGNCM.Visible := not cbNCM.Checked;
  SetaPropriedadeRelacionamentoAutomatico;
end;

procedure TFImportacaoNfe.cbFabricanteClick(Sender: TObject);
var evento: TNotifyEvent;
begin
  if (not cbNCM.Checked) and (not cbFabricante.Checked) and (not cbCodBarras.Checked) then
    cbFabricante.Checked := true;

  // A opcao de pesquisa por codigo de barras 
  evento := cbCodBarras.OnClick;
  cbCodBarras.OnClick := nil;
  cbCodBarras.Checked := false;
  cbCodBarras.OnClick := evento;

  ProdutosSemCadastro;
  pClicouConsulta := true;
  SetaPropriedadeRelacionamentoAutomatico;
end;

procedure TFImportacaoNfe.btCompletaProdutoClick(Sender: TObject);
var wCod_produtoBD : string;
  wCodigoDisponivel: boolean;
  wDescricaoProduto, wDesCodBarra, wNumFabricante: string;
begin
  if TemProdutoVinculado then
  begin
    MessageDlg('Produto já vinculado a outro produto no sistema. Impossível efetuar cadastro.' + chr(13) + chr(10) +
               'Para cadastrar este produto, exclua o vinculo.', mtError, [mbOk], 0);
    abort;
  end;
  wDescricaoProduto := Trim(MeDescricaoProduto.Text);
  wDesCodBarra      := Trim(MeDescCodBarra.Text);
  wNumFabricante    := Trim(MENumFabricante.Text);
  with DMNfe do
  begin
    if (Trim(FmClasse1.MeClasse.Text) <> '') and (Trim(FmTributacao1.MeTributacao.Text) <> '') then
    begin
      SalvaClassTribIBSCBSProdutoAtual;
      cdsProdutoAusente.Edit;
      if Trim(MeCodigoProduto.Text) <> '' then //Adicionado o Cod. Produto para informar codigo sem usar a sequencia do sistema. Junior - 01/06/2015 -Solic. Rubens(Kreuz).
      begin
        wCod_produtoBD := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO', 'COD_PRODUTO = ' + trim(MeCodigoProduto.Text));
        if wCod_produtoBD <> '' then
          raise Exception.Create('Ja existe produto para este codigo.')
        else
          cdsProdutoAusentecod_produto.Text := Trim(MeCodigoProduto.Text);
      end
      else
      begin
// Checa se caso nao tenha sido informado um codigo de produto. a sequencia nao apontar para um codigo que ja esteja sendo utilizado
        wCodigoDisponivel := false;
        while(not wCodigoDisponivel) do
        begin
          wCod_ProdutoBD := DMOracle.FastSelect('SQPRODUTO.NEXTVAL', 'DUAL');
          if StrToInt(DMOracle.FastSelect('COUNT(*)', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCod_produtoBD)) = 0 then
            wCodigoDisponivel := true;
        end;
        cdsProdutoAusentecod_produto.Text := wCod_ProdutoBD;
      end;
      cdsProdutoAusentecod_classe.Text := Trim(FmClasse1.MeClasse.Text);
      cdsProdutoAusentecod_tributacao.Text := Trim(FmTributacao1.MeTributacao.Text);
      cdsProdutoAusenteind_tipo_produto.Value := cbTipoProduto.Text;
      if Trim(FmMarca1.MeMarca.Text) <> '' then
        cdsProdutoAusentecod_marca.Text := Trim(FmMarca1.MeMarca.Text);
      cdsProdutoAusenteperc_margem_atacado.Text := Trim(MeMargemAtacado.Text);
      if wDescricaoProduto <> '' then
        cdsProdutoAusentedesc_produto.Value := wDescricaoProduto;
      if wDesCodBarra <> '' then
        cdsProdutoAusentedesc_cod_barra.Value := wDesCodBarra;
      if wNumFabricante <> '' then
        cdsProdutoAusentenum_fabricante.Value := wNumFabricante;
      if QCstIpiEntradaCOD_CST_IPI.Value <> '' then
        cdsProdutoAusentecod_cst_ipi.Text := QCstIpiEntradaCOD_CST_IPI.Value;
      if QCstIpiSaidaCOD_CST_IPI.Value <> '' then
        cdsProdutoAusentecod_cst_ipi_saida.Text := QCstIpiSaidaCOD_CST_IPI.Value;
      if QCstPisEntradaCOD_CST_PIS.Value <> '' then
        cdsProdutoAusentecod_cst_pis.Text := QCstPisEntradaCOD_CST_PIS.Value;
      if QCstPisSaidaCOD_CST_PIS.Value <> '' then
        cdsProdutoAusentecod_cst_pis_saida.Text := QCstPisSaidaCOD_CST_PIS.Value;
      if QCstCofinsEntradaCOD_CST_COFINS.Value <> '' then
        cdsProdutoAusentecod_cst_cofins.Text := QCstCofinsEntradaCOD_CST_COFINS.Value;
      if QCstCofinsSaidaCOD_CST_COFINS.Value <> '' then
        cdsProdutoAusentecod_cst_cofins_saida.Text := QCstCofinsSaidaCOD_CST_COFINS.Value;
      cdsProdutoAusente.Post;
      if Trim(MeCodigoProduto.Text) <> '' then
        MeCodigoProduto.Text := IntToStr(StrToInt(MeCodigoProduto.Text) + 1);
      MeDescricaoProduto.Clear;

      cdsProdutoAusente.Next;
      DBGProdutoAusente.SetFocus;
    end
    else
      MessageDlg('Campos não preenchidos.',mtError,[mbOk],0);
  end;
end;

procedure TFImportacaoNfe.DBGProdutoAusenteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DMNfe.cdsProdutoAusentecod_classe.Value > 0) and (DMNfe.cdsProdutoAusentecod_tributacao.Value > 0) then
  begin
    DBGProdutoAusente.Canvas.Brush.Color := clMoneyGreen;
    DBGProdutoAusente.Canvas.FillRect(Rect);
    DBGProdutoAusente.DefaultDrawColumnCell( Rect,DataCol,Column,State);
  end;

  if DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value then
  begin
    DBGProdutoAusente.Canvas.Brush.Color := clGradientActiveCaption;
    DBGProdutoAusente.Canvas.FillRect(Rect);
    DBGProdutoAusente.DefaultDrawColumnCell( Rect,DataCol,Column,State);
  end;
end;

procedure TFImportacaoNfe.MEProcurarClick(Sender: TObject);
var
  wAux: String;
begin
  //Forca o sistema a buscar novamente ao clicar no controle
  wAux := MEProcurar.Text;
  MEProcurar.Clear;
  MEProcurar.Text := wAux;
end;

procedure TFImportacaoNfe.cbCodBarrasClick(Sender: TObject);
var evento: TNotifyEvent;
begin
  if (not cbNCM.Checked) and (not cbFabricante.Checked) and (not cbCodBarras.Checked) then
    cbCodBarras.Checked := true;

  // A opcao de pesquisa por codigo de barras
  evento := cbNCM.OnClick;
  cbNCM.OnClick := nil;
  cbNCM.Checked := false;
  cbNCM.OnClick := evento;
  evento := cbFabricante.OnClick;
  cbFabricante.OnClick := nil;
  cbFabricante.Checked := false;
  cbFabricante.OnClick := evento;

  ProdutosSemCadastro;
  pClicouConsulta := true;
  SetaPropriedadeRelacionamentoAutomatico;
end;

procedure TFImportacaoNfe.btSalvaItemBDClick(Sender: TObject);
begin
  with DMNfe do
  begin
    if cdsProdutoAusenteBackup.Locate('num_item', cdsProdutoXMLnum_item.Value, []) then
    begin
      cdsProdutoAusente.EmptyDataSet;
      cdsProdutoAusente.Append;
      cdsProdutoAusentenum_item.Value := cdsProdutoAusenteBackupnum_item.Value;
      cdsProdutoAusentecod_produto.Value := cdsProdutoAusenteBackupcod_produto.Value;
      cdsProdutoAusentecod_classe.Value := cdsProdutoAusenteBackupcod_classe.Value;
      cdsProdutoAusentecod_tributacao.Value := cdsProdutoAusenteBackupcod_tributacao.Value;
      cdsProdutoAusentedesc_produto.Value := cdsProdutoAusenteBackupdesc_produto.Value;
      cdsProdutoAusentenum_embalagem.Value := cdsProdutoAusenteBackupnum_embalagem.Value;
      cdsProdutoAusentedesc_unidade.Value := cdsProdutoAusenteBackupdesc_unidade.Value;
      cdsProdutoAusenteval_varejo.Value := cdsProdutoAusenteBackupval_varejo.Value;
      cdsProdutoAusenteval_atacado.Value := cdsProdutoAusenteBackupval_atacado.Value;
      cdsProdutoAusenteperc_ipi.Value := cdsProdutoAusenteBackupperc_ipi.Value;
      cdsProdutoAusenteind_tipo_produto.Value := cdsProdutoAusenteBackupind_tipo_produto.Value;
      cdsProdutoAusentenum_fabricante.Value := cdsProdutoAusenteBackupnum_fabricante.Value;
      cdsProdutoAusenteperc_iss.Value := cdsProdutoAusenteBackupperc_iss.Value;
      cdsProdutoAusenteperc_inss.Value := cdsProdutoAusenteBackupperc_iss.Value;
      cdsProdutoAusenteind_situacao.Value := cdsProdutoAusenteBackupind_situacao.Value;
      cdsProdutoAusentenum_volumes.Value := cdsProdutoAusenteBackupnum_volumes.Value;
      cdsProdutoAusentenum_genero_ncm.Value := cdsProdutoAusenteBackupnum_genero_ncm.Value;
      cdsProdutoAusentedesc_cod_barra.Value := cdsProdutoAusenteBackupdesc_cod_barra.Value;
      cdsProdutoAusenteind_subst_trib.Value := cdsProdutoAusenteBackupind_subst_trib.Value;
      cdsProdutoAusentecod_marca.Value      := cdsProdutoAusenteBackupcod_marca.Value;
      cdsProdutoAusentecod_lote_tipo.Value  := cdsProdutoAusenteBackupcod_lote_tipo.Value;
      cdsProdutoAusente.Post;
      GerenciaTabSheets(1, true);
      btnAvancar.Enabled := true;
    end
    else
    begin
      cdsProdutoAusente.Edit;
      if cdsProdutoXMLnum_item.Text <> '' then
        cdsProdutoAusentenum_item.Value := cdsProdutoXMLnum_item.Value
      else
        cdsProdutoAusentenum_item.Value := cdsProdutoAusenteBackupnum_item.Value; // 0;
      cdsProdutoAusente.Post;
      GerenciaTabSheets(1, true);
      btnAvancar.Enabled := true;
    end;{Removido comentario do bloco pois nao abria a tela para cadastrar os itens quando havia produtos nao encontrados. Alex 22/09/25}
  end;
end;

procedure TFImportacaoNfe.TabSheet1Show(Sender: TObject);
begin
  DMNfe.cdsProdutoNcmDuplicado.EmptyDataSet;
  MEArquivoXML.SetFocus;
end;

procedure TFImportacaoNfe.FormResize(Sender: TObject);
var
  wInicioDireita: Integer;
  wLarguraBusca: Integer;
begin
  if not Assigned(TabSheet3) then
    Exit;
  if TabSheet3.ClientWidth <= 0 then
    Exit;

  // PageControl e botoes inferiores sao redimensionados pelos Anchors do DFM.
  // Calcula esta aba pela sua area interna, sem depender do monitor ou de
  // Screen.ActiveForm, que pode apontar para outra janela apos uma consulta.
  wInicioDireita := (TabSheet3.ClientWidth div 2) + 4;

  DBGrid1.Width := wInicioDireita - DBGrid1.Left - 8;
  DBGrid2.Left := wInicioDireita;
  DBGrid2.Width := TabSheet3.ClientWidth - DBGrid2.Left - 8;
  Label20.Left := wInicioDireita;

// Mantem os tres campos de busca lado a lado, sem sobreposicao em outras resolucoes ou escalas de DPI.
  MeProcurarFabricante.Left := TabSheet3.ClientWidth - MeProcurarFabricante.Width - 9;
  MeProcuraCodProduto.Left := MeProcurarFabricante.Left - MeProcuraCodProduto.Width - 4;
  MEProcurar.Left := wInicioDireita;
  wLarguraBusca := MeProcuraCodProduto.Left - MEProcurar.Left - 4;
  if wLarguraBusca < 0 then
    wLarguraBusca := 0;
  MEProcurar.Width := wLarguraBusca;

  btSalvaItemBD.Left := DBGrid1.Left + DBGrid1.Width - btSalvaItemBD.Width;
end;

procedure TFImportacaoNfe.DBLCCstIpiEntradaCloseUp(Sender: TObject);
begin
  DBLCCstIpiEntrada.Hint := DMNfe.QCstIpiEntradaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.DBLCCstIpiSaidaCloseUp(Sender: TObject);
begin
  DBLCCstIpiSaida.Hint := DMNfe.QCstIpiSaidaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.DBLCCstPisEntradaCloseUp(Sender: TObject);
begin
  DBLCCstPisEntrada.Hint := DMNfe.QCstPisEntradaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.DBLCCstPisSaidaCloseUp(Sender: TObject);
begin
  DBLCCstPisSaida.Hint := DMNfe.QCstPisSaidaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.DBLCCstCofinsEntradaCloseUp(Sender: TObject);
begin
  DBLCCstCofinsEntrada.Hint := DMNfe.QCstCofinsEntradaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.DBLCCstCofinsSaidaCloseUp(Sender: TObject);
begin
  DBLCCstCofinsSaida.Hint := DMNfe.QCstCofinsSaidaDESC_COMPLETA.Value;
end;

procedure TFImportacaoNfe.VinculaProdutosCodBarra;
begin
  if DMNfe.pVinculaProdutosPorCodigoBarras then
  begin
    with DMNfe do
    begin
      if cdsProdutoXML.Eof then
        exit;
      cdsProdutoXML.DisableControls;
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof do
      begin
        if cdsProdutoBD.RecordCount = 1 then
        begin
          DBGrid2CellClick(DBGrid2.Columns[0]);
          Application.ProcessMessages
        end;
        cdsProdutoXML.Next;
      end;
      DBGrid2.SelectedField := DBGrid2.DataSource.DataSet.FieldByName('CHECADO');
      cdsProdutoXML.EnableControls;
      btnAvancar.Refresh;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFImportacaoNfe.VinculaProdutosFabricante;
var
  wProdutoEncontrado: Boolean;
  wQtdVinculos: String;
begin
  if DMNfe.pVinculaProdutosPorCodigo then
  begin
    with DMNfe do
    begin
      if cdsProdutoXML.Eof then
        exit;
      cdsProdutoXML.DisableControls;
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof do
      begin
        wProdutoEncontrado := False;
        if cdsProdutoBD.RecordCount = 1 then
        begin
          // Somente relaciona automaticamente quando houve correspondencia exata na TB_PRODUTO ou na tabela associativa do fornecedor.
          wProdutoEncontrado := CompareText(Trim(cdsProdutoBDNUM_FABRICANTE.Text), Trim(cdsProdutoXMLcprod.Text)) = 0;
          if not wProdutoEncontrado then
          begin
            wQtdVinculos := DMOracle.FastSelect('COUNT(*)','TB_PRODUTOXML_PRODUTOBD','CPROD = ' + QuotedStr(Trim(cdsProdutoXMLcprod.Text)) + ' AND COD_FORNECEDOR_XML = ' +
                            IntToStr(pCodForImportacaoXML) + ' AND COD_PRODUTO = ' + cdsProdutoBDCOD_PRODUTO.Text);
            wProdutoEncontrado := StrToIntDef(Trim(wQtdVinculos), 0) > 0;
          end;

          if wProdutoEncontrado then
          begin
            DBGrid2CellClick(DBGrid2.Columns[0]);
            Application.ProcessMessages;
          end;
        end;
        cdsProdutoXML.Next;
      end;
      DBGrid2.SelectedField := DBGrid2.DataSource.DataSet.FieldByName('CHECADO');
      cdsProdutoXML.First;
      cdsProdutoXML.EnableControls;
      btnAvancar.Refresh;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFImportacaoNfe.DSProdutoAusenteDataChange(Sender: TObject;
  Field: TField);
var
  i: integer;
  wProdutoVinculado : string;
begin
  CarregaClassTribIBSCBSProdutoAtual;

  if (Trim(DMNfe.cdsProdutoAusentedesc_produto.Value) <> '') then
    MeDescricaoProduto.Text := Trim(DMNfe.cdsProdutoAusentedesc_produto.Value);
  if (Trim(DMNfe.cdsProdutoAusentedesc_cod_barra.Value) <> '') then
    MeDescCodBarra.Text := Trim(DMNfe.cdsProdutoAusentedesc_cod_barra.Value)
  else
    MeDescCodBarra.Clear;

  // Produtos Aristides
  if (PageControl1.ActivePage.Name = 'TabSheet6') and (DMParamSistema.CodEmpresa = 'ARISTIDES') then
  begin
    // Este codigo limpa os DBPanels quando o valor = 0
    for i := 0 to DBPanel4.ControlCount -1 do
    begin
      if DBPanel4.Controls[i].ClassName = 'TDBEdit' then
        if TDBEdit(DBPanel4.Controls[i]).Text = '0' then
          TDBEdit(DBPanel4.Controls[i]).Clear;
    end;
    for i := 0 to DBPanel5.ControlCount -1 do
    begin
      if DBPanel5.Controls[i].ClassName = 'TDBEdit' then
        if TDBEdit(DBPanel5.Controls[i]).Text = '0' then
          TDBEdit(DBPanel5.Controls[i]).Clear;
    end;

    DBPanel2.Enabled := not (DMNfe.cdsProdutoAusentecod_produto.Value > 0);
    wCDSProdutoAusenteRecNo := DMNfe.cdsProdutoAusente.recno;
    btExcluirProdutoAristides.Enabled := (DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value);
    BuscaDadosCalcados;
  end;

  TemProdutoVinculado;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
  begin
    with DMNfe do
    begin
      if DMOracle.DBCemapa.InTransaction then
      begin
        if DMNfe.QProdutoLoteItem.State in [dsInsert] then
          DMNfe.QProdutoLoteItem.Post;
        DMoracle.DBCemapa.Commit;
      end;

      QProdutoLoteItem.Close;
      QProdutoLoteItem.SetVariable('PK', Null);
      QProdutoLoteItem.SetVariable('PRODUTO', Null);
      QProdutoLoteItem.SetVariable('CPROD', DMNfe.cdsProdutoAusentecprod.Value);
      QProdutoLoteItem.SetVariable('FORNECEDOR', codFor);
      QProdutoLoteItem.SetVariable('NUM_ITEM', DMNfe.cdsProdutoAusentenum_item.Value);
      QProdutoLoteItem.Open;
    end;
  end;
end;

procedure TFImportacaoNfe.btVincularProdutoClick(Sender: TObject);
var executador: TExecutador;
  wSql, wProduto, wCprod, wNumItem, wSql1: string;
  wCodClasse, wCodTributacao, wCodMarca: integer;
  wCstIpi, wCstIpiSaida, wCstPis, wCstPisSaida, wCstCofins, wCstCofinsSaida: string;
begin
  // A vinculacao manual continua disponivel quando a comparacao automatica
  // estiver configurada somente por NCM.
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);

// Prioriza o codigo de barras para localizar cadastros cujo numero do fabricante possua formatacao diferente da informada no XML.
  FProdutoCons.MeCodigo.Clear;
  FProdutoCons.METexto.Clear;
  FProdutoCons.MENumFabricante.Clear;
  FProdutoCons.MeCodigoBarras.Clear;
  if Trim(DMNfe.cdsProdutoAusentedesc_cod_barra.Text) <> '' then
    FProdutoCons.MeCodigoBarras.Text := Trim(DMNfe.cdsProdutoAusentedesc_cod_barra.Text)
  else
    FProdutoCons.MENumFabricante.Text := StringReplace(
      Trim(DMNfe.cdsProdutoAusentecprod.Text), '-', '', [rfReplaceAll]);

  if FProdutoCons.ShowModal = MrOk then
  begin
    with DMNfe, DMProduto do
    begin
        executador := TExecutador.Create;
        executador.Limpa;
        if DMParamSistema.CodEmpresa = 'ARISTIDES' then   //IF - Aristides utiliza desc_produto_aux. Junior 07/05/2019 - Ajuda do marlon
        begin
          wSql := 'INSERT INTO TB_PRODUTOXML_PRODUTOBD('
            + 'CPROD,COD_FORNECEDOR_XML,COD_PRODUTO,DESC_PRODUTO_XML,IND_CADASTRO_PRODUTO,NUM_ITEM)'
            + ' VALUES ('
            + QuotedStr(cdsProdutoAusentecprod.Value) + ', '
            + IntToStr(codFor) + ', '
            + QProdutoConsCOD_PRODUTO.Text + ', '
            + QuotedStr(cdsProdutoAusentedesc_produto_aux.Value) + ', '
            + QuotedStr('NAO') + ', '
            + cdsProdutoAusentenum_item.Text
            + ')';
        end
        else
        begin
          if cdsProdutoAusentecprod.Value = '' then
            wCprod := cdsProdutoAusenteBackupcprod.Value
          else
            wCprod := cdsProdutoAusentecprod.Value;

          if cdsProdutoAusentenum_item.Text = '' then
            wNumItem := cdsProdutoAusenteBackupnum_item.Text
          else
            wNumItem := cdsProdutoAusentenum_item.Text;

          wProduto := '';
          wProduto := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTOXML_PRODUTOBD','CPROD = ' + QuotedStr(wCprod)  + ' AND COD_FORNECEDOR_XML = ' + IntToStr(DMNfe.pCodForImportacaoXML)   );//cdsProdutoAusentecod_produto.Text);
            if (wProduto = '') then
            begin
              wSql := 'INSERT INTO TB_PRODUTOXML_PRODUTOBD('
                + 'CPROD,COD_FORNECEDOR_XML,COD_PRODUTO,DESC_PRODUTO_XML,IND_CADASTRO_PRODUTO,NUM_ITEM,COD_PRODUTOXML_PRODUTOBD, COD_USUARIO)'
                + ' VALUES ('
                + QuotedStr(wCprod) + ', '//cdsProdutoAusentecprod.Value) + ', '
                + IntToStr(codFor) + ', '
                + QProdutoConsCOD_PRODUTO.Text + ', '
                + QuotedStr(cdsProdutoAusentedesc_produto.Value) + ', '//(cdsProdutoAusentedesc_produto_aux.Value) + ', '
                + QuotedStr('SIM') + ', '
                + wNumItem //cdsProdutoAusentenum_item.Text
                + ', SQPRODUTOXML_PRODUTOBD.NEXTVAL,'
                + IntToStr(DMUsuario.CodUsuarioCorrente)
                + ')';
              if cdsProdutoAusentedesc_cod_barra.Value <> '' then
              begin
                wSql1 := 'UPDATE TB_PRODUTO SET DESC_COD_BARRA = ' + chr(39) + cdsProdutoAusentedesc_cod_barra.Value  + chr(39) + ' WHERE COD_PRODUTO = '
                          + QProdutoConsCOD_PRODUTO.Text;
                DMOracle.QExecSQL.Close;
                DMOracle.QExecSQL.SQL.Clear;
                DMOracle.QExecSQL.SQL.Add(wSql1);
                DMOracle.QExecSQL.ExecSQL;
              end;
            end
            else
            begin
              if cdsProdutoAusentedesc_cod_barra.Value <> '' then
              begin
                wSql := 'UPDATE TB_PRODUTOXML_PRODUTOBD SET '
                 // + 'CPROD = ' + wProduto + ', '
                  + 'DESC_PRODUTO_XML = ' + QuotedStr(cdsProdutoAusentedesc_produto.Value)
                  + ', COD_PRODUTO = ' + wProduto //cdsProdutoAusentecod_produto.Text
                  + ', NUM_ITEM = ' + wNumItem
                  + ', IND_CADASTRO_PRODUTO = ' + QuotedStr('SIM')
                  + ', COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente)
                  + ' WHERE CPROD = ' + QuotedStr(wCprod);
                wSql1 := 'UPDATE TB_PRODUTO SET DESC_COD_BARRA = ' + chr(39) + cdsProdutoAusentedesc_cod_barra.Value + chr(39) + ' WHERE COD_PRODUTO = '
                          + QProdutoConsCOD_PRODUTO.Text;
                DMOracle.QExecSQL.Close;
                DMOracle.QExecSQL.SQL.Clear;
                DMOracle.QExecSQL.SQL.Add('UPDATE TB_PRODUTO SET DESC_COD_BARRA = ' + chr(39) + cdsProdutoAusentedesc_cod_barra.Value  + chr(39) + ' WHERE COD_PRODUTO = '
                                          + QProdutoConsCOD_PRODUTO.Text);
                DMOracle.QExecSQL.ExecSQL;
              end;
            end;
        end;
        executador.Adiciona(wSql);
        executador.Executar(true, true);
        executador.Free;
        executador := nil;
        cdsProdutoAusente.Edit;
        cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
        cdsProdutoAusenteind_cadastrado_bd.Value := false;
        cdsProdutoAusente.Post;
{ Adiciona o produto vinculado ao cdsProdutoNcmDuplicado para que AdicionaItemNotaEntrada consiga localizar o codigo do produto }
        cdsProdutoNcmDuplicado.Insert;
        cdsProdutoNcmDuplicadocodigo.Value := QProdutoConsCOD_PRODUTO.AsInteger;
        cdsProdutoNcmDuplicadodesc_produto_bd.Value := QProdutoConsDESC_PRODUTO.Value;
        if DMParamSistema.CodEmpresa = 'ARISTIDES' then
          cdsProdutoNcmDuplicadodesc_produto_xml.Value := cdsProdutoAusentedesc_produto_aux.Value
        else
          cdsProdutoNcmDuplicadodesc_produto_xml.Value := cdsProdutoAusentedesc_produto.Value;
        cdsProdutoNcmDuplicadocprod_xml.Value := wCprod;
        cdsProdutoNcmDuplicadoitem.Value := wNumItem;
        cdsProdutoNcmDuplicadoncm.Value := cdsProdutoAusentenum_genero_ncm.Value;
        cdsProdutoNcmDuplicado.Post;

        GeraBackupProdutoAusente;

        wCodClasse := DMNfe.cdsProdutoAusentecod_classe.Value;
        wCodTributacao := DMNfe.cdsProdutoAusentecod_tributacao.Value;
        wCodMarca := DMNfe.cdsProdutoAusentecod_marca.Value;
        wCstIpi := DMNfe.cdsProdutoAusentecod_cst_Ipi.Value;
        wCstIpiSaida := DMNfe.cdsProdutoAusentecod_cst_Ipi_saida.Value;
        wCstPis := DMNfe.cdsProdutoAusentecod_cst_pis.Value;
        wCstPisSaida := DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value;
        wCstCofins := DMNfe.cdsProdutoAusentecod_cst_cofins.Value;
        wCstCofinsSaida := DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value;

        DSProdutoAusente.DataSet.Next;

        if DSProdutoAusente.DataSet.Eof then
        begin
          btAvancarClick(self);
        end
        else
        begin
          // Se nao for fim dos produtos seta os dados conforme foram informados no produto anterior
          DMNfe.cdsProdutoAusente.Edit;
          DMNfe.cdsProdutoAusentecod_classe.Value := wCodClasse;
          DMNfe.cdsProdutoAusentecod_tributacao.Value := wCodTributacao;
          if wCodMarca > 0 then
            DMNfe.cdsProdutoAusentecod_marca.Value := wCodMarca
          else
            DMNfe.cdsProdutoAusentecod_marca.Clear;
          DMNfe.cdsProdutoAusentecod_cst_Ipi.Value := wCstIpi;
          DMNfe.cdsProdutoAusentecod_cst_Ipi_saida.Value := wCstIpiSaida;
          DMNfe.cdsProdutoAusentecod_cst_pis.Value := wCstPis;
          DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value := wCstPisSaida;
          DMNfe.cdsProdutoAusentecod_cst_cofins.Value := wCstCofins;
          DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value := wCstCofinsSaida;
          DMNfe.cdsProdutoAusente.Post;
        end;
      //end;
    end;
  end;
  TemProdutoVinculado;
end;

function TFImportacaoNfe.TemProdutoVinculado: boolean;
  var wDescProduto, wCodProduto: string;
begin
  result := false;
  wDescProduto := '';
  // Mesmo no modo somente por NCM, consulta o vinculo atual para permitir que o usuario faça a vinculacao manual deste produto.
  if (DMNfe.cdsProdutoAusentecprod.Value <> '') and (codFor > 0) then
  begin
    if(DMNfe.cdsProdutoAusentecprod.Text <> '') then
    begin
      wCodproduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTOXML_PRODUTOBD','CPROD = ' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Text) +
                     ' AND COD_FORNECEDOR_XML = ' + IntToStr(DMNfe.pCodForImportacaoXML) );
      wDescProduto := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QuotedStr(wCodProduto) );
    end
    else
      wDescProduto := DMOracle.FastSelect('P.DESC_PRODUTO','TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
                            'PXMLBD.CPROD = ' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Value) + ' AND PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(codFor) );
  end;
  if wDescProduto <> '' then
  begin
    MEProdutoVinculado.Text := wDescProduto;
    MEProdutoVinculadoAristides.Text := wDescProduto;
  end
  else
  begin
    MEProdutoVinculado.Clear;
    MEProdutoVinculadoAristides.Clear;
  end;
  result := (wDescProduto <> '');
  if (DMParamSistema.CodEmpresa <> 'FINESTRA') and (DMParamSistema.CodEmpresa <> 'KREUZ') then
  begin
    // Permite vincular mesmo quando os dados para cadastro (classe e tributacao) ja foram preenchidos/restaurados ao retornar desta tela.
    btVincularProduto.Enabled := not result;
    btDesvincularProduto.Enabled := result;
  end;
end;

procedure TFImportacaoNfe.btDesvincularProdutoClick(Sender: TObject);
var executador: TExecutador;
wSql: string;
begin
  if MessageDlg('Deseja excluir o vinculo do produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    executador := TExecutador.Create;
    executador.Limpa;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
      wSql := 'DELETE FROM TB_PRODUTOXML_PRODUTOBD WHERE' + ' CPROD = ' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Value) + ' AND COD_FORNECEDOR_XML = ' +
              IntToStr(codFor) + ' AND DESC_PRODUTO_XML LIKE ' + QuotedStr(DMNfe.cdsProdutoAusentedesc_produto_aux.Value)
    else
      wSql := 'DELETE FROM TB_PRODUTOXML_PRODUTOBD WHERE' + ' CPROD = ' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Value) + ' AND COD_FORNECEDOR_XML = ' +
              IntToStr(codFor);
    executador.Adiciona(wSql);
    executador.Executar(true, true);
    executador.Free;
    executador := nil;
    DMNfe.cdsProdutoAusente.Edit;
    DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := false;
    DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := false;
    DMNfe.cdsProdutoAusente.Post;
    TemProdutoVinculado;
  end;
end;

procedure TFImportacaoNfe.VinculaProdutosProdutoVinculado;
var
  wCodProduto: string;
  recNumber: Integer;
begin
    with DMNfe do
  begin
    cdsProdutoXML.DisableControls;
    try
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof do
      begin
        wCodProduto := '';
        wCodProduto := DMOracle.FastSelect('P.COD_PRODUTO','TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
                       'PXMLBD.CPROD = ' + QuotedStr(DMNfe.cdsProdutoXMLcprod.Value) + ' AND PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(codFor));

        if Trim(wCodProduto) <> '' then
        begin
          // Insere diretamente no cdsProdutoNcmDuplicado sem depender do estado do grid
          RetiraItemNota(wCodProduto, cdsProdutoXMLproduto.Value,
            cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value);

          cdsProdutoNcmDuplicado.Insert;
          cdsProdutoNcmDuplicadocodigo.Text    := wCodProduto;
          cdsProdutoNcmDuplicadodesc_produto_bd.Text  := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
          cdsProdutoNcmDuplicadodesc_produto_xml.Text := cdsProdutoXMLproduto.Value;
          cdsProdutoNcmDuplicadocprod_xml.Text        := cdsProdutoXMLcprod.Value;
          cdsProdutoNcmDuplicadoitem.Value            := cdsProdutoXMLitem.Value;
          if RGNCM.ItemIndex = 1 then
            cdsProdutoNcmDuplicadoncm.Value := cdsProdutoXMLncm.Value
          else
            cdsProdutoNcmDuplicadoncm.Value := DMOracle.FastSelect('NUM_GENERO_NCM', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
          cdsProdutoNcmDuplicado.Post;
          AtualizaQtItensVinculados('+');
          // Marca o item XML como associado
          if not (cdsProdutoXML.State in [dsEdit, dsInsert]) then
            cdsProdutoXML.Edit;
          cdsProdutoXMLAssociado.Value := true;
          cdsProdutoXML.Post;

          Application.ProcessMessages;
        end;
        cdsProdutoXML.Next;
      end;
      // Posiciona no primeiro item nao associado, se houver
      cdsProdutoXML.First;
      while not cdsProdutoXML.Eof do
      begin
        if not cdsProdutoXMLAssociado.Value then
          Break;
        cdsProdutoXML.Next;
      end;

      try
        if Assigned(DBGrid2) and Assigned(DBGrid2.DataSource) and Assigned(DBGrid2.DataSource.DataSet) then
          DBGrid2.SelectedField := DBGrid2.DataSource.DataSet.FieldByName('CHECADO');
      except
      end;
    finally
      cdsProdutoXML.EnableControls;
      btnAvancar.Refresh;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TFImportacaoNfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FClassTribIBSCBSVendaPorItem);
  FreeAndNil(FClassTribIBSCBSCompraPorItem);
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
  DMNfe.cdsProdutoNcmDuplicado.EmptyDataSet;
  DMNfe.cdsProdutoAusente.EmptyDataSet;
  DMNfe.cdsProdutoXML.EmptyDataSet;
end;

procedure TFImportacaoNfe.FmClasse1Enter(Sender: TObject);
begin
  FmClasse1.MeClasse.SetFocus;
end;

procedure TFImportacaoNfe.FmTributacao1Enter(Sender: TObject);
begin
  FmTributacao1.MeTributacao.SetFocus;
end;

procedure TFImportacaoNfe.MeProcurarFabricanteClick(Sender: TObject);
begin
  MeProcurarFabricante.Text := DMNfe.cdsProdutoXMLcprod.Text;
  MeProcurarFabricante.SelectAll;
end;

procedure TFImportacaoNfe.SetaPropriedadeRelacionamentoAutomatico;
begin
  // Verifica se esta trabalhando com identificacao de produtos com codigo de barras
    DMNfe.pVinculaProdutosPorCodigoBarras := (not cbNCM.Checked) and (not cbFabricante.Checked) and (cbCodBarras.Checked);

    // Verifica se esta trabalhando com identificacao de produtos por numero do fabricante
    DMNfe.pVinculaProdutosPorCodigo := ((not cbNCM.Checked) and (cbFabricante.Checked) and (not cbCodBarras.Checked)) or
                                       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONCREFER');
end;

procedure TFImportacaoNfe.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FClasseCons;
  Classe := TFClasseCons;
end;

procedure TFImportacaoNfe.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFImportacaoNfe.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FMarca_Cons;
  Classe := TFMarca_Cons;
end;

procedure TFImportacaoNfe.gerenciaCheckBox(checkBox: TObject;
  tabela: string);
var cb: TCheckBox;
  state: TCheckBoxState;
  evento: TNotifyEvent;
  codigo: string;
begin

  // Verifica se o produto esta em modo de edicao
  cb := TCheckBox(checkBox);
  state := cb.State;

  // Produto foi cadastrado anteriormente, nao deve fazer nada
  if DMNfe.cdsProdutoAusentecod_produto.Value = 0 then
  begin
    cb.Checked := false;
    exit;
  end;

  // Busca o codigo da opcao checada na tabela passada por parametro
  codigo := DMOracle.FastSelect( ('COD' + copy(tabela, 3, length(tabela))), tabela , ('DESC' + copy(tabela, 3, length(tabela)) + ' = '
            + QuotedStr(UpperCase(bib.RemoveAcentos(Copy(cb.Name, 3, Length(cb.Name)))))));

  if codigo = '' then
  begin
    cb.Checked := false;
    Raise Exception.Create('Opção inexistente na tabela ' + tabela);
  end;

// Monta SQLs para inserir ou excluir dos registros nas tabelas associativas
  with DMProduto do
  begin
    if cb.State = cbChecked then
    begin
      SqlDadosCalcados.Add('INSERT INTO TB_PRODUTO' + copy(tabela, 3, length(tabela)) + ' VALUES (' + DMNfe.cdsProdutoAusenteCOD_PRODUTO.Text + ', '
                           + codigo + ')');
    end
    else
    begin
      SqlDadosCalcados.Add('DELETE FROM TB_PRODUTO' + copy(tabela, 3, length(tabela)) + ' WHERE COD_PRODUTO = ' + DMNfe.cdsProdutoAusenteCOD_PRODUTO.Text
                           + ' AND COD' + copy(tabela, 3, length(tabela)) + ' = ' + codigo);
    end;
  end;

  with DMProduto do
  begin
    SalvaDadosCalcados(true);
    QDadosCalcadosCons.Close;
    QDadosCalcadosCons.SetVariable('COD_PRODUTO',  DMNfe.cdsProdutoAusenteCOD_PRODUTO.Value);
    QDadosCalcadosCons.Open;
  end;
end;

procedure TFImportacaoNfe.cbMasculinoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbFemininoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbUnissexClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbAdultoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbInfantilClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbBebeClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_GENERO_CALCADO');
end;

procedure TFImportacaoNfe.cbAltoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbBaixoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbMedioClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbRasteiraClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbGrossoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbFinoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbAnabelaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbFacheteClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbEncapadoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbCorticaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbAcrilicoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbLatexClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbBorrachaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbPVCClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbTRClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_SALTO_CALCADO');
end;

procedure TFImportacaoNfe.cbCouroClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbSinteticoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbSwedClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbMicrofibraClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbVernizClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbLonaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbTecidoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbGliterClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbCamurcaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbNobukClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbElasticoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.cbPlasticoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_MATERIAL_CALCADO');
end;

procedure TFImportacaoNfe.LimpaCheckBox;
var nomes: string;
i,j: integer;
event: TNotifyEvent;
begin
  nomes := 'GBGENERO,GBSALTO,GBMATERIAL,GBCONFIG,';
  // Limpa os ckeckboxes
  for i := 0 to self.ComponentCount - 1 do
  begin
    if self.Components[i].ClassName = 'TGroupBox' then
    begin
      if Pos(UpperCase(TGroupBox(self.Components[i]).Name), nomes) > 0 then
      begin
        // CheckBox
        for j := 0 to TGroupBox(self.Components[i]).ControlCount -1 do
        begin
          event := TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick;
          TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick := nil;
          TCheckBox(TGroupBox(self.Components[i]).Controls[j]).Checked := false;
          TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick := event;
        end;
      end;
    end;
  end;
end;


procedure TFImportacaoNfe.BuscaDadosCalcados;
var descDado: string;
i, j: integer;
event: TNotifyEvent;
begin
  LimpaCheckBox;
  with DMProduto, DMNfe do
  begin
    if cdsProdutoAusente.Eof then
      exit;

    QDadosCalcadosCons.Close;
    QDadosCalcadosCons.SetVariable('COD_PRODUTO',  cdsProdutoAusenteCOD_PRODUTO.Value);
    QDadosCalcadosCons.Open;

    while not QDadosCalcadosCons.Eof do
    begin
      // Busca a descricao do dado que esta na tabela associativa que associa o produto ao dado do calculado
      descDado
        := DMOracle.FastSelect('DESC' + copy(QDadosCalcadosConsTABELA.Value, 11, length(QDadosCalcadosConsTABELA.Value)), 'TB' +
                               Copy(QDadosCalcadosConsTABELA.Value, 11, length(QDadosCalcadosConsTABELA.Value)), 'COD' +
                               Copy(QDadosCalcadosConsTABELA.Value, 11, length(QDadosCalcadosConsTABELA.Value)) + ' = ' + QDadosCalcadosConsCOD_DADO.Text);

{ Busca o GroupBox relacionado ao dado, utilizando nome da tabela que vem da query. De posse do GroupBox e decricao do dado, marca o checkbox corretamente
Chama a procedure GerenciaCheckbox para gerar as SQLs}
      for i := 0 to self.ComponentCount - 1 do
      begin
        if self.Components[i].ClassName = 'TGroupBox' then
        begin
          if Pos(UpperCase(Copy(self.Components[i].Name, 3, length(self.Components[i].Name))), QDadosCalcadosConsTABELA.Value) > 0 then
          begin
            // CheckBox
            for j := 0 to TGroupBox(self.Components[i]).ControlCount -1 do
            begin
              if UpperCase(Copy(TGroupBox(self.Components[i]).Controls[j].Name, 3, length(TGroupBox(self.Components[i]).Controls[j].Name))) = descDado then
              begin
                event := TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick;
                TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick := nil;
                TCheckBox(TGroupBox(self.Components[i]).Controls[j]).Checked := true;
                TCheckBox(TGroupBox(self.Components[i]).Controls[j]).OnClick := event;
              end;
            end;
          end;
        end;
        
      end;             
      QDadosCalcadosCons.Next;
    end;
  end;
end;


procedure TFImportacaoNfe.DBGProdutoAusenteAristidesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DMNfe.cdsProdutoAusente.State in [DsInsert, DsEdit]) and (DMNfe.cdsProdutoAusente.RecNo = wCDSProdutoAusenteRecNo) then
    exit;

  if (DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value) or (DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value) then
  begin
    DBGProdutoAusenteAristides.Canvas.Brush.Color := clGradientActiveCaption;
    DBGProdutoAusenteAristides.Canvas.FillRect(Rect);
    DBGProdutoAusenteAristides.DefaultDrawColumnCell( Rect,DataCol,Column,State);
  end;

  // Configuracoes adicionais de calculados

  if (DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value) and
    (DMNfe.cdsProdutoAusentetem_dados_calcados.Value) then
  begin
    DBGProdutoAusenteAristides.Canvas.Brush.Color := clMoneyGreen;
    DBGProdutoAusenteAristides.Canvas.FillRect(Rect);
    DBGProdutoAusenteAristides.DefaultDrawColumnCell( Rect,DataCol,Column,State);
  end;
end;

procedure TFImportacaoNfe.DBPanel4CodigoChange(Sender: TObject);
begin
  if TDBEdit(Sender).Text = '0' then
    TDBEdit(Sender).Clear;
end;

procedure TFImportacaoNfe.DBPanel5CodigoChange(Sender: TObject);
begin
  if TDBEdit(Sender).Text = '0' then
    TDBEdit(Sender).Clear;
end;

procedure TFImportacaoNfe.btConfirmarProdutoAristidesClick(
  Sender: TObject);
var wSql: String;
  j: integer;
  wCodProdutoStr: String;
  wCodProdutoInt: integer;
begin
  try
    if (DSProdutoAusente.State in [DSInsert, DSEdit]) then
      DSProdutoAusente.DataSet.Post;

    // Cadastra o produto no B.D.
    if (DMNfe.cdsProdutoAusentecod_tributacao.Value > 0)    and (DMNfe.cdsProdutoAusentecod_classe.Value > 0) and
       (not DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value) and (not DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value) then
    begin
      if not CadastraProdutoAusente(false) then
        exit;
      DMNfe.cdsProdutoAusente.Edit;
      DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := true;
      DMNfe.cdsProdutoAusente.Post;
      // vincula produto do xml com produto do BD
      if not DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value then
      begin
        wSql := 'INSERT INTO TB_PRODUTOXML_PRODUTOBD(' + 'CPROD,COD_FORNECEDOR_XML,COD_PRODUTO,DESC_PRODUTO_XML,IND_CADASTRO_PRODUTO,NUM_ITEM,COD_USUARIO)'
            + ' VALUES (' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Value) + ', ' + IntToStr(codFor) + ', ' + DMNfe.CDSProdutoAusentecod_produto.Text + ', '
            + QuotedStr(DMNfe.cdsProdutoAusentedesc_produto_aux.Value) + ', ' + QuotedStr('SIM') + ', ' + DMNfe.cdsProdutoAusentenum_item.Text
            + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
        DMOracle.ExecutaSql(wSql);
        DMNfe.cdsProdutoAusente.Edit;
        DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
        DMNfe.cdsProdutoAusente.Post;
      end;
      PCProdutosAristides.ActivePageIndex := 1;
    end
    else
    begin
      if (not DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value) and (not DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value) then
        MessageDlg('Campos obrigatórios não preenchidos', mtError, [mbOk], 0);
    end;

    // Seta o Lote no TArrProdutoNfe
    for j:=0 to Length(arrProdutoNfe) - 1 do
    begin
      if (CompareStr(Trim(arrProdutoNfe[j].numFabricante), Trim(DMNfe.cdsProdutoAusentenum_fabricante.Value)) = 0) and
         (CompareStr(Trim(arrProdutoNfe[j].item), Trim(DMNfe.cdsProdutoAusentenum_item.Text)) = 0) then
        arrProdutoNfe[j].lote := DMNfe.cdsProdutoAusentecod_lote_tipo.Value;
    end;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFImportacaoNfe.PCProdutosAristidesChange(Sender: TObject);
begin
  DSProdutoAusente.DataSet.DisableControls;
  DSProdutoAusente.DataSet.First;
  DSProdutoAusente.DataSet.EnableControls;
end;

procedure TFImportacaoNfe.btConfirmarProdutoAristidesConfigClick(
  Sender: TObject);
var wCodClasse, wCodTributacao, wCodMarca: integer;
  wCstIpi, wCstIpiSaida, wCstPis, wCstPisSaida, wCstCofins, wCstCofinsSaida: string;
begin
  with DMNfe, DMProduto do
  begin
    QDadosCalcadosCons.Close;
    QDadosCalcadosCons.SetVariable('COD_PRODUTO',  cdsProdutoAusenteCOD_PRODUTO.Value);
    QDadosCalcadosCons.Open;
    if not QDadosCalcadosCons.Eof then
    begin
      cdsProdutoAusente.DisableControls;
      cdsProdutoAusente.Edit;
      cdsProdutoAusentetem_dados_calcados.Value := true;
      cdsProdutoAusente.Post;
      cdsProdutoAusente.EnableControls;
    end
    else
    begin
      cdsProdutoAusente.DisableControls;
      cdsProdutoAusente.Edit;
      cdsProdutoAusentetem_dados_calcados.Value := false;
      cdsProdutoAusente.Post;
      cdsProdutoAusente.EnableControls;
    end;
    try
      if AlteraProduto then
      begin
        wCodClasse := DMNfe.cdsProdutoAusentecod_classe.Value;
        wCodTributacao := DMNfe.cdsProdutoAusentecod_tributacao.Value;
        wCodMarca := DMNfe.cdsProdutoAusentecod_marca.Value;
        wCstIpi := DMNfe.cdsProdutoAusentecod_cst_Ipi.Value;
        wCstIpiSaida := DMNfe.cdsProdutoAusentecod_cst_Ipi_saida.Value;
        wCstPis := DMNfe.cdsProdutoAusentecod_cst_pis.Value;
        wCstPisSaida := DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value;
        wCstCofins := DMNfe.cdsProdutoAusentecod_cst_cofins.Value;
        wCstCofinsSaida := DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value;

        DSProdutoAusente.DataSet.Next;

        if DSProdutoAusente.DataSet.Eof then
        begin
          btAvancarClick(self);
        end
        else
        begin
          // Se nao for fim dos produtos seta os dados conforme foram informados no produto anterior
          DMNfe.cdsProdutoAusente.Edit;
          DMNfe.cdsProdutoAusentecod_classe.Value := wCodClasse;
          DMNfe.cdsProdutoAusentecod_tributacao.Value := wCodTributacao;
          if wCodMarca > 0 then
            DMNfe.cdsProdutoAusentecod_marca.Value := wCodMarca
          else
            DMNfe.cdsProdutoAusentecod_marca.Clear;
          DMNfe.cdsProdutoAusentecod_cst_Ipi.Value := wCstIpi;
          DMNfe.cdsProdutoAusentecod_cst_Ipi_saida.Value := wCstIpiSaida;
          DMNfe.cdsProdutoAusentecod_cst_pis.Value := wCstPis;
          DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value := wCstPisSaida;
          DMNfe.cdsProdutoAusentecod_cst_cofins.Value := wCstCofins;
          DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value := wCstCofinsSaida;
          DMNfe.cdsProdutoAusente.Post;
          PCProdutosAristides.ActivePageIndex := 0;
        end;
      end;

    except
      on E : exception do
      begin
        MessageDlg('Erro ao atualizar produto: ' + E.Message, mtError, [mbOk], 0);
        exit;
      end;
    end;
  end;
end;

procedure TFImportacaoNfe.cbBonecaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbDorsaiClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbSlipperClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbEsportivaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbIateClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbOverClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbCampoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbSuicoSocietyClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbTiraTornozeloClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbSalomeClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbDedoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbEstreitoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb2TirasClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbMuleClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbCoturnoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbMontariaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbOpenbootClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbCanoMedioClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbMedioConfigClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb2AlcasClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbTransversalClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbBauClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbNotebookClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbFestaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbClutchClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbKitClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbSliponClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbEscolarClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbViagemClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb360Click(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbGaspeaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbProtecaoSolarClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbMangaLongaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbMangaCurtaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbTermicaClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbAnklebootClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbIndoorSalaoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb2RodasClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb4RodasClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cb5RodasClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbLargoClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbTiraXClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

function TFImportacaoNfe.CadastraProdutoAusente(cadastraTodos: boolean = true): boolean;
var
  wSql,wNumItem, wCprod, wCodProdutoExistente: string;
begin
  result := true;
{Cadastra os produtos que estao no cdsProdutoAusente. Se o parametro cadastraTodos for false, cadastra apenas o produto corrente.Salva os produtos no B.D.}
  wSql := '';

  with DMNfe do
  begin
    if cadastraTodos then
      cdsProdutoAusente.First;
    while not cdsProdutoAusente.Eof do
    begin
      if ((cdsProdutoAusentecod_classe.Value > 0) and (cdsProdutoAusentecod_tributacao.Value > 0) and (not cdsProdutoAusenteind_vinculo_produto_bd.Value)) then
      begin
        try
        // Recupera um produto cadastrado anteriormente cujo vinculo com o item do XML nao tenha sido concluido.
          wCodProdutoExistente := '';
          if Trim(cdsProdutoAusentedesc_cod_barra.Text) <> '' then
            wCodProdutoExistente := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','DESC_COD_BARRA = ' + QuotedStr(Trim(cdsProdutoAusentedesc_cod_barra.Text)) +
                                    ' AND ROWNUM = 1');
          if (wCodProdutoExistente = '') and (Trim(cdsProdutoAusentenum_fabricante.Text) <> '') then
            wCodProdutoExistente := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO','REPLACE(UPPER(NUM_FABRICANTE), ''-'', '''') = ' + 'REPLACE(UPPER(' +
                                    QuotedStr(Trim(cdsProdutoAusentenum_fabricante.Text)) + '), ''-'', '''') AND ROWNUM = 1');
          if wCodProdutoExistente <> '' then
          begin
            MessageDlg('Este produto ja existe no sistema.' + #13#10 + 'Código do produto: ' + wCodProdutoExistente + #13#10 +
                       'Utilize o botao + para vincular o item do XML ao produto existente.', mtInformation, [mbOk], 0);
            result := false;
            Exit;
          end;
          // Obtem um codigo de produto previamente para poder ser utilizado na tabela de vinculo de produtos caso precise
          if cdsProdutoAusentecod_produto.Value = 0 then
          begin
            cdsProdutoAusente.Edit;
            cdsProdutoAusentecod_produto.Text := DMOracle.FastSelect('SQPRODUTO.NEXTVAL', 'DUAL', '1 = 1');
            cdsProdutoAusente.Post;
          end;

          if wCodProdutoExistente = '' then
          begin
            QInsereProduto.Close;
            QInsereProduto.SetVariable('COD_PRODUTO',cdsProdutoAusentecod_produto.Value);
            QInsereProduto.SetVariable('COD_CLASSE', cdsProdutoAusentecod_classe.Value);
            QInsereProduto.SetVariable('COD_TRIBUTACAO', cdsProdutoAusentecod_tributacao.Value);
            QInsereProduto.SetVariable('DESC_PRODUTO', cdsProdutoAusentedesc_produto.Value);
            QInsereProduto.SetVariable('NUM_EMBALAGEM', cdsProdutoAusentenum_embalagem.Value);
            QInsereProduto.SetVariable('DESC_UNIDADE', cdsProdutoAusentedesc_unidade.Value);
            QInsereProduto.SetVariable('IND_TIPO_PRODUTO', cdsProdutoAusenteind_tipo_produto.Value);
            QInsereProduto.SetVariable('NUM_FABRICANTE', cdsProdutoAusentenum_fabricante.Value);
            QInsereProduto.SetVariable('PERC_ISS', cdsProdutoAusenteperc_iss.Value);
            QInsereProduto.SetVariable('PERC_INSS', cdsProdutoAusenteperc_inss.Value);
            QInsereProduto.SetVariable('IND_SITUACAO', cdsProdutoAusenteind_situacao.Value);
            QInsereProduto.SetVariable('NUM_VOLUMES', cdsProdutoAusentenum_volumes.Value);
            QInsereProduto.SetVariable('NUM_GENERO_NCM', cdsProdutoAusentenum_genero_ncm.Value);
            QInsereProduto.SetVariable('DESC_COD_BARRA', cdsProdutoAusentedesc_cod_barra.Value);
            QInsereProduto.SetVariable('IND_SUBST_TRIB', cdsProdutoAusenteind_subst_trib.Value);
            if cdsProdutoAusentecod_cst_ipi.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_IPI', cdsProdutoAusentecod_cst_ipi.Value);
            if cdsProdutoAusentecod_cst_ipi_saida.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_IPI_SAIDA', cdsProdutoAusentecod_cst_ipi_saida.Value);
            if cdsProdutoAusentecod_cst_pis.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_PIS', cdsProdutoAusentecod_cst_pis.Value);
            if cdsProdutoAusentecod_cst_pis_saida.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_PIS_SAIDA', cdsProdutoAusentecod_cst_pis_saida.Value);
            if cdsProdutoAusentecod_cst_cofins.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_COFINS', cdsProdutoAusentecod_cst_cofins.Value);
            if cdsProdutoAusentecod_cst_cofins_saida.Value <> '' then
              QInsereProduto.SetVariable('COD_CST_COFINS_SAIDA', cdsProdutoAusentecod_cst_cofins_saida.Value);
            if cdsProdutoAusentecod_marca.Value > 0 then
              QInsereProduto.SetVariable('COD_MARCA', cdsProdutoAusentecod_marca.Value)
            else
              QInsereProduto.SetVariable('COD_MARCA', null);
            if cdsProdutoAusenteperc_margem_atacado.Text <> '' then
              QInsereProduto.SetVariable('PERC_MARGEM_ATACADO', cdsProdutoAusenteperc_margem_atacado.Text)
            else
              QInsereProduto.SetVariable('PERC_MARGEM_ATACADO', 0);
            if cdsProdutoAusenteind_bico.Value <> '' then
              QInsereProduto.SetVariable('IND_BICO', cdsProdutoAusenteind_bico.Value)
            else
              QInsereProduto.SetVariable('IND_BICO', null);
            if cdsProdutoAusenteind_solado.Value <> '' then
              QInsereProduto.SetVariable('IND_SOLADO', cdsProdutoAusenteind_solado.Value)
            else
              QInsereProduto.SetVariable('IND_SOLADO', null);
            if cdsProdutoAusenteind_enfeite.Value <> '' then
              QInsereProduto.SetVariable('IND_ENFEITE', cdsProdutoAusenteind_enfeite.Value)
            else
              QInsereProduto.SetVariable('IND_ENFEITE', null);
            if cdsProdutoAusentedesc_time.Value <> '' then
              QInsereProduto.SetVariable('DESC_TIME', cdsProdutoAusentedesc_time.Value)
            else
              QInsereProduto.SetVariable('DESC_TIME', null);
            if cdsProdutoAusentedesc_esporte.Value <> '' then
              QInsereProduto.SetVariable('DESC_ESPORTE', cdsProdutoAusenteDESC_ESPORTE.Value)
            else
              QInsereProduto.SetVariable('DESC_ESPORTE', null);
            if cdsProdutoAusenteval_varejo.Value > 0 then
              QInsereProduto.SetVariable('VAL_VAREJO', cdsProdutoAusenteval_varejo.Value);
            if FClassTribIBSCBSVendaPorItem.Values[cdsProdutoAusentenum_item.Text] <> '' then
              QInsereProduto.SetVariable('COD_CLASS_TRIB_IBS_CBS', StrToInt(FClassTribIBSCBSVendaPorItem.Values[cdsProdutoAusentenum_item.Text]))
            else
              QInsereProduto.SetVariable('COD_CLASS_TRIB_IBS_CBS', Null);
            if FClassTribIBSCBSCompraPorItem.Values[cdsProdutoAusentenum_item.Text] <> '' then
              QInsereProduto.SetVariable('COD_CLASS_TRIB_IBS_CBS_CMP', StrToInt(FClassTribIBSCBSCompraPorItem.Values[cdsProdutoAusentenum_item.Text]))
            else
              QInsereProduto.SetVariable('COD_CLASS_TRIB_IBS_CBS_CMP', Null);
            QInsereProduto.Open;
            cdsProdutoAusente.Edit;
            cdsProdutoAusenteind_cadastrado_bd.Value := true;
            cdsProdutoAusente.Post;
          end;

// Cria vinculo automatico para o produto cadastrado. Isso garante que o produto novo fique vinculado ao item do XML
          if not VinculoSomentePorNCM then
          begin
            executador := TExecutador.Create;
            executador.Limpa;
            if DMParamSistema.CodEmpresa = 'ARISTIDES' then  //IF - Aristides utiliza desc_produto_aux. Junior 07/05/2019 - Ajuda do marlon
            begin
              wSql := 'INSERT INTO TB_PRODUTOXML_PRODUTOBD(' + 'CPROD,COD_FORNECEDOR_XML,COD_PRODUTO,DESC_PRODUTO_XML,IND_CADASTRO_PRODUTO,NUM_ITEM,COD_PRODUTOXML_PRODUTOBD)'
                    + ' VALUES (' + QuotedStr(cdsProdutoAusentecprod.Value) + ', ' + IntToStr(codFor) + ', ' + cdsProdutoAusentecod_produto.Text + ', '
                    + QuotedStr(cdsProdutoAusentedesc_produto_aux.Value) + ', ' + QuotedStr('SIM') + ', ' + cdsProdutoAusentenum_item.Text
                    + ', SQPRODUTOXML_PRODUTOBD.NEXTVAL' + ')';
            end
            else
            begin
              wNumItem := Trim(cdsProdutoAusentenum_item.Text);
              if (wNumItem = '') and (Trim(cdsProdutoAusenteBackupnum_item.Text) <> '') then
                wNumItem := Trim(cdsProdutoAusenteBackupnum_item.Text);

              wCprod := Trim(cdsProdutoAusentecprod.Text);
              if (wCprod = '') and (Trim(cdsProdutoAusenteBackupcprod.Text) <> '') then
                wCprod := Trim(cdsProdutoAusenteBackupcprod.Text);

              if wNumItem = '' then
                raise Exception.Create('Numero do item do XML nao informado. O produto nao foi vinculado.');
              if wCprod = '' then
                raise Exception.Create('Codigo do produto no XML nao informado. O produto nao foi vinculado.');

              wSql := 'INSERT INTO TB_PRODUTOXML_PRODUTOBD('
                + 'CPROD,COD_FORNECEDOR_XML,COD_PRODUTO,DESC_PRODUTO_XML,IND_CADASTRO_PRODUTO,NUM_ITEM,COD_PRODUTOXML_PRODUTOBD,COD_USUARIO)'
                + ' VALUES (' + QuotedStr(wCprod) + ',' + IntToStr(codFor) + ', ' + cdsProdutoAusentecod_produto.Text + ', '
                + QuotedStr(cdsProdutoAusentedesc_produto.Value) + ', ' + QuotedStr('SIM') + ', ' + wNumItem + ', SQPRODUTOXML_PRODUTOBD.NEXTVAL, '
                + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
            end;
            executador.Adiciona(wSql);
            executador.Executar(true, false);
            executador.Free;
            executador := nil;
            cdsProdutoAusente.Edit;
            cdsProdutoAusenteind_vinculo_produto_bd.Value := true;
            cdsProdutoAusente.Post;
            
            // Garante apenas um vinculo para cada item da NF-e, inclusive quando o relacionamento por fabricante ocorrer em seguida.
            RetiraItemNota(cdsProdutoAusentecod_produto.Text,cdsProdutoAusentedesc_produto.Text,cdsProdutoAusentecprod.Text,cdsProdutoAusentenum_item.Text);

            // Adiciona o produto cadastrado ao cdsProdutoNcmDuplicado para que seja reconhecido na validacao
            cdsProdutoNcmDuplicado.Insert;
            cdsProdutoNcmDuplicadocodigo.Value := cdsProdutoAusentecod_produto.Value;
            cdsProdutoNcmDuplicadodesc_produto_bd.Value := cdsProdutoAusentedesc_produto.Value;
            if DMParamSistema.CodEmpresa = 'ARISTIDES' then
              cdsProdutoNcmDuplicadodesc_produto_xml.Value := cdsProdutoAusentedesc_produto_aux.Value
            else
              cdsProdutoNcmDuplicadodesc_produto_xml.Value := cdsProdutoAusentedesc_produto.Value;
            cdsProdutoNcmDuplicadocprod_xml.Value := cdsProdutoAusentecprod.Value;
            cdsProdutoNcmDuplicadoitem.Value := cdsProdutoAusentenum_item.Text;
            cdsProdutoNcmDuplicadoncm.Value := cdsProdutoAusentenum_genero_ncm.Value;
            cdsProdutoNcmDuplicado.Post;
          end;

        Except
          on e:Exception do
          begin
            if pos('SISTEMA.UK' ,e.Message) > 0 then
              MessageDlg('Este produto já existe no banco de dados.' + chr(13) + chr(10) + 'Número do Fabricante: ' + cdsProdutoAusentenum_fabricante.Text
                + chr(13) + chr(10) + 'Código de Barras: ' + cdsProdutoAusentedesc_cod_barra.Text, mtError, [mbOk], 0)
            else
            if pos('SISTEMA.PK', e.Message) > 0 then
              MessageDlg('Já existe um produto no banco de dados com este código.' + chr(13) + chr(10)
                + 'Código do produto: ' + cdsProdutoAusentecod_produto.Text, mtError, [mbOk], 0)
            else
              MessageDlg('Erro:' + e.Message, mtError, [mbOk], 0);
            result := false;
            DMOracle.DBCemapa.Rollback;
            Exit;
          end;
        end;
      end
      else
      begin
        if not cdsProdutoAusenteind_vinculo_produto_bd.Value then
          if MessageDlg('Produto não confirmado' + chr(13) + chr(10) + cdsProdutoAusentedesc_produto.Value + chr(13) + chr(10)
            + 'Para cadastrar o produto no sistema, deve-se confirmar o produto', mtWarning, [mbok, mbAbort], 0) = mrAbort then
            break;
      end;
      if cadastraTodos then
        cdsProdutoAusente.Next
      else
        break;
    end;
  end;
  DMOracle.DBCemapa.Commit;
  DMNfe.cdsProdutoXMLAfterScroll(DMNfe.QProdutoBD);//Atualizar os produtos apos o cadastro automatico. Junior 03/06/2015
end;

function TFImportacaoNfe.AlteraProduto: boolean;
begin
  result := false;
  // Atualiza dados do produto caso haja alguma alteracao
  with DMNfe do
  begin
    try
      QAlteraProduto.Close;
      QAlteraProduto.SetVariable('COD_PRODUTO',cdsProdutoAusentecod_produto.Value);
      QAlteraProduto.Open;
      if QAlteraProduto.Eof then
      begin
        result := false;
        raise exception.Create('Produto não encontrado no sistema');
      end;
      QAlteraProduto.Edit;
      if cdsProdutoAusenteind_solado.Value <> '' then
        QAlteraProdutoIND_SOLADO.Value := cdsProdutoAusenteind_solado.Value;
      if cdsProdutoAusenteind_bico.Value <> '' then
        QAlteraProdutoIND_BICO.Value := cdsProdutoAusenteind_bico.Value;
      if cdsProdutoAusenteind_enfeite.Value <> '' then
        QAlteraProdutoIND_ENFEITE.Value := cdsProdutoAusenteind_enfeite.Value;
      if cdsProdutoAusentedesc_time.Value <> '' then
        QAlteraProdutoDESC_TIME.Value := cdsProdutoAusentedesc_time.Value;
      if cdsProdutoAusentedesc_esporte.Value <> '' then
        QAlteraProdutoDESC_ESPORTE.Value := cdsProdutoAusentedesc_esporte.Value;
      QAlteraProduto.Post;
      result := true;
    Except
      result := false;
      raise;
    end;
  end;
end;

procedure TFImportacaoNfe.DBMDescProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];   
end;

procedure TFImportacaoNfe.btExcluirProdutoAristidesClick(Sender: TObject);
var wRecNo: integer;
begin
  wRecNo := 0;
  with DMProduto do
  begin
    QProduto.Close;
    QProduto.SetVariable('PK', DMNfe.cdsProdutoAusentecod_produto.Value);
    QProduto.Open;
    if not QProduto.Eof then
      if MessageDlg('Deseja realmente excluir o produto: ' + QProdutoDESC_PRODUTO.Value + '? ', mtInformation, [MbYes, MbNo], 0) = MrYes then
      begin
        try
          DMNfe.QProdutoXMLProdutoBD.Close;
          DMNfe.QProdutoXMLProdutoBD.SetVariable('COD_FORNECEDOR_XML', codFor);
          DMNfe.QProdutoXMLProdutoBD.SetVariable('COD_PRODUTO', DMNfe.cdsProdutoAusentecod_produto.Value);
          DMNfe.QProdutoXMLProdutoBD.Open;
          wRecNo := DMNfe.cdsProdutoAusente.RecNo;
          DMNfe.cdsProdutoAusente.DisableControls;
          while not DMNfe.QProdutoXMLProdutoBD.Eof do
          begin
            if DMNfe.cdsProdutoAusente.Locate('cprod;num_item',VarArrayOf([DMNfe.QProdutoXMLProdutoBDCPROD.Value,DMNfe.QProdutoXMLProdutoBDNUM_ITEM.Value]), []) then
            begin
              DMNfe.cdsProdutoAusente.Edit;
              DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := false;
              DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := false;
              DMNfe.cdsProdutoAusentecod_produto.Value := 0;
              DMNfe.cdsProdutoAusente.Post;
            end;
            DMNfe.QProdutoXMLProdutoBD.Next;
          end;
          DMNfe.cdsProdutoAusente.RecNo := wRecNo;
          DMNfe.cdsProdutoAusente.EnableControls;
          wRecNo := 0;
          DMOracle.DBCemapa.StartTransaction;
          QProduto.Delete;
          DMOracle.DBCemapa.Commit;
          DMNfe.cdsProdutoAusente.Edit;
          DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value := false;
          DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value := false;
          DMNfe.cdsProdutoAusentecod_produto.Value := 0;
          DMNfe.cdsProdutoAusente.Post;
        Except
          on E: exception do
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg(E.Message, mtError, [mbOk], 0);
          end;
        end;
      end;
  end;
end;

procedure TFImportacaoNfe.XmlCProdDuplicado;
  var wRecNo, wCont, wPosicao: integer;
begin
  with DMNfe do
  begin
    wCont := 0;
    wPosicao := 1;
    wRecNo := cdsProdutoAusente.RecNo;
    cdsProdutoAusente.First;
    cdsProdutoAusente.DisableControls;
    cdsProdutoAusenteBackup.First;
    while not cdsProdutoAusenteBackup.Eof do
    begin
      wCont := 0;
      cdsProdutoAusente.First;
      while not cdsProdutoAusente.Eof do
      begin
        if Trim(cdsProdutoAusentecprod.Text) = Trim(cdsProdutoAusenteBackupcprod.Text) then
          Inc(wCont);
        cdsProdutoAusente.Next;
      end;  
      if wCont >= 2 then
      begin
        cdsProdutoAusente.First;
        while not cdsProdutoAusente.Eof do
        begin
          if cdsProdutoAusentecprod.Value = cdsProdutoAusenteBackupcprod.Value then
          begin
            if cdsProdutoXML.Locate('cprod; produto', VarArrayOf([cdsProdutoAusentecprod.Value, cdsProdutoAusentedesc_produto_aux.Value]), []) then
            begin
              cdsProdutoXML.Edit;
              cdsProdutoXMLcprod.Value := cdsProdutoXMLcprod.Value + ' / ' + IntToStr(wPosicao);
              cdsProdutoXML.Post;
            end;
            cdsProdutoAusente.Edit;
            cdsProdutoAusentecprod.Value := cdsProdutoAusentecprod.Value + ' / ' + IntToStr(wPosicao);
            cdsProdutoAusente.Post;
            Inc(wPosicao);
          end;
          cdsProdutoAusente.Next;
        end;
      end;
      wPosicao := 1;
      cdsProdutoAusenteBackup.Next;
    end;
    cdsProdutoAusente.EnableControls;
    cdsProdutoAusente.RecNo := wRecNo;
    cdsProdutoAusenteBackup.First;
  end;
  GeraBackupProdutoAusente;
end;

procedure TFImportacaoNfe.GeraBackupProdutoAusente;
var
  wRecNo: integer;
begin
{Comentado esta linha pois quando abria a tela para relacionar ou cadastrar um produto que faz parte da lista de produtos nao encontrados. Alex 22/09/2025}
// DMNfe.cdsProdutoAusenteBackup.EmptyDataSet;
  DMNfe.cdsProdutoAusente.DisableControls;
  wRecNo := DMNfe.cdsProdutoAusente.RecNo;
  DMNfe.cdsProdutoAusente.First;
  while not DMNfe.cdsProdutoAusente.Eof do
  begin
// Atualiza se ja existe no Backup, adiciona se for novo
    if DMNfe.cdsProdutoAusenteBackup.Locate('num_item', DMNfe.cdsProdutoAusentenum_item.Value, []) then
      DMNfe.cdsProdutoAusenteBackup.Edit
    else
      DMNfe.cdsProdutoAusenteBackup.Append;

    DMNfe.cdsProdutoAusenteBackupnum_item.Value           := DMNfe.cdsProdutoAusentenum_item.Value;
    DMNfe.cdsProdutoAusenteBackupcod_produto.Value        := DMNfe.cdsProdutoAusentecod_produto.Value;
    DMNfe.cdsProdutoAusenteBackupcod_classe.Value         := DMNfe.cdsProdutoAusentecod_classe.Value;
    DMNfe.cdsProdutoAusenteBackupcod_tributacao.Value     := DMNfe.cdsProdutoAusentecod_tributacao.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_produto.Value       := DMNfe.cdsProdutoAusentedesc_produto.Value;
    DMNfe.cdsProdutoAusenteBackupnum_embalagem.Value      := DMNfe.cdsProdutoAusentenum_embalagem.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_unidade.Value       := DMNfe.cdsProdutoAusentedesc_unidade.Value;
    DMNfe.cdsProdutoAusenteBackupind_tipo_produto.Value   := DMNfe.cdsProdutoAusenteind_tipo_produto.Value;
    DMNfe.cdsProdutoAusenteBackupcprod.Value              := DMNfe.cdsProdutoAusentecprod.Value;
    DMNfe.cdsProdutoAusenteBackupnum_fabricante.Value     := DMNfe.cdsProdutoAusentenum_fabricante.Value;
    DMNfe.cdsProdutoAusenteBackupperc_iss.Value           := DMNfe.cdsProdutoAusenteperc_iss.Value;
    DMNfe.cdsProdutoAusenteBackupind_situacao.Value       := DMNfe.cdsProdutoAusenteind_situacao.Value;
    DMNfe.cdsProdutoAusenteBackupnum_volumes.Value        := DMNfe.cdsProdutoAusentenum_volumes.Value;
    DMNfe.cdsProdutoAusenteBackupnum_genero_ncm.Value     := DMNfe.cdsProdutoAusentenum_genero_ncm.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_cod_barra.Value     := DMNfe.cdsProdutoAusentedesc_cod_barra.Value;
    DMNfe.cdsProdutoAusenteBackupind_subst_trib.Value     := DMNfe.cdsProdutoAusenteind_subst_trib.Value;
    DMNfe.cdsProdutoAusenteBackupind_solado.Value         := DMNfe.cdsProdutoAusenteind_solado.Value;
    DMNfe.cdsProdutoAusenteBackupind_bico.Value           := DMNfe.cdsProdutoAusenteind_bico.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_time.Value          := DMNfe.cdsProdutoAusentedesc_time.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_esporte.Value       := DMNfe.cdsProdutoAusentedesc_esporte.Value;
    DMNfe.cdsProdutoAusenteBackupind_enfeite.Value        := DMNfe.cdsProdutoAusenteind_enfeite.Value;
    DMNfe.cdsProdutoAusenteBackupcod_lote_tipo.Value      := DMNfe.cdsProdutoAusentecod_lote_tipo.Value;
    DMNfe.cdsProdutoAusenteBackupind_cadastrado_bd.Value  := DMNfe.cdsProdutoAusenteind_cadastrado_bd.Value;
    if DMNfe.cdsProdutoAusentecod_marca.Value > 0 then
      DMNfe.cdsProdutoAusenteBackupcod_marca.Value        := DMNfe.cdsProdutoAusentecod_marca.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_ipi.Value           := DMNfe.cdsProdutoAusentecod_cst_ipi.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_ipi_saida.Value     := DMNfe.cdsProdutoAusentecod_cst_ipi_saida.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_pis.Value           := DMNfe.cdsProdutoAusentecod_cst_pis.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_pis_saida.Value     := DMNfe.cdsProdutoAusentecod_cst_pis_saida.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_cofins.Value        := DMNfe.cdsProdutoAusentecod_cst_cofins.Value;
    DMNfe.cdsProdutoAusenteBackupcod_cst_cofins_saida.Value  := DMNfe.cdsProdutoAusentecod_cst_cofins_saida.Value;
    DMNfe.cdsProdutoAusenteBackupdesc_produto_aux.Value      := DMNfe.cdsProdutoAusentedesc_produto_aux.Value;
    DMNfe.cdsProdutoAusenteBackupind_vinculo_produto_bd.Value:= DMNfe.cdsProdutoAusenteind_vinculo_produto_bd.Value;
    DMNfe.cdsProdutoAusenteBackupcfop.Value                  := DMNfe.cdsProdutoAusentecfop.Value;
    DMNfe.cdsProdutoAusenteBackup.Post;
    DMNfe.cdsProdutoAusente.Next;
  end;
  DMNfe.cdsProdutoAusente.RecNo := wRecNo;
  DMNfe.cdsProdutoAusente.EnableControls;
end;



procedure TFImportacaoNfe.DBPProdutoLoteItemNumeroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

procedure TFImportacaoNfe.DBPanel12DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFImportacaoNfe.SBProdutoLoteItemRemoverClick(Sender: TObject);
begin
  if DMNfe.QProdutoLoteItem.RecordCount > 0 then
    DMNfe.QProdutoLoteItem.Delete;
end;

procedure TFImportacaoNfe.BtnProdutoLoteInserirClick(Sender: TObject);
var
  wCodVinculado : string;
begin
  try
    if DMNfe.QProdutoLoteItem.State in [dsInsert] then
      DMNfe.QProdutoLoteItem.Post;

    wCodVinculado := DMOracle.FastSelect('P.COD_PRODUTO', 'TB_PRODUTO P INNER JOIN TB_PRODUTOXML_PRODUTOBD PXMLBD ON P.COD_PRODUTO = PXMLBD.COD_PRODUTO',
                     'PXMLBD.CPROD LIKE ' + QuotedStr(DMNfe.cdsProdutoAusentecprod.Value) + ' AND ' + 'PXMLBD.COD_FORNECEDOR_XML = ' + IntToStr(codFor) +
                     ' AND ' + 'PXMLBD.DESC_PRODUTO_XML = ' + QuotedStr(DMNfe.cdsProdutoAusentedesc_produto_aux.Value) + ' AND ' + 'PXMLBD.NUM_ITEM = ' +
                     DMNfe.cdsProdutoAusentenum_item.Text);
    if wCodVinculado =  '' then
      raise Exception.Create('Não há nenhum produto vinculado. Preencha um produto na aba informações gerais!');

    with DMNfe do
    begin
      QProdutoLoteItem.Insert;
      QProdutoLoteItemCPROD.Value := cdsProdutoAusentecprod.Value;
      QProdutoLoteItemCOD_FORNECEDOR_XML.Value := codFor;
      QProdutoLoteItemCOD_PRODUTO.Value := StrToInt(wCodVinculado);
      QProdutoLoteItemNUM_ITEM.Value := cdsProdutoAusentenum_item.Value;
    end;

    DBPProdutoLoteItemNumero.SetFocus;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFImportacaoNfe.DBEProdutoLoteItemQuantiaExit(Sender: TObject);
begin
  BtnProdutoLoteInserir.SetFocus;
end;

procedure TFImportacaoNfe.cbChunkyClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbSneakerClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.cbOxfordClick(Sender: TObject);
begin
  gerenciaCheckBox(Sender, 'TB_CONFIG_CALCADO');
end;

procedure TFImportacaoNfe.MEArquivoXMLKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then
    sbCarregaArquivo.Click;
end;

procedure TFImportacaoNfe.DBGProdutoAusenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then
    btVincularProduto.Click;
end;

procedure TFImportacaoNfe.TabSheet4Show(Sender: TObject);
begin
  DBGProdutoAusente.SetFocus;
end;

procedure TFImportacaoNfe.BTBaixarInfXmlSefaClick(Sender: TObject);
begin
  if FmFilial1.EdFilial.Text = 'Todas' then
    raise Exception.Create('Insira uma filial valida.');
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',FmFilial1.MeFilial.Text);
    QFilial.Open;
    if not QFilialDT_ULT_CONS_NFE_RECEBIDAS.IsNull then
      if(QFilialNUM_RET_ULT_CONS_NFE_RECEBIDAS.Value <> 138) And
        (Now <= IncHour(QFilialDT_ULT_CONS_NFE_RECEBIDAS.Value, 1)) then
        raise Exception.Create('A última consulta não localizou documentos (retorno: ' + QFilialNUM_RET_ULT_CONS_NFE_RECEBIDAS.Text
                                + '). Favor esperar mais: ' + TimeToStr(IncHour(QFilialDT_ULT_CONS_NFE_RECEBIDAS.Value, 1) - Now)
                                + ' minutos para a proxima consulta.');
  end;
  DMNfe.ConsultarNFes(StrToInt(Trim(FmFilial1.MeFilial.Text)));
  BTBuscarInfXmlSefaClick(Self);
end;

procedure TFImportacaoNfe.BTBuscarInfXmlSefaClick(Sender: TObject);
begin
  with DMNfe do
  begin
    QInfXmlSefaCons.Close;
    QInfXmlSefaCons.SetVariable('DT_INICIAL', FmDatas1.MeDtInicial.Text);
    QInfXmlSefaCons.SetVariable('DT_FINAL', FmDatas1.MeDtFinal.Text);
    if Trim(FmFilial1.MeFilial.Text) = '' then
      QInfXmlSefaCons.SetVariable('COD_FILIAL', Null)
    else
      QInfXmlSefaCons.SetVariable('COD_FILIAL', FmFilial1.MeFilial.Text);
    if CBSituacao.Text = '' then
      QInfXmlSefaCons.SetVariable('IND_SITUACAO', Null)
    else
      QInfXmlSefaCons.SetVariable('IND_SITUACAO', CBSituacao.Text);
    if Trim(EdNumNFe.Text) = '' then
      QInfXmlSefaCons.SetVariable('NUM_NOTA',Null)
    else
      QInfXmlSefaCons.SetVariable('NUM_NOTA',Trim(EdNumNFe.Text));
    QInfXmlSefaCons.Open;
  end;
end;

procedure TFImportacaoNfe.DsInfXmlSefaDataChange(Sender: TObject;
  Field: TField);
begin
  btnAvancar.Enabled := (MEArquivoXML.Text <> '') or (DsInfXmlSefa.DataSet.RecordCount > 0);
end;

procedure TFImportacaoNfe.FmFilial1MeFilialExit(Sender: TObject);
begin
  FmFilial1.MeFilialExit(Sender);
  DMOracle.ValidaFilial(FmFilial1.MeFilial.Text);
end;

procedure TFImportacaoNfe.MeChaveAcessoChange(Sender: TObject);
begin
  if (MeChaveAcesso.Text = '') Or (Trim(FmFilial2.MeFilial.Text) = '') then
  begin
    btConsultaNota.Enabled := ((DsInfXmlSefa.DataSet.State = dsBrowse) And (DsInfXmlSefa.DataSet.RecordCount > 0)) Or (MEArquivoXML.Text <> '');
    btnAvancar.Enabled := ((DsInfXmlSefa.DataSet.State = dsBrowse) And (DsInfXmlSefa.DataSet.RecordCount > 0)) Or (MEArquivoXML.Text <> '');
  end
  else
  begin
    btnAvancar.Enabled := true;
    MEArquivoXML.Clear;
  end;
end;

procedure TFImportacaoNfe.MeChaveAcessoExit(Sender: TObject);
begin
  FmFilial2.MeFilial.Text := '1';
end;

procedure TFImportacaoNfe.MeProcuraCodProdutoEnter(Sender: TObject);
begin
  if MeProcuraCodProduto.Text = 'Busca por Cod. produto' then
  begin
    MeProcuraCodProduto.Text := '';
    MeProcuraCodProduto.Font.Color := clBlack;
  end;
end;

procedure TFImportacaoNfe.MeProcuraCodProdutoExit(Sender: TObject);
begin
  MeProcuraCodProduto.Font.Color := clGrayText;
  MeProcuraCodProduto.Text := 'Busca por Cod. produto';
end;

procedure TFImportacaoNfe.MeProcuraCodProdutoChange(Sender: TObject);
begin
  if BibCompra.importacaoPorCodigo then
    exit;
  if (MeProcuraCodProduto.Text <> '') and (MeProcuraCodProduto.Text <> 'Busca por Cod. produto') then
  begin
    with DMNfe do
    begin
      RetiraItemNota(cdsProdutoBDCOD_PRODUTO.Text, cdsProdutoXMLproduto.Text,
          cdsProdutoXMLcprod.Value, cdsProdutoXMLitem.Value);
      cdsProdutoBD.EmptyDataSet;
      cdsProdutoBD.Close;
        cdsProdutoBD.Params.ParamByName('COD_PRODUTO').AsFloat := StrToFloat(Trim(MeProcuraCodProduto.Text));
        cdsProdutoBD.Params.ParamByName('NCM').Value := Null;        
        cdsProdutoBD.Params.ParamByName('NUM_FABRICANTE').Value := Null;
        cdsProdutoBD.Params.ParamByName('COD_BARRA').Value := Null;
        cdsProdutoBD.Open;
        cdsProdutoXML.Edit;
        cdsProdutoXMLAssociado.Value := false;
        cdsProdutoXML.Post;
    end;
  end;
end;

procedure TFImportacaoNfe.WMAvancarAposVinculo(var Msg: TMessage);
var
  wTodosAssociados: Boolean;
begin
  FAvancandoAutomaticamente := True;
  try
    wTodosAssociados := True;
    DMNfe.cdsProdutoXML.First;
    while not DMNfe.cdsProdutoXML.Eof do
    begin
      if not DMNfe.cdsProdutoXMLAssociado.Value then
      begin
        wTodosAssociados := False;
        Break;
      end;
      DMNfe.cdsProdutoXML.Next;
    end;
    DMNfe.cdsProdutoXML.First;

    btnAvancar.Enabled := wTodosAssociados;

    if wTodosAssociados and (DMNfe.cdsProdutoXML.RecordCount > 0) then
      btAvancarClick(Self);
  finally
    FAvancandoAutomaticamente := False;
  end;
end;

procedure TFImportacaoNfe.GerenciaTabSheetIndex(targetIndex: Integer);
var
  abaAtual: TTabSheet;
  proximaAba: TTabSheet;
begin
  abaAtual := PageControl1.ActivePage;
  indexTabSheet[count] := abaAtual.TabIndex;
  Inc(count);
  indexTabSheet[count] := PageControl1.Pages[targetIndex].TabIndex;
  Inc(count);
  proximaAba := PageControl1.Pages[targetIndex];
  proximaAba.TabVisible := true;
  PageControl1.ActivePage := proximaAba;
  abaAtual.TabVisible := false;
end;

end.

