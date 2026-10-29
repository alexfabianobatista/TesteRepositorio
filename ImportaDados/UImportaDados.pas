unit UImportaDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, Db, DBTables,
  ActnList, variants, ComObj;

type
  TFImportaDados = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    SBBase: TSpeedButton;
    DBGrid1: TDBGrid;
    BtImportaProduto: TBitBtn;
    PB: TProgressBar;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    MEImp: TMaskEdit;
    MENaoImp: TMaskEdit;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    BtModelo: TBitBtn;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    BtImpCtRecebCab: TBitBtn;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    BitBtn2: TBitBtn;
    TabSheet7: TTabSheet;
    DBGrid5: TDBGrid;
    BtImportaHistorico: TBitBtn;
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
    BtRomaneio: TBitBtn;
    DBGrid14: TDBGrid;
    Label3: TLabel;
    MeDataInicial: TMaskEdit;
    TabSheet18: TTabSheet;
    DBGrid15: TDBGrid;
    BtnExportar: TBitBtn;
    TabSheet19: TTabSheet;
    BtnExportaLctoContabil: TBitBtn;
    BtnImportarLctoContabil: TBitBtn;
    SaveDialog: TSaveDialog;
    Label4: TLabel;
    EdFilial: TEdit;
    MEDtLancamentoI: TMaskEdit;
    MEDtLancamentoF: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    d: TTabSheet;
    BitBtn11: TBitBtn;
    Bevel3: TBevel;
    Bevel4: TBevel;
    ED_Filial: TEdit;
    MEDT_Recebimento_I: TMaskEdit;
    MEDT_Recebimento_F: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn12: TBitBtn;
    Edit1: TEdit;
    RGCondicaoPag: TRadioGroup;
    TabSheet21: TTabSheet;
    BitBtn14: TBitBtn;
    TabSheet22: TTabSheet;
    Bevel7: TBevel;
    Bevel8: TBevel;
    ME22Filial: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    BTImportaCadBloqueado: TBitBtn;
    BitBtn17: TBitBtn;
    ME22Dias_Atraso: TMaskEdit;
    Label13: TLabel;
    TabSheet23: TTabSheet;
    Bevel9: TBevel;
    BTExportaCadastroCancelado: TBitBtn;
    BTImportaCadastroCancelado: TBitBtn;
    Bevel10: TBevel;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    LBContExportacao: TLabel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    LBContImportacao: TLabel;
    Label16: TLabel;
    TabSheet20: TTabSheet;
    BtnExpSistAcco: TBitBtn;
    EdFilial1: TEdit;
    Label10: TLabel;
    MEInicial: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    MEFinal: TMaskEdit;
    Bevel5: TBevel;
    Bevel6: TBevel;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    TabSheet24: TTabSheet;
    ME24Importa: TBitBtn;
    Label21: TLabel;
    ME24CodFilial: TMaskEdit;
    TabSheet25: TTabSheet;
    ME25Importa: TBitBtn;
    TabSheet26: TTabSheet;
    BtExportaCadastroInternet: TBitBtn;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    TabSheet27: TTabSheet;
    Bevel13: TBevel;
    Bevel14: TBevel;
    Label24: TLabel;
    Label25: TLabel;
    BtnExportaEscritaFiscalCliente: TBitBtn;
    TabSheet28: TTabSheet;
    Bevel15: TBevel;
    BtnExportaEscritaFiscalNE: TBitBtn;
    Bevel16: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    MeExpEscritaFiscalNEDtInicio: TMaskEdit;
    MeExpEscritaFiscalNEDtFim: TMaskEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    MeExpEscritaFiscalNEFilial: TMaskEdit;
    TabSheet29: TTabSheet;
    Bevel17: TBevel;
    BtnExportaEscritaFiscalNS: TBitBtn;
    MeExpEscritaFiscalNSFilial: TMaskEdit;
    Label31: TLabel;
    Label32: TLabel;
    MeExpEscritaFiscalNSDtInicio: TMaskEdit;
    MeExpEscritaFiscalNSDtFim: TMaskEdit;
    Label33: TLabel;
    Bevel18: TBevel;
    Label34: TLabel;
    Label35: TLabel;
    TabSheet30: TTabSheet;
    Bevel19: TBevel;
    BtnEFProdutos: TBitBtn;
    MeCodInicialEFProdutos: TMaskEdit;
    Label36: TLabel;
    MeCodFinalEFProdutos: TMaskEdit;
    Label38: TLabel;
    Bevel20: TBevel;
    Label39: TLabel;
    LbEFProdutos: TLabel;
    TabSheet31: TTabSheet;
    Bevel21: TBevel;
    Label37: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Bevel22: TBevel;
    BtnExpContaReceber: TBitBtn;
    MeExpContaReceberFilial: TMaskEdit;
    MeExpContaReceberEmissaoInicial: TMaskEdit;
    MeExpContaReceberEmissaoFinal: TMaskEdit;
    Label42: TLabel;
    LbExpContaReceberTotal: TLabel;
    TabSheet32: TTabSheet;
    Bevel23: TBevel;
    BtnImpContaReceber: TBitBtn;
    Label46: TLabel;
    LbImpContaReceberTotal: TLabel;
    Bevel24: TBevel;
    Label43: TLabel;
    Label44: TLabel;
    MeExpContaReceberVencimentoInicial: TMaskEdit;
    MeExpContaReceberVencimentoFinal: TMaskEdit;
    MeExpEscritaFiscalCliPeriodoInicial: TMaskEdit;
    Label45: TLabel;
    Label47: TLabel;
    MEExpEscritaFiscalCliVendedor: TMaskEdit;
    BtExpEscritaFiscalCliVendedorVendedor: TSpeedButton;
    EdExpEscritaFiscalCliVendedor: TEdit;
    TabSheet33: TTabSheet;
    GroupBox4: TGroupBox;
    BitBtn13: TBitBtn;
    LBContador: TLabel;
    TabSheet34: TTabSheet;
    Bevel25: TBevel;
    Bevel26: TBevel;
    Label48: TLabel;
    lbContaFolhaPG: TLabel;
    BitBtn15: TBitBtn;
    MeExpEscritaFiscalCliPeriodoFinal: TMaskEdit;
    Label49: TLabel;
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
    Me39CodEmbarque: TMaskEdit;
    Lb39CodEmbarque: TListBox;
    Bt39Adicionar: TBitBtn;
    Bt39Excluir: TBitBtn;
    Bt39Exportar: TBitBtn;
    BtEmbarqueCons: TSpeedButton;
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
    BitBtn10: TBitBtn;
    TabSheet42: TTabSheet;
    SpeedButton2: TSpeedButton;
    TabSheet43: TTabSheet;
    BitBtn16: TBitBtn;
    Label52: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label53: TLabel;
    MeUsuario: TMaskEdit;
    SpeedButton4: TSpeedButton;
    EdFilialRomaneio: TEdit;
    EdUsuarioRomaneio: TEdit;
    OpenDialog1: TOpenDialog;
    BtImportaCadastro: TBitBtn;
    TabSheet44: TTabSheet;
    BtnExportarSyngenta: TBitBtn;
    Label54: TLabel;
    Label55: TLabel;
    MeSGIni: TMaskEdit;
    MeSGFin: TMaskEdit;
    Label56: TLabel;
    SpeedButton5: TSpeedButton;
    Me1Filial: TMaskEdit;
    Ed1Filial: TEdit;
    Label57: TLabel;
    Label58: TLabel;
    SB1Classe: TSpeedButton;
    SB1ClasseFinal: TSpeedButton;
    ME1NumClasse: TMaskEdit;
    Me1SubClasses: TMaskEdit;
    Ed1SubClasses: TMaskEdit;
    ME1DescClasse: TMaskEdit;
    Ed1Nome: TEdit;
    Sb1Fornecedor: TSpeedButton;
    Me1CodFornecedor: TMaskEdit;
    Label84: TLabel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    TabSheet45: TTabSheet;
    BitBtn20: TBitBtn;
    DBGrid19: TDBGrid;
    TabSheet46: TTabSheet;
    DBGrid20: TDBGrid;
    BtImportarNota: TBitBtn;
    TabSheet47: TTabSheet;
    DBGrid21: TDBGrid;
    BtNotaItem: TBitBtn;
    TabSheet48: TTabSheet;
    DBGrid22: TDBGrid;
    BtUmidade: TBitBtn;
    TabSheet49: TTabSheet;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    ODImportaXLS: TOpenDialog;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    procedure SBBaseClick(Sender: TObject);
    procedure BtImportaProdutoClick(Sender: TObject);
    procedure BtImportaCadastroClick(Sender: TObject);
    procedure BtImpCtRecebCabClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtImportaHistoricoClick(Sender: TObject);
    procedure BtImportaCp_CabClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
    procedure BtImportarNotaClick(Sender: TObject);
    procedure BtNotaItemClick(Sender: TObject);
    procedure BtUmidadeClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
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
    function ObterGrauConta(const Conta: string): Integer;

  public
    { Public declarations }

  end;

var
  FImportaDados: TFImportaDados;

implementation

uses UOracle_cl, UImportaDados_cl, UBiblioteca, UConverte_cl, USequencia_cl,
  UUsuario_cl, UVendedorCons, UVendedor_cl, UEmbarqueCons, UEmbarque_cl,
  StrUtils, UParamSistema_cl, UFilialCons, UFilial_cl, UUsuarioCons,
  UCadastroCons, UClasse_cl, UClasseCons;

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
    wCodBarras : double;
    wDep : Array[1..500] of Integer;
    wGru : Array[1..500] of Integer;
    wSub : Array[1..500] of Integer;
    wNovoDep : Array[1..500] of Integer;
    wNovoGru : Array[1..500] of Integer;
    wCodigo : String;
begin
  // para carregar tabela de grupos
{  DMImportaDados.TTB_Grupo.Open;
  DMImportaDados.TTB_Grupo.First;
  wCont := 1;
  While not DMImportaDados.TTB_Grupo.Eof do
  Begin
    wNovoDep[wcont] := TRUNC(DMImportaDados.TTB_GrupoDEP.Value);
    wNovoGru[wCont] := truNC(DMImportaDados.TTB_GrupoGRU.Value);
    wDep[wcont] := DMImportaDados.TTB_GrupoCdDepMerc.Value;
    wGru[wcont] := DMImportaDados.TTB_GrupoCdGruMerc.Value;
    wSub[wcont] := DMImportaDados.TTB_GrupoCdSgrMerc.Value;
    inc(wcont);
    DMImportaDados.TTB_Grupo.Next;
  End;
}  // ate aqui
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TProduto.Open;
    QProduto.Open;
    DMOracle.DBCemapa.StartTransaction;
    TProduto.First;
    PB.Max := TProduto.RecordCount;
    wCont := 0;
    While not TProduto.Eof do
    Begin
      Try
        QProduto.Insert;
        QProdutoCOD_PRODUTO.Text := TProdutoB1_CODPRO.Text;
//        QProdutoCOD_PRODUTO.Value :=  TProdutoPrd_id.Value;  //DMOracle.Sequencia('PRODUTO');
//        QProdutoNUM_FABRICANTE.Value :=  TProdutoPRD_EAN.Text;

{        wcont := 1;
        While wcont <= 500 do
        Begin
          if (TProdutoCdDepMerc.Value =  wDep[wcont]) And
             (TProdutoCdGruMerc.Value =  wGru[wcont]) And
             (TProdutoCdSgrMerc.Value =  wSub[wcont]) Then
           Begin
             wcodDep := wNovoDep[wcont];
             wCodGru := wNovoGru[wcont];
             wcont := 600
           End;
           Inc(wcont);
        End;  }
//        QClasse.Close;
//        QClasse.SetVariable('cod_dep',TProdutoCdGruMerc.Value);
//        QClasse.SetVariable('cod_gru',TProdutoCdSgrMerc.Value);
//        QClasse.Open;
//        If QClasse.Eof Then
           QProdutoCOD_CLASSE.Value := 6;
//        Else
//           QProdutoCOD_CLASSE.Value := QClasseCod_Classe.Value;
//        If TProdutoIdTribVen.Value <> 0 Then
//           QProdutoCOD_TRIBUTACAO.Value := TProdutoIdTribVen.Value
//        Else
        if TProdutoB1_CST.Value = '060' then
          QProdutoCOD_TRIBUTACAO.Value := 4
        else
          QProdutoCOD_TRIBUTACAO.Value := 1;
        wCodBarras := StrToFloat(TProdutoB1_CODBARR.Value);
        QProdutoDESC_COD_BARRA.Value :=  FloatToStr(wCodBarras);
        QProdutoDESC_PRODUTO.Value := UpperCase(bib.RemoveAcentos(Trim(TProdutoB1_DESPRO.Value)));
        QProdutoNUM_EMBALAGEM.Value := 1;
        QProdutoDESC_UNIDADE.Value := TProdutoB1_UNIMED.Value;
//        QProdutoNUM_TRIB_TRANSFERENCIA.Value := TProdutoIDTRIBVEN.Value;
        QProdutoVAL_VAREJO.Value := TProdutoB1_PRVEND1.Value;
        QProdutoVAL_ATACADO.Value := TProdutoB1_PRVEND1.Value;
