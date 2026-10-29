unit UImportaDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DB, DBTables,
  ActnList, variants, OraTeste;

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
    DataSource1: TDataSource;
    Panel2: TPanel;
    BtImportaCadastro: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    MCR: TMemo;
    MCP: TMemo;
    BitBtn21: TBitBtn;
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
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
  private
    { Private declarations }
    wbooBase: Boolean; //usado no arquivo de escrita fiscal para efetuar o controle da inserçao das aliquotas de icms
    wintContBase: Integer; //usado no arquivo de escrita fiscal com a mesma funcionalidade acima
    wfloVlrIsentas: Real; //usado no arquivo de escrita fiscal

    function RemoveAspas(Texto: string): string;
    function Telefone(wstrTel: string): string;
    function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
    function FormataCGC(wstrOpcao, wstrCGC: string): string;
    function Classificacao(wintOperacao, wintSituacao, wintCondPgto: Integer): string;
    function ValoresIcms(wbooBrinde: Boolean; wintSituacao, wintCfop: Integer; wstrBase, wstrIcms, wstrAliquota, wstrVlrContabil: string): string;
    function ValoresIpi(wintCfop: Integer; wstrValIpi: string): string;
    function RetornaItens(wContador: Integer; wstrItem: string): string;
    function RetornaNotas(wstrNota: string): string;
    function StrZero(Num, Digitos: Integer): string;
    function LimpaCep(wCep: string): string;
    function LimpaEndereco(wEndereco: string): string;
    function DeletaChar(Texto, Char: string): string;
    function LimpaString(wString, wRetirar: string): string;
    function AjustaStr(str: string; tam: Integer): string;
    function CortaStr(str: string; tam: Integer): string;
    function LimpaNumero(num: string): string;
    function LimpaDocumento(num: string): string;
    procedure importarCP;
//    function extraiNumTitulo(original: string): string;

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

function RemoveAcento(Texto: string): string;
var i: integer;
begin
  // Abaixo a relação de alguns caracteres não suportado por mainframes em especial(BB)
  for i := 1 to length(Texto) do
    case Texto[i] of

      'ã': Texto[i] := 'a';
      'á': Texto[i] := 'a';
      'é': Texto[i] := 'e';
      'í': Texto[i] := 'i';
      'ó': Texto[i] := 'o';
      'ú': Texto[i] := 'u';
      'à': Texto[i] := 'a';
      'è': Texto[i] := 'e';
      'ì': Texto[i] := 'i';
      'ò': Texto[i] := 'o';
      'ù': Texto[i] := 'u';
      'â': Texto[i] := 'a';
      'ê': Texto[i] := 'e';
      'î': Texto[i] := 'i';
      'ô': Texto[i] := 'o';
      'û': Texto[i] := 'u';
      'ä': Texto[i] := 'a';
      'ë': Texto[i] := 'e';
      'ï': Texto[i] := 'i';
      'ö': Texto[i] := 'o';
      'ü': Texto[i] := 'u';
      'õ': Texto[i] := 'o';
      'ñ': Texto[i] := 'n';
      'ç': Texto[i] := 'c';
      'Á': Texto[i] := 'A';
      'É': Texto[i] := 'E';
      'Í': Texto[i] := 'I';
      'Ó': Texto[i] := 'O';
      'Ú': Texto[i] := 'U';
      'À': Texto[i] := 'A';
      'È': Texto[i] := 'E';
      'Ì': Texto[i] := 'I';
      'Ò': Texto[i] := 'O';
      'Ù': Texto[i] := 'U';
      'Â': Texto[i] := 'A';
      'Ê': Texto[i] := 'E';
      'Î': Texto[i] := 'I';
      'Ô': Texto[i] := 'O';
      'Û': Texto[i] := 'U';
      'Ä': Texto[i] := 'A';
      'Ë': Texto[i] := 'E';
      'Ï': Texto[i] := 'I';
      'Ö': Texto[i] := 'O';
      'Ü': Texto[i] := 'U';
      'Ã': Texto[i] := 'A';
      'Õ': Texto[i] := 'O';
      'Ñ': Texto[i] := 'N';
      'Ç': Texto[i] := 'C';
      '&': Texto[i] := ' ';
      '*': Texto[i] := ' ';
      '_': Texto[i] := ' ';
      '-': Texto[i] := ' ';
      '@': Texto[i] := ' ';
      '#': Texto[i] := ' ';
      '$': Texto[i] := ' ';
      '|': Texto[i] := ' ';
    end;

  Result := Texto;

end;

// -------------------------------------------------------\\
{ Função remove aspas da string passada como parametro}

function TFImportaDados.RemoveAspas(Texto: string): string;
var i: integer;
begin
  for i := 1 to length(Texto) do
    case Texto[i] of
      CHR(39): Texto[i] := ' ';
    end;

  Result := Texto;

end;

// -------------------------------------------------------\\
{ Função utilizada para separar o codigo ddd do numero de telefone}

function TFImportaDados.Telefone(wstrTel: string): string;
var
  wintCont: integer;
  wstrS, wstrDDD: string;
begin
  for wintCont := 1 to length(wstrTel) do
    if wstrTel[wintCont] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      wstrS := wstrS + wstrTel[wintCont];
  wstrDDD := Copy(wstrS, 1, 3);
  wstrS := wstrDDD + RMaskCGC_CPF(Copy(wstrS, 4, length(wstrS)), 10);
  Result := wstrS;
end;


// -------------------------------------------------------\\
{Funcao para formatar cpf e cgc layout escrita fiscal}

function TFImportaDados.FormataCGC(wstrOpcao, wstrCGC: string): string;
var
  wstrS: string;
begin
  if (wstrOpcao = 'J') then
  begin
    wstrS := RMaskCGC_CPF(wstrCGC, 14);
    wstrS := Copy(wstrS, 1, 2) + '.' + Copy(wstrS, 3, 3) + '.' + Copy(wstrS, 6, 3) + '/' +
      Copy(wstrS, 9, 4) + '-' + Copy(wstrS, 13, 2);
  end
  else //Formatar CPF
  begin
    wstrS := RMaskCGC_CPF(wstrCGC, 11);
    wstrS := Copy(wstrS, 1, 3) + '.' + Copy(wstrS, 4, 3) + '.' + Copy(wstrS, 7, 3) + '-' + Copy(wstrS, 10, 2);
  end;
  Result := wstrS;
end;

// -------------------------------------------------------\\
{Funcao para preencher campos numericos em geração de arquivos}

function TFImportaDados.RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var S: string;
  x: integer;
begin
  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];
  while Length(S) < Zeros do
    S := '0' + S;
  Result := S;
end;

// -------------------------------------------------------\\
{Funcao para preencher campos numéricos com um tamanho especificado e decimais}

