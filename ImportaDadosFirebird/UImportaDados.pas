unit UImportaDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, Db, DBTables,
  ActnList, variants, OracleData, comobj, OraTeste;

type
  TFImportaDados = class(TForm)
    Panel1: TPanel;
    SBBase: TSpeedButton;
    PB: TProgressBar;
    Label1: TLabel;
    MEImp: TMaskEdit;
    MENaoImp: TMaskEdit;
    Label2: TLabel;
    SaveDialog: TSaveDialog;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    BtImportaProduto: TBitBtn;
    BtImpProdutosAtenas: TBitBtn;
    BitBtn33: TBitBtn;
    DBGrid32: TDBGrid;
    BitBtn32: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    BtImportaCadastro: TBitBtn;
    BtImpCadastroAtenas: TBitBtn;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    BtImpCtRecebCab: TBitBtn;
    DBGrid3: TDBGrid;
    BitBtn36: TBitBtn;
    TabSheet6: TTabSheet;
    DBGrid4: TDBGrid;
    BitBtn2: TBitBtn;
    TabSheet7: TTabSheet;
    DBGrid5: TDBGrid;
    BtImportaHistorico: TBitBtn;
    TabSheet4: TTabSheet;
    BtModelo: TBitBtn;
    Memo1: TMemo;
    TabSheet8: TTabSheet;
    PageControl3: TPageControl;
    TabSheet9: TTabSheet;
    BtImportaCp_Cab: TBitBtn;
    DBGrid6: TDBGrid;
    TabSheet10: TTabSheet;
    DBGrid7: TDBGrid;
    BitBtn3: TBitBtn;
    TabSheet11: TTabSheet;
    DBGrid8: TDBGrid;
    BitBtn1: TBitBtn;
    TabSheet12: TTabSheet;
    DBGrid9: TDBGrid;
    BitBtn4: TBitBtn;
    TabSheet13: TTabSheet;
    BtFinalidade: TBitBtn;
    DBGrid10: TDBGrid;
    TabSheet14: TTabSheet;
    DBGrid11: TDBGrid;
    BitBtn6: TBitBtn;
    TabSheet15: TTabSheet;
    DBGrid12: TDBGrid;
    BitBtn7: TBitBtn;
    TabSheet16: TTabSheet;
    BitBtn8: TBitBtn;
    DBGrid13: TDBGrid;
    TabSheet17: TTabSheet;
    Label3: TLabel;
    BtRomaneio: TBitBtn;
    DBGrid14: TDBGrid;
    MeDataInicial: TMaskEdit;
    TabSheet18: TTabSheet;
    DBGrid15: TDBGrid;
    BtnExportar: TBitBtn;
    TabSheet19: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BtnExportaLctoContabil: TBitBtn;
    BtnImportarLctoContabil: TBitBtn;
    EdFilial: TEdit;
    MEDtLancamentoI: TMaskEdit;
    MEDtLancamentoF: TMaskEdit;
    Edit2: TEdit;
    d: TTabSheet;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn11: TBitBtn;
    ED_Filial: TEdit;
    MEDT_Recebimento_I: TMaskEdit;
    MEDT_Recebimento_F: TMaskEdit;
    BitBtn12: TBitBtn;
    Edit1: TEdit;
    RGCondicaoPag: TRadioGroup;
    TabSheet21: TTabSheet;
    BitBtn14: TBitBtn;
    TabSheet22: TTabSheet;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ME22Filial: TMaskEdit;
    BTImportaCadBloqueado: TBitBtn;
    BitBtn17: TBitBtn;
    ME22Dias_Atraso: TMaskEdit;
    TabSheet23: TTabSheet;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    LBContExportacao: TLabel;
    BTExportaCadastroCancelado: TBitBtn;
    BTImportaCadastroCancelado: TBitBtn;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    LBContImportacao: TLabel;
    TabSheet20: TTabSheet;
    Label10: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    BtnExpSistAcco: TBitBtn;
    EdFilial1: TEdit;
    MEInicial: TMaskEdit;
    MEFinal: TMaskEdit;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    TabSheet24: TTabSheet;
    Label21: TLabel;
    ME24Importa: TBitBtn;
    ME24CodFilial: TMaskEdit;
    TabSheet26: TTabSheet;
    Bevel11: TBevel;
    Bevel12: TBevel;
    BtExportaCadastroInternet: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    TabSheet25: TTabSheet;
    ME25Importa: TBitBtn;
    TabSheet27: TTabSheet;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Label45: TLabel;
    Label47: TLabel;
    BtExpEscritaFiscalCliVendedorVendedor: TSpeedButton;
    Label24: TLabel;
    Label25: TLabel;
    BtnExportaEscritaFiscalCliente: TBitBtn;
    MeExpEscritaFiscalCliPeriodoInicial: TMaskEdit;
    MEExpEscritaFiscalCliVendedor: TMaskEdit;
    EdExpEscritaFiscalCliVendedor: TEdit;
    MeExpEscritaFiscalCliPeriodoFinal: TMaskEdit;
    TabSheet28: TTabSheet;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    BtnExportaEscritaFiscalNE: TBitBtn;
    Label26: TLabel;
    Label27: TLabel;
    MeExpEscritaFiscalNEDtInicio: TMaskEdit;
    MeExpEscritaFiscalNEDtFim: TMaskEdit;
    MeExpEscritaFiscalNEFilial: TMaskEdit;
    TabSheet29: TTabSheet;
    Bevel17: TBevel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Bevel18: TBevel;
    BtnExportaEscritaFiscalNS: TBitBtn;
    MeExpEscritaFiscalNSFilial: TMaskEdit;
    MeExpEscritaFiscalNSDtInicio: TMaskEdit;
    MeExpEscritaFiscalNSDtFim: TMaskEdit;
    Label34: TLabel;
    Label35: TLabel;
    TabSheet30: TTabSheet;
    Bevel19: TBevel;
    Label36: TLabel;
    Label38: TLabel;
    Bevel20: TBevel;
    BtnEFProdutos: TBitBtn;
    MeCodInicialEFProdutos: TMaskEdit;
    MeCodFinalEFProdutos: TMaskEdit;
    Label39: TLabel;
    LbEFProdutos: TLabel;
    TabSheet31: TTabSheet;
    Bevel21: TBevel;
    Label37: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Bevel22: TBevel;
    Label43: TLabel;
    Label44: TLabel;
    BtnExpContaReceber: TBitBtn;
    MeExpContaReceberFilial: TMaskEdit;
    MeExpContaReceberEmissaoInicial: TMaskEdit;
    MeExpContaReceberEmissaoFinal: TMaskEdit;
    Label42: TLabel;
    LbExpContaReceberTotal: TLabel;
    MeExpContaReceberVencimentoInicial: TMaskEdit;
    MeExpContaReceberVencimentoFinal: TMaskEdit;
    TabSheet32: TTabSheet;
    Bevel23: TBevel;
    Bevel24: TBevel;
    BtnImpContaReceber: TBitBtn;
    Label46: TLabel;
    LbImpContaReceberTotal: TLabel;
    TabSheet33: TTabSheet;
    GroupBox4: TGroupBox;
    LBContador: TLabel;
    BitBtn13: TBitBtn;
    TabSheet34: TTabSheet;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Label49: TLabel;
    Label48: TLabel;
    lbContaFolhaPG: TLabel;
    BitBtn15: TBitBtn;
    MeFilialFolha: TMaskEdit;
    TabSheet35: TTabSheet;
    BtComplementoCadastro: TBitBtn;
    DBGrid16: TDBGrid;
    TabSheet36: TTabSheet;
    SBImportaPedido: TSpeedButton;
    TabSheet37: TTabSheet;
    SpeedButton1: TSpeedButton;
    LblContador: TLabel;
    TabSheet38: TTabSheet;
    DBGrid17: TDBGrid;
    BtImportaCaixa: TBitBtn;
    TabSheet39: TTabSheet;
    GroupBox5: TGroupBox;
    Label51: TLabel;
    BtEmbarqueCons: TSpeedButton;
    Me39CodEmbarque: TMaskEdit;
    Lb39CodEmbarque: TListBox;
    Bt39Adicionar: TBitBtn;
    Bt39Excluir: TBitBtn;
    Bt39Exportar: TBitBtn;
    BitBtn10: TBitBtn;
    TabSheet40: TTabSheet;
    BtMovBanco: TBitBtn;
    DBGrid18: TDBGrid;
    TabSheet41: TTabSheet;
    GroupBox6: TGroupBox;
    Label50: TLabel;
    SB40EmbarqueCons: TSpeedButton;
    ME40Embarque: TMaskEdit;
    LB40CodEmbarque: TListBox;
    Bt40Adicionar: TBitBtn;
    Bt40Excluir: TBitBtn;
    Bt40Exportar: TBitBtn;
    RGTipo: TRadioGroup;
    TabSheet42: TTabSheet;
    SpeedButton2: TSpeedButton;
    TabSheet43: TTabSheet;
    Label52: TLabel;
    SpeedButton3: TSpeedButton;
    Label53: TLabel;
    SpeedButton4: TSpeedButton;
    BitBtn16: TBitBtn;
    MeFilial: TMaskEdit;
    MeUsuario: TMaskEdit;
    EdFilialRomaneio: TEdit;
    EdUsuarioRomaneio: TEdit;
    TabSheet44: TTabSheet;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    SpeedButton5: TSpeedButton;
    Label57: TLabel;
    Label58: TLabel;
    SB1Classe: TSpeedButton;
    SB1ClasseFinal: TSpeedButton;
    Sb1Fornecedor: TSpeedButton;
    Label59: TLabel;
    BtnExportarSyngenta: TBitBtn;
    MeSGIni: TMaskEdit;
    MeSGFin: TMaskEdit;
    Me1Filial: TMaskEdit;
    Ed1Filial: TEdit;
    ME1NumClasse: TMaskEdit;
    Me1SubClasses: TMaskEdit;
    Ed1SubClasses: TMaskEdit;
    ME1DescClasse: TMaskEdit;
    Ed1Nome: TEdit;
    Me1CodFornecedor: TMaskEdit;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    TabSheet45: TTabSheet;
    BitBtn20: TBitBtn;
    DBGrid19: TDBGrid;
    TabSheet46: TTabSheet;
    DBGrid20: TDBGrid;
    BitBtn5: TBitBtn;
    TabSheet47: TTabSheet;
    DBGrid21: TDBGrid;
    BtImportaMarca: TBitBtn;
    TabSheet48: TTabSheet;
    DBGrid22: TDBGrid;
    BitBtn21: TBitBtn;
    TabSheet49: TTabSheet;
    DBGrid23: TDBGrid;
    BitBtn9: TBitBtn;
    TabSheet50: TTabSheet;
    DBGrid24: TDBGrid;
    BitBtn22: TBitBtn;
    TabSheet51: TTabSheet;
    DBGrid25: TDBGrid;
    BitBtn23: TBitBtn;
    TabSheet52: TTabSheet;
    DBGrid26: TDBGrid;
    BitBtn24: TBitBtn;
    TabSheet59: TTabSheet;
    DBGrid31: TDBGrid;
    BitBtn31: TBitBtn;
    TabSheet53: TTabSheet;
    PageControl4: TPageControl;
    TabSheet54: TTabSheet;
    BitBtn25: TBitBtn;
    DBGrid27: TDBGrid;
    TabSheet55: TTabSheet;
    DBGrid28: TDBGrid;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    TabSheet56: TTabSheet;
    PageControl5: TPageControl;
    TabSheet57: TTabSheet;
    DBGrid29: TDBGrid;
    BitBtn28: TBitBtn;
    TabSheet58: TTabSheet;
    DBGrid30: TDBGrid;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    TabSheet60: TTabSheet;
    DBGrid33: TDBGrid;
    BitBtn34: TBitBtn;
    TabSheet61: TTabSheet;
    BitBtn35: TBitBtn;
    TabSheet62: TTabSheet;
    BitBtn37: TBitBtn;
    TabSheet63: TTabSheet;
    DBGrid34: TDBGrid;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    DBGrid35: TDBGrid;
    DBGrid36: TDBGrid;
    BitBtn45: TBitBtn;
    TabSheet64: TTabSheet;
    PageControl6: TPageControl;
    TabSheet65: TTabSheet;
    BitBtn46: TBitBtn;
    DBGrid37: TDBGrid;
    TabSheet66: TTabSheet;
    DBGrid38: TDBGrid;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    TabSheet67: TTabSheet;
    PageControl7: TPageControl;
    TabSheet68: TTabSheet;
    DBGrid39: TDBGrid;
    BitBtn49: TBitBtn;
    TabSheet69: TTabSheet;
    DBGrid40: TDBGrid;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    TabSheet70: TTabSheet;
    DBGrid41: TDBGrid;
    BitBtn54: TBitBtn;
    TabSheet71: TTabSheet;
    DBGrid42: TDBGrid;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    ODImportaXLS: TOpenDialog;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    procedure SBBaseClick(Sender: TObject);
    procedure BtImportaProdutoClick(Sender: TObject);
    procedure BtImportaCadastroClick(Sender: TObject);
    procedure BtImportaHistoricoClick(Sender: TObject); 
    procedure BitBtn3Click(Sender: TObject);  
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BtnExportaLctoContabilClick(Sender: TObject);
    procedure BtnImportarLctoContabilClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BTImportaCadBloqueadoClick(Sender: TObject);
    procedure BTExportaCadastroCanceladoClick(Sender: TObject);
    procedure BTImportaCadastroCanceladoClick(Sender: TObject);
    procedure BtnExpSistAccoClick(Sender: TObject);
    procedure ME24ImportaClick(Sender: TObject);
    procedure ME25ImportaClick(Sender: TObject);
    procedure BtExportaCadastroInternetClick(Sender: TObject);
    procedure BtnExportaEscritaFiscalClienteClick(Sender: TObject);
    procedure BtnExportaEscritaFiscalNEClick(Sender: TObject);
    procedure BtnExportaEscritaFiscalNSClick(Sender: TObject);
    procedure BtnEFProdutosClick(Sender: TObject);
    procedure BtnExpContaReceberClick(Sender: TObject);
    procedure BtnImpContaReceberClick(Sender: TObject);
    procedure MEExpEscritaFiscalCliVendedorExit(Sender: TObject);
    procedure BtExpEscritaFiscalCliVendedorVendedorClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BtComplementoCadastroClick(Sender: TObject);
    procedure SBImportaPedidoClick(Sender: TObject);
    procedure percorreArquivoTexto;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtImportaCaixaClick(Sender: TObject);
    procedure Sb39FilialClick(Sender: TObject);
    procedure Bt39AdicionarClick(Sender: TObject);
    procedure Me39CodEmbarqueKeyPress(Sender: TObject; var Key: Char);
    procedure Bt39ExcluirClick(Sender: TObject);
    procedure Bt39ExportarClick(Sender: TObject);
    procedure BtEmbarqueConsClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure BtMovBancoClick(Sender: TObject);
    procedure Bt40ExportarClick(Sender: TObject);
    procedure ME40EmbarqueKeyPress(Sender: TObject; var Key: Char);
    procedure Bt40AdicionarClick(Sender: TObject);
    procedure Bt40ExcluirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MeFilialChange(Sender: TObject);
    procedure MeUsuarioChange(Sender: TObject);
    procedure BtnExportarSyngentaClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Sb1FornecedorClick(Sender: TObject);
    procedure Me1CodFornecedorExit(Sender: TObject);
    procedure ME1NumClasseExit(Sender: TObject);
    procedure SB1ClasseClick(Sender: TObject);
    procedure Me1SubClassesExit(Sender: TObject);
    procedure SB1ClasseFinalClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BtRomaneioClick(Sender: TObject);
    procedure BtFinalidadeClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtImportaMarcaClick(Sender: TObject);
    procedure BtImpProdutosAtenasClick(Sender: TObject);
    procedure BtImpCadastroAtenasClick(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);

  private
    { Private declarations }
    wbooBase : Boolean;     //usado no arquivo de escrita fiscal para efetuar o controle da inserçao das aliquotas de icms
    wintContBase : Integer; //usado no arquivo de escrita fiscal com a mesma funcionalidade acima
    wfloVlrIsentas : Real;  //usado no arquivo de escrita fiscal

    Function RemoveAspas(Texto:String):String;
    Function Telefone(wstrTel : String):String;
    Function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
    function FormataCGC(wstrOpcao, wstrCGC : String):String;
    Function Classificacao( wintOperacao, wintSituacao, wintCondPgto : Integer ):String;
    Function ValoresIcms( wbooBrinde : Boolean; wintSituacao, wintCfop : Integer; wstrBase, wstrIcms, wstrAliquota, wstrVlrContabil : String ):String;
    Function ValoresIpi( wintCfop : Integer; wstrValIpi : String ):String;
    Function RetornaItens( wContador : Integer ; wstrItem : String ):String;
    Function RetornaNotas( wstrNota : String ):String;
    function StrZero(Num,Digitos : Integer): string;
    Function LimpaCep(wCep : String) : String;
    Function LimpaEndereco(wEndereco : String) : String;
    function DeletaChar(Texto, Char : string) : string;
    function LimpaString(wString, wRetirar: String): String;
    function AjustaStr(str: String; tam: Integer): String;
    function CortaStr(str: String; tam: Integer): String;
    function ConverteStrToInt(pStr :String) :Integer;
  public
    { Public declarations }

  end;

var
  FImportaDados: TFImportaDados;

implementation

uses UOracle_cl, UImportaDados_cl, UBiblioteca, UConverte_cl, USequencia_cl,
  UUsuario_cl, UVendedorCons, UVendedor_cl,
  StrUtils, UParamSistema_cl, UFilialCons, UFilial_cl, UUsuarioCons,
  UCadastroCons, UClasse_cl, UClasseCons, UProdutoFirebird_cl, UCadastroFirebird_cl,
  UCidade_cl, UContasReceberPostgre_cl, OraS, UContasPagarFirebird_cl,
  UContasReceberFirebird, UNotaSaidaFirebird_cl, UVendedorFirebird_cl, UPlanoContaFirebird_cl,
  UVeiculoFirebird_cl, UTabelaPreco_cl, DateUtils;

{$R *.DFM}

{ Função remove acentos da string passada como parametro}
function RemoveAcento(Texto:String):string;
var i : integer;
begin
  // Abaixo a relação de alguns caracteres não suportado por mainframes em especial(BB)
  for i := 1 to length( Texto ) do
  case Texto[i] of
  
      'ã' : Texto[i] := 'a';
      'á' : Texto[i] := 'a';
      'é' : Texto[i] := 'e';
      'í' : Texto[i] := 'i';
      'ó' : Texto[i] := 'o';
      'ú' : Texto[i] := 'u';
      'à' : Texto[i] := 'a';
      'è' : Texto[i] := 'e';
      'ì' : Texto[i] := 'i';
      'ò' : Texto[i] := 'o';
      'ù' : Texto[i] := 'u';
      'â' : Texto[i] := 'a';
      'ê' : Texto[i] := 'e';
      'î' : Texto[i] := 'i';
      'ô' : Texto[i] := 'o';
      'û' : Texto[i] := 'u';
      'ä' : Texto[i] := 'a';
      'ë' : Texto[i] := 'e';
      'ï' : Texto[i] := 'i';
      'ö' : Texto[i] := 'o';
      'ü' : Texto[i] := 'u';
      'õ' : Texto[i] := 'o';
      'ñ' : Texto[i] := 'n';
      'ç' : Texto[i] := 'c';
      'Á' : Texto[i] := 'A';
      'É' : Texto[i] := 'E';
      'Í' : Texto[i] := 'I';
      'Ó' : Texto[i] := 'O';
      'Ú' : Texto[i] := 'U';
      'À' : Texto[i] := 'A';
      'È' : Texto[i] := 'E';
      'Ì' : Texto[i] := 'I';
      'Ò' : Texto[i] := 'O';
      'Ù' : Texto[i] := 'U';
      'Â' : Texto[i] := 'A';
      'Ê' : Texto[i] := 'E';
      'Î' : Texto[i] := 'I';
      'Ô' : Texto[i] := 'O';
      'Û' : Texto[i] := 'U';
      'Ä' : Texto[i] := 'A';
      'Ë' : Texto[i] := 'E';
      'Ï' : Texto[i] := 'I';
      'Ö' : Texto[i] := 'O';
      'Ü' : Texto[i] := 'U';
      'Ã' : Texto[i] := 'A';
      'Õ' : Texto[i] := 'O';
      'Ñ' : Texto[i] := 'N';
      'Ç' : Texto[i] := 'C';
      '&' : Texto[i] := ' ';
      '*' : Texto[i] := ' ';
      '_' : Texto[i] := ' ';
      '-' : Texto[i] := ' ';
      '@' : Texto[i] := ' ';
      '#' : Texto[i] := ' ';
      '$' : Texto[i] := ' ';
      '|' : Texto[i] := ' ';
  end;

  Result := Texto;

end;

// -------------------------------------------------------\\
{ Função remove aspas da string passada como parametro}
function TFImportaDados.RemoveAspas(Texto:String):string;
var i : integer;
begin
  for i := 1 to length( Texto ) do
  case Texto[i] of
      CHR(39) : Texto[i] := ' ';
  end;

  Result := Texto;

end;

// -------------------------------------------------------\\
{ Função utilizada para separar o codigo ddd do numero de telefone}
function TFImportaDados.Telefone(wstrTel : String):String;
var
  wintCont : integer;
  wstrS, wstrDDD : String;
Begin
  for wintCont := 1 to length(wstrTel) do
    if wstrTel[wintCont] in ['0','1','2','3','4','5','6','7','8','9'] then
       wstrS := wstrS + wstrTel[wintCont];
  wstrDDD := Copy(wstrS, 1, 3);
  wstrS := wstrDDD + RMaskCGC_CPF( Copy(wstrS, 4, length(wstrS)),10);
  Result := wstrS;
End;


// -------------------------------------------------------\\
{Funcao para formatar cpf e cgc layout escrita fiscal}
function TFImportaDados.FormataCGC(wstrOpcao, wstrCGC : String):String;
var
  wstrS : String;
Begin
  If(wstrOpcao = 'J')Then
  Begin
    wstrS := RMaskCGC_CPF(wstrCGC,14);
    wstrS := Copy(wstrS,1,2) + '.' + Copy(wstrS,3,3) + '.' + Copy(wstrS,6,3) + '/' +
             Copy(wstrS,9,4) + '-' + Copy(wstrS,13,2);
  End
  Else //Formatar CPF
  Begin
    wstrS := RMaskCGC_CPF(wstrCGC,11);
    wstrS := Copy(wstrS,1,3) + '.' + Copy(wstrS,4,3) + '.' + Copy(wstrS,7,3) + '-' + Copy(wstrS,10,2);
  End;
  Result := wstrS;
End;

// -------------------------------------------------------\\
{Funcao para preencher campos numericos em geração de arquivos}
function TFImportaDados.RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];
  while Length(S) < Zeros do
      S := '0' + S;
  Result := S;
end;

// -------------------------------------------------------\\
{Funcao para preencher campos numéricos com um tamanho especificado e decimais}
function intdecimais (wValor :String; wTamanho, wDecimais:integer): String;
var
  C, Cont, Posicao :integer;
  Res, Aux :String;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  If wValor <> '' then
  Begin
    Str(StrToFloat(Trim(wValor)):wTamanho:wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    Begin
      Posicao:= Pos('.', Res);
      Delete(Res,Posicao,1);
    End;

  C := Length(Res);
  for Cont:= wTamanho downto 1 do
  Begin
    Aux[Cont] := Res[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;

  End;
  Res:= Aux;
  Result := Res;
End;

// -------------------------------------------------------\\
{Funcao para retornar a classificação Arquivo de Escrita Fiscal}
Function TFImportaDados.Classificacao( wintOperacao, wintSituacao, wintCondPgto : Integer ):String;
Begin
  If(wintSituacao = 3)Then
    Result := '99'
  Else
  Begin
    Case wintOperacao Of
      5101,6101,5102,6102,5109,6109,5501,6501:
          If (wintCondPgto=1) or (wintCondPgto=3) Then
            Result := '03'
          Else
            Result := '04';
      5124,6124:
          If (wintCondPgto=1) or (wintCondPgto=3) Then
            Result := '05'
          Else
            Result := '06';
      5201,6201: Result := '07';
      5202,6202: Result := '07';
      5901,5902,5925,6152,6902,5903,6903: Result := '30';
      5910,6910,5911,6911,5915,6915,5949,6949,7949: Result := '99';
      5551,6551: Result := '19';
      7101: Result := '21';
    Else
      Result := '10';
    End;
  End;
End;

// -------------------------------------------------------\\
{Funcao para formar os valores de icms para Arquivo de Escrita Fiscal}
Function TFImportaDados.ValoresIcms( wbooBrinde : Boolean; wintSituacao, wintCfop : Integer;
                                     wstrBase, wstrIcms, wstrAliquota, wstrVlrContabil : String ):String;
Var
  wstrAux: String;
Begin
  if(wintSituacao <> 3)Then
  Begin
    wstrAux := Bib.StrZero('0',112);
    Case wintCfop Of
      5109,6109,5501,6501,7101: //ISENTOS
      Begin
        wbooBase := false;
        wstrIcms := wstrAux + wstrVlrContabil {intdecimais(wstrVlrContabil,12,2)} + Bib.StrZero('0',12);
      End;
      5124,5901,6901,5902,6902,5903,6903,5910,6910,5911,6911,5915,6915,5949,6949,6124: //OUTROS
      Begin
        If(wbooBrinde)Then
        Begin
          wbooBase := false;
          wstrIcms := wstrAux + Bib.StrZero('0',12) + wstrVlrContabil;//intdecimais(wstrVlrContabil,12,2);
        End
        Else //DIFERENTES BASES BONIFICACAO
        Begin
          Inc(wintContBase);
          wbooBase := true;
          wstrIcms := intdecimais(wstrBase,12,2) + intDecimais(wstrAliquota,4,2) + intDecimais(wstrIcms,12,2);
        End;
      End;
      Else  //DIFERENTES BASES
      Begin
        Inc(wintContBase);
        wbooBase := true;
        wstrIcms := intdecimais(wstrBase,12,2) + intDecimais(wstrAliquota,4,2) + intDecimais(wstrIcms,12,2);
      End;
    End;
  End
  Else
    wstrIcms := '';
  Result := wstrIcms;
End;

// -------------------------------------------------------\\
{Funcao para formar os valores de icms para Arquivo de Escrita Fiscal}
Function TFImportaDados.ValoresIpi( wintCfop : Integer; wstrValIpi : String ):String;
Var
  wstrAux: String;
Begin
  wstrAux := Bib.StrZero('0',12);
  Case wintCfop Of
    5124,5901,6901,5902,6902,5903,6903,5910,6910,5911,6911,5915,6915,5949,6949: //OUTROS
      wstrValIpi := wstrAux + wstrAux + wstrAux + intDecimais(wstrValIpi,12,2);
    Else
      wstrValIpi := wstrAux + wstrAux + intDecimais(wstrValIpi,12,2) + wstrAux;
  End;
  Result := wstrValIpi;
End;

// -------------------------------------------------------\\
{Funcao para formar os valores das linhas de Base  das Notas Fiscais do Arquivo de Escrita Fiscal}
Function TFImportaDados.RetornaNotas( wstrNota : String ):String;
Begin

  if( Length(wstrNota) = 272 )Then
    Result := wstrNota
  else
    If(wbooBase)Then
      Result := wstrNota + RMaskCGC_CPF( '0',(248-Length(wstrNota)) ) + IntDecimais( FloatToStr(wfloVlrIsentas),12,2 ) + '000000000000'
    Else
      Result := wstrNota;
  wbooBase := False;
End;

{ Função para inserir 0 a esquerda de um numero inteiro }
function TFImportaDados.StrZero(Num,Digitos : Integer): string;
var V : String;
begin
  V:=IntToStr(num);//converte o numero par string
  Trim(V);
  {insere zero a esquerda}
  while Length(V) < Digitos do
  begin
    V := '0'+V;
  end;
  Result := V;
end;

procedure TFImportaDados.SBBaseClick(Sender: TObject);
begin
  With DMOracle do
  Try

    If SBBase.Down Then
    Begin
      SBBase.Caption := 'Produção';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORA';
      DBCemapa.Connected := True;
    End
    Else
    Begin
      SBBase.Caption := 'Teste';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORCL';
      DBCemapa.Connected := True;
    End;
   // SetaUsuario;
  Except
    MessageDlg('Não foi possível conectar com esta base de dados!'
               +#13+'Certifique-se que esta base existe em seu servidor',mtWarning,[mbOk],0);
  End;
end;

procedure TFImportaDados.BtImportaProdutoClick(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse: string;
exec: TExecutador;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    with DMProdutoFirebird do
    begin
      QProduto.Open;
      ZQProduto.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProduto.First;

      wCont := 0;
      While not ZQProduto.Eof do
      Begin
        Try
          QProduto.Insert;
          //QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');
          QProdutoCOD_PRODUTO.Value :=  ZQProdutoCOD_PRODUTO.Value;
          //QProdutoNUM_FABRICANTE.Value :=  ZQProdutoCOD_PRODUTO.Value;

          QClasseCons.Close;
          QClasseCons.SetVariable('NUM_CLASSE', 1);
          QClasseCons.SetVariable('NUM_SUBCLASSE', ZQProdutoNUM_SUBGRUPO.Value);
          QClasseCons.Open;

         // wClasse :=  DMOracle.BuscaNome('SELECT NVL(COD_CLASSE,6)' + comentado marcos
          //  ' FROM TB_CLASSE','DESC_CLASSE LIKE ' + QuotedStr(ZQProdutoDESC_CLASSE.Text));
          QProdutoCOD_CLASSE.Text := QClasseConsCOD_CLASSE.Text;
          QProdutoCOD_TRIBUTACAO.Value := 1;
          QProdutoDESC_PRODUTO.Value := UpperCase(ZQProdutodesc_produto.Value);
          QProdutoDESC_UNIDADE.Value := copy(UpperCase(ZQProdutodesc_unidade.Value),1,3);
          QProdutoNUM_GENERO_NCM.Value := ZQProdutoNUM_GENERO_NCM.Value;
          QProdutoNUM_EMBALAGEM.Value := 1;
          QProdutoNUM_PESO_BRUTO.Value := ZQProdutoNUM_PESO_BRUTO.value;
          QProdutoNUM_PESO_LIQUIDO.Value := ZQProdutoNUM_PESO_BRUTO.value;
          QprodutoDESC_COD_BARRA.Value := copy(ZQProdutoDESC_COD_BARRA.Value,1,20);

          QProdutoVAL_VAREJO.Value := ZQProdutoVAL_VAREJO.Value;
          QProdutoVAL_ATACADO.Value := ZQProdutoVAL_VAREJO.Value;
          QProdutoPERC_MARGEM_VAREJO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
          QProdutoPERC_MARGEM_ATACADO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
          //QProdutoPERC_IPI.Value := ZQProdutoPERC_IPI.Value;

          QProdutoNUM_VOLUMES.Value := 1;
          QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
          QProdutoPERC_INSS.Value := 0;
          QProdutoPERC_ISS.Value := 0;
          If ZQProdutoind_situacao.Value = 'S' Then
            QProdutoIND_SITUACAO.Value := 'ATIVO'
          else
            QProdutoIND_SITUACAO.Value := 'DESATIVADO';
          QProduto.Post;
        Except
          Inc(wRegNaoImp);
          If QProduto.State = dsInsert Then
            QProduto.Cancel;
        End;
        ZQProduto.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;

        //Insere imagem dos produtos
       { ZQProduto.First;
        while not ZQProduto.Eof do
        begin
          {if Trim(ZQProdutoIMG_FOTO.Value) <> '' then  comentado marcos
          begin
            exec := TExecutador.Create;
            exec.Adiciona('INSERT INTO TB_IMAGEM_PRODUTO '+
              'VALUES(SQIMAGEM_PRODUTO.NEXTVAL, ' +
              copy(ZQProdutoCOD_PRODUTO.Text,1,6) + ', '+
              quotedStr(ZQProdutoIMG_FOTO.Value) + ')');
            exec.Executar(false,true);
            exec.Fecha;exec.Free;
          end;
          ZQProduto.Next;
        end;  }
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BtImportaCadastroClick(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp, wCxPostal : Integer;
    wFone : String;
    wIsNumber: boolean;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    with DMCadastroFirebird, DMOracle do
    begin
      //TCadastro.Open;
      ZQfornecedor.Open;
      ZQCliente.Open;
      QCadastro.Open;
      ZQFornecedor.First;
      ZQCliente.First;
      //ZQCidadeCons.Open;
      //DMCidade.QCidade.Open;
      {while not ZQCidadeCons.Eof do
      begin
        with DMCidade do
        begin
          try
            QCidade.Insert;
            QCidadeCOD_CIDADE.Value := ZQCidadeConsCOD_CIDADE.Value;
            if ZQCidadeConsDESC_CIDADE.Value <> '' then
              QCidadeDESC_CIDADE.Value := ZQCidadeConsDESC_CIDADE.Value
            else
              QCidadeDESC_CIDADE.Value := 'MEDIANEIRA';
            if ZQCidadeConsCOD_ESTADO.Text <> '' then
              QCidadeCOD_ESTADO.Value := ZQCidadeConsCOD_ESTADO.Value
            else
              QCidadeCOD_ESTADO.Value := 'PR';
            QCidadeCOD_CIDADE_IBGE.Value := ZQCidadeConsCOD_CIDADE_IBGE.Value;
            QCidade.Post;
          Except
            ShowMessage('Código da cidade: ' + ZQCidadeConsCOD_CIDADE.Text);
            DMOracle.DBCemapa.Rollback;
          end;
        end;
        ZQCidadeCons.Next;
      end;}
      wCont := 0;
      wRegNaoImp := 0;
      DMOracle.DBCEmapa.StartTransaction;
      While not ZQFornecedor.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := strtoint(copy(ZQFornecedorCOD_CADASTRO.text,1,6));
          //QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
          if ZQFornecedorDESC_CADASTRO.Text <> '' then
            QCadastroNOME.Value := UpperCase(copy(ZQFornecedorDESC_CADASTRO.Value,1,60))
          else
            QCadastroNOME.Value := 'CADASTRO SEM NOME';
          QCadastroDESC_ENDERECO.Value :=  UpperCase(copy(ZQFornecedorDESC_ENDERECO.Value,1,60));
          if ZQFornecedorDESC_CIDADE.Value <> '' then
          begin
            QCadastroDESC_CIDADE.Value := UpperCase(copy(ZQFornecedorDESC_CIDADE.Value,1,30));
            QBuscaCodCidade.Close;
            QBuscaCodCidade.SetVariable('CIDADE', UpperCase(copy(ZQFornecedorDESC_CIDADE.Value,1,30)));
            QBuscaCodCidade.Open;
            if QBuscaCodCidade.RecordCount > 0 then
              QCadastroCOD_CIDADE.value := QBuscaCodCidadeCOD_CIDADE.Value;
          end
          else
            QCadastroDESC_CIDADE.Value := 'CADASTRO SEM CIDADE';
          If ZQFornecedorCOD_ESTADO.Value <> '' Then
             QCadastroCOD_ESTADO.Value :=  UpperCase(copy(ZQFornecedorCOD_Estado.Value,1,2))
          Else
             QCadastroCOD_ESTADO.Value := 'PR';

          QCadastroDESC_CEP.Value :=  copy(ZQFornecedorDESC_CEP.Value,1,9);
          QCadastroNUM_INSCRICAO.Value := ZQFornecedorNUM_INSCRICAO.Value;
          wind := 1;
          wFone := '';
          While wInd <= Length(ZQFornecedorDESC_FONE.Value) do
           Begin
             If (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '0') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '1') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '2') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '3') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '4') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '5') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '6') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '7') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '8') Or
                (Copy(ZQFornecedorDESC_fone.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQFornecedorDESC_fone.Value,wInd,1);
             Inc(wInd);
           End;
          QCadastroDESC_TELEFONE.Value := copy(wFone,1,13);
          QCadastroNUM_CGC_CPF.Value :=  copy(ZQFornecedorNUM_CGC_CPF.value,1,18);
          QCadastroDESC_BAIRRO.Value :=  UpperCase(copy(ZQFornecedorDESC_bairro.Value,1,20));
          //QCadastroDT_NASCIMENTO.Text :=  ZQFornecedorDT_NASCIMENTO.Text;
          If ZQFornecedordt_cadastro.Text <> ''  Then
             QCadastroDT_CADASTRO.value :=  StrToDate(ZQFornecedorDT_CADASTRO.Text)
          Else
             QCadastroDT_CADASTRO.Value :=  Date;
          QCadastroCOD_PAIS.Value :=  278;  // TCadastroIDNACAO.Value;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroDESC_FAX.Value :=  copy(ZQFornecedorDESC_FAX.Value,1,13);
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroIND_SEXO_CATEGORIA.Value := 'J';
          {if (ZQCadastrocxpostal.Value <> '') and (Length(ZQCadastrocxpostal.text) <= 6) then
          begin
            wIsNumber := TryStrToInt(ZQCadastrocxpostal.Value, wCxPostal);
            if wIsNumber then
              QCadastroNUM_CAIXA_POSTAL.Value :=  wCxPostal;
          end;}
          //QCadastroDESC_FANTASIA.Value :=  UpperCase(copy(ZQCadastrofantasia.Value,1,30));
          QCadastroCOD_RAMO.Value := 1;
          QCadastroCOD_VENDEDOR.Value := 1;
          //QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));

          //QCadastroCOD_CIDADE.Value := ZQCadastrocod_cidade.Value;
          //QCadastroDESC_CIDADE_COBRANCA.Value :=  UpperCase(copy(ZQCadastrocidadecobranca.Value,1,30));

          //QCadastroDESC_ENDERECO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroENDERECOCOBRANCA.Value,1,40));
          //QCadastroDESC_CEP_COBRANCA.Value :=  copy(ZQCadastroCEPCOBRANCA.Value,1,9);
          //QCadastroDESC_FAX_COBRANCA.Value := ZQCadastrodesc_fax_cobranca.Value;
          //QCadastroDESC_BAIRRO_COBRANCA.Value := ZQCadastrodesc_bairro_cobranca.Value;
          //QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));
          if Length(ZQFornecedorNUM_CGC_CPF.Value) > 11 then
            QCadastroCOD_TIPO_CADASTRO.Value := 2
          else
            QCadastroCOD_TIPO_CADASTRO.Value := 1;
          QCadastroDESC_CELULAR.Value := copy(ZQFornecedordesc_celular.Value,1,12);
          QCadastroNOME_CONTATO.Value := ZQFornecedordesc_contato.Value;
          QCadastroIND_SEPROC_SIMNAO.Value := 'N';
          if Length(ZQFornecedorNUM_CGC_CPF.Value) > 11 then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := copy(ZQFornecedordesc_EMAIL.value,1,70);
          //QCadastroDESC_E_MAIL1.Value := ZQCadastroDESC_EMAIL1.value;
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQFornecedorCOD_CADASTRO.Text + ZQFornecedorDESC_CADASTRO.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQFornecedor.Next;
      End;
      //aqui começa importar clientes
      While not ZQCliente.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := StrToInt(DMOracle.BuscaNome('SELECT SQcadastro.NEXTVAL FROM DUAL', '1=1'));;
          //QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
          if ZQClienteDESC_CADASTRO.Text <> '' then
            QCadastroNOME.Value := UpperCase(copy(ZQClienteDESC_CADASTRO.Value,1,60))
          else
            QCadastroNOME.Value := 'CADASTRO SEM NOME';
          QCadastroDESC_ENDERECO.Value :=  UpperCase(copy(ZQClienteDESC_ENDERECO.Value,1,60));
          if ZQFornecedorDESC_CIDADE.Value <> '' then
          begin
            QCadastroDESC_CIDADE.Value := UpperCase(copy(ZQClienteDESC_CIDADE.Value,1,30));
            QBuscaCodCidade.Close;
            QBuscaCodCidade.SetVariable('CIDADE', UpperCase(copy(ZQClienteDESC_CIDADE.Value,1,30)));
            QBuscaCodCidade.Open;
            if QBuscaCodCidade.RecordCount > 0 then
              QCadastroCOD_CIDADE.value := QBuscaCodCidadeCOD_CIDADE.Value;
          end
          else
            QCadastroDESC_CIDADE.Value := 'CADASTRO SEM CIDADE';
          If ZQClienteCOD_ESTADO.Value <> '' Then
             QCadastroCOD_ESTADO.Value :=  UpperCase(copy(ZQClienteCOD_Estado.Value,1,2))
          Else
             QCadastroCOD_ESTADO.Value := 'PR';

          QCadastroDESC_CEP.Value :=  copy(ZQClienteDESC_CEP.Value,1,9);
          //QCadastroNUM_INSCRICAO.Value := ZQClienteDESC_INSCRICAO_ESTADUAL.Value;
          wind := 1;
          wFone := '';
          While wInd <= Length(ZQClienteDESC_FONE.Value) do
           Begin
             If (Copy(ZQClienteDESC_fone.Value,wInd,1) = '0') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '1') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '2') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '3') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '4') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '5') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '6') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '7') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '8') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQClienteDESC_fone.Value,wInd,1);
             Inc(wInd);
           End;
          QCadastroDESC_TELEFONE.Value := copy(wFone,1,13);
          QCadastroNUM_CGC_CPF.Value :=  copy(ZQClienteNUM_CGC_CPF.value,1,18);
          QCadastroDESC_BAIRRO.Value :=  UpperCase(copy(ZQClienteDESC_bairro.Value,1,20));
          //QCadastroDT_NASCIMENTO.Text :=  ZQClienteDT_NASCIMENTO.Text;
          If ZQClientedt_cadastro.Text <> ''  Then
             QCadastroDT_CADASTRO.value :=  StrToDate(ZQClienteDT_CADASTRO.Text)
          Else
             QCadastroDT_CADASTRO.Value :=  Date;
          QCadastroCOD_PAIS.Value :=  278;  // TCadastroIDNACAO.Value;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroDESC_FAX.Value :=  copy(ZQClienteDESC_FAX.Value,1,13);
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroIND_SEXO_CATEGORIA.Value := 'J';
          {if (ZQCadastrocxpostal.Value <> '') and (Length(ZQCadastrocxpostal.text) <= 6) then
          begin
            wIsNumber := TryStrToInt(ZQCadastrocxpostal.Value, wCxPostal);
            if wIsNumber then
              QCadastroNUM_CAIXA_POSTAL.Value :=  wCxPostal;
          end;}
          //QCadastroDESC_FANTASIA.Value :=  UpperCase(copy(ZQCadastrofantasia.Value,1,30));
          QCadastroCOD_RAMO.Value := 1;
          QCadastroCOD_VENDEDOR.Value := 1;
          //QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));

          //QCadastroCOD_CIDADE.Value := ZQCadastrocod_cidade.Value;
          //QCadastroDESC_CIDADE_COBRANCA.Value :=  UpperCase(copy(ZQCadastrocidadecobranca.Value,1,30));

          //QCadastroDESC_ENDERECO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroENDERECOCOBRANCA.Value,1,40));
          //QCadastroDESC_CEP_COBRANCA.Value :=  copy(ZQCadastroCEPCOBRANCA.Value,1,9);
          //QCadastroDESC_FAX_COBRANCA.Value := ZQCadastrodesc_fax_cobranca.Value;
          //QCadastroDESC_BAIRRO_COBRANCA.Value := ZQCadastrodesc_bairro_cobranca.Value;
          //QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));
          if Length(ZQClienteNUM_CGC_CPF.Value) > 11 then
            QCadastroCOD_TIPO_CADASTRO.Value := 2
          else
            QCadastroCOD_TIPO_CADASTRO.Value := 1;
          QCadastroDESC_CELULAR.Value := copy(ZQClientedesc_celular.Value,1,12);
          //QCadastroNOME_CONTATO.Value := ZQClientedesc_contato.Value;
          QCadastroIND_SEPROC_SIMNAO.Value := 'N';
          if Length(ZQClienteNUM_CGC_CPF.Value) > 11 then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := copy(ZQClientedesc_EMAIL.value,1,70);
          //QCadastroDESC_E_MAIL1.Value := ZQCadastroDESC_EMAIL1.value;
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQClienteCOD_CADASTRO.Text + ZQClienteDESC_CADASTRO.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQCliente.Next;
      End;
    end;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
  MessageDlg(memo1.Text, mtInformation, [mbOK], 0);
end;  

procedure TFImportaDados.BtImportaHistoricoClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    THistorico.Open;
    QHistorico.Open;
    THistorico.First;
    PB.Max := THistorico.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not THistorico.Eof do
    Begin
      Try
        QHistorico.Insert;
        QHistoricoCOD_HISTORICO.Value :=  THistoricoIDTIPO.Value;
        QHistoricoDESC_HISTORICO.Value :=  THistoricoNODESCRI.Value;
        If THistoricoIDTIPO.Value > 500 Then
          QHistoricoIND_OPERACAO.Value := '-'
        Else
          QHistoricoIND_OPERACAO.Value := '+';

        //QHistoricoIND_EMITE_CHEQUE.Value :=
        //QHistoricoIND_CONCILIA.Value :=
        //QHistoricoCOD_HISTORICO_CONTABIL.Value :=
        //QHistoricoCOD_CONTABIL_CRED.Value :=
        //QHistoricoCOD_CONTABIL_DEB.Value :=

 //THistoricoCDCONTAD.Value;
 //THistoricoCDLOCALDB.Value;
 //THistoricoCDCONTAC.Value;
 //THistoricoCDLOCALCR.Value;
 //THistoricoHISTORICO.Value;


        QHistorico.Post;
      Except
        If QHistorico.State = dsInsert Then
          QHistorico.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      THistorico.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;


procedure TFImportaDados.BitBtn3Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    //TCP_Mov.Open;
    QCP_Cemapa.Open;
    QCPMov_Importa.Open;
    QCP_Cemapa.First;
    PB.Max := QCP_Cemapa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCP_Cemapa.Eof do
    Begin
      If QCP_CemapaCOD_CADASTRO.Value = 0 Then
       Begin
         QCP_Cemapa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCP_CemapaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCP_CemapaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCP_CemapaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCP_CemapaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCPMov_Importa.Insert;
          QCPMov_ImportaCOD_CONTA_PAGAR_MOV.Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
          QCPMov_ImportaCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCab);
          QCPMov_ImportaDT_MOVIMENTO.Text := QCP_CemapaDT_MOVIMENTO.Text;
          QCPMov_ImportaVAL_MOVIMENTO.Value := QCP_CemapaVAL_ORIGINAL.Value;
          QCPMov_ImportaIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
          QCPMov_ImportaDESC_OBSERVACAO.Value := QCP_CemapaDESC_OBSERVACAO.Value;
          QCPMov_ImportaDT_USUARIO.Value := date;
           QCPMov_ImportaCOD_USUARIO.Value := 1;

         QCPMov_Importa.Post;
        End;
      Except
        If QCPMov_Importa.State = dsInsert Then
          QCPMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCP_Cemapa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;


procedure TFImportaDados.BitBtn4Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCod_Produto : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    QEstoque.Open;
    with DMProdutoFirebird do
    begin
      ZQEstoque.Close;
      ZQEstoque.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQEstoque.First;
      PB.Max := ZQEstoque.RecordCount;
      wCont := 0;
      While not ZQEstoque.Eof do
      Begin
        Try
          QEstoque.Insert;

          QEstoqueCOD_LOTE_TIPO.Value := 1;
          QEstoqueCOD_FILIAL.Value := 1;
//          wCod_Produto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39) + TProdutoCDMERCAD.Text+Chr(39));
//          QEstoqueCOD_PRODUTO.Value := StrToInt(wCod_Produto);
          QEstoqueCOD_PRODUTO.Value := ZQEstoqueCOD_PRODUTO.Value;
          QEstoqueVL_CUSTO_MEDIO.Value := ZQEstoqueVAL_CUSTO.Value;
          QEstoqueQT_QUANTIDADE.Value := ZQEstoqueQT_ESTOQUE.Value;
          QEstoqueQT_MINIMO.Value := ZQEstoqueQT_MINIMO.value;
          //QEstoqueQT_MAXIMO.Value := ZQQt_EstoqueQT_MAXIMO.value;
          QEstoqueQT_INVENTARIO.Value := 0;

          QEstoque.Post;
        Except
          If QEstoque.State = dsInsert Then
            QEstoque.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQEstoque.Next;
      End;
      If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
        DMOracle.DBCEmapa.Commit
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    End;
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn7Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCodigo,wConta : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TLanctoContabil.Open;
    QLanctoContabil.Open;
    TLanctoContabil.First;
    PB.Max := TLanctoContabil.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TLanctoContabil.Eof do
    Begin
      Try
        wConta := Copy(TLanctoContabilCDCONTA.Value,1,9) + '0' + Copy(TLanctoContabilCDCONTA.Value,10,5);
        wCodigo := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+CHR(39)+wConta + CHR(39));
        If wCodigo <> '' Then
        Begin
          QLanctoContabil.Insert;
          QLanctoContabilCOD_LANCTO_CONTABIL.Value:= DMOracle.Sequencia('LANCTO_CONTABIL');
          QLanctoContabilCOD_FILIAL.Value := TLanctoContabilCDEMPRESA.Value;
          QLanctoContabilCOD_PLANILHA.Value := TLanctoContabilNRLOTE.Value;
          QLanctoContabilDT_LANCAMENTO.Value := StrToDate(COPY(DateToStr(TLanctoContabilDTLANCTO.Value),1,6) + '2005');
          QLanctoContabilCOD_PLANO_CONTA.Value := StrToInt(wCodigo);
          QLanctoContabilNUM_LANCAMENTO.Value := Trunc(TLanctoContabilNRLANCTO.Value);
          QLanctoContabilCOD_HISTORICO_CONTABIL.Value := TLanctoContabilCDCODHIS.Value;
          QLanctoContabilDESC_COMPLEMENTO.Value := Trim(TLanctoContabilNOCOMPL1.Text) + ' Nr. Doc.:' + TLanctoContabilNRDOCUMEN.Text;
          If TLanctoContabilCDOPERC.Value = 2 Then
           Begin
            QLanctoContabilVAL_LANCAMENTO.Value := TLanctoContabilVLLANCTO.Value * (-1);
            QLanctoContabilIND_OPERACAO.Text := 'C';
           End
          Else
           Begin
            QLanctoContabilVAL_LANCAMENTO.Value := TLanctoContabilVLLANCTO.Value;
            QLanctoContabilIND_OPERACAO.Text := 'D';
           End;
          QLanctoContabilNUM_CONTRAPARTIDA.Value := Copy(TLanctoContabilCONTRA.Value,1,9) + '0' + Copy(TLanctoContabilCONTRA.Value,10,5);
          QLanctoContabilIND_ATUALIZA_SALDo.Value := 'NAO';
          QLanctoContabil.Post;
        End;
      Except
        If QLanctoContabil.State = dsInsert Then
          QLanctoContabil.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TLanctoContabil.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BtnExportaLctoContabilClick(Sender: TObject);
var S: String;
    F: TextFile;
    mContador: integer;
begin
 // Grava dados Query dentro do arquivo DBF

 mContador:=0; // Inicializa valor da variavel.

 if (Trim(MEDtLancamentoI.Text) = '') or
    (Trim(MEDtLancamentoF.Text) = '') then
    raise exception.Create('Deve ser informado periodo de lançamento!');

 with DMImportaDados do
 begin
   QLctoContabilExporta.Close;
   if Trim(EdFilial.Text) = '' then
      QLctoContabilExporta.SetVariable('COD_FILIAL',Null)
   else
      QLctoContabilExporta.SetVariable('COD_FILIAL',EdFilial.Text);

   QLctoContabilExporta.SetVariable('DT_LANCAMENTO_I',MEDtLancamentoI.Text);
   QLctoContabilExporta.SetVariable('DT_LANCAMENTO_F',MEDtLancamentoF.Text);

   QLctoContabilExporta.open;
   Edit2.Clear;
   Edit2.Text := IntToStr(QLctoContabilExporta.RecordCount)+' registro(s) para exportar!';
   Edit2.Refresh;
   QLctoContabilExporta.First;
   BtnExportar.Enabled:= False;

   S:= '';  // Inicializa valor da variavel.
   while not QLctoContabilExporta.Eof do
   begin
     S:=S+Bib.FormataTexto(QLctoContabilExportaCOD_FILIAL.Text,6)              +
          Bib.FormataTexto(QLctoContabilExportaCOD_HISTORICO_CONTABIL.Text,6)  +
          Bib.FormataTexto(QLctoContabilExportaCOD_PLANO_CONTA.Text,6)         +
          QLctoContabilExportaDT_LANCAMENTO.Text                               +
          Bib.FormataTexto(QLctoContabilExportaNUM_LANCAMENTO.Text,6)          +
          Bib.FormataTexto(QLctoContabilExportaDESC_COMPLEMENTO.Text,40)       +
          Bib.FormataTexto(QLctoContabilExportaVAL_LANCAMENTO.Text,11)         +
          Bib.FormataTexto(QLctoContabilExportaIND_OPERACAO.Text,1)            +
          Bib.FormataTexto(QLctoContabilExportaNUM_CONTRAPARTIDA.Text,15)      +
          Bib.FormataTexto(QLctoContabilExportaIND_ATUALIZA_SALDO.Text,3)      +
          Bib.FormataTexto(QLctoContabilExportaCOD_FILIAL_CONTRAPARTIDA.Text,6);
          if Trim(QLctoContabilExportaCOD_PLANILHA.Text) = '' then
             S:=S+Bib.FormataTexto(QLctoContabilExportaCOD_GENERICO.Text,6)
          else
             S:=S+Bib.FormataTexto(QLctoContabilExportaCOD_PLANILHA.Text,6);

          if Trim(QLctoContabilExportaCOD_GENERICO.Text) = '' then
             S:=S+Bib.FormataTexto(QLctoContabilExportaCOD_PLANILHA.Text,6)
          else
             S:=S+Bib.FormataTexto(QLctoContabilExportaCOD_GENERICO.Text,6);

          S:=S+Chr(13)+Chr(10);
     mContador:=mContador+1;
     MEImp.Text :=  IntToStr(mContador);
     MEImp.Refresh;

     QLctoContabilExporta.Next;

   end;

   if FImportaDados.SaveDialog.Execute then
   begin
     AssignFile( F, FImportaDados.SaveDialog.FileName );
     Rewrite(F);
     Writeln(F, S);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
   else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
 end;

end;

procedure TFImportaDados.BtnImportarLctoContabilClick(Sender: TObject);
var mDuplicidade, S: String;
    F: TextFile;
    mContador: integer;
begin
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QLctoContabilImporta.Close;
      QLctoContabilImporta.Open;
      BtnImportarLctoContabil.Enabled:= False;
      mContador:=0;
      while Trim(S) <> '' do
      begin
{        mDuplicidade:= DMOracle.BuscaNome('SELECT COD_LANCTO_CONTABIL FROM TB_LANCTO_CONTABIL',
                                ' COD_FILIAL = '+Trim(Copy(S, 01,06))+
                                ' AND COD_HISTORICO_CONTABIL = '+Trim(Copy(S, 07,06))+
                                ' AND COD_PLANO_CONTA = '+Trim(Copy(S, 13,06))+
                                ' AND DT_LANCAMENTO = '+CHR(39)+Copy(S, 19,10)+CHR(39));
        if Trim(mDuplicidade) <> '' then
           if MessageDlg('Duplicidade de registro! Incluir registro? - FILIAL: '+Trim(Copy(S, 01,06))+#13+
                         ' HISTÓRICO CONTABIL: '+Trim(Copy(S, 07,06))+#13+
                         ' PLANO DE CONTAS: '+Trim(Copy(S, 13,06))+
                         ' DT. LANÇAMENTO: '+Copy(S, 19,10),mtWarning,[mbYes,mbNo],0) = mrNo then
            begin
              Readln(F,S);                           {Le a linha do arquivo texto}
 //             mDuplicidade := 'Não vai incluir este registro';
 //           end;
        if Trim(mDuplicidade) = '' then
        begin
          QLctoContabilImporta.Insert;
          if Trim(Copy(S, 01,06)) <> '' then
             QLctoContabilImportaCOD_FILIAL.Value:= StrToInt(Trim(Copy(S, 01,06)));
          if Trim(Copy(S, 07,06)) <> '' then
             QLctoContabilImportaCOD_HISTORICO_CONTABIL.Value:= StrToInt(Trim(Copy(S, 07,06)));
          if Trim(Copy(S, 13,06)) <> '' then
             QLctoContabilImportaCOD_PLANO_CONTA.Value:= StrToInt(Trim(Copy(S, 13,06)));
          QLctoContabilImportaDT_LANCAMENTO.Value:= StrToDate(Copy(S, 19,10));
          if Trim(Copy(S, 29,06)) <> '' then
             QLctoContabilImportaNUM_LANCAMENTO.Value:= StrToInt(Trim(Copy(S, 29,06)));
          if Trim(Copy(S, 35,40)) <> '' then
             QLctoContabilImportaDESC_COMPLEMENTO.Value:= Trim(Copy(S, 35,40));
          if Trim(Copy(S, 75,11)) <> '' then
             QLctoContabilImportaVAL_LANCAMENTO.Value:= StrToFloat(Trim(Copy(S, 75,11)));
          if Trim(Copy(S, 86,01)) <> '' then
             QLctoContabilImportaIND_OPERACAO.Value:= Trim(Copy(S, 86,01));
          if Trim(Copy(S, 87,15)) <> '' then
             QLctoContabilImportaNUM_CONTRAPARTIDA.Value:= Trim(Copy(S, 87,15));
          if Trim(Copy(S,102,03)) <> '' then
             QLctoContabilImportaIND_ATUALIZA_SALDO.Value:= Trim(Copy(S,102,03));
          if Trim(Copy(S,105,06)) <> '' then
             QLctoContabilImportaCOD_FILIAL_CONTRAPARTIDA.Value:= StrToInt(Trim(Copy(S,105,06)));
          if Trim(Copy(S,111,06)) <> '' then
             QLctoContabilImportaCOD_PLANILHA.Value:= StrToInt(Trim(Copy(S,111,06)));
          if Trim(Copy(S,117,06)) <> '' then
             QLctoContabilImportaCOD_GENERICO.Value:= StrToInt(Trim(Copy(S,117,06)));
          QLctoContabilImporta.Post;
          mContador:=mContador+1;
          MEImp.Text :=  IntToStr(mContador);
          MEImp.Refresh;
          Readln(F,S);                           {Le a linha do arquivo texto}
        end;
      end;  // fim do while
      BtnImportarLctoContabil.Enabled:= True;
    end;
  end;
end;

procedure TFImportaDados.BitBtn12Click(Sender: TObject);
var S: String;
    F: TextFile;
    mContador: integer;
begin
   // Grava dados Query dentro do arquivo

 mContador:=0; // Inicializa valor da variavel de contagem.

 if (Trim(MEDT_Recebimento_I.Text) = '') or
    (Trim(MEDT_Recebimento_F.Text) = '') then
    raise exception.Create('Deve ser informado periodo de lançamento!');

 with DMImportaDados do
 begin
   QNotaExporta.Close;
   if Trim(EdFilial.Text) = '' then
      QNotaExporta.SetVariable('COD_FILIAL',Null)
   else
      QNotaExporta.SetVariable('COD_FILIAL',EdFilial.Text);

   QNotaExporta.SetVariable('DT_RECEBIMENTO_I',MEDT_RECEBIMENTO_I.Text);
   QNotaExporta.SetVariable('DT_RECEBIMENTO_F',MEDT_RECEBIMENTO_F.Text);

   case RGCondicaoPag.ItemIndex of
     1: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO',1);
     2: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO',2);
     3: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO',3);
     4: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO',4);
   else
     QNotaExporta.SetVariable('IND_CONDICAO_PAGTO',NULL);
   end;
   QNotaExporta.open;
   Edit1.Clear;
   Edit1.Text := IntToStr(QNotaExporta.RecordCount)+' registro(s) para exportar!';
   Edit1.Refresh;
   QNotaExporta.First;
   BtnExportar.Enabled:= False;

   S:= '';  // Inicializa valor da variavel.
   while not QNotaExporta.Eof do
   begin
     S:=S+Bib.FormataTexto(QNotaExportaCOD_NOTA_CAB.Text,6)           +
          Bib.FormataTexto(QNotaExportaCOD_USUARIO.Text,6)            +
          Bib.FormataTexto(QNotaExportaCOD_FILIAL.Text,6)             +
          Bib.FormataTexto(QNotaExportaCOD_MENSAGEM.Text,6)           +
          Bib.FormataTexto(QNotaExportaCOD_TRANSPORTE.Text,6)         +
          Bib.FormataTexto(QNotaExportaCOD_OPERACAO.Text,6)           +
          Bib.FormataTexto(QNotaExportaCOD_ESTADO.Text,6)             +
          Bib.FormataTexto(QNotaExportaCOD_VENDEDOR.Text,6)           +
          Bib.FormataTexto(QNotaExportaCOD_CADASTRO.Text,6)           +
          Bib.FormataTexto(QNotaExportaNUM_NOTA.Text,6)               +
          Bib.FormataTexto(QNotaExportaCOD_SERIE.Text,3)              +
          Bib.FormataTexto(QNotaExportaIND_SITUACAO.Text,3)           +
          Bib.FormataTexto(QNotaExportaIND_CONDICAO_PAGTO.Text,1)     +
          Bib.FormataTexto(copy(QNotaExportaDT_EMISSAO.Text,1,10),10)     +
          Bib.FormataTexto(copy(QNotaExportaDT_MOVIMENTO.Text,1,10),10)   +
          '         '                                                     +
          Bib.FormataTexto(copy(QNotaExportaDT_RECEBIMENTO.Text,1,10),10) +
          Bib.FormataTexto(QNotaExportaCOD_MOTIVO_CANC.Text,6)        +
          Bib.FormataTexto(QNotaExportaVAL_DESPESAS.Text,11)          +
          Bib.FormataTexto(QNotaExportaIND_ENTRADA_SAIDA.Text,3)      +
          Bib.FormataTexto(QNotaExportaVAL_FRETE.Text,11)             +
          Bib.FormataTexto(QNotaExportaVAL_DESCONTO.Text,11)          +
          Bib.FormataTexto(QNotaExportaCOD_TRANSPORTADOR.Text,6)      +
          Bib.FormataTexto(QNotaExportaNUM_CONHECIMENTO_FRETE.Text,6) +
          Bib.FormataTexto(QNotaExportaVAL_AVISTA.Text,11)            +
          Bib.FormataTexto(QNotaExportaIND_TIPO_FRETE.Text,3)         +
          Bib.FormataTexto(QNotaExportaNUM_VOLUMES.Text,6)            +
          Bib.FormataTexto(QNotaExportaOBS.Text,60)                   +
          Bib.FormataTexto(QNotaExportaOBS_COMPLEMENTO.Text,60)       +
          Bib.FormataTexto(copy(QNotaExportaDT_USUARIO.Text,1,10),10) +
          '         '                                                 +
          Bib.FormataTexto(QNotaExportaCOD_TRIBUTACAO_FRETE.Text,6)   +
          Bib.FormataTexto(QNotaExportaVAL_TOTAL_IPI.Text,11)         +
          Bib.FormataTexto(QNotaExportaVAL_ICM_FRETE.Text,11)         +
          Bib.FormataTexto(QNotaExportaVAL_ICM_BASE_FRETE.Text,11)    +
          Bib.FormataTexto(QNotaExportaVAL_FUNRURAL.Text,11)          +
          Bib.FormataTexto(QNotaExportaDESC_PLACA.Text,8)             +
          Bib.FormataTexto(QNotaExportaDESC_TRANSPORTADORA.Text,50)   +
          Bib.FormataTexto(QNotaExportaCOD_NOTA_CONTA_CORRENTE.Text,6)+
          Bib.FormataTexto(copy(QNotaExportaDT_EMISSAO_CF.Text,1,10),10)+
          '         '                                                   +
          Bib.FormataTexto(QNotaExportaCOD_OPERACAO_CF.Text,6)        +
          Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE.Text,3)         +
          Bib.FormataTexto(QNotaExportaCOD_CONTRATO_MOV.Text,6)       +
          Bib.FormataTexto(QNotaExportaCOD_CONTRATO_GP_MOV.Text,6)    +
          Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE1.Text,3)        +
          Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE2.Text,3)        +
          Bib.FormataTexto(QNotaExportaIND_NOTA_SEGURO.Text,3)        +
          Bib.FormataTexto(QNotaExportaCOD_CONTRATO_VEND.Text,6)      +
          Bib.FormataTexto(QNotaExportaNR_ROTA.Text,6)                +
          Bib.FormataTexto(QNotaExportaPERC_COMISSAO.Text,6)          +
          Bib.FormataTexto(QNotaExportaIND_MILHAGEM.Text,3)           +
          Bib.FormataTexto(QNotaExportaNUM_OS.Text,6)                 +
          Bib.FormataTexto(QNotaExportaCOD_DEPARTAMENTO.Text,6)       +
          Bib.FormataTexto(QNotaExportaVAL_PEDAGIO.Text,11)           +
          Bib.FormataTexto(QNotaExportaCOD_NOTA_ITEM.Text,6)          +
          Bib.FormataTexto(QNotaExportaCOD_NOTA_CAB_1.Text,6)         +
          Bib.FormataTexto(QNotaExportaCOD_TRIBUTACAO.Text,6)         +
          Bib.FormataTexto(QNotaExportaQT_QUANTIDADE.Text,9)          +
          Bib.FormataTexto(QNotaExportaVAL_TOTAL.Text,11)             +
          Bib.FormataTexto(QNotaExportaPERC_IPI.Text,5)               +
          Bib.FormataTexto(QNotaExportaPERC_COMISSAO.Text,5)          +
          Bib.FormataTexto(QNotaExportaCOD_PRODUTO.Text,13)           +
          Bib.FormataTexto(QNotaExportaCOD_LOTE_TIPO.Text,6)          +
          Bib.FormataTexto(QNotaExportaVAL_DESCONTO.Text,11)          +
          Bib.FormataTexto(QNotaExportaVAL_DESPESAS.Text,11)          +
          Bib.FormataTexto(QNotaExportaVAL_FRETE.Text,11)             +
          Bib.FormataTexto(QNotaExportaPERC_DESCONTO.Text,5)          +
          Bib.FormataTexto(QNotaExportaVAL_IPI.Text,11)               +
          Bib.FormataTexto(QNotaExportaVAL_UNITARIO.Text,11)          +
          Bib.FormataTexto(QNotaExportaVAL_ICM_BASE.Text,11)          +
          Bib.FormataTexto(QNotaExportaVAL_ICM.Text,11)               +
          QNotaExportaIND_CLASS_IPI.Text                              +
          Bib.FormataTexto(QNotaExportaVAL_CUSTO.Text,11)             +
          Bib.FormataTexto(QNotaExportaVAL_ISS.Text,11)               +
          Bib.FormataTexto(QNotaExportaPERC_INSS.Text,5)              +
          Bib.FormataTexto(QNotaExportaPERC_BENEFICIADO.Text,5)       +
          Bib.FormataTexto(QNotaExportaIND_BX_CONTR_VEND.Text,1)      +
          Bib.FormataTexto(QNotaExportaNUM_NOTA_PRODUTOR.Text,6);
          S:= S+Chr(13)+Chr(10);
     mContador:=mContador+1;
     MEImp.Text :=  IntToStr(mContador);
     MEImp.Refresh;

     QNotaExporta.Next;
   end;

   if FImportaDados.SaveDialog.Execute then
   begin
     AssignFile(F, FImportaDados.SaveDialog.FileName);
     Rewrite(F);
     Writeln(F, S);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
   else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
 end;
end;

procedure TFImportaDados.BitBtn11Click(Sender: TObject);
var S,cod_nota_cab: String;
    F: TextFile;
    mContador: integer;

begin
  cod_nota_cab :='0';
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QNotaCabImporta.Close;
      QNotaItemImporta.Close;
      QNotaCabImporta.Open;
      QNotaItemImporta.Open;
      BtnImportarLctoContabil.Enabled:= False;
      mContador:=0;
      try
      dmoracle.DBCemapa.startTransaction;
      while Trim(S) <> '' do
      begin
        if cod_nota_cab <> Trim(Copy(S,01,06)) then //-----compara se a nota_cab já foi gravada
        begin
          QNotaCabImporta.Insert;
          QNotaItemImporta.Insert;
          if Trim(Copy(S, 07,06)) <> '' then
             QNotaCabImportaCOD_USUARIO.Value:= StrToInt(Trim(Copy(S, 07,06)));
          if Trim(Copy(S, 13,06)) <> '' then
             If DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1') = 'ENCOPEL'  then
                QNotaCabImportaCOD_FILIAL.Value:= 2
             Else
                QNotaCabImportaCOD_FILIAL.Value:= StrToInt(Trim(Copy(S, 13,06)));
          if Trim(Copy(S, 19,06)) <> '' then
             QNotaCabImportaCOD_MENSAGEM.Value:= StrToInt(Trim(Copy(S, 19,06)));
          if Trim(Copy(S, 25,06)) <> '' then
             QNotaCabImportaCOD_TRANSPORTE.Value:= StrToInt(Trim(Copy(S, 25,06)));
          if Trim(Copy(S, 31,06)) <> '' then
             QNotaCabImportaCOD_OPERACAO.Value:= StrToInt(Trim(Copy(S,31,06)));
          if Trim(Copy(S, 37,02)) <> '' then
             QNotaCabImportaCOD_ESTADO.Value:= Trim(Copy(S, 37,02));
          if Trim(Copy(S, 43,06)) <> '' then
             QNotaCabImportaCOD_VENDEDOR.Value:= StrToInt(Trim(Copy(S, 43,06)));
          if Trim(Copy(S,49,06)) <> '' then
             QNotaCabImportaCOD_CADASTRO.Text:= Trim(Copy(S,49,06));
          if Trim(Copy(S,55,06)) <> '' then
             QNotaCabImportaNUM_NOTA.Value:= StrToInt(Trim(Copy(S,55,06)));
          if Trim(Copy(S,61,03)) <> '' then
             QNotaCabImportaCOD_SERIE.Value:= Trim(Copy(S,61,03));
          if Trim(Copy(S,64,03)) <> '' then
             QNotaCabImportaIND_SITUACAO.Value:= Trim(Copy(S,64,03));
          if Trim(Copy(S,67,01)) <> '' then
             QNotaCabImportaIND_CONDICAO_PAGTO.Value:= Trim(Copy(S,67,01));
          if Trim(Copy(S,68,10)) <> '' then
             QNotaCabImportaDT_EMISSAO.Value:= StrToDate(Trim(Copy(S,68,10)));
          if Trim(Copy(S,78,10)) <> '' then
             QNotaCabImportaDT_MOVIMENTO.Value:= StrToDate(Trim(Copy(S,78,10)));
          if Trim(Copy(S,97,10)) <> '' then
             QNotaCabImportaDT_RECEBIMENTO.Value:= StrToDate(Trim(Copy(S,97,10)));
          if Trim(Copy(S,107,06)) <> '' then
             QNotaCabImportaCOD_MOTIVO_CANC.Value:= StrToInt(Trim(Copy(S,107,06)));
          if Trim(Copy(S,113,11)) <> '' then
             QNotaCabImportaVAL_DESPESAS.Value:= StrToFloat(Trim(Copy(S,113,11)));
          if Trim(Copy(S,124,01)) <> '' then
             QNotaCabImportaIND_ENTRADA_SAIDA.Value:= Trim(Copy(S,124,01));
          if Trim(Copy(S,127,11)) <> '' then
             QNotaCabImportaVAL_FRETE.Value:= StrToFloat(Trim(Copy(S,127,11)));
          if Trim(Copy(S,138,11)) <> '' then
             QNotaCabImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,138,11)));
          if Trim(Copy(S,149,11)) <> '' then
             QNotaCabImportaCOD_TRANSPORTADOR.Value:= StrToInt(Trim(Copy(S,149,11)));
          if Trim(Copy(S,155,06)) <> '' then
             QNotaCabImportaNUM_CONHECIMENTO_FRETE.Value:= StrToInt(Trim(Copy(S,155,06)));
          if Trim(Copy(S,161,11)) <> '' then
             QNotaCabImportaVAL_AVISTA.Value:= StrToFloat(Trim(Copy(S,161,11)));
          if Trim(Copy(S,172,03)) <> '' then
             QNotaCabImportaIND_TIPO_FRETE.Value:= Trim(Copy(S,172,03));
          if Trim(Copy(S,175,06)) <> '' then
             QNotaCabImportaNUM_VOLUMES.Value:= StrToInt(Trim(Copy(S,175,06)));
          if Trim(Copy(S,181,60)) <> '' then
             QNotaCabImportaOBS.Value:= Trim(Copy(S,181,60));
          if Trim(Copy(S,241,60)) <> '' then
             QNotaCabImportaOBS_COMPLEMENTO.Value:= Trim(Copy(S,241,60));
          if Trim(Copy(S,301,10)) <> '' then
             QNotaCabImportaDT_USUARIO.Value:= StrToDate(Trim(Copy(S,301,10)));
          if Trim(Copy(S,320,06)) <> '' then
             QNotaCabImportaCOD_TRIBUTACAO_FRETE.Value:= StrToInt(Trim(Copy(S,320,06)));
          if Trim(Copy(S,326,11)) <> '' then
             QNotaCabImportaVAL_TOTAL_IPI.Value:= StrToFloat(Trim(Copy(S,326,11)));
          if Trim(Copy(S,337,11)) <> '' then
             QNotaCabImportaVAL_ICM_FRETE.Value:= StrToFloat(Trim(Copy(S,337,11)));
          if Trim(Copy(S,348,11)) <> '' then
             QNotaCabImportaVAL_ICM_BASE_FRETE.Value:= StrToFloat(Trim(Copy(S,348,11)));
          if Trim(Copy(S,359,11)) <> '' then
             QNotaCabImportaVAL_FUNRURAL.Value:= StrToFloat(Trim(Copy(S,359,11)));
          if Trim(Copy(S,370,08)) <> '' then
             QNotaCabImportaDESC_PLACA.Value:= Trim(Copy(S,370,08));
          if Trim(Copy(S,378,50)) <> '' then
             QNotaCabImportaDESC_TRANSPORTADORA.Value:= Trim(Copy(S,378,50));
          if Trim(Copy(S,428,06)) <> '' then
             QNotaCabImportaCOD_NOTA_CONTA_CORRENTE.Value:= StrToInt(Trim(Copy(S,428,06)));
          if Trim(Copy(S,434,19)) <> '' then
             QNotaCabImportaDT_EMISSAO_CF.Value:= StrToDate(Trim(Copy(S,434,19)));
          if Trim(Copy(S,453,06)) <> '' then
             QNotaCabImportaCOD_OPERACAO_CF.Value:= StrToInt(Trim(Copy(S,453,06)));
          if Trim(Copy(S,459,03)) <> '' then
             QNotaCabImportaNR_DIAS_CHEQUE.Value:= StrToInt(Trim(Copy(S,459,03)));
          if Trim(Copy(S,462,06)) <> '' then
             QNotaCabImportaCOD_CONTRATO_MOV.Value:= StrToInt(Trim(Copy(S,462,06)));
          if Trim(Copy(S,468,06)) <> '' then
             QNotaCabImportaCOD_CONTRATO_GP_MOV.Value:= StrToInt(Trim(Copy(S,468,06)));
          if Trim(Copy(S,474,03)) <> '' then
             QNotaCabImportaNR_DIAS_CHEQUE1.Value:= StrToInt(Trim(Copy(S,474,03)));
          if Trim(Copy(S,477,03)) <> '' then
             QNotaCabImportaNR_DIAS_CHEQUE2.Value:= StrToInt(Trim(Copy(S,477,03)));
          if Trim(Copy(S,480,03)) <> '' then
             QNotaCabImportaIND_NOTA_SEGURO.Value:= Trim(Copy(S,480,03));
          if Trim(Copy(S,483,06)) <> '' then
             QNotaCabImportaCOD_CONTRATO_VEND.Value:= StrToInt(Trim(Copy(S,483,06)));
          if Trim(Copy(S,489,06)) <> '' then
             QNotaCabImportaNR_ROTA.Value:= StrToInt(Trim(Copy(S,489,06)));
          if Trim(Copy(S,495,06)) <> '' then
             QNotaCabImportaPERC_COMISSAO.Value:= StrToFloat(Trim(Copy(S,495,06)));
          if Trim(Copy(S,501,03)) <> '' then
             QNotaCabImportaIND_MILHAGEM.Value:= Trim(Copy(S,501,03));
          if Trim(Copy(S,504,06)) <> '' then
             QNotaCabImportaNUM_OS.Value:= StrToInt(Trim(Copy(S,504,06)));
          if Trim(Copy(S,510,06)) <> '' then
             QNotaCabImportaCOD_DEPARTAMENTO.Value:= StrToInt(Trim(Copy(S,510,06)));
          if Trim(Copy(S,516,11)) <> '' then
             QNotaCabImportaVAL_PEDAGIO.Value:= StrToFloat(Trim(Copy(S,516,11)));

          //----------------inicio da gravacao da tabela tb_nota_item

          if Trim(Copy(S,533,06)) <> '' then
             QNotaItemImportaCOD_NOTA_CAB.Value:= QNotaCabImportaCOD_NOTA_CAB.Value;
          if Trim(Copy(S,539,06)) <> '' then
             QNotaItemImportaCOD_TRIBUTACAO.Value:= StrToInt(Trim(Copy(S,539,06)));
          if Trim(Copy(S,545,09)) <> '' then
             QNotaItemImportaQT_QUANTIDADE.Value:= StrToFloat(Trim(Copy(S,545,09)));
          if Trim(Copy(S,554,11)) <> '' then
             QNotaItemImportaVAL_TOTAL.Value:= StrToFloat(Trim(Copy(S,554,11)));
          if Trim(Copy(S,565,05)) <> '' then
             QNotaItemImportaPERC_IPI.Value:= StrToFloat(Trim(Copy(S,565,05)));
          if Trim(Copy(S,570,05)) <> '' then
             QNotaItemImportaPERC_COMISSAO.Value:= StrToFloat(Trim(Copy(S,570,05)));
          if Trim(Copy(S,575,13)) <> '' then
             QNotaItemImportaCOD_PRODUTO.Value:= StrToFloat(Trim(Copy(S,575,13)));
          if Trim(Copy(S,588,06)) <> '' then
             QNotaItemImportaCOD_LOTE_TIPO.Value:= StrToInt(Trim(Copy(S,588,06)));
          if Trim(Copy(S,594,11)) <> '' then
             QNotaItemImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,594,11)));
          if Trim(Copy(S,605,11)) <> '' then
             QNotaItemImportaVAL_DESPESAS.Value:= StrToFloat(Trim(Copy(S,605,11)));
          if Trim(Copy(S,616,11)) <> '' then
             QNotaItemImportaVAL_FRETE.Value:= StrToFloat(Trim(Copy(S,616,11)));
          if Trim(Copy(S,627,05)) <> '' then
             QNotaItemImportaPERC_DESCONTO.Value:= StrToFloat(Trim(Copy(S,627,05)));
          if Trim(Copy(S,632,11)) <> '' then
             QNotaItemImportaVAL_IPI.Value:= StrToFloat(Trim(Copy(S,632,11)));
          if Trim(Copy(S,643,11)) <> '' then
             QNotaItemImportaVAL_UNITARIO.Value:= StrToFloat(Trim(Copy(S,643,11)));
          if Trim(Copy(S,654,11)) <> '' then
             QNotaItemImportaVAL_ICM_BASE.Value:= StrToFloat(Trim(Copy(S,654,11)));
          if Trim(Copy(S,665,11)) <> '' then
             QNotaItemImportaVAL_ICM.Value:= StrToFloat(Trim(Copy(S,665,11)));
          if Trim(Copy(S,676,01)) <> '' then
             QNotaItemImportaIND_CLASS_IPI.Value:= Trim(Copy(S,676,01));
          if Trim(Copy(S,677,11)) <> '' then
             QNotaItemImportaVAL_CUSTO.Value:=0;
            // StrToFloat(Trim(Copy(S,677,11)));
          if Trim(Copy(S,688,11)) <> '' then
             QNotaItemImportaVAL_ISS.Value:= 0;
             //StrToFloat(Trim(Copy(S,688,11)));
          if Trim(Copy(S,699,05)) <> '' then
             QNotaItemImportaPERC_INSS.Value:=0;
             //StrToFloat(Trim(Copy(S,699,05)));
          if Trim(Copy(S,704,05)) <> '' then
             QNotaItemImportaPERC_BENEFICIADO.Value:= StrToFloat(Trim(Copy(S,704,05)));
          if Trim(Copy(S,709,01)) <> '' then
             QNotaItemImportaIND_BX_CONTR_VEND.Value:= Trim(Copy(S,709,01));
          if Trim(Copy(S,710,06)) <> '' then
             QNotaItemImportaNUM_NOTA_PRODUTOR.Value:= StrToInt(Trim(Copy(S,710,06)));
          QNotaCabImporta.Post;
          QNotaItemImporta.Post;
        end
        else
        begin

          QNotaItemImporta.Insert;
          if Trim(Copy(S,533,06)) <> '' then
             QNotaItemImportaCOD_NOTA_CAB.Value:= QNotaCabImportaCOD_NOTA_CAB.Value;
          if Trim(Copy(S,539,06)) <> '' then
             QNotaItemImportaCOD_TRIBUTACAO.Value:= StrToInt(Trim(Copy(S,539,06)));
          if Trim(Copy(S,545,09)) <> '' then
             QNotaItemImportaQT_QUANTIDADE.Value:= StrToFloat(Trim(Copy(S,545,09)));
          if Trim(Copy(S,554,11)) <> '' then
             QNotaItemImportaVAL_TOTAL.Value:= StrToFloat(Trim(Copy(S,554,11)));
          if Trim(Copy(S,565,05)) <> '' then
             QNotaItemImportaPERC_IPI.Value:= StrToFloat(Trim(Copy(S,565,05)));
          if Trim(Copy(S,570,05)) <> '' then
             QNotaItemImportaPERC_COMISSAO.Value:= StrToFloat(Trim(Copy(S,570,05)));
          if Trim(Copy(S,575,13)) <> '' then
             QNotaItemImportaCOD_PRODUTO.Value:= StrToFloat(Trim(Copy(S,575,13)));
          if Trim(Copy(S,588,06)) <> '' then
             QNotaItemImportaCOD_LOTE_TIPO.Value:= StrToInt(Trim(Copy(S,588,06)));
          if Trim(Copy(S,594,11)) <> '' then
             QNotaItemImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,594,11)));
          if Trim(Copy(S,605,11)) <> '' then
             QNotaItemImportaVAL_DESPESAS.Value:= StrToFloat(Trim(Copy(S,605,11)));
          if Trim(Copy(S,616,11)) <> '' then
             QNotaItemImportaVAL_FRETE.Value:= StrToFloat(Trim(Copy(S,616,11)));
          if Trim(Copy(S,627,05)) <> '' then
             QNotaItemImportaPERC_DESCONTO.Value:= StrToFloat(Trim(Copy(S,627,05)));
          if Trim(Copy(S,632,11)) <> '' then
             QNotaItemImportaVAL_IPI.Value:= StrToFloat(Trim(Copy(S,632,11)));
          if Trim(Copy(S,643,11)) <> '' then
             QNotaItemImportaVAL_UNITARIO.Value:= StrToFloat(Trim(Copy(S,643,11)));
          if Trim(Copy(S,654,11)) <> '' then
             QNotaItemImportaVAL_ICM_BASE.Value:= StrToFloat(Trim(Copy(S,654,11)));
          if Trim(Copy(S,665,11)) <> '' then
             QNotaItemImportaVAL_ICM.Value:= StrToFloat(Trim(Copy(S,665,11)));
          if Trim(Copy(S,676,01)) <> '' then
             QNotaItemImportaIND_CLASS_IPI.Value:= Trim(Copy(S,676,01));
          if Trim(Copy(S,667,11)) <> '' then
             QNotaItemImportaVAL_CUSTO.Value:= 0;
             //StrToFloat(Trim(Copy(S,667,11)));
          if Trim(Copy(S,688,11)) <> '' then
             QNotaItemImportaVAL_ISS.Value:=0;
             // StrToFloat(Trim(Copy(S,688,11)));
          if Trim(Copy(S,699,05)) <> '' then
             QNotaItemImportaPERC_INSS.Value:=0;
             // StrToFloat(Trim(Copy(S,699,05)));
          if Trim(Copy(S,704,05)) <> '' then
             QNotaItemImportaPERC_BENEFICIADO.Value:= StrToFloat(Trim(Copy(S,704,05)));
          if Trim(Copy(S,709,01)) <> '' then
             QNotaItemImportaIND_BX_CONTR_VEND.Value:= Trim(Copy(S,709,01));
          if Trim(Copy(S,800,06)) <> '' then
             QNotaItemImportaNUM_NOTA_PRODUTOR.Value:= StrToInt(Trim(Copy(S,800,06)));
          QNotaItemImporta.Post;
        end;
        cod_nota_cab := Trim(Copy(S,01,06)); //-----variavel recebe o cod_nota para pode comparar com o cod da proxima nota
        mContador:=mContador+1;
        MEImp.Text :=  IntToStr(mContador);
        MEImp.Refresh;
        Readln(F,S);   {Le a linha do arquivo texto}
      end;// fim do while
      dmoracle.DBCemapa.commit;
      ShowMessage('Notas Importadas com Exito');
      except
        dmoracle.dbcemapa.rollback;
        ShowMessage('Erro no Arquivo de exportação, nenhuma NF foi Importada.');
      end;
    end;
    BtnImportarLctoContabil.Enabled:= True;
  end;
end;

procedure TFImportaDados.BitBtn14Click(Sender: TObject);
Var mContador: Integer;
    wComando : String;
begin
  mContador := 0;
  with DMConverte do
  begin
   // conversão contas a receber da AB //
    QContaReceber.Close;
    QContaReceber.Open;
    try
    DMoracle.DBCemapa.StartTransaction;
    While Not (QContaReceber.Eof) do
    Begin
      If QContaReceberCod_Cadastro_Novo.Text <> '' Then
       Begin
          With DMOracle do
          Begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET COD_CADASTRO='+QContaReceberCod_Cadastro_Novo.Text;
            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = '+FloatToStr(QContaReceberCod_Conta_Receber_Cab.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          End;
       End;
      mContador:=mContador+1;
      MEImp.Text :=  IntToStr(mContador);
      MEImp.Refresh;
      QContaReceber.Next;
    End;// fim do while
      DMoracle.DBCemapa.Commit;
    except
      dmoracle.dbcemapa.rollback;
    end;

   // conversão contas a pagar da AB //
    mContador := 0;
    MEImp.Text :=  IntToStr(mContador);
    MEImp.Refresh;

    QContaPagar.Close;
    QContaPagar.Open;
    try
    DMoracle.DBCemapa.StartTransaction;
    While Not (QContaPagar.Eof) do
    Begin
      If QContaPagarCod_Cadastro_Novo.Text <> '' Then
       Begin
          With DMOracle do
          Begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_PAGAR_CAB SET COD_CADASTRO='+QContaPagarCod_Cadastro_Novo.Text;
            wComando := wComando + ' WHERE COD_CONTA_PAGAR_CAB = '+FloatToStr(QContaPagarCod_Conta_Pagar_Cab.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          End;
       End;
      mContador:=mContador+1;
      MEImp.Text :=  IntToStr(mContador);
      MEImp.Refresh;
      QContaPagar.Next;
    End;// fim do while
      DMoracle.DBCemapa.Commit;
    except
      dmoracle.dbcemapa.rollback;
    end;
  end;
end;
procedure TFImportaDados.BitBtn17Click(Sender: TObject);
var S: String;
      F: TextFile;
      mContador: integer;
begin
   // Grava dados Query dentro do arquivo

 mContador:=0; // Inicializa valor da variavel de contagem.

 with DMImportaDados do
 begin
   QExportaCadBloqueado.Close;
   QExportaCadBloqueado.SetVariable('COD_FILIAL', Trim(ME22Filial.Text));
   QExportaCadBloqueado.SetVariable('DT_Vencimento', ((Date)-(StrToInt(Trim(ME22Dias_Atraso.Text)))));
   QExportaCadBloqueado.open;
   QExportaCadBloqueado.First;
   BtnExportar.Enabled:= False;

   S:= '';  // Inicializa valor da variavel.
   while not QExportaCadBloqueado.Eof do
   begin
     If Trim(QExportaCadBloqueadoNUM_CGC_CPF.text) <> '' then
     begin
       S:=S+Bib.FormataTexto(QExportaCadBloqueadoCOD_CADASTRO.Text,6)      +
            Bib.FormataTexto(QExportaCadBloqueadoNUM_CGC_CPF.Text,18)      +
            Bib.FormataTexto(QExportaCadBloqueadoNUM_INSCRICAO.Text,20);
            S:= S+Chr(13)+Chr(10);
       mContador:=mContador+1;
       MEImp.Text :=  IntToStr(mContador);
       MEImp.Refresh;
     end;
     QExportaCadBloqueado.Next;
   end;

   if FImportaDados.SaveDialog.Execute then
   begin
     AssignFile(F, FImportaDados.SaveDialog.FileName );
     Rewrite(F);
     Writeln(F, S);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
   else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
 end;
end;

procedure TFImportaDados.BTImportaCadBloqueadoClick(Sender: TObject);
var S,wComando: String;
    F: TextFile;
    mContador: integer;

begin
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      DMOracle.QExecSQL.Close;  //----- INICIA LIMPEZA DA TABELA
      DMOracle.QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CADASTRO_BLOQUEADO';
      DMOracle.QExecSQL.SQL.Add(wComando);
      DMOracle.QExecSQL.ExecSQL;

      QImportaCadBloqueado.Close;
      QImportaCadBloqueado.Open;
      BTImportaCadBloqueado.Enabled:= False;
      mContador:=0;
      try
      dmoracle.DBCemapa.StartTransaction;
      while Trim(S) <> '' do
      begin
        QImportaCadBloqueado.Insert;
        if Trim(Copy(S, 01,06)) <> '' then
          QImportaCadBloqueadoCod_Cadastro.value:= StrToInt(Trim(Copy(S, 01,06)));
        if Trim(Copy(S, 07,24)) <> '' then
          QImportaCadBloqueadoNUM_CGC_CPF.Value:=(Trim(Copy(S, 07,24)));
        if Trim(Copy(S, 25,44)) <> '' then
          QImportaCadBloqueadoNUM_INSCRICAO.Value:=(Trim(Copy(S, 25,44)));
        mContador:=mContador+1;
        MEImp.Text := IntToStr(mContador);
        MEImp.Refresh;
        Readln(F,S);   {Le a linha do arquivo texto}
        QImportaCadBloqueado.Post;
      end;// fim do while
      dmoracle.DBCemapa.commit;
      except
        DMOracle.DBCemapa.RollBack;
      end;
    end;
    BTImportaCadBloqueado.Enabled := True;
  end;

end;

procedure TFImportaDados.BTExportaCadastroCanceladoClick(Sender: TObject);
var
  S: String;
  F: TextFile;
  wContador: integer;
begin
  wContador:=0; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  with DMImportaDados do
  begin
    QExpCadCancelado.Open;
    QExpCadCancelado.First;
    while not QExpCadCancelado.Eof do
    begin
      If QExpCadCanceladoNUM_CGC_CPF.text <> '' then
      begin
        S:=S+Bib.FormataTexto(QExpCadCanceladoCOD_CADASTRO.Text,6)      +
        Bib.FormataTexto(QExpCadCanceladoNUM_CGC_CPF.Text,18)           +
        Bib.FormataTexto(QExpCadCanceladoNUM_INSCRICAO.Text,20);
        S:= S+Chr(13)+Chr(10);
        Inc(wContador);
        LBContExportacao.Caption:=IntToStr(wContador);
      end;
      QExpCadCancelado.Next;
    end;

    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName );
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  end;
end;
procedure TFImportaDados.BTImportaCadastroCanceladoClick(Sender: TObject);
var
  wCgc,wCgc1,S, wComando: String;
  F: TextFile;
  wContador,I: integer;
begin
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
   With DMOracle do
   Begin
     QExecSQL.Close;
     QExecSQL.SQL.Clear;
     wComando := 'DELETE FROM TB_CADASTRO_BLOQUEADO';
     QExecSQL.SQL.Add(wComando);
     QExecSQL.ExecSQL;
   end;
   try
   dmoracle.DBCemapa.StartTransaction;
   with DMImportaDados do
   begin
     QImpCadCancelado.Close;
     QImpCadCancelado.Open;
     wContador:=0;
     while Trim(S) <> '' do
     begin
       QImpCadCancelado.Insert;
       if Trim(Copy(S,01,06)) <> '' then
         QImpCadCanceladoCOD_CADASTRO.Value:= StrToInt(Trim(Copy(S,01,06)));
       if Trim(Copy(S,07,24)) <> '' then
       Begin
         wCgc1 := '';
         wCgc := Trim(Copy(S,07,24));
         For i := 1 to 18 do
            if wCgc[I] in ['0','1','2','3','4','5','6','7','8','9'] then
               wCgc1 := wCgc1 + wCgc[I];
         QImpCadCanceladoNUM_CGC_CPF.Value:= wCgc1;
       End;
       if Trim(Copy(S,25,45)) <> '' then
         QImpCadCanceladoNUM_INSCRICAO.Value:= (Trim(Copy(S,25,45)));
       QImpCadCancelado.Post;
       Readln(F,S);
       Inc(wContador);
       LBContImportacao.Caption:=IntToStr(wContador);
     end;
   end;
   dmoracle.DBCemapa.commit;
   except
     dmoracle.dbcemapa.rollback;
     raise;
   end;
  end;
end;


procedure TFImportaDados.BtnExpSistAccoClick(Sender: TObject);
var
  S, DataIni, DataFinal: String;
  F: TextFile;
  wContador: integer;
begin
  wContador:=0; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.

  If (Trim(EdFilial1.Text) = '') then
    raise exception.Create('Deve ser o código da Empresa Filial!');

  if (Trim(MEInicial.Text) = '') or
     (Trim(MEFinal.Text) = '') then
    raise exception.Create('Deve ser informado período de lançamento!');
  DataIni:= MEInicial.Text;
  DataFinal:= MEFinal.Text;
  with DMImportaDados do
  begin
    QExportaAcco.Close;
    QExportaAcco.SetVariable('DT_INICIAL', MEInicial.Text);
    QExportaAcco.SetVariable('DT_FINAL', MEFinal.Text);
    QExportaAcco.SetVariable('FILIAL', EdFilial1.Text);
    QExportaAcco.Open;
    QExportaAcco.First;
    S:= '01'                                                            +
        RMaskCGC_CPF( QExportaAccoNUM_CGC.Text,14)                      +
        Bib.FormataTexto(QExportaAccoDESC_FILIAL.Text,35)               +
        Copy(DataIni,1,2) + Copy(DataIni,4,2) + Copy(DataIni,7,4)       +
        Copy(DataFinal,1,2) + Copy(DataFinal,4,2) + Copy(DataFinal,7,4) +
        Bib.FormataTexto(' ',207) + Chr(13)+Chr(10);
    while not QExportaAcco.Eof do
    begin
      S := S +'02' +     //Registro Tipo 02 Dados de Nota Fiscal
      Bib.FormataTexto(QExportaAccoNOME.Text,40)                      +
      Bib.FormataTexto(QExportaAccoDESC_ENDERECO.Text,40)             +
      Bib.FormataTexto(QExportaAccoDESC_CIDADE.Text,40)               +
      Bib.FormataTexto(QExportaAccoCOD_ESTADO.Text,2)                 +
      RMaskCGC_CPF( QExportaAccoDESC_CEP.Text,8)                      +
      RMaskCGC_CPF( QExportaAccoNUM_CGC_CPF.Text,14)                  +
      Bib.FormataTexto(QExportaAccoDESC_PRODUTO.Text,40)              +
      IntDecimais (QExportaAccoNUM_EMBALAGEM.Text,7,3)                +   //ITEM 9
      Bib.FormataTexto(QExportaAccoDESC_UNIDADE.Text,3);
      If QExportaAccoIND_TIPO_EMBALAGEM.Text = '1' then
        S:= S + Bib.FormataTexto('RIGIDAS LAVAVEIS',20);
      If QExportaAccoIND_TIPO_EMBALAGEM.Text = '2' then
        S:= S + Bib.FormataTexto('FLEXIVEIS',20);
      If QExportaAccoIND_TIPO_EMBALAGEM.Text = '3' then
        S:= S + Bib.FormataTexto('RIGIDAS NAO LAVAVEIS',20);
      S:= S + IntDecimais (QExportaAccoQT_QUANTIDADE.Text,11,3)  +      //ITEM 12
      Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text),1,2) + Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text),4,2) + Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text),7,4)   +
      RMaskCGC_CPF( QExportaAccoNUM_NOTA.Text,6)   +
      RMaskCGC_CPF( QExportaAccoNUM_CGC.Text,14);
      If QExportaAccoIND_VENDAS.Text = 'D' then
        S:= S + '2'
      Else
        S:= S + '1';
      S:= S + Bib.FormataTexto(QExportaAccoCOD_PRODUTO.Text,10);
      If Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = '' then
        S:= S + Bib.FormataTexto(' ',8);
      If Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'P' then
        S:= S + Bib.FormataTexto('PLASTICO',8);
      If Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'V' then
        S:= S + Bib.FormataTexto('VIDRO',8);
      If Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'M' then
        S:= S + Bib.FormataTexto('METAL',8);
      S:= S + Chr(13)+Chr(10);
      Inc(wContador);
      QExportaAcco.Next;
    end;
    //**********REGISTRO DO TIPO 3*************************************
    S:= S + '03'   +
    RMaskCGC_CPF('1',10);
    Label20.Caption:=IntToStr(wContador);
    S:= S + RMaskCGC_CPF( IntToStr(wContador),10)  +
    RMaskCGC_CPF('1',10)    +
    Bib.FormataTexto(' ',242) + Chr(13)+Chr(10);
  end;

  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
end;


procedure TFImportaDados.ME24ImportaClick(Sender: TObject);
Var
   F: TextFile;
   wContador,  wDiasCheque: integer;
   S,wEstado, wCod_Pedido: String;
begin
  wContador := 0;
  S:= '';  // Inicializa valor da variavel.
  wCod_Pedido:='';
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QPedidoCabImporta.Close;
      QPedidoItemImporta.Close;
      QPedidoCabImporta.Open;
      QPedidoItemImporta.Open;
      // desabilitar o botao importar
      wContador:=0;
      try
      DMOracle.DBCemapa.StartTransaction;
      while Trim(S) <> '' do
      begin
        if wCod_Pedido <> Copy(S,03,10) then
        begin
          QPedidoCabImporta.Insert;
          wContador:=wContador+1;

          //--codigo da filial escolhida na importacao
          QPedidoCabImportaCOD_FILIAL.Value:= StrToInt(Trim(FImportaDados.ME24CodFilial.Text));
          if Trim(Copy(S, 318,3)) <> '' then
            QPedidoCabImportaCOD_OPERACAO.Text:= Copy(S,318,3);
          if Trim(Copy(S, 27,6)) <> '' then
            QPedidoCabImportaCOD_VENDEDOR.Value:= StrToInt(Copy(S, 27,6));
          if Trim(Copy(S, 17,6)) <> '' then
            QPedidoCabImportaCOD_CADASTRO.Value:= StrToInt(Copy(S, 17,6));
          //----NUM PEDIDO GERADO APARTIR DA SEQUENCIA POR FILIAL
          QPedidoCabImportaNUM_PEDIDO.Value:= DMSequencia.Sequencia(StrToInt(Trim(FImportaDados.ME24CodFilial.Text)),'PEDIDO');
          if Trim(Copy(S, 33,10)) <> '' then
            QPedidoCabImportaDT_EMISSAO.Value:= StrToDate(Copy(S, 41,2)+'/'+Copy(S, 38,2)+'/'+Copy(S, 33,4));
          QPedidoCabImportaDT_SISTEMA.Value:= DATE;
          if Trim(Copy(S, 63,60)) <> '' then
            QPedidoCabImportaDESC_OBSERVACAO.Value:= (Copy(S, 63,60));
          if Trim(Copy(S, 123,60)) <> '' then
            QPedidoCabImportaDESC_COMPLEMENTO_OBS.Value:= (Copy(S, 123,60));
          if Trim(Copy(S, 440,6)) <> '' then
            QPedidoCabImportaPERC_COMISSAO.Value:= StrToFloat(Copy(S, 440,6))/100;
          if Trim(Copy(S, 183,60)) <> '' then
            QPedidoCabImportaDESC_COMPLEMENTO_OBS2.Value:= (Copy(S, 183,60));
          if Trim(Copy(S, 321,10)) <> '' then
            QPedidoCabImportaIND_TIPO_PAGAMENTO.Value:= (Copy(S, 321,10));
          QPedidoCabImportaCod_Usuario.Value:= DMUsuario.QUsuarioCod_Usuario.Value;
          if DMOracle.BuscaNome('SELECT TB_PRAZO_VENCIMENTO_DIAS.NUM_DIAS FROM TB_PRAZO_VENCIMENTO_DIAS','COD_PRAZO_VENCIMENTO = '+Trim(Copy(S, 57,6))) <> '' then
          begin
            wDiasCheque:=StrToInt(DMOracle.BuscaNome('SELECT TB_PRAZO_VENCIMENTO_DIAS.NUM_DIAS FROM TB_PRAZO_VENCIMENTO_DIAS','COD_PRAZO_VENCIMENTO = '+Trim(Copy(S, 57,6))));
            if wDiasCheque > 0 then
            begin
              QPedidoCabImportaNR_DIAS_CHEQUE.Value := wDiasCheque;
              QPedidoCabImportaNR_DIAS_CHEQUE1.Value:= wDiasCheque;
              QPedidoCabImportaNR_DIAS_CHEQUE2.Value:= wDiasCheque;
              QPedidoCabImportaNR_DIAS_CHEQUE3.Value:= wDiasCheque;
            end;
          end;
          if Trim(Copy(S, 57,6)) <> '000000' then
            QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value:= StrToInt(Copy(S, 57,6));
          //--- padrao frete CIF
          QPedidoCabImportaIND_TIPO_FRETE.Value:= 'CIF'; //------FALTA
          QPedidoCabImporta.Post;

          //---------------grava itens
          QPedidoItemImporta.Insert;
          QPedidoItemImportaCod_Pedido_Cab.Value := QPedidoCabImportaCod_Pedido_Cab.Value;
          if Trim(Copy(S, 381,10)) <> '' then
            QPedidoItemImportaCOD_PRODUTO.Text:= Copy(S, 381,10);
          wEstado:=DMOracle.BuscaNome('SELECT TB_CADASTRO.COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Copy(S, 17,6)));
          QPedidoItemImportaCOD_TRIBUTACAO.Text:= DMOracle.BuscaNome('SELECT TB_ESTADO.PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+chr(39)+wEstado+chr(39));//------FALTA
          if Trim(Copy(S, 392,9)) <> '' then
            QPedidoItemImportaQT_PEDIDO.Value:= StrToInt(Copy(S, 392,9));
          if Trim(Copy(S, 405,11)) <> '' then
            QPedidoItemImportaVAL_UNITARIO.Value:= (StrToFloat(Copy(S, 405,11)))/100;
          QPedidoItemImportaQT_ATENDIDO.Value:=0;
          QPedidoItemImportaQT_CANCELADO.Value:=0;
          QPedidoItemImportaQT_CANCELADO.Value:=0;
          QPedidoItemImportaPERC_DESCONTO.Value:=0;
          QPedidoItemImportaCOD_LOTE_TIPO.Value:=1;
          if Trim(Copy(S, 440,6)) <> '' then
            QPedidoItemImportaPERC_COMISSAO.Value:= (StrToFloat(Copy(S, 440,6)))/100;
          if Trim(Copy(S, 420,11)) <> '' then
            QPedidoItemImportaPERC_DESCONTO.Value:= (StrToFloat(Copy(S, 420,11)))/100;
        end
        else
        begin
          //---------------grava itens
          QPedidoItemImporta.Insert;
          QPedidoItemImportaCod_Pedido_Cab.Value := QPedidoCabImportaCod_Pedido_Cab.Value;
          if Trim(Copy(S, 381,10)) <> '' then
            QPedidoItemImportaCOD_PRODUTO.Text:= Copy(S, 381,10);
          wEstado:=DMOracle.BuscaNome('SELECT TB_CADASTRO.COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Copy(S, 17,6)));
          QPedidoItemImportaCOD_TRIBUTACAO.Text:= DMOracle.BuscaNome('SELECT TB_ESTADO.PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+chr(39)+wEstado+chr(39));//------FALTA
          if Trim(Copy(S, 392,9)) <> '' then
            QPedidoItemImportaQT_PEDIDO.Value:= StrToInt(Copy(S, 392,9));
          if Trim(Copy(S, 405,11)) <> '' then
            QPedidoItemImportaVAL_UNITARIO.Value:= (StrToFloat(Copy(S, 405,11)))/100;
          QPedidoItemImportaQT_ATENDIDO.Value:=0;
          QPedidoItemImportaQT_CANCELADO.Value:=0;
          QPedidoItemImportaQT_CANCELADO.Value:=0;
          QPedidoItemImportaPERC_DESCONTO.Value:=0;
          QPedidoItemImportaCOD_LOTE_TIPO.Value:=1;
          if Trim(Copy(S, 440,6)) <> '' then
            QPedidoItemImportaPERC_COMISSAO.Value:= (StrToFloat(Copy(S, 440,6)))/100;
          if Trim(Copy(S, 420,11)) <> '' then
            QPedidoItemImportaPERC_DESCONTO.Value:= (StrToFloat(Copy(S, 420,11)))/100;
        end;
        wCod_Pedido:=Copy(S,03,10);
        Readln(F,S);
        QPedidoItemImporta.Post;
      end;
        dmoracle.dbcemapa.commit;
      except
        dmoracle.dbcemapa.rollback;
        raise exception.create('Erro nos dados a serem importados');
      end;
    end;
  end;
  MEImp.Text:=IntToStr(wContador);
end;


procedure TFImportaDados.ME25ImportaClick(Sender: TObject);
Var
   F : TextFile;
   wstrS : String;
   wintContador : Integer;
begin
  wstrS:= '';  // Inicializa valor da variavel.
  wintContador := 0;
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,wstrS);                           {Le a linha do arquivo texto}
    If(Copy(wstrS,1,10) <> 'COD_MUNICI')Then
    Begin
      Raise Exception.Create('Este não é o arquivo de Municípios!');
    End;
    Readln(F,wstrS);
    DMImportaDados.QCidadeImporta.Close;
    DMImportaDados.QCidadeImporta.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while(Trim(wstrS) <> '')do
      Begin
        DMImportaDados.QCidadeImporta.Insert;
        DMImportaDados.QCidadeImportaCOD_CIDADE.Text := Trim( Copy(wstrS,1,4) );
        DMImportaDados.QCidadeImportaDESC_CIDADE.Text := Trim( Copy(wstrS,6,50) );
        DMImportaDados.QCidadeImportaCOD_ESTADO.Text := 'PR';//Copy(wstrS,60,2);
        DMImportaDados.QCidadeImporta.Post;
        Inc(wintContador);
        Readln(F,wstrS);
      end;
      dmoracle.dbcemapa.commit;
    except
      DMImportaDados.QCidadeImporta.cancel;
      dmoracle.dbcemapa.rollback;
      raise exception.create('Erro nos dados a serem importados');
    end;
  end;
  DMImportaDados.QCidadeImporta.Close;
  MEImp.Text:=IntToStr(wintContador);
end;

procedure TFImportaDados.BtExportaCadastroInternetClick(Sender: TObject);
var
  S: String;
  F: TextFile;
  wContador: integer;
begin
  wContador:=0; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QCadastroExporta.Close;
    QCadastroExporta.Open;
    PB.Max := QCadastroExporta.RecordCount;
    QCadastroExporta.First;
    while not QCadastroExporta.Eof do
    begin
      S:= S + '01'                                                             +
        RMaskCGC_CPF( QCadastroExportaCOD_CADASTRO.Text,10)                    +
        Bib.FormataTexto( RemoveAspas(QCadastroExportaNOME.Text) ,50)          +
        Bib.FormataTexto( RemoveAspas(QCadastroExportaDESC_ENDERECO.Text) ,40) +
        Bib.FormataTexto( RemoveAspas(QCadastroExportaDESC_CIDADE.Text) ,40)   +
        Bib.FormataTexto(QCadastroExportaCOD_ESTADO.Text,2)                    +
        Bib.FormataTexto(QCadastroExportaDESC_CEP.Text,9)                      +
        Bib.FormataTexto(QCadastroExportaNUM_CGC_CPF.Text,20)                  +
        Bib.FormataTexto(QCadastroExportaNUM_INSCRICAO.Text,20)                +
        RMaskCGC_CPF( QCadastroExportaCOD_VENDEDOR.Text,10)                    +
        Bib.FormataTexto( QCadastroExportaDESC_TELEFONE.Text,15)               +
        Bib.FormataTexto( QCadastroExportaDESC_FAX.Text,15)                    +
        Bib.FormataTexto( QCadastroExportaDESC_E_MAIL.Text,40)                 +
        Bib.FormataTexto( RemoveAspas(QCadastroExportaDESC_BAIRRO.Text) ,30)   +
        Chr(13)+Chr(10);
      Inc(wContador);
      PB.Position := wContador;
      QCadastroExporta.Next;
    end;
  end;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    Label23.Caption := IntToStr(wContador);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    PB.Position := 0;
end;

procedure TFImportaDados.BtnExportaEscritaFiscalClienteClick(Sender: TObject);
var
  S, wstrTel, wstrCGC, wEmpresa: String;
  F: TextFile;
  wContador: integer;
begin
  wEmpresa:=DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_EMPRESA > '+CHR(39)+'A'+CHR(39));//BUSCA A EMPRESA
  wstrTel := '';
  wContador := 1; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalClientes.Close;
    If( Trim(MeExpEscritaFiscalCliPeriodoInicial.Text) = '' )Then
      QExpEscritaFiscalClientes.SetVariable('DT_INICIAL','01/01/1900')
    Else
      QExpEscritaFiscalClientes.SetVariable('DT_INICIAL',Trim(MeExpEscritaFiscalCliPeriodoInicial.Text));

    If( Trim(MeExpEscritaFiscalCliPeriodoFinal.Text) = '' )Then
      QExpEscritaFiscalClientes.SetVariable('DT_FINAL','01/01/1900')
    Else
      QExpEscritaFiscalClientes.SetVariable('DT_FINAL',Trim(MeExpEscritaFiscalCliPeriodoFinal.Text));

    if Trim(MeExpEscritaFiscalCliVendedor.Text) = '' then
      QExpEscritaFiscalClientes.SetVariable('COD_VENDEDOR',NULL)
    else
      QExpEscritaFiscalClientes.SetVariable('COD_VENDEDOR',StrToInt(Trim(MeExpEscritaFiscalCliVendedor.Text)));

    QExpEscritaFiscalClientes.Open;
    PB.Max := QExpEscritaFiscalClientes.RecordCount;
    QExpEscritaFiscalClientes.First;
    while not QExpEscritaFiscalClientes.Eof do
    begin
      if wEmpresa = 'MOINHO' then //insere o COD_CADASTRO se a empresa for o 'MOINHO'
      begin
        S := S + StrZero(QExpEscritaFiscalClientesCOD_CADASTRO.Value,6 );
        S := S + StrZero(QExpEscritaFiscalClientesCOD_VENDEDOR.value,6);//insere 0 a esquerda do valor
      end;

      wstrCGC := FormataCGC( Trim(QExpEscritaFiscalClientesIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalClientesNUM_CGC_CPF.Text) );
      S:= S                                                                          +
        Bib.FormataTexto( wstrCGC,18 )                                               +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesNOME.Text),40 )              +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesDESC_FANTASIA.Text),20 )     +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesCOD_ESTADO.Text),2 )         +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesNUM_INSCRICAO.Text),20 )     +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesDESC_ENDERECO.Text),40 )     +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesDESC_BAIRRO.Text),20 )       +
        Bib.FormataTexto( Trim(QExpEscritaFiscalClientesDESC_CIDADE.Text),20 )       +
        RMaskCGC_CPF( Trim(QExpEscritaFiscalClientesDESC_CEP.Text),8 )               +
        RMaskCGC_CPF( '0',4 ){Trim(QExpEscritaFiscalClientesCOD_CIDADE.Text),4 ) }   +
        RMaskCGC_CPF( Trim(QExpEscritaFiscalClientesDESC_TELEFONE.Text), 13)         +
        RMaskCGC_CPF( '0',6 )                                                        +
        RMaskCGC_CPF( '0',3 )                                                        +
        RMaskCGC_CPF( '0',6 )                                                        +
        RMaskCGC_CPF( '0',3 )                                                        +
        'N'                                                                          +
        Bib.FormataTexto( ' ',70)                                                    +
        RMaskCGC_CPF( IntToStr(wContador),6)                                         +
        Chr(13)+Chr(10);
      Inc(wContador);
      PB.Position := wContador;
      QExpEscritaFiscalClientes.Next;
    end;
  end;
  wstrCGC := Trim(MeExpEscritaFiscalCliPeriodoInicial.Text);
  wstrCGC := Copy(wstrCGC,1,2) + Copy(wstrCGC,4,2) + Copy(wstrCGC,9,2) + '-' + FormatDateTime('DDMMYY',Date);
  SaveDialog.FileName := 'CLIFOR-'+wstrCGC+'.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    Label25.Caption := IntToStr(wContador-1);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  PB.Position := 0; 
end;


procedure TFImportaDados.BtnExportaEscritaFiscalNEClick(Sender: TObject);
var
  S, wstrTel, wstrCGC: String;
  F: TextFile;
  wContador, wintCodigo: integer;
begin
  wstrTel := '';
  wintCodigo := 0;
  wContador := 1; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalNE.Close;
    If(Trim(MeExpEscritaFiscalNEFilial.Text) = '')Then
      QExpEscritaFiscalNE.SetVariable('FILIAL',Null)
    Else
      QExpEscritaFiscalNE.SetVariable('FILIAL',Trim(MeExpEscritaFiscalNEFilial.Text));
    If(Trim(MeExpEscritaFiscalNEDtInicio.Text) = '') OR (Trim(MeExpEscritaFiscalNEDtFim.Text)='')Then
      raise Exception.Create('É necessário informar um Período')
    Else
    Begin
      QExpEscritaFiscalNE.SetVariable('DT_EMISSAO_INICIO',Trim(MeExpEscritaFiscalNEDtInicio.Text));
      QExpEscritaFiscalNE.SetVariable('DT_EMISSAO_FINAL',Trim(MeExpEscritaFiscalNEDtFim.Text));
    End;
    QExpEscritaFiscalNE.Open;
    PB.Max := QExpEscritaFiscalNE.RecordCount;
    QExpEscritaFiscalNE.First;

    wstrCGC := FormataCGC( 'J', Trim(QExpEscritaFiscalNECGC_FILIAL.Text) );
    S := '0' + FormatDateTime('ddmmyyyy', Date)                                          +
      Bib.FormataTexto( wstrCGC,18 )                    +
      '1'  + Bib.FormataTexto(' ',466)                                                   +
      RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
      Inc(wContador);

    while not QExpEscritaFiscalNE.Eof do
    begin
      //REGISTRO EMITENTE/DESTINATARIO
      If(wintCodigo <> QExpEscritaFiscalNECOD_NOTA_CAB.Value)Then
      Begin
        wstrCGC := FormataCGC( Trim(QExpEscritaFiscalNEIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalNENUM_CGC_CPF.Text) );
        S := S                                                                             +
          '4' + Bib.FormataTexto( wstrCGC,18 )                                             +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNENOME.Text),40 )                        +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNEDESC_FANTASIA.Text),20 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNECOD_ESTADO.Text),2 )                   +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNENUM_INSCRICAO.Text),20 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNEDESC_ENDERECO.Text),40 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNEDESC_BAIRRO.Text),20 )                 +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNEDESC_CIDADE.Text),20 )                 +
          RMaskCGC_CPF( Trim(QExpEscritaFiscalNEDESC_CEP.Text),8 )                         +
          '0000'                                                                           +
          RMaskCGC_CPF( Telefone(Trim(QExpEscritaFiscalNEDESC_TELEFONE.Text)), 13)         +
          RMaskCGC_CPF( '0', 18)                                                           +
          'N'                                                                              +
          Bib.FormataTexto(' ',269)                                                        +
          RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
          Inc(wContador);

        //REGISTRO DE NOTAS FISCAIS
        S := S + '1' + FormatDateTime('ddmmyyyy', QExpEscritaFiscalNEDT_EMISSAO.Value)     +
          RMaskCGC_CPF( Trim(QExpEscritaFiscalNENUM_NOTA.Text), 6)                         +
          FormatDateTime('ddmmyyyy', QExpEscritaFiscalNEDT_EMISSAO.Value)                  +
          '00' + Bib.FormataTexto(Trim(QExpEscritaFiscalNECOD_SERIE.Text),3)               +
          '   '                                                                            +
          RMaskCGC_CPF( Trim(QExpEscritaFiscalNECFOP.Text), 4)                             +
          '010000'                                                                         +
          Bib.FormataTexto( wstrCGC, 18)                  +
          IntDecimais( Trim(QExpEscritaFiscalNEval_total_nota.Text), 12,2)                 +
          RMaskCGC_CPF('0',12)  + //PIS
          RMaskCGC_CPF('0',12)  + //COFINS
          RMaskCGC_CPF('0',12)  + //CONTR.SOCIAL
          RMaskCGC_CPF('0',12)  + //IMPOSTO DE RENDA
          IntDecimais( Trim(QExpEscritaFiscalNEbase_calculo_nota.Text),12,2)               +
          IntDecimais( Trim(QExpEscritaFiscalNEPERC_ALIQUOTA.Text),4,2)                    +
          IntDecimais( Trim(QExpEscritaFiscalNEval_icms_nota.Text),12,2)                   +
          RMaskCGC_CPF('0',84)  + //BASE B, C, D
          IntDecimais( FloatToStr(QExpEscritaFiscalNEval_total_nota.Value - QExpEscritaFiscalNEbase_calculo_nota.Value),12,2) +
          RMaskCGC_CPF('0',12)  + //VALOR DE OUTRAS DE ICMS
          RMaskCGC_CPF('0',48)  + //IPI
  {340}   RMaskCGC_CPF('0',48)  + //IPI
  {352}   Bib.FormataTexto( ' ',55);
  {407}   If(QExpEscritaFiscalNEIND_CONDICAO_PAGTO.Text = '1')Then
            S := S + 'S'
          Else
            S := S + 'N';
  {408}   S := S + RMaskCGC_CPF('0',12)  +
  {420}   Bib.FormataTexto( ' ',75) +
          RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
          Inc(wContador);
      End;
//      If(wintCodigo = QExpEscritaFiscalNECOD_NOTA_CAB.Value)Then
      Begin
        //REGISTRO DE PRODUTOS
  {1}   S := S + '2'                                                                        +
  {2}     RMaskCGC_CPF(QExpEscritaFiscalNECOD_NOTA_ITEM.Text,10)                            +
  {12}    RMaskCGC_CPF('0',9)  +
  {21}    IntDecimais(QExpEscritaFiscalNEVAL_TOTAL.Text,12,2)                               +
  {33}    IntDecimais(QExpEscritaFiscalNEQT_QUANTIDADE.Text,13,3)                           +
  {46}    IntDecimais(QExpEscritaFiscalNEVAL_DESCONTO.Text,12,2)                            +
  {58}    IntDecimais(QExpEscritaFiscalNEVAL_ICM_BASE.Text,12,2)                            +
  {70}    IntDecimais(QExpEscritaFiscalNEPERC_ALIQUOTA.Text,5,2)                            +
  {75}    IntDecimais(QExpEscritaFiscalNEVAL_IPI.Text,12,2)                                 +
  {87}    RMaskCGC_CPF('0',12)  +
  {99}    IntDecimais(QExpEscritaFiscalNEPERC_IPI.Text,5,2)                                 +
  {104}   IntDecimais(QExpEscritaFiscalNEPERC_TRIBUTADO.Text,5,2)                           +
  {109}   RMaskCGC_CPF('0',3)  +
  {102}   Bib.FormataTexto(' ',383) +
          RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
          Inc(wContador);

          PB.Position := wContador;
          wintCodigo := QExpEscritaFiscalNECOD_NOTA_CAB.Value;
      End;
      QExpEscritaFiscalNE.Next;
    end;
    //REGISTRO TRAILLER
      S := S + '3'                                                                          +
{2}   IntDecimais(QExpEscritaFiscalNEval_total_nota.Text,12,2)                              +
{14}  RMaskCGC_CPF('0',48)  +
{62}  IntDecimais(QExpEscritaFiscalNEbase_calculo_nota.Text,12,2)                           +
{74}  IntDecimais(QExpEscritaFiscalNEval_icms_nota.Text,12,2)                               +
{86}  RMaskCGC_CPF('0',72)  +
{158} IntDecimais( FloatToStr(QExpEscritaFiscalNEval_total_nota.Value - QExpEscritaFiscalNEbase_calculo_nota.Value),12,2) +
{170} RMaskCGC_CPF('0',108)  +
{277} Bib.FormataTexto(' ',217)                                                             +
      RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
      QExpEscritaFiscalNE.Close;
  end;
  SaveDialog.FileName := 'NOTAENT.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    Label27.Caption := IntToStr(wContador-2);
  end
  else
  Begin
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    Label27.Caption := '0';
  End;
  PB.Position := 0;
end;

Function TFImportaDados.RetornaItens( wContador : Integer ; wstrItem : String ):String;
Begin
  with DMImportaDados do
  begin
        //REGISTRO DE PRODUTOS
  {1}   wstrItem := wstrItem + '2'                                                                        +
  {2}     RMaskCGC_CPF(QExpEscritaFiscalNSCOD_PRODUTO.Text,10)                            +
  {12}    Bib.StrZero('0',9)  +
  {21}    IntDecimais(QExpEscritaFiscalNSVAL_TOTAL.Text,12,2)                               +
  {33}    IntDecimais(QExpEscritaFiscalNSQT_QUANTIDADE.Text,13,3)                           +
  {46}    IntDecimais(QExpEscritaFiscalNSVAL_DESCONTO.Text,12,2)                            +
  {58}    IntDecimais(QExpEscritaFiscalNSVAL_ICM_BASE.Text,12,2)                            +
  {70}    IntDecimais(QExpEscritaFiscalNSPERC_ALIQUOTA.Text,5,2)                            +
  {75}    IntDecimais(QExpEscritaFiscalNSVAL_IPI.Text,12,2)                                 +
  {87}    Bib.StrZero('0',12)  +
  {99}    IntDecimais(QExpEscritaFiscalNSPERC_IPI.Text,5,2)                                 +
  {104}   IntDecimais(QExpEscritaFiscalNSPERC_TRIBUTADO.Text,5,2)                           +
  {109}   Bib.StrZero('0',3)  +
  {112}   Bib.FormataTexto(' ',383) +
          RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
          //Inc(wContador);

          PB.Position := wContador;
          //wintCodigo := QExpEscritaFiscalNSCOD_NOTA_CAB.Value;
          QExpEscritaFiscalNS.Next;
          Result := wstrItem;
  End;
End;

procedure TFImportaDados.BtnExportaEscritaFiscalNSClick(Sender: TObject);
var
  S, wstrTel, wstrCGC, wstrNota, wstrItem, wstrAux, wstrCfop, wstrVlrContabil: String;
  F: TextFile;
  wContador, wintCodigo, wintCodTributacao, wintSituacao: Integer;
  wfloBase, wfloPercAliq, wfloVlrIcms : Real;
  wbooBrinde : Boolean;
begin
  wbooBrinde := False;
  wbooBase := False;
  wstrAux := ''; //vai armazenar os campos entre 273 a 500 do registro de notas fiscais
  wstrNota := ''; //vai armazenar os campos entre 137 a 272 (valores icms)
  wstrItem := ''; //armazena os registros de itens (registro de produtos)
  wstrTel := '';
  wstrCfop := '';
  wstrVlrContabil := '';
  wintSituacao := 0;
  wintContBase := 0; //variavel com a finalidade de contar qtas aliquotas diferentes existem,
                     //o arquivo permite apenas 4 aliquotas diferentes
  wintCodigo := 0; //vai armazenar o codigo da nota para comparação qdo as notas forem diferentes
  wintCodTributacao := 0;
  wfloBase := 0; //base do icms
  wfloPercAliq := 0; //aliquota icms
  wfloVlrIcms := 0;
  wfloVlrIsentas := 0;
  wContador := 1; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  Label35.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalNS.Close;
    If(Trim(MeExpEscritaFiscalNSFilial.Text) = '')Then
      QExpEscritaFiscalNS.SetVariable('FILIAL',Null)
    Else
      QExpEscritaFiscalNS.SetVariable('FILIAL',Trim(MeExpEscritaFiscalNSFilial.Text));
    If(Trim(MeExpEscritaFiscalNSDtInicio.Text) = '') OR (Trim(MeExpEscritaFiscalNSDtFim.Text)='')Then
      raise Exception.Create('É necessário informar um Período')
    Else
    Begin
      QExpEscritaFiscalNS.SetVariable('DT_INICIO',Trim(MeExpEscritaFiscalNSDtInicio.Text));
      QExpEscritaFiscalNS.SetVariable('DT_FINAL',Trim(MeExpEscritaFiscalNSDtFim.Text));
    End;
    QExpEscritaFiscalNS.Open;
    If(QExpEscritaFiscalNS.IsEmpty)Then
      raise Exception.Create('Não existem registros a serem gerados no período especificado');
    PB.Max := QExpEscritaFiscalNS.RecordCount;
    QExpEscritaFiscalNS.First;

    //------------------------REGISTRO HEADER---------------------------------\\
    wstrCGC := FormataCGC( 'J', Trim(QExpEscritaFiscalNSCGC_FILIAL.Text) );
    S := '0' + FormatDateTime('ddmmyyyy', Date)                                          +
      Bib.FormataTexto( Trim(QExpEscritaFiscalNSCGC_FILIAL.Text),18 )                    +
      '1'  + Bib.FormataTexto(' ',466)                                                   +
      RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
      Inc(wContador);

    while not QExpEscritaFiscalNS.Eof do
    begin
      //----------------REGISTRO EMITENTE/DESTINATARIO------------------------\\
      If(wintCodigo <> QExpEscritaFiscalNSCOD_NOTA_CAB.Value) Or
        (wstrCfop <> QExpEscritaFiscalNSCFOP.Text) Then
      Begin
        wstrCGC := FormataCGC( Trim(QExpEscritaFiscalNSIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalNSNUM_CGC_CPF.Text) );
        If(Not QExpEscritaFiscalNS.Bof)Then
        Begin
          wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
          wstrNota := wstrNota +  ValoresIcms( wbooBrinde, wintSituacao, StrToInt(wstrCfop),
                                               FloatToStr(wfloBase), FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq) ,wstrVlrContabil);
        End;
        S := S + RetornaNotas(wstrNota) + wstrAux + wstrItem;
        wstrAux := '';
        wstrNota := '';
        wstrItem := '';
        wintContBase := 0;
//        wintCodigo := 0;
//        wintCodTributacao := 0;
//        wfloBase := 0;
//        wfloPercAliq := 0;
//        wfloVlrIcms := 0;
        wfloVlrIsentas := 0;
//        wintSituacao := 0;
        S := S + '4' + Bib.FormataTexto( wstrCGC,18 )                                      +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSNOME.Text),40 )                        +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSDESC_FANTASIA.Text),20 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSCOD_ESTADO.Text),2 )                   +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSNUM_INSCRICAO.Text),20 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSDESC_ENDERECO.Text),40 )               +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSDESC_BAIRRO.Text),20 )                 +
          Bib.FormataTexto( Trim(QExpEscritaFiscalNSDESC_CIDADE.Text),20 )                 +
          RMaskCGC_CPF( Trim(QExpEscritaFiscalNSDESC_CEP.Text),8 )                         +
          '0000'                                                                           +
          RMaskCGC_CPF( Telefone(Trim(QExpEscritaFiscalNSDESC_TELEFONE.Text)), 13)         +
          Bib.StrZero( '0', 18)                                                            +
          'N'                                                                              +
          Bib.FormataTexto(' ',269)                                                        +
          RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
          Inc(wContador);

        //--------------------REGISTRO DE NOTAS FISCAIS-----------------------\\
        //O registro de notas fiscais é composto pelas variáveis (wstrNota + wstrAux)
//        If QExpEscritaFiscalNSIND_SITUACAO.Value = '2' Then  // somente exporta os itens se a nota não for cancelada
//         Begin
          wstrNota := wstrNota + '1' + FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value)     +
  {10-15}   RMaskCGC_CPF( QExpEscritaFiscalNSNUM_NOTA.Text,6 )                               +
  {16-21}   RMaskCGC_CPF( QExpEscritaFiscalNSNUM_NOTA.Text,6 )                               +
  {22-29}   FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value)                  +
  {30-32}   '   ' + '01001'                                                                  +
  {38-40}   '   '                                                                            +
  {41-44}   RMaskCGC_CPF( Trim(QExpEscritaFiscalNSCFOP.Text), 4);
  {45-46}   Case QExpEscritaFiscalNSCFOP.AsInteger Of
              5501,6501: wstrNota := wstrNota + '03';
              5910,6910: Begin
                           If(QExpEscritaFiscalNSIND_BRINDE.Text = 'N')Then
                             wstrNota := wstrNota + '02'
                           Else
                             wstrNota := wstrNota + '01';
                         End;
              Else
                wstrNota := wstrNota + '01';
            End;
  {47-50}   wstrNota := wstrNota + Classificacao( QExpEscritaFiscalNSCFOP.AsInteger , QExpEscritaFiscalNSIND_SITUACAO.AsInteger,
                                   QExpEscritaFiscalNSIND_CONDICAO_PAGTO.AsInteger)                      +
  {51-68}   '00' + Bib.FormataTexto( wstrCGC, 18);
  {69-80}   If(QExpEscritaFiscalNSIND_SITUACAO.Text = '2')Then
            Begin
              wstrVlrContabil := IntDecimais(QExpEscritaFiscalNSVAL_TOTAL_NOTA.Text,12,2) ;
              wstrNota := wstrNota + wstrVlrContabil +
              Bib.StrZero('0',12)  + //PIS
              Bib.StrZero('0',12)  + //COFINS
              Bib.StrZero('0',12)  + //CONTR.SOCIAL
              Bib.StrZero('0',12)  + //IMPOSTO DE RENDA
  {129-136}   Bib.FormataTexto(' ',8);

    {273}     wstrAux := wstrAux + ValoresIpi( QExpEscritaFiscalNSCFOP.AsInteger, Trim(QExpEscritaFiscalNSVAL_TOTAL_NOTA.Text) ) +
              Bib.StrZero('0',48)  +
    {369}     Bib.StrZero('0',52) +
    {421}     Bib.FormataTexto( ' ',50);
            End
            Else
            Begin
  {069-128}   wstrNota := wstrNota + Bib.StrZero('0',60) +
  {129-136}   Bib.FormataTexto(' ',8) +
  {137-420}   RMaskCGC_CPF('0',284) +
    {421}     Bib.FormataTexto( 'NOTA FISCAL CANCELADA',50);
              wbooBase := false;
            End;

            //parte final do registro de notas apos os valores icms e demais (wstrAux)
            wstrAux := wstrAux + '     ';
    {476}   If(QExpEscritaFiscalNSIND_CONDICAO_PAGTO.Text = '1') OR (QExpEscritaFiscalNSIND_CONDICAO_PAGTO.Text = '3')Then
              wstrAux := wstrAux + 'S'
            Else
              wstrAux := wstrAux + 'N';
    {477}   wstrAux := wstrAux + Bib.StrZero('0',12);
    {489}   If(QExpEscritaFiscalNSVAL_FRETE.Value = 0)Then
              wstrAux := wstrAux + '0'
            Else
            If(QExpEscritaFiscalNSIND_TIPO_FRETE.Text = 'CIF')Then
              wstrAux := wstrAux + '1'
            Else
              wstrAux := wstrAux + '2';

  {490-525} wstrAux := wstrAux + RMaskCGC_CPF('0',36)+
  {526-533} FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value)+
  {534-594} Bib.FormataTexto(' ',61)+
            RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
            Inc(wContador);
//         End;
          //recebimento dos valores atuais para comparação com o proximo registro da SQL
          wintCodigo := QExpEscritaFiscalNSCOD_NOTA_CAB.Value;
          wintSituacao := QExpEscritaFiscalNSIND_SITUACAO.AsInteger;
          wstrCfop := QExpEscritaFiscalNSCFOP.Text;
          wfloBase := QExpEscritaFiscalNSVAL_ICM_BASE.Value;
          wfloPercAliq := QExpEscritaFiscalNSPERC_ALIQUOTA.Value;
          wfloVlrIcms := QExpEscritaFiscalNSVAL_ICM.Value;
          wintCodTributacao := QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger;
          //Apenas para setar variavel wbooBase
          wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
          ValoresIcms( wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
                       FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq),wstrVlrContabil );
          wintContBase := wintContBase - 1;
          wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
          If wfloVlrIsentas < 0 Then
             wfloVlrIsentas := 0;
          wstrItem := RetornaItens(wContador,wstrItem);
          Inc(wContador);
      End
      Else //Situação caso o item seja da mesma nota
      Begin
        If(wbooBase)Then //verifica se existe a necessidade de setar os valores das diferentes bases
        Begin
          If(wintCodTributacao <> QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger)Then
          Begin
            If(wintContBase <= 4)Then
            Begin
              wstrNota := wstrNota +  ValoresIcms( wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
                                                   FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq),wstrVlrContabil );
              wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
              wstrCfop := QExpEscritaFiscalNSCFOP.Text;
              wfloBase := QExpEscritaFiscalNSVAL_ICM_BASE.Value;
              wfloPercAliq := QExpEscritaFiscalNSPERC_ALIQUOTA.Value;
              wfloVlrIcms := QExpEscritaFiscalNSVAL_ICM.Value;
              wintCodTributacao := QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger;
              wintSituacao := QExpEscritaFiscalNSIND_SITUACAO.AsInteger;
              wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
              If wfloVlrIsentas < 0 Then
                 wfloVlrIsentas := 0;
              wstrItem := RetornaItens(wContador,wstrItem);
              Inc(wContador);
            End
          End
          Else //tributacao igual é necessario somar os valores de icms para uma mesma tributação
          Begin
            wstrCfop := QExpEscritaFiscalNSCFOP.Text;
            wfloBase := wfloBase + QExpEscritaFiscalNSVAL_ICM_BASE.Value;
            wfloPercAliq :=  QExpEscritaFiscalNSPERC_ALIQUOTA.Value;
            wfloVlrIcms := wfloVlrIcms + QExpEscritaFiscalNSVAL_ICM.Value;
            wintCodTributacao := QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger;
            wintSituacao := QExpEscritaFiscalNSIND_SITUACAO.AsInteger;
            ValoresIcms( wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
                         FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq),wstrVlrContabil );
            wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
            wintContBase := wintContBase - 1;
            wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
            If wfloVlrIsentas < 0 Then
               wfloVlrIsentas := 0;
            wstrItem := RetornaItens(wContador,wstrItem);
            Inc(wContador);
          End
        End
        Else //NF Cancelada
        Begin
          wstrItem := RetornaItens(wContador,wstrItem);
          Inc(wContador);
        End
      End;
    end; //fim do while
    //-----------------------REGISTRO TRAILLER--------------------------------\\
//      If(wbooBase)Then
//        wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
        wstrNota := wstrNota +  ValoresIcms( wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
                                             FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq),wstrVlrContabil );
      S := S + RetornaNotas(wstrNota) + wstrAux + wstrItem + '3'                                                                          +
{2}   IntDecimais(QExpEscritaFiscalNSVAL_TOTAL.Text,12,2)                              +
{14}  Bib.StrZero('0',48)  +
{62}  IntDecimais(QExpEscritaFiscalNSVAL_ICM_BASE.Text,12,2)                           +
{74}  IntDecimais(QExpEscritaFiscalNSVAL_ICM.Text,12,2)                               +
{86}  Bib.StrZero('0',72)  +
{158} IntDecimais( FloatToStr(QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value),12,2) +
{170} Bib.StrZero('0',156)  +
{326} Bib.FormataTexto(' ',169) +
      RMaskCGC_CPF(IntToStr(wContador),6) + Chr(13)+Chr(10);
      QExpEscritaFiscalNS.Close;
  end;
  wstrCGC := '-' + Copy(MeExpEscritaFiscalNSDtInicio.Text,1,2) +
             Copy(MeExpEscritaFiscalNSDtInicio.Text,4,2) +
             Copy(MeExpEscritaFiscalNSDtInicio.Text,9,2) + '-' +
             Copy(MeExpEscritaFiscalNSDtFim.Text,1,2) +
             Copy(MeExpEscritaFiscalNSDtFim.Text,4,2) +
             Copy(MeExpEscritaFiscalNSDtFim.Text,9,2);
  SaveDialog.FileName := 'NOTASAI'+ wstrCGC +'.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    Label35.Caption := IntToStr(wContador);
  end
  else
  Begin
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
    Label35.Caption := '0';
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BtnEFProdutosClick(Sender: TObject);
var
  S: String;
  F: TextFile;
  wContador: integer;
begin
  wContador := 1; // Inicializa valor da variavel de contagem.
  S:= '';  // Inicializa valor da variavel.
  LbEFProdutos.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalProdutos.Close;
    If( Trim(MeCodInicialEFProdutos.Text) <> '' )Then
      QExpEscritaFiscalProdutos.SetVariable('COD_INICIAL', Trim(MeCodInicialEFProdutos.Text) )
    Else
      QExpEscritaFiscalProdutos.SetVariable('COD_INICIAL', 0 );

    If( Trim(MeCodFinalEFProdutos.Text) <> '' )Then
      QExpEscritaFiscalProdutos.SetVariable('COD_FINAL', Trim(MeCodFinalEFProdutos.Text) )
    Else
      QExpEscritaFiscalProdutos.SetVariable('COD_FINAL', 999999999 );
    QExpEscritaFiscalProdutos.Open;
    PB.Max := QExpEscritaFiscalProdutos.RecordCount;
    QExpEscritaFiscalProdutos.First;
    while not QExpEscritaFiscalProdutos.Eof do
    begin
      S:= S                                                                          +
        RMaskCGC_CPF( Trim(QExpEscritaFiscalProdutosCOD_PRODUTO.Text),10 )           +
        Bib.FormataTexto( Trim(QExpEscritaFiscalProdutosDESC_PRODUTO.Text) ,40)      +
        Bib.StrZero( '0',8 )                                                        +
        Bib.FormataTexto( Trim(QExpEscritaFiscalProdutosDESC_UNIDADE.Text) ,4)       +
        IntDecimais( Trim(QExpEscritaFiscalProdutosNUM_EMBALAGEM.Text),9,3 )         +
        Bib.FormataTexto( ' ',23)                                                    +
        RMaskCGC_CPF( IntToStr(wContador),6 )                                        +
        Chr(13)+Chr(10);
      Inc(wContador);
      PB.Position := wContador;
      QExpEscritaFiscalProdutos.Next;
    end;
  end;
  SaveDialog.FileName := 'ITEM.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    LbEFProdutos.Caption := IntToStr(wContador-1);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  PB.Position := 0;
end;

procedure TFImportaDados.BtnExpContaReceberClick(Sender: TObject);
var
  wstrS,wstrDtInicial, wstrDtFinal, wstrAux   : String;
  F                                           : TextFile;
  wintContador                                : integer;
begin
  wintContador := 2; // Inicializa valor da variavel de contagem.
  wstrS:= '';  // Inicializa valor da variavel.
  LbExpContaReceberTotal.Caption := '';

  with DMImportaDados do
  begin
    QExpContaReceber.Close;
    If( Trim(MeExpContaReceberFilial.Text)<>'' )Then
      QExpContaReceber.SetVariable(':FILIAL',Trim(MeExpContaReceberFilial.Text) )
    Else
      QExpContaReceber.SetVariable(':FILIAL',null );

    If( Trim(MeExpContaReceberEmissaoInicial.Text)<>'' )Then
      wstrDtInicial := Trim(MeExpContaReceberEmissaoInicial.Text)
    Else
      wstrDtInicial := '01/01/1900';
      StrToDate(wstrDtInicial);
    QExpContaReceber.SetVariable('DT_EMISSAO_INICIAL',StrToDate(wstrDtInicial));

    If( Trim(MeExpContaReceberEmissaoFinal.Text)<>'' )Then
      wstrDtFinal := Trim(MeExpContaReceberEmissaoFinal.Text)
    Else
      wstrDtFinal := '12/12/2030';
    QExpContaReceber.SetVariable('DT_EMISSAO_FINAL',StrToDate(wstrDtFinal));

    If( Trim(MeExpContaReceberVencimentoInicial.Text)<>'' )Then
      QExpContaReceber.SetVariable( 'DT_VENCIMENTO_INICIAL',Trim(MeExpContaReceberVencimentoInicial.Text) )
    Else
      QExpContaReceber.SetVariable( 'DT_VENCIMENTO_INICIAL',wstrDtInicial );

    If( Trim(MeExpContaReceberVencimentoFinal.Text)<>'' )Then
      QExpContaReceber.SetVariable( 'DT_VENCIMENTO_FINAL',Trim(MeExpContaReceberVencimentoFinal.Text) )
    Else
      QExpContaReceber.SetVariable( 'DT_VENCIMENTO_FINAL','12/12/2030' );
    QExpContaReceber.Open;
    PB.Max := QExpContaReceber.RecordCount;

    If(QExpContaReceber.RecordCount=0)Then
      raise Exception.Create('Não existem registros a serem gerados com os parâmetros informados! ');

    //REGISTRO HEADER
    wstrS := '11CR-EXP'                                                        +
             Bib.FormataTexto( ' ',505 )                                       +
             '000001' + Chr(13)+Chr(10);

    //REGISTRO DETALHE
    QExpContaReceber.First;
    while not QExpContaReceber.Eof do
    begin
      wstrS := wstrS + '2'                                                      +
               Bib.FormataTexto( QExpContaReceberCOD_CONTA_RECEBER_CAB.Text,6 )     +
               Bib.FormataTexto( QExpContaReceberCOD_FINALIDADE.Text,6 )            +
               Bib.FormataTexto( QExpContaReceberCOD_BANCO_AGENCIA.Text,7 )         +
               Bib.FormataTexto( QExpContaReceberCOD_FILIAL.Text,6 )                +
               RMaskCGC_CPF( QExpContaReceberNUM_TITULO.Text,6 )                +
               RMaskCGC_CPF( QExpContaReceberNUM_PARCELA.Text,3 )               +
               Bib.FormataTexto( QExpContaReceberDESC_TIPO_DOCUMENTO.Text,3 )   +
               Bib.FormataTexto( QExpContaReceberDT_MOVIMENTO.Text,10 )              +
               Bib.FormataTexto( QExpContaReceberDT_BAIXA.Text,10 )                  +
               Bib.FormataTexto( QExpContaReceberDT_VENCIMENTO.Text,10 )             +
               Bib.FormataTexto( QExpContaReceberDT_EMISSAO.Text,10 )                +
               Bib.FormataTexto( QExpContaReceberDT_CAPITALIZACAO.Text,10 )          +
               IntDecimais( QExpContaReceberVAL_TITULO.Text,11,2 )              +
               IntDecimais( QExpContaReceberVAL_NEGOCIO.Text,11,2 )             +
               Bib.FormataTexto( QExpContaReceberIND_ACEITE.Text,3 )            +
               Bib.FormataTexto( QExpContaReceberIND_SITUACAO.Text,13 )         +
               Bib.FormataTexto( QExpContaReceberDESC_OBSERVACAO.Text,50 )      +
               Bib.FormataTexto( QExpContaReceberCOD_NOTA_CAB.Text,6 )              +
               Bib.FormataTexto( QExpContaReceberCOD_CADASTRO.Text,6 )              +
               IntDecimais( QExpContaReceberVAL_ORIGINAL.Text,11,2 )            +
               Bib.FormataTexto( QExpContaReceberCOD_NOSSO_NUMERO.Text,15 )     +
               IntDecimais( QExpContaReceberVAL_JUROS.Text,11,2 )               +
               Bib.FormataTexto( QExpContaReceberCOD_DEPARTAMENTO.Text,6 )          +
               Bib.FormataTexto( QExpContaReceberCOD_CONTRATO_VEND.Text,6 )         +
               Bib.FormataTexto( QExpContaReceberDESC_AVALISTA1.Text,40 )       +
               Bib.FormataTexto( QExpContaReceberDESC_AVALISTA2.Text,40 )       +
               Bib.FormataTexto( QExpContaReceberCOD_VENDEDOR.Text,6 )              +
               IntDecimais( QExpContaReceberPERC_COMISSAO.Text,5,3 )            +
               Bib.FormataTexto( QExpContaReceberDT_CAPITALIZACAO_MOEDA.Text,10 )    +
               IntDecimais( QExpContaReceberVAL_PROMISSORIA.Text,11,2 )         +
               Bib.FormataTexto( QExpContaReceberIND_ENVIADO_BANCO.Text,3 )     +
               Bib.FormataTexto( QExpContaReceberCOD_CONTA_CORRENTE.Text,6 )        +
               Bib.FormataTexto( QExpContaReceberCOD_ORDEM_COMPRA_CAB.Text,6 )      +

               //TB_CONTA_RECEBER_MOV
               Bib.FormataTexto( QExpContaReceberCOD_CONTA_RECEBER_MOV.Text,6 ) +
               Bib.FormataTexto( QExpContaReceberCOD_CONTA_RECEBER_CAB_1.Text,6 ) +
               Bib.FormataTexto( QExpContaReceberDT_MOVIMENTO_1.Text,10 )         +
               IntDecimais( QExpContaReceberVAL_MOVIMENTO.Text,11,2 )             +
               Bib.FormataTexto( QExpContaReceberDESC_OBSERVACAO_1.Text,50 ) +
               Bib.FormataTexto( QExpContaReceberCOD_USUARIO.Text,6 )             +
               Bib.FormataTexto( QExpContaReceberDT_USUARIO.Text,10 )             +
               Bib.FormataTexto( QExpContaReceberIND_TIPO_MOVIMENTO.Text,20 )     +
               Bib.FormataTexto( QExpContaReceberCOD_BCO_MOVIMENTO.Text,6 )       +
               Bib.FormataTexto( QExpContaReceberCOD_CAIXA_MOV.Text,6 )           +
               Bib.FormataTexto( QExpContaReceberCOD_LANCTO_CONTABIL_CRED.Text,6 )+
               Bib.FormataTexto( QExpContaReceberCOD_LANCTO_CONTABIL_DEB.Text,6 ) +
               Bib.FormataTexto( QExpContaReceberCOD_NOTA_CAB_1.Text,6 )          +
               RMaskCGC_CPF( IntToStr(wintContador),6 ) + Chr(13) + Chr(10);
      Inc(wintContador);
      PB.Position := wintContador;
      QExpContaReceber.Next;
    end;

    //REGISTRO TRAILER
    wstrS := wstrS + '3'                                                        +
             Bib.FormataTexto( ' ',512 )                                        +
             RMaskCGC_CPF( IntToStr(wintContador),6 ) + Chr(13) + Chr(10);
  end;
  wstrAux := 'EXPCR-'+Copy(wstrDtInicial,1,2)+Copy(wstrDtInicial,4,2)+Copy(wstrDtInicial,9,2)+
                         '-'+Copy(wstrDtFinal,1,2)+Copy(wstrDtFinal,4,2)+Copy(wstrDtFinal,9,2)+'.TXT';
  SaveDialog.FileName := wstrAux;
  SaveDialog.Filter := 'Arquivo de exportação de contas a receber';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName );
    Rewrite(F);
    Writeln(F, wstrS);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    LbExpContaReceberTotal.Caption := IntToStr(wintContador-2);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);
  PB.Position := 0;
end;


procedure TFImportaDados.BtnImpContaReceberClick(Sender: TObject);
Var
   F                                        : TextFile;
   wstrS                                    : String;
   wintContador, wintCRCOriginal, wintCRC   : Integer;
begin
  wstrS:= '';  // Inicializa valor da variavel.
  wintContador := 0;
  wintCRC := 0;
  wintCRCOriginal := 0;
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,wstrS);                           {Le a linha do arquivo texto}
    If(Copy(wstrS,3,6) <> 'CR-EXP')Then
    Begin
      Raise Exception.Create('Este não é o arquivo de Contas a Receber!');
    End;
    Readln(F,wstrS);
    DMImportaDados.QImpContaReceberCab.Close;
    DMImportaDados.QImpContaReceberCab.Open;
    DMImportaDados.QImpContaReceberMov.Close;
    DMImportaDados.QImpContaReceberMov.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while(Copy(wstrS,1,1) = '2')do
      Begin
        If( wintCRCOriginal <> StrToInt(Trim(Copy(wstrS,2,6))) )Then
        Begin
          DMImportaDados.QImpContaReceberCab.Insert;
          DMImportaDados.QImpContaReceberCabCOD_FINALIDADE.Text := Trim( Copy(wstrS,8,6) );
          DMImportaDados.QImpContaReceberCabCOD_BANCO_AGENCIA.Text := Trim( Copy(wstrS,14,7) );
          DMImportaDados.QImpContaReceberCabCOD_FILIAL.Text := '2';
//          DMImportaDados.QImpContaReceberCabCOD_FILIAL.Text := Trim( Copy(wstrS,21,6) );
          DMImportaDados.QImpContaReceberCabNUM_TITULO.Text := Trim( Copy(wstrS,27,6) );
          DMImportaDados.QImpContaReceberCabNUM_PARCELA.Text := Trim( Copy(wstrS,33,3) );
          DMImportaDados.QImpContaReceberCabDESC_TIPO_DOCUMENTO.Text := Trim( Copy(wstrS,36,3) );
          DMImportaDados.QImpContaReceberCabDT_MOVIMENTO.Text := Trim( Copy(wstrS,39,10) );
          DMImportaDados.QImpContaReceberCabDT_BAIXA.Text := Trim( Copy(wstrS,49,10) );
          DMImportaDados.QImpContaReceberCabDT_VENCIMENTO.Text := Trim( Copy(wstrS,59,10) );
          DMImportaDados.QImpContaReceberCabDT_EMISSAO.Text := Trim( Copy(wstrS,69,10) );
          DMImportaDados.QImpContaReceberCabDT_CAPITALIZACAO.Text := Trim( Copy(wstrS,79,10) );
          DMImportaDados.QImpContaReceberCabVAL_TITULO.AsFloat := StrToFloat(Trim(Copy(wstrS,89,11)))/100;
          DMImportaDados.QImpContaReceberCabVAL_NEGOCIO.AsFloat := StrToFloat(Trim(Copy(wstrS,100,11)))/100;
          DMImportaDados.QImpContaReceberCabIND_ACEITE.Text := Trim( Copy(wstrS,111,3) );
          DMImportaDados.QImpContaReceberCabIND_SITUACAO.Text := Trim( Copy(wstrS,114,13) );
          DMImportaDados.QImpContaReceberCabDESC_OBSERVACAO.Text := Trim( Copy(wstrS,127,50) );
          //DMImportaDados.QImpContaReceberCabCOD_NOTA_CAB.Text := Trim( Copy(wstrS,177,6) );
          DMImportaDados.QImpContaReceberCabCOD_CADASTRO.Text := Trim( Copy(wstrS,183,6) );
          DMImportaDados.QImpContaReceberCabVAL_ORIGINAL.AsFloat := StrToFloat(Trim(Copy(wstrS,189,11)))/100;
          DMImportaDados.QImpContaReceberCabCOD_NOSSO_NUMERO.Text := Trim( Copy(wstrS,200,15) );
          DMImportaDados.QImpContaReceberCabVAL_JUROS.AsFloat := StrToFloat(Trim(Copy(wstrS,215,11)))/100;
          DMImportaDados.QImpContaReceberCabCOD_DEPARTAMENTO.Text := Trim( Copy(wstrS,226,6) );
          //DMImportaDados.QImpContaReceberCabCOD_CONTRATO_VEND.Text := Trim( Copy(wstrS,232,6) );
          DMImportaDados.QImpContaReceberCabDESC_AVALISTA1.Text := Trim( Copy(wstrS,238,40) );
          DMImportaDados.QImpContaReceberCabDESC_AVALISTA2.Text := Trim( Copy(wstrS,278,40) );
          DMImportaDados.QImpContaReceberCabCOD_VENDEDOR.Text := Trim( Copy(wstrS,318,6) );
          DMImportaDados.QImpContaReceberCabPERC_COMISSAO.Text := Trim( Copy(wstrS,324,5) );
          DMImportaDados.QImpContaReceberCabDT_CAPITALIZACAO_MOEDA.Text := Trim( Copy(wstrS,329,10) );
          DMImportaDados.QImpContaReceberCabVAL_PROMISSORIA.AsFloat := StrToFloat(Trim(Copy(wstrS,339,11)))/100;
          DMImportaDados.QImpContaReceberCabIND_ENVIADO_BANCO.Text := Trim( Copy(wstrS,350,3) );
          DMImportaDados.QImpContaReceberCabCOD_CONTA_CORRENTE.Text := Trim( Copy(wstrS,353,6) );
          //DMImportaDados.QImpContaReceberCabCOD_ORDEM_COMPRA_CAB.Text := Trim( Copy(wstrS,359,6) );
          DMImportaDados.QImpContaReceberCab.Post;
          wintCRC := DMImportaDados.QImpContaReceberCabCOD_CONTA_RECEBER_CAB.Value;
          wintCRCOriginal := StrToInt(Trim(Copy(wstrS,2,6)));
        End;

        DMImportaDados.QImpContaReceberMov.Insert;
        DMImportaDados.QImpContaReceberMovCOD_CONTA_RECEBER_CAB.Value := wintCRC;
        DMImportaDados.QImpContaReceberMovDT_MOVIMENTO.Text := Trim( Copy(wstrS,377,10) );
        DMImportaDados.QImpContaReceberMovVAL_MOVIMENTO.AsFloat := StrToFloat(Trim(Copy(wstrS,387,11)))/100;
        DMImportaDados.QImpContaReceberMovDESC_OBSERVACAO.Text := Trim( Copy(wstrS,398,50) );
        DMImportaDados.QImpContaReceberMovCOD_USUARIO.Text := Trim( Copy(wstrS,448,6) );
        DMImportaDados.QImpContaReceberMovDT_USUARIO.Text := Trim( Copy(wstrS,454,10) );
        DMImportaDados.QImpContaReceberMovIND_TIPO_MOVIMENTO.Text := Trim( Copy(wstrS,464,20) );
        //DMImportaDados.QImpContaReceberMovCOD_BCO_MOVIMENTO.Text := Trim( Copy(wstrS,484,6) );
        //DMImportaDados.QImpContaReceberMovCOD_CAIXA_MOV.Text := Trim( Copy(wstrS,490,6) );
        //DMImportaDados.QImpContaReceberMovCOD_LANCTO_CONTABIL_CRED.Text := Trim( Copy(wstrS,496,6) );
        //DMImportaDados.QImpContaReceberMovCOD_LANCTO_CONTABIL_DEB.Text := Trim( Copy(wstrS,502,6) );
        //DMImportaDados.QImpContaReceberMovCOD_NOTA_CAB.Text := Trim( Copy(wstrS,508,6) );
        DMImportaDados.QImpContaReceberMov.Post;

        Inc(wintContador);
        Readln(F,wstrS);
      end;
      dmoracle.dbcemapa.commit;
    except
      DMImportaDados.QImpContaReceberCab.cancel;
      dmoracle.dbcemapa.rollback;
      MessageDlg('Erro na importação dos registro, linha nº ' + IntToStr(wintContador), mtError, [mbOk], 0);
      raise;// exception.create('Erro nos dados a serem importados');
    end;
  end;
  DMImportaDados.QImpContaReceberCab.Close;
  LbImpContaReceberTotal.Caption:=IntToStr(wintContador);
end;

procedure TFImportaDados.MEExpEscritaFiscalCliVendedorExit(Sender: TObject);
begin
  if Trim(MEExpEscritaFiscalCliVendedor.Text) = '' then
    EdExpEscritaFiscalCliVendedor.Text:='Todos'
  else
    EdExpEscritaFiscalCliVendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(MeExpEscritaFiscalCliVendedor.Text));
end;

procedure TFImportaDados.BtExpEscritaFiscalCliVendedorVendedorClick(
  Sender: TObject);
begin
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  begin
    MEExpEscritaFiscalCliVendedor.Text := IntToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
    MEExpEscritaFiscalCliVendedorExit(Self);
  end;
end;

procedure TFImportaDados.BitBtn10Click(Sender: TObject);
var
   wVirgula, wAux, wArqCommobile, wSeparador: String;
   wCount : Integer;
   F : TextFile;
begin
  {OpenDialog1.Execute;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';}
  wAux     := '';
  wVirgula := '';
  wSeparador := ';';


  with DMImportaDados do
   Begin
       QExportaEmbarqueCommobile.Close;
       for wCount := 0 to Lb39CodEmbarque.Items.Count -1 do
       Begin
          wAux := wAux + wVirgula + Lb39CodEmbarque.Items.Strings[wCount];
          wVirgula := ',';
       End;
       QExportaEmbarqueCommobile.SetVariable('LISTA_EMBARQUE',wAux);
       QExportaEmbarqueCommobile.Open;
       QExportaEmbarqueCommobile.First;

       SaveDialog.FileName := 'EmbarqueCommobile';
       SaveDialog.Filter := 'Arquivo de Embarques';
       SaveDialog.DefaultExt := 'Txt';
       SaveDialog.FilterIndex := 0;
       if FImportaDados.SaveDialog.Execute then
        begin
         AssignFile(F, FImportaDados.SaveDialog.FileName );
         Rewrite(F);

         while not QExportaEmbarqueCommobile.Eof do
         Begin
           wArqCommobile := '';
           if Length(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString) > 4 then
             wArqCommobile := copy(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString, length(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString)-3,4)
           else
             RMaskCGC_CPF(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString,4);
           wArqCommobile := wArqCommobile + wSeparador;
           wArqCommobile := wArqCommobile +
             RMaskCGC_CPF(QExportaEmbarqueCommobileNUM_SEQUENCIAL.AsString, 6) + wSeparador +
             'ENTREGA' + wSeparador +
             RMaskCGC_CPF(DeletaChar(DeletaChar(QExportaEmbarqueCommobileQT_VOLUME.AsString,','),'.'),15) + wSeparador +
             RMaskCGC_CPF(DeletaChar(DeletaChar(QExportaEmbarqueCommobileQT_PESO.AsString,','),'.'),15) + wSeparador +
             QExportaEmbarqueCommobileDT_EMBARQUE.AsString + wSeparador +
             bib.FormataTexto(QExportaEmbarqueCommobileNOME.AsString, 50) + wSeparador +
             DeletaChar(QExportaEmbarqueCommobileDESC_CEP.AsString,'-') + wSeparador +
             bib.FormataTexto(QExportaEmbarqueCommobileDESC_CIDADE.AsString, 50) + wSeparador +
             QExportaEmbarqueCommobileCOD_ESTADO.AsString + wSeparador +
             'BR' + wSeparador +
             bib.FormataTexto(QExportaEmbarqueCommobileDESC_ENDERECO.AsString, 50) + wSeparador +
             '00000' + wSeparador +
             bib.FormataTexto(QExportaEmbarqueCommobileDESC_BAIRRO.AsString, 50) + wSeparador +
             bib.FormataTexto('', 50) + wSeparador +  //REFERÊNCIA
             bib.FormataTexto(QExportaEmbarqueCommobileNOME_CONTATO.AsString, 50) + wSeparador +
             bib.FormataTexto(QExportaEmbarqueCommobileDESC_TELEFONE.AsString, 15) + wSeparador;

           Writeln(F, wArqCommobile);
           QExportaEmbarqueCommobile.Next;
         End;

         CloseFile(F);
         MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
         Lb39CodEmbarque.Clear();
        End
       Else
         MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
   End;
end;

procedure TFImportaDados.BitBtn13Click(Sender: TObject);
var
   F          : TextFile;
   S,wComando : String;
   wContador  :Integer;
   wAux : string;
begin
  S:= '';  // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_PRACA';
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    End;

    if OpenDialog1.Execute then
    begin
//    lbcaminho.caption:=OpenDialog1.Files.Text;
      AssignFile(F, OpenDialog1.FileName);   //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F,S);
      Readln(F,S);
    end;
    DMImportaDados.QImpPraca.Open;
    while not((copy(S,1,1)='')or(copy(S,33,2)='  ')or(copy(S,35,1)=' ')) do
    begin
      DMImportaDados.QImpPraca.Insert;
      DMImportaDados.QImpPracaCod_Praca.Value:=copy(S,3,5);
      DMImportaDados.QImpPracaDesc_Cidade.Value:=copy(S,8,23);
      DMImportaDados.QImpPracaDesc_Sigla.Value:=copy(S,33,2);
      DMImportaDados.QImpPracaInd_Situacao.Value:=copy(S,35,1);
      DMImportaDados.QImpPraca.Post;
      inc(wContador);
      Readln(F,S);
    end;
    DMImportaDados.QImpPraca.Close;
    LBContador.Caption:='Total de Praças importadas: '+IntToStr(wContador);
    LBContador.Refresh;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end; 
end;
procedure TFImportaDados.BitBtn15Click(Sender: TObject);
Var
   F                                         : TextFile;
   wstrS                                     : String;
   wintContador, i                           : Integer;  // wintCRCOriginal, wintCRC
   wIndInserir : boolean;

   //variaveis q receberam os valores convertidos
   wCodFilial     : integer;
   wDtLancamento  : TDate;
   wIndOperacao   : string;
   wCodDebito     : integer;
   wCodCredito    : integer;
   wCodPlanoConta : integer;
   wValLancamento : real;
   wValor         : real;
   wCodHistCont   : integer;
   wDescComp      : string;
   wVal           : string;
   wContraPartida : string;

   //formato das linhas do arquivo
   //000|0000000|00000|00000|000000000000.00|000|"00000000000000000000000000000000000000000000000000"
   //se tiver valor para debito e credito inserir dois registros no banco
   //o credito deve ter o valor negativo.
   //fabiano: 08/10/2004.
begin
  wstrS:= '';  // Inicializa valor da variavel.
  wintContador := 0;
//  wintCRC := 0;
//  wintCRCOriginal := 0;
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,wstrS);                           {Le a linha do arquivo texto}
    DMImportaDados.QImpLanctoContabil.Close;
    DMImportaDados.QImpLanctoContabil.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while(Trim(wstrS) <> '')do
      begin
        wVal := trim(copy(wstrS,1,3));
        If Trim(MeFilialFolha.Text) <> '' Then
           wCodFilial := StrToInt(Trim(MeFilialFolha.Text))
        Else
           wCodFilial := strtoint(wVal);

        wVal := Trim(copy(wstrS,5,6));
        wVal := copy(wVal,1,2) + '/' + copy(wVal,3,2) + '/' + copy(wVal,5,2);
        wDtLancamento := StrToDate(wVal);

        wVal := '0' + trim(copy(wstrS,12,5));
        if trim(wVal) <> '0' then
          wVal := '0' + DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + trim(wVal));
        wCodDebito := StrToInt(wVal);

        wVal := '0' + trim(copy(wstrS,18,5));
        if trim(wVal) <> '0' then
          wVal := '0' + DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = ' + trim(wVal));
        wCodCredito := StrToInt(wVal);
        wVal := trim(copy(wstrS,24,12)) + ',' + trim(copy(wstrS,37,2));
        wValLancamento := StrToFloat(wVal);
        wval := trim(copy(wstrS, 101,4));
        wCodHistCont := StrToInt(wval);
        wIndInserir := True;
        wDescComp := Trim(copy(wStrS,45,50));
        wCodPlanoConta := 0;
        wValor := 0;
        for i := 1 to 2 do //esse FOR é para incluir um registro para o débito e um para o credito
        begin
          if i = 1 then //debito
          begin
            wIndOperacao   := 'D';
            wValor         := wValLancamento;
            wIndInserir    := (wCodDebito <> 0); //só inclui se tem conta debito
            wCodPlanoConta := wCodDebito;
            wContraPartida := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = ' + Trim(IntToStr(wCodCredito)));
          end;

          if i = 2 then  //credito
          begin
            wIndOperacao   := 'C';
            wValor         := -wValLancamento;
            wIndInserir    := (wCodCredito <> 0);//só inclui se tem conta credito
            wCodPlanoConta := wCodCredito;
            wContraPartida := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = ' + Trim(IntToStr(wCodDebito)));
          end;

          if wIndInserir then
          begin
            DMImportaDados.QImpLanctoContabil.Insert;
            DMImportaDados.QImpLanctoContabilCOD_FILIAL.Value             := wCodFilial;
            DMImportaDados.QImpLanctoContabilDT_LANCAMENTO.Value          := wDtLancamento;
            DMImportaDados.QImpLanctoContabilIND_OPERACAO.Value           := wIndOperacao;
            DMImportaDados.QImpLanctoContabilCOD_PLANO_CONTA.Value        := wCodPlanoConta;
            DMImportaDados.QImpLanctoContabilVAL_LANCAMENTO.Value         := wValor;
            DMImportaDados.QImpLanctoContabilCOD_HISTORICO_CONTABIL.Value := wCodHistCont;
            DMImportaDados.QImpLanctoContabilDESC_COMPLEMENTO.Value       := wDescComp;
            DMImportaDados.QImpLanctoContabilNUM_CONTRAPARTIDA.Value      := wContraPartida;
            DMImportaDados.QImpLanctoContabil.Post;
          end;
        end;

        Readln(F,wstrS);
        Inc(wintContador);
      end;
      DMOracle.DBCemapa.Commit;
      lbContaFolhaPG.Caption := inttostr(wintContador);
      MessageDlg('Importação efetuada com sucesso.',mtInformation,[mbok],0);
    except
      DMImportaDados.QImpLanctoContabil.cancel;
      dmoracle.dbcemapa.rollback;
      MessageDlg('Erro na importação dos registro, linha nº ' + IntToStr(wintContador), mtError, [mbOk], 0);
      raise;    // exception.create('Erro nos dados a serem importados');
    end;
  end;
end;

procedure TFImportaDados.BtComplementoCadastroClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  // para carregar tabela de grupos
  // ate aqui
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TCacom.Open;
    QCadastroCompl.Open;
    DMOracle.DBCemapa.StartTransaction;
    TCacom.First;
    PB.Max := TCacom.RecordCount;
    wCont := 0;
    While not TCacom.Eof do
    Begin
      Try
        QCadastroCompl.Close;
        QCadastroCompl.SetVariable('Pk',TCacomCodCli.Value);
        QCadastroCompl.Open;
        If not QCadastroCompl.Eof Then
        Begin
           QCadastroCompl.Edit;
           QCadastroComplNome_Pai.Value := TCacomPaiFam.Value;
           QCadastroComplNome_Mae.Value := TCacomMaeFam.Value;
           QCadastroComplDesc_Funcao.Value := TCacomDadoProf.Value;
           QCadastroComplDesc_Empresa.Value := TCacomDadoEmp.Value;
           QCadastroComplNome_Conjuge.Value := TCacomConNome.Value;
           QCadastroComplDesc_Profissao_Conjuge.Value := TCacomConProf.Value;
           QCadastroComplDesc_Empresa_Conjuge.Value := TCacomConEmpr.Value;

           QCadastroComplDt_Nascimento_Conjuge.Text := TCacomConNasc.Text;
           QCadastroComplDesc_Identidade_Conjuge.Value := TCacomConIdent.Value;
           QCadastroComplDesc_Ref_Comercial1.Value := TCacomEmpresa1.Value;
           QCadastroComplDesc_Ref_Comercial2.Value := TCacomEmpresa2.Value;
           QCadastroComplDesc_Obs.Value := TCacomObserv1.Value;
           QCadastroComplDesc_Obs1.Value := TCacomObserv2.Value;
           QCadastroComplDesc_Obs2.Value := TCacomObserv3.Value;
           QCadastroCompl.Post;
        End;
      Except
       If QCadastroCompl.State = DsEdit Then
         QCadastroCompl.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TCacom.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.percorreArquivoTexto;
var arq: TextFile;
    linha, wAux, wUF, wProduto, wCadastro,wValor,wVendedor,wPrazo,wPedido,wIncluso,wComissao, wPedido1 : String;
    Pedido :TStringList;
    I,J,K,wCont : integer;
    colunas : array[1..11] of string;
begin
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';
  if OpenDialog1.Execute then
    AssignFile(arq, OpenDialog1.FileName)      {Pega arquivo selecionado em dialogo box}
  Else
    Raise exception.Create('Informar o Arquivo para Importar');
//  AssignFile ( arq, 'c:\Pedidos.txt');
  Reset ( arq );
  Pedido:=TstringList.Create;
  wCont:= 0;
  DMImportaDados.QPedidoCabImporta.Close;
  DMImportaDados.QPedidoItemImporta.Close;
  DMImportaDados.QMateriaisImporta.Close;
  DMImportaDados.QPedidoCabImporta.Open;
  DMImportaDados.QPedidoItemImporta.Open;
  DMImportaDados.QMateriaisImporta.Open;
  while not Eof ( arq ) do
  begin
    ReadLn ( arq, linha );
    Pedido.Add(Linha);
  end;
  Try
    DMOracle.DBCemapa.StartTransaction;
  For I :=0 to Pedido.Count -1 do
  Begin
    linha:=Pedido.Strings[I];
    wAux := copy(linha,1,1);
    K:=1;
    colunas[1]:='';colunas[2]:='';colunas[3]:='';colunas[4]:='';colunas[5]:='';colunas[6]:='';
    colunas[7]:='';colunas[8]:='';colunas[9]:='';colunas[10]:='';
    
    for J :=0 to Length(linha) do
    Begin
      if linha[J] = ';' then
        K:= K + 1
      else
        colunas[K]:=colunas[K] + linha[J];
    end;
      If wAux = 'C' then
      Begin
        wIncluso := '';
        wPedido := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','NUM_PEDIDO = '+colunas[3]);
        wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+colunas[4]);
        wPedido1 := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','NUM_PEDIDO = '+colunas[3]);
        if ((wPedido = wCadastro) and (wPedido1 <> '')) then
        Begin
          wIncluso := 'SIM';
          Raise exception.Create('O pedido '+colunas[3]+' do cliente '+wCadastro+' ja foi importado!');
        end;
      end;

      If ((wAux = 'C') and (wIncluso = '')) then
      Begin
        if wCont <> 0 then
        Begin
          DMImportadados.QPedidoCabImporta.Post;
          DMImportadados.QPedidoItemImporta.Post;
        end;
        DMImportadados.QPedidoCabImporta.Insert;
        DMImportadados.QPedidoItemImporta.Insert;
        DMImportadados.QPedidoCabImportaNUM_PEDIDO.Value := StrToInt(colunas[3]);
        wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+colunas[4]);
        If Trim(wCadastro) = '' Then
           raise exception.Create('Cadastro Não relacionado '+ colunas[4]);
        DMImportadados.QPedidoCabImportaCOD_CADASTRO.Value := StrToInt(wCadastro);
        DMImportadados.QPedidoCabImportaCOD_FILIAL.Value := 1;
        DMImportadados.QPedidoCabImportaDT_EMISSAO.Value := StrToDate(colunas[7]);
        DMImportadados.QPedidoCabImportaDT_ENTREGA.Value := StrToDate(colunas[8]);
        DMImportadados.QPedidoCabImportaCOD_OPERACAO.Value := 17;
        DMImportadados.QPedidoCabImportaIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
        wPrazo := DMOracle.BuscaNome('SELECT COD_PRAZO_VENCIMENTO FROM TB_CADASTRO','COD_CADASTRO = '+wCadastro);
        If Trim(wPrazo) <> ''  Then
           DMImportadados.QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value := StrToInt(wPrazo)
        Else
           DMImportadados.QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value := 1;
        wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO','COD_CADASTRO = '+wCadastro);
        If wVendedor <> ''  Then
         Begin
           DMImportadados.QPedidoCabImportaCOD_VENDEDOR.Value := StrToInt(wVendedor);
           wComissao := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR','COD_VENDEDOR = '+wVendedor);
           If wComissao <> '' Then
              DMImportadados.QPedidoCabImportaPerc_Comissao.Value := StrToFloat(wComissao);
         End;
        DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value := colunas[6];
        DMImportadados.QPedidoItemImportaCOD_PEDIDO_CAB.Value := DMImportadados.QPedidoCabImportaCOD_PEDIDO_CAB.Value;
        wUF := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+colunas[4]);
        DMImportadados.QPedidoItemImportaCOD_TRIBUTACAO.Value := StrToInt(DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO = '+ CHR(39) + wUF +CHR(39)));
        wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39) + colunas[9] + CHR(39));
        if Trim(wProduto) = '' Then
           Raise exception.Create('Produto não relacionado '+colunas[9]);
        DMImportadados.QPedidoItemImportaCOD_PRODUTO.Value := StrToInt(wProduto);
        wValor := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR','COD_PRODUTO = '+ CHR(39) + wProduto + CHR(39)
                                                                          + 'AND COD_CADASTRO = '+ CHR(39) + wCadastro + CHR(39));
        If wValor = '' Then
           Raise exception.Create('Preço Não Cadastrado Produto/Cliente '+wProduto + '/'+wCadastro);
        DMImportadados.QPedidoItemImportaVAL_UNITARIO.Value := StrToFloat(wValor);
        DMImportadados.QPedidoItemImportaCOD_LOTE_TIPO.Value := 1;
      end;

      If ((wAux = 'O') and (wIncluso = '')) then
        DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value := DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value + ' '+colunas[2];//retirado 'obs: +

      If ((wAux = 'I') and (wIncluso = '')) then
      Begin
//        If (Trim(colunas[2]) = '') or (Trim(colunas[2]) = '0') Then
//           Raise exception.Create ('vai dar erro');
        DMImportadados.QMateriaisImporta.Insert;
        DMImportadados.QMateriaisImportaCOD_ITEM.Value := StrToInt(colunas[2]);
        DMImportadados.QMateriaisImportaCOD_PECA.Value := colunas[3];
        DMImportadados.QMateriaisImportaVAL_LARGURA.Value := StrToFloat(colunas[4]);
        DMImportadados.QMateriaisImportaVAL_ALTURA.Value := StrToFloat(colunas[5]);
        DMImportadados.QMateriaisImportaVAL_AREA.Value := StrToFloat(colunas[6]);
        DMImportadados.QMateriaisImportaVAL_AMOLADURA.Value := StrToInt(colunas[7]);
        DMImportadados.QMateriaisImportaIND_TIPO.Value := colunas[8];
        DMImportadados.QMateriaisImportaDESC_OBS_PECA.Value := colunas[9];
        DMImportadados.QMateriaisImportaCOD_PEDIDO.Value := DMImportaDados.QPedidoCabImportaCOD_PEDIDO_CAB.Value;
        DMImportadados.QMateriaisImporta.Post;
      end;

      If ((wAux = 'F') and (wIncluso = '')) then
      Begin
        DMImportadados.QPedidoItemImportaQT_PEDIDO.Value := StrToFloat(colunas[2]);
        DMImportadados.QPedidoItemImportaQT_ATENDIDO.Value := 0;
        DMImportadados.QPedidoItemImportaQT_CANCELADO.Value := 0;
        DMImportadados.QPedidoItemImportaPERC_DESCONTO.Value := 0;
        inc(wCont);
      end;

      If ((wAux = 'Q') and (wIncluso = '')) then
      Begin
        DMImportadados.QMateriaisImporta.Insert;
        DMImportadados.QMateriaisImportaCOD_PECA.Value := colunas[2];
        DMImportadados.QMateriaisImportaVAL_LARGURA.Value := StrToFloat(colunas[3]);
        DMImportadados.QMateriaisImportaVAL_ALTURA.Value := StrToFloat(colunas[4]);
        DMImportadados.QMateriaisImportaVAL_AREA.Value := StrToFloat(colunas[5]);
        DMImportadados.QMateriaisImportaVAL_AMOLADURA.Value := StrToInt(colunas[6]);
        DMImportadados.QMateriaisImportaIND_TIPO.Value := colunas[7];
        DMImportadados.QMateriaisImportaIND_REPOSICAO.Value := colunas[8];
        DMImportadados.QMateriaisImportaCOD_PEDIDO.Value := DMImportaDados.QPedidoCabImportaCOD_PEDIDO_CAB.Value;
        DMImportadados.QMateriaisImporta.Post;
      end;
  end;
    DMImportadados.QPedidoCabImporta.Post;
    DMImportadados.QPedidoItemImporta.Post;
    DmOracle.DBCemapa.Commit;
    ShowMessage('Importação de Pedidos Realizada com Sucesso!');
  Except
    DmOracle.DBCemapa.Rollback;
    raise;
  END;
  CloseFile ( arq );

end;

procedure TFImportaDados.SBImportaPedidoClick(Sender: TObject);
begin
  percorreArquivoTexto;
end;


procedure TFImportaDados.SpeedButton1Click(Sender: TObject);
var
   F          : TextFile;
   S,wComando : String;
   wContador  :Integer;
begin
  S:= '';  // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CEP_SAFRA';
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    End;

    if OpenDialog1.Execute then
    begin
//    lbcaminho.caption:=OpenDialog1.Files.Text;
      AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
      reset(F);
      Readln(F,S);
      Readln(F,S);
    end;
    DMImportaDados.QImp_CepSafra.Open;
    while not (copy(S,1,1)='') do
    begin
      DMImportaDados.QImp_CepSafra.Insert;
      DMImportaDados.QImp_CepSafraNUM_CEP_INICIAL.Value:=StrToInt(copy(S,1,8));
      DMImportaDados.QImp_CepSafraNUM_CEP_FINAL.Value:=StrToInt(copy(S,9,8));
      DMImportaDados.QImp_CepSafraDESC_AGENCIA.Value:=copy(S,25,30);
      DMImportaDados.QImp_CepSafraNUM_CEP_AGENCIA.Value:=StrToInt(copy(S,87,8));
      DMImportaDados.QImp_CepSafraCOD_AGENCIA.Value:=StrToInt(copy(S,95,5));
      DMImportaDados.QImp_CepSafraCOD_UF.Value:=copy(S,100,2);
      DMImportaDados.QImp_CepSafra.Post;
      inc(wContador);
      Readln(F,S);
    end;
    DMImportaDados.QImp_CepSafra.Close;
    LblContador.Caption:='Total de Praças importadas: '+IntToStr(wContador);
    LblContador.Refresh;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;

end;

procedure TFImportaDados.BtImportaCaixaClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TRdmov.Open;
    QCaixa_Mov.Open;
    DMOracle.DBCemapa.StartTransaction;
    TRdmov.First;
    PB.Max := TRdmov.RecordCount;
    wCont := 0;
    While not TRdmov.Eof do
    Begin
      Try
        QCaixa_Mov.Insert;
        QCaixa_MovCOD_FILIAL.Value := TRdmovCdEmpresa.Value;
        QCaixa_MovCOD_DEPARTAMENTO.Value := TRdmovCDDEPTO.Value;
        QCaixa_MovCOD_HISTORICO.Value := TRdmovIDTIPO.Value;
        QCaixa_MovDT_MOVIMENTO.Text := TRdmovDTMOVIM.Text;
        QCaixa_MovNUM_DOCUMENTO.Value := Trunc(TRdmovDOCUMENTO.Value);
        QCaixa_MovDT_USUARIO.Value := Date;
        QCaixa_MovCOD_USUARIO.Value := 1;
        QCaixa_MovVAL_MOVIMENTO.Value := TRdmovVLLANCTO.Value;
        QCaixa_MovDESC_COMPLEMENTO.Value := TRdmovNOCOMPLE.Value;
        QCaixa_MovDESC_COMPLEMENTO1.Value := TRdmovNOCOMPLE1.Value;
        QCaixa_Mov.Post;
      Except
       If QCaixa_Mov.State = dsInsert Then
         QCaixa_Mov.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TRdmov.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.Sb39FilialClick(Sender: TObject);
begin
     If FVendedorCons = Nil then
        FVendedorCons := TFVendedorCons.Create(Application);
        If FVendedorCons.ShowModal = mrOk then
        begin
             MEExpEscritaFiscalCliVendedor.Text := IntToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
             MEExpEscritaFiscalCliVendedorExit(Self);
        end;
end;

procedure TFImportaDados.Bt39AdicionarClick(Sender: TObject);
begin
  if Me39CodEmbarque.Text <> '' then
   Begin
     Lb39CodEmbarque.Items.Add(Me39CodEmbarque.Text);
     Me39CodEmbarque.Text := '';
     Me39CodEmbarque.SetFocus();
   End
  else
     ShowMessage('Informe Código Embarque');
end;

procedure TFImportaDados.Me39CodEmbarqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '13' then
     Bt39Adicionar.Click;
end;

procedure TFImportaDados.Bt39ExcluirClick(Sender: TObject);
begin
     Lb39CodEmbarque.Items.Delete(Lb39CodEmbarque.ItemIndex);
end;

procedure TFImportaDados.Bt39ExportarClick(Sender: TObject);
var
   wVirgula, wAux, wArqFilial, wQuebra: String;
   wQbEmbarque,wCodPedido,wCount : Integer;
   F : TextFile;
begin
   wAux     := '';
   wVirgula := '';
   wQbEmbarque := 0;

   with DMImportaDados do
   Begin
       QExportaEmbarque.Close;
       for wCount := 0 to Lb39CodEmbarque.Items.Count -1 do
       Begin
          wAux := wAux + wVirgula + Lb39CodEmbarque.Items.Strings[wCount];
          wVirgula := ',';
       End;
       QExportaEmbarque.SetVariable('LISTA_EMBARQUE',wAux);
       QExportaEmbarque.Open;
       QExportaEmbarque.First;

       while not QExportaEmbarque.Eof do
       Begin
         If wQbEmbarque <> 0 Then
          Begin
            wCodPedido := QExportaEmbarqueCod_Pedido_Cab.Value;
            QExportaEmbarque.Next; // AVANCA SOMENTE PARA VERIFICAR SE QUEBROU OU ULTIMO
            If QExportaEmbarque.Eof Then
               wQuebra := 'SIM'
            Else
              if wQbEmbarque <> QExportaEmbarqueCod_Embarque.Value then
                 wQuebra := 'SIM'
              else
                 wQuebra := 'NAO';
            QExportaEmbarque.Locate('COD_PEDIDO_CAB',wCodPedido,[]);
          End;
         If wQbEmbarque = 0 Then  // vai estar com zeros sempre que quebrar o embarque
          Begin
            wArqFilial := wArqFilial + 'INICIO;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
            LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
            QExportaEmbarqueCOD_ESTADO.Value+ ';'+'BR';
            wQbEmbarque := QExportaEmbarqueCod_Embarque.Value;
          End
         Else
           If wQuebra = 'SIM' Then
            Begin
              wArqFilial := wArqFilial + 'FIM;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
              LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
              QExportaEmbarqueCOD_ESTADO.Value + ';' + 'BR';
              wQbEmbarque := 0;
            End
           else
            Begin // NO LAYOUT NAO CONSTA NUMERO MAS COMO ESTAVAM INDICANDO ERRO NOS TESTES COLOQUEI UM PONTO E VIRGULA APOS O ENDERECO INDICANDO QUE NAO TEM NUMERO
              wArqFilial := wArqFilial + 'DESTINO;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
              LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
              QExportaEmbarqueCOD_ESTADO.Value + ';' + 'BR;' + formatDateTime('dd/mm/yyyy hh:mm',StrToDateTime(QExportaEmbarqueDT_EMBARQUE.Text));
            End;
         QExportaEmbarque.Next;
         If Not(QExportaEmbarque.Eof) Then
            wArqFilial := wArqFilial + Chr(13) + Chr(10);
       End;

      SaveDialog.FileName := 'Embarque';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
       begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqFilial);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb39CodEmbarque.Clear();
       End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
   End;
end;

Function TFImportaDados.LimpaCep(wCep : String) : String;
Var wRetorno : String;
    wCont : Integer;
Begin
  wRetorno := '';
  For wCont := 1 to Length(wCep) do
    If (Copy(wCep,wCont,1) >= '0') And (Copy(wCep,wCont,1) <= '9') Then
       wRetorno := wRetorno + Copy(wCep,wCont,1);
  Result := wRetorno;
End;

Function TFImportaDados.LimpaString(wString, wRetirar:String):String;
Var wCont, wCont2 : Integer;
    wRetorno  : String;
    wOk : Boolean;
Begin
  wRetorno := '';
  For wCont := 1 to Length(wString) do
  Begin
    wOk := True;
    For wCont2 := 1 to Length(wRetirar) do
    Begin
      If wString[wCont] = wRetirar[wCont2] then
        wOk := False;
    End;
    If wOk = True then
      wRetorno := wRetorno + wString[wCont];
  End;
  Result := wRetorno;
End;

procedure TFImportaDados.BtEmbarqueConsClick(Sender: TObject);
begin
  {If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
    Me39CodEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text; }
end;

procedure TFImportaDados.Action1Execute(Sender: TObject);
begin
  With DMOracle do
    Try
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := InputBox('Conexão', 'Entre com o nome de Serviço', 'ORCL');
      DBCemapa.Connected := True;
      //SetaUsuario;
    except
      MessageDlg('Não foi possível conectar com esta base de dados!'
               +#13+'Certifique-se que esta base existe em seu servidor',mtWarning,[mbOk],0);
    end;
end;

Function TFImportaDados.LimpaEndereco(wEndereco : String) : String;
Var wRetorno : String;
    wCont : Integer;
Begin
  wRetorno := '';
  For wCont := 1 to Length(wEndereco) do
    If not ((Copy(wEndereco,wCont,1) = ',') or (((Copy(wEndereco,wCont,1) >= '0') And (Copy(wEndereco,wCont,1) <= '9')))) Then
       wRetorno := wRetorno + Copy(wEndereco,wCont,1);
  Result := wRetorno;

End;
procedure TFImportaDados.BtMovBancoClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TMblct.Open;
    QBcoMovimento.Open;
    DMOracle.DBCemapa.StartTransaction;
    TMblct.First;
    PB.Max := TMblct.RecordCount;
    wCont := 0;
    While not TMblct.Eof do
    Begin
      Try
        QBcoMovimento.Insert;
        QBcoMovimentoCOD_USUARIO.Value := 1;
        If TMBLCTCDHISTOMB.Value = 2 Then
         QBcoMovimentoCOD_HISTORICO.Value := 31
        else
         If TMBLCTCDHISTOMB.Value = 3 Then
           QBcoMovimentoCOD_HISTORICO.Value := 30
          else
           If TMBLCTCDHISTOMB.Value = 4 Then
             QBcoMovimentoCOD_HISTORICO.Value := 69
          else
           If TMBLCTCDHISTOMB.Value = 11 Then
             QBcoMovimentoCOD_HISTORICO.Value := 33
           else
             If TMBLCTCDHISTOMB.Value = 12 Then
               QBcoMovimentoCOD_HISTORICO.Value := 34
             else
               QBcoMovimentoCOD_HISTORICO.Value := TMBLCTCDHISTOMB.Value;
        If TMBLCTNRCONCORRE.Value = '11777-0' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 19;
        If TMBLCTNRCONCORRE.Value = '11765-X' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 6;
        If TMBLCTNRCONCORRE.Value = '2039-0' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 17;
        If TMBLCTNRCONCORRE.Value = '6006-2' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 7;
        If TMBLCTNRCONCORRE.Value = '19262-7' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 15;
        If TMBLCTNRCONCORRE.Value = '49689-8' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 3;
        If TMBLCTNRCONCORRE.Value = '10868' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 11;
        If TMBLCTNRCONCORRE.Value = '5604-9' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 8;
        If TMBLCTNRCONCORRE.Value = '5734-7' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 9;
        If TMBLCTNRCONCORRE.Value = '3223-9' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 4;
        If TMBLCTNRCONCORRE.Value = '5750-9' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 5;
        If TMBLCTNRCONCORRE.Value = '5894-7' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 10;
        If TMBLCTNRCONCORRE.Value = '1' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 2;
        If TMBLCTNRCONCORRE.Value = '10913-4' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 14;
        If TMBLCTNRCONCORRE.Value = '5655-3' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 12;
        If TMBLCTNRCONCORRE.Value = '30588-0' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 16;
        If TMBLCTNRCONCORRE.Value = '25849-0' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 18;
        If TMBLCTNRCONCORRE.Value = '9329-7' Then
           QBcoMovimentoCOD_CONTA_CORRENTE.Value := 13;
        QBcoMovimentoNUM_CHEQUE.Text := TMBLCTNRDOCUMEN.Text;
        QBcoMovimentoDT_MOVIMENTO.Value := TMBLCTDTMOVIMEN.Value;
        QBcoMovimentoVAL_MOVIMENTO.Value := TMBLCTVLLANCTO.Value;
        QBcoMovimentoDESC_OBSERVACAO.Value :=  TMBLCTNOHISTORIC.Value;
        QBcoMovimentoDESC_COMPLEMENTO1.Value := TMBLCTDESCRICAO1.Value;
        QBcoMovimentoDESC_COMPLEMENTO2.Value := TMBLCTDESCRICAO2.Value;
        QBcoMovimentoDT_USUARIO.text := TMBLCTDTSISTEMA.Text;
        QBcoMovimentoNUM_NOTA.Text := TMBLCTNRNOTAFISC.Text;
        QBcoMovimentoCOD_SERIE.Value := TMBLCTSERIE.Value;
        QBcoMovimentoCOD_CADASTRO.text := TMBLCTCLIENTE.text;
        QBcoMovimentoCOD_DEPARTAMENTO.Value := 1;
        QBcoMovimentoDT_BAIXA_CHEQUE.Value := TMBLCTDTBAIXA.VAlue;
        QBcoMovimentoDESC_OBSERVACAO2.Value := TMBLCTDESCRICAO3.Value;
        QBcoMovimento.Post;
      Except
       If QBcoMovimento.State = dsInsert Then
         QBcoMovimento.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TMBLCT.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.Bt40ExportarClick(Sender: TObject);
var
   wVirgula, wAux, wArqCliente, wArqProduto, wArqPedido: String;
   wNumPedido,wCount, wCount1, wCliente, wProduto : Integer;
   F : TextFile;
begin
  wAux     := '';
  wVirgula := '';
  wCount1 := 0;
  wNumPedido := 0;
  wCliente := 0;
  wProduto := 0;

  with DMImportaDados do
  Begin

    If RgTipo.ItemIndex = 0 then //exporta cadastro de clientes dos embarques
    Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_CADASTRO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;

      while not QExportaEmbarqueSmart.Eof do
      Begin
        if wCliente <> QExportaEmbarqueSmartCOD_CADASTRO.Value then
        Begin
          wArqCliente := wArqCliente + '        '                                                     +
          copy(QExportaEmbarqueSmartNOME.Text + '                              ',1,30)                +
          copy(QExportaEmbarqueSmartDESC_FANTASIA.Text +'                    ',1,20) + '   '          +
          copy(QExportaEmbarqueSmartDESC_ENDERECO.Text +'                              ',1,30)        +
          copy(QExportaEmbarqueSmartDESC_BAIRRO.Text +'               ',1,15)                         +
          RMaskCGC_CPF(QExportaEmbarqueSmartDESC_CEP.Text,8)                                          +
          copy(QExportaEmbarqueSmartDESC_CIDADE.Text + '                              ',1,30)         +
          copy(QExportaEmbarqueSmartCOD_ESTADO.Text,1,2)                                              +
          copy(QExportaEmbarqueSmartDESC_TELEFONE.Text + '            ',1,12)                         +
          copy(QExportaEmbarqueSmartNOME_CONTATO.Text+'          ',1,10)                              +
          '           ' + '00000' + ' ';
          if QExportaEmbarqueSmartIND_FISICA_JURIDICA.Text = 'F' Then
            wArqCliente := wArqCliente + '2'
          else
            wArqCliente := wArqCliente + '1';
          wArqCliente := wArqCliente + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_CGC_CPF.Text,14)         +
          RMaskCGC_CPF(QExportaEmbarqueSmartNUM_INSCRICAO.Text,13)                                    +
          '                           ';
          wCliente := QExportaEmbarqueSmartCOD_CADASTRO.Value;
          QExportaEmbarqueSmart.Next;
          If Not(QExportaEmbarqueSmart.Eof) Then
          wArqCliente := wArqCliente + Chr(13) + Chr(10);
        end
        else
          QExportaEmbarqueSmart.Next;
      end;
      SaveDialog.FileName := 'SmartClientes';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqCliente);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
    end; //aqui acaba exportacao de clientes


    If RgTipo.ItemIndex = 1 then //exporta pedidos dos embarques
    Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY NUM_PEDIDO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      Begin
        wArqPedido:= wArqPedido+' '+RMaskCGC_CPF(QExportaEmbarqueSmartNUM_PEDIDO.Text,11)               +
        IfThen(DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE','035','034')                    +
        copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ',1,12)                               +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,1,2)                                              +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,4,2)                                              +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,7,4) + '00000000'+'  '                            +
        '        '+'      '+ RMaskCGC_CPF(QExportaEmbarqueSmartQT_PEDIDO.Text,8)+'00956'                +
        IntDecimais(QExportaEmbarqueSmartVAL_TOTAL.Text,7,2)+'   '+'     ';
        QExportaEmbarqueSmart.Next;
        If Not(QExportaEmbarqueSmart.Eof) Then
        wArqPedido := wArqPedido + Chr(13) + Chr(10);
        inc(wCount1);
      end;
      wArqPedido := wArqPedido +  Chr(13) + Chr(10) + 'F'+RMaskCGC_CPF(IntToStr(wCount1),10);
      SaveDialog.FileName := 'Pedido';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqPedido);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
    end;

    If RgTipo.ItemIndex = 2 then //exporta produtos dos embarques
    Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_PRODUTO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      Begin
        if wProduto <> QExportaEmbarqueSmartCOD_PRODUTO.Value then
        Begin
          wArqProduto := wArqProduto +  copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ',1,12)           +
          copy(QExportaEmbarqueSmartDESC_PRODUTO.Text + '                                                  ',1,50)  +
          IntDecimais(QExportaEmbarqueSmartNUM_METROS_CUBICOS.Text,12,6)                                            +
          IntDecimais(QExportaEmbarqueSmartPESO_BRUTO.Text,12,6) + '000000000'                                      +
          copy(StringReplace(QExportaEmbarqueSmartNUM_EMBALAGEM.Text,',','',[]) + '0000',1,4)                       +
          '0000' + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartCOD_NBM_SH.Text,10)                                      +
          Copy(QExportaEmbarqueSmartDESC_SITUACAO_TRIB.text + '  ',1,2);
          wProduto := StrToInt(QExportaEmbarqueSmartCOD_PRODUTO.Text);
          QExportaEmbarqueSmart.Next;
          If Not(QExportaEmbarqueSmart.Eof) Then
          wArqProduto := wArqProduto + Chr(13) + Chr(10);
        end
        else
          QExportaEmbarqueSmart.Next;
      end;
      SaveDialog.FileName := 'Produto';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqProduto);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
    end;

    If RgTipo.ItemIndex = 3 then //exporta  embarques
    Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_CADASTRO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;

      while not QExportaEmbarqueSmart.Eof do
      Begin
        if wCliente <> QExportaEmbarqueSmartCOD_CADASTRO.Value then
        Begin
          wArqCliente := wArqCliente + '        '                                                     +
          copy(QExportaEmbarqueSmartNOME.Text + '                              ',1,30)                +
          copy(QExportaEmbarqueSmartDESC_FANTASIA.Text +'                    ',1,20) + '   '          +
          copy(QExportaEmbarqueSmartDESC_ENDERECO.Text +'                              ',1,30)        +
          copy(QExportaEmbarqueSmartDESC_BAIRRO.Text +'               ',1,15)                         +
          RMaskCGC_CPF(QExportaEmbarqueSmartDESC_CEP.Text,8)                                          +
          copy(QExportaEmbarqueSmartDESC_CIDADE.Text + '                              ',1,30)         +
          copy(QExportaEmbarqueSmartCOD_ESTADO.Text,1,2)                                              +
          copy(QExportaEmbarqueSmartDESC_TELEFONE.Text + '            ',1,12)                         +
          copy(QExportaEmbarqueSmartNOME_CONTATO.Text+'          ',1,10)                              +
          '           ' + '00000' + ' ';
          if QExportaEmbarqueSmartIND_FISICA_JURIDICA.Text = 'F' Then
            wArqCliente := wArqCliente + '2'
          else
            wArqCliente := wArqCliente + '1';
          wArqCliente := wArqCliente + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_CGC_CPF.Text,14)         +
          RMaskCGC_CPF(QExportaEmbarqueSmartNUM_INSCRICAO.Text,13)                                    +
          '                           ';
          wCliente := QExportaEmbarqueSmartCOD_CADASTRO.Value;
          QExportaEmbarqueSmart.Next;
          If Not(QExportaEmbarqueSmart.Eof) Then
          wArqCliente := wArqCliente + Chr(13) + Chr(10);
        end
        else
          QExportaEmbarqueSmart.Next;
      end;
      SaveDialog.FileName := 'SmartClientes';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqCliente);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
     //aqui acaba exportacao de clientes

    //exporta pedidos dos embarques
    //Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY NUM_PEDIDO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      Begin
        wArqPedido:= wArqPedido+' '+RMaskCGC_CPF(QExportaEmbarqueSmartNUM_PEDIDO.Text,11)               +
        IfThen(DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE','035','034')                    +
        copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ',1,12)                               +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,1,2)                                              +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,4,2)                                              +
        copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text,7,4) + '00000000'+'  '                            +
        '        '+'      '+ RMaskCGC_CPF(QExportaEmbarqueSmartQT_PEDIDO.Text,8)+'00956'                +
        IntDecimais(QExportaEmbarqueSmartVAL_TOTAL.Text,7,2)+'   '+'     ';
        QExportaEmbarqueSmart.Next;
        If Not(QExportaEmbarqueSmart.Eof) Then
        wArqPedido := wArqPedido + Chr(13) + Chr(10);
        inc(wCount1);
      end;
      wArqPedido := wArqPedido +  Chr(13) + Chr(10) + 'F'+RMaskCGC_CPF(IntToStr(wCount1),10);
      SaveDialog.FileName := 'Pedido';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqPedido);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
    //end;

    //If RgTipo.ItemIndex = 2 then //exporta produtos dos embarques
    //Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count -1 do
      Begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      End;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE',wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count-1]:='';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_PRODUTO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      Begin
        if wProduto <> QExportaEmbarqueSmartCOD_PRODUTO.Value then
        Begin
          wArqProduto := wArqProduto +  copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ',1,12)           +
          copy(QExportaEmbarqueSmartDESC_PRODUTO.Text + '                                                  ',1,50)  +
          IntDecimais(QExportaEmbarqueSmartNUM_METROS_CUBICOS.Text,12,6)                                            +
          IntDecimais(QExportaEmbarqueSmartPESO_BRUTO.Text,12,6) + '000000000'                                      +
          copy(StringReplace(QExportaEmbarqueSmartNUM_EMBALAGEM.Text,',','',[]) + '0000',1,4)                        +
          '0000' + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartCOD_NBM_SH.Text,10)                                      +
          copy(QExportaEmbarqueSmartDESC_SITUACAO_TRIB.text + '  ',1,2);
          wProduto := StrToInt(QExportaEmbarqueSmartCOD_PRODUTO.Text);
          QExportaEmbarqueSmart.Next;
          If Not(QExportaEmbarqueSmart.Eof) Then
          wArqProduto := wArqProduto + Chr(13) + Chr(10);
        end
        else
          QExportaEmbarqueSmart.Next;
      end;
      SaveDialog.FileName := 'Produto';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName );
        Rewrite(F);
        Writeln(F, wArqProduto);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
        Lb40CodEmbarque.Clear();
      End
      Else
        MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
    end;
  End;
end;

procedure TFImportaDados.ME40EmbarqueKeyPress(Sender: TObject;
var Key: Char);
begin
  if Key = '13' then
     Bt40Adicionar.Click; 
end;

procedure TFImportaDados.Bt40AdicionarClick(Sender: TObject);
begin
  if Me40Embarque.Text <> '' then
   Begin
     Lb40CodEmbarque.Items.Add(Me40Embarque.Text);
     Me40Embarque.Text := '';
     Me40Embarque.SetFocus();
   End
  else
     ShowMessage('Informe Código Embarque');
end;

procedure TFImportaDados.Bt40ExcluirClick(Sender: TObject);
begin
     Lb40CodEmbarque.Items.Delete(Lb40CodEmbarque.ItemIndex);
end;

function TFImportaDados.DeletaChar(Texto, Char : string): string;
begin
  while pos(Char, texto) > 0 do
    delete(texto, pos(Char, texto), 1);
  Result := texto;
end;

procedure TFImportaDados.SpeedButton2Click(Sender: TObject);
var
   F          : TextFile;
   S,wComando : String;
   wContador  :Integer;
   wAux : string;
begin
  S:= '';  // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName);   //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F,S);
    end;
    DMImportaDados.QRCIdadeDFC.Open;
    while not((copy(S,1,1)='')) do
    begin
      wAux := copy(S,9,40);
      wAux := UpperCase(RemoveAcento(wAux));
      //wAux := Bib.LimpaString(wAux,' ');
      DMImportaDados.QRCIdadeDFC.Insert;
      DMImportaDados.QRCIdadeDFCCOD_DFC.Value := StrToInt(copy(S,1,4));
      DMImportaDados.QRCidadeDFCDESC_CIDADE.Value := wAux;
      DMImportaDados.QRCidadeDFC.Post;
      Readln(F,S);
    end;
    DMOracle.DBCemapa.Commit;
    ShowMessage('Cidades Importadas com Sucesso!');
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;

end;

procedure TFImportaDados.BitBtn16Click(Sender: TObject);
Var wCont, wRegNaoImp,wInd : Integer;
    Desc,wUmidade, wCadastro : String;
    F          : TextFile;
    S,wComando,wAux,wAchou : String;
    x, y: array of string;
begin
  If (Trim(MeFilial.Text) = '') Or (Trim(EdFilialRomaneio.Text) = '')  Then  // informar uma filial valida
     Raise Exception.Create('Informar Codigo da Filial');
  If (Trim(MeUsuario.Text) = '') Or (Trim(EdUsuarioRomaneio.Text) = '') Then  // informar um usuario valido
     Raise Exception.Create('Informar Codigo do Usuário');

  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';

  DMImportaDados.QRomaneio.Open;
  DMImportaDados.QRateioRomaneio.Open;
  wCont := 0;
  wRegNaoImp := 0;
  MEImp.Text := '';
  MENaoImp.Text := '';
  try
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName);   //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F,S);
    end;
  Except
    raise exception.Create('Não foi possivel abrir o arquivo');
  end;
  setLength(x, 3); //3 sql diferentes
  setLength(y, 3);

  DMOracle.DBCemapa.StartTransaction;
  Try
    while copy(S,1,1) <> '' do
    begin
      wAux := copy(S,1,248);
      wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','NUM_CGC_CPF = ' + Chr(39) +Trim(copy(S,55,18))+ Chr(39));
      If wCadastro = '' Then
       Begin
         ShowMessage('Nao Existe cadastro para este Cpf:'+Trim(copy(S,55,18)));
         Inc(wRegNaoImp);
       End
      Else
       Begin
         wAchou := DMOracle.BuscaNome('SELECT COD_ROMANEIO_AGRICOLA FROM TB_ROMANEIO_AGRICOLA','NUM_ROMANEIO = ' + copy(S,1,6) + ' AND COD_CADASTRO = ' + wCadastro + ' AND COD_FILIAL = ' +Trim(MeFilial.Text));
         If wAchou <> '' Then   // para nao importar o mesmo romaneio mais do que uma vez
          Begin
            Readln(F,S);
            Continue;
          End;
         DMImportaDados.QRomaneio.Insert;
         DMImportaDados.QRomaneioCod_Romaneio_Agricola.Value := DMOracle.Sequencia('ROMANEIO');
         DMImportaDados.QRomaneioNUM_ROMANEIO.Value := StrToInt(copy(S,1,6));
         DMImportaDados.QRomaneioCOD_PRODUTO.Value := StrToInt(Trim(copy(S,226,6)));
         DMImportaDados.QRomaneioCOD_CADASTRO.Value := StrToInt(wCadastro);
         DMImportaDados.QRomaneioCOD_FILIAL.Value := StrToInt(Trim(MeFilial.Text));
         DMImportaDados.QRomaneioDT_EMISSAO.Value := StrToDate(copy(S,07,2)+'/'+copy(S,09,2)+'/'+copy(S,11,4));
         DMImportaDados.QRomaneioQT_PESO_BRUTO.Value := StrToInt(copy(S,167,9));
         DMImportaDados.QRomaneioQT_TARA.Value := StrToInt(copy(S,176,9));
         DMImportaDados.QRomaneioDESC_PLACA.Text := Trim(copy(S,159,8));
         DMImportaDados.QRomaneioPERC_UMIDADE.Value := StrToFloat(copy(S,209,3)) / 10;
         DMImportaDados.QRomaneioPERC_IMPUREZA.Value := StrToFloat(copy(S,212,3)) / 10;
         DMImportaDados.QRomaneioPERC_ARDIDOS.Value := StrToFloat(copy(S,215,3)) / 10;
         DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := StrToFloat(copy(S,218,3)) / 10;
         DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := 0;
         If (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 41) Or
            (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1723) Or
            (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1731) Then
            If DMImportaDados.QRomaneioPERC_QUEBRADOS.Value > 30 Then
               DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := DMImportaDados.QRomaneioPERC_QUEBRADOS.Value - 30  * 0.5; // tolera 30%

         If (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 42) Then
            If DMImportaDados.QRomaneioPERC_QUEBRADOS.Value > 3 Then
               DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := DMImportaDados.QRomaneioPERC_QUEBRADOS.Value - 3; // tolera 3%

         DMImportaDados.QRomaneioPERC_TRIGUILHO.Value := StrToFloat(copy(S,221,3)) / 10;
         DMImportaDados.QRomaneioPERC_PH.Value := StrToFloat(copy(S,224,2));
   //        QRomaneioDESC_OBSERVACAO.Value := TRomaneioOBSERVACAO.Value;
         DMImportaDados.QRomaneioDT_MOVIMENTO.Value := Date;
         DMImportaDados.QRomaneioPERC_AVARIADO.Value := 0;
         DMImportaDados.QRomaneioNUM_CLASSIFICACAO.Value := StrToInt(copy(S,232,6));;
   //        QRomaneioNUM_TICKET.Value := Trunc(TRomaneioNRTICKET.Value);
         DMImportaDados.QRomaneioPERC_DIVERSOS.Value := 0;
         If (Trim(copy(S,153,6)) <> '999999') And (Trim(copy(S,153,6)) <> '009999') Then
            DMImportaDados.QRomaneioNUM_NOTA_PRODUTOR.Value := StrToInt(copy(S,153,6))
         Else
            DMImportaDados.QRomaneioNUM_NOTA_PRODUTOR.Value := 0;   
         DMImportaDados.QRomaneioIND_EMITIDO.Value := 'A';
         DMImportaDados.QRomaneioCOD_USUARIO.Value := StrToInt(Trim(MeUsuario.Text));
         wUmidade := DMImportaDados.QRomaneioPERC_UMIDADE.Text;
         for Wind:=1 to Length(DMImportaDados.QRomaneioPERC_UMIDADE.Text) do
            if wUmidade[wInd] = ',' then
               wUmidade[wInd] := '.';
         if (DMImportaDados.QRomaneioCod_Produto.value > 0) and (DMImportaDados.QRomaneioPerc_Umidade.value > 0) then
           Desc := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_DESCONTO_AGRICOLA','COD_PRODUTO = '+DMImportaDados.QRomaneioCod_Produto.text+' AND PERC_UMIDADE ='+wUMIDADE + ' AND COD_FILIAL = ' +Trim(MeFilial.Text));
         if Desc<>'' then
           DMImportaDados.QRomaneioPerc_desconto.Value:=StrToFloat(Desc)
         else
           DMImportaDados.QRomaneioPerc_desconto.Value:= 0;
         DMImportaDados.QRomaneioIND_SITUACAO.Value := 'E';
         DMImportaDados.QRomaneioIND_TIPO_ROMANEIO.Value := 'ROMANEIO';
         DMImportaDados.QRomaneioDT_PRIMEIRA_PESAGEM.Value := DMOracle.DataHoraServ;
         DMImportaDados.QRomaneioDT_SEGUNDA_PESAGEM.Value := DMOracle.DataHoraServ;

         x[0] := 'SELECT PERC_TOLERA_ARDIDOS FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO='+DMImportaDados.QRomaneioCod_Produto.text;
         x[1] := 'SELECT PERC_TOLERA_AVARIADO FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO='+DMImportaDados.QRomaneioCod_Produto.text;
         x[2] := 'SELECT PERC_TOLERA_IMPUREZA FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO='+DMImportaDados.QRomaneioCod_Produto.text;

         DMOracle.BuscaNomes(x, y);
         DMImportaDados.QRomaneioPerc_Tolera_Ardidos.Value := StrToFloat(y[0]);
         DMImportaDados.QRomaneioPerc_Tolera_Avariado.Value := StrToFloat(y[1]);
         DMImportaDados.QRomaneioPerc_Tolera_Impureza.Value := StrToFloat(y[2]);
         If (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 41) Or
            (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1723) Then
          Begin
            DMImportaDados.QRomaneioPerc_Tolera_Impureza.Value := 1;
          End;
         DMImportaDados.QRomaneioCod_Cadastro_Parceiro.Value := 6869;
         DMImportaDados.QRomaneioDt_Ano_Safra.Text := DMOracle.BuscaNome('SELECT DT_ANO_SAFRA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1');
         DMImportaDados.QRomaneio.Post;
         DMImportaDados.QRateioRomaneio.Insert;
         DMImportaDados.QRateioRomaneioCOD_ROMANEIO_AGRICOLA.Value := DMImportaDados.QRomaneioCod_Romaneio_Agricola.Value;
         DMImportaDados.QRateioRomaneioCOD_CADASTRO.Value := DMImportaDados.QRomaneioCOD_CADASTRO.Value;
         DMImportaDados.QRateioRomaneioPERC_RATEIO.Value := 100;
         DMImportaDados.QRateioRomaneioQT_RATEIO.Value := DMImportaDados.QRomaneioQT_PESO_BRUTO.Value - DMImportaDados.QRomaneioQT_TARA.Value;
         DMImportaDados.QRateioRomaneioIND_SITUACAO.Value := 'A';
         DMImportaDados.QRateioRomaneioIND_FIXAR_CONSUMO.Value := 'F';
         DMImportaDados.QRateioRomaneioNUM_NOTA_PRODUTOR.Text := DMImportaDados.QRomaneioNUM_NOTA_PRODUTOR.Text;
         DMImportaDados.QRateioRomaneio.Post;
         Inc(wCont);
       End;
       Readln(F,S);
    End;
    If (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
               +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
       DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  Except
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create('Importação Abortada');
  End;
end;

procedure TFImportaDados.SpeedButton3Click(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFImportaDados.SpeedButton4Click(Sender: TObject);
begin
  If FUsuarioCons = Nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If FUsuarioCons.ShowModal = mrOk then
    MeUsuario.Text := DMUsuario.QUsuarioConsCod_Usuario.Text;

end;

procedure TFImportaDados.MeFilialChange(Sender: TObject);
begin
  If Trim(MeFilial.Text) <> '' Then
     EdFilialRomaneio.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MeFilial.Text));

end;

procedure TFImportaDados.MeUsuarioChange(Sender: TObject);
begin
  If Trim(MeUsuario.Text) <> '' Then
     EdUsuarioRomaneio.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+Trim(MeUsuario.Text));

end;

procedure TFImportaDados.BtnExportarSyngentaClick(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaSKU.Close;
    QExpSyngentaSKU.SetVariable('DT_RECEBIMENTO_INI', Trim(MeSGIni.Text));
    QExpSyngentaSKU.SetVariable('DT_RECEBIMENTO_FIN', Trim(MeSGFin.Text));
    if Trim(ME1NumClasse.Text) = '' then
      QExpSyngentaSKU.SetVariable('NUM_CLASSE', Null)
    else
      QExpSyngentaSKU.SetVariable('NUM_CLASSE', ME1NumClasse.Text);
    if Trim(Me1SubClasses.Text) = '' then
      QExpSyngentaSKU.SetVariable('NUM_SUBCLASSE', Null)
    else
      QExpSyngentaSKU.SetVariable('NUM_SUBCLASSE', Me1SubClasses.Text);
    if Trim(Me1CodFornecedor.Text) = '' then
      QExpSyngentaSKU.SetVariable('COD_CADASTRO', Null)
    else
      QExpSyngentaSKU.SetVariable('COD_CADASTRO', Me1CodFornecedor.Text);
    if Trim(Me1Filial.Text) = '' then
      QExpSyngentaSKU.SetVariable('COD_FILIAL', Null)
    else
      QExpSyngentaSKU.SetVariable('COD_FILIAL', Trim(Me1Filial.Text));
    QExpSyngentaSKU.open;
    QExpSyngentaSKU.First;

    AssignFile(arq, 'C:\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-' + FormatDateTime('yyyymmdd', Date) + '_MOVIM_SKU.txt');
    Rewrite(arq);

    while not QExpSyngentaSKU.Eof do
    Begin
      Write(arq, QExpSyngentaSKUNUM_FABRICANTE.Value + ';');
      Write(arq, LimpaString(LimpaString(LimpaString(QExpSyngentaSKUFILIAL_ESTOQUE.Value, '-'), '/'), '.') + ';');
      Write(arq, FormatDateTime('yyyymmdd', QExpSyngentaSKUDT_RECEBIMENTO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_VENDA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_VENDA_ESTORNO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVAL_PRECO_UNITARIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVAL_MARGEM_UNITARIA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_TRANFERENCIA.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_TRANFERENCIA_ESTORNO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUVL_CUSTO_MEDIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUQT_ESTOQUE.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaSKUFALTA_ESTOQUE.Value));
      Writeln(arq);

      QExpSyngentaSKU.Next;
    End;

    CloseFile(arq);
  End;

  MessageDlg('Exportação concluída com sucesso.'+#13+#10+'Arquivos gerados em ''C:\X_EMPRESA-DATA_MOVIM_SKU.txt''.', mtWarning, [mbOK], 0);
end;

procedure TFImportaDados.SpeedButton5Click(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me1Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFImportaDados.Sb1FornecedorClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me1CodFornecedor.Text:= DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFImportaDados.Me1CodFornecedorExit(Sender: TObject);
begin
  if Trim(Me1CodFornecedor.Text) <> '' then
    Ed1Nome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me1CodFornecedor.Text))
  else
    Ed1Nome.Text := 'Todos ';
end;

procedure TFImportaDados.ME1NumClasseExit(Sender: TObject);
begin
  if Trim(Me1NumClasse.Text) <> '' then
    Me1DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(Me1NumClasse.Text) + ' And NUM_SUBCLASSE=0')
  else
    ME1DescClasse.Text := 'Todas ';
end;

procedure TFImportaDados.SB1ClasseClick(Sender: TObject);
begin
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
     ME1NumClasse.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
  ME1NumClasseExit(Self);
end;

procedure TFImportaDados.Me1SubClassesExit(Sender: TObject);
begin
  if Trim(Me1SubClasses.Text) <> '' then
    Ed1SubClasses.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(Me1NumClasse.Text) + ' And NUM_SUBCLASSE='+Trim(Me1SubClasses.Text))
  else
    Ed1SubClasses.Text:='Todas';
end;

procedure TFImportaDados.SB1ClasseFinalClick(Sender: TObject);
begin
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
     Me1SubClasses.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
  Me1SubClassesExit(Self);
end;

procedure TFImportaDados.Me1FilialExit(Sender: TObject);
begin
  if Trim(Me1Filial.Text) <> '' then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(Me1Filial.Text))
  else
    Ed1Filial.Text := 'Todas ';
end;

procedure TFImportaDados.BitBtn18Click(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaDFU.Close;
    QExpSyngentaDFU.SetVariable('DT_RECEBIMENTO_INI', Trim(MeSGIni.Text));
    QExpSyngentaDFU.SetVariable('DT_RECEBIMENTO_FIN', Trim(MeSGFin.Text));
    if Trim(ME1NumClasse.Text) = '' then
      QExpSyngentaDFU.SetVariable('NUM_CLASSE', Null)
    else
      QExpSyngentaDFU.SetVariable('NUM_CLASSE', ME1NumClasse.Text);
    if Trim(Me1SubClasses.Text) = '' then
      QExpSyngentaDFU.SetVariable('NUM_SUBCLASSE', Null)
    else
      QExpSyngentaDFU.SetVariable('NUM_SUBCLASSE', Me1SubClasses.Text);
    if Trim(Me1CodFornecedor.Text) = '' then
      QExpSyngentaDFU.SetVariable('COD_CADASTRO', Null)
    else
      QExpSyngentaDFU.SetVariable('COD_CADASTRO', Me1CodFornecedor.Text);
    if Trim(Me1Filial.Text) = '' then
      QExpSyngentaDFU.SetVariable('COD_FILIAL', Null)
    else
      QExpSyngentaDFU.SetVariable('COD_FILIAL', Trim(Me1Filial.Text));
    QExpSyngentaDFU.open;
    QExpSyngentaDFU.First;

    AssignFile(arq, 'C:\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-' + FormatDateTime('yyyymmdd', Date) + '_MOVIM_DFU.txt');
    Rewrite(arq);

    while not QExpSyngentaDFU.Eof do
    Begin
      Write(arq, QExpSyngentaDFUNUM_FABRICANTE.Value + ';');
      Write(arq, CortaStr(LimpaString(LimpaString(LimpaString(QExpSyngentaDFUFILIAL_ESTOQUE.Value, '-'), '/'), '.'), 20) + ';');
      Write(arq, CortaStr(UpperCase(LimpaString(LimpaString(QExpSyngentaDFUDESC_CIDADE.Value, ';'), ' ')), 20) + ';');
      Write(arq, FormatDateTime('yyyymmdd', QExpSyngentaDFUDT_RECEBIMENTO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUQT_VENDA.Value) + ';');
      Write(arq, FormatFloat('#0.00', 0) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUVAL_PRECO_UNITARIO.Value) + ';');
      Write(arq, FormatFloat('#0.00', QExpSyngentaDFUVAL_MARGEM_UNITARIA.Value) + ';');
      Write(arq, LimpaString(LimpaString(LimpaString(QExpSyngentaDFUFILIAL_ESTOQUE.Value, '-'), '/'), '.'));
      Writeln(arq);

      QExpSyngentaDFU.Next;
    End;

    CloseFile(arq);
  End;

  MessageDlg('Exportação concluída com sucesso.'+#13+#10+'Arquivos gerados em ''C:\X_EMPRESA-DATA_MOVIM_DFU.txt''.', mtWarning, [mbOK], 0);
end;

function TFImportaDados.AjustaStr ( str: String; tam: Integer ): String;
begin
  while Length ( str ) < tam do
    str := str + ' ';
  if Length ( str ) > tam then
    str := Copy ( str, 1, tam );
  Result := str;
end;

function TFImportaDados.CortaStr(str: String; tam: Integer): String;
begin
  Result := Trim(AjustaStr(str, tam));
end;

procedure TFImportaDados.BitBtn19Click(Sender: TObject);
var arq: TextFile;
seq, anterior: Integer;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  Begin
    QExpSyngentaNF.Close;
    QExpSyngentaNF.SetVariable('DT_RECEBIMENTO_INI', Trim(MeSGIni.Text));
    QExpSyngentaNF.SetVariable('DT_RECEBIMENTO_FIN', Trim(MeSGFin.Text));
    if Trim(ME1NumClasse.Text) = '' then
      QExpSyngentaNF.SetVariable('NUM_CLASSE', Null)
    else
      QExpSyngentaNF.SetVariable('NUM_CLASSE', ME1NumClasse.Text);
    if Trim(Me1SubClasses.Text) = '' then
      QExpSyngentaNF.SetVariable('NUM_SUBCLASSE', Null)
    else
      QExpSyngentaNF.SetVariable('NUM_SUBCLASSE', Me1SubClasses.Text);
    if Trim(Me1CodFornecedor.Text) = '' then
      QExpSyngentaNF.SetVariable('COD_CADASTRO', Null)
    else
      QExpSyngentaNF.SetVariable('COD_CADASTRO', Me1CodFornecedor.Text);
    if Trim(Me1Filial.Text) = '' then
      QExpSyngentaNF.SetVariable('COD_FILIAL', Null)
    else
      QExpSyngentaNF.SetVariable('COD_FILIAL', Trim(Me1Filial.Text));
    QExpSyngentaNF.open;
    QExpSyngentaNF.First;

    AssignFile(arq, 'C:\X_' + DMParamSistema.QParamSistemaCOD_EMPRESA.Value + '-EXCLUSAONF-' + FormatDateTime('yyyymmdd', Date) + '_LIN_PED_COLOCADO.txt');
    Rewrite(arq);

    seq := 1;
    anterior := 0;

    while not QExpSyngentaNF.Eof do
    Begin
      if QExpSyngentaNFNUM_NOTA.Value = anterior then
        Inc(seq)
      else
        seq := 1;

      Write(arq, 'E;');
      Write(arq, FormatFloat('000000000000', QExpSyngentaNFNUM_NOTA.Value));
      Write(arq, FormatFloat('00000000', seq) + ';');
      Write(arq, ';');
      Write(arq, '29991231;');
      Write(arq, ';');
      Write(arq, '1;');
      Write(arq, QExpSyngentaNFNUM_FABRICANTE.Value + ';');
      Write(arq, CortaStr(LimpaString(LimpaString(LimpaString(QExpSyngentaNFFILIAL_ESTOQUE.Value, '-'), '/'), '.'), 20) + ';');
      Write(arq, '29991231;');
      Write(arq, '0,000;');
      Write(arq, '0,000;');
      Write(arq, ';');
      Write(arq, ';');
      Write(arq, ';');
      Write(arq, '29991231;');
      Write(arq, '0,000;');
      Write(arq, '0,000;');
      Write(arq, 'SYNGENTA');
      Writeln(arq);

      anterior := QExpSyngentaNFNUM_NOTA.Value;
      QExpSyngentaNF.Next;
    End;

    CloseFile(arq);
  End;

  MessageDlg('Exportação concluída com sucesso.'+#13+#10+'Arquivos gerados em ''C:\X_EMPRESA-EXCLUSAO-DATA_LIN_PED_COLOCADO.txt''.', mtWarning, [mbOK], 0);
end;

procedure TFImportaDados.BitBtn20Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TVendedor.Open;
    QVendedor.Open;
    TVendedor.First;
    PB.Max := TVendedor.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TVendedor.Eof do
    Begin
      Try
        QVendedor.Insert;
        QVendedorCOD_VENDEDOR.Text := TVendedorCODIGO.Text;
        QVendedorCOD_ESTADO.Value := TVendedorESTADO.Value;
        QVendedorNOME.Value := TVendedorNOME.Value;
        QVendedorDESC_ENDERECO.Value := TVendedorENDERECO.Value;
        QVendedorDESC_CIDADE.Value := TVendedorCIDADE.Value;
        QVendedorDESC_TELEFONE.Value := TVendedorTELEFONE.Value;
        QVendedorDESC_CELULAR.Value := TVendedorCELULAR.Value;
        QVendedorDT_NASCIMENTO.Value := TVendedorDTNASCIM.Value;
        QVendedorDESC_CPF.Value := TVendedorCPF.Value;
        QVendedorDESC_IDENTIDADE.Value := TVendedorIDENTIDADE.Value;
        QVendedorPERC_COMISSAO1.Value := TVendedorCOMISSAO1.Value;
        QVendedorPERC_COMISSAO2.Value := TVendedorCOMISSAO2.Value;
        QVendedorPERC_IRRF.Value := TVendedorPCIRRF.Value;
//        QVendedorPERC_FRETE.Value := TVendedorPERCFRETE.Value;
        QVendedorPERC_DESCONTO_LIBERADO.Value := 0;
        QVendedorPERC_DESCONTO_RESTRICAO.Value := 0;
        QVendedorPERC_ACRESCIMO_MAXIMO.Value := 0;
        QVendedorPERC_NOTA_FISCAL.Value := 0;
        QVendedorIND_TROCA.Value := 'N';
        QVendedorIND_BONIFICACAO.Value := 'N';
        QVendedorIND_BRINDE.Value := 'N';
        QVendedorIND_AMOSTRA.Value := 'N';
        QVendedorIND_SEM_NOTA.Value := 'N';
        QVendedor.Post;
      Except
        If QVendedor.State = dsInsert Then
          QVendedor.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TVendedor.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BtRomaneioClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp,wInd : Integer;
    Desc,wUmidade : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TRomaneio.Filter := 'DTEMISSAO >= ' +CHR(39) + MEDataInicial.Text + Chr(39);
    TRomaneio.Open;
    QRomaneio.Open;
    QRateioRomaneio.Open;
    TRomaneio.First;
    PB.Max := TRomaneio.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TRomaneio.Eof do
    Begin
      Try
        QRomaneio.Insert;
          QRomaneioCod_Romaneio_Agricola.Value := DMOracle.Sequencia('ROMANEIO');
          QRomaneioCOD_PRODUTO.Value := TRomaneioCDMERCAD.Value;
          QRomaneioCOD_CADASTRO.Value := Trunc(TRomaneioCDFORNEC.Value);
          QRomaneioCOD_FILIAL.Value := TRomaneioLOCAL.Value;
          QRomaneioNUM_ROMANEIO.Value := Trunc(TRomaneioROMANEIO.Value);
          QRomaneioDT_EMISSAO.Text := TRomaneioDTEMISSAO.Text;
          QRomaneioQT_PESO_BRUTO.Value := Trunc(TRomaneioPESO.Value);
          QRomaneioQT_TARA.Value := Trunc(TRomaneioTARA.Value);
          QRomaneioDESC_PLACA.Text := TRomaneioPLACA.Text;
          QRomaneioPERC_UMIDADE.Value := TRomaneioUMIDADE.Value;
          QRomaneioPERC_ARDIDOS.Value := TRomaneioARDIDOS.Value;
          QRomaneioPERC_IMPUREZA.Value := TRomaneioIMPUREZA.Value;
          QRomaneioDESC_OBSERVACAO.Value := TRomaneioOBSERVACAO.Value;
          QRomaneioDT_MOVIMENTO.Text := TRomaneioDTMOVIMENT.Text;
          QRomaneioPERC_AVARIADO.Value := TRomaneioAVARIADO.Value;
          QRomaneioNUM_CLASSIFICACAO.Value := Trunc(TRomaneioNRCLASS.Value);
          QRomaneioNUM_TICKET.Value := Trunc(TRomaneioNRTICKET.Value);
          QRomaneioPERC_DIVERSOS.Value := TRomaneioDIVERSOS.Value;
          QRomaneioNUM_NOTA_PRODUTOR.Value := Trunc(TRomaneioNFPRODUTOR.Value);
          QRomaneioIND_EMITIDO.Value := 'A';
          QRomaneioPERC_QUEBRADOS.Value := TRomaneioQUEBRADOS.Value;
          QRomaneioPERC_TRIGUILHO.Value := TRomaneioTRIGUILHO.Value;
          QRomaneioPERC_PH.Value := TRomaneioPH.Value;
          wUmidade := TRomaneioUMIDADE.text;
          for Wind:=1 to Length(trim(TRomaneioUMIDADE.text)) do
             if wUmidade[wInd] = ',' then
                wUmidade[wInd] := '.';
          if (QRomaneioCod_Produto.value > 0) and (QRomaneioPerc_Umidade.value > 0) then
            Desc := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_DESCONTO_AGRICOLA','COD_PRODUTO = '+QRomaneioCod_Produto.text+' AND PERC_UMIDADE ='+wUMIDADE );
          if Desc<>'' then
            QRomaneioPerc_desconto.Value:=StrToFloat(Desc)
          else
            QRomaneioPerc_desconto.Value:= 0;
          QRomaneioIND_SITUACAO.Value := 'E';
          QRomaneioIND_TIPO_ROMANEIO.Value := 'ROMANEIO';
        QRomaneio.Post;
        QRateioRomaneio.Insert;
          QRateioRomaneioCOD_ROMANEIO_AGRICOLA.Value := QRomaneioCod_Romaneio_Agricola.Value;
          QRateioRomaneioCOD_CADASTRO.Value := QRomaneioCOD_CADASTRO.Value;
          QRateioRomaneioPERC_RATEIO.Value := 100;
          QRateioRomaneioQT_RATEIO.Value := QRomaneioQT_PESO_BRUTO.Value - QRomaneioQT_TARA.Value;
          QRateioRomaneioIND_SITUACAO.Value := 'A';
          QRateioRomaneioIND_FIXAR_CONSUMO.Value := 'F';
        QRateioRomaneio.Post;
      Except
        If TRomaneio.State = dsInsert Then
          TRomaneio.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TRomaneio.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BtFinalidadeClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TFinalidade.Open;
    QFinalidade.Open;
    QFinalidade.First;
    PB.Max := QFinalidade.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TFinalidade.Eof do
    Begin
      Try
        QFinalidade.Insert;
        QFinalidadeCOD_FINALIDADE.Value := TFinalidadeCDCONTA.Value;
        QFinalidadeCOD_MOEDA.Value := 1;
        QFinalidadeDESC_FINALIDADE.Value := TFinalidadeNOCONTA.Value;
        QFinalidadeNUM_TIPO_JURO.Value := 'SIMPLES';
        QFinalidadePERC_TAXA.Value := TFinalidadePCTAXA.Value;
        QFinalidadeNUM_PRAZO.Value := 999;
        QFinalidadeIND_ENCARGO.Value := 'N';
        QFinalidadeIND_RECIBO.Value := 'S';
        QFinalidadePERC_JURO_MORA.Value := TFinalidadeVLJUROS.Value;
        QFinalidadeIND_LIBERADO.Value := 'S';
        QFinalidadeNUM_DIAS_CARENCIA.Value := 0;
        QFinalidadeIND_FLUXO_CAIXA.Value := 'S';
        QFinalidadeVAL_LIMITE.Value := 0;
        QFinalidade.Post;
      Except
        If QFinalidade.State = dsInsert Then
          QFinalidade.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TFinalidade.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;


end;

function TFImportaDados.ConverteStrToInt(pStr: String): Integer;
var V_Int:integer;
begin
   try
      V_Int := StrToInt(pStr);
      Result := V_Int;
   except
      //on EConvertError do Result:=0;
      Result := 0;
   end;
end;

procedure TFImportaDados.BitBtn5Click(Sender: TObject);
var wImp, wNaoImp: Integer;
begin
  wImp := 0;
  wNaoImp := 0;

 { with DMNotaSaida_Firebird, DMImportaDados do
  begin
    ZQNotaSaidaCab.Close;
    ZQNotaSaidaCab.Open;
    QNotaSaidaCab.Open;
    QNotaSaidaItem.Open;
    while not ZQNotaSaidaCab.Eof do
    begin
      try
        //Cabeçalho
        QNotaSaidaCab.Insert;
        QNotaSaidaCabDT_EMISSAO.Value := ZQNotaSaidaCabDT_VENDA.Value;
        QNotaSaidaCabDT_RECEBIMENTO.Value := ZQNotaSaidaCabDT_VENDA.Value;
        QNotaSaidaCabDT_USUARIO.Value := ZQNotaSaidaCabDT_VENDA.Value;
        QNotaSaidaCabDT_MOVIMENTO.Value := ZQNotaSaidaCabDT_VENDA.Value;
        QNotaSaidaCabVAL_DESCONTO.Value := ZQNotaSaidaCabVAL_DESCONTO.Value;
        QNotaSaidaCabVAL_AVISTA.Value := ZQNotaSaidaCabVAL_ENTRADA.Value;
        QNotaSaidaCabOBS.Value := ZQNotaSaidaCabDESC_OBSERVACAO.Value;
        QNotaSaidaCabCOD_FILIAL.Value := 1;
        QNotaSaidaCabNUM_NOTA.Value := ZQNotaSaidaCabNUM_NOTA.Value;
        QNotaSaidaCabIND_SITUACAO.Value := '2';
        QNotaSaidaCabCOD_SERIE.Value := 'PE';
        QNotaSaidaCabCOD_SERIE_MODELO.Value := '99';
        QNotaSaidaCabVAL_FRETE.Value := ZQNotaSaidaCabVAL_FRETE.Value;
        QNotaSaidaCabIND_CONDICAO_PAGTO.Value :=
          ZQNotaSaidaCabIND_CONDICAO_PAGTO.Text;
        QNotaSaidaCabCOD_CADASTRO.Value := ZQNotaSaidaCabCOD_CADASTRO.Value;
        QNotaSaidaCabCOD_ESTADO.Value := DMOracle.FastSelect('COD_ESTADO',
          'TB_CADASTRO','COD_CADASTRO = ' + QNotaSaidaCabCOD_CADASTRO.Text);
        QNotaSaidaCabVAL_DESPESAS.Value := 0;
        QNotaSaidaCabVAL_ICM_BASE_FRETE.Value := 0;
        QNotaSaidaCabVAL_ICM_FRETE.Value := 0;
        QNotaSaidaCabVAL_FUNRURAL.Value := 0;
        QNotaSaidaCabPERC_COMISSAO.Value := 0;
        QNotaSaidaCabCOD_OPERACAO.Value := 3;
        QNotaSaidaCabIND_ENTRADA_SAIDA.Value := 'S';

        QNotaSaidaCab.Post;

        ZQNotaSaidaItem.Close;
        ZQNotaSaidaItem.ParamByName('COD_VENDA').Value := ZQNotaSaidaCabCOD_VENDA.Text;
        ZQNotaSaidaItem.Open;
        while not ZQNotaSaidaItem.Eof do
        begin
          QNotaSaidaItem.Insert;
          QNotaSaidaItemCOD_NOTA_CAB.Value := QNotaSaidaCabCOD_NOTA_CAB.Value;
          QNotaSaidaItemCOD_TRIBUTACAO.Value := 1;
          QNotaSaidaItemQT_QUANTIDADE.Value := ZQNotaSaidaItemQDE_VENDA_PRODUTO.Value;
          QNotaSaidaItemVAL_TOTAL.Value := ZQNotaSaidaItemVLR_VENDA_PRODUTO.Value;
          QNotaSaidaItemCOD_PRODUTO.Value := ZQNotaSaidaItemCOD_PRODUTO.Value;
          QNotaSaidaItemCOD_LOTE_TIPO.Value := 1;
          QNotaSaidaItemVAL_DESCONTO.Value := ZQNotaSaidaItemVLR_DESCONTO.Value;
          QNotaSaidaItemVAL_UNITARIO.Value := QNotaSaidaItemVAL_TOTAL.Value /
            bib.ift(QNotaSaidaItemQT_QUANTIDADE.Value > 0,
            QNotaSaidaItemQT_QUANTIDADE.Value,1);
          QNotaSaidaItemPERC_IPI.Value := 0;
          QNotaSaidaItemPERC_COMISSAO.Value := 0;
          QNotaSaidaItemVAL_DESPESAS.Value := 0;
          QNotaSaidaItemVAL_FRETE.Value := 0;
          QNotaSaidaItemPERC_DESCONTO.Value := 0;
          QNotaSaidaItemVAL_IPI.Value := 0;
          QNotaSaidaItemVAL_ICM_BASE.Value := 0;
          QNotaSaidaItemVAL_ICM.Value := 0;
          QNotaSaidaItemVAL_CUSTO.Value := 0;
          QNotaSaidaItemVAL_ISS.Value := 0;
          QNotaSaidaItemIND_CLASS_IPI.Value := '5';
          QNotaSaidaItem.Post;
          ZQNotaSaidaItem.Next;
        end;
        ZQNotaSaidaCab.Next;
        Inc(wImp);
        MEImp.Text := IntToStr(wImp);
        QNotaSaidaCons.Close;
        QNotaSaidaCons.Open;
        DBGrid20.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QNotaSaidaCab.Cancel;
        QNotaSaidaItem.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQNotaSaidaCab.Next;
      end;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end; }
end;

procedure TFImportaDados.BtImportaMarcaClick(Sender: TObject);
var wImp, wNaoImp: Integer;
begin
  wImp := 0;
  wNaoImp := 0;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQMarca.Close;
    ZQMarca.Open;
    QMarcaImporta.Open;

    while not ZQMarca.Eof do
    begin
      try
        QMarcaImporta.Insert;
        QMarcaImportaCOD_MARCA.Value := ZQMarcaMARCODIGO.Value;
        QMarcaImportaDESC_MARCA.Value := ZQMarcaMARNOME.Value;
        QMarcaImporta.Post;
        Inc(wImp);
        MEImp.Text := IntToStr(wImp);

        DBGrid21.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QMarcaImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQMarca.Next;
      end;
      ZQMarca.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BtImpProdutosAtenasClick(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse: string;
exec: TExecutador;
queryP : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin

    with DMProdutoFirebird, DMImportaDados do
    begin
      QmarcaCons.Open;
      QProduto.Open;
      ZQProdutoAtenas.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoAtenas.First;

      wCont := 0;
      While not ZQProdutoAtenas.Eof do
      Begin
        Try
          queryP := TOracleDataSet1.Create(nil);
          queryP.Session := DMOracle.DBCemapa;
          queryP.Variables := QProduto.Variables;
          queryP.Close;
          queryP.SQL := QProduto.SQL;
          queryP.Open;
          queryP.Insert;

          //QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');
          queryP.FieldByName('COD_PRODUTO').Value    := ZQProdutoAtenasCOD_PRODUTO.Value;
          queryP.FieldByName('NUM_FABRICANTE').Value :=  Trim(ZQProdutoAtenasREFERENCIA.Value);
          queryP.FieldByName('COD_CLASSE').Value     := '6';
          queryP.FieldByName('COD_TRIBUTACAO').Value := 1;
          queryP.FieldByName('DESC_PRODUTO').Value   := Trim(bib.RemoveAcentos(UpperCase(ZQProdutoAtenasdesc_produto.Value)));
          queryP.FieldByName('DESC_UNIDADE').Value   := copy(UpperCase(ZQProdutoAtenasdesc_unidade.Value),1,3);
          queryP.FieldByName('NUM_GENERO_NCM').Value := ZQProdutoAtenasNUM_GENERO_NCM.Value;
          queryP.FieldByName('NUM_EMBALAGEM').Value  := 1;
//          queryP.FieldByName('NUM_PESO_BRUTO').Value   := ZQProdutoNUM_PESO_BRUTO.value;
//          queryP.FieldByName('NUM_PESO_LIQUIDO').Value := ZQProdutoNUM_PESO_BRUTO.value;
//          queryP.FieldByName('DESC_COD_BARRA').Value := copy(ZQProdutoAtenasDESC_COD_BARRA.Value,1,20);
//          queryP.FieldByName('DESC_COD_BARRA').Value := ZQProdutoAtenasDESC_COD_BARRA.Value;
          if (ZQProdutoAtenasDESC_COD_BARRA.Value <> '') and (ZQProdutoAtenasDESC_COD_BARRA.Value <> 'SEM GTIN') then
            queryP.FieldByName('DESC_COD_BARRA').Value := ZQProdutoAtenasDESC_COD_BARRA.Value;
          queryP.FieldByName('COD_CEST').Value  := ZQProdutoAtenasCOD_CEST.Value;

          queryP.FieldByName('VAL_VAREJO').Value  := ZQProdutoAtenasVAL_VAREJO.Value;
          queryP.FieldByName('VAL_ATACADO').Value := ZQProdutoAtenasVAL_VAREJO.Value;
          if QMarcaCons.Locate('DESC_MARCA',ZQProdutoAtenasDESC_MARCA.Value,[loCaseInsensitive]) then
            queryP.FieldByName('COD_MARCA').Value   := QMarcaConsCOD_MARCA.Value;
          //QProdutoNUM_VOLUMES.Value := 1;
          queryP.FieldByName('IND_TIPO_PRODUTO').Value := 'COMERCIAL';
          queryP.FieldByName('PERC_INSS').Value:= 0;
          queryP.FieldByName('PERC_ISS').Value := 0;
          If ZQProdutoAtenasIND_SITUACAO.Value = '' Then
            queryP.FieldByName('IND_SITUACAO').Value:= 'ATIVO'
          else if ZQProdutoAtenasIND_SITUACAO.Value = 'INATIVO' then
            queryP.FieldByName('IND_SITUACAO').Value:= 'DESATIVADO'
          else
            queryP.FieldByName('IND_SITUACAO').Value:= ZQProdutoAtenasIND_SITUACAO.Value;

          queryP.Post;

          {QEstoque.Close;
          QEstoque.Open;
          QEstoque.Insert;
          QEstoqueCOD_LOTE_TIPO.Value := 1;
          QEstoqueCOD_FILIAL.Value := 1;
          QEstoqueCOD_PRODUTO.Value := QProdutoCOD_PRODUTO.Value;
          QEstoqueQT_QUANTIDADE.Value := 1;
          QEstoqueVL_CUSTO_MEDIO.Value := ZQProdutoAtenasVAL_CUSTO.Value;
          QEstoqueVL_ULTIMO_CUSTO.Value := ZQProdutoAtenasVAL_CUSTO.Value;
          QEstoque.Post;}
        Except
          Inc(wRegNaoImp);
          If queryP.State = dsInsert Then
            queryP.Cancel;
        End;
        queryP.Free;
        queryP := nil;
        ZQProdutoAtenas.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;

        //Insere imagem dos produtos
        {ZQProdutoAtenas.First;
        while not ZQProdutoAtenas.Eof do
        begin
          if Trim(ZQProdutoAtenasIMG_FOTO.Value) <> '' then  //comentado marcos
          begin
            exec := TExecutador.Create;
            exec.Adiciona('INSERT INTO TB_IMAGEM_PRODUTO '+
              'VALUES(SQIMAGEM_PRODUTO.NEXTVAL, ' +
              copy(ZQProdutoAtenasCOD_PRODUTO.Text,1,6) + ', '+
              quotedStr(ZQProdutoAtenasIMG_FOTO.Value) + ')');
            exec.Executar(false,true);
            exec.Fecha;exec.Free;
          end;
          ZQProdutoAtenas.Next;
        end;}
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BtImpCadastroAtenasClick(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp, wCxPostal : Integer;
    wFone : String;
    wIsNumber: boolean;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    with DMCadastroFirebird, DMOracle do
    begin
      ZQCadastroAtenas.Open;
      QCadastro.Open;
      ZQCadastroAtenas.First;
      wCont := 0;
      wRegNaoImp := 0;
      DMOracle.DBCEmapa.StartTransaction;
      While not ZQCadastroAtenas.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := strtoint(copy(ZQCadastroAtenasCOD_CADASTRO.text,1,6));
          //QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
          if ZQCadastroAtenasDESC_CADASTRO.Text <> '' then
            QCadastroNOME.Value := Trim(bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_CADASTRO.Value,1,60))))
          else
            QCadastroNOME.Value := Trim(bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_FANTASIA.Value,1,60))));
          QCadastroDESC_FANTASIA.Text := Trim(bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_FANTASIA.Value,1,60))));
          QCadastroDESC_ENDERECO.Value :=  Trim(bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_ENDERECO.Value,1,60))));
//          QCadastroCOD_CIDADE.value := ZQCadastroAtenasCOD_CIDADE.Value;
          QCadastroDESC_CIDADE.Value :=  bib.RemoveAcentos(ZQCadastroAtenasDESC_CIDADE.Value);
          QCadastroCOD_ESTADO.Value := 'PR';
          QCadastroDESC_CEP.Value :=  copy(ZQCadastroAtenasDESC_CEP.Value,1,9);
          QCadastroNUM_INSCRICAO.Value := ZQCadastroAtenasNUM_INSCRICAO.Value;

          QCadastroDESC_ENDERECO_COBRANCA.Value := Trim(bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_ENDERECO.Value,1,60))));
          QCadastroDESC_CIDADE_COBRANCA.Value   :=  bib.RemoveAcentos(ZQCadastroAtenasDESC_CIDADE.Value);
          QCadastroDESC_ESTADO_COBRANCA.Value   := 'PR';
          QCadastroDESC_CEP_COBRANCA.Value      := copy(ZQCadastroAtenasDESC_CEP.Value,1,9);
          QCadastroDESC_BAIRRO_COBRANCA.Value   := bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_bairro.Value,1,20)));
          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroAtenasDESC_FONE.Value) do
           Begin
             If (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroAtenasDESC_fone.Value,wInd,1);
             Inc(wInd);
           End;
          if Length(wFone) = 8 then
            QCadastroDESC_TELEFONE.text := '45' + wFone
          else
            QCadastroDESC_TELEFONE.Value := wFone;

          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroAtenasDESC_CELULAR.Value) do
           Begin
             If (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroAtenasDESC_CELULAR.Value,wInd,1);
             Inc(wInd);
           End;
          if Length(wFone) = 8 then
            QCadastroDESC_CELULAR.text := '45' + wFone
          else
            QCadastroDESC_CELULAR.Value := wFone;

          QCadastroNUM_CGC_CPF.Value :=  ZQCadastroAtenasNUM_CGC_CPF.value;
          QCadastroDESC_BAIRRO.Value :=  bib.RemoveAcentos(UpperCase(copy(ZQCadastroAtenasDESC_bairro.Value,1,20)));
          QCadastroDT_NASCIMENTO.Text :=  ZQCadastroAtenasDT_NASCIMENTO.Text;
          If ZQFornecedordt_cadastro.Text <> ''  Then
             QCadastroDT_CADASTRO.value :=  StrToDate(ZQCadastroAtenasDT_CADASTRO.Text)
          Else
             QCadastroDT_CADASTRO.Value :=  Date;
          QCadastroCOD_PAIS.Value :=  278;  // TCadastroIDNACAO.Value;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroCOD_RAMO.Value := 1;
          QCadastroCOD_VENDEDOR.Value := 1;
          QCadastroDESC_OBS.Value := bib.RemoveAcentos(ZQCadastroAtenasDESC_OBSERVACAO.Value);

          if ZQCadastroAtenasIND_TIPO_CADASTRO.Text = 'FORNECEDOR' then
            QCadastroCOD_TIPO_CADASTRO.Value := 2
          else
            QCadastroCOD_TIPO_CADASTRO.Value := 1;

          QCadastroNOME_CONTATO.Value := ZQCadastroAtenasdesc_contato.Value;

          if ZQCadastroAtenasIND_FISICA_JURIDICA.Text = 'JURIDICA' then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := ZQCadastroAtenasdesc_EMAIL.value;
          QCadastroDESC_E_MAIL1.Value := ZQCadastroAtenasDESC_EMAIL.Value;

          if ZQCadastroAtenasIND_SEXO.Value = 'MASCULINO' then
            QCadastroIND_SEXO_CATEGORIA.Value := 'M'
          else if ZQCadastroAtenasIND_SEXO.Value = 'FEMININO' then
            QCadastroIND_SEXO_CATEGORIA.Value := 'F'
          else
            QCadastroIND_SEXO_CATEGORIA.Value := 'J';
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQCadastroAtenasCOD_CADASTRO.Text + ZQCadastroAtenasDESC_CADASTRO.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQCadastroAtenas.Next;
      End; 
    end;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
  MessageDlg(memo1.Text, mtInformation, [mbOK], 0);
end;  

procedure TFImportaDados.BitBtn21Click(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp, wCxPostal : Integer;
    wFone : String;
    wIsNumber: boolean;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    with DMCadastroFirebird, DMOracle do
    begin
      ZQCadastroIntelic.Open;
      QCadastro.Open;
      ZQCadastroIntelic.First;
      wCont := 0;
      wRegNaoImp := 0;
      DMOracle.DBCEmapa.StartTransaction;
      While not ZQCadastroIntelic.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := strtoint(copy(ZQCadastroIntelicCODIGO.text,1,6));
          QCadastroNOME.Value         := UpperCase(copy(ZQCadastroIntelicNOME.Value,1,60));
          QCadastroDESC_FANTASIA.Text := UpperCase(copy(ZQCadastroIntelicNOMEFANTASIA.Value,1,60));
          QcadastroDESC_E_MAIL.Text   := copy(ZQCadastroIntelicEMAIL.Value,1,70);
          QcadastroDESC_E_MAIL1.Text  := copy(ZQCadastroIntelicEMAIL.Value,1,70);
          QCadastroDESC_ENDERECO.Text    :=  UpperCase(copy(ZQCadastroIntelicENDERECO.Value,1,60));
          QCadastroDESC_CIDADE.Text      := UpperCase(copy(ZQCadastroIntelicMUNICIPIO.Value,1,30));
          QCadastroCOD_ESTADO.Value      := UpperCase(copy(ZQCadastroIntelicUF.Value,1,2));
          QCadastroCOD_PAIS.Value              := 278; //Brasil
          QCadastroDESC_BAIRRO.Text      := UpperCase(copy(ZQCadastroIntelicBAIRRO.Value,1,60));
          QCadastroDESC_COMPLEMENTO.Text := UpperCase(copy(ZQCadastroIntelicCOMPLEMENTO.Value,1,60));
          QCadastroDESC_CEP.Text         := ZQCadastroIntelicCEP.Value;
          QCadastroIND_FISICA_JURIDICA.Value := ZQCadastroIntelicPFJ.Value;
          if ZQCadastroIntelicPFJ.Value = 'J' then
          begin
            QCadastroCOD_TIPO_CADASTRO.Value := 2;
            QCadastroNUM_CGC_CPF.Value := ZQCadastroIntelicCNPJ.Value;
            QCadastroNUM_INSCRICAO.Value := ZQCadastroIntelicCCE.Value;
          end
          else
          begin
            QCadastroCOD_TIPO_CADASTRO.Value := 1;
            QCadastroNUM_CGC_CPF.Value := ZQCadastroIntelicCPF.Value;
            QCadastroNUM_INSCRICAO.Value := ZQCadastroIntelicRG.Value;
          end;
          QCadastroDT_NASCIMENTO.Text := ZQCadastroIntelicNASCIMENTO.Text;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroCOD_RAMO.Value := 1;
          if ZQCadastroIntelicDT_INSERT.Text <> '' then
            QCadastroDT_CADASTRO.Value := ZQCadastroIntelicDT_INSERT.Value
          else
            QCadastroDT_CADASTRO.Value := date;
          if ZQCadastroIntelicDT_UPDATE.Text <> '' then
            QCadastroDT_ALTERACAO.Value := ZQCadastroIntelicDT_UPDATE.Value;

          if upperCase(ZQCadastroIntelicSEXO.Text) = 'MASCULINO' then
            QCadastroIND_SEXO_CATEGORIA.Value := 'M'
          else if upperCase(ZQCadastroIntelicSEXO.Text) = 'FEMININO' then
            QCadastroIND_SEXO_CATEGORIA.Value := 'F'
          else
            QCadastroIND_SEXO_CATEGORIA.Value := 'M';

          if ZQCadastroIntelicLIMITE_CREDITO.Value > 0 then
            QCadastroVAL_LIMITE.Value := ZQCadastroIntelicLIMITE_CREDITO.Value;

          QCadastroDESC_REF_COMERCIAL1.Text := ZQCadastroIntelicREFCOM.Value;
          QCadastroDESC_REF_COMERCIAL2.Text := ZQCadastroIntelicREFCOM1.Value;
          QCadastroDESC_REF_COMERCIAL3.Text := ZQCadastroIntelicREFCOM2.Value;
          QCadastroVAL_SALARIO.Value        := ZQCadastroIntelicREND.Value;
          QCadastroNOME_PAI.Text            := ZQCadastroIntelicPAI.Value;
          QCadastroNOME_MAE.Text            := ZQCadastroIntelicMAE.Value;

          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroIntelicFONERES.Value) do
           Begin
             If (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroIntelicFONERES.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroIntelicFONERES.Value,wInd,1);
             Inc(wInd);
           End;
          if Length(wFone) = 8 then
            QCadastroDESC_TELEFONE.text := '45' + wFone
          else
            QCadastroDESC_TELEFONE.Value := wFone;

          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroIntelicFONECOM.Value) do
           Begin
             If (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroIntelicFONECOM.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroIntelicFONECOM.Value,wInd,1);
             Inc(wInd);
           End;
          if Length(wFone) = 8 then
            QcadastroDESC_TELEFONE_COMERCIAL.text := '45' + wFone
          else
            QcadastroDESC_TELEFONE_COMERCIAL.Value := wFone;

          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroIntelicFONECEL.Value) do
           Begin
             If (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroIntelicFONECEL.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroIntelicFONECEL.Value,wInd,1);
             Inc(wInd);
           End;
          if Length(wFone) = 8 then
            QCadastroDESC_CELULAR.text := '45' + wFone
          else
            QCadastroDESC_CELULAR.Value := wFone;

          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQCadastroIntelicCODIGO.Text + ZQCadastroIntelicNOME.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQCadastroIntelic.Next;
      End; 
    end;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
  MessageDlg(memo1.Text, mtInformation, [mbOK], 0);

end;

procedure TFImportaDados.BitBtn9Click(Sender: TObject);
var wImp, wNaoImp: Integer;
begin
  wImp := 0;
  wNaoImp := 0;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQMarcaIntelic.Close;
    ZQMarcaIntelic.Open;
    QMarcaImporta.Open;

    while not ZQMarcaIntelic.Eof do
    begin
      try
        QMarcaImporta.Insert;
        QMarcaImportaCOD_MARCA.Value := ZQMarcaIntelicCODIGO.Value;
        QMarcaImportaDESC_MARCA.Value := ZQMarcaIntelicNOME.Value;
        QMarcaImporta.Post;
        Inc(wImp);
        MEImp.Text := IntToStr(wImp);

        DBGrid21.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QMarcaImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQMarcaIntelic.Next;
      end;
      ZQMarcaIntelic.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn22Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQClasseIntelic.Close;
    ZQClasseIntelic.Open;
    QClasseimporta.Open;

    while not ZQClasseIntelic.Eof do
    begin
      try
        QClasseImporta.Insert;
        QClasseImportaCOD_CLASSE.Value := ZQClasseIntelicCODIGO.Value;
        QClasseImportaNUM_CLASSE.Value := 1;
        QClasseImportaNUM_SUBCLASSE.Value := wAux;
        QClasseImportaDESC_CLASSE.Value := ZQClasseIntelicGRUPO.Value;

        QClasseImporta.Post;
        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid24.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QClasseImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQClasseIntelic.Next;
      end;
      ZQClasseIntelic.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn23Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse,wCodBarras: string;
exec: TExecutador;
queryP : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    with DMProdutoFirebird, DMImportaDados do
    begin
      QProdutoImporta.Open;
      ZQProdutoIntelic.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoIntelic.First;

      wCont := 0;
      While not ZQProdutoIntelic.Eof do
      Begin
        Try      //Evitar o erro de out of memory para muitos itens.
          queryP := TOracleDataSet1.Create(nil);
          queryP.Session := DMOracle.DBCemapa;
          queryP.Variables := QProdutoImporta.Variables;
          queryP.Close;
          queryP.SQL := QProduto.SQL;
          queryP.Open;
          queryP.Insert;

          queryP.FieldByName('COD_PRODUTO').Value := ZQProdutoIntelicCODIGO.Value;
          //QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');
          //QProdutoImportaNUM_FABRICANTE.Value :=  ZQProdutoIntelicCODEMP.Value;
          queryP.FieldByName('NUM_FABRICANTE').Value := ZQProdutoIntelicCODEMP.Value;
          //QProdutoImportaDESC_PRODUTO.Value := UpperCase(ZQProdutoIntelicMERCADORIA.Value);
          queryP.FieldByName('DESC_PRODUTO').Value := UpperCase(bib.RemoveAcentos(ZQProdutoIntelicMERCADORIA.Value));
          //QProdutoImportaCOD_TRIBUTACAO.Value := 1;

          if ZQProdutoIntelicCODIGO_SITUACAO_TRIBUTARIA.Value in [1,2] then
            queryP.FieldByName('COD_TRIBUTACAO').Value := 2
          else if ZQProdutoIntelicCODIGO_SITUACAO_TRIBUTARIA.Value in [3,4] then
            queryP.FieldByName('COD_TRIBUTACAO').Value := 1
          else
            queryP.FieldByName('COD_TRIBUTACAO').Value := 1;

          //QProdutoImportaVAL_VAREJO.Value := ZQProdutoIntelicVAREJO.Value;
          queryP.FieldByName('VAL_VAREJO').Value := ZQProdutoIntelicVAREJO.Value;
          //QProdutoImportaVAL_ATACADO.Value := ZQProdutoIntelicATACADO.Value;
          queryP.FieldByName('VAL_ATACADO').Value := ZQProdutoIntelicATACADO.Value;
          //QProdutoImportaDESC_COD_BARRA.Value := copy(ZQProdutoIntelicCODFAB.Value,1,20);
          wCodBarras := DMOracle.FastSelect('DESC_COD_BARRA','TB_PRODUTO','DESC_COD_BARRA = ' + QuotedStr(ZQProdutoIntelicCODFAB.Text));
          if (Trim(copy(ZQProdutoIntelicCODFAB.Value,1,20)) <> '') and (Trim(copy(ZQProdutoIntelicCODFAB.Value,1,20))<> 'SEM GTIN') then
          begin
            if wCodBarras <> copy(ZQProdutoIntelicCODFAB.Value,1,20) then
              queryP.FieldByName('DESC_COD_BARRA').Value := copy(ZQProdutoIntelicCODFAB.Value,1,20);
          end;
          if ZQProdutoIntelicUNIDADEDESC.Value = 'UNIDADE' then
            //QProdutoImportaDESC_UNIDADE.Value := 'UN'
            queryP.FieldByName('DESC_UNIDADE').Value := 'UN'
          else if ZQProdutoIntelicUNIDADEDESC.Value = 'KIT' then
            //QProdutoImportaDESC_UNIDADE.Value := 'KG'
            queryP.FieldByName('DESC_UNIDADE').Value := 'KIT'
          else if ZQProdutoIntelicUNIDADEDESC.Value = 'JOGO' then
            //QProdutoImportaDESC_UNIDADE.Value := 'MT'
            queryP.FieldByName('DESC_UNIDADE').Value := 'JG'
          else if ZQProdutoIntelicUNIDADEDESC.Value = 'METRO' then
            queryP.FieldByName('DESC_UNIDADE').Value := 'MT'
          else
            //QProdutoImportaDESC_UNIDADE.Value := copy(UpperCase(ZQProdutoIntelicUNIDADEDESC.Value),1,3);
            queryP.FieldByName('DESC_UNIDADE').Value := copy(UpperCase(ZQProdutoIntelicUNIDADEDESC.Value),1,3);

          if ZQProdutoIntelicDT_INSERT.Text <> '' then
            //QProdutoImportaDT_ALTERACAO_PRECO.Text := ZQProdutoIntelicDT_INSERT.Text;
            queryP.FieldByName('DT_ALTERACAO_PRECO').Value := ZQProdutoIntelicDT_INSERT.Text;
          queryP.FieldByName('NUM_GENERO_NCM').Value := ZQProdutoIntelicCODIGO_NCM.Value;
          //QProdutoImportaCOD_CEST.Value := ZQProdutoIntelicCEST.Value;
          queryP.FieldByName('COD_CEST').Value := ZQProdutoIntelicCEST.Value;
          //QProdutoImportaCOD_CADASTRO.Value := ZQProdutoIntelicCODIGO_FORNECEDOR.Value;
          queryP.FieldByName('COD_CADASTRO').Value := ZQProdutoIntelicCODIGO_FORNECEDOR.Value;
//          if ZQProdutoIntelicCODIGO_GRUPO.Text <> '' then
            //QProdutoImportaCOD_CLASSE.Value := ZQProdutoIntelicCODIGO_GRUPO.Value
//            queryP.FieldByName('COD_CLASSE').Value := ZQProdutoIntelicCODIGO_GRUPO.Value
//          else
            //QProdutoImportaCOD_CLASSE.Value := 2;
          queryP.FieldByName('COD_CLASSE').Value := 6;
          //QProdutoImportaNUM_EMBALAGEM.Value := 1;
          queryP.FieldByName('NUM_EMBALAGEM').Value := 1;
          //QProdutoImportaNUM_PESO_BRUTO.Value := ZQProdutoIntelicPESO_BRUTO;
          queryP.FieldByName('NUM_PESO_BRUTO').Value := ZQProdutoIntelicPESO_BRUTO.Value;
          //QProdutoImportaNUM_PESO_LIQUIDO.Value := ZQProdutoIntelicPESO_LIQUIDO;
          queryP.FieldByName('NUM_PESO_LIQUIDO').Value := ZQProdutoIntelicPESO_LIQUIDO.Value;
          //QProdutoImportaIND_TIPO_PRODUTO.Value := 'COMERCIAL';
          queryP.FieldByName('IND_TIPO_PRODUTO').Value := 'COMERCIAL';
          //QProdutoImportaPERC_INSS.Value := 0;
          queryP.FieldByName('PERC_INSS').Value := 0;
          //QProdutoImportaPERC_ISS.Value := 0;
          queryP.FieldByName('PERC_ISS').Value := 0;
          //QProdutoImportaIND_SITUACAO.Value := 'ATIVO';
          queryP.FieldByName('IND_SITUACAO').Value := 'ATIVO';
          if ZQProdutoIntelicMARCA.Text <> '' then
          begin
            //QProdutoImportaCOD_MARCA.value := StrToInt('0'+DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(ZQProdutoIntelicMARCA.Text)));
            queryP.FieldByName('COD_MARCA').Value := StrToInt('0'+DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(ZQProdutoIntelicMARCA.Text)));
          end;
          //QProdutoImporta.Post;}
          queryP.Post;
        Except
          Inc(wRegNaoImp);
          If queryP.State = dsInsert Then
            queryP.Cancel;
        End;
        queryP.Free;
        queryP := nil;

        ZQProdutoIntelic.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn24Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCod_Produto : String;
    query: TOracleDataSet1;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados, DMProdutoFirebird do
  Begin
    //TProduto.Open;
    QEstoqueImporta.Open;
    DMOracle.DBCemapa.StartTransaction;
    //TProduto.First;
    //PB.Max := TProduto.RecordCount;
    wCont := 0;

    ZQEStoqueINTELIC.Close;
    ZQEStoqueINTELIC.Open;

    While not ZQEStoqueINTELIC.Eof do
    Begin
      Try
          // Feito para quando a importação possui muitos produtos
          // Estava dando out of memory
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QEstoque.Variables;
          query.Close;
          query.SQL := QEstoque.SQL;
          query.Open;

          query.Insert;

          //QEstoqueCOD_LOTE_TIPO.Value := 1;
          query.FieldByName('COD_LOTE_TIPO').Value := ZQEStoqueINTELICcod_lote_tipo.Value;
          //QEstoqueCOD_FILIAL.Value := 1;
          query.FieldByName('COD_FILIAL').Value := ZQEStoqueINTELICcod_filial.Value;
//          wCod_Produto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39) + TProdutoCDMERCAD.Text+Chr(39));
//          QEstoqueCOD_PRODUTO.Value := StrToInt(wCod_Produto);
          //QEstoqueCOD_PRODUTO.Value := TProdutoCDMERCAD.Value;
          query.FieldByName('COD_PRODUTO').Value := ZQEStoqueINTELICCODIGO.Value;
          //QEstoqueVL_CUSTO_MEDIO.Value := TProdutoVLCUSTMED.Value;
          query.FieldByName('VL_CUSTO_MEDIO').Value := ZQEStoqueINTELICCUSTO.Value;
          //QEstoqueVL_ULTIMO_CUSTO.Value := TProdutoVLCUSTMED.Value;
          query.FieldByName('VL_ULTIMO_CUSTO').Value := ZQEStoqueINTELICCUSTO.Value;
          //QEstoqueVL_CUSTO_DOLAR.Value := TProdutoVLCUSTMED.Value / 1.95;
          //QEstoqueQT_QUANTIDADE.Value := TProdutoQTDISPONIV.Value;
          query.FieldByName('QT_QUANTIDADE').Value := ZQEStoqueINTELICSALDO_ESTOQUE.Value;

          query.FieldByName('QT_INVENTARIO').Value := ZQEStoqueINTELICINVENTARIO.Value;
          //QEstoqueDT_COMPRA.Text := TProdutoDTCOMPRA.Text;
          //QEstoqueDT_VENDA.Text := TProdutoDTVENDA.Text;
          //QEstoqueQT_COMPRA.Value := TProdutoQTULTCOMPR.Value;
          //QEstoqueQT_MINIMO.Value := 0;
          //QEstoqueQT_MAXIMO.Value := 0;
          //QEstoqueQT_INVENTARIO.Value := 0;
     //    QEstoqueDT_INVENTARIO.Text := 0;

          query.Post;

          query.Free;
          query := nil;
          ZQEStoqueINTELIC.Next;
      Except
       If query.State = dsInsert Then
         query.Cancel;
       Inc(wRegNaoImp);
       query.Free;
       query := nil;
       ZQEStoqueINTELIC.Next;
      End;
      Inc(wCont);
      PB.Position := wCont;
      //TProduto.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0; 
end;

procedure TFImportaDados.BitBtn25Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo : integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasPagarFirebird do
  Begin
    ZQCP_INTELIC.Open;
    QCP_Importa.Open;
    ZQCP_INTELIC.First;
    PB.Max := ZQCP_INTELIC.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCP_INTELIC.Eof do
    Begin
      Try
        {if ZQCP_INTELICNUMERO_NOTA.Value = '' then
          inc(wNumTitulo)
        else
          wNumTitulo := StrToInt(ZQCP_INTELICNUMERO_NOTA.Value);}

        if ZQCP_INTELICNUMERO_NOTA.Value <> '' then
        begin
          wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(ZQCP_INTELICCODCLI.Value)
                                   +' AND NUM_TITULO = '+ (ZQCP_INTELICNUMERO_NOTA.Value) //FloatToStr(wNumTitulo)
                                   +' AND NUM_PARCELA = '+ copy(ZQCP_INTELICPARCELA.value,1,1)
                                   +' AND DESC_TIPO_DOCUMENTO = ' + QuotedStr('DP'));
        end;
        IF wCab = '' Then
        //IF DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + ZQCP_INTELICCODCLI.Text) <> '' Then
        if ZQCP_INTELICCODCLI.Text <> '' then
        Begin
          QCP_Importa.Insert;
          QCP_ImportaCOD_CONTA_PAGAR_CAB.value := DmOracle.Sequencia('CONTA_PAGAR');
          //QCP_ImportaCOD_CONTA_PAGAR_CAB.value := ZQCP_INTELICCODIGO.Value;
          QCP_ImportaCOD_FINALIDADE.value := 1;
          QCP_ImportaCOD_CADASTRO.value := Trunc(ZQCP_INTELICCODCLI.value);
          QCP_ImportaCOD_FILIAL.value := ZQCP_INTELICFILIAL.value;
          //QCP_ImportaNUM_TITULO.Value := wNumTitulo;
          if (ZQCP_INTELICNUMERO_NOTA.Value = '') or (ZQCP_INTELICNUMERO_NOTA.Value = '0') then
          begin
             inc(wNumTitulo);
             QCP_ImportaNUM_TITULO.Value := wNumTitulo;
          end
          else
          begin
            QCP_ImportaNUM_TITULO.value := StrToInt(ZQCP_INTELICNUMERO_NOTA.Value);
          end;

          QCP_ImportaNUM_PARCELA.value := StrToInt(copy(ZQCP_INTELICPARCELA.value,1,1));
          QCP_ImportaDESC_TIPO_DOCUMENTO.value := 'DP';
          QCP_ImportaDT_EMISSAO.Value := ZQCP_INTELICCOMPETE.Value;
          QCP_ImportaDT_VENCIMENTO.Value := ZQCP_INTELICVENCIMENTO.Value;
          QCP_ImportaDT_BAIXA.Value := ZQCP_INTELICPAGAMENTO.Value;
          QCP_ImportaDT_MOVIMENTO.Value := ZQCP_INTELICCOMPETE.Value;
          QCP_ImportaDT_CAPITALIZACAO.Text := ZQCP_INTELICCOMPETE.Text;
          QCP_ImportaVAL_ORIGINAL.Value := ZQCP_INTELICVALOR.Value;
          QCP_ImportaVAL_TITULO.value := (ZQCP_INTELICVALOR.Value + ZQCP_INTELICVALOR_MORA_PAGO.Value + ZQCP_INTELICVALOR_MULTA_PAGO.Value) -
                                              ZQCP_INTELICVALOR_DESCONTO_CONCEDIDO.Value;
          QCP_ImportaDESC_OBSERVACAO.value := ZQCP_INTELICCONTA.value;
          QCP_ImportaIND_ACEITE.value := 'S';
          If ZQCP_INTELICPAGAMENTO.Value = 0 Then
            QCP_ImportaIND_SITUACAO.Value :=  'ABERTO'
          Else
            If (ZQCP_INTELICVLRPAGO.Value) >= (ZQCP_INTELICVALOR.Value) Then
              QCP_ImportaIND_SITUACAO.Value :=  'BAIXA TOTAL'
            Else
              If (ZQCP_INTELICPAGAMENTO.Value = 0) and  (ZQCP_INTELICVLRPAGO.Value < ZQCP_INTELICVALOR.Value) Then
                QCP_ImportaIND_SITUACAO.Value :=  'BAIXA PARCIAL'
              Else
                QCP_ImportaIND_SITUACAO.Value :=  'ABERTO';
                //ShowMessage('Tipo de Baixa não prevista!'+ IntToStr(ZQCP_INTELICCODIGO.Value));

          QCP_ImportaVAL_INDEXADO.value := 0;
          QCP_ImportaCOD_DEPARTAMENTO.value := 1;
          QCP_ImportaCOD_FINALIDADE.Value := 2; //pgto de fornecedores

          QCP_Importa.Post;
        End;
      Except
        If QCP_Importa.State = dsInsert Then
          QCP_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      ZQCP_INTELIC.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn27Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    QCP_CemapaBaixa.Open;
    QCPMov_Importa.Open;
    QCP_CemapaBaixa.First;
    PB.Max := QCP_CemapaBaixa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCP_CemapaBaixa.Eof do
    Begin
      If QCP_CemapaBaixaCOD_CADASTRO.Value = 0 Then
       Begin
         QCP_CemapaBaixa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCP_CemapaBaixaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCP_CemapaBaixaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCP_CemapaBaixaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCP_CemapaBaixaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCPMov_Importa.Insert;
          QCPMov_ImportaCOD_CONTA_PAGAR_MOV.Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
          QCPMov_ImportaCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCab);
          QCPMov_ImportaDT_MOVIMENTO.Text := QCP_CemapaBaixaDT_BAIXA.Text;
          QCPMov_ImportaVAL_MOVIMENTO.Value := QCP_CemapaBaixaVAL_ORIGINAL.Value;
          QCPMov_ImportaIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
          QCPMov_ImportaDESC_OBSERVACAO.Value := QCP_CemapaBaixaDESC_OBSERVACAO.Value;
          QCPMov_ImportaDT_USUARIO.Value := date;
          QCPMov_ImportaCOD_USUARIO.Value := 1;

         QCPMov_Importa.Post;
        End;
      Except
        If QCPMov_Importa.State = dsInsert Then
          QCPMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCP_CemapaBaixa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;


procedure TFImportaDados.BitBtn28Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo : integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasReceberFirebird do
  Begin
    ZQCR_INTELIC.Open;
    QCR_Importa.Open;
    ZQCR_INTELIC.First;
    PB.Max := ZQCR_INTELIC.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCR_INTELIC.Eof do
    Begin
      Try
        if ZQCR_INTELICNUMERO_NOTA.Value <> '' then
        begin
          wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(ZQCR_INTELICCODCLI.Value)
                                   +' AND NUM_TITULO = '+ (ZQCR_INTELICNUMERO_NOTA.Value) //FloatToStr(wNumTitulo)
                                   +' AND NUM_PARCELA = '+ copy(ZQCR_INTELICPARCELA.value,1,1)
                                   +' AND DESC_TIPO_DOCUMENTO = ' + QuotedStr('DP'));
        end;
        IF wCab = '' Then
        //IF (DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + ZQCR_INTELICCODCLI.Text) <> '') Then
        if ZQCR_INTELICCODCLI.Text <> '' then
        Begin
          QCR_Importa.Insert;
          QCR_ImportaCOD_CONTA_RECEBER_CAB.value := DmOracle.Sequencia('CONTA_RECEBER');
          //QCP_ImportaCOD_CONTA_RECEBER_CAB.value := ZQCR_INTELICCODIGO.Value;
          QCR_ImportaCOD_FINALIDADE.value := 1;
          QCR_ImportaCOD_CADASTRO.value := Trunc(ZQCR_INTELICCODCLI.value);
          QCR_ImportaCOD_FILIAL.value := ZQCR_INTELICFILIAL.value;
          if (ZQCR_INTELICNUMERO_NOTA.Value = '') or (ZQCR_INTELICNUMERO_NOTA.Value = '0') then
          begin
             inc(wNumTitulo);
             QCR_ImportaNUM_TITULO.Value := wNumTitulo;
          end
          else
          begin
            QCR_ImportaNUM_TITULO.value := StrToInt(ZQCR_INTELICNUMERO_NOTA.Value);
          end;

          QCR_ImportaNUM_PARCELA.value := StrToInt(copy(ZQCR_INTELICPARCELA.value,1,1));
          QCR_ImportaDESC_TIPO_DOCUMENTO.value := 'DP';
          QCR_ImportaDT_EMISSAO.Value := ZQCR_INTELICCOMPETE.Value;
          QCR_ImportaDT_VENCIMENTO.Value := ZQCR_INTELICVENCIMENTO.Value;
          QCR_ImportaDT_BAIXA.Value := ZQCR_INTELICPAGAMENTO.Value;
          QCR_ImportaDT_MOVIMENTO.Value := ZQCR_INTELICCOMPETE.Value;
          QCR_ImportaDT_CAPITALIZACAO.Text := ZQCR_INTELICCOMPETE.Text;
          QCR_ImportaVAL_ORIGINAL.Value := ZQCR_INTELICVALOR.Value;
          QCR_ImportaVAL_TITULO.value := (ZQCR_INTELICVALOR.Value + ZQCR_INTELICVALOR_MORA_PAGO.Value + ZQCR_INTELICVALOR_MULTA_PAGO.Value) -
                                              ZQCR_INTELICVALOR_DESCONTO_CONCEDIDO.Value;
          QCR_ImportaDESC_OBSERVACAO.value := ZQCR_INTELICCONTA.value;
          QCR_ImportaIND_ACEITE.value := 'S';
          if ZQCR_INTELICPAGA.Value = 'N' then
            QCR_ImportaIND_SITUACAO.Value := 'ABERTO'
          else
          if ZQCR_INTELICPAGA.Value = 'S' then
            QCR_ImportaIND_SITUACAO.Value := 'BAIXA TOTAL';

{          If ZQCR_INTELICPAGAMENTO.Value = 0 Then
            QCP_ImportaIND_SITUACAO.Value :=  'ABERTO'
          Else
            If (ZQCP_INTELICVLRPAGO.Value) >= (ZQCP_INTELICVALOR.Value) Then
              QCP_ImportaIND_SITUACAO.Value :=  'BAIXA TOTAL'
            Else
              If (ZQCP_INTELICPAGAMENTO.Value = 0) and  (ZQCP_INTELICVLRPAGO.Value < ZQCP_INTELICVALOR.Value) Then
                QCP_ImportaIND_SITUACAO.Value :=  'BAIXA PARCIAL'
              Else
                QCP_ImportaIND_SITUACAO.Value :=  'ABERTO';
                //ShowMessage('Tipo de Baixa não prevista!'+ IntToStr(ZQCP_INTELICCODIGO.Value)); }
          QCR_ImportaPERC_COMISSAO.Value := 0;
          QCR_ImportaPERC_COMISSAO1.Value := 0;
          QCR_ImportaCOD_DEPARTAMENTO.value := 1;
          QCR_ImportaCOD_FINALIDADE.Value := 1; //rec. duplicata

          QCR_Importa.Post;
        End;
      Except
        If QCR_Importa.State = dsInsert Then
          QCR_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      ZQCR_INTELIC.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn29Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    //TCP_Mov.Open;
    QCR_Cemapa.Open;
    QCRMov_Importa.Open;
    QCR_Cemapa.First;
    PB.Max := QCR_Cemapa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCR_Cemapa.Eof do
    Begin
      If QCR_CemapaCOD_CADASTRO.Value = 0 Then
       Begin
         QCR_Cemapa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCR_CemapaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCR_CemapaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCR_CemapaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCR_CemapaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCRMov_Importa.Insert;
          QCRMov_ImportaCOD_CONTA_RECEBER_MOV.Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          QCRMov_ImportaCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCab);
          QCRMov_ImportaDT_MOVIMENTO.Text := QCR_CemapaDT_MOVIMENTO.Text;
          QCRMov_ImportaVAL_MOVIMENTO.Value := QCR_CemapaVAL_ORIGINAL.Value;
          QCRMov_ImportaIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
          QCRMov_ImportaDESC_OBSERVACAO.Value := QCR_CemapaDESC_OBSERVACAO.Value;
          QCRMov_ImportaDT_USUARIO.Value := date;
          QCRMov_ImportaCOD_USUARIO.Value := 1;

          QCRMov_Importa.Post;
        End;
      Except
        If QCRMov_Importa.State = dsInsert Then
          QCRMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCR_Cemapa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn30Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    QCR_CemapaBaixa.Open;
    QCRMov_Importa.Open;
    QCR_CemapaBaixa.First;
    PB.Max := QCR_CemapaBaixa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCR_CemapaBaixa.Eof do
    Begin
      If QCR_CemapaBaixaCOD_CADASTRO.Value = 0 Then
       Begin
         QCR_CemapaBaixa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCR_CemapaBaixaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCR_CemapaBaixaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCR_CemapaBaixaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCR_CemapaBaixaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCRMov_Importa.Insert;
          QCRMov_ImportaCOD_CONTA_RECEBER_MOV.Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          QCRMov_ImportaCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCab);
          QCRMov_ImportaDT_MOVIMENTO.Text := QCR_CemapaBaixaDT_BAIXA.Text;
          QCRMov_ImportaVAL_MOVIMENTO.Value := QCR_CemapaBaixaVAL_ORIGINAL.Value;
          QCRMov_ImportaIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
          QCRMov_ImportaDESC_OBSERVACAO.Value := QCR_CemapaBaixaDESC_OBSERVACAO.Value;
          QCRMov_ImportaDT_USUARIO.Value := date;
          QCRMov_ImportaCOD_USUARIO.Value := 1;

          QCRMov_Importa.Post;
        End;
      Except
        If QCRMov_Importa.State = dsInsert Then
          QCRMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCR_CemapaBaixa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn31Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
    query: TOracleDataSet1;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQTabelaPrecoIntelitec.Close;
    ZQTabelaPrecoIntelitec.Open;
    QTabelaPreco.Open;

    while not ZQTabelaPrecoIntelitec.Eof do
    begin
      try
        // Feito para quando a importação possui muitos produtos
          // Estava dando out of memory
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QTabelaPreco.Variables;
          query.Close;
          query.SQL := QTabelaPreco.SQL;
          query.Open;

          query.Insert;
          query.FieldByName('COD_TABELA_PRECO_ITEM').Value := wAux;
          query.FieldByName('COD_TABELA_PRECO_CAB').Value := ZQTabelaPrecoIntelitecCODIGO_LISTA_PRECO.Value;
          query.FieldByName('COD_PRODUTO').Value  := ZQTabelaPrecoIntelitecCODIGO_MERCADORIAS.Value;
          query.FieldByName('VAL_PRECO').Value    := ZQTabelaPrecoIntelitecPRECO_FINAL.Value;
          query.Post;
{        QTabelaPreco.Insert;
        QTabelaPrecoCOD_TABELA_PRECO_CAB.Value := ZQTabelaPrecoIntelitecCODIGO_LISTA_PRECO.Value;
        QTabelaPrecoCOD_PRODUTO.Value := ZQTabelaPrecoIntelitecCODIGO_MERCADORIAS.Value;
        QTabelaPrecoVAL_PRECO.Value := ZQTabelaPrecoIntelitecPRECO_FINAL.Value;
        QTabelaPreco.Post;}

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid31.Refresh;
        query.Free;
        query := nil;
      Except
        If query.State = dsInsert Then
            query.Cancel;
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
//        queryP.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);

        ZQTabelaPrecoIntelitec.Next;
      end;
      ZQTabelaPrecoIntelitec.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn32Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQMarcaAtenas.Close;
    ZQMarcaAtenas.Open;
    QMarcaImporta.Open;

    while not ZQMarcaAtenas.Eof do
    begin
      try
        QMarcaImporta.Insert;
        QMarcaImportaCOD_MARCA.Value := wAux;
        QMarcaImportaDESC_MARCA.Value := bib.RemoveAcentos(UpperCase(ZQMarcaAtenasDESC_MARCA.Value));
        QMarcaImporta.Post;
        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid32.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QMarcaImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQMarcaAtenas.Next;
      end;
      ZQMarcaAtenas.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn33Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse: string;
exec: TExecutador;
queryP : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin

    with DMProdutoFirebird, DMImportaDados do
    begin

      QEstoque.Open;
      ZQEstoqueAtenas.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQEstoqueAtenas.First;

      wCont := 0;
      While not ZQEstoqueAtenas.Eof do
      Begin
        Try
          queryP := TOracleDataSet1.Create(nil);
          queryP.Session := DMOracle.DBCemapa;
          queryP.Variables := QEstoque.Variables;
          queryP.Close;
          queryP.SQL := QEstoque.SQL;
          queryP.Open;
          queryP.Insert;

          QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');
          if ZQEstoqueAtenasCOD_FILIAL.AsString <> '' then
            queryP.FieldByName('COD_FILIAL').Value    := ZQEstoqueAtenasCOD_FILIAL.Value
          else
            queryP.FieldByName('COD_FILIAL').Value    := 1;
          queryP.FieldByName('COD_PRODUTO').Value   := ZQEstoqueAtenasCOD_PRODUTO.Value;
          queryP.FieldByName('COD_LOTE_TIPO').Value :=  1;
          queryP.FieldByName('QT_QUANTIDADE').Value :=  0;//ZQEstoqueAtenasQDE_ESTOQUE.Value;
          queryP.FieldByName('VL_CUSTO_MEDIO').Value :=  ZQEstoqueAtenasVAL_CUSTO.Value;
          queryP.FieldByName('VL_ULTIMO_CUSTO').Value := ZQEstoqueAtenasVAL_CUSTO.Value;
          queryP.Post;

        Except
          Inc(wRegNaoImp);
          If queryP.State = dsInsert Then
            queryP.Cancel;
        End;
        queryP.Free;
        queryP := nil;
        ZQEstoqueAtenas.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn34Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse: string;
exec: TExecutador;
queryP : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin

    with DMCadastroFirebird, DMImportaDados do
    begin
      QReceituarioOtico.Open;
      ZQReceituarioOtico.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQReceituarioOtico.First;

      wCont := 0;
      While not ZQReceituarioOtico.Eof do
      Begin
        Try
          queryP := TOracleDataSet1.Create(nil);
          queryP.Session := DMOracle.DBCemapa;
          queryP.Variables := QReceituarioOtico.Variables;
          queryP.Close;
          queryP.SQL := QReceituarioOtico.SQL;
          queryP.Open;
          queryP.Insert;
          queryP.FieldByName('COD_RECEITUARIO_OPTICO').Value  := ZQReceituarioOticoCOD_RECEITUARIO_OTICA.Value;
          queryP.FieldByName('COD_CADASTRO').Value            :=  ZQReceituarioOticoCOD_CLIENTE.Value;
          queryP.FieldByName('VAL_LONGE_OD_ESFERICO').Value   := ZQReceituarioOticoVLR_OD_ESFERICO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OE_ESFERICO').Value   := ZQReceituarioOticoVLR_OE_ESFERICO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OD_CILINDRICO').Value := ZQReceituarioOticoVLR_OD_CILINDRICO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OE_CILINDRICO').Value := ZQReceituarioOticoVLR_OE_CILINDRICO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OD_EIXO').Value       := ZQReceituarioOticoVLR_OD_EIXO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OE_EIXO').Value       := ZQReceituarioOticoVLR_OE_EIXO_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OD_DP').Value         := ZQReceituarioOticoVLR_OD_DP_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OE_DP').Value         := ZQReceituarioOticoVLR_OE_DP_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OD_ALTURA').Value     := ZQReceituarioOticoVLR_OD_ALTURA_LONGE.Value;
          queryP.FieldByName('VAL_LONGE_OE_ALTURA').Value     := ZQReceituarioOticoVLR_OE_ALTURA_LONGE.Value;
          queryP.FieldByName('VAL_PERTO_OD_ESFERICO').Value   := ZQReceituarioOticoVLR_OD_ESFERICO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OE_ESFERICO').Value   := ZQReceituarioOticoVLR_OE_ESFERICO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OD_CILINDRICO').Value := ZQReceituarioOticoVLR_OD_CILINDRICO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OE_CILINDRICO').Value := ZQReceituarioOticoVLR_OE_CILINDRICO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OD_EIXO').Value       := ZQReceituarioOticoVLR_OD_EIXO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OE_EIXO').Value       := ZQReceituarioOticoVLR_OE_EIXO_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OD_DP').Value         := ZQReceituarioOticoVLR_OD_DP_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OE_DP').Value         := ZQReceituarioOticoVLR_OE_DP_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OD_ALTURA').Value     := ZQReceituarioOticoVLR_OD_ALTURA_PERTO.Value;
          queryP.FieldByName('VAL_PERTO_OE_ALTURA').Value     := ZQReceituarioOticoVLR_OE_ALTURA_PERTO.Value;

          queryP.FieldByName('DESC_MEDICO').Value := ZQReceituarioOticoDESC_MEDICO.Value;
          if (ZQReceituarioOticoDT_EMISSAO.AsString) <> '' then
            queryP.FieldByName('DT_CONSULTA').AsDateTime := StrToDate(ZQReceituarioOticoDT_EMISSAO.Text);
          queryP.FieldByName('DESC_OBS').Value := ZQReceituarioOticoDESC_OBSERVACAO.Value;
          queryP.Post;
        Except
          Inc(wRegNaoImp);
          If queryP.State = dsInsert Then
            queryP.Cancel;
        End;
        queryP.Free;
        queryP := nil;
        ZQReceituarioOtico.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn35Click(Sender: TObject);
var S: String;
    F: TextFile;
    mContador: integer;
    cod_nota_cab, wNum_nota, wReceituario : integer;

begin
//    cod_nota_cab :='0';
   cod_nota_cab := 1;
   wNum_nota := 1;
  //S:= '';  // Inicializa valor da variavel.
    with DMImportaDados, DMNotaSaidaFirebird do
    begin
      ZQHistoricoReceituario.Close;
      ZQHistoricoReceituario.Open;
      QNotaCabImporta.Close;
      QNotaItemImporta.Close;
      QNotaCabImporta.Open;
      QNotaItemImporta.Open;
      showMessage(IntToStr(ZQHistoricoReceituario.RecordCount));
      mContador:=0;
      try
      dmoracle.DBCemapa.startTransaction;
      ZQHistoricoReceituario.First;
      while not ZQHistoricoReceituario.Eof do
      begin
          //showMessage(IntToStr(ZQHistoricoReceituario.RecordCount));
          QNotaCabImporta.Insert;
          QNotaItemImportaCOD_NOTA_CAB.Value := DmOracle.Sequencia('COD_NOTA_CAB');
          QNotaCabImportaCOD_USUARIO.Value  := 1;
          QNotaCabImportaCOD_FILIAL.Value   := ZQHistoricoReceituarioCOD_FILIAL.Value;
          QNotaCabImportaCOD_OPERACAO.Value := 3;
          QNotaCabImportaCOD_ESTADO.Value   := 'PR';
          QNotaCabImportaCOD_VENDEDOR.Value := 1;//FUNCIONÁRIO
          QNotaCabImportaCOD_CADASTRO.Text  := ZQHistoricoReceituarioCOD_CLIENTE.Text;
          QNotaCabImportaNUM_NOTA.Value     := wNum_nota ;
          QNotaCabImportaCOD_SERIE.Value    := 'REC';
          QNotaCabImportaCOD_SERIE_MODELO.Value := '99' ;
          QNotaCabImportaIND_SITUACAO.Value := '2';
          QNotaCabImportaIND_CONDICAO_PAGTO.Value:= '3';
          QNotaCabImportaDT_EMISSAO.Value        := ZQHistoricoReceituarioDT_EMISSAO.Value;
          QNotaCabImportaDT_MOVIMENTO.Value      := ZQHistoricoReceituarioDT_EMISSAO.Value;
          QNotaCabImportaDT_RECEBIMENTO.Value    := ZQHistoricoReceituarioDT_EMISSAO.Value;
          QNotaCabImportaIND_ENTRADA_SAIDA.Value := 'S';
          QNotaCabImportaOBS.Value               := 'HISTÓRICO IMPORTADO - ' + ZQHistoricoReceituarioDESC_OBSERVACAO.Value;
          QNotaCabImportaDT_USUARIO.Value        := ZQHistoricoReceituarioDT_EMISSAO.Value;
          QNotaCabImportaCOD_DEPARTAMENTO.Value  := 1;
          QNotaCabImportaCOD_RECEITUARIO_OPTICO.Value := ZQHistoricoReceituarioCOD_RECEITUARIO_OTICA.Value;
          QNotaCabImportaVAL_DESPESAS.Value      := 0;
          QNotaCabImportaVAL_FRETE.Value         := 0;
          QNotaCabImportaVAL_ICM_FRETE.Value     := 0;
          QNotaCabImportaVAL_ICM_BASE_FRETE.Value:= 0;
          QNotaCabImportaVAL_FUNRURAL.Value      := 0;
          QNotaCabImportaPERC_COMISSAO.Value     := 0;
          QNotaCabImporta.Post;
          //----------------inicio da gravacao da tabela tb_nota_item
          While (ZQHistoricoReceituarioCOD_RECEITUARIO_OTICA.Value = QNotaCabImportaCOD_RECEITUARIO_OPTICO.Value) and
                 (not ZQHistoricoReceituario.Eof) do
          begin
            QNotaItemImporta.Insert;
            QNotaItemImportaCOD_NOTA_CAB.Value  := QNotaCabImportaCOD_NOTA_CAB.Value;
            QNotaItemImportaCOD_PRODUTO.Value   := ZQHistoricoReceituarioCOD_PRODUTO.Value;
            QNotaItemImportaCOD_TRIBUTACAO.Value:= 1;
            QNotaItemImportaQT_QUANTIDADE.Value := ZQHistoricoReceituarioQDE_PRODUTO.Value;
            QNotaItemImportaVAL_TOTAL.Value     := ZQHistoricoReceituarioVLR_PRODUTO.Value;
            QNotaItemImportaCOD_LOTE_TIPO.Value := 1;
            QNotaItemImportaVAL_DESCONTO.Value  := ZQHistoricoReceituarioVLR_DESCONTO.Value;
            QNotaItemImportaVAL_UNITARIO.Value  := ZQHistoricoReceituarioVLR_PRODUTO.Value;
            QNotaItemImportaPERC_IPI.Value      := 0;
            QNotaItemImportaPERC_COMISSAO.Value := 0;
            QNotaItemImportaVAL_DESPESAS.Value  := 0;
            QNotaItemImportaVAL_FRETE.Value     := 0;
            QNotaItemImportaPERC_DESCONTO.Value := 0;
            QNotaItemImportaVAL_IPI.Value       := 0;
            QNotaItemImportaVAL_ICM_BASE.Value  := 0;
            QNotaItemImportaVAL_ICM.Value       := 0;
            QNotaItemImportaVAL_CUSTO.Value     := 0;
            QNotaItemImportaVAL_ISS.Value       := 0;
            QNotaItemImportaIND_CLASS_IPI.Value := '5';
            QNotaItemImporta.Post;
            ZQHistoricoReceituario.Next;
            dmoracle.DBCemapa.commit;
          end;

        Inc(cod_nota_cab);
        Inc(wNum_Nota);
        mContador:=mContador+1;
        MEImp.Text :=  IntToStr(mContador);
        MEImp.Refresh;
      end;// fim do while
      dmoracle.DBCemapa.commit;
      ShowMessage('Notas Importadas com Exito');
      except
        dmoracle.dbcemapa.rollback;
        ShowMessage('Erro no Arquivo de exportação, nenhuma NF foi Importada.');
      end;
    end;
end;

procedure TFImportaDados.BitBtn36Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo : integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasReceberFirebird do
  Begin
    ZQCR_Atenas.Open;
    QCR_Importa.Open;
    QCRMov_Importa.Open;
    ZQCR_Atenas.First;
    PB.Max := ZQCR_Atenas.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := 500000;
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCR_Atenas.Eof do
    Begin
      Try
        {if ZQCR_INTELICNUMERO_NOTA.Value <> '' then
        begin
          wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(ZQCR_INTELICCODCLI.Value)
                                   +' AND NUM_TITULO = '+ (ZQCR_INTELICNUMERO_NOTA.Value) //FloatToStr(wNumTitulo)
                                   +' AND NUM_PARCELA = '+ copy(ZQCR_INTELICPARCELA.value,1,1)
                                   +' AND DESC_TIPO_DOCUMENTO = ' + QuotedStr('DP'));
        end;
        IF wCab = '' Then
        //IF (DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + ZQCR_INTELICCODCLI.Text) <> '') Then}
        if ZQCR_AtenasCOD_CADASTRO.Text <> '' then
        Begin
          QCR_Importa.Insert;
          QCR_ImportaCOD_CONTA_RECEBER_CAB.value := ZQCR_AtenasCOD_CONTA_RECEBER_CAB.Value;
          QCR_ImportaCOD_FILIAL.value     := 1;
          QCR_ImportaCOD_FINALIDADE.value := 1;
          QCR_ImportaCOD_CADASTRO.value   := Trunc(ZQCR_AtenasCOD_CADASTRO.value);
          if (ZQCR_AtenasNUM_TITULO.Text = '') or (ZQCR_AtenasNUM_TITULO.Value = 0) then
          begin
            Inc(wNumTitulo);
            QCR_ImportaNUM_TITULO.Value := wNumTitulo;
          end
          else
            QCR_ImportaNUM_TITULO.Value := ZQCR_AtenasNUM_TITULO.Value;
          {if Pos('/', ZQCR_AtenasNUM_TITULO.Value) > 0 then
            QCR_ImportaNUM_TITULO.Value     := StrToFloat(Copy(ZQCR_AtenasNUM_TITULO.Value,1, Pos('/', ZQCR_AtenasNUM_TITULO.Value)-1))
          else
          begin
            if Bib.LimpaNumero(ZQCR_AtenasNUM_TITULO.Text)  = '' then
            begin
              inc(wNumTitulo);
              QCR_ImportaNUM_TITULO.Value := wNumTitulo;
            end
            else
            begin
              QCR_ImportaNUM_TITULO.value := StrToInt(bib.LimpaString(ZQCR_AtenasNUM_TITULO.Value,','));
            end;
          end;}

          QCR_ImportaNUM_PARCELA.Text     := ZQCR_AtenasNUM_PARCELA.Text;
          QCR_ImportaDESC_TIPO_DOCUMENTO.value := 'DP';
          QCR_ImportaDT_EMISSAO.Value      := ZQCR_AtenasDT_EMISSAO.Value;
          QCR_ImportaDT_VENCIMENTO.Value   := ZQCR_AtenasDT_VENCIMENTO.Value;
          QCR_ImportaDT_BAIXA.Value        := ZQCR_AtenasDT_PAGAMENTO.Value;
          QCR_ImportaDT_MOVIMENTO.Value    := ZQCR_AtenasDT_EMISSAO.Value;
          QCR_ImportaDT_CAPITALIZACAO.Value := ZQCR_AtenasDT_EMISSAO.Value;
          QCR_ImportaVAL_ORIGINAL.Value := ZQCR_AtenasVAL_ORIGINAL.Value;
          QCR_ImportaVAL_TITULO.value := ZQCR_AtenasVAL_TITULO.Value;
          QCR_ImportaDESC_OBSERVACAO.value := ZQCR_AtenasDESC_OBSERVACAO.Value;
          if ZQCR_AtenasVAL_TITULO.Value = 0 then
            QCR_ImportaIND_SITUACAO.Value := 'BAIXA TOTAL'
          else
            QCR_ImportaIND_SITUACAO.Value := 'ABERTO';
          QCR_ImportaIND_ACEITE.value := 'S';
          QCR_ImportaPERC_COMISSAO.Value := 0;
          QCR_ImportaPERC_COMISSAO1.Value := 0;
          QCR_ImportaCOD_DEPARTAMENTO.value := 1;

          QCR_Importa.Post;
          //INICIO - TESTE MOVIMENTO
          QCRMov_Importa.Insert;
          QCRMov_ImportaCOD_CONTA_RECEBER_MOV.Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          QCRMov_ImportaCOD_CONTA_RECEBER_CAB.Value := ZQCR_AtenasCOD_CONTA_RECEBER_CAB.Value;
          QCRMov_ImportaDT_MOVIMENTO.Text := ZQCR_AtenasDT_EMISSAO.Text;
          QCRMov_ImportaVAL_MOVIMENTO.Value := ZQCR_AtenasVAL_ORIGINAL.Value;
          QCRMov_ImportaIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
          QCRMov_ImportaDT_USUARIO.Value := date;
          QCRMov_ImportaCOD_USUARIO.Value := 1;
          QCRMov_Importa.Post;
          //FIM - TESTE MOVIMENTO 
        End;
      Except
        If QCR_Importa.State = dsInsert Then
          QCR_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      ZQCR_Atenas.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn2Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasReceberFirebird do
  Begin
    ZQCRMOV_Atenas.Open;
    QCRMov_Importa.Open;
    ZQCRMOV_Atenas.First;
    PB.Max := ZQCRMOV_Atenas.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCRMOV_Atenas.Eof do
    Begin
      Try
        {wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCR_CemapaBaixaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCR_CemapaBaixaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCR_CemapaBaixaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCR_CemapaBaixaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then}
        Begin
          QCRMov_Importa.Insert;
          QCRMov_ImportaCOD_CONTA_RECEBER_MOV.Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          QCRMov_ImportaCOD_CONTA_RECEBER_CAB.Value := ZQCRMOV_AtenasCOD_CONTA_RECEBER_CAB.Value;
          QCRMov_ImportaDT_MOVIMENTO.Value := ZQCRMOV_AtenasDT_MOVIMENTO.Value;
          QCRMov_ImportaVAL_MOVIMENTO.Value := ZQCRMOV_AtenasVAL_MOVIMENTO.Value;
          QCRMov_ImportaIND_TIPO_MOVIMENTO.Value := ZQCRMOV_AtenasIND_TIPO_MOVIMENTO.Value;
          QCRMov_ImportaDT_USUARIO.Value := date;
          QCRMov_ImportaCOD_USUARIO.Value := 1;
          QCRMov_Importa.Post;
        End;
      Except
        If QCRMov_Importa.State = dsInsert Then
          QCRMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      ZQCRMOV_Atenas.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn37Click(Sender: TObject);
var S: String;
    F: TextFile;
    mContador: integer;
    cod_nota_cab, wNum_nota, wReceituario : integer;

begin
  cod_nota_cab := 1;
  wNum_nota := 1;
  with DMImportaDados, DMNotaSaidaFirebird do
  begin
    ZQNota_Atenas.Close;
    ZQNota_Atenas.Open;
    QNotaCabImporta.Close;
    QNotaItemImporta.Close;
    QNotaCabImporta.Open;
    QNotaItemImporta.Open;
   // showMessage(IntToStr(ZQNota_Atenas.RecordCount));
    mContador:=0;
    try
    dmoracle.DBCemapa.startTransaction;
    ZQNota_Atenas.First;
    while not ZQNota_Atenas.Eof do
    begin
      //showMessage(IntToStr(ZQHistoricoReceituario.RecordCount));
      QNotaCabImporta.Insert;
      QNotaItemImportaCOD_NOTA_CAB.Value := DmOracle.Sequencia('COD_NOTA_CAB');
      QNotaCabImportaCOD_USUARIO.Value  := 1;
      QNotaCabImportaCOD_FILIAL.Value   := ZQNota_AtenasCOD_FILIAL.Value;
      QNotaCabImportaCOD_OPERACAO.Value := 18; //CRIADO OPERAÇÃO PARA SEPARAR O QUE É IMPORTADO COM O AS VENDAS NORMAIS.
      QNotaCabImportaCOD_ESTADO.Value   := 'PR';
      QNotaCabImportaCOD_VENDEDOR.Value := 1;//FUNCIONÁRIO
      QNotaCabImportaCOD_CADASTRO.Text  := ZQNota_AtenasCOD_CADASTRO.Text;
      QNotaCabImportaNUM_NOTA.Value     := ZQNota_AtenasCOD_NOTA_CAB.Value;
      QNotaCabImportaCOD_SERIE.Value    := 'IMP';
      QNotaCabImportaCOD_SERIE_MODELO.Value := '99' ;
      QNotaCabImportaIND_SITUACAO.Value := '2';
      if ZQNota_AtenasIND_CONDICAO_PAGTO.Text = 'A VISTA' then
        QNotaCabImportaIND_CONDICAO_PAGTO.Value := '1'
      else if ZQNota_AtenasIND_CONDICAO_PAGTO.Text = 'A PRAZO' then
        QNotaCabImportaIND_CONDICAO_PAGTO.Value := '2'
      else
        QNotaCabImportaIND_CONDICAO_PAGTO.Value := '3';
      QNotaCabImportaDT_EMISSAO.Value        := ZQNota_AtenasDT_EMISSAO.Value;
      if ZQNota_AtenasDT_SAIDA.Text = '' then
      begin
        QNotaCabImportaDT_MOVIMENTO.Value      := ZQNota_AtenasDT_EMISSAO.Value;
        QNotaCabImportaDT_RECEBIMENTO.Value    := ZQNota_AtenasDT_EMISSAO.Value;
      end
      else
      begin
        QNotaCabImportaDT_MOVIMENTO.Value      := ZQNota_AtenasDT_SAIDA.Value;
        QNotaCabImportaDT_RECEBIMENTO.Value    := ZQNota_AtenasDT_SAIDA.Value;
      end;
      QNotaCabImportaIND_ENTRADA_SAIDA.Value := 'S';
      QNotaCabImportaVAL_AVISTA.Value        := ZQNota_AtenasVAL_ENTRADA.Value;
      QNotaCabImportaOBS.Value               := 'NOTA IMP. SISTEMA ANTIGO - ' + ZQNota_AtenasDESC_OBSERVACAO.Value;
      QNotaCabImportaDT_USUARIO.Value        := ZQNota_AtenasDT_EMISSAO.Value;
      QNotaCabImportaCOD_DEPARTAMENTO.Value  := 1;
      QNotaCabImportaVAL_DESPESAS.Value      := 0;
      QNotaCabImportaVAL_FRETE.Value         := ZQNota_AtenasVAL_DESPESAS.Value;
//      QNotaCabImportaVAL_DESCONTO.Value      := ZQNota_AtenasVAL_DESCONTO.Value;
      QNotaCabImportaVAL_ICM_FRETE.Value     := 0;
      QNotaCabImportaVAL_ICM_BASE_FRETE.Value:= 0;
      QNotaCabImportaVAL_FUNRURAL.Value      := 0;
      QNotaCabImportaPERC_COMISSAO.Value     := 0;
      QNotaCabImporta.Post;
      //----------------inicio da gravacao da tabela tb_nota_item
      While (ZQNota_AtenasCOD_NOTA_CAB.Value = QNotaCabImportaNUM_NOTA.Value) and
         (not ZQNota_Atenas.Eof) do
      begin
        QNotaItemImporta.Insert;
        QNotaItemImportaCOD_NOTA_CAB.Value  := QNotaCabImportaCOD_NOTA_CAB.Value;
        QNotaItemImportaCOD_PRODUTO.Value   := ZQNota_AtenasCOD_PRODUTO.Value;
        QNotaItemImportaCOD_TRIBUTACAO.Value:= 1;
        QNotaItemImportaQT_QUANTIDADE.Value := ZQNota_AtenasQT_QUANTIDADE.Value;
        QNotaItemImportaVAL_TOTAL.Value     := ZQNota_AtenasVAL_TOTAL_ITEM.Value;
        QNotaItemImportaCOD_LOTE_TIPO.Value := 1;
        if ZQNota_AtenasVAL_DESCONTO_ITEM.Value > 0 then
          QNotaItemImportaVAL_DESCONTO.Value  := ZQNota_AtenasVAL_DESCONTO_ITEM.Value / ZQNota_AtenasQT_QUANTIDADE.Value 
        else
          QNotaItemImportaVAL_DESCONTO.Value  := ZQNota_AtenasVAL_DESCONTO_ITEM.Value;
        QNotaItemImportaVAL_UNITARIO.Value  := ZQNota_AtenasVAL_UNITARIO.Value;
        QNotaItemImportaPERC_IPI.Value      := 0;
        QNotaItemImportaPERC_COMISSAO.Value := 0;
        QNotaItemImportaVAL_DESPESAS.Value  := 0;
        QNotaItemImportaVAL_FRETE.Value     := 0;
        QNotaItemImportaPERC_DESCONTO.Value := 0;
        QNotaItemImportaVAL_IPI.Value       := 0;
        QNotaItemImportaVAL_ICM_BASE.Value  := 0;
        QNotaItemImportaVAL_ICM.Value       := 0;
        QNotaItemImportaVAL_CUSTO.Value     := 0;
        QNotaItemImportaVAL_ISS.Value       := 0;
        QNotaItemImportaIND_CLASS_IPI.Value := '5';
        QNotaItemImporta.Post;
        ZQNota_Atenas.Next;
        dmoracle.DBCemapa.commit;
      end;
//      Inc(cod_nota_cab);
//      Inc(wNum_Nota);
      mContador:=mContador+1;
      MEImp.Text :=  IntToStr(mContador);
      MEImp.Refresh;
    end;// fim do while
    dmoracle.DBCemapa.commit;
    ShowMessage('Notas Importadas com Exito');
    except
      dmoracle.dbcemapa.rollback;
      ShowMessage('Erro no Arquivo de exportação, nenhuma NF foi Importada.');
    end;
  end;
end;

procedure TFImportaDados.BitBtn38Click(Sender: TObject);
var wImp, wNaoImp, wAux, wInd: Integer;
    query: TOracleDataSet1;
    wCodVendedor : String;
    wFone, wFoneCompleto : String;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMVendedorFirebird, DMImportaDados do
  begin
    ZQVendedorRetifoz.Close;
    ZQVendedorRetifoz.Open;
    QVendedor.Open;
    while not ZQVendedorRetifoz.Eof do
    begin
      try
          // Feito para quando a importação possui muitos produtos
          // Estava dando out of memory
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QVendedor.Variables;
          query.Close;
          query.SQL := QVendedor.SQL;
          query.Open;
          wCodVendedor := DMOracle.FastSelect('COD_VENDEDOR','TB_VENDEDOR','COD_VENDEDOR = ' + ZQVendedorRetifozCOD_VENDEDOR.AsString);
          if wCodVendedor = '' then
          begin
            query.Insert;

            query.FieldByName('COD_VENDEDOR').Value := ZQVendedorRetifozCOD_VENDEDOR.Value;
            query.FieldByName('NOME').Value         := ZQVendedorRetifozNOME.Value;
            query.FieldByName('IND_SITUACAO').Value := ZQVendedorRetifozIND_SITUACAO.Value;
            query.FieldByName('DESC_ENDERECO').Value:= bib.RemoveAcentos(ZQVendedorRetifozDESC_ENDERECO.Value);
            query.FieldByName('DESC_BAIRRO').Value  := bib.RemoveAcentos(ZQVendedorRetifozDESC_BAIRRO.Value);
            query.FieldByName('DESC_CIDADE').Value  := bib.RemoveAcentos(ZQVendedorRetifozDESC_CIDADE.Value);
            query.FieldByName('COD_ESTADO').Value   := ZQVendedorRetifozCOD_ESTADO.Value;
            query.FieldByName('DESC_CEP').Value     := ZQVendedorRetifozDESC_CEP.Value;
            query.FieldByName('DESC_IDENTIDADE').Value := ZQVendedorRetifozDESC_IDENTIDADE.Value;
            query.FieldByName('DESC_CPF').Value    := ZQVendedorRetifozDESC_CPF.Value;
            if ZQVendedorRetifozDT_NASCIMENTO.AsString <> '' then
              query.FieldByName('DT_NASCIMENTO').Value:= ZQVendedorRetifozDT_NASCIMENTO.Value;
            if ZQVendedorRetifozDT_CADASTRO.AsString <> '' then
              query.FieldByName('DT_CADASTRO').Value  := ZQVendedorRetifozDT_CADASTRO.Value
            else
              query.FieldByName('DT_CADASTRO').Value:= date;
            query.FieldByName('DESC_E_MAIL').Value   := ZQVendedorRetifozDESC_EMAIL.Value;
            ZQVendedorFoneRetifoz.Close;
            ZQVendedorFoneRetifoz.ParamByName('COD_VENDEDOR').Value := ZQVendedorRetifozCOD_VENDEDOR.Value;
            ZQVendedorFoneRetifoz.Open;
            while (not ZQVendedorFoneRetifoz.Eof) do
            begin
              if ZQVendedorRetifozCOD_VENDEDOR.Value = ZQVendedorFoneRetifozCOD_VENDEDOR.Value then
              begin
                if ZQVendedorFoneRetifozNOME_CONTATO1.Value <> '' then
                  query.FieldByName('NOME_CONTATO1').Value:= bib.RemoveAcentos(ZQVendedorFoneRetifozNOME_CONTATO1.Value);

                wind := 1;
                wFone := '';
                while wInd <= Length(ZQVendedorFoneRetifozDESC_FONE.Value) do
                begin
                  if (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '0') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '1') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '2') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '3') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '4') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '5') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '6') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '7') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '8') Or
                     (Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1) = '9') Then
                    wFone := wFone + Copy(ZQVendedorFoneRetifozDESC_FONE.Value,wInd,1);
                  Inc(wInd);
                end;
                if Length(wFone) = 8 then
                  wFoneCompleto := '45'+ wFone
                else
                  wFoneCompleto := wFone;
                if ZQVendedorFoneRetifozDESC_TIPO_FONE.Value = 'FIXO' then
                  query.FieldByName('DESC_TELEFONE').Value    := wFoneCompleto//Trim(ZQVendedorFoneRetifozDESC_FONE.Value)
                else if ZQVendedorFoneRetifozDESC_TIPO_FONE.Value = 'FONE DIRETO' then
                  query.FieldByName('NOME_CONTATO2').Value    := wFoneCompleto//Trim(ZQVendedorFoneRetifozDESC_FONE.Value)
                else
                  query.FieldByName('DESC_CELULAR').Value    := wFoneCompleto//Trim(ZQVendedorFoneRetifozDESC_FONE.Value);
                end;
              ZQVendedorFoneRetifoz.Next
            end;
            query.Post;

            Inc(wImp);
            Inc(wAux);
            MEImp.Text := IntToStr(wImp);

            DBGrid34.Refresh;
            query.Free;
            query := nil;
          end;
      Except
        If query.State = dsInsert Then
            query.Cancel;
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
      end;
      ZQVendedorRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn39Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQMarcaRetifoz.Close;
    ZQMarcaRetifoz.Open;
    QMarcaImporta.Open;

    while not ZQMarcaRetifoz.Eof do
    begin
      try
        QMarcaImporta.Insert;
        QMarcaImportaCOD_MARCA.Value := ZQMarcaRetifozCOD_MARCA.Value;
        QMarcaImportaDESC_MARCA.Value := bib.RemoveAcentos(ZQMarcaRetifozDESC_MARCA.Value);
        QMarcaImporta.Post;
        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid32.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QMarcaImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQMarcaRetifoz.Next;
      end;
      ZQMarcaRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn40Click(Sender: TObject);
Var wCont,wRegNaoImp,wInd : Integer;
  wFone, wFoneCompleto: string;
  exec: TExecutador;
  query : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin

    with DMCadastroFirebird, DMImportaDados do
    begin
      ZQCadastroRetifoz.Close;
      ZQCadastroRetifoz.Open;
      QCadastro.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQCadastroRetifoz.First;

      wCont := 0;
      While not ZQCadastroRetifoz.Eof do
      Begin
        Try
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QCadastro.Variables;
          query.Close;
          query.SQL := QCadastro.SQL;
          query.Open;
          query.Insert;

          query.FieldByName('COD_CADASTRO').Value     := ZQCadastroRetifozCOD_CADASTRO.Value;
          if ZQCadastroRetifozCOD_TIPO_CADASTRO.AsString <> '' then
            query.FieldByName('COD_TIPO_CADASTRO').Value:= ZQCadastroRetifozCOD_TIPO_CADASTRO.Value
          else
            query.FieldByName('COD_TIPO_CADASTRO').Value:= 1;
          if ZQCadastroRetifozIND_ATIVO.Value = 'I' then
          begin
            query.FieldByName('DT_CANCELAMENTO').Value := ZQCadastroRetifozDT_ALTERACAO.Value;
            query.FieldByName('COD_MOTIVO').Value := 1;
          end;
          query.FieldByName('NOME').Value               := ZQCadastroRetifozNOME.Value;
          query.FieldByName('IND_FISICA_JURIDICA').Value:= ZQCadastroRetifozIND_FISICA_JURIDICA.Value;
          query.FieldByName('DESC_E_MAIL').Value         := (ZQCadastroRetifozDESC_E_MAL.Value);
          query.FieldByName('DESC_E_MAIL1').Value       := (ZQCadastroRetifozDESC_E_MAIL1.Value);
          if ZQCadastroRetifozDESC_FANTASIA.Value <> '' then
            query.FieldByName('DESC_FANTASIA').Value   := bib.RemoveAcentos(ZQCadastroRetifozDESC_FANTASIA.Value)
          else
            query.FieldByName('DESC_FANTASIA').Value := bib.RemoveAcentos(ZQCadastroRetifozDESC_FANTASIA_FORNECEDOR.Value);
          if ZQCadastroRetifozIND_CONTRIBUINTE.Value = 'N' then
            query.FieldByName('IND_CONTRIBUINTE').Value:=  'NAO'
          else if ZQCadastroRetifozIND_CONTRIBUINTE.Value = 'S' then
            query.FieldByName('IND_CONTRIBUINTE').Value:=  'SIM';
          if ZQCadastroRetifozIND_ISS_RETIDO.Value = 'S' then
            query.FieldByName('IND_ISS_RETIDO').Value  :=  1
          else
            query.FieldByName('IND_ISS_RETIDO').Value  :=  2;
          query.FieldByName('DESC_ENDERECO').Value   := bib.RemoveAcentos(ZQCadastroRetifozDESC_ENDERECO.Value);
          query.FieldByName('DESC_CEP').Value    := ZQCadastroRetifozDESC_CEP.Value;
          query.FieldByName('DESC_BAIRRO').Value :=  bib.RemoveAcentos(ZQCadastroRetifozDESC_BAIRRO.Value);
          query.FieldByName('DESC_CIDADE').Value :=  bib.RemoveAcentos(ZQCadastroRetifozDESC_CIDADE.Value);
          query.FieldByName('COD_ESTADO').Value  :=  bib.RemoveAcentos(ZQCadastroRetifozCOD_ESTADO.Value);
          if ZQCadastroRetifozNUM_CAIXA_POSTAL.Value <> '' then
            query.FieldByName('NUM_CAIXA_POSTAL').Value  := ZQCadastroRetifozNUM_CAIXA_POSTAL.Value;
          query.FieldByName('DESC_COMPLEMENTO').Value  :=  bib.RemoveAcentos(ZQCadastroRetifozDESC_COMPLEMENTO.Value);
          query.FieldByName('NUM_INSCRICAO').Value     :=  ZQCadastroRetifozNUM_INSCRICAO.Value;
          query.FieldByName('NUM_CGC_CPF').Value       :=  ZQCadastroRetifozNUM_CGC_CPF.Value;
          query.FieldByName('DT_NASCIMENTO').Value     :=  ZQCadastroRetifozDT_NASCIMENTO.Value;
          if ZQCadastroRetifozCOD_ESTADO_CIVIL.Value = 'C' then //CASADO
            query.FieldByName('COD_ESTADO_CIVIL').Value  := 2
          else if ZQCadastroRetifozCOD_ESTADO_CIVIL.Value = 'D' then //DESQUITADO
            query.FieldByName('COD_ESTADO_CIVIL').Value  := 4
          else if ZQCadastroRetifozCOD_ESTADO_CIVIL.Value = 'S' then //SOLTEIRO
            query.FieldByName('COD_ESTADO_CIVIL').Value  := 1;
          if ZQCadastroRetifozIND_SEXO_CATEGORIA.Value <> '' then
            query.FieldByName('IND_SEXO_CATEGORIA').Value:=  ZQCadastroRetifozIND_SEXO_CATEGORIA.Value
          else
            query.FieldByName('IND_SEXO_CATEGORIA').Value:=  'F';
          query.FieldByName('DESC_NATURALIDADE').Value := bib.RemoveAcentos(ZQCadastroRetifozDESC_NATURALIDADE.Value);
          query.FieldByName('DT_EXPEDICAO_IDENTIDADE').Value:= ZQCadastroRetifozDT_EXPEDICAO_IDENTIDADE.Value;
          query.FieldByName('DESC_ORGAO_EMISSOR').Value:=  ZQCadastroRetifozDESC_ORGAO_EMISSOR.Value;
          query.FieldByName('DESC_OBS').Value    :=  bib.RemoveAcentos(ZQCadastroRetifozDESC_OBS.Value);
          if ZQCadastroRetifozDT_CADASTRO.AsString <> '' then
            query.FieldByName('DT_CADASTRO').Value :=  ZQCadastroRetifozDT_CADASTRO.Value
          else
            query.FieldByName('DT_CADASTRO').Value :=  date;
          if ZQCadastroRetifozDT_ALTERACAO.AsString <> '' then
            query.FieldByName('DT_ALTERACAO').Value:= ZQCadastroRetifozDT_ALTERACAO.Value;
          query.FieldByName('IND_PIS_COFINS_RETIDO').Value :=  ZQCadastroRetifozIND_PIS_COFINS_RETIDO.Value;
          query.FieldByName('DESC_INSCRICAO_MUNICIPAL').Value :=  ZQCadastroRetifozINSC_MUNICIPAL.Value;
          query.FieldByName('NOME_CONTATO2').Value  :=  bib.RemoveAcentos(ZQCadastroRetifozDESC_CONTATO1.Value);
          query.FieldByName('DESC_ENDERECO_COBRANCA').Value := bib.RemoveAcentos(ZQCadastroRetifozDESC_ENDERECO_COBRANCA.Value);
          query.FieldByName('DESC_CIDADE_COBRANCA').Value:= bib.RemoveAcentos(ZQCadastroRetifozDESC_CIDADE_COBRANCA.Value);
          query.FieldByName('DESC_ESTADO_COBRANCA').Value:=  bib.RemoveAcentos(ZQCadastroRetifozDESC_ESTADO_COBRANCA.Value);
          query.FieldByName('DESC_CEP_COBRANCA').Value   :=  ZQCadastroRetifozDESC_CEP_COBRANCA.Value;
          query.FieldByName('DESC_BAIRRO_COBRANCA').Value:=  bib.RemoveAcentos(ZQCadastroRetifozDESC_BAIRRO_COBRANCA.Value);
          query.FieldByName('DESC_FUNCAO').Value         := bib.RemoveAcentos(ZQCadastroRetifozDESC_FUNCAO.Value);
          query.FieldByName('IND_CONSUMIDOR_FINAL').Value:=  ZQCadastroRetifozIND_CONSUMIDOR_FINAL.Value;
          query.FieldByName('NOME_PAI').Value :=  bib.RemoveAcentos(ZQCadastroRetifozNOME_PAI.Value);
          query.FieldByName('NOME_MAE').Value :=  bib.RemoveAcentos(ZQCadastroRetifozNOME_MAE.Value);
          query.FieldByName('NOME_CONJUGE').Value := bib.RemoveAcentos(ZQCadastroRetifozNOME_CONJUGE.Value);
          query.FieldByName('DT_NASCIMENTO_CONJUGE').Value  := ZQCadastroRetifozDT_NASCIMENTO_CONJUGE.Value;
          query.FieldByName('DESC_CPF_CONJUGE').Value       := ZQCadastroRetifozDESC_CPF_CONJUGE.Value;
          query.FieldByName('DESC_IDENTIDADE_CONJUGE').Value:= ZQCadastroRetifozDESC_IDENTIDADE_CONJUGE.Value;
          query.FieldByName('DESC_EMPRESA_CONJUGE').Value   := bib.RemoveAcentos(ZQCadastroRetifozDESC_EMPRESA_CONJUGE.Value);
          query.FieldByName('VL_SALARIO_CONJUGE').Value     := ZQCadastroRetifozVL_SALARIO_CONJUGE.Value;
          query.FieldByName('DESC_EMPRESA').Value:= bib.RemoveAcentos(ZQCadastroRetifozDESC_EMPRESA.Value);
          query.FieldByName('VAL_SALARIO').Value := ZQCadastroRetifozVAL_SALARIO.Value;
          query.FieldByName('DESC_TEMPO').Value  := bib.RemoveAcentos(ZQCadastroRetifozDESC_TEMPO.Value);
          query.FieldByName('VAL_LIMITE').Value  := ZQCadastroRetifozVAL_LIMITE.Value;
          query.FieldByName('COD_PAIS').Value  :=  278;
          query.FieldByName('IND_TIPO_PROPRIETARIO').Value  :=  0;

          ZQFoneRetifoz.Close;
          ZQFoneRetifoz.ParamByName('COD_VENDEDOR').Value := ZQCadastroRetifozCOD_CADASTRO.Value;
          ZQFoneRetifoz.Open;
          while (not ZQFoneRetifoz.Eof) do
          begin
            if ZQCadastroRetifozCOD_CADASTRO.Value = ZQFoneRetifozCOD_VENDEDOR.Value then
              begin
                if ZQFoneRetifozNOME_CONTATO1.Value <> '' then
                  query.FieldByName('NOME_CONTATO').Value:= bib.RemoveAcentos(ZQFoneRetifozNOME_CONTATO1.Value);
                wind := 1;
                wFone := '';
                while wInd <= Length(ZQFoneRetifozDESC_FONE.Value) do
                begin
                  if (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '0') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '1') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '2') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '3') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '4') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '5') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '6') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '7') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '8') Or
                     (Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1) = '9') Then
                    wFone := wFone + Copy(ZQFoneRetifozDESC_FONE.Value,wInd,1);
                  Inc(wInd);
                end;
                if Length(wFone) = 8 then
                  wFoneCompleto := '45'+ wFone
                else
                  wFoneCompleto := wFone;
                if ZQFoneRetifozDESC_TIPO_FONE.Value = 'FIXO' then
                  query.FieldByName('DESC_TELEFONE').Value    := wFoneCompleto
                else if ZQFoneRetifozDESC_TIPO_FONE.Value = 'FONE DIRETO' then
                  query.FieldByName('NOME_CONTATO2').Value    := wFoneCompleto
                else
                  query.FieldByName('DESC_CELULAR').Value    := wFoneCompleto
                end;
              ZQFoneRetifoz.Next
            end;
          query.Post;

        Except
          Inc(wRegNaoImp);
          If query.State = dsInsert Then
            query.Cancel;
        End;
        query.Free;
        query := nil;
        ZQCadastroRetifoz.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
        MEImp.Text := FloatToStr(wCont-wRegNaoImp);
        MENaoImp.Text := FloatToStr(wRegNaoImp);
      end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn41Click(Sender: TObject);
var wImp, wNaoImp, wAux, wCont: Integer;
    wCodClasse: String;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;
  wCont := 0;
  with DMProdutoFirebird, DMImportaDados do
  begin
    ZQClasseRetifoz.Close;
    ZQClasseRetifoz.Open;
    QClasseimporta.Open;

    while not ZQClasseRetifoz.Eof do
    begin
      try
        QClasseImporta.Insert;
        QClasseImportaCOD_CLASSE.Value   := ZQClasseRetifozCODIGO.Value;
        QClasseImportaNUM_CLASSE.Value   := 1;
        QClasseImportaNUM_SUBCLASSE.Value:= ZQClasseRetifozCODIGO.Value;
        QClasseImportaDESC_CLASSE.Value  := bib.RemoveAcentos(Trim(ZQClasseRetifozNOME.Value));
        QClasseImporta.Post;

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid8.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QClasseImporta.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQClasseRetifoz.Next;
      end;
      ZQClasseRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn42Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
  wClasse: string;
  exec: TExecutador;
  query : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin

    with DMProdutoFirebird do
    begin
      QProduto.Open;
      ZQProdutoRetifoz.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoRetifoz.First;

      wCont := 0;
      While not ZQProdutoRetifoz.Eof do
      Begin
        Try
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QProduto.Variables;
          query.Close;
          query.SQL := QProduto.SQL;
          query.Open;
          query.Insert;

          query.FieldByName('COD_PRODUTO').Value    := ZQProdutoRetifozCOD_PRODUTO.Value;
          query.FieldByName('DESC_PRODUTO').Value   := Trim(bib.RemoveAcentos(ZQProdutoRetifozDESC_PRODUTO.Value));
         // query.FieldByName('DESC_COMPLEMENTO').Value:= Trim(bib.RemoveAcentos(ZQProdutoRetifozDESC_PRODUTO_REDUZIDO.Value)); //jogado para OBS.
          query.FieldByName('COD_MARCA').Value   := ZQProdutoRetifozCOD_MARCA.Value;
          query.FieldByName('COD_CLASSE').Value     := ZQProdutoRetifozCOD_CLASSE.Value;
          query.FieldByName('NUM_FABRICANTE').Value :=  Trim(ZQProdutoRetifozNUM_FABRICANTE.Value);
          query.FieldByName('PERC_IPI').Value :=  ZQProdutoRetifozPERC_IPI.Value;
          query.FieldByName('COD_CEST').Value  := ZQProdutoRetifozCOD_CEST.Value;
          if (ZQProdutoRetifozIND_SITUACAO.Value = 'B') or (ZQProdutoRetifozIND_SITUACAO.Value = 'N') Then
            query.FieldByName('IND_SITUACAO').Value:= 'DESATIVADO'
          else
            query.FieldByName('IND_SITUACAO').Value:= 'ATIVO';
          query.FieldByName('COD_TIPO_PRODUTO').Value := ZQProdutoRetifozCOD_TIPO_PRODUTO.Value; //item sped
          if bib.RemoveAcentos(ZQProdutoRetifozNUM_GENERO_NCM.Value) = 'SERVICOS' then
            query.FieldByName('IND_TIPO_PRODUTO').Value := 'SERVIÇO'
          else
            query.FieldByName('IND_TIPO_PRODUTO').Value := 'COMERCIAL';
          query.FieldByName('PERC_ISS').Value := ZQProdutoRetifozPERC_ISS.Value;
          query.FieldByName('NUM_PESO_BRUTO').Value   := ZQProdutoRetifozNUM_PESO_BRUTO.value;
          query.FieldByName('NUM_PESO_LIQUIDO').Value := ZQProdutoRetifozNUM_PESO_LIQUIDO.Value;
          if ZQProdutoRetifozCOD_LISTA_SERVICO.Value <> '' then
            query.FieldByName('COD_LISTA_SERVICO').Value := bib.Tirapontos(ZQProdutoRetifozCOD_LISTA_SERVICO.Value);
          if ZQProdutoRetifozCOD_SERVICO_MUNICIPAL.Value <> '' then
            query.FieldByName('COD_SERVICO_MUNICIPAL').Value := ZQProdutoRetifozCOD_SERVICO_MUNICIPAL.Value;
          query.FieldByName('DESC_OBSERVACAO').Value := Trim(bib.RemoveAcentos(ZQProdutoRetifozDESC_PRODUTO_REDUZIDO.Value)) + ' - ' + ZQProdutoRetifozDESC_OBSERVACAO.Value;
          query.FieldByName('VAL_VAREJO').Value  := ZQProdutoRetifozVAL_VAREJO.Value;
          query.FieldByName('VAL_ATACADO').Value := ZQProdutoRetifozVAL_ATACADO.Value;
          if bib.RemoveAcentos(ZQProdutoRetifozNUM_GENERO_NCM.Value) = 'SERVICOS' then
            query.FieldByName('NUM_GENERO_NCM').Value := '00'
          else
            query.FieldByName('NUM_GENERO_NCM').Value := ZQProdutoRetifozNUM_GENERO_NCM.Value;
          query.FieldByName('DESC_UNIDADE').Value   := ZQProdutoRetifozDESC_UNIDADE.Value;
          if (ZQProdutoRetifozCOD_TRIBUTACAO.AsString = '') or (ZQProdutoRetifozCOD_TRIBUTACAO.Value = 2) then
            query.FieldByName('COD_TRIBUTACAO').Value := 3
          else
          query.FieldByName('COD_TRIBUTACAO').Value := ZQProdutoRetifozCOD_TRIBUTACAO.Value;
          query.FieldByName('DESC_LOCALIZACAO').Value := ZQProdutoRetifozDESC_LOCALIZACAO.Value;

          query.FieldByName('COD_CEST').Value  := ZQProdutoRetifozCOD_CEST.Value;
          query.FieldByName('PERC_INSS').Value:= 0;
          query.FieldByName('NUM_EMBALAGEM').Value  := 1;
          query.Post;
        Except
          Inc(wRegNaoImp);
          If query.State = dsInsert Then
            query.Cancel;
        End;
        query.Free;
        query := nil;

        ZQProdutoRetifoz.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn43Click(Sender: TObject);
var wCont,wRegNaoImp: Integer;
  exec: TExecutador;
  query : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
     with DMProdutoFirebird, DMImportaDados do
    begin
      QEstoque.Open;
      ZQestoqueRetifoz.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQestoqueRetifoz.First;

      wCont := 0;
      While not ZQestoqueRetifoz.Eof do
      Begin
        Try
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QEstoque.Variables;
          query.Close;
          query.SQL := QEstoque.SQL;
          query.Open;
          query.Insert;

          query.FieldByName('COD_FILIAL').Value    := ZQEstoqueRetifozCOD_FILIAL.Value;
          query.FieldByName('COD_PRODUTO').Value   := ZQEstoqueRetifozCOD_PRODUTO.Value;
          query.FieldByName('COD_LOTE_TIPO').Value :=  1;
          query.FieldByName('QT_QUANTIDADE').Value :=  ZQEstoqueRetifozQTD_EMPRESA.Value;
          query.FieldByName('VL_CUSTO_MEDIO').Value :=  ZQEstoqueRetifozVL_CUSTO_MEDIO.Value;
          query.FieldByName('VL_ULTIMO_CUSTO').Value := ZQEstoqueRetifozVL_ULTIMO_CUSTO.Value;
          query.Post;

        Except
          Inc(wRegNaoImp);
          If query.State = dsInsert Then
            query.Cancel;
        End;
        query.Free;
        query := nil;
        ZQEstoqueRetifoz.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn44Click(Sender: TObject);
var wCont,wRegNaoImp: Integer;
  exec: TExecutador;
  query : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
     with DMProdutoFirebird, DMImportaDados do
    begin
      QProdutoRelacionado.Open;
      ZQProdutoRelacionadoRetifoz.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoRelacionadoRetifoz.First;

      wCont := 0;
      While not ZQProdutoRelacionadoRetifoz.Eof do
      Begin
        Try
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QProdutoRelacionado.Variables;
          query.Close;
          query.SQL := QProdutoRelacionado.SQL;
          query.Open;
          query.Insert;

          query.FieldByName('COD_PRODUTO_RELACIONADO').Value    := DMOracle.Sequencia('PRODUTO_RELACIONADO');
          query.FieldByName('COD_PRODUTO_PAI').Value   := ZQProdutoRelacionadoRetifozCOD_PRODUTO_PRINCIPAL.Value;
          query.FieldByName('COD_PRODUTO_FILHO').Value :=  ZQProdutoRelacionadoRetifozCOD_PRODUTO_SIMILAR.Value;
          query.Post;

        Except
          Inc(wRegNaoImp);
          If query.State = dsInsert Then
            query.Cancel;
        End;
        query.Free;
        query := nil;
        ZQProdutoRelacionadoRetifoz.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn45Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;
//plano de conta referencial
  with DMPlanoContasFirebird, DMImportaDados do
  begin
    QPlanoContaRef.Open;
    ZQPlanoContaRefRetifoz.Close;
    ZQPlanoContaRefRetifoz.Open;
    ZQPlanoContaRefRetifoz.First;
    while not ZQPlanoContaRefRetifoz.Eof do
    begin
      try
        QPlanoContaRef.Insert;
        QPlanoContaRefCOD_PLANO_CONTA_REFERENCIAL.Value := DMOracle.Sequencia('PLANO_CONTA_REFERENCIAL');
        QPlanoContaRefDESC_PLANO_CONTA_REFERENCIAL.Value:= ZQPlanoContaRefRetifozDESC_PLANO_CONTA_REFERENCIAL.Value;
        QPlanoContaRefNUM_PLANO_CONTA_REFERENCIAL.Value := ZQPlanoContaRefRetifozNUM_PLANO_CONTA_REFERENCIAL.Value;
        QPlanoContaRef.Post;
        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid36.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QPlanoContaRef.Cancel;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQPlanoContaRefRetifoz.Next;
      end;
      ZQPlanoContaRefRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn6Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
    query : TOracleDataSet1;
    StringList : TStringList;
    wContaReferencial, wConta : String;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;
  StringList := TStringList.Create;
  StringList.Delimiter := '.';
  with DMPlanoContasFirebird, DMImportaDados do
  begin
    QPlanoConta.Open;
    ZQPlanoContaretifoz.Close;
    ZQPlanoContaretifoz.Open;
//    DMOracle.DBCemapa.StartTransaction;
    ZQPlanoContaretifoz.First;
    while not ZQPlanoContaretifoz.Eof do
    begin
      try
        query := TOracleDataSet1.Create(nil);
        query.Session := DMOracle.DBCemapa;
        query.Variables := QPlanoConta.Variables;
        query.Close;
        query.SQL := QPlanoConta.SQL;
        query.Open;
        query.Insert;

        query.FieldByName('COD_PLANO_CONTA').Value    := ZQPlanoContaRetifozCOD_PLANO_CONTA.Value;
        query.FieldByName('COD_FILIAL').Value := 1;
        query.FieldByName('NUM_PLANO_CONTA').Value  := ZQPlanoContaRetifozNUM_PLANO_CONTA.Value;
        query.FieldByName('COD_REDUZIDO').Value  := ZQPlanoContaRetifozNUM_PLANO_CONTA.Value;
        StringList.DelimitedText := ZQPlanoContaRetifozNUM_GRAU.Value;
        if StringList.Count >= 6 then
          query.FieldByName('NUM_GRAU').Value:= 6//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;
        else
          query.FieldByName('NUM_GRAU').Value:= StringList.Count;//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;
        query.FieldByName('DESC_PLANO_CONTA').Value   := ZQPlanoContaRetifozDESC_PLANO_CONTA.Value;
        query.FieldByName('DESC_NATUREZA_CONTA').Value:= ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;
        query.FieldByName('IND_LIBERADO_USO').Value   := ZQPlanoContaRetifozIND_LIBERADO_USO.Value;
//        DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(Trunc(QEstadoPerc_Tributacao.Value)),True);
        wContaReferencial := '0'+DMOracle.BuscaNome('SELECT COD_PLANO_CONTA_REFERENCIAL FROM TB_PLANO_CONTA_REFERENCIAL','NUM_PLANO_CONTA_REFERENCIAL = ' + QuotedStr(ZQPlanoContaRetifozCONTAREFERENCIAL.Value));
        if wContaReferencial > '0' then
          query.FieldByName('COD_PLANO_CONTA_REFERENCIAL').Value   := StrToInt(wContaReferencial);
        query.Post;

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

//        DBGrid11.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QPlanoConta.Cancel;
        query.Free;
        query := nil;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQPlanoContaretifoz.Next;
      end;
      query.Free;
      query := nil;
      ZQPlanoContaretifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn46Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo, wNumParcela : String;
    queryCPCab : TOracleDataSet1;
    queryCPMov : TOracleDataSet1;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasPagarFirebird do
  Begin
    ZQCP_Retifoz.Close;
    ZQCP_Retifoz.Open;

    QCP_Importa.Close;
    QCP_Importa.Open;

    QCPMov_Importa.Close;
    QCPMov_Importa.Open;
    
    ZQCP_Retifoz.First;
    PB.Max := ZQCP_Retifoz.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := '0';
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCP_Retifoz.Eof do
    Begin
      Try
        if ZQCP_RetifozCOD_CADASTRO.Text <> '' then
        begin
          queryCPCab := TOracleDataSet1.Create(nil);
          queryCPCab.Session := DMOracle.DBCemapa;
          queryCPCab.Variables := QCP_Importa.Variables;
          queryCPCab.Close;
          queryCPCab.SQL := QCP_Importa.SQL;
          queryCPCab.Open;
          queryCPCab.Insert;

          queryCPMov := TOracleDataSet1.Create(nil);
          queryCPMov.Session := DMOracle.DBCemapa;
          queryCPMov.Variables := QCPMov_Importa.Variables;
          queryCPMov.Close;
          queryCPMov.SQL := QCPMov_Importa.SQL;
          queryCPMov.Open;
          queryCPMov.Insert;

          queryCPCab.FieldByName('COD_CONTA_PAGAR_CAB').Value := ZQCP_RetifozCOD_CONTA_PAGAR_CAB.Value;
          queryCPCab.FieldByName('COD_FINALIDADE').Value := ZQCP_RetifozCOD_FINALIDADE.Value;
          queryCPCab.FieldByName('COD_CADASTRO').Value  := ZQCP_RetifozCOD_CADASTRO.Value;
          queryCPCab.FieldByName('COD_FILIAL').Value  := ZQCP_RetifozCOD_FILIAL.Value;
          if (copy(ZQCP_RetifozNUM_TITULO.Value,1,2) = 'LI') or (copy(ZQCP_RetifozNUM_TITULO.Value,1,2) = 'SA') or
             (copy(ZQCP_RetifozNUM_TITULO.Value,1,2) = 'DA') or (copy(ZQCP_RetifozNUM_TITULO.Value,1,2) = 'SE') or
             (copy(ZQCP_RetifozNUM_TITULO.Value,1,2) = 'IP')   then
            wNumTitulo := IntToStr(DMSequencia.Sequencia(1,'Num_Titulo_CP'))
          else if (pos('/',ZQCP_RetifozNUM_TITULO.Value) > 0) then
            wNumTitulo := (copy(ZQCP_RetifozNUM_TITULO.Value,0,pos('/',ZQCP_RetifozNUM_TITULO.Value)-1))
          else if pos('-',ZQCP_RetifozNUM_TITULO.Value) > 0 then
          begin
            if pos('.',ZQCP_RetifozNUM_TITULO.Value) > 0 then
              wNumTitulo := (Copy(ZQCP_RetifozNUM_TITULO.Value,0,7))
            else
              wNumTitulo := (copy(ZQCP_RetifozNUM_TITULO.Value,0,pos ('-',ZQCP_RetifozNUM_TITULO.Value)-1))
          end
          else
            wNumTitulo := copy(ZQCP_RetifozNUM_TITULO.Value,1,7);

          queryCPCab.FieldByName('NUM_TITULO').Value  := StrToFloat(copy(bib.LimpaNumero(wNumTitulo),1,7));

          if ZQCP_RetifozNUM_PARCELA.Text = '' then
          begin
            if (pos('/',ZQCP_RetifozNUM_TITULO.Value) > 0) then
              queryCPCab.FieldByName('NUM_PARCELA').Value := pos('/',ZQCP_RetifozNUM_TITULO.Value)
            else
              queryCPCab.FieldByName('NUM_PARCELA').Value := 1
          end
          else
            queryCPCab.FieldByName('NUM_PARCELA').Value := ZQCP_RetifozNUM_PARCELA.Value;

{          if (ZQCP_RetifozNUM_PARCELA.Text = '') and (pos('/',ZQCP_RetifozNUM_TITULO.Value)) then
           queryCPCab.FieldByName('NUM_PARCELA').Value := pos('/',ZQCP_RetifozNUM_TITULO.Value)
          else if ZQCP_RetifozNUM_PARCELA.Text = '' then
             queryCPCab.FieldByName('NUM_PARCELA').Value := 1
          else
            queryCPCab.FieldByName('NUM_PARCELA').Value := ZQCP_RetifozNUM_PARCELA.Value;}
          queryCPCab.FieldByName('DESC_TIPO_DOCUMENTO').Value  := 'DP';
          queryCPCab.FieldByName('COD_DEPARTAMENTO').Value := ZQCP_RetifozCOD_DEPARTAMENTO.Value;
          queryCPCab.FieldByName('COD_FINALIDADE').Value   := ZQCP_RetifozCOD_FINALIDADE.Value;
          queryCPCab.FieldByName('DT_EMISSAO').Value       := ZQCP_RetifozDT_EMISSAO.Value;
          queryCPCab.FieldByName('DT_VENCIMENTO').Value    := ZQCP_RetifozDT_VENCIMENTO.Value;
          queryCPCab.FieldByName('DT_CAPITALIZACAO').Value := ZQCP_RetifozDT_ACEITE.Text;
          queryCPCab.FieldByName('DT_ACEITE').Value := ZQCP_RetifozDT_ACEITE.Text;
          queryCPCab.FieldByName('VAL_ORIGINAL').Value     := ZQCP_RetifozVAL_ORIGINAL.Value;
          queryCPCab.FieldByName('VAL_TITULO').Value       := ZQCP_RetifozVAL_TITULO.Value;
          queryCPCab.FieldByName('DESC_OBSERVACAO').Value  := ZQCP_RetifozOBS.Value;
          queryCPCab.FieldByName('IND_ACEITE').Value       := 'S';

          if ZQCP_RetifozVAL_ORIGINAL.Value = ZQCP_RetifozVAL_TITULO.Value then
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO'
          else if ZQCP_RetifozVAL_TITULO.Value < ZQCP_RetifozVAL_ORIGINAL.Value then
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA PARCIAL'
          else
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO';
          queryCPCab.FieldByName('VAL_INDEXADO').Value  := 0;
          queryCPCab.Post;
          //INICIO - TESTE MOVIMENTO
          queryCPMov.FieldByName('COD_CONTA_PAGAR_MOV').Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
          queryCPMov.FieldByName('COD_CONTA_PAGAR_CAB').Value := ZQCP_RetifozCOD_CONTA_PAGAR_CAB.Value;
          queryCPMov.FieldByName('DT_MOVIMENTO').Value          := ZQCP_RetifozDT_EMISSAO.Value;
          queryCPMov.FieldByName('VAL_MOVIMENTO').Value         := ZQCP_RetifozVAL_ORIGINAL.Value;
          queryCPMov.FieldByName('IND_TIPO_MOVIMENTO').Value    := 'PRINCIPAL';
          queryCPMov.FieldByName('DT_USUARIO').Value            := date;
          queryCPMov.FieldByName('COD_USUARIO').Value           := 1;
          queryCPMov.Post;
        End;
      Except
        If queryCPCab.State = dsInsert Then
          queryCPCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      queryCPCab.Free;
      queryCPCab := nil;
      queryCPMov.Free;
      queryCPMov := nil;
      ZQCP_Retifoz.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn48Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    QCP_CemapaBaixa.Open;
    QCPMov_Importa.Open;
    QCP_CemapaBaixa.First;
    PB.Max := QCP_CemapaBaixa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCP_CemapaBaixa.Eof do
    Begin
      If QCP_CemapaBaixaCOD_CADASTRO.Value = 0 Then
       Begin
         QCP_CemapaBaixa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCP_CemapaBaixaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCP_CemapaBaixaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCP_CemapaBaixaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCP_CemapaBaixaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCPMov_Importa.Insert;
          QCPMov_ImportaCOD_CONTA_PAGAR_MOV.Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
          QCPMov_ImportaCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCab);
          QCPMov_ImportaDT_MOVIMENTO.Text := QCP_CemapaBaixaDT_VENCIMENTO.Text;
          QCPMov_ImportaVAL_MOVIMENTO.Value := (QCP_CemapaBaixaVAL_ORIGINAL.Value - QCP_CemapaBaixaVAL_TITULO.Value);
          QCPMov_ImportaIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
          QCPMov_ImportaDESC_OBSERVACAO.Value := QCP_CemapaBaixaDESC_OBSERVACAO.Value;
          QCPMov_ImportaDT_USUARIO.Value := date;
          QCPMov_ImportaCOD_USUARIO.Value := 1;

         QCPMov_Importa.Post;
        End;
      Except
        If QCPMov_Importa.State = dsInsert Then
          QCPMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCP_CemapaBaixa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn49Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo, wNumParcela : String;
    queryCRCab : TOracleDataSet1;
    queryCRMov : TOracleDataSet1;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasREceberFirebird do
  Begin
    ZQCR_Retifoz.Close;
    ZQCR_Retifoz.Open;

    QCR_Importa.Close;
    QCR_Importa.Open;

    QCRMov_Importa.Close;
    QCRMov_Importa.Open;
    
    ZQCR_Retifoz.First;
    PB.Max := ZQCR_Retifoz.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := '0';
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCR_Retifoz.Eof do
    Begin
      Try
        if ZQCR_RetifozCOD_CADASTRO.Text <> '' then
        begin
          queryCRCab := TOracleDataSet1.Create(nil);
          queryCRCab.Session := DMOracle.DBCemapa;
          queryCRCab.Variables := QCR_Importa.Variables;
          queryCRCab.Close;
          queryCRCab.SQL := QCR_Importa.SQL;
          queryCRCab.Open;
          queryCRCab.Insert;

          queryCRMov := TOracleDataSet1.Create(nil);
          queryCRMov.Session := DMOracle.DBCemapa;
          queryCRMov.Variables := QCRMov_Importa.Variables;
          queryCRMov.Close;
          queryCRMov.SQL := QCRMov_Importa.SQL;
          queryCRMov.Open;
          queryCRMov.Insert;

          queryCrCab.FieldByName('COD_CONTA_RECEBER_CAB').Value := ZQCR_RetifozCOD_CONTA_RECEBER_CAB.Value;
          queryCrCab.FieldByName('COD_FINALIDADE').Value := ZQCR_RetifozCOD_FINALIDADE.Value;
          queryCrCab.FieldByName('COD_CADASTRO').Value  := ZQCR_RetifozCOD_CADASTRO.Value;
          queryCrCab.FieldByName('COD_FILIAL').Value  := ZQCR_RetifozCOD_FILIAL.Value;
          if (pos('/',ZQCR_RetifozNUM_TITULO.Value) > 0) then
            wNumTitulo := (copy(ZQCR_RetifozNUM_TITULO.Value,0,pos('/',ZQCr_RetifozNUM_TITULO.Value)-1))
          else
            wNumTitulo := copy(ZQCR_RetifozNUM_TITULO.Value,1,7);

          queryCRCab.FieldByName('NUM_TITULO').Value  := StrToFloat(copy(bib.LimpaNumero(wNumTitulo),1,7));

          if ZQCR_RetifozNUM_PARCELA.Text = '' then
             queryCRCab.FieldByName('NUM_PARCELA').Value := 1
          else
            queryCRCab.FieldByName('NUM_PARCELA').Value := ZQCR_RetifozNUM_PARCELA.Value;
          queryCRCab.FieldByName('DESC_TIPO_DOCUMENTO').Value  := 'DP';
          queryCRCab.FieldByName('COD_DEPARTAMENTO').Value := ZQCR_RetifozCOD_DEPARTAMENTO.Value;
          queryCRCab.FieldByName('COD_FINALIDADE').Value   := ZQCR_RetifozCOD_FINALIDADE.Value;
          queryCRCab.FieldByName('DT_EMISSAO').Value       := ZQCR_RetifozDT_EMISSAO.Value;
          queryCRCab.FieldByName('DT_VENCIMENTO').Value    := ZQCR_RetifozDT_VENCIMENTO.Value;
          queryCRCab.FieldByName('DT_CAPITALIZACAO').Value := ZQCR_RetifozDT_EMISSAO.Text;
          queryCRCab.FieldByName('VAL_ORIGINAL').Value     := ZQCR_RetifozVAL_ORIGINAL.Value;
          queryCRCab.FieldByName('VAL_TITULO').Value       := ZQCR_RetifozVAL_TITULO.Value;
          queryCRCab.FieldByName('DESC_OBSERVACAO').Value  := ZQCR_RetifozOBS.Value;
          if ZQCR_RetifozVAL_ORIGINAL.Value = ZQCR_RetifozVAL_TITULO.Value then
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO'
          else if ZQCR_RetifozVAL_TITULO.Value < ZQCR_RetifozVAL_ORIGINAL.Value then
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA PARCIAL'
          else
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO';
          queryCRCab.FieldByName('COD_VENDEDOR').Value  := 1;
          queryCRCab.FieldByName('PERC_COMISSAO').Value  := 0;
          queryCRCab.FieldByName('PERC_COMISSAO1').Value  := 0;
          queryCRCab.Post;
          //INICIO - TESTE MOVIMENTO
          queryCRMov.FieldByName('COD_CONTA_RECEBER_MOV').Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          queryCRMov.FieldByName('COD_CONTA_RECEBER_CAB').Value := ZQCR_RetifozCOD_CONTA_RECEBER_CAB.Value;
          queryCRMov.FieldByName('DT_MOVIMENTO').Value          := ZQCR_RetifozDT_EMISSAO.Value;
          queryCRMov.FieldByName('VAL_MOVIMENTO').Value         := ZQCR_RetifozVAL_ORIGINAL.Value;
          queryCRMov.FieldByName('IND_TIPO_MOVIMENTO').Value    := 'PRINCIPAL';
          queryCRMov.FieldByName('DT_USUARIO').Value            := date;
          queryCRMov.FieldByName('COD_USUARIO').Value           := 1;
          queryCRMov.Post;
        End;
      Except
        If queryCRCab.State = dsInsert Then
          queryCRCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      queryCRCab.Free;
      queryCRCab := nil;
      queryCRMov.Free;
      queryCRMov := nil;
      ZQCR_Retifoz.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn51Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    QCR_CemapaBaixa.Open;
    QCRMov_Importa.Open;
    QCR_CemapaBaixa.First;
    PB.Max := QCR_CemapaBaixa.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not QCR_CemapaBaixa.Eof do
    Begin
      If QCR_CemapaBaixaCOD_CADASTRO.Value = 0 Then
       Begin
         QCR_CemapaBaixa.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                                   'COD_CADASTRO = '+FloatToStr(QCR_CemapaBaixaCOD_CADASTRO.Value)
                                   +' AND NUM_TITULO = '+ FloatToStr(QCR_CemapaBaixaNUM_TITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(QCR_CemapaBaixaNUM_PARCELA.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+QCR_CemapaBaixaDESC_TIPO_DOCUMENTO.Value+#39 );
        If wCab <> '' Then
        Begin
          QCRMov_Importa.Insert;
          QCRMov_ImportaCOD_CONTA_RECEBER_MOV.Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          QCRMov_ImportaCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCab);
          QCRMov_ImportaDT_MOVIMENTO.Text := QCR_CemapaBaixaDT_VENCIMENTO.Text;
          QCRMov_ImportaVAL_MOVIMENTO.Value := (QCR_CemapaBaixaVAL_ORIGINAL.Value - QCR_CemapaBaixaVAL_TITULO.Value);
          QCRMov_ImportaIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
          QCRMov_ImportaDESC_OBSERVACAO.Value := QCR_CemapaBaixaDESC_OBSERVACAO.Value;
          QCRMov_ImportaDT_USUARIO.Value := date;
          QCRMov_ImportaCOD_USUARIO.Value := 1;

         QCRMov_Importa.Post;
        End;
      Except
        If QCRMov_Importa.State = dsInsert Then
          QCRMov_Importa.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      QCR_CemapaBaixa.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn52Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo, wNumParcela : String;
    queryCRCab : TOracleDataSet1;
    queryCRMov : TOracleDataSet1;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasREceberFirebird do
  Begin
    ZQCR_RetifozBaixado.Close;
    ZQCR_RetifozBaixado.Open;

    QCR_Importa.Close;
    QCR_Importa.Open;

    QCRMov_Importa.Close;
    QCRMov_Importa.Open;
    
    ZQCR_RetifozBaixado.First;
    PB.Max := ZQCR_RetifozBaixado.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := '0';
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCR_RetifozBaixado.Eof do
    Begin
      Try
        if ZQCR_RetifozBaixadoCOD_CADASTRO.Text <> '' then
        begin
          queryCRCab := TOracleDataSet1.Create(nil);
          queryCRCab.Session := DMOracle.DBCemapa;
          queryCRCab.Variables := QCR_Importa.Variables;
          queryCRCab.Close;
          queryCRCab.SQL := QCR_Importa.SQL;
          queryCRCab.Open;
          queryCRCab.Insert;

          queryCRMov := TOracleDataSet1.Create(nil);
          queryCRMov.Session := DMOracle.DBCemapa;
          queryCRMov.Variables := QCRMov_Importa.Variables;
          queryCRMov.Close;
          queryCRMov.SQL := QCRMov_Importa.SQL;
          queryCRMov.Open;
          queryCRMov.Insert;

          queryCrCab.FieldByName('COD_CONTA_RECEBER_CAB').Value := ZQCR_RetifozBaixadoCOD_CONTA_RECEBER_CAB.Value;
          queryCrCab.FieldByName('COD_FINALIDADE').Value := ZQCR_RetifozBaixadoCOD_FINALIDADE.Value;
          queryCrCab.FieldByName('COD_CADASTRO').Value  := ZQCR_RetifozBaixadoCOD_CADASTRO.Value;
          queryCrCab.FieldByName('COD_FILIAL').Value  := ZQCR_RetifozBaixadoCOD_FILIAL.Value;
          if (pos('/',ZQCR_RetifozBaixadoNUM_TITULO.Value) > 0) then
            wNumTitulo := (copy(ZQCR_RetifozBaixadoNUM_TITULO.Value,0,pos('/',ZQCR_RetifozBaixadoNUM_TITULO.Value)-1))
          else
            wNumTitulo := copy(ZQCR_RetifozBaixadoNUM_TITULO.Value,1,7);

          queryCRCab.FieldByName('NUM_TITULO').Value  := StrToFloat(copy(bib.LimpaNumero(wNumTitulo),1,7));

          if ZQCR_RetifozBaixadoNUM_PARCELA.Text = '' then
             queryCRCab.FieldByName('NUM_PARCELA').Value := 1
          else
            queryCRCab.FieldByName('NUM_PARCELA').Value := ZQCR_RetifozBaixadoNUM_PARCELA.Value;
          queryCRCab.FieldByName('DESC_TIPO_DOCUMENTO').Value  := 'DP';
          queryCRCab.FieldByName('COD_DEPARTAMENTO').Value := ZQCR_RetifozBaixadoCOD_DEPARTAMENTO.Value;
          queryCRCab.FieldByName('COD_FINALIDADE').Value   := ZQCR_RetifozBaixadoCOD_FINALIDADE.Value;
          queryCRCab.FieldByName('DT_EMISSAO').Value       := ZQCR_RetifozBaixadoDT_EMISSAO.Value;
          queryCRCab.FieldByName('DT_VENCIMENTO').Value    := ZQCR_RetifozBaixadoDT_VENCIMENTO.Value;
          queryCRCab.FieldByName('DT_BAIXA').Value         := ZQCR_RetifozBaixadoDT_VENCIMENTO.Value;
          queryCRCab.FieldByName('DT_CAPITALIZACAO').Value := ZQCR_RetifozBaixadoDT_EMISSAO.Text;
          queryCRCab.FieldByName('VAL_ORIGINAL').Value     := ZQCR_RetifozBaixadoVAL_ORIGINAL.Value;
          queryCRCab.FieldByName('VAL_TITULO').Value       := ZQCR_RetifozBaixadoVAL_TITULO.Value;
          queryCRCab.FieldByName('DESC_OBSERVACAO').Value  := ZQCR_RetifozBaixadoOBS.Value;
          if ZQCR_RetifozBaixadoVAL_ORIGINAL.Value = ZQCR_RetifozBaixadoVAL_TITULO.Value then
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO'
          else if ZQCR_RetifozBaixadoVAL_TITULO.Value = 0 then
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA TOTAL'
          else
            queryCRCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA PARCIAL';
          queryCRCab.FieldByName('COD_VENDEDOR').Value  := 1;
          queryCRCab.FieldByName('PERC_COMISSAO').Value  := 0;
          queryCRCab.FieldByName('PERC_COMISSAO1').Value  := 0;
          queryCRCab.Post;
          //INICIO - TESTE MOVIMENTO
          queryCRMov.FieldByName('COD_CONTA_RECEBER_MOV').Value := DmOracle.Sequencia('CONTA_RECEBER_MOV');
          queryCRMov.FieldByName('COD_CONTA_RECEBER_CAB').Value := ZQCR_RetifozBaixadoCOD_CONTA_RECEBER_CAB.Value;
          queryCRMov.FieldByName('DT_MOVIMENTO').Value          := ZQCR_RetifozBaixadoDT_EMISSAO.Value;
          queryCRMov.FieldByName('VAL_MOVIMENTO').Value         := ZQCR_RetifozBaixadoVAL_ORIGINAL.Value;
          queryCRMov.FieldByName('IND_TIPO_MOVIMENTO').Value    := 'PRINCIPAL';
          queryCRMov.FieldByName('DT_USUARIO').Value            := date;
          queryCRMov.FieldByName('COD_USUARIO').Value           := 1;
          queryCRMov.Post;
        End;
      Except
        If queryCRCab.State = dsInsert Then
          queryCRCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      queryCRCab.Free;
      queryCRCab := nil;
      queryCRMov.Free;
      queryCRMov := nil;
      ZQCR_RetifozBaixado.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;

end;

procedure TFImportaDados.BitBtn53Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab : String;
    wNumTitulo, wNumParcela : String;
    queryCPCab : TOracleDataSet1;
    queryCPMov : TOracleDataSet1;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados, DMContasPagarFirebird do
  Begin
    ZQCP_RetifozBaixado.Close;
    ZQCP_RetifozBaixado.Open;

    QCP_Importa.Close;
    QCP_Importa.Open;

    QCPMov_Importa.Close;
    QCPMov_Importa.Open;
    
    ZQCP_RetifozBaixado.First;
    PB.Max := ZQCP_RetifozBaixado.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wNumTitulo := '0';
    DMOracle.DBCEmapa.StartTransaction;
    While not ZQCP_RetifozBaixado.Eof do
    Begin
      Try
        if ZQCP_RetifozBaixadoCOD_CADASTRO.Text <> '' then
        begin
          queryCPCab := TOracleDataSet1.Create(nil);
          queryCPCab.Session := DMOracle.DBCemapa;
          queryCPCab.Variables := QCP_Importa.Variables;
          queryCPCab.Close;
          queryCPCab.SQL := QCP_Importa.SQL;
          queryCPCab.Open;
          queryCPCab.Insert;

          queryCPMov := TOracleDataSet1.Create(nil);
          queryCPMov.Session := DMOracle.DBCemapa;
          queryCPMov.Variables := QCPMov_Importa.Variables;
          queryCPMov.Close;
          queryCPMov.SQL := QCPMov_Importa.SQL;
          queryCPMov.Open;
          queryCPMov.Insert;

          queryCPCab.FieldByName('COD_CONTA_PAGAR_CAB').Value := ZQCP_RetifozBaixadoCOD_CONTA_PAGAR_CAB.Value;
          queryCPCab.FieldByName('COD_FINALIDADE').Value := ZQCP_RetifozBaixadoCOD_FINALIDADE.Value;
          queryCPCab.FieldByName('COD_CADASTRO').Value  := ZQCP_RetifozBaixadoCOD_CADASTRO.Value;
          queryCPCab.FieldByName('COD_FILIAL').Value  := ZQCP_RetifozBaixadoCOD_FILIAL.Value;
          if (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'LI') or (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'SA') or
             (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'DA') or (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'SE') or
             (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'IP') or (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,2) = 'GR')  then
            wNumTitulo := IntToStr(DMSequencia.Sequencia(1,'Num_Titulo_CP'))
          else if (pos('/',ZQCP_RetifozBaixadoNUM_TITULO.Value) > 0) then
            wNumTitulo := (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,0,pos('/',ZQCP_RetifozBaixadoNUM_TITULO.Value)-1))
          else if pos('-',ZQCP_RetifozBaixadoNUM_TITULO.Value) > 0 then
          begin
            if pos('.',ZQCP_RetifozBaixadoNUM_TITULO.Value) > 0 then
              wNumTitulo := (Copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,0,7))
            else
              wNumTitulo := (copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,0,pos ('-',ZQCP_RetifozBaixadoNUM_TITULO.Value)-1))
          end
          else
            wNumTitulo := copy(ZQCP_RetifozBaixadoNUM_TITULO.Value,1,7);

          queryCPCab.FieldByName('NUM_TITULO').Value  := StrToFloat(copy(bib.LimpaNumero(wNumTitulo),1,7));

          if ZQCP_RetifozBaixadoNUM_PARCELA.Text = '' then
          begin
            if (pos('/',ZQCP_RetifozBaixadoNUM_TITULO.Value) > 0) then
              queryCPCab.FieldByName('NUM_PARCELA').Value := pos('/',ZQCP_RetifozBaixadoNUM_TITULO.Value)
            else
              queryCPCab.FieldByName('NUM_PARCELA').Value := 1
          end
          else
            queryCPCab.FieldByName('NUM_PARCELA').Value := ZQCP_RetifozBaixadoNUM_PARCELA.Value;

          queryCPCab.FieldByName('DESC_TIPO_DOCUMENTO').Value  := 'DP';
          queryCPCab.FieldByName('COD_DEPARTAMENTO').Value := ZQCP_RetifozBaixadoCOD_DEPARTAMENTO.Value;
          queryCPCab.FieldByName('COD_FINALIDADE').Value   := ZQCP_RetifozBaixadoCOD_FINALIDADE.Value;
          queryCPCab.FieldByName('DT_EMISSAO').Value       := ZQCP_RetifozBaixadoDT_EMISSAO.Value;
          queryCPCab.FieldByName('DT_VENCIMENTO').Value    := ZQCP_RetifozBaixadoDT_VENCIMENTO.Value;
          queryCPCab.FieldByName('DT_BAIXA').Value         := ZQCP_RetifozBaixadoDT_VENCIMENTO.Value;
          queryCPCab.FieldByName('DT_CAPITALIZACAO').Value := ZQCP_RetifozBaixadoDT_ACEITE.Text;
          queryCPCab.FieldByName('DT_ACEITE').Value := ZQCP_RetifozBaixadoDT_ACEITE.Text;
          queryCPCab.FieldByName('VAL_ORIGINAL').Value     := ZQCP_RetifozBaixadoVAL_ORIGINAL.Value;
          queryCPCab.FieldByName('VAL_TITULO').Value       := ZQCP_RetifozBaixadoVAL_TITULO.Value;
          queryCPCab.FieldByName('DESC_OBSERVACAO').Value  := ZQCP_RetifozBaixadoOBS.Value;
          queryCPCab.FieldByName('IND_ACEITE').Value       := 'S';
         
          if ZQCP_RetifozBaixadoVAL_ORIGINAL.Value = ZQCP_RetifozBaixadoVAL_TITULO.Value then
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'ABERTO'
          else if ZQCP_RetifozBaixadoVAL_TITULO.Value = 0 then
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA TOTAL'
          else
            queryCPCab.FieldByName('IND_SITUACAO').Value  := 'BAIXA PARCIAL';
          queryCPCab.FieldByName('VAL_INDEXADO').Value  := 0;
          queryCPCab.Post;
          //INICIO - TESTE MOVIMENTO
          queryCPMov.FieldByName('COD_CONTA_PAGAR_MOV').Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
          queryCPMov.FieldByName('COD_CONTA_PAGAR_CAB').Value := ZQCP_RetifozBaixadoCOD_CONTA_PAGAR_CAB.Value;
          queryCPMov.FieldByName('DT_MOVIMENTO').Value          := ZQCP_RetifozBaixadoDT_EMISSAO.Value;
          queryCPMov.FieldByName('VAL_MOVIMENTO').Value         := ZQCP_RetifozBaixadoVAL_ORIGINAL.Value;
          queryCPMov.FieldByName('IND_TIPO_MOVIMENTO').Value    := 'PRINCIPAL';
          queryCPMov.FieldByName('DT_USUARIO').Value            := date;
          queryCPMov.FieldByName('COD_USUARIO').Value           := 1;
          queryCPMov.Post;
        End;
      Except
        If queryCPCab.State = dsInsert Then
          queryCPCab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      queryCPCab.Free;
      queryCPCab := nil;
      queryCPMov.Free;
      queryCPMov := nil;
      ZQCP_RetifozBaixado.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn54Click(Sender: TObject);
var wImp, wNaoImp, wAux, wInd: Integer;
    query: TOracleDataSet1;
    wCodVendedor : String;
    wNumPlaca : String;
    wCodModelo : Integer;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMVeiculoFirebird, DMImportaDados do
  begin
    ZQVeiculoRetifoz.Close;
    ZQVeiculoRetifoz.Open;
    QVeiculo.Open;
    while not ZQVeiculoRetifoz.Eof do
    begin
      try
          // Feito para quando a importação possui muitos produtos
          // Estava dando out of memory
          query := TOracleDataSet1.Create(nil);
          query.Session := DMOracle.DBCemapa;
          query.Variables := QVeiculo.Variables;
          query.Close;
          query.SQL := QVeiculo.SQL;
          query.Open;
          query.Insert;
          query.FieldByName('COD_VEICULO').Value := StrToInt(DMOracle.BuscaNome('SELECT SQVEICULO.NEXTVAL FROM DUAL', '1=1'));;
          query.FieldByName('NUM_VEICULO').Value := DMSequencia.Sequencia(1,'NUM_VEICULO');
//        showMessage(copy(ZQVeiculoRetifozNUM_PLACA.Value,4,1));
          if (copy(ZQVeiculoRetifozNUM_PLACA.Value,4,1) <> '-') then
          begin
            wNumPlaca := copy(ZQVeiculoRetifozNUM_PLACA.Value,1,3) + '-' + copy(ZQVeiculoRetifozNUM_PLACA.Value,4,9);
            query.FieldByName('NUM_PLACA').Text := wNumPlaca;
          end
          else
            query.FieldByName('NUM_PLACA').Value   := ZQVeiculoRetifozNUM_PLACA.Value;
          query.FieldByName('NUM_CHASSI').Value  := ZQVeiculoRetifozNUM_CHASSI.Value;
          if ZQVeiculoRetifozCOD_CADASTRO.Text <> '' then
            query.FieldByName('COD_CADASTRO').Value:= ZQVeiculoRetifozCOD_CADASTRO.Value
          else
            query.FieldByName('COD_CADASTRO').Value:= 1;
          if Trim(ZQVeiculoRetifozDESC_MODELO.Value) <> '' then
          begin
            wCodModelo := StrToInt(DMOracle.FastSelect('COD_MODELO','TB_VEICULO_MODELO','DESC_MODELO = '+ Trim(QuotedStr(ZQVeiculoRetifozDESC_MODELO.Text))));
            query.FieldByName('COD_MODELO').Value  := wCodModelo;
          end
          else
            query.FieldByName('COD_MODELO').Value  := 1;
          query.FieldByName('DESC_CARACTERISTICA').Value := ZQVeiculoRetifozDESCRICAO.Value;
          if (ZQVeiculoRetifozNUM_ANO.Value <> '') and (ZQVeiculoRetifozNUM_ANO.Value <> 'MBB') and (ZQVeiculoRetifozNUM_ANO.Value <> '.') and
             (ZQVeiculoRetifozNUM_ANO.Value <> ',') then
            query.FieldByName('NUM_ANO').Value     := ZQVeiculoRetifozNUM_ANO.Value;
          if (ZQVeiculoRetifozNUM_ANO_FAB.Value <> '') then
          begin
            if (ZQVeiculoRetifozNUM_ANO_FAB.Value = '206') then
              query.FieldByName('NUM_ANO_FAB').Value := '2006'
            else if (ZQVeiculoRetifozNUM_ANO_FAB.Value = '214') then
              query.FieldByName('NUM_ANO_FAB').Value := '2014'
            else
              query.FieldByName('NUM_ANO_FAB').Value := ZQVeiculoRetifozNUM_ANO_FAB.Value;
          end;
          query.FieldByName('KM_ATUAL').Value    := ZQVeiculoRetifozKM_ATUAL.Value;
          query.FieldByName('NUM_RENAVAM').Value := ZQVeiculoRetifozNUM_RENAVAM.Value;
          query.FieldByName('COD_MARCA').Value   := 1;
          query.FieldByName('COD_COR').Value     := 1;
          query.FieldByName('DESC_OBSERVACAO').Value:= ZQVeiculoRetifozDESC_OBSERVACAO.Value;
          query.Post;

          Inc(wImp);
          Inc(wAux);
          MEImp.Text := IntToStr(wImp);

          DBGrid41.Refresh;
          query.Free;
          query := nil;
      Except
        If query.State = dsInsert Then
            query.Cancel;
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
      end;
      ZQVeiculoRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn55Click(Sender: TObject);
var wImp, wNaoImp, wAux, wInd: Integer;
    query: TOracleDataSet1;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;

  with DMVeiculoFirebird, DMImportaDados do
  begin
    ZQModeloVeiculoRetifoz.Close;
    ZQModeloVeiculoRetifoz.Open;
    QModeloVeiculo.Open;
    while not ZQModeloVeiculoRetifoz.Eof do
    begin
      try
        // Feito para quando a importação possui muitos produtos
        // Estava dando out of memory
        query := TOracleDataSet1.Create(nil);
        query.Session := DMOracle.DBCemapa;
        query.Variables := QModeloVeiculo.Variables;
        query.Close;
        query.SQL := QModeloVeiculo.SQL;
        query.Open;
        query.Insert;
        query.FieldByName('COD_MODELO').Value := StrToInt(DMOracle.BuscaNome('SELECT SQVEICULO_MODELO.NEXTVAL FROM DUAL', '1=1'));
        query.FieldByName('DESC_MODELO').Value := Trim(ZQModeloVeiculoRetifozNOME.Value);
//        query.FieldByName('COD_FABRICANTE').Value  := 1;
        query.Post;

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

        DBGrid41.Refresh;
        query.Free;
        query := nil;
      Except
        If query.State = dsInsert Then
            query.Cancel;
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
      end;
      ZQModeloVeiculoRetifoz.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn56Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
    query : TOracleDataSet1;
    StringList : TStringList;
    wContaReferencial, wConta : String;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;
  StringList := TStringList.Create;
  StringList.Delimiter := '.';
  with DMPlanoContasFirebird, DMImportaDados do
  begin
    QPlanoConta.Open;
    ZQPlanoContaCli.Close;
    ZQPlanoContaCli.Open;
//    DMOracle.DBCemapa.StartTransaction;
    ZQPlanoContaCli.First;
    while not ZQPlanoContaCli.Eof do
    begin
      try
        query := TOracleDataSet1.Create(nil);
        query.Session := DMOracle.DBCemapa;
        query.Variables := QPlanoConta.Variables;
        query.Close;
        query.SQL := QPlanoConta.SQL;
        query.Open;
        query.Insert;

        query.FieldByName('COD_PLANO_CONTA').Value := DMOracle.Sequencia('PLANO_CONTA');
        query.FieldByName('COD_FILIAL').Value      := 1;
//        showmessage(ZQPlanoContaCliNUM_PLANO_CONTA.Value + bib.StrZero2(ZQPlanoContaCliCOD_CADASTRO.Value,6,0));
        query.FieldByName('NUM_PLANO_CONTA').Value := ZQPlanoContaCliNUM_PLANO_CONTA.Value + bib.StrZero2(ZQPlanoContaCliCOD_CADASTRO.Value,6,0);
        query.FieldByName('COD_REDUZIDO').Value    := ZQPlanoContaCliCOD_REDUZIDO.Value;
        query.FieldByName('NUM_GRAU').Value := 0;
{        StringList.DelimitedText := ZQPlanoContaRetifozNUM_GRAU.Value;
        if StringList.Count >= 6 then
          query.FieldByName('NUM_GRAU').Value:= 6//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;
        else
          query.FieldByName('NUM_GRAU').Value:= StringList.Count;//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;}
        query.FieldByName('DESC_PLANO_CONTA').Value   := ZQPlanoContaCliDESC_PLANO_CONTA.Value;
        query.FieldByName('DESC_NATUREZA_CONTA').Value:= ZQPlanoContaCliDESC_NATUREZA_CONTA.Value;
        query.FieldByName('IND_LIBERADO_USO').Value   := ZQPlanoContaCliIND_LIBERADO_USO.Value;

        query.Post;

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

//        DBGrid11.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QPlanoConta.Cancel;
        query.Free;
        query := nil;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQPlanoContaCli.Next;
      end;
      query.Free;
      query := nil;
      ZQPlanoContaCli.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;

end;

procedure TFImportaDados.BitBtn57Click(Sender: TObject);
var wImp, wNaoImp, wAux: Integer;
    query : TOracleDataSet1;
    StringList : TStringList;
    wContaReferencial, wConta : String;
begin
  wImp := 0;
  wNaoImp := 0;
  wAux := 1;
  StringList := TStringList.Create;
  StringList.Delimiter := '.';
  with DMPlanoContasFirebird, DMImportaDados do
  begin
    QPlanoConta.Open;
    ZQPlanoContaFor.Close;
    ZQPlanoContaFor.Open;
//    DMOracle.DBCemapa.StartTransaction;
    ZQPlanoContaFor.First;
    while not ZQPlanoContaFor.Eof do
    begin
      try
        query := TOracleDataSet1.Create(nil);
        query.Session := DMOracle.DBCemapa;
        query.Variables := QPlanoConta.Variables;
        query.Close;
        query.SQL := QPlanoConta.SQL;
        query.Open;
        query.Insert;

        query.FieldByName('COD_PLANO_CONTA').Value := DMOracle.Sequencia('PLANO_CONTA');
        query.FieldByName('COD_FILIAL').Value      := 1;
//        showmessage(ZQPlanoContaCliNUM_PLANO_CONTA.Value + bib.StrZero2(ZQPlanoContaCliCOD_CADASTRO.Value,6,0));
        query.FieldByName('NUM_PLANO_CONTA').Value := ZQPlanoContaForNUM_PLANO_CONTA.Value + bib.StrZero2(ZQPlanoContaForCOD_CADASTRO.Value,6,0);
        query.FieldByName('COD_REDUZIDO').Value    := ZQPlanoContaForCOD_REDUZIDO.Value;
        query.FieldByName('NUM_GRAU').Value := 0;
{        StringList.DelimitedText := ZQPlanoContaRetifozNUM_GRAU.Value;
        if StringList.Count >= 6 then
          query.FieldByName('NUM_GRAU').Value:= 6//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;
        else
          query.FieldByName('NUM_GRAU').Value:= StringList.Count;//ZQPlanoContaRetifozDESC_NATUREZA_CONTA.Value;}
        query.FieldByName('DESC_PLANO_CONTA').Value   := ZQPlanoContaForDESC_PLANO_CONTA.Value;
        query.FieldByName('DESC_NATUREZA_CONTA').Value:= ZQPlanoContaForDESC_NATUREZA_CONTA.Value;
        query.FieldByName('IND_LIBERADO_USO').Value   := ZQPlanoContaForIND_LIBERADO_USO.Value;

        query.Post;

        Inc(wImp);
        Inc(wAux);
        MEImp.Text := IntToStr(wImp);

//        DBGrid11.Refresh;
      Except
        if not DMOracle.DBCemapa.Connected then
        begin
          while not DMOracle.DBCemapa.Connected do
          begin
            DMOracle.DBCemapa.Connected := true;
            sleep(10000);
          end;
        end;
        QPlanoConta.Cancel;
        query.Free;
        query := nil;
        Inc(wNaoImp);
        MENaoImp.Text := IntToStr(wNaoImp);
        ZQPlanoContaFor.Next;
      end;
      query.Free;
      query := nil;
      ZQPlanoContaFor.Next;
    end;
    MEImp.Text := IntToStr(wImp);
    MENaoImp.Text := IntToStr(wNaoImp);
  end;
end;

procedure TFImportaDados.BitBtn58Click(Sender: TObject);
Var wCont,wRegNaoImp,wInd : Integer;
  wFone, wFoneCompleto: string;
  exec: TExecutador;
  query : TOracleDataSet1;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
     with DMCadastroFirebird, DMImportaDados do
     begin
       ZQCadastroAgroBickel.Close;
       ZQCadastroAgroBickel.Open;
       QCadastro.Open;
       DMOracle.DBCemapa.StartTransaction;
       ZQCadastroAgroBickel.First;

       wCont := 0;
       While not ZQCadastroAgroBickel.Eof do
       Begin
         Try
           query := TOracleDataSet1.Create(nil);
           query.Session := DMOracle.DBCemapa;
           query.Variables := QCadastro.Variables;
           query.Close;
           query.SQL := QCadastro.SQL;
           query.Open;
           query.Insert;
           query.FieldByName('COD_CADASTRO').Value := ZQCadastroAgroBickelCOD_CADASTRO.Value;
           query.FieldByName('COD_TIPO_CADASTRO').Value := 1;
            query.FieldByName('NOME').Value := ZQCadastroAgroBickelNOME.Value;
            query.FieldByName('IND_FISICA_JURIDICA').Value:= ZQCadastroAgroBickelIND_FISICA_JURIDICA.Value;
            if ZQCadastroAgroBickelDESC_FANTASIA.Value <> '' then
              query.FieldByName('DESC_FANTASIA').Value := bib.RemoveAcentos(ZQCadastroAgroBickelDESC_FANTASIA.Value)
            else
              query.FieldByName('RAZAO_SOCIAL').Value := bib.RemoveAcentos(ZQCadastroAgroBickelDESC_FANTASIA.Value);
            query.FieldByName('NUM_CGC_CPF').value := ZQCadastroAgroBickelNUM_CGC_CPF.Value;
             if Trim(ZQCadastroAgroBickelIND_SEXO_CATEGORIA.Value) = '' then
               query.FieldByName('IND_SEXO_CATEGORIA').Value :=  'F'
             else
               query.FieldByName('IND_SEXO_CATEGORIA').Value :=  ZQCadastroAgroBickelIND_SEXO_CATEGORIA.Value;
            query.FieldByName('DESC_CPF_CONJUGE').Value :=  ZQCadastroAgroBickelDESC_CPF_CONJUGE.Value;
            query.FieldByName('DESC_FANTASIA').Value :=  ZQCadastroAgroBickelDESC_FANTASIA.Value;
            query.FieldByName('DESC_ENDERECO').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelDESC_ENDERECO.Value);
            query.FieldByName('DESC_COMPLEMENTO').Value :=  ZQCadastroAgroBickelDESC_COMPLEMENTO.Value;
            query.FieldByName('DESC_BAIRRO').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelDESC_BAIRRO.Value);
            query.FieldByName('DESC_CIDADE').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelDESC_CIDADE.Value);
            query.FieldByName('COD_ESTADO').Value :=  ZQCadastroAgroBickelCOD_ESTADO.Value;
            query.FieldByName('DESC_CEP').Value :=  ZQCadastroAgroBickelDESC_CEP.Value;
            query.FieldByName('COD_PAIS').Value := 278;
            query.FieldByName('COD_REGIAO').Value := 1;
            query.FieldByName('COD_RAMO').Value := 1;
            query.FieldByName('DESC_CELULAR').Value :=  ZQCadastroAgroBickelDESC_CELULAR.Value;
            query.FieldByName('DESC_TELEFONE').Value :=  ZQCadastroAgroBickelDESC_TELEFONE.Value;
            query.FieldByName('DESC_FAX').Value :=  ZQCadastroAgroBickelDESC_FAX.Value;
            query.FieldByName('DESC_E_MAIL').Value :=  (ZQCadastroAgroBickelDESC_E_MAIL.Value);
            query.FieldByName('NUM_CAIXA_POSTAL').Value  := ZQCadastroAgroBickelNUM_CAIXA_POSTAL.Value;
            query.FieldByName('IND_TIPO_PROPRIETARIO').Value  := 0;
            if ZQCadastroAgroBickelDT_CADASTRO.AsString <> '' then
              query.FieldByName('DT_CADASTRO').Value :=  ZQCadastroAgroBickelDT_CADASTRO.Value
            else
              query.FieldByName('DT_CADASTRO').Value :=  date;
            if ZQCadastroAgroBickelDT_ALTERACAO.AsString <> '' then
                query.FieldByName('DT_ALTERACAO').Value:= ZQCadastroAgroBickelDT_ALTERACAO.Value;
            query.FieldByName('DT_FUNDACAO').Value :=  ZQCadastroAgroBickelDT_FUNDACAO.Value;
            query.FieldByName('NOME_PAI').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelNOME_PAI.Value);
            query.FieldByName('NOME_MAE').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelNOME_MAE.Value);
            query.FieldByName('DT_NASCIMENTO').Value :=  ZQCadastroAgroBickelDT_NASCIMENTO.Value;
            query.FieldByName('VAL_SALARIO').Value :=  ZQCadastroAgroBickelVAL_SALARIO.Value;
            query.FieldByName('COD_ESTADO_CIVIL').Value  := 1;
            query.FieldByName('NOME_CONJUGE').Value :=  ZQCadastroAgroBickelNOME_CONJUGE.Value;
            query.FieldByName('DT_NASCIMENTO_CONJUGE').Value :=  ZQCadastroAgroBickelDT_NASCIMENTO_CONJUGE.Value;
            query.FieldByName('NUM_INSCRICAO').Value :=  ZQCadastroAgroBickelNUM_INSCRICAO.Value;
            query.FieldByName('COD_CIDADE').Value :=  ZQCadastroAgroBickelCOD_CIDADE.Value;
            query.FieldByName('COD_FILIAL').Value :=  ZQCadastroAgroBickelCOD_FILIAL.Value;
            query.FieldByName('DESC_ENDERECO_COBRANCA').Value :=  ZQCadastroAgroBickelDESC_ENDERECO_COBRANCA.Value;
            query.FieldByName('DESC_CIDADE_COBRANCA').Value :=  ZQCadastroAgroBickelDESC_CIDADE_COBRANCA.Value;
            query.FieldByName('DESC_CEP_COBRANCA').Value :=  ZQCadastroAgroBickelDESC_CEP_COBRANCA.Value;
            
            query.FieldByName('DESC_BAIRRO_COBRANCA').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelDESC_BAIRRO_COBRANCA.Value);
            query.FieldByName('DESC_BAIRRO_ENTREGA').Value :=  bib.RemoveAcentos(ZQCadastroAgroBickelDESC_BAIRRO_ENTREGA.Value);
            query.FieldByName('DESC_IDENTIDADE_CONJUGE').Value :=  ZQCadastroAgroBickelDESC_IDENTIDADE_CONJUGE.Value;
            query.FieldByName('VL_SALARIO_CONJUGE').Value :=  ZQCadastroAgroBickelVL_SALARIO_CONJUGE.Value;
            wind := 1;
            wFone := '';
            while wInd <= Length(ZQCadastroAgroBickelDESC_CELULAR.Value) do
              begin
                if (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroAgroBickelDESC_CELULAR.Value,wInd,1);
                Inc(wInd);
              end;
              while wInd <= Length(ZQCadastroAgroBickelDESC_TELEFONE.Value) do
                begin
                  if (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '0') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '1') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '2') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '3') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '4') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '5') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '6') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '7') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '8') Or
                  (Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1) = '9') Then
                  wFone := wFone + Copy(ZQCadastroAgroBickelDESC_TELEFONE.Value,wInd,1);
                  Inc(wInd);
                end;
                if Length(wFone) = 8 then
                  wFoneCompleto := '45'+ wFone
                else
                  wFoneCompleto := wFone;
                
            Except
              Inc(wRegNaoImp);
              If query.State = dsInsert Then
              query.Cancel;
            end;
            query.Post;
            query.Free;
            query := nil;
            ZQCadastroAgroBickel.Next;
     End;
     If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
        MEImp.Text := FloatToStr(wCont-wRegNaoImp);
        MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn59Click(Sender: TObject);
var S, wDescTabelaPreco, wValor, wCodProduto: String;
    F: TextFile;
    mContador : integer;
begin
  wDescTabelaPreco := '';
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMTabelaPreco do
    begin
      QTabelaPrecoCab.Close;
      QTabelaPrecoItem.Close;
      QTabelaPrecoCab.Open;
      QTabelaPrecoItem.Open;
      mContador := 0;
      try
        dmoracle.DBCemapa.startTransaction;
        while Trim(S) <> '' do
        begin
          wCodProduto := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + Trim(Copy(S,20,04)));
          if wCodProduto = ''  then
          begin
            with DMImportaDados do
            begin
              QProduto.Open;
              QProduto.Insert;
              QProdutoCOD_PRODUTO.Value :=  StrToInt(Trim(Copy(S,20,04)));
              QProdutoCOD_CLASSE.Value := 2;
              QProdutoCOD_TRIBUTACAO.Value := 1;
              QProdutoDESC_PRODUTO.Value := Trim(Copy(S,24,30));
              QProdutoDESC_UNIDADE.Value := 'UN';
              QProdutoNUM_GENERO_NCM.Value := '00000000';
              QProdutoNUM_EMBALAGEM.Value := 1;
              wValor :=  Trim(Copy(S,61,10));
              QProdutoVAL_VAREJO.Value := StrToFloat(wValor)/100;
              QProdutoVAL_ATACADO.Value := StrToFloat(wValor)/100;
              QProdutoNUM_VOLUMES.Value := 1;
              QProdutoIND_TIPO_PRODUTO.Value := 'SERVIÇO';
              QProdutoPERC_INSS.Value := 0;
              QProdutoPERC_ISS.Value := 0;
              QProdutoIND_SITUACAO.Value := 'ATIVO';
              QProduto.Post;
            end;
          end;
          wDescTabelaPreco := DMOracle.FastSelect('DESC_TABELA_PRECO','TB_TABELA_PRECO_CAB','DESC_TABELA_PRECO = ' + QuotedStr(Trim(Copy(S,05,15))) );

          if wDescTabelaPreco = '' then  //if wDescTabelaPreco <> Trim(Copy(S,05,15)) then
          begin
            QTabelaPrecoCab.Insert;
            QTabelaPrecoCabDESC_TABELA_PRECO.Value := Trim(Copy(S,05,15));
            QTabelaPrecoCabIND_SITUACAO.Value := 'ATIVO';
            QTabelaPrecoCabIND_BLOQUEIA_DESCONTO.Value := 'NAO';
            QTabelaPrecoItem.Insert;
            QTabelaPrecoItemCOD_PRODUTO.Value := StrToInt(Trim(Copy(S,20,04)));
            QTabelaPrecoItemQT_QUANTIDADE.Value := StrToInt(Trim(Copy(S,58,2)));
            wValor :=  Trim(Copy(S,61,10));
            QTabelaPrecoItemVAL_PRECO.Value := StrToFloat(wValor)/100;

            QTabelaPrecoCab.Post;
          end
          else
          begin
            QTabelaPrecoItem.Insert;
            QTabelaPrecoItemCOD_TABELA_PRECO_CAB.Value := StrToInt(DMOracle.FastSelect('COD_TABELA_PRECO_CAB','TB_TABELA_PRECO_CAB','DESC_TABELA_PRECO = ' + QuotedStr(Trim(Copy(S,05,15))) ));
            QTabelaPrecoItemCOD_PRODUTO.Value := StrToInt(Trim(Copy(S,20,04)));
            QTabelaPrecoItemQT_QUANTIDADE.Value := StrToInt(Trim(Copy(S,58,2)));
            wValor :=  Trim(Copy(S,61,10));
            QTabelaPrecoItemVAL_PRECO.Value := StrToFloat(wValor)/100;
            QTabelaPrecoItem.Post;
          end;
          //wDescTabelaPreco := Trim(Copy(S,05,15));
          mContador := mContador + 1;
          MEImp.Text := IntToStr(mContador);
          MEImp.Refresh;
          Readln(F,S);   {Le a linha do arquivo texto}
        end; // Fim While
        dmoracle.DBCemapa.commit;
        ShowMessage('Notas Importadas com Exito');
        except
          dmoracle.dbcemapa.rollback;
          ShowMessage('Erro no Arquivo de exportação, nenhuma NF foi Importada.');
      end;
    end;
  end;
end;

{procedure TFImportaDados.BtImportaProdutoClick(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
wClasse: string;
exec: TExecutador;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    with DMProdutoFirebird do
    begin
      QProduto.Open;
      ZQProduto.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProduto.First;

      wCont := 0;
      While not ZQProduto.Eof do
      Begin
        Try
          QProduto.Insert;
          //QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');
          QProdutoCOD_PRODUTO.Value :=  ZQProdutoCOD_PRODUTO.Value;
          //QProdutoNUM_FABRICANTE.Value :=  ZQProdutoCOD_PRODUTO.Value;

          QClasseCons.Close;
          QClasseCons.SetVariable('NUM_CLASSE', 1);
          QClasseCons.SetVariable('NUM_SUBCLASSE', ZQProdutoNUM_SUBGRUPO.Value);
          QClasseCons.Open;

         // wClasse :=  DMOracle.BuscaNome('SELECT NVL(COD_CLASSE,6)' + comentado marcos
          //  ' FROM TB_CLASSE','DESC_CLASSE LIKE ' + QuotedStr(ZQProdutoDESC_CLASSE.Text));
          QProdutoCOD_CLASSE.Text := QClasseConsCOD_CLASSE.Text;
          QProdutoCOD_TRIBUTACAO.Value := 1;
          QProdutoDESC_PRODUTO.Value := UpperCase(ZQProdutodesc_produto.Value);
          QProdutoDESC_UNIDADE.Value := copy(UpperCase(ZQProdutodesc_unidade.Value),1,3);
          QProdutoNUM_GENERO_NCM.Value := ZQProdutoNUM_GENERO_NCM.Value;
          QProdutoNUM_EMBALAGEM.Value := 1;
          QProdutoNUM_PESO_BRUTO.Value := ZQProdutoNUM_PESO_BRUTO.value;
          QProdutoNUM_PESO_LIQUIDO.Value := ZQProdutoNUM_PESO_BRUTO.value;
          QprodutoDESC_COD_BARRA.Value := copy(ZQProdutoDESC_COD_BARRA.Value,1,20);

          QProdutoVAL_VAREJO.Value := ZQProdutoVAL_VAREJO.Value;
          QProdutoVAL_ATACADO.Value := ZQProdutoVAL_VAREJO.Value;
          QProdutoPERC_MARGEM_VAREJO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
          QProdutoPERC_MARGEM_ATACADO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
          //QProdutoPERC_IPI.Value := ZQProdutoPERC_IPI.Value;

          QProdutoNUM_VOLUMES.Value := 1;
          QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
          QProdutoPERC_INSS.Value := 0;
          QProdutoPERC_ISS.Value := 0;
          If ZQProdutoind_situacao.Value = 'S' Then
            QProdutoIND_SITUACAO.Value := 'ATIVO'
          else
            QProdutoIND_SITUACAO.Value := 'DESATIVADO';
          QProduto.Post;
        Except
          Inc(wRegNaoImp);
          If QProduto.State = dsInsert Then
            QProduto.Cancel;
        End;
        ZQProduto.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;

      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;}




procedure TFImportaDados.BitBtn60Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wDescMarca: string;
begin
 // Cria Excel- OLE Object
  XLSAplicacao := CreateOleObject('Excel.Application');
  with DMOracle, DMImportaDados do
  begin
    try
    if (ODImportaXLS.Execute) then
    begin
      wCaminhoArquivo := ExtractFilePath(ODImportaXLS.FileName) +  ExtractFileName(ODImportaXLS.FileName);
      // Esconde Excel
      XLSAplicacao.Visible := False;
      // Abre o Workbook
      XLSAplicacao.Workbooks.Open(wCaminhoArquivo);

      {Selecione aqui a aba que você deseja abrir primeiro - 1,2,3,4....}
      XLSAplicacao.WorkSheets[1].Activate;
      {Selecione aqui a aba que você deseja ativar - começando sempre no 1 (1,2,3,4) }
      AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(wCaminhoArquivo)].WorkSheets[1];

      AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      // Pegar o número da última linha
      maxLinha := XLSAplicacao.ActiveCell.Row;
      // Pegar o número da última coluna
      maxColuna := XLSAplicacao.ActiveCell.Column;

      for i:= 2 to maxLinha do
      begin

        QCadastro.Close;
        QCadastro.Open;
        QCadastro.Insert;
        // Associaca a variant WorkSheet com a variant do Delphi
        //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
        QCadastroCOD_CADASTRO.Value := StrToInt(DMOracle.BuscaNome('SELECT SQcadastro.NEXTVAL FROM DUAL', '1=1'));//(XLSAplicacao.Cells.Item[i, 1].Value);
        QCadastroDESC_FANTASIA.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 1].Value));
        QCadastroDESC_OBS.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 2].Value));
        if  UpperCase(XLSAplicacao.Cells.Item[i, 3].Value) = 'PJ' then
          QCadastroIND_FISICA_JURIDICA.Value := 'J'
        else
          QCadastroIND_FISICA_JURIDICA.Value := 'F';
        if XLSAplicacao.Cells.Item[i, 4].Value <> '' then
          QCadastroNOME.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 4].Value))
        else
          QCadastroNOME.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 1].Value));
        QCadastroNUM_CGC_CPF.Value   := UpperCase(XLSAplicacao.Cells.Item[i, 5].Value); //CPF/CNPJ
        QCadastroNUM_INSCRICAO.Value := UpperCase(XLSAplicacao.Cells.Item[i, 6].value); //I.E
        QCadastroDESC_ENDERECO.Value:=  UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 7].Value)); //endereço
        QCadastroDESC_BAIRRO.Value  :=  UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 8].Value));//bairro
        QCadastroDESC_CIDADE.Value  :=  UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 9].Value)); //cidade
        if XLSAplicacao.Cells.Item[i, 10].Value <> '' then
          QCadastroCOD_ESTADO.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 10].Value)) //cidade
        else
          QCadastroCOD_ESTADO.Value := 'PR';
        QCadastroDESC_CEP.Value     :=  XLSAplicacao.Cells.Item[i, 14].Value; //cep
        QCadastroDESC_TELEFONE.Value:=  XLSAplicacao.Cells.Item[i, 15].Value; //telefone
        QCadastroDESC_CELULAR.Value :=  XLSAplicacao.Cells.Item[i, 16].Value;//celular
        QCadastroDESC_E_MAIL.Value  :=  XLSAplicacao.Cells.Item[i, 17].Value;//celular
        QCadastroDESC_E_MAIL1.Value :=  XLSAplicacao.Cells.Item[i, 17].Value;//celular
        QCadastroDT_CADASTRO.Value := Date;
        QCadastroCOD_TIPO_CADASTRO.Value :=1;
        QCadastroIND_SEXO_CATEGORIA.Value := 'M';
        QCadastroCOD_PAIS.Value := 278;

        QCadastro.Post;
      end;
      ShowMessage('Importação efetuada com sucesso');
    end;
    finally
    // Fecha o Microsoft Excel
      if not VarIsEmpty(XLSAplicacao) then
      begin
        XLSAplicacao.Workbooks.Close;
        XLSAplicacao.Quit;
        AbaXLS := Unassigned;
        XLSAplicacao := Unassigned;
      end;
    end;
  end;
end;

procedure TFImportaDados.BitBtn61Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wDescMarca: string;
begin
// Cria Excel- OLE Object
  XLSAplicacao := CreateOleObject('Excel.Application');
  with DMOracle, DMImportaDados do
  begin
    try
    if (ODImportaXLS.Execute) then
    begin
      wCaminhoArquivo := ExtractFilePath(ODImportaXLS.FileName) +  ExtractFileName(ODImportaXLS.FileName);
      // Esconde Excel
      XLSAplicacao.Visible := False;
      // Abre o Workbook
      XLSAplicacao.Workbooks.Open(wCaminhoArquivo);

      {Selecione aqui a aba que você deseja abrir primeiro - 1,2,3,4....}
      XLSAplicacao.WorkSheets[1].Activate;
      {Selecione aqui a aba que você deseja ativar - começando sempre no 1 (1,2,3,4) }
      AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(wCaminhoArquivo)].WorkSheets[1];

      AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      // Pegar o número da última linha
      maxLinha := XLSAplicacao.ActiveCell.Row;
      // Pegar o número da última coluna
      maxColuna := XLSAplicacao.ActiveCell.Column;

      for i:= 2 to maxLinha do
      begin

        QCadastro.Close;
        QCadastro.Open;
        QCadastro.Insert;
        // Associaca a variant WorkSheet com a variant do Delphi
        //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
        QCadastroCOD_CADASTRO.Value := StrToInt(DMOracle.BuscaNome('SELECT SQcadastro.NEXTVAL FROM DUAL', '1=1'));//(XLSAplicacao.Cells.Item[i, 1].Value);
        QCadastroDESC_FANTASIA.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 1].Value));
        QCadastroNOME.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 1].Value));
        QCadastroNUM_CGC_CPF.Value   := UpperCase(XLSAplicacao.Cells.Item[i, 2].Value); //CPF/CNPJ
        QCadastroDESC_CIDADE.Value  :=  UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value)); //cidade
        QCadastroDESC_OBS.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 4].Value));
        if  UpperCase(XLSAplicacao.Cells.Item[i, 2].Value) <> '' then
          QCadastroIND_FISICA_JURIDICA.Value := 'J'
        else
          QCadastroIND_FISICA_JURIDICA.Value := 'F';
        QCadastroCOD_ESTADO.Value := 'PR';
        QCadastroDESC_TELEFONE.Value:=  XLSAplicacao.Cells.Item[i, 5].Value; //telefone
        QCadastroDESC_CELULAR.Value :=  XLSAplicacao.Cells.Item[i, 6].Value;//celular
        QCadastroDESC_E_MAIL.Value  :=  XLSAplicacao.Cells.Item[i, 7].Value;//celular
        QCadastroDESC_E_MAIL1.Value :=  XLSAplicacao.Cells.Item[i, 7].Value;//celular
        QCadastroDT_CADASTRO.Value := Date;
        QCadastroCOD_TIPO_CADASTRO.Value :=2;
        QCadastroIND_SEXO_CATEGORIA.Value := 'M';
        QCadastroCOD_PAIS.Value := 278;

        QCadastro.Post;
      end;
      ShowMessage('Importação efetuada com sucesso');
    end;
    finally
    // Fecha o Microsoft Excel
      if not VarIsEmpty(XLSAplicacao) then
      begin
        XLSAplicacao.Workbooks.Close;
        XLSAplicacao.Quit;
        AbaXLS := Unassigned;
        XLSAplicacao := Unassigned;
      end;
    end;
  end;
end;

procedure TFImportaDados.BitBtn62Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
  wClasse: string;
  exec: TExecutador;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    with DMProdutoFirebird do
    begin
      QProduto.Open;
      ZQProdutoSGB.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoSGB.First;

      wCont := 0;
      While not ZQProdutoSGB.Eof do
      Begin
        Try
          QProduto.Insert;
          QProdutoCOD_PRODUTO.Value :=  DMOracle.Sequencia('PRODUTO');

          QProdutoCOD_CLASSE.Text := ZQProdutoSGBCOD_CLASSE.Text;
          QProdutoCOD_TRIBUTACAO.Value := 1;
          QProdutoDESC_PRODUTO.Value := UpperCase(bib.RemoveAcentos(ZQProdutoSGBDESC_PRODUTO.Value));
          QProdutoDESC_UNIDADE.Value := copy(UpperCase(ZQProdutoSGBDESC_UNIDADE.Value),1,3);
          QProdutoNUM_GENERO_NCM.Value := ZQProdutoSGBNUM_GENERO_NCM.Value;
          QProdutoNUM_EMBALAGEM.Value := 1;
//          QProdutoNUM_PESO_BRUTO.Value := ZQProdutoNUM_PESO_BRUTO.value;
//          QProdutoNUM_PESO_LIQUIDO.Value := ZQProdutoNUM_PESO_BRUTO.value;
//          QprodutoDESC_COD_BARRA.Value := copy(ZQProdutoDESC_COD_BARRA.Value,1,20);

          QProdutoVAL_VAREJO.Value := ZQProdutoSGBVAL_VAREJO.Value;
          QProdutoVAL_ATACADO.Value := ZQProdutoSGBVAL_VAREJO.Value;
//          QProdutoPERC_MARGEM_VAREJO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
//          QProdutoPERC_MARGEM_ATACADO.Value := ZQProdutoPERC_MARGEM_VAREJO.Value;
          //QProdutoPERC_IPI.Value := ZQProdutoPERC_IPI.Value;

          QProdutoNUM_VOLUMES.Value := 1;
          QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
          QProdutoPERC_INSS.Value := 0;
          QProdutoPERC_ISS.Value := 0;
          QProdutoIND_SITUACAO.Value := 'ATIVO';
          QProduto.Post;
        Except
          Inc(wRegNaoImp);
          If QProduto.State = dsInsert Then
            QProduto.Cancel;
        End;
        ZQProdutoSGB.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;

        //Insere imagem dos produtos
       { ZQProduto.First;
        while not ZQProduto.Eof do
        begin
          {if Trim(ZQProdutoIMG_FOTO.Value) <> '' then  comentado marcos
          begin
            exec := TExecutador.Create;
            exec.Adiciona('INSERT INTO TB_IMAGEM_PRODUTO '+
              'VALUES(SQIMAGEM_PRODUTO.NEXTVAL, ' +
              copy(ZQProdutoCOD_PRODUTO.Text,1,6) + ', '+
              quotedStr(ZQProdutoIMG_FOTO.Value) + ')');
            exec.Executar(false,true);
            exec.Fecha;exec.Free;
          end;
          ZQProduto.Next;
        end;  }
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn63Click(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp, wCxPostal : Integer;
    wFone : String;
    wIsNumber: boolean;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    with DMCadastroFirebird, DMOracle do
    begin
      //TCadastro.Open;
//      ZQfornecedor.Open;
      ZQClienteSGB.Open;
      QCadastro.Open;
//      ZQFornecedor.First;
      ZQClienteSGB.First;
      //ZQCidadeCons.Open;
      //DMCidade.QCidade.Open;
      {while not ZQCidadeCons.Eof do
      begin
        with DMCidade do
        begin
          try
            QCidade.Insert;
            QCidadeCOD_CIDADE.Value := ZQCidadeConsCOD_CIDADE.Value;
            if ZQCidadeConsDESC_CIDADE.Value <> '' then
              QCidadeDESC_CIDADE.Value := ZQCidadeConsDESC_CIDADE.Value
            else
              QCidadeDESC_CIDADE.Value := 'MEDIANEIRA';
            if ZQCidadeConsCOD_ESTADO.Text <> '' then
              QCidadeCOD_ESTADO.Value := ZQCidadeConsCOD_ESTADO.Value
            else
              QCidadeCOD_ESTADO.Value := 'PR';
            QCidadeCOD_CIDADE_IBGE.Value := ZQCidadeConsCOD_CIDADE_IBGE.Value;
            QCidade.Post;
          Except
            ShowMessage('Código da cidade: ' + ZQCidadeConsCOD_CIDADE.Text);
            DMOracle.DBCemapa.Rollback;
          end;
        end;
        ZQCidadeCons.Next;
      end;}
      wCont := 0;
      wRegNaoImp := 0;
      DMOracle.DBCEmapa.StartTransaction;
      While not ZQClienteSGB.Eof do
      Begin
        Try
          QCadastro.Insert;
          //QCadastroCOD_CADASTRO.Value := strtoint(copy(ZQFornecedorCOD_CADASTRO.text,1,6));
          QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
          {if ZQFornecedorDESC_CADASTRO.Text <> '' then
            QCadastroNOME.Value := UpperCase(copy(ZQFornecedorDESC_CADASTRO.Value,1,60))
          else
            QCadastroNOME.Value := 'CADASTRO SEM NOME';}
        QCadastroNOME.Value := UpperCase(bib.RemoveAcentos(ZQClienteSGBNOME.Value));
        QCadastroDESC_FANTASIA.Value := UpperCase(Bib.RemoveAcentos(ZQClienteSGBDESC_FANTASIA.Value));
        QCadastroDESC_ENDERECO.Value :=  UpperCase(bib.RemoveAcentos(copy(ZQClienteSGBDESC_ENDERECO.Value,1,60)));
          if ZQClienteSGBDESC_CIDADE.Value <> '' then
          begin
            QCadastroDESC_CIDADE.Value := UpperCase(Bib.RemoveAcentos(copy(ZQClienteSGBDESC_CIDADE.Value,1,30)));
            QBuscaCodCidade.Close;
            QBuscaCodCidade.SetVariable('CIDADE', UpperCase(Bib.RemoveAcentos(copy(ZQClienteSGBDESC_CIDADE.Value,1,30))));
            QBuscaCodCidade.Open;
            if QBuscaCodCidade.RecordCount > 0 then
              QCadastroCOD_CIDADE.value := QBuscaCodCidadeCOD_CIDADE.Value;
          end
          else
            QCadastroDESC_CIDADE.Value := 'CADASTRO SEM CIDADE';
          If ZQClienteSGBCOD_ESTADO.Value <> '' Then
             QCadastroCOD_ESTADO.Value :=  UpperCase(copy(ZQClienteSGBCOD_Estado.Value,1,2))
          Else
             QCadastroCOD_ESTADO.Value := 'PR';

          QCadastroDESC_CEP.Value :=  copy(ZQClienteSGBDESC_CEP.Value,1,9);
          QCadastroNUM_INSCRICAO.Value := ZQClienteSGBNUM_INSCRICAO.Value;
          //QCadastroDESC_TELEFONE.Value := ZQClienteSGBDESC_FONE.Value;
          wind := 1;
          wFone := '';
          While wInd <= Length(ZQClienteSGBDESC_FONE.Value) do
           Begin
             If (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '0') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '1') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '2') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '3') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '4') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '5') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '6') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '7') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '8') Or
                (Copy(ZQClienteSGBDESC_fone.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQClienteSGBDESC_fone.Value,wInd,1);
             Inc(wInd);
           End;
           QCadastroDESC_TELEFONE.Value := copy(wFone,1,13);

           wind := 1;
           wFone := '';
           While wInd <= Length(ZQClienteSGBDESC_FONE_CELULAR.Value) do
           Begin
             If (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '0') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '1') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '2') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '3') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '4') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '5') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '6') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '7') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '8') Or
                (Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQClienteSGBDESC_FONE_CELULAR.Value,wInd,1);
             Inc(wInd);
           End;
           QCadastroDESC_CELULAR.Value := copy(wFone,1,12);

          QCadastroNUM_CGC_CPF.Value :=  copy(ZQClienteSGBNUM_CGC_CPF.value,1,18);
          QCadastroDESC_BAIRRO.Value :=  UpperCase(Bib.RemoveAcentos(copy(ZQClienteSGBDESC_bairro.Value,1,20)));
          //QCadastroDT_NASCIMENTO.Text :=  ZQFornecedorDT_NASCIMENTO.Text;
//          If ZQFornecedordt_cadastro.Text <> ''  Then
//             QCadastroDT_CADASTRO.value :=  StrToDate(ZQFornecedorDT_CADASTRO.Text)
//          Else
           QCadastroDT_CADASTRO.Value :=  Date;
          QCadastroCOD_PAIS.Value :=  278;  // TCadastroIDNACAO.Value;
          QCadastroCOD_REGIAO.Value := 1;
//          QCadastroDESC_FAX.Value :=  copy(ZQFornecedorDESC_FAX.Value,1,13);
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroIND_SEXO_CATEGORIA.Value := 'J';
          {if (ZQCadastrocxpostal.Value <> '') and (Length(ZQCadastrocxpostal.text) <= 6) then
          begin
            wIsNumber := TryStrToInt(ZQCadastrocxpostal.Value, wCxPostal);
            if wIsNumber then
              QCadastroNUM_CAIXA_POSTAL.Value :=  wCxPostal;
          end;}
          //QCadastroDESC_FANTASIA.Value :=  UpperCase(copy(ZQCadastrofantasia.Value,1,30));
          QCadastroCOD_RAMO.Value := 1;
          QCadastroCOD_VENDEDOR.Value := 1;
          //QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));

          //QCadastroCOD_CIDADE.Value := ZQCadastrocod_cidade.Value;
          //QCadastroDESC_CIDADE_COBRANCA.Value :=  UpperCase(copy(ZQCadastrocidadecobranca.Value,1,30));

          //QCadastroDESC_ENDERECO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroENDERECOCOBRANCA.Value,1,40));
          //QCadastroDESC_CEP_COBRANCA.Value :=  copy(ZQCadastroCEPCOBRANCA.Value,1,9);
          //QCadastroDESC_FAX_COBRANCA.Value := ZQCadastrodesc_fax_cobranca.Value;
          //QCadastroDESC_BAIRRO_COBRANCA.Value := ZQCadastrodesc_bairro_cobranca.Value;
          //QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));
          if Length(ZQClienteSGBNUM_CGC_CPF.Value) > 11 then
            QCadastroCOD_TIPO_CADASTRO.Value := 2
          else
            QCadastroCOD_TIPO_CADASTRO.Value := 1;

//          QCadastroNOME_CONTATO.Value := ZQFornecedordesc_contato.Value;
          QCadastroIND_SEPROC_SIMNAO.Value := 'N';
          if Length(ZQClienteSGBNUM_CGC_CPF.Value) > 11 then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := copy(ZQClienteSGBDESC_E_MAIL.value,1,70);
          //QCadastroDESC_E_MAIL1.Value := ZQCadastroDESC_EMAIL1.value;
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQClienteSGBNOME.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQClienteSGB.Next;
      End;
      //aqui começa importar clientes
      {While not ZQCliente.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := StrToInt(DMOracle.BuscaNome('SELECT SQcadastro.NEXTVAL FROM DUAL', '1=1'));;
          //QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
          if ZQClienteDESC_CADASTRO.Text <> '' then
            QCadastroNOME.Value := UpperCase(copy(ZQClienteDESC_CADASTRO.Value,1,60))
          else
            QCadastroNOME.Value := 'CADASTRO SEM NOME';
          QCadastroDESC_ENDERECO.Value :=  UpperCase(copy(ZQClienteDESC_ENDERECO.Value,1,60));
          if ZQFornecedorDESC_CIDADE.Value <> '' then
          begin
            QCadastroDESC_CIDADE.Value := UpperCase(copy(ZQClienteDESC_CIDADE.Value,1,30));
            QBuscaCodCidade.Close;
            QBuscaCodCidade.SetVariable('CIDADE', UpperCase(copy(ZQClienteDESC_CIDADE.Value,1,30)));
            QBuscaCodCidade.Open;
            if QBuscaCodCidade.RecordCount > 0 then
              QCadastroCOD_CIDADE.value := QBuscaCodCidadeCOD_CIDADE.Value;
          end
          else
            QCadastroDESC_CIDADE.Value := 'CADASTRO SEM CIDADE';
          If ZQClienteCOD_ESTADO.Value <> '' Then
             QCadastroCOD_ESTADO.Value :=  UpperCase(copy(ZQClienteCOD_Estado.Value,1,2))
          Else
             QCadastroCOD_ESTADO.Value := 'PR';

          QCadastroDESC_CEP.Value :=  copy(ZQClienteDESC_CEP.Value,1,9);
          //QCadastroNUM_INSCRICAO.Value := ZQClienteDESC_INSCRICAO_ESTADUAL.Value;
          wind := 1;
          wFone := '';
          While wInd <= Length(ZQClienteDESC_FONE.Value) do
           Begin
             If (Copy(ZQClienteDESC_fone.Value,wInd,1) = '0') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '1') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '2') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '3') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '4') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '5') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '6') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '7') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '8') Or
                (Copy(ZQClienteDESC_fone.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQClienteDESC_fone.Value,wInd,1);
             Inc(wInd);
           End;
          QCadastroDESC_TELEFONE.Value := copy(wFone,1,13);
          QCadastroNUM_CGC_CPF.Value :=  copy(ZQClienteNUM_CGC_CPF.value,1,18);
          QCadastroDESC_BAIRRO.Value :=  UpperCase(copy(ZQClienteDESC_bairro.Value,1,20));
          //QCadastroDT_NASCIMENTO.Text :=  ZQClienteDT_NASCIMENTO.Text;
          If ZQClientedt_cadastro.Text <> ''  Then
             QCadastroDT_CADASTRO.value :=  StrToDate(ZQClienteDT_CADASTRO.Text)
          Else
             QCadastroDT_CADASTRO.Value :=  Date;
          QCadastroCOD_PAIS.Value :=  278;  // TCadastroIDNACAO.Value;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroDESC_FAX.Value :=  copy(ZQClienteDESC_FAX.Value,1,13);
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroIND_SEXO_CATEGORIA.Value := 'J';
          {if (ZQCadastrocxpostal.Value <> '') and (Length(ZQCadastrocxpostal.text) <= 6) then
          begin
            wIsNumber := TryStrToInt(ZQCadastrocxpostal.Value, wCxPostal);
            if wIsNumber then
              QCadastroNUM_CAIXA_POSTAL.Value :=  wCxPostal;
          end;}{
          //QCadastroDESC_FANTASIA.Value :=  UpperCase(copy(ZQCadastrofantasia.Value,1,30));
          QCadastroCOD_RAMO.Value := 1;
          QCadastroCOD_VENDEDOR.Value := 1;
          //QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));

          //QCadastroCOD_CIDADE.Value := ZQCadastrocod_cidade.Value;
          //QCadastroDESC_CIDADE_COBRANCA.Value :=  UpperCase(copy(ZQCadastrocidadecobranca.Value,1,30));

          //QCadastroDESC_ENDERECO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroENDERECOCOBRANCA.Value,1,40));
          //QCadastroDESC_CEP_COBRANCA.Value :=  copy(ZQCadastroCEPCOBRANCA.Value,1,9);
          //QCadastroDESC_FAX_COBRANCA.Value := ZQCadastrodesc_fax_cobranca.Value;
          //QCadastroDESC_BAIRRO_COBRANCA.Value := ZQCadastrodesc_bairro_cobranca.Value;
          //QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(copy(ZQCadastroUFCOBRANCA.Value,1,2));
          if Length(ZQClienteNUM_CGC_CPF.Value) > 11 then
            QCadastroCOD_TIPO_CADASTRO.Value := 2
          else
            QCadastroCOD_TIPO_CADASTRO.Value := 1;
          QCadastroDESC_CELULAR.Value := copy(ZQClientedesc_celular.Value,1,12);
          //QCadastroNOME_CONTATO.Value := ZQClientedesc_contato.Value;
          QCadastroIND_SEPROC_SIMNAO.Value := 'N';
          if Length(ZQClienteNUM_CGC_CPF.Value) > 11 then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := copy(ZQClientedesc_EMAIL.value,1,70);
          //QCadastroDESC_E_MAIL1.Value := ZQCadastroDESC_EMAIL1.value;
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQClienteCOD_CADASTRO.Text + ZQClienteDESC_CADASTRO.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQCliente.Next;
      End;}
    end;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
  MessageDlg(memo1.Text, mtInformation, [mbOK], 0);

end;

procedure TFImportaDados.BitBtn64Click(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp, wCxPostal : Integer;
    wFone : String;
    wIsNumber: boolean;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    with DMCadastroFirebird, DMOracle do
    begin
      ZQCadastroMHNFE.Open;
      QCadastro.Open;

      ZQCadastroMHNFE.First;
      wCont := 0;
      wRegNaoImp := 0;
      DMOracle.DBCEmapa.StartTransaction;
      While not ZQCadastroMHNFE.Eof do
      Begin
        Try
          QCadastro.Insert;
          QCadastroCOD_CADASTRO.Value := ZQCadastroMHNFECOD_CADASTRO.Value;

          QCadastroNOME.Value := UpperCase(bib.RemoveAcentos(ZQCadastroMHNFENOME.Value));
          QCadastroDESC_FANTASIA.Value := UpperCase(Bib.RemoveAcentos(ZQCadastroMHNFEDESC_FANTASIA.Value));
          QCadastroDESC_ENDERECO.Value :=  UpperCase(bib.RemoveAcentos(copy(ZQCadastroMHNFEDESC_ENDERECO.Value,1,60)));

          QCadastroDESC_CIDADE.Value := UpperCase(Bib.RemoveAcentos(copy(ZQCadastroMHNFEDESC_CIDADE.Value,1,30)));
          QBuscaCodCidade.Close;
          QBuscaCodCidade.SetVariable('CIDADE', UpperCase(Bib.RemoveAcentos(copy(ZQCadastroMHNFEDESC_CIDADE.Value,1,30))));
          QBuscaCodCidade.Open;
          if QBuscaCodCidade.RecordCount > 0 then
            QCadastroCOD_CIDADE.value := QBuscaCodCidadeCOD_CIDADE.Value;
          QCadastroCOD_ESTADO.Value :=  UpperCase(copy(ZQCadastroMHNFECOD_Estado.Value,1,2));
          QCadastroDESC_CEP.Value :=    bib.LimpaString(ZQCadastroMHNFEDESC_CEP.Value,'.');
          QCadastroNUM_INSCRICAO.Value := ZQCadastroMHNFENUM_INSCRICAO.Value;

          wind := 1;
          wFone := '';
          While wInd <= Length(ZQCadastroMHNFEDESC_TELEFONE.Value) do
           Begin
             If (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroMHNFEDESC_TELEFONE.Value,wInd,1);
             Inc(wInd);
           End;
           QCadastroDESC_TELEFONE.Value := copy(wFone,1,13);

           wind := 1;
           wFone := '';
           While wInd <= Length(ZQCadastroMHNFEDESC_CELULAR.Value) do
           Begin
             If (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '0') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '1') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '2') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '3') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '4') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '5') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '6') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '7') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '8') Or
                (Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1) = '9') Then
                wFone := wFone + Copy(ZQCadastroMHNFEDESC_CELULAR.Value,wInd,1);
             Inc(wInd);
           End;
           QCadastroDESC_CELULAR.Value := copy(wFone,1,12);

          QCadastroNUM_CGC_CPF.Value :=  copy(ZQCadastroMHNFENUM_CGC_CPF.value,1,18);
          QCadastroDESC_BAIRRO.Value :=  UpperCase(Bib.RemoveAcentos(ZQCadastroMHNFEDESC_bairro.Value));
          QCadastroDT_CADASTRO.value :=  ZQCadastroMHNFEDT_CADASTRO.Value;
          QCadastroCOD_PAIS.Value :=  278;
          QCadastroCOD_REGIAO.Value := 1;
          QCadastroCOD_CLASS_CADASTRO.Value :=  1;
          QCadastroIND_SEXO_CATEGORIA.Value := 'M';
          QCadastroCOD_RAMO.Value := 1;
//          QCadastroCOD_VENDEDOR.Value := 1;

          QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroMHNFECOD_ESTADO.Value,1,2));
//          QCadastroCOD_CIDADE.Value := ZQCadastrocod_cidade.Value;
          QCadastroDESC_CIDADE_COBRANCA.Value :=  UpperCase(copy(ZQCadastroMHNFEDESC_CIDADE.Value,1,30));
          QCadastroDESC_ENDERECO_COBRANCA.Value :=  UpperCase(copy(ZQCadastroMHNFEDESC_ENDERECO.Value,1,40));
          QCadastroDESC_CEP_COBRANCA.Value := bib.LimpaString(ZQCadastroMHNFEDESC_CEP.Value,'.');
          QCadastroDESC_BAIRRO_COBRANCA.Value := ZQCadastroMHNFEDESC_BAIRRO.Value;
          QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(copy(ZQCadastroMHNFECOD_ESTADO.Value,1,2));
          QCadastroCOD_TIPO_CADASTRO.Value := 1;
          if Length(ZQCadastroMHNFENUM_CGC_CPF.Value) > 11 then
            QCadastroIND_FISICA_JURIDICA.Value := 'J'
          else
            QCadastroIND_FISICA_JURIDICA.Value := 'F';
          QCadastroDESC_E_MAIL.Value := ZQCadastroMHNFEDESC_E_MAIL.Value;
          QCadastroDESC_E_MAIL1.Value := ZQCadastroMHNFEDESC_E_MAIL.Value;
          QCadastro.Post;
        Except
          Memo1.Lines.Add(ZQClienteSGBNOME.text + ' não Importado - ');
          If QCadastro.State = dsInsert Then
            QCadastro.Cancel;
          Inc(wRegNaoImp);
        End;
        Inc(wCont);
        PB.Position := wCont;
        ZQCadastroMHNFE.Next;
      End;
    end;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont-wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  End;
  PB.Position := 0;
  MessageDlg(memo1.Text, mtInformation, [mbOK], 0);

end;

procedure TFImportaDados.BitBtn65Click(Sender: TObject);
Var wCont,wRegNaoImp,wCodDep,wCodGru : Integer;
  wClasse: string;
  exec: TExecutador;
begin
  DMOracle.DBCemapa.StartTransaction;
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    with DMProdutoFirebird do
    begin
      QProduto.Open;
      ZQProdutoMHNFE.Open;
      DMOracle.DBCemapa.StartTransaction;
      ZQProdutoMHNFE.First;

      wCont := 0;
      While not ZQProdutoMHNFE.Eof do
      Begin
        Try
          QProduto.Insert;
          QProdutoCOD_PRODUTO.Value := ZQProdutoMHNFECOD_PRODUTO.Value;
          QProdutoCOD_CLASSE.Text := ZQProdutoMHNFECOD_CLASSE.Text;
          QProdutoCOD_TRIBUTACAO.Value := ZQProdutoMHNFECOD_TRIBUTACAO.Value;
          QProdutoDESC_PRODUTO.Value := UpperCase(bib.RemoveAcentos(ZQProdutoMHNFEDESC_PRODUTO.Value));
          QProdutoDESC_UNIDADE.Value := ZQProdutoMHNFEDESC_UNIDADE.Value;
          QProdutoNUM_GENERO_NCM.Value := ZQProdutoMHNFENUM_GENERO_NCM.Value;
          QProdutoNUM_EMBALAGEM.Value := 1;
          QProdutoNUM_PESO_BRUTO.Value := ZQProdutoMHNFENUM_PESO_BRUTO.value;
          QProdutoNUM_PESO_LIQUIDO.Value := ZQProdutoMHNFENUM_PESO_BRUTO.value;

          QProdutoVAL_VAREJO.Value :=  ZQProdutoMHNFEVAL_VAREJO.Value;
          QProdutoVAL_ATACADO.Value := ZQProdutoMHNFEVAL_VAREJO.Value;

          QProdutoNUM_VOLUMES.Value := 1;
          QProdutoIND_TIPO_PRODUTO.Value := ZQProdutoMHNFEIND_TIPO_PRODUTO.Value;
          QProdutoPERC_INSS.Value := 0;
          QProdutoPERC_ISS.Value := 0;
          QProdutoIND_SITUACAO.Value := 'ATIVO';
          QProduto.Post;
        Except
          Inc(wRegNaoImp);
          If QProduto.State = dsInsert Then
            QProduto.Cancel;
        End;
        ZQProdutoMHNFE.Next;
      End;
      If (wRegNaoImp = 0) or
        (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                   +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      begin
        DMOracle.DBCEmapa.Commit;
      end
      else
        DMOracle.DBCemapa.RollBack;
      MEImp.Text := FloatToStr(wCont-wRegNaoImp);
      MENaoImp.Text := FloatToStr(wRegNaoImp);
    end;
  End;
  PB.Position := 0;

end;

end.