//        QProdutoPERC_MARGEM_VAREJO.Value := TProdutoMARGELUCRO.Value;
        QProdutoPERC_DESCONTO_MAXIMO.Value := 0;
        QProdutoPERC_IPI.Value := 0; //TProdutoPCALIQIPI.Value;
//        QProdutoDESC_CLASS_FISCAL.Value := FloatToStr(TProdutoCLASFISCAL.Value);
//        If TProdutoIDTRIBVEN.Value = 88 then
//           QProdutoIND_TIPO_PRODUTO.Value := 'SERVIÇO'
//        Else
           QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';

//        QProdutoDT_ALTERACAO_PRECO.Text := TProdutoDTULALTPRE.Text;
{        If TProdutoCDFORNEC.Text <> '' Then
         Begin
           wCodigo := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+TProdutoCDFORNEC.Text);
           If Trim(wCodigo) <> '' Then
              QProdutoCOD_CADASTRO.Value := StrToInt(wCodigo);
         End;
        QProdutoDESC_COMPLEMENTO.Value := TProdutoCDFABRICA.Value;
        QProdutoDESC_COMPLEMENTO_2.Value := TProdutoMEDIDA.Value;
}        QProdutoPERC_INSS.Value := 0;

//        IF TProdutoIDTRIBVEN.Value = 88 then
        QProdutoPERC_ISS.Value := 0;
//        If TProdutoPRECOAUTO.Value = 'A' Then
           QProdutoIND_SITUACAO.Value := 'ATIVO';
//        If TProdutoPRECOAUTO.Value = 'D' Then
//           QProdutoIND_SITUACAO.Value := 'DESATIVADO';
        QProdutoNUM_GENERO_NCM.Text :=  TProdutoB1_NCMCOD.Text;
        QProdutoCOD_CEST.Value := TProdutoB1_CESTCOD.Value;

        QProduto.Post;
      Except
       If QProduto.State = dsInsert Then
         QProduto.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TProduto.Next;

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

procedure TFImportaDados.BtImportaCadastroClick(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp : Integer;
    wFone,wCodigo : String;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TCadastro.Open;
    QCadastro.Open;
    TCadastro.First;
    PB.Max := TCadastro.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TCadastro.Eof do
    Begin
      Try
        With DMOracle do
        Begin
{          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_cadastro SET cod_vendedor = ' +FloatToStr(TCadastrocdvended.Value)
          wComando := wComando + ' WHERE COD_cadastro = '+FloatToStr(TCadastrocodcli.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        End;}

{        If (TCadastroCODIGO.Value) = 0 Or
           (Trim(TCadastroNOME.Text) = '') Then
         Begin
           TCadastro.Next;
           Continue;
         End;
        wCodigo := TCadastroCODCLI.Text;
        If TCadastroCODCLI.Value > 1000000 Then  // isto é somente para o Magalias
           wCodigo := Copy(TCadastroCODCLI.Text,1,1)+Copy(TCadastroCODCLI.Text,3,5);
        If DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+wCodigo) <> '' Then
         Begin
           TCadastro.Next;
           Continue;
         End;}

        {If (Trim(TCadastroUF.Text) <> '') And
           (Trim(TCadastroUF.Text) <> 'PY') And
           (Trim(TCadastroUF.Text) <> 'AG') And
           (Trim(TCadastroUF.Text) <> 'RP') And
           (Trim(TCadastroUF.Text) <> 'RG') And
           (Trim(TCadastroUF.Text) <> 'PU') And
           (Trim(TCadastroUF.Text) <> 'SO') Then
           If DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+Chr(39) + UpperCase(TCadastroUF.Text)+Chr(39)) = '' Then
             ShowMessage('Estado inexistente ' + TCadastroUF.Text);}
        QCadastro.Insert;