function intdecimais(wValor: string; wTamanho, wDecimais: integer): string;
var
  C, Cont, Posicao: integer;
  Res, Aux: string;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  if wValor <> '' then
  begin
    Str(StrToFloat(Trim(wValor)): wTamanho: wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    begin
      Posicao := Pos('.', Res);
      Delete(Res, Posicao, 1);
    end;

    C := Length(Res);
    for Cont := wTamanho downto 1 do
    begin
      Aux[Cont] := Res[C];
      Dec(C, 1);
      if C < 1 then
        Break;
    end;

  end;
  Res := Aux;
  Result := Res;
end;

// -------------------------------------------------------\\
{Funcao para retornar a classificação Arquivo de Escrita Fiscal}

function TFImportaDados.Classificacao(wintOperacao, wintSituacao, wintCondPgto: Integer): string;
begin
  if (wintSituacao = 3) then
    Result := '99'
  else
  begin
    case wintOperacao of
      5101, 6101, 5102, 6102, 5109, 6109, 5501, 6501:
        if (wintCondPgto = 1) or (wintCondPgto = 3) then
          Result := '03'
        else
          Result := '04';
      5124, 6124:
        if (wintCondPgto = 1) or (wintCondPgto = 3) then
          Result := '05'
        else
          Result := '06';
      5201, 6201: Result := '07';
      5202, 6202: Result := '07';
      5901, 5902, 5925, 6152, 6902, 5903, 6903: Result := '30';
      5910, 6910, 5911, 6911, 5915, 6915, 5949, 6949, 7949: Result := '99';
      5551, 6551: Result := '19';
      7101: Result := '21';
    else
      Result := '10';
    end;
  end;
end;

// -------------------------------------------------------\\
{Funcao para formar os valores de icms para Arquivo de Escrita Fiscal}

function TFImportaDados.ValoresIcms(wbooBrinde: Boolean; wintSituacao, wintCfop: Integer;
  wstrBase, wstrIcms, wstrAliquota, wstrVlrContabil: string): string;
var
  wstrAux: string;
begin
  if (wintSituacao <> 3) then
  begin
    wstrAux := Bib.StrZero('0', 112);
    case wintCfop of
      5109, 6109, 5501, 6501, 7101: //ISENTOS
        begin
          wbooBase := false;
          wstrIcms := wstrAux + wstrVlrContabil {intdecimais(wstrVlrContabil,12,2)} + Bib.StrZero('0', 12);
        end;
      5124, 5901, 6901, 5902, 6902, 5903, 6903, 5910, 6910, 5911, 6911, 5915, 6915, 5949, 6949, 6124: //OUTROS
        begin
          if (wbooBrinde) then
          begin
            wbooBase := false;
            wstrIcms := wstrAux + Bib.StrZero('0', 12) + wstrVlrContabil; //intdecimais(wstrVlrContabil,12,2);
          end
          else //DIFERENTES BASES BONIFICACAO
          begin
            Inc(wintContBase);
            wbooBase := true;
            wstrIcms := intdecimais(wstrBase, 12, 2) + intDecimais(wstrAliquota, 4, 2) + intDecimais(wstrIcms, 12, 2);
          end;
        end;
    else //DIFERENTES BASES
      begin
        Inc(wintContBase);
        wbooBase := true;
        wstrIcms := intdecimais(wstrBase, 12, 2) + intDecimais(wstrAliquota, 4, 2) + intDecimais(wstrIcms, 12, 2);
      end;
    end;
  end
  else
    wstrIcms := '';
  Result := wstrIcms;
end;

// -------------------------------------------------------\\
{Funcao para formar os valores de icms para Arquivo de Escrita Fiscal}

function TFImportaDados.ValoresIpi(wintCfop: Integer; wstrValIpi: string): string;
var
  wstrAux: string;
begin
  wstrAux := Bib.StrZero('0', 12);
  case wintCfop of
    5124, 5901, 6901, 5902, 6902, 5903, 6903, 5910, 6910, 5911, 6911, 5915, 6915, 5949, 6949: //OUTROS
      wstrValIpi := wstrAux + wstrAux + wstrAux + intDecimais(wstrValIpi, 12, 2);
  else
    wstrValIpi := wstrAux + wstrAux + intDecimais(wstrValIpi, 12, 2) + wstrAux;
  end;
  Result := wstrValIpi;
end;

// -------------------------------------------------------\\
{Funcao para formar os valores das linhas de Base  das Notas Fiscais do Arquivo de Escrita Fiscal}

function TFImportaDados.RetornaNotas(wstrNota: string): string;
begin

  if (Length(wstrNota) = 272) then
    Result := wstrNota
  else
    if (wbooBase) then
      Result := wstrNota + RMaskCGC_CPF('0', (248 - Length(wstrNota))) + IntDecimais(FloatToStr(wfloVlrIsentas), 12, 2) + '000000000000'
    else
      Result := wstrNota;
  wbooBase := False;
end;

{ Função para inserir 0 a esquerda de um numero inteiro }

function TFImportaDados.StrZero(Num, Digitos: Integer): string;
var V: string;
begin
  V := IntToStr(num); //converte o numero par string
  Trim(V);
  {insere zero a esquerda}
  while Length(V) < Digitos do
  begin
    V := '0' + V;
  end;
  Result := V;
end;

procedure TFImportaDados.SBBaseClick(Sender: TObject);
begin
  with DMOracle do
  try

    if SBBase.Down then
    begin
      SBBase.Caption := 'Produção';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORA';
      DBCemapa.Connected := True;
    end
    else
    begin
      SBBase.Caption := 'Teste';
      DBCemapa.Connected := False;
      DBCemapa.LogonDataBase := 'ORCL';
      DBCemapa.Connected := True;
    end;
   // SetaUsuario;
  except
    MessageDlg('Não foi possível conectar com esta base de dados!'
      + #13 + 'Certifique-se que esta base existe em seu servidor', mtWarning, [mbOk], 0);
  end;
end;

procedure TFImportaDados.BtImportaProdutoClick(Sender: TObject);
var wCont, wRegNaoImp, wCodDep, wCodGru, wInd: Integer;
  wMarca : String;
  wTbMarca: array[1..300] of String;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  with DMImportaDados do
  begin
    TProduto.Open;
    QProduto.Open;
    DMOracle.DBCemapa.StartTransaction;
    TProduto.First;
    PB.Max := TProduto.RecordCount;
    wCont := 0;
    while not TProduto.Eof do
    begin
      If TProdutoB1_Marca.Text <> '' Then
       Begin
         wInd := 1;
         While wInd <= 300 Do
         Begin
           If wTbMarca[wind] = '' Then
              Break;
           If wTbMarca[wind] = TProdutoB1_Marca.Text Then
              Break;
           Inc(Wind);
         End;
         If wTbMarca[wind] = '' Then
            wTbMarca[wind] := TProdutoB1_Marca.Text;
       End;
      TProduto.Next;
    End;
    wInd := 1;
    QMarca.Close;
    QMarca.Open;
    While wInd <= 300 Do
    Begin
      If wTbMarca[wind] = '' Then
         Break;
      QMarca.Insert;
      QMarcaDesc_Marca.Value := wTbMarca[wind];
      Inc(wInd);
    End;
    TProduto.First;
    PB.Max := TProduto.RecordCount;
    wCont := 0;
    DMOracle.DBCEmapa.Commit;
    DMOracle.DBCemapa.StartTransaction;
    while not TProduto.Eof do
    begin
      try
        QProduto.Insert;
        QProdutoCOD_PRODUTO.Text := TProdutoB1_CodPro.Text;
//        QProdutoCOD_PRODUTO.Value := DMOracle.Sequencia('PRODUTO');
//        QProdutoNUM_FABRICANTE.Value :=  TProdutoCDMERCAD.Text;
        QClasse.Close;
        QClasse.SetVariable('CLASSE', 1);
        QClasse.SetVariable('SUB_CLASSE', TProdutoB1_GruPro.Value);
        QClasse.Open;
        if QClasse.Eof then
          QProdutoCOD_CLASSE.Value := 6
        else
          QProdutoCOD_CLASSE.Value := QClasseCod_Classe.Value;
        wMarca := ''; 
        If (TProdutoB1_Marca.Text) <> '' Then
           wMarca := DMOracle.BuscaNome('SELECT COD_MARCA FROM TB_MARCA','DESC_MARCA = '+Chr(39) + UpperCase(TProdutoB1_Marca.Text)+Chr(39));
        If wMarca <> '' Then
           QProdutoCOD_MARCA.Value := StrToInt(wMarca);
//        If TProdutoIdTribVen.Value <> 0 Then
//           QProdutoCOD_TRIBUTACAO.Value := TProdutoIdTribVen.Value
//        Else
        QProdutoCOD_TRIBUTACAO.Value := 1;
        QProdutoDESC_PRODUTO.Value := TProdutoB1_DESPRO.Value;
        QProdutoNUM_EMBALAGEM.Value := 1;
        QProdutoDESC_UNIDADE.Value := TProdutoB1_UNIMED.Value;
        // Checar
//        QProdutoNUM_TRIB_TRANSFERENCIA.Value := TProdutoIDTRIBVEN.Value;
        QProdutoVAL_VAREJO.Value := TProdutoB1_PRVEND1.Value;
//        QProdutoVAL_ATACADO.Value := TProdutoVLATACADO.Value;
        QProdutoPERC_MARGEM.Value := TProdutoB1_LUCRLIQ.Value;
//        QProdutoPERC_DESCONTO_MAXIMO.Value := TProdutoPCDESCONTO.Value;
        QProdutoPERC_IPI.Value := 0; //TProdutoPCALIQIPI.Value;
        QProdutoDESC_CLASS_FISCAL.Value := ''; //FloatToStr(TProdutoCLASFISCAL.Value);
        QProdutoIND_TIPO_PRODUTO.Value := 'COMERCIAL';
//        QProdutoDT_ALTERACAO_PRECO.Text := TProdutoDTULALTPRE.Text;
//        QProdutoNUM_FABRICANTE.Value := TProdutoCDFABRICA.Value;
//        QProdutoCOD_CADASTRO.Value := Trunc(TProdutoCDFORNEC.Value);
        QProdutoDESC_COMPLEMENTO.Value := TProdutoB1_Ref.Value;
//        QProdutoDESC_COMPLEMENTO_2.Value := TProdutoMEDIDA.Value;
        QProdutoPERC_INSS.Value := 0;
//        IF TProdutoIDTRIBVEN.Value = 88 then
        QProdutoPERC_ISS.Value := 0;
        (*
        TProdutoCDDEPMERC.Value;
        TProdutoQTDISPONIV.Value;
        TProdutoIDINFDEF.Value;
        TProdutoVLESTOQUE.Value;
        TProdutoDTVENCPRE.Text;
        TProdutoMINIMO.Value;
        TProdutoMAXIMO.Value;
        TProdutoMARGELUCRO.Value;
        TProdutoPRECOAUTO.Value;
        TProdutoDTVENDA.Text;
        TProdutoQTNORMAL.Value;
        TProdutoVLNORMAL.Value;
        TProdutoMATFABRICA.Value;
        TProdutoETIQUETAS.Value;
        TProdutoMEDIDA.Value;
        TProdutoPCDESCATA.Value;
        TProdutoNOVOCODIGO.Value;
        TProdutoATU_VENC.Value;
        TProdutoVLCUSTMED.Value;
        TProdutoVLCUSTO.Value;
        TProdutoDTCOMPRA.Text;
        TProdutoQTULTCOMPR.Value;
        TProdutoVLCOMPRA.Value;
        TProdutoVLCUSMOEDA.Value;
        *)
        QProduto.Post;
      except
        if QProduto.State = dsInsert then
          QProduto.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TProduto.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BtImportaCadastroClick(Sender: TObject);
var wCont, wInd: Integer;
  wRegNaoImp: Integer;
  wFone: string;

  wPais, wEstado, wDescCidade: string;
  wCidade: Integer;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TCadastro.Open;
    QCadastro.Open;
    TCadastro.First;
    PB.Max := TCadastro.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wPais := DMOracle.FastSelect('COD_PAIS', 'TB_PAIS', 'TRIM(UPPER(DESC_PAIS)) = TRIM(UPPER(' + QuotedStr('BRASIL') + '))');
    DMOracle.DBCEmapa.StartTransaction;
    while not TCadastro.Eof do
    begin
      try
        wCidade := -1;
        wEstado := '';
        wDescCidade := '';
        QCidadeNome.Close;
        QCidadeNome.SetVariable('DESC_CIDADE', TCadastroA1_CidCli.Value);
        if ((TCadastroA1_UfCli.IsNull) or (TCadastroA1_UfCli.Value = '')) then
          QCidadeNome.SetVariable('COD_ESTADO', 'PR')
        else
          QCidadeNome.SetVariable('COD_ESTADO', TCadastroA1_UfCli.Value);
        QCidadeNome.Open;
        if not QCidadeNome.IsEmpty then
        begin
          wCidade := QCidadeNomeCOD_CIDADE.Value;
          wEstado := QCidadeNomeCOD_ESTADO.Value;
          wDescCidade := QCidadeNomeDESC_CIDADE.Value;
        end;

        // Procura Cidade (Fim)

        QCadastro.Insert;
        QCadastroCOD_CADASTRO.Text := TCadastroA1_CodCli.Text;
        //DMOracle.Sequencia('CADASTRO');
//        QCadastroCOD_CADASTRO_NOVO.Value := Trunc(TCadastroFOR_COD.Value);

        if Trim(TCadastroA1_NomCli.Value) <> '' then
          QCadastroNOME.Value := TCadastroA1_NomCli.Value
        else
          QCadastroNOME.Value := '.';
        If TCadastroA1_ResCli.Value <> '' Then
           QCadastroDESC_ENDERECO.Value := TCadastroA1_ResCli.Value
        else
           QCadastroDESC_ENDERECO.Value := '.';   
        if wCidade = -1 then
         Begin
           If TCadastroA1_CidCli.Value <> '' Then
              QCadastroDESC_CIDADE.Value := TCadastroA1_CidCli.Value
           Else
              QCadastroDESC_CIDADE.Value := 'MISSAL';
           iF TCadastroA1_UfCli.Value <> '' Then
              QCadastroCOD_ESTADO.Value := TCadastroA1_UfCli.Value
           Else
              QCadastroCOD_ESTADO.Value := 'PR';
         End
        else
        begin
          QCadastroDESC_CIDADE.Value := wDescCidade;
          QCadastroCOD_CIDADE.Value := wCidade;
          QCadastroCOD_ESTADO.Value := wEstado;
        end;
        QCadastroDESC_CEP.Value := TCadastroA1_CEPCli.Text;
        QCadastroNUM_INSCRICAO.Value := LimpaDocumento(TCadastroA1_RgCli.Value);
        QCadastroDESC_TELEFONE.Value := LimpaNumero(TCadastroA1_FonCli.Value);
        QCadastroNUM_CGC_CPF.Value := LimpaNumero(TCadastroA1_CiCli.Value);
        if Length(QCadastroNUM_CGC_CPF.Value) = 11 then
          QCadastroIND_FISICA_JURIDICA.Value := 'F'
        else
          QCadastroIND_FISICA_JURIDICA.Value := 'J';
        QCadastroDESC_BAIRRO.Value := TCadastroA1_BaiCli.Value;
        QCadastroDT_NASCIMENTO.Text :=  TCadastroA1_DtNasCl.Text;

        QCadastroNOME_MAE.Value := TCadastroA1_FilCli.Value;
//        QCadastroNOME_PAI.Value := TCadastroPAIPRO.Value;
//        QCadastroNOME_AUTORIZADO2.Value := TCadastroNOMPAC.Value;
//        QCadastroNOME_AUTORIZADO3.Value := TCadastroNOMMAC.Value;
        if TCadastroA1_DtCad.Text <> '' then
          QCadastroDT_CADASTRO.Text := TCadastroA1_DtCad.Text
        else
          QCadastroDT_CADASTRO.Value := Date;
        if wPais <> '' then
          QCadastroCOD_PAIS.Value := StrToInt(wPais);

        if TCadastroA1_ECivil.Value = 'C' THEN
           QCadastroCOD_ESTADO_CIVIL.Value := 1
        Else
          if TCadastroA1_ECivil.Value = 'S' THEN
             QCadastroCOD_ESTADO_CIVIL.Value := 2
          Else
            if TCadastroA1_ECivil.Value = 'V' THEN
               QCadastroCOD_ESTADO_CIVIL.Value := 3
            else
              if TCadastroA1_ECivil.Value = 'A' THEN
                 QCadastroCOD_ESTADO_CIVIL.Value := 5
              else
                if TCadastroA1_ECivil.Value = 'J' THEN
                   QCadastroCOD_ESTADO_CIVIL.Value := 6
                else
                  if TCadastroA1_ECivil.Value = 'D' THEN
                     QCadastroCOD_ESTADO_CIVIL.Value := 7
                  else
                     QCadastroCOD_ESTADO_CIVIL.Value := 1;


        QCadastroDESC_OBS.Value :=  TCadastroA1_PontoRe.Value;
//        QCadastroDESC_OBS1.Value :=  TCadastroOBSER2.Value;
        QCadastroVAL_LIMITE.Value := TCadastroA1_LIMITE.Value;
        QCadastroDESC_CPF_CONJUGE.Value := LimpaNumero(TCadastroA1_CpfConj.Value);
        QCadastroNOME_CONJUGE.Value := TCadastroA1_NomCon.Value;
        QCadastroDT_NASCIMENTO_CONJUGE.Value := TCadastroA1_DtNasCo.Value;
//        QCadastroDESC_EMPRESA_CONJUGE.Value := TCadastroENDCOM.Value;
//        If TCadastroCATEGO.Value = 5 Then
//           QCadastroCOD_REGIAO.Value := 2
//        Else
        QCadastroCOD_REGIAO.Value := 1;

        QCadastroDESC_FAX.Value := LimpaNumero(TCadastroA1_FAXCli.Value);
//        If  (TCadastroIDCLASS.Value > 0) and (TCadastroIDCLASS.Value < 3) Then
//            QCadastroCOD_CLASS_CADASTRO.Value :=  TCadastroIDCLASS.Value
//        Else
        QCadastroCOD_CLASS_CADASTRO.Value := 1;
       If TCadastroA1_SEXCli.Value <> '' Then
           QCadastroIND_SEXO_CATEGORIA.Value :=  TCadastroA1_SEXCli.Value
        Else
            QCadastroIND_SEXO_CATEGORIA.Value := 'M';
//        QCadastroNUM_CAIXA_POSTAL.Text :=  TCadastroC_CXP.Text;
        QCadastroDESC_FANTASIA.Value := TCadastroA1_FANTASI.Value;
        // QCadastroDT_CANCELAMENTO.Text :=  TCadastroDTDESLIGA.Text;
//         QCadastroPERC_FUNRURAL.Value :=  TCadastroFUNRURAL.Value;
        QCadastroCOD_RAMO.Value := 2;
//        If TCadastroCDVENDED.Value = 0 then
//          QCadastroCOD_VENDEDOR.Value := 1
//        Else
//          QCadastroCOD_VENDEDOR.Value :=  Trunc(TCadastroCDVENDED.Value);
//        QCadastroDESC_ESTADO_COBRANCA.Value :=  TCadastroC_UFCOB.Value;
//       QCadastroDESC_CIDADE_COBRANCA.Value :=  TCadastroC_CIDCOB.Value;
//        QCadastroDESC_ENDERECO_COBRANCA.Value :=  TCadastroC_ENDCOB.Value;
//        QCadastroDESC_CEP_COBRANCA.Value :=  TCadastroC_CEPCOB.Text;
//        If (TCadastroIDTIPCLIE.Value = 1) then
//          QCadastroCOD_TIPO_CADASTRO.Value := 1;
//       Else
        QCadastroCOD_TIPO_CADASTRO.Value := 1;

        //
        QCadastroDESC_CELULAR.Text := LimpaNumero(TCadastroA1_FonCel.Text);
//        QCadastroNOME_CONTATO.Value := TCadastroPROFISSAO.Value;
        //QCadastroDESC_TELEFONE_COMERCIAL.Value :=
        //QCadastroNUM_JUNTA.Value :=
        //QCadastroDT_FUNDACAO.Text :=
        //QCadastroDT_JUNTA.Text :=
        //QCadastroDESC_NATURALIDADE.Value :=
        //QCadastroDESC_ESTADO_NATURAL.Value :=
        //QCadastroDT_EXPEDICAO_IDENTIDADE.Text :=
        QCadastroDESC_E_MAIL.Value := TCadastroA1_EMail.Text;
        //QCadastroDESC_FAX_COBRANCA.Value :=

        QCadastroIND_SEPROC_SIMNAO.Value := 'N';

        //QCadastroDESC_INSCRICAO_MUNICIPAL.Value :=
        //QCadastroDESC_CPF_CONJUGE.Value :=
        //QCadastroDESC_IDENTIDADE_CONJUGE.Value :=
        //QCadastroCOD_BANCO_AGENCIA.Value :=
        //QCadastroCOD_OPERACAO_CC.Value :=

        QCadastro.Post;
      except
//        Memo1.Lines.Add(TCadastrocodCLI.Text + ' não Importado - ');
        if QCadastro.State = dsInsert then
          QCadastro.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TCadastro.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

//function TFImportaDados.extraiNumTitulo(original: string): string;
//var pos1, pos2, x: Integer;
//  wNumero: string;
//begin
//  pos1 := Pos('-', original);
//  pos2 := Pos('/', original);
//  if ((pos1 > 0) and (pos2 > 0)) then
//  begin
//    if pos1 < pos2 then
//      x := pos1
//    else
//      x := pos2;
//  end
//  else
//  begin
//    x := 0;
//    if pos1 <= 0 then
//      x := pos2;
//    if pos2 <= 0 then
//      x := pos1;
//  end;
//  if x = 0 then
//    wNumero := original
//  else
//    wNumero := Copy(original, 1, x - 1);
//
//  Result := wNumero;
//end;

procedure TFImportaDados.BtImpCtRecebCabClick(Sender: TObject);
var wCont, wCont1: Integer;
  wRegNaoImp, wContCommit, wCad, wContParcela: Integer;
  wNumero, wParc, wCadString, wTitAnterior, wSerieAnterior, wClienteAnterior: string;
  query: TOracleDataSet1;
  wCR: Integer;
begin
  if (MessageDlg('Já importou os produtos, clientes, fornecedores e vendedores né tio?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    if CdCR_Cab.Active = False then
      CdCR_Cab.Open;
    CdCR_Cab.First;
    PB.Max := CdCR_Cab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    wContParcela := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not CdCR_Cab.Eof do
    begin
      try
        wNumero := DMImportaDados.extraiNumTitulo(CdCR_CabDUP_NUM.Value);
//        wNumero := Bib.LimpaNumero(wNumero);

        if wTitAnterior = '' then
          wTitAnterior := wNumero;
        if wClienteAnterior = '' then
          wClienteAnterior := CdCR_CabDUP_CLI.Text;
        if wSerieAnterior = '' then
          wSerieAnterior := Trim(CdCR_CabDUP_SERIE.Value);

        if ((wTitAnterior = wNumero) and (wSerieAnterior = Trim(CdCR_CabDUP_SERIE.Value)) and (wClienteAnterior = CdCR_CabDUP_CLI.Text)) then
          Inc(wContParcela)
        else
          wContParcela := 1;
        wParc := IntToStr(wContParcela);
        wTitAnterior := wNumero;
        wClienteAnterior := CdCR_CabDUP_CLI.Text;
        wSerieAnterior := Trim(CdCR_CabDUP_SERIE.Value);

        if (CdCR_CabDUP_CLI.Value > 0) then
        begin
          query := bib.executaQueryString('SELECT COD_CADASTRO FROM TB_CADASTRO WHERE COD_CADASTRO_NOVO = ' + CdCR_CabDUP_CLI.Text + ' AND COD_TIPO_CADASTRO = 1');
          wCadString := Bib.pegaValor(query, 'COD_CADASTRO');
          Bib.fechaQuery(query);
          if wCadString <> '' then
          begin
            wCad := StrToInt(wCadString);

            wCR := DMOracle.Sequencia('CONTA_RECEBER');

            if (not QCR_Cab.Active) then
            begin
              QCR_Cab.Close;
              QCR_Cab.SetVariable('PK', wCR);
              QCR_Cab.Open;
            end;

            QCR_Cab.Insert;
            QCR_CabCOD_DEPARTAMENTO.Value := 1;
            QCR_CabDT_BAIXA.Text := CdCR_CabDUP_DTPGTO.Text;
            QCR_CabCOD_CADASTRO.Value := wCad;
            if (CdCR_CabDUP_DTV.Text <> '/  /') and (CdCR_CabDUP_DTV.Text <> '') then
              QCR_CabDT_VENCIMENTO.Text := CdCR_CabDUP_DTV.Text
            else
              QCR_CabDT_VENCIMENTO.Text := CdCR_CabDUP_EMI.Text;
            QCR_CabDT_EMISSAO.Text := CdCR_CabDUP_EMI.Text;
            QCR_CabNUM_PARCELA.Value := StrToInt(wParc);
            QCR_CabNUM_TITULO.Value := StrToFloat(wNumero);
            QCR_CabVAL_ORIGINAL.Value := CdCR_CabDUP_VLR.Value;
            QCR_CabVAL_JUROS.Value := 0;
            QCR_CabDT_MOVIMENTO.Text := CdCR_CabDUP_EMI.Text;
            QCR_CabDT_CAPITALIZACAO.Text := QCR_CabDT_VENCIMENTO.Text;
            QCR_CabIND_SITUACAO.Value := 'ABERTO';
            QCR_CabVAL_TITULO.Value := QCR_CabVAL_ORIGINAL.Value;
            if CdCR_CabDUP_RECEB.Value = 'B' then
            begin
              QCR_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
              QCR_CabDT_BAIXA.Value := CdCR_CabDUP_DTPGTO.Value;
              QCR_CabVAL_TITULO.Value := 0;
            end;
            QCR_CabCOD_FILIAL.Value := 1;
            QCR_CabCod_Vendedor.Value := CdCR_CabDUP_VEN.Value;
            QCR_CabDESC_TIPO_DOCUMENTO.Value := CdCR_CabDUP_SERIE.Text;
            QCR_CabCOD_FINALIDADE.Value := 2;
            QCR_CabCOD_CONTA_RECEBER_CAB.Value := wCR;
            QCR_CabIND_ACEITE.Value := 'SIM';
            QCR_CabPERC_COMISSAO.Value := 0;
            QCR_CabPERC_COMISSAO1.Value := 0;

            try
              QCR_Cab.Post;
            except
              on e: Exception do
                MessageDlg(e.Message + #13 + #10 + CdCR_CabDUP_NUM.value, mtError, [mbOK], 0);
            end;

            QCR_Mov.Close;
            QCR_Mov.SetVariable('PK', wCR);
            QCR_Mov.Open;

            QCR_Mov.Insert;
            QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
            QCR_MovCOD_CONTA_RECEBER_CAB.Value := wCR;
            QCR_MovDT_MOVIMENTO.Text := QCR_CabDT_EMISSAO.Text;
            QCR_MovVAL_MOVIMENTO.Value := QCR_CabVAL_ORIGINAL.Value;
            QCR_MovCOD_USUARIO.Value := 1;
            QCR_MovDT_USUARIO.Value := Date;
            QCR_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
            QCR_Mov.Post;
            if CdCR_CabDUP_RECEB.Value = 'B' then
            begin
              QCR_Mov.Insert;
              QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
              QCR_MovCOD_CONTA_RECEBER_CAB.Value := wCR;
              QCR_MovDT_MOVIMENTO.Text := CdCR_CabDUP_DTPGTO.Text;
              QCR_MovVAL_MOVIMENTO.Value := QCR_CabVAL_ORIGINAL.Value;
              QCR_MovCOD_USUARIO.Value := 1;
              QCR_MovDT_USUARIO.Value := Date;
              QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
              QCR_Mov.Post;
            end;
            if CdCR_CabDUP_DSC.Value > 0 then
            begin
              QCR_Mov.Insert;
              QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
              QCR_MovCOD_CONTA_RECEBER_CAB.Value := wCR;
              QCR_MovDT_MOVIMENTO.Text := CdCR_CabDUP_DTPGTO.Text;
              QCR_MovVAL_MOVIMENTO.Value := CdCR_CabDUP_DSC.Value;
              QCR_MovCOD_USUARIO.Value := 1;
              QCR_MovDT_USUARIO.Value := Date;
              QCR_MovIND_TIPO_MOVIMENTO.Value := 'DESC. CONCEDIDO';
              QCR_Mov.Post;
            end;
            if CdCR_CabDUP_VLJ.Value > 0 then
            begin
              QCR_Mov.Insert;
              QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
              QCR_MovCOD_CONTA_RECEBER_CAB.Value := wCR;
              QCR_MovDT_MOVIMENTO.Text := CdCR_CabDUP_DTPGTO.Text;
              QCR_MovVAL_MOVIMENTO.Value := CdCR_CabDUP_VLJ.Value;
              QCR_MovCOD_USUARIO.Value := 1;
              QCR_MovDT_USUARIO.Value := Date;
              QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. JUROS';
              QCR_Mov.Post;
            end;

          end
          else
            MCR.Lines.Add(CdCR_CabDUP_NUM.Value + ' - wCadString = VAZIO');
        end
        else
          MCR.Lines.Add(CdCR_CabDUP_NUM.Value + ' - DUP_CLI <= 0');
      except
        on e: Exception do
        begin
          MCR.Lines.Add(CdCR_CabDUP_NUM.Value + ' - ERRO (' + e.Message + ')');

          if QCR_Cab.State = dsInsert then
            QCR_Cab.Cancel;
          Inc(wRegNaoImp);
        end;
      end;
      Inc(wCont);
      Inc(wContCommit);
      if wContCommit > 2000 then
      begin
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;

        QCR_Cab.Close;
        QCR_Cab.SetVariable('PK', wCR);
        QCR_Cab.Open;
      end;
      PB.Position := wCont;
      CdCR_Cab.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn2Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
  wCab: string;
  wContCommit: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TCR_Mov.Open;
    QCR_Mov.Open;
    TCR_Mov.First;
    PB.Max := TCR_Mov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TCR_Mov.Eof do
    begin
      if TCR_MovCDCODCLI.Value = 0 then
      begin
        TCR_Mov.Next;
        Continue;
      end;

      try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
          'COD_CADASTRO = ' + FloatToStr(TCR_MovCDCODCLI.Value)
          + ' AND NUM_TITULO = ' + FloatToStr(TCR_MovNRTITULO.Value)
          + ' AND NUM_PARCELA = ' + FloatToStr(TCR_MovNRPARC.Value)
          + ' AND DESC_TIPO_DOCUMENTO = ' + Chr(39) + TCR_MovIDDOCUMENT.Value + Chr(39));
        if wCab <> '' then
        begin
          QCR_Mov.Insert;
          QCR_MovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
          QCR_MovCOD_CONTA_RECEBER_CAB.Value := StrToInt(wCab);
          QCR_MovDT_MOVIMENTO.Text := TCR_MovDTOPERACAO.Text;
          QCR_MovVAL_MOVIMENTO.Value := TCR_MovVLOPERACAO.Value;
          QCR_MovCOD_USUARIO.Value := 1;
          QCR_MovDT_USUARIO.Value := Date;
          //QCR_MovDESC_OBSERVACAO.Value :=
          case TCR_MovIDCODOPER.Value of
            1: QCR_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
            2: QCR_MovIND_TIPO_MOVIMENTO.Value := 'JUROS';
            50: QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
            51: QCR_MovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. JUROS';
            52: QCR_MovIND_TIPO_MOVIMENTO.Value := 'DESC. CONCEDIDO';
          end;
          QCR_Mov.Post;
        end;
      except
        if QCR_Mov.State = dsInsert then
          QCR_Mov.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      Inc(wContCommit);
      if wContCommit > 5000 then
      begin
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;
      end;
      PB.Position := wCont;
      TCR_Mov.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BtImportaHistoricoClick(Sender: TObject);
var wCont, wInd: Integer;
  wRegNaoImp: Integer;
  wFone: string;

  wPais, wEstado, wDescCidade: string;
  wCidade: Integer;
begin
  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TFornecedor.Open;
    QCadastro.Open;
    TFornecedor.First;
    PB.Max := TFornecedor.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wPais := DMOracle.FastSelect('COD_PAIS', 'TB_PAIS', 'TRIM(UPPER(DESC_PAIS)) = TRIM(UPPER(' + QuotedStr('BRASIL') + '))');
    DMOracle.DBCEmapa.StartTransaction;
    while not TFornecedor.Eof do
    begin
      try
        wCidade := -1;
        wEstado := '';
        wDescCidade := '';
        QCidadeNome.Close;
        QCidadeNome.SetVariable('DESC_CIDADE', TFornecedorA2_CidFor.Value);
        if ((TFornecedorA2_EstFor.IsNull) or (TFornecedorA2_EstFor.Value = '')) then
          QCidadeNome.SetVariable('COD_ESTADO', 'PR')
        else
          QCidadeNome.SetVariable('COD_ESTADO', TFornecedorA2_EstFor.Value);
        QCidadeNome.Open;
        if not QCidadeNome.IsEmpty then
        begin
          wCidade := QCidadeNomeCOD_CIDADE.Value;
          wEstado := QCidadeNomeCOD_ESTADO.Value;
          wDescCidade := QCidadeNomeDESC_CIDADE.Value;
        end;

        // Procura Cidade (Fim)

        QCadastro.Insert;
        QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
        QCadastroCOD_CADASTRO_NOVO.Text := TFornecedorA2_CodFor.Text;

        if Trim(TFornecedorA2_NomeFor.Value) <> '' then
          QCadastroNOME.Value := TFornecedorA2_NomeFor.Value
        else
          QCadastroNOME.Value := '.';
        If TFornecedorA2_EndFor.Text <> '' Then
           QCadastroDESC_ENDERECO.Value := TFornecedorA2_EndFor.Value
        Else
           QCadastroDESC_ENDERECO.Value := '.';
        if wCidade = -1 then
         Begin
           If TFornecedorA2_CidFor.Text <> '' Then
              QCadastroDESC_CIDADE.Value := TFornecedorA2_CidFor.Value
           Else
              QCadastroDESC_CIDADE.Value := 'MISSAL';
           If TFornecedorA2_EstFor.Text <> '' Then
              QCadastroCOD_ESTADO.Value := TFornecedorA2_EstFor.Value
           Else
              QCadastroCOD_ESTADO.Value := 'PR';
         End
        else
        begin
          QCadastroDESC_CIDADE.Value := wDescCidade;
          QCadastroCOD_CIDADE.Value := wCidade;
          QCadastroCOD_ESTADO.Value := wEstado;
        end;
        QCadastroDESC_CEP.Value := TFornecedorA2_CepFor.Text;
        QCadastroNUM_INSCRICAO.Value := LimpaDocumento(TFornecedorA2_InsFor.Value);
        QCadastroDESC_TELEFONE.Value := LimpaNumero(TFornecedorA2_FoneFor.Value);
        QCadastroNUM_CGC_CPF.Value := LimpaNumero(TFornecedorA2_CgcFor.Value);
        if Length(QCadastroNUM_CGC_CPF.Value) = 11 then
          QCadastroIND_FISICA_JURIDICA.Value := 'F'
        else
          QCadastroIND_FISICA_JURIDICA.Value := 'J';
        QCadastroDESC_BAIRRO.Value := TFornecedorA2_BaiFor.Value;
//        QCadastroDT_NASCIMENTO.Text :=  TCadastroA1_DtNasCl.Text;

//        QCadastroNOME_MAE.Value := TCadastroA1_FilCli.Value;
//        QCadastroNOME_PAI.Value := TCadastroPAIPRO.Value;
//        QCadastroNOME_AUTORIZADO2.Value := TCadastroNOMPAC.Value;
//        QCadastroNOME_AUTORIZADO3.Value := TCadastroNOMMAC.Value;
        if TFornecedorA2_DtCad.Text <> '' then
          QCadastroDT_CADASTRO.Text := TFornecedorA2_DtCad.Text
        else
          QCadastroDT_CADASTRO.Value := Date;
        if wPais <> '' then
          QCadastroCOD_PAIS.Value := StrToInt(wPais);

        QCadastroCOD_ESTADO_CIVIL.Value := 6;

//        QCadastroDESC_OBS.Value :=  TCadastroA1_PontoRe.Value;
//        QCadastroDESC_OBS1.Value :=  TCadastroOBSER2.Value;
//        QCadastroVAL_LIMITE.Value := TCadastroA1_LIMITE.Value;
//        QCadastroDESC_CPF_CONJUGE.Value := LimpaNumero(TCadastroA1_CpfConj.Value);
//        QCadastroNOME_CONJUGE.Value := TCadastroA1_NomCon.Value;
//        QCadastroDT_NASCIMENTO_CONJUGE.Value := TCadastroA1_DtNasCo.Value;
//        QCadastroDESC_EMPRESA_CONJUGE.Value := TCadastroENDCOM.Value;
//        If TCadastroCATEGO.Value = 5 Then
//           QCadastroCOD_REGIAO.Value := 2
//        Else
        QCadastroCOD_REGIAO.Value := 1;

//        QCadastroDESC_FAX.Value := LimpaNumero(TCadastroA1_FAXCli.Value);
//        If  (TCadastroIDCLASS.Value > 0) and (TCadastroIDCLASS.Value < 3) Then
//            QCadastroCOD_CLASS_CADASTRO.Value :=  TCadastroIDCLASS.Value
//        Else
        QCadastroCOD_CLASS_CADASTRO.Value := 1;
        QCadastroIND_SEXO_CATEGORIA.Value := 'J';
        QCadastroNUM_CAIXA_POSTAL.Text :=  TFornecedorA2_CxPost.Text;
        QCadastroDESC_FANTASIA.Value := TFornecedorA2_Fantasi.Value;
        // QCadastroDT_CANCELAMENTO.Text :=  TCadastroDTDESLIGA.Text;
//         QCadastroPERC_FUNRURAL.Value :=  TCadastroFUNRURAL.Value;
        QCadastroCOD_RAMO.Value := 2;
//        If TCadastroCDVENDED.Value = 0 then
//          QCadastroCOD_VENDEDOR.Value := 1
//        Else
//          QCadastroCOD_VENDEDOR.Value :=  Trunc(TCadastroCDVENDED.Value);
//        QCadastroDESC_ESTADO_COBRANCA.Value :=  TCadastroC_UFCOB.Value;
//       QCadastroDESC_CIDADE_COBRANCA.Value :=  TCadastroC_CIDCOB.Value;
//        QCadastroDESC_ENDERECO_COBRANCA.Value :=  TCadastroC_ENDCOB.Value;
//        QCadastroDESC_CEP_COBRANCA.Value :=  TCadastroC_CEPCOB.Text;
//        If (TCadastroIDTIPCLIE.Value = 1) then
//          QCadastroCOD_TIPO_CADASTRO.Value := 1;
//       Else
        QCadastroCOD_TIPO_CADASTRO.Value := 2;

        //
//        QCadastroDESC_CELULAR.Text := LimpaNumero(TCadastroA1_FonCel.Text);
        QCadastroNOME_CONTATO.Value := TFornecedorA2_Contato.Value;
        //QCadastroDESC_TELEFONE_COMERCIAL.Value :=
        //QCadastroNUM_JUNTA.Value :=
        //QCadastroDT_FUNDACAO.Text :=
        //QCadastroDT_JUNTA.Text :=
        //QCadastroDESC_NATURALIDADE.Value :=
        //QCadastroDESC_ESTADO_NATURAL.Value :=
        //QCadastroDT_EXPEDICAO_IDENTIDADE.Text :=
        QCadastroDESC_E_MAIL.Value := TFornecedorA2_EMail.Text;
        //QCadastroDESC_FAX_COBRANCA.Value :=

        QCadastroIND_SEPROC_SIMNAO.Value := 'N';

        //QCadastroDESC_INSCRICAO_MUNICIPAL.Value :=
        //QCadastroDESC_CPF_CONJUGE.Value :=
        //QCadastroDESC_IDENTIDADE_CONJUGE.Value :=
        //QCadastroCOD_BANCO_AGENCIA.Value :=
        //QCadastroCOD_OPERACAO_CC.Value :=
        QCadastro.Post;
      except
//        Memo1.Lines.Add(TCadastrocodCLI.Text + ' não Importado - ');
        if QCadastro.State = dsInsert then
          QCadastro.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TFornecedor.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn3Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
  wCab: string;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TCP_Mov.Open;
    QCP_Mov.Open;
    TCP_Mov.First;
    PB.Max := TCP_Mov.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TCP_Mov.Eof do
    begin
      if TCP_MovCDCODCLI.Value = 0 then
      begin
        TCP_Mov.Next;
        Continue;
      end;

      try
        wCab := DMOracle.BuscaNome('SELECT COD_CONTA_PAGAR_CAB FROM TB_CONTA_PAGAR_CAB',
          'COD_CADASTRO = ' + FloatToStr(TCP_MovCDCODCLI.Value)
          + ' AND NUM_TITULO = ' + FloatToStr(TCP_MovNRTITULO.Value)
          + ' AND NUM_PARCELA = ' + FloatToStr(TCP_MovNRPARC.Value)
          + ' AND DESC_TIPO_DOCUMENTO = ' + #39 + TCP_MovIDDOCUMENT.Value + #39);
        if wCab <> '' then
        begin
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
          case TCP_MovIDCODOPER.Value of
            1: QCP_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
            50: QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
            51: QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. JUROS';
            52: QCP_MovIND_TIPO_MOVIMENTO.Value := 'DESCONTO';
          end;
          QCP_MovDT_USUARIO.Value := date;
          QCP_MovCOD_USUARIO.Value := 1;
          ///QCPMovastroCOD_CPMovASTRO.Value := TCPMovastroCODCLI.Value;
          QCP_Mov.Post;
        end;
      except
        if QCP_Mov.State = dsInsert then
          QCP_Mov.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TCP_Mov.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn1Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TTB_Grupo.Open;
    QTB_Grupo.Open;
    TTB_Grupo.First;
    PB.Max := TTB_Grupo.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
//    DMOracle.DBCEmapa.StartTransaction;
    while not TTB_Grupo.Eof do
    begin
//      Try
      QTB_Grupo.Insert;
      QTB_GrupoCOD_CLASSE.Value := DmOracle.Sequencia('CLASSE');
      QTB_GrupoDESC_CLASSE.Value := TTB_GrupoBM_DescGru.Value;
      QTB_GrupoPERC_COMISSAO1.Value := 0;
      QTB_GrupoPERC_COMISSAO2.Value := 0;
      QTB_GrupoNUM_CLASSE.Value := 1;
      QTB_GrupoNUM_SUBCLASSE.Value := StrToInt(TTB_GrupoBM_Grupo.Value);
      QTB_Grupo.Post;
      Inc(wCont);
      PB.Position := wCont;
//        Inc(wRegNaoImp);
      TTB_Grupo.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCemapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn4Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
  wCod_Produto: string;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  with DMImportaDados do
  begin
    TProduto.Open;
    QEstoque.Open;
    DMOracle.DBCemapa.StartTransaction;
    TProduto.First;
    PB.Max := TProduto.RecordCount;
    wCont := 0;
    while not TProduto.Eof do
    begin
      try
        QEstoque.Insert;
        QEstoqueCOD_LOTE_TIPO.Value := 1;
        QEstoqueCOD_FILIAL.Value := 1;
//          wCod_Produto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+Chr(39) + TProdutoCDMERCAD.Text+Chr(39));
//          QEstoqueCOD_PRODUTO.Value := StrToInt(wCod_Produto);
        QEstoqueCOD_PRODUTO.Value := StrToInt(TProdutoB1_CODPRO.Value);
        QEstoqueVL_CUSTO_MEDIO.Value := TProdutoB1_PrCusto.Value;
//          QEstoqueVL_ULTIMO_CUSTO.Value := TProdutoVLCUSTMED.Value;
//          QEstoqueVL_CUSTO_DOLAR.Value := TProdutoVLCUSTMED.Value / 1.95;
        QEstoqueQT_QUANTIDADE.Value := TProdutoB1_Saldo.Value;
//          QEstoqueDT_COMPRA.Text := TProdutoDTCOMPRA.Text;
//          QEstoqueDT_VENDA.Text := TProdutoDTVENDA.Text;
//          QEstoqueQT_COMPRA.Value := TProdutoQTULTCOMPR.Value;
//          QEstoqueQT_MINIMO.Value := 0;
//          QEstoqueQT_MAXIMO.Value := 0;
//          QEstoqueQT_INVENTARIO.Value := 0;
//          QEstoqueDT_INVENTARIO.Text := 0;


        QEstoque.Post;
      except
        if QEstoque.State = dsInsert then
          QEstoque.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TProduto.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn7Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
  wCodigo, wConta: string;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TLanctoContabil.Open;
    QLanctoContabil.Open;
    TLanctoContabil.First;
    PB.Max := TLanctoContabil.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TLanctoContabil.Eof do
    begin
      try
        wConta := Copy(TLanctoContabilCDCONTA.Value, 1, 9) + '0' + Copy(TLanctoContabilCDCONTA.Value, 10, 5);
        wCodigo := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA', 'NUM_PLANO_CONTA = ' + CHR(39) + wConta + CHR(39));
        if wCodigo <> '' then
        begin
          QLanctoContabil.Insert;
          QLanctoContabilCOD_LANCTO_CONTABIL.Value := DMOracle.Sequencia('LANCTO_CONTABIL');
          QLanctoContabilCOD_FILIAL.Value := TLanctoContabilCDEMPRESA.Value;
          QLanctoContabilCOD_PLANILHA.Value := TLanctoContabilNRLOTE.Value;
          QLanctoContabilDT_LANCAMENTO.Value := StrToDate(COPY(DateToStr(TLanctoContabilDTLANCTO.Value), 1, 6) + '2005');
          QLanctoContabilCOD_PLANO_CONTA.Value := StrToInt(wCodigo);
          QLanctoContabilNUM_LANCAMENTO.Value := Trunc(TLanctoContabilNRLANCTO.Value);
          QLanctoContabilCOD_HISTORICO_CONTABIL.Value := TLanctoContabilCDCODHIS.Value;
          QLanctoContabilDESC_COMPLEMENTO.Value := Trim(TLanctoContabilNOCOMPL1.Text) + ' Nr. Doc.:' + TLanctoContabilNRDOCUMEN.Text;
          if TLanctoContabilCDOPERC.Value = 2 then
          begin
            QLanctoContabilVAL_LANCAMENTO.Value := TLanctoContabilVLLANCTO.Value * (-1);
            QLanctoContabilIND_OPERACAO.Text := 'C';
          end
          else
          begin
            QLanctoContabilVAL_LANCAMENTO.Value := TLanctoContabilVLLANCTO.Value;
            QLanctoContabilIND_OPERACAO.Text := 'D';
          end;
          QLanctoContabilNUM_CONTRAPARTIDA.Value := Copy(TLanctoContabilCONTRA.Value, 1, 9) + '0' + Copy(TLanctoContabilCONTRA.Value, 10, 5);
          QLanctoContabilIND_ATUALIZA_SALDo.Value := 'NAO';
          QLanctoContabil.Post;
        end;
      except
        if QLanctoContabil.State = dsInsert then
          QLanctoContabil.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TLanctoContabil.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.BtnExportaLctoContabilClick(Sender: TObject);
var S: string;
  F: TextFile;
  mContador: integer;
begin
 // Grava dados Query dentro do arquivo DBF

  mContador := 0; // Inicializa valor da variavel.

  if (Trim(MEDtLancamentoI.Text) = '') or
    (Trim(MEDtLancamentoF.Text) = '') then
    raise exception.Create('Deve ser informado periodo de lançamento!');

  with DMImportaDados do
  begin
    QLctoContabilExporta.Close;
    if Trim(EdFilial.Text) = '' then
      QLctoContabilExporta.SetVariable('COD_FILIAL', Null)
    else
      QLctoContabilExporta.SetVariable('COD_FILIAL', EdFilial.Text);

    QLctoContabilExporta.SetVariable('DT_LANCAMENTO_I', MEDtLancamentoI.Text);
    QLctoContabilExporta.SetVariable('DT_LANCAMENTO_F', MEDtLancamentoF.Text);

    QLctoContabilExporta.open;
    Edit2.Clear;
    Edit2.Text := IntToStr(QLctoContabilExporta.RecordCount) + ' registro(s) para exportar!';
    Edit2.Refresh;
    QLctoContabilExporta.First;
    BtnExportar.Enabled := False;

    S := ''; // Inicializa valor da variavel.
    while not QLctoContabilExporta.Eof do
    begin
      S := S + Bib.FormataTexto(QLctoContabilExportaCOD_FILIAL.Text, 6) +
        Bib.FormataTexto(QLctoContabilExportaCOD_HISTORICO_CONTABIL.Text, 6) +
        Bib.FormataTexto(QLctoContabilExportaCOD_PLANO_CONTA.Text, 6) +
        QLctoContabilExportaDT_LANCAMENTO.Text +
        Bib.FormataTexto(QLctoContabilExportaNUM_LANCAMENTO.Text, 6) +
        Bib.FormataTexto(QLctoContabilExportaDESC_COMPLEMENTO.Text, 40) +
        Bib.FormataTexto(QLctoContabilExportaVAL_LANCAMENTO.Text, 11) +
        Bib.FormataTexto(QLctoContabilExportaIND_OPERACAO.Text, 1) +
        Bib.FormataTexto(QLctoContabilExportaNUM_CONTRAPARTIDA.Text, 15) +
        Bib.FormataTexto(QLctoContabilExportaIND_ATUALIZA_SALDO.Text, 3) +
        Bib.FormataTexto(QLctoContabilExportaCOD_FILIAL_CONTRAPARTIDA.Text, 6);
      if Trim(QLctoContabilExportaCOD_PLANILHA.Text) = '' then
        S := S + Bib.FormataTexto(QLctoContabilExportaCOD_GENERICO.Text, 6)
      else
        S := S + Bib.FormataTexto(QLctoContabilExportaCOD_PLANILHA.Text, 6);

      if Trim(QLctoContabilExportaCOD_GENERICO.Text) = '' then
        S := S + Bib.FormataTexto(QLctoContabilExportaCOD_PLANILHA.Text, 6)
      else
        S := S + Bib.FormataTexto(QLctoContabilExportaCOD_GENERICO.Text, 6);

      S := S + Chr(13) + Chr(10);
      mContador := mContador + 1;
      MEImp.Text := IntToStr(mContador);
      MEImp.Refresh;

      QLctoContabilExporta.Next;

    end;

    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  end;

end;

procedure TFImportaDados.BtnImportarLctoContabilClick(Sender: TObject);
var mDuplicidade, S: string;
  F: TextFile;
  mContador: integer;
begin
  S := ''; // Inicializa valor da variavel.
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QLctoContabilImporta.Close;
      QLctoContabilImporta.Open;
      BtnImportarLctoContabil.Enabled := False;
      mContador := 0;
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
          if Trim(Copy(S, 01, 06)) <> '' then
            QLctoContabilImportaCOD_FILIAL.Value := StrToInt(Trim(Copy(S, 01, 06)));
          if Trim(Copy(S, 07, 06)) <> '' then
            QLctoContabilImportaCOD_HISTORICO_CONTABIL.Value := StrToInt(Trim(Copy(S, 07, 06)));
          if Trim(Copy(S, 13, 06)) <> '' then
            QLctoContabilImportaCOD_PLANO_CONTA.Value := StrToInt(Trim(Copy(S, 13, 06)));
          QLctoContabilImportaDT_LANCAMENTO.Value := StrToDate(Copy(S, 19, 10));
          if Trim(Copy(S, 29, 06)) <> '' then
            QLctoContabilImportaNUM_LANCAMENTO.Value := StrToInt(Trim(Copy(S, 29, 06)));
          if Trim(Copy(S, 35, 40)) <> '' then
            QLctoContabilImportaDESC_COMPLEMENTO.Value := Trim(Copy(S, 35, 40));
          if Trim(Copy(S, 75, 11)) <> '' then
            QLctoContabilImportaVAL_LANCAMENTO.Value := StrToFloat(Trim(Copy(S, 75, 11)));
          if Trim(Copy(S, 86, 01)) <> '' then
            QLctoContabilImportaIND_OPERACAO.Value := Trim(Copy(S, 86, 01));
          if Trim(Copy(S, 87, 15)) <> '' then
            QLctoContabilImportaNUM_CONTRAPARTIDA.Value := Trim(Copy(S, 87, 15));
          if Trim(Copy(S, 102, 03)) <> '' then
            QLctoContabilImportaIND_ATUALIZA_SALDO.Value := Trim(Copy(S, 102, 03));
          if Trim(Copy(S, 105, 06)) <> '' then
            QLctoContabilImportaCOD_FILIAL_CONTRAPARTIDA.Value := StrToInt(Trim(Copy(S, 105, 06)));
          if Trim(Copy(S, 111, 06)) <> '' then
            QLctoContabilImportaCOD_PLANILHA.Value := StrToInt(Trim(Copy(S, 111, 06)));
          if Trim(Copy(S, 117, 06)) <> '' then
            QLctoContabilImportaCOD_GENERICO.Value := StrToInt(Trim(Copy(S, 117, 06)));
          QLctoContabilImporta.Post;
          mContador := mContador + 1;
          MEImp.Text := IntToStr(mContador);
          MEImp.Refresh;
          Readln(F, S); {Le a linha do arquivo texto}
        end;
      end; // fim do while
      BtnImportarLctoContabil.Enabled := True;
    end;
  end;
end;

procedure TFImportaDados.BitBtn12Click(Sender: TObject);
var S: string;
  F: TextFile;
  mContador: integer;
begin
   // Grava dados Query dentro do arquivo

  mContador := 0; // Inicializa valor da variavel de contagem.

  if (Trim(MEDT_Recebimento_I.Text) = '') or
    (Trim(MEDT_Recebimento_F.Text) = '') then
    raise exception.Create('Deve ser informado periodo de lançamento!');

  with DMImportaDados do
  begin
    QNotaExporta.Close;
    if Trim(EdFilial.Text) = '' then
      QNotaExporta.SetVariable('COD_FILIAL', Null)
    else
      QNotaExporta.SetVariable('COD_FILIAL', EdFilial.Text);

    QNotaExporta.SetVariable('DT_RECEBIMENTO_I', MEDT_RECEBIMENTO_I.Text);
    QNotaExporta.SetVariable('DT_RECEBIMENTO_F', MEDT_RECEBIMENTO_F.Text);

    case RGCondicaoPag.ItemIndex of
      1: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO', 1);
      2: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO', 2);
      3: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO', 3);
      4: QNotaExporta.SetVariable('IND_CONDICAO_PAGTO', 4);
    else
      QNotaExporta.SetVariable('IND_CONDICAO_PAGTO', NULL);
    end;
    QNotaExporta.open;
    Edit1.Clear;
    Edit1.Text := IntToStr(QNotaExporta.RecordCount) + ' registro(s) para exportar!';
    Edit1.Refresh;
    QNotaExporta.First;
    BtnExportar.Enabled := False;

    S := ''; // Inicializa valor da variavel.
    while not QNotaExporta.Eof do
    begin
      S := S + Bib.FormataTexto(QNotaExportaCOD_NOTA_CAB.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_USUARIO.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_FILIAL.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_MENSAGEM.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_TRANSPORTE.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_OPERACAO.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_ESTADO.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_VENDEDOR.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_CADASTRO.Text, 6) +
        Bib.FormataTexto(QNotaExportaNUM_NOTA.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_SERIE.Text, 3) +
        Bib.FormataTexto(QNotaExportaIND_SITUACAO.Text, 3) +
        Bib.FormataTexto(QNotaExportaIND_CONDICAO_PAGTO.Text, 1) +
        Bib.FormataTexto(copy(QNotaExportaDT_EMISSAO.Text, 1, 10), 10) +
        Bib.FormataTexto(copy(QNotaExportaDT_MOVIMENTO.Text, 1, 10), 10) +
        '         ' +
        Bib.FormataTexto(copy(QNotaExportaDT_RECEBIMENTO.Text, 1, 10), 10) +
        Bib.FormataTexto(QNotaExportaCOD_MOTIVO_CANC.Text, 6) +
        Bib.FormataTexto(QNotaExportaVAL_DESPESAS.Text, 11) +
        Bib.FormataTexto(QNotaExportaIND_ENTRADA_SAIDA.Text, 3) +
        Bib.FormataTexto(QNotaExportaVAL_FRETE.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_DESCONTO.Text, 11) +
        Bib.FormataTexto(QNotaExportaCOD_TRANSPORTADOR.Text, 6) +
        Bib.FormataTexto(QNotaExportaNUM_CONHECIMENTO_FRETE.Text, 6) +
        Bib.FormataTexto(QNotaExportaVAL_AVISTA.Text, 11) +
        Bib.FormataTexto(QNotaExportaIND_TIPO_FRETE.Text, 3) +
        Bib.FormataTexto(QNotaExportaNUM_VOLUMES.Text, 6) +
        Bib.FormataTexto(QNotaExportaOBS.Text, 60) +
        Bib.FormataTexto(QNotaExportaOBS_COMPLEMENTO.Text, 60) +
        Bib.FormataTexto(copy(QNotaExportaDT_USUARIO.Text, 1, 10), 10) +
        '         ' +
        Bib.FormataTexto(QNotaExportaCOD_TRIBUTACAO_FRETE.Text, 6) +
        Bib.FormataTexto(QNotaExportaVAL_TOTAL_IPI.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_ICM_FRETE.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_ICM_BASE_FRETE.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_FUNRURAL.Text, 11) +
        Bib.FormataTexto(QNotaExportaDESC_PLACA.Text, 8) +
        Bib.FormataTexto(QNotaExportaDESC_TRANSPORTADORA.Text, 50) +
        Bib.FormataTexto(QNotaExportaCOD_NOTA_CONTA_CORRENTE.Text, 6) +
        Bib.FormataTexto(copy(QNotaExportaDT_EMISSAO_CF.Text, 1, 10), 10) +
        '         ' +
        Bib.FormataTexto(QNotaExportaCOD_OPERACAO_CF.Text, 6) +
        Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE.Text, 3) +
        Bib.FormataTexto(QNotaExportaCOD_CONTRATO_MOV.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_CONTRATO_GP_MOV.Text, 6) +
        Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE1.Text, 3) +
        Bib.FormataTexto(QNotaExportaNR_DIAS_CHEQUE2.Text, 3) +
        Bib.FormataTexto(QNotaExportaIND_NOTA_SEGURO.Text, 3) +
        Bib.FormataTexto(QNotaExportaCOD_CONTRATO_VEND.Text, 6) +
        Bib.FormataTexto(QNotaExportaNR_ROTA.Text, 6) +
        Bib.FormataTexto(QNotaExportaPERC_COMISSAO.Text, 6) +
        Bib.FormataTexto(QNotaExportaIND_MILHAGEM.Text, 3) +
        Bib.FormataTexto(QNotaExportaNUM_OS.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_DEPARTAMENTO.Text, 6) +
        Bib.FormataTexto(QNotaExportaVAL_PEDAGIO.Text, 11) +
        Bib.FormataTexto(QNotaExportaCOD_NOTA_ITEM.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_NOTA_CAB_1.Text, 6) +
        Bib.FormataTexto(QNotaExportaCOD_TRIBUTACAO.Text, 6) +
        Bib.FormataTexto(QNotaExportaQT_QUANTIDADE.Text, 9) +
        Bib.FormataTexto(QNotaExportaVAL_TOTAL.Text, 11) +
        Bib.FormataTexto(QNotaExportaPERC_IPI.Text, 5) +
        Bib.FormataTexto(QNotaExportaPERC_COMISSAO.Text, 5) +
        Bib.FormataTexto(QNotaExportaCOD_PRODUTO.Text, 13) +
        Bib.FormataTexto(QNotaExportaCOD_LOTE_TIPO.Text, 6) +
        Bib.FormataTexto(QNotaExportaVAL_DESCONTO.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_DESPESAS.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_FRETE.Text, 11) +
        Bib.FormataTexto(QNotaExportaPERC_DESCONTO.Text, 5) +
        Bib.FormataTexto(QNotaExportaVAL_IPI.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_UNITARIO.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_ICM_BASE.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_ICM.Text, 11) +
        QNotaExportaIND_CLASS_IPI.Text +
        Bib.FormataTexto(QNotaExportaVAL_CUSTO.Text, 11) +
        Bib.FormataTexto(QNotaExportaVAL_ISS.Text, 11) +
        Bib.FormataTexto(QNotaExportaPERC_INSS.Text, 5) +
        Bib.FormataTexto(QNotaExportaPERC_BENEFICIADO.Text, 5) +
        Bib.FormataTexto(QNotaExportaIND_BX_CONTR_VEND.Text, 1) +
        Bib.FormataTexto(QNotaExportaNUM_NOTA_PRODUTOR.Text, 6);
      S := S + Chr(13) + Chr(10);
      mContador := mContador + 1;
      MEImp.Text := IntToStr(mContador);
      MEImp.Refresh;

      QNotaExporta.Next;
    end;

    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  end;
end;

procedure TFImportaDados.BitBtn11Click(Sender: TObject);
var S, cod_nota_cab: string;
  F: TextFile;
  mContador: integer;

begin
  cod_nota_cab := '0';
  S := ''; // Inicializa valor da variavel.
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QNotaCabImporta.Close;
      QNotaItemImporta.Close;
      QNotaCabImporta.Open;
      QNotaItemImporta.Open;
      BtnImportarLctoContabil.Enabled := False;
      mContador := 0;
      try
        dmoracle.DBCemapa.startTransaction;
        while Trim(S) <> '' do
        begin
          if cod_nota_cab <> Trim(Copy(S, 01, 06)) then //-----compara se a nota_cab já foi gravada
          begin
            QNotaCabImporta.Insert;
            QNotaItemImporta.Insert;
            if Trim(Copy(S, 07, 06)) <> '' then
              QNotaCabImportaCOD_USUARIO.Value := StrToInt(Trim(Copy(S, 07, 06)));
            if Trim(Copy(S, 13, 06)) <> '' then
              if DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_FILIAL >= 1') = 'ENCOPEL' then
                QNotaCabImportaCOD_FILIAL.Value := 2
              else
                QNotaCabImportaCOD_FILIAL.Value := StrToInt(Trim(Copy(S, 13, 06)));
            if Trim(Copy(S, 19, 06)) <> '' then
              QNotaCabImportaCOD_MENSAGEM.Value := StrToInt(Trim(Copy(S, 19, 06)));
            if Trim(Copy(S, 25, 06)) <> '' then
              QNotaCabImportaCOD_TRANSPORTE.Value := StrToInt(Trim(Copy(S, 25, 06)));
            if Trim(Copy(S, 31, 06)) <> '' then
              QNotaCabImportaCOD_OPERACAO.Value := StrToInt(Trim(Copy(S, 31, 06)));
            if Trim(Copy(S, 37, 02)) <> '' then
              QNotaCabImportaCOD_ESTADO.Value := Trim(Copy(S, 37, 02));
            if Trim(Copy(S, 43, 06)) <> '' then
              QNotaCabImportaCOD_VENDEDOR.Value := StrToInt(Trim(Copy(S, 43, 06)));
            if Trim(Copy(S, 49, 06)) <> '' then
              QNotaCabImportaCOD_CADASTRO.Text := Trim(Copy(S, 49, 06));
            if Trim(Copy(S, 55, 06)) <> '' then
              QNotaCabImportaNUM_NOTA.Value := StrToInt(Trim(Copy(S, 55, 06)));
            if Trim(Copy(S, 61, 03)) <> '' then
              QNotaCabImportaCOD_SERIE.Value := Trim(Copy(S, 61, 03));
            if Trim(Copy(S, 64, 03)) <> '' then
              QNotaCabImportaIND_SITUACAO.Value := Trim(Copy(S, 64, 03));
            if Trim(Copy(S, 67, 01)) <> '' then
              QNotaCabImportaIND_CONDICAO_PAGTO.Value := Trim(Copy(S, 67, 01));
            if Trim(Copy(S, 68, 10)) <> '' then
              QNotaCabImportaDT_EMISSAO.Value := StrToDate(Trim(Copy(S, 68, 10)));
            if Trim(Copy(S, 78, 10)) <> '' then
              QNotaCabImportaDT_MOVIMENTO.Value := StrToDate(Trim(Copy(S, 78, 10)));
            if Trim(Copy(S, 97, 10)) <> '' then
              QNotaCabImportaDT_RECEBIMENTO.Value := StrToDate(Trim(Copy(S, 97, 10)));
            if Trim(Copy(S, 107, 06)) <> '' then
              QNotaCabImportaCOD_MOTIVO_CANC.Value := StrToInt(Trim(Copy(S, 107, 06)));
            if Trim(Copy(S, 113, 11)) <> '' then
              QNotaCabImportaVAL_DESPESAS.Value := StrToFloat(Trim(Copy(S, 113, 11)));
            if Trim(Copy(S, 124, 01)) <> '' then
              QNotaCabImportaIND_ENTRADA_SAIDA.Value := Trim(Copy(S, 124, 01));
            if Trim(Copy(S, 127, 11)) <> '' then
              QNotaCabImportaVAL_FRETE.Value := StrToFloat(Trim(Copy(S, 127, 11)));
            if Trim(Copy(S, 138, 11)) <> '' then
              QNotaCabImportaVAL_DESCONTO.Value := StrToFloat(Trim(Copy(S, 138, 11)));
            if Trim(Copy(S, 149, 11)) <> '' then
              QNotaCabImportaCOD_TRANSPORTADOR.Value := StrToInt(Trim(Copy(S, 149, 11)));
            if Trim(Copy(S, 155, 06)) <> '' then
              QNotaCabImportaNUM_CONHECIMENTO_FRETE.Value := StrToInt(Trim(Copy(S, 155, 06)));
            if Trim(Copy(S, 161, 11)) <> '' then
              QNotaCabImportaVAL_AVISTA.Value := StrToFloat(Trim(Copy(S, 161, 11)));
            if Trim(Copy(S, 172, 03)) <> '' then
              QNotaCabImportaIND_TIPO_FRETE.Value := Trim(Copy(S, 172, 03));
            if Trim(Copy(S, 175, 06)) <> '' then
              QNotaCabImportaNUM_VOLUMES.Value := StrToInt(Trim(Copy(S, 175, 06)));
            if Trim(Copy(S, 181, 60)) <> '' then
              QNotaCabImportaOBS.Value := Trim(Copy(S, 181, 60));
            if Trim(Copy(S, 241, 60)) <> '' then
              QNotaCabImportaOBS_COMPLEMENTO.Value := Trim(Copy(S, 241, 60));
            if Trim(Copy(S, 301, 10)) <> '' then
              QNotaCabImportaDT_USUARIO.Value := StrToDate(Trim(Copy(S, 301, 10)));
            if Trim(Copy(S, 320, 06)) <> '' then
              QNotaCabImportaCOD_TRIBUTACAO_FRETE.Value := StrToInt(Trim(Copy(S, 320, 06)));
            if Trim(Copy(S, 326, 11)) <> '' then
              QNotaCabImportaVAL_TOTAL_IPI.Value := StrToFloat(Trim(Copy(S, 326, 11)));
            if Trim(Copy(S, 337, 11)) <> '' then
              QNotaCabImportaVAL_ICM_FRETE.Value := StrToFloat(Trim(Copy(S, 337, 11)));
            if Trim(Copy(S, 348, 11)) <> '' then
              QNotaCabImportaVAL_ICM_BASE_FRETE.Value := StrToFloat(Trim(Copy(S, 348, 11)));
            if Trim(Copy(S, 359, 11)) <> '' then
              QNotaCabImportaVAL_FUNRURAL.Value := StrToFloat(Trim(Copy(S, 359, 11)));
            if Trim(Copy(S, 370, 08)) <> '' then
              QNotaCabImportaDESC_PLACA.Value := Trim(Copy(S, 370, 08));
            if Trim(Copy(S, 378, 50)) <> '' then
              QNotaCabImportaDESC_TRANSPORTADORA.Value := Trim(Copy(S, 378, 50));
            if Trim(Copy(S, 428, 06)) <> '' then
              QNotaCabImportaCOD_NOTA_CONTA_CORRENTE.Value := StrToInt(Trim(Copy(S, 428, 06)));
            if Trim(Copy(S, 434, 19)) <> '' then
              QNotaCabImportaDT_EMISSAO_CF.Value := StrToDate(Trim(Copy(S, 434, 19)));
            if Trim(Copy(S, 453, 06)) <> '' then
              QNotaCabImportaCOD_OPERACAO_CF.Value := StrToInt(Trim(Copy(S, 453, 06)));
            if Trim(Copy(S, 459, 03)) <> '' then
              QNotaCabImportaNR_DIAS_CHEQUE.Value := StrToInt(Trim(Copy(S, 459, 03)));
            if Trim(Copy(S, 462, 06)) <> '' then
              QNotaCabImportaCOD_CONTRATO_MOV.Value := StrToInt(Trim(Copy(S, 462, 06)));
            if Trim(Copy(S, 468, 06)) <> '' then
              QNotaCabImportaCOD_CONTRATO_GP_MOV.Value := StrToInt(Trim(Copy(S, 468, 06)));
            if Trim(Copy(S, 474, 03)) <> '' then
              QNotaCabImportaNR_DIAS_CHEQUE1.Value := StrToInt(Trim(Copy(S, 474, 03)));
            if Trim(Copy(S, 477, 03)) <> '' then
              QNotaCabImportaNR_DIAS_CHEQUE2.Value := StrToInt(Trim(Copy(S, 477, 03)));
            if Trim(Copy(S, 480, 03)) <> '' then
              QNotaCabImportaIND_NOTA_SEGURO.Value := Trim(Copy(S, 480, 03));
            if Trim(Copy(S, 483, 06)) <> '' then
              QNotaCabImportaCOD_CONTRATO_VEND.Value := StrToInt(Trim(Copy(S, 483, 06)));
            if Trim(Copy(S, 489, 06)) <> '' then
              QNotaCabImportaNR_ROTA.Value := StrToInt(Trim(Copy(S, 489, 06)));
            if Trim(Copy(S, 495, 06)) <> '' then
              QNotaCabImportaPERC_COMISSAO.Value := StrToFloat(Trim(Copy(S, 495, 06)));
            if Trim(Copy(S, 501, 03)) <> '' then
              QNotaCabImportaIND_MILHAGEM.Value := Trim(Copy(S, 501, 03));
            if Trim(Copy(S, 504, 06)) <> '' then
              QNotaCabImportaNUM_OS.Value := StrToInt(Trim(Copy(S, 504, 06)));
            if Trim(Copy(S, 510, 06)) <> '' then
              QNotaCabImportaCOD_DEPARTAMENTO.Value := StrToInt(Trim(Copy(S, 510, 06)));
            if Trim(Copy(S, 516, 11)) <> '' then
              QNotaCabImportaVAL_PEDAGIO.Value := StrToFloat(Trim(Copy(S, 516, 11)));

          //----------------inicio da gravacao da tabela tb_nota_item

            if Trim(Copy(S, 533, 06)) <> '' then
              QNotaItemImportaCOD_NOTA_CAB.Value := QNotaCabImportaCOD_NOTA_CAB.Value;
            if Trim(Copy(S, 539, 06)) <> '' then
              QNotaItemImportaCOD_TRIBUTACAO.Value := StrToInt(Trim(Copy(S, 539, 06)));
            if Trim(Copy(S, 545, 09)) <> '' then
              QNotaItemImportaQT_QUANTIDADE.Value := StrToFloat(Trim(Copy(S, 545, 09)));
            if Trim(Copy(S, 554, 11)) <> '' then
              QNotaItemImportaVAL_TOTAL.Value := StrToFloat(Trim(Copy(S, 554, 11)));
            if Trim(Copy(S, 565, 05)) <> '' then
              QNotaItemImportaPERC_IPI.Value := StrToFloat(Trim(Copy(S, 565, 05)));
            if Trim(Copy(S, 570, 05)) <> '' then
              QNotaItemImportaPERC_COMISSAO.Value := StrToFloat(Trim(Copy(S, 570, 05)));
            if Trim(Copy(S, 575, 13)) <> '' then
              QNotaItemImportaCOD_PRODUTO.Value := StrToFloat(Trim(Copy(S, 575, 13)));
            if Trim(Copy(S, 588, 06)) <> '' then
              QNotaItemImportaCOD_LOTE_TIPO.Value := StrToInt(Trim(Copy(S, 588, 06)));
            if Trim(Copy(S, 594, 11)) <> '' then
              QNotaItemImportaVAL_DESCONTO.Value := StrToFloat(Trim(Copy(S, 594, 11)));
            if Trim(Copy(S, 605, 11)) <> '' then
              QNotaItemImportaVAL_DESPESAS.Value := StrToFloat(Trim(Copy(S, 605, 11)));
            if Trim(Copy(S, 616, 11)) <> '' then
              QNotaItemImportaVAL_FRETE.Value := StrToFloat(Trim(Copy(S, 616, 11)));
            if Trim(Copy(S, 627, 05)) <> '' then
              QNotaItemImportaPERC_DESCONTO.Value := StrToFloat(Trim(Copy(S, 627, 05)));
            if Trim(Copy(S, 632, 11)) <> '' then
              QNotaItemImportaVAL_IPI.Value := StrToFloat(Trim(Copy(S, 632, 11)));
            if Trim(Copy(S, 643, 11)) <> '' then
              QNotaItemImportaVAL_UNITARIO.Value := StrToFloat(Trim(Copy(S, 643, 11)));
            if Trim(Copy(S, 654, 11)) <> '' then
              QNotaItemImportaVAL_ICM_BASE.Value := StrToFloat(Trim(Copy(S, 654, 11)));
            if Trim(Copy(S, 665, 11)) <> '' then
              QNotaItemImportaVAL_ICM.Value := StrToFloat(Trim(Copy(S, 665, 11)));
            if Trim(Copy(S, 676, 01)) <> '' then
              QNotaItemImportaIND_CLASS_IPI.Value := Trim(Copy(S, 676, 01));
            if Trim(Copy(S, 677, 11)) <> '' then
              QNotaItemImportaVAL_CUSTO.Value := 0;
            // StrToFloat(Trim(Copy(S,677,11)));
            if Trim(Copy(S, 688, 11)) <> '' then
              QNotaItemImportaVAL_ISS.Value := 0;
             //StrToFloat(Trim(Copy(S,688,11)));
            if Trim(Copy(S, 699, 05)) <> '' then
              QNotaItemImportaPERC_INSS.Value := 0;
             //StrToFloat(Trim(Copy(S,699,05)));
            if Trim(Copy(S, 704, 05)) <> '' then
              QNotaItemImportaPERC_BENEFICIADO.Value := StrToFloat(Trim(Copy(S, 704, 05)));
            if Trim(Copy(S, 709, 01)) <> '' then
              QNotaItemImportaIND_BX_CONTR_VEND.Value := Trim(Copy(S, 709, 01));
            if Trim(Copy(S, 710, 06)) <> '' then
              QNotaItemImportaNUM_NOTA_PRODUTOR.Value := StrToInt(Trim(Copy(S, 710, 06)));
            QNotaCabImporta.Post;
            QNotaItemImporta.Post;
          end
          else
          begin

            QNotaItemImporta.Insert;
            if Trim(Copy(S, 533, 06)) <> '' then
              QNotaItemImportaCOD_NOTA_CAB.Value := QNotaCabImportaCOD_NOTA_CAB.Value;
            if Trim(Copy(S, 539, 06)) <> '' then
              QNotaItemImportaCOD_TRIBUTACAO.Value := StrToInt(Trim(Copy(S, 539, 06)));
            if Trim(Copy(S, 545, 09)) <> '' then
              QNotaItemImportaQT_QUANTIDADE.Value := StrToFloat(Trim(Copy(S, 545, 09)));
            if Trim(Copy(S, 554, 11)) <> '' then
              QNotaItemImportaVAL_TOTAL.Value := StrToFloat(Trim(Copy(S, 554, 11)));
            if Trim(Copy(S, 565, 05)) <> '' then
              QNotaItemImportaPERC_IPI.Value := StrToFloat(Trim(Copy(S, 565, 05)));
            if Trim(Copy(S, 570, 05)) <> '' then
              QNotaItemImportaPERC_COMISSAO.Value := StrToFloat(Trim(Copy(S, 570, 05)));
            if Trim(Copy(S, 575, 13)) <> '' then
              QNotaItemImportaCOD_PRODUTO.Value := StrToFloat(Trim(Copy(S, 575, 13)));
            if Trim(Copy(S, 588, 06)) <> '' then
              QNotaItemImportaCOD_LOTE_TIPO.Value := StrToInt(Trim(Copy(S, 588, 06)));
            if Trim(Copy(S, 594, 11)) <> '' then
              QNotaItemImportaVAL_DESCONTO.Value := StrToFloat(Trim(Copy(S, 594, 11)));
            if Trim(Copy(S, 605, 11)) <> '' then
              QNotaItemImportaVAL_DESPESAS.Value := StrToFloat(Trim(Copy(S, 605, 11)));
            if Trim(Copy(S, 616, 11)) <> '' then
              QNotaItemImportaVAL_FRETE.Value := StrToFloat(Trim(Copy(S, 616, 11)));
            if Trim(Copy(S, 627, 05)) <> '' then
              QNotaItemImportaPERC_DESCONTO.Value := StrToFloat(Trim(Copy(S, 627, 05)));
            if Trim(Copy(S, 632, 11)) <> '' then
              QNotaItemImportaVAL_IPI.Value := StrToFloat(Trim(Copy(S, 632, 11)));
            if Trim(Copy(S, 643, 11)) <> '' then
              QNotaItemImportaVAL_UNITARIO.Value := StrToFloat(Trim(Copy(S, 643, 11)));
            if Trim(Copy(S, 654, 11)) <> '' then
              QNotaItemImportaVAL_ICM_BASE.Value := StrToFloat(Trim(Copy(S, 654, 11)));
            if Trim(Copy(S, 665, 11)) <> '' then
              QNotaItemImportaVAL_ICM.Value := StrToFloat(Trim(Copy(S, 665, 11)));
            if Trim(Copy(S, 676, 01)) <> '' then
              QNotaItemImportaIND_CLASS_IPI.Value := Trim(Copy(S, 676, 01));
            if Trim(Copy(S, 667, 11)) <> '' then
              QNotaItemImportaVAL_CUSTO.Value := 0;
             //StrToFloat(Trim(Copy(S,667,11)));
            if Trim(Copy(S, 688, 11)) <> '' then
              QNotaItemImportaVAL_ISS.Value := 0;
             // StrToFloat(Trim(Copy(S,688,11)));
            if Trim(Copy(S, 699, 05)) <> '' then
              QNotaItemImportaPERC_INSS.Value := 0;
             // StrToFloat(Trim(Copy(S,699,05)));
            if Trim(Copy(S, 704, 05)) <> '' then
              QNotaItemImportaPERC_BENEFICIADO.Value := StrToFloat(Trim(Copy(S, 704, 05)));
            if Trim(Copy(S, 709, 01)) <> '' then
              QNotaItemImportaIND_BX_CONTR_VEND.Value := Trim(Copy(S, 709, 01));
            if Trim(Copy(S, 800, 06)) <> '' then
              QNotaItemImportaNUM_NOTA_PRODUTOR.Value := StrToInt(Trim(Copy(S, 800, 06)));
            QNotaItemImporta.Post;
          end;
          cod_nota_cab := Trim(Copy(S, 01, 06)); //-----variavel recebe o cod_nota para pode comparar com o cod da proxima nota
          mContador := mContador + 1;
          MEImp.Text := IntToStr(mContador);
          MEImp.Refresh;
          Readln(F, S); {Le a linha do arquivo texto}
        end; // fim do while
        dmoracle.DBCemapa.commit;
        ShowMessage('Notas Importadas com Exito');
      except
        dmoracle.dbcemapa.rollback;
        ShowMessage('Erro no Arquivo de exportação, nenhuma NF foi Importada.');
      end;
    end;
    BtnImportarLctoContabil.Enabled := True;
  end;
end;

procedure TFImportaDados.BitBtn14Click(Sender: TObject);
var mContador: Integer;
  wComando: string;
begin
  mContador := 0;
  with DMConverte do
  begin
   // conversão contas a receber da AB //
    QContaReceber.Close;
    QContaReceber.Open;
    try
      DMoracle.DBCemapa.StartTransaction;
      while not (QContaReceber.Eof) do
      begin
        if QContaReceberCod_Cadastro_Novo.Text <> '' then
        begin
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET COD_CADASTRO=' + QContaReceberCod_Cadastro_Novo.Text;
            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' + FloatToStr(QContaReceberCod_Conta_Receber_Cab.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
        end;
        mContador := mContador + 1;
        MEImp.Text := IntToStr(mContador);
        MEImp.Refresh;
        QContaReceber.Next;
      end; // fim do while
      DMoracle.DBCemapa.Commit;
    except
      dmoracle.dbcemapa.rollback;
    end;

   // conversão contas a pagar da AB //
    mContador := 0;
    MEImp.Text := IntToStr(mContador);
    MEImp.Refresh;

    QContaPagar.Close;
    QContaPagar.Open;
    try
      DMoracle.DBCemapa.StartTransaction;
      while not (QContaPagar.Eof) do
      begin
        if QContaPagarCod_Cadastro_Novo.Text <> '' then
        begin
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_CONTA_PAGAR_CAB SET COD_CADASTRO=' + QContaPagarCod_Cadastro_Novo.Text;
            wComando := wComando + ' WHERE COD_CONTA_PAGAR_CAB = ' + FloatToStr(QContaPagarCod_Conta_Pagar_Cab.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
        end;
        mContador := mContador + 1;
        MEImp.Text := IntToStr(mContador);
        MEImp.Refresh;
        QContaPagar.Next;
      end; // fim do while
      DMoracle.DBCemapa.Commit;
    except
      dmoracle.dbcemapa.rollback;
    end;
  end;
end;

procedure TFImportaDados.BitBtn17Click(Sender: TObject);
var S: string;
  F: TextFile;
  mContador: integer;
begin
   // Grava dados Query dentro do arquivo

  mContador := 0; // Inicializa valor da variavel de contagem.

  with DMImportaDados do
  begin
    QExportaCadBloqueado.Close;
    QExportaCadBloqueado.SetVariable('COD_FILIAL', Trim(ME22Filial.Text));
    QExportaCadBloqueado.SetVariable('DT_Vencimento', ((Date) - (StrToInt(Trim(ME22Dias_Atraso.Text)))));
    QExportaCadBloqueado.open;
    QExportaCadBloqueado.First;
    BtnExportar.Enabled := False;

    S := ''; // Inicializa valor da variavel.
    while not QExportaCadBloqueado.Eof do
    begin
      if Trim(QExportaCadBloqueadoNUM_CGC_CPF.text) <> '' then
      begin
        S := S + Bib.FormataTexto(QExportaCadBloqueadoCOD_CADASTRO.Text, 6) +
          Bib.FormataTexto(QExportaCadBloqueadoNUM_CGC_CPF.Text, 18) +
          Bib.FormataTexto(QExportaCadBloqueadoNUM_INSCRICAO.Text, 20);
        S := S + Chr(13) + Chr(10);
        mContador := mContador + 1;
        MEImp.Text := IntToStr(mContador);
        MEImp.Refresh;
      end;
      QExportaCadBloqueado.Next;
    end;

    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  end;
end;

procedure TFImportaDados.BTImportaCadBloqueadoClick(Sender: TObject);
var S, wComando: string;
  F: TextFile;
  mContador: integer;

begin
  S := ''; // Inicializa valor da variavel.
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      DMOracle.QExecSQL.Close; //----- INICIA LIMPEZA DA TABELA
      DMOracle.QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CADASTRO_BLOQUEADO';
      DMOracle.QExecSQL.SQL.Add(wComando);
      DMOracle.QExecSQL.ExecSQL;

      QImportaCadBloqueado.Close;
      QImportaCadBloqueado.Open;
      BTImportaCadBloqueado.Enabled := False;
      mContador := 0;
      try
        dmoracle.DBCemapa.StartTransaction;
        while Trim(S) <> '' do
        begin
          QImportaCadBloqueado.Insert;
          if Trim(Copy(S, 01, 06)) <> '' then
            QImportaCadBloqueadoCod_Cadastro.value := StrToInt(Trim(Copy(S, 01, 06)));
          if Trim(Copy(S, 07, 24)) <> '' then
            QImportaCadBloqueadoNUM_CGC_CPF.Value := (Trim(Copy(S, 07, 24)));
          if Trim(Copy(S, 25, 44)) <> '' then
            QImportaCadBloqueadoNUM_INSCRICAO.Value := (Trim(Copy(S, 25, 44)));
          mContador := mContador + 1;
          MEImp.Text := IntToStr(mContador);
          MEImp.Refresh;
          Readln(F, S); {Le a linha do arquivo texto}
          QImportaCadBloqueado.Post;
        end; // fim do while
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
  S: string;
  F: TextFile;
  wContador: integer;
begin
  wContador := 0; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.
  with DMImportaDados do
  begin
    QExpCadCancelado.Open;
    QExpCadCancelado.First;
    while not QExpCadCancelado.Eof do
    begin
      if QExpCadCanceladoNUM_CGC_CPF.text <> '' then
      begin
        S := S + Bib.FormataTexto(QExpCadCanceladoCOD_CADASTRO.Text, 6) +
          Bib.FormataTexto(QExpCadCanceladoNUM_CGC_CPF.Text, 18) +
          Bib.FormataTexto(QExpCadCanceladoNUM_INSCRICAO.Text, 20);
        S := S + Chr(13) + Chr(10);
        Inc(wContador);
        LBContExportacao.Caption := IntToStr(wContador);
      end;
      QExpCadCancelado.Next;
    end;

    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    end
    else
      MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  end;
end;

procedure TFImportaDados.BTImportaCadastroCanceladoClick(Sender: TObject);
var
  wCgc, wCgc1, S, wComando: string;
  F: TextFile;
  wContador, I: integer;
begin
  S := ''; // Inicializa valor da variavel.
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a linha do arquivo texto}
    with DMOracle do
    begin
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
        wContador := 0;
        while Trim(S) <> '' do
        begin
          QImpCadCancelado.Insert;
          if Trim(Copy(S, 01, 06)) <> '' then
            QImpCadCanceladoCOD_CADASTRO.Value := StrToInt(Trim(Copy(S, 01, 06)));
          if Trim(Copy(S, 07, 24)) <> '' then
          begin
            wCgc1 := '';
            wCgc := Trim(Copy(S, 07, 24));
            for i := 1 to 18 do
              if wCgc[I] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
                wCgc1 := wCgc1 + wCgc[I];
            QImpCadCanceladoNUM_CGC_CPF.Value := wCgc1;
          end;
          if Trim(Copy(S, 25, 45)) <> '' then
            QImpCadCanceladoNUM_INSCRICAO.Value := (Trim(Copy(S, 25, 45)));
          QImpCadCancelado.Post;
          Readln(F, S);
          Inc(wContador);
          LBContImportacao.Caption := IntToStr(wContador);
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
  S, DataIni, DataFinal: string;
  F: TextFile;
  wContador: integer;
begin
  wContador := 0; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.

  if (Trim(EdFilial1.Text) = '') then
    raise exception.Create('Deve ser o código da Empresa Filial!');

  if (Trim(MEInicial.Text) = '') or
    (Trim(MEFinal.Text) = '') then
    raise exception.Create('Deve ser informado período de lançamento!');
  DataIni := MEInicial.Text;
  DataFinal := MEFinal.Text;
  with DMImportaDados do
  begin
    QExportaAcco.Close;
    QExportaAcco.SetVariable('DT_INICIAL', MEInicial.Text);
    QExportaAcco.SetVariable('DT_FINAL', MEFinal.Text);
    QExportaAcco.SetVariable('FILIAL', EdFilial1.Text);
    QExportaAcco.Open;
    QExportaAcco.First;
    S := '01' +
      RMaskCGC_CPF(QExportaAccoNUM_CGC.Text, 14) +
      Bib.FormataTexto(QExportaAccoDESC_FILIAL.Text, 35) +
      Copy(DataIni, 1, 2) + Copy(DataIni, 4, 2) + Copy(DataIni, 7, 4) +
      Copy(DataFinal, 1, 2) + Copy(DataFinal, 4, 2) + Copy(DataFinal, 7, 4) +
      Bib.FormataTexto(' ', 207) + Chr(13) + Chr(10);
    while not QExportaAcco.Eof do
    begin
      S := S + '02' + //Registro Tipo 02 Dados de Nota Fiscal
        Bib.FormataTexto(QExportaAccoNOME.Text, 40) +
        Bib.FormataTexto(QExportaAccoDESC_ENDERECO.Text, 40) +
        Bib.FormataTexto(QExportaAccoDESC_CIDADE.Text, 40) +
        Bib.FormataTexto(QExportaAccoCOD_ESTADO.Text, 2) +
        RMaskCGC_CPF(QExportaAccoDESC_CEP.Text, 8) +
        RMaskCGC_CPF(QExportaAccoNUM_CGC_CPF.Text, 14) +
        Bib.FormataTexto(QExportaAccoDESC_PRODUTO.Text, 40) +
        IntDecimais(QExportaAccoNUM_EMBALAGEM.Text, 7, 3) + //ITEM 9
        Bib.FormataTexto(QExportaAccoDESC_UNIDADE.Text, 3);
      if QExportaAccoIND_TIPO_EMBALAGEM.Text = '1' then
        S := S + Bib.FormataTexto('RIGIDAS LAVAVEIS', 20);
      if QExportaAccoIND_TIPO_EMBALAGEM.Text = '2' then
        S := S + Bib.FormataTexto('FLEXIVEIS', 20);
      if QExportaAccoIND_TIPO_EMBALAGEM.Text = '3' then
        S := S + Bib.FormataTexto('RIGIDAS NAO LAVAVEIS', 20);
      S := S + IntDecimais(QExportaAccoQT_QUANTIDADE.Text, 11, 3) + //ITEM 12
        Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text), 1, 2) + Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text), 4, 2) + Copy(Trim(QExportaAccoDT_RECEBIMENTO.Text), 7, 4) +
        RMaskCGC_CPF(QExportaAccoNUM_NOTA.Text, 6) +
        RMaskCGC_CPF(QExportaAccoNUM_CGC.Text, 14);
      if QExportaAccoIND_VENDAS.Text = 'D' then
        S := S + '2'
      else
        S := S + '1';
      S := S + Bib.FormataTexto(QExportaAccoCOD_PRODUTO.Text, 10);
      if Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = '' then
        S := S + Bib.FormataTexto(' ', 8);
      if Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'P' then
        S := S + Bib.FormataTexto('PLASTICO', 8);
      if Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'V' then
        S := S + Bib.FormataTexto('VIDRO', 8);
      if Trim(QExportaAccoIND_TIPO_VASILHAME.Text) = 'M' then
        S := S + Bib.FormataTexto('METAL', 8);
      S := S + Chr(13) + Chr(10);
      Inc(wContador);
      QExportaAcco.Next;
    end;
    //**********REGISTRO DO TIPO 3*************************************
    S := S + '03' +
      RMaskCGC_CPF('1', 10);
    Label20.Caption := IntToStr(wContador);
    S := S + RMaskCGC_CPF(IntToStr(wContador), 10) +
      RMaskCGC_CPF('1', 10) +
      Bib.FormataTexto(' ', 242) + Chr(13) + Chr(10);
  end;

  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
end;


procedure TFImportaDados.ME24ImportaClick(Sender: TObject);
var
  F: TextFile;
  wContador, wDiasCheque: integer;
  S, wEstado, wCod_Pedido: string;
begin
  wContador := 0;
  S := ''; // Inicializa valor da variavel.
  wCod_Pedido := '';
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a linha do arquivo texto}
    with DMImportaDados do
    begin
      QPedidoCabImporta.Close;
      QPedidoItemImporta.Close;
      QPedidoCabImporta.Open;
      QPedidoItemImporta.Open;
      // desabilitar o botao importar
      wContador := 0;
      try
        DMOracle.DBCemapa.StartTransaction;
        while Trim(S) <> '' do
        begin
          if wCod_Pedido <> Copy(S, 03, 10) then
          begin
            QPedidoCabImporta.Insert;
            wContador := wContador + 1;

          //--codigo da filial escolhida na importacao
            QPedidoCabImportaCOD_FILIAL.Value := StrToInt(Trim(FImportaDados.ME24CodFilial.Text));
            if Trim(Copy(S, 318, 3)) <> '' then
              QPedidoCabImportaCOD_OPERACAO.Text := Copy(S, 318, 3);
            if Trim(Copy(S, 27, 6)) <> '' then
              QPedidoCabImportaCOD_VENDEDOR.Value := StrToInt(Copy(S, 27, 6));
            if Trim(Copy(S, 17, 6)) <> '' then
              QPedidoCabImportaCOD_CADASTRO.Value := StrToInt(Copy(S, 17, 6));
          //----NUM PEDIDO GERADO APARTIR DA SEQUENCIA POR FILIAL
            QPedidoCabImportaNUM_PEDIDO.Value := DMSequencia.Sequencia(StrToInt(Trim(FImportaDados.ME24CodFilial.Text)), 'PEDIDO');
            if Trim(Copy(S, 33, 10)) <> '' then
              QPedidoCabImportaDT_EMISSAO.Value := StrToDate(Copy(S, 41, 2) + '/' + Copy(S, 38, 2) + '/' + Copy(S, 33, 4));
            QPedidoCabImportaDT_SISTEMA.Value := DATE;
            if Trim(Copy(S, 63, 60)) <> '' then
              QPedidoCabImportaDESC_OBSERVACAO.Value := (Copy(S, 63, 60));
            if Trim(Copy(S, 123, 60)) <> '' then
              QPedidoCabImportaDESC_COMPLEMENTO_OBS.Value := (Copy(S, 123, 60));
            if Trim(Copy(S, 440, 6)) <> '' then
              QPedidoCabImportaPERC_COMISSAO.Value := StrToFloat(Copy(S, 440, 6)) / 100;
            if Trim(Copy(S, 183, 60)) <> '' then
              QPedidoCabImportaDESC_COMPLEMENTO_OBS2.Value := (Copy(S, 183, 60));
            if Trim(Copy(S, 321, 10)) <> '' then
              QPedidoCabImportaIND_TIPO_PAGAMENTO.Value := (Copy(S, 321, 10));
            QPedidoCabImportaCod_Usuario.Value := DMUsuario.QUsuarioCod_Usuario.Value;
            if DMOracle.BuscaNome('SELECT TB_PRAZO_VENCIMENTO_DIAS.NUM_DIAS FROM TB_PRAZO_VENCIMENTO_DIAS', 'COD_PRAZO_VENCIMENTO = ' + Trim(Copy(S, 57, 6))) <> '' then
            begin
              wDiasCheque := StrToInt(DMOracle.BuscaNome('SELECT TB_PRAZO_VENCIMENTO_DIAS.NUM_DIAS FROM TB_PRAZO_VENCIMENTO_DIAS', 'COD_PRAZO_VENCIMENTO = ' + Trim(Copy(S, 57, 6))));
              if wDiasCheque > 0 then
              begin
                QPedidoCabImportaNR_DIAS_CHEQUE.Value := wDiasCheque;
                QPedidoCabImportaNR_DIAS_CHEQUE1.Value := wDiasCheque;
                QPedidoCabImportaNR_DIAS_CHEQUE2.Value := wDiasCheque;
                QPedidoCabImportaNR_DIAS_CHEQUE3.Value := wDiasCheque;
              end;
            end;
            if Trim(Copy(S, 57, 6)) <> '000000' then
              QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value := StrToInt(Copy(S, 57, 6));
          //--- padrao frete CIF
            QPedidoCabImportaIND_TIPO_FRETE.Value := 'CIF'; //------FALTA
            QPedidoCabImporta.Post;

          //---------------grava itens
            QPedidoItemImporta.Insert;
            QPedidoItemImportaCod_Pedido_Cab.Value := QPedidoCabImportaCod_Pedido_Cab.Value;
            if Trim(Copy(S, 381, 10)) <> '' then
              QPedidoItemImportaCOD_PRODUTO.Text := Copy(S, 381, 10);
            wEstado := DMOracle.BuscaNome('SELECT TB_CADASTRO.COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(Copy(S, 17, 6)));
            QPedidoItemImportaCOD_TRIBUTACAO.Text := DMOracle.BuscaNome('SELECT TB_ESTADO.PERC_TRIBUTACAO FROM TB_ESTADO', 'COD_ESTADO = ' + chr(39) + wEstado + chr(39)); //------FALTA
            if Trim(Copy(S, 392, 9)) <> '' then
              QPedidoItemImportaQT_PEDIDO.Value := StrToInt(Copy(S, 392, 9));
            if Trim(Copy(S, 405, 11)) <> '' then
              QPedidoItemImportaVAL_UNITARIO.Value := (StrToFloat(Copy(S, 405, 11))) / 100;
            QPedidoItemImportaQT_ATENDIDO.Value := 0;
            QPedidoItemImportaQT_CANCELADO.Value := 0;
            QPedidoItemImportaQT_CANCELADO.Value := 0;
            QPedidoItemImportaPERC_DESCONTO.Value := 0;
            QPedidoItemImportaCOD_LOTE_TIPO.Value := 1;
            if Trim(Copy(S, 440, 6)) <> '' then
              QPedidoItemImportaPERC_COMISSAO.Value := (StrToFloat(Copy(S, 440, 6))) / 100;
            if Trim(Copy(S, 420, 11)) <> '' then
              QPedidoItemImportaPERC_DESCONTO.Value := (StrToFloat(Copy(S, 420, 11))) / 100;
          end
          else
          begin
          //---------------grava itens
            QPedidoItemImporta.Insert;
            QPedidoItemImportaCod_Pedido_Cab.Value := QPedidoCabImportaCod_Pedido_Cab.Value;
            if Trim(Copy(S, 381, 10)) <> '' then
              QPedidoItemImportaCOD_PRODUTO.Text := Copy(S, 381, 10);
            wEstado := DMOracle.BuscaNome('SELECT TB_CADASTRO.COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(Copy(S, 17, 6)));
            QPedidoItemImportaCOD_TRIBUTACAO.Text := DMOracle.BuscaNome('SELECT TB_ESTADO.PERC_TRIBUTACAO FROM TB_ESTADO', 'COD_ESTADO = ' + chr(39) + wEstado + chr(39)); //------FALTA
            if Trim(Copy(S, 392, 9)) <> '' then
              QPedidoItemImportaQT_PEDIDO.Value := StrToInt(Copy(S, 392, 9));
            if Trim(Copy(S, 405, 11)) <> '' then
              QPedidoItemImportaVAL_UNITARIO.Value := (StrToFloat(Copy(S, 405, 11))) / 100;
            QPedidoItemImportaQT_ATENDIDO.Value := 0;
            QPedidoItemImportaQT_CANCELADO.Value := 0;
            QPedidoItemImportaQT_CANCELADO.Value := 0;
            QPedidoItemImportaPERC_DESCONTO.Value := 0;
            QPedidoItemImportaCOD_LOTE_TIPO.Value := 1;
            if Trim(Copy(S, 440, 6)) <> '' then
              QPedidoItemImportaPERC_COMISSAO.Value := (StrToFloat(Copy(S, 440, 6))) / 100;
            if Trim(Copy(S, 420, 11)) <> '' then
              QPedidoItemImportaPERC_DESCONTO.Value := (StrToFloat(Copy(S, 420, 11))) / 100;
          end;
          wCod_Pedido := Copy(S, 03, 10);
          Readln(F, S);
          QPedidoItemImporta.Post;
        end;
        dmoracle.dbcemapa.commit;
      except
        dmoracle.dbcemapa.rollback;
        raise exception.create('Erro nos dados a serem importados');
      end;
    end;
  end;
  MEImp.Text := IntToStr(wContador);
end;


procedure TFImportaDados.ME25ImportaClick(Sender: TObject);
var
  F: TextFile;
  wstrS: string;
  wintContador: Integer;
begin
  wstrS := ''; // Inicializa valor da variavel.
  wintContador := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, wstrS); {Le a linha do arquivo texto}
    if (Copy(wstrS, 1, 10) <> 'COD_MUNICI') then
    begin
      raise Exception.Create('Este não é o arquivo de Municípios!');
    end;
    Readln(F, wstrS);
    DMImportaDados.QCidadeImporta.Close;
    DMImportaDados.QCidadeImporta.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while (Trim(wstrS) <> '') do
      begin
        DMImportaDados.QCidadeImporta.Insert;
        DMImportaDados.QCidadeImportaCOD_CIDADE.Text := Trim(Copy(wstrS, 1, 4));
        DMImportaDados.QCidadeImportaDESC_CIDADE.Text := Trim(Copy(wstrS, 6, 50));
        DMImportaDados.QCidadeImportaCOD_ESTADO.Text := 'PR'; //Copy(wstrS,60,2);
        DMImportaDados.QCidadeImporta.Post;
        Inc(wintContador);
        Readln(F, wstrS);
      end;
      dmoracle.dbcemapa.commit;
    except
      DMImportaDados.QCidadeImporta.cancel;
      dmoracle.dbcemapa.rollback;
      raise exception.create('Erro nos dados a serem importados');
    end;
  end;
  DMImportaDados.QCidadeImporta.Close;
  MEImp.Text := IntToStr(wintContador);
end;

procedure TFImportaDados.BtExportaCadastroInternetClick(Sender: TObject);
var
  S: string;
  F: TextFile;
  wContador: integer;
begin
  wContador := 0; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QCadastroExporta.Close;
    QCadastroExporta.Open;
    PB.Max := QCadastroExporta.RecordCount;
    QCadastroExporta.First;
    while not QCadastroExporta.Eof do
    begin
      S := S + '01' +
        RMaskCGC_CPF(QCadastroExportaCOD_CADASTRO.Text, 10) +
        Bib.FormataTexto(RemoveAspas(QCadastroExportaNOME.Text), 50) +
        Bib.FormataTexto(RemoveAspas(QCadastroExportaDESC_ENDERECO.Text), 40) +
        Bib.FormataTexto(RemoveAspas(QCadastroExportaDESC_CIDADE.Text), 40) +
        Bib.FormataTexto(QCadastroExportaCOD_ESTADO.Text, 2) +
        Bib.FormataTexto(QCadastroExportaDESC_CEP.Text, 9) +
        Bib.FormataTexto(QCadastroExportaNUM_CGC_CPF.Text, 20) +
        Bib.FormataTexto(QCadastroExportaNUM_INSCRICAO.Text, 20) +
        RMaskCGC_CPF(QCadastroExportaCOD_VENDEDOR.Text, 10) +
        Bib.FormataTexto(QCadastroExportaDESC_TELEFONE.Text, 15) +
        Bib.FormataTexto(QCadastroExportaDESC_FAX.Text, 15) +
        Bib.FormataTexto(QCadastroExportaDESC_E_MAIL.Text, 40) +
        Bib.FormataTexto(RemoveAspas(QCadastroExportaDESC_BAIRRO.Text), 30) +
        Chr(13) + Chr(10);
      Inc(wContador);
      PB.Position := wContador;
      QCadastroExporta.Next;
    end;
  end;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    Label23.Caption := IntToStr(wContador);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  PB.Position := 0;
end;

procedure TFImportaDados.BtnExportaEscritaFiscalClienteClick(Sender: TObject);
var
  S, wstrTel, wstrCGC, wEmpresa: string;
  F: TextFile;
  wContador: integer;
begin
  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_EMPRESA > ' + CHR(39) + 'A' + CHR(39)); //BUSCA A EMPRESA
  wstrTel := '';
  wContador := 1; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalClientes.Close;
    if (Trim(MeExpEscritaFiscalCliPeriodoInicial.Text) = '') then
      QExpEscritaFiscalClientes.SetVariable('DT_INICIAL', '01/01/1900')
    else
      QExpEscritaFiscalClientes.SetVariable('DT_INICIAL', Trim(MeExpEscritaFiscalCliPeriodoInicial.Text));

    if (Trim(MeExpEscritaFiscalCliPeriodoFinal.Text) = '') then
      QExpEscritaFiscalClientes.SetVariable('DT_FINAL', '01/01/1900')
    else
      QExpEscritaFiscalClientes.SetVariable('DT_FINAL', Trim(MeExpEscritaFiscalCliPeriodoFinal.Text));

    if Trim(MeExpEscritaFiscalCliVendedor.Text) = '' then
      QExpEscritaFiscalClientes.SetVariable('COD_VENDEDOR', NULL)
    else
      QExpEscritaFiscalClientes.SetVariable('COD_VENDEDOR', StrToInt(Trim(MeExpEscritaFiscalCliVendedor.Text)));

    QExpEscritaFiscalClientes.Open;
    PB.Max := QExpEscritaFiscalClientes.RecordCount;
    QExpEscritaFiscalClientes.First;
    while not QExpEscritaFiscalClientes.Eof do
    begin
      if wEmpresa = 'MOINHO' then //insere o COD_CADASTRO se a empresa for o 'MOINHO'
      begin
        S := S + StrZero(QExpEscritaFiscalClientesCOD_CADASTRO.Value, 6);
        S := S + StrZero(QExpEscritaFiscalClientesCOD_VENDEDOR.value, 6); //insere 0 a esquerda do valor
      end;

      wstrCGC := FormataCGC(Trim(QExpEscritaFiscalClientesIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalClientesNUM_CGC_CPF.Text));
      S := S +
        Bib.FormataTexto(wstrCGC, 18) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesNOME.Text), 40) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesDESC_FANTASIA.Text), 20) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesCOD_ESTADO.Text), 2) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesNUM_INSCRICAO.Text), 20) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesDESC_ENDERECO.Text), 40) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesDESC_BAIRRO.Text), 20) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalClientesDESC_CIDADE.Text), 20) +
        RMaskCGC_CPF(Trim(QExpEscritaFiscalClientesDESC_CEP.Text), 8) +
        RMaskCGC_CPF('0', 4) {Trim(QExpEscritaFiscalClientesCOD_CIDADE.Text),4 ) } +
        RMaskCGC_CPF(Trim(QExpEscritaFiscalClientesDESC_TELEFONE.Text), 13) +
        RMaskCGC_CPF('0', 6) +
        RMaskCGC_CPF('0', 3) +
        RMaskCGC_CPF('0', 6) +
        RMaskCGC_CPF('0', 3) +
        'N' +
        Bib.FormataTexto(' ', 70) +
        RMaskCGC_CPF(IntToStr(wContador), 6) +
        Chr(13) + Chr(10);
      Inc(wContador);
      PB.Position := wContador;
      QExpEscritaFiscalClientes.Next;
    end;
  end;
  wstrCGC := Trim(MeExpEscritaFiscalCliPeriodoInicial.Text);
  wstrCGC := Copy(wstrCGC, 1, 2) + Copy(wstrCGC, 4, 2) + Copy(wstrCGC, 9, 2) + '-' + FormatDateTime('DDMMYY', Date);
  SaveDialog.FileName := 'CLIFOR-' + wstrCGC + '.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    Label25.Caption := IntToStr(wContador - 1);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  PB.Position := 0;