//        wCodigo := TCadastroCODCLI.Text;
//        If TCadastroCODCLI.Value > 1000000 Then  // isto é somente para o Magalias
//           wCodigo := Copy(TCadastroCODCLI.Text,1,1)+Copy(TCadastroCODCLI.Text,3,5);
//        QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');;
        QCadastroCOD_CADASTRO.Text := TCadastroA2_CODFOR.Text;
        If Trim(TCadastroA2_NOMEFOR.Text) <> '' Then
           QCadastroNOME.Value :=  UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_NOMEFOR.Text)))
        else
           QCadastroNOME.Value := '.';
        QCadastroDESC_FANTASIA.Text := UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_FANTASI.Text)));
        QCadastroNUM_INSCRICAO.Value := TCadastroA2_INSFOR.Value;
        QCadastroNUM_CGC_CPF.Value :=  TCadastroA2_CGCFOR.Value;

        QCadastroDESC_ENDERECO.Text :=  UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_ENDFOR.Text))) + ',' + TCadastroA2_NUMEND.Text;
        QCadastroDESC_BAIRRO.Value  :=  UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_BAIFOR.Text)));
         QCadastroDESC_CEP.Value    :=  Bib.LimpaString(TCadastroA2_CEPFOR.Text,'.');
        QCadastroDESC_CIDADE.Text  :=  UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_CIDFOR.Text)));
        If TCadastroA2_ESTFOR.Text = 'NI' Then
          QCadastroCOD_ESTADO.Value := 'PR'
        Else
          QCadastroCOD_ESTADO.Text :=  UpperCase(Trim(TCadastroA2_ESTFOR.Text));

        QCadastroDESC_ENDERECO_COBRANCA.Value := UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_ENDFOR.Text))) + ',' + TCadastroA2_NUMEND.Text;
        QCadastroDESC_BAIRRO_COBRANCA.Text  :=   UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_BAIFOR.Text)));
        QCadastroDESC_CEP_COBRANCA.Value    :=   Bib.LimpaString(TCadastroA2_CEPFOR.Text,'.');
        QCadastroDESC_CIDADE_COBRANCA.Value :=   UpperCase(Bib.RemoveAcentos(Trim(TCadastroA2_CIDFOR.Text)));

        wInd := 1;
        wFone := '';
        While wInd <= Length(TCadastroA2_FONEFOR.Value) do
         Begin
           If (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '0') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '1') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '2') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '3') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '4') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '5') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '6') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '7') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '8') Or
              (Copy(TCadastroA2_FONEFOR.Text,wInd,1) = '9') Then
                wFone := wFone + Copy(TCadastroA2_FONEFOR.Text,wInd,1);
             Inc(wInd);
         End;
         QCadastroDESC_TELEFONE.text := wFone;
         While wInd <= Length(TCadastroA2_FONEREP.Text) do
         Begin
           If (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '0') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '1') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '2') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '3') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '4') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '5') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '6') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '7') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '8') Or
              (Copy(TCadastroA2_FONEREP.Text,wInd,1) = '9') Then
                wFone := wFone + Copy(TCadastroA2_FONEREP.Text,wInd,1);

             Inc(wInd);
         End;
         QCadastroDESC_CELULAR.Text := wFone;
         
         QCadastroIND_FISICA_JURIDICA.Text := UpperCase(TCadastroA2_FJ.Text);
         QCadastroDESC_E_MAIL.Text := LowerCase(Trim(bib.RemoveAcentos(TCadastroA2_EMAIL.Text)));
         If TCadastroA2_DTCAD.Text <> ''  Then
           QCadastroDT_CADASTRO.Text :=  TCadastroA2_DTCAD.Text
         Else
           QCadastroDT_CADASTRO.Value :=  Date;
         QCadastroCOD_PAIS.Value :=  278;
        {if TCadastroIDESTCIVIL.Value = 'C' THEN
           QCadastroCOD_ESTADO_CIVIL.Value := 2
        Else
          if TCadastroIDESTCIVIL.Value = 'S' THEN
             QCadastroCOD_ESTADO_CIVIL.Value := 1
          Else
            if TCadastroIDESTCIVIL.Value = 'V' THEN
               QCadastroCOD_ESTADO_CIVIL.Value := 3
            else
              if TCadastroIDESTCIVIL.Value = 'D' THEN
                 QCadastroCOD_ESTADO_CIVIL.Value := 4
              else
                if TCadastroIDESTCIVIL.Value = 'A' THEN
                   QCadastroCOD_ESTADO_CIVIL.Value := 5
                else
                  if TCadastroIDESTCIVIL.Value = 'J' THEN
                     QCadastroCOD_ESTADO_CIVIL.Value := 5
                  else
                     QCadastroCOD_ESTADO_CIVIL.Value := 1;}

        QCadastroDESC_OBS.Value :=  bib.RemoveAcentos(TCadastroA2_OBS.Text);
        QCadastroCOD_TIPO_CADASTRO.Value := 2;
        QCadastroIND_TIPO_PROPRIETARIO.Value := 1;
        QCadastroCOD_REGIAO.Value := 1;
        QCadastroCOD_CLASS_CADASTRO.Value :=  1;
        QCadastroIND_SEXO_CATEGORIA.Value := 'F';
        QCadastroCOD_RAMO.Value := 1;
{        If Trunc(TCadastroCDVENDED.Value) in [10,20,30,40,50,60,70,200] then
          QCadastroCOD_VENDEDOR.Value :=  Trunc(TCadastroCDVENDED.Value)
        Else
          QCadastroCOD_VENDEDOR.Value := 1;
        If TCadastroUF.Value <> '' Then
           If (TCadastroUF.Value = 'PY') Or (TCadastroUF.Value = 'AG') Then
              QCadastroDESC_ESTADO_COBRANCA.Value :=  'EX'
           Else
             If (TCadastroUF.Value = 'RP') Or (TCadastroUF.Value = 'PU') Then
                QCadastroDESC_ESTADO_COBRANCA.Value :=  'PR'
             Else
               If TCadastroUF.Value = 'RG' Then
                  QCadastroDESC_ESTADO_COBRANCA.Value :=  'RS'
               Else
                 If TCadastroUF.Value = 'SO' Then
                    QCadastroDESC_ESTADO_COBRANCA.Value :=  'SP'
                 Else
                    QCadastroDESC_ESTADO_COBRANCA.Value :=  UpperCase(TCadastroUF.Value)
        Else
           QCadastroDESC_ESTADO_COBRANCA.Value := 'PR';
}
//        QCadastroDESC_CIDADE_COBRANCA.Value :=  TCadastroCIDADE.Value;
//        QCadastroDESC_ENDERECO_COBRANCA.Value :=  TCadastroENDERECO.Value;
//        QCadastroDESC_CEP_COBRANCA.Value :=  TCadastroCDCEP.Text;
//        If (TCadastroIDTIPCLIE.Value = 1) then
{          QCadastroCOD_TIPO_CADASTRO.Value := 1;
//       Else
//          QCadastroCOD_TIPO_CADASTRO.Value := 2;

        //
//        QCadastroDESC_CELULAR.Value := TCadastroCELPRO.Value;
//        QCadastroNOME_CONTATO.Value := TCadastroPROFISSAO.Value;
        //QCadastroDESC_TELEFONE_COMERCIAL.Value :=
        //QCadastroNUM_JUNTA.Value :=
        //QCadastroDT_FUNDACAO.Text :=
        //QCadastroDT_JUNTA.Text :=
        //QCadastroDESC_NATURALIDADE.Value :=
        //QCadastroDESC_ESTADO_NATURAL.Value :=
        //QCadastroDT_EXPEDICAO_IDENTIDADE.Text :=
        //QCadastroDESC_E_MAIL.Value :=
        //QCadastroDESC_FAX_COBRANCA.Value :=

        QCadastroIND_SEPROC_SIMNAO.Value := 'N';

        //QCadastroDESC_INSCRICAO_MUNICIPAL.Value :=
        //QCadastroNOME_CONJUGE.Value :=
        //QCadastroDESC_CPF_CONJUGE.Value :=
        //QCadastroDESC_IDENTIDADE_CONJUGE.Value :=
        //QCadastroCOD_BANCO_AGENCIA.Value :=
        //QCadastroCOD_OPERACAO_CC.Value :=}

         QCadastro.Post;
      end
      Except

//        Memo1.Lines.Add(TCadastrocodCLI.Text + ' não Importado - ');
        If QCadastro.State = dsInsert Then
          QCadastro.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TCadastro.Next;
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

procedure TFImportaDados.BtImpCtRecebCabClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp, wContCommit : Integer;
    wCodigo : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    If TCR_Cab.Active = False Then
      TCR_Cab.Open;
    QCR_Cab.Open;
    TCR_Cab.First;
    PB.Max := TCR_Cab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TCR_Cab.Eof do
    Begin
      if (TCR_CabDTMOVIMENT.Value < StrToDate('01/01/2015')) And
         (TCR_CabIDBAIXA.Value = 'T') then
       Begin
         TCR_Cab.Next;
         continue;
       End;
      Try
        If (TCR_CabCDCODCLI.Value > 0) Then
        Begin
          wCodigo :=  DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = ' + TCR_CabCDCODCLI.Text);
          If wCodigo <> ''  Then
          Begin
            QCR_Cab.Insert;
    {        If TCR_CabCDBCOAGEN.Value > 0 Then
              QCR_CabCOD_BANCO_AGENCIA.Value := Trunc(TCR_CabCDBCOAGEN.Value);  }
            QCR_CabCOD_DEPARTAMENTO.Value := 1;
            QCR_CabDT_BAIXA.Text :=  TCR_CabDTBAIXA.Text;
            QCR_CabCOD_CADASTRO.Value :=  StrToInt(wCodigo);
            If (TCR_CabDTVENCTO.Text <> '/  /') And (TCR_CabDTVENCTO.Text <> '')Then
               QCR_CabDT_VENCIMENTO.Text :=  TCR_CabDTVENCTO.Text
            Else
               QCR_CabDT_VENCIMENTO.Text :=  TCR_CabDTEMISSAO.Text;
            QCR_CabDT_EMISSAO.Text :=  TCR_CabDTEMISSAO.Text;
            QCR_CabNUM_PARCELA.Value :=  TCR_CabNRPARC.Value;
            QCR_CabNUM_TITULO.Value :=  Trunc(TCR_CabNRTITULO.Value);
            QCR_CabVAL_ORIGINAL.Value :=  TCR_CabVLORIGINAL.Value;
            QCR_CabVAL_JUROS.Value :=  0;
            QCR_CabDT_MOVIMENTO.Text :=  TCR_CabDTEMISSAO.Text;
            QCR_CabDESC_OBSERVACAO.Value :=  Trim(TCR_CabOBSERVACAO.Value);
            QCR_CabDT_CAPITALIZACAO.Text :=  TCR_CabDTVENCTO.Text;
            QCR_CabIND_SITUACAO.Value :=  'ABERTO';
            QCR_CabVAL_TITULO.Value :=  TCR_CabVLTITULO.Value;
            If TCR_CabIDBAIXA.Value = 'T' Then
             Begin
               QCR_CabIND_SITUACAO.Value :=  'BAIXA TOTAL';
               QCR_CabVAL_TITULO.Value :=  0;
             End;
            If TCR_CabIDBAIXA.Value = 'P' Then
             Begin
               QCR_CabIND_SITUACAO.Value :=  'BAIXA PARCIAL';
               QCR_CabVAL_TITULO.Value :=  TCR_CabVLTITULO.Value;
             End;
            QCR_CabCOD_FILIAL.Value :=  1;
  //          QCR_CabCod_Vendedor.Value :=  TCR_CabTIPVEN.Value;
            QCR_CabDESC_TIPO_DOCUMENTO.Value := TCR_CabIDDOCUMENT.Text;
            QCR_CabCOD_FINALIDADE.Value := 1;
            QCR_CabCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
            QCR_CabIND_ACEITE.Value := 'S';
            QCR_CabPERC_COMISSAO.Value := 0;


            //QCR_CabCOD_NOTA_CAB.Value :=
            //QCR_CabCOD_NOSSO_NUMERO.Value :=
            //TCR_CabCDHISTITU.Value;
            //TCR_CabIDDOCBAIXA.Value;
            //TCR_CabNRDOCBAIXA.Value;
            //TCR_CabVLPAGTO.Value;

            //TCR_CabPCDESCANTE.Value;
            //TCR_CabPCDESCPONT.Value;
            //TCR_CabDTDESCPONT.Text;
            //TCR_CabIDBAIXA.Value;
            //TCR_CabIDCONTABIL.Value;
            //TCR_CabIDRECIBO.Value;
            //TCR_CabNRORIGEM.Value;
            //TCR_CabNRDUPLIC.Value;
            //TCR_CabAVALISTA.Value;

            QCR_Cab.Post;
          End;
        end;
      Except
        If QCR_Cab.State = dsInsert Then
          QCR_Cab.Cancel;
        Inc(wRegNaoImp);
//        If MessageDlg('Erro: Comitar e Sair?',mtWarning,[mbYes,mbNo],0) = mrYes Then
//        Begin
//          DMOracle.DBCemapa.Commit;
//          Raise;
//        End;
      End;
      Inc(wCont);
      Inc(wContCommit);
      If wContCommit > 5000 Then
      Begin
//        ShowMessage('Commitando dados');
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;
      End;
      PB.Position := wCont;
      TCR_Cab.Next;
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
    wCab, wCodigo : String;
    wContCommit : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TCR_Mov.Open;
    QCR_Mov.Open;
    TCR_Mov.First;
    PB.Max := TCR_Mov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TCR_Mov.Eof do
    Begin
      If TCR_MovCDCODCLI.Value = 0 Then
       Begin
         TCR_Mov.Next;
         Continue;
       End;
{       if TCR_MovDTOPERACAO.Value < StrToDate('01/01/2011') Then
       Begin
         TCR_Mov.Next;
         Continue;
       End;
 }
{       if TCR_MovDTOPERACAO.Value >= StrToDate('01/01/2011') Then
       Begin
         break;
       End;
       }
       wCodigo :=  DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = ' + TCR_MovCDCODCLI.Text);
       If wCodigo = ''  Then
       Begin
         TCR_Mov.Next;
         Continue;
       End;

      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                                   'COD_CADASTRO = '+wCodigo
                                   +' AND NUM_TITULO = '+ FloatToStr(TCR_MovNRTITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(TCR_MovNRPARC.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = ' + Chr(39) + TCR_MovIDDOCUMENT.Value + Chr(39));
        IF wCab <> '' Then
        Begin
          QCR_Mov.Insert;
          QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
          QCR_MovCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCab);
          QCR_MovDT_MOVIMENTO.Text :=  TCR_MovDTOPERACAO.Text;
          QCR_MovVAL_MOVIMENTO.Value :=  TCR_MovVLOPERACAO.Value;
          QCR_MovCOD_USUARIO.Value := 1;
          QCR_MovDT_USUARIO.Value := Date;
          //QCR_MovDESC_OBSERVACAO.Value :=
          Case TCR_MovIDCODOPER.Value Of
            1 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
            2 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'JUROS';
            50 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
            51 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. JUROS';
            52 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'DESC. CONCEDIDO';
            54 : QCR_MovIND_TIPO_MOVIMENTO.Value := 'OUTROS';
          End;
          QCR_Mov.Post;
        End;
      Except
        If QCR_Mov.State = dsInsert Then
          QCR_Mov.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      Inc(wContCommit);
      If wContCommit > 3000 Then
      Begin
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;
      End;
      PB.Position := wCont;
      TCR_Mov.Next;
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

procedure TFImportaDados.BtImportaCp_CabClick(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
    wCab, wCodigo : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TCP_Cab.Open;
    QCP_Cab.Open;
    TCP_Cab.First;
    PB.Max := TCP_Cab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TCP_Cab.Eof do
    Begin
      Try
        wCodigo := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+TCP_CabCDCODCLI.Text);
        If wCodigo = '' Then
         Begin
           TCP_Cab.Next;
           Continue;
         End;
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+wCodigo
                                   +' AND NUM_TITULO = '+ FloatToStr(TCP_CabNRTITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(TCP_CabNRPARC.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = ' + Chr(39) + TCP_CabIDDOCUMENT.Value + Chr(39));
        IF (wCab = '') And (wCodigo <> '') Then
//        IF DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + TCP_CabCDCODCLI.Text) <> '' Then
        Begin
          QCP_Cab.Insert;
     //       TCP_CabCDBCOAGEN.value;
     //       TCP_CabCDHISTITU.value;
     //       TCP_CabIDDOCBAIXA.value;
     //       TCP_CabNRDOCBAIXA.value;
     //       TCP_CabVLPAGTO.value;
     //       TCP_CabVLDESCONTO.value;
     //       TCP_CabVLJUROS.value;
     //       TCP_CabVLCORRECAO.value;
     //       TCP_CabPCDESCANTE.value;
     //       TCP_CabPCDESCPONT.value;
     //       TCP_CabDTDESCPONT.Text;
     //       TCP_CabIDTIPDOC.value;
     //       TCP_CabIDCONTABIL.value;
     //       TCP_CabIDRECIBO.value;
     //       TCP_CabIDSITUACAO.value;
     //       TCP_CabCDEMPRESA.value;
     //       TCP_CabVLPEDIDO.value;
     //       TCP_CabQUANTIDADE.value;
     //       TCP_CabACEITE.value;
          QCP_CabCOD_CONTA_PAGAR_CAB.value := DmOracle.Sequencia('CONTA_PAGAR');
          QCP_CabCOD_FINALIDADE.value := TCP_CabCDCONTA.value;
          QCP_CabCOD_CADASTRO.value := StrToInt(wCodigo);
          QCP_CabCOD_FILIAL.value := TCP_CabCDFILIAL.value;
          QCP_CabNUM_TITULO.value := Trunc(TCP_CabNRTITULO.value);
          QCP_CabNUM_PARCELA.value := TCP_CabNRPARC.value;
          QCP_CabDESC_TIPO_DOCUMENTO.value := TCP_CabIDDOCUMENT.value;
          QCP_CabDT_MOVIMENTO.Text := TCP_CabDTMOVIMENT.Text;
          QCP_CabDT_BAIXA.Text := TCP_CabDTBAIXA.Text;
          QCP_CabDT_VENCIMENTO.Text := TCP_CabDTVENCTO.Text;
          QCP_CabDT_EMISSAO.Text := TCP_CabDTEMISSAO.Text;
          QCP_CabDT_CAPITALIZACAO.Text := TCP_CabDTCAPITA.Text;
          QCP_CabVAL_TITULO.value := TCP_CabVLTITULO.value;
        //  QCP_CabCOD_NOTA_CAB.value :=
      //    QCP_CabDESC_OBSERVACAO.value := TCP_CabOBSERVACAO.value;
          QCP_CabIND_ACEITE.value := 'S';
          If Trim(TCP_CabIDBAIXA.Value) = '' Then
            QCP_CabIND_SITUACAO.Value :=  'ABERTO'
          Else
            If TCP_CabIDBAIXA.Value = 'T' Then
              QCP_CabIND_SITUACAO.Value :=  'BAIXA TOTAL'
            Else
              If TCP_CabIDBAIXA.Value = 'P' Then
                QCP_CabIND_SITUACAO.Value :=  'BAIXA PARCIAL'
              Else
                ShowMessage('Tipo de Baixa não prevista!'+TCR_CabIDBAIXA.Value);
          QCP_CabVAL_ORIGINAL.value := TCP_CabVLORIGINAL.value;
          QCP_CabVAL_INDEXADO.value := 0;
          QCP_CabCOD_DEPARTAMENTO.value := 1;
          // TCP_CabCDDEPART.value;
          ///QCadastroCOD_CADASTRO.Value := TCadastroCODCLI.Value;
          QCP_Cab.Post;
        End;
      Except
        If QCP_Cab.State = dsInsert Then
          QCP_Cab.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TCP_Cab.Next;
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
    wCab, wCodigo : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TCP_Mov.Open;
    QCP_Mov.Open;
    TCP_Mov.First;
    PB.Max := TCP_Mov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    While not TCP_Mov.Eof do
    Begin
      If TCP_MovCDCODCLI.Value = 0 Then
       Begin
         TCP_Mov.Next;
         Continue;
       End;

      wCodigo := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','COD_CADASTRO_NOVO = '+TCP_MovCDCODCLI.Text);
      If wCodigo = '' Then
       Begin
         TCP_Mov.Next;
         Continue;
       End;
      Try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
                                   'COD_CADASTRO = '+wCodigo
                                   +' AND NUM_TITULO = '+ FloatToStr(TCP_MovNRTITULO.Value)
                                   +' AND NUM_PARCELA = '+ FloatToStr(TCP_MovNRPARC.Value)
                                   +' AND DESC_TIPO_DOCUMENTO = '+ #39+TCP_MovIDDOCUMENT.Value+#39 );
        If wCab <> '' Then
        Begin
          QCP_Mov.Insert;
    //        TCP_MovNRTITULO.Value :=
    //        TCP_MovNRPARC.Value :=
    //        TCP_MovNRDOCOPER.Value :=
    //        TCP_MovIDTIPCONTA.Value :=
    //        TCP_MovDTOPERACAO.Text :=
    //        TCP_MovIDCODOPER.Value :=
    //        TCP_MovIDCONTABIL.Value :=
    //        TCP_MovCDFILIAL.Value :=
    //        TCP_MovCDEMPRESA.Value :=
    //        TCP_MovIDDOCUMENT.Value :=
    //        TCP_MovTIPOPAGTO.Value :=
            QCP_MovCOD_CONTA_PAGAR_MOV.Value := DmOracle.Sequencia('CONTA_PAGAR_MOV');
            QCP_MovCOD_CONTA_PAGAR_CAB.Value := StrToInt(wCab);
            QCP_MovDT_MOVIMENTO.Text := TCP_MovDTMOVIMENT.Text;
            QCP_MovVAL_MOVIMENTO.Value := TCP_MovVLOPERACAO.Value;
            QCP_MovDESC_OBSERVACAO.Value := TCP_MovNOOBSERV.Value;
            Case TCP_MovIDCODOPER.Value Of
              1  : QCP_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
              50 : QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
              51 : QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. JUROS';
              52 : QCP_MovIND_TIPO_MOVIMENTO.Value := 'DESCONTO';
            End;
            QCP_MovDT_USUARIO.Value := date;
            QCP_MovCOD_USUARIO.Value := 1;
          ///QCPMovastroCOD_CPMovASTRO.Value := TCPMovastroCODCLI.Value;
          QCP_Mov.Post;
        End;
      Except
        If QCP_Mov.State = dsInsert Then
          QCP_Mov.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TCP_Mov.Next;
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

procedure TFImportaDados.BitBtn1Click(Sender: TObject);
Var wCont : Integer;
    wRegNaoImp : Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TTB_Grupo.Open;
    QTB_Grupo.Open;
    TTB_Grupo.First;
    PB.Max := TTB_Grupo.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
//    DMOracle.DBCEmapa.StartTransaction;
    While not TTB_Grupo.Eof do
    Begin
    Try
      if (TTB_GrupoCDGRUMERC.Value <> 0) And (TTB_GrupoCDSGRMERC.Value <> 0) then
      begin
        QTB_Grupo.Insert;
        QTB_GrupoCOD_CLASSE.Value := DmOracle.Sequencia('CLASSE');
        QTB_GrupoDESC_CLASSE.Value := TTB_GrupoNODESCRI.Value;
        QTB_GrupoPERC_COMISSAO1.Value := 0;
        QTB_GrupoPERC_COMISSAO2.Value := 0;
        QTB_GrupoNUM_CLASSE.Value := Trunc(TTB_GrupoCDGRUMERC.Value);
        QTB_GrupoNUM_SUBCLASSE.Value := Trunc(TTB_GrupoCDSGRMERC.Value);
        QTB_Grupo.Post;
      End;
    Except
      If QTB_Grupo.State = dsInsert Then
        QTB_Grupo.Cancel;
      Inc(wRegNaoImp);
      Inc(wCont);
      PB.Position := wCont;
//       Inc(wRegNaoImp);
    end;
      TTB_Grupo.Next;
    End;
    If (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp)+' registros não puderam ser importados.'
                 +Chr(13)+' Importar os outros registros mesmo assim?',mtWarning,[mbYes,mbNo],0) = mrYes ) Then
      DMOracle.DBCemapa.Commit
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
    TProduto.Open;
    QEstoque.Open;
    DMOracle.DBCemapa.StartTransaction;
    TProduto.First;
    PB.Max := TProduto.RecordCount;
    wCont := 0;
    While not TProduto.Eof do
    Begin
      Try
        QEstoque.Insert;

          QEstoqueCOD_LOTE_TIPO.Value := 1;
          QEstoqueCOD_FILIAL.Value := 1;
//          wCod_Produto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39) + TProdutoCDMERCAD.Text+Chr(39));
//          QEstoqueCOD_PRODUTO.Value := StrToInt(wCod_Produto);
//          QEstoqueCOD_PRODUTO.Text := TProdutoCDMERCAD.Text;
//          QEstoqueVL_CUSTO_MEDIO.Value := TProdutoVLMERCAD.Value;
//          QEstoqueVL_ULTIMO_CUSTO.Value := TProdutoVLMERCAD.Value;
//          QEstoqueQT_QUANTIDADE.Value := TProdutoQTDISPONIV.Value;

          QEstoqueCOD_PRODUTO.Text := TProdutoB1_CODPRO.Text;
          if TProdutoB1_PRCUSTO.Value = 0 then
          begin
            QEstoqueVL_CUSTO_MEDIO.Value := TProdutoB1_PRMEENT.Value;
            QEstoqueVL_ULTIMO_CUSTO.Value := TProdutoB1_PRMEENT.Value;
          end
          else
          begin
            QEstoqueVL_CUSTO_MEDIO.Value := TProdutoB1_PRCUSTO.Value;
            QEstoqueVL_ULTIMO_CUSTO.Value := TProdutoB1_PRCUSTO.Value;
          end;
          QEstoqueQT_QUANTIDADE.Value := TProdutoB1_SALDO.Value;
          QEstoqueCOD_ULTIMO_FORNECEDOR.Text := TProdutoB1_ULTFOR.Text;
          QEstoqueDT_COMPRA.Value := TProdutoB1_ULTDTEN.Value;
{          QEstoqueVL_CUSTO_DOLAR.Value := TProdutoVLCUSMOEDA.Value;
          QEstoqueDT_COMPRA.Text := TProdutoB1_PRULCOM.Text;
          QEstoqueDT_VENDA.Text := TProdutoB1_PRULVDA.Text;
          QEstoqueQT_COMPRA.Value := TProdutoQTULTCOMPR.Value;      }
          QEstoqueQT_MINIMO.Value := 0;
          QEstoqueQT_MAXIMO.Value := 0;
          QEstoqueQT_INVENTARIO.Value := 0;
     //    QEstoqueDT_INVENTARIO.Text := 0; }


        QEstoque.Post;
      Except
       If QEstoque.State = dsInsert Then
         QEstoque.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TProduto.Next;
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
   if Trim(Ed_Filial.Text) = '' then
      QNotaExporta.SetVariable('COD_FILIAL',Null)
   else
      QNotaExporta.SetVariable('COD_FILIAL',Ed_Filial.Text);

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
   if QNotaExportaNUM_CGC_CPF.Value = '' then
   begin
     MessageDlg('O cadastro ' + QNotaExportaCOD_CADASTRO.Text +
     ' ' +
     DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = '+
      QNotaExportaCOD_CADASTRO.Text) + ' não possui CNPJ/CPF cadastrado',
      mtError, [mbOk],0);
     Abort;
   end;
   while not QNotaExporta.Eof do
   begin
     if QNotaExportaNUM_FABRICANTE_PROD.Value = '' then
     begin
       MessageDlg('O seguinte produto não possui número do fabricante cadastrado'
        + #13#10+
        QNotaExportaCOD_PRODUTO.Text + ' ' +
        DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
          'COD_PRODUTO = ' + QNotaExportaCOD_PRODUTO.Text),
        mtError, [mbOk],0);
        Abort;
     end;
     QNotaExporta.Next;
   end;

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
          Bib.FormataTexto(QNotaExportaCOD_SERIE_MODELO.Text,2)       +
          '       '                                                   +
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
          Bib.FormataTexto(QNotaExportaNUM_NOTA_PRODUTOR.Text,6)      +
          Bib.FormataTexto(QNotaExportaNUM_CGC_CPF.Text,19)           +
          '          '                                                +
          Bib.FormataTexto(QNotaExportaNUM_FABRICANTE_PROD.Text,15)   +
          Bib.FormataTexto(copy(QNotaExportaDESC_CHAVE_ACESSO.Text,4,47),44) + {Junior - 11/03/2014}
          Bib.FormataTexto(QNotaExportaVAL_DESCONTO_RATEIO.Text,11)+
          Bib.FormataTexto(QNotaExportaIND_ST.Text,1)+  //nota_cab
          Bib.FormataTexto(QNotaExportaVAL_BASE_SUBST.Text,11) +
          Bib.FormataTexto(QNotaExportaVAL_ICMS_SUBST.Text,11);

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
    wContSerie: String;
    wCodFor: Integer;
    wCnpj: String;
    wCodProduto: String;