end;


procedure TFImportaDados.BtnExportaEscritaFiscalNEClick(Sender: TObject);
var
  S, wstrTel, wstrCGC: string;
  F: TextFile;
  wContador, wintCodigo: integer;
begin
  wstrTel := '';
  wintCodigo := 0;
  wContador := 1; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.
  Label23.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalNE.Close;
    if (Trim(MeExpEscritaFiscalNEFilial.Text) = '') then
      QExpEscritaFiscalNE.SetVariable('FILIAL', Null)
    else
      QExpEscritaFiscalNE.SetVariable('FILIAL', Trim(MeExpEscritaFiscalNEFilial.Text));
    if (Trim(MeExpEscritaFiscalNEDtInicio.Text) = '') or (Trim(MeExpEscritaFiscalNEDtFim.Text) = '') then
      raise Exception.Create('É necessário informar um Período')
    else
    begin
      QExpEscritaFiscalNE.SetVariable('DT_EMISSAO_INICIO', Trim(MeExpEscritaFiscalNEDtInicio.Text));
      QExpEscritaFiscalNE.SetVariable('DT_EMISSAO_FINAL', Trim(MeExpEscritaFiscalNEDtFim.Text));
    end;
    QExpEscritaFiscalNE.Open;
    PB.Max := QExpEscritaFiscalNE.RecordCount;
    QExpEscritaFiscalNE.First;

    wstrCGC := FormataCGC('J', Trim(QExpEscritaFiscalNECGC_FILIAL.Text));
    S := '0' + FormatDateTime('ddmmyyyy', Date) +
      Bib.FormataTexto(wstrCGC, 18) +
      '1' + Bib.FormataTexto(' ', 466) +
      RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
    Inc(wContador);

    while not QExpEscritaFiscalNE.Eof do
    begin
      //REGISTRO EMITENTE/DESTINATARIO
      if (wintCodigo <> QExpEscritaFiscalNECOD_NOTA_CAB.Value) then
      begin
        wstrCGC := FormataCGC(Trim(QExpEscritaFiscalNEIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalNENUM_CGC_CPF.Text));
        S := S +
          '4' + Bib.FormataTexto(wstrCGC, 18) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNENOME.Text), 40) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNEDESC_FANTASIA.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNECOD_ESTADO.Text), 2) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNENUM_INSCRICAO.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNEDESC_ENDERECO.Text), 40) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNEDESC_BAIRRO.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNEDESC_CIDADE.Text), 20) +
          RMaskCGC_CPF(Trim(QExpEscritaFiscalNEDESC_CEP.Text), 8) +
          '0000' +
          RMaskCGC_CPF(Telefone(Trim(QExpEscritaFiscalNEDESC_TELEFONE.Text)), 13) +
          RMaskCGC_CPF('0', 18) +
          'N' +
          Bib.FormataTexto(' ', 269) +
          RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
        Inc(wContador);

        //REGISTRO DE NOTAS FISCAIS
        S := S + '1' + FormatDateTime('ddmmyyyy', QExpEscritaFiscalNEDT_EMISSAO.Value) +
          RMaskCGC_CPF(Trim(QExpEscritaFiscalNENUM_NOTA.Text), 6) +
          FormatDateTime('ddmmyyyy', QExpEscritaFiscalNEDT_EMISSAO.Value) +
          '00' + Bib.FormataTexto(Trim(QExpEscritaFiscalNECOD_SERIE.Text), 3) +
          '   ' +
          RMaskCGC_CPF(Trim(QExpEscritaFiscalNECFOP.Text), 4) +
          '010000' +
          Bib.FormataTexto(wstrCGC, 18) +
          IntDecimais(Trim(QExpEscritaFiscalNEval_total_nota.Text), 12, 2) +
          RMaskCGC_CPF('0', 12) + //PIS
          RMaskCGC_CPF('0', 12) + //COFINS
          RMaskCGC_CPF('0', 12) + //CONTR.SOCIAL
          RMaskCGC_CPF('0', 12) + //IMPOSTO DE RENDA
          IntDecimais(Trim(QExpEscritaFiscalNEbase_calculo_nota.Text), 12, 2) +
          IntDecimais(Trim(QExpEscritaFiscalNEPERC_ALIQUOTA.Text), 4, 2) +
          IntDecimais(Trim(QExpEscritaFiscalNEval_icms_nota.Text), 12, 2) +
          RMaskCGC_CPF('0', 84) + //BASE B, C, D
          IntDecimais(FloatToStr(QExpEscritaFiscalNEval_total_nota.Value - QExpEscritaFiscalNEbase_calculo_nota.Value), 12, 2) +
          RMaskCGC_CPF('0', 12) + //VALOR DE OUTRAS DE ICMS
          RMaskCGC_CPF('0', 48) + //IPI
  {340}RMaskCGC_CPF('0', 48) + //IPI
  {352}Bib.FormataTexto(' ', 55);
  {407}if (QExpEscritaFiscalNEIND_CONDICAO_PAGTO.Text = '1') then
          S := S + 'S'
        else
          S := S + 'N';
  {408}S := S + RMaskCGC_CPF('0', 12) +
  {420}Bib.FormataTexto(' ', 75) +
          RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
        Inc(wContador);
      end;