begin
  cod_nota_cab :='0';
  S:= '';  // Inicializa valor da variavel.
  if OpenDialog1.Execute then          { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F,S);                           {Le a linha do arquivo texto}
    with DMImportaDados, DMOracle do
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

        //Validações
        wContSerie :=
          BuscaNome('SELECT COUNT(*) FROM TB_SERIE',' COD_FILIAL = ' +
            Trim(Copy(S, 13,6)) + ' AND COD_SERIE = ' +
            quotedStr(Trim(Copy(S, 61,3))) + ' AND COD_SERIE_MODELO = ' +
            quotedStr(Trim(Copy(S, 88,2))));
        if (wContSerie = '0') or (wContSerie = '') then
        begin
          MessageDlg('Série de nota fiscal não encontrada.' + #13#10 +
            'Por favor cadastre uma série com os seguintes dados: ' + #13#10 +
            'Filial: ' + Trim(Copy(S, 13,6)) + #13#10 +
            'Série: ' + Trim(Copy(S, 61,3)) + #13#10 +
            'Modelo: ' + Trim(Copy(S, 88,2)),mtError,[mbOk],0);
          Abort;
        end;
        wCnpj := bib.LimpaString(bib.LimpaString(bib.LimpaString(Trim(Copy(S, 716,19)),
          '.'),'/'),'-');

        wCodFor := DMImportaDados.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[wCnpj]);
        if wCodFor = 0 then
        begin
          MessageDlg('Não existe um cadastro com o CPF/CNPJ ' +
            wCnpj + ' cadastrado no sistema.',mtError,[mbOk],0);
          Abort;
        end;

        wCodProduto :=
        BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
          'UPPER(NUM_FABRICANTE) = ' + quotedStr(UpperCase(Trim(Copy(S, 745,15)))));
        if (wCodProduto = '') and (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1') <> 'BEGNINI') then
        begin
          MessageDlg('Não foi encontrado um produto com o seguinte número do fabricante:' +
            #13#10 +
            Trim(Copy(S, 745,15)) +#13#10 +
            'Faça o cadastro deste produto e tente a importação novamente', mtError,
            [mbOk],0);
          Abort;
        end;

        if cod_nota_cab <> Trim(Copy(S,01,06)) then //-----compara se a nota_cab já foi gravada
        begin
          QNotaCabImporta.Insert;
          QNotaItemImporta.Insert;
          if Trim(Copy(S, 06,06)) <> '' then
             QNotaCabImportaCOD_USUARIO.Value:= StrToInt(Trim(Copy(S, 06,06)));
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
          //if Trim(Copy(S,49,06)) <> '' then
          //   QNotaCabImportaCOD_CADASTRO.Text:= Trim(Copy(S,49,06));
          if wCodFor > 0 then
             QNotaCabImportaCOD_CADASTRO.Value:= wCodFor;
          if Trim(Copy(S,55,06)) <> '' then
             QNotaCabImportaNUM_NOTA.Value:= StrToInt(Trim(Copy(S,55,06)));
          if Trim(Copy(S,61,03)) <> '' then
             QNotaCabImportaCOD_SERIE.Value:= Trim(Copy(S,61,03));
          if (Trim(Copy(S,64,03)) <> '') and (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1') = 'BEGNINI') then
            QNotaCabImportaIND_SITUACAO.Value := '1'
          else
            QNotaCabImportaIND_SITUACAO.Value:= Trim(Copy(S,64,03));
          if Trim(Copy(S,67,01)) <> '' then
             QNotaCabImportaIND_CONDICAO_PAGTO.Value:= Trim(Copy(S,67,01));
          if Trim(Copy(S,68,10)) <> '' then
             QNotaCabImportaDT_EMISSAO.Value:= StrToDate(Trim(Copy(S,68,10)));
          if Trim(Copy(S,78,10)) <> '' then
             QNotaCabImportaDT_MOVIMENTO.Value:= StrToDate(Trim(Copy(S,78,10)));
          if Trim(Copy(S,88,2)) <> '' then
             QNotaCabImportaCOD_SERIE_MODELO.Value := Trim(Copy(S, 88,2));
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
             QNotaCabImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,138,11)));  //desconto da nota_cab
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
          if Trim(Copy(s,815,1)) <> '' then
            QNotaCabImportaIND_ST.Value := Trim(Copy(s,815,1)); // NOTA _ CAB - JUNIOR
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
          if (Trim(Copy(S,575,13)) <> '') and (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1') = 'BEGNINI') then
             QNotaItemImportaCOD_PRODUTO.Value:= StrToFloat(Trim(Copy(S,575,13)))
          else
             QNotaItemImportaCOD_PRODUTO.Value:= StrToFloat(Trim(wCodProduto));
          if Trim(Copy(S,588,06)) <> '' then
             QNotaItemImportaCOD_LOTE_TIPO.Value:= StrToInt(Trim(Copy(S,588,06)));
          {if Trim(Copy(S,594,11)) <> '' then
             QNotaItemImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,594,11)));}//desconto. da NotaCAb. Hoje o desc é diferente(T. Desc = val_desconto_item * qtde).
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
          //Junior - 11/03/2014
          if Trim(copy(S, 760,44)) <> '' then
            QNotaCabImportaDESC_CHAVE_ACESSO.Value := Trim('NFe'+copy(S,760,44));
          if Trim(Copy(s,804,11)) <> '' then
            //Qnotaitemimportaval_desconto_rateio.Value := 0;
            Qnotaitemimportaval_desconto_rateio.Value := StrToFloat(Trim(Copy(s,804,11)));
          if Trim(Copy(s,816,11)) <> '' then
            QNotaItemImportaVAL_BASE_SUBST.Value := StrToFloat(Trim(Copy(s,816,11)));
          if Trim(Copy(s,827,11)) <> '' then
            QNotaItemImportaVAL_ICMS_SUBST.Value := StrToFloat(Trim(Copy(s,827,11)));
          try
            QNotaCabImporta.Post;
            QNotaItemImporta.Post;
          except
            showMessage(QNotaCabImportaNUM_NOTA.Text);
          end;

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
          if (Trim(Copy(S,575,13)) <> '') and (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= 1') = 'BEGNINI') then
             QNotaItemImportaCOD_PRODUTO.Value:= StrToFloat(Trim(Copy(S,575,13)))
          else
             QNotaItemImportaCOD_PRODUTO.Value := StrToFloat(Trim(wCodProduto));
          if Trim(Copy(S,588,06)) <> '' then
             QNotaItemImportaCOD_LOTE_TIPO.Value:= StrToInt(Trim(Copy(S,588,06)));
          {if Trim(Copy(S,594,11)) <> '' then
             QNotaItemImportaVAL_DESCONTO.Value:= StrToFloat(Trim(Copy(S,594,11))); StrToFloat(Trim(Copy(S,594,11)));}//desconto. da NotaCAb. Hoje o desc é diferente(T. Desc = val_desconto_item * qtde).
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
          //comentado as duas linhas. Estava dando pau para TATIMAR. o NUM_NOTA_PRODUTOR ESTÁ PEGANDO DA COLUNA DO DESCONTO_RATEIO.
          //PARA NÃO MEXER NA FUNCAO EXPORTA DADOS RESOLVI COMENTAR, PELO MOTIVO DE SOMENTE O TATIMAR USAR ESSE IMPORTA DADOS.
          {if Trim(Copy(S,800,06)) <> '' then
             QNotaItemImportaNUM_NOTA_PRODUTOR.Value:= StrToInt(Trim(Copy(S,800,06)));}
          QNotaItemImporta.Post;
        end;
        cod_nota_cab := Trim(Copy(S,01,06)); //-----variavel recebe o cod_nota para pode comparar com o cod da proxima nota
        OPVenda.CallProcedure('ARRUMA_DESCONTO_NOTA',[QNotaCabImportaCOD_NOTA_CAB.Value]);
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
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
    Me39CodEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
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
//        QVendedorDESC_CELULAR.Value := TVendedorCELULAR.Value;
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

procedure TFImportaDados.BtImportarNotaClick(Sender: TObject);
Var
  wCont,wRegNaoImp : Integer;
  wCodigo : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TNotaCab.Open;
    QNotaSaida.Open;
    DMOracle.DBCemapa.StartTransaction;
    TNotaCab.First;
    PB.Max := TNotaCab.RecordCount;
    wCont := 0;
    While not TNotaCab.Eof do
    Begin
      If TNotaCabDTEMISSAO.Value < StrToDate('01/01/2000') Then
       Begin
         TNotaCab.Next;
         Continue;
       End;
      wCodigo := TNotaCabCDMATCOOP.Text;
      If Length(TNotaCabCDMATCOOP.Text) > 6 Then
         wCodigo := Copy(TNotaCabCDMATCOOP.Text,2,6);
      If DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + wCodigo) = '' Then
       Begin
         showMessage('Cadastro nao encontrato ' + TNotaCabCDMATCOOP.Text);
         TNotaCab.Next;
         Continue;
       End;
      Try
        QNotaSaida.Insert;
        QNotaSaidaCOD_USUARIO.Value := 1;;
        QNotaSaidaCOD_FILIAL.Value := TNotaCabCDLOCAL.Value;