//      If(wintCodigo = QExpEscritaFiscalNECOD_NOTA_CAB.Value)Then
      begin
        //REGISTRO DE PRODUTOS
  {1}S := S + '2' +
  {2}RMaskCGC_CPF(QExpEscritaFiscalNECOD_NOTA_ITEM.Text, 10) +
  {12}RMaskCGC_CPF('0', 9) +
  {21}IntDecimais(QExpEscritaFiscalNEVAL_TOTAL.Text, 12, 2) +
  {33}IntDecimais(QExpEscritaFiscalNEQT_QUANTIDADE.Text, 13, 3) +
  {46}IntDecimais(QExpEscritaFiscalNEVAL_DESCONTO.Text, 12, 2) +
  {58}IntDecimais(QExpEscritaFiscalNEVAL_ICM_BASE.Text, 12, 2) +
  {70}IntDecimais(QExpEscritaFiscalNEPERC_ALIQUOTA.Text, 5, 2) +
  {75}IntDecimais(QExpEscritaFiscalNEVAL_IPI.Text, 12, 2) +
  {87}RMaskCGC_CPF('0', 12) +
  {99}IntDecimais(QExpEscritaFiscalNEPERC_IPI.Text, 5, 2) +
  {104}IntDecimais(QExpEscritaFiscalNEPERC_TRIBUTADO.Text, 5, 2) +
  {109}RMaskCGC_CPF('0', 3) +
  {102}Bib.FormataTexto(' ', 383) +
          RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
        Inc(wContador);

        PB.Position := wContador;
        wintCodigo := QExpEscritaFiscalNECOD_NOTA_CAB.Value;
      end;
      QExpEscritaFiscalNE.Next;
    end;
    //REGISTRO TRAILLER
    S := S + '3' +
  {2}IntDecimais(QExpEscritaFiscalNEval_total_nota.Text, 12, 2) +
 {14}RMaskCGC_CPF('0', 48) +
 {62}IntDecimais(QExpEscritaFiscalNEbase_calculo_nota.Text, 12, 2) +
 {74}IntDecimais(QExpEscritaFiscalNEval_icms_nota.Text, 12, 2) +
 {86}RMaskCGC_CPF('0', 72) +
{158}IntDecimais(FloatToStr(QExpEscritaFiscalNEval_total_nota.Value - QExpEscritaFiscalNEbase_calculo_nota.Value), 12, 2) +
 {170}RMaskCGC_CPF('0', 108) +
                                                            {277}Bib.FormataTexto(' ', 217) +
      RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
    QExpEscritaFiscalNE.Close;
  end;
  SaveDialog.FileName := 'NOTAENT.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    Label27.Caption := IntToStr(wContador - 2);
  end
  else
  begin
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
    Label27.Caption := '0';
  end;
  PB.Position := 0;
end;

function TFImportaDados.RetornaItens(wContador: Integer; wstrItem: string): string;
begin
  with DMImportaDados do
  begin
        //REGISTRO DE PRODUTOS
  {1}wstrItem := wstrItem + '2' +
  {2}RMaskCGC_CPF(QExpEscritaFiscalNSCOD_PRODUTO.Text, 10) +
  {12}Bib.StrZero('0', 9) +
  {21}IntDecimais(QExpEscritaFiscalNSVAL_TOTAL.Text, 12, 2) +
  {33}IntDecimais(QExpEscritaFiscalNSQT_QUANTIDADE.Text, 13, 3) +
  {46}IntDecimais(QExpEscritaFiscalNSVAL_DESCONTO.Text, 12, 2) +
  {58}IntDecimais(QExpEscritaFiscalNSVAL_ICM_BASE.Text, 12, 2) +
  {70}IntDecimais(QExpEscritaFiscalNSPERC_ALIQUOTA.Text, 5, 2) +
  {75}IntDecimais(QExpEscritaFiscalNSVAL_IPI.Text, 12, 2) +
  {87}Bib.StrZero('0', 12) +
  {99}IntDecimais(QExpEscritaFiscalNSPERC_IPI.Text, 5, 2) +
  {104}IntDecimais(QExpEscritaFiscalNSPERC_TRIBUTADO.Text, 5, 2) +
  {109}Bib.StrZero('0', 3) +
  {112}Bib.FormataTexto(' ', 383) +
      RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
          //Inc(wContador);

    PB.Position := wContador;
          //wintCodigo := QExpEscritaFiscalNSCOD_NOTA_CAB.Value;
    QExpEscritaFiscalNS.Next;
    Result := wstrItem;
  end;
end;

procedure TFImportaDados.BtnExportaEscritaFiscalNSClick(Sender: TObject);
var
  S, wstrTel, wstrCGC, wstrNota, wstrItem, wstrAux, wstrCfop, wstrVlrContabil: string;
  F: TextFile;
  wContador, wintCodigo, wintCodTributacao, wintSituacao: Integer;
  wfloBase, wfloPercAliq, wfloVlrIcms: Real;
  wbooBrinde: Boolean;
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
  S := ''; // Inicializa valor da variavel.
  Label35.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalNS.Close;
    if (Trim(MeExpEscritaFiscalNSFilial.Text) = '') then
      QExpEscritaFiscalNS.SetVariable('FILIAL', Null)
    else
      QExpEscritaFiscalNS.SetVariable('FILIAL', Trim(MeExpEscritaFiscalNSFilial.Text));
    if (Trim(MeExpEscritaFiscalNSDtInicio.Text) = '') or (Trim(MeExpEscritaFiscalNSDtFim.Text) = '') then
      raise Exception.Create('É necessário informar um Período')
    else
    begin
      QExpEscritaFiscalNS.SetVariable('DT_INICIO', Trim(MeExpEscritaFiscalNSDtInicio.Text));
      QExpEscritaFiscalNS.SetVariable('DT_FINAL', Trim(MeExpEscritaFiscalNSDtFim.Text));
    end;
    QExpEscritaFiscalNS.Open;
    if (QExpEscritaFiscalNS.IsEmpty) then
      raise Exception.Create('Não existem registros a serem gerados no período especificado');
    PB.Max := QExpEscritaFiscalNS.RecordCount;
    QExpEscritaFiscalNS.First;

    //------------------------REGISTRO HEADER---------------------------------\\
    wstrCGC := FormataCGC('J', Trim(QExpEscritaFiscalNSCGC_FILIAL.Text));
    S := '0' + FormatDateTime('ddmmyyyy', Date) +
      Bib.FormataTexto(Trim(QExpEscritaFiscalNSCGC_FILIAL.Text), 18) +
      '1' + Bib.FormataTexto(' ', 466) +
      RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
    Inc(wContador);

    while not QExpEscritaFiscalNS.Eof do
    begin
      //----------------REGISTRO EMITENTE/DESTINATARIO------------------------\\
      if (wintCodigo <> QExpEscritaFiscalNSCOD_NOTA_CAB.Value) or
        (wstrCfop <> QExpEscritaFiscalNSCFOP.Text) then
      begin
        wstrCGC := FormataCGC(Trim(QExpEscritaFiscalNSIND_FISICA_JURIDICA.Text), Trim(QExpEscritaFiscalNSNUM_CGC_CPF.Text));
        if (not QExpEscritaFiscalNS.Bof) then
        begin
          wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
          wstrNota := wstrNota + ValoresIcms(wbooBrinde, wintSituacao, StrToInt(wstrCfop),
            FloatToStr(wfloBase), FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq), wstrVlrContabil);
        end;
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
        S := S + '4' + Bib.FormataTexto(wstrCGC, 18) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSNOME.Text), 40) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSDESC_FANTASIA.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSCOD_ESTADO.Text), 2) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSNUM_INSCRICAO.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSDESC_ENDERECO.Text), 40) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSDESC_BAIRRO.Text), 20) +
          Bib.FormataTexto(Trim(QExpEscritaFiscalNSDESC_CIDADE.Text), 20) +
          RMaskCGC_CPF(Trim(QExpEscritaFiscalNSDESC_CEP.Text), 8) +
          '0000' +
          RMaskCGC_CPF(Telefone(Trim(QExpEscritaFiscalNSDESC_TELEFONE.Text)), 13) +
          Bib.StrZero('0', 18) +
          'N' +
          Bib.FormataTexto(' ', 269) +
          RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
        Inc(wContador);

        //--------------------REGISTRO DE NOTAS FISCAIS-----------------------\\
        //O registro de notas fiscais é composto pelas variáveis (wstrNota + wstrAux)
//        If QExpEscritaFiscalNSIND_SITUACAO.Value = '2' Then  // somente exporta os itens se a nota não for cancelada
//         Begin
        wstrNota := wstrNota + '1' + FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value) +
  {10-15}RMaskCGC_CPF(QExpEscritaFiscalNSNUM_NOTA.Text, 6) +
  {16-21}RMaskCGC_CPF(QExpEscritaFiscalNSNUM_NOTA.Text, 6) +
  {22-29}FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value) +
  {30-32}'   ' + '01001' +
  {38-40}'   ' +
  {41-44}RMaskCGC_CPF(Trim(QExpEscritaFiscalNSCFOP.Text), 4);
  {45-46}case QExpEscritaFiscalNSCFOP.AsInteger of
          5501, 6501: wstrNota := wstrNota + '03';
          5910, 6910: begin
              if (QExpEscritaFiscalNSIND_BRINDE.Text = 'N') then
                wstrNota := wstrNota + '02'
              else
                wstrNota := wstrNota + '01';
            end;
        else
          wstrNota := wstrNota + '01';
        end;
  {47-50}wstrNota := wstrNota + Classificacao(QExpEscritaFiscalNSCFOP.AsInteger, QExpEscritaFiscalNSIND_SITUACAO.AsInteger,
          QExpEscritaFiscalNSIND_CONDICAO_PAGTO.AsInteger) +
  {51-68}'00' + Bib.FormataTexto(wstrCGC, 18);
  {69-80}if (QExpEscritaFiscalNSIND_SITUACAO.Text = '2') then
        begin
          wstrVlrContabil := IntDecimais(QExpEscritaFiscalNSVAL_TOTAL_NOTA.Text, 12, 2);
          wstrNota := wstrNota + wstrVlrContabil +
            Bib.StrZero('0', 12) + //PIS
            Bib.StrZero('0', 12) + //COFINS
            Bib.StrZero('0', 12) + //CONTR.SOCIAL
            Bib.StrZero('0', 12) + //IMPOSTO DE RENDA
  {129-136}Bib.FormataTexto(' ', 8);

    {273}wstrAux := wstrAux + ValoresIpi(QExpEscritaFiscalNSCFOP.AsInteger, Trim(QExpEscritaFiscalNSVAL_TOTAL_NOTA.Text)) +
            Bib.StrZero('0', 48) +
    {369}Bib.StrZero('0', 52) +
    {421}Bib.FormataTexto(' ', 50);
        end
        else
        begin
  {069-128}wstrNota := wstrNota + Bib.StrZero('0', 60) +
  {129-136}Bib.FormataTexto(' ', 8) +
  {137-420}RMaskCGC_CPF('0', 284) +
    {421}Bib.FormataTexto('NOTA FISCAL CANCELADA', 50);
          wbooBase := false;
        end;

            //parte final do registro de notas apos os valores icms e demais (wstrAux)
        wstrAux := wstrAux + '     ';
    {476}if (QExpEscritaFiscalNSIND_CONDICAO_PAGTO.Text = '1') or (QExpEscritaFiscalNSIND_CONDICAO_PAGTO.Text = '3') then
          wstrAux := wstrAux + 'S'
        else
          wstrAux := wstrAux + 'N';
    {477}wstrAux := wstrAux + Bib.StrZero('0', 12);
    {489}if (QExpEscritaFiscalNSVAL_FRETE.Value = 0) then
          wstrAux := wstrAux + '0'
        else
          if (QExpEscritaFiscalNSIND_TIPO_FRETE.Text = 'CIF') then
            wstrAux := wstrAux + '1'
          else
            wstrAux := wstrAux + '2';

  {490-525}wstrAux := wstrAux + RMaskCGC_CPF('0', 36) +
  {526-533}FormatDateTime('ddmmyyyy', QExpEscritaFiscalNSDT_EMISSAO.Value) +
  {534-594}Bib.FormataTexto(' ', 61) +
          RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
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
        ValoresIcms(wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
          FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq), wstrVlrContabil);
        wintContBase := wintContBase - 1;
        wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
        if wfloVlrIsentas < 0 then
          wfloVlrIsentas := 0;
        wstrItem := RetornaItens(wContador, wstrItem);
        Inc(wContador);
      end
      else //Situação caso o item seja da mesma nota
      begin
        if (wbooBase) then //verifica se existe a necessidade de setar os valores das diferentes bases
        begin
          if (wintCodTributacao <> QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger) then
          begin
            if (wintContBase <= 4) then
            begin
              wstrNota := wstrNota + ValoresIcms(wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
                FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq), wstrVlrContabil);
              wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
              wstrCfop := QExpEscritaFiscalNSCFOP.Text;
              wfloBase := QExpEscritaFiscalNSVAL_ICM_BASE.Value;
              wfloPercAliq := QExpEscritaFiscalNSPERC_ALIQUOTA.Value;
              wfloVlrIcms := QExpEscritaFiscalNSVAL_ICM.Value;
              wintCodTributacao := QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger;
              wintSituacao := QExpEscritaFiscalNSIND_SITUACAO.AsInteger;
              wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
              if wfloVlrIsentas < 0 then
                wfloVlrIsentas := 0;
              wstrItem := RetornaItens(wContador, wstrItem);
              Inc(wContador);
            end
          end
          else //tributacao igual é necessario somar os valores de icms para uma mesma tributação
          begin
            wstrCfop := QExpEscritaFiscalNSCFOP.Text;
            wfloBase := wfloBase + QExpEscritaFiscalNSVAL_ICM_BASE.Value;
            wfloPercAliq := QExpEscritaFiscalNSPERC_ALIQUOTA.Value;
            wfloVlrIcms := wfloVlrIcms + QExpEscritaFiscalNSVAL_ICM.Value;
            wintCodTributacao := QExpEscritaFiscalNSCOD_TRIBUTACAO.AsInteger;
            wintSituacao := QExpEscritaFiscalNSIND_SITUACAO.AsInteger;
            ValoresIcms(wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
              FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq), wstrVlrContabil);
            wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
            wintContBase := wintContBase - 1;
            wfloVlrIsentas := wfloVlrIsentas + (QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value);
            if wfloVlrIsentas < 0 then
              wfloVlrIsentas := 0;
            wstrItem := RetornaItens(wContador, wstrItem);
            Inc(wContador);
          end
        end
        else //NF Cancelada
        begin
          wstrItem := RetornaItens(wContador, wstrItem);
          Inc(wContador);
        end
      end;
    end; //fim do while
    //-----------------------REGISTRO TRAILLER--------------------------------\\
//      If(wbooBase)Then
//        wbooBrinde := (Trim(QExpEscritaFiscalNSIND_BRINDE.Text) = 'S');
    wstrNota := wstrNota + ValoresIcms(wbooBrinde, wintSituacao, StrToInt(wstrCfop), FloatToStr(wfloBase),
      FloatToStr(wfloVlrIcms), FloatToStr(wfloPercAliq), wstrVlrContabil);
    S := S + RetornaNotas(wstrNota) + wstrAux + wstrItem + '3' +
  {2}IntDecimais(QExpEscritaFiscalNSVAL_TOTAL.Text, 12, 2) +
 {14}Bib.StrZero('0', 48) +
 {62}IntDecimais(QExpEscritaFiscalNSVAL_ICM_BASE.Text, 12, 2) +
 {74}IntDecimais(QExpEscritaFiscalNSVAL_ICM.Text, 12, 2) +
 {86}Bib.StrZero('0', 72) +
{158}IntDecimais(FloatToStr(QExpEscritaFiscalNSVAL_TOTAL.Value - QExpEscritaFiscalNSVAL_ICM_BASE.Value), 12, 2) +
 {170}Bib.StrZero('0', 156) +
{326}Bib.FormataTexto(' ', 169) +
      RMaskCGC_CPF(IntToStr(wContador), 6) + Chr(13) + Chr(10);
    QExpEscritaFiscalNS.Close;
  end;
  wstrCGC := '-' + Copy(MeExpEscritaFiscalNSDtInicio.Text, 1, 2) +
    Copy(MeExpEscritaFiscalNSDtInicio.Text, 4, 2) +
    Copy(MeExpEscritaFiscalNSDtInicio.Text, 9, 2) + '-' +
    Copy(MeExpEscritaFiscalNSDtFim.Text, 1, 2) +
    Copy(MeExpEscritaFiscalNSDtFim.Text, 4, 2) +
    Copy(MeExpEscritaFiscalNSDtFim.Text, 9, 2);
  SaveDialog.FileName := 'NOTASAI' + wstrCGC + '.TXT';
  SaveDialog.Filter := 'Arquivo de exportação para sistema de escrita fiscal';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    Label35.Caption := IntToStr(wContador);
  end
  else
  begin
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
    Label35.Caption := '0';
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BtnEFProdutosClick(Sender: TObject);
var
  S: string;
  F: TextFile;
  wContador: integer;
begin
  wContador := 1; // Inicializa valor da variavel de contagem.
  S := ''; // Inicializa valor da variavel.
  LbEFProdutos.Caption := '';
  with DMImportaDados do
  begin
    QExpEscritaFiscalProdutos.Close;
    if (Trim(MeCodInicialEFProdutos.Text) <> '') then
      QExpEscritaFiscalProdutos.SetVariable('COD_INICIAL', Trim(MeCodInicialEFProdutos.Text))
    else
      QExpEscritaFiscalProdutos.SetVariable('COD_INICIAL', 0);

    if (Trim(MeCodFinalEFProdutos.Text) <> '') then
      QExpEscritaFiscalProdutos.SetVariable('COD_FINAL', Trim(MeCodFinalEFProdutos.Text))
    else
      QExpEscritaFiscalProdutos.SetVariable('COD_FINAL', 999999999);
    QExpEscritaFiscalProdutos.Open;
    PB.Max := QExpEscritaFiscalProdutos.RecordCount;
    QExpEscritaFiscalProdutos.First;
    while not QExpEscritaFiscalProdutos.Eof do
    begin
      S := S +
        RMaskCGC_CPF(Trim(QExpEscritaFiscalProdutosCOD_PRODUTO.Text), 10) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalProdutosDESC_PRODUTO.Text), 40) +
        Bib.StrZero('0', 8) +
        Bib.FormataTexto(Trim(QExpEscritaFiscalProdutosDESC_UNIDADE.Text), 4) +
        IntDecimais(Trim(QExpEscritaFiscalProdutosNUM_EMBALAGEM.Text), 9, 3) +
        Bib.FormataTexto(' ', 23) +
        RMaskCGC_CPF(IntToStr(wContador), 6) +
        Chr(13) + Chr(10);
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
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    LbEFProdutos.Caption := IntToStr(wContador - 1);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  PB.Position := 0;
end;

procedure TFImportaDados.BtnExpContaReceberClick(Sender: TObject);
var
  wstrS, wstrDtInicial, wstrDtFinal, wstrAux: string;
  F: TextFile;
  wintContador: integer;
begin
  wintContador := 2; // Inicializa valor da variavel de contagem.
  wstrS := ''; // Inicializa valor da variavel.
  LbExpContaReceberTotal.Caption := '';

  with DMImportaDados do
  begin
    QExpContaReceber.Close;
    if (Trim(MeExpContaReceberFilial.Text) <> '') then
      QExpContaReceber.SetVariable(':FILIAL', Trim(MeExpContaReceberFilial.Text))
    else
      QExpContaReceber.SetVariable(':FILIAL', null);

    if (Trim(MeExpContaReceberEmissaoInicial.Text) <> '') then
      wstrDtInicial := Trim(MeExpContaReceberEmissaoInicial.Text)
    else
      wstrDtInicial := '01/01/1900';
    StrToDate(wstrDtInicial);
    QExpContaReceber.SetVariable('DT_EMISSAO_INICIAL', StrToDate(wstrDtInicial));

    if (Trim(MeExpContaReceberEmissaoFinal.Text) <> '') then
      wstrDtFinal := Trim(MeExpContaReceberEmissaoFinal.Text)
    else
      wstrDtFinal := '12/12/2030';
    QExpContaReceber.SetVariable('DT_EMISSAO_FINAL', StrToDate(wstrDtFinal));

    if (Trim(MeExpContaReceberVencimentoInicial.Text) <> '') then
      QExpContaReceber.SetVariable('DT_VENCIMENTO_INICIAL', Trim(MeExpContaReceberVencimentoInicial.Text))
    else
      QExpContaReceber.SetVariable('DT_VENCIMENTO_INICIAL', wstrDtInicial);

    if (Trim(MeExpContaReceberVencimentoFinal.Text) <> '') then
      QExpContaReceber.SetVariable('DT_VENCIMENTO_FINAL', Trim(MeExpContaReceberVencimentoFinal.Text))
    else
      QExpContaReceber.SetVariable('DT_VENCIMENTO_FINAL', '12/12/2030');
    QExpContaReceber.Open;
    PB.Max := QExpContaReceber.RecordCount;

    if (QExpContaReceber.RecordCount = 0) then
      raise Exception.Create('Não existem registros a serem gerados com os parâmetros informados! ');

    //REGISTRO HEADER
    wstrS := '11CR-EXP' +
      Bib.FormataTexto(' ', 505) +
      '000001' + Chr(13) + Chr(10);

    //REGISTRO DETALHE
    QExpContaReceber.First;
    while not QExpContaReceber.Eof do
    begin
      wstrS := wstrS + '2' +
        Bib.FormataTexto(QExpContaReceberCOD_CONTA_RECEBER_CAB.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_FINALIDADE.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_BANCO_AGENCIA.Text, 7) +
        Bib.FormataTexto(QExpContaReceberCOD_FILIAL.Text, 6) +
        RMaskCGC_CPF(QExpContaReceberNUM_TITULO.Text, 6) +
        RMaskCGC_CPF(QExpContaReceberNUM_PARCELA.Text, 3) +
        Bib.FormataTexto(QExpContaReceberDESC_TIPO_DOCUMENTO.Text, 3) +
        Bib.FormataTexto(QExpContaReceberDT_MOVIMENTO.Text, 10) +
        Bib.FormataTexto(QExpContaReceberDT_BAIXA.Text, 10) +
        Bib.FormataTexto(QExpContaReceberDT_VENCIMENTO.Text, 10) +
        Bib.FormataTexto(QExpContaReceberDT_EMISSAO.Text, 10) +
        Bib.FormataTexto(QExpContaReceberDT_CAPITALIZACAO.Text, 10) +
        IntDecimais(QExpContaReceberVAL_TITULO.Text, 11, 2) +
        IntDecimais(QExpContaReceberVAL_NEGOCIO.Text, 11, 2) +
        Bib.FormataTexto(QExpContaReceberIND_ACEITE.Text, 3) +
        Bib.FormataTexto(QExpContaReceberIND_SITUACAO.Text, 13) +
        Bib.FormataTexto(QExpContaReceberDESC_OBSERVACAO.Text, 50) +
        Bib.FormataTexto(QExpContaReceberCOD_NOTA_CAB.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_CADASTRO.Text, 6) +
        IntDecimais(QExpContaReceberVAL_ORIGINAL.Text, 11, 2) +
        Bib.FormataTexto(QExpContaReceberCOD_NOSSO_NUMERO.Text, 15) +
        IntDecimais(QExpContaReceberVAL_JUROS.Text, 11, 2) +
        Bib.FormataTexto(QExpContaReceberCOD_DEPARTAMENTO.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_CONTRATO_VEND.Text, 6) +
        Bib.FormataTexto(QExpContaReceberDESC_AVALISTA1.Text, 40) +
        Bib.FormataTexto(QExpContaReceberDESC_AVALISTA2.Text, 40) +
        Bib.FormataTexto(QExpContaReceberCOD_VENDEDOR.Text, 6) +
        IntDecimais(QExpContaReceberPERC_COMISSAO.Text, 5, 3) +
        Bib.FormataTexto(QExpContaReceberDT_CAPITALIZACAO_MOEDA.Text, 10) +
        IntDecimais(QExpContaReceberVAL_PROMISSORIA.Text, 11, 2) +
        Bib.FormataTexto(QExpContaReceberIND_ENVIADO_BANCO.Text, 3) +
        Bib.FormataTexto(QExpContaReceberCOD_CONTA_CORRENTE.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_ORDEM_COMPRA_CAB.Text, 6) +

               //TB_CONTA_RECEBER_MOV
      Bib.FormataTexto(QExpContaReceberCOD_CONTA_RECEBER_MOV.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_CONTA_RECEBER_CAB_1.Text, 6) +
        Bib.FormataTexto(QExpContaReceberDT_MOVIMENTO_1.Text, 10) +
        IntDecimais(QExpContaReceberVAL_MOVIMENTO.Text, 11, 2) +
        Bib.FormataTexto(QExpContaReceberDESC_OBSERVACAO_1.Text, 50) +
        Bib.FormataTexto(QExpContaReceberCOD_USUARIO.Text, 6) +
        Bib.FormataTexto(QExpContaReceberDT_USUARIO.Text, 10) +
        Bib.FormataTexto(QExpContaReceberIND_TIPO_MOVIMENTO.Text, 20) +
        Bib.FormataTexto(QExpContaReceberCOD_BCO_MOVIMENTO.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_CAIXA_MOV.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_LANCTO_CONTABIL_CRED.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_LANCTO_CONTABIL_DEB.Text, 6) +
        Bib.FormataTexto(QExpContaReceberCOD_NOTA_CAB_1.Text, 6) +
        RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);
      Inc(wintContador);
      PB.Position := wintContador;
      QExpContaReceber.Next;
    end;

    //REGISTRO TRAILER
    wstrS := wstrS + '3' +
      Bib.FormataTexto(' ', 512) +
      RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);
  end;
  wstrAux := 'EXPCR-' + Copy(wstrDtInicial, 1, 2) + Copy(wstrDtInicial, 4, 2) + Copy(wstrDtInicial, 9, 2) +
    '-' + Copy(wstrDtFinal, 1, 2) + Copy(wstrDtFinal, 4, 2) + Copy(wstrDtFinal, 9, 2) + '.TXT';
  SaveDialog.FileName := wstrAux;
  SaveDialog.Filter := 'Arquivo de exportação de contas a receber';
  SaveDialog.DefaultExt := '';
  SaveDialog.FilterIndex := 0;
  if FImportaDados.SaveDialog.Execute then
  begin
    AssignFile(F, FImportaDados.SaveDialog.FileName);
    Rewrite(F);
    Writeln(F, wstrS);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
    LbExpContaReceberTotal.Caption := IntToStr(wintContador - 2);
  end
  else
    MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
  PB.Position := 0;
end;


procedure TFImportaDados.BtnImpContaReceberClick(Sender: TObject);
var
  F: TextFile;
  wstrS: string;
  wintContador, wintCRCOriginal, wintCRC: Integer;
begin
  wstrS := ''; // Inicializa valor da variavel.
  wintContador := 0;
  wintCRC := 0;
  wintCRCOriginal := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, wstrS); {Le a linha do arquivo texto}
    if (Copy(wstrS, 3, 6) <> 'CR-EXP') then
    begin
      raise Exception.Create('Este não é o arquivo de Contas a Receber!');
    end;
    Readln(F, wstrS);
    DMImportaDados.QImpContaReceberCab.Close;
    DMImportaDados.QImpContaReceberCab.Open;
    DMImportaDados.QImpContaReceberMov.Close;
    DMImportaDados.QImpContaReceberMov.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while (Copy(wstrS, 1, 1) = '2') do
      begin
        if (wintCRCOriginal <> StrToInt(Trim(Copy(wstrS, 2, 6)))) then
        begin
          DMImportaDados.QImpContaReceberCab.Insert;
          DMImportaDados.QImpContaReceberCabCOD_FINALIDADE.Text := Trim(Copy(wstrS, 8, 6));
          DMImportaDados.QImpContaReceberCabCOD_BANCO_AGENCIA.Text := Trim(Copy(wstrS, 14, 7));
          DMImportaDados.QImpContaReceberCabCOD_FILIAL.Text := '2';