//        QNotaSaidaCOD_MENSAGEM
//        QNotaSaidaCOD_TRANSPORTE: TIntegerField;
        //QNotaSaidaCOD_OPERACAO.Value := TNotaCabCDOPERINT.Value;
        QNotaSaidaCOD_OPERACAO.Value := 3;
        QNotaSaidaCOD_ESTADO.Value := TNotaCabUFSIGLA.Value;
//        QNotaSaidaCOD_VENDEDOR.Value :=

        QNotaSaidaCOD_CADASTRO.Value := StrToInt(wCodigo);
        QNotaSaidaNUM_NOTA.Value := Trunc(TNotaCabNRNOTAFISC.Value);
        QNotaSaidaCOD_SERIE.Value := 'PE';//TNotaCabIDSERIENF.Value;
        qNOTASAIDACOD_SERIE_MODELO.Value := '99';
        If TNotaCabIDSITUACAO.Value = 'X' Then
         Begin
           QNotaSaidaIND_SITUACAO.Value := '3';
           QNotaSaidaCOD_MOTIVO_CANC.Value := 1;
         End
        Else
          QNotaSaidaIND_SITUACAO.Value := '2';
        QNotaSaidaIND_CONDICAO_PAGTO.Text := TNotaCabIDCONDPGTO.Text;
        QNotaSaidaDT_EMISSAO.Value := TNotaCabDTEMISSAO.Value;
        QNotaSaidaDT_MOVIMENTO.Value := TNotaCabDTMOVIMENT.Value;
        QNotaSaidaDT_RECEBIMENTO.Value := TNotaCabDTMOVIMENT.Value;
        QNotaSaidaVAL_DESPESAS.Value := TNotaCabVLDESPACES.Value;
        If TNotaCabIDENTRASAI.Value =  1 Then
           QNotaSaidaIND_ENTRADA_SAIDA.Value := 'E'
        Else
           QNotaSaidaIND_ENTRADA_SAIDA.Value := 'S';
        QNotaSaidaVAL_FRETE.Value := TNotaCabVLFRETE.Value;
        QNotaSaidaVAL_DESCONTO.Value := TNotaCabVLDESCONTO.Value;
//        QNotaSaidaCOD_TRANSPORTADOR: TIntegerField;
//        QNotaSaidaNUM_CONHECIMENTO_FRETE: TIntegerField;
        QNotaSaidaVAL_AVISTA.Value := TNotaCabVLAVISTA.Value;
        QNotaSaidaIND_TIPO_FRETE.Value := 'CIF';
        QNotaSaidaNUM_VOLUMES.Value := 0;
//        QNotaSaidaOBS.Value :=
//        QNotaSaidaOBS_COMPLEMENTO: TStringField;
        QNotaSaidaDT_USUARIO.Value := 1;
//        QNotaSaidaCOD_TRIBUTACAO_FRETE: TIntegerField;
        QNotaSaidaVAL_TOTAL_IPI.Value := 0;
        QNotaSaidaVAL_ICM_FRETE.Value := 0;
        QNotaSaidaVAL_ICM_BASE_FRETE.Value := 0;
        QNotaSaidaVAL_FUNRURAL.Value := 0;
//        QNotaSaidaDESC_PLACA.
//        QNotaSaidaDESC_TRANSPORTADORA: TStringField;
//        QNotaSaidaCOD_NOTA_CONTA_CORRENTE: TIntegerField;
//        QNotaSaidaDT_EMISSAO_CF: TDateTimeField;
//        QNotaSaidaCOD_OPERACAO_CF: TIntegerField;
 //       QNotaSaidaNR_DIAS_CHEQUE: TIntegerField;
//        QNotaSaidaCOD_CONTRATO_MOV: TIntegerField;
//        QNotaSaidaCOD_CONTRATO_GP_MOV: TIntegerField;
//        QNotaSaidaNR_DIAS_CHEQUE1: TIntegerField;
//        QNotaSaidaNR_DIAS_CHEQUE2: TIntegerField;
//        QNotaSaidaIND_NOTA_SEGURO: TStringField;
//        QNotaSaidaCOD_CONTRATO_VEND: TIntegerField;
//        QNotaSaidaNR_ROTA: TIntegerField;
        QNotaSaidaPERC_COMISSAO.Value := 0;
//        QNotaSaidaIND_MILHAGEM: TStringField;
//        QNotaSaidaNUM_OS: TIntegerField;
        QNotaSaidaCOD_DEPARTAMENTO.Value := 1;
        QNotaSaidaVAL_PEDAGIO.Value := 0;
//        QNotaSaidaCOD_VENDEDOR_PREPOSTO: TIntegerField;
//        QNotaSaidaNR_DIAS_CHEQUE3: TIntegerField;
        QNotaSaidaVAL_FRETE_TON.Value := 0;
//        QNotaSaidaDESC_OBS_CORPO_NOTA: TStringField;
//        QNotaSaidaCOD_ORDEM_COMPRA_CAB: TIntegerField;
//        QNotaSaidaCOD_CADASTRO_PARCEIRO: TIntegerField;
//        QNotaSaidaNUM_PEDIDO: TIntegerField;
//        QNotaSaidaCOD_ORDEM_CARREGAMENTO_CAB: TIntegerField;
//        QNotaSaidaNR_DIAS_CHEQUE4: TIntegerField;
//        QNotaSaidaDESC_OBS_DEVOLUCAO: TStringField;
//        QNotaSaidaCOD_PRAZO_VENCIMENTO: TIntegerField;
//        QNotaSaidaNUM_DIAS_CARENCIA: TIntegerField;
//        QNotaSaidaCOD_CULTURA: TIntegerField;
//        QNotaSaidaCOD_MOTORISTA: TIntegerField;
//        QNotaSaidaCOD_CONTRATO_PJURIDICA: TIntegerField;
//        QNotaSaidaCOD_CADASTRO_CLASSIFICACAO: TIntegerField;
//        QNotaSaidaIND_IMPRIME_FRETE: TStringField;
//        QNotaSaidaIND_IMPRIME_CAB: TStringField;
        QNotaSaidaVAL_IMPOSTO.Value := 0;
//        QNotaSaidaNUM_DESPACHO_EXPORTACAO: TFloatField;
//        QNotaSaidaDESC_MEMORANDO_EXPORTACAO: TStringField;
        QNotaSaidaVAL_DESCONTO_FITAS.Value := 0;
//        QNotaSaidaNUM_DCO: TStringField;
//        QNotaSaidaCOD_NOTA_CAB_TRANS_ENT: TIntegerField;
//        QNotaSaidaCOD_FLUXO_TREM: TIntegerField;
//        QNotaSaidaCOD_CONTRATO_PGTO: TIntegerField;
//        QNotaSaidaCOD_ARMAZEM_ALFANDEGADO: TIntegerField;
//        QNotaSaidaIND_MOV_EFETIVA_ESTOQUE: TStringField;
//        QNotaSaidaIND_BAIXA_CONTRATO_CF: TStringField;
        QNotaSaidaVAL_SUBST_TRIBUT.Value := 0;
//        QNotaSaidaDESC_MARCA: TStringField;
//        QNotaSaidaDESC_ESPECIE: TStringField;
//        QNotaSaidaDESC_CHAVE_ACESSO: TStringField;
//        QNotaSaidaIND_TIPO_NOTA: TStringField;
//        QNotaSaidaIND_CONTINGENCIA: TStringField;
//        QNotaSaidaCOD_NOTA_CAB_DEV_FIXAR: TIntegerField;
//        QNotaSaidaIND_TIPO_CONHECIMENTO: TStringField;
//        QNotaSaidaCOD_NOTA_CAB_REF: TIntegerField;
        QNotaSaidaVAL_SENAR.Value := 0;
//        QNotaSaidaBIN_XML_NFE: TMemoField;
//        QNotaSaidaCOD_OBRA_REQ_CAB: TIntegerField;
//        QNotaSaidaCOD_OBRA: TIntegerField;
//        QNotaSaidaIND_AMBIENTE_NFE: TIntegerField;
//        QNotaSaidaNUM_KM: TIntegerField;
        QNotaSaidaVAL_COMISSAO.Value := 0;
//        QNotaSaidaCOD_ORDEM_SERVICO_CAB: TIntegerField;
//        QNotaSaidaCOD_SERIE_CF: TStringField;
//        QNotaSaidaIND_ST: TStringField;
//        QNotaSaidaCOD_RECEITA_OBRIGACAO_ICMS: TStringField;
//        QNotaSaidaDT_VENCIMENTO_OBRIGACAO_ICMS: TDateTimeField;
//        QNotaSaidaCOD_OBRIGACAO_ICMS: TStringField;
//        QNotaSaidaNUM_PROCESSO_OBRIGACAO_ICMS: TStringField;
//        QNotaSaidaIND_PROCESSO_OBRIGACAO_ICMS: TIntegerField;
//        QNotaSaidaDESC_PROCESSO_OBRIGACAO_ICMS: TStringField;
//        QNotaSaidaDESC_COMPL_OBRIGACAO_ICMS: TStringField;
//        QNotaSaidaCOD_ESTADO_EMBARQUE: TStringField;
//        QNotaSaidaDESC_LOCAL_EMBARQUE: TStringField;
//        QNotaSaidaCOD_UF_VEICULO: TStringField;
        QNotaSaidaNUM_PESO_BRUTO.Value := 0;
        QNotaSaidaNUM_PESO_LIQUIDO.Value := 0;


        QNotaSaida.Post;
      Except
       If QNotaSaida.State = dsInsert Then
         QNotaSaida.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TNotaCab.Next;
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