//          DMImportaDados.QImpContaReceberCabCOD_FILIAL.Text := Trim( Copy(wstrS,21,6) );
          DMImportaDados.QImpContaReceberCabNUM_TITULO.Text := Trim(Copy(wstrS, 27, 6));
          DMImportaDados.QImpContaReceberCabNUM_PARCELA.Text := Trim(Copy(wstrS, 33, 3));
          DMImportaDados.QImpContaReceberCabDESC_TIPO_DOCUMENTO.Text := Trim(Copy(wstrS, 36, 3));
          DMImportaDados.QImpContaReceberCabDT_MOVIMENTO.Text := Trim(Copy(wstrS, 39, 10));
          DMImportaDados.QImpContaReceberCabDT_BAIXA.Text := Trim(Copy(wstrS, 49, 10));
          DMImportaDados.QImpContaReceberCabDT_VENCIMENTO.Text := Trim(Copy(wstrS, 59, 10));
          DMImportaDados.QImpContaReceberCabDT_EMISSAO.Text := Trim(Copy(wstrS, 69, 10));
          DMImportaDados.QImpContaReceberCabDT_CAPITALIZACAO.Text := Trim(Copy(wstrS, 79, 10));
          DMImportaDados.QImpContaReceberCabVAL_TITULO.AsFloat := StrToFloat(Trim(Copy(wstrS, 89, 11))) / 100;
          DMImportaDados.QImpContaReceberCabVAL_NEGOCIO.AsFloat := StrToFloat(Trim(Copy(wstrS, 100, 11))) / 100;
          DMImportaDados.QImpContaReceberCabIND_ACEITE.Text := Trim(Copy(wstrS, 111, 3));
          DMImportaDados.QImpContaReceberCabIND_SITUACAO.Text := Trim(Copy(wstrS, 114, 13));
          DMImportaDados.QImpContaReceberCabDESC_OBSERVACAO.Text := Trim(Copy(wstrS, 127, 50));
          //DMImportaDados.QImpContaReceberCabCOD_NOTA_CAB.Text := Trim( Copy(wstrS,177,6) );
          DMImportaDados.QImpContaReceberCabCOD_CADASTRO.Text := Trim(Copy(wstrS, 183, 6));
          DMImportaDados.QImpContaReceberCabVAL_ORIGINAL.AsFloat := StrToFloat(Trim(Copy(wstrS, 189, 11))) / 100;
          DMImportaDados.QImpContaReceberCabCOD_NOSSO_NUMERO.Text := Trim(Copy(wstrS, 200, 15));
          DMImportaDados.QImpContaReceberCabVAL_JUROS.AsFloat := StrToFloat(Trim(Copy(wstrS, 215, 11))) / 100;
          DMImportaDados.QImpContaReceberCabCOD_DEPARTAMENTO.Text := Trim(Copy(wstrS, 226, 6));
          //DMImportaDados.QImpContaReceberCabCOD_CONTRATO_VEND.Text := Trim( Copy(wstrS,232,6) );
          DMImportaDados.QImpContaReceberCabDESC_AVALISTA1.Text := Trim(Copy(wstrS, 238, 40));
          DMImportaDados.QImpContaReceberCabDESC_AVALISTA2.Text := Trim(Copy(wstrS, 278, 40));
          DMImportaDados.QImpContaReceberCabCOD_VENDEDOR.Text := Trim(Copy(wstrS, 318, 6));
          DMImportaDados.QImpContaReceberCabPERC_COMISSAO.Text := Trim(Copy(wstrS, 324, 5));
          DMImportaDados.QImpContaReceberCabDT_CAPITALIZACAO_MOEDA.Text := Trim(Copy(wstrS, 329, 10));
          DMImportaDados.QImpContaReceberCabVAL_PROMISSORIA.AsFloat := StrToFloat(Trim(Copy(wstrS, 339, 11))) / 100;
          DMImportaDados.QImpContaReceberCabIND_ENVIADO_BANCO.Text := Trim(Copy(wstrS, 350, 3));
          DMImportaDados.QImpContaReceberCabCOD_CONTA_CORRENTE.Text := Trim(Copy(wstrS, 353, 6));
          //DMImportaDados.QImpContaReceberCabCOD_ORDEM_COMPRA_CAB.Text := Trim( Copy(wstrS,359,6) );
          DMImportaDados.QImpContaReceberCab.Post;
          wintCRC := DMImportaDados.QImpContaReceberCabCOD_CONTA_RECEBER_CAB.Value;
          wintCRCOriginal := StrToInt(Trim(Copy(wstrS, 2, 6)));
        end;

        DMImportaDados.QImpContaReceberMov.Insert;
        DMImportaDados.QImpContaReceberMovCOD_CONTA_RECEBER_CAB.Value := wintCRC;
        DMImportaDados.QImpContaReceberMovDT_MOVIMENTO.Text := Trim(Copy(wstrS, 377, 10));
        DMImportaDados.QImpContaReceberMovVAL_MOVIMENTO.AsFloat := StrToFloat(Trim(Copy(wstrS, 387, 11))) / 100;
        DMImportaDados.QImpContaReceberMovDESC_OBSERVACAO.Text := Trim(Copy(wstrS, 398, 50));
        DMImportaDados.QImpContaReceberMovCOD_USUARIO.Text := Trim(Copy(wstrS, 448, 6));
        DMImportaDados.QImpContaReceberMovDT_USUARIO.Text := Trim(Copy(wstrS, 454, 10));
        DMImportaDados.QImpContaReceberMovIND_TIPO_MOVIMENTO.Text := Trim(Copy(wstrS, 464, 20));
        //DMImportaDados.QImpContaReceberMovCOD_BCO_MOVIMENTO.Text := Trim( Copy(wstrS,484,6) );
        //DMImportaDados.QImpContaReceberMovCOD_CAIXA_MOV.Text := Trim( Copy(wstrS,490,6) );
        //DMImportaDados.QImpContaReceberMovCOD_LANCTO_CONTABIL_CRED.Text := Trim( Copy(wstrS,496,6) );
        //DMImportaDados.QImpContaReceberMovCOD_LANCTO_CONTABIL_DEB.Text := Trim( Copy(wstrS,502,6) );
        //DMImportaDados.QImpContaReceberMovCOD_NOTA_CAB.Text := Trim( Copy(wstrS,508,6) );
        DMImportaDados.QImpContaReceberMov.Post;

        Inc(wintContador);
        Readln(F, wstrS);
      end;
      dmoracle.dbcemapa.commit;
    except
      DMImportaDados.QImpContaReceberCab.cancel;
      dmoracle.dbcemapa.rollback;
      MessageDlg('Erro na importação dos registro, linha nº ' + IntToStr(wintContador), mtError, [mbOk], 0);
      raise; // exception.create('Erro nos dados a serem importados');
    end;
  end;
  DMImportaDados.QImpContaReceberCab.Close;
  LbImpContaReceberTotal.Caption := IntToStr(wintContador);
end;

procedure TFImportaDados.MEExpEscritaFiscalCliVendedorExit(Sender: TObject);
begin
  if Trim(MEExpEscritaFiscalCliVendedor.Text) = '' then
    EdExpEscritaFiscalCliVendedor.Text := 'Todos'
  else
    EdExpEscritaFiscalCliVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + Trim(MeExpEscritaFiscalCliVendedor.Text));
end;

procedure TFImportaDados.BtExpEscritaFiscalCliVendedorVendedorClick(
  Sender: TObject);
begin
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    MEExpEscritaFiscalCliVendedor.Text := IntToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
    MEExpEscritaFiscalCliVendedorExit(Self);
  end;
end;

procedure TFImportaDados.BitBtn10Click(Sender: TObject);
var
  wVirgula, wAux, wArqCommobile, wSeparador: string;
  wCount: Integer;
  F: TextFile;
begin
  {OpenDialog1.Execute;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';}
  wAux := '';
  wVirgula := '';
  wSeparador := ';';


  with DMImportaDados do
  begin
    QExportaEmbarqueCommobile.Close;
    for wCount := 0 to Lb39CodEmbarque.Items.Count - 1 do
    begin
      wAux := wAux + wVirgula + Lb39CodEmbarque.Items.Strings[wCount];
      wVirgula := ',';
    end;
    QExportaEmbarqueCommobile.SetVariable('LISTA_EMBARQUE', wAux);
    QExportaEmbarqueCommobile.Open;
    QExportaEmbarqueCommobile.First;

    SaveDialog.FileName := 'EmbarqueCommobile';
    SaveDialog.Filter := 'Arquivo de Embarques';
    SaveDialog.DefaultExt := 'Txt';
    SaveDialog.FilterIndex := 0;
    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);

      while not QExportaEmbarqueCommobile.Eof do
      begin
        wArqCommobile := '';
        if Length(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString) > 4 then
          wArqCommobile := copy(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString, length(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString) - 3, 4)
        else
          RMaskCGC_CPF(QExportaEmbarqueCommobileNUM_EMBARQUE.AsString, 4);
        wArqCommobile := wArqCommobile + wSeparador;
        wArqCommobile := wArqCommobile +
          RMaskCGC_CPF(QExportaEmbarqueCommobileNUM_SEQUENCIAL.AsString, 6) + wSeparador +
          'ENTREGA' + wSeparador +
          RMaskCGC_CPF(DeletaChar(DeletaChar(QExportaEmbarqueCommobileQT_VOLUME.AsString, ','), '.'), 15) + wSeparador +
          RMaskCGC_CPF(DeletaChar(DeletaChar(QExportaEmbarqueCommobileQT_PESO.AsString, ','), '.'), 15) + wSeparador +
          QExportaEmbarqueCommobileDT_EMBARQUE.AsString + wSeparador +
          bib.FormataTexto(QExportaEmbarqueCommobileNOME.AsString, 50) + wSeparador +
          DeletaChar(QExportaEmbarqueCommobileDESC_CEP.AsString, '-') + wSeparador +
          bib.FormataTexto(QExportaEmbarqueCommobileDESC_CIDADE.AsString, 50) + wSeparador +
          QExportaEmbarqueCommobileCOD_ESTADO.AsString + wSeparador +
          'BR' + wSeparador +
          bib.FormataTexto(QExportaEmbarqueCommobileDESC_ENDERECO.AsString, 50) + wSeparador +
          '00000' + wSeparador +
          bib.FormataTexto(QExportaEmbarqueCommobileDESC_BAIRRO.AsString, 50) + wSeparador +
          bib.FormataTexto('', 50) + wSeparador + //REFERÊNCIA
          bib.FormataTexto(QExportaEmbarqueCommobileNOME_CONTATO.AsString, 50) + wSeparador +
          bib.FormataTexto(QExportaEmbarqueCommobileDESC_TELEFONE.AsString, 15) + wSeparador;

        Writeln(F, wArqCommobile);
        QExportaEmbarqueCommobile.Next;
      end;

      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
      Lb39CodEmbarque.Clear();
    end
    else
      MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
  end;
end;

procedure TFImportaDados.BitBtn13Click(Sender: TObject);
var
  F: TextFile;
  S, wComando: string;
  wContador: Integer;
  wAux: string;
begin
  S := ''; // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter := 'txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_PRACA';
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    end;

    if OpenDialog1.Execute then
    begin
//    lbcaminho.caption:=OpenDialog1.Files.Text;
      AssignFile(F, OpenDialog1.FileName); //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F, S);
      Readln(F, S);
    end;
    DMImportaDados.QImpPraca.Open;
    while not ((copy(S, 1, 1) = '') or (copy(S, 33, 2) = '  ') or (copy(S, 35, 1) = ' ')) do
    begin
      DMImportaDados.QImpPraca.Insert;
      DMImportaDados.QImpPracaCod_Praca.Value := copy(S, 3, 5);
      DMImportaDados.QImpPracaDesc_Cidade.Value := copy(S, 8, 23);
      DMImportaDados.QImpPracaDesc_Sigla.Value := copy(S, 33, 2);
      DMImportaDados.QImpPracaInd_Situacao.Value := copy(S, 35, 1);
      DMImportaDados.QImpPraca.Post;
      inc(wContador);
      Readln(F, S);
    end;
    DMImportaDados.QImpPraca.Close;
    LBContador.Caption := 'Total de Praças importadas: ' + IntToStr(wContador);
    LBContador.Refresh;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFImportaDados.BitBtn15Click(Sender: TObject);
var
  F: TextFile;
  wstrS: string;
  wintContador, i: Integer; // wintCRCOriginal, wintCRC
  wIndInserir: boolean;

   //variaveis q receberam os valores convertidos
  wCodFilial: integer;
  wDtLancamento: TDate;
  wIndOperacao: string;
  wCodDebito: integer;
  wCodCredito: integer;
  wCodPlanoConta: integer;
  wValLancamento: real;
  wValor: real;
  wCodHistCont: integer;
  wDescComp: string;
  wVal: string;
  wContraPartida: string;

   //formato das linhas do arquivo
   //000|0000000|00000|00000|000000000000.00|000|"00000000000000000000000000000000000000000000000000"
   //se tiver valor para debito e credito inserir dois registros no banco
   //o credito deve ter o valor negativo.
   //fabiano: 08/10/2004.
begin
  wstrS := ''; // Inicializa valor da variavel.
  wintContador := 0;
//  wintCRC := 0;
//  wintCRCOriginal := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, wstrS); {Le a linha do arquivo texto}
    DMImportaDados.QImpLanctoContabil.Close;
    DMImportaDados.QImpLanctoContabil.Open;
    try
      DMOracle.DBCemapa.StartTransaction;
      while (Trim(wstrS) <> '') do
      begin
        wVal := trim(copy(wstrS, 1, 3));
        if Trim(MeFilialFolha.Text) <> '' then
          wCodFilial := StrToInt(Trim(MeFilialFolha.Text))
        else
          wCodFilial := strtoint(wVal);

        wVal := Trim(copy(wstrS, 5, 6));
        wVal := copy(wVal, 1, 2) + '/' + copy(wVal, 3, 2) + '/' + copy(wVal, 5, 2);
        wDtLancamento := StrToDate(wVal);

        wVal := '0' + trim(copy(wstrS, 12, 5));
        if trim(wVal) <> '0' then
          wVal := '0' + DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA', 'COD_REDUZIDO = ' + trim(wVal));
        wCodDebito := StrToInt(wVal);

        wVal := '0' + trim(copy(wstrS, 18, 5));
        if trim(wVal) <> '0' then
          wVal := '0' + DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA', 'COD_REDUZIDO = ' + trim(wVal));
        wCodCredito := StrToInt(wVal);
        wVal := trim(copy(wstrS, 24, 12)) + ',' + trim(copy(wstrS, 37, 2));
        wValLancamento := StrToFloat(wVal);
        wval := trim(copy(wstrS, 101, 4));
        wCodHistCont := StrToInt(wval);
        wIndInserir := True;
        wDescComp := Trim(copy(wStrS, 45, 50));
        wCodPlanoConta := 0;
        wValor := 0;
        for i := 1 to 2 do //esse FOR é para incluir um registro para o débito e um para o credito
        begin
          if i = 1 then //debito
          begin
            wIndOperacao := 'D';
            wValor := wValLancamento;
            wIndInserir := (wCodDebito <> 0); //só inclui se tem conta debito
            wCodPlanoConta := wCodDebito;
            wContraPartida := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA', 'COD_PLANO_CONTA = ' + Trim(IntToStr(wCodCredito)));
          end;

          if i = 2 then //credito
          begin
            wIndOperacao := 'C';
            wValor := -wValLancamento;
            wIndInserir := (wCodCredito <> 0); //só inclui se tem conta credito
            wCodPlanoConta := wCodCredito;
            wContraPartida := DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA', 'COD_PLANO_CONTA = ' + Trim(IntToStr(wCodDebito)));
          end;

          if wIndInserir then
          begin
            DMImportaDados.QImpLanctoContabil.Insert;
            DMImportaDados.QImpLanctoContabilCOD_FILIAL.Value := wCodFilial;
            DMImportaDados.QImpLanctoContabilDT_LANCAMENTO.Value := wDtLancamento;
            DMImportaDados.QImpLanctoContabilIND_OPERACAO.Value := wIndOperacao;
            DMImportaDados.QImpLanctoContabilCOD_PLANO_CONTA.Value := wCodPlanoConta;
            DMImportaDados.QImpLanctoContabilVAL_LANCAMENTO.Value := wValor;
            DMImportaDados.QImpLanctoContabilCOD_HISTORICO_CONTABIL.Value := wCodHistCont;
            DMImportaDados.QImpLanctoContabilDESC_COMPLEMENTO.Value := wDescComp;
            DMImportaDados.QImpLanctoContabilNUM_CONTRAPARTIDA.Value := wContraPartida;
            DMImportaDados.QImpLanctoContabil.Post;
          end;
        end;

        Readln(F, wstrS);
        Inc(wintContador);
      end;
      DMOracle.DBCemapa.Commit;
      lbContaFolhaPG.Caption := inttostr(wintContador);
      MessageDlg('Importação efetuada com sucesso.', mtInformation, [mbok], 0);
    except
      DMImportaDados.QImpLanctoContabil.cancel;
      dmoracle.dbcemapa.rollback;
      MessageDlg('Erro na importação dos registro, linha nº ' + IntToStr(wintContador), mtError, [mbOk], 0);
      raise; // exception.create('Erro nos dados a serem importados');
    end;
  end;
end;

procedure TFImportaDados.BtComplementoCadastroClick(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  // para carregar tabela de grupos
  // ate aqui
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  with DMImportaDados do
  begin
    TCacom.Open;
    QCadastroCompl.Open;
    DMOracle.DBCemapa.StartTransaction;
    TCacom.First;
    PB.Max := TCacom.RecordCount;
    wCont := 0;
    while not TCacom.Eof do
    begin
      try
        QCadastroCompl.Close;
        QCadastroCompl.SetVariable('Pk', TCacomCodCli.Value);
        QCadastroCompl.Open;
        if not QCadastroCompl.Eof then
        begin
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
        end;
      except
        if QCadastroCompl.State = DsEdit then
          QCadastroCompl.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TCacom.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.percorreArquivoTexto;
var arq: TextFile;
  linha, wAux, wUF, wProduto, wCadastro, wValor, wVendedor, wPrazo, wPedido, wIncluso, wComissao, wPedido1: string;
  Pedido: TStringList;
  I, J, K, wCont: integer;
  colunas: array[1..11] of string;
begin
  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter := 'txt';
  if OpenDialog1.Execute then
    AssignFile(arq, OpenDialog1.FileName) {Pega arquivo selecionado em dialogo box}
  else
    raise exception.Create('Informar o Arquivo para Importar');
//  AssignFile ( arq, 'c:\Pedidos.txt');
  Reset(arq);
  Pedido := TstringList.Create;
  wCont := 0;
  DMImportaDados.QPedidoCabImporta.Close;
  DMImportaDados.QPedidoItemImporta.Close;
  DMImportaDados.QMateriaisImporta.Close;
  DMImportaDados.QPedidoCabImporta.Open;
  DMImportaDados.QPedidoItemImporta.Open;
  DMImportaDados.QMateriaisImporta.Open;
  while not Eof(arq) do
  begin
    ReadLn(arq, linha);
    Pedido.Add(Linha);
  end;
  try
    DMOracle.DBCemapa.StartTransaction;
    for I := 0 to Pedido.Count - 1 do
    begin
      linha := Pedido.Strings[I];
      wAux := copy(linha, 1, 1);
      K := 1;
      colunas[1] := ''; colunas[2] := ''; colunas[3] := ''; colunas[4] := ''; colunas[5] := ''; colunas[6] := '';
      colunas[7] := ''; colunas[8] := ''; colunas[9] := ''; colunas[10] := '';

      for J := 0 to Length(linha) do
      begin
        if linha[J] = ';' then
          K := K + 1
        else
          colunas[K] := colunas[K] + linha[J];
      end;
      if wAux = 'C' then
      begin
        wIncluso := '';
        wPedido := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + colunas[3]);
        wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO', 'COD_CADASTRO_NOVO = ' + colunas[4]);
        wPedido1 := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + colunas[3]);
        if ((wPedido = wCadastro) and (wPedido1 <> '')) then
        begin
          wIncluso := 'SIM';
          raise exception.Create('O pedido ' + colunas[3] + ' do cliente ' + wCadastro + ' ja foi importado!');
        end;
      end;

      if ((wAux = 'C') and (wIncluso = '')) then
      begin
        if wCont <> 0 then
        begin
          DMImportadados.QPedidoCabImporta.Post;
          DMImportadados.QPedidoItemImporta.Post;
        end;
        DMImportadados.QPedidoCabImporta.Insert;
        DMImportadados.QPedidoItemImporta.Insert;
        DMImportadados.QPedidoCabImportaNUM_PEDIDO.Value := StrToInt(colunas[3]);
        wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO', 'COD_CADASTRO_NOVO = ' + colunas[4]);
        if Trim(wCadastro) = '' then
          raise exception.Create('Cadastro Não relacionado ' + colunas[4]);
        DMImportadados.QPedidoCabImportaCOD_CADASTRO.Value := StrToInt(wCadastro);
        DMImportadados.QPedidoCabImportaCOD_FILIAL.Value := 1;
        DMImportadados.QPedidoCabImportaDT_EMISSAO.Value := StrToDate(colunas[7]);
        DMImportadados.QPedidoCabImportaDT_ENTREGA.Value := StrToDate(colunas[8]);
        DMImportadados.QPedidoCabImportaCOD_OPERACAO.Value := 17;
        DMImportadados.QPedidoCabImportaIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
        wPrazo := DMOracle.BuscaNome('SELECT COD_PRAZO_VENCIMENTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + wCadastro);
        if Trim(wPrazo) <> '' then
          DMImportadados.QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value := StrToInt(wPrazo)
        else
          DMImportadados.QPedidoCabImportaCOD_PRAZO_VENCIMENTO.Value := 1;
        wVendedor := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + wCadastro);
        if wVendedor <> '' then
        begin
          DMImportadados.QPedidoCabImportaCOD_VENDEDOR.Value := StrToInt(wVendedor);
          wComissao := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + wVendedor);
          if wComissao <> '' then
            DMImportadados.QPedidoCabImportaPerc_Comissao.Value := StrToFloat(wComissao);
        end;
        DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value := colunas[6];
        DMImportadados.QPedidoItemImportaCOD_PEDIDO_CAB.Value := DMImportadados.QPedidoCabImportaCOD_PEDIDO_CAB.Value;
        wUF := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO_NOVO = ' + colunas[4]);
        DMImportadados.QPedidoItemImportaCOD_TRIBUTACAO.Value := StrToInt(DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO', 'COD_ESTADO = ' + CHR(39) + wUF + CHR(39)));
        wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + CHR(39) + colunas[9] + CHR(39));
        if Trim(wProduto) = '' then
          raise exception.Create('Produto não relacionado ' + colunas[9]);
        DMImportadados.QPedidoItemImportaCOD_PRODUTO.Value := StrToInt(wProduto);
        wValor := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR', 'COD_PRODUTO = ' + CHR(39) + wProduto + CHR(39)
          + 'AND COD_CADASTRO = ' + CHR(39) + wCadastro + CHR(39));
        if wValor = '' then
          raise exception.Create('Preço Não Cadastrado Produto/Cliente ' + wProduto + '/' + wCadastro);
        DMImportadados.QPedidoItemImportaVAL_UNITARIO.Value := StrToFloat(wValor);
        DMImportadados.QPedidoItemImportaCOD_LOTE_TIPO.Value := 1;
      end;

      if ((wAux = 'O') and (wIncluso = '')) then
        DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value := DMImportadados.QPedidoCabImportaDESC_OBSERVACAO.Value + ' ' + colunas[2]; //retirado 'obs: +

      if ((wAux = 'I') and (wIncluso = '')) then
      begin
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

      if ((wAux = 'F') and (wIncluso = '')) then
      begin
        DMImportadados.QPedidoItemImportaQT_PEDIDO.Value := StrToFloat(colunas[2]);
        DMImportadados.QPedidoItemImportaQT_ATENDIDO.Value := 0;
        DMImportadados.QPedidoItemImportaQT_CANCELADO.Value := 0;
        DMImportadados.QPedidoItemImportaPERC_DESCONTO.Value := 0;
        inc(wCont);
      end;

      if ((wAux = 'Q') and (wIncluso = '')) then
      begin
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
  except
    DmOracle.DBCemapa.Rollback;
    raise;
  end;
  CloseFile(arq);

end;

procedure TFImportaDados.SBImportaPedidoClick(Sender: TObject);
begin
  percorreArquivoTexto;
end;


procedure TFImportaDados.SpeedButton1Click(Sender: TObject);
var
  F: TextFile;
  S, wComando: string;
  wContador: Integer;
begin
  S := ''; // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter := 'txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CEP_SAFRA';
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    end;

    if OpenDialog1.Execute then
    begin
//    lbcaminho.caption:=OpenDialog1.Files.Text;
      AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
      reset(F);
      Readln(F, S);
      Readln(F, S);
    end;
    DMImportaDados.QImp_CepSafra.Open;
    while not (copy(S, 1, 1) = '') do
    begin
      DMImportaDados.QImp_CepSafra.Insert;
      DMImportaDados.QImp_CepSafraNUM_CEP_INICIAL.Value := StrToInt(copy(S, 1, 8));
      DMImportaDados.QImp_CepSafraNUM_CEP_FINAL.Value := StrToInt(copy(S, 9, 8));
      DMImportaDados.QImp_CepSafraDESC_AGENCIA.Value := copy(S, 25, 30);
      DMImportaDados.QImp_CepSafraNUM_CEP_AGENCIA.Value := StrToInt(copy(S, 87, 8));
      DMImportaDados.QImp_CepSafraCOD_AGENCIA.Value := StrToInt(copy(S, 95, 5));
      DMImportaDados.QImp_CepSafraCOD_UF.Value := copy(S, 100, 2);
      DMImportaDados.QImp_CepSafra.Post;
      inc(wContador);
      Readln(F, S);
    end;
    DMImportaDados.QImp_CepSafra.Close;
    LblContador.Caption := 'Total de Praças importadas: ' + IntToStr(wContador);
    LblContador.Refresh;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise;
  end;

end;