procedure TFImportaDados.BtNotaItemClick(Sender: TObject);
Var
  wCont,wRegNaoImp : Integer;
  wCodigo,wNotaCab,wCodigoProduto : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TNotaItem.Open;
    QNotaItem.Open;
    DMOracle.DBCemapa.StartTransaction;
    TNotaItem.First;
    PB.Max := TNotaItem.RecordCount;
    wCont := 0;
    While not TNotaItem.Eof do
    Begin
      wCodigoProduto := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + TNotaItemCDMERCAD.Text);
      if wCodigoProduto <> '' then
      begin
        wCodigo := TNotaItemCDMATCOOP.Text;
        If Length(TNotaItemCDMATCOOP.Text) > 6 Then
        wCodigo := Copy(TNotaItemCDMATCOOP.Text,2,6);
        wNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_CADASTRO = ' + wCodigo + ' AND NUM_NOTA=' + TNotaItemNRNOTAFISC.Text);
        If wNotaCab = '' Then
        Begin
          TNotaItem.Next;
          Continue;
        End;
        Try
          QNotaItem.Insert;

          QNotaItemCOD_NOTA_CAB.Value := StrToInt(wNotaCab);
          QNotaItemCOD_TRIBUTACAO.Value := 1;//9;
          QNotaItemQT_QUANTIDADE.Value := TNotaItemQTQUANTIDA.Value;
          QNotaItemVAL_TOTAL.Value := TNotaItemTTMERCADOR.Value;
          QNotaItemPERC_IPI.Value := 0;
          QNotaItemPERC_COMISSAO.Value := 0;
          //showMessage(TNotaItemCDMERCAD.AsString);
          QNotaItemCOD_PRODUTO.Value := TNotaItemCDMERCAD.Value;
          QNotaItemCOD_LOTE_TIPO.Value := 1;
          QNotaItemVAL_DESCONTO.Value := 0;
          QNotaItemVAL_DESPESAS.Value := 0;;
          QNotaItemVAL_FRETE.Value := 0;
          QNotaItemPERC_DESCONTO.Value := 0;
          QNotaItemVAL_IPI.Value := 0;
          QNotaItemVAL_UNITARIO.Value := TNotaItemVLPRECOUNI.Value;
          QNotaItemVAL_ICM_BASE.Value := 0;
          QNotaItemVAL_ICM.Value := 0;
          QNotaItemIND_CLASS_IPI.Value := '00';
          QNotaItemVAL_CUSTO.Value := TNotaItemVLCUSTMED.Value;
          QNotaItemVAL_ISS.Value := 0;
          QNotaItemPERC_INSS.Value := 0;
          QNotaItemPERC_BENEFICIADO.Value := 0;
          QNotaItemIND_BX_CONTR_VEND.Value := 'N';
//        QNotaItemNUM_NOTA_PRODUTOR: TIntegerField;
//        QNotaItemIND_TIPO_CONSUMO: TStringField;
//        QNotaItemQT_CHEGADA: TFloatField;
          QNotaItemVAL_PIS.Value := 0;;
          QNotaItemVAL_CONFINS.Value := 0;
          QNotaItemPERC_DESC.Value := 0;
          QNotaItemVAL_BASE_SUBST.Value := 0;
          QNotaItemVAL_ICMS_SUBST.Value := 0;
          QNotaItemVAL_UNITARIO_TABELA.Value := TNotaItemVLPRECOUNI.Value;
//        QNotaItemCOD_CULTURA: TIntegerField;
          QNotaItemVAL_DPI_TRANSGENICOS.Value := 0;
          QNotaItemQT_CREDITO_TRANSGENICOS.Value := 0;
//        QNotaItemCOD_ROMANEIO_AGRICOLA: TIntegerField;
          QNotaItemVAL_FACS.Value := 0;
          QNotaItemVAL_FETHAB.Value := 0;
//        QNotaItemIND_CUSTO: TIntegerField;
//        QNotaItemDESC_RENDA: TStringField;
//        QNotaItemNUM_FABRICANTE: TStringField;
//        QNotaItemNUM_VOLUMES: TIntegerField;
//        QNotaItemNUM_CABECAS: TIntegerField;
//        QNotaItemCOD_CFOP: TIntegerField;
//        QNotaItemQT_CHEGADA_TREM: TFloatField;
//        QNotaItemCOD_OPERACAO: TIntegerField;
//        QNotaItemCOD_VAGAO: TIntegerField;
//        QNotaItemDESC_COMPLEMENTO_OS: TStringField;
//        QNotaItemCOD_RATEIO_ROMANEIO: TFloatField;
//        QNotaItemQT_SOBRA: TFloatField;
//        QNotaItemQT_QUEBRA: TFloatField;
//        QNotaItemQT_RETENCAO: TFloatField;
//        QNotaItemCOD_NOTA_ITEM_ORIGEM: TIntegerField;
//        QNotaItemDESC_COMPLEMENTO: TStringField;
//        QNotaItemDESC_INF_ADICIONAL: TStringField;
//        QNotaItemCOD_CST_IPI: TStringField;
//        QNotaItemNUM_DI: TStringField;
//        QNotaItemDT_DI: TDateTimeField;
//        QNotaItemDESC_LOCAL_DESEMB_DI: TStringField;
//        QNotaItemCOD_UF_DESEMB_DI: TStringField;
//        QNotaItemDT_DESEMB_DI: TDateTimeField;
//        QNotaItemCOD_EXPORTADOR: TStringField;
//        QNotaItemVAL_BC_II: TFloatField;
//        QNotaItemVAL_DESPADU_II: TFloatField;
//        QNotaItemVAL_II: TFloatField;
//        QNotaItemVAL_IOF_II: TFloatField;
          QNotaItem.Post;
          Except
           If QNotaItem.State = dsInsert Then
             QNotaItem.Cancel;
           Inc(wRegNaoImp);
          End;
       end;
          Inc(wCont);
          PB.Position := wCont;
          TNotaItem.Next;

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

procedure TFImportaDados.BtUmidadeClick(Sender: TObject);
Var
  wCont,wRegNaoImp : Integer;
  wCodigo : String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  With DMImportaDados do
  Begin
    TUmidade.Open;
    QUmidade.Open;
    DMOracle.DBCemapa.StartTransaction;
    TUmidade.First;
    PB.Max := TUmidade.RecordCount;
    wCont := 0;
    While not TUmidade.Eof do
    Begin
      Try
        QUmidade.Insert;
        QUmidadeCod_Produto.Value := TUmidadeCDMERCAD.Value;
        QUmidadePerc_Umidade.Value := TUmidadeUmidade.Value;
        QUmidadePerc_Desconto.Value := TUmidadePercentual.Value;
        QUmidadeCod_Filial.Value := 1;
        QUmidade.Post;
      Except
       If QUmidade.State = dsInsert Then
         QUmidade.Cancel;
       Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TUmidade.Next;
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

procedure TFImportaDados.BitBtn5Click(Sender: TObject);
Var wClasse, wSub : Integer;
begin
  With DMImportaDados do
  Begin
    QClasseAcerto.Open;
    DMOracle.DBCemapa.StartTransaction;
    QClasseAcerto.First;
    wClasse := QClasseAcertoNum_Classe.Value;
    wSub := 0;
    While not QClasseAcerto.Eof do
    Begin
      If wClasse <> QClasseAcertoNum_Classe.Value Then
       Begin
         wClasse := QClasseAcertoNum_Classe.Value;
         wSub := 0;
       End;
      wSub := wSub + 1;
      QClasseAcerto.Edit;
      QClasseAcertoNum_Subclasse.Value := wSub;
      QClasseAcerto.Post;
      QClasseAcerto.Next;
    End;
    DMOracle.DBCemapa.Commit;
    QClasseAcerto.Close;
 End;
end;

procedure TFImportaDados.BitBtn9Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i, wInd : Integer;
   wCaminhoArquivo, wEndereco, wNumeroEnd, wFone, wNumFoneExcel: string;
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
      maxLinha := XLSAplicacao.ActiveCell.Row;// - 1;
      // Pegar o número da última coluna
      maxColuna := XLSAplicacao.ActiveCell.Column;

      for i:= 2 to maxLinha do
      begin
        QCadastro.Close;
        QCadastro.Open;
        QCadastro.Insert;
        // Associaca a variant WorkSheet com a variant do Delphi
        //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;

        //QCadastroCOD_CADASTRO.Value := StrToInt(DMOracle.BuscaNome('SELECT SQCADASTRO.NEXTVAL FROM DUAL',''));
        QCadastroCOD_CADASTRO.Value := XLSAplicacao.Cells.Item[i, 1].Value;

        QCadastroNOME.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 2].Value));
       // QCadastroDESC_FANTASIA.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value));

        if Trim(XLSAplicacao.Cells.Item[i, 13].Value) <> '' then
        begin
          QCadastroIND_FISICA_JURIDICA.Value := 'F';{XLSAplicacao.Cells.Item[i, 2].Value;}
          QCadastroNUM_CGC_CPF.Value := XLSAplicacao.Cells.Item[i, 13].Value;
          QCadastroNUM_INSCRICAO.Value := XLSAplicacao.Cells.Item[i, 12].Value;
        end
        else
        begin
          QCadastroIND_FISICA_JURIDICA.Value := 'J';
          QCadastroNUM_CGC_CPF.Value := XLSAplicacao.Cells.Item[i, 14].Value;
          QCadastroNUM_INSCRICAO.Value := Trim(UpperCase(XLSAplicacao.Cells.Item[i, 16].Value));
        end;

        {if XLSAplicacao.Cells.Item[i, 18].Text <> '' then
          QCadastroDT_CADASTRO.Value := XLSAplicacao.Cells.Item[i, 18].Value
        else}
          QCadastroDT_CADASTRO.Value := StrToDate(XLSAplicacao.Cells.Item[i, 15].Value);

        //ENDEREÇO
        //wEndereco  := 'Rua ';{UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 11].Value));}
        //wNumeroEnd := ' Nº: ';{XLSAplicacao.Cells.Item[i, 12].Value;}
        {if Trim(wNumeroEnd) <> '' then
        begin
          QCadastroDESC_ENDERECO.Value := Trim(wEndereco) + ',' + wNumeroEnd;
          QCadastroDESC_ENDERECO_COBRANCA.Value := Trim(wEndereco) + ',' + wNumeroEnd;;
        end
        else if trim(wEndereco) <> '' then
        begin
          QCadastroDESC_ENDERECO.Value := Trim(wEndereco);
          QCadastroDESC_ENDERECO_COBRANCA.Value := Trim(wEndereco);
        end;}
        QCadastroDESC_ENDERECO.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value));
        QCadastroDESC_ENDERECO_COBRANCA.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value));

        //QCadastroDESC_COMPLEMENTO.Value := XLSAplicacao.Cells.Item[i, 15].Value;

        QCadastroDESC_BAIRRO.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 4].Value));
        QCadastroDESC_BAIRRO_COBRANCA.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 4].Value));
        QCadastroDESC_CIDADE.Value :=  UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 5].Value));
        QCadastroDESC_CIDADE_COBRANCA.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 5].Value));
        QCadastroCOD_ESTADO.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 6].Value));
        QCadastroDESC_ESTADO_COBRANCA.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 6].Value));

        QCadastroDESC_CEP.Value := bib.LimpaNumero(XLSAplicacao.Cells.Item[i, 7].Value);
        QCadastroDESC_CEP_COBRANCA.Value := bib.LimpaNumero(XLSAplicacao.Cells.Item[i,7].Value);

        //TELEFONE
        // QcadastroDESC_TELEFONE.Value := bib.LimpaNumero(XLSAplicacao.Cells.Item[i, 18].Value);
        wNumFoneExcel := bib.LimpaNumero(XLSAplicacao.Cells.Item[i, 8].Value);
        wInd := 1;
        wFone := '';
        While wInd <= Length(wNumFoneExcel) do
        Begin
          If (Copy(wNumFoneExcel,wInd,1) = '0') Or
             (Copy(wNumFoneExcel,wInd,1) = '1') Or
             (Copy(wNumFoneExcel,wInd,1) = '2') Or
             (Copy(wNumFoneExcel,wInd,1) = '3') Or
             (Copy(wNumFoneExcel,wInd,1) = '4') Or
             (Copy(wNumFoneExcel,wInd,1) = '5') Or
             (Copy(wNumFoneExcel,wInd,1) = '6') Or
             (Copy(wNumFoneExcel,wInd,1) = '7') Or
             (Copy(wNumFoneExcel,wInd,1) = '8') Or
             (Copy(wNumFoneExcel,wInd,1) = '9') Then
                wFone := wFone + Copy(wNumFoneExcel,wInd,1);
             Inc(wInd);
        End;
        if Length(wFone) = 8 then
          QCadastroDESC_TELEFONE.text := '45' + wFone
        else
          QCadastroDESC_TELEFONE.Value := wFone;