procedure TFImportaDados.BtImportaCaixaClick(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  with DMImportaDados do
  begin
    TRdmov.Open;
    QCaixa_Mov.Open;
    DMOracle.DBCemapa.StartTransaction;
    TRdmov.First;
    PB.Max := TRdmov.RecordCount;
    wCont := 0;
    while not TRdmov.Eof do
    begin
      try
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
      except
        if QCaixa_Mov.State = dsInsert then
          QCaixa_Mov.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TRdmov.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.Sb39FilialClick(Sender: TObject);
begin
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    MEExpEscritaFiscalCliVendedor.Text := IntToStr(DMVendedor.QVendedorConsCod_Vendedor.Value);
    MEExpEscritaFiscalCliVendedorExit(Self);
  end;
end;

procedure TFImportaDados.Bt39AdicionarClick(Sender: TObject);
begin
  if Me39CodEmbarque.Text <> '' then
  begin
    Lb39CodEmbarque.Items.Add(Me39CodEmbarque.Text);
    Me39CodEmbarque.Text := '';
    Me39CodEmbarque.SetFocus();
  end
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
  wVirgula, wAux, wArqFilial, wQuebra: string;
  wQbEmbarque, wCodPedido, wCount: Integer;
  F: TextFile;
begin
  wAux := '';
  wVirgula := '';
  wQbEmbarque := 0;

  with DMImportaDados do
  begin
    QExportaEmbarque.Close;
    for wCount := 0 to Lb39CodEmbarque.Items.Count - 1 do
    begin
      wAux := wAux + wVirgula + Lb39CodEmbarque.Items.Strings[wCount];
      wVirgula := ',';
    end;
    QExportaEmbarque.SetVariable('LISTA_EMBARQUE', wAux);
    QExportaEmbarque.Open;
    QExportaEmbarque.First;

    while not QExportaEmbarque.Eof do
    begin
      if wQbEmbarque <> 0 then
      begin
        wCodPedido := QExportaEmbarqueCod_Pedido_Cab.Value;
        QExportaEmbarque.Next; // AVANCA SOMENTE PARA VERIFICAR SE QUEBROU OU ULTIMO
        if QExportaEmbarque.Eof then
          wQuebra := 'SIM'
        else
          if wQbEmbarque <> QExportaEmbarqueCod_Embarque.Value then
            wQuebra := 'SIM'
          else
            wQuebra := 'NAO';
        QExportaEmbarque.Locate('COD_PEDIDO_CAB', wCodPedido, []);
      end;
      if wQbEmbarque = 0 then // vai estar com zeros sempre que quebrar o embarque
      begin
        wArqFilial := wArqFilial + 'INICIO;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
          LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
          QExportaEmbarqueCOD_ESTADO.Value + ';' + 'BR';
        wQbEmbarque := QExportaEmbarqueCod_Embarque.Value;
      end
      else
        if wQuebra = 'SIM' then
        begin
          wArqFilial := wArqFilial + 'FIM;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
            LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
            QExportaEmbarqueCOD_ESTADO.Value + ';' + 'BR';
          wQbEmbarque := 0;
        end
        else
        begin // NO LAYOUT NAO CONSTA NUMERO MAS COMO ESTAVAM INDICANDO ERRO NOS TESTES COLOQUEI UM PONTO E VIRGULA APOS O ENDERECO INDICANDO QUE NAO TEM NUMERO
          wArqFilial := wArqFilial + 'DESTINO;' + LimpaCep(QExportaEmbarqueDESC_CEP.Value) + ';' +
            LimpaEndereco(QExportaEmbarqueDESC_ENDERECO.Value) + ';;' + QExportaEmbarqueDESC_CIDADE.Value + ';' +
            QExportaEmbarqueCOD_ESTADO.Value + ';' + 'BR;' + formatDateTime('dd/mm/yyyy hh:mm', StrToDateTime(QExportaEmbarqueDT_EMBARQUE.Text));
        end;
      QExportaEmbarque.Next;
      if not (QExportaEmbarque.Eof) then
        wArqFilial := wArqFilial + Chr(13) + Chr(10);
    end;

    SaveDialog.FileName := 'Embarque';
    SaveDialog.Filter := 'Arquivo de Embarques';
    SaveDialog.DefaultExt := 'Txt';
    SaveDialog.FilterIndex := 0;
    if FImportaDados.SaveDialog.Execute then
    begin
      AssignFile(F, FImportaDados.SaveDialog.FileName);
      Rewrite(F);
      Writeln(F, wArqFilial);
      CloseFile(F);
      MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
      Lb39CodEmbarque.Clear();
    end
    else
      MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
  end;
end;

function TFImportaDados.LimpaCep(wCep: string): string;
var wRetorno: string;
  wCont: Integer;
begin
  wRetorno := '';
  for wCont := 1 to Length(wCep) do
    if (Copy(wCep, wCont, 1) >= '0') and (Copy(wCep, wCont, 1) <= '9') then
      wRetorno := wRetorno + Copy(wCep, wCont, 1);
  Result := wRetorno;
end;

function TFImportaDados.LimpaString(wString, wRetirar: string): string;
var wCont, wCont2: Integer;
  wRetorno: string;
  wOk: Boolean;
begin
  wRetorno := '';
  for wCont := 1 to Length(wString) do
  begin
    wOk := True;
    for wCont2 := 1 to Length(wRetirar) do
    begin
      if wString[wCont] = wRetirar[wCont2] then
        wOk := False;
    end;
    if wOk = True then
      wRetorno := wRetorno + wString[wCont];
  end;
  Result := wRetorno;
end;

procedure TFImportaDados.BtEmbarqueConsClick(Sender: TObject);
begin
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
    Me39CodEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
end;

procedure TFImportaDados.Action1Execute(Sender: TObject);
begin
  with DMOracle do
  try
    DBCemapa.Connected := False;
    DBCemapa.LogonDataBase := InputBox('Conexão', 'Entre com o nome de Serviço', 'ORCL');
    DBCemapa.Connected := True;
      //SetaUsuario;
  except
    MessageDlg('Não foi possível conectar com esta base de dados!'
      + #13 + 'Certifique-se que esta base existe em seu servidor', mtWarning, [mbOk], 0);
  end;
end;

function TFImportaDados.LimpaEndereco(wEndereco: string): string;
var wRetorno: string;
  wCont: Integer;
begin
  wRetorno := '';
  for wCont := 1 to Length(wEndereco) do
    if not ((Copy(wEndereco, wCont, 1) = ',') or (((Copy(wEndereco, wCont, 1) >= '0') and (Copy(wEndereco, wCont, 1) <= '9')))) then
      wRetorno := wRetorno + Copy(wEndereco, wCont, 1);
  Result := wRetorno;

end;

procedure TFImportaDados.BtMovBancoClick(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  wRegNaoImp := 0;
  with DMImportaDados do
  begin
    TMblct.Open;
    QBcoMovimento.Open;
    DMOracle.DBCemapa.StartTransaction;
    TMblct.First;
    PB.Max := TMblct.RecordCount;
    wCont := 0;
    while not TMblct.Eof do
    begin
      try
        QBcoMovimento.Insert;
        QBcoMovimentoCOD_USUARIO.Value := 1;
        if TMBLCTCDHISTOMB.Value = 2 then
          QBcoMovimentoCOD_HISTORICO.Value := 31
        else
          if TMBLCTCDHISTOMB.Value = 3 then
            QBcoMovimentoCOD_HISTORICO.Value := 30
          else
            if TMBLCTCDHISTOMB.Value = 4 then
              QBcoMovimentoCOD_HISTORICO.Value := 69
            else
              if TMBLCTCDHISTOMB.Value = 11 then
                QBcoMovimentoCOD_HISTORICO.Value := 33
              else
                if TMBLCTCDHISTOMB.Value = 12 then
                  QBcoMovimentoCOD_HISTORICO.Value := 34
                else
                  QBcoMovimentoCOD_HISTORICO.Value := TMBLCTCDHISTOMB.Value;
        if TMBLCTNRCONCORRE.Value = '11777-0' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 19;
        if TMBLCTNRCONCORRE.Value = '11765-X' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 6;
        if TMBLCTNRCONCORRE.Value = '2039-0' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 17;
        if TMBLCTNRCONCORRE.Value = '6006-2' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 7;
        if TMBLCTNRCONCORRE.Value = '19262-7' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 15;
        if TMBLCTNRCONCORRE.Value = '49689-8' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 3;
        if TMBLCTNRCONCORRE.Value = '10868' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 11;
        if TMBLCTNRCONCORRE.Value = '5604-9' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 8;
        if TMBLCTNRCONCORRE.Value = '5734-7' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 9;
        if TMBLCTNRCONCORRE.Value = '3223-9' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 4;
        if TMBLCTNRCONCORRE.Value = '5750-9' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 5;
        if TMBLCTNRCONCORRE.Value = '5894-7' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 10;
        if TMBLCTNRCONCORRE.Value = '1' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 2;
        if TMBLCTNRCONCORRE.Value = '10913-4' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 14;
        if TMBLCTNRCONCORRE.Value = '5655-3' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 12;
        if TMBLCTNRCONCORRE.Value = '30588-0' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 16;
        if TMBLCTNRCONCORRE.Value = '25849-0' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 18;
        if TMBLCTNRCONCORRE.Value = '9329-7' then
          QBcoMovimentoCOD_CONTA_CORRENTE.Value := 13;
        QBcoMovimentoNUM_CHEQUE.Text := TMBLCTNRDOCUMEN.Text;
        QBcoMovimentoDT_MOVIMENTO.Value := TMBLCTDTMOVIMEN.Value;
        QBcoMovimentoVAL_MOVIMENTO.Value := TMBLCTVLLANCTO.Value;
        QBcoMovimentoDESC_OBSERVACAO.Value := TMBLCTNOHISTORIC.Value;
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
      except
        if QBcoMovimento.State = dsInsert then
          QBcoMovimento.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TMBLCT.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.Bt40ExportarClick(Sender: TObject);
var
  wVirgula, wAux, wArqCliente, wArqProduto, wArqPedido: string;
  wNumPedido, wCount, wCount1, wCliente, wProduto: Integer;
  F: TextFile;
begin
  wAux := '';
  wVirgula := '';
  wCount1 := 0;
  wNumPedido := 0;
  wCliente := 0;
  wProduto := 0;

  with DMImportaDados do
  begin

    if RgTipo.ItemIndex = 0 then //exporta cadastro de clientes dos embarques
    begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_CADASTRO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;

      while not QExportaEmbarqueSmart.Eof do
      begin
        if wCliente <> QExportaEmbarqueSmartCOD_CADASTRO.Value then
        begin
          wArqCliente := wArqCliente + '        ' +
            copy(QExportaEmbarqueSmartNOME.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartDESC_FANTASIA.Text + '                    ', 1, 20) + '   ' +
            copy(QExportaEmbarqueSmartDESC_ENDERECO.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartDESC_BAIRRO.Text + '               ', 1, 15) +
            RMaskCGC_CPF(QExportaEmbarqueSmartDESC_CEP.Text, 8) +
            copy(QExportaEmbarqueSmartDESC_CIDADE.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartCOD_ESTADO.Text, 1, 2) +
            copy(QExportaEmbarqueSmartDESC_TELEFONE.Text + '            ', 1, 12) +
            copy(QExportaEmbarqueSmartNOME_CONTATO.Text + '          ', 1, 10) +
            '           ' + '00000' + ' ';
          if QExportaEmbarqueSmartIND_FISICA_JURIDICA.Text = 'F' then
            wArqCliente := wArqCliente + '2'
          else
            wArqCliente := wArqCliente + '1';
          wArqCliente := wArqCliente + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_CGC_CPF.Text, 14) +
            RMaskCGC_CPF(QExportaEmbarqueSmartNUM_INSCRICAO.Text, 13) +
            '                           ';
          wCliente := QExportaEmbarqueSmartCOD_CADASTRO.Value;
          QExportaEmbarqueSmart.Next;
          if not (QExportaEmbarqueSmart.Eof) then
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
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqCliente);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    end; //aqui acaba exportacao de clientes


    if RgTipo.ItemIndex = 1 then //exporta pedidos dos embarques
    begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY NUM_PEDIDO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      begin
        wArqPedido := wArqPedido + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_PEDIDO.Text, 11) +
          IfThen(DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE', '035', '034') +
          copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ', 1, 12) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 1, 2) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 4, 2) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 7, 4) + '00000000' + '  ' +
          '        ' + '      ' + RMaskCGC_CPF(QExportaEmbarqueSmartQT_PEDIDO.Text, 8) + '00956' +
          IntDecimais(QExportaEmbarqueSmartVAL_TOTAL.Text, 7, 2) + '   ' + '     ';
        QExportaEmbarqueSmart.Next;
        if not (QExportaEmbarqueSmart.Eof) then
          wArqPedido := wArqPedido + Chr(13) + Chr(10);
        inc(wCount1);
      end;
      wArqPedido := wArqPedido + Chr(13) + Chr(10) + 'F' + RMaskCGC_CPF(IntToStr(wCount1), 10);
      SaveDialog.FileName := 'Pedido';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqPedido);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    end;

    if RgTipo.ItemIndex = 2 then //exporta produtos dos embarques
    begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_PRODUTO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      begin
        if wProduto <> QExportaEmbarqueSmartCOD_PRODUTO.Value then
        begin
          wArqProduto := wArqProduto + copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ', 1, 12) +
            copy(QExportaEmbarqueSmartDESC_PRODUTO.Text + '                                                  ', 1, 50) +
            IntDecimais(QExportaEmbarqueSmartNUM_METROS_CUBICOS.Text, 12, 6) +
            IntDecimais(QExportaEmbarqueSmartPESO_BRUTO.Text, 12, 6) + '000000000' +
            copy(StringReplace(QExportaEmbarqueSmartNUM_EMBALAGEM.Text, ',', '', []) + '0000', 1, 4) +
            '0000' + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartCOD_NBM_SH.Text, 10) +
            Copy(QExportaEmbarqueSmartDESC_SITUACAO_TRIB.text + '  ', 1, 2);
          wProduto := StrToInt(QExportaEmbarqueSmartCOD_PRODUTO.Text);
          QExportaEmbarqueSmart.Next;
          if not (QExportaEmbarqueSmart.Eof) then
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
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqProduto);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    end;

    if RgTipo.ItemIndex = 3 then //exporta  embarques
    begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_CADASTRO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;

      while not QExportaEmbarqueSmart.Eof do
      begin
        if wCliente <> QExportaEmbarqueSmartCOD_CADASTRO.Value then
        begin
          wArqCliente := wArqCliente + '        ' +
            copy(QExportaEmbarqueSmartNOME.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartDESC_FANTASIA.Text + '                    ', 1, 20) + '   ' +
            copy(QExportaEmbarqueSmartDESC_ENDERECO.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartDESC_BAIRRO.Text + '               ', 1, 15) +
            RMaskCGC_CPF(QExportaEmbarqueSmartDESC_CEP.Text, 8) +
            copy(QExportaEmbarqueSmartDESC_CIDADE.Text + '                              ', 1, 30) +
            copy(QExportaEmbarqueSmartCOD_ESTADO.Text, 1, 2) +
            copy(QExportaEmbarqueSmartDESC_TELEFONE.Text + '            ', 1, 12) +
            copy(QExportaEmbarqueSmartNOME_CONTATO.Text + '          ', 1, 10) +
            '           ' + '00000' + ' ';
          if QExportaEmbarqueSmartIND_FISICA_JURIDICA.Text = 'F' then
            wArqCliente := wArqCliente + '2'
          else
            wArqCliente := wArqCliente + '1';
          wArqCliente := wArqCliente + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_CGC_CPF.Text, 14) +
            RMaskCGC_CPF(QExportaEmbarqueSmartNUM_INSCRICAO.Text, 13) +
            '                           ';
          wCliente := QExportaEmbarqueSmartCOD_CADASTRO.Value;
          QExportaEmbarqueSmart.Next;
          if not (QExportaEmbarqueSmart.Eof) then
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
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqCliente);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
     //aqui acaba exportacao de clientes

    //exporta pedidos dos embarques
    //Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY NUM_PEDIDO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      begin
        wArqPedido := wArqPedido + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartNUM_PEDIDO.Text, 11) +
          IfThen(DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE', '035', '034') +
          copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ', 1, 12) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 1, 2) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 4, 2) +
          copy(QExportaEmbarqueSmartDT_FATURAMENTO.Text, 7, 4) + '00000000' + '  ' +
          '        ' + '      ' + RMaskCGC_CPF(QExportaEmbarqueSmartQT_PEDIDO.Text, 8) + '00956' +
          IntDecimais(QExportaEmbarqueSmartVAL_TOTAL.Text, 7, 2) + '   ' + '     ';
        QExportaEmbarqueSmart.Next;
        if not (QExportaEmbarqueSmart.Eof) then
          wArqPedido := wArqPedido + Chr(13) + Chr(10);
        inc(wCount1);
      end;
      wArqPedido := wArqPedido + Chr(13) + Chr(10) + 'F' + RMaskCGC_CPF(IntToStr(wCount1), 10);
      SaveDialog.FileName := 'Pedido';
      SaveDialog.Filter := 'Arquivo de Embarques';
      SaveDialog.DefaultExt := 'Txt';
      SaveDialog.FilterIndex := 0;
      if FImportaDados.SaveDialog.Execute then
      begin
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqPedido);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    //end;

    //If RgTipo.ItemIndex = 2 then //exporta produtos dos embarques
    //Begin
      QExportaEmbarqueSmart.Close;
      for wCount := 0 to Lb40CodEmbarque.Items.Count - 1 do
      begin
        wAux := wAux + wVirgula + Lb40CodEmbarque.Items.Strings[wCount];
        wVirgula := ',';
      end;
      QExportaEmbarqueSmart.SetVariable('LISTA_EMBARQUE', wAux);
      QExportaEmbarqueSmart.SQL[QExportaEmbarqueSmart.SQL.Count - 1] := '';
      QExportaEmbarqueSmart.SQL.Add('ORDER BY COD_PRODUTO');
      QExportaEmbarqueSmart.Open;
      QExportaEmbarqueSmart.First;
      while not QExportaEmbarqueSmart.Eof do
      begin
        if wProduto <> QExportaEmbarqueSmartCOD_PRODUTO.Value then
        begin
          wArqProduto := wArqProduto + copy(QExportaEmbarqueSmartCOD_PRODUTO.Text + '            ', 1, 12) +
            copy(QExportaEmbarqueSmartDESC_PRODUTO.Text + '                                                  ', 1, 50) +
            IntDecimais(QExportaEmbarqueSmartNUM_METROS_CUBICOS.Text, 12, 6) +
            IntDecimais(QExportaEmbarqueSmartPESO_BRUTO.Text, 12, 6) + '000000000' +
            copy(StringReplace(QExportaEmbarqueSmartNUM_EMBALAGEM.Text, ',', '', []) + '0000', 1, 4) +
            '0000' + ' ' + RMaskCGC_CPF(QExportaEmbarqueSmartCOD_NBM_SH.Text, 10) +
            copy(QExportaEmbarqueSmartDESC_SITUACAO_TRIB.text + '  ', 1, 2);
          wProduto := StrToInt(QExportaEmbarqueSmartCOD_PRODUTO.Text);
          QExportaEmbarqueSmart.Next;
          if not (QExportaEmbarqueSmart.Eof) then
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
        AssignFile(F, FImportaDados.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, wArqProduto);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
        Lb40CodEmbarque.Clear();
      end
      else
        MessageDlg('Arquivo Não Gerado!', mtInformation, [mbOk], 0);
    end;
  end;
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
  begin
    Lb40CodEmbarque.Items.Add(Me40Embarque.Text);
    Me40Embarque.Text := '';
    Me40Embarque.SetFocus();
  end
  else
    ShowMessage('Informe Código Embarque');
end;

procedure TFImportaDados.Bt40ExcluirClick(Sender: TObject);
begin
  Lb40CodEmbarque.Items.Delete(Lb40CodEmbarque.ItemIndex);
end;

function TFImportaDados.DeletaChar(Texto, Char: string): string;
begin
  while pos(Char, texto) > 0 do
    delete(texto, pos(Char, texto), 1);
  Result := texto;
end;

procedure TFImportaDados.SpeedButton2Click(Sender: TObject);
var
  F: TextFile;
  S, wComando: string;
  wContador: Integer;
  wAux: string;
begin
  S := ''; // Inicializa valor da variavel.
  wContador := 0;
  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter := 'txt';

  DMOracle.DBCemapa.StartTransaction;
  try
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName); //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F, S);
    end;
    DMImportaDados.QRCIdadeDFC.Open;
    while not ((copy(S, 1, 1) = '')) do
    begin
      wAux := copy(S, 9, 40);
      wAux := UpperCase(RemoveAcento(wAux));
      //wAux := Bib.LimpaString(wAux,' ');
      DMImportaDados.QRCIdadeDFC.Insert;
      DMImportaDados.QRCIdadeDFCCOD_DFC.Value := StrToInt(copy(S, 1, 4));
      DMImportaDados.QRCidadeDFCDESC_CIDADE.Value := wAux;
      DMImportaDados.QRCidadeDFC.Post;
      Readln(F, S);
    end;
    DMOracle.DBCemapa.Commit;
    ShowMessage('Cidades Importadas com Sucesso!');
  except
    DMOracle.DBCemapa.Rollback;
    raise;
  end;

end;

procedure TFImportaDados.BitBtn16Click(Sender: TObject);
var wCont, wRegNaoImp, wInd: Integer;
  Desc, wUmidade, wCadastro: string;
  F: TextFile;
  S, wComando, wAux, wAchou: string;
  x, y: array of string;
begin
  if (Trim(MeFilial.Text) = '') or (Trim(EdFilialRomaneio.Text) = '') then // informar uma filial valida
    raise Exception.Create('Informar Codigo da Filial');
  if (Trim(MeUsuario.Text) = '') or (Trim(EdUsuarioRomaneio.Text) = '') then // informar um usuario valido
    raise Exception.Create('Informar Codigo do Usuário');

  OpenDialog1.InitialDir := 'c:\';
  OpenDialog1.Filter := 'txt';

  DMImportaDados.QRomaneio.Open;
  DMImportaDados.QRateioRomaneio.Open;
  wCont := 0;
  wRegNaoImp := 0;
  MEImp.Text := '';
  MENaoImp.Text := '';
  try
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName); //Pega arquivo selecionado em dialogo box
      reset(F);
      Readln(F, S);
    end;
  except
    raise exception.Create('Não foi possivel abrir o arquivo');
  end;
  setLength(x, 3); //3 sql diferentes
  setLength(y, 3);

  DMOracle.DBCemapa.StartTransaction;
  try
    while copy(S, 1, 1) <> '' do
    begin
      wAux := copy(S, 1, 248);
      wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO', 'NUM_CGC_CPF = ' + Chr(39) + Trim(copy(S, 55, 18)) + Chr(39));
      if wCadastro = '' then
      begin
        ShowMessage('Nao Existe cadastro para este Cpf:' + Trim(copy(S, 55, 18)));
        Inc(wRegNaoImp);
      end
      else
      begin
        wAchou := DMOracle.BuscaNome('SELECT COD_ROMANEIO_AGRICOLA FROM TB_ROMANEIO_AGRICOLA', 'NUM_ROMANEIO = ' + copy(S, 1, 6) + ' AND COD_CADASTRO = ' + wCadastro + ' AND COD_FILIAL = ' + Trim(MeFilial.Text));
        if wAchou <> '' then // para nao importar o mesmo romaneio mais do que uma vez
        begin
          Readln(F, S);
          Continue;
        end;
        DMImportaDados.QRomaneio.Insert;
        DMImportaDados.QRomaneioCod_Romaneio_Agricola.Value := DMOracle.Sequencia('ROMANEIO');
        DMImportaDados.QRomaneioNUM_ROMANEIO.Value := StrToInt(copy(S, 1, 6));
        DMImportaDados.QRomaneioCOD_PRODUTO.Value := StrToInt(Trim(copy(S, 226, 6)));
        DMImportaDados.QRomaneioCOD_CADASTRO.Value := StrToInt(wCadastro);
        DMImportaDados.QRomaneioCOD_FILIAL.Value := StrToInt(Trim(MeFilial.Text));
        DMImportaDados.QRomaneioDT_EMISSAO.Value := StrToDate(copy(S, 07, 2) + '/' + copy(S, 09, 2) + '/' + copy(S, 11, 4));
        DMImportaDados.QRomaneioQT_PESO_BRUTO.Value := StrToInt(copy(S, 167, 9));
        DMImportaDados.QRomaneioQT_TARA.Value := StrToInt(copy(S, 176, 9));
        DMImportaDados.QRomaneioDESC_PLACA.Text := Trim(copy(S, 159, 8));
        DMImportaDados.QRomaneioPERC_UMIDADE.Value := StrToFloat(copy(S, 209, 3)) / 10;
        DMImportaDados.QRomaneioPERC_IMPUREZA.Value := StrToFloat(copy(S, 212, 3)) / 10;
        DMImportaDados.QRomaneioPERC_ARDIDOS.Value := StrToFloat(copy(S, 215, 3)) / 10;
        DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := StrToFloat(copy(S, 218, 3)) / 10;
        DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := 0;
        if (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 41) or
          (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1723) or
          (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1731) then
          if DMImportaDados.QRomaneioPERC_QUEBRADOS.Value > 30 then
            DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := DMImportaDados.QRomaneioPERC_QUEBRADOS.Value - 30 * 0.5; // tolera 30%

        if (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 42) then
          if DMImportaDados.QRomaneioPERC_QUEBRADOS.Value > 3 then
            DMImportaDados.QRomaneioPERC_QUEBRADOS.Value := DMImportaDados.QRomaneioPERC_QUEBRADOS.Value - 3; // tolera 3%

        DMImportaDados.QRomaneioPERC_TRIGUILHO.Value := StrToFloat(copy(S, 221, 3)) / 10;
        DMImportaDados.QRomaneioPERC_PH.Value := StrToFloat(copy(S, 224, 2));
   //        QRomaneioDESC_OBSERVACAO.Value := TRomaneioOBSERVACAO.Value;
        DMImportaDados.QRomaneioDT_MOVIMENTO.Value := Date;
        DMImportaDados.QRomaneioPERC_AVARIADO.Value := 0;
        DMImportaDados.QRomaneioNUM_CLASSIFICACAO.Value := StrToInt(copy(S, 232, 6)); ;
   //        QRomaneioNUM_TICKET.Value := Trunc(TRomaneioNRTICKET.Value);
        DMImportaDados.QRomaneioPERC_DIVERSOS.Value := 0;
        if (Trim(copy(S, 153, 6)) <> '999999') and (Trim(copy(S, 153, 6)) <> '009999') then
          DMImportaDados.QRomaneioNUM_NOTA_PRODUTOR.Value := StrToInt(copy(S, 153, 6))
        else
          DMImportaDados.QRomaneioNUM_NOTA_PRODUTOR.Value := 0;
        DMImportaDados.QRomaneioIND_EMITIDO.Value := 'A';
        DMImportaDados.QRomaneioCOD_USUARIO.Value := StrToInt(Trim(MeUsuario.Text));
        wUmidade := DMImportaDados.QRomaneioPERC_UMIDADE.Text;
        for Wind := 1 to Length(DMImportaDados.QRomaneioPERC_UMIDADE.Text) do
          if wUmidade[wInd] = ',' then
            wUmidade[wInd] := '.';
        if (DMImportaDados.QRomaneioCod_Produto.value > 0) and (DMImportaDados.QRomaneioPerc_Umidade.value > 0) then
          Desc := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_DESCONTO_AGRICOLA', 'COD_PRODUTO = ' + DMImportaDados.QRomaneioCod_Produto.text + ' AND PERC_UMIDADE =' + wUMIDADE + ' AND COD_FILIAL = ' + Trim(MeFilial.Text));
        if Desc <> '' then
          DMImportaDados.QRomaneioPerc_desconto.Value := StrToFloat(Desc)
        else
          DMImportaDados.QRomaneioPerc_desconto.Value := 0;
        DMImportaDados.QRomaneioIND_SITUACAO.Value := 'E';
        DMImportaDados.QRomaneioIND_TIPO_ROMANEIO.Value := 'ROMANEIO';
        DMImportaDados.QRomaneioDT_PRIMEIRA_PESAGEM.Value := DMOracle.DataHoraServ;
        DMImportaDados.QRomaneioDT_SEGUNDA_PESAGEM.Value := DMOracle.DataHoraServ;

        x[0] := 'SELECT PERC_TOLERA_ARDIDOS FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO=' + DMImportaDados.QRomaneioCod_Produto.text;
        x[1] := 'SELECT PERC_TOLERA_AVARIADO FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO=' + DMImportaDados.QRomaneioCod_Produto.text;
        x[2] := 'SELECT PERC_TOLERA_IMPUREZA FROM TB_PRODUTO_AGRICOLA WHERE COD_PRODUTO=' + DMImportaDados.QRomaneioCod_Produto.text;

        DMOracle.BuscaNomes(x, y);
        DMImportaDados.QRomaneioPerc_Tolera_Ardidos.Value := StrToFloat(y[0]);
        DMImportaDados.QRomaneioPerc_Tolera_Avariado.Value := StrToFloat(y[1]);
        DMImportaDados.QRomaneioPerc_Tolera_Impureza.Value := StrToFloat(y[2]);
        if (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 41) or
          (DMImportaDados.QRomaneioCOD_PRODUTO.Value = 1723) then
        begin
          DMImportaDados.QRomaneioPerc_Tolera_Impureza.Value := 1;
        end;
        DMImportaDados.QRomaneioCod_Cadastro_Parceiro.Value := 6869;
        DMImportaDados.QRomaneioDt_Ano_Safra.Text := DMOracle.BuscaNome('SELECT DT_ANO_SAFRA FROM TB_PARAM_SISTEMA', 'COD_FILIAL >= 1');
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
      end;
      Readln(F, S);
    end;
    if (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  except
    DMOracle.DBCemapa.RollBack;
    raise Exception.Create('Importação Abortada');
  end;
end;

procedure TFImportaDados.SpeedButton3Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFImportaDados.SpeedButton4Click(Sender: TObject);
begin
  if FUsuarioCons = nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.ShowModal = mrOk then
    MeUsuario.Text := DMUsuario.QUsuarioConsCod_Usuario.Text;

end;

procedure TFImportaDados.MeFilialChange(Sender: TObject);
begin
  if Trim(MeFilial.Text) <> '' then
    EdFilialRomaneio.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(MeFilial.Text));

end;

procedure TFImportaDados.MeUsuarioChange(Sender: TObject);
begin
  if Trim(MeUsuario.Text) <> '' then
    EdUsuarioRomaneio.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + Trim(MeUsuario.Text));

end;

procedure TFImportaDados.BtnExportarSyngentaClick(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  begin
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
    begin
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
    end;

    CloseFile(arq);
  end;

  MessageDlg('Exportação concluída com sucesso.' + #13 + #10 + 'Arquivos gerados em ''C:\X_EMPRESA-DATA_MOVIM_SKU.txt''.', mtWarning, [mbOK], 0);
end;

procedure TFImportaDados.SpeedButton5Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me1Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFImportaDados.Sb1FornecedorClick(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    Me1CodFornecedor.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFImportaDados.Me1CodFornecedorExit(Sender: TObject);
begin
  if Trim(Me1CodFornecedor.Text) <> '' then
    Ed1Nome.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(Me1CodFornecedor.Text))
  else
    Ed1Nome.Text := 'Todos ';
end;

procedure TFImportaDados.ME1NumClasseExit(Sender: TObject);
begin
  if Trim(Me1NumClasse.Text) <> '' then
    Me1DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + Trim(Me1NumClasse.Text) + ' And NUM_SUBCLASSE=0')
  else
    ME1DescClasse.Text := 'Todas ';
end;

procedure TFImportaDados.SB1ClasseClick(Sender: TObject);
begin
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
    ME1NumClasse.Text := FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
  ME1NumClasseExit(Self);
end;

procedure TFImportaDados.Me1SubClassesExit(Sender: TObject);
begin
  if Trim(Me1SubClasses.Text) <> '' then
    Ed1SubClasses.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE', 'NUM_CLASSE = ' + Trim(Me1NumClasse.Text) + ' And NUM_SUBCLASSE=' + Trim(Me1SubClasses.Text))
  else
    Ed1SubClasses.Text := 'Todas';
end;

procedure TFImportaDados.SB1ClasseFinalClick(Sender: TObject);
begin
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
    Me1SubClasses.Text := FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
  Me1SubClassesExit(Self);
end;

procedure TFImportaDados.Me1FilialExit(Sender: TObject);
begin
  if Trim(Me1Filial.Text) <> '' then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(Me1Filial.Text))
  else
    Ed1Filial.Text := 'Todas ';
end;