//        QcadastroDESC_CELULAR.Value  := bib.LimpaNumero(XLSAplicacao.Cells.Item[i, 19].Value);
        wNumFoneExcel := bib.LimpaNumero(XLSAplicacao.Cells.Item[i, 9].Value);
        While wInd <= Length(wNumFoneExcel) do
        Begin
          If (Copy(wNumFoneExcel,wInd,1) = '0') Or
             (Copy(wNumFoneExcel,wInd,1) = '1') Or
             (Copy(wNumFoneExcel,wInd,1) = '2') Or
             (Copy(wNumFoneExcel,wInd,1) = '3') Or
             (Copy(wNumFoneExcel,wInd,1) = '4') Or
             (Copy(wNumFoneExcel,wInd,1) = '5') Or
             (Copy(wNumFoneExcel,wInd,1) = '6') Or
             (Copy(wNumFoneExcel,wInd,1) = '7') Or
             (Copy(wNumFoneExcel,wInd,1) = '8') Or
             (Copy(wNumFoneExcel,wInd,1) = '9') Then
                wFone := wFone + Copy(wNumFoneExcel,wInd,1);
             Inc(wInd);
        End;
        if Length(wFone) = 8 then
          QCadastroDESC_CELULAR.Value := '45' + wFone
        else
          QCadastroDESC_CELULAR.Value := wFone;

        QCadastroDESC_E_MAIL.Value := XLSAplicacao.Cells.Item[i, 11].Value;
        QCadastroDESC_E_MAIL1.Value := XLSAplicacao.Cells.Item[i, 11].Value;
       // QCadastroDT_ALTERACAO.Value := XLSAplicacao.Cells.Item[i, 21].Value;
        QCadastroCOD_TIPO_CADASTRO.Value := 1;
//        QCadastroCOD_CIDADE.Value := 4183;
        QCadastroIND_SEXO_CATEGORIA.Value := 'F';
        QCadastroIND_TIPO_PROPRIETARIO.Value := 0;
        QCadastroIND_LIBERA_BLOQUETO.Value := 'SIM';
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

procedure TFImportaDados.BitBtn21Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wDescMarca, wCodProduto, wCodBarra, wValor, wTributacao: string;
begin
   // Cria Excel- OLE Object
  XLSAplicacao := CreateOleObject('Excel.Application');
  with DMOracle, DMImportaDados do
  begin
//    try
    if (ODImportaXLS.Execute) then
    begin
      try
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
        begin     {
          wCodProduto := '';
          wCodBarra := UpperCase(Trim(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,1].Value)));
          wCodProduto := DMOracle.fastselect('COD_PRODUTO','TB_PRODUTO','DESC_COD_BARRA = ' + QuotedStr(wCodBarra));
          if (wCodProduto = '') then
          begin  }
            QProduto.Close;
            QProduto.Open;
            QProduto.Insert;
            // Associaca a variant WorkSheet com a variant do Delphi
            //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
            //QProdutoCOD_PRODUTO.Value :=  StrToInt(DMOracle.BuscaNome('SELECT sqproduto.NEXTVAL FROM DUAL', '1=1'));
            QProdutoCOD_PRODUTO.Value := StrToInt(UpperCase(Trim(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,1].Value))));
            QProdutoDESC_PRODUTO.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,2].Value));
            QProdutoDESC_COD_BARRA.value := UpperCase(Trim(XLSAplicacao.cells.Item[i,1]));

//            if VarIsNull(XLSAplicacao.Cells.Item[i,6].Value) then
//              QProdutoVAL_VAREJO.Value := 0
//            else
              QProdutoVAL_VAREJO.Value := XLSAplicacao.Cells.Item[i,6].Value;

            QProdutoDESC_UNIDADE.Value := XLSAplicacao.Cells.Item[i,4].Value;
            QProdutoNUM_GENERO_NCM.Value := XLSAplicacao.Cells.Item[i,5].Value;
{            if UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,3].Value)) <> '' then
              QProdutoDESC_OBSERVACAO.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,3].Value));}
{            if UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,2].Value)) <> '' then
              QProdutoNUM_FABRICANTE.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,2].Value));}
            QProdutoCOD_CLASSE.Value := 6;
            if UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,7].Value)) = '102' then
              QProdutoCOD_TRIBUTACAO.Value := 1
            else
              QProdutoCOD_TRIBUTACAO.Value := 4;
            QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
            QProdutoNUM_EMBALAGEM.Value := 1;
            QProdutoIND_SITUACAO.Value := 'ATIVO';
            QProdutoPERC_ISS.Value := 0;
            QProdutoPERC_INSS.Value := 0;
            QProdutoDT_ULT_ALTERACAO.Value := StrToDate('18/05/2026');//DataServ;

            QProduto.Post;
          //end;
      end;
      ShowMessage('Importação Finalizada');
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

end;

procedure TFImportaDados.BitBtn22Click(Sender: TObject);
Var wCont,wInd : Integer;
    wRegNaoImp : Integer;
    wFone,wCodigo : String;
begin
{  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  With DMImportaDados do
  Begin
    TCadastro.Open;
    QCadastro.Open;
    TCadastro.First;
    PB.Max := TCadastro.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;

    While not TCadastro.Eof do
    Begin
      Try
        If (Trim(TCadastroCODIGO.Value) = '') Or
           (Trim(TCadastroNOME.Text) = '') Then
         Begin
           TCadastro.Next;
           Continue;
         End;

        QCadastro.Insert;
        QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');;
//        QCadastroCOD_CADASTRO.Text := TCadastroCODCLI.Text;
        If Trim(TCadastroNOME.Value) <> '' Then
           QCadastroNOME.Value :=  TCadastroNOME.Text
        else
           QCadastroNOME.Value := '.';
        if TCadastroNUMERO.Value = '' then
          QCadastroDESC_ENDERECO.Value :=  TCadastroENDERECO.Value
        else
          QCadastroDESC_ENDERECO.Value :=  TCadastroENDERECO.Value + ',' + TCadastroNUMERO.Value;
        QCadastroDESC_CIDADE.Value :=  UpperCase(TCadastroCIDADE.Value);
        if Trim(TCadastroESTADO.Value) = '20' then
          QCadastroCOD_ESTADO.Value := 'PR'
        else if Trim(TCadastroESTADO.Value) = ']R' then
          QCadastroCOD_ESTADO.Value := 'PR'
        else if Trim(TCadastroESTADO.Value) = '06' then
          QCadastroCOD_ESTADO.Value := 'PR'
        else if Trim(TCadastroESTADO.Value) = '''R' then
          QCadastroCOD_ESTADO.Value := 'PR'
        else
          QCadastroCOD_ESTADO.Value := UpperCase(TCadastroESTADO.Value);
        QCadastroDESC_CEP.Value :=  TCadastroCEP.Text;
        wInd := 1;
        wFone := '';
        While wInd <= Length(TCadastroTELEFONE.Value) do
         Begin
           If (Copy(TCadastroTELEFONE.Value,wInd,1) = '0') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '1') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '2') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '3') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '4') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '5') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '6') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '7') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '8') Or
              (Copy(TCadastroTELEFONE.Value,wInd,1) = '9') Then
              wFone := wFone + Copy(TCadastroTELEFONE.Value,wInd,1);
           Inc(wInd);
         End;
         QCadastroDESC_TELEFONE.text := '45' + wFone;

        QCadastroDESC_BAIRRO.Value :=  TCadastroBAIRRO.Value;
        QCadastroDT_CADASTRO.Value :=  Date;
        QCadastroCOD_PAIS.Value :=  278;
        QCadastroDESC_OBS.Value :=  TCadastroVENCIMENTO.Text;
        QCadastroDESC_OBS1.Value :=  TCadastroSITUACAO.Text;
        QCadastroIND_SEXO_CATEGORIA.Value := 'F';
        QCadastroCOD_RAMO.Value := 1;
        QCadastroCOD_TIPO_CADASTRO.Value := 1;
        QCadastroIND_SEPROC_SIMNAO.Value := 'N';
        QCadastroIND_TIPO_PROPRIETARIO.Value := 0;

         QCadastro.Post;

      Except

//        Memo1.Lines.Add(TCadastrocodCLI.Text + ' não Importado - ');
        If QCadastro.State = dsInsert Then
          QCadastro.Cancel;
        Inc(wRegNaoImp);
      End;
      Inc(wCont);
      PB.Position := wCont;
      TCadastro.Next;
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
  PB.Position := 0;}
end;

procedure TFImportaDados.BitBtn23Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wCodMarca, wCodClasse, wCodProduto, wMaxSubclasse: string;
   wValidaLinha,wDescMarca,wDescCodBarra : String;
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

      for i:=2 to maxLinha do
      begin
//        wValidaLinha :=  XLSAplicacao.Cells.Item[i, 1].Value;
//        ShowMessage(XLSAplicacao.Cells.Item[i, 2].Value);
//        if (wValidaLinha <> '') and (wValidaLinha <> 'Código') and (wValidaLinha <> 'Média:') then
//        begin
          //marca
          wCodProduto :=  XLSAplicacao.Cells.Item[i, 1].Value;
          wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + wCodProduto); //StrToInt(XLSAplicacao.Cells.Item[i, 2].Value));
          if wCodProduto = '0' then
          begin
            //marca
            //wDescMarca :=  UpperCase(XLSAplicacao.Cells.Item[i, 4].Value);
            wCodMarca  := DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(XLSAplicacao.Cells.Item[i, 4].Value)); //Trim(UpperCase(XLSAplicacao.Cells.Item[i, 23].Value)));
            if wCodMarca = '' then
            begin
              QMarca.Close;
              QMarca.Open;
              QMarca.Insert;
              QMarcaCOD_MARCA.Value := StrToInt(DMOracle.BuscaNome('SELECT SQMARCA.NEXTVAL FROM DUAL', '1=1'));
              QMarcaDESC_MARCA.Value := Trim(UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 4].Value)));
              QMarca.Post;
            end;
            wCodClasse := DMOracle.FastSelect('COD_CLASSE','TB_CLASSE','DESC_CLASSE = ' + QuotedStr(bib.RemoveAcentos( Trim(UpperCase(copy(XLSAplicacao.Cells.Item[i, 5].Value,1,30) )))));
            if wCodClasse = '' then
            begin
              QClasse.Close;
              QClasse.Open;
              QClasse.Insert;
              QClasseCOD_CLASSE.Value := StrToInt(DMOracle.BuscaNome('SELECT SQCLASSE.NEXTVAL FROM DUAL', '1=1'));
              QClasseNUM_CLASSE.Value := 1;
              wMaxSubclasse := DMOracle.BuscaNome('SELECT MAX(NUM_SUBCLASSE) FROM TB_CLASSE','NUM_CLASSE = ' + QuotedStr('1') );
              QClasseNUM_SUBCLASSE.Value := StrToInt(wMaxSubclasse) + 1;
              QClasseDESC_CLASSE.Value := Trim(UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 5].Value)));
              QClasse.Post;
            end;
            QProduto.Close;
            QProduto.Open;
            QProduto.Insert;
            // Associaca a variant WorkSheet com a variant do Delphi
            //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
            QProdutoCOD_PRODUTO.Value :=  XLSAplicacao.Cells.Item[i, 1].Value; //StrToInt(DMOracle.BuscaNome('SELECT sqproduto.NEXTVAL FROM DUAL', '1=1'));
            QProdutoDESC_PRODUTO.Value := Trim(UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value)));
            if Trim(XLSAplicacao.cells.Item[i,18].Value) <> '' then
            begin
              wDescCodBarra := DMOracle.FastSelect('DESC_COD_BARRA','TB_PRODUTO','DESC_COD_BARRA = ' + UpperCase(Trim(XLSAplicacao.cells.Item[i,18].Value)));
              if wDescCodBarra = '' then
                QProdutoDESC_COD_BARRA.value := UpperCase(Trim(XLSAplicacao.cells.Item[i,18]));
            end;
            QProdutoVAL_VAREJO.Value := XLSAplicacao.Cells.Item[i, 11].Value;
            QProdutoVAL_ATACADO.Value := XLSAplicacao.Cells.Item[i, 11].Value;
            {if QMarcaCOD_MARCA.Text <> '' then
              QProdutoCOD_MARCA.Value  :=  QMarcaCOD_MARCA.Value //XLSAplicacao.Cells.Item[i, 6].Value;
            else
              QProdutoCOD_MARCA.Value  :=  StrToInt(wCodMarca); //QMarcaCOD_MARCA.Value; //XLSAplicacao.Cells.Item[i, 6].Value;}
            wCodMarca := DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(XLSAplicacao.Cells.Item[i, 4].Value));
            if wCodMarca <> '' then
              QProdutoCOD_MARCA.Value := StrToInt(wCodMarca);//StrToInt(DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(XLSAplicacao.Cells.Item[i, 4].Value)));
            wCodClasse := DMOracle.FastSelect('COD_CLASSE','TB_CLASSE','DESC_CLASSE = ' + QuotedStr(bib.RemoveAcentos(Trim(UpperCase(copy(XLSAplicacao.Cells.Item[i, 5].Value,1,30) )))));
            if wCodClasse = '' then
              QProdutoCOD_CLASSE.Value := 6 //StrToInt(DMOracle.FastSelect('COD_CLASSE','TB_CLASSE','DESC_CLASSE = ' + QuotedStr(bib.RemoveAcentos(Trim(UpperCase(copy(XLSAplicacao.Cells.Item[i, 5].Value,1,30) ))))));
            else
              QProdutoCOD_CLASSE.Value := StrToInt(wCodClasse);
            {if QClasseCOD_CLASSE.Text <> '' then
              QProdutoCOD_CLASSE.Value := QClasseCOD_CLASSE.Value
            else
              QProdutoCOD_CLASSE.value := StrToInt(wCodClasse);}

            QProdutoDESC_UNIDADE.Value := UpperCase(Trim(XLSAplicacao.cells.Item[i,7]));
            if Trim(XLSAplicacao.Cells.Item[i, 2].Value) <> '' then
              QProdutoNUM_GENERO_NCM.Value := XLSAplicacao.Cells.Item[i, 2].Value;

            if XLSAplicacao.Cells.Item[i, 9].Value = '500' then
              QProdutoCOD_TRIBUTACAO.Value := 4
            else
              QProdutoCOD_TRIBUTACAO.Value := 1;

            QProdutoPERC_MARGEM_VAREJO.Value := (XLSAplicacao.Cells.Item[i, 16].Value*100);
            QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
            QProdutoNUM_EMBALAGEM.Value := 1;
            QProdutoIND_SITUACAO.Value := 'ATIVO';
            QProdutoPERC_ISS.Value := 0;
            QProdutoPERC_INSS.Value := 0;
            QProduto.Post;

   //         QProdutoNUM_FABRICANTE.Value := UpperCase(Bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value));
           // QProdutoDESC_COD_BARRA.Value := XLSAplicacao.Cells.Item[i, 3].Value;

            //QProdutoVAL_ATACADO.Value := XLSAplicacao.Cells.Item[i, 6].Value;
            //QProdutoNUM_GENERO_NCM.Value := XLSAplicacao.Cells.Item[i, 7].Value;
            //QProdutoCOD_CEST.Value := XLSAplicacao.Cells.Item[i, 8].Value;
            //wDescMarca := Trim(XLSAplicacao.Cells.Item[i, 9].Value)
            {if Trim(XLSAplicacao.Cells.Item[i, 9].Value) <> '' then
              QProdutoCOD_MARCA.Value := StrToInt(DMOracle.FastSelect('COD_MARCA','TB_MARCA','DESC_MARCA = ' + QuotedStr(Trim(XLSAplicacao.Cells.Item[i, 9].Value))));}

            //estoque
            QEstoque.Close;
            QEstoque.Open;
            QEstoque.Insert;
            QEstoqueCOD_FILIAL.Value      := 1;
            QEstoqueCOD_PRODUTO.Value     := QProdutoCOD_PRODUTO.Value;
            QEstoqueCOD_LOTE_TIPO.Value   := 1;
            QEstoqueVL_CUSTO_MEDIO.Value  := XLSAplicacao.Cells.Item[i, 10].Value;
            QEstoqueVL_ULTIMO_CUSTO.Value := XLSAplicacao.Cells.Item[i, 10].Value;
            QEstoqueQT_QUANTIDADE.Value   := XLSAplicacao.Cells.Item[i, 17].Value;
            QEstoque.Post; 
          //  end;
          //  QEstoque.Post; }
//          end;//Cod_produto <> ''
        end;
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

procedure TFImportaDados.BitBtn24Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wCodMarca, wCodClasse, wCodProduto, wMaxSubclasse: string;
   wValidaLinha,wDescMarca,wDescCodBarra : String;
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

      for i:=5 to maxLinha do
      begin
//        wValidaLinha :=  XLSAplicacao.Cells.Item[i, 1].Value;
//        ShowMessage(XLSAplicacao.Cells.Item[i, 2].Value);
//        if (wValidaLinha <> '') and (wValidaLinha <> 'Código') and (wValidaLinha <> 'Média:') then
//        begin
          //marca
          wCodProduto :=  XLSAplicacao.Cells.Item[i, 1].Value;
          wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + wCodProduto); //StrToInt(XLSAplicacao.Cells.Item[i, 2].Value));
          if wCodProduto = '0' then
          begin
            QProduto.Close;
            QProduto.Open;
            QProduto.Insert;
            // Associaca a variant WorkSheet com a variant do Delphi
            //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
            QProdutoCOD_PRODUTO.Value :=  XLSAplicacao.Cells.Item[i, 1].Value; //StrToInt(DMOracle.BuscaNome('SELECT sqproduto.NEXTVAL FROM DUAL', '1=1'));
            QProdutoDESC_PRODUTO.Value := Trim(UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value)));
            if Trim(XLSAplicacao.cells.Item[i,2].Value) <> '' then
            begin
              //wDescCodBarra := DMOracle.FastSelect('DESC_COD_BARRA','TB_PRODUTO','DESC_COD_BARRA = ' + UpperCase(Trim(XLSAplicacao.cells.Item[i,2].Value)));
              //if wDescCodBarra = '' then
              QProdutoDESC_COD_BARRA.value := UpperCase(Trim(Bib.LimpaString(XLSAplicacao.cells.Item[i,2],' ')));
            end;
            QProdutoVAL_VAREJO.Value := XLSAplicacao.Cells.Item[i, 4].Value;
            QProdutoVAL_ATACADO.Value := XLSAplicacao.Cells.Item[i, 4].Value;
            QProdutoCOD_CLASSE.Value := 6; //StrToInt(DMOracle.FastSelect('COD_CLASSE','TB_CLASSE','DESC_CLASSE = ' + QuotedStr(bib.RemoveAcentos(Trim(UpperCase(copy(XLSAplicacao.Cells.Item[i, 5].Value,1,30) ))))));

            QProdutoDESC_UNIDADE.Value := 'UN'; //UpperCase(Trim(XLSAplicacao.cells.Item[i,7]));
            QProdutoNUM_GENERO_NCM.Value := '';//XLSAplicacao.Cells.Item[i, 2].Value;

            QProdutoCOD_TRIBUTACAO.Value := 1;

            QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
            QProdutoNUM_EMBALAGEM.Value := 1;
            QProdutoIND_SITUACAO.Value := 'ATIVO';
            QProdutoPERC_ISS.Value := 0;
            QProdutoPERC_INSS.Value := 0;
            QProduto.Post;
            //estoque
            {QEstoque.Close;
            QEstoque.Open;
            QEstoque.Insert;
            QEstoqueCOD_FILIAL.Value      := 1;
            QEstoqueCOD_PRODUTO.Value     := QProdutoCOD_PRODUTO.Value;
            QEstoqueCOD_LOTE_TIPO.Value   := 1;
            QEstoqueVL_CUSTO_MEDIO.Value  := XLSAplicacao.Cells.Item[i, 10].Value;
            QEstoqueVL_ULTIMO_CUSTO.Value := XLSAplicacao.Cells.Item[i, 10].Value;
            QEstoqueQT_QUANTIDADE.Value   := XLSAplicacao.Cells.Item[i, 17].Value;
            QEstoque.Post;}
          //  end;
          //  QEstoque.Post; }
//          end;//Cod_produto <> ''
        end;
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

procedure TFImportaDados.BitBtn25Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo: string;
   wValidaLinha : String;
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

      for i:=5 to maxLinha do
      begin
//      wValidaLinha :=  XLSAplicacao.Cells.Item[i, 1].Value;
//      ShowMessage(XLSAplicacao.Cells.Item[i, 2].Value);
        if Trim(XLSAplicacao.Cells.Item[i, 1].Value) <> '' then
        begin
          QPlanoConta.Close;
          QPlanoConta.Open;
          QPlanoConta.Insert;
          // Associaca a variant WorkSheet com a variant do Delphi
          //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
          QPlanoContaCOD_PLANO_CONTA.Value := DMOracle.Sequencia('PLANO_CONTA');
          QPlanoContaNUM_PLANO_CONTA.Value :=  XLSAplicacao.Cells.Item[i, 1].Value; //StrToInt(DMOracle.BuscaNome('SELECT sqproduto.NEXTVAL FROM DUAL', '1=1'));
          if Trim(XLSAplicacao.Cells.Item[i, 2].Value) <> '' then
            QPlanoContaCOD_REDUZIDO.Value := StrToInt(Trim(XLSAplicacao.Cells.Item[i, 2].Value));
          QPlanoContaDESC_PLANO_CONTA.Value := Trim(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i, 3].Value));
          QPlanoContaNUM_GRAU.Value := ObterGrauConta(XLSAplicacao.Cells.Item[i, 1].Value);
          if copy(XLSAplicacao.Cells.Item[i, 1].Value,1,1) = '1' then
            QPlanoContaDESC_NATUREZA_CONTA.Value := '01'
          else
          if copy(XLSAplicacao.Cells.Item[i, 1].Value,1,1) = '2' then
            QPlanoContaDESC_NATUREZA_CONTA.Value := '02';

          QPlanoConta.Post;
        end;
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

function TFImportaDados.ObterGrauConta(const Conta: string): Integer;
var
  i, Grau: Integer;
begin
  Grau := 1; // Começa no grau 1, pois a conta inicial tem ao menos um nível.
  for i := 1 to Length(Conta) do
  begin
    if Conta[i] = '.' then
      Inc(Grau); // Incrementa o grau para cada ponto encontrado.
  end;
  Result := Grau;
end;

procedure SepararTituloParcela(const Valor: string;
  var NumTitulo, NumParcela, TotalParcelas: Integer);
var
  S, Parte: string;
  p: Integer;
begin

  S := Trim(Valor);

  { Remove -P se existir }
  p := Pos('-P', UpperCase(S));
  if p > 0 then
    Delete(S, p, 2);

  { Número do título }
  p := Pos('-', S);
  NumTitulo := StrToIntDef(Copy(S, 1, p-1),0);

  { Parte das parcelas }
  Parte := Copy(S, p+1, Length(S));

  { Parcela }
  NumParcela := StrToIntDef(
                 Copy(Parte,1,Pos('/',Parte)-1),0);

  { Total de parcelas }
  TotalParcelas := StrToIntDef(
                     Copy(Parte,Pos('/',Parte)+1,Length(Parte)),0);

end;

procedure TFImportaDados.BitBtn26Click(Sender: TObject);
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   maxLinha, maxColuna, i : Integer;
   wCaminhoArquivo, wDescProduto, wComplementoProduto, wDescMarca, wCodProduto, wCodBarra, wValor: string;
   titulo, parcela, total: Integer;
   valor : string;
begin
   // Cria Excel- OLE Object
  XLSAplicacao := CreateOleObject('Excel.Application');
  with DMOracle, DMImportaDados do
  begin
//    try
    if (ODImportaXLS.Execute) then
    begin
      try
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
          Valor := XLSAplicacao.Cells.Item[i,1].Value;
          QCR_Cab.Close;
          QCR_Cab.Open;
          QCR_Mov.Close;
          QCR_Mov.Open;
          QCR_Mov.Insert;
          QCR_Cab.Insert;
          // Associaca a variant WorkSheet com a variant do Delphi
          //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
          QCR_CabCOD_CONTA_RECEBER_CAB.Value :=  StrToInt(DMOracle.BuscaNome('SELECT SQCONTA_RECEBER.NEXTVAL FROM DUAL', '1=1'));
          QCR_CabCOD_FILIAL.Value := 1;
          QCR_CabCOD_CADASTRO.Value := XLSAplicacao.Cells.Item[i,2].Value;
          SepararTituloParcela(Valor, Titulo, Parcela, Total);
          QCR_CabNUM_TITULO.Value := titulo;
          QCR_CabNUM_PARCELA.Value := parcela;
          QCR_CabDESC_TIPO_DOCUMENTO.Value := 'IMP';
          if Trim(XLSAplicacao.Cells.Item[i,20].Value) <> '0' then
            QCR_CabCOD_NOSSO_NUMERO.Value := XLSAplicacao.Cells.Item[i,20].Value;
          QCR_CabCOD_FINALIDADE.Value := 1;
          QCR_CabCOD_DEPARTAMENTO.Value := 1;
          QCR_CabDT_EMISSAO.Value := XLSAplicacao.Cells.Item[i,6].Value;
          QCR_CabDT_VENCIMENTO.Value := XLSAplicacao.Cells.Item[i,4].Value;
          QCR_CabDT_CAPITALIZACAO.Value := XLSAplicacao.Cells.Item[i,4].Value;
          QCR_CabVAL_ORIGINAL.Value := XLSAplicacao.Cells.Item[i,5].Value;
          QCR_CabVAL_TITULO.Value := XLSAplicacao.Cells.Item[i,5].Value;
          QCR_CabVAL_JUROS.Value := XLSAplicacao.Cells.Item[i,16].Value;
          QCR_CabIND_SITUACAO.Value := 'ABERTO';
          QCR_CabDESC_OBSERVACAO.Value := UpperCase(bib.RemoveAcentos(XLSAplicacao.Cells.Item[i,1].Value));
          QCR_CabPERC_COMISSAO.Value := 0;
          QCR_Cab.Post;

          QCR_MovCOD_CONTA_RECEBER_MOV.Value := StrToInt(DMOracle.BuscaNome('SELECT SQCONTA_RECEBER_MOV.NEXTVAL FROM DUAL', '1=1'));
          QCR_MovCOD_CONTA_RECEBER_CAB.Value :=  QCR_CabCOD_CONTA_RECEBER_CAB.Value;
          QCR_MovDT_MOVIMENTO.Value := QCR_CabDT_EMISSAO.Value;
          QCR_MovVAL_MOVIMENTO.Value := QCR_CabVAL_ORIGINAL.Value;
          QCR_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
          QCR_Mov.Post;


        end;
        ShowMessage('Importação Finalizada');
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

end;

end.