procedure TFImportaDados.BitBtn18Click(Sender: TObject);
var arq: TextFile;
begin
  DMParamSistema.QParamSistema.Close;
  DMParamSistema.QParamSistema.open;

  with DMImportaDados do
  begin
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
    begin
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
    end;

    CloseFile(arq);
  end;

  MessageDlg('Exportação concluída com sucesso.' + #13 + #10 + 'Arquivos gerados em ''C:\X_EMPRESA-DATA_MOVIM_DFU.txt''.', mtWarning, [mbOK], 0);
end;

function TFImportaDados.AjustaStr(str: string; tam: Integer): string;
begin
  while Length(str) < tam do
    str := str + ' ';
  if Length(str) > tam then
    str := Copy(str, 1, tam);
  Result := str;
end;

function TFImportaDados.CortaStr(str: string; tam: Integer): string;
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
  begin
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
    begin
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
    end;

    CloseFile(arq);
  end;

  MessageDlg('Exportação concluída com sucesso.' + #13 + #10 + 'Arquivos gerados em ''C:\X_EMPRESA-EXCLUSAO-DATA_LIN_PED_COLOCADO.txt''.', mtWarning, [mbOK], 0);
end;

procedure TFImportaDados.BitBtn20Click(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TVendedor.Open;
    QVendedor.Open;
    TVendedor.First;
    PB.Max := TVendedor.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TVendedor.Eof do
    begin

      try
        QVendedor.Insert;
        QVendedorCOD_VENDEDOR.Text := TVendedorFUN_COD.Text;
        QVendedorCOD_ESTADO.Value := TVendedorFUN_UF.Value;
        QVendedorNOME.Value := TVendedorFUN_NOME.Value;
        QVendedorDESC_ENDERECO.Value := TVendedorFUN_END.Value;
        QVendedorDESC_CIDADE.Value := TVendedorFUN_CID.Value;
        QVendedorDESC_TELEFONE.Value := TVendedorFUN_TEL.Value;
        QVendedorDESC_CELULAR.Value := TVendedorFUN_TEL2.Value;
//        QVendedorDT_NASCIMENTO.Value := TVendedorDTNASCIM.Value;
        QVendedorDESC_CPF.Value := TVendedorFUN_CGC.Value;
        QVendedorDESC_IDENTIDADE.Value := TVendedorFUN_INSCR.Value;
        QVendedorPERC_COMISSAO1.Value := TVendedorFUN_COMIS.Value;
        QVendedorPERC_COMISSAO2.Value := TVendedorFUN_COMIS3.Value;
        QVendedorPERC_IRRF.Value := 0;
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
      except
        if QVendedor.State = dsInsert then
          QVendedor.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TVendedor.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.BtRomaneioClick(Sender: TObject);
var wCont: Integer;
  wRegNaoImp, wInd: Integer;
  Desc, wUmidade: string;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TRomaneio.Filter := 'DTEMISSAO >= ' + CHR(39) + MEDataInicial.Text + Chr(39);
    TRomaneio.Open;
    QRomaneio.Open;
    QRateioRomaneio.Open;
    TRomaneio.First;
    PB.Max := TRomaneio.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TRomaneio.Eof do
    begin
      try
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
        for Wind := 1 to Length(trim(TRomaneioUMIDADE.text)) do
          if wUmidade[wInd] = ',' then
            wUmidade[wInd] := '.';
        if (QRomaneioCod_Produto.value > 0) and (QRomaneioPerc_Umidade.value > 0) then
          Desc := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_DESCONTO_AGRICOLA', 'COD_PRODUTO = ' + QRomaneioCod_Produto.text + ' AND PERC_UMIDADE =' + wUMIDADE);
        if Desc <> '' then
          QRomaneioPerc_desconto.Value := StrToFloat(Desc)
        else
          QRomaneioPerc_desconto.Value := 0;
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
      except
        if TRomaneio.State = dsInsert then
          TRomaneio.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TRomaneio.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;

end;

procedure TFImportaDados.BtFinalidadeClick(Sender: TObject);
var wCont: Integer;
  wRegNaoImp: Integer;
begin
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TFinalidade.Open;
    QFinalidade.Open;
    QFinalidade.First;
    PB.Max := QFinalidade.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not TFinalidade.Eof do
    begin
      try
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
      except
        if QFinalidade.State = dsInsert then
          QFinalidade.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TFinalidade.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

function TFImportaDados.LimpaNumero(num: string): string;
var
  i: integer;
begin
  result := '';
  num := trim(num);
  for i := 1 to Length(num) do
    if num[i] in ['0'..'9'] then
      result := result + num[i];
end;

function TFImportaDados.LimpaDocumento(num: string): string;
var
  i: integer;
begin
  result := '';
  num := trim(num);
  for i := 1 to Length(num) do
    if ((num[i] in ['0'..'9']) or (num[i] = '-') or (num[i] = '/') or (num[i] = '.')) then
      result := result + num[i];
end;

procedure TFImportaDados.BitBtn5Click(Sender: TObject);
var wCont, wInd: Integer;
  wRegNaoImp: Integer;
  wFone: string;

  wPais, wEstado, wDescCidade: string;
  wCidade: Integer;
  wTipoCliente: Integer;
begin
{  Memo1.Lines.Clear;
  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    TClientes.Open;
    QCadastro.Open;
    TClientes.First;
    PB.Max := TClientes.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wPais := DMOracle.FastSelect('COD_PAIS', 'TB_PAIS', 'TRIM(UPPER(DESC_PAIS)) = TRIM(UPPER(' + QuotedStr('BRASIL') + '))');
    wTipoCliente := StrToInt(DMOracle.FastSelect('COD_TIPO_CADASTRO_CLIENTE', 'TB_PARAM_SISTEMA'));
    DMOracle.DBCEmapa.StartTransaction;
    while not TClientes.Eof do
    begin
      try
        if TClientesC_ID.Value = 0 then // a partir daqui para fornecedores
        begin
          TClientes.Next;
          Continue;
        end;
        if Trim(TClientesC_UF.Text) <> '' then
          if DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO', 'COD_ESTADO = ' + Chr(39) + UpperCase(TClientesC_UF.Text) + Chr(39)) = '' then
            ShowMessage('Estado inexistente ' + TClientesC_UF.Text);

        // Procura Cidade (Início)

        wCidade := -1;
        wEstado := '';
        wDescCidade := '';
        QCidadeNome.Close;
        QCidadeNome.SetVariable('DESC_CIDADE', TClientesC_CID.Value);
        if ((TClientesC_UF.IsNull) or (TClientesC_UF.Value = '')) then
          QCidadeNome.SetVariable('COD_ESTADO', 'PR')
        else
          QCidadeNome.SetVariable('COD_ESTADO', TClientesC_UF.Value);
        QCidadeNome.Open;
        if not QCidadeNome.IsEmpty then
        begin
          wCidade := QCidadeNomeCOD_CIDADE.Value;
          wEstado := QCidadeNomeCOD_ESTADO.Value;
          wDescCidade := QCidadeNomeDESC_CIDADE.Value;
        end;

        // Procura Cidade (Fim)

        QCadastro.Insert;
        QCadastroCOD_CADASTRO.Value := DMOracle.Sequencia('CADASTRO');
        QCadastroCOD_CADASTRO_NOVO.Value := Trunc(TClientesC_ID.Value);

        if Trim(TClientesC_NOME.Value) <> '' then
          QCadastroNOME.Value := TClientesC_NOME.Value
        else
          QCadastroNOME.Value := '.';
        QCadastroDESC_FANTASIA.Value := TClientesC_FANTAS.Value;
        QCadastroDESC_ENDERECO.Value := TClientesC_END.Value;
        if ((not TClientesC_NUM.IsNull) and (LimpaNumero(TClientesC_NUM.Value) <> '')) then
          QCadastroDESC_ENDERECO.Value := QCadastroDESC_ENDERECO.Value + ', ' + LimpaNumero(TClientesC_NUM.Value);
        if wCidade = -1 then
          QCadastroDESC_CIDADE.Value := TClientesC_CID.Value
        else
        begin
          QCadastroDESC_CIDADE.Value := wDescCidade;
          QCadastroCOD_CIDADE.Value := wCidade;
          QCadastroCOD_ESTADO.Value := wEstado;
        end;
        QCadastroDESC_CEP.Value := tClientesc_CEP.Text;
        if ((TClientesC_RG.IsNull) or (LimpaNumero(TClientesC_RG.Value) = '')) then
          QCadastroNUM_INSCRICAO.Value := LimpaDocumento(TClientesC_INSCEST.Value)
        else
          QCadastroNUM_INSCRICAO.Value := LimpaDocumento(TClientesC_RG.Value);
        if (
          ((TClientesC_TELEFONE.IsNull) or (LimpaNumero(TClientesC_TELEFONE.Value) = ''))
          and
          ((not TClientesC_TELE2.IsNull) and (LimpaNumero(TClientesC_TELE2.Value) <> ''))
          ) then
          QCadastroDESC_TELEFONE.Value := LimpaNumero(TClientesC_TELE2.Value)
        else
          QCadastroDESC_TELEFONE.Value := LimpaNumero(TClientesC_TELEFONE.Value);
        QCadastroDESC_CELULAR.Value := LimpaNumero(TClientesC_CELULAR.Value);
        QCadastroDESC_FAX.Value := LimpaNumero(TClientesC_FAX.Value);
        if Trim(TClientesC_TIPO.Value) = 'F' then
        begin
          QCadastroNUM_CGC_CPF.Value := LimpaNumero(TClientesC_CPF.Value);
          QCadastroIND_FISICA_JURIDICA.Value := 'F';
        end
        else
        begin
          QCadastroNUM_CGC_CPF.Value := LimpaNumero(TClientesC_CGC.Value);
          QCadastroIND_FISICA_JURIDICA.Value := 'J';
        end;
        QCadastroDESC_BAIRRO.Value := TClientesC_BAI.Value;
        QCadastroDT_CADASTRO.Value := TClientesC_DTCAD.Value;
        QCadastroDESC_INTEGRACAO.Value := TClientesC_INTEGRAG.Value;
        if wPais <> '' then
          QCadastroCOD_PAIS.Value := StrToInt(wPais);
        QCadastroCOD_REGIAO.Value := 1;

        QCadastroCOD_CLASS_CADASTRO.Value := 1;
        QCadastroIND_SEXO_CATEGORIA.Value := 'M';
        QCadastroCOD_RAMO.Value := 1;
//        If TCadastroCDVENDED.Value = 0 then
//          QCadastroCOD_VENDEDOR.Value := 1
//        Else
//          QCadastroCOD_VENDEDOR.Value :=  Trunc(TCadastroCDVENDED.Value);
        QCadastroCOD_TIPO_CADASTRO.Value := wTipoCliente;

        QCadastroDESC_E_MAIL.Value := TClientesC_EMAIL.Text;
        QCadastroIND_SEPROC_SIMNAO.Value := 'N';
        QCadastro.Post;
      except
        if QCadastro.State = dsInsert then
          QCadastro.Cancel;
        Inc(wRegNaoImp);
      end;
      Inc(wCont);
      PB.Position := wCont;
      TClientes.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;     }
end;

procedure TFImportaDados.BtImportaCp_CabClick(Sender: TObject);
var wCont, wCont1: Integer;
  wRegNaoImp, wContCommit, wCad, wContParcela: Integer;
  wNumero, wParc, wCadString, wTitAnterior, wSerieAnterior, wClienteAnterior: string;
  query: TOracleDataSet1;
  wCP: Integer;
//  liberado: boolean;
begin
  importarCP;

  Exit;

  if (MessageDlg('Já importou os produtos, clientes, fornecedores e vendedores né tio?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
//    CdCP_Cab.Filter := 'DUP_FOR = 1 OR DUP_FOR = 56 OR DUP_FOR = 870 OR DUP_FOR = 8604 OR DUP_FOR = 8611 OR DUP_FOR = 8653';
//    CdCP_Cab.Filtered := True;
    if CdCP_Cab.Active = False then
      CdCP_Cab.Open;
    CdCP_Cab.First;
    PB.Max := CdCP_Cab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    wContParcela := 0;
    DMOracle.DBCEmapa.StartTransaction;
//    liberado := false;
    while not CdCP_Cab.Eof do
    begin
      try
        wNumero := DMImportaDados.extraiNumTitulo(CdCP_CabDUP_NUM.Value);
//        wNumero := Bib.LimpaNumero(wNumero);

//        if Length(wNumero) = 10 then
//          liberado := true;
//        if not liberado then
//        begin
//          inc(wCont);
//          CdCP_Cab.Next;
//          Continue;
//        end;

        if wTitAnterior = '' then
          wTitAnterior := wNumero;
        if wClienteAnterior = '' then
          wClienteAnterior := CdCP_CabDUP_FOR.Text;
        if wSerieAnterior = '' then
          wSerieAnterior := Trim(CdCP_CabDUP_SERIE.Value);

        if ((wTitAnterior = wNumero) and (wSerieAnterior = Trim(CdCP_CabDUP_SERIE.Value)) and (wClienteAnterior = CdCP_CabDUP_FOR.Text)) then
          Inc(wContParcela)
        else
          wContParcela := 1;
        wParc := IntToStr(wContParcela);
        wTitAnterior := wNumero;
        wClienteAnterior := CdCP_CabDUP_FOR.Text;
        wSerieAnterior := Trim(CdCP_CabDUP_SERIE.Value);

        if (CdCP_CabDUP_FOR.Value > 0) then
        begin
          query := bib.executaQueryString('SELECT COD_CADASTRO FROM TB_CADASTRO WHERE COD_CADASTRO_NOVO = ' + CdCP_CabDUP_FOR.Text + ' AND COD_TIPO_CADASTRO = 2');
          wCadString := Bib.pegaValor(query, 'COD_CADASTRO');
          Bib.fechaQuery(query);
          if wCadString <> '' then
          begin
            wCad := StrToInt(wCadString);

            wCP := DMOracle.Sequencia('CONTA_PAGAR');

            if (not QCP_Cab.Active) then
            begin
              QCP_Cab.Close;
              QCP_Cab.SetVariable('PK', wCP);
              QCP_Cab.Open;
            end;

            QCP_Cab.Insert;
            QCP_CabCOD_DEPARTAMENTO.Value := 1;
            QCP_CabDT_BAIXA.Text := CdCP_CabDUP_DTPGTO.Text;
            QCP_CabCOD_CADASTRO.Value := wCad;
            if (CdCP_CabDUP_DTV.Text <> '/  /') and (CdCP_CabDUP_DTV.Text <> '') then
              QCP_CabDT_VENCIMENTO.Text := CdCP_CabDUP_DTV.Text
            else
              QCP_CabDT_VENCIMENTO.Text := CdCP_CabDUP_EMI.Text;
            QCP_CabDT_EMISSAO.Text := CdCP_CabDUP_EMI.Text;
            QCP_CabNUM_PARCELA.Value := StrToInt(wParc);
            QCP_CabNUM_TITULO.Value := StrToFloat(wNumero);
            QCP_CabVAL_ORIGINAL.Value := CdCP_CabDUP_VLR.Value;
//            QCP_CabVAL_JUROS.Value := 0;
            QCP_CabDT_MOVIMENTO.Text := CdCP_CabDUP_EMI.Text;
            QCP_CabDT_CAPITALIZACAO.Text := QCP_CabDT_VENCIMENTO.Text;
            QCP_CabIND_SITUACAO.Value := 'ABERTO';
            QCP_CabVAL_TITULO.Value := QCP_CabVAL_ORIGINAL.Value;
            if CdCP_CabDUP_RECEB.Value = 'B' then
            begin
              QCP_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
              QCP_CabDT_BAIXA.Value := CdCP_CabDUP_DTPGTO.Value;
              QCP_CabVAL_TITULO.Value := 0;
            end;
            QCP_CabCOD_FILIAL.Value := 1;
//            QCP_CabCod_Vendedor.Value := CdCP_CabDUP_VEN.Value;
            QCP_CabDESC_TIPO_DOCUMENTO.Value := CdCP_CabDUP_SERIE.Text;
            QCP_CabCOD_FINALIDADE.Value := 3;
            QCP_CabCOD_CONTA_PAGAR_CAB.Value := wCP;
            QCP_CabIND_ACEITE.Value := 'SIM';
//            QCP_CabPERC_COMISSAO.Value := 0;
//            QCP_CabPERC_COMISSAO1.Value := 0;

            try
              QCP_Cab.Post;
            except
              on e: Exception do
                MessageDlg(e.Message + #13 + #10 + CdCP_CabDUP_NUM.value, mtError, [mbOK], 0);
            end;

            QCP_Mov.Close;
            QCP_Mov.SetVariable('PK', wCP);
            QCP_Mov.Open;

            QCP_Mov.Insert;
            QCP_MovCOD_CONTA_PAGAR_MOV.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
            QCP_MovCOD_CONTA_PAGAR_CAB.Value := wCP;
            QCP_MovDT_MOVIMENTO.Text := QCP_CabDT_EMISSAO.Text;
            QCP_MovVAL_MOVIMENTO.Value := QCP_CabVAL_ORIGINAL.Value;
            QCP_MovCOD_USUARIO.Value := 1;
            QCP_MovDT_USUARIO.Value := Date;
            QCP_MovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
            QCP_Mov.Post;
            if CdCP_CabDUP_RECEB.Value = 'B' then
            begin
              QCP_Mov.Insert;
              QCP_MovCOD_CONTA_PAGAR_MOV.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
              QCP_MovCOD_CONTA_PAGAR_CAB.Value := wCP;
              QCP_MovDT_MOVIMENTO.Text := CdCP_CabDUP_DTPGTO.Text;
              QCP_MovVAL_MOVIMENTO.Value := QCP_CabVAL_ORIGINAL.Value;
              QCP_MovCOD_USUARIO.Value := 1;
              QCP_MovDT_USUARIO.Value := Date;
              QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
              QCP_Mov.Post;
            end;
            if CdCP_CabDUP_DESC.Value > 0 then
            begin
              QCP_Mov.Insert;
              QCP_MovCOD_CONTA_PAGAR_MOV.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
              QCP_MovCOD_CONTA_PAGAR_CAB.Value := wCP;
              QCP_MovDT_MOVIMENTO.Text := CdCP_CabDUP_DTPGTO.Text;
              QCP_MovVAL_MOVIMENTO.Value := CdCP_CabDUP_DESC.Value;
              QCP_MovCOD_USUARIO.Value := 1;
              QCP_MovDT_USUARIO.Value := Date;
              QCP_MovIND_TIPO_MOVIMENTO.Value := 'DESCONTO';
              QCP_Mov.Post;
            end;
            if CdCP_CabDUP_VLJ.Value > 0 then
            begin
              QCP_Mov.Insert;
              QCP_MovCOD_CONTA_PAGAR_MOV.Value := DMOracle.Sequencia('CONTA_PAGAR_MOV');
              QCP_MovCOD_CONTA_PAGAR_CAB.Value := wCP;
              QCP_MovDT_MOVIMENTO.Text := CdCP_CabDUP_DTPGTO.Text;
              QCP_MovVAL_MOVIMENTO.Value := CdCP_CabDUP_VLJ.Value;
              QCP_MovCOD_USUARIO.Value := 1;
              QCP_MovDT_USUARIO.Value := Date;
              QCP_MovIND_TIPO_MOVIMENTO.Value := 'PGTO. JUROS';
              QCP_Mov.Post;
            end;

          end
          else
            MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - wCadString = VAZIO');
        end
        else
          MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - DUP_FOR <= 0');
      except
        on e: Exception do
        begin
          MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - ERRO (' + e.Message + ')');
//                raise Exception.Create(e.Message + #13 + #10 + CdCP_CabDUP_NUM.Value);

          if QCP_Cab.State = dsInsert then
            QCP_Cab.Cancel;
          Inc(wRegNaoImp);
        end;
      end;
      Inc(wCont);
      Inc(wContCommit);
      if wContCommit > 2000 then
      begin
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;

        QCP_Cab.Close;
        QCP_Cab.SetVariable('PK', wCP);
        QCP_Cab.Open;
      end;
      PB.Position := wCont;
      CdCP_Cab.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

procedure TFImportaDados.BitBtn9Click(Sender: TObject);
begin
  with DMImportaDados do
  begin
    CdCP_Cab.Close;
    CdCP_Cab.Filter := 'DUP_NUM LIKE ' + QuotedStr('1069831%') + ' AND DUP_FOR = 690';
    CdCP_Cab.Filtered := True;
    CdCP_Cab.Open;
    CdCP_Cab.First;
  end;
end;

procedure TFImportaDados.BitBtn21Click(Sender: TObject);
var wCadString: string;
  query: TOracleDataSet1;
  i: Integer;
  achou: boolean;
begin
  with DMImportaDados do
  begin
    CdCP_Cab.Close;
    CdCP_Cab.Open;
    PB.Max := CdCP_Cab.RecordCount;
    CdCP_Cab.First;
    TCadastro.Open;
    while not CdCP_Cab.Eof do
    begin
      TCadastro.First;
      if not TCadastro.Locate('FOR_COD', CdCP_CabDUP_FOR.Value, []) then
//      query := bib.executaQueryString('SELECT COD_CADASTRO FROM TB_CADASTRO WHERE COD_CADASTRO_NOVO = ' + CdCP_CabDUP_FOR.Text + ' AND COD_TIPO_CADASTRO = 2');
//      wCadString := Bib.pegaValor(query, 'COD_CADASTRO');
//      Bib.fechaQuery(query);
//      if wCadString = '' then
      begin
        achou := False;
        for i := 0 to MCP.Lines.Count - 1 do
          if MCP.Lines[i] = CdCP_CabDUP_FOR.Text then
          begin
            achou := true;
            Break;
          end;
        if not achou then
          MCP.Lines.Add(CdCP_CabDUP_FOR.Text);
      end;

      CdCP_Cab.Next;
      PB.Position := CdCP_Cab.RecNo;
    end;
  end;
end;

procedure TFImportaDados.importarCP;
var wCont, wCont1: Integer;
  wRegNaoImp, wContCommit, wCad, wContParcela: Integer;
  wNumero, wParc, wCadString, wTitAnterior, wSerieAnterior, wClienteAnterior: string;
  query: TOracleDataSet1;
  wCP: Integer;
begin
  if (MessageDlg('Já importou os produtos, clientes, fornecedores e vendedores né tio?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  MEImp.Text := '';
  MENaoImp.Text := '';
  with DMImportaDados do
  begin
    if CdCP_Cab.Active = False then
      CdCP_Cab.Open;
    CdCP_Cab.First;
    PB.Max := CdCP_Cab.RecordCount;
    wCont := 0;
    wRegNaoImp := 0;
    wContCommit := 0;
    wContParcela := 0;
    DMOracle.DBCEmapa.StartTransaction;
    while not CdCP_Cab.Eof do
    begin
      try
        wNumero := DMImportaDados.extraiNumTitulo(CdCP_CabDUP_NUM.Value);
        if wTitAnterior = '' then
          wTitAnterior := wNumero;
        if wClienteAnterior = '' then
          wClienteAnterior := CdCP_CabDUP_FOR.Text;
        if wSerieAnterior = '' then
          wSerieAnterior := Trim(CdCP_CabDUP_SERIE.Value);

        if ((wTitAnterior = wNumero) and (wSerieAnterior = Trim(CdCP_CabDUP_SERIE.Value)) and (wClienteAnterior = CdCP_CabDUP_FOR.Text)) then
          Inc(wContParcela)
        else
          wContParcela := 1;
        wParc := IntToStr(wContParcela);
        wTitAnterior := wNumero;
        wClienteAnterior := CdCP_CabDUP_FOR.Text;
        wSerieAnterior := Trim(CdCP_CabDUP_SERIE.Value);

        if (CdCP_CabDUP_FOR.Value > 0) then
        begin
          query := bib.executaQueryString('SELECT COD_CADASTRO FROM TB_CADASTRO WHERE COD_CADASTRO_NOVO = ' + CdCP_CabDUP_FOR.Text + ' AND COD_TIPO_CADASTRO = 2');
          wCadString := Bib.pegaValor(query, 'COD_CADASTRO');
          Bib.fechaQuery(query);
          if wCadString <> '' then
          begin
            wCad := StrToInt(wCadString);

            wCP := DMOracle.Sequencia('CONTA_PAGAR');

            QInsCPCab.Close;
            QInsCPCab.SetVariable('COD_DEPARTAMENTO', 1);
            QInsCPCab.SetVariable('DT_BAIXA', CdCP_CabDUP_DTPGTO.Value);
            QInsCPCab.SetVariable('COD_CADASTRO', wCad);
            if (CdCP_CabDUP_DTV.Text <> '/  /') and (CdCP_CabDUP_DTV.Text <> '') then
            begin
              QInsCPCab.SetVariable('DT_VENCIMENTO', CdCP_CabDUP_DTV.Text);
              QInsCPCab.SetVariable('DT_CAPITALIZACAO', CdCP_CabDUP_DTV.Text);
            end
            else
            begin
              QInsCPCab.SetVariable('DT_VENCIMENTO', CdCP_CabDUP_EMI.Text);
              QInsCPCab.SetVariable('DT_CAPITALIZACAO', CdCP_CabDUP_EMI.Text);
            end;
            QInsCPCab.SetVariable('DT_EMISSAO', CdCP_CabDUP_EMI.Value);
            QInsCPCab.SetVariable('NUM_PARCELA', StrToInt(wParc));
            QInsCPCab.SetVariable('NUM_TITULO', StrToFloat(wNumero));
            QInsCPCab.SetVariable('VAL_ORIGINAL', CdCP_CabDUP_VLR.Value);
            QInsCPCab.SetVariable('DT_MOVIMENTO', CdCP_CabDUP_EMI.Value);
            QInsCPCab.SetVariable('IND_SITUACAO', 'ABERTO');
            QInsCPCab.SetVariable('VAL_TITULO', CdCP_CabDUP_VLR.Value);
            if CdCP_CabDUP_RECEB.Value = 'B' then
            begin
              QInsCPCab.SetVariable('IND_SITUACAO', 'BAIXA TOTAL');
              QInsCPCab.SetVariable('DT_BAIXA', CdCP_CabDUP_DTPGTO.Value);
              QInsCPCab.SetVariable('VAL_TITULO', 0);
            end;
            QInsCPCab.SetVariable('COD_FILIAL', 1);
            QInsCPCab.SetVariable('DESC_TIPO_DOCUMENTO', CdCP_CabDUP_SERIE.Value);
            QInsCPCab.SetVariable('COD_FINALIDADE', 2);
            QInsCPCab.SetVariable('COD_CONTA_PAGAR_CAB', wCP);
            QInsCPCab.SetVariable('IND_ACEITE', 'S');
            try
              QInsCPCab.ExecSQL;
            except
              on e: Exception do
                MessageDlg(e.Message + #13 + #10 + CdCP_CabDUP_NUM.value, mtError, [mbOK], 0);
            end;

            QInsCPMov.Close;
            QInsCPMov.SetVariable('COD_CONTA_PAGAR_MOV', DMOracle.Sequencia('CONTA_PAGAR_MOV'));
            QInsCPMov.SetVariable('COD_CONTA_PAGAR_CAB', wCP);
            QInsCPMov.SetVariable('DT_MOVIMENTO', CdCP_CabDUP_EMI.Value);
            QInsCPMov.SetVariable('VAL_MOVIMENTO', CdCP_CabDUP_VLR.Value);
            QInsCPMov.SetVariable('COD_USUARIO', 1);
            QInsCPMov.SetVariable('DT_USUARIO', Date);
            QInsCPMov.SetVariable('IND_TIPO_MOVIMENTO', 'PRINCIPAL');
            QInsCPMov.ExecSQL;

            if CdCP_CabDUP_RECEB.Value = 'B' then
            begin
              QInsCPMov.Close;
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_MOV', DMOracle.Sequencia('CONTA_PAGAR_MOV'));
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_CAB', wCP);
              QInsCPMov.SetVariable('DT_MOVIMENTO', CdCP_CabDUP_DTPGTO.Value);
              QInsCPMov.SetVariable('VAL_MOVIMENTO', CdCP_CabDUP_VLR.Value);
              QInsCPMov.SetVariable('COD_USUARIO', 1);
              QInsCPMov.SetVariable('DT_USUARIO', Date);
              QInsCPMov.SetVariable('IND_TIPO_MOVIMENTO', 'PGTO. PRINCIPAL');
              QInsCPMov.ExecSQL;
            end;
            if CdCP_CabDUP_DESC.Value > 0 then
            begin
              QInsCPMov.Close;
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_MOV', DMOracle.Sequencia('CONTA_PAGAR_MOV'));
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_CAB', wCP);
              QInsCPMov.SetVariable('DT_MOVIMENTO', CdCP_CabDUP_DTPGTO.Value);
              QInsCPMov.SetVariable('VAL_MOVIMENTO', CdCP_CabDUP_DESC.Value);
              QInsCPMov.SetVariable('COD_USUARIO', 1);
              QInsCPMov.SetVariable('DT_USUARIO', Date);
              QInsCPMov.SetVariable('IND_TIPO_MOVIMENTO', 'DESCONTO');
              QInsCPMov.ExecSQL;
            end;
            if CdCP_CabDUP_VLJ.Value > 0 then
            begin
              QInsCPMov.Close;
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_MOV', DMOracle.Sequencia('CONTA_PAGAR_MOV'));
              QInsCPMov.SetVariable('COD_CONTA_PAGAR_CAB', wCP);
              QInsCPMov.SetVariable('DT_MOVIMENTO', CdCP_CabDUP_DTPGTO.Value);
              QInsCPMov.SetVariable('VAL_MOVIMENTO', CdCP_CabDUP_VLJ.Value);
              QInsCPMov.SetVariable('COD_USUARIO', 1);
              QInsCPMov.SetVariable('DT_USUARIO', Date);
              QInsCPMov.SetVariable('IND_TIPO_MOVIMENTO', 'PGTO. JUROS');
              QInsCPMov.ExecSQL;
            end;
          end
          else
            MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - wCadString = VAZIO');
        end
        else
          MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - DUP_FOR <= 0');
      except
        on e: Exception do
        begin
          MCP.Lines.Add(CdCP_CabDUP_NUM.Value + ' - ERRO (' + e.Message + ')');
          Inc(wRegNaoImp);
        end;
      end;
      Inc(wCont);
      Inc(wContCommit);
      if wContCommit > 2000 then
      begin
        wContCommit := 0;
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCEmapa.StartTransaction;
      end;
      PB.Position := wCont;
      CdCP_Cab.Next;
    end;
    if (wRegNaoImp = 0) or
      (MessageDlg(FloatToStr(wRegNaoImp) + ' registros não puderam ser importados.'
      + Chr(13) + ' Importar os outros registros mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
      DMOracle.DBCEmapa.Commit
    else
      DMOracle.DBCemapa.RollBack;
    MEImp.Text := FloatToStr(wCont - wRegNaoImp);
    MENaoImp.Text := FloatToStr(wRegNaoImp);
  end;
  PB.Position := 0;
end;

end.
